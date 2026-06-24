
./build/bootloader_fat32.elf:     ファイル形式 elf32-littleriscv


セクション .text の逆アセンブル:

00100000 <_start>:
.section .text
.globl _start
_start:
    la sp, _stack_top
  100000:	00008117          	auipc	sp,0x8
  100004:	9c010113          	addi	sp,sp,-1600 # 1079c0 <fat32_buf>
    call bootloader_main
  100008:	00000097          	auipc	ra,0x0
  10000c:	04c080e7          	jalr	76(ra) # 100054 <bootloader_main>
1:
    j 1b
  100010:	0000006f          	j	100010 <_start+0x10>

00100014 <putchar>:
#ifndef USER_LOAD_ADDR
#define USER_LOAD_ADDR      0x00400000u
#endif

void putchar(char ch)
{
  100014:	100005b7          	lui	a1,0x10000

static inline void mmio_w32(uint32_t addr, uint32_t v) {
    *(volatile uint32_t*)addr = v;
}
static inline uint32_t mmio_r32(uint32_t addr) {
    return *(volatile uint32_t*)addr;
  100018:	0085a603          	lw	a2,8(a1) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  10001c:	00167613          	andi	a2,a2,1
  100020:	00060663          	beqz	a2,10002c <putchar+0x18>
        __asm__ __volatile__("nop");
  100024:	00000013          	nop
  100028:	ff1ff06f          	j	100018 <putchar+0x4>
    *(volatile uint32_t*)addr = v;
  10002c:	00a5a023          	sw	a0,0(a1)
    }

    mmio_w32(UART_MMIO_BASE + UART_TX, (uint32_t)(uint8_t)ch);
}
  100030:	00008067          	ret

00100034 <uart_putchar>:

void uart_putchar(char c)
{
  100034:	100005b7          	lui	a1,0x10000
    return *(volatile uint32_t*)addr;
  100038:	0085a603          	lw	a2,8(a1) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  10003c:	00167613          	andi	a2,a2,1
  100040:	00060663          	beqz	a2,10004c <uart_putchar+0x18>
        __asm__ __volatile__("nop");
  100044:	00000013          	nop
  100048:	ff1ff06f          	j	100038 <uart_putchar+0x4>
    *(volatile uint32_t*)addr = v;
  10004c:	00a5a023          	sw	a0,0(a1)
    putchar(c);
}
  100050:	00008067          	ret

00100054 <bootloader_main>:
    void (*entry)(void) = (void (*)(void))addr;
    entry();
}

void bootloader_main(void)
{
  100054:	fe010113          	addi	sp,sp,-32
  100058:	00112e23          	sw	ra,28(sp)
  10005c:	00812c23          	sw	s0,24(sp)
  100060:	00912a23          	sw	s1,20(sp)
  100064:	01212823          	sw	s2,16(sp)
  100068:	00000513          	li	a0,0
    uint32_t kernel_words = 0;
  10006c:	00012623          	sw	zero,12(sp)
    uint32_t user_words = 0;
  100070:	00012423          	sw	zero,8(sp)
  100074:	06200613          	li	a2,98
  100078:	001035b7          	lui	a1,0x103
  10007c:	69d58593          	addi	a1,a1,1693 # 10369d <$d.1>
  100080:	100006b7          	lui	a3,0x10000
  100084:	01700713          	li	a4,23
  100088:	0080006f          	j	100090 <bootloader_main+0x3c>
        __asm__ __volatile__("nop");
  10008c:	00000013          	nop
    return *(volatile uint32_t*)addr;
  100090:	0086a783          	lw	a5,8(a3) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100094:	0017f793          	andi	a5,a5,1
  100098:	fe079ae3          	bnez	a5,10008c <bootloader_main+0x38>
        putchar(*s++);
  10009c:	00150513          	addi	a0,a0,1
  1000a0:	00a587b3          	add	a5,a1,a0
    mmio_w32(UART_MMIO_BASE + UART_TX, (uint32_t)(uint8_t)ch);
  1000a4:	0ff67613          	zext.b	a2,a2
    *(volatile uint32_t*)addr = v;
  1000a8:	00c6a023          	sw	a2,0(a3)
    while (*s) {
  1000ac:	0007c603          	lbu	a2,0(a5)
  1000b0:	fee510e3          	bne	a0,a4,100090 <bootloader_main+0x3c>
  1000b4:	10006537          	lui	a0,0x10006
  1000b8:	00400593          	li	a1,4
    PSC_SD_IF_CTRL = SD_CTRL_FIFO_FLUSH;
  1000bc:	00b52423          	sw	a1,8(a0) # 10006008 <_stack_top+0xfefa248>
  1000c0:	f9c00513          	li	a0,-100
    while (n--) {
  1000c4:	00150513          	addi	a0,a0,1
        __asm__ __volatile__("nop");
  1000c8:	00000013          	nop
    while (n--) {
  1000cc:	fe051ce3          	bnez	a0,1000c4 <bootloader_main+0x70>
  1000d0:	05300613          	li	a2,83
  1000d4:	001035b7          	lui	a1,0x103
  1000d8:	43b58593          	addi	a1,a1,1083 # 10343b <$d.3+0x29>
  1000dc:	100006b7          	lui	a3,0x10000
  1000e0:	00e00713          	li	a4,14
  1000e4:	0080006f          	j	1000ec <bootloader_main+0x98>
        __asm__ __volatile__("nop");
  1000e8:	00000013          	nop
    return *(volatile uint32_t*)addr;
  1000ec:	0086a783          	lw	a5,8(a3) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  1000f0:	0017f793          	andi	a5,a5,1
  1000f4:	fe079ae3          	bnez	a5,1000e8 <bootloader_main+0x94>
        putchar(*s++);
  1000f8:	00150513          	addi	a0,a0,1
  1000fc:	00a587b3          	add	a5,a1,a0
    mmio_w32(UART_MMIO_BASE + UART_TX, (uint32_t)(uint8_t)ch);
  100100:	0ff67613          	zext.b	a2,a2
    *(volatile uint32_t*)addr = v;
  100104:	00c6a023          	sw	a2,0(a3)
    while (*s) {
  100108:	0007c603          	lbu	a2,0(a5)
  10010c:	fee510e3          	bne	a0,a4,1000ec <bootloader_main+0x98>
  100110:	10006537          	lui	a0,0x10006
  100114:	00100593          	li	a1,1
    PSC_SD_IF_CTRL = SD_CTRL_INIT_TRIG;
  100118:	00b52423          	sw	a1,8(a0) # 10006008 <_stack_top+0xfefa248>
  10011c:	f9c00513          	li	a0,-100
    while (n--) {
  100120:	00150513          	addi	a0,a0,1
        __asm__ __volatile__("nop");
  100124:	00000013          	nop
    while (n--) {
  100128:	fe051ce3          	bnez	a0,100120 <bootloader_main+0xcc>
  10012c:	10006537          	lui	a0,0x10006
    while (PSC_SD_IF_CTRL & SD_ST_BUSY) {
  100130:	00852583          	lw	a1,8(a0) # 10006008 <_stack_top+0xfefa248>
  100134:	0025f593          	andi	a1,a1,2
  100138:	02058263          	beqz	a1,10015c <bootloader_main+0x108>
  10013c:	ffff45b7          	lui	a1,0xffff4
  100140:	cb058593          	addi	a1,a1,-848 # ffff3cb0 <_stack_top+0xffee7ef0>
        if (--timeout == 0u) {
  100144:	00158593          	addi	a1,a1,1
  100148:	0e058263          	beqz	a1,10022c <bootloader_main+0x1d8>
    __asm__ __volatile__("nop");
  10014c:	00000013          	nop
    while (PSC_SD_IF_CTRL & SD_ST_BUSY) {
  100150:	00852603          	lw	a2,8(a0)
  100154:	00267613          	andi	a2,a2,2
  100158:	fe0616e3          	bnez	a2,100144 <bootloader_main+0xf0>
  10015c:	f9c00513          	li	a0,-100
    while (n--) {
  100160:	00150513          	addi	a0,a0,1
        __asm__ __volatile__("nop");
  100164:	00000013          	nop
    while (n--) {
  100168:	fe051ce3          	bnez	a0,100160 <bootloader_main+0x10c>
    if (sd_init_if_needed()) {
        bl_print("SD init failed\n");
        for (;;) {}
    }

    if (boot_fat32_mount(boot_sd_read_sector)) {
  10016c:	00100537          	lui	a0,0x100
  100170:	48450513          	addi	a0,a0,1156 # 100484 <boot_sd_read_sector>
  100174:	00002097          	auipc	ra,0x2
  100178:	9b0080e7          	jalr	-1616(ra) # 101b24 <boot_fat32_mount>
  10017c:	04050663          	beqz	a0,1001c8 <bootloader_main+0x174>
  100180:	00000513          	li	a0,0
  100184:	04600613          	li	a2,70
  100188:	001035b7          	lui	a1,0x103
  10018c:	37658593          	addi	a1,a1,886 # 103376 <$d.1+0x24c>
  100190:	100006b7          	lui	a3,0x10000
  100194:	01300713          	li	a4,19
  100198:	0080006f          	j	1001a0 <bootloader_main+0x14c>
        __asm__ __volatile__("nop");
  10019c:	00000013          	nop
    return *(volatile uint32_t*)addr;
  1001a0:	0086a783          	lw	a5,8(a3) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  1001a4:	0017f793          	andi	a5,a5,1
  1001a8:	fe079ae3          	bnez	a5,10019c <bootloader_main+0x148>
        putchar(*s++);
  1001ac:	00150513          	addi	a0,a0,1
  1001b0:	00a587b3          	add	a5,a1,a0
    mmio_w32(UART_MMIO_BASE + UART_TX, (uint32_t)(uint8_t)ch);
  1001b4:	0ff67613          	zext.b	a2,a2
    *(volatile uint32_t*)addr = v;
  1001b8:	00c6a023          	sw	a2,0(a3)
    while (*s) {
  1001bc:	0007c603          	lbu	a2,0(a5)
  1001c0:	fee510e3          	bne	a0,a4,1001a0 <bootloader_main+0x14c>
        bl_print("FAT32 mount failed\n");
        for (;;) {}
  1001c4:	0000006f          	j	1001c4 <bootloader_main+0x170>
    }

    if (boot_fat32_load_mem_file("KERNEL.MEM", KERNEL_LOAD_ADDR, &kernel_words)) {
  1001c8:	00103537          	lui	a0,0x103
  1001cc:	23550513          	addi	a0,a0,565 # 103235 <$d.1+0x10b>
  1001d0:	002005b7          	lui	a1,0x200
  1001d4:	00c10613          	addi	a2,sp,12
  1001d8:	00003097          	auipc	ra,0x3
  1001dc:	950080e7          	jalr	-1712(ra) # 102b28 <boot_fat32_load_mem_file>
  1001e0:	0c050c63          	beqz	a0,1002b8 <bootloader_main+0x264>
  1001e4:	00000513          	li	a0,0
  1001e8:	04b00613          	li	a2,75
  1001ec:	001035b7          	lui	a1,0x103
  1001f0:	0b758593          	addi	a1,a1,183 # 1030b7 <__modsi3+0x103>
  1001f4:	100006b7          	lui	a3,0x10000
  1001f8:	01700713          	li	a4,23
  1001fc:	0080006f          	j	100204 <bootloader_main+0x1b0>
        __asm__ __volatile__("nop");
  100200:	00000013          	nop
    return *(volatile uint32_t*)addr;
  100204:	0086a783          	lw	a5,8(a3) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100208:	0017f793          	andi	a5,a5,1
  10020c:	fe079ae3          	bnez	a5,100200 <bootloader_main+0x1ac>
        putchar(*s++);
  100210:	00150513          	addi	a0,a0,1
  100214:	00a587b3          	add	a5,a1,a0
    mmio_w32(UART_MMIO_BASE + UART_TX, (uint32_t)(uint8_t)ch);
  100218:	0ff67613          	zext.b	a2,a2
    *(volatile uint32_t*)addr = v;
  10021c:	00c6a023          	sw	a2,0(a3)
    while (*s) {
  100220:	0007c603          	lbu	a2,0(a5)
  100224:	fee510e3          	bne	a0,a4,100204 <bootloader_main+0x1b0>
        bl_print("KERNEL.MEM load failed\n");
        for (;;) {}
  100228:	0000006f          	j	100228 <bootloader_main+0x1d4>
  10022c:	00000513          	li	a0,0
  100230:	05300613          	li	a2,83
  100234:	001035b7          	lui	a1,0x103
  100238:	73f58593          	addi	a1,a1,1855 # 10373f <$d.1+0x8a>
  10023c:	100006b7          	lui	a3,0x10000
  100240:	01000713          	li	a4,16
  100244:	0080006f          	j	10024c <bootloader_main+0x1f8>
        __asm__ __volatile__("nop");
  100248:	00000013          	nop
    return *(volatile uint32_t*)addr;
  10024c:	0086a783          	lw	a5,8(a3) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100250:	0017f793          	andi	a5,a5,1
  100254:	fe079ae3          	bnez	a5,100248 <bootloader_main+0x1f4>
        putchar(*s++);
  100258:	00150513          	addi	a0,a0,1
  10025c:	00a587b3          	add	a5,a1,a0
    mmio_w32(UART_MMIO_BASE + UART_TX, (uint32_t)(uint8_t)ch);
  100260:	0ff67613          	zext.b	a2,a2
    *(volatile uint32_t*)addr = v;
  100264:	00c6a023          	sw	a2,0(a3)
    while (*s) {
  100268:	0007c603          	lbu	a2,0(a5)
  10026c:	fee510e3          	bne	a0,a4,10024c <bootloader_main+0x1f8>
  100270:	00000513          	li	a0,0
  100274:	05300613          	li	a2,83
  100278:	001035b7          	lui	a1,0x103
  10027c:	5ba58593          	addi	a1,a1,1466 # 1035ba <$d.3+0x1a8>
  100280:	100006b7          	lui	a3,0x10000
  100284:	00f00713          	li	a4,15
  100288:	0080006f          	j	100290 <bootloader_main+0x23c>
        __asm__ __volatile__("nop");
  10028c:	00000013          	nop
    return *(volatile uint32_t*)addr;
  100290:	0086a783          	lw	a5,8(a3) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100294:	0017f793          	andi	a5,a5,1
  100298:	fe079ae3          	bnez	a5,10028c <bootloader_main+0x238>
        putchar(*s++);
  10029c:	00150513          	addi	a0,a0,1
  1002a0:	00a587b3          	add	a5,a1,a0
    mmio_w32(UART_MMIO_BASE + UART_TX, (uint32_t)(uint8_t)ch);
  1002a4:	0ff67613          	zext.b	a2,a2
    *(volatile uint32_t*)addr = v;
  1002a8:	00c6a023          	sw	a2,0(a3)
    while (*s) {
  1002ac:	0007c603          	lbu	a2,0(a5)
  1002b0:	fee510e3          	bne	a0,a4,100290 <bootloader_main+0x23c>
        for (;;) {}
  1002b4:	0000006f          	j	1002b4 <bootloader_main+0x260>
    }

    if (boot_fat32_load_mem_file("USER.MEM", USER_LOAD_ADDR, &user_words)) {
  1002b8:	00103537          	lui	a0,0x103
  1002bc:	73650513          	addi	a0,a0,1846 # 103736 <$d.1+0x81>
  1002c0:	004005b7          	lui	a1,0x400
  1002c4:	00810613          	addi	a2,sp,8
  1002c8:	004004b7          	lui	s1,0x400
  1002cc:	00003097          	auipc	ra,0x3
  1002d0:	85c080e7          	jalr	-1956(ra) # 102b28 <boot_fat32_load_mem_file>
  1002d4:	04050663          	beqz	a0,100320 <bootloader_main+0x2cc>
  1002d8:	00000513          	li	a0,0
  1002dc:	05500613          	li	a2,85
  1002e0:	001035b7          	lui	a1,0x103
  1002e4:	10458593          	addi	a1,a1,260 # 103104 <__modsi3+0x150>
  1002e8:	100006b7          	lui	a3,0x10000
  1002ec:	01500713          	li	a4,21
  1002f0:	0080006f          	j	1002f8 <bootloader_main+0x2a4>
        __asm__ __volatile__("nop");
  1002f4:	00000013          	nop
    return *(volatile uint32_t*)addr;
  1002f8:	0086a783          	lw	a5,8(a3) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  1002fc:	0017f793          	andi	a5,a5,1
  100300:	fe079ae3          	bnez	a5,1002f4 <bootloader_main+0x2a0>
        putchar(*s++);
  100304:	00150513          	addi	a0,a0,1
  100308:	00a587b3          	add	a5,a1,a0
    mmio_w32(UART_MMIO_BASE + UART_TX, (uint32_t)(uint8_t)ch);
  10030c:	0ff67613          	zext.b	a2,a2
    *(volatile uint32_t*)addr = v;
  100310:	00c6a023          	sw	a2,0(a3)
    while (*s) {
  100314:	0007c603          	lbu	a2,0(a5)
  100318:	fee510e3          	bne	a0,a4,1002f8 <bootloader_main+0x2a4>
        bl_print("USER.MEM load failed\n");
        for (;;) {}
  10031c:	0000006f          	j	10031c <bootloader_main+0x2c8>
    }

    bl_print("kernel words=");
  100320:	00103537          	lui	a0,0x103
  100324:	6da50513          	addi	a0,a0,1754 # 1036da <$d.1+0x25>
  100328:	00000097          	auipc	ra,0x0
  10032c:	124080e7          	jalr	292(ra) # 10044c <bl_print>
    bl_print_hex(kernel_words);
  100330:	00c12503          	lw	a0,12(sp)
  100334:	00001097          	auipc	ra,0x1
  100338:	95c080e7          	jalr	-1700(ra) # 100c90 <bl_print_hex>
    bl_print("\n");
  10033c:	00103537          	lui	a0,0x103
  100340:	4e950413          	addi	s0,a0,1257 # 1034e9 <$d.3+0xd7>
  100344:	00040513          	mv	a0,s0
  100348:	00000097          	auipc	ra,0x0
  10034c:	104080e7          	jalr	260(ra) # 10044c <bl_print>

    bl_print("user words=");
  100350:	00103537          	lui	a0,0x103
  100354:	38a50513          	addi	a0,a0,906 # 10338a <$d.1+0x260>
  100358:	00000097          	auipc	ra,0x0
  10035c:	0f4080e7          	jalr	244(ra) # 10044c <bl_print>
    bl_print_hex(user_words);
  100360:	00812503          	lw	a0,8(sp)
  100364:	00001097          	auipc	ra,0x1
  100368:	92c080e7          	jalr	-1748(ra) # 100c90 <bl_print_hex>
    bl_print("\n");
  10036c:	00040513          	mv	a0,s0
  100370:	00000097          	auipc	ra,0x0
  100374:	0dc080e7          	jalr	220(ra) # 10044c <bl_print>

    bl_print("JUMP TO ");
  100378:	00103537          	lui	a0,0x103
  10037c:	21750513          	addi	a0,a0,535 # 103217 <$d.1+0xed>
  100380:	00000097          	auipc	ra,0x0
  100384:	0cc080e7          	jalr	204(ra) # 10044c <bl_print>
    bl_print_hex(KERNEL_LOAD_ADDR);
  100388:	00200537          	lui	a0,0x200
  10038c:	00200937          	lui	s2,0x200
  100390:	00001097          	auipc	ra,0x1
  100394:	900080e7          	jalr	-1792(ra) # 100c90 <bl_print_hex>
    bl_print("\n");
  100398:	00040513          	mv	a0,s0
  10039c:	00000097          	auipc	ra,0x0
  1003a0:	0b0080e7          	jalr	176(ra) # 10044c <bl_print>

    bl_print("kernel[0]=");
  1003a4:	00103537          	lui	a0,0x103
  1003a8:	52650513          	addi	a0,a0,1318 # 103526 <$d.3+0x114>
  1003ac:	00000097          	auipc	ra,0x0
  1003b0:	0a0080e7          	jalr	160(ra) # 10044c <bl_print>
    bl_print_hex(*(volatile uint32_t *)0x00200000);
  1003b4:	00092503          	lw	a0,0(s2) # 200000 <_stack_top+0xf4240>
  1003b8:	00001097          	auipc	ra,0x1
  1003bc:	8d8080e7          	jalr	-1832(ra) # 100c90 <bl_print_hex>
    bl_print("\n");
  1003c0:	00040513          	mv	a0,s0
  1003c4:	00000097          	auipc	ra,0x0
  1003c8:	088080e7          	jalr	136(ra) # 10044c <bl_print>

    bl_print("kernel[1]=");
  1003cc:	00103537          	lui	a0,0x103
  1003d0:	24050513          	addi	a0,a0,576 # 103240 <$d.1+0x116>
  1003d4:	00000097          	auipc	ra,0x0
  1003d8:	078080e7          	jalr	120(ra) # 10044c <bl_print>
    bl_print_hex(*(volatile uint32_t *)0x00200004);
  1003dc:	00492503          	lw	a0,4(s2)
  1003e0:	00001097          	auipc	ra,0x1
  1003e4:	8b0080e7          	jalr	-1872(ra) # 100c90 <bl_print_hex>
    bl_print("\n");
  1003e8:	00040513          	mv	a0,s0
  1003ec:	00000097          	auipc	ra,0x0
  1003f0:	060080e7          	jalr	96(ra) # 10044c <bl_print>

    bl_print("kernel[2]=");
  1003f4:	00103537          	lui	a0,0x103
  1003f8:	02b50513          	addi	a0,a0,43 # 10302b <__modsi3+0x77>
  1003fc:	00000097          	auipc	ra,0x0
  100400:	050080e7          	jalr	80(ra) # 10044c <bl_print>
    bl_print_hex(*(volatile uint32_t *)0x00200008);
  100404:	00892503          	lw	a0,8(s2)
  100408:	00001097          	auipc	ra,0x1
  10040c:	888080e7          	jalr	-1912(ra) # 100c90 <bl_print_hex>
    bl_print("\n");
  100410:	00040513          	mv	a0,s0
  100414:	00000097          	auipc	ra,0x0
  100418:	038080e7          	jalr	56(ra) # 10044c <bl_print>

    bl_print("user[0]=");
  10041c:	00103537          	lui	a0,0x103
  100420:	53150513          	addi	a0,a0,1329 # 103531 <$d.3+0x11f>
  100424:	00000097          	auipc	ra,0x0
  100428:	028080e7          	jalr	40(ra) # 10044c <bl_print>
    bl_print_hex(*(volatile uint32_t *)0x00400000);
  10042c:	0004a503          	lw	a0,0(s1) # 400000 <_stack_top+0x2f4240>
  100430:	00001097          	auipc	ra,0x1
  100434:	860080e7          	jalr	-1952(ra) # 100c90 <bl_print_hex>
    bl_print("\n");
  100438:	00040513          	mv	a0,s0
  10043c:	00000097          	auipc	ra,0x0
  100440:	010080e7          	jalr	16(ra) # 10044c <bl_print>
    entry();
  100444:	000900e7          	jalr	s2

    jump_to_kernel(KERNEL_LOAD_ADDR);

    for (;;) {}
  100448:	0000006f          	j	100448 <bootloader_main+0x3f4>

0010044c <bl_print>:
    while (*s) {
  10044c:	00054583          	lbu	a1,0(a0)
  100450:	02058863          	beqz	a1,100480 <bl_print+0x34>
  100454:	10000637          	lui	a2,0x10000
  100458:	0080006f          	j	100460 <bl_print+0x14>
        __asm__ __volatile__("nop");
  10045c:	00000013          	nop
    return *(volatile uint32_t*)addr;
  100460:	00862683          	lw	a3,8(a2) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100464:	0016f693          	andi	a3,a3,1
  100468:	fe069ae3          	bnez	a3,10045c <bl_print+0x10>
        putchar(*s++);
  10046c:	00150513          	addi	a0,a0,1
    mmio_w32(UART_MMIO_BASE + UART_TX, (uint32_t)(uint8_t)ch);
  100470:	0ff5f593          	zext.b	a1,a1
    *(volatile uint32_t*)addr = v;
  100474:	00b62023          	sw	a1,0(a2)
    while (*s) {
  100478:	00054583          	lbu	a1,0(a0)
  10047c:	fe0592e3          	bnez	a1,100460 <bl_print+0x14>
}
  100480:	00008067          	ret

00100484 <boot_sd_read_sector>:
{
  100484:	fd010113          	addi	sp,sp,-48
  100488:	02812623          	sw	s0,44(sp)
  10048c:	02912423          	sw	s1,40(sp)
  100490:	03212223          	sw	s2,36(sp)
  100494:	03312023          	sw	s3,32(sp)
  100498:	01412e23          	sw	s4,28(sp)
  10049c:	01512c23          	sw	s5,24(sp)
  1004a0:	01612a23          	sw	s6,20(sp)
  1004a4:	01712823          	sw	s7,16(sp)
  1004a8:	01812623          	sw	s8,12(sp)
  1004ac:	01912423          	sw	s9,8(sp)
  1004b0:	01a12223          	sw	s10,4(sp)
  1004b4:	01b12023          	sw	s11,0(sp)
  1004b8:	00000613          	li	a2,0
    for (uint32_t retry = 0; retry < SD_READ_RETRY_MAX; retry++) {
  1004bc:	20058693          	addi	a3,a1,512
  1004c0:	10006737          	lui	a4,0x10006
  1004c4:	00400793          	li	a5,4
  1004c8:	00200813          	li	a6,2
  1004cc:	ffff48b7          	lui	a7,0xffff4
  1004d0:	cb088293          	addi	t0,a7,-848 # ffff3cb0 <_stack_top+0xffee7ef0>
  1004d4:	20000313          	li	t1,512
  1004d8:	000013b7          	lui	t2,0x1
  1004dc:	02138393          	addi	t2,t2,33 # 1021 <$d.10+0xa9>
  1004e0:	00103e37          	lui	t3,0x103
  1004e4:	5cae0e13          	addi	t3,t3,1482 # 1035ca <$d.3+0x1b8>
  1004e8:	10000eb7          	lui	t4,0x10000
  1004ec:	00b00f13          	li	t5,11
  1004f0:	00a00f93          	li	t6,10
  1004f4:	02000413          	li	s0,32
  1004f8:	07300493          	li	s1,115
  1004fc:	07700913          	li	s2,119
  100500:	03d00993          	li	s3,61
  100504:	06800a13          	li	s4,104
  100508:	00300a93          	li	s5,3
        PSC_SD_IF_CTRL = SD_CTRL_FIFO_FLUSH;
  10050c:	00f72423          	sw	a5,8(a4) # 10006008 <_stack_top+0xfefa248>
        __asm__ __volatile__("nop");
  100510:	00000013          	nop
  100514:	00000013          	nop
  100518:	00000013          	nop
  10051c:	00000013          	nop
  100520:	00000013          	nop
  100524:	00000013          	nop
  100528:	00000013          	nop
  10052c:	00000013          	nop
  100530:	00000013          	nop
  100534:	00000013          	nop
  100538:	00000013          	nop
  10053c:	00000013          	nop
  100540:	00000013          	nop
  100544:	00000013          	nop
  100548:	00000013          	nop
  10054c:	00000013          	nop
  100550:	00000013          	nop
  100554:	00000013          	nop
  100558:	00000013          	nop
  10055c:	00000013          	nop
  100560:	00000013          	nop
  100564:	00000013          	nop
  100568:	00000013          	nop
  10056c:	00000013          	nop
  100570:	00000013          	nop
  100574:	00000013          	nop
  100578:	00000013          	nop
  10057c:	00000013          	nop
  100580:	00000013          	nop
  100584:	00000013          	nop
  100588:	00000013          	nop
  10058c:	00000013          	nop
  100590:	00000013          	nop
  100594:	00000013          	nop
  100598:	00000013          	nop
  10059c:	00000013          	nop
  1005a0:	00000013          	nop
  1005a4:	00000013          	nop
  1005a8:	00000013          	nop
  1005ac:	00000013          	nop
  1005b0:	00000013          	nop
  1005b4:	00000013          	nop
  1005b8:	00000013          	nop
  1005bc:	00000013          	nop
  1005c0:	00000013          	nop
  1005c4:	00000013          	nop
  1005c8:	00000013          	nop
  1005cc:	00000013          	nop
  1005d0:	00000013          	nop
  1005d4:	00000013          	nop
        PSC_SD_SECTOR = lba;
  1005d8:	00a72223          	sw	a0,4(a4)
        PSC_SD_IF_CTRL = SD_CTRL_READ_TRIG;
  1005dc:	01072423          	sw	a6,8(a4)
        __asm__ __volatile__("nop");
  1005e0:	00000013          	nop
  1005e4:	00000013          	nop
  1005e8:	00000013          	nop
  1005ec:	00000013          	nop
  1005f0:	00000013          	nop
  1005f4:	00000013          	nop
  1005f8:	00000013          	nop
  1005fc:	00000013          	nop
  100600:	00000013          	nop
  100604:	00000013          	nop
  100608:	00000013          	nop
  10060c:	00000013          	nop
  100610:	00000013          	nop
  100614:	00000013          	nop
  100618:	00000013          	nop
  10061c:	00000013          	nop
  100620:	00000013          	nop
  100624:	00000013          	nop
  100628:	00000013          	nop
  10062c:	00000013          	nop
  100630:	00000013          	nop
  100634:	00000013          	nop
  100638:	00000013          	nop
  10063c:	00000013          	nop
  100640:	00000013          	nop
  100644:	00000013          	nop
  100648:	00000013          	nop
  10064c:	00000013          	nop
  100650:	00000013          	nop
  100654:	00000013          	nop
  100658:	00000013          	nop
  10065c:	00000013          	nop
  100660:	00000013          	nop
  100664:	00000013          	nop
  100668:	00000013          	nop
  10066c:	00000013          	nop
  100670:	00000013          	nop
  100674:	00000013          	nop
  100678:	00000013          	nop
  10067c:	00000013          	nop
  100680:	00000013          	nop
  100684:	00000013          	nop
  100688:	00000013          	nop
  10068c:	00000013          	nop
  100690:	00000013          	nop
  100694:	00000013          	nop
  100698:	00000013          	nop
  10069c:	00000013          	nop
  1006a0:	00000013          	nop
  1006a4:	00000013          	nop
        while ((PSC_SD_IF_CTRL & SD_ST_READ_READY) == 0u) {
  1006a8:	00872b03          	lw	s6,8(a4)
  1006ac:	004b7b13          	andi	s6,s6,4
  1006b0:	020b1063          	bnez	s6,1006d0 <boot_sd_read_sector+0x24c>
  1006b4:	00028b13          	mv	s6,t0
            if (--timeout == 0u) {
  1006b8:	001b0b13          	addi	s6,s6,1
  1006bc:	4c0b0e63          	beqz	s6,100b98 <boot_sd_read_sector+0x714>
    __asm__ __volatile__("nop");
  1006c0:	00000013          	nop
        while ((PSC_SD_IF_CTRL & SD_ST_READ_READY) == 0u) {
  1006c4:	00872b83          	lw	s7,8(a4)
  1006c8:	004bfb93          	andi	s7,s7,4
  1006cc:	fe0b86e3          	beqz	s7,1006b8 <boot_sd_read_sector+0x234>
  1006d0:	00000b13          	li	s6,0
        __asm__ __volatile__("nop");
  1006d4:	00000013          	nop
  1006d8:	00000013          	nop
  1006dc:	00000013          	nop
  1006e0:	00000013          	nop
  1006e4:	00000013          	nop
  1006e8:	00000013          	nop
  1006ec:	00000013          	nop
  1006f0:	00000013          	nop
  1006f4:	00000013          	nop
  1006f8:	00000013          	nop
  1006fc:	00000013          	nop
  100700:	00000013          	nop
  100704:	00000013          	nop
  100708:	00000013          	nop
  10070c:	00000013          	nop
  100710:	00000013          	nop
  100714:	00000013          	nop
  100718:	00000013          	nop
  10071c:	00000013          	nop
  100720:	00000013          	nop
  100724:	0180006f          	j	10073c <boot_sd_read_sector+0x2b8>
            dst[i] = (uint8_t)(PSC_SD_ADDR & 0xFFu);
  100728:	00072b83          	lw	s7,0(a4)
  10072c:	01658c33          	add	s8,a1,s6
        for (int i = 0; i < 512; i++) {
  100730:	001b0b13          	addi	s6,s6,1
            dst[i] = (uint8_t)(PSC_SD_ADDR & 0xFFu);
  100734:	017c0023          	sb	s7,0(s8)
        for (int i = 0; i < 512; i++) {
  100738:	026b0863          	beq	s6,t1,100768 <boot_sd_read_sector+0x2e4>
            while (PSC_SD_IF_CTRL & SD_ST_FIFO_EMPTY) {
  10073c:	00872b83          	lw	s7,8(a4)
  100740:	008bfb93          	andi	s7,s7,8
  100744:	fe0b82e3          	beqz	s7,100728 <boot_sd_read_sector+0x2a4>
  100748:	cb088b93          	addi	s7,a7,-848
                if (--timeout == 0u) {
  10074c:	001b8b93          	addi	s7,s7,1
  100750:	3a0b8063          	beqz	s7,100af0 <boot_sd_read_sector+0x66c>
    __asm__ __volatile__("nop");
  100754:	00000013          	nop
            while (PSC_SD_IF_CTRL & SD_ST_FIFO_EMPTY) {
  100758:	00872c03          	lw	s8,8(a4)
  10075c:	008c7c13          	andi	s8,s8,8
  100760:	fe0c16e3          	bnez	s8,10074c <boot_sd_read_sector+0x2c8>
  100764:	fc5ff06f          	j	100728 <boot_sd_read_sector+0x2a4>
  100768:	00000b93          	li	s7,0
  10076c:	00058b13          	mv	s6,a1
        crc ^= (uint16_t)((uint16_t)buf[i] << 8);
  100770:	000b4c03          	lbu	s8,0(s6)
  100774:	008c1c13          	slli	s8,s8,0x8
  100778:	017c4bb3          	xor	s7,s8,s7
  10077c:	010b9c13          	slli	s8,s7,0x10
  100780:	410c5c13          	srai	s8,s8,0x10
            if (crc & 0x8000u)
  100784:	011b9c93          	slli	s9,s7,0x11
  100788:	410cdc93          	srai	s9,s9,0x10
  10078c:	001b9d13          	slli	s10,s7,0x1
  100790:	00fc5c13          	srli	s8,s8,0xf
  100794:	007c7c33          	and	s8,s8,t2
  100798:	018d4c33          	xor	s8,s10,s8
  10079c:	001c1d13          	slli	s10,s8,0x1
  1007a0:	012b9d93          	slli	s11,s7,0x12
  1007a4:	410ddd93          	srai	s11,s11,0x10
  1007a8:	00fcdc93          	srli	s9,s9,0xf
  1007ac:	007cfcb3          	and	s9,s9,t2
  1007b0:	019d4cb3          	xor	s9,s10,s9
  1007b4:	001c9d13          	slli	s10,s9,0x1
  1007b8:	013b9b93          	slli	s7,s7,0x13
  1007bc:	410bdb93          	srai	s7,s7,0x10
  1007c0:	00fddd93          	srli	s11,s11,0xf
  1007c4:	007dfdb3          	and	s11,s11,t2
  1007c8:	01bd4d33          	xor	s10,s10,s11
  1007cc:	013c1c13          	slli	s8,s8,0x13
  1007d0:	410c5c13          	srai	s8,s8,0x10
  1007d4:	001d1d93          	slli	s11,s10,0x1
  1007d8:	00fbdb93          	srli	s7,s7,0xf
  1007dc:	007bfbb3          	and	s7,s7,t2
  1007e0:	017dcbb3          	xor	s7,s11,s7
  1007e4:	013c9c93          	slli	s9,s9,0x13
  1007e8:	410cdc93          	srai	s9,s9,0x10
  1007ec:	00fc5c13          	srli	s8,s8,0xf
  1007f0:	007c7c33          	and	s8,s8,t2
  1007f4:	001c1c13          	slli	s8,s8,0x1
  1007f8:	002b9d93          	slli	s11,s7,0x2
  1007fc:	013d1d13          	slli	s10,s10,0x13
  100800:	410d5d13          	srai	s10,s10,0x10
  100804:	00fcdc93          	srli	s9,s9,0xf
  100808:	007cfcb3          	and	s9,s9,t2
  10080c:	019c4c33          	xor	s8,s8,s9
  100810:	018dcc33          	xor	s8,s11,s8
  100814:	013b9b93          	slli	s7,s7,0x13
  100818:	410bdb93          	srai	s7,s7,0x10
  10081c:	00fd5c93          	srli	s9,s10,0xf
  100820:	007cfcb3          	and	s9,s9,t2
  100824:	002c1c13          	slli	s8,s8,0x2
  100828:	001c9c93          	slli	s9,s9,0x1
  10082c:	019c4c33          	xor	s8,s8,s9
  100830:	00fbdb93          	srli	s7,s7,0xf
  100834:	007bfbb3          	and	s7,s7,t2
    for (int i = 0; i < 512; i++) {
  100838:	001b0b13          	addi	s6,s6,1
            if (crc & 0x8000u)
  10083c:	017c4bb3          	xor	s7,s8,s7
    for (int i = 0; i < 512; i++) {
  100840:	f2db18e3          	bne	s6,a3,100770 <boot_sd_read_sector+0x2ec>
    uint32_t ctrl = PSC_SD_IF_CTRL;
  100844:	00872b03          	lw	s6,8(a4)
    uint8_t crc2_hw = (uint8_t)((ctrl >> 16) & 0xFFu);
  100848:	010b5b13          	srli	s6,s6,0x10
            if (crc_sw == crc_hw)
  10084c:	010b9b93          	slli	s7,s7,0x10
  100850:	010bdb93          	srli	s7,s7,0x10
  100854:	436b8a63          	beq	s7,s6,100c88 <boot_sd_read_sector+0x804>
  100858:	00000c13          	li	s8,0
  10085c:	04300c93          	li	s9,67
  100860:	0080006f          	j	100868 <boot_sd_read_sector+0x3e4>
        __asm__ __volatile__("nop");
  100864:	00000013          	nop
    return *(volatile uint32_t*)addr;
  100868:	008ead03          	lw	s10,8(t4) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  10086c:	001d7d13          	andi	s10,s10,1
  100870:	fe0d1ae3          	bnez	s10,100864 <boot_sd_read_sector+0x3e0>
        putchar(*s++);
  100874:	001c0c13          	addi	s8,s8,1
  100878:	018e0d33          	add	s10,t3,s8
    mmio_w32(UART_MMIO_BASE + UART_TX, (uint32_t)(uint8_t)ch);
  10087c:	0ffcfc93          	zext.b	s9,s9
    *(volatile uint32_t*)addr = v;
  100880:	019ea023          	sw	s9,0(t4)
    while (*s) {
  100884:	000d4c83          	lbu	s9,0(s10)
  100888:	ffec10e3          	bne	s8,t5,100868 <boot_sd_read_sector+0x3e4>
  10088c:	00700c93          	li	s9,7
  100890:	000c8c13          	mv	s8,s9
        uint8_t n = (uint8_t)((v >> (i * 4)) & 0xFu);
  100894:	002c9c93          	slli	s9,s9,0x2
  100898:	01955cb3          	srl	s9,a0,s9
  10089c:	00fcfc93          	andi	s9,s9,15
        putchar(n < 10 ? (char)('0' + n) : (char)('A' + n - 10));
  1008a0:	01fce663          	bltu	s9,t6,1008ac <boot_sd_read_sector+0x428>
  1008a4:	037c8c93          	addi	s9,s9,55
  1008a8:	0100006f          	j	1008b8 <boot_sd_read_sector+0x434>
  1008ac:	030c8c93          	addi	s9,s9,48
  1008b0:	0080006f          	j	1008b8 <boot_sd_read_sector+0x434>
        __asm__ __volatile__("nop");
  1008b4:	00000013          	nop
    return *(volatile uint32_t*)addr;
  1008b8:	008ead03          	lw	s10,8(t4)
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  1008bc:	001d7d13          	andi	s10,s10,1
  1008c0:	fe0d1ae3          	bnez	s10,1008b4 <boot_sd_read_sector+0x430>
    *(volatile uint32_t*)addr = v;
  1008c4:	019ea023          	sw	s9,0(t4)
    for (int i = 7; i >= 0; i--) {
  1008c8:	fffc0c93          	addi	s9,s8,-1
  1008cc:	fc0c12e3          	bnez	s8,100890 <boot_sd_read_sector+0x40c>
  1008d0:	0080006f          	j	1008d8 <boot_sd_read_sector+0x454>
        __asm__ __volatile__("nop");
  1008d4:	00000013          	nop
    return *(volatile uint32_t*)addr;
  1008d8:	008eac03          	lw	s8,8(t4)
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  1008dc:	001c7c13          	andi	s8,s8,1
  1008e0:	fe0c1ae3          	bnez	s8,1008d4 <boot_sd_read_sector+0x450>
    *(volatile uint32_t*)addr = v;
  1008e4:	008ea023          	sw	s0,0(t4)
    return *(volatile uint32_t*)addr;
  1008e8:	008eac03          	lw	s8,8(t4)
  1008ec:	001c7c13          	andi	s8,s8,1
  1008f0:	000c0663          	beqz	s8,1008fc <boot_sd_read_sector+0x478>
        __asm__ __volatile__("nop");
  1008f4:	00000013          	nop
  1008f8:	ff1ff06f          	j	1008e8 <boot_sd_read_sector+0x464>
    *(volatile uint32_t*)addr = v;
  1008fc:	009ea023          	sw	s1,0(t4)
    return *(volatile uint32_t*)addr;
  100900:	008eac03          	lw	s8,8(t4)
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100904:	001c7c13          	andi	s8,s8,1
  100908:	000c0663          	beqz	s8,100914 <boot_sd_read_sector+0x490>
        __asm__ __volatile__("nop");
  10090c:	00000013          	nop
  100910:	ff1ff06f          	j	100900 <boot_sd_read_sector+0x47c>
    *(volatile uint32_t*)addr = v;
  100914:	012ea023          	sw	s2,0(t4)
    return *(volatile uint32_t*)addr;
  100918:	008eac03          	lw	s8,8(t4)
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  10091c:	001c7c13          	andi	s8,s8,1
  100920:	000c0663          	beqz	s8,10092c <boot_sd_read_sector+0x4a8>
        __asm__ __volatile__("nop");
  100924:	00000013          	nop
  100928:	ff1ff06f          	j	100918 <boot_sd_read_sector+0x494>
    *(volatile uint32_t*)addr = v;
  10092c:	013ea023          	sw	s3,0(t4)
  100930:	00700c93          	li	s9,7
  100934:	000c8c13          	mv	s8,s9
        uint8_t n = (uint8_t)((v >> (i * 4)) & 0xFu);
  100938:	002c9c93          	slli	s9,s9,0x2
  10093c:	019bdcb3          	srl	s9,s7,s9
  100940:	00fcfc93          	andi	s9,s9,15
        putchar(n < 10 ? (char)('0' + n) : (char)('A' + n - 10));
  100944:	01fce663          	bltu	s9,t6,100950 <boot_sd_read_sector+0x4cc>
  100948:	037c8c93          	addi	s9,s9,55
  10094c:	0100006f          	j	10095c <boot_sd_read_sector+0x4d8>
  100950:	030c8c93          	addi	s9,s9,48
  100954:	0080006f          	j	10095c <boot_sd_read_sector+0x4d8>
        __asm__ __volatile__("nop");
  100958:	00000013          	nop
    return *(volatile uint32_t*)addr;
  10095c:	008ead03          	lw	s10,8(t4)
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100960:	001d7d13          	andi	s10,s10,1
  100964:	fe0d1ae3          	bnez	s10,100958 <boot_sd_read_sector+0x4d4>
    *(volatile uint32_t*)addr = v;
  100968:	019ea023          	sw	s9,0(t4)
    for (int i = 7; i >= 0; i--) {
  10096c:	fffc0c93          	addi	s9,s8,-1
  100970:	fc0c12e3          	bnez	s8,100934 <boot_sd_read_sector+0x4b0>
  100974:	0080006f          	j	10097c <boot_sd_read_sector+0x4f8>
        __asm__ __volatile__("nop");
  100978:	00000013          	nop
    return *(volatile uint32_t*)addr;
  10097c:	008eab83          	lw	s7,8(t4)
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100980:	001bfb93          	andi	s7,s7,1
  100984:	fe0b9ae3          	bnez	s7,100978 <boot_sd_read_sector+0x4f4>
    *(volatile uint32_t*)addr = v;
  100988:	008ea023          	sw	s0,0(t4)
    return *(volatile uint32_t*)addr;
  10098c:	008eab83          	lw	s7,8(t4)
  100990:	001bfb93          	andi	s7,s7,1
  100994:	000b8663          	beqz	s7,1009a0 <boot_sd_read_sector+0x51c>
        __asm__ __volatile__("nop");
  100998:	00000013          	nop
  10099c:	ff1ff06f          	j	10098c <boot_sd_read_sector+0x508>
    *(volatile uint32_t*)addr = v;
  1009a0:	014ea023          	sw	s4,0(t4)
    return *(volatile uint32_t*)addr;
  1009a4:	008eab83          	lw	s7,8(t4)
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  1009a8:	001bfb93          	andi	s7,s7,1
  1009ac:	000b8663          	beqz	s7,1009b8 <boot_sd_read_sector+0x534>
        __asm__ __volatile__("nop");
  1009b0:	00000013          	nop
  1009b4:	ff1ff06f          	j	1009a4 <boot_sd_read_sector+0x520>
    *(volatile uint32_t*)addr = v;
  1009b8:	012ea023          	sw	s2,0(t4)
    return *(volatile uint32_t*)addr;
  1009bc:	008eab83          	lw	s7,8(t4)
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  1009c0:	001bfb93          	andi	s7,s7,1
  1009c4:	000b8663          	beqz	s7,1009d0 <boot_sd_read_sector+0x54c>
        __asm__ __volatile__("nop");
  1009c8:	00000013          	nop
  1009cc:	ff1ff06f          	j	1009bc <boot_sd_read_sector+0x538>
    *(volatile uint32_t*)addr = v;
  1009d0:	013ea023          	sw	s3,0(t4)
  1009d4:	00700c13          	li	s8,7
  1009d8:	000c0b93          	mv	s7,s8
        uint8_t n = (uint8_t)((v >> (i * 4)) & 0xFu);
  1009dc:	002c1c13          	slli	s8,s8,0x2
  1009e0:	018b5c33          	srl	s8,s6,s8
  1009e4:	00fc7c13          	andi	s8,s8,15
        putchar(n < 10 ? (char)('0' + n) : (char)('A' + n - 10));
  1009e8:	01fc6663          	bltu	s8,t6,1009f4 <boot_sd_read_sector+0x570>
  1009ec:	037c0c13          	addi	s8,s8,55
  1009f0:	0100006f          	j	100a00 <boot_sd_read_sector+0x57c>
  1009f4:	030c0c13          	addi	s8,s8,48
  1009f8:	0080006f          	j	100a00 <boot_sd_read_sector+0x57c>
        __asm__ __volatile__("nop");
  1009fc:	00000013          	nop
    return *(volatile uint32_t*)addr;
  100a00:	008eac83          	lw	s9,8(t4)
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100a04:	001cfc93          	andi	s9,s9,1
  100a08:	fe0c9ae3          	bnez	s9,1009fc <boot_sd_read_sector+0x578>
    *(volatile uint32_t*)addr = v;
  100a0c:	018ea023          	sw	s8,0(t4)
    for (int i = 7; i >= 0; i--) {
  100a10:	fffb8c13          	addi	s8,s7,-1
  100a14:	fc0b92e3          	bnez	s7,1009d8 <boot_sd_read_sector+0x554>
  100a18:	0080006f          	j	100a20 <boot_sd_read_sector+0x59c>
        __asm__ __volatile__("nop");
  100a1c:	00000013          	nop
    return *(volatile uint32_t*)addr;
  100a20:	008eab03          	lw	s6,8(t4)
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100a24:	001b7b13          	andi	s6,s6,1
  100a28:	fe0b1ae3          	bnez	s6,100a1c <boot_sd_read_sector+0x598>
    *(volatile uint32_t*)addr = v;
  100a2c:	01fea023          	sw	t6,0(t4)
  100a30:	f9c00b13          	li	s6,-100
    while (n--) {
  100a34:	001b0b13          	addi	s6,s6,1
        __asm__ __volatile__("nop");
  100a38:	00000013          	nop
    while (n--) {
  100a3c:	fe0b1ce3          	bnez	s6,100a34 <boot_sd_read_sector+0x5b0>
    for (uint32_t retry = 0; retry < SD_READ_RETRY_MAX; retry++) {
  100a40:	00160613          	addi	a2,a2,1
  100a44:	ad5614e3          	bne	a2,s5,10050c <boot_sd_read_sector+0x88>
  100a48:	00000593          	li	a1,0
  100a4c:	04300693          	li	a3,67
  100a50:	00103637          	lui	a2,0x103
  100a54:	11a60613          	addi	a2,a2,282 # 10311a <__modsi3+0x166>
  100a58:	10000737          	lui	a4,0x10000
  100a5c:	00f00793          	li	a5,15
  100a60:	0080006f          	j	100a68 <boot_sd_read_sector+0x5e4>
        __asm__ __volatile__("nop");
  100a64:	00000013          	nop
    return *(volatile uint32_t*)addr;
  100a68:	00872803          	lw	a6,8(a4) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100a6c:	00187813          	andi	a6,a6,1
  100a70:	fe081ae3          	bnez	a6,100a64 <boot_sd_read_sector+0x5e0>
        putchar(*s++);
  100a74:	00158593          	addi	a1,a1,1
  100a78:	00b60833          	add	a6,a2,a1
    mmio_w32(UART_MMIO_BASE + UART_TX, (uint32_t)(uint8_t)ch);
  100a7c:	0ff6f693          	zext.b	a3,a3
    *(volatile uint32_t*)addr = v;
  100a80:	00d72023          	sw	a3,0(a4)
    while (*s) {
  100a84:	00084683          	lbu	a3,0(a6)
  100a88:	fef590e3          	bne	a1,a5,100a68 <boot_sd_read_sector+0x5e4>
  100a8c:	00700713          	li	a4,7
  100a90:	00a00593          	li	a1,10
  100a94:	10000637          	lui	a2,0x10000
  100a98:	00070693          	mv	a3,a4
        uint8_t n = (uint8_t)((v >> (i * 4)) & 0xFu);
  100a9c:	00271713          	slli	a4,a4,0x2
  100aa0:	00e55733          	srl	a4,a0,a4
  100aa4:	00f77713          	andi	a4,a4,15
        putchar(n < 10 ? (char)('0' + n) : (char)('A' + n - 10));
  100aa8:	00b76663          	bltu	a4,a1,100ab4 <boot_sd_read_sector+0x630>
  100aac:	03770713          	addi	a4,a4,55
  100ab0:	0100006f          	j	100ac0 <boot_sd_read_sector+0x63c>
  100ab4:	03070713          	addi	a4,a4,48
  100ab8:	0080006f          	j	100ac0 <boot_sd_read_sector+0x63c>
        __asm__ __volatile__("nop");
  100abc:	00000013          	nop
    return *(volatile uint32_t*)addr;
  100ac0:	00862783          	lw	a5,8(a2) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100ac4:	0017f793          	andi	a5,a5,1
  100ac8:	fe079ae3          	bnez	a5,100abc <boot_sd_read_sector+0x638>
    *(volatile uint32_t*)addr = v;
  100acc:	00e62023          	sw	a4,0(a2)
    for (int i = 7; i >= 0; i--) {
  100ad0:	fff68713          	addi	a4,a3,-1
  100ad4:	fc0692e3          	bnez	a3,100a98 <boot_sd_read_sector+0x614>
  100ad8:	10000537          	lui	a0,0x10000
    return *(volatile uint32_t*)addr;
  100adc:	00852583          	lw	a1,8(a0) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100ae0:	0015f593          	andi	a1,a1,1
  100ae4:	14058e63          	beqz	a1,100c40 <boot_sd_read_sector+0x7bc>
        __asm__ __volatile__("nop");
  100ae8:	00000013          	nop
  100aec:	ff1ff06f          	j	100adc <boot_sd_read_sector+0x658>
  100af0:	00000593          	li	a1,0
  100af4:	04600693          	li	a3,70
  100af8:	00103637          	lui	a2,0x103
  100afc:	48760613          	addi	a2,a2,1159 # 103487 <$d.3+0x75>
  100b00:	10000737          	lui	a4,0x10000
  100b04:	01700793          	li	a5,23
  100b08:	0080006f          	j	100b10 <boot_sd_read_sector+0x68c>
  100b0c:	00000013          	nop
  100b10:	00872803          	lw	a6,8(a4) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100b14:	00187813          	andi	a6,a6,1
  100b18:	fe081ae3          	bnez	a6,100b0c <boot_sd_read_sector+0x688>
        putchar(*s++);
  100b1c:	00158593          	addi	a1,a1,1
  100b20:	00b60833          	add	a6,a2,a1
    mmio_w32(UART_MMIO_BASE + UART_TX, (uint32_t)(uint8_t)ch);
  100b24:	0ff6f693          	zext.b	a3,a3
    *(volatile uint32_t*)addr = v;
  100b28:	00d72023          	sw	a3,0(a4)
    while (*s) {
  100b2c:	00084683          	lbu	a3,0(a6)
  100b30:	fef590e3          	bne	a1,a5,100b10 <boot_sd_read_sector+0x68c>
  100b34:	00700713          	li	a4,7
  100b38:	00a00593          	li	a1,10
  100b3c:	10000637          	lui	a2,0x10000
  100b40:	00070693          	mv	a3,a4
        uint8_t n = (uint8_t)((v >> (i * 4)) & 0xFu);
  100b44:	00271713          	slli	a4,a4,0x2
  100b48:	00e55733          	srl	a4,a0,a4
  100b4c:	00f77713          	andi	a4,a4,15
        putchar(n < 10 ? (char)('0' + n) : (char)('A' + n - 10));
  100b50:	00b76663          	bltu	a4,a1,100b5c <boot_sd_read_sector+0x6d8>
  100b54:	03770713          	addi	a4,a4,55
  100b58:	0100006f          	j	100b68 <boot_sd_read_sector+0x6e4>
  100b5c:	03070713          	addi	a4,a4,48
  100b60:	0080006f          	j	100b68 <boot_sd_read_sector+0x6e4>
        __asm__ __volatile__("nop");
  100b64:	00000013          	nop
    return *(volatile uint32_t*)addr;
  100b68:	00862783          	lw	a5,8(a2) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100b6c:	0017f793          	andi	a5,a5,1
  100b70:	fe079ae3          	bnez	a5,100b64 <boot_sd_read_sector+0x6e0>
    *(volatile uint32_t*)addr = v;
  100b74:	00e62023          	sw	a4,0(a2)
    for (int i = 7; i >= 0; i--) {
  100b78:	fff68713          	addi	a4,a3,-1
  100b7c:	fc0692e3          	bnez	a3,100b40 <boot_sd_read_sector+0x6bc>
  100b80:	10000537          	lui	a0,0x10000
    return *(volatile uint32_t*)addr;
  100b84:	00852583          	lw	a1,8(a0) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100b88:	0015f593          	andi	a1,a1,1
  100b8c:	0a058a63          	beqz	a1,100c40 <boot_sd_read_sector+0x7bc>
        __asm__ __volatile__("nop");
  100b90:	00000013          	nop
  100b94:	ff1ff06f          	j	100b84 <boot_sd_read_sector+0x700>
  100b98:	00000593          	li	a1,0
  100b9c:	05300693          	li	a3,83
  100ba0:	00103637          	lui	a2,0x103
  100ba4:	3fd60613          	addi	a2,a2,1021 # 1033fd <$d.1+0x2d3>
  100ba8:	10000737          	lui	a4,0x10000
  100bac:	01400793          	li	a5,20
  100bb0:	0080006f          	j	100bb8 <boot_sd_read_sector+0x734>
  100bb4:	00000013          	nop
  100bb8:	00872803          	lw	a6,8(a4) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100bbc:	00187813          	andi	a6,a6,1
  100bc0:	fe081ae3          	bnez	a6,100bb4 <boot_sd_read_sector+0x730>
        putchar(*s++);
  100bc4:	00158593          	addi	a1,a1,1
  100bc8:	00b60833          	add	a6,a2,a1
    mmio_w32(UART_MMIO_BASE + UART_TX, (uint32_t)(uint8_t)ch);
  100bcc:	0ff6f693          	zext.b	a3,a3
    *(volatile uint32_t*)addr = v;
  100bd0:	00d72023          	sw	a3,0(a4)
    while (*s) {
  100bd4:	00084683          	lbu	a3,0(a6)
  100bd8:	fef590e3          	bne	a1,a5,100bb8 <boot_sd_read_sector+0x734>
  100bdc:	00700713          	li	a4,7
  100be0:	00a00593          	li	a1,10
  100be4:	10000637          	lui	a2,0x10000
  100be8:	00070693          	mv	a3,a4
        uint8_t n = (uint8_t)((v >> (i * 4)) & 0xFu);
  100bec:	00271713          	slli	a4,a4,0x2
  100bf0:	00e55733          	srl	a4,a0,a4
  100bf4:	00f77713          	andi	a4,a4,15
        putchar(n < 10 ? (char)('0' + n) : (char)('A' + n - 10));
  100bf8:	00b76663          	bltu	a4,a1,100c04 <boot_sd_read_sector+0x780>
  100bfc:	03770713          	addi	a4,a4,55
  100c00:	0100006f          	j	100c10 <boot_sd_read_sector+0x78c>
  100c04:	03070713          	addi	a4,a4,48
  100c08:	0080006f          	j	100c10 <boot_sd_read_sector+0x78c>
        __asm__ __volatile__("nop");
  100c0c:	00000013          	nop
    return *(volatile uint32_t*)addr;
  100c10:	00862783          	lw	a5,8(a2) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100c14:	0017f793          	andi	a5,a5,1
  100c18:	fe079ae3          	bnez	a5,100c0c <boot_sd_read_sector+0x788>
    *(volatile uint32_t*)addr = v;
  100c1c:	00e62023          	sw	a4,0(a2)
    for (int i = 7; i >= 0; i--) {
  100c20:	fff68713          	addi	a4,a3,-1
  100c24:	fc0692e3          	bnez	a3,100be8 <boot_sd_read_sector+0x764>
  100c28:	10000537          	lui	a0,0x10000
    return *(volatile uint32_t*)addr;
  100c2c:	00852583          	lw	a1,8(a0) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100c30:	0015f593          	andi	a1,a1,1
  100c34:	00058663          	beqz	a1,100c40 <boot_sd_read_sector+0x7bc>
        __asm__ __volatile__("nop");
  100c38:	00000013          	nop
  100c3c:	ff1ff06f          	j	100c2c <boot_sd_read_sector+0x7a8>
  100c40:	10000537          	lui	a0,0x10000
  100c44:	00a00593          	li	a1,10
    *(volatile uint32_t*)addr = v;
  100c48:	00b52023          	sw	a1,0(a0) # 10000000 <_stack_top+0xfef4240>
  100c4c:	fff00513          	li	a0,-1
  100c50:	02c12403          	lw	s0,44(sp)
  100c54:	02812483          	lw	s1,40(sp)
  100c58:	02412903          	lw	s2,36(sp)
  100c5c:	02012983          	lw	s3,32(sp)
  100c60:	01c12a03          	lw	s4,28(sp)
  100c64:	01812a83          	lw	s5,24(sp)
  100c68:	01412b03          	lw	s6,20(sp)
  100c6c:	01012b83          	lw	s7,16(sp)
  100c70:	00c12c03          	lw	s8,12(sp)
  100c74:	00812c83          	lw	s9,8(sp)
  100c78:	00412d03          	lw	s10,4(sp)
  100c7c:	00012d83          	lw	s11,0(sp)
}
  100c80:	03010113          	addi	sp,sp,48
  100c84:	00008067          	ret
  100c88:	00000513          	li	a0,0
  100c8c:	fc5ff06f          	j	100c50 <boot_sd_read_sector+0x7cc>

00100c90 <bl_print_hex>:
{
  100c90:	00700713          	li	a4,7
  100c94:	00a00593          	li	a1,10
  100c98:	10000637          	lui	a2,0x10000
  100c9c:	00070693          	mv	a3,a4
        uint8_t n = (uint8_t)((v >> (i * 4)) & 0xFu);
  100ca0:	00271713          	slli	a4,a4,0x2
  100ca4:	00e55733          	srl	a4,a0,a4
  100ca8:	00f77713          	andi	a4,a4,15
        putchar(n < 10 ? (char)('0' + n) : (char)('A' + n - 10));
  100cac:	00b76663          	bltu	a4,a1,100cb8 <bl_print_hex+0x28>
  100cb0:	03770713          	addi	a4,a4,55
  100cb4:	0100006f          	j	100cc4 <bl_print_hex+0x34>
  100cb8:	03070713          	addi	a4,a4,48
  100cbc:	0080006f          	j	100cc4 <bl_print_hex+0x34>
        __asm__ __volatile__("nop");
  100cc0:	00000013          	nop
    return *(volatile uint32_t*)addr;
  100cc4:	00862783          	lw	a5,8(a2) # 10000008 <_stack_top+0xfef4248>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  100cc8:	0017f793          	andi	a5,a5,1
  100ccc:	fe079ae3          	bnez	a5,100cc0 <bl_print_hex+0x30>
    *(volatile uint32_t*)addr = v;
  100cd0:	00e62023          	sw	a4,0(a2)
    for (int i = 7; i >= 0; i--) {
  100cd4:	fff68713          	addi	a4,a3,-1
  100cd8:	fc0692e3          	bnez	a3,100c9c <bl_print_hex+0xc>
}
  100cdc:	00008067          	ret

00100ce0 <memcpy>:
#include "common.h"

void *memcpy(void *dst, const void *src, size_t n) {
    uint8_t *d = (uint8_t *) dst;
    const uint8_t *s = (const uint8_t *) src;
    while (n--)
  100ce0:	02060263          	beqz	a2,100d04 <memcpy+0x24>
  100ce4:	00c50633          	add	a2,a0,a2
  100ce8:	00050693          	mv	a3,a0
        *d++ = *s++;
  100cec:	0005c703          	lbu	a4,0(a1)
  100cf0:	00158593          	addi	a1,a1,1
  100cf4:	00168793          	addi	a5,a3,1
  100cf8:	00e68023          	sb	a4,0(a3)
  100cfc:	00078693          	mv	a3,a5
    while (n--)
  100d00:	fec796e3          	bne	a5,a2,100cec <memcpy+0xc>
    return dst;
  100d04:	00008067          	ret

00100d08 <memset>:
*/

#if 1
void *memset(void *buf, char c, size_t n) {
    uint8_t *p = (uint8_t *) buf;
    while (n--)
  100d08:	00060e63          	beqz	a2,100d24 <memset+0x1c>
  100d0c:	00c50633          	add	a2,a0,a2
  100d10:	00050693          	mv	a3,a0
        *p++ = c;
  100d14:	00168713          	addi	a4,a3,1
  100d18:	00b68023          	sb	a1,0(a3)
  100d1c:	00070693          	mv	a3,a4
    while (n--)
  100d20:	fec71ae3          	bne	a4,a2,100d14 <memset+0xc>
    return buf;
  100d24:	00008067          	ret

00100d28 <s_print_int>:
    *rem = r;
    return q;
}

void s_print_int(int v)
{
  100d28:	fe010113          	addi	sp,sp,-32
  100d2c:	00112e23          	sw	ra,28(sp)
  100d30:	00812c23          	sw	s0,24(sp)
  100d34:	00912a23          	sw	s1,20(sp)
  100d38:	01212823          	sw	s2,16(sp)
    uint32_t u;
    char buf[10];
    int idx = 0;

    if (v < 0) {
  100d3c:	02054463          	bltz	a0,100d64 <s_print_int+0x3c>
        u = (uint32_t)(-(v + 1)) + 1u;
    } else {
        u = (uint32_t)v;
    }

    if (u == 0) {
  100d40:	02051e63          	bnez	a0,100d7c <s_print_int+0x54>
        uart_putchar('0');
  100d44:	03000513          	li	a0,48
  100d48:	01c12083          	lw	ra,28(sp)
  100d4c:	01812403          	lw	s0,24(sp)
  100d50:	01412483          	lw	s1,20(sp)
  100d54:	01012903          	lw	s2,16(sp)
  100d58:	02010113          	addi	sp,sp,32
  100d5c:	fffff317          	auipc	t1,0xfffff
  100d60:	2d830067          	jr	728(t1) # 100034 <uart_putchar>
  100d64:	00050413          	mv	s0,a0
        uart_putchar('-');
  100d68:	02d00513          	li	a0,45
  100d6c:	fffff097          	auipc	ra,0xfffff
  100d70:	2c8080e7          	jalr	712(ra) # 100034 <uart_putchar>
  100d74:	00040513          	mv	a0,s0
        u = (uint32_t)(-(v + 1)) + 1u;
  100d78:	40800533          	neg	a0,s0
  100d7c:	00000793          	li	a5,0
  100d80:	00100593          	li	a1,1
  100d84:	fff00613          	li	a2,-1
  100d88:	00610693          	addi	a3,sp,6
  100d8c:	00000813          	li	a6,0
  100d90:	00000713          	li	a4,0
  100d94:	00078413          	mv	s0,a5
  100d98:	01f00793          	li	a5,31
        r = (r << 1) | ((u >> i) & 1u);
  100d9c:	00181813          	slli	a6,a6,0x1
  100da0:	00f558b3          	srl	a7,a0,a5
  100da4:	0018f893          	andi	a7,a7,1
  100da8:	0108e833          	or	a6,a7,a6
        if (r >= 10u) {
  100dac:	00a83893          	sltiu	a7,a6,10
  100db0:	00f592b3          	sll	t0,a1,a5
  100db4:	fff88893          	addi	a7,a7,-1
  100db8:	0058f2b3          	and	t0,a7,t0
  100dbc:	00e2e733          	or	a4,t0,a4
  100dc0:	ff68f893          	andi	a7,a7,-10
    for (int i = 31; i >= 0; --i) {
  100dc4:	fff78793          	addi	a5,a5,-1
        if (r >= 10u) {
  100dc8:	01180833          	add	a6,a6,a7
    for (int i = 31; i >= 0; --i) {
  100dcc:	fcc798e3          	bne	a5,a2,100d9c <s_print_int+0x74>
    }

    while (u != 0) {
        uint32_t rem;
        u = divmod10(u, &rem);
        buf[idx++] = (char)('0' + rem);
  100dd0:	03080513          	addi	a0,a6,48
  100dd4:	00140793          	addi	a5,s0,1
  100dd8:	00868833          	add	a6,a3,s0
  100ddc:	00a80023          	sb	a0,0(a6)
  100de0:	00070513          	mv	a0,a4
    while (u != 0) {
  100de4:	fa0714e3          	bnez	a4,100d8c <s_print_int+0x64>
  100de8:	00610493          	addi	s1,sp,6
  100dec:	00100913          	li	s2,1
    }

    while (idx > 0) {
        uart_putchar(buf[--idx]);
  100df0:	00848533          	add	a0,s1,s0
  100df4:	00054503          	lbu	a0,0(a0)
  100df8:	fffff097          	auipc	ra,0xfffff
  100dfc:	23c080e7          	jalr	572(ra) # 100034 <uart_putchar>
    while (idx > 0) {
  100e00:	00140513          	addi	a0,s0,1
  100e04:	fff40413          	addi	s0,s0,-1
  100e08:	fea944e3          	blt	s2,a0,100df0 <s_print_int+0xc8>
  100e0c:	01c12083          	lw	ra,28(sp)
  100e10:	01812403          	lw	s0,24(sp)
  100e14:	01412483          	lw	s1,20(sp)
  100e18:	01012903          	lw	s2,16(sp)
    }
}
  100e1c:	02010113          	addi	sp,sp,32
  100e20:	00008067          	ret

00100e24 <s_printf>:

void s_printf(const char *fmt, ...) {
  100e24:	f9010113          	addi	sp,sp,-112
  100e28:	04112623          	sw	ra,76(sp)
  100e2c:	04812423          	sw	s0,72(sp)
  100e30:	04912223          	sw	s1,68(sp)
  100e34:	05212023          	sw	s2,64(sp)
  100e38:	03312e23          	sw	s3,60(sp)
  100e3c:	03412c23          	sw	s4,56(sp)
  100e40:	03512a23          	sw	s5,52(sp)
  100e44:	03612823          	sw	s6,48(sp)
  100e48:	03712623          	sw	s7,44(sp)
  100e4c:	03812423          	sw	s8,40(sp)
  100e50:	03912223          	sw	s9,36(sp)
  100e54:	03a12023          	sw	s10,32(sp)
  100e58:	01b12e23          	sw	s11,28(sp)
  100e5c:	00050413          	mv	s0,a0
  100e60:	07112623          	sw	a7,108(sp)
  100e64:	07012423          	sw	a6,104(sp)
  100e68:	06f12223          	sw	a5,100(sp)
  100e6c:	06e12023          	sw	a4,96(sp)
  100e70:	04d12e23          	sw	a3,92(sp)
  100e74:	04c12c23          	sw	a2,88(sp)
  100e78:	04b12a23          	sw	a1,84(sp)
  100e7c:	05410513          	addi	a0,sp,84
    va_list vargs;
    va_start(vargs, fmt);
  100e80:	00a12c23          	sw	a0,24(sp)
  100e84:	02500913          	li	s2,37
  100e88:	07200993          	li	s3,114
  100e8c:	06400493          	li	s1,100
  100e90:	00d10a93          	addi	s5,sp,13
  100e94:	00900b13          	li	s6,9
  100e98:	00100b93          	li	s7,1
  100e9c:	07300c13          	li	s8,115
  100ea0:	07800c93          	li	s9,120
  100ea4:	00103537          	lui	a0,0x103
  100ea8:	66850d13          	addi	s10,a0,1640 # 103668 <print_hex8.HEX>
  100eac:	00c0006f          	j	100eb8 <s_printf+0x94>

    while (*fmt) {
        if (*fmt == '%') {
            fmt++;
            switch (*fmt) {
  100eb0:	20050263          	beqz	a0,1010b4 <s_printf+0x290>
            }
        } else {
            uart_putchar(*fmt);
        }

        fmt++;
  100eb4:	001d8413          	addi	s0,s11,1
    while (*fmt) {
  100eb8:	00044503          	lbu	a0,0(s0)
  100ebc:	01250e63          	beq	a0,s2,100ed8 <s_printf+0xb4>
  100ec0:	20050063          	beqz	a0,1010c0 <s_printf+0x29c>
            uart_putchar(*fmt);
  100ec4:	fffff097          	auipc	ra,0xfffff
  100ec8:	170080e7          	jalr	368(ra) # 100034 <uart_putchar>
  100ecc:	00040d93          	mv	s11,s0
        fmt++;
  100ed0:	00140413          	addi	s0,s0,1
  100ed4:	fe5ff06f          	j	100eb8 <s_printf+0x94>
            switch (*fmt) {
  100ed8:	00144503          	lbu	a0,1(s0)
            fmt++;
  100edc:	00140d93          	addi	s11,s0,1
            switch (*fmt) {
  100ee0:	02a9cc63          	blt	s3,a0,100f18 <s_printf+0xf4>
  100ee4:	11250663          	beq	a0,s2,100ff0 <s_printf+0x1cc>
  100ee8:	fc9514e3          	bne	a0,s1,100eb0 <s_printf+0x8c>
                    int value = va_arg(vargs, int);
  100eec:	01812503          	lw	a0,24(sp)
  100ef0:	00450593          	addi	a1,a0,4
  100ef4:	00b12c23          	sw	a1,24(sp)
  100ef8:	00052403          	lw	s0,0(a0)
                    if (value < 0) {
  100efc:	14044063          	bltz	s0,10103c <s_printf+0x218>
                    if (u == 0) {
  100f00:	14041663          	bnez	s0,10104c <s_printf+0x228>
                        uart_putchar('0');
  100f04:	03000513          	li	a0,48
  100f08:	fffff097          	auipc	ra,0xfffff
  100f0c:	12c080e7          	jalr	300(ra) # 100034 <uart_putchar>
        fmt++;
  100f10:	001d8413          	addi	s0,s11,1
  100f14:	fa5ff06f          	j	100eb8 <s_printf+0x94>
            switch (*fmt) {
  100f18:	0f850663          	beq	a0,s8,101004 <s_printf+0x1e0>
  100f1c:	f9951ce3          	bne	a0,s9,100eb4 <s_printf+0x90>
                    unsigned value = va_arg(vargs, unsigned);
  100f20:	01812503          	lw	a0,24(sp)
  100f24:	00450593          	addi	a1,a0,4
  100f28:	00b12c23          	sw	a1,24(sp)
  100f2c:	00052403          	lw	s0,0(a0)
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  100f30:	01c45513          	srli	a0,s0,0x1c
                        uart_putchar("0123456789abcdef"[nibble]);
  100f34:	00ad0533          	add	a0,s10,a0
  100f38:	00054503          	lbu	a0,0(a0)
  100f3c:	fffff097          	auipc	ra,0xfffff
  100f40:	0f8080e7          	jalr	248(ra) # 100034 <uart_putchar>
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  100f44:	00441513          	slli	a0,s0,0x4
  100f48:	01c55513          	srli	a0,a0,0x1c
                        uart_putchar("0123456789abcdef"[nibble]);
  100f4c:	00ad0533          	add	a0,s10,a0
  100f50:	00054503          	lbu	a0,0(a0)
  100f54:	fffff097          	auipc	ra,0xfffff
  100f58:	0e0080e7          	jalr	224(ra) # 100034 <uart_putchar>
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  100f5c:	00841513          	slli	a0,s0,0x8
  100f60:	01c55513          	srli	a0,a0,0x1c
                        uart_putchar("0123456789abcdef"[nibble]);
  100f64:	00ad0533          	add	a0,s10,a0
  100f68:	00054503          	lbu	a0,0(a0)
  100f6c:	fffff097          	auipc	ra,0xfffff
  100f70:	0c8080e7          	jalr	200(ra) # 100034 <uart_putchar>
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  100f74:	00c41513          	slli	a0,s0,0xc
  100f78:	01c55513          	srli	a0,a0,0x1c
                        uart_putchar("0123456789abcdef"[nibble]);
  100f7c:	00ad0533          	add	a0,s10,a0
  100f80:	00054503          	lbu	a0,0(a0)
  100f84:	fffff097          	auipc	ra,0xfffff
  100f88:	0b0080e7          	jalr	176(ra) # 100034 <uart_putchar>
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  100f8c:	01041513          	slli	a0,s0,0x10
  100f90:	01c55513          	srli	a0,a0,0x1c
                        uart_putchar("0123456789abcdef"[nibble]);
  100f94:	00ad0533          	add	a0,s10,a0
  100f98:	00054503          	lbu	a0,0(a0)
  100f9c:	fffff097          	auipc	ra,0xfffff
  100fa0:	098080e7          	jalr	152(ra) # 100034 <uart_putchar>
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  100fa4:	01441513          	slli	a0,s0,0x14
  100fa8:	01c55513          	srli	a0,a0,0x1c
                        uart_putchar("0123456789abcdef"[nibble]);
  100fac:	00ad0533          	add	a0,s10,a0
  100fb0:	00054503          	lbu	a0,0(a0)
  100fb4:	fffff097          	auipc	ra,0xfffff
  100fb8:	080080e7          	jalr	128(ra) # 100034 <uart_putchar>
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  100fbc:	01841513          	slli	a0,s0,0x18
  100fc0:	01c55513          	srli	a0,a0,0x1c
                        uart_putchar("0123456789abcdef"[nibble]);
  100fc4:	00ad0533          	add	a0,s10,a0
  100fc8:	00054503          	lbu	a0,0(a0)
  100fcc:	fffff097          	auipc	ra,0xfffff
  100fd0:	068080e7          	jalr	104(ra) # 100034 <uart_putchar>
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  100fd4:	00f47413          	andi	s0,s0,15
                        uart_putchar("0123456789abcdef"[nibble]);
  100fd8:	008d0433          	add	s0,s10,s0
  100fdc:	00044503          	lbu	a0,0(s0)
  100fe0:	fffff097          	auipc	ra,0xfffff
  100fe4:	054080e7          	jalr	84(ra) # 100034 <uart_putchar>
        fmt++;
  100fe8:	001d8413          	addi	s0,s11,1
  100fec:	ecdff06f          	j	100eb8 <s_printf+0x94>
                    uart_putchar('%');
  100ff0:	02500513          	li	a0,37
  100ff4:	fffff097          	auipc	ra,0xfffff
  100ff8:	040080e7          	jalr	64(ra) # 100034 <uart_putchar>
        fmt++;
  100ffc:	001d8413          	addi	s0,s11,1
  101000:	eb9ff06f          	j	100eb8 <s_printf+0x94>
                    const char *s = va_arg(vargs, const char *);
  101004:	01812503          	lw	a0,24(sp)
  101008:	00450593          	addi	a1,a0,4
  10100c:	00b12c23          	sw	a1,24(sp)
  101010:	00052403          	lw	s0,0(a0)
                    while (*s) {
  101014:	00044503          	lbu	a0,0(s0)
  101018:	e8050ee3          	beqz	a0,100eb4 <s_printf+0x90>
  10101c:	00140413          	addi	s0,s0,1
                        uart_putchar(*s);
  101020:	0ff57513          	zext.b	a0,a0
  101024:	fffff097          	auipc	ra,0xfffff
  101028:	010080e7          	jalr	16(ra) # 100034 <uart_putchar>
                    while (*s) {
  10102c:	00044503          	lbu	a0,0(s0)
  101030:	00140413          	addi	s0,s0,1
  101034:	fe0516e3          	bnez	a0,101020 <s_printf+0x1fc>
  101038:	e7dff06f          	j	100eb4 <s_printf+0x90>
                        uart_putchar('-');
  10103c:	02d00513          	li	a0,45
  101040:	fffff097          	auipc	ra,0xfffff
  101044:	ff4080e7          	jalr	-12(ra) # 100034 <uart_putchar>
                        u = (unsigned int)(-(value + 1)) + 1;
  101048:	40800433          	neg	s0,s0
  10104c:	00000513          	li	a0,0
  101050:	00040493          	mv	s1,s0
  101054:	00050a13          	mv	s4,a0
                        u /= 10;
  101058:	00a00593          	li	a1,10
  10105c:	00040513          	mv	a0,s0
  101060:	00002097          	auipc	ra,0x2
  101064:	f04080e7          	jalr	-252(ra) # 102f64 <__hidden___udivsi3>
  101068:	00050413          	mv	s0,a0
  10106c:	00a00593          	li	a1,10
  101070:	00002097          	auipc	ra,0x2
  101074:	ed8080e7          	jalr	-296(ra) # 102f48 <__mulsi3>
  101078:	40a48533          	sub	a0,s1,a0
                        buf[i++] = '0' + (u % 10);
  10107c:	03056593          	ori	a1,a0,48
  101080:	001a0513          	addi	a0,s4,1
  101084:	014a8633          	add	a2,s5,s4
  101088:	00b60023          	sb	a1,0(a2)
                    while (u > 0) {
  10108c:	fc9b62e3          	bltu	s6,s1,101050 <s_printf+0x22c>
  101090:	06400493          	li	s1,100
                        uart_putchar(buf[--i]);
  101094:	014a8533          	add	a0,s5,s4
  101098:	00054503          	lbu	a0,0(a0)
  10109c:	fffff097          	auipc	ra,0xfffff
  1010a0:	f98080e7          	jalr	-104(ra) # 100034 <uart_putchar>
                    while (i > 0) {
  1010a4:	001a0513          	addi	a0,s4,1
  1010a8:	fffa0a13          	addi	s4,s4,-1
  1010ac:	feabc4e3          	blt	s7,a0,101094 <s_printf+0x270>
  1010b0:	e05ff06f          	j	100eb4 <s_printf+0x90>
                    uart_putchar('%');
  1010b4:	02500513          	li	a0,37
  1010b8:	fffff097          	auipc	ra,0xfffff
  1010bc:	f7c080e7          	jalr	-132(ra) # 100034 <uart_putchar>
  1010c0:	04c12083          	lw	ra,76(sp)
  1010c4:	04812403          	lw	s0,72(sp)
  1010c8:	04412483          	lw	s1,68(sp)
  1010cc:	04012903          	lw	s2,64(sp)
  1010d0:	03c12983          	lw	s3,60(sp)
  1010d4:	03812a03          	lw	s4,56(sp)
  1010d8:	03412a83          	lw	s5,52(sp)
  1010dc:	03012b03          	lw	s6,48(sp)
  1010e0:	02c12b83          	lw	s7,44(sp)
  1010e4:	02812c03          	lw	s8,40(sp)
  1010e8:	02412c83          	lw	s9,36(sp)
  1010ec:	02012d03          	lw	s10,32(sp)
  1010f0:	01c12d83          	lw	s11,28(sp)
    }

end:
    va_end(vargs);
}
  1010f4:	07010113          	addi	sp,sp,112
  1010f8:	00008067          	ret

001010fc <parse_hex>:
/* 簡易16進パーサ（"  0x1234" / "1234" 形式どちらも可） */
int parse_hex(const char *s, uintptr_t *out) {
    uintptr_t v = 0;

    /* skip leading spaces */
    while (*s == ' ' || *s == '\t') s++;
  1010fc:	00250613          	addi	a2,a0,2
  101100:	00900693          	li	a3,9
  101104:	02000713          	li	a4,32
  101108:	0080006f          	j	101110 <parse_hex+0x14>
  10110c:	00160613          	addi	a2,a2,1
  101110:	ffe64503          	lbu	a0,-2(a2)
  101114:	fed50ce3          	beq	a0,a3,10110c <parse_hex+0x10>
  101118:	fee50ae3          	beq	a0,a4,10110c <parse_hex+0x10>
  10111c:	03000693          	li	a3,48
  101120:	02d51063          	bne	a0,a3,101140 <parse_hex+0x44>

    /* optional 0x / 0X */
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  101124:	fff64503          	lbu	a0,-1(a2)
  101128:	02056513          	ori	a0,a0,32
  10112c:	07800693          	li	a3,120
  101130:	02d51063          	bne	a0,a3,101150 <parse_hex+0x54>
    if (!*s) return -1;
  101134:	00064503          	lbu	a0,0(a2)
  101138:	02051063          	bnez	a0,101158 <parse_hex+0x5c>
  10113c:	00c0006f          	j	101148 <parse_hex+0x4c>
  101140:	ffe60613          	addi	a2,a2,-2
  101144:	00051a63          	bnez	a0,101158 <parse_hex+0x5c>
  101148:	fff00513          	li	a0,-1
        else break;
        v = (v << 4) | d;
    }
    *out = v;
    return 0;
}
  10114c:	00008067          	ret
  101150:	ffe60613          	addi	a2,a2,-2
  101154:	03000513          	li	a0,48
  101158:	00000693          	li	a3,0
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  10115c:	00160613          	addi	a2,a2,1
  101160:	00a00713          	li	a4,10
  101164:	00600793          	li	a5,6
  101168:	00500813          	li	a6,5
  10116c:	0200006f          	j	10118c <parse_hex+0x90>
  101170:	0ff57293          	zext.b	t0,a0
    while (*s) {
  101174:	00064503          	lbu	a0,0(a2)
  101178:	005888b3          	add	a7,a7,t0
        v = (v << 4) | d;
  10117c:	00469693          	slli	a3,a3,0x4
  101180:	00d8e6b3          	or	a3,a7,a3
    while (*s) {
  101184:	00160613          	addi	a2,a2,1
  101188:	02050a63          	beqz	a0,1011bc <parse_hex+0xc0>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  10118c:	fd050893          	addi	a7,a0,-48
  101190:	0ff8f293          	zext.b	t0,a7
  101194:	fd000893          	li	a7,-48
  101198:	fce2ece3          	bltu	t0,a4,101170 <parse_hex+0x74>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  10119c:	f9f50893          	addi	a7,a0,-97
  1011a0:	0ff8f293          	zext.b	t0,a7
  1011a4:	fa900893          	li	a7,-87
  1011a8:	fcf2e4e3          	bltu	t0,a5,101170 <parse_hex+0x74>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  1011ac:	fbf50893          	addi	a7,a0,-65
  1011b0:	0ff8f293          	zext.b	t0,a7
  1011b4:	fc900893          	li	a7,-55
  1011b8:	fa587ce3          	bgeu	a6,t0,101170 <parse_hex+0x74>
  1011bc:	00000513          	li	a0,0
    *out = v;
  1011c0:	00d5a023          	sw	a3,0(a1)
}
  1011c4:	00008067          	ret

001011c8 <hexdump>:
/* 汎用hexdump本体：
 *  - addr: 先頭アドレス（今のページテーブルで有効な仮想アドレス）
 *  - len : ダンプ長
 *  - base_addr_label: 行頭に表示するベースアドレス（通常は addr と同じ）
 */
void hexdump(const void *addr, size_t len, uintptr_t base_addr_label) {
  1011c8:	fc010113          	addi	sp,sp,-64
  1011cc:	02112e23          	sw	ra,60(sp)
  1011d0:	02812c23          	sw	s0,56(sp)
  1011d4:	02912a23          	sw	s1,52(sp)
  1011d8:	03212823          	sw	s2,48(sp)
  1011dc:	03312623          	sw	s3,44(sp)
  1011e0:	03412423          	sw	s4,40(sp)
  1011e4:	03512223          	sw	s5,36(sp)
  1011e8:	03612023          	sw	s6,32(sp)
  1011ec:	01712e23          	sw	s7,28(sp)
  1011f0:	01812c23          	sw	s8,24(sp)
  1011f4:	01912a23          	sw	s9,20(sp)
  1011f8:	01a12823          	sw	s10,16(sp)
  1011fc:	01b12623          	sw	s11,12(sp)
  101200:	00c12423          	sw	a2,8(sp)
    const uint8_t *p = (const uint8_t *)addr;
    size_t off = 0;

    while (off < len) {
  101204:	20058463          	beqz	a1,10140c <hexdump+0x244>
  101208:	00058493          	mv	s1,a1
  10120c:	00050913          	mv	s2,a0
  101210:	00000a93          	li	s5,0
  101214:	00103537          	lui	a0,0x103
  101218:	66850b13          	addi	s6,a0,1640 # 103668 <print_hex8.HEX>
  10121c:	00103537          	lui	a0,0x103
  101220:	6b550993          	addi	s3,a0,1717 # 1036b5 <$d.1>
  101224:	00700b93          	li	s7,7
  101228:	01000c13          	li	s8,16
  10122c:	05f00c93          	li	s9,95
  101230:	0240006f          	j	101254 <hexdump+0x8c>
        uart_putchar('|');
        for (size_t i = 0; i < line; i++) {
            uint8_t c = p[off + i];
            uart_putchar((c >= 0x20 && c <= 0x7e) ? (char)c : '.');
        }
        uart_putchar('|');
  101234:	07c00513          	li	a0,124
  101238:	fffff097          	auipc	ra,0xfffff
  10123c:	dfc080e7          	jalr	-516(ra) # 100034 <uart_putchar>
        uart_putchar('\n');
  101240:	00a00513          	li	a0,10
  101244:	fffff097          	auipc	ra,0xfffff
  101248:	df0080e7          	jalr	-528(ra) # 100034 <uart_putchar>

        off += line;
  10124c:	015d0ab3          	add	s5,s10,s5
  101250:	1a9afe63          	bgeu	s5,s1,10140c <hexdump+0x244>
  101254:	00812a03          	lw	s4,8(sp)
        print_hex32((uint32_t)(base_addr_label + off));
  101258:	014a8a33          	add	s4,s5,s4
        uint8_t nib = (v >> (i * 4)) & 0x0F;
  10125c:	01ca5513          	srli	a0,s4,0x1c
        uart_putchar(HEX[nib]);
  101260:	00ab0533          	add	a0,s6,a0
  101264:	00054503          	lbu	a0,0(a0)
        size_t line = (len - off > 16) ? 16 : (len - off);
  101268:	41548d33          	sub	s10,s1,s5
        uart_putchar(HEX[nib]);
  10126c:	fffff097          	auipc	ra,0xfffff
  101270:	dc8080e7          	jalr	-568(ra) # 100034 <uart_putchar>
        uint8_t nib = (v >> (i * 4)) & 0x0F;
  101274:	004a1513          	slli	a0,s4,0x4
  101278:	01c55513          	srli	a0,a0,0x1c
        uart_putchar(HEX[nib]);
  10127c:	00ab0533          	add	a0,s6,a0
  101280:	00054503          	lbu	a0,0(a0)
  101284:	fffff097          	auipc	ra,0xfffff
  101288:	db0080e7          	jalr	-592(ra) # 100034 <uart_putchar>
        uint8_t nib = (v >> (i * 4)) & 0x0F;
  10128c:	008a1513          	slli	a0,s4,0x8
  101290:	01c55513          	srli	a0,a0,0x1c
        uart_putchar(HEX[nib]);
  101294:	00ab0533          	add	a0,s6,a0
  101298:	00054503          	lbu	a0,0(a0)
  10129c:	fffff097          	auipc	ra,0xfffff
  1012a0:	d98080e7          	jalr	-616(ra) # 100034 <uart_putchar>
        uint8_t nib = (v >> (i * 4)) & 0x0F;
  1012a4:	00ca1513          	slli	a0,s4,0xc
  1012a8:	01c55513          	srli	a0,a0,0x1c
        uart_putchar(HEX[nib]);
  1012ac:	00ab0533          	add	a0,s6,a0
  1012b0:	00054503          	lbu	a0,0(a0)
  1012b4:	fffff097          	auipc	ra,0xfffff
  1012b8:	d80080e7          	jalr	-640(ra) # 100034 <uart_putchar>
        uint8_t nib = (v >> (i * 4)) & 0x0F;
  1012bc:	010a1513          	slli	a0,s4,0x10
  1012c0:	01c55513          	srli	a0,a0,0x1c
        uart_putchar(HEX[nib]);
  1012c4:	00ab0533          	add	a0,s6,a0
  1012c8:	00054503          	lbu	a0,0(a0)
  1012cc:	fffff097          	auipc	ra,0xfffff
  1012d0:	d68080e7          	jalr	-664(ra) # 100034 <uart_putchar>
        uint8_t nib = (v >> (i * 4)) & 0x0F;
  1012d4:	014a1513          	slli	a0,s4,0x14
  1012d8:	01c55513          	srli	a0,a0,0x1c
        uart_putchar(HEX[nib]);
  1012dc:	00ab0533          	add	a0,s6,a0
  1012e0:	00054503          	lbu	a0,0(a0)
  1012e4:	fffff097          	auipc	ra,0xfffff
  1012e8:	d50080e7          	jalr	-688(ra) # 100034 <uart_putchar>
        uint8_t nib = (v >> (i * 4)) & 0x0F;
  1012ec:	018a1513          	slli	a0,s4,0x18
  1012f0:	01c55513          	srli	a0,a0,0x1c
        uart_putchar(HEX[nib]);
  1012f4:	00ab0533          	add	a0,s6,a0
  1012f8:	00054503          	lbu	a0,0(a0)
  1012fc:	fffff097          	auipc	ra,0xfffff
  101300:	d38080e7          	jalr	-712(ra) # 100034 <uart_putchar>
        uint8_t nib = (v >> (i * 4)) & 0x0F;
  101304:	00fa7513          	andi	a0,s4,15
        uart_putchar(HEX[nib]);
  101308:	00ab0533          	add	a0,s6,a0
  10130c:	00054503          	lbu	a0,0(a0)
  101310:	fffff097          	auipc	ra,0xfffff
  101314:	d24080e7          	jalr	-732(ra) # 100034 <uart_putchar>
        s_printf(": ");
  101318:	00098513          	mv	a0,s3
  10131c:	00000097          	auipc	ra,0x0
  101320:	b08080e7          	jalr	-1272(ra) # 100e24 <s_printf>
  101324:	00000413          	li	s0,0
  101328:	01590db3          	add	s11,s2,s5
  10132c:	00c0006f          	j	101338 <hexdump+0x170>
        for (size_t i = 0; i < 16; i++) {
  101330:	00140413          	addi	s0,s0,1
  101334:	07840863          	beq	s0,s8,1013a4 <hexdump+0x1dc>
  101338:	03a47863          	bgeu	s0,s10,101368 <hexdump+0x1a0>
                print_hex8(p[off + i]);
  10133c:	008d8533          	add	a0,s11,s0
  101340:	00054a03          	lbu	s4,0(a0)
  101344:	004a5513          	srli	a0,s4,0x4
    uart_putchar(HEX[v >> 4]);
  101348:	00ab0533          	add	a0,s6,a0
  10134c:	00054503          	lbu	a0,0(a0)
  101350:	fffff097          	auipc	ra,0xfffff
  101354:	ce4080e7          	jalr	-796(ra) # 100034 <uart_putchar>
    uart_putchar(HEX[v & 0x0F]);
  101358:	00fa7513          	andi	a0,s4,15
  10135c:	00ab0533          	add	a0,s6,a0
  101360:	00054a03          	lbu	s4,0(a0)
  101364:	0140006f          	j	101378 <hexdump+0x1b0>
                uart_putchar(' ');
  101368:	02000513          	li	a0,32
  10136c:	02000a13          	li	s4,32
  101370:	fffff097          	auipc	ra,0xfffff
  101374:	cc4080e7          	jalr	-828(ra) # 100034 <uart_putchar>
  101378:	000a0513          	mv	a0,s4
  10137c:	fffff097          	auipc	ra,0xfffff
  101380:	cb8080e7          	jalr	-840(ra) # 100034 <uart_putchar>
            uart_putchar(' ');
  101384:	02000513          	li	a0,32
  101388:	fffff097          	auipc	ra,0xfffff
  10138c:	cac080e7          	jalr	-852(ra) # 100034 <uart_putchar>
            if (i == 7) uart_putchar(' '); /* 8バイト境界でスペース追加 */
  101390:	fb7410e3          	bne	s0,s7,101330 <hexdump+0x168>
  101394:	02000513          	li	a0,32
  101398:	fffff097          	auipc	ra,0xfffff
  10139c:	c9c080e7          	jalr	-868(ra) # 100034 <uart_putchar>
  1013a0:	f91ff06f          	j	101330 <hexdump+0x168>
  1013a4:	01000513          	li	a0,16
        size_t line = (len - off > 16) ? 16 : (len - off);
  1013a8:	00ad6463          	bltu	s10,a0,1013b0 <hexdump+0x1e8>
  1013ac:	01000d13          	li	s10,16
        uart_putchar(' ');
  1013b0:	02000513          	li	a0,32
  1013b4:	fffff097          	auipc	ra,0xfffff
  1013b8:	c80080e7          	jalr	-896(ra) # 100034 <uart_putchar>
        uart_putchar('|');
  1013bc:	07c00513          	li	a0,124
  1013c0:	fffff097          	auipc	ra,0xfffff
  1013c4:	c74080e7          	jalr	-908(ra) # 100034 <uart_putchar>
        for (size_t i = 0; i < line; i++) {
  1013c8:	e75486e3          	beq	s1,s5,101234 <hexdump+0x6c>
  1013cc:	001d3513          	seqz	a0,s10
  1013d0:	01aa85b3          	add	a1,s5,s10
  1013d4:	00a58533          	add	a0,a1,a0
  1013d8:	00a90433          	add	s0,s2,a0
  1013dc:	0180006f          	j	1013f4 <hexdump+0x22c>
            uart_putchar((c >= 0x20 && c <= 0x7e) ? (char)c : '.');
  1013e0:	0ff57513          	zext.b	a0,a0
  1013e4:	fffff097          	auipc	ra,0xfffff
  1013e8:	c50080e7          	jalr	-944(ra) # 100034 <uart_putchar>
        for (size_t i = 0; i < line; i++) {
  1013ec:	001d8d93          	addi	s11,s11,1
  1013f0:	e48d82e3          	beq	s11,s0,101234 <hexdump+0x6c>
            uint8_t c = p[off + i];
  1013f4:	000dc503          	lbu	a0,0(s11)
            uart_putchar((c >= 0x20 && c <= 0x7e) ? (char)c : '.');
  1013f8:	fe050593          	addi	a1,a0,-32
  1013fc:	0ff5f593          	zext.b	a1,a1
  101400:	ff95e0e3          	bltu	a1,s9,1013e0 <hexdump+0x218>
  101404:	02e00513          	li	a0,46
  101408:	fd9ff06f          	j	1013e0 <hexdump+0x218>
  10140c:	03c12083          	lw	ra,60(sp)
  101410:	03812403          	lw	s0,56(sp)
  101414:	03412483          	lw	s1,52(sp)
  101418:	03012903          	lw	s2,48(sp)
  10141c:	02c12983          	lw	s3,44(sp)
  101420:	02812a03          	lw	s4,40(sp)
  101424:	02412a83          	lw	s5,36(sp)
  101428:	02012b03          	lw	s6,32(sp)
  10142c:	01c12b83          	lw	s7,28(sp)
  101430:	01812c03          	lw	s8,24(sp)
  101434:	01412c83          	lw	s9,20(sp)
  101438:	01012d03          	lw	s10,16(sp)
  10143c:	00c12d83          	lw	s11,12(sp)
    }
}
  101440:	04010113          	addi	sp,sp,64
  101444:	00008067          	ret

00101448 <cmd_dump>:

void cmd_dump(int argc, const char **argv) {
  101448:	ff010113          	addi	sp,sp,-16
  10144c:	00112623          	sw	ra,12(sp)
  101450:	00812423          	sw	s0,8(sp)
  101454:	00000413          	li	s0,0
    const size_t    MAX_LEN      = 0x1000u;      /* 誤爆防止の上限 */

    uintptr_t addr = DEFAULT_BASE;
    size_t    len  = DEFAULT_LEN;

    if (argc >= 1 && argv && argv[0] && argv[0][0]) {
  101458:	06a05463          	blez	a0,1014c0 <cmd_dump+0x78>
  10145c:	06058263          	beqz	a1,1014c0 <cmd_dump+0x78>
  101460:	0005a683          	lw	a3,0(a1)
  101464:	04068c63          	beqz	a3,1014bc <cmd_dump+0x74>
  101468:	0006c603          	lbu	a2,0(a3)
  10146c:	04060863          	beqz	a2,1014bc <cmd_dump+0x74>
    while (*s == ' ' || *s == '\t') s++;
  101470:	00268693          	addi	a3,a3,2
  101474:	00900713          	li	a4,9
  101478:	02000793          	li	a5,32
  10147c:	00c0006f          	j	101488 <cmd_dump+0x40>
  101480:	fff6c603          	lbu	a2,-1(a3)
  101484:	00168693          	addi	a3,a3,1
  101488:	0ff67813          	zext.b	a6,a2
  10148c:	fee80ae3          	beq	a6,a4,101480 <cmd_dump+0x38>
  101490:	fef808e3          	beq	a6,a5,101480 <cmd_dump+0x38>
  101494:	03000713          	li	a4,48
  101498:	08e81a63          	bne	a6,a4,10152c <cmd_dump+0xe4>
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  10149c:	fff6c603          	lbu	a2,-1(a3)
  1014a0:	02066613          	ori	a2,a2,32
  1014a4:	07800713          	li	a4,120
  1014a8:	0ce61263          	bne	a2,a4,10156c <cmd_dump+0x124>
    if (!*s) return -1;
  1014ac:	0006c603          	lbu	a2,0(a3)
  1014b0:	0ff67713          	zext.b	a4,a2
  1014b4:	0c071063          	bnez	a4,101574 <cmd_dump+0x12c>
  1014b8:	0800006f          	j	101538 <cmd_dump+0xf0>
  1014bc:	00000413          	li	s0,0
  1014c0:	00200693          	li	a3,2
  1014c4:	10000613          	li	a2,256
  1014c8:	1ad54863          	blt	a0,a3,101678 <cmd_dump+0x230>
  1014cc:	1a058663          	beqz	a1,101678 <cmd_dump+0x230>
            s_printf("usage: dmp [offset_hex] [len_hex]\n");
            return;
        }
        addr = DEFAULT_BASE + offset;
    }
    if (argc >= 2 && argv && argv[1] && argv[1][0]) {
  1014d0:	0045a583          	lw	a1,4(a1)
  1014d4:	1a058263          	beqz	a1,101678 <cmd_dump+0x230>
  1014d8:	0005c503          	lbu	a0,0(a1)
  1014dc:	18050e63          	beqz	a0,101678 <cmd_dump+0x230>
    while (*s == ' ' || *s == '\t') s++;
  1014e0:	00258593          	addi	a1,a1,2
  1014e4:	00900693          	li	a3,9
  1014e8:	02000713          	li	a4,32
  1014ec:	00c0006f          	j	1014f8 <cmd_dump+0xb0>
  1014f0:	fff5c503          	lbu	a0,-1(a1)
  1014f4:	00158593          	addi	a1,a1,1
  1014f8:	0ff57793          	zext.b	a5,a0
  1014fc:	fed78ae3          	beq	a5,a3,1014f0 <cmd_dump+0xa8>
  101500:	fee788e3          	beq	a5,a4,1014f0 <cmd_dump+0xa8>
  101504:	03000693          	li	a3,48
  101508:	02d79e63          	bne	a5,a3,101544 <cmd_dump+0xfc>
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  10150c:	fff5c503          	lbu	a0,-1(a1)
  101510:	02056513          	ori	a0,a0,32
  101514:	07800693          	li	a3,120
  101518:	0cd51263          	bne	a0,a3,1015dc <cmd_dump+0x194>
    if (!*s) return -1;
  10151c:	0005c503          	lbu	a0,0(a1)
  101520:	0ff57693          	zext.b	a3,a0
  101524:	0c069063          	bnez	a3,1015e4 <cmd_dump+0x19c>
  101528:	0280006f          	j	101550 <cmd_dump+0x108>
  10152c:	ffe68693          	addi	a3,a3,-2
  101530:	0ff67713          	zext.b	a4,a2
  101534:	04071063          	bnez	a4,101574 <cmd_dump+0x12c>
            s_printf("usage: dmp [offset_hex] [len_hex]\n");
  101538:	00103537          	lui	a0,0x103
  10153c:	5d650513          	addi	a0,a0,1494 # 1035d6 <$d.3+0x1c4>
  101540:	0180006f          	j	101558 <cmd_dump+0x110>
    if (!*s) return -1;
  101544:	ffe58593          	addi	a1,a1,-2
  101548:	0ff57693          	zext.b	a3,a0
  10154c:	08069c63          	bnez	a3,1015e4 <cmd_dump+0x19c>
        uintptr_t lhex = 0;
        if (parse_hex(argv[1], &lhex) != 0) {
            s_printf("usage: dump [offset_hex] [len_hex]\n");
  101550:	00103537          	lui	a0,0x103
  101554:	0cf50513          	addi	a0,a0,207 # 1030cf <__modsi3+0x11b>
  101558:	00c12083          	lw	ra,12(sp)
  10155c:	00812403          	lw	s0,8(sp)
  101560:	01010113          	addi	sp,sp,16
  101564:	00000317          	auipc	t1,0x0
  101568:	8c030067          	jr	-1856(t1) # 100e24 <s_printf>
  10156c:	ffe68693          	addi	a3,a3,-2
  101570:	03000613          	li	a2,48
  101574:	00000413          	li	s0,0
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  101578:	00168693          	addi	a3,a3,1
  10157c:	00a00713          	li	a4,10
  101580:	00600793          	li	a5,6
  101584:	00500813          	li	a6,5
  101588:	0200006f          	j	1015a8 <cmd_dump+0x160>
  10158c:	0ff67293          	zext.b	t0,a2
    while (*s) {
  101590:	0006c603          	lbu	a2,0(a3)
  101594:	005888b3          	add	a7,a7,t0
        v = (v << 4) | d;
  101598:	00441413          	slli	s0,s0,0x4
  10159c:	0088e433          	or	s0,a7,s0
    while (*s) {
  1015a0:	00168693          	addi	a3,a3,1
  1015a4:	f0060ee3          	beqz	a2,1014c0 <cmd_dump+0x78>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  1015a8:	fd060893          	addi	a7,a2,-48
  1015ac:	0ff8f293          	zext.b	t0,a7
  1015b0:	fd000893          	li	a7,-48
  1015b4:	fce2ece3          	bltu	t0,a4,10158c <cmd_dump+0x144>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  1015b8:	f9f60893          	addi	a7,a2,-97
  1015bc:	0ff8f293          	zext.b	t0,a7
  1015c0:	fa900893          	li	a7,-87
  1015c4:	fcf2e4e3          	bltu	t0,a5,10158c <cmd_dump+0x144>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  1015c8:	fbf60893          	addi	a7,a2,-65
  1015cc:	0ff8f293          	zext.b	t0,a7
  1015d0:	fc900893          	li	a7,-55
  1015d4:	fa587ce3          	bgeu	a6,t0,10158c <cmd_dump+0x144>
  1015d8:	ee9ff06f          	j	1014c0 <cmd_dump+0x78>
  1015dc:	ffe58593          	addi	a1,a1,-2
  1015e0:	03000513          	li	a0,48
  1015e4:	00000693          	li	a3,0
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  1015e8:	00158593          	addi	a1,a1,1
  1015ec:	00a00713          	li	a4,10
  1015f0:	00600793          	li	a5,6
  1015f4:	00500813          	li	a6,5
  1015f8:	0200006f          	j	101618 <cmd_dump+0x1d0>
  1015fc:	0ff57293          	zext.b	t0,a0
    while (*s) {
  101600:	0005c503          	lbu	a0,0(a1)
  101604:	005888b3          	add	a7,a7,t0
        v = (v << 4) | d;
  101608:	00469693          	slli	a3,a3,0x4
  10160c:	00d8e6b3          	or	a3,a7,a3
    while (*s) {
  101610:	00158593          	addi	a1,a1,1
  101614:	02050a63          	beqz	a0,101648 <cmd_dump+0x200>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  101618:	fd050893          	addi	a7,a0,-48
  10161c:	0ff8f293          	zext.b	t0,a7
  101620:	fd000893          	li	a7,-48
  101624:	fce2ece3          	bltu	t0,a4,1015fc <cmd_dump+0x1b4>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  101628:	f9f50893          	addi	a7,a0,-97
  10162c:	0ff8f293          	zext.b	t0,a7
  101630:	fa900893          	li	a7,-87
  101634:	fcf2e4e3          	bltu	t0,a5,1015fc <cmd_dump+0x1b4>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  101638:	fbf50893          	addi	a7,a0,-65
  10163c:	0ff8f293          	zext.b	t0,a7
  101640:	fc900893          	li	a7,-55
  101644:	fa587ce3          	bgeu	a6,t0,1015fc <cmd_dump+0x1b4>
            return;
        }
        len = (size_t)lhex;
    }

    if (len == 0) {
  101648:	02068863          	beqz	a3,101678 <cmd_dump+0x230>
  10164c:	00001537          	lui	a0,0x1
  101650:	00150513          	addi	a0,a0,1 # 1001 <$d.10+0x89>
  101654:	00068613          	mv	a2,a3
        len = DEFAULT_LEN;
    } else if (len > MAX_LEN) {
  101658:	02a6e063          	bltu	a3,a0,101678 <cmd_dump+0x230>
        s_printf("[info] len too big (>0x%X), round down to 0x%X\n",
  10165c:	00103537          	lui	a0,0x103
  101660:	39650513          	addi	a0,a0,918 # 103396 <$d.1+0x26c>
  101664:	000015b7          	lui	a1,0x1
  101668:	00001637          	lui	a2,0x1
  10166c:	fffff097          	auipc	ra,0xfffff
  101670:	7b8080e7          	jalr	1976(ra) # 100e24 <s_printf>
  101674:	00001637          	lui	a2,0x1
               (unsigned)MAX_LEN, (unsigned)MAX_LEN);
        len = MAX_LEN;
    }

    hexdump((const void *)addr, len, addr);
  101678:	00040513          	mv	a0,s0
  10167c:	00060593          	mv	a1,a2
  101680:	00040613          	mv	a2,s0
  101684:	00c12083          	lw	ra,12(sp)
  101688:	00812403          	lw	s0,8(sp)
  10168c:	01010113          	addi	sp,sp,16
  101690:	00000317          	auipc	t1,0x0
  101694:	b3830067          	jr	-1224(t1) # 1011c8 <hexdump>

00101698 <sd_read_sector>:
}

// -------------------------------------------------------
int sd_read_sector(uint32_t sector, uint8_t *buf)
{
    return sd_read_once(sector, buf);
  101698:	00000317          	auipc	t1,0x0
  10169c:	00830067          	jr	8(t1) # 1016a0 <sd_read_once>

001016a0 <sd_read_once>:
{
  1016a0:	10006637          	lui	a2,0x10006
  1016a4:	00400693          	li	a3,4
    PSC_SD_IF_CTRL = 0x04;
  1016a8:	00d62423          	sw	a3,8(a2) # 10006008 <_stack_top+0xfefa248>
  1016ac:	f9c00613          	li	a2,-100
    while (n--) {
  1016b0:	00160613          	addi	a2,a2,1
        __asm__ __volatile__("nop");
  1016b4:	00000013          	nop
    while (n--) {
  1016b8:	fe061ce3          	bnez	a2,1016b0 <sd_read_once+0x10>
  1016bc:	10006637          	lui	a2,0x10006
    if ((PSC_SD_IF_CTRL & 0x04) == 0x00) {
  1016c0:	00862683          	lw	a3,8(a2) # 10006008 <_stack_top+0xfefa248>
  1016c4:	0046f693          	andi	a3,a3,4
  1016c8:	00069663          	bnez	a3,1016d4 <sd_read_once+0x34>
  1016cc:	00100693          	li	a3,1
        PSC_SD_IF_CTRL = 0x01;
  1016d0:	00d62423          	sw	a3,8(a2)
  1016d4:	ffff46b7          	lui	a3,0xffff4
  1016d8:	cb068693          	addi	a3,a3,-848 # ffff3cb0 <_stack_top+0xffee7ef0>
    while (PSC_SD_IF_CTRL & 0x02) {
  1016dc:	00862703          	lw	a4,8(a2)
  1016e0:	00277713          	andi	a4,a4,2
  1016e4:	00070a63          	beqz	a4,1016f8 <sd_read_once+0x58>
        if (--timeout == 0) return -1;
  1016e8:	00168693          	addi	a3,a3,1
  1016ec:	fe0698e3          	bnez	a3,1016dc <sd_read_once+0x3c>
  1016f0:	fff00513          	li	a0,-1
}
  1016f4:	00008067          	ret
  1016f8:	f9c00613          	li	a2,-100
    while (n--) {
  1016fc:	00160613          	addi	a2,a2,1
        __asm__ __volatile__("nop");
  101700:	00000013          	nop
  101704:	fe061ce3          	bnez	a2,1016fc <sd_read_once+0x5c>
  101708:	10006637          	lui	a2,0x10006
    PSC_SD_SECTOR = sd_sector_address;
  10170c:	00a62223          	sw	a0,4(a2) # 10006004 <_stack_top+0xfefa244>
  101710:	00200513          	li	a0,2
    PSC_SD_IF_CTRL = 0x02;
  101714:	00a62423          	sw	a0,8(a2)
  101718:	f9c00513          	li	a0,-100
    while (n--) {
  10171c:	00150513          	addi	a0,a0,1
        __asm__ __volatile__("nop");
  101720:	00000013          	nop
  101724:	fe051ce3          	bnez	a0,10171c <sd_read_once+0x7c>
  101728:	ffff4537          	lui	a0,0xffff4
  10172c:	cb050513          	addi	a0,a0,-848 # ffff3cb0 <_stack_top+0xffee7ef0>
  101730:	10006637          	lui	a2,0x10006
    while ((PSC_SD_IF_CTRL & 0x04) == 0) {
  101734:	00862683          	lw	a3,8(a2) # 10006008 <_stack_top+0xfefa248>
  101738:	0046f693          	andi	a3,a3,4
  10173c:	00069a63          	bnez	a3,101750 <sd_read_once+0xb0>
        if (--timeout == 0) return -2;
  101740:	00150513          	addi	a0,a0,1
  101744:	fe0518e3          	bnez	a0,101734 <sd_read_once+0x94>
  101748:	ffe00513          	li	a0,-2
}
  10174c:	00008067          	ret
  101750:	00000613          	li	a2,0
        __asm__ __volatile__("nop");
  101754:	00000013          	nop
  101758:	00000013          	nop
  10175c:	00000013          	nop
  101760:	00000013          	nop
  101764:	00000013          	nop
  101768:	00000013          	nop
  10176c:	00000013          	nop
  101770:	00000013          	nop
  101774:	00000013          	nop
  101778:	00000013          	nop
  10177c:	00000013          	nop
  101780:	00000013          	nop
  101784:	00000013          	nop
  101788:	00000013          	nop
  10178c:	00000013          	nop
  101790:	00000013          	nop
  101794:	00000013          	nop
  101798:	00000013          	nop
  10179c:	00000013          	nop
  1017a0:	00000013          	nop
  1017a4:	00000013          	nop
  1017a8:	00000013          	nop
  1017ac:	00000013          	nop
  1017b0:	00000013          	nop
  1017b4:	00000013          	nop
  1017b8:	00000013          	nop
  1017bc:	00000013          	nop
  1017c0:	00000013          	nop
  1017c4:	00000013          	nop
  1017c8:	00000013          	nop
  1017cc:	00000013          	nop
  1017d0:	00000013          	nop
  1017d4:	00000013          	nop
  1017d8:	00000013          	nop
  1017dc:	00000013          	nop
  1017e0:	00000013          	nop
  1017e4:	00000013          	nop
  1017e8:	00000013          	nop
  1017ec:	00000013          	nop
  1017f0:	00000013          	nop
  1017f4:	00000013          	nop
  1017f8:	00000013          	nop
  1017fc:	00000013          	nop
  101800:	00000013          	nop
  101804:	00000013          	nop
  101808:	00000013          	nop
  10180c:	00000013          	nop
  101810:	00000013          	nop
  101814:	00000013          	nop
  101818:	00000013          	nop
  10181c:	ffff4537          	lui	a0,0xffff4
  101820:	cb050693          	addi	a3,a0,-848 # ffff3cb0 <_stack_top+0xffee7ef0>
  101824:	10006737          	lui	a4,0x10006
  101828:	20000793          	li	a5,512
  10182c:	00068513          	mv	a0,a3
        while (PSC_SD_IF_CTRL & (1 << 3)) {
  101830:	00872803          	lw	a6,8(a4) # 10006008 <_stack_top+0xfefa248>
  101834:	00887813          	andi	a6,a6,8
  101838:	00080863          	beqz	a6,101848 <sd_read_once+0x1a8>
            if (--timeout == 0) return -3;
  10183c:	00150513          	addi	a0,a0,1
  101840:	fe0518e3          	bnez	a0,101830 <sd_read_once+0x190>
  101844:	0200006f          	j	101864 <sd_read_once+0x1c4>
        buf[i] = (unsigned char)(PSC_SD_ADDR & 0xFF);
  101848:	00072803          	lw	a6,0(a4)
  10184c:	00000513          	li	a0,0
  101850:	00c588b3          	add	a7,a1,a2
    for (int i = 0; i < 512; i++) {
  101854:	00160613          	addi	a2,a2,1
        buf[i] = (unsigned char)(PSC_SD_ADDR & 0xFF);
  101858:	01088023          	sb	a6,0(a7)
    for (int i = 0; i < 512; i++) {
  10185c:	fcf618e3          	bne	a2,a5,10182c <sd_read_once+0x18c>
}
  101860:	00008067          	ret
  101864:	ffd00513          	li	a0,-3
  101868:	00008067          	ret

0010186c <s_call_sdcard_read_api>:
}

// -------------------------------------------------------
// SDカードREAD実行関数
void s_call_sdcard_read_api(uint32_t sd_sector_address)
{
  10186c:	dd010113          	addi	sp,sp,-560
  101870:	22112623          	sw	ra,556(sp)
  101874:	22812423          	sw	s0,552(sp)
  101878:	22912223          	sw	s1,548(sp)
  10187c:	23212023          	sw	s2,544(sp)
  101880:	21312e23          	sw	s3,540(sp)
  101884:	21412c23          	sw	s4,536(sp)
  101888:	21512a23          	sw	s5,532(sp)
  10188c:	21612823          	sw	s6,528(sp)
  101890:	21712623          	sw	s7,524(sp)
  101894:	00050413          	mv	s0,a0
  101898:	00000493          	li	s1,0
  10189c:	00001537          	lui	a0,0x1
  1018a0:	02150a13          	addi	s4,a0,33 # 1021 <$d.10+0xa9>
    unsigned char buf[512];

    int retry_max = 3;
    int success = 0;

    for (int retry = 0; retry < retry_max; retry++) {
  1018a4:	20c10a93          	addi	s5,sp,524
  1018a8:	10006b37          	lui	s6,0x10006
  1018ac:	00103537          	lui	a0,0x103
  1018b0:	24b50913          	addi	s2,a0,587 # 10324b <$d.1+0x121>
  1018b4:	00300b93          	li	s7,3
  1018b8:	00103537          	lui	a0,0x103
  1018bc:	12a50993          	addi	s3,a0,298 # 10312a <$d.1>
  1018c0:	01c0006f          	j	1018dc <s_call_sdcard_read_api+0x70>

        if (sd_read_once(sd_sector_address, buf) != 0) {
            s_printf("READ FAIL retry=%d\n", retry);
  1018c4:	00098513          	mv	a0,s3
  1018c8:	00048593          	mv	a1,s1
  1018cc:	fffff097          	auipc	ra,0xfffff
  1018d0:	558080e7          	jalr	1368(ra) # 100e24 <s_printf>
    for (int retry = 0; retry < retry_max; retry++) {
  1018d4:	00148493          	addi	s1,s1,1
  1018d8:	13748063          	beq	s1,s7,1019f8 <s_call_sdcard_read_api+0x18c>
        if (sd_read_once(sd_sector_address, buf) != 0) {
  1018dc:	00c10593          	addi	a1,sp,12
  1018e0:	00040513          	mv	a0,s0
  1018e4:	00000097          	auipc	ra,0x0
  1018e8:	dbc080e7          	jalr	-580(ra) # 1016a0 <sd_read_once>
  1018ec:	fc051ce3          	bnez	a0,1018c4 <s_call_sdcard_read_api+0x58>
            continue;
        }

        // CRC HW
        uint32_t ctrl = PSC_SD_IF_CTRL;
  1018f0:	008b2683          	lw	a3,8(s6) # 10006008 <_stack_top+0xfefa248>
  1018f4:	00000593          	li	a1,0
  1018f8:	00c10513          	addi	a0,sp,12
        crc ^= (uint16_t)buf[i] << 8;
  1018fc:	00054603          	lbu	a2,0(a0)
  101900:	00861613          	slli	a2,a2,0x8
  101904:	00b645b3          	xor	a1,a2,a1
  101908:	01059613          	slli	a2,a1,0x10
  10190c:	41065613          	srai	a2,a2,0x10
            crc = (crc & 0x8000) ? (crc << 1) ^ 0x1021 : (crc << 1);
  101910:	01159713          	slli	a4,a1,0x11
  101914:	41075713          	srai	a4,a4,0x10
  101918:	00159793          	slli	a5,a1,0x1
  10191c:	00f65613          	srli	a2,a2,0xf
  101920:	01467633          	and	a2,a2,s4
  101924:	00c7c633          	xor	a2,a5,a2
  101928:	00161793          	slli	a5,a2,0x1
  10192c:	01259813          	slli	a6,a1,0x12
  101930:	41085813          	srai	a6,a6,0x10
  101934:	00f75713          	srli	a4,a4,0xf
  101938:	01477733          	and	a4,a4,s4
  10193c:	00e7c733          	xor	a4,a5,a4
  101940:	00171793          	slli	a5,a4,0x1
  101944:	01359593          	slli	a1,a1,0x13
  101948:	4105d593          	srai	a1,a1,0x10
  10194c:	00f85813          	srli	a6,a6,0xf
  101950:	01487833          	and	a6,a6,s4
  101954:	0107c7b3          	xor	a5,a5,a6
  101958:	01361613          	slli	a2,a2,0x13
  10195c:	41065613          	srai	a2,a2,0x10
  101960:	00179813          	slli	a6,a5,0x1
  101964:	00f5d593          	srli	a1,a1,0xf
  101968:	0145f5b3          	and	a1,a1,s4
  10196c:	00b845b3          	xor	a1,a6,a1
  101970:	01371713          	slli	a4,a4,0x13
  101974:	41075713          	srai	a4,a4,0x10
  101978:	00f65613          	srli	a2,a2,0xf
  10197c:	01467633          	and	a2,a2,s4
  101980:	00161613          	slli	a2,a2,0x1
  101984:	00259813          	slli	a6,a1,0x2
  101988:	01379793          	slli	a5,a5,0x13
  10198c:	4107d793          	srai	a5,a5,0x10
  101990:	00f75713          	srli	a4,a4,0xf
  101994:	01477733          	and	a4,a4,s4
  101998:	00e64633          	xor	a2,a2,a4
  10199c:	00c84633          	xor	a2,a6,a2
  1019a0:	01359593          	slli	a1,a1,0x13
  1019a4:	4105d593          	srai	a1,a1,0x10
  1019a8:	00f7d793          	srli	a5,a5,0xf
  1019ac:	0147f733          	and	a4,a5,s4
  1019b0:	00261613          	slli	a2,a2,0x2
  1019b4:	00171713          	slli	a4,a4,0x1
  1019b8:	00e64633          	xor	a2,a2,a4
  1019bc:	00f5d593          	srli	a1,a1,0xf
  1019c0:	0145f5b3          	and	a1,a1,s4
    for (int i = 0; i < 512; i++) {
  1019c4:	00150513          	addi	a0,a0,1
            crc = (crc & 0x8000) ? (crc << 1) ^ 0x1021 : (crc << 1);
  1019c8:	00b645b3          	xor	a1,a2,a1
    for (int i = 0; i < 512; i++) {
  1019cc:	f35518e3          	bne	a0,s5,1018fc <s_call_sdcard_read_api+0x90>
        uint16_t crc_hw = ((ctrl >> 24) & 0xFF) << 8 |
  1019d0:	0106d693          	srli	a3,a3,0x10
                          ((ctrl >> 16) & 0xFF);

        // CRC SW
        uint16_t crc = sd_crc16(buf);

        if (crc == crc_hw) {
  1019d4:	01059593          	slli	a1,a1,0x10
  1019d8:	0105d613          	srli	a2,a1,0x10
  1019dc:	02c68863          	beq	a3,a2,101a0c <s_call_sdcard_read_api+0x1a0>
            s_printf("CRC OK (retry=%d)\n", retry);
            success = 1;
            break;
        } else {
            s_printf("CRC NG retry=%d (calc=%x hw=%x)\n",
  1019e0:	00090513          	mv	a0,s2
  1019e4:	00048593          	mv	a1,s1
  1019e8:	fffff097          	auipc	ra,0xfffff
  1019ec:	43c080e7          	jalr	1084(ra) # 100e24 <s_printf>
    for (int retry = 0; retry < retry_max; retry++) {
  1019f0:	00148493          	addi	s1,s1,1
  1019f4:	ef7494e3          	bne	s1,s7,1018dc <s_call_sdcard_read_api+0x70>
                     retry, crc, crc_hw);
        }
    }

    if (!success) {
        s_printf("CRC FAILED (final)\n");
  1019f8:	00103537          	lui	a0,0x103
  1019fc:	05b50513          	addi	a0,a0,91 # 10305b <__modsi3+0xa7>
  101a00:	fffff097          	auipc	ra,0xfffff
  101a04:	424080e7          	jalr	1060(ra) # 100e24 <s_printf>
  101a08:	0180006f          	j	101a20 <s_call_sdcard_read_api+0x1b4>
            s_printf("CRC OK (retry=%d)\n", retry);
  101a0c:	00103537          	lui	a0,0x103
  101a10:	1c350513          	addi	a0,a0,451 # 1031c3 <$d.1+0x99>
  101a14:	00048593          	mv	a1,s1
  101a18:	fffff097          	auipc	ra,0xfffff
  101a1c:	40c080e7          	jalr	1036(ra) # 100e24 <s_printf>
  101a20:	00000413          	li	s0,0
  101a24:	00c10493          	addi	s1,sp,12
  101a28:	00103537          	lui	a0,0x103
  101a2c:	0f350913          	addi	s2,a0,243 # 1030f3 <__modsi3+0x13f>
  101a30:	00f00993          	li	s3,15
  101a34:	20000a13          	li	s4,512
  101a38:	00c0006f          	j	101a44 <s_call_sdcard_read_api+0x1d8>
    }

    // ---- dump（常に実行）----
    const char hex[] = "0123456789ABCDEF";

    for (int i = 0; i < 512; i++) {
  101a3c:	00140413          	addi	s0,s0,1
  101a40:	05440c63          	beq	s0,s4,101a98 <s_call_sdcard_read_api+0x22c>
        unsigned char d = buf[i];
  101a44:	00848533          	add	a0,s1,s0
  101a48:	00054a83          	lbu	s5,0(a0)
  101a4c:	004ad513          	srli	a0,s5,0x4
        putchar(hex[(d >> 4) & 0xF]);
  101a50:	00a90533          	add	a0,s2,a0
  101a54:	00054503          	lbu	a0,0(a0)
  101a58:	ffffe097          	auipc	ra,0xffffe
  101a5c:	5bc080e7          	jalr	1468(ra) # 100014 <putchar>
        putchar(hex[d & 0xF]);
  101a60:	00faf513          	andi	a0,s5,15
  101a64:	00a90533          	add	a0,s2,a0
  101a68:	00054503          	lbu	a0,0(a0)
  101a6c:	ffffe097          	auipc	ra,0xffffe
  101a70:	5a8080e7          	jalr	1448(ra) # 100014 <putchar>
        putchar(' ');
  101a74:	02000513          	li	a0,32
  101a78:	ffffe097          	auipc	ra,0xffffe
  101a7c:	59c080e7          	jalr	1436(ra) # 100014 <putchar>
        if ((i & 15) == 15) putchar('\n');
  101a80:	00f47513          	andi	a0,s0,15
  101a84:	fb351ce3          	bne	a0,s3,101a3c <s_call_sdcard_read_api+0x1d0>
  101a88:	00a00513          	li	a0,10
  101a8c:	ffffe097          	auipc	ra,0xffffe
  101a90:	588080e7          	jalr	1416(ra) # 100014 <putchar>
  101a94:	fa9ff06f          	j	101a3c <s_call_sdcard_read_api+0x1d0>
  101a98:	22c12083          	lw	ra,556(sp)
  101a9c:	22812403          	lw	s0,552(sp)
  101aa0:	22412483          	lw	s1,548(sp)
  101aa4:	22012903          	lw	s2,544(sp)
  101aa8:	21c12983          	lw	s3,540(sp)
  101aac:	21812a03          	lw	s4,536(sp)
  101ab0:	21412a83          	lw	s5,532(sp)
  101ab4:	21012b03          	lw	s6,528(sp)
  101ab8:	20c12b83          	lw	s7,524(sp)
    }
  101abc:	23010113          	addi	sp,sp,560
  101ac0:	00008067          	ret

00101ac4 <boot_fat32_cluster_to_lba>:

    return 1;
}

uint32_t boot_fat32_cluster_to_lba(uint32_t cluster)
{
  101ac4:	ff010113          	addi	sp,sp,-16
  101ac8:	00112623          	sw	ra,12(sp)
  101acc:	00812423          	sw	s0,8(sp)
    uint32_t lba;
    uint32_t n;

    //s_printf("FAT32: c2l enter\n");

    lba = g_data_begin_lba;
  101ad0:	001045b7          	lui	a1,0x104
  101ad4:	9a85a403          	lw	s0,-1624(a1) # 1039a8 <g_data_begin_lba>
  101ad8:	00100593          	li	a1,1

    if (cluster < 2u) {
  101adc:	00a5ec63          	bltu	a1,a0,101af4 <boot_fat32_cluster_to_lba+0x30>
        s_printf("FAT32: c2l bad\n");
  101ae0:	00103537          	lui	a0,0x103
  101ae4:	41250513          	addi	a0,a0,1042 # 103412 <$d.3>
  101ae8:	fffff097          	auipc	ra,0xfffff
  101aec:	33c080e7          	jalr	828(ra) # 100e24 <s_printf>
  101af0:	0200006f          	j	101b10 <boot_fat32_cluster_to_lba+0x4c>
        return lba;
    }

    //s_printf("FAT32: c2l sub\n");

    n = cluster - 2u;
  101af4:	ffe50593          	addi	a1,a0,-2

    //s_printf("FAT32: c2l loop\n");

    while (n > 0u) {
  101af8:	00058c63          	beqz	a1,101b10 <boot_fat32_cluster_to_lba+0x4c>
  101afc:	00104537          	lui	a0,0x104
  101b00:	9ac52503          	lw	a0,-1620(a0) # 1039ac <g_sectors_per_cluster>
  101b04:	00001097          	auipc	ra,0x1
  101b08:	444080e7          	jalr	1092(ra) # 102f48 <__mulsi3>
  101b0c:	00a40433          	add	s0,s0,a0
    }

    //s_printf("FAT32: c2l done\n");

    return lba;
}
  101b10:	00040513          	mv	a0,s0
  101b14:	00c12083          	lw	ra,12(sp)
  101b18:	00812403          	lw	s0,8(sp)
  101b1c:	01010113          	addi	sp,sp,16
  101b20:	00008067          	ret

00101b24 <boot_fat32_mount>:

int boot_fat32_mount(boot_sd_read_sector_fn read_sector)
{
  101b24:	fc010113          	addi	sp,sp,-64
  101b28:	02112e23          	sw	ra,60(sp)
  101b2c:	02812c23          	sw	s0,56(sp)
  101b30:	02912a23          	sw	s1,52(sp)
  101b34:	03212823          	sw	s2,48(sp)
  101b38:	03312623          	sw	s3,44(sp)
  101b3c:	03412423          	sw	s4,40(sp)
  101b40:	03512223          	sw	s5,36(sp)
  101b44:	03612023          	sw	s6,32(sp)
  101b48:	01712e23          	sw	s7,28(sp)
  101b4c:	01812c23          	sw	s8,24(sp)
  101b50:	01912a23          	sw	s9,20(sp)
  101b54:	01a12823          	sw	s10,16(sp)
  101b58:	01b12623          	sw	s11,12(sp)
  101b5c:	00050493          	mv	s1,a0
    uint32_t bytes_per_sector;
    uint32_t reserved_sector_count;
    uint32_t fat_count;
    uint32_t fat_size;

    s_printf("FAT32: mount enter\n");
  101b60:	00103537          	lui	a0,0x103
  101b64:	67950513          	addi	a0,a0,1657 # 103679 <print_hex8.HEX+0x11>
  101b68:	fffff097          	auipc	ra,0xfffff
  101b6c:	2bc080e7          	jalr	700(ra) # 100e24 <s_printf>

    g_read_sector = read_sector;
  101b70:	00104937          	lui	s2,0x104
  101b74:	9a992823          	sw	s1,-1616(s2) # 1039b0 <g_read_sector>
  101b78:	fff00413          	li	s0,-1

    if (g_read_sector == 0) {
  101b7c:	02048e63          	beqz	s1,101bb8 <boot_fat32_mount+0x94>
        s_printf("FAT32: read_sector null\n");
        return -1;
    }

    s_printf("FAT32: read LBA0\n");
  101b80:	00103537          	lui	a0,0x103
  101b84:	5f950513          	addi	a0,a0,1529 # 1035f9 <$d.3+0x1e7>
  101b88:	fffff097          	auipc	ra,0xfffff
  101b8c:	29c080e7          	jalr	668(ra) # 100e24 <s_printf>

    if (g_read_sector(0, buf)) {
  101b90:	9b092603          	lw	a2,-1616(s2)
  101b94:	00108537          	lui	a0,0x108
  101b98:	9c050493          	addi	s1,a0,-1600 # 1079c0 <fat32_buf>
  101b9c:	00000513          	li	a0,0
  101ba0:	00048593          	mv	a1,s1
  101ba4:	000600e7          	jalr	a2
  101ba8:	06050063          	beqz	a0,101c08 <boot_fat32_mount+0xe4>
  101bac:	00103537          	lui	a0,0x103
  101bb0:	42250513          	addi	a0,a0,1058 # 103422 <$d.3+0x10>
  101bb4:	00c0006f          	j	101bc0 <boot_fat32_mount+0x9c>
  101bb8:	00103537          	lui	a0,0x103
  101bbc:	3c650513          	addi	a0,a0,966 # 1033c6 <$d.1+0x29c>
  101bc0:	fffff097          	auipc	ra,0xfffff
  101bc4:	264080e7          	jalr	612(ra) # 100e24 <s_printf>
    }

    s_printf("FAT32: mount ok\n");

    return 0;
}
  101bc8:	00040513          	mv	a0,s0
  101bcc:	03c12083          	lw	ra,60(sp)
  101bd0:	03812403          	lw	s0,56(sp)
  101bd4:	03412483          	lw	s1,52(sp)
  101bd8:	03012903          	lw	s2,48(sp)
  101bdc:	02c12983          	lw	s3,44(sp)
  101be0:	02812a03          	lw	s4,40(sp)
  101be4:	02412a83          	lw	s5,36(sp)
  101be8:	02012b03          	lw	s6,32(sp)
  101bec:	01c12b83          	lw	s7,28(sp)
  101bf0:	01812c03          	lw	s8,24(sp)
  101bf4:	01412c83          	lw	s9,20(sp)
  101bf8:	01012d03          	lw	s10,16(sp)
  101bfc:	00c12d83          	lw	s11,12(sp)
  101c00:	04010113          	addi	sp,sp,64
  101c04:	00008067          	ret
    s_printf("FAT32: read LBA0 ok\n");
  101c08:	00103537          	lui	a0,0x103
  101c0c:	22050513          	addi	a0,a0,544 # 103220 <$d.1+0xf6>
  101c10:	fffff097          	auipc	ra,0xfffff
  101c14:	214080e7          	jalr	532(ra) # 100e24 <s_printf>
    if (b[510] != 0x55 || b[511] != 0xAA)
  101c18:	1fe4c583          	lbu	a1,510(s1)
  101c1c:	00103537          	lui	a0,0x103
  101c20:	05500613          	li	a2,85
  101c24:	2d850513          	addi	a0,a0,728 # 1032d8 <$d.1+0x1ae>
  101c28:	f8c59ce3          	bne	a1,a2,101bc0 <boot_fat32_mount+0x9c>
  101c2c:	1ff4c583          	lbu	a1,511(s1)
  101c30:	0aa00613          	li	a2,170
  101c34:	f8c596e3          	bne	a1,a2,101bc0 <boot_fat32_mount+0x9c>
    return (uint16_t)p[0] |
  101c38:	00108537          	lui	a0,0x108
  101c3c:	9c050513          	addi	a0,a0,-1600 # 1079c0 <fat32_buf>
           ((uint16_t)p[1] << 8);
  101c40:	00c54583          	lbu	a1,12(a0)
    return (uint16_t)p[0] |
  101c44:	00b54603          	lbu	a2,11(a0)
           ((uint16_t)p[1] << 8);
  101c48:	00859593          	slli	a1,a1,0x8
    return (uint16_t)p[0] |
  101c4c:	00c5e5b3          	or	a1,a1,a2
  101c50:	01059593          	slli	a1,a1,0x10
  101c54:	0105d593          	srli	a1,a1,0x10
  101c58:	20000613          	li	a2,512
    if (rd16(&b[11]) != 512u)
  101c5c:	08c59863          	bne	a1,a2,101cec <boot_fat32_mount+0x1c8>
  101c60:	00d54583          	lbu	a1,13(a0)
  101c64:	08058463          	beqz	a1,101cec <boot_fat32_mount+0x1c8>
    return (uint16_t)p[0] |
  101c68:	001085b7          	lui	a1,0x108
  101c6c:	9c058593          	addi	a1,a1,-1600 # 1079c0 <fat32_buf>
  101c70:	00e5c603          	lbu	a2,14(a1)
           ((uint16_t)p[1] << 8);
  101c74:	00f5c683          	lbu	a3,15(a1)
    if (rd16(&b[14]) == 0)
  101c78:	00d66633          	or	a2,a2,a3
  101c7c:	06060863          	beqz	a2,101cec <boot_fat32_mount+0x1c8>
  101c80:	0105c583          	lbu	a1,16(a1)
  101c84:	06058463          	beqz	a1,101cec <boot_fat32_mount+0x1c8>
    return ((uint32_t)p[0]) |
  101c88:	001085b7          	lui	a1,0x108
  101c8c:	9c058593          	addi	a1,a1,-1600 # 1079c0 <fat32_buf>
           ((uint32_t)p[1] << 8) |
  101c90:	0255c603          	lbu	a2,37(a1)
    return ((uint32_t)p[0]) |
  101c94:	0245c683          	lbu	a3,36(a1)
           ((uint32_t)p[2] << 16) |
  101c98:	0265c703          	lbu	a4,38(a1)
           ((uint32_t)p[3] << 24);
  101c9c:	0275c783          	lbu	a5,39(a1)
           ((uint32_t)p[1] << 8) |
  101ca0:	00861613          	slli	a2,a2,0x8
    return ((uint32_t)p[0]) |
  101ca4:	00d66633          	or	a2,a2,a3
           ((uint32_t)p[2] << 16) |
  101ca8:	01071713          	slli	a4,a4,0x10
           ((uint32_t)p[3] << 24);
  101cac:	01879793          	slli	a5,a5,0x18
           ((uint32_t)p[1] << 8) |
  101cb0:	00f76733          	or	a4,a4,a5
           ((uint32_t)p[2] << 16) |
  101cb4:	00e66633          	or	a2,a2,a4
    if (rd32(&b[36]) == 0)
  101cb8:	02060a63          	beqz	a2,101cec <boot_fat32_mount+0x1c8>
           ((uint32_t)p[1] << 8) |
  101cbc:	02d5c603          	lbu	a2,45(a1)
    return ((uint32_t)p[0]) |
  101cc0:	02c5c683          	lbu	a3,44(a1)
           ((uint32_t)p[2] << 16) |
  101cc4:	02e5c703          	lbu	a4,46(a1)
           ((uint32_t)p[3] << 24);
  101cc8:	02f5c583          	lbu	a1,47(a1)
           ((uint32_t)p[1] << 8) |
  101ccc:	00861613          	slli	a2,a2,0x8
    return ((uint32_t)p[0]) |
  101cd0:	00d66633          	or	a2,a2,a3
           ((uint32_t)p[2] << 16) |
  101cd4:	01071713          	slli	a4,a4,0x10
           ((uint32_t)p[3] << 24);
  101cd8:	01859593          	slli	a1,a1,0x18
           ((uint32_t)p[1] << 8) |
  101cdc:	00b765b3          	or	a1,a4,a1
           ((uint32_t)p[2] << 16) |
  101ce0:	00b665b3          	or	a1,a2,a1
  101ce4:	00200613          	li	a2,2
    if (is_fat32_boot_sector(buf)) {
  101ce8:	0cc5f263          	bgeu	a1,a2,101dac <boot_fat32_mount+0x288>
           ((uint32_t)p[1] << 8) |
  101cec:	1c754583          	lbu	a1,455(a0)
    return ((uint32_t)p[0]) |
  101cf0:	1c654603          	lbu	a2,454(a0)
           ((uint32_t)p[2] << 16) |
  101cf4:	1c854683          	lbu	a3,456(a0)
           ((uint32_t)p[3] << 24);
  101cf8:	1c954503          	lbu	a0,457(a0)
           ((uint32_t)p[1] << 8) |
  101cfc:	00859593          	slli	a1,a1,0x8
    return ((uint32_t)p[0]) |
  101d00:	00c5e5b3          	or	a1,a1,a2
           ((uint32_t)p[2] << 16) |
  101d04:	01069693          	slli	a3,a3,0x10
           ((uint32_t)p[3] << 24);
  101d08:	01851513          	slli	a0,a0,0x18
           ((uint32_t)p[1] << 8) |
  101d0c:	00a6e533          	or	a0,a3,a0
           ((uint32_t)p[2] << 16) |
  101d10:	00a5e533          	or	a0,a1,a0
        g_part_lba = rd32(&buf[0x1C6]);
  101d14:	001044b7          	lui	s1,0x104
  101d18:	9aa4aa23          	sw	a0,-1612(s1) # 1039b4 <g_part_lba>
        s_printf("FAT32: part ok\n");
  101d1c:	00103537          	lui	a0,0x103
  101d20:	64850513          	addi	a0,a0,1608 # 103648 <$d.3+0x236>
  101d24:	fffff097          	auipc	ra,0xfffff
  101d28:	100080e7          	jalr	256(ra) # 100e24 <s_printf>
        if (g_part_lba == 0u) {
  101d2c:	9b44a503          	lw	a0,-1612(s1)
  101d30:	02050e63          	beqz	a0,101d6c <boot_fat32_mount+0x248>
        s_printf("FAT32: read BPB\n");
  101d34:	00103537          	lui	a0,0x103
  101d38:	4b250513          	addi	a0,a0,1202 # 1034b2 <$d.3+0xa0>
  101d3c:	fffff097          	auipc	ra,0xfffff
  101d40:	0e8080e7          	jalr	232(ra) # 100e24 <s_printf>
        if (g_read_sector(g_part_lba, buf)) {
  101d44:	00104537          	lui	a0,0x104
  101d48:	9b052603          	lw	a2,-1616(a0) # 1039b0 <g_read_sector>
  101d4c:	9b44a503          	lw	a0,-1612(s1)
  101d50:	001085b7          	lui	a1,0x108
  101d54:	9c058593          	addi	a1,a1,-1600 # 1079c0 <fat32_buf>
  101d58:	000600e7          	jalr	a2
  101d5c:	00050e63          	beqz	a0,101d78 <boot_fat32_mount+0x254>
  101d60:	00103537          	lui	a0,0x103
  101d64:	19850513          	addi	a0,a0,408 # 103198 <$d.1+0x6e>
  101d68:	e59ff06f          	j	101bc0 <boot_fat32_mount+0x9c>
  101d6c:	00103537          	lui	a0,0x103
  101d70:	32850513          	addi	a0,a0,808 # 103328 <$d.1+0x1fe>
  101d74:	e4dff06f          	j	101bc0 <boot_fat32_mount+0x9c>
        s_printf("FAT32: read BPB ok\n");
  101d78:	00103537          	lui	a0,0x103
  101d7c:	06f50513          	addi	a0,a0,111 # 10306f <__modsi3+0xbb>
  101d80:	fffff097          	auipc	ra,0xfffff
  101d84:	0a4080e7          	jalr	164(ra) # 100e24 <s_printf>
        if (!is_fat32_boot_sector(buf)) {
  101d88:	00000097          	auipc	ra,0x0
  101d8c:	308080e7          	jalr	776(ra) # 102090 <is_fat32_boot_sector>
  101d90:	00050863          	beqz	a0,101da0 <boot_fat32_mount+0x27c>
  101d94:	00103537          	lui	a0,0x103
  101d98:	08350513          	addi	a0,a0,131 # 103083 <__modsi3+0xcf>
  101d9c:	0200006f          	j	101dbc <boot_fat32_mount+0x298>
  101da0:	00103537          	lui	a0,0x103
  101da4:	03650513          	addi	a0,a0,54 # 103036 <__modsi3+0x82>
  101da8:	e19ff06f          	j	101bc0 <boot_fat32_mount+0x9c>
        g_part_lba = 0;
  101dac:	00104537          	lui	a0,0x104
  101db0:	9a052a23          	sw	zero,-1612(a0) # 1039b4 <g_part_lba>
  101db4:	00103537          	lui	a0,0x103
  101db8:	59550513          	addi	a0,a0,1429 # 103595 <$d.3+0x183>
  101dbc:	fffff097          	auipc	ra,0xfffff
  101dc0:	068080e7          	jalr	104(ra) # 100e24 <s_printf>
    s_printf("FAT32: parse 1\n");
  101dc4:	00103537          	lui	a0,0x103
  101dc8:	1d650513          	addi	a0,a0,470 # 1031d6 <$d.1+0xac>
  101dcc:	fffff097          	auipc	ra,0xfffff
  101dd0:	058080e7          	jalr	88(ra) # 100e24 <s_printf>
    return (uint16_t)p[0] |
  101dd4:	00108537          	lui	a0,0x108
  101dd8:	9c050d93          	addi	s11,a0,-1600 # 1079c0 <fat32_buf>
           ((uint16_t)p[1] << 8);
  101ddc:	00cdc503          	lbu	a0,12(s11)
    return (uint16_t)p[0] |
  101de0:	00bdc583          	lbu	a1,11(s11)
           ((uint16_t)p[1] << 8);
  101de4:	00851513          	slli	a0,a0,0x8
    return (uint16_t)p[0] |
  101de8:	00b56533          	or	a0,a0,a1
  101dec:	000109b7          	lui	s3,0x10
  101df0:	fff98993          	addi	s3,s3,-1 # ffff <$d.7+0xe1b7>
  101df4:	01357933          	and	s2,a0,s3
    s_printf("FAT32: parse 2\n");
  101df8:	00103537          	lui	a0,0x103
  101dfc:	09550513          	addi	a0,a0,149 # 103095 <__modsi3+0xe1>
  101e00:	fffff097          	auipc	ra,0xfffff
  101e04:	024080e7          	jalr	36(ra) # 100e24 <s_printf>
    g_sectors_per_cluster = buf[13];
  101e08:	00ddc503          	lbu	a0,13(s11)
  101e0c:	00104a37          	lui	s4,0x104
  101e10:	9aaa2623          	sw	a0,-1620(s4) # 1039ac <g_sectors_per_cluster>
    s_printf("FAT32: parse 3\n");
  101e14:	00103537          	lui	a0,0x103
  101e18:	53a50513          	addi	a0,a0,1338 # 10353a <$d.3+0x128>
  101e1c:	fffff097          	auipc	ra,0xfffff
  101e20:	008080e7          	jalr	8(ra) # 100e24 <s_printf>
    return (uint16_t)p[0] |
  101e24:	00edca83          	lbu	s5,14(s11)
           ((uint16_t)p[1] << 8);
  101e28:	00fdcb03          	lbu	s6,15(s11)
    s_printf("FAT32: parse 4\n");
  101e2c:	00103537          	lui	a0,0x103
  101e30:	75050513          	addi	a0,a0,1872 # 103750 <$d.1+0x9b>
  101e34:	fffff097          	auipc	ra,0xfffff
  101e38:	ff0080e7          	jalr	-16(ra) # 100e24 <s_printf>
    fat_count = buf[16];
  101e3c:	010dc483          	lbu	s1,16(s11)
    s_printf("FAT32: parse 5\n");
  101e40:	00103537          	lui	a0,0x103
  101e44:	65850513          	addi	a0,a0,1624 # 103658 <$d.3+0x246>
  101e48:	fffff097          	auipc	ra,0xfffff
  101e4c:	fdc080e7          	jalr	-36(ra) # 100e24 <s_printf>
    return ((uint32_t)p[0]) |
  101e50:	024dcb83          	lbu	s7,36(s11)
           ((uint32_t)p[1] << 8) |
  101e54:	025dcd03          	lbu	s10,37(s11)
           ((uint32_t)p[2] << 16) |
  101e58:	026dcc03          	lbu	s8,38(s11)
           ((uint32_t)p[3] << 24);
  101e5c:	027dcc83          	lbu	s9,39(s11)
    s_printf("FAT32: parse 6\n");
  101e60:	00103537          	lui	a0,0x103
  101e64:	5aa50513          	addi	a0,a0,1450 # 1035aa <$d.3+0x198>
  101e68:	fffff097          	auipc	ra,0xfffff
  101e6c:	fbc080e7          	jalr	-68(ra) # 100e24 <s_printf>
           ((uint32_t)p[1] << 8) |
  101e70:	02ddc503          	lbu	a0,45(s11)
    return ((uint32_t)p[0]) |
  101e74:	02cdc583          	lbu	a1,44(s11)
           ((uint32_t)p[2] << 16) |
  101e78:	02edc603          	lbu	a2,46(s11)
           ((uint32_t)p[3] << 24);
  101e7c:	02fdc683          	lbu	a3,47(s11)
           ((uint32_t)p[1] << 8) |
  101e80:	00851513          	slli	a0,a0,0x8
    return ((uint32_t)p[0]) |
  101e84:	00b56533          	or	a0,a0,a1
           ((uint32_t)p[2] << 16) |
  101e88:	01061613          	slli	a2,a2,0x10
           ((uint32_t)p[3] << 24);
  101e8c:	01869693          	slli	a3,a3,0x18
           ((uint32_t)p[1] << 8) |
  101e90:	00d66633          	or	a2,a2,a3
           ((uint32_t)p[2] << 16) |
  101e94:	00c56533          	or	a0,a0,a2
    g_root_cluster = rd32(&buf[44]);
  101e98:	001045b7          	lui	a1,0x104
  101e9c:	9aa5ac23          	sw	a0,-1608(a1) # 1039b8 <g_root_cluster>
    s_printf("FAT32: validate\n");
  101ea0:	00103537          	lui	a0,0x103
  101ea4:	13e50513          	addi	a0,a0,318 # 10313e <$d.1+0x14>
  101ea8:	fffff097          	auipc	ra,0xfffff
  101eac:	f7c080e7          	jalr	-132(ra) # 100e24 <s_printf>
  101eb0:	20000513          	li	a0,512
    if (bytes_per_sector != 512u) {
  101eb4:	02a91c63          	bne	s2,a0,101eec <boot_fat32_mount+0x3c8>
    if (g_sectors_per_cluster == 0u) {
  101eb8:	9aca2503          	lw	a0,-1620(s4)
  101ebc:	02050e63          	beqz	a0,101ef8 <boot_fat32_mount+0x3d4>
  101ec0:	008b1b13          	slli	s6,s6,0x8
  101ec4:	015b6533          	or	a0,s6,s5
    if (reserved_sector_count == 0u) {
  101ec8:	01051593          	slli	a1,a0,0x10
  101ecc:	02058c63          	beqz	a1,101f04 <boot_fat32_mount+0x3e0>
    if (fat_count == 0u || fat_count > 4u) {
  101ed0:	ffb48593          	addi	a1,s1,-5
  101ed4:	0ff5f593          	zext.b	a1,a1
  101ed8:	0fc00613          	li	a2,252
  101edc:	02c5fa63          	bgeu	a1,a2,101f10 <boot_fat32_mount+0x3ec>
  101ee0:	00103537          	lui	a0,0x103
  101ee4:	28e50513          	addi	a0,a0,654 # 10328e <$d.1+0x164>
  101ee8:	cd9ff06f          	j	101bc0 <boot_fat32_mount+0x9c>
  101eec:	00103537          	lui	a0,0x103
  101ef0:	76050513          	addi	a0,a0,1888 # 103760 <$d.1+0xab>
  101ef4:	ccdff06f          	j	101bc0 <boot_fat32_mount+0x9c>
  101ef8:	00103537          	lui	a0,0x103
  101efc:	6b850513          	addi	a0,a0,1720 # 1036b8 <$d.1+0x3>
  101f00:	cc1ff06f          	j	101bc0 <boot_fat32_mount+0x9c>
  101f04:	00103537          	lui	a0,0x103
  101f08:	2ec50513          	addi	a0,a0,748 # 1032ec <$d.1+0x1c2>
  101f0c:	cb5ff06f          	j	101bc0 <boot_fat32_mount+0x9c>
  101f10:	008d1d13          	slli	s10,s10,0x8
  101f14:	017d65b3          	or	a1,s10,s7
  101f18:	010c1c13          	slli	s8,s8,0x10
  101f1c:	018c9c93          	slli	s9,s9,0x18
  101f20:	019c6633          	or	a2,s8,s9
  101f24:	00c5e933          	or	s2,a1,a2
    if (fat_size == 0u) {
  101f28:	02090063          	beqz	s2,101f48 <boot_fat32_mount+0x424>
    if (g_root_cluster < 2u) {
  101f2c:	00104ab7          	lui	s5,0x104
  101f30:	9b8aa583          	lw	a1,-1608(s5) # 1039b8 <g_root_cluster>
  101f34:	00200a13          	li	s4,2
  101f38:	0145fe63          	bgeu	a1,s4,101f54 <boot_fat32_mount+0x430>
  101f3c:	00103537          	lui	a0,0x103
  101f40:	fdc50513          	addi	a0,a0,-36 # 102fdc <__modsi3+0x28>
  101f44:	c7dff06f          	j	101bc0 <boot_fat32_mount+0x9c>
  101f48:	00103537          	lui	a0,0x103
  101f4c:	1e650513          	addi	a0,a0,486 # 1031e6 <$d.1+0xbc>
  101f50:	c71ff06f          	j	101bc0 <boot_fat32_mount+0x9c>
  101f54:	01357433          	and	s0,a0,s3
    s_printf("FAT32: root check\n");
  101f58:	00103537          	lui	a0,0x103
  101f5c:	30150513          	addi	a0,a0,769 # 103301 <$d.1+0x1d7>
  101f60:	fffff097          	auipc	ra,0xfffff
  101f64:	ec4080e7          	jalr	-316(ra) # 100e24 <s_printf>
    if (g_root_cluster == 2u)
  101f68:	9b8aa503          	lw	a0,-1608(s5)
  101f6c:	01450863          	beq	a0,s4,101f7c <boot_fat32_mount+0x458>
  101f70:	00103537          	lui	a0,0x103
  101f74:	ff550513          	addi	a0,a0,-11 # 102ff5 <__modsi3+0x41>
  101f78:	00c0006f          	j	101f84 <boot_fat32_mount+0x460>
  101f7c:	00103537          	lui	a0,0x103
  101f80:	0a550513          	addi	a0,a0,165 # 1030a5 <__modsi3+0xf1>
  101f84:	fffff097          	auipc	ra,0xfffff
  101f88:	ea0080e7          	jalr	-352(ra) # 100e24 <s_printf>
    s_printf("FAT32: calc fat\n");
  101f8c:	00103537          	lui	a0,0x103
  101f90:	04a50513          	addi	a0,a0,74 # 10304a <__modsi3+0x96>
  101f94:	fffff097          	auipc	ra,0xfffff
  101f98:	e90080e7          	jalr	-368(ra) # 100e24 <s_printf>
    g_fat_begin_lba = g_part_lba + reserved_sector_count;
  101f9c:	00104537          	lui	a0,0x104
  101fa0:	9b452503          	lw	a0,-1612(a0) # 1039b4 <g_part_lba>
  101fa4:	00850533          	add	a0,a0,s0
  101fa8:	00104437          	lui	s0,0x104
  101fac:	9aa42e23          	sw	a0,-1604(s0) # 1039bc <g_fat_begin_lba>
    s_printf("FAT32: calc data\n");
  101fb0:	00103537          	lui	a0,0x103
  101fb4:	33e50513          	addi	a0,a0,830 # 10333e <$d.1+0x214>
  101fb8:	fffff097          	auipc	ra,0xfffff
  101fbc:	e6c080e7          	jalr	-404(ra) # 100e24 <s_printf>
    g_data_begin_lba = g_fat_begin_lba;
  101fc0:	9bc42503          	lw	a0,-1604(s0)
  101fc4:	00104437          	lui	s0,0x104
  101fc8:	9aa42423          	sw	a0,-1624(s0) # 1039a8 <g_data_begin_lba>
        s_printf("FAT32: add fat1\n");
  101fcc:	00103537          	lui	a0,0x103
  101fd0:	77050513          	addi	a0,a0,1904 # 103770 <$d.1+0xbb>
  101fd4:	fffff097          	auipc	ra,0xfffff
  101fd8:	e50080e7          	jalr	-432(ra) # 100e24 <s_printf>
        g_data_begin_lba += fat_size;
  101fdc:	9a842503          	lw	a0,-1624(s0)
  101fe0:	01250533          	add	a0,a0,s2
  101fe4:	9aa42423          	sw	a0,-1624(s0)
  101fe8:	00103537          	lui	a0,0x103
  101fec:	15f50513          	addi	a0,a0,351 # 10315f <$d.1+0x35>
    if (fat_count >= 2u) {
  101ff0:	0944ec63          	bltu	s1,s4,102088 <boot_fat32_mount+0x564>
  101ff4:	00050993          	mv	s3,a0
        s_printf("FAT32: add fat2\n");
  101ff8:	00103537          	lui	a0,0x103
  101ffc:	26c50513          	addi	a0,a0,620 # 10326c <$d.1+0x142>
  102000:	fffff097          	auipc	ra,0xfffff
  102004:	e24080e7          	jalr	-476(ra) # 100e24 <s_printf>
        g_data_begin_lba += fat_size;
  102008:	9a842503          	lw	a0,-1624(s0)
  10200c:	01250533          	add	a0,a0,s2
  102010:	00200593          	li	a1,2
  102014:	9aa42423          	sw	a0,-1624(s0)
    if (fat_count >= 3u) {
  102018:	00b49863          	bne	s1,a1,102028 <boot_fat32_mount+0x504>
  10201c:	00000413          	li	s0,0
  102020:	00098513          	mv	a0,s3
  102024:	b9dff06f          	j	101bc0 <boot_fat32_mount+0x9c>
        s_printf("FAT32: add fat3\n");
  102028:	00103537          	lui	a0,0x103
  10202c:	27d50513          	addi	a0,a0,637 # 10327d <$d.1+0x153>
  102030:	fffff097          	auipc	ra,0xfffff
  102034:	df4080e7          	jalr	-524(ra) # 100e24 <s_printf>
        g_data_begin_lba += fat_size;
  102038:	001049b7          	lui	s3,0x104
  10203c:	9a89a503          	lw	a0,-1624(s3) # 1039a8 <g_data_begin_lba>
  102040:	01250533          	add	a0,a0,s2
  102044:	9aa9a423          	sw	a0,-1624(s3)
  102048:	00103537          	lui	a0,0x103
  10204c:	00400593          	li	a1,4
  102050:	15f50513          	addi	a0,a0,351 # 10315f <$d.1+0x35>
    if (fat_count >= 4u) {
  102054:	02b4ea63          	bltu	s1,a1,102088 <boot_fat32_mount+0x564>
        s_printf("FAT32: add fat4\n");
  102058:	001035b7          	lui	a1,0x103
  10205c:	4c358593          	addi	a1,a1,1219 # 1034c3 <$d.3+0xb1>
  102060:	00050413          	mv	s0,a0
  102064:	00058513          	mv	a0,a1
  102068:	fffff097          	auipc	ra,0xfffff
  10206c:	dbc080e7          	jalr	-580(ra) # 100e24 <s_printf>
  102070:	00040513          	mv	a0,s0
        g_data_begin_lba += fat_size;
  102074:	9a89a583          	lw	a1,-1624(s3)
  102078:	00000413          	li	s0,0
  10207c:	012585b3          	add	a1,a1,s2
  102080:	9ab9a423          	sw	a1,-1624(s3)
  102084:	b3dff06f          	j	101bc0 <boot_fat32_mount+0x9c>
  102088:	00000413          	li	s0,0
  10208c:	b35ff06f          	j	101bc0 <boot_fat32_mount+0x9c>

00102090 <is_fat32_boot_sector>:
    if (b[510] != 0x55 || b[511] != 0xAA)
  102090:	00108537          	lui	a0,0x108
  102094:	9c050593          	addi	a1,a0,-1600 # 1079c0 <fat32_buf>
  102098:	1fe5c603          	lbu	a2,510(a1)
  10209c:	05500693          	li	a3,85
  1020a0:	00000513          	li	a0,0
  1020a4:	0cd61663          	bne	a2,a3,102170 <is_fat32_boot_sector+0xe0>
  1020a8:	1ff5c583          	lbu	a1,511(a1)
  1020ac:	0aa00613          	li	a2,170
  1020b0:	0cc59063          	bne	a1,a2,102170 <is_fat32_boot_sector+0xe0>
    return (uint16_t)p[0] |
  1020b4:	00108537          	lui	a0,0x108
  1020b8:	9c050593          	addi	a1,a0,-1600 # 1079c0 <fat32_buf>
           ((uint16_t)p[1] << 8);
  1020bc:	00c5c503          	lbu	a0,12(a1)
    return (uint16_t)p[0] |
  1020c0:	00b5c603          	lbu	a2,11(a1)
           ((uint16_t)p[1] << 8);
  1020c4:	00851513          	slli	a0,a0,0x8
    return (uint16_t)p[0] |
  1020c8:	00c56533          	or	a0,a0,a2
  1020cc:	01051513          	slli	a0,a0,0x10
  1020d0:	01055613          	srli	a2,a0,0x10
  1020d4:	20000693          	li	a3,512
  1020d8:	00000513          	li	a0,0
    if (rd16(&b[11]) != 512u)
  1020dc:	08d61a63          	bne	a2,a3,102170 <is_fat32_boot_sector+0xe0>
  1020e0:	00d5c583          	lbu	a1,13(a1)
  1020e4:	08058663          	beqz	a1,102170 <is_fat32_boot_sector+0xe0>
    return (uint16_t)p[0] |
  1020e8:	00108537          	lui	a0,0x108
  1020ec:	9c050593          	addi	a1,a0,-1600 # 1079c0 <fat32_buf>
  1020f0:	00e5c503          	lbu	a0,14(a1)
           ((uint16_t)p[1] << 8);
  1020f4:	00f5c603          	lbu	a2,15(a1)
    if (rd16(&b[14]) == 0)
  1020f8:	00c56633          	or	a2,a0,a2
  1020fc:	00000513          	li	a0,0
  102100:	06060863          	beqz	a2,102170 <is_fat32_boot_sector+0xe0>
  102104:	0105c583          	lbu	a1,16(a1)
  102108:	06058463          	beqz	a1,102170 <is_fat32_boot_sector+0xe0>
    return ((uint32_t)p[0]) |
  10210c:	00108537          	lui	a0,0x108
  102110:	9c050513          	addi	a0,a0,-1600 # 1079c0 <fat32_buf>
           ((uint32_t)p[1] << 8) |
  102114:	02554583          	lbu	a1,37(a0)
    return ((uint32_t)p[0]) |
  102118:	02454603          	lbu	a2,36(a0)
           ((uint32_t)p[2] << 16) |
  10211c:	02654683          	lbu	a3,38(a0)
           ((uint32_t)p[3] << 24);
  102120:	02754703          	lbu	a4,39(a0)
           ((uint32_t)p[1] << 8) |
  102124:	00859593          	slli	a1,a1,0x8
    return ((uint32_t)p[0]) |
  102128:	00c5e5b3          	or	a1,a1,a2
           ((uint32_t)p[2] << 16) |
  10212c:	01069693          	slli	a3,a3,0x10
           ((uint32_t)p[3] << 24);
  102130:	01871713          	slli	a4,a4,0x18
           ((uint32_t)p[1] << 8) |
  102134:	00e6e6b3          	or	a3,a3,a4
           ((uint32_t)p[2] << 16) |
  102138:	00d5e5b3          	or	a1,a1,a3
    if (rd32(&b[36]) == 0)
  10213c:	02058c63          	beqz	a1,102174 <is_fat32_boot_sector+0xe4>
           ((uint32_t)p[1] << 8) |
  102140:	02d54583          	lbu	a1,45(a0)
    return ((uint32_t)p[0]) |
  102144:	02c54603          	lbu	a2,44(a0)
           ((uint32_t)p[2] << 16) |
  102148:	02e54683          	lbu	a3,46(a0)
           ((uint32_t)p[3] << 24);
  10214c:	02f54503          	lbu	a0,47(a0)
           ((uint32_t)p[1] << 8) |
  102150:	00859593          	slli	a1,a1,0x8
    return ((uint32_t)p[0]) |
  102154:	00c5e5b3          	or	a1,a1,a2
           ((uint32_t)p[2] << 16) |
  102158:	01069693          	slli	a3,a3,0x10
           ((uint32_t)p[3] << 24);
  10215c:	01851513          	slli	a0,a0,0x18
           ((uint32_t)p[1] << 8) |
  102160:	00a6e533          	or	a0,a3,a0
           ((uint32_t)p[2] << 16) |
  102164:	00a5e533          	or	a0,a1,a0
    if (rd32(&b[44]) < 2)
  102168:	00253513          	sltiu	a0,a0,2
  10216c:	00154513          	xori	a0,a0,1
}
  102170:	00008067          	ret
  102174:	00000513          	li	a0,0
  102178:	00008067          	ret

0010217c <boot_fat32_next_cluster>:

uint32_t boot_fat32_next_cluster(uint32_t cluster)
{
  10217c:	ff010113          	addi	sp,sp,-16
  102180:	00112623          	sw	ra,12(sp)
  102184:	00812423          	sw	s0,8(sp)
  102188:	00912223          	sw	s1,4(sp)
  10218c:	01212023          	sw	s2,0(sp)
  102190:	10000437          	lui	s0,0x10000
  102194:	00200593          	li	a1,2
  102198:	ff840413          	addi	s0,s0,-8 # ffffff8 <_stack_top+0xfef4238>
    uint32_t fat_offset = cluster * 4u;
    uint32_t fat_lba    = g_fat_begin_lba + (fat_offset / 512u);
    uint32_t ent_off    = fat_offset & 0x1FFu;
    uint32_t next;

    if (cluster < 2u)
  10219c:	06b56463          	bltu	a0,a1,102204 <boot_fat32_next_cluster+0x88>
    uint32_t fat_lba    = g_fat_begin_lba + (fat_offset / 512u);
  1021a0:	001045b7          	lui	a1,0x104
  1021a4:	9bc5a583          	lw	a1,-1604(a1) # 1039bc <g_fat_begin_lba>
        return FAT32_EOC_MIN;

    if (g_read_sector(fat_lba, fat32_buf))
  1021a8:	00104637          	lui	a2,0x104
  1021ac:	9b062603          	lw	a2,-1616(a2) # 1039b0 <g_read_sector>
  1021b0:	00251913          	slli	s2,a0,0x2
    uint32_t fat_lba    = g_fat_begin_lba + (fat_offset / 512u);
  1021b4:	00995513          	srli	a0,s2,0x9
  1021b8:	00a58533          	add	a0,a1,a0
    if (g_read_sector(fat_lba, fat32_buf))
  1021bc:	001085b7          	lui	a1,0x108
  1021c0:	9c058493          	addi	s1,a1,-1600 # 1079c0 <fat32_buf>
  1021c4:	00048593          	mv	a1,s1
  1021c8:	000600e7          	jalr	a2
  1021cc:	02051c63          	bnez	a0,102204 <boot_fat32_next_cluster+0x88>
  1021d0:	1fc97513          	andi	a0,s2,508
        return FAT32_EOC_MIN;

    next = rd32(&fat32_buf[ent_off]);
  1021d4:	00a48533          	add	a0,s1,a0
           ((uint32_t)p[1] << 8) |
  1021d8:	00154583          	lbu	a1,1(a0)
    return ((uint32_t)p[0]) |
  1021dc:	00054603          	lbu	a2,0(a0)
           ((uint32_t)p[2] << 16) |
  1021e0:	00254683          	lbu	a3,2(a0)
           ((uint32_t)p[1] << 8) |
  1021e4:	00859593          	slli	a1,a1,0x8
           ((uint32_t)p[3] << 24);
  1021e8:	00354503          	lbu	a0,3(a0)
    return ((uint32_t)p[0]) |
  1021ec:	00c5e5b3          	or	a1,a1,a2
           ((uint32_t)p[2] << 16) |
  1021f0:	01069693          	slli	a3,a3,0x10
           ((uint32_t)p[1] << 8) |
  1021f4:	00d5e5b3          	or	a1,a1,a3
    next &= 0x0FFFFFFFu;
  1021f8:	01c51513          	slli	a0,a0,0x1c
  1021fc:	00455513          	srli	a0,a0,0x4
  102200:	00a5e433          	or	s0,a1,a0

    return next;
}
  102204:	00040513          	mv	a0,s0
  102208:	00c12083          	lw	ra,12(sp)
  10220c:	00812403          	lw	s0,8(sp)
  102210:	00412483          	lw	s1,4(sp)
  102214:	00012903          	lw	s2,0(sp)
  102218:	01010113          	addi	sp,sp,16
  10221c:	00008067          	ret

00102220 <boot_fat32_find>:
int boot_fat32_find(
    const char *name,
    uint32_t *cluster,
    uint32_t *size
)
{
  102220:	f8010113          	addi	sp,sp,-128
  102224:	06112e23          	sw	ra,124(sp)
  102228:	06812c23          	sw	s0,120(sp)
  10222c:	06912a23          	sw	s1,116(sp)
  102230:	07212823          	sw	s2,112(sp)
  102234:	07312623          	sw	s3,108(sp)
  102238:	07412423          	sw	s4,104(sp)
  10223c:	07512223          	sw	s5,100(sp)
  102240:	07612023          	sw	s6,96(sp)
  102244:	05712e23          	sw	s7,92(sp)
  102248:	05812c23          	sw	s8,88(sp)
  10224c:	05912a23          	sw	s9,84(sp)
  102250:	05a12823          	sw	s10,80(sp)
  102254:	05b12623          	sw	s11,76(sp)
  102258:	02c12a23          	sw	a2,52(sp)
  10225c:	02b12823          	sw	a1,48(sp)
  102260:	00050913          	mv	s2,a0
    uint32_t dir_cluster;
    char target[11];

    s_printf("FAT32: find enter\n");
  102264:	00103537          	lui	a0,0x103
  102268:	6e850513          	addi	a0,a0,1768 # 1036e8 <$d.1+0x33>
  10226c:	fffff097          	auipc	ra,0xfffff
  102270:	bb8080e7          	jalr	-1096(ra) # 100e24 <s_printf>
  102274:	02000593          	li	a1,32

    for (int i = 0; i < 11; i++)
        target[i] = ' ';
  102278:	04b100a3          	sb	a1,65(sp)
  10227c:	04b10123          	sb	a1,66(sp)
  102280:	04b101a3          	sb	a1,67(sp)
  102284:	04b10223          	sb	a1,68(sp)
  102288:	04b102a3          	sb	a1,69(sp)
  10228c:	04b10323          	sb	a1,70(sp)
  102290:	04b103a3          	sb	a1,71(sp)

    {
        int i = 0;
        int j = 0;

        while (name[i] != '\0' && name[i] != '.' && j < 8) {
  102294:	00094503          	lbu	a0,0(s2)
        target[i] = ' ';
  102298:	04b10423          	sb	a1,72(sp)
  10229c:	04b104a3          	sb	a1,73(sp)
  1022a0:	04b10523          	sb	a1,74(sp)
  1022a4:	04b105a3          	sb	a1,75(sp)
        while (name[i] != '\0' && name[i] != '.' && j < 8) {
  1022a8:	04050e63          	beqz	a0,102304 <boot_fat32_find+0xe4>
  1022ac:	00000593          	li	a1,0
  1022b0:	00190613          	addi	a2,s2,1
  1022b4:	02e00693          	li	a3,46
  1022b8:	00700713          	li	a4,7
  1022bc:	04110793          	addi	a5,sp,65
  1022c0:	0ff57813          	zext.b	a6,a0
  1022c4:	04d80463          	beq	a6,a3,10230c <boot_fat32_find+0xec>
  1022c8:	04b76263          	bltu	a4,a1,10230c <boot_fat32_find+0xec>
    if (c >= 'a' && c <= 'z')
  1022cc:	f9f50813          	addi	a6,a0,-97
  1022d0:	0ff87813          	zext.b	a6,a6
  1022d4:	01a83813          	sltiu	a6,a6,26
  1022d8:	41000833          	neg	a6,a6
  1022dc:	0e087813          	andi	a6,a6,224
  1022e0:	010508b3          	add	a7,a0,a6
        while (name[i] != '\0' && name[i] != '.' && j < 8) {
  1022e4:	00b60533          	add	a0,a2,a1
  1022e8:	00054503          	lbu	a0,0(a0)
            target[j++] = upper_char(name[i]);
            i++;
  1022ec:	00158813          	addi	a6,a1,1
            target[j++] = upper_char(name[i]);
  1022f0:	00b785b3          	add	a1,a5,a1
  1022f4:	01158023          	sb	a7,0(a1)
  1022f8:	00080593          	mv	a1,a6
        while (name[i] != '\0' && name[i] != '.' && j < 8) {
  1022fc:	fc0512e3          	bnez	a0,1022c0 <boot_fat32_find+0xa0>
  102300:	0100006f          	j	102310 <boot_fat32_find+0xf0>
  102304:	00000813          	li	a6,0
  102308:	0180006f          	j	102320 <boot_fat32_find+0x100>
  10230c:	00058813          	mv	a6,a1
        }

        if (name[i] == '.')
  102310:	0ff57513          	zext.b	a0,a0
  102314:	fd250513          	addi	a0,a0,-46
  102318:	00153513          	seqz	a0,a0
  10231c:	00a80833          	add	a6,a6,a0
            i++;

        j = 8;

        while (name[i] != '\0' && j < 11) {
  102320:	010905b3          	add	a1,s2,a6
  102324:	0005c503          	lbu	a0,0(a1)
  102328:	04050663          	beqz	a0,102374 <boot_fat32_find+0x154>
  10232c:	00158593          	addi	a1,a1,1
  102330:	00800713          	li	a4,8
  102334:	04110613          	addi	a2,sp,65
  102338:	00a00693          	li	a3,10
    if (c >= 'a' && c <= 'z')
  10233c:	f9f50793          	addi	a5,a0,-97
  102340:	0ff7f793          	zext.b	a5,a5
  102344:	01a7b793          	sltiu	a5,a5,26
  102348:	40f007b3          	neg	a5,a5
  10234c:	0e07f793          	andi	a5,a5,224
  102350:	00f50833          	add	a6,a0,a5
        while (name[i] != '\0' && j < 11) {
  102354:	0005c503          	lbu	a0,0(a1)
  102358:	00070793          	mv	a5,a4
            target[j++] = upper_char(name[i]);
  10235c:	00e60733          	add	a4,a2,a4
  102360:	01070023          	sb	a6,0(a4)
        while (name[i] != '\0' && j < 11) {
  102364:	00050863          	beqz	a0,102374 <boot_fat32_find+0x154>
  102368:	00178713          	addi	a4,a5,1
  10236c:	00158593          	addi	a1,a1,1
  102370:	fcd7e6e3          	bltu	a5,a3,10233c <boot_fat32_find+0x11c>
            i++;
        }
    }

    dir_cluster = g_root_cluster;
  102374:	00104537          	lui	a0,0x104
  102378:	9b852483          	lw	s1,-1608(a0) # 1039b8 <g_root_cluster>

    s_printf("FAT32: root loop\n");
  10237c:	00103537          	lui	a0,0x103
  102380:	44a50513          	addi	a0,a0,1098 # 10344a <$d.3+0x38>
  102384:	fffff097          	auipc	ra,0xfffff
  102388:	aa0080e7          	jalr	-1376(ra) # 100e24 <s_printf>

    while (dir_cluster >= 2u &&
  10238c:	ffe48593          	addi	a1,s1,-2
  102390:	10000537          	lui	a0,0x10000
  102394:	ff450613          	addi	a2,a0,-12 # ffffff4 <_stack_top+0xfef4234>
  102398:	22b66c63          	bltu	a2,a1,1025d0 <boot_fat32_find+0x3b0>
  10239c:	04114c03          	lbu	s8,65(sp)
  1023a0:	04214c83          	lbu	s9,66(sp)
  1023a4:	04314d03          	lbu	s10,67(sp)
  1023a8:	04414583          	lbu	a1,68(sp)
  1023ac:	02b12c23          	sw	a1,56(sp)
  1023b0:	04514583          	lbu	a1,69(sp)
  1023b4:	02b12223          	sw	a1,36(sp)
  1023b8:	04614583          	lbu	a1,70(sp)
  1023bc:	00b12e23          	sw	a1,28(sp)
  1023c0:	04714583          	lbu	a1,71(sp)
  1023c4:	00b12c23          	sw	a1,24(sp)
  1023c8:	04814583          	lbu	a1,72(sp)
  1023cc:	00b12a23          	sw	a1,20(sp)
  1023d0:	04914583          	lbu	a1,73(sp)
  1023d4:	00b12823          	sw	a1,16(sp)
  1023d8:	04a14583          	lbu	a1,74(sp)
  1023dc:	00b12623          	sw	a1,12(sp)
  1023e0:	04b14583          	lbu	a1,75(sp)
  1023e4:	00b12423          	sw	a1,8(sp)
  1023e8:	001035b7          	lui	a1,0x103
  1023ec:	6fb58913          	addi	s2,a1,1787 # 1036fb <$d.1+0x46>
  1023f0:	001035b7          	lui	a1,0x103
  1023f4:	3df58593          	addi	a1,a1,991 # 1033df <$d.1+0x2b5>
  1023f8:	02b12e23          	sw	a1,60(sp)
  1023fc:	001049b7          	lui	s3,0x104
  102400:	001035b7          	lui	a1,0x103
  102404:	2b258593          	addi	a1,a1,690 # 1032b2 <$d.1+0x188>
  102408:	02b12423          	sw	a1,40(sp)
  10240c:	00104ab7          	lui	s5,0x104
  102410:	001085b7          	lui	a1,0x108
  102414:	9c058413          	addi	s0,a1,-1600 # 1079c0 <fat32_buf>
  102418:	ff550513          	addi	a0,a0,-11
  10241c:	02a12023          	sw	a0,32(sp)
  102420:	00103537          	lui	a0,0x103
  102424:	78150b13          	addi	s6,a0,1921 # 103781 <$d.1+0xcc>
  102428:	0e500d93          	li	s11,229
  10242c:	00103537          	lui	a0,0x103
  102430:	2a450b93          	addi	s7,a0,676 # 1032a4 <$d.1+0x17a>
  102434:	03212623          	sw	s2,44(sp)
           dir_cluster < FAT32_EOC_MIN &&
           dir_cluster != FAT32_BAD_CLUSTER) {

        uint32_t dir_lba;

        s_printf("FAT32: calc lba\n");
  102438:	00090513          	mv	a0,s2
  10243c:	fffff097          	auipc	ra,0xfffff
  102440:	9e8080e7          	jalr	-1560(ra) # 100e24 <s_printf>
  102444:	00104537          	lui	a0,0x104

        /* root cluster = 2 固定で検証 */
        dir_lba = g_data_begin_lba;
  102448:	9a852a03          	lw	s4,-1624(a0) # 1039a8 <g_data_begin_lba>
  10244c:	03c12503          	lw	a0,60(sp)

        s_printf("FAT32: read dir\n");
  102450:	fffff097          	auipc	ra,0xfffff
  102454:	9d4080e7          	jalr	-1580(ra) # 100e24 <s_printf>

        for (uint32_t s = 0; s < g_sectors_per_cluster; s++) {
  102458:	9ac9a503          	lw	a0,-1620(s3) # 1039ac <g_sectors_per_cluster>
  10245c:	0e050c63          	beqz	a0,102554 <boot_fat32_find+0x334>
  102460:	00000913          	li	s2,0
  102464:	0180006f          	j	10247c <boot_fat32_find+0x25c>
  102468:	001049b7          	lui	s3,0x104
  10246c:	9ac9a503          	lw	a0,-1620(s3) # 1039ac <g_sectors_per_cluster>
  102470:	00190913          	addi	s2,s2,1
  102474:	00104ab7          	lui	s5,0x104
  102478:	0ca97e63          	bgeu	s2,a0,102554 <boot_fat32_find+0x334>

            uint8_t *e;

            if (g_read_sector(dir_lba + s, fat32_buf)) {
  10247c:	9b0aa603          	lw	a2,-1616(s5) # 1039b0 <g_read_sector>
  102480:	01490533          	add	a0,s2,s4
  102484:	00040593          	mv	a1,s0
  102488:	000600e7          	jalr	a2
  10248c:	1a051063          	bnez	a0,10262c <boot_fat32_find+0x40c>
                s_printf("FAT32: read dir failed\n");
                return -1;
            }

            s_printf("FAT32: dir ok\n");
  102490:	000b0513          	mv	a0,s6
  102494:	fffff097          	auipc	ra,0xfffff
  102498:	990080e7          	jalr	-1648(ra) # 100e24 <s_printf>
  10249c:	01000993          	li	s3,16
  1024a0:	00040a93          	mv	s5,s0
  1024a4:	0100006f          	j	1024b4 <boot_fat32_find+0x294>

            e = fat32_buf;

            for (int i = 0; i < 16; i++) {
  1024a8:	fff98993          	addi	s3,s3,-1
  1024ac:	020a8a93          	addi	s5,s5,32
  1024b0:	fa098ce3          	beqz	s3,102468 <boot_fat32_find+0x248>
                uint8_t attr;
                int match;

                if (e[0] == 0x00) {
  1024b4:	000ac503          	lbu	a0,0(s5)
  1024b8:	ffb508e3          	beq	a0,s11,1024a8 <boot_fat32_find+0x288>
  1024bc:	12050063          	beqz	a0,1025dc <boot_fat32_find+0x3bc>
                if (e[0] == 0xE5) {
                    e += 32;
                    continue;
                }

                attr = e[11];
  1024c0:	00bac503          	lbu	a0,11(s5)

                if (attr == 0x0F) {
  1024c4:	01857513          	andi	a0,a0,24
  1024c8:	fe0510e3          	bnez	a0,1024a8 <boot_fat32_find+0x288>
                if (attr & 0x10) {
                    e += 32;
                    continue;
                }

                s_printf("FAT32: entry\n");
  1024cc:	000b8513          	mv	a0,s7
  1024d0:	fffff097          	auipc	ra,0xfffff
  1024d4:	954080e7          	jalr	-1708(ra) # 100e24 <s_printf>

                match = 1;

                for (int k = 0; k < 11; k++) {
                    if ((char)e[k] != target[k]) {
  1024d8:	000ac503          	lbu	a0,0(s5)
  1024dc:	fd8516e3          	bne	a0,s8,1024a8 <boot_fat32_find+0x288>
  1024e0:	001ac503          	lbu	a0,1(s5)
  1024e4:	fd9512e3          	bne	a0,s9,1024a8 <boot_fat32_find+0x288>
  1024e8:	002ac503          	lbu	a0,2(s5)
  1024ec:	fba51ee3          	bne	a0,s10,1024a8 <boot_fat32_find+0x288>
  1024f0:	003ac503          	lbu	a0,3(s5)
  1024f4:	03812583          	lw	a1,56(sp)
  1024f8:	fab518e3          	bne	a0,a1,1024a8 <boot_fat32_find+0x288>
  1024fc:	004ac503          	lbu	a0,4(s5)
  102500:	02412583          	lw	a1,36(sp)
  102504:	fab512e3          	bne	a0,a1,1024a8 <boot_fat32_find+0x288>
  102508:	005ac503          	lbu	a0,5(s5)
  10250c:	01c12583          	lw	a1,28(sp)
  102510:	f8b51ce3          	bne	a0,a1,1024a8 <boot_fat32_find+0x288>
  102514:	006ac503          	lbu	a0,6(s5)
  102518:	01812583          	lw	a1,24(sp)
  10251c:	f8b516e3          	bne	a0,a1,1024a8 <boot_fat32_find+0x288>
  102520:	007ac503          	lbu	a0,7(s5)
  102524:	01412583          	lw	a1,20(sp)
  102528:	f8b510e3          	bne	a0,a1,1024a8 <boot_fat32_find+0x288>
  10252c:	008ac503          	lbu	a0,8(s5)
  102530:	01012583          	lw	a1,16(sp)
  102534:	f6b51ae3          	bne	a0,a1,1024a8 <boot_fat32_find+0x288>
  102538:	009ac503          	lbu	a0,9(s5)
  10253c:	00c12583          	lw	a1,12(sp)
  102540:	f6b514e3          	bne	a0,a1,1024a8 <boot_fat32_find+0x288>
  102544:	00aac503          	lbu	a0,10(s5)
  102548:	00812583          	lw	a1,8(sp)
  10254c:	f4b51ee3          	bne	a0,a1,1024a8 <boot_fat32_find+0x288>
  102550:	0e80006f          	j	102638 <boot_fat32_find+0x418>
  102554:	02812503          	lw	a0,40(sp)

                e += 32;
            }
        }

        s_printf("FAT32: next\n");
  102558:	fffff097          	auipc	ra,0xfffff
  10255c:	8cc080e7          	jalr	-1844(ra) # 100e24 <s_printf>
  102560:	02c12903          	lw	s2,44(sp)
    if (cluster < 2u)
  102564:	00200513          	li	a0,2
  102568:	06a4e463          	bltu	s1,a0,1025d0 <boot_fat32_find+0x3b0>
    uint32_t fat_lba    = g_fat_begin_lba + (fat_offset / 512u);
  10256c:	00104537          	lui	a0,0x104
  102570:	9bc52503          	lw	a0,-1604(a0) # 1039bc <g_fat_begin_lba>
    if (g_read_sector(fat_lba, fat32_buf))
  102574:	9b0aa603          	lw	a2,-1616(s5)
    uint32_t fat_lba    = g_fat_begin_lba + (fat_offset / 512u);
  102578:	0074d593          	srli	a1,s1,0x7
  10257c:	00b50533          	add	a0,a0,a1
    if (g_read_sector(fat_lba, fat32_buf))
  102580:	00040593          	mv	a1,s0
  102584:	000600e7          	jalr	a2
  102588:	04051463          	bnez	a0,1025d0 <boot_fat32_find+0x3b0>
  10258c:	01949493          	slli	s1,s1,0x19
  102590:	0174d493          	srli	s1,s1,0x17
    next = rd32(&fat32_buf[ent_off]);
  102594:	009404b3          	add	s1,s0,s1
           ((uint32_t)p[1] << 8) |
  102598:	0014c503          	lbu	a0,1(s1)
    return ((uint32_t)p[0]) |
  10259c:	0004c583          	lbu	a1,0(s1)
           ((uint32_t)p[2] << 16) |
  1025a0:	0024c603          	lbu	a2,2(s1)
           ((uint32_t)p[1] << 8) |
  1025a4:	00851513          	slli	a0,a0,0x8
           ((uint32_t)p[3] << 24);
  1025a8:	0034c683          	lbu	a3,3(s1)
    return ((uint32_t)p[0]) |
  1025ac:	00b56533          	or	a0,a0,a1
           ((uint32_t)p[2] << 16) |
  1025b0:	01061613          	slli	a2,a2,0x10
           ((uint32_t)p[1] << 8) |
  1025b4:	00c56533          	or	a0,a0,a2
    next &= 0x0FFFFFFFu;
  1025b8:	01c69693          	slli	a3,a3,0x1c
  1025bc:	0046d693          	srli	a3,a3,0x4
  1025c0:	00d564b3          	or	s1,a0,a3
    while (dir_cluster >= 2u &&
  1025c4:	ffe48513          	addi	a0,s1,-2
  1025c8:	02012583          	lw	a1,32(sp)
  1025cc:	e6b566e3          	bltu	a0,a1,102438 <boot_fat32_find+0x218>

        dir_cluster = boot_fat32_next_cluster(dir_cluster);
    }

    s_printf("FAT32: not found\n");
  1025d0:	00103537          	lui	a0,0x103
  1025d4:	17050513          	addi	a0,a0,368 # 103170 <$d.1+0x46>
  1025d8:	00c0006f          	j	1025e4 <boot_fat32_find+0x3c4>
                    s_printf("FAT32: dir end\n");
  1025dc:	00103537          	lui	a0,0x103
  1025e0:	68d50513          	addi	a0,a0,1677 # 10368d <print_hex8.HEX+0x25>
  1025e4:	fffff097          	auipc	ra,0xfffff
  1025e8:	840080e7          	jalr	-1984(ra) # 100e24 <s_printf>
  1025ec:	fff00513          	li	a0,-1
  1025f0:	07c12083          	lw	ra,124(sp)
  1025f4:	07812403          	lw	s0,120(sp)
  1025f8:	07412483          	lw	s1,116(sp)
  1025fc:	07012903          	lw	s2,112(sp)
  102600:	06c12983          	lw	s3,108(sp)
  102604:	06812a03          	lw	s4,104(sp)
  102608:	06412a83          	lw	s5,100(sp)
  10260c:	06012b03          	lw	s6,96(sp)
  102610:	05c12b83          	lw	s7,92(sp)
  102614:	05812c03          	lw	s8,88(sp)
  102618:	05412c83          	lw	s9,84(sp)
  10261c:	05012d03          	lw	s10,80(sp)
  102620:	04c12d83          	lw	s11,76(sp)

    return -1;
}
  102624:	08010113          	addi	sp,sp,128
  102628:	00008067          	ret
                s_printf("FAT32: read dir failed\n");
  10262c:	00103537          	lui	a0,0x103
  102630:	35e50513          	addi	a0,a0,862 # 10335e <$d.1+0x234>
  102634:	fb1ff06f          	j	1025e4 <boot_fat32_find+0x3c4>
                    s_printf("FAT32: found\n");
  102638:	00103537          	lui	a0,0x103
  10263c:	35050513          	addi	a0,a0,848 # 103350 <$d.1+0x226>
  102640:	ffffe097          	auipc	ra,0xffffe
  102644:	7e4080e7          	jalr	2020(ra) # 100e24 <s_printf>
  102648:	00000513          	li	a0,0
           ((uint16_t)p[1] << 8);
  10264c:	015ac583          	lbu	a1,21(s5)
    return (uint16_t)p[0] |
  102650:	014ac603          	lbu	a2,20(s5)
  102654:	01aac683          	lbu	a3,26(s5)
           ((uint16_t)p[1] << 8);
  102658:	01bac703          	lbu	a4,27(s5)
                    *cluster = (cl_hi << 16) | cl_lo;
  10265c:	01859593          	slli	a1,a1,0x18
  102660:	01061613          	slli	a2,a2,0x10
    return (uint16_t)p[0] |
  102664:	00c5e5b3          	or	a1,a1,a2
           ((uint16_t)p[1] << 8);
  102668:	00871713          	slli	a4,a4,0x8
                    *cluster = (cl_hi << 16) | cl_lo;
  10266c:	00e6e6b3          	or	a3,a3,a4
  102670:	00d5e5b3          	or	a1,a1,a3
  102674:	03012603          	lw	a2,48(sp)
  102678:	00b62023          	sw	a1,0(a2)
           ((uint32_t)p[1] << 8) |
  10267c:	01dac583          	lbu	a1,29(s5)
    return ((uint32_t)p[0]) |
  102680:	01cac603          	lbu	a2,28(s5)
           ((uint32_t)p[2] << 16) |
  102684:	01eac683          	lbu	a3,30(s5)
           ((uint32_t)p[3] << 24);
  102688:	01fac703          	lbu	a4,31(s5)
           ((uint32_t)p[1] << 8) |
  10268c:	00859593          	slli	a1,a1,0x8
    return ((uint32_t)p[0]) |
  102690:	00c5e5b3          	or	a1,a1,a2
           ((uint32_t)p[2] << 16) |
  102694:	01069693          	slli	a3,a3,0x10
           ((uint32_t)p[3] << 24);
  102698:	01871713          	slli	a4,a4,0x18
           ((uint32_t)p[1] << 8) |
  10269c:	00e6e6b3          	or	a3,a3,a4
           ((uint32_t)p[2] << 16) |
  1026a0:	00d5e5b3          	or	a1,a1,a3
  1026a4:	03412603          	lw	a2,52(sp)
                    *size    = rd32(&e[28]);
  1026a8:	00b62023          	sw	a1,0(a2)
  1026ac:	f45ff06f          	j	1025f0 <boot_fat32_find+0x3d0>

001026b0 <boot_fat32_load_file>:
int boot_fat32_load_file(
    const char *name,
    uint32_t dst_addr,
    uint32_t *loaded_size
)
{
  1026b0:	f8010113          	addi	sp,sp,-128
  1026b4:	06112e23          	sw	ra,124(sp)
  1026b8:	06812c23          	sw	s0,120(sp)
  1026bc:	06912a23          	sw	s1,116(sp)
  1026c0:	07212823          	sw	s2,112(sp)
  1026c4:	07312623          	sw	s3,108(sp)
  1026c8:	07412423          	sw	s4,104(sp)
  1026cc:	07512223          	sw	s5,100(sp)
  1026d0:	07612023          	sw	s6,96(sp)
  1026d4:	05712e23          	sw	s7,92(sp)
  1026d8:	05812c23          	sw	s8,88(sp)
  1026dc:	05912a23          	sw	s9,84(sp)
  1026e0:	05a12823          	sw	s10,80(sp)
  1026e4:	05b12623          	sw	s11,76(sp)
  1026e8:	00060913          	mv	s2,a2
  1026ec:	00058493          	mv	s1,a1
  1026f0:	00050413          	mv	s0,a0
    uint32_t cluster;
    uint32_t size;
    uint32_t remain;
    volatile uint8_t *dst;

    s_printf("FAT32: load enter\n");
  1026f4:	00103537          	lui	a0,0x103
  1026f8:	49f50513          	addi	a0,a0,1183 # 10349f <$d.3+0x8d>
  1026fc:	ffffe097          	auipc	ra,0xffffe
  102700:	728080e7          	jalr	1832(ra) # 100e24 <s_printf>

    if (boot_fat32_find(name, &cluster, &size)) {
  102704:	04810593          	addi	a1,sp,72
  102708:	04410613          	addi	a2,sp,68
  10270c:	00040513          	mv	a0,s0
  102710:	00000097          	auipc	ra,0x0
  102714:	b10080e7          	jalr	-1264(ra) # 102220 <boot_fat32_find>
  102718:	fff00413          	li	s0,-1
  10271c:	04050a63          	beqz	a0,102770 <boot_fat32_load_file+0xc0>
  102720:	00103537          	lui	a0,0x103
  102724:	54a50513          	addi	a0,a0,1354 # 10354a <$d.3+0x138>
  102728:	ffffe097          	auipc	ra,0xffffe
  10272c:	6fc080e7          	jalr	1788(ra) # 100e24 <s_printf>
        *loaded_size = size;

    s_printf("FAT32: load done\n");

    return 0;
}
  102730:	00040513          	mv	a0,s0
  102734:	07c12083          	lw	ra,124(sp)
  102738:	07812403          	lw	s0,120(sp)
  10273c:	07412483          	lw	s1,116(sp)
  102740:	07012903          	lw	s2,112(sp)
  102744:	06c12983          	lw	s3,108(sp)
  102748:	06812a03          	lw	s4,104(sp)
  10274c:	06412a83          	lw	s5,100(sp)
  102750:	06012b03          	lw	s6,96(sp)
  102754:	05c12b83          	lw	s7,92(sp)
  102758:	05812c03          	lw	s8,88(sp)
  10275c:	05412c83          	lw	s9,84(sp)
  102760:	05012d03          	lw	s10,80(sp)
  102764:	04c12d83          	lw	s11,76(sp)
  102768:	08010113          	addi	sp,sp,128
  10276c:	00008067          	ret
    s_printf("FAT32: find ok\n");
  102770:	00103537          	lui	a0,0x103
  102774:	00850513          	addi	a0,a0,8 # 103008 <__modsi3+0x54>
  102778:	ffffe097          	auipc	ra,0xffffe
  10277c:	6ac080e7          	jalr	1708(ra) # 100e24 <s_printf>
    s_printf("FAT32: cluster=");
  102780:	00103537          	lui	a0,0x103
  102784:	14f50513          	addi	a0,a0,335 # 10314f <$d.1+0x25>
  102788:	ffffe097          	auipc	ra,0xffffe
  10278c:	69c080e7          	jalr	1692(ra) # 100e24 <s_printf>
    s_print_int((int)cluster);
  102790:	04812c03          	lw	s8,72(sp)
  102794:	000c0513          	mv	a0,s8
  102798:	ffffe097          	auipc	ra,0xffffe
  10279c:	590080e7          	jalr	1424(ra) # 100d28 <s_print_int>
    s_printf("\n");
  1027a0:	00103537          	lui	a0,0x103
  1027a4:	4e950a13          	addi	s4,a0,1257 # 1034e9 <$d.3+0xd7>
  1027a8:	000a0513          	mv	a0,s4
  1027ac:	ffffe097          	auipc	ra,0xffffe
  1027b0:	678080e7          	jalr	1656(ra) # 100e24 <s_printf>
    s_printf("FAT32: size=");
  1027b4:	00103537          	lui	a0,0x103
  1027b8:	3f050513          	addi	a0,a0,1008 # 1033f0 <$d.1+0x2c6>
  1027bc:	ffffe097          	auipc	ra,0xffffe
  1027c0:	668080e7          	jalr	1640(ra) # 100e24 <s_printf>
    s_print_int((int)size);
  1027c4:	04412983          	lw	s3,68(sp)
  1027c8:	00098513          	mv	a0,s3
  1027cc:	ffffe097          	auipc	ra,0xffffe
  1027d0:	55c080e7          	jalr	1372(ra) # 100d28 <s_print_int>
    s_printf("\n");
  1027d4:	000a0513          	mv	a0,s4
  1027d8:	ffffe097          	auipc	ra,0xffffe
  1027dc:	64c080e7          	jalr	1612(ra) # 100e24 <s_printf>
    if (size == 0u) {
  1027e0:	00098c63          	beqz	s3,1027f8 <boot_fat32_load_file+0x148>
  1027e4:	00200513          	li	a0,2
    if (cluster < 2u) {
  1027e8:	00ac7e63          	bgeu	s8,a0,102804 <boot_fat32_load_file+0x154>
  1027ec:	00103537          	lui	a0,0x103
  1027f0:	55e50513          	addi	a0,a0,1374 # 10355e <$d.3+0x14c>
  1027f4:	f35ff06f          	j	102728 <boot_fat32_load_file+0x78>
  1027f8:	00103537          	lui	a0,0x103
  1027fc:	45c50513          	addi	a0,a0,1116 # 10345c <$d.3+0x4a>
  102800:	f29ff06f          	j	102728 <boot_fat32_load_file+0x78>
  102804:	01212c23          	sw	s2,24(sp)
    s_printf("FAT32: remain set\n");
  102808:	00103537          	lui	a0,0x103
  10280c:	70c50513          	addi	a0,a0,1804 # 10370c <$d.1+0x57>
  102810:	ffffe097          	auipc	ra,0xffffe
  102814:	614080e7          	jalr	1556(ra) # 100e24 <s_printf>
        s_printf("FAT32: loop enter\n");
  102818:	00103537          	lui	a0,0x103
  10281c:	01850513          	addi	a0,a0,24 # 103018 <__modsi3+0x64>
  102820:	02a12623          	sw	a0,44(sp)
  102824:	ffffe097          	auipc	ra,0xffffe
  102828:	600080e7          	jalr	1536(ra) # 100e24 <s_printf>
  10282c:	00103537          	lui	a0,0x103
  102830:	31450513          	addi	a0,a0,788 # 103314 <$d.1+0x1ea>
  102834:	100005b7          	lui	a1,0x10000
  102838:	ff758693          	addi	a3,a1,-9 # ffffff7 <_stack_top+0xfef4237>
  10283c:	00103637          	lui	a2,0x103
  102840:	1fb60613          	addi	a2,a2,507 # 1031fb <$d.1+0xd1>
  102844:	00c12623          	sw	a2,12(sp)
  102848:	00103637          	lui	a2,0x103
  10284c:	6fb60613          	addi	a2,a2,1787 # 1036fb <$d.1+0x46>
  102850:	04c12023          	sw	a2,64(sp)
  102854:	00104a37          	lui	s4,0x104
  102858:	00103637          	lui	a2,0x103
  10285c:	60b60613          	addi	a2,a2,1547 # 10360b <$d.3+0x1f9>
  102860:	02c12e23          	sw	a2,60(sp)
  102864:	00103637          	lui	a2,0x103
  102868:	4fb60613          	addi	a2,a2,1275 # 1034fb <$d.3+0xe9>
  10286c:	02c12223          	sw	a2,36(sp)
  102870:	ff858593          	addi	a1,a1,-8
  102874:	02b12c23          	sw	a1,56(sp)
  102878:	001035b7          	lui	a1,0x103
  10287c:	61a58593          	addi	a1,a1,1562 # 10361a <$d.3+0x208>
  102880:	02b12023          	sw	a1,32(sp)
  102884:	001035b7          	lui	a1,0x103
  102888:	1b058593          	addi	a1,a1,432 # 1031b0 <$d.1+0x86>
  10288c:	00b12423          	sw	a1,8(sp)
  102890:	00104b37          	lui	s6,0x104
  102894:	001085b7          	lui	a1,0x108
  102898:	9c058593          	addi	a1,a1,-1600 # 1079c0 <fat32_buf>
  10289c:	00b12e23          	sw	a1,28(sp)
  1028a0:	001035b7          	lui	a1,0x103
  1028a4:	46e58d13          	addi	s10,a1,1134 # 10346e <$d.3+0x5c>
  1028a8:	001085b7          	lui	a1,0x108
  1028ac:	bc058d93          	addi	s11,a1,-1088 # 107bc0 <file_buf>
  1028b0:	001035b7          	lui	a1,0x103
  1028b4:	2bf58593          	addi	a1,a1,703 # 1032bf <$d.1+0x195>
  1028b8:	00b12a23          	sw	a1,20(sp)
  1028bc:	001035b7          	lui	a1,0x103
  1028c0:	71f58c93          	addi	s9,a1,1823 # 10371f <$d.1+0x6a>
  1028c4:	001035b7          	lui	a1,0x103
  1028c8:	4eb58b93          	addi	s7,a1,1259 # 1034eb <$d.3+0xd9>
  1028cc:	001035b7          	lui	a1,0x103
  1028d0:	51058593          	addi	a1,a1,1296 # 103510 <$d.3+0xfe>
  1028d4:	00b12823          	sw	a1,16(sp)
  1028d8:	001035b7          	lui	a1,0x103
  1028dc:	7a858593          	addi	a1,a1,1960 # 1037a8 <$d.1>
  1028e0:	02b12a23          	sw	a1,52(sp)
  1028e4:	02a12823          	sw	a0,48(sp)
  1028e8:	02d12423          	sw	a3,40(sp)
  1028ec:	02c0006f          	j	102918 <boot_fat32_load_file+0x268>
        cluster = boot_fat32_next_cluster(cluster);
  1028f0:	05812423          	sw	s8,72(sp)
  1028f4:	02012503          	lw	a0,32(sp)
        s_printf("FAT32: next cluster ok\n");
  1028f8:	ffffe097          	auipc	ra,0xffffe
  1028fc:	52c080e7          	jalr	1324(ra) # 100e24 <s_printf>
  102900:	02c12503          	lw	a0,44(sp)
        s_printf("FAT32: loop enter\n");
  102904:	ffffe097          	auipc	ra,0xffffe
  102908:	520080e7          	jalr	1312(ra) # 100e24 <s_printf>
  10290c:	03012503          	lw	a0,48(sp)
  102910:	02812683          	lw	a3,40(sp)
        if (cluster < 2u) {
  102914:	215c6663          	bltu	s8,s5,102b20 <boot_fat32_load_file+0x470>
        if (cluster == FAT32_BAD_CLUSTER) {
  102918:	e0dc08e3          	beq	s8,a3,102728 <boot_fat32_load_file+0x78>
        if (cluster >= FAT32_EOC_MIN) {
  10291c:	1f86ee63          	bltu	a3,s8,102b18 <boot_fat32_load_file+0x468>
  102920:	04012503          	lw	a0,64(sp)
        s_printf("FAT32: calc lba\n");
  102924:	ffffe097          	auipc	ra,0xffffe
  102928:	500080e7          	jalr	1280(ra) # 100e24 <s_printf>
    if (g_sectors_per_cluster == 1u)   return 0u;
  10292c:	9aca2583          	lw	a1,-1620(s4) # 1039ac <g_sectors_per_cluster>
  102930:	fff58513          	addi	a0,a1,-1
  102934:	03f00613          	li	a2,63
  102938:	02a66263          	bltu	a2,a0,10295c <boot_fat32_load_file+0x2ac>
  10293c:	00251513          	slli	a0,a0,0x2
  102940:	03412583          	lw	a1,52(sp)
  102944:	00b50533          	add	a0,a0,a1
  102948:	00052583          	lw	a1,0(a0)
  10294c:	00000513          	li	a0,0
  102950:	00058067          	jr	a1
  102954:	00100513          	li	a0,1
  102958:	0500006f          	j	1029a8 <boot_fat32_load_file+0x2f8>
  10295c:	08000513          	li	a0,128
  102960:	00a59663          	bne	a1,a0,10296c <boot_fat32_load_file+0x2bc>
  102964:	00700513          	li	a0,7
  102968:	0400006f          	j	1029a8 <boot_fat32_load_file+0x2f8>
  10296c:	01012503          	lw	a0,16(sp)
        s_printf("FAT32: bad spc shift\n");
  102970:	ffffe097          	auipc	ra,0xffffe
  102974:	4b4080e7          	jalr	1204(ra) # 100e24 <s_printf>
        return g_data_begin_lba;
  102978:	00104537          	lui	a0,0x104
  10297c:	9a852c03          	lw	s8,-1624(a0) # 1039a8 <g_data_begin_lba>
  102980:	03c0006f          	j	1029bc <boot_fat32_load_file+0x30c>
  102984:	00600513          	li	a0,6
  102988:	0200006f          	j	1029a8 <boot_fat32_load_file+0x2f8>
  10298c:	00200513          	li	a0,2
  102990:	0180006f          	j	1029a8 <boot_fat32_load_file+0x2f8>
  102994:	00300513          	li	a0,3
  102998:	0100006f          	j	1029a8 <boot_fat32_load_file+0x2f8>
  10299c:	00400513          	li	a0,4
  1029a0:	0080006f          	j	1029a8 <boot_fat32_load_file+0x2f8>
  1029a4:	00500513          	li	a0,5
    return g_data_begin_lba + ((cluster - 2u) << shift);
  1029a8:	001045b7          	lui	a1,0x104
  1029ac:	9a85a583          	lw	a1,-1624(a1) # 1039a8 <g_data_begin_lba>
  1029b0:	ffec0c13          	addi	s8,s8,-2
  1029b4:	00ac1c33          	sll	s8,s8,a0
  1029b8:	01858c33          	add	s8,a1,s8
  1029bc:	03c12503          	lw	a0,60(sp)
        s_printf("FAT32: lba ok\n");
  1029c0:	ffffe097          	auipc	ra,0xffffe
  1029c4:	464080e7          	jalr	1124(ra) # 100e24 <s_printf>
        for (uint32_t s = 0; s < g_sectors_per_cluster; s++) {
  1029c8:	9aca2503          	lw	a0,-1620(s4)
  1029cc:	08050663          	beqz	a0,102a58 <boot_fat32_load_file+0x3a8>
  1029d0:	00000a93          	li	s5,0
  1029d4:	00048913          	mv	s2,s1
            if (remain == 0u)
  1029d8:	10098063          	beqz	s3,102ad8 <boot_fat32_load_file+0x428>
            s_printf("FAT32: read file sector\n");
  1029dc:	000d0513          	mv	a0,s10
  1029e0:	ffffe097          	auipc	ra,0xffffe
  1029e4:	444080e7          	jalr	1092(ra) # 100e24 <s_printf>
            if (g_read_sector(lba + s, file_buf)) {
  1029e8:	9b0b2603          	lw	a2,-1616(s6) # 1039b0 <g_read_sector>
  1029ec:	018a8533          	add	a0,s5,s8
  1029f0:	000d8593          	mv	a1,s11
  1029f4:	000600e7          	jalr	a2
  1029f8:	10051863          	bnez	a0,102b08 <boot_fat32_load_file+0x458>
            s_printf("FAT32: file sector ok\n");
  1029fc:	000c8513          	mv	a0,s9
  102a00:	ffffe097          	auipc	ra,0xffffe
  102a04:	424080e7          	jalr	1060(ra) # 100e24 <s_printf>
  102a08:	20000593          	li	a1,512
  102a0c:	00098513          	mv	a0,s3
            copy_size = (remain > 512u) ? 512u : remain;
  102a10:	00b9e463          	bltu	s3,a1,102a18 <boot_fat32_load_file+0x368>
  102a14:	20000513          	li	a0,512
            for (uint32_t i = 0; i < copy_size; i++)
  102a18:	00a904b3          	add	s1,s2,a0
  102a1c:	000d8593          	mv	a1,s11
                dst[i] = file_buf[i];
  102a20:	0005c603          	lbu	a2,0(a1)
  102a24:	00c90023          	sb	a2,0(s2)
            for (uint32_t i = 0; i < copy_size; i++)
  102a28:	00190913          	addi	s2,s2,1
  102a2c:	00158593          	addi	a1,a1,1
  102a30:	fe9918e3          	bne	s2,s1,102a20 <boot_fat32_load_file+0x370>
            remain -= copy_size;
  102a34:	40a989b3          	sub	s3,s3,a0
            s_printf("FAT32: copy ok\n");
  102a38:	000b8513          	mv	a0,s7
  102a3c:	ffffe097          	auipc	ra,0xffffe
  102a40:	3e8080e7          	jalr	1000(ra) # 100e24 <s_printf>
        for (uint32_t s = 0; s < g_sectors_per_cluster; s++) {
  102a44:	9aca2503          	lw	a0,-1620(s4)
  102a48:	001a8a93          	addi	s5,s5,1
  102a4c:	00048913          	mv	s2,s1
  102a50:	f8aae4e3          	bltu	s5,a0,1029d8 <boot_fat32_load_file+0x328>
        if (remain == 0u) {
  102a54:	08098263          	beqz	s3,102ad8 <boot_fat32_load_file+0x428>
  102a58:	02412503          	lw	a0,36(sp)
        s_printf("FAT32: next cluster\n");
  102a5c:	ffffe097          	auipc	ra,0xffffe
  102a60:	3c8080e7          	jalr	968(ra) # 100e24 <s_printf>
        cluster = boot_fat32_next_cluster(cluster);
  102a64:	04812903          	lw	s2,72(sp)
  102a68:	03812c03          	lw	s8,56(sp)
  102a6c:	00200a93          	li	s5,2
    if (cluster < 2u)
  102a70:	e95960e3          	bltu	s2,s5,1028f0 <boot_fat32_load_file+0x240>
    uint32_t fat_lba    = g_fat_begin_lba + (fat_offset / 512u);
  102a74:	00104537          	lui	a0,0x104
  102a78:	9bc52503          	lw	a0,-1604(a0) # 1039bc <g_fat_begin_lba>
    if (g_read_sector(fat_lba, fat32_buf))
  102a7c:	9b0b2603          	lw	a2,-1616(s6)
  102a80:	00291913          	slli	s2,s2,0x2
    uint32_t fat_lba    = g_fat_begin_lba + (fat_offset / 512u);
  102a84:	00995593          	srli	a1,s2,0x9
  102a88:	00b50533          	add	a0,a0,a1
  102a8c:	01c12583          	lw	a1,28(sp)
    if (g_read_sector(fat_lba, fat32_buf))
  102a90:	000600e7          	jalr	a2
  102a94:	03812c03          	lw	s8,56(sp)
  102a98:	e4051ce3          	bnez	a0,1028f0 <boot_fat32_load_file+0x240>
  102a9c:	1fc97513          	andi	a0,s2,508
  102aa0:	01c12583          	lw	a1,28(sp)
    next = rd32(&fat32_buf[ent_off]);
  102aa4:	00a58533          	add	a0,a1,a0
           ((uint32_t)p[1] << 8) |
  102aa8:	00154583          	lbu	a1,1(a0)
    return ((uint32_t)p[0]) |
  102aac:	00054603          	lbu	a2,0(a0)
           ((uint32_t)p[2] << 16) |
  102ab0:	00254683          	lbu	a3,2(a0)
           ((uint32_t)p[1] << 8) |
  102ab4:	00859593          	slli	a1,a1,0x8
           ((uint32_t)p[3] << 24);
  102ab8:	00354503          	lbu	a0,3(a0)
    return ((uint32_t)p[0]) |
  102abc:	00c5e5b3          	or	a1,a1,a2
           ((uint32_t)p[2] << 16) |
  102ac0:	01069693          	slli	a3,a3,0x10
           ((uint32_t)p[1] << 8) |
  102ac4:	00d5e5b3          	or	a1,a1,a3
    next &= 0x0FFFFFFFu;
  102ac8:	01c51513          	slli	a0,a0,0x1c
  102acc:	00455513          	srli	a0,a0,0x4
  102ad0:	00a5ec33          	or	s8,a1,a0
  102ad4:	e1dff06f          	j	1028f0 <boot_fat32_load_file+0x240>
            s_printf("FAT32: file complete\n");
  102ad8:	00103537          	lui	a0,0x103
  102adc:	18250513          	addi	a0,a0,386 # 103182 <$d.1+0x58>
  102ae0:	ffffe097          	auipc	ra,0xffffe
  102ae4:	344080e7          	jalr	836(ra) # 100e24 <s_printf>
  102ae8:	00103537          	lui	a0,0x103
  102aec:	6c850513          	addi	a0,a0,1736 # 1036c8 <$d.1+0x13>
  102af0:	01812603          	lw	a2,24(sp)
    if (loaded_size)
  102af4:	00060e63          	beqz	a2,102b10 <boot_fat32_load_file+0x460>
        *loaded_size = size;
  102af8:	04412583          	lw	a1,68(sp)
  102afc:	00000413          	li	s0,0
  102b00:	00b62023          	sw	a1,0(a2)
  102b04:	c25ff06f          	j	102728 <boot_fat32_load_file+0x78>
  102b08:	01412503          	lw	a0,20(sp)
  102b0c:	c1dff06f          	j	102728 <boot_fat32_load_file+0x78>
  102b10:	00000413          	li	s0,0
  102b14:	c15ff06f          	j	102728 <boot_fat32_load_file+0x78>
  102b18:	00c12503          	lw	a0,12(sp)
  102b1c:	c0dff06f          	j	102728 <boot_fat32_load_file+0x78>
  102b20:	00812503          	lw	a0,8(sp)
  102b24:	c05ff06f          	j	102728 <boot_fat32_load_file+0x78>

00102b28 <boot_fat32_load_mem_file>:
int boot_fat32_load_mem_file(
    const char *name,
    uint32_t dst_addr,
    uint32_t *loaded_words
)
{
  102b28:	f9010113          	addi	sp,sp,-112
  102b2c:	06112623          	sw	ra,108(sp)
  102b30:	06812423          	sw	s0,104(sp)
  102b34:	06912223          	sw	s1,100(sp)
  102b38:	07212023          	sw	s2,96(sp)
  102b3c:	05312e23          	sw	s3,92(sp)
  102b40:	05412c23          	sw	s4,88(sp)
  102b44:	05512a23          	sw	s5,84(sp)
  102b48:	05612823          	sw	s6,80(sp)
  102b4c:	05712623          	sw	s7,76(sp)
  102b50:	05812423          	sw	s8,72(sp)
  102b54:	05912223          	sw	s9,68(sp)
  102b58:	05a12023          	sw	s10,64(sp)
  102b5c:	03b12e23          	sw	s11,60(sp)
  102b60:	00060493          	mv	s1,a2
  102b64:	00058913          	mv	s2,a1
  102b68:	00050413          	mv	s0,a0
    volatile uint32_t *dst;
    uint32_t words;
    uint32_t hex_count;
    uint32_t word;

    s_printf("FAT32: load mem enter\n");
  102b6c:	00103537          	lui	a0,0x103
  102b70:	79050513          	addi	a0,a0,1936 # 103790 <$d.1+0xdb>
  102b74:	ffffe097          	auipc	ra,0xffffe
  102b78:	2b0080e7          	jalr	688(ra) # 100e24 <s_printf>

    if (boot_fat32_find(name, &cluster, &size)) {
  102b7c:	03810593          	addi	a1,sp,56
  102b80:	03410613          	addi	a2,sp,52
  102b84:	00040513          	mv	a0,s0
  102b88:	fffff097          	auipc	ra,0xfffff
  102b8c:	698080e7          	jalr	1688(ra) # 102220 <boot_fat32_find>
  102b90:	fff00413          	li	s0,-1
  102b94:	04050a63          	beqz	a0,102be8 <boot_fat32_load_mem_file+0xc0>
  102b98:	00103537          	lui	a0,0x103
  102b9c:	54a50513          	addi	a0,a0,1354 # 10354a <$d.3+0x138>
  102ba0:	ffffe097          	auipc	ra,0xffffe
  102ba4:	284080e7          	jalr	644(ra) # 100e24 <s_printf>
        *loaded_words = words;

    s_printf("FAT32: load mem done\n");

    return 0;
  102ba8:	00040513          	mv	a0,s0
  102bac:	06c12083          	lw	ra,108(sp)
  102bb0:	06812403          	lw	s0,104(sp)
  102bb4:	06412483          	lw	s1,100(sp)
  102bb8:	06012903          	lw	s2,96(sp)
  102bbc:	05c12983          	lw	s3,92(sp)
  102bc0:	05812a03          	lw	s4,88(sp)
  102bc4:	05412a83          	lw	s5,84(sp)
  102bc8:	05012b03          	lw	s6,80(sp)
  102bcc:	04c12b83          	lw	s7,76(sp)
  102bd0:	04812c03          	lw	s8,72(sp)
  102bd4:	04412c83          	lw	s9,68(sp)
  102bd8:	04012d03          	lw	s10,64(sp)
  102bdc:	03c12d83          	lw	s11,60(sp)
  102be0:	07010113          	addi	sp,sp,112
  102be4:	00008067          	ret
    s_printf("FAT32: find ok\n");
  102be8:	00103537          	lui	a0,0x103
  102bec:	00850513          	addi	a0,a0,8 # 103008 <__modsi3+0x54>
  102bf0:	ffffe097          	auipc	ra,0xffffe
  102bf4:	234080e7          	jalr	564(ra) # 100e24 <s_printf>
    if (size == 0u) {
  102bf8:	03412b83          	lw	s7,52(sp)
  102bfc:	000b8e63          	beqz	s7,102c18 <boot_fat32_load_mem_file+0xf0>
    if (cluster < 2u) {
  102c00:	03812603          	lw	a2,56(sp)
  102c04:	00200513          	li	a0,2
  102c08:	00a67e63          	bgeu	a2,a0,102c24 <boot_fat32_load_mem_file+0xfc>
  102c0c:	00103537          	lui	a0,0x103
  102c10:	55e50513          	addi	a0,a0,1374 # 10355e <$d.3+0x14c>
  102c14:	f8dff06f          	j	102ba0 <boot_fat32_load_mem_file+0x78>
  102c18:	00103537          	lui	a0,0x103
  102c1c:	45c50513          	addi	a0,a0,1116 # 10345c <$d.3+0x4a>
  102c20:	f81ff06f          	j	102ba0 <boot_fat32_load_mem_file+0x78>
  102c24:	00912a23          	sw	s1,20(sp)
  102c28:	00000c93          	li	s9,0
  102c2c:	00000d93          	li	s11,0
  102c30:	00000a93          	li	s5,0
  102c34:	00103537          	lui	a0,0x103
  102c38:	31450513          	addi	a0,a0,788 # 103314 <$d.1+0x1ea>
  102c3c:	00a12823          	sw	a0,16(sp)
  102c40:	10000537          	lui	a0,0x10000
  102c44:	ff750413          	addi	s0,a0,-9 # ffffff7 <_stack_top+0xfef4237>
  102c48:	00103537          	lui	a0,0x103
  102c4c:	1fb50513          	addi	a0,a0,507 # 1031fb <$d.1+0xd1>
  102c50:	00a12623          	sw	a0,12(sp)
  102c54:	00108537          	lui	a0,0x108
  102c58:	bc050813          	addi	a6,a0,-1088 # 107bc0 <file_buf>
  102c5c:	00103537          	lui	a0,0x103
  102c60:	2bf50513          	addi	a0,a0,703 # 1032bf <$d.1+0x195>
  102c64:	00a12e23          	sw	a0,28(sp)
  102c68:	00900b13          	li	s6,9
  102c6c:	00800c13          	li	s8,8
  102c70:	01700493          	li	s1,23
  102c74:	00800d37          	lui	s10,0x800
  102c78:	013d0d13          	addi	s10,s10,19 # 800013 <_stack_top+0x6f4253>
  102c7c:	00500a13          	li	s4,5
  102c80:	00108537          	lui	a0,0x108
  102c84:	9c050593          	addi	a1,a0,-1600 # 1079c0 <fat32_buf>
  102c88:	00103537          	lui	a0,0x103
  102c8c:	1b050513          	addi	a0,a0,432 # 1031b0 <$d.1+0x86>
  102c90:	00a12423          	sw	a0,8(sp)
  102c94:	00103537          	lui	a0,0x103
  102c98:	51050513          	addi	a0,a0,1296 # 103510 <$d.3+0xfe>
  102c9c:	00a12c23          	sw	a0,24(sp)
  102ca0:	00104537          	lui	a0,0x104
  102ca4:	8a850713          	addi	a4,a0,-1880 # 1038a8 <$d.1+0x100>
  102ca8:	02812423          	sw	s0,40(sp)
  102cac:	02b12223          	sw	a1,36(sp)
  102cb0:	02e12023          	sw	a4,32(sp)
        if (cluster == FAT32_BAD_CLUSTER) {
  102cb4:	26860c63          	beq	a2,s0,102f2c <boot_fat32_load_mem_file+0x404>
        if (cluster >= FAT32_EOC_MIN) {
  102cb8:	28c46063          	bltu	s0,a2,102f38 <boot_fat32_load_mem_file+0x410>
    if (g_sectors_per_cluster == 1u)   return 0u;
  102cbc:	00104537          	lui	a0,0x104
  102cc0:	9ac52583          	lw	a1,-1620(a0) # 1039ac <g_sectors_per_cluster>
  102cc4:	fff58513          	addi	a0,a1,-1
  102cc8:	03f00693          	li	a3,63
  102ccc:	02c12623          	sw	a2,44(sp)
  102cd0:	02a6e063          	bltu	a3,a0,102cf0 <boot_fat32_load_mem_file+0x1c8>
  102cd4:	00251513          	slli	a0,a0,0x2
  102cd8:	00e50533          	add	a0,a0,a4
  102cdc:	00052583          	lw	a1,0(a0)
  102ce0:	00000513          	li	a0,0
  102ce4:	00058067          	jr	a1
  102ce8:	00100513          	li	a0,1
  102cec:	0680006f          	j	102d54 <boot_fat32_load_mem_file+0x22c>
  102cf0:	08000513          	li	a0,128
  102cf4:	00a59663          	bne	a1,a0,102d00 <boot_fat32_load_mem_file+0x1d8>
  102cf8:	00700513          	li	a0,7
  102cfc:	0580006f          	j	102d54 <boot_fat32_load_mem_file+0x22c>
  102d00:	00080993          	mv	s3,a6
  102d04:	01812503          	lw	a0,24(sp)
        s_printf("FAT32: bad spc shift\n");
  102d08:	ffffe097          	auipc	ra,0xffffe
  102d0c:	11c080e7          	jalr	284(ra) # 100e24 <s_printf>
        for (uint32_t s = 0; s < g_sectors_per_cluster; s++) {
  102d10:	00104537          	lui	a0,0x104
  102d14:	9ac52503          	lw	a0,-1620(a0) # 1039ac <g_sectors_per_cluster>
  102d18:	14050063          	beqz	a0,102e58 <boot_fat32_load_mem_file+0x330>
  102d1c:	00104537          	lui	a0,0x104
  102d20:	9a852503          	lw	a0,-1624(a0) # 1039a8 <g_data_begin_lba>
  102d24:	02a12823          	sw	a0,48(sp)
  102d28:	00098813          	mv	a6,s3
  102d2c:	0400006f          	j	102d6c <boot_fat32_load_mem_file+0x244>
  102d30:	00600513          	li	a0,6
  102d34:	0200006f          	j	102d54 <boot_fat32_load_mem_file+0x22c>
  102d38:	00200513          	li	a0,2
  102d3c:	0180006f          	j	102d54 <boot_fat32_load_mem_file+0x22c>
  102d40:	00300513          	li	a0,3
  102d44:	0100006f          	j	102d54 <boot_fat32_load_mem_file+0x22c>
  102d48:	00400513          	li	a0,4
  102d4c:	0080006f          	j	102d54 <boot_fat32_load_mem_file+0x22c>
  102d50:	00500513          	li	a0,5
    return g_data_begin_lba + ((cluster - 2u) << shift);
  102d54:	001045b7          	lui	a1,0x104
  102d58:	9a85a583          	lw	a1,-1624(a1) # 1039a8 <g_data_begin_lba>
  102d5c:	ffe60613          	addi	a2,a2,-2
  102d60:	00a61533          	sll	a0,a2,a0
  102d64:	00a58533          	add	a0,a1,a0
  102d68:	02a12823          	sw	a0,48(sp)
  102d6c:	00000413          	li	s0,0
  102d70:	0180006f          	j	102d88 <boot_fat32_load_mem_file+0x260>
        for (uint32_t s = 0; s < g_sectors_per_cluster; s++) {
  102d74:	001045b7          	lui	a1,0x104
  102d78:	9ac5a583          	lw	a1,-1620(a1) # 1039ac <g_sectors_per_cluster>
  102d7c:	00140413          	addi	s0,s0,1
  102d80:	40ab8bb3          	sub	s7,s7,a0
  102d84:	0cb47863          	bgeu	s0,a1,102e54 <boot_fat32_load_mem_file+0x32c>
            if (remain == 0u)
  102d88:	160b8663          	beqz	s7,102ef4 <boot_fat32_load_mem_file+0x3cc>
            if (g_read_sector(lba + s, file_buf)) {
  102d8c:	00104537          	lui	a0,0x104
  102d90:	9b052603          	lw	a2,-1616(a0) # 1039b0 <g_read_sector>
  102d94:	03012503          	lw	a0,48(sp)
  102d98:	00a40533          	add	a0,s0,a0
  102d9c:	00080993          	mv	s3,a6
  102da0:	00080593          	mv	a1,a6
  102da4:	000600e7          	jalr	a2
  102da8:	14051e63          	bnez	a0,102f04 <boot_fat32_load_mem_file+0x3dc>
  102dac:	20000593          	li	a1,512
  102db0:	000b8513          	mv	a0,s7
            sector_bytes = (remain > 512u) ? 512u : remain;
  102db4:	00bbe463          	bltu	s7,a1,102dbc <boot_fat32_load_mem_file+0x294>
  102db8:	20000513          	li	a0,512
  102dbc:	00098813          	mv	a6,s3
  102dc0:	00098593          	mv	a1,s3
  102dc4:	00050613          	mv	a2,a0
  102dc8:	0100006f          	j	102dd8 <boot_fat32_load_mem_file+0x2b0>
            for (uint32_t i = 0; i < sector_bytes; i++) {
  102dcc:	fff60613          	addi	a2,a2,-1
  102dd0:	00158593          	addi	a1,a1,1
  102dd4:	fa0600e3          	beqz	a2,102d74 <boot_fat32_load_mem_file+0x24c>
                char c = (char)file_buf[i];
  102dd8:	0005c683          	lbu	a3,0(a1)
    if (c >= '0' && c <= '9')
  102ddc:	fd068713          	addi	a4,a3,-48
  102de0:	0ff77793          	zext.b	a5,a4
  102de4:	00fb7a63          	bgeu	s6,a5,102df8 <boot_fat32_load_mem_file+0x2d0>
    if (c >= 'a' && c <= 'f')
  102de8:	f9f68713          	addi	a4,a3,-97
  102dec:	0ff77713          	zext.b	a4,a4
  102df0:	02ea6c63          	bltu	s4,a4,102e28 <boot_fat32_load_mem_file+0x300>
        return c - 'a' + 10;
  102df4:	fa968713          	addi	a4,a3,-87
                if (h >= 0) {
  102df8:	04074263          	bltz	a4,102e3c <boot_fat32_load_mem_file+0x314>
                    word = (word << 4) | (uint32_t)h;
  102dfc:	004a9a93          	slli	s5,s5,0x4
                    hex_count++;
  102e00:	001d8d93          	addi	s11,s11,1
                    word = (word << 4) | (uint32_t)h;
  102e04:	01576ab3          	or	s5,a4,s5
                    if (hex_count == 8u) {
  102e08:	fd8d92e3          	bne	s11,s8,102dcc <boot_fat32_load_mem_file+0x2a4>
  102e0c:	00000d93          	li	s11,0
                        dst[words] = word;
  102e10:	002c9693          	slli	a3,s9,0x2
  102e14:	00d906b3          	add	a3,s2,a3
  102e18:	0156a023          	sw	s5,0(a3)
                        words++;
  102e1c:	001c8c93          	addi	s9,s9,1
  102e20:	00000a93          	li	s5,0
  102e24:	fa9ff06f          	j	102dcc <boot_fat32_load_mem_file+0x2a4>
    if (c >= 'A' && c <= 'F')
  102e28:	fbf68713          	addi	a4,a3,-65
  102e2c:	0ff77713          	zext.b	a4,a4
  102e30:	00ea6663          	bltu	s4,a4,102e3c <boot_fat32_load_mem_file+0x314>
  102e34:	fc968713          	addi	a4,a3,-55
                if (h >= 0) {
  102e38:	fc0752e3          	bgez	a4,102dfc <boot_fat32_load_mem_file+0x2d4>
                    if (c == '\r' || c == '\n' || c == ' ' || c == '\t') {
  102e3c:	ff768693          	addi	a3,a3,-9
  102e40:	0ad4e463          	bltu	s1,a3,102ee8 <boot_fat32_load_mem_file+0x3c0>
  102e44:	00dd56b3          	srl	a3,s10,a3
  102e48:	0016f693          	andi	a3,a3,1
  102e4c:	f80690e3          	bnez	a3,102dcc <boot_fat32_load_mem_file+0x2a4>
  102e50:	0980006f          	j	102ee8 <boot_fat32_load_mem_file+0x3c0>
        if (remain == 0u)
  102e54:	0a0b8063          	beqz	s7,102ef4 <boot_fat32_load_mem_file+0x3cc>
    uint32_t fat_lba    = g_fat_begin_lba + (fat_offset / 512u);
  102e58:	00104537          	lui	a0,0x104
  102e5c:	9bc52503          	lw	a0,-1604(a0) # 1039bc <g_fat_begin_lba>
    if (g_read_sector(fat_lba, fat32_buf))
  102e60:	001045b7          	lui	a1,0x104
  102e64:	9b05a603          	lw	a2,-1616(a1) # 1039b0 <g_read_sector>
  102e68:	02c12583          	lw	a1,44(sp)
    uint32_t fat_lba    = g_fat_begin_lba + (fat_offset / 512u);
  102e6c:	0075d593          	srli	a1,a1,0x7
  102e70:	00b50533          	add	a0,a0,a1
  102e74:	02412403          	lw	s0,36(sp)
    if (g_read_sector(fat_lba, fat32_buf))
  102e78:	00040593          	mv	a1,s0
  102e7c:	000600e7          	jalr	a2
  102e80:	00050863          	beqz	a0,102e90 <boot_fat32_load_mem_file+0x368>
  102e84:	10000637          	lui	a2,0x10000
  102e88:	ff860613          	addi	a2,a2,-8 # ffffff8 <_stack_top+0xfef4238>
  102e8c:	0400006f          	j	102ecc <boot_fat32_load_mem_file+0x3a4>
  102e90:	02c12503          	lw	a0,44(sp)
    uint32_t ent_off    = fat_offset & 0x1FFu;
  102e94:	01951513          	slli	a0,a0,0x19
  102e98:	01755513          	srli	a0,a0,0x17
    next = rd32(&fat32_buf[ent_off]);
  102e9c:	00a40533          	add	a0,s0,a0
           ((uint32_t)p[1] << 8) |
  102ea0:	00154583          	lbu	a1,1(a0)
    return ((uint32_t)p[0]) |
  102ea4:	00054603          	lbu	a2,0(a0)
           ((uint32_t)p[2] << 16) |
  102ea8:	00254683          	lbu	a3,2(a0)
           ((uint32_t)p[1] << 8) |
  102eac:	00859593          	slli	a1,a1,0x8
           ((uint32_t)p[3] << 24);
  102eb0:	00354503          	lbu	a0,3(a0)
    return ((uint32_t)p[0]) |
  102eb4:	00c5e5b3          	or	a1,a1,a2
           ((uint32_t)p[2] << 16) |
  102eb8:	01069693          	slli	a3,a3,0x10
           ((uint32_t)p[1] << 8) |
  102ebc:	00d5e5b3          	or	a1,a1,a3
    next &= 0x0FFFFFFFu;
  102ec0:	01c51513          	slli	a0,a0,0x1c
  102ec4:	00455513          	srli	a0,a0,0x4
  102ec8:	00a5e633          	or	a2,a1,a0
  102ecc:	02812403          	lw	s0,40(sp)
  102ed0:	00098813          	mv	a6,s3
  102ed4:	00200513          	li	a0,2
  102ed8:	02012703          	lw	a4,32(sp)
        if (cluster < 2u) {
  102edc:	dca67ce3          	bgeu	a2,a0,102cb4 <boot_fat32_load_mem_file+0x18c>
  102ee0:	00812503          	lw	a0,8(sp)
  102ee4:	0240006f          	j	102f08 <boot_fat32_load_mem_file+0x3e0>
  102ee8:	00103537          	lui	a0,0x103
  102eec:	4d450513          	addi	a0,a0,1236 # 1034d4 <$d.3+0xc2>
  102ef0:	0180006f          	j	102f08 <boot_fat32_load_mem_file+0x3e0>
    if (hex_count != 0u) {
  102ef4:	000d8e63          	beqz	s11,102f10 <boot_fat32_load_mem_file+0x3e8>
  102ef8:	00103537          	lui	a0,0x103
  102efc:	57c50513          	addi	a0,a0,1404 # 10357c <$d.3+0x16a>
  102f00:	0080006f          	j	102f08 <boot_fat32_load_mem_file+0x3e0>
  102f04:	01c12503          	lw	a0,28(sp)
  102f08:	fff00413          	li	s0,-1
  102f0c:	c95ff06f          	j	102ba0 <boot_fat32_load_mem_file+0x78>
  102f10:	00103537          	lui	a0,0x103
  102f14:	63250513          	addi	a0,a0,1586 # 103632 <$d.3+0x220>
  102f18:	01412583          	lw	a1,20(sp)
    if (loaded_words)
  102f1c:	02058263          	beqz	a1,102f40 <boot_fat32_load_mem_file+0x418>
  102f20:	00000413          	li	s0,0
        *loaded_words = words;
  102f24:	0195a023          	sw	s9,0(a1)
  102f28:	c79ff06f          	j	102ba0 <boot_fat32_load_mem_file+0x78>
  102f2c:	fff00413          	li	s0,-1
  102f30:	01012503          	lw	a0,16(sp)
  102f34:	c6dff06f          	j	102ba0 <boot_fat32_load_mem_file+0x78>
  102f38:	00c12503          	lw	a0,12(sp)
  102f3c:	fcdff06f          	j	102f08 <boot_fat32_load_mem_file+0x3e0>
  102f40:	00000413          	li	s0,0
  102f44:	c5dff06f          	j	102ba0 <boot_fat32_load_mem_file+0x78>

00102f48 <__mulsi3>:
/* Our RV64 64-bit routine is equivalent to our RV32 32-bit routine.  */
# define __muldi3 __mulsi3
#endif

FUNC_BEGIN (__muldi3)
  mv     a2, a0
  102f48:	862a                	mv	a2,a0
  li     a0, 0
  102f4a:	4501                	li	a0,0
.L1:
  andi   a3, a1, 1
  102f4c:	0015f693          	andi	a3,a1,1
  beqz   a3, .L2
  102f50:	c291                	beqz	a3,102f54 <__mulsi3+0xc>
  add    a0, a0, a2
  102f52:	9532                	add	a0,a0,a2
.L2:
  srli   a1, a1, 1
  102f54:	8185                	srli	a1,a1,0x1
  slli   a2, a2, 1
  102f56:	0606                	slli	a2,a2,0x1
  bnez   a1, .L1
  102f58:	f9f5                	bnez	a1,102f4c <__mulsi3+0x4>
  ret
  102f5a:	8082                	ret

00102f5c <__divsi3>:
  li    t0, -1
  beq   a1, t0, .L20
#endif

FUNC_BEGIN (__divdi3)
  bltz  a0, .L10
  102f5c:	02054e63          	bltz	a0,102f98 <__umodsi3+0x8>
  bltz  a1, .L11
  102f60:	0405c363          	bltz	a1,102fa6 <__umodsi3+0x16>

00102f64 <__hidden___udivsi3>:
  /* Since the quotient is positive, fall into __udivdi3.  */

FUNC_BEGIN (__udivdi3)
  mv    a2, a1
  102f64:	862e                	mv	a2,a1
  mv    a1, a0
  102f66:	85aa                	mv	a1,a0
  li    a0, -1
  102f68:	557d                	li	a0,-1
  beqz  a2, .L5
  102f6a:	c215                	beqz	a2,102f8e <__hidden___udivsi3+0x2a>
  li    a3, 1
  102f6c:	4685                	li	a3,1
  bgeu  a2, a1, .L2
  102f6e:	00b67863          	bgeu	a2,a1,102f7e <__hidden___udivsi3+0x1a>
.L1:
  blez  a2, .L2
  102f72:	00c05663          	blez	a2,102f7e <__hidden___udivsi3+0x1a>
  slli  a2, a2, 1
  102f76:	0606                	slli	a2,a2,0x1
  slli  a3, a3, 1
  102f78:	0686                	slli	a3,a3,0x1
  bgtu  a1, a2, .L1
  102f7a:	feb66ce3          	bltu	a2,a1,102f72 <__hidden___udivsi3+0xe>
.L2:
  li    a0, 0
  102f7e:	4501                	li	a0,0
.L3:
  bltu  a1, a2, .L4
  102f80:	00c5e463          	bltu	a1,a2,102f88 <__hidden___udivsi3+0x24>
  sub   a1, a1, a2
  102f84:	8d91                	sub	a1,a1,a2
  or    a0, a0, a3
  102f86:	8d55                	or	a0,a0,a3
.L4:
  srli  a3, a3, 1
  102f88:	8285                	srli	a3,a3,0x1
  srli  a2, a2, 1
  102f8a:	8205                	srli	a2,a2,0x1
  bnez  a3, .L3
  102f8c:	faf5                	bnez	a3,102f80 <__hidden___udivsi3+0x1c>
.L5:
  ret
  102f8e:	8082                	ret

00102f90 <__umodsi3>:
FUNC_END (__udivdi3)
HIDDEN_DEF (__udivdi3)

FUNC_BEGIN (__umoddi3)
  /* Call __udivdi3(a0, a1), then return the remainder, which is in a1.  */
  move  t0, ra
  102f90:	8286                	mv	t0,ra
  jal   HIDDEN_JUMPTARGET(__udivdi3)
  102f92:	3fc9                	jal	102f64 <__hidden___udivsi3>
  move  a0, a1
  102f94:	852e                	mv	a0,a1
  jr    t0
  102f96:	8282                	jr	t0
FUNC_END (__umoddi3)

  /* Handle negative arguments to __divdi3.  */
.L10:
  neg   a0, a0
  102f98:	40a00533          	neg	a0,a0
  /* Zero is handled as a negative so that the result will not be inverted.  */
  bgtz  a1, .L12     /* Compute __udivdi3(-a0, a1), then negate the result.  */
  102f9c:	00b04763          	bgtz	a1,102faa <__umodsi3+0x1a>

  neg   a1, a1
  102fa0:	40b005b3          	neg	a1,a1
  j     HIDDEN_JUMPTARGET(__udivdi3)     /* Compute __udivdi3(-a0, -a1).  */
  102fa4:	b7c1                	j	102f64 <__hidden___udivsi3>
.L11:                /* Compute __udivdi3(a0, -a1), then negate the result.  */
  neg   a1, a1
  102fa6:	40b005b3          	neg	a1,a1
.L12:
  move  t0, ra
  102faa:	8286                	mv	t0,ra
  jal   HIDDEN_JUMPTARGET(__udivdi3)
  102fac:	3f65                	jal	102f64 <__hidden___udivsi3>
  neg   a0, a0
  102fae:	40a00533          	neg	a0,a0
  jr    t0
  102fb2:	8282                	jr	t0

00102fb4 <__modsi3>:
FUNC_END (__divdi3)

FUNC_BEGIN (__moddi3)
  move   t0, ra
  102fb4:	8286                	mv	t0,ra
  bltz   a1, .L31
  102fb6:	0005c763          	bltz	a1,102fc4 <__modsi3+0x10>
  bltz   a0, .L32
  102fba:	00054963          	bltz	a0,102fcc <__modsi3+0x18>
.L30:
  jal    HIDDEN_JUMPTARGET(__udivdi3)    /* The dividend is not negative.  */
  102fbe:	375d                	jal	102f64 <__hidden___udivsi3>
  move   a0, a1
  102fc0:	852e                	mv	a0,a1
  jr     t0
  102fc2:	8282                	jr	t0
.L31:
  neg    a1, a1
  102fc4:	40b005b3          	neg	a1,a1
  bgez   a0, .L30
  102fc8:	fe055be3          	bgez	a0,102fbe <__modsi3+0xa>
.L32:
  neg    a0, a0
  102fcc:	40a00533          	neg	a0,a0
  jal    HIDDEN_JUMPTARGET(__udivdi3)    /* The dividend is hella negative.  */
  102fd0:	3f51                	jal	102f64 <__hidden___udivsi3>
  neg    a0, a1
  102fd2:	40b00533          	neg	a0,a1
  jr     t0
  102fd6:	8282                	jr	t0
  102fd8:	0001                	nop

セクション .rodata の逆アセンブル:

00102fdc <$d.1-0x14e>:
  102fdc:	4146                	lw	sp,80(sp)
  102fde:	3354                	.insn	2, 0x3354
  102fe0:	3a32                	.insn	2, 0x3a32
  102fe2:	6220                	.insn	2, 0x6220
  102fe4:	6461                	lui	s0,0x18
  102fe6:	7220                	.insn	2, 0x7220
  102fe8:	5f746f6f          	jal	t5,149dde <_stack_top+0x3e01e>
  102fec:	73756c63          	bltu	a0,s7,103724 <$d.1+0x6f>
  102ff0:	6574                	.insn	2, 0x6574
  102ff2:	0a72                	slli	s4,s4,0x1c
  102ff4:	4600                	lw	s0,8(a2)
  102ff6:	5441                	li	s0,-16
  102ff8:	203a3233          	.insn	4, 0x203a3233
  102ffc:	6f72                	.insn	2, 0x6f72
  102ffe:	4e20746f          	jal	s0,10a4e0 <_stack_start+0x2720>
  103002:	3220544f          	.insn	4, 0x3220544f
  103006:	000a                	c.slli	zero,0x2
  103008:	4146                	lw	sp,80(sp)
  10300a:	3354                	.insn	2, 0x3354
  10300c:	3a32                	.insn	2, 0x3a32
  10300e:	6620                	.insn	2, 0x6620
  103010:	6e69                	lui	t3,0x1a
  103012:	2064                	.insn	2, 0x2064
  103014:	000a6b6f          	jal	s6,1a9014 <_stack_top+0x9d254>
  103018:	4146                	lw	sp,80(sp)
  10301a:	3354                	.insn	2, 0x3354
  10301c:	3a32                	.insn	2, 0x3a32
  10301e:	6c20                	.insn	2, 0x6c20
  103020:	20706f6f          	jal	t5,109a26 <_stack_start+0x1c66>
  103024:	6e65                	lui	t3,0x19
  103026:	6574                	.insn	2, 0x6574
  103028:	0a72                	slli	s4,s4,0x1c
  10302a:	6b00                	.insn	2, 0x6b00
  10302c:	7265                	lui	tp,0xffff9
  10302e:	656e                	.insn	2, 0x656e
  103030:	5b6c                	lw	a1,116(a4)
  103032:	5d32                	lw	s10,44(sp)
  103034:	003d                	c.nop	15
  103036:	4146                	lw	sp,80(sp)
  103038:	3354                	.insn	2, 0x3354
  10303a:	3a32                	.insn	2, 0x3a32
  10303c:	4220                	lw	s0,64(a2)
  10303e:	4250                	lw	a2,4(a2)
  103040:	6920                	.insn	2, 0x6920
  103042:	766e                	.insn	2, 0x766e
  103044:	6c61                	lui	s8,0x18
  103046:	6469                	lui	s0,0x1a
  103048:	000a                	c.slli	zero,0x2
  10304a:	4146                	lw	sp,80(sp)
  10304c:	3354                	.insn	2, 0x3354
  10304e:	3a32                	.insn	2, 0x3a32
  103050:	6320                	.insn	2, 0x6320
  103052:	6c61                	lui	s8,0x18
  103054:	61662063          	.insn	4, 0x61662063
  103058:	0a74                	addi	a3,sp,284
  10305a:	4300                	lw	s0,0(a4)
  10305c:	4352                	lw	t1,20(sp)
  10305e:	4620                	lw	s0,72(a2)
  103060:	4941                	li	s2,16
  103062:	454c                	lw	a1,12(a0)
  103064:	2044                	.insn	2, 0x2044
  103066:	6628                	.insn	2, 0x6628
  103068:	6e69                	lui	t3,0x1a
  10306a:	6c61                	lui	s8,0x18
  10306c:	0a29                	addi	s4,s4,10
  10306e:	4600                	lw	s0,8(a2)
  103070:	5441                	li	s0,-16
  103072:	203a3233          	.insn	4, 0x203a3233
  103076:	6572                	.insn	2, 0x6572
  103078:	6461                	lui	s0,0x18
  10307a:	4220                	lw	s0,64(a2)
  10307c:	4250                	lw	a2,4(a2)
  10307e:	6f20                	.insn	2, 0x6f20
  103080:	46000a6b          	.insn	4, 0x46000a6b
  103084:	5441                	li	s0,-16
  103086:	203a3233          	.insn	4, 0x203a3233
  10308a:	5042                	.insn	2, 0x5042
  10308c:	2042                	.insn	2, 0x2042
  10308e:	6176                	.insn	2, 0x6176
  103090:	696c                	.insn	2, 0x696c
  103092:	0a64                	addi	s1,sp,284
  103094:	4600                	lw	s0,8(a2)
  103096:	5441                	li	s0,-16
  103098:	203a3233          	.insn	4, 0x203a3233
  10309c:	6170                	.insn	2, 0x6170
  10309e:	7372                	.insn	2, 0x7372
  1030a0:	2065                	jal	103148 <$d.1+0x1e>
  1030a2:	0a32                	slli	s4,s4,0xc
  1030a4:	4600                	lw	s0,8(a2)
  1030a6:	5441                	li	s0,-16
  1030a8:	203a3233          	.insn	4, 0x203a3233
  1030ac:	6f72                	.insn	2, 0x6f72
  1030ae:	6920746f          	jal	s0,10a740 <_stack_start+0x2980>
  1030b2:	0a322073          	.insn	4, 0x0a322073
  1030b6:	4b00                	lw	s0,16(a4)
  1030b8:	5245                	li	tp,-15
  1030ba:	454e                	lw	a0,208(sp)
  1030bc:	2e4c                	.insn	2, 0x2e4c
  1030be:	454d                	li	a0,19
  1030c0:	204d                	jal	103162 <$d.1+0x38>
  1030c2:	6f6c                	.insn	2, 0x6f6c
  1030c4:	6461                	lui	s0,0x18
  1030c6:	6620                	.insn	2, 0x6620
  1030c8:	6961                	lui	s2,0x18
  1030ca:	656c                	.insn	2, 0x656c
  1030cc:	0a64                	addi	s1,sp,284
  1030ce:	7500                	.insn	2, 0x7500
  1030d0:	65676173          	.insn	4, 0x65676173
  1030d4:	203a                	.insn	2, 0x203a
  1030d6:	7564                	.insn	2, 0x7564
  1030d8:	706d                	c.lui	zero,0xffffb
  1030da:	5b20                	lw	s0,112(a4)
  1030dc:	7366666f          	jal	a2,169812 <_stack_top+0x5da52>
  1030e0:	7465                	lui	s0,0xffff9
  1030e2:	685f 7865 205d      	.insn	6, 0x205d7865685f
  1030e8:	6e656c5b          	.insn	4, 0x6e656c5b
  1030ec:	685f 7865 0a5d      	.insn	6, 0x0a5d7865685f
  1030f2:	3000                	.insn	2, 0x3000
  1030f4:	3231                	jal	102a00 <boot_fat32_load_file+0x350>
  1030f6:	36353433          	.insn	4, 0x36353433
  1030fa:	41393837          	lui	a6,0x41393
  1030fe:	4342                	lw	t1,16(sp)
  103100:	4544                	lw	s1,12(a0)
  103102:	0046                	c.slli	zero,0x11
  103104:	5355                	li	t1,-11
  103106:	5245                	li	tp,-15
  103108:	4d2e                	lw	s10,200(sp)
  10310a:	4d45                	li	s10,17
  10310c:	6c20                	.insn	2, 0x6c20
  10310e:	2064616f          	jal	sp,149314 <_stack_top+0x3d554>
  103112:	6166                	.insn	2, 0x6166
  103114:	6c69                	lui	s8,0x1a
  103116:	6465                	lui	s0,0x19
  103118:	000a                	c.slli	zero,0x2
  10311a:	20435243          	.insn	4, 0x20435243
  10311e:	4146                	lw	sp,80(sp)
  103120:	4c49                	li	s8,18
  103122:	4445                	li	s0,17
  103124:	6c20                	.insn	2, 0x6c20
  103126:	6162                	.insn	2, 0x6162
  103128:	003d                	c.nop	15

0010312a <$d.1>:
  10312a:	4552                	lw	a0,20(sp)
  10312c:	4441                	li	s0,16
  10312e:	4620                	lw	s0,72(a2)
  103130:	4941                	li	s2,16
  103132:	204c                	.insn	2, 0x204c
  103134:	6572                	.insn	2, 0x6572
  103136:	7274                	.insn	2, 0x7274
  103138:	3d79                	jal	102fd6 <__modsi3+0x22>
  10313a:	6425                	lui	s0,0x9
  10313c:	000a                	c.slli	zero,0x2
  10313e:	4146                	lw	sp,80(sp)
  103140:	3354                	.insn	2, 0x3354
  103142:	3a32                	.insn	2, 0x3a32
  103144:	7620                	.insn	2, 0x7620
  103146:	6c61                	lui	s8,0x18
  103148:	6469                	lui	s0,0x1a
  10314a:	7461                	lui	s0,0xffff8
  10314c:	0a65                	addi	s4,s4,25
  10314e:	4600                	lw	s0,8(a2)
  103150:	5441                	li	s0,-16
  103152:	203a3233          	.insn	4, 0x203a3233
  103156:	73756c63          	bltu	a0,s7,10388e <$d.1+0xe6>
  10315a:	6574                	.insn	2, 0x6574
  10315c:	3d72                	.insn	2, 0x3d72
  10315e:	4600                	lw	s0,8(a2)
  103160:	5441                	li	s0,-16
  103162:	203a3233          	.insn	4, 0x203a3233
  103166:	6f6d                	lui	t5,0x1b
  103168:	6e75                	lui	t3,0x1d
  10316a:	2074                	.insn	2, 0x2074
  10316c:	000a6b6f          	jal	s6,1a916c <_stack_top+0x9d3ac>
  103170:	4146                	lw	sp,80(sp)
  103172:	3354                	.insn	2, 0x3354
  103174:	3a32                	.insn	2, 0x3a32
  103176:	6e20                	.insn	2, 0x6e20
  103178:	6620746f          	jal	s0,10a7da <_stack_start+0x2a1a>
  10317c:	646e756f          	jal	a0,1ea7c2 <_stack_top+0xdea02>
  103180:	000a                	c.slli	zero,0x2
  103182:	4146                	lw	sp,80(sp)
  103184:	3354                	.insn	2, 0x3354
  103186:	3a32                	.insn	2, 0x3a32
  103188:	6620                	.insn	2, 0x6620
  10318a:	6c69                	lui	s8,0x1a
  10318c:	2065                	jal	103234 <$d.1+0x10a>
  10318e:	706d6f63          	bltu	s10,t1,1038ac <$d.1+0x104>
  103192:	656c                	.insn	2, 0x656c
  103194:	6574                	.insn	2, 0x6574
  103196:	000a                	c.slli	zero,0x2
  103198:	4146                	lw	sp,80(sp)
  10319a:	3354                	.insn	2, 0x3354
  10319c:	3a32                	.insn	2, 0x3a32
  10319e:	7220                	.insn	2, 0x7220
  1031a0:	6165                	addi	sp,sp,112
  1031a2:	2064                	.insn	2, 0x2064
  1031a4:	5042                	.insn	2, 0x5042
  1031a6:	2042                	.insn	2, 0x2042
  1031a8:	6166                	.insn	2, 0x6166
  1031aa:	6c69                	lui	s8,0x1a
  1031ac:	6465                	lui	s0,0x19
  1031ae:	000a                	c.slli	zero,0x2
  1031b0:	4146                	lw	sp,80(sp)
  1031b2:	3354                	.insn	2, 0x3354
  1031b4:	3a32                	.insn	2, 0x3a32
  1031b6:	6320                	.insn	2, 0x6320
  1031b8:	756c                	.insn	2, 0x756c
  1031ba:	72657473          	.insn	4, 0x72657473
  1031be:	3c20                	.insn	2, 0x3c20
  1031c0:	0a32                	slli	s4,s4,0xc
  1031c2:	4300                	lw	s0,0(a4)
  1031c4:	4352                	lw	t1,20(sp)
  1031c6:	4f20                	lw	s0,88(a4)
  1031c8:	7228204b          	.insn	4, 0x7228204b
  1031cc:	7465                	lui	s0,0xffff9
  1031ce:	7972                	.insn	2, 0x7972
  1031d0:	253d                	jal	1037fe <$d.1+0x56>
  1031d2:	2964                	.insn	2, 0x2964
  1031d4:	000a                	c.slli	zero,0x2
  1031d6:	4146                	lw	sp,80(sp)
  1031d8:	3354                	.insn	2, 0x3354
  1031da:	3a32                	.insn	2, 0x3a32
  1031dc:	7020                	.insn	2, 0x7020
  1031de:	7261                	lui	tp,0xffff8
  1031e0:	31206573          	.insn	4, 0x31206573
  1031e4:	000a                	c.slli	zero,0x2
  1031e6:	4146                	lw	sp,80(sp)
  1031e8:	3354                	.insn	2, 0x3354
  1031ea:	3a32                	.insn	2, 0x3a32
  1031ec:	6220                	.insn	2, 0x6220
  1031ee:	6461                	lui	s0,0x18
  1031f0:	6620                	.insn	2, 0x6620
  1031f2:	7461                	lui	s0,0xffff8
  1031f4:	735f 7a69 0a65      	.insn	6, 0x0a657a69735f
  1031fa:	4600                	lw	s0,8(a2)
  1031fc:	5441                	li	s0,-16
  1031fe:	203a3233          	.insn	4, 0x203a3233
  103202:	4f45                	li	t5,17
  103204:	65622043          	.insn	4, 0x65622043
  103208:	6f66                	.insn	2, 0x6f66
  10320a:	6572                	.insn	2, 0x6572
  10320c:	6320                	.insn	2, 0x6320
  10320e:	6c706d6f          	jal	s10,10a0d4 <_stack_start+0x2314>
  103212:	7465                	lui	s0,0xffff9
  103214:	0a65                	addi	s4,s4,25
  103216:	4a00                	lw	s0,16(a2)
  103218:	4d55                	li	s10,21
  10321a:	2050                	.insn	2, 0x2050
  10321c:	4f54                	lw	a3,28(a4)
  10321e:	0020                	addi	s0,sp,8
  103220:	4146                	lw	sp,80(sp)
  103222:	3354                	.insn	2, 0x3354
  103224:	3a32                	.insn	2, 0x3a32
  103226:	7220                	.insn	2, 0x7220
  103228:	6165                	addi	sp,sp,112
  10322a:	2064                	.insn	2, 0x2064
  10322c:	424c                	lw	a1,4(a2)
  10322e:	3041                	jal	102aae <boot_fat32_load_file+0x3fe>
  103230:	6f20                	.insn	2, 0x6f20
  103232:	4b000a6b          	.insn	4, 0x4b000a6b
  103236:	5245                	li	tp,-15
  103238:	454e                	lw	a0,208(sp)
  10323a:	2e4c                	.insn	2, 0x2e4c
  10323c:	454d                	li	a0,19
  10323e:	004d                	c.nop	19
  103240:	6e72656b          	.insn	4, 0x6e72656b
  103244:	6c65                	lui	s8,0x19
  103246:	3d5d315b          	.insn	4, 0x3d5d315b
  10324a:	4300                	lw	s0,0(a4)
  10324c:	4352                	lw	t1,20(sp)
  10324e:	4e20                	lw	s0,88(a2)
  103250:	65722047          	.insn	4, 0x65722047
  103254:	7274                	.insn	2, 0x7274
  103256:	3d79                	jal	1030f4 <__modsi3+0x140>
  103258:	6425                	lui	s0,0x9
  10325a:	2820                	.insn	2, 0x2820
  10325c:	636c6163          	bltu	s8,s6,10387e <$d.1+0xd6>
  103260:	253d                	jal	10388e <$d.1+0xe6>
  103262:	2078                	.insn	2, 0x2078
  103264:	7768                	.insn	2, 0x7768
  103266:	253d                	jal	103894 <$d.1+0xec>
  103268:	2978                	.insn	2, 0x2978
  10326a:	000a                	c.slli	zero,0x2
  10326c:	4146                	lw	sp,80(sp)
  10326e:	3354                	.insn	2, 0x3354
  103270:	3a32                	.insn	2, 0x3a32
  103272:	6120                	.insn	2, 0x6120
  103274:	6464                	.insn	2, 0x6464
  103276:	6620                	.insn	2, 0x6620
  103278:	7461                	lui	s0,0xffff8
  10327a:	0a32                	slli	s4,s4,0xc
  10327c:	4600                	lw	s0,8(a2)
  10327e:	5441                	li	s0,-16
  103280:	203a3233          	.insn	4, 0x203a3233
  103284:	6461                	lui	s0,0x18
  103286:	2064                	.insn	2, 0x2064
  103288:	6166                	.insn	2, 0x6166
  10328a:	3374                	.insn	2, 0x3374
  10328c:	000a                	c.slli	zero,0x2
  10328e:	4146                	lw	sp,80(sp)
  103290:	3354                	.insn	2, 0x3354
  103292:	3a32                	.insn	2, 0x3a32
  103294:	6220                	.insn	2, 0x6220
  103296:	6461                	lui	s0,0x18
  103298:	6620                	.insn	2, 0x6620
  10329a:	7461                	lui	s0,0xffff8
  10329c:	635f 756f 746e      	.insn	6, 0x746e756f635f
  1032a2:	000a                	c.slli	zero,0x2
  1032a4:	4146                	lw	sp,80(sp)
  1032a6:	3354                	.insn	2, 0x3354
  1032a8:	3a32                	.insn	2, 0x3a32
  1032aa:	6520                	.insn	2, 0x6520
  1032ac:	746e                	.insn	2, 0x746e
  1032ae:	7972                	.insn	2, 0x7972
  1032b0:	000a                	c.slli	zero,0x2
  1032b2:	4146                	lw	sp,80(sp)
  1032b4:	3354                	.insn	2, 0x3354
  1032b6:	3a32                	.insn	2, 0x3a32
  1032b8:	6e20                	.insn	2, 0x6e20
  1032ba:	7865                	lui	a6,0xffff9
  1032bc:	0a74                	addi	a3,sp,284
  1032be:	4600                	lw	s0,8(a2)
  1032c0:	5441                	li	s0,-16
  1032c2:	203a3233          	.insn	4, 0x203a3233
  1032c6:	6572                	.insn	2, 0x6572
  1032c8:	6461                	lui	s0,0x18
  1032ca:	6620                	.insn	2, 0x6620
  1032cc:	6c69                	lui	s8,0x1a
  1032ce:	2065                	jal	103376 <$d.1+0x24c>
  1032d0:	6166                	.insn	2, 0x6166
  1032d2:	6c69                	lui	s8,0x1a
  1032d4:	6465                	lui	s0,0x19
  1032d6:	000a                	c.slli	zero,0x2
  1032d8:	4146                	lw	sp,80(sp)
  1032da:	3354                	.insn	2, 0x3354
  1032dc:	3a32                	.insn	2, 0x3a32
  1032de:	4d20                	lw	s0,88(a0)
  1032e0:	5242                	lw	tp,48(sp)
  1032e2:	7320                	.insn	2, 0x7320
  1032e4:	6769                	lui	a4,0x1a
  1032e6:	6220                	.insn	2, 0x6220
  1032e8:	6461                	lui	s0,0x18
  1032ea:	000a                	c.slli	zero,0x2
  1032ec:	4146                	lw	sp,80(sp)
  1032ee:	3354                	.insn	2, 0x3354
  1032f0:	3a32                	.insn	2, 0x3a32
  1032f2:	6220                	.insn	2, 0x6220
  1032f4:	6461                	lui	s0,0x18
  1032f6:	7220                	.insn	2, 0x7220
  1032f8:	7365                	lui	t1,0xffff9
  1032fa:	7265                	lui	tp,0xffff9
  1032fc:	6576                	.insn	2, 0x6576
  1032fe:	0a64                	addi	s1,sp,284
  103300:	4600                	lw	s0,8(a2)
  103302:	5441                	li	s0,-16
  103304:	203a3233          	.insn	4, 0x203a3233
  103308:	6f72                	.insn	2, 0x6f72
  10330a:	6320746f          	jal	s0,10a93c <_stack_start+0x2b7c>
  10330e:	6568                	.insn	2, 0x6568
  103310:	000a6b63          	bltu	s4,zero,103326 <$d.1+0x1fc>
  103314:	4146                	lw	sp,80(sp)
  103316:	3354                	.insn	2, 0x3354
  103318:	3a32                	.insn	2, 0x3a32
  10331a:	6220                	.insn	2, 0x6220
  10331c:	6461                	lui	s0,0x18
  10331e:	6320                	.insn	2, 0x6320
  103320:	756c                	.insn	2, 0x756c
  103322:	72657473          	.insn	4, 0x72657473
  103326:	000a                	c.slli	zero,0x2
  103328:	4146                	lw	sp,80(sp)
  10332a:	3354                	.insn	2, 0x3354
  10332c:	3a32                	.insn	2, 0x3a32
  10332e:	7020                	.insn	2, 0x7020
  103330:	7261                	lui	tp,0xffff8
  103332:	5f74                	lw	a3,124(a4)
  103334:	626c                	.insn	2, 0x626c
  103336:	2061                	jal	1033be <$d.1+0x294>
  103338:	657a                	.insn	2, 0x657a
  10333a:	6f72                	.insn	2, 0x6f72
  10333c:	000a                	c.slli	zero,0x2
  10333e:	4146                	lw	sp,80(sp)
  103340:	3354                	.insn	2, 0x3354
  103342:	3a32                	.insn	2, 0x3a32
  103344:	6320                	.insn	2, 0x6320
  103346:	6c61                	lui	s8,0x18
  103348:	61642063          	.insn	4, 0x61642063
  10334c:	6174                	.insn	2, 0x6174
  10334e:	000a                	c.slli	zero,0x2
  103350:	4146                	lw	sp,80(sp)
  103352:	3354                	.insn	2, 0x3354
  103354:	3a32                	.insn	2, 0x3a32
  103356:	6620                	.insn	2, 0x6620
  103358:	646e756f          	jal	a0,1ea99e <_stack_top+0xdebde>
  10335c:	000a                	c.slli	zero,0x2
  10335e:	4146                	lw	sp,80(sp)
  103360:	3354                	.insn	2, 0x3354
  103362:	3a32                	.insn	2, 0x3a32
  103364:	7220                	.insn	2, 0x7220
  103366:	6165                	addi	sp,sp,112
  103368:	2064                	.insn	2, 0x2064
  10336a:	6964                	.insn	2, 0x6964
  10336c:	2072                	.insn	2, 0x2072
  10336e:	6166                	.insn	2, 0x6166
  103370:	6c69                	lui	s8,0x1a
  103372:	6465                	lui	s0,0x19
  103374:	000a                	c.slli	zero,0x2
  103376:	4146                	lw	sp,80(sp)
  103378:	3354                	.insn	2, 0x3354
  10337a:	2032                	.insn	2, 0x2032
  10337c:	6f6d                	lui	t5,0x1b
  10337e:	6e75                	lui	t3,0x1d
  103380:	2074                	.insn	2, 0x2074
  103382:	6166                	.insn	2, 0x6166
  103384:	6c69                	lui	s8,0x1a
  103386:	6465                	lui	s0,0x19
  103388:	000a                	c.slli	zero,0x2
  10338a:	7375                	lui	t1,0xffffd
  10338c:	7265                	lui	tp,0xffff9
  10338e:	7720                	.insn	2, 0x7720
  103390:	7364726f          	jal	tp,14aac6 <_stack_top+0x3ed06>
  103394:	003d                	c.nop	15
  103396:	666e695b          	.insn	4, 0x666e695b
  10339a:	6c205d6f          	jal	s10,108a5c <_stack_start+0xc9c>
  10339e:	6e65                	lui	t3,0x19
  1033a0:	7420                	.insn	2, 0x7420
  1033a2:	62206f6f          	jal	t5,1099c4 <_stack_start+0x1c04>
  1033a6:	6769                	lui	a4,0x1a
  1033a8:	2820                	.insn	2, 0x2820
  1033aa:	303e                	.insn	2, 0x303e
  1033ac:	2578                	.insn	2, 0x2578
  1033ae:	2958                	.insn	2, 0x2958
  1033b0:	202c                	.insn	2, 0x202c
  1033b2:	6f72                	.insn	2, 0x6f72
  1033b4:	6e75                	lui	t3,0x1d
  1033b6:	2064                	.insn	2, 0x2064
  1033b8:	6f64                	.insn	2, 0x6f64
  1033ba:	74206e77          	.insn	4, 0x74206e77
  1033be:	7830206f          	j	106340 <$d.1+0x2980>
  1033c2:	5825                	li	a6,-23
  1033c4:	000a                	c.slli	zero,0x2
  1033c6:	4146                	lw	sp,80(sp)
  1033c8:	3354                	.insn	2, 0x3354
  1033ca:	3a32                	.insn	2, 0x3a32
  1033cc:	7220                	.insn	2, 0x7220
  1033ce:	6165                	addi	sp,sp,112
  1033d0:	5f64                	lw	s1,124(a4)
  1033d2:	74636573          	.insn	4, 0x74636573
  1033d6:	6e20726f          	jal	tp,10aab8 <_stack_start+0x2cf8>
  1033da:	6c75                	lui	s8,0x1d
  1033dc:	0a6c                	addi	a1,sp,284
  1033de:	4600                	lw	s0,8(a2)
  1033e0:	5441                	li	s0,-16
  1033e2:	203a3233          	.insn	4, 0x203a3233
  1033e6:	6572                	.insn	2, 0x6572
  1033e8:	6461                	lui	s0,0x18
  1033ea:	6420                	.insn	2, 0x6420
  1033ec:	7269                	lui	tp,0xffffa
  1033ee:	000a                	c.slli	zero,0x2
  1033f0:	4146                	lw	sp,80(sp)
  1033f2:	3354                	.insn	2, 0x3354
  1033f4:	3a32                	.insn	2, 0x3a32
  1033f6:	7320                	.insn	2, 0x7320
  1033f8:	7a69                	lui	s4,0xffffa
  1033fa:	3d65                	jal	1032b2 <$d.1+0x188>
  1033fc:	5300                	lw	s0,32(a4)
  1033fe:	2044                	.insn	2, 0x2044
  103400:	4552                	lw	a0,20(sp)
  103402:	4441                	li	s0,16
  103404:	5420                	lw	s0,104(s0)
  103406:	4d49                	li	s10,18
  103408:	4f45                	li	t5,17
  10340a:	5455                	li	s0,-11
  10340c:	6c20                	.insn	2, 0x6c20
  10340e:	6162                	.insn	2, 0x6162
  103410:	003d                	c.nop	15

00103412 <$d.3>:
  103412:	4146                	lw	sp,80(sp)
  103414:	3354                	.insn	2, 0x3354
  103416:	3a32                	.insn	2, 0x3a32
  103418:	6320                	.insn	2, 0x6320
  10341a:	6c32                	.insn	2, 0x6c32
  10341c:	6220                	.insn	2, 0x6220
  10341e:	6461                	lui	s0,0x18
  103420:	000a                	c.slli	zero,0x2
  103422:	4146                	lw	sp,80(sp)
  103424:	3354                	.insn	2, 0x3354
  103426:	3a32                	.insn	2, 0x3a32
  103428:	7220                	.insn	2, 0x7220
  10342a:	6165                	addi	sp,sp,112
  10342c:	2064                	.insn	2, 0x2064
  10342e:	424c                	lw	a1,4(a2)
  103430:	3041                	jal	102cb0 <boot_fat32_load_mem_file+0x188>
  103432:	6620                	.insn	2, 0x6620
  103434:	6961                	lui	s2,0x18
  103436:	656c                	.insn	2, 0x656c
  103438:	0a64                	addi	s1,sp,284
  10343a:	5300                	lw	s0,32(a4)
  10343c:	2044                	.insn	2, 0x2044
  10343e:	4e49                	li	t3,18
  103440:	5449                	li	s0,-14
  103442:	7320                	.insn	2, 0x7320
  103444:	6174                	.insn	2, 0x6174
  103446:	7472                	.insn	2, 0x7472
  103448:	000a                	c.slli	zero,0x2
  10344a:	4146                	lw	sp,80(sp)
  10344c:	3354                	.insn	2, 0x3354
  10344e:	3a32                	.insn	2, 0x3a32
  103450:	7220                	.insn	2, 0x7220
  103452:	20746f6f          	jal	t5,149e58 <_stack_top+0x3e098>
  103456:	6f6c                	.insn	2, 0x6f6c
  103458:	000a706f          	j	1aa458 <_stack_top+0x9e698>
  10345c:	4146                	lw	sp,80(sp)
  10345e:	3354                	.insn	2, 0x3354
  103460:	3a32                	.insn	2, 0x3a32
  103462:	7320                	.insn	2, 0x7320
  103464:	7a69                	lui	s4,0xffffa
  103466:	2065                	jal	10350e <$d.3+0xfc>
  103468:	657a                	.insn	2, 0x657a
  10346a:	6f72                	.insn	2, 0x6f72
  10346c:	000a                	c.slli	zero,0x2
  10346e:	4146                	lw	sp,80(sp)
  103470:	3354                	.insn	2, 0x3354
  103472:	3a32                	.insn	2, 0x3a32
  103474:	7220                	.insn	2, 0x7220
  103476:	6165                	addi	sp,sp,112
  103478:	2064                	.insn	2, 0x2064
  10347a:	6966                	.insn	2, 0x6966
  10347c:	656c                	.insn	2, 0x656c
  10347e:	7320                	.insn	2, 0x7320
  103480:	6365                	lui	t1,0x19
  103482:	6f74                	.insn	2, 0x6f74
  103484:	0a72                	slli	s4,s4,0x1c
  103486:	4600                	lw	s0,8(a2)
  103488:	4649                	li	a2,18
  10348a:	4d45204f          	.insn	4, 0x4d45204f
  10348e:	5450                	lw	a2,44(s0)
  103490:	2059                	jal	103516 <$d.3+0x104>
  103492:	4954                	lw	a3,20(a0)
  103494:	454d                	li	a0,19
  103496:	2054554f          	.insn	4, 0x2054554f
  10349a:	626c                	.insn	2, 0x626c
  10349c:	3d61                	jal	103334 <$d.1+0x20a>
  10349e:	4600                	lw	s0,8(a2)
  1034a0:	5441                	li	s0,-16
  1034a2:	203a3233          	.insn	4, 0x203a3233
  1034a6:	6f6c                	.insn	2, 0x6f6c
  1034a8:	6461                	lui	s0,0x18
  1034aa:	6520                	.insn	2, 0x6520
  1034ac:	746e                	.insn	2, 0x746e
  1034ae:	7265                	lui	tp,0xffff9
  1034b0:	000a                	c.slli	zero,0x2
  1034b2:	4146                	lw	sp,80(sp)
  1034b4:	3354                	.insn	2, 0x3354
  1034b6:	3a32                	.insn	2, 0x3a32
  1034b8:	7220                	.insn	2, 0x7220
  1034ba:	6165                	addi	sp,sp,112
  1034bc:	2064                	.insn	2, 0x2064
  1034be:	5042                	.insn	2, 0x5042
  1034c0:	0a42                	slli	s4,s4,0x10
  1034c2:	4600                	lw	s0,8(a2)
  1034c4:	5441                	li	s0,-16
  1034c6:	203a3233          	.insn	4, 0x203a3233
  1034ca:	6461                	lui	s0,0x18
  1034cc:	2064                	.insn	2, 0x2064
  1034ce:	6166                	.insn	2, 0x6166
  1034d0:	3474                	.insn	2, 0x3474
  1034d2:	000a                	c.slli	zero,0x2
  1034d4:	4146                	lw	sp,80(sp)
  1034d6:	3354                	.insn	2, 0x3354
  1034d8:	3a32                	.insn	2, 0x3a32
  1034da:	6220                	.insn	2, 0x6220
  1034dc:	6461                	lui	s0,0x18
  1034de:	6d20                	.insn	2, 0x6d20
  1034e0:	6d65                	lui	s10,0x19
  1034e2:	6320                	.insn	2, 0x6320
  1034e4:	6168                	.insn	2, 0x6168
  1034e6:	0a72                	slli	s4,s4,0x1c
  1034e8:	0a00                	addi	s0,sp,272
  1034ea:	4600                	lw	s0,8(a2)
  1034ec:	5441                	li	s0,-16
  1034ee:	203a3233          	.insn	4, 0x203a3233
  1034f2:	79706f63          	bltu	zero,s7,103c90 <$d.1+0x2d0>
  1034f6:	6f20                	.insn	2, 0x6f20
  1034f8:	46000a6b          	.insn	4, 0x46000a6b
  1034fc:	5441                	li	s0,-16
  1034fe:	203a3233          	.insn	4, 0x203a3233
  103502:	656e                	.insn	2, 0x656e
  103504:	7478                	.insn	2, 0x7478
  103506:	6320                	.insn	2, 0x6320
  103508:	756c                	.insn	2, 0x756c
  10350a:	72657473          	.insn	4, 0x72657473
  10350e:	000a                	c.slli	zero,0x2
  103510:	4146                	lw	sp,80(sp)
  103512:	3354                	.insn	2, 0x3354
  103514:	3a32                	.insn	2, 0x3a32
  103516:	6220                	.insn	2, 0x6220
  103518:	6461                	lui	s0,0x18
  10351a:	7320                	.insn	2, 0x7320
  10351c:	6370                	.insn	2, 0x6370
  10351e:	7320                	.insn	2, 0x7320
  103520:	6968                	.insn	2, 0x6968
  103522:	7466                	.insn	2, 0x7466
  103524:	000a                	c.slli	zero,0x2
  103526:	6e72656b          	.insn	4, 0x6e72656b
  10352a:	6c65                	lui	s8,0x19
  10352c:	3d5d305b          	.insn	4, 0x3d5d305b
  103530:	7500                	.insn	2, 0x7500
  103532:	5b726573          	.insn	4, 0x5b726573
  103536:	5d30                	lw	a2,120(a0)
  103538:	003d                	c.nop	15
  10353a:	4146                	lw	sp,80(sp)
  10353c:	3354                	.insn	2, 0x3354
  10353e:	3a32                	.insn	2, 0x3a32
  103540:	7020                	.insn	2, 0x7020
  103542:	7261                	lui	tp,0xffff8
  103544:	33206573          	.insn	4, 0x33206573
  103548:	000a                	c.slli	zero,0x2
  10354a:	4146                	lw	sp,80(sp)
  10354c:	3354                	.insn	2, 0x3354
  10354e:	3a32                	.insn	2, 0x3a32
  103550:	6620                	.insn	2, 0x6620
  103552:	6e69                	lui	t3,0x1a
  103554:	2064                	.insn	2, 0x2064
  103556:	6166                	.insn	2, 0x6166
  103558:	6c69                	lui	s8,0x1a
  10355a:	6465                	lui	s0,0x19
  10355c:	000a                	c.slli	zero,0x2
  10355e:	4146                	lw	sp,80(sp)
  103560:	3354                	.insn	2, 0x3354
  103562:	3a32                	.insn	2, 0x3a32
  103564:	6920                	.insn	2, 0x6920
  103566:	766e                	.insn	2, 0x766e
  103568:	6c61                	lui	s8,0x18
  10356a:	6469                	lui	s0,0x1a
  10356c:	7320                	.insn	2, 0x7320
  10356e:	6174                	.insn	2, 0x6174
  103570:	7472                	.insn	2, 0x7472
  103572:	6320                	.insn	2, 0x6320
  103574:	756c                	.insn	2, 0x756c
  103576:	72657473          	.insn	4, 0x72657473
  10357a:	000a                	c.slli	zero,0x2
  10357c:	4146                	lw	sp,80(sp)
  10357e:	3354                	.insn	2, 0x3354
  103580:	3a32                	.insn	2, 0x3a32
  103582:	7020                	.insn	2, 0x7020
  103584:	7261                	lui	tp,0xffff8
  103586:	6974                	.insn	2, 0x6974
  103588:	6c61                	lui	s8,0x18
  10358a:	6820                	.insn	2, 0x6820
  10358c:	7865                	lui	a6,0xffff9
  10358e:	7720                	.insn	2, 0x7720
  103590:	0a64726f          	jal	tp,14a636 <_stack_top+0x3e876>
  103594:	4600                	lw	s0,8(a2)
  103596:	5441                	li	s0,-16
  103598:	203a3233          	.insn	4, 0x203a3233
  10359c:	65707573          	.insn	4, 0x65707573
  1035a0:	2072                	.insn	2, 0x2072
  1035a2:	6c66                	.insn	2, 0x6c66
  1035a4:	7970706f          	j	10b53a <_stack_start+0x377a>
  1035a8:	000a                	c.slli	zero,0x2
  1035aa:	4146                	lw	sp,80(sp)
  1035ac:	3354                	.insn	2, 0x3354
  1035ae:	3a32                	.insn	2, 0x3a32
  1035b0:	7020                	.insn	2, 0x7020
  1035b2:	7261                	lui	tp,0xffff8
  1035b4:	36206573          	.insn	4, 0x36206573
  1035b8:	000a                	c.slli	zero,0x2
  1035ba:	69204453          	.insn	4, 0x69204453
  1035be:	696e                	.insn	2, 0x696e
  1035c0:	2074                	.insn	2, 0x2074
  1035c2:	6166                	.insn	2, 0x6166
  1035c4:	6c69                	lui	s8,0x1a
  1035c6:	6465                	lui	s0,0x19
  1035c8:	000a                	c.slli	zero,0x2
  1035ca:	20435243          	.insn	4, 0x20435243
  1035ce:	474e                	lw	a4,208(sp)
  1035d0:	6c20                	.insn	2, 0x6c20
  1035d2:	6162                	.insn	2, 0x6162
  1035d4:	003d                	c.nop	15
  1035d6:	7375                	lui	t1,0xffffd
  1035d8:	6761                	lui	a4,0x18
  1035da:	3a65                	jal	102f92 <__umodsi3+0x2>
  1035dc:	6420                	.insn	2, 0x6420
  1035de:	706d                	c.lui	zero,0xffffb
  1035e0:	5b20                	lw	s0,112(a4)
  1035e2:	7366666f          	jal	a2,169d18 <_stack_top+0x5df58>
  1035e6:	7465                	lui	s0,0xffff9
  1035e8:	685f 7865 205d      	.insn	6, 0x205d7865685f
  1035ee:	6e656c5b          	.insn	4, 0x6e656c5b
  1035f2:	685f 7865 0a5d      	.insn	6, 0x0a5d7865685f
  1035f8:	4600                	lw	s0,8(a2)
  1035fa:	5441                	li	s0,-16
  1035fc:	203a3233          	.insn	4, 0x203a3233
  103600:	6572                	.insn	2, 0x6572
  103602:	6461                	lui	s0,0x18
  103604:	4c20                	lw	s0,88(s0)
  103606:	4142                	lw	sp,16(sp)
  103608:	0a30                	addi	a2,sp,280
  10360a:	4600                	lw	s0,8(a2)
  10360c:	5441                	li	s0,-16
  10360e:	203a3233          	.insn	4, 0x203a3233
  103612:	626c                	.insn	2, 0x626c
  103614:	2061                	jal	10369c <print_hex8.HEX+0x34>
  103616:	000a6b6f          	jal	s6,1a9616 <_stack_top+0x9d856>
  10361a:	4146                	lw	sp,80(sp)
  10361c:	3354                	.insn	2, 0x3354
  10361e:	3a32                	.insn	2, 0x3a32
  103620:	6e20                	.insn	2, 0x6e20
  103622:	7865                	lui	a6,0xffff9
  103624:	2074                	.insn	2, 0x2074
  103626:	73756c63          	bltu	a0,s7,103d5e <$d.1+0x39e>
  10362a:	6574                	.insn	2, 0x6574
  10362c:	2072                	.insn	2, 0x2072
  10362e:	000a6b6f          	jal	s6,1a962e <_stack_top+0x9d86e>
  103632:	4146                	lw	sp,80(sp)
  103634:	3354                	.insn	2, 0x3354
  103636:	3a32                	.insn	2, 0x3a32
  103638:	6c20                	.insn	2, 0x6c20
  10363a:	2064616f          	jal	sp,149840 <_stack_top+0x3da80>
  10363e:	656d                	lui	a0,0x1b
  103640:	206d                	jal	1036ea <$d.1+0x35>
  103642:	6f64                	.insn	2, 0x6f64
  103644:	656e                	.insn	2, 0x656e
  103646:	000a                	c.slli	zero,0x2
  103648:	4146                	lw	sp,80(sp)
  10364a:	3354                	.insn	2, 0x3354
  10364c:	3a32                	.insn	2, 0x3a32
  10364e:	7020                	.insn	2, 0x7020
  103650:	7261                	lui	tp,0xffff8
  103652:	2074                	.insn	2, 0x2074
  103654:	000a6b6f          	jal	s6,1a9654 <_stack_top+0x9d894>
  103658:	4146                	lw	sp,80(sp)
  10365a:	3354                	.insn	2, 0x3354
  10365c:	3a32                	.insn	2, 0x3a32
  10365e:	7020                	.insn	2, 0x7020
  103660:	7261                	lui	tp,0xffff8
  103662:	35206573          	.insn	4, 0x35206573
  103666:	000a                	c.slli	zero,0x2

00103668 <print_hex8.HEX>:
    static const char HEX[] = "0123456789abcdef";
  103668:	3130                	.insn	2, 0x3130
  10366a:	3332                	.insn	2, 0x3332
  10366c:	3534                	.insn	2, 0x3534
  10366e:	3736                	.insn	2, 0x3736
  103670:	3938                	.insn	2, 0x3938
  103672:	6261                	lui	tp,0x18
  103674:	66656463          	bltu	a0,t1,103cdc <$d.1+0x31c>
  103678:	4600                	lw	s0,8(a2)
  10367a:	5441                	li	s0,-16
  10367c:	203a3233          	.insn	4, 0x203a3233
  103680:	6f6d                	lui	t5,0x1b
  103682:	6e75                	lui	t3,0x1d
  103684:	2074                	.insn	2, 0x2074
  103686:	6e65                	lui	t3,0x19
  103688:	6574                	.insn	2, 0x6574
  10368a:	0a72                	slli	s4,s4,0x1c
  10368c:	4600                	lw	s0,8(a2)
  10368e:	5441                	li	s0,-16
  103690:	203a3233          	.insn	4, 0x203a3233
  103694:	6964                	.insn	2, 0x6964
  103696:	2072                	.insn	2, 0x2072
  103698:	6e65                	lui	t3,0x19
  10369a:	0a64                	addi	s1,sp,284
	...

0010369d <$d.1>:
  10369d:	6f62                	.insn	2, 0x6f62
  10369f:	6f6c746f          	jal	s0,1cad95 <_stack_top+0xbefd5>
  1036a3:	6461                	lui	s0,0x18
  1036a5:	7265                	lui	tp,0xffff9
  1036a7:	4620                	lw	s0,72(a2)
  1036a9:	5441                	li	s0,-16
  1036ab:	73203233          	.insn	4, 0x73203233
  1036af:	6174                	.insn	2, 0x6174
  1036b1:	7472                	.insn	2, 0x7472
  1036b3:	000a                	c.slli	zero,0x2

001036b5 <$d.1>:
  1036b5:	203a                	.insn	2, 0x203a
  1036b7:	4600                	lw	s0,8(a2)
  1036b9:	5441                	li	s0,-16
  1036bb:	203a3233          	.insn	4, 0x203a3233
  1036bf:	6162                	.insn	2, 0x6162
  1036c1:	2064                	.insn	2, 0x2064
  1036c3:	0a637073          	.insn	4, 0x0a637073
  1036c7:	4600                	lw	s0,8(a2)
  1036c9:	5441                	li	s0,-16
  1036cb:	203a3233          	.insn	4, 0x203a3233
  1036cf:	6f6c                	.insn	2, 0x6f6c
  1036d1:	6461                	lui	s0,0x18
  1036d3:	6420                	.insn	2, 0x6420
  1036d5:	0a656e6f          	jal	t3,15977b <_stack_top+0x4d9bb>
  1036d9:	6b00                	.insn	2, 0x6b00
  1036db:	7265                	lui	tp,0xffff9
  1036dd:	656e                	.insn	2, 0x656e
  1036df:	206c                	.insn	2, 0x206c
  1036e1:	64726f77          	.insn	4, 0x64726f77
  1036e5:	46003d73          	.insn	4, 0x46003d73
  1036e9:	5441                	li	s0,-16
  1036eb:	203a3233          	.insn	4, 0x203a3233
  1036ef:	6966                	.insn	2, 0x6966
  1036f1:	646e                	.insn	2, 0x646e
  1036f3:	6520                	.insn	2, 0x6520
  1036f5:	746e                	.insn	2, 0x746e
  1036f7:	7265                	lui	tp,0xffff9
  1036f9:	000a                	c.slli	zero,0x2
  1036fb:	4146                	lw	sp,80(sp)
  1036fd:	3354                	.insn	2, 0x3354
  1036ff:	3a32                	.insn	2, 0x3a32
  103701:	6320                	.insn	2, 0x6320
  103703:	6c61                	lui	s8,0x18
  103705:	626c2063          	.insn	4, 0x626c2063
  103709:	0a61                	addi	s4,s4,24 # ffffa018 <_stack_top+0xffeee258>
  10370b:	4600                	lw	s0,8(a2)
  10370d:	5441                	li	s0,-16
  10370f:	203a3233          	.insn	4, 0x203a3233
  103713:	6572                	.insn	2, 0x6572
  103715:	616d                	addi	sp,sp,240
  103717:	6e69                	lui	t3,0x1a
  103719:	7320                	.insn	2, 0x7320
  10371b:	7465                	lui	s0,0xffff9
  10371d:	000a                	c.slli	zero,0x2
  10371f:	4146                	lw	sp,80(sp)
  103721:	3354                	.insn	2, 0x3354
  103723:	3a32                	.insn	2, 0x3a32
  103725:	6620                	.insn	2, 0x6620
  103727:	6c69                	lui	s8,0x1a
  103729:	2065                	jal	1037d1 <$d.1+0x29>
  10372b:	74636573          	.insn	4, 0x74636573
  10372f:	6f20726f          	jal	tp,10ae21 <_stack_start+0x3061>
  103733:	55000a6b          	.insn	4, 0x55000a6b
  103737:	2e524553          	.insn	4, 0x2e524553
  10373b:	454d                	li	a0,19
  10373d:	004d                	c.nop	19
  10373f:	49204453          	.insn	4, 0x49204453
  103743:	494e                	lw	s2,208(sp)
  103745:	2054                	.insn	2, 0x2054
  103747:	4954                	lw	a3,20(a0)
  103749:	454d                	li	a0,19
  10374b:	0a54554f          	.insn	4, 0x0a54554f
  10374f:	4600                	lw	s0,8(a2)
  103751:	5441                	li	s0,-16
  103753:	203a3233          	.insn	4, 0x203a3233
  103757:	6170                	.insn	2, 0x6170
  103759:	7372                	.insn	2, 0x7372
  10375b:	2065                	jal	103803 <$d.1+0x5b>
  10375d:	0a34                	addi	a3,sp,280
  10375f:	4600                	lw	s0,8(a2)
  103761:	5441                	li	s0,-16
  103763:	203a3233          	.insn	4, 0x203a3233
  103767:	6162                	.insn	2, 0x6162
  103769:	2064                	.insn	2, 0x2064
  10376b:	7062                	.insn	2, 0x7062
  10376d:	46000a73          	.insn	4, 0x46000a73
  103771:	5441                	li	s0,-16
  103773:	203a3233          	.insn	4, 0x203a3233
  103777:	6461                	lui	s0,0x18
  103779:	2064                	.insn	2, 0x2064
  10377b:	6166                	.insn	2, 0x6166
  10377d:	3174                	.insn	2, 0x3174
  10377f:	000a                	c.slli	zero,0x2
  103781:	4146                	lw	sp,80(sp)
  103783:	3354                	.insn	2, 0x3354
  103785:	3a32                	.insn	2, 0x3a32
  103787:	6420                	.insn	2, 0x6420
  103789:	7269                	lui	tp,0xffffa
  10378b:	6f20                	.insn	2, 0x6f20
  10378d:	46000a6b          	.insn	4, 0x46000a6b
  103791:	5441                	li	s0,-16
  103793:	203a3233          	.insn	4, 0x203a3233
  103797:	6f6c                	.insn	2, 0x6f6c
  103799:	6461                	lui	s0,0x18
  10379b:	6d20                	.insn	2, 0x6d20
  10379d:	6d65                	lui	s10,0x19
  10379f:	6520                	.insn	2, 0x6520
  1037a1:	746e                	.insn	2, 0x746e
  1037a3:	7265                	lui	tp,0xffff9
  1037a5:	000a                	c.slli	zero,0x2
	...

001037a8 <$d.1>:
  1037a8:	29a8                	.insn	2, 0x29a8
  1037aa:	0010                	.insn	2, 0x0010
  1037ac:	2954                	.insn	2, 0x2954
  1037ae:	0010                	.insn	2, 0x0010
  1037b0:	296c                	.insn	2, 0x296c
  1037b2:	0010                	.insn	2, 0x0010
  1037b4:	298c                	.insn	2, 0x298c
  1037b6:	0010                	.insn	2, 0x0010
  1037b8:	296c                	.insn	2, 0x296c
  1037ba:	0010                	.insn	2, 0x0010
  1037bc:	296c                	.insn	2, 0x296c
  1037be:	0010                	.insn	2, 0x0010
  1037c0:	296c                	.insn	2, 0x296c
  1037c2:	0010                	.insn	2, 0x0010
  1037c4:	2994                	.insn	2, 0x2994
  1037c6:	0010                	.insn	2, 0x0010
  1037c8:	296c                	.insn	2, 0x296c
  1037ca:	0010                	.insn	2, 0x0010
  1037cc:	296c                	.insn	2, 0x296c
  1037ce:	0010                	.insn	2, 0x0010
  1037d0:	296c                	.insn	2, 0x296c
  1037d2:	0010                	.insn	2, 0x0010
  1037d4:	296c                	.insn	2, 0x296c
  1037d6:	0010                	.insn	2, 0x0010
  1037d8:	296c                	.insn	2, 0x296c
  1037da:	0010                	.insn	2, 0x0010
  1037dc:	296c                	.insn	2, 0x296c
  1037de:	0010                	.insn	2, 0x0010
  1037e0:	296c                	.insn	2, 0x296c
  1037e2:	0010                	.insn	2, 0x0010
  1037e4:	299c                	.insn	2, 0x299c
  1037e6:	0010                	.insn	2, 0x0010
  1037e8:	296c                	.insn	2, 0x296c
  1037ea:	0010                	.insn	2, 0x0010
  1037ec:	296c                	.insn	2, 0x296c
  1037ee:	0010                	.insn	2, 0x0010
  1037f0:	296c                	.insn	2, 0x296c
  1037f2:	0010                	.insn	2, 0x0010
  1037f4:	296c                	.insn	2, 0x296c
  1037f6:	0010                	.insn	2, 0x0010
  1037f8:	296c                	.insn	2, 0x296c
  1037fa:	0010                	.insn	2, 0x0010
  1037fc:	296c                	.insn	2, 0x296c
  1037fe:	0010                	.insn	2, 0x0010
  103800:	296c                	.insn	2, 0x296c
  103802:	0010                	.insn	2, 0x0010
  103804:	296c                	.insn	2, 0x296c
  103806:	0010                	.insn	2, 0x0010
  103808:	296c                	.insn	2, 0x296c
  10380a:	0010                	.insn	2, 0x0010
  10380c:	296c                	.insn	2, 0x296c
  10380e:	0010                	.insn	2, 0x0010
  103810:	296c                	.insn	2, 0x296c
  103812:	0010                	.insn	2, 0x0010
  103814:	296c                	.insn	2, 0x296c
  103816:	0010                	.insn	2, 0x0010
  103818:	296c                	.insn	2, 0x296c
  10381a:	0010                	.insn	2, 0x0010
  10381c:	296c                	.insn	2, 0x296c
  10381e:	0010                	.insn	2, 0x0010
  103820:	296c                	.insn	2, 0x296c
  103822:	0010                	.insn	2, 0x0010
  103824:	29a4                	.insn	2, 0x29a4
  103826:	0010                	.insn	2, 0x0010
  103828:	296c                	.insn	2, 0x296c
  10382a:	0010                	.insn	2, 0x0010
  10382c:	296c                	.insn	2, 0x296c
  10382e:	0010                	.insn	2, 0x0010
  103830:	296c                	.insn	2, 0x296c
  103832:	0010                	.insn	2, 0x0010
  103834:	296c                	.insn	2, 0x296c
  103836:	0010                	.insn	2, 0x0010
  103838:	296c                	.insn	2, 0x296c
  10383a:	0010                	.insn	2, 0x0010
  10383c:	296c                	.insn	2, 0x296c
  10383e:	0010                	.insn	2, 0x0010
  103840:	296c                	.insn	2, 0x296c
  103842:	0010                	.insn	2, 0x0010
  103844:	296c                	.insn	2, 0x296c
  103846:	0010                	.insn	2, 0x0010
  103848:	296c                	.insn	2, 0x296c
  10384a:	0010                	.insn	2, 0x0010
  10384c:	296c                	.insn	2, 0x296c
  10384e:	0010                	.insn	2, 0x0010
  103850:	296c                	.insn	2, 0x296c
  103852:	0010                	.insn	2, 0x0010
  103854:	296c                	.insn	2, 0x296c
  103856:	0010                	.insn	2, 0x0010
  103858:	296c                	.insn	2, 0x296c
  10385a:	0010                	.insn	2, 0x0010
  10385c:	296c                	.insn	2, 0x296c
  10385e:	0010                	.insn	2, 0x0010
  103860:	296c                	.insn	2, 0x296c
  103862:	0010                	.insn	2, 0x0010
  103864:	296c                	.insn	2, 0x296c
  103866:	0010                	.insn	2, 0x0010
  103868:	296c                	.insn	2, 0x296c
  10386a:	0010                	.insn	2, 0x0010
  10386c:	296c                	.insn	2, 0x296c
  10386e:	0010                	.insn	2, 0x0010
  103870:	296c                	.insn	2, 0x296c
  103872:	0010                	.insn	2, 0x0010
  103874:	296c                	.insn	2, 0x296c
  103876:	0010                	.insn	2, 0x0010
  103878:	296c                	.insn	2, 0x296c
  10387a:	0010                	.insn	2, 0x0010
  10387c:	296c                	.insn	2, 0x296c
  10387e:	0010                	.insn	2, 0x0010
  103880:	296c                	.insn	2, 0x296c
  103882:	0010                	.insn	2, 0x0010
  103884:	296c                	.insn	2, 0x296c
  103886:	0010                	.insn	2, 0x0010
  103888:	296c                	.insn	2, 0x296c
  10388a:	0010                	.insn	2, 0x0010
  10388c:	296c                	.insn	2, 0x296c
  10388e:	0010                	.insn	2, 0x0010
  103890:	296c                	.insn	2, 0x296c
  103892:	0010                	.insn	2, 0x0010
  103894:	296c                	.insn	2, 0x296c
  103896:	0010                	.insn	2, 0x0010
  103898:	296c                	.insn	2, 0x296c
  10389a:	0010                	.insn	2, 0x0010
  10389c:	296c                	.insn	2, 0x296c
  10389e:	0010                	.insn	2, 0x0010
  1038a0:	296c                	.insn	2, 0x296c
  1038a2:	0010                	.insn	2, 0x0010
  1038a4:	2984                	.insn	2, 0x2984
  1038a6:	0010                	.insn	2, 0x0010
  1038a8:	2d54                	.insn	2, 0x2d54
  1038aa:	0010                	.insn	2, 0x0010
  1038ac:	2ce8                	.insn	2, 0x2ce8
  1038ae:	0010                	.insn	2, 0x0010
  1038b0:	2d00                	.insn	2, 0x2d00
  1038b2:	0010                	.insn	2, 0x0010
  1038b4:	2d38                	.insn	2, 0x2d38
  1038b6:	0010                	.insn	2, 0x0010
  1038b8:	2d00                	.insn	2, 0x2d00
  1038ba:	0010                	.insn	2, 0x0010
  1038bc:	2d00                	.insn	2, 0x2d00
  1038be:	0010                	.insn	2, 0x0010
  1038c0:	2d00                	.insn	2, 0x2d00
  1038c2:	0010                	.insn	2, 0x0010
  1038c4:	2d40                	.insn	2, 0x2d40
  1038c6:	0010                	.insn	2, 0x0010
  1038c8:	2d00                	.insn	2, 0x2d00
  1038ca:	0010                	.insn	2, 0x0010
  1038cc:	2d00                	.insn	2, 0x2d00
  1038ce:	0010                	.insn	2, 0x0010
  1038d0:	2d00                	.insn	2, 0x2d00
  1038d2:	0010                	.insn	2, 0x0010
  1038d4:	2d00                	.insn	2, 0x2d00
  1038d6:	0010                	.insn	2, 0x0010
  1038d8:	2d00                	.insn	2, 0x2d00
  1038da:	0010                	.insn	2, 0x0010
  1038dc:	2d00                	.insn	2, 0x2d00
  1038de:	0010                	.insn	2, 0x0010
  1038e0:	2d00                	.insn	2, 0x2d00
  1038e2:	0010                	.insn	2, 0x0010
  1038e4:	2d48                	.insn	2, 0x2d48
  1038e6:	0010                	.insn	2, 0x0010
  1038e8:	2d00                	.insn	2, 0x2d00
  1038ea:	0010                	.insn	2, 0x0010
  1038ec:	2d00                	.insn	2, 0x2d00
  1038ee:	0010                	.insn	2, 0x0010
  1038f0:	2d00                	.insn	2, 0x2d00
  1038f2:	0010                	.insn	2, 0x0010
  1038f4:	2d00                	.insn	2, 0x2d00
  1038f6:	0010                	.insn	2, 0x0010
  1038f8:	2d00                	.insn	2, 0x2d00
  1038fa:	0010                	.insn	2, 0x0010
  1038fc:	2d00                	.insn	2, 0x2d00
  1038fe:	0010                	.insn	2, 0x0010
  103900:	2d00                	.insn	2, 0x2d00
  103902:	0010                	.insn	2, 0x0010
  103904:	2d00                	.insn	2, 0x2d00
  103906:	0010                	.insn	2, 0x0010
  103908:	2d00                	.insn	2, 0x2d00
  10390a:	0010                	.insn	2, 0x0010
  10390c:	2d00                	.insn	2, 0x2d00
  10390e:	0010                	.insn	2, 0x0010
  103910:	2d00                	.insn	2, 0x2d00
  103912:	0010                	.insn	2, 0x0010
  103914:	2d00                	.insn	2, 0x2d00
  103916:	0010                	.insn	2, 0x0010
  103918:	2d00                	.insn	2, 0x2d00
  10391a:	0010                	.insn	2, 0x0010
  10391c:	2d00                	.insn	2, 0x2d00
  10391e:	0010                	.insn	2, 0x0010
  103920:	2d00                	.insn	2, 0x2d00
  103922:	0010                	.insn	2, 0x0010
  103924:	2d50                	.insn	2, 0x2d50
  103926:	0010                	.insn	2, 0x0010
  103928:	2d00                	.insn	2, 0x2d00
  10392a:	0010                	.insn	2, 0x0010
  10392c:	2d00                	.insn	2, 0x2d00
  10392e:	0010                	.insn	2, 0x0010
  103930:	2d00                	.insn	2, 0x2d00
  103932:	0010                	.insn	2, 0x0010
  103934:	2d00                	.insn	2, 0x2d00
  103936:	0010                	.insn	2, 0x0010
  103938:	2d00                	.insn	2, 0x2d00
  10393a:	0010                	.insn	2, 0x0010
  10393c:	2d00                	.insn	2, 0x2d00
  10393e:	0010                	.insn	2, 0x0010
  103940:	2d00                	.insn	2, 0x2d00
  103942:	0010                	.insn	2, 0x0010
  103944:	2d00                	.insn	2, 0x2d00
  103946:	0010                	.insn	2, 0x0010
  103948:	2d00                	.insn	2, 0x2d00
  10394a:	0010                	.insn	2, 0x0010
  10394c:	2d00                	.insn	2, 0x2d00
  10394e:	0010                	.insn	2, 0x0010
  103950:	2d00                	.insn	2, 0x2d00
  103952:	0010                	.insn	2, 0x0010
  103954:	2d00                	.insn	2, 0x2d00
  103956:	0010                	.insn	2, 0x0010
  103958:	2d00                	.insn	2, 0x2d00
  10395a:	0010                	.insn	2, 0x0010
  10395c:	2d00                	.insn	2, 0x2d00
  10395e:	0010                	.insn	2, 0x0010
  103960:	2d00                	.insn	2, 0x2d00
  103962:	0010                	.insn	2, 0x0010
  103964:	2d00                	.insn	2, 0x2d00
  103966:	0010                	.insn	2, 0x0010
  103968:	2d00                	.insn	2, 0x2d00
  10396a:	0010                	.insn	2, 0x0010
  10396c:	2d00                	.insn	2, 0x2d00
  10396e:	0010                	.insn	2, 0x0010
  103970:	2d00                	.insn	2, 0x2d00
  103972:	0010                	.insn	2, 0x0010
  103974:	2d00                	.insn	2, 0x2d00
  103976:	0010                	.insn	2, 0x0010
  103978:	2d00                	.insn	2, 0x2d00
  10397a:	0010                	.insn	2, 0x0010
  10397c:	2d00                	.insn	2, 0x2d00
  10397e:	0010                	.insn	2, 0x0010
  103980:	2d00                	.insn	2, 0x2d00
  103982:	0010                	.insn	2, 0x0010
  103984:	2d00                	.insn	2, 0x2d00
  103986:	0010                	.insn	2, 0x0010
  103988:	2d00                	.insn	2, 0x2d00
  10398a:	0010                	.insn	2, 0x0010
  10398c:	2d00                	.insn	2, 0x2d00
  10398e:	0010                	.insn	2, 0x0010
  103990:	2d00                	.insn	2, 0x2d00
  103992:	0010                	.insn	2, 0x0010
  103994:	2d00                	.insn	2, 0x2d00
  103996:	0010                	.insn	2, 0x0010
  103998:	2d00                	.insn	2, 0x2d00
  10399a:	0010                	.insn	2, 0x0010
  10399c:	2d00                	.insn	2, 0x2d00
  10399e:	0010                	.insn	2, 0x0010
  1039a0:	2d00                	.insn	2, 0x2d00
  1039a2:	0010                	.insn	2, 0x0010
  1039a4:	2d30                	.insn	2, 0x2d30
  1039a6:	0010                	.insn	2, 0x0010

セクション .riscv.attributes の逆アセンブル:

00000000 <.riscv.attributes>:
   0:	5641                	li	a2,-16
   2:	0000                	unimp
   4:	7200                	.insn	2, 0x7200
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <$d.10+0x14>
   c:	004c                	addi	a1,sp,4
   e:	0000                	unimp
  10:	1004                	addi	s1,sp,32
  12:	7205                	lui	tp,0xfffe1
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	li	t5,-20
  1c:	326d                	jal	fffff9c6 <_stack_top+0xffef3c06>
  1e:	3070                	.insn	2, 0x3070
  20:	615f 7032 5f31      	.insn	6, 0x5f317032615f
  26:	30703263          	.insn	4, 0x30703263
  2a:	7a5f 6369 7273      	.insn	6, 0x727363697a5f
  30:	7032                	.insn	2, 0x7032
  32:	5f30                	lw	a2,120(a4)
  34:	6d7a                	.insn	2, 0x6d7a
  36:	756d                	lui	a0,0xffffb
  38:	316c                	.insn	2, 0x316c
  3a:	3070                	.insn	2, 0x3070
  3c:	7a5f 6161 6f6d      	.insn	6, 0x6f6d61617a5f
  42:	7031                	c.lui	zero,0xfffec
  44:	5f30                	lw	a2,120(a4)
  46:	617a                	.insn	2, 0x617a
  48:	726c                	.insn	2, 0x726c
  4a:	70316373          	.insn	4, 0x70316373
  4e:	5f30                	lw	a2,120(a4)
  50:	637a                	.insn	2, 0x637a
  52:	3161                	jal	fffffcda <_stack_top+0xffef3f1a>
  54:	3070                	.insn	2, 0x3070
	...

セクション .debug_info の逆アセンブル:

00000000 <$d.5>:
       0:	009f 0000 0004      	.insn	6, 0x00040000009f
       6:	0000                	unimp
       8:	0000                	unimp
       a:	0104                	addi	s1,sp,128
       c:	0000                	unimp
       e:	0000                	unimp
      10:	0000                	unimp
      12:	0010                	.insn	2, 0x0010
      14:	0014                	.insn	2, 0x0014
      16:	0010                	.insn	2, 0x0010
      18:	2f2e                	.insn	2, 0x2f2e
      1a:	2f637273          	.insn	4, 0x2f637273
      1e:	6f62                	.insn	2, 0x6f62
      20:	6f6c746f          	jal	s0,c7716 <$d.7+0xc58ce>
      24:	6461                	lui	s0,0x18
      26:	7265                	lui	tp,0xffff9
      28:	655f 746e 7972      	.insn	6, 0x7972746e655f
      2e:	532e                	lw	t1,232(sp)
      30:	2f00                	.insn	2, 0x2f00
      32:	6f68                	.insn	2, 0x6f68
      34:	656d                	lui	a0,0x1b
      36:	7261682f          	.insn	4, 0x7261682f
      3a:	6875                	lui	a6,0x1d
      3c:	6b69                	lui	s6,0x1a
      3e:	72502f6f          	jal	t5,2f62 <$d.7+0x111a>
      42:	6172676f          	jal	a4,26e58 <$d.7+0x25010>
      46:	2f6d                	jal	800 <$d.6+0x18d>
      48:	5350                	lw	a2,36(a4)
      4a:	56525f43          	.insn	4, 0x56525f43
      4e:	2f493233          	.insn	4, 0x2f493233
      52:	5350                	lw	a2,36(a4)
      54:	4e4f2d43          	.insn	4, 0x4e4f2d43
      58:	2f45                	jal	808 <$d.6+0x195>
      5a:	74666f73          	.insn	4, 0x74666f73
      5e:	65726177          	.insn	4, 0x65726177
      62:	00736f2f          	.insn	4, 0x00736f2f
      66:	6255                	lui	tp,0x15
      68:	6e75                	lui	t3,0x1d
      6a:	7574                	.insn	2, 0x7574
      6c:	6320                	.insn	2, 0x6320
      6e:	616c                	.insn	2, 0x616c
      70:	676e                	.insn	2, 0x676e
      72:	7620                	.insn	2, 0x7620
      74:	7265                	lui	tp,0xffff9
      76:	6e6f6973          	.insn	4, 0x6e6f6973
      7a:	3120                	.insn	2, 0x3120
      7c:	2e38                	.insn	2, 0x2e38
      7e:	2e31                	jal	39a <$d.5+0x22>
      80:	31282033          	.insn	4, 0x31282033
      84:	6275                	lui	tp,0x1d
      86:	6e75                	lui	t3,0x1d
      88:	7574                	.insn	2, 0x7574
      8a:	2931                	jal	4a6 <$d.8+0xde>
      8c:	0100                	addi	s0,sp,128
      8e:	0280                	addi	s0,sp,320
      90:	72617473          	.insn	4, 0x72617473
      94:	0074                	addi	a3,sp,12
      96:	0001                	nop
      98:	0000                	unimp
      9a:	000a                	c.slli	zero,0x2
      9c:	0000                	unimp
      9e:	0000                	unimp
      a0:	0010                	.insn	2, 0x0010
	...

000000a3 <$d.4>:
      a3:	1188                	addi	a0,sp,224
      a5:	0000                	unimp
      a7:	0004                	.insn	2, 0x0004
      a9:	0021                	c.nop	8
      ab:	0000                	unimp
      ad:	0104                	addi	s1,sp,128
      af:	0282                	c.slli64	t0
      b1:	0000                	unimp
      b3:	001d                	c.nop	7
      b5:	011a                	slli	sp,sp,0x6
      b7:	0000                	unimp
      b9:	0054                	addi	a3,sp,4
      bb:	0000                	unimp
      bd:	0000046b          	.insn	4, 0x046b
      c1:	0014                	.insn	2, 0x0014
      c3:	0010                	.insn	2, 0x0010
      c5:	0ccc                	addi	a1,sp,596
      c7:	0000                	unimp
      c9:	3302                	.insn	2, 0x3302
      cb:	0000                	unimp
      cd:	0100                	addi	s0,sp,128
      cf:	05dd                	addi	a1,a1,23
      d1:	10369d03          	lh	s10,259(a3)
      d5:	0300                	addi	s0,sp,384
      d7:	0000003f 00004604 	.insn	8, 0x46040000003f
      df:	1800                	addi	s0,sp,48
      e1:	0500                	addi	s0,sp,640
      e3:	040d                	addi	s0,s0,3 # 18003 <$d.7+0x161bb>
      e5:	0000                	unimp
      e7:	0108                	addi	a0,sp,128
      e9:	8506                	mv	a0,ra
      eb:	0005                	c.nop	1
      ed:	0800                	addi	s0,sp,16
      ef:	005a0207          	.insn	4, 0x005a0207
      f3:	0000                	unimp
      f5:	e001                	bnez	s0,f5 <$d.4+0x52>
      f7:	0305                	addi	t1,t1,1 # ffffa001 <_stack_top+0xffeee241>
      f9:	35ba                	.insn	2, 0x35ba
      fb:	0010                	.insn	2, 0x0010
      fd:	00003f03          	.insn	4, 0x3f03
     101:	0400                	addi	s0,sp,512
     103:	0046                	c.slli	zero,0x11
     105:	0000                	unimp
     107:	0010                	.insn	2, 0x0010
     109:	7302                	.insn	2, 0x7302
     10b:	0000                	unimp
     10d:	0100                	addi	s0,sp,128
     10f:	05e5                	addi	a1,a1,25
     111:	10337603          	.insn	4, 0x10337603
     115:	0300                	addi	s0,sp,384
     117:	0000003f 00004604 	.insn	8, 0x46040000003f
     11f:	1400                	addi	s0,sp,544
     121:	0200                	addi	s0,sp,256
     123:	008c                	addi	a1,sp,64
     125:	0000                	unimp
     127:	e901                	bnez	a0,137 <$d.4+0x94>
     129:	0305                	addi	t1,t1,1
     12b:	3235                	jal	fffffa57 <_stack_top+0xffef3c97>
     12d:	0010                	.insn	2, 0x0010
     12f:	00003f03          	.insn	4, 0x3f03
     133:	0400                	addi	s0,sp,512
     135:	0046                	c.slli	zero,0x11
     137:	0000                	unimp
     139:	3302000b          	.insn	4, 0x3302000b
     13d:	0000                	unimp
     13f:	0100                	addi	s0,sp,128
     141:	05ea                	slli	a1,a1,0x1a
     143:	1030b703          	.insn	4, 0x1030b703
     147:	0200                	addi	s0,sp,256
     149:	00b2                	slli	ra,ra,0xc
     14b:	0000                	unimp
     14d:	ee01                	bnez	a2,165 <$d.4+0xc2>
     14f:	0305                	addi	t1,t1,1
     151:	3736                	.insn	2, 0x3736
     153:	0010                	.insn	2, 0x0010
     155:	00003f03          	.insn	4, 0x3f03
     159:	0400                	addi	s0,sp,512
     15b:	0046                	c.slli	zero,0x11
     15d:	0000                	unimp
     15f:	0009                	c.nop	2
     161:	cb02                	sw	zero,148(sp)
     163:	0000                	unimp
     165:	0100                	addi	s0,sp,128
     167:	040305ef          	jal	a1,301a7 <$d.7+0x2e35f>
     16b:	1031                	c.nop	-20
     16d:	0300                	addi	s0,sp,384
     16f:	0000003f 00004604 	.insn	8, 0x46040000003f
     177:	1600                	addi	s0,sp,800
     179:	0200                	addi	s0,sp,256
     17b:	00e4                	addi	s1,sp,76
     17d:	0000                	unimp
     17f:	f301                	bnez	a4,7f <$d.10+0x2b>
     181:	0305                	addi	t1,t1,1
     183:	36da                	.insn	2, 0x36da
     185:	0010                	.insn	2, 0x0010
     187:	00003f03          	.insn	4, 0x3f03
     18b:	0400                	addi	s0,sp,512
     18d:	0046                	c.slli	zero,0x11
     18f:	0000                	unimp
     191:	000e                	c.slli	zero,0x3
     193:	fd02                	.insn	2, 0xfd02
     195:	0000                	unimp
     197:	0100                	addi	s0,sp,128
     199:	05f5                	addi	a1,a1,29
     19b:	1034e903          	.insn	4, 0x1034e903
     19f:	0300                	addi	s0,sp,384
     1a1:	0000003f 00004604 	.insn	8, 0x46040000003f
     1a9:	0200                	addi	s0,sp,256
     1ab:	0200                	addi	s0,sp,256
     1ad:	0116                	slli	sp,sp,0x5
     1af:	0000                	unimp
     1b1:	f701                	bnez	a4,b9 <$d.4+0x16>
     1b3:	0305                	addi	t1,t1,1
     1b5:	338a                	.insn	2, 0x338a
     1b7:	0010                	.insn	2, 0x0010
     1b9:	00003f03          	.insn	4, 0x3f03
     1bd:	0400                	addi	s0,sp,512
     1bf:	0046                	c.slli	zero,0x11
     1c1:	0000                	unimp
     1c3:	000c                	.insn	2, 0x000c
     1c5:	b202                	.insn	2, 0xb202
     1c7:	0000                	unimp
     1c9:	0100                	addi	s0,sp,128
     1cb:	170305fb          	.insn	4, 0x170305fb
     1cf:	1032                	c.slli	zero,0x2c
     1d1:	0200                	addi	s0,sp,256
     1d3:	008c                	addi	a1,sp,64
     1d5:	0000                	unimp
     1d7:	ff01                	bnez	a4,ef <$d.4+0x4c>
     1d9:	0305                	addi	t1,t1,1
     1db:	3526                	.insn	2, 0x3526
     1dd:	0010                	.insn	2, 0x0010
     1df:	00008c07          	.insn	4, 0x8c07
     1e3:	0100                	addi	s0,sp,128
     1e5:	03050103          	lb	sp,48(a0) # 1b030 <$d.7+0x191e8>
     1e9:	3240                	.insn	2, 0x3240
     1eb:	0010                	.insn	2, 0x0010
     1ed:	00008c07          	.insn	4, 0x8c07
     1f1:	0100                	addi	s0,sp,128
     1f3:	03050107          	.insn	4, 0x03050107
     1f7:	0010302b          	.insn	4, 0x0010302b
     1fb:	0000b207          	.insn	4, 0xb207
     1ff:	0100                	addi	s0,sp,128
     201:	0305010b          	.insn	4, 0x0305010b
     205:	3531                	jal	11 <$d.5+0x11>
     207:	0010                	.insn	2, 0x0010
     209:	7302                	.insn	2, 0x7302
     20b:	0001                	nop
     20d:	0100                	addi	s0,sp,128
     20f:	3b030577          	.insn	4, 0x3b030577
     213:	1034                	addi	a3,sp,40
     215:	0300                	addi	s0,sp,384
     217:	0000003f 00004604 	.insn	8, 0x46040000003f
     21f:	0f00                	addi	s0,sp,912
     221:	0200                	addi	s0,sp,256
     223:	018c                	addi	a1,sp,192
     225:	0000                	unimp
     227:	8001                	c.srli64	s0
     229:	0305                	addi	t1,t1,1
     22b:	0010373f 00003f03 	.insn	8, 0x3f030010373f
     233:	0400                	addi	s0,sp,512
     235:	0046                	c.slli	zero,0x11
     237:	0000                	unimp
     239:	0011                	c.nop	4
     23b:	a502                	.insn	2, 0xa502
     23d:	0001                	nop
     23f:	0100                	addi	s0,sp,128
     241:	059c                	addi	a5,sp,704
     243:	1033fd03          	.insn	4, 0x1033fd03
     247:	0300                	addi	s0,sp,384
     249:	0000003f 00004604 	.insn	8, 0x46040000003f
     251:	1500                	addi	s0,sp,672
     253:	0200                	addi	s0,sp,256
     255:	00000033          	add	zero,zero,zero
     259:	ac01                	j	469 <$d.8+0xa1>
     25b:	0305                	addi	t1,t1,1
     25d:	00103487          	.insn	4, 0x00103487
     261:	1602                	slli	a2,a2,0x20
     263:	0001                	nop
     265:	0100                	addi	s0,sp,128
     267:	ca0305bf 08001035 	.insn	8, 0x08001035ca0305bf
     26f:	01d2                	slli	gp,gp,0x14
     271:	0000                	unimp
     273:	c101                	beqz	a0,273 <$d.3+0x1a>
     275:	00003f03          	.insn	4, 0x3f03
     279:	0400                	addi	s0,sp,512
     27b:	0046                	c.slli	zero,0x11
     27d:	0000                	unimp
     27f:	0005                	c.nop	1
     281:	d208                	sw	a0,32(a2)
     283:	0001                	nop
     285:	0100                	addi	s0,sp,128
     287:	005a02c3          	.insn	4, 0x005a02c3
     28b:	0000                	unimp
     28d:	cb01                	beqz	a4,29d <$d.6+0x1b>
     28f:	0305                	addi	t1,t1,1
     291:	311a                	.insn	2, 0x311a
     293:	0010                	.insn	2, 0x0010
     295:	fd09                	bnez	a0,1af <$d.9+0x3b>
     297:	0001                	nop
     299:	1300                	addi	s0,sp,416
     29b:	02000003          	lb	zero,32(zero) # 20 <$d.5+0x20>
     29f:	0509                	addi	a0,a0,2
     2a1:	0526                	slli	a0,a0,0x9
     2a3:	0000                	unimp
     2a5:	0f090407          	.insn	4, 0x0f090407
     2a9:	0002                	c.slli64	zero
     2ab:	b600                	.insn	2, 0xb600
     2ad:	0005                	c.nop	1
     2af:	0200                	addi	s0,sp,256
     2b1:	03680507          	.insn	4, 0x03680507
     2b5:	0000                	unimp
     2b7:	0108                	addi	a0,sp,128
     2b9:	1b0a                	slli	s6,s6,0x22
     2bb:	0002                	c.slli64	zero
     2bd:	0b00                	addi	s0,sp,400
     2bf:	01f2                	slli	gp,gp,0x1c
     2c1:	0000                	unimp
     2c3:	2b09                	jal	7d5 <$d.6+0x162>
     2c5:	0002                	c.slli64	zero
     2c7:	8a00                	.insn	2, 0x8a00
     2c9:	0000                	unimp
     2cb:	0200                	addi	s0,sp,256
     2cd:	0508                	addi	a0,sp,640
     2cf:	0000                	unimp
     2d1:	0000                	unimp
     2d3:	370a0207          	.insn	4, 0x370a0207
     2d7:	0002                	c.slli64	zero
     2d9:	0c00                	addi	s0,sp,528
     2db:	310d                	jal	fffffefd <_stack_top+0xffef413d>
     2dd:	0001                	nop
     2df:	0200                	addi	s0,sp,256
     2e1:	f220                	.insn	2, 0xf220
     2e3:	0001                	nop
     2e5:	0100                	addi	s0,sp,128
     2e7:	a40e                	.insn	2, 0xa40e
     2e9:	0000                	unimp
     2eb:	0200                	addi	s0,sp,256
     2ed:	f220                	.insn	2, 0xf220
     2ef:	0001                	nop
     2f1:	0000                	unimp
     2f3:	00031c0f          	.insn	4, 0x00031c0f
     2f7:	0200                	addi	s0,sp,256
     2f9:	011d                	addi	sp,sp,7
     2fb:	a40e                	.insn	2, 0xa40e
     2fd:	0000                	unimp
     2ff:	0200                	addi	s0,sp,256
     301:	f21d                	bnez	a2,227 <$d.5+0x7>
     303:	0001                	nop
     305:	0e00                	addi	s0,sp,784
     307:	0182                	c.slli64	gp
     309:	0000                	unimp
     30b:	1d02                	slli	s10,s10,0x20
     30d:	01f2                	slli	gp,gp,0x1c
     30f:	0000                	unimp
     311:	1000                	addi	s0,sp,32
     313:	0014                	.insn	2, 0x0014
     315:	0010                	.insn	2, 0x0010
     317:	0020                	addi	s0,sp,8
     319:	0000                	unimp
     31b:	5201                	li	tp,-32
     31d:	000002c3          	.insn	4, 0x02c3
     321:	0111                	addi	sp,sp,4
     323:	cb5a                	sw	s6,148(sp)
     325:	0002                	c.slli64	zero
     327:	1200                	addi	s0,sp,288
     329:	0238                	addi	a4,sp,264
     32b:	0000                	unimp
     32d:	0018                	.insn	2, 0x0018
     32f:	0010                	.insn	2, 0x0010
     331:	0004                	.insn	2, 0x0004
     333:	0000                	unimp
     335:	2d01                	jal	945 <$d.6+0x2d2>
     337:	130c                	addi	a1,sp,416
     339:	8088                	.insn	2, 0x8088
     33b:	8080                	.insn	2, 0x8080
     33d:	4401                	li	s0,0
     33f:	0002                	c.slli64	zero
     341:	0000                	unimp
     343:	5012                	.insn	2, 0x5012
     345:	0002                	c.slli64	zero
     347:	2c00                	.insn	2, 0x2c00
     349:	1000                	addi	s0,sp,32
     34b:	0400                	addi	s0,sp,512
     34d:	0000                	unimp
     34f:	0100                	addi	s0,sp,128
     351:	0531                	addi	a0,a0,12
     353:	80808013          	addi	zero,ra,-2040
     357:	0180                	addi	s0,sp,192
     359:	0258                	addi	a4,sp,260
     35b:	0000                	unimp
     35d:	0111                	addi	sp,sp,4
     35f:	635a                	.insn	2, 0x635a
     361:	0002                	c.slli64	zero
     363:	0000                	unimp
     365:	1400                	addi	s0,sp,544
     367:	000006ef          	jal	a3,367 <$d.6+0xe5>
     36b:	2b01                	jal	87b <$d.6+0x208>
     36d:	0e01                	addi	t3,t3,0 # 1d000 <$d.7+0x1b1b8>
     36f:	000006f7          	.insn	4, 0x06f7
     373:	2b01                	jal	883 <$d.6+0x210>
     375:	0000003f 00341500 	.insn	8, 0x003415000000003f
     37d:	0010                	.insn	2, 0x0010
     37f:	0020                	addi	s0,sp,8
     381:	0000                	unimp
     383:	5201                	li	tp,-32
     385:	01b8                	addi	a4,sp,200
     387:	0000                	unimp
     389:	3401                	jal	fffffd89 <_stack_top+0xffef3fc9>
     38b:	0116                	slli	sp,sp,0x5
     38d:	c55a                	sw	s6,136(sp)
     38f:	0001                	nop
     391:	0100                	addi	s0,sp,128
     393:	3f34                	.insn	2, 0x3f34
     395:	0000                	unimp
     397:	1200                	addi	s0,sp,288
     399:	000002c3          	.insn	4, 0x02c3
     39d:	0038                	addi	a4,sp,8
     39f:	0010                	.insn	2, 0x0010
     3a1:	0018                	.insn	2, 0x0018
     3a3:	0000                	unimp
     3a5:	3601                	jal	fffffea5 <_stack_top+0xffef40e5>
     3a7:	1105                	addi	sp,sp,-31
     3a9:	5a01                	li	s4,-32
     3ab:	000002cb          	.insn	4, 0x02cb
     3af:	3812                	.insn	2, 0x3812
     3b1:	0002                	c.slli64	zero
     3b3:	3800                	.insn	2, 0x3800
     3b5:	1000                	addi	s0,sp,32
     3b7:	0400                	addi	s0,sp,512
     3b9:	0000                	unimp
     3bb:	0100                	addi	s0,sp,128
     3bd:	0c2d                	addi	s8,s8,11 # 1a00b <$d.7+0x181c3>
     3bf:	80808813          	addi	a6,ra,-2040
     3c3:	0180                	addi	s0,sp,192
     3c5:	0244                	addi	s1,sp,260
     3c7:	0000                	unimp
     3c9:	1200                	addi	s0,sp,288
     3cb:	0250                	addi	a2,sp,260
     3cd:	0000                	unimp
     3cf:	004c                	addi	a1,sp,4
     3d1:	0010                	.insn	2, 0x0010
     3d3:	0004                	.insn	2, 0x0004
     3d5:	0000                	unimp
     3d7:	3101                	jal	ffffffd7 <_stack_top+0xffef4217>
     3d9:	1305                	addi	t1,t1,-31
     3db:	8080                	.insn	2, 0x8080
     3dd:	8080                	.insn	2, 0x8080
     3df:	5801                	li	a6,-32
     3e1:	0002                	c.slli64	zero
     3e3:	1100                	addi	s0,sp,160
     3e5:	5a01                	li	s4,-32
     3e7:	00000263          	beqz	zero,3eb <$d.8+0x23>
     3eb:	0000                	unimp
     3ed:	0f00                	addi	s0,sp,912
     3ef:	0175                	addi	sp,sp,29
     3f1:	0000                	unimp
     3f3:	3901                	jal	3 <$d.5+0x3>
     3f5:	0e01                	addi	t3,t3,0
     3f7:	000001eb          	.insn	4, 0x01eb
     3fb:	3901                	jal	b <$d.5+0xb>
     3fd:	035f 0000 0a00      	.insn	6, 0x0a000000035f
     403:	0364                	addi	s1,sp,396
     405:	0000                	unimp
     407:	00003f17          	auipc	t5,0x3
     40b:	0d00                	addi	s0,sp,656
     40d:	0555                	addi	a0,a0,21
     40f:	0000                	unimp
     411:	7001                	c.lui	zero,0xfffe0
     413:	0381                	addi	t2,t2,0
     415:	0000                	unimp
     417:	1801                	addi	a6,a6,-32 # 1cfe0 <$d.7+0x1b198>
     419:	00000533          	add	a0,zero,zero
     41d:	7201                	lui	tp,0xfffe0
     41f:	01f2                	slli	gp,gp,0x1c
     421:	0000                	unimp
     423:	0500                	addi	s0,sp,640
     425:	0412                	slli	s0,s0,0x4
     427:	0000                	unimp
     429:	0405                	addi	s0,s0,1
     42b:	00000f0f          	.insn	4, 0x0f0f
     42f:	0100                	addi	s0,sp,128
     431:	0148                	addi	a0,sp,132
     433:	d90e                	sw	gp,176(sp)
     435:	0000                	unimp
     437:	0100                	addi	s0,sp,128
     439:	fd48                	.insn	2, 0xfd48
     43b:	0001                	nop
     43d:	0000                	unimp
     43f:	3b19                	jal	155 <$d.4+0xb2>
     441:	0005                	c.nop	1
     443:	0100                	addi	s0,sp,128
     445:	a90f014f          	.insn	4, 0xa90f014f
     449:	0000                	unimp
     44b:	0100                	addi	s0,sp,128
     44d:	01d2                	slli	gp,gp,0x14
     44f:	a40e                	.insn	2, 0xa40e
     451:	0000                	unimp
     453:	0100                	addi	s0,sp,128
     455:	f2d2                	.insn	2, 0xf2d2
     457:	0001                	nop
     459:	1800                	addi	s0,sp,48
     45b:	0000061b          	.insn	4, 0x061b
     45f:	d401                	beqz	s0,367 <$d.6+0xe5>
     461:	0232                	slli	tp,tp,0xc
     463:	0000                	unimp
     465:	1500                	addi	s0,sp,672
     467:	0054                	addi	a3,sp,4
     469:	0010                	.insn	2, 0x0010
     46b:	03f8                	addi	a4,sp,460
     46d:	0000                	unimp
     46f:	5201                	li	tp,-32
     471:	01f1                	addi	gp,gp,28
     473:	0000                	unimp
     475:	d801                	beqz	s0,385 <$d.5+0xd>
     477:	021a                	slli	tp,tp,0x6
     479:	0c91                	addi	s9,s9,4
     47b:	0621                	addi	a2,a2,8
     47d:	0000                	unimp
     47f:	da01                	beqz	a2,38f <$d.5+0x17>
     481:	01f2                	slli	gp,gp,0x1c
     483:	0000                	unimp
     485:	021a                	slli	tp,tp,0x6
     487:	0891                	addi	a7,a7,4
     489:	000005db          	.insn	4, 0x05db
     48d:	db01                	beqz	a4,39d <$d.5+0x25>
     48f:	01f2                	slli	gp,gp,0x1c
     491:	0000                	unimp
     493:	4b12                	lw	s6,4(sp)
     495:	8c000003          	lb	zero,-1856(zero) # fffff8c0 <_stack_top+0xffef3b00>
     499:	1000                	addi	s0,sp,32
     49b:	2800                	.insn	2, 0x2800
     49d:	0000                	unimp
     49f:	0100                	addi	s0,sp,128
     4a1:	05dd                	addi	a1,a1,23
     4a3:	0000001b          	.insn	4, 0x001b
     4a7:	5300                	lw	s0,32(a4)
     4a9:	1c000003          	lb	zero,448(zero) # 1c0 <$d.9+0x4c>
     4ad:	000002c3          	.insn	4, 0x02c3
     4b1:	0000                	unimp
     4b3:	0000                	unimp
     4b5:	3c01                	jal	fffffec5 <_stack_top+0xffef4105>
     4b7:	1d09                	addi	s10,s10,-30 # 18fe2 <$d.7+0x1719a>
     4b9:	0238                	addi	a4,sp,264
     4bb:	0000                	unimp
     4bd:	0090                	addi	a2,sp,64
     4bf:	0010                	.insn	2, 0x0010
     4c1:	0004                	.insn	2, 0x0004
     4c3:	0000                	unimp
     4c5:	2d01                	jal	ad5 <$d.6+0x462>
     4c7:	120c                	addi	a1,sp,288
     4c9:	0250                	addi	a2,sp,260
     4cb:	0000                	unimp
     4cd:	00a8                	addi	a0,sp,72
     4cf:	0010                	.insn	2, 0x0010
     4d1:	0004                	.insn	2, 0x0004
     4d3:	0000                	unimp
     4d5:	3101                	jal	d5 <$d.4+0x32>
     4d7:	1305                	addi	t1,t1,-31
     4d9:	8080                	.insn	2, 0x8080
     4db:	8080                	.insn	2, 0x8080
     4dd:	5801                	li	a6,-32
     4df:	0002                	c.slli64	zero
     4e1:	1100                	addi	s0,sp,160
     4e3:	5c01                	li	s8,-32
     4e5:	00000263          	beqz	zero,4e9 <$d.3+0x2e>
     4e9:	0000                	unimp
     4eb:	1c00                	addi	s0,sp,560
     4ed:	0369                	addi	t1,t1,26
     4ef:	0000                	unimp
     4f1:	0018                	.insn	2, 0x0018
     4f3:	0000                	unimp
     4f5:	df01                	beqz	a4,40d <$d.8+0x45>
     4f7:	1e09                	addi	t3,t3,-30
     4f9:	0080                	addi	s0,sp,64
     4fb:	0000                	unimp
     4fd:	0375                	addi	t1,t1,29
     4ff:	0000                	unimp
     501:	8812                	mv	a6,tp
     503:	c4000003          	lb	zero,-960(zero) # fffffc40 <_stack_top+0xffef3e80>
     507:	1000                	addi	s0,sp,32
     509:	0c00                	addi	s0,sp,528
     50b:	0000                	unimp
     50d:	0100                	addi	s0,sp,128
     50f:	0575                	addi	a0,a0,29
     511:	0000131b          	.insn	4, 0x131b
     515:	9000                	.insn	2, 0x9000
     517:	00000003          	lb	zero,0(zero) # 0 <$d.5>
     51b:	4b12                	lw	s6,4(sp)
     51d:	e8000003          	lb	zero,-384(zero) # fffffe80 <_stack_top+0xffef40c0>
     521:	1000                	addi	s0,sp,32
     523:	2800                	.insn	2, 0x2800
     525:	0000                	unimp
     527:	0100                	addi	s0,sp,128
     529:	401b0577          	.insn	4, 0x401b0577
     52d:	0000                	unimp
     52f:	5300                	lw	s0,32(a4)
     531:	1c000003          	lb	zero,448(zero) # 1c0 <$d.9+0x4c>
     535:	000002c3          	.insn	4, 0x02c3
     539:	0030                	addi	a2,sp,8
     53b:	0000                	unimp
     53d:	3c01                	jal	ffffff4d <_stack_top+0xffef418d>
     53f:	1d09                	addi	s10,s10,-30
     541:	0238                	addi	a4,sp,264
     543:	0000                	unimp
     545:	00ec                	addi	a1,sp,76
     547:	0010                	.insn	2, 0x0010
     549:	0004                	.insn	2, 0x0004
     54b:	0000                	unimp
     54d:	2d01                	jal	b5d <$d.6+0x4ea>
     54f:	120c                	addi	a1,sp,288
     551:	0250                	addi	a2,sp,260
     553:	0000                	unimp
     555:	0104                	addi	s1,sp,128
     557:	0010                	.insn	2, 0x0010
     559:	0004                	.insn	2, 0x0004
     55b:	0000                	unimp
     55d:	3101                	jal	15d <$d.4+0xba>
     55f:	1305                	addi	t1,t1,-31
     561:	8080                	.insn	2, 0x8080
     563:	8080                	.insn	2, 0x8080
     565:	5801                	li	a6,-32
     567:	0002                	c.slli64	zero
     569:	1100                	addi	s0,sp,160
     56b:	5c01                	li	s8,-32
     56d:	00000263          	beqz	zero,571 <$d.3+0xb6>
     571:	0000                	unimp
     573:	1200                	addi	s0,sp,288
     575:	0388                	addi	a0,sp,448
     577:	0000                	unimp
     579:	0120                	addi	s0,sp,136
     57b:	0010                	.insn	2, 0x0010
     57d:	000c                	.insn	2, 0x000c
     57f:	0000                	unimp
     581:	7a01                	lui	s4,0xfffe0
     583:	1b05                	addi	s6,s6,-31 # 19fe1 <$d.7+0x18199>
     585:	00000053          	.insn	4, 0x0053
     589:	0390                	addi	a2,sp,448
     58b:	0000                	unimp
     58d:	1200                	addi	s0,sp,288
     58f:	0000034b          	.insn	4, 0x034b
     593:	0248                	addi	a0,sp,260
     595:	0010                	.insn	2, 0x0010
     597:	0028                	addi	a0,sp,8
     599:	0000                	unimp
     59b:	8001                	c.srli64	s0
     59d:	1b0d                	addi	s6,s6,-29
     59f:	0104                	addi	s1,sp,128
     5a1:	0000                	unimp
     5a3:	00000353          	.insn	4, 0x0353
     5a7:	c31c                	sw	a5,0(a4)
     5a9:	0002                	c.slli64	zero
     5ab:	4800                	lw	s0,16(s0)
     5ad:	0000                	unimp
     5af:	0100                	addi	s0,sp,128
     5b1:	093c                	addi	a5,sp,152
     5b3:	381d                	jal	fffffde9 <_stack_top+0xffef4029>
     5b5:	0002                	c.slli64	zero
     5b7:	4c00                	lw	s0,24(s0)
     5b9:	1002                	c.slli	zero,0x20
     5bb:	0400                	addi	s0,sp,512
     5bd:	0000                	unimp
     5bf:	0100                	addi	s0,sp,128
     5c1:	0c2d                	addi	s8,s8,11
     5c3:	5012                	.insn	2, 0x5012
     5c5:	0002                	c.slli64	zero
     5c7:	6400                	.insn	2, 0x6400
     5c9:	1002                	c.slli	zero,0x20
     5cb:	0400                	addi	s0,sp,512
     5cd:	0000                	unimp
     5cf:	0100                	addi	s0,sp,128
     5d1:	0531                	addi	a0,a0,12
     5d3:	80808013          	addi	zero,ra,-2040
     5d7:	0180                	addi	s0,sp,192
     5d9:	0258                	addi	a4,sp,260
     5db:	0000                	unimp
     5dd:	0111                	addi	sp,sp,4
     5df:	635c                	.insn	2, 0x635c
     5e1:	0002                	c.slli64	zero
     5e3:	0000                	unimp
     5e5:	0000                	unimp
     5e7:	9c1d                	.insn	2, 0x9c1d
     5e9:	4c000003          	lb	zero,1216(zero) # 4c0 <$d.3+0x5>
     5ed:	1001                	c.nop	-32
     5ef:	0400                	addi	s0,sp,512
     5f1:	0000                	unimp
     5f3:	0100                	addi	s0,sp,128
     5f5:	0984                	addi	s1,sp,208
     5f7:	8812                	mv	a6,tp
     5f9:	60000003          	lb	zero,1536(zero) # 600 <$d.3+0x145>
     5fd:	1001                	c.nop	-32
     5ff:	0c00                	addi	s0,sp,528
     601:	0000                	unimp
     603:	0100                	addi	s0,sp,128
     605:	b11b0587          	.insn	4, 0xb11b0587
     609:	0000                	unimp
     60b:	9000                	.insn	2, 0x9000
     60d:	00000003          	lb	zero,0(zero) # 0 <$d.5>
     611:	1200                	addi	s0,sp,288
     613:	0000034b          	.insn	4, 0x034b
     617:	028c                	addi	a1,sp,320
     619:	0010                	.insn	2, 0x0010
     61b:	0028                	addi	a0,sp,8
     61d:	0000                	unimp
     61f:	e001                	bnez	s0,61f <$d.3+0x164>
     621:	1b09                	addi	s6,s6,-30
     623:	00000117          	auipc	sp,0x0
     627:	00000353          	.insn	4, 0x0353
     62b:	c31c                	sw	a5,0(a4)
     62d:	0002                	c.slli64	zero
     62f:	6000                	.insn	2, 0x6000
     631:	0000                	unimp
     633:	0100                	addi	s0,sp,128
     635:	093c                	addi	a5,sp,152
     637:	381d                	jal	fffffe6d <_stack_top+0xffef40ad>
     639:	0002                	c.slli64	zero
     63b:	9000                	.insn	2, 0x9000
     63d:	1002                	c.slli	zero,0x20
     63f:	0400                	addi	s0,sp,512
     641:	0000                	unimp
     643:	0100                	addi	s0,sp,128
     645:	0c2d                	addi	s8,s8,11
     647:	5012                	.insn	2, 0x5012
     649:	0002                	c.slli64	zero
     64b:	a800                	.insn	2, 0xa800
     64d:	1002                	c.slli	zero,0x20
     64f:	0400                	addi	s0,sp,512
     651:	0000                	unimp
     653:	0100                	addi	s0,sp,128
     655:	0531                	addi	a0,a0,12
     657:	80808013          	addi	zero,ra,-2040
     65b:	0180                	addi	s0,sp,192
     65d:	0258                	addi	a4,sp,260
     65f:	0000                	unimp
     661:	0111                	addi	sp,sp,4 # 627 <$d.3+0x16c>
     663:	635c                	.insn	2, 0x635c
     665:	0002                	c.slli64	zero
     667:	0000                	unimp
     669:	0000                	unimp
     66b:	4b12                	lw	s6,4(sp)
     66d:	9c000003          	lb	zero,-1600(zero) # fffff9c0 <_stack_top+0xffef3c00>
     671:	1001                	c.nop	-32
     673:	2800                	.insn	2, 0x2800
     675:	0000                	unimp
     677:	0100                	addi	s0,sp,128
     679:	09e5                	addi	s3,s3,25
     67b:	0000de1b          	.insn	4, 0xde1b
     67f:	5300                	lw	s0,32(a4)
     681:	1c000003          	lb	zero,448(zero) # 1c0 <$d.9+0x4c>
     685:	000002c3          	.insn	4, 0x02c3
     689:	0078                	addi	a4,sp,12
     68b:	0000                	unimp
     68d:	3c01                	jal	9d <$d.9+0x1>
     68f:	1d09                	addi	s10,s10,-30
     691:	0238                	addi	a4,sp,264
     693:	0000                	unimp
     695:	01a0                	addi	s0,sp,200
     697:	0010                	.insn	2, 0x0010
     699:	0004                	.insn	2, 0x0004
     69b:	0000                	unimp
     69d:	2d01                	jal	cad <$d.6+0x63a>
     69f:	120c                	addi	a1,sp,288
     6a1:	0250                	addi	a2,sp,260
     6a3:	0000                	unimp
     6a5:	01b8                	addi	a4,sp,200
     6a7:	0010                	.insn	2, 0x0010
     6a9:	0004                	.insn	2, 0x0004
     6ab:	0000                	unimp
     6ad:	3101                	jal	2ad <$d.6+0x2b>
     6af:	1305                	addi	t1,t1,-31
     6b1:	8080                	.insn	2, 0x8080
     6b3:	8080                	.insn	2, 0x8080
     6b5:	5801                	li	a6,-32
     6b7:	0002                	c.slli64	zero
     6b9:	1100                	addi	s0,sp,160
     6bb:	5c01                	li	s8,-32
     6bd:	00000263          	beqz	zero,6c1 <$d.6+0x4e>
     6c1:	0000                	unimp
     6c3:	1200                	addi	s0,sp,288
     6c5:	0000034b          	.insn	4, 0x034b
     6c9:	0200                	addi	s0,sp,256
     6cb:	0010                	.insn	2, 0x0010
     6cd:	0028                	addi	a0,sp,8
     6cf:	0000                	unimp
     6d1:	ea01                	bnez	a2,6e1 <$d.6+0x6e>
     6d3:	1b09                	addi	s6,s6,-30
     6d5:	00f1                	addi	ra,ra,28
     6d7:	0000                	unimp
     6d9:	00000353          	.insn	4, 0x0353
     6dd:	c31c                	sw	a5,0(a4)
     6df:	0002                	c.slli64	zero
     6e1:	9000                	.insn	2, 0x9000
     6e3:	0000                	unimp
     6e5:	0100                	addi	s0,sp,128
     6e7:	093c                	addi	a5,sp,152
     6e9:	381d                	jal	ffffff1f <_stack_top+0xffef415f>
     6eb:	0002                	c.slli64	zero
     6ed:	0400                	addi	s0,sp,512
     6ef:	1002                	c.slli	zero,0x20
     6f1:	0400                	addi	s0,sp,512
     6f3:	0000                	unimp
     6f5:	0100                	addi	s0,sp,128
     6f7:	0c2d                	addi	s8,s8,11
     6f9:	5012                	.insn	2, 0x5012
     6fb:	0002                	c.slli64	zero
     6fd:	1c00                	addi	s0,sp,560
     6ff:	1002                	c.slli	zero,0x20
     701:	0400                	addi	s0,sp,512
     703:	0000                	unimp
     705:	0100                	addi	s0,sp,128
     707:	0531                	addi	a0,a0,12
     709:	80808013          	addi	zero,ra,-2040
     70d:	0180                	addi	s0,sp,192
     70f:	0258                	addi	a4,sp,260
     711:	0000                	unimp
     713:	0111                	addi	sp,sp,4
     715:	635c                	.insn	2, 0x635c
     717:	0002                	c.slli64	zero
     719:	0000                	unimp
     71b:	0000                	unimp
     71d:	4b12                	lw	s6,4(sp)
     71f:	f4000003          	lb	zero,-192(zero) # ffffff40 <_stack_top+0xffef4180>
     723:	1002                	c.slli	zero,0x20
     725:	2800                	.insn	2, 0x2800
     727:	0000                	unimp
     729:	0100                	addi	s0,sp,128
     72b:	2a1b09ef          	jal	s3,b11cb <$d.7+0xaf383>
     72f:	0001                	nop
     731:	5300                	lw	s0,32(a4)
     733:	1c000003          	lb	zero,448(zero) # 1c0 <$d.9+0x4c>
     737:	000002c3          	.insn	4, 0x02c3
     73b:	00a8                	addi	a0,sp,72
     73d:	0000                	unimp
     73f:	3c01                	jal	14f <$d.4+0xac>
     741:	1d09                	addi	s10,s10,-30
     743:	0238                	addi	a4,sp,264
     745:	0000                	unimp
     747:	02f8                	addi	a4,sp,332
     749:	0010                	.insn	2, 0x0010
     74b:	0004                	.insn	2, 0x0004
     74d:	0000                	unimp
     74f:	2d01                	jal	d5f <$d.6+0x6ec>
     751:	120c                	addi	a1,sp,288
     753:	0250                	addi	a2,sp,260
     755:	0000                	unimp
     757:	0310                	addi	a2,sp,384
     759:	0010                	.insn	2, 0x0010
     75b:	0004                	.insn	2, 0x0004
     75d:	0000                	unimp
     75f:	3101                	jal	35f <$d.6+0xdd>
     761:	1305                	addi	t1,t1,-31
     763:	8080                	.insn	2, 0x8080
     765:	8080                	.insn	2, 0x8080
     767:	5801                	li	a6,-32
     769:	0002                	c.slli64	zero
     76b:	1100                	addi	s0,sp,160
     76d:	5c01                	li	s8,-32
     76f:	00000263          	beqz	zero,773 <$d.6+0x100>
     773:	0000                	unimp
     775:	1f00                	addi	s0,sp,944
     777:	03a4                	addi	s1,sp,456
     779:	0000                	unimp
     77b:	0444                	addi	s1,sp,516
     77d:	0010                	.insn	2, 0x0010
     77f:	0004                	.insn	2, 0x0004
     781:	0000                	unimp
     783:	0f01                	addi	t5,t5,0 # 3407 <$d.7+0x15bf>
     785:	0501                	addi	a0,a0,0
     787:	80808013          	addi	zero,ra,-2040
     78b:	ac01                	j	99b <$d.6+0x328>
     78d:	20000003          	lb	zero,512(zero) # 200 <$d.12+0x30>
     791:	8080                	.insn	2, 0x8080
     793:	0180                	addi	s0,sp,192
     795:	000003b7          	lui	t2,0x0
     799:	2100                	.insn	2, 0x2100
     79b:	000007d7          	.insn	4, 0x07d7
     79f:	017c                	addi	a5,sp,140
     7a1:	0010                	.insn	2, 0x0010
     7a3:	2421                	jal	9ab <$d.6+0x338>
     7a5:	0008                	.insn	2, 0x0008
     7a7:	e000                	.insn	2, 0xe000
     7a9:	1001                	c.nop	-32
     7ab:	2100                	.insn	2, 0x2100
     7ad:	0824                	addi	s1,sp,24
     7af:	0000                	unimp
     7b1:	02d4                	addi	a3,sp,324
     7b3:	0010                	.insn	2, 0x0010
     7b5:	4421                	li	s0,8
     7b7:	0008                	.insn	2, 0x0008
     7b9:	3000                	.insn	2, 0x3000
     7bb:	21001003          	lh	zero,528(zero) # 210 <$d.12+0x40>
     7bf:	089a                	slli	a7,a7,0x6
     7c1:	0000                	unimp
     7c3:	033c                	addi	a5,sp,392
     7c5:	0010                	.insn	2, 0x0010
     7c7:	4421                	li	s0,8
     7c9:	0008                	.insn	2, 0x0008
     7cb:	5000                	lw	s0,32(s0)
     7cd:	21001003          	lh	zero,528(zero) # 210 <$d.12+0x40>
     7d1:	0844                	addi	s1,sp,20
     7d3:	0000                	unimp
     7d5:	0360                	addi	s0,sp,396
     7d7:	0010                	.insn	2, 0x0010
     7d9:	9a21                	andi	a2,a2,-24
     7db:	0008                	.insn	2, 0x0008
     7dd:	6c00                	.insn	2, 0x6c00
     7df:	21001003          	lh	zero,528(zero) # 210 <$d.12+0x40>
     7e3:	0844                	addi	s1,sp,20
     7e5:	0000                	unimp
     7e7:	0378                	addi	a4,sp,396
     7e9:	0010                	.insn	2, 0x0010
     7eb:	4421                	li	s0,8
     7ed:	0008                	.insn	2, 0x0008
     7ef:	8800                	.insn	2, 0x8800
     7f1:	21001003          	lh	zero,528(zero) # 210 <$d.12+0x40>
     7f5:	089a                	slli	a7,a7,0x6
     7f7:	0000                	unimp
     7f9:	0398                	addi	a4,sp,448
     7fb:	0010                	.insn	2, 0x0010
     7fd:	4421                	li	s0,8
     7ff:	0008                	.insn	2, 0x0008
     801:	a400                	.insn	2, 0xa400
     803:	21001003          	lh	zero,528(zero) # 210 <$d.12+0x40>
     807:	0844                	addi	s1,sp,20
     809:	0000                	unimp
     80b:	03b4                	addi	a3,sp,456
     80d:	0010                	.insn	2, 0x0010
     80f:	9a21                	andi	a2,a2,-24
     811:	0008                	.insn	2, 0x0008
     813:	c000                	sw	s0,0(s0)
     815:	21001003          	lh	zero,528(zero) # 210 <$d.12+0x40>
     819:	0844                	addi	s1,sp,20
     81b:	0000                	unimp
     81d:	03cc                	addi	a1,sp,452
     81f:	0010                	.insn	2, 0x0010
     821:	4421                	li	s0,8
     823:	0008                	.insn	2, 0x0008
     825:	dc00                	sw	s0,56(s0)
     827:	21001003          	lh	zero,528(zero) # 210 <$d.12+0x40>
     82b:	089a                	slli	a7,a7,0x6
     82d:	0000                	unimp
     82f:	03e8                	addi	a0,sp,460
     831:	0010                	.insn	2, 0x0010
     833:	4421                	li	s0,8
     835:	0008                	.insn	2, 0x0008
     837:	f400                	.insn	2, 0xf400
     839:	21001003          	lh	zero,528(zero) # 210 <$d.12+0x40>
     83d:	0844                	addi	s1,sp,20
     83f:	0000                	unimp
     841:	0404                	addi	s1,sp,512
     843:	0010                	.insn	2, 0x0010
     845:	9a21                	andi	a2,a2,-24
     847:	0008                	.insn	2, 0x0008
     849:	1000                	addi	s0,sp,32
     84b:	1004                	addi	s1,sp,32
     84d:	2100                	.insn	2, 0x2100
     84f:	0844                	addi	s1,sp,20
     851:	0000                	unimp
     853:	041c                	addi	a5,sp,512
     855:	0010                	.insn	2, 0x0010
     857:	4421                	li	s0,8
     859:	0008                	.insn	2, 0x0008
     85b:	2c00                	.insn	2, 0x2c00
     85d:	1004                	addi	s1,sp,32
     85f:	2100                	.insn	2, 0x2100
     861:	089a                	slli	a7,a7,0x6
     863:	0000                	unimp
     865:	0438                	addi	a4,sp,520
     867:	0010                	.insn	2, 0x0010
     869:	4421                	li	s0,8
     86b:	0008                	.insn	2, 0x0008
     86d:	4400                	lw	s0,8(s0)
     86f:	1004                	addi	s1,sp,32
     871:	2200                	.insn	2, 0x2200
     873:	6201                	.insn	2, 0x6201
     875:	0448                	addi	a0,sp,516
     877:	0010                	.insn	2, 0x0010
     879:	2300                	.insn	2, 0x2300
     87b:	0229                	addi	tp,tp,10 # fffe000a <_stack_top+0xffed424a>
     87d:	0000                	unimp
     87f:	03811903          	lh	s2,56(sp)
     883:	0000                	unimp
     885:	e824                	.insn	2, 0xe824
     887:	00000007          	.insn	4, 0x0007
     88b:	f309                	bnez	a4,78d <$d.6+0x11a>
     88d:	db000007          	.insn	4, 0xdb000007
     891:	0000                	unimp
     893:	0300                	addi	s0,sp,384
     895:	0a14                	addi	a3,sp,272
     897:	07f8                	addi	a4,sp,972
     899:	0000                	unimp
     89b:	8125                	srli	a0,a0,0x9
     89d:	24000003          	lb	zero,576(zero) # 240 <$d.5+0x20>
     8a1:	0808                	addi	a0,sp,16
     8a3:	0000                	unimp
     8a5:	1324                	addi	s1,sp,424
     8a7:	0008                	.insn	2, 0x0008
     8a9:	0000                	unimp
     8ab:	fd09                	bnez	a0,7c5 <$d.6+0x152>
     8ad:	0001                	nop
     8af:	1300                	addi	s0,sp,416
     8b1:	04000003          	lb	zero,64(zero) # 40 <$d.3+0x1f>
     8b5:	0ac6                	slli	s5,s5,0x11
     8b7:	0818                	addi	a4,sp,16
     8b9:	0000                	unimp
     8bb:	0f26                	slli	t5,t5,0x9
     8bd:	0002                	c.slli64	zero
     8bf:	b600                	.insn	2, 0xb600
     8c1:	0005                	c.nop	1
     8c3:	0400                	addi	s0,sp,512
     8c5:	010a                	slli	sp,sp,0x2
     8c7:	0002e323          	.insn	4, 0x0002e323
     8cb:	0300                	addi	s0,sp,384
     8cd:	8131                	srli	a0,a0,0xc
     8cf:	24000003          	lb	zero,576(zero) # 240 <$d.5+0x20>
     8d3:	035f 0000 0824      	.insn	6, 0x08240000035f
     8d9:	0008                	.insn	2, 0x0008
     8db:	2400                	.insn	2, 0x2400
     8dd:	0000083f 08080a00 	.insn	8, 0x08080a000000083f
     8e5:	0000                	unimp
     8e7:	4c10                	lw	a2,24(s0)
     8e9:	1004                	addi	s1,sp,32
     8eb:	3800                	.insn	2, 0x3800
     8ed:	0000                	unimp
     8ef:	0100                	addi	s0,sp,128
     8f1:	4b52                	lw	s6,20(sp)
     8f3:	11000003          	lb	zero,272(zero) # 110 <$d.4+0x6d>
     8f7:	5a01                	li	s4,-32
     8f9:	00000353          	.insn	4, 0x0353
     8fd:	c31c                	sw	a5,0(a4)
     8ff:	0002                	c.slli64	zero
     901:	c000                	sw	s0,0(s0)
     903:	0000                	unimp
     905:	0100                	addi	s0,sp,128
     907:	093c                	addi	a5,sp,152
     909:	381d                	jal	13f <$d.4+0x9c>
     90b:	0002                	c.slli64	zero
     90d:	6000                	.insn	2, 0x6000
     90f:	1004                	addi	s1,sp,32
     911:	0400                	addi	s0,sp,512
     913:	0000                	unimp
     915:	0100                	addi	s0,sp,128
     917:	0c2d                	addi	s8,s8,11
     919:	5012                	.insn	2, 0x5012
     91b:	0002                	c.slli64	zero
     91d:	7400                	.insn	2, 0x7400
     91f:	1004                	addi	s1,sp,32
     921:	0400                	addi	s0,sp,512
     923:	0000                	unimp
     925:	0100                	addi	s0,sp,128
     927:	0531                	addi	a0,a0,12
     929:	80808013          	addi	zero,ra,-2040
     92d:	0180                	addi	s0,sp,192
     92f:	0258                	addi	a4,sp,260
     931:	0000                	unimp
     933:	0111                	addi	sp,sp,4
     935:	0002635b          	.insn	4, 0x0002635b
     939:	0000                	unimp
     93b:	0000                	unimp
     93d:	9010                	.insn	2, 0x9010
     93f:	100c                	addi	a1,sp,32
     941:	5000                	lw	s0,32(s0)
     943:	0000                	unimp
     945:	0100                	addi	s0,sp,128
     947:	8f52                	mv	t5,s4
     949:	0009                	c.nop	2
     94b:	1100                	addi	s0,sp,160
     94d:	5a01                	li	s4,-32
     94f:	00000997          	auipc	s3,0x0
     953:	100ca027          	.insn	4, 0x100ca027
     957:	3c00                	.insn	2, 0x3c00
     959:	0000                	unimp
     95b:	1e00                	addi	s0,sp,816
     95d:	0d52                	slli	s10,s10,0x14
     95f:	0000                	unimp
     961:	000009a3          	sb	zero,19(zero) # 13 <$d.5+0x13>
     965:	100ca027          	.insn	4, 0x100ca027
     969:	3400                	.insn	2, 0x3400
     96b:	0000                	unimp
     96d:	1e00                	addi	s0,sp,816
     96f:	0d70                	addi	a2,sp,668
     971:	0000                	unimp
     973:	000009af          	.insn	4, 0x09af
     977:	c312                	sw	tp,132(sp)
     979:	0002                	c.slli64	zero
     97b:	c000                	sw	s0,0(s0)
     97d:	100c                	addi	a1,sp,32
     97f:	1400                	addi	s0,sp,544
     981:	0000                	unimp
     983:	0100                	addi	s0,sp,128
     985:	0944                	addi	s1,sp,148
     987:	381d                	jal	1bd <$d.9+0x49>
     989:	0002                	c.slli64	zero
     98b:	c400                	sw	s0,8(s0)
     98d:	100c                	addi	a1,sp,32
     98f:	0400                	addi	s0,sp,512
     991:	0000                	unimp
     993:	0100                	addi	s0,sp,128
     995:	0c2d                	addi	s8,s8,11
     997:	5012                	.insn	2, 0x5012
     999:	0002                	c.slli64	zero
     99b:	d000                	sw	s0,32(s0)
     99d:	100c                	addi	a1,sp,32
     99f:	0400                	addi	s0,sp,512
     9a1:	0000                	unimp
     9a3:	0100                	addi	s0,sp,128
     9a5:	0531                	addi	a0,a0,12
     9a7:	80808013          	addi	zero,ra,-2040
     9ab:	0180                	addi	s0,sp,192
     9ad:	0258                	addi	a4,sp,260
     9af:	0000                	unimp
     9b1:	0111                	addi	sp,sp,4
     9b3:	635e                	.insn	2, 0x635e
     9b5:	0002                	c.slli64	zero
     9b7:	0000                	unimp
     9b9:	0000                	unimp
     9bb:	0000                	unimp
     9bd:	840d                	srai	s0,s0,0x3
     9bf:	0001                	nop
     9c1:	0100                	addi	s0,sp,128
     9c3:	2054                	.insn	2, 0x2054
     9c5:	0002                	c.slli64	zero
     9c7:	0100                	addi	s0,sp,128
     9c9:	7e0e                	.insn	2, 0x7e0e
     9cb:	0001                	nop
     9cd:	0100                	addi	s0,sp,128
     9cf:	5754                	lw	a3,44(a4)
     9d1:	0009                	c.nop	2
     9d3:	1800                	addi	s0,sp,48
     9d5:	01ed                	addi	gp,gp,27
     9d7:	0000                	unimp
     9d9:	5601                	li	a2,-32
     9db:	0220                	addi	s0,sp,264
     9dd:	0000                	unimp
     9df:	1828                	addi	a0,sp,56
     9e1:	0029                	c.nop	10
     9e3:	0000                	unimp
     9e5:	5801                	li	a6,-32
     9e7:	0381                	addi	t2,t2,0 # 0 <$d.5>
     9e9:	0000                	unimp
     9eb:	1828                	addi	a0,sp,56
     9ed:	000006bf 03815b01 	.insn	8, 0x03815b01000006bf
     9f5:	0000                	unimp
     9f7:	0000                	unimp
     9f9:	0a00                	addi	s0,sp,272
     9fb:	095c                	addi	a5,sp,148
     9fd:	0000                	unimp
     9ff:	00020417          	auipc	s0,0x20
     a03:	0d00                	addi	s0,sp,656
     a05:	00b8                	addi	a4,sp,72
     a07:	0000                	unimp
     a09:	6601                	.insn	2, 0x6601
     a0b:	0220                	addi	s0,sp,264
     a0d:	0000                	unimp
     a0f:	1801                	addi	a6,a6,-32
     a11:	04da                	slli	s1,s1,0x16
     a13:	0000                	unimp
     a15:	6a01                	.insn	2, 0x6a01
     a17:	0204                	addi	s1,sp,256
     a19:	0000                	unimp
     a1b:	9918                	.insn	2, 0x9918
     a1d:	0005                	c.nop	1
     a1f:	0100                	addi	s0,sp,128
     a21:	f268                	.insn	2, 0xf268
     a23:	0001                	nop
     a25:	1800                	addi	s0,sp,48
     a27:	01b0                	addi	a2,sp,200
     a29:	0000                	unimp
     a2b:	6b01                	.insn	2, 0x6b01
     a2d:	0204                	addi	s1,sp,256
     a2f:	0000                	unimp
     a31:	0f00                	addi	s0,sp,912
     a33:	013a                	slli	sp,sp,0xe
     a35:	0000                	unimp
     a37:	4001                	c.li	zero,0
     a39:	0e01                	addi	t3,t3,0
     a3b:	0182                	c.slli64	gp
     a3d:	0000                	unimp
     a3f:	4001                	c.li	zero,0
     a41:	01f2                	slli	gp,gp,0x1c
     a43:	0000                	unimp
     a45:	1828                	addi	a0,sp,56
     a47:	0029                	c.nop	10
     a49:	0000                	unimp
     a4b:	4201                	li	tp,0
     a4d:	0381                	addi	t2,t2,0
     a4f:	0000                	unimp
     a51:	1828                	addi	a0,sp,56
     a53:	00d9                	addi	ra,ra,22
     a55:	0000                	unimp
     a57:	4301                	li	t1,0
     a59:	0204                	addi	s1,sp,256
     a5b:	0000                	unimp
     a5d:	0000                	unimp
     a5f:	2900                	.insn	2, 0x2900
     a61:	0484                	addi	s1,sp,576
     a63:	0010                	.insn	2, 0x0010
     a65:	080c                	addi	a1,sp,16
     a67:	0000                	unimp
     a69:	5201                	li	tp,-32
     a6b:	023a                	slli	tp,tp,0xe
     a6d:	0000                	unimp
     a6f:	8b01                	andi	a4,a4,0
     a71:	0381                	addi	t2,t2,0
     a73:	0000                	unimp
     a75:	3d2a                	.insn	2, 0x3d2a
     a77:	0001                	nop
     a79:	4700                	lw	s0,8(a4)
     a7b:	0001                	nop
     a7d:	0100                	addi	s0,sp,128
     a7f:	0001f28b          	.insn	4, 0x0001f28b
     a83:	2a00                	.insn	2, 0x2a00
     a85:	0171                	addi	sp,sp,28
     a87:	0000                	unimp
     a89:	0000002b          	.insn	4, 0x002b
     a8d:	8b01                	andi	a4,a4,0
     a8f:	1186                	slli	gp,gp,0x21
     a91:	0000                	unimp
     a93:	0006cf2b          	.insn	4, 0x0006cf2b
     a97:	3300                	.insn	2, 0x3300
     a99:	0005                	c.nop	1
     a9b:	0100                	addi	s0,sp,128
     a9d:	f28d                	bnez	a3,9bf <$d.6+0x34c>
     a9f:	0001                	nop
     aa1:	2c00                	.insn	2, 0x2c00
     aa3:	00d8                	addi	a4,sp,68
     aa5:	0000                	unimp
     aa7:	0001a52b          	.insn	4, 0x0001a52b
     aab:	6700                	.insn	2, 0x6700
     aad:	0005                	c.nop	1
     aaf:	0100                	addi	s0,sp,128
     ab1:	0001f28f          	.insn	4, 0x0001f28f
     ab5:	1200                	addi	s0,sp,288
     ab7:	0388                	addi	a0,sp,448
     ab9:	0000                	unimp
     abb:	0510                	addi	a2,sp,640
     abd:	0010                	.insn	2, 0x0010
     abf:	00c8                	addi	a0,sp,68
     ac1:	0000                	unimp
     ac3:	9101                	srli	a0,a0,0x20
     ac5:	1b09                	addi	s6,s6,-30
     ac7:	000001cf          	.insn	4, 0x01cf
     acb:	0390                	addi	a2,sp,448
     acd:	0000                	unimp
     acf:	1200                	addi	s0,sp,288
     ad1:	0388                	addi	a0,sp,448
     ad3:	0000                	unimp
     ad5:	05e0                	addi	s0,sp,716
     ad7:	0010                	.insn	2, 0x0010
     ad9:	00c8                	addi	a0,sp,68
     adb:	0000                	unimp
     add:	9601                	srai	a2,a2,0x20
     adf:	1b09                	addi	s6,s6,-30
     ae1:	0000044f          	.insn	4, 0x044f
     ae5:	0390                	addi	a2,sp,448
     ae7:	0000                	unimp
     ae9:	1200                	addi	s0,sp,288
     aeb:	0000034b          	.insn	4, 0x034b
     aef:	0bb4                	addi	a3,sp,472
     af1:	0010                	.insn	2, 0x0010
     af3:	0028                	addi	a0,sp,8
     af5:	0000                	unimp
     af7:	9c01                	.insn	2, 0x9c01
     af9:	1b11                	addi	s6,s6,-28
     afb:	00000d03          	lb	s10,0(zero) # 0 <$d.5>
     aff:	00000353          	.insn	4, 0x0353
     b03:	c31c                	sw	a5,0(a4)
     b05:	0002                	c.slli64	zero
     b07:	f000                	.insn	2, 0xf000
     b09:	0000                	unimp
     b0b:	0100                	addi	s0,sp,128
     b0d:	093c                	addi	a5,sp,152
     b0f:	381d                	jal	345 <$d.6+0xc3>
     b11:	0002                	c.slli64	zero
     b13:	b800                	.insn	2, 0xb800
     b15:	0400100b          	.insn	4, 0x0400100b
     b19:	0000                	unimp
     b1b:	0100                	addi	s0,sp,128
     b1d:	0c2d                	addi	s8,s8,11
     b1f:	5012                	.insn	2, 0x5012
     b21:	0002                	c.slli64	zero
     b23:	d000                	sw	s0,32(s0)
     b25:	0400100b          	.insn	4, 0x0400100b
     b29:	0000                	unimp
     b2b:	0100                	addi	s0,sp,128
     b2d:	0531                	addi	a0,a0,12
     b2f:	80808013          	addi	zero,ra,-2040
     b33:	0180                	addi	s0,sp,192
     b35:	0258                	addi	a4,sp,260
     b37:	0000                	unimp
     b39:	0111                	addi	sp,sp,4
     b3b:	635d                	lui	t1,0x17
     b3d:	0002                	c.slli64	zero
     b3f:	0000                	unimp
     b41:	0000                	unimp
     b43:	8f12                	mv	t5,tp
     b45:	0009                	c.nop	2
     b47:	ec00                	.insn	2, 0xec00
     b49:	3c00100b          	.insn	4, 0x3c00100b
     b4d:	0000                	unimp
     b4f:	0100                	addi	s0,sp,128
     b51:	119d                	addi	gp,gp,-25
     b53:	100bec27          	.insn	4, 0x100bec27
     b57:	3c00                	.insn	2, 0x3c00
     b59:	0000                	unimp
     b5b:	1e00                	addi	s0,sp,816
     b5d:	0d16                	slli	s10,s10,0x5
     b5f:	0000                	unimp
     b61:	000009a3          	sb	zero,19(zero) # 13 <$d.5+0x13>
     b65:	100bec27          	.insn	4, 0x100bec27
     b69:	3400                	.insn	2, 0x3400
     b6b:	0000                	unimp
     b6d:	1e00                	addi	s0,sp,816
     b6f:	0d34                	addi	a3,sp,664
     b71:	0000                	unimp
     b73:	000009af          	.insn	4, 0x09af
     b77:	c312                	sw	tp,132(sp)
     b79:	0002                	c.slli64	zero
     b7b:	0c00                	addi	s0,sp,528
     b7d:	100c                	addi	a1,sp,32
     b7f:	1400                	addi	s0,sp,544
     b81:	0000                	unimp
     b83:	0100                	addi	s0,sp,128
     b85:	0944                	addi	s1,sp,148
     b87:	381d                	jal	3bd <$d.5+0x45>
     b89:	0002                	c.slli64	zero
     b8b:	1000                	addi	s0,sp,32
     b8d:	100c                	addi	a1,sp,32
     b8f:	0400                	addi	s0,sp,512
     b91:	0000                	unimp
     b93:	0100                	addi	s0,sp,128
     b95:	0c2d                	addi	s8,s8,11
     b97:	5012                	.insn	2, 0x5012
     b99:	0002                	c.slli64	zero
     b9b:	1c00                	addi	s0,sp,560
     b9d:	100c                	addi	a1,sp,32
     b9f:	0400                	addi	s0,sp,512
     ba1:	0000                	unimp
     ba3:	0100                	addi	s0,sp,128
     ba5:	0531                	addi	a0,a0,12
     ba7:	80808013          	addi	zero,ra,-2040
     bab:	0180                	addi	s0,sp,192
     bad:	0258                	addi	a4,sp,260
     baf:	0000                	unimp
     bb1:	0111                	addi	sp,sp,4
     bb3:	635e                	.insn	2, 0x635e
     bb5:	0002                	c.slli64	zero
     bb7:	0000                	unimp
     bb9:	0000                	unimp
     bbb:	0000                	unimp
     bbd:	4b12                	lw	s6,4(sp)
     bbf:	2c000003          	lb	zero,704(zero) # 2c0 <$d.6+0x3e>
     bc3:	100c                	addi	a1,sp,32
     bc5:	1400                	addi	s0,sp,544
     bc7:	0000                	unimp
     bc9:	0100                	addi	s0,sp,128
     bcb:	119e                	slli	gp,gp,0x27
     bcd:	c312                	sw	tp,132(sp)
     bcf:	0002                	c.slli64	zero
     bd1:	2c00                	.insn	2, 0x2c00
     bd3:	100c                	addi	a1,sp,32
     bd5:	1400                	addi	s0,sp,544
     bd7:	0000                	unimp
     bd9:	0100                	addi	s0,sp,128
     bdb:	093c                	addi	a5,sp,152
     bdd:	02cb0a13          	addi	s4,s6,44
     be1:	0000                	unimp
     be3:	3812                	.insn	2, 0x3812
     be5:	0002                	c.slli64	zero
     be7:	2c00                	.insn	2, 0x2c00
     be9:	100c                	addi	a1,sp,32
     beb:	0400                	addi	s0,sp,512
     bed:	0000                	unimp
     bef:	0100                	addi	s0,sp,128
     bf1:	0c2d                	addi	s8,s8,11
     bf3:	80808813          	addi	a6,ra,-2040
     bf7:	0180                	addi	s0,sp,192
     bf9:	0244                	addi	s1,sp,260
     bfb:	0000                	unimp
     bfd:	0000                	unimp
     bff:	1d00                	addi	s0,sp,688
     c01:	039c                	addi	a5,sp,448
     c03:	0000                	unimp
     c05:	06c0                	addi	s0,sp,836
     c07:	0010                	.insn	2, 0x0010
     c09:	0004                	.insn	2, 0x0004
     c0b:	0000                	unimp
     c0d:	a201                	j	d0d <$d.6+0x69a>
     c0f:	120d                	addi	tp,tp,-29 # ffffffe3 <_stack_top+0xffef4223>
     c11:	0388                	addi	a0,sp,448
     c13:	0000                	unimp
     c15:	06d4                	addi	a3,sp,836
     c17:	0010                	.insn	2, 0x0010
     c19:	0054                	addi	a3,sp,4
     c1b:	0000                	unimp
     c1d:	a501                	j	121d <$d.10+0x2a5>
     c1f:	1b09                	addi	s6,s6,-30
     c21:	0729                	addi	a4,a4,10 # 1800a <$d.7+0x161c2>
     c23:	0000                	unimp
     c25:	0390                	addi	a2,sp,448
     c27:	0000                	unimp
     c29:	2c00                	.insn	2, 0x2c00
     c2b:	0108                	addi	a0,sp,128
     c2d:	0000                	unimp
     c2f:	00082f2b          	.insn	4, 0x00082f2b
     c33:	2900                	.insn	2, 0x2900
     c35:	0000                	unimp
     c37:	0100                	addi	s0,sp,128
     c39:	000381a7          	.insn	4, 0x000381a7
     c3d:	1200                	addi	s0,sp,288
     c3f:	0000034b          	.insn	4, 0x034b
     c43:	0b0c                	addi	a1,sp,400
     c45:	0010                	.insn	2, 0x0010
     c47:	0028                	addi	a0,sp,8
     c49:	0000                	unimp
     c4b:	ac01                	j	e5b <$d.2+0xcd>
     c4d:	1b15                	addi	s6,s6,-27
     c4f:	0cb4                	addi	a3,sp,600
     c51:	0000                	unimp
     c53:	00000353          	.insn	4, 0x0353
     c57:	c31c                	sw	a5,0(a4)
     c59:	0002                	c.slli64	zero
     c5b:	2000                	.insn	2, 0x2000
     c5d:	0001                	nop
     c5f:	0100                	addi	s0,sp,128
     c61:	093c                	addi	a5,sp,152
     c63:	381d                	jal	499 <$d.8+0xd1>
     c65:	0002                	c.slli64	zero
     c67:	1000                	addi	s0,sp,32
     c69:	0400100b          	.insn	4, 0x0400100b
     c6d:	0000                	unimp
     c6f:	0100                	addi	s0,sp,128
     c71:	0c2d                	addi	s8,s8,11
     c73:	5012                	.insn	2, 0x5012
     c75:	0002                	c.slli64	zero
     c77:	2800                	.insn	2, 0x2800
     c79:	0400100b          	.insn	4, 0x0400100b
     c7d:	0000                	unimp
     c7f:	0100                	addi	s0,sp,128
     c81:	0531                	addi	a0,a0,12
     c83:	80808013          	addi	zero,ra,-2040
     c87:	0180                	addi	s0,sp,192
     c89:	0258                	addi	a4,sp,260
     c8b:	0000                	unimp
     c8d:	0111                	addi	sp,sp,4
     c8f:	635d                	lui	t1,0x17
     c91:	0002                	c.slli64	zero
     c93:	0000                	unimp
     c95:	0000                	unimp
     c97:	8f12                	mv	t5,tp
     c99:	0009                	c.nop	2
     c9b:	4400                	lw	s0,8(s0)
     c9d:	3c00100b          	.insn	4, 0x3c00100b
     ca1:	0000                	unimp
     ca3:	0100                	addi	s0,sp,128
     ca5:	15ad                	addi	a1,a1,-21
     ca7:	100b4427          	.insn	4, 0x100b4427
     cab:	3c00                	.insn	2, 0x3c00
     cad:	0000                	unimp
     caf:	1e00                	addi	s0,sp,816
     cb1:	00000cc7          	.insn	4, 0x0cc7
     cb5:	000009a3          	sb	zero,19(zero) # 13 <$d.5+0x13>
     cb9:	100b4427          	.insn	4, 0x100b4427
     cbd:	3400                	.insn	2, 0x3400
     cbf:	0000                	unimp
     cc1:	1e00                	addi	s0,sp,816
     cc3:	0ce5                	addi	s9,s9,25
     cc5:	0000                	unimp
     cc7:	000009af          	.insn	4, 0x09af
     ccb:	c312                	sw	tp,132(sp)
     ccd:	0002                	c.slli64	zero
     ccf:	6400                	.insn	2, 0x6400
     cd1:	1400100b          	.insn	4, 0x1400100b
     cd5:	0000                	unimp
     cd7:	0100                	addi	s0,sp,128
     cd9:	0944                	addi	s1,sp,148
     cdb:	381d                	jal	511 <$d.3+0x56>
     cdd:	0002                	c.slli64	zero
     cdf:	6800                	.insn	2, 0x6800
     ce1:	0400100b          	.insn	4, 0x0400100b
     ce5:	0000                	unimp
     ce7:	0100                	addi	s0,sp,128
     ce9:	0c2d                	addi	s8,s8,11
     ceb:	5012                	.insn	2, 0x5012
     ced:	0002                	c.slli64	zero
     cef:	7400                	.insn	2, 0x7400
     cf1:	0400100b          	.insn	4, 0x0400100b
     cf5:	0000                	unimp
     cf7:	0100                	addi	s0,sp,128
     cf9:	0531                	addi	a0,a0,12
     cfb:	80808013          	addi	zero,ra,-2040
     cff:	0180                	addi	s0,sp,192
     d01:	0258                	addi	a4,sp,260
     d03:	0000                	unimp
     d05:	0111                	addi	sp,sp,4
     d07:	635e                	.insn	2, 0x635e
     d09:	0002                	c.slli64	zero
     d0b:	0000                	unimp
     d0d:	0000                	unimp
     d0f:	0000                	unimp
     d11:	4b12                	lw	s6,4(sp)
     d13:	84000003          	lb	zero,-1984(zero) # fffff840 <_stack_top+0xffef3a80>
     d17:	1400100b          	.insn	4, 0x1400100b
     d1b:	0000                	unimp
     d1d:	0100                	addi	s0,sp,128
     d1f:	15ae                	slli	a1,a1,0x2b
     d21:	c312                	sw	tp,132(sp)
     d23:	0002                	c.slli64	zero
     d25:	8400                	.insn	2, 0x8400
     d27:	1400100b          	.insn	4, 0x1400100b
     d2b:	0000                	unimp
     d2d:	0100                	addi	s0,sp,128
     d2f:	093c                	addi	a5,sp,152
     d31:	02cb0a13          	addi	s4,s6,44
     d35:	0000                	unimp
     d37:	3812                	.insn	2, 0x3812
     d39:	0002                	c.slli64	zero
     d3b:	8400                	.insn	2, 0x8400
     d3d:	0400100b          	.insn	4, 0x0400100b
     d41:	0000                	unimp
     d43:	0100                	addi	s0,sp,128
     d45:	0c2d                	addi	s8,s8,11
     d47:	80808813          	addi	a6,ra,-2040
     d4b:	0180                	addi	s0,sp,192
     d4d:	0244                	addi	s1,sp,260
     d4f:	0000                	unimp
     d51:	0000                	unimp
     d53:	1d00                	addi	s0,sp,688
     d55:	039c                	addi	a5,sp,448
     d57:	0000                	unimp
     d59:	0754                	addi	a3,sp,900
     d5b:	0010                	.insn	2, 0x0010
     d5d:	0004                	.insn	2, 0x0004
     d5f:	0000                	unimp
     d61:	b201                	j	661 <$d.3+0x1a6>
     d63:	0011                	c.nop	4
     d65:	10077027          	.insn	4, 0x10077027
     d69:	c400                	sw	s0,8(s0)
     d6b:	0002                	c.slli64	zero
     d6d:	2b00                	.insn	2, 0x2b00
     d6f:	093d                	addi	s2,s2,15 # 1800f <$d.7+0x161c7>
     d71:	0000                	unimp
     d73:	02fc                	addi	a5,sp,332
     d75:	0000                	unimp
     d77:	b901                	j	987 <$d.6+0x314>
     d79:	0220                	addi	s0,sp,264
     d7b:	0000                	unimp
     d7d:	00097a2b          	.insn	4, 0x00097a2b
     d81:	c600                	sw	s0,8(a2)
     d83:	0000                	unimp
     d85:	0100                	addi	s0,sp,128
     d87:	20ba                	.insn	2, 0x20ba
     d89:	0002                	c.slli64	zero
     d8b:	1200                	addi	s0,sp,288
     d8d:	091a                	slli	s2,s2,0x6
     d8f:	0000                	unimp
     d91:	0770                	addi	a2,sp,908
     d93:	0010                	.insn	2, 0x0010
     d95:	00d4                	addi	a3,sp,68
     d97:	0000                	unimp
     d99:	b901                	j	9a9 <$d.6+0x336>
     d9b:	1e1f 0878 0000      	.insn	6, 0x08781e1f
     da1:	0931                	addi	s2,s2,12
     da3:	0000                	unimp
     da5:	10077027          	.insn	4, 0x10077027
     da9:	d400                	sw	s0,40(s0)
     dab:	0000                	unimp
     dad:	1e00                	addi	s0,sp,816
     daf:	084d                	addi	a6,a6,19
     db1:	0000                	unimp
     db3:	093d                	addi	s2,s2,15
     db5:	0000                	unimp
     db7:	382c                	.insn	2, 0x382c
     db9:	0001                	nop
     dbb:	1e00                	addi	s0,sp,816
     dbd:	08cd                	addi	a7,a7,19
     dbf:	0000                	unimp
     dc1:	0949                	addi	s2,s2,18
     dc3:	0000                	unimp
     dc5:	0000                	unimp
     dc7:	1200                	addi	s0,sp,288
     dc9:	0961                	addi	s2,s2,24
     dcb:	0000                	unimp
     dcd:	0844                	addi	s1,sp,20
     dcf:	0010                	.insn	2, 0x0010
     dd1:	0008                	.insn	2, 0x0008
     dd3:	0000                	unimp
     dd5:	ba01                	j	6e5 <$d.6+0x72>
     dd7:	1e1f 0950 0000      	.insn	6, 0x09501e1f
     ddd:	096d                	addi	s2,s2,27
     ddf:	0000                	unimp
     de1:	671e                	.insn	2, 0x671e
     de3:	0009                	c.nop	2
     de5:	7800                	.insn	2, 0x7800
     de7:	0009                	c.nop	2
     de9:	0000                	unimp
     deb:	4b12                	lw	s6,4(sp)
     ded:	64000003          	lb	zero,1600(zero) # 640 <$d.3+0x185>
     df1:	1008                	addi	a0,sp,32
     df3:	2800                	.insn	2, 0x2800
     df5:	0000                	unimp
     df7:	0100                	addi	s0,sp,128
     df9:	8d1b0dbf 53000009 	.insn	8, 0x530000098d1b0dbf
     e01:	1c000003          	lb	zero,448(zero) # 1c0 <$d.9+0x4c>
     e05:	000002c3          	.insn	4, 0x02c3
     e09:	0150                	addi	a2,sp,132
     e0b:	0000                	unimp
     e0d:	3c01                	jal	81d <$d.6+0x1aa>
     e0f:	1d09                	addi	s10,s10,-30
     e11:	0238                	addi	a4,sp,264
     e13:	0000                	unimp
     e15:	0868                	addi	a0,sp,28
     e17:	0010                	.insn	2, 0x0010
     e19:	0004                	.insn	2, 0x0004
     e1b:	0000                	unimp
     e1d:	2d01                	jal	142d <$d.4+0x1fe>
     e1f:	120c                	addi	a1,sp,288
     e21:	0250                	addi	a2,sp,260
     e23:	0000                	unimp
     e25:	0880                	addi	s0,sp,80
     e27:	0010                	.insn	2, 0x0010
     e29:	0004                	.insn	2, 0x0004
     e2b:	0000                	unimp
     e2d:	3101                	jal	a2d <$d.6+0x3ba>
     e2f:	1305                	addi	t1,t1,-31 # 16fe1 <$d.7+0x15199>
     e31:	8080                	.insn	2, 0x8080
     e33:	8080                	.insn	2, 0x8080
     e35:	5801                	li	a6,-32
     e37:	0002                	c.slli64	zero
     e39:	1100                	addi	s0,sp,160
     e3b:	6901                	.insn	2, 0x6901
     e3d:	00000263          	beqz	zero,e41 <$d.2+0xb3>
     e41:	0000                	unimp
     e43:	1200                	addi	s0,sp,288
     e45:	0000098f          	.insn	4, 0x098f
     e49:	0894                	addi	a3,sp,80
     e4b:	0010                	.insn	2, 0x0010
     e4d:	0040                	addi	s0,sp,4
     e4f:	0000                	unimp
     e51:	c001                	beqz	s0,e51 <$d.2+0xc3>
     e53:	270d                	jal	1575 <$d.4+0x346>
     e55:	0894                	addi	a3,sp,80
     e57:	0010                	.insn	2, 0x0010
     e59:	0040                	addi	s0,sp,4
     e5b:	0000                	unimp
     e5d:	a01e                	.insn	2, 0xa01e
     e5f:	0009                	c.nop	2
     e61:	a300                	.insn	2, 0xa300
     e63:	0009                	c.nop	2
     e65:	2700                	.insn	2, 0x2700
     e67:	0894                	addi	a3,sp,80
     e69:	0010                	.insn	2, 0x0010
     e6b:	0034                	addi	a3,sp,8
     e6d:	0000                	unimp
     e6f:	be1e                	.insn	2, 0xbe1e
     e71:	0009                	c.nop	2
     e73:	af00                	.insn	2, 0xaf00
     e75:	0009                	c.nop	2
     e77:	1200                	addi	s0,sp,288
     e79:	000002c3          	.insn	4, 0x02c3
     e7d:	08b4                	addi	a3,sp,88
     e7f:	0010                	.insn	2, 0x0010
     e81:	0014                	.insn	2, 0x0014
     e83:	0000                	unimp
     e85:	4401                	li	s0,0
     e87:	1d09                	addi	s10,s10,-30
     e89:	0238                	addi	a4,sp,264
     e8b:	0000                	unimp
     e8d:	08b8                	addi	a4,sp,88
     e8f:	0010                	.insn	2, 0x0010
     e91:	0004                	.insn	2, 0x0004
     e93:	0000                	unimp
     e95:	2d01                	jal	14a5 <$d.4+0x276>
     e97:	120c                	addi	a1,sp,288
     e99:	0250                	addi	a2,sp,260
     e9b:	0000                	unimp
     e9d:	08c4                	addi	s1,sp,84
     e9f:	0010                	.insn	2, 0x0010
     ea1:	0004                	.insn	2, 0x0004
     ea3:	0000                	unimp
     ea5:	3101                	jal	aa5 <$d.6+0x432>
     ea7:	1305                	addi	t1,t1,-31
     ea9:	8080                	.insn	2, 0x8080
     eab:	8080                	.insn	2, 0x8080
     ead:	5801                	li	a6,-32
     eaf:	0002                	c.slli64	zero
     eb1:	1100                	addi	s0,sp,160
     eb3:	6901                	.insn	2, 0x6901
     eb5:	00000263          	beqz	zero,eb9 <$d.2+0x12b>
     eb9:	0000                	unimp
     ebb:	0000                	unimp
     ebd:	1200                	addi	s0,sp,288
     ebf:	0000034b          	.insn	4, 0x034b
     ec3:	08d4                	addi	a3,sp,84
     ec5:	0010                	.insn	2, 0x0010
     ec7:	0060                	addi	s0,sp,12
     ec9:	0000                	unimp
     ecb:	c101                	beqz	a0,ecb <$d.2+0x13d>
     ecd:	120d                	addi	tp,tp,-29 # ffffffe3 <_stack_top+0xffef4223>
     ecf:	000002c3          	.insn	4, 0x02c3
     ed3:	08d4                	addi	a3,sp,84
     ed5:	0010                	.insn	2, 0x0010
     ed7:	0060                	addi	s0,sp,12
     ed9:	0000                	unimp
     edb:	3c01                	jal	8eb <$d.6+0x278>
     edd:	1b09                	addi	s6,s6,-30
     edf:	0a9f 0000 02cb      	.insn	6, 0x02cb00000a9f
     ee5:	0000                	unimp
     ee7:	381c                	.insn	2, 0x381c
     ee9:	0002                	c.slli64	zero
     eeb:	6800                	.insn	2, 0x6800
     eed:	0001                	nop
     eef:	0100                	addi	s0,sp,128
     ef1:	0c2d                	addi	s8,s8,11
     ef3:	0009dc1b          	.insn	4, 0x0009dc1b
     ef7:	4400                	lw	s0,8(s0)
     ef9:	0002                	c.slli64	zero
     efb:	0000                	unimp
     efd:	501c                	lw	a5,32(s0)
     eff:	0002                	c.slli64	zero
     f01:	9000                	.insn	2, 0x9000
     f03:	0001                	nop
     f05:	0100                	addi	s0,sp,128
     f07:	0531                	addi	a0,a0,12
     f09:	000a171b          	.insn	4, 0x000a171b
     f0d:	5800                	lw	s0,48(s0)
     f0f:	0002                	c.slli64	zero
     f11:	1b00                	addi	s0,sp,432
     f13:	00000a63          	beqz	zero,f27 <$d.2+0x199>
     f17:	00000263          	beqz	zero,f1b <$d.2+0x18d>
     f1b:	0000                	unimp
     f1d:	1200                	addi	s0,sp,288
     f1f:	0000098f          	.insn	4, 0x098f
     f23:	0938                	addi	a4,sp,152
     f25:	0010                	.insn	2, 0x0010
     f27:	0040                	addi	s0,sp,4
     f29:	0000                	unimp
     f2b:	c201                	beqz	a2,f2b <$d.2+0x19d>
     f2d:	270d                	jal	164f <$d.4+0x420>
     f2f:	0938                	addi	a4,sp,152
     f31:	0010                	.insn	2, 0x0010
     f33:	0040                	addi	s0,sp,4
     f35:	0000                	unimp
     f37:	ce1e                	sw	t2,28(sp)
     f39:	000a                	c.slli	zero,0x2
     f3b:	a300                	.insn	2, 0xa300
     f3d:	0009                	c.nop	2
     f3f:	2700                	.insn	2, 0x2700
     f41:	0938                	addi	a4,sp,152
     f43:	0010                	.insn	2, 0x0010
     f45:	0034                	addi	a3,sp,8
     f47:	0000                	unimp
     f49:	ec1e                	.insn	2, 0xec1e
     f4b:	000a                	c.slli	zero,0x2
     f4d:	af00                	.insn	2, 0xaf00
     f4f:	0009                	c.nop	2
     f51:	1200                	addi	s0,sp,288
     f53:	000002c3          	.insn	4, 0x02c3
     f57:	0958                	addi	a4,sp,148
     f59:	0010                	.insn	2, 0x0010
     f5b:	0014                	.insn	2, 0x0014
     f5d:	0000                	unimp
     f5f:	4401                	li	s0,0
     f61:	1d09                	addi	s10,s10,-30
     f63:	0238                	addi	a4,sp,264
     f65:	0000                	unimp
     f67:	095c                	addi	a5,sp,148
     f69:	0010                	.insn	2, 0x0010
     f6b:	0004                	.insn	2, 0x0004
     f6d:	0000                	unimp
     f6f:	2d01                	jal	157f <$d.4+0x350>
     f71:	120c                	addi	a1,sp,288
     f73:	0250                	addi	a2,sp,260
     f75:	0000                	unimp
     f77:	0968                	addi	a0,sp,156
     f79:	0010                	.insn	2, 0x0010
     f7b:	0004                	.insn	2, 0x0004
     f7d:	0000                	unimp
     f7f:	3101                	jal	b7f <$d.6+0x50c>
     f81:	1305                	addi	t1,t1,-31
     f83:	8080                	.insn	2, 0x8080
     f85:	8080                	.insn	2, 0x8080
     f87:	5801                	li	a6,-32
     f89:	0002                	c.slli64	zero
     f8b:	1100                	addi	s0,sp,160
     f8d:	6901                	.insn	2, 0x6901
     f8f:	00000263          	beqz	zero,f93 <$d.10+0x1b>
     f93:	0000                	unimp
     f95:	0000                	unimp
     f97:	1200                	addi	s0,sp,288
     f99:	0000034b          	.insn	4, 0x034b
     f9d:	0978                	addi	a4,sp,156
     f9f:	0010                	.insn	2, 0x0010
     fa1:	0060                	addi	s0,sp,12
     fa3:	0000                	unimp
     fa5:	c301                	beqz	a4,fa5 <$d.10+0x2d>
     fa7:	120d                	addi	tp,tp,-29 # ffffffe3 <_stack_top+0xffef4223>
     fa9:	000002c3          	.insn	4, 0x02c3
     fad:	0978                	addi	a4,sp,156
     faf:	0010                	.insn	2, 0x0010
     fb1:	0060                	addi	s0,sp,12
     fb3:	0000                	unimp
     fb5:	3c01                	jal	9c5 <$d.6+0x352>
     fb7:	1b09                	addi	s6,s6,-30
     fb9:	0bcd                	addi	s7,s7,19
     fbb:	0000                	unimp
     fbd:	000002cb          	.insn	4, 0x02cb
     fc1:	381c                	.insn	2, 0x381c
     fc3:	0002                	c.slli64	zero
     fc5:	b800                	.insn	2, 0xb800
     fc7:	0001                	nop
     fc9:	0100                	addi	s0,sp,128
     fcb:	0c2d                	addi	s8,s8,11
     fcd:	000b0a1b          	.insn	4, 0x000b0a1b
     fd1:	4400                	lw	s0,8(s0)
     fd3:	0002                	c.slli64	zero
     fd5:	0000                	unimp
     fd7:	501c                	lw	a5,32(s0)
     fd9:	0002                	c.slli64	zero
     fdb:	e000                	.insn	2, 0xe000
     fdd:	0001                	nop
     fdf:	0100                	addi	s0,sp,128
     fe1:	0531                	addi	a0,a0,12
     fe3:	000b451b          	.insn	4, 0x000b451b
     fe7:	5800                	lw	s0,48(s0)
     fe9:	0002                	c.slli64	zero
     feb:	1b00                	addi	s0,sp,432
     fed:	0b91                	addi	s7,s7,4
     fef:	0000                	unimp
     ff1:	00000263          	beqz	zero,ff5 <$d.10+0x7d>
     ff5:	0000                	unimp
     ff7:	1200                	addi	s0,sp,288
     ff9:	0000098f          	.insn	4, 0x098f
     ffd:	09dc                	addi	a5,sp,212
     fff:	0010                	.insn	2, 0x0010
    1001:	0040                	addi	s0,sp,4
    1003:	0000                	unimp
    1005:	c401                	beqz	s0,100d <$d.10+0x95>
    1007:	270d                	jal	1729 <$d.2+0xca>
    1009:	09dc                	addi	a5,sp,212
    100b:	0010                	.insn	2, 0x0010
    100d:	0040                	addi	s0,sp,4
    100f:	0000                	unimp
    1011:	fc1e                	.insn	2, 0xfc1e
    1013:	a300000b          	.insn	4, 0xa300000b
    1017:	0009                	c.nop	2
    1019:	2700                	.insn	2, 0x2700
    101b:	09dc                	addi	a5,sp,212
    101d:	0010                	.insn	2, 0x0010
    101f:	0034                	addi	a3,sp,8
    1021:	0000                	unimp
    1023:	1a1e                	slli	s4,s4,0x27
    1025:	000c                	.insn	2, 0x000c
    1027:	af00                	.insn	2, 0xaf00
    1029:	0009                	c.nop	2
    102b:	1200                	addi	s0,sp,288
    102d:	000002c3          	.insn	4, 0x02c3
    1031:	09fc                	addi	a5,sp,220
    1033:	0010                	.insn	2, 0x0010
    1035:	0014                	.insn	2, 0x0014
    1037:	0000                	unimp
    1039:	4401                	li	s0,0
    103b:	1d09                	addi	s10,s10,-30
    103d:	0238                	addi	a4,sp,264
    103f:	0000                	unimp
    1041:	0a00                	addi	s0,sp,272
    1043:	0010                	.insn	2, 0x0010
    1045:	0004                	.insn	2, 0x0004
    1047:	0000                	unimp
    1049:	2d01                	jal	1659 <$d.4+0x42a>
    104b:	120c                	addi	a1,sp,288
    104d:	0250                	addi	a2,sp,260
    104f:	0000                	unimp
    1051:	0a0c                	addi	a1,sp,272
    1053:	0010                	.insn	2, 0x0010
    1055:	0004                	.insn	2, 0x0004
    1057:	0000                	unimp
    1059:	3101                	jal	c59 <$d.6+0x5e6>
    105b:	1305                	addi	t1,t1,-31
    105d:	8080                	.insn	2, 0x8080
    105f:	8080                	.insn	2, 0x8080
    1061:	5801                	li	a6,-32
    1063:	0002                	c.slli64	zero
    1065:	1100                	addi	s0,sp,160
    1067:	6801                	.insn	2, 0x6801
    1069:	00000263          	beqz	zero,106d <$d.10+0xf5>
    106d:	0000                	unimp
    106f:	0000                	unimp
    1071:	1200                	addi	s0,sp,288
    1073:	0000034b          	.insn	4, 0x034b
    1077:	0a1c                	addi	a5,sp,272
    1079:	0010                	.insn	2, 0x0010
    107b:	0018                	.insn	2, 0x0018
    107d:	0000                	unimp
    107f:	c501                	beqz	a0,1087 <$d.10+0x10f>
    1081:	120d                	addi	tp,tp,-29 # ffffffe3 <_stack_top+0xffef4223>
    1083:	000002c3          	.insn	4, 0x02c3
    1087:	0a1c                	addi	a5,sp,272
    1089:	0010                	.insn	2, 0x0010
    108b:	0018                	.insn	2, 0x0018
    108d:	0000                	unimp
    108f:	3c01                	jal	a9f <$d.6+0x42c>
    1091:	1d09                	addi	s10,s10,-30
    1093:	0238                	addi	a4,sp,264
    1095:	0000                	unimp
    1097:	0a20                	addi	s0,sp,280
    1099:	0010                	.insn	2, 0x0010
    109b:	0004                	.insn	2, 0x0004
    109d:	0000                	unimp
    109f:	2d01                	jal	16af <$d.2+0x50>
    10a1:	120c                	addi	a1,sp,288
    10a3:	0250                	addi	a2,sp,260
    10a5:	0000                	unimp
    10a7:	0a2c                	addi	a1,sp,280
    10a9:	0010                	.insn	2, 0x0010
    10ab:	0008                	.insn	2, 0x0008
    10ad:	0000                	unimp
    10af:	3101                	jal	caf <$d.6+0x63c>
    10b1:	1305                	addi	t1,t1,-31
    10b3:	8080                	.insn	2, 0x8080
    10b5:	8080                	.insn	2, 0x8080
    10b7:	5801                	li	a6,-32
    10b9:	0002                	c.slli64	zero
    10bb:	1300                	addi	s0,sp,416
    10bd:	630a                	.insn	2, 0x630a
    10bf:	0002                	c.slli64	zero
    10c1:	0000                	unimp
    10c3:	0000                	unimp
    10c5:	1200                	addi	s0,sp,288
    10c7:	0388                	addi	a0,sp,448
    10c9:	0000                	unimp
    10cb:	0a34                	addi	a3,sp,280
    10cd:	0010                	.insn	2, 0x0010
    10cf:	000c                	.insn	2, 0x000c
    10d1:	0000                	unimp
    10d3:	c801                	beqz	s0,10e3 <$d.10+0x16b>
    10d5:	1b09                	addi	s6,s6,-30
    10d7:	0c38                	addi	a4,sp,536
    10d9:	0000                	unimp
    10db:	0390                	addi	a2,sp,448
    10dd:	0000                	unimp
    10df:	0000                	unimp
    10e1:	4b12                	lw	s6,4(sp)
    10e3:	64000003          	lb	zero,1600(zero) # 640 <$d.3+0x185>
    10e7:	100a                	c.slli	zero,0x22
    10e9:	2800                	.insn	2, 0x2800
    10eb:	0000                	unimp
    10ed:	0100                	addi	s0,sp,128
    10ef:	651b05cb          	.insn	4, 0x651b05cb
    10f3:	000c                	.insn	2, 0x000c
    10f5:	5300                	lw	s0,32(a4)
    10f7:	1c000003          	lb	zero,448(zero) # 1c0 <$d.9+0x4c>
    10fb:	000002c3          	.insn	4, 0x02c3
    10ff:	0208                	addi	a0,sp,256
    1101:	0000                	unimp
    1103:	3c01                	jal	b13 <$d.6+0x4a0>
    1105:	1d09                	addi	s10,s10,-30
    1107:	0238                	addi	a4,sp,264
    1109:	0000                	unimp
    110b:	0a68                	addi	a0,sp,284
    110d:	0010                	.insn	2, 0x0010
    110f:	0004                	.insn	2, 0x0004
    1111:	0000                	unimp
    1113:	2d01                	jal	1723 <$d.2+0xc4>
    1115:	120c                	addi	a1,sp,288
    1117:	0250                	addi	a2,sp,260
    1119:	0000                	unimp
    111b:	0a80                	addi	s0,sp,336
    111d:	0010                	.insn	2, 0x0010
    111f:	0004                	.insn	2, 0x0004
    1121:	0000                	unimp
    1123:	3101                	jal	d23 <$d.6+0x6b0>
    1125:	1305                	addi	t1,t1,-31
    1127:	8080                	.insn	2, 0x8080
    1129:	8080                	.insn	2, 0x8080
    112b:	5801                	li	a6,-32
    112d:	0002                	c.slli64	zero
    112f:	1100                	addi	s0,sp,160
    1131:	5d01                	li	s10,-32
    1133:	00000263          	beqz	zero,1137 <$d.10+0x1bf>
    1137:	0000                	unimp
    1139:	1200                	addi	s0,sp,288
    113b:	0000098f          	.insn	4, 0x098f
    113f:	0a9c                	addi	a5,sp,336
    1141:	0010                	.insn	2, 0x0010
    1143:	003c                	addi	a5,sp,8
    1145:	0000                	unimp
    1147:	cc01                	beqz	s0,115f <$d.10+0x1e7>
    1149:	2705                	jal	1869 <$d.2+0x20a>
    114b:	0a9c                	addi	a5,sp,336
    114d:	0010                	.insn	2, 0x0010
    114f:	003c                	addi	a5,sp,8
    1151:	0000                	unimp
    1153:	781e                	.insn	2, 0x781e
    1155:	000c                	.insn	2, 0x000c
    1157:	a300                	.insn	2, 0xa300
    1159:	0009                	c.nop	2
    115b:	2700                	.insn	2, 0x2700
    115d:	0a9c                	addi	a5,sp,336
    115f:	0010                	.insn	2, 0x0010
    1161:	0034                	addi	a3,sp,8
    1163:	0000                	unimp
    1165:	961e                	add	a2,a2,t2
    1167:	000c                	.insn	2, 0x000c
    1169:	af00                	.insn	2, 0xaf00
    116b:	0009                	c.nop	2
    116d:	1200                	addi	s0,sp,288
    116f:	000002c3          	.insn	4, 0x02c3
    1173:	0abc                	addi	a5,sp,344
    1175:	0010                	.insn	2, 0x0010
    1177:	0014                	.insn	2, 0x0014
    1179:	0000                	unimp
    117b:	4401                	li	s0,0
    117d:	1d09                	addi	s10,s10,-30
    117f:	0238                	addi	a4,sp,264
    1181:	0000                	unimp
    1183:	0ac0                	addi	s0,sp,340
    1185:	0010                	.insn	2, 0x0010
    1187:	0004                	.insn	2, 0x0004
    1189:	0000                	unimp
    118b:	2d01                	jal	179b <$d.2+0x13c>
    118d:	120c                	addi	a1,sp,288
    118f:	0250                	addi	a2,sp,260
    1191:	0000                	unimp
    1193:	0acc                	addi	a1,sp,340
    1195:	0010                	.insn	2, 0x0010
    1197:	0004                	.insn	2, 0x0004
    1199:	0000                	unimp
    119b:	3101                	jal	d9b <$d.2+0xd>
    119d:	1305                	addi	t1,t1,-31
    119f:	8080                	.insn	2, 0x8080
    11a1:	8080                	.insn	2, 0x8080
    11a3:	5801                	li	a6,-32
    11a5:	0002                	c.slli64	zero
    11a7:	1100                	addi	s0,sp,160
    11a9:	5e01                	li	t3,-32
    11ab:	00000263          	beqz	zero,11af <$d.10+0x237>
    11af:	0000                	unimp
    11b1:	0000                	unimp
    11b3:	1200                	addi	s0,sp,288
    11b5:	0000034b          	.insn	4, 0x034b
    11b9:	0adc                	addi	a5,sp,340
    11bb:	0010                	.insn	2, 0x0010
    11bd:	0014                	.insn	2, 0x0014
    11bf:	0000                	unimp
    11c1:	cd01                	beqz	a0,11d9 <$d.10+0x261>
    11c3:	1205                	addi	tp,tp,-31 # ffffffe1 <_stack_top+0xffef4221>
    11c5:	000002c3          	.insn	4, 0x02c3
    11c9:	0adc                	addi	a5,sp,340
    11cb:	0010                	.insn	2, 0x0010
    11cd:	0014                	.insn	2, 0x0014
    11cf:	0000                	unimp
    11d1:	3c01                	jal	be1 <$d.6+0x56e>
    11d3:	1309                	addi	t1,t1,-30
    11d5:	cb0a                	sw	sp,148(sp)
    11d7:	0002                	c.slli64	zero
    11d9:	1200                	addi	s0,sp,288
    11db:	0238                	addi	a4,sp,264
    11dd:	0000                	unimp
    11df:	0adc                	addi	a5,sp,340
    11e1:	0010                	.insn	2, 0x0010
    11e3:	0004                	.insn	2, 0x0004
    11e5:	0000                	unimp
    11e7:	2d01                	jal	17f7 <$d.2+0x198>
    11e9:	130c                	addi	a1,sp,416
    11eb:	8088                	.insn	2, 0x8088
    11ed:	8080                	.insn	2, 0x8080
    11ef:	4401                	li	s0,0
    11f1:	0002                	c.slli64	zero
    11f3:	0000                	unimp
    11f5:	0000                	unimp
    11f7:	4b2d                	li	s6,11
    11f9:	48000003          	lb	zero,1152(zero) # 480 <$d.8+0xb8>
    11fd:	100c                	addi	a1,sp,32
    11ff:	0800                	addi	s0,sp,16
    1201:	0000                	unimp
    1203:	0100                	addi	s0,sp,128
    1205:	1200                	addi	s0,sp,288
    1207:	000002c3          	.insn	4, 0x02c3
    120b:	0c48                	addi	a0,sp,532
    120d:	0010                	.insn	2, 0x0010
    120f:	0008                	.insn	2, 0x0008
    1211:	0000                	unimp
    1213:	3c01                	jal	c23 <$d.6+0x5b0>
    1215:	1d09                	addi	s10,s10,-30
    1217:	0250                	addi	a2,sp,260
    1219:	0000                	unimp
    121b:	0c48                	addi	a0,sp,532
    121d:	0010                	.insn	2, 0x0010
    121f:	0008                	.insn	2, 0x0008
    1221:	0000                	unimp
    1223:	3101                	jal	e23 <$d.2+0x95>
    1225:	0005                	c.nop	1
    1227:	0000                	unimp
    1229:	040a                	slli	s0,s0,0x2
    122b:	0002                	c.slli64	zero
	...

0000122f <$d.4>:
    122f:	0849                	addi	a6,a6,18
    1231:	0000                	unimp
    1233:	0004                	.insn	2, 0x0004
    1235:	0259                	addi	tp,tp,22 # 16 <$d.5+0x16>
    1237:	0000                	unimp
    1239:	0104                	addi	s1,sp,128
    123b:	0282                	c.slli64	t0
    123d:	0000                	unimp
    123f:	001d                	c.nop	7
    1241:	02a9                	addi	t0,t0,10
    1243:	0000                	unimp
    1245:	0f78                	addi	a4,sp,924
    1247:	0000                	unimp
    1249:	0000046b          	.insn	4, 0x046b
    124d:	0ce0                	addi	s0,sp,604
    124f:	0010                	.insn	2, 0x0010
    1251:	09b8                	addi	a4,sp,216
    1253:	0000                	unimp
    1255:	3302                	.insn	2, 0x3302
    1257:	0000                	unimp
    1259:	0100                	addi	s0,sp,128
    125b:	05c4                	addi	s1,sp,708
    125d:	10366803          	.insn	4, 0x10366803
    1261:	0300                	addi	s0,sp,384
    1263:	0000003f 00004604 	.insn	8, 0x46040000003f
    126b:	1100                	addi	s0,sp,160
    126d:	0500                	addi	s0,sp,640
    126f:	040d                	addi	s0,s0,3 # 20a02 <$d.7+0x1ebba>
    1271:	0000                	unimp
    1273:	0108                	addi	a0,sp,128
    1275:	8506                	mv	a0,ra
    1277:	0005                	c.nop	1
    1279:	0800                	addi	s0,sp,16
    127b:	005b0707          	.insn	4, 0x005b0707
    127f:	0000                	unimp
    1281:	0d01                	addi	s10,s10,0
    1283:	0501                	addi	a0,a0,0
    1285:	1036b503          	.insn	4, 0x1036b503
    1289:	0300                	addi	s0,sp,384
    128b:	0000003f 00004604 	.insn	8, 0x46040000003f
    1293:	0300                	addi	s0,sp,384
    1295:	0700                	addi	s0,sp,896
    1297:	0075                	c.nop	29
    1299:	0000                	unimp
    129b:	3501                	jal	109b <$d.10+0x123>
    129d:	0501                	addi	a0,a0,0
    129f:	1035d603          	lhu	a2,259(a1)
    12a3:	0300                	addi	s0,sp,384
    12a5:	0000003f 00004604 	.insn	8, 0x46040000003f
    12ad:	2300                	.insn	2, 0x2300
    12af:	0700                	addi	s0,sp,896
    12b1:	0000008f          	.insn	4, 0x008f
    12b5:	3d01                	jal	10c5 <$d.10+0x14d>
    12b7:	0501                	addi	a0,a0,0
    12b9:	1030cf03          	lbu	t5,259(ra)
    12bd:	0300                	addi	s0,sp,384
    12bf:	0000003f 00004604 	.insn	8, 0x46040000003f
    12c7:	2400                	.insn	2, 0x2400
    12c9:	0700                	addi	s0,sp,896
    12cb:	00a9                	addi	ra,ra,10
    12cd:	0000                	unimp
    12cf:	4601                	li	a2,0
    12d1:	0501                	addi	a0,a0,0
    12d3:	10339603          	lh	a2,259(t2)
    12d7:	0300                	addi	s0,sp,384
    12d9:	0000003f 00004604 	.insn	8, 0x46040000003f
    12e1:	3000                	.insn	2, 0x3000
    12e3:	0800                	addi	s0,sp,16
    12e5:	5709                	li	a4,-30
    12e7:	0004                	.insn	2, 0x0004
    12e9:	c800                	sw	s0,16(s0)
    12eb:	0000                	unimp
    12ed:	0100                	addi	s0,sp,128
    12ef:	05e2                	slli	a1,a1,0x18
    12f1:	10366803          	.insn	4, 0x10366803
    12f5:	0000                	unimp
    12f7:	0000d403          	lhu	s0,0(ra)
    12fb:	0400                	addi	s0,sp,512
    12fd:	0046                	c.slli	zero,0x11
    12ff:	0000                	unimp
    1301:	0011                	c.nop	4
    1303:	3f0a                	.insn	2, 0x3f0a
    1305:	0000                	unimp
    1307:	0800                	addi	s0,sp,16
    1309:	5709                	li	a4,-30
    130b:	0004                	.insn	2, 0x0004
    130d:	c800                	sw	s0,16(s0)
    130f:	0000                	unimp
    1311:	0100                	addi	s0,sp,128
    1313:	05d9                	addi	a1,a1,22
    1315:	10366803          	.insn	4, 0x10366803
    1319:	0000                	unimp
    131b:	0000f10b          	.insn	4, 0xf10b
    131f:	0c00                	addi	s0,sp,528
    1321:	00fc                	addi	a5,sp,76
    1323:	0000                	unimp
    1325:	05b6                	slli	a1,a1,0xd
    1327:	0000                	unimp
    1329:	0702                	c.slli64	a4
    132b:	6805                	lui	a6,0x1
    132d:	08000003          	lb	zero,128(zero) # 80 <$d.10+0x2c>
    1331:	0b01                	addi	s6,s6,0
    1333:	0108                	addi	a0,sp,128
    1335:	0000                	unimp
    1337:	f10a                	.insn	2, 0xf10a
    1339:	0000                	unimp
    133b:	0c00                	addi	s0,sp,528
    133d:	0118                	addi	a4,sp,128
    133f:	0000                	unimp
    1341:	00000313          	li	t1,0
    1345:	0902                	c.slli64	s2
    1347:	2605                	jal	1667 <$d.2+0x8>
    1349:	0005                	c.nop	1
    134b:	0700                	addi	s0,sp,896
    134d:	0c04                	addi	s1,sp,528
    134f:	010d                	addi	sp,sp,3
    1351:	0000                	unimp
    1353:	0191                	addi	gp,gp,4
    1355:	0000                	unimp
    1357:	0b02                	c.slli64	s6
    1359:	00012f0b          	.insn	4, 0x00012f0b
    135d:	0d00                	addi	s0,sp,656
    135f:	e00e                	.insn	2, 0xe00e
    1361:	100c                	addi	a1,sp,32
    1363:	2800                	.insn	2, 0x2800
    1365:	0000                	unimp
    1367:	0100                	addi	s0,sp,128
    1369:	c752                	sw	s4,140(sp)
    136b:	0001                	nop
    136d:	0100                	addi	s0,sp,128
    136f:	00081b03          	lh	s6,0(a6) # 1000 <$d.10+0x88>
    1373:	0f00                	addi	s0,sp,912
    1375:	5a01                	li	s4,-32
    1377:	0000002b          	.insn	4, 0x002b
    137b:	0301                	addi	t1,t1,0
    137d:	0000081b          	.insn	4, 0x081b
    1381:	8e10                	.insn	2, 0x8e10
    1383:	000d                	c.nop	3
    1385:	6400                	.insn	2, 0x6400
    1387:	01000003          	lb	zero,16(zero) # 10 <$d.5+0x10>
    138b:	00012a03          	lw	s4,0(sp)
    138f:	1000                	addi	s0,sp,32
    1391:	0dd5                	addi	s11,s11,21
    1393:	0000                	unimp
    1395:	00d9                	addi	ra,ra,22
    1397:	0000                	unimp
    1399:	0301                	addi	t1,t1,0
    139b:	011f 0000 a111      	.insn	6, 0xa1110000011f
    13a1:	000d                	c.nop	3
    13a3:	c000                	sw	s0,0(s0)
    13a5:	0005                	c.nop	1
    13a7:	0100                	addi	s0,sp,128
    13a9:	ec04                	.insn	2, 0xec04
    13ab:	0000                	unimp
    13ad:	1200                	addi	s0,sp,288
    13af:	5b01                	li	s6,-32
    13b1:	000001eb          	.insn	4, 0x01eb
    13b5:	0501                	addi	a0,a0,0
    13b7:	00000103          	lb	sp,0(zero) # 0 <$d.5>
    13bb:	0e00                	addi	s0,sp,784
    13bd:	0d08                	addi	a0,sp,656
    13bf:	0010                	.insn	2, 0x0010
    13c1:	0020                	addi	s0,sp,8
    13c3:	0000                	unimp
    13c5:	5201                	li	tp,-32
    13c7:	0416                	slli	s0,s0,0x5
    13c9:	0000                	unimp
    13cb:	2001                	jal	13cb <$d.4+0x19c>
    13cd:	0000081b          	.insn	4, 0x081b
    13d1:	7e5a010f          	.insn	4, 0x7e5a010f
    13d5:	0001                	nop
    13d7:	0100                	addi	s0,sp,128
    13d9:	1b20                	addi	s0,sp,440
    13db:	0008                	.insn	2, 0x0008
    13dd:	0f00                	addi	s0,sp,912
    13df:	5b01                	li	s6,-32
    13e1:	01c5                	addi	gp,gp,17
    13e3:	0000                	unimp
    13e5:	2001                	jal	13e5 <$d.4+0x1b6>
    13e7:	0000003f 000e1e10 	.insn	8, 0x000e1e100000003f
    13ef:	d900                	sw	s0,48(a0)
    13f1:	0000                	unimp
    13f3:	0100                	addi	s0,sp,128
    13f5:	1f20                	addi	s0,sp,952
    13f7:	0001                	nop
    13f9:	1100                	addi	s0,sp,160
    13fb:	0dea                	slli	s11,s11,0x1a
    13fd:	0000                	unimp
    13ff:	00cd                	addi	ra,ra,19
    1401:	0000                	unimp
    1403:	2101                	jal	1803 <$d.2+0x1a4>
    1405:	00ec                	addi	a1,sp,76
    1407:	0000                	unimp
    1409:	1300                	addi	s0,sp,416
    140b:	059e                	slli	a1,a1,0x7
    140d:	0000                	unimp
    140f:	5b01                	li	s6,-32
    1411:	010d                	addi	sp,sp,3
    1413:	0000                	unimp
    1415:	1401                	addi	s0,s0,-32
    1417:	06c1                	addi	a3,a3,16
    1419:	0000                	unimp
    141b:	5b01                	li	s6,-32
    141d:	010d                	addi	sp,sp,3
    141f:	0000                	unimp
    1421:	4514                	lw	a3,8(a0)
    1423:	0005                	c.nop	1
    1425:	0100                	addi	s0,sp,128
    1427:	0002215b          	.insn	4, 0x0002215b
    142b:	1500                	addi	s0,sp,672
    142d:	0549                	addi	a0,a0,18
    142f:	0000                	unimp
    1431:	5e01                	li	t3,-32
    1433:	010d                	addi	sp,sp,3
    1435:	0000                	unimp
    1437:	be15                	j	f6b <$d.2+0x1dd>
    1439:	0005                	c.nop	1
    143b:	0100                	addi	s0,sp,128
    143d:	0d5d                	addi	s10,s10,23
    143f:	0001                	nop
    1441:	1600                	addi	s0,sp,800
    1443:	2915                	jal	1877 <$d.2+0x218>
    1445:	0000                	unimp
    1447:	0100                	addi	s0,sp,128
    1449:	2660                	.insn	2, 0x2660
    144b:	0002                	c.slli64	zero
    144d:	0000                	unimp
    144f:	0b00                	addi	s0,sp,400
    1451:	010d                	addi	sp,sp,3
    1453:	0000                	unimp
    1455:	1205                	addi	tp,tp,-31 # ffffffe1 <_stack_top+0xffef4221>
    1457:	0004                	.insn	2, 0x0004
    1459:	0500                	addi	s0,sp,640
    145b:	1704                	addi	s1,sp,928
    145d:	0d28                	addi	a0,sp,664
    145f:	0010                	.insn	2, 0x0010
    1461:	00fc                	addi	a5,sp,76
    1463:	0000                	unimp
    1465:	5201                	li	tp,-32
    1467:	000006c7          	.insn	4, 0x06c7
    146b:	6c01                	.insn	2, 0x6c01
    146d:	3310                	.insn	2, 0x3310
    146f:	000e                	c.slli	zero,0x3
    1471:	8200                	.insn	2, 0x8200
    1473:	0001                	nop
    1475:	0100                	addi	s0,sp,128
    1477:	266c                	.insn	2, 0x266c
    1479:	0002                	c.slli64	zero
    147b:	1200                	addi	s0,sp,288
    147d:	9102                	jalr	sp
    147f:	7e06                	.insn	2, 0x7e06
    1481:	0001                	nop
    1483:	0100                	addi	s0,sp,128
    1485:	00081c6f          	jal	s8,82485 <$d.7+0x8063d>
    1489:	1100                	addi	s0,sp,160
    148b:	0e5c                	addi	a5,sp,788
    148d:	0000                	unimp
    148f:	00000093          	li	ra,0
    1493:	7001                	c.lui	zero,0xfffe0
    1495:	0226                	slli	tp,tp,0x9
    1497:	0000                	unimp
    1499:	8711                	srai	a4,a4,0x4
    149b:	000e                	c.slli	zero,0x3
    149d:	c100                	sw	s0,0(a0)
    149f:	0006                	c.slli	zero,0x1
    14a1:	0100                	addi	s0,sp,128
    14a3:	0d6e                	slli	s10,s10,0x1b
    14a5:	0001                	nop
    14a7:	1800                	addi	s0,sp,48
    14a9:	0d9c                	addi	a5,sp,720
    14ab:	0010                	.insn	2, 0x0010
    14ad:	0048                	addi	a0,sp,4
    14af:	0000                	unimp
    14b1:	f711                	bnez	a4,13bd <$d.4+0x18e>
    14b3:	000e                	c.slli	zero,0x3
    14b5:	4500                	lw	s0,8(a0)
    14b7:	0005                	c.nop	1
    14b9:	0100                	addi	s0,sp,128
    14bb:	0d7f 0001 1900 01db 	.insn	10, 0x01db190000010d7f
    14c3:	0000 
    14c5:	0d9c                	addi	a5,sp,720
    14c7:	0010                	.insn	2, 0x0010
    14c9:	0034                	addi	a3,sp,8
    14cb:	0000                	unimp
    14cd:	8001                	c.srli64	s0
    14cf:	1a0d                	addi	s4,s4,-29 # fffdffe3 <_stack_top+0xffed4223>
    14d1:	00000ebb          	.insn	4, 0x0ebb
    14d5:	01fd                	addi	gp,gp,31
    14d7:	0000                	unimp
    14d9:	d91a                	sw	t1,176(sp)
    14db:	000e                	c.slli	zero,0x3
    14dd:	0800                	addi	s0,sp,16
    14df:	0002                	c.slli64	zero
    14e1:	1800                	addi	s0,sp,48
    14e3:	0d9c                	addi	a5,sp,720
    14e5:	0010                	.insn	2, 0x0010
    14e7:	0034                	addi	a3,sp,8
    14e9:	0000                	unimp
    14eb:	145f011b          	.insn	4, 0x145f011b
    14ef:	0002                	c.slli64	zero
    14f1:	0000                	unimp
    14f3:	0000                	unimp
    14f5:	e21c                	.insn	2, 0xe21c
    14f7:	0002                	c.slli64	zero
    14f9:	6400                	.insn	2, 0x6400
    14fb:	100d                	c.nop	-29
    14fd:	1d00                	addi	s0,sp,688
    14ff:	02e2                	slli	t0,t0,0x18
    1501:	0000                	unimp
    1503:	0d74                	addi	a3,sp,668
    1505:	0010                	.insn	2, 0x0010
    1507:	e21d                	bnez	a2,152d <$d.4+0x2fe>
    1509:	0002                	c.slli64	zero
    150b:	0000                	unimp
    150d:	100e                	c.slli	zero,0x23
    150f:	0000                	unimp
    1511:	b81e                	.insn	2, 0xb81e
    1513:	0001                	nop
    1515:	0100                	addi	s0,sp,128
    1517:	1f58                	addi	a4,sp,948
    1519:	0000003f 0e241700 	.insn	8, 0x0e2417000000003f
    1521:	0010                	.insn	2, 0x0010
    1523:	02d8                	addi	a4,sp,324
    1525:	0000                	unimp
    1527:	5201                	li	tp,-32
    1529:	04a0                	addi	s0,sp,584
    152b:	0000                	unimp
    152d:	8901                	andi	a0,a0,0
    152f:	0a10                	addi	a2,sp,272
    1531:	5d00000f          	.insn	4, 0x5d00000f
    1535:	0006                	c.slli	zero,0x1
    1537:	0100                	addi	s0,sp,128
    1539:	d389                	beqz	a5,143b <$d.4+0x20c>
    153b:	0006                	c.slli	zero,0x1
    153d:	1200                	addi	s0,sp,288
    153f:	9102                	jalr	sp
    1541:	fa18                	.insn	2, 0xfa18
    1543:	0006                	c.slli	zero,0x1
    1545:	0100                	addi	s0,sp,128
    1547:	288a                	.insn	2, 0x288a
    1549:	0008                	.insn	2, 0x0008
    154b:	2000                	.insn	2, 0x2000
    154d:	05e6                	slli	a1,a1,0x19
    154f:	0000                	unimp
    1551:	cf01                	beqz	a4,1569 <$d.4+0x33a>
    1553:	10c0                	addi	s0,sp,100
    1555:	0010                	.insn	2, 0x0010
    1557:	2021                	jal	155f <$d.4+0x330>
    1559:	0002                	c.slli64	zero
    155b:	1200                	addi	s0,sp,288
    155d:	9102                	jalr	sp
    155f:	7e0d                	lui	t3,0xfffe3
    1561:	0001                	nop
    1563:	0100                	addi	s0,sp,128
    1565:	31ac                	.insn	2, 0x31ac
    1567:	0008                	.insn	2, 0x0008
    1569:	1100                	addi	s0,sp,160
    156b:	0fa1                	addi	t6,t6,8
    156d:	0000                	unimp
    156f:	04e2                	slli	s1,s1,0x18
    1571:	0000                	unimp
    1573:	a001                	j	1573 <$d.4+0x344>
    1575:	0226                	slli	tp,tp,0x9
    1577:	0000                	unimp
    1579:	bf11                	j	148d <$d.4+0x25e>
    157b:	c100000f          	.insn	4, 0xc100000f
    157f:	0006                	c.slli	zero,0x1
    1581:	0100                	addi	s0,sp,128
    1583:	18a2                	slli	a7,a7,0x28
    1585:	0001                	nop
    1587:	1100                	addi	s0,sp,160
    1589:	00000ff3          	.insn	4, 0x0ff3
    158d:	0029                	c.nop	10
    158f:	0000                	unimp
    1591:	ad01                	j	1ba1 <$d.4+0x125>
    1593:	0226                	slli	tp,tp,0x9
    1595:	0000                	unimp
    1597:	1800                	addi	s0,sp,48
    1599:	0f20                	addi	s0,sp,920
    159b:	0010                	.insn	2, 0x0010
    159d:	00c8                	addi	a0,sp,68
    159f:	0000                	unimp
    15a1:	a811                	j	15b5 <$d.4+0x386>
    15a3:	0010                	.insn	2, 0x0010
    15a5:	e200                	.insn	2, 0xe200
    15a7:	0004                	.insn	2, 0x0004
    15a9:	0100                	addi	s0,sp,128
    15ab:	18c1                	addi	a7,a7,-16
    15ad:	0001                	nop
    15af:	1800                	addi	s0,sp,48
    15b1:	0f30                	addi	a2,sp,920
    15b3:	0010                	.insn	2, 0x0010
    15b5:	00b8                	addi	a4,sp,72
    15b7:	0000                	unimp
    15b9:	2b11                	jal	1acd <$d.4+0x51>
    15bb:	0010                	.insn	2, 0x0010
    15bd:	2900                	.insn	2, 0x2900
    15bf:	0000                	unimp
    15c1:	0100                	addi	s0,sp,128
    15c3:	26c2                	.insn	2, 0x26c2
    15c5:	0002                	c.slli64	zero
    15c7:	1800                	addi	s0,sp,48
    15c9:	0f30                	addi	a2,sp,920
    15cb:	0010                	.insn	2, 0x0010
    15cd:	00b8                	addi	a4,sp,72
    15cf:	0000                	unimp
    15d1:	bb11                	j	12e5 <$d.4+0xb6>
    15d3:	0010                	.insn	2, 0x0010
    15d5:	4e00                	lw	s0,24(a2)
    15d7:	0002                	c.slli64	zero
    15d9:	0100                	addi	s0,sp,128
    15db:	000118c3          	.insn	4, 0x000118c3
    15df:	0000                	unimp
    15e1:	0000                	unimp
    15e3:	0418                	addi	a4,sp,512
    15e5:	1010                	addi	a2,sp,32
    15e7:	3800                	.insn	2, 0x3800
    15e9:	0000                	unimp
    15eb:	1100                	addi	s0,sp,160
    15ed:	0000111b          	.insn	4, 0x111b
    15f1:	000001eb          	.insn	4, 0x01eb
    15f5:	9801                	andi	s0,s0,-32
    15f7:	000006d3          	.insn	4, 0x06d3
    15fb:	2200                	.insn	2, 0x2200
    15fd:	e21d                	bnez	a2,1623 <$d.4+0x3f4>
    15ff:	0002                	c.slli64	zero
    1601:	cc00                	sw	s0,24(s0)
    1603:	100e                	c.slli	zero,0x23
    1605:	1d00                	addi	s0,sp,688
    1607:	02e2                	slli	t0,t0,0x18
    1609:	0000                	unimp
    160b:	0f10                	addi	a2,sp,912
    160d:	0010                	.insn	2, 0x0010
    160f:	e21d                	bnez	a2,1635 <$d.4+0x406>
    1611:	0002                	c.slli64	zero
    1613:	4400                	lw	s0,8(s0)
    1615:	1d00100f          	.insn	4, 0x1d00100f
    1619:	02e2                	slli	t0,t0,0x18
    161b:	0000                	unimp
    161d:	0f5c                	addi	a5,sp,916
    161f:	0010                	.insn	2, 0x0010
    1621:	e21d                	bnez	a2,1647 <$d.4+0x418>
    1623:	0002                	c.slli64	zero
    1625:	7400                	.insn	2, 0x7400
    1627:	1d00100f          	.insn	4, 0x1d00100f
    162b:	02e2                	slli	t0,t0,0x18
    162d:	0000                	unimp
    162f:	0f8c                	addi	a1,sp,976
    1631:	0010                	.insn	2, 0x0010
    1633:	e21d                	bnez	a2,1659 <$d.4+0x42a>
    1635:	0002                	c.slli64	zero
    1637:	a400                	.insn	2, 0xa400
    1639:	1d00100f          	.insn	4, 0x1d00100f
    163d:	02e2                	slli	t0,t0,0x18
    163f:	0000                	unimp
    1641:	0fbc                	addi	a5,sp,984
    1643:	0010                	.insn	2, 0x0010
    1645:	e21d                	bnez	a2,166b <$d.2+0xc>
    1647:	0002                	c.slli64	zero
    1649:	d400                	sw	s0,40(s0)
    164b:	1d00100f          	.insn	4, 0x1d00100f
    164f:	02e2                	slli	t0,t0,0x18
    1651:	0000                	unimp
    1653:	0fe8                	addi	a0,sp,988
    1655:	0010                	.insn	2, 0x0010
    1657:	e21d                	bnez	a2,167d <$d.2+0x1e>
    1659:	0002                	c.slli64	zero
    165b:	fc00                	.insn	2, 0xfc00
    165d:	1d00100f          	.insn	4, 0x1d00100f
    1661:	02e2                	slli	t0,t0,0x18
    1663:	0000                	unimp
    1665:	102c                	addi	a1,sp,40
    1667:	0010                	.insn	2, 0x0010
    1669:	e21d                	bnez	a2,168f <$d.2+0x30>
    166b:	0002                	c.slli64	zero
    166d:	4800                	lw	s0,16(s0)
    166f:	1010                	addi	a2,sp,32
    1671:	1d00                	addi	s0,sp,688
    1673:	02e2                	slli	t0,t0,0x18
    1675:	0000                	unimp
    1677:	10a4                	addi	s1,sp,104
    1679:	0010                	.insn	2, 0x0010
    167b:	e21d                	bnez	a2,16a1 <$d.2+0x42>
    167d:	0002                	c.slli64	zero
    167f:	c000                	sw	s0,0(s0)
    1681:	1010                	addi	a2,sp,32
    1683:	0000                	unimp
    1685:	1010fc23          	.insn	4, 0x1010fc23
    1689:	cc00                	sw	s0,24(s0)
    168b:	0000                	unimp
    168d:	0100                	addi	s0,sp,128
    168f:	8d52                	mv	s10,s4
    1691:	0006                	c.slli	zero,0x1
    1693:	2400                	.insn	2, 0x2400
    1695:	1146                	slli	sp,sp,0x31
    1697:	0000                	unimp
    1699:	0699                	addi	a3,a3,6
    169b:	0000                	unimp
    169d:	0125                	addi	sp,sp,9
    169f:	0006a45b          	.insn	4, 0x0006a45b
    16a3:	1a00                	addi	s0,sp,304
    16a5:	11b9                	addi	gp,gp,-18
    16a7:	0000                	unimp
    16a9:	000006af          	.insn	4, 0x06af
    16ad:	3821                	jal	ec5 <$d.2+0x137>
    16af:	0002                	c.slli64	zero
    16b1:	1a00                	addi	s0,sp,304
    16b3:	000011e3          	bnez	zero,1eb5 <$d.7+0x6d>
    16b7:	000006bb          	.insn	4, 0x06bb
    16bb:	011a                	slli	sp,sp,0x6
    16bd:	0012                	c.slli	zero,0x4
    16bf:	c600                	sw	s0,8(a2)
    16c1:	0006                	c.slli	zero,0x1
    16c3:	0000                	unimp
    16c5:	2600                	.insn	2, 0x2600
    16c7:	050e                	slli	a0,a0,0x3
    16c9:	0000                	unimp
    16cb:	df01                	beqz	a4,15e3 <$d.4+0x3b4>
    16cd:	1401                	addi	s0,s0,-32
    16cf:	0182                	c.slli64	gp
    16d1:	0000                	unimp
    16d3:	df01                	beqz	a4,15eb <$d.4+0x3bc>
    16d5:	010d                	addi	sp,sp,3
    16d7:	0000                	unimp
    16d9:	1516                	slli	a0,a0,0x25
    16db:	0029                	c.nop	10
    16dd:	0000                	unimp
    16df:	e001                	bnez	s0,16df <$d.2+0x80>
    16e1:	0226                	slli	tp,tp,0x9
    16e3:	0000                	unimp
    16e5:	1516                	slli	a0,a0,0x25
    16e7:	000006c3          	.insn	4, 0x06c3
    16eb:	e101                	bnez	a0,16eb <$d.2+0x8c>
    16ed:	00f1                	addi	ra,ra,28
    16ef:	0000                	unimp
    16f1:	0000                	unimp
    16f3:	2600                	.insn	2, 0x2600
    16f5:	0201                	addi	tp,tp,0 # 0 <$d.5>
    16f7:	0000                	unimp
    16f9:	d801                	beqz	s0,1609 <$d.4+0x3da>
    16fb:	1401                	addi	s0,s0,-32
    16fd:	0182                	c.slli64	gp
    16ff:	0000                	unimp
    1701:	d801                	beqz	s0,1611 <$d.4+0x3e2>
    1703:	00f1                	addi	ra,ra,28
    1705:	0000                	unimp
    1707:	2700                	.insn	2, 0x2700
    1709:	11c8                	addi	a0,sp,228
    170b:	0010                	.insn	2, 0x0010
    170d:	0280                	addi	s0,sp,320
    170f:	0000                	unimp
    1711:	5201                	li	tp,-32
    1713:	062e                	slli	a2,a2,0xb
    1715:	0000                	unimp
    1717:	0401                	addi	s0,s0,0
    1719:	2801                	jal	1729 <$d.2+0xca>
    171b:	1214                	addi	a3,sp,288
    171d:	0000                	unimp
    171f:	00a4                	addi	s1,sp,72
    1721:	0000                	unimp
    1723:	0401                	addi	s0,s0,0
    1725:	2a01                	jal	1835 <$d.2+0x1d6>
    1727:	0001                	nop
    1729:	2800                	.insn	2, 0x2800
    172b:	1232                	slli	tp,tp,0x2c
    172d:	0000                	unimp
    172f:	0000002f          	.insn	4, 0x002f
    1733:	0401                	addi	s0,s0,0
    1735:	1f01                	addi	t5,t5,-32
    1737:	0001                	nop
    1739:	2800                	.insn	2, 0x2800
    173b:	1250                	addi	a2,sp,292
    173d:	0000                	unimp
    173f:	032e                	slli	t1,t1,0xb
    1741:	0000                	unimp
    1743:	0401                	addi	s0,s0,0
    1745:	dd01                	beqz	a0,165d <$d.4+0x42e>
    1747:	0006                	c.slli	zero,0x1
    1749:	2900                	.insn	2, 0x2900
    174b:	0000126f          	jal	tp,274b <$d.7+0x903>
    174f:	00cd                	addi	ra,ra,19
    1751:	0000                	unimp
    1753:	0501                	addi	a0,a0,0
    1755:	0301                	addi	t1,t1,0
    1757:	0001                	nop
    1759:	2900                	.insn	2, 0x2900
    175b:	128d                	addi	t0,t0,-29
    175d:	0000                	unimp
    175f:	033e                	slli	t1,t1,0xf
    1761:	0000                	unimp
    1763:	0601                	addi	a2,a2,0
    1765:	1f01                	addi	t5,t5,-32
    1767:	0001                	nop
    1769:	1800                	addi	s0,sp,48
    176b:	1234                	addi	a3,sp,296
    176d:	0010                	.insn	2, 0x0010
    176f:	01d0                	addi	a2,sp,196
    1771:	0000                	unimp
    1773:	ac29                	j	198d <$d.10+0xa2>
    1775:	0012                	c.slli	zero,0x4
    1777:	4b00                	lw	s0,16(a4)
    1779:	0005                	c.nop	1
    177b:	0100                	addi	s0,sp,128
    177d:	0109                	addi	sp,sp,2
    177f:	011f 0000 972a      	.insn	6, 0x972a0000011f
    1785:	0004                	.insn	2, 0x0004
    1787:	5800                	lw	s0,48(s0)
    1789:	0002                	c.slli64	zero
    178b:	0100                	addi	s0,sp,128
    178d:	010c                	addi	a1,sp,128
    178f:	2509                	jal	1d91 <$d.13+0x155>
    1791:	6401                	.insn	2, 0x6401
    1793:	049f 0000 7021      	.insn	6, 0x70210000049f
    1799:	0002                	c.slli64	zero
    179b:	1a00                	addi	s0,sp,304
    179d:	12ca                	slli	t0,t0,0x32
    179f:	0000                	unimp
    17a1:	000004ab          	.insn	4, 0x04ab
    17a5:	8821                	andi	s0,s0,8
    17a7:	0002                	c.slli64	zero
    17a9:	1a00                	addi	s0,sp,304
    17ab:	00001347          	.insn	4, 0x1347
    17af:	000004b7          	lui	s1,0x0
    17b3:	0000                	unimp
    17b5:	1800                	addi	s0,sp,48
    17b7:	1330                	addi	a2,sp,424
    17b9:	0010                	.insn	2, 0x0010
    17bb:	0074                	addi	a3,sp,12
    17bd:	0000                	unimp
    17bf:	2958012b          	.insn	4, 0x2958012b
    17c3:	0000                	unimp
    17c5:	0100                	addi	s0,sp,128
    17c7:	0110                	addi	a2,sp,128
    17c9:	011f 0000 c52c      	.insn	6, 0xc52c0000011f
    17cf:	0004                	.insn	2, 0x0004
    17d1:	4800                	lw	s0,16(s0)
    17d3:	20001013          	.insn	4, 0x20001013
    17d7:	0000                	unimp
    17d9:	0100                	addi	s0,sp,128
    17db:	0112                	slli	sp,sp,0x4
    17dd:	0011                	c.nop	4
    17df:	c818                	sw	a4,16(s0)
    17e1:	3c001013          	.insn	4, 0x3c001013
    17e5:	0000                	unimp
    17e7:	2900                	.insn	2, 0x2900
    17e9:	000013a7          	.insn	4, 0x13a7
    17ed:	0029                	c.nop	10
    17ef:	0000                	unimp
    17f1:	1f01                	addi	t5,t5,-32
    17f3:	1f01                	addi	t5,t5,-32
    17f5:	0001                	nop
    17f7:	2100                	.insn	2, 0x2100
    17f9:	02a0                	addi	s0,sp,328
    17fb:	0000                	unimp
    17fd:	f729                	bnez	a4,1747 <$d.2+0xe8>
    17ff:	c5000013          	li	zero,-944
    1803:	0001                	nop
    1805:	0100                	addi	s0,sp,128
    1807:	0120                	addi	s0,sp,136
    1809:	00f1                	addi	ra,ra,28
    180b:	0000                	unimp
    180d:	0000                	unimp
    180f:	1d00                	addi	s0,sp,688
    1811:	02e2                	slli	t0,t0,0x18
    1813:	0000                	unimp
    1815:	1240                	addi	s0,sp,292
    1817:	0010                	.insn	2, 0x0010
    1819:	e21d                	bnez	a2,183f <$d.2+0x1e0>
    181b:	0002                	c.slli64	zero
    181d:	4c00                	lw	s0,24(s0)
    181f:	1012                	c.slli	zero,0x24
    1821:	1d00                	addi	s0,sp,688
    1823:	02e2                	slli	t0,t0,0x18
    1825:	0000                	unimp
    1827:	1274                	addi	a3,sp,300
    1829:	0010                	.insn	2, 0x0010
    182b:	e21d                	bnez	a2,1851 <$d.2+0x1f2>
    182d:	0002                	c.slli64	zero
    182f:	8c00                	.insn	2, 0x8c00
    1831:	1012                	c.slli	zero,0x24
    1833:	1d00                	addi	s0,sp,688
    1835:	02e2                	slli	t0,t0,0x18
    1837:	0000                	unimp
    1839:	12a4                	addi	s1,sp,360
    183b:	0010                	.insn	2, 0x0010
    183d:	e21d                	bnez	a2,1863 <$d.2+0x204>
    183f:	0002                	c.slli64	zero
    1841:	bc00                	.insn	2, 0xbc00
    1843:	1012                	c.slli	zero,0x24
    1845:	1d00                	addi	s0,sp,688
    1847:	02e2                	slli	t0,t0,0x18
    1849:	0000                	unimp
    184b:	12d4                	addi	a3,sp,356
    184d:	0010                	.insn	2, 0x0010
    184f:	e21d                	bnez	a2,1875 <$d.2+0x216>
    1851:	0002                	c.slli64	zero
    1853:	ec00                	.insn	2, 0xec00
    1855:	1012                	c.slli	zero,0x24
    1857:	1d00                	addi	s0,sp,688
    1859:	02e2                	slli	t0,t0,0x18
    185b:	0000                	unimp
    185d:	1304                	addi	s1,sp,416
    185f:	0010                	.insn	2, 0x0010
    1861:	e21d                	bnez	a2,1887 <$d.2+0x228>
    1863:	0002                	c.slli64	zero
    1865:	1800                	addi	s0,sp,48
    1867:	1d001013          	.insn	4, 0x1d001013
    186b:	000002ef          	jal	t0,186b <$d.2+0x20c>
    186f:	1324                	addi	s1,sp,424
    1871:	0010                	.insn	2, 0x0010
    1873:	e21d                	bnez	a2,1899 <$d.2+0x23a>
    1875:	0002                	c.slli64	zero
    1877:	5800                	lw	s0,48(s0)
    1879:	1d001013          	.insn	4, 0x1d001013
    187d:	02e2                	slli	t0,t0,0x18
    187f:	0000                	unimp
    1881:	1378                	addi	a4,sp,428
    1883:	0010                	.insn	2, 0x0010
    1885:	e21d                	bnez	a2,18ab <$d.2+0x24c>
    1887:	0002                	c.slli64	zero
    1889:	8400                	.insn	2, 0x8400
    188b:	1d001013          	.insn	4, 0x1d001013
    188f:	02e2                	slli	t0,t0,0x18
    1891:	0000                	unimp
    1893:	1390                	addi	a2,sp,480
    1895:	0010                	.insn	2, 0x0010
    1897:	e21d                	bnez	a2,18bd <$d.2+0x25e>
    1899:	0002                	c.slli64	zero
    189b:	a000                	.insn	2, 0xa000
    189d:	1d001013          	.insn	4, 0x1d001013
    18a1:	02e2                	slli	t0,t0,0x18
    18a3:	0000                	unimp
    18a5:	13bc                	addi	a5,sp,488
    18a7:	0010                	.insn	2, 0x0010
    18a9:	e21d                	bnez	a2,18cf <$d.2+0x270>
    18ab:	0002                	c.slli64	zero
    18ad:	c800                	sw	s0,16(s0)
    18af:	1d001013          	.insn	4, 0x1d001013
    18b3:	02e2                	slli	t0,t0,0x18
    18b5:	0000                	unimp
    18b7:	13ec                	addi	a1,sp,492
    18b9:	0010                	.insn	2, 0x0010
    18bb:	2d00                	.insn	2, 0x2d00
    18bd:	000005a7          	.insn	4, 0x05a7
    18c1:	e801                	bnez	s0,18d1 <$d.2+0x272>
    18c3:	0226                	slli	tp,tp,0x9
    18c5:	0000                	unimp
    18c7:	1401                	addi	s0,s0,-32
    18c9:	000001eb          	.insn	4, 0x01eb
    18cd:	e801                	bnez	s0,18dd <$d.2+0x27e>
    18cf:	000006d3          	.insn	4, 0x06d3
    18d3:	4b14                	lw	a3,16(a4)
    18d5:	0001                	nop
    18d7:	0100                	addi	s0,sp,128
    18d9:	d8e8                	sw	a0,116(s1)
    18db:	0006                	c.slli	zero,0x1
    18dd:	1500                	addi	s0,sp,672
    18df:	0182                	c.slli64	gp
    18e1:	0000                	unimp
    18e3:	e901                	bnez	a0,18f3 <$d.10+0x8>
    18e5:	06dd                	addi	a3,a3,23
    18e7:	0000                	unimp
    18e9:	1516                	slli	a0,a0,0x25
    18eb:	01c5                	addi	gp,gp,17
    18ed:	0000                	unimp
    18ef:	f301                	bnez	a4,17ef <$d.2+0x190>
    18f1:	0000003f 0005c015 	.insn	8, 0x0005c0150000003f
    18f9:	0100                	addi	s0,sp,128
    18fb:	0df4                	addi	a3,sp,732
    18fd:	0001                	nop
    18ff:	0000                	unimp
    1901:	0b00                	addi	s0,sp,400
    1903:	00d4                	addi	a3,sp,68
    1905:	0000                	unimp
    1907:	0006dd0b          	.insn	4, 0x0006dd0b
    190b:	0c00                	addi	s0,sp,528
    190d:	010d                	addi	sp,sp,3
    190f:	0000                	unimp
    1911:	0000014f          	.insn	4, 0x014f
    1915:	0c02                	c.slli64	s8
    1917:	10144827          	.insn	4, 0x10144827
    191b:	5000                	lw	s0,32(s0)
    191d:	0002                	c.slli64	zero
    191f:	0100                	addi	s0,sp,128
    1921:	2552                	.insn	2, 0x2552
    1923:	01000003          	lb	zero,16(zero) # 10 <$d.5+0x10>
    1927:	012a                	slli	sp,sp,0xa
    1929:	0a28                	addi	a0,sp,280
    192b:	0014                	.insn	2, 0x0014
    192d:	5000                	lw	s0,32(s0)
    192f:	0005                	c.nop	1
    1931:	0100                	addi	s0,sp,128
    1933:	012a                	slli	sp,sp,0xa
    1935:	0226                	slli	tp,tp,0x9
    1937:	0000                	unimp
    1939:	3328                	.insn	2, 0x3328
    193b:	0014                	.insn	2, 0x0014
    193d:	1d00                	addi	s0,sp,688
    193f:	0004                	.insn	2, 0x0004
    1941:	0100                	addi	s0,sp,128
    1943:	012a                	slli	sp,sp,0xa
    1945:	083d                	addi	a6,a6,15
    1947:	0000                	unimp
    1949:	002e                	c.slli	zero,0xb
    194b:	0342                	slli	t1,t1,0x10
    194d:	0000                	unimp
    194f:	2b01                	jal	1e5f <$d.7+0x17>
    1951:	4201                	li	tp,0
    1953:	0008                	.insn	2, 0x0008
    1955:	2e00                	.insn	2, 0x2e00
    1957:	0280                	addi	s0,sp,320
    1959:	051a                	slli	a0,a0,0x6
    195b:	0000                	unimp
    195d:	2c01                	jal	1b6d <$d.4+0xf1>
    195f:	4701                	li	a4,0
    1961:	0008                	.insn	2, 0x0008
    1963:	2e00                	.insn	2, 0x2e00
    1965:	2080                	.insn	2, 0x2080
    1967:	0255                	addi	tp,tp,21 # 15 <$d.5+0x15>
    1969:	0000                	unimp
    196b:	2d01                	jal	1f7b <$d.7+0x133>
    196d:	4701                	li	a4,0
    196f:	0008                	.insn	2, 0x0008
    1971:	2900                	.insn	2, 0x2900
    1973:	145c                	addi	a5,sp,548
    1975:	0000                	unimp
    1977:	00a4                	addi	s1,sp,72
    1979:	0000                	unimp
    197b:	2f01                	jal	208b <$d.7+0x243>
    197d:	dd01                	beqz	a0,1895 <$d.2+0x236>
    197f:	0006                	c.slli	zero,0x1
    1981:	2900                	.insn	2, 0x2900
    1983:	14a9                	addi	s1,s1,-22 # ffffffea <_stack_top+0xffef422a>
    1985:	0000                	unimp
    1987:	0000002f          	.insn	4, 0x002f
    198b:	3001                	jal	118b <$d.10+0x213>
    198d:	1f01                	addi	t5,t5,-32
    198f:	0001                	nop
    1991:	2100                	.insn	2, 0x2100
    1993:	02b8                	addi	a4,sp,328
    1995:	0000                	unimp
    1997:	9929                	andi	a0,a0,-22
    1999:	0015                	c.nop	5
    199b:	3600                	.insn	2, 0x3600
    199d:	0006                	c.slli	zero,0x1
    199f:	0100                	addi	s0,sp,128
    19a1:	06dd0133          	.insn	4, 0x06dd0133
    19a5:	0000                	unimp
    19a7:	8d2a                	mv	s10,a0
    19a9:	0006                	c.slli	zero,0x1
    19ab:	d800                	sw	s0,48(s0)
    19ad:	0002                	c.slli64	zero
    19af:	0100                	addi	s0,sp,128
    19b1:	0134                	addi	a3,sp,136
    19b3:	240d                	jal	1bd5 <$d.4+0x159>
    19b5:	000014e3          	bnez	zero,21bd <$d.7+0x375>
    19b9:	0699                	addi	a3,a3,6
    19bb:	0000                	unimp
    19bd:	df1a                	sw	t1,188(sp)
    19bf:	0015                	c.nop	5
    19c1:	af00                	.insn	2, 0xaf00
    19c3:	0006                	c.slli	zero,0x1
    19c5:	2100                	.insn	2, 0x2100
    19c7:	02f8                	addi	a4,sp,332
    19c9:	0000                	unimp
    19cb:	c11a                	sw	t1,128(sp)
    19cd:	0015                	c.nop	5
    19cf:	bb00                	.insn	2, 0xbb00
    19d1:	0006                	c.slli	zero,0x1
    19d3:	1a00                	addi	s0,sp,304
    19d5:	15fd                	addi	a1,a1,-1
    19d7:	0000                	unimp
    19d9:	06c6                	slli	a3,a3,0x11
    19db:	0000                	unimp
    19dd:	0000                	unimp
    19df:	2100                	.insn	2, 0x2100
    19e1:	0318                	addi	a4,sp,384
    19e3:	0000                	unimp
    19e5:	ad29                	j	1fff <$d.7+0x1b7>
    19e7:	0015                	c.nop	5
    19e9:	5900                	lw	s0,48(a0)
    19eb:	0001                	nop
    19ed:	0100                	addi	s0,sp,128
    19ef:	06dd013b          	.insn	4, 0x06dd013b
    19f3:	0000                	unimp
    19f5:	8d2a                	mv	s10,a0
    19f7:	0006                	c.slli	zero,0x1
    19f9:	3800                	.insn	2, 0x3800
    19fb:	01000003          	lb	zero,16(zero) # 10 <$d.5+0x10>
    19ff:	013c                	addi	a5,sp,136
    1a01:	240d                	jal	1c23 <$d.5+0x2c>
    1a03:	153e                	slli	a0,a0,0x2f
    1a05:	0000                	unimp
    1a07:	0699                	addi	a3,a3,6
    1a09:	0000                	unimp
    1a0b:	2e1a                	.insn	2, 0x2e1a
    1a0d:	0016                	c.slli	zero,0x5
    1a0f:	af00                	.insn	2, 0xaf00
    1a11:	0006                	c.slli	zero,0x1
    1a13:	2100                	.insn	2, 0x2100
    1a15:	0358                	addi	a4,sp,388
    1a17:	0000                	unimp
    1a19:	101a                	c.slli	zero,0x26
    1a1b:	0016                	c.slli	zero,0x5
    1a1d:	bb00                	.insn	2, 0xbb00
    1a1f:	0006                	c.slli	zero,0x1
    1a21:	1a00                	addi	s0,sp,304
    1a23:	164c                	addi	a1,sp,804
    1a25:	0000                	unimp
    1a27:	06c6                	slli	a3,a3,0x11
    1a29:	0000                	unimp
    1a2b:	0000                	unimp
    1a2d:	1c00                	addi	s0,sp,560
    1a2f:	000002ef          	jal	t0,1a2f <$d.10+0x144>
    1a33:	156c                	addi	a1,sp,684
    1a35:	0010                	.insn	2, 0x0010
    1a37:	ef1d                	bnez	a4,1a75 <$d.10+0x18a>
    1a39:	0002                	c.slli64	zero
    1a3b:	7400                	.insn	2, 0x7400
    1a3d:	1016                	c.slli	zero,0x25
    1a3f:	1c00                	addi	s0,sp,560
    1a41:	04d9                	addi	s1,s1,22
    1a43:	0000                	unimp
    1a45:	1698                	addi	a4,sp,864
    1a47:	0010                	.insn	2, 0x0010
    1a49:	2f00                	.insn	2, 0x2f00
    1a4b:	00003f03          	.insn	4, 0x3f03
    1a4f:	0400                	addi	s0,sp,512
    1a51:	0046                	c.slli	zero,0x11
    1a53:	0000                	unimp
    1a55:	000a                	c.slli	zero,0x2
    1a57:	1b30                	addi	a2,sp,440
    1a59:	0008                	.insn	2, 0x0008
    1a5b:	c200                	sw	s0,0(a2)
    1a5d:	0005                	c.nop	1
    1a5f:	0300                	addi	s0,sp,384
    1a61:	0000003f 00004604 	.insn	8, 0x46040000003f
    1a69:	0b00                	addi	s0,sp,400
    1a6b:	0b00                	addi	s0,sp,400
    1a6d:	000006d3          	.insn	4, 0x06d3
    1a71:	dd0a                	sw	sp,184(sp)
    1a73:	0006                	c.slli	zero,0x1
    1a75:	0a00                	addi	s0,sp,272
    1a77:	011f 0000       	.insn	6, 0xc8000000011f

00001a7c <$d.4>:
    1a7c:	03c8                	addi	a0,sp,452
    1a7e:	0000                	unimp
    1a80:	0004                	.insn	2, 0x0004
    1a82:	000004bb          	.insn	4, 0x04bb
    1a86:	0104                	addi	s1,sp,128
    1a88:	0282                	c.slli64	t0
    1a8a:	0000                	unimp
    1a8c:	001d                	c.nop	7
    1a8e:	020c                	addi	a1,sp,256
    1a90:	0000                	unimp
    1a92:	000018eb          	.insn	4, 0x18eb
    1a96:	0000046b          	.insn	4, 0x046b
    1a9a:	1698                	addi	a4,sp,864
    1a9c:	0010                	.insn	2, 0x0010
    1a9e:	042c                	addi	a1,sp,520
    1aa0:	0000                	unimp
    1aa2:	3302                	.insn	2, 0x3302
    1aa4:	0000                	unimp
    1aa6:	0100                	addi	s0,sp,128
    1aa8:	0562                	slli	a0,a0,0x18
    1aaa:	10312a03          	lw	s4,259(sp)
    1aae:	0300                	addi	s0,sp,384
    1ab0:	0000003f 00004604 	.insn	8, 0x46040000003f
    1ab8:	1400                	addi	s0,sp,544
    1aba:	0500                	addi	s0,sp,640
    1abc:	040d                	addi	s0,s0,3
    1abe:	0000                	unimp
    1ac0:	0108                	addi	a0,sp,128
    1ac2:	8506                	mv	a0,ra
    1ac4:	0005                	c.nop	1
    1ac6:	0800                	addi	s0,sp,16
    1ac8:	005a0207          	.insn	4, 0x005a0207
    1acc:	0000                	unimp
    1ace:	6f01                	.insn	2, 0x6f01
    1ad0:	0305                	addi	t1,t1,1
    1ad2:	001031c3          	.insn	4, 0x001031c3
    1ad6:	00003f03          	.insn	4, 0x3f03
    1ada:	0400                	addi	s0,sp,512
    1adc:	0046                	c.slli	zero,0x11
    1ade:	0000                	unimp
    1ae0:	73020013          	addi	zero,tp,1840 # 730 <$d.6+0xbd>
    1ae4:	0000                	unimp
    1ae6:	0100                	addi	s0,sp,128
    1ae8:	4b030573          	.insn	4, 0x4b030573
    1aec:	1032                	c.slli	zero,0x2c
    1aee:	0300                	addi	s0,sp,384
    1af0:	0000003f 00004604 	.insn	8, 0x46040000003f
    1af8:	2100                	.insn	2, 0x2100
    1afa:	0200                	addi	s0,sp,256
    1afc:	00000033          	add	zero,zero,zero
    1b00:	7901                	lui	s2,0xfffe0
    1b02:	0305                	addi	t1,t1,1
    1b04:	0010305b          	.insn	4, 0x0010305b
    1b08:	00009107          	.insn	4, 0x9107
    1b0c:	0800                	addi	s0,sp,16
    1b0e:	0096                	slli	ra,ra,0x5
    1b10:	0000                	unimp
    1b12:	a109                	j	1f14 <$d.7+0xcc>
    1b14:	0000                	unimp
    1b16:	1300                	addi	s0,sp,416
    1b18:	02000003          	lb	zero,32(zero) # 20 <$d.5+0x20>
    1b1c:	0509                	addi	a0,a0,2
    1b1e:	0526                	slli	a0,a0,0x9
    1b20:	0000                	unimp
    1b22:	68050407          	.insn	4, 0x68050407
    1b26:	08000003          	lb	zero,128(zero) # 80 <$d.10+0x2c>
    1b2a:	0901                	addi	s2,s2,0 # fffe0000 <_stack_top+0xffed4240>
    1b2c:	00ba                	slli	ra,ra,0xe
    1b2e:	0000                	unimp
    1b30:	008a                	slli	ra,ra,0x2
    1b32:	0000                	unimp
    1b34:	0802                	c.slli64	a6
    1b36:	0005                	c.nop	1
    1b38:	0000                	unimp
    1b3a:	0700                	addi	s0,sp,896
    1b3c:	0a02                	c.slli64	s4
    1b3e:	1698                	addi	a4,sp,864
    1b40:	0010                	.insn	2, 0x0010
    1b42:	0008                	.insn	2, 0x0008
    1b44:	0000                	unimp
    1b46:	5201                	li	tp,-32
    1b48:	00000033          	add	zero,zero,zero
    1b4c:	5101                	li	sp,-32
    1b4e:	0215                	addi	tp,tp,5 # 5 <$d.5+0x5>
    1b50:	0000                	unimp
    1b52:	785a010b          	.insn	4, 0x785a010b
    1b56:	0006                	c.slli	zero,0x1
    1b58:	0100                	addi	s0,sp,128
    1b5a:	9651                	srai	a2,a2,0x34
    1b5c:	0000                	unimp
    1b5e:	0b00                	addi	s0,sp,400
    1b60:	5b01                	li	s6,-32
    1b62:	017e                	slli	sp,sp,0x1f
    1b64:	0000                	unimp
    1b66:	5101                	li	sp,-32
    1b68:	039d                	addi	t2,t2,7
    1b6a:	0000                	unimp
    1b6c:	fa0c                	.insn	2, 0xfa0c
    1b6e:	0000                	unimp
    1b70:	a000                	.insn	2, 0xa000
    1b72:	1016                	c.slli	zero,0x25
    1b74:	0000                	unimp
    1b76:	a00d                	j	1b98 <$d.4+0x11c>
    1b78:	1016                	c.slli	zero,0x25
    1b7a:	cc00                	sw	s0,24(s0)
    1b7c:	0001                	nop
    1b7e:	0100                	addi	s0,sp,128
    1b80:	9852                	add	a6,a6,s4
    1b82:	0001                	nop
    1b84:	0100                	addi	s0,sp,128
    1b86:	1512                	slli	a0,a0,0x24
    1b88:	0002                	c.slli64	zero
    1b8a:	0e00                	addi	s0,sp,784
    1b8c:	165f 0000 00f2      	.insn	6, 0x00f20000165f
    1b92:	0000                	unimp
    1b94:	1201                	addi	tp,tp,-32 # ffffffe0 <_stack_top+0xffef4220>
    1b96:	0096                	slli	ra,ra,0x5
    1b98:	0000                	unimp
    1b9a:	7e5b010b          	.insn	4, 0x7e5b010b
    1b9e:	0001                	nop
    1ba0:	0100                	addi	s0,sp,128
    1ba2:	ad12                	.insn	2, 0xad12
    1ba4:	0f000003          	lb	zero,240(zero) # f0 <$d.4+0x4d>
    1ba8:	16aa                	slli	a3,a3,0x2a
    1baa:	0000                	unimp
    1bac:	00000533          	add	a0,zero,zero
    1bb0:	1401                	addi	s0,s0,-32
    1bb2:	0096                	slli	ra,ra,0x5
    1bb4:	0000                	unimp
    1bb6:	ba10                	.insn	2, 0xba10
    1bb8:	0001                	nop
    1bba:	b000                	.insn	2, 0xb000
    1bbc:	1016                	c.slli	zero,0x25
    1bbe:	0c00                	addi	s0,sp,528
    1bc0:	0000                	unimp
    1bc2:	0100                	addi	s0,sp,128
    1bc4:	0519                	addi	a0,a0,6
    1bc6:	7d11                	lui	s10,0xfffe4
    1bc8:	0016                	c.slli	zero,0x5
    1bca:	c200                	sw	s0,0(a2)
    1bcc:	0001                	nop
    1bce:	0000                	unimp
    1bd0:	ba10                	.insn	2, 0xba10
    1bd2:	0001                	nop
    1bd4:	fc00                	.insn	2, 0xfc00
    1bd6:	1016                	c.slli	zero,0x25
    1bd8:	0c00                	addi	s0,sp,528
    1bda:	0000                	unimp
    1bdc:	0100                	addi	s0,sp,128
    1bde:	0526                	slli	a0,a0,0x9
    1be0:	9c11                	.insn	2, 0x9c11
    1be2:	c2000017          	auipc	zero,0xc2000
    1be6:	0001                	nop
    1be8:	0000                	unimp
    1bea:	ba10                	.insn	2, 0xba10
    1bec:	0001                	nop
    1bee:	1c00                	addi	s0,sp,560
    1bf0:	0c001017          	auipc	zero,0xc001
    1bf4:	0000                	unimp
    1bf6:	0100                	addi	s0,sp,128
    1bf8:	052d                	addi	a0,a0,11
    1bfa:	c911                	beqz	a0,1c0e <$d.5+0x17>
    1bfc:	c2000017          	auipc	zero,0xc2000
    1c00:	0001                	nop
    1c02:	0000                	unimp
    1c04:	ba10                	.insn	2, 0xba10
    1c06:	0001                	nop
    1c08:	5400                	lw	s0,40(s0)
    1c0a:	d8001017          	auipc	zero,0xd8001
    1c0e:	0000                	unimp
    1c10:	0100                	addi	s0,sp,128
    1c12:	0535                	addi	a0,a0,13
    1c14:	f611                	bnez	a2,1b20 <$d.4+0xa4>
    1c16:	c2000017          	auipc	zero,0xc2000
    1c1a:	0001                	nop
    1c1c:	0000                	unimp
    1c1e:	3012                	.insn	2, 0x3012
    1c20:	1018                	addi	a4,sp,32
    1c22:	3000                	.insn	2, 0x3000
    1c24:	0000                	unimp
    1c26:	1300                	addi	s0,sp,416
    1c28:	5c01                	li	s8,-32
    1c2a:	0029                	c.nop	10
    1c2c:	0000                	unimp
    1c2e:	3801                	jal	143e <$d.4+0x20f>
    1c30:	0215                	addi	tp,tp,5 # 5 <$d.5+0x5>
    1c32:	0000                	unimp
    1c34:	0000                	unimp
    1c36:	0f14                	addi	a3,sp,912
    1c38:	0000                	unimp
    1c3a:	0100                	addi	s0,sp,128
    1c3c:	010c                	addi	a1,sp,128
    1c3e:	d915                	beqz	a0,1b72 <$d.4+0xf6>
    1c40:	0000                	unimp
    1c42:	0100                	addi	s0,sp,128
    1c44:	a10c                	.insn	2, 0xa10c
    1c46:	0000                	unimp
    1c48:	0000                	unimp
    1c4a:	b616                	.insn	2, 0xb616
    1c4c:	0002                	c.slli64	zero
    1c4e:	0100                	addi	s0,sp,128
    1c50:	0000af43          	.insn	4, 0xaf43
    1c54:	0100                	addi	s0,sp,128
    1c56:	7e15                	lui	t3,0xfffe5
    1c58:	0001                	nop
    1c5a:	0100                	addi	s0,sp,128
    1c5c:	00020b43          	.insn	4, 0x00020b43
    1c60:	1700                	addi	s0,sp,928
    1c62:	01ed                	addi	gp,gp,27
    1c64:	0000                	unimp
    1c66:	4501                	li	a0,0
    1c68:	000000af          	.insn	4, 0x00af
    1c6c:	1718                	addi	a4,sp,928
    1c6e:	0029                	c.nop	10
    1c70:	0000                	unimp
    1c72:	4701                	li	a4,0
    1c74:	0215                	addi	tp,tp,5 # 5 <$d.5+0x5>
    1c76:	0000                	unimp
    1c78:	1718                	addi	a4,sp,928
    1c7a:	000006bf 02154901 	.insn	8, 0x02154901000006bf
    1c82:	0000                	unimp
    1c84:	0000                	unimp
    1c86:	0700                	addi	s0,sp,896
    1c88:	0210                	addi	a2,sp,256
    1c8a:	0000                	unimp
    1c8c:	a819                	j	1ca2 <$d.13+0x66>
    1c8e:	0000                	unimp
    1c90:	0500                	addi	s0,sp,640
    1c92:	0412                	slli	s0,s0,0x4
    1c94:	0000                	unimp
    1c96:	0405                	addi	s0,s0,1
    1c98:	6c1a                	.insn	2, 0x6c1a
    1c9a:	1018                	addi	a4,sp,32
    1c9c:	5800                	lw	s0,48(s0)
    1c9e:	0002                	c.slli64	zero
    1ca0:	0100                	addi	s0,sp,128
    1ca2:	6152                	.insn	2, 0x6152
    1ca4:	0006                	c.slli	zero,0x1
    1ca6:	0100                	addi	s0,sp,128
    1ca8:	0e58                	addi	a4,sp,788
    1caa:	1a76                	slli	s4,s4,0x3d
    1cac:	0000                	unimp
    1cae:	00f2                	slli	ra,ra,0x1c
    1cb0:	0000                	unimp
    1cb2:	5801                	li	a6,-32
    1cb4:	0096                	slli	ra,ra,0x5
    1cb6:	0000                	unimp
    1cb8:	0c910213          	addi	tp,sp,201
    1cbc:	017e                	slli	sp,sp,0x1f
    1cbe:	0000                	unimp
    1cc0:	5a01                	li	s4,-32
    1cc2:	03b2                	slli	t2,t2,0xc
    1cc4:	0000                	unimp
    1cc6:	034f001b          	.insn	4, 0x034f001b
    1cca:	0000                	unimp
    1ccc:	5d01                	li	s10,-32
    1cce:	0215                	addi	tp,tp,5 # 5 <$d.5+0x5>
    1cd0:	0000                	unimp
    1cd2:	0422031b          	.insn	4, 0x0422031b
    1cd6:	0000                	unimp
    1cd8:	5c01                	li	s8,-32
    1cda:	0215                	addi	tp,tp,5 # 5 <$d.5+0x5>
    1cdc:	0000                	unimp
    1cde:	00010417          	auipc	s0,0x10
    1ce2:	0100                	addi	s0,sp,128
    1ce4:	bf7d                	j	1ca2 <$d.13+0x66>
    1ce6:	1c000003          	lb	zero,448(zero) # 1c0 <$d.9+0x4c>
    1cea:	0378                	addi	a4,sp,396
    1cec:	0000                	unimp
    1cee:	001a940f          	.insn	4, 0x001a940f
    1cf2:	6700                	.insn	2, 0x6700
    1cf4:	0005                	c.nop	1
    1cf6:	0100                	addi	s0,sp,128
    1cf8:	155f 0002 1c00      	.insn	6, 0x1c000002155f
    1cfe:	0390                	addi	a2,sp,448
    1d00:	0000                	unimp
    1d02:	001abf0f          	.insn	4, 0x001abf0f
    1d06:	9900                	.insn	2, 0x9900
    1d08:	0005                	c.nop	1
    1d0a:	0100                	addi	s0,sp,128
    1d0c:	00009667          	.insn	4, 0x9667
    1d10:	0f00                	addi	s0,sp,912
    1d12:	1bc2                	slli	s7,s7,0x30
    1d14:	0000                	unimp
    1d16:	01ed                	addi	gp,gp,27
    1d18:	0000                	unimp
    1d1a:	6c01                	.insn	2, 0x6c01
    1d1c:	000000af          	.insn	4, 0x00af
    1d20:	001bd50f          	.insn	4, 0x001bd50f
    1d24:	c600                	sw	s0,8(a2)
    1d26:	0000                	unimp
    1d28:	0100                	addi	s0,sp,128
    1d2a:	af68                	.insn	2, 0xaf68
    1d2c:	0000                	unimp
    1d2e:	1000                	addi	s0,sp,32
    1d30:	01ce                	slli	gp,gp,0x13
    1d32:	0000                	unimp
    1d34:	18fc                	addi	a5,sp,124
    1d36:	0010                	.insn	2, 0x0010
    1d38:	00d4                	addi	a3,sp,68
    1d3a:	0000                	unimp
    1d3c:	6c01                	.insn	2, 0x6c01
    1d3e:	1d18                	addi	a4,sp,688
    1d40:	9f0c9103          	lh	sp,-1552(s9)
    1d44:	01da                	slli	gp,gp,0x16
    1d46:	0000                	unimp
    1d48:	fd1e                	.insn	2, 0xfd1e
    1d4a:	001a                	c.slli	zero,0x6
    1d4c:	e500                	.insn	2, 0xe500
    1d4e:	0001                	nop
    1d50:	1200                	addi	s0,sp,288
    1d52:	18fc                	addi	a5,sp,124
    1d54:	0010                	.insn	2, 0x0010
    1d56:	00d4                	addi	a3,sp,68
    1d58:	0000                	unimp
    1d5a:	d21e                	sw	t2,36(sp)
    1d5c:	001a                	c.slli	zero,0x6
    1d5e:	f100                	.insn	2, 0xf100
    1d60:	0001                	nop
    1d62:	1c00                	addi	s0,sp,560
    1d64:	03b0                	addi	a2,sp,456
    1d66:	0000                	unimp
    1d68:	521e                	lw	tp,228(sp)
    1d6a:	fd00001b          	.insn	4, 0xfd00001b
    1d6e:	0001                	nop
    1d70:	0000                	unimp
    1d72:	0000                	unimp
    1d74:	0000                	unimp
    1d76:	3c12                	.insn	2, 0x3c12
    1d78:	101a                	c.slli	zero,0x26
    1d7a:	5c00                	lw	s0,56(s0)
    1d7c:	0000                	unimp
    1d7e:	1300                	addi	s0,sp,416
    1d80:	5801                	li	a6,-32
    1d82:	0029                	c.nop	10
    1d84:	0000                	unimp
    1d86:	7f01                	lui	t5,0xfffe0
    1d88:	0215                	addi	tp,tp,5 # 5 <$d.5+0x5>
    1d8a:	0000                	unimp
    1d8c:	4412                	lw	s0,4(sp)
    1d8e:	101a                	c.slli	zero,0x26
    1d90:	5400                	lw	s0,40(s0)
    1d92:	0000                	unimp
    1d94:	1700                	addi	s0,sp,928
    1d96:	05c0                	addi	s0,sp,708
    1d98:	0000                	unimp
    1d9a:	8001                	c.srli64	s0
    1d9c:	00a8                	addi	a0,sp,72
    1d9e:	0000                	unimp
    1da0:	0000                	unimp
    1da2:	781f 0003 d400      	.insn	6, 0xd4000003781f
    1da8:	1018                	addi	a4,sp,32
    1daa:	1f00                	addi	s0,sp,944
    1dac:	00fa                	slli	ra,ra,0x1e
    1dae:	0000                	unimp
    1db0:	18ec                	addi	a1,sp,124
    1db2:	0010                	.insn	2, 0x0010
    1db4:	781f 0003 f000      	.insn	6, 0xf0000003781f
    1dba:	1019                	c.nop	-26
    1dbc:	1f00                	addi	s0,sp,944
    1dbe:	0378                	addi	a4,sp,396
    1dc0:	0000                	unimp
    1dc2:	1a08                	addi	a0,sp,304
    1dc4:	0010                	.insn	2, 0x0010
    1dc6:	781f 0003 2000      	.insn	6, 0x20000003781f
    1dcc:	101a                	c.slli	zero,0x26
    1dce:	1f00                	addi	s0,sp,944
    1dd0:	0390                	addi	a2,sp,448
    1dd2:	0000                	unimp
    1dd4:	1a60                	addi	s0,sp,316
    1dd6:	0010                	.insn	2, 0x0010
    1dd8:	901f 0003 7400      	.insn	6, 0x74000003901f
    1dde:	101a                	c.slli	zero,0x26
    1de0:	1f00                	addi	s0,sp,944
    1de2:	0390                	addi	a2,sp,448
    1de4:	0000                	unimp
    1de6:	1a80                	addi	s0,sp,368
    1de8:	0010                	.insn	2, 0x0010
    1dea:	901f 0003 9400      	.insn	6, 0x94000003901f
    1df0:	101a                	c.slli	zero,0x26
    1df2:	0000                	unimp
    1df4:	a020                	.insn	2, 0xa020
    1df6:	0004                	.insn	2, 0x0004
    1df8:	0200                	addi	s0,sp,256
    1dfa:	03862127          	.insn	4, 0x03862127
    1dfe:	0000                	unimp
    1e00:	0022                	c.slli	zero,0x8
    1e02:	00038b07          	.insn	4, 0x00038b07
    1e06:	1900                	addi	s0,sp,176
    1e08:	0000003f 0006ef20 	.insn	8, 0x0006ef200000003f
    1e10:	0300                	addi	s0,sp,384
    1e12:	214c                	.insn	2, 0x214c
    1e14:	0000003f 03a20700 	.insn	8, 0x03a207000000003f
    1e1c:	0000                	unimp
    1e1e:	a809                	j	1e30 <$d.13+0x1f4>
    1e20:	0000                	unimp
    1e22:	b600                	.insn	2, 0xb600
    1e24:	0005                	c.nop	1
    1e26:	0200                	addi	s0,sp,256
    1e28:	00a80707          	.insn	4, 0x00a80707
    1e2c:	0000                	unimp
    1e2e:	0000a803          	lw	a6,0(ra)
    1e32:	2300                	.insn	2, 0x2300
    1e34:	0046                	c.slli	zero,0x11
    1e36:	0000                	unimp
    1e38:	0200                	addi	s0,sp,256
    1e3a:	0300                	addi	s0,sp,384
    1e3c:	0000038b          	.insn	4, 0x038b
    1e40:	4604                	lw	s1,8(a2)
    1e42:	0000                	unimp
    1e44:	1100                	addi	s0,sp,160
	...

00001e48 <$d.7>:
    1e48:	11b1                	addi	gp,gp,-20
    1e4a:	0000                	unimp
    1e4c:	0004                	.insn	2, 0x0004
    1e4e:	00000673          	.insn	4, 0x0673
    1e52:	0104                	addi	s1,sp,128
    1e54:	0282                	c.slli64	t0
    1e56:	0000                	unimp
    1e58:	001d                	c.nop	7
    1e5a:	04e8                	addi	a0,sp,588
    1e5c:	0000                	unimp
    1e5e:	1c3c                	addi	a5,sp,568
    1e60:	0000                	unimp
    1e62:	0000046b          	.insn	4, 0x046b
    1e66:	1ac4                	addi	s1,sp,372
    1e68:	0010                	.insn	2, 0x0010
    1e6a:	1484                	addi	s1,sp,608
    1e6c:	0000                	unimp
    1e6e:	3302                	.insn	2, 0x3302
    1e70:	0000                	unimp
    1e72:	0100                	addi	s0,sp,128
    1e74:	054c                	addi	a1,sp,644
    1e76:	10341203          	lh	tp,259(s0) # 11de1 <$d.7+0xff99>
    1e7a:	0300                	addi	s0,sp,384
    1e7c:	0000003f 00004604 	.insn	8, 0x46040000003f
    1e84:	1000                	addi	s0,sp,32
    1e86:	0500                	addi	s0,sp,640
    1e88:	040d                	addi	s0,s0,3
    1e8a:	0000                	unimp
    1e8c:	0108                	addi	a0,sp,128
    1e8e:	8506                	mv	a0,ra
    1e90:	0005                	c.nop	1
    1e92:	0800                	addi	s0,sp,16
    1e94:	005a0207          	.insn	4, 0x005a0207
    1e98:	0000                	unimp
    1e9a:	6901                	.insn	2, 0x6901
    1e9c:	0305                	addi	t1,t1,1
    1e9e:	3679                	jal	1a2c <$d.10+0x141>
    1ea0:	0010                	.insn	2, 0x0010
    1ea2:	00003f03          	.insn	4, 0x3f03
    1ea6:	0400                	addi	s0,sp,512
    1ea8:	0046                	c.slli	zero,0x11
    1eaa:	0000                	unimp
    1eac:	0014                	.insn	2, 0x0014
    1eae:	7302                	.insn	2, 0x7302
    1eb0:	0000                	unimp
    1eb2:	0100                	addi	s0,sp,128
    1eb4:	056e                	slli	a0,a0,0x1b
    1eb6:	1033c603          	lbu	a2,259(t2)
    1eba:	0300                	addi	s0,sp,384
    1ebc:	0000003f 00004604 	.insn	8, 0x46040000003f
    1ec4:	1900                	addi	s0,sp,176
    1ec6:	0200                	addi	s0,sp,256
    1ec8:	008c                	addi	a1,sp,64
    1eca:	0000                	unimp
    1ecc:	7201                	lui	tp,0xfffe0
    1ece:	0305                	addi	t1,t1,1
    1ed0:	35f9                	jal	1d9e <$d.13+0x162>
    1ed2:	0010                	.insn	2, 0x0010
    1ed4:	00003f03          	.insn	4, 0x3f03
    1ed8:	0400                	addi	s0,sp,512
    1eda:	0046                	c.slli	zero,0x11
    1edc:	0000                	unimp
    1ede:	0012                	c.slli	zero,0x4
    1ee0:	7302                	.insn	2, 0x7302
    1ee2:	0000                	unimp
    1ee4:	0100                	addi	s0,sp,128
    1ee6:	0575                	addi	a0,a0,29
    1ee8:	10342203          	lw	tp,259(s0)
    1eec:	0200                	addi	s0,sp,256
    1eee:	00b2                	slli	ra,ra,0xc
    1ef0:	0000                	unimp
    1ef2:	7901                	lui	s2,0xfffe0
    1ef4:	0305                	addi	t1,t1,1
    1ef6:	3220                	.insn	2, 0x3220
    1ef8:	0010                	.insn	2, 0x0010
    1efa:	00003f03          	.insn	4, 0x3f03
    1efe:	0400                	addi	s0,sp,512
    1f00:	0046                	c.slli	zero,0x11
    1f02:	0000                	unimp
    1f04:	0015                	c.nop	5
    1f06:	b202                	.insn	2, 0xb202
    1f08:	0000                	unimp
    1f0a:	0100                	addi	s0,sp,128
    1f0c:	057d                	addi	a0,a0,31
    1f0e:	10359503          	lh	a0,259(a1)
    1f12:	0200                	addi	s0,sp,256
    1f14:	005a                	c.slli	zero,0x16
    1f16:	0000                	unimp
    1f18:	8001                	c.srli64	s0
    1f1a:	0305                	addi	t1,t1,1
    1f1c:	32d8                	.insn	2, 0x32d8
    1f1e:	0010                	.insn	2, 0x0010
    1f20:	3302                	.insn	2, 0x3302
    1f22:	0000                	unimp
    1f24:	0100                	addi	s0,sp,128
    1f26:	0586                	slli	a1,a1,0x1
    1f28:	10364803          	lbu	a6,259(a2)
    1f2c:	0200                	addi	s0,sp,256
    1f2e:	00f2                	slli	ra,ra,0x1c
    1f30:	0000                	unimp
    1f32:	8901                	andi	a0,a0,0
    1f34:	0305                	addi	t1,t1,1
    1f36:	3328                	.insn	2, 0x3328
    1f38:	0010                	.insn	2, 0x0010
    1f3a:	00003f03          	.insn	4, 0x3f03
    1f3e:	0400                	addi	s0,sp,512
    1f40:	0046                	c.slli	zero,0x11
    1f42:	0000                	unimp
    1f44:	0016                	c.slli	zero,0x5
    1f46:	0b02                	c.slli64	s6
    1f48:	0001                	nop
    1f4a:	0100                	addi	s0,sp,128
    1f4c:	058d                	addi	a1,a1,3
    1f4e:	1034b203          	.insn	4, 0x1034b203
    1f52:	0300                	addi	s0,sp,384
    1f54:	0000003f 00004604 	.insn	8, 0x46040000003f
    1f5c:	1100                	addi	s0,sp,160
    1f5e:	0200                	addi	s0,sp,256
    1f60:	0124                	addi	s1,sp,136
    1f62:	0000                	unimp
    1f64:	9001                	srli	s0,s0,0x20
    1f66:	0305                	addi	t1,t1,1
    1f68:	3198                	.insn	2, 0x3198
    1f6a:	0010                	.insn	2, 0x0010
    1f6c:	00003f03          	.insn	4, 0x3f03
    1f70:	0400                	addi	s0,sp,512
    1f72:	0046                	c.slli	zero,0x11
    1f74:	0000                	unimp
    1f76:	0018                	.insn	2, 0x0018
    1f78:	5a02                	lw	s4,32(sp)
    1f7a:	0000                	unimp
    1f7c:	0100                	addi	s0,sp,128
    1f7e:	0594                	addi	a3,sp,704
    1f80:	10306f03          	.insn	4, 0x10306f03
    1f84:	0200                	addi	s0,sp,256
    1f86:	005a                	c.slli	zero,0x16
    1f88:	0000                	unimp
    1f8a:	9701                	srai	a4,a4,0x20
    1f8c:	0305                	addi	t1,t1,1
    1f8e:	3036                	.insn	2, 0x3036
    1f90:	0010                	.insn	2, 0x0010
    1f92:	8c02                	jr	s8
    1f94:	0000                	unimp
    1f96:	0100                	addi	s0,sp,128
    1f98:	8303059b          	.insn	4, 0x8303059b
    1f9c:	1030                	addi	a2,sp,40
    1f9e:	0200                	addi	s0,sp,256
    1fa0:	00000033          	add	zero,zero,zero
    1fa4:	9e01                	.insn	2, 0x9e01
    1fa6:	0305                	addi	t1,t1,1
    1fa8:	31d6                	.insn	2, 0x31d6
    1faa:	0010                	.insn	2, 0x0010
    1fac:	3302                	.insn	2, 0x3302
    1fae:	0000                	unimp
    1fb0:	0100                	addi	s0,sp,128
    1fb2:	05a1                	addi	a1,a1,8
    1fb4:	10309503          	lh	a0,259(ra)
    1fb8:	0200                	addi	s0,sp,256
    1fba:	00000033          	add	zero,zero,zero
    1fbe:	a401                	j	21be <$d.7+0x376>
    1fc0:	0305                	addi	t1,t1,1
    1fc2:	353a                	.insn	2, 0x353a
    1fc4:	0010                	.insn	2, 0x0010
    1fc6:	3302                	.insn	2, 0x3302
    1fc8:	0000                	unimp
    1fca:	0100                	addi	s0,sp,128
    1fcc:	500305a7          	.insn	4, 0x500305a7
    1fd0:	02001037          	lui	zero,0x2001
    1fd4:	00000033          	add	zero,zero,zero
    1fd8:	aa01                	j	20e8 <$d.7+0x2a0>
    1fda:	0305                	addi	t1,t1,1
    1fdc:	3658                	.insn	2, 0x3658
    1fde:	0010                	.insn	2, 0x0010
    1fe0:	3302                	.insn	2, 0x3302
    1fe2:	0000                	unimp
    1fe4:	0100                	addi	s0,sp,128
    1fe6:	05ad                	addi	a1,a1,11
    1fe8:	1035aa03          	lw	s4,259(a1)
    1fec:	0200                	addi	s0,sp,256
    1fee:	0000010b          	.insn	4, 0x010b
    1ff2:	b001                	j	17f2 <$d.2+0x193>
    1ff4:	0305                	addi	t1,t1,1
    1ff6:	313e                	.insn	2, 0x313e
    1ff8:	0010                	.insn	2, 0x0010
    1ffa:	3302                	.insn	2, 0x3302
    1ffc:	0000                	unimp
    1ffe:	0100                	addi	s0,sp,128
    2000:	600305b3          	.insn	4, 0x600305b3
    2004:	02001037          	lui	zero,0x2001
    2008:	00000033          	add	zero,zero,zero
    200c:	b801                	j	181c <$d.2+0x1bd>
    200e:	0305                	addi	t1,t1,1
    2010:	36b8                	.insn	2, 0x36b8
    2012:	0010                	.insn	2, 0x0010
    2014:	b202                	.insn	2, 0xb202
    2016:	0000                	unimp
    2018:	0100                	addi	s0,sp,128
    201a:	05bd                	addi	a1,a1,15
    201c:	1032ec03          	.insn	4, 0x1032ec03
    2020:	0200                	addi	s0,sp,256
    2022:	00f2                	slli	ra,ra,0x1c
    2024:	0000                	unimp
    2026:	c201                	beqz	a2,2026 <$d.7+0x1de>
    2028:	0305                	addi	t1,t1,1
    202a:	328e                	.insn	2, 0x328e
    202c:	0010                	.insn	2, 0x0010
    202e:	b202                	.insn	2, 0xb202
    2030:	0000                	unimp
    2032:	0100                	addi	s0,sp,128
    2034:	e60305c7          	.insn	4, 0xe60305c7
    2038:	1031                	c.nop	-20
    203a:	0200                	addi	s0,sp,256
    203c:	00000073          	ecall
    2040:	cc01                	beqz	s0,2058 <$d.7+0x210>
    2042:	0305                	addi	t1,t1,1
    2044:	2fdc                	.insn	2, 0x2fdc
    2046:	0010                	.insn	2, 0x0010
    2048:	0d02                	c.slli64	s10
    204a:	0002                	c.slli64	zero
    204c:	0100                	addi	s0,sp,128
    204e:	05d0                	addi	a2,sp,708
    2050:	10330103          	lb	sp,259(t1)
    2054:	0300                	addi	s0,sp,384
    2056:	0000003f 00004604 	.insn	8, 0x46040000003f
    205e:	1300                	addi	s0,sp,416
    2060:	0200                	addi	s0,sp,256
    2062:	008c                	addi	a1,sp,64
    2064:	0000                	unimp
    2066:	d301                	beqz	a4,1f66 <$d.7+0x11e>
    2068:	0305                	addi	t1,t1,1
    206a:	30a5                	jal	18d2 <$d.2+0x273>
    206c:	0010                	.insn	2, 0x0010
    206e:	0d02                	c.slli64	s10
    2070:	0002                	c.slli64	zero
    2072:	0100                	addi	s0,sp,128
    2074:	05d5                	addi	a1,a1,21
    2076:	102ff503          	.insn	4, 0x102ff503
    207a:	0200                	addi	s0,sp,256
    207c:	0000010b          	.insn	4, 0x010b
    2080:	d701                	beqz	a4,1f88 <$d.7+0x140>
    2082:	0305                	addi	t1,t1,1
    2084:	304a                	.insn	2, 0x304a
    2086:	0010                	.insn	2, 0x0010
    2088:	8c02                	jr	s8
    208a:	0000                	unimp
    208c:	0100                	addi	s0,sp,128
    208e:	3e0305db          	.insn	4, 0x3e0305db
    2092:	02001033          	mulh	zero,zero,zero
    2096:	0000010b          	.insn	4, 0x010b
    209a:	e001                	bnez	s0,209a <$d.7+0x252>
    209c:	0305                	addi	t1,t1,1
    209e:	3770                	.insn	2, 0x3770
    20a0:	0010                	.insn	2, 0x0010
    20a2:	0b02                	c.slli64	s6
    20a4:	0001                	nop
    20a6:	0100                	addi	s0,sp,128
    20a8:	05e5                	addi	a1,a1,25
    20aa:	10326c03          	.insn	4, 0x10326c03
    20ae:	0200                	addi	s0,sp,256
    20b0:	0000010b          	.insn	4, 0x010b
    20b4:	ea01                	bnez	a2,20c4 <$d.7+0x27c>
    20b6:	0305                	addi	t1,t1,1
    20b8:	327d                	jal	1a66 <$d.10+0x17b>
    20ba:	0010                	.insn	2, 0x0010
    20bc:	0b02                	c.slli64	s6
    20be:	0001                	nop
    20c0:	0100                	addi	s0,sp,128
    20c2:	c30305ef          	jal	a1,fff324f2 <_stack_top+0xffe26732>
    20c6:	1034                	addi	a3,sp,40
    20c8:	0200                	addi	s0,sp,256
    20ca:	0000010b          	.insn	4, 0x010b
    20ce:	f301                	bnez	a4,1fce <$d.7+0x186>
    20d0:	0305                	addi	t1,t1,1
    20d2:	315f 0010 0d07      	.insn	6, 0x0d070010315f
    20d8:	0002                	c.slli64	zero
    20da:	0100                	addi	s0,sp,128
    20dc:	0114                	addi	a3,sp,128
    20de:	0305                	addi	t1,t1,1
    20e0:	36e8                	.insn	2, 0x36e8
    20e2:	0010                	.insn	2, 0x0010
    20e4:	00008c07          	.insn	4, 0x8c07
    20e8:	0100                	addi	s0,sp,128
    20ea:	0305012f          	.insn	4, 0x0305012f
    20ee:	344a                	.insn	2, 0x344a
    20f0:	0010                	.insn	2, 0x0010
    20f2:	00010b07          	.insn	4, 0x00010b07
    20f6:	0100                	addi	s0,sp,128
    20f8:	03050137          	lui	sp,0x3050
    20fc:	001036fb          	.insn	4, 0x001036fb
    2100:	00010b07          	.insn	4, 0x00010b07
    2104:	0100                	addi	s0,sp,128
    2106:	013c                	addi	a5,sp,136
    2108:	0305                	addi	t1,t1,1
    210a:	33df 0010 2407      	.insn	6, 0x2407001033df
    2110:	0001                	nop
    2112:	0100                	addi	s0,sp,128
    2114:	03050143          	.insn	4, 0x03050143
    2118:	335e                	.insn	2, 0x335e
    211a:	0010                	.insn	2, 0x0010
    211c:	0002e207          	.insn	4, 0x0002e207
    2120:	0100                	addi	s0,sp,128
    2122:	03050147          	.insn	4, 0x03050147
    2126:	3781                	jal	2066 <$d.7+0x21e>
    2128:	0010                	.insn	2, 0x0010
    212a:	00003f03          	.insn	4, 0x3f03
    212e:	0400                	addi	s0,sp,512
    2130:	0046                	c.slli	zero,0x11
    2132:	0000                	unimp
    2134:	3307000f          	.insn	4, 0x3307000f
    2138:	0000                	unimp
    213a:	0100                	addi	s0,sp,128
    213c:	0150                	addi	a2,sp,132
    213e:	0305                	addi	t1,t1,1
    2140:	368d                	jal	1ca2 <$d.13+0x66>
    2142:	0010                	.insn	2, 0x0010
    2144:	00030a07          	.insn	4, 0x00030a07
    2148:	0100                	addi	s0,sp,128
    214a:	016a                	slli	sp,sp,0x1a
    214c:	0305                	addi	t1,t1,1
    214e:	32a4                	.insn	2, 0x32a4
    2150:	0010                	.insn	2, 0x0010
    2152:	00003f03          	.insn	4, 0x3f03
    2156:	0400                	addi	s0,sp,512
    2158:	0046                	c.slli	zero,0x11
    215a:	0000                	unimp
    215c:	000e                	c.slli	zero,0x3
    215e:	00030a07          	.insn	4, 0x00030a07
    2162:	0100                	addi	s0,sp,128
    2164:	0179                	addi	sp,sp,30 # 305001e <_stack_top+0x2f4425e>
    2166:	0305                	addi	t1,t1,1
    2168:	3350                	.insn	2, 0x3350
    216a:	0010                	.insn	2, 0x0010
    216c:	00033207          	.insn	4, 0x00033207
    2170:	0100                	addi	s0,sp,128
    2172:	0188                	addi	a0,sp,192
    2174:	0305                	addi	t1,t1,1
    2176:	32b2                	.insn	2, 0x32b2
    2178:	0010                	.insn	2, 0x0010
    217a:	00003f03          	.insn	4, 0x3f03
    217e:	0400                	addi	s0,sp,512
    2180:	0046                	c.slli	zero,0x11
    2182:	0000                	unimp
    2184:	000d                	c.nop	3
    2186:	00008c07          	.insn	4, 0x8c07
    218a:	0100                	addi	s0,sp,128
    218c:	018d                	addi	gp,gp,3
    218e:	0305                	addi	t1,t1,1
    2190:	3170                	.insn	2, 0x3170
    2192:	0010                	.insn	2, 0x0010
    2194:	00020d07          	.insn	4, 0x00020d07
    2198:	0100                	addi	s0,sp,128
    219a:	01b9                	addi	gp,gp,14
    219c:	0305                	addi	t1,t1,1
    219e:	349f 0010 5a07      	.insn	6, 0x5a070010349f
    21a4:	0000                	unimp
    21a6:	0100                	addi	s0,sp,128
    21a8:	01bc                	addi	a5,sp,200
    21aa:	0305                	addi	t1,t1,1
    21ac:	354a                	.insn	2, 0x354a
    21ae:	0010                	.insn	2, 0x0010
    21b0:	00003307          	.insn	4, 0x3307
    21b4:	0100                	addi	s0,sp,128
    21b6:	01c0                	addi	s0,sp,196
    21b8:	0305                	addi	t1,t1,1
    21ba:	3008                	.insn	2, 0x3008
    21bc:	0010                	.insn	2, 0x0010
    21be:	00003307          	.insn	4, 0x3307
    21c2:	0100                	addi	s0,sp,128
    21c4:	01c2                	slli	gp,gp,0x10
    21c6:	0305                	addi	t1,t1,1
    21c8:	0010314f          	.insn	4, 0x0010314f
    21cc:	00039207          	.insn	4, 0x00039207
    21d0:	0100                	addi	s0,sp,128
    21d2:	01c4                	addi	s1,sp,196
    21d4:	0305                	addi	t1,t1,1
    21d6:	34e9                	jal	1ca0 <$d.13+0x64>
    21d8:	0010                	.insn	2, 0x0010
    21da:	00003f03          	.insn	4, 0x3f03
    21de:	0400                	addi	s0,sp,512
    21e0:	0046                	c.slli	zero,0x11
    21e2:	0000                	unimp
    21e4:	0002                	c.slli64	zero
    21e6:	00033207          	.insn	4, 0x00033207
    21ea:	0100                	addi	s0,sp,128
    21ec:	01c6                	slli	gp,gp,0x11
    21ee:	0305                	addi	t1,t1,1
    21f0:	33f0                	.insn	2, 0x33f0
    21f2:	0010                	.insn	2, 0x0010
    21f4:	00008c07          	.insn	4, 0x8c07
    21f8:	0100                	addi	s0,sp,128
    21fa:	030501cb          	.insn	4, 0x030501cb
    21fe:	345c                	.insn	2, 0x345c
    2200:	0010                	.insn	2, 0x0010
    2202:	0003c807          	.insn	4, 0x0003c807
    2206:	0100                	addi	s0,sp,128
    2208:	01d0                	addi	a2,sp,196
    220a:	0305                	addi	t1,t1,1
    220c:	355e                	.insn	2, 0x355e
    220e:	0010                	.insn	2, 0x0010
    2210:	00003f03          	.insn	4, 0x3f03
    2214:	0400                	addi	s0,sp,512
    2216:	0046                	c.slli	zero,0x11
    2218:	0000                	unimp
    221a:	001e                	c.slli	zero,0x7
    221c:	00020d07          	.insn	4, 0x00020d07
    2220:	0100                	addi	s0,sp,128
    2222:	030501d7          	.insn	4, 0x030501d7
    2226:	370c                	.insn	2, 0x370c
    2228:	0010                	.insn	2, 0x0010
    222a:	00020d07          	.insn	4, 0x00020d07
    222e:	0100                	addi	s0,sp,128
    2230:	01dc                	addi	a5,sp,196
    2232:	0305                	addi	t1,t1,1
    2234:	3018                	.insn	2, 0x3018
    2236:	0010                	.insn	2, 0x0010
    2238:	00020d07          	.insn	4, 0x00020d07
    223c:	0100                	addi	s0,sp,128
    223e:	01df 0305 31b0      	.insn	6, 0x31b0030501df
    2244:	0010                	.insn	2, 0x0010
    2246:	00005a07          	.insn	4, 0x5a07
    224a:	0100                	addi	s0,sp,128
    224c:	01e4                	addi	s1,sp,204
    224e:	0305                	addi	t1,t1,1
    2250:	3314                	.insn	2, 0x3314
    2252:	0010                	.insn	2, 0x0010
    2254:	00041a07          	.insn	4, 0x00041a07
    2258:	0100                	addi	s0,sp,128
    225a:	01e9                	addi	gp,gp,26
    225c:	0305                	addi	t1,t1,1
    225e:	001031fb          	.insn	4, 0x001031fb
    2262:	00003f03          	.insn	4, 0x3f03
    2266:	0400                	addi	s0,sp,512
    2268:	0046                	c.slli	zero,0x11
    226a:	0000                	unimp
    226c:	001c                	.insn	2, 0x001c
    226e:	0002e207          	.insn	4, 0x0002e207
    2272:	0100                	addi	s0,sp,128
    2274:	01f1                	addi	gp,gp,28
    2276:	0305                	addi	t1,t1,1
    2278:	0010360b          	.insn	4, 0x0010360b
    227c:	00007307          	.insn	4, 0x7307
    2280:	0100                	addi	s0,sp,128
    2282:	01f9                	addi	gp,gp,30
    2284:	0305                	addi	t1,t1,1
    2286:	346e                	.insn	2, 0x346e
    2288:	0010                	.insn	2, 0x0010
    228a:	00007307          	.insn	4, 0x7307
    228e:	0100                	addi	s0,sp,128
    2290:	01fc                	addi	a5,sp,204
    2292:	0305                	addi	t1,t1,1
    2294:	001032bf 00045e07 	.insn	8, 0x00045e07001032bf
    229c:	0100                	addi	s0,sp,128
    229e:	0200                	addi	s0,sp,256
    22a0:	0305                	addi	t1,t1,1
    22a2:	371f 0010 3f03      	.insn	6, 0x3f030010371f
    22a8:	0000                	unimp
    22aa:	0400                	addi	s0,sp,512
    22ac:	0046                	c.slli	zero,0x11
    22ae:	0000                	unimp
    22b0:	33070017          	auipc	zero,0x33070
    22b4:	0000                	unimp
    22b6:	0100                	addi	s0,sp,128
    22b8:	020a                	slli	tp,tp,0x2
    22ba:	0305                	addi	t1,t1,1
    22bc:	001034eb          	.insn	4, 0x001034eb
    22c0:	0000f207          	.insn	4, 0xf207
    22c4:	0100                	addi	s0,sp,128
    22c6:	020e                	slli	tp,tp,0x3
    22c8:	0305                	addi	t1,t1,1
    22ca:	3182                	.insn	2, 0x3182
    22cc:	0010                	.insn	2, 0x0010
    22ce:	0000b207          	.insn	4, 0xb207
    22d2:	0100                	addi	s0,sp,128
    22d4:	0212                	slli	tp,tp,0x4
    22d6:	0305                	addi	t1,t1,1
    22d8:	001034fb          	.insn	4, 0x001034fb
    22dc:	00012407          	.insn	4, 0x00012407
    22e0:	0100                	addi	s0,sp,128
    22e2:	0216                	slli	tp,tp,0x5
    22e4:	0305                	addi	t1,t1,1
    22e6:	361a                	.insn	2, 0x361a
    22e8:	0010                	.insn	2, 0x0010
    22ea:	00008c07          	.insn	4, 0x8c07
    22ee:	0100                	addi	s0,sp,128
    22f0:	021c                	addi	a5,sp,256
    22f2:	0305                	addi	t1,t1,1
    22f4:	36c8                	.insn	2, 0x36c8
    22f6:	0010                	.insn	2, 0x0010
    22f8:	00045e07          	.insn	4, 0x00045e07
    22fc:	0100                	addi	s0,sp,128
    22fe:	023d                	addi	tp,tp,15 # fffe000f <_stack_top+0xffed424f>
    2300:	0305                	addi	t1,t1,1
    2302:	3790                	.insn	2, 0x3790
    2304:	0010                	.insn	2, 0x0010
    2306:	0000b207          	.insn	4, 0xb207
    230a:	0100                	addi	s0,sp,128
    230c:	028d                	addi	t0,t0,3
    230e:	0305                	addi	t1,t1,1
    2310:	34d4                	.insn	2, 0x34d4
    2312:	0010                	.insn	2, 0x0010
    2314:	00007307          	.insn	4, 0x7307
    2318:	0100                	addi	s0,sp,128
    231a:	029c                	addi	a5,sp,320
    231c:	0305                	addi	t1,t1,1
    231e:	357c                	.insn	2, 0x357c
    2320:	0010                	.insn	2, 0x0010
    2322:	0000f207          	.insn	4, 0xf207
    2326:	0100                	addi	s0,sp,128
    2328:	030502a3          	sb	a6,37(a0)
    232c:	3632                	.insn	2, 0x3632
    232e:	0010                	.insn	2, 0x0010
    2330:	0308                	addi	a0,sp,384
    2332:	f9000003          	lb	zero,-112(zero) # ffffff90 <_stack_top+0xffef41d0>
    2336:	0004                	.insn	2, 0x0004
    2338:	0100                	addi	s0,sp,128
    233a:	c0030507          	.insn	4, 0xc0030507
    233e:	1079                	c.nop	-2
    2340:	0300                	addi	s0,sp,384
    2342:	0506                	slli	a0,a0,0x1
    2344:	0000                	unimp
    2346:	4609                	li	a2,2
    2348:	0000                	unimp
    234a:	0000                	unimp
    234c:	0002                	c.slli64	zero
    234e:	110a                	slli	sp,sp,0x22
    2350:	0005                	c.nop	1
    2352:	b600                	.insn	2, 0xb600
    2354:	0005                	c.nop	1
    2356:	0200                	addi	s0,sp,256
    2358:	03680507          	.insn	4, 0x03680507
    235c:	0000                	unimp
    235e:	0108                	addi	a0,sp,128
    2360:	a908                	.insn	2, 0xa908
    2362:	0004                	.insn	2, 0x0004
    2364:	f900                	.insn	2, 0xf900
    2366:	0004                	.insn	2, 0x0004
    2368:	0100                	addi	s0,sp,128
    236a:	0508                	addi	a0,sp,640
    236c:	107bc003          	lbu	zero,263(s7)
    2370:	0800                	addi	s0,sp,16
    2372:	0700                	addi	s0,sp,896
    2374:	0000                	unimp
    2376:	053a                	slli	a0,a0,0xe
    2378:	0000                	unimp
    237a:	0a01                	addi	s4,s4,0
    237c:	0305                	addi	t1,t1,1
    237e:	39b0                	.insn	2, 0x39b0
    2380:	0010                	.insn	2, 0x0010
    2382:	450a                	lw	a0,128(sp)
    2384:	0005                	c.nop	1
    2386:	db00                	sw	s0,48(a4)
    2388:	0000                	unimp
    238a:	0400                	addi	s0,sp,512
    238c:	0b14                	addi	a3,sp,400
    238e:	054a                	slli	a0,a0,0x12
    2390:	0000                	unimp
    2392:	5a0c                	lw	a1,48(a2)
    2394:	0005                	c.nop	1
    2396:	0d00                	addi	s0,sp,656
    2398:	0561                	addi	a0,a0,24
    239a:	0000                	unimp
    239c:	730d                	lui	t1,0xfffe3
    239e:	0005                	c.nop	1
    23a0:	0000                	unimp
    23a2:	1205                	addi	tp,tp,-31 # ffffffe1 <_stack_top+0xffef4221>
    23a4:	0004                	.insn	2, 0x0004
    23a6:	0500                	addi	s0,sp,640
    23a8:	0a04                	addi	s1,sp,272
    23aa:	056c                	addi	a1,sp,652
    23ac:	0000                	unimp
    23ae:	00000313          	li	t1,0
    23b2:	2605c603          	lbu	a2,608(a1)
    23b6:	0005                	c.nop	1
    23b8:	0700                	addi	s0,sp,896
    23ba:	0b04                	addi	s1,sp,400
    23bc:	0578                	addi	a4,sp,652
    23be:	0000                	unimp
    23c0:	110e                	slli	sp,sp,0x23
    23c2:	0005                	c.nop	1
    23c4:	b600                	.insn	2, 0xb600
    23c6:	0005                	c.nop	1
    23c8:	0300                	addi	s0,sp,384
    23ca:	010a                	slli	sp,sp,0x2
    23cc:	8b08                	.insn	2, 0x8b08
    23ce:	0006                	c.slli	zero,0x1
    23d0:	9500                	.insn	2, 0x9500
    23d2:	0005                	c.nop	1
    23d4:	0100                	addi	s0,sp,128
    23d6:	050c                	addi	a1,sp,640
    23d8:	1039b403          	.insn	4, 0x1039b403
    23dc:	0a00                	addi	s0,sp,272
    23de:	056c                	addi	a1,sp,652
    23e0:	0000                	unimp
    23e2:	00000313          	li	t1,0
    23e6:	0902                	c.slli64	s2
    23e8:	5b08                	lw	a0,48(a4)
    23ea:	0004                	.insn	2, 0x0004
    23ec:	9500                	.insn	2, 0x9500
    23ee:	0005                	c.nop	1
    23f0:	0100                	addi	s0,sp,128
    23f2:	050d                	addi	a0,a0,3
    23f4:	1039bc03          	.insn	4, 0x1039bc03
    23f8:	0800                	addi	s0,sp,16
    23fa:	0042                	c.slli	zero,0x10
    23fc:	0000                	unimp
    23fe:	0595                	addi	a1,a1,5
    2400:	0000                	unimp
    2402:	0e01                	addi	t3,t3,0 # fffe5000 <_stack_top+0xffed9240>
    2404:	0305                	addi	t1,t1,1 # fffe3001 <_stack_top+0xffed7241>
    2406:	39a8                	.insn	2, 0x39a8
    2408:	0010                	.insn	2, 0x0010
    240a:	2c08                	.insn	2, 0x2c08
    240c:	0004                	.insn	2, 0x0004
    240e:	9500                	.insn	2, 0x9500
    2410:	0005                	c.nop	1
    2412:	0100                	addi	s0,sp,128
    2414:	ac03050f          	.insn	4, 0xac03050f
    2418:	1039                	c.nop	-18
    241a:	0800                	addi	s0,sp,16
    241c:	015e                	slli	sp,sp,0x17
    241e:	0000                	unimp
    2420:	0595                	addi	a1,a1,5
    2422:	0000                	unimp
    2424:	1001                	c.nop	-32
    2426:	0305                	addi	t1,t1,1
    2428:	39b8                	.insn	2, 0x39b8
    242a:	0010                	.insn	2, 0x0010
    242c:	0000f207          	.insn	4, 0xf207
    2430:	0100                	addi	s0,sp,128
    2432:	030501a7          	.insn	4, 0x030501a7
    2436:	3510                	.insn	2, 0x3510
    2438:	0010                	.insn	2, 0x0010
    243a:	0005f70b          	.insn	4, 0x0005f70b
    243e:	0f00                	addi	s0,sp,912
    2440:	0506                	slli	a0,a0,0x1
    2442:	0000                	unimp
    2444:	0006010b          	.insn	4, 0x0006010b
    2448:	0f00                	addi	s0,sp,912
    244a:	0595                	addi	a1,a1,5
    244c:	0000                	unimp
    244e:	110a                	slli	sp,sp,0x22
    2450:	0006                	c.slli	zero,0x1
    2452:	8a00                	.insn	2, 0x8a00
    2454:	0000                	unimp
    2456:	0200                	addi	s0,sp,256
    2458:	0508                	addi	a0,sp,640
    245a:	0000                	unimp
    245c:	0000                	unimp
    245e:	c4100207          	.insn	4, 0xc4100207
    2462:	101a                	c.slli	zero,0x26
    2464:	6000                	.insn	2, 0x6000
    2466:	0000                	unimp
    2468:	0100                	addi	s0,sp,128
    246a:	b752                	.insn	2, 0xb752
    246c:	0004                	.insn	2, 0x0004
    246e:	0100                	addi	s0,sp,128
    2470:	6142                	.insn	2, 0x6142
    2472:	0005                	c.nop	1
    2474:	1100                	addi	s0,sp,160
    2476:	00001bf7          	.insn	4, 0x1bf7
    247a:	016d                	addi	sp,sp,27
    247c:	0000                	unimp
    247e:	4201                	li	tp,0
    2480:	0595                	addi	a1,a1,5
    2482:	0000                	unimp
    2484:	1512                	slli	a0,a0,0x24
    2486:	001c                	.insn	2, 0x001c
    2488:	4700                	lw	s0,8(a4)
    248a:	0001                	nop
    248c:	0100                	addi	s0,sp,128
    248e:	9544                	.insn	2, 0x9544
    2490:	0005                	c.nop	1
    2492:	1200                	addi	s0,sp,288
    2494:	1c28                	addi	a0,sp,568
    2496:	0000                	unimp
    2498:	00d9                	addi	ra,ra,22
    249a:	0000                	unimp
    249c:	4501                	li	a0,0
    249e:	0595                	addi	a1,a1,5
    24a0:	0000                	unimp
    24a2:	00066413          	ori	s0,a2,0
    24a6:	f000                	.insn	2, 0xf000
    24a8:	101a                	c.slli	zero,0x26
    24aa:	0000                	unimp
    24ac:	a014                	.insn	2, 0xa014
    24ae:	0004                	.insn	2, 0x0004
    24b0:	0200                	addi	s0,sp,256
    24b2:	06720d27          	.insn	4, 0x06720d27
    24b6:	0000                	unimp
    24b8:	0015                	c.nop	5
    24ba:	0006770b          	.insn	4, 0x0006770b
    24be:	1600                	addi	s0,sp,800
    24c0:	0000003f 0006d317 	.insn	8, 0x0006d3170000003f
    24c8:	0100                	addi	s0,sp,128
    24ca:	0328                	addi	a0,sp,392
    24cc:	055a                	slli	a0,a0,0x16
    24ce:	0000                	unimp
    24d0:	1801                	addi	a6,a6,-32
    24d2:	01ce                	slli	gp,gp,0x13
    24d4:	0000                	unimp
    24d6:	2801                	jal	24e6 <$d.7+0x69e>
    24d8:	0695                	addi	a3,a3,5
    24da:	0000                	unimp
    24dc:	0b00                	addi	s0,sp,400
    24de:	069a                	slli	a3,a3,0x6
    24e0:	0000                	unimp
    24e2:	0616                	slli	a2,a2,0x5
    24e4:	0005                	c.nop	1
    24e6:	1900                	addi	s0,sp,176
    24e8:	04b2                	slli	s1,s1,0xc
    24ea:	0000                	unimp
    24ec:	1201                	addi	tp,tp,-32 # ffffffe0 <_stack_top+0xffef4220>
    24ee:	0606                	slli	a2,a2,0x1
    24f0:	0000                	unimp
    24f2:	1801                	addi	a6,a6,-32
    24f4:	00cd                	addi	ra,ra,19
    24f6:	0000                	unimp
    24f8:	1201                	addi	tp,tp,-32 # ffffffe0 <_stack_top+0xffef4220>
    24fa:	0695                	addi	a3,a3,5
    24fc:	0000                	unimp
    24fe:	1900                	addi	s0,sp,176
    2500:	05ea                	slli	a1,a1,0x1a
    2502:	0000                	unimp
    2504:	1801                	addi	a6,a6,-32
    2506:	0595                	addi	a1,a1,5
    2508:	0000                	unimp
    250a:	1801                	addi	a6,a6,-32
    250c:	00cd                	addi	ra,ra,19
    250e:	0000                	unimp
    2510:	1801                	addi	a6,a6,-32
    2512:	0695                	addi	a3,a3,5
    2514:	0000                	unimp
    2516:	1000                	addi	s0,sp,32
    2518:	1b24                	addi	s1,sp,440
    251a:	0010                	.insn	2, 0x0010
    251c:	056c                	addi	a1,sp,652
    251e:	0000                	unimp
    2520:	5201                	li	tp,-32
    2522:	0229                	addi	tp,tp,10 # a <$d.5+0xa>
    2524:	0000                	unimp
    2526:	6001                	.insn	2, 0x6001
    2528:	055a                	slli	a0,a0,0x16
    252a:	0000                	unimp
    252c:	3b11                	jal	2240 <$d.7+0x3f8>
    252e:	001c                	.insn	2, 0x001c
    2530:	7f00                	.insn	2, 0x7f00
    2532:	0006                	c.slli	zero,0x1
    2534:	0100                	addi	s0,sp,128
    2536:	3a60                	.insn	2, 0x3a60
    2538:	0005                	c.nop	1
    253a:	1200                	addi	s0,sp,288
    253c:	00001ce3          	bnez	zero,2d54 <$d.7+0xf0c>
    2540:	000005f7          	.insn	4, 0x05f7
    2544:	6401                	.insn	2, 0x6401
    2546:	0595                	addi	a1,a1,5
    2548:	0000                	unimp
    254a:	fd12                	.insn	2, 0xfd12
    254c:	001c                	.insn	2, 0x001c
    254e:	3d00                	.insn	2, 0x3d00
    2550:	0006                	c.slli	zero,0x1
    2552:	0100                	addi	s0,sp,128
    2554:	9565                	srai	a0,a0,0x39
    2556:	0005                	c.nop	1
    2558:	1200                	addi	s0,sp,288
    255a:	1d10                	addi	a2,sp,688
    255c:	0000                	unimp
    255e:	04d1                	addi	s1,s1,20
    2560:	0000                	unimp
    2562:	6701                	.insn	2, 0x6701
    2564:	0595                	addi	a1,a1,5
    2566:	0000                	unimp
    2568:	7e1a                	.insn	2, 0x7e1a
    256a:	0001                	nop
    256c:	0100                	addi	s0,sp,128
    256e:	9e62                	add	t3,t3,s8
    2570:	0011                	c.nop	4
    2572:	1a00                	addi	s0,sp,304
    2574:	00000653          	.insn	4, 0x0653
    2578:	6601                	.insn	2, 0x6601
    257a:	0595                	addi	a1,a1,5
    257c:	0000                	unimp
    257e:	00067c1b          	.insn	4, 0x00067c1b
    2582:	1800                	addi	s0,sp,48
    2584:	101c                	addi	a5,sp,32
    2586:	d000                	sw	s0,32(s0)
    2588:	0000                	unimp
    258a:	0100                	addi	s0,sp,128
    258c:	011c097b          	.insn	4, 0x011c097b
    2590:	8959                	andi	a0,a0,22
    2592:	0006                	c.slli	zero,0x1
    2594:	1b00                	addi	s0,sp,432
    2596:	069f 0000 1c38      	.insn	6, 0x1c380000069f
    259c:	0010                	.insn	2, 0x0010
    259e:	0024                	addi	s1,sp,8
    25a0:	0000                	unimp
    25a2:	2d01                	jal	2bb2 <$d.7+0xd6a>
    25a4:	1d09                	addi	s10,s10,-30 # fffe3fe2 <_stack_top+0xffed8222>
    25a6:	1c64                	addi	s1,sp,572
    25a8:	0000                	unimp
    25aa:	000006ab          	.insn	4, 0x06ab
    25ae:	1b00                	addi	s0,sp,432
    25b0:	069f 0000 1c68      	.insn	6, 0x1c680000069f
    25b6:	0010                	.insn	2, 0x0010
    25b8:	0010                	.insn	2, 0x0010
    25ba:	0000                	unimp
    25bc:	3301                	jal	22bc <$d.7+0x474>
    25be:	1d09                	addi	s10,s10,-30
    25c0:	1c79                	addi	s8,s8,-2
    25c2:	0000                	unimp
    25c4:	000006ab          	.insn	4, 0x06ab
    25c8:	1b00                	addi	s0,sp,432
    25ca:	000006b7          	lui	a3,0x0
    25ce:	1c88                	addi	a0,sp,624
    25d0:	0010                	.insn	2, 0x0010
    25d2:	0030                	addi	a2,sp,8
    25d4:	0000                	unimp
    25d6:	3901                	jal	21e6 <$d.7+0x39e>
    25d8:	1d09                	addi	s10,s10,-30
    25da:	1c8e                	slli	s9,s9,0x23
    25dc:	0000                	unimp
    25de:	000006c3          	.insn	4, 0x06c3
    25e2:	1b00                	addi	s0,sp,432
    25e4:	000006b7          	lui	a3,0x0
    25e8:	1cbc                	addi	a5,sp,632
    25ea:	0010                	.insn	2, 0x0010
    25ec:	002c                	addi	a1,sp,8
    25ee:	0000                	unimp
    25f0:	3c01                	jal	2000 <$d.7+0x1b8>
    25f2:	1d09                	addi	s10,s10,-30
    25f4:	00001ca3          	sh	zero,25(zero) # 19 <$d.5+0x19>
    25f8:	000006c3          	.insn	4, 0x06c3
    25fc:	0000                	unimp
    25fe:	0006b71b          	.insn	4, 0x0006b71b
    2602:	ec00                	.insn	2, 0xec00
    2604:	101c                	addi	a5,sp,32
    2606:	2800                	.insn	2, 0x2800
    2608:	0000                	unimp
    260a:	0100                	addi	s0,sp,128
    260c:	1684                	addi	s1,sp,864
    260e:	b81d                	j	1e44 <$d.13+0x208>
    2610:	001c                	.insn	2, 0x001c
    2612:	c300                	sw	s0,0(a4)
    2614:	0006                	c.slli	zero,0x1
    2616:	0000                	unimp
    2618:	00069f1b          	.insn	4, 0x00069f1b
    261c:	d400                	sw	s0,40(s0)
    261e:	101d                	c.nop	-25
    2620:	2400                	.insn	2, 0x2400
    2622:	0000                	unimp
    2624:	0100                	addi	s0,sp,128
    2626:	189f ce1d 001c      	.insn	6, 0x001cce1d189f
    262c:	ab00                	.insn	2, 0xab00
    262e:	0006                	c.slli	zero,0x1
    2630:	0000                	unimp
    2632:	00069f1b          	.insn	4, 0x00069f1b
    2636:	2400                	.insn	2, 0x2400
    2638:	101e                	c.slli	zero,0x27
    263a:	0800                	addi	s0,sp,16
    263c:	0000                	unimp
    263e:	0100                	addi	s0,sp,128
    2640:	1da5                	addi	s11,s11,-23
    2642:	031c                	addi	a5,sp,384
    2644:	ab9f0e8b          	.insn	4, 0xab9f0e8b
    2648:	0006                	c.slli	zero,0x1
    264a:	0000                	unimp
    264c:	0006b71b          	.insn	4, 0x0006b71b
    2650:	5000                	lw	s0,32(s0)
    2652:	101e                	c.slli	zero,0x27
    2654:	1000                	addi	s0,sp,32
    2656:	0000                	unimp
    2658:	0100                	addi	s0,sp,128
    265a:	031c10ab          	.insn	4, 0x031c10ab
    265e:	c39f248b          	.insn	4, 0xc39f248b
    2662:	0006                	c.slli	zero,0x1
    2664:	0000                	unimp
    2666:	0006b71b          	.insn	4, 0x0006b71b
    266a:	7000                	.insn	2, 0x7000
    266c:	101e                	c.slli	zero,0x27
    266e:	2800                	.insn	2, 0x2800
    2670:	0000                	unimp
    2672:	0100                	addi	s0,sp,128
    2674:	16ae                	slli	a3,a3,0x2b
    2676:	031c                	addi	a5,sp,384
    2678:	c39f2c8b          	.insn	4, 0xc39f2c8b
    267c:	0006                	c.slli	zero,0x1
    267e:	0000                	unimp
    2680:	00066413          	ori	s0,a2,0
    2684:	7000                	.insn	2, 0x7000
    2686:	1300101b          	.insn	4, 0x1300101b
    268a:	0664                	addi	s1,sp,780
    268c:	0000                	unimp
    268e:	1b90                	addi	a2,sp,496
    2690:	0010                	.insn	2, 0x0010
    2692:	011e                	slli	sp,sp,0x7
    2694:	a85c                	.insn	2, 0xa85c
    2696:	1300101b          	.insn	4, 0x1300101b
    269a:	0664                	addi	s1,sp,780
    269c:	0000                	unimp
    269e:	1bc8                	addi	a0,sp,500
    26a0:	0010                	.insn	2, 0x0010
    26a2:	00066413          	ori	s0,a2,0
    26a6:	1800                	addi	s0,sp,48
    26a8:	101c                	addi	a5,sp,32
    26aa:	1300                	addi	s0,sp,416
    26ac:	0664                	addi	s1,sp,780
    26ae:	0000                	unimp
    26b0:	1d2c                	addi	a1,sp,696
    26b2:	0010                	.insn	2, 0x0010
    26b4:	00066413          	ori	s0,a2,0
    26b8:	4400                	lw	s0,8(s0)
    26ba:	101d                	c.nop	-25
    26bc:	1e00                	addi	s0,sp,816
    26be:	5c01                	li	s8,-32
    26c0:	1d5c                	addi	a5,sp,692
    26c2:	0010                	.insn	2, 0x0010
    26c4:	00066413          	ori	s0,a2,0
    26c8:	8800                	.insn	2, 0x8800
    26ca:	101d                	c.nop	-25
    26cc:	1300                	addi	s0,sp,416
    26ce:	091f 0000 1d90      	.insn	6, 0x1d900000091f
    26d4:	0010                	.insn	2, 0x0010
    26d6:	00066413          	ori	s0,a2,0
    26da:	c400                	sw	s0,8(s0)
    26dc:	101d                	c.nop	-25
    26de:	1300                	addi	s0,sp,416
    26e0:	0664                	addi	s1,sp,780
    26e2:	0000                	unimp
    26e4:	1dd4                	addi	a3,sp,756
    26e6:	0010                	.insn	2, 0x0010
    26e8:	00066413          	ori	s0,a2,0
    26ec:	0800                	addi	s0,sp,16
    26ee:	101e                	c.slli	zero,0x27
    26f0:	1300                	addi	s0,sp,416
    26f2:	0664                	addi	s1,sp,780
    26f4:	0000                	unimp
    26f6:	1e24                	addi	s1,sp,824
    26f8:	0010                	.insn	2, 0x0010
    26fa:	00066413          	ori	s0,a2,0
    26fe:	3c00                	.insn	2, 0x3c00
    2700:	101e                	c.slli	zero,0x27
    2702:	1300                	addi	s0,sp,416
    2704:	0664                	addi	s1,sp,780
    2706:	0000                	unimp
    2708:	1e50                	addi	a2,sp,820
    270a:	0010                	.insn	2, 0x0010
    270c:	00066413          	ori	s0,a2,0
    2710:	7000                	.insn	2, 0x7000
    2712:	101e                	c.slli	zero,0x27
    2714:	1300                	addi	s0,sp,416
    2716:	0664                	addi	s1,sp,780
    2718:	0000                	unimp
    271a:	1eb0                	addi	a2,sp,888
    271c:	0010                	.insn	2, 0x0010
    271e:	00066413          	ori	s0,a2,0
    2722:	6800                	.insn	2, 0x6800
    2724:	101f 1300 0664      	.insn	6, 0x06641300101f
    272a:	0000                	unimp
    272c:	1f8c                	addi	a1,sp,1008
    272e:	0010                	.insn	2, 0x0010
    2730:	00066413          	ori	s0,a2,0
    2734:	9c00                	.insn	2, 0x9c00
    2736:	101f 1300 0664      	.insn	6, 0x06641300101f
    273c:	0000                	unimp
    273e:	1fc0                	addi	s0,sp,1012
    2740:	0010                	.insn	2, 0x0010
    2742:	00066413          	ori	s0,a2,0
    2746:	dc00                	sw	s0,56(s0)
    2748:	101f 1300 0664      	.insn	6, 0x06641300101f
    274e:	0000                	unimp
    2750:	2008                	.insn	2, 0x2008
    2752:	0010                	.insn	2, 0x0010
    2754:	00066413          	ori	s0,a2,0
    2758:	3800                	.insn	2, 0x3800
    275a:	1020                	addi	s0,sp,40
    275c:	1300                	addi	s0,sp,416
    275e:	0664                	addi	s1,sp,780
    2760:	0000                	unimp
    2762:	2070                	.insn	2, 0x2070
    2764:	0010                	.insn	2, 0x0010
    2766:	1f00                	addi	s0,sp,944
    2768:	2090                	.insn	2, 0x2090
    276a:	0010                	.insn	2, 0x0010
    276c:	00ec                	addi	a1,sp,76
    276e:	0000                	unimp
    2770:	5201                	li	tp,-32
    2772:	067c                	addi	a5,sp,780
    2774:	0000                	unimp
    2776:	231d                	jal	2c9c <$d.7+0xe54>
    2778:	001d                	c.nop	7
    277a:	8900                	.insn	2, 0x8900
    277c:	0006                	c.slli	zero,0x1
    277e:	1b00                	addi	s0,sp,432
    2780:	069f 0000 20b4      	.insn	6, 0x20b40000069f
    2786:	0010                	.insn	2, 0x0010
    2788:	0028                	addi	a0,sp,8
    278a:	0000                	unimp
    278c:	2d01                	jal	2d9c <$d.7+0xf54>
    278e:	1d09                	addi	s10,s10,-30
    2790:	1d36                	slli	s10,s10,0x2d
    2792:	0000                	unimp
    2794:	000006ab          	.insn	4, 0x06ab
    2798:	1b00                	addi	s0,sp,432
    279a:	069f 0000 20e8      	.insn	6, 0x20e80000069f
    27a0:	0010                	.insn	2, 0x0010
    27a2:	0010                	.insn	2, 0x0010
    27a4:	0000                	unimp
    27a6:	3301                	jal	24a6 <$d.7+0x65e>
    27a8:	1d09                	addi	s10,s10,-30
    27aa:	00001d4b          	.insn	4, 0x1d4b
    27ae:	000006ab          	.insn	4, 0x06ab
    27b2:	1b00                	addi	s0,sp,432
    27b4:	000006b7          	lui	a3,0x0
    27b8:	210c                	.insn	2, 0x210c
    27ba:	0010                	.insn	2, 0x0010
    27bc:	0030                	addi	a2,sp,8
    27be:	0000                	unimp
    27c0:	3901                	jal	23d0 <$d.7+0x588>
    27c2:	1d09                	addi	s10,s10,-30
    27c4:	1d60                	addi	s0,sp,700
    27c6:	0000                	unimp
    27c8:	000006c3          	.insn	4, 0x06c3
    27cc:	1b00                	addi	s0,sp,432
    27ce:	000006b7          	lui	a3,0x0
    27d2:	2140                	.insn	2, 0x2140
    27d4:	0010                	.insn	2, 0x0010
    27d6:	0028                	addi	a0,sp,8
    27d8:	0000                	unimp
    27da:	3c01                	jal	21ea <$d.7+0x3a2>
    27dc:	1d09                	addi	s10,s10,-30
    27de:	1d75                	addi	s10,s10,-3
    27e0:	0000                	unimp
    27e2:	000006c3          	.insn	4, 0x06c3
    27e6:	0000                	unimp
    27e8:	7c1f 1021 a400      	.insn	6, 0xa40010217c1f
    27ee:	0000                	unimp
    27f0:	0100                	addi	s0,sp,128
    27f2:	1352                	slli	t1,t1,0x34
    27f4:	000a                	c.slli	zero,0x2
    27f6:	1d00                	addi	s0,sp,688
    27f8:	1d8a                	slli	s11,s11,0x22
    27fa:	0000                	unimp
    27fc:	0a1f 0000 9d20      	.insn	6, 0x9d2000000a1f
    2802:	001d                	c.nop	7
    2804:	4b00                	lw	s0,16(a4)
    2806:	000a                	c.slli	zero,0x2
    2808:	2000                	.insn	2, 0x2000
    280a:	1db0                	addi	a2,sp,760
    280c:	0000                	unimp
    280e:	0a2a                	slli	s4,s4,0xa
    2810:	0000                	unimp
    2812:	c320                	sw	s0,64(a4)
    2814:	001d                	c.nop	7
    2816:	3500                	.insn	2, 0x3500
    2818:	000a                	c.slli	zero,0x2
    281a:	2100                	.insn	2, 0x2100
    281c:	0a40                	addi	s0,sp,276
    281e:	0000                	unimp
    2820:	b722                	.insn	2, 0xb722
    2822:	0006                	c.slli	zero,0x1
    2824:	d800                	sw	s0,48(s0)
    2826:	1021                	c.nop	-24
    2828:	2000                	.insn	2, 0x2000
    282a:	0000                	unimp
    282c:	0100                	addi	s0,sp,128
    282e:	0105                	addi	sp,sp,1
    2830:	1d0c                	addi	a1,sp,688
    2832:	1de6                	slli	s11,s11,0x39
    2834:	0000                	unimp
    2836:	000006c3          	.insn	4, 0x06c3
    283a:	1e00                	addi	s0,sp,816
    283c:	5c01                	li	s8,-32
    283e:	21cc                	.insn	2, 0x21cc
    2840:	0010                	.insn	2, 0x0010
    2842:	1900                	addi	s0,sp,176
    2844:	00000053          	.insn	4, 0x0053
    2848:	2001                	jal	2848 <$d.7+0xa00>
    284a:	0000003f 01c51801 	.insn	8, 0x01c518010000003f
    2852:	0000                	unimp
    2854:	2001                	jal	2854 <$d.7+0xa0c>
    2856:	0000003f 06962300 	.insn	8, 0x069623000000003f
    285e:	0000                	unimp
    2860:	f801                	bnez	s0,2770 <$d.7+0x928>
    2862:	0561                	addi	a0,a0,24
    2864:	0000                	unimp
    2866:	1801                	addi	a6,a6,-32
    2868:	016d                	addi	sp,sp,27
    286a:	0000                	unimp
    286c:	f801                	bnez	s0,277c <$d.7+0x934>
    286e:	0595                	addi	a1,a1,5
    2870:	0000                	unimp
    2872:	971a                	add	a4,a4,t1
    2874:	0000                	unimp
    2876:	0100                	addi	s0,sp,128
    2878:	95fc                	.insn	2, 0x95fc
    287a:	0005                	c.nop	1
    287c:	1a00                	addi	s0,sp,304
    287e:	000002bf 0595fb01 	.insn	8, 0x0595fb01000002bf
    2886:	0000                	unimp
    2888:	6d1a                	.insn	2, 0x6d1a
    288a:	0005                	c.nop	1
    288c:	0100                	addi	s0,sp,128
    288e:	95fd                	srai	a1,a1,0x3f
    2890:	0005                	c.nop	1
    2892:	1a00                	addi	s0,sp,304
    2894:	04f9                	addi	s1,s1,30
    2896:	0000                	unimp
    2898:	fa01                	bnez	a2,27a8 <$d.7+0x960>
    289a:	0595                	addi	a1,a1,5
    289c:	0000                	unimp
    289e:	2400                	.insn	2, 0x2400
    28a0:	2220                	.insn	2, 0x2220
    28a2:	0010                	.insn	2, 0x0010
    28a4:	0490                	addi	a2,sp,576
    28a6:	0000                	unimp
    28a8:	5201                	li	tp,-32
    28aa:	025d                	addi	tp,tp,23 # 17 <$d.5+0x17>
    28ac:	0000                	unimp
    28ae:	0b01                	addi	s6,s6,0
    28b0:	5a01                	li	s4,-32
    28b2:	0005                	c.nop	1
    28b4:	2500                	.insn	2, 0x2500
    28b6:	1df9                	addi	s11,s11,-2
    28b8:	0000                	unimp
    28ba:	05b1                	addi	a1,a1,12
    28bc:	0000                	unimp
    28be:	0c01                	addi	s8,s8,0
    28c0:	7201                	lui	tp,0xfffe0
    28c2:	0006                	c.slli	zero,0x1
    28c4:	2500                	.insn	2, 0x2500
    28c6:	00001e17          	auipc	t3,0x1
    28ca:	016d                	addi	sp,sp,27
    28cc:	0000                	unimp
    28ce:	0d01                	addi	s10,s10,0
    28d0:	af01                	j	2fe0 <$d.7+0x1198>
    28d2:	0011                	c.nop	4
    28d4:	2500                	.insn	2, 0x2500
    28d6:	1e36                	slli	t3,t3,0x2d
    28d8:	0000                	unimp
    28da:	06ae                	slli	a3,a3,0xb
    28dc:	0000                	unimp
    28de:	0e01                	addi	t3,t3,0 # 38c6 <$d.7+0x1a7e>
    28e0:	af01                	j	2ff0 <$d.7+0x11a8>
    28e2:	0011                	c.nop	4
    28e4:	2600                	.insn	2, 0x2600
    28e6:	00c19103          	lh	sp,12(gp)
    28ea:	05d4                	addi	a3,sp,708
    28ec:	0000                	unimp
    28ee:	1201                	addi	tp,tp,-32 # fffdffe0 <_stack_top+0xffed4220>
    28f0:	a301                	j	2df0 <$d.7+0xfa8>
    28f2:	0011                	c.nop	4
    28f4:	2700                	.insn	2, 0x2700
    28f6:	1fad                	addi	t6,t6,-21
    28f8:	0000                	unimp
    28fa:	037c                	addi	a5,sp,396
    28fc:	0000                	unimp
    28fe:	1101                	addi	sp,sp,-32
    2900:	9501                	srai	a0,a0,0x20
    2902:	0005                	c.nop	1
    2904:	2800                	.insn	2, 0x2800
    2906:	03c8                	addi	a0,sp,452
    2908:	0000                	unimp
    290a:	001e5527          	.insn	4, 0x001e5527
    290e:	2900                	.insn	2, 0x2900
    2910:	0000                	unimp
    2912:	0100                	addi	s0,sp,128
    2914:	0116                	slli	sp,sp,0x5
    2916:	055a                	slli	a0,a0,0x16
    2918:	0000                	unimp
    291a:	2800                	.insn	2, 0x2800
    291c:	03e0                	addi	s0,sp,460
    291e:	0000                	unimp
    2920:	001ef927          	.insn	4, 0x001ef927
    2924:	bf00                	.insn	2, 0xbf00
    2926:	0006                	c.slli	zero,0x1
    2928:	0100                	addi	s0,sp,128
    292a:	055a011b          	.insn	4, 0x055a011b
    292e:	0000                	unimp
    2930:	001f5f27          	.insn	4, 0x001f5f27
    2934:	2900                	.insn	2, 0x2900
    2936:	0000                	unimp
    2938:	0100                	addi	s0,sp,128
    293a:	011a                	slli	sp,sp,0x6
    293c:	055a                	slli	a0,a0,0x16
    293e:	0000                	unimp
    2940:	fb22                	.insn	2, 0xfb22
    2942:	0009                	c.nop	2
    2944:	cc00                	sw	s0,24(s0)
    2946:	1022                	c.slli	zero,0x28
    2948:	1800                	addi	s0,sp,48
    294a:	0000                	unimp
    294c:	0100                	addi	s0,sp,128
    294e:	011e                	slli	sp,sp,0x7
    2950:	5a011c1b          	.insn	4, 0x5a011c1b
    2954:	00000a07          	.insn	4, 0x0a07
    2958:	2900                	.insn	2, 0x2900
    295a:	000009fb          	.insn	4, 0x09fb
    295e:	233c                	.insn	2, 0x233c
    2960:	0010                	.insn	2, 0x0010
    2962:	0018                	.insn	2, 0x0018
    2964:	0000                	unimp
    2966:	2801                	jal	2976 <$d.7+0xb2e>
    2968:	1b01                	addi	s6,s6,-32
    296a:	2800                	.insn	2, 0x2800
    296c:	03f8                	addi	a4,sp,460
    296e:	0000                	unimp
    2970:	001fd627          	.insn	4, 0x001fd627
    2974:	1a00                	addi	s0,sp,304
    2976:	0000                	unimp
    2978:	0100                	addi	s0,sp,128
    297a:	0135                	addi	sp,sp,13
    297c:	0595                	addi	a1,a1,5
    297e:	0000                	unimp
    2980:	1828                	addi	a0,sp,56
    2982:	0004                	.insn	2, 0x0004
    2984:	2700                	.insn	2, 0x2700
    2986:	00001fff 000001eb 	.insn	12, 0x95013e01000001eb00001fff
    298e:	95013e01 
    2992:	0005                	c.nop	1
    2994:	2800                	.insn	2, 0x2800
    2996:	0438                	addi	a4,sp,520
    2998:	0000                	unimp
    299a:	00203427          	.insn	4, 0x00203427
    299e:	a500                	.insn	2, 0xa500
    29a0:	0001                	nop
    29a2:	0100                	addi	s0,sp,128
    29a4:	0140                	addi	s0,sp,132
    29a6:	119e                	slli	gp,gp,0x27
    29a8:	0000                	unimp
    29aa:	5828                	lw	a0,112(s0)
    29ac:	0004                	.insn	2, 0x0004
    29ae:	2700                	.insn	2, 0x2700
    29b0:	2068                	.insn	2, 0x2068
    29b2:	0000                	unimp
    29b4:	0029                	c.nop	10
    29b6:	0000                	unimp
    29b8:	4b01                	li	s6,0
    29ba:	5a01                	li	s4,-32
    29bc:	0005                	c.nop	1
    29be:	2800                	.insn	2, 0x2800
    29c0:	0478                	addi	a4,sp,524
    29c2:	0000                	unimp
    29c4:	0020d227          	.insn	4, 0x0020d227
    29c8:	9f00                	.insn	2, 0x9f00
    29ca:	0000                	unimp
    29cc:	0100                	addi	s0,sp,128
    29ce:	014c                	addi	a1,sp,132
    29d0:	0506                	slli	a0,a0,0x1
    29d2:	0000                	unimp
    29d4:	00222127          	.insn	4, 0x00222127
    29d8:	8800                	.insn	2, 0x8800
    29da:	01000003          	lb	zero,16(zero) # 10 <$d.5+0x10>
    29de:	014d                	addi	sp,sp,19
    29e0:	055a                	slli	a0,a0,0x16
    29e2:	0000                	unimp
    29e4:	d82a                	sw	a0,48(sp)
    29e6:	1024                	addi	s1,sp,40
    29e8:	7c00                	.insn	2, 0x7c00
    29ea:	0000                	unimp
    29ec:	2700                	.insn	2, 0x2700
    29ee:	20e5                	jal	2ad6 <$d.7+0xc8e>
    29f0:	0000                	unimp
    29f2:	021d                	addi	tp,tp,7 # 7 <$d.5+0x7>
    29f4:	0000                	unimp
    29f6:	6e01                	.insn	2, 0x6e01
    29f8:	5a01                	li	s4,-32
    29fa:	0005                	c.nop	1
    29fc:	0000                	unimp
    29fe:	382a                	.insn	2, 0x382a
    2a00:	1026                	c.slli	zero,0x29
    2a02:	7800                	.insn	2, 0x7800
    2a04:	0000                	unimp
    2a06:	2b00                	.insn	2, 0x2b00
    2a08:	0608                	addi	a0,sp,768
    2a0a:	0000                	unimp
    2a0c:	7601                	lui	a2,0xfffe0
    2a0e:	9501                	srai	a0,a0,0x20
    2a10:	0005                	c.nop	1
    2a12:	2b00                	.insn	2, 0x2b00
    2a14:	030d                	addi	t1,t1,3
    2a16:	0000                	unimp
    2a18:	7701                	lui	a4,0xfffe0
    2a1a:	9501                	srai	a0,a0,0x20
    2a1c:	0005                	c.nop	1
    2a1e:	2200                	.insn	2, 0x2200
    2a20:	069f 0000 264c      	.insn	6, 0x264c0000069f
    2a26:	0010                	.insn	2, 0x0010
    2a28:	0008                	.insn	2, 0x0008
    2a2a:	0000                	unimp
    2a2c:	7b01                	lui	s6,0xfffe0
    2a2e:	1d01                	addi	s10,s10,-32
    2a30:	031c                	addi	a5,sp,384
    2a32:	1485                	addi	s1,s1,-31
    2a34:	ab9f 0006 0000      	.insn	6, 0x0006ab9f
    2a3a:	9f2c                	.insn	2, 0x9f2c
    2a3c:	0006                	c.slli	zero,0x1
    2a3e:	a000                	.insn	2, 0xa000
    2a40:	0004                	.insn	2, 0x0004
    2a42:	0100                	addi	s0,sp,128
    2a44:	017c                	addi	a5,sp,140
    2a46:	1c1d                	addi	s8,s8,-25
    2a48:	9f1a8503          	lb	a0,-1551(s5)
    2a4c:	000006ab          	.insn	4, 0x06ab
    2a50:	2200                	.insn	2, 0x2200
    2a52:	000006b7          	lui	a3,0x0
    2a56:	267c                	.insn	2, 0x267c
    2a58:	0010                	.insn	2, 0x0010
    2a5a:	002c                	addi	a1,sp,8
    2a5c:	0000                	unimp
    2a5e:	7f01                	lui	t5,0xfffe0
    2a60:	2001                	jal	2a60 <$d.7+0xc18>
    2a62:	031c                	addi	a5,sp,384
    2a64:	1c85                	addi	s9,s9,-31
    2a66:	c39f 0006 0000      	.insn	6, 0x0006c39f
    2a6c:	0000                	unimp
    2a6e:	0000                	unimp
    2a70:	2200                	.insn	2, 0x2200
    2a72:	00000a13          	li	s4,0
    2a76:	2564                	.insn	2, 0x2564
    2a78:	0010                	.insn	2, 0x0010
    2a7a:	0060                	addi	s0,sp,12
    2a7c:	0000                	unimp
    2a7e:	8a01                	andi	a2,a2,0
    2a80:	1701                	addi	a4,a4,-32 # fffdffe0 <_stack_top+0xffed4220>
    2a82:	791d                	lui	s2,0xfffe7
    2a84:	0022                	c.slli	zero,0x8
    2a86:	1f00                	addi	s0,sp,944
    2a88:	000a                	c.slli	zero,0x2
    2a8a:	2000                	.insn	2, 0x2000
    2a8c:	00002243          	.insn	4, 0x2243
    2a90:	0a2a                	slli	s4,s4,0xa
    2a92:	0000                	unimp
    2a94:	5620                	lw	s0,104(a2)
    2a96:	0022                	c.slli	zero,0x8
    2a98:	3500                	.insn	2, 0x3500
    2a9a:	000a                	c.slli	zero,0x2
    2a9c:	2000                	.insn	2, 0x2000
    2a9e:	228c                	.insn	2, 0x228c
    2aa0:	0000                	unimp
    2aa2:	0a40                	addi	s0,sp,276
    2aa4:	0000                	unimp
    2aa6:	b722                	.insn	2, 0xb722
    2aa8:	0006                	c.slli	zero,0x1
    2aaa:	9800                	.insn	2, 0x9800
    2aac:	1025                	c.nop	-23
    2aae:	2000                	.insn	2, 0x2000
    2ab0:	0000                	unimp
    2ab2:	0100                	addi	s0,sp,128
    2ab4:	0105                	addi	sp,sp,1
    2ab6:	1c0c                	addi	a1,sp,560
    2ab8:	5901                	li	s2,-32
    2aba:	000006c3          	.insn	4, 0x06c3
    2abe:	0000                	unimp
    2ac0:	1300                	addi	s0,sp,416
    2ac2:	0664                	addi	s1,sp,780
    2ac4:	0000                	unimp
    2ac6:	2274                	.insn	2, 0x2274
    2ac8:	0010                	.insn	2, 0x0010
    2aca:	00066413          	ori	s0,a2,0
    2ace:	8c00                	.insn	2, 0x8c00
    2ad0:	13001023          	sh	a6,288(zero) # 120 <$d.4+0x7d>
    2ad4:	0664                	addi	s1,sp,780
    2ad6:	0000                	unimp
    2ad8:	2444                	.insn	2, 0x2444
    2ada:	0010                	.insn	2, 0x0010
    2adc:	00066413          	ori	s0,a2,0
    2ae0:	5800                	lw	s0,48(s0)
    2ae2:	1024                	addi	s1,sp,40
    2ae4:	1e00                	addi	s0,sp,816
    2ae6:	5c01                	li	s8,-32
    2ae8:	248c                	.insn	2, 0x248c
    2aea:	0010                	.insn	2, 0x0010
    2aec:	00066413          	ori	s0,a2,0
    2af0:	9c00                	.insn	2, 0x9c00
    2af2:	1024                	addi	s1,sp,40
    2af4:	1300                	addi	s0,sp,416
    2af6:	0664                	addi	s1,sp,780
    2af8:	0000                	unimp
    2afa:	24d8                	.insn	2, 0x24d8
    2afc:	0010                	.insn	2, 0x0010
    2afe:	00066413          	ori	s0,a2,0
    2b02:	6000                	.insn	2, 0x6000
    2b04:	1025                	c.nop	-23
    2b06:	1e00                	addi	s0,sp,816
    2b08:	5c01                	li	s8,-32
    2b0a:	2588                	.insn	2, 0x2588
    2b0c:	0010                	.insn	2, 0x0010
    2b0e:	00066413          	ori	s0,a2,0
    2b12:	ec00                	.insn	2, 0xec00
    2b14:	1025                	c.nop	-23
    2b16:	1300                	addi	s0,sp,416
    2b18:	0664                	addi	s1,sp,780
    2b1a:	0000                	unimp
    2b1c:	2648                	.insn	2, 0x2648
    2b1e:	0010                	.insn	2, 0x0010
    2b20:	2d00                	.insn	2, 0x2d00
    2b22:	0442                	slli	s0,s0,0x10
    2b24:	0000                	unimp
    2b26:	9201                	srli	a2,a2,0x20
    2b28:	9501                	srai	a0,a0,0x20
    2b2a:	0005                	c.nop	1
    2b2c:	0100                	addi	s0,sp,128
    2b2e:	c72e                	sw	a1,140(sp)
    2b30:	0002                	c.slli64	zero
    2b32:	0100                	addi	s0,sp,128
    2b34:	01a0                	addi	s0,sp,200
    2b36:	0595                	addi	a1,a1,5
    2b38:	0000                	unimp
    2b3a:	2f01                	jal	324a <$d.7+0x1402>
    2b3c:	016d                	addi	sp,sp,27
    2b3e:	0000                	unimp
    2b40:	a001                	j	2b40 <$d.7+0xcf8>
    2b42:	9501                	srai	a0,a0,0x20
    2b44:	0005                	c.nop	1
    2b46:	2b00                	.insn	2, 0x2b00
    2b48:	0376                	slli	t1,t1,0x1d
    2b4a:	0000                	unimp
    2b4c:	a201                	j	2c4c <$d.7+0xe04>
    2b4e:	9501                	srai	a0,a0,0x20
    2b50:	0005                	c.nop	1
    2b52:	0000                	unimp
    2b54:	b024                	.insn	2, 0xb024
    2b56:	1026                	c.slli	zero,0x29
    2b58:	7800                	.insn	2, 0x7800
    2b5a:	0004                	.insn	2, 0x0004
    2b5c:	0100                	addi	s0,sp,128
    2b5e:	6d52                	.insn	2, 0x6d52
    2b60:	0002                	c.slli64	zero
    2b62:	0100                	addi	s0,sp,128
    2b64:	01ae                	slli	gp,gp,0xb
    2b66:	055a                	slli	a0,a0,0x16
    2b68:	0000                	unimp
    2b6a:	9f25                	.insn	2, 0x9f25
    2b6c:	0022                	c.slli	zero,0x8
    2b6e:	b100                	.insn	2, 0xb100
    2b70:	0005                	c.nop	1
    2b72:	0100                	addi	s0,sp,128
    2b74:	067201af          	.insn	4, 0x067201af
    2b78:	0000                	unimp
    2b7a:	c825                	beqz	s0,2bea <$d.7+0xda2>
    2b7c:	0022                	c.slli	zero,0x8
    2b7e:	a700                	.insn	2, 0xa700
    2b80:	0001                	nop
    2b82:	0100                	addi	s0,sp,128
    2b84:	01b0                	addi	a2,sp,200
    2b86:	0595                	addi	a1,a1,5
    2b88:	0000                	unimp
    2b8a:	f125                	bnez	a0,2aea <$d.7+0xca2>
    2b8c:	0022                	c.slli	zero,0x8
    2b8e:	d000                	sw	s0,32(s0)
    2b90:	0001                	nop
    2b92:	0100                	addi	s0,sp,128
    2b94:	01b1                	addi	gp,gp,12
    2b96:	000011af          	.insn	4, 0x11af
    2b9a:	0326                	slli	t1,t1,0x9
    2b9c:	c891                	beqz	s1,2bb0 <$d.7+0xd68>
    2b9e:	6d00                	.insn	2, 0x6d00
    2ba0:	0001                	nop
    2ba2:	0100                	addi	s0,sp,128
    2ba4:	01b4                	addi	a3,sp,200
    2ba6:	0595                	addi	a1,a1,5
    2ba8:	0000                	unimp
    2baa:	0326                	slli	t1,t1,0x9
    2bac:	c491                	beqz	s1,2bb8 <$d.7+0xd70>
    2bae:	ae00                	.insn	2, 0xae00
    2bb0:	0006                	c.slli	zero,0x1
    2bb2:	0100                	addi	s0,sp,128
    2bb4:	01b5                	addi	gp,gp,13
    2bb6:	0595                	addi	a1,a1,5
    2bb8:	0000                	unimp
    2bba:	00232627          	.insn	4, 0x00232627
    2bbe:	2b00                	.insn	2, 0x2b00
    2bc0:	0000                	unimp
    2bc2:	0100                	addi	s0,sp,128
    2bc4:	05f201b7          	lui	gp,0x5f20
    2bc8:	0000                	unimp
    2bca:	00236527          	.insn	4, 0x00236527
    2bce:	2200                	.insn	2, 0x2200
    2bd0:	0000                	unimp
    2bd2:	0100                	addi	s0,sp,128
    2bd4:	01b6                	slli	gp,gp,0xd
    2bd6:	0595                	addi	a1,a1,5
    2bd8:	0000                	unimp
    2bda:	182a                	slli	a6,a6,0x2a
    2bdc:	1028                	addi	a0,sp,40
    2bde:	dc00                	sw	s0,56(s0)
    2be0:	0002                	c.slli64	zero
    2be2:	2700                	.insn	2, 0x2700
    2be4:	23cc                	.insn	2, 0x23cc
    2be6:	0000                	unimp
    2be8:	00000147          	.insn	4, 0x0147
    2bec:	da01                	beqz	a2,2afc <$d.7+0xcb4>
    2bee:	9501                	srai	a0,a0,0x20
    2bf0:	0005                	c.nop	1
    2bf2:	2200                	.insn	2, 0x2200
    2bf4:	0ce6                	slli	s9,s9,0x19
    2bf6:	0000                	unimp
    2bf8:	292c                	.insn	2, 0x292c
    2bfa:	0010                	.insn	2, 0x0010
    2bfc:	0090                	addi	a2,sp,64
    2bfe:	0000                	unimp
    2c00:	ef01                	bnez	a4,2c18 <$d.7+0xdd0>
    2c02:	0f01                	addi	t5,t5,0 # fffe0000 <_stack_top+0xffed4240>
    2c04:	8e1d                	sub	a2,a2,a5
    2c06:	f3000023          	sb	a6,-224(zero) # ffffff20 <_stack_top+0xffef4160>
    2c0a:	000c                	.insn	2, 0x000c
    2c0c:	2000                	.insn	2, 0x2000
    2c0e:	23ac                	.insn	2, 0x23ac
    2c10:	0000                	unimp
    2c12:	0cff 0000 d929 000c 	.insn	10, 0x2c00000cd92900000cff
    2c1a:	2c00 
    2c1c:	1029                	c.nop	-22
    2c1e:	3800                	.insn	2, 0x3800
    2c20:	0000                	unimp
    2c22:	0100                	addi	s0,sp,128
    2c24:	01a4                	addi	s1,sp,200
    2c26:	000d                	c.nop	3
    2c28:	c82a                	sw	a0,16(sp)
    2c2a:	1029                	c.nop	-22
    2c2c:	8c00                	.insn	2, 0x8c00
    2c2e:	0000                	unimp
    2c30:	2700                	.insn	2, 0x2700
    2c32:	23ea                	.insn	2, 0x23ea
    2c34:	0000                	unimp
    2c36:	000001eb          	.insn	4, 0x01eb
    2c3a:	f301                	bnez	a4,2b3a <$d.7+0xcf2>
    2c3c:	9501                	srai	a0,a0,0x20
    2c3e:	0005                	c.nop	1
    2c40:	2a00                	.insn	2, 0x2a00
    2c42:	29d8                	.insn	2, 0x29d8
    2c44:	0010                	.insn	2, 0x0010
    2c46:	006c                	addi	a1,sp,12
    2c48:	0000                	unimp
    2c4a:	00240927          	.insn	4, 0x00240927
    2c4e:	cf00                	sw	s0,24(a4)
    2c50:	0000                	unimp
    2c52:	0100                	addi	s0,sp,128
    2c54:	01f4                	addi	a3,sp,204
    2c56:	0595                	addi	a1,a1,5
    2c58:	0000                	unimp
    2c5a:	182a                	slli	a6,a6,0x2a
    2c5c:	102a                	c.slli	zero,0x2a
    2c5e:	1c00                	addi	s0,sp,560
    2c60:	0000                	unimp
    2c62:	2700                	.insn	2, 0x2700
    2c64:	241c                	.insn	2, 0x241c
    2c66:	0000                	unimp
    2c68:	0029                	c.nop	10
    2c6a:	0000                	unimp
    2c6c:	0401                	addi	s0,s0,0
    2c6e:	9502                	jalr	a0
    2c70:	0005                	c.nop	1
    2c72:	0000                	unimp
    2c74:	0000                	unimp
    2c76:	1322                	slli	t1,t1,0x28
    2c78:	000a                	c.slli	zero,0x2
    2c7a:	7000                	.insn	2, 0x7000
    2c7c:	102a                	c.slli	zero,0x2a
    2c7e:	6800                	.insn	2, 0x6800
    2c80:	0000                	unimp
    2c82:	0100                	addi	s0,sp,128
    2c84:	0214                	addi	a3,sp,256
    2c86:	249c1d13          	.insn	4, 0x249c1d13
    2c8a:	0000                	unimp
    2c8c:	0a1f 0000 5320      	.insn	6, 0x532000000a1f
    2c92:	0024                	addi	s1,sp,8
    2c94:	2a00                	.insn	2, 0x2a00
    2c96:	000a                	c.slli	zero,0x2
    2c98:	2000                	.insn	2, 0x2000
    2c9a:	2466                	.insn	2, 0x2466
    2c9c:	0000                	unimp
    2c9e:	0a35                	addi	s4,s4,13
    2ca0:	0000                	unimp
    2ca2:	8920                	.insn	2, 0x8920
    2ca4:	0024                	addi	s1,sp,8
    2ca6:	4b00                	lw	s0,16(a4)
    2ca8:	000a                	c.slli	zero,0x2
    2caa:	2000                	.insn	2, 0x2000
    2cac:	24c2                	.insn	2, 0x24c2
    2cae:	0000                	unimp
    2cb0:	0a40                	addi	s0,sp,276
    2cb2:	0000                	unimp
    2cb4:	b722                	.insn	2, 0xb722
    2cb6:	0006                	c.slli	zero,0x1
    2cb8:	a800                	.insn	2, 0xa800
    2cba:	102a                	c.slli	zero,0x2a
    2cbc:	2000                	.insn	2, 0x2000
    2cbe:	0000                	unimp
    2cc0:	0100                	addi	s0,sp,128
    2cc2:	0105                	addi	sp,sp,1
    2cc4:	1d0c                	addi	a1,sp,688
    2cc6:	000024af          	amoadd.w	s1,zero,(zero)
    2cca:	000006c3          	.insn	4, 0x06c3
    2cce:	0000                	unimp
    2cd0:	1300                	addi	s0,sp,416
    2cd2:	0664                	addi	s1,sp,780
    2cd4:	0000                	unimp
    2cd6:	2704                	.insn	2, 0x2704
    2cd8:	0010                	.insn	2, 0x0010
    2cda:	000a5713          	srli	a4,s4,0x0
    2cde:	1800                	addi	s0,sp,48
    2ce0:	13001027          	.insn	4, 0x13001027
    2ce4:	0664                	addi	s1,sp,780
    2ce6:	0000                	unimp
    2ce8:	2730                	.insn	2, 0x2730
    2cea:	0010                	.insn	2, 0x0010
    2cec:	00066413          	ori	s0,a2,0
    2cf0:	8000                	.insn	2, 0x8000
    2cf2:	13001027          	.insn	4, 0x13001027
    2cf6:	0664                	addi	s1,sp,780
    2cf8:	0000                	unimp
    2cfa:	2790                	.insn	2, 0x2790
    2cfc:	0010                	.insn	2, 0x0010
    2cfe:	000f5e13          	srli	t3,t5,0x0
    2d02:	a000                	.insn	2, 0xa000
    2d04:	13001027          	.insn	4, 0x13001027
    2d08:	0664                	addi	s1,sp,780
    2d0a:	0000                	unimp
    2d0c:	27b4                	.insn	2, 0x27b4
    2d0e:	0010                	.insn	2, 0x0010
    2d10:	00066413          	ori	s0,a2,0
    2d14:	c400                	sw	s0,8(s0)
    2d16:	13001027          	.insn	4, 0x13001027
    2d1a:	0f5e                	slli	t5,t5,0x17
    2d1c:	0000                	unimp
    2d1e:	27d4                	.insn	2, 0x27d4
    2d20:	0010                	.insn	2, 0x0010
    2d22:	00066413          	ori	s0,a2,0
    2d26:	e000                	.insn	2, 0xe000
    2d28:	13001027          	.insn	4, 0x13001027
    2d2c:	0664                	addi	s1,sp,780
    2d2e:	0000                	unimp
    2d30:	2818                	.insn	2, 0x2818
    2d32:	0010                	.insn	2, 0x0010
    2d34:	00066413          	ori	s0,a2,0
    2d38:	2c00                	.insn	2, 0x2c00
    2d3a:	1028                	addi	a0,sp,40
    2d3c:	1300                	addi	s0,sp,416
    2d3e:	0664                	addi	s1,sp,780
    2d40:	0000                	unimp
    2d42:	2900                	.insn	2, 0x2900
    2d44:	0010                	.insn	2, 0x0010
    2d46:	00066413          	ori	s0,a2,0
    2d4a:	0c00                	addi	s0,sp,528
    2d4c:	1029                	c.nop	-22
    2d4e:	1300                	addi	s0,sp,416
    2d50:	0664                	addi	s1,sp,780
    2d52:	0000                	unimp
    2d54:	292c                	.insn	2, 0x292c
    2d56:	0010                	.insn	2, 0x0010
    2d58:	00066413          	ori	s0,a2,0
    2d5c:	7800                	.insn	2, 0x7800
    2d5e:	1029                	c.nop	-22
    2d60:	1300                	addi	s0,sp,416
    2d62:	0664                	addi	s1,sp,780
    2d64:	0000                	unimp
    2d66:	29c8                	.insn	2, 0x29c8
    2d68:	0010                	.insn	2, 0x0010
    2d6a:	00066413          	ori	s0,a2,0
    2d6e:	e800                	.insn	2, 0xe800
    2d70:	1029                	c.nop	-22
    2d72:	1e00                	addi	s0,sp,816
    2d74:	5c01                	li	s8,-32
    2d76:	29f8                	.insn	2, 0x29f8
    2d78:	0010                	.insn	2, 0x0010
    2d7a:	00066413          	ori	s0,a2,0
    2d7e:	0800                	addi	s0,sp,16
    2d80:	102a                	c.slli	zero,0x2a
    2d82:	1300                	addi	s0,sp,416
    2d84:	0664                	addi	s1,sp,780
    2d86:	0000                	unimp
    2d88:	2a44                	.insn	2, 0x2a44
    2d8a:	0010                	.insn	2, 0x0010
    2d8c:	00066413          	ori	s0,a2,0
    2d90:	6400                	.insn	2, 0x6400
    2d92:	102a                	c.slli	zero,0x2a
    2d94:	1e00                	addi	s0,sp,816
    2d96:	5c01                	li	s8,-32
    2d98:	2a94                	.insn	2, 0x2a94
    2d9a:	0010                	.insn	2, 0x0010
    2d9c:	00066413          	ori	s0,a2,0
    2da0:	e800                	.insn	2, 0xe800
    2da2:	102a                	c.slli	zero,0x2a
    2da4:	0000                	unimp
    2da6:	c714                	sw	a3,8(a4)
    2da8:	0006                	c.slli	zero,0x1
    2daa:	0200                	addi	s0,sp,256
    2dac:	0d26                	slli	s10,s10,0x9
    2dae:	055a                	slli	a0,a0,0x16
    2db0:	0000                	unimp
    2db2:	2e00                	.insn	2, 0x2e00
    2db4:	000005ef          	jal	a1,2db4 <$d.7+0xf6c>
    2db8:	2101                	jal	31b8 <$d.7+0x1370>
    2dba:	5a02                	lw	s4,32(sp)
    2dbc:	0005                	c.nop	1
    2dbe:	0100                	addi	s0,sp,128
    2dc0:	0001c52f          	.insn	4, 0x0001c52f
    2dc4:	0100                	addi	s0,sp,128
    2dc6:	0221                	addi	tp,tp,8 # 8 <$d.5+0x8>
    2dc8:	0000003f 2b282400 	.insn	8, 0x2b2824000000003f
    2dd0:	0010                	.insn	2, 0x0010
    2dd2:	0420                	addi	s0,sp,520
    2dd4:	0000                	unimp
    2dd6:	5201                	li	tp,-32
    2dd8:	000002e3          	beqz	zero,35dc <$d.7+0x1794>
    2ddc:	2f01                	jal	34ec <$d.7+0x16a4>
    2dde:	5a02                	lw	s4,32(sp)
    2de0:	0005                	c.nop	1
    2de2:	2500                	.insn	2, 0x2500
    2de4:	24d5                	jal	30c8 <$d.7+0x1280>
    2de6:	0000                	unimp
    2de8:	05b1                	addi	a1,a1,12
    2dea:	0000                	unimp
    2dec:	3001                	jal	25ec <$d.7+0x7a4>
    2dee:	7202                	.insn	2, 0x7202
    2df0:	0006                	c.slli	zero,0x1
    2df2:	2500                	.insn	2, 0x2500
    2df4:	24fe                	.insn	2, 0x24fe
    2df6:	0000                	unimp
    2df8:	000001a7          	.insn	4, 0x01a7
    2dfc:	3101                	jal	29fc <$d.7+0xbb4>
    2dfe:	9502                	jalr	a0
    2e00:	0005                	c.nop	1
    2e02:	2500                	.insn	2, 0x2500
    2e04:	00002527          	.insn	4, 0x2527
    2e08:	00000357          	.insn	4, 0x0357
    2e0c:	3201                	jal	270c <$d.7+0x8c4>
    2e0e:	af02                	.insn	2, 0xaf02
    2e10:	0011                	c.nop	4
    2e12:	2600                	.insn	2, 0x2600
    2e14:	9102                	jalr	sp
    2e16:	ae34                	.insn	2, 0xae34
    2e18:	0006                	c.slli	zero,0x1
    2e1a:	0100                	addi	s0,sp,128
    2e1c:	0236                	slli	tp,tp,0xd
    2e1e:	0595                	addi	a1,a1,5
    2e20:	0000                	unimp
    2e22:	00255c27          	.insn	4, 0x00255c27
    2e26:	6d00                	.insn	2, 0x6d00
    2e28:	0001                	nop
    2e2a:	0100                	addi	s0,sp,128
    2e2c:	0235                	addi	tp,tp,13 # d <$d.5+0xd>
    2e2e:	0595                	addi	a1,a1,5
    2e30:	0000                	unimp
    2e32:	00258727          	.insn	4, 0x00258727
    2e36:	2b00                	.insn	2, 0x2b00
    2e38:	0000                	unimp
    2e3a:	0100                	addi	s0,sp,128
    2e3c:	0238                	addi	a4,sp,264
    2e3e:	05fc                	addi	a5,sp,716
    2e40:	0000                	unimp
    2e42:	00259a27          	.insn	4, 0x00259a27
    2e46:	2200                	.insn	2, 0x2200
    2e48:	0000                	unimp
    2e4a:	0100                	addi	s0,sp,128
    2e4c:	05950237          	lui	tp,0x5950
    2e50:	0000                	unimp
    2e52:	0025ad27          	.insn	4, 0x0025ad27
    2e56:	dc00                	sw	s0,56(s0)
    2e58:	0001                	nop
    2e5a:	0100                	addi	s0,sp,128
    2e5c:	0239                	addi	tp,tp,14 # 595000e <_stack_top+0x584424e>
    2e5e:	0595                	addi	a1,a1,5
    2e60:	0000                	unimp
    2e62:	0025cc27          	.insn	4, 0x0025cc27
    2e66:	1f00                	addi	s0,sp,944
    2e68:	0002                	c.slli64	zero
    2e6a:	0100                	addi	s0,sp,128
    2e6c:	023a                	slli	tp,tp,0xe
    2e6e:	0595                	addi	a1,a1,5
    2e70:	0000                	unimp
    2e72:	00260227          	.insn	4, 0x00260227
    2e76:	e800                	.insn	2, 0xe800
    2e78:	0006                	c.slli	zero,0x1
    2e7a:	0100                	addi	s0,sp,128
    2e7c:	0595023b          	.insn	4, 0x0595023b
    2e80:	0000                	unimp
    2e82:	b42a                	.insn	2, 0xb42a
    2e84:	102c                	addi	a1,sp,40
    2e86:	2c00                	.insn	2, 0x2c00
    2e88:	0002                	c.slli64	zero
    2e8a:	2700                	.insn	2, 0x2700
    2e8c:	2681                	jal	31cc <$d.7+0x1384>
    2e8e:	0000                	unimp
    2e90:	00000147          	.insn	4, 0x0147
    2e94:	5701                	li	a4,-32
    2e96:	9502                	jalr	a0
    2e98:	0005                	c.nop	1
    2e9a:	2c00                	.insn	2, 0x2c00
    2e9c:	0ce6                	slli	s9,s9,0x19
    2e9e:	0000                	unimp
    2ea0:	04b8                	addi	a4,sp,584
    2ea2:	0000                	unimp
    2ea4:	6801                	.insn	2, 0x6801
    2ea6:	0f02                	c.slli64	t5
    2ea8:	431d                	li	t1,7
    2eaa:	0026                	c.slli	zero,0x9
    2eac:	f300                	.insn	2, 0xf300
    2eae:	000c                	.insn	2, 0x000c
    2eb0:	2000                	.insn	2, 0x2000
    2eb2:	2661                	jal	323a <$d.7+0x13f2>
    2eb4:	0000                	unimp
    2eb6:	0cff 0000 d929 000c 	.insn	10, 0xbc00000cd92900000cff
    2ebe:	bc00 
    2ec0:	102c                	addi	a1,sp,40
    2ec2:	3c00                	.insn	2, 0x3c00
    2ec4:	0000                	unimp
    2ec6:	0100                	addi	s0,sp,128
    2ec8:	01a4                	addi	s1,sp,200
    2eca:	000d                	c.nop	3
    2ecc:	d028                	sw	a0,96(s0)
    2ece:	0004                	.insn	2, 0x0004
    2ed0:	2700                	.insn	2, 0x2700
    2ed2:	000026b7          	lui	a3,0x2
    2ed6:	000001eb          	.insn	4, 0x01eb
    2eda:	6a01                	.insn	2, 0x6a01
    2edc:	9502                	jalr	a0
    2ede:	0005                	c.nop	1
    2ee0:	2a00                	.insn	2, 0x2a00
    2ee2:	2d88                	.insn	2, 0x2d88
    2ee4:	0010                	.insn	2, 0x0010
    2ee6:	00bc                	addi	a5,sp,72
    2ee8:	0000                	unimp
    2eea:	0026d627          	.insn	4, 0x0026d627
    2eee:	0e00                	addi	s0,sp,784
    2ef0:	0006                	c.slli	zero,0x1
    2ef2:	0100                	addi	s0,sp,128
    2ef4:	0595026b          	.insn	4, 0x0595026b
    2ef8:	0000                	unimp
    2efa:	cc2a                	sw	a0,24(sp)
    2efc:	102d                	c.nop	-21
    2efe:	7800                	.insn	2, 0x7800
    2f00:	0000                	unimp
    2f02:	2b00                	.insn	2, 0x2b00
    2f04:	0029                	c.nop	10
    2f06:	0000                	unimp
    2f08:	7701                	lui	a4,0xfffe0
    2f0a:	9502                	jalr	a0
    2f0c:	0005                	c.nop	1
    2f0e:	2a00                	.insn	2, 0x2a00
    2f10:	2dd8                	.insn	2, 0x2dd8
    2f12:	0010                	.insn	2, 0x0010
    2f14:	006c                	addi	a1,sp,12
    2f16:	0000                	unimp
    2f18:	00270727          	.insn	4, 0x00270727
    2f1c:	c500                	sw	s0,8(a0)
    2f1e:	0001                	nop
    2f20:	0100                	addi	s0,sp,128
    2f22:	0278                	addi	a4,sp,268
    2f24:	0000003f 00272527 	.insn	8, 0x002725270000003f
    2f2c:	ed00                	.insn	2, 0xed00
    2f2e:	0006                	c.slli	zero,0x1
    2f30:	0100                	addi	s0,sp,128
    2f32:	0279                	addi	tp,tp,30 # 1e <$d.5+0x1e>
    2f34:	055a                	slli	a0,a0,0x16
    2f36:	0000                	unimp
    2f38:	6b2c                	.insn	2, 0x6b2c
    2f3a:	e800000f          	.insn	4, 0xe800000f
    2f3e:	0004                	.insn	2, 0x0004
    2f40:	0100                	addi	s0,sp,128
    2f42:	1d15027b          	.insn	4, 0x1d15027b
    2f46:	26e9                	jal	3310 <$d.7+0x14c8>
    2f48:	0000                	unimp
    2f4a:	0f78                	addi	a4,sp,924
    2f4c:	0000                	unimp
    2f4e:	0000                	unimp
    2f50:	0000                	unimp
    2f52:	2200                	.insn	2, 0x2200
    2f54:	00000a13          	li	s4,0
    2f58:	2e58                	.insn	2, 0x2e58
    2f5a:	0010                	.insn	2, 0x0010
    2f5c:	0074                	addi	a3,sp,12
    2f5e:	0000                	unimp
    2f60:	9801                	andi	s0,s0,-32
    2f62:	1302                	slli	t1,t1,0x20
    2f64:	431d                	li	t1,7
    2f66:	1f000027          	.insn	4, 0x1f000027
    2f6a:	000a                	c.slli	zero,0x2
    2f6c:	2000                	.insn	2, 0x2000
    2f6e:	276e                	.insn	2, 0x276e
    2f70:	0000                	unimp
    2f72:	00000a4b          	.insn	4, 0x0a4b
    2f76:	a720                	.insn	2, 0xa720
    2f78:	35000027          	.insn	4, 0x35000027
    2f7c:	000a                	c.slli	zero,0x2
    2f7e:	2000                	.insn	2, 0x2000
    2f80:	000027f3          	.insn	4, 0x27f3
    2f84:	0a2a                	slli	s4,s4,0xa
    2f86:	0000                	unimp
    2f88:	4021                	c.li	zero,8
    2f8a:	000a                	c.slli	zero,0x2
    2f8c:	2200                	.insn	2, 0x2200
    2f8e:	000006b7          	lui	a3,0x0
    2f92:	2ea0                	.insn	2, 0x2ea0
    2f94:	0010                	.insn	2, 0x0010
    2f96:	0020                	addi	s0,sp,8
    2f98:	0000                	unimp
    2f9a:	0501                	addi	a0,a0,0
    2f9c:	0c01                	addi	s8,s8,0
    2f9e:	431d                	li	t1,7
    2fa0:	0028                	addi	a0,sp,8
    2fa2:	c300                	sw	s0,0(a4)
    2fa4:	0006                	c.slli	zero,0x1
    2fa6:	0000                	unimp
    2fa8:	0000                	unimp
    2faa:	00066413          	ori	s0,a2,0
    2fae:	7c00                	.insn	2, 0x7c00
    2fb0:	1300102b          	.insn	4, 0x1300102b
    2fb4:	00000a57          	.insn	4, 0x0a57
    2fb8:	2b90                	.insn	2, 0x2b90
    2fba:	0010                	.insn	2, 0x0010
    2fbc:	00066413          	ori	s0,a2,0
    2fc0:	a800                	.insn	2, 0xa800
    2fc2:	1300102b          	.insn	4, 0x1300102b
    2fc6:	0664                	addi	s1,sp,780
    2fc8:	0000                	unimp
    2fca:	2bf8                	.insn	2, 0x2bf8
    2fcc:	0010                	.insn	2, 0x0010
    2fce:	00066413          	ori	s0,a2,0
    2fd2:	1000                	addi	s0,sp,32
    2fd4:	102d                	c.nop	-21
    2fd6:	1e00                	addi	s0,sp,816
    2fd8:	5c01                	li	s8,-32
    2fda:	2da8                	.insn	2, 0x2da8
    2fdc:	0010                	.insn	2, 0x0010
    2fde:	011e                	slli	sp,sp,0x7
    2fe0:	805c                	.insn	2, 0x805c
    2fe2:	102e                	c.slli	zero,0x2b
    2fe4:	0000                	unimp
    2fe6:	0005060b          	.insn	4, 0x0005060b
    2fea:	0300                	addi	s0,sp,384
    2fec:	0000003f 00004604 	.insn	8, 0x46040000003f
    2ff4:	0b00                	addi	s0,sp,400
    2ff6:	0b00                	addi	s0,sp,400
    2ff8:	0595                	addi	a1,a1,5
    2ffa:	0000                	unimp
    2ffc:	2d00                	.insn	2, 0x2d00
    2ffe:	0000                	unimp
    3000:	0500                	addi	s0,sp,640
    3002:	0100                	addi	s0,sp,128
    3004:	db04                	sw	s1,48(a4)
    3006:	0008                	.insn	2, 0x0008
    3008:	0100                	addi	s0,sp,128
    300a:	2eb0                	.insn	2, 0x2eb0
    300c:	0000                	unimp
    300e:	2f48                	.insn	2, 0x2f48
    3010:	0010                	.insn	2, 0x0010
    3012:	5e18                	lw	a4,56(a2)
    3014:	0000                	unimp
    3016:	8e00                	.insn	2, 0x8e00
    3018:	b3000003          	lb	zero,-1232(zero) # fffffb30 <_stack_top+0xffef3d70>
    301c:	0006                	c.slli	zero,0x1
    301e:	0100                	addi	s0,sp,128
    3020:	0280                	addi	s0,sp,320
    3022:	0108                	addi	a0,sp,128
    3024:	0000                	unimp
    3026:	102f482f          	.insn	4, 0x102f482f
    302a:	1400                	addi	s0,sp,544
    302c:	005a0003          	lb	zero,5(s4)
    3030:	0000                	unimp
    3032:	0005                	c.nop	1
    3034:	0401                	addi	s0,s0,0
    3036:	00000903          	lb	s2,0(zero) # 0 <$d.5>
    303a:	2a01                	jal	314a <$d.7+0x1302>
    303c:	5c00002f          	.insn	4, 0x5c00002f
    3040:	8600102f          	.insn	4, 0x8600102f
    3044:	e401                	bnez	s0,304c <$d.7+0x1204>
    3046:	8e000003          	lb	zero,-1824(zero) # fffff8e0 <_stack_top+0xffef3b20>
    304a:	b3000003          	lb	zero,-1232(zero) # fffffb30 <_stack_top+0xffef3d70>
    304e:	0006                	c.slli	zero,0x1
    3050:	0100                	addi	s0,sp,128
    3052:	0280                	addi	s0,sp,320
    3054:	01e2                	slli	gp,gp,0x18
    3056:	0000                	unimp
    3058:	5c5c                	lw	a5,60(s0)
    305a:	5c00102f          	.insn	4, 0x5c00102f
    305e:	0402                	c.slli64	s0
    3060:	0005                	c.nop	1
    3062:	5c00                	lw	s0,56(s0)
    3064:	2f64                	.insn	2, 0x2f64
    3066:	0010                	.insn	2, 0x0010
    3068:	022c                	addi	a1,sp,264
    306a:	0572                	slli	a0,a0,0x1c
    306c:	0000                	unimp
    306e:	645c                	.insn	2, 0x645c
    3070:	2c00102f          	.insn	4, 0x2c00102f
    3074:	0e02                	c.slli64	t3
    3076:	5c000007          	.insn	4, 0x5c000007
    307a:	2f90                	.insn	2, 0x2f90
    307c:	0010                	.insn	2, 0x0010
    307e:	0208                	addi	a0,sp,256
    3080:	0111                	addi	sp,sp,4
    3082:	0000                	unimp
    3084:	b45c                	.insn	2, 0xb45c
    3086:	2400102f          	.insn	4, 0x2400102f
    308a:	0003                	.short	0x0003

セクション .debug_abbrev の逆アセンブル:

00000000 <$d.4>:
   0:	1101                	addi	sp,sp,-32
   2:	1001                	c.nop	-32
   4:	12011117          	auipc	sp,0x12011
   8:	0301                	addi	t1,t1,0
   a:	1b08                	addi	a0,sp,432
   c:	2508                	.insn	2, 0x2508
   e:	1308                	addi	a0,sp,416
  10:	0005                	c.nop	1
  12:	0200                	addi	s0,sp,256
  14:	000a                	c.slli	zero,0x2
  16:	063a0803          	lb	a6,99(s4)
  1a:	0111063b          	.insn	4, 0x0111063b
  1e:	0000                	unimp
	...

00000021 <$d.3>:
  21:	1101                	addi	sp,sp,-32 # 12010fe4 <_stack_top+0x11f05224>
  23:	2501                	jal	623 <$d.3+0x168>
  25:	130e                	slli	t1,t1,0x23
  27:	0305                	addi	t1,t1,1
  29:	100e                	c.slli	zero,0x23
  2b:	110e1b17          	auipc	s6,0x110e1
  2f:	1201                	addi	tp,tp,-32 # ffffffe0 <_stack_top+0xffef4220>
  31:	0006                	c.slli	zero,0x1
  33:	0200                	addi	s0,sp,256
  35:	0034                	addi	a3,sp,8
  37:	1349                	addi	t1,t1,-14
  39:	0b3a                	slli	s6,s6,0xe
  3b:	18020b3b          	.insn	4, 0x18020b3b
  3f:	0000                	unimp
  41:	49010103          	lb	sp,1168(sp)
  45:	04000013          	li	zero,64
  49:	0021                	c.nop	8
  4b:	1349                	addi	t1,t1,-14
  4d:	00000b37          	lui	s6,0x0
  51:	2405                	jal	271 <$d.3+0x18>
  53:	0300                	addi	s0,sp,384
  55:	3e0e                	.insn	2, 0x3e0e
  57:	000b0b0b          	.insn	4, 0x000b0b0b
  5b:	0600                	addi	s0,sp,768
  5d:	0024                	addi	s1,sp,8
  5f:	0b0b0e03          	lb	t3,176(s6) # b0 <$d.4+0xd>
  63:	0b3e                	slli	s6,s6,0xf
  65:	0000                	unimp
  67:	49003407          	.insn	4, 0x49003407
  6b:	3b0b3a13          	sltiu	s4,s6,944
  6f:	0205                	addi	tp,tp,1 # 1 <$d.4+0x1>
  71:	0018                	.insn	2, 0x0018
  73:	0800                	addi	s0,sp,16
  75:	0034                	addi	a3,sp,8
  77:	1349                	addi	t1,t1,-14
  79:	0b3a                	slli	s6,s6,0xe
  7b:	00000b3b          	.insn	4, 0x0b3b
  7f:	1609                	addi	a2,a2,-30 # fffdffe2 <_stack_top+0xffed4222>
  81:	4900                	lw	s0,16(a0)
  83:	3a0e0313          	addi	t1,t3,928
  87:	000b3b0b          	.insn	4, 0x000b3b0b
  8b:	0a00                	addi	s0,sp,272
  8d:	1349000f          	.insn	4, 0x1349000f
  91:	0000                	unimp
  93:	4900350b          	.insn	4, 0x4900350b
  97:	0c000013          	li	zero,192
  9b:	0015                	c.nop	5
  9d:	00001927          	.insn	4, 0x1927
  a1:	2e0d                	jal	3d3 <$d.8+0xb>
  a3:	0301                	addi	t1,t1,0
  a5:	3a0e                	.insn	2, 0x3a0e
  a7:	270b3b0b          	.insn	4, 0x270b3b0b
  ab:	4919                	li	s2,6
  ad:	000b2013          	slti	zero,s6,0
  b1:	0e00                	addi	s0,sp,784
  b3:	0005                	c.nop	1
  b5:	0b3a0e03          	lb	t3,179(s4)
  b9:	13490b3b          	.insn	4, 0x13490b3b
  bd:	0000                	unimp
  bf:	03012e0f          	.insn	4, 0x03012e0f
  c3:	3a0e                	.insn	2, 0x3a0e
  c5:	270b3b0b          	.insn	4, 0x270b3b0b
  c9:	2019                	jal	cf <$d.4+0x2c>
  cb:	1000000b          	.insn	4, 0x1000000b
  cf:	012e                	slli	sp,sp,0xb
  d1:	0111                	addi	sp,sp,4
  d3:	0612                	slli	a2,a2,0x4
  d5:	1840                	addi	s0,sp,52
  d7:	31194297          	auipc	t0,0x31194
  db:	11000013          	li	zero,272
  df:	0005                	c.nop	1
  e1:	1802                	slli	a6,a6,0x20
  e3:	1331                	addi	t1,t1,-20
  e5:	0000                	unimp
  e7:	1d12                	slli	s10,s10,0x24
  e9:	3101                	jal	fffffce9 <_stack_top+0xffef3f29>
  eb:	12011113          	.insn	4, 0x12011113
  ef:	5806                	lw	a6,96(sp)
  f1:	570b590b          	.insn	4, 0x570b590b
  f5:	1300000b          	.insn	4, 0x1300000b
  f9:	0005                	c.nop	1
  fb:	0f1c                	addi	a5,sp,912
  fd:	1331                	addi	t1,t1,-20
  ff:	0000                	unimp
 101:	2e14                	.insn	2, 0x2e14
 103:	0301                	addi	t1,t1,0
 105:	3a0e                	.insn	2, 0x3a0e
 107:	270b3b0b          	.insn	4, 0x270b3b0b
 10b:	3f19                	jal	21 <$d.3>
 10d:	2019                	jal	113 <$d.4+0x70>
 10f:	1500000b          	.insn	4, 0x1500000b
 113:	012e                	slli	sp,sp,0xb
 115:	0111                	addi	sp,sp,4
 117:	0612                	slli	a2,a2,0x4
 119:	1840                	addi	s0,sp,52
 11b:	03194297          	auipc	t0,0x3194
 11f:	3a0e                	.insn	2, 0x3a0e
 121:	270b3b0b          	.insn	4, 0x270b3b0b
 125:	3f19                	jal	3b <$d.3+0x1a>
 127:	0019                	c.nop	6
 129:	1600                	addi	s0,sp,800
 12b:	0005                	c.nop	1
 12d:	1802                	slli	a6,a6,0x20
 12f:	0b3a0e03          	lb	t3,179(s4)
 133:	13490b3b          	.insn	4, 0x13490b3b
 137:	0000                	unimp
 139:	49002617          	auipc	a2,0x49002
 13d:	18000013          	li	zero,384
 141:	0034                	addi	a3,sp,8
 143:	0b3a0e03          	lb	t3,179(s4)
 147:	13490b3b          	.insn	4, 0x13490b3b
 14b:	0000                	unimp
 14d:	2e19                	jal	463 <$d.8+0x9b>
 14f:	0300                	addi	s0,sp,384
 151:	3a0e                	.insn	2, 0x3a0e
 153:	270b3b0b          	.insn	4, 0x270b3b0b
 157:	2019                	jal	15d <$d.4+0xba>
 159:	1a00000b          	.insn	4, 0x1a00000b
 15d:	0034                	addi	a3,sp,8
 15f:	1802                	slli	a6,a6,0x20
 161:	0b3a0e03          	lb	t3,179(s4)
 165:	13490b3b          	.insn	4, 0x13490b3b
 169:	0000                	unimp
 16b:	0200051b          	.insn	4, 0x0200051b
 16f:	00133117          	auipc	sp,0x133
 173:	1c00                	addi	s0,sp,560
 175:	011d                	addi	sp,sp,7 # 133176 <_stack_top+0x273b6>
 177:	1331                	addi	t1,t1,-20
 179:	1755                	addi	a4,a4,-11 # fffdfff5 <_stack_top+0xffed4235>
 17b:	0b58                	addi	a4,sp,404
 17d:	0b59                	addi	s6,s6,22
 17f:	00000b57          	.insn	4, 0x0b57
 183:	1d1d                	addi	s10,s10,-25
 185:	3100                	.insn	2, 0x3100
 187:	12011113          	.insn	4, 0x12011113
 18b:	5806                	lw	a6,96(sp)
 18d:	570b590b          	.insn	4, 0x570b590b
 191:	1e00000b          	.insn	4, 0x1e00000b
 195:	0034                	addi	a3,sp,8
 197:	1702                	slli	a4,a4,0x20
 199:	1331                	addi	t1,t1,-20
 19b:	0000                	unimp
 19d:	1d1f 3101 1113      	.insn	6, 0x111331011d1f
 1a3:	1201                	addi	tp,tp,-32 # ffffffe0 <_stack_top+0xffef4220>
 1a5:	5806                	lw	a6,96(sp)
 1a7:	5705590b          	.insn	4, 0x5705590b
 1ab:	2000000b          	.insn	4, 0x2000000b
 1af:	0034                	addi	a3,sp,8
 1b1:	0f1c                	addi	a5,sp,912
 1b3:	1331                	addi	t1,t1,-20
 1b5:	0000                	unimp
 1b7:	8921                	andi	a0,a0,8
 1b9:	0182                	c.slli64	gp
 1bb:	3100                	.insn	2, 0x3100
 1bd:	00011113          	slli	sp,sp,0x0
 1c1:	2200                	.insn	2, 0x2200
 1c3:	8289                	srli	a3,a3,0x2
 1c5:	0001                	nop
 1c7:	11184293          	xori	t0,a6,273
 1cb:	0001                	nop
 1cd:	2300                	.insn	2, 0x2300
 1cf:	012e                	slli	sp,sp,0xb
 1d1:	0b3a0e03          	lb	t3,179(s4)
 1d5:	19270b3b          	.insn	4, 0x19270b3b
 1d9:	1349                	addi	t1,t1,-14
 1db:	193c                	addi	a5,sp,184
 1dd:	0000193f 49000524 	.insn	8, 0x490005240000193f
 1e5:	25000013          	li	zero,592
 1e9:	0115                	addi	sp,sp,5
 1eb:	1349                	addi	t1,t1,-14
 1ed:	00001927          	.insn	4, 0x1927
 1f1:	1626                	slli	a2,a2,0x29
 1f3:	4900                	lw	s0,16(a0)
 1f5:	3a0e0313          	addi	t1,t3,928
 1f9:	00053b0b          	.insn	4, 0x00053b0b
 1fd:	2700                	.insn	2, 0x2700
 1ff:	0111010b          	.insn	4, 0x0111010b
 203:	0612                	slli	a2,a2,0x4
 205:	0000                	unimp
 207:	0b28                	addi	a0,sp,408
 209:	0001                	nop
 20b:	2900                	.insn	2, 0x2900
 20d:	012e                	slli	sp,sp,0xb
 20f:	0111                	addi	sp,sp,4
 211:	0612                	slli	a2,a2,0x4
 213:	1840                	addi	s0,sp,52
 215:	03194297          	auipc	t0,0x3194
 219:	3a0e                	.insn	2, 0x3a0e
 21b:	270b3b0b          	.insn	4, 0x270b3b0b
 21f:	4919                	li	s2,6
 221:	2a000013          	li	zero,672
 225:	0005                	c.nop	1
 227:	1702                	slli	a4,a4,0x20
 229:	0b3a0e03          	lb	t3,179(s4)
 22d:	13490b3b          	.insn	4, 0x13490b3b
 231:	0000                	unimp
 233:	0200342b          	.insn	4, 0x0200342b
 237:	3a0e0317          	auipc	t1,0x3a0e0
 23b:	490b3b0b          	.insn	4, 0x490b3b0b
 23f:	2c000013          	li	zero,704
 243:	1755010b          	.insn	4, 0x1755010b
 247:	0000                	unimp
 249:	1d2d                	addi	s10,s10,-21
 24b:	3101                	jal	fffffe4b <_stack_top+0xffef408b>
 24d:	12011113          	.insn	4, 0x12011113
 251:	5806                	lw	a6,96(sp)
 253:	000b590b          	.insn	4, 0x000b590b
	...

00000259 <$d.3>:
 259:	1101                	addi	sp,sp,-32
 25b:	2501                	jal	85b <$d.6+0x1e8>
 25d:	130e                	slli	t1,t1,0x23
 25f:	0305                	addi	t1,t1,1 # 3a0e0238 <_stack_top+0x39fd4478>
 261:	100e                	c.slli	zero,0x23
 263:	110e1b17          	auipc	s6,0x110e1
 267:	1201                	addi	tp,tp,-32 # ffffffe0 <_stack_top+0xffef4220>
 269:	0006                	c.slli	zero,0x1
 26b:	0200                	addi	s0,sp,256
 26d:	0034                	addi	a3,sp,8
 26f:	1349                	addi	t1,t1,-14
 271:	0b3a                	slli	s6,s6,0xe
 273:	18020b3b          	.insn	4, 0x18020b3b
 277:	0000                	unimp
 279:	49010103          	lb	sp,1168(sp)
 27d:	04000013          	li	zero,64
 281:	0021                	c.nop	8
 283:	1349                	addi	t1,t1,-14
 285:	00000b37          	lui	s6,0x0
 289:	2405                	jal	4a9 <$d.8+0xe1>
 28b:	0300                	addi	s0,sp,384
 28d:	3e0e                	.insn	2, 0x3e0e
 28f:	000b0b0b          	.insn	4, 0x000b0b0b
 293:	0600                	addi	s0,sp,768
 295:	0024                	addi	s1,sp,8
 297:	0b0b0e03          	lb	t3,176(s6) # b0 <$d.4+0xd>
 29b:	0b3e                	slli	s6,s6,0xf
 29d:	0000                	unimp
 29f:	49003407          	.insn	4, 0x49003407
 2a3:	3b0b3a13          	sltiu	s4,s6,944
 2a7:	0205                	addi	tp,tp,1 # 1 <$d.4+0x1>
 2a9:	0018                	.insn	2, 0x0018
 2ab:	0800                	addi	s0,sp,16
 2ad:	012e                	slli	sp,sp,0xb
 2af:	0000                	unimp
 2b1:	3409                	jal	fffffcb3 <_stack_top+0xffef3ef3>
 2b3:	0300                	addi	s0,sp,384
 2b5:	490e                	lw	s2,192(sp)
 2b7:	3b0b3a13          	sltiu	s4,s6,944
 2bb:	0018020b          	.insn	4, 0x0018020b
 2bf:	0a00                	addi	s0,sp,272
 2c1:	0026                	c.slli	zero,0x9
 2c3:	1349                	addi	t1,t1,-14
 2c5:	0000                	unimp
 2c7:	49000f0b          	.insn	4, 0x49000f0b
 2cb:	0c000013          	li	zero,192
 2cf:	0016                	c.slli	zero,0x5
 2d1:	1349                	addi	t1,t1,-14
 2d3:	0b3a0e03          	lb	t3,179(s4)
 2d7:	00000b3b          	.insn	4, 0x0b3b
 2db:	260d                	jal	5fd <$d.3+0x142>
 2dd:	0000                	unimp
 2df:	0e00                	addi	s0,sp,784
 2e1:	012e                	slli	sp,sp,0xb
 2e3:	0111                	addi	sp,sp,4
 2e5:	0612                	slli	a2,a2,0x4
 2e7:	1840                	addi	s0,sp,52
 2e9:	03194297          	auipc	t0,0x3194
 2ed:	3a0e                	.insn	2, 0x3a0e
 2ef:	270b3b0b          	.insn	4, 0x270b3b0b
 2f3:	4919                	li	s2,6
 2f5:	00193f13          	seqz	t5,s2
 2f9:	0f00                	addi	s0,sp,912
 2fb:	0005                	c.nop	1
 2fd:	1802                	slli	a6,a6,0x20
 2ff:	0b3a0e03          	lb	t3,179(s4)
 303:	13490b3b          	.insn	4, 0x13490b3b
 307:	0000                	unimp
 309:	0510                	addi	a2,sp,640
 30b:	0200                	addi	s0,sp,256
 30d:	3a0e0317          	auipc	t1,0x3a0e0
 311:	490b3b0b          	.insn	4, 0x490b3b0b
 315:	11000013          	li	zero,272
 319:	0034                	addi	a3,sp,8
 31b:	1702                	slli	a4,a4,0x20
 31d:	0b3a0e03          	lb	t3,179(s4)
 321:	13490b3b          	.insn	4, 0x13490b3b
 325:	0000                	unimp
 327:	3412                	.insn	2, 0x3412
 329:	0200                	addi	s0,sp,256
 32b:	0318                	addi	a4,sp,384
 32d:	3a0e                	.insn	2, 0x3a0e
 32f:	490b3b0b          	.insn	4, 0x490b3b0b
 333:	13000013          	li	zero,304
 337:	012e                	slli	sp,sp,0xb
 339:	0b3a0e03          	lb	t3,179(s4)
 33d:	19270b3b          	.insn	4, 0x19270b3b
 341:	1349                	addi	t1,t1,-14 # 3a0e02ff <_stack_top+0x39fd453f>
 343:	0b20                	addi	s0,sp,408
 345:	0000                	unimp
 347:	0514                	addi	a3,sp,640
 349:	0300                	addi	s0,sp,384
 34b:	3a0e                	.insn	2, 0x3a0e
 34d:	490b3b0b          	.insn	4, 0x490b3b0b
 351:	15000013          	li	zero,336
 355:	0034                	addi	a3,sp,8
 357:	0b3a0e03          	lb	t3,179(s4)
 35b:	13490b3b          	.insn	4, 0x13490b3b
 35f:	0000                	unimp
 361:	0b16                	slli	s6,s6,0x5
 363:	0001                	nop
 365:	1700                	addi	s0,sp,928
 367:	012e                	slli	sp,sp,0xb
 369:	0111                	addi	sp,sp,4
 36b:	0612                	slli	a2,a2,0x4
 36d:	1840                	addi	s0,sp,52
 36f:	03194297          	auipc	t0,0x3194
 373:	3a0e                	.insn	2, 0x3a0e
 375:	270b3b0b          	.insn	4, 0x270b3b0b
 379:	3f19                	jal	28f <$d.6+0xd>
 37b:	0019                	c.nop	6
 37d:	1800                	addi	s0,sp,48
 37f:	0111010b          	.insn	4, 0x0111010b
 383:	0612                	slli	a2,a2,0x4
 385:	0000                	unimp
 387:	1d19                	addi	s10,s10,-26
 389:	3101                	jal	ffffff89 <_stack_top+0xffef41c9>
 38b:	12011113          	.insn	4, 0x12011113
 38f:	5806                	lw	a6,96(sp)
 391:	570b590b          	.insn	4, 0x570b590b
 395:	1a00000b          	.insn	4, 0x1a00000b
 399:	0034                	addi	a3,sp,8
 39b:	1702                	slli	a4,a4,0x20
 39d:	1331                	addi	t1,t1,-20
 39f:	0000                	unimp
 3a1:	0200341b          	.insn	4, 0x0200341b
 3a5:	3118                	.insn	2, 0x3118
 3a7:	1c000013          	li	zero,448
 3ab:	8289                	srli	a3,a3,0x2
 3ad:	0001                	nop
 3af:	1331                	addi	t1,t1,-20
 3b1:	4295                	li	t0,5
 3b3:	1119                	addi	sp,sp,-26
 3b5:	0001                	nop
 3b7:	1d00                	addi	s0,sp,688
 3b9:	8289                	srli	a3,a3,0x2
 3bb:	0001                	nop
 3bd:	1331                	addi	t1,t1,-20
 3bf:	0111                	addi	sp,sp,4
 3c1:	0000                	unimp
 3c3:	2e1e                	.insn	2, 0x2e1e
 3c5:	0301                	addi	t1,t1,0
 3c7:	3a0e                	.insn	2, 0x3a0e
 3c9:	270b3b0b          	.insn	4, 0x270b3b0b
 3cd:	3c19                	jal	fffffde3 <_stack_top+0xffef4023>
 3cf:	3f19                	jal	2e5 <$d.6+0x63>
 3d1:	0019                	c.nop	6
 3d3:	1f00                	addi	s0,sp,944
 3d5:	0005                	c.nop	1
 3d7:	1349                	addi	t1,t1,-14
 3d9:	0000                	unimp
 3db:	0a20                	addi	s0,sp,280
 3dd:	0300                	addi	s0,sp,384
 3df:	3a0e                	.insn	2, 0x3a0e
 3e1:	110b3b0b          	.insn	4, 0x110b3b0b
 3e5:	0001                	nop
 3e7:	2100                	.insn	2, 0x2100
 3e9:	1755010b          	.insn	4, 0x1755010b
 3ed:	0000                	unimp
 3ef:	1822                	slli	a6,a6,0x28
 3f1:	0000                	unimp
 3f3:	2300                	.insn	2, 0x2300
 3f5:	012e                	slli	sp,sp,0xb
 3f7:	0111                	addi	sp,sp,4
 3f9:	0612                	slli	a2,a2,0x4
 3fb:	1840                	addi	s0,sp,52
 3fd:	31194297          	auipc	t0,0x31194
 401:	24000013          	li	zero,576
 405:	0005                	c.nop	1
 407:	1702                	slli	a4,a4,0x20
 409:	1331                	addi	t1,t1,-20
 40b:	0000                	unimp
 40d:	0525                	addi	a0,a0,9
 40f:	0200                	addi	s0,sp,256
 411:	3118                	.insn	2, 0x3118
 413:	26000013          	li	zero,608
 417:	012e                	slli	sp,sp,0xb
 419:	0b3a0e03          	lb	t3,179(s4)
 41d:	19270b3b          	.insn	4, 0x19270b3b
 421:	0b20                	addi	s0,sp,408
 423:	0000                	unimp
 425:	11012e27          	.insn	4, 0x11012e27
 429:	1201                	addi	tp,tp,-32 # ffffffe0 <_stack_top+0xffef4220>
 42b:	4006                	.insn	2, 0x4006
 42d:	9718                	.insn	2, 0x9718
 42f:	1942                	slli	s2,s2,0x30
 431:	0b3a0e03          	lb	t3,179(s4)
 435:	1927053b          	.insn	4, 0x1927053b
 439:	0000193f 02000528 	.insn	8, 0x020005280000193f
 441:	3a0e0317          	auipc	t1,0x3a0e0
 445:	49053b0b          	.insn	4, 0x49053b0b
 449:	29000013          	li	zero,656
 44d:	0034                	addi	a3,sp,8
 44f:	1702                	slli	a4,a4,0x20
 451:	0b3a0e03          	lb	t3,179(s4)
 455:	1349053b          	.insn	4, 0x1349053b
 459:	0000                	unimp
 45b:	1d2a                	slli	s10,s10,0x2a
 45d:	3101                	jal	5d <$d.10+0x9>
 45f:	58175513          	.insn	4, 0x58175513
 463:	5705590b          	.insn	4, 0x5705590b
 467:	2b00000b          	.insn	4, 0x2b00000b
 46b:	0034                	addi	a3,sp,8
 46d:	1802                	slli	a6,a6,0x20
 46f:	0b3a0e03          	lb	t3,179(s4)
 473:	1349053b          	.insn	4, 0x1349053b
 477:	0000                	unimp
 479:	1d2c                	addi	a1,sp,696
 47b:	3100                	.insn	2, 0x3100
 47d:	12011113          	.insn	4, 0x12011113
 481:	5806                	lw	a6,96(sp)
 483:	5705590b          	.insn	4, 0x5705590b
 487:	2d00000b          	.insn	4, 0x2d00000b
 48b:	012e                	slli	sp,sp,0xb
 48d:	0b3a0e03          	lb	t3,179(s4)
 491:	19270b3b          	.insn	4, 0x19270b3b
 495:	1349                	addi	t1,t1,-14 # 3a0e0433 <_stack_top+0x39fd4673>
 497:	0b20193f 342e0000 	.insn	8, 0x342e00000b20193f
 49f:	1c00                	addi	s0,sp,560
 4a1:	3a0e030f          	.insn	4, 0x3a0e030f
 4a5:	49053b0b          	.insn	4, 0x49053b0b
 4a9:	2f000013          	li	zero,752
 4ad:	0000000f          	fence	unknown,unknown
 4b1:	1630                	addi	a2,sp,808
 4b3:	4900                	lw	s0,16(a0)
 4b5:	000e0313          	mv	t1,t3
	...

000004bb <$d.3>:
 4bb:	1101                	addi	sp,sp,-32
 4bd:	2501                	jal	abd <$d.6+0x44a>
 4bf:	130e                	slli	t1,t1,0x23
 4c1:	0305                	addi	t1,t1,1
 4c3:	100e                	c.slli	zero,0x23
 4c5:	110e1b17          	auipc	s6,0x110e1
 4c9:	1201                	addi	tp,tp,-32 # ffffffe0 <_stack_top+0xffef4220>
 4cb:	0006                	c.slli	zero,0x1
 4cd:	0200                	addi	s0,sp,256
 4cf:	0034                	addi	a3,sp,8
 4d1:	1349                	addi	t1,t1,-14
 4d3:	0b3a                	slli	s6,s6,0xe
 4d5:	18020b3b          	.insn	4, 0x18020b3b
 4d9:	0000                	unimp
 4db:	49010103          	lb	sp,1168(sp)
 4df:	04000013          	li	zero,64
 4e3:	0021                	c.nop	8
 4e5:	1349                	addi	t1,t1,-14
 4e7:	00000b37          	lui	s6,0x0
 4eb:	2405                	jal	70b <$d.6+0x98>
 4ed:	0300                	addi	s0,sp,384
 4ef:	3e0e                	.insn	2, 0x3e0e
 4f1:	000b0b0b          	.insn	4, 0x000b0b0b
 4f5:	0600                	addi	s0,sp,768
 4f7:	0024                	addi	s1,sp,8
 4f9:	0b0b0e03          	lb	t3,176(s6) # b0 <$d.4+0xd>
 4fd:	0b3e                	slli	s6,s6,0xf
 4ff:	0000                	unimp
 501:	49000f07          	.insn	4, 0x49000f07
 505:	08000013          	li	zero,128
 509:	0035                	c.nop	13
 50b:	1349                	addi	t1,t1,-14
 50d:	0000                	unimp
 50f:	1609                	addi	a2,a2,-30 # 4900211b <_stack_top+0x48ef635b>
 511:	4900                	lw	s0,16(a0)
 513:	3a0e0313          	addi	t1,t3,928
 517:	000b3b0b          	.insn	4, 0x000b3b0b
 51b:	0a00                	addi	s0,sp,272
 51d:	012e                	slli	sp,sp,0xb
 51f:	0111                	addi	sp,sp,4
 521:	0612                	slli	a2,a2,0x4
 523:	1840                	addi	s0,sp,52
 525:	03194297          	auipc	t0,0x3194
 529:	3a0e                	.insn	2, 0x3a0e
 52b:	270b3b0b          	.insn	4, 0x270b3b0b
 52f:	4919                	li	s2,6
 531:	00193f13          	seqz	t5,s2
 535:	0b00                	addi	s0,sp,400
 537:	0005                	c.nop	1
 539:	1802                	slli	a6,a6,0x20
 53b:	0b3a0e03          	lb	t3,179(s4)
 53f:	13490b3b          	.insn	4, 0x13490b3b
 543:	0000                	unimp
 545:	890c                	.insn	2, 0x890c
 547:	0182                	c.slli64	gp
 549:	3100                	.insn	2, 0x3100
 54b:	19429513          	.insn	4, 0x19429513
 54f:	0111                	addi	sp,sp,4
 551:	0000                	unimp
 553:	2e0d                	jal	885 <$d.6+0x212>
 555:	1101                	addi	sp,sp,-32
 557:	1201                	addi	tp,tp,-32 # ffffffe0 <_stack_top+0xffef4220>
 559:	4006                	.insn	2, 0x4006
 55b:	9718                	.insn	2, 0x9718
 55d:	1942                	slli	s2,s2,0x30
 55f:	0b3a0e03          	lb	t3,179(s4)
 563:	19270b3b          	.insn	4, 0x19270b3b
 567:	1349                	addi	t1,t1,-14
 569:	0000                	unimp
 56b:	050e                	slli	a0,a0,0x3
 56d:	0200                	addi	s0,sp,256
 56f:	3a0e0317          	auipc	t1,0x3a0e0
 573:	490b3b0b          	.insn	4, 0x490b3b0b
 577:	0f000013          	li	zero,240
 57b:	0034                	addi	a3,sp,8
 57d:	1702                	slli	a4,a4,0x20
 57f:	0b3a0e03          	lb	t3,179(s4)
 583:	13490b3b          	.insn	4, 0x13490b3b
 587:	0000                	unimp
 589:	1d10                	addi	a2,sp,688
 58b:	3101                	jal	18b <$d.9+0x17>
 58d:	12011113          	.insn	4, 0x12011113
 591:	5806                	lw	a6,96(sp)
 593:	570b590b          	.insn	4, 0x570b590b
 597:	1100000b          	.insn	4, 0x1100000b
 59b:	0005                	c.nop	1
 59d:	1702                	slli	a4,a4,0x20
 59f:	1331                	addi	t1,t1,-20 # 3a0e055b <_stack_top+0x39fd479b>
 5a1:	0000                	unimp
 5a3:	0b12                	slli	s6,s6,0x4
 5a5:	1101                	addi	sp,sp,-32
 5a7:	1201                	addi	tp,tp,-32 # ffffffe0 <_stack_top+0xffef4220>
 5a9:	0006                	c.slli	zero,0x1
 5ab:	1300                	addi	s0,sp,416
 5ad:	0034                	addi	a3,sp,8
 5af:	1802                	slli	a6,a6,0x20
 5b1:	0b3a0e03          	lb	t3,179(s4)
 5b5:	13490b3b          	.insn	4, 0x13490b3b
 5b9:	0000                	unimp
 5bb:	2e14                	.insn	2, 0x2e14
 5bd:	0301                	addi	t1,t1,0
 5bf:	3a0e                	.insn	2, 0x3a0e
 5c1:	270b3b0b          	.insn	4, 0x270b3b0b
 5c5:	2019                	jal	5cb <$d.3+0x110>
 5c7:	1500000b          	.insn	4, 0x1500000b
 5cb:	0005                	c.nop	1
 5cd:	0b3a0e03          	lb	t3,179(s4)
 5d1:	13490b3b          	.insn	4, 0x13490b3b
 5d5:	0000                	unimp
 5d7:	2e16                	.insn	2, 0x2e16
 5d9:	0301                	addi	t1,t1,0
 5db:	3a0e                	.insn	2, 0x3a0e
 5dd:	270b3b0b          	.insn	4, 0x270b3b0b
 5e1:	4919                	li	s2,6
 5e3:	000b2013          	slti	zero,s6,0
 5e7:	1700                	addi	s0,sp,928
 5e9:	0034                	addi	a3,sp,8
 5eb:	0b3a0e03          	lb	t3,179(s4)
 5ef:	13490b3b          	.insn	4, 0x13490b3b
 5f3:	0000                	unimp
 5f5:	0b18                	addi	a4,sp,400
 5f7:	0001                	nop
 5f9:	1900                	addi	s0,sp,176
 5fb:	0026                	c.slli	zero,0x9
 5fd:	1349                	addi	t1,t1,-14
 5ff:	0000                	unimp
 601:	2e1a                	.insn	2, 0x2e1a
 603:	1101                	addi	sp,sp,-32
 605:	1201                	addi	tp,tp,-32 # ffffffe0 <_stack_top+0xffef4220>
 607:	4006                	.insn	2, 0x4006
 609:	9718                	.insn	2, 0x9718
 60b:	1942                	slli	s2,s2,0x30
 60d:	0b3a0e03          	lb	t3,179(s4)
 611:	19270b3b          	.insn	4, 0x19270b3b
 615:	0000193f 1c00341b 	.insn	8, 0x1c00341b0000193f
 61d:	030d                	addi	t1,t1,3
 61f:	3a0e                	.insn	2, 0x3a0e
 621:	490b3b0b          	.insn	4, 0x490b3b0b
 625:	1c000013          	li	zero,448
 629:	1755010b          	.insn	4, 0x1755010b
 62d:	0000                	unimp
 62f:	051d                	addi	a0,a0,7
 631:	0200                	addi	s0,sp,256
 633:	3118                	.insn	2, 0x3118
 635:	1e000013          	li	zero,480
 639:	0034                	addi	a3,sp,8
 63b:	1702                	slli	a4,a4,0x20
 63d:	1331                	addi	t1,t1,-20
 63f:	0000                	unimp
 641:	891f 0182 3100      	.insn	6, 0x31000182891f
 647:	00011113          	slli	sp,sp,0x0
 64b:	2000                	.insn	2, 0x2000
 64d:	012e                	slli	sp,sp,0xb
 64f:	0b3a0e03          	lb	t3,179(s4)
 653:	19270b3b          	.insn	4, 0x19270b3b
 657:	193c                	addi	a5,sp,184
 659:	0000193f 49000521 	.insn	8, 0x490005210000193f
 661:	22000013          	li	zero,544
 665:	0018                	.insn	2, 0x0018
 667:	0000                	unimp
 669:	49002123          	sw	a6,1154(zero) # 482 <$d.8+0xba>
 66d:	00053713          	sltiu	a4,a0,0
	...

00000673 <$d.6>:
 673:	1101                	addi	sp,sp,-32
 675:	2501                	jal	c75 <$d.6+0x602>
 677:	130e                	slli	t1,t1,0x23
 679:	0305                	addi	t1,t1,1
 67b:	100e                	c.slli	zero,0x23
 67d:	110e1b17          	auipc	s6,0x110e1
 681:	1201                	addi	tp,tp,-32 # ffffffe0 <_stack_top+0xffef4220>
 683:	0006                	c.slli	zero,0x1
 685:	0200                	addi	s0,sp,256
 687:	0034                	addi	a3,sp,8
 689:	1349                	addi	t1,t1,-14
 68b:	0b3a                	slli	s6,s6,0xe
 68d:	18020b3b          	.insn	4, 0x18020b3b
 691:	0000                	unimp
 693:	49010103          	lb	sp,1168(sp)
 697:	04000013          	li	zero,64
 69b:	0021                	c.nop	8
 69d:	1349                	addi	t1,t1,-14
 69f:	00000b37          	lui	s6,0x0
 6a3:	2405                	jal	8c3 <$d.6+0x250>
 6a5:	0300                	addi	s0,sp,384
 6a7:	3e0e                	.insn	2, 0x3e0e
 6a9:	000b0b0b          	.insn	4, 0x000b0b0b
 6ad:	0600                	addi	s0,sp,768
 6af:	0024                	addi	s1,sp,8
 6b1:	0b0b0e03          	lb	t3,176(s6) # b0 <$d.4+0xd>
 6b5:	0b3e                	slli	s6,s6,0xf
 6b7:	0000                	unimp
 6b9:	49003407          	.insn	4, 0x49003407
 6bd:	3b0b3a13          	sltiu	s4,s6,944
 6c1:	0205                	addi	tp,tp,1 # 1 <$d.4+0x1>
 6c3:	0018                	.insn	2, 0x0018
 6c5:	0800                	addi	s0,sp,16
 6c7:	0034                	addi	a3,sp,8
 6c9:	13490e03          	lb	t3,308(s2) # fffe7134 <_stack_top+0xffedb374>
 6cd:	0b3a                	slli	s6,s6,0xe
 6cf:	18020b3b          	.insn	4, 0x18020b3b
 6d3:	0000                	unimp
 6d5:	2109                	jal	ad7 <$d.6+0x464>
 6d7:	4900                	lw	s0,16(a0)
 6d9:	00053713          	sltiu	a4,a0,0
 6dd:	0a00                	addi	s0,sp,272
 6df:	0016                	c.slli	zero,0x5
 6e1:	1349                	addi	t1,t1,-14
 6e3:	0b3a0e03          	lb	t3,179(s4)
 6e7:	00000b3b          	.insn	4, 0x0b3b
 6eb:	49000f0b          	.insn	4, 0x49000f0b
 6ef:	0c000013          	li	zero,192
 6f3:	0115                	addi	sp,sp,5
 6f5:	1349                	addi	t1,t1,-14
 6f7:	00001927          	.insn	4, 0x1927
 6fb:	050d                	addi	a0,a0,3
 6fd:	4900                	lw	s0,16(a0)
 6ff:	0e000013          	li	zero,224
 703:	0016                	c.slli	zero,0x5
 705:	1349                	addi	t1,t1,-14
 707:	0b3a0e03          	lb	t3,179(s4)
 70b:	0000053b          	.insn	4, 0x053b
 70f:	4900350f          	.insn	4, 0x4900350f
 713:	10000013          	li	zero,256
 717:	012e                	slli	sp,sp,0xb
 719:	0111                	addi	sp,sp,4
 71b:	0612                	slli	a2,a2,0x4
 71d:	1840                	addi	s0,sp,52
 71f:	03194297          	auipc	t0,0x3194
 723:	3a0e                	.insn	2, 0x3a0e
 725:	270b3b0b          	.insn	4, 0x270b3b0b
 729:	4919                	li	s2,6
 72b:	00193f13          	seqz	t5,s2
 72f:	1100                	addi	s0,sp,160
 731:	0005                	c.nop	1
 733:	1702                	slli	a4,a4,0x20
 735:	0b3a0e03          	lb	t3,179(s4)
 739:	13490b3b          	.insn	4, 0x13490b3b
 73d:	0000                	unimp
 73f:	3412                	.insn	2, 0x3412
 741:	0200                	addi	s0,sp,256
 743:	3a0e0317          	auipc	t1,0x3a0e0
 747:	490b3b0b          	.insn	4, 0x490b3b0b
 74b:	13000013          	li	zero,304
 74f:	8289                	srli	a3,a3,0x2
 751:	0001                	nop
 753:	1331                	addi	t1,t1,-20 # 3a0e072f <_stack_top+0x39fd496f>
 755:	0111                	addi	sp,sp,4
 757:	0000                	unimp
 759:	2e14                	.insn	2, 0x2e14
 75b:	0301                	addi	t1,t1,0
 75d:	3a0e                	.insn	2, 0x3a0e
 75f:	270b3b0b          	.insn	4, 0x270b3b0b
 763:	3c19                	jal	179 <$d.9+0x5>
 765:	3f19                	jal	67b <$d.6+0x8>
 767:	0019                	c.nop	6
 769:	1500                	addi	s0,sp,672
 76b:	0018                	.insn	2, 0x0018
 76d:	0000                	unimp
 76f:	2616                	.insn	2, 0x2616
 771:	4900                	lw	s0,16(a0)
 773:	17000013          	li	zero,368
 777:	012e                	slli	sp,sp,0xb
 779:	0b3a0e03          	lb	t3,179(s4)
 77d:	19270b3b          	.insn	4, 0x19270b3b
 781:	0b36                	slli	s6,s6,0xd
 783:	1349                	addi	t1,t1,-14
 785:	0b20                	addi	s0,sp,408
 787:	0000                	unimp
 789:	0518                	addi	a4,sp,640
 78b:	0300                	addi	s0,sp,384
 78d:	3a0e                	.insn	2, 0x3a0e
 78f:	490b3b0b          	.insn	4, 0x490b3b0b
 793:	19000013          	li	zero,400
 797:	012e                	slli	sp,sp,0xb
 799:	0b3a0e03          	lb	t3,179(s4)
 79d:	19270b3b          	.insn	4, 0x19270b3b
 7a1:	1349                	addi	t1,t1,-14
 7a3:	0b20                	addi	s0,sp,408
 7a5:	0000                	unimp
 7a7:	341a                	.insn	2, 0x341a
 7a9:	0300                	addi	s0,sp,384
 7ab:	3a0e                	.insn	2, 0x3a0e
 7ad:	490b3b0b          	.insn	4, 0x490b3b0b
 7b1:	1b000013          	li	zero,432
 7b5:	011d                	addi	sp,sp,7
 7b7:	1331                	addi	t1,t1,-20
 7b9:	0111                	addi	sp,sp,4
 7bb:	0612                	slli	a2,a2,0x4
 7bd:	0b58                	addi	a4,sp,404
 7bf:	0b59                	addi	s6,s6,22
 7c1:	00000b57          	.insn	4, 0x0b57
 7c5:	051c                	addi	a5,sp,640
 7c7:	0200                	addi	s0,sp,256
 7c9:	3118                	.insn	2, 0x3118
 7cb:	1d000013          	li	zero,464
 7cf:	0005                	c.nop	1
 7d1:	1702                	slli	a4,a4,0x20
 7d3:	1331                	addi	t1,t1,-20
 7d5:	0000                	unimp
 7d7:	891e                	mv	s2,t2
 7d9:	0182                	c.slli64	gp
 7db:	9300                	.insn	2, 0x9300
 7dd:	1842                	slli	a6,a6,0x30
 7df:	0111                	addi	sp,sp,4
 7e1:	0000                	unimp
 7e3:	2e1f 1101 1201      	.insn	6, 0x120111012e1f
 7e9:	4006                	.insn	2, 0x4006
 7eb:	9718                	.insn	2, 0x9718
 7ed:	1942                	slli	s2,s2,0x30
 7ef:	1331                	addi	t1,t1,-20
 7f1:	0000                	unimp
 7f3:	3420                	.insn	2, 0x3420
 7f5:	0200                	addi	s0,sp,256
 7f7:	00133117          	auipc	sp,0x133
 7fb:	2100                	.insn	2, 0x2100
 7fd:	0034                	addi	a3,sp,8
 7ff:	1331                	addi	t1,t1,-20
 801:	0000                	unimp
 803:	1d22                	slli	s10,s10,0x28
 805:	3101                	jal	405 <$d.8+0x3d>
 807:	12011113          	.insn	4, 0x12011113
 80b:	5806                	lw	a6,96(sp)
 80d:	5705590b          	.insn	4, 0x5705590b
 811:	2300000b          	.insn	4, 0x2300000b
 815:	012e                	slli	sp,sp,0xb
 817:	0b3a0e03          	lb	t3,179(s4)
 81b:	19270b3b          	.insn	4, 0x19270b3b
 81f:	1349                	addi	t1,t1,-14
 821:	0b20193f 2e240000 	.insn	8, 0x2e2400000b20193f
 829:	1101                	addi	sp,sp,-32 # 1337d7 <_stack_top+0x27a17>
 82b:	1201                	addi	tp,tp,-32 # ffffffe0 <_stack_top+0xffef4220>
 82d:	4006                	.insn	2, 0x4006
 82f:	9718                	.insn	2, 0x9718
 831:	1942                	slli	s2,s2,0x30
 833:	0b3a0e03          	lb	t3,179(s4)
 837:	1927053b          	.insn	4, 0x1927053b
 83b:	1349                	addi	t1,t1,-14
 83d:	0000193f 02000525 	.insn	8, 0x020005250000193f
 845:	3a0e0317          	auipc	t1,0x3a0e0
 849:	49053b0b          	.insn	4, 0x49053b0b
 84d:	26000013          	li	zero,608
 851:	0034                	addi	a3,sp,8
 853:	1802                	slli	a6,a6,0x20
 855:	0b3a0e03          	lb	t3,179(s4)
 859:	1349053b          	.insn	4, 0x1349053b
 85d:	0000                	unimp
 85f:	02003427          	.insn	4, 0x02003427
 863:	3a0e0317          	auipc	t1,0x3a0e0
 867:	49053b0b          	.insn	4, 0x49053b0b
 86b:	28000013          	li	zero,640
 86f:	1755010b          	.insn	4, 0x1755010b
 873:	0000                	unimp
 875:	1d29                	addi	s10,s10,-22
 877:	3100                	.insn	2, 0x3100
 879:	12011113          	.insn	4, 0x12011113
 87d:	5806                	lw	a6,96(sp)
 87f:	5705590b          	.insn	4, 0x5705590b
 883:	2a00000b          	.insn	4, 0x2a00000b
 887:	0111010b          	.insn	4, 0x0111010b
 88b:	0612                	slli	a2,a2,0x4
 88d:	0000                	unimp
 88f:	0300342b          	.insn	4, 0x0300342b
 893:	3a0e                	.insn	2, 0x3a0e
 895:	49053b0b          	.insn	4, 0x49053b0b
 899:	2c000013          	li	zero,704
 89d:	011d                	addi	sp,sp,7
 89f:	1331                	addi	t1,t1,-20 # 3a0e084f <_stack_top+0x39fd4a8f>
 8a1:	1755                	addi	a4,a4,-11
 8a3:	0b58                	addi	a4,sp,404
 8a5:	0559                	addi	a0,a0,22
 8a7:	00000b57          	.insn	4, 0x0b57
 8ab:	2e2d                	jal	be5 <$d.6+0x572>
 8ad:	0300                	addi	s0,sp,384
 8af:	3a0e                	.insn	2, 0x3a0e
 8b1:	27053b0b          	.insn	4, 0x27053b0b
 8b5:	4919                	li	s2,6
 8b7:	000b2013          	slti	zero,s6,0
 8bb:	2e00                	.insn	2, 0x2e00
 8bd:	012e                	slli	sp,sp,0xb
 8bf:	0b3a0e03          	lb	t3,179(s4)
 8c3:	1927053b          	.insn	4, 0x1927053b
 8c7:	1349                	addi	t1,t1,-14
 8c9:	0b20                	addi	s0,sp,408
 8cb:	0000                	unimp
 8cd:	0300052f          	.insn	4, 0x0300052f
 8d1:	3a0e                	.insn	2, 0x3a0e
 8d3:	49053b0b          	.insn	4, 0x49053b0b
 8d7:	00000013          	nop
 8db:	1101                	addi	sp,sp,-32
 8dd:	1001                	c.nop	-32
 8df:	12011117          	auipc	sp,0x12011
 8e3:	1b0e030f          	.insn	4, 0x1b0e030f
 8e7:	250e                	.insn	2, 0x250e
 8e9:	130e                	slli	t1,t1,0x23
 8eb:	0005                	c.nop	1
 8ed:	0200                	addi	s0,sp,256
 8ef:	002e                	c.slli	zero,0xb
 8f1:	193f0e03          	lb	t3,403(t5)
 8f5:	1549                	addi	a0,a0,-14
 8f7:	0111                	addi	sp,sp,4 # 120118e3 <_stack_top+0x11f05b23>
 8f9:	0f12                	slli	t5,t5,0x4
 8fb:	0000                	unimp
 8fd:	00003b03          	.insn	4, 0x3b03
 901:	0000                	unimp
 903:	1101                	addi	sp,sp,-32
 905:	1001                	c.nop	-32
 907:	12011117          	auipc	sp,0x12011
 90b:	1b0e030f          	.insn	4, 0x1b0e030f
 90f:	250e                	.insn	2, 0x250e
 911:	130e                	slli	t1,t1,0x23
 913:	0005                	c.nop	1
 915:	0200                	addi	s0,sp,256
 917:	002e                	c.slli	zero,0xb
 919:	193f0e03          	lb	t3,403(t5)
 91d:	1549                	addi	a0,a0,-14
 91f:	0111                	addi	sp,sp,4 # 1201190b <_stack_top+0x11f05b4b>
 921:	0f12                	slli	t5,t5,0x4
 923:	0000                	unimp
 925:	00003b03          	.insn	4, 0x3b03
	...

セクション .debug_aranges の逆アセンブル:

00000000 <$d.3>:
   0:	001c                	.insn	2, 0x001c
   2:	0000                	unimp
   4:	0002                	c.slli64	zero
   6:	0000                	unimp
   8:	0000                	unimp
   a:	0004                	.insn	2, 0x0004
   c:	0000                	unimp
   e:	0000                	unimp
  10:	0000                	unimp
  12:	0010                	.insn	2, 0x0010
  14:	0014                	.insn	2, 0x0014
	...
  1e:	0000                	unimp
  20:	001c                	.insn	2, 0x001c
  22:	0000                	unimp
  24:	0002                	c.slli64	zero
  26:	2ffd                	jal	824 <$d.6+0x1b1>
  28:	0000                	unimp
  2a:	0004                	.insn	2, 0x0004
  2c:	0000                	unimp
  2e:	0000                	unimp
  30:	2f48                	.insn	2, 0x2f48
  32:	0010                	.insn	2, 0x0010
  34:	0014                	.insn	2, 0x0014
	...
  3e:	0000                	unimp
  40:	001c                	.insn	2, 0x001c
  42:	0000                	unimp
  44:	0002                	c.slli64	zero
  46:	302e                	.insn	2, 0x302e
  48:	0000                	unimp
  4a:	0004                	.insn	2, 0x0004
  4c:	0000                	unimp
  4e:	0000                	unimp
  50:	2f5c                	.insn	2, 0x2f5c
  52:	0010                	.insn	2, 0x0010
  54:	007c                	addi	a5,sp,12
	...

セクション .debug_line の逆アセンブル:

00000000 <$d.6>:
       0:	0050                	addi	a2,sp,4
       2:	0000                	unimp
       4:	0004                	.insn	2, 0x0004
       6:	0030                	addi	a2,sp,8
       8:	0000                	unimp
       a:	0101                	addi	sp,sp,0
       c:	fb01                	bnez	a4,ffffff1c <_stack_top+0xffef415c>
       e:	0d0e                	slli	s10,s10,0x3
      10:	0100                	addi	s0,sp,128
      12:	0101                	addi	sp,sp,0
      14:	0001                	nop
      16:	0000                	unimp
      18:	0001                	nop
      1a:	0100                	addi	s0,sp,128
      1c:	2f2e                	.insn	2, 0x2f2e
      1e:	00637273          	.insn	4, 0x00637273
      22:	6200                	.insn	2, 0x6200
      24:	6c746f6f          	jal	t5,46eea <$d.7+0x450a2>
      28:	6564616f          	jal	sp,4667e <$d.7+0x44836>
      2c:	5f72                	lw	t5,60(sp)
      2e:	6e65                	lui	t3,0x19
      30:	7274                	.insn	2, 0x7274
      32:	2e79                	jal	3d0 <$d.8+0x8>
      34:	00010053          	.insn	4, 0x00010053
      38:	0000                	unimp
      3a:	0500                	addi	s0,sp,640
      3c:	0002                	c.slli64	zero
      3e:	1000                	addi	s0,sp,32
      40:	1500                	addi	s0,sp,672
      42:	08090103          	lb	sp,128(s2)
      46:	0100                	addi	s0,sp,128
      48:	08090203          	lb	tp,128(s2)
      4c:	0100                	addi	s0,sp,128
      4e:	0409                	addi	s0,s0,2
      50:	0000                	unimp
      52:	0101                	addi	sp,sp,0

00000054 <$d.10>:
      54:	0f20                	addi	s0,sp,920
      56:	0000                	unimp
      58:	0004                	.insn	2, 0x0004
      5a:	007e                	c.slli	zero,0x1f
      5c:	0000                	unimp
      5e:	0101                	addi	sp,sp,0
      60:	fb01                	bnez	a4,ffffff70 <_stack_top+0xffef41b0>
      62:	0d0e                	slli	s10,s10,0x3
      64:	0100                	addi	s0,sp,128
      66:	0101                	addi	sp,sp,0
      68:	0001                	nop
      6a:	0000                	unimp
      6c:	0001                	nop
      6e:	0100                	addi	s0,sp,128
      70:	2f2e                	.insn	2, 0x2f2e
      72:	00637273          	.insn	4, 0x00637273
      76:	7273752f          	.insn	4, 0x7273752f
      7a:	62696c2f          	.insn	4, 0x62696c2f
      7e:	766c6c2f          	.insn	4, 0x766c6c2f
      82:	2d6d                	jal	73c <$d.6+0xc9>
      84:	3831                	jal	fffff8a0 <_stack_top+0xffef3ae0>
      86:	62696c2f          	.insn	4, 0x62696c2f
      8a:	616c632f          	.insn	4, 0x616c632f
      8e:	676e                	.insn	2, 0x676e
      90:	2f38312f          	.insn	4, 0x2f38312f
      94:	6e69                	lui	t3,0x1a
      96:	64756c63          	bltu	a0,t2,6ee <$d.6+0x7b>
      9a:	0065                	c.nop	25
      9c:	6200                	.insn	2, 0x6200
      9e:	6c746f6f          	jal	t5,46f64 <$d.7+0x4511c>
      a2:	6564616f          	jal	sp,466f8 <$d.7+0x448b0>
      a6:	5f72                	lw	t5,60(sp)
      a8:	6166                	.insn	2, 0x6166
      aa:	3374                	.insn	2, 0x3374
      ac:	2e32                	.insn	2, 0x2e32
      ae:	00010063          	beqz	sp,ae <$d.4+0xb>
      b2:	6300                	.insn	2, 0x6300
      b4:	6f6d6d6f          	jal	s10,d67aa <$d.7+0xd4962>
      b8:	2e6e                	.insn	2, 0x2e6e
      ba:	0068                	addi	a0,sp,12
      bc:	0001                	nop
      be:	6200                	.insn	2, 0x6200
      c0:	5f746f6f          	jal	t5,46eb6 <$d.7+0x4506e>
      c4:	6166                	.insn	2, 0x6166
      c6:	3374                	.insn	2, 0x3374
      c8:	2e32                	.insn	2, 0x2e32
      ca:	0068                	addi	a0,sp,12
      cc:	0001                	nop
      ce:	7300                	.insn	2, 0x7300
      d0:	6474                	.insn	2, 0x6474
      d2:	6e69                	lui	t3,0x1a
      d4:	2e74                	.insn	2, 0x2e74
      d6:	0068                	addi	a0,sp,12
      d8:	0002                	c.slli64	zero
      da:	0000                	unimp
      dc:	0500                	addi	s0,sp,640
      de:	1402                	slli	s0,s0,0x20
      e0:	1000                	addi	s0,sp,32
      e2:	0300                	addi	s0,sp,384
      e4:	0204012b          	.insn	4, 0x0204012b
      e8:	0c05                	addi	s8,s8,1
      ea:	030a                	slli	t1,t1,0x2
      ec:	0975                	addi	s2,s2,29
      ee:	0004                	.insn	2, 0x0004
      f0:	0401                	addi	s0,s0,0
      f2:	0501                	addi	a0,a0,0
      f4:	0300                	addi	s0,sp,384
      f6:	090c                	addi	a1,sp,144
      f8:	0004                	.insn	2, 0x0004
      fa:	0501                	addi	a0,a0,0
      fc:	0605                	addi	a2,a2,1
      fe:	04090003          	lb	zero,64(s2)
     102:	0100                	addi	s0,sp,128
     104:	0905                	addi	s2,s2,1
     106:	0306                	slli	t1,t1,0x1
     108:	0901                	addi	s2,s2,0
     10a:	0004                	.insn	2, 0x0004
     10c:	0401                	addi	s0,s0,0
     10e:	0502                	c.slli64	a0
     110:	031f 0970 0008      	.insn	6, 0x00080970031f
     116:	0401                	addi	s0,s0,0
     118:	0501                	addi	a0,a0,0
     11a:	0301                	addi	t1,t1,0
     11c:	0914                	addi	a3,sp,144
     11e:	0004                	.insn	2, 0x0004
     120:	0501                	addi	a0,a0,0
     122:	0300                	addi	s0,sp,384
     124:	00040903          	lb	s2,0(s0)
     128:	0401                	addi	s0,s0,0
     12a:	0502                	c.slli64	a0
     12c:	0a0c                	addi	a1,sp,272
     12e:	04096c03          	.insn	4, 0x04096c03
     132:	0100                	addi	s0,sp,128
     134:	0104                	addi	s1,sp,128
     136:	0005                	c.nop	1
     138:	04090c03          	lb	s8,64(s2)
     13c:	0100                	addi	s0,sp,128
     13e:	0505                	addi	a0,a0,1
     140:	0306                	slli	t1,t1,0x1
     142:	0900                	addi	s0,sp,144
     144:	0004                	.insn	2, 0x0004
     146:	0501                	addi	a0,a0,0
     148:	0609                	addi	a2,a2,2
     14a:	04090103          	lb	sp,64(s2)
     14e:	0100                	addi	s0,sp,128
     150:	0204                	addi	s1,sp,256
     152:	1f05                	addi	t5,t5,-31
     154:	08097003          	.insn	4, 0x08097003
     158:	0100                	addi	s0,sp,128
     15a:	0104                	addi	s1,sp,128
     15c:	0105                	addi	sp,sp,1
     15e:	04091903          	lh	s2,64(s2)
     162:	0100                	addi	s0,sp,128
     164:	0005                	c.nop	1
     166:	0901a203          	lw	tp,144(gp) # 5f20090 <_stack_top+0x5e142d0>
     16a:	0004                	.insn	2, 0x0004
     16c:	0501                	addi	a0,a0,0
     16e:	0a0e                	slli	s4,s4,0x3
     170:	18090103          	lb	sp,384(s2)
     174:	0100                	addi	s0,sp,128
     176:	04090103          	lb	sp,64(s2)
     17a:	0100                	addi	s0,sp,128
     17c:	0905                	addi	s2,s2,1
     17e:	097ed303          	lhu	t1,151(t4)
     182:	001c                	.insn	2, 0x001c
     184:	0401                	addi	s0,s0,0
     186:	0502                	c.slli64	a0
     188:	030c                	addi	a1,sp,384
     18a:	00040973          	.insn	4, 0x00040973
     18e:	0401                	addi	s0,s0,0
     190:	0501                	addi	a0,a0,0
     192:	0300                	addi	s0,sp,384
     194:	090c                	addi	a1,sp,144
     196:	0004                	.insn	2, 0x0004
     198:	0501                	addi	a0,a0,0
     19a:	0605                	addi	a2,a2,1
     19c:	04090003          	lb	zero,64(s2)
     1a0:	0100                	addi	s0,sp,128
     1a2:	0005                	c.nop	1
     1a4:	0306                	slli	t1,t1,0x1
     1a6:	0004090f          	.insn	4, 0x0004090f
     1aa:	0601                	addi	a2,a2,0
     1ac:	04094403          	lbu	s0,64(s2)
     1b0:	0100                	addi	s0,sp,128
     1b2:	2805                	jal	1e2 <$d.12+0x12>
     1b4:	0306                	slli	t1,t1,0x1
     1b6:	0931                	addi	s2,s2,12
     1b8:	0004                	.insn	2, 0x0004
     1ba:	0401                	addi	s0,s0,0
     1bc:	0502                	c.slli64	a0
     1be:	031f 096d 0004      	.insn	6, 0x0004096d031f
     1c4:	0401                	addi	s0,s0,0
     1c6:	0501                	addi	a0,a0,0
     1c8:	030c                	addi	a1,sp,384
     1ca:	091d                	addi	s2,s2,7
     1cc:	0004                	.insn	2, 0x0004
     1ce:	0501                	addi	a0,a0,0
     1d0:	0605                	addi	a2,a2,1
     1d2:	04090003          	lb	zero,64(s2)
     1d6:	0100                	addi	s0,sp,128
     1d8:	04094503          	lbu	a0,64(s2)
     1dc:	0100                	addi	s0,sp,128
     1de:	1405                	addi	s0,s0,-31
     1e0:	0306                	slli	t1,t1,0x1
     1e2:	00f4                	addi	a3,sp,76
     1e4:	0809                	addi	a6,a6,2
     1e6:	0100                	addi	s0,sp,128
     1e8:	0505                	addi	a0,a0,1
     1ea:	08095603          	lhu	a2,128(s2)
     1ee:	0100                	addi	s0,sp,128
     1f0:	0905                	addi	s2,s2,1
     1f2:	04090103          	lb	sp,64(s2)
     1f6:	0100                	addi	s0,sp,128
     1f8:	0505                	addi	a0,a0,1
     1fa:	04097f03          	.insn	4, 0x04097f03
     1fe:	0100                	addi	s0,sp,128
     200:	0306                	slli	t1,t1,0x1
     202:	7fb6                	.insn	2, 0x7fb6
     204:	0409                	addi	s0,s0,2
     206:	0100                	addi	s0,sp,128
     208:	0905                	addi	s2,s2,1
     20a:	0306                	slli	t1,t1,0x1
     20c:	092e                	slli	s2,s2,0xb
     20e:	0018                	.insn	2, 0x0018
     210:	0401                	addi	s0,s0,0
     212:	0502                	c.slli64	a0
     214:	030c                	addi	a1,sp,384
     216:	00040973          	.insn	4, 0x00040973
     21a:	0401                	addi	s0,s0,0
     21c:	0501                	addi	a0,a0,0
     21e:	0300                	addi	s0,sp,384
     220:	090c                	addi	a1,sp,144
     222:	0004                	.insn	2, 0x0004
     224:	0501                	addi	a0,a0,0
     226:	0605                	addi	a2,a2,1
     228:	04090003          	lb	zero,64(s2)
     22c:	0100                	addi	s0,sp,128
     22e:	0005                	c.nop	1
     230:	0306                	slli	t1,t1,0x1
     232:	0004090f          	.insn	4, 0x0004090f
     236:	0601                	addi	a2,a2,0
     238:	04094403          	lbu	s0,64(s2)
     23c:	0100                	addi	s0,sp,128
     23e:	2805                	jal	26e <$d.3+0x15>
     240:	0306                	slli	t1,t1,0x1
     242:	0931                	addi	s2,s2,12
     244:	0004                	.insn	2, 0x0004
     246:	0401                	addi	s0,s0,0
     248:	0502                	c.slli64	a0
     24a:	031f 096d 0004      	.insn	6, 0x0004096d031f
     250:	0401                	addi	s0,s0,0
     252:	0501                	addi	a0,a0,0
     254:	030c                	addi	a1,sp,384
     256:	091d                	addi	s2,s2,7
     258:	0004                	.insn	2, 0x0004
     25a:	0501                	addi	a0,a0,0
     25c:	0605                	addi	a2,a2,1
     25e:	04090003          	lb	zero,64(s2)
     262:	0100                	addi	s0,sp,128
     264:	04094503          	lbu	a0,64(s2)
     268:	0100                	addi	s0,sp,128
     26a:	1405                	addi	s0,s0,-31
     26c:	0306                	slli	t1,t1,0x1
     26e:	00f9                	addi	ra,ra,30
     270:	0809                	addi	a6,a6,2
     272:	0100                	addi	s0,sp,128
     274:	0505                	addi	a0,a0,1
     276:	08095103          	lhu	sp,128(s2)
     27a:	0100                	addi	s0,sp,128
     27c:	0905                	addi	s2,s2,1
     27e:	04090103          	lb	sp,64(s2)
     282:	0100                	addi	s0,sp,128
     284:	0505                	addi	a0,a0,1
     286:	04097f03          	.insn	4, 0x04097f03
     28a:	0100                	addi	s0,sp,128
     28c:	0306                	slli	t1,t1,0x1
     28e:	7fb6                	.insn	2, 0x7fb6
     290:	0409                	addi	s0,s0,2
     292:	0100                	addi	s0,sp,128
     294:	0c05                	addi	s8,s8,1
     296:	0306                	slli	t1,t1,0x1
     298:	00fe                	slli	ra,ra,0x1f
     29a:	0409                	addi	s0,s0,2
     29c:	0100                	addi	s0,sp,128
     29e:	1b05                	addi	s6,s6,-31
     2a0:	0306                	slli	t1,t1,0x1
     2a2:	0900                	addi	s0,sp,144
     2a4:	0004                	.insn	2, 0x0004
     2a6:	0501                	addi	a0,a0,0
     2a8:	0305                	addi	t1,t1,1
     2aa:	0900                	addi	s0,sp,144
     2ac:	0004                	.insn	2, 0x0004
     2ae:	0301                	addi	t1,t1,0
     2b0:	7f82                	.insn	2, 0x7f82
     2b2:	0409                	addi	s0,s0,2
     2b4:	0100                	addi	s0,sp,128
     2b6:	1705                	addi	a4,a4,-31
     2b8:	0306                	slli	t1,t1,0x1
     2ba:	00ff 0809 0100 0d05 	.insn	10, 0x03060d050100080900ff
     2c2:	0306 
     2c4:	0900                	addi	s0,sp,144
     2c6:	0004                	.insn	2, 0x0004
     2c8:	0501                	addi	a0,a0,0
     2ca:	0605                	addi	a2,a2,1
     2cc:	04095203          	lhu	tp,64(s2)
     2d0:	0100                	addi	s0,sp,128
     2d2:	0c05                	addi	s8,s8,1
     2d4:	04092d03          	lw	s10,64(s2)
     2d8:	0100                	addi	s0,sp,128
     2da:	1b05                	addi	s6,s6,-31
     2dc:	0306                	slli	t1,t1,0x1
     2de:	0900                	addi	s0,sp,144
     2e0:	0004                	.insn	2, 0x0004
     2e2:	0501                	addi	a0,a0,0
     2e4:	0305                	addi	t1,t1,1
     2e6:	0900                	addi	s0,sp,144
     2e8:	0004                	.insn	2, 0x0004
     2ea:	0301                	addi	t1,t1,0
     2ec:	7f82                	.insn	2, 0x7f82
     2ee:	0409                	addi	s0,s0,2
     2f0:	0100                	addi	s0,sp,128
     2f2:	0306                	slli	t1,t1,0x1
     2f4:	00ca                	slli	ra,ra,0x12
     2f6:	0409                	addi	s0,s0,2
     2f8:	0100                	addi	s0,sp,128
     2fa:	0905                	addi	s2,s2,1
     2fc:	04090103          	lb	sp,64(s2)
     300:	0100                	addi	s0,sp,128
     302:	0505                	addi	a0,a0,1
     304:	04097f03          	.insn	4, 0x04097f03
     308:	0100                	addi	s0,sp,128
     30a:	0905                	addi	s2,s2,1
     30c:	09019a03          	lh	s4,144(gp)
     310:	0004                	.insn	2, 0x0004
     312:	0601                	addi	a2,a2,0
     314:	10090003          	lb	zero,256(s2)
     318:	0100                	addi	s0,sp,128
     31a:	097e9c03          	lh	s8,151(t4)
     31e:	0004                	.insn	2, 0x0004
     320:	0601                	addi	a2,a2,0
     322:	1c092e03          	lw	t3,448(s2)
     326:	0100                	addi	s0,sp,128
     328:	0204                	addi	s1,sp,256
     32a:	0c05                	addi	s8,s8,1
     32c:	04097303          	.insn	4, 0x04097303
     330:	0100                	addi	s0,sp,128
     332:	0104                	addi	s1,sp,128
     334:	0005                	c.nop	1
     336:	04090c03          	lb	s8,64(s2)
     33a:	0100                	addi	s0,sp,128
     33c:	0505                	addi	a0,a0,1
     33e:	0306                	slli	t1,t1,0x1
     340:	0900                	addi	s0,sp,144
     342:	0004                	.insn	2, 0x0004
     344:	0501                	addi	a0,a0,0
     346:	0600                	addi	s0,sp,768
     348:	04090f03          	lb	t5,64(s2)
     34c:	0100                	addi	s0,sp,128
     34e:	0306                	slli	t1,t1,0x1
     350:	0944                	addi	s1,sp,148
     352:	0004                	.insn	2, 0x0004
     354:	0501                	addi	a0,a0,0
     356:	0628                	addi	a0,sp,776
     358:	04093103          	.insn	4, 0x04093103
     35c:	0100                	addi	s0,sp,128
     35e:	0204                	addi	s1,sp,256
     360:	1f05                	addi	t5,t5,-31
     362:	04096d03          	.insn	4, 0x04096d03
     366:	0100                	addi	s0,sp,128
     368:	0104                	addi	s1,sp,128
     36a:	0c05                	addi	s8,s8,1
     36c:	04091d03          	lh	s10,64(s2)
     370:	0100                	addi	s0,sp,128
     372:	0505                	addi	a0,a0,1
     374:	0306                	slli	t1,t1,0x1
     376:	0900                	addi	s0,sp,144
     378:	0004                	.insn	2, 0x0004
     37a:	0501                	addi	a0,a0,0
     37c:	0609                	addi	a2,a2,2
     37e:	0901ab03          	lw	s6,144(gp)
     382:	0004                	.insn	2, 0x0004
     384:	0301                	addi	t1,t1,0
     386:	00040903          	lb	s2,0(s0)
     38a:	0601                	addi	a2,a2,0
     38c:	18090003          	lb	zero,384(s2)
     390:	0100                	addi	s0,sp,128
     392:	097e9703          	lh	a4,151(t4)
     396:	0004                	.insn	2, 0x0004
     398:	0601                	addi	a2,a2,0
     39a:	1c092e03          	lw	t3,448(s2)
     39e:	0100                	addi	s0,sp,128
     3a0:	0204                	addi	s1,sp,256
     3a2:	0c05                	addi	s8,s8,1
     3a4:	04097303          	.insn	4, 0x04097303
     3a8:	0100                	addi	s0,sp,128
     3aa:	0104                	addi	s1,sp,128
     3ac:	0005                	c.nop	1
     3ae:	04090c03          	lb	s8,64(s2)
     3b2:	0100                	addi	s0,sp,128
     3b4:	0505                	addi	a0,a0,1
     3b6:	0306                	slli	t1,t1,0x1
     3b8:	0900                	addi	s0,sp,144
     3ba:	0004                	.insn	2, 0x0004
     3bc:	0501                	addi	a0,a0,0
     3be:	0600                	addi	s0,sp,768
     3c0:	04090f03          	lb	t5,64(s2)
     3c4:	0100                	addi	s0,sp,128
     3c6:	0306                	slli	t1,t1,0x1
     3c8:	0944                	addi	s1,sp,148
     3ca:	0004                	.insn	2, 0x0004
     3cc:	0501                	addi	a0,a0,0
     3ce:	0628                	addi	a0,sp,776
     3d0:	04093103          	.insn	4, 0x04093103
     3d4:	0100                	addi	s0,sp,128
     3d6:	0204                	addi	s1,sp,256
     3d8:	1f05                	addi	t5,t5,-31
     3da:	04096d03          	.insn	4, 0x04096d03
     3de:	0100                	addi	s0,sp,128
     3e0:	0104                	addi	s1,sp,128
     3e2:	0c05                	addi	s8,s8,1
     3e4:	04091d03          	lh	s10,64(s2)
     3e8:	0100                	addi	s0,sp,128
     3ea:	0505                	addi	a0,a0,1
     3ec:	0306                	slli	t1,t1,0x1
     3ee:	0900                	addi	s0,sp,144
     3f0:	0004                	.insn	2, 0x0004
     3f2:	0501                	addi	a0,a0,0
     3f4:	0609                	addi	a2,a2,2
     3f6:	0901b003          	.insn	4, 0x0901b003
     3fa:	0004                	.insn	2, 0x0004
     3fc:	0601                	addi	a2,a2,0
     3fe:	097e9503          	lh	a0,151(t4)
     402:	0004                	.insn	2, 0x0004
     404:	0601                	addi	a2,a2,0
     406:	1c092e03          	lw	t3,448(s2)
     40a:	0100                	addi	s0,sp,128
     40c:	0204                	addi	s1,sp,256
     40e:	0c05                	addi	s8,s8,1
     410:	04097303          	.insn	4, 0x04097303
     414:	0100                	addi	s0,sp,128
     416:	0104                	addi	s1,sp,128
     418:	0005                	c.nop	1
     41a:	04090c03          	lb	s8,64(s2)
     41e:	0100                	addi	s0,sp,128
     420:	0505                	addi	a0,a0,1
     422:	0306                	slli	t1,t1,0x1
     424:	0900                	addi	s0,sp,144
     426:	0004                	.insn	2, 0x0004
     428:	0501                	addi	a0,a0,0
     42a:	0600                	addi	s0,sp,768
     42c:	04090f03          	lb	t5,64(s2)
     430:	0100                	addi	s0,sp,128
     432:	0306                	slli	t1,t1,0x1
     434:	0944                	addi	s1,sp,148
     436:	0004                	.insn	2, 0x0004
     438:	0501                	addi	a0,a0,0
     43a:	0628                	addi	a0,sp,776
     43c:	04093103          	.insn	4, 0x04093103
     440:	0100                	addi	s0,sp,128
     442:	0204                	addi	s1,sp,256
     444:	1f05                	addi	t5,t5,-31
     446:	04096d03          	.insn	4, 0x04096d03
     44a:	0100                	addi	s0,sp,128
     44c:	0104                	addi	s1,sp,128
     44e:	0c05                	addi	s8,s8,1
     450:	04091d03          	lh	s10,64(s2)
     454:	0100                	addi	s0,sp,128
     456:	0505                	addi	a0,a0,1
     458:	0306                	slli	t1,t1,0x1
     45a:	0900                	addi	s0,sp,144
     45c:	0004                	.insn	2, 0x0004
     45e:	0301                	addi	t1,t1,0
     460:	0945                	addi	s2,s2,17
     462:	0004                	.insn	2, 0x0004
     464:	0501                	addi	a0,a0,0
     466:	0609                	addi	a2,a2,2
     468:	1c092e03          	lw	t3,448(s2)
     46c:	0100                	addi	s0,sp,128
     46e:	0204                	addi	s1,sp,256
     470:	0c05                	addi	s8,s8,1
     472:	04097303          	.insn	4, 0x04097303
     476:	0100                	addi	s0,sp,128
     478:	0104                	addi	s1,sp,128
     47a:	0005                	c.nop	1
     47c:	04090c03          	lb	s8,64(s2)
     480:	0100                	addi	s0,sp,128
     482:	08090f03          	lb	t5,128(s2)
     486:	0100                	addi	s0,sp,128
     488:	0306                	slli	t1,t1,0x1
     48a:	0944                	addi	s1,sp,148
     48c:	0004                	.insn	2, 0x0004
     48e:	0501                	addi	a0,a0,0
     490:	0628                	addi	a0,sp,776
     492:	04093103          	.insn	4, 0x04093103
     496:	0100                	addi	s0,sp,128
     498:	0204                	addi	s1,sp,256
     49a:	1f05                	addi	t5,t5,-31
     49c:	04096d03          	.insn	4, 0x04096d03
     4a0:	0100                	addi	s0,sp,128
     4a2:	0104                	addi	s1,sp,128
     4a4:	0c05                	addi	s8,s8,1
     4a6:	04091d03          	lh	s10,64(s2)
     4aa:	0100                	addi	s0,sp,128
     4ac:	0306                	slli	t1,t1,0x1
     4ae:	0945                	addi	s2,s2,17
     4b0:	0004                	.insn	2, 0x0004
     4b2:	0501                	addi	a0,a0,0
     4b4:	0609                	addi	a2,a2,2
     4b6:	0901e103          	.insn	4, 0x0901e103
     4ba:	0004                	.insn	2, 0x0004
     4bc:	0301                	addi	t1,t1,0
     4be:	090d                	addi	s2,s2,3
     4c0:	0004                	.insn	2, 0x0004
     4c2:	0601                	addi	a2,a2,0
     4c4:	1c090003          	lb	zero,448(s2)
     4c8:	0100                	addi	s0,sp,128
     4ca:	097e9203          	lh	tp,151(t4)
     4ce:	0004                	.insn	2, 0x0004
     4d0:	0601                	addi	a2,a2,0
     4d2:	1c092e03          	lw	t3,448(s2)
     4d6:	0100                	addi	s0,sp,128
     4d8:	0204                	addi	s1,sp,256
     4da:	0c05                	addi	s8,s8,1
     4dc:	04097303          	.insn	4, 0x04097303
     4e0:	0100                	addi	s0,sp,128
     4e2:	0104                	addi	s1,sp,128
     4e4:	0005                	c.nop	1
     4e6:	04090c03          	lb	s8,64(s2)
     4ea:	0100                	addi	s0,sp,128
     4ec:	0505                	addi	a0,a0,1
     4ee:	0306                	slli	t1,t1,0x1
     4f0:	0900                	addi	s0,sp,144
     4f2:	0004                	.insn	2, 0x0004
     4f4:	0501                	addi	a0,a0,0
     4f6:	0600                	addi	s0,sp,768
     4f8:	04090f03          	lb	t5,64(s2)
     4fc:	0100                	addi	s0,sp,128
     4fe:	0306                	slli	t1,t1,0x1
     500:	0944                	addi	s1,sp,148
     502:	0004                	.insn	2, 0x0004
     504:	0501                	addi	a0,a0,0
     506:	0628                	addi	a0,sp,776
     508:	04093103          	.insn	4, 0x04093103
     50c:	0100                	addi	s0,sp,128
     50e:	0204                	addi	s1,sp,256
     510:	1f05                	addi	t5,t5,-31
     512:	04096d03          	.insn	4, 0x04096d03
     516:	0100                	addi	s0,sp,128
     518:	0104                	addi	s1,sp,128
     51a:	0c05                	addi	s8,s8,1
     51c:	04091d03          	lh	s10,64(s2)
     520:	0100                	addi	s0,sp,128
     522:	0505                	addi	a0,a0,1
     524:	0306                	slli	t1,t1,0x1
     526:	0900                	addi	s0,sp,144
     528:	0004                	.insn	2, 0x0004
     52a:	0501                	addi	a0,a0,0
     52c:	0609                	addi	a2,a2,2
     52e:	0901b503          	.insn	4, 0x0901b503
     532:	0004                	.insn	2, 0x0004
     534:	0501                	addi	a0,a0,0
     536:	0305                	addi	t1,t1,1
     538:	00040903          	lb	s2,0(s0)
     53c:	0501                	addi	a0,a0,0
     53e:	0312                	slli	t1,t1,0x4
     540:	0901                	addi	s2,s2,0
     542:	0010                	.insn	2, 0x0010
     544:	0501                	addi	a0,a0,0
     546:	0605                	addi	a2,a2,1
     548:	04090003          	lb	zero,64(s2)
     54c:	0100                	addi	s0,sp,128
     54e:	0306                	slli	t1,t1,0x1
     550:	0901                	addi	s2,s2,0
     552:	0008                	.insn	2, 0x0008
     554:	0301                	addi	t1,t1,0
     556:	0902                	c.slli64	s2
     558:	0014                	.insn	2, 0x0014
     55a:	0501                	addi	a0,a0,0
     55c:	0312                	slli	t1,t1,0x4
     55e:	0901                	addi	s2,s2,0
     560:	0010                	.insn	2, 0x0010
     562:	0501                	addi	a0,a0,0
     564:	0605                	addi	a2,a2,1
     566:	04090003          	lb	zero,64(s2)
     56a:	0100                	addi	s0,sp,128
     56c:	0306                	slli	t1,t1,0x1
     56e:	0901                	addi	s2,s2,0
     570:	0008                	.insn	2, 0x0008
     572:	0301                	addi	t1,t1,0
     574:	0902                	c.slli64	s2
     576:	000c                	.insn	2, 0x000c
     578:	0301                	addi	t1,t1,0
     57a:	0901                	addi	s2,s2,0
     57c:	0010                	.insn	2, 0x0010
     57e:	0301                	addi	t1,t1,0
     580:	0901                	addi	s2,s2,0
     582:	0010                	.insn	2, 0x0010
     584:	0301                	addi	t1,t1,0
     586:	0902                	c.slli64	s2
     588:	000c                	.insn	2, 0x000c
     58a:	0501                	addi	a0,a0,0
     58c:	0312                	slli	t1,t1,0x4
     58e:	0901                	addi	s2,s2,0
     590:	0010                	.insn	2, 0x0010
     592:	0501                	addi	a0,a0,0
     594:	0605                	addi	a2,a2,1
     596:	04090003          	lb	zero,64(s2)
     59a:	0100                	addi	s0,sp,128
     59c:	0306                	slli	t1,t1,0x1
     59e:	0901                	addi	s2,s2,0
     5a0:	0008                	.insn	2, 0x0008
     5a2:	0301                	addi	t1,t1,0
     5a4:	0902                	c.slli64	s2
     5a6:	000c                	.insn	2, 0x000c
     5a8:	0501                	addi	a0,a0,0
     5aa:	0312                	slli	t1,t1,0x4
     5ac:	0901                	addi	s2,s2,0
     5ae:	0010                	.insn	2, 0x0010
     5b0:	0501                	addi	a0,a0,0
     5b2:	0605                	addi	a2,a2,1
     5b4:	04090003          	lb	zero,64(s2)
     5b8:	0100                	addi	s0,sp,128
     5ba:	0306                	slli	t1,t1,0x1
     5bc:	0901                	addi	s2,s2,0
     5be:	0008                	.insn	2, 0x0008
     5c0:	0301                	addi	t1,t1,0
     5c2:	0902                	c.slli64	s2
     5c4:	000c                	.insn	2, 0x000c
     5c6:	0501                	addi	a0,a0,0
     5c8:	0312                	slli	t1,t1,0x4
     5ca:	0901                	addi	s2,s2,0
     5cc:	0010                	.insn	2, 0x0010
     5ce:	0501                	addi	a0,a0,0
     5d0:	0605                	addi	a2,a2,1
     5d2:	04090003          	lb	zero,64(s2)
     5d6:	0100                	addi	s0,sp,128
     5d8:	0306                	slli	t1,t1,0x1
     5da:	0901                	addi	s2,s2,0
     5dc:	0008                	.insn	2, 0x0008
     5de:	0301                	addi	t1,t1,0
     5e0:	0902                	c.slli64	s2
     5e2:	000c                	.insn	2, 0x000c
     5e4:	0501                	addi	a0,a0,0
     5e6:	0312                	slli	t1,t1,0x4
     5e8:	0901                	addi	s2,s2,0
     5ea:	0010                	.insn	2, 0x0010
     5ec:	0501                	addi	a0,a0,0
     5ee:	0605                	addi	a2,a2,1
     5f0:	04090003          	lb	zero,64(s2)
     5f4:	0100                	addi	s0,sp,128
     5f6:	0306                	slli	t1,t1,0x1
     5f8:	0901                	addi	s2,s2,0
     5fa:	0008                	.insn	2, 0x0008
     5fc:	0301                	addi	t1,t1,0
     5fe:	0948                	addi	a0,sp,148
     600:	000c                	.insn	2, 0x000c
     602:	0301                	addi	t1,t1,0
     604:	093c                	addi	a5,sp,152
     606:	0004                	.insn	2, 0x0004
     608:	0501                	addi	a0,a0,0
     60a:	0a0c                	addi	a1,sp,272
     60c:	097eaa03          	lw	s4,151(t4)
     610:	0004                	.insn	2, 0x0004
     612:	0501                	addi	a0,a0,0
     614:	0605                	addi	a2,a2,1
     616:	04090003          	lb	zero,64(s2)
     61a:	0100                	addi	s0,sp,128
     61c:	04094503          	lbu	a0,64(s2)
     620:	0100                	addi	s0,sp,128
     622:	0905                	addi	s2,s2,1
     624:	0306                	slli	t1,t1,0x1
     626:	092e                	slli	s2,s2,0xb
     628:	0008                	.insn	2, 0x0008
     62a:	0401                	addi	s0,s0,0
     62c:	0502                	c.slli64	a0
     62e:	030c                	addi	a1,sp,384
     630:	00040973          	.insn	4, 0x00040973
     634:	0401                	addi	s0,s0,0
     636:	0501                	addi	a0,a0,0
     638:	0300                	addi	s0,sp,384
     63a:	090c                	addi	a1,sp,144
     63c:	0004                	.insn	2, 0x0004
     63e:	0501                	addi	a0,a0,0
     640:	0605                	addi	a2,a2,1
     642:	04090003          	lb	zero,64(s2)
     646:	0100                	addi	s0,sp,128
     648:	0005                	c.nop	1
     64a:	0306                	slli	t1,t1,0x1
     64c:	0004090f          	.insn	4, 0x0004090f
     650:	0501                	addi	a0,a0,0
     652:	0328                	addi	a0,sp,392
     654:	0975                	addi	s2,s2,29
     656:	0004                	.insn	2, 0x0004
     658:	0401                	addi	s0,s0,0
     65a:	0502                	c.slli64	a0
     65c:	031f 096d 0004      	.insn	6, 0x0004096d031f
     662:	0401                	addi	s0,s0,0
     664:	0501                	addi	a0,a0,0
     666:	030c                	addi	a1,sp,384
     668:	091d                	addi	s2,s2,7
     66a:	0004                	.insn	2, 0x0004
     66c:	0501                	addi	a0,a0,0
     66e:	0605                	addi	a2,a2,1
     670:	04090003          	lb	zero,64(s2)
     674:	0100                	addi	s0,sp,128
     676:	0105                	addi	sp,sp,1
     678:	0306                	slli	t1,t1,0x1
     67a:	00040903          	lb	s2,0(s0)
     67e:	0501                	addi	a0,a0,0
     680:	0300                	addi	s0,sp,384
     682:	00ce                	slli	ra,ra,0x13
     684:	0409                	addi	s0,s0,2
     686:	0100                	addi	s0,sp,128
     688:	0505                	addi	a0,a0,1
     68a:	030a                	slli	t1,t1,0x2
     68c:	00380903          	lb	s2,3(a6)
     690:	0501                	addi	a0,a0,0
     692:	0318                	addi	a4,sp,384
     694:	0901                	addi	s2,s2,0
     696:	0050                	addi	a2,sp,4
     698:	0501                	addi	a0,a0,0
     69a:	0309                	addi	t1,t1,2
     69c:	04097fbb          	.insn	4, 0x04097fbb
     6a0:	0100                	addi	s0,sp,128
     6a2:	1705                	addi	a4,a4,-31
     6a4:	0900c803          	lbu	a6,144(ra)
     6a8:	00c8                	addi	a0,sp,68
     6aa:	0501                	addi	a0,a0,0
     6ac:	0318                	addi	a4,sp,384
     6ae:	0902                	c.slli64	s2
     6b0:	0004                	.insn	2, 0x0004
     6b2:	0501                	addi	a0,a0,0
     6b4:	0309                	addi	t1,t1,2
     6b6:	7fb6                	.insn	2, 0x7fb6
     6b8:	0409                	addi	s0,s0,2
     6ba:	0100                	addi	s0,sp,128
     6bc:	1105                	addi	sp,sp,-31
     6be:	0900cf03          	lbu	t5,144(ra)
     6c2:	00c8                	addi	a0,sp,68
     6c4:	0501                	addi	a0,a0,0
     6c6:	0620                	addi	s0,sp,776
     6c8:	04090003          	lb	zero,64(s2)
     6cc:	0100                	addi	s0,sp,128
     6ce:	0905                	addi	s2,s2,1
     6d0:	04090003          	lb	zero,64(s2)
     6d4:	0100                	addi	s0,sp,128
     6d6:	097ee603          	.insn	4, 0x097ee603
     6da:	0004                	.insn	2, 0x0004
     6dc:	0501                	addi	a0,a0,0
     6de:	9b03061b          	.insn	4, 0x9b03061b
     6e2:	0901                	addi	s2,s2,0
     6e4:	0004                	.insn	2, 0x0004
     6e6:	0501                	addi	a0,a0,0
     6e8:	0611                	addi	a2,a2,4
     6ea:	04090003          	lb	zero,64(s2)
     6ee:	0100                	addi	s0,sp,128
     6f0:	0505                	addi	a0,a0,1
     6f2:	0306                	slli	t1,t1,0x1
     6f4:	7fb6                	.insn	2, 0x7fb6
     6f6:	0409                	addi	s0,s0,2
     6f8:	0100                	addi	s0,sp,128
     6fa:	1105                	addi	sp,sp,-31
     6fc:	0900c903          	lbu	s2,144(ra)
     700:	0004                	.insn	2, 0x0004
     702:	0501                	addi	a0,a0,0
     704:	0620                	addi	s0,sp,776
     706:	04090003          	lb	zero,64(s2)
     70a:	0100                	addi	s0,sp,128
     70c:	0905                	addi	s2,s2,1
     70e:	04090003          	lb	zero,64(s2)
     712:	0100                	addi	s0,sp,128
     714:	097ee603          	.insn	4, 0x097ee603
     718:	0004                	.insn	2, 0x0004
     71a:	0601                	addi	a2,a2,0
     71c:	0900cb03          	lbu	s6,144(ra)
     720:	0004                	.insn	2, 0x0004
     722:	0601                	addi	a2,a2,0
     724:	097fb503          	.insn	4, 0x097fb503
     728:	0050                	addi	a2,sp,4
     72a:	0501                	addi	a0,a0,0
     72c:	0620                	addi	s0,sp,776
     72e:	0901b503          	.insn	4, 0x0901b503
     732:	0004                	.insn	2, 0x0004
     734:	0501                	addi	a0,a0,0
     736:	060d                	addi	a2,a2,3
     738:	04090003          	lb	zero,64(s2)
     73c:	0100                	addi	s0,sp,128
     73e:	2305                	jal	c5e <$d.6+0x5eb>
     740:	0306                	slli	t1,t1,0x1
     742:	0972                	slli	s2,s2,0x1c
     744:	0004                	.insn	2, 0x0004
     746:	0501                	addi	a0,a0,0
     748:	0314                	addi	a3,sp,384
     74a:	090e                	slli	s2,s2,0x3
     74c:	0004                	.insn	2, 0x0004
     74e:	0501                	addi	a0,a0,0
     750:	0309                	addi	t1,t1,2
     752:	0972                	slli	s2,s2,0x1c
     754:	0004                	.insn	2, 0x0004
     756:	0501                	addi	a0,a0,0
     758:	0314                	addi	a3,sp,384
     75a:	00040903          	lb	s2,0(s0)
     75e:	0501                	addi	a0,a0,0
     760:	00030623          	sb	zero,12(t1)
     764:	0409                	addi	s0,s0,2
     766:	0100                	addi	s0,sp,128
     768:	0d05                	addi	s10,s10,1
     76a:	04090003          	lb	zero,64(s2)
     76e:	0100                	addi	s0,sp,128
     770:	097ed603          	lhu	a2,151(t4)
     774:	0004                	.insn	2, 0x0004
     776:	0501                	addi	a0,a0,0
     778:	061f ab03 0901      	.insn	6, 0x0901ab03061f
     77e:	0004                	.insn	2, 0x0004
     780:	0501                	addi	a0,a0,0
     782:	0615                	addi	a2,a2,5
     784:	04090003          	lb	zero,64(s2)
     788:	0100                	addi	s0,sp,128
     78a:	0505                	addi	a0,a0,1
     78c:	0306                	slli	t1,t1,0x1
     78e:	7fa6                	.insn	2, 0x7fa6
     790:	0409                	addi	s0,s0,2
     792:	0100                	addi	s0,sp,128
     794:	1405                	addi	s0,s0,-31
     796:	0900d903          	lhu	s2,144(ra)
     79a:	0004                	.insn	2, 0x0004
     79c:	0501                	addi	a0,a0,0
     79e:	00030623          	sb	zero,12(t1)
     7a2:	0409                	addi	s0,s0,2
     7a4:	0100                	addi	s0,sp,128
     7a6:	0d05                	addi	s10,s10,1
     7a8:	04090003          	lb	zero,64(s2)
     7ac:	0100                	addi	s0,sp,128
     7ae:	097ed603          	lhu	a2,151(t4)
     7b2:	0008                	.insn	2, 0x0008
     7b4:	0501                	addi	a0,a0,0
     7b6:	d903061b          	.insn	4, 0xd903061b
     7ba:	0900                	addi	s0,sp,144
     7bc:	0008                	.insn	2, 0x0008
     7be:	0501                	addi	a0,a0,0
     7c0:	062c                	addi	a1,sp,776
     7c2:	04090003          	lb	zero,64(s2)
     7c6:	0100                	addi	s0,sp,128
     7c8:	0d05                	addi	s10,s10,1
     7ca:	04090003          	lb	zero,64(s2)
     7ce:	0100                	addi	s0,sp,128
     7d0:	1105                	addi	sp,sp,-31
     7d2:	0306                	slli	t1,t1,0x1
     7d4:	000c0903          	lb	s2,0(s8)
     7d8:	0501                	addi	a0,a0,0
     7da:	097c0317          	auipc	t1,0x97c0
     7de:	00b4                	addi	a3,sp,72
     7e0:	0501                	addi	a0,a0,0
     7e2:	0311                	addi	t1,t1,4 # 97c07de <_stack_top+0x96b4a1e>
     7e4:	0904                	addi	s1,sp,144
     7e6:	0004                	.insn	2, 0x0004
     7e8:	0501                	addi	a0,a0,0
     7ea:	0305                	addi	t1,t1,1
     7ec:	097c                	addi	a5,sp,156
     7ee:	0004                	.insn	2, 0x0004
     7f0:	0501                	addi	a0,a0,0
     7f2:	0315                	addi	t1,t1,5
     7f4:	0910                	addi	a2,sp,144
     7f6:	0004                	.insn	2, 0x0004
     7f8:	0501                	addi	a0,a0,0
     7fa:	09030327          	.insn	4, 0x09030327
     7fe:	0004                	.insn	2, 0x0004
     800:	0501                	addi	a0,a0,0
     802:	0318                	addi	a4,sp,384
     804:	00d1                	addi	ra,ra,20
     806:	0409                	addi	s0,s0,2
     808:	0100                	addi	s0,sp,128
     80a:	1105                	addi	sp,sp,-31
     80c:	0306                	slli	t1,t1,0x1
     80e:	0900                	addi	s0,sp,144
     810:	0008                	.insn	2, 0x0008
     812:	0301                	addi	t1,t1,0
     814:	7ec4                	.insn	2, 0x7ec4
     816:	0409                	addi	s0,s0,2
     818:	0100                	addi	s0,sp,128
     81a:	0905                	addi	s2,s2,1
     81c:	0306                	slli	t1,t1,0x1
     81e:	092e                	slli	s2,s2,0xb
     820:	000c                	.insn	2, 0x000c
     822:	0401                	addi	s0,s0,0
     824:	0502                	c.slli64	a0
     826:	030c                	addi	a1,sp,384
     828:	00040973          	.insn	4, 0x00040973
     82c:	0401                	addi	s0,s0,0
     82e:	0501                	addi	a0,a0,0
     830:	0300                	addi	s0,sp,384
     832:	090c                	addi	a1,sp,144
     834:	0004                	.insn	2, 0x0004
     836:	0501                	addi	a0,a0,0
     838:	0605                	addi	a2,a2,1
     83a:	04090003          	lb	zero,64(s2)
     83e:	0100                	addi	s0,sp,128
     840:	0005                	c.nop	1
     842:	0306                	slli	t1,t1,0x1
     844:	0004090f          	.insn	4, 0x0004090f
     848:	0601                	addi	a2,a2,0
     84a:	04094403          	lbu	s0,64(s2)
     84e:	0100                	addi	s0,sp,128
     850:	2805                	jal	880 <$d.6+0x20d>
     852:	0306                	slli	t1,t1,0x1
     854:	0931                	addi	s2,s2,12
     856:	0004                	.insn	2, 0x0004
     858:	0401                	addi	s0,s0,0
     85a:	0502                	c.slli64	a0
     85c:	031f 096d 0004      	.insn	6, 0x0004096d031f
     862:	0401                	addi	s0,s0,0
     864:	0501                	addi	a0,a0,0
     866:	030c                	addi	a1,sp,384
     868:	091d                	addi	s2,s2,7
     86a:	0004                	.insn	2, 0x0004
     86c:	0501                	addi	a0,a0,0
     86e:	0605                	addi	a2,a2,1
     870:	04090003          	lb	zero,64(s2)
     874:	0100                	addi	s0,sp,128
     876:	04094503          	lbu	a0,64(s2)
     87a:	0100                	addi	s0,sp,128
     87c:	2805                	jal	8ac <$d.6+0x239>
     87e:	0306                	slli	t1,t1,0x1
     880:	080900c3          	.insn	4, 0x080900c3
     884:	0100                	addi	s0,sp,128
     886:	2205                	jal	9a6 <$d.6+0x333>
     888:	0306                	slli	t1,t1,0x1
     88a:	0900                	addi	s0,sp,144
     88c:	0004                	.insn	2, 0x0004
     88e:	0501                	addi	a0,a0,0
     890:	0315                	addi	t1,t1,5
     892:	0900                	addi	s0,sp,144
     894:	0004                	.insn	2, 0x0004
     896:	0501                	addi	a0,a0,0
     898:	0611                	addi	a2,a2,4
     89a:	04090103          	lb	sp,64(s2)
     89e:	0100                	addi	s0,sp,128
     8a0:	0306                	slli	t1,t1,0x1
     8a2:	7fbc                	.insn	2, 0x7fbc
     8a4:	0409                	addi	s0,s0,2
     8a6:	0100                	addi	s0,sp,128
     8a8:	0905                	addi	s2,s2,1
     8aa:	0306                	slli	t1,t1,0x1
     8ac:	092e                	slli	s2,s2,0xb
     8ae:	0010                	.insn	2, 0x0010
     8b0:	0401                	addi	s0,s0,0
     8b2:	0502                	c.slli64	a0
     8b4:	030c                	addi	a1,sp,384
     8b6:	00040973          	.insn	4, 0x00040973
     8ba:	0401                	addi	s0,s0,0
     8bc:	0501                	addi	a0,a0,0
     8be:	0300                	addi	s0,sp,384
     8c0:	090c                	addi	a1,sp,144
     8c2:	0004                	.insn	2, 0x0004
     8c4:	0501                	addi	a0,a0,0
     8c6:	0605                	addi	a2,a2,1
     8c8:	04090003          	lb	zero,64(s2)
     8cc:	0100                	addi	s0,sp,128
     8ce:	0204                	addi	s1,sp,256
     8d0:	1f05                	addi	t5,t5,-31
     8d2:	0306                	slli	t1,t1,0x1
     8d4:	0971                	addi	s2,s2,28
     8d6:	0004                	.insn	2, 0x0004
     8d8:	0401                	addi	s0,s0,0
     8da:	0501                	addi	a0,a0,0
     8dc:	031e                	slli	t1,t1,0x7
     8de:	0924                	addi	s1,sp,152
     8e0:	0004                	.insn	2, 0x0004
     8e2:	0501                	addi	a0,a0,0
     8e4:	0605                	addi	a2,a2,1
     8e6:	04090003          	lb	zero,64(s2)
     8ea:	0100                	addi	s0,sp,128
     8ec:	0905                	addi	s2,s2,1
     8ee:	0306                	slli	t1,t1,0x1
     8f0:	096c                	addi	a1,sp,156
     8f2:	0008                	.insn	2, 0x0008
     8f4:	0401                	addi	s0,s0,0
     8f6:	0502                	c.slli64	a0
     8f8:	030c                	addi	a1,sp,384
     8fa:	00040973          	.insn	4, 0x00040973
     8fe:	0401                	addi	s0,s0,0
     900:	0501                	addi	a0,a0,0
     902:	0300                	addi	s0,sp,384
     904:	090c                	addi	a1,sp,144
     906:	0004                	.insn	2, 0x0004
     908:	0501                	addi	a0,a0,0
     90a:	0605                	addi	a2,a2,1
     90c:	04090003          	lb	zero,64(s2)
     910:	0100                	addi	s0,sp,128
     912:	0204                	addi	s1,sp,256
     914:	1f05                	addi	t5,t5,-31
     916:	0306                	slli	t1,t1,0x1
     918:	0971                	addi	s2,s2,28
     91a:	0004                	.insn	2, 0x0004
     91c:	0501                	addi	a0,a0,0
     91e:	030c                	addi	a1,sp,384
     920:	00040903          	lb	s2,0(s0)
     924:	0401                	addi	s0,s0,0
     926:	0501                	addi	a0,a0,0
     928:	0300                	addi	s0,sp,384
     92a:	090c                	addi	a1,sp,144
     92c:	0004                	.insn	2, 0x0004
     92e:	0501                	addi	a0,a0,0
     930:	0605                	addi	a2,a2,1
     932:	04090003          	lb	zero,64(s2)
     936:	0100                	addi	s0,sp,128
     938:	0905                	addi	s2,s2,1
     93a:	0306                	slli	t1,t1,0x1
     93c:	0901                	addi	s2,s2,0
     93e:	0004                	.insn	2, 0x0004
     940:	0401                	addi	s0,s0,0
     942:	0502                	c.slli64	a0
     944:	031f 0970 0008      	.insn	6, 0x00080970031f
     94a:	0501                	addi	a0,a0,0
     94c:	030c                	addi	a1,sp,384
     94e:	00040903          	lb	s2,0(s0)
     952:	0401                	addi	s0,s0,0
     954:	0501                	addi	a0,a0,0
     956:	0300                	addi	s0,sp,384
     958:	090c                	addi	a1,sp,144
     95a:	0004                	.insn	2, 0x0004
     95c:	0501                	addi	a0,a0,0
     95e:	0605                	addi	a2,a2,1
     960:	04090003          	lb	zero,64(s2)
     964:	0100                	addi	s0,sp,128
     966:	0905                	addi	s2,s2,1
     968:	0306                	slli	t1,t1,0x1
     96a:	0901                	addi	s2,s2,0
     96c:	0004                	.insn	2, 0x0004
     96e:	0401                	addi	s0,s0,0
     970:	0502                	c.slli64	a0
     972:	031f 0970 0008      	.insn	6, 0x00080970031f
     978:	0501                	addi	a0,a0,0
     97a:	030c                	addi	a1,sp,384
     97c:	00040903          	lb	s2,0(s0)
     980:	0401                	addi	s0,s0,0
     982:	0501                	addi	a0,a0,0
     984:	0300                	addi	s0,sp,384
     986:	090c                	addi	a1,sp,144
     988:	0004                	.insn	2, 0x0004
     98a:	0501                	addi	a0,a0,0
     98c:	0605                	addi	a2,a2,1
     98e:	04090003          	lb	zero,64(s2)
     992:	0100                	addi	s0,sp,128
     994:	0905                	addi	s2,s2,1
     996:	0306                	slli	t1,t1,0x1
     998:	0901                	addi	s2,s2,0
     99a:	0004                	.insn	2, 0x0004
     99c:	0401                	addi	s0,s0,0
     99e:	0502                	c.slli64	a0
     9a0:	031f 0970 0008      	.insn	6, 0x00080970031f
     9a6:	0601                	addi	a2,a2,0
     9a8:	04096203          	.insn	4, 0x04096203
     9ac:	0100                	addi	s0,sp,128
     9ae:	0104                	addi	s1,sp,128
     9b0:	2805                	jal	9e0 <$d.6+0x36d>
     9b2:	0306                	slli	t1,t1,0x1
     9b4:	080900c3          	.insn	4, 0x080900c3
     9b8:	0100                	addi	s0,sp,128
     9ba:	2205                	jal	ada <$d.6+0x467>
     9bc:	0306                	slli	t1,t1,0x1
     9be:	0900                	addi	s0,sp,144
     9c0:	0004                	.insn	2, 0x0004
     9c2:	0501                	addi	a0,a0,0
     9c4:	0315                	addi	t1,t1,5
     9c6:	0900                	addi	s0,sp,144
     9c8:	0004                	.insn	2, 0x0004
     9ca:	0501                	addi	a0,a0,0
     9cc:	0611                	addi	a2,a2,4
     9ce:	04090103          	lb	sp,64(s2)
     9d2:	0100                	addi	s0,sp,128
     9d4:	0306                	slli	t1,t1,0x1
     9d6:	7fbc                	.insn	2, 0x7fbc
     9d8:	0409                	addi	s0,s0,2
     9da:	0100                	addi	s0,sp,128
     9dc:	0905                	addi	s2,s2,1
     9de:	0306                	slli	t1,t1,0x1
     9e0:	092e                	slli	s2,s2,0xb
     9e2:	0010                	.insn	2, 0x0010
     9e4:	0401                	addi	s0,s0,0
     9e6:	0502                	c.slli64	a0
     9e8:	030c                	addi	a1,sp,384
     9ea:	00040973          	.insn	4, 0x00040973
     9ee:	0401                	addi	s0,s0,0
     9f0:	0501                	addi	a0,a0,0
     9f2:	0300                	addi	s0,sp,384
     9f4:	090c                	addi	a1,sp,144
     9f6:	0004                	.insn	2, 0x0004
     9f8:	0501                	addi	a0,a0,0
     9fa:	0605                	addi	a2,a2,1
     9fc:	04090003          	lb	zero,64(s2)
     a00:	0100                	addi	s0,sp,128
     a02:	0204                	addi	s1,sp,256
     a04:	1f05                	addi	t5,t5,-31
     a06:	0306                	slli	t1,t1,0x1
     a08:	0971                	addi	s2,s2,28
     a0a:	0004                	.insn	2, 0x0004
     a0c:	0401                	addi	s0,s0,0
     a0e:	0501                	addi	a0,a0,0
     a10:	031e                	slli	t1,t1,0x7
     a12:	0924                	addi	s1,sp,152
     a14:	0004                	.insn	2, 0x0004
     a16:	0501                	addi	a0,a0,0
     a18:	0605                	addi	a2,a2,1
     a1a:	04090003          	lb	zero,64(s2)
     a1e:	0100                	addi	s0,sp,128
     a20:	0905                	addi	s2,s2,1
     a22:	0306                	slli	t1,t1,0x1
     a24:	096c                	addi	a1,sp,156
     a26:	0008                	.insn	2, 0x0008
     a28:	0401                	addi	s0,s0,0
     a2a:	0502                	c.slli64	a0
     a2c:	030c                	addi	a1,sp,384
     a2e:	00040973          	.insn	4, 0x00040973
     a32:	0401                	addi	s0,s0,0
     a34:	0501                	addi	a0,a0,0
     a36:	0300                	addi	s0,sp,384
     a38:	090c                	addi	a1,sp,144
     a3a:	0004                	.insn	2, 0x0004
     a3c:	0501                	addi	a0,a0,0
     a3e:	0605                	addi	a2,a2,1
     a40:	04090003          	lb	zero,64(s2)
     a44:	0100                	addi	s0,sp,128
     a46:	0204                	addi	s1,sp,256
     a48:	1f05                	addi	t5,t5,-31
     a4a:	0306                	slli	t1,t1,0x1
     a4c:	0971                	addi	s2,s2,28
     a4e:	0004                	.insn	2, 0x0004
     a50:	0501                	addi	a0,a0,0
     a52:	030c                	addi	a1,sp,384
     a54:	00040903          	lb	s2,0(s0)
     a58:	0401                	addi	s0,s0,0
     a5a:	0501                	addi	a0,a0,0
     a5c:	0300                	addi	s0,sp,384
     a5e:	090c                	addi	a1,sp,144
     a60:	0004                	.insn	2, 0x0004
     a62:	0501                	addi	a0,a0,0
     a64:	0605                	addi	a2,a2,1
     a66:	04090003          	lb	zero,64(s2)
     a6a:	0100                	addi	s0,sp,128
     a6c:	0905                	addi	s2,s2,1
     a6e:	0306                	slli	t1,t1,0x1
     a70:	0901                	addi	s2,s2,0
     a72:	0004                	.insn	2, 0x0004
     a74:	0401                	addi	s0,s0,0
     a76:	0502                	c.slli64	a0
     a78:	031f 0970 0008      	.insn	6, 0x00080970031f
     a7e:	0501                	addi	a0,a0,0
     a80:	030c                	addi	a1,sp,384
     a82:	00040903          	lb	s2,0(s0)
     a86:	0401                	addi	s0,s0,0
     a88:	0501                	addi	a0,a0,0
     a8a:	0300                	addi	s0,sp,384
     a8c:	090c                	addi	a1,sp,144
     a8e:	0004                	.insn	2, 0x0004
     a90:	0501                	addi	a0,a0,0
     a92:	0605                	addi	a2,a2,1
     a94:	04090003          	lb	zero,64(s2)
     a98:	0100                	addi	s0,sp,128
     a9a:	0905                	addi	s2,s2,1
     a9c:	0306                	slli	t1,t1,0x1
     a9e:	0901                	addi	s2,s2,0
     aa0:	0004                	.insn	2, 0x0004
     aa2:	0401                	addi	s0,s0,0
     aa4:	0502                	c.slli64	a0
     aa6:	031f 0970 0008      	.insn	6, 0x00080970031f
     aac:	0501                	addi	a0,a0,0
     aae:	030c                	addi	a1,sp,384
     ab0:	00040903          	lb	s2,0(s0)
     ab4:	0401                	addi	s0,s0,0
     ab6:	0501                	addi	a0,a0,0
     ab8:	0300                	addi	s0,sp,384
     aba:	090c                	addi	a1,sp,144
     abc:	0004                	.insn	2, 0x0004
     abe:	0501                	addi	a0,a0,0
     ac0:	0605                	addi	a2,a2,1
     ac2:	04090003          	lb	zero,64(s2)
     ac6:	0100                	addi	s0,sp,128
     ac8:	0905                	addi	s2,s2,1
     aca:	0306                	slli	t1,t1,0x1
     acc:	0901                	addi	s2,s2,0
     ace:	0004                	.insn	2, 0x0004
     ad0:	0401                	addi	s0,s0,0
     ad2:	0502                	c.slli64	a0
     ad4:	031f 0970 0008      	.insn	6, 0x00080970031f
     ada:	0601                	addi	a2,a2,0
     adc:	08096203          	.insn	4, 0x08096203
     ae0:	0100                	addi	s0,sp,128
     ae2:	0104                	addi	s1,sp,128
     ae4:	2805                	jal	b14 <$d.6+0x4a1>
     ae6:	0306                	slli	t1,t1,0x1
     ae8:	040900c3          	.insn	4, 0x040900c3
     aec:	0100                	addi	s0,sp,128
     aee:	2205                	jal	c0e <$d.6+0x59b>
     af0:	0306                	slli	t1,t1,0x1
     af2:	0900                	addi	s0,sp,144
     af4:	0004                	.insn	2, 0x0004
     af6:	0501                	addi	a0,a0,0
     af8:	0315                	addi	t1,t1,5
     afa:	0900                	addi	s0,sp,144
     afc:	0004                	.insn	2, 0x0004
     afe:	0501                	addi	a0,a0,0
     b00:	0611                	addi	a2,a2,4
     b02:	04090103          	lb	sp,64(s2)
     b06:	0100                	addi	s0,sp,128
     b08:	0306                	slli	t1,t1,0x1
     b0a:	7fbc                	.insn	2, 0x7fbc
     b0c:	0409                	addi	s0,s0,2
     b0e:	0100                	addi	s0,sp,128
     b10:	0905                	addi	s2,s2,1
     b12:	0306                	slli	t1,t1,0x1
     b14:	092e                	slli	s2,s2,0xb
     b16:	0010                	.insn	2, 0x0010
     b18:	0401                	addi	s0,s0,0
     b1a:	0502                	c.slli64	a0
     b1c:	030c                	addi	a1,sp,384
     b1e:	00040973          	.insn	4, 0x00040973
     b22:	0401                	addi	s0,s0,0
     b24:	0501                	addi	a0,a0,0
     b26:	0300                	addi	s0,sp,384
     b28:	090c                	addi	a1,sp,144
     b2a:	0004                	.insn	2, 0x0004
     b2c:	0501                	addi	a0,a0,0
     b2e:	0605                	addi	a2,a2,1
     b30:	04090003          	lb	zero,64(s2)
     b34:	0100                	addi	s0,sp,128
     b36:	0204                	addi	s1,sp,256
     b38:	1f05                	addi	t5,t5,-31
     b3a:	0306                	slli	t1,t1,0x1
     b3c:	0971                	addi	s2,s2,28
     b3e:	0004                	.insn	2, 0x0004
     b40:	0401                	addi	s0,s0,0
     b42:	0501                	addi	a0,a0,0
     b44:	031e                	slli	t1,t1,0x7
     b46:	0924                	addi	s1,sp,152
     b48:	0004                	.insn	2, 0x0004
     b4a:	0501                	addi	a0,a0,0
     b4c:	0605                	addi	a2,a2,1
     b4e:	04090003          	lb	zero,64(s2)
     b52:	0100                	addi	s0,sp,128
     b54:	0905                	addi	s2,s2,1
     b56:	0306                	slli	t1,t1,0x1
     b58:	096c                	addi	a1,sp,156
     b5a:	0008                	.insn	2, 0x0008
     b5c:	0401                	addi	s0,s0,0
     b5e:	0502                	c.slli64	a0
     b60:	030c                	addi	a1,sp,384
     b62:	00040973          	.insn	4, 0x00040973
     b66:	0401                	addi	s0,s0,0
     b68:	0501                	addi	a0,a0,0
     b6a:	0300                	addi	s0,sp,384
     b6c:	090c                	addi	a1,sp,144
     b6e:	0004                	.insn	2, 0x0004
     b70:	0501                	addi	a0,a0,0
     b72:	0605                	addi	a2,a2,1
     b74:	04090003          	lb	zero,64(s2)
     b78:	0100                	addi	s0,sp,128
     b7a:	0204                	addi	s1,sp,256
     b7c:	1f05                	addi	t5,t5,-31
     b7e:	0306                	slli	t1,t1,0x1
     b80:	0971                	addi	s2,s2,28
     b82:	0004                	.insn	2, 0x0004
     b84:	0401                	addi	s0,s0,0
     b86:	0501                	addi	a0,a0,0
     b88:	0305                	addi	t1,t1,1
     b8a:	092c                	addi	a1,sp,152
     b8c:	0008                	.insn	2, 0x0008
     b8e:	0501                	addi	a0,a0,0
     b90:	0309                	addi	t1,t1,2
     b92:	0901                	addi	s2,s2,0
     b94:	0004                	.insn	2, 0x0004
     b96:	0501                	addi	a0,a0,0
     b98:	0305                	addi	t1,t1,1
     b9a:	097f 0004 0501 033e 	.insn	10, 0x00c5033e05010004097f
     ba2:	00c5 
     ba4:	0409                	addi	s0,s0,2
     ba6:	0100                	addi	s0,sp,128
     ba8:	0505                	addi	a0,a0,1
     baa:	0306                	slli	t1,t1,0x1
     bac:	0900                	addi	s0,sp,144
     bae:	0004                	.insn	2, 0x0004
     bb0:	0301                	addi	t1,t1,0
     bb2:	7ef1                	lui	t4,0xffffc
     bb4:	0409                	addi	s0,s0,2
     bb6:	0100                	addi	s0,sp,128
     bb8:	0905                	addi	s2,s2,1
     bba:	0306                	slli	t1,t1,0x1
     bbc:	092e                	slli	s2,s2,0xb
     bbe:	001c                	.insn	2, 0x001c
     bc0:	0401                	addi	s0,s0,0
     bc2:	0502                	c.slli64	a0
     bc4:	030c                	addi	a1,sp,384
     bc6:	00040973          	.insn	4, 0x00040973
     bca:	0401                	addi	s0,s0,0
     bcc:	0501                	addi	a0,a0,0
     bce:	0300                	addi	s0,sp,384
     bd0:	090c                	addi	a1,sp,144
     bd2:	0004                	.insn	2, 0x0004
     bd4:	0501                	addi	a0,a0,0
     bd6:	0605                	addi	a2,a2,1
     bd8:	04090003          	lb	zero,64(s2)
     bdc:	0100                	addi	s0,sp,128
     bde:	0005                	c.nop	1
     be0:	0306                	slli	t1,t1,0x1
     be2:	0004090f          	.insn	4, 0x0004090f
     be6:	0601                	addi	a2,a2,0
     be8:	04094403          	lbu	s0,64(s2)
     bec:	0100                	addi	s0,sp,128
     bee:	2805                	jal	c1e <$d.6+0x5ab>
     bf0:	0306                	slli	t1,t1,0x1
     bf2:	0931                	addi	s2,s2,12
     bf4:	0004                	.insn	2, 0x0004
     bf6:	0401                	addi	s0,s0,0
     bf8:	0502                	c.slli64	a0
     bfa:	031f 096d 0004      	.insn	6, 0x0004096d031f
     c00:	0401                	addi	s0,s0,0
     c02:	0501                	addi	a0,a0,0
     c04:	030c                	addi	a1,sp,384
     c06:	091d                	addi	s2,s2,7
     c08:	0004                	.insn	2, 0x0004
     c0a:	0501                	addi	a0,a0,0
     c0c:	0605                	addi	a2,a2,1
     c0e:	04090003          	lb	zero,64(s2)
     c12:	0100                	addi	s0,sp,128
     c14:	04094503          	lbu	a0,64(s2)
     c18:	0100                	addi	s0,sp,128
     c1a:	2805                	jal	c4a <$d.6+0x5d7>
     c1c:	0306                	slli	t1,t1,0x1
     c1e:	100900c3          	.insn	4, 0x100900c3
     c22:	0100                	addi	s0,sp,128
     c24:	2205                	jal	d44 <$d.6+0x6d1>
     c26:	0306                	slli	t1,t1,0x1
     c28:	0900                	addi	s0,sp,144
     c2a:	0004                	.insn	2, 0x0004
     c2c:	0501                	addi	a0,a0,0
     c2e:	0315                	addi	t1,t1,5
     c30:	0900                	addi	s0,sp,144
     c32:	0004                	.insn	2, 0x0004
     c34:	0501                	addi	a0,a0,0
     c36:	0611                	addi	a2,a2,4
     c38:	04090103          	lb	sp,64(s2)
     c3c:	0100                	addi	s0,sp,128
     c3e:	0306                	slli	t1,t1,0x1
     c40:	7fbc                	.insn	2, 0x7fbc
     c42:	0409                	addi	s0,s0,2
     c44:	0100                	addi	s0,sp,128
     c46:	0905                	addi	s2,s2,1
     c48:	0306                	slli	t1,t1,0x1
     c4a:	092e                	slli	s2,s2,0xb
     c4c:	0010                	.insn	2, 0x0010
     c4e:	0401                	addi	s0,s0,0
     c50:	0502                	c.slli64	a0
     c52:	030c                	addi	a1,sp,384
     c54:	00040973          	.insn	4, 0x00040973
     c58:	0401                	addi	s0,s0,0
     c5a:	0501                	addi	a0,a0,0
     c5c:	0300                	addi	s0,sp,384
     c5e:	090c                	addi	a1,sp,144
     c60:	0004                	.insn	2, 0x0004
     c62:	0501                	addi	a0,a0,0
     c64:	0605                	addi	a2,a2,1
     c66:	04090003          	lb	zero,64(s2)
     c6a:	0100                	addi	s0,sp,128
     c6c:	0204                	addi	s1,sp,256
     c6e:	1f05                	addi	t5,t5,-31
     c70:	0306                	slli	t1,t1,0x1
     c72:	0971                	addi	s2,s2,28
     c74:	0004                	.insn	2, 0x0004
     c76:	0401                	addi	s0,s0,0
     c78:	0501                	addi	a0,a0,0
     c7a:	031e                	slli	t1,t1,0x7
     c7c:	0924                	addi	s1,sp,152
     c7e:	0004                	.insn	2, 0x0004
     c80:	0501                	addi	a0,a0,0
     c82:	0605                	addi	a2,a2,1
     c84:	04090003          	lb	zero,64(s2)
     c88:	0100                	addi	s0,sp,128
     c8a:	097fbe03          	.insn	4, 0x097fbe03
     c8e:	0004                	.insn	2, 0x0004
     c90:	0401                	addi	s0,s0,0
     c92:	0502                	c.slli64	a0
     c94:	060c                	addi	a1,sp,768
     c96:	04092103          	lw	sp,64(s2)
     c9a:	0100                	addi	s0,sp,128
     c9c:	0104                	addi	s1,sp,128
     c9e:	0005                	c.nop	1
     ca0:	04090c03          	lb	s8,64(s2)
     ca4:	0100                	addi	s0,sp,128
     ca6:	0505                	addi	a0,a0,1
     ca8:	0306                	slli	t1,t1,0x1
     caa:	0900                	addi	s0,sp,144
     cac:	0004                	.insn	2, 0x0004
     cae:	0501                	addi	a0,a0,0
     cb0:	0609                	addi	a2,a2,2
     cb2:	04090103          	lb	sp,64(s2)
     cb6:	0100                	addi	s0,sp,128
     cb8:	0306                	slli	t1,t1,0x1
     cba:	0952                	slli	s2,s2,0x14
     cbc:	0008                	.insn	2, 0x0008
     cbe:	0301                	addi	t1,t1,0
     cc0:	092e                	slli	s2,s2,0xb
     cc2:	001c                	.insn	2, 0x001c
     cc4:	0401                	addi	s0,s0,0
     cc6:	0502                	c.slli64	a0
     cc8:	060c                	addi	a1,sp,768
     cca:	04097303          	.insn	4, 0x04097303
     cce:	0100                	addi	s0,sp,128
     cd0:	0104                	addi	s1,sp,128
     cd2:	0005                	c.nop	1
     cd4:	04090c03          	lb	s8,64(s2)
     cd8:	0100                	addi	s0,sp,128
     cda:	0505                	addi	a0,a0,1
     cdc:	0306                	slli	t1,t1,0x1
     cde:	0900                	addi	s0,sp,144
     ce0:	0004                	.insn	2, 0x0004
     ce2:	0501                	addi	a0,a0,0
     ce4:	0600                	addi	s0,sp,768
     ce6:	04090f03          	lb	t5,64(s2)
     cea:	0100                	addi	s0,sp,128
     cec:	0306                	slli	t1,t1,0x1
     cee:	0944                	addi	s1,sp,148
     cf0:	0004                	.insn	2, 0x0004
     cf2:	0501                	addi	a0,a0,0
     cf4:	0628                	addi	a0,sp,776
     cf6:	04093103          	.insn	4, 0x04093103
     cfa:	0100                	addi	s0,sp,128
     cfc:	0204                	addi	s1,sp,256
     cfe:	1f05                	addi	t5,t5,-31
     d00:	04096d03          	.insn	4, 0x04096d03
     d04:	0100                	addi	s0,sp,128
     d06:	0104                	addi	s1,sp,128
     d08:	0c05                	addi	s8,s8,1
     d0a:	04091d03          	lh	s10,64(s2)
     d0e:	0100                	addi	s0,sp,128
     d10:	0505                	addi	a0,a0,1
     d12:	0306                	slli	t1,t1,0x1
     d14:	0900                	addi	s0,sp,144
     d16:	0004                	.insn	2, 0x0004
     d18:	0301                	addi	t1,t1,0
     d1a:	0945                	addi	s2,s2,17
     d1c:	0004                	.insn	2, 0x0004
     d1e:	0501                	addi	a0,a0,0
     d20:	0628                	addi	a0,sp,776
     d22:	0900c303          	lbu	t1,144(ra)
     d26:	0010                	.insn	2, 0x0010
     d28:	0501                	addi	a0,a0,0
     d2a:	0622                	slli	a2,a2,0x8
     d2c:	04090003          	lb	zero,64(s2)
     d30:	0100                	addi	s0,sp,128
     d32:	1505                	addi	a0,a0,-31
     d34:	04090003          	lb	zero,64(s2)
     d38:	0100                	addi	s0,sp,128
     d3a:	1105                	addi	sp,sp,-31
     d3c:	0306                	slli	t1,t1,0x1
     d3e:	0901                	addi	s2,s2,0
     d40:	0004                	.insn	2, 0x0004
     d42:	0601                	addi	a2,a2,0
     d44:	097fbc03          	.insn	4, 0x097fbc03
     d48:	0004                	.insn	2, 0x0004
     d4a:	0501                	addi	a0,a0,0
     d4c:	0609                	addi	a2,a2,2
     d4e:	10092e03          	lw	t3,256(s2)
     d52:	0100                	addi	s0,sp,128
     d54:	0204                	addi	s1,sp,256
     d56:	0c05                	addi	s8,s8,1
     d58:	04097303          	.insn	4, 0x04097303
     d5c:	0100                	addi	s0,sp,128
     d5e:	0104                	addi	s1,sp,128
     d60:	0005                	c.nop	1
     d62:	04090c03          	lb	s8,64(s2)
     d66:	0100                	addi	s0,sp,128
     d68:	0505                	addi	a0,a0,1
     d6a:	0306                	slli	t1,t1,0x1
     d6c:	0900                	addi	s0,sp,144
     d6e:	0004                	.insn	2, 0x0004
     d70:	0401                	addi	s0,s0,0
     d72:	0502                	c.slli64	a0
     d74:	061f 7103 0409      	.insn	6, 0x04097103061f
     d7a:	0100                	addi	s0,sp,128
     d7c:	0104                	addi	s1,sp,128
     d7e:	1e05                	addi	t3,t3,-31 # 19fe1 <$d.7+0x18199>
     d80:	04092403          	lw	s0,64(s2)
     d84:	0100                	addi	s0,sp,128
     d86:	0505                	addi	a0,a0,1
     d88:	0306                	slli	t1,t1,0x1
     d8a:	0900                	addi	s0,sp,144
     d8c:	0004                	.insn	2, 0x0004
     d8e:	0301                	addi	t1,t1,0
     d90:	7fbe                	.insn	2, 0x7fbe
     d92:	0409                	addi	s0,s0,2
     d94:	0100                	addi	s0,sp,128
     d96:	0204                	addi	s1,sp,256
     d98:	0c05                	addi	s8,s8,1
     d9a:	0306                	slli	t1,t1,0x1
     d9c:	0921                	addi	s2,s2,8
     d9e:	0004                	.insn	2, 0x0004
     da0:	0401                	addi	s0,s0,0
     da2:	0501                	addi	a0,a0,0
     da4:	090c032f          	.insn	4, 0x090c032f
     da8:	0004                	.insn	2, 0x0004
     daa:	0501                	addi	a0,a0,0
     dac:	0605                	addi	a2,a2,1
     dae:	04090003          	lb	zero,64(s2)
     db2:	0100                	addi	s0,sp,128
     db4:	0905                	addi	s2,s2,1
     db6:	0306                	slli	t1,t1,0x1
     db8:	0901                	addi	s2,s2,0
     dba:	0004                	.insn	2, 0x0004
     dbc:	0601                	addi	a2,a2,0
     dbe:	08095203          	lhu	tp,128(s2)
     dc2:	0100                	addi	s0,sp,128
     dc4:	1c092e03          	lw	t3,448(s2)
     dc8:	0100                	addi	s0,sp,128
     dca:	0204                	addi	s1,sp,256
     dcc:	0c05                	addi	s8,s8,1
     dce:	0306                	slli	t1,t1,0x1
     dd0:	00040973          	.insn	4, 0x00040973
     dd4:	0401                	addi	s0,s0,0
     dd6:	0501                	addi	a0,a0,0
     dd8:	0300                	addi	s0,sp,384
     dda:	090c                	addi	a1,sp,144
     ddc:	0004                	.insn	2, 0x0004
     dde:	0501                	addi	a0,a0,0
     de0:	0605                	addi	a2,a2,1
     de2:	04090003          	lb	zero,64(s2)
     de6:	0100                	addi	s0,sp,128
     de8:	0005                	c.nop	1
     dea:	0306                	slli	t1,t1,0x1
     dec:	0004090f          	.insn	4, 0x0004090f
     df0:	0601                	addi	a2,a2,0
     df2:	04094403          	lbu	s0,64(s2)
     df6:	0100                	addi	s0,sp,128
     df8:	2805                	jal	e28 <$d.2+0x9a>
     dfa:	0306                	slli	t1,t1,0x1
     dfc:	0931                	addi	s2,s2,12
     dfe:	0004                	.insn	2, 0x0004
     e00:	0401                	addi	s0,s0,0
     e02:	0502                	c.slli64	a0
     e04:	031f 096d 0004      	.insn	6, 0x0004096d031f
     e0a:	0401                	addi	s0,s0,0
     e0c:	0501                	addi	a0,a0,0
     e0e:	030c                	addi	a1,sp,384
     e10:	091d                	addi	s2,s2,7
     e12:	0004                	.insn	2, 0x0004
     e14:	0501                	addi	a0,a0,0
     e16:	0605                	addi	a2,a2,1
     e18:	04090003          	lb	zero,64(s2)
     e1c:	0100                	addi	s0,sp,128
     e1e:	04094503          	lbu	a0,64(s2)
     e22:	0100                	addi	s0,sp,128
     e24:	2805                	jal	e54 <$d.2+0xc6>
     e26:	0306                	slli	t1,t1,0x1
     e28:	100900c3          	.insn	4, 0x100900c3
     e2c:	0100                	addi	s0,sp,128
     e2e:	2205                	jal	f4e <$d.2+0x1c0>
     e30:	0306                	slli	t1,t1,0x1
     e32:	0900                	addi	s0,sp,144
     e34:	0004                	.insn	2, 0x0004
     e36:	0501                	addi	a0,a0,0
     e38:	0315                	addi	t1,t1,5
     e3a:	0900                	addi	s0,sp,144
     e3c:	0004                	.insn	2, 0x0004
     e3e:	0501                	addi	a0,a0,0
     e40:	0611                	addi	a2,a2,4
     e42:	04090103          	lb	sp,64(s2)
     e46:	0100                	addi	s0,sp,128
     e48:	0306                	slli	t1,t1,0x1
     e4a:	7fbc                	.insn	2, 0x7fbc
     e4c:	0409                	addi	s0,s0,2
     e4e:	0100                	addi	s0,sp,128
     e50:	0905                	addi	s2,s2,1
     e52:	0306                	slli	t1,t1,0x1
     e54:	092e                	slli	s2,s2,0xb
     e56:	0010                	.insn	2, 0x0010
     e58:	0401                	addi	s0,s0,0
     e5a:	0502                	c.slli64	a0
     e5c:	030c                	addi	a1,sp,384
     e5e:	00040973          	.insn	4, 0x00040973
     e62:	0401                	addi	s0,s0,0
     e64:	0501                	addi	a0,a0,0
     e66:	0300                	addi	s0,sp,384
     e68:	090c                	addi	a1,sp,144
     e6a:	0004                	.insn	2, 0x0004
     e6c:	0501                	addi	a0,a0,0
     e6e:	0605                	addi	a2,a2,1
     e70:	04090003          	lb	zero,64(s2)
     e74:	0100                	addi	s0,sp,128
     e76:	0204                	addi	s1,sp,256
     e78:	1f05                	addi	t5,t5,-31
     e7a:	0306                	slli	t1,t1,0x1
     e7c:	0971                	addi	s2,s2,28
     e7e:	0004                	.insn	2, 0x0004
     e80:	0401                	addi	s0,s0,0
     e82:	0501                	addi	a0,a0,0
     e84:	031e                	slli	t1,t1,0x7
     e86:	0924                	addi	s1,sp,152
     e88:	0004                	.insn	2, 0x0004
     e8a:	0501                	addi	a0,a0,0
     e8c:	0605                	addi	a2,a2,1
     e8e:	04090003          	lb	zero,64(s2)
     e92:	0100                	addi	s0,sp,128
     e94:	097fbe03          	.insn	4, 0x097fbe03
     e98:	0004                	.insn	2, 0x0004
     e9a:	0401                	addi	s0,s0,0
     e9c:	0502                	c.slli64	a0
     e9e:	060c                	addi	a1,sp,768
     ea0:	04092103          	lw	sp,64(s2)
     ea4:	0100                	addi	s0,sp,128
     ea6:	0104                	addi	s1,sp,128
     ea8:	2f05                	jal	15d8 <$d.4+0x3a9>
     eaa:	04090c03          	lb	s8,64(s2)
     eae:	0100                	addi	s0,sp,128
     eb0:	0505                	addi	a0,a0,1
     eb2:	0306                	slli	t1,t1,0x1
     eb4:	0900                	addi	s0,sp,144
     eb6:	0004                	.insn	2, 0x0004
     eb8:	0501                	addi	a0,a0,0
     eba:	0609                	addi	a2,a2,2
     ebc:	04090103          	lb	sp,64(s2)
     ec0:	0100                	addi	s0,sp,128
     ec2:	0306                	slli	t1,t1,0x1
     ec4:	0952                	slli	s2,s2,0x14
     ec6:	0008                	.insn	2, 0x0008
     ec8:	0401                	addi	s0,s0,0
     eca:	0502                	c.slli64	a0
     ecc:	061f 1e03 0809      	.insn	6, 0x08091e03061f
     ed2:	0100                	addi	s0,sp,128
     ed4:	0306                	slli	t1,t1,0x1
     ed6:	0962                	slli	s2,s2,0x18
     ed8:	0008                	.insn	2, 0x0008
     eda:	0401                	addi	s0,s0,0
     edc:	0501                	addi	a0,a0,0
     ede:	0601                	addi	a2,a2,0
     ee0:	01d0030b          	.insn	4, 0x01d0030b
     ee4:	3009                	jal	6e6 <$d.6+0x73>
     ee6:	0100                	addi	s0,sp,128
     ee8:	0306                	slli	t1,t1,0x1
     eea:	7eb0                	.insn	2, 0x7eb0
     eec:	0809                	addi	a6,a6,2
     eee:	0100                	addi	s0,sp,128
     ef0:	0005                	c.nop	1
     ef2:	0306                	slli	t1,t1,0x1
     ef4:	00c1                	addi	ra,ra,16
     ef6:	0809                	addi	a6,a6,2
     ef8:	0100                	addi	s0,sp,128
     efa:	2805                	jal	f2a <$d.2+0x19c>
     efc:	030a                	slli	t1,t1,0x2
     efe:	0902                	c.slli64	s2
     f00:	0010                	.insn	2, 0x0010
     f02:	0501                	addi	a0,a0,0
     f04:	0622                	slli	a2,a2,0x8
     f06:	04090003          	lb	zero,64(s2)
     f0a:	0100                	addi	s0,sp,128
     f0c:	1505                	addi	a0,a0,-31
     f0e:	04090003          	lb	zero,64(s2)
     f12:	0100                	addi	s0,sp,128
     f14:	1105                	addi	sp,sp,-31
     f16:	0306                	slli	t1,t1,0x1
     f18:	0901                	addi	s2,s2,0
     f1a:	0004                	.insn	2, 0x0004
     f1c:	0601                	addi	a2,a2,0
     f1e:	097fbc03          	.insn	4, 0x097fbc03
     f22:	0004                	.insn	2, 0x0004
     f24:	0501                	addi	a0,a0,0
     f26:	0609                	addi	a2,a2,2
     f28:	10092e03          	lw	t3,256(s2)
     f2c:	0100                	addi	s0,sp,128
     f2e:	0204                	addi	s1,sp,256
     f30:	0c05                	addi	s8,s8,1
     f32:	04097303          	.insn	4, 0x04097303
     f36:	0100                	addi	s0,sp,128
     f38:	0104                	addi	s1,sp,128
     f3a:	0005                	c.nop	1
     f3c:	04090c03          	lb	s8,64(s2)
     f40:	0100                	addi	s0,sp,128
     f42:	0505                	addi	a0,a0,1
     f44:	0306                	slli	t1,t1,0x1
     f46:	0900                	addi	s0,sp,144
     f48:	0004                	.insn	2, 0x0004
     f4a:	0401                	addi	s0,s0,0
     f4c:	0502                	c.slli64	a0
     f4e:	061f 7103 0409      	.insn	6, 0x04097103061f
     f54:	0100                	addi	s0,sp,128
     f56:	0104                	addi	s1,sp,128
     f58:	1e05                	addi	t3,t3,-31
     f5a:	04092403          	lw	s0,64(s2)
     f5e:	0100                	addi	s0,sp,128
     f60:	0505                	addi	a0,a0,1
     f62:	0306                	slli	t1,t1,0x1
     f64:	0900                	addi	s0,sp,144
     f66:	0004                	.insn	2, 0x0004
     f68:	0501                	addi	a0,a0,0
     f6a:	0601                	addi	a2,a2,0
     f6c:	04090403          	lb	s0,64(s2)
     f70:	0100                	addi	s0,sp,128
     f72:	0409                	addi	s0,s0,2
     f74:	0000                	unimp
     f76:	0101                	addi	sp,sp,0

00000f78 <$d.10>:
     f78:	0000096f          	jal	s2,f78 <$d.10>
     f7c:	0004                	.insn	2, 0x0004
     f7e:	0032                	c.slli	zero,0xc
     f80:	0000                	unimp
     f82:	0101                	addi	sp,sp,0
     f84:	fb01                	bnez	a4,e94 <$d.2+0x106>
     f86:	0d0e                	slli	s10,s10,0x3
     f88:	0100                	addi	s0,sp,128
     f8a:	0101                	addi	sp,sp,0
     f8c:	0001                	nop
     f8e:	0000                	unimp
     f90:	0001                	nop
     f92:	0100                	addi	s0,sp,128
     f94:	2f2e                	.insn	2, 0x2f2e
     f96:	00637273          	.insn	4, 0x00637273
     f9a:	6300                	.insn	2, 0x6300
     f9c:	6f6d6d6f          	jal	s10,d7692 <$d.7+0xd584a>
     fa0:	2e6e                	.insn	2, 0x2e6e
     fa2:	00010063          	beqz	sp,fa2 <$d.10+0x2a>
     fa6:	6300                	.insn	2, 0x6300
     fa8:	6f6d6d6f          	jal	s10,d769e <$d.7+0xd5856>
     fac:	2e6e                	.insn	2, 0x2e6e
     fae:	0068                	addi	a0,sp,12
     fb0:	0001                	nop
     fb2:	0000                	unimp
     fb4:	0505                	addi	a0,a0,1
     fb6:	000a                	c.slli	zero,0x2
     fb8:	0205                	addi	tp,tp,1 # 1 <$d.6+0x1>
     fba:	0ce0                	addi	s0,sp,604
     fbc:	0010                	.insn	2, 0x0010
     fbe:	7a030617          	auipc	a2,0x7a030
     fc2:	0809                	addi	a6,a6,2
     fc4:	0100                	addi	s0,sp,128
     fc6:	1005                	c.nop	-31
     fc8:	0306                	slli	t1,t1,0x1
     fca:	00040907          	.insn	4, 0x00040907
     fce:	0501                	addi	a0,a0,0
     fd0:	0612                	slli	a2,a2,0x4
     fd2:	04090003          	lb	zero,64(s2)
     fd6:	0100                	addi	s0,sp,128
     fd8:	0b05                	addi	s6,s6,1
     fda:	04090003          	lb	zero,64(s2)
     fde:	0100                	addi	s0,sp,128
     fe0:	0e05                	addi	t3,t3,1
     fe2:	04090003          	lb	zero,64(s2)
     fe6:	0100                	addi	s0,sp,128
     fe8:	04097903          	.insn	4, 0x04097903
     fec:	0100                	addi	s0,sp,128
     fee:	0505                	addi	a0,a0,1
     ff0:	0306                	slli	t1,t1,0x1
     ff2:	0906                	slli	s2,s2,0x1
     ff4:	0004                	.insn	2, 0x0004
     ff6:	0301                	addi	t1,t1,0
     ff8:	0902                	c.slli64	s2
     ffa:	0004                	.insn	2, 0x0004
     ffc:	0a01                	addi	s4,s4,0
     ffe:	04091a03          	lh	s4,64(s2)
    1002:	0100                	addi	s0,sp,128
    1004:	0306                	slli	t1,t1,0x1
    1006:	095e                	slli	s2,s2,0x17
    1008:	0008                	.insn	2, 0x0008
    100a:	0501                	addi	a0,a0,0
    100c:	2303060b          	.insn	4, 0x2303060b
    1010:	0409                	addi	s0,s0,2
    1012:	0100                	addi	s0,sp,128
    1014:	0e05                	addi	t3,t3,1
    1016:	0306                	slli	t1,t1,0x1
    1018:	0900                	addi	s0,sp,144
    101a:	0004                	.insn	2, 0x0004
    101c:	0301                	addi	t1,t1,0
    101e:	095d                	addi	s2,s2,23
    1020:	0004                	.insn	2, 0x0004
    1022:	0501                	addi	a0,a0,0
    1024:	0605                	addi	a2,a2,1 # 7a030fbf <_stack_top+0x79f251ff>
    1026:	04092203          	lw	tp,64(s2)
    102a:	0100                	addi	s0,sp,128
    102c:	04090203          	lb	tp,64(s2)
    1030:	0100                	addi	s0,sp,128
    1032:	0005                	c.nop	1
    1034:	0900c903          	lbu	s2,144(ra)
    1038:	0004                	.insn	2, 0x0004
    103a:	0501                	addi	a0,a0,0
    103c:	0a09                	addi	s4,s4,2
    103e:	14090503          	lb	a0,320(s2)
    1042:	0100                	addi	s0,sp,128
    1044:	04090703          	lb	a4,64(s2)
    1048:	0100                	addi	s0,sp,128
    104a:	04090103          	lb	sp,64(s2)
    104e:	0100                	addi	s0,sp,128
    1050:	0306                	slli	t1,t1,0x1
    1052:	7f86                	.insn	2, 0x7f86
    1054:	0409                	addi	s0,s0,2
    1056:	0100                	addi	s0,sp,128
    1058:	00fa030b          	.insn	4, 0x00fa030b
    105c:	1009                	c.nop	-30
    105e:	0100                	addi	s0,sp,128
    1060:	097f8603          	lb	a2,151(t6)
    1064:	000c                	.insn	2, 0x000c
    1066:	0601                	addi	a2,a2,0
    1068:	0900f303          	.insn	4, 0x0900f303
    106c:	0004                	.insn	2, 0x0004
    106e:	0601                	addi	a2,a2,0
    1070:	097f8d03          	lb	s10,151(t6)
    1074:	000c                	.insn	2, 0x000c
    1076:	0501                	addi	a0,a0,0
    1078:	0622                	slli	a2,a2,0x8
    107a:	0900f403          	.insn	4, 0x0900f403
    107e:	0004                	.insn	2, 0x0004
    1080:	0601                	addi	a2,a2,0
    1082:	097f8c03          	lb	s8,151(t6)
    1086:	0004                	.insn	2, 0x0004
    1088:	0501                	addi	a0,a0,0
    108a:	0610                	addi	a2,sp,768
    108c:	0900e103          	.insn	4, 0x0900e103
    1090:	0020                	addi	s0,sp,8
    1092:	0501                	addi	a0,a0,0
    1094:	061c                	addi	a5,sp,768
    1096:	04090003          	lb	zero,64(s2)
    109a:	0100                	addi	s0,sp,128
    109c:	2205                	jal	11bc <$d.10+0x244>
    109e:	04090003          	lb	zero,64(s2)
    10a2:	0100                	addi	s0,sp,128
    10a4:	1605                	addi	a2,a2,-31
    10a6:	04090003          	lb	zero,64(s2)
    10aa:	0100                	addi	s0,sp,128
    10ac:	0f05                	addi	t5,t5,1
    10ae:	0306                	slli	t1,t1,0x1
    10b0:	0901                	addi	s2,s2,0
    10b2:	0004                	.insn	2, 0x0004
    10b4:	0501                	addi	a0,a0,0
    10b6:	060d                	addi	a2,a2,3
    10b8:	04090003          	lb	zero,64(s2)
    10bc:	0100                	addi	s0,sp,128
    10be:	1e05                	addi	t3,t3,-31
    10c0:	0306                	slli	t1,t1,0x1
    10c2:	097e                	slli	s2,s2,0x1f
    10c4:	0014                	.insn	2, 0x0014
    10c6:	0501                	addi	a0,a0,0
    10c8:	030d                	addi	t1,t1,3
    10ca:	0902                	c.slli64	s2
    10cc:	0004                	.insn	2, 0x0004
    10ce:	0501                	addi	a0,a0,0
    10d0:	0305                	addi	t1,t1,1
    10d2:	097e                	slli	s2,s2,0x1f
    10d4:	0004                	.insn	2, 0x0004
    10d6:	0501                	addi	a0,a0,0
    10d8:	0316                	slli	t1,t1,0x5
    10da:	0921                	addi	s2,s2,8
    10dc:	0004                	.insn	2, 0x0004
    10de:	0501                	addi	a0,a0,0
    10e0:	0610                	addi	a2,sp,768
    10e2:	04090003          	lb	zero,64(s2)
    10e6:	0100                	addi	s0,sp,128
    10e8:	0905                	addi	s2,s2,1
    10ea:	04090003          	lb	zero,64(s2)
    10ee:	0100                	addi	s0,sp,128
    10f0:	1405                	addi	s0,s0,-31
    10f2:	04090003          	lb	zero,64(s2)
    10f6:	0100                	addi	s0,sp,128
    10f8:	0505                	addi	a0,a0,1
    10fa:	0306                	slli	t1,t1,0x1
    10fc:	097d                	addi	s2,s2,31
    10fe:	0008                	.insn	2, 0x0008
    1100:	0601                	addi	a2,a2,0
    1102:	097f8203          	lb	tp,151(t6)
    1106:	0004                	.insn	2, 0x0004
    1108:	0501                	addi	a0,a0,0
    110a:	0616                	slli	a2,a2,0x5
    110c:	09018503          	lb	a0,144(gp)
    1110:	0008                	.insn	2, 0x0008
    1112:	0501                	addi	a0,a0,0
    1114:	0609                	addi	a2,a2,2
    1116:	08090003          	lb	zero,128(s2)
    111a:	0100                	addi	s0,sp,128
    111c:	1005                	c.nop	-31
    111e:	0306                	slli	t1,t1,0x1
    1120:	097f 0008 0501 0605 	.insn	10, 0x0003060505010008097f
    1128:	0003 
    112a:	0809                	addi	a6,a6,2
    112c:	0100                	addi	s0,sp,128
    112e:	097efc03          	.insn	4, 0x097efc03
    1132:	0004                	.insn	2, 0x0004
    1134:	0501                	addi	a0,a0,0
    1136:	0601                	addi	a2,a2,0
    1138:	0187030b          	.insn	4, 0x0187030b
    113c:	1009                	c.nop	-30
    113e:	0100                	addi	s0,sp,128
    1140:	0005                	c.nop	1
    1142:	08090203          	lb	tp,128(s2)
    1146:	0100                	addi	s0,sp,128
    1148:	0505                	addi	a0,a0,1
    114a:	030a                	slli	t1,t1,0x2
    114c:	0902                	c.slli64	s2
    114e:	005c                	addi	a5,sp,4
    1150:	0501                	addi	a0,a0,0
    1152:	030d                	addi	t1,t1,3
    1154:	0905                	addi	s2,s2,1
    1156:	0030                	addi	a2,sp,8
    1158:	0501                	addi	a0,a0,0
    115a:	030c                	addi	a1,sp,384
    115c:	093c                	addi	a5,sp,152
    115e:	0004                	.insn	2, 0x0004
    1160:	0301                	addi	t1,t1,0
    1162:	0941                	addi	s2,s2,16
    1164:	0004                	.insn	2, 0x0004
    1166:	0501                	addi	a0,a0,0
    1168:	0605                	addi	a2,a2,1
    116a:	04090003          	lb	zero,64(s2)
    116e:	0100                	addi	s0,sp,128
    1170:	0d05                	addi	s10,s10,1
    1172:	0306                	slli	t1,t1,0x1
    1174:	093c                	addi	a5,sp,152
    1176:	0008                	.insn	2, 0x0008
    1178:	0601                	addi	a2,a2,0
    117a:	097eb703          	.insn	4, 0x097eb703
    117e:	0008                	.insn	2, 0x0008
    1180:	0501                	addi	a0,a0,0
    1182:	060c                	addi	a1,sp,768
    1184:	0901cc03          	lbu	s8,144(gp)
    1188:	0004                	.insn	2, 0x0004
    118a:	0601                	addi	a2,a2,0
    118c:	097eb403          	.insn	4, 0x097eb403
    1190:	0004                	.insn	2, 0x0004
    1192:	0501                	addi	a0,a0,0
    1194:	0615                	addi	a2,a2,5
    1196:	09019003          	lh	zero,144(gp)
    119a:	0004                	.insn	2, 0x0004
    119c:	0501                	addi	a0,a0,0
    119e:	0310                	addi	a2,sp,384
    11a0:	097f 0004 0501 030d 	.insn	10, 0x0901030d05010004097f
    11a8:	0901 
    11aa:	0004                	.insn	2, 0x0004
    11ac:	0501                	addi	a0,a0,0
    11ae:	0321                	addi	t1,t1,8
    11b0:	0910                	addi	a2,sp,144
    11b2:	000c                	.insn	2, 0x000c
    11b4:	0501                	addi	a0,a0,0
    11b6:	0319                	addi	t1,t1,6
    11b8:	00100903          	lb	s2,1(zero) # 1 <$d.6+0x1>
    11bc:	0301                	addi	t1,t1,0
    11be:	090d                	addi	s2,s2,3
    11c0:	0004                	.insn	2, 0x0004
    11c2:	0301                	addi	t1,t1,0
    11c4:	0901                	addi	s2,s2,0
    11c6:	0004                	.insn	2, 0x0004
    11c8:	0501                	addi	a0,a0,0
    11ca:	030c                	addi	a1,sp,384
    11cc:	000c091b          	.insn	4, 0x000c091b
    11d0:	0601                	addi	a2,a2,0
    11d2:	097eb403          	.insn	4, 0x097eb403
    11d6:	0004                	.insn	2, 0x0004
    11d8:	0501                	addi	a0,a0,0
    11da:	060d                	addi	a2,a2,3
    11dc:	09019003          	lh	zero,144(gp)
    11e0:	0004                	.insn	2, 0x0004
    11e2:	0501                	addi	a0,a0,0
    11e4:	0326                	slli	t1,t1,0x9
    11e6:	0931                	addi	s2,s2,12
    11e8:	0008                	.insn	2, 0x0008
    11ea:	0501                	addi	a0,a0,0
    11ec:	0332                	slli	t1,t1,0xc
    11ee:	0902                	c.slli64	s2
    11f0:	0010                	.insn	2, 0x0010
    11f2:	0501                	addi	a0,a0,0
    11f4:	0326                	slli	t1,t1,0x9
    11f6:	0901                	addi	s2,s2,0
    11f8:	0004                	.insn	2, 0x0004
    11fa:	0501                	addi	a0,a0,0
    11fc:	0619                	addi	a2,a2,6
    11fe:	08090003          	lb	zero,128(s2)
    1202:	0100                	addi	s0,sp,128
    1204:	3e05                	jal	d34 <$d.6+0x6c1>
    1206:	0306                	slli	t1,t1,0x1
    1208:	097f 0008 0501 0326 	.insn	10, 0x0901032605010008097f
    1210:	0901 
    1212:	0008                	.insn	2, 0x0008
    1214:	0501                	addi	a0,a0,0
    1216:	0619                	addi	a2,a2,6
    1218:	08090003          	lb	zero,128(s2)
    121c:	0100                	addi	s0,sp,128
    121e:	3e05                	jal	d4e <$d.6+0x6db>
    1220:	0306                	slli	t1,t1,0x1
    1222:	097f 0008 0501 0326 	.insn	10, 0x0901032605010008097f
    122a:	0901 
    122c:	0008                	.insn	2, 0x0008
    122e:	0501                	addi	a0,a0,0
    1230:	0619                	addi	a2,a2,6
    1232:	08090003          	lb	zero,128(s2)
    1236:	0100                	addi	s0,sp,128
    1238:	3e05                	jal	d68 <$d.6+0x6f5>
    123a:	0306                	slli	t1,t1,0x1
    123c:	097f 0008 0501 0326 	.insn	10, 0x0901032605010008097f
    1244:	0901 
    1246:	0008                	.insn	2, 0x0008
    1248:	0501                	addi	a0,a0,0
    124a:	0619                	addi	a2,a2,6
    124c:	08090003          	lb	zero,128(s2)
    1250:	0100                	addi	s0,sp,128
    1252:	3e05                	jal	d82 <$d.6+0x70f>
    1254:	0306                	slli	t1,t1,0x1
    1256:	097f 0008 0501 0326 	.insn	10, 0x0901032605010008097f
    125e:	0901 
    1260:	0008                	.insn	2, 0x0008
    1262:	0501                	addi	a0,a0,0
    1264:	0619                	addi	a2,a2,6
    1266:	08090003          	lb	zero,128(s2)
    126a:	0100                	addi	s0,sp,128
    126c:	3e05                	jal	d9c <$d.2+0xe>
    126e:	0306                	slli	t1,t1,0x1
    1270:	097f 0008 0501 0326 	.insn	10, 0x0901032605010008097f
    1278:	0901 
    127a:	0008                	.insn	2, 0x0008
    127c:	0501                	addi	a0,a0,0
    127e:	0619                	addi	a2,a2,6
    1280:	08090003          	lb	zero,128(s2)
    1284:	0100                	addi	s0,sp,128
    1286:	3e05                	jal	db6 <$d.2+0x28>
    1288:	0306                	slli	t1,t1,0x1
    128a:	097f 0008 0501 0326 	.insn	10, 0x0901032605010008097f
    1292:	0901 
    1294:	0008                	.insn	2, 0x0008
    1296:	0501                	addi	a0,a0,0
    1298:	0619                	addi	a2,a2,6
    129a:	08090003          	lb	zero,128(s2)
    129e:	0100                	addi	s0,sp,128
    12a0:	3e05                	jal	dd0 <$d.2+0x42>
    12a2:	0306                	slli	t1,t1,0x1
    12a4:	097f 0008 0501 0326 	.insn	10, 0x0901032605010008097f
    12ac:	0901 
    12ae:	0004                	.insn	2, 0x0004
    12b0:	0501                	addi	a0,a0,0
    12b2:	0619                	addi	a2,a2,6
    12b4:	08090003          	lb	zero,128(s2)
    12b8:	0100                	addi	s0,sp,128
    12ba:	0c05                	addi	s8,s8,1
    12bc:	0306                	slli	t1,t1,0x1
    12be:	0908                	addi	a0,sp,144
    12c0:	0008                	.insn	2, 0x0008
    12c2:	0601                	addi	a2,a2,0
    12c4:	097eb403          	.insn	4, 0x097eb403
    12c8:	0004                	.insn	2, 0x0004
    12ca:	0501                	addi	a0,a0,0
    12cc:	0615                	addi	a2,a2,5
    12ce:	09019503          	lh	a0,144(gp)
    12d2:	0004                	.insn	2, 0x0004
    12d4:	0501                	addi	a0,a0,0
    12d6:	030c                	addi	a1,sp,384
    12d8:	000c0937          	lui	s2,0xc0
    12dc:	0601                	addi	a2,a2,0
    12de:	097eb403          	.insn	4, 0x097eb403
    12e2:	0004                	.insn	2, 0x0004
    12e4:	0501                	addi	a0,a0,0
    12e6:	0625                	addi	a2,a2,9
    12e8:	09019803          	lh	a6,144(gp)
    12ec:	0004                	.insn	2, 0x0004
    12ee:	0501                	addi	a0,a0,0
    12f0:	031c                	addi	a5,sp,384
    12f2:	0901                	addi	s2,s2,0 # c0000 <$d.7+0xbe1b8>
    12f4:	0010                	.insn	2, 0x0010
    12f6:	0501                	addi	a0,a0,0
    12f8:	0615                	addi	a2,a2,5
    12fa:	04090003          	lb	zero,64(s2)
    12fe:	0100                	addi	s0,sp,128
    1300:	1905                	addi	s2,s2,-31
    1302:	0306                	slli	t1,t1,0x1
    1304:	0901                	addi	s2,s2,0
    1306:	0008                	.insn	2, 0x0008
    1308:	0501                	addi	a0,a0,0
    130a:	031c                	addi	a5,sp,384
    130c:	097f 000c 0501 0615 	.insn	10, 0x000306150501000c097f
    1314:	0003 
    1316:	0409                	addi	s0,s0,2
    1318:	0100                	addi	s0,sp,128
    131a:	1905                	addi	s2,s2,-31
    131c:	0306                	slli	t1,t1,0x1
    131e:	000c090b          	.insn	4, 0x000c090b
    1322:	0501                	addi	a0,a0,0
    1324:	033a                	slli	t1,t1,0xe
    1326:	0902                	c.slli64	s2
    1328:	000c                	.insn	2, 0x000c
    132a:	0601                	addi	a2,a2,0
    132c:	097eda03          	lhu	s4,151(t4) # ffffc097 <_stack_top+0xffef02d7>
    1330:	0004                	.insn	2, 0x0004
    1332:	0501                	addi	a0,a0,0
    1334:	b703061b          	.insn	4, 0xb703061b
    1338:	0901                	addi	s2,s2,0
    133a:	000c                	.insn	2, 0x000c
    133c:	0601                	addi	a2,a2,0
    133e:	097ec903          	lbu	s2,151(t4)
    1342:	0014                	.insn	2, 0x0014
    1344:	0501                	addi	a0,a0,0
    1346:	0624                	addi	s1,sp,776
    1348:	0901b603          	.insn	4, 0x0901b603
    134c:	0010                	.insn	2, 0x0010
    134e:	0501                	addi	a0,a0,0
    1350:	061e                	slli	a2,a2,0x7
    1352:	04090003          	lb	zero,64(s2)
    1356:	0100                	addi	s0,sp,128
    1358:	2205                	jal	1478 <$d.4+0x249>
    135a:	04090003          	lb	zero,64(s2)
    135e:	0100                	addi	s0,sp,128
    1360:	1505                	addi	a0,a0,-31
    1362:	0306                	slli	t1,t1,0x1
    1364:	097f 0008 0601 cb03 	.insn	10, 0x097ecb0306010008097f
    136c:	097e 
    136e:	0004                	.insn	2, 0x0004
    1370:	0501                	addi	a0,a0,0
    1372:	0626                	slli	a2,a2,0x9
    1374:	0901bc03          	.insn	4, 0x0901bc03
    1378:	0004                	.insn	2, 0x0004
    137a:	0501                	addi	a0,a0,0
    137c:	0619                	addi	a2,a2,6
    137e:	08090003          	lb	zero,128(s2)
    1382:	0100                	addi	s0,sp,128
    1384:	1e05                	addi	t3,t3,-31
    1386:	0306                	slli	t1,t1,0x1
    1388:	097f 0008 0501 0615 	.insn	10, 0x0003061505010008097f
    1390:	0003 
    1392:	0809                	addi	a6,a6,2
    1394:	0100                	addi	s0,sp,128
    1396:	0306                	slli	t1,t1,0x1
    1398:	00080957          	.insn	4, 0x00080957
    139c:	0601                	addi	a2,a2,0
    139e:	097eee03          	.insn	4, 0x097eee03
    13a2:	000c                	.insn	2, 0x000c
    13a4:	0501                	addi	a0,a0,0
    13a6:	0601                	addi	a2,a2,0
    13a8:	01d1030b          	.insn	4, 0x01d1030b
    13ac:	3409                	jal	dae <$d.2+0x20>
    13ae:	0100                	addi	s0,sp,128
    13b0:	0505                	addi	a0,a0,1
    13b2:	030a                	slli	t1,t1,0x2
    13b4:	0008091b          	.insn	4, 0x0008091b
    13b8:	0501                	addi	a0,a0,0
    13ba:	060c                	addi	a1,sp,768
    13bc:	14090003          	lb	zero,320(s2)
    13c0:	0100                	addi	s0,sp,128
    13c2:	1605                	addi	a2,a2,-31
    13c4:	04090003          	lb	zero,64(s2)
    13c8:	0100                	addi	s0,sp,128
    13ca:	097e9403          	lh	s0,151(t4)
    13ce:	0008                	.insn	2, 0x0008
    13d0:	0301                	addi	t1,t1,0
    13d2:	01ec                	addi	a1,sp,204
    13d4:	0409                	addi	s0,s0,2
    13d6:	0100                	addi	s0,sp,128
    13d8:	1905                	addi	s2,s2,-31
    13da:	0306                	slli	t1,t1,0x1
    13dc:	00040903          	lb	s2,0(s0)
    13e0:	0501                	addi	a0,a0,0
    13e2:	0625                	addi	a2,a2,9
    13e4:	04090003          	lb	zero,64(s2)
    13e8:	0100                	addi	s0,sp,128
    13ea:	0a05                	addi	s4,s4,1
    13ec:	0306                	slli	t1,t1,0x1
    13ee:	0901                	addi	s2,s2,0
    13f0:	000c                	.insn	2, 0x000c
    13f2:	0601                	addi	a2,a2,0
    13f4:	097e9003          	lh	zero,151(t4)
    13f8:	0004                	.insn	2, 0x0004
    13fa:	0301                	addi	t1,t1,0
    13fc:	01f0                	addi	a2,sp,204
    13fe:	0809                	addi	a6,a6,2
    1400:	0100                	addi	s0,sp,128
    1402:	0905                	addi	s2,s2,1
    1404:	04090003          	lb	zero,64(s2)
    1408:	0100                	addi	s0,sp,128
    140a:	097e9003          	lh	zero,151(t4)
    140e:	0004                	.insn	2, 0x0004
    1410:	0501                	addi	a0,a0,0
    1412:	0601                	addi	a2,a2,0
    1414:	0901fd03          	.insn	4, 0x0901fd03
    1418:	0004                	.insn	2, 0x0004
    141a:	0601                	addi	a2,a2,0
    141c:	097e8303          	lb	t1,151(t4)
    1420:	0004                	.insn	2, 0x0004
    1422:	0501                	addi	a0,a0,0
    1424:	0616                	slli	a2,a2,0x5
    1426:	0901f503          	.insn	4, 0x0901f503
    142a:	000c                	.insn	2, 0x000c
    142c:	0501                	addi	a0,a0,0
    142e:	0600                	addi	s0,sp,768
    1430:	097e8b03          	lb	s6,151(t4)
    1434:	0014                	.insn	2, 0x0014
    1436:	0501                	addi	a0,a0,0
    1438:	060c                	addi	a1,sp,768
    143a:	0901f203          	.insn	4, 0x0901f203
    143e:	0004                	.insn	2, 0x0004
    1440:	0501                	addi	a0,a0,0
    1442:	0600                	addi	s0,sp,768
    1444:	097e8e03          	lb	t3,151(t4)
    1448:	0004                	.insn	2, 0x0004
    144a:	0501                	addi	a0,a0,0
    144c:	0610                	addi	a2,sp,768
    144e:	0901f903          	.insn	4, 0x0901f903
    1452:	0004                	.insn	2, 0x0004
    1454:	0501                	addi	a0,a0,0
    1456:	0616                	slli	a2,a2,0x5
    1458:	04090003          	lb	zero,64(s2)
    145c:	0100                	addi	s0,sp,128
    145e:	0505                	addi	a0,a0,1
    1460:	0306                	slli	t1,t1,0x1
    1462:	0979                	addi	s2,s2,30
    1464:	0004                	.insn	2, 0x0004
    1466:	0601                	addi	a2,a2,0
    1468:	097e8e03          	lb	t3,151(t4)
    146c:	0004                	.insn	2, 0x0004
    146e:	0501                	addi	a0,a0,0
    1470:	0616                	slli	a2,a2,0x5
    1472:	0901f503          	.insn	4, 0x0901f503
    1476:	0004                	.insn	2, 0x0004
    1478:	0501                	addi	a0,a0,0
    147a:	0901031b          	.insn	4, 0x0901031b
    147e:	0010                	.insn	2, 0x0010
    1480:	0301                	addi	t1,t1,0
    1482:	0901                	addi	s2,s2,0
    1484:	0010                	.insn	2, 0x0010
    1486:	0601                	addi	a2,a2,0
    1488:	097e8903          	lb	s2,151(t4)
    148c:	0010                	.insn	2, 0x0010
    148e:	0501                	addi	a0,a0,0
    1490:	060a                	slli	a2,a2,0x2
    1492:	0901fb03          	.insn	4, 0x0901fb03
    1496:	0004                	.insn	2, 0x0004
    1498:	0501                	addi	a0,a0,0
    149a:	0301                	addi	t1,t1,0
    149c:	0902                	c.slli64	s2
    149e:	0004                	.insn	2, 0x0004
    14a0:	0501                	addi	a0,a0,0
    14a2:	0300                	addi	s0,sp,384
    14a4:	00040907          	.insn	4, 0x00040907
    14a8:	0501                	addi	a0,a0,0
    14aa:	0a05                	addi	s4,s4,1
    14ac:	3c090403          	lb	s0,960(s2)
    14b0:	0100                	addi	s0,sp,128
    14b2:	0306                	slli	t1,t1,0x1
    14b4:	7df8                	.insn	2, 0x7df8
    14b6:	0409                	addi	s0,s0,2
    14b8:	0100                	addi	s0,sp,128
    14ba:	0905                	addi	s2,s2,1
    14bc:	0306                	slli	t1,t1,0x1
    14be:	2c0902a3          	sb	zero,709(s2)
    14c2:	0100                	addi	s0,sp,128
    14c4:	0c090103          	lb	sp,192(s2)
    14c8:	0100                	addi	s0,sp,128
    14ca:	0d05                	addi	s10,s10,1
    14cc:	0c090203          	lb	tp,192(s2)
    14d0:	0100                	addi	s0,sp,128
    14d2:	0306                	slli	t1,t1,0x1
    14d4:	7dda                	.insn	2, 0x7dda
    14d6:	0409                	addi	s0,s0,2
    14d8:	0100                	addi	s0,sp,128
    14da:	3005                	jal	cfa <$d.6+0x687>
    14dc:	0306                	slli	t1,t1,0x1
    14de:	028c                	addi	a1,sp,320
    14e0:	0809                	addi	a6,a6,2
    14e2:	0100                	addi	s0,sp,128
    14e4:	1a05                	addi	s4,s4,-31
    14e6:	04095503          	lhu	a0,64(s2)
    14ea:	0100                	addi	s0,sp,128
    14ec:	1605                	addi	a2,a2,-31
    14ee:	04090203          	lb	tp,64(s2)
    14f2:	0100                	addi	s0,sp,128
    14f4:	1c05                	addi	s8,s8,-31
    14f6:	08092603          	lw	a2,128(s2)
    14fa:	0100                	addi	s0,sp,128
    14fc:	0905                	addi	s2,s2,1
    14fe:	04095a03          	lhu	s4,64(s2)
    1502:	0100                	addi	s0,sp,128
    1504:	1705                	addi	a4,a4,-31
    1506:	08097e03          	.insn	4, 0x08097e03
    150a:	0100                	addi	s0,sp,128
    150c:	1605                	addi	a2,a2,-31
    150e:	08090203          	lb	tp,128(s2)
    1512:	0100                	addi	s0,sp,128
    1514:	0905                	addi	s2,s2,1
    1516:	0306                	slli	t1,t1,0x1
    1518:	0900                	addi	s0,sp,144
    151a:	0008                	.insn	2, 0x0008
    151c:	0501                	addi	a0,a0,0
    151e:	7e030617          	auipc	a2,0x7e030
    1522:	0809                	addi	a6,a6,2
    1524:	0100                	addi	s0,sp,128
    1526:	1605                	addi	a2,a2,-31 # 7e0314ff <_stack_top+0x7df2573f>
    1528:	08090203          	lb	tp,128(s2)
    152c:	0100                	addi	s0,sp,128
    152e:	0905                	addi	s2,s2,1
    1530:	0306                	slli	t1,t1,0x1
    1532:	0900                	addi	s0,sp,144
    1534:	0008                	.insn	2, 0x0008
    1536:	0501                	addi	a0,a0,0
    1538:	7e030617          	auipc	a2,0x7e030
    153c:	0809                	addi	a6,a6,2
    153e:	0100                	addi	s0,sp,128
    1540:	1605                	addi	a2,a2,-31 # 7e031519 <_stack_top+0x7df25759>
    1542:	08090203          	lb	tp,128(s2)
    1546:	0100                	addi	s0,sp,128
    1548:	0905                	addi	s2,s2,1
    154a:	0306                	slli	t1,t1,0x1
    154c:	0900                	addi	s0,sp,144
    154e:	0008                	.insn	2, 0x0008
    1550:	0501                	addi	a0,a0,0
    1552:	7e030617          	auipc	a2,0x7e030
    1556:	0809                	addi	a6,a6,2
    1558:	0100                	addi	s0,sp,128
    155a:	1605                	addi	a2,a2,-31 # 7e031533 <_stack_top+0x7df25773>
    155c:	08090203          	lb	tp,128(s2)
    1560:	0100                	addi	s0,sp,128
    1562:	0905                	addi	s2,s2,1
    1564:	0306                	slli	t1,t1,0x1
    1566:	0900                	addi	s0,sp,144
    1568:	0008                	.insn	2, 0x0008
    156a:	0501                	addi	a0,a0,0
    156c:	7e030617          	auipc	a2,0x7e030
    1570:	0809                	addi	a6,a6,2
    1572:	0100                	addi	s0,sp,128
    1574:	1605                	addi	a2,a2,-31 # 7e03154d <_stack_top+0x7df2578d>
    1576:	08090203          	lb	tp,128(s2)
    157a:	0100                	addi	s0,sp,128
    157c:	0905                	addi	s2,s2,1
    157e:	0306                	slli	t1,t1,0x1
    1580:	0900                	addi	s0,sp,144
    1582:	0008                	.insn	2, 0x0008
    1584:	0501                	addi	a0,a0,0
    1586:	7e030617          	auipc	a2,0x7e030
    158a:	0809                	addi	a6,a6,2
    158c:	0100                	addi	s0,sp,128
    158e:	1605                	addi	a2,a2,-31 # 7e031567 <_stack_top+0x7df257a7>
    1590:	08090203          	lb	tp,128(s2)
    1594:	0100                	addi	s0,sp,128
    1596:	0905                	addi	s2,s2,1
    1598:	0306                	slli	t1,t1,0x1
    159a:	0900                	addi	s0,sp,144
    159c:	0008                	.insn	2, 0x0008
    159e:	0501                	addi	a0,a0,0
    15a0:	7e030617          	auipc	a2,0x7e030
    15a4:	0809                	addi	a6,a6,2
    15a6:	0100                	addi	s0,sp,128
    15a8:	1605                	addi	a2,a2,-31 # 7e031581 <_stack_top+0x7df257c1>
    15aa:	04090203          	lb	tp,64(s2)
    15ae:	0100                	addi	s0,sp,128
    15b0:	0905                	addi	s2,s2,1
    15b2:	0306                	slli	t1,t1,0x1
    15b4:	0900                	addi	s0,sp,144
    15b6:	0008                	.insn	2, 0x0008
    15b8:	0601                	addi	a2,a2,0
    15ba:	08092a03          	lw	s4,128(s2)
    15be:	0100                	addi	s0,sp,128
    15c0:	0306                	slli	t1,t1,0x1
    15c2:	0c097df3          	.insn	4, 0x0c097df3
    15c6:	0100                	addi	s0,sp,128
    15c8:	2505                	jal	1be8 <$d.4+0x16c>
    15ca:	0306                	slli	t1,t1,0x1
    15cc:	0290                	addi	a2,sp,320
    15ce:	0c09                	addi	s8,s8,2
    15d0:	0100                	addi	s0,sp,128
    15d2:	0905                	addi	s2,s2,1
    15d4:	0306                	slli	t1,t1,0x1
    15d6:	0900                	addi	s0,sp,144
    15d8:	0004                	.insn	2, 0x0004
    15da:	0301                	addi	t1,t1,0
    15dc:	7df0                	.insn	2, 0x7df0
    15de:	0409                	addi	s0,s0,2
    15e0:	0100                	addi	s0,sp,128
    15e2:	1c05                	addi	s8,s8,-31
    15e4:	0306                	slli	t1,t1,0x1
    15e6:	0292                	slli	t0,t0,0x4
    15e8:	0409                	addi	s0,s0,2
    15ea:	0100                	addi	s0,sp,128
    15ec:	0306                	slli	t1,t1,0x1
    15ee:	7dee                	.insn	2, 0x7dee
    15f0:	0809                	addi	a6,a6,2
    15f2:	0100                	addi	s0,sp,128
    15f4:	1205                	addi	tp,tp,-31 # ffffffe1 <_stack_top+0xffef4221>
    15f6:	0306                	slli	t1,t1,0x1
    15f8:	01da                	slli	gp,gp,0x16
    15fa:	0409                	addi	s0,s0,2
    15fc:	0100                	addi	s0,sp,128
    15fe:	0505                	addi	a0,a0,1
    1600:	0306                	slli	t1,t1,0x1
    1602:	0900                	addi	s0,sp,144
    1604:	0008                	.insn	2, 0x0008
    1606:	0501                	addi	a0,a0,0
    1608:	0618                	addi	a4,sp,768
    160a:	08090103          	lb	sp,128(s2)
    160e:	0100                	addi	s0,sp,128
    1610:	1205                	addi	tp,tp,-31 # ffffffe1 <_stack_top+0xffef4221>
    1612:	0306                	slli	t1,t1,0x1
    1614:	0900                	addi	s0,sp,144
    1616:	0004                	.insn	2, 0x0004
    1618:	0501                	addi	a0,a0,0
    161a:	0611                	addi	a2,a2,4
    161c:	0c093a03          	.insn	4, 0x0c093a03
    1620:	0100                	addi	s0,sp,128
    1622:	0005                	c.nop	1
    1624:	0306                	slli	t1,t1,0x1
    1626:	10097deb          	.insn	4, 0x10097deb
    162a:	0100                	addi	s0,sp,128
    162c:	0d05                	addi	s10,s10,1
    162e:	0306                	slli	t1,t1,0x1
    1630:	0298                	addi	a4,sp,320
    1632:	0c09                	addi	s8,s8,2
    1634:	0100                	addi	s0,sp,128
    1636:	1105                	addi	sp,sp,-31
    1638:	0c090103          	lb	sp,192(s2)
    163c:	0100                	addi	s0,sp,128
    163e:	1905                	addi	s2,s2,-31
    1640:	0306                	slli	t1,t1,0x1
    1642:	0900                	addi	s0,sp,144
    1644:	0004                	.insn	2, 0x0004
    1646:	0301                	addi	t1,t1,0
    1648:	0c097de7          	.insn	4, 0x0c097de7
    164c:	0100                	addi	s0,sp,128
    164e:	1705                	addi	a4,a4,-31
    1650:	0306                	slli	t1,t1,0x1
    1652:	0289                	addi	t0,t0,2 # 3194721 <_stack_top+0x3088961>
    1654:	0809                	addi	a6,a6,2
    1656:	0100                	addi	s0,sp,128
    1658:	0306                	slli	t1,t1,0x1
    165a:	04097df7          	.insn	4, 0x04097df7
    165e:	0100                	addi	s0,sp,128
    1660:	0905                	addi	s2,s2,1
    1662:	0306                	slli	t1,t1,0x1
    1664:	029d                	addi	t0,t0,7
    1666:	0409                	addi	s0,s0,2
    1668:	0100                	addi	s0,sp,128
    166a:	0c090103          	lb	sp,192(s2)
    166e:	0100                	addi	s0,sp,128
    1670:	0c090103          	lb	sp,192(s2)
    1674:	0100                	addi	s0,sp,128
    1676:	0d05                	addi	s10,s10,1
    1678:	18090203          	lb	tp,384(s2)
    167c:	0100                	addi	s0,sp,128
    167e:	1e05                	addi	t3,t3,-31
    1680:	0c097e03          	.insn	4, 0x0c097e03
    1684:	0100                	addi	s0,sp,128
    1686:	0306                	slli	t1,t1,0x1
    1688:	7de1                	lui	s11,0xffff8
    168a:	0409                	addi	s0,s0,2
    168c:	0100                	addi	s0,sp,128
    168e:	1905                	addi	s2,s2,-31
    1690:	0306                	slli	t1,t1,0x1
    1692:	02a0                	addi	s0,sp,328
    1694:	0409                	addi	s0,s0,2
    1696:	0100                	addi	s0,sp,128
    1698:	2505                	jal	1cb8 <$d.13+0x7c>
    169a:	04090103          	lb	sp,64(s2)
    169e:	0100                	addi	s0,sp,128
    16a0:	0306                	slli	t1,t1,0x1
    16a2:	7ddf 0c09 0100      	.insn	6, 0x01000c097ddf
    16a8:	0105                	addi	sp,sp,1
    16aa:	0b06                	slli	s6,s6,0x1
    16ac:	0902a803          	lw	a6,144(t0)
    16b0:	003c                	addi	a5,sp,8
    16b2:	0501                	addi	a0,a0,0
    16b4:	0300                	addi	s0,sp,384
    16b6:	0902                	c.slli64	s2
    16b8:	0008                	.insn	2, 0x0008
    16ba:	0501                	addi	a0,a0,0
    16bc:	08030a13          	addi	s4,t1,128
    16c0:	1009                	c.nop	-30
    16c2:	0100                	addi	s0,sp,128
    16c4:	1e05                	addi	t3,t3,-31
    16c6:	0306                	slli	t1,t1,0x1
    16c8:	0900                	addi	s0,sp,144
    16ca:	0008                	.insn	2, 0x0008
    16cc:	0501                	addi	a0,a0,0
    16ce:	0326                	slli	t1,t1,0x9
    16d0:	0900                	addi	s0,sp,144
    16d2:	0004                	.insn	2, 0x0004
    16d4:	0501                	addi	a0,a0,0
    16d6:	0329                	addi	t1,t1,10
    16d8:	0900                	addi	s0,sp,144
    16da:	0004                	.insn	2, 0x0004
    16dc:	0501                	addi	a0,a0,0
    16de:	0309                	addi	t1,t1,2
    16e0:	0900                	addi	s0,sp,144
    16e2:	0004                	.insn	2, 0x0004
    16e4:	0501                	addi	a0,a0,0
    16e6:	0605                	addi	a2,a2,1
    16e8:	097fba03          	.insn	4, 0x097fba03
    16ec:	0004                	.insn	2, 0x0004
    16ee:	0501                	addi	a0,a0,0
    16f0:	060c                	addi	a1,sp,768
    16f2:	10090003          	lb	zero,256(s2)
    16f6:	0100                	addi	s0,sp,128
    16f8:	0505                	addi	a0,a0,1
    16fa:	04090003          	lb	zero,64(s2)
    16fe:	0100                	addi	s0,sp,128
    1700:	1605                	addi	a2,a2,-31
    1702:	04090003          	lb	zero,64(s2)
    1706:	0100                	addi	s0,sp,128
    1708:	097e9403          	lh	s0,151(t4)
    170c:	000c                	.insn	2, 0x000c
    170e:	0301                	addi	t1,t1,0
    1710:	01ec                	addi	a1,sp,204
    1712:	0409                	addi	s0,s0,2
    1714:	0100                	addi	s0,sp,128
    1716:	1905                	addi	s2,s2,-31
    1718:	0306                	slli	t1,t1,0x1
    171a:	00040903          	lb	s2,0(s0)
    171e:	0501                	addi	a0,a0,0
    1720:	0625                	addi	a2,a2,9
    1722:	04090003          	lb	zero,64(s2)
    1726:	0100                	addi	s0,sp,128
    1728:	0a05                	addi	s4,s4,1
    172a:	0306                	slli	t1,t1,0x1
    172c:	0901                	addi	s2,s2,0
    172e:	000c                	.insn	2, 0x000c
    1730:	0601                	addi	a2,a2,0
    1732:	097e9003          	lh	zero,151(t4)
    1736:	0010                	.insn	2, 0x0010
    1738:	0501                	addi	a0,a0,0
    173a:	061e                	slli	a2,a2,0x7
    173c:	0902ba03          	.insn	4, 0x0902ba03
    1740:	0014                	.insn	2, 0x0014
    1742:	0601                	addi	a2,a2,0
    1744:	097dc603          	lbu	a2,151(s11) # ffff8097 <_stack_top+0xffeec2d7>
    1748:	0004                	.insn	2, 0x0004
    174a:	0501                	addi	a0,a0,0
    174c:	0329                	addi	t1,t1,10
    174e:	02ba                	slli	t0,t0,0xe
    1750:	0409                	addi	s0,s0,2
    1752:	0100                	addi	s0,sp,128
    1754:	097dc603          	lbu	a2,151(s11)
    1758:	0004                	.insn	2, 0x0004
    175a:	0501                	addi	a0,a0,0
    175c:	0605                	addi	a2,a2,1
    175e:	0901ec03          	.insn	4, 0x0901ec03
    1762:	0004                	.insn	2, 0x0004
    1764:	0501                	addi	a0,a0,0
    1766:	060c                	addi	a1,sp,768
    1768:	10090003          	lb	zero,256(s2)
    176c:	0100                	addi	s0,sp,128
    176e:	0505                	addi	a0,a0,1
    1770:	04090003          	lb	zero,64(s2)
    1774:	0100                	addi	s0,sp,128
    1776:	1605                	addi	a2,a2,-31
    1778:	04090003          	lb	zero,64(s2)
    177c:	0100                	addi	s0,sp,128
    177e:	097e9403          	lh	s0,151(t4)
    1782:	0008                	.insn	2, 0x0008
    1784:	0301                	addi	t1,t1,0
    1786:	01ec                	addi	a1,sp,204
    1788:	0809                	addi	a6,a6,2
    178a:	0100                	addi	s0,sp,128
    178c:	1905                	addi	s2,s2,-31
    178e:	0306                	slli	t1,t1,0x1
    1790:	00040903          	lb	s2,0(s0)
    1794:	0501                	addi	a0,a0,0
    1796:	0625                	addi	a2,a2,9
    1798:	04090003          	lb	zero,64(s2)
    179c:	0100                	addi	s0,sp,128
    179e:	0a05                	addi	s4,s4,1
    17a0:	0306                	slli	t1,t1,0x1
    17a2:	0901                	addi	s2,s2,0
    17a4:	000c                	.insn	2, 0x000c
    17a6:	0601                	addi	a2,a2,0
    17a8:	10090003          	lb	zero,256(s2)
    17ac:	0100                	addi	s0,sp,128
    17ae:	0905                	addi	s2,s2,1
    17b0:	08090003          	lb	zero,128(s2)
    17b4:	0100                	addi	s0,sp,128
    17b6:	0d05                	addi	s10,s10,1
    17b8:	0306                	slli	t1,t1,0x1
    17ba:	00c5                	addi	ra,ra,17
    17bc:	0409                	addi	s0,s0,2
    17be:	0100                	addi	s0,sp,128
    17c0:	0a05                	addi	s4,s4,1
    17c2:	097fbb03          	.insn	4, 0x097fbb03
    17c6:	000c                	.insn	2, 0x000c
    17c8:	0501                	addi	a0,a0,0
    17ca:	0609                	addi	a2,a2,2
    17cc:	08090003          	lb	zero,128(s2)
    17d0:	0100                	addi	s0,sp,128
    17d2:	0d05                	addi	s10,s10,1
    17d4:	0306                	slli	t1,t1,0x1
    17d6:	00cd                	addi	ra,ra,19
    17d8:	0409                	addi	s0,s0,2
    17da:	0100                	addi	s0,sp,128
    17dc:	0306                	slli	t1,t1,0x1
    17de:	08097dc3          	.insn	4, 0x08097dc3
    17e2:	0100                	addi	s0,sp,128
    17e4:	1605                	addi	a2,a2,-31
    17e6:	0306                	slli	t1,t1,0x1
    17e8:	01f5                	addi	gp,gp,29
    17ea:	2009                	jal	17ec <$d.2+0x18d>
    17ec:	0100                	addi	s0,sp,128
    17ee:	0005                	c.nop	1
    17f0:	0306                	slli	t1,t1,0x1
    17f2:	14097e8b          	.insn	4, 0x14097e8b
    17f6:	0100                	addi	s0,sp,128
    17f8:	0c05                	addi	s8,s8,1
    17fa:	0306                	slli	t1,t1,0x1
    17fc:	01f2                	slli	gp,gp,0x1c
    17fe:	0409                	addi	s0,s0,2
    1800:	0100                	addi	s0,sp,128
    1802:	0005                	c.nop	1
    1804:	0306                	slli	t1,t1,0x1
    1806:	7e8e                	.insn	2, 0x7e8e
    1808:	0409                	addi	s0,s0,2
    180a:	0100                	addi	s0,sp,128
    180c:	1005                	c.nop	-31
    180e:	0306                	slli	t1,t1,0x1
    1810:	01f9                	addi	gp,gp,30
    1812:	0409                	addi	s0,s0,2
    1814:	0100                	addi	s0,sp,128
    1816:	1605                	addi	a2,a2,-31
    1818:	0306                	slli	t1,t1,0x1
    181a:	0900                	addi	s0,sp,144
    181c:	0004                	.insn	2, 0x0004
    181e:	0501                	addi	a0,a0,0
    1820:	0605                	addi	a2,a2,1
    1822:	04097903          	.insn	4, 0x04097903
    1826:	0100                	addi	s0,sp,128
    1828:	1605                	addi	a2,a2,-31
    182a:	08090303          	lb	t1,128(s2)
    182e:	0100                	addi	s0,sp,128
    1830:	1b05                	addi	s6,s6,-31
    1832:	10090103          	lb	sp,256(s2)
    1836:	0100                	addi	s0,sp,128
    1838:	10090103          	lb	sp,256(s2)
    183c:	0100                	addi	s0,sp,128
    183e:	0306                	slli	t1,t1,0x1
    1840:	7e89                	lui	t4,0xfffe2
    1842:	1409                	addi	s0,s0,-30
    1844:	0100                	addi	s0,sp,128
    1846:	1605                	addi	a2,a2,-31
    1848:	0306                	slli	t1,t1,0x1
    184a:	01f5                	addi	gp,gp,29
    184c:	0c09                	addi	s8,s8,2
    184e:	0100                	addi	s0,sp,128
    1850:	0005                	c.nop	1
    1852:	0306                	slli	t1,t1,0x1
    1854:	14097e8b          	.insn	4, 0x14097e8b
    1858:	0100                	addi	s0,sp,128
    185a:	0c05                	addi	s8,s8,1
    185c:	0306                	slli	t1,t1,0x1
    185e:	01f2                	slli	gp,gp,0x1c
    1860:	0409                	addi	s0,s0,2
    1862:	0100                	addi	s0,sp,128
    1864:	0005                	c.nop	1
    1866:	0306                	slli	t1,t1,0x1
    1868:	7e8e                	.insn	2, 0x7e8e
    186a:	0409                	addi	s0,s0,2
    186c:	0100                	addi	s0,sp,128
    186e:	1005                	c.nop	-31
    1870:	0306                	slli	t1,t1,0x1
    1872:	01f9                	addi	gp,gp,30
    1874:	0409                	addi	s0,s0,2
    1876:	0100                	addi	s0,sp,128
    1878:	1605                	addi	a2,a2,-31
    187a:	0306                	slli	t1,t1,0x1
    187c:	0900                	addi	s0,sp,144
    187e:	0004                	.insn	2, 0x0004
    1880:	0501                	addi	a0,a0,0
    1882:	0605                	addi	a2,a2,1
    1884:	04097903          	.insn	4, 0x04097903
    1888:	0100                	addi	s0,sp,128
    188a:	1605                	addi	a2,a2,-31
    188c:	08090303          	lb	t1,128(s2)
    1890:	0100                	addi	s0,sp,128
    1892:	1b05                	addi	s6,s6,-31
    1894:	10090103          	lb	sp,256(s2)
    1898:	0100                	addi	s0,sp,128
    189a:	10090103          	lb	sp,256(s2)
    189e:	0100                	addi	s0,sp,128
    18a0:	0905                	addi	s2,s2,1
    18a2:	0900cc03          	lbu	s8,144(ra)
    18a6:	0010                	.insn	2, 0x0010
    18a8:	0601                	addi	a2,a2,0
    18aa:	097dbd03          	.insn	4, 0x097dbd03
    18ae:	0004                	.insn	2, 0x0004
    18b0:	0501                	addi	a0,a0,0
    18b2:	0610                	addi	a2,sp,768
    18b4:	0902c503          	lbu	a0,144(t0)
    18b8:	000c                	.insn	2, 0x000c
    18ba:	0501                	addi	a0,a0,0
    18bc:	0309                	addi	t1,t1,2
    18be:	0901                	addi	s2,s2,0
    18c0:	0004                	.insn	2, 0x0004
    18c2:	0601                	addi	a2,a2,0
    18c4:	097dba03          	.insn	4, 0x097dba03
    18c8:	0018                	.insn	2, 0x0018
    18ca:	0501                	addi	a0,a0,0
    18cc:	0605                	addi	a2,a2,1
    18ce:	0902cb03          	lbu	s6,144(t0)
    18d2:	0004                	.insn	2, 0x0004
    18d4:	0601                	addi	a2,a2,0
    18d6:	097db503          	.insn	4, 0x097db503
    18da:	000c                	.insn	2, 0x000c
    18dc:	0b01                	addi	s6,s6,0
    18de:	0902cb03          	lbu	s6,144(t0)
    18e2:	0008                	.insn	2, 0x0008
    18e4:	0901                	addi	s2,s2,0
    18e6:	000c                	.insn	2, 0x000c
    18e8:	0100                	addi	s0,sp,128
    18ea:	                	li	s10,0

000018eb <$d.10>:
    18eb:	034d                	addi	t1,t1,19
    18ed:	0000                	unimp
    18ef:	0004                	.insn	2, 0x0004
    18f1:	0042                	c.slli	zero,0x10
    18f3:	0000                	unimp
    18f5:	0101                	addi	sp,sp,0
    18f7:	fb01                	bnez	a4,1807 <$d.2+0x1a8>
    18f9:	0d0e                	slli	s10,s10,0x3
    18fb:	0100                	addi	s0,sp,128
    18fd:	0101                	addi	sp,sp,0
    18ff:	0001                	nop
    1901:	0000                	unimp
    1903:	0001                	nop
    1905:	0100                	addi	s0,sp,128
    1907:	2f2e                	.insn	2, 0x2f2e
    1909:	00637273          	.insn	4, 0x00637273
    190d:	7300                	.insn	2, 0x7300
    190f:	6364                	.insn	2, 0x6364
    1911:	7261                	lui	tp,0xffff8
    1913:	5f64                	lw	s1,124(a4)
    1915:	7061                	c.lui	zero,0xffff8
    1917:	2e69                	jal	1cb1 <$d.13+0x75>
    1919:	00010063          	beqz	sp,1919 <$d.10+0x2e>
    191d:	6300                	.insn	2, 0x6300
    191f:	6f6d6d6f          	jal	s10,d8015 <$d.7+0xd61cd>
    1923:	2e6e                	.insn	2, 0x2e6e
    1925:	0068                	addi	a0,sp,12
    1927:	0001                	nop
    1929:	6b00                	.insn	2, 0x6b00
    192b:	7265                	lui	tp,0xffff9
    192d:	656e                	.insn	2, 0x656e
    192f:	2e6c                	.insn	2, 0x2e6c
    1931:	0068                	addi	a0,sp,12
    1933:	0001                	nop
    1935:	0000                	unimp
    1937:	0c05                	addi	s8,s8,1
    1939:	000a                	c.slli	zero,0x2
    193b:	0205                	addi	tp,tp,1 # ffff9001 <_stack_top+0xffeed241>
    193d:	1698                	addi	a4,sp,864
    193f:	0010                	.insn	2, 0x0010
    1941:	0100d203          	lhu	tp,16(ra)
    1945:	0005                	c.nop	1
    1947:	08094003          	lbu	zero,128(s2)
    194b:	0100                	addi	s0,sp,128
    194d:	1405                	addi	s0,s0,-31
    194f:	030a                	slli	t1,t1,0x2
    1951:	0905                	addi	s2,s2,1
    1953:	0008                	.insn	2, 0x0008
    1955:	0501                	addi	a0,a0,0
    1957:	0305                	addi	t1,t1,1
    1959:	0975                	addi	s2,s2,29
    195b:	0008                	.insn	2, 0x0008
    195d:	0501                	addi	a0,a0,0
    195f:	0309                	addi	t1,t1,2
    1961:	0901                	addi	s2,s2,0
    1963:	0004                	.insn	2, 0x0004
    1965:	0501                	addi	a0,a0,0
    1967:	0305                	addi	t1,t1,1
    1969:	097f 0004 0601 7303 	.insn	10, 0x0409730306010004097f
    1971:	0409 
    1973:	0100                	addi	s0,sp,128
    1975:	0a05                	addi	s4,s4,1
    1977:	0306                	slli	t1,t1,0x1
    1979:	091c                	addi	a5,sp,144
    197b:	0004                	.insn	2, 0x0004
    197d:	0501                	addi	a0,a0,0
    197f:	0619                	addi	a2,a2,6
    1981:	04090003          	lb	zero,64(s2)
    1985:	0100                	addi	s0,sp,128
    1987:	0905                	addi	s2,s2,1
    1989:	04090003          	lb	zero,64(s2)
    198d:	0100                	addi	s0,sp,128
    198f:	04096403          	.insn	4, 0x04096403
    1993:	0100                	addi	s0,sp,128
    1995:	1805                	addi	a6,a6,-31
    1997:	0306                	slli	t1,t1,0x1
    1999:	091d                	addi	s2,s2,7
    199b:	0004                	.insn	2, 0x0004
    199d:	0601                	addi	a2,a2,0
    199f:	04096303          	.insn	4, 0x04096303
    19a3:	0100                	addi	s0,sp,128
    19a5:	0c05                	addi	s8,s8,1
    19a7:	0306                	slli	t1,t1,0x1
    19a9:	0921                	addi	s2,s2,8
    19ab:	0008                	.insn	2, 0x0008
    19ad:	0501                	addi	a0,a0,0
    19af:	0003061b          	.insn	4, 0x0003061b
    19b3:	0409                	addi	s0,s0,2
    19b5:	0100                	addi	s0,sp,128
    19b7:	0505                	addi	a0,a0,1
    19b9:	04090003          	lb	zero,64(s2)
    19bd:	0100                	addi	s0,sp,128
    19bf:	1705                	addi	a4,a4,-31
    19c1:	0306                	slli	t1,t1,0x1
    19c3:	0901                	addi	s2,s2,0
    19c5:	0004                	.insn	2, 0x0004
    19c7:	0501                	addi	a0,a0,0
    19c9:	060d                	addi	a2,a2,3
    19cb:	04090003          	lb	zero,64(s2)
    19cf:	0100                	addi	s0,sp,128
    19d1:	04095e03          	lhu	t3,64(s2)
    19d5:	0100                	addi	s0,sp,128
    19d7:	0105                	addi	sp,sp,1
    19d9:	0306                	slli	t1,t1,0x1
    19db:	00c1                	addi	ra,ra,16
    19dd:	0409                	addi	s0,s0,2
    19df:	0100                	addi	s0,sp,128
    19e1:	0306                	slli	t1,t1,0x1
    19e3:	04097fbf 05050100 	.insn	8, 0x0505010004097fbf
    19eb:	0306                	slli	t1,t1,0x1
    19ed:	090d                	addi	s2,s2,3
    19ef:	0004                	.insn	2, 0x0004
    19f1:	0501                	addi	a0,a0,0
    19f3:	0309                	addi	t1,t1,2
    19f5:	0901                	addi	s2,s2,0
    19f7:	0004                	.insn	2, 0x0004
    19f9:	0601                	addi	a2,a2,0
    19fb:	04097203          	.insn	4, 0x04097203
    19ff:	0100                	addi	s0,sp,128
    1a01:	1305                	addi	t1,t1,-31
    1a03:	0306                	slli	t1,t1,0x1
    1a05:	0929                	addi	s2,s2,10
    1a07:	0008                	.insn	2, 0x0008
    1a09:	0501                	addi	a0,a0,0
    1a0b:	0314                	addi	a3,sp,384
    1a0d:	0901                	addi	s2,s2,0
    1a0f:	0008                	.insn	2, 0x0008
    1a11:	0501                	addi	a0,a0,0
    1a13:	0305                	addi	t1,t1,1
    1a15:	00080963          	beqz	a6,1a27 <$d.10+0x13c>
    1a19:	0501                	addi	a0,a0,0
    1a1b:	0309                	addi	t1,t1,2
    1a1d:	0901                	addi	s2,s2,0
    1a1f:	0004                	.insn	2, 0x0004
    1a21:	0601                	addi	a2,a2,0
    1a23:	04097203          	.insn	4, 0x04097203
    1a27:	0100                	addi	s0,sp,128
    1a29:	0d05                	addi	s10,s10,1
    1a2b:	0306                	slli	t1,t1,0x1
    1a2d:	0930                	addi	a2,sp,152
    1a2f:	0010                	.insn	2, 0x0010
    1a31:	0501                	addi	a0,a0,0
    1a33:	061c                	addi	a5,sp,768
    1a35:	04090003          	lb	zero,64(s2)
    1a39:	0100                	addi	s0,sp,128
    1a3b:	1705                	addi	a4,a4,-31
    1a3d:	0306                	slli	t1,t1,0x1
    1a3f:	0901                	addi	s2,s2,0
    1a41:	0008                	.insn	2, 0x0008
    1a43:	0501                	addi	a0,a0,0
    1a45:	060d                	addi	a2,a2,3
    1a47:	04090003          	lb	zero,64(s2)
    1a4b:	0100                	addi	s0,sp,128
    1a4d:	04094f03          	lbu	t5,64(s2)
    1a51:	0100                	addi	s0,sp,128
    1a53:	0105                	addi	sp,sp,1
    1a55:	0306                	slli	t1,t1,0x1
    1a57:	00c1                	addi	ra,ra,16
    1a59:	0409                	addi	s0,s0,2
    1a5b:	0100                	addi	s0,sp,128
    1a5d:	0306                	slli	t1,t1,0x1
    1a5f:	04097fbf 09050100 	.insn	8, 0x0905010004097fbf
    1a67:	0306                	slli	t1,t1,0x1
    1a69:	090e                	slli	s2,s2,0x3
    1a6b:	0004                	.insn	2, 0x0004
    1a6d:	0601                	addi	a2,a2,0
    1a6f:	c8097203          	.insn	4, 0xc8097203
    1a73:	0100                	addi	s0,sp,128
    1a75:	1005                	c.nop	-31
    1a77:	0306                	slli	t1,t1,0x1
    1a79:	093a                	slli	s2,s2,0xe
    1a7b:	0014                	.insn	2, 0x0014
    1a7d:	0501                	addi	a0,a0,0
    1a7f:	061f 0003 0409      	.insn	6, 0x04090003061f
    1a85:	0100                	addi	s0,sp,128
    1a87:	1b05                	addi	s6,s6,-31
    1a89:	0306                	slli	t1,t1,0x1
    1a8b:	0901                	addi	s2,s2,0
    1a8d:	0008                	.insn	2, 0x0008
    1a8f:	0601                	addi	a2,a2,0
    1a91:	04094503          	lbu	a0,64(s2)
    1a95:	0100                	addi	s0,sp,128
    1a97:	2205                	jal	1bb7 <$d.4+0x13b>
    1a99:	0306                	slli	t1,t1,0x1
    1a9b:	093d                	addi	s2,s2,15
    1a9d:	0008                	.insn	2, 0x0008
    1a9f:	0501                	addi	a0,a0,0
    1aa1:	0609                	addi	a2,a2,2
    1aa3:	08090003          	lb	zero,128(s2)
    1aa7:	0100                	addi	s0,sp,128
    1aa9:	1f05                	addi	t5,t5,-31
    1aab:	0306                	slli	t1,t1,0x1
    1aad:	0004097b          	.insn	4, 0x0004097b
    1ab1:	0501                	addi	a0,a0,0
    1ab3:	0310                	addi	a2,sp,384
    1ab5:	0905                	addi	s2,s2,1
    1ab7:	0004                	.insn	2, 0x0004
    1ab9:	0501                	addi	a0,a0,0
    1abb:	0305                	addi	t1,t1,1
    1abd:	0004097b          	.insn	4, 0x0004097b
    1ac1:	0501                	addi	a0,a0,0
    1ac3:	0301                	addi	t1,t1,0
    1ac5:	0909                	addi	s2,s2,2
    1ac7:	0004                	.insn	2, 0x0004
    1ac9:	0601                	addi	a2,a2,0
    1acb:	097fbf03          	.insn	4, 0x097fbf03
    1acf:	0004                	.insn	2, 0x0004
    1ad1:	0301                	addi	t1,t1,0
    1ad3:	00c1                	addi	ra,ra,16
    1ad5:	0409                	addi	s0,s0,2
    1ad7:	0100                	addi	s0,sp,128
    1ad9:	0005                	c.nop	1
    1adb:	0306                	slli	t1,t1,0x1
    1add:	0918                	addi	a4,sp,144
    1adf:	0004                	.insn	2, 0x0004
    1ae1:	0501                	addi	a0,a0,0
    1ae3:	0a05                	addi	s4,s4,1
    1ae5:	38090603          	lb	a2,896(s2)
    1ae9:	0100                	addi	s0,sp,128
    1aeb:	0d05                	addi	s10,s10,1
    1aed:	20090303          	lb	t1,512(s2)
    1af1:	0100                	addi	s0,sp,128
    1af3:	3105                	jal	1713 <$d.2+0xb4>
    1af5:	10097d03          	.insn	4, 0x10097d03
    1af9:	0100                	addi	s0,sp,128
    1afb:	0505                	addi	a0,a0,1
    1afd:	0306                	slli	t1,t1,0x1
    1aff:	0900                	addi	s0,sp,144
    1b01:	0004                	.insn	2, 0x0004
    1b03:	0501                	addi	a0,a0,0
    1b05:	060d                	addi	a2,a2,3
    1b07:	04090203          	lb	tp,64(s2)
    1b0b:	0100                	addi	s0,sp,128
    1b0d:	0306                	slli	t1,t1,0x1
    1b0f:	0900                	addi	s0,sp,144
    1b11:	0010                	.insn	2, 0x0010
    1b13:	0501                	addi	a0,a0,0
    1b15:	0619                	addi	a2,a2,6
    1b17:	04090603          	lb	a2,64(s2)
    1b1b:	0100                	addi	s0,sp,128
    1b1d:	0306                	slli	t1,t1,0x1
    1b1f:	7f99                	lui	t6,0xfffe6
    1b21:	0409                	addi	s0,s0,2
    1b23:	0100                	addi	s0,sp,128
    1b25:	1005                	c.nop	-31
    1b27:	0306                	slli	t1,t1,0x1
    1b29:	00c8                	addi	a0,sp,68
    1b2b:	0809                	addi	a6,a6,2
    1b2d:	0100                	addi	s0,sp,128
    1b2f:	2105                	jal	1f4f <$d.7+0x107>
    1b31:	0306                	slli	t1,t1,0x1
    1b33:	0900                	addi	s0,sp,144
    1b35:	0004                	.insn	2, 0x0004
    1b37:	0501                	addi	a0,a0,0
    1b39:	030d                	addi	t1,t1,3
    1b3b:	0900                	addi	s0,sp,144
    1b3d:	0004                	.insn	2, 0x0004
    1b3f:	0501                	addi	a0,a0,0
    1b41:	02030613          	addi	a2,t1,32
    1b45:	0c09                	addi	s8,s8,2
    1b47:	0100                	addi	s0,sp,128
    1b49:	1705                	addi	a4,a4,-31
    1b4b:	b4097d03          	.insn	4, 0xb4097d03
    1b4f:	0100                	addi	s0,sp,128
    1b51:	1305                	addi	t1,t1,-31
    1b53:	04090303          	lb	t1,64(s2)
    1b57:	0100                	addi	s0,sp,128
    1b59:	0505                	addi	a0,a0,1
    1b5b:	04097d03          	.insn	4, 0x04097d03
    1b5f:	0100                	addi	s0,sp,128
    1b61:	3105                	jal	1781 <$d.2+0x122>
    1b63:	04092103          	lw	sp,64(s2)
    1b67:	0100                	addi	s0,sp,128
    1b69:	0d05                	addi	s10,s10,1
    1b6b:	04090603          	lb	a2,64(s2)
    1b6f:	0100                	addi	s0,sp,128
    1b71:	0306                	slli	t1,t1,0x1
    1b73:	0900                	addi	s0,sp,144
    1b75:	0008                	.insn	2, 0x0008
    1b77:	0601                	addi	a2,a2,0
    1b79:	04090503          	lb	a0,64(s2)
    1b7d:	0100                	addi	s0,sp,128
    1b7f:	3105                	jal	179f <$d.2+0x140>
    1b81:	10096c03          	.insn	4, 0x10096c03
    1b85:	0100                	addi	s0,sp,128
    1b87:	0505                	addi	a0,a0,1
    1b89:	0306                	slli	t1,t1,0x1
    1b8b:	0900                	addi	s0,sp,144
    1b8d:	0004                	.insn	2, 0x0004
    1b8f:	0501                	addi	a0,a0,0
    1b91:	0609                	addi	a2,a2,2
    1b93:	04091a03          	lh	s4,64(s2)
    1b97:	0100                	addi	s0,sp,128
    1b99:	0306                	slli	t1,t1,0x1
    1b9b:	10097f87          	.insn	4, 0x10097f87
    1b9f:	0100                	addi	s0,sp,128
    1ba1:	0d05                	addi	s10,s10,1
    1ba3:	0306                	slli	t1,t1,0x1
    1ba5:	040900ef          	jal	91be5 <$d.7+0x8fd9d>
    1ba9:	0100                	addi	s0,sp,128
    1bab:	0306                	slli	t1,t1,0x1
    1bad:	7f91                	lui	t6,0xfffe4
    1baf:	1409                	addi	s0,s0,-30
    1bb1:	0100                	addi	s0,sp,128
    1bb3:	1f05                	addi	t5,t5,-31
    1bb5:	0306                	slli	t1,t1,0x1
    1bb7:	00ff 1c09 0100 0505 	.insn	10, 0x0306050501001c0900ff
    1bbf:	0306 
    1bc1:	0900                	addi	s0,sp,144
    1bc3:	0004                	.insn	2, 0x0004
    1bc5:	0501                	addi	a0,a0,0
    1bc7:	0103061b          	.insn	4, 0x0103061b
    1bcb:	0409                	addi	s0,s0,2
    1bcd:	0100                	addi	s0,sp,128
    1bcf:	0306                	slli	t1,t1,0x1
    1bd1:	7f80                	.insn	2, 0x7f80
    1bd3:	0809                	addi	a6,a6,2
    1bd5:	0100                	addi	s0,sp,128
    1bd7:	1105                	addi	sp,sp,-31
    1bd9:	0306                	slli	t1,t1,0x1
    1bdb:	0181                	addi	gp,gp,0
    1bdd:	0409                	addi	s0,s0,2
    1bdf:	0100                	addi	s0,sp,128
    1be1:	0905                	addi	s2,s2,1
    1be3:	0306                	slli	t1,t1,0x1
    1be5:	0900                	addi	s0,sp,144
    1be7:	0008                	.insn	2, 0x0008
    1be9:	0501                	addi	a0,a0,0
    1beb:	01030617          	auipc	a2,0x1030
    1bef:	0809                	addi	a6,a6,2
    1bf1:	0100                	addi	s0,sp,128
    1bf3:	1105                	addi	sp,sp,-31
    1bf5:	0306                	slli	t1,t1,0x1
    1bf7:	0900                	addi	s0,sp,144
    1bf9:	0004                	.insn	2, 0x0004
    1bfb:	0501                	addi	a0,a0,0
    1bfd:	0309                	addi	t1,t1,2
    1bff:	0900                	addi	s0,sp,144
    1c01:	0008                	.insn	2, 0x0008
    1c03:	0601                	addi	a2,a2,0 # 1031beb <_stack_top+0xf25e2b>
    1c05:	08090103          	lb	sp,128(s2)
    1c09:	0100                	addi	s0,sp,128
    1c0b:	1005                	c.nop	-31
    1c0d:	0c090103          	lb	sp,192(s2)
    1c11:	0100                	addi	s0,sp,128
    1c13:	0d05                	addi	s10,s10,1
    1c15:	0306                	slli	t1,t1,0x1
    1c17:	0900                	addi	s0,sp,144
    1c19:	0004                	.insn	2, 0x0004
    1c1b:	0501                	addi	a0,a0,0
    1c1d:	031d                	addi	t1,t1,7
    1c1f:	0900                	addi	s0,sp,144
    1c21:	0004                	.insn	2, 0x0004
    1c23:	0301                	addi	t1,t1,0
    1c25:	7efc                	.insn	2, 0x7efc
    1c27:	0c09                	addi	s8,s8,2
    1c29:	0100                	addi	s0,sp,128
    1c2b:	0105                	addi	sp,sp,1
    1c2d:	0b06                	slli	s6,s6,0x1
    1c2f:	09018603          	lb	a2,144(gp)
    1c33:	0028                	addi	a0,sp,8
    1c35:	0901                	addi	s2,s2,0
    1c37:	0008                	.insn	2, 0x0008
    1c39:	0100                	addi	s0,sp,128
    1c3b:	                	c.lui	zero,0xfffe0

00001c3c <$d.13>:
    1c3c:	1270                	addi	a2,sp,300
    1c3e:	0000                	unimp
    1c40:	0004                	.insn	2, 0x0004
    1c42:	0078                	addi	a4,sp,12
    1c44:	0000                	unimp
    1c46:	0101                	addi	sp,sp,0
    1c48:	fb01                	bnez	a4,1b58 <$d.4+0xdc>
    1c4a:	0d0e                	slli	s10,s10,0x3
    1c4c:	0100                	addi	s0,sp,128
    1c4e:	0101                	addi	sp,sp,0
    1c50:	0001                	nop
    1c52:	0000                	unimp
    1c54:	0001                	nop
    1c56:	0100                	addi	s0,sp,128
    1c58:	2f2e                	.insn	2, 0x2f2e
    1c5a:	00637273          	.insn	4, 0x00637273
    1c5e:	7273752f          	.insn	4, 0x7273752f
    1c62:	62696c2f          	.insn	4, 0x62696c2f
    1c66:	766c6c2f          	.insn	4, 0x766c6c2f
    1c6a:	2d6d                	jal	2324 <$d.7+0x4dc>
    1c6c:	3831                	jal	1488 <$d.4+0x259>
    1c6e:	62696c2f          	.insn	4, 0x62696c2f
    1c72:	616c632f          	.insn	4, 0x616c632f
    1c76:	676e                	.insn	2, 0x676e
    1c78:	2f38312f          	.insn	4, 0x2f38312f
    1c7c:	6e69                	lui	t3,0x1a
    1c7e:	64756c63          	bltu	a0,t2,22d6 <$d.7+0x48e>
    1c82:	0065                	c.nop	25
    1c84:	6200                	.insn	2, 0x6200
    1c86:	5f746f6f          	jal	t5,48a7c <$d.7+0x46c34>
    1c8a:	6166                	.insn	2, 0x6166
    1c8c:	3374                	.insn	2, 0x3374
    1c8e:	2e32                	.insn	2, 0x2e32
    1c90:	00010063          	beqz	sp,1c90 <$d.13+0x54>
    1c94:	6300                	.insn	2, 0x6300
    1c96:	6f6d6d6f          	jal	s10,d838c <$d.7+0xd6544>
    1c9a:	2e6e                	.insn	2, 0x2e6e
    1c9c:	0068                	addi	a0,sp,12
    1c9e:	0001                	nop
    1ca0:	7300                	.insn	2, 0x7300
    1ca2:	6474                	.insn	2, 0x6474
    1ca4:	6e69                	lui	t3,0x1a
    1ca6:	2e74                	.insn	2, 0x2e74
    1ca8:	0068                	addi	a0,sp,12
    1caa:	0002                	c.slli64	zero
    1cac:	6200                	.insn	2, 0x6200
    1cae:	5f746f6f          	jal	t5,48aa4 <$d.7+0x46c5c>
    1cb2:	6166                	.insn	2, 0x6166
    1cb4:	3374                	.insn	2, 0x3374
    1cb6:	2e32                	.insn	2, 0x2e32
    1cb8:	0068                	addi	a0,sp,12
    1cba:	0001                	nop
    1cbc:	0000                	unimp
    1cbe:	0500                	addi	s0,sp,640
    1cc0:	c402                	sw	zero,8(sp)
    1cc2:	101a                	c.slli	zero,0x26
    1cc4:	0300                	addi	s0,sp,384
    1cc6:	00c2                	slli	ra,ra,0x10
    1cc8:	0501                	addi	a0,a0,0
    1cca:	06030a0b          	.insn	4, 0x06030a0b
    1cce:	0c09                	addi	s8,s8,2
    1cd0:	0100                	addi	s0,sp,128
    1cd2:	0306                	slli	t1,t1,0x1
    1cd4:	08097fb7          	lui	t6,0x8097
    1cd8:	0100                	addi	s0,sp,128
    1cda:	0905                	addi	s2,s2,1
    1cdc:	0306                	slli	t1,t1,0x1
    1cde:	040900cb          	.insn	4, 0x040900cb
    1ce2:	0100                	addi	s0,sp,128
    1ce4:	04090103          	lb	sp,64(s2)
    1ce8:	0100                	addi	s0,sp,128
    1cea:	0306                	slli	t1,t1,0x1
    1cec:	7fb4                	.insn	2, 0x7fb4
    1cee:	1009                	c.nop	-30
    1cf0:	0100                	addi	s0,sp,128
    1cf2:	1105                	addi	sp,sp,-31
    1cf4:	0306                	slli	t1,t1,0x1
    1cf6:	00d2                	slli	ra,ra,0x14
    1cf8:	0409                	addi	s0,s0,2
    1cfa:	0100                	addi	s0,sp,128
    1cfc:	0505                	addi	a0,a0,1
    1cfe:	04090403          	lb	s0,64(s2)
    1d02:	0100                	addi	s0,sp,128
    1d04:	0306                	slli	t1,t1,0x1
    1d06:	7faa                	.insn	2, 0x7faa
    1d08:	0409                	addi	s0,s0,2
    1d0a:	0100                	addi	s0,sp,128
    1d0c:	0900d603          	lhu	a2,144(ra)
    1d10:	0008                	.insn	2, 0x0008
    1d12:	0501                	addi	a0,a0,0
    1d14:	0601                	addi	a2,a2,0
    1d16:	0c090803          	lb	a6,192(s2)
    1d1a:	0100                	addi	s0,sp,128
    1d1c:	0b06                	slli	s6,s6,0x1
    1d1e:	0c090003          	lb	zero,192(s2)
    1d22:	0100                	addi	s0,sp,128
    1d24:	0005                	c.nop	1
    1d26:	0306                	slli	t1,t1,0x1
    1d28:	00080903          	lb	s2,0(a6)
    1d2c:	0501                	addi	a0,a0,0
    1d2e:	0a05                	addi	s4,s4,1
    1d30:	3c090803          	lb	a6,960(s2)
    1d34:	0100                	addi	s0,sp,128
    1d36:	1305                	addi	t1,t1,-31
    1d38:	10090203          	lb	tp,256(s2)
    1d3c:	0100                	addi	s0,sp,128
    1d3e:	0905                	addi	s2,s2,1
    1d40:	0c090203          	lb	tp,192(s2)
    1d44:	0100                	addi	s0,sp,128
    1d46:	0505                	addi	a0,a0,1
    1d48:	04090503          	lb	a0,64(s2)
    1d4c:	0100                	addi	s0,sp,128
    1d4e:	0905                	addi	s2,s2,1
    1d50:	10090203          	lb	tp,256(s2)
    1d54:	0100                	addi	s0,sp,128
    1d56:	0306                	slli	t1,t1,0x1
    1d58:	0900                	addi	s0,sp,144
    1d5a:	0018                	.insn	2, 0x0018
    1d5c:	0301                	addi	t1,t1,0
    1d5e:	7f8c                	.insn	2, 0x7f8c
    1d60:	0409                	addi	s0,s0,2
    1d62:	0100                	addi	s0,sp,128
    1d64:	0105                	addi	sp,sp,1
    1d66:	0306                	slli	t1,t1,0x1
    1d68:	01f6                	slli	gp,gp,0x1d
    1d6a:	1c09                	addi	s8,s8,-30
    1d6c:	0100                	addi	s0,sp,128
    1d6e:	0b06                	slli	s6,s6,0x1
    1d70:	38090003          	lb	zero,896(s2)
    1d74:	0100                	addi	s0,sp,128
    1d76:	0505                	addi	a0,a0,1
    1d78:	0306                	slli	t1,t1,0x1
    1d7a:	08097f83          	.insn	4, 0x08097f83
    1d7e:	0100                	addi	s0,sp,128
    1d80:	0905                	addi	s2,s2,1
    1d82:	097fb103          	.insn	4, 0x097fb103
    1d86:	0010                	.insn	2, 0x0010
    1d88:	0501                	addi	a0,a0,0
    1d8a:	0618                	addi	a4,sp,768
    1d8c:	10090003          	lb	zero,256(s2)
    1d90:	0100                	addi	s0,sp,128
    1d92:	04095603          	lhu	a2,64(s2)
    1d96:	0100                	addi	s0,sp,128
    1d98:	08092a03          	lw	s4,128(s2)
    1d9c:	0100                	addi	s0,sp,128
    1d9e:	1605                	addi	a2,a2,-31
    1da0:	0306                	slli	t1,t1,0x1
    1da2:	096a                	slli	s2,s2,0x1a
    1da4:	0004                	.insn	2, 0x0004
    1da6:	0501                	addi	a0,a0,0
    1da8:	030d                	addi	t1,t1,3
    1daa:	0901                	addi	s2,s2,0
    1dac:	0008                	.insn	2, 0x0008
    1dae:	0501                	addi	a0,a0,0
    1db0:	0316                	slli	t1,t1,0x5
    1db2:	097f 0004 0501 031c 	.insn	10, 0x0901031c05010004097f
    1dba:	0901 
    1dbc:	0004                	.insn	2, 0x0004
    1dbe:	0501                	addi	a0,a0,0
    1dc0:	097f031b          	.insn	4, 0x097f031b
    1dc4:	0004                	.insn	2, 0x0004
    1dc6:	0501                	addi	a0,a0,0
    1dc8:	0309                	addi	t1,t1,2
    1dca:	0919                	addi	s2,s2,6
    1dcc:	0010                	.insn	2, 0x0010
    1dce:	0601                	addi	a2,a2,0
    1dd0:	04095303          	lhu	t1,64(s2)
    1dd4:	0100                	addi	s0,sp,128
    1dd6:	04092d03          	lw	s10,64(s2)
    1dda:	0100                	addi	s0,sp,128
    1ddc:	1605                	addi	a2,a2,-31
    1dde:	0306                	slli	t1,t1,0x1
    1de0:	00040967          	jalr	s2,s0
    1de4:	0501                	addi	a0,a0,0
    1de6:	09010317          	auipc	t1,0x9010
    1dea:	000c                	.insn	2, 0x000c
    1dec:	0501                	addi	a0,a0,0
    1dee:	0316                	slli	t1,t1,0x5
    1df0:	091e                	slli	s2,s2,0x7
    1df2:	0004                	.insn	2, 0x0004
    1df4:	0501                	addi	a0,a0,0
    1df6:	0609                	addi	a2,a2,2
    1df8:	04090003          	lb	zero,64(s2)
    1dfc:	0100                	addi	s0,sp,128
    1dfe:	04094d03          	lbu	s10,64(s2)
    1e02:	0100                	addi	s0,sp,128
    1e04:	04093303          	.insn	4, 0x04093303
    1e08:	0100                	addi	s0,sp,128
    1e0a:	1705                	addi	a4,a4,-31
    1e0c:	0306                	slli	t1,t1,0x1
    1e0e:	00040967          	jalr	s2,s0
    1e12:	0301                	addi	t1,t1,0 # 9011de6 <_stack_top+0x8f06026>
    1e14:	0901                	addi	s2,s2,0
    1e16:	0008                	.insn	2, 0x0008
    1e18:	0301                	addi	t1,t1,0
    1e1a:	097f 0004 0301 0902 	.insn	10, 0x0004090203010004097f
    1e22:	0004 
    1e24:	0501                	addi	a0,a0,0
    1e26:	030d                	addi	t1,t1,3
    1e28:	0901                	addi	s2,s2,0
    1e2a:	0004                	.insn	2, 0x0004
    1e2c:	0501                	addi	a0,a0,0
    1e2e:	031c                	addi	a5,sp,384
    1e30:	097e                	slli	s2,s2,0x1f
    1e32:	0004                	.insn	2, 0x0004
    1e34:	0501                	addi	a0,a0,0
    1e36:	031d                	addi	t1,t1,7
    1e38:	097f 0004 0501 031c 	.insn	10, 0x0902031c05010004097f
    1e40:	0902 
    1e42:	0004                	.insn	2, 0x0004
    1e44:	0301                	addi	t1,t1,0
    1e46:	0901                	addi	s2,s2,0
    1e48:	0004                	.insn	2, 0x0004
    1e4a:	0501                	addi	a0,a0,0
    1e4c:	0322                	slli	t1,t1,0x8
    1e4e:	097e                	slli	s2,s2,0x1f
    1e50:	0004                	.insn	2, 0x0004
    1e52:	0501                	addi	a0,a0,0
    1e54:	09010323          	sb	a6,134(sp)
    1e58:	0004                	.insn	2, 0x0004
    1e5a:	0501                	addi	a0,a0,0
    1e5c:	0309                	addi	t1,t1,2
    1e5e:	091d                	addi	s2,s2,7
    1e60:	0004                	.insn	2, 0x0004
    1e62:	0501                	addi	a0,a0,0
    1e64:	09620317          	auipc	t1,0x9620
    1e68:	0004                	.insn	2, 0x0004
    1e6a:	0301                	addi	t1,t1,0 # 9621e64 <_stack_top+0x95160a4>
    1e6c:	097f 0004 0301 0902 	.insn	10, 0x0004090203010004097f
    1e74:	0004 
    1e76:	0501                	addi	a0,a0,0
    1e78:	030d                	addi	t1,t1,3
    1e7a:	0901                	addi	s2,s2,0
    1e7c:	0004                	.insn	2, 0x0004
    1e7e:	0501                	addi	a0,a0,0
    1e80:	031c                	addi	a5,sp,384
    1e82:	097e                	slli	s2,s2,0x1f
    1e84:	0004                	.insn	2, 0x0004
    1e86:	0501                	addi	a0,a0,0
    1e88:	031d                	addi	t1,t1,7
    1e8a:	097f 0004 0501 031c 	.insn	10, 0x0902031c05010004097f
    1e92:	0902 
    1e94:	0004                	.insn	2, 0x0004
    1e96:	0301                	addi	t1,t1,0
    1e98:	0901                	addi	s2,s2,0
    1e9a:	0004                	.insn	2, 0x0004
    1e9c:	0501                	addi	a0,a0,0
    1e9e:	0322                	slli	t1,t1,0x8
    1ea0:	097e                	slli	s2,s2,0x1f
    1ea2:	0004                	.insn	2, 0x0004
    1ea4:	0501                	addi	a0,a0,0
    1ea6:	09010323          	sb	a6,134(sp)
    1eaa:	0004                	.insn	2, 0x0004
    1eac:	0501                	addi	a0,a0,0
    1eae:	0309                	addi	t1,t1,2
    1eb0:	00df 0809 0100      	.insn	6, 0x0100080900df
    1eb6:	1705                	addi	a4,a4,-31
    1eb8:	097fa003          	lw	zero,151(t6) # 8097097 <_stack_top+0x7f8b2d7>
    1ebc:	0004                	.insn	2, 0x0004
    1ebe:	0301                	addi	t1,t1,0
    1ec0:	097f 0004 0301 0902 	.insn	10, 0x0004090203010004097f
    1ec8:	0004 
    1eca:	0501                	addi	a0,a0,0
    1ecc:	030d                	addi	t1,t1,3
    1ece:	0901                	addi	s2,s2,0
    1ed0:	0004                	.insn	2, 0x0004
    1ed2:	0501                	addi	a0,a0,0
    1ed4:	031c                	addi	a5,sp,384
    1ed6:	097e                	slli	s2,s2,0x1f
    1ed8:	0004                	.insn	2, 0x0004
    1eda:	0501                	addi	a0,a0,0
    1edc:	031d                	addi	t1,t1,7
    1ede:	097f 0004 0501 031c 	.insn	10, 0x0902031c05010004097f
    1ee6:	0902 
    1ee8:	0004                	.insn	2, 0x0004
    1eea:	0301                	addi	t1,t1,0
    1eec:	0901                	addi	s2,s2,0
    1eee:	0004                	.insn	2, 0x0004
    1ef0:	0501                	addi	a0,a0,0
    1ef2:	0322                	slli	t1,t1,0x8
    1ef4:	097e                	slli	s2,s2,0x1f
    1ef6:	0004                	.insn	2, 0x0004
    1ef8:	0501                	addi	a0,a0,0
    1efa:	09010323          	sb	a6,134(sp)
    1efe:	0004                	.insn	2, 0x0004
    1f00:	0501                	addi	a0,a0,0
    1f02:	0314                	addi	a3,sp,384
    1f04:	00e8                	addi	a0,sp,76
    1f06:	0409                	addi	s0,s0,2
    1f08:	0100                	addi	s0,sp,128
    1f0a:	0905                	addi	s2,s2,1
    1f0c:	08090203          	lb	tp,128(s2)
    1f10:	0100                	addi	s0,sp,128
    1f12:	0d05                	addi	s10,s10,1
    1f14:	10090203          	lb	tp,256(s2)
    1f18:	0100                	addi	s0,sp,128
    1f1a:	0306                	slli	t1,t1,0x1
    1f1c:	0900                	addi	s0,sp,144
    1f1e:	0004                	.insn	2, 0x0004
    1f20:	0501                	addi	a0,a0,0
    1f22:	0609                	addi	a2,a2,2
    1f24:	04090503          	lb	a0,64(s2)
    1f28:	0100                	addi	s0,sp,128
    1f2a:	0d05                	addi	s10,s10,1
    1f2c:	10090203          	lb	tp,256(s2)
    1f30:	0100                	addi	s0,sp,128
    1f32:	1b05                	addi	s6,s6,-31
    1f34:	0306                	slli	t1,t1,0x1
    1f36:	0900                	addi	s0,sp,144
    1f38:	0008                	.insn	2, 0x0008
    1f3a:	0501                	addi	a0,a0,0
    1f3c:	030d                	addi	t1,t1,3
    1f3e:	0900                	addi	s0,sp,144
    1f40:	0004                	.insn	2, 0x0004
    1f42:	0301                	addi	t1,t1,0
    1f44:	0900                	addi	s0,sp,144
    1f46:	000c                	.insn	2, 0x000c
    1f48:	0301                	addi	t1,t1,0
    1f4a:	7ef1                	lui	t4,0xffffc
    1f4c:	0409                	addi	s0,s0,2
    1f4e:	0100                	addi	s0,sp,128
    1f50:	0905                	addi	s2,s2,1
    1f52:	0306                	slli	t1,t1,0x1
    1f54:	0194                	addi	a3,sp,192
    1f56:	1809                	addi	a6,a6,-30
    1f58:	0100                	addi	s0,sp,128
    1f5a:	0e05                	addi	t3,t3,1 # 1a001 <$d.7+0x181b9>
    1f5c:	10090203          	lb	tp,256(s2)
    1f60:	0100                	addi	s0,sp,128
    1f62:	0d05                	addi	s10,s10,1
    1f64:	0306                	slli	t1,t1,0x1
    1f66:	0900                	addi	s0,sp,144
    1f68:	0008                	.insn	2, 0x0008
    1f6a:	0301                	addi	t1,t1,0
    1f6c:	7eea                	.insn	2, 0x7eea
    1f6e:	0409                	addi	s0,s0,2
    1f70:	0100                	addi	s0,sp,128
    1f72:	1405                	addi	s0,s0,-31
    1f74:	0306                	slli	t1,t1,0x1
    1f76:	00fc                	addi	a5,sp,76
    1f78:	1809                	addi	a6,a6,-30
    1f7a:	0100                	addi	s0,sp,128
    1f7c:	0005                	c.nop	1
    1f7e:	0306                	slli	t1,t1,0x1
    1f80:	7f84                	.insn	2, 0x7f84
    1f82:	1009                	c.nop	-30
    1f84:	0100                	addi	s0,sp,128
    1f86:	0505                	addi	a0,a0,1
    1f88:	0306                	slli	t1,t1,0x1
    1f8a:	019e                	slli	gp,gp,0x7
    1f8c:	0809                	addi	a6,a6,2
    1f8e:	0100                	addi	s0,sp,128
    1f90:	1605                	addi	a2,a2,-31
    1f92:	097ef603          	.insn	4, 0x097ef603
    1f96:	0010                	.insn	2, 0x0010
    1f98:	0501                	addi	a0,a0,0
    1f9a:	030d                	addi	t1,t1,3
    1f9c:	0901                	addi	s2,s2,0
    1f9e:	0008                	.insn	2, 0x0008
    1fa0:	0501                	addi	a0,a0,0
    1fa2:	0316                	slli	t1,t1,0x5
    1fa4:	097f 0004 0501 031c 	.insn	10, 0x0901031c05010004097f
    1fac:	0901 
    1fae:	0004                	.insn	2, 0x0004
    1fb0:	0501                	addi	a0,a0,0
    1fb2:	097f031b          	.insn	4, 0x097f031b
    1fb6:	0004                	.insn	2, 0x0004
    1fb8:	0601                	addi	a2,a2,0
    1fba:	04096c03          	.insn	4, 0x04096c03
    1fbe:	0100                	addi	s0,sp,128
    1fc0:	08091403          	lh	s0,128(s2)
    1fc4:	0100                	addi	s0,sp,128
    1fc6:	0505                	addi	a0,a0,1
    1fc8:	0306                	slli	t1,t1,0x1
    1fca:	018d                	addi	gp,gp,3
    1fcc:	0409                	addi	s0,s0,2
    1fce:	0100                	addi	s0,sp,128
    1fd0:	1d05                	addi	s10,s10,-31
    1fd2:	10090103          	lb	sp,256(s2)
    1fd6:	0100                	addi	s0,sp,128
    1fd8:	1b05                	addi	s6,s6,-31
    1fda:	0306                	slli	t1,t1,0x1
    1fdc:	0900                	addi	s0,sp,144
    1fde:	0004                	.insn	2, 0x0004
    1fe0:	0501                	addi	a0,a0,0
    1fe2:	0605                	addi	a2,a2,1
    1fe4:	08090203          	lb	tp,128(s2)
    1fe8:	0100                	addi	s0,sp,128
    1fea:	1605                	addi	a2,a2,-31
    1fec:	097ef003          	.insn	4, 0x097ef003
    1ff0:	0010                	.insn	2, 0x0010
    1ff2:	0501                	addi	a0,a0,0
    1ff4:	030d                	addi	t1,t1,3
    1ff6:	0901                	addi	s2,s2,0
    1ff8:	0004                	.insn	2, 0x0004
    1ffa:	0501                	addi	a0,a0,0
    1ffc:	0305                	addi	t1,t1,1
    1ffe:	0192                	slli	gp,gp,0x4
    2000:	0409                	addi	s0,s0,2
    2002:	0100                	addi	s0,sp,128
    2004:	1105                	addi	sp,sp,-31
    2006:	10090103          	lb	sp,256(s2)
    200a:	0100                	addi	s0,sp,128
    200c:	0505                	addi	a0,a0,1
    200e:	04090203          	lb	tp,64(s2)
    2012:	0100                	addi	s0,sp,128
    2014:	1705                	addi	a4,a4,-31
    2016:	097ef003          	.insn	4, 0x097ef003
    201a:	0010                	.insn	2, 0x0010
    201c:	0301                	addi	t1,t1,0
    201e:	0901                	addi	s2,s2,0
    2020:	0004                	.insn	2, 0x0004
    2022:	0301                	addi	t1,t1,0
    2024:	0901                	addi	s2,s2,0
    2026:	0004                	.insn	2, 0x0004
    2028:	0501                	addi	a0,a0,0
    202a:	030d                	addi	t1,t1,3
    202c:	0901                	addi	s2,s2,0
    202e:	0004                	.insn	2, 0x0004
    2030:	0501                	addi	a0,a0,0
    2032:	0305                	addi	t1,t1,1
    2034:	0190                	addi	a2,sp,192
    2036:	0409                	addi	s0,s0,2
    2038:	0100                	addi	s0,sp,128
    203a:	1705                	addi	a4,a4,-31
    203c:	097eee03          	.insn	4, 0x097eee03
    2040:	0010                	.insn	2, 0x0010
    2042:	0301                	addi	t1,t1,0
    2044:	097f 0004 0301 0902 	.insn	10, 0x0004090203010004097f
    204c:	0004 
    204e:	0501                	addi	a0,a0,0
    2050:	030d                	addi	t1,t1,3
    2052:	0901                	addi	s2,s2,0
    2054:	0004                	.insn	2, 0x0004
    2056:	0501                	addi	a0,a0,0
    2058:	031c                	addi	a5,sp,384
    205a:	097e                	slli	s2,s2,0x1f
    205c:	0004                	.insn	2, 0x0004
    205e:	0501                	addi	a0,a0,0
    2060:	031d                	addi	t1,t1,7
    2062:	097f 0004 0501 031c 	.insn	10, 0x0902031c05010004097f
    206a:	0902 
    206c:	0004                	.insn	2, 0x0004
    206e:	0301                	addi	t1,t1,0
    2070:	0901                	addi	s2,s2,0
    2072:	0004                	.insn	2, 0x0004
    2074:	0501                	addi	a0,a0,0
    2076:	0322                	slli	t1,t1,0x8
    2078:	097e                	slli	s2,s2,0x1f
    207a:	0004                	.insn	2, 0x0004
    207c:	0501                	addi	a0,a0,0
    207e:	09010323          	sb	a6,134(sp)
    2082:	0004                	.insn	2, 0x0004
    2084:	0501                	addi	a0,a0,0
    2086:	0314                	addi	a3,sp,384
    2088:	0192                	slli	gp,gp,0x4
    208a:	0409                	addi	s0,s0,2
    208c:	0100                	addi	s0,sp,128
    208e:	0505                	addi	a0,a0,1
    2090:	08090203          	lb	tp,128(s2)
    2094:	0100                	addi	s0,sp,128
    2096:	0306                	slli	t1,t1,0x1
    2098:	7ed0                	.insn	2, 0x7ed0
    209a:	1009                	c.nop	-30
    209c:	0100                	addi	s0,sp,128
    209e:	0905                	addi	s2,s2,1
    20a0:	0306                	slli	t1,t1,0x1
    20a2:	01b2                	slli	gp,gp,0xc
    20a4:	0409                	addi	s0,s0,2
    20a6:	0100                	addi	s0,sp,128
    20a8:	04090503          	lb	a0,64(s2)
    20ac:	0100                	addi	s0,sp,128
    20ae:	0306                	slli	t1,t1,0x1
    20b0:	0900                	addi	s0,sp,144
    20b2:	0004                	.insn	2, 0x0004
    20b4:	0301                	addi	t1,t1,0
    20b6:	7ec9                	lui	t4,0xffff2
    20b8:	0409                	addi	s0,s0,2
    20ba:	0100                	addi	s0,sp,128
    20bc:	0306                	slli	t1,t1,0x1
    20be:	01bc                	addi	a5,sp,200
    20c0:	0809                	addi	a6,a6,2
    20c2:	0100                	addi	s0,sp,128
    20c4:	1905                	addi	s2,s2,-31
    20c6:	08090503          	lb	a0,128(s2)
    20ca:	0100                	addi	s0,sp,128
    20cc:	0306                	slli	t1,t1,0x1
    20ce:	10097ebf 09050100 	.insn	8, 0x0905010010097ebf
    20d6:	0306                	slli	t1,t1,0x1
    20d8:	01c6                	slli	gp,gp,0x11
    20da:	4809                	li	a6,2
    20dc:	0100                	addi	s0,sp,128
    20de:	04090503          	lb	a0,64(s2)
    20e2:	0100                	addi	s0,sp,128
    20e4:	0306                	slli	t1,t1,0x1
    20e6:	0900                	addi	s0,sp,144
    20e8:	000c                	.insn	2, 0x000c
    20ea:	0301                	addi	t1,t1,0
    20ec:	7eb5                	lui	t4,0xfffed
    20ee:	0409                	addi	s0,s0,2
    20f0:	0100                	addi	s0,sp,128
    20f2:	0505                	addi	a0,a0,1
    20f4:	0306                	slli	t1,t1,0x1
    20f6:	01d0                	addi	a2,sp,196
    20f8:	1c09                	addi	s8,s8,-30
    20fa:	0100                	addi	s0,sp,128
    20fc:	0905                	addi	s2,s2,1
    20fe:	10090203          	lb	tp,256(s2)
    2102:	0100                	addi	s0,sp,128
    2104:	0306                	slli	t1,t1,0x1
    2106:	7eae                	.insn	2, 0x7eae
    2108:	0809                	addi	a6,a6,2
    210a:	0100                	addi	s0,sp,128
    210c:	0505                	addi	a0,a0,1
    210e:	0306                	slli	t1,t1,0x1
    2110:	1c0901d7          	.insn	4, 0x1c0901d7
    2114:	0100                	addi	s0,sp,128
    2116:	1705                	addi	a4,a4,-31
    2118:	10090203          	lb	tp,256(s2)
    211c:	0100                	addi	s0,sp,128
    211e:	2205                	jal	223e <$d.7+0x3f6>
    2120:	0306                	slli	t1,t1,0x1
    2122:	0900                	addi	s0,sp,144
    2124:	0008                	.insn	2, 0x0008
    2126:	0501                	addi	a0,a0,0
    2128:	0315                	addi	t1,t1,5
    212a:	0900                	addi	s0,sp,144
    212c:	0004                	.insn	2, 0x0004
    212e:	0501                	addi	a0,a0,0
    2130:	0605                	addi	a2,a2,1
    2132:	08090203          	lb	tp,128(s2)
    2136:	0100                	addi	s0,sp,128
    2138:	1805                	addi	a6,a6,-31
    213a:	10090203          	lb	tp,256(s2)
    213e:	0100                	addi	s0,sp,128
    2140:	1605                	addi	a2,a2,-31
    2142:	0306                	slli	t1,t1,0x1
    2144:	0900                	addi	s0,sp,144
    2146:	0004                	.insn	2, 0x0004
    2148:	0501                	addi	a0,a0,0
    214a:	0609                	addi	a2,a2,2
    214c:	08090303          	lb	t1,128(s2)
    2150:	0100                	addi	s0,sp,128
    2152:	1a05                	addi	s4,s4,-31
    2154:	10090103          	lb	sp,256(s2)
    2158:	0100                	addi	s0,sp,128
    215a:	0905                	addi	s2,s2,1
    215c:	14090303          	lb	t1,320(s2)
    2160:	0100                	addi	s0,sp,128
    2162:	0306                	slli	t1,t1,0x1
    2164:	7e9c                	.insn	2, 0x7e9c
    2166:	0409                	addi	s0,s0,2
    2168:	0100                	addi	s0,sp,128
    216a:	0306                	slli	t1,t1,0x1
    216c:	01e5                	addi	gp,gp,25
    216e:	0409                	addi	s0,s0,2
    2170:	0100                	addi	s0,sp,128
    2172:	1a05                	addi	s4,s4,-31
    2174:	10090103          	lb	sp,256(s2)
    2178:	0100                	addi	s0,sp,128
    217a:	0905                	addi	s2,s2,1
    217c:	10090303          	lb	t1,256(s2)
    2180:	0100                	addi	s0,sp,128
    2182:	0306                	slli	t1,t1,0x1
    2184:	04097e97          	auipc	t4,0x4097
    2188:	0100                	addi	s0,sp,128
    218a:	0306                	slli	t1,t1,0x1
    218c:	01ea                	slli	gp,gp,0x1a
    218e:	0c09                	addi	s8,s8,2
    2190:	0100                	addi	s0,sp,128
    2192:	1a05                	addi	s4,s4,-31
    2194:	10090103          	lb	sp,256(s2)
    2198:	0100                	addi	s0,sp,128
    219a:	0905                	addi	s2,s2,1
    219c:	1c090303          	lb	t1,448(s2)
    21a0:	0100                	addi	s0,sp,128
    21a2:	04090103          	lb	sp,64(s2)
    21a6:	0100                	addi	s0,sp,128
    21a8:	0306                	slli	t1,t1,0x1
    21aa:	7e91                	lui	t4,0xfffe4
    21ac:	1809                	addi	a6,a6,-30
    21ae:	0100                	addi	s0,sp,128
    21b0:	1a05                	addi	s4,s4,-31
    21b2:	0306                	slli	t1,t1,0x1
    21b4:	01f0                	addi	a2,sp,204
    21b6:	0409                	addi	s0,s0,2
    21b8:	0100                	addi	s0,sp,128
    21ba:	0306                	slli	t1,t1,0x1
    21bc:	7e90                	.insn	2, 0x7e90
    21be:	1409                	addi	s0,s0,-30
    21c0:	0100                	addi	s0,sp,128
    21c2:	0905                	addi	s2,s2,1
    21c4:	0a06                	slli	s4,s4,0x1
    21c6:	08092a03          	lw	s4,128(s2)
    21ca:	0100                	addi	s0,sp,128
    21cc:	1805                	addi	a6,a6,-31
    21ce:	0306                	slli	t1,t1,0x1
    21d0:	0900                	addi	s0,sp,144
    21d2:	0014                	.insn	2, 0x0014
    21d4:	0301                	addi	t1,t1,0
    21d6:	0956                	slli	s2,s2,0x15
    21d8:	0004                	.insn	2, 0x0004
    21da:	0301                	addi	t1,t1,0
    21dc:	092a                	slli	s2,s2,0xa
    21de:	0008                	.insn	2, 0x0008
    21e0:	0501                	addi	a0,a0,0
    21e2:	0616                	slli	a2,a2,0x5
    21e4:	04096a03          	.insn	4, 0x04096a03
    21e8:	0100                	addi	s0,sp,128
    21ea:	0d05                	addi	s10,s10,1
    21ec:	08090103          	lb	sp,128(s2)
    21f0:	0100                	addi	s0,sp,128
    21f2:	1605                	addi	a2,a2,-31
    21f4:	04097f03          	.insn	4, 0x04097f03
    21f8:	0100                	addi	s0,sp,128
    21fa:	1c05                	addi	s8,s8,-31
    21fc:	04090103          	lb	sp,64(s2)
    2200:	0100                	addi	s0,sp,128
    2202:	1b05                	addi	s6,s6,-31
    2204:	04097f03          	.insn	4, 0x04097f03
    2208:	0100                	addi	s0,sp,128
    220a:	0905                	addi	s2,s2,1
    220c:	14091903          	lh	s2,320(s2)
    2210:	0100                	addi	s0,sp,128
    2212:	0306                	slli	t1,t1,0x1
    2214:	00040953          	.insn	4, 0x00040953
    2218:	0301                	addi	t1,t1,0
    221a:	092d                	addi	s2,s2,11
    221c:	0004                	.insn	2, 0x0004
    221e:	0501                	addi	a0,a0,0
    2220:	0616                	slli	a2,a2,0x5
    2222:	04096703          	.insn	4, 0x04096703
    2226:	0100                	addi	s0,sp,128
    2228:	1705                	addi	a4,a4,-31
    222a:	0c090103          	lb	sp,192(s2)
    222e:	0100                	addi	s0,sp,128
    2230:	1605                	addi	a2,a2,-31
    2232:	04091e03          	lh	t3,64(s2)
    2236:	0100                	addi	s0,sp,128
    2238:	0905                	addi	s2,s2,1
    223a:	0306                	slli	t1,t1,0x1
    223c:	0900                	addi	s0,sp,144
    223e:	0008                	.insn	2, 0x0008
    2240:	0301                	addi	t1,t1,0
    2242:	094d                	addi	s2,s2,19
    2244:	0004                	.insn	2, 0x0004
    2246:	0301                	addi	t1,t1,0
    2248:	00040933          	add	s2,s0,zero
    224c:	0501                	addi	a0,a0,0
    224e:	67030617          	auipc	a2,0x67030
    2252:	0409                	addi	s0,s0,2
    2254:	0100                	addi	s0,sp,128
    2256:	08090103          	lb	sp,128(s2)
    225a:	0100                	addi	s0,sp,128
    225c:	04097f03          	.insn	4, 0x04097f03
    2260:	0100                	addi	s0,sp,128
    2262:	04090203          	lb	tp,64(s2)
    2266:	0100                	addi	s0,sp,128
    2268:	0d05                	addi	s10,s10,1
    226a:	04090103          	lb	sp,64(s2)
    226e:	0100                	addi	s0,sp,128
    2270:	1c05                	addi	s8,s8,-31
    2272:	04097e03          	.insn	4, 0x04097e03
    2276:	0100                	addi	s0,sp,128
    2278:	1d05                	addi	s10,s10,-31
    227a:	04097f03          	.insn	4, 0x04097f03
    227e:	0100                	addi	s0,sp,128
    2280:	1c05                	addi	s8,s8,-31
    2282:	04090203          	lb	tp,64(s2)
    2286:	0100                	addi	s0,sp,128
    2288:	04090103          	lb	sp,64(s2)
    228c:	0100                	addi	s0,sp,128
    228e:	2205                	jal	23ae <$d.7+0x566>
    2290:	04097e03          	.insn	4, 0x04097e03
    2294:	0100                	addi	s0,sp,128
    2296:	2305                	jal	27b6 <$d.7+0x96e>
    2298:	04090103          	lb	sp,64(s2)
    229c:	0100                	addi	s0,sp,128
    229e:	0905                	addi	s2,s2,1
    22a0:	04091d03          	lh	s10,64(s2)
    22a4:	0100                	addi	s0,sp,128
    22a6:	1705                	addi	a4,a4,-31
    22a8:	04096203          	.insn	4, 0x04096203
    22ac:	0100                	addi	s0,sp,128
    22ae:	04097f03          	.insn	4, 0x04097f03
    22b2:	0100                	addi	s0,sp,128
    22b4:	04090203          	lb	tp,64(s2)
    22b8:	0100                	addi	s0,sp,128
    22ba:	0d05                	addi	s10,s10,1
    22bc:	04090103          	lb	sp,64(s2)
    22c0:	0100                	addi	s0,sp,128
    22c2:	1c05                	addi	s8,s8,-31
    22c4:	04097e03          	.insn	4, 0x04097e03
    22c8:	0100                	addi	s0,sp,128
    22ca:	1d05                	addi	s10,s10,-31
    22cc:	04097f03          	.insn	4, 0x04097f03
    22d0:	0100                	addi	s0,sp,128
    22d2:	1c05                	addi	s8,s8,-31
    22d4:	04090203          	lb	tp,64(s2)
    22d8:	0100                	addi	s0,sp,128
    22da:	04090103          	lb	sp,64(s2)
    22de:	0100                	addi	s0,sp,128
    22e0:	2205                	jal	2400 <$d.7+0x5b8>
    22e2:	04097e03          	.insn	4, 0x04097e03
    22e6:	0100                	addi	s0,sp,128
    22e8:	2305                	jal	2808 <$d.7+0x9c0>
    22ea:	04090103          	lb	sp,64(s2)
    22ee:	0100                	addi	s0,sp,128
    22f0:	1605                	addi	a2,a2,-31 # 6703222f <_stack_top+0x66f2646f>
    22f2:	04092003          	lw	zero,64(s2)
    22f6:	0100                	addi	s0,sp,128
    22f8:	0105                	addi	sp,sp,1
    22fa:	08090403          	lb	s0,128(s2)
    22fe:	0100                	addi	s0,sp,128
    2300:	0306                	slli	t1,t1,0x1
    2302:	0940                	addi	s0,sp,148
    2304:	0004                	.insn	2, 0x0004
    2306:	0301                	addi	t1,t1,0
    2308:	00c0                	addi	s0,sp,68
    230a:	0409                	addi	s0,s0,2
    230c:	0100                	addi	s0,sp,128
    230e:	0005                	c.nop	1
    2310:	0306                	slli	t1,t1,0x1
    2312:	01b9                	addi	gp,gp,14
    2314:	0409                	addi	s0,s0,2
    2316:	0100                	addi	s0,sp,128
    2318:	0905                	addi	s2,s2,1
    231a:	030a                	slli	t1,t1,0x2
    231c:	0906                	slli	s2,s2,0x1
    231e:	0020                	addi	s0,sp,8
    2320:	0501                	addi	a0,a0,0
    2322:	097c031b          	.insn	4, 0x097c031b
    2326:	0004                	.insn	2, 0x0004
    2328:	0501                	addi	a0,a0,0
    232a:	0309                	addi	t1,t1,2
    232c:	00080907          	.insn	4, 0x00080907
    2330:	0501                	addi	a0,a0,0
    2332:	0600                	addi	s0,sp,768
    2334:	097dfe03          	.insn	4, 0x097dfe03
    2338:	0008                	.insn	2, 0x0008
    233a:	0501                	addi	a0,a0,0
    233c:	0639                	addi	a2,a2,14
    233e:	0901fb03          	.insn	4, 0x0901fb03
    2342:	0004                	.insn	2, 0x0004
    2344:	0501                	addi	a0,a0,0
    2346:	0003062b          	.insn	4, 0x0003062b
    234a:	0409                	addi	s0,s0,2
    234c:	0100                	addi	s0,sp,128
    234e:	0905                	addi	s2,s2,1
    2350:	0306                	slli	t1,t1,0x1
    2352:	00040907          	.insn	4, 0x00040907
    2356:	0601                	addi	a2,a2,0
    2358:	10090003          	lb	zero,256(s2)
    235c:	0100                	addi	s0,sp,128
    235e:	0005                	c.nop	1
    2360:	097dfe03          	.insn	4, 0x097dfe03
    2364:	0004                	.insn	2, 0x0004
    2366:	0501                	addi	a0,a0,0
    2368:	0612                	slli	a2,a2,0x4
    236a:	09028503          	lb	a0,144(t0)
    236e:	0004                	.insn	2, 0x0004
    2370:	0501                	addi	a0,a0,0
    2372:	7e960317          	auipc	t1,0x7e960
    2376:	0409                	addi	s0,s0,2
    2378:	0100                	addi	s0,sp,128
    237a:	04097f03          	.insn	4, 0x04097f03
    237e:	0100                	addi	s0,sp,128
    2380:	04090203          	lb	tp,64(s2)
    2384:	0100                	addi	s0,sp,128
    2386:	1c05                	addi	s8,s8,-31
    2388:	04097f03          	.insn	4, 0x04097f03
    238c:	0100                	addi	s0,sp,128
    238e:	0d05                	addi	s10,s10,1
    2390:	04090203          	lb	tp,64(s2)
    2394:	0100                	addi	s0,sp,128
    2396:	1d05                	addi	s10,s10,-31
    2398:	04097d03          	.insn	4, 0x04097d03
    239c:	0100                	addi	s0,sp,128
    239e:	1c05                	addi	s8,s8,-31
    23a0:	04090203          	lb	tp,64(s2)
    23a4:	0100                	addi	s0,sp,128
    23a6:	2205                	jal	24c6 <$d.7+0x67e>
    23a8:	04097f03          	.insn	4, 0x04097f03
    23ac:	0100                	addi	s0,sp,128
    23ae:	0a05                	addi	s4,s4,1
    23b0:	0901eb03          	.insn	4, 0x0901eb03
    23b4:	0004                	.insn	2, 0x0004
    23b6:	0501                	addi	a0,a0,0
    23b8:	0301                	addi	t1,t1,0 # 7e962372 <_stack_top+0x7e8565b2>
    23ba:	000c0903          	lb	s2,0(s8)
    23be:	0601                	addi	a2,a2,0
    23c0:	0900030b          	.insn	4, 0x0900030b
    23c4:	0014                	.insn	2, 0x0014
    23c6:	0501                	addi	a0,a0,0
    23c8:	0600                	addi	s0,sp,768
    23ca:	08090703          	lb	a4,128(s2)
    23ce:	0100                	addi	s0,sp,128
    23d0:	0505                	addi	a0,a0,1
    23d2:	030a                	slli	t1,t1,0x2
    23d4:	0904                	addi	s1,sp,144
    23d6:	0044                	addi	s1,sp,4
    23d8:	0601                	addi	a2,a2,0
    23da:	097dec03          	.insn	4, 0x097dec03
    23de:	0010                	.insn	2, 0x0010
    23e0:	0501                	addi	a0,a0,0
    23e2:	97030613          	addi	a2,t1,-1680
    23e6:	0902                	c.slli64	s2
    23e8:	0004                	.insn	2, 0x0004
    23ea:	0501                	addi	a0,a0,0
    23ec:	0310                	addi	a2,sp,384
    23ee:	0906                	slli	s2,s2,0x1
    23f0:	001c                	.insn	2, 0x001c
    23f2:	0501                	addi	a0,a0,0
    23f4:	097a0313          	addi	t1,s4,151
    23f8:	0004                	.insn	2, 0x0004
    23fa:	0501                	addi	a0,a0,0
    23fc:	0320                	addi	s0,sp,392
    23fe:	0906                	slli	s2,s2,0x1
    2400:	0010                	.insn	2, 0x0010
    2402:	0601                	addi	a2,a2,0
    2404:	097de303          	.insn	4, 0x097de303
    2408:	0004                	.insn	2, 0x0004
    240a:	0501                	addi	a0,a0,0
    240c:	0309                	addi	t1,t1,2
    240e:	029d                	addi	t0,t0,7
    2410:	0409                	addi	s0,s0,2
    2412:	0100                	addi	s0,sp,128
    2414:	2b05                	jal	2944 <$d.7+0xafc>
    2416:	10090003          	lb	zero,256(s2)
    241a:	0100                	addi	s0,sp,128
    241c:	3205                	jal	1d3c <$d.13+0x100>
    241e:	04090003          	lb	zero,64(s2)
    2422:	0100                	addi	s0,sp,128
    2424:	1205                	addi	tp,tp,-31 # ffffffe1 <_stack_top+0xffef4221>
    2426:	0306                	slli	t1,t1,0x1
    2428:	7e85                	lui	t4,0xfffe1
    242a:	0809                	addi	a6,a6,2
    242c:	0100                	addi	s0,sp,128
    242e:	1005                	c.nop	-31
    2430:	0901fb03          	.insn	4, 0x0901fb03
    2434:	0018                	.insn	2, 0x0018
    2436:	0501                	addi	a0,a0,0
    2438:	030e                	slli	t1,t1,0x3
    243a:	0902                	c.slli64	s2
    243c:	0008                	.insn	2, 0x0008
    243e:	0501                	addi	a0,a0,0
    2440:	0319                	addi	t1,t1,6
    2442:	097f 0004 0601 e203 	.insn	10, 0x097de20306010004097f
    244a:	097d 
    244c:	0008                	.insn	2, 0x0008
    244e:	0501                	addi	a0,a0,0
    2450:	0620                	addi	s0,sp,776
    2452:	09029d03          	lh	s10,144(t0)
    2456:	0004                	.insn	2, 0x0004
    2458:	0601                	addi	a2,a2,0
    245a:	097de303          	.insn	4, 0x097de303
    245e:	0008                	.insn	2, 0x0008
    2460:	0501                	addi	a0,a0,0
    2462:	0615                	addi	a2,a2,5
    2464:	0902a203          	lw	tp,144(t0)
    2468:	000c                	.insn	2, 0x000c
    246a:	0501                	addi	a0,a0,0
    246c:	0310                	addi	a2,sp,384
    246e:	0905                	addi	s2,s2,1
    2470:	0010                	.insn	2, 0x0010
    2472:	0501                	addi	a0,a0,0
    2474:	0609                	addi	a2,a2,2
    2476:	08090003          	lb	zero,128(s2)
    247a:	0100                	addi	s0,sp,128
    247c:	1205                	addi	tp,tp,-31 # ffffffe1 <_stack_top+0xffef4221>
    247e:	0306                	slli	t1,t1,0x1
    2480:	14097dfb          	.insn	4, 0x14097dfb
    2484:	0100                	addi	s0,sp,128
    2486:	1005                	c.nop	-31
    2488:	09028503          	lb	a0,144(t0)
    248c:	0018                	.insn	2, 0x0018
    248e:	0501                	addi	a0,a0,0
    2490:	0319                	addi	t1,t1,6
    2492:	0901                	addi	s2,s2,0
    2494:	0008                	.insn	2, 0x0008
    2496:	0501                	addi	a0,a0,0
    2498:	0309                	addi	t1,t1,2
    249a:	097f 0008 0501 0600 	.insn	10, 0xd903060005010008097f
    24a2:	d903 
    24a4:	097d                	addi	s2,s2,31
    24a6:	0004                	.insn	2, 0x0004
    24a8:	0501                	addi	a0,a0,0
    24aa:	0309                	addi	t1,t1,2
    24ac:	040902a7          	.insn	4, 0x040902a7
    24b0:	0100                	addi	s0,sp,128
    24b2:	1305                	addi	t1,t1,-31
    24b4:	0306                	slli	t1,t1,0x1
    24b6:	0906                	slli	s2,s2,0x1
    24b8:	0008                	.insn	2, 0x0008
    24ba:	0501                	addi	a0,a0,0
    24bc:	0305                	addi	t1,t1,1
    24be:	0902                	c.slli64	s2
    24c0:	0008                	.insn	2, 0x0008
    24c2:	0501                	addi	a0,a0,0
    24c4:	031e                	slli	t1,t1,0x7
    24c6:	0902                	c.slli64	s2
    24c8:	0010                	.insn	2, 0x0010
    24ca:	0601                	addi	a2,a2,0
    24cc:	097dcf03          	lbu	t5,151(s11)
    24d0:	0010                	.insn	2, 0x0010
    24d2:	0501                	addi	a0,a0,0
    24d4:	0609                	addi	a2,a2,2
    24d6:	0902b703          	.insn	4, 0x0902b703
    24da:	009c                	addi	a5,sp,64
    24dc:	0601                	addi	a2,a2,0
    24de:	097dc903          	lbu	s2,151(s11)
    24e2:	000c                	.insn	2, 0x000c
    24e4:	0501                	addi	a0,a0,0
    24e6:	ba030613          	addi	a2,t1,-1120
    24ea:	0902                	c.slli64	s2
    24ec:	0004                	.insn	2, 0x0004
    24ee:	0601                	addi	a2,a2,0
    24f0:	097dc603          	lbu	a2,151(s11)
    24f4:	0004                	.insn	2, 0x0004
    24f6:	0501                	addi	a0,a0,0
    24f8:	0609                	addi	a2,a2,2
    24fa:	0902bc03          	.insn	4, 0x0902bc03
    24fe:	0004                	.insn	2, 0x0004
    2500:	0501                	addi	a0,a0,0
    2502:	0322                	slli	t1,t1,0x8
    2504:	0902                	c.slli64	s2
    2506:	0008                	.insn	2, 0x0008
    2508:	0501                	addi	a0,a0,0
    250a:	0609                	addi	a2,a2,2
    250c:	04090003          	lb	zero,64(s2)
    2510:	0100                	addi	s0,sp,128
    2512:	097dc203          	lbu	tp,151(s11)
    2516:	0004                	.insn	2, 0x0004
    2518:	0501                	addi	a0,a0,0
    251a:	0322                	slli	t1,t1,0x8
    251c:	02be                	slli	t0,t0,0xf
    251e:	0c09                	addi	s8,s8,2
    2520:	0100                	addi	s0,sp,128
    2522:	3a05                	jal	1e52 <$d.7+0xa>
    2524:	04090003          	lb	zero,64(s2)
    2528:	0100                	addi	s0,sp,128
    252a:	097dc203          	lbu	tp,151(s11)
    252e:	0004                	.insn	2, 0x0004
    2530:	0501                	addi	a0,a0,0
    2532:	0309                	addi	t1,t1,2
    2534:	02be                	slli	t0,t0,0xf
    2536:	0409                	addi	s0,s0,2
    2538:	0100                	addi	s0,sp,128
    253a:	1105                	addi	sp,sp,-31
    253c:	0306                	slli	t1,t1,0x1
    253e:	0904                	addi	s1,sp,144
    2540:	0004                	.insn	2, 0x0004
    2542:	0501                	addi	a0,a0,0
    2544:	00030627          	.insn	4, 0x00030627
    2548:	0409                	addi	s0,s0,2
    254a:	0100                	addi	s0,sp,128
    254c:	1105                	addi	sp,sp,-31
    254e:	04090003          	lb	zero,64(s2)
    2552:	0100                	addi	s0,sp,128
    2554:	08090003          	lb	zero,128(s2)
    2558:	0100                	addi	s0,sp,128
    255a:	0d05                	addi	s10,s10,1
    255c:	0306                	slli	t1,t1,0x1
    255e:	0905                	addi	s2,s2,1
    2560:	0004                	.insn	2, 0x0004
    2562:	0601                	addi	a2,a2,0
    2564:	097db903          	.insn	4, 0x097db903
    2568:	000c                	.insn	2, 0x000c
    256a:	0501                	addi	a0,a0,0
    256c:	061f cb03 0902      	.insn	6, 0x0902cb03061f
    2572:	000c                	.insn	2, 0x000c
    2574:	0501                	addi	a0,a0,0
    2576:	0600                	addi	s0,sp,768
    2578:	097db503          	.insn	4, 0x097db503
    257c:	0004                	.insn	2, 0x0004
    257e:	0501                	addi	a0,a0,0
    2580:	030d                	addi	t1,t1,3
    2582:	040902cb          	.insn	4, 0x040902cb
    2586:	0100                	addi	s0,sp,128
    2588:	1505                	addi	a0,a0,-31
    258a:	0306                	slli	t1,t1,0x1
    258c:	0904                	addi	s1,sp,144
    258e:	0004                	.insn	2, 0x0004
    2590:	0601                	addi	a2,a2,0
    2592:	04090003          	lb	zero,64(s2)
    2596:	0100                	addi	s0,sp,128
    2598:	1805                	addi	a6,a6,-31
    259a:	0306                	slli	t1,t1,0x1
    259c:	090a                	slli	s2,s2,0x2
    259e:	0008                	.insn	2, 0x0008
    25a0:	0501                	addi	a0,a0,0
    25a2:	0315                	addi	t1,t1,5
    25a4:	0902                	c.slli64	s2
    25a6:	0004                	.insn	2, 0x0004
    25a8:	0501                	addi	a0,a0,0
    25aa:	0311                	addi	t1,t1,4
    25ac:	0008090f          	.insn	4, 0x0008090f
    25b0:	0501                	addi	a0,a0,0
    25b2:	031f 0905 000c      	.insn	6, 0x000c0905031f
    25b8:	0501                	addi	a0,a0,0
    25ba:	0619                	addi	a2,a2,6
    25bc:	04090003          	lb	zero,64(s2)
    25c0:	0100                	addi	s0,sp,128
    25c2:	1f05                	addi	t5,t5,-31
    25c4:	04090003          	lb	zero,64(s2)
    25c8:	0100                	addi	s0,sp,128
    25ca:	1905                	addi	s2,s2,-31
    25cc:	04090003          	lb	zero,64(s2)
    25d0:	0100                	addi	s0,sp,128
    25d2:	1f05                	addi	t5,t5,-31
    25d4:	04090003          	lb	zero,64(s2)
    25d8:	0100                	addi	s0,sp,128
    25da:	1905                	addi	s2,s2,-31
    25dc:	04090003          	lb	zero,64(s2)
    25e0:	0100                	addi	s0,sp,128
    25e2:	1f05                	addi	t5,t5,-31
    25e4:	04090003          	lb	zero,64(s2)
    25e8:	0100                	addi	s0,sp,128
    25ea:	097d9103          	lh	sp,151(s11)
    25ee:	0004                	.insn	2, 0x0004
    25f0:	0501                	addi	a0,a0,0
    25f2:	0319                	addi	t1,t1,6
    25f4:	040902ef          	jal	t0,92634 <$d.7+0x907ec>
    25f8:	0100                	addi	s0,sp,128
    25fa:	1f05                	addi	t5,t5,-31
    25fc:	04090003          	lb	zero,64(s2)
    2600:	0100                	addi	s0,sp,128
    2602:	097d9103          	lh	sp,151(s11)
    2606:	0004                	.insn	2, 0x0004
    2608:	0501                	addi	a0,a0,0
    260a:	0319                	addi	t1,t1,6
    260c:	040902ef          	jal	t0,9264c <$d.7+0x90804>
    2610:	0100                	addi	s0,sp,128
    2612:	1f05                	addi	t5,t5,-31
    2614:	04090003          	lb	zero,64(s2)
    2618:	0100                	addi	s0,sp,128
    261a:	097d9103          	lh	sp,151(s11)
    261e:	0004                	.insn	2, 0x0004
    2620:	0501                	addi	a0,a0,0
    2622:	0319                	addi	t1,t1,6
    2624:	040902ef          	jal	t0,92664 <$d.7+0x9081c>
    2628:	0100                	addi	s0,sp,128
    262a:	1f05                	addi	t5,t5,-31
    262c:	04090003          	lb	zero,64(s2)
    2630:	0100                	addi	s0,sp,128
    2632:	097d9103          	lh	sp,151(s11)
    2636:	0004                	.insn	2, 0x0004
    2638:	0501                	addi	a0,a0,0
    263a:	0319                	addi	t1,t1,6
    263c:	040902ef          	jal	t0,9267c <$d.7+0x90834>
    2640:	0100                	addi	s0,sp,128
    2642:	1f05                	addi	t5,t5,-31
    2644:	04090003          	lb	zero,64(s2)
    2648:	0100                	addi	s0,sp,128
    264a:	097d9103          	lh	sp,151(s11)
    264e:	0004                	.insn	2, 0x0004
    2650:	0501                	addi	a0,a0,0
    2652:	0319                	addi	t1,t1,6
    2654:	040902ef          	jal	t0,92694 <$d.7+0x9084c>
    2658:	0100                	addi	s0,sp,128
    265a:	1f05                	addi	t5,t5,-31
    265c:	04090003          	lb	zero,64(s2)
    2660:	0100                	addi	s0,sp,128
    2662:	097d9103          	lh	sp,151(s11)
    2666:	0004                	.insn	2, 0x0004
    2668:	0501                	addi	a0,a0,0
    266a:	0319                	addi	t1,t1,6
    266c:	040902ef          	jal	t0,926ac <$d.7+0x90864>
    2670:	0100                	addi	s0,sp,128
    2672:	1f05                	addi	t5,t5,-31
    2674:	04090003          	lb	zero,64(s2)
    2678:	0100                	addi	s0,sp,128
    267a:	097d9103          	lh	sp,151(s11)
    267e:	0004                	.insn	2, 0x0004
    2680:	0501                	addi	a0,a0,0
    2682:	0319                	addi	t1,t1,6
    2684:	040902ef          	jal	t0,926c4 <$d.7+0x9087c>
    2688:	0100                	addi	s0,sp,128
    268a:	1f05                	addi	t5,t5,-31
    268c:	04090003          	lb	zero,64(s2)
    2690:	0100                	addi	s0,sp,128
    2692:	097d9103          	lh	sp,151(s11)
    2696:	0004                	.insn	2, 0x0004
    2698:	0501                	addi	a0,a0,0
    269a:	0319                	addi	t1,t1,6
    269c:	040902ef          	jal	t0,926dc <$d.7+0x90894>
    26a0:	0100                	addi	s0,sp,128
    26a2:	097d9103          	lh	sp,151(s11)
    26a6:	0008                	.insn	2, 0x0008
    26a8:	0501                	addi	a0,a0,0
    26aa:	0609                	addi	a2,a2,2
    26ac:	09038803          	lb	a6,144(t2)
    26b0:	0004                	.insn	2, 0x0004
    26b2:	0601                	addi	a2,a2,0
    26b4:	097cf803          	.insn	4, 0x097cf803
    26b8:	0008                	.insn	2, 0x0008
    26ba:	0601                	addi	a2,a2,0
    26bc:	0901ff03          	.insn	4, 0x0901ff03
    26c0:	0004                	.insn	2, 0x0004
    26c2:	0501                	addi	a0,a0,0
    26c4:	097c031b          	.insn	4, 0x097c031b
    26c8:	0008                	.insn	2, 0x0008
    26ca:	0501                	addi	a0,a0,0
    26cc:	0309                	addi	t1,t1,2
    26ce:	00080907          	.insn	4, 0x00080907
    26d2:	0501                	addi	a0,a0,0
    26d4:	0339                	addi	t1,t1,14
    26d6:	0979                	addi	s2,s2,30
    26d8:	0004                	.insn	2, 0x0004
    26da:	0501                	addi	a0,a0,0
    26dc:	0003062b          	.insn	4, 0x0003062b
    26e0:	0409                	addi	s0,s0,2
    26e2:	0100                	addi	s0,sp,128
    26e4:	0905                	addi	s2,s2,1
    26e6:	0306                	slli	t1,t1,0x1
    26e8:	00040907          	.insn	4, 0x00040907
    26ec:	0601                	addi	a2,a2,0
    26ee:	08090003          	lb	zero,128(s2)
    26f2:	0100                	addi	s0,sp,128
    26f4:	0005                	c.nop	1
    26f6:	097dfe03          	.insn	4, 0x097dfe03
    26fa:	0004                	.insn	2, 0x0004
    26fc:	0501                	addi	a0,a0,0
    26fe:	0612                	slli	a2,a2,0x4
    2700:	09028503          	lb	a0,144(t0)
    2704:	0008                	.insn	2, 0x0008
    2706:	0501                	addi	a0,a0,0
    2708:	7e960317          	auipc	t1,0x7e960
    270c:	0409                	addi	s0,s0,2
    270e:	0100                	addi	s0,sp,128
    2710:	04097f03          	.insn	4, 0x04097f03
    2714:	0100                	addi	s0,sp,128
    2716:	04090203          	lb	tp,64(s2)
    271a:	0100                	addi	s0,sp,128
    271c:	1c05                	addi	s8,s8,-31
    271e:	04097f03          	.insn	4, 0x04097f03
    2722:	0100                	addi	s0,sp,128
    2724:	0d05                	addi	s10,s10,1
    2726:	04090203          	lb	tp,64(s2)
    272a:	0100                	addi	s0,sp,128
    272c:	1d05                	addi	s10,s10,-31
    272e:	04097d03          	.insn	4, 0x04097d03
    2732:	0100                	addi	s0,sp,128
    2734:	1c05                	addi	s8,s8,-31
    2736:	04090203          	lb	tp,64(s2)
    273a:	0100                	addi	s0,sp,128
    273c:	2205                	jal	285c <$d.7+0xa14>
    273e:	04097f03          	.insn	4, 0x04097f03
    2742:	0100                	addi	s0,sp,128
    2744:	0a05                	addi	s4,s4,1
    2746:	0901eb03          	.insn	4, 0x0901eb03
    274a:	0004                	.insn	2, 0x0004
    274c:	0501                	addi	a0,a0,0
    274e:	031e                	slli	t1,t1,0x7
    2750:	000c092b          	.insn	4, 0x000c092b
    2754:	0501                	addi	a0,a0,0
    2756:	0305                	addi	t1,t1,1 # 7e962709 <_stack_top+0x7e856949>
    2758:	00dc                	addi	a5,sp,68
    275a:	0c09                	addi	s8,s8,2
    275c:	0100                	addi	s0,sp,128
    275e:	1505                	addi	a0,a0,-31
    2760:	0c094303          	lbu	t1,192(s2)
    2764:	0100                	addi	s0,sp,128
    2766:	0005                	c.nop	1
    2768:	0306                	slli	t1,t1,0x1
    276a:	7db0                	.insn	2, 0x7db0
    276c:	0809                	addi	a6,a6,2
    276e:	0100                	addi	s0,sp,128
    2770:	0105                	addi	sp,sp,1
    2772:	0b06                	slli	s6,s6,0x1
    2774:	09039003          	lh	zero,144(t2)
    2778:	0040                	addi	s0,sp,4
    277a:	0501                	addi	a0,a0,0
    277c:	0311                	addi	t1,t1,4
    277e:	08097fb3          	.insn	4, 0x08097fb3
    2782:	0100                	addi	s0,sp,128
    2784:	1505                	addi	a0,a0,-31
    2786:	0c093603          	.insn	4, 0x0c093603
    278a:	0100                	addi	s0,sp,128
    278c:	0306                	slli	t1,t1,0x1
    278e:	10097d87          	.insn	4, 0x10097d87
    2792:	0100                	addi	s0,sp,128
    2794:	0d05                	addi	s10,s10,1
    2796:	0306                	slli	t1,t1,0x1
    2798:	0915                	addi	s2,s2,5
    279a:	0004                	.insn	2, 0x0004
    279c:	0501                	addi	a0,a0,0
    279e:	0316                	slli	t1,t1,0x5
    27a0:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    27a8:	0409 
    27aa:	0100                	addi	s0,sp,128
    27ac:	1705                	addi	a4,a4,-31
    27ae:	0306                	slli	t1,t1,0x1
    27b0:	0901                	addi	s2,s2,0
    27b2:	0004                	.insn	2, 0x0004
    27b4:	0501                	addi	a0,a0,0
    27b6:	02e90327          	.insn	4, 0x02e90327
    27ba:	0409                	addi	s0,s0,2
    27bc:	0100                	addi	s0,sp,128
    27be:	1b05                	addi	s6,s6,-31
    27c0:	097d9603          	lh	a2,151(s11)
    27c4:	0008                	.insn	2, 0x0008
    27c6:	0501                	addi	a0,a0,0
    27c8:	031c                	addi	a5,sp,384
    27ca:	0901                	addi	s2,s2,0
    27cc:	0004                	.insn	2, 0x0004
    27ce:	0501                	addi	a0,a0,0
    27d0:	02e90327          	.insn	4, 0x02e90327
    27d4:	0409                	addi	s0,s0,2
    27d6:	0100                	addi	s0,sp,128
    27d8:	2e05                	jal	2b08 <$d.7+0xcc0>
    27da:	0306                	slli	t1,t1,0x1
    27dc:	0900                	addi	s0,sp,144
    27de:	0004                	.insn	2, 0x0004
    27e0:	0501                	addi	a0,a0,0
    27e2:	031e                	slli	t1,t1,0x7
    27e4:	0900                	addi	s0,sp,144
    27e6:	0008                	.insn	2, 0x0008
    27e8:	0501                	addi	a0,a0,0
    27ea:	9d030617          	auipc	a2,0x9d030
    27ee:	097d                	addi	s2,s2,31
    27f0:	0004                	.insn	2, 0x0004
    27f2:	0301                	addi	t1,t1,0
    27f4:	097f 0004 0301 0902 	.insn	10, 0x0004090203010004097f
    27fc:	0004 
    27fe:	0501                	addi	a0,a0,0
    2800:	030d                	addi	t1,t1,3
    2802:	0901                	addi	s2,s2,0
    2804:	0004                	.insn	2, 0x0004
    2806:	0501                	addi	a0,a0,0
    2808:	031c                	addi	a5,sp,384
    280a:	097e                	slli	s2,s2,0x1f
    280c:	0004                	.insn	2, 0x0004
    280e:	0501                	addi	a0,a0,0
    2810:	031d                	addi	t1,t1,7
    2812:	097f 0004 0501 031c 	.insn	10, 0x0902031c05010004097f
    281a:	0902 
    281c:	0004                	.insn	2, 0x0004
    281e:	0301                	addi	t1,t1,0
    2820:	0901                	addi	s2,s2,0
    2822:	0004                	.insn	2, 0x0004
    2824:	0501                	addi	a0,a0,0
    2826:	0322                	slli	t1,t1,0x8
    2828:	097e                	slli	s2,s2,0x1f
    282a:	0004                	.insn	2, 0x0004
    282c:	0501                	addi	a0,a0,0
    282e:	09010323          	sb	a6,134(sp)
    2832:	0004                	.insn	2, 0x0004
    2834:	0501                	addi	a0,a0,0
    2836:	031e                	slli	t1,t1,0x7
    2838:	080902e3          	beqz	s2,30bc <$d.7+0x1274>
    283c:	0100                	addi	s0,sp,128
    283e:	0005                	c.nop	1
    2840:	08093403          	.insn	4, 0x08093403
    2844:	0100                	addi	s0,sp,128
    2846:	0505                	addi	a0,a0,1
    2848:	030a                	slli	t1,t1,0x2
    284a:	0906                	slli	s2,s2,0x1
    284c:	0044                	addi	s1,sp,4
    284e:	0501                	addi	a0,a0,0
    2850:	0309                	addi	t1,t1,2
    2852:	0902                	c.slli64	s2
    2854:	0010                	.insn	2, 0x0010
    2856:	0601                	addi	a2,a2,0 # 9d0327ea <_stack_top+0x9cf26a2a>
    2858:	097cc503          	lbu	a0,151(s9)
    285c:	0014                	.insn	2, 0x0014
    285e:	0301                	addi	t1,t1,0
    2860:	040903bb          	.insn	4, 0x040903bb
    2864:	0100                	addi	s0,sp,128
    2866:	097cc503          	lbu	a0,151(s9)
    286a:	0004                	.insn	2, 0x0004
    286c:	0501                	addi	a0,a0,0
    286e:	0601                	addi	a2,a2,0
    2870:	09049f03          	lh	t5,144(s1)
    2874:	0010                	.insn	2, 0x0010
    2876:	0601                	addi	a2,a2,0
    2878:	0900030b          	.insn	4, 0x0900030b
    287c:	0038                	addi	a4,sp,8
    287e:	0501                	addi	a0,a0,0
    2880:	0605                	addi	a2,a2,1
    2882:	097fa103          	lw	sp,151(t6)
    2886:	0008                	.insn	2, 0x0008
    2888:	0301                	addi	t1,t1,0
    288a:	0902                	c.slli64	s2
    288c:	0010                	.insn	2, 0x0010
    288e:	0501                	addi	a0,a0,0
    2890:	0316                	slli	t1,t1,0x5
    2892:	0901                	addi	s2,s2,0
    2894:	0010                	.insn	2, 0x0010
    2896:	0501                	addi	a0,a0,0
    2898:	0605                	addi	a2,a2,1
    289a:	04090003          	lb	zero,64(s2)
    289e:	0100                	addi	s0,sp,128
    28a0:	0306                	slli	t1,t1,0x1
    28a2:	0901                	addi	s2,s2,0
    28a4:	000c                	.insn	2, 0x000c
    28a6:	0301                	addi	t1,t1,0
    28a8:	0902                	c.slli64	s2
    28aa:	0014                	.insn	2, 0x0014
    28ac:	0501                	addi	a0,a0,0
    28ae:	0316                	slli	t1,t1,0x5
    28b0:	0901                	addi	s2,s2,0
    28b2:	0010                	.insn	2, 0x0010
    28b4:	0501                	addi	a0,a0,0
    28b6:	0605                	addi	a2,a2,1
    28b8:	04090003          	lb	zero,64(s2)
    28bc:	0100                	addi	s0,sp,128
    28be:	0306                	slli	t1,t1,0x1
    28c0:	0901                	addi	s2,s2,0
    28c2:	000c                	.insn	2, 0x000c
    28c4:	0501                	addi	a0,a0,0
    28c6:	0309                	addi	t1,t1,2
    28c8:	0902                	c.slli64	s2
    28ca:	000c                	.insn	2, 0x000c
    28cc:	0601                	addi	a2,a2,0
    28ce:	097cb603          	.insn	4, 0x097cb603
    28d2:	0004                	.insn	2, 0x0004
    28d4:	0601                	addi	a2,a2,0
    28d6:	0903cf03          	lbu	t5,144(t2)
    28da:	0004                	.insn	2, 0x0004
    28dc:	0601                	addi	a2,a2,0
    28de:	097cb103          	.insn	4, 0x097cb103
    28e2:	0004                	.insn	2, 0x0004
    28e4:	0501                	addi	a0,a0,0
    28e6:	0605                	addi	a2,a2,1
    28e8:	0903d703          	lhu	a4,144(t2)
    28ec:	001c                	.insn	2, 0x001c
    28ee:	0501                	addi	a0,a0,0
    28f0:	0309                	addi	t1,t1,2
    28f2:	0905                	addi	s2,s2,1
    28f4:	0010                	.insn	2, 0x0010
    28f6:	0601                	addi	a2,a2,0
    28f8:	097ca403          	lw	s0,151(s9)
    28fc:	0014                	.insn	2, 0x0014
    28fe:	0501                	addi	a0,a0,0
    2900:	0611                	addi	a2,a2,4
    2902:	09049403          	lh	s0,144(s1)
    2906:	00c4                	addi	s1,sp,68
    2908:	0501                	addi	a0,a0,0
    290a:	0309                	addi	t1,t1,2
    290c:	0902                	c.slli64	s2
    290e:	0008                	.insn	2, 0x0008
    2910:	0601                	addi	a2,a2,0
    2912:	097bea03          	.insn	4, 0x097bea03
    2916:	0008                	.insn	2, 0x0008
    2918:	0601                	addi	a2,a2,0
    291a:	0903dc03          	lhu	s8,144(t2)
    291e:	0004                	.insn	2, 0x0004
    2920:	0601                	addi	a2,a2,0
    2922:	097ca403          	lw	s0,151(s9)
    2926:	0008                	.insn	2, 0x0008
    2928:	0501                	addi	a0,a0,0
    292a:	060d                	addi	a2,a2,3
    292c:	0903de03          	lhu	t3,144(t2)
    2930:	0008                	.insn	2, 0x0008
    2932:	0301                	addi	t1,t1,0
    2934:	0905                	addi	s2,s2,1
    2936:	0004                	.insn	2, 0x0004
    2938:	0301                	addi	t1,t1,0
    293a:	0905                	addi	s2,s2,1
    293c:	0004                	.insn	2, 0x0004
    293e:	0601                	addi	a2,a2,0
    2940:	097c9803          	lh	a6,151(s9)
    2944:	0004                	.insn	2, 0x0004
    2946:	0501                	addi	a0,a0,0
    2948:	0609                	addi	a2,a2,2
    294a:	0903ed03          	.insn	4, 0x0903ed03
    294e:	0004                	.insn	2, 0x0004
    2950:	0301                	addi	t1,t1,0
    2952:	08097fa7          	.insn	4, 0x08097fa7
    2956:	0100                	addi	s0,sp,128
    2958:	0306                	slli	t1,t1,0x1
    295a:	0900                	addi	s0,sp,144
    295c:	0004                	.insn	2, 0x0004
    295e:	0301                	addi	t1,t1,0
    2960:	7cec                	.insn	2, 0x7cec
    2962:	2409                	jal	2b64 <$d.7+0xd1c>
    2964:	0100                	addi	s0,sp,128
    2966:	09039403          	lh	s0,144(t2)
    296a:	0008                	.insn	2, 0x0008
    296c:	0301                	addi	t1,t1,0
    296e:	7cec                	.insn	2, 0x7cec
    2970:	0809                	addi	a6,a6,2
    2972:	0100                	addi	s0,sp,128
    2974:	0306                	slli	t1,t1,0x1
    2976:	0c0903a7          	.insn	4, 0x0c0903a7
    297a:	0100                	addi	s0,sp,128
    297c:	1005                	c.nop	-31
    297e:	08090103          	lb	sp,128(s2)
    2982:	0100                	addi	s0,sp,128
    2984:	0306                	slli	t1,t1,0x1
    2986:	7cd8                	.insn	2, 0x7cd8
    2988:	0809                	addi	a6,a6,2
    298a:	0100                	addi	s0,sp,128
    298c:	0c05                	addi	s8,s8,1
    298e:	0306                	slli	t1,t1,0x1
    2990:	280903ab          	.insn	4, 0x280903ab
    2994:	0100                	addi	s0,sp,128
    2996:	2905                	jal	2dc6 <$d.7+0xf7e>
    2998:	0306                	slli	t1,t1,0x1
    299a:	0900                	addi	s0,sp,144
    299c:	0008                	.insn	2, 0x0008
    299e:	0501                	addi	a0,a0,0
    29a0:	0900032f          	.insn	4, 0x0900032f
    29a4:	0004                	.insn	2, 0x0004
    29a6:	0501                	addi	a0,a0,0
    29a8:	031d                	addi	t1,t1,7
    29aa:	0900                	addi	s0,sp,144
    29ac:	0004                	.insn	2, 0x0004
    29ae:	0301                	addi	t1,t1,0
    29b0:	7cd5                	lui	s9,0xffff5
    29b2:	0409                	addi	s0,s0,2
    29b4:	0100                	addi	s0,sp,128
    29b6:	0905                	addi	s2,s2,1
    29b8:	0306                	slli	t1,t1,0x1
    29ba:	03f1                	addi	t2,t2,28
    29bc:	0409                	addi	s0,s0,2
    29be:	0100                	addi	s0,sp,128
    29c0:	2205                	jal	2ae0 <$d.7+0xc98>
    29c2:	08090203          	lb	tp,128(s2)
    29c6:	0100                	addi	s0,sp,128
    29c8:	0905                	addi	s2,s2,1
    29ca:	0306                	slli	t1,t1,0x1
    29cc:	0900                	addi	s0,sp,144
    29ce:	0004                	.insn	2, 0x0004
    29d0:	0301                	addi	t1,t1,0
    29d2:	7c8d                	lui	s9,0xfffe3
    29d4:	0409                	addi	s0,s0,2
    29d6:	0100                	addi	s0,sp,128
    29d8:	1105                	addi	sp,sp,-31
    29da:	0306                	slli	t1,t1,0x1
    29dc:	03f6                	slli	t2,t2,0x1d
    29de:	0809                	addi	a6,a6,2
    29e0:	0100                	addi	s0,sp,128
    29e2:	0d05                	addi	s10,s10,1
    29e4:	04090303          	lb	t1,64(s2)
    29e8:	0100                	addi	s0,sp,128
    29ea:	1105                	addi	sp,sp,-31
    29ec:	0c090203          	lb	tp,192(s2)
    29f0:	0100                	addi	s0,sp,128
    29f2:	2305                	jal	2f12 <$d.7+0x10ca>
    29f4:	0306                	slli	t1,t1,0x1
    29f6:	0900                	addi	s0,sp,144
    29f8:	0004                	.insn	2, 0x0004
    29fa:	0501                	addi	a0,a0,0
    29fc:	0311                	addi	t1,t1,4
    29fe:	0900                	addi	s0,sp,144
    2a00:	0004                	.insn	2, 0x0004
    2a02:	0301                	addi	t1,t1,0
    2a04:	0900                	addi	s0,sp,144
    2a06:	0008                	.insn	2, 0x0008
    2a08:	0501                	addi	a0,a0,0
    2a0a:	060d                	addi	a2,a2,3
    2a0c:	04090503          	lb	a0,64(s2)
    2a10:	0100                	addi	s0,sp,128
    2a12:	0306                	slli	t1,t1,0x1
    2a14:	7c80                	.insn	2, 0x7c80
    2a16:	0c09                	addi	s8,s8,2
    2a18:	0100                	addi	s0,sp,128
    2a1a:	1905                	addi	s2,s2,-31
    2a1c:	0306                	slli	t1,t1,0x1
    2a1e:	0482                	c.slli64	s1
    2a20:	0809                	addi	a6,a6,2
    2a22:	0100                	addi	s0,sp,128
    2a24:	0306                	slli	t1,t1,0x1
    2a26:	7bfe                	.insn	2, 0x7bfe
    2a28:	0409                	addi	s0,s0,2
    2a2a:	0100                	addi	s0,sp,128
    2a2c:	0d05                	addi	s10,s10,1
    2a2e:	0306                	slli	t1,t1,0x1
    2a30:	0484                	addi	s1,sp,576
    2a32:	0409                	addi	s0,s0,2
    2a34:	0100                	addi	s0,sp,128
    2a36:	1a05                	addi	s4,s4,-31
    2a38:	08090103          	lb	sp,128(s2)
    2a3c:	0100                	addi	s0,sp,128
    2a3e:	1805                	addi	a6,a6,-31
    2a40:	0306                	slli	t1,t1,0x1
    2a42:	0900                	addi	s0,sp,144
    2a44:	0004                	.insn	2, 0x0004
    2a46:	0501                	addi	a0,a0,0
    2a48:	0624                	addi	s1,sp,776
    2a4a:	04097f03          	.insn	4, 0x04097f03
    2a4e:	0100                	addi	s0,sp,128
    2a50:	0d05                	addi	s10,s10,1
    2a52:	0306                	slli	t1,t1,0x1
    2a54:	0900                	addi	s0,sp,144
    2a56:	0008                	.insn	2, 0x0008
    2a58:	0501                	addi	a0,a0,0
    2a5a:	0614                	addi	a3,sp,768
    2a5c:	04090403          	lb	s0,64(s2)
    2a60:	0100                	addi	s0,sp,128
    2a62:	0d05                	addi	s10,s10,1
    2a64:	04090203          	lb	tp,64(s2)
    2a68:	0100                	addi	s0,sp,128
    2a6a:	2205                	jal	2b8a <$d.7+0xd42>
    2a6c:	0c096903          	.insn	4, 0x0c096903
    2a70:	0100                	addi	s0,sp,128
    2a72:	3a05                	jal	23a2 <$d.7+0x55a>
    2a74:	0306                	slli	t1,t1,0x1
    2a76:	0900                	addi	s0,sp,144
    2a78:	0004                	.insn	2, 0x0004
    2a7a:	0301                	addi	t1,t1,0
    2a7c:	7c8d                	lui	s9,0xfffe3
    2a7e:	0409                	addi	s0,s0,2
    2a80:	0100                	addi	s0,sp,128
    2a82:	0905                	addi	s2,s2,1
    2a84:	0903f303          	.insn	4, 0x0903f303
    2a88:	0004                	.insn	2, 0x0004
    2a8a:	0501                	addi	a0,a0,0
    2a8c:	060d                	addi	a2,a2,3
    2a8e:	04091a03          	lh	s4,64(s2)
    2a92:	0100                	addi	s0,sp,128
    2a94:	0306                	slli	t1,t1,0x1
    2a96:	04097bf3          	.insn	4, 0x04097bf3
    2a9a:	0100                	addi	s0,sp,128
    2a9c:	0905                	addi	s2,s2,1
    2a9e:	0306                	slli	t1,t1,0x1
    2aa0:	0492                	slli	s1,s1,0x4
    2aa2:	0409                	addi	s0,s0,2
    2aa4:	0100                	addi	s0,sp,128
    2aa6:	2b05                	jal	2fd6 <$d.7+0x118e>
    2aa8:	08090203          	lb	tp,128(s2)
    2aac:	0100                	addi	s0,sp,128
    2aae:	0306                	slli	t1,t1,0x1
    2ab0:	7bec                	.insn	2, 0x7bec
    2ab2:	0409                	addi	s0,s0,2
    2ab4:	0100                	addi	s0,sp,128
    2ab6:	0905                	addi	s2,s2,1
    2ab8:	0306                	slli	t1,t1,0x1
    2aba:	01ff 0809 0100 1b05 	.insn	10, 0x7c031b050100080901ff
    2ac2:	7c03 
    2ac4:	0409                	addi	s0,s0,2
    2ac6:	0100                	addi	s0,sp,128
    2ac8:	0905                	addi	s2,s2,1
    2aca:	08090703          	lb	a4,128(s2)
    2ace:	0100                	addi	s0,sp,128
    2ad0:	0005                	c.nop	1
    2ad2:	0306                	slli	t1,t1,0x1
    2ad4:	7dfe                	.insn	2, 0x7dfe
    2ad6:	0409                	addi	s0,s0,2
    2ad8:	0100                	addi	s0,sp,128
    2ada:	3905                	jal	270a <$d.7+0x8c2>
    2adc:	0306                	slli	t1,t1,0x1
    2ade:	040901fb          	.insn	4, 0x040901fb
    2ae2:	0100                	addi	s0,sp,128
    2ae4:	2b05                	jal	3014 <$d.7+0x11cc>
    2ae6:	0306                	slli	t1,t1,0x1
    2ae8:	0900                	addi	s0,sp,144
    2aea:	0004                	.insn	2, 0x0004
    2aec:	0301                	addi	t1,t1,0
    2aee:	7e85                	lui	t4,0xfffe1
    2af0:	0409                	addi	s0,s0,2
    2af2:	0100                	addi	s0,sp,128
    2af4:	0905                	addi	s2,s2,1
    2af6:	0306                	slli	t1,t1,0x1
    2af8:	0282                	c.slli64	t0
    2afa:	0409                	addi	s0,s0,2
    2afc:	0100                	addi	s0,sp,128
    2afe:	0306                	slli	t1,t1,0x1
    2b00:	7dfe                	.insn	2, 0x7dfe
    2b02:	0409                	addi	s0,s0,2
    2b04:	0100                	addi	s0,sp,128
    2b06:	09028203          	lb	tp,144(t0)
    2b0a:	0004                	.insn	2, 0x0004
    2b0c:	0501                	addi	a0,a0,0
    2b0e:	0300                	addi	s0,sp,384
    2b10:	7dfe                	.insn	2, 0x7dfe
    2b12:	0409                	addi	s0,s0,2
    2b14:	0100                	addi	s0,sp,128
    2b16:	1205                	addi	tp,tp,-31 # ffffffe1 <_stack_top+0xffef4221>
    2b18:	0306                	slli	t1,t1,0x1
    2b1a:	0285                	addi	t0,t0,1
    2b1c:	0809                	addi	a6,a6,2
    2b1e:	0100                	addi	s0,sp,128
    2b20:	1705                	addi	a4,a4,-31
    2b22:	097e9603          	lh	a2,151(t4) # fffe1097 <_stack_top+0xffed52d7>
    2b26:	0004                	.insn	2, 0x0004
    2b28:	0301                	addi	t1,t1,0
    2b2a:	097f 0004 0301 0902 	.insn	10, 0x0004090203010004097f
    2b32:	0004 
    2b34:	0501                	addi	a0,a0,0
    2b36:	031c                	addi	a5,sp,384
    2b38:	097f 0004 0501 030d 	.insn	10, 0x0902030d05010004097f
    2b40:	0902 
    2b42:	0004                	.insn	2, 0x0004
    2b44:	0501                	addi	a0,a0,0
    2b46:	031d                	addi	t1,t1,7
    2b48:	097d                	addi	s2,s2,31
    2b4a:	0004                	.insn	2, 0x0004
    2b4c:	0501                	addi	a0,a0,0
    2b4e:	031c                	addi	a5,sp,384
    2b50:	0902                	c.slli64	s2
    2b52:	0004                	.insn	2, 0x0004
    2b54:	0501                	addi	a0,a0,0
    2b56:	0322                	slli	t1,t1,0x8
    2b58:	097f 0004 0501 030a 	.insn	10, 0x01eb030a05010004097f
    2b60:	01eb 
    2b62:	0409                	addi	s0,s0,2
    2b64:	0100                	addi	s0,sp,128
    2b66:	0306                	slli	t1,t1,0x1
    2b68:	7dfa                	.insn	2, 0x7dfa
    2b6a:	0c09                	addi	s8,s8,2
    2b6c:	0100                	addi	s0,sp,128
    2b6e:	0d05                	addi	s10,s10,1
    2b70:	0306                	slli	t1,t1,0x1
    2b72:	048e                	slli	s1,s1,0x3
    2b74:	0409                	addi	s0,s0,2
    2b76:	0100                	addi	s0,sp,128
    2b78:	0306                	slli	t1,t1,0x1
    2b7a:	7bf2                	.insn	2, 0x7bf2
    2b7c:	1009                	c.nop	-30
    2b7e:	0100                	addi	s0,sp,128
    2b80:	0905                	addi	s2,s2,1
    2b82:	0306                	slli	t1,t1,0x1
    2b84:	0499                	addi	s1,s1,6
    2b86:	0c09                	addi	s8,s8,2
    2b88:	0100                	addi	s0,sp,128
    2b8a:	1805                	addi	a6,a6,-31
    2b8c:	04090103          	lb	sp,64(s2)
    2b90:	0100                	addi	s0,sp,128
    2b92:	1605                	addi	a2,a2,-31
    2b94:	0306                	slli	t1,t1,0x1
    2b96:	0900                	addi	s0,sp,144
    2b98:	0008                	.insn	2, 0x0008
    2b9a:	0301                	addi	t1,t1,0
    2b9c:	7be6                	.insn	2, 0x7be6
    2b9e:	0809                	addi	a6,a6,2
    2ba0:	0100                	addi	s0,sp,128
    2ba2:	0005                	c.nop	1
    2ba4:	0306                	slli	t1,t1,0x1
    2ba6:	04b4                	addi	a3,sp,584
    2ba8:	2009                	jal	2baa <$d.7+0xd62>
    2baa:	0100                	addi	s0,sp,128
    2bac:	0505                	addi	a0,a0,1
    2bae:	030a                	slli	t1,t1,0x2
    2bb0:	0909                	addi	s2,s2,2
    2bb2:	0044                	addi	s1,sp,4
    2bb4:	0501                	addi	a0,a0,0
    2bb6:	0309                	addi	t1,t1,2
    2bb8:	0902                	c.slli64	s2
    2bba:	0010                	.insn	2, 0x0010
    2bbc:	0601                	addi	a2,a2,0
    2bbe:	097bc103          	lbu	sp,151(s7)
    2bc2:	0014                	.insn	2, 0x0014
    2bc4:	0301                	addi	t1,t1,0
    2bc6:	040904bf c1030100 	.insn	8, 0xc1030100040904bf
    2bce:	0004097b          	.insn	4, 0x0004097b
    2bd2:	0501                	addi	a0,a0,0
    2bd4:	0601                	addi	a2,a2,0
    2bd6:	0905a603          	lw	a2,144(a1)
    2bda:	0010                	.insn	2, 0x0010
    2bdc:	0601                	addi	a2,a2,0
    2bde:	097ada03          	lhu	s4,151(s5)
    2be2:	0014                	.insn	2, 0x0014
    2be4:	0b01                	addi	s6,s6,0
    2be6:	0905a603          	lw	a2,144(a1)
    2bea:	0024                	addi	s1,sp,8
    2bec:	0501                	addi	a0,a0,0
    2bee:	0605                	addi	a2,a2,1
    2bf0:	097f9e03          	lh	t3,151(t6)
    2bf4:	0008                	.insn	2, 0x0008
    2bf6:	0501                	addi	a0,a0,0
    2bf8:	0309                	addi	t1,t1,2
    2bfa:	0902                	c.slli64	s2
    2bfc:	0010                	.insn	2, 0x0010
    2bfe:	0601                	addi	a2,a2,0
    2c00:	04090003          	lb	zero,64(s2)
    2c04:	0100                	addi	s0,sp,128
    2c06:	0306                	slli	t1,t1,0x1
    2c08:	0905                	addi	s2,s2,1
    2c0a:	0004                	.insn	2, 0x0004
    2c0c:	0601                	addi	a2,a2,0
    2c0e:	08090003          	lb	zero,128(s2)
    2c12:	0100                	addi	s0,sp,128
    2c14:	097bb503          	.insn	4, 0x097bb503
    2c18:	0004                	.insn	2, 0x0004
    2c1a:	0501                	addi	a0,a0,0
    2c1c:	060d                	addi	a2,a2,3
    2c1e:	0904de03          	lhu	t3,144(s1)
    2c22:	00a8                	addi	a0,sp,72
    2c24:	0301                	addi	t1,t1,0
    2c26:	0905                	addi	s2,s2,1
    2c28:	0004                	.insn	2, 0x0004
    2c2a:	0501                	addi	a0,a0,0
    2c2c:	0309                	addi	t1,t1,2
    2c2e:	7eb1                	lui	t4,0xfffec
    2c30:	0409                	addi	s0,s0,2
    2c32:	0100                	addi	s0,sp,128
    2c34:	0306                	slli	t1,t1,0x1
    2c36:	0900                	addi	s0,sp,144
    2c38:	0008                	.insn	2, 0x0008
    2c3a:	0301                	addi	t1,t1,0
    2c3c:	7cec                	.insn	2, 0x7cec
    2c3e:	2409                	jal	2e40 <$d.7+0xff8>
    2c40:	0100                	addi	s0,sp,128
    2c42:	09039403          	lh	s0,144(t2)
    2c46:	0008                	.insn	2, 0x0008
    2c48:	0301                	addi	t1,t1,0
    2c4a:	7cec                	.insn	2, 0x7cec
    2c4c:	0809                	addi	a6,a6,2
    2c4e:	0100                	addi	s0,sp,128
    2c50:	0306                	slli	t1,t1,0x1
    2c52:	100903a7          	.insn	4, 0x100903a7
    2c56:	0100                	addi	s0,sp,128
    2c58:	2205                	jal	2d78 <$d.7+0xf30>
    2c5a:	0901c303          	lbu	t1,144(gp)
    2c5e:	0008                	.insn	2, 0x0008
    2c60:	0501                	addi	a0,a0,0
    2c62:	0609                	addi	a2,a2,2
    2c64:	08090003          	lb	zero,128(s2)
    2c68:	0100                	addi	s0,sp,128
    2c6a:	097b9603          	lh	a2,151(s7)
    2c6e:	0004                	.insn	2, 0x0004
    2c70:	0501                	addi	a0,a0,0
    2c72:	060c                	addi	a1,sp,768
    2c74:	0903ab03          	lw	s6,144(t2)
    2c78:	0038                	addi	a4,sp,8
    2c7a:	0501                	addi	a0,a0,0
    2c7c:	0629                	addi	a2,a2,10
    2c7e:	08090003          	lb	zero,128(s2)
    2c82:	0100                	addi	s0,sp,128
    2c84:	2f05                	jal	33b4 <$d.7+0x156c>
    2c86:	04090003          	lb	zero,64(s2)
    2c8a:	0100                	addi	s0,sp,128
    2c8c:	1d05                	addi	s10,s10,-31
    2c8e:	04090003          	lb	zero,64(s2)
    2c92:	0100                	addi	s0,sp,128
    2c94:	097cd503          	lhu	a0,151(s9) # fffe3097 <_stack_top+0xffed72d7>
    2c98:	0004                	.insn	2, 0x0004
    2c9a:	0501                	addi	a0,a0,0
    2c9c:	0622                	slli	a2,a2,0x8
    2c9e:	0904ea03          	.insn	4, 0x0904ea03
    2ca2:	000c                	.insn	2, 0x000c
    2ca4:	0501                	addi	a0,a0,0
    2ca6:	063a                	slli	a2,a2,0xe
    2ca8:	08090003          	lb	zero,128(s2)
    2cac:	0100                	addi	s0,sp,128
    2cae:	097b9603          	lh	a2,151(s7)
    2cb2:	0004                	.insn	2, 0x0004
    2cb4:	0501                	addi	a0,a0,0
    2cb6:	0309                	addi	t1,t1,2
    2cb8:	04ea                	slli	s1,s1,0x1a
    2cba:	0409                	addi	s0,s0,2
    2cbc:	0100                	addi	s0,sp,128
    2cbe:	1105                	addi	sp,sp,-31
    2cc0:	0306                	slli	t1,t1,0x1
    2cc2:	00040903          	lb	s2,0(s0)
    2cc6:	0301                	addi	t1,t1,0
    2cc8:	00040903          	lb	s2,0(s0)
    2ccc:	0501                	addi	a0,a0,0
    2cce:	00030623          	sb	zero,12(t1)
    2cd2:	0c09                	addi	s8,s8,2
    2cd4:	0100                	addi	s0,sp,128
    2cd6:	1105                	addi	sp,sp,-31
    2cd8:	08090003          	lb	zero,128(s2)
    2cdc:	0100                	addi	s0,sp,128
    2cde:	08090003          	lb	zero,128(s2)
    2ce2:	0100                	addi	s0,sp,128
    2ce4:	097b9003          	lh	zero,151(s7)
    2ce8:	0004                	.insn	2, 0x0004
    2cea:	0501                	addi	a0,a0,0
    2cec:	061c                	addi	a5,sp,768
    2cee:	0904f503          	.insn	4, 0x0904f503
    2cf2:	0008                	.insn	2, 0x0008
    2cf4:	0601                	addi	a2,a2,0
    2cf6:	097b8b03          	lb	s6,151(s7)
    2cfa:	0004                	.insn	2, 0x0004
    2cfc:	0501                	addi	a0,a0,0
    2cfe:	0624                	addi	s1,sp,776
    2d00:	0904f703          	.insn	4, 0x0904f703
    2d04:	0014                	.insn	2, 0x0014
    2d06:	0501                	addi	a0,a0,0
    2d08:	060d                	addi	a2,a2,3
    2d0a:	08090003          	lb	zero,128(s2)
    2d0e:	0100                	addi	s0,sp,128
    2d10:	2005                	jal	2d30 <$d.7+0xee8>
    2d12:	0306                	slli	t1,t1,0x1
    2d14:	0901                	addi	s2,s2,0
    2d16:	0004                	.insn	2, 0x0004
    2d18:	0501                	addi	a0,a0,0
    2d1a:	0312                	slli	t1,t1,0x4
    2d1c:	04097fab          	.insn	4, 0x04097fab
    2d20:	0100                	addi	s0,sp,128
    2d22:	0c090303          	lb	t1,192(s2)
    2d26:	0100                	addi	s0,sp,128
    2d28:	1805                	addi	a6,a6,-31
    2d2a:	0c090103          	lb	sp,192(s2)
    2d2e:	0100                	addi	s0,sp,128
    2d30:	1505                	addi	a0,a0,-31
    2d32:	0900d603          	lhu	a2,144(ra)
    2d36:	0004                	.insn	2, 0x0004
    2d38:	0501                	addi	a0,a0,0
    2d3a:	0322                	slli	t1,t1,0x8
    2d3c:	0901                	addi	s2,s2,0
    2d3e:	0004                	.insn	2, 0x0004
    2d40:	0501                	addi	a0,a0,0
    2d42:	031e                	slli	t1,t1,0x7
    2d44:	0901                	addi	s2,s2,0
    2d46:	0004                	.insn	2, 0x0004
    2d48:	0501                	addi	a0,a0,0
    2d4a:	0328                	addi	a0,sp,392
    2d4c:	097f 0004 0501 0319 	.insn	10, 0x0903031905010004097f
    2d54:	0903 
    2d56:	0004                	.insn	2, 0x0004
    2d58:	0601                	addi	a2,a2,0
    2d5a:	097aff03          	.insn	4, 0x097aff03
    2d5e:	0004                	.insn	2, 0x0004
    2d60:	0601                	addi	a2,a2,0
    2d62:	09058203          	lb	tp,144(a1)
    2d66:	0004                	.insn	2, 0x0004
    2d68:	0501                	addi	a0,a0,0
    2d6a:	0624                	addi	s1,sp,776
    2d6c:	08090003          	lb	zero,128(s2)
    2d70:	0100                	addi	s0,sp,128
    2d72:	1e05                	addi	t3,t3,-31
    2d74:	0306                	slli	t1,t1,0x1
    2d76:	0901                	addi	s2,s2,0
    2d78:	0004                	.insn	2, 0x0004
    2d7a:	0601                	addi	a2,a2,0
    2d7c:	097afd03          	.insn	4, 0x097afd03
    2d80:	0004                	.insn	2, 0x0004
    2d82:	0501                	addi	a0,a0,0
    2d84:	0612                	slli	a2,a2,0x4
    2d86:	0904a903          	lw	s2,144(s1)
    2d8a:	0008                	.insn	2, 0x0008
    2d8c:	0601                	addi	a2,a2,0
    2d8e:	097bd703          	lhu	a4,151(s7)
    2d92:	000c                	.insn	2, 0x000c
    2d94:	0501                	addi	a0,a0,0
    2d96:	0615                	addi	a2,a2,5
    2d98:	0904fd03          	.insn	4, 0x0904fd03
    2d9c:	0004                	.insn	2, 0x0004
    2d9e:	0501                	addi	a0,a0,0
    2da0:	090c0323          	sb	a6,134(s8)
    2da4:	0004                	.insn	2, 0x0004
    2da6:	0601                	addi	a2,a2,0
    2da8:	097af703          	.insn	4, 0x097af703
    2dac:	0008                	.insn	2, 0x0008
    2dae:	0501                	addi	a0,a0,0
    2db0:	060d                	addi	a2,a2,3
    2db2:	09059503          	lh	a0,144(a1)
    2db6:	0010                	.insn	2, 0x0010
    2db8:	0501                	addi	a0,a0,0
    2dba:	7ce6031b          	.insn	4, 0x7ce6031b
    2dbe:	0409                	addi	s0,s0,2
    2dc0:	0100                	addi	s0,sp,128
    2dc2:	0905                	addi	s2,s2,1
    2dc4:	08090703          	lb	a4,128(s2)
    2dc8:	0100                	addi	s0,sp,128
    2dca:	0306                	slli	t1,t1,0x1
    2dcc:	7dfe                	.insn	2, 0x7dfe
    2dce:	0809                	addi	a6,a6,2
    2dd0:	0100                	addi	s0,sp,128
    2dd2:	3905                	jal	2a02 <$d.7+0xbba>
    2dd4:	0306                	slli	t1,t1,0x1
    2dd6:	040901fb          	.insn	4, 0x040901fb
    2dda:	0100                	addi	s0,sp,128
    2ddc:	2b05                	jal	330c <$d.7+0x14c4>
    2dde:	0306                	slli	t1,t1,0x1
    2de0:	0900                	addi	s0,sp,144
    2de2:	0004                	.insn	2, 0x0004
    2de4:	0301                	addi	t1,t1,0
    2de6:	7e85                	lui	t4,0xfffe1
    2de8:	0409                	addi	s0,s0,2
    2dea:	0100                	addi	s0,sp,128
    2dec:	0905                	addi	s2,s2,1
    2dee:	0306                	slli	t1,t1,0x1
    2df0:	0282                	c.slli64	t0
    2df2:	0409                	addi	s0,s0,2
    2df4:	0100                	addi	s0,sp,128
    2df6:	0306                	slli	t1,t1,0x1
    2df8:	0900                	addi	s0,sp,144
    2dfa:	0008                	.insn	2, 0x0008
    2dfc:	0301                	addi	t1,t1,0
    2dfe:	7dfe                	.insn	2, 0x7dfe
    2e00:	0409                	addi	s0,s0,2
    2e02:	0100                	addi	s0,sp,128
    2e04:	2605                	jal	3124 <$d.7+0x12dc>
    2e06:	0306                	slli	t1,t1,0x1
    2e08:	01fc                	addi	a5,sp,204
    2e0a:	1009                	c.nop	-30
    2e0c:	0100                	addi	s0,sp,128
    2e0e:	1205                	addi	tp,tp,-31 # ffffffe1 <_stack_top+0xffef4221>
    2e10:	08090903          	lb	s2,128(s2)
    2e14:	0100                	addi	s0,sp,128
    2e16:	1705                	addi	a4,a4,-31
    2e18:	097e9603          	lh	a2,151(t4) # fffe1097 <_stack_top+0xffed52d7>
    2e1c:	0004                	.insn	2, 0x0004
    2e1e:	0301                	addi	t1,t1,0
    2e20:	097f 0004 0301 0902 	.insn	10, 0x0004090203010004097f
    2e28:	0004 
    2e2a:	0501                	addi	a0,a0,0
    2e2c:	031c                	addi	a5,sp,384
    2e2e:	097f 0004 0501 030d 	.insn	10, 0x0902030d05010004097f
    2e36:	0902 
    2e38:	0004                	.insn	2, 0x0004
    2e3a:	0501                	addi	a0,a0,0
    2e3c:	031d                	addi	t1,t1,7
    2e3e:	097d                	addi	s2,s2,31
    2e40:	0004                	.insn	2, 0x0004
    2e42:	0501                	addi	a0,a0,0
    2e44:	031c                	addi	a5,sp,384
    2e46:	0902                	c.slli64	s2
    2e48:	0004                	.insn	2, 0x0004
    2e4a:	0501                	addi	a0,a0,0
    2e4c:	0322                	slli	t1,t1,0x8
    2e4e:	097f 0004 0501 030a 	.insn	10, 0x01eb030a05010004097f
    2e56:	01eb 
    2e58:	0409                	addi	s0,s0,2
    2e5a:	0100                	addi	s0,sp,128
    2e5c:	0306                	slli	t1,t1,0x1
    2e5e:	7dfa                	.insn	2, 0x7dfa
    2e60:	0c09                	addi	s8,s8,2
    2e62:	0100                	addi	s0,sp,128
    2e64:	0d05                	addi	s10,s10,1
    2e66:	0306                	slli	t1,t1,0x1
    2e68:	04d9                	addi	s1,s1,22
    2e6a:	1009                	c.nop	-30
    2e6c:	0100                	addi	s0,sp,128
    2e6e:	0306                	slli	t1,t1,0x1
    2e70:	04097ba7          	.insn	4, 0x04097ba7
    2e74:	0100                	addi	s0,sp,128
    2e76:	0905                	addi	s2,s2,1
    2e78:	0306                	slli	t1,t1,0x1
    2e7a:	1409059b          	.insn	4, 0x1409059b
    2e7e:	0100                	addi	s0,sp,128
    2e80:	0306                	slli	t1,t1,0x1
    2e82:	7ae5                	lui	s5,0xffff9
    2e84:	0409                	addi	s0,s0,2
    2e86:	0100                	addi	s0,sp,128
    2e88:	0306                	slli	t1,t1,0x1
    2e8a:	05a0                	addi	s0,sp,712
    2e8c:	2409                	jal	308e <$d.7+0x1246>
    2e8e:	0100                	addi	s0,sp,128
    2e90:	0306                	slli	t1,t1,0x1
    2e92:	7ae0                	.insn	2, 0x7ae0
    2e94:	0409                	addi	s0,s0,2
    2e96:	0100                	addi	s0,sp,128
    2e98:	1705                	addi	a4,a4,-31
    2e9a:	0306                	slli	t1,t1,0x1
    2e9c:	05a1                	addi	a1,a1,8
    2e9e:	0409                	addi	s0,s0,2
    2ea0:	0100                	addi	s0,sp,128
    2ea2:	0306                	slli	t1,t1,0x1
    2ea4:	7adf 0809 0100      	.insn	6, 0x010008097adf
    2eaa:	1c09                	addi	s8,s8,-30
    2eac:	0000                	unimp
    2eae:	0101                	addi	sp,sp,0
    2eb0:	0076                	c.slli	zero,0x1d
    2eb2:	0000                	unimp
    2eb4:	0005                	c.nop	1
    2eb6:	0004                	.insn	2, 0x0004
    2eb8:	002e                	c.slli	zero,0xb
    2eba:	0000                	unimp
    2ebc:	0101                	addi	sp,sp,0
    2ebe:	fb01                	bnez	a4,2dce <$d.7+0xf86>
    2ec0:	0d0e                	slli	s10,s10,0x3
    2ec2:	0100                	addi	s0,sp,128
    2ec4:	0101                	addi	sp,sp,0
    2ec6:	0001                	nop
    2ec8:	0000                	unimp
    2eca:	0001                	nop
    2ecc:	0100                	addi	s0,sp,128
    2ece:	0101                	addi	sp,sp,0
    2ed0:	021f 0000 0000      	.insn	6, 0x021f
    2ed6:	005f 0000 0102      	.insn	6, 0x01020000005f
    2edc:	021f 020f 0056      	.insn	6, 0x0056020f021f
    2ee2:	0000                	unimp
    2ee4:	5601                	li	a2,-32
    2ee6:	0000                	unimp
    2ee8:	0100                	addi	s0,sp,128
    2eea:	0500                	addi	s0,sp,640
    2eec:	4802                	lw	a6,0(sp)
    2eee:	0300102f          	.insn	4, 0x0300102f
    2ef2:	0124                	addi	s1,sp,136
    2ef4:	02090103          	lb	sp,32(s2)
    2ef8:	0100                	addi	s0,sp,128
    2efa:	02090203          	lb	tp,32(s2)
    2efe:	0100                	addi	s0,sp,128
    2f00:	04090103          	lb	sp,64(s2)
    2f04:	0100                	addi	s0,sp,128
    2f06:	02090103          	lb	sp,32(s2)
    2f0a:	0100                	addi	s0,sp,128
    2f0c:	02090203          	lb	tp,32(s2)
    2f10:	0100                	addi	s0,sp,128
    2f12:	02090103          	lb	sp,32(s2)
    2f16:	0100                	addi	s0,sp,128
    2f18:	02090103          	lb	sp,32(s2)
    2f1c:	0100                	addi	s0,sp,128
    2f1e:	02090103          	lb	sp,32(s2)
    2f22:	0100                	addi	s0,sp,128
    2f24:	0209                	addi	tp,tp,2 # 2 <$d.6+0x2>
    2f26:	0000                	unimp
    2f28:	0101                	addi	sp,sp,0
    2f2a:	0000014f          	.insn	4, 0x014f
    2f2e:	0005                	c.nop	1
    2f30:	0004                	.insn	2, 0x0004
    2f32:	002e                	c.slli	zero,0xb
    2f34:	0000                	unimp
    2f36:	0101                	addi	sp,sp,0
    2f38:	fb01                	bnez	a4,2e48 <$d.7+0x1000>
    2f3a:	0d0e                	slli	s10,s10,0x3
    2f3c:	0100                	addi	s0,sp,128
    2f3e:	0101                	addi	sp,sp,0
    2f40:	0001                	nop
    2f42:	0000                	unimp
    2f44:	0001                	nop
    2f46:	0100                	addi	s0,sp,128
    2f48:	0101                	addi	sp,sp,0
    2f4a:	021f 0000 0000      	.insn	6, 0x021f
    2f50:	005f 0000 0102      	.insn	6, 0x01020000005f
    2f56:	021f 020f 0082      	.insn	6, 0x0082020f021f
    2f5c:	0000                	unimp
    2f5e:	8201                	c.srli64	a2
    2f60:	0000                	unimp
    2f62:	0100                	addi	s0,sp,128
    2f64:	0500                	addi	s0,sp,640
    2f66:	5c02                	lw	s8,32(sp)
    2f68:	0300102f          	.insn	4, 0x0300102f
    2f6c:	00c4                	addi	s1,sp,68
    2f6e:	0301                	addi	t1,t1,0
    2f70:	0901                	addi	s2,s2,0
    2f72:	0004                	.insn	2, 0x0004
    2f74:	0301                	addi	t1,t1,0
    2f76:	0904                	addi	s1,sp,144
    2f78:	0004                	.insn	2, 0x0004
    2f7a:	0301                	addi	t1,t1,0
    2f7c:	0901                	addi	s2,s2,0
    2f7e:	0002                	c.slli64	zero
    2f80:	0301                	addi	t1,t1,0
    2f82:	0901                	addi	s2,s2,0
    2f84:	0002                	c.slli64	zero
    2f86:	0301                	addi	t1,t1,0
    2f88:	0901                	addi	s2,s2,0
    2f8a:	0002                	c.slli64	zero
    2f8c:	0301                	addi	t1,t1,0
    2f8e:	0901                	addi	s2,s2,0
    2f90:	0002                	c.slli64	zero
    2f92:	0301                	addi	t1,t1,0
    2f94:	0901                	addi	s2,s2,0
    2f96:	0002                	c.slli64	zero
    2f98:	0301                	addi	t1,t1,0
    2f9a:	0902                	c.slli64	s2
    2f9c:	0004                	.insn	2, 0x0004
    2f9e:	0301                	addi	t1,t1,0
    2fa0:	0901                	addi	s2,s2,0
    2fa2:	0004                	.insn	2, 0x0004
    2fa4:	0301                	addi	t1,t1,0
    2fa6:	0901                	addi	s2,s2,0
    2fa8:	0002                	c.slli64	zero
    2faa:	0301                	addi	t1,t1,0
    2fac:	0901                	addi	s2,s2,0
    2fae:	0002                	c.slli64	zero
    2fb0:	0301                	addi	t1,t1,0
    2fb2:	0902                	c.slli64	s2
    2fb4:	0004                	.insn	2, 0x0004
    2fb6:	0301                	addi	t1,t1,0
    2fb8:	0902                	c.slli64	s2
    2fba:	0002                	c.slli64	zero
    2fbc:	0301                	addi	t1,t1,0
    2fbe:	0901                	addi	s2,s2,0
    2fc0:	0004                	.insn	2, 0x0004
    2fc2:	0301                	addi	t1,t1,0
    2fc4:	0901                	addi	s2,s2,0
    2fc6:	0002                	c.slli64	zero
    2fc8:	0301                	addi	t1,t1,0
    2fca:	0902                	c.slli64	s2
    2fcc:	0002                	c.slli64	zero
    2fce:	0301                	addi	t1,t1,0
    2fd0:	0901                	addi	s2,s2,0
    2fd2:	0002                	c.slli64	zero
    2fd4:	0301                	addi	t1,t1,0
    2fd6:	0901                	addi	s2,s2,0
    2fd8:	0002                	c.slli64	zero
    2fda:	0301                	addi	t1,t1,0
    2fdc:	0902                	c.slli64	s2
    2fde:	0002                	c.slli64	zero
    2fe0:	0301                	addi	t1,t1,0
    2fe2:	0906                	slli	s2,s2,0x1
    2fe4:	0002                	c.slli64	zero
    2fe6:	0301                	addi	t1,t1,0
    2fe8:	0901                	addi	s2,s2,0
    2fea:	0002                	c.slli64	zero
    2fec:	0301                	addi	t1,t1,0
    2fee:	0901                	addi	s2,s2,0
    2ff0:	0002                	c.slli64	zero
    2ff2:	0301                	addi	t1,t1,0
    2ff4:	0901                	addi	s2,s2,0
    2ff6:	0002                	c.slli64	zero
    2ff8:	0301                	addi	t1,t1,0
    2ffa:	0905                	addi	s2,s2,1
    2ffc:	0002                	c.slli64	zero
    2ffe:	0301                	addi	t1,t1,0
    3000:	0902                	c.slli64	s2
    3002:	0004                	.insn	2, 0x0004
    3004:	0301                	addi	t1,t1,0
    3006:	0902                	c.slli64	s2
    3008:	0004                	.insn	2, 0x0004
    300a:	0301                	addi	t1,t1,0
    300c:	0901                	addi	s2,s2,0
    300e:	0004                	.insn	2, 0x0004
    3010:	0301                	addi	t1,t1,0
    3012:	0902                	c.slli64	s2
    3014:	0002                	c.slli64	zero
    3016:	0301                	addi	t1,t1,0
    3018:	0902                	c.slli64	s2
    301a:	0004                	.insn	2, 0x0004
    301c:	0301                	addi	t1,t1,0
    301e:	0901                	addi	s2,s2,0
    3020:	0002                	c.slli64	zero
    3022:	0301                	addi	t1,t1,0
    3024:	0901                	addi	s2,s2,0
    3026:	0002                	c.slli64	zero
    3028:	0301                	addi	t1,t1,0
    302a:	0901                	addi	s2,s2,0
    302c:	0004                	.insn	2, 0x0004
    302e:	0301                	addi	t1,t1,0
    3030:	0904                	addi	s1,sp,144
    3032:	0002                	c.slli64	zero
    3034:	0301                	addi	t1,t1,0
    3036:	0901                	addi	s2,s2,0
    3038:	0002                	c.slli64	zero
    303a:	0301                	addi	t1,t1,0
    303c:	0901                	addi	s2,s2,0
    303e:	0004                	.insn	2, 0x0004
    3040:	0301                	addi	t1,t1,0
    3042:	0902                	c.slli64	s2
    3044:	0004                	.insn	2, 0x0004
    3046:	0301                	addi	t1,t1,0
    3048:	0901                	addi	s2,s2,0
    304a:	0002                	c.slli64	zero
    304c:	0301                	addi	t1,t1,0
    304e:	0901                	addi	s2,s2,0
    3050:	0002                	c.slli64	zero
    3052:	0301                	addi	t1,t1,0
    3054:	0902                	c.slli64	s2
    3056:	0002                	c.slli64	zero
    3058:	0301                	addi	t1,t1,0
    305a:	0901                	addi	s2,s2,0
    305c:	0004                	.insn	2, 0x0004
    305e:	0301                	addi	t1,t1,0
    3060:	0902                	c.slli64	s2
    3062:	0004                	.insn	2, 0x0004
    3064:	0301                	addi	t1,t1,0
    3066:	0901                	addi	s2,s2,0
    3068:	0004                	.insn	2, 0x0004
    306a:	0301                	addi	t1,t1,0
    306c:	0901                	addi	s2,s2,0
    306e:	0002                	c.slli64	zero
    3070:	0301                	addi	t1,t1,0
    3072:	0901                	addi	s2,s2,0
    3074:	0004                	.insn	2, 0x0004
    3076:	0901                	addi	s2,s2,0
    3078:	0002                	c.slli64	zero
    307a:	0100                	addi	s0,sp,128
    307c:	01                	.byte	0x01

セクション .debug_loc の逆アセンブル:

00000000 <$d.2>:
       0:	0090                	addi	a2,sp,64
       2:	0000                	unimp
       4:	00a0                	addi	s0,sp,72
       6:	0000                	unimp
       8:	0001                	nop
       a:	005f 0000 0000      	.insn	6, 0x005f
      10:	0000                	unimp
      12:	b000                	.insn	2, 0xb000
      14:	0000                	unimp
      16:	b400                	.insn	2, 0xb400
      18:	0000                	unimp
      1a:	0e00                	addi	s0,sp,784
      1c:	7a00                	.insn	2, 0x7a00
      1e:	1100                	addi	s0,sp,160
      20:	7f9c                	.insn	2, 0x7f9c
      22:	111c                	addi	a5,sp,160
      24:	e3111e7f b89f2200 	.insn	12, 0xbc000000b89f2200e3111e7f
      2c:	bc000000 
      30:	0000                	unimp
      32:	0300                	addi	s0,sp,384
      34:	7a00                	.insn	2, 0x7a00
      36:	00009f7f 00000000 	.insn	12, 0x00ec00000000000000009f7f
      3e:	00ec0000 
      42:	0000                	unimp
      44:	00fc                	addi	a5,sp,76
      46:	0000                	unimp
      48:	0001                	nop
      4a:	005f 0000 0000      	.insn	6, 0x005f
      50:	0000                	unimp
      52:	0c00                	addi	s0,sp,528
      54:	0001                	nop
      56:	1000                	addi	s0,sp,32
      58:	0001                	nop
      5a:	0e00                	addi	s0,sp,784
      5c:	7a00                	.insn	2, 0x7a00
      5e:	1100                	addi	s0,sp,160
      60:	7f9c                	.insn	2, 0x7f9c
      62:	111c                	addi	a5,sp,160
      64:	e3111e7f 149f2200 	.insn	12, 0x18000001149f2200e3111e7f
      6c:	18000001 
      70:	0001                	nop
      72:	0300                	addi	s0,sp,384
      74:	7a00                	.insn	2, 0x7a00
      76:	00009f7f 00000000 	.insn	12, 0x011800000000000000009f7f
      7e:	01180000 
      82:	0000                	unimp
      84:	0130                	addi	a2,sp,136
      86:	0000                	unimp
      88:	0005                	c.nop	1
      8a:	d010                	sw	a2,32(s0)
      8c:	0386                	slli	t2,t2,0x1
      8e:	309f 0001 3400      	.insn	6, 0x34000001309f
      94:	0001                	nop
      96:	1000                	addi	s0,sp,32
      98:	7b00                	.insn	2, 0x7b00
      9a:	1100                	addi	s0,sp,160
      9c:	f9b0                	.insn	2, 0xf9b0
      9e:	1c7c                	addi	a5,sp,572
      a0:	7f11                	lui	t5,0xfffe4
      a2:	111e                	slli	sp,sp,0x27
      a4:	220386cf          	.insn	4, 0x220386cf
      a8:	009f 0000 0000      	.insn	6, 0x009f
      ae:	0000                	unimp
      b0:	4c00                	lw	s0,24(s0)
      b2:	0001                	nop
      b4:	5000                	lw	s0,32(s0)
      b6:	0001                	nop
      b8:	0e00                	addi	s0,sp,784
      ba:	7a00                	.insn	2, 0x7a00
      bc:	1100                	addi	s0,sp,160
      be:	7f9c                	.insn	2, 0x7f9c
      c0:	111c                	addi	a5,sp,160
      c2:	e3111e7f 549f2200 	.insn	12, 0x58000001549f2200e3111e7f
      ca:	58000001 
      ce:	0001                	nop
      d0:	0300                	addi	s0,sp,384
      d2:	7a00                	.insn	2, 0x7a00
      d4:	00009f7f 00000000 	.insn	12, 0x01a000000000000000009f7f
      dc:	01a00000 
      e0:	0000                	unimp
      e2:	01b0                	addi	a2,sp,200
      e4:	0000                	unimp
      e6:	0001                	nop
      e8:	005f 0000 0000      	.insn	6, 0x005f
      ee:	0000                	unimp
      f0:	0400                	addi	s0,sp,512
      f2:	0002                	c.slli64	zero
      f4:	1400                	addi	s0,sp,544
      f6:	0002                	c.slli64	zero
      f8:	0100                	addi	s0,sp,128
      fa:	5f00                	lw	s0,56(a4)
	...
     104:	024c                	addi	a1,sp,260
     106:	0000                	unimp
     108:	025c                	addi	a5,sp,260
     10a:	0000                	unimp
     10c:	0001                	nop
     10e:	005f 0000 0000      	.insn	6, 0x005f
     114:	0000                	unimp
     116:	9000                	.insn	2, 0x9000
     118:	0002                	c.slli64	zero
     11a:	a000                	.insn	2, 0xa000
     11c:	0002                	c.slli64	zero
     11e:	0100                	addi	s0,sp,128
     120:	5f00                	lw	s0,56(a4)
	...
     12a:	02f8                	addi	a4,sp,332
     12c:	0000                	unimp
     12e:	0308                	addi	a0,sp,384
     130:	0000                	unimp
     132:	0001                	nop
     134:	005f 0000 0000      	.insn	6, 0x005f
     13a:	0000                	unimp
     13c:	7000                	.insn	2, 0x7000
     13e:	0004                	.insn	2, 0x0004
     140:	c800                	sw	s0,16(s0)
     142:	000a                	c.slli	zero,0x2
     144:	0100                	addi	s0,sp,128
     146:	5a00                	lw	s0,48(a2)
     148:	0adc                	addi	a5,sp,340
     14a:	0000                	unimp
     14c:	0b70                	addi	a2,sp,412
     14e:	0000                	unimp
     150:	0001                	nop
     152:	845a                	mv	s0,s6
     154:	1800000b          	.insn	4, 0x1800000b
     158:	000c                	.insn	2, 0x000c
     15a:	0100                	addi	s0,sp,128
     15c:	5a00                	lw	s0,48(a2)
     15e:	0c74                	addi	a3,sp,540
     160:	0000                	unimp
     162:	0c78                	addi	a4,sp,540
     164:	0000                	unimp
     166:	0001                	nop
     168:	005a                	c.slli	zero,0x16
     16a:	0000                	unimp
     16c:	0000                	unimp
     16e:	0000                	unimp
     170:	7000                	.insn	2, 0x7000
     172:	0004                	.insn	2, 0x0004
     174:	3800                	.insn	2, 0x3800
     176:	000a                	c.slli	zero,0x2
     178:	0100                	addi	s0,sp,128
     17a:	5b00                	lw	s0,48(a4)
     17c:	0adc                	addi	a5,sp,340
     17e:	0000                	unimp
     180:	0ae0                	addi	s0,sp,348
     182:	0000                	unimp
     184:	0001                	nop
     186:	000b845b          	.insn	4, 0x000b845b
     18a:	8800                	.insn	2, 0x8800
     18c:	0100000b          	.insn	4, 0x0100000b
     190:	5b00                	lw	s0,48(a4)
     192:	0c74                	addi	a3,sp,540
     194:	0000                	unimp
     196:	0c7c                	addi	a5,sp,540
     198:	0000                	unimp
     19a:	0001                	nop
     19c:	0000005b          	.insn	4, 0x005b
     1a0:	0000                	unimp
     1a2:	0000                	unimp
     1a4:	a400                	.insn	2, 0xa400
     1a6:	0004                	.insn	2, 0x0004
     1a8:	f800                	.insn	2, 0xf800
     1aa:	0004                	.insn	2, 0x0004
     1ac:	0200                	addi	s0,sp,256
     1ae:	3000                	.insn	2, 0x3000
     1b0:	f89f 0004 3400      	.insn	6, 0x34000004f89f
     1b6:	000a                	c.slli	zero,0x2
     1b8:	0100                	addi	s0,sp,128
     1ba:	5c00                	lw	s0,56(s0)
     1bc:	0b84                	addi	s1,sp,464
     1be:	0000                	unimp
     1c0:	0b90                	addi	a2,sp,464
     1c2:	0000                	unimp
     1c4:	0001                	nop
     1c6:	005c                	addi	a5,sp,4
     1c8:	0000                	unimp
     1ca:	0000                	unimp
     1cc:	0000                	unimp
     1ce:	fc00                	.insn	2, 0xfc00
     1d0:	0004                	.insn	2, 0x0004
     1d2:	0000                	unimp
     1d4:	0005                	c.nop	1
     1d6:	0300                	addi	s0,sp,384
     1d8:	1000                	addi	s0,sp,32
     1da:	9f31                	.insn	2, 0x9f31
     1dc:	0500                	addi	s0,sp,640
     1de:	0000                	unimp
     1e0:	0504                	addi	s1,sp,640
     1e2:	0000                	unimp
     1e4:	30100003          	lb	zero,769(zero) # 301 <$d.6+0x7f>
     1e8:	049f 0005 0800      	.insn	6, 0x08000005049f
     1ee:	0005                	c.nop	1
     1f0:	0300                	addi	s0,sp,384
     1f2:	1000                	addi	s0,sp,32
     1f4:	05089f2f          	.insn	4, 0x05089f2f
     1f8:	0000                	unimp
     1fa:	050c                	addi	a1,sp,640
     1fc:	0000                	unimp
     1fe:	2e100003          	lb	zero,737(zero) # 2e1 <$d.6+0x5f>
     202:	0c9f 0005 1000      	.insn	6, 0x100000050c9f
     208:	0005                	c.nop	1
     20a:	0300                	addi	s0,sp,384
     20c:	1000                	addi	s0,sp,32
     20e:	9f2d                	.insn	2, 0x9f2d
     210:	0510                	addi	a2,sp,640
     212:	0000                	unimp
     214:	0514                	addi	a3,sp,640
     216:	0000                	unimp
     218:	2c100003          	lb	zero,705(zero) # 2c1 <$d.6+0x3f>
     21c:	149f 0005 1800      	.insn	6, 0x18000005149f
     222:	0005                	c.nop	1
     224:	0300                	addi	s0,sp,384
     226:	1000                	addi	s0,sp,32
     228:	05189f2b          	.insn	4, 0x05189f2b
     22c:	0000                	unimp
     22e:	051c                	addi	a5,sp,640
     230:	0000                	unimp
     232:	2a100003          	lb	zero,673(zero) # 2a1 <$d.6+0x1f>
     236:	1c9f 0005 2000      	.insn	6, 0x200000051c9f
     23c:	0005                	c.nop	1
     23e:	0300                	addi	s0,sp,384
     240:	1000                	addi	s0,sp,32
     242:	9f29                	.insn	2, 0x9f29
     244:	0520                	addi	s0,sp,648
     246:	0000                	unimp
     248:	0524                	addi	s1,sp,648
     24a:	0000                	unimp
     24c:	28100003          	lb	zero,641(zero) # 281 <$d.3+0x28>
     250:	249f 0005 2800      	.insn	6, 0x28000005249f
     256:	0005                	c.nop	1
     258:	0300                	addi	s0,sp,384
     25a:	1000                	addi	s0,sp,32
     25c:	05289f27          	.insn	4, 0x05289f27
     260:	0000                	unimp
     262:	052c                	addi	a1,sp,648
     264:	0000                	unimp
     266:	26100003          	lb	zero,609(zero) # 261 <$d.3+0x8>
     26a:	2c9f 0005 3000      	.insn	6, 0x300000052c9f
     270:	0005                	c.nop	1
     272:	0300                	addi	s0,sp,384
     274:	1000                	addi	s0,sp,32
     276:	9f25                	.insn	2, 0x9f25
     278:	0530                	addi	a2,sp,648
     27a:	0000                	unimp
     27c:	0534                	addi	a3,sp,648
     27e:	0000                	unimp
     280:	24100003          	lb	zero,577(zero) # 241 <$d.5+0x21>
     284:	349f 0005 3800      	.insn	6, 0x38000005349f
     28a:	0005                	c.nop	1
     28c:	0300                	addi	s0,sp,384
     28e:	1000                	addi	s0,sp,32
     290:	05389f23          	sh	s3,94(a7)
     294:	0000                	unimp
     296:	053c                	addi	a5,sp,648
     298:	0000                	unimp
     29a:	22100003          	lb	zero,545(zero) # 221 <$d.5+0x1>
     29e:	3c9f 0005 4000      	.insn	6, 0x400000053c9f
     2a4:	0005                	c.nop	1
     2a6:	0300                	addi	s0,sp,384
     2a8:	1000                	addi	s0,sp,32
     2aa:	9f21                	.insn	2, 0x9f21
     2ac:	0540                	addi	s0,sp,644
     2ae:	0000                	unimp
     2b0:	0544                	addi	s1,sp,644
     2b2:	0000                	unimp
     2b4:	20100003          	lb	zero,513(zero) # 201 <$d.12+0x31>
     2b8:	449f 0005 4800      	.insn	6, 0x48000005449f
     2be:	0005                	c.nop	1
     2c0:	0200                	addi	s0,sp,256
     2c2:	4f00                	lw	s0,24(a4)
     2c4:	489f 0005 4c00      	.insn	6, 0x4c000005489f
     2ca:	0005                	c.nop	1
     2cc:	0200                	addi	s0,sp,256
     2ce:	4e00                	lw	s0,24(a2)
     2d0:	4c9f 0005 5000      	.insn	6, 0x500000054c9f
     2d6:	0005                	c.nop	1
     2d8:	0200                	addi	s0,sp,256
     2da:	4d00                	lw	s0,24(a0)
     2dc:	509f 0005 5400      	.insn	6, 0x54000005509f
     2e2:	0005                	c.nop	1
     2e4:	0200                	addi	s0,sp,256
     2e6:	4c00                	lw	s0,24(s0)
     2e8:	549f 0005 5800      	.insn	6, 0x58000005549f
     2ee:	0005                	c.nop	1
     2f0:	0200                	addi	s0,sp,256
     2f2:	4b00                	lw	s0,16(a4)
     2f4:	589f 0005 5c00      	.insn	6, 0x5c000005589f
     2fa:	0005                	c.nop	1
     2fc:	0200                	addi	s0,sp,256
     2fe:	4a00                	lw	s0,16(a2)
     300:	5c9f 0005 6000      	.insn	6, 0x600000055c9f
     306:	0005                	c.nop	1
     308:	0200                	addi	s0,sp,256
     30a:	4900                	lw	s0,16(a0)
     30c:	609f 0005 6400      	.insn	6, 0x64000005609f
     312:	0005                	c.nop	1
     314:	0200                	addi	s0,sp,256
     316:	4800                	lw	s0,16(s0)
     318:	649f 0005 6800      	.insn	6, 0x68000005649f
     31e:	0005                	c.nop	1
     320:	0200                	addi	s0,sp,256
     322:	4700                	lw	s0,8(a4)
     324:	689f 0005 6c00      	.insn	6, 0x6c000005689f
     32a:	0005                	c.nop	1
     32c:	0200                	addi	s0,sp,256
     32e:	4600                	lw	s0,8(a2)
     330:	6c9f 0005 7000      	.insn	6, 0x700000056c9f
     336:	0005                	c.nop	1
     338:	0200                	addi	s0,sp,256
     33a:	4500                	lw	s0,8(a0)
     33c:	709f 0005 7400      	.insn	6, 0x74000005709f
     342:	0005                	c.nop	1
     344:	0200                	addi	s0,sp,256
     346:	4400                	lw	s0,8(s0)
     348:	749f 0005 7800      	.insn	6, 0x78000005749f
     34e:	0005                	c.nop	1
     350:	0200                	addi	s0,sp,256
     352:	4300                	lw	s0,0(a4)
     354:	789f 0005 7c00      	.insn	6, 0x7c000005789f
     35a:	0005                	c.nop	1
     35c:	0200                	addi	s0,sp,256
     35e:	4200                	lw	s0,0(a2)
     360:	7c9f 0005 8000      	.insn	6, 0x800000057c9f
     366:	0005                	c.nop	1
     368:	0200                	addi	s0,sp,256
     36a:	4100                	lw	s0,0(a0)
     36c:	809f 0005 8400      	.insn	6, 0x84000005809f
     372:	0005                	c.nop	1
     374:	0200                	addi	s0,sp,256
     376:	4000                	lw	s0,0(s0)
     378:	849f 0005 8800      	.insn	6, 0x88000005849f
     37e:	0005                	c.nop	1
     380:	0200                	addi	s0,sp,256
     382:	3f00                	.insn	2, 0x3f00
     384:	889f 0005 8c00      	.insn	6, 0x8c000005889f
     38a:	0005                	c.nop	1
     38c:	0200                	addi	s0,sp,256
     38e:	3e00                	.insn	2, 0x3e00
     390:	8c9f 0005 9000      	.insn	6, 0x900000058c9f
     396:	0005                	c.nop	1
     398:	0200                	addi	s0,sp,256
     39a:	3d00                	.insn	2, 0x3d00
     39c:	909f 0005 9400      	.insn	6, 0x94000005909f
     3a2:	0005                	c.nop	1
     3a4:	0200                	addi	s0,sp,256
     3a6:	3c00                	.insn	2, 0x3c00
     3a8:	949f 0005 9800      	.insn	6, 0x98000005949f
     3ae:	0005                	c.nop	1
     3b0:	0200                	addi	s0,sp,256
     3b2:	3b00                	.insn	2, 0x3b00
     3b4:	989f 0005 9c00      	.insn	6, 0x9c000005989f
     3ba:	0005                	c.nop	1
     3bc:	0200                	addi	s0,sp,256
     3be:	3a00                	.insn	2, 0x3a00
     3c0:	9c9f 0005 a000      	.insn	6, 0xa00000059c9f
     3c6:	0005                	c.nop	1
     3c8:	0200                	addi	s0,sp,256
     3ca:	3900                	.insn	2, 0x3900
     3cc:	a09f 0005 a400      	.insn	6, 0xa4000005a09f
     3d2:	0005                	c.nop	1
     3d4:	0200                	addi	s0,sp,256
     3d6:	3800                	.insn	2, 0x3800
     3d8:	a49f 0005 a800      	.insn	6, 0xa8000005a49f
     3de:	0005                	c.nop	1
     3e0:	0200                	addi	s0,sp,256
     3e2:	3700                	.insn	2, 0x3700
     3e4:	a89f 0005 ac00      	.insn	6, 0xac000005a89f
     3ea:	0005                	c.nop	1
     3ec:	0200                	addi	s0,sp,256
     3ee:	3600                	.insn	2, 0x3600
     3f0:	ac9f 0005 b000      	.insn	6, 0xb0000005ac9f
     3f6:	0005                	c.nop	1
     3f8:	0200                	addi	s0,sp,256
     3fa:	3500                	.insn	2, 0x3500
     3fc:	b09f 0005 b400      	.insn	6, 0xb4000005b09f
     402:	0005                	c.nop	1
     404:	0200                	addi	s0,sp,256
     406:	3400                	.insn	2, 0x3400
     408:	b49f 0005 b800      	.insn	6, 0xb8000005b49f
     40e:	0005                	c.nop	1
     410:	0200                	addi	s0,sp,256
     412:	3300                	.insn	2, 0x3300
     414:	b89f 0005 bc00      	.insn	6, 0xbc000005b89f
     41a:	0005                	c.nop	1
     41c:	0200                	addi	s0,sp,256
     41e:	3200                	.insn	2, 0x3200
     420:	bc9f 0005 c000      	.insn	6, 0xc0000005bc9f
     426:	0005                	c.nop	1
     428:	0200                	addi	s0,sp,256
     42a:	3100                	.insn	2, 0x3100
     42c:	c09f 0005 c400      	.insn	6, 0xc4000005c09f
     432:	0005                	c.nop	1
     434:	0200                	addi	s0,sp,256
     436:	3000                	.insn	2, 0x3000
     438:	c49f 0005 a000      	.insn	6, 0xa0000005c49f
     43e:	0006                	c.slli	zero,0x1
     440:	0400                	addi	s0,sp,512
     442:	3000                	.insn	2, 0x3000
     444:	1c31                	addi	s8,s8,-20
     446:	009f 0000 0000      	.insn	6, 0x009f
     44c:	0000                	unimp
     44e:	cc00                	sw	s0,24(s0)
     450:	0005                	c.nop	1
     452:	d000                	sw	s0,32(s0)
     454:	0005                	c.nop	1
     456:	0300                	addi	s0,sp,384
     458:	1000                	addi	s0,sp,32
     45a:	9f31                	.insn	2, 0x9f31
     45c:	05d0                	addi	a2,sp,708
     45e:	0000                	unimp
     460:	05d4                	addi	a3,sp,708
     462:	0000                	unimp
     464:	30100003          	lb	zero,769(zero) # 301 <$d.6+0x7f>
     468:	d49f 0005 d800      	.insn	6, 0xd8000005d49f
     46e:	0005                	c.nop	1
     470:	0300                	addi	s0,sp,384
     472:	1000                	addi	s0,sp,32
     474:	05d89f2f          	.insn	4, 0x05d89f2f
     478:	0000                	unimp
     47a:	05dc                	addi	a5,sp,708
     47c:	0000                	unimp
     47e:	2e100003          	lb	zero,737(zero) # 2e1 <$d.6+0x5f>
     482:	dc9f 0005 e000      	.insn	6, 0xe0000005dc9f
     488:	0005                	c.nop	1
     48a:	0300                	addi	s0,sp,384
     48c:	1000                	addi	s0,sp,32
     48e:	9f2d                	.insn	2, 0x9f2d
     490:	05e0                	addi	s0,sp,716
     492:	0000                	unimp
     494:	05e4                	addi	s1,sp,716
     496:	0000                	unimp
     498:	2c100003          	lb	zero,705(zero) # 2c1 <$d.6+0x3f>
     49c:	e49f 0005 e800      	.insn	6, 0xe8000005e49f
     4a2:	0005                	c.nop	1
     4a4:	0300                	addi	s0,sp,384
     4a6:	1000                	addi	s0,sp,32
     4a8:	05e89f2b          	.insn	4, 0x05e89f2b
     4ac:	0000                	unimp
     4ae:	05ec                	addi	a1,sp,716
     4b0:	0000                	unimp
     4b2:	2a100003          	lb	zero,673(zero) # 2a1 <$d.6+0x1f>
     4b6:	ec9f 0005 f000      	.insn	6, 0xf0000005ec9f
     4bc:	0005                	c.nop	1
     4be:	0300                	addi	s0,sp,384
     4c0:	1000                	addi	s0,sp,32
     4c2:	9f29                	.insn	2, 0x9f29
     4c4:	05f0                	addi	a2,sp,716
     4c6:	0000                	unimp
     4c8:	05f4                	addi	a3,sp,716
     4ca:	0000                	unimp
     4cc:	28100003          	lb	zero,641(zero) # 281 <$d.3+0x28>
     4d0:	f49f 0005 f800      	.insn	6, 0xf8000005f49f
     4d6:	0005                	c.nop	1
     4d8:	0300                	addi	s0,sp,384
     4da:	1000                	addi	s0,sp,32
     4dc:	05f89f27          	.insn	4, 0x05f89f27
     4e0:	0000                	unimp
     4e2:	05fc                	addi	a5,sp,716
     4e4:	0000                	unimp
     4e6:	26100003          	lb	zero,609(zero) # 261 <$d.3+0x8>
     4ea:	fc9f 0005 0000      	.insn	6, 0x0005fc9f
     4f0:	0006                	c.slli	zero,0x1
     4f2:	0300                	addi	s0,sp,384
     4f4:	1000                	addi	s0,sp,32
     4f6:	9f25                	.insn	2, 0x9f25
     4f8:	0600                	addi	s0,sp,768
     4fa:	0000                	unimp
     4fc:	0604                	addi	s1,sp,768
     4fe:	0000                	unimp
     500:	24100003          	lb	zero,577(zero) # 241 <$d.5+0x21>
     504:	049f 0006 0800      	.insn	6, 0x08000006049f
     50a:	0006                	c.slli	zero,0x1
     50c:	0300                	addi	s0,sp,384
     50e:	1000                	addi	s0,sp,32
     510:	06089f23          	sh	zero,126(a7)
     514:	0000                	unimp
     516:	060c                	addi	a1,sp,768
     518:	0000                	unimp
     51a:	22100003          	lb	zero,545(zero) # 221 <$d.5+0x1>
     51e:	0c9f 0006 1000      	.insn	6, 0x100000060c9f
     524:	0006                	c.slli	zero,0x1
     526:	0300                	addi	s0,sp,384
     528:	1000                	addi	s0,sp,32
     52a:	9f21                	.insn	2, 0x9f21
     52c:	0610                	addi	a2,sp,768
     52e:	0000                	unimp
     530:	0614                	addi	a3,sp,768
     532:	0000                	unimp
     534:	20100003          	lb	zero,513(zero) # 201 <$d.12+0x31>
     538:	149f 0006 1800      	.insn	6, 0x18000006149f
     53e:	0006                	c.slli	zero,0x1
     540:	0200                	addi	s0,sp,256
     542:	4f00                	lw	s0,24(a4)
     544:	189f 0006 1c00      	.insn	6, 0x1c000006189f
     54a:	0006                	c.slli	zero,0x1
     54c:	0200                	addi	s0,sp,256
     54e:	4e00                	lw	s0,24(a2)
     550:	1c9f 0006 2000      	.insn	6, 0x200000061c9f
     556:	0006                	c.slli	zero,0x1
     558:	0200                	addi	s0,sp,256
     55a:	4d00                	lw	s0,24(a0)
     55c:	209f 0006 2400      	.insn	6, 0x24000006209f
     562:	0006                	c.slli	zero,0x1
     564:	0200                	addi	s0,sp,256
     566:	4c00                	lw	s0,24(s0)
     568:	249f 0006 2800      	.insn	6, 0x28000006249f
     56e:	0006                	c.slli	zero,0x1
     570:	0200                	addi	s0,sp,256
     572:	4b00                	lw	s0,16(a4)
     574:	289f 0006 2c00      	.insn	6, 0x2c000006289f
     57a:	0006                	c.slli	zero,0x1
     57c:	0200                	addi	s0,sp,256
     57e:	4a00                	lw	s0,16(a2)
     580:	2c9f 0006 3000      	.insn	6, 0x300000062c9f
     586:	0006                	c.slli	zero,0x1
     588:	0200                	addi	s0,sp,256
     58a:	4900                	lw	s0,16(a0)
     58c:	309f 0006 3400      	.insn	6, 0x34000006309f
     592:	0006                	c.slli	zero,0x1
     594:	0200                	addi	s0,sp,256
     596:	4800                	lw	s0,16(s0)
     598:	349f 0006 3800      	.insn	6, 0x38000006349f
     59e:	0006                	c.slli	zero,0x1
     5a0:	0200                	addi	s0,sp,256
     5a2:	4700                	lw	s0,8(a4)
     5a4:	389f 0006 3c00      	.insn	6, 0x3c000006389f
     5aa:	0006                	c.slli	zero,0x1
     5ac:	0200                	addi	s0,sp,256
     5ae:	4600                	lw	s0,8(a2)
     5b0:	3c9f 0006 4000      	.insn	6, 0x400000063c9f
     5b6:	0006                	c.slli	zero,0x1
     5b8:	0200                	addi	s0,sp,256
     5ba:	4500                	lw	s0,8(a0)
     5bc:	409f 0006 4400      	.insn	6, 0x44000006409f
     5c2:	0006                	c.slli	zero,0x1
     5c4:	0200                	addi	s0,sp,256
     5c6:	4400                	lw	s0,8(s0)
     5c8:	449f 0006 4800      	.insn	6, 0x48000006449f
     5ce:	0006                	c.slli	zero,0x1
     5d0:	0200                	addi	s0,sp,256
     5d2:	4300                	lw	s0,0(a4)
     5d4:	489f 0006 4c00      	.insn	6, 0x4c000006489f
     5da:	0006                	c.slli	zero,0x1
     5dc:	0200                	addi	s0,sp,256
     5de:	4200                	lw	s0,0(a2)
     5e0:	4c9f 0006 5000      	.insn	6, 0x500000064c9f
     5e6:	0006                	c.slli	zero,0x1
     5e8:	0200                	addi	s0,sp,256
     5ea:	4100                	lw	s0,0(a0)
     5ec:	509f 0006 5400      	.insn	6, 0x54000006509f
     5f2:	0006                	c.slli	zero,0x1
     5f4:	0200                	addi	s0,sp,256
     5f6:	4000                	lw	s0,0(s0)
     5f8:	549f 0006 5800      	.insn	6, 0x58000006549f
     5fe:	0006                	c.slli	zero,0x1
     600:	0200                	addi	s0,sp,256
     602:	3f00                	.insn	2, 0x3f00
     604:	589f 0006 5c00      	.insn	6, 0x5c000006589f
     60a:	0006                	c.slli	zero,0x1
     60c:	0200                	addi	s0,sp,256
     60e:	3e00                	.insn	2, 0x3e00
     610:	5c9f 0006 6000      	.insn	6, 0x600000065c9f
     616:	0006                	c.slli	zero,0x1
     618:	0200                	addi	s0,sp,256
     61a:	3d00                	.insn	2, 0x3d00
     61c:	609f 0006 6400      	.insn	6, 0x64000006609f
     622:	0006                	c.slli	zero,0x1
     624:	0200                	addi	s0,sp,256
     626:	3c00                	.insn	2, 0x3c00
     628:	649f 0006 6800      	.insn	6, 0x68000006649f
     62e:	0006                	c.slli	zero,0x1
     630:	0200                	addi	s0,sp,256
     632:	3b00                	.insn	2, 0x3b00
     634:	689f 0006 6c00      	.insn	6, 0x6c000006689f
     63a:	0006                	c.slli	zero,0x1
     63c:	0200                	addi	s0,sp,256
     63e:	3a00                	.insn	2, 0x3a00
     640:	6c9f 0006 7000      	.insn	6, 0x700000066c9f
     646:	0006                	c.slli	zero,0x1
     648:	0200                	addi	s0,sp,256
     64a:	3900                	.insn	2, 0x3900
     64c:	709f 0006 7400      	.insn	6, 0x74000006709f
     652:	0006                	c.slli	zero,0x1
     654:	0200                	addi	s0,sp,256
     656:	3800                	.insn	2, 0x3800
     658:	749f 0006 7800      	.insn	6, 0x78000006749f
     65e:	0006                	c.slli	zero,0x1
     660:	0200                	addi	s0,sp,256
     662:	3700                	.insn	2, 0x3700
     664:	789f 0006 7c00      	.insn	6, 0x7c000006789f
     66a:	0006                	c.slli	zero,0x1
     66c:	0200                	addi	s0,sp,256
     66e:	3600                	.insn	2, 0x3600
     670:	7c9f 0006 8000      	.insn	6, 0x800000067c9f
     676:	0006                	c.slli	zero,0x1
     678:	0200                	addi	s0,sp,256
     67a:	3500                	.insn	2, 0x3500
     67c:	809f 0006 8400      	.insn	6, 0x84000006809f
     682:	0006                	c.slli	zero,0x1
     684:	0200                	addi	s0,sp,256
     686:	3400                	.insn	2, 0x3400
     688:	849f 0006 8800      	.insn	6, 0x88000006849f
     68e:	0006                	c.slli	zero,0x1
     690:	0200                	addi	s0,sp,256
     692:	3300                	.insn	2, 0x3300
     694:	889f 0006 8c00      	.insn	6, 0x8c000006889f
     69a:	0006                	c.slli	zero,0x1
     69c:	0200                	addi	s0,sp,256
     69e:	3200                	.insn	2, 0x3200
     6a0:	8c9f 0006 9000      	.insn	6, 0x900000068c9f
     6a6:	0006                	c.slli	zero,0x1
     6a8:	0200                	addi	s0,sp,256
     6aa:	3100                	.insn	2, 0x3100
     6ac:	909f 0006 9400      	.insn	6, 0x94000006909f
     6b2:	0006                	c.slli	zero,0x1
     6b4:	0200                	addi	s0,sp,256
     6b6:	3000                	.insn	2, 0x3000
     6b8:	949f 0006 a000      	.insn	6, 0xa0000006949f
     6be:	0006                	c.slli	zero,0x1
     6c0:	0400                	addi	s0,sp,512
     6c2:	3000                	.insn	2, 0x3000
     6c4:	1c31                	addi	s8,s8,-20
     6c6:	009f 0000 0000      	.insn	6, 0x009f
     6cc:	0000                	unimp
     6ce:	9400                	.insn	2, 0x9400
     6d0:	0006                	c.slli	zero,0x1
     6d2:	a400                	.insn	2, 0xa400
     6d4:	0006                	c.slli	zero,0x1
     6d6:	0500                	addi	s0,sp,640
     6d8:	1000                	addi	s0,sp,32
     6da:	86d0                	.insn	2, 0x86d0
     6dc:	06a49f03          	lh	t5,106(s1)
     6e0:	0000                	unimp
     6e2:	06a8                	addi	a0,sp,840
     6e4:	0000                	unimp
     6e6:	0010                	.insn	2, 0x0010
     6e8:	0086                	slli	ra,ra,0x1
     6ea:	b011                	j	fffffeee <_stack_top+0xffef412e>
     6ec:	7cf9                	lui	s9,0xffffe
     6ee:	111c                	addi	a5,sp,160
     6f0:	cf111e7f 9f220386 	.insn	12, 0x07289f220386cf111e7f
     6f8:	00000728 
     6fc:	0738                	addi	a4,sp,904
     6fe:	0000                	unimp
     700:	0005                	c.nop	1
     702:	d010                	sw	a2,32(s0)
     704:	0386                	slli	t2,t2,0x1
     706:	389f 0007 3c00      	.insn	6, 0x3c000007389f
     70c:	10000007          	.insn	4, 0x10000007
     710:	8700                	.insn	2, 0x8700
     712:	1100                	addi	s0,sp,160
     714:	f9b0                	.insn	2, 0xf9b0
     716:	1c7c                	addi	a5,sp,572
     718:	7f11                	lui	t5,0xfffe4
     71a:	111e                	slli	sp,sp,0x27
     71c:	220386cf          	.insn	4, 0x220386cf
     720:	009f 0000 0000      	.insn	6, 0x009f
     726:	0000                	unimp
     728:	c000                	sw	s0,0(s0)
     72a:	0006                	c.slli	zero,0x1
     72c:	c400                	sw	s0,8(s0)
     72e:	0006                	c.slli	zero,0x1
     730:	0200                	addi	s0,sp,256
     732:	4300                	lw	s0,0(a4)
     734:	c49f 0006 c800      	.insn	6, 0xc8000006c49f
     73a:	0006                	c.slli	zero,0x1
     73c:	0200                	addi	s0,sp,256
     73e:	4200                	lw	s0,0(a2)
     740:	c89f 0006 cc00      	.insn	6, 0xcc000006c89f
     746:	0006                	c.slli	zero,0x1
     748:	0200                	addi	s0,sp,256
     74a:	4100                	lw	s0,0(a0)
     74c:	cc9f 0006 d000      	.insn	6, 0xd0000006cc9f
     752:	0006                	c.slli	zero,0x1
     754:	0200                	addi	s0,sp,256
     756:	4000                	lw	s0,0(s0)
     758:	d09f 0006 d400      	.insn	6, 0xd4000006d09f
     75e:	0006                	c.slli	zero,0x1
     760:	0200                	addi	s0,sp,256
     762:	3f00                	.insn	2, 0x3f00
     764:	d49f 0006 d800      	.insn	6, 0xd8000006d49f
     76a:	0006                	c.slli	zero,0x1
     76c:	0200                	addi	s0,sp,256
     76e:	3e00                	.insn	2, 0x3e00
     770:	d89f 0006 dc00      	.insn	6, 0xdc000006d89f
     776:	0006                	c.slli	zero,0x1
     778:	0200                	addi	s0,sp,256
     77a:	3d00                	.insn	2, 0x3d00
     77c:	dc9f 0006 e000      	.insn	6, 0xe0000006dc9f
     782:	0006                	c.slli	zero,0x1
     784:	0200                	addi	s0,sp,256
     786:	3c00                	.insn	2, 0x3c00
     788:	e09f 0006 e400      	.insn	6, 0xe4000006e09f
     78e:	0006                	c.slli	zero,0x1
     790:	0200                	addi	s0,sp,256
     792:	3b00                	.insn	2, 0x3b00
     794:	e49f 0006 e800      	.insn	6, 0xe8000006e49f
     79a:	0006                	c.slli	zero,0x1
     79c:	0200                	addi	s0,sp,256
     79e:	3a00                	.insn	2, 0x3a00
     7a0:	e89f 0006 ec00      	.insn	6, 0xec000006e89f
     7a6:	0006                	c.slli	zero,0x1
     7a8:	0200                	addi	s0,sp,256
     7aa:	3900                	.insn	2, 0x3900
     7ac:	ec9f 0006 f000      	.insn	6, 0xf0000006ec9f
     7b2:	0006                	c.slli	zero,0x1
     7b4:	0200                	addi	s0,sp,256
     7b6:	3800                	.insn	2, 0x3800
     7b8:	f09f 0006 f400      	.insn	6, 0xf4000006f09f
     7be:	0006                	c.slli	zero,0x1
     7c0:	0200                	addi	s0,sp,256
     7c2:	3700                	.insn	2, 0x3700
     7c4:	f49f 0006 f800      	.insn	6, 0xf8000006f49f
     7ca:	0006                	c.slli	zero,0x1
     7cc:	0200                	addi	s0,sp,256
     7ce:	3600                	.insn	2, 0x3600
     7d0:	f89f 0006 fc00      	.insn	6, 0xfc000006f89f
     7d6:	0006                	c.slli	zero,0x1
     7d8:	0200                	addi	s0,sp,256
     7da:	3500                	.insn	2, 0x3500
     7dc:	fc9f 0006 0000      	.insn	6, 0x0006fc9f
     7e2:	02000007          	.insn	4, 0x02000007
     7e6:	3400                	.insn	2, 0x3400
     7e8:	009f 0007 0400      	.insn	6, 0x04000007009f
     7ee:	02000007          	.insn	4, 0x02000007
     7f2:	3300                	.insn	2, 0x3300
     7f4:	049f 0007 0800      	.insn	6, 0x08000007049f
     7fa:	02000007          	.insn	4, 0x02000007
     7fe:	3200                	.insn	2, 0x3200
     800:	089f 0007 0c00      	.insn	6, 0x0c000007089f
     806:	02000007          	.insn	4, 0x02000007
     80a:	3100                	.insn	2, 0x3100
     80c:	0c9f 0007 1000      	.insn	6, 0x100000070c9f
     812:	02000007          	.insn	4, 0x02000007
     816:	3000                	.insn	2, 0x3000
     818:	109f 0007 1400      	.insn	6, 0x14000007109f
     81e:	04000007          	.insn	4, 0x04000007
     822:	3000                	.insn	2, 0x3000
     824:	1c31                	addi	s8,s8,-20
     826:	009f 0000 0000      	.insn	6, 0x009f
     82c:	0000                	unimp
     82e:	1400                	addi	s0,sp,544
     830:	54000007          	.insn	4, 0x54000007
     834:	01000007          	.insn	4, 0x01000007
     838:	6600                	.insn	2, 0x6600
     83a:	0af8                	addi	a4,sp,348
     83c:	0000                	unimp
     83e:	0b84                	addi	s1,sp,464
     840:	0000                	unimp
     842:	0001                	nop
     844:	0066                	c.slli	zero,0x19
     846:	0000                	unimp
     848:	0000                	unimp
     84a:	0000                	unimp
     84c:	5c00                	lw	s0,56(s0)
     84e:	28000007          	.insn	4, 0x28000007
     852:	0008                	.insn	2, 0x0008
     854:	0600                	addi	s0,sp,768
     856:	8600                	.insn	2, 0x8600
     858:	7b00                	.insn	2, 0x7b00
     85a:	1c00                	addi	s0,sp,560
     85c:	2c9f 0008 3000      	.insn	6, 0x300000082c9f
     862:	0008                	.insn	2, 0x0008
     864:	0900                	addi	s0,sp,144
     866:	8600                	.insn	2, 0x8600
     868:	7b00                	.insn	2, 0x7b00
     86a:	1c00                	addi	s0,sp,560
     86c:	0111                	addi	sp,sp,4
     86e:	9f22                	add	t5,t5,s0
	...
     878:	075c                	addi	a5,sp,900
     87a:	0000                	unimp
     87c:	0788                	addi	a0,sp,960
     87e:	0000                	unimp
     880:	0001                	nop
     882:	00078867          	jalr	a6,a5
     886:	a000                	.insn	2, 0xa000
     888:	01000007          	.insn	4, 0x01000007
     88c:	6800                	.insn	2, 0x6800
     88e:	07a0                	addi	s0,sp,968
     890:	0000                	unimp
     892:	07b8                	addi	a4,sp,968
     894:	0000                	unimp
     896:	0001                	nop
     898:	b869                	j	132 <$d.4+0x8f>
     89a:	d0000007          	.insn	4, 0xd0000007
     89e:	01000007          	.insn	4, 0x01000007
     8a2:	6a00                	.insn	2, 0x6a00
     8a4:	07d0                	addi	a2,sp,964
     8a6:	0000                	unimp
     8a8:	07e0                	addi	s0,sp,972
     8aa:	0000                	unimp
     8ac:	0001                	nop
     8ae:	00080067          	jr	a6
     8b2:	1000                	addi	s0,sp,32
     8b4:	0008                	.insn	2, 0x0008
     8b6:	0100                	addi	s0,sp,128
     8b8:	6800                	.insn	2, 0x6800
     8ba:	082c                	addi	a1,sp,24
     8bc:	0000                	unimp
     8be:	0830                	addi	a2,sp,24
     8c0:	0000                	unimp
     8c2:	0001                	nop
     8c4:	00000067          	jr	zero # 0 <$d.2>
     8c8:	0000                	unimp
     8ca:	0000                	unimp
     8cc:	7000                	.insn	2, 0x7000
     8ce:	88000007          	.insn	4, 0x88000007
     8d2:	03000007          	.insn	4, 0x03000007
     8d6:	1100                	addi	s0,sp,160
     8d8:	9f00                	.insn	2, 0x9f00
     8da:	0788                	addi	a0,sp,960
     8dc:	0000                	unimp
     8de:	07a0                	addi	s0,sp,968
     8e0:	0000                	unimp
     8e2:	01110003          	lb	zero,17(sp)
     8e6:	a09f 0007 b800      	.insn	6, 0xb8000007a09f
     8ec:	03000007          	.insn	4, 0x03000007
     8f0:	1100                	addi	s0,sp,160
     8f2:	9f02                	jalr	t5
     8f4:	07b8                	addi	a4,sp,968
     8f6:	0000                	unimp
     8f8:	07d0                	addi	a2,sp,964
     8fa:	0000                	unimp
     8fc:	03110003          	lb	zero,49(sp)
     900:	d09f 0007 e000      	.insn	6, 0xe0000007d09f
     906:	03000007          	.insn	4, 0x03000007
     90a:	1100                	addi	s0,sp,160
     90c:	9f04                	.insn	2, 0x9f04
     90e:	07e0                	addi	s0,sp,972
     910:	0000                	unimp
     912:	0800                	addi	s0,sp,16
     914:	0000                	unimp
     916:	05110003          	lb	zero,81(sp)
     91a:	009f 0008 1000      	.insn	6, 0x10000008009f
     920:	0008                	.insn	2, 0x0008
     922:	0300                	addi	s0,sp,384
     924:	1100                	addi	s0,sp,160
     926:	9f06                	add	t5,t5,ra
     928:	0810                	addi	a2,sp,16
     92a:	0000                	unimp
     92c:	0830                	addi	a2,sp,24
     92e:	0000                	unimp
     930:	07110003          	lb	zero,113(sp)
     934:	009f 0000 0000      	.insn	6, 0x009f
     93a:	0000                	unimp
     93c:	3000                	.insn	2, 0x3000
     93e:	0008                	.insn	2, 0x0008
     940:	3c00                	.insn	2, 0x3c00
     942:	0008                	.insn	2, 0x0008
     944:	0100                	addi	s0,sp,128
     946:	6700                	.insn	2, 0x6700
	...
     950:	0834                	addi	a3,sp,24
     952:	0000                	unimp
     954:	0838                	addi	a4,sp,24
     956:	0000                	unimp
     958:	0005                	c.nop	1
     95a:	0086                	slli	ra,ra,0x1
     95c:	2548                	.insn	2, 0x2548
     95e:	009f 0000 0000      	.insn	6, 0x009f
     964:	0000                	unimp
     966:	3400                	.insn	2, 0x3400
     968:	0008                	.insn	2, 0x0008
     96a:	3800                	.insn	2, 0x3800
     96c:	0008                	.insn	2, 0x0008
     96e:	0100                	addi	s0,sp,128
     970:	6600                	.insn	2, 0x6600
	...
     97a:	0838                	addi	a4,sp,24
     97c:	0000                	unimp
     97e:	0a08                	addi	a0,sp,272
     980:	0000                	unimp
     982:	0001                	nop
     984:	0066                	c.slli	zero,0x19
     986:	0000                	unimp
     988:	0000                	unimp
     98a:	0000                	unimp
     98c:	6800                	.insn	2, 0x6800
     98e:	0008                	.insn	2, 0x0008
     990:	7800                	.insn	2, 0x7800
     992:	0008                	.insn	2, 0x0008
     994:	0100                	addi	s0,sp,128
     996:	6a00                	.insn	2, 0x6a00
	...
     9a0:	0880                	addi	s0,sp,80
     9a2:	0000                	unimp
     9a4:	08b8                	addi	a4,sp,88
     9a6:	0000                	unimp
     9a8:	0001                	nop
     9aa:	b868                	.insn	2, 0xb868
     9ac:	0008                	.insn	2, 0x0008
     9ae:	c000                	sw	s0,0(s0)
     9b0:	0008                	.insn	2, 0x0008
     9b2:	0100                	addi	s0,sp,128
     9b4:	6900                	.insn	2, 0x6900
	...
     9be:	088c                	addi	a1,sp,80
     9c0:	0000                	unimp
     9c2:	0894                	addi	a3,sp,80
     9c4:	0000                	unimp
     9c6:	0001                	nop
     9c8:	9869                	andi	s0,s0,-6
     9ca:	0008                	.insn	2, 0x0008
     9cc:	9c00                	.insn	2, 0x9c00
     9ce:	0008                	.insn	2, 0x0008
     9d0:	0100                	addi	s0,sp,128
     9d2:	6900                	.insn	2, 0x6900
	...
     9dc:	08d4                	addi	a3,sp,84
     9de:	0000                	unimp
     9e0:	08e0                	addi	s0,sp,92
     9e2:	0000                	unimp
     9e4:	88100007          	.insn	4, 0x88100007
     9e8:	8080                	.insn	2, 0x8080
     9ea:	0180                	addi	s0,sp,192
     9ec:	ec9f 0008 f800      	.insn	6, 0xf8000008ec9f
     9f2:	0008                	.insn	2, 0x0008
     9f4:	0700                	addi	s0,sp,896
     9f6:	1000                	addi	s0,sp,32
     9f8:	8088                	.insn	2, 0x8088
     9fa:	8080                	.insn	2, 0x8080
     9fc:	9f01                	.insn	2, 0x9f01
     9fe:	0904                	addi	s1,sp,144
     a00:	0000                	unimp
     a02:	0910                	addi	a2,sp,144
     a04:	0000                	unimp
     a06:	88100007          	.insn	4, 0x88100007
     a0a:	8080                	.insn	2, 0x8080
     a0c:	0180                	addi	s0,sp,192
     a0e:	009f 0000 0000      	.insn	6, 0x009f
     a14:	0000                	unimp
     a16:	d000                	sw	s0,32(s0)
     a18:	0008                	.insn	2, 0x0008
     a1a:	d400                	sw	s0,40(s0)
     a1c:	0008                	.insn	2, 0x0008
     a1e:	0700                	addi	s0,sp,896
     a20:	1000                	addi	s0,sp,32
     a22:	8080                	.insn	2, 0x8080
     a24:	8080                	.insn	2, 0x8080
     a26:	9f01                	.insn	2, 0x9f01
     a28:	08e8                	addi	a0,sp,92
     a2a:	0000                	unimp
     a2c:	08ec                	addi	a1,sp,92
     a2e:	0000                	unimp
     a30:	80100007          	.insn	4, 0x80100007
     a34:	8080                	.insn	2, 0x8080
     a36:	0180                	addi	s0,sp,192
     a38:	009f 0009 0400      	.insn	6, 0x04000009009f
     a3e:	0009                	c.nop	2
     a40:	0700                	addi	s0,sp,896
     a42:	1000                	addi	s0,sp,32
     a44:	8080                	.insn	2, 0x8080
     a46:	8080                	.insn	2, 0x8080
     a48:	9f01                	.insn	2, 0x9f01
     a4a:	0918                	addi	a4,sp,144
     a4c:	0000                	unimp
     a4e:	0920                	addi	s0,sp,152
     a50:	0000                	unimp
     a52:	80100007          	.insn	4, 0x80100007
     a56:	8080                	.insn	2, 0x8080
     a58:	0180                	addi	s0,sp,192
     a5a:	009f 0000 0000      	.insn	6, 0x009f
     a60:	0000                	unimp
     a62:	d000                	sw	s0,32(s0)
     a64:	0008                	.insn	2, 0x0008
     a66:	d400                	sw	s0,40(s0)
     a68:	0008                	.insn	2, 0x0008
     a6a:	0300                	addi	s0,sp,384
     a6c:	1000                	addi	s0,sp,32
     a6e:	9f20                	.insn	2, 0x9f20
     a70:	08e8                	addi	a0,sp,92
     a72:	0000                	unimp
     a74:	08ec                	addi	a1,sp,92
     a76:	0000                	unimp
     a78:	73100003          	lb	zero,1841(zero) # 731 <$d.6+0xbe>
     a7c:	009f 0009 0400      	.insn	6, 0x04000009009f
     a82:	0009                	c.nop	2
     a84:	0300                	addi	s0,sp,384
     a86:	1000                	addi	s0,sp,32
     a88:	09189f77          	.insn	4, 0x09189f77
     a8c:	0000                	unimp
     a8e:	0920                	addi	s0,sp,152
     a90:	0000                	unimp
     a92:	3d100003          	lb	zero,977(zero) # 3d1 <$d.8+0x9>
     a96:	009f 0000 0000      	.insn	6, 0x009f
     a9c:	0000                	unimp
     a9e:	d400                	sw	s0,40(s0)
     aa0:	0008                	.insn	2, 0x0008
     aa2:	ec00                	.insn	2, 0xec00
     aa4:	0008                	.insn	2, 0x0008
     aa6:	0300                	addi	s0,sp,384
     aa8:	1000                	addi	s0,sp,32
     aaa:	08ec9f73          	.insn	4, 0x08ec9f73
     aae:	0000                	unimp
     ab0:	0904                	addi	s1,sp,144
     ab2:	0000                	unimp
     ab4:	77100003          	lb	zero,1905(zero) # 771 <$d.6+0xfe>
     ab8:	049f 0009 2000      	.insn	6, 0x20000009049f
     abe:	0009                	c.nop	2
     ac0:	0300                	addi	s0,sp,384
     ac2:	1000                	addi	s0,sp,32
     ac4:	9f3d                	.insn	2, 0x9f3d
	...
     ace:	0924                	addi	s1,sp,152
     ad0:	0000                	unimp
     ad2:	095c                	addi	a5,sp,148
     ad4:	0000                	unimp
     ad6:	0001                	nop
     ad8:	5c68                	lw	a0,124(s0)
     ada:	0009                	c.nop	2
     adc:	6400                	.insn	2, 0x6400
     ade:	0009                	c.nop	2
     ae0:	0100                	addi	s0,sp,128
     ae2:	6900                	.insn	2, 0x6900
	...
     aec:	0930                	addi	a2,sp,152
     aee:	0000                	unimp
     af0:	0938                	addi	a4,sp,152
     af2:	0000                	unimp
     af4:	0001                	nop
     af6:	3c69                	jal	590 <$d.3+0xd5>
     af8:	0009                	c.nop	2
     afa:	4000                	lw	s0,0(s0)
     afc:	0009                	c.nop	2
     afe:	0100                	addi	s0,sp,128
     b00:	6900                	.insn	2, 0x6900
	...
     b0a:	0978                	addi	a4,sp,156
     b0c:	0000                	unimp
     b0e:	0984                	addi	s1,sp,208
     b10:	0000                	unimp
     b12:	88100007          	.insn	4, 0x88100007
     b16:	8080                	.insn	2, 0x8080
     b18:	0180                	addi	s0,sp,192
     b1a:	909f 0009 9c00      	.insn	6, 0x9c000009909f
     b20:	0009                	c.nop	2
     b22:	0700                	addi	s0,sp,896
     b24:	1000                	addi	s0,sp,32
     b26:	8088                	.insn	2, 0x8088
     b28:	8080                	.insn	2, 0x8080
     b2a:	9f01                	.insn	2, 0x9f01
     b2c:	09a8                	addi	a0,sp,216
     b2e:	0000                	unimp
     b30:	09b4                	addi	a3,sp,216
     b32:	0000                	unimp
     b34:	88100007          	.insn	4, 0x88100007
     b38:	8080                	.insn	2, 0x8080
     b3a:	0180                	addi	s0,sp,192
     b3c:	009f 0000 0000      	.insn	6, 0x009f
     b42:	0000                	unimp
     b44:	7400                	.insn	2, 0x7400
     b46:	0009                	c.nop	2
     b48:	7800                	.insn	2, 0x7800
     b4a:	0009                	c.nop	2
     b4c:	0700                	addi	s0,sp,896
     b4e:	1000                	addi	s0,sp,32
     b50:	8080                	.insn	2, 0x8080
     b52:	8080                	.insn	2, 0x8080
     b54:	9f01                	.insn	2, 0x9f01
     b56:	098c                	addi	a1,sp,208
     b58:	0000                	unimp
     b5a:	0990                	addi	a2,sp,208
     b5c:	0000                	unimp
     b5e:	80100007          	.insn	4, 0x80100007
     b62:	8080                	.insn	2, 0x8080
     b64:	0180                	addi	s0,sp,192
     b66:	a49f 0009 a800      	.insn	6, 0xa8000009a49f
     b6c:	0009                	c.nop	2
     b6e:	0700                	addi	s0,sp,896
     b70:	1000                	addi	s0,sp,32
     b72:	8080                	.insn	2, 0x8080
     b74:	8080                	.insn	2, 0x8080
     b76:	9f01                	.insn	2, 0x9f01
     b78:	09bc                	addi	a5,sp,216
     b7a:	0000                	unimp
     b7c:	09c4                	addi	s1,sp,212
     b7e:	0000                	unimp
     b80:	80100007          	.insn	4, 0x80100007
     b84:	8080                	.insn	2, 0x8080
     b86:	0180                	addi	s0,sp,192
     b88:	009f 0000 0000      	.insn	6, 0x009f
     b8e:	0000                	unimp
     b90:	7400                	.insn	2, 0x7400
     b92:	0009                	c.nop	2
     b94:	7800                	.insn	2, 0x7800
     b96:	0009                	c.nop	2
     b98:	0300                	addi	s0,sp,384
     b9a:	1000                	addi	s0,sp,32
     b9c:	9f20                	.insn	2, 0x9f20
     b9e:	098c                	addi	a1,sp,208
     ba0:	0000                	unimp
     ba2:	0990                	addi	a2,sp,208
     ba4:	0000                	unimp
     ba6:	68100003          	lb	zero,1665(zero) # 681 <$d.6+0xe>
     baa:	a49f 0009 a800      	.insn	6, 0xa8000009a49f
     bb0:	0009                	c.nop	2
     bb2:	0300                	addi	s0,sp,384
     bb4:	1000                	addi	s0,sp,32
     bb6:	09bc9f77          	.insn	4, 0x09bc9f77
     bba:	0000                	unimp
     bbc:	09c4                	addi	s1,sp,212
     bbe:	0000                	unimp
     bc0:	3d100003          	lb	zero,977(zero) # 3d1 <$d.8+0x9>
     bc4:	009f 0000 0000      	.insn	6, 0x009f
     bca:	0000                	unimp
     bcc:	7800                	.insn	2, 0x7800
     bce:	0009                	c.nop	2
     bd0:	9000                	.insn	2, 0x9000
     bd2:	0009                	c.nop	2
     bd4:	0300                	addi	s0,sp,384
     bd6:	1000                	addi	s0,sp,32
     bd8:	9f68                	.insn	2, 0x9f68
     bda:	0990                	addi	a2,sp,208
     bdc:	0000                	unimp
     bde:	09a8                	addi	a0,sp,216
     be0:	0000                	unimp
     be2:	77100003          	lb	zero,1905(zero) # 771 <$d.6+0xfe>
     be6:	a89f 0009 c400      	.insn	6, 0xc4000009a89f
     bec:	0009                	c.nop	2
     bee:	0300                	addi	s0,sp,384
     bf0:	1000                	addi	s0,sp,32
     bf2:	9f3d                	.insn	2, 0x9f3d
	...
     bfc:	09c8                	addi	a0,sp,212
     bfe:	0000                	unimp
     c00:	0a00                	addi	s0,sp,272
     c02:	0000                	unimp
     c04:	0001                	nop
     c06:	000a0067          	jr	s4
     c0a:	0800                	addi	s0,sp,16
     c0c:	000a                	c.slli	zero,0x2
     c0e:	0100                	addi	s0,sp,128
     c10:	6800                	.insn	2, 0x6800
	...
     c1a:	09d4                	addi	a3,sp,212
     c1c:	0000                	unimp
     c1e:	09dc                	addi	a5,sp,212
     c20:	0000                	unimp
     c22:	0001                	nop
     c24:	e068                	.insn	2, 0xe068
     c26:	0009                	c.nop	2
     c28:	e400                	.insn	2, 0xe400
     c2a:	0009                	c.nop	2
     c2c:	0100                	addi	s0,sp,128
     c2e:	6800                	.insn	2, 0x6800
	...
     c38:	0a20                	addi	s0,sp,280
     c3a:	0000                	unimp
     c3c:	0a24                	addi	s1,sp,280
     c3e:	0000                	unimp
     c40:	000e                	c.slli	zero,0x3
     c42:	0086                	slli	ra,ra,0x1
     c44:	9c11                	.insn	2, 0x9c11
     c46:	7f111c7f 00e3111e 	.insn	12, 0x0a289f2200e3111e7f111c7f
     c4e:	0a289f22 
     c52:	0000                	unimp
     c54:	0a2c                	addi	a1,sp,280
     c56:	0000                	unimp
     c58:	7f860003          	lb	zero,2040(a2)
     c5c:	009f 0000 0000      	.insn	6, 0x009f
     c62:	0000                	unimp
     c64:	6800                	.insn	2, 0x6800
     c66:	000a                	c.slli	zero,0x2
     c68:	7800                	.insn	2, 0x7800
     c6a:	000a                	c.slli	zero,0x2
     c6c:	0100                	addi	s0,sp,128
     c6e:	6000                	.insn	2, 0x6000
	...
     c78:	0a88                	addi	a0,sp,336
     c7a:	0000                	unimp
     c7c:	0ac0                	addi	s0,sp,340
     c7e:	0000                	unimp
     c80:	0001                	nop
     c82:	c05d                	beqz	s0,d28 <$d.6+0x6b5>
     c84:	000a                	c.slli	zero,0x2
     c86:	c400                	sw	s0,8(s0)
     c88:	000a                	c.slli	zero,0x2
     c8a:	0100                	addi	s0,sp,128
     c8c:	5e00                	lw	s0,56(a2)
	...
     c96:	0a94                	addi	a3,sp,336
     c98:	0000                	unimp
     c9a:	0a9c                	addi	a5,sp,336
     c9c:	0000                	unimp
     c9e:	0001                	nop
     ca0:	a05e                	.insn	2, 0xa05e
     ca2:	000a                	c.slli	zero,0x2
     ca4:	a400                	.insn	2, 0xa400
     ca6:	000a                	c.slli	zero,0x2
     ca8:	0100                	addi	s0,sp,128
     caa:	5e00                	lw	s0,56(a2)
	...
     cb4:	0b10                	addi	a2,sp,400
     cb6:	0000                	unimp
     cb8:	0b20                	addi	s0,sp,408
     cba:	0000                	unimp
     cbc:	0001                	nop
     cbe:	0060                	addi	s0,sp,12
     cc0:	0000                	unimp
     cc2:	0000                	unimp
     cc4:	0000                	unimp
     cc6:	3000                	.insn	2, 0x3000
     cc8:	6800000b          	.insn	4, 0x6800000b
     ccc:	0100000b          	.insn	4, 0x0100000b
     cd0:	5d00                	lw	s0,56(a0)
     cd2:	0b68                	addi	a0,sp,412
     cd4:	0000                	unimp
     cd6:	0b6c                	addi	a1,sp,412
     cd8:	0000                	unimp
     cda:	0001                	nop
     cdc:	005e                	c.slli	zero,0x17
     cde:	0000                	unimp
     ce0:	0000                	unimp
     ce2:	0000                	unimp
     ce4:	3c00                	.insn	2, 0x3c00
     ce6:	4400000b          	.insn	4, 0x4400000b
     cea:	0100000b          	.insn	4, 0x0100000b
     cee:	5e00                	lw	s0,56(a2)
     cf0:	0b48                	addi	a0,sp,404
     cf2:	0000                	unimp
     cf4:	0b4c                	addi	a1,sp,404
     cf6:	0000                	unimp
     cf8:	0001                	nop
     cfa:	005e                	c.slli	zero,0x17
     cfc:	0000                	unimp
     cfe:	0000                	unimp
     d00:	0000                	unimp
     d02:	b800                	.insn	2, 0xb800
     d04:	c800000b          	.insn	4, 0xc800000b
     d08:	0100000b          	.insn	4, 0x0100000b
     d0c:	6000                	.insn	2, 0x6000
	...
     d16:	0bd8                	addi	a4,sp,468
     d18:	0000                	unimp
     d1a:	0c10                	addi	a2,sp,528
     d1c:	0000                	unimp
     d1e:	0001                	nop
     d20:	105d                	c.nop	-9
     d22:	000c                	.insn	2, 0x000c
     d24:	1400                	addi	s0,sp,544
     d26:	000c                	.insn	2, 0x000c
     d28:	0100                	addi	s0,sp,128
     d2a:	5e00                	lw	s0,56(a2)
	...
     d34:	0be4                	addi	s1,sp,476
     d36:	0000                	unimp
     d38:	0bec                	addi	a1,sp,476
     d3a:	0000                	unimp
     d3c:	0001                	nop
     d3e:	f05e                	.insn	2, 0xf05e
     d40:	f400000b          	.insn	4, 0xf400000b
     d44:	0100000b          	.insn	4, 0x0100000b
     d48:	5e00                	lw	s0,56(a2)
	...
     d52:	0c8c                	addi	a1,sp,592
     d54:	0000                	unimp
     d56:	0cc4                	addi	s1,sp,596
     d58:	0000                	unimp
     d5a:	0001                	nop
     d5c:	c45d                	beqz	s0,e0a <$d.2+0x7c>
     d5e:	000c                	.insn	2, 0x000c
     d60:	c800                	sw	s0,16(s0)
     d62:	000c                	.insn	2, 0x000c
     d64:	0100                	addi	s0,sp,128
     d66:	5e00                	lw	s0,56(a2)
	...
     d70:	0c98                	addi	a4,sp,592
     d72:	0000                	unimp
     d74:	0ca0                	addi	s0,sp,600
     d76:	0000                	unimp
     d78:	0001                	nop
     d7a:	a45e                	.insn	2, 0xa45e
     d7c:	000c                	.insn	2, 0x000c
     d7e:	a800                	.insn	2, 0xa800
     d80:	000c                	.insn	2, 0x000c
     d82:	0100                	addi	s0,sp,128
     d84:	5e00                	lw	s0,56(a2)
	...

00000d8e <$d.2>:
     d8e:	0000                	unimp
     d90:	0000                	unimp
     d92:	000c                	.insn	2, 0x000c
     d94:	0000                	unimp
     d96:	0001                	nop
     d98:	0000005b          	.insn	4, 0x005b
	...
     da4:	0c00                	addi	s0,sp,528
     da6:	0000                	unimp
     da8:	0100                	addi	s0,sp,128
     daa:	5a00                	lw	s0,48(a2)
     dac:	000c                	.insn	2, 0x000c
     dae:	0000                	unimp
     db0:	0018                	.insn	2, 0x0018
     db2:	0000                	unimp
     db4:	0001                	nop
     db6:	185d                	addi	a6,a6,-9
     db8:	0000                	unimp
     dba:	2000                	.insn	2, 0x2000
     dbc:	0000                	unimp
     dbe:	0100                	addi	s0,sp,128
     dc0:	5f00                	lw	s0,56(a4)
     dc2:	0020                	addi	s0,sp,8
     dc4:	0000                	unimp
     dc6:	0024                	addi	s1,sp,8
     dc8:	0000                	unimp
     dca:	0001                	nop
     dcc:	005d                	c.nop	23
	...
     dd6:	0000                	unimp
     dd8:	0800                	addi	s0,sp,16
     dda:	0000                	unimp
     ddc:	0300                	addi	s0,sp,384
     dde:	7c00                	.insn	2, 0x7c00
     de0:	00009f7f 00000000 	.insn	12, 0x002800000000000000009f7f
     de8:	00280000 
     dec:	0000                	unimp
     dee:	0034                	addi	a3,sp,8
     df0:	0000                	unimp
     df2:	0001                	nop
     df4:	345a                	.insn	2, 0x345a
     df6:	0000                	unimp
     df8:	3800                	.insn	2, 0x3800
     dfa:	0000                	unimp
     dfc:	0100                	addi	s0,sp,128
     dfe:	5d00                	lw	s0,56(a0)
     e00:	0038                	addi	a4,sp,8
     e02:	0000                	unimp
     e04:	0040                	addi	s0,sp,4
     e06:	0000                	unimp
     e08:	0001                	nop
     e0a:	405e                	.insn	2, 0x405e
     e0c:	0000                	unimp
     e0e:	4400                	lw	s0,8(s0)
     e10:	0000                	unimp
     e12:	0100                	addi	s0,sp,128
     e14:	5d00                	lw	s0,56(a0)
	...
     e1e:	0028                	addi	a0,sp,8
     e20:	0000                	unimp
     e22:	0030                	addi	a2,sp,8
     e24:	0000                	unimp
     e26:	7f7c0003          	lb	zero,2039(s8)
     e2a:	009f 0000 0000      	.insn	6, 0x009f
     e30:	0000                	unimp
     e32:	4800                	lw	s0,16(s0)
     e34:	0000                	unimp
     e36:	6800                	.insn	2, 0x6800
     e38:	0000                	unimp
     e3a:	0100                	addi	s0,sp,128
     e3c:	5a00                	lw	s0,48(a2)
     e3e:	0084                	addi	s1,sp,64
     e40:	0000                	unimp
     e42:	0088                	addi	a0,sp,64
     e44:	0000                	unimp
     e46:	0001                	nop
     e48:	885a                	mv	a6,s6
     e4a:	0000                	unimp
     e4c:	9c00                	.insn	2, 0x9c00
     e4e:	0000                	unimp
     e50:	0100                	addi	s0,sp,128
     e52:	5800                	lw	s0,48(s0)
	...
     e5c:	005c                	addi	a5,sp,4
     e5e:	0000                	unimp
     e60:	00ac                	addi	a1,sp,72
     e62:	0000                	unimp
     e64:	00110003          	lb	zero,1(sp)
     e68:	bc9f 0000 f800      	.insn	6, 0xf8000000bc9f
     e6e:	0000                	unimp
     e70:	0100                	addi	s0,sp,128
     e72:	5800                	lw	s0,48(s0)
     e74:	00f8                	addi	a4,sp,76
     e76:	0000                	unimp
     e78:	0110                	addi	a2,sp,128
     e7a:	0000                	unimp
     e7c:	0001                	nop
     e7e:	005f 0000 0000      	.insn	6, 0x005f
     e84:	0000                	unimp
     e86:	6000                	.insn	2, 0x6000
     e88:	0000                	unimp
     e8a:	6800                	.insn	2, 0x6800
     e8c:	0000                	unimp
     e8e:	0100                	addi	s0,sp,128
     e90:	5a00                	lw	s0,48(a2)
     e92:	009c                	addi	a5,sp,64
     e94:	0000                	unimp
     e96:	00f0                	addi	a2,sp,76
     e98:	0000                	unimp
     e9a:	0001                	nop
     e9c:	f05a                	.insn	2, 0xf05a
     e9e:	0000                	unimp
     ea0:	0400                	addi	s0,sp,512
     ea2:	0001                	nop
     ea4:	0100                	addi	s0,sp,128
     ea6:	5e00                	lw	s0,56(a2)
     ea8:	0104                	addi	s1,sp,128
     eaa:	0000                	unimp
     eac:	0110                	addi	a2,sp,128
     eae:	0000                	unimp
     eb0:	0001                	nop
     eb2:	005a                	c.slli	zero,0x16
     eb4:	0000                	unimp
     eb6:	0000                	unimp
     eb8:	0000                	unimp
     eba:	bc00                	.insn	2, 0xbc00
     ebc:	0000                	unimp
     ebe:	c000                	sw	s0,0(s0)
     ec0:	0000                	unimp
     ec2:	0100                	addi	s0,sp,128
     ec4:	6000                	.insn	2, 0x6000
     ec6:	00cc                	addi	a1,sp,68
     ec8:	0000                	unimp
     eca:	00f0                	addi	a2,sp,76
     ecc:	0000                	unimp
     ece:	0001                	nop
     ed0:	0060                	addi	s0,sp,12
     ed2:	0000                	unimp
     ed4:	0000                	unimp
     ed6:	0000                	unimp
     ed8:	bc00                	.insn	2, 0xbc00
     eda:	0000                	unimp
     edc:	e000                	.insn	2, 0xe000
     ede:	0000                	unimp
     ee0:	0100                	addi	s0,sp,128
     ee2:	5e00                	lw	s0,56(a2)
     ee4:	00ec                	addi	a1,sp,76
     ee6:	0000                	unimp
     ee8:	00f0                	addi	a2,sp,76
     eea:	0000                	unimp
     eec:	0001                	nop
     eee:	005e                	c.slli	zero,0x17
     ef0:	0000                	unimp
     ef2:	0000                	unimp
     ef4:	0000                	unimp
     ef6:	f000                	.insn	2, 0xf000
     ef8:	0000                	unimp
     efa:	fc00                	.insn	2, 0xfc00
     efc:	0000                	unimp
     efe:	0100                	addi	s0,sp,128
     f00:	6000                	.insn	2, 0x6000
	...
     f0a:	0144                	addi	s1,sp,132
     f0c:	0000                	unimp
     f0e:	0180                	addi	s0,sp,192
     f10:	0000                	unimp
     f12:	0001                	nop
     f14:	805a                	c.mv	zero,s6
     f16:	0001                	nop
     f18:	d000                	sw	s0,32(s0)
     f1a:	0001                	nop
     f1c:	0100                	addi	s0,sp,128
     f1e:	5800                	lw	s0,48(s0)
     f20:	01d0                	addi	a2,sp,196
     f22:	0000                	unimp
     f24:	01d8                	addi	a4,sp,196
     f26:	0000                	unimp
     f28:	0001                	nop
     f2a:	0001d86b          	.insn	4, 0x0001d86b
     f2e:	f000                	.insn	2, 0xf000
     f30:	0001                	nop
     f32:	0100                	addi	s0,sp,128
     f34:	5800                	lw	s0,48(s0)
     f36:	01f0                	addi	a2,sp,204
     f38:	0000                	unimp
     f3a:	01f4                	addi	a3,sp,204
     f3c:	0000                	unimp
     f3e:	0001                	nop
     f40:	0001f46b          	.insn	4, 0x0001f46b
     f44:	0000                	unimp
     f46:	0002                	c.slli64	zero
     f48:	0100                	addi	s0,sp,128
     f4a:	5800                	lw	s0,48(s0)
     f4c:	0200                	addi	s0,sp,256
     f4e:	0000                	unimp
     f50:	0234                	addi	a3,sp,264
     f52:	0000                	unimp
     f54:	0001                	nop
     f56:	0002346b          	.insn	4, 0x0002346b
     f5a:	3800                	.insn	2, 0x3800
     f5c:	0002                	c.slli64	zero
     f5e:	0100                	addi	s0,sp,128
     f60:	5800                	lw	s0,48(s0)
     f62:	0238                	addi	a4,sp,264
     f64:	0000                	unimp
     f66:	030c                	addi	a1,sp,384
     f68:	0000                	unimp
     f6a:	0001                	nop
     f6c:	00030c6b          	.insn	4, 0x00030c6b
     f70:	1000                	addi	s0,sp,32
     f72:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     f76:	5800                	lw	s0,48(s0)
     f78:	0310                	addi	a2,sp,384
     f7a:	0000                	unimp
     f7c:	0320                	addi	s0,sp,392
     f7e:	0000                	unimp
     f80:	0001                	nop
     f82:	0003206b          	.insn	4, 0x0003206b
     f86:	2400                	.insn	2, 0x2400
     f88:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     f8c:	5800                	lw	s0,48(s0)
     f8e:	0324                	addi	s1,sp,392
     f90:	0000                	unimp
     f92:	03e0                	addi	s0,sp,460
     f94:	0000                	unimp
     f96:	0001                	nop
     f98:	0000006b          	.insn	4, 0x006b
     f9c:	0000                	unimp
     f9e:	0000                	unimp
     fa0:	1c00                	addi	s0,sp,560
     fa2:	0002                	c.slli64	zero
     fa4:	3400                	.insn	2, 0x3400
     fa6:	0002                	c.slli64	zero
     fa8:	0100                	addi	s0,sp,128
     faa:	5800                	lw	s0,48(s0)
     fac:	035c                	addi	a5,sp,388
     fae:	0000                	unimp
     fb0:	036c                	addi	a1,sp,396
     fb2:	0000                	unimp
     fb4:	0001                	nop
     fb6:	0058                	addi	a4,sp,4
     fb8:	0000                	unimp
     fba:	0000                	unimp
     fbc:	0000                	unimp
     fbe:	2000                	.insn	2, 0x2000
     fc0:	0002                	c.slli64	zero
     fc2:	3400                	.insn	2, 0x3400
     fc4:	0002                	c.slli64	zero
     fc6:	0100                	addi	s0,sp,128
     fc8:	5800                	lw	s0,48(s0)
     fca:	036c                	addi	a1,sp,396
     fcc:	0000                	unimp
     fce:	0378                	addi	a4,sp,396
     fd0:	0000                	unimp
     fd2:	0001                	nop
     fd4:	7858                	.insn	2, 0x7858
     fd6:	8c000003          	lb	zero,-1856(zero) # fffff8c0 <_stack_top+0xffef3b00>
     fda:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     fde:	5900                	lw	s0,48(a0)
     fe0:	038c                	addi	a1,sp,448
     fe2:	0000                	unimp
     fe4:	03d4                	addi	a3,sp,452
     fe6:	0000                	unimp
     fe8:	0001                	nop
     fea:	0058                	addi	a4,sp,4
     fec:	0000                	unimp
     fee:	0000                	unimp
     ff0:	0000                	unimp
     ff2:	2000                	.insn	2, 0x2000
     ff4:	0002                	c.slli64	zero
     ff6:	3800                	.insn	2, 0x3800
     ff8:	0002                	c.slli64	zero
     ffa:	0300                	addi	s0,sp,384
     ffc:	1100                	addi	s0,sp,160
     ffe:	9f00                	.insn	2, 0x9f00
    1000:	036c                	addi	a1,sp,396
    1002:	0000                	unimp
    1004:	0370                	addi	a2,sp,396
    1006:	0000                	unimp
    1008:	00110003          	lb	zero,1(sp)
    100c:	789f 0003 a400      	.insn	6, 0xa4000003789f
    1012:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
    1016:	6400                	.insn	2, 0x6400
    1018:	03a4                	addi	s1,sp,456
    101a:	0000                	unimp
    101c:	03b4                	addi	a3,sp,456
    101e:	0000                	unimp
    1020:	0001                	nop
    1022:	005a                	c.slli	zero,0x16
    1024:	0000                	unimp
    1026:	0000                	unimp
    1028:	0000                	unimp
    102a:	5000                	lw	s0,32(s0)
    102c:	0002                	c.slli64	zero
    102e:	6400                	.insn	2, 0x6400
    1030:	0002                	c.slli64	zero
    1032:	0300                	addi	s0,sp,384
    1034:	1100                	addi	s0,sp,160
    1036:	02649f07          	.insn	4, 0x02649f07
    103a:	0000                	unimp
    103c:	027c                	addi	a5,sp,268
    103e:	0000                	unimp
    1040:	06110003          	lb	zero,97(sp)
    1044:	7c9f 0002 9400      	.insn	6, 0x940000027c9f
    104a:	0002                	c.slli64	zero
    104c:	0300                	addi	s0,sp,384
    104e:	1100                	addi	s0,sp,160
    1050:	9f05                	.insn	2, 0x9f05
    1052:	0294                	addi	a3,sp,320
    1054:	0000                	unimp
    1056:	02ac                	addi	a1,sp,328
    1058:	0000                	unimp
    105a:	04110003          	lb	zero,65(sp)
    105e:	ac9f 0002 c400      	.insn	6, 0xc4000002ac9f
    1064:	0002                	c.slli64	zero
    1066:	0300                	addi	s0,sp,384
    1068:	1100                	addi	s0,sp,160
    106a:	02c49f03          	lh	t5,44(s1)
    106e:	0000                	unimp
    1070:	02dc                	addi	a5,sp,324
    1072:	0000                	unimp
    1074:	02110003          	lb	zero,33(sp)
    1078:	dc9f 0002 f400      	.insn	6, 0xf4000002dc9f
    107e:	0002                	c.slli64	zero
    1080:	0300                	addi	s0,sp,384
    1082:	1100                	addi	s0,sp,160
    1084:	9f01                	.insn	2, 0x9f01
    1086:	02f4                	addi	a3,sp,332
    1088:	0000                	unimp
    108a:	0308                	addi	a0,sp,384
    108c:	0000                	unimp
    108e:	00110003          	lb	zero,1(sp)
    1092:	089f 0003 1000      	.insn	6, 0x10000003089f
    1098:	03000003          	lb	zero,48(zero) # 30 <$d.3+0xf>
    109c:	1100                	addi	s0,sp,160
    109e:	00009f7f 00000000 	.insn	12, 0x025000000000000000009f7f
    10a6:	02500000 
    10aa:	0000                	unimp
    10ac:	02f8                	addi	a4,sp,332
    10ae:	0000                	unimp
    10b0:	0001                	nop
    10b2:	0058                	addi	a4,sp,4
    10b4:	0000                	unimp
    10b6:	0000                	unimp
    10b8:	0000                	unimp
    10ba:	5400                	lw	s0,40(s0)
    10bc:	0002                	c.slli64	zero
    10be:	5800                	lw	s0,48(s0)
    10c0:	0002                	c.slli64	zero
    10c2:	0100                	addi	s0,sp,128
    10c4:	5a00                	lw	s0,48(a2)
    10c6:	026c                	addi	a1,sp,268
    10c8:	0000                	unimp
    10ca:	0270                	addi	a2,sp,268
    10cc:	0000                	unimp
    10ce:	0001                	nop
    10d0:	845a                	mv	s0,s6
    10d2:	0002                	c.slli64	zero
    10d4:	8800                	.insn	2, 0x8800
    10d6:	0002                	c.slli64	zero
    10d8:	0100                	addi	s0,sp,128
    10da:	5a00                	lw	s0,48(a2)
    10dc:	029c                	addi	a5,sp,320
    10de:	0000                	unimp
    10e0:	02a0                	addi	s0,sp,328
    10e2:	0000                	unimp
    10e4:	0001                	nop
    10e6:	b45a                	.insn	2, 0xb45a
    10e8:	0002                	c.slli64	zero
    10ea:	b800                	.insn	2, 0xb800
    10ec:	0002                	c.slli64	zero
    10ee:	0100                	addi	s0,sp,128
    10f0:	5a00                	lw	s0,48(a2)
    10f2:	02cc                	addi	a1,sp,324
    10f4:	0000                	unimp
    10f6:	02d0                	addi	a2,sp,324
    10f8:	0000                	unimp
    10fa:	0001                	nop
    10fc:	e45a                	.insn	2, 0xe45a
    10fe:	0002                	c.slli64	zero
    1100:	e800                	.insn	2, 0xe800
    1102:	0002                	c.slli64	zero
    1104:	0100                	addi	s0,sp,128
    1106:	5a00                	lw	s0,48(a2)
    1108:	02f8                	addi	a4,sp,332
    110a:	0000                	unimp
    110c:	02fc                	addi	a5,sp,332
    110e:	0000                	unimp
    1110:	0001                	nop
    1112:	0058                	addi	a4,sp,4
    1114:	0000                	unimp
    1116:	0000                	unimp
    1118:	0000                	unimp
    111a:	3400                	.insn	2, 0x3400
    111c:	40000003          	lb	zero,1024(zero) # 400 <$d.8+0x38>
    1120:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
    1124:	5800                	lw	s0,48(s0)
    1126:	0340                	addi	s0,sp,388
    1128:	0000                	unimp
    112a:	034c                	addi	a1,sp,388
    112c:	0000                	unimp
    112e:	7f780003          	lb	zero,2039(a6)
    1132:	4c9f 0003 5400      	.insn	6, 0x540000034c9f
    1138:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
    113c:	5800                	lw	s0,48(s0)
	...
    1146:	041c                	addi	a5,sp,512
    1148:	0000                	unimp
    114a:	042c                	addi	a1,sp,520
    114c:	0000                	unimp
    114e:	0001                	nop
    1150:	2c5a                	.insn	2, 0x2c5a
    1152:	0004                	.insn	2, 0x0004
    1154:	3000                	.insn	2, 0x3000
    1156:	0004                	.insn	2, 0x0004
    1158:	0300                	addi	s0,sp,384
    115a:	7c00                	.insn	2, 0x7c00
    115c:	04309f7f 04540000 	.insn	12, 0x000300000454000004309f7f
    1164:	00030000 
    1168:	7e7c                	.insn	2, 0x7e7c
    116a:	589f 0004 6000      	.insn	6, 0x60000004589f
    1170:	0004                	.insn	2, 0x0004
    1172:	0100                	addi	s0,sp,128
    1174:	5c00                	lw	s0,56(s0)
    1176:	0460                	addi	s0,sp,524
    1178:	0000                	unimp
    117a:	0464                	addi	s1,sp,524
    117c:	0000                	unimp
    117e:	7e7c0003          	lb	zero,2023(s8)
    1182:	649f 0004 7000      	.insn	6, 0x70000004649f
    1188:	0004                	.insn	2, 0x0004
    118a:	0100                	addi	s0,sp,128
    118c:	5c00                	lw	s0,56(s0)
    118e:	0470                	addi	a2,sp,524
    1190:	0000                	unimp
    1192:	0474                	addi	a3,sp,524
    1194:	0000                	unimp
    1196:	7e7c0003          	lb	zero,2023(s8)
    119a:	909f 0004 a800      	.insn	6, 0xa8000004909f
    11a0:	0004                	.insn	2, 0x0004
    11a2:	0100                	addi	s0,sp,128
    11a4:	5c00                	lw	s0,56(s0)
    11a6:	04ac                	addi	a1,sp,584
    11a8:	0000                	unimp
    11aa:	04dc                	addi	a5,sp,580
    11ac:	0000                	unimp
    11ae:	0001                	nop
    11b0:	005c                	addi	a5,sp,4
    11b2:	0000                	unimp
    11b4:	0000                	unimp
    11b6:	0000                	unimp
    11b8:	1c00                	addi	s0,sp,560
    11ba:	0004                	.insn	2, 0x0004
    11bc:	9000                	.insn	2, 0x9000
    11be:	0004                	.insn	2, 0x0004
    11c0:	0200                	addi	s0,sp,256
    11c2:	3000                	.insn	2, 0x3000
    11c4:	909f 0004 a000      	.insn	6, 0xa0000004909f
    11ca:	0004                	.insn	2, 0x0004
    11cc:	0100                	addi	s0,sp,128
    11ce:	5d00                	lw	s0,56(a0)
    11d0:	04a4                	addi	s1,sp,584
    11d2:	0000                	unimp
    11d4:	04e8                	addi	a0,sp,588
    11d6:	0000                	unimp
    11d8:	0001                	nop
    11da:	005d                	c.nop	23
    11dc:	0000                	unimp
    11de:	0000                	unimp
    11e0:	0000                	unimp
    11e2:	9000                	.insn	2, 0x9000
    11e4:	0004                	.insn	2, 0x0004
    11e6:	9800                	.insn	2, 0x9800
    11e8:	0004                	.insn	2, 0x0004
    11ea:	0100                	addi	s0,sp,128
    11ec:	5a00                	lw	s0,48(a2)
    11ee:	04ac                	addi	a1,sp,584
    11f0:	0000                	unimp
    11f2:	04dc                	addi	a5,sp,580
    11f4:	0000                	unimp
    11f6:	0001                	nop
    11f8:	005a                	c.slli	zero,0x16
    11fa:	0000                	unimp
    11fc:	0000                	unimp
    11fe:	0000                	unimp
    1200:	9c00                	.insn	2, 0x9c00
    1202:	0004                	.insn	2, 0x0004
    1204:	ac00                	.insn	2, 0xac00
    1206:	0004                	.insn	2, 0x0004
    1208:	0100                	addi	s0,sp,128
    120a:	6100                	.insn	2, 0x6100
	...
    1214:	04e8                	addi	a0,sp,588
    1216:	0000                	unimp
    1218:	0530                	addi	a2,sp,648
    121a:	0000                	unimp
    121c:	0001                	nop
    121e:	305a                	.insn	2, 0x305a
    1220:	0005                	c.nop	1
    1222:	2c00                	.insn	2, 0x2c00
    1224:	01000007          	.insn	4, 0x01000007
    1228:	6200                	.insn	2, 0x6200
	...
    1232:	04e8                	addi	a0,sp,588
    1234:	0000                	unimp
    1236:	052c                	addi	a1,sp,648
    1238:	0000                	unimp
    123a:	0001                	nop
    123c:	00052c5b          	.insn	4, 0x00052c5b
    1240:	2c00                	.insn	2, 0x2c00
    1242:	01000007          	.insn	4, 0x01000007
    1246:	5900                	lw	s0,48(a0)
	...
    1250:	04e8                	addi	a0,sp,588
    1252:	0000                	unimp
    1254:	0524                	addi	s1,sp,648
    1256:	0000                	unimp
    1258:	0001                	nop
    125a:	245c                	.insn	2, 0x245c
    125c:	0005                	c.nop	1
    125e:	6800                	.insn	2, 0x6800
    1260:	02000007          	.insn	4, 0x02000007
    1264:	7200                	.insn	2, 0x7200
    1266:	0008                	.insn	2, 0x0008
    1268:	0000                	unimp
    126a:	0000                	unimp
    126c:	0000                	unimp
    126e:	2000                	.insn	2, 0x2000
    1270:	0005                	c.nop	1
    1272:	3000                	.insn	2, 0x3000
    1274:	0005                	c.nop	1
    1276:	0100                	addi	s0,sp,128
    1278:	5a00                	lw	s0,48(a2)
    127a:	0530                	addi	a2,sp,648
    127c:	0000                	unimp
    127e:	072c                	addi	a1,sp,904
    1280:	0000                	unimp
    1282:	0001                	nop
    1284:	0062                	c.slli	zero,0x18
    1286:	0000                	unimp
    1288:	0000                	unimp
    128a:	0000                	unimp
    128c:	2400                	.insn	2, 0x2400
    128e:	0005                	c.nop	1
    1290:	5400                	lw	s0,40(s0)
    1292:	0005                	c.nop	1
    1294:	0200                	addi	s0,sp,256
    1296:	3000                	.insn	2, 0x3000
    1298:	549f 0005 2c00      	.insn	6, 0x2c000005549f
    129e:	01000007          	.insn	4, 0x01000007
    12a2:	6500                	.insn	2, 0x6500
	...
    12ac:	0554                	addi	a3,sp,644
    12ae:	0000                	unimp
    12b0:	0574                	addi	a3,sp,652
    12b2:	0000                	unimp
    12b4:	0001                	nop
    12b6:	d06a                	sw	s10,32(sp)
    12b8:	0006                	c.slli	zero,0x1
    12ba:	2400                	.insn	2, 0x2400
    12bc:	01000007          	.insn	4, 0x01000007
    12c0:	6a00                	.insn	2, 0x6a00
	...
    12ca:	057c                	addi	a5,sp,652
    12cc:	0000                	unimp
    12ce:	0594                	addi	a3,sp,704
    12d0:	0000                	unimp
    12d2:	07110003          	lb	zero,113(sp)
    12d6:	949f 0005 ac00      	.insn	6, 0xac000005949f
    12dc:	0005                	c.nop	1
    12de:	0300                	addi	s0,sp,384
    12e0:	1100                	addi	s0,sp,160
    12e2:	9f06                	add	t5,t5,ra
    12e4:	05ac                	addi	a1,sp,712
    12e6:	0000                	unimp
    12e8:	05c4                	addi	s1,sp,708
    12ea:	0000                	unimp
    12ec:	05110003          	lb	zero,81(sp)
    12f0:	c49f 0005 dc00      	.insn	6, 0xdc000005c49f
    12f6:	0005                	c.nop	1
    12f8:	0300                	addi	s0,sp,384
    12fa:	1100                	addi	s0,sp,160
    12fc:	9f04                	.insn	2, 0x9f04
    12fe:	05dc                	addi	a5,sp,708
    1300:	0000                	unimp
    1302:	05f4                	addi	a3,sp,716
    1304:	0000                	unimp
    1306:	03110003          	lb	zero,49(sp)
    130a:	f49f 0005 0c00      	.insn	6, 0x0c000005f49f
    1310:	0006                	c.slli	zero,0x1
    1312:	0300                	addi	s0,sp,384
    1314:	1100                	addi	s0,sp,160
    1316:	9f02                	jalr	t5
    1318:	060c                	addi	a1,sp,768
    131a:	0000                	unimp
    131c:	0624                	addi	s1,sp,776
    131e:	0000                	unimp
    1320:	01110003          	lb	zero,17(sp)
    1324:	249f 0006 3800      	.insn	6, 0x38000006249f
    132a:	0006                	c.slli	zero,0x1
    132c:	0300                	addi	s0,sp,384
    132e:	1100                	addi	s0,sp,160
    1330:	9f00                	.insn	2, 0x9f00
    1332:	0638                	addi	a4,sp,776
    1334:	0000                	unimp
    1336:	0650                	addi	a2,sp,772
    1338:	0000                	unimp
    133a:	7f110003          	lb	zero,2033(sp)
    133e:	009f 0000 0000      	.insn	6, 0x009f
    1344:	0000                	unimp
    1346:	8000                	.insn	2, 0x8000
    1348:	0005                	c.nop	1
    134a:	8400                	.insn	2, 0x8400
    134c:	0005                	c.nop	1
    134e:	0100                	addi	s0,sp,128
    1350:	5a00                	lw	s0,48(a2)
    1352:	059c                	addi	a5,sp,704
    1354:	0000                	unimp
    1356:	05a0                	addi	s0,sp,712
    1358:	0000                	unimp
    135a:	0001                	nop
    135c:	b45a                	.insn	2, 0xb45a
    135e:	0005                	c.nop	1
    1360:	b800                	.insn	2, 0xb800
    1362:	0005                	c.nop	1
    1364:	0100                	addi	s0,sp,128
    1366:	5a00                	lw	s0,48(a2)
    1368:	05cc                	addi	a1,sp,708
    136a:	0000                	unimp
    136c:	05d0                	addi	a2,sp,708
    136e:	0000                	unimp
    1370:	0001                	nop
    1372:	e45a                	.insn	2, 0xe45a
    1374:	0005                	c.nop	1
    1376:	e800                	.insn	2, 0xe800
    1378:	0005                	c.nop	1
    137a:	0100                	addi	s0,sp,128
    137c:	5a00                	lw	s0,48(a2)
    137e:	05fc                	addi	a5,sp,716
    1380:	0000                	unimp
    1382:	0600                	addi	s0,sp,768
    1384:	0000                	unimp
    1386:	0001                	nop
    1388:	145a                	slli	s0,s0,0x36
    138a:	0006                	c.slli	zero,0x1
    138c:	1800                	addi	s0,sp,48
    138e:	0006                	c.slli	zero,0x1
    1390:	0100                	addi	s0,sp,128
    1392:	5a00                	lw	s0,48(a2)
    1394:	0628                	addi	a0,sp,776
    1396:	0000                	unimp
    1398:	062c                	addi	a1,sp,776
    139a:	0000                	unimp
    139c:	0001                	nop
    139e:	005a                	c.slli	zero,0x16
    13a0:	0000                	unimp
    13a2:	0000                	unimp
    13a4:	0000                	unimp
    13a6:	e800                	.insn	2, 0xe800
    13a8:	0006                	c.slli	zero,0x1
    13aa:	0000                	unimp
    13ac:	02000007          	.insn	4, 0x02000007
    13b0:	3000                	.insn	2, 0x3000
    13b2:	009f 0007 0c00      	.insn	6, 0x0c000007009f
    13b8:	09000007          	.insn	4, 0x09000007
    13bc:	8b00                	.insn	2, 0x8b00
    13be:	8500                	.insn	2, 0x8500
    13c0:	8200                	.insn	2, 0x8200
    13c2:	2200                	.insn	2, 0x2200
    13c4:	9f1c                	.insn	2, 0x9f1c
    13c6:	070c                	addi	a1,sp,896
    13c8:	0000                	unimp
    13ca:	0710                	addi	a2,sp,896
    13cc:	0000                	unimp
    13ce:	000c                	.insn	2, 0x000c
    13d0:	0085008b          	.insn	4, 0x0085008b
    13d4:	0082                	c.slli64	ra
    13d6:	1c22                	slli	s8,s8,0x28
    13d8:	0111                	addi	sp,sp,4
    13da:	9f22                	add	t5,t5,s0
    13dc:	0714                	addi	a3,sp,896
    13de:	0000                	unimp
    13e0:	0724                	addi	s1,sp,904
    13e2:	0000                	unimp
    13e4:	0009                	c.nop	2
    13e6:	0085008b          	.insn	4, 0x0085008b
    13ea:	0082                	c.slli64	ra
    13ec:	1c22                	slli	s8,s8,0x28
    13ee:	009f 0000 0000      	.insn	6, 0x009f
    13f4:	0000                	unimp
    13f6:	1800                	addi	s0,sp,48
    13f8:	24000007          	.insn	4, 0x24000007
    13fc:	01000007          	.insn	4, 0x01000007
    1400:	5a00                	lw	s0,48(a2)
	...
    140a:	0768                	addi	a0,sp,908
    140c:	0000                	unimp
    140e:	07fc                	addi	a5,sp,972
    1410:	0000                	unimp
    1412:	0001                	nop
    1414:	4c5a                	lw	s8,148(sp)
    1416:	0008                	.insn	2, 0x0008
    1418:	5c00                	lw	s0,56(s0)
    141a:	0008                	.insn	2, 0x0008
    141c:	0100                	addi	s0,sp,128
    141e:	5a00                	lw	s0,48(a2)
    1420:	088c                	addi	a1,sp,80
    1422:	0000                	unimp
    1424:	08fc                	addi	a5,sp,92
    1426:	0000                	unimp
    1428:	0001                	nop
    142a:	005a                	c.slli	zero,0x16
    142c:	0000                	unimp
    142e:	0000                	unimp
    1430:	0000                	unimp
    1432:	6800                	.insn	2, 0x6800
    1434:	f4000007          	.insn	4, 0xf4000007
    1438:	01000007          	.insn	4, 0x01000007
    143c:	5b00                	lw	s0,48(a4)
    143e:	084c                	addi	a1,sp,20
    1440:	0000                	unimp
    1442:	0864                	addi	s1,sp,28
    1444:	0000                	unimp
    1446:	0001                	nop
    1448:	00088c5b          	.insn	4, 0x00088c5b
    144c:	fc00                	.insn	2, 0xfc00
    144e:	0008                	.insn	2, 0x0008
    1450:	0100                	addi	s0,sp,128
    1452:	5b00                	lw	s0,48(a4)
	...
    145c:	0774                	addi	a3,sp,908
    145e:	0000                	unimp
    1460:	07e0                	addi	s0,sp,972
    1462:	0000                	unimp
    1464:	0002                	c.slli64	zero
    1466:	9f30                	.insn	2, 0x9f30
    1468:	07e0                	addi	s0,sp,972
    146a:	0000                	unimp
    146c:	084c                	addi	a1,sp,20
    146e:	0000                	unimp
    1470:	0001                	nop
    1472:	4c58                	lw	a4,28(s0)
    1474:	0008                	.insn	2, 0x0008
    1476:	6400                	.insn	2, 0x6400
    1478:	0008                	.insn	2, 0x0008
    147a:	0200                	addi	s0,sp,256
    147c:	3000                	.insn	2, 0x3000
    147e:	649f 0008 7800      	.insn	6, 0x78000008649f
    1484:	0008                	.insn	2, 0x0008
    1486:	0100                	addi	s0,sp,128
    1488:	5800                	lw	s0,48(s0)
    148a:	088c                	addi	a1,sp,80
    148c:	0000                	unimp
    148e:	08fc                	addi	a5,sp,92
    1490:	0000                	unimp
    1492:	0002                	c.slli64	zero
    1494:	9f30                	.insn	2, 0x9f30
    1496:	08fc                	addi	a5,sp,92
    1498:	0000                	unimp
    149a:	09ac                	addi	a1,sp,216
    149c:	0000                	unimp
    149e:	0001                	nop
    14a0:	0058                	addi	a4,sp,4
    14a2:	0000                	unimp
    14a4:	0000                	unimp
    14a6:	0000                	unimp
    14a8:	7400                	.insn	2, 0x7400
    14aa:	68000007          	.insn	4, 0x68000007
    14ae:	0009                	c.nop	2
    14b0:	0400                	addi	s0,sp,512
    14b2:	1000                	addi	s0,sp,32
    14b4:	0280                	addi	s0,sp,320
    14b6:	689f 0009 9400      	.insn	6, 0x94000009689f
    14bc:	0009                	c.nop	2
    14be:	0100                	addi	s0,sp,128
    14c0:	5d00                	lw	s0,56(a0)
    14c2:	0994                	addi	a3,sp,208
    14c4:	0000                	unimp
    14c6:	0998                	addi	a4,sp,208
    14c8:	0000                	unimp
    14ca:	0004                	.insn	2, 0x0004
    14cc:	8010                	.insn	2, 0x8010
    14ce:	9f20                	.insn	2, 0x9f20
    14d0:	0998                	addi	a4,sp,208
    14d2:	0000                	unimp
    14d4:	09a4                	addi	s1,sp,216
    14d6:	0000                	unimp
    14d8:	0001                	nop
    14da:	005c                	addi	a5,sp,4
    14dc:	0000                	unimp
    14de:	0000                	unimp
    14e0:	0000                	unimp
    14e2:	a000                	.insn	2, 0xa000
    14e4:	a8000007          	.insn	4, 0xa8000007
    14e8:	03000007          	.insn	4, 0x03000007
    14ec:	7d00                	.insn	2, 0x7d00
    14ee:	07a89f7f 07cc0000 	.insn	12, 0x0003000007cc000007a89f7f
    14f6:	00030000 
    14fa:	7e7d                	lui	t3,0xfffff
    14fc:	d09f 0007 dc00      	.insn	6, 0xdc000007d09f
    1502:	01000007          	.insn	4, 0x01000007
    1506:	5d00                	lw	s0,56(a0)
    1508:	084c                	addi	a1,sp,20
    150a:	0000                	unimp
    150c:	0850                	addi	a2,sp,20
    150e:	0000                	unimp
    1510:	7e7d0003          	lb	zero,2023(s10)
    1514:	509f 0008 5800      	.insn	6, 0x58000008509f
    151a:	0008                	.insn	2, 0x0008
    151c:	0100                	addi	s0,sp,128
    151e:	5d00                	lw	s0,56(a0)
    1520:	08ac                	addi	a1,sp,88
    1522:	0000                	unimp
    1524:	08c4                	addi	s1,sp,84
    1526:	0000                	unimp
    1528:	0001                	nop
    152a:	c85d                	beqz	s0,15e0 <$d.4+0x3b1>
    152c:	0008                	.insn	2, 0x0008
    152e:	fc00                	.insn	2, 0xfc00
    1530:	0008                	.insn	2, 0x0008
    1532:	0100                	addi	s0,sp,128
    1534:	5d00                	lw	s0,56(a0)
	...
    153e:	0810                	addi	a2,sp,16
    1540:	0000                	unimp
    1542:	0818                	addi	a4,sp,16
    1544:	0000                	unimp
    1546:	7f7b0003          	lb	zero,2039(s6)
    154a:	189f 0008 3c00      	.insn	6, 0x3c000008189f
    1550:	0008                	.insn	2, 0x0008
    1552:	0300                	addi	s0,sp,384
    1554:	7b00                	.insn	2, 0x7b00
    1556:	9f7e                	add	t5,t5,t6
    1558:	0840                	addi	s0,sp,20
    155a:	0000                	unimp
    155c:	084c                	addi	a1,sp,20
    155e:	0000                	unimp
    1560:	0001                	nop
    1562:	0008645b          	.insn	4, 0x0008645b
    1566:	6800                	.insn	2, 0x6800
    1568:	0008                	.insn	2, 0x0008
    156a:	0300                	addi	s0,sp,384
    156c:	7b00                	.insn	2, 0x7b00
    156e:	9f7e                	add	t5,t5,t6
    1570:	0868                	addi	a0,sp,28
    1572:	0000                	unimp
    1574:	0870                	addi	a2,sp,28
    1576:	0000                	unimp
    1578:	0001                	nop
    157a:	00091c5b          	.insn	4, 0x00091c5b
    157e:	3400                	.insn	2, 0x3400
    1580:	0009                	c.nop	2
    1582:	0100                	addi	s0,sp,128
    1584:	5b00                	lw	s0,48(a4)
    1586:	0938                	addi	a4,sp,152
    1588:	0000                	unimp
    158a:	0968                	addi	a0,sp,156
    158c:	0000                	unimp
    158e:	0001                	nop
    1590:	0000005b          	.insn	4, 0x005b
    1594:	0000                	unimp
    1596:	0000                	unimp
    1598:	5800                	lw	s0,48(s0)
    159a:	0008                	.insn	2, 0x0008
    159c:	6400                	.insn	2, 0x6400
    159e:	0008                	.insn	2, 0x0008
    15a0:	0200                	addi	s0,sp,256
    15a2:	3000                	.insn	2, 0x3000
    15a4:	009f 0000 0000      	.insn	6, 0x009f
    15aa:	0000                	unimp
    15ac:	7000                	.insn	2, 0x7000
    15ae:	0008                	.insn	2, 0x0008
    15b0:	7800                	.insn	2, 0x7800
    15b2:	0008                	.insn	2, 0x0008
    15b4:	0200                	addi	s0,sp,256
    15b6:	3000                	.insn	2, 0x3000
    15b8:	009f 0000 0000      	.insn	6, 0x009f
    15be:	0000                	unimp
    15c0:	ac00                	.insn	2, 0xac00
    15c2:	0008                	.insn	2, 0x0008
    15c4:	b400                	.insn	2, 0xb400
    15c6:	0008                	.insn	2, 0x0008
    15c8:	0100                	addi	s0,sp,128
    15ca:	5c00                	lw	s0,56(s0)
    15cc:	08c8                	addi	a0,sp,84
    15ce:	0000                	unimp
    15d0:	08fc                	addi	a5,sp,92
    15d2:	0000                	unimp
    15d4:	0001                	nop
    15d6:	005c                	addi	a5,sp,4
    15d8:	0000                	unimp
    15da:	0000                	unimp
    15dc:	0000                	unimp
    15de:	ac00                	.insn	2, 0xac00
    15e0:	0008                	.insn	2, 0x0008
    15e2:	bc00                	.insn	2, 0xbc00
    15e4:	0008                	.insn	2, 0x0008
    15e6:	0100                	addi	s0,sp,128
    15e8:	5800                	lw	s0,48(s0)
    15ea:	08c0                	addi	s0,sp,84
    15ec:	0000                	unimp
    15ee:	08fc                	addi	a5,sp,92
    15f0:	0000                	unimp
    15f2:	0001                	nop
    15f4:	0058                	addi	a4,sp,4
    15f6:	0000                	unimp
    15f8:	0000                	unimp
    15fa:	0000                	unimp
    15fc:	b800                	.insn	2, 0xb800
    15fe:	0008                	.insn	2, 0x0008
    1600:	c800                	sw	s0,16(s0)
    1602:	0008                	.insn	2, 0x0008
    1604:	0100                	addi	s0,sp,128
    1606:	6100                	.insn	2, 0x6100
	...
    1610:	091c                	addi	a5,sp,144
    1612:	0000                	unimp
    1614:	0924                	addi	s1,sp,152
    1616:	0000                	unimp
    1618:	0001                	nop
    161a:	385a                	.insn	2, 0x385a
    161c:	0009                	c.nop	2
    161e:	6800                	.insn	2, 0x6800
    1620:	0009                	c.nop	2
    1622:	0100                	addi	s0,sp,128
    1624:	5a00                	lw	s0,48(a2)
	...
    162e:	091c                	addi	a5,sp,144
    1630:	0000                	unimp
    1632:	092c                	addi	a1,sp,152
    1634:	0000                	unimp
    1636:	0001                	nop
    1638:	305d                	jal	ede <$d.2+0x150>
    163a:	0009                	c.nop	2
    163c:	6800                	.insn	2, 0x6800
    163e:	0009                	c.nop	2
    1640:	0100                	addi	s0,sp,128
    1642:	5d00                	lw	s0,56(a0)
	...
    164c:	0928                	addi	a0,sp,152
    164e:	0000                	unimp
    1650:	0938                	addi	a4,sp,152
    1652:	0000                	unimp
    1654:	0001                	nop
    1656:	0061                	c.nop	24
    1658:	0000                	unimp
    165a:	0000                	unimp
    165c:	0000                	unimp
	...

0000165f <$d.2>:
    165f:	0008                	.insn	2, 0x0008
    1661:	0000                	unimp
    1663:	005c                	addi	a5,sp,4
    1665:	0000                	unimp
    1667:	0001                	nop
    1669:	605a                	.insn	2, 0x605a
    166b:	0000                	unimp
    166d:	7c00                	.insn	2, 0x7c00
    166f:	0000                	unimp
    1671:	0100                	addi	s0,sp,128
    1673:	5a00                	lw	s0,48(a2)
	...
    167d:	0018                	.insn	2, 0x0018
    167f:	0000                	unimp
    1681:	001c                	.insn	2, 0x001c
    1683:	0000                	unimp
    1685:	000e                	c.slli	zero,0x3
    1687:	007c                	addi	a5,sp,12
    1689:	9c11                	.insn	2, 0x9c11
    168b:	7f111c7f 00e3111e 	.insn	12, 0x00209f2200e3111e7f111c7f
    1693:	00209f22 
    1697:	0000                	unimp
    1699:	0024                	addi	s1,sp,8
    169b:	0000                	unimp
    169d:	7f7c0003          	lb	zero,2039(s8)
    16a1:	009f 0000 0000      	.insn	6, 0x009f
    16a7:	0000                	unimp
    16a9:	4400                	lw	s0,8(s0)
    16ab:	0000                	unimp
    16ad:	5000                	lw	s0,32(s0)
    16af:	0000                	unimp
    16b1:	1000                	addi	s0,sp,32
    16b3:	7d00                	.insn	2, 0x7d00
    16b5:	1100                	addi	s0,sp,160
    16b7:	f9b0                	.insn	2, 0xf9b0
    16b9:	1c7c                	addi	a5,sp,572
    16bb:	7f11                	lui	t5,0xfffe4
    16bd:	111e                	slli	sp,sp,0x27
    16bf:	86d0                	.insn	2, 0x86d0
    16c1:	509f2203          	lw	tp,1289(t5) # fffe4509 <_stack_top+0xffed8749>
    16c5:	0000                	unimp
    16c7:	5400                	lw	s0,40(s0)
    16c9:	0000                	unimp
    16cb:	1000                	addi	s0,sp,32
    16cd:	7d00                	.insn	2, 0x7d00
    16cf:	1100                	addi	s0,sp,160
    16d1:	f9b0                	.insn	2, 0xf9b0
    16d3:	1c7c                	addi	a5,sp,572
    16d5:	7f11                	lui	t5,0xfffe4
    16d7:	111e                	slli	sp,sp,0x27
    16d9:	220386cf          	.insn	4, 0x220386cf
    16dd:	609f 0000 9c00      	.insn	6, 0x9c000000609f
    16e3:	0000                	unimp
    16e5:	1000                	addi	s0,sp,32
    16e7:	7d00                	.insn	2, 0x7d00
    16e9:	1100                	addi	s0,sp,160
    16eb:	f9b0                	.insn	2, 0xf9b0
    16ed:	1c7c                	addi	a5,sp,572
    16ef:	7f11                	lui	t5,0xfffe4
    16f1:	111e                	slli	sp,sp,0x27
    16f3:	86d0                	.insn	2, 0x86d0
    16f5:	9c9f2203          	lw	tp,-1591(t5) # fffe39c9 <_stack_top+0xffed7c09>
    16f9:	0000                	unimp
    16fb:	a800                	.insn	2, 0xa800
    16fd:	0000                	unimp
    16ff:	1000                	addi	s0,sp,32
    1701:	7a00                	.insn	2, 0x7a00
    1703:	1100                	addi	s0,sp,160
    1705:	f9b0                	.insn	2, 0xf9b0
    1707:	1c7c                	addi	a5,sp,572
    1709:	7f11                	lui	t5,0xfffe4
    170b:	111e                	slli	sp,sp,0x27
    170d:	86d0                	.insn	2, 0x86d0
    170f:	a89f2203          	lw	tp,-1399(t5) # fffe3a89 <_stack_top+0xffed7cc9>
    1713:	0000                	unimp
    1715:	ac00                	.insn	2, 0xac00
    1717:	0000                	unimp
    1719:	1000                	addi	s0,sp,32
    171b:	7a00                	.insn	2, 0x7a00
    171d:	1100                	addi	s0,sp,160
    171f:	f9b0                	.insn	2, 0xf9b0
    1721:	1c7c                	addi	a5,sp,572
    1723:	7f11                	lui	t5,0xfffe4
    1725:	111e                	slli	sp,sp,0x27
    1727:	220386cf          	.insn	4, 0x220386cf
    172b:	b89f 0000 8800      	.insn	6, 0x88000000b89f
    1731:	0001                	nop
    1733:	1000                	addi	s0,sp,32
    1735:	7a00                	.insn	2, 0x7a00
    1737:	1100                	addi	s0,sp,160
    1739:	f9b0                	.insn	2, 0xf9b0
    173b:	1c7c                	addi	a5,sp,572
    173d:	7f11                	lui	t5,0xfffe4
    173f:	111e                	slli	sp,sp,0x27
    1741:	86d0                	.insn	2, 0x86d0
    1743:	989f2203          	lw	tp,-1655(t5) # fffe3989 <_stack_top+0xffed7bc9>
    1747:	0001                	nop
    1749:	a400                	.insn	2, 0xa400
    174b:	0001                	nop
    174d:	1000                	addi	s0,sp,32
    174f:	7a00                	.insn	2, 0x7a00
    1751:	1100                	addi	s0,sp,160
    1753:	f9b0                	.insn	2, 0xf9b0
    1755:	1c7c                	addi	a5,sp,572
    1757:	7f11                	lui	t5,0xfffe4
    1759:	111e                	slli	sp,sp,0x27
    175b:	86d0                	.insn	2, 0x86d0
    175d:	a49f2203          	lw	tp,-1463(t5) # fffe3a49 <_stack_top+0xffed7c89>
    1761:	0001                	nop
    1763:	a800                	.insn	2, 0xa800
    1765:	0001                	nop
    1767:	1000                	addi	s0,sp,32
    1769:	7a00                	.insn	2, 0x7a00
    176b:	1100                	addi	s0,sp,160
    176d:	f9b0                	.insn	2, 0xf9b0
    176f:	1c7c                	addi	a5,sp,572
    1771:	7f11                	lui	t5,0xfffe4
    1773:	111e                	slli	sp,sp,0x27
    1775:	220386cf          	.insn	4, 0x220386cf
    1779:	b09f 0001 b800      	.insn	6, 0xb8000001b09f
    177f:	0001                	nop
    1781:	1000                	addi	s0,sp,32
    1783:	7a00                	.insn	2, 0x7a00
    1785:	1100                	addi	s0,sp,160
    1787:	f9b0                	.insn	2, 0xf9b0
    1789:	1c7c                	addi	a5,sp,572
    178b:	7f11                	lui	t5,0xfffe4
    178d:	111e                	slli	sp,sp,0x27
    178f:	86d0                	.insn	2, 0x86d0
    1791:	009f2203          	lw	tp,9(t5) # fffe4009 <_stack_top+0xffed8249>
    1795:	0000                	unimp
    1797:	0000                	unimp
    1799:	0000                	unimp
    179b:	6400                	.insn	2, 0x6400
    179d:	0000                	unimp
    179f:	6800                	.insn	2, 0x6800
    17a1:	0000                	unimp
    17a3:	0e00                	addi	s0,sp,784
    17a5:	7c00                	.insn	2, 0x7c00
    17a7:	1100                	addi	s0,sp,160
    17a9:	7f9c                	.insn	2, 0x7f9c
    17ab:	111c                	addi	a5,sp,160
    17ad:	e3111e7f 6c9f2200 	.insn	12, 0x700000006c9f2200e3111e7f
    17b5:	70000000 
    17b9:	0000                	unimp
    17bb:	0300                	addi	s0,sp,384
    17bd:	7c00                	.insn	2, 0x7c00
    17bf:	00009f7f 00000000 	.insn	12, 0x008400000000000000009f7f
    17c7:	00840000 
    17cb:	0000                	unimp
    17cd:	0088                	addi	a0,sp,64
    17cf:	0000                	unimp
    17d1:	000e                	c.slli	zero,0x3
    17d3:	007a                	c.slli	zero,0x1e
    17d5:	9c11                	.insn	2, 0x9c11
    17d7:	7f111c7f 00e3111e 	.insn	12, 0x008c9f2200e3111e7f111c7f
    17df:	008c9f22 
    17e3:	0000                	unimp
    17e5:	0090                	addi	a2,sp,64
    17e7:	0000                	unimp
    17e9:	7f7a0003          	lb	zero,2039(s4)
    17ed:	009f 0000 0000      	.insn	6, 0x009f
    17f3:	0000                	unimp
    17f5:	bc00                	.insn	2, 0xbc00
    17f7:	0000                	unimp
    17f9:	c000                	sw	s0,0(s0)
    17fb:	0000                	unimp
    17fd:	0300                	addi	s0,sp,384
    17ff:	1000                	addi	s0,sp,32
    1801:	9f31                	.insn	2, 0x9f31
    1803:	00c0                	addi	s0,sp,68
    1805:	0000                	unimp
    1807:	00c4                	addi	s1,sp,68
    1809:	0000                	unimp
    180b:	30100003          	lb	zero,769(zero) # 301 <$d.6+0x7f>
    180f:	c49f 0000 c800      	.insn	6, 0xc8000000c49f
    1815:	0000                	unimp
    1817:	0300                	addi	s0,sp,384
    1819:	1000                	addi	s0,sp,32
    181b:	00c89f2f          	.insn	4, 0x00c89f2f
    181f:	0000                	unimp
    1821:	00cc                	addi	a1,sp,68
    1823:	0000                	unimp
    1825:	2e100003          	lb	zero,737(zero) # 2e1 <$d.6+0x5f>
    1829:	cc9f 0000 d000      	.insn	6, 0xd0000000cc9f
    182f:	0000                	unimp
    1831:	0300                	addi	s0,sp,384
    1833:	1000                	addi	s0,sp,32
    1835:	9f2d                	.insn	2, 0x9f2d
    1837:	00d0                	addi	a2,sp,68
    1839:	0000                	unimp
    183b:	00d4                	addi	a3,sp,68
    183d:	0000                	unimp
    183f:	2c100003          	lb	zero,705(zero) # 2c1 <$d.6+0x3f>
    1843:	d49f 0000 d800      	.insn	6, 0xd8000000d49f
    1849:	0000                	unimp
    184b:	0300                	addi	s0,sp,384
    184d:	1000                	addi	s0,sp,32
    184f:	00d89f2b          	.insn	4, 0x00d89f2b
    1853:	0000                	unimp
    1855:	00dc                	addi	a5,sp,68
    1857:	0000                	unimp
    1859:	2a100003          	lb	zero,673(zero) # 2a1 <$d.6+0x1f>
    185d:	dc9f 0000 e000      	.insn	6, 0xe0000000dc9f
    1863:	0000                	unimp
    1865:	0300                	addi	s0,sp,384
    1867:	1000                	addi	s0,sp,32
    1869:	9f29                	.insn	2, 0x9f29
    186b:	00e0                	addi	s0,sp,76
    186d:	0000                	unimp
    186f:	00e4                	addi	s1,sp,76
    1871:	0000                	unimp
    1873:	28100003          	lb	zero,641(zero) # 281 <$d.3+0x28>
    1877:	e49f 0000 e800      	.insn	6, 0xe8000000e49f
    187d:	0000                	unimp
    187f:	0300                	addi	s0,sp,384
    1881:	1000                	addi	s0,sp,32
    1883:	00e89f27          	.insn	4, 0x00e89f27
    1887:	0000                	unimp
    1889:	00ec                	addi	a1,sp,76
    188b:	0000                	unimp
    188d:	26100003          	lb	zero,609(zero) # 261 <$d.3+0x8>
    1891:	ec9f 0000 f000      	.insn	6, 0xf0000000ec9f
    1897:	0000                	unimp
    1899:	0300                	addi	s0,sp,384
    189b:	1000                	addi	s0,sp,32
    189d:	9f25                	.insn	2, 0x9f25
    189f:	00f0                	addi	a2,sp,76
    18a1:	0000                	unimp
    18a3:	00f4                	addi	a3,sp,76
    18a5:	0000                	unimp
    18a7:	24100003          	lb	zero,577(zero) # 241 <$d.5+0x21>
    18ab:	f49f 0000 f800      	.insn	6, 0xf8000000f49f
    18b1:	0000                	unimp
    18b3:	0300                	addi	s0,sp,384
    18b5:	1000                	addi	s0,sp,32
    18b7:	00f89f23          	sh	a5,30(a7)
    18bb:	0000                	unimp
    18bd:	00fc                	addi	a5,sp,76
    18bf:	0000                	unimp
    18c1:	22100003          	lb	zero,545(zero) # 221 <$d.5+0x1>
    18c5:	fc9f 0000 0000      	.insn	6, 0xfc9f
    18cb:	0001                	nop
    18cd:	0300                	addi	s0,sp,384
    18cf:	1000                	addi	s0,sp,32
    18d1:	9f21                	.insn	2, 0x9f21
    18d3:	0100                	addi	s0,sp,128
    18d5:	0000                	unimp
    18d7:	0104                	addi	s1,sp,128
    18d9:	0000                	unimp
    18db:	20100003          	lb	zero,513(zero) # 201 <$d.12+0x31>
    18df:	049f 0001 0800      	.insn	6, 0x08000001049f
    18e5:	0001                	nop
    18e7:	0200                	addi	s0,sp,256
    18e9:	4f00                	lw	s0,24(a4)
    18eb:	089f 0001 0c00      	.insn	6, 0x0c000001089f
    18f1:	0001                	nop
    18f3:	0200                	addi	s0,sp,256
    18f5:	4e00                	lw	s0,24(a2)
    18f7:	0c9f 0001 1000      	.insn	6, 0x100000010c9f
    18fd:	0001                	nop
    18ff:	0200                	addi	s0,sp,256
    1901:	4d00                	lw	s0,24(a0)
    1903:	109f 0001 1400      	.insn	6, 0x14000001109f
    1909:	0001                	nop
    190b:	0200                	addi	s0,sp,256
    190d:	4c00                	lw	s0,24(s0)
    190f:	149f 0001 1800      	.insn	6, 0x18000001149f
    1915:	0001                	nop
    1917:	0200                	addi	s0,sp,256
    1919:	4b00                	lw	s0,16(a4)
    191b:	189f 0001 1c00      	.insn	6, 0x1c000001189f
    1921:	0001                	nop
    1923:	0200                	addi	s0,sp,256
    1925:	4a00                	lw	s0,16(a2)
    1927:	1c9f 0001 2000      	.insn	6, 0x200000011c9f
    192d:	0001                	nop
    192f:	0200                	addi	s0,sp,256
    1931:	4900                	lw	s0,16(a0)
    1933:	209f 0001 2400      	.insn	6, 0x24000001209f
    1939:	0001                	nop
    193b:	0200                	addi	s0,sp,256
    193d:	4800                	lw	s0,16(s0)
    193f:	249f 0001 2800      	.insn	6, 0x28000001249f
    1945:	0001                	nop
    1947:	0200                	addi	s0,sp,256
    1949:	4700                	lw	s0,8(a4)
    194b:	289f 0001 2c00      	.insn	6, 0x2c000001289f
    1951:	0001                	nop
    1953:	0200                	addi	s0,sp,256
    1955:	4600                	lw	s0,8(a2)
    1957:	2c9f 0001 3000      	.insn	6, 0x300000012c9f
    195d:	0001                	nop
    195f:	0200                	addi	s0,sp,256
    1961:	4500                	lw	s0,8(a0)
    1963:	309f 0001 3400      	.insn	6, 0x34000001309f
    1969:	0001                	nop
    196b:	0200                	addi	s0,sp,256
    196d:	4400                	lw	s0,8(s0)
    196f:	349f 0001 3800      	.insn	6, 0x38000001349f
    1975:	0001                	nop
    1977:	0200                	addi	s0,sp,256
    1979:	4300                	lw	s0,0(a4)
    197b:	389f 0001 3c00      	.insn	6, 0x3c000001389f
    1981:	0001                	nop
    1983:	0200                	addi	s0,sp,256
    1985:	4200                	lw	s0,0(a2)
    1987:	3c9f 0001 4000      	.insn	6, 0x400000013c9f
    198d:	0001                	nop
    198f:	0200                	addi	s0,sp,256
    1991:	4100                	lw	s0,0(a0)
    1993:	409f 0001 4400      	.insn	6, 0x44000001409f
    1999:	0001                	nop
    199b:	0200                	addi	s0,sp,256
    199d:	4000                	lw	s0,0(s0)
    199f:	449f 0001 4800      	.insn	6, 0x48000001449f
    19a5:	0001                	nop
    19a7:	0200                	addi	s0,sp,256
    19a9:	3f00                	.insn	2, 0x3f00
    19ab:	489f 0001 4c00      	.insn	6, 0x4c000001489f
    19b1:	0001                	nop
    19b3:	0200                	addi	s0,sp,256
    19b5:	3e00                	.insn	2, 0x3e00
    19b7:	4c9f 0001 5000      	.insn	6, 0x500000014c9f
    19bd:	0001                	nop
    19bf:	0200                	addi	s0,sp,256
    19c1:	3d00                	.insn	2, 0x3d00
    19c3:	509f 0001 5400      	.insn	6, 0x54000001509f
    19c9:	0001                	nop
    19cb:	0200                	addi	s0,sp,256
    19cd:	3c00                	.insn	2, 0x3c00
    19cf:	549f 0001 5800      	.insn	6, 0x58000001549f
    19d5:	0001                	nop
    19d7:	0200                	addi	s0,sp,256
    19d9:	3b00                	.insn	2, 0x3b00
    19db:	589f 0001 5c00      	.insn	6, 0x5c000001589f
    19e1:	0001                	nop
    19e3:	0200                	addi	s0,sp,256
    19e5:	3a00                	.insn	2, 0x3a00
    19e7:	5c9f 0001 6000      	.insn	6, 0x600000015c9f
    19ed:	0001                	nop
    19ef:	0200                	addi	s0,sp,256
    19f1:	3900                	.insn	2, 0x3900
    19f3:	609f 0001 6400      	.insn	6, 0x64000001609f
    19f9:	0001                	nop
    19fb:	0200                	addi	s0,sp,256
    19fd:	3800                	.insn	2, 0x3800
    19ff:	649f 0001 6800      	.insn	6, 0x68000001649f
    1a05:	0001                	nop
    1a07:	0200                	addi	s0,sp,256
    1a09:	3700                	.insn	2, 0x3700
    1a0b:	689f 0001 6c00      	.insn	6, 0x6c000001689f
    1a11:	0001                	nop
    1a13:	0200                	addi	s0,sp,256
    1a15:	3600                	.insn	2, 0x3600
    1a17:	6c9f 0001 7000      	.insn	6, 0x700000016c9f
    1a1d:	0001                	nop
    1a1f:	0200                	addi	s0,sp,256
    1a21:	3500                	.insn	2, 0x3500
    1a23:	709f 0001 7400      	.insn	6, 0x74000001709f
    1a29:	0001                	nop
    1a2b:	0200                	addi	s0,sp,256
    1a2d:	3400                	.insn	2, 0x3400
    1a2f:	749f 0001 7800      	.insn	6, 0x78000001749f
    1a35:	0001                	nop
    1a37:	0200                	addi	s0,sp,256
    1a39:	3300                	.insn	2, 0x3300
    1a3b:	789f 0001 7c00      	.insn	6, 0x7c000001789f
    1a41:	0001                	nop
    1a43:	0200                	addi	s0,sp,256
    1a45:	3200                	.insn	2, 0x3200
    1a47:	7c9f 0001 8000      	.insn	6, 0x800000017c9f
    1a4d:	0001                	nop
    1a4f:	0200                	addi	s0,sp,256
    1a51:	3100                	.insn	2, 0x3100
    1a53:	809f 0001 8400      	.insn	6, 0x84000001809f
    1a59:	0001                	nop
    1a5b:	0200                	addi	s0,sp,256
    1a5d:	3000                	.insn	2, 0x3000
    1a5f:	849f 0001 9400      	.insn	6, 0x94000001849f
    1a65:	0001                	nop
    1a67:	0400                	addi	s0,sp,512
    1a69:	3000                	.insn	2, 0x3000
    1a6b:	1c31                	addi	s8,s8,-20
    1a6d:	009f 0000 0000      	.insn	6, 0x009f
    1a73:	0000                	unimp
    1a75:	d400                	sw	s0,40(s0)
    1a77:	0001                	nop
    1a79:	0000                	unimp
    1a7b:	0002                	c.slli64	zero
    1a7d:	0100                	addi	s0,sp,128
    1a7f:	5a00                	lw	s0,48(a2)
    1a81:	0200                	addi	s0,sp,256
    1a83:	0000                	unimp
    1a85:	038c                	addi	a1,sp,448
    1a87:	0000                	unimp
    1a89:	0001                	nop
    1a8b:	0058                	addi	a4,sp,4
    1a8d:	0000                	unimp
    1a8f:	0000                	unimp
    1a91:	0000                	unimp
    1a93:	0c00                	addi	s0,sp,528
    1a95:	0002                	c.slli64	zero
    1a97:	2c00                	.insn	2, 0x2c00
    1a99:	0002                	c.slli64	zero
    1a9b:	0300                	addi	s0,sp,384
    1a9d:	1100                	addi	s0,sp,160
    1a9f:	9f00                	.insn	2, 0x9f00
    1aa1:	022c                	addi	a1,sp,264
    1aa3:	0000                	unimp
    1aa5:	0360                	addi	s0,sp,396
    1aa7:	0000                	unimp
    1aa9:	0001                	nop
    1aab:	7459                	lui	s0,0xffff6
    1aad:	88000003          	lb	zero,-1920(zero) # fffff880 <_stack_top+0xffef3ac0>
    1ab1:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
    1ab5:	5900                	lw	s0,48(a0)
	...
    1abf:	025c                	addi	a5,sp,260
    1ac1:	0000                	unimp
    1ac3:	033c                	addi	a5,sp,392
    1ac5:	0000                	unimp
    1ac7:	0001                	nop
    1ac9:	005d                	c.nop	23
    1acb:	0000                	unimp
    1acd:	0000                	unimp
    1acf:	0000                	unimp
    1ad1:	6400                	.insn	2, 0x6400
    1ad3:	0002                	c.slli64	zero
    1ad5:	3000                	.insn	2, 0x3000
    1ad7:	06000003          	lb	zero,96(zero) # 60 <$d.10+0xc>
    1adb:	7a00                	.insn	2, 0x7a00
    1add:	7200                	.insn	2, 0x7200
    1adf:	1c0c                	addi	a1,sp,560
    1ae1:	349f 0003 3800      	.insn	6, 0x38000003349f
    1ae7:	09000003          	lb	zero,144(zero) # 90 <$d.10+0x3c>
    1aeb:	7a00                	.insn	2, 0x7a00
    1aed:	7200                	.insn	2, 0x7200
    1aef:	1c0c                	addi	a1,sp,560
    1af1:	0111                	addi	sp,sp,4
    1af3:	9f22                	add	t5,t5,s0
	...
    1afd:	0264                	addi	s1,sp,268
    1aff:	0000                	unimp
    1b01:	0290                	addi	a2,sp,320
    1b03:	0000                	unimp
    1b05:	0001                	nop
    1b07:	0002905b          	.insn	4, 0x0002905b
    1b0b:	a800                	.insn	2, 0xa800
    1b0d:	0002                	c.slli64	zero
    1b0f:	0100                	addi	s0,sp,128
    1b11:	5c00                	lw	s0,56(s0)
    1b13:	02a8                	addi	a0,sp,328
    1b15:	0000                	unimp
    1b17:	02c0                	addi	s0,sp,324
    1b19:	0000                	unimp
    1b1b:	0001                	nop
    1b1d:	c05e                	sw	s7,0(sp)
    1b1f:	0002                	c.slli64	zero
    1b21:	d800                	sw	s0,48(s0)
    1b23:	0002                	c.slli64	zero
    1b25:	0100                	addi	s0,sp,128
    1b27:	5f00                	lw	s0,56(a4)
    1b29:	02d8                	addi	a4,sp,324
    1b2b:	0000                	unimp
    1b2d:	02e8                	addi	a0,sp,332
    1b2f:	0000                	unimp
    1b31:	0001                	nop
    1b33:	0003085b          	.insn	4, 0x0003085b
    1b37:	1800                	addi	s0,sp,48
    1b39:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
    1b3d:	5c00                	lw	s0,56(s0)
    1b3f:	0334                	addi	a3,sp,392
    1b41:	0000                	unimp
    1b43:	0338                	addi	a4,sp,392
    1b45:	0000                	unimp
    1b47:	0001                	nop
    1b49:	0000005b          	.insn	4, 0x005b
    1b4d:	0000                	unimp
    1b4f:	0000                	unimp
    1b51:	7800                	.insn	2, 0x7800
    1b53:	0002                	c.slli64	zero
    1b55:	9000                	.insn	2, 0x9000
    1b57:	0002                	c.slli64	zero
    1b59:	0300                	addi	s0,sp,384
    1b5b:	1100                	addi	s0,sp,160
    1b5d:	9f00                	.insn	2, 0x9f00
    1b5f:	0290                	addi	a2,sp,320
    1b61:	0000                	unimp
    1b63:	02a8                	addi	a0,sp,328
    1b65:	0000                	unimp
    1b67:	01110003          	lb	zero,17(sp)
    1b6b:	a89f 0002 c000      	.insn	6, 0xc0000002a89f
    1b71:	0002                	c.slli64	zero
    1b73:	0300                	addi	s0,sp,384
    1b75:	1100                	addi	s0,sp,160
    1b77:	9f02                	jalr	t5
    1b79:	02c0                	addi	s0,sp,324
    1b7b:	0000                	unimp
    1b7d:	02d8                	addi	a4,sp,324
    1b7f:	0000                	unimp
    1b81:	03110003          	lb	zero,49(sp)
    1b85:	d89f 0002 e800      	.insn	6, 0xe8000002d89f
    1b8b:	0002                	c.slli64	zero
    1b8d:	0300                	addi	s0,sp,384
    1b8f:	1100                	addi	s0,sp,160
    1b91:	9f04                	.insn	2, 0x9f04
    1b93:	02e8                	addi	a0,sp,332
    1b95:	0000                	unimp
    1b97:	0308                	addi	a0,sp,384
    1b99:	0000                	unimp
    1b9b:	05110003          	lb	zero,81(sp)
    1b9f:	089f 0003 1800      	.insn	6, 0x18000003089f
    1ba5:	03000003          	lb	zero,48(zero) # 30 <$d.3+0xf>
    1ba9:	1100                	addi	s0,sp,160
    1bab:	9f06                	add	t5,t5,ra
    1bad:	0318                	addi	a4,sp,384
    1baf:	0000                	unimp
    1bb1:	0338                	addi	a4,sp,392
    1bb3:	0000                	unimp
    1bb5:	07110003          	lb	zero,113(sp)
    1bb9:	009f 0000 0000      	.insn	6, 0x009f
    1bbf:	0000                	unimp
    1bc1:	3c00                	.insn	2, 0x3c00
    1bc3:	40000003          	lb	zero,1024(zero) # 400 <$d.8+0x38>
    1bc7:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
    1bcb:	5b00                	lw	s0,48(a4)
	...
    1bd5:	033c                	addi	a5,sp,392
    1bd7:	0000                	unimp
    1bd9:	0358                	addi	a4,sp,388
    1bdb:	0000                	unimp
    1bdd:	007d0003          	lb	zero,7(s10)
    1be1:	749f 0003 8800      	.insn	6, 0x88000003749f
    1be7:	03000003          	lb	zero,48(zero) # 30 <$d.3+0xf>
    1beb:	7d00                	.insn	2, 0x7d00
    1bed:	9f00                	.insn	2, 0x9f00
	...

00001bf7 <$d.5>:
    1bf7:	0000                	unimp
    1bf9:	0000                	unimp
    1bfb:	0020                	addi	s0,sp,8
    1bfd:	0000                	unimp
    1bff:	0001                	nop
    1c01:	305a                	.insn	2, 0x305a
    1c03:	0000                	unimp
    1c05:	3c00                	.insn	2, 0x3c00
    1c07:	0000                	unimp
    1c09:	0100                	addi	s0,sp,128
    1c0b:	5a00                	lw	s0,48(a2)
	...
    1c15:	0014                	.insn	2, 0x0014
    1c17:	0000                	unimp
    1c19:	0048                	addi	a0,sp,4
    1c1b:	0000                	unimp
    1c1d:	0001                	nop
    1c1f:	0058                	addi	a4,sp,4
    1c21:	0000                	unimp
    1c23:	0000                	unimp
    1c25:	0000                	unimp
    1c27:	3400                	.insn	2, 0x3400
    1c29:	0000                	unimp
    1c2b:	4800                	lw	s0,16(s0)
    1c2d:	0000                	unimp
    1c2f:	0100                	addi	s0,sp,128
    1c31:	5b00                	lw	s0,48(a4)
	...
    1c3b:	0060                	addi	s0,sp,12
    1c3d:	0000                	unimp
    1c3f:	009c                	addi	a5,sp,64
    1c41:	0000                	unimp
    1c43:	0001                	nop
    1c45:	9c5a                	add	s8,s8,s6
    1c47:	0000                	unimp
    1c49:	d800                	sw	s0,48(s0)
    1c4b:	0000                	unimp
    1c4d:	0100                	addi	s0,sp,128
    1c4f:	5900                	lw	s0,48(a0)
    1c51:	00f4                	addi	a3,sp,76
    1c53:	0000                	unimp
    1c55:	00fc                	addi	a5,sp,76
    1c57:	0000                	unimp
    1c59:	0001                	nop
    1c5b:	0059                	c.nop	22
    1c5d:	0000                	unimp
    1c5f:	0000                	unimp
    1c61:	0000                	unimp
    1c63:	7c00                	.insn	2, 0x7c00
    1c65:	0001                	nop
    1c67:	9c00                	.insn	2, 0x9c00
    1c69:	0001                	nop
    1c6b:	0300                	addi	s0,sp,384
    1c6d:	7a00                	.insn	2, 0x7a00
    1c6f:	00009f0b          	.insn	4, 0x9f0b
    1c73:	0000                	unimp
    1c75:	0000                	unimp
    1c77:	0000                	unimp
    1c79:	01ac                	addi	a1,sp,200
    1c7b:	0000                	unimp
    1c7d:	01bc                	addi	a5,sp,200
    1c7f:	0000                	unimp
    1c81:	0e7b0003          	lb	zero,231(s6)
    1c85:	009f 0000 0000      	.insn	6, 0x009f
    1c8b:	0000                	unimp
    1c8d:	cc00                	sw	s0,24(s0)
    1c8f:	0001                	nop
    1c91:	f800                	.insn	2, 0xf800
    1c93:	0001                	nop
    1c95:	0300                	addi	s0,sp,384
    1c97:	7b00                	.insn	2, 0x7b00
    1c99:	9f24                	.insn	2, 0x9f24
	...
    1ca3:	01f8                	addi	a4,sp,204
    1ca5:	0000                	unimp
    1ca7:	0208                	addi	a0,sp,256
    1ca9:	0000                	unimp
    1cab:	2c7b0003          	lb	zero,711(s6)
    1caf:	009f 0000 0000      	.insn	6, 0x009f
    1cb5:	0000                	unimp
    1cb7:	2800                	.insn	2, 0x2800
    1cb9:	0002                	c.slli64	zero
    1cbb:	3800                	.insn	2, 0x3800
    1cbd:	0002                	c.slli64	zero
    1cbf:	0400                	addi	s0,sp,512
    1cc1:	7a00                	.insn	2, 0x7a00
    1cc3:	03c6                	slli	t2,t2,0x11
    1cc5:	009f 0000 0000      	.insn	6, 0x009f
    1ccb:	0000                	unimp
    1ccd:	1800                	addi	s0,sp,48
    1ccf:	f4000003          	lb	zero,-192(zero) # ffffff40 <_stack_top+0xffef4180>
    1cd3:	03000003          	lb	zero,48(zero) # 30 <$d.3+0xf>
    1cd7:	8b00                	.insn	2, 0x8b00
    1cd9:	00009f0b          	.insn	4, 0x9f0b
    1cdd:	0000                	unimp
    1cdf:	0000                	unimp
    1ce1:	0000                	unimp
    1ce3:	0328                	addi	a0,sp,392
    1ce5:	0000                	unimp
    1ce7:	0338                	addi	a4,sp,392
    1ce9:	0000                	unimp
    1ceb:	0008                	.insn	2, 0x0008
    1ced:	007a                	c.slli	zero,0x1e
    1cef:	ff10                	.insn	2, 0xff10
    1cf1:	03ff 9f1a 0000 0000 	.insn	10, 0x9f1a03ff
    1cf9:	0000 
    1cfb:	0000                	unimp
    1cfd:	0494                	addi	a3,sp,576
    1cff:	0000                	unimp
    1d01:	04e8                	addi	a0,sp,588
    1d03:	0000                	unimp
    1d05:	0001                	nop
    1d07:	0058                	addi	a4,sp,4
    1d09:	0000                	unimp
    1d0b:	0000                	unimp
    1d0d:	0000                	unimp
    1d0f:	6400                	.insn	2, 0x6400
    1d11:	0004                	.insn	2, 0x0004
    1d13:	cc00                	sw	s0,24(s0)
    1d15:	0005                	c.nop	1
    1d17:	0100                	addi	s0,sp,128
    1d19:	6200                	.insn	2, 0x6200
	...
    1d23:	05d4                	addi	a3,sp,708
    1d25:	0000                	unimp
    1d27:	05e8                	addi	a0,sp,716
    1d29:	0000                	unimp
    1d2b:	0001                	nop
    1d2d:	0000005b          	.insn	4, 0x005b
    1d31:	0000                	unimp
    1d33:	0000                	unimp
    1d35:	f800                	.insn	2, 0xf800
    1d37:	0005                	c.nop	1
    1d39:	1c00                	addi	s0,sp,560
    1d3b:	0006                	c.slli	zero,0x1
    1d3d:	0300                	addi	s0,sp,384
    1d3f:	7b00                	.insn	2, 0x7b00
    1d41:	00009f0b          	.insn	4, 0x9f0b
    1d45:	0000                	unimp
    1d47:	0000                	unimp
    1d49:	0000                	unimp
    1d4b:	062c                	addi	a1,sp,776
    1d4d:	0000                	unimp
    1d4f:	0640                	addi	s0,sp,772
    1d51:	0000                	unimp
    1d53:	0e7b0003          	lb	zero,231(s6)
    1d57:	009f 0000 0000      	.insn	6, 0x009f
    1d5d:	0000                	unimp
    1d5f:	5000                	lw	s0,32(s0)
    1d61:	0006                	c.slli	zero,0x1
    1d63:	7c00                	.insn	2, 0x7c00
    1d65:	0006                	c.slli	zero,0x1
    1d67:	0300                	addi	s0,sp,384
    1d69:	7a00                	.insn	2, 0x7a00
    1d6b:	9f24                	.insn	2, 0x9f24
	...
    1d75:	067c                	addi	a5,sp,780
    1d77:	0000                	unimp
    1d79:	068c                	addi	a1,sp,832
    1d7b:	0000                	unimp
    1d7d:	2c7a0003          	lb	zero,711(s4)
    1d81:	009f 0000 0000      	.insn	6, 0x009f
    1d87:	0000                	unimp
    1d89:	b800                	.insn	2, 0xb800
    1d8b:	0006                	c.slli	zero,0x1
    1d8d:	f400                	.insn	2, 0xf400
    1d8f:	0006                	c.slli	zero,0x1
    1d91:	0100                	addi	s0,sp,128
    1d93:	5a00                	lw	s0,48(a2)
	...
    1d9d:	06f0                	addi	a2,sp,844
    1d9f:	0000                	unimp
    1da1:	0740                	addi	s0,sp,900
    1da3:	0000                	unimp
    1da5:	0001                	nop
    1da7:	0062                	c.slli	zero,0x18
    1da9:	0000                	unimp
    1dab:	0000                	unimp
    1dad:	0000                	unimp
    1daf:	1000                	addi	s0,sp,32
    1db1:	14000007          	.insn	4, 0x14000007
    1db5:	01000007          	.insn	4, 0x01000007
    1db9:	5a00                	lw	s0,48(a2)
	...
    1dc3:	06f4                	addi	a3,sp,844
    1dc5:	0000                	unimp
    1dc7:	06f8                	addi	a4,sp,844
    1dc9:	0000                	unimp
    1dcb:	0006                	c.slli	zero,0x1
    1dcd:	007a007b          	.insn	4, 0x007a007b
    1dd1:	9f22                	add	t5,t5,s0
    1dd3:	06f8                	addi	a4,sp,844
    1dd5:	0000                	unimp
    1dd7:	0708                	addi	a0,sp,896
    1dd9:	0000                	unimp
    1ddb:	0001                	nop
    1ddd:	005a                	c.slli	zero,0x16
    1ddf:	0000                	unimp
    1de1:	0000                	unimp
    1de3:	0000                	unimp
    1de5:	1400                	addi	s0,sp,544
    1de7:	28000007          	.insn	4, 0x28000007
    1deb:	01000007          	.insn	4, 0x01000007
    1def:	5a00                	lw	s0,48(a2)
	...
    1df9:	075c                	addi	a5,sp,900
    1dfb:	0000                	unimp
    1dfd:	07a0                	addi	s0,sp,968
    1dff:	0000                	unimp
    1e01:	0001                	nop
    1e03:	a05a                	.insn	2, 0xa05a
    1e05:	2c000007          	.insn	4, 0x2c000007
    1e09:	0009                	c.nop	2
    1e0b:	0100                	addi	s0,sp,128
    1e0d:	6200                	.insn	2, 0x6200
	...
    1e17:	075c                	addi	a5,sp,900
    1e19:	0000                	unimp
    1e1b:	079c                	addi	a5,sp,960
    1e1d:	0000                	unimp
    1e1f:	0001                	nop
    1e21:	00079c5b          	.insn	4, 0x00079c5b
    1e25:	ec00                	.insn	2, 0xec00
    1e27:	0200000b          	.insn	4, 0x0200000b
    1e2b:	7200                	.insn	2, 0x7200
    1e2d:	0030                	addi	a2,sp,8
    1e2f:	0000                	unimp
    1e31:	0000                	unimp
    1e33:	0000                	unimp
    1e35:	5c00                	lw	s0,56(s0)
    1e37:	98000007          	.insn	4, 0x98000007
    1e3b:	01000007          	.insn	4, 0x01000007
    1e3f:	5c00                	lw	s0,56(s0)
    1e41:	0798                	addi	a4,sp,960
    1e43:	0000                	unimp
    1e45:	0bec                	addi	a1,sp,476
    1e47:	0000                	unimp
    1e49:	0002                	c.slli64	zero
    1e4b:	3472                	.insn	2, 0x3472
	...
    1e55:	07b4                	addi	a3,sp,968
    1e57:	0000                	unimp
    1e59:	07b8                	addi	a4,sp,968
    1e5b:	0000                	unimp
    1e5d:	00110003          	lb	zero,1(sp)
    1e61:	b89f 0007 bc00      	.insn	6, 0xbc000007b89f
    1e67:	03000007          	.insn	4, 0x03000007
    1e6b:	1100                	addi	s0,sp,160
    1e6d:	9f01                	.insn	2, 0x9f01
    1e6f:	07bc                	addi	a5,sp,968
    1e71:	0000                	unimp
    1e73:	07c0                	addi	s0,sp,964
    1e75:	0000                	unimp
    1e77:	02110003          	lb	zero,33(sp)
    1e7b:	c09f 0007 c400      	.insn	6, 0xc4000007c09f
    1e81:	03000007          	.insn	4, 0x03000007
    1e85:	1100                	addi	s0,sp,160
    1e87:	07c49f03          	lh	t5,124(s1)
    1e8b:	0000                	unimp
    1e8d:	07c8                	addi	a0,sp,964
    1e8f:	0000                	unimp
    1e91:	04110003          	lb	zero,65(sp)
    1e95:	c89f 0007 cc00      	.insn	6, 0xcc000007c89f
    1e9b:	03000007          	.insn	4, 0x03000007
    1e9f:	1100                	addi	s0,sp,160
    1ea1:	9f05                	.insn	2, 0x9f05
    1ea3:	07cc                	addi	a1,sp,964
    1ea5:	0000                	unimp
    1ea7:	07d0                	addi	a2,sp,964
    1ea9:	0000                	unimp
    1eab:	06110003          	lb	zero,97(sp)
    1eaf:	d09f 0007 d800      	.insn	6, 0xd8000007d09f
    1eb5:	03000007          	.insn	4, 0x03000007
    1eb9:	1100                	addi	s0,sp,160
    1ebb:	07d89f07          	.insn	4, 0x07d89f07
    1ebf:	0000                	unimp
    1ec1:	07dc                	addi	a5,sp,964
    1ec3:	0000                	unimp
    1ec5:	08110003          	lb	zero,129(sp)
    1ec9:	dc9f 0007 e000      	.insn	6, 0xe0000007dc9f
    1ecf:	03000007          	.insn	4, 0x03000007
    1ed3:	1100                	addi	s0,sp,160
    1ed5:	9f09                	.insn	2, 0x9f09
    1ed7:	07e0                	addi	s0,sp,972
    1ed9:	0000                	unimp
    1edb:	07e4                	addi	s1,sp,972
    1edd:	0000                	unimp
    1edf:	0a110003          	lb	zero,161(sp)
    1ee3:	e49f 0007 e800      	.insn	6, 0xe8000007e49f
    1ee9:	03000007          	.insn	4, 0x03000007
    1eed:	1100                	addi	s0,sp,160
    1eef:	00009f0b          	.insn	4, 0x9f0b
    1ef3:	0000                	unimp
    1ef5:	0000                	unimp
    1ef7:	0000                	unimp
    1ef9:	07e4                	addi	s1,sp,972
    1efb:	0000                	unimp
    1efd:	07fc                	addi	a5,sp,972
    1eff:	0000                	unimp
    1f01:	00110003          	lb	zero,1(sp)
    1f05:	fc9f 0007 2c00      	.insn	6, 0x2c000007fc9f
    1f0b:	0008                	.insn	2, 0x0008
    1f0d:	0100                	addi	s0,sp,128
    1f0f:	5b00                	lw	s0,48(a4)
    1f11:	082c                	addi	a1,sp,24
    1f13:	0000                	unimp
    1f15:	0840                	addi	s0,sp,20
    1f17:	0000                	unimp
    1f19:	0001                	nop
    1f1b:	4060                	lw	s0,68(s0)
    1f1d:	0008                	.insn	2, 0x0008
    1f1f:	4800                	lw	s0,16(s0)
    1f21:	0008                	.insn	2, 0x0008
    1f23:	0300                	addi	s0,sp,384
    1f25:	1100                	addi	s0,sp,160
    1f27:	9f00                	.insn	2, 0x9f00
    1f29:	0848                	addi	a0,sp,20
    1f2b:	0000                	unimp
    1f2d:	084c                	addi	a1,sp,20
    1f2f:	0000                	unimp
    1f31:	0001                	nop
    1f33:	00085c5b          	.insn	4, 0x00085c5b
    1f37:	7800                	.insn	2, 0x7800
    1f39:	0008                	.insn	2, 0x0008
    1f3b:	0300                	addi	s0,sp,384
    1f3d:	1100                	addi	s0,sp,160
    1f3f:	9f08                	.insn	2, 0x9f08
    1f41:	0898                	addi	a4,sp,80
    1f43:	0000                	unimp
    1f45:	08a8                	addi	a0,sp,88
    1f47:	0000                	unimp
    1f49:	0001                	nop
    1f4b:	a85f 0008 b000      	.insn	6, 0xb0000008a85f
    1f51:	0008                	.insn	2, 0x0008
    1f53:	0100                	addi	s0,sp,128
    1f55:	5e00                	lw	s0,56(a2)
	...
    1f5f:	07e4                	addi	s1,sp,972
    1f61:	0000                	unimp
    1f63:	07fc                	addi	a5,sp,972
    1f65:	0000                	unimp
    1f67:	00110003          	lb	zero,1(sp)
    1f6b:	fc9f 0007 3000      	.insn	6, 0x30000007fc9f
    1f71:	0008                	.insn	2, 0x0008
    1f73:	0100                	addi	s0,sp,128
    1f75:	5b00                	lw	s0,48(a4)
    1f77:	0834                	addi	a3,sp,24
    1f79:	0000                	unimp
    1f7b:	0840                	addi	s0,sp,20
    1f7d:	0000                	unimp
    1f7f:	0001                	nop
    1f81:	4060                	lw	s0,68(s0)
    1f83:	0008                	.insn	2, 0x0008
    1f85:	4800                	lw	s0,16(s0)
    1f87:	0008                	.insn	2, 0x0008
    1f89:	0300                	addi	s0,sp,384
    1f8b:	1100                	addi	s0,sp,160
    1f8d:	9f00                	.insn	2, 0x9f00
    1f8f:	0848                	addi	a0,sp,20
    1f91:	0000                	unimp
    1f93:	084c                	addi	a1,sp,20
    1f95:	0000                	unimp
    1f97:	0001                	nop
    1f99:	00085c5b          	.insn	4, 0x00085c5b
    1f9d:	7800                	.insn	2, 0x7800
    1f9f:	0008                	.insn	2, 0x0008
    1fa1:	0100                	addi	s0,sp,128
    1fa3:	6000                	.insn	2, 0x6000
	...
    1fad:	08b8                	addi	a4,sp,88
    1faf:	0000                	unimp
    1fb1:	0acc                	addi	a1,sp,340
    1fb3:	0000                	unimp
    1fb5:	0001                	nop
    1fb7:	0059                	c.nop	22
    1fb9:	3800000b          	.insn	4, 0x3800000b
    1fbd:	0100000b          	.insn	4, 0x0100000b
    1fc1:	5900                	lw	s0,48(a0)
    1fc3:	0b68                	addi	a0,sp,412
    1fc5:	0000                	unimp
    1fc7:	0bec                	addi	a1,sp,476
    1fc9:	0000                	unimp
    1fcb:	0001                	nop
    1fcd:	0059                	c.nop	22
    1fcf:	0000                	unimp
    1fd1:	0000                	unimp
    1fd3:	0000                	unimp
    1fd5:	8800                	.insn	2, 0x8800
    1fd7:	0009                	c.nop	2
    1fd9:	0c00                	addi	s0,sp,528
    1fdb:	0100000b          	.insn	4, 0x0100000b
    1fdf:	6400                	.insn	2, 0x6400
    1fe1:	0b18                	addi	a4,sp,400
    1fe3:	0000                	unimp
    1fe5:	0b20                	addi	s0,sp,408
    1fe7:	0000                	unimp
    1fe9:	0001                	nop
    1feb:	6864                	.insn	2, 0x6864
    1fed:	ec00000b          	.insn	4, 0xec00000b
    1ff1:	0100000b          	.insn	4, 0x0100000b
    1ff5:	6400                	.insn	2, 0x6400
	...
    1fff:	0994                	addi	a3,sp,208
    2001:	0000                	unimp
    2003:	09a4                	addi	s1,sp,216
    2005:	0000                	unimp
    2007:	0002                	c.slli64	zero
    2009:	9f30                	.insn	2, 0x9f30
    200b:	09a4                	addi	s1,sp,216
    200d:	0000                	unimp
    200f:	0a90                	addi	a2,sp,336
    2011:	0000                	unimp
    2013:	0001                	nop
    2015:	1862                	slli	a6,a6,0x38
    2017:	2000000b          	.insn	4, 0x2000000b
    201b:	0100000b          	.insn	4, 0x0100000b
    201f:	6200                	.insn	2, 0x6200
    2021:	0b68                	addi	a0,sp,412
    2023:	0000                	unimp
    2025:	0bec                	addi	a1,sp,476
    2027:	0000                	unimp
    2029:	0001                	nop
    202b:	0062                	c.slli	zero,0x18
    202d:	0000                	unimp
    202f:	0000                	unimp
    2031:	0000                	unimp
    2033:	d800                	sw	s0,48(s0)
    2035:	0009                	c.nop	2
    2037:	e400                	.insn	2, 0xe400
    2039:	0009                	c.nop	2
    203b:	0100                	addi	s0,sp,128
    203d:	5800                	lw	s0,48(s0)
    203f:	09e4                	addi	s1,sp,220
    2041:	0000                	unimp
    2043:	0a90                	addi	a2,sp,336
    2045:	0000                	unimp
    2047:	0001                	nop
    2049:	1865                	addi	a6,a6,-7
    204b:	2000000b          	.insn	4, 0x2000000b
    204f:	0100000b          	.insn	4, 0x0100000b
    2053:	6500                	.insn	2, 0x6500
    2055:	0b74                	addi	a3,sp,412
    2057:	0000                	unimp
    2059:	0bec                	addi	a1,sp,476
    205b:	0000                	unimp
    205d:	0001                	nop
    205f:	0065                	c.nop	25
    2061:	0000                	unimp
    2063:	0000                	unimp
    2065:	0000                	unimp
    2067:	e400                	.insn	2, 0xe400
    2069:	0009                	c.nop	2
    206b:	e800                	.insn	2, 0xe800
    206d:	0009                	c.nop	2
    206f:	0900                	addi	s0,sp,144
    2071:	8300                	.insn	2, 0x8300
    2073:	1100                	addi	s0,sp,160
    2075:	1c10                	addi	a2,sp,560
    2077:	7f11                	lui	t5,0xfffe4
    2079:	09ec9f1b          	.insn	4, 0x09ec9f1b
    207d:	0000                	unimp
    207f:	09f0                	addi	a2,sp,220
    2081:	0000                	unimp
    2083:	000c                	.insn	2, 0x000c
    2085:	10110083          	lb	ra,257(sp)
    2089:	111c                	addi	a5,sp,160
    208b:	01111b7f 09f09f22 	.insn	12, 0x0a90000009f09f2201111b7f
    2093:	0a900000 
    2097:	0000                	unimp
    2099:	0009                	c.nop	2
    209b:	10110083          	lb	ra,257(sp)
    209f:	111c                	addi	a5,sp,160
    20a1:	189f1b7f 2000000b 	.insn	12, 0x0900000b2000000b189f1b7f
    20a9:	0900000b 
    20ad:	8300                	.insn	2, 0x8300
    20af:	1100                	addi	s0,sp,160
    20b1:	1c10                	addi	a2,sp,560
    20b3:	7f11                	lui	t5,0xfffe4
    20b5:	0b749f1b          	.insn	4, 0x0b749f1b
    20b9:	0000                	unimp
    20bb:	0bec                	addi	a1,sp,476
    20bd:	0000                	unimp
    20bf:	0009                	c.nop	2
    20c1:	10110083          	lb	ra,257(sp)
    20c5:	111c                	addi	a5,sp,160
    20c7:	009f1b7f 00000000 	.insn	12, 0x009f1b7f
    20cf:	00000000 
    20d3:	000a                	c.slli	zero,0x2
    20d5:	0400                	addi	s0,sp,512
    20d7:	000a                	c.slli	zero,0x2
    20d9:	0100                	addi	s0,sp,128
    20db:	5a00                	lw	s0,48(a2)
	...
    20e5:	0a14                	addi	a3,sp,272
    20e7:	0000                	unimp
    20e9:	0a18                	addi	a4,sp,272
    20eb:	0000                	unimp
    20ed:	00110003          	lb	zero,1(sp)
    20f1:	189f 000a 1c00      	.insn	6, 0x1c00000a189f
    20f7:	000a                	c.slli	zero,0x2
    20f9:	0500                	addi	s0,sp,640
    20fb:	1100                	addi	s0,sp,160
    20fd:	2300                	.insn	2, 0x2300
    20ff:	9f01                	.insn	2, 0x9f01
    2101:	0a1c                	addi	a5,sp,272
    2103:	0000                	unimp
    2105:	0a20                	addi	s0,sp,280
    2107:	0000                	unimp
    2109:	01110003          	lb	zero,17(sp)
    210d:	209f 000a 2400      	.insn	6, 0x2400000a209f
    2113:	000a                	c.slli	zero,0x2
    2115:	0500                	addi	s0,sp,640
    2117:	1100                	addi	s0,sp,160
    2119:	2301                	jal	2619 <$d.7+0x7d1>
    211b:	9f01                	.insn	2, 0x9f01
    211d:	0a24                	addi	s1,sp,280
    211f:	0000                	unimp
    2121:	0a28                	addi	a0,sp,280
    2123:	0000                	unimp
    2125:	02110003          	lb	zero,33(sp)
    2129:	289f 000a 2c00      	.insn	6, 0x2c00000a289f
    212f:	000a                	c.slli	zero,0x2
    2131:	0500                	addi	s0,sp,640
    2133:	1100                	addi	s0,sp,160
    2135:	2302                	.insn	2, 0x2302
    2137:	9f01                	.insn	2, 0x9f01
    2139:	0a2c                	addi	a1,sp,280
    213b:	0000                	unimp
    213d:	0a30                	addi	a2,sp,280
    213f:	0000                	unimp
    2141:	03110003          	lb	zero,49(sp)
    2145:	309f 000a 3800      	.insn	6, 0x3800000a309f
    214b:	000a                	c.slli	zero,0x2
    214d:	0500                	addi	s0,sp,640
    214f:	1100                	addi	s0,sp,160
    2151:	9f012303          	lw	t1,-1552(sp)
    2155:	0a38                	addi	a4,sp,280
    2157:	0000                	unimp
    2159:	0a3c                	addi	a5,sp,280
    215b:	0000                	unimp
    215d:	04110003          	lb	zero,65(sp)
    2161:	3c9f 000a 4400      	.insn	6, 0x4400000a3c9f
    2167:	000a                	c.slli	zero,0x2
    2169:	0500                	addi	s0,sp,640
    216b:	1100                	addi	s0,sp,160
    216d:	2304                	.insn	2, 0x2304
    216f:	9f01                	.insn	2, 0x9f01
    2171:	0a44                	addi	s1,sp,276
    2173:	0000                	unimp
    2175:	0a48                	addi	a0,sp,276
    2177:	0000                	unimp
    2179:	05110003          	lb	zero,81(sp)
    217d:	489f 000a 5000      	.insn	6, 0x5000000a489f
    2183:	000a                	c.slli	zero,0x2
    2185:	0500                	addi	s0,sp,640
    2187:	1100                	addi	s0,sp,160
    2189:	2305                	jal	26a9 <$d.7+0x861>
    218b:	9f01                	.insn	2, 0x9f01
    218d:	0a50                	addi	a2,sp,276
    218f:	0000                	unimp
    2191:	0a54                	addi	a3,sp,276
    2193:	0000                	unimp
    2195:	06110003          	lb	zero,97(sp)
    2199:	549f 000a 5c00      	.insn	6, 0x5c00000a549f
    219f:	000a                	c.slli	zero,0x2
    21a1:	0500                	addi	s0,sp,640
    21a3:	1100                	addi	s0,sp,160
    21a5:	2306                	.insn	2, 0x2306
    21a7:	9f01                	.insn	2, 0x9f01
    21a9:	0a5c                	addi	a5,sp,276
    21ab:	0000                	unimp
    21ad:	0a60                	addi	s0,sp,284
    21af:	0000                	unimp
    21b1:	07110003          	lb	zero,113(sp)
    21b5:	609f 000a 6800      	.insn	6, 0x6800000a609f
    21bb:	000a                	c.slli	zero,0x2
    21bd:	0500                	addi	s0,sp,640
    21bf:	1100                	addi	s0,sp,160
    21c1:	9f012307          	.insn	4, 0x9f012307
    21c5:	0a68                	addi	a0,sp,284
    21c7:	0000                	unimp
    21c9:	0a6c                	addi	a1,sp,284
    21cb:	0000                	unimp
    21cd:	08110003          	lb	zero,129(sp)
    21d1:	6c9f 000a 7400      	.insn	6, 0x7400000a6c9f
    21d7:	000a                	c.slli	zero,0x2
    21d9:	0500                	addi	s0,sp,640
    21db:	1100                	addi	s0,sp,160
    21dd:	2308                	.insn	2, 0x2308
    21df:	9f01                	.insn	2, 0x9f01
    21e1:	0a74                	addi	a3,sp,284
    21e3:	0000                	unimp
    21e5:	0a78                	addi	a4,sp,284
    21e7:	0000                	unimp
    21e9:	09110003          	lb	zero,145(sp)
    21ed:	789f 000a 8000      	.insn	6, 0x8000000a789f
    21f3:	000a                	c.slli	zero,0x2
    21f5:	0500                	addi	s0,sp,640
    21f7:	1100                	addi	s0,sp,160
    21f9:	2309                	jal	26fb <$d.7+0x8b3>
    21fb:	9f01                	.insn	2, 0x9f01
    21fd:	0a80                	addi	s0,sp,336
    21ff:	0000                	unimp
    2201:	0a84                	addi	s1,sp,336
    2203:	0000                	unimp
    2205:	0a110003          	lb	zero,161(sp)
    2209:	849f 000a 9000      	.insn	6, 0x9000000a849f
    220f:	000a                	c.slli	zero,0x2
    2211:	0500                	addi	s0,sp,640
    2213:	1100                	addi	s0,sp,160
    2215:	230a                	.insn	2, 0x230a
    2217:	9f01                	.insn	2, 0x9f01
	...
    2221:	0a14                	addi	a3,sp,272
    2223:	0000                	unimp
    2225:	0a90                	addi	a2,sp,336
    2227:	0000                	unimp
    2229:	01110003          	lb	zero,17(sp)
    222d:	749f 000b ec00      	.insn	6, 0xec00000b749f
    2233:	0300000b          	.insn	4, 0x0300000b
    2237:	1100                	addi	s0,sp,160
    2239:	9f01                	.insn	2, 0x9f01
	...
    2243:	0ad0                	addi	a2,sp,340
    2245:	0000                	unimp
    2247:	0ad4                	addi	a3,sp,340
    2249:	0000                	unimp
    224b:	0001                	nop
    224d:	0059                	c.nop	22
    224f:	0000                	unimp
    2251:	0000                	unimp
    2253:	0000                	unimp
    2255:	b800                	.insn	2, 0xb800
    2257:	000a                	c.slli	zero,0x2
    2259:	bc00                	.insn	2, 0xbc00
    225b:	000a                	c.slli	zero,0x2
    225d:	0600                	addi	s0,sp,768
    225f:	7a00                	.insn	2, 0x7a00
    2261:	7b00                	.insn	2, 0x7b00
    2263:	2200                	.insn	2, 0x2200
    2265:	bc9f 000a c400      	.insn	6, 0xc400000abc9f
    226b:	000a                	c.slli	zero,0x2
    226d:	0100                	addi	s0,sp,128
    226f:	5a00                	lw	s0,48(a2)
	...
    2279:	0aa4                	addi	s1,sp,344
    227b:	0000                	unimp
    227d:	0acc                	addi	a1,sp,340
    227f:	0000                	unimp
    2281:	0001                	nop
    2283:	0059                	c.nop	22
	...
    228d:	0c00000b          	.insn	4, 0x0c00000b
    2291:	0100000b          	.insn	4, 0x0100000b
    2295:	5900                	lw	s0,48(a0)
	...
    229f:	0bec                	addi	a1,sp,476
    22a1:	0000                	unimp
    22a3:	0c30                	addi	a2,sp,536
    22a5:	0000                	unimp
    22a7:	0001                	nop
    22a9:	305a                	.insn	2, 0x305a
    22ab:	000c                	.insn	2, 0x000c
    22ad:	4c00                	lw	s0,24(s0)
    22af:	000c                	.insn	2, 0x000c
    22b1:	0100                	addi	s0,sp,128
    22b3:	5800                	lw	s0,48(s0)
    22b5:	0c4c                	addi	a1,sp,532
    22b7:	0000                	unimp
    22b9:	0c54                	addi	a3,sp,532
    22bb:	0000                	unimp
    22bd:	0001                	nop
    22bf:	005a                	c.slli	zero,0x16
    22c1:	0000                	unimp
    22c3:	0000                	unimp
    22c5:	0000                	unimp
    22c7:	ec00                	.insn	2, 0xec00
    22c9:	2c00000b          	.insn	4, 0x2c00000b
    22cd:	000c                	.insn	2, 0x000c
    22cf:	0100                	addi	s0,sp,128
    22d1:	5b00                	lw	s0,48(a4)
    22d3:	0c2c                	addi	a1,sp,536
    22d5:	0000                	unimp
    22d7:	0c64                	addi	s1,sp,540
    22d9:	0000                	unimp
    22db:	0001                	nop
    22dd:	ac59                	j	2573 <$d.7+0x72b>
    22df:	000c                	.insn	2, 0x000c
    22e1:	2c00                	.insn	2, 0x2c00
    22e3:	000e                	c.slli	zero,0x3
    22e5:	0100                	addi	s0,sp,128
    22e7:	5900                	lw	s0,48(a0)
	...
    22f1:	0bec                	addi	a1,sp,476
    22f3:	0000                	unimp
    22f5:	0c28                	addi	a0,sp,536
    22f7:	0000                	unimp
    22f9:	0001                	nop
    22fb:	285c                	.insn	2, 0x285c
    22fd:	000c                	.insn	2, 0x000c
    22ff:	6400                	.insn	2, 0x6400
    2301:	000c                	.insn	2, 0x000c
    2303:	0100                	addi	s0,sp,128
    2305:	6200                	.insn	2, 0x6200
    2307:	0cac                	addi	a1,sp,600
    2309:	0000                	unimp
    230b:	0d44                	addi	s1,sp,660
    230d:	0000                	unimp
    230f:	0001                	nop
    2311:	4462                	lw	s0,24(sp)
    2313:	000d                	c.nop	3
    2315:	6400                	.insn	2, 0x6400
    2317:	0010                	.insn	2, 0x0010
    2319:	0200                	addi	s0,sp,256
    231b:	7200                	.insn	2, 0x7200
    231d:	0018                	.insn	2, 0x0018
    231f:	0000                	unimp
    2321:	0000                	unimp
    2323:	0000                	unimp
    2325:	4000                	lw	s0,0(s0)
    2327:	000d                	c.nop	3
    2329:	1400                	addi	s0,sp,544
    232b:	0100000f          	fence	w,unknown
    232f:	5900                	lw	s0,48(a0)
    2331:	0f14                	addi	a3,sp,912
    2333:	0000                	unimp
    2335:	0f5c                	addi	a5,sp,916
    2337:	0000                	unimp
    2339:	0001                	nop
    233b:	7062                	.insn	2, 0x7062
    233d:	1400000f          	.insn	4, 0x1400000f
    2341:	0010                	.insn	2, 0x0010
    2343:	0100                	addi	s0,sp,128
    2345:	5900                	lw	s0,48(a0)
    2347:	1044                	addi	s1,sp,36
    2349:	0000                	unimp
    234b:	104c                	addi	a1,sp,36
    234d:	0000                	unimp
    234f:	0001                	nop
    2351:	5462                	lw	s0,56(sp)
    2353:	0010                	.insn	2, 0x0010
    2355:	6400                	.insn	2, 0x6400
    2357:	0010                	.insn	2, 0x0010
    2359:	0100                	addi	s0,sp,128
    235b:	5900                	lw	s0,48(a0)
	...
    2365:	0d40                	addi	s0,sp,660
    2367:	0000                	unimp
    2369:	1024                	addi	s1,sp,40
    236b:	0000                	unimp
    236d:	0001                	nop
    236f:	00104463          	bgtz	ra,2377 <$d.7+0x52f>
    2373:	4c00                	lw	s0,24(s0)
    2375:	0010                	.insn	2, 0x0010
    2377:	0100                	addi	s0,sp,128
    2379:	6300                	.insn	2, 0x6300
    237b:	1054                	addi	a3,sp,36
    237d:	0000                	unimp
    237f:	1064                	addi	s1,sp,44
    2381:	0000                	unimp
    2383:	0001                	nop
    2385:	00000063          	beqz	zero,2385 <$d.7+0x53d>
    2389:	0000                	unimp
    238b:	0000                	unimp
    238d:	6800                	.insn	2, 0x6800
    238f:	000e                	c.slli	zero,0x3
    2391:	bc00                	.insn	2, 0xbc00
    2393:	000e                	c.slli	zero,0x3
    2395:	0100                	addi	s0,sp,128
    2397:	6800                	.insn	2, 0x6800
    2399:	0ec0                	addi	s0,sp,852
    239b:	0000                	unimp
    239d:	0ef0                	addi	a2,sp,860
    239f:	0000                	unimp
    23a1:	0001                	nop
    23a3:	0068                	addi	a0,sp,12
    23a5:	0000                	unimp
    23a7:	0000                	unimp
    23a9:	0000                	unimp
    23ab:	a800                	.insn	2, 0xa800
    23ad:	000e                	c.slli	zero,0x3
    23af:	c000                	sw	s0,0(s0)
    23b1:	000e                	c.slli	zero,0x3
    23b3:	0300                	addi	s0,sp,384
    23b5:	3000                	.insn	2, 0x3000
    23b7:	9f20                	.insn	2, 0x9f20
    23b9:	0ee4                	addi	s1,sp,860
    23bb:	0000                	unimp
    23bd:	0ef8                	addi	a4,sp,860
    23bf:	0000                	unimp
    23c1:	0001                	nop
    23c3:	005a                	c.slli	zero,0x16
    23c5:	0000                	unimp
    23c7:	0000                	unimp
    23c9:	0000                	unimp
    23cb:	f800                	.insn	2, 0xf800
    23cd:	000e                	c.slli	zero,0x3
    23cf:	a800                	.insn	2, 0xa800
    23d1:	0100000f          	fence	w,unknown
    23d5:	6800                	.insn	2, 0x6800
    23d7:	1014                	addi	a3,sp,32
    23d9:	0000                	unimp
    23db:	1034                	addi	a3,sp,40
    23dd:	0000                	unimp
    23df:	0001                	nop
    23e1:	0068                	addi	a0,sp,12
    23e3:	0000                	unimp
    23e5:	0000                	unimp
    23e7:	0000                	unimp
    23e9:	0400                	addi	s0,sp,512
    23eb:	1400000f          	.insn	4, 0x1400000f
    23ef:	0200000f          	fence	r,unknown
    23f3:	3000                	.insn	2, 0x3000
    23f5:	149f 000f 9000      	.insn	6, 0x9000000f149f
    23fb:	0100000f          	fence	w,unknown
    23ff:	6500                	.insn	2, 0x6500
	...
    2409:	0f54                	addi	a3,sp,916
    240b:	0000                	unimp
    240d:	0f78                	addi	a4,sp,924
    240f:	0000                	unimp
    2411:	0001                	nop
    2413:	005a                	c.slli	zero,0x16
    2415:	0000                	unimp
    2417:	0000                	unimp
    2419:	0000                	unimp
    241b:	5400                	lw	s0,40(s0)
    241d:	5c00000f          	.insn	4, 0x5c00000f
    2421:	0200000f          	fence	r,unknown
    2425:	3000                	.insn	2, 0x3000
    2427:	5c9f 000f 6400      	.insn	6, 0x6400000f5c9f
    242d:	0600000f          	fence	or,unknown
    2431:	8200                	.insn	2, 0x8200
    2433:	8200                	.insn	2, 0x8200
    2435:	1c00                	addi	s0,sp,560
    2437:	649f 000f 6800      	.insn	6, 0x6800000f649f
    243d:	0900000f          	fence	iw,unknown
    2441:	8200                	.insn	2, 0x8200
    2443:	8200                	.insn	2, 0x8200
    2445:	1c00                	addi	s0,sp,560
    2447:	0111                	addi	sp,sp,4
    2449:	9f22                	add	t5,t5,s0
	...
    2453:	0fdc                	addi	a5,sp,980
    2455:	0000                	unimp
    2457:	0fe4                	addi	s1,sp,988
    2459:	0000                	unimp
    245b:	0001                	nop
    245d:	005a                	c.slli	zero,0x16
    245f:	0000                	unimp
    2461:	0000                	unimp
    2463:	0000                	unimp
    2465:	c400                	sw	s0,8(s0)
    2467:	c800000f          	.insn	4, 0xc800000f
    246b:	0600000f          	fence	or,unknown
    246f:	7a00                	.insn	2, 0x7a00
    2471:	7b00                	.insn	2, 0x7b00
    2473:	2200                	.insn	2, 0x2200
    2475:	c89f 000f d000      	.insn	6, 0xd000000fc89f
    247b:	0100000f          	fence	w,unknown
    247f:	5a00                	lw	s0,48(a2)
	...
    2489:	0fc0                	addi	s0,sp,980
    248b:	0000                	unimp
    248d:	1014                	addi	a3,sp,32
    248f:	0000                	unimp
    2491:	0001                	nop
    2493:	0062                	c.slli	zero,0x18
    2495:	0000                	unimp
    2497:	0000                	unimp
    2499:	0000                	unimp
    249b:	ac00                	.insn	2, 0xac00
    249d:	c000000f          	.insn	4, 0xc000000f
    24a1:	0100000f          	fence	w,unknown
    24a5:	6200                	.insn	2, 0x6200
	...
    24af:	0fe4                	addi	s1,sp,988
    24b1:	0000                	unimp
    24b3:	0ff8                	addi	a4,sp,988
    24b5:	0000                	unimp
    24b7:	0001                	nop
    24b9:	005a                	c.slli	zero,0x16
    24bb:	0000                	unimp
    24bd:	0000                	unimp
    24bf:	0000                	unimp
    24c1:	1000                	addi	s0,sp,32
    24c3:	0010                	.insn	2, 0x0010
    24c5:	1400                	addi	s0,sp,544
    24c7:	0010                	.insn	2, 0x0010
    24c9:	0100                	addi	s0,sp,128
    24cb:	6800                	.insn	2, 0x6800
	...
    24d5:	1064                	addi	s1,sp,44
    24d7:	0000                	unimp
    24d9:	10a8                	addi	a0,sp,104
    24db:	0000                	unimp
    24dd:	0001                	nop
    24df:	a85a                	.insn	2, 0xa85a
    24e1:	0010                	.insn	2, 0x0010
    24e3:	c400                	sw	s0,8(s0)
    24e5:	0010                	.insn	2, 0x0010
    24e7:	0100                	addi	s0,sp,128
    24e9:	5800                	lw	s0,48(s0)
    24eb:	10c4                	addi	s1,sp,100
    24ed:	0000                	unimp
    24ef:	10cc                	addi	a1,sp,100
    24f1:	0000                	unimp
    24f3:	0001                	nop
    24f5:	005a                	c.slli	zero,0x16
    24f7:	0000                	unimp
    24f9:	0000                	unimp
    24fb:	0000                	unimp
    24fd:	6400                	.insn	2, 0x6400
    24ff:	0010                	.insn	2, 0x0010
    2501:	a400                	.insn	2, 0xa400
    2503:	0010                	.insn	2, 0x0010
    2505:	0100                	addi	s0,sp,128
    2507:	5b00                	lw	s0,48(a4)
    2509:	10a4                	addi	s1,sp,104
    250b:	0000                	unimp
    250d:	10f8                	addi	a4,sp,108
    250f:	0000                	unimp
    2511:	0001                	nop
    2513:	2462                	.insn	2, 0x2462
    2515:	0011                	c.nop	4
    2517:	8400                	.insn	2, 0x8400
    2519:	0014                	.insn	2, 0x0014
    251b:	0100                	addi	s0,sp,128
    251d:	6200                	.insn	2, 0x6200
	...
    2527:	1064                	addi	s1,sp,44
    2529:	0000                	unimp
    252b:	10a0                	addi	s0,sp,104
    252d:	0000                	unimp
    252f:	0001                	nop
    2531:	a05c                	.insn	2, 0xa05c
    2533:	0010                	.insn	2, 0x0010
    2535:	dc00                	sw	s0,56(s0)
    2537:	0010                	.insn	2, 0x0010
    2539:	0100                	addi	s0,sp,128
    253b:	5900                	lw	s0,48(a0)
    253d:	1124                	addi	s1,sp,168
    253f:	0000                	unimp
    2541:	1164                	addi	s1,sp,172
    2543:	0000                	unimp
    2545:	0001                	nop
    2547:	6459                	lui	s0,0x16
    2549:	0011                	c.nop	4
    254b:	8400                	.insn	2, 0x8400
    254d:	0014                	.insn	2, 0x0014
    254f:	0200                	addi	s0,sp,256
    2551:	7200                	.insn	2, 0x7200
    2553:	0014                	.insn	2, 0x0014
    2555:	0000                	unimp
    2557:	0000                	unimp
    2559:	0000                	unimp
    255b:	a800                	.insn	2, 0xa800
    255d:	0010                	.insn	2, 0x0010
    255f:	dc00                	sw	s0,56(s0)
    2561:	0010                	.insn	2, 0x0010
    2563:	0200                	addi	s0,sp,256
    2565:	7200                	.insn	2, 0x7200
    2567:	2438                	.insn	2, 0x2438
    2569:	0011                	c.nop	4
    256b:	f000                	.insn	2, 0xf000
    256d:	0011                	c.nop	4
    256f:	0200                	addi	s0,sp,256
    2571:	7200                	.insn	2, 0x7200
    2573:	1038                	addi	a4,sp,40
    2575:	0014                	.insn	2, 0x0014
    2577:	2400                	.insn	2, 0x2400
    2579:	0014                	.insn	2, 0x0014
    257b:	0100                	addi	s0,sp,128
    257d:	5c00                	lw	s0,56(s0)
	...
    2587:	1160                	addi	s0,sp,172
    2589:	0000                	unimp
    258b:	1484                	addi	s1,sp,608
    258d:	0000                	unimp
    258f:	0001                	nop
    2591:	0062                	c.slli	zero,0x18
    2593:	0000                	unimp
    2595:	0000                	unimp
    2597:	0000                	unimp
    2599:	6000                	.insn	2, 0x6000
    259b:	0011                	c.nop	4
    259d:	8400                	.insn	2, 0x8400
    259f:	0014                	.insn	2, 0x0014
    25a1:	0100                	addi	s0,sp,128
    25a3:	6700                	.insn	2, 0x6700
	...
    25ad:	1160                	addi	s0,sp,172
    25af:	0000                	unimp
    25b1:	11f0                	addi	a2,sp,236
    25b3:	0000                	unimp
    25b5:	0002                	c.slli64	zero
    25b7:	9f30                	.insn	2, 0x9f30
    25b9:	11f0                	addi	a2,sp,236
    25bb:	0000                	unimp
    25bd:	1484                	addi	s1,sp,608
    25bf:	0000                	unimp
    25c1:	0001                	nop
    25c3:	0069                	c.nop	26
    25c5:	0000                	unimp
    25c7:	0000                	unimp
    25c9:	0000                	unimp
    25cb:	6000                	.insn	2, 0x6000
    25cd:	0011                	c.nop	4
    25cf:	f000                	.insn	2, 0xf000
    25d1:	0011                	c.nop	4
    25d3:	0200                	addi	s0,sp,256
    25d5:	3000                	.insn	2, 0x3000
    25d7:	f09f 0011 4c00      	.insn	6, 0x4c000011f09f
    25dd:	01000013          	li	zero,16
    25e1:	6b00                	.insn	2, 0x6b00
    25e3:	135c                	addi	a5,sp,420
    25e5:	0000                	unimp
    25e7:	1364                	addi	s1,sp,428
    25e9:	0000                	unimp
    25eb:	0002                	c.slli64	zero
    25ed:	9f30                	.insn	2, 0x9f30
    25ef:	1364                	addi	s1,sp,428
    25f1:	0000                	unimp
    25f3:	1484                	addi	s1,sp,608
    25f5:	0000                	unimp
    25f7:	0001                	nop
    25f9:	0000006b          	.insn	4, 0x006b
    25fd:	0000                	unimp
    25ff:	0000                	unimp
    2601:	6000                	.insn	2, 0x6000
    2603:	0011                	c.nop	4
    2605:	f000                	.insn	2, 0xf000
    2607:	0011                	c.nop	4
    2609:	0200                	addi	s0,sp,256
    260b:	3000                	.insn	2, 0x3000
    260d:	f09f 0011 3c00      	.insn	6, 0x3c000011f09f
    2613:	01000013          	li	zero,16
    2617:	6500                	.insn	2, 0x6500
    2619:	1344                	addi	s1,sp,420
    261b:	0000                	unimp
    261d:	135c                	addi	a5,sp,420
    261f:	0000                	unimp
    2621:	0001                	nop
    2623:	5c65                	li	s8,-7
    2625:	64000013          	li	zero,1600
    2629:	02000013          	li	zero,32
    262d:	3000                	.insn	2, 0x3000
    262f:	649f 0013 8400      	.insn	6, 0x84000013649f
    2635:	0014                	.insn	2, 0x0014
    2637:	0100                	addi	s0,sp,128
    2639:	6500                	.insn	2, 0x6500
	...
    2643:	11f8                	addi	a4,sp,236
    2645:	0000                	unimp
    2647:	124c                	addi	a1,sp,292
    2649:	0000                	unimp
    264b:	0001                	nop
    264d:	905c                	.insn	2, 0x905c
    264f:	0012                	c.slli	zero,0x4
    2651:	9c00                	.insn	2, 0x9c00
    2653:	0012                	c.slli	zero,0x4
    2655:	0100                	addi	s0,sp,128
    2657:	5c00                	lw	s0,56(s0)
	...
    2661:	123c                	addi	a5,sp,296
    2663:	0000                	unimp
    2665:	1258                	addi	a4,sp,292
    2667:	0000                	unimp
    2669:	20300003          	lb	zero,515(zero) # 203 <$d.12+0x33>
    266d:	909f 0012 a000      	.insn	6, 0xa0000012909f
    2673:	0012                	c.slli	zero,0x4
    2675:	0100                	addi	s0,sp,128
    2677:	5a00                	lw	s0,48(a2)
	...
    2681:	1260                	addi	s0,sp,300
    2683:	0000                	unimp
    2685:	1264                	addi	s1,sp,300
    2687:	0000                	unimp
    2689:	0001                	nop
    268b:	645a                	.insn	2, 0x645a
    268d:	0012                	c.slli	zero,0x4
    268f:	6c00                	.insn	2, 0x6c00
    2691:	0012                	c.slli	zero,0x4
    2693:	0200                	addi	s0,sp,256
    2695:	7200                	.insn	2, 0x7200
    2697:	a430                	.insn	2, 0xa430
    2699:	0012                	c.slli	zero,0x4
    269b:	a800                	.insn	2, 0xa800
    269d:	0012                	c.slli	zero,0x4
    269f:	0100                	addi	s0,sp,128
    26a1:	5a00                	lw	s0,48(a2)
    26a3:	12a8                	addi	a0,sp,360
    26a5:	0000                	unimp
    26a7:	1394                	addi	a3,sp,480
    26a9:	0000                	unimp
    26ab:	0002                	c.slli64	zero
    26ad:	3072                	.insn	2, 0x3072
	...
    26b7:	1254                	addi	a3,sp,292
    26b9:	0000                	unimp
    26bb:	1258                	addi	a4,sp,292
    26bd:	0000                	unimp
    26bf:	0002                	c.slli64	zero
    26c1:	9f30                	.insn	2, 0x9f30
    26c3:	12b0                	addi	a2,sp,360
    26c5:	0000                	unimp
    26c7:	1380                	addi	s0,sp,480
    26c9:	0000                	unimp
    26cb:	0001                	nop
    26cd:	0058                	addi	a4,sp,4
    26cf:	0000                	unimp
    26d1:	0000                	unimp
    26d3:	0000                	unimp
    26d5:	f800                	.insn	2, 0xf800
    26d7:	0012                	c.slli	zero,0x4
    26d9:	8000                	.insn	2, 0x8000
    26db:	01000013          	li	zero,16
    26df:	5a00                	lw	s0,48(a2)
	...
    26e9:	1318                	addi	a4,sp,416
    26eb:	0000                	unimp
    26ed:	1334                	addi	a3,sp,424
    26ef:	0000                	unimp
    26f1:	0001                	nop
    26f3:	645d                	lui	s0,0x17
    26f5:	70000013          	li	zero,1792
    26f9:	01000013          	li	zero,16
    26fd:	5d00                	lw	s0,56(a0)
	...
    2707:	1318                	addi	a4,sp,416
    2709:	0000                	unimp
    270b:	1350                	addi	a2,sp,420
    270d:	0000                	unimp
    270f:	0001                	nop
    2711:	645d                	lui	s0,0x17
    2713:	7c000013          	li	zero,1984
    2717:	01000013          	li	zero,16
    271b:	5d00                	lw	s0,56(a0)
	...
    2725:	1334                	addi	a3,sp,424
    2727:	0000                	unimp
    2729:	1364                	addi	s1,sp,428
    272b:	0000                	unimp
    272d:	0001                	nop
    272f:	745e                	.insn	2, 0x745e
    2731:	78000013          	li	zero,1920
    2735:	01000013          	li	zero,16
    2739:	5e00                	lw	s0,56(a2)
	...
    2743:	1394                	addi	a3,sp,480
    2745:	0000                	unimp
    2747:	13a4                	addi	s1,sp,488
    2749:	0000                	unimp
    274b:	0002                	c.slli64	zero
    274d:	2c72                	.insn	2, 0x2c72
    274f:	13a8                	addi	a0,sp,488
    2751:	0000                	unimp
    2753:	13ac                	addi	a1,sp,488
    2755:	0000                	unimp
    2757:	0001                	nop
    2759:	0013ac5b          	.insn	4, 0x0013ac5b
    275d:	0800                	addi	s0,sp,16
    275f:	0014                	.insn	2, 0x0014
    2761:	0200                	addi	s0,sp,256
    2763:	7200                	.insn	2, 0x7200
    2765:	002c                	addi	a1,sp,8
    2767:	0000                	unimp
    2769:	0000                	unimp
    276b:	0000                	unimp
    276d:	9400                	.insn	2, 0x9400
    276f:	a4000013          	li	zero,-1472
    2773:	07000013          	li	zero,112
    2777:	7200                	.insn	2, 0x7200
    2779:	942c                	.insn	2, 0x942c
    277b:	3204                	.insn	2, 0x3204
    277d:	9f24                	.insn	2, 0x9f24
    277f:	13a8                	addi	a0,sp,488
    2781:	0000                	unimp
    2783:	13ac                	addi	a1,sp,488
    2785:	0000                	unimp
    2787:	0005                	c.nop	1
    2789:	2432007b          	.insn	4, 0x2432007b
    278d:	ac9f 0013 cc00      	.insn	6, 0xcc000013ac9f
    2793:	07000013          	li	zero,112
    2797:	7200                	.insn	2, 0x7200
    2799:	942c                	.insn	2, 0x942c
    279b:	3204                	.insn	2, 0x3204
    279d:	9f24                	.insn	2, 0x9f24
	...
    27a7:	139c                	addi	a5,sp,480
    27a9:	0000                	unimp
    27ab:	13a4                	addi	s1,sp,488
    27ad:	0000                	unimp
    27af:	007a000b          	.insn	4, 0x007a000b
    27b3:	2c72                	.insn	2, 0x2c72
    27b5:	3206                	.insn	2, 0x3206
    27b7:	3924                	.insn	2, 0x3924
    27b9:	2225                	jal	28e1 <$d.7+0xa99>
    27bb:	a89f 0013 ac00      	.insn	6, 0xac000013a89f
    27c1:	0a000013          	li	zero,160
    27c5:	7a00                	.insn	2, 0x7a00
    27c7:	7b00                	.insn	2, 0x7b00
    27c9:	3200                	.insn	2, 0x3200
    27cb:	3924                	.insn	2, 0x3924
    27cd:	2225                	jal	28f5 <$d.7+0xaad>
    27cf:	ac9f 0013 b000      	.insn	6, 0xb0000013ac9f
    27d5:	06000013          	li	zero,96
    27d9:	7a00                	.insn	2, 0x7a00
    27db:	7b00                	.insn	2, 0x7b00
    27dd:	2200                	.insn	2, 0x2200
    27df:	b09f 0013 bc00      	.insn	6, 0xbc000013b09f
    27e5:	01000013          	li	zero,16
    27e9:	5a00                	lw	s0,48(a2)
	...
    27f3:	1394                	addi	a3,sp,480
    27f5:	0000                	unimp
    27f7:	13a4                	addi	s1,sp,488
    27f9:	0000                	unimp
    27fb:	2c72000b          	.insn	4, 0x2c72000b
    27ff:	0494                	addi	a3,sp,576
    2801:	2432                	.insn	2, 0x2432
    2803:	fc10                	.insn	2, 0xfc10
    2805:	a89f1a03          	lh	s4,-1399(t5) # fffe3a89 <_stack_top+0xffed7cc9>
    2809:	ac000013          	li	zero,-1344
    280d:	09000013          	li	zero,144
    2811:	7b00                	.insn	2, 0x7b00
    2813:	3200                	.insn	2, 0x3200
    2815:	1024                	addi	s1,sp,40
    2817:	03fc                	addi	a5,sp,460
    2819:	9f1a                	add	t5,t5,t1
    281b:	13ac                	addi	a1,sp,488
    281d:	0000                	unimp
    281f:	13cc                	addi	a1,sp,484
    2821:	0000                	unimp
    2823:	2c72000b          	.insn	4, 0x2c72000b
    2827:	0494                	addi	a3,sp,576
    2829:	2432                	.insn	2, 0x2432
    282b:	fc10                	.insn	2, 0xfc10
    282d:	d89f1a03          	lh	s4,-631(t5)
    2831:	dc000013          	li	zero,-576
    2835:	01000013          	li	zero,16
    2839:	5a00                	lw	s0,48(a2)
	...
    2843:	13dc                	addi	a5,sp,484
    2845:	0000                	unimp
    2847:	13f0                	addi	a2,sp,492
    2849:	0000                	unimp
    284b:	0001                	nop
    284d:	005a                	c.slli	zero,0x16
    284f:	0000                	unimp
    2851:	0000                	unimp
    2853:	0000                	unimp
	...

セクション .debug_ranges の逆アセンブル:

00000000 <$d.5>:
   0:	0078                	addi	a4,sp,12
   2:	0000                	unimp
   4:	0088                	addi	a0,sp,64
   6:	0000                	unimp
   8:	008c                	addi	a1,sp,64
   a:	0000                	unimp
   c:	0098                	addi	a4,sp,64
	...
  16:	0000                	unimp
  18:	00a8                	addi	a0,sp,72
  1a:	0000                	unimp
  1c:	0158                	addi	a4,sp,132
  1e:	0000                	unimp
  20:	0234                	addi	a3,sp,264
  22:	0000                	unimp
  24:	025c                	addi	a5,sp,260
	...
  2e:	0000                	unimp
  30:	00d4                	addi	a3,sp,68
  32:	0000                	unimp
  34:	00e4                	addi	s1,sp,76
  36:	0000                	unimp
  38:	00e8                	addi	a0,sp,76
  3a:	0000                	unimp
  3c:	00f4                	addi	a3,sp,76
	...
  46:	0000                	unimp
  48:	0234                	addi	a3,sp,264
  4a:	0000                	unimp
  4c:	0244                	addi	s1,sp,260
  4e:	0000                	unimp
  50:	0248                	addi	a0,sp,260
  52:	0000                	unimp
  54:	0254                	addi	a3,sp,260
	...
  5e:	0000                	unimp
  60:	0278                	addi	a4,sp,268
  62:	0000                	unimp
  64:	0288                	addi	a0,sp,320
  66:	0000                	unimp
  68:	028c                	addi	a1,sp,320
  6a:	0000                	unimp
  6c:	0298                	addi	a4,sp,320
	...
  76:	0000                	unimp
  78:	0188                	addi	a0,sp,192
  7a:	0000                	unimp
  7c:	0198                	addi	a4,sp,192
  7e:	0000                	unimp
  80:	019c                	addi	a5,sp,192
  82:	0000                	unimp
  84:	01a8                	addi	a0,sp,200
	...
  8e:	0000                	unimp
  90:	01ec                	addi	a1,sp,204
  92:	0000                	unimp
  94:	01fc                	addi	a5,sp,204
  96:	0000                	unimp
  98:	0200                	addi	s0,sp,256
  9a:	0000                	unimp
  9c:	020c                	addi	a1,sp,256
	...
  a6:	0000                	unimp
  a8:	02e0                	addi	s0,sp,332
  aa:	0000                	unimp
  ac:	02f0                	addi	a2,sp,332
  ae:	0000                	unimp
  b0:	02f4                	addi	a3,sp,332
  b2:	0000                	unimp
  b4:	0300                	addi	s0,sp,384
	...
  be:	0000                	unimp
  c0:	0448                	addi	a0,sp,516
  c2:	0000                	unimp
  c4:	0458                	addi	a4,sp,516
  c6:	0000                	unimp
  c8:	045c                	addi	a5,sp,516
  ca:	0000                	unimp
  cc:	0464                	addi	s1,sp,524
	...
  d6:	0000                	unimp
  d8:	04a8                	addi	a0,sp,584
  da:	0000                	unimp
  dc:	0a34                	addi	a3,sp,280
  de:	0000                	unimp
  e0:	0af8                	addi	a4,sp,348
  e2:	0000                	unimp
  e4:	0c2c                	addi	a1,sp,536
	...
  ee:	0000                	unimp
  f0:	0ba0                	addi	s0,sp,472
  f2:	0000                	unimp
  f4:	0bb0                	addi	a2,sp,472
  f6:	0000                	unimp
  f8:	0bb4                	addi	a3,sp,472
  fa:	0000                	unimp
  fc:	0bc0                	addi	s0,sp,468
	...
 106:	0000                	unimp
 108:	0714                	addi	a3,sp,896
 10a:	0000                	unimp
 10c:	0754                	addi	a3,sp,900
 10e:	0000                	unimp
 110:	0af8                	addi	a4,sp,348
 112:	0000                	unimp
 114:	0b84                	addi	s1,sp,464
	...
 11e:	0000                	unimp
 120:	0af8                	addi	a4,sp,348
 122:	0000                	unimp
 124:	0b08                	addi	a0,sp,400
 126:	0000                	unimp
 128:	0b0c                	addi	a1,sp,400
 12a:	0000                	unimp
 12c:	0b18                	addi	a4,sp,400
	...
 136:	0000                	unimp
 138:	0770                	addi	a2,sp,908
 13a:	0000                	unimp
 13c:	0824                	addi	s1,sp,24
 13e:	0000                	unimp
 140:	0828                	addi	a0,sp,24
 142:	0000                	unimp
 144:	082c                	addi	a1,sp,24
	...
 14e:	0000                	unimp
 150:	0850                	addi	a2,sp,20
 152:	0000                	unimp
 154:	0860                	addi	s0,sp,28
 156:	0000                	unimp
 158:	0864                	addi	s1,sp,28
 15a:	0000                	unimp
 15c:	0870                	addi	a2,sp,28
	...
 166:	0000                	unimp
 168:	08c4                	addi	s1,sp,84
 16a:	0000                	unimp
 16c:	08c8                	addi	a0,sp,84
 16e:	0000                	unimp
 170:	08d4                	addi	a3,sp,84
 172:	0000                	unimp
 174:	08d8                	addi	a4,sp,84
 176:	0000                	unimp
 178:	08ec                	addi	a1,sp,92
 17a:	0000                	unimp
 17c:	08f0                	addi	a2,sp,92
 17e:	0000                	unimp
 180:	0904                	addi	s1,sp,144
 182:	0000                	unimp
 184:	0908                	addi	a0,sp,144
	...
 18e:	0000                	unimp
 190:	08d0                	addi	a2,sp,84
 192:	0000                	unimp
 194:	08d4                	addi	a3,sp,84
 196:	0000                	unimp
 198:	08e8                	addi	a0,sp,92
 19a:	0000                	unimp
 19c:	08ec                	addi	a1,sp,92
 19e:	0000                	unimp
 1a0:	0900                	addi	s0,sp,144
 1a2:	0000                	unimp
 1a4:	0904                	addi	s1,sp,144
 1a6:	0000                	unimp
 1a8:	0918                	addi	a4,sp,144
 1aa:	0000                	unimp
 1ac:	0920                	addi	s0,sp,152
	...
 1b6:	0000                	unimp
 1b8:	0968                	addi	a0,sp,156
 1ba:	0000                	unimp
 1bc:	096c                	addi	a1,sp,156
 1be:	0000                	unimp
 1c0:	0978                	addi	a4,sp,156
 1c2:	0000                	unimp
 1c4:	097c                	addi	a5,sp,156
 1c6:	0000                	unimp
 1c8:	0990                	addi	a2,sp,208
 1ca:	0000                	unimp
 1cc:	0994                	addi	a3,sp,208
 1ce:	0000                	unimp
 1d0:	09a8                	addi	a0,sp,216
 1d2:	0000                	unimp
 1d4:	09ac                	addi	a1,sp,216
	...
 1de:	0000                	unimp
 1e0:	0974                	addi	a3,sp,156
 1e2:	0000                	unimp
 1e4:	0978                	addi	a4,sp,156
 1e6:	0000                	unimp
 1e8:	098c                	addi	a1,sp,208
 1ea:	0000                	unimp
 1ec:	0990                	addi	a2,sp,208
 1ee:	0000                	unimp
 1f0:	09a4                	addi	s1,sp,216
 1f2:	0000                	unimp
 1f4:	09a8                	addi	a0,sp,216
 1f6:	0000                	unimp
 1f8:	09bc                	addi	a5,sp,216
 1fa:	0000                	unimp
 1fc:	09c4                	addi	s1,sp,212
	...
 206:	0000                	unimp
 208:	0a50                	addi	a2,sp,276
 20a:	0000                	unimp
 20c:	0a60                	addi	s0,sp,284
 20e:	0000                	unimp
 210:	0a64                	addi	s1,sp,284
 212:	0000                	unimp
 214:	0a70                	addi	a2,sp,284
	...

00000220 <$d.5>:
 220:	020c                	addi	a1,sp,256
 222:	0000                	unimp
 224:	0230                	addi	a2,sp,264
 226:	0000                	unimp
 228:	035c                	addi	a5,sp,388
 22a:	0000                	unimp
 22c:	03d4                	addi	a3,sp,452
	...
 236:	0000                	unimp
 238:	047c                	addi	a5,sp,524
 23a:	0000                	unimp
 23c:	0494                	addi	a3,sp,576
 23e:	0000                	unimp
 240:	0498                	addi	a4,sp,576
 242:	0000                	unimp
 244:	04a4                	addi	s1,sp,584
 246:	0000                	unimp
 248:	04ac                	addi	a1,sp,584
 24a:	0000                	unimp
 24c:	04dc                	addi	a5,sp,580
	...
 256:	0000                	unimp
 258:	057c                	addi	a5,sp,652
 25a:	0000                	unimp
 25c:	0588                	addi	a0,sp,704
 25e:	0000                	unimp
 260:	058c                	addi	a1,sp,704
 262:	0000                	unimp
 264:	0638                	addi	a4,sp,776
	...
 26e:	0000                	unimp
 270:	057c                	addi	a5,sp,652
 272:	0000                	unimp
 274:	0588                	addi	a0,sp,704
 276:	0000                	unimp
 278:	058c                	addi	a1,sp,704
 27a:	0000                	unimp
 27c:	0638                	addi	a4,sp,776
	...
 286:	0000                	unimp
 288:	057c                	addi	a5,sp,652
 28a:	0000                	unimp
 28c:	0588                	addi	a0,sp,704
 28e:	0000                	unimp
 290:	058c                	addi	a1,sp,704
 292:	0000                	unimp
 294:	0638                	addi	a4,sp,776
	...
 29e:	0000                	unimp
 2a0:	0700                	addi	s0,sp,896
 2a2:	0000                	unimp
 2a4:	070c                	addi	a1,sp,896
 2a6:	0000                	unimp
 2a8:	0714                	addi	a3,sp,896
 2aa:	0000                	unimp
 2ac:	0724                	addi	s1,sp,904
	...
 2b6:	0000                	unimp
 2b8:	0790                	addi	a2,sp,960
 2ba:	0000                	unimp
 2bc:	07dc                	addi	a5,sp,964
 2be:	0000                	unimp
 2c0:	084c                	addi	a1,sp,20
 2c2:	0000                	unimp
 2c4:	0864                	addi	s1,sp,28
 2c6:	0000                	unimp
 2c8:	0898                	addi	a4,sp,80
 2ca:	0000                	unimp
 2cc:	08fc                	addi	a5,sp,92
	...
 2d6:	0000                	unimp
 2d8:	0790                	addi	a2,sp,960
 2da:	0000                	unimp
 2dc:	07dc                	addi	a5,sp,964
 2de:	0000                	unimp
 2e0:	084c                	addi	a1,sp,20
 2e2:	0000                	unimp
 2e4:	0858                	addi	a4,sp,20
 2e6:	0000                	unimp
 2e8:	0898                	addi	a4,sp,80
 2ea:	0000                	unimp
 2ec:	08fc                	addi	a5,sp,92
	...
 2f6:	0000                	unimp
 2f8:	0898                	addi	a4,sp,80
 2fa:	0000                	unimp
 2fc:	08b0                	addi	a2,sp,88
 2fe:	0000                	unimp
 300:	08b4                	addi	a3,sp,88
 302:	0000                	unimp
 304:	08c0                	addi	s0,sp,84
 306:	0000                	unimp
 308:	08c8                	addi	a0,sp,84
 30a:	0000                	unimp
 30c:	08fc                	addi	a5,sp,92
	...
 316:	0000                	unimp
 318:	0800                	addi	s0,sp,16
 31a:	0000                	unimp
 31c:	084c                	addi	a1,sp,20
 31e:	0000                	unimp
 320:	0864                	addi	s1,sp,28
 322:	0000                	unimp
 324:	0878                	addi	a4,sp,28
 326:	0000                	unimp
 328:	0908                	addi	a0,sp,144
 32a:	0000                	unimp
 32c:	0968                	addi	a0,sp,156
	...
 336:	0000                	unimp
 338:	0800                	addi	s0,sp,16
 33a:	0000                	unimp
 33c:	084c                	addi	a1,sp,20
 33e:	0000                	unimp
 340:	0864                	addi	s1,sp,28
 342:	0000                	unimp
 344:	0870                	addi	a2,sp,28
 346:	0000                	unimp
 348:	0908                	addi	a0,sp,144
 34a:	0000                	unimp
 34c:	0968                	addi	a0,sp,156
	...
 356:	0000                	unimp
 358:	0908                	addi	a0,sp,144
 35a:	0000                	unimp
 35c:	0920                	addi	s0,sp,152
 35e:	0000                	unimp
 360:	0924                	addi	s1,sp,152
 362:	0000                	unimp
 364:	0930                	addi	a2,sp,152
 366:	0000                	unimp
 368:	0938                	addi	a4,sp,152
 36a:	0000                	unimp
 36c:	0968                	addi	a0,sp,156
	...

00000378 <$d.5>:
 378:	020c                	addi	a1,sp,256
 37a:	0000                	unimp
 37c:	0360                	addi	s0,sp,396
 37e:	0000                	unimp
 380:	0374                	addi	a3,sp,396
 382:	0000                	unimp
 384:	0388                	addi	a0,sp,448
	...
 38e:	0000                	unimp
 390:	022c                	addi	a1,sp,264
 392:	0000                	unimp
 394:	023c                	addi	a5,sp,264
 396:	0000                	unimp
 398:	0244                	addi	s1,sp,260
 39a:	0000                	unimp
 39c:	0358                	addi	a4,sp,388
 39e:	0000                	unimp
 3a0:	0374                	addi	a3,sp,396
 3a2:	0000                	unimp
 3a4:	0388                	addi	a0,sp,448
	...
 3ae:	0000                	unimp
 3b0:	0278                	addi	a4,sp,268
 3b2:	0000                	unimp
 3b4:	032c                	addi	a1,sp,392
 3b6:	0000                	unimp
 3b8:	0330                	addi	a2,sp,392
 3ba:	0000                	unimp
 3bc:	0334                	addi	a3,sp,392
	...

000003c8 <$d.8>:
 3c8:	07b4                	addi	a3,sp,968
 3ca:	0000                	unimp
 3cc:	07d0                	addi	a2,sp,964
 3ce:	0000                	unimp
 3d0:	07d4                	addi	a3,sp,964
 3d2:	0000                	unimp
 3d4:	07e4                	addi	s1,sp,972
	...
 3de:	0000                	unimp
 3e0:	07d0                	addi	a2,sp,964
 3e2:	0000                	unimp
 3e4:	07d4                	addi	a3,sp,964
 3e6:	0000                	unimp
 3e8:	07e4                	addi	s1,sp,972
 3ea:	0000                	unimp
 3ec:	08b0                	addi	a2,sp,88
	...
 3f6:	0000                	unimp
 3f8:	0974                	addi	a3,sp,156
 3fa:	0000                	unimp
 3fc:	0b00                	addi	s0,sp,400
 3fe:	0000                	unimp
 400:	0b18                	addi	a4,sp,400
 402:	0000                	unimp
 404:	0b20                	addi	s0,sp,408
 406:	0000                	unimp
 408:	0b68                	addi	a0,sp,412
 40a:	0000                	unimp
 40c:	0bec                	addi	a1,sp,476
	...
 416:	0000                	unimp
 418:	0994                	addi	a3,sp,208
 41a:	0000                	unimp
 41c:	0a90                	addi	a2,sp,336
 41e:	0000                	unimp
 420:	0b18                	addi	a4,sp,400
 422:	0000                	unimp
 424:	0b20                	addi	s0,sp,408
 426:	0000                	unimp
 428:	0b68                	addi	a0,sp,412
 42a:	0000                	unimp
 42c:	0bec                	addi	a1,sp,476
	...
 436:	0000                	unimp
 438:	09b8                	addi	a4,sp,216
 43a:	0000                	unimp
 43c:	0a90                	addi	a2,sp,336
 43e:	0000                	unimp
 440:	0b18                	addi	a4,sp,400
 442:	0000                	unimp
 444:	0b20                	addi	s0,sp,408
 446:	0000                	unimp
 448:	0b68                	addi	a0,sp,412
 44a:	0000                	unimp
 44c:	0bec                	addi	a1,sp,476
	...
 456:	0000                	unimp
 458:	09e4                	addi	s1,sp,220
 45a:	0000                	unimp
 45c:	0a90                	addi	a2,sp,336
 45e:	0000                	unimp
 460:	0b18                	addi	a4,sp,400
 462:	0000                	unimp
 464:	0b20                	addi	s0,sp,408
 466:	0000                	unimp
 468:	0b74                	addi	a3,sp,412
 46a:	0000                	unimp
 46c:	0bec                	addi	a1,sp,476
	...
 476:	0000                	unimp
 478:	09e8                	addi	a0,sp,220
 47a:	0000                	unimp
 47c:	09ec                	addi	a1,sp,220
 47e:	0000                	unimp
 480:	09f0                	addi	a2,sp,220
 482:	0000                	unimp
 484:	0a90                	addi	a2,sp,336
 486:	0000                	unimp
 488:	0b18                	addi	a4,sp,400
 48a:	0000                	unimp
 48c:	0b20                	addi	s0,sp,408
 48e:	0000                	unimp
 490:	0b74                	addi	a3,sp,412
 492:	0000                	unimp
 494:	0bec                	addi	a1,sp,476
	...
 49e:	0000                	unimp
 4a0:	0b90                	addi	a2,sp,464
 4a2:	0000                	unimp
 4a4:	0b98                	addi	a4,sp,464
 4a6:	0000                	unimp
 4a8:	0ba0                	addi	s0,sp,472
 4aa:	0000                	unimp
 4ac:	0ba8                	addi	a0,sp,472
	...
 4b6:	0000                	unimp
 4b8:	11f8                	addi	a4,sp,236
 4ba:	0000                	unimp
 4bc:	124c                	addi	a1,sp,292
 4be:	0000                	unimp
 4c0:	1290                	addi	a2,sp,352
 4c2:	0000                	unimp
 4c4:	12a8                	addi	a0,sp,360
	...
 4ce:	0000                	unimp
 4d0:	124c                	addi	a1,sp,292
 4d2:	0000                	unimp
 4d4:	1258                	addi	a4,sp,292
 4d6:	0000                	unimp
 4d8:	12b0                	addi	a2,sp,360
 4da:	0000                	unimp
 4dc:	1380                	addi	s0,sp,480
	...
 4e6:	0000                	unimp
 4e8:	1318                	addi	a4,sp,416
 4ea:	0000                	unimp
 4ec:	1334                	addi	a3,sp,424
 4ee:	0000                	unimp
 4f0:	1364                	addi	s1,sp,428
 4f2:	0000                	unimp
 4f4:	1370                	addi	a2,sp,428
	...

セクション .debug_str の逆アセンブル:

00000000 <$d.6-0x282>:
   0:	6e75                	lui	t3,0x1d
   2:	6e676973          	.insn	4, 0x6e676973
   6:	6465                	lui	s0,0x19
   8:	7320                	.insn	2, 0x7320
   a:	6f68                	.insn	2, 0x6f68
   c:	7472                	.insn	2, 0x7472
   e:	7400                	.insn	2, 0x7400
  10:	6e69                	lui	t3,0x1a
  12:	5f79                	li	t5,-2
  14:	6564                	.insn	2, 0x6564
  16:	616c                	.insn	2, 0x616c
  18:	0079                	c.nop	30
  1a:	6964                	.insn	2, 0x6964
  1c:	5f72                	lw	t5,60(sp)
  1e:	626c                	.insn	2, 0x626c
  20:	0061                	c.nop	24
  22:	6572                	.insn	2, 0x6572
  24:	616d                	addi	sp,sp,240
  26:	6e69                	lui	t3,0x1a
  28:	6900                	.insn	2, 0x6900
  2a:	6400                	.insn	2, 0x6400
  2c:	6c007473          	.insn	4, 0x6c007473
  30:	6e65                	lui	t3,0x19
  32:	7300                	.insn	2, 0x7300
  34:	5f64                	lw	s1,124(a4)
  36:	6572                	.insn	2, 0x6572
  38:	6461                	lui	s0,0x18
  3a:	735f 6365 6f74      	.insn	6, 0x6f746365735f
  40:	0072                	c.slli	zero,0x1c
  42:	61645f67          	.insn	4, 0x61645f67
  46:	6174                	.insn	2, 0x6174
  48:	625f 6765 6e69      	.insn	6, 0x6e696765625f
  4e:	6c5f 6162 7500      	.insn	6, 0x750061626c5f
  54:	7070                	.insn	2, 0x7070
  56:	7265                	lui	tp,0xffff9
  58:	635f 6168 0072      	.insn	6, 0x00726168635f
  5e:	2e2e                	.insn	2, 0x2e2e
  60:	2f2e2e2f          	.insn	4, 0x2f2e2e2f
  64:	2e2e                	.insn	2, 0x2e2e
  66:	672f2e2f          	amoand.w.aqrl	t3,s2,(t5)
  6a:	6c2f6363          	bltu	t5,sp,730 <$d.6+0xbd>
  6e:	6269                	lui	tp,0x1a
  70:	2f636367          	.insn	4, 0x2f636367
  74:	666e6f63          	bltu	t3,t1,6f2 <$d.6+0x7f>
  78:	6769                	lui	a4,0x1a
  7a:	7369722f          	.insn	4, 0x7369722f
  7e:	6d2f7663          	bgeu	t5,s2,74a <$d.6+0xd7>
  82:	6c75                	lui	s8,0x1d
  84:	6964                	.insn	2, 0x6964
  86:	00532e33          	slt	t3,t1,t0
  8a:	6975                	lui	s2,0x1d
  8c:	746e                	.insn	2, 0x746e
  8e:	3631                	jal	fffffb9a <_stack_top+0xffef3dda>
  90:	745f 6900 7864      	.insn	6, 0x78646900745f
  96:	6500                	.insn	2, 0x6500
  98:	746e                	.insn	2, 0x746e
  9a:	6f5f 6666 6100      	.insn	6, 0x610066666f5f
  a0:	7474                	.insn	2, 0x7474
  a2:	0072                	c.slli	zero,0x1c
  a4:	6461                	lui	s0,0x18
  a6:	7264                	.insn	2, 0x7264
  a8:	6a00                	.insn	2, 0x6a00
  aa:	6d75                	lui	s10,0x1d
  ac:	5f70                	lw	a2,124(a4)
  ae:	6f74                	.insn	2, 0x6f74
  b0:	6b5f 7265 656e      	.insn	6, 0x656e72656b5f
  b6:	006c                	addi	a1,sp,12
  b8:	675f6473          	.insn	4, 0x675f6473
  bc:	7465                	lui	s0,0xffff9
  be:	685f 5f77 7263      	.insn	6, 0x72635f77685f
  c4:	72630063          	beq	t1,t1,7e4 <$d.6+0x171>
  c8:	77685f63          	bge	a6,s6,846 <$d.6+0x1d3>
  cc:	7000                	.insn	2, 0x7000
  ce:	6300                	.insn	2, 0x6300
  d0:	5f79706f          	j	97ec6 <$d.7+0x9607e>
  d4:	657a6973          	.insn	4, 0x657a6973
  d8:	6e00                	.insn	2, 0x6e00
  da:	6200                	.insn	2, 0x6200
  dc:	5f746f6f          	jal	t5,46ed2 <$d.7+0x4508a>
  e0:	725f6473          	.insn	4, 0x725f6473
  e4:	6165                	addi	sp,sp,112
  e6:	5f64                	lw	s1,124(a4)
  e8:	74636573          	.insn	4, 0x74636573
  ec:	665f726f          	jal	tp,f7f50 <$d.7+0xf6108>
  f0:	006e                	c.slli	zero,0x1b
  f2:	735f6473          	.insn	4, 0x735f6473
  f6:	6365                	lui	t1,0x19
  f8:	6f74                	.insn	2, 0x6f74
  fa:	5f72                	lw	t5,60(sp)
  fc:	6461                	lui	s0,0x18
  fe:	7264                	.insn	2, 0x7264
 100:	7365                	lui	t1,0xffff9
 102:	65680073          	.insn	4, 0x65680073
 106:	0078                	addi	a4,sp,12
 108:	5f5f 756d 736c      	.insn	6, 0x736c756d5f5f
 10e:	3369                	jal	fffffe98 <_stack_top+0xffef40d8>
 110:	5f00                	lw	s0,56(a4)
 112:	6d5f 646f 6973      	.insn	6, 0x6973646f6d5f
 118:	72730033          	.insn	4, 0x72730033
 11c:	6f622f63          	.insn	4, 0x6f622f63
 120:	6f6c746f          	jal	s0,c7816 <$d.7+0xc59ce>
 124:	6461                	lui	s0,0x18
 126:	7265                	lui	tp,0xffff9
 128:	665f 7461 3233      	.insn	6, 0x32337461665f
 12e:	632e                	.insn	2, 0x632e
 130:	6d00                	.insn	2, 0x6d00
 132:	696d                	lui	s2,0x1b
 134:	33725f6f          	jal	t5,25c6a <$d.7+0x23e22>
 138:	0032                	c.slli	zero,0xc
 13a:	6c62                	.insn	2, 0x6c62
 13c:	705f 6972 746e      	.insn	6, 0x746e6972705f
 142:	685f 7865 6c00      	.insn	6, 0x6c007865685f
 148:	6162                	.insn	2, 0x6162
 14a:	6f00                	.insn	2, 0x6f00
 14c:	7475                	lui	s0,0xffffd
 14e:	7500                	.insn	2, 0x7500
 150:	6e69                	lui	t3,0x1a
 152:	7074                	.insn	2, 0x7074
 154:	7274                	.insn	2, 0x7274
 156:	745f 6c00 6568      	.insn	6, 0x65686c00745f
 15c:	0078                	addi	a4,sp,12
 15e:	6f725f67          	.insn	4, 0x6f725f67
 162:	635f746f          	jal	s0,f7f96 <$d.7+0xf614e>
 166:	756c                	.insn	2, 0x756c
 168:	72657473          	.insn	4, 0x72657473
 16c:	6300                	.insn	2, 0x6300
 16e:	756c                	.insn	2, 0x756c
 170:	72657473          	.insn	4, 0x72657473
 174:	6200                	.insn	2, 0x6200
 176:	5f6c                	lw	a1,124(a4)
 178:	7270                	.insn	2, 0x7270
 17a:	6e69                	lui	t3,0x1a
 17c:	0074                	addi	a3,sp,12
 17e:	7562                	.insn	2, 0x7562
 180:	0066                	c.slli	zero,0x19
 182:	0076                	c.slli	zero,0x1d
 184:	635f6473          	.insn	4, 0x635f6473
 188:	6372                	.insn	2, 0x6372
 18a:	3631                	jal	fffffc96 <_stack_top+0xffef3ed6>
 18c:	355f 3231 7300      	.insn	6, 0x73003231355f
 192:	7a69                	lui	s4,0xffffa
 194:	5f65                	li	t5,-7
 196:	0074                	addi	a3,sp,12
 198:	725f6473          	.insn	4, 0x725f6473
 19c:	6165                	addi	sp,sp,112
 19e:	5f64                	lw	s1,124(a4)
 1a0:	65636e6f          	jal	t3,367f6 <$d.7+0x349ae>
 1a4:	6500                	.insn	2, 0x6500
 1a6:	6400                	.insn	2, 0x6400
 1a8:	615f7473          	.insn	4, 0x615f7473
 1ac:	6464                	.insn	2, 0x6464
 1ae:	0072                	c.slli	zero,0x1c
 1b0:	32637263          	bgeu	t1,t1,4d4 <$d.3+0x19>
 1b4:	685f 0077 6175      	.insn	6, 0x61750077685f
 1ba:	7472                	.insn	2, 0x7472
 1bc:	705f 7475 6863      	.insn	6, 0x68637475705f
 1c2:	7261                	lui	tp,0xffff8
 1c4:	6300                	.insn	2, 0x6300
 1c6:	6d00                	.insn	2, 0x6d00
 1c8:	6d65                	lui	s10,0x19
 1ca:	00797063          	bgeu	s2,t2,1ca <$d.9+0x56>
 1ce:	0062                	c.slli	zero,0x18
 1d0:	6f6c                	.insn	2, 0x6f6c
 1d2:	6461                	lui	s0,0x18
 1d4:	6465                	lui	s0,0x19
 1d6:	735f 7a69 0065      	.insn	6, 0x00657a69735f
 1dc:	64726f77          	.insn	4, 0x64726f77
 1e0:	5f5f0073          	.insn	4, 0x5f5f0073
 1e4:	6964                	.insn	2, 0x6964
 1e6:	7376                	.insn	2, 0x7376
 1e8:	3369                	jal	ffffff72 <_stack_top+0xffef41b2>
 1ea:	7300                	.insn	2, 0x7300
 1ec:	6300                	.insn	2, 0x6300
 1ee:	6372                	.insn	2, 0x6372
 1f0:	6200                	.insn	2, 0x6200
 1f2:	6c746f6f          	jal	t5,470b8 <$d.7+0x45270>
 1f6:	6564616f          	jal	sp,4684c <$d.7+0x44a04>
 1fa:	5f72                	lw	t5,60(sp)
 1fc:	616d                	addi	sp,sp,240
 1fe:	6e69                	lui	t3,0x1a
 200:	7000                	.insn	2, 0x7000
 202:	6972                	.insn	2, 0x6972
 204:	746e                	.insn	2, 0x746e
 206:	685f 7865 0038      	.insn	6, 0x00387865685f
 20c:	2f637273          	.insn	4, 0x2f637273
 210:	61636473          	.insn	4, 0x61636473
 214:	6472                	.insn	2, 0x6472
 216:	615f 6970 632e      	.insn	6, 0x632e6970615f
 21c:	6b00                	.insn	2, 0x6b00
 21e:	6800                	.insn	2, 0x6800
 220:	7865                	lui	a6,0xffff9
 222:	635f 756f 746e      	.insn	6, 0x746e756f635f
 228:	6200                	.insn	2, 0x6200
 22a:	5f746f6f          	jal	t5,47020 <$d.7+0x451d8>
 22e:	6166                	.insn	2, 0x6166
 230:	3374                	.insn	2, 0x3374
 232:	5f32                	lw	t5,44(sp)
 234:	6f6d                	lui	t5,0x1b
 236:	6e75                	lui	t3,0x1d
 238:	0074                	addi	a3,sp,12
 23a:	6f62                	.insn	2, 0x6f62
 23c:	735f746f          	jal	s0,f8170 <$d.7+0xf6328>
 240:	5f64                	lw	s1,124(a4)
 242:	6572                	.insn	2, 0x6572
 244:	6461                	lui	s0,0x18
 246:	735f 6365 6f74      	.insn	6, 0x6f746365735f
 24c:	0072                	c.slli	zero,0x1c
 24e:	696e                	.insn	2, 0x696e
 250:	6262                	.insn	2, 0x6262
 252:	656c                	.insn	2, 0x656c
 254:	4d00                	lw	s0,24(a0)
 256:	5841                	li	a6,-16
 258:	4c5f 4e45 6200      	.insn	6, 0x62004e454c5f
 25e:	5f746f6f          	jal	t5,47054 <$d.7+0x4520c>
 262:	6166                	.insn	2, 0x6166
 264:	3374                	.insn	2, 0x3374
 266:	5f32                	lw	t5,44(sp)
 268:	6966                	.insn	2, 0x6966
 26a:	646e                	.insn	2, 0x646e
 26c:	6200                	.insn	2, 0x6200
 26e:	5f746f6f          	jal	t5,47064 <$d.7+0x4521c>
 272:	6166                	.insn	2, 0x6166
 274:	3374                	.insn	2, 0x3374
 276:	5f32                	lw	t5,44(sp)
 278:	6f6c                	.insn	2, 0x6f6c
 27a:	6461                	lui	s0,0x18
 27c:	665f 6c69 0065      	.insn	6, 0x00656c69665f

00000282 <$d.6>:
 282:	6255                	lui	tp,0x15
 284:	6e75                	lui	t3,0x1d
 286:	7574                	.insn	2, 0x7574
 288:	6320                	.insn	2, 0x6320
 28a:	616c                	.insn	2, 0x616c
 28c:	676e                	.insn	2, 0x676e
 28e:	7620                	.insn	2, 0x7620
 290:	7265                	lui	tp,0xffff9
 292:	6e6f6973          	.insn	4, 0x6e6f6973
 296:	3120                	.insn	2, 0x3120
 298:	2e38                	.insn	2, 0x2e38
 29a:	2e31                	jal	5b6 <$d.3+0xfb>
 29c:	31282033          	.insn	4, 0x31282033
 2a0:	6275                	lui	tp,0x1d
 2a2:	6e75                	lui	t3,0x1d
 2a4:	7574                	.insn	2, 0x7574
 2a6:	2931                	jal	6c2 <$d.6+0x4f>
 2a8:	7300                	.insn	2, 0x7300
 2aa:	6372                	.insn	2, 0x6372
 2ac:	6d6f632f          	.insn	4, 0x6d6f632f
 2b0:	6f6d                	lui	t5,0x1b
 2b2:	2e6e                	.insn	2, 0x2e6e
 2b4:	64730063          	beq	t1,t2,8f4 <$d.6+0x281>
 2b8:	635f 6372 3631      	.insn	6, 0x36316372635f
 2be:	6600                	.insn	2, 0x6600
 2c0:	7461                	lui	s0,0xffff8
 2c2:	6c5f 6162 6200      	.insn	6, 0x620061626c5f
 2c8:	5f746f6f          	jal	t5,470be <$d.7+0x45276>
 2cc:	6166                	.insn	2, 0x6166
 2ce:	3374                	.insn	2, 0x3374
 2d0:	5f32                	lw	t5,44(sp)
 2d2:	636c6163          	bltu	s8,s6,8f4 <$d.6+0x281>
 2d6:	6c5f 6162 6e5f      	.insn	6, 0x6e5f61626c5f
 2dc:	6f6c5f6f          	jal	t5,c59d2 <$d.7+0xc3b8a>
 2e0:	6200706f          	j	7900 <$d.7+0x5ab8>
 2e4:	5f746f6f          	jal	t5,470da <$d.7+0x45292>
 2e8:	6166                	.insn	2, 0x6166
 2ea:	3374                	.insn	2, 0x3374
 2ec:	5f32                	lw	t5,44(sp)
 2ee:	6f6c                	.insn	2, 0x6f6c
 2f0:	6461                	lui	s0,0x18
 2f2:	6d5f 6d65 665f      	.insn	6, 0x665f6d656d5f
 2f8:	6c69                	lui	s8,0x1a
 2fa:	0065                	c.nop	25
 2fc:	5f637263          	bgeu	t1,s6,8e0 <$d.6+0x26d>
 300:	66007773          	.insn	4, 0x66007773
 304:	7461                	lui	s0,0xffff8
 306:	625f3233          	.insn	4, 0x625f3233
 30a:	6675                	lui	a2,0x1d
 30c:	6300                	.insn	2, 0x6300
 30e:	5f6c                	lw	a1,124(a4)
 310:	6f6c                	.insn	2, 0x6f6c
 312:	7500                	.insn	2, 0x7500
 314:	6e69                	lui	t3,0x1a
 316:	3374                	.insn	2, 0x3374
 318:	5f32                	lw	t5,44(sp)
 31a:	0074                	addi	a3,sp,12
 31c:	6d6d                	lui	s10,0x1b
 31e:	6f69                	lui	t5,0x1a
 320:	775f 3233 6300      	.insn	6, 0x63003233775f
 326:	646d                	lui	s0,0x1b
 328:	645f 6d75 0070      	.insn	6, 0x00706d75645f
 32e:	6162                	.insn	2, 0x6162
 330:	615f6573          	.insn	4, 0x615f6573
 334:	6464                	.insn	2, 0x6464
 336:	5f72                	lw	t5,60(sp)
 338:	616c                	.insn	2, 0x616c
 33a:	6562                	.insn	2, 0x6562
 33c:	006c                	addi	a1,sp,12
 33e:	0066666f          	jal	a2,66344 <$d.7+0x644fc>
 342:	4544                	lw	s1,12(a0)
 344:	4146                	lw	sp,80(sp)
 346:	4c55                	li	s8,21
 348:	5f54                	lw	a3,60(a4)
 34a:	4142                	lw	sp,16(sp)
 34c:	73004553          	.insn	4, 0x73004553
 350:	6375                	lui	t1,0x1d
 352:	73736563          	bltu	t1,s7,a7c <$d.6+0x409>
 356:	6c00                	.insn	2, 0x6c00
 358:	6564616f          	jal	sp,469ae <$d.7+0x44b66>
 35c:	5f64                	lw	s1,124(a4)
 35e:	64726f77          	.insn	4, 0x64726f77
 362:	72730073          	.insn	4, 0x72730073
 366:	6e750063          	beq	a0,t2,a46 <$d.6+0x3d3>
 36a:	6e676973          	.insn	4, 0x6e676973
 36e:	6465                	lui	s0,0x19
 370:	6320                	.insn	2, 0x6320
 372:	6168                	.insn	2, 0x6168
 374:	0072                	c.slli	zero,0x1c
 376:	66696873          	.insn	4, 0x66696873
 37a:	0074                	addi	a3,sp,12
 37c:	6964                	.insn	2, 0x6964
 37e:	5f72                	lw	t5,60(sp)
 380:	73756c63          	bltu	a0,s7,ab8 <$d.6+0x445>
 384:	6574                	.insn	2, 0x6574
 386:	0072                	c.slli	zero,0x1c
 388:	616d                	addi	sp,sp,240
 38a:	6374                	.insn	2, 0x6374
 38c:	0068                	addi	a0,sp,12
 38e:	6d6f682f          	.insn	4, 0x6d6f682f
 392:	2f65                	jal	b4a <$d.6+0x4d7>
 394:	6168                	.insn	2, 0x6168
 396:	7572                	.insn	2, 0x7572
 398:	6968                	.insn	2, 0x6968
 39a:	722f6f6b          	.insn	4, 0x722f6f6b
 39e:	7369                	lui	t1,0xffffa
 3a0:	672d7663          	bgeu	s10,s2,a0c <$d.6+0x399>
 3a4:	756e                	.insn	2, 0x756e
 3a6:	742d                	lui	s0,0xfffeb
 3a8:	636c6f6f          	jal	t5,c69de <$d.7+0xc4b96>
 3ac:	6168                	.insn	2, 0x6168
 3ae:	6e69                	lui	t3,0x1a
 3b0:	6975622f          	.insn	4, 0x6975622f
 3b4:	646c                	.insn	2, 0x646c
 3b6:	672d                	lui	a4,0xb
 3b8:	6e2d6363          	bltu	s10,sp,a9e <$d.6+0x42b>
 3bc:	7765                	lui	a4,0xffff9
 3be:	696c                	.insn	2, 0x696c
 3c0:	2d62                	.insn	2, 0x2d62
 3c2:	67617473          	.insn	4, 0x67617473
 3c6:	3265                	jal	fffffd6e <_stack_top+0xffef3fae>
 3c8:	7369722f          	.insn	4, 0x7369722f
 3cc:	32337663          	bgeu	t1,gp,6f8 <$d.6+0x85>
 3d0:	752d                	lui	a0,0xfffeb
 3d2:	6b6e                	.insn	2, 0x6b6e
 3d4:	6f6e                	.insn	2, 0x6f6e
 3d6:	652d6e77          	.insn	4, 0x652d6e77
 3da:	666c                	.insn	2, 0x666c
 3dc:	62696c2f          	.insn	4, 0x62696c2f
 3e0:	00636367          	.insn	4, 0x00636367
 3e4:	2e2e                	.insn	2, 0x2e2e
 3e6:	2f2e2e2f          	.insn	4, 0x2f2e2e2f
 3ea:	2e2e                	.insn	2, 0x2e2e
 3ec:	672f2e2f          	amoand.w.aqrl	t3,s2,(t5)
 3f0:	6c2f6363          	bltu	t5,sp,ab6 <$d.6+0x443>
 3f4:	6269                	lui	tp,0x1a
 3f6:	2f636367          	.insn	4, 0x2f636367
 3fa:	666e6f63          	bltu	t3,t1,a78 <$d.6+0x405>
 3fe:	6769                	lui	a4,0x1a
 400:	7369722f          	.insn	4, 0x7369722f
 404:	642f7663          	bgeu	t5,sp,a50 <$d.6+0x3dd>
 408:	7669                	lui	a2,0xffffa
 40a:	532e                	lw	t1,232(sp)
 40c:	6300                	.insn	2, 0x6300
 40e:	6168                	.insn	2, 0x6168
 410:	0072                	c.slli	zero,0x1c
 412:	6e69                	lui	t3,0x1a
 414:	0074                	addi	a3,sp,12
 416:	656d                	lui	a0,0x1b
 418:	736d                	lui	t1,0xffffb
 41a:	7465                	lui	s0,0xffff9
 41c:	6100                	.insn	2, 0x6100
 41e:	6772                	.insn	2, 0x6772
 420:	0076                	c.slli	zero,0x1d
 422:	6572                	.insn	2, 0x6572
 424:	7274                	.insn	2, 0x7274
 426:	5f79                	li	t5,-2
 428:	616d                	addi	sp,sp,240
 42a:	0078                	addi	a4,sp,12
 42c:	65735f67          	.insn	4, 0x65735f67
 430:	726f7463          	bgeu	t5,t1,b58 <$d.6+0x4e5>
 434:	65705f73          	.insn	4, 0x65705f73
 438:	5f72                	lw	t5,60(sp)
 43a:	73756c63          	bltu	a0,s7,b72 <$d.6+0x4ff>
 43e:	6574                	.insn	2, 0x6574
 440:	0072                	c.slli	zero,0x1c
 442:	6f62                	.insn	2, 0x6f62
 444:	665f746f          	jal	s0,f82a8 <$d.7+0xf6460>
 448:	7461                	lui	s0,0xffff8
 44a:	735f3233          	.insn	4, 0x735f3233
 44e:	6370                	.insn	2, 0x6370
 450:	735f 6968 7466      	.insn	6, 0x74666968735f
 456:	4800                	lw	s0,16(s0)
 458:	5845                	li	a6,-15
 45a:	6700                	.insn	2, 0x6700
 45c:	665f 7461 625f      	.insn	6, 0x625f7461665f
 462:	6765                	lui	a4,0x19
 464:	6e69                	lui	t3,0x1a
 466:	6c5f 6162 2f00      	.insn	6, 0x2f0061626c5f
 46c:	6f68                	.insn	2, 0x6f68
 46e:	656d                	lui	a0,0x1b
 470:	7261682f          	.insn	4, 0x7261682f
 474:	6875                	lui	a6,0x1d
 476:	6b69                	lui	s6,0x1a
 478:	72502f6f          	jal	t5,339c <$d.7+0x1554>
 47c:	6172676f          	jal	a4,27292 <$d.7+0x2544a>
 480:	2f6d                	jal	c3a <$d.6+0x5c7>
 482:	5350                	lw	a2,36(a4)
 484:	56525f43          	.insn	4, 0x56525f43
 488:	2f493233          	.insn	4, 0x2f493233
 48c:	5350                	lw	a2,36(a4)
 48e:	4e4f2d43          	.insn	4, 0x4e4f2d43
 492:	2f45                	jal	c42 <$d.6+0x5cf>
 494:	74666f73          	.insn	4, 0x74666f73
 498:	65726177          	.insn	4, 0x65726177
 49c:	00736f2f          	.insn	4, 0x00736f2f
 4a0:	72705f73          	.insn	4, 0x72705f73
 4a4:	6e69                	lui	t3,0x1a
 4a6:	6674                	.insn	2, 0x6674
 4a8:	6600                	.insn	2, 0x6600
 4aa:	6c69                	lui	s8,0x1a
 4ac:	5f65                	li	t5,-7
 4ae:	7562                	.insn	2, 0x7562
 4b0:	0066                	c.slli	zero,0x19
 4b2:	6472                	.insn	2, 0x6472
 4b4:	3631                	jal	ffffffc0 <_stack_top+0xffef4200>
 4b6:	6200                	.insn	2, 0x6200
 4b8:	5f746f6f          	jal	t5,472ae <$d.7+0x45466>
 4bc:	6166                	.insn	2, 0x6166
 4be:	3374                	.insn	2, 0x3374
 4c0:	5f32                	lw	t5,44(sp)
 4c2:	73756c63          	bltu	a0,s7,bfa <$d.6+0x587>
 4c6:	6574                	.insn	2, 0x6574
 4c8:	5f72                	lw	t5,60(sp)
 4ca:	6f74                	.insn	2, 0x6f74
 4cc:	6c5f 6162 6600      	.insn	6, 0x660061626c5f
 4d2:	7461                	lui	s0,0xffff8
 4d4:	735f 7a69 0065      	.insn	6, 0x00657a69735f
 4da:	31637263          	bgeu	t1,s6,7de <$d.6+0x16b>
 4de:	685f 0077 6176      	.insn	6, 0x61760077685f
 4e4:	756c                	.insn	2, 0x756c
 4e6:	0065                	c.nop	25
 4e8:	2f637273          	.insn	4, 0x2f637273
 4ec:	6f62                	.insn	2, 0x6f62
 4ee:	665f746f          	jal	s0,f8352 <$d.7+0xf650a>
 4f2:	7461                	lui	s0,0xffff8
 4f4:	632e3233          	.insn	4, 0x632e3233
 4f8:	6600                	.insn	2, 0x6600
 4fa:	7461                	lui	s0,0xffff8
 4fc:	6f5f 6666 6573      	.insn	6, 0x657366666f5f
 502:	0074                	addi	a3,sp,12
 504:	5f5f 6475 7669      	.insn	6, 0x766964755f5f
 50a:	00336973          	.insn	4, 0x00336973
 50e:	7270                	.insn	2, 0x7270
 510:	6e69                	lui	t3,0x1a
 512:	5f74                	lw	a3,124(a4)
 514:	6568                	.insn	2, 0x6568
 516:	3378                	.insn	2, 0x3378
 518:	0032                	c.slli	zero,0xc
 51a:	4544                	lw	s1,12(a0)
 51c:	4146                	lw	sp,80(sp)
 51e:	4c55                	li	s8,21
 520:	5f54                	lw	a3,60(a4)
 522:	454c                	lw	a1,12(a0)
 524:	004e                	c.slli	zero,0x13
 526:	6e75                	lui	t3,0x1d
 528:	6e676973          	.insn	4, 0x6e676973
 52c:	6465                	lui	s0,0x19
 52e:	6920                	.insn	2, 0x6920
 530:	746e                	.insn	2, 0x746e
 532:	7400                	.insn	2, 0x7400
 534:	6d69                	lui	s10,0x1a
 536:	6f65                	lui	t5,0x19
 538:	7475                	lui	s0,0xffffd
 53a:	6300                	.insn	2, 0x6300
 53c:	7570                	.insn	2, 0x7570
 53e:	725f 6c65 7861      	.insn	6, 0x78616c65725f
 544:	7200                	.insn	2, 0x7200
 546:	6d65                	lui	s10,0x19
 548:	7200                	.insn	2, 0x7200
 54a:	6c00                	.insn	2, 0x6c00
 54c:	6e69                	lui	t3,0x1a
 54e:	0065                	c.nop	25
 550:	7261                	lui	tp,0xffff8
 552:	73006367          	.insn	4, 0x73006367
 556:	5f64                	lw	s1,124(a4)
 558:	6e69                	lui	t3,0x1a
 55a:	7469                	lui	s0,0xffffa
 55c:	695f 5f66 656e      	.insn	6, 0x656e5f66695f
 562:	6465                	lui	s0,0x19
 564:	6465                	lui	s0,0x19
 566:	7200                	.insn	2, 0x7200
 568:	7465                	lui	s0,0xffff9
 56a:	7972                	.insn	2, 0x7972
 56c:	6e00                	.insn	2, 0x6e00
 56e:	7865                	lui	a6,0xffff9
 570:	0074                	addi	a3,sp,12
 572:	5f5f 6968 6464      	.insn	6, 0x646469685f5f
 578:	6e65                	lui	t3,0x19
 57a:	5f5f 755f 6964      	.insn	6, 0x6964755f5f5f
 580:	7376                	.insn	2, 0x7376
 582:	3369                	jal	30c <$d.6+0x8a>
 584:	5f00                	lw	s0,56(a4)
 586:	415f 5252 5941      	.insn	6, 0x59415252415f
 58c:	535f 5a49 5f45      	.insn	6, 0x5f455a49535f
 592:	5954                	lw	a3,52(a0)
 594:	4550                	lw	a2,12(a0)
 596:	5f5f 6300 7274      	.insn	6, 0x727463005f5f
 59c:	006c                	addi	a1,sp,12
 59e:	6964                	.insn	2, 0x6964
 5a0:	6d76                	.insn	2, 0x6d76
 5a2:	3031646f          	jal	s0,170a4 <$d.7+0x1525c>
 5a6:	7000                	.insn	2, 0x7000
 5a8:	7261                	lui	tp,0xffff8
 5aa:	685f6573          	.insn	4, 0x685f6573
 5ae:	7865                	lui	a6,0xffff9
 5b0:	6e00                	.insn	2, 0x6e00
 5b2:	6d61                	lui	s10,0x18
 5b4:	0065                	c.nop	25
 5b6:	6975                	lui	s2,0x1d
 5b8:	746e                	.insn	2, 0x746e
 5ba:	5f38                	lw	a4,120(a4)
 5bc:	0074                	addi	a3,sp,12
 5be:	0071                	c.nop	28
 5c0:	0064                	addi	s1,sp,12
 5c2:	5f5f 7562 6c69      	.insn	6, 0x6c6975625f5f
 5c8:	6974                	.insn	2, 0x6974
 5ca:	5f6e                	lw	t5,248(sp)
 5cc:	6176                	.insn	2, 0x6176
 5ce:	6c5f 7369 0074      	.insn	6, 0x007473696c5f
 5d4:	6174                	.insn	2, 0x6174
 5d6:	6772                	.insn	2, 0x6772
 5d8:	7465                	lui	s0,0xffff9
 5da:	7500                	.insn	2, 0x7500
 5dc:	5f726573          	.insn	4, 0x5f726573
 5e0:	64726f77          	.insn	4, 0x64726f77
 5e4:	6e650073          	.insn	4, 0x6e650073
 5e8:	0064                	addi	s1,sp,12
 5ea:	6472                	.insn	2, 0x6472
 5ec:	68003233          	.insn	4, 0x68003233
 5f0:	7865                	lui	a6,0xffff9
 5f2:	765f 6c61 6200      	.insn	6, 0x62006c61765f
 5f8:	7479                	lui	s0,0xffffe
 5fa:	7365                	lui	t1,0xffff9
 5fc:	705f 7265 735f      	.insn	6, 0x735f7265705f
 602:	6365                	lui	t1,0x19
 604:	6f74                	.insn	2, 0x6f74
 606:	0072                	c.slli	zero,0x1c
 608:	685f6c63          	bltu	t5,t0,ca0 <$d.6+0x62d>
 60c:	0069                	c.nop	26
 60e:	74636573          	.insn	4, 0x74636573
 612:	625f726f          	jal	tp,f8436 <$d.7+0xf65ee>
 616:	7479                	lui	s0,0xffffe
 618:	7365                	lui	t1,0xffff9
 61a:	6500                	.insn	2, 0x6500
 61c:	746e                	.insn	2, 0x746e
 61e:	7972                	.insn	2, 0x7972
 620:	6b00                	.insn	2, 0x6b00
 622:	7265                	lui	tp,0xffff9
 624:	656e                	.insn	2, 0x656e
 626:	5f6c                	lw	a1,124(a4)
 628:	64726f77          	.insn	4, 0x64726f77
 62c:	65680073          	.insn	4, 0x65680073
 630:	6478                	.insn	2, 0x6478
 632:	6d75                	lui	s10,0x1d
 634:	0070                	addi	a2,sp,12
 636:	7366666f          	jal	a2,66d6c <$d.7+0x64f24>
 63a:	7465                	lui	s0,0xffff9
 63c:	7200                	.insn	2, 0x7200
 63e:	7365                	lui	t1,0xffff9
 640:	7265                	lui	tp,0xffff9
 642:	6576                	.insn	2, 0x6576
 644:	5f64                	lw	s1,124(a4)
 646:	74636573          	.insn	4, 0x74636573
 64a:	635f726f          	jal	tp,f847e <$d.7+0xf6636>
 64e:	746e756f          	jal	a0,e7d94 <$d.7+0xe5f4c>
 652:	6600                	.insn	2, 0x6600
 654:	7461                	lui	s0,0xffff8
 656:	635f 756f 746e      	.insn	6, 0x746e756f635f
 65c:	6600                	.insn	2, 0x6600
 65e:	746d                	lui	s0,0xffffb
 660:	7300                	.insn	2, 0x7300
 662:	635f 6c61 5f6c      	.insn	6, 0x5f6c6c61635f
 668:	61636473          	.insn	4, 0x61636473
 66c:	6472                	.insn	2, 0x6472
 66e:	725f 6165 5f64      	.insn	6, 0x5f646165725f
 674:	7061                	c.lui	zero,0xffff8
 676:	0069                	c.nop	26
 678:	74636573          	.insn	4, 0x74636573
 67c:	7200726f          	jal	tp,7d9c <$d.7+0x5f54>
 680:	6165                	addi	sp,sp,112
 682:	5f64                	lw	s1,124(a4)
 684:	74636573          	.insn	4, 0x74636573
 688:	6700726f          	jal	tp,7cf8 <$d.7+0x5eb0>
 68c:	705f 7261 5f74      	.insn	6, 0x5f747261705f
 692:	626c                	.insn	2, 0x626c
 694:	0061                	c.nop	24
 696:	6f62                	.insn	2, 0x6f62
 698:	665f746f          	jal	s0,f84fc <$d.7+0xf66b4>
 69c:	7461                	lui	s0,0xffff8
 69e:	6e5f3233          	.insn	4, 0x6e5f3233
 6a2:	7865                	lui	a6,0xffff9
 6a4:	5f74                	lw	a3,124(a4)
 6a6:	73756c63          	bltu	a0,s7,dde <$d.2+0x50>
 6aa:	6574                	.insn	2, 0x6574
 6ac:	0072                	c.slli	zero,0x1c
 6ae:	657a6973          	.insn	4, 0x657a6973
 6b2:	4700                	lw	s0,8(a4)
 6b4:	554e                	lw	a0,240(sp)
 6b6:	4120                	lw	s0,64(a0)
 6b8:	2e322053          	.insn	4, 0x2e322053
 6bc:	3534                	.insn	2, 0x3534
 6be:	6a00                	.insn	2, 0x6a00
 6c0:	7500                	.insn	2, 0x7500
 6c2:	6e00                	.insn	2, 0x6e00
 6c4:	6269                	lui	tp,0x1a
 6c6:	7300                	.insn	2, 0x7300
 6c8:	705f 6972 746e      	.insn	6, 0x746e6972705f
 6ce:	695f 746e 6900      	.insn	6, 0x6900746e695f
 6d4:	61665f73          	.insn	4, 0x61665f73
 6d8:	3374                	.insn	2, 0x3374
 6da:	5f32                	lw	t5,44(sp)
 6dc:	6f62                	.insn	2, 0x6f62
 6de:	735f746f          	jal	s0,f8612 <$d.7+0xf67ca>
 6e2:	6365                	lui	t1,0x19
 6e4:	6f74                	.insn	2, 0x6f74
 6e6:	0072                	c.slli	zero,0x1c
 6e8:	64726f77          	.insn	4, 0x64726f77
 6ec:	6800                	.insn	2, 0x6800
 6ee:	7000                	.insn	2, 0x7000
 6f0:	7475                	lui	s0,0xffffd
 6f2:	72616863          	bltu	sp,t1,e22 <$d.2+0x94>
 6f6:	6300                	.insn	2, 0x6300
 6f8:	0068                	addi	a0,sp,12
 6fa:	6176                	.insn	2, 0x6176
 6fc:	6772                	.insn	2, 0x6772
 6fe:	5f670073          	.insn	4, 0x5f670073
 702:	6572                	.insn	2, 0x6572
 704:	6461                	lui	s0,0x18
 706:	735f 6365 6f74      	.insn	6, 0x6f746365735f
 70c:	0072                	c.slli	zero,0x1c
 70e:	5f5f 6d75 646f      	.insn	6, 0x646f6d755f5f
 714:	00336973          	.insn	4, 0x00336973

セクション .comment の逆アセンブル:

00000000 <$d.10>:
   0:	5500                	lw	s0,40(a0)
   2:	7562                	.insn	2, 0x7562
   4:	746e                	.insn	2, 0x746e
   6:	2075                	jal	b2 <$d.4+0xf>
   8:	6e616c63          	bltu	sp,t1,700 <$d.6+0x8d>
   c:	65762067          	.insn	4, 0x65762067
  10:	7372                	.insn	2, 0x7372
  12:	6f69                	lui	t5,0x1a
  14:	206e                	.insn	2, 0x206e
  16:	3831                	jal	fffff832 <_stack_top+0xffef3a72>
  18:	312e                	.insn	2, 0x312e
  1a:	332e                	.insn	2, 0x332e
  1c:	2820                	.insn	2, 0x2820
  1e:	7531                	lui	a0,0xfffec
  20:	7562                	.insn	2, 0x7562
  22:	746e                	.insn	2, 0x746e
  24:	3175                	jal	fffffcd0 <_stack_top+0xffef3f10>
  26:	0029                	c.nop	10
  28:	694c                	.insn	2, 0x694c
  2a:	6b6e                	.insn	2, 0x6b6e
  2c:	7265                	lui	tp,0xffff9
  2e:	203a                	.insn	2, 0x203a
  30:	6255                	lui	tp,0x15
  32:	6e75                	lui	t3,0x1d
  34:	7574                	.insn	2, 0x7574
  36:	4c20                	lw	s0,88(s0)
  38:	444c                	lw	a1,12(s0)
  3a:	3120                	.insn	2, 0x3120
  3c:	2e38                	.insn	2, 0x2e38
  3e:	2e31                	jal	35a <$d.6+0xd8>
  40:	0033                	.short	0x0033

セクション .debug_frame の逆アセンブル:

00000000 <$d.9>:
   0:	0010                	.insn	2, 0x0010
   2:	0000                	unimp
   4:	ffff                	.insn	2, 0xffff
   6:	ffff                	.insn	2, 0xffff
   8:	0004                	.insn	2, 0x0004
   a:	0004                	.insn	2, 0x0004
   c:	7c01                	lui	s8,0xfffe0
   e:	0c01                	addi	s8,s8,0 # fffe0000 <_stack_top+0xffed4240>
  10:	0002                	c.slli64	zero
  12:	0000                	unimp
  14:	000c                	.insn	2, 0x000c
  16:	0000                	unimp
  18:	0000                	unimp
  1a:	0000                	unimp
  1c:	0014                	.insn	2, 0x0014
  1e:	0010                	.insn	2, 0x0010
  20:	0020                	addi	s0,sp,8
  22:	0000                	unimp
  24:	000c                	.insn	2, 0x000c
  26:	0000                	unimp
  28:	0000                	unimp
  2a:	0000                	unimp
  2c:	0034                	addi	a3,sp,8
  2e:	0010                	.insn	2, 0x0010
  30:	0020                	addi	s0,sp,8
  32:	0000                	unimp
  34:	0018                	.insn	2, 0x0018
  36:	0000                	unimp
  38:	0000                	unimp
  3a:	0000                	unimp
  3c:	0054                	addi	a3,sp,4
  3e:	0010                	.insn	2, 0x0010
  40:	03f8                	addi	a4,sp,460
  42:	0000                	unimp
  44:	0e44                	addi	s1,sp,788
  46:	5020                	lw	s0,96(s0)
  48:	0181                	addi	gp,gp,0
  4a:	0288                	addi	a0,sp,320
  4c:	0389                	addi	t2,t2,2
  4e:	0492                	slli	s1,s1,0x4
  50:	000c                	.insn	2, 0x000c
  52:	0000                	unimp
  54:	0000                	unimp
  56:	0000                	unimp
  58:	044c                	addi	a1,sp,516
  5a:	0010                	.insn	2, 0x0010
  5c:	0038                	addi	a4,sp,8
  5e:	0000                	unimp
  60:	0028                	addi	a0,sp,8
  62:	0000                	unimp
  64:	0000                	unimp
  66:	0000                	unimp
  68:	0484                	addi	s1,sp,576
  6a:	0010                	.insn	2, 0x0010
  6c:	080c                	addi	a1,sp,16
  6e:	0000                	unimp
  70:	0e44                	addi	s1,sp,788
  72:	7030                	.insn	2, 0x7030
  74:	0188                	addi	a0,sp,192
  76:	0289                	addi	t0,t0,2
  78:	0392                	slli	t2,t2,0x4
  7a:	05940493          	addi	s1,s0,89 # 18059 <$d.7+0x16211>
  7e:	0695                	addi	a3,a3,5 # 5 <$d.9+0x5>
  80:	0796                	slli	a5,a5,0x5
  82:	09980897          	auipc	a7,0x9980
  86:	0a99                	addi	s5,s5,6 # ffff9006 <_stack_top+0xffeed246>
  88:	0b9a                	slli	s7,s7,0x6
  8a:	000c0c9b          	.insn	4, 0x000c0c9b
  8e:	0000                	unimp
  90:	0000                	unimp
  92:	0000                	unimp
  94:	0c90                	addi	a2,sp,592
  96:	0010                	.insn	2, 0x0010
  98:	0050                	addi	a2,sp,4
	...

0000009c <$d.9>:
  9c:	0010                	.insn	2, 0x0010
  9e:	0000                	unimp
  a0:	ffff                	.insn	2, 0xffff
  a2:	ffff                	.insn	2, 0xffff
  a4:	0004                	.insn	2, 0x0004
  a6:	0004                	.insn	2, 0x0004
  a8:	7c01                	lui	s8,0xfffe0
  aa:	0c01                	addi	s8,s8,0 # fffe0000 <_stack_top+0xffed4240>
  ac:	0002                	c.slli64	zero
  ae:	0000                	unimp
  b0:	000c                	.insn	2, 0x000c
  b2:	0000                	unimp
  b4:	009c                	addi	a5,sp,64
  b6:	0000                	unimp
  b8:	0ce0                	addi	s0,sp,604
  ba:	0010                	.insn	2, 0x0010
  bc:	0028                	addi	a0,sp,8
  be:	0000                	unimp
  c0:	000c                	.insn	2, 0x000c
  c2:	0000                	unimp
  c4:	009c                	addi	a5,sp,64
  c6:	0000                	unimp
  c8:	0d08                	addi	a0,sp,656
  ca:	0010                	.insn	2, 0x0010
  cc:	0020                	addi	s0,sp,8
  ce:	0000                	unimp
  d0:	0018                	.insn	2, 0x0018
  d2:	0000                	unimp
  d4:	009c                	addi	a5,sp,64
  d6:	0000                	unimp
  d8:	0d28                	addi	a0,sp,664
  da:	0010                	.insn	2, 0x0010
  dc:	00fc                	addi	a5,sp,76
  de:	0000                	unimp
  e0:	0e44                	addi	s1,sp,788
  e2:	5020                	lw	s0,96(s0)
  e4:	0181                	addi	gp,gp,0
  e6:	0288                	addi	a0,sp,320
  e8:	0389                	addi	t2,t2,2
  ea:	0492                	slli	s1,s1,0x4
  ec:	002c                	addi	a1,sp,8
  ee:	0000                	unimp
  f0:	009c                	addi	a5,sp,64
  f2:	0000                	unimp
  f4:	0e24                	addi	s1,sp,792
  f6:	0010                	.insn	2, 0x0010
  f8:	02d8                	addi	a4,sp,324
  fa:	0000                	unimp
  fc:	0e44                	addi	s1,sp,788
  fe:	7470                	.insn	2, 0x7470
 100:	0981                	addi	s3,s3,0 # 94f <$d.6+0x2dc>
 102:	0a88                	addi	a0,sp,336
 104:	0b89                	addi	s7,s7,2
 106:	0c92                	slli	s9,s9,0x4
 108:	0e940d93          	addi	s11,s0,233
 10c:	0f95                	addi	t6,t6,5
 10e:	1096                	slli	ra,ra,0x25
 110:	12981197          	auipc	gp,0x12981
 114:	1399                	addi	t2,t2,-26
 116:	149a                	slli	s1,s1,0x26
 118:	0000159b          	.insn	4, 0x159b
 11c:	000c                	.insn	2, 0x000c
 11e:	0000                	unimp
 120:	009c                	addi	a5,sp,64
 122:	0000                	unimp
 124:	10fc                	addi	a5,sp,108
 126:	0010                	.insn	2, 0x0010
 128:	00cc                	addi	a1,sp,68
 12a:	0000                	unimp
 12c:	002c                	addi	a1,sp,8
 12e:	0000                	unimp
 130:	009c                	addi	a5,sp,64
 132:	0000                	unimp
 134:	11c8                	addi	a0,sp,228
 136:	0010                	.insn	2, 0x0010
 138:	0280                	addi	s0,sp,320
 13a:	0000                	unimp
 13c:	0e44                	addi	s1,sp,788
 13e:	7440                	.insn	2, 0x7440
 140:	0181                	addi	gp,gp,0 # 12981110 <_stack_top+0x12875350>
 142:	0288                	addi	a0,sp,320
 144:	0389                	addi	t2,t2,2
 146:	0492                	slli	s1,s1,0x4
 148:	06940593          	addi	a1,s0,105
 14c:	0795                	addi	a5,a5,5
 14e:	0896                	slli	a7,a7,0x5
 150:	0a980997          	auipc	s3,0xa980
 154:	0b99                	addi	s7,s7,6
 156:	0c9a                	slli	s9,s9,0x6
 158:	00000d9b          	.insn	4, 0x0d9b
 15c:	0014                	.insn	2, 0x0014
 15e:	0000                	unimp
 160:	009c                	addi	a5,sp,64
 162:	0000                	unimp
 164:	1448                	addi	a0,sp,548
 166:	0010                	.insn	2, 0x0010
 168:	0250                	addi	a2,sp,260
 16a:	0000                	unimp
 16c:	0e44                	addi	s1,sp,788
 16e:	4810                	lw	a2,16(s0)
 170:	0181                	addi	gp,gp,0
 172:	0288                	addi	a0,sp,320

00000174 <$d.9>:
 174:	0010                	.insn	2, 0x0010
 176:	0000                	unimp
 178:	ffff                	.insn	2, 0xffff
 17a:	ffff                	.insn	2, 0xffff
 17c:	0004                	.insn	2, 0x0004
 17e:	0004                	.insn	2, 0x0004
 180:	7c01                	lui	s8,0xfffe0
 182:	0c01                	addi	s8,s8,0 # fffe0000 <_stack_top+0xffed4240>
 184:	0002                	c.slli64	zero
 186:	0000                	unimp
 188:	000c                	.insn	2, 0x000c
 18a:	0000                	unimp
 18c:	0174                	addi	a3,sp,140
 18e:	0000                	unimp
 190:	1698                	addi	a4,sp,864
 192:	0010                	.insn	2, 0x0010
 194:	0008                	.insn	2, 0x0008
 196:	0000                	unimp
 198:	000c                	.insn	2, 0x000c
 19a:	0000                	unimp
 19c:	0174                	addi	a3,sp,140
 19e:	0000                	unimp
 1a0:	16a0                	addi	s0,sp,872
 1a2:	0010                	.insn	2, 0x0010
 1a4:	01cc                	addi	a1,sp,196
 1a6:	0000                	unimp
 1a8:	0024                	addi	s1,sp,8
 1aa:	0000                	unimp
 1ac:	0174                	addi	a3,sp,140
 1ae:	0000                	unimp
 1b0:	186c                	addi	a1,sp,60
 1b2:	0010                	.insn	2, 0x0010
 1b4:	0258                	addi	a4,sp,260
 1b6:	0000                	unimp
 1b8:	0e44                	addi	s1,sp,788
 1ba:	04b0                	addi	a2,sp,584
 1bc:	8164                	.insn	2, 0x8164
 1be:	8801                	andi	s0,s0,0
 1c0:	8902                	jr	s2
 1c2:	93049203          	lh	tp,-1744(s1)
 1c6:	9405                	srai	s0,s0,0x21
 1c8:	9506                	add	a0,a0,ra
 1ca:	97089607          	.insn	4, 0x97089607
 1ce:	0009                	c.nop	2

000001d0 <$d.12>:
 1d0:	0010                	.insn	2, 0x0010
 1d2:	0000                	unimp
 1d4:	ffff                	.insn	2, 0xffff
 1d6:	ffff                	.insn	2, 0xffff
 1d8:	0004                	.insn	2, 0x0004
 1da:	0004                	.insn	2, 0x0004
 1dc:	7c01                	lui	s8,0xfffe0
 1de:	0c01                	addi	s8,s8,0 # fffe0000 <_stack_top+0xffed4240>
 1e0:	0002                	c.slli64	zero
 1e2:	0000                	unimp
 1e4:	0014                	.insn	2, 0x0014
 1e6:	0000                	unimp
 1e8:	01d0                	addi	a2,sp,196
 1ea:	0000                	unimp
 1ec:	1ac4                	addi	s1,sp,372
 1ee:	0010                	.insn	2, 0x0010
 1f0:	0060                	addi	s0,sp,12
 1f2:	0000                	unimp
 1f4:	0e44                	addi	s1,sp,788
 1f6:	4810                	lw	a2,16(s0)
 1f8:	0181                	addi	gp,gp,0
 1fa:	0288                	addi	a0,sp,320
 1fc:	002c                	addi	a1,sp,8
 1fe:	0000                	unimp
 200:	01d0                	addi	a2,sp,196
 202:	0000                	unimp
 204:	1b24                	addi	s1,sp,440
 206:	0010                	.insn	2, 0x0010
 208:	056c                	addi	a1,sp,652
 20a:	0000                	unimp
 20c:	0e44                	addi	s1,sp,788
 20e:	7440                	.insn	2, 0x7440
 210:	0181                	addi	gp,gp,0
 212:	0288                	addi	a0,sp,320
 214:	0389                	addi	t2,t2,2
 216:	0492                	slli	s1,s1,0x4
 218:	06940593          	addi	a1,s0,105
 21c:	0795                	addi	a5,a5,5
 21e:	0896                	slli	a7,a7,0x5
 220:	0a980997          	auipc	s3,0xa980
 224:	0b99                	addi	s7,s7,6
 226:	0c9a                	slli	s9,s9,0x6
 228:	00000d9b          	.insn	4, 0x0d9b
 22c:	000c                	.insn	2, 0x000c
 22e:	0000                	unimp
 230:	01d0                	addi	a2,sp,196
 232:	0000                	unimp
 234:	2090                	.insn	2, 0x2090
 236:	0010                	.insn	2, 0x0010
 238:	00ec                	addi	a1,sp,76
 23a:	0000                	unimp
 23c:	0018                	.insn	2, 0x0018
 23e:	0000                	unimp
 240:	01d0                	addi	a2,sp,196
 242:	0000                	unimp
 244:	217c                	.insn	2, 0x217c
 246:	0010                	.insn	2, 0x0010
 248:	00a4                	addi	s1,sp,72
 24a:	0000                	unimp
 24c:	0e44                	addi	s1,sp,788
 24e:	5010                	lw	a2,32(s0)
 250:	0181                	addi	gp,gp,0
 252:	0288                	addi	a0,sp,320
 254:	0389                	addi	t2,t2,2
 256:	0492                	slli	s1,s1,0x4
 258:	002c                	addi	a1,sp,8
 25a:	0000                	unimp
 25c:	01d0                	addi	a2,sp,196
 25e:	0000                	unimp
 260:	2220                	.insn	2, 0x2220
 262:	0010                	.insn	2, 0x0010
 264:	0490                	addi	a2,sp,576
 266:	0000                	unimp
 268:	0e44                	addi	s1,sp,788
 26a:	0180                	addi	s0,sp,192
 26c:	8174                	.insn	2, 0x8174
 26e:	8801                	andi	s0,s0,0
 270:	8902                	jr	s2
 272:	93049203          	lh	tp,-1744(s1)
 276:	9405                	srai	s0,s0,0x21
 278:	9506                	add	a0,a0,ra
 27a:	97089607          	.insn	4, 0x97089607
 27e:	9809                	andi	s0,s0,-30
 280:	990a                	add	s2,s2,sp
 282:	9b0c9a0b          	.insn	4, 0x9b0c9a0b
 286:	000d                	c.nop	3
 288:	002c                	addi	a1,sp,8
 28a:	0000                	unimp
 28c:	01d0                	addi	a2,sp,196
 28e:	0000                	unimp
 290:	26b0                	.insn	2, 0x26b0
 292:	0010                	.insn	2, 0x0010
 294:	0478                	addi	a4,sp,524
 296:	0000                	unimp
 298:	0e44                	addi	s1,sp,788
 29a:	0180                	addi	s0,sp,192
 29c:	8174                	.insn	2, 0x8174
 29e:	8801                	andi	s0,s0,0
 2a0:	8902                	jr	s2
 2a2:	93049203          	lh	tp,-1744(s1)
 2a6:	9405                	srai	s0,s0,0x21
 2a8:	9506                	add	a0,a0,ra
 2aa:	97089607          	.insn	4, 0x97089607
 2ae:	9809                	andi	s0,s0,-30
 2b0:	990a                	add	s2,s2,sp
 2b2:	9b0c9a0b          	.insn	4, 0x9b0c9a0b
 2b6:	000d                	c.nop	3
 2b8:	002c                	addi	a1,sp,8
 2ba:	0000                	unimp
 2bc:	01d0                	addi	a2,sp,196
 2be:	0000                	unimp
 2c0:	2b28                	.insn	2, 0x2b28
 2c2:	0010                	.insn	2, 0x0010
 2c4:	0420                	addi	s0,sp,520
 2c6:	0000                	unimp
 2c8:	0e44                	addi	s1,sp,788
 2ca:	7470                	.insn	2, 0x7470
 2cc:	0181                	addi	gp,gp,0
 2ce:	0288                	addi	a0,sp,320
 2d0:	0389                	addi	t2,t2,2
 2d2:	0492                	slli	s1,s1,0x4
 2d4:	06940593          	addi	a1,s0,105
 2d8:	0795                	addi	a5,a5,5
 2da:	0896                	slli	a7,a7,0x5
 2dc:	0a980997          	auipc	s3,0xa980
 2e0:	0b99                	addi	s7,s7,6
 2e2:	0c9a                	slli	s9,s9,0x6
 2e4:	00000d9b          	.insn	4, 0x0d9b

セクション .debug_line_str の逆アセンブル:

00000000 <.debug_line_str>:
   0:	6d6f682f          	.insn	4, 0x6d6f682f
   4:	2f65                	jal	7bc <$d.6+0x149>
   6:	6168                	.insn	2, 0x6168
   8:	7572                	.insn	2, 0x7572
   a:	6968                	.insn	2, 0x6968
   c:	722f6f6b          	.insn	4, 0x722f6f6b
  10:	7369                	lui	t1,0xffffa
  12:	672d7663          	bgeu	s10,s2,67e <$d.6+0xb>
  16:	756e                	.insn	2, 0x756e
  18:	742d                	lui	s0,0xfffeb
  1a:	636c6f6f          	jal	t5,c6650 <$d.7+0xc4808>
  1e:	6168                	.insn	2, 0x6168
  20:	6e69                	lui	t3,0x1a
  22:	6975622f          	.insn	4, 0x6975622f
  26:	646c                	.insn	2, 0x646c
  28:	672d                	lui	a4,0xb
  2a:	6e2d6363          	bltu	s10,sp,710 <$d.6+0x9d>
  2e:	7765                	lui	a4,0xffff9
  30:	696c                	.insn	2, 0x696c
  32:	2d62                	.insn	2, 0x2d62
  34:	67617473          	.insn	4, 0x67617473
  38:	3265                	jal	fffff9e0 <_stack_top+0xffef3c20>
  3a:	7369722f          	.insn	4, 0x7369722f
  3e:	32337663          	bgeu	t1,gp,36a <$d.6+0xe8>
  42:	752d                	lui	a0,0xfffeb
  44:	6b6e                	.insn	2, 0x6b6e
  46:	6f6e                	.insn	2, 0x6f6e
  48:	652d6e77          	.insn	4, 0x652d6e77
  4c:	666c                	.insn	2, 0x666c
  4e:	62696c2f          	.insn	4, 0x62696c2f
  52:	00636367          	.insn	4, 0x00636367
  56:	756d                	lui	a0,0xffffb
  58:	646c                	.insn	2, 0x646c
  5a:	3369                	jal	fffffde4 <_stack_top+0xffef4024>
  5c:	532e                	lw	t1,232(sp)
  5e:	2e00                	.insn	2, 0x2e00
  60:	2f2e                	.insn	2, 0x2f2e
  62:	2e2e                	.insn	2, 0x2e2e
  64:	2f2e2e2f          	.insn	4, 0x2f2e2e2f
  68:	2f2e                	.insn	2, 0x2f2e
  6a:	2f636367          	.insn	4, 0x2f636367
  6e:	696c                	.insn	2, 0x696c
  70:	6762                	.insn	2, 0x6762
  72:	632f6363          	bltu	t5,s2,698 <$d.6+0x25>
  76:	69666e6f          	jal	t3,6670c <$d.7+0x648c4>
  7a:	69722f67          	.insn	4, 0x69722f67
  7e:	00766373          	.insn	4, 0x00766373
  82:	6964                	.insn	2, 0x6964
  84:	2e76                	.insn	2, 0x2e76
  86:	0053                	.short	0x0053
