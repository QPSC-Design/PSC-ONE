#include <cstdint>

// ============================================================
// SynapEngine CSR
// ============================================================
// CSR 0x7C0 : SA Control
// CSR 0x7C4 : SA Status
// ============================================================


// ============================================================
// PIO (テスト用デバッグ出力)
// ============================================================
// PIO32 に書くと cocotb 側でログに出力される
// ============================================================
#define PIO32          (*reinterpret_cast<volatile uint32_t*>(0x10001000u))
#define BASE_ADDR      (*reinterpret_cast<volatile uint32_t*>(0x00020000u))

static constexpr uint32_t TEST_END_CODE = 0xEE01;


// ============================================================
// CSR Write Helper
// ============================================================
#define CSR_WRITE(csr, val) \
    asm volatile ("csrw " #csr ", %0" :: "r"(val))

// ============================================================
// CSR Read Helper
// ============================================================
#define CSR_READ(csr) \
    ([&]() -> uint32_t { \
        uint32_t val; \
        asm volatile ("csrr %0, " #csr : "=r"(val)); \
        return val; \
    }())

// ============================================================
// Small delay (簡易ウェイト)
// ============================================================
static inline void tiny_delay(unsigned n){
    while (n--) {
        asm volatile("nop");
    }
}

// ============================================================
// SA Result Read
// ============================================================
//
// SA結果メモリ構造
//
// 0x020020 : {C01 , C00}
// 0x020024 : {C11 , C10}
//
// 32bit word layout
//
//   [31:16] = 左要素
//   [15:0 ] = 右要素
//
// row-major 形式に復元
//
//   out[0] = C00
//   out[1] = C01
//   out[2] = C10
//   out[3] = C11
//
// ============================================================
static inline void sa_read_result_matrix(uint16_t out[4])
{
    volatile uint32_t* const RESULT_REG[4] = {
        reinterpret_cast<volatile uint32_t*>(0x020800),
        reinterpret_cast<volatile uint32_t*>(0x020804),
        reinterpret_cast<volatile uint32_t*>(0x020808),
        reinterpret_cast<volatile uint32_t*>(0x02080C)
    };

    for (int i = 0; i < 4; i++) {
        uint32_t val32 = *RESULT_REG[i];
        out[i] = (uint16_t)(val32 & 0xFFFF);
    }
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
static inline void sa_write_A(const uint8_t A_mat[2][2])
{
    volatile uint32_t* const REG_A[2] = {
        reinterpret_cast<volatile uint32_t*>(0x020000),
        reinterpret_cast<volatile uint32_t*>(0x020004)
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
        reinterpret_cast<volatile uint32_t*>(0x020400),
        reinterpret_cast<volatile uint32_t*>(0x020404)
    };

    sa_write_matrix2(B_mat, REG_B);
}

// ============================================================
// Software Reference Matrix Multiply
// ============================================================
//
// 2×2 行列積
//
// ============================================================
static inline void matmul2x2_sw(
    const uint8_t A[2][2],
    const uint8_t B[2][2],
    uint16_t Csw[2][2])
{
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {

            int sum = 0;

            for (int k = 0; k < 2; k++) {
                sum += (int)A[i][k] * (int)B[k][j];
            }

            Csw[i][j] = (uint16_t)sum;
        }
    }
}


// ============================================================
// SA Result Verification
// ============================================================
//
// SW計算結果とSA結果を比較
//
// ============================================================
static inline bool verify_sa_result(
    const uint16_t Csw[2][2],
    const uint16_t Csa[4])
{
    uint32_t err_code;

    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {

            uint16_t v_sw = Csw[i][j];
            uint16_t v_sa = Csa[i * 2 + j];

            if (v_sw != v_sa) {
                err_code = 0xDEAD0000 | (uint32_t)(i * 2 + j);
                PIO32 = err_code;
                return false;
            }
        }
    }

    return true;
}

/* ============================================================
      テスト用 A / B 行列
   ============================================================ */
static const uint8_t A_mat[2][2] = {
    {1, 2},
    {3, 3}
};

static const uint8_t B_mat[2][2] = {
    {2, 3},
    {1, 4}
};

// ============================================================
// Test Entry
// ============================================================
//
// テストフロー
//
// 1. SA入力行列を書き込み
// 2. キャッシュWriteBackを強制
// 3. Softwareで行列積を計算（正解データ）
// 4. SAを開始
// 5. SA結果を読み出し
// 6. SW結果と比較
//
// ============================================================
extern "C" void run() {

    //bool wb;

    // --------------------------------------------------------
    // 0. SA_ADDR_A,B,C設定
    // --------------------------------------------------------
    // csr_SA_ADDR_A,B
    CSR_WRITE(0x07D0, 0x020000);
    CSR_WRITE(0x07D4, 0x020400);
    // csr_SA_ADDR_C
    CSR_WRITE(0x07D8, 0x020800);

    // --------------------------------------------------------
    // 1. SA入力行列を書き込み
    // --------------------------------------------------------
    sa_write_A(A_mat);
    sa_write_B(B_mat);

    // --------------------------------------------------------
    // 2. キャッシュWBを強制
    // --------------------------------------------------------
    //wb = sa_write_matrix_and_wb();

    // --------------------------------------------------------
    // 3. Software参照計算
    // --------------------------------------------------------
    uint16_t Csw[2][2];
    matmul2x2_sw(A_mat, B_mat, Csw);

    // SW結果をPIOへ出力（デバッグ用）
    for (uint32_t i = 0; i < 2; i++) {
        for (uint32_t j = 0; j < 2; j++) {
            PIO32 = (uint32_t)Csw[i][j];
        }
    }

    // --------------------------------------------------------
    // 4. SA開始
    // --------------------------------------------------------
    // sa_reset
    CSR_WRITE(0x7C0, 0x02);
    CSR_WRITE(0x7C0, 0x00);
    // sa_mode : OS mode.
    CSR_WRITE(0x7C4, 0x01);
    // sa_start
    CSR_WRITE(0x7C0, (0x08 | 0x01));   // SA start
    CSR_WRITE(0x7C0, (0x08 | 0x00));   // clear start

    // SA計算待ち
    //tiny_delay(100);

    // 0x7C8 = csr_SA_STATUS
    while ((CSR_READ(0x7C8) & 0x01) != 0x01) {
        asm volatile("nop");
    }

    // --------------------------------------------------------
    // 5. SA結果読み出し
    // --------------------------------------------------------
    uint16_t Csa[4];
    sa_read_result_matrix(Csa);

    PIO32 = 0xEE33;

    // SA結果をPIOへ出力
    for (uint32_t i = 0; i < 4; i++) {
        PIO32 = (uint32_t)Csa[i];
    }

    // --------------------------------------------------------
    // 6. 結果検証
    // --------------------------------------------------------
    PIO32 = 0xEE44;

    bool ok = verify_sa_result(Csw, Csa);

    // --------------------------------------------------------
    // テスト終了通知
    // --------------------------------------------------------
    //if (ok && wb) {
    if (ok) {
        PIO32 = TEST_END_CODE;
        PIO32 = 0xBEEF;   // PASS
    } else {
        PIO32 = TEST_END_CODE;
        PIO32 = 0xDEAD;   // FAIL
    }

    // --------------------------------------------------------
    // CPU停止
    // --------------------------------------------------------
    while (1) { }
}