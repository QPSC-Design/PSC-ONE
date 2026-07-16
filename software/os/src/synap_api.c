
#include "synap_api.h"
#include "kernel.h"
#include "common.h"

// ============================================================
// SA parameter
// ============================================================
//synap_api.h
//#define SA_MAT_MAX    16

// ============================================================
// CSR Helper
// ============================================================
#define STRINGIFY_INNER(x) #x
#define STRINGIFY(x) STRINGIFY_INNER(x)

#define CSR_WRITE(csr, val)                           \
    do {                                              \
        const uint32_t csr_value_ = (uint32_t)(val); \
        __asm__ volatile (                            \
            "csrw " STRINGIFY(csr) ", %0"             \
            :                                         \
            : "r"(csr_value_)                         \
            : "memory"                                \
        );                                            \
    } while (0)

#define CSR_READ(csr)                                 \
    ({                                                \
        uint32_t csr_value_;                          \
        __asm__ volatile (                            \
            "csrr %0, " STRINGIFY(csr)                \
            : "=r"(csr_value_)                        \
            :                                         \
            : "memory"                                \
        );                                            \
        csr_value_;                                   \
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
static inline void sa_read(uint32_t out[4][4])
{
    volatile const uint32_t *const base =
        (volatile const uint32_t *)PSC_SA_ADDR_C;

    for (int i = 0; i < 4; ++i) {
        for (int j = 0; j < 4; ++j) {
            out[i][j] = base[i * 4 + j];
        }
    }
}

// ============================================================
// Matrix Write Helper
// ============================================================
static inline void sa_write_A(const uint8_t A[4][4])
{
    const uintptr_t addr_a = (uintptr_t)&A[0][0];

    CSR_WRITE(CSR_SA_ADDR_A, addr_a);
}

static inline void sa_write_B(const uint8_t B[4][4])
{
    const uintptr_t addr_b = (uintptr_t)&B[0][0];

    CSR_WRITE(CSR_SA_ADDR_B, addr_b);
}

// ============================================================
// ブロック抽出
// ============================================================
static inline void load_A(
    uint8_t out[4][4],
    const uint8_t *in_A,
    int bi,
    int bk)
{
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            out[i][j] =
                in_A[
                    (bi * 4 + i) * SA_MAT_MAX +
                    (bk * 4 + j)
                ];
        }
    }
}

static inline void load_B(
    uint8_t out[4][4],
    const uint8_t *in_B,
    int bk,
    int bj)
{
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            out[i][j] =
                in_B[
                    (bk * 4 + i) * SA_MAT_MAX +
                    (bj * 4 + j)
                ];
        }
    }
}

// ============================================================
// SA API本体
// ============================================================
void sa_run(const uint8_t *in_A, const uint8_t *in_B, const uint8_t Matrix_N, uint32_t *out_C)
{
    // --------------------------------------------------------
    // 0. SA_ADDR_A,B,C設定
    // --------------------------------------------------------
    // csr_SA_ADDR_A,B
    CSR_WRITE(CSR_SA_ADDR_A, PSC_SA_ADDR_A);
    CSR_WRITE(CSR_SA_ADDR_B, PSC_SA_ADDR_B);
    // csr_SA_ADDR_C
    CSR_WRITE(CSR_SA_ADDR_C, PSC_SA_ADDR_C);

    // -------- SA へ書き込み配列 ----------
    uint8_t  A_sa[4][4];
    uint8_t  B_sa[4][4];
    uint32_t C_sa[4][4];
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
    // sa_state_reset
    CSR_WRITE(CSR_SA_CTRL, 0x02);
    CSR_WRITE(CSR_SA_CTRL, 0x00);

    // sa_clear:bit[2]
    CSR_WRITE(CSR_SA_CTRL, 0x04);
    CSR_WRITE(CSR_SA_CTRL, 0x00);

    // sa_mode : OS mode.
    //CSR_WRITE(0x7C4, 0x01);

    //uint32_t (*out2D)[Matrix_N] = (uint32_t (*)[Matrix_N])out_C;

    for (int bi = 0; bi < Matrix_N/4; bi++) {
        for (int bj = 0; bj < Matrix_N/4; bj++) {

            // sa_clear:bit[2]
            CSR_WRITE(CSR_SA_CTRL, 0x04);
            CSR_WRITE(CSR_SA_CTRL, 0x00);

            // ------------------------------------------------
            // k方向 x回（accumulate）
            // ------------------------------------------------
            for (int bk = 0; bk < Matrix_N/4; bk++) {

                load_A(A_sa, in_A, bi, bk);
                load_B(B_sa, in_B, bk, bj);

                sa_write_A(A_sa);
                sa_write_B(B_sa);

                // sa_state_reset:bit[1]
                CSR_WRITE(CSR_SA_CTRL, (0x02));
                CSR_WRITE(CSR_SA_CTRL, (0x00));

                // start:bit[0]
                CSR_WRITE(CSR_SA_CTRL, 0x01);
                CSR_WRITE(CSR_SA_CTRL, 0x00);

                // wait 
                //tiny_delay(100);

                // 0x7C8 = csr_SA_STATUS
                while ((CSR_READ(CSR_SA_STATUS) & 0x02) == 0x02) {
                    __asm__ volatile("nop");
                }
            }

            //tiny_delay(10);
            
            // -------- SA 出力取得 --------
            sa_read(C_sa);

            // -------- out[16] に格納 --------
            for (int mi = 0; mi < 4; mi++) {
                for (int mj = 0; mj < 4; mj++) {
                    //out2D[bi*2+mi][bj*2+mj] = C_sa[mi][mj];
                    out_C[(bi*4 + mi)*SA_MAT_MAX + (bj*4 + mj)] = C_sa[mi][mj];
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
// -------------------------------------------------------
// SA実行関数
void s_call_sa_api(const uint8_t matrix_N, bool verify)
{
    static uint8_t  A_mat[SA_MAT_MAX][SA_MAT_MAX];
    static uint8_t  B_mat[SA_MAT_MAX][SA_MAT_MAX];
    static uint32_t C_mat[SA_MAT_MAX][SA_MAT_MAX];
    static uint32_t C_ref[SA_MAT_MAX][SA_MAT_MAX];

    for (int i = 0; i < matrix_N; i++) {
        for (int j = 0; j < matrix_N; j++) {
            A_mat[i][j] = (uint8_t)(rand32() & 0x0F);
            B_mat[i][j] = (uint8_t)(rand32() & 0x0F);
            C_mat[i][j] = 0;
            C_ref[i][j] = 0;
        }
    }

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

    // ---- CPU reference: C_ref = A * B ----
    for (int i = 0; i < matrix_N; i++) {
        for (int j = 0; j < matrix_N; j++) {
            uint32_t sum = 0;
            for (int k = 0; k < matrix_N; k++) {
                sum += (uint32_t)A_mat[i][k] * (uint32_t)B_mat[k][j];
            }
            C_ref[i][j] = sum;
        }
    }

    s_printf("sa_run start.\n");
    sa_run(
        &A_mat[0][0],
        &B_mat[0][0],
        matrix_N,
        &C_mat[0][0]
    );
    s_printf("sa_run end.\n\n");

    // ---- 結果表示 ----
    for (int i = 0; i < matrix_N; i++) {
        for (int j = 0; j < matrix_N; j++) {
            s_print_int((int)C_mat[i][j]);
            putchar(' ');
        }
        putchar('\n');
    }
    putchar('\n');

    // ---- Verify ----
    if (verify == true) {
        int err = 0;
        for (int i = 0; i < matrix_N; i++) {
            for (int j = 0; j < matrix_N; j++) {
                if (C_mat[i][j] != C_ref[i][j]) {
                    s_printf("SA NG i=%d j=%d sa=%x cpu=%x\n",
                            i, j, C_mat[i][j], C_ref[i][j]);
                    err++;
                }
            }
        }

        if (err == 0) {
            s_printf("SA VERIFY OK\n");
        } else {
            s_printf("SA VERIFY NG err=%d\n", err);
        }
    }

    putchar('\n');
}