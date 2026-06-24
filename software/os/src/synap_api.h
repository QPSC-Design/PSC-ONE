// synap_api.h
#pragma once

/* ===== MMIO 定義 ===== */
// SA Core ベース
//#define PSC_SA_CTRL_W    (*(volatile uint32_t*)0x10005000u)
#define PSC_SA_CTRL         0x10005000u

// MMU用アドレス
#define PSC_SA_DATA_BASE    0x00020000u
#define PSC_SA_DATA_WB      0x00030000u

#define PSC_SA_ADDR_A       0x00020000u
#define PSC_SA_ADDR_B       0x00020020u
#define PSC_SA_ADDR_C       0x00020040u

typedef int bool;
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long uint64_t;
typedef uint32_t size_t;
typedef uint32_t uintptr_t;
typedef uint32_t paddr_t;
typedef uint32_t vaddr_t;

#define true  1
#define false 0

#define SA_MAT_MAX    4

void sa_run(const uint8_t *in_A, const uint8_t *in_B, const uint8_t Matrix_N, uint32_t *out_C);
void s_call_sa_api(const uint8_t matrix_N);