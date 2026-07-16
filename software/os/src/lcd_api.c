#include "lcd_api.h"
#include "boot_logo.h"
#include "kernel.h"
#include "common.h"

static inline void tiny_delay(unsigned n){
    while (n--) {
        __asm__ __volatile__("nop");
    }
}

// ============================================================
// RGB666 helper
// [17:12] R, [11:6] G, [5:0] B
// ============================================================
static inline uint32_t lcd_rgb666(uint32_t r, uint32_t g, uint32_t b)
{
    return ((r & 0x3Fu) << 12) |
           ((g & 0x3Fu) <<  6) |
           ((b & 0x3Fu) <<  0);
}

// ============================================================
// 32x32 block write from RGB666 image
// img[y][x] = RGB666
// ============================================================
void lcd_write_pix32x32_img(
    uint32_t start_px,
    uint32_t start_py,
    const uint32_t img[32][32]
)
{
    if (start_px >= 512u || start_py >= 512u) {
        return;
    }

    PSC_LCD_PIXS_ADDR = ((start_py & 0x01FFu) << 9) |
                        ((start_px & 0x01FFu) << 0);

    //tiny_delay(1000);

    for (uint32_t y = 0; y < 32; y++) {
        for (uint32_t x = 0; x < 32; x++) {
            PSC_LCD_PIXS_DATA = img[y][x] & 0x3FFFFu;
        }
    }

    // wait
    //tiny_delay(1000);
    //s_printf("before LCD_ST = %x\n", PSC_LCD_PIXS_ST);

    uint32_t timeout = 1000000;
    while ((PSC_LCD_PIXS_ST & 0x01) == 0x01) {
        __asm__ __volatile__("nop");
        if (--timeout == 0) {
            s_printf("IMG LCD_ST timeout\n");
            return;
        }
    }

    //tiny_delay(500);
    //s_printf("after LCD_ST = %x\n", PSC_LCD_PIXS_ST);

}

void lcd_write_pix32x32_beta(
    uint32_t start_px,
    uint32_t start_py,
    uint32_t r,
    uint32_t g,
    uint32_t b
)
{
    if (start_px >= 512u || start_py >= 512u) {
        return;
    }

    PSC_LCD_PIXS_ADDR = ((start_py & 0x01FFu) << 9) |
                        ((start_px & 0x01FFu) << 0);

    //tiny_delay(100);

    for (uint32_t y = 0; y < 32; y++) {
        for (uint32_t x = 0; x < 32; x++) {
            PSC_LCD_PIXS_DATA = (((r & 0x3Fu) << 12) | ((g & 0x3Fu) <<  6) | ((b & 0x3Fu) <<  0)) 
                                    & 0x3FFFFu;
        }
    }

    // wait
    //tiny_delay(1000);
    //s_printf("before LCD_ST = %x\n", PSC_LCD_PIXS_ST);

    uint32_t timeout = 1000000;
    while ((PSC_LCD_PIXS_ST & 0x01) == 0x01) {
        __asm__ __volatile__("nop");
        if (--timeout == 0) {
            s_printf("IMG LCD_ST timeout\n");
            return;
        }
    }

    //s_printf("after LCD_ST = %x\n", PSC_LCD_PIXS_ST);

    //tiny_delay(3000);

}

// ------------------------------------------------------------
// PSC-ONE Boot Logo Display
//
// boot_logo[] : 240x160
// 1pixel = 3bit RGB
//
// bit0 = Red
// bit1 = Green
// bit2 = Blue
//
// LCD出力 : RGB666
// ------------------------------------------------------------
static uint32_t tile_buf[32][32];

void lcd_draw_boot_logo(void)
{
    // 空うちが必要
    lcd_write_pix32x32_beta(0u, 0u,              0u,  0u,  0u);

    // 本番
    lcd_write_pix32x32_beta(0u, 0u,             63u,  0u,  0u);
    lcd_write_pix32x32_beta(0u, 32u,            63u,  0u, 63u);
    lcd_write_pix32x32_beta(0u, 64u,             0u,  0u, 63u);
    lcd_write_pix32x32_beta(320u-32u, 0u,        0u, 63u,  0u);
    lcd_write_pix32x32_beta(320u-32u, 480u-32u,  0u,  0u, 63u);
    lcd_write_pix32x32_beta(0u,       480u-32u, 63u, 63u, 63u);

    // wait
    tiny_delay(10000);

#if 0
    for (uint32_t y = 0; y < 32; y++) {
        for (uint32_t x = 0; x < 32; x++) {
            tile_buf[y][x] = 0x3F000; // 赤
        }
    }

    lcd_write_pix32x32_img(64u, 128u, tile_buf);
    lcd_write_pix32x32_img(128u, 128u, tile_buf);

    for (uint32_t y = 0; y < 32; y++) {
        for (uint32_t x = 0; x < 32; x++) {
            tile_buf[y][x] = 0x0003F;
        }
    }

    lcd_write_pix32x32_img(128u, 248u, tile_buf);
#endif

#if 1

    s_printf("IMG BOOT LOGO start.\n");

    // boot_logo[] = 240 x 160

    for (uint32_t by = 0; by < 480; by += 32) {

        for (uint32_t bx = 0; bx < 320; bx += 32) {

            for (uint32_t y = 0; y < 32; y++) {

                for (uint32_t x = 0; x < 32; x++) {

                    uint32_t sx = bx + x;
                    uint32_t sy = by + y;

                    uint32_t c;

                    if (sx < 320 && sy < 480) {
                        c = boot_logo[sx * 480 + sy];
                    } else {
                        c = 0x07;
                    }

                    tile_buf[y][x] =
                        lcd_rgb666(
                            (c & 1) ? 63 : 0,
                            (c & 2) ? 63 : 0,
                            (c & 4) ? 63 : 0
                        );
                }
            }

            lcd_write_pix32x32_img(
                bx,
                by,
                tile_buf
            );
            //tiny_delay(300);
        }
    }
#endif

}
