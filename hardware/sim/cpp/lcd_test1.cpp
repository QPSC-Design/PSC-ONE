// NISHIHARU
// lcd_test1.cpp  (PSC_LCD対応版)

#include <cstdint>

#define BSRAM_SUB

/* ---------- アサーション用PIO出力 ---------- */
#define PIO32 (*reinterpret_cast<volatile uint32_t*>(0x10001000u))
static constexpr uint32_t TEST_END_CODE = 0xEE01;

// ===================== MMIO base addresses =====================
// Verilog側パラメータ (word addr):
//   LCD_PIXS_ADDR = 0x1000_2000
//   LCD_PIXS_DATA = 0x1000_2004
// PSC SoCルール: CPU側は *4 してバイトアドレスにする

#ifndef LCD_PIXS_ADDR_FPGA
#define LCD_PIXS_ADDR_FPGA (0x10003000u)
#endif

#ifndef LCD_PIXS_DATA_FPGA
#define LCD_PIXS_DATA_FPGA (0x10003004u)
#endif

// バイトアドレス化 (SoC側仕様: ワードアドレス×4が実アドレス)
constexpr uintptr_t LCD_PIXS_ADDR_BYTE = LCD_PIXS_ADDR_FPGA;
constexpr uintptr_t LCD_PIXS_DATA_BYTE = LCD_PIXS_DATA_FPGA;

// MMIO 32bitアクセス用マクロ
#define MMIO32(addr_byte) (*reinterpret_cast<volatile uint32_t*>(addr_byte))

// ===================== パネルサイズ =====================
static constexpr uint32_t LCD_W = 240;
static constexpr uint32_t LCD_H = 320;

// ===================== 観察/デバッグ用シンボル =====================
extern "C" volatile uint32_t result;
extern "C" volatile uint32_t result_wr;
extern "C" volatile uint32_t result_rd;
extern "C" volatile uint32_t result_ok;

// ------------------------------------------------------------
// low-level write to PSC_LCD MMIO
//   addr_index : ピクセルインデックス (18bit想定: 0..0x3FFFF)
//   rgb_bits   : 下位3ビットだけ有効
//                bit0 -> red   (pixel_on[0])
//                bit1 -> blue  (pixel_on[1])
//                bit2 -> green (pixel_on[2])
// 手順：
//   1. addr_index を LCD_PIXS_ADDR に書く
//   2. rgb_bits   を LCD_PIXS_DATA に書く
// ------------------------------------------------------------
static inline void lcd_write_raw(uint32_t addr_index, uint32_t rgb_bits)
{
    // デバッグ用に観察レジスタへコピー
    result_rd = addr_index;
    result_wr = rgb_bits & 0x7u;

    // 1) ピクセルアドレスレジスタ
    MMIO32(LCD_PIXS_ADDR_BYTE) = addr_index;

    // 2) カラーデータレジスタ
    MMIO32(LCD_PIXS_DATA_BYTE) = (rgb_bits & 0x7u);
}

// ============================================================
// ピクセル1点に色を書く (座標指定版)
//
// px, py: 0 <= px < LCD_W (=240), 0 <= py < LCD_H (=320)
// r,g,b : 各1bit (0 or 1)
//     r -> pixel_on[0]
//     b -> pixel_on[1]
//     g -> pixel_on[2]
//
// ハード側の今後の想定は pixel_on をそのまま 5:6:5 に展開してRGB出力。
// 現在のビルドでは x[3],x[4],x[5]ベースのテストカラーを使ってるけど、
// 将来の本命はこっち。
// ============================================================
static inline void lcd_write_pixel_rgb(uint32_t px, uint32_t py,
                                       uint32_t r, uint32_t g, uint32_t b)
{
    // 画面外は無視
    if (px >= 512 || py >= 512) {
        return;
    }

    // フレームバッファ線形index: 0..76799
    // 将来の拡張を考えて18bit幅で扱う (PSC_LCD側のpix_waddrは[17:0])
#ifdef BSRAM_SUB
    const uint32_t pixel_index = (((py >> 1) & 0x00FFu) << 7) | ((px >> 1) & 0x007Fu);
#else
    const uint32_t pixel_index = ((py & 0x01FFu) << 8) | (px & 0x00FFu);
#endif

    // 3bitカラー (下位3bitだけ有効)
    // red   -> bit0
    // blue  -> bit1
    // green -> bit2
    const uint32_t rgb_bits =
        ((r & 1u) << 0) |   // bit0 : red
        ((b & 1u) << 1) |   // bit1 : blue
        ((g & 1u) << 2);    // bit2 : green

    lcd_write_raw(pixel_index, rgb_bits);
}

// 小さいdelay（簡易ウェイト）
static inline void tiny_delay(unsigned n){
    while (n--) {
        asm volatile("nop");
    }
}

// ============================================================
// デモ: run()
//   - デバッグ用変数にマーク書いて "生きてる" を示す
//   - 横ライン描画や矩形塗りつぶしを繰り返す
// ============================================================
extern "C" void run() {

    // アサーション
    result = 0x07u;
    // PIO out
    PIO32 = result;

    // 5回ループのみ
    while (1) {

        for (uint32_t y = 100; y < 200; y++) {
            for (uint32_t x = 70; x < 170; x++) {
                lcd_write_pixel_rgb(x, y, 1u, 1u, 1u); 
            }
        }

        // wait
        tiny_delay(3000000);

        for (uint32_t y = 100; y < 200; y++) {
            for (uint32_t x = 70; x < 170; x++) {
                lcd_write_pixel_rgb(x, y, 1u, 0u, 0u); 
            }
        }

        // wait
        tiny_delay(3000000);

        for (uint32_t y = 100; y < 200; y++) {
            for (uint32_t x = 70; x < 170; x++) {
                lcd_write_pixel_rgb(x, y, 0u, 1u, 0u); 
            }
        }

        // wait
        tiny_delay(3000000);

        for (uint32_t y = 100; y < 200; y++) {
            for (uint32_t x = 70; x < 170; x++) {
                lcd_write_pixel_rgb(x, y, 0u, 0u, 1u); 
            }
        }

        // wait
        tiny_delay(3000000);

    }

    // ここには到達しないが、保険で無限idle
    while (1) {
        // idle
    }
}

// ===================== 観察/デバッグ用シンボル（実体定義） =====================
extern "C" {
    volatile uint32_t result    = 0;
    volatile uint32_t result_wr = 0;
    volatile uint32_t result_rd = 0;
    volatile uint32_t result_ok = 0;
}