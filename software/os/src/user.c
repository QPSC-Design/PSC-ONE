// user.c — SBIモードのみ ecall、PSCモードはMMIOのみ

#include "user.h"
#include "syscall.h"
#include "synap_api.h"
#include <stdint.h>

extern char __user_stack_top[];

/* ============================================================
 *  モード分岐
 *    - USE_SBI_CONSOLE 定義時: QEMU/OpenSBI 用 (ecall あり)
 *    - 未定義時        : PSC/FPGA 用 (ecall なし、UART は MMIO)
 * ============================================================ */

/* -----------------------------
 *  SBI モード（ecall を使う）
 * ----------------------------- */
#ifdef USE_SBI_CONSOLE

static inline int syscall(int sysno, int arg0, int arg1, int arg2) {
    register int a0 __asm__("a0") = arg0;
    register int a1 __asm__("a1") = arg1;
    register int a2 __asm__("a2") = arg2;
    register int a3 __asm__("a3") = sysno;
    __asm__ __volatile__("ecall"
                         : "=r"(a0)
                         : "r"(a0), "r"(a1), "r"(a2), "r"(a3)
                         : "memory");
    return a0;
}

/* SBI では exit はシステムコールで終了要求 */
__attribute__((noreturn))
void exit(void) {
    (void)syscall(SYS_EXIT, 0, 0, 0);
    for(;;) { __asm__ __volatile__("wfi"); }
}

/* SBI ではコンソールもシステムコール */
void putchar(char ch) {
    (void)syscall(SYS_PUTCHAR, (int)(uint8_t)ch, 0, 0);
}

int getchar(void) {
    return syscall(SYS_GETCHAR, 0, 0, 0);
}

/* shell.c 側から呼ばれても構わないダミー初期化（空実装） */
//void uart_init(void) { /* no-op on SBI */ }

#else
/* -----------------------------------------
 *  PSC モード（ecall 禁止、UART は MMIO）
 * ----------------------------------------- */

static inline int syscall(int sysno, int arg0, int arg1, int arg2)
{
    register int a0 __asm__("a0") = arg0;
    register int a1 __asm__("a1") = arg1;
    register int a2 __asm__("a2") = arg2;
    register int a3 __asm__("a3") = sysno;

    __asm__ __volatile__ (
        "ecall"
        : "+r"(a0)
        : "r"(a1), "r"(a2), "r"(a3)
        : "memory"
    );

    return a0;
}

/* PSC では exit は停止ループ（WFIでもNOPでもOK） */
// PSC では exit => ecall
__attribute__((noreturn))
void exit(void) {
    //for(;;) { __asm__ __volatile__("wfi"); }
    //__asm__ __volatile__("ecall");

    // SYS_EXIT API呼び出し
    syscall(SYS_EXIT, 0, 0, 0);
    for (;;);
}


/* ===== UART MMIO 定義 ===== */
#ifndef UART_TX_ADDR
#define UART_TX_ADDR 0x10000000u
#endif
#ifndef UART_RX_ADDR
#define UART_RX_ADDR 0x10000004u
#endif
#ifndef UART_ST_ADDR
#define UART_ST_ADDR 0x10000008u
#endif
#ifndef UART_CT_ADDR
#define UART_CT_ADDR 0x1000000Cu
#endif

#ifndef ST_TX_BUSY
#define ST_TX_BUSY    (1u << 0)
#endif
#ifndef ST_RX_AVAIL
#define ST_RX_AVAIL   (1u << 1)
#endif
#ifndef ST_RX_OVERRUN
#define ST_RX_OVERRUN (1u << 3)
#endif
#ifndef CT_IRQ_CLR
#define CT_IRQ_CLR    (1u << 1)   // W1C
#endif
#ifndef CT_OVR_CLR
#define CT_OVR_CLR    (1u << 2)   // W1C
#endif

// -------------------------------------------------------
// SA実行関数
void call_sa_api(uint32_t matrix_size)
{
    /*
    static const uint8_t mat2x2_A[2][2] = {
         {7,  2},
         {5,  6}
    };

    static const uint8_t mat2x2_B[2][2] = {
         {3,  5},
         {1,  2}
    };
    */

    uint8_t matrix_A[SA_MAT_MAX][SA_MAT_MAX];
    uint8_t matrix_B[SA_MAT_MAX][SA_MAT_MAX];
    uint32_t matrix_C[SA_MAT_MAX][SA_MAT_MAX];

    // --- ランダム生成 ---
    for (uint32_t i = 0; i < matrix_size; i++) {
        for (uint32_t j = 0; j < matrix_size; j++) {
            //matrix_A[i][j] = (uint8_t)(i+j);
            //matrix_B[i][j] = (uint8_t)(i+j);
            matrix_A[i][j] = (uint8_t)(2*i + 2*j + 2);
            matrix_B[i][j] = (uint8_t)(3*i + j + 5);
        }
    }

    /*
    matrix_A[2][3] = 6;
    matrix_B[5][3] = 2;
    */

    sa_api(
        SYS_SA_RUN,
        (uint32_t)&matrix_A[0][0],      // a0: input
        (uint32_t)&matrix_B[0][0],      // a1: input
        (uint32_t)&matrix_C[0][0],      // a2: output 
        (uint32_t)matrix_size           // a4: matrix size
    );

    // ---- A表示 ----
    putchar('A');
    putchar('\n');
    for (uint32_t i = 0; i < matrix_size; i++) {
        for (uint32_t j = 0; j < matrix_size; j++) {
            print_int((int)matrix_A[i][j]);
            putchar(' ');
        }
        putchar('\n');
    }
    putchar('\n');

    // ---- B表示 ----
    putchar('B');
    putchar('\n');
    for (uint32_t i = 0; i < matrix_size; i++) {
        for (uint32_t j = 0; j < matrix_size; j++) {
            print_int((int)matrix_B[i][j]);
            putchar(' ');
        }
        putchar('\n');
    }
    putchar('\n');

    // ---- 結果表示 ----
    putchar('C');
    putchar('\n');
    for (uint32_t i = 0; i < matrix_size; i++) {
        for (uint32_t j = 0; j < matrix_size; j++) {
            print_int((int)matrix_C[i][j]);
            putchar(' ');
        }
        putchar('\n');
    }
    putchar('\n');
}

// -------------------------------------------------------
// SD IF READ関数
void call_mic_api(unsigned count)
{
    // API呼び出し
    mic_api(
        I2S_MIC_READ,
        (uint32_t)count
    );
}

// -------------------------------------------------------
// SD IF READ関数
void call_sd_api(unsigned sector)
{
    // API呼び出し
    sd_api(
        SYS_SD_READ,
        (uint32_t)sector
    );
}

// -------------------------------------------------------
// DUMP 関数
void call_dump_api(uint32_t addr, uint32_t len)
{
    // API呼び出し
    dump_api(
        SYS_DUMP,
        addr,       // a0 = addr
        len         // a1 = len
    );
}

// -------------------------------------------------------
char *strcpy(char *dst, const char *src) {
    char *d = dst;
    while (*src)
        *d++ = *src++;
    *d = '\0';
    return dst;
}

int strcmp(const char *s1, const char *s2) {
    while (*s1 && *s2) {
        if (*s1 != *s2)
            break;
        s1++;
        s2++;
    }

    return *(unsigned char *)s1 - *(unsigned char *)s2;
}

void printf(const char *fmt, ...) {
    va_list vargs;
    va_start(vargs, fmt);

    while (*fmt) {
        if (*fmt == '%') {
            fmt++;
            switch (*fmt) {
                case '\0':
                    putchar('%');
                    goto end;
                case '%':
                    putchar('%');
                    break;
                case 's': {
                    const char *s = va_arg(vargs, const char *);
                    while (*s) {
                        putchar(*s);
                        s++;
                    }
                    break;
                }
                case 'd': {  // Print an integer in decimal (safe version)
                    int value = va_arg(vargs, int);

                    unsigned int u;
                    if (value < 0) {
                        putchar('-');
                        // INT_MIN 対策：符号反転を unsigned で行う 
                        u = (unsigned int)(-(value + 1)) + 1;
                    } else {
                        u = (unsigned int)value;
                    }

                    // 逆順に数字を溜める 
                    char buf[11];   // int32 max: 10 digits + '\0' not needed
                    int i = 0;

                    // 0 の特別扱い 
                    if (u == 0) {
                        putchar('0');
                        break;
                    }

                    while (u > 0) {
                        buf[i++] = '0' + (u % 10);
                        u /= 10;
                    }

                    // 正順に出力 
                    while (i > 0) {
                        putchar(buf[--i]);
                    }
                    break;
                }
                case 'x': { // Print an integer in hexadecimal.
                    unsigned value = va_arg(vargs, unsigned);
                    for (int i = 7; i >= 0; i--) {
                        unsigned nibble = (value >> (i * 4)) & 0xf;
                        putchar("0123456789abcdef"[nibble]);
                    }
                }
            }
        } else {
            putchar(*fmt);
        }

        fmt++;
    }

end:
    va_end(vargs);
}

// cmd_dump はカーネル側で提供（ヘッダにあるならこの宣言は不要）
void cmd_dump(int argc, const char **argv);

/* 簡易数値パーサ: 0x... なら16進、それ以外は10進 */
unsigned parse_u32(const char *s) {
    unsigned base = 10;
    if ((s[0] == '0') && (s[1] == 'x' || s[1] == 'X')) {
        base = 16;
        s += 2;
    }
    unsigned v = 0;
    while (*s) {
        char c = *s++;
        unsigned d;
        if (c >= '0' && c <= '9')       d = (unsigned)(c - '0');
        else if (c >= 'a' && c <= 'f')  d = 10u + (unsigned)(c - 'a');
        else if (c >= 'A' && c <= 'F')  d = 10u + (unsigned)(c - 'A');
        else break;
        if (d >= base) break;
        v = v * base + d;
    }
    return v;
}

/* 素数判定（√n までの試し割り） */
bool is_prime(unsigned n)
{
    if (n < 2) return false;

    for (unsigned i = 2; i * i <= n; i++) {
        if (n % i == 0)
            return false;
    }
    return true;
}

//extern char __user_stack_bottom[];
//extern char __user_stack_top[];

#if 0
int test_div(int a, int b)
{
    return a / b;
}

int test_mod(int a, int b)
{
    return a % b;
}
#endif

#if 0
static inline void uart_w32(uint32_t a, uint32_t v){ mmio_w32(a, v); }
static inline uint32_t uart_r32(uint32_t a){ return mmio_r32(a); }

/* 公開：shell.c から呼ぶ想定（宣言は user.h へ） */
void uart_init(void){
    uart_w32(UART_CT_ADDR, 0u);                       // irq_en=0
    uart_w32(UART_CT_ADDR, CT_IRQ_CLR | CT_OVR_CLR);  // W1C クリア
}

static inline void uart_send_byte(uint8_t b){
    while (uart_r32(UART_ST_ADDR) & ST_TX_BUSY) { /* spin */ }
    uart_w32(UART_TX_ADDR, (uint32_t)b);
}

static inline int uart_try_recv(uint8_t *out){
    if ((uart_r32(UART_ST_ADDR) & ST_RX_AVAIL) == 0) return 0;
    *out = (uint8_t)(uart_r32(UART_RX_ADDR) & 0xFFu);
    return 1;
}
#endif

/* ユーザ I/O API */
#if 0
// Use U-mode MMIO Area.
void putchar(char ch){
    if (uart_r32(UART_ST_ADDR) & ST_RX_OVERRUN) {
        uart_w32(UART_CT_ADDR, CT_OVR_CLR); // W1C
    }
    uart_send_byte((uint8_t)ch);
}

int getchar(void){
    uint8_t b;
    for(;;){
        if (uart_r32(UART_ST_ADDR) & ST_RX_OVERRUN) {
            uart_w32(UART_CT_ADDR, CT_OVR_CLR); // W1C
        }
        if (uart_try_recv(&b)) return (int)b;
    }
}
#else
// Use S-mode MMIO Area.
void putchar(char ch)
{
    __asm__ __volatile__ (
        "mv a0, %0\n"
        "li a3, %1\n"
        "ecall\n"
        :
        : "r"(ch), "i"(SYS_PUTCHAR)
        : "a0", "a3"
    );
}

int getchar(void)
{
    int ch;
    __asm__ __volatile__ (
        "li a3, %1\n"    // syscall番号
        "ecall\n"
        "mv %0, a0\n"    // 戻り値
        : "=r"(ch)
        : "i"(SYS_GETCHAR)
        : "a0", "a3"
    );
    return ch;
}

void print_int(int v)
{
    __asm__ __volatile__ (
        "mv a0, %0\n"
        "li a3, %1\n"
        "ecall\n"
        :
        : "r"(v), "i"(SYS_PRINT_INT)
        : "a0", "a3"
    );
}
#endif

#endif /* USE_SBI_CONSOLE */

// SA API
static inline uint32_t sa_api(uint32_t n,
                              uint32_t a0,
                              uint32_t a1,
                              uint32_t a2,
                              uint32_t a4)
{
    uint32_t ret;
    __asm__ __volatile__ (
        "mv a0, %1\n"
        "mv a1, %2\n"
        "mv a2, %3\n"
        "mv a3, %4\n"
        "mv a4, %5\n"   
        "ecall\n"
        "mv %0, a0\n"
        : "=r"(ret)
        : "r"(a0), "r"(a1), "r"(a2), "r"(n), "r"(a4)
        : "a0", "a1", "a2", "a3", "a4", "memory"
    );
    return ret;
}

// I2S MIC IF API
static inline uint32_t mic_api(uint32_t sysno, uint32_t arg0)
{
    register uint32_t a0 __asm__("a0") = arg0;
    register uint32_t a3 __asm__("a3") = sysno;

    __asm__ __volatile__(
        "ecall"
        : "+r"(a0)
        : "r"(a3)
        : "memory"
    );

    return a0;
}

// SD-IF API
static inline uint32_t sd_api(uint32_t sysno, uint32_t arg0)
{
    register uint32_t a0 __asm__("a0") = arg0;
    register uint32_t a3 __asm__("a3") = sysno;

    __asm__ __volatile__(
        "ecall"
        : "+r"(a0)
        : "r"(a3)
        : "memory"
    );

    return a0;
}

int call_sd_read_buf_api(uint32_t sector, void *buf)
{
    register uint32_t a0 __asm__("a0") = sector;
    register uint32_t a1 __asm__("a1") = (uint32_t)buf;
    register uint32_t a3 __asm__("a3") = SYS_SD_READ_BUF;

    __asm__ __volatile__(
        "ecall"
        : "+r"(a0)
        : "r"(a1), "r"(a3)
        : "memory"
    );

    return (int)a0;
}

// dump API
static inline void dump_api(uint32_t sysno,
                            uint32_t arg0,
                            uint32_t arg1)
{
    register uint32_t a0 __asm__("a0") = arg0;
    register uint32_t a1 __asm__("a1") = arg1;
    register uint32_t a3 __asm__("a3") = sysno;

    __asm__ __volatile__(
        "ecall"
        :
        : "r"(a0),
          "r"(a1),
          "r"(a3)
        : "memory"
    );
}

/* ===== エントリ ===== */
__attribute__((section(".text.start")))
__attribute__((naked))
void start(void) {
    __asm__ __volatile__(
        "mv   sp, %[stk]\n"
        "call main\n"
        "call exit\n"
        :
        : [stk] "r"(__user_stack_top)
    );
}
