#include "mic_api.h"
#include "kernel.h"
#include "common.h"

#define TIMEOUT_CYCLE   50000u

#define MIC_FIFO_EMPTY  0x00000001u
#define MIC_SAMPLE_MASK 0x00FFFFFFu

static uint32_t mic_samples[1024];

static inline void tiny_delay(unsigned n)
{
    while (n--) {
        __asm__ __volatile__("nop");
    }
}

/*
 * I2S RX FIFO にデータが来るまで待つ
 * return:
 *   0  : OK
 *  -1  : timeout
 */
int mic_wait_sample(void)
{
    uint32_t timeout = TIMEOUT_CYCLE;

    while ((PSC_I2S_ST & MIC_FIFO_EMPTY) != 0u) {
        if (--timeout == 0u) {
            return -1;
        }
        __asm__ __volatile__("nop");
    }

    return 0;
}

/*
 * 生の 32bit サンプルを読む
 * 上位bitにステータス等が混じる可能性を残す
 */
int mic_read_raw(uint32_t *sample)
{
    if (sample == 0) {
        return -1;
    }

    if (mic_wait_sample() != 0) {
        return -1;
    }

    *sample = PSC_I2S_RX;
    return 0;
}

/*
 * 下位24bitの音声データだけ読む
 */
int mic_read_sample24(uint32_t *sample24)
{
    uint32_t raw;

    if (sample24 == 0) {
        return -1;
    }

    if (mic_read_raw(&raw) != 0) {
        return -1;
    }

    *sample24 = raw & MIC_SAMPLE_MASK;
    return 0;
}

/*
 * 複数サンプルを読む
 * return:
 *   読めたサンプル数
 */
uint32_t mic_read_samples24(uint32_t *buf, uint32_t count)
{
    uint32_t i;

    if (buf == 0) {
        return 0;
    }

    for (i = 0; i < count; i++) {
        if (mic_read_sample24(&buf[i]) != 0) {
            break;
        }

        tiny_delay(10);
    }

    return i;
}

uint32_t s_call_mic_read_samples24(uint32_t count)
{
    uint32_t read_count = 0;

    if (count == 0) {
        return 0;
    }

    // mic data fifo flush
    PSC_I2S_ST = 0x01;

    while (read_count < count) {

        // wait until FIFO has enough samples
        while (1) {
            uint32_t fifo_count = (PSC_I2S_ST & 0xFF000000u) >> 24;
            if (fifo_count >= 24) {
                break;
            }
        }

        // read up to 24 samples, but do not exceed count
        for (uint32_t j = 0; j < 24 && read_count < count; j++) {
            mic_samples[read_count] = PSC_I2S_RX & 0xFFFFFFFFu;
            read_count++;
        }

        tiny_delay(10);
    }

    // dump after capture
    for (uint32_t k = 0; k < read_count; k++) {
        s_printf("MIC[%d]=%x\n", k, mic_samples[k]);
    }

    s_printf("MIC SAMPLE COUNT=%d\n", read_count);

    return read_count;
}

/*
uint32_t s_call_mic_read_samples24(uint32_t count)
{
    uint32_t sample24;

    s_printf("ENTER\n");

    for (uint32_t i = 0; i < count; i++) {

        s_printf("LOOP\n");

        mic_read_sample24(&sample24);

        s_printf("READ OK\n");
    }

    s_printf("EXIT\n");

    return 0;
}
*/