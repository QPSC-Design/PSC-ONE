#include <cstdint>

/* ---------- アサーション用PIO出力 --------- */
#define PIO32 (*reinterpret_cast<volatile uint32_t*>(0x10001000u))
static constexpr uint32_t TEST_END_CODE = 0xEE01;

/* ---------- 結果 ---------- */
extern "C" volatile uint32_t result;

/* ---------- エントリ ---------- */
extern "C" void run() {
    uint32_t ra_val = 0;

    /*
     * jalr_test:
     *   jalr でラベルへ飛ぶ
     *   ra に「戻り先PC」が入るはず
     */
    asm volatile (
        "auipc t0, 0\n"          // t0 = PC
        "addi  t0, t0, 12\n"     // t0 = &target（この下の位置に合わせる）
        "jalr  ra, t0, 0\n"      // jump to target, ra = PC+4
        "nop\n"                  // ← ra はここを指すはず
        "nop\n"
        "target:\n"
        "mv    %0, ra\n"         // ra を C変数へ
        : "=r"(ra_val)
        :
        : "t0", "ra", "memory"
    );

    result = ra_val;

    /* ---- テスト終了 ---- */
    PIO32 = TEST_END_CODE;
    PIO32 = result;

    while (1) { }
}

/* ---------- 実体 ---------- */
extern "C" {
    volatile uint32_t result = 0;
}
