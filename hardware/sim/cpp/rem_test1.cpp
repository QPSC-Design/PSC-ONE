#include <cstdint>

/* ---------- アサーション用PIO出力 (Byteアドレス) --------- */
#define PIO32 (*reinterpret_cast<volatile uint32_t*>(0x10001000u))
static constexpr uint32_t TEST_END_CODE = 0xEE01;

/* ---------- 宣言（extern：初期化しない） ---------- */
extern "C" volatile uint32_t result;

/* ---------- スタートアップから呼ばれるエントリ ---------- */
extern "C" void run() {

    int32_t  s;
    uint32_t u;

#define CHECK_S(exp)                     \
    do {                                 \
        if (s != (int32_t)(exp)) {       \
            PIO32 = TEST_END_CODE;       \
            PIO32 = (uint32_t)s;         \
            while (1) {}                 \
        }                                \
    } while (0)

#define CHECK_U(exp)                     \
    do {                                 \
        if (u != (uint32_t)(exp)) {      \
            PIO32 = TEST_END_CODE;       \
            PIO32 = u;                   \
            while (1) {}                 \
        }                                \
    } while (0)

    // ---------------------------------
    // DIV
    // ---------------------------------

    asm volatile ("div %0, %1, %2"
                  : "=r"(s)
                  : "r"(10), "r"(3));
    CHECK_S(3);

    asm volatile ("div %0, %1, %2"
                  : "=r"(s)
                  : "r"(-10), "r"(3));
    CHECK_S(-3);

    asm volatile ("div %0, %1, %2"
                  : "=r"(s)
                  : "r"(10), "r"(0));
    CHECK_S(-1);

    // ---------------------------------
    // REM
    // ---------------------------------

    asm volatile ("rem %0, %1, %2"
                  : "=r"(s)
                  : "r"(10), "r"(3));
    CHECK_S(1);

    asm volatile ("rem %0, %1, %2"
                  : "=r"(s)
                  : "r"(-10), "r"(3));
    CHECK_S(-1);

    asm volatile ("rem %0, %1, %2"
                  : "=r"(s)
                  : "r"(10), "r"(0));
    CHECK_S(10);

    // ---------------------------------
    // DIVU
    // ---------------------------------

    asm volatile ("divu %0, %1, %2"
                  : "=r"(u)
                  : "r"(10u), "r"(3u));
    CHECK_U(3);

    asm volatile ("divu %0, %1, %2"
                  : "=r"(u)
                  : "r"(10u), "r"(0u));
    CHECK_U(0xFFFFFFFFu);

    // ---------------------------------
    // REMU
    // ---------------------------------

    asm volatile ("remu %0, %1, %2"
                  : "=r"(u)
                  : "r"(10u), "r"(3u));
    CHECK_U(1);

    asm volatile ("remu %0, %1, %2"
                  : "=r"(u)
                  : "r"(10u), "r"(0u));
    CHECK_U(10);

    // ---------------------------------
    // PASS
    // ---------------------------------

    PIO32 = TEST_END_CODE;
    PIO32 = 0x00000001;

    while (1) {
    }
}

/* ---------- 定義（実体）：extern を外す ---------- */
extern "C" {
    volatile uint32_t result = 0;
}