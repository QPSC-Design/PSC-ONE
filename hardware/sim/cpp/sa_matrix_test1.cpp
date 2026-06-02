#include <cstdint>

// ============================================================
// CSR / MMIO
// ============================================================
#define SA_BASE_ADDR_A 0x020000
#define SA_BASE_ADDR_B 0x024000
#define SA_BASE_ADDR_C 0x028000

#define PIO32 (*reinterpret_cast<volatile uint32_t*>(0x10001000u))
static constexpr uint32_t TEST_END_CODE = 0xEE01;

#define CSR_WRITE(csr, val) \
    asm volatile ("csrw " #csr ", %0" :: "r"(val))

#define CSR_READ(csr) \
    ([&]() -> uint32_t { \
        uint32_t val; \
        asm volatile ("csrr %0, " #csr : "=r"(val)); \
        return val; \
    }())

// ============================================================
// 行列
// ============================================================
#define SA_MAT_SIZEX    2
#define SA_MAT_SIZEY    2

static uint8_t  A_mat[SA_MAT_SIZEX][SA_MAT_SIZEY];
static uint8_t  B_mat[SA_MAT_SIZEX][SA_MAT_SIZEY];
static uint32_t C_mat[SA_MAT_SIZEX][SA_MAT_SIZEY];

static uint32_t ref[SA_MAT_SIZEX][SA_MAT_SIZEY];

// ============================================================
// SA I/O
// ============================================================
static inline void sa_write_matrix2(
    const uint8_t mat[2][2],
    volatile uint32_t* const REG[2])
{
    for (int i = 0; i < 2; i++) {
        uint32_t packed =
            ((uint32_t)(mat[i][1] & 0xFF) << 8) |
             (uint32_t)(mat[i][0] & 0xFF);
        *REG[i] = packed;
    }
}

static inline void sa_write_A(const uint8_t A[2][2])
{
    volatile uint32_t* REG[2] = {
        (uint32_t*)SA_BASE_ADDR_A,
        (uint32_t*)(SA_BASE_ADDR_A + 4)
    };
    sa_write_matrix2(A, REG);
}

static inline void sa_write_B(const uint8_t B[2][2])
{
    volatile uint32_t* REG[2] = {
        (uint32_t*)SA_BASE_ADDR_B,
        (uint32_t*)(SA_BASE_ADDR_B + 4)
    };
    sa_write_matrix2(B, REG);
}

static inline void sa_read(uint32_t out[2][2])
{
    volatile uint32_t* base = (uint32_t*)SA_BASE_ADDR_C;

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
// ブロック抽出
// ============================================================
static inline void load_A(uint8_t out[2][2], int bi, int bk)
{
    //PIO32 = 0xAB01;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            out[i][j] = A_mat[bi*2+i][bk*2+j];
            //PIO32 = (uint32_t)out[i][j];
        }
    }
    //PIO32 = 0xABE1;
}

static inline void load_B(uint8_t out[2][2], int bk, int bj)
{
    //PIO32 = 0xBC01;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            out[i][j] = B_mat[bk*2+i][bj*2+j];
            //PIO32 = (uint32_t)out[i][j];
        }
    }
    //PIO32 = 0xBE01;
}

// ============================================================
// n x m 行列積（Output Stationary版）
// ============================================================
static void matmul_os()
{
    uint8_t Ab[2][2];
    uint8_t Bb[2][2];
    uint32_t Cout[2][2];

    // sa_reset: bit[1]
    CSR_WRITE(0x7C0, 0x02);
    CSR_WRITE(0x7C0, 0x00);
    // sa_mode : OS mode.
    CSR_WRITE(0x7C4, 0x01);

    for (int bi = 0; bi < SA_MAT_SIZEX/2; bi++) {
        //PIO32 = 0xEE00;
        PIO32 = (uint32_t)bi;

        for (int bj = 0; bj < SA_MAT_SIZEY/2; bj++) {

            // sa_clear:bit[2]
            CSR_WRITE(0x7C0, 0x04);
            CSR_WRITE(0x7C0, 0x00);

            //PIO32 = 0xEE10;
            //PIO32 = (uint32_t)bj;

            // ------------------------------------------------
            // k方向 x回（accumulate）
            // ------------------------------------------------
            for (int bk = 0; bk < SA_MAT_SIZEX/2; bk++) {

                load_A(Ab, bi, bk);
                load_B(Bb, bk, bj);

                sa_write_A(Ab);
                sa_write_B(Bb);

                // sa_reset:bit[1]
                CSR_WRITE(0x7C0, (0x02));
                CSR_WRITE(0x7C0, (0x00));
                // start:bit[0]
                if (bk == SA_MAT_SIZEX/2 - 1) {
                    CSR_WRITE(0x7C0, (0x08 | 0x01));
                    CSR_WRITE(0x7C0, (0x08 | 0x00));
                } else {
                    CSR_WRITE(0x7C0, 0x01);
                    CSR_WRITE(0x7C0, 0x00);
                }

                while ((CSR_READ(0x7C8) & 1) == 0);
            }

            // ------------------------------------------------
            // ★ 最後に1回だけ読む
            // ------------------------------------------------
            sa_read(Cout);

            //PIO32 = 0xEC01;

            for (int i = 0; i < 2; i++) {
                for (int j = 0; j < 2; j++) {
                    C_mat[bi*2+i][bj*2+j] = Cout[i][j];
#if 1
                    PIO32 = (uint32_t)Ab[i][j];
                    PIO32 = (uint32_t)Bb[i][j];
                    PIO32 = (uint32_t)Cout[i][j];
#endif
                }
            }
        }
    }
    // Log.
    PIO32 = 0xEEA1;
}

// ============================================================
// SW検証
// ============================================================
static void matmul_sw(uint32_t out[SA_MAT_SIZEX][SA_MAT_SIZEY])
{
    for (int i = 0; i < SA_MAT_SIZEX; i++) {
        PIO32 = (uint32_t)i;
        for (int j = 0; j < SA_MAT_SIZEY; j++) {
            int sum = 0;
            for (int k = 0; k < SA_MAT_SIZEY; k++)
                sum += (int)A_mat[i][k] * (int)B_mat[k][j];
            out[i][j] = (uint32_t)sum;
            // Log.
            //PIO32 = (uint32_t)A_mat[i][j];
            //PIO32 = (uint32_t)B_mat[i][j];
            //PIO32 = (uint32_t)out[i][j];
        }
    }
    
    PIO32 = 0xEEB1;
}

// ============================================================
// 初期化
// ============================================================
static void init_matrix()
{
    for (int i = 0; i < SA_MAT_SIZEX; i++)
        for (int j = 0; j < SA_MAT_SIZEY; j++) {
            //A_mat[i][j] = (uint8_t)(i + j) & 0xFF;
            //B_mat[i][j] = (uint8_t)(i * j) & 0xFF;
            A_mat[i][j] = (uint8_t)(i + j) & 0xFF;
            B_mat[i][j] = (uint8_t)(i + j) & 0xFF;
            //B_mat[i][j] = (uint8_t)(i % 16) & 0xFF;
            //PIO32 = (uint32_t)A_mat[i][j];
            //PIO32 = (uint32_t)B_mat[i][j];
        }

    A_mat[0][0] = 2;
    A_mat[0][1] = 3;
    B_mat[2][0] = 4;
}

// ============================================================
// Entry
// ============================================================
extern "C" void run()
{
    CSR_WRITE(0x07D0, SA_BASE_ADDR_A);
    CSR_WRITE(0x07D4, SA_BASE_ADDR_B);
    CSR_WRITE(0x07D8, SA_BASE_ADDR_C);

    init_matrix();

    matmul_os();

    matmul_sw(ref);

#if 0
    for (int i = 0; i < SA_MAT_SIZEX; i++) {
        for (int j = 0; j < SA_MAT_SIZEY; j++) {
            PIO32 = (uint32_t)C_mat[i][j];
            PIO32 = (uint32_t)ref[i][j];
        }
    }
#endif

    bool ok = true;

#if 1
    PIO32 = 0xAB05;
    uint32_t log_32;

    for (int i = 0; i < SA_MAT_SIZEX; i++) {
        for (int j = 0; j < SA_MAT_SIZEY; j++) {
#if 0
            PIO32 = (uint32_t)C_mat[i][j];
            PIO32 = (uint32_t)ref[i][j];
#endif
            if (C_mat[i][j] != ref[i][j]) {
                log_32 = 0xDEAD0000 | ((uint16_t)i<<8) | (uint16_t)j;
                PIO32 = log_32;
                ok = false;
            }
        }
    }
#endif

    if (ok) {
        PIO32 = TEST_END_CODE;
        PIO32 = 0xBEEF;   // PASS
    } else {
        PIO32 = TEST_END_CODE;
        PIO32 = 0xDEAD;   // FAIL
    }

    while (1);
}