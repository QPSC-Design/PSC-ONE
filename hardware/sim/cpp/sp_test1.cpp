// sp_test1.cpp
#include <cstdint>

/* ---------- アサーション用PIO出力 (Byteアドレス) --------- */
#define PIO32 (*reinterpret_cast<volatile uint32_t*>(0x10001000u))
static constexpr uint32_t TEST_END_CODE = 0xEE01;

/* ---------- リンカシンボル（リンクスクリプト側で定義） ---------- */
extern "C" char _stack_top;   // ld: _stack_top = ORIGIN(RAM)+LENGTH(RAM);

/* ---------- 可視化用グローバル ---------- */
extern "C" volatile uint32_t result;

/* ---------- SP 読み取りユーティリティ ---------- */
static inline uintptr_t read_sp() {
    uintptr_t sp_now;
    asm volatile ("mv %0, sp" : "=r"(sp_now));
    return sp_now;
}

/* ネスト呼び出しで SP が下方向に動くか観察（true=減少） */
__attribute__((noinline))
static bool sp_grows_down(uintptr_t caller_sp)
{
    volatile uint32_t local_array[8] = {
        0x12345678u, 0, 0, 0, 0, 0, 0, 0
    };

    asm volatile("" : : "r"(local_array) : "memory");

    const uintptr_t callee_sp = read_sp();

    return callee_sp < caller_sp;
}

/* ---------- スタートアップから呼ばれるエントリ ---------- */
extern "C" void run() {
    // 直ちに SP を読む（関数プロローグ後の値）
    uintptr_t sp0 = read_sp();
    uintptr_t stack_top = reinterpret_cast<uintptr_t>(&_stack_top);

    // 判定1: 16-byte アライン（RISC-V ABI）
    bool ok_align = ((sp0 & 0xFu) == 0u);

    // 判定2: SP は _stack_top 以下（通常は関数フレーム分だけ下がっている）
    bool ok_below_top = (sp0 <= stack_top);

    // 判定3: 呼び出しで SP が減少方向に動くか
    bool ok_grow_down = sp_grows_down(sp0);

    // デバッグ用に「_stack_top - sp0」を上位16bitへ、下位16bitは判定ビット
    uint32_t flags =
        (ok_align     ? 1u : 0u) |
        (ok_below_top ? 2u : 0u) |
        (ok_grow_down ? 4u : 0u);

    uint32_t delta16 = 0;
    if (stack_top >= sp0) {
        uintptr_t d = stack_top - sp0;
        delta16 = static_cast<uint32_t>(d & 0xFFFFu);
    }
    result = (delta16 << 16) | (flags & 0xFFFFu);

    // テスト終了のコード送信
    PIO32 = TEST_END_CODE;

    // すべてOKなら 0x5AA5、どれかNGなら 0x00EE をPIOへ
    if (flags == (1u | 2u | 4u)) {
        PIO32 = 0x5AA5u;
    } else {
        PIO32 = 0x00EEu;
    }

    // 任意：メモリ可視性を強めたい場合
    // asm volatile ("fence rw, rw" ::: "memory");

    while (1) { }  // 停止
}

/* ---------- 定義（実体）：extern を外す ---------- */
extern "C" {
    volatile uint32_t result = 0;
}
