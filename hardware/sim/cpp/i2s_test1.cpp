// i2s_rx_test1.cpp
#include <cstdint>

/* ---------- PIO ---------- */
#define PIO32 (*reinterpret_cast<volatile uint32_t*>(0x10001000u))
static constexpr uint32_t TEST_END_CODE      = 0xEE01;
static constexpr uint32_t ERR_I2S_TIMEOUT    = 0xEE70;
static constexpr uint32_t I2S_SAMPLE_COUNT   = 4;

/* ---------- PSC I2S RX ---------- */
#define PSC_I2S_RX  (*reinterpret_cast<volatile uint32_t*>(0x10007000u))
#define PSC_I2S_ST  (*reinterpret_cast<volatile uint32_t*>(0x10007004u))

static inline void tiny_delay(unsigned n)
{
    while (n--) {
        asm volatile("nop");
    }
}

extern "C" void run()
{
    uint32_t sample;
    uint32_t last_sample = 0;

    PIO32 = 0x1700;   // I2S test start

    tiny_delay(1000);

    for (uint32_t i = 0; i < I2S_SAMPLE_COUNT; i++) {

        // fifo_empty == 0 を待つ
        uint32_t timeout = 200000;

        while ((PSC_I2S_ST & 0x1u) != 0u) {
            if (--timeout == 0) {
                PIO32 = ERR_I2S_TIMEOUT;
                PIO32 = i;
                while (1) {}
            }
            asm volatile("nop");
        }

        // FIFO read
        sample = PSC_I2S_RX;
        last_sample = sample;

        // 下位24bitが音声絶対値
        PIO32 = sample & 0x00FFFFFFu;

        tiny_delay(100);
    }

    PIO32 = TEST_END_CODE;
    PIO32 = last_sample;

    while (1) {}
}