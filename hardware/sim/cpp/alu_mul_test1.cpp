#include <cstdint>

/* ---------- PIO ---------- */
#define PIO32 (*reinterpret_cast<volatile uint32_t*>(0x10001000u))
static constexpr uint32_t TEST_END_CODE = 0xEE01;

/* ---------- result ---------- */
extern "C" volatile uint32_t result;

/* ---------- テストパターン ---------- */
static const int32_t test_vals[] = {
    0,
    1,
    -1,
    2,
    -2,
    3,
    -3,

    4,
    -4,
    8,
    -8,
    16,
    -16,

    0x7FFF,
    -0x7FFF,

    0x00010000,
    (int32_t)0xFFFF0000u,

    0x40000000,
    (int32_t)0xC0000000u,

    0x55555555,
    (int32_t)0xAAAAAAAAu,

    0x7FFFFFFF,
    (int32_t)0x80000000u,
    (int32_t)0xFFFFFFFFu
};

/* ---------- MUL direct asm ---------- */
static inline int32_t alu_mul_asm(int32_t a, int32_t b)
{
    int32_t r;

    __asm__ volatile (
        "mul %0, %1, %2"
        : "=r"(r)
        : "r"(a), "r"(b)
    );

    return r;
}

/* ---------- エントリ ---------- */
extern "C" void run() {
    uint32_t error_count = 0;
    int32_t c;

    const int N = sizeof(test_vals) / sizeof(test_vals[0]);

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            int32_t a = test_vals[i];
            int32_t b = test_vals[j];

            // CPUのMUL命令で計算
            c = alu_mul_asm(a, b);

            // RV32M の MUL は下位32bit
            int32_t expected = (int32_t)((uint32_t)a * (uint32_t)b);

            if (c != expected) {
                PIO32 = (uint32_t)c;
                error_count++;
            }
        }
        PIO32 = (uint32_t)c;
    }

    result = error_count;

    // 終了通知
    PIO32 = TEST_END_CODE;

    // エラー数出力
    PIO32 = result;

    while (1) { }
}

/* ---------- 定義 ---------- */
extern "C" {
    volatile uint32_t result = 0;
}