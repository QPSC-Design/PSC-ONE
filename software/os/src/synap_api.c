
#include "synap_api.h"
#include "kernel.h"
#include "common.h"

// ============================================================
// SA parameter
// ============================================================
//#define SA_MAT_MAX    16

// ============================================================
// CSR Write Helper
// ============================================================
#define CSR_WRITE(csr, val) \
    __asm__ volatile ("csrw " #csr ", %0" :: "r"(val))

// ============================================================
// CSR Read Helper
// ============================================================
#define CSR_READ(csr) ({ \
    uint32_t val; \
    __asm__ volatile ("csrr %0, " #csr : "=r"(val)); \
    val; \
})

// ============================================================
// Small delay (簡易ウェイト)
// ============================================================
#if 0
static inline void tiny_delay(unsigned n){
    while (n--) {
        __asm__ volatile("nop");
    }
}
#endif


// ============================================================
// グローバル変数
// ============================================================

// ============================================================
// SA Result Read
// ============================================================
//
// SA結果メモリ構造
// 32bit word layout
//
// row-major 形式に復元
//
//   out[0] = C00
//   out[1] = C01
//   out[2] = C10
//   out[3] = C11
//
// ============================================================
static inline void sa_read(uint32_t out[2][2])
{
    volatile uint32_t* base = (uint32_t*)PSC_SA_ADDR_C;

    uint32_t v0 = base[0];
    uint32_t v1 = base[1];
    uint32_t v2 = base[2];
    uint32_t v3 = base[3];

    out[0][0] = (uint32_t)(v0);
    out[0][1] = (uint32_t)(v1);
    out[1][0] = (uint32_t)(v2);
    out[1][1] = (uint32_t)(v3);
}

// ============================================================
// Matrix Write Helper
// ============================================================
//
// 2×2 行列を SA入力レジスタへ書き込み
//
// SA入力フォーマット
//
//   32bit = {16'd0 , B(8bit) , A(8bit)}
//
// ビット配置
//
//   [31:16] = 0
//   [15:8 ] = B
//   [7 :0 ] = A
//
// ============================================================
static inline void sa_write_matrix2(
    const uint8_t mat[2][2],
    volatile uint32_t* const REG[2])
{
    for (int i = 0; i < 2; i++) {

        uint16_t A = (uint16_t)(mat[i][0] & 0xFF);
        uint16_t B = (uint16_t)(mat[i][1] & 0xFF);

        uint32_t packed =
            ((uint32_t)B << 8) |
             (uint32_t)A;

        *REG[i] = packed;
    }
}


// ============================================================
// Write Matrix A
// ============================================================
//
// A matrix MMIO
//
//   0x020000
//   0x020004
//
// ============================================================
#if 1
static inline void sa_write_A(const uint8_t A_mat[2][2])
{
    volatile uint32_t* const REG_A[2] = {
        (volatile uint32_t*)(PSC_SA_ADDR_A),
        (volatile uint32_t*)(PSC_SA_ADDR_A + 4u)
    };

    sa_write_matrix2(A_mat, REG_A);
}


// ============================================================
// Write Matrix B
// ============================================================
//
// B matrix MMIO
//
//   0x020010
//   0x020014
//
// ============================================================
static inline void sa_write_B(const uint8_t B_mat[2][2])
{
    volatile uint32_t* const REG_B[2] = {
        (volatile uint32_t*)(PSC_SA_ADDR_B),
        (volatile uint32_t*)(PSC_SA_ADDR_B + 4u)
    };

    sa_write_matrix2(B_mat, REG_B);
}
#endif 

// ============================================================
// Force Cache Write Back
// ============================================================
//
// キャッシュに残ったデータをWBさせるため
// 別アドレス領域をREADして eviction を発生させる
//
// ============================================================
#if 0
bool sa_write_matrix_and_wb()
{
    volatile uint32_t* const REGd[6] = {
        (volatile uint32_t*)(0x030000u),
        (volatile uint32_t*)(0x030004u),
        (volatile uint32_t*)(0x030010u),
        (volatile uint32_t*)(0x030014u),
        (volatile uint32_t*)(0x030020u),
        (volatile uint32_t*)(0x030024u)
    };

    for (int i = 0; i < 6; i++) {
        uint32_t val = *REGd[i];

        if (val != 0x0000) {
            return false;
        }
    }

    return true;
}
#endif

// ============================================================
// ブロック抽出
// ============================================================
static inline void load_A(uint8_t out[2][2], int bi, int bk, const uint8_t *in_A, int N)
{
    for (int i = 0; i < 2; i++)
        for (int j = 0; j < 2; j++)
            //out[i][j] = in_A[bi*2+i][bk*2+j];
            out[i][j] = in_A[(bi*2+i)*N + (bk*2+j)];
}

static inline void load_B(uint8_t out[2][2], int bk, int bj, const uint8_t *in_B, int N)
{
    for (int i = 0; i < 2; i++)
        for (int j = 0; j < 2; j++)
            //out[i][j] = in_B[bk*2+i][bj*2+j];
            out[i][j] = in_B[(bk*2+i)*N + (bj*2+j)];
}

// SA API本体
void sa_run(const uint8_t *in_A, const uint8_t *in_B, const uint8_t Matrix_N, uint32_t *out_C)
{
    // --------------------------------------------------------
    // 0. SA_ADDR_A,B,C設定
    // --------------------------------------------------------
    // csr_SA_ADDR_A,B
    CSR_WRITE(0x7D0, PSC_SA_ADDR_A);
    CSR_WRITE(0x7D4, PSC_SA_ADDR_B);
    // csr_SA_ADDR_C
    CSR_WRITE(0x7D8, PSC_SA_ADDR_C);

    // -------- SA へ書き込み配列 ----------
    uint8_t A_sa[2][2];
    uint8_t B_sa[2][2];
    uint32_t C_sa[2][2];
#if 0
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            A_sa[i][j] = 2;
            B_sa[i][j] = 1;
        }
    }
#endif
    // -------- SA へ書き込み --------
    //bool wb;
    //sa_write_A(A_sa);
    //sa_write_B(B_sa);
    //wb = sa_write_matrix_and_wb();

    // -------- SA 実行 --------
    // sa_reset
    CSR_WRITE(0x7C0, 0x02);
    CSR_WRITE(0x7C0, 0x00);
    // sa_mode : OS mode.
    CSR_WRITE(0x7C4, 0x01);

    //uint32_t (*out2D)[Matrix_N] = (uint32_t (*)[Matrix_N])out_C;

    for (int bi = 0; bi < Matrix_N/2; bi++) {
        for (int bj = 0; bj < Matrix_N/2; bj++) {

            // sa_clear:bit[2]
            CSR_WRITE(0x7C0, 0x04);
            CSR_WRITE(0x7C0, 0x00);

            // ------------------------------------------------
            // k方向 x回（accumulate）
            // ------------------------------------------------
            for (int bk = 0; bk < Matrix_N/2; bk++) {

                // A,B set.
                load_A(A_sa, bi, bk, in_A, Matrix_N);
                load_B(B_sa, bk, bj, in_B, Matrix_N);

                #if 0
                s_print_int(A_sa[0][0]);
                putchar('\n');
                s_print_int(A_sa[0][1]);
                putchar('\n');
                s_print_int(A_sa[1][0]);
                putchar('\n');
                s_print_int(A_sa[1][1]);
                putchar('\n');
                putchar('\n');
                #endif

                sa_write_A(A_sa);
                sa_write_B(B_sa);

                // sa_reset:bit[1]
                CSR_WRITE(0x7C0, (0x02));
                CSR_WRITE(0x7C0, (0x00));
                // start:bit[0]
                if (bk == Matrix_N/2 - 1) {
                    CSR_WRITE(0x7C0, (0x08 | 0x01));
                    CSR_WRITE(0x7C0, (0x08 | 0x00));
                } else {
                    CSR_WRITE(0x7C0, 0x01);
                    CSR_WRITE(0x7C0, 0x00);
                }

                // wait 
                //tiny_delay(100);

                // 0x7C8 = csr_SA_STATUS
                while ((CSR_READ(0x7C8) & 0x01) != 0x01) {
                    __asm__ volatile("nop");
                }
            }

            //tiny_delay(10);
            
            // -------- SA 出力取得 --------
            sa_read(C_sa);

            // -------- out[4] に格納 --------
            for (int mi = 0; mi < 2; mi++) {
                for (int mj = 0; mj < 2; mj++) {
                    //out2D[bi*2+mi][bj*2+mj] = C_sa[mi][mj];
                    out_C[(bi*2+mi)*Matrix_N + (bj*2+mj)] = C_sa[mi][mj];
                    //s_print_int((int)C_sa[mi][mj]);
                    //putchar('\n');
                }
            }
        }
    }
}

// -------------------------------------------------------
static uint32_t lfsr;

uint32_t rand32()
{
    if (lfsr == 0) lfsr = 143253719;

    lfsr ^= lfsr << 13;
    lfsr ^= lfsr >> 17;
    lfsr ^= lfsr << 5;
    return lfsr;
}

// -------------------------------------------------------
// SA実行関数
void s_call_sa_api(const uint8_t matrix_N)
{
    static uint8_t  A_mat[SA_MAT_MAX][SA_MAT_MAX];
    static uint8_t  B_mat[SA_MAT_MAX][SA_MAT_MAX];
    static uint32_t C_mat[SA_MAT_MAX][SA_MAT_MAX];

    for (int i = 0; i < SA_MAT_MAX; i++) {
        for (int j = 0; j < SA_MAT_MAX; j++) {
            //A_mat[i][j] = (uint8_t)(rand32() % 64);
            //B_mat[i][j] = (uint8_t)(rand32() % 64);
            A_mat[i][j] = (uint8_t)(3*i + 2*j);
            B_mat[i][j] = (uint8_t)(3*i + j + 5);
        }
    }

    /*
    A_mat[0][0] = 1;
    A_mat[2][3] = 2;
    A_mat[5][3] = 0;
    A_mat[0][0] = 3;
    */

#if 1
    // ---- A,B表示 ----
    for (int i = 0; i < matrix_N; i++) {
        for (int j = 0; j < matrix_N; j++) {
            s_print_int((int)A_mat[i][j]);
            putchar(' ');
        }
        putchar('\n');
    }
    putchar('\n');
    
    for (int i = 0; i < matrix_N; i++) {
        for (int j = 0; j < matrix_N; j++) {
            s_print_int((int)B_mat[i][j]);
            putchar(' ');
        }
        putchar('\n');
    }
    putchar('\n');
#endif

    //static uint32_t mat_C[(SA_MAT_MAX * SA_MAT_MAX)];

#if 1
    s_printf("sa_run start.\n");
    sa_run(
        &A_mat[0][0],
        &B_mat[0][0],
        matrix_N,
        &C_mat[0][0]
    );
    s_printf("sa_run end.\n\n");
#endif

    // ---- 結果表示 ----
    for (int i = 0; i < matrix_N; i++) {
        for (int j = 0; j < matrix_N; j++) {
            s_print_int((int)C_mat[i][j]);
            putchar(' ');
        }
        putchar('\n');
    }
    putchar('\n');
}