#include "mic_api.h"
#include "kernel.h"
#include "common.h"

#define TIMEOUT_CYCLE   50000u

#define MIC_FIFO_EMPTY  0x00000001u
#define MIC_SAMPLE_MASK 0x00FFFFFFu

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
    uint32_t sample24;
    uint32_t i;

    for (i = 0; i < count; i++) {

        int retry_max = 3;
        int success = 0;

        for (int retry = 0; retry < retry_max; retry++) {

            if (mic_read_sample24(&sample24) == 0) {
                success = 1;
                break;
            }

            s_printf("MIC READ FAIL retry=%d\n", retry);
            tiny_delay(100);
        }

        if (!success) {
            s_printf("MIC READ FAILED index=%d\n", i);
            break;
        }

        s_printf("MIC[%d]=%x\n", i, sample24);

        tiny_delay(10);
    }

    s_printf("MIC SAMPLE COUNT=%d\n", i);

    return i;
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