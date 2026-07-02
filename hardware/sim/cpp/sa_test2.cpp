#include <cstdint>

// ============================================================
// MMIO / CSR
// ============================================================
#define PIO32          (*reinterpret_cast<volatile uint32_t*>(0x10001000u))

#define CSR_WRITE(csr, val) \
    asm volatile ("csrw " #csr ", %0" :: "r"(val))

#define CSR_READ(csr) \
    ([&]() -> uint32_t { \
        uint32_t val; \
        asm volatile ("csrr %0, " #csr : "=r"(val)); \
        return val; \
    }())

static constexpr uint32_t TEST_END_CODE = 0xEE01;


// ============================================================
// Entry
// ============================================================
extern "C" void run()
{
    bool all_ok = true;

    // --------------------------------------------------------
    // 0. SA_ADDR_A,B,C設定
    // --------------------------------------------------------
    // csr_SA_ADDR_A,B
    CSR_WRITE(0x7D0, 0x020000);
    CSR_WRITE(0x7D4, 0x020400);
    // csr_SA_ADDR_C
    CSR_WRITE(0x7D8, 0x020800);

    for (int iter = 0; iter < 5; iter++) {

        // ----------------------------------------------------
        // 行列生成（毎回変える）
        // ----------------------------------------------------
        uint8_t A[2][2];
        uint8_t B[2][2];

        A[0][0] = (uint8_t)(1 + iter);
        A[0][1] = (uint8_t)(2 + iter);
        A[1][0] = (uint8_t)(3 + iter);
        A[1][1] = (uint8_t)(4 + iter);

        B[0][0] = (uint8_t)(5 + iter);
        B[0][1] = (uint8_t)(6 + iter);
        B[1][0] = (uint8_t)(7 + iter);
        B[1][1] = (uint8_t)(8 + iter);

        // ----------------------------------------------------
        // SAへ書き込み
        // ----------------------------------------------------
        {
            volatile uint32_t* REG_A0 = (volatile uint32_t*)0x020000;
            volatile uint32_t* REG_A1 = (volatile uint32_t*)0x020004;

            uint32_t p0 = ((uint32_t)A[0][1] << 8) | A[0][0];
            uint32_t p1 = ((uint32_t)A[1][1] << 8) | A[1][0];

            *REG_A0 = p0;
            *REG_A1 = p1;
        }

        {
            volatile uint32_t* REG_B0 = (volatile uint32_t*)0x020400;
            volatile uint32_t* REG_B1 = (volatile uint32_t*)0x020404;

            uint32_t p0 = ((uint32_t)B[0][1] << 8) | B[0][0];
            uint32_t p1 = ((uint32_t)B[1][1] << 8) | B[1][0];

            *REG_B0 = p0;
            *REG_B1 = p1;
        }

        // ----------------------------------------------------
        // SW計算
        // ----------------------------------------------------
        uint16_t Csw[2][2];

        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 2; j++) {

                int sum = 0;

                for (int k = 0; k < 2; k++) {
                    sum += (int)A[i][k] * (int)B[k][j];
                }

                //PIO32 = 0xEE220000;
                Csw[i][j] = (uint16_t)sum;
                //PIO32 = (uint32_t)Csw[i][j];
            }
        }

        // debug
        PIO32 = (uint32_t)iter;

        // ----------------------------------------------------
        // SA開始
        // ----------------------------------------------------
        // sa_clear:bit[2]
        CSR_WRITE(0x7C0, 0x04);
        CSR_WRITE(0x7C0, 0x00);
        // sa_reset
        CSR_WRITE(0x7C0, 0x02);
        CSR_WRITE(0x7C0, 0x00);
        // sa_mode : OS mode.
        CSR_WRITE(0x7C4, 0x01);
        // sa_start
        //CSR_WRITE(0x7C0, 0x01);
        //CSR_WRITE(0x7C0, 0x00);
        // OS mode.
        CSR_WRITE(0x7C0, (0x08 | 0x01));   // SA start
        CSR_WRITE(0x7C0, (0x08 | 0x00));   // clear start

        while ((CSR_READ(0x7C8) & 0x01) != 0x01) {
            asm volatile("nop");
        }

        // ----------------------------------------------------
        // SA結果読み出し
        // ----------------------------------------------------
        uint16_t Csa[4];
#if 1
        {
            volatile uint32_t* REG0 = (volatile uint32_t*)0x020800;
            volatile uint32_t* REG1 = (volatile uint32_t*)0x020804;
            volatile uint32_t* REG2 = (volatile uint32_t*)0x020808;
            volatile uint32_t* REG3 = (volatile uint32_t*)0x02080C;

            uint32_t v0 = *REG0;
            uint32_t v1 = *REG1;
            uint32_t v2 = *REG2;
            uint32_t v3 = *REG3;

            Csa[0] = (uint16_t)(v0 & 0xFFFF); // C00
            Csa[1] = (uint16_t)(v1 & 0xFFFF); // C01
            Csa[2] = (uint16_t)(v2 & 0xFFFF); // C10
            Csa[3] = (uint16_t)(v3 & 0xFFFF); // C11
        }
#endif

#if 1
        // debug出力
        PIO32 = 0xEEA0;
        for (int i = 0; i < 4; i++) {
            PIO32 = (uint32_t)Csa[i];
        }
#endif
        // ----------------------------------------------------
        // 検証
        // ----------------------------------------------------
        bool ok = true;
        uint32_t err_code;
#if 1
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 2; j++) {

                uint16_t v_sw = Csw[i][j];
                uint16_t v_sa = Csa[i * 2 + j];

                /*
                PIO32 = 0xEEA1;
                PIO32 = (uint32_t)v_sw;
                PIO32 = (uint32_t)v_sa;
                */

                if (v_sw != v_sa) {
                    err_code = 0xDEAD0000 | (uint32_t)(i * 2 + j);
                    PIO32 = err_code;
                    ok = false;
                }
            }
        }
#endif
        if (!ok) {
            PIO32 = (uint32_t)iter;
            all_ok = false;
            break;
        }
    }

    // --------------------------------------------------------
    // 結果
    // --------------------------------------------------------
    PIO32 = TEST_END_CODE;

    if (all_ok) {
        PIO32 = 0xBEEF;
    } else {
        PIO32 = 0xDEAD;
    }

    while (1) { }
}