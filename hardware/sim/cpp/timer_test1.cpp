#include <cstdint>

/* ---------- タイマーW ---------- */
#define TIMER_MMIOADDR_W (*reinterpret_cast<volatile uint32_t*>(0x10002000u))

/* ---------- タイマーR ---------- */
#define TIMER_MMIOADDR_R (*reinterpret_cast<volatile uint32_t*>(0x10002004u))

/* ---------- アサーション用PIO出力 ---------- */
#define PIO32 (*reinterpret_cast<volatile uint32_t*>(0x10001000u))
static constexpr uint32_t TEST_END_CODE = 0xEE01;

/* ---------- 宣言（extern：初期化しない） ---------- */
extern "C" volatile uint32_t timer_data;

static inline void tiny_delay(unsigned n){
    while (n--) {
        asm volatile("nop");
    }
}

/* ---------- スタートアップから呼ばれるエントリ ---------- */
extern "C" void run() {

    // TIMER書き込み start
    TIMER_MMIOADDR_W = 0x10FFF;

    tiny_delay(100);

    // TIMER読み出し
    timer_data = TIMER_MMIOADDR_R;
    PIO32 = timer_data;

    // テスト終了のコード送信
    PIO32 = TEST_END_CODE;

    // PIO データによるアサーション用書き込み
    if (timer_data >= 10u) {
        PIO32 = 0x0123;
    } else {
        PIO32 = 0xEE01;
    }

    while (1) { }  // 無限ループで終了
}

/* ---------- 定義（実体）：extern を外す ---------- */
extern "C" {
    volatile uint32_t timer_data = 0;
}
