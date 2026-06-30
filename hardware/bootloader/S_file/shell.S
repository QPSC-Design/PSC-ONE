
./build/shell.elf:     ファイル形式 elf32-littleriscv


セクション .text の逆アセンブル:

00400000 <start>:

/* ===== エントリ ===== */
__attribute__((section(".text.start")))
__attribute__((naked))
void start(void) {
    __asm__ __volatile__(
  400000:	00423537          	lui	a0,0x423
  400004:	f8050513          	addi	a0,a0,-128 # 422f80 <__user_stack_top>
  400008:	00050113          	mv	sp,a0
  40000c:	00000097          	auipc	ra,0x0
  400010:	010080e7          	jalr	16(ra) # 40001c <main>
  400014:	00001097          	auipc	ra,0x1
  400018:	a7c080e7          	jalr	-1412(ra) # 400a90 <exit>

0040001c <main>:
// shell.c
#include "user.h"
#include "fat32.h"

void main(void) {
  40001c:	f0010113          	addi	sp,sp,-256
  400020:	0e112e23          	sw	ra,252(sp)
  400024:	0e812c23          	sw	s0,248(sp)
  400028:	0e912a23          	sw	s1,244(sp)
  40002c:	0f212823          	sw	s2,240(sp)
  400030:	0f312623          	sw	s3,236(sp)
  400034:	0f412423          	sw	s4,232(sp)
  400038:	0f512223          	sw	s5,228(sp)
  40003c:	0f612023          	sw	s6,224(sp)
  400040:	0d712e23          	sw	s7,220(sp)
  400044:	0d812c23          	sw	s8,216(sp)
  400048:	0d912a23          	sw	s9,212(sp)
  40004c:	0da12823          	sw	s10,208(sp)
  400050:	0db12623          	sw	s11,204(sp)

    // DUMP API call
    //call_dump_api();


    printf("shell start.\n");
  400054:	00402537          	lui	a0,0x402
  400058:	ca350513          	addi	a0,a0,-861 # 401ca3 <$d.1>
  40005c:	00001097          	auipc	ra,0x1
  400060:	e1c080e7          	jalr	-484(ra) # 400e78 <printf>
  400064:	00000c93          	li	s9,0
  400068:	00402537          	lui	a0,0x402
  40006c:	c1d50413          	addi	s0,a0,-995 # 401c1d <__modsi3+0x145>
  400070:	00402537          	lui	a0,0x402
  400074:	c1750513          	addi	a0,a0,-1001 # 401c17 <__modsi3+0x13f>
  400078:	08a12423          	sw	a0,136(sp)
  40007c:	00402537          	lui	a0,0x402
  400080:	bb450513          	addi	a0,a0,-1100 # 401bb4 <__modsi3+0xdc>
  400084:	06a12c23          	sw	a0,120(sp)
  400088:	00402537          	lui	a0,0x402
  40008c:	cb150513          	addi	a0,a0,-847 # 401cb1 <$d.1+0xe>
  400090:	08a12023          	sw	a0,128(sp)
  400094:	00402537          	lui	a0,0x402
  400098:	bcd50513          	addi	a0,a0,-1075 # 401bcd <__modsi3+0xf5>
  40009c:	06a12e23          	sw	a0,124(sp)
  4000a0:	00402537          	lui	a0,0x402
  4000a4:	d0a50513          	addi	a0,a0,-758 # 401d0a <$d.2+0x2a>
  4000a8:	06a12423          	sw	a0,104(sp)
  4000ac:	00018537          	lui	a0,0x18
  4000b0:	6a050513          	addi	a0,a0,1696 # 186a0 <$d.5+0x1724f>
  4000b4:	06a12223          	sw	a0,100(sp)
  4000b8:	00402537          	lui	a0,0x402
  4000bc:	baa50513          	addi	a0,a0,-1110 # 401baa <__modsi3+0xd2>
  4000c0:	06a12a23          	sw	a0,116(sp)
  4000c4:	00402537          	lui	a0,0x402
  4000c8:	c0350513          	addi	a0,a0,-1021 # 401c03 <__modsi3+0x12b>
  4000cc:	06a12823          	sw	a0,112(sp)
  4000d0:	00402537          	lui	a0,0x402
  4000d4:	c2a50513          	addi	a0,a0,-982 # 401c2a <__modsi3+0x152>
  4000d8:	04a12c23          	sw	a0,88(sp)
  4000dc:	00402537          	lui	a0,0x402
  4000e0:	c8750513          	addi	a0,a0,-889 # 401c87 <__modsi3+0x1af>
  4000e4:	06a12623          	sw	a0,108(sp)
  4000e8:	00402537          	lui	a0,0x402
  4000ec:	c6950513          	addi	a0,a0,-919 # 401c69 <__modsi3+0x191>
  4000f0:	04a12a23          	sw	a0,84(sp)
  4000f4:	00402537          	lui	a0,0x402
  4000f8:	b9950513          	addi	a0,a0,-1127 # 401b99 <__modsi3+0xc1>
  4000fc:	06a12023          	sw	a0,96(sp)
  400100:	00402537          	lui	a0,0x402
  400104:	cf150513          	addi	a0,a0,-783 # 401cf1 <$d.2+0x11>
  400108:	04a12623          	sw	a0,76(sp)
  40010c:	00402537          	lui	a0,0x402
  400110:	ba150513          	addi	a0,a0,-1119 # 401ba1 <__modsi3+0xc9>
  400114:	04a12e23          	sw	a0,92(sp)
  400118:	00402537          	lui	a0,0x402
  40011c:	d3950513          	addi	a0,a0,-711 # 401d39 <$d.1+0x10>
  400120:	04a12223          	sw	a0,68(sp)
  400124:	00402537          	lui	a0,0x402
  400128:	b7150513          	addi	a0,a0,-1167 # 401b71 <__modsi3+0x99>
  40012c:	02a12e23          	sw	a0,60(sp)
  400130:	00402537          	lui	a0,0x402
  400134:	c0c50513          	addi	a0,a0,-1012 # 401c0c <__modsi3+0x134>
  400138:	04a12823          	sw	a0,80(sp)
  40013c:	00402537          	lui	a0,0x402
  400140:	c4650513          	addi	a0,a0,-954 # 401c46 <__modsi3+0x16e>
  400144:	02a12c23          	sw	a0,56(sp)
  400148:	00402537          	lui	a0,0x402
  40014c:	d5350513          	addi	a0,a0,-685 # 401d53 <$d.1+0x2a>
  400150:	00a12e23          	sw	a0,28(sp)
  400154:	00402537          	lui	a0,0x402
  400158:	c9050513          	addi	a0,a0,-880 # 401c90 <__modsi3+0x1b8>
  40015c:	00a12c23          	sw	a0,24(sp)
  400160:	00402537          	lui	a0,0x402
  400164:	cb650513          	addi	a0,a0,-842 # 401cb6 <$d.1+0x13>
  400168:	00a12a23          	sw	a0,20(sp)
  40016c:	00402537          	lui	a0,0x402
  400170:	cd250513          	addi	a0,a0,-814 # 401cd2 <$d.1+0x2f>
  400174:	00a12823          	sw	a0,16(sp)
  400178:	00402537          	lui	a0,0x402
  40017c:	c5a50513          	addi	a0,a0,-934 # 401c5a <__modsi3+0x182>
  400180:	00a12623          	sw	a0,12(sp)
  400184:	00402537          	lui	a0,0x402
  400188:	b5e50513          	addi	a0,a0,-1186 # 401b5e <__modsi3+0x86>
  40018c:	04a12423          	sw	a0,72(sp)
  400190:	00402537          	lui	a0,0x402
  400194:	b6750513          	addi	a0,a0,-1177 # 401b67 <__modsi3+0x8f>
  400198:	04a12023          	sw	a0,64(sp)
  40019c:	00402537          	lui	a0,0x402
  4001a0:	b3850513          	addi	a0,a0,-1224 # 401b38 <__modsi3+0x60>
  4001a4:	02a12023          	sw	a0,32(sp)
  4001a8:	00402537          	lui	a0,0x402
  4001ac:	c8250513          	addi	a0,a0,-894 # 401c82 <__modsi3+0x1aa>
  4001b0:	02a12a23          	sw	a0,52(sp)
  4001b4:	00402537          	lui	a0,0x402
  4001b8:	c3b50513          	addi	a0,a0,-965 # 401c3b <__modsi3+0x163>
  4001bc:	00a12423          	sw	a0,8(sp)
  4001c0:	00402537          	lui	a0,0x402
  4001c4:	d6050513          	addi	a0,a0,-672 # 401d60 <$d.1+0x37>
  4001c8:	02a12823          	sw	a0,48(sp)
  4001cc:	00402537          	lui	a0,0x402
  4001d0:	d2450513          	addi	a0,a0,-732 # 401d24 <$d.2+0x44>
  4001d4:	02a12623          	sw	a0,44(sp)
  4001d8:	00402537          	lui	a0,0x402
  4001dc:	ca150513          	addi	a0,a0,-863 # 401ca1 <__modsi3+0x1c9>
  4001e0:	02a12423          	sw	a0,40(sp)
  4001e4:	00402537          	lui	a0,0x402
  4001e8:	bd450513          	addi	a0,a0,-1068 # 401bd4 <__modsi3+0xfc>
  4001ec:	02a12223          	sw	a0,36(sp)
  4001f0:	00402537          	lui	a0,0x402
  4001f4:	b5150513          	addi	a0,a0,-1199 # 401b51 <__modsi3+0x79>
  4001f8:	08a12223          	sw	a0,132(sp)
  4001fc:	02000c13          	li	s8,32
  400200:	00900b93          	li	s7,9
  400204:	00a00a93          	li	s5,10
  400208:	00600913          	li	s2,6
  40020c:	00c00a13          	li	s4,12
  400210:	00800993          	li	s3,8
  400214:	07f00493          	li	s1,127
  400218:	0100006f          	j	400228 <main+0x20c>
  40021c:	07812503          	lw	a0,120(sp)

        if (argc == 0) continue;

        /* ===== コマンド分岐 ===== */
        if (strcmp(argv[0], "hello") == 0) {
            printf("Hello world from shell!\n");
  400220:	00001097          	auipc	ra,0x1
  400224:	c58080e7          	jalr	-936(ra) # 400e78 <printf>
        putchar(0x1B); putchar('['); putchar('3'); putchar('4'); putchar('m'); // 青
  400228:	01b00513          	li	a0,27
  40022c:	00001097          	auipc	ra,0x1
  400230:	b80080e7          	jalr	-1152(ra) # 400dac <putchar>
  400234:	05b00513          	li	a0,91
  400238:	00001097          	auipc	ra,0x1
  40023c:	b74080e7          	jalr	-1164(ra) # 400dac <putchar>
  400240:	03300513          	li	a0,51
  400244:	00001097          	auipc	ra,0x1
  400248:	b68080e7          	jalr	-1176(ra) # 400dac <putchar>
  40024c:	03400513          	li	a0,52
  400250:	00001097          	auipc	ra,0x1
  400254:	b5c080e7          	jalr	-1188(ra) # 400dac <putchar>
  400258:	06d00513          	li	a0,109
  40025c:	00001097          	auipc	ra,0x1
  400260:	b50080e7          	jalr	-1200(ra) # 400dac <putchar>
        putchar('P');
  400264:	05000513          	li	a0,80
  400268:	00001097          	auipc	ra,0x1
  40026c:	b44080e7          	jalr	-1212(ra) # 400dac <putchar>
        putchar('S');
  400270:	05300513          	li	a0,83
  400274:	00001097          	auipc	ra,0x1
  400278:	b38080e7          	jalr	-1224(ra) # 400dac <putchar>
        putchar('C');
  40027c:	04300513          	li	a0,67
  400280:	00001097          	auipc	ra,0x1
  400284:	b2c080e7          	jalr	-1236(ra) # 400dac <putchar>
        putchar('_');
  400288:	05f00513          	li	a0,95
  40028c:	00001097          	auipc	ra,0x1
  400290:	b20080e7          	jalr	-1248(ra) # 400dac <putchar>
        putchar('O');
  400294:	04f00513          	li	a0,79
  400298:	00001097          	auipc	ra,0x1
  40029c:	b14080e7          	jalr	-1260(ra) # 400dac <putchar>
        putchar('S');
  4002a0:	05300513          	li	a0,83
  4002a4:	00001097          	auipc	ra,0x1
  4002a8:	b08080e7          	jalr	-1272(ra) # 400dac <putchar>
        putchar('>');
  4002ac:	03e00513          	li	a0,62
  4002b0:	00001097          	auipc	ra,0x1
  4002b4:	afc080e7          	jalr	-1284(ra) # 400dac <putchar>
        putchar(' ');
  4002b8:	02000513          	li	a0,32
  4002bc:	00001097          	auipc	ra,0x1
  4002c0:	af0080e7          	jalr	-1296(ra) # 400dac <putchar>
        putchar(0x1B); putchar('['); putchar('0'); putchar('m'); // リセット
  4002c4:	01b00513          	li	a0,27
  4002c8:	00001097          	auipc	ra,0x1
  4002cc:	ae4080e7          	jalr	-1308(ra) # 400dac <putchar>
  4002d0:	05b00513          	li	a0,91
  4002d4:	00001097          	auipc	ra,0x1
  4002d8:	ad8080e7          	jalr	-1320(ra) # 400dac <putchar>
  4002dc:	03000513          	li	a0,48
  4002e0:	00001097          	auipc	ra,0x1
  4002e4:	acc080e7          	jalr	-1332(ra) # 400dac <putchar>
  4002e8:	06d00513          	li	a0,109
  4002ec:	00001097          	auipc	ra,0x1
  4002f0:	ac0080e7          	jalr	-1344(ra) # 400dac <putchar>
            uint32_t sw = poll_switch_api() & 0x03;
  4002f4:	00001097          	auipc	ra,0x1
  4002f8:	f88080e7          	jalr	-120(ra) # 40127c <poll_switch_api>
            bool sw1_pressed = ((prev_sw & 0x01) != 0) && ((sw & 0x01) == 0);
  4002fc:	001cf593          	andi	a1,s9,1
            if (sw1_pressed) {
  400300:	00058a63          	beqz	a1,400314 <main+0x2f8>
  400304:	00157593          	andi	a1,a0,1
  400308:	00059663          	bnez	a1,400314 <main+0x2f8>
  40030c:	00000b13          	li	s6,0
  400310:	0c00006f          	j	4003d0 <main+0x3b4>
  400314:	00000b13          	li	s6,0
            bool sw2_pressed = ((prev_sw & 0x02) != 0) && ((sw & 0x02) == 0);
  400318:	002cf593          	andi	a1,s9,2
  40031c:	00050d13          	mv	s10,a0
            if (sw2_pressed) {
  400320:	00058663          	beqz	a1,40032c <main+0x310>
  400324:	002d7513          	andi	a0,s10,2
  400328:	0a050e63          	beqz	a0,4003e4 <main+0x3c8>
  40032c:	003d7c93          	andi	s9,s10,3
            int ch = getchar_timeout();
  400330:	00001097          	auipc	ra,0x1
  400334:	f2c080e7          	jalr	-212(ra) # 40125c <getchar_timeout>
            if (ch < 0) {
  400338:	08054063          	bltz	a0,4003b8 <main+0x39c>
            if (ch == '\n' && len == 0) {
  40033c:	01551463          	bne	a0,s5,400344 <main+0x328>
  400340:	060b0c63          	beqz	s6,4003b8 <main+0x39c>
            if (ch == 8 || ch == 127) {
  400344:	00aa4863          	blt	s4,a0,400354 <main+0x338>
  400348:	01350863          	beq	a0,s3,400358 <main+0x33c>
  40034c:	03551e63          	bne	a0,s5,400388 <main+0x36c>
  400350:	2b80006f          	j	400608 <main+0x5ec>
  400354:	02951663          	bne	a0,s1,400380 <main+0x364>
                if (len > 0) {
  400358:	07605063          	blez	s6,4003b8 <main+0x39c>
                    len--;
  40035c:	fffb0b13          	addi	s6,s6,-1
                    putchar('\b');
  400360:	00800513          	li	a0,8
  400364:	00001097          	auipc	ra,0x1
  400368:	a48080e7          	jalr	-1464(ra) # 400dac <putchar>
                    putchar(' ');
  40036c:	02000513          	li	a0,32
  400370:	00001097          	auipc	ra,0x1
  400374:	a3c080e7          	jalr	-1476(ra) # 400dac <putchar>
  400378:	00800513          	li	a0,8
  40037c:	0300006f          	j	4003ac <main+0x390>
            if (ch == 8 || ch == 127) {
  400380:	00d00593          	li	a1,13
  400384:	28b50263          	beq	a0,a1,400608 <main+0x5ec>
            if (ch < 0x20 && ch != '\t')
  400388:	01f00593          	li	a1,31
  40038c:	00a5e463          	bltu	a1,a0,400394 <main+0x378>
  400390:	03751463          	bne	a0,s7,4003b8 <main+0x39c>
            if (len >= (int)sizeof(cmdline) - 1) {
  400394:	01e00593          	li	a1,30
  400398:	e965c8e3          	blt	a1,s6,400228 <main+0x20c>
            cmdline[len++] = (char)ch;
  40039c:	0ac10593          	addi	a1,sp,172
  4003a0:	016585b3          	add	a1,a1,s6
  4003a4:	001b0b13          	addi	s6,s6,1
  4003a8:	00a58023          	sb	a0,0(a1)
  4003ac:	0ff57513          	zext.b	a0,a0
  4003b0:	00001097          	auipc	ra,0x1
  4003b4:	9fc080e7          	jalr	-1540(ra) # 400dac <putchar>
            uint32_t sw = poll_switch_api() & 0x03;
  4003b8:	00001097          	auipc	ra,0x1
  4003bc:	ec4080e7          	jalr	-316(ra) # 40127c <poll_switch_api>
            bool sw1_pressed = ((prev_sw & 0x01) != 0) && ((sw & 0x01) == 0);
  4003c0:	001d7593          	andi	a1,s10,1
            if (sw1_pressed) {
  4003c4:	f4058ae3          	beqz	a1,400318 <main+0x2fc>
  4003c8:	00157593          	andi	a1,a0,1
  4003cc:	f40596e3          	bnez	a1,400318 <main+0x2fc>
                printf("SW1 pressed\n");
  4003d0:	00040513          	mv	a0,s0
  4003d4:	00001097          	auipc	ra,0x1
  4003d8:	aa4080e7          	jalr	-1372(ra) # 400e78 <printf>
  4003dc:	000b1c63          	bnez	s6,4003f4 <main+0x3d8>
  4003e0:	e49ff06f          	j	400228 <main+0x20c>
  4003e4:	08412503          	lw	a0,132(sp)
                printf("SW2 pressed\n");
  4003e8:	00001097          	auipc	ra,0x1
  4003ec:	a90080e7          	jalr	-1392(ra) # 400e78 <printf>
  4003f0:	e20b0ce3          	beqz	s6,400228 <main+0x20c>
  4003f4:	0ac10513          	addi	a0,sp,172
  4003f8:	0080006f          	j	400400 <main+0x3e4>
        while (*p == ' ' || *p == '\t') p++;
  4003fc:	00150513          	addi	a0,a0,1
  400400:	00054583          	lbu	a1,0(a0)
  400404:	ff758ce3          	beq	a1,s7,4003fc <main+0x3e0>
  400408:	ff858ae3          	beq	a1,s8,4003fc <main+0x3e0>
  40040c:	e0058ee3          	beqz	a1,400228 <main+0x20c>
  400410:	00000b13          	li	s6,0
  400414:	08c10693          	addi	a3,sp,140
  400418:	000b0d93          	mv	s11,s6
  40041c:	00050593          	mv	a1,a0
            argv[argc++] = p;
  400420:	001b0b13          	addi	s6,s6,1
  400424:	002d9513          	slli	a0,s11,0x2
  400428:	00a68533          	add	a0,a3,a0
  40042c:	00b52023          	sw	a1,0(a0)
            while (*p && *p != ' ' && *p != '\t') p++;
  400430:	00158513          	addi	a0,a1,1
  400434:	0005c603          	lbu	a2,0(a1)
  400438:	04060063          	beqz	a2,400478 <main+0x45c>
  40043c:	01760e63          	beq	a2,s7,400458 <main+0x43c>
  400440:	01860c63          	beq	a2,s8,400458 <main+0x43c>
  400444:	00158593          	addi	a1,a1,1
  400448:	00150513          	addi	a0,a0,1
  40044c:	0005c603          	lbu	a2,0(a1)
  400450:	fe0616e3          	bnez	a2,40043c <main+0x420>
  400454:	0240006f          	j	400478 <main+0x45c>
            *p++ = '\0';
  400458:	00058023          	sb	zero,0(a1)
  40045c:	0080006f          	j	400464 <main+0x448>
  400460:	00150513          	addi	a0,a0,1
            while (*p == ' ' || *p == '\t') p++;
  400464:	00054583          	lbu	a1,0(a0)
  400468:	ff858ce3          	beq	a1,s8,400460 <main+0x444>
  40046c:	ff758ae3          	beq	a1,s7,400460 <main+0x444>
        while (*p && argc < ARGV_MAX) {
  400470:	00058463          	beqz	a1,400478 <main+0x45c>
  400474:	fbb972e3          	bgeu	s2,s11,400418 <main+0x3fc>
        if (strcmp(argv[0], "hello") == 0) {
  400478:	08c12d03          	lw	s10,140(sp)
  40047c:	000d0513          	mv	a0,s10
  400480:	08812583          	lw	a1,136(sp)
  400484:	00001097          	auipc	ra,0x1
  400488:	9b4080e7          	jalr	-1612(ra) # 400e38 <strcmp>
  40048c:	d80508e3          	beqz	a0,40021c <main+0x200>

        // ---- Dump ----
        } else if (strcmp(argv[0], "dump") == 0) {
  400490:	000d0513          	mv	a0,s10
  400494:	08012583          	lw	a1,128(sp)
  400498:	00001097          	auipc	ra,0x1
  40049c:	9a0080e7          	jalr	-1632(ra) # 400e38 <strcmp>
  4004a0:	10050e63          	beqz	a0,4005bc <main+0x5a0>
            unsigned lenb = (argc >= 3) ? parse_u32(argv[2]) : 0x100;
            hexdump((const void*)addr, lenb, (uintptr_t)addr);
        */

        // ---- 素数出力サンプル ----
        } else if (strcmp(argv[0], "primes") == 0) {
  4004a4:	000d0513          	mv	a0,s10
  4004a8:	07c12583          	lw	a1,124(sp)
  4004ac:	00001097          	auipc	ra,0x1
  4004b0:	98c080e7          	jalr	-1652(ra) # 400e38 <strcmp>
  4004b4:	16050a63          	beqz	a0,400628 <main+0x60c>
                }
            }
            cmd_primes(max);

        // ---- セルフテスト ----
        } else if (strcmp(argv[0], "self_test") == 0) {
  4004b8:	000d0513          	mv	a0,s10
  4004bc:	07412583          	lw	a1,116(sp)
  4004c0:	00001097          	auipc	ra,0x1
  4004c4:	978080e7          	jalr	-1672(ra) # 400e38 <strcmp>
  4004c8:	d60500e3          	beqz	a0,400228 <main+0x20c>
            //TBD
            //cmd_primes(max);

        // ---- SynapEngine ----
        } else if (strcmp(argv[0], "sa_start") == 0) {
  4004cc:	000d0513          	mv	a0,s10
  4004d0:	07012583          	lw	a1,112(sp)
  4004d4:	00001097          	auipc	ra,0x1
  4004d8:	964080e7          	jalr	-1692(ra) # 400e38 <strcmp>
  4004dc:	18050863          	beqz	a0,40066c <main+0x650>
            }
            // SA API call 
            call_sa_api(matrix_max);

        // ---- I2S MIC READ ----
        } else if (strcmp(argv[0], "mic_read") == 0) {
  4004e0:	000d0513          	mv	a0,s10
  4004e4:	06c12583          	lw	a1,108(sp)
  4004e8:	00001097          	auipc	ra,0x1
  4004ec:	950080e7          	jalr	-1712(ra) # 400e38 <strcmp>
  4004f0:	1a050a63          	beqz	a0,4006a4 <main+0x688>

            unsigned count = parse_u32(argv[1]);
            call_mic_api(count);

        // ---- SDカードREAD ----
        } else if (strcmp(argv[0], "sd_read") == 0) {
  4004f4:	000d0513          	mv	a0,s10
  4004f8:	06012583          	lw	a1,96(sp)
  4004fc:	00001097          	auipc	ra,0x1
  400500:	93c080e7          	jalr	-1732(ra) # 400e38 <strcmp>
  400504:	26050a63          	beqz	a0,400778 <main+0x75c>

            unsigned sd_sector = parse_u32(argv[1]);
            call_sd_read_api(sd_sector);

        // ---- SDカードWRITE ----
        } else if (strcmp(argv[0], "sd_write") == 0) {
  400508:	000d0513          	mv	a0,s10
  40050c:	05c12583          	lw	a1,92(sp)
  400510:	00001097          	auipc	ra,0x1
  400514:	928080e7          	jalr	-1752(ra) # 400e38 <strcmp>
  400518:	28050a63          	beqz	a0,4007ac <main+0x790>
                goto prompt;
            }
            call_sd_write_api(sd_sector);

        // ---- FAT32 Info ----
        } else if (strcmp(argv[0], "fat32_info") == 0) {
  40051c:	000d0513          	mv	a0,s10
  400520:	05012583          	lw	a1,80(sp)
  400524:	00001097          	auipc	ra,0x1
  400528:	914080e7          	jalr	-1772(ra) # 400e38 <strcmp>
  40052c:	32050263          	beqz	a0,400850 <main+0x834>
            printf("spc=%x\n",           g_fat32.sectors_per_cluster);
            printf("fat_begin=%x\n",     g_fat32.fat_begin);
            printf("data_begin=%x\n",    g_fat32.data_begin);

        // ---- FAT32 ls ----
        } else if (strcmp(argv[0], "fat32_ls") == 0) {
  400530:	000d0513          	mv	a0,s10
  400534:	04812583          	lw	a1,72(sp)
  400538:	00001097          	auipc	ra,0x1
  40053c:	900080e7          	jalr	-1792(ra) # 400e38 <strcmp>
  400540:	32050863          	beqz	a0,400870 <main+0x854>

            fat32_ls();

        // ---- FAT32 cat ----
        } else if (strcmp(argv[0], "fat32_cat") == 0) {
  400544:	000d0513          	mv	a0,s10
  400548:	04012583          	lw	a1,64(sp)
  40054c:	00001097          	auipc	ra,0x1
  400550:	8ec080e7          	jalr	-1812(ra) # 400e38 <strcmp>
  400554:	32050463          	beqz	a0,40087c <main+0x860>
            }

            fat32_cat(argv[1]);

        // ---- Helps出力 ----
        } else if (strcmp(argv[0], "help") == 0) {
  400558:	000d0513          	mv	a0,s10
  40055c:	03412583          	lw	a1,52(sp)
  400560:	00001097          	auipc	ra,0x1
  400564:	8d8080e7          	jalr	-1832(ra) # 400e38 <strcmp>
  400568:	38050463          	beqz	a0,4008f0 <main+0x8d4>
            printf("  sa_start\n");
            printf("  sd_read\n");
            printf("  exit | quit | q\n");
            */

        } else if (strcmp(argv[0], "exit") == 0 ||
  40056c:	000d0513          	mv	a0,s10
  400570:	03012583          	lw	a1,48(sp)
  400574:	00001097          	auipc	ra,0x1
  400578:	8c4080e7          	jalr	-1852(ra) # 400e38 <strcmp>
  40057c:	38050263          	beqz	a0,400900 <main+0x8e4>
                   strcmp(argv[0], "quit") == 0 ||
  400580:	000d0513          	mv	a0,s10
  400584:	02c12583          	lw	a1,44(sp)
  400588:	00001097          	auipc	ra,0x1
  40058c:	8b0080e7          	jalr	-1872(ra) # 400e38 <strcmp>
  400590:	36050863          	beqz	a0,400900 <main+0x8e4>
                   strcmp(argv[0], "q") == 0) {
  400594:	000d0513          	mv	a0,s10
  400598:	02812583          	lw	a1,40(sp)
  40059c:	00001097          	auipc	ra,0x1
  4005a0:	89c080e7          	jalr	-1892(ra) # 400e38 <strcmp>
        } else if (strcmp(argv[0], "exit") == 0 ||
  4005a4:	34050e63          	beqz	a0,400900 <main+0x8e4>
  4005a8:	02412503          	lw	a0,36(sp)
            exit();
        
        } else {
            printf("unknown command: %s\n", argv[0]);
  4005ac:	000d0593          	mv	a1,s10
  4005b0:	00001097          	auipc	ra,0x1
  4005b4:	8c8080e7          	jalr	-1848(ra) # 400e78 <printf>
  4005b8:	c71ff06f          	j	400228 <main+0x20c>
  4005bc:	10000593          	li	a1,256
            if (argc >= 2) {
  4005c0:	080d8663          	beqz	s11,40064c <main+0x630>
                if (parse_hex(argv[1], &val) == 0) {
  4005c4:	09012683          	lw	a3,144(sp)
/* 簡易16進パーサ（"  0x1234" / "1234" 形式どちらも可） */
int parse_hex(const char *s, uintptr_t *out) {
    uintptr_t v = 0;

    /* skip leading spaces */
    while (*s == ' ' || *s == '\t') s++;
  4005c8:	00268693          	addi	a3,a3,2
  4005cc:	00500813          	li	a6,5
  4005d0:	0080006f          	j	4005d8 <main+0x5bc>
  4005d4:	00168693          	addi	a3,a3,1
  4005d8:	ffe6c603          	lbu	a2,-2(a3)
  4005dc:	ff760ce3          	beq	a2,s7,4005d4 <main+0x5b8>
  4005e0:	ff860ae3          	beq	a2,s8,4005d4 <main+0x5b8>
  4005e4:	03000513          	li	a0,48
  4005e8:	06a61a63          	bne	a2,a0,40065c <main+0x640>

    /* optional 0x / 0X */
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  4005ec:	fff6c503          	lbu	a0,-1(a3)
  4005f0:	02056513          	ori	a0,a0,32
  4005f4:	07800613          	li	a2,120
  4005f8:	0cc51663          	bne	a0,a2,4006c4 <main+0x6a8>
    if (!*s) return -1;
  4005fc:	0006c603          	lbu	a2,0(a3)
  400600:	0c061663          	bnez	a2,4006cc <main+0x6b0>
  400604:	0600006f          	j	400664 <main+0x648>
                putchar('\n');
  400608:	00a00513          	li	a0,10
  40060c:	00000097          	auipc	ra,0x0
  400610:	7a0080e7          	jalr	1952(ra) # 400dac <putchar>
                cmdline[len] = '\0';
  400614:	0ac10513          	addi	a0,sp,172
  400618:	01650533          	add	a0,a0,s6
  40061c:	00050023          	sb	zero,0(a0)
  400620:	dc0b1ae3          	bnez	s6,4003f4 <main+0x3d8>
  400624:	c05ff06f          	j	400228 <main+0x20c>
            if (argc >= 2) {
  400628:	060d8463          	beqz	s11,400690 <main+0x674>
                max = parse_u32(argv[1]);
  40062c:	09012503          	lw	a0,144(sp)
  400630:	00001097          	auipc	ra,0x1
  400634:	b04080e7          	jalr	-1276(ra) # 401134 <parse_u32>
  400638:	00050593          	mv	a1,a0
  40063c:	06812503          	lw	a0,104(sp)
  400640:	06412603          	lw	a2,100(sp)
                if (max > 100000) {
  400644:	04b67863          	bgeu	a2,a1,400694 <main+0x678>
  400648:	21c0006f          	j	400864 <main+0x848>
  40064c:	00200537          	lui	a0,0x200
            call_dump_api(addr, len);
  400650:	00000097          	auipc	ra,0x0
  400654:	7a8080e7          	jalr	1960(ra) # 400df8 <call_dump_api>
  400658:	bd1ff06f          	j	400228 <main+0x20c>
  40065c:	ffe68693          	addi	a3,a3,-2
    if (!*s) return -1;
  400660:	06061663          	bnez	a2,4006cc <main+0x6b0>
  400664:	00200537          	lui	a0,0x200
  400668:	0bc0006f          	j	400724 <main+0x708>
            if (argc >= 2) {
  40066c:	120d8663          	beqz	s11,400798 <main+0x77c>
                matrix_max = parse_u32(argv[1]);
  400670:	09012503          	lw	a0,144(sp)
  400674:	00001097          	auipc	ra,0x1
  400678:	ac0080e7          	jalr	-1344(ra) # 401134 <parse_u32>
  40067c:	00050593          	mv	a1,a0
  400680:	05812503          	lw	a0,88(sp)
                if (matrix_max > 4) {
  400684:	00400613          	li	a2,4
  400688:	10b67a63          	bgeu	a2,a1,40079c <main+0x780>
  40068c:	1d80006f          	j	400864 <main+0x848>
  400690:	3e800593          	li	a1,1000
            cmd_primes(max);
  400694:	00058513          	mv	a0,a1
  400698:	00000097          	auipc	ra,0x0
  40069c:	33c080e7          	jalr	828(ra) # 4009d4 <cmd_primes>
  4006a0:	b89ff06f          	j	400228 <main+0x20c>
  4006a4:	05412503          	lw	a0,84(sp)
            if (argc < 2) {
  4006a8:	1a0d8e63          	beqz	s11,400864 <main+0x848>
            unsigned count = parse_u32(argv[1]);
  4006ac:	09012503          	lw	a0,144(sp)
  4006b0:	00001097          	auipc	ra,0x1
  4006b4:	a84080e7          	jalr	-1404(ra) # 401134 <parse_u32>
            call_mic_api(count);
  4006b8:	00000097          	auipc	ra,0x0
  4006bc:	71c080e7          	jalr	1820(ra) # 400dd4 <call_mic_api>
  4006c0:	b69ff06f          	j	400228 <main+0x20c>
  4006c4:	ffe68693          	addi	a3,a3,-2
  4006c8:	03000613          	li	a2,48
  4006cc:	00000513          	li	a0,0

    while (*s) {
        char c = *s++;
        uint32_t d;
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  4006d0:	00168693          	addi	a3,a3,1
  4006d4:	0200006f          	j	4006f4 <main+0x6d8>
  4006d8:	0ff67793          	zext.b	a5,a2
    while (*s) {
  4006dc:	0006c603          	lbu	a2,0(a3)
  4006e0:	00f70733          	add	a4,a4,a5
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
        else break;
        v = (v << 4) | d;
  4006e4:	00451513          	slli	a0,a0,0x4
  4006e8:	00a76533          	or	a0,a4,a0
    while (*s) {
  4006ec:	00168693          	addi	a3,a3,1
  4006f0:	02060a63          	beqz	a2,400724 <main+0x708>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  4006f4:	fd060713          	addi	a4,a2,-48
  4006f8:	0ff77793          	zext.b	a5,a4
  4006fc:	fd000713          	li	a4,-48
  400700:	fd57ece3          	bltu	a5,s5,4006d8 <main+0x6bc>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  400704:	f9f60713          	addi	a4,a2,-97
  400708:	0ff77793          	zext.b	a5,a4
  40070c:	fa900713          	li	a4,-87
  400710:	fd27e4e3          	bltu	a5,s2,4006d8 <main+0x6bc>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  400714:	fbf60713          	addi	a4,a2,-65
  400718:	0ff77793          	zext.b	a5,a4
  40071c:	fc900713          	li	a4,-55
  400720:	faf87ce3          	bgeu	a6,a5,4006d8 <main+0x6bc>
            if (argc >= 3) {
  400724:	00200613          	li	a2,2
  400728:	10cb0e63          	beq	s6,a2,400844 <main+0x828>
                if (parse_hex(argv[2], &val) == 0) {
  40072c:	09412683          	lw	a3,148(sp)
    while (*s == ' ' || *s == '\t') s++;
  400730:	00268693          	addi	a3,a3,2
  400734:	0080006f          	j	40073c <main+0x720>
  400738:	00168693          	addi	a3,a3,1
  40073c:	ffe6c603          	lbu	a2,-2(a3)
  400740:	ff760ce3          	beq	a2,s7,400738 <main+0x71c>
  400744:	ff860ae3          	beq	a2,s8,400738 <main+0x71c>
  400748:	03000713          	li	a4,48
  40074c:	02e61063          	bne	a2,a4,40076c <main+0x750>
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  400750:	fff6c603          	lbu	a2,-1(a3)
  400754:	02066613          	ori	a2,a2,32
  400758:	07800713          	li	a4,120
  40075c:	08e61463          	bne	a2,a4,4007e4 <main+0x7c8>
    if (!*s) return -1;
  400760:	0006c603          	lbu	a2,0(a3)
  400764:	08061463          	bnez	a2,4007ec <main+0x7d0>
  400768:	0dc0006f          	j	400844 <main+0x828>
  40076c:	ffe68693          	addi	a3,a3,-2
  400770:	06061e63          	bnez	a2,4007ec <main+0x7d0>
  400774:	0d00006f          	j	400844 <main+0x828>
  400778:	04c12503          	lw	a0,76(sp)
            if (argc < 2) {
  40077c:	0e0d8463          	beqz	s11,400864 <main+0x848>
            unsigned sd_sector = parse_u32(argv[1]);
  400780:	09012503          	lw	a0,144(sp)
  400784:	00001097          	auipc	ra,0x1
  400788:	9b0080e7          	jalr	-1616(ra) # 401134 <parse_u32>
            call_sd_read_api(sd_sector);
  40078c:	00000097          	auipc	ra,0x0
  400790:	654080e7          	jalr	1620(ra) # 400de0 <call_sd_read_api>
  400794:	a95ff06f          	j	400228 <main+0x20c>
  400798:	00400593          	li	a1,4
            call_sa_api(matrix_max);
  40079c:	00058513          	mv	a0,a1
  4007a0:	00000097          	auipc	ra,0x0
  4007a4:	308080e7          	jalr	776(ra) # 400aa8 <call_sa_api>
  4007a8:	a81ff06f          	j	400228 <main+0x20c>
  4007ac:	04412503          	lw	a0,68(sp)
            if (argc < 2) {
  4007b0:	0a0d8a63          	beqz	s11,400864 <main+0x848>
            unsigned sd_sector = parse_u32(argv[1]);
  4007b4:	09012503          	lw	a0,144(sp)
  4007b8:	00001097          	auipc	ra,0x1
  4007bc:	97c080e7          	jalr	-1668(ra) # 401134 <parse_u32>
  4007c0:	00050593          	mv	a1,a0
            if (sd_sector < 5000) {
  4007c4:	00355613          	srli	a2,a0,0x3
  4007c8:	03c12503          	lw	a0,60(sp)
  4007cc:	27100693          	li	a3,625
  4007d0:	08d66a63          	bltu	a2,a3,400864 <main+0x848>
            call_sd_write_api(sd_sector);
  4007d4:	00058513          	mv	a0,a1
  4007d8:	00000097          	auipc	ra,0x0
  4007dc:	614080e7          	jalr	1556(ra) # 400dec <call_sd_write_api>
  4007e0:	a49ff06f          	j	400228 <main+0x20c>
  4007e4:	ffe68693          	addi	a3,a3,-2
  4007e8:	03000613          	li	a2,48
  4007ec:	00000593          	li	a1,0
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  4007f0:	00168693          	addi	a3,a3,1
  4007f4:	0200006f          	j	400814 <main+0x7f8>
  4007f8:	0ff67793          	zext.b	a5,a2
    while (*s) {
  4007fc:	0006c603          	lbu	a2,0(a3)
  400800:	00f70733          	add	a4,a4,a5
        v = (v << 4) | d;
  400804:	00459593          	slli	a1,a1,0x4
  400808:	00b765b3          	or	a1,a4,a1
    while (*s) {
  40080c:	00168693          	addi	a3,a3,1
  400810:	02060a63          	beqz	a2,400844 <main+0x828>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400814:	fd060713          	addi	a4,a2,-48
  400818:	0ff77793          	zext.b	a5,a4
  40081c:	fd000713          	li	a4,-48
  400820:	fd57ece3          	bltu	a5,s5,4007f8 <main+0x7dc>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  400824:	f9f60713          	addi	a4,a2,-97
  400828:	0ff77793          	zext.b	a5,a4
  40082c:	fa900713          	li	a4,-87
  400830:	fd27e4e3          	bltu	a5,s2,4007f8 <main+0x7dc>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  400834:	fbf60713          	addi	a4,a2,-65
  400838:	0ff77793          	zext.b	a5,a4
  40083c:	fc900713          	li	a4,-55
  400840:	faf87ce3          	bgeu	a6,a5,4007f8 <main+0x7dc>
            call_dump_api(addr, len);
  400844:	00000097          	auipc	ra,0x0
  400848:	5b4080e7          	jalr	1460(ra) # 400df8 <call_dump_api>
  40084c:	9ddff06f          	j	400228 <main+0x20c>
            if (fat32_mount() != 0) {
  400850:	00001097          	auipc	ra,0x1
  400854:	b24080e7          	jalr	-1244(ra) # 401374 <fat32_mount>
  400858:	00050593          	mv	a1,a0
  40085c:	03812503          	lw	a0,56(sp)
  400860:	02058a63          	beqz	a1,400894 <main+0x878>
  400864:	00000097          	auipc	ra,0x0
  400868:	614080e7          	jalr	1556(ra) # 400e78 <printf>
  40086c:	9bdff06f          	j	400228 <main+0x20c>
            fat32_ls();
  400870:	00001097          	auipc	ra,0x1
  400874:	ef0080e7          	jalr	-272(ra) # 401760 <fat32_ls>
  400878:	9b1ff06f          	j	400228 <main+0x20c>
  40087c:	02012503          	lw	a0,32(sp)
            if (argc < 2) {
  400880:	fe0d82e3          	beqz	s11,400864 <main+0x848>
            fat32_cat(argv[1]);
  400884:	09012503          	lw	a0,144(sp)
  400888:	00001097          	auipc	ra,0x1
  40088c:	a00080e7          	jalr	-1536(ra) # 401288 <fat32_cat>
  400890:	999ff06f          	j	400228 <main+0x20c>
  400894:	00402537          	lui	a0,0x402
            printf("part_lba=%x\n",      g_fat32.part_lba);
  400898:	f6852583          	lw	a1,-152(a0) # 401f68 <g_fat32>
  40089c:	f6850b13          	addi	s6,a0,-152
  4008a0:	01c12503          	lw	a0,28(sp)
  4008a4:	00000097          	auipc	ra,0x0
  4008a8:	5d4080e7          	jalr	1492(ra) # 400e78 <printf>
            printf("root_cluster=%x\n",  g_fat32.root_cluster);
  4008ac:	00cb2583          	lw	a1,12(s6)
  4008b0:	01812503          	lw	a0,24(sp)
  4008b4:	00000097          	auipc	ra,0x0
  4008b8:	5c4080e7          	jalr	1476(ra) # 400e78 <printf>
            printf("spc=%x\n",           g_fat32.sectors_per_cluster);
  4008bc:	010b2583          	lw	a1,16(s6)
  4008c0:	01412503          	lw	a0,20(sp)
  4008c4:	00000097          	auipc	ra,0x0
  4008c8:	5b4080e7          	jalr	1460(ra) # 400e78 <printf>
            printf("fat_begin=%x\n",     g_fat32.fat_begin);
  4008cc:	004b2583          	lw	a1,4(s6)
  4008d0:	01012503          	lw	a0,16(sp)
  4008d4:	00000097          	auipc	ra,0x0
  4008d8:	5a4080e7          	jalr	1444(ra) # 400e78 <printf>
            printf("data_begin=%x\n",    g_fat32.data_begin);
  4008dc:	008b2583          	lw	a1,8(s6)
  4008e0:	00c12503          	lw	a0,12(sp)
  4008e4:	00000097          	auipc	ra,0x0
  4008e8:	594080e7          	jalr	1428(ra) # 400e78 <printf>
  4008ec:	93dff06f          	j	400228 <main+0x20c>
  4008f0:	00812503          	lw	a0,8(sp)
            printf("commands:\n");
  4008f4:	00000097          	auipc	ra,0x0
  4008f8:	584080e7          	jalr	1412(ra) # 400e78 <printf>
  4008fc:	92dff06f          	j	400228 <main+0x20c>
            exit();
  400900:	00000097          	auipc	ra,0x0
  400904:	190080e7          	jalr	400(ra) # 400a90 <exit>

00400908 <parse_hex>:
    while (*s == ' ' || *s == '\t') s++;
  400908:	00250613          	addi	a2,a0,2
  40090c:	00900693          	li	a3,9
  400910:	02000713          	li	a4,32
  400914:	0080006f          	j	40091c <parse_hex+0x14>
  400918:	00160613          	addi	a2,a2,1
  40091c:	ffe64503          	lbu	a0,-2(a2)
  400920:	fed50ce3          	beq	a0,a3,400918 <parse_hex+0x10>
  400924:	fee50ae3          	beq	a0,a4,400918 <parse_hex+0x10>
  400928:	03000693          	li	a3,48
  40092c:	02d51063          	bne	a0,a3,40094c <parse_hex+0x44>
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  400930:	fff64503          	lbu	a0,-1(a2)
  400934:	02056513          	ori	a0,a0,32
  400938:	07800693          	li	a3,120
  40093c:	02d51063          	bne	a0,a3,40095c <parse_hex+0x54>
    if (!*s) return -1;
  400940:	00064503          	lbu	a0,0(a2)
  400944:	02051063          	bnez	a0,400964 <parse_hex+0x5c>
  400948:	00c0006f          	j	400954 <parse_hex+0x4c>
  40094c:	ffe60613          	addi	a2,a2,-2
  400950:	00051a63          	bnez	a0,400964 <parse_hex+0x5c>
  400954:	fff00513          	li	a0,-1
    }
    *out = v;
    return 0;
  400958:	00008067          	ret
  40095c:	ffe60613          	addi	a2,a2,-2
  400960:	03000513          	li	a0,48
  400964:	00000693          	li	a3,0
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400968:	00160613          	addi	a2,a2,1
  40096c:	00a00713          	li	a4,10
  400970:	00600793          	li	a5,6
  400974:	00500813          	li	a6,5
  400978:	0200006f          	j	400998 <parse_hex+0x90>
  40097c:	0ff57293          	zext.b	t0,a0
    while (*s) {
  400980:	00064503          	lbu	a0,0(a2)
  400984:	005888b3          	add	a7,a7,t0
        v = (v << 4) | d;
  400988:	00469693          	slli	a3,a3,0x4
  40098c:	00d8e6b3          	or	a3,a7,a3
    while (*s) {
  400990:	00160613          	addi	a2,a2,1
  400994:	02050a63          	beqz	a0,4009c8 <parse_hex+0xc0>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400998:	fd050893          	addi	a7,a0,-48
  40099c:	0ff8f293          	zext.b	t0,a7
  4009a0:	fd000893          	li	a7,-48
  4009a4:	fce2ece3          	bltu	t0,a4,40097c <parse_hex+0x74>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  4009a8:	f9f50893          	addi	a7,a0,-97
  4009ac:	0ff8f293          	zext.b	t0,a7
  4009b0:	fa900893          	li	a7,-87
  4009b4:	fcf2e4e3          	bltu	t0,a5,40097c <parse_hex+0x74>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  4009b8:	fbf50893          	addi	a7,a0,-65
  4009bc:	0ff8f293          	zext.b	t0,a7
  4009c0:	fc900893          	li	a7,-55
  4009c4:	fa587ce3          	bgeu	a6,t0,40097c <parse_hex+0x74>
  4009c8:	00000513          	li	a0,0
    *out = v;
  4009cc:	00d5a023          	sw	a3,0(a1)
  4009d0:	00008067          	ret

004009d4 <cmd_primes>:
{
  4009d4:	fe010113          	addi	sp,sp,-32
  4009d8:	00112e23          	sw	ra,28(sp)
  4009dc:	00812c23          	sw	s0,24(sp)
  4009e0:	00912a23          	sw	s1,20(sp)
  4009e4:	01212823          	sw	s2,16(sp)
  4009e8:	01312623          	sw	s3,12(sp)
  4009ec:	00200913          	li	s2,2
  4009f0:	00050413          	mv	s0,a0
  4009f4:	00000493          	li	s1,0
    for (unsigned n = 2; n <= max; n++) {
  4009f8:	07256463          	bltu	a0,s2,400a60 <cmd_primes+0x8c>
  4009fc:	00402537          	lui	a0,0x402
  400a00:	cbe50993          	addi	s3,a0,-834 # 401cbe <$d.1+0x1b>
  400a04:	00c0006f          	j	400a10 <cmd_primes+0x3c>
  400a08:	00190913          	addi	s2,s2,1
  400a0c:	05246063          	bltu	s0,s2,400a4c <cmd_primes+0x78>
        if (is_prime(n)) {
  400a10:	00090513          	mv	a0,s2
  400a14:	00000097          	auipc	ra,0x0
  400a18:	7c8080e7          	jalr	1992(ra) # 4011dc <is_prime>
  400a1c:	fe0506e3          	beqz	a0,400a08 <cmd_primes+0x34>
            printf("%d ", (int)n);
  400a20:	00098513          	mv	a0,s3
  400a24:	00090593          	mv	a1,s2
  400a28:	00000097          	auipc	ra,0x0
  400a2c:	450080e7          	jalr	1104(ra) # 400e78 <printf>
            count++;
  400a30:	00148493          	addi	s1,s1,1
            if ((count % 8) == 0)
  400a34:	0074f513          	andi	a0,s1,7
  400a38:	fc0518e3          	bnez	a0,400a08 <cmd_primes+0x34>
                putchar('\n');
  400a3c:	00a00513          	li	a0,10
  400a40:	00000097          	auipc	ra,0x0
  400a44:	36c080e7          	jalr	876(ra) # 400dac <putchar>
  400a48:	fc1ff06f          	j	400a08 <cmd_primes+0x34>
    if ((count % 8) != 0)
  400a4c:	0074f513          	andi	a0,s1,7
  400a50:	00050863          	beqz	a0,400a60 <cmd_primes+0x8c>
        putchar('\n');
  400a54:	00a00513          	li	a0,10
  400a58:	00000097          	auipc	ra,0x0
  400a5c:	354080e7          	jalr	852(ra) # 400dac <putchar>
    printf("total primes: %d (0..%d)\n", count, (int)max);
  400a60:	00402537          	lui	a0,0x402
  400a64:	be950513          	addi	a0,a0,-1047 # 401be9 <__modsi3+0x111>
  400a68:	00048593          	mv	a1,s1
  400a6c:	00040613          	mv	a2,s0
  400a70:	01c12083          	lw	ra,28(sp)
  400a74:	01812403          	lw	s0,24(sp)
  400a78:	01412483          	lw	s1,20(sp)
  400a7c:	01012903          	lw	s2,16(sp)
  400a80:	00c12983          	lw	s3,12(sp)
  400a84:	02010113          	addi	sp,sp,32
  400a88:	00000317          	auipc	t1,0x0
  400a8c:	3f030067          	jr	1008(t1) # 400e78 <printf>

00400a90 <exit>:
    __asm__ __volatile__ (
  400a90:	00d00693          	li	a3,13
  400a94:	00000593          	li	a1,0
  400a98:	00000613          	li	a2,0
  400a9c:	00000513          	li	a0,0
  400aa0:	00000073          	ecall
    for (;;);
  400aa4:	0000006f          	j	400aa4 <exit+0x14>

00400aa8 <call_sa_api>:
{
  400aa8:	fa010113          	addi	sp,sp,-96
  400aac:	00050793          	mv	a5,a0
    for (uint32_t i = 0; i < matrix_size; i++) {
  400ab0:	12050063          	beqz	a0,400bd0 <call_sa_api+0x128>
  400ab4:	00000513          	li	a0,0
  400ab8:	00000593          	li	a1,0
  400abc:	05010613          	addi	a2,sp,80
  400ac0:	04010693          	addi	a3,sp,64
  400ac4:	05010713          	addi	a4,sp,80
        for (uint32_t j = 0; j < matrix_size; j++) {
  400ac8:	00259813          	slli	a6,a1,0x2
  400acc:	01078833          	add	a6,a5,a6
  400ad0:	01060833          	add	a6,a2,a6
  400ad4:	00068893          	mv	a7,a3
  400ad8:	00070293          	mv	t0,a4
  400adc:	00058313          	mv	t1,a1
  400ae0:	00050393          	mv	t2,a0
            matrix_A[i][j] = (uint8_t)(2*i + 2*j + 2);
  400ae4:	00131e13          	slli	t3,t1,0x1
  400ae8:	002e0e13          	addi	t3,t3,2
  400aec:	01c28023          	sb	t3,0(t0)
            matrix_B[i][j] = (uint8_t)(3*i + j + 5);
  400af0:	00538e13          	addi	t3,t2,5
  400af4:	01c88023          	sb	t3,0(a7)
        for (uint32_t j = 0; j < matrix_size; j++) {
  400af8:	00138393          	addi	t2,t2,1
  400afc:	00130313          	addi	t1,t1,1
  400b00:	00128293          	addi	t0,t0,1
  400b04:	00188893          	addi	a7,a7,1
  400b08:	fd029ee3          	bne	t0,a6,400ae4 <call_sa_api+0x3c>
    for (uint32_t i = 0; i < matrix_size; i++) {
  400b0c:	00158593          	addi	a1,a1,1
  400b10:	00350513          	addi	a0,a0,3
  400b14:	00470713          	addi	a4,a4,4
  400b18:	00468693          	addi	a3,a3,4
  400b1c:	faf596e3          	bne	a1,a5,400ac8 <call_sa_api+0x20>
  400b20:	05010813          	addi	a6,sp,80
  400b24:	04010893          	addi	a7,sp,64
  400b28:	00010293          	mv	t0,sp
  400b2c:	00400313          	li	t1,4
    __asm__ __volatile__ (
  400b30:	00080513          	mv	a0,a6
  400b34:	00088593          	mv	a1,a7
  400b38:	00028613          	mv	a2,t0
  400b3c:	00030693          	mv	a3,t1
  400b40:	00078713          	mv	a4,a5
  400b44:	00000073          	ecall
  400b48:	00050893          	mv	a7,a0
  400b4c:	04100593          	li	a1,65
    __asm__ __volatile__ (
  400b50:	00058513          	mv	a0,a1
  400b54:	00100693          	li	a3,1
  400b58:	00000073          	ecall
  400b5c:	00a00593          	li	a1,10
  400b60:	00058513          	mv	a0,a1
  400b64:	00100693          	li	a3,1
  400b68:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400b6c:	16078a63          	beqz	a5,400ce0 <call_sa_api+0x238>
  400b70:	00000593          	li	a1,0
  400b74:	02000613          	li	a2,32
  400b78:	00a00713          	li	a4,10
  400b7c:	05010893          	addi	a7,sp,80
        for (uint32_t j = 0; j < matrix_size; j++) {
  400b80:	00259513          	slli	a0,a1,0x2
  400b84:	00a78533          	add	a0,a5,a0
  400b88:	00a802b3          	add	t0,a6,a0
  400b8c:	00088313          	mv	t1,a7
            print_int((int)matrix_A[i][j]);
  400b90:	00034383          	lbu	t2,0(t1)
    __asm__ __volatile__ (
  400b94:	00038513          	mv	a0,t2
  400b98:	00e00693          	li	a3,14
  400b9c:	00000073          	ecall
    __asm__ __volatile__ (
  400ba0:	00060513          	mv	a0,a2
  400ba4:	00100693          	li	a3,1
  400ba8:	00000073          	ecall
        for (uint32_t j = 0; j < matrix_size; j++) {
  400bac:	00130313          	addi	t1,t1,1
  400bb0:	fe5310e3          	bne	t1,t0,400b90 <call_sa_api+0xe8>
    __asm__ __volatile__ (
  400bb4:	00070513          	mv	a0,a4
  400bb8:	00100693          	li	a3,1
  400bbc:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400bc0:	00158593          	addi	a1,a1,1
  400bc4:	00488893          	addi	a7,a7,4
  400bc8:	faf59ce3          	bne	a1,a5,400b80 <call_sa_api+0xd8>
  400bcc:	0500006f          	j	400c1c <call_sa_api+0x174>
  400bd0:	05010813          	addi	a6,sp,80
  400bd4:	04010893          	addi	a7,sp,64
  400bd8:	00010293          	mv	t0,sp
  400bdc:	00400313          	li	t1,4
    __asm__ __volatile__ (
  400be0:	00080513          	mv	a0,a6
  400be4:	00088593          	mv	a1,a7
  400be8:	00028613          	mv	a2,t0
  400bec:	00030693          	mv	a3,t1
  400bf0:	00078713          	mv	a4,a5
  400bf4:	00000073          	ecall
  400bf8:	00050813          	mv	a6,a0
  400bfc:	04100593          	li	a1,65
    __asm__ __volatile__ (
  400c00:	00058513          	mv	a0,a1
  400c04:	00100693          	li	a3,1
  400c08:	00000073          	ecall
  400c0c:	00a00593          	li	a1,10
  400c10:	00058513          	mv	a0,a1
  400c14:	00100693          	li	a3,1
  400c18:	00000073          	ecall
  400c1c:	00a00593          	li	a1,10
  400c20:	00058513          	mv	a0,a1
  400c24:	00100693          	li	a3,1
  400c28:	00000073          	ecall
  400c2c:	04200613          	li	a2,66
  400c30:	00060513          	mv	a0,a2
  400c34:	00100693          	li	a3,1
  400c38:	00000073          	ecall
  400c3c:	00058513          	mv	a0,a1
  400c40:	00100693          	li	a3,1
  400c44:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400c48:	06078463          	beqz	a5,400cb0 <call_sa_api+0x208>
  400c4c:	00000593          	li	a1,0
  400c50:	04010613          	addi	a2,sp,64
  400c54:	02000713          	li	a4,32
  400c58:	00a00813          	li	a6,10
  400c5c:	04010893          	addi	a7,sp,64
        for (uint32_t j = 0; j < matrix_size; j++) {
  400c60:	00259513          	slli	a0,a1,0x2
  400c64:	00a78533          	add	a0,a5,a0
  400c68:	00a602b3          	add	t0,a2,a0
  400c6c:	00088313          	mv	t1,a7
            print_int((int)matrix_B[i][j]);
  400c70:	00034383          	lbu	t2,0(t1)
    __asm__ __volatile__ (
  400c74:	00038513          	mv	a0,t2
  400c78:	00e00693          	li	a3,14
  400c7c:	00000073          	ecall
    __asm__ __volatile__ (
  400c80:	00070513          	mv	a0,a4
  400c84:	00100693          	li	a3,1
  400c88:	00000073          	ecall
        for (uint32_t j = 0; j < matrix_size; j++) {
  400c8c:	00130313          	addi	t1,t1,1
  400c90:	fe5310e3          	bne	t1,t0,400c70 <call_sa_api+0x1c8>
    __asm__ __volatile__ (
  400c94:	00080513          	mv	a0,a6
  400c98:	00100693          	li	a3,1
  400c9c:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400ca0:	00158593          	addi	a1,a1,1
  400ca4:	00488893          	addi	a7,a7,4
  400ca8:	faf59ce3          	bne	a1,a5,400c60 <call_sa_api+0x1b8>
  400cac:	0600006f          	j	400d0c <call_sa_api+0x264>
  400cb0:	00a00593          	li	a1,10
    __asm__ __volatile__ (
  400cb4:	00058513          	mv	a0,a1
  400cb8:	00100693          	li	a3,1
  400cbc:	00000073          	ecall
  400cc0:	04300613          	li	a2,67
  400cc4:	00060513          	mv	a0,a2
  400cc8:	00100693          	li	a3,1
  400ccc:	00000073          	ecall
  400cd0:	00058513          	mv	a0,a1
  400cd4:	00100693          	li	a3,1
  400cd8:	00000073          	ecall
  400cdc:	0b80006f          	j	400d94 <call_sa_api+0x2ec>
  400ce0:	00a00593          	li	a1,10
  400ce4:	00058513          	mv	a0,a1
  400ce8:	00100693          	li	a3,1
  400cec:	00000073          	ecall
  400cf0:	04200613          	li	a2,66
  400cf4:	00060513          	mv	a0,a2
  400cf8:	00100693          	li	a3,1
  400cfc:	00000073          	ecall
  400d00:	00058513          	mv	a0,a1
  400d04:	00100693          	li	a3,1
  400d08:	00000073          	ecall
  400d0c:	00a00593          	li	a1,10
  400d10:	00058513          	mv	a0,a1
  400d14:	00100693          	li	a3,1
  400d18:	00000073          	ecall
  400d1c:	04300613          	li	a2,67
  400d20:	00060513          	mv	a0,a2
  400d24:	00100693          	li	a3,1
  400d28:	00000073          	ecall
  400d2c:	00058513          	mv	a0,a1
  400d30:	00100693          	li	a3,1
  400d34:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400d38:	04078e63          	beqz	a5,400d94 <call_sa_api+0x2ec>
  400d3c:	00000593          	li	a1,0
  400d40:	00010613          	mv	a2,sp
  400d44:	02000713          	li	a4,32
  400d48:	00a00813          	li	a6,10
  400d4c:	00060893          	mv	a7,a2
  400d50:	00078293          	mv	t0,a5
            print_int((int)matrix_C[i][j]);
  400d54:	0008a303          	lw	t1,0(a7)
    __asm__ __volatile__ (
  400d58:	00030513          	mv	a0,t1
  400d5c:	00e00693          	li	a3,14
  400d60:	00000073          	ecall
    __asm__ __volatile__ (
  400d64:	00070513          	mv	a0,a4
  400d68:	00100693          	li	a3,1
  400d6c:	00000073          	ecall
        for (uint32_t j = 0; j < matrix_size; j++) {
  400d70:	fff28293          	addi	t0,t0,-1
  400d74:	00488893          	addi	a7,a7,4
  400d78:	fc029ee3          	bnez	t0,400d54 <call_sa_api+0x2ac>
    __asm__ __volatile__ (
  400d7c:	00080513          	mv	a0,a6
  400d80:	00100693          	li	a3,1
  400d84:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400d88:	00158593          	addi	a1,a1,1
  400d8c:	01060613          	addi	a2,a2,16
  400d90:	faf59ee3          	bne	a1,a5,400d4c <call_sa_api+0x2a4>
  400d94:	00a00593          	li	a1,10
    __asm__ __volatile__ (
  400d98:	00058513          	mv	a0,a1
  400d9c:	00100693          	li	a3,1
  400da0:	00000073          	ecall
}
  400da4:	06010113          	addi	sp,sp,96
  400da8:	00008067          	ret

00400dac <putchar>:
{
  400dac:	00050593          	mv	a1,a0
    __asm__ __volatile__ (
  400db0:	00058513          	mv	a0,a1
  400db4:	00100693          	li	a3,1
  400db8:	00000073          	ecall
}
  400dbc:	00008067          	ret

00400dc0 <print_int>:
{
  400dc0:	00050593          	mv	a1,a0
    __asm__ __volatile__ (
  400dc4:	00058513          	mv	a0,a1
  400dc8:	00e00693          	li	a3,14
  400dcc:	00000073          	ecall
}
  400dd0:	00008067          	ret

00400dd4 <call_mic_api>:
    __asm__ __volatile__(
  400dd4:	00500693          	li	a3,5
  400dd8:	00000073          	ecall
}
  400ddc:	00008067          	ret

00400de0 <call_sd_read_api>:
    __asm__ __volatile__(
  400de0:	00600693          	li	a3,6
  400de4:	00000073          	ecall
}
  400de8:	00008067          	ret

00400dec <call_sd_write_api>:
    __asm__ __volatile__(
  400dec:	00600693          	li	a3,6
  400df0:	00000073          	ecall
}
  400df4:	00008067          	ret

00400df8 <call_dump_api>:
    __asm__ __volatile__(
  400df8:	00900693          	li	a3,9
  400dfc:	00000073          	ecall
}
  400e00:	00008067          	ret

00400e04 <strcpy>:
    while (*src)
  400e04:	0005c603          	lbu	a2,0(a1)
  400e08:	00050693          	mv	a3,a0
  400e0c:	02060263          	beqz	a2,400e30 <strcpy+0x2c>
  400e10:	00158593          	addi	a1,a1,1
  400e14:	00050713          	mv	a4,a0
        *d++ = *src++;
  400e18:	00c70023          	sb	a2,0(a4)
    while (*src)
  400e1c:	0005c603          	lbu	a2,0(a1)
        *d++ = *src++;
  400e20:	00170693          	addi	a3,a4,1
    while (*src)
  400e24:	00158593          	addi	a1,a1,1
  400e28:	00068713          	mv	a4,a3
  400e2c:	fe0616e3          	bnez	a2,400e18 <strcpy+0x14>
    *d = '\0';
  400e30:	00068023          	sb	zero,0(a3)
    return dst;
  400e34:	00008067          	ret

00400e38 <strcmp>:
    while (*s1 && *s2) {
  400e38:	00054603          	lbu	a2,0(a0)
  400e3c:	02060663          	beqz	a2,400e68 <strcmp+0x30>
  400e40:	00150513          	addi	a0,a0,1
  400e44:	0005c683          	lbu	a3,0(a1)
  400e48:	0ff67713          	zext.b	a4,a2
  400e4c:	00d71a63          	bne	a4,a3,400e60 <strcmp+0x28>
  400e50:	00054603          	lbu	a2,0(a0)
        s2++;
  400e54:	00158593          	addi	a1,a1,1
    while (*s1 && *s2) {
  400e58:	00150513          	addi	a0,a0,1
  400e5c:	fe0614e3          	bnez	a2,400e44 <strcmp+0xc>
    return *(unsigned char *)s1 - *(unsigned char *)s2;
  400e60:	0ff67513          	zext.b	a0,a2
  400e64:	0080006f          	j	400e6c <strcmp+0x34>
  400e68:	00000513          	li	a0,0
  400e6c:	0005c583          	lbu	a1,0(a1)
  400e70:	40b50533          	sub	a0,a0,a1
  400e74:	00008067          	ret

00400e78 <printf>:
void printf(const char *fmt, ...) {
  400e78:	fb010113          	addi	sp,sp,-80
  400e7c:	02812623          	sw	s0,44(sp)
  400e80:	02912423          	sw	s1,40(sp)
  400e84:	03212223          	sw	s2,36(sp)
  400e88:	03312023          	sw	s3,32(sp)
  400e8c:	01412e23          	sw	s4,28(sp)
  400e90:	00050293          	mv	t0,a0
  400e94:	05112623          	sw	a7,76(sp)
  400e98:	05012423          	sw	a6,72(sp)
  400e9c:	04f12223          	sw	a5,68(sp)
  400ea0:	04e12023          	sw	a4,64(sp)
  400ea4:	02d12e23          	sw	a3,60(sp)
  400ea8:	02c12c23          	sw	a2,56(sp)
  400eac:	02b12a23          	sw	a1,52(sp)
  400eb0:	03410513          	addi	a0,sp,52
    va_start(vargs, fmt);
  400eb4:	00a12c23          	sw	a0,24(sp)
  400eb8:	02500593          	li	a1,37
  400ebc:	07200613          	li	a2,114
  400ec0:	06400713          	li	a4,100
  400ec4:	02d00793          	li	a5,45
  400ec8:	ccccd537          	lui	a0,0xccccd
  400ecc:	ccd50813          	addi	a6,a0,-819 # cccccccd <USER_MAX+0xcc7ccccd>
  400ed0:	00a00893          	li	a7,10
  400ed4:	00d10313          	addi	t1,sp,13
  400ed8:	00900393          	li	t2,9
  400edc:	00100e13          	li	t3,1
  400ee0:	03000e93          	li	t4,48
  400ee4:	07300f13          	li	t5,115
  400ee8:	07800f93          	li	t6,120
  400eec:	00402537          	lui	a0,0x402
  400ef0:	ce050413          	addi	s0,a0,-800 # 401ce0 <$d.2>
  400ef4:	00c0006f          	j	400f00 <printf+0x88>
            switch (*fmt) {
  400ef8:	20050863          	beqz	a0,401108 <printf+0x290>
        fmt++;
  400efc:	00128293          	addi	t0,t0,1
    while (*fmt) {
  400f00:	0002c483          	lbu	s1,0(t0)
  400f04:	00b48e63          	beq	s1,a1,400f20 <printf+0xa8>
  400f08:	20048863          	beqz	s1,401118 <printf+0x2a0>
    __asm__ __volatile__ (
  400f0c:	00048513          	mv	a0,s1
  400f10:	00100693          	li	a3,1
  400f14:	00000073          	ecall
        fmt++;
  400f18:	00128293          	addi	t0,t0,1
  400f1c:	fe5ff06f          	j	400f00 <printf+0x88>
            switch (*fmt) {
  400f20:	0012c503          	lbu	a0,1(t0)
            fmt++;
  400f24:	00128293          	addi	t0,t0,1
            switch (*fmt) {
  400f28:	02a64c63          	blt	a2,a0,400f60 <printf+0xe8>
  400f2c:	12b50663          	beq	a0,a1,401058 <printf+0x1e0>
  400f30:	fce514e3          	bne	a0,a4,400ef8 <printf+0x80>
                    int value = va_arg(vargs, int);
  400f34:	01812503          	lw	a0,24(sp)
  400f38:	00450693          	addi	a3,a0,4
  400f3c:	00d12c23          	sw	a3,24(sp)
  400f40:	00052483          	lw	s1,0(a0)
                    if (value < 0) {
  400f44:	1604c063          	bltz	s1,4010a4 <printf+0x22c>
                    if (u == 0) {
  400f48:	16049663          	bnez	s1,4010b4 <printf+0x23c>
    __asm__ __volatile__ (
  400f4c:	000e8513          	mv	a0,t4
  400f50:	00100693          	li	a3,1
  400f54:	00000073          	ecall
        fmt++;
  400f58:	00128293          	addi	t0,t0,1
  400f5c:	fa5ff06f          	j	400f00 <printf+0x88>
            switch (*fmt) {
  400f60:	11e50663          	beq	a0,t5,40106c <printf+0x1f4>
  400f64:	f9f51ce3          	bne	a0,t6,400efc <printf+0x84>
                    unsigned value = va_arg(vargs, unsigned);
  400f68:	01812503          	lw	a0,24(sp)
  400f6c:	00450693          	addi	a3,a0,4
  400f70:	00d12c23          	sw	a3,24(sp)
  400f74:	00052483          	lw	s1,0(a0)
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400f78:	01c4d513          	srli	a0,s1,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400f7c:	00a40533          	add	a0,s0,a0
  400f80:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  400f84:	00090513          	mv	a0,s2
  400f88:	00100693          	li	a3,1
  400f8c:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400f90:	00449513          	slli	a0,s1,0x4
  400f94:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400f98:	00a40533          	add	a0,s0,a0
  400f9c:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  400fa0:	00090513          	mv	a0,s2
  400fa4:	00100693          	li	a3,1
  400fa8:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400fac:	00849513          	slli	a0,s1,0x8
  400fb0:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400fb4:	00a40533          	add	a0,s0,a0
  400fb8:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  400fbc:	00090513          	mv	a0,s2
  400fc0:	00100693          	li	a3,1
  400fc4:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400fc8:	00c49513          	slli	a0,s1,0xc
  400fcc:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400fd0:	00a40533          	add	a0,s0,a0
  400fd4:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  400fd8:	00090513          	mv	a0,s2
  400fdc:	00100693          	li	a3,1
  400fe0:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400fe4:	01049513          	slli	a0,s1,0x10
  400fe8:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400fec:	00a40533          	add	a0,s0,a0
  400ff0:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  400ff4:	00090513          	mv	a0,s2
  400ff8:	00100693          	li	a3,1
  400ffc:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  401000:	01449513          	slli	a0,s1,0x14
  401004:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  401008:	00a40533          	add	a0,s0,a0
  40100c:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  401010:	00090513          	mv	a0,s2
  401014:	00100693          	li	a3,1
  401018:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  40101c:	01849513          	slli	a0,s1,0x18
  401020:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  401024:	00a40533          	add	a0,s0,a0
  401028:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  40102c:	00090513          	mv	a0,s2
  401030:	00100693          	li	a3,1
  401034:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  401038:	00f4f493          	andi	s1,s1,15
                        putchar("0123456789abcdef"[nibble]);
  40103c:	009404b3          	add	s1,s0,s1
  401040:	0004c483          	lbu	s1,0(s1)
    __asm__ __volatile__ (
  401044:	00048513          	mv	a0,s1
  401048:	00100693          	li	a3,1
  40104c:	00000073          	ecall
        fmt++;
  401050:	00128293          	addi	t0,t0,1
  401054:	eadff06f          	j	400f00 <printf+0x88>
    __asm__ __volatile__ (
  401058:	00058513          	mv	a0,a1
  40105c:	00100693          	li	a3,1
  401060:	00000073          	ecall
        fmt++;
  401064:	00128293          	addi	t0,t0,1
  401068:	e99ff06f          	j	400f00 <printf+0x88>
                    const char *s = va_arg(vargs, const char *);
  40106c:	01812503          	lw	a0,24(sp)
  401070:	00450693          	addi	a3,a0,4
  401074:	00d12c23          	sw	a3,24(sp)
  401078:	00052903          	lw	s2,0(a0)
                    while (*s) {
  40107c:	00094483          	lbu	s1,0(s2)
  401080:	e6048ee3          	beqz	s1,400efc <printf+0x84>
  401084:	00190913          	addi	s2,s2,1
    __asm__ __volatile__ (
  401088:	00048513          	mv	a0,s1
  40108c:	00100693          	li	a3,1
  401090:	00000073          	ecall
                    while (*s) {
  401094:	00094483          	lbu	s1,0(s2)
  401098:	00190913          	addi	s2,s2,1
  40109c:	fe0496e3          	bnez	s1,401088 <printf+0x210>
  4010a0:	e5dff06f          	j	400efc <printf+0x84>
    __asm__ __volatile__ (
  4010a4:	00078513          	mv	a0,a5
  4010a8:	00100693          	li	a3,1
  4010ac:	00000073          	ecall
                        u = (unsigned int)(-(value + 1)) + 1;
  4010b0:	409004b3          	neg	s1,s1
  4010b4:	00000513          	li	a0,0
  4010b8:	00048693          	mv	a3,s1
  4010bc:	00050913          	mv	s2,a0
                        u /= 10;
  4010c0:	0304b4b3          	mulhu	s1,s1,a6
  4010c4:	0034d493          	srli	s1,s1,0x3
  4010c8:	03148533          	mul	a0,s1,a7
  4010cc:	40a68533          	sub	a0,a3,a0
                        buf[i++] = '0' + (u % 10);
  4010d0:	03056993          	ori	s3,a0,48
  4010d4:	00190513          	addi	a0,s2,1
  4010d8:	01230a33          	add	s4,t1,s2
  4010dc:	013a0023          	sb	s3,0(s4)
                    while (u > 0) {
  4010e0:	fcd3ece3          	bltu	t2,a3,4010b8 <printf+0x240>
                        putchar(buf[--i]);
  4010e4:	01230533          	add	a0,t1,s2
  4010e8:	00054483          	lbu	s1,0(a0)
    __asm__ __volatile__ (
  4010ec:	00048513          	mv	a0,s1
  4010f0:	00100693          	li	a3,1
  4010f4:	00000073          	ecall
                    while (i > 0) {
  4010f8:	00190513          	addi	a0,s2,1
  4010fc:	fff90913          	addi	s2,s2,-1
  401100:	feae42e3          	blt	t3,a0,4010e4 <printf+0x26c>
  401104:	df9ff06f          	j	400efc <printf+0x84>
  401108:	02500593          	li	a1,37
    __asm__ __volatile__ (
  40110c:	00058513          	mv	a0,a1
  401110:	00100693          	li	a3,1
  401114:	00000073          	ecall
  401118:	02c12403          	lw	s0,44(sp)
  40111c:	02812483          	lw	s1,40(sp)
  401120:	02412903          	lw	s2,36(sp)
  401124:	02012983          	lw	s3,32(sp)
  401128:	01c12a03          	lw	s4,28(sp)
}
  40112c:	05010113          	addi	sp,sp,80
  401130:	00008067          	ret

00401134 <parse_u32>:
unsigned parse_u32(const char *s) {
  401134:	00050593          	mv	a1,a0
    if ((s[0] == '0') && (s[1] == 'x' || s[1] == 'X')) {
  401138:	00054503          	lbu	a0,0(a0)
  40113c:	03000693          	li	a3,48
  401140:	00a00613          	li	a2,10
  401144:	02d51063          	bne	a0,a3,401164 <parse_u32+0x30>
  401148:	0015c503          	lbu	a0,1(a1)
  40114c:	02056513          	ori	a0,a0,32
  401150:	07800613          	li	a2,120
  401154:	00c51e63          	bne	a0,a2,401170 <parse_u32+0x3c>
    while (*s) {
  401158:	0025c503          	lbu	a0,2(a1)
        s += 2;
  40115c:	00258593          	addi	a1,a1,2
  401160:	01000613          	li	a2,16
  401164:	00050693          	mv	a3,a0
    while (*s) {
  401168:	00051663          	bnez	a0,401174 <parse_u32+0x40>
  40116c:	06c0006f          	j	4011d8 <parse_u32+0xa4>
  401170:	00a00613          	li	a2,10
  401174:	00000513          	li	a0,0
        if (c >= '0' && c <= '9')       d = (unsigned)(c - '0');
  401178:	00158593          	addi	a1,a1,1
  40117c:	00a00713          	li	a4,10
  401180:	00600793          	li	a5,6
  401184:	00500813          	li	a6,5
  401188:	fd068893          	addi	a7,a3,-48
  40118c:	0ff8f293          	zext.b	t0,a7
  401190:	fd000893          	li	a7,-48
  401194:	02e2e263          	bltu	t0,a4,4011b8 <parse_u32+0x84>
        else if (c >= 'a' && c <= 'f')  d = 10u + (unsigned)(c - 'a');
  401198:	f9f68893          	addi	a7,a3,-97
  40119c:	0ff8f293          	zext.b	t0,a7
  4011a0:	fa900893          	li	a7,-87
  4011a4:	00f2ea63          	bltu	t0,a5,4011b8 <parse_u32+0x84>
        else if (c >= 'A' && c <= 'F')  d = 10u + (unsigned)(c - 'A');
  4011a8:	fbf68893          	addi	a7,a3,-65
  4011ac:	0ff8f293          	zext.b	t0,a7
  4011b0:	fc900893          	li	a7,-55
  4011b4:	02586263          	bltu	a6,t0,4011d8 <parse_u32+0xa4>
  4011b8:	0ff6f693          	zext.b	a3,a3
  4011bc:	00d888b3          	add	a7,a7,a3
        if (d >= base) break;
  4011c0:	00c8fc63          	bgeu	a7,a2,4011d8 <parse_u32+0xa4>
    while (*s) {
  4011c4:	0005c683          	lbu	a3,0(a1)
        v = v * base + d;
  4011c8:	02c50533          	mul	a0,a0,a2
  4011cc:	00a88533          	add	a0,a7,a0
    while (*s) {
  4011d0:	00158593          	addi	a1,a1,1
  4011d4:	fa069ae3          	bnez	a3,401188 <parse_u32+0x54>
    return v;
  4011d8:	00008067          	ret

004011dc <is_prime>:
{
  4011dc:	00200593          	li	a1,2
    if (n < 2) return false;
  4011e0:	00b57663          	bgeu	a0,a1,4011ec <is_prime+0x10>
  4011e4:	00000513          	li	a0,0
}
  4011e8:	00008067          	ret
  4011ec:	ff010113          	addi	sp,sp,-16
  4011f0:	00112623          	sw	ra,12(sp)
  4011f4:	00812423          	sw	s0,8(sp)
  4011f8:	00912223          	sw	s1,4(sp)
  4011fc:	00050413          	mv	s0,a0
  401200:	00400593          	li	a1,4
  401204:	00100513          	li	a0,1
    for (unsigned i = 2; i * i <= n; i++) {
  401208:	02b46663          	bltu	s0,a1,401234 <is_prime+0x58>
  40120c:	00200493          	li	s1,2
        if (n % i == 0)
  401210:	00040513          	mv	a0,s0
  401214:	00048593          	mv	a1,s1
  401218:	00001097          	auipc	ra,0x1
  40121c:	800080e7          	jalr	-2048(ra) # 401a18 <__umodsi3>
  401220:	00050863          	beqz	a0,401230 <is_prime+0x54>
    for (unsigned i = 2; i * i <= n; i++) {
  401224:	00148493          	addi	s1,s1,1
  401228:	029485b3          	mul	a1,s1,s1
  40122c:	feb472e3          	bgeu	s0,a1,401210 <is_prime+0x34>
        if (n % i == 0)
  401230:	00a03533          	snez	a0,a0
  401234:	00c12083          	lw	ra,12(sp)
  401238:	00812403          	lw	s0,8(sp)
  40123c:	00412483          	lw	s1,4(sp)
  401240:	01010113          	addi	sp,sp,16
}
  401244:	00008067          	ret

00401248 <getchar>:
    __asm__ __volatile__ (
  401248:	00200693          	li	a3,2
  40124c:	00000073          	ecall
  401250:	00050593          	mv	a1,a0
    return ch;
  401254:	00058513          	mv	a0,a1
  401258:	00008067          	ret

0040125c <getchar_timeout>:
    __asm__ __volatile__ (
  40125c:	00300693          	li	a3,3
  401260:	00000073          	ecall
  401264:	00050593          	mv	a1,a0
    return ch;
  401268:	00058513          	mv	a0,a1
  40126c:	00008067          	ret

00401270 <call_sd_read_buf_api>:
    __asm__ __volatile__(
  401270:	00800693          	li	a3,8
  401274:	00000073          	ecall
    return (int)a0;
  401278:	00008067          	ret

0040127c <poll_switch_api>:
    __asm__ __volatile__(
  40127c:	00a00693          	li	a3,10
  401280:	00000073          	ecall
    return a0;
  401284:	00008067          	ret

00401288 <fat32_cat>:
static uint8_t fat32_buf[512];

fat32_info_t g_fat32;

int fat32_cat(const char *name)
{
  401288:	de010113          	addi	sp,sp,-544
  40128c:	20112e23          	sw	ra,540(sp)
  401290:	20812c23          	sw	s0,536(sp)
  401294:	20912a23          	sw	s1,532(sp)
  401298:	00050413          	mv	s0,a0
    uint8_t buf[512];

    uint32_t cluster;
    uint32_t size;

    if (fat32_mount())
  40129c:	00000097          	auipc	ra,0x0
  4012a0:	0d8080e7          	jalr	216(ra) # 401374 <fat32_mount>
  4012a4:	00050593          	mv	a1,a0
  4012a8:	fff00513          	li	a0,-1
  4012ac:	0a059a63          	bnez	a1,401360 <fat32_cat+0xd8>
        return -1;

    if (fat32_find(name, &cluster, &size)) {
  4012b0:	01010593          	addi	a1,sp,16
  4012b4:	00c10613          	addi	a2,sp,12
  4012b8:	00040513          	mv	a0,s0
  4012bc:	00000097          	auipc	ra,0x0
  4012c0:	1e0080e7          	jalr	480(ra) # 40149c <fat32_find>
  4012c4:	00050e63          	beqz	a0,4012e0 <fat32_cat+0x58>
        printf("file not found\n");
  4012c8:	00402537          	lui	a0,0x402
  4012cc:	d2950513          	addi	a0,a0,-727 # 401d29 <$d.1>
  4012d0:	00000097          	auipc	ra,0x0
  4012d4:	ba8080e7          	jalr	-1112(ra) # 400e78 <printf>
  4012d8:	fff00513          	li	a0,-1
  4012dc:	0840006f          	j	401360 <fat32_cat+0xd8>
        return -1;
    }

    uint32_t lba =
        cluster_to_lba(cluster);
  4012e0:	01012503          	lw	a0,16(sp)
    return -1;
}

uint32_t cluster_to_lba(uint32_t cluster)
{
    return g_fat32.data_begin +
  4012e4:	004025b7          	lui	a1,0x402
  4012e8:	f6858593          	addi	a1,a1,-152 # 401f68 <g_fat32>
           (cluster - 2) *
           g_fat32.sectors_per_cluster;
  4012ec:	0105a603          	lw	a2,16(a1)
    return g_fat32.data_begin +
  4012f0:	0085a583          	lw	a1,8(a1)
           (cluster - 2) *
  4012f4:	ffe50513          	addi	a0,a0,-2
  4012f8:	02a60533          	mul	a0,a2,a0
    return g_fat32.data_begin +
  4012fc:	00b50533          	add	a0,a0,a1
    if (call_sd_read_buf_api(lba, buf))
  401300:	01410593          	addi	a1,sp,20
  401304:	00000097          	auipc	ra,0x0
  401308:	f6c080e7          	jalr	-148(ra) # 401270 <call_sd_read_buf_api>
  40130c:	00050593          	mv	a1,a0
  401310:	fff00513          	li	a0,-1
  401314:	04059663          	bnez	a1,401360 <fat32_cat+0xd8>
  401318:	00c12503          	lw	a0,12(sp)
    for (uint32_t i = 0; i < size; i++) {
  40131c:	02050a63          	beqz	a0,401350 <fat32_cat+0xc8>
  401320:	fff50513          	addi	a0,a0,-1
  401324:	1ff00593          	li	a1,511
  401328:	00b56463          	bltu	a0,a1,401330 <fat32_cat+0xa8>
  40132c:	1ff00513          	li	a0,511
  401330:	01410413          	addi	s0,sp,20
  401334:	00850533          	add	a0,a0,s0
  401338:	00150493          	addi	s1,a0,1
        putchar(buf[i]);
  40133c:	00044503          	lbu	a0,0(s0)
  401340:	00000097          	auipc	ra,0x0
  401344:	a6c080e7          	jalr	-1428(ra) # 400dac <putchar>
    for (uint32_t i = 0; i < size; i++) {
  401348:	00140413          	addi	s0,s0,1
  40134c:	fe9418e3          	bne	s0,s1,40133c <fat32_cat+0xb4>
    putchar('\n');
  401350:	00a00513          	li	a0,10
  401354:	00000097          	auipc	ra,0x0
  401358:	a58080e7          	jalr	-1448(ra) # 400dac <putchar>
  40135c:	00000513          	li	a0,0
  401360:	21c12083          	lw	ra,540(sp)
  401364:	21812403          	lw	s0,536(sp)
  401368:	21412483          	lw	s1,532(sp)
}
  40136c:	22010113          	addi	sp,sp,544
  401370:	00008067          	ret

00401374 <fat32_mount>:
}

int fat32_mount(void)
{
  401374:	ff010113          	addi	sp,sp,-16
  401378:	00112623          	sw	ra,12(sp)
  40137c:	00812423          	sw	s0,8(sp)
  401380:	00912223          	sw	s1,4(sp)
  401384:	01212023          	sw	s2,0(sp)
    uint8_t *buf = fat32_buf;

    if (call_sd_read_buf_api(0, buf))
  401388:	00402537          	lui	a0,0x402
  40138c:	d6850493          	addi	s1,a0,-664 # 401d68 <fat32_buf>
  401390:	00000513          	li	a0,0
  401394:	00048593          	mv	a1,s1
  401398:	00000097          	auipc	ra,0x0
  40139c:	ed8080e7          	jalr	-296(ra) # 401270 <call_sd_read_buf_api>
  4013a0:	fff00413          	li	s0,-1
  4013a4:	0c051e63          	bnez	a0,401480 <fat32_mount+0x10c>
        return -1;

    g_fat32.part_lba =
        ((uint32_t)buf[0x1C6]) |
        ((uint32_t)buf[0x1C7] << 8) |
  4013a8:	1c74c503          	lbu	a0,455(s1)
        ((uint32_t)buf[0x1C6]) |
  4013ac:	1c64c583          	lbu	a1,454(s1)
        ((uint32_t)buf[0x1C8] << 16) |
  4013b0:	1c84c603          	lbu	a2,456(s1)
        ((uint32_t)buf[0x1C9] << 24);
  4013b4:	1c94c683          	lbu	a3,457(s1)
        ((uint32_t)buf[0x1C7] << 8) |
  4013b8:	00851513          	slli	a0,a0,0x8
        ((uint32_t)buf[0x1C6]) |
  4013bc:	00b56533          	or	a0,a0,a1
        ((uint32_t)buf[0x1C8] << 16) |
  4013c0:	01061613          	slli	a2,a2,0x10
        ((uint32_t)buf[0x1C9] << 24);
  4013c4:	01869693          	slli	a3,a3,0x18
        ((uint32_t)buf[0x1C7] << 8) |
  4013c8:	00d66633          	or	a2,a2,a3
        ((uint32_t)buf[0x1C8] << 16) |
  4013cc:	00c56533          	or	a0,a0,a2
    g_fat32.part_lba =
  4013d0:	00402937          	lui	s2,0x402
  4013d4:	f6a92423          	sw	a0,-152(s2) # 401f68 <g_fat32>

    if (call_sd_read_buf_api(g_fat32.part_lba, buf))
  4013d8:	00048593          	mv	a1,s1
  4013dc:	00000097          	auipc	ra,0x0
  4013e0:	e94080e7          	jalr	-364(ra) # 401270 <call_sd_read_buf_api>
  4013e4:	08051e63          	bnez	a0,401480 <fat32_mount+0x10c>
        return -1;

    uint32_t reserved =
        ((uint32_t)buf[14]) |
  4013e8:	00402537          	lui	a0,0x402
  4013ec:	d6850513          	addi	a0,a0,-664 # 401d68 <fat32_buf>
        ((uint32_t)buf[15] << 8);
  4013f0:	00f54583          	lbu	a1,15(a0)
        ((uint32_t)buf[14]) |
  4013f4:	00e54603          	lbu	a2,14(a0)
  4013f8:	00000413          	li	s0,0
        ((uint32_t)buf[15] << 8);
  4013fc:	00859593          	slli	a1,a1,0x8
        ((uint32_t)buf[14]) |
  401400:	00c5e5b3          	or	a1,a1,a2
    uint32_t fat_count =
        (uint32_t)buf[16];

    uint32_t fat_size =
        ((uint32_t)buf[36]) |
        ((uint32_t)buf[37] << 8) |
  401404:	02554603          	lbu	a2,37(a0)
        ((uint32_t)buf[36]) |
  401408:	02454683          	lbu	a3,36(a0)
        ((uint32_t)buf[38] << 16) |
  40140c:	02654703          	lbu	a4,38(a0)
        ((uint32_t)buf[39] << 24);
  401410:	02754783          	lbu	a5,39(a0)
        ((uint32_t)buf[37] << 8) |
  401414:	00861613          	slli	a2,a2,0x8
        ((uint32_t)buf[36]) |
  401418:	00d66633          	or	a2,a2,a3
        ((uint32_t)buf[38] << 16) |
  40141c:	01071713          	slli	a4,a4,0x10
        ((uint32_t)buf[39] << 24);
  401420:	01879793          	slli	a5,a5,0x18

    g_fat32.sectors_per_cluster =
        (uint32_t)buf[13];
  401424:	00d54683          	lbu	a3,13(a0)
        ((uint32_t)buf[37] << 8) |
  401428:	00f76733          	or	a4,a4,a5
        ((uint32_t)buf[38] << 16) |
  40142c:	00e66633          	or	a2,a2,a4
    g_fat32.sectors_per_cluster =
  401430:	f6890713          	addi	a4,s2,-152
  401434:	00d72823          	sw	a3,16(a4)

    g_fat32.root_cluster =
        ((uint32_t)buf[44]) |
        ((uint32_t)buf[45] << 8) |
  401438:	02d54683          	lbu	a3,45(a0)
        ((uint32_t)buf[44]) |
  40143c:	02c54783          	lbu	a5,44(a0)
        ((uint32_t)buf[46] << 16) |
  401440:	02e54803          	lbu	a6,46(a0)
        ((uint32_t)buf[47] << 24);
  401444:	02f54883          	lbu	a7,47(a0)
        ((uint32_t)buf[45] << 8) |
  401448:	00869693          	slli	a3,a3,0x8
        ((uint32_t)buf[44]) |
  40144c:	00f6e6b3          	or	a3,a3,a5
        ((uint32_t)buf[46] << 16) |
  401450:	01081813          	slli	a6,a6,0x10
        ((uint32_t)buf[47] << 24);
  401454:	01889893          	slli	a7,a7,0x18
        ((uint32_t)buf[45] << 8) |
  401458:	011867b3          	or	a5,a6,a7

    g_fat32.fat_begin =
        g_fat32.part_lba + reserved;
  40145c:	f6892803          	lw	a6,-152(s2)
        (uint32_t)buf[16];
  401460:	01054503          	lbu	a0,16(a0)
        ((uint32_t)buf[46] << 16) |
  401464:	00f6e6b3          	or	a3,a3,a5
    g_fat32.root_cluster =
  401468:	00d72623          	sw	a3,12(a4)
        g_fat32.part_lba + reserved;
  40146c:	00b805b3          	add	a1,a6,a1
    g_fat32.fat_begin =
  401470:	00b72223          	sw	a1,4(a4)

    g_fat32.data_begin =
        g_fat32.fat_begin + fat_count * fat_size;
  401474:	02a60533          	mul	a0,a2,a0
  401478:	00a58533          	add	a0,a1,a0
    g_fat32.data_begin =
  40147c:	00a72423          	sw	a0,8(a4)

    return 0;
}
  401480:	00040513          	mv	a0,s0
  401484:	00c12083          	lw	ra,12(sp)
  401488:	00812403          	lw	s0,8(sp)
  40148c:	00412483          	lw	s1,4(sp)
  401490:	00012903          	lw	s2,0(sp)
  401494:	01010113          	addi	sp,sp,16
  401498:	00008067          	ret

0040149c <fat32_find>:
{
  40149c:	fc010113          	addi	sp,sp,-64
  4014a0:	02112e23          	sw	ra,60(sp)
  4014a4:	02812c23          	sw	s0,56(sp)
  4014a8:	02912a23          	sw	s1,52(sp)
  4014ac:	03212823          	sw	s2,48(sp)
  4014b0:	03312623          	sw	s3,44(sp)
  4014b4:	03412423          	sw	s4,40(sp)
  4014b8:	03512223          	sw	s5,36(sp)
  4014bc:	03612023          	sw	s6,32(sp)
  4014c0:	01712e23          	sw	s7,28(sp)
  4014c4:	01812c23          	sw	s8,24(sp)
  4014c8:	01912a23          	sw	s9,20(sp)
  4014cc:	01a12823          	sw	s10,16(sp)
  4014d0:	00060413          	mv	s0,a2
  4014d4:	00058493          	mv	s1,a1
  4014d8:	00050a13          	mv	s4,a0
    if (fat32_mount())
  4014dc:	00000097          	auipc	ra,0x0
  4014e0:	e98080e7          	jalr	-360(ra) # 401374 <fat32_mount>
  4014e4:	fff00913          	li	s2,-1
  4014e8:	02051e63          	bnez	a0,401524 <fat32_find+0x88>
        cluster_to_lba(g_fat32.root_cluster);
  4014ec:	00402537          	lui	a0,0x402
  4014f0:	f6850513          	addi	a0,a0,-152 # 401f68 <g_fat32>
  4014f4:	00c52583          	lw	a1,12(a0)
           g_fat32.sectors_per_cluster;
  4014f8:	01052603          	lw	a2,16(a0)
    return g_fat32.data_begin +
  4014fc:	00852503          	lw	a0,8(a0)
           (cluster - 2) *
  401500:	ffe58593          	addi	a1,a1,-2
  401504:	02b605b3          	mul	a1,a2,a1
    return g_fat32.data_begin +
  401508:	00a58533          	add	a0,a1,a0
    if (call_sd_read_buf_api(root_lba, buf))
  40150c:	004025b7          	lui	a1,0x402
  401510:	d6858993          	addi	s3,a1,-664 # 401d68 <fat32_buf>
  401514:	00098593          	mv	a1,s3
  401518:	00000097          	auipc	ra,0x0
  40151c:	d58080e7          	jalr	-680(ra) # 401270 <call_sd_read_buf_api>
  401520:	04050063          	beqz	a0,401560 <fat32_find+0xc4>
}
  401524:	00090513          	mv	a0,s2
  401528:	03c12083          	lw	ra,60(sp)
  40152c:	03812403          	lw	s0,56(sp)
  401530:	03412483          	lw	s1,52(sp)
  401534:	03012903          	lw	s2,48(sp)
  401538:	02c12983          	lw	s3,44(sp)
  40153c:	02812a03          	lw	s4,40(sp)
  401540:	02412a83          	lw	s5,36(sp)
  401544:	02012b03          	lw	s6,32(sp)
  401548:	01c12b83          	lw	s7,28(sp)
  40154c:	01812c03          	lw	s8,24(sp)
  401550:	01412c83          	lw	s9,20(sp)
  401554:	01012d03          	lw	s10,16(sp)
  401558:	04010113          	addi	sp,sp,64
  40155c:	00008067          	ret
  401560:	01000a93          	li	s5,16
  401564:	0e500b13          	li	s6,229
  401568:	00f00b93          	li	s7,15
  40156c:	02000c13          	li	s8,32
  401570:	00310c93          	addi	s9,sp,3
  401574:	02e00d13          	li	s10,46
  401578:	0380006f          	j	4015b0 <fat32_find+0x114>
                    shortname[k++] = e[j];
  40157c:	00158513          	addi	a0,a1,1
  401580:	00bc85b3          	add	a1,s9,a1
  401584:	00c58023          	sb	a2,0(a1)
        shortname[k] = '\0';
  401588:	00ac8533          	add	a0,s9,a0
  40158c:	00050023          	sb	zero,0(a0)
        if (strcmp(shortname, name) == 0) {
  401590:	00310513          	addi	a0,sp,3
  401594:	000a0593          	mv	a1,s4
  401598:	00000097          	auipc	ra,0x0
  40159c:	8a0080e7          	jalr	-1888(ra) # 400e38 <strcmp>
  4015a0:	14050063          	beqz	a0,4016e0 <fat32_find+0x244>
    for (int i = 0; i < 16; i++) {
  4015a4:	fffa8a93          	addi	s5,s5,-1
  4015a8:	02098993          	addi	s3,s3,32
  4015ac:	f60a8ce3          	beqz	s5,401524 <fat32_find+0x88>
        if (e[0] == 0x00)
  4015b0:	0009c503          	lbu	a0,0(s3)
  4015b4:	ff6508e3          	beq	a0,s6,4015a4 <fat32_find+0x108>
  4015b8:	f60506e3          	beqz	a0,401524 <fat32_find+0x88>
        if (e[11] == 0x0F)
  4015bc:	00b9c583          	lbu	a1,11(s3)
  4015c0:	ff7582e3          	beq	a1,s7,4015a4 <fat32_find+0x108>
            if (e[j] != ' ')
  4015c4:	01851a63          	bne	a0,s8,4015d8 <fat32_find+0x13c>
  4015c8:	00000513          	li	a0,0
  4015cc:	0019c583          	lbu	a1,1(s3)
  4015d0:	01859c63          	bne	a1,s8,4015e8 <fat32_find+0x14c>
  4015d4:	0200006f          	j	4015f4 <fat32_find+0x158>
                shortname[k++] = e[j];
  4015d8:	00a101a3          	sb	a0,3(sp)
  4015dc:	00100513          	li	a0,1
            if (e[j] != ' ')
  4015e0:	0019c583          	lbu	a1,1(s3)
  4015e4:	01858863          	beq	a1,s8,4015f4 <fat32_find+0x158>
                shortname[k++] = e[j];
  4015e8:	00ac8633          	add	a2,s9,a0
  4015ec:	00150513          	addi	a0,a0,1
  4015f0:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  4015f4:	0029c583          	lbu	a1,2(s3)
  4015f8:	03859c63          	bne	a1,s8,401630 <fat32_find+0x194>
  4015fc:	0039c583          	lbu	a1,3(s3)
  401600:	05859263          	bne	a1,s8,401644 <fat32_find+0x1a8>
  401604:	0049c583          	lbu	a1,4(s3)
  401608:	05859863          	bne	a1,s8,401658 <fat32_find+0x1bc>
  40160c:	0059c583          	lbu	a1,5(s3)
  401610:	05859e63          	bne	a1,s8,40166c <fat32_find+0x1d0>
  401614:	0069c583          	lbu	a1,6(s3)
  401618:	07859463          	bne	a1,s8,401680 <fat32_find+0x1e4>
  40161c:	0079c583          	lbu	a1,7(s3)
  401620:	07859a63          	bne	a1,s8,401694 <fat32_find+0x1f8>
        if (e[8] != ' ') {
  401624:	0089c603          	lbu	a2,8(s3)
  401628:	f78600e3          	beq	a2,s8,401588 <fat32_find+0xec>
  40162c:	07c0006f          	j	4016a8 <fat32_find+0x20c>
                shortname[k++] = e[j];
  401630:	00ac8633          	add	a2,s9,a0
  401634:	00150513          	addi	a0,a0,1
  401638:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  40163c:	0039c583          	lbu	a1,3(s3)
  401640:	fd8582e3          	beq	a1,s8,401604 <fat32_find+0x168>
                shortname[k++] = e[j];
  401644:	00ac8633          	add	a2,s9,a0
  401648:	00150513          	addi	a0,a0,1
  40164c:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  401650:	0049c583          	lbu	a1,4(s3)
  401654:	fb858ce3          	beq	a1,s8,40160c <fat32_find+0x170>
                shortname[k++] = e[j];
  401658:	00ac8633          	add	a2,s9,a0
  40165c:	00150513          	addi	a0,a0,1
  401660:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  401664:	0059c583          	lbu	a1,5(s3)
  401668:	fb8586e3          	beq	a1,s8,401614 <fat32_find+0x178>
                shortname[k++] = e[j];
  40166c:	00ac8633          	add	a2,s9,a0
  401670:	00150513          	addi	a0,a0,1
  401674:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  401678:	0069c583          	lbu	a1,6(s3)
  40167c:	fb8580e3          	beq	a1,s8,40161c <fat32_find+0x180>
                shortname[k++] = e[j];
  401680:	00ac8633          	add	a2,s9,a0
  401684:	00150513          	addi	a0,a0,1
  401688:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  40168c:	0079c583          	lbu	a1,7(s3)
  401690:	f9858ae3          	beq	a1,s8,401624 <fat32_find+0x188>
                shortname[k++] = e[j];
  401694:	00ac8633          	add	a2,s9,a0
  401698:	00150513          	addi	a0,a0,1
  40169c:	00b60023          	sb	a1,0(a2)
        if (e[8] != ' ') {
  4016a0:	0089c603          	lbu	a2,8(s3)
  4016a4:	ef8602e3          	beq	a2,s8,401588 <fat32_find+0xec>
                if (e[j] != ' ')
  4016a8:	0099c683          	lbu	a3,9(s3)
            shortname[k++] = '.';
  4016ac:	00ac8733          	add	a4,s9,a0
  4016b0:	01a70023          	sb	s10,0(a4)
                    shortname[k++] = e[j];
  4016b4:	00250593          	addi	a1,a0,2
  4016b8:	00c700a3          	sb	a2,1(a4)
                if (e[j] != ' ')
  4016bc:	01868a63          	beq	a3,s8,4016d0 <fat32_find+0x234>
                    shortname[k++] = e[j];
  4016c0:	00bc85b3          	add	a1,s9,a1
  4016c4:	00350513          	addi	a0,a0,3
  4016c8:	00d58023          	sb	a3,0(a1)
  4016cc:	00050593          	mv	a1,a0
                if (e[j] != ' ')
  4016d0:	00a9c603          	lbu	a2,10(s3)
  4016d4:	eb8614e3          	bne	a2,s8,40157c <fat32_find+0xe0>
  4016d8:	00058513          	mv	a0,a1
  4016dc:	eadff06f          	j	401588 <fat32_find+0xec>
  4016e0:	00000913          	li	s2,0
                ((uint32_t)e[21] << 8);
  4016e4:	0159c503          	lbu	a0,21(s3)
                ((uint32_t)e[20]) |
  4016e8:	0149c583          	lbu	a1,20(s3)
                ((uint32_t)e[26]) |
  4016ec:	01a9c603          	lbu	a2,26(s3)
                ((uint32_t)e[27] << 8);
  4016f0:	01b9c683          	lbu	a3,27(s3)
                (cl_hi << 16) | cl_lo;
  4016f4:	01851513          	slli	a0,a0,0x18
  4016f8:	01059593          	slli	a1,a1,0x10
                ((uint32_t)e[26]) |
  4016fc:	00b56533          	or	a0,a0,a1
                ((uint32_t)e[27] << 8);
  401700:	00869693          	slli	a3,a3,0x8
                (cl_hi << 16) | cl_lo;
  401704:	00d66633          	or	a2,a2,a3
  401708:	00c56533          	or	a0,a0,a2
            *cluster =
  40170c:	00a4a023          	sw	a0,0(s1)
                ((uint32_t)e[29] << 8) |
  401710:	01d9c503          	lbu	a0,29(s3)
                ((uint32_t)e[28]) |
  401714:	01c9c583          	lbu	a1,28(s3)
                ((uint32_t)e[30] << 16) |
  401718:	01e9c603          	lbu	a2,30(s3)
                ((uint32_t)e[31] << 24);
  40171c:	01f9c683          	lbu	a3,31(s3)
                ((uint32_t)e[29] << 8) |
  401720:	00851513          	slli	a0,a0,0x8
                ((uint32_t)e[28]) |
  401724:	00b56533          	or	a0,a0,a1
                ((uint32_t)e[30] << 16) |
  401728:	01061613          	slli	a2,a2,0x10
                ((uint32_t)e[31] << 24);
  40172c:	01869693          	slli	a3,a3,0x18
                ((uint32_t)e[29] << 8) |
  401730:	00d66633          	or	a2,a2,a3
                ((uint32_t)e[30] << 16) |
  401734:	00c56533          	or	a0,a0,a2
            *size =
  401738:	00a42023          	sw	a0,0(s0)
  40173c:	de9ff06f          	j	401524 <fat32_find+0x88>

00401740 <cluster_to_lba>:
    return g_fat32.data_begin +
  401740:	004025b7          	lui	a1,0x402
  401744:	f6858593          	addi	a1,a1,-152 # 401f68 <g_fat32>
           g_fat32.sectors_per_cluster;
  401748:	0105a603          	lw	a2,16(a1)
    return g_fat32.data_begin +
  40174c:	0085a583          	lw	a1,8(a1)
           (cluster - 2) *
  401750:	ffe50513          	addi	a0,a0,-2
  401754:	02a60533          	mul	a0,a2,a0
    return g_fat32.data_begin +
  401758:	00b50533          	add	a0,a0,a1
  40175c:	00008067          	ret

00401760 <fat32_ls>:

void fat32_ls(void)
{
  401760:	fe010113          	addi	sp,sp,-32
  401764:	00112e23          	sw	ra,28(sp)
  401768:	00812c23          	sw	s0,24(sp)
  40176c:	00912a23          	sw	s1,20(sp)
  401770:	01212823          	sw	s2,16(sp)
  401774:	01312623          	sw	s3,12(sp)
  401778:	01412423          	sw	s4,8(sp)
  40177c:	01512223          	sw	s5,4(sp)
  401780:	01612023          	sw	s6,0(sp)
    uint8_t *buf = fat32_buf;

    if (fat32_mount())
  401784:	00000097          	auipc	ra,0x0
  401788:	bf0080e7          	jalr	-1040(ra) # 401374 <fat32_mount>
  40178c:	02051e63          	bnez	a0,4017c8 <fat32_ls+0x68>
        return;

    uint32_t root_lba =
        cluster_to_lba(g_fat32.root_cluster);
  401790:	00402537          	lui	a0,0x402
  401794:	f6850513          	addi	a0,a0,-152 # 401f68 <g_fat32>
  401798:	00c52583          	lw	a1,12(a0)
           g_fat32.sectors_per_cluster;
  40179c:	01052603          	lw	a2,16(a0)
    return g_fat32.data_begin +
  4017a0:	00852503          	lw	a0,8(a0)
           (cluster - 2) *
  4017a4:	ffe58593          	addi	a1,a1,-2
  4017a8:	02b605b3          	mul	a1,a2,a1
    return g_fat32.data_begin +
  4017ac:	00a58533          	add	a0,a1,a0

    if (call_sd_read_buf_api(root_lba, buf))
  4017b0:	004025b7          	lui	a1,0x402
  4017b4:	d6858413          	addi	s0,a1,-664 # 401d68 <fat32_buf>
  4017b8:	00040593          	mv	a1,s0
  4017bc:	00000097          	auipc	ra,0x0
  4017c0:	ab4080e7          	jalr	-1356(ra) # 401270 <call_sd_read_buf_api>
  4017c4:	02050663          	beqz	a0,4017f0 <fat32_ls+0x90>
  4017c8:	01c12083          	lw	ra,28(sp)
  4017cc:	01812403          	lw	s0,24(sp)
  4017d0:	01412483          	lw	s1,20(sp)
  4017d4:	01012903          	lw	s2,16(sp)
  4017d8:	00c12983          	lw	s3,12(sp)
  4017dc:	00812a03          	lw	s4,8(sp)
  4017e0:	00412a83          	lw	s5,4(sp)
  4017e4:	00012b03          	lw	s6,0(sp)
            ((uint32_t)e[30] << 16) |
            ((uint32_t)e[31] << 24);

        printf(" cl=%x size=%x\n", cl, size);
    }
  4017e8:	02010113          	addi	sp,sp,32
  4017ec:	00008067          	ret
  4017f0:	01000993          	li	s3,16
  4017f4:	0e500a13          	li	s4,229
  4017f8:	00f00a93          	li	s5,15
  4017fc:	02000b13          	li	s6,32
  401800:	00402537          	lui	a0,0x402
  401804:	b9050493          	addi	s1,a0,-1136 # 401b90 <__modsi3+0xb8>
  401808:	00402537          	lui	a0,0x402
  40180c:	cc250913          	addi	s2,a0,-830 # 401cc2 <$d.1+0x1f>
  401810:	07c0006f          	j	40188c <fat32_ls+0x12c>
        printf(" attr=%x", (uint32_t)e[11]);
  401814:	00b44583          	lbu	a1,11(s0)
  401818:	00048513          	mv	a0,s1
  40181c:	fffff097          	auipc	ra,0xfffff
  401820:	65c080e7          	jalr	1628(ra) # 400e78 <printf>
            ((uint32_t)e[27] << 8);
  401824:	01b44503          	lbu	a0,27(s0)
            ((uint32_t)e[21] << 8);
  401828:	01544583          	lbu	a1,21(s0)
            ((uint32_t)e[20]) |
  40182c:	01444603          	lbu	a2,20(s0)
            ((uint32_t)e[26]) |
  401830:	01a44683          	lbu	a3,26(s0)
            ((uint32_t)e[27] << 8);
  401834:	00851513          	slli	a0,a0,0x8
            (cl_hi << 16) | cl_lo;
  401838:	01859593          	slli	a1,a1,0x18
  40183c:	01061613          	slli	a2,a2,0x10
            ((uint32_t)e[26]) |
  401840:	00c5e5b3          	or	a1,a1,a2
            (cl_hi << 16) | cl_lo;
  401844:	00a6e533          	or	a0,a3,a0
  401848:	00a5e5b3          	or	a1,a1,a0
            ((uint32_t)e[29] << 8) |
  40184c:	01d44503          	lbu	a0,29(s0)
            ((uint32_t)e[28]) |
  401850:	01c44603          	lbu	a2,28(s0)
            ((uint32_t)e[30] << 16) |
  401854:	01e44683          	lbu	a3,30(s0)
            ((uint32_t)e[31] << 24);
  401858:	01f44703          	lbu	a4,31(s0)
            ((uint32_t)e[29] << 8) |
  40185c:	00851513          	slli	a0,a0,0x8
            ((uint32_t)e[28]) |
  401860:	00c56533          	or	a0,a0,a2
            ((uint32_t)e[30] << 16) |
  401864:	01069693          	slli	a3,a3,0x10
            ((uint32_t)e[31] << 24);
  401868:	01871713          	slli	a4,a4,0x18
            ((uint32_t)e[29] << 8) |
  40186c:	00e6e633          	or	a2,a3,a4
            ((uint32_t)e[30] << 16) |
  401870:	00c56633          	or	a2,a0,a2
        printf(" cl=%x size=%x\n", cl, size);
  401874:	00090513          	mv	a0,s2
  401878:	fffff097          	auipc	ra,0xfffff
  40187c:	600080e7          	jalr	1536(ra) # 400e78 <printf>
    for (int i = 0; i < 16; i++) {
  401880:	fff98993          	addi	s3,s3,-1
  401884:	02040413          	addi	s0,s0,32
  401888:	f40980e3          	beqz	s3,4017c8 <fat32_ls+0x68>
        if (e[0] == 0x00)
  40188c:	00044503          	lbu	a0,0(s0)
  401890:	ff4508e3          	beq	a0,s4,401880 <fat32_ls+0x120>
  401894:	f2050ae3          	beqz	a0,4017c8 <fat32_ls+0x68>
        if (e[11] == 0x0F)
  401898:	00b44583          	lbu	a1,11(s0)
  40189c:	ff5582e3          	beq	a1,s5,401880 <fat32_ls+0x120>
            if (e[j] != ' ')
  4018a0:	05651463          	bne	a0,s6,4018e8 <fat32_ls+0x188>
  4018a4:	00144503          	lbu	a0,1(s0)
  4018a8:	05651863          	bne	a0,s6,4018f8 <fat32_ls+0x198>
  4018ac:	00244503          	lbu	a0,2(s0)
  4018b0:	05651c63          	bne	a0,s6,401908 <fat32_ls+0x1a8>
  4018b4:	00344503          	lbu	a0,3(s0)
  4018b8:	07651063          	bne	a0,s6,401918 <fat32_ls+0x1b8>
  4018bc:	00444503          	lbu	a0,4(s0)
  4018c0:	07651463          	bne	a0,s6,401928 <fat32_ls+0x1c8>
  4018c4:	00544503          	lbu	a0,5(s0)
  4018c8:	07651863          	bne	a0,s6,401938 <fat32_ls+0x1d8>
  4018cc:	00644503          	lbu	a0,6(s0)
  4018d0:	07651c63          	bne	a0,s6,401948 <fat32_ls+0x1e8>
  4018d4:	00744503          	lbu	a0,7(s0)
  4018d8:	09651063          	bne	a0,s6,401958 <fat32_ls+0x1f8>
        if (e[8] != ' ') {
  4018dc:	00844503          	lbu	a0,8(s0)
  4018e0:	f3650ae3          	beq	a0,s6,401814 <fat32_ls+0xb4>
  4018e4:	0840006f          	j	401968 <fat32_ls+0x208>
                putchar(e[j]);
  4018e8:	fffff097          	auipc	ra,0xfffff
  4018ec:	4c4080e7          	jalr	1220(ra) # 400dac <putchar>
            if (e[j] != ' ')
  4018f0:	00144503          	lbu	a0,1(s0)
  4018f4:	fb650ce3          	beq	a0,s6,4018ac <fat32_ls+0x14c>
                putchar(e[j]);
  4018f8:	fffff097          	auipc	ra,0xfffff
  4018fc:	4b4080e7          	jalr	1204(ra) # 400dac <putchar>
            if (e[j] != ' ')
  401900:	00244503          	lbu	a0,2(s0)
  401904:	fb6508e3          	beq	a0,s6,4018b4 <fat32_ls+0x154>
                putchar(e[j]);
  401908:	fffff097          	auipc	ra,0xfffff
  40190c:	4a4080e7          	jalr	1188(ra) # 400dac <putchar>
            if (e[j] != ' ')
  401910:	00344503          	lbu	a0,3(s0)
  401914:	fb6504e3          	beq	a0,s6,4018bc <fat32_ls+0x15c>
                putchar(e[j]);
  401918:	fffff097          	auipc	ra,0xfffff
  40191c:	494080e7          	jalr	1172(ra) # 400dac <putchar>
            if (e[j] != ' ')
  401920:	00444503          	lbu	a0,4(s0)
  401924:	fb6500e3          	beq	a0,s6,4018c4 <fat32_ls+0x164>
                putchar(e[j]);
  401928:	fffff097          	auipc	ra,0xfffff
  40192c:	484080e7          	jalr	1156(ra) # 400dac <putchar>
            if (e[j] != ' ')
  401930:	00544503          	lbu	a0,5(s0)
  401934:	f9650ce3          	beq	a0,s6,4018cc <fat32_ls+0x16c>
                putchar(e[j]);
  401938:	fffff097          	auipc	ra,0xfffff
  40193c:	474080e7          	jalr	1140(ra) # 400dac <putchar>
            if (e[j] != ' ')
  401940:	00644503          	lbu	a0,6(s0)
  401944:	f96508e3          	beq	a0,s6,4018d4 <fat32_ls+0x174>
                putchar(e[j]);
  401948:	fffff097          	auipc	ra,0xfffff
  40194c:	464080e7          	jalr	1124(ra) # 400dac <putchar>
            if (e[j] != ' ')
  401950:	00744503          	lbu	a0,7(s0)
  401954:	f96504e3          	beq	a0,s6,4018dc <fat32_ls+0x17c>
                putchar(e[j]);
  401958:	fffff097          	auipc	ra,0xfffff
  40195c:	454080e7          	jalr	1108(ra) # 400dac <putchar>
        if (e[8] != ' ') {
  401960:	00844503          	lbu	a0,8(s0)
  401964:	eb6508e3          	beq	a0,s6,401814 <fat32_ls+0xb4>
            putchar('.');
  401968:	02e00513          	li	a0,46
  40196c:	fffff097          	auipc	ra,0xfffff
  401970:	440080e7          	jalr	1088(ra) # 400dac <putchar>
                if (e[j] != ' ')
  401974:	00844503          	lbu	a0,8(s0)
  401978:	01651c63          	bne	a0,s6,401990 <fat32_ls+0x230>
  40197c:	00944503          	lbu	a0,9(s0)
  401980:	03651063          	bne	a0,s6,4019a0 <fat32_ls+0x240>
  401984:	00a44503          	lbu	a0,10(s0)
  401988:	e96506e3          	beq	a0,s6,401814 <fat32_ls+0xb4>
  40198c:	0240006f          	j	4019b0 <fat32_ls+0x250>
                    putchar(e[j]);
  401990:	fffff097          	auipc	ra,0xfffff
  401994:	41c080e7          	jalr	1052(ra) # 400dac <putchar>
                if (e[j] != ' ')
  401998:	00944503          	lbu	a0,9(s0)
  40199c:	ff6504e3          	beq	a0,s6,401984 <fat32_ls+0x224>
                    putchar(e[j]);
  4019a0:	fffff097          	auipc	ra,0xfffff
  4019a4:	40c080e7          	jalr	1036(ra) # 400dac <putchar>
                if (e[j] != ' ')
  4019a8:	00a44503          	lbu	a0,10(s0)
  4019ac:	e76504e3          	beq	a0,s6,401814 <fat32_ls+0xb4>
                    putchar(e[j]);
  4019b0:	fffff097          	auipc	ra,0xfffff
  4019b4:	3fc080e7          	jalr	1020(ra) # 400dac <putchar>
  4019b8:	e5dff06f          	j	401814 <fat32_ls+0xb4>

004019bc <__udivsi3>:
  4019bc:	04058a63          	beqz	a1,401a10 <__udivsi3+0x54>
  4019c0:	00000813          	li	a6,0
  4019c4:	00000613          	li	a2,0
  4019c8:	01f00693          	li	a3,31
  4019cc:	00100713          	li	a4,1
  4019d0:	fff00793          	li	a5,-1
  4019d4:	00181813          	slli	a6,a6,0x1
  4019d8:	00d558b3          	srl	a7,a0,a3
  4019dc:	0018f893          	andi	a7,a7,1
  4019e0:	0108e833          	or	a6,a7,a6
  4019e4:	00b838b3          	sltu	a7,a6,a1
  4019e8:	00d712b3          	sll	t0,a4,a3
  4019ec:	fff88893          	addi	a7,a7,-1
  4019f0:	0058f2b3          	and	t0,a7,t0
  4019f4:	00c2e633          	or	a2,t0,a2
  4019f8:	00b8f8b3          	and	a7,a7,a1
  4019fc:	fff68693          	addi	a3,a3,-1
  401a00:	41180833          	sub	a6,a6,a7
  401a04:	fcf698e3          	bne	a3,a5,4019d4 <__udivsi3+0x18>
  401a08:	00060513          	mv	a0,a2
  401a0c:	00008067          	ret
  401a10:	00000513          	li	a0,0
  401a14:	00008067          	ret

00401a18 <__umodsi3>:
  401a18:	00000613          	li	a2,0
  401a1c:	02058a63          	beqz	a1,401a50 <__umodsi3+0x38>
  401a20:	01f00693          	li	a3,31
  401a24:	fff00713          	li	a4,-1
  401a28:	00161613          	slli	a2,a2,0x1
  401a2c:	00d557b3          	srl	a5,a0,a3
  401a30:	0017f793          	andi	a5,a5,1
  401a34:	00c7e633          	or	a2,a5,a2
  401a38:	00b637b3          	sltu	a5,a2,a1
  401a3c:	fff78793          	addi	a5,a5,-1
  401a40:	00b7f7b3          	and	a5,a5,a1
  401a44:	fff68693          	addi	a3,a3,-1
  401a48:	40f60633          	sub	a2,a2,a5
  401a4c:	fce69ee3          	bne	a3,a4,401a28 <__umodsi3+0x10>
  401a50:	00060513          	mv	a0,a2
  401a54:	00008067          	ret

00401a58 <__divsi3>:
  401a58:	06058c63          	beqz	a1,401ad0 <__divsi3+0x78>
  401a5c:	00000293          	li	t0,0
  401a60:	00000613          	li	a2,0
  401a64:	41f55693          	srai	a3,a0,0x1f
  401a68:	00d54733          	xor	a4,a0,a3
  401a6c:	40d706b3          	sub	a3,a4,a3
  401a70:	41f5d713          	srai	a4,a1,0x1f
  401a74:	00e5c7b3          	xor	a5,a1,a4
  401a78:	40e78733          	sub	a4,a5,a4
  401a7c:	01f00793          	li	a5,31
  401a80:	00100813          	li	a6,1
  401a84:	fff00893          	li	a7,-1
  401a88:	00129293          	slli	t0,t0,0x1
  401a8c:	00f6d333          	srl	t1,a3,a5
  401a90:	00137313          	andi	t1,t1,1
  401a94:	005362b3          	or	t0,t1,t0
  401a98:	00e2b333          	sltu	t1,t0,a4
  401a9c:	00f813b3          	sll	t2,a6,a5
  401aa0:	fff30313          	addi	t1,t1,-1
  401aa4:	007373b3          	and	t2,t1,t2
  401aa8:	00c3e633          	or	a2,t2,a2
  401aac:	00e37333          	and	t1,t1,a4
  401ab0:	fff78793          	addi	a5,a5,-1
  401ab4:	406282b3          	sub	t0,t0,t1
  401ab8:	fd1798e3          	bne	a5,a7,401a88 <__divsi3+0x30>
  401abc:	00a5c533          	xor	a0,a1,a0
  401ac0:	00055463          	bgez	a0,401ac8 <__divsi3+0x70>
  401ac4:	40c00633          	neg	a2,a2
  401ac8:	00060513          	mv	a0,a2
  401acc:	00008067          	ret
  401ad0:	00000513          	li	a0,0
  401ad4:	00008067          	ret

00401ad8 <__modsi3>:
  401ad8:	00000613          	li	a2,0
  401adc:	04058a63          	beqz	a1,401b30 <__modsi3+0x58>
  401ae0:	41f55693          	srai	a3,a0,0x1f
  401ae4:	00d54733          	xor	a4,a0,a3
  401ae8:	40d706b3          	sub	a3,a4,a3
  401aec:	41f5d713          	srai	a4,a1,0x1f
  401af0:	00e5c5b3          	xor	a1,a1,a4
  401af4:	40e585b3          	sub	a1,a1,a4
  401af8:	01f00713          	li	a4,31
  401afc:	fff00793          	li	a5,-1
  401b00:	00161613          	slli	a2,a2,0x1
  401b04:	00e6d833          	srl	a6,a3,a4
  401b08:	00187813          	andi	a6,a6,1
  401b0c:	00c86633          	or	a2,a6,a2
  401b10:	00b63833          	sltu	a6,a2,a1
  401b14:	fff80813          	addi	a6,a6,-1
  401b18:	00b87833          	and	a6,a6,a1
  401b1c:	fff70713          	addi	a4,a4,-1
  401b20:	41060633          	sub	a2,a2,a6
  401b24:	fcf71ee3          	bne	a4,a5,401b00 <__modsi3+0x28>
  401b28:	00055463          	bgez	a0,401b30 <__modsi3+0x58>
  401b2c:	40c00633          	neg	a2,a2
  401b30:	00060513          	mv	a0,a2
  401b34:	00008067          	ret

セクション .rodata の逆アセンブル:

00401b38 <$d.1-0x16b>:
  401b38:	7375                	.insn	2, 0x7375
  401b3a:	6761                	.insn	2, 0x6761
  401b3c:	3a65                	.insn	2, 0x3a65
  401b3e:	6620                	.insn	2, 0x6620
  401b40:	7461                	.insn	2, 0x7461
  401b42:	635f3233          	.insn	4, 0x635f3233
  401b46:	7461                	.insn	2, 0x7461
  401b48:	3c20                	.insn	2, 0x3c20
  401b4a:	6966                	.insn	2, 0x6966
  401b4c:	656c                	.insn	2, 0x656c
  401b4e:	0a3e                	.insn	2, 0x0a3e
  401b50:	5300                	.insn	2, 0x5300
  401b52:	70203257          	.insn	4, 0x70203257
  401b56:	6572                	.insn	2, 0x6572
  401b58:	64657373          	csrrci	t1,hviprio1,10
  401b5c:	000a                	.insn	2, 0x000a
  401b5e:	6166                	.insn	2, 0x6166
  401b60:	3374                	.insn	2, 0x3374
  401b62:	5f32                	.insn	2, 0x5f32
  401b64:	736c                	.insn	2, 0x736c
  401b66:	6600                	.insn	2, 0x6600
  401b68:	7461                	.insn	2, 0x7461
  401b6a:	635f3233          	.insn	4, 0x635f3233
  401b6e:	7461                	.insn	2, 0x7461
  401b70:	7300                	.insn	2, 0x7300
  401b72:	5f64                	.insn	2, 0x5f64
  401b74:	74636573          	csrrsi	a0,0x746,6
  401b78:	7720726f          	jal	tp,4092ea <__user_stack_start+0x636a>
  401b7c:	6972                	.insn	2, 0x6972
  401b7e:	6574                	.insn	2, 0x6574
  401b80:	7320                	.insn	2, 0x7320
  401b82:	6365                	.insn	2, 0x6365
  401b84:	6f74                	.insn	2, 0x6f74
  401b86:	2072                	.insn	2, 0x2072
  401b88:	203c                	.insn	2, 0x203c
  401b8a:	3035                	.insn	2, 0x3035
  401b8c:	3030                	.insn	2, 0x3030
  401b8e:	000a                	.insn	2, 0x000a
  401b90:	6120                	.insn	2, 0x6120
  401b92:	7474                	.insn	2, 0x7474
  401b94:	3d72                	.insn	2, 0x3d72
  401b96:	7825                	.insn	2, 0x7825
  401b98:	7300                	.insn	2, 0x7300
  401b9a:	5f64                	.insn	2, 0x5f64
  401b9c:	6572                	.insn	2, 0x6572
  401b9e:	6461                	.insn	2, 0x6461
  401ba0:	7300                	.insn	2, 0x7300
  401ba2:	5f64                	.insn	2, 0x5f64
  401ba4:	74697277          	.insn	4, 0x74697277
  401ba8:	0065                	.insn	2, 0x0065
  401baa:	666c6573          	csrrsi	a0,0x666,24
  401bae:	745f 7365 0074      	.insn	6, 0x00747365745f
  401bb4:	6548                	.insn	2, 0x6548
  401bb6:	6c6c                	.insn	2, 0x6c6c
  401bb8:	6f77206f          	j	474aae <__user_stack_top+0x51b2e>
  401bbc:	6c72                	.insn	2, 0x6c72
  401bbe:	2064                	.insn	2, 0x2064
  401bc0:	7266                	.insn	2, 0x7266
  401bc2:	73206d6f          	jal	s10,4082f4 <__user_stack_start+0x5374>
  401bc6:	6568                	.insn	2, 0x6568
  401bc8:	6c6c                	.insn	2, 0x6c6c
  401bca:	0a21                	.insn	2, 0x0a21
  401bcc:	7000                	.insn	2, 0x7000
  401bce:	6972                	.insn	2, 0x6972
  401bd0:	656d                	.insn	2, 0x656d
  401bd2:	6e750073          	.insn	4, 0x6e750073
  401bd6:	776f6e6b          	.insn	4, 0x776f6e6b
  401bda:	206e                	.insn	2, 0x206e
  401bdc:	6d6d6f63          	bltu	s10,s6,4022ba <__user_stack_bottom+0x33a>
  401be0:	6e61                	.insn	2, 0x6e61
  401be2:	3a64                	.insn	2, 0x3a64
  401be4:	2520                	.insn	2, 0x2520
  401be6:	74000a73          	.insn	4, 0x74000a73
  401bea:	6c61746f          	jal	s0,4192b0 <__user_stack_start+0x16330>
  401bee:	7020                	.insn	2, 0x7020
  401bf0:	6972                	.insn	2, 0x6972
  401bf2:	656d                	.insn	2, 0x656d
  401bf4:	25203a73          	csrrc	s4,vsireg2,zero
  401bf8:	2064                	.insn	2, 0x2064
  401bfa:	3028                	.insn	2, 0x3028
  401bfc:	2e2e                	.insn	2, 0x2e2e
  401bfe:	6425                	.insn	2, 0x6425
  401c00:	0a29                	.insn	2, 0x0a29
  401c02:	7300                	.insn	2, 0x7300
  401c04:	5f61                	.insn	2, 0x5f61
  401c06:	72617473          	csrrci	s0,mhpmevent6h,2
  401c0a:	0074                	.insn	2, 0x0074
  401c0c:	6166                	.insn	2, 0x6166
  401c0e:	3374                	.insn	2, 0x3374
  401c10:	5f32                	.insn	2, 0x5f32
  401c12:	6e69                	.insn	2, 0x6e69
  401c14:	6f66                	.insn	2, 0x6f66
  401c16:	6800                	.insn	2, 0x6800
  401c18:	6c65                	.insn	2, 0x6c65
  401c1a:	6f6c                	.insn	2, 0x6f6c
  401c1c:	5300                	.insn	2, 0x5300
  401c1e:	70203157          	.insn	4, 0x70203157
  401c22:	6572                	.insn	2, 0x6572
  401c24:	64657373          	csrrci	t1,hviprio1,10
  401c28:	000a                	.insn	2, 0x000a
  401c2a:	616d                	.insn	2, 0x616d
  401c2c:	7274                	.insn	2, 0x7274
  401c2e:	7869                	.insn	2, 0x7869
  401c30:	7320                	.insn	2, 0x7320
  401c32:	7a69                	.insn	2, 0x7a69
  401c34:	2065                	.insn	2, 0x2065
  401c36:	203e                	.insn	2, 0x203e
  401c38:	0a34                	.insn	2, 0x0a34
  401c3a:	6300                	.insn	2, 0x6300
  401c3c:	616d6d6f          	jal	s10,4d8252 <__user_stack_top+0xb52d2>
  401c40:	646e                	.insn	2, 0x646e
  401c42:	000a3a73          	csrrc	s4,0x0,s4
  401c46:	4146                	.insn	2, 0x4146
  401c48:	3354                	.insn	2, 0x3354
  401c4a:	2032                	.insn	2, 0x2032
  401c4c:	6f6d                	.insn	2, 0x6f6d
  401c4e:	6e75                	.insn	2, 0x6e75
  401c50:	2074                	.insn	2, 0x2074
  401c52:	6166                	.insn	2, 0x6166
  401c54:	6c69                	.insn	2, 0x6c69
  401c56:	6465                	.insn	2, 0x6465
  401c58:	000a                	.insn	2, 0x000a
  401c5a:	6164                	.insn	2, 0x6164
  401c5c:	6174                	.insn	2, 0x6174
  401c5e:	625f 6765 6e69      	.insn	6, 0x6e696765625f
  401c64:	253d                	.insn	2, 0x253d
  401c66:	0a78                	.insn	2, 0x0a78
  401c68:	7500                	.insn	2, 0x7500
  401c6a:	65676173          	csrrsi	sp,hviprio1h,14
  401c6e:	203a                	.insn	2, 0x203a
  401c70:	696d                	.insn	2, 0x696d
  401c72:	65725f63          	bge	tp,s7,4022d0 <__user_stack_bottom+0x350>
  401c76:	6461                	.insn	2, 0x6461
  401c78:	3c20                	.insn	2, 0x3c20
  401c7a:	6e756f63          	bltu	a0,t2,402378 <__user_stack_bottom+0x3f8>
  401c7e:	3e74                	.insn	2, 0x3e74
  401c80:	000a                	.insn	2, 0x000a
  401c82:	6568                	.insn	2, 0x6568
  401c84:	706c                	.insn	2, 0x706c
  401c86:	6d00                	.insn	2, 0x6d00
  401c88:	6369                	.insn	2, 0x6369
  401c8a:	725f 6165 0064      	.insn	6, 0x00646165725f
  401c90:	6f72                	.insn	2, 0x6f72
  401c92:	635f746f          	jal	s0,4f9ac6 <__user_stack_top+0xd6b46>
  401c96:	756c                	.insn	2, 0x756c
  401c98:	72657473          	csrrci	s0,mhpmevent6h,10
  401c9c:	253d                	.insn	2, 0x253d
  401c9e:	0a78                	.insn	2, 0x0a78
  401ca0:	7100                	.insn	2, 0x7100
	...

00401ca3 <$d.1>:
  401ca3:	6c656873          	csrrsi	a6,0x6c6,10
  401ca7:	206c                	.insn	2, 0x206c
  401ca9:	72617473          	csrrci	s0,mhpmevent6h,2
  401cad:	2e74                	.insn	2, 0x2e74
  401caf:	000a                	.insn	2, 0x000a
  401cb1:	7564                	.insn	2, 0x7564
  401cb3:	706d                	.insn	2, 0x706d
  401cb5:	7300                	.insn	2, 0x7300
  401cb7:	6370                	.insn	2, 0x6370
  401cb9:	253d                	.insn	2, 0x253d
  401cbb:	0a78                	.insn	2, 0x0a78
  401cbd:	2500                	.insn	2, 0x2500
  401cbf:	2064                	.insn	2, 0x2064
  401cc1:	2000                	.insn	2, 0x2000
  401cc3:	253d6c63          	bltu	s10,s3,401f1b <fat32_buf+0x1b3>
  401cc7:	2078                	.insn	2, 0x2078
  401cc9:	657a6973          	csrrsi	s2,hviprio2h,20
  401ccd:	253d                	.insn	2, 0x253d
  401ccf:	0a78                	.insn	2, 0x0a78
  401cd1:	6600                	.insn	2, 0x6600
  401cd3:	7461                	.insn	2, 0x7461
  401cd5:	625f 6765 6e69      	.insn	6, 0x6e696765625f
  401cdb:	253d                	.insn	2, 0x253d
  401cdd:	0a78                	.insn	2, 0x0a78
	...

00401ce0 <$d.2>:
  401ce0:	3130                	.insn	2, 0x3130
  401ce2:	3332                	.insn	2, 0x3332
  401ce4:	3534                	.insn	2, 0x3534
  401ce6:	3736                	.insn	2, 0x3736
  401ce8:	3938                	.insn	2, 0x3938
  401cea:	6261                	.insn	2, 0x6261
  401cec:	66656463          	bltu	a0,t1,402354 <__user_stack_bottom+0x3d4>
  401cf0:	7500                	.insn	2, 0x7500
  401cf2:	65676173          	csrrsi	sp,hviprio1h,14
  401cf6:	203a                	.insn	2, 0x203a
  401cf8:	725f6473          	csrrsi	s0,mhpmevent5h,30
  401cfc:	6165                	.insn	2, 0x6165
  401cfe:	2064                	.insn	2, 0x2064
  401d00:	733c                	.insn	2, 0x733c
  401d02:	6365                	.insn	2, 0x6365
  401d04:	6f74                	.insn	2, 0x6f74
  401d06:	3e72                	.insn	2, 0x3e72
  401d08:	000a                	.insn	2, 0x000a
  401d0a:	616d                	.insn	2, 0x616d
  401d0c:	2078                	.insn	2, 0x2078
  401d0e:	6f74                	.insn	2, 0x6f74
  401d10:	616c206f          	j	4c4326 <__user_stack_top+0xa13a6>
  401d14:	6772                	.insn	2, 0x6772
  401d16:	2065                	.insn	2, 0x2065
  401d18:	3c28                	.insn	2, 0x3c28
  401d1a:	313d                	.insn	2, 0x313d
  401d1c:	3030                	.insn	2, 0x3030
  401d1e:	3030                	.insn	2, 0x3030
  401d20:	2930                	.insn	2, 0x2930
  401d22:	000a                	.insn	2, 0x000a
  401d24:	7571                	.insn	2, 0x7571
  401d26:	7469                	.insn	2, 0x7469
	...

00401d29 <$d.1>:
  401d29:	6966                	.insn	2, 0x6966
  401d2b:	656c                	.insn	2, 0x656c
  401d2d:	6e20                	.insn	2, 0x6e20
  401d2f:	6620746f          	jal	s0,409391 <__user_stack_start+0x6411>
  401d33:	646e756f          	jal	a0,4e9379 <__user_stack_top+0xc63f9>
  401d37:	000a                	.insn	2, 0x000a
  401d39:	7375                	.insn	2, 0x7375
  401d3b:	6761                	.insn	2, 0x6761
  401d3d:	3a65                	.insn	2, 0x3a65
  401d3f:	7320                	.insn	2, 0x7320
  401d41:	5f64                	.insn	2, 0x5f64
  401d43:	74697277          	.insn	4, 0x74697277
  401d47:	2065                	.insn	2, 0x2065
  401d49:	733c                	.insn	2, 0x733c
  401d4b:	6365                	.insn	2, 0x6365
  401d4d:	6f74                	.insn	2, 0x6f74
  401d4f:	3e72                	.insn	2, 0x3e72
  401d51:	000a                	.insn	2, 0x000a
  401d53:	6170                	.insn	2, 0x6170
  401d55:	7472                	.insn	2, 0x7472
  401d57:	6c5f 6162 253d      	.insn	6, 0x253d61626c5f
  401d5d:	0a78                	.insn	2, 0x0a78
  401d5f:	6500                	.insn	2, 0x6500
  401d61:	6978                	.insn	2, 0x6978
  401d63:	0074                	.insn	2, 0x0074

セクション .debug_loc の逆アセンブル:

00000000 <$d.2>:
       0:	0048                	.insn	2, 0x0048
       2:	0000                	.insn	2, 0x0000
       4:	0200                	.insn	2, 0x0200
       6:	0000                	.insn	2, 0x0000
       8:	0002                	.insn	2, 0x0002
       a:	9f30                	.insn	2, 0x9f30
       c:	0200                	.insn	2, 0x0200
       e:	0000                	.insn	2, 0x0000
      10:	08ec                	.insn	2, 0x08ec
      12:	0000                	.insn	2, 0x0000
      14:	0001                	.insn	2, 0x0001
      16:	0069                	.insn	2, 0x0069
	...
      20:	0002                	.insn	2, 0x0002
      22:	0c00                	.insn	2, 0x0c00
      24:	0002                	.insn	2, 0x0002
      26:	0100                	.insn	2, 0x0100
      28:	6600                	.insn	2, 0x6600
      2a:	0404                	.insn	2, 0x0404
      2c:	0000                	.insn	2, 0x0000
      2e:	0408                	.insn	2, 0x0408
      30:	0000                	.insn	2, 0x0000
      32:	0001                	.insn	2, 0x0001
      34:	0004086b          	.insn	4, 0x0004086b
      38:	ec00                	.insn	2, 0xec00
      3a:	0005                	.insn	2, 0x0005
      3c:	0100                	.insn	2, 0x0100
      3e:	6600                	.insn	2, 0x6600
      40:	060c                	.insn	2, 0x060c
      42:	0000                	.insn	2, 0x0000
      44:	0884                	.insn	2, 0x0884
      46:	0000                	.insn	2, 0x0000
      48:	0001                	.insn	2, 0x0001
      4a:	d466                	.insn	2, 0xd466
      4c:	0008                	.insn	2, 0x0008
      4e:	ec00                	.insn	2, 0xec00
      50:	0008                	.insn	2, 0x0008
      52:	0100                	.insn	2, 0x0100
      54:	6600                	.insn	2, 0x6600
	...
      5e:	02d8                	.insn	2, 0x02d8
      60:	0000                	.insn	2, 0x0000
      62:	02fc                	.insn	2, 0x02fc
      64:	0000                	.insn	2, 0x0000
      66:	00110003          	lb	zero,1(sp)
      6a:	049f 0003 b400      	.insn	6, 0xb4000003049f
      70:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
      74:	6600                	.insn	2, 0x6600
      76:	03c8                	.insn	2, 0x03c8
      78:	0000                	.insn	2, 0x0000
      7a:	03d8                	.insn	2, 0x03d8
      7c:	0000                	.insn	2, 0x0000
      7e:	0001                	.insn	2, 0x0001
      80:	ec66                	.insn	2, 0xec66
      82:	0005                	.insn	2, 0x0005
      84:	0c00                	.insn	2, 0x0c00
      86:	0006                	.insn	2, 0x0006
      88:	0100                	.insn	2, 0x0100
      8a:	6600                	.insn	2, 0x6600
	...
      94:	02e4                	.insn	2, 0x02e4
      96:	0000                	.insn	2, 0x0000
      98:	0304                	.insn	2, 0x0304
      9a:	0000                	.insn	2, 0x0000
      9c:	0005                	.insn	2, 0x0005
      9e:	007a                	.insn	2, 0x007a
      a0:	049f1a33          	.insn	4, 0x049f1a33
      a4:	a8000003          	lb	zero,-1408(zero) # fffffa80 <USER_MAX+0xffaffa80>
      a8:	05000003          	lb	zero,80(zero) # 50 <$d.2+0x50>
      ac:	8a00                	.insn	2, 0x8a00
      ae:	3300                	.insn	2, 0x3300
      b0:	9f1a                	.insn	2, 0x9f1a
      b2:	03a8                	.insn	2, 0x03a8
      b4:	0000                	.insn	2, 0x0000
      b6:	03b8                	.insn	2, 0x03b8
      b8:	0000                	.insn	2, 0x0000
      ba:	0005                	.insn	2, 0x0005
      bc:	007a                	.insn	2, 0x007a
      be:	c89f1a33          	.insn	4, 0xc89f1a33
      c2:	d8000003          	lb	zero,-640(zero) # fffffd80 <USER_MAX+0xffaffd80>
      c6:	05000003          	lb	zero,80(zero) # 50 <$d.2+0x50>
      ca:	8a00                	.insn	2, 0x8a00
      cc:	3300                	.insn	2, 0x3300
      ce:	9f1a                	.insn	2, 0x9f1a
      d0:	05ec                	.insn	2, 0x05ec
      d2:	0000                	.insn	2, 0x0000
      d4:	060c                	.insn	2, 0x060c
      d6:	0000                	.insn	2, 0x0000
      d8:	0005                	.insn	2, 0x0005
      da:	008a                	.insn	2, 0x008a
      dc:	009f1a33          	sll	s4,t5,s1
      e0:	0000                	.insn	2, 0x0000
      e2:	0000                	.insn	2, 0x0000
      e4:	0000                	.insn	2, 0x0000
      e6:	1c00                	.insn	2, 0x1c00
      e8:	48000003          	lb	zero,1152(zero) # 480 <$d.6+0x1f0>
      ec:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
      f0:	5a00                	.insn	2, 0x5a00
      f2:	0364                	.insn	2, 0x0364
      f4:	0000                	.insn	2, 0x0000
      f6:	0390                	.insn	2, 0x0390
      f8:	0000                	.insn	2, 0x0000
      fa:	0001                	.insn	2, 0x0001
      fc:	ec5a                	.insn	2, 0xec5a
      fe:	0005                	.insn	2, 0x0005
     100:	f000                	.insn	2, 0xf000
     102:	0005                	.insn	2, 0x0005
     104:	0100                	.insn	2, 0x0100
     106:	5a00                	.insn	2, 0x5a00
	...
     110:	03e0                	.insn	2, 0x03e0
     112:	0000                	.insn	2, 0x0000
     114:	03fc                	.insn	2, 0x03fc
     116:	0000                	.insn	2, 0x0000
     118:	0001                	.insn	2, 0x0001
     11a:	045a                	.insn	2, 0x045a
     11c:	0004                	.insn	2, 0x0004
     11e:	3c00                	.insn	2, 0x3c00
     120:	0004                	.insn	2, 0x0004
     122:	0100                	.insn	2, 0x0100
     124:	5b00                	.insn	2, 0x5b00
     126:	043c                	.insn	2, 0x043c
     128:	0000                	.insn	2, 0x0000
     12a:	0444                	.insn	2, 0x0444
     12c:	0000                	.insn	2, 0x0000
     12e:	017b0003          	lb	zero,23(s6)
     132:	009f 0000 0000      	.insn	6, 0x009f
     138:	0000                	.insn	2, 0x0000
     13a:	a000                	.insn	2, 0xa000
     13c:	0005                	.insn	2, 0x0005
     13e:	ec00                	.insn	2, 0xec00
     140:	0005                	.insn	2, 0x0005
     142:	0600                	.insn	2, 0x0600
     144:	1000                	.insn	2, 0x1000
     146:	8080                	.insn	2, 0x8080
     148:	0180                	.insn	2, 0x0180
     14a:	309f 0006 4800      	.insn	6, 0x48000006309f
     150:	0006                	.insn	2, 0x0006
     152:	0600                	.insn	2, 0x0600
     154:	1000                	.insn	2, 0x1000
     156:	8080                	.insn	2, 0x8080
     158:	0180                	.insn	2, 0x0180
     15a:	b09f 0006 0800      	.insn	6, 0x08000006b09f
     160:	06000007          	.insn	4, 0x06000007
     164:	1000                	.insn	2, 0x1000
     166:	8080                	.insn	2, 0x8080
     168:	0180                	.insn	2, 0x0180
     16a:	089f 0007 5c00      	.insn	6, 0x5c000007089f
     170:	01000007          	.insn	4, 0x01000007
     174:	5a00                	.insn	2, 0x5a00
     176:	07d0                	.insn	2, 0x07d0
     178:	0000                	.insn	2, 0x0000
     17a:	0830                	.insn	2, 0x0830
     17c:	0000                	.insn	2, 0x0000
     17e:	0001                	.insn	2, 0x0001
     180:	005a                	.insn	2, 0x005a
     182:	0000                	.insn	2, 0x0000
     184:	0000                	.insn	2, 0x0000
     186:	0000                	.insn	2, 0x0000
     188:	a000                	.insn	2, 0xa000
     18a:	0005                	.insn	2, 0x0005
     18c:	ec00                	.insn	2, 0xec00
     18e:	0005                	.insn	2, 0x0005
     190:	0400                	.insn	2, 0x0400
     192:	1000                	.insn	2, 0x1000
     194:	0280                	.insn	2, 0x0280
     196:	349f 0006 3c00      	.insn	6, 0x3c000006349f
     19c:	0006                	.insn	2, 0x0006
     19e:	0100                	.insn	2, 0x0100
     1a0:	5b00                	.insn	2, 0x5b00
     1a2:	0640                	.insn	2, 0x0640
     1a4:	0000                	.insn	2, 0x0000
     1a6:	0648                	.insn	2, 0x0648
     1a8:	0000                	.insn	2, 0x0000
     1aa:	0004                	.insn	2, 0x0004
     1ac:	8010                	.insn	2, 0x8010
     1ae:	9f02                	.insn	2, 0x9f02
     1b0:	06b0                	.insn	2, 0x06b0
     1b2:	0000                	.insn	2, 0x0000
     1b4:	075c                	.insn	2, 0x075c
     1b6:	0000                	.insn	2, 0x0000
     1b8:	0004                	.insn	2, 0x0004
     1ba:	8010                	.insn	2, 0x8010
     1bc:	9f02                	.insn	2, 0x9f02
     1be:	07d0                	.insn	2, 0x07d0
     1c0:	0000                	.insn	2, 0x0000
     1c2:	0828                	.insn	2, 0x0828
     1c4:	0000                	.insn	2, 0x0000
     1c6:	0004                	.insn	2, 0x0004
     1c8:	8010                	.insn	2, 0x8010
     1ca:	9f02                	.insn	2, 0x9f02
     1cc:	0828                	.insn	2, 0x0828
     1ce:	0000                	.insn	2, 0x0000
     1d0:	0830                	.insn	2, 0x0830
     1d2:	0000                	.insn	2, 0x0000
     1d4:	0001                	.insn	2, 0x0001
     1d6:	0000005b          	.insn	4, 0x005b
     1da:	0000                	.insn	2, 0x0000
     1dc:	0000                	.insn	2, 0x0000
     1de:	ac00                	.insn	2, 0xac00
     1e0:	0005                	.insn	2, 0x0005
     1e2:	ec00                	.insn	2, 0xec00
     1e4:	0005                	.insn	2, 0x0005
     1e6:	0200                	.insn	2, 0x0200
     1e8:	3000                	.insn	2, 0x3000
     1ea:	409f 0006 4800      	.insn	6, 0x48000006409f
     1f0:	0006                	.insn	2, 0x0006
     1f2:	0200                	.insn	2, 0x0200
     1f4:	3000                	.insn	2, 0x3000
     1f6:	b09f 0006 bc00      	.insn	6, 0xbc000006b09f
     1fc:	0006                	.insn	2, 0x0006
     1fe:	0200                	.insn	2, 0x0200
     200:	3000                	.insn	2, 0x3000
     202:	bc9f 0006 cc00      	.insn	6, 0xcc000006bc9f
     208:	0006                	.insn	2, 0x0006
     20a:	0100                	.insn	2, 0x0100
     20c:	5a00                	.insn	2, 0x5a00
     20e:	06d0                	.insn	2, 0x06d0
     210:	0000                	.insn	2, 0x0000
     212:	0708                	.insn	2, 0x0708
     214:	0000                	.insn	2, 0x0000
     216:	0001                	.insn	2, 0x0001
     218:	005a                	.insn	2, 0x005a
     21a:	0000                	.insn	2, 0x0000
     21c:	0000                	.insn	2, 0x0000
     21e:	0000                	.insn	2, 0x0000
     220:	ac00                	.insn	2, 0xac00
     222:	0005                	.insn	2, 0x0005
     224:	b000                	.insn	2, 0xb000
     226:	0005                	.insn	2, 0x0005
     228:	0100                	.insn	2, 0x0100
     22a:	5d00                	.insn	2, 0x5d00
     22c:	05b8                	.insn	2, 0x05b8
     22e:	0000                	.insn	2, 0x0000
     230:	05bc                	.insn	2, 0x05bc
     232:	0000                	.insn	2, 0x0000
     234:	7f7d0003          	lb	zero,2039(s10)
     238:	bc9f 0005 e000      	.insn	6, 0xe0000005bc9f
     23e:	0005                	.insn	2, 0x0005
     240:	0300                	.insn	2, 0x0300
     242:	7d00                	.insn	2, 0x7d00
     244:	9f7e                	.insn	2, 0x9f7e
     246:	05e4                	.insn	2, 0x05e4
     248:	0000                	.insn	2, 0x0000
     24a:	05ec                	.insn	2, 0x05ec
     24c:	0000                	.insn	2, 0x0000
     24e:	0001                	.insn	2, 0x0001
     250:	445d                	.insn	2, 0x445d
     252:	0006                	.insn	2, 0x0006
     254:	4800                	.insn	2, 0x4800
     256:	0006                	.insn	2, 0x0006
     258:	0100                	.insn	2, 0x0100
     25a:	5d00                	.insn	2, 0x5d00
     25c:	06bc                	.insn	2, 0x06bc
     25e:	0000                	.insn	2, 0x0000
     260:	06d4                	.insn	2, 0x06d4
     262:	0000                	.insn	2, 0x0000
     264:	0001                	.insn	2, 0x0001
     266:	d85d                	.insn	2, 0xd85d
     268:	0006                	.insn	2, 0x0006
     26a:	0800                	.insn	2, 0x0800
     26c:	01000007          	.insn	4, 0x01000007
     270:	5d00                	.insn	2, 0x5d00
	...
     27a:	060c                	.insn	2, 0x060c
     27c:	0000                	.insn	2, 0x0000
     27e:	0620                	.insn	2, 0x0620
     280:	0000                	.insn	2, 0x0000
     282:	0004                	.insn	2, 0x0004
     284:	e810                	.insn	2, 0xe810
     286:	06209f07          	.insn	4, 0x06209f07
     28a:	0000                	.insn	2, 0x0000
     28c:	0630                	.insn	2, 0x0630
     28e:	0000                	.insn	2, 0x0000
     290:	0001                	.insn	2, 0x0001
     292:	0006785b          	.insn	4, 0x0006785b
     296:	8400                	.insn	2, 0x8400
     298:	0006                	.insn	2, 0x0006
     29a:	0100                	.insn	2, 0x0100
     29c:	5b00                	.insn	2, 0x5b00
	...
     2a6:	0650                	.insn	2, 0x0650
     2a8:	0000                	.insn	2, 0x0000
     2aa:	0664                	.insn	2, 0x0664
     2ac:	0000                	.insn	2, 0x0000
     2ae:	0002                	.insn	2, 0x0002
     2b0:	9f34                	.insn	2, 0x9f34
     2b2:	0664                	.insn	2, 0x0664
     2b4:	0000                	.insn	2, 0x0000
     2b6:	0674                	.insn	2, 0x0674
     2b8:	0000                	.insn	2, 0x0000
     2ba:	0001                	.insn	2, 0x0001
     2bc:	0007805b          	.insn	4, 0x0007805b
     2c0:	8c00                	.insn	2, 0x8c00
     2c2:	01000007          	.insn	4, 0x01000007
     2c6:	5b00                	.insn	2, 0x5b00
	...
     2d0:	069c                	.insn	2, 0x069c
     2d2:	0000                	.insn	2, 0x0000
     2d4:	06a4                	.insn	2, 0x06a4
     2d6:	0000                	.insn	2, 0x0000
     2d8:	0001                	.insn	2, 0x0001
     2da:	005a                	.insn	2, 0x005a
     2dc:	0000                	.insn	2, 0x0000
     2de:	0000                	.insn	2, 0x0000
     2e0:	0000                	.insn	2, 0x0000
     2e2:	bc00                	.insn	2, 0xbc00
     2e4:	0006                	.insn	2, 0x0006
     2e6:	c400                	.insn	2, 0xc400
     2e8:	0006                	.insn	2, 0x0006
     2ea:	0100                	.insn	2, 0x0100
     2ec:	5c00                	.insn	2, 0x5c00
     2ee:	06d8                	.insn	2, 0x06d8
     2f0:	0000                	.insn	2, 0x0000
     2f2:	0708                	.insn	2, 0x0708
     2f4:	0000                	.insn	2, 0x0000
     2f6:	0001                	.insn	2, 0x0001
     2f8:	005c                	.insn	2, 0x005c
     2fa:	0000                	.insn	2, 0x0000
     2fc:	0000                	.insn	2, 0x0000
     2fe:	0000                	.insn	2, 0x0000
     300:	c800                	.insn	2, 0xc800
     302:	0006                	.insn	2, 0x0006
     304:	d800                	.insn	2, 0xd800
     306:	0006                	.insn	2, 0x0006
     308:	0100                	.insn	2, 0x0100
     30a:	5e00                	.insn	2, 0x5e00
	...
     314:	0714                	.insn	2, 0x0714
     316:	0000                	.insn	2, 0x0000
     318:	075c                	.insn	2, 0x075c
     31a:	0000                	.insn	2, 0x0000
     31c:	0002                	.insn	2, 0x0002
     31e:	9f30                	.insn	2, 0x9f30
     320:	07d0                	.insn	2, 0x07d0
     322:	0000                	.insn	2, 0x0000
     324:	07dc                	.insn	2, 0x07dc
     326:	0000                	.insn	2, 0x0000
     328:	0002                	.insn	2, 0x0002
     32a:	9f30                	.insn	2, 0x9f30
     32c:	07dc                	.insn	2, 0x07dc
     32e:	0000                	.insn	2, 0x0000
     330:	07ec                	.insn	2, 0x07ec
     332:	0000                	.insn	2, 0x0000
     334:	0001                	.insn	2, 0x0001
     336:	0007f05b          	.insn	4, 0x0007f05b
     33a:	2800                	.insn	2, 0x2800
     33c:	0008                	.insn	2, 0x0008
     33e:	0100                	.insn	2, 0x0100
     340:	5b00                	.insn	2, 0x5b00
	...
     34a:	0714                	.insn	2, 0x0714
     34c:	0000                	.insn	2, 0x0000
     34e:	0718                	.insn	2, 0x0718
     350:	0000                	.insn	2, 0x0000
     352:	0001                	.insn	2, 0x0001
     354:	1c5d                	.insn	2, 0x1c5d
     356:	20000007          	.insn	4, 0x20000007
     35a:	03000007          	.insn	4, 0x03000007
     35e:	7d00                	.insn	2, 0x7d00
     360:	07209f7f 07440000 	.insn	12, 0x000300000744000007209f7f
     368:	00030000 
     36c:	7e7d                	.insn	2, 0x7e7d
     36e:	489f 0007 5000      	.insn	6, 0x50000007489f
     374:	01000007          	.insn	4, 0x01000007
     378:	5d00                	.insn	2, 0x5d00
     37a:	0750                	.insn	2, 0x0750
     37c:	0000                	.insn	2, 0x0000
     37e:	0754                	.insn	2, 0x0754
     380:	0000                	.insn	2, 0x0000
     382:	7e7d0003          	lb	zero,2023(s10)
     386:	549f 0007 5c00      	.insn	6, 0x5c000007549f
     38c:	01000007          	.insn	4, 0x01000007
     390:	5d00                	.insn	2, 0x5d00
     392:	07dc                	.insn	2, 0x07dc
     394:	0000                	.insn	2, 0x0000
     396:	07f4                	.insn	2, 0x07f4
     398:	0000                	.insn	2, 0x0000
     39a:	0001                	.insn	2, 0x0001
     39c:	f85d                	.insn	2, 0xf85d
     39e:	28000007          	.insn	4, 0x28000007
     3a2:	0008                	.insn	2, 0x0008
     3a4:	0100                	.insn	2, 0x0100
     3a6:	5d00                	.insn	2, 0x5d00
	...
     3b0:	0770                	.insn	2, 0x0770
     3b2:	0000                	.insn	2, 0x0000
     3b4:	0778                	.insn	2, 0x0778
     3b6:	0000                	.insn	2, 0x0000
     3b8:	0001                	.insn	2, 0x0001
     3ba:	005a                	.insn	2, 0x005a
     3bc:	0000                	.insn	2, 0x0000
     3be:	0000                	.insn	2, 0x0000
     3c0:	0000                	.insn	2, 0x0000
     3c2:	a800                	.insn	2, 0xa800
     3c4:	c4000007          	.insn	4, 0xc4000007
     3c8:	01000007          	.insn	4, 0x01000007
     3cc:	5b00                	.insn	2, 0x5b00
	...
     3d6:	07dc                	.insn	2, 0x07dc
     3d8:	0000                	.insn	2, 0x0000
     3da:	07e4                	.insn	2, 0x07e4
     3dc:	0000                	.insn	2, 0x0000
     3de:	0001                	.insn	2, 0x0001
     3e0:	f85c                	.insn	2, 0xf85c
     3e2:	28000007          	.insn	4, 0x28000007
     3e6:	0008                	.insn	2, 0x0008
     3e8:	0100                	.insn	2, 0x0100
     3ea:	5c00                	.insn	2, 0x5c00
	...
     3f4:	07e8                	.insn	2, 0x07e8
     3f6:	0000                	.insn	2, 0x0000
     3f8:	07f8                	.insn	2, 0x07f8
     3fa:	0000                	.insn	2, 0x0000
     3fc:	0001                	.insn	2, 0x0001
     3fe:	005e                	.insn	2, 0x005e
     400:	0000                	.insn	2, 0x0000
     402:	0000                	.insn	2, 0x0000
     404:	0000                	.insn	2, 0x0000
     406:	ec00                	.insn	2, 0xec00
     408:	0008                	.insn	2, 0x0008
     40a:	fc00                	.insn	2, 0xfc00
     40c:	0008                	.insn	2, 0x0008
     40e:	0100                	.insn	2, 0x0100
     410:	5a00                	.insn	2, 0x5a00
     412:	08fc                	.insn	2, 0x08fc
     414:	0000                	.insn	2, 0x0000
     416:	0900                	.insn	2, 0x0900
     418:	0000                	.insn	2, 0x0000
     41a:	7f7c0003          	lb	zero,2039(s8)
     41e:	009f 0009 2400      	.insn	6, 0x24000009009f
     424:	0009                	.insn	2, 0x0009
     426:	0300                	.insn	2, 0x0300
     428:	7c00                	.insn	2, 0x7c00
     42a:	9f7e                	.insn	2, 0x9f7e
     42c:	0928                	.insn	2, 0x0928
     42e:	0000                	.insn	2, 0x0000
     430:	0930                	.insn	2, 0x0930
     432:	0000                	.insn	2, 0x0000
     434:	0001                	.insn	2, 0x0001
     436:	305c                	.insn	2, 0x305c
     438:	0009                	.insn	2, 0x0009
     43a:	3400                	.insn	2, 0x3400
     43c:	0009                	.insn	2, 0x0009
     43e:	0300                	.insn	2, 0x0300
     440:	7c00                	.insn	2, 0x7c00
     442:	9f7e                	.insn	2, 0x9f7e
     444:	0934                	.insn	2, 0x0934
     446:	0000                	.insn	2, 0x0000
     448:	0940                	.insn	2, 0x0940
     44a:	0000                	.insn	2, 0x0000
     44c:	0001                	.insn	2, 0x0001
     44e:	405c                	.insn	2, 0x405c
     450:	0009                	.insn	2, 0x0009
     452:	4400                	.insn	2, 0x4400
     454:	0009                	.insn	2, 0x0009
     456:	0300                	.insn	2, 0x0300
     458:	7c00                	.insn	2, 0x7c00
     45a:	9f7e                	.insn	2, 0x9f7e
     45c:	0960                	.insn	2, 0x0960
     45e:	0000                	.insn	2, 0x0000
     460:	0978                	.insn	2, 0x0978
     462:	0000                	.insn	2, 0x0000
     464:	0001                	.insn	2, 0x0001
     466:	7c5c                	.insn	2, 0x7c5c
     468:	0009                	.insn	2, 0x0009
     46a:	ac00                	.insn	2, 0xac00
     46c:	0009                	.insn	2, 0x0009
     46e:	0100                	.insn	2, 0x0100
     470:	5c00                	.insn	2, 0x5c00
	...
     47a:	08ec                	.insn	2, 0x08ec
     47c:	0000                	.insn	2, 0x0000
     47e:	0960                	.insn	2, 0x0960
     480:	0000                	.insn	2, 0x0000
     482:	0002                	.insn	2, 0x0002
     484:	9f30                	.insn	2, 0x9f30
     486:	0960                	.insn	2, 0x0960
     488:	0000                	.insn	2, 0x0000
     48a:	0970                	.insn	2, 0x0970
     48c:	0000                	.insn	2, 0x0000
     48e:	0001                	.insn	2, 0x0001
     490:	745d                	.insn	2, 0x745d
     492:	0009                	.insn	2, 0x0009
     494:	b800                	.insn	2, 0xb800
     496:	0009                	.insn	2, 0x0009
     498:	0100                	.insn	2, 0x0100
     49a:	5d00                	.insn	2, 0x5d00
	...
     4a4:	0960                	.insn	2, 0x0960
     4a6:	0000                	.insn	2, 0x0000
     4a8:	0968                	.insn	2, 0x0968
     4aa:	0000                	.insn	2, 0x0000
     4ac:	0001                	.insn	2, 0x0001
     4ae:	7c5a                	.insn	2, 0x7c5a
     4b0:	0009                	.insn	2, 0x0009
     4b2:	ac00                	.insn	2, 0xac00
     4b4:	0009                	.insn	2, 0x0009
     4b6:	0100                	.insn	2, 0x0100
     4b8:	5a00                	.insn	2, 0x5a00
	...
     4c2:	096c                	.insn	2, 0x096c
     4c4:	0000                	.insn	2, 0x0000
     4c6:	097c                	.insn	2, 0x097c
     4c8:	0000                	.insn	2, 0x0000
     4ca:	0001                	.insn	2, 0x0001
     4cc:	0061                	.insn	2, 0x0061
     4ce:	0000                	.insn	2, 0x0000
     4d0:	0000                	.insn	2, 0x0000
     4d2:	0000                	.insn	2, 0x0000
     4d4:	b800                	.insn	2, 0xb800
     4d6:	0009                	.insn	2, 0x0009
     4d8:	d800                	.insn	2, 0xd800
     4da:	0009                	.insn	2, 0x0009
     4dc:	0100                	.insn	2, 0x0100
     4de:	5a00                	.insn	2, 0x5a00
     4e0:	09d8                	.insn	2, 0x09d8
     4e2:	0000                	.insn	2, 0x0000
     4e4:	0a5c                	.insn	2, 0x0a5c
     4e6:	0000                	.insn	2, 0x0000
     4e8:	0001                	.insn	2, 0x0001
     4ea:	0058                	.insn	2, 0x0058
     4ec:	0000                	.insn	2, 0x0000
     4ee:	0000                	.insn	2, 0x0000
     4f0:	0000                	.insn	2, 0x0000
     4f2:	d800                	.insn	2, 0xd800
     4f4:	0009                	.insn	2, 0x0009
     4f6:	ec00                	.insn	2, 0xec00
     4f8:	0009                	.insn	2, 0x0009
     4fa:	0200                	.insn	2, 0x0200
     4fc:	3200                	.insn	2, 0x3200
     4fe:	ec9f 0009 3000      	.insn	6, 0x30000009ec9f
     504:	000a                	.insn	2, 0x000a
     506:	0100                	.insn	2, 0x0100
     508:	6200                	.insn	2, 0x6200
	...
     512:	09d8                	.insn	2, 0x09d8
     514:	0000                	.insn	2, 0x0000
     516:	09ec                	.insn	2, 0x09ec
     518:	0000                	.insn	2, 0x0000
     51a:	00110003          	lb	zero,1(sp)
     51e:	ec9f 0009 4400      	.insn	6, 0x44000009ec9f
     524:	000a                	.insn	2, 0x000a
     526:	0100                	.insn	2, 0x0100
     528:	5900                	.insn	2, 0x5900
	...

00000532 <$d.3>:
     532:	ffff                	.insn	2, 0xffff
     534:	ffff                	.insn	2, 0xffff
     536:	0a90                	.insn	2, 0x0a90
     538:	0040                	.insn	2, 0x0040
     53a:	0000                	.insn	2, 0x0000
     53c:	0000                	.insn	2, 0x0000
     53e:	0014                	.insn	2, 0x0014
     540:	0000                	.insn	2, 0x0000
     542:	00110003          	lb	zero,1(sp)
     546:	009f 0000 0000      	.insn	6, 0x009f
     54c:	0000                	.insn	2, 0x0000
     54e:	ff00                	.insn	2, 0xff00
     550:	ffff                	.insn	2, 0xffff
     552:	400a90ff 00001800 	.insn	12, 0x200000001800400a90ff
     55a:	00002000 
     55e:	0100                	.insn	2, 0x0100
     560:	5a00                	.insn	2, 0x5a00
     562:	0020                	.insn	2, 0x0020
     564:	0000                	.insn	2, 0x0000
     566:	031c                	.insn	2, 0x031c
     568:	0000                	.insn	2, 0x0000
     56a:	0001                	.insn	2, 0x0001
     56c:	005f 0000 0000      	.insn	6, 0x005f
     572:	0000                	.insn	2, 0x0000
     574:	ff00                	.insn	2, 0xff00
     576:	ffff                	.insn	2, 0xffff
     578:	400a90ff 00002000 	.insn	12, 0x380000002000400a90ff
     580:	00003800 
     584:	0200                	.insn	2, 0x0200
     586:	3000                	.insn	2, 0x3000
     588:	389f 0000 9000      	.insn	6, 0x90000000389f
     58e:	0000                	.insn	2, 0x0000
     590:	0100                	.insn	2, 0x0100
     592:	5b00                	.insn	2, 0x5b00
	...
     59c:	ffff                	.insn	2, 0xffff
     59e:	ffff                	.insn	2, 0xffff
     5a0:	0a90                	.insn	2, 0x0a90
     5a2:	0040                	.insn	2, 0x0040
     5a4:	0038                	.insn	2, 0x0038
     5a6:	0000                	.insn	2, 0x0000
     5a8:	0054                	.insn	2, 0x0054
     5aa:	0000                	.insn	2, 0x0000
     5ac:	0002                	.insn	2, 0x0002
     5ae:	9f30                	.insn	2, 0x9f30
     5b0:	0054                	.insn	2, 0x0054
     5b2:	0000                	.insn	2, 0x0000
     5b4:	0068                	.insn	2, 0x0068
     5b6:	0000                	.insn	2, 0x0000
     5b8:	0006                	.insn	2, 0x0006
     5ba:	007a                	.insn	2, 0x007a
     5bc:	0311                	.insn	2, 0x0311
     5be:	00689f1b          	.insn	4, 0x00689f1b
     5c2:	0000                	.insn	2, 0x0000
     5c4:	007c                	.insn	2, 0x007c
     5c6:	0000                	.insn	2, 0x0000
     5c8:	0009                	.insn	2, 0x0009
     5ca:	007a                	.insn	2, 0x007a
     5cc:	0311                	.insn	2, 0x0311
     5ce:	2201111b          	.insn	4, 0x2201111b
     5d2:	009f 0000 0000      	.insn	6, 0x009f
     5d8:	0000                	.insn	2, 0x0000
     5da:	ff00                	.insn	2, 0xff00
     5dc:	ffff                	.insn	2, 0xffff
     5de:	400a90ff 0000a000 	.insn	12, 0xe0000000a000400a90ff
     5e6:	0000e000 
     5ea:	0100                	.insn	2, 0x0100
     5ec:	5f00                	.insn	2, 0x5f00
     5ee:	0150                	.insn	2, 0x0150
     5f0:	0000                	.insn	2, 0x0000
     5f2:	018c                	.insn	2, 0x018c
     5f4:	0000                	.insn	2, 0x0000
     5f6:	0001                	.insn	2, 0x0001
     5f8:	005f 0000 0000      	.insn	6, 0x005f
     5fe:	0000                	.insn	2, 0x0000
     600:	ff00                	.insn	2, 0xff00
     602:	ffff                	.insn	2, 0xffff
     604:	400a90ff 0000a000 	.insn	12, 0xe0000000a000400a90ff
     60c:	0000e000 
     610:	0200                	.insn	2, 0x0200
     612:	3400                	.insn	2, 0x3400
     614:	509f 0001 8c00      	.insn	6, 0x8c000001509f
     61a:	0001                	.insn	2, 0x0001
     61c:	0200                	.insn	2, 0x0200
     61e:	3400                	.insn	2, 0x3400
     620:	009f 0000 0000      	.insn	6, 0x009f
     626:	0000                	.insn	2, 0x0000
     628:	ff00                	.insn	2, 0xff00
     62a:	ffff                	.insn	2, 0xffff
     62c:	400a90ff 0000a000 	.insn	12, 0xe0000000a000400a90ff
     634:	0000e000 
     638:	0100                	.insn	2, 0x0100
     63a:	5200                	.insn	2, 0x5200
	...
     644:	ffff                	.insn	2, 0xffff
     646:	ffff                	.insn	2, 0xffff
     648:	0a90                	.insn	2, 0x0a90
     64a:	0040                	.insn	2, 0x0040
     64c:	00a0                	.insn	2, 0x00a0
     64e:	0000                	.insn	2, 0x0000
     650:	00e0                	.insn	2, 0x00e0
     652:	0000                	.insn	2, 0x0000
     654:	0004                	.insn	2, 0x0004
     656:	c072                	.insn	2, 0xc072
     658:	9f00                	.insn	2, 0x9f00
	...
     662:	ffff                	.insn	2, 0xffff
     664:	ffff                	.insn	2, 0xffff
     666:	0a90                	.insn	2, 0x0a90
     668:	0040                	.insn	2, 0x0040
     66a:	00a0                	.insn	2, 0x00a0
     66c:	0000                	.insn	2, 0x0000
     66e:	00e0                	.insn	2, 0x00e0
     670:	0000                	.insn	2, 0x0000
     672:	0004                	.insn	2, 0x0004
     674:	d072                	.insn	2, 0xd072
     676:	9f00                	.insn	2, 0x9f00
	...
     680:	ffff                	.insn	2, 0xffff
     682:	ffff                	.insn	2, 0xffff
     684:	0a90                	.insn	2, 0x0a90
     686:	0040                	.insn	2, 0x0040
     688:	00bc                	.insn	2, 0x00bc
     68a:	0000                	.insn	2, 0x0000
     68c:	00e0                	.insn	2, 0x00e0
     68e:	0000                	.insn	2, 0x0000
     690:	0001                	.insn	2, 0x0001
     692:	0061                	.insn	2, 0x0061
     694:	0000                	.insn	2, 0x0000
     696:	0000                	.insn	2, 0x0000
     698:	0000                	.insn	2, 0x0000
     69a:	ff00                	.insn	2, 0xff00
     69c:	ffff                	.insn	2, 0xffff
     69e:	400a90ff 0000c000 	.insn	12, 0xe0000000c000400a90ff
     6a6:	0000e000 
     6aa:	0300                	.insn	2, 0x0300
     6ac:	1000                	.insn	2, 0x1000
     6ae:	9f41                	.insn	2, 0x9f41
     6b0:	0170                	.insn	2, 0x0170
     6b2:	0000                	.insn	2, 0x0000
     6b4:	018c                	.insn	2, 0x018c
     6b6:	0000                	.insn	2, 0x0000
     6b8:	41100003          	lb	zero,1041(zero) # 411 <$d.6+0x181>
     6bc:	009f 0000 0000      	.insn	6, 0x009f
     6c2:	0000                	.insn	2, 0x0000
     6c4:	ff00                	.insn	2, 0xff00
     6c6:	ffff                	.insn	2, 0xffff
     6c8:	400a90ff 0000d000 	.insn	12, 0xe0000000d000400a90ff
     6d0:	0000e000 
     6d4:	0200                	.insn	2, 0x0200
     6d6:	3a00                	.insn	2, 0x3a00
     6d8:	809f 0001 8c00      	.insn	6, 0x8c000001809f
     6de:	0001                	.insn	2, 0x0001
     6e0:	0200                	.insn	2, 0x0200
     6e2:	3a00                	.insn	2, 0x3a00
     6e4:	009f 0000 0000      	.insn	6, 0x009f
     6ea:	0000                	.insn	2, 0x0000
     6ec:	ff00                	.insn	2, 0xff00
     6ee:	ffff                	.insn	2, 0xffff
     6f0:	400a90ff 0000dc00 	.insn	12, 0xf0000000dc00400a90ff
     6f8:	0000f000 
     6fc:	0200                	.insn	2, 0x0200
     6fe:	3000                	.insn	2, 0x3000
     700:	f09f 0000 4000      	.insn	6, 0x40000000f09f
     706:	0001                	.insn	2, 0x0001
     708:	0100                	.insn	2, 0x0100
     70a:	5b00                	.insn	2, 0x5b00
	...
     714:	ffff                	.insn	2, 0xffff
     716:	ffff                	.insn	2, 0xffff
     718:	0a90                	.insn	2, 0x0a90
     71a:	0040                	.insn	2, 0x0040
     71c:	00f0                	.insn	2, 0x00f0
     71e:	0000                	.insn	2, 0x0000
     720:	0100                	.insn	2, 0x0100
     722:	0000                	.insn	2, 0x0000
     724:	0002                	.insn	2, 0x0002
     726:	9f30                	.insn	2, 0x9f30
     728:	0100                	.insn	2, 0x0100
     72a:	0000                	.insn	2, 0x0000
     72c:	011c                	.insn	2, 0x011c
     72e:	0000                	.insn	2, 0x0000
     730:	000a                	.insn	2, 0x000a
     732:	0081                	.insn	2, 0x0081
     734:	d072                	.insn	2, 0xd072
     736:	1c00                	.insn	2, 0x1c00
     738:	0411                	.insn	2, 0x0411
     73a:	011c9f1b          	.insn	4, 0x011c9f1b
     73e:	0000                	.insn	2, 0x0000
     740:	0124                	.insn	2, 0x0124
     742:	0000                	.insn	2, 0x0000
     744:	000d                	.insn	2, 0x000d
     746:	0081                	.insn	2, 0x0081
     748:	d072                	.insn	2, 0xd072
     74a:	1c00                	.insn	2, 0x1c00
     74c:	0411                	.insn	2, 0x0411
     74e:	2201111b          	.insn	4, 0x2201111b
     752:	009f 0000 0000      	.insn	6, 0x009f
     758:	0000                	.insn	2, 0x0000
     75a:	ff00                	.insn	2, 0xff00
     75c:	ffff                	.insn	2, 0xffff
     75e:	400a90ff 00019000 	.insn	12, 0x0001bc0000019000400a90ff
     766:	0001bc00 
     76a:	0200                	.insn	2, 0x0200
     76c:	3a00                	.insn	2, 0x3a00
     76e:	549f 0002 7c00      	.insn	6, 0x7c000002549f
     774:	0002                	.insn	2, 0x0002
     776:	0200                	.insn	2, 0x0200
     778:	3a00                	.insn	2, 0x3a00
     77a:	009f 0000 0000      	.insn	6, 0x009f
     780:	0000                	.insn	2, 0x0000
     782:	ff00                	.insn	2, 0xff00
     784:	ffff                	.insn	2, 0xffff
     786:	400a90ff 0001a000 	.insn	12, 0x0001bc000001a000400a90ff
     78e:	0001bc00 
     792:	0300                	.insn	2, 0x0300
     794:	1000                	.insn	2, 0x1000
     796:	9f42                	.insn	2, 0x9f42
     798:	0264                	.insn	2, 0x0264
     79a:	0000                	.insn	2, 0x0000
     79c:	027c                	.insn	2, 0x027c
     79e:	0000                	.insn	2, 0x0000
     7a0:	42100003          	lb	zero,1057(zero) # 421 <$d.6+0x191>
     7a4:	009f 0000 0000      	.insn	6, 0x009f
     7aa:	0000                	.insn	2, 0x0000
     7ac:	ff00                	.insn	2, 0xff00
     7ae:	ffff                	.insn	2, 0xffff
     7b0:	400a90ff 0001ac00 	.insn	12, 0x0001bc000001ac00400a90ff
     7b8:	0001bc00 
     7bc:	0200                	.insn	2, 0x0200
     7be:	3a00                	.insn	2, 0x3a00
     7c0:	709f 0002 7c00      	.insn	6, 0x7c000002709f
     7c6:	0002                	.insn	2, 0x0002
     7c8:	0200                	.insn	2, 0x0200
     7ca:	3a00                	.insn	2, 0x3a00
     7cc:	009f 0000 0000      	.insn	6, 0x009f
     7d2:	0000                	.insn	2, 0x0000
     7d4:	ff00                	.insn	2, 0xff00
     7d6:	ffff                	.insn	2, 0xffff
     7d8:	400a90ff 0001b800 	.insn	12, 0x0001d0000001b800400a90ff
     7e0:	0001d000 
     7e4:	0200                	.insn	2, 0x0200
     7e6:	3000                	.insn	2, 0x3000
     7e8:	d09f 0001 2000      	.insn	6, 0x20000001d09f
     7ee:	0002                	.insn	2, 0x0002
     7f0:	0100                	.insn	2, 0x0100
     7f2:	5b00                	.insn	2, 0x5b00
	...
     7fc:	ffff                	.insn	2, 0xffff
     7fe:	ffff                	.insn	2, 0xffff
     800:	0a90                	.insn	2, 0x0a90
     802:	0040                	.insn	2, 0x0040
     804:	01d0                	.insn	2, 0x01d0
     806:	0000                	.insn	2, 0x0000
     808:	01e0                	.insn	2, 0x01e0
     80a:	0000                	.insn	2, 0x0000
     80c:	0002                	.insn	2, 0x0002
     80e:	9f30                	.insn	2, 0x9f30
     810:	01e0                	.insn	2, 0x01e0
     812:	0000                	.insn	2, 0x0000
     814:	01fc                	.insn	2, 0x01fc
     816:	0000                	.insn	2, 0x0000
     818:	000a                	.insn	2, 0x000a
     81a:	0081                	.insn	2, 0x0081
     81c:	c072                	.insn	2, 0xc072
     81e:	1c00                	.insn	2, 0x1c00
     820:	0411                	.insn	2, 0x0411
     822:	01fc9f1b          	.insn	4, 0x01fc9f1b
     826:	0000                	.insn	2, 0x0000
     828:	0204                	.insn	2, 0x0204
     82a:	0000                	.insn	2, 0x0000
     82c:	000d                	.insn	2, 0x000d
     82e:	0081                	.insn	2, 0x0081
     830:	c072                	.insn	2, 0xc072
     832:	1c00                	.insn	2, 0x1c00
     834:	0411                	.insn	2, 0x0411
     836:	2201111b          	.insn	4, 0x2201111b
     83a:	009f 0000 0000      	.insn	6, 0x009f
     840:	0000                	.insn	2, 0x0000
     842:	ff00                	.insn	2, 0xff00
     844:	ffff                	.insn	2, 0xffff
     846:	400a90ff 00022400 	.insn	12, 0x0002500000022400400a90ff
     84e:	00025000 
     852:	0200                	.insn	2, 0x0200
     854:	3a00                	.insn	2, 0x3a00
     856:	809f 0002 ac00      	.insn	6, 0xac000002809f
     85c:	0002                	.insn	2, 0x0002
     85e:	0200                	.insn	2, 0x0200
     860:	3a00                	.insn	2, 0x3a00
     862:	009f 0000 0000      	.insn	6, 0x009f
     868:	0000                	.insn	2, 0x0000
     86a:	ff00                	.insn	2, 0xff00
     86c:	ffff                	.insn	2, 0xffff
     86e:	400a90ff 00023400 	.insn	12, 0x0002500000023400400a90ff
     876:	00025000 
     87a:	0300                	.insn	2, 0x0300
     87c:	1000                	.insn	2, 0x1000
     87e:	02909f43          	.insn	4, 0x02909f43
     882:	0000                	.insn	2, 0x0000
     884:	02ac                	.insn	2, 0x02ac
     886:	0000                	.insn	2, 0x0000
     888:	43100003          	lb	zero,1073(zero) # 431 <$d.6+0x1a1>
     88c:	009f 0000 0000      	.insn	6, 0x009f
     892:	0000                	.insn	2, 0x0000
     894:	ff00                	.insn	2, 0xff00
     896:	ffff                	.insn	2, 0xffff
     898:	400a90ff 00024000 	.insn	12, 0x0002500000024000400a90ff
     8a0:	00025000 
     8a4:	0200                	.insn	2, 0x0200
     8a6:	3a00                	.insn	2, 0x3a00
     8a8:	9c9f 0002 ac00      	.insn	6, 0xac0000029c9f
     8ae:	0002                	.insn	2, 0x0002
     8b0:	0200                	.insn	2, 0x0200
     8b2:	3a00                	.insn	2, 0x3a00
     8b4:	009f 0000 0000      	.insn	6, 0x009f
     8ba:	0000                	.insn	2, 0x0000
     8bc:	ff00                	.insn	2, 0xff00
     8be:	ffff                	.insn	2, 0xffff
     8c0:	400a90ff 0002a800 	.insn	12, 0x0002bc000002a800400a90ff
     8c8:	0002bc00 
     8cc:	0200                	.insn	2, 0x0200
     8ce:	3000                	.insn	2, 0x3000
     8d0:	bc9f 0002 0400      	.insn	6, 0x04000002bc9f
     8d6:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     8da:	5b00                	.insn	2, 0x5b00
	...
     8e4:	ffff                	.insn	2, 0xffff
     8e6:	ffff                	.insn	2, 0xffff
     8e8:	0a90                	.insn	2, 0x0a90
     8ea:	0040                	.insn	2, 0x0040
     8ec:	02c4                	.insn	2, 0x02c4
     8ee:	0000                	.insn	2, 0x0000
     8f0:	02e0                	.insn	2, 0x02e0
     8f2:	0000                	.insn	2, 0x0000
     8f4:	0009                	.insn	2, 0x0009
     8f6:	0075                	.insn	2, 0x0075
     8f8:	007f 111c 1b7f e09f 	.insn	10, 0x0002e09f1b7f111c007f
     900:	0002 
     902:	e400                	.insn	2, 0xe400
     904:	0002                	.insn	2, 0x0002
     906:	0c00                	.insn	2, 0x0c00
     908:	7500                	.insn	2, 0x7500
     90a:	7f00                	.insn	2, 0x7f00
     90c:	1c00                	.insn	2, 0x1c00
     90e:	7f11                	.insn	2, 0x7f11
     910:	2201111b          	.insn	4, 0x2201111b
     914:	009f 0000 0000      	.insn	6, 0x009f
     91a:	0000                	.insn	2, 0x0000
     91c:	ff00                	.insn	2, 0xff00
     91e:	ffff                	.insn	2, 0xffff
     920:	400a90ff 00031c00 	.insn	12, 0x0003200000031c00400a90ff
     928:	00032000 
     92c:	0100                	.insn	2, 0x0100
     92e:	5a00                	.insn	2, 0x5a00
     930:	0320                	.insn	2, 0x0320
     932:	0000                	.insn	2, 0x0000
     934:	0330                	.insn	2, 0x0330
     936:	0000                	.insn	2, 0x0000
     938:	0001                	.insn	2, 0x0001
     93a:	0000005b          	.insn	4, 0x005b
     93e:	0000                	.insn	2, 0x0000
     940:	0000                	.insn	2, 0x0000
     942:	ff00                	.insn	2, 0xff00
     944:	ffff                	.insn	2, 0xffff
     946:	400a90ff 00033000 	.insn	12, 0x0003340000033000400a90ff
     94e:	00033400 
     952:	0100                	.insn	2, 0x0100
     954:	5a00                	.insn	2, 0x5a00
     956:	0334                	.insn	2, 0x0334
     958:	0000                	.insn	2, 0x0000
     95a:	0344                	.insn	2, 0x0344
     95c:	0000                	.insn	2, 0x0000
     95e:	0001                	.insn	2, 0x0001
     960:	0000005b          	.insn	4, 0x005b
     964:	0000                	.insn	2, 0x0000
     966:	0000                	.insn	2, 0x0000
     968:	ff00                	.insn	2, 0xff00
     96a:	ffff                	.insn	2, 0xffff
     96c:	400a90ff 00034400 	.insn	12, 0x00034c0000034400400a90ff
     974:	00034c00 
     978:	0100                	.insn	2, 0x0100
     97a:	5a00                	.insn	2, 0x5a00
	...
     984:	ffff                	.insn	2, 0xffff
     986:	ffff                	.insn	2, 0xffff
     988:	0a90                	.insn	2, 0x0a90
     98a:	0040                	.insn	2, 0x0040
     98c:	0350                	.insn	2, 0x0350
     98e:	0000                	.insn	2, 0x0000
     990:	0358                	.insn	2, 0x0358
     992:	0000                	.insn	2, 0x0000
     994:	0001                	.insn	2, 0x0001
     996:	005a                	.insn	2, 0x005a
     998:	0000                	.insn	2, 0x0000
     99a:	0000                	.insn	2, 0x0000
     99c:	0000                	.insn	2, 0x0000
     99e:	ff00                	.insn	2, 0xff00
     9a0:	ffff                	.insn	2, 0xffff
     9a2:	400a90ff 00035c00 	.insn	12, 0x0003640000035c00400a90ff
     9aa:	00036400 
     9ae:	0100                	.insn	2, 0x0100
     9b0:	5a00                	.insn	2, 0x5a00
	...
     9ba:	ffff                	.insn	2, 0xffff
     9bc:	ffff                	.insn	2, 0xffff
     9be:	0a90                	.insn	2, 0x0a90
     9c0:	0040                	.insn	2, 0x0040
     9c2:	0374                	.insn	2, 0x0374
     9c4:	0000                	.insn	2, 0x0000
     9c6:	0384                	.insn	2, 0x0384
     9c8:	0000                	.insn	2, 0x0000
     9ca:	0001                	.insn	2, 0x0001
     9cc:	0003885b          	.insn	4, 0x0003885b
     9d0:	9800                	.insn	2, 0x9800
     9d2:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     9d6:	5b00                	.insn	2, 0x5b00
	...
     9e0:	ffff                	.insn	2, 0xffff
     9e2:	ffff                	.insn	2, 0xffff
     9e4:	0a90                	.insn	2, 0x0a90
     9e6:	0040                	.insn	2, 0x0040
     9e8:	0374                	.insn	2, 0x0374
     9ea:	0000                	.insn	2, 0x0000
     9ec:	0388                	.insn	2, 0x0388
     9ee:	0000                	.insn	2, 0x0000
     9f0:	0001                	.insn	2, 0x0001
     9f2:	885a                	.insn	2, 0x885a
     9f4:	94000003          	lb	zero,-1728(zero) # fffff940 <USER_MAX+0xffaff940>
     9f8:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     9fc:	5e00                	.insn	2, 0x5e00
     9fe:	0394                	.insn	2, 0x0394
     a00:	0000                	.insn	2, 0x0000
     a02:	03a0                	.insn	2, 0x03a0
     a04:	0000                	.insn	2, 0x0000
     a06:	0001                	.insn	2, 0x0001
     a08:	005d                	.insn	2, 0x005d
     a0a:	0000                	.insn	2, 0x0000
     a0c:	0000                	.insn	2, 0x0000
     a0e:	0000                	.insn	2, 0x0000
     a10:	ff00                	.insn	2, 0xff00
     a12:	ffff                	.insn	2, 0xffff
     a14:	400a90ff 0003a800 	.insn	12, 0x0003b4000003a800400a90ff
     a1c:	0003b400 
     a20:	0100                	.insn	2, 0x0100
     a22:	5a00                	.insn	2, 0x5a00
     a24:	03b4                	.insn	2, 0x03b4
     a26:	0000                	.insn	2, 0x0000
     a28:	03c0                	.insn	2, 0x03c0
     a2a:	0000                	.insn	2, 0x0000
     a2c:	7f7a0003          	lb	zero,2039(s4)
     a30:	c09f 0003 cc00      	.insn	6, 0xcc000003c09f
     a36:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     a3a:	5a00                	.insn	2, 0x5a00
     a3c:	03d8                	.insn	2, 0x03d8
     a3e:	0000                	.insn	2, 0x0000
     a40:	03dc                	.insn	2, 0x03dc
     a42:	0000                	.insn	2, 0x0000
     a44:	0001                	.insn	2, 0x0001
     a46:	005a                	.insn	2, 0x005a
     a48:	0000                	.insn	2, 0x0000
     a4a:	0000                	.insn	2, 0x0000
     a4c:	0000                	.insn	2, 0x0000
     a4e:	ff00                	.insn	2, 0xff00
     a50:	ffff                	.insn	2, 0xffff
     a52:	400a90ff 0003a800 	.insn	12, 0x0003e0000003a800400a90ff
     a5a:	0003e000 
     a5e:	0100                	.insn	2, 0x0100
     a60:	5b00                	.insn	2, 0x5b00
	...
     a6a:	ffff                	.insn	2, 0xffff
     a6c:	ffff                	.insn	2, 0xffff
     a6e:	0a90                	.insn	2, 0x0a90
     a70:	0040                	.insn	2, 0x0040
     a72:	03e8                	.insn	2, 0x03e8
     a74:	0000                	.insn	2, 0x0000
     a76:	0404                	.insn	2, 0x0404
     a78:	0000                	.insn	2, 0x0000
     a7a:	0001                	.insn	2, 0x0001
     a7c:	045a                	.insn	2, 0x045a
     a7e:	0004                	.insn	2, 0x0004
     a80:	a400                	.insn	2, 0xa400
     a82:	0006                	.insn	2, 0x0006
     a84:	0100                	.insn	2, 0x0100
     a86:	5500                	.insn	2, 0x5500
	...
     a90:	ffff                	.insn	2, 0xffff
     a92:	ffff                	.insn	2, 0xffff
     a94:	0a90                	.insn	2, 0x0a90
     a96:	0040                	.insn	2, 0x0040
     a98:	04b4                	.insn	2, 0x04b4
     a9a:	0000                	.insn	2, 0x0000
     a9c:	04d0                	.insn	2, 0x04d0
     a9e:	0000                	.insn	2, 0x0000
     aa0:	0001                	.insn	2, 0x0001
     aa2:	1459                	.insn	2, 0x1459
     aa4:	0006                	.insn	2, 0x0006
     aa6:	2400                	.insn	2, 0x2400
     aa8:	0006                	.insn	2, 0x0006
     aaa:	0100                	.insn	2, 0x0100
     aac:	5900                	.insn	2, 0x5900
	...
     ab6:	ffff                	.insn	2, 0xffff
     ab8:	ffff                	.insn	2, 0xffff
     aba:	0a90                	.insn	2, 0x0a90
     abc:	0040                	.insn	2, 0x0040
     abe:	04b8                	.insn	2, 0x04b8
     ac0:	0000                	.insn	2, 0x0000
     ac2:	04d0                	.insn	2, 0x04d0
     ac4:	0000                	.insn	2, 0x0000
     ac6:	0001                	.insn	2, 0x0001
     ac8:	2459                	.insn	2, 0x2459
     aca:	0006                	.insn	2, 0x0006
     acc:	3000                	.insn	2, 0x3000
     ace:	0006                	.insn	2, 0x0006
     ad0:	0100                	.insn	2, 0x0100
     ad2:	5900                	.insn	2, 0x5900
     ad4:	0630                	.insn	2, 0x0630
     ad6:	0000                	.insn	2, 0x0000
     ad8:	0638                	.insn	2, 0x0638
     ada:	0000                	.insn	2, 0x0000
     adc:	0001                	.insn	2, 0x0001
     ade:	385d                	.insn	2, 0x385d
     ae0:	0006                	.insn	2, 0x0006
     ae2:	5400                	.insn	2, 0x5400
     ae4:	0006                	.insn	2, 0x0006
     ae6:	0100                	.insn	2, 0x0100
     ae8:	5900                	.insn	2, 0x5900
	...
     af2:	ffff                	.insn	2, 0xffff
     af4:	ffff                	.insn	2, 0xffff
     af6:	0a90                	.insn	2, 0x0a90
     af8:	0040                	.insn	2, 0x0040
     afa:	04b8                	.insn	2, 0x04b8
     afc:	0000                	.insn	2, 0x0000
     afe:	04d0                	.insn	2, 0x04d0
     b00:	0000                	.insn	2, 0x0000
     b02:	00110003          	lb	zero,1(sp)
     b06:	249f 0006 2800      	.insn	6, 0x28000006249f
     b0c:	0006                	.insn	2, 0x0006
     b0e:	0300                	.insn	2, 0x0300
     b10:	1100                	.insn	2, 0x1100
     b12:	9f00                	.insn	2, 0x9f00
     b14:	0630                	.insn	2, 0x0630
     b16:	0000                	.insn	2, 0x0000
     b18:	0648                	.insn	2, 0x0648
     b1a:	0000                	.insn	2, 0x0000
     b1c:	0001                	.insn	2, 0x0001
     b1e:	4862                	.insn	2, 0x4862
     b20:	0006                	.insn	2, 0x0006
     b22:	5400                	.insn	2, 0x5400
     b24:	0006                	.insn	2, 0x0006
     b26:	0100                	.insn	2, 0x0100
     b28:	5a00                	.insn	2, 0x5a00
	...
     b32:	ffff                	.insn	2, 0xffff
     b34:	ffff                	.insn	2, 0xffff
     b36:	0a90                	.insn	2, 0x0a90
     b38:	0040                	.insn	2, 0x0040
     b3a:	04e8                	.insn	2, 0x04e8
     b3c:	0000                	.insn	2, 0x0000
     b3e:	0500                	.insn	2, 0x0500
     b40:	0000                	.insn	2, 0x0000
     b42:	07110003          	lb	zero,113(sp)
     b46:	009f 0005 1c00      	.insn	6, 0x1c000005009f
     b4c:	0005                	.insn	2, 0x0005
     b4e:	0300                	.insn	2, 0x0300
     b50:	1100                	.insn	2, 0x1100
     b52:	9f06                	.insn	2, 0x9f06
     b54:	051c                	.insn	2, 0x051c
     b56:	0000                	.insn	2, 0x0000
     b58:	0538                	.insn	2, 0x0538
     b5a:	0000                	.insn	2, 0x0000
     b5c:	05110003          	lb	zero,81(sp)
     b60:	389f 0005 5400      	.insn	6, 0x54000005389f
     b66:	0005                	.insn	2, 0x0005
     b68:	0300                	.insn	2, 0x0300
     b6a:	1100                	.insn	2, 0x1100
     b6c:	9f04                	.insn	2, 0x9f04
     b6e:	0554                	.insn	2, 0x0554
     b70:	0000                	.insn	2, 0x0000
     b72:	0570                	.insn	2, 0x0570
     b74:	0000                	.insn	2, 0x0000
     b76:	03110003          	lb	zero,49(sp)
     b7a:	709f 0005 8c00      	.insn	6, 0x8c000005709f
     b80:	0005                	.insn	2, 0x0005
     b82:	0300                	.insn	2, 0x0300
     b84:	1100                	.insn	2, 0x1100
     b86:	9f02                	.insn	2, 0x9f02
     b88:	058c                	.insn	2, 0x058c
     b8a:	0000                	.insn	2, 0x0000
     b8c:	05a8                	.insn	2, 0x05a8
     b8e:	0000                	.insn	2, 0x0000
     b90:	01110003          	lb	zero,17(sp)
     b94:	a89f 0005 c000      	.insn	6, 0xc0000005a89f
     b9a:	0005                	.insn	2, 0x0005
     b9c:	0300                	.insn	2, 0x0300
     b9e:	1100                	.insn	2, 0x1100
     ba0:	9f00                	.insn	2, 0x9f00
     ba2:	05c0                	.insn	2, 0x05c0
     ba4:	0000                	.insn	2, 0x0000
     ba6:	05c8                	.insn	2, 0x05c8
     ba8:	0000                	.insn	2, 0x0000
     baa:	7f110003          	lb	zero,2033(sp)
     bae:	009f 0000 0000      	.insn	6, 0x009f
     bb4:	0000                	.insn	2, 0x0000
     bb6:	ff00                	.insn	2, 0xff00
     bb8:	ffff                	.insn	2, 0xffff
     bba:	400a90ff 0004e800 	.insn	12, 0x0005ac000004e800400a90ff
     bc2:	0005ac00 
     bc6:	0100                	.insn	2, 0x0100
     bc8:	5900                	.insn	2, 0x5900
	...
     bd2:	ffff                	.insn	2, 0xffff
     bd4:	ffff                	.insn	2, 0xffff
     bd6:	0a90                	.insn	2, 0x0a90
     bd8:	0040                	.insn	2, 0x0040
     bda:	04ec                	.insn	2, 0x04ec
     bdc:	0000                	.insn	2, 0x0000
     bde:	04f0                	.insn	2, 0x04f0
     be0:	0000                	.insn	2, 0x0000
     be2:	0001                	.insn	2, 0x0001
     be4:	085a                	.insn	2, 0x085a
     be6:	0005                	.insn	2, 0x0005
     be8:	0c00                	.insn	2, 0x0c00
     bea:	0005                	.insn	2, 0x0005
     bec:	0100                	.insn	2, 0x0100
     bee:	5a00                	.insn	2, 0x5a00
     bf0:	0524                	.insn	2, 0x0524
     bf2:	0000                	.insn	2, 0x0000
     bf4:	0528                	.insn	2, 0x0528
     bf6:	0000                	.insn	2, 0x0000
     bf8:	0001                	.insn	2, 0x0001
     bfa:	405a                	.insn	2, 0x405a
     bfc:	0005                	.insn	2, 0x0005
     bfe:	4400                	.insn	2, 0x4400
     c00:	0005                	.insn	2, 0x0005
     c02:	0100                	.insn	2, 0x0100
     c04:	5a00                	.insn	2, 0x5a00
     c06:	055c                	.insn	2, 0x055c
     c08:	0000                	.insn	2, 0x0000
     c0a:	0560                	.insn	2, 0x0560
     c0c:	0000                	.insn	2, 0x0000
     c0e:	0001                	.insn	2, 0x0001
     c10:	785a                	.insn	2, 0x785a
     c12:	0005                	.insn	2, 0x0005
     c14:	7c00                	.insn	2, 0x7c00
     c16:	0005                	.insn	2, 0x0005
     c18:	0100                	.insn	2, 0x0100
     c1a:	5a00                	.insn	2, 0x5a00
     c1c:	0594                	.insn	2, 0x0594
     c1e:	0000                	.insn	2, 0x0000
     c20:	0598                	.insn	2, 0x0598
     c22:	0000                	.insn	2, 0x0000
     c24:	0001                	.insn	2, 0x0001
     c26:	ac5a                	.insn	2, 0xac5a
     c28:	0005                	.insn	2, 0x0005
     c2a:	b000                	.insn	2, 0xb000
     c2c:	0005                	.insn	2, 0x0005
     c2e:	0100                	.insn	2, 0x0100
     c30:	5900                	.insn	2, 0x5900
	...
     c3a:	ffff                	.insn	2, 0xffff
     c3c:	ffff                	.insn	2, 0xffff
     c3e:	0a90                	.insn	2, 0x0a90
     c40:	0040                	.insn	2, 0x0040
     c42:	05ec                	.insn	2, 0x05ec
     c44:	0000                	.insn	2, 0x0000
     c46:	05f8                	.insn	2, 0x05f8
     c48:	0000                	.insn	2, 0x0000
     c4a:	0001                	.insn	2, 0x0001
     c4c:	f862                	.insn	2, 0xf862
     c4e:	0005                	.insn	2, 0x0005
     c50:	0400                	.insn	2, 0x0400
     c52:	0006                	.insn	2, 0x0006
     c54:	0300                	.insn	2, 0x0300
     c56:	8200                	.insn	2, 0x8200
     c58:	06049f7f 060c0000 	.insn	12, 0x00010000060c000006049f7f
     c60:	00010000 
     c64:	0062                	.insn	2, 0x0062
     c66:	0000                	.insn	2, 0x0000
     c68:	0000                	.insn	2, 0x0000
     c6a:	0000                	.insn	2, 0x0000
     c6c:	ff00                	.insn	2, 0xff00
     c6e:	ffff                	.insn	2, 0xffff
     c70:	400a90ff 0006a400 	.insn	12, 0x0006a8000006a400400a90ff
     c78:	0006a800 
     c7c:	0100                	.insn	2, 0x0100
     c7e:	5a00                	.insn	2, 0x5a00
     c80:	06a8                	.insn	2, 0x06a8
     c82:	0000                	.insn	2, 0x0000
     c84:	06ec                	.insn	2, 0x06ec
     c86:	0000                	.insn	2, 0x0000
     c88:	0001                	.insn	2, 0x0001
     c8a:	0006f85b          	.insn	4, 0x0006f85b
     c8e:	4400                	.insn	2, 0x4400
     c90:	01000007          	.insn	4, 0x01000007
     c94:	5b00                	.insn	2, 0x5b00
	...
     c9e:	ffff                	.insn	2, 0xffff
     ca0:	ffff                	.insn	2, 0xffff
     ca2:	0a90                	.insn	2, 0x0a90
     ca4:	0040                	.insn	2, 0x0040
     ca6:	06a8                	.insn	2, 0x06a8
     ca8:	0000                	.insn	2, 0x0000
     caa:	06c8                	.insn	2, 0x06c8
     cac:	0000                	.insn	2, 0x0000
     cae:	0002                	.insn	2, 0x0002
     cb0:	9f3a                	.insn	2, 0x9f3a
     cb2:	06c8                	.insn	2, 0x06c8
     cb4:	0000                	.insn	2, 0x0000
     cb6:	06d4                	.insn	2, 0x06d4
     cb8:	0000                	.insn	2, 0x0000
     cba:	0002                	.insn	2, 0x0002
     cbc:	9f40                	.insn	2, 0x9f40
     cbe:	06d4                	.insn	2, 0x06d4
     cc0:	0000                	.insn	2, 0x0000
     cc2:	06e0                	.insn	2, 0x06e0
     cc4:	0000                	.insn	2, 0x0000
     cc6:	0001                	.insn	2, 0x0001
     cc8:	e05c                	.insn	2, 0xe05c
     cca:	0006                	.insn	2, 0x0006
     ccc:	e400                	.insn	2, 0xe400
     cce:	0006                	.insn	2, 0x0006
     cd0:	0200                	.insn	2, 0x0200
     cd2:	3a00                	.insn	2, 0x3a00
     cd4:	009f 0000 0000      	.insn	6, 0x009f
     cda:	0000                	.insn	2, 0x0000
     cdc:	ff00                	.insn	2, 0xff00
     cde:	ffff                	.insn	2, 0xffff
     ce0:	400a90ff 0006d400 	.insn	12, 0x0006e0000006d400400a90ff
     ce8:	0006e000 
     cec:	0200                	.insn	2, 0x0200
     cee:	3000                	.insn	2, 0x3000
     cf0:	f89f 0006 3c00      	.insn	6, 0x3c000006f89f
     cf6:	01000007          	.insn	4, 0x01000007
     cfa:	5a00                	.insn	2, 0x5a00
     cfc:	0740                	.insn	2, 0x0740
     cfe:	0000                	.insn	2, 0x0000
     d00:	074c                	.insn	2, 0x074c
     d02:	0000                	.insn	2, 0x0000
     d04:	0001                	.insn	2, 0x0001
     d06:	005a                	.insn	2, 0x005a
     d08:	0000                	.insn	2, 0x0000
     d0a:	0000                	.insn	2, 0x0000
     d0c:	0000                	.insn	2, 0x0000
     d0e:	ff00                	.insn	2, 0xff00
     d10:	ffff                	.insn	2, 0xffff
     d12:	400a90ff 0006f800 	.insn	12, 0x00072c000006f800400a90ff
     d1a:	00072c00 
     d1e:	0100                	.insn	2, 0x0100
     d20:	5d00                	.insn	2, 0x5d00
	...
     d2a:	ffff                	.insn	2, 0xffff
     d2c:	ffff                	.insn	2, 0xffff
     d2e:	0a90                	.insn	2, 0x0a90
     d30:	0040                	.insn	2, 0x0040
     d32:	0730                	.insn	2, 0x0730
     d34:	0000                	.insn	2, 0x0000
     d36:	0748                	.insn	2, 0x0748
     d38:	0000                	.insn	2, 0x0000
     d3a:	0001                	.insn	2, 0x0001
     d3c:	0061                	.insn	2, 0x0061
     d3e:	0000                	.insn	2, 0x0000
     d40:	0000                	.insn	2, 0x0000
     d42:	0000                	.insn	2, 0x0000
     d44:	ff00                	.insn	2, 0xff00
     d46:	ffff                	.insn	2, 0xffff
     d48:	400a90ff 00074c00 	.insn	12, 0x0007580000074c00400a90ff
     d50:	00075800 
     d54:	0100                	.insn	2, 0x0100
     d56:	5a00                	.insn	2, 0x5a00
     d58:	075c                	.insn	2, 0x075c
     d5a:	0000                	.insn	2, 0x0000
     d5c:	0770                	.insn	2, 0x0770
     d5e:	0000                	.insn	2, 0x0000
     d60:	0001                	.insn	2, 0x0001
     d62:	705a                	.insn	2, 0x705a
     d64:	ac000007          	.insn	4, 0xac000007
     d68:	01000007          	.insn	4, 0x01000007
     d6c:	5800                	.insn	2, 0x5800
	...
     d76:	ffff                	.insn	2, 0xffff
     d78:	ffff                	.insn	2, 0xffff
     d7a:	0a90                	.insn	2, 0x0a90
     d7c:	0040                	.insn	2, 0x0040
     d7e:	0770                	.insn	2, 0x0770
     d80:	0000                	.insn	2, 0x0000
     d82:	0780                	.insn	2, 0x0780
     d84:	0000                	.insn	2, 0x0000
     d86:	0002                	.insn	2, 0x0002
     d88:	9f32                	.insn	2, 0x9f32
     d8a:	0780                	.insn	2, 0x0780
     d8c:	0000                	.insn	2, 0x0000
     d8e:	0790                	.insn	2, 0x0790
     d90:	0000                	.insn	2, 0x0000
     d92:	0001                	.insn	2, 0x0001
     d94:	9059                	.insn	2, 0x9059
     d96:	98000007          	.insn	4, 0x98000007
     d9a:	03000007          	.insn	4, 0x03000007
     d9e:	7900                	.insn	2, 0x7900
     da0:	9f01                	.insn	2, 0x9f01
     da2:	0798                	.insn	2, 0x0798
     da4:	0000                	.insn	2, 0x0000
     da6:	07a0                	.insn	2, 0x07a0
     da8:	0000                	.insn	2, 0x0000
     daa:	0001                	.insn	2, 0x0001
     dac:	0059                	.insn	2, 0x0059
     dae:	0000                	.insn	2, 0x0000
     db0:	0000                	.insn	2, 0x0000
     db2:	0000                	.insn	2, 0x0000
     db4:	ff00                	.insn	2, 0xff00
     db6:	ffff                	.insn	2, 0xffff
     db8:	400a90ff 0007c400 	.insn	12, 0x0007cc000007c400400a90ff
     dc0:	0007cc00 
     dc4:	0100                	.insn	2, 0x0100
     dc6:	5b00                	.insn	2, 0x5b00
	...
     dd0:	ffff                	.insn	2, 0xffff
     dd2:	ffff                	.insn	2, 0xffff
     dd4:	0a90                	.insn	2, 0x0a90
     dd6:	0040                	.insn	2, 0x0040
     dd8:	07d8                	.insn	2, 0x07d8
     dda:	0000                	.insn	2, 0x0000
     ddc:	07e0                	.insn	2, 0x07e0
     dde:	0000                	.insn	2, 0x0000
     de0:	0001                	.insn	2, 0x0001
     de2:	0000005b          	.insn	4, 0x005b
     de6:	0000                	.insn	2, 0x0000
     de8:	0000                	.insn	2, 0x0000
     dea:	ff00                	.insn	2, 0xff00
     dec:	ffff                	.insn	2, 0xffff
     dee:	400a90ff 0007e000 	.insn	12, 0x0007e8000007e000400a90ff
     df6:	0007e800 
     dfa:	0100                	.insn	2, 0x0100
     dfc:	5a00                	.insn	2, 0x5a00
	...
     e06:	ffff                	.insn	2, 0xffff
     e08:	ffff                	.insn	2, 0xffff
     e0a:	0a90                	.insn	2, 0x0a90
     e0c:	0040                	.insn	2, 0x0040
     e0e:	07f4                	.insn	2, 0x07f4
     e10:	0000                	.insn	2, 0x0000
     e12:	07f8                	.insn	2, 0x07f8
     e14:	0000                	.insn	2, 0x0000
     e16:	0001                	.insn	2, 0x0001
     e18:	005a                	.insn	2, 0x005a
     e1a:	0000                	.insn	2, 0x0000
     e1c:	0000                	.insn	2, 0x0000
     e1e:	0000                	.insn	2, 0x0000
	...

00000e21 <$d.3>:
     e21:	0000                	.insn	2, 0x0000
     e23:	0000                	.insn	2, 0x0000
     e25:	0014                	.insn	2, 0x0014
     e27:	0000                	.insn	2, 0x0000
     e29:	0001                	.insn	2, 0x0001
     e2b:	145a                	.insn	2, 0x145a
     e2d:	0000                	.insn	2, 0x0000
     e2f:	ac00                	.insn	2, 0xac00
     e31:	0000                	.insn	2, 0x0000
     e33:	0100                	.insn	2, 0x0100
     e35:	5800                	.insn	2, 0x5800
	...
     e3f:	005c                	.insn	2, 0x005c
     e41:	0000                	.insn	2, 0x0000
     e43:	0070                	.insn	2, 0x0070
     e45:	0000                	.insn	2, 0x0000
     e47:	0001                	.insn	2, 0x0001
     e49:	005a                	.insn	2, 0x005a
     e4b:	0000                	.insn	2, 0x0000
     e4d:	0000                	.insn	2, 0x0000
     e4f:	0000                	.insn	2, 0x0000
     e51:	7800                	.insn	2, 0x7800
     e53:	0000                	.insn	2, 0x0000
     e55:	8400                	.insn	2, 0x8400
     e57:	0000                	.insn	2, 0x0000
     e59:	0100                	.insn	2, 0x0100
     e5b:	5a00                	.insn	2, 0x5a00
	...
     e65:	0094                	.insn	2, 0x0094
     e67:	0000                	.insn	2, 0x0000
     e69:	00b4                	.insn	2, 0x00b4
     e6b:	0000                	.insn	2, 0x0000
     e6d:	0002                	.insn	2, 0x0002
     e6f:	9f30                	.insn	2, 0x9f30
     e71:	00b4                	.insn	2, 0x00b4
     e73:	0000                	.insn	2, 0x0000
     e75:	00c0                	.insn	2, 0x00c0
     e77:	0000                	.insn	2, 0x0000
     e79:	0006                	.insn	2, 0x0006
     e7b:	0078                	.insn	2, 0x0078
     e7d:	1472                	.insn	2, 0x1472
     e7f:	9f1c                	.insn	2, 0x9f1c
     e81:	00c0                	.insn	2, 0x00c0
     e83:	0000                	.insn	2, 0x0000
     e85:	00c4                	.insn	2, 0x00c4
     e87:	0000                	.insn	2, 0x0000
     e89:	0009                	.insn	2, 0x0009
     e8b:	0078                	.insn	2, 0x0078
     e8d:	1472                	.insn	2, 0x1472
     e8f:	111c                	.insn	2, 0x111c
     e91:	2201                	.insn	2, 0x2201
     e93:	009f 0000 0000      	.insn	6, 0x009f
     e99:	0000                	.insn	2, 0x0000
     e9b:	0800                	.insn	2, 0x0800
     e9d:	0001                	.insn	2, 0x0001
     e9f:	0800                	.insn	2, 0x0800
     ea1:	0002                	.insn	2, 0x0002
     ea3:	0100                	.insn	2, 0x0100
     ea5:	5900                	.insn	2, 0x5900
	...
     eaf:	017c                	.insn	2, 0x017c
     eb1:	0000                	.insn	2, 0x0000
     eb3:	01e8                	.insn	2, 0x01e8
     eb5:	0000                	.insn	2, 0x0000
     eb7:	0001                	.insn	2, 0x0001
     eb9:	0000005b          	.insn	4, 0x005b
     ebd:	0000                	.insn	2, 0x0000
     ebf:	0000                	.insn	2, 0x0000
     ec1:	a800                	.insn	2, 0xa800
     ec3:	0001                	.insn	2, 0x0001
     ec5:	f800                	.insn	2, 0xf800
     ec7:	0001                	.insn	2, 0x0001
     ec9:	0100                	.insn	2, 0x0100
     ecb:	5c00                	.insn	2, 0x5c00
	...
     ed5:	01dc                	.insn	2, 0x01dc
     ed7:	0000                	.insn	2, 0x0000
     ed9:	01f0                	.insn	2, 0x01f0
     edb:	0000                	.insn	2, 0x0000
     edd:	0001                	.insn	2, 0x0001
     edf:	005a                	.insn	2, 0x005a
     ee1:	0000                	.insn	2, 0x0000
     ee3:	0000                	.insn	2, 0x0000
     ee5:	0000                	.insn	2, 0x0000
     ee7:	1400                	.insn	2, 0x1400
     ee9:	0002                	.insn	2, 0x0002
     eeb:	5400                	.insn	2, 0x5400
     eed:	0002                	.insn	2, 0x0002
     eef:	0100                	.insn	2, 0x0100
     ef1:	5a00                	.insn	2, 0x5a00
     ef3:	0254                	.insn	2, 0x0254
     ef5:	0000                	.insn	2, 0x0000
     ef7:	02b8                	.insn	2, 0x02b8
     ef9:	0000                	.insn	2, 0x0000
     efb:	0001                	.insn	2, 0x0001
     efd:	d864                	.insn	2, 0xd864
     eff:	0002                	.insn	2, 0x0002
     f01:	b800                	.insn	2, 0xb800
     f03:	0004                	.insn	2, 0x0004
     f05:	0100                	.insn	2, 0x0100
     f07:	6400                	.insn	2, 0x6400
	...
     f11:	0214                	.insn	2, 0x0214
     f13:	0000                	.insn	2, 0x0000
     f15:	0250                	.insn	2, 0x0250
     f17:	0000                	.insn	2, 0x0000
     f19:	0001                	.insn	2, 0x0001
     f1b:	0002505b          	.insn	4, 0x0002505b
     f1f:	ac00                	.insn	2, 0xac00
     f21:	0002                	.insn	2, 0x0002
     f23:	0100                	.insn	2, 0x0100
     f25:	5900                	.insn	2, 0x5900
     f27:	02d8                	.insn	2, 0x02d8
     f29:	0000                	.insn	2, 0x0000
     f2b:	04b8                	.insn	2, 0x04b8
     f2d:	0000                	.insn	2, 0x0000
     f2f:	0001                	.insn	2, 0x0001
     f31:	0059                	.insn	2, 0x0059
     f33:	0000                	.insn	2, 0x0000
     f35:	0000                	.insn	2, 0x0000
     f37:	0000                	.insn	2, 0x0000
     f39:	1400                	.insn	2, 0x1400
     f3b:	0002                	.insn	2, 0x0002
     f3d:	4c00                	.insn	2, 0x4c00
     f3f:	0002                	.insn	2, 0x0002
     f41:	0100                	.insn	2, 0x0100
     f43:	5c00                	.insn	2, 0x5c00
     f45:	024c                	.insn	2, 0x024c
     f47:	0000                	.insn	2, 0x0000
     f49:	02a8                	.insn	2, 0x02a8
     f4b:	0000                	.insn	2, 0x0000
     f4d:	0001                	.insn	2, 0x0001
     f4f:	d858                	.insn	2, 0xd858
     f51:	0002                	.insn	2, 0x0002
     f53:	b800                	.insn	2, 0xb800
     f55:	0004                	.insn	2, 0x0004
     f57:	0100                	.insn	2, 0x0100
     f59:	5800                	.insn	2, 0x5800
	...
     f63:	0270                	.insn	2, 0x0270
     f65:	0000                	.insn	2, 0x0000
     f67:	027c                	.insn	2, 0x027c
     f69:	0000                	.insn	2, 0x0000
     f6b:	0001                	.insn	2, 0x0001
     f6d:	0000005b          	.insn	4, 0x005b
     f71:	0000                	.insn	2, 0x0000
     f73:	0000                	.insn	2, 0x0000
     f75:	8400                	.insn	2, 0x8400
     f77:	0002                	.insn	2, 0x0002
     f79:	9800                	.insn	2, 0x9800
     f7b:	0002                	.insn	2, 0x0002
     f7d:	0100                	.insn	2, 0x0100
     f7f:	5a00                	.insn	2, 0x5a00
	...
     f89:	02f4                	.insn	2, 0x02f4
     f8b:	0000                	.insn	2, 0x0000
     f8d:	0300                	.insn	2, 0x0300
     f8f:	0000                	.insn	2, 0x0000
     f91:	0a110003          	lb	zero,161(sp)
     f95:	2c9f 0004 3400      	.insn	6, 0x340000042c9f
     f9b:	0004                	.insn	2, 0x0004
     f9d:	0300                	.insn	2, 0x0300
     f9f:	1100                	.insn	2, 0x1100
     fa1:	9f08                	.insn	2, 0x9f08
     fa3:	0434                	.insn	2, 0x0434
     fa5:	0000                	.insn	2, 0x0000
     fa7:	0448                	.insn	2, 0x0448
     fa9:	0000                	.insn	2, 0x0000
     fab:	09110003          	lb	zero,145(sp)
     faf:	489f 0004 5000      	.insn	6, 0x50000004489f
     fb5:	0004                	.insn	2, 0x0004
     fb7:	0300                	.insn	2, 0x0300
     fb9:	1100                	.insn	2, 0x1100
     fbb:	9f0a                	.insn	2, 0x9f0a
	...
     fc5:	02f4                	.insn	2, 0x02f4
     fc7:	0000                	.insn	2, 0x0000
     fc9:	02f8                	.insn	2, 0x02f8
     fcb:	0000                	.insn	2, 0x0000
     fcd:	0001                	.insn	2, 0x0001
     fcf:	0002f85b          	.insn	4, 0x0002f85b
     fd3:	0400                	.insn	2, 0x0400
     fd5:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     fd9:	5a00                	.insn	2, 0x5a00
     fdb:	033c                	.insn	2, 0x033c
     fdd:	0000                	.insn	2, 0x0000
     fdf:	0344                	.insn	2, 0x0344
     fe1:	0000                	.insn	2, 0x0000
     fe3:	00110003          	lb	zero,1(sp)
     fe7:	449f 0003 5000      	.insn	6, 0x50000003449f
     fed:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     ff1:	5a00                	.insn	2, 0x5a00
     ff3:	0350                	.insn	2, 0x0350
     ff5:	0000                	.insn	2, 0x0000
     ff7:	0358                	.insn	2, 0x0358
     ff9:	0000                	.insn	2, 0x0000
     ffb:	01110003          	lb	zero,17(sp)
     fff:	589f 0003 2000      	.insn	6, 0x20000003589f
    1005:	0004                	.insn	2, 0x0004
    1007:	0100                	.insn	2, 0x0100
    1009:	5a00                	.insn	2, 0x5a00
    100b:	0420                	.insn	2, 0x0420
    100d:	0000                	.insn	2, 0x0000
    100f:	042c                	.insn	2, 0x042c
    1011:	0000                	.insn	2, 0x0000
    1013:	017a0003          	lb	zero,23(s4)
    1017:	309f 0004 3c00      	.insn	6, 0x3c000004309f
    101d:	0004                	.insn	2, 0x0004
    101f:	0100                	.insn	2, 0x0100
    1021:	5b00                	.insn	2, 0x5b00
    1023:	0440                	.insn	2, 0x0440
    1025:	0000                	.insn	2, 0x0000
    1027:	0448                	.insn	2, 0x0448
    1029:	0000                	.insn	2, 0x0000
    102b:	0001                	.insn	2, 0x0001
    102d:	485a                	.insn	2, 0x485a
    102f:	0004                	.insn	2, 0x0004
    1031:	5800                	.insn	2, 0x5800
    1033:	0004                	.insn	2, 0x0004
    1035:	0100                	.insn	2, 0x0100
    1037:	5b00                	.insn	2, 0x5b00
	...
    1041:	02f4                	.insn	2, 0x02f4
    1043:	0000                	.insn	2, 0x0000
    1045:	031c                	.insn	2, 0x031c
    1047:	0000                	.insn	2, 0x0000
    1049:	0009                	.insn	2, 0x0009
    104b:	0085                	.insn	2, 0x0085
    104d:	1011                	.insn	2, 0x1011
    104f:	111c                	.insn	2, 0x111c
    1051:	1c9f1b7f 20000003 	.insn	12, 0x0c000003200000031c9f1b7f
    1059:	0c000003 
    105d:	8500                	.insn	2, 0x8500
    105f:	1100                	.insn	2, 0x1100
    1061:	1c10                	.insn	2, 0x1c10
    1063:	7f11                	.insn	2, 0x7f11
    1065:	2201111b          	.insn	4, 0x2201111b
    1069:	289f 0003 b800      	.insn	6, 0xb8000003289f
    106f:	0004                	.insn	2, 0x0004
    1071:	0900                	.insn	2, 0x0900
    1073:	8500                	.insn	2, 0x8500
    1075:	1100                	.insn	2, 0x1100
    1077:	1c10                	.insn	2, 0x1c10
    1079:	7f11                	.insn	2, 0x7f11
    107b:	00009f1b          	.insn	4, 0x9f1b
    107f:	0000                	.insn	2, 0x0000
    1081:	0000                	.insn	2, 0x0000
    1083:	0000                	.insn	2, 0x0000
    1085:	033c                	.insn	2, 0x033c
    1087:	0000                	.insn	2, 0x0000
    1089:	0344                	.insn	2, 0x0344
    108b:	0000                	.insn	2, 0x0000
    108d:	00110003          	lb	zero,1(sp)
    1091:	449f 0003 5000      	.insn	6, 0x50000003449f
    1097:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    109b:	1100                	.insn	2, 0x1100
    109d:	9f01                	.insn	2, 0x9f01
    109f:	0350                	.insn	2, 0x0350
    10a1:	0000                	.insn	2, 0x0000
    10a3:	0358                	.insn	2, 0x0358
    10a5:	0000                	.insn	2, 0x0000
    10a7:	00110003          	lb	zero,1(sp)
    10ab:	589f 0003 6c00      	.insn	6, 0x6c000003589f
    10b1:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    10b5:	1100                	.insn	2, 0x1100
    10b7:	9f01                	.insn	2, 0x9f01
    10b9:	036c                	.insn	2, 0x036c
    10bb:	0000                	.insn	2, 0x0000
    10bd:	0374                	.insn	2, 0x0374
    10bf:	0000                	.insn	2, 0x0000
    10c1:	02110003          	lb	zero,33(sp)
    10c5:	749f 0003 7c00      	.insn	6, 0x7c000003749f
    10cb:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    10cf:	1100                	.insn	2, 0x1100
    10d1:	037c9f03          	lh	t5,55(s9)
    10d5:	0000                	.insn	2, 0x0000
    10d7:	0384                	.insn	2, 0x0384
    10d9:	0000                	.insn	2, 0x0000
    10db:	04110003          	lb	zero,65(sp)
    10df:	849f 0003 8c00      	.insn	6, 0x8c000003849f
    10e5:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    10e9:	1100                	.insn	2, 0x1100
    10eb:	9f05                	.insn	2, 0x9f05
    10ed:	038c                	.insn	2, 0x038c
    10ef:	0000                	.insn	2, 0x0000
    10f1:	0394                	.insn	2, 0x0394
    10f3:	0000                	.insn	2, 0x0000
    10f5:	06110003          	lb	zero,97(sp)
    10f9:	949f 0003 9c00      	.insn	6, 0x9c000003949f
    10ff:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    1103:	1100                	.insn	2, 0x1100
    1105:	03a89f07          	.insn	4, 0x03a89f07
    1109:	0000                	.insn	2, 0x0000
    110b:	03b4                	.insn	2, 0x03b4
    110d:	0000                	.insn	2, 0x0000
    110f:	02110003          	lb	zero,33(sp)
    1113:	b49f 0003 c800      	.insn	6, 0xc8000003b49f
    1119:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    111d:	1100                	.insn	2, 0x1100
    111f:	03c89f03          	lh	t5,60(a7)
    1123:	0000                	.insn	2, 0x0000
    1125:	03dc                	.insn	2, 0x03dc
    1127:	0000                	.insn	2, 0x0000
    1129:	04110003          	lb	zero,65(sp)
    112d:	dc9f 0003 f000      	.insn	6, 0xf0000003dc9f
    1133:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    1137:	1100                	.insn	2, 0x1100
    1139:	9f05                	.insn	2, 0x9f05
    113b:	03f0                	.insn	2, 0x03f0
    113d:	0000                	.insn	2, 0x0000
    113f:	0404                	.insn	2, 0x0404
    1141:	0000                	.insn	2, 0x0000
    1143:	06110003          	lb	zero,97(sp)
    1147:	049f 0004 1800      	.insn	6, 0x18000004049f
    114d:	0004                	.insn	2, 0x0004
    114f:	0300                	.insn	2, 0x0300
    1151:	1100                	.insn	2, 0x1100
    1153:	04189f07          	.insn	4, 0x04189f07
    1157:	0000                	.insn	2, 0x0000
    1159:	0420                	.insn	2, 0x0420
    115b:	0000                	.insn	2, 0x0000
    115d:	08110003          	lb	zero,129(sp)
    1161:	009f 0000 0000      	.insn	6, 0x009f
    1167:	0000                	.insn	2, 0x0000
    1169:	b800                	.insn	2, 0xb800
    116b:	0004                	.insn	2, 0x0004
    116d:	cc00                	.insn	2, 0xcc00
    116f:	0004                	.insn	2, 0x0004
    1171:	0100                	.insn	2, 0x0100
    1173:	5a00                	.insn	2, 0x5a00
	...
    117d:	0514                	.insn	2, 0x0514
    117f:	0000                	.insn	2, 0x0000
    1181:	0520                	.insn	2, 0x0520
    1183:	0000                	.insn	2, 0x0000
    1185:	0001                	.insn	2, 0x0001
    1187:	0000005b          	.insn	4, 0x005b
    118b:	0000                	.insn	2, 0x0000
    118d:	0000                	.insn	2, 0x0000
    118f:	2800                	.insn	2, 0x2800
    1191:	0005                	.insn	2, 0x0005
    1193:	3c00                	.insn	2, 0x3c00
    1195:	0005                	.insn	2, 0x0005
    1197:	0100                	.insn	2, 0x0100
    1199:	5a00                	.insn	2, 0x5a00
	...
    11a3:	058c                	.insn	2, 0x058c
    11a5:	0000                	.insn	2, 0x0000
    11a7:	05f8                	.insn	2, 0x05f8
    11a9:	0000                	.insn	2, 0x0000
    11ab:	0009                	.insn	2, 0x0009
    11ad:	10110083          	lb	ra,257(sp)
    11b1:	111c                	.insn	2, 0x111c
    11b3:	f89f1b7f fc000005 	.insn	12, 0x0c000005fc000005f89f1b7f
    11bb:	0c000005 
    11bf:	8300                	.insn	2, 0x8300
    11c1:	1100                	.insn	2, 0x1100
    11c3:	1c10                	.insn	2, 0x1c10
    11c5:	7f11                	.insn	2, 0x7f11
    11c7:	2201111b          	.insn	4, 0x2201111b
    11cb:	049f 0006 3400      	.insn	6, 0x34000006049f
    11d1:	09000007          	.insn	4, 0x09000007
    11d5:	8300                	.insn	2, 0x8300
    11d7:	1100                	.insn	2, 0x1100
    11d9:	1c10                	.insn	2, 0x1c10
    11db:	7f11                	.insn	2, 0x7f11
    11dd:	00009f1b          	.insn	4, 0x9f1b
    11e1:	0000                	.insn	2, 0x0000
    11e3:	0000                	.insn	2, 0x0000
    11e5:	0000                	.insn	2, 0x0000
    11e7:	05c4                	.insn	2, 0x05c4
    11e9:	0000                	.insn	2, 0x0000
    11eb:	05f8                	.insn	2, 0x05f8
    11ed:	0000                	.insn	2, 0x0000
    11ef:	0001                	.insn	2, 0x0001
    11f1:	0000005b          	.insn	4, 0x005b
    11f5:	0000                	.insn	2, 0x0000
    11f7:	0000                	.insn	2, 0x0000
    11f9:	ec00                	.insn	2, 0xec00
    11fb:	0005                	.insn	2, 0x0005
    11fd:	f800                	.insn	2, 0xf800
    11ff:	0005                	.insn	2, 0x0005
    1201:	0100                	.insn	2, 0x0100
    1203:	5c00                	.insn	2, 0x5c00
	...
    120d:	0618                	.insn	2, 0x0618
    120f:	0000                	.insn	2, 0x0000
    1211:	061c                	.insn	2, 0x061c
    1213:	0000                	.insn	2, 0x0000
    1215:	00110003          	lb	zero,1(sp)
    1219:	1c9f 0006 2400      	.insn	6, 0x240000061c9f
    121f:	0006                	.insn	2, 0x0006
    1221:	0300                	.insn	2, 0x0300
    1223:	1100                	.insn	2, 0x1100
    1225:	9f01                	.insn	2, 0x9f01
    1227:	0624                	.insn	2, 0x0624
    1229:	0000                	.insn	2, 0x0000
    122b:	062c                	.insn	2, 0x062c
    122d:	0000                	.insn	2, 0x0000
    122f:	02110003          	lb	zero,33(sp)
    1233:	2c9f 0006 3400      	.insn	6, 0x340000062c9f
    1239:	0006                	.insn	2, 0x0006
    123b:	0300                	.insn	2, 0x0300
    123d:	1100                	.insn	2, 0x1100
    123f:	06349f03          	lh	t5,99(s1)
    1243:	0000                	.insn	2, 0x0000
    1245:	063c                	.insn	2, 0x063c
    1247:	0000                	.insn	2, 0x0000
    1249:	04110003          	lb	zero,65(sp)
    124d:	3c9f 0006 4400      	.insn	6, 0x440000063c9f
    1253:	0006                	.insn	2, 0x0006
    1255:	0300                	.insn	2, 0x0300
    1257:	1100                	.insn	2, 0x1100
    1259:	9f05                	.insn	2, 0x9f05
    125b:	0644                	.insn	2, 0x0644
    125d:	0000                	.insn	2, 0x0000
    125f:	064c                	.insn	2, 0x064c
    1261:	0000                	.insn	2, 0x0000
    1263:	06110003          	lb	zero,97(sp)
    1267:	4c9f 0006 5400      	.insn	6, 0x540000064c9f
    126d:	0006                	.insn	2, 0x0006
    126f:	0300                	.insn	2, 0x0300
    1271:	1100                	.insn	2, 0x1100
    1273:	06609f07          	.insn	4, 0x06609f07
    1277:	0000                	.insn	2, 0x0000
    1279:	0668                	.insn	2, 0x0668
    127b:	0000                	.insn	2, 0x0000
    127d:	00110003          	lb	zero,1(sp)
    1281:	689f 0006 7800      	.insn	6, 0x78000006689f
    1287:	0006                	.insn	2, 0x0006
    1289:	0300                	.insn	2, 0x0300
    128b:	1100                	.insn	2, 0x1100
    128d:	9f01                	.insn	2, 0x9f01
    128f:	0678                	.insn	2, 0x0678
    1291:	0000                	.insn	2, 0x0000
    1293:	0688                	.insn	2, 0x0688
    1295:	0000                	.insn	2, 0x0000
    1297:	02110003          	lb	zero,33(sp)
    129b:	889f 0006 9800      	.insn	6, 0x98000006889f
    12a1:	0006                	.insn	2, 0x0006
    12a3:	0300                	.insn	2, 0x0300
    12a5:	1100                	.insn	2, 0x1100
    12a7:	06989f03          	lh	t5,105(a7)
    12ab:	0000                	.insn	2, 0x0000
    12ad:	06a8                	.insn	2, 0x06a8
    12af:	0000                	.insn	2, 0x0000
    12b1:	04110003          	lb	zero,65(sp)
    12b5:	a89f 0006 b800      	.insn	6, 0xb8000006a89f
    12bb:	0006                	.insn	2, 0x0006
    12bd:	0300                	.insn	2, 0x0300
    12bf:	1100                	.insn	2, 0x1100
    12c1:	9f05                	.insn	2, 0x9f05
    12c3:	06b8                	.insn	2, 0x06b8
    12c5:	0000                	.insn	2, 0x0000
    12c7:	06c8                	.insn	2, 0x06c8
    12c9:	0000                	.insn	2, 0x0000
    12cb:	06110003          	lb	zero,97(sp)
    12cf:	c89f 0006 d800      	.insn	6, 0xd8000006c89f
    12d5:	0006                	.insn	2, 0x0006
    12d7:	0300                	.insn	2, 0x0300
    12d9:	1100                	.insn	2, 0x1100
    12db:	06d89f07          	.insn	4, 0x06d89f07
    12df:	0000                	.insn	2, 0x0000
    12e1:	06e0                	.insn	2, 0x06e0
    12e3:	0000                	.insn	2, 0x0000
    12e5:	08110003          	lb	zero,129(sp)
    12e9:	009f 0000 0000      	.insn	6, 0x009f
    12ef:	0000                	.insn	2, 0x0000
    12f1:	ec00                	.insn	2, 0xec00
    12f3:	0006                	.insn	2, 0x0006
    12f5:	f400                	.insn	2, 0xf400
    12f7:	0006                	.insn	2, 0x0006
    12f9:	0300                	.insn	2, 0x0300
    12fb:	1100                	.insn	2, 0x1100
    12fd:	9f08                	.insn	2, 0x9f08
    12ff:	06f4                	.insn	2, 0x06f4
    1301:	0000                	.insn	2, 0x0000
    1303:	06fc                	.insn	2, 0x06fc
    1305:	0000                	.insn	2, 0x0000
    1307:	09110003          	lb	zero,145(sp)
    130b:	fc9f 0006 0800      	.insn	6, 0x08000006fc9f
    1311:	03000007          	.insn	4, 0x03000007
    1315:	1100                	.insn	2, 0x1100
    1317:	9f0a                	.insn	2, 0x9f0a
    1319:	0708                	.insn	2, 0x0708
    131b:	0000                	.insn	2, 0x0000
    131d:	0710                	.insn	2, 0x0710
    131f:	0000                	.insn	2, 0x0000
    1321:	08110003          	lb	zero,129(sp)
    1325:	109f 0007 2000      	.insn	6, 0x20000007109f
    132b:	03000007          	.insn	4, 0x03000007
    132f:	1100                	.insn	2, 0x1100
    1331:	9f09                	.insn	2, 0x9f09
    1333:	0720                	.insn	2, 0x0720
    1335:	0000                	.insn	2, 0x0000
    1337:	0734                	.insn	2, 0x0734
    1339:	0000                	.insn	2, 0x0000
    133b:	0a110003          	lb	zero,161(sp)
    133f:	009f 0000 0000      	.insn	6, 0x009f
    1345:	0000                	.insn	2, 0x0000
	...

セクション .debug_abbrev の逆アセンブル:

00000000 <$d.3>:
   0:	1101                	.insn	2, 0x1101
   2:	2501                	.insn	2, 0x2501
   4:	130e                	.insn	2, 0x130e
   6:	0305                	.insn	2, 0x0305
   8:	100e                	.insn	2, 0x100e
   a:	110e1b17          	auipc	s6,0x110e1
   e:	1201                	.insn	2, 0x1201
  10:	0006                	.insn	2, 0x0006
  12:	0200                	.insn	2, 0x0200
  14:	0034                	.insn	2, 0x0034
  16:	1349                	.insn	2, 0x1349
  18:	0b3a                	.insn	2, 0x0b3a
  1a:	18020b3b          	.insn	4, 0x18020b3b
  1e:	0000                	.insn	2, 0x0000
  20:	49010103          	lb	sp,1168(sp)
  24:	04000013          	li	zero,64
  28:	0021                	.insn	2, 0x0021
  2a:	1349                	.insn	2, 0x1349
  2c:	00000b37          	lui	s6,0x0
  30:	2405                	.insn	2, 0x2405
  32:	0300                	.insn	2, 0x0300
  34:	3e0e                	.insn	2, 0x3e0e
  36:	000b0b0b          	.insn	4, 0x000b0b0b
  3a:	0600                	.insn	2, 0x0600
  3c:	0024                	.insn	2, 0x0024
  3e:	0b0b0e03          	lb	t3,176(s6) # b0 <$d.10+0x3c>
  42:	0b3e                	.insn	2, 0x0b3e
  44:	0000                	.insn	2, 0x0000
  46:	49003407          	.insn	4, 0x49003407
  4a:	3b0b3a13          	sltiu	s4,s6,944
  4e:	0205                	.insn	2, 0x0205
  50:	0018                	.insn	2, 0x0018
  52:	0800                	.insn	2, 0x0800
  54:	0016                	.insn	2, 0x0016
  56:	1349                	.insn	2, 0x1349
  58:	0b3a0e03          	lb	t3,179(s4)
  5c:	00000b3b          	.insn	4, 0x0b3b
  60:	2e09                	.insn	2, 0x2e09
  62:	0301                	.insn	2, 0x0301
  64:	3a0e                	.insn	2, 0x3a0e
  66:	27053b0b          	.insn	4, 0x27053b0b
  6a:	4919                	.insn	2, 0x4919
  6c:	20193f13          	sltiu	t5,s2,513
  70:	0a00000b          	.insn	4, 0x0a00000b
  74:	0005                	.insn	2, 0x0005
  76:	0b3a0e03          	lb	t3,179(s4)
  7a:	1349053b          	.insn	4, 0x1349053b
  7e:	0000                	.insn	2, 0x0000
  80:	0300340b          	.insn	4, 0x0300340b
  84:	3a0e                	.insn	2, 0x3a0e
  86:	49053b0b          	.insn	4, 0x49053b0b
  8a:	0c000013          	li	zero,192
  8e:	0000010b          	.insn	4, 0x010b
  92:	0f0d                	.insn	2, 0x0f0d
  94:	4900                	.insn	2, 0x4900
  96:	0e000013          	li	zero,224
  9a:	0026                	.insn	2, 0x0026
  9c:	1349                	.insn	2, 0x1349
  9e:	0000                	.insn	2, 0x0000
  a0:	11012e0f          	.insn	4, 0x11012e0f
  a4:	1201                	.insn	2, 0x1201
  a6:	4006                	.insn	2, 0x4006
  a8:	9718                	.insn	2, 0x9718
  aa:	1942                	.insn	2, 0x1942
  ac:	0b3a0e03          	lb	t3,179(s4)
  b0:	19270b3b          	.insn	4, 0x19270b3b
  b4:	0000193f 02003410 	.insn	8, 0x020034100000193f
  bc:	3a0e0317          	auipc	t1,0x3a0e0
  c0:	490b3b0b          	.insn	4, 0x490b3b0b
  c4:	11000013          	li	zero,272
  c8:	1755010b          	.insn	4, 0x1755010b
  cc:	0000                	.insn	2, 0x0000
  ce:	3412                	.insn	2, 0x3412
  d0:	0200                	.insn	2, 0x0200
  d2:	0318                	.insn	2, 0x0318
  d4:	3a0e                	.insn	2, 0x3a0e
  d6:	490b3b0b          	.insn	4, 0x490b3b0b
  da:	13000013          	li	zero,304
  de:	000a                	.insn	2, 0x000a
  e0:	0b3a0e03          	lb	t3,179(s4)
  e4:	01110b3b          	.insn	4, 0x01110b3b
  e8:	0000                	.insn	2, 0x0000
  ea:	0b14                	.insn	2, 0x0b14
  ec:	1101                	.insn	2, 0x1101
  ee:	1201                	.insn	2, 0x1201
  f0:	0006                	.insn	2, 0x0006
  f2:	1500                	.insn	2, 0x1500
  f4:	0034                	.insn	2, 0x0034
  f6:	0b3a0e03          	lb	t3,179(s4)
  fa:	13490b3b          	.insn	4, 0x13490b3b
  fe:	0000                	.insn	2, 0x0000
 100:	1d16                	.insn	2, 0x1d16
 102:	3101                	.insn	2, 0x3101
 104:	58175513          	.insn	4, 0x58175513
 108:	570b590b          	.insn	4, 0x570b590b
 10c:	1700000b          	.insn	4, 0x1700000b
 110:	0005                	.insn	2, 0x0005
 112:	1702                	.insn	2, 0x1702
 114:	1331                	.insn	2, 0x1331
 116:	0000                	.insn	2, 0x0000
 118:	3418                	.insn	2, 0x3418
 11a:	0200                	.insn	2, 0x0200
 11c:	00133117          	auipc	sp,0x133
 120:	1900                	.insn	2, 0x1900
 122:	8289                	.insn	2, 0x8289
 124:	0001                	.insn	2, 0x0001
 126:	1331                	.insn	2, 0x1331
 128:	0111                	.insn	2, 0x0111
 12a:	0000                	.insn	2, 0x0000
 12c:	2e1a                	.insn	2, 0x2e1a
 12e:	0301                	.insn	2, 0x0301
 130:	3a0e                	.insn	2, 0x3a0e
 132:	270b3b0b          	.insn	4, 0x270b3b0b
 136:	3c19                	.insn	2, 0x3c19
 138:	3f19                	.insn	2, 0x3f19
 13a:	0019                	.insn	2, 0x0019
 13c:	1b00                	.insn	2, 0x1b00
 13e:	0005                	.insn	2, 0x0005
 140:	1349                	.insn	2, 0x1349
 142:	0000                	.insn	2, 0x0000
 144:	181c                	.insn	2, 0x181c
 146:	0000                	.insn	2, 0x0000
 148:	1d00                	.insn	2, 0x1d00
 14a:	002e                	.insn	2, 0x002e
 14c:	0b3a0e03          	lb	t3,179(s4)
 150:	19270b3b          	.insn	4, 0x19270b3b
 154:	1349                	.insn	2, 0x1349
 156:	193c                	.insn	2, 0x193c
 158:	0000193f 03012e1e 	.insn	8, 0x03012e1e0000193f
 160:	3a0e                	.insn	2, 0x3a0e
 162:	270b3b0b          	.insn	4, 0x270b3b0b
 166:	4919                	.insn	2, 0x4919
 168:	3f193c13          	sltiu	s8,s2,1009
 16c:	0019                	.insn	2, 0x0019
 16e:	1f00                	.insn	2, 0x1f00
 170:	012e                	.insn	2, 0x012e
 172:	0111                	.insn	2, 0x0111
 174:	0612                	.insn	2, 0x0612
 176:	1840                	.insn	2, 0x1840
 178:	03194297          	auipc	t0,0x3194
 17c:	3a0e                	.insn	2, 0x3a0e
 17e:	27053b0b          	.insn	4, 0x27053b0b
 182:	3f19                	.insn	2, 0x3f19
 184:	0019                	.insn	2, 0x0019
 186:	2000                	.insn	2, 0x2000
 188:	0005                	.insn	2, 0x0005
 18a:	1702                	.insn	2, 0x1702
 18c:	0b3a0e03          	lb	t3,179(s4)
 190:	1349053b          	.insn	4, 0x1349053b
 194:	0000                	.insn	2, 0x0000
 196:	3421                	.insn	2, 0x3421
 198:	0200                	.insn	2, 0x0200
 19a:	3a0e0317          	auipc	t1,0x3a0e0
 19e:	49053b0b          	.insn	4, 0x49053b0b
 1a2:	22000013          	li	zero,544
 1a6:	8289                	.insn	2, 0x8289
 1a8:	0001                	.insn	2, 0x0001
 1aa:	1331                	.insn	2, 0x1331
 1ac:	4295                	.insn	2, 0x4295
 1ae:	1119                	.insn	2, 0x1119
 1b0:	0001                	.insn	2, 0x0001
 1b2:	2300                	.insn	2, 0x2300
 1b4:	002e                	.insn	2, 0x002e
 1b6:	0b3a0e03          	lb	t3,179(s4)
 1ba:	19270b3b          	.insn	4, 0x19270b3b
 1be:	193c                	.insn	2, 0x193c
 1c0:	0000193f 03002e24 	.insn	8, 0x03002e240000193f
 1c8:	3a0e                	.insn	2, 0x3a0e
 1ca:	270b3b0b          	.insn	4, 0x270b3b0b
 1ce:	3c19                	.insn	2, 0x3c19
 1d0:	3f19                	.insn	2, 0x3f19
 1d2:	8719                	.insn	2, 0x8719
 1d4:	1901                	.insn	2, 0x1901
 1d6:	0000                	.insn	2, 0x0000
 1d8:	2e25                	.insn	2, 0x2e25
 1da:	1101                	.insn	2, 0x1101
 1dc:	1201                	.insn	2, 0x1201
 1de:	4006                	.insn	2, 0x4006
 1e0:	9718                	.insn	2, 0x9718
 1e2:	1942                	.insn	2, 0x1942
 1e4:	1331                	.insn	2, 0x1331
 1e6:	0000                	.insn	2, 0x0000
 1e8:	0526                	.insn	2, 0x0526
 1ea:	0200                	.insn	2, 0x0200
 1ec:	3118                	.insn	2, 0x3118
 1ee:	00000013          	nop

000001f2 <$d.4>:
 1f2:	1101                	.insn	2, 0x1101
 1f4:	2501                	.insn	2, 0x2501
 1f6:	130e                	.insn	2, 0x130e
 1f8:	0305                	.insn	2, 0x0305
 1fa:	100e                	.insn	2, 0x100e
 1fc:	110e1b17          	auipc	s6,0x110e1
 200:	5501                	.insn	2, 0x5501
 202:	02000017          	auipc	zero,0x2000
 206:	0034                	.insn	2, 0x0034
 208:	1349                	.insn	2, 0x1349
 20a:	0b3a                	.insn	2, 0x0b3a
 20c:	1802053b          	.insn	4, 0x1802053b
 210:	0000                	.insn	2, 0x0000
 212:	49010103          	lb	sp,1168(sp) # 1335ac <$d.5+0x13215b>
 216:	04000013          	li	zero,64
 21a:	0021                	.insn	2, 0x0021
 21c:	1349                	.insn	2, 0x1349
 21e:	00000b37          	lui	s6,0x0
 222:	2405                	.insn	2, 0x2405
 224:	0300                	.insn	2, 0x0300
 226:	3e0e                	.insn	2, 0x3e0e
 228:	000b0b0b          	.insn	4, 0x000b0b0b
 22c:	0600                	.insn	2, 0x0600
 22e:	0024                	.insn	2, 0x0024
 230:	0b0b0e03          	lb	t3,176(s6) # b0 <$d.10+0x3c>
 234:	0b3e                	.insn	2, 0x0b3e
 236:	0000                	.insn	2, 0x0000
 238:	49001607          	.insn	4, 0x49001607
 23c:	3a0e0313          	addi	t1,t3,928
 240:	00053b0b          	.insn	4, 0x00053b0b
 244:	0800                	.insn	2, 0x0800
 246:	0016                	.insn	2, 0x0016
 248:	1349                	.insn	2, 0x1349
 24a:	0b3a0e03          	lb	t3,179(s4)
 24e:	00000b3b          	.insn	4, 0x0b3b
 252:	0f09                	.insn	2, 0x0f09
 254:	4900                	.insn	2, 0x4900
 256:	0a000013          	li	zero,160
 25a:	012e                	.insn	2, 0x012e
 25c:	0b3a0e03          	lb	t3,179(s4)
 260:	19270b3b          	.insn	4, 0x19270b3b
 264:	1349                	.insn	2, 0x1349
 266:	0b20                	.insn	2, 0x0b20
 268:	0000                	.insn	2, 0x0000
 26a:	0300050b          	.insn	4, 0x0300050b
 26e:	3a0e                	.insn	2, 0x3a0e
 270:	490b3b0b          	.insn	4, 0x490b3b0b
 274:	0c000013          	li	zero,192
 278:	0034                	.insn	2, 0x0034
 27a:	0b3a0e03          	lb	t3,179(s4)
 27e:	13490b3b          	.insn	4, 0x13490b3b
 282:	0000                	.insn	2, 0x0000
 284:	2e0d                	.insn	2, 0x2e0d
 286:	1101                	.insn	2, 0x1101
 288:	1201                	.insn	2, 0x1201
 28a:	4006                	.insn	2, 0x4006
 28c:	9718                	.insn	2, 0x9718
 28e:	1942                	.insn	2, 0x1942
 290:	0b3a0e03          	lb	t3,179(s4)
 294:	19270b3b          	.insn	4, 0x19270b3b
 298:	0187193f 0e000019 	.insn	8, 0x0e0000190187193f
 2a0:	011d                	.insn	2, 0x011d
 2a2:	1331                	.insn	2, 0x1331
 2a4:	0111                	.insn	2, 0x0111
 2a6:	0612                	.insn	2, 0x0612
 2a8:	0b58                	.insn	2, 0x0b58
 2aa:	0b59                	.insn	2, 0x0b59
 2ac:	00000b57          	.insn	4, 0x0b57
 2b0:	1c00050f          	.insn	4, 0x1c00050f
 2b4:	310d                	.insn	2, 0x310d
 2b6:	10000013          	li	zero,256
 2ba:	0034                	.insn	2, 0x0034
 2bc:	1702                	.insn	2, 0x1702
 2be:	1331                	.insn	2, 0x1331
 2c0:	0000                	.insn	2, 0x0000
 2c2:	3411                	.insn	2, 0x3411
 2c4:	1c00                	.insn	2, 0x1c00
 2c6:	310d                	.insn	2, 0x310d
 2c8:	12000013          	li	zero,288
 2cc:	012e                	.insn	2, 0x012e
 2ce:	0b3a0e03          	lb	t3,179(s4)
 2d2:	1927053b          	.insn	4, 0x1927053b
 2d6:	1349                	.insn	2, 0x1349
 2d8:	0b20                	.insn	2, 0x0b20
 2da:	0000                	.insn	2, 0x0000
 2dc:	03000513          	li	a0,48
 2e0:	3a0e                	.insn	2, 0x3a0e
 2e2:	49053b0b          	.insn	4, 0x49053b0b
 2e6:	14000013          	li	zero,320
 2ea:	0034                	.insn	2, 0x0034
 2ec:	0b3a0e03          	lb	t3,179(s4)
 2f0:	1349053b          	.insn	4, 0x1349053b
 2f4:	0000                	.insn	2, 0x0000
 2f6:	2e15                	.insn	2, 0x2e15
 2f8:	0301                	.insn	2, 0x0301
 2fa:	3a0e                	.insn	2, 0x3a0e
 2fc:	27053b0b          	.insn	4, 0x27053b0b
 300:	3f19                	.insn	2, 0x3f19
 302:	2019                	.insn	2, 0x2019
 304:	1600000b          	.insn	4, 0x1600000b
 308:	012e                	.insn	2, 0x012e
 30a:	0111                	.insn	2, 0x0111
 30c:	0612                	.insn	2, 0x0612
 30e:	1840                	.insn	2, 0x1840
 310:	03194297          	auipc	t0,0x3194
 314:	3a0e                	.insn	2, 0x3a0e
 316:	270b3b0b          	.insn	4, 0x270b3b0b
 31a:	3f19                	.insn	2, 0x3f19
 31c:	0019                	.insn	2, 0x0019
 31e:	1700                	.insn	2, 0x1700
 320:	0005                	.insn	2, 0x0005
 322:	1702                	.insn	2, 0x1702
 324:	0b3a0e03          	lb	t3,179(s4)
 328:	13490b3b          	.insn	4, 0x13490b3b
 32c:	0000                	.insn	2, 0x0000
 32e:	3418                	.insn	2, 0x3418
 330:	0200                	.insn	2, 0x0200
 332:	0318                	.insn	2, 0x0318
 334:	3a0e                	.insn	2, 0x3a0e
 336:	490b3b0b          	.insn	4, 0x490b3b0b
 33a:	19000013          	li	zero,400
 33e:	0111010b          	.insn	4, 0x0111010b
 342:	0612                	.insn	2, 0x0612
 344:	0000                	.insn	2, 0x0000
 346:	341a                	.insn	2, 0x341a
 348:	0200                	.insn	2, 0x0200
 34a:	3a0e0317          	auipc	t1,0x3a0e0
 34e:	490b3b0b          	.insn	4, 0x490b3b0b
 352:	1b000013          	li	zero,432
 356:	011d                	.insn	2, 0x011d
 358:	1331                	.insn	2, 0x1331
 35a:	1755                	.insn	2, 0x1755
 35c:	0b58                	.insn	2, 0x0b58
 35e:	0b59                	.insn	2, 0x0b59
 360:	00000b57          	.insn	4, 0x0b57
 364:	051c                	.insn	2, 0x051c
 366:	0200                	.insn	2, 0x0200
 368:	00133117          	auipc	sp,0x133
 36c:	1d00                	.insn	2, 0x1d00
 36e:	0005                	.insn	2, 0x0005
 370:	1802                	.insn	2, 0x1802
 372:	1331                	.insn	2, 0x1331
 374:	0000                	.insn	2, 0x0000
 376:	051e                	.insn	2, 0x051e
 378:	1c00                	.insn	2, 0x1c00
 37a:	0013310f          	.insn	4, 0x0013310f
 37e:	1f00                	.insn	2, 0x1f00
 380:	012e                	.insn	2, 0x012e
 382:	0111                	.insn	2, 0x0111
 384:	0612                	.insn	2, 0x0612
 386:	1840                	.insn	2, 0x1840
 388:	31194297          	auipc	t0,0x31194
 38c:	20000013          	li	zero,512
 390:	0034                	.insn	2, 0x0034
 392:	1802                	.insn	2, 0x1802
 394:	1331                	.insn	2, 0x1331
 396:	0000                	.insn	2, 0x0000
 398:	3421                	.insn	2, 0x3421
 39a:	1c00                	.insn	2, 0x1c00
 39c:	0013310f          	.insn	4, 0x0013310f
 3a0:	2200                	.insn	2, 0x2200
 3a2:	012e                	.insn	2, 0x012e
 3a4:	0b3a0e03          	lb	t3,179(s4)
 3a8:	1927053b          	.insn	4, 0x1927053b
 3ac:	0b20                	.insn	2, 0x0b20
 3ae:	0000                	.insn	2, 0x0000
 3b0:	02000523          	sb	zero,42(zero) # 2a <$d.3+0x2a>
 3b4:	0318                	.insn	2, 0x0318
 3b6:	3a0e                	.insn	2, 0x3a0e
 3b8:	490b3b0b          	.insn	4, 0x490b3b0b
 3bc:	24000013          	li	zero,576
 3c0:	012e                	.insn	2, 0x012e
 3c2:	0111                	.insn	2, 0x0111
 3c4:	0612                	.insn	2, 0x0612
 3c6:	1840                	.insn	2, 0x1840
 3c8:	03194297          	auipc	t0,0x3194
 3cc:	3a0e                	.insn	2, 0x3a0e
 3ce:	270b3b0b          	.insn	4, 0x270b3b0b
 3d2:	4919                	.insn	2, 0x4919
 3d4:	00193f13          	seqz	t5,s2
 3d8:	2500                	.insn	2, 0x2500
 3da:	012e                	.insn	2, 0x012e
 3dc:	0111                	.insn	2, 0x0111
 3de:	0612                	.insn	2, 0x0612
 3e0:	1840                	.insn	2, 0x1840
 3e2:	03194297          	auipc	t0,0x3194
 3e6:	3a0e                	.insn	2, 0x3a0e
 3e8:	27053b0b          	.insn	4, 0x27053b0b
 3ec:	3f19                	.insn	2, 0x3f19
 3ee:	0019                	.insn	2, 0x0019
 3f0:	2600                	.insn	2, 0x2600
 3f2:	0005                	.insn	2, 0x0005
 3f4:	1702                	.insn	2, 0x1702
 3f6:	0b3a0e03          	lb	t3,179(s4)
 3fa:	1349053b          	.insn	4, 0x1349053b
 3fe:	0000                	.insn	2, 0x0000
 400:	02003427          	.insn	4, 0x02003427
 404:	0318                	.insn	2, 0x0318
 406:	3a0e                	.insn	2, 0x3a0e
 408:	49053b0b          	.insn	4, 0x49053b0b
 40c:	28000013          	li	zero,640
 410:	000a                	.insn	2, 0x000a
 412:	0b3a0e03          	lb	t3,179(s4)
 416:	0111053b          	.insn	4, 0x0111053b
 41a:	0000                	.insn	2, 0x0000
 41c:	0b29                	.insn	2, 0x0b29
 41e:	5501                	.insn	2, 0x5501
 420:	2a000017          	auipc	zero,0x2a000
 424:	0034                	.insn	2, 0x0034
 426:	1702                	.insn	2, 0x1702
 428:	0b3a0e03          	lb	t3,179(s4)
 42c:	1349053b          	.insn	4, 0x1349053b
 430:	0000                	.insn	2, 0x0000
 432:	31011d2b          	.insn	4, 0x31011d2b
 436:	12011113          	.insn	4, 0x12011113
 43a:	5806                	.insn	2, 0x5806
 43c:	5705590b          	.insn	4, 0x5705590b
 440:	2c00000b          	.insn	4, 0x2c00000b
 444:	001d                	.insn	2, 0x001d
 446:	1331                	.insn	2, 0x1331
 448:	0111                	.insn	2, 0x0111
 44a:	0612                	.insn	2, 0x0612
 44c:	0b58                	.insn	2, 0x0b58
 44e:	0559                	.insn	2, 0x0559
 450:	00000b57          	.insn	4, 0x0b57
 454:	1d2d                	.insn	2, 0x1d2d
 456:	3100                	.insn	2, 0x3100
 458:	58175513          	.insn	4, 0x58175513
 45c:	5705590b          	.insn	4, 0x5705590b
 460:	2e00000b          	.insn	4, 0x2e00000b
 464:	0018                	.insn	2, 0x0018
 466:	0000                	.insn	2, 0x0000
 468:	11012e2f          	.insn	4, 0x11012e2f
 46c:	1201                	.insn	2, 0x1201
 46e:	4006                	.insn	2, 0x4006
 470:	9718                	.insn	2, 0x9718
 472:	1942                	.insn	2, 0x1942
 474:	0b3a0e03          	lb	t3,179(s4)
 478:	1927053b          	.insn	4, 0x1927053b
 47c:	1349                	.insn	2, 0x1349
 47e:	0000193f 02000530 	.insn	8, 0x020005300000193f
 486:	0318                	.insn	2, 0x0318
 488:	3a0e                	.insn	2, 0x3a0e
 48a:	49053b0b          	.insn	4, 0x49053b0b
 48e:	31000013          	li	zero,784
 492:	0034                	.insn	2, 0x0034
 494:	0f1c                	.insn	2, 0x0f1c
 496:	0b3a0e03          	lb	t3,179(s4)
 49a:	1349053b          	.insn	4, 0x1349053b
 49e:	0000                	.insn	2, 0x0000
 4a0:	2e32                	.insn	2, 0x2e32
 4a2:	1100                	.insn	2, 0x1100
 4a4:	1201                	.insn	2, 0x1201
 4a6:	4006                	.insn	2, 0x4006
 4a8:	9718                	.insn	2, 0x9718
 4aa:	1942                	.insn	2, 0x1942
 4ac:	0b3a0e03          	lb	t3,179(s4)
 4b0:	1927053b          	.insn	4, 0x1927053b
 4b4:	0000193f 49002633 	.insn	8, 0x490026330000193f
 4bc:	34000013          	li	zero,832
 4c0:	0016                	.insn	2, 0x0016
 4c2:	1349                	.insn	2, 0x1349
 4c4:	00000e03          	lb	t3,0(zero) # 0 <$d.3>
 4c8:	0f35                	.insn	2, 0x0f35
 4ca:	0000                	.insn	2, 0x0000
	...

000004ce <$d.4>:
 4ce:	1101                	.insn	2, 0x1101
 4d0:	2501                	.insn	2, 0x2501
 4d2:	130e                	.insn	2, 0x130e
 4d4:	0305                	.insn	2, 0x0305
 4d6:	100e                	.insn	2, 0x100e
 4d8:	110e1b17          	auipc	s6,0x110e1
 4dc:	1201                	.insn	2, 0x1201
 4de:	0006                	.insn	2, 0x0006
 4e0:	0200                	.insn	2, 0x0200
 4e2:	0034                	.insn	2, 0x0034
 4e4:	1349                	.insn	2, 0x1349
 4e6:	0b3a                	.insn	2, 0x0b3a
 4e8:	18020b3b          	.insn	4, 0x18020b3b
 4ec:	0000                	.insn	2, 0x0000
 4ee:	49010103          	lb	sp,1168(sp) # 1337f8 <$d.5+0x1323a7>
 4f2:	04000013          	li	zero,64
 4f6:	0021                	.insn	2, 0x0021
 4f8:	1349                	.insn	2, 0x1349
 4fa:	00000b37          	lui	s6,0x0
 4fe:	2405                	.insn	2, 0x2405
 500:	0300                	.insn	2, 0x0300
 502:	3e0e                	.insn	2, 0x3e0e
 504:	000b0b0b          	.insn	4, 0x000b0b0b
 508:	0600                	.insn	2, 0x0600
 50a:	0024                	.insn	2, 0x0024
 50c:	0b0b0e03          	lb	t3,176(s6) # b0 <$d.10+0x3c>
 510:	0b3e                	.insn	2, 0x0b3e
 512:	0000                	.insn	2, 0x0000
 514:	03003407          	.insn	4, 0x03003407
 518:	490e                	.insn	2, 0x490e
 51a:	3b0b3a13          	sltiu	s4,s6,944
 51e:	0018020b          	.insn	4, 0x0018020b
 522:	0800                	.insn	2, 0x0800
 524:	0021                	.insn	2, 0x0021
 526:	1349                	.insn	2, 0x1349
 528:	00000537          	lui	a0,0x0
 52c:	1609                	.insn	2, 0x1609
 52e:	4900                	.insn	2, 0x4900
 530:	3a0e0313          	addi	t1,t3,928
 534:	000b3b0b          	.insn	4, 0x000b3b0b
 538:	0a00                	.insn	2, 0x0a00
 53a:	0034                	.insn	2, 0x0034
 53c:	13490e03          	lb	t3,308(s2)
 540:	0b3a193f 18020b3b 	.insn	8, 0x18020b3b0b3a193f
 548:	0000                	.insn	2, 0x0000
 54a:	0b01130b          	.insn	4, 0x0b01130b
 54e:	3b0b3a0b          	.insn	4, 0x3b0b3a0b
 552:	0c00000b          	.insn	4, 0x0c00000b
 556:	000d                	.insn	2, 0x000d
 558:	13490e03          	lb	t3,308(s2)
 55c:	0b3a                	.insn	2, 0x0b3a
 55e:	0b380b3b          	.insn	4, 0x0b380b3b
 562:	0000                	.insn	2, 0x0000
 564:	2e0d                	.insn	2, 0x2e0d
 566:	0301                	.insn	2, 0x0301
 568:	3a0e                	.insn	2, 0x3a0e
 56a:	270b3b0b          	.insn	4, 0x270b3b0b
 56e:	4919                	.insn	2, 0x4919
 570:	20193f13          	sltiu	t5,s2,513
 574:	0e00000b          	.insn	4, 0x0e00000b
 578:	0005                	.insn	2, 0x0005
 57a:	0b3a0e03          	lb	t3,179(s4)
 57e:	13490b3b          	.insn	4, 0x13490b3b
 582:	0000                	.insn	2, 0x0000
 584:	11012e0f          	.insn	4, 0x11012e0f
 588:	1201                	.insn	2, 0x1201
 58a:	4006                	.insn	2, 0x4006
 58c:	9718                	.insn	2, 0x9718
 58e:	1942                	.insn	2, 0x1942
 590:	0b3a0e03          	lb	t3,179(s4)
 594:	19270b3b          	.insn	4, 0x19270b3b
 598:	1349                	.insn	2, 0x1349
 59a:	0000193f 02000510 	.insn	8, 0x020005100000193f
 5a2:	3a0e0317          	auipc	t1,0x3a0e0
 5a6:	490b3b0b          	.insn	4, 0x490b3b0b
 5aa:	11000013          	li	zero,272
 5ae:	0034                	.insn	2, 0x0034
 5b0:	1802                	.insn	2, 0x1802
 5b2:	0b3a0e03          	lb	t3,179(s4)
 5b6:	13490b3b          	.insn	4, 0x13490b3b
 5ba:	0000                	.insn	2, 0x0000
 5bc:	3412                	.insn	2, 0x3412
 5be:	0200                	.insn	2, 0x0200
 5c0:	3a0e0317          	auipc	t1,0x3a0e0
 5c4:	490b3b0b          	.insn	4, 0x490b3b0b
 5c8:	13000013          	li	zero,304
 5cc:	011d                	.insn	2, 0x011d
 5ce:	1331                	.insn	2, 0x1331
 5d0:	0111                	.insn	2, 0x0111
 5d2:	0612                	.insn	2, 0x0612
 5d4:	0b58                	.insn	2, 0x0b58
 5d6:	0b59                	.insn	2, 0x0b59
 5d8:	00000b57          	.insn	4, 0x0b57
 5dc:	0514                	.insn	2, 0x0514
 5de:	0200                	.insn	2, 0x0200
 5e0:	00133117          	auipc	sp,0x133
 5e4:	1500                	.insn	2, 0x1500
 5e6:	0111010b          	.insn	4, 0x0111010b
 5ea:	0612                	.insn	2, 0x0612
 5ec:	0000                	.insn	2, 0x0000
 5ee:	8916                	.insn	2, 0x8916
 5f0:	0182                	.insn	2, 0x0182
 5f2:	3100                	.insn	2, 0x3100
 5f4:	00011113          	slli	sp,sp,0x0
 5f8:	1700                	.insn	2, 0x1700
 5fa:	0034                	.insn	2, 0x0034
 5fc:	0b3a0e03          	lb	t3,179(s4)
 600:	13490b3b          	.insn	4, 0x13490b3b
 604:	0000                	.insn	2, 0x0000
 606:	0b18                	.insn	2, 0x0b18
 608:	5501                	.insn	2, 0x5501
 60a:	19000017          	auipc	zero,0x19000
 60e:	012e                	.insn	2, 0x012e
 610:	0b3a0e03          	lb	t3,179(s4)
 614:	19270b3b          	.insn	4, 0x19270b3b
 618:	193c                	.insn	2, 0x193c
 61a:	0000193f 4900051a 	.insn	8, 0x4900051a0000193f
 622:	1b000013          	li	zero,432
 626:	0018                	.insn	2, 0x0018
 628:	0000                	.insn	2, 0x0000
 62a:	0f1c                	.insn	2, 0x0f1c
 62c:	4900                	.insn	2, 0x4900
 62e:	1d000013          	li	zero,464
 632:	0026                	.insn	2, 0x0026
 634:	1349                	.insn	2, 0x1349
 636:	0000                	.insn	2, 0x0000
 638:	2e1e                	.insn	2, 0x2e1e
 63a:	0301                	.insn	2, 0x0301
 63c:	3a0e                	.insn	2, 0x3a0e
 63e:	270b3b0b          	.insn	4, 0x270b3b0b
 642:	4919                	.insn	2, 0x4919
 644:	3f193c13          	sltiu	s8,s2,1009
 648:	0019                	.insn	2, 0x0019
 64a:	1f00                	.insn	2, 0x1f00
 64c:	0000000f          	fence	unknown,unknown
 650:	2e20                	.insn	2, 0x2e20
 652:	1101                	.insn	2, 0x1101
 654:	1201                	.insn	2, 0x1201
 656:	4006                	.insn	2, 0x4006
 658:	9718                	.insn	2, 0x9718
 65a:	1942                	.insn	2, 0x1942
 65c:	1331                	.insn	2, 0x1331
 65e:	0000                	.insn	2, 0x0000
 660:	2e21                	.insn	2, 0x2e21
 662:	1101                	.insn	2, 0x1101
 664:	1201                	.insn	2, 0x1201
 666:	4006                	.insn	2, 0x4006
 668:	9718                	.insn	2, 0x9718
 66a:	1942                	.insn	2, 0x1942
 66c:	0b3a0e03          	lb	t3,179(s4)
 670:	19270b3b          	.insn	4, 0x19270b3b
 674:	000000193f 	.5byte	0x000000193f

セクション .debug_info の逆アセンブル:

00000000 <$d.4>:
       0:	0946                	.insn	2, 0x0946
       2:	0000                	.insn	2, 0x0000
       4:	0004                	.insn	2, 0x0004
       6:	0000                	.insn	2, 0x0000
       8:	0000                	.insn	2, 0x0000
       a:	0104                	.insn	2, 0x0104
       c:	013a                	.insn	2, 0x013a
       e:	0000                	.insn	2, 0x0000
      10:	001d                	.insn	2, 0x001d
      12:	01c9                	.insn	2, 0x01c9
      14:	0000                	.insn	2, 0x0000
      16:	0000                	.insn	2, 0x0000
      18:	0000                	.insn	2, 0x0000
      1a:	021d                	.insn	2, 0x021d
      1c:	0000                	.insn	2, 0x0000
      1e:	001c                	.insn	2, 0x001c
      20:	0040                	.insn	2, 0x0040
      22:	0a74                	.insn	2, 0x0a74
      24:	0000                	.insn	2, 0x0000
      26:	3302                	.insn	2, 0x3302
      28:	0000                	.insn	2, 0x0000
      2a:	0100                	.insn	2, 0x0100
      2c:	a303050f          	.insn	4, 0xa303050f
      30:	401c                	.insn	2, 0x401c
      32:	0300                	.insn	2, 0x0300
      34:	0000003f 00004604 	.insn	8, 0x46040000003f
      3c:	0e00                	.insn	2, 0x0e00
      3e:	0500                	.insn	2, 0x0500
      40:	01fc                	.insn	2, 0x01fc
      42:	0000                	.insn	2, 0x0000
      44:	0108                	.insn	2, 0x0108
      46:	e006                	.insn	2, 0xe006
      48:	0002                	.insn	2, 0x0002
      4a:	0800                	.insn	2, 0x0800
      4c:	005a0207          	.insn	4, 0x005a0207
      50:	0000                	.insn	2, 0x0000
      52:	3a01                	.insn	2, 0x3a01
      54:	0305                	.insn	2, 0x0305
      56:	1c1d                	.insn	2, 0x1c1d
      58:	0040                	.insn	2, 0x0040
      5a:	00003f03          	.insn	4, 0x3f03
      5e:	0400                	.insn	2, 0x0400
      60:	0046                	.insn	2, 0x0046
      62:	0000                	.insn	2, 0x0000
      64:	000d                	.insn	2, 0x000d
      66:	5a02                	.insn	2, 0x5a02
      68:	0000                	.insn	2, 0x0000
      6a:	0100                	.insn	2, 0x0100
      6c:	5103053f 0200401b 	.insn	8, 0x0200401b5103053f
      74:	0080                	.insn	2, 0x0080
      76:	0000                	.insn	2, 0x0000
      78:	8d01                	.insn	2, 0x8d01
      7a:	0305                	.insn	2, 0x0305
      7c:	00401c17          	auipc	s8,0x401
      80:	00003f03          	.insn	4, 0x3f03
      84:	0400                	.insn	2, 0x0400
      86:	0046                	.insn	2, 0x0046
      88:	0000                	.insn	2, 0x0000
      8a:	0006                	.insn	2, 0x0006
      8c:	9902                	.insn	2, 0x9902
      8e:	0000                	.insn	2, 0x0000
      90:	0100                	.insn	2, 0x0100
      92:	058e                	.insn	2, 0x058e
      94:	401bb403          	.insn	4, 0x401bb403
      98:	0300                	.insn	2, 0x0300
      9a:	0000003f 00004604 	.insn	8, 0x46040000003f
      a2:	1900                	.insn	2, 0x1900
      a4:	0200                	.insn	2, 0x0200
      a6:	00b2                	.insn	2, 0x00b2
      a8:	0000                	.insn	2, 0x0000
      aa:	9101                	.insn	2, 0x9101
      ac:	0305                	.insn	2, 0x0305
      ae:	1cb1                	.insn	2, 0x1cb1
      b0:	0040                	.insn	2, 0x0040
      b2:	00003f03          	.insn	4, 0x3f03
      b6:	0400                	.insn	2, 0x0400
      b8:	0046                	.insn	2, 0x0046
      ba:	0000                	.insn	2, 0x0000
      bc:	0005                	.insn	2, 0x0005
      be:	cb02                	.insn	2, 0xcb02
      c0:	0000                	.insn	2, 0x0000
      c2:	0100                	.insn	2, 0x0100
      c4:	05ae                	.insn	2, 0x05ae
      c6:	401bcd03          	lbu	s10,1025(s7)
      ca:	0300                	.insn	2, 0x0300
      cc:	0000003f 00004604 	.insn	8, 0x46040000003f
      d4:	0700                	.insn	2, 0x0700
      d6:	0200                	.insn	2, 0x0200
      d8:	00e4                	.insn	2, 0x00e4
      da:	0000                	.insn	2, 0x0000
      dc:	b301                	.insn	2, 0xb301
      de:	0305                	.insn	2, 0x0305
      e0:	1d0a                	.insn	2, 0x1d0a
      e2:	0040                	.insn	2, 0x0040
      e4:	00003f03          	.insn	4, 0x3f03
      e8:	0400                	.insn	2, 0x0400
      ea:	0046                	.insn	2, 0x0046
      ec:	0000                	.insn	2, 0x0000
      ee:	001a                	.insn	2, 0x001a
      f0:	fd02                	.insn	2, 0xfd02
      f2:	0000                	.insn	2, 0x0000
      f4:	0100                	.insn	2, 0x0100
      f6:	05ba                	.insn	2, 0x05ba
      f8:	401baa03          	lw	s4,1025(s7)
      fc:	0300                	.insn	2, 0x0300
      fe:	0000003f 00004604 	.insn	8, 0x46040000003f
     106:	0a00                	.insn	2, 0x0a00
     108:	0200                	.insn	2, 0x0200
     10a:	0116                	.insn	2, 0x0116
     10c:	0000                	.insn	2, 0x0000
     10e:	bf01                	.insn	2, 0xbf01
     110:	0305                	.insn	2, 0x0305
     112:	00401c03          	lh	s8,4(zero) # 4 <$d.4+0x4>
     116:	00003f03          	.insn	4, 0x3f03
     11a:	0400                	.insn	2, 0x0400
     11c:	0046                	.insn	2, 0x0046
     11e:	0000                	.insn	2, 0x0000
     120:	0009                	.insn	2, 0x0009
     122:	2f02                	.insn	2, 0x2f02
     124:	0001                	.insn	2, 0x0001
     126:	0100                	.insn	2, 0x0100
     128:	05c4                	.insn	2, 0x05c4
     12a:	401c2a03          	lw	s4,1025(s8) # 40147d <fat32_mount+0x109>
     12e:	0300                	.insn	2, 0x0300
     130:	0000003f 00004604 	.insn	8, 0x46040000003f
     138:	1100                	.insn	2, 0x1100
     13a:	0200                	.insn	2, 0x0200
     13c:	0116                	.insn	2, 0x0116
     13e:	0000                	.insn	2, 0x0000
     140:	cc01                	.insn	2, 0xcc01
     142:	0305                	.insn	2, 0x0305
     144:	00401c87          	.insn	4, 0x00401c87
     148:	9902                	.insn	2, 0x9902
     14a:	0000                	.insn	2, 0x0000
     14c:	0100                	.insn	2, 0x0100
     14e:	05ce                	.insn	2, 0x05ce
     150:	401c6903          	.insn	4, 0x401c6903
     154:	0200                	.insn	2, 0x0200
     156:	0162                	.insn	2, 0x0162
     158:	0000                	.insn	2, 0x0000
     15a:	d601                	.insn	2, 0xd601
     15c:	0305                	.insn	2, 0x0305
     15e:	1b99                	.insn	2, 0x1b99
     160:	0040                	.insn	2, 0x0040
     162:	00003f03          	.insn	4, 0x3f03
     166:	0400                	.insn	2, 0x0400
     168:	0046                	.insn	2, 0x0046
     16a:	0000                	.insn	2, 0x0000
     16c:	0008                	.insn	2, 0x0008
     16e:	9902                	.insn	2, 0x9902
     170:	0000                	.insn	2, 0x0000
     172:	0100                	.insn	2, 0x0100
     174:	05d8                	.insn	2, 0x05d8
     176:	401cf103          	.insn	4, 0x401cf103
     17a:	0200                	.insn	2, 0x0200
     17c:	0116                	.insn	2, 0x0116
     17e:	0000                	.insn	2, 0x0000
     180:	e001                	.insn	2, 0xe001
     182:	0305                	.insn	2, 0x0305
     184:	1ba1                	.insn	2, 0x1ba1
     186:	0040                	.insn	2, 0x0040
     188:	e402                	.insn	2, 0xe402
     18a:	0000                	.insn	2, 0x0000
     18c:	0100                	.insn	2, 0x0100
     18e:	05e2                	.insn	2, 0x05e2
     190:	401d3903          	.insn	4, 0x401d3903
     194:	0200                	.insn	2, 0x0200
     196:	01a2                	.insn	2, 0x01a2
     198:	0000                	.insn	2, 0x0000
     19a:	e801                	.insn	2, 0xe801
     19c:	0305                	.insn	2, 0x0305
     19e:	1b71                	.insn	2, 0x1b71
     1a0:	0040                	.insn	2, 0x0040
     1a2:	00003f03          	.insn	4, 0x3f03
     1a6:	0400                	.insn	2, 0x0400
     1a8:	0046                	.insn	2, 0x0046
     1aa:	0000                	.insn	2, 0x0000
     1ac:	001f bb02 0001      	.insn	6, 0x0001bb02001f
     1b2:	0100                	.insn	2, 0x0100
     1b4:	05ee                	.insn	2, 0x05ee
     1b6:	401c0c03          	lb	s8,1025(s8)
     1ba:	0300                	.insn	2, 0x0300
     1bc:	0000003f 00004604 	.insn	8, 0x46040000003f
     1c4:	0b00                	.insn	2, 0x0b00
     1c6:	0200                	.insn	2, 0x0200
     1c8:	01d4                	.insn	2, 0x01d4
     1ca:	0000                	.insn	2, 0x0000
     1cc:	f101                	.insn	2, 0xf101
     1ce:	0305                	.insn	2, 0x0305
     1d0:	1c46                	.insn	2, 0x1c46
     1d2:	0040                	.insn	2, 0x0040
     1d4:	00003f03          	.insn	4, 0x3f03
     1d8:	0400                	.insn	2, 0x0400
     1da:	0046                	.insn	2, 0x0046
     1dc:	0000                	.insn	2, 0x0000
     1de:	0014                	.insn	2, 0x0014
     1e0:	5a02                	.insn	2, 0x5a02
     1e2:	0000                	.insn	2, 0x0000
     1e4:	0100                	.insn	2, 0x0100
     1e6:	05f5                	.insn	2, 0x05f5
     1e8:	401d5303          	lhu	t1,1025(s10)
     1ec:	0200                	.insn	2, 0x0200
     1ee:	0000012f          	.insn	4, 0x012f
     1f2:	f601                	.insn	2, 0xf601
     1f4:	0305                	.insn	2, 0x0305
     1f6:	1c90                	.insn	2, 0x1c90
     1f8:	0040                	.insn	2, 0x0040
     1fa:	6202                	.insn	2, 0x6202
     1fc:	0001                	.insn	2, 0x0001
     1fe:	0100                	.insn	2, 0x0100
     200:	b60305f7          	.insn	4, 0xb60305f7
     204:	401c                	.insn	2, 0x401c
     206:	0200                	.insn	2, 0x0200
     208:	00000033          	add	zero,zero,zero
     20c:	f801                	.insn	2, 0xf801
     20e:	0305                	.insn	2, 0x0305
     210:	1cd2                	.insn	2, 0x1cd2
     212:	0040                	.insn	2, 0x0040
     214:	2102                	.insn	2, 0x2102
     216:	0002                	.insn	2, 0x0002
     218:	0100                	.insn	2, 0x0100
     21a:	05f9                	.insn	2, 0x05f9
     21c:	401c5a03          	lhu	s4,1025(s8)
     220:	0300                	.insn	2, 0x0300
     222:	0000003f 00004604 	.insn	8, 0x46040000003f
     22a:	0f00                	.insn	2, 0x0f00
     22c:	0200                	.insn	2, 0x0200
     22e:	0116                	.insn	2, 0x0116
     230:	0000                	.insn	2, 0x0000
     232:	fc01                	.insn	2, 0xfc01
     234:	0305                	.insn	2, 0x0305
     236:	1b5e                	.insn	2, 0x1b5e
     238:	0040                	.insn	2, 0x0040
     23a:	0000fd07          	.insn	4, 0xfd07
     23e:	0100                	.insn	2, 0x0100
     240:	0101                	.insn	2, 0x0101
     242:	0305                	.insn	2, 0x0305
     244:	00401b67          	.insn	4, 0x00401b67
     248:	00009907          	.insn	4, 0x9907
     24c:	0100                	.insn	2, 0x0100
     24e:	0104                	.insn	2, 0x0104
     250:	0305                	.insn	2, 0x0305
     252:	1b38                	.insn	2, 0x1b38
     254:	0040                	.insn	2, 0x0040
     256:	0000b207          	.insn	4, 0xb207
     25a:	0100                	.insn	2, 0x0100
     25c:	0305010b          	.insn	4, 0x0305010b
     260:	1c82                	.insn	2, 0x1c82
     262:	0040                	.insn	2, 0x0040
     264:	0001bb07          	.insn	4, 0x0001bb07
     268:	0100                	.insn	2, 0x0100
     26a:	010c                	.insn	2, 0x010c
     26c:	0305                	.insn	2, 0x0305
     26e:	00401c3b          	.insn	4, 0x00401c3b
     272:	0000b207          	.insn	4, 0xb207
     276:	0100                	.insn	2, 0x0100
     278:	0116                	.insn	2, 0x0116
     27a:	0305                	.insn	2, 0x0305
     27c:	1d60                	.insn	2, 0x1d60
     27e:	0040                	.insn	2, 0x0040
     280:	0000b207          	.insn	4, 0xb207
     284:	0100                	.insn	2, 0x0100
     286:	03050117          	auipc	sp,0x3050
     28a:	1d24                	.insn	2, 0x1d24
     28c:	0040                	.insn	2, 0x0040
     28e:	00029c07          	.insn	4, 0x00029c07
     292:	0100                	.insn	2, 0x0100
     294:	0118                	.insn	2, 0x0118
     296:	0305                	.insn	2, 0x0305
     298:	1ca1                	.insn	2, 0x1ca1
     29a:	0040                	.insn	2, 0x0040
     29c:	00003f03          	.insn	4, 0x3f03
     2a0:	0400                	.insn	2, 0x0400
     2a2:	0046                	.insn	2, 0x0046
     2a4:	0000                	.insn	2, 0x0000
     2a6:	0002                	.insn	2, 0x0002
     2a8:	0002b607          	.insn	4, 0x0002b607
     2ac:	0100                	.insn	2, 0x0100
     2ae:	011c                	.insn	2, 0x011c
     2b0:	0305                	.insn	2, 0x0305
     2b2:	1bd4                	.insn	2, 0x1bd4
     2b4:	0040                	.insn	2, 0x0040
     2b6:	00003f03          	.insn	4, 0x3f03
     2ba:	0400                	.insn	2, 0x0400
     2bc:	0046                	.insn	2, 0x0046
     2be:	0000                	.insn	2, 0x0000
     2c0:	0015                	.insn	2, 0x0015
     2c2:	0002d007          	.insn	4, 0x0002d007
     2c6:	0100                	.insn	2, 0x0100
     2c8:	03050127          	.insn	4, 0x03050127
     2cc:	1cbe                	.insn	2, 0x1cbe
     2ce:	0040                	.insn	2, 0x0040
     2d0:	00003f03          	.insn	4, 0x3f03
     2d4:	0400                	.insn	2, 0x0400
     2d6:	0046                	.insn	2, 0x0046
     2d8:	0000                	.insn	2, 0x0000
     2da:	0004                	.insn	2, 0x0004
     2dc:	0000e407          	.insn	4, 0xe407
     2e0:	0100                	.insn	2, 0x0100
     2e2:	0130                	.insn	2, 0x0130
     2e4:	0305                	.insn	2, 0x0305
     2e6:	1be9                	.insn	2, 0x1be9
     2e8:	0040                	.insn	2, 0x0040
     2ea:	0105                	.insn	2, 0x0105
     2ec:	0002                	.insn	2, 0x0002
     2ee:	0500                	.insn	2, 0x0500
     2f0:	0804                	.insn	2, 0x0804
     2f2:	02fc                	.insn	2, 0x02fc
     2f4:	0000                	.insn	2, 0x0000
     2f6:	000001a7          	.insn	4, 0x01a7
     2fa:	1102                	.insn	2, 0x1102
     2fc:	b605                	.insn	2, 0xb605
     2fe:	0002                	.insn	2, 0x0002
     300:	0700                	.insn	2, 0x0700
     302:	0904                	.insn	2, 0x0904
     304:	02f4                	.insn	2, 0x02f4
     306:	0000                	.insn	2, 0x0000
     308:	3401                	.insn	2, 0x3401
     30a:	ea01                	.insn	2, 0xea01
     30c:	0002                	.insn	2, 0x0002
     30e:	0100                	.insn	2, 0x0100
     310:	1b0a                	.insn	2, 0x1b0a
     312:	0001                	.insn	2, 0x0001
     314:	0100                	.insn	2, 0x0100
     316:	0134                	.insn	2, 0x0134
     318:	0000034f          	.insn	4, 0x034f
     31c:	7a0a                	.insn	2, 0x7a0a
     31e:	0000                	.insn	2, 0x0000
     320:	0100                	.insn	2, 0x0100
     322:	0134                	.insn	2, 0x0134
     324:	0359                	.insn	2, 0x0359
     326:	0000                	.insn	2, 0x0000
     328:	0000c40b          	.insn	4, 0xc40b
     32c:	0100                	.insn	2, 0x0100
     32e:	0135                	.insn	2, 0x0135
     330:	035e                	.insn	2, 0x035e
     332:	0000                	.insn	2, 0x0000
     334:	0b0c                	.insn	2, 0x0b0c
     336:	0106                	.insn	2, 0x0106
     338:	0000                	.insn	2, 0x0000
     33a:	3f01                	.insn	2, 0x3f01
     33c:	3f01                	.insn	2, 0x3f01
     33e:	0000                	.insn	2, 0x0000
     340:	0b00                	.insn	2, 0x0b00
     342:	0319                	.insn	2, 0x0319
     344:	0000                	.insn	2, 0x0000
     346:	4001                	.insn	2, 0x4001
     348:	f101                	.insn	2, 0xf101
     34a:	0002                	.insn	2, 0x0002
     34c:	0000                	.insn	2, 0x0000
     34e:	0d00                	.insn	2, 0x0d00
     350:	0354                	.insn	2, 0x0354
     352:	0000                	.insn	2, 0x0000
     354:	3f0e                	.insn	2, 0x3f0e
     356:	0000                	.insn	2, 0x0000
     358:	0d00                	.insn	2, 0x0d00
     35a:	035e                	.insn	2, 0x035e
     35c:	0000                	.insn	2, 0x0000
     35e:	f108                	.insn	2, 0xf108
     360:	0002                	.insn	2, 0x0002
     362:	7e00                	.insn	2, 0x7e00
     364:	0000                	.insn	2, 0x0000
     366:	0200                	.insn	2, 0x0200
     368:	0f14                	.insn	2, 0x0f14
     36a:	001c                	.insn	2, 0x001c
     36c:	0040                	.insn	2, 0x0040
     36e:	08ec                	.insn	2, 0x08ec
     370:	0000                	.insn	2, 0x0000
     372:	5201                	.insn	2, 0x5201
     374:	01df 0000 0501      	.insn	6, 0x0501000001df
     37a:	0010                	.insn	2, 0x0010
     37c:	0000                	.insn	2, 0x0000
     37e:	3500                	.insn	2, 0x3500
     380:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     384:	f114                	.insn	2, 0xf114
     386:	0002                	.insn	2, 0x0002
     388:	1100                	.insn	2, 0x1100
     38a:	0000                	.insn	2, 0x0000
     38c:	0000                	.insn	2, 0x0000
     38e:	0312                	.insn	2, 0x0312
     390:	ac91                	.insn	2, 0xac91
     392:	0801                	.insn	2, 0x0801
     394:	0001                	.insn	2, 0x0001
     396:	0100                	.insn	2, 0x0100
     398:	2c29                	.insn	2, 0x2c29
     39a:	0009                	.insn	2, 0x0009
     39c:	1200                	.insn	2, 0x1200
     39e:	018c9103          	lh	sp,24(s9)
     3a2:	0205                	.insn	2, 0x0205
     3a4:	0000                	.insn	2, 0x0000
     3a6:	7901                	.insn	2, 0x7901
     3a8:	0938                	.insn	2, 0x0938
     3aa:	0000                	.insn	2, 0x0000
     3ac:	1f10                	.insn	2, 0x1f10
     3ae:	0000                	.insn	2, 0x0000
     3b0:	c300                	.insn	2, 0xc300
     3b2:	0002                	.insn	2, 0x0002
     3b4:	0100                	.insn	2, 0x0100
     3b6:	ea7a                	.insn	2, 0xea7a
     3b8:	0002                	.insn	2, 0x0002
     3ba:	1000                	.insn	2, 0x1000
     3bc:	005e                	.insn	2, 0x005e
     3be:	0000                	.insn	2, 0x0000
     3c0:	0000002b          	.insn	4, 0x002b
     3c4:	2a01                	.insn	2, 0x2a01
     3c6:	02ea                	.insn	2, 0x02ea
     3c8:	0000                	.insn	2, 0x0000
     3ca:	1010                	.insn	2, 0x1010
     3cc:	0001                	.insn	2, 0x0001
     3ce:	4700                	.insn	2, 0x4700
     3d0:	0000                	.insn	2, 0x0000
     3d2:	0100                	.insn	2, 0x0100
     3d4:	447d                	.insn	2, 0x447d
     3d6:	0009                	.insn	2, 0x0009
     3d8:	1300                	.insn	2, 0x1300
     3da:	0071                	.insn	2, 0x0071
     3dc:	0000                	.insn	2, 0x0000
     3de:	1801                	.insn	2, 0x1801
     3e0:	0228                	.insn	2, 0x0228
     3e2:	0040                	.insn	2, 0x0040
     3e4:	b014                	.insn	2, 0xb014
     3e6:	34004007          	.insn	4, 0x34004007
     3ea:	0000                	.insn	2, 0x0000
     3ec:	1000                	.insn	2, 0x1000
     3ee:	000003c3          	.insn	4, 0x03c3
     3f2:	0376                	.insn	2, 0x0376
     3f4:	0000                	.insn	2, 0x0000
     3f6:	e601                	.insn	2, 0xe601
     3f8:	02fc                	.insn	2, 0x02fc
     3fa:	0000                	.insn	2, 0x0000
     3fc:	1400                	.insn	2, 0x1400
     3fe:	077c                	.insn	2, 0x077c
     400:	0040                	.insn	2, 0x0040
     402:	001c                	.insn	2, 0x001c
     404:	0000                	.insn	2, 0x0000
     406:	b010                	.insn	2, 0xb010
     408:	76000003          	lb	zero,1888(zero) # 760 <$d.3+0x22e>
     40c:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     410:	fcdc                	.insn	2, 0xfcdc
     412:	0002                	.insn	2, 0x0002
     414:	0000                	.insn	2, 0x0000
     416:	a814                	.insn	2, 0xa814
     418:	4006                	.insn	2, 0x4006
     41a:	1c00                	.insn	2, 0x1c00
     41c:	0000                	.insn	2, 0x0000
     41e:	1000                	.insn	2, 0x1000
     420:	02d0                	.insn	2, 0x02d0
     422:	0000                	.insn	2, 0x0000
     424:	003e                	.insn	2, 0x003e
     426:	0000                	.insn	2, 0x0000
     428:	d201                	.insn	2, 0xd201
     42a:	02fc                	.insn	2, 0x02fc
     42c:	0000                	.insn	2, 0x0000
     42e:	1100                	.insn	2, 0x1100
     430:	0018                	.insn	2, 0x0018
     432:	0000                	.insn	2, 0x0000
     434:	a610                	.insn	2, 0xa610
     436:	0002                	.insn	2, 0x0002
     438:	4e00                	.insn	2, 0x4e00
     43a:	0000                	.insn	2, 0x0000
     43c:	0100                	.insn	2, 0x0100
     43e:	f1c0                	.insn	2, 0xf1c0
     440:	0002                	.insn	2, 0x0002
     442:	0000                	.insn	2, 0x0000
     444:	3011                	.insn	2, 0x3011
     446:	0000                	.insn	2, 0x0000
     448:	1000                	.insn	2, 0x1000
     44a:	027a                	.insn	2, 0x027a
     44c:	0000                	.insn	2, 0x0000
     44e:	0161                	.insn	2, 0x0161
     450:	0000                	.insn	2, 0x0000
     452:	af01                	.insn	2, 0xaf01
     454:	02fc                	.insn	2, 0x02fc
     456:	0000                	.insn	2, 0x0000
     458:	1100                	.insn	2, 0x1100
     45a:	0048                	.insn	2, 0x0048
     45c:	0000                	.insn	2, 0x0000
     45e:	3b10                	.insn	2, 0x3b10
     460:	0001                	.insn	2, 0x0001
     462:	4900                	.insn	2, 0x4900
     464:	0000                	.insn	2, 0x0000
     466:	0100                	.insn	2, 0x0100
     468:	0002f193          	andi	gp,t0,0
     46c:	1000                	.insn	2, 0x1000
     46e:	0189                	.insn	2, 0x0189
     470:	0000                	.insn	2, 0x0000
     472:	0000002b          	.insn	4, 0x002b
     476:	9401                	.insn	2, 0x9401
     478:	02f1                	.insn	2, 0x02f1
     47a:	0000                	.insn	2, 0x0000
     47c:	9215                	.insn	2, 0x9215
     47e:	0002                	.insn	2, 0x0002
     480:	0100                	.insn	2, 0x0100
     482:	5e95                	.insn	2, 0x5e95
     484:	16000003          	lb	zero,352(zero) # 160 <$d.6+0x26>
     488:	00000303          	lb	t1,0(zero) # 0 <$d.4>
     48c:	0070                	.insn	2, 0x0070
     48e:	0000                	.insn	2, 0x0000
     490:	9801                	.insn	2, 0x9801
     492:	1715                	.insn	2, 0x1715
     494:	0221                	.insn	2, 0x0221
     496:	0000                	.insn	2, 0x0000
     498:	0310                	.insn	2, 0x0310
     49a:	0000                	.insn	2, 0x0000
     49c:	df18                	.insn	2, 0xdf18
     49e:	0001                	.insn	2, 0x0001
     4a0:	2800                	.insn	2, 0x2800
     4a2:	11000003          	lb	zero,272(zero) # 110 <$d.10+0x9c>
     4a6:	0090                	.insn	2, 0x0090
     4a8:	0000                	.insn	2, 0x0000
     4aa:	e318                	.insn	2, 0xe318
     4ac:	0002                	.insn	2, 0x0002
     4ae:	3500                	.insn	2, 0x3500
     4b0:	18000003          	lb	zero,384(zero) # 180 <$d.6+0x46>
     4b4:	0301                	.insn	2, 0x0301
     4b6:	0000                	.insn	2, 0x0000
     4b8:	0341                	.insn	2, 0x0341
     4ba:	0000                	.insn	2, 0x0000
     4bc:	0000                	.insn	2, 0x0000
     4be:	0316                	.insn	2, 0x0316
     4c0:	b0000003          	lb	zero,-1280(zero) # fffffb00 <USER_MAX+0xffaffb00>
     4c4:	0000                	.insn	2, 0x0000
     4c6:	0100                	.insn	2, 0x0100
     4c8:	159e                	.insn	2, 0x159e
     4ca:	00034a17          	auipc	s4,0x34
     4ce:	1000                	.insn	2, 0x1000
     4d0:	18000003          	lb	zero,384(zero) # 180 <$d.6+0x46>
     4d4:	0314                	.insn	2, 0x0314
     4d6:	0000                	.insn	2, 0x0000
     4d8:	0328                	.insn	2, 0x0328
     4da:	0000                	.insn	2, 0x0000
     4dc:	c811                	.insn	2, 0xc811
     4de:	0000                	.insn	2, 0x0000
     4e0:	1800                	.insn	2, 0x1800
     4e2:	03d6                	.insn	2, 0x03d6
     4e4:	0000                	.insn	2, 0x0000
     4e6:	0335                	.insn	2, 0x0335
     4e8:	0000                	.insn	2, 0x0000
     4ea:	f418                	.insn	2, 0xf418
     4ec:	41000003          	lb	zero,1040(zero) # 410 <$d.6+0x180>
     4f0:	00000003          	lb	zero,0(zero) # 0 <$d.4>
     4f4:	0000                	.insn	2, 0x0000
     4f6:	e811                	.insn	2, 0xe811
     4f8:	0000                	.insn	2, 0x0000
     4fa:	1000                	.insn	2, 0x1000
     4fc:	0094                	.insn	2, 0x0094
     4fe:	0000                	.insn	2, 0x0000
     500:	0044                	.insn	2, 0x0044
     502:	0000                	.insn	2, 0x0000
     504:	3401                	.insn	2, 0x3401
     506:	02f1                	.insn	2, 0x02f1
     508:	0000                	.insn	2, 0x0000
     50a:	e710                	.insn	2, 0xe710
     50c:	0000                	.insn	2, 0x0000
     50e:	e000                	.insn	2, 0xe000
     510:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     514:	ea45                	.insn	2, 0xea45
     516:	0002                	.insn	2, 0x0002
     518:	1500                	.insn	2, 0x1500
     51a:	03a5                	.insn	2, 0x03a5
     51c:	0000                	.insn	2, 0x0000
     51e:	3601                	.insn	2, 0x3601
     520:	0921                	.insn	2, 0x0921
     522:	0000                	.insn	2, 0x0000
     524:	0a15                	.insn	2, 0x0a15
     526:	0002                	.insn	2, 0x0002
     528:	0100                	.insn	2, 0x0100
     52a:	00092137          	lui	sp,0x92
     52e:	0000                	.insn	2, 0x0000
     530:	1900                	.insn	2, 0x1900
     532:	078d                	.insn	2, 0x078d
     534:	0000                	.insn	2, 0x0000
     536:	0064                	.insn	2, 0x0064
     538:	0040                	.insn	2, 0x0040
     53a:	8d19                	.insn	2, 0x8d19
     53c:	28000007          	.insn	4, 0x28000007
     540:	4002                	.insn	2, 0x4002
     542:	1900                	.insn	2, 0x1900
     544:	0000079b          	.insn	4, 0x079b
     548:	0234                	.insn	2, 0x0234
     54a:	0040                	.insn	2, 0x0040
     54c:	9b19                	.insn	2, 0x9b19
     54e:	40000007          	.insn	4, 0x40000007
     552:	4002                	.insn	2, 0x4002
     554:	1900                	.insn	2, 0x1900
     556:	0000079b          	.insn	4, 0x079b
     55a:	024c                	.insn	2, 0x024c
     55c:	0040                	.insn	2, 0x0040
     55e:	9b19                	.insn	2, 0x9b19
     560:	58000007          	.insn	4, 0x58000007
     564:	4002                	.insn	2, 0x4002
     566:	1900                	.insn	2, 0x1900
     568:	0000079b          	.insn	4, 0x079b
     56c:	0264                	.insn	2, 0x0264
     56e:	0040                	.insn	2, 0x0040
     570:	9b19                	.insn	2, 0x9b19
     572:	70000007          	.insn	4, 0x70000007
     576:	4002                	.insn	2, 0x4002
     578:	1900                	.insn	2, 0x1900
     57a:	0000079b          	.insn	4, 0x079b
     57e:	027c                	.insn	2, 0x027c
     580:	0040                	.insn	2, 0x0040
     582:	9b19                	.insn	2, 0x9b19
     584:	88000007          	.insn	4, 0x88000007
     588:	4002                	.insn	2, 0x4002
     58a:	1900                	.insn	2, 0x1900
     58c:	0000079b          	.insn	4, 0x079b
     590:	0294                	.insn	2, 0x0294
     592:	0040                	.insn	2, 0x0040
     594:	9b19                	.insn	2, 0x9b19
     596:	a0000007          	.insn	4, 0xa0000007
     59a:	4002                	.insn	2, 0x4002
     59c:	1900                	.insn	2, 0x1900
     59e:	0000079b          	.insn	4, 0x079b
     5a2:	02ac                	.insn	2, 0x02ac
     5a4:	0040                	.insn	2, 0x0040
     5a6:	9b19                	.insn	2, 0x9b19
     5a8:	b8000007          	.insn	4, 0xb8000007
     5ac:	4002                	.insn	2, 0x4002
     5ae:	1900                	.insn	2, 0x1900
     5b0:	0000079b          	.insn	4, 0x079b
     5b4:	02c4                	.insn	2, 0x02c4
     5b6:	0040                	.insn	2, 0x0040
     5b8:	9b19                	.insn	2, 0x9b19
     5ba:	d0000007          	.insn	4, 0xd0000007
     5be:	4002                	.insn	2, 0x4002
     5c0:	1900                	.insn	2, 0x1900
     5c2:	0000079b          	.insn	4, 0x079b
     5c6:	02dc                	.insn	2, 0x02dc
     5c8:	0040                	.insn	2, 0x0040
     5ca:	9b19                	.insn	2, 0x9b19
     5cc:	e8000007          	.insn	4, 0xe8000007
     5d0:	4002                	.insn	2, 0x4002
     5d2:	1900                	.insn	2, 0x1900
     5d4:	0000079b          	.insn	4, 0x079b
     5d8:	02f4                	.insn	2, 0x02f4
     5da:	0040                	.insn	2, 0x0040
     5dc:	a819                	.insn	2, 0xa819
     5de:	fc000007          	.insn	4, 0xfc000007
     5e2:	4002                	.insn	2, 0x4002
     5e4:	1900                	.insn	2, 0x1900
     5e6:	000007b3          	add	a5,zero,zero
     5ea:	0338                	.insn	2, 0x0338
     5ec:	0040                	.insn	2, 0x0040
     5ee:	9b19                	.insn	2, 0x9b19
     5f0:	6c000007          	.insn	4, 0x6c000007
     5f4:	19004003          	lbu	zero,400(zero) # 190 <$d.6+0x56>
     5f8:	0000079b          	.insn	4, 0x079b
     5fc:	0378                	.insn	2, 0x0378
     5fe:	0040                	.insn	2, 0x0040
     600:	9b19                	.insn	2, 0x9b19
     602:	b8000007          	.insn	4, 0xb8000007
     606:	19004003          	lbu	zero,400(zero) # 190 <$d.6+0x56>
     60a:	07a8                	.insn	2, 0x07a8
     60c:	0000                	.insn	2, 0x0000
     60e:	03c0                	.insn	2, 0x03c0
     610:	0040                	.insn	2, 0x0040
     612:	8d19                	.insn	2, 0x8d19
     614:	dc000007          	.insn	4, 0xdc000007
     618:	19004003          	lbu	zero,400(zero) # 190 <$d.6+0x56>
     61c:	078d                	.insn	2, 0x078d
     61e:	0000                	.insn	2, 0x0000
     620:	03f0                	.insn	2, 0x03f0
     622:	0040                	.insn	2, 0x0040
     624:	be19                	.insn	2, 0xbe19
     626:	8c000007          	.insn	4, 0x8c000007
     62a:	4004                	.insn	2, 0x4004
     62c:	1900                	.insn	2, 0x1900
     62e:	07be                	.insn	2, 0x07be
     630:	0000                	.insn	2, 0x0000
     632:	04a0                	.insn	2, 0x04a0
     634:	0040                	.insn	2, 0x0040
     636:	be19                	.insn	2, 0xbe19
     638:	b4000007          	.insn	4, 0xb4000007
     63c:	4004                	.insn	2, 0x4004
     63e:	1900                	.insn	2, 0x1900
     640:	07be                	.insn	2, 0x07be
     642:	0000                	.insn	2, 0x0000
     644:	04c8                	.insn	2, 0x04c8
     646:	0040                	.insn	2, 0x0040
     648:	be19                	.insn	2, 0xbe19
     64a:	dc000007          	.insn	4, 0xdc000007
     64e:	4004                	.insn	2, 0x4004
     650:	1900                	.insn	2, 0x1900
     652:	07be                	.insn	2, 0x07be
     654:	0000                	.insn	2, 0x0000
     656:	04f0                	.insn	2, 0x04f0
     658:	0040                	.insn	2, 0x0040
     65a:	be19                	.insn	2, 0xbe19
     65c:	04000007          	.insn	4, 0x04000007
     660:	4005                	.insn	2, 0x4005
     662:	1900                	.insn	2, 0x1900
     664:	07be                	.insn	2, 0x07be
     666:	0000                	.insn	2, 0x0000
     668:	0518                	.insn	2, 0x0518
     66a:	0040                	.insn	2, 0x0040
     66c:	be19                	.insn	2, 0xbe19
     66e:	2c000007          	.insn	4, 0x2c000007
     672:	4005                	.insn	2, 0x4005
     674:	1900                	.insn	2, 0x1900
     676:	07be                	.insn	2, 0x07be
     678:	0000                	.insn	2, 0x0000
     67a:	0540                	.insn	2, 0x0540
     67c:	0040                	.insn	2, 0x0040
     67e:	be19                	.insn	2, 0xbe19
     680:	54000007          	.insn	4, 0x54000007
     684:	4005                	.insn	2, 0x4005
     686:	1900                	.insn	2, 0x1900
     688:	07be                	.insn	2, 0x07be
     68a:	0000                	.insn	2, 0x0000
     68c:	0568                	.insn	2, 0x0568
     68e:	0040                	.insn	2, 0x0040
     690:	be19                	.insn	2, 0xbe19
     692:	7c000007          	.insn	4, 0x7c000007
     696:	4005                	.insn	2, 0x4005
     698:	1900                	.insn	2, 0x1900
     69a:	07be                	.insn	2, 0x07be
     69c:	0000                	.insn	2, 0x0000
     69e:	0590                	.insn	2, 0x0590
     6a0:	0040                	.insn	2, 0x0040
     6a2:	be19                	.insn	2, 0xbe19
     6a4:	a4000007          	.insn	4, 0xa4000007
     6a8:	4005                	.insn	2, 0x4005
     6aa:	1900                	.insn	2, 0x1900
     6ac:	078d                	.insn	2, 0x078d
     6ae:	0000                	.insn	2, 0x0000
     6b0:	05b8                	.insn	2, 0x05b8
     6b2:	0040                	.insn	2, 0x0040
     6b4:	9b19                	.insn	2, 0x9b19
     6b6:	14000007          	.insn	4, 0x14000007
     6ba:	4006                	.insn	2, 0x4006
     6bc:	1900                	.insn	2, 0x1900
     6be:	07d4                	.insn	2, 0x07d4
     6c0:	0000                	.insn	2, 0x0000
     6c2:	0638                	.insn	2, 0x0638
     6c4:	0040                	.insn	2, 0x0040
     6c6:	e519                	.insn	2, 0xe519
     6c8:	58000007          	.insn	4, 0x58000007
     6cc:	4006                	.insn	2, 0x4006
     6ce:	1900                	.insn	2, 0x1900
     6d0:	07d4                	.insn	2, 0x07d4
     6d2:	0000                	.insn	2, 0x0000
     6d4:	067c                	.insn	2, 0x067c
     6d6:	0040                	.insn	2, 0x0040
     6d8:	f719                	.insn	2, 0xf719
     6da:	a0000007          	.insn	4, 0xa0000007
     6de:	4006                	.insn	2, 0x4006
     6e0:	1900                	.insn	2, 0x1900
     6e2:	07d4                	.insn	2, 0x07d4
     6e4:	0000                	.insn	2, 0x0000
     6e6:	06b8                	.insn	2, 0x06b8
     6e8:	0040                	.insn	2, 0x0040
     6ea:	7119                	.insn	2, 0x7119
     6ec:	0008                	.insn	2, 0x0008
     6ee:	c000                	.insn	2, 0xc000
     6f0:	4006                	.insn	2, 0x4006
     6f2:	1900                	.insn	2, 0x1900
     6f4:	07d4                	.insn	2, 0x07d4
     6f6:	0000                	.insn	2, 0x0000
     6f8:	078c                	.insn	2, 0x078c
     6fa:	0040                	.insn	2, 0x0040
     6fc:	7e19                	.insn	2, 0x7e19
     6fe:	0008                	.insn	2, 0x0008
     700:	9400                	.insn	2, 0x9400
     702:	19004007          	.insn	4, 0x19004007
     706:	0000088b          	.insn	4, 0x088b
     70a:	07a8                	.insn	2, 0x07a8
     70c:	0040                	.insn	2, 0x0040
     70e:	d419                	.insn	2, 0xd419
     710:	c0000007          	.insn	4, 0xc0000007
     714:	19004007          	.insn	4, 0x19004007
     718:	0898                	.insn	2, 0x0898
     71a:	0000                	.insn	2, 0x0000
     71c:	07e0                	.insn	2, 0x07e0
     71e:	0040                	.insn	2, 0x0040
     720:	e519                	.insn	2, 0xe519
     722:	4c000007          	.insn	4, 0x4c000007
     726:	4008                	.insn	2, 0x4008
     728:	1900                	.insn	2, 0x1900
     72a:	08a5                	.insn	2, 0x08a5
     72c:	0000                	.insn	2, 0x0000
     72e:	0858                	.insn	2, 0x0858
     730:	0040                	.insn	2, 0x0040
     732:	8d19                	.insn	2, 0x8d19
     734:	6c000007          	.insn	4, 0x6c000007
     738:	4008                	.insn	2, 0x4008
     73a:	1900                	.insn	2, 0x1900
     73c:	08b0                	.insn	2, 0x08b0
     73e:	0000                	.insn	2, 0x0000
     740:	0878                	.insn	2, 0x0878
     742:	0040                	.insn	2, 0x0040
     744:	b719                	.insn	2, 0xb719
     746:	0008                	.insn	2, 0x0008
     748:	9000                	.insn	2, 0x9000
     74a:	4008                	.insn	2, 0x4008
     74c:	1900                	.insn	2, 0x1900
     74e:	078d                	.insn	2, 0x078d
     750:	0000                	.insn	2, 0x0000
     752:	08ac                	.insn	2, 0x08ac
     754:	0040                	.insn	2, 0x0040
     756:	8d19                	.insn	2, 0x8d19
     758:	bc000007          	.insn	4, 0xbc000007
     75c:	4008                	.insn	2, 0x4008
     75e:	1900                	.insn	2, 0x1900
     760:	078d                	.insn	2, 0x078d
     762:	0000                	.insn	2, 0x0000
     764:	08cc                	.insn	2, 0x08cc
     766:	0040                	.insn	2, 0x0040
     768:	8d19                	.insn	2, 0x8d19
     76a:	dc000007          	.insn	4, 0xdc000007
     76e:	4008                	.insn	2, 0x4008
     770:	1900                	.insn	2, 0x1900
     772:	078d                	.insn	2, 0x078d
     774:	0000                	.insn	2, 0x0000
     776:	08ec                	.insn	2, 0x08ec
     778:	0040                	.insn	2, 0x0040
     77a:	8d19                	.insn	2, 0x8d19
     77c:	fc000007          	.insn	4, 0xfc000007
     780:	4008                	.insn	2, 0x4008
     782:	1900                	.insn	2, 0x1900
     784:	08c8                	.insn	2, 0x08c8
     786:	0000                	.insn	2, 0x0000
     788:	0908                	.insn	2, 0x0908
     78a:	0040                	.insn	2, 0x0040
     78c:	1a00                	.insn	2, 0x1a00
     78e:	0000036f          	jal	t1,78e <$d.3+0x25c>
     792:	4102                	.insn	2, 0x4102
     794:	00034f1b          	.insn	4, 0x00034f1b
     798:	1c00                	.insn	2, 0x1c00
     79a:	1a00                	.insn	2, 0x1a00
     79c:	03c9                	.insn	2, 0x03c9
     79e:	0000                	.insn	2, 0x0000
     7a0:	3302                	.insn	2, 0x3302
     7a2:	00003f1b          	.insn	4, 0x3f1b
     7a6:	0000                	.insn	2, 0x0000
     7a8:	501d                	.insn	2, 0x501d
     7aa:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
     7ae:	f140                	.insn	2, 0xf140
     7b0:	0002                	.insn	2, 0x0002
     7b2:	1d00                	.insn	2, 0x1d00
     7b4:	0000038b          	.insn	4, 0x038b
     7b8:	3502                	.insn	2, 0x3502
     7ba:	02ea                	.insn	2, 0x02ea
     7bc:	0000                	.insn	2, 0x0000
     7be:	fe1e                	.insn	2, 0xfe1e
     7c0:	0002                	.insn	2, 0x0002
     7c2:	0200                	.insn	2, 0x0200
     7c4:	ea3d                	.insn	2, 0xea3d
     7c6:	0002                	.insn	2, 0x0002
     7c8:	1b00                	.insn	2, 0x1b00
     7ca:	0000034f          	.insn	4, 0x034f
     7ce:	00034f1b          	.insn	4, 0x00034f1b
     7d2:	0000                	.insn	2, 0x0000
     7d4:	d11e                	.insn	2, 0xd11e
     7d6:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
     7da:	fc32                	.insn	2, 0xfc32
     7dc:	0002                	.insn	2, 0x0002
     7de:	1b00                	.insn	2, 0x1b00
     7e0:	0000034f          	.insn	4, 0x034f
     7e4:	1a00                	.insn	2, 0x1a00
     7e6:	0189                	.insn	2, 0x0189
     7e8:	0000                	.insn	2, 0x0000
     7ea:	2d02                	.insn	2, 0x2d02
     7ec:	0002f11b          	.insn	4, 0x0002f11b
     7f0:	1b00                	.insn	2, 0x1b00
     7f2:	02f1                	.insn	2, 0x02f1
     7f4:	0000                	.insn	2, 0x0000
     7f6:	1f00                	.insn	2, 0x1f00
     7f8:	09d4                	.insn	2, 0x09d4
     7fa:	0040                	.insn	2, 0x0040
     7fc:	00bc                	.insn	2, 0x00bc
     7fe:	0000                	.insn	2, 0x0000
     800:	5201                	.insn	2, 0x5201
     802:	0020                	.insn	2, 0x0020
     804:	0000                	.insn	2, 0x0000
     806:	2201                	.insn	2, 0x2201
     808:	2001                	.insn	2, 0x2001
     80a:	04d5                	.insn	2, 0x04d5
     80c:	0000                	.insn	2, 0x0000
     80e:	0161                	.insn	2, 0x0161
     810:	0000                	.insn	2, 0x0000
     812:	2201                	.insn	2, 0x2201
     814:	fc01                	.insn	2, 0xfc01
     816:	0002                	.insn	2, 0x0002
     818:	2100                	.insn	2, 0x2100
     81a:	0512                	.insn	2, 0x0512
     81c:	0000                	.insn	2, 0x0000
     81e:	003e                	.insn	2, 0x003e
     820:	0000                	.insn	2, 0x0000
     822:	2401                	.insn	2, 0x2401
     824:	ea01                	.insn	2, 0xea01
     826:	0002                	.insn	2, 0x0002
     828:	1400                	.insn	2, 0x1400
     82a:	09f8                	.insn	2, 0x09f8
     82c:	0040                	.insn	2, 0x0040
     82e:	0054                	.insn	2, 0x0054
     830:	0000                	.insn	2, 0x0000
     832:	f321                	.insn	2, 0xf321
     834:	0004                	.insn	2, 0x0004
     836:	7800                	.insn	2, 0x7800
     838:	0000                	.insn	2, 0x0000
     83a:	0100                	.insn	2, 0x0100
     83c:	0125                	.insn	2, 0x0125
     83e:	02fc                	.insn	2, 0x02fc
     840:	0000                	.insn	2, 0x0000
     842:	1900                	.insn	2, 0x1900
     844:	0910                	.insn	2, 0x0910
     846:	0000                	.insn	2, 0x0000
     848:	0a1c                	.insn	2, 0x0a1c
     84a:	0040                	.insn	2, 0x0040
     84c:	8d19                	.insn	2, 0x8d19
     84e:	30000007          	.insn	4, 0x30000007
     852:	400a                	.insn	2, 0x400a
     854:	1900                	.insn	2, 0x1900
     856:	0000079b          	.insn	4, 0x079b
     85a:	0a48                	.insn	2, 0x0a48
     85c:	0040                	.insn	2, 0x0040
     85e:	9b19                	.insn	2, 0x9b19
     860:	60000007          	.insn	4, 0x60000007
     864:	400a                	.insn	2, 0x400a
     866:	2200                	.insn	2, 0x2200
     868:	078d                	.insn	2, 0x078d
     86a:	0000                	.insn	2, 0x0000
     86c:	0a90                	.insn	2, 0x0a90
     86e:	0040                	.insn	2, 0x0040
     870:	1a00                	.insn	2, 0x1a00
     872:	026d                	.insn	2, 0x026d
     874:	0000                	.insn	2, 0x0000
     876:	2902                	.insn	2, 0x2902
     878:	0002fc1b          	.insn	4, 0x0002fc1b
     87c:	0000                	.insn	2, 0x0000
     87e:	c61a                	.insn	2, 0xc61a
     880:	0000                	.insn	2, 0x0000
     882:	0200                	.insn	2, 0x0200
     884:	1b2a                	.insn	2, 0x1b2a
     886:	02fc                	.insn	2, 0x02fc
     888:	0000                	.insn	2, 0x0000
     88a:	1a00                	.insn	2, 0x1a00
     88c:	0305                	.insn	2, 0x0305
     88e:	0000                	.insn	2, 0x0000
     890:	2802                	.insn	2, 0x2802
     892:	0002f11b          	.insn	4, 0x0002f11b
     896:	0000                	.insn	2, 0x0000
     898:	801a                	.insn	2, 0x801a
     89a:	0002                	.insn	2, 0x0002
     89c:	0200                	.insn	2, 0x0200
     89e:	02fc1b2b          	.insn	4, 0x02fc1b2b
     8a2:	0000                	.insn	2, 0x0000
     8a4:	1d00                	.insn	2, 0x1d00
     8a6:	0088                	.insn	2, 0x0088
     8a8:	0000                	.insn	2, 0x0000
     8aa:	02ea1003          	lh	zero,46(s4) # 344f8 <$d.5+0x330a7>
     8ae:	0000                	.insn	2, 0x0000
     8b0:	00000d23          	sb	zero,26(zero) # 1a <$d.4+0x1a>
     8b4:	0300                	.insn	2, 0x0300
     8b6:	1e11                	.insn	2, 0x1e11
     8b8:	0016                	.insn	2, 0x0016
     8ba:	0000                	.insn	2, 0x0000
     8bc:	02ea0e03          	lb	t3,46(s4)
     8c0:	0000                	.insn	2, 0x0000
     8c2:	00034f1b          	.insn	4, 0x00034f1b
     8c6:	0000                	.insn	2, 0x0000
     8c8:	db24                	.insn	2, 0xdb24
     8ca:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
     8ce:	2542                	.insn	2, 0x2542
     8d0:	0908                	.insn	2, 0x0908
     8d2:	0040                	.insn	2, 0x0040
     8d4:	00cc                	.insn	2, 0x00cc
     8d6:	0000                	.insn	2, 0x0000
     8d8:	5201                	.insn	2, 0x5201
     8da:	00000303          	lb	t1,0(zero) # 0 <$d.4>
     8de:	00040717          	auipc	a4,0x40
     8e2:	1000                	.insn	2, 0x1000
     8e4:	26000003          	lb	zero,608(zero) # 260 <$d.4+0x6e>
     8e8:	5b01                	.insn	2, 0x5b01
     8ea:	031c                	.insn	2, 0x031c
     8ec:	0000                	.insn	2, 0x0000
     8ee:	7a18                	.insn	2, 0x7a18
     8f0:	0004                	.insn	2, 0x0004
     8f2:	2800                	.insn	2, 0x2800
     8f4:	11000003          	lb	zero,272(zero) # 110 <$d.10+0x9c>
     8f8:	0108                	.insn	2, 0x0108
     8fa:	0000                	.insn	2, 0x0000
     8fc:	a418                	.insn	2, 0xa418
     8fe:	0004                	.insn	2, 0x0004
     900:	3500                	.insn	2, 0x3500
     902:	18000003          	lb	zero,384(zero) # 180 <$d.6+0x46>
     906:	04c2                	.insn	2, 0x04c2
     908:	0000                	.insn	2, 0x0000
     90a:	0341                	.insn	2, 0x0341
     90c:	0000                	.insn	2, 0x0000
     90e:	0000                	.insn	2, 0x0000
     910:	521e                	.insn	2, 0x521e
     912:	0002                	.insn	2, 0x0002
     914:	0200                	.insn	2, 0x0200
     916:	2131                	.insn	2, 0x2131
     918:	0009                	.insn	2, 0x0009
     91a:	1b00                	.insn	2, 0x1b00
     91c:	02fc                	.insn	2, 0x02fc
     91e:	0000                	.insn	2, 0x0000
     920:	0800                	.insn	2, 0x0800
     922:	02ea                	.insn	2, 0x02ea
     924:	0000                	.insn	2, 0x0000
     926:	00ad                	.insn	2, 0x00ad
     928:	0000                	.insn	2, 0x0000
     92a:	0e02                	.insn	2, 0x0e02
     92c:	00003f03          	.insn	4, 0x3f03
     930:	0400                	.insn	2, 0x0400
     932:	0046                	.insn	2, 0x0046
     934:	0000                	.insn	2, 0x0000
     936:	0020                	.insn	2, 0x0020
     938:	00034f03          	lbu	t5,0(t1) # 3a0e05c0 <USER_MAX+0x39be05c0>
     93c:	0400                	.insn	2, 0x0400
     93e:	0046                	.insn	2, 0x0046
     940:	0000                	.insn	2, 0x0000
     942:	0008                	.insn	2, 0x0008
     944:	3f0d                	.insn	2, 0x3f0d
     946:	0000                	.insn	2, 0x0000
	...

0000094a <$d.5>:
     94a:	00000b03          	lb	s6,0(zero) # 0 <$d.4>
     94e:	0004                	.insn	2, 0x0004
     950:	01f2                	.insn	2, 0x01f2
     952:	0000                	.insn	2, 0x0000
     954:	0104                	.insn	2, 0x0104
     956:	013a                	.insn	2, 0x013a
     958:	0000                	.insn	2, 0x0000
     95a:	001d                	.insn	2, 0x001d
     95c:	000000d7          	.insn	4, 0x00d7
     960:	0911                	.insn	2, 0x0911
     962:	0000                	.insn	2, 0x0000
     964:	021d                	.insn	2, 0x021d
     966:	0000                	.insn	2, 0x0000
     968:	0000                	.insn	2, 0x0000
     96a:	0000                	.insn	2, 0x0000
     96c:	0278                	.insn	2, 0x0278
     96e:	0000                	.insn	2, 0x0000
     970:	3402                	.insn	2, 0x3402
     972:	0000                	.insn	2, 0x0000
     974:	0100                	.insn	2, 0x0100
     976:	0142                	.insn	2, 0x0142
     978:	0305                	.insn	2, 0x0305
     97a:	1ce0                	.insn	2, 0x1ce0
     97c:	0040                	.insn	2, 0x0040
     97e:	00004003          	lbu	zero,0(zero) # 0 <$d.4>
     982:	0400                	.insn	2, 0x0400
     984:	00000047          	.insn	4, 0x0047
     988:	0011                	.insn	2, 0x0011
     98a:	fc05                	.insn	2, 0xfc05
     98c:	0001                	.insn	2, 0x0001
     98e:	0800                	.insn	2, 0x0800
     990:	0601                	.insn	2, 0x0601
     992:	02e0                	.insn	2, 0x02e0
     994:	0000                	.insn	2, 0x0000
     996:	0708                	.insn	2, 0x0708
     998:	00005a07          	.insn	4, 0x5a07
     99c:	1b00                	.insn	2, 0x1b00
     99e:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
     9a2:	010a                	.insn	2, 0x010a
     9a4:	e405                	.insn	2, 0xe405
     9a6:	0001                	.insn	2, 0x0001
     9a8:	0800                	.insn	2, 0x0800
     9aa:	0801                	.insn	2, 0x0801
     9ac:	006c                	.insn	2, 0x006c
     9ae:	0000                	.insn	2, 0x0000
     9b0:	000001a7          	.insn	4, 0x01a7
     9b4:	c602                	.insn	2, 0xc602
     9b6:	b605                	.insn	2, 0xb605
     9b8:	0002                	.insn	2, 0x0002
     9ba:	0700                	.insn	2, 0x0700
     9bc:	0504                	.insn	2, 0x0504
     9be:	0201                	.insn	2, 0x0201
     9c0:	0000                	.insn	2, 0x0000
     9c2:	0405                	.insn	2, 0x0405
     9c4:	5a09                	.insn	2, 0x5a09
     9c6:	0000                	.insn	2, 0x0000
     9c8:	0a00                	.insn	2, 0x0a00
     9ca:	0296                	.insn	2, 0x0296
     9cc:	0000                	.insn	2, 0x0000
     9ce:	3901                	.insn	2, 0x3901
     9d0:	00000073          	ecall
     9d4:	0b01                	.insn	2, 0x0b01
     9d6:	01d5                	.insn	2, 0x01d5
     9d8:	0000                	.insn	2, 0x0000
     9da:	3901                	.insn	2, 0x3901
     9dc:	00000073          	ecall
     9e0:	0003600b          	.insn	4, 0x0003600b
     9e4:	0100                	.insn	2, 0x0100
     9e6:	7339                	.insn	2, 0x7339
     9e8:	0000                	.insn	2, 0x0000
     9ea:	0b00                	.insn	2, 0x0b00
     9ec:	000003e3          	beqz	zero,11f2 <$d.11+0x103>
     9f0:	3901                	.insn	2, 0x3901
     9f2:	00000073          	ecall
     9f6:	00039b0b          	.insn	4, 0x00039b0b
     9fa:	0100                	.insn	2, 0x0100
     9fc:	7339                	.insn	2, 0x7339
     9fe:	0000                	.insn	2, 0x0000
     a00:	0c00                	.insn	2, 0x0c00
     a02:	029e                	.insn	2, 0x029e
     a04:	0000                	.insn	2, 0x0000
     a06:	3b01                	.insn	2, 0x3b01
     a08:	00000073          	ecall
     a0c:	110c                	.insn	2, 0x110c
     a0e:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     a12:	733c                	.insn	2, 0x733c
     a14:	0000                	.insn	2, 0x0000
     a16:	0c00                	.insn	2, 0x0c00
     a18:	00b2                	.insn	2, 0x00b2
     a1a:	0000                	.insn	2, 0x0000
     a1c:	3d01                	.insn	2, 0x3d01
     a1e:	00000073          	ecall
     a22:	590c                	.insn	2, 0x590c
     a24:	0000                	.insn	2, 0x0000
     a26:	0100                	.insn	2, 0x0100
     a28:	733e                	.insn	2, 0x733e
     a2a:	0000                	.insn	2, 0x0000
     a2c:	0000                	.insn	2, 0x0000
     a2e:	900d                	.insn	2, 0x900d
     a30:	400a                	.insn	2, 0x400a
     a32:	1800                	.insn	2, 0x1800
     a34:	0000                	.insn	2, 0x0000
     a36:	0100                	.insn	2, 0x0100
     a38:	db52                	.insn	2, 0xdb52
     a3a:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     a3e:	0e4d                	.insn	2, 0x0e4d
     a40:	007f 0000 0a90 0040 	.insn	10, 0x001400400a900000007f
     a48:	0014 
     a4a:	0000                	.insn	2, 0x0000
     a4c:	5201                	.insn	2, 0x5201
     a4e:	0f05                	.insn	2, 0x0f05
     a50:	8b0d                	.insn	2, 0x8b0d
     a52:	0000                	.insn	2, 0x0000
     a54:	0f00                	.insn	2, 0x0f00
     a56:	9600                	.insn	2, 0x9600
     a58:	0000                	.insn	2, 0x0000
     a5a:	0f00                	.insn	2, 0x0f00
     a5c:	a100                	.insn	2, 0xa100
     a5e:	0000                	.insn	2, 0x0000
     a60:	0f00                	.insn	2, 0x0f00
     a62:	ac00                	.insn	2, 0xac00
     a64:	0000                	.insn	2, 0x0000
     a66:	1000                	.insn	2, 0x1000
     a68:	0532                	.insn	2, 0x0532
     a6a:	0000                	.insn	2, 0x0000
     a6c:	000000b7          	lui	ra,0x0
     a70:	0011                	.insn	2, 0x0011
     a72:	00c2                	.insn	2, 0x00c2
     a74:	0000                	.insn	2, 0x0000
     a76:	0011                	.insn	2, 0x0011
     a78:	00cd                	.insn	2, 0x00cd
     a7a:	0000                	.insn	2, 0x0000
     a7c:	0d11                	.insn	2, 0x0d11
     a7e:	00d8                	.insn	2, 0x00d8
     a80:	0000                	.insn	2, 0x0000
     a82:	0000                	.insn	2, 0x0000
     a84:	1612                	.insn	2, 0x1612
     a86:	0002                	.insn	2, 0x0002
     a88:	0100                	.insn	2, 0x0100
     a8a:	019001e7          	jalr	gp,25(zero) # 19 <$d.4+0x19>
     a8e:	0000                	.insn	2, 0x0000
     a90:	1301                	.insn	2, 0x1301
     a92:	0078                	.insn	2, 0x0078
     a94:	0000                	.insn	2, 0x0000
     a96:	e701                	.insn	2, 0xe701
     a98:	6101                	.insn	2, 0x6101
     a9a:	0000                	.insn	2, 0x0000
     a9c:	1300                	.insn	2, 0x1300
     a9e:	029e                	.insn	2, 0x029e
     aa0:	0000                	.insn	2, 0x0000
     aa2:	e801                	.insn	2, 0xe801
     aa4:	6101                	.insn	2, 0x6101
     aa6:	0000                	.insn	2, 0x0000
     aa8:	1300                	.insn	2, 0x1300
     aaa:	0311                	.insn	2, 0x0311
     aac:	0000                	.insn	2, 0x0000
     aae:	e901                	.insn	2, 0xe901
     ab0:	6101                	.insn	2, 0x6101
     ab2:	0000                	.insn	2, 0x0000
     ab4:	1300                	.insn	2, 0x1300
     ab6:	00b2                	.insn	2, 0x00b2
     ab8:	0000                	.insn	2, 0x0000
     aba:	ea01                	.insn	2, 0xea01
     abc:	6101                	.insn	2, 0x6101
     abe:	0000                	.insn	2, 0x0000
     ac0:	1300                	.insn	2, 0x1300
     ac2:	02c8                	.insn	2, 0x02c8
     ac4:	0000                	.insn	2, 0x0000
     ac6:	eb01                	.insn	2, 0xeb01
     ac8:	6101                	.insn	2, 0x6101
     aca:	0000                	.insn	2, 0x0000
     acc:	1400                	.insn	2, 0x1400
     ace:	0165                	.insn	2, 0x0165
     ad0:	0000                	.insn	2, 0x0000
     ad2:	ed01                	.insn	2, 0xed01
     ad4:	6101                	.insn	2, 0x6101
     ad6:	0000                	.insn	2, 0x0000
     ad8:	0000                	.insn	2, 0x0000
     ada:	6c08                	.insn	2, 0x6c08
     adc:	0000                	.insn	2, 0x0000
     ade:	a700                	.insn	2, 0xa700
     ae0:	0001                	.insn	2, 0x0001
     ae2:	0300                	.insn	2, 0x0300
     ae4:	1511                	.insn	2, 0x1511
     ae6:	03c9                	.insn	2, 0x03c9
     ae8:	0000                	.insn	2, 0x0000
     aea:	af01                	.insn	2, 0xaf01
     aec:	0101                	.insn	2, 0x0101
     aee:	0003e013          	ori	zero,t2,0
     af2:	0100                	.insn	2, 0x0100
     af4:	004001af          	.insn	4, 0x004001af
     af8:	0000                	.insn	2, 0x0000
     afa:	1500                	.insn	2, 0x1500
     afc:	00e2                	.insn	2, 0x00e2
     afe:	0000                	.insn	2, 0x0000
     b00:	d701                	.insn	2, 0xd701
     b02:	0101                	.insn	2, 0x0101
     b04:	0000c413          	xori	s0,ra,0
     b08:	0100                	.insn	2, 0x0100
     b0a:	007301d7          	.insn	4, 0x007301d7
     b0e:	0000                	.insn	2, 0x0000
     b10:	1600                	.insn	2, 0x1600
     b12:	0aa8                	.insn	2, 0x0aa8
     b14:	0040                	.insn	2, 0x0040
     b16:	0304                	.insn	2, 0x0304
     b18:	0000                	.insn	2, 0x0000
     b1a:	5201                	.insn	2, 0x5201
     b1c:	0305                	.insn	2, 0x0305
     b1e:	0000                	.insn	2, 0x0000
     b20:	7701                	.insn	2, 0x7701
     b22:	00054f17          	auipc	t5,0x54
     b26:	6500                	.insn	2, 0x6500
     b28:	0000                	.insn	2, 0x0000
     b2a:	0100                	.insn	2, 0x0100
     b2c:	00006177          	.insn	4, 0x6177
     b30:	1800                	.insn	2, 0x1800
     b32:	00d09103          	lh	sp,13(ra) # d <$d.4+0xd>
     b36:	005c                	.insn	2, 0x005c
     b38:	0000                	.insn	2, 0x0000
     b3a:	8501                	.insn	2, 0x8501
     b3c:	0ac2                	.insn	2, 0x0ac2
     b3e:	0000                	.insn	2, 0x0000
     b40:	0318                	.insn	2, 0x0318
     b42:	c091                	.insn	2, 0xc091
     b44:	3d00                	.insn	2, 0x3d00
     b46:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     b4a:	c286                	.insn	2, 0xc286
     b4c:	000a                	.insn	2, 0x000a
     b4e:	1800                	.insn	2, 0x1800
     b50:	9102                	.insn	2, 0x9102
     b52:	2f00                	.insn	2, 0x2f00
     b54:	0000                	.insn	2, 0x0000
     b56:	0100                	.insn	2, 0x0100
     b58:	000ad487          	.insn	4, 0x000ad487
     b5c:	1900                	.insn	2, 0x1900
     b5e:	0ab0                	.insn	2, 0x0ab0
     b60:	0040                	.insn	2, 0x0040
     b62:	0070                	.insn	2, 0x0070
     b64:	0000                	.insn	2, 0x0000
     b66:	751a                	.insn	2, 0x751a
     b68:	0005                	.insn	2, 0x0005
     b6a:	3800                	.insn	2, 0x3800
     b6c:	0000                	.insn	2, 0x0000
     b6e:	0100                	.insn	2, 0x0100
     b70:	618a                	.insn	2, 0x618a
     b72:	0000                	.insn	2, 0x0000
     b74:	1900                	.insn	2, 0x1900
     b76:	0ac8                	.insn	2, 0x0ac8
     b78:	0040                	.insn	2, 0x0040
     b7a:	0044                	.insn	2, 0x0044
     b7c:	0000                	.insn	2, 0x0000
     b7e:	9c1a                	.insn	2, 0x9c1a
     b80:	0005                	.insn	2, 0x0005
     b82:	b100                	.insn	2, 0xb100
     b84:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     b88:	0000618b          	.insn	4, 0x618b
     b8c:	0000                	.insn	2, 0x0000
     b8e:	1b00                	.insn	2, 0x1b00
     b90:	013a                	.insn	2, 0x013a
     b92:	0000                	.insn	2, 0x0000
     b94:	0128                	.insn	2, 0x0128
     b96:	0000                	.insn	2, 0x0000
     b98:	9801                	.insn	2, 0x9801
     b9a:	1c05                	.insn	2, 0x1c05
     b9c:	0601                	.insn	2, 0x0601
     b9e:	0000                	.insn	2, 0x0000
     ba0:	00000147          	.insn	4, 0x0147
     ba4:	621c                	.insn	2, 0x621c
     ba6:	0006                	.insn	2, 0x0006
     ba8:	5300                	.insn	2, 0x5300
     baa:	0001                	.insn	2, 0x0001
     bac:	1c00                	.insn	2, 0x1c00
     bae:	0644                	.insn	2, 0x0644
     bb0:	0000                	.insn	2, 0x0000
     bb2:	015f 0000 291c      	.insn	6, 0x291c0000015f
     bb8:	0006                	.insn	2, 0x0006
     bba:	6b00                	.insn	2, 0x6b00
     bbc:	0001                	.insn	2, 0x0001
     bbe:	1c00                	.insn	2, 0x1c00
     bc0:	000005db          	.insn	4, 0x05db
     bc4:	00000177          	.insn	4, 0x0177
     bc8:	8010                	.insn	2, 0x8010
     bca:	0006                	.insn	2, 0x0006
     bcc:	8300                	.insn	2, 0x8300
     bce:	0001                	.insn	2, 0x0001
     bd0:	0000                	.insn	2, 0x0000
     bd2:	00019b1b          	.insn	4, 0x00019b1b
     bd6:	4000                	.insn	2, 0x4000
     bd8:	0001                	.insn	2, 0x0001
     bda:	0100                	.insn	2, 0x0100
     bdc:	05a1                	.insn	2, 0x05a1
     bde:	9b1c                	.insn	2, 0x9b1c
     be0:	0006                	.insn	2, 0x0006
     be2:	a400                	.insn	2, 0xa400
     be4:	0001                	.insn	2, 0x0001
     be6:	0000                	.insn	2, 0x0000
     be8:	00019b1b          	.insn	4, 0x00019b1b
     bec:	5800                	.insn	2, 0x5800
     bee:	0001                	.insn	2, 0x0001
     bf0:	0100                	.insn	2, 0x0100
     bf2:	05a2                	.insn	2, 0x05a2
     bf4:	c51c                	.insn	2, 0xc51c
     bf6:	0006                	.insn	2, 0x0006
     bf8:	a400                	.insn	2, 0xa400
     bfa:	0001                	.insn	2, 0x0001
     bfc:	0000                	.insn	2, 0x0000
     bfe:	6c19                	.insn	2, 0x6c19
     c00:	6400400b          	.insn	4, 0x6400400b
     c04:	0000                	.insn	2, 0x0000
     c06:	1a00                	.insn	2, 0x1a00
     c08:	06ed                	.insn	2, 0x06ed
     c0a:	0000                	.insn	2, 0x0000
     c0c:	0038                	.insn	2, 0x0038
     c0e:	0000                	.insn	2, 0x0000
     c10:	a301                	.insn	2, 0xa301
     c12:	0061                	.insn	2, 0x0061
     c14:	0000                	.insn	2, 0x0000
     c16:	8019                	.insn	2, 0x8019
     c18:	3400400b          	.insn	4, 0x3400400b
     c1c:	0000                	.insn	2, 0x0000
     c1e:	1a00                	.insn	2, 0x1a00
     c20:	0714                	.insn	2, 0x0714
     c22:	0000                	.insn	2, 0x0000
     c24:	03b1                	.insn	2, 0x03b1
     c26:	0000                	.insn	2, 0x0000
     c28:	a401                	.insn	2, 0xa401
     c2a:	0061                	.insn	2, 0x0061
     c2c:	0000                	.insn	2, 0x0000
     c2e:	b10e                	.insn	2, 0xb10e
     c30:	0001                	.insn	2, 0x0001
     c32:	9400                	.insn	2, 0x9400
     c34:	0c00400b          	.insn	4, 0x0c00400b
     c38:	0000                	.insn	2, 0x0000
     c3a:	0100                	.insn	2, 0x0100
     c3c:	0da5                	.insn	2, 0x0da5
     c3e:	011d                	.insn	2, 0x011d
     c40:	0001ba57          	.insn	4, 0x0001ba57
     c44:	0000                	.insn	2, 0x0000
     c46:	9b0e                	.insn	2, 0x9b0e
     c48:	0001                	.insn	2, 0x0001
     c4a:	a000                	.insn	2, 0xa000
     c4c:	0c00400b          	.insn	4, 0x0c00400b
     c50:	0000                	.insn	2, 0x0000
     c52:	0100                	.insn	2, 0x0100
     c54:	0da6                	.insn	2, 0x0da6
     c56:	201e                	.insn	2, 0x201e
     c58:	01a4                	.insn	2, 0x01a4
     c5a:	0000                	.insn	2, 0x0000
     c5c:	0000                	.insn	2, 0x0000
     c5e:	9b0e                	.insn	2, 0x9b0e
     c60:	0001                	.insn	2, 0x0001
     c62:	b400                	.insn	2, 0xb400
     c64:	0c00400b          	.insn	4, 0x0c00400b
     c68:	0000                	.insn	2, 0x0000
     c6a:	0100                	.insn	2, 0x0100
     c6c:	09a8                	.insn	2, 0x09a8
     c6e:	0a1e                	.insn	2, 0x0a1e
     c70:	01a4                	.insn	2, 0x01a4
     c72:	0000                	.insn	2, 0x0000
     c74:	0000                	.insn	2, 0x0000
     c76:	00019b1b          	.insn	4, 0x00019b1b
     c7a:	7000                	.insn	2, 0x7000
     c7c:	0001                	.insn	2, 0x0001
     c7e:	0100                	.insn	2, 0x0100
     c80:	05aa                	.insn	2, 0x05aa
     c82:	5b1c                	.insn	2, 0x5b1c
     c84:	a4000007          	.insn	4, 0xa4000007
     c88:	0001                	.insn	2, 0x0001
     c8a:	0000                	.insn	2, 0x0000
     c8c:	00019b1b          	.insn	4, 0x00019b1b
     c90:	8800                	.insn	2, 0x8800
     c92:	0001                	.insn	2, 0x0001
     c94:	0100                	.insn	2, 0x0100
     c96:	05ad                	.insn	2, 0x05ad
     c98:	831c                	.insn	2, 0x831c
     c9a:	a4000007          	.insn	4, 0xa4000007
     c9e:	0001                	.insn	2, 0x0001
     ca0:	0000                	.insn	2, 0x0000
     ca2:	00019b1b          	.insn	4, 0x00019b1b
     ca6:	a000                	.insn	2, 0xa000
     ca8:	0001                	.insn	2, 0x0001
     caa:	0100                	.insn	2, 0x0100
     cac:	05ae                	.insn	2, 0x05ae
     cae:	ad1c                	.insn	2, 0xad1c
     cb0:	a4000007          	.insn	4, 0xa4000007
     cb4:	0001                	.insn	2, 0x0001
     cb6:	0000                	.insn	2, 0x0000
     cb8:	4819                	.insn	2, 0x4819
     cba:	400c                	.insn	2, 0x400c
     cbc:	6800                	.insn	2, 0x6800
     cbe:	0000                	.insn	2, 0x0000
     cc0:	1a00                	.insn	2, 0x1a00
     cc2:	07d5                	.insn	2, 0x07d5
     cc4:	0000                	.insn	2, 0x0000
     cc6:	0038                	.insn	2, 0x0038
     cc8:	0000                	.insn	2, 0x0000
     cca:	af01                	.insn	2, 0xaf01
     ccc:	0061                	.insn	2, 0x0061
     cce:	0000                	.insn	2, 0x0000
     cd0:	6019                	.insn	2, 0x6019
     cd2:	400c                	.insn	2, 0x400c
     cd4:	3400                	.insn	2, 0x3400
     cd6:	0000                	.insn	2, 0x0000
     cd8:	1a00                	.insn	2, 0x1a00
     cda:	07fc                	.insn	2, 0x07fc
     cdc:	0000                	.insn	2, 0x0000
     cde:	03b1                	.insn	2, 0x03b1
     ce0:	0000                	.insn	2, 0x0000
     ce2:	b001                	.insn	2, 0xb001
     ce4:	0061                	.insn	2, 0x0061
     ce6:	0000                	.insn	2, 0x0000
     ce8:	b10e                	.insn	2, 0xb10e
     cea:	0001                	.insn	2, 0x0001
     cec:	7400                	.insn	2, 0x7400
     cee:	400c                	.insn	2, 0x400c
     cf0:	0c00                	.insn	2, 0x0c00
     cf2:	0000                	.insn	2, 0x0000
     cf4:	0100                	.insn	2, 0x0100
     cf6:	0db1                	.insn	2, 0x0db1
     cf8:	011d                	.insn	2, 0x011d
     cfa:	0001ba57          	.insn	4, 0x0001ba57
     cfe:	0000                	.insn	2, 0x0000
     d00:	9b0e                	.insn	2, 0x9b0e
     d02:	0001                	.insn	2, 0x0001
     d04:	8000                	.insn	2, 0x8000
     d06:	400c                	.insn	2, 0x400c
     d08:	0c00                	.insn	2, 0x0c00
     d0a:	0000                	.insn	2, 0x0000
     d0c:	0100                	.insn	2, 0x0100
     d0e:	0db2                	.insn	2, 0x0db2
     d10:	201e                	.insn	2, 0x201e
     d12:	01a4                	.insn	2, 0x01a4
     d14:	0000                	.insn	2, 0x0000
     d16:	0000                	.insn	2, 0x0000
     d18:	9b0e                	.insn	2, 0x9b0e
     d1a:	0001                	.insn	2, 0x0001
     d1c:	9400                	.insn	2, 0x9400
     d1e:	400c                	.insn	2, 0x400c
     d20:	0c00                	.insn	2, 0x0c00
     d22:	0000                	.insn	2, 0x0000
     d24:	0100                	.insn	2, 0x0100
     d26:	09b4                	.insn	2, 0x09b4
     d28:	0a1e                	.insn	2, 0x0a1e
     d2a:	01a4                	.insn	2, 0x01a4
     d2c:	0000                	.insn	2, 0x0000
     d2e:	0000                	.insn	2, 0x0000
     d30:	00019b1b          	.insn	4, 0x00019b1b
     d34:	b800                	.insn	2, 0xb800
     d36:	0001                	.insn	2, 0x0001
     d38:	0100                	.insn	2, 0x0100
     d3a:	05b6                	.insn	2, 0x05b6
     d3c:	431c                	.insn	2, 0x431c
     d3e:	0008                	.insn	2, 0x0008
     d40:	a400                	.insn	2, 0xa400
     d42:	0001                	.insn	2, 0x0001
     d44:	0000                	.insn	2, 0x0000
     d46:	00019b1b          	.insn	4, 0x00019b1b
     d4a:	d000                	.insn	2, 0xd000
     d4c:	0001                	.insn	2, 0x0001
     d4e:	0100                	.insn	2, 0x0100
     d50:	05b9                	.insn	2, 0x05b9
     d52:	6b1c                	.insn	2, 0x6b1c
     d54:	0008                	.insn	2, 0x0008
     d56:	a400                	.insn	2, 0xa400
     d58:	0001                	.insn	2, 0x0001
     d5a:	0000                	.insn	2, 0x0000
     d5c:	00019b1b          	.insn	4, 0x00019b1b
     d60:	e800                	.insn	2, 0xe800
     d62:	0001                	.insn	2, 0x0001
     d64:	0100                	.insn	2, 0x0100
     d66:	05ba                	.insn	2, 0x05ba
     d68:	951c                	.insn	2, 0x951c
     d6a:	0008                	.insn	2, 0x0008
     d6c:	a400                	.insn	2, 0xa400
     d6e:	0001                	.insn	2, 0x0001
     d70:	0000                	.insn	2, 0x0000
     d72:	3819                	.insn	2, 0x3819
     d74:	400d                	.insn	2, 0x400d
     d76:	5c00                	.insn	2, 0x5c00
     d78:	0000                	.insn	2, 0x0000
     d7a:	1a00                	.insn	2, 0x1a00
     d7c:	08bd                	.insn	2, 0x08bd
     d7e:	0000                	.insn	2, 0x0000
     d80:	0038                	.insn	2, 0x0038
     d82:	0000                	.insn	2, 0x0000
     d84:	bb01                	.insn	2, 0xbb01
     d86:	0061                	.insn	2, 0x0061
     d88:	0000                	.insn	2, 0x0000
     d8a:	5419                	.insn	2, 0x5419
     d8c:	400d                	.insn	2, 0x400d
     d8e:	2800                	.insn	2, 0x2800
     d90:	0000                	.insn	2, 0x0000
     d92:	1a00                	.insn	2, 0x1a00
     d94:	08e4                	.insn	2, 0x08e4
     d96:	0000                	.insn	2, 0x0000
     d98:	03b1                	.insn	2, 0x03b1
     d9a:	0000                	.insn	2, 0x0000
     d9c:	bc01                	.insn	2, 0xbc01
     d9e:	0061                	.insn	2, 0x0061
     da0:	0000                	.insn	2, 0x0000
     da2:	b10e                	.insn	2, 0xb10e
     da4:	0001                	.insn	2, 0x0001
     da6:	5800                	.insn	2, 0x5800
     da8:	400d                	.insn	2, 0x400d
     daa:	0c00                	.insn	2, 0x0c00
     dac:	0000                	.insn	2, 0x0000
     dae:	0100                	.insn	2, 0x0100
     db0:	0dbd                	.insn	2, 0x0dbd
     db2:	011d                	.insn	2, 0x011d
     db4:	ba56                	.insn	2, 0xba56
     db6:	0001                	.insn	2, 0x0001
     db8:	0000                	.insn	2, 0x0000
     dba:	9b0e                	.insn	2, 0x9b0e
     dbc:	0001                	.insn	2, 0x0001
     dbe:	6400                	.insn	2, 0x6400
     dc0:	400d                	.insn	2, 0x400d
     dc2:	0c00                	.insn	2, 0x0c00
     dc4:	0000                	.insn	2, 0x0000
     dc6:	0100                	.insn	2, 0x0100
     dc8:	0dbe                	.insn	2, 0x0dbe
     dca:	201e                	.insn	2, 0x201e
     dcc:	01a4                	.insn	2, 0x01a4
     dce:	0000                	.insn	2, 0x0000
     dd0:	0000                	.insn	2, 0x0000
     dd2:	9b0e                	.insn	2, 0x9b0e
     dd4:	0001                	.insn	2, 0x0001
     dd6:	7c00                	.insn	2, 0x7c00
     dd8:	400d                	.insn	2, 0x400d
     dda:	0c00                	.insn	2, 0x0c00
     ddc:	0000                	.insn	2, 0x0000
     dde:	0100                	.insn	2, 0x0100
     de0:	09c0                	.insn	2, 0x09c0
     de2:	0a1e                	.insn	2, 0x0a1e
     de4:	01a4                	.insn	2, 0x01a4
     de6:	0000                	.insn	2, 0x0000
     de8:	0000                	.insn	2, 0x0000
     dea:	9b0e                	.insn	2, 0x9b0e
     dec:	0001                	.insn	2, 0x0001
     dee:	9800                	.insn	2, 0x9800
     df0:	400d                	.insn	2, 0x400d
     df2:	0c00                	.insn	2, 0x0c00
     df4:	0000                	.insn	2, 0x0000
     df6:	0100                	.insn	2, 0x0100
     df8:	05c2                	.insn	2, 0x05c2
     dfa:	0a1e                	.insn	2, 0x0a1e
     dfc:	01a4                	.insn	2, 0x01a4
     dfe:	0000                	.insn	2, 0x0000
     e00:	0000                	.insn	2, 0x0000
     e02:	ac1f 400d 1400      	.insn	6, 0x1400400dac1f
     e08:	0000                	.insn	2, 0x0000
     e0a:	0100                	.insn	2, 0x0100
     e0c:	9b52                	.insn	2, 0x9b52
     e0e:	0001                	.insn	2, 0x0001
     e10:	1c00                	.insn	2, 0x1c00
     e12:	091d                	.insn	2, 0x091d
     e14:	0000                	.insn	2, 0x0000
     e16:	01a4                	.insn	2, 0x01a4
     e18:	0000                	.insn	2, 0x0000
     e1a:	1f00                	.insn	2, 0x1f00
     e1c:	0dc0                	.insn	2, 0x0dc0
     e1e:	0040                	.insn	2, 0x0040
     e20:	0014                	.insn	2, 0x0014
     e22:	0000                	.insn	2, 0x0000
     e24:	5201                	.insn	2, 0x5201
     e26:	01b1                	.insn	2, 0x01b1
     e28:	0000                	.insn	2, 0x0000
     e2a:	431c                	.insn	2, 0x431c
     e2c:	0009                	.insn	2, 0x0009
     e2e:	ba00                	.insn	2, 0xba00
     e30:	0001                	.insn	2, 0x0001
     e32:	0000                	.insn	2, 0x0000
     e34:	1012                	.insn	2, 0x1012
     e36:	0001                	.insn	2, 0x0001
     e38:	0100                	.insn	2, 0x0100
     e3a:	01fe                	.insn	2, 0x01fe
     e3c:	0190                	.insn	2, 0x0190
     e3e:	0000                	.insn	2, 0x0000
     e40:	1301                	.insn	2, 0x1301
     e42:	01d5                	.insn	2, 0x01d5
     e44:	0000                	.insn	2, 0x0000
     e46:	fe01                	.insn	2, 0xfe01
     e48:	6101                	.insn	2, 0x6101
     e4a:	0000                	.insn	2, 0x0000
     e4c:	1300                	.insn	2, 0x1300
     e4e:	0360                	.insn	2, 0x0360
     e50:	0000                	.insn	2, 0x0000
     e52:	fe01                	.insn	2, 0xfe01
     e54:	6101                	.insn	2, 0x6101
     e56:	0000                	.insn	2, 0x0000
     e58:	1400                	.insn	2, 0x1400
     e5a:	029e                	.insn	2, 0x029e
     e5c:	0000                	.insn	2, 0x0000
     e5e:	0001                	.insn	2, 0x0001
     e60:	6102                	.insn	2, 0x6102
     e62:	0000                	.insn	2, 0x0000
     e64:	1400                	.insn	2, 0x1400
     e66:	0059                	.insn	2, 0x0059
     e68:	0000                	.insn	2, 0x0000
     e6a:	0101                	.insn	2, 0x0101
     e6c:	6102                	.insn	2, 0x6102
     e6e:	0000                	.insn	2, 0x0000
     e70:	0000                	.insn	2, 0x0000
     e72:	d416                	.insn	2, 0xd416
     e74:	400d                	.insn	2, 0x400d
     e76:	0c00                	.insn	2, 0x0c00
     e78:	0000                	.insn	2, 0x0000
     e7a:	0100                	.insn	2, 0x0100
     e7c:	6d52                	.insn	2, 0x6d52
     e7e:	0002                	.insn	2, 0x0002
     e80:	0100                	.insn	2, 0x0100
     e82:	096917c7          	.insn	4, 0x096917c7
     e86:	0000                	.insn	2, 0x0000
     e88:	003e                	.insn	2, 0x003e
     e8a:	0000                	.insn	2, 0x0000
     e8c:	c701                	.insn	2, 0xc701
     e8e:	006c                	.insn	2, 0x006c
     e90:	0000                	.insn	2, 0x0000
     e92:	ea0e                	.insn	2, 0xea0e
     e94:	0004                	.insn	2, 0x0004
     e96:	d400                	.insn	2, 0xd400
     e98:	400d                	.insn	2, 0x400d
     e9a:	0800                	.insn	2, 0x0800
     e9c:	0000                	.insn	2, 0x0000
     e9e:	0100                	.insn	2, 0x0100
     ea0:	05ca                	.insn	2, 0x05ca
     ea2:	051e                	.insn	2, 0x051e
     ea4:	000004f7          	.insn	4, 0x04f7
     ea8:	011d                	.insn	2, 0x011d
     eaa:	035a                	.insn	2, 0x035a
     eac:	0005                	.insn	2, 0x0005
     eae:	2000                	.insn	2, 0x2000
     eb0:	5a01                	.insn	2, 0x5a01
     eb2:	0000050f          	.insn	4, 0x050f
     eb6:	0521                	.insn	2, 0x0521
     eb8:	0000051b          	.insn	4, 0x051b
     ebc:	0000                	.insn	2, 0x0000
     ebe:	0012                	.insn	2, 0x0012
     ec0:	0000                	.insn	2, 0x0000
     ec2:	0100                	.insn	2, 0x0100
     ec4:	020e                	.insn	2, 0x020e
     ec6:	0190                	.insn	2, 0x0190
     ec8:	0000                	.insn	2, 0x0000
     eca:	1301                	.insn	2, 0x1301
     ecc:	01d5                	.insn	2, 0x01d5
     ece:	0000                	.insn	2, 0x0000
     ed0:	0e01                	.insn	2, 0x0e01
     ed2:	6102                	.insn	2, 0x6102
     ed4:	0000                	.insn	2, 0x0000
     ed6:	1300                	.insn	2, 0x1300
     ed8:	0360                	.insn	2, 0x0360
     eda:	0000                	.insn	2, 0x0000
     edc:	0e01                	.insn	2, 0x0e01
     ede:	6102                	.insn	2, 0x6102
     ee0:	0000                	.insn	2, 0x0000
     ee2:	1400                	.insn	2, 0x1400
     ee4:	029e                	.insn	2, 0x029e
     ee6:	0000                	.insn	2, 0x0000
     ee8:	1001                	.insn	2, 0x1001
     eea:	6102                	.insn	2, 0x6102
     eec:	0000                	.insn	2, 0x0000
     eee:	1400                	.insn	2, 0x1400
     ef0:	0059                	.insn	2, 0x0059
     ef2:	0000                	.insn	2, 0x0000
     ef4:	1101                	.insn	2, 0x1101
     ef6:	6102                	.insn	2, 0x6102
     ef8:	0000                	.insn	2, 0x0000
     efa:	0000                	.insn	2, 0x0000
     efc:	e016                	.insn	2, 0xe016
     efe:	400d                	.insn	2, 0x400d
     f00:	0c00                	.insn	2, 0x0c00
     f02:	0000                	.insn	2, 0x0000
     f04:	0100                	.insn	2, 0x0100
     f06:	c652                	.insn	2, 0xc652
     f08:	0000                	.insn	2, 0x0000
     f0a:	0100                	.insn	2, 0x0100
     f0c:	17d2                	.insn	2, 0x17d2
     f0e:	0984                	.insn	2, 0x0984
     f10:	0000                	.insn	2, 0x0000
     f12:	0380                	.insn	2, 0x0380
     f14:	0000                	.insn	2, 0x0000
     f16:	d201                	.insn	2, 0xd201
     f18:	006c                	.insn	2, 0x006c
     f1a:	0000                	.insn	2, 0x0000
     f1c:	740e                	.insn	2, 0x740e
     f1e:	0005                	.insn	2, 0x0005
     f20:	e000                	.insn	2, 0xe000
     f22:	400d                	.insn	2, 0x400d
     f24:	0800                	.insn	2, 0x0800
     f26:	0000                	.insn	2, 0x0000
     f28:	0100                	.insn	2, 0x0100
     f2a:	05d5                	.insn	2, 0x05d5
     f2c:	061e                	.insn	2, 0x061e
     f2e:	0581                	.insn	2, 0x0581
     f30:	0000                	.insn	2, 0x0000
     f32:	011d                	.insn	2, 0x011d
     f34:	8d5a                	.insn	2, 0x8d5a
     f36:	0005                	.insn	2, 0x0005
     f38:	2000                	.insn	2, 0x2000
     f3a:	5a01                	.insn	2, 0x5a01
     f3c:	0599                	.insn	2, 0x0599
     f3e:	0000                	.insn	2, 0x0000
     f40:	0621                	.insn	2, 0x0621
     f42:	05a5                	.insn	2, 0x05a5
     f44:	0000                	.insn	2, 0x0000
     f46:	0000                	.insn	2, 0x0000
     f48:	ec16                	.insn	2, 0xec16
     f4a:	400d                	.insn	2, 0x400d
     f4c:	0c00                	.insn	2, 0x0c00
     f4e:	0000                	.insn	2, 0x0000
     f50:	0100                	.insn	2, 0x0100
     f52:	8052                	.insn	2, 0x8052
     f54:	0002                	.insn	2, 0x0002
     f56:	0100                	.insn	2, 0x0100
     f58:	17dd                	.insn	2, 0x17dd
     f5a:	099f 0000 0380      	.insn	6, 0x03800000099f
     f60:	0000                	.insn	2, 0x0000
     f62:	dd01                	.insn	2, 0xdd01
     f64:	006c                	.insn	2, 0x006c
     f66:	0000                	.insn	2, 0x0000
     f68:	740e                	.insn	2, 0x740e
     f6a:	0005                	.insn	2, 0x0005
     f6c:	ec00                	.insn	2, 0xec00
     f6e:	400d                	.insn	2, 0x400d
     f70:	0800                	.insn	2, 0x0800
     f72:	0000                	.insn	2, 0x0000
     f74:	0100                	.insn	2, 0x0100
     f76:	05e1                	.insn	2, 0x05e1
     f78:	061e                	.insn	2, 0x061e
     f7a:	0581                	.insn	2, 0x0581
     f7c:	0000                	.insn	2, 0x0000
     f7e:	011d                	.insn	2, 0x011d
     f80:	8d5a                	.insn	2, 0x8d5a
     f82:	0005                	.insn	2, 0x0005
     f84:	2000                	.insn	2, 0x2000
     f86:	5a01                	.insn	2, 0x5a01
     f88:	0599                	.insn	2, 0x0599
     f8a:	0000                	.insn	2, 0x0000
     f8c:	0621                	.insn	2, 0x0621
     f8e:	05a5                	.insn	2, 0x05a5
     f90:	0000                	.insn	2, 0x0000
     f92:	0000                	.insn	2, 0x0000
     f94:	ec22                	.insn	2, 0xec22
     f96:	0000                	.insn	2, 0x0000
     f98:	0100                	.insn	2, 0x0100
     f9a:	022e                	.insn	2, 0x022e
     f9c:	1301                	.insn	2, 0x1301
     f9e:	01d5                	.insn	2, 0x01d5
     fa0:	0000                	.insn	2, 0x0000
     fa2:	2e01                	.insn	2, 0x2e01
     fa4:	6102                	.insn	2, 0x6102
     fa6:	0000                	.insn	2, 0x0000
     fa8:	1300                	.insn	2, 0x1300
     faa:	0360                	.insn	2, 0x0360
     fac:	0000                	.insn	2, 0x0000
     fae:	2f01                	.insn	2, 0x2f01
     fb0:	6102                	.insn	2, 0x6102
     fb2:	0000                	.insn	2, 0x0000
     fb4:	1300                	.insn	2, 0x1300
     fb6:	000003e3          	beqz	zero,17bc <$d.5+0x36b>
     fba:	3001                	.insn	2, 0x3001
     fbc:	6102                	.insn	2, 0x6102
     fbe:	0000                	.insn	2, 0x0000
     fc0:	1400                	.insn	2, 0x1400
     fc2:	029e                	.insn	2, 0x029e
     fc4:	0000                	.insn	2, 0x0000
     fc6:	3201                	.insn	2, 0x3201
     fc8:	6102                	.insn	2, 0x6102
     fca:	0000                	.insn	2, 0x0000
     fcc:	1400                	.insn	2, 0x1400
     fce:	0311                	.insn	2, 0x0311
     fd0:	0000                	.insn	2, 0x0000
     fd2:	3301                	.insn	2, 0x3301
     fd4:	6102                	.insn	2, 0x6102
     fd6:	0000                	.insn	2, 0x0000
     fd8:	1400                	.insn	2, 0x1400
     fda:	0059                	.insn	2, 0x0059
     fdc:	0000                	.insn	2, 0x0000
     fde:	3401                	.insn	2, 0x3401
     fe0:	6102                	.insn	2, 0x6102
     fe2:	0000                	.insn	2, 0x0000
     fe4:	0000                	.insn	2, 0x0000
     fe6:	f816                	.insn	2, 0xf816
     fe8:	400d                	.insn	2, 0x400d
     fea:	0c00                	.insn	2, 0x0c00
     fec:	0000                	.insn	2, 0x0000
     fee:	0100                	.insn	2, 0x0100
     ff0:	8952                	.insn	2, 0x8952
     ff2:	0001                	.insn	2, 0x0001
     ff4:	0100                	.insn	2, 0x0100
     ff6:	23e9                	.insn	2, 0x23e9
     ff8:	5a01                	.insn	2, 0x5a01
     ffa:	0049                	.insn	2, 0x0049
     ffc:	0000                	.insn	2, 0x0000
     ffe:	e901                	.insn	2, 0xe901
    1000:	0061                	.insn	2, 0x0061
    1002:	0000                	.insn	2, 0x0000
    1004:	2b5b0123          	sb	s5,674(s6)
    1008:	0000                	.insn	2, 0x0000
    100a:	0100                	.insn	2, 0x0100
    100c:	61e9                	.insn	2, 0x61e9
    100e:	0000                	.insn	2, 0x0000
    1010:	0e00                	.insn	2, 0x0e00
    1012:	064a                	.insn	2, 0x064a
    1014:	0000                	.insn	2, 0x0000
    1016:	0df8                	.insn	2, 0x0df8
    1018:	0040                	.insn	2, 0x0040
    101a:	0008                	.insn	2, 0x0008
    101c:	0000                	.insn	2, 0x0000
    101e:	ec01                	.insn	2, 0xec01
    1020:	1e05                	.insn	2, 0x1e05
    1022:	5309                	.insn	2, 0x5309
    1024:	0006                	.insn	2, 0x0006
    1026:	1d00                	.insn	2, 0x1d00
    1028:	5a01                	.insn	2, 0x5a01
    102a:	065f 0000 011d      	.insn	6, 0x011d0000065f
    1030:	00066b5b          	.insn	4, 0x00066b5b
    1034:	2000                	.insn	2, 0x2000
    1036:	5a01                	.insn	2, 0x5a01
    1038:	00000677          	.insn	4, 0x0677
    103c:	0120                	.insn	2, 0x0120
    103e:	0006835b          	.insn	4, 0x0006835b
    1042:	2100                	.insn	2, 0x2100
    1044:	8f09                	.insn	2, 0x8f09
    1046:	0006                	.insn	2, 0x0006
    1048:	0000                	.insn	2, 0x0000
    104a:	2400                	.insn	2, 0x2400
    104c:	0e04                	.insn	2, 0x0e04
    104e:	0040                	.insn	2, 0x0040
    1050:	0034                	.insn	2, 0x0034
    1052:	0000                	.insn	2, 0x0000
    1054:	5201                	.insn	2, 0x5201
    1056:	0169                	.insn	2, 0x0169
    1058:	0000                	.insn	2, 0x0000
    105a:	f401                	.insn	2, 0xf401
    105c:	0ab2                	.insn	2, 0x0ab2
    105e:	0000                	.insn	2, 0x0000
    1060:	3a5a0123          	sb	t0,930(s4)
    1064:	0000                	.insn	2, 0x0000
    1066:	0100                	.insn	2, 0x0100
    1068:	b2f4                	.insn	2, 0xb2f4
    106a:	000a                	.insn	2, 0x000a
    106c:	1700                	.insn	2, 0x1700
    106e:	09ba                	.insn	2, 0x09ba
    1070:	0000                	.insn	2, 0x0000
    1072:	000001db          	.insn	4, 0x01db
    1076:	f401                	.insn	2, 0xf401
    1078:	0ae6                	.insn	2, 0x0ae6
    107a:	0000                	.insn	2, 0x0000
    107c:	e01a                	.insn	2, 0xe01a
    107e:	0009                	.insn	2, 0x0009
    1080:	1900                	.insn	2, 0x1900
    1082:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1086:	b2f5                	.insn	2, 0xb2f5
    1088:	000a                	.insn	2, 0x000a
    108a:	0000                	.insn	2, 0x0000
    108c:	3824                	.insn	2, 0x3824
    108e:	400e                	.insn	2, 0x400e
    1090:	4000                	.insn	2, 0x4000
    1092:	0000                	.insn	2, 0x0000
    1094:	0100                	.insn	2, 0x0100
    1096:	fe52                	.insn	2, 0xfe52
    1098:	0002                	.insn	2, 0x0002
    109a:	0100                	.insn	2, 0x0100
    109c:	73fc                	.insn	2, 0x73fc
    109e:	0000                	.insn	2, 0x0000
    10a0:	1700                	.insn	2, 0x1700
    10a2:	0a11                	.insn	2, 0x0a11
    10a4:	0000                	.insn	2, 0x0000
    10a6:	0118                	.insn	2, 0x0118
    10a8:	0000                	.insn	2, 0x0000
    10aa:	fc01                	.insn	2, 0xfc01
    10ac:	0ae6                	.insn	2, 0x0ae6
    10ae:	0000                	.insn	2, 0x0000
    10b0:	000a4f17          	auipc	t5,0xa4
    10b4:	cb00                	.insn	2, 0xcb00
    10b6:	0002                	.insn	2, 0x0002
    10b8:	0100                	.insn	2, 0x0100
    10ba:	e6fc                	.insn	2, 0xe6fc
    10bc:	000a                	.insn	2, 0x000a
    10be:	0000                	.insn	2, 0x0000
    10c0:	7825                	.insn	2, 0x7825
    10c2:	400e                	.insn	2, 0x400e
    10c4:	bc00                	.insn	2, 0xbc00
    10c6:	0002                	.insn	2, 0x0002
    10c8:	0100                	.insn	2, 0x0100
    10ca:	6f52                	.insn	2, 0x6f52
    10cc:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    10d0:	6a260107          	.insn	4, 0x6a260107
    10d4:	000a                	.insn	2, 0x000a
    10d6:	8700                	.insn	2, 0x8700
    10d8:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    10dc:	0ae60107          	.insn	4, 0x0ae60107
    10e0:	0000                	.insn	2, 0x0000
    10e2:	18910227          	.insn	4, 0x18910227
    10e6:	03e8                	.insn	2, 0x03e8
    10e8:	0000                	.insn	2, 0x0000
    10ea:	0801                	.insn	2, 0x0801
    10ec:	f001                	.insn	2, 0xf001
    10ee:	000a                	.insn	2, 0x000a
    10f0:	2800                	.insn	2, 0x2800
    10f2:	0346                	.insn	2, 0x0346
    10f4:	0000                	.insn	2, 0x0000
    10f6:	4d01                	.insn	2, 0x4d01
    10f8:	1801                	.insn	2, 0x1801
    10fa:	4011                	.insn	2, 0x4011
    10fc:	2900                	.insn	2, 0x2900
    10fe:	0200                	.insn	2, 0x0200
    1100:	0000                	.insn	2, 0x0000
    1102:	0d910227          	.insn	4, 0x0d910227
    1106:	00b5                	.insn	2, 0x00b5
    1108:	0000                	.insn	2, 0x0000
    110a:	2a01                	.insn	2, 0x2a01
    110c:	fa01                	.insn	2, 0xfa01
    110e:	000a                	.insn	2, 0x000a
    1110:	2a00                	.insn	2, 0x2a00
    1112:	0a90                	.insn	2, 0x0a90
    1114:	0000                	.insn	2, 0x0000
    1116:	027a                	.insn	2, 0x027a
    1118:	0000                	.insn	2, 0x0000
    111a:	1e01                	.insn	2, 0x1e01
    111c:	7301                	.insn	2, 0x7301
    111e:	0000                	.insn	2, 0x0000
    1120:	2a00                	.insn	2, 0x2a00
    1122:	0ab6                	.insn	2, 0x0ab6
    1124:	0000                	.insn	2, 0x0000
    1126:	000003b3          	add	t2,zero,zero
    112a:	2001                	.insn	2, 0x2001
    112c:	6c01                	.insn	2, 0x6c01
    112e:	0000                	.insn	2, 0x0000
    1130:	2a00                	.insn	2, 0x2a00
    1132:	0af2                	.insn	2, 0x0af2
    1134:	0000                	.insn	2, 0x0000
    1136:	0038                	.insn	2, 0x0038
    1138:	0000                	.insn	2, 0x0000
    113a:	2b01                	.insn	2, 0x2b01
    113c:	7301                	.insn	2, 0x7301
    113e:	0000                	.insn	2, 0x0000
    1140:	2b00                	.insn	2, 0x2b00
    1142:	0000019b          	.insn	4, 0x019b
    1146:	0f4c                	.insn	2, 0x0f4c
    1148:	0040                	.insn	2, 0x0040
    114a:	000c                	.insn	2, 0x000c
    114c:	0000                	.insn	2, 0x0000
    114e:	2f01                	.insn	2, 0x2f01
    1150:	1901                	.insn	2, 0x1901
    1152:	301e                	.insn	2, 0x301e
    1154:	01a4                	.insn	2, 0x01a4
    1156:	0000                	.insn	2, 0x0000
    1158:	2b00                	.insn	2, 0x2b00
    115a:	0000019b          	.insn	4, 0x019b
    115e:	10a4                	.insn	2, 0x10a4
    1160:	0040                	.insn	2, 0x0040
    1162:	000c                	.insn	2, 0x000c
    1164:	0000                	.insn	2, 0x0000
    1166:	2201                	.insn	2, 0x2201
    1168:	1901                	.insn	2, 0x1901
    116a:	2d1e                	.insn	2, 0x2d1e
    116c:	01a4                	.insn	2, 0x01a4
    116e:	0000                	.insn	2, 0x0000
    1170:	2c00                	.insn	2, 0x2c00
    1172:	0000019b          	.insn	4, 0x019b
    1176:	10ec                	.insn	2, 0x10ec
    1178:	0040                	.insn	2, 0x0040
    117a:	000c                	.insn	2, 0x000c
    117c:	0000                	.insn	2, 0x0000
    117e:	3a01                	.insn	2, 0x3a01
    1180:	1901                	.insn	2, 0x1901
    1182:	1900                	.insn	2, 0x1900
    1184:	0f68                	.insn	2, 0x0f68
    1186:	0040                	.insn	2, 0x0040
    1188:	00e8                	.insn	2, 0x00e8
    118a:	0000                	.insn	2, 0x0000
    118c:	b72a                	.insn	2, 0xb72a
    118e:	7a00000b          	.insn	4, 0x7a00000b
    1192:	0002                	.insn	2, 0x0002
    1194:	0100                	.insn	2, 0x0100
    1196:	006c013f 78190000 	.insn	8, 0x78190000006c013f
    119e:	d800400f          	.insn	4, 0xd800400f
    11a2:	0000                	.insn	2, 0x0000
    11a4:	2a00                	.insn	2, 0x2a00
    11a6:	0b32                	.insn	2, 0x0b32
    11a8:	0000                	.insn	2, 0x0000
    11aa:	0038                	.insn	2, 0x0038
    11ac:	0000                	.insn	2, 0x0000
    11ae:	4001                	.insn	2, 0x4001
    11b0:	7301                	.insn	2, 0x7301
    11b2:	0000                	.insn	2, 0x0000
    11b4:	1900                	.insn	2, 0x1900
    11b6:	0f78                	.insn	2, 0x0f78
    11b8:	0040                	.insn	2, 0x0040
    11ba:	00d8                	.insn	2, 0x00d8
    11bc:	0000                	.insn	2, 0x0000
    11be:	d22a                	.insn	2, 0xd22a
    11c0:	2a00000b          	.insn	4, 0x2a00000b
    11c4:	0001                	.insn	2, 0x0001
    11c6:	0100                	.insn	2, 0x0100
    11c8:	0141                	.insn	2, 0x0141
    11ca:	006c                	.insn	2, 0x006c
    11cc:	0000                	.insn	2, 0x0000
    11ce:	9b2d                	.insn	2, 0x9b2d
    11d0:	0001                	.insn	2, 0x0001
    11d2:	1800                	.insn	2, 0x1800
    11d4:	0002                	.insn	2, 0x0002
    11d6:	0100                	.insn	2, 0x0100
    11d8:	0142                	.insn	2, 0x0142
    11da:	0019                	.insn	2, 0x0019
    11dc:	0000                	.insn	2, 0x0000
    11de:	00019b2b          	.insn	4, 0x00019b2b
    11e2:	5800                	.insn	2, 0x5800
    11e4:	4010                	.insn	2, 0x4010
    11e6:	0c00                	.insn	2, 0x0c00
    11e8:	0000                	.insn	2, 0x0000
    11ea:	0100                	.insn	2, 0x0100
    11ec:	1e150113          	addi	sp,a0,481 # 1e1 <$d.10+0x19>
    11f0:	a425                	.insn	2, 0xa425
    11f2:	0001                	.insn	2, 0x0001
    11f4:	0000                	.insn	2, 0x0000
    11f6:	6c19                	.insn	2, 0x6c19
    11f8:	4010                	.insn	2, 0x4010
    11fa:	3800                	.insn	2, 0x3800
    11fc:	0000                	.insn	2, 0x0000
    11fe:	2a00                	.insn	2, 0x2a00
    1200:	0c3a                	.insn	2, 0x0c3a
    1202:	0000                	.insn	2, 0x0000
    1204:	0000011b          	.insn	4, 0x011b
    1208:	1601                	.insn	2, 0x1601
    120a:	e601                	.insn	2, 0xe601
    120c:	000a                	.insn	2, 0x000a
    120e:	2b00                	.insn	2, 0x2b00
    1210:	0000019b          	.insn	4, 0x019b
    1214:	1088                	.insn	2, 0x1088
    1216:	0040                	.insn	2, 0x0040
    1218:	000c                	.insn	2, 0x000c
    121a:	0000                	.insn	2, 0x0000
    121c:	1801                	.insn	2, 0x1801
    121e:	1901                	.insn	2, 0x1901
    1220:	011d                	.insn	2, 0x011d
    1222:	a459                	.insn	2, 0xa459
    1224:	0001                	.insn	2, 0x0001
    1226:	0000                	.insn	2, 0x0000
    1228:	2b00                	.insn	2, 0x2b00
    122a:	0000019b          	.insn	4, 0x019b
    122e:	110c                	.insn	2, 0x110c
    1230:	0040                	.insn	2, 0x0040
    1232:	000c                	.insn	2, 0x000c
    1234:	0000                	.insn	2, 0x0000
    1236:	1001                	.insn	2, 0x1001
    1238:	1501                	.insn	2, 0x1501
    123a:	251e                	.insn	2, 0x251e
    123c:	01a4                	.insn	2, 0x01a4
    123e:	0000                	.insn	2, 0x0000
    1240:	2b00                	.insn	2, 0x2b00
    1242:	0000019b          	.insn	4, 0x019b
    1246:	0f0c                	.insn	2, 0x0f0c
    1248:	0040                	.insn	2, 0x0040
    124a:	000c                	.insn	2, 0x000c
    124c:	0000                	.insn	2, 0x0000
    124e:	4701                	.insn	2, 0x4701
    1250:	0d01                	.insn	2, 0x0d01
    1252:	011d                	.insn	2, 0x011d
    1254:	a459                	.insn	2, 0xa459
    1256:	0001                	.insn	2, 0x0001
    1258:	0000                	.insn	2, 0x0000
    125a:	002e                	.insn	2, 0x002e
    125c:	4011342f          	.insn	4, 0x4011342f
    1260:	a800                	.insn	2, 0xa800
    1262:	0000                	.insn	2, 0x0000
    1264:	0100                	.insn	2, 0x0100
    1266:	d152                	.insn	2, 0xd152
    1268:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    126c:	0155                	.insn	2, 0x0155
    126e:	006c                	.insn	2, 0x006c
    1270:	0000                	.insn	2, 0x0000
    1272:	6d26                	.insn	2, 0x6d26
    1274:	000c                	.insn	2, 0x000c
    1276:	1b00                	.insn	2, 0x1b00
    1278:	0001                	.insn	2, 0x0001
    127a:	0100                	.insn	2, 0x0100
    127c:	0155                	.insn	2, 0x0155
    127e:	0ae6                	.insn	2, 0x0ae6
    1280:	0000                	.insn	2, 0x0000
    1282:	9e2a                	.insn	2, 0x9e2a
    1284:	000c                	.insn	2, 0x000c
    1286:	7000                	.insn	2, 0x7000
    1288:	0001                	.insn	2, 0x0001
    128a:	0100                	.insn	2, 0x0100
    128c:	0156                	.insn	2, 0x0156
    128e:	006c                	.insn	2, 0x006c
    1290:	0000                	.insn	2, 0x0000
    1292:	dd2a                	.insn	2, 0xdd2a
    1294:	000c                	.insn	2, 0x000c
    1296:	c400                	.insn	2, 0xc400
    1298:	0000                	.insn	2, 0x0000
    129a:	0100                	.insn	2, 0x0100
    129c:	006c015b          	.insn	4, 0x006c015b
    12a0:	0000                	.insn	2, 0x0000
    12a2:	6029                	.insn	2, 0x6029
    12a4:	0002                	.insn	2, 0x0002
    12a6:	2a00                	.insn	2, 0x2a00
    12a8:	00000d0f          	.insn	4, 0x0d0f
    12ac:	0106                	.insn	2, 0x0106
    12ae:	0000                	.insn	2, 0x0000
    12b0:	5d01                	.insn	2, 0x5d01
    12b2:	4001                	.insn	2, 0x4001
    12b4:	0000                	.insn	2, 0x0000
    12b6:	2a00                	.insn	2, 0x2a00
    12b8:	0d2a                	.insn	2, 0x0d2a
    12ba:	0000                	.insn	2, 0x0000
    12bc:	0319                	.insn	2, 0x0319
    12be:	0000                	.insn	2, 0x0000
    12c0:	5e01                	.insn	2, 0x5e01
    12c2:	6c01                	.insn	2, 0x6c01
    12c4:	0000                	.insn	2, 0x0000
    12c6:	0000                	.insn	2, 0x0000
    12c8:	2f00                	.insn	2, 0x2f00
    12ca:	11dc                	.insn	2, 0x11dc
    12cc:	0040                	.insn	2, 0x0040
    12ce:	006c                	.insn	2, 0x006c
    12d0:	0000                	.insn	2, 0x0000
    12d2:	5201                	.insn	2, 0x5201
    12d4:	0252                	.insn	2, 0x0252
    12d6:	0000                	.insn	2, 0x0000
    12d8:	6a01                	.insn	2, 0x6a01
    12da:	b701                	.insn	2, 0xb701
    12dc:	000a                	.insn	2, 0x000a
    12de:	2600                	.insn	2, 0x2600
    12e0:	0d45                	.insn	2, 0x0d45
    12e2:	0000                	.insn	2, 0x0000
    12e4:	0078                	.insn	2, 0x0078
    12e6:	0000                	.insn	2, 0x0000
    12e8:	6a01                	.insn	2, 0x6a01
    12ea:	6c01                	.insn	2, 0x6c01
    12ec:	0000                	.insn	2, 0x0000
    12ee:	1900                	.insn	2, 0x1900
    12f0:	1208                	.insn	2, 0x1208
    12f2:	0040                	.insn	2, 0x0040
    12f4:	002c                	.insn	2, 0x002c
    12f6:	0000                	.insn	2, 0x0000
    12f8:	762a                	.insn	2, 0x762a
    12fa:	000d                	.insn	2, 0x000d
    12fc:	3800                	.insn	2, 0x3800
    12fe:	0000                	.insn	2, 0x0000
    1300:	0100                	.insn	2, 0x0100
    1302:	016e                	.insn	2, 0x016e
    1304:	006c                	.insn	2, 0x006c
    1306:	0000                	.insn	2, 0x0000
    1308:	0000                	.insn	2, 0x0000
    130a:	4012482f          	.insn	4, 0x4012482f
    130e:	1400                	.insn	2, 0x1400
    1310:	0000                	.insn	2, 0x0000
    1312:	0100                	.insn	2, 0x0100
    1314:	d852                	.insn	2, 0xd852
    1316:	0002                	.insn	2, 0x0002
    1318:	0100                	.insn	2, 0x0100
    131a:	007301bb          	.insn	4, 0x007301bb
    131e:	0000                	.insn	2, 0x0000
    1320:	b52a                	.insn	2, 0xb52a
    1322:	000d                	.insn	2, 0x000d
    1324:	e000                	.insn	2, 0xe000
    1326:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    132a:	01bd                	.insn	2, 0x01bd
    132c:	00000073          	ecall
    1330:	2f00                	.insn	2, 0x2f00
    1332:	125c                	.insn	2, 0x125c
    1334:	0040                	.insn	2, 0x0040
    1336:	0014                	.insn	2, 0x0014
    1338:	0000                	.insn	2, 0x0000
    133a:	5201                	.insn	2, 0x5201
    133c:	0000038b          	.insn	4, 0x038b
    1340:	c901                	.insn	2, 0xc901
    1342:	7301                	.insn	2, 0x7301
    1344:	0000                	.insn	2, 0x0000
    1346:	2a00                	.insn	2, 0x2a00
    1348:	0dd0                	.insn	2, 0x0dd0
    134a:	0000                	.insn	2, 0x0000
    134c:	03e0                	.insn	2, 0x03e0
    134e:	0000                	.insn	2, 0x0000
    1350:	cb01                	.insn	2, 0xcb01
    1352:	7301                	.insn	2, 0x7301
    1354:	0000                	.insn	2, 0x0000
    1356:	0000                	.insn	2, 0x0000
    1358:	4012702f          	.insn	4, 0x4012702f
    135c:	0c00                	.insn	2, 0x0c00
    135e:	0000                	.insn	2, 0x0000
    1360:	0100                	.insn	2, 0x0100
    1362:	a152                	.insn	2, 0xa152
    1364:	0002                	.insn	2, 0x0002
    1366:	0100                	.insn	2, 0x0100
    1368:	021d                	.insn	2, 0x021d
    136a:	00000073          	ecall
    136e:	eb26                	.insn	2, 0xeb26
    1370:	000d                	.insn	2, 0x000d
    1372:	8000                	.insn	2, 0x8000
    1374:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1378:	021d                	.insn	2, 0x021d
    137a:	0061                	.insn	2, 0x0061
    137c:	0000                	.insn	2, 0x0000
    137e:	0130                	.insn	2, 0x0130
    1380:	0000b55b          	.insn	4, 0xb55b
    1384:	0100                	.insn	2, 0x0100
    1386:	021d                	.insn	2, 0x021d
    1388:	0af9                	.insn	2, 0x0af9
    138a:	0000                	.insn	2, 0x0000
    138c:	9e5a0127          	.insn	4, 0x9e5a0127
    1390:	0002                	.insn	2, 0x0002
    1392:	0100                	.insn	2, 0x0100
    1394:	021f 0061 0000      	.insn	6, 0x0061021f
    139a:	115b0127          	.insn	4, 0x115b0127
    139e:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    13a2:	0220                	.insn	2, 0x0220
    13a4:	0061                	.insn	2, 0x0061
    13a6:	0000                	.insn	2, 0x0000
    13a8:	0831                	.insn	2, 0x0831
    13aa:	0059                	.insn	2, 0x0059
    13ac:	0000                	.insn	2, 0x0000
    13ae:	2101                	.insn	2, 0x2101
    13b0:	6102                	.insn	2, 0x6102
    13b2:	0000                	.insn	2, 0x0000
    13b4:	0000                	.insn	2, 0x0000
    13b6:	40127c2f          	.insn	4, 0x40127c2f
    13ba:	0c00                	.insn	2, 0x0c00
    13bc:	0000                	.insn	2, 0x0000
    13be:	0100                	.insn	2, 0x0100
    13c0:	5052                	.insn	2, 0x5052
    13c2:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    13c6:	0241                	.insn	2, 0x0241
    13c8:	0190                	.insn	2, 0x0190
    13ca:	0000                	.insn	2, 0x0000
    13cc:	0a31                	.insn	2, 0x0a31
    13ce:	0059                	.insn	2, 0x0059
    13d0:	0000                	.insn	2, 0x0000
    13d2:	4401                	.insn	2, 0x4401
    13d4:	6102                	.insn	2, 0x6102
    13d6:	0000                	.insn	2, 0x0000
    13d8:	2a00                	.insn	2, 0x2a00
    13da:	0e06                	.insn	2, 0x0e06
    13dc:	0000                	.insn	2, 0x0000
    13de:	029e                	.insn	2, 0x029e
    13e0:	0000                	.insn	2, 0x0000
    13e2:	4301                	.insn	2, 0x4301
    13e4:	6102                	.insn	2, 0x6102
    13e6:	0000                	.insn	2, 0x0000
    13e8:	0000                	.insn	2, 0x0000
    13ea:	0032                	.insn	2, 0x0032
    13ec:	4000                	.insn	2, 0x4000
    13ee:	1c00                	.insn	2, 0x1c00
    13f0:	0000                	.insn	2, 0x0000
    13f2:	0100                	.insn	2, 0x0100
    13f4:	0752                	.insn	2, 0x0752
    13f6:	0000                	.insn	2, 0x0000
    13f8:	0100                	.insn	2, 0x0100
    13fa:	40090253          	.insn	4, 0x40090253
    13fe:	0000                	.insn	2, 0x0000
    1400:	0800                	.insn	2, 0x0800
    1402:	00000073          	ecall
    1406:	00ad                	.insn	2, 0x00ad
    1408:	0000                	.insn	2, 0x0000
    140a:	4e030e03          	lb	t3,1248(t1)
    140e:	0000                	.insn	2, 0x0000
    1410:	0400                	.insn	2, 0x0400
    1412:	00000047          	.insn	4, 0x0047
    1416:	0404                	.insn	2, 0x0404
    1418:	00000047          	.insn	4, 0x0047
    141c:	0004                	.insn	2, 0x0004
    141e:	00006103          	.insn	4, 0x6103
    1422:	0400                	.insn	2, 0x0400
    1424:	00000047          	.insn	4, 0x0047
    1428:	0404                	.insn	2, 0x0404
    142a:	00000047          	.insn	4, 0x0047
    142e:	0004                	.insn	2, 0x0004
    1430:	eb09                	.insn	2, 0xeb09
    1432:	000a                	.insn	2, 0x000a
    1434:	3300                	.insn	2, 0x3300
    1436:	0040                	.insn	2, 0x0040
    1438:	0000                	.insn	2, 0x0000
    143a:	f934                	.insn	2, 0xf934
    143c:	000a                	.insn	2, 0x000a
    143e:	2300                	.insn	2, 0x2300
    1440:	35000003          	lb	zero,848(zero) # 350 <$d.6+0xc0>
    1444:	00004003          	lbu	zero,0(zero) # 0 <$d.4>
    1448:	0400                	.insn	2, 0x0400
    144a:	00000047          	.insn	4, 0x0047
    144e:	          	.insn	4, 0x5f00000b

00001451 <$d.5>:
    1451:	055f 0000 0004      	.insn	6, 0x00040000055f
    1457:	04ce                	.insn	2, 0x04ce
    1459:	0000                	.insn	2, 0x0000
    145b:	0104                	.insn	2, 0x0104
    145d:	013a                	.insn	2, 0x013a
    145f:	0000                	.insn	2, 0x0000
    1461:	001d                	.insn	2, 0x001d
    1463:	0175                	.insn	2, 0x0175
    1465:	0000                	.insn	2, 0x0000
    1467:	000010ef          	jal	2467 <$d.5+0x1016>
    146b:	021d                	.insn	2, 0x021d
    146d:	0000                	.insn	2, 0x0000
    146f:	1288                	.insn	2, 0x1288
    1471:	0040                	.insn	2, 0x0040
    1473:	0734                	.insn	2, 0x0734
    1475:	0000                	.insn	2, 0x0000
    1477:	3302                	.insn	2, 0x3302
    1479:	0000                	.insn	2, 0x0000
    147b:	0100                	.insn	2, 0x0100
    147d:	0512                	.insn	2, 0x0512
    147f:	401d2903          	lw	s2,1025(s10)
    1483:	0300                	.insn	2, 0x0300
    1485:	0000003f 00004604 	.insn	8, 0x46040000003f
    148d:	1000                	.insn	2, 0x1000
    148f:	0500                	.insn	2, 0x0500
    1491:	01fc                	.insn	2, 0x01fc
    1493:	0000                	.insn	2, 0x0000
    1495:	0108                	.insn	2, 0x0108
    1497:	e006                	.insn	2, 0xe006
    1499:	0002                	.insn	2, 0x0002
    149b:	0800                	.insn	2, 0x0800
    149d:	005a0207          	.insn	4, 0x005a0207
    14a1:	0000                	.insn	2, 0x0000
    14a3:	d601                	.insn	2, 0xd601
    14a5:	0305                	.insn	2, 0x0305
    14a7:	1b90                	.insn	2, 0x1b90
    14a9:	0040                	.insn	2, 0x0040
    14ab:	00003f03          	.insn	4, 0x3f03
    14af:	0400                	.insn	2, 0x0400
    14b1:	0046                	.insn	2, 0x0046
    14b3:	0000                	.insn	2, 0x0000
    14b5:	0009                	.insn	2, 0x0009
    14b7:	3302                	.insn	2, 0x3302
    14b9:	0000                	.insn	2, 0x0000
    14bb:	0100                	.insn	2, 0x0100
    14bd:	05e9                	.insn	2, 0x05e9
    14bf:	401cc203          	lbu	tp,1025(s9)
    14c3:	0700                	.insn	2, 0x0700
    14c5:	00000197          	auipc	gp,0x0
    14c9:	0084                	.insn	2, 0x0084
    14cb:	0000                	.insn	2, 0x0000
    14cd:	0301                	.insn	2, 0x0301
    14cf:	0305                	.insn	2, 0x0305
    14d1:	1d68                	.insn	2, 0x1d68
    14d3:	0040                	.insn	2, 0x0040
    14d5:	00009103          	lh	sp,0(ra)
    14d9:	0800                	.insn	2, 0x0800
    14db:	0046                	.insn	2, 0x0046
    14dd:	0000                	.insn	2, 0x0000
    14df:	0200                	.insn	2, 0x0200
    14e1:	0900                	.insn	2, 0x0900
    14e3:	009c                	.insn	2, 0x009c
    14e5:	0000                	.insn	2, 0x0000
    14e7:	0000031b          	.insn	4, 0x031b
    14eb:	0f02                	.insn	2, 0x0f02
    14ed:	e405                	.insn	2, 0xe405
    14ef:	0001                	.insn	2, 0x0001
    14f1:	0800                	.insn	2, 0x0800
    14f3:	0a01                	.insn	2, 0x0a01
    14f5:	0181                	.insn	2, 0x0181
    14f7:	0000                	.insn	2, 0x0000
    14f9:	00b4                	.insn	2, 0x00b4
    14fb:	0000                	.insn	2, 0x0000
    14fd:	0501                	.insn	2, 0x0501
    14ff:	0305                	.insn	2, 0x0305
    1501:	1f68                	.insn	2, 0x1f68
    1503:	0040                	.insn	2, 0x0040
    1505:	bf09                	.insn	2, 0xbf09
    1507:	0000                	.insn	2, 0x0000
    1509:	b000                	.insn	2, 0xb000
    150b:	0001                	.insn	2, 0x0001
    150d:	0300                	.insn	2, 0x0300
    150f:	0b0c                	.insn	2, 0x0b0c
    1511:	0314                	.insn	2, 0x0314
    1513:	0c06                	.insn	2, 0x0c06
    1515:	0131                	.insn	2, 0x0131
    1517:	0000                	.insn	2, 0x0000
    1519:	0100                	.insn	2, 0x0100
    151b:	0000                	.insn	2, 0x0000
    151d:	0c000703          	lb	a4,192(zero) # c0 <$d.10+0x4c>
    1521:	01f2                	.insn	2, 0x01f2
    1523:	0000                	.insn	2, 0x0000
    1525:	0100                	.insn	2, 0x0100
    1527:	0000                	.insn	2, 0x0000
    1529:	0c040803          	lb	a6,192(s0)
    152d:	00b9                	.insn	2, 0x00b9
    152f:	0000                	.insn	2, 0x0000
    1531:	0100                	.insn	2, 0x0100
    1533:	0000                	.insn	2, 0x0000
    1535:	0c080903          	lb	s2,192(a6)
    1539:	0094                	.insn	2, 0x0094
    153b:	0000                	.insn	2, 0x0000
    153d:	0100                	.insn	2, 0x0100
    153f:	0000                	.insn	2, 0x0000
    1541:	0c0c0a03          	lb	s4,192(s8)
    1545:	03b5                	.insn	2, 0x03b5
    1547:	0000                	.insn	2, 0x0000
    1549:	0100                	.insn	2, 0x0100
    154b:	0000                	.insn	2, 0x0000
    154d:	00100b03          	lb	s6,1(zero) # 1 <$d.4+0x1>
    1551:	0b09                	.insn	2, 0x0b09
    1553:	0001                	.insn	2, 0x0001
    1555:	a700                	.insn	2, 0xa700
    1557:	0001                	.insn	2, 0x0001
    1559:	0200                	.insn	2, 0x0200
    155b:	0511                	.insn	2, 0x0511
    155d:	02b6                	.insn	2, 0x02b6
    155f:	0000                	.insn	2, 0x0000
    1561:	f50d0407          	.insn	4, 0xf50d0407
    1565:	0000                	.insn	2, 0x0000
    1567:	0100                	.insn	2, 0x0100
    1569:	0079                	.insn	2, 0x0079
    156b:	0001                	.insn	2, 0x0001
    156d:	0100                	.insn	2, 0x0100
    156f:	a10e                	.insn	2, 0xa10e
    1571:	0000                	.insn	2, 0x0000
    1573:	0100                	.insn	2, 0x0100
    1575:	0079                	.insn	2, 0x0079
    1577:	0001                	.insn	2, 0x0001
    1579:	0000                	.insn	2, 0x0000
    157b:	4012880f          	.insn	4, 0x4012880f
    157f:	ec00                	.insn	2, 0xec00
    1581:	0000                	.insn	2, 0x0000
    1583:	0100                	.insn	2, 0x0100
    1585:	1652                	.insn	2, 0x1652
    1587:	0000                	.insn	2, 0x0000
    1589:	0100                	.insn	2, 0x0100
    158b:	0003a607          	.insn	4, 0x0003a607
    158f:	1000                	.insn	2, 0x1000
    1591:	0e21                	.insn	2, 0x0e21
    1593:	0000                	.insn	2, 0x0000
    1595:	0314                	.insn	2, 0x0314
    1597:	0000                	.insn	2, 0x0000
    1599:	0701                	.insn	2, 0x0701
    159b:	0386                	.insn	2, 0x0386
    159d:	0000                	.insn	2, 0x0000
    159f:	0211                	.insn	2, 0x0211
    15a1:	1491                	.insn	2, 0x1491
    15a3:	00b5                	.insn	2, 0x00b5
    15a5:	0000                	.insn	2, 0x0000
    15a7:	0901                	.insn	2, 0x0901
    15a9:	0084                	.insn	2, 0x0084
    15ab:	0000                	.insn	2, 0x0000
    15ad:	0211                	.insn	2, 0x0211
    15af:	1091                	.insn	2, 0x1091
    15b1:	00a1                	.insn	2, 0x00a1
    15b3:	0000                	.insn	2, 0x0000
    15b5:	0b01                	.insn	2, 0x0b01
    15b7:	0100                	.insn	2, 0x0100
    15b9:	0000                	.insn	2, 0x0000
    15bb:	0211                	.insn	2, 0x0211
    15bd:	0c91                	.insn	2, 0x0c91
    15bf:	03a0                	.insn	2, 0x03a0
    15c1:	0000                	.insn	2, 0x0000
    15c3:	0c01                	.insn	2, 0x0c01
    15c5:	0100                	.insn	2, 0x0100
    15c7:	0000                	.insn	2, 0x0000
    15c9:	5212                	.insn	2, 0x5212
    15cb:	000e                	.insn	2, 0x000e
    15cd:	a900                	.insn	2, 0xa900
    15cf:	0000                	.insn	2, 0x0000
    15d1:	0100                	.insn	2, 0x0100
    15d3:	0016                	.insn	2, 0x0016
    15d5:	0001                	.insn	2, 0x0001
    15d7:	1300                	.insn	2, 0x1300
    15d9:	0112                	.insn	2, 0x0112
    15db:	0000                	.insn	2, 0x0000
    15dd:	12e4                	.insn	2, 0x12e4
    15df:	0040                	.insn	2, 0x0040
    15e1:	001c                	.insn	2, 0x001c
    15e3:	0000                	.insn	2, 0x0000
    15e5:	1701                	.insn	2, 0x1701
    15e7:	1409                	.insn	2, 0x1409
    15e9:	00000e3f 0000011e 	.insn	8, 0x011e00000e3f
    15f1:	1500                	.insn	2, 0x1500
    15f3:	131c                	.insn	2, 0x131c
    15f5:	0040                	.insn	2, 0x0040
    15f7:	0034                	.insn	2, 0x0034
    15f9:	0000                	.insn	2, 0x0000
    15fb:	6512                	.insn	2, 0x6512
    15fd:	000e                	.insn	2, 0x000e
    15ff:	3800                	.insn	2, 0x3800
    1601:	0000                	.insn	2, 0x0000
    1603:	0100                	.insn	2, 0x0100
    1605:	001c                	.insn	2, 0x001c
    1607:	0001                	.insn	2, 0x0001
    1609:	0000                	.insn	2, 0x0000
    160b:	f116                	.insn	2, 0xf116
    160d:	0001                	.insn	2, 0x0001
    160f:	a400                	.insn	2, 0xa400
    1611:	4012                	.insn	2, 0x4012
    1613:	1600                	.insn	2, 0x1600
    1615:	0255                	.insn	2, 0x0255
    1617:	0000                	.insn	2, 0x0000
    1619:	12c4                	.insn	2, 0x12c4
    161b:	0040                	.insn	2, 0x0040
    161d:	7816                	.insn	2, 0x7816
    161f:	d8000003          	lb	zero,-640(zero) # fffffd80 <USER_MAX+0xffaffd80>
    1623:	4012                	.insn	2, 0x4012
    1625:	1600                	.insn	2, 0x1600
    1627:	0390                	.insn	2, 0x0390
    1629:	0000                	.insn	2, 0x0000
    162b:	130c                	.insn	2, 0x130c
    162d:	0040                	.insn	2, 0x0040
    162f:	ae16                	.insn	2, 0xae16
    1631:	48000003          	lb	zero,1152(zero) # 480 <$d.6+0x1f0>
    1635:	16004013          	xori	zero,zero,352
    1639:	03ae                	.insn	2, 0x03ae
    163b:	0000                	.insn	2, 0x0000
    163d:	135c                	.insn	2, 0x135c
    163f:	0040                	.insn	2, 0x0040
    1641:	0f00                	.insn	2, 0x0f00
    1643:	1374                	.insn	2, 0x1374
    1645:	0040                	.insn	2, 0x0040
    1647:	0128                	.insn	2, 0x0128
    1649:	0000                	.insn	2, 0x0000
    164b:	5201                	.insn	2, 0x5201
    164d:	0088                	.insn	2, 0x0088
    164f:	0000                	.insn	2, 0x0000
    1651:	8001                	.insn	2, 0x8001
    1653:	03a6                	.insn	2, 0x03a6
    1655:	0000                	.insn	2, 0x0000
    1657:	9c12                	.insn	2, 0x9c12
    1659:	000e                	.insn	2, 0x000e
    165b:	b500                	.insn	2, 0xb500
    165d:	0000                	.insn	2, 0x0000
    165f:	0100                	.insn	2, 0x0100
    1661:	4c82                	.insn	2, 0x4c82
    1663:	0005                	.insn	2, 0x0005
    1665:	1200                	.insn	2, 0x1200
    1667:	00000eaf          	.insn	4, 0x0eaf
    166b:	01bd                	.insn	2, 0x01bd
    166d:	0000                	.insn	2, 0x0000
    166f:	9001                	.insn	2, 0x9001
    1671:	0100                	.insn	2, 0x0100
    1673:	0000                	.insn	2, 0x0000
    1675:	c212                	.insn	2, 0xc212
    1677:	000e                	.insn	2, 0x000e
    1679:	5b00                	.insn	2, 0x5b00
    167b:	0002                	.insn	2, 0x0002
    167d:	0100                	.insn	2, 0x0100
    167f:	00010097          	auipc	ra,0x10
    1683:	1200                	.insn	2, 0x1200
    1685:	0ed5                	.insn	2, 0x0ed5
    1687:	0000                	.insn	2, 0x0000
    1689:	0365                	.insn	2, 0x0365
    168b:	0000                	.insn	2, 0x0000
    168d:	9401                	.insn	2, 0x9401
    168f:	0100                	.insn	2, 0x0100
    1691:	0000                	.insn	2, 0x0000
    1693:	9016                	.insn	2, 0x9016
    1695:	a0000003          	lb	zero,-1536(zero) # fffffa00 <USER_MAX+0xffaffa00>
    1699:	16004013          	xori	zero,zero,352
    169d:	0390                	.insn	2, 0x0390
    169f:	0000                	.insn	2, 0x0000
    16a1:	13e4                	.insn	2, 0x13e4
    16a3:	0040                	.insn	2, 0x0040
    16a5:	0f00                	.insn	2, 0x0f00
    16a7:	149c                	.insn	2, 0x149c
    16a9:	0040                	.insn	2, 0x0040
    16ab:	02a4                	.insn	2, 0x02a4
    16ad:	0000                	.insn	2, 0x0000
    16af:	5201                	.insn	2, 0x5201
    16b1:	011d                	.insn	2, 0x011d
    16b3:	0000                	.insn	2, 0x0000
    16b5:	2901                	.insn	2, 0x2901
    16b7:	03a6                	.insn	2, 0x03a6
    16b9:	0000                	.insn	2, 0x0000
    16bb:	e810                	.insn	2, 0xe810
    16bd:	000e                	.insn	2, 0x000e
    16bf:	1400                	.insn	2, 0x1400
    16c1:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    16c5:	862a                	.insn	2, 0x862a
    16c7:	10000003          	lb	zero,256(zero) # 100 <$d.10+0x8c>
    16cb:	0f11                	.insn	2, 0x0f11
    16cd:	0000                	.insn	2, 0x0000
    16cf:	00a1                	.insn	2, 0x00a1
    16d1:	0000                	.insn	2, 0x0000
    16d3:	2b01                	.insn	2, 0x2b01
    16d5:	055d                	.insn	2, 0x055d
    16d7:	0000                	.insn	2, 0x0000
    16d9:	3a10                	.insn	2, 0x3a10
    16db:	a000000f          	.insn	4, 0xa000000f
    16df:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    16e3:	5d2c                	.insn	2, 0x5d2c
    16e5:	0005                	.insn	2, 0x0005
    16e7:	1200                	.insn	2, 0x1200
    16e9:	0f76                	.insn	2, 0x0f76
    16eb:	0000                	.insn	2, 0x0000
    16ed:	0264                	.insn	2, 0x0264
    16ef:	0000                	.insn	2, 0x0000
    16f1:	3301                	.insn	2, 0x3301
    16f3:	0100                	.insn	2, 0x0100
    16f5:	0000                	.insn	2, 0x0000
    16f7:	0000b517          	auipc	a0,0xb
    16fb:	0100                	.insn	2, 0x0100
    16fd:	4c2e                	.insn	2, 0x4c2e
    16ff:	0005                	.insn	2, 0x0005
    1701:	1300                	.insn	2, 0x1300
    1703:	0112                	.insn	2, 0x0112
    1705:	0000                	.insn	2, 0x0000
    1707:	14f8                	.insn	2, 0x14f8
    1709:	0040                	.insn	2, 0x0040
    170b:	0014                	.insn	2, 0x0014
    170d:	0000                	.insn	2, 0x0000
    170f:	3401                	.insn	2, 0x3401
    1711:	1409                	.insn	2, 0x1409
    1713:	00000f63          	beqz	zero,1731 <$d.5+0x2e0>
    1717:	011e                	.insn	2, 0x011e
    1719:	0000                	.insn	2, 0x0000
    171b:	1500                	.insn	2, 0x1500
    171d:	157c                	.insn	2, 0x157c
    171f:	0040                	.insn	2, 0x0040
    1721:	01c4                	.insn	2, 0x01c4
    1723:	0000                	.insn	2, 0x0000
    1725:	4112                	.insn	2, 0x4112
    1727:	0010                	.insn	2, 0x0010
    1729:	3800                	.insn	2, 0x3800
    172b:	0000                	.insn	2, 0x0000
    172d:	0100                	.insn	2, 0x0100
    172f:	a639                	.insn	2, 0xa639
    1731:	18000003          	lb	zero,384(zero) # 180 <$d.6+0x46>
    1735:	0290                	.insn	2, 0x0290
    1737:	0000                	.insn	2, 0x0000
    1739:	0211                	.insn	2, 0x0211
    173b:	0391                	.insn	2, 0x0391
    173d:	02ce                	.insn	2, 0x02ce
    173f:	0000                	.insn	2, 0x0000
    1741:	4901                	.insn	2, 0x4901
    1743:	0551                	.insn	2, 0x0551
    1745:	0000                	.insn	2, 0x0000
    1747:	c512                	.insn	2, 0xc512
    1749:	2800000f          	.insn	4, 0x2800000f
    174d:	0001                	.insn	2, 0x0001
    174f:	0100                	.insn	2, 0x0100
    1751:	a64a                	.insn	2, 0xa64a
    1753:	17000003          	lb	zero,368(zero) # 170 <$d.6+0x36>
    1757:	0104                	.insn	2, 0x0104
    1759:	0000                	.insn	2, 0x0000
    175b:	3b01                	.insn	2, 0x3b01
    175d:	054c                	.insn	2, 0x054c
    175f:	0000                	.insn	2, 0x0000
    1761:	a818                	.insn	2, 0xa818
    1763:	0002                	.insn	2, 0x0002
    1765:	1200                	.insn	2, 0x1200
    1767:	0f89                	.insn	2, 0x0f89
    1769:	0000                	.insn	2, 0x0000
    176b:	03b1                	.insn	2, 0x03b1
    176d:	0000                	.insn	2, 0x0000
    176f:	5701                	.insn	2, 0x5701
    1771:	03a6                	.insn	2, 0x03a6
    1773:	0000                	.insn	2, 0x0000
    1775:	1500                	.insn	2, 0x1500
    1777:	16e4                	.insn	2, 0x16e4
    1779:	0040                	.insn	2, 0x0040
    177b:	005c                	.insn	2, 0x005c
    177d:	0000                	.insn	2, 0x0000
    177f:	00034a17          	auipc	s4,0x34
    1783:	0100                	.insn	2, 0x0100
    1785:	0061                	.insn	2, 0x0061
    1787:	0001                	.insn	2, 0x0001
    1789:	1700                	.insn	2, 0x1700
    178b:	01a1                	.insn	2, 0x01a1
    178d:	0000                	.insn	2, 0x0000
    178f:	6501                	.insn	2, 0x6501
    1791:	0100                	.insn	2, 0x0100
    1793:	0000                	.insn	2, 0x0000
    1795:	1800                	.insn	2, 0x1800
    1797:	02c8                	.insn	2, 0x02c8
    1799:	0000                	.insn	2, 0x0000
    179b:	8512                	.insn	2, 0x8512
    179d:	0010                	.insn	2, 0x0010
    179f:	b100                	.insn	2, 0xb100
    17a1:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    17a5:	a64d                	.insn	2, 0xa64d
    17a7:	00000003          	lb	zero,0(zero) # 0 <$d.4>
    17ab:	0000                	.insn	2, 0x0000
    17ad:	f116                	.insn	2, 0xf116
    17af:	0001                	.insn	2, 0x0001
    17b1:	e400                	.insn	2, 0xe400
    17b3:	4014                	.insn	2, 0x4014
    17b5:	1600                	.insn	2, 0x1600
    17b7:	0390                	.insn	2, 0x0390
    17b9:	0000                	.insn	2, 0x0000
    17bb:	1520                	.insn	2, 0x1520
    17bd:	0040                	.insn	2, 0x0040
    17bf:	bb16                	.insn	2, 0xbb16
    17c1:	a0000003          	lb	zero,-1536(zero) # fffffa00 <USER_MAX+0xffaffa00>
    17c5:	4015                	.insn	2, 0x4015
    17c7:	0000                	.insn	2, 0x0000
    17c9:	6f19                	.insn	2, 0x6f19
    17cb:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
    17cf:	1a41                	.insn	2, 0x1a41
    17d1:	0386                	.insn	2, 0x0386
    17d3:	0000                	.insn	2, 0x0000
    17d5:	8b1c001b          	.insn	4, 0x8b1c001b
    17d9:	1d000003          	lb	zero,464(zero) # 1d0 <$d.10+0x8>
    17dd:	0000003f 0002a11e 	.insn	8, 0x0002a11e0000003f
    17e5:	0200                	.insn	2, 0x0200
    17e7:	a62c                	.insn	2, 0xa62c
    17e9:	1a000003          	lb	zero,416(zero) # 1a0 <$d.6+0x66>
    17ed:	0100                	.insn	2, 0x0100
    17ef:	0000                	.insn	2, 0x0000
    17f1:	ad1a                	.insn	2, 0xad1a
    17f3:	00000003          	lb	zero,0(zero) # 0 <$d.4>
    17f7:	0105                	.insn	2, 0x0105
    17f9:	0002                	.insn	2, 0x0002
    17fb:	0500                	.insn	2, 0x0500
    17fd:	1f04                	.insn	2, 0x1f04
    17ff:	c919                	.insn	2, 0xc919
    1801:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
    1805:	003f1a33          	sll	s4,t5,gp
    1809:	0000                	.insn	2, 0x0000
    180b:	1e00                	.insn	2, 0x1e00
    180d:	02fe                	.insn	2, 0x02fe
    180f:	0000                	.insn	2, 0x0000
    1811:	3d02                	.insn	2, 0x3d02
    1813:	03a6                	.insn	2, 0x03a6
    1815:	0000                	.insn	2, 0x0000
    1817:	861a                	.insn	2, 0x861a
    1819:	1a000003          	lb	zero,416(zero) # 1a0 <$d.6+0x66>
    181d:	0386                	.insn	2, 0x0386
    181f:	0000                	.insn	2, 0x0000
    1821:	2000                	.insn	2, 0x2000
    1823:	1740                	.insn	2, 0x1740
    1825:	0040                	.insn	2, 0x0040
    1827:	0020                	.insn	2, 0x0020
    1829:	0000                	.insn	2, 0x0000
    182b:	5201                	.insn	2, 0x5201
    182d:	0112                	.insn	2, 0x0112
    182f:	0000                	.insn	2, 0x0000
    1831:	6a14                	.insn	2, 0x6a14
    1833:	0011                	.insn	2, 0x0011
    1835:	1e00                	.insn	2, 0x1e00
    1837:	0001                	.insn	2, 0x0001
    1839:	0000                	.insn	2, 0x0000
    183b:	6021                	.insn	2, 0x6021
    183d:	5c004017          	auipc	zero,0x5c004
    1841:	0002                	.insn	2, 0x0002
    1843:	0100                	.insn	2, 0x0100
    1845:	0d52                	.insn	2, 0x0d52
    1847:	0000                	.insn	2, 0x0000
    1849:	0100                	.insn	2, 0x0100
    184b:	119012af          	.insn	4, 0x119012af
    184f:	0000                	.insn	2, 0x0000
    1851:	0264                	.insn	2, 0x0264
    1853:	0000                	.insn	2, 0x0000
    1855:	b601                	.insn	2, 0xb601
    1857:	0100                	.insn	2, 0x0100
    1859:	0000                	.insn	2, 0x0000
    185b:	0000b517          	auipc	a0,0xb
    185f:	0100                	.insn	2, 0x0100
    1861:	4cb1                	.insn	2, 0x4cb1
    1863:	0005                	.insn	2, 0x0005
    1865:	1300                	.insn	2, 0x1300
    1867:	0112                	.insn	2, 0x0112
    1869:	0000                	.insn	2, 0x0000
    186b:	179c                	.insn	2, 0x179c
    186d:	0040                	.insn	2, 0x0040
    186f:	0014                	.insn	2, 0x0014
    1871:	0000                	.insn	2, 0x0000
    1873:	b701                	.insn	2, 0xb701
    1875:	1409                	.insn	2, 0x1409
    1877:	117d                	.insn	2, 0x117d
    1879:	0000                	.insn	2, 0x0000
    187b:	011e                	.insn	2, 0x011e
    187d:	0000                	.insn	2, 0x0000
    187f:	1500                	.insn	2, 0x1500
    1881:	1814                	.insn	2, 0x1814
    1883:	0040                	.insn	2, 0x0040
    1885:	01a8                	.insn	2, 0x01a8
    1887:	0000                	.insn	2, 0x0000
    1889:	a312                	.insn	2, 0xa312
    188b:	0011                	.insn	2, 0x0011
    188d:	3800                	.insn	2, 0x3800
    188f:	0000                	.insn	2, 0x0000
    1891:	0100                	.insn	2, 0x0100
    1893:	a6bc                	.insn	2, 0xa6bc
    1895:	18000003          	lb	zero,384(zero) # 180 <$d.6+0x46>
    1899:	02e0                	.insn	2, 0x02e0
    189b:	0000                	.insn	2, 0x0000
    189d:	e712                	.insn	2, 0xe712
    189f:	0011                	.insn	2, 0x0011
    18a1:	c600                	.insn	2, 0xc600
    18a3:	0001                	.insn	2, 0x0001
    18a5:	0100                	.insn	2, 0x0100
    18a7:	00e0                	.insn	2, 0x00e0
    18a9:	0001                	.insn	2, 0x0001
    18ab:	1200                	.insn	2, 0x1200
    18ad:	11fa                	.insn	2, 0x11fa
    18af:	0000                	.insn	2, 0x0000
    18b1:	03a0                	.insn	2, 0x03a0
    18b3:	0000                	.insn	2, 0x0000
    18b5:	e301                	.insn	2, 0xe301
    18b7:	0100                	.insn	2, 0x0100
    18b9:	0000                	.insn	2, 0x0000
    18bb:	00010417          	auipc	s0,0x10
    18bf:	0100                	.insn	2, 0x0100
    18c1:	4cbe                	.insn	2, 0x4cbe
    18c3:	0005                	.insn	2, 0x0005
    18c5:	1700                	.insn	2, 0x1700
    18c7:	034a                	.insn	2, 0x034a
    18c9:	0000                	.insn	2, 0x0000
    18cb:	d801                	.insn	2, 0xd801
    18cd:	0100                	.insn	2, 0x0100
    18cf:	0000                	.insn	2, 0x0000
    18d1:	0001a117          	auipc	sp,0x1a
    18d5:	0100                	.insn	2, 0x0100
    18d7:	00dc                	.insn	2, 0x00dc
    18d9:	0001                	.insn	2, 0x0001
    18db:	1800                	.insn	2, 0x1800
    18dd:	02f8                	.insn	2, 0x02f8
    18df:	0000                	.insn	2, 0x0000
    18e1:	0d12                	.insn	2, 0x0d12
    18e3:	0012                	.insn	2, 0x0012
    18e5:	b100                	.insn	2, 0xb100
    18e7:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    18eb:	a6c9                	.insn	2, 0xa6c9
    18ed:	00000003          	lb	zero,0(zero) # 0 <$d.4>
    18f1:	7415                	.insn	2, 0x7415
    18f3:	4019                	.insn	2, 0x4019
    18f5:	4800                	.insn	2, 0x4800
    18f7:	0000                	.insn	2, 0x0000
    18f9:	1200                	.insn	2, 0x1200
    18fb:	12f2                	.insn	2, 0x12f2
    18fd:	0000                	.insn	2, 0x0000
    18ff:	03b1                	.insn	2, 0x03b1
    1901:	0000                	.insn	2, 0x0000
    1903:	d001                	.insn	2, 0xd001
    1905:	03a6                	.insn	2, 0x03a6
    1907:	0000                	.insn	2, 0x0000
    1909:	0000                	.insn	2, 0x0000
    190b:	1600                	.insn	2, 0x1600
    190d:	01f1                	.insn	2, 0x01f1
    190f:	0000                	.insn	2, 0x0000
    1911:	178c                	.insn	2, 0x178c
    1913:	0040                	.insn	2, 0x0040
    1915:	9016                	.insn	2, 0x9016
    1917:	c4000003          	lb	zero,-960(zero) # fffffc40 <USER_MAX+0xffaffc40>
    191b:	16004017          	auipc	zero,0x16004
    191f:	0378                	.insn	2, 0x0378
    1921:	0000                	.insn	2, 0x0000
    1923:	1824                	.insn	2, 0x1824
    1925:	0040                	.insn	2, 0x0040
    1927:	7816                	.insn	2, 0x7816
    1929:	80000003          	lb	zero,-2048(zero) # fffff800 <USER_MAX+0xffaff800>
    192d:	4018                	.insn	2, 0x4018
    192f:	1600                	.insn	2, 0x1600
    1931:	03ae                	.insn	2, 0x03ae
    1933:	0000                	.insn	2, 0x0000
    1935:	18f0                	.insn	2, 0x18f0
    1937:	0040                	.insn	2, 0x0040
    1939:	ae16                	.insn	2, 0xae16
    193b:	00000003          	lb	zero,0(zero) # 0 <$d.4>
    193f:	4019                	.insn	2, 0x4019
    1941:	1600                	.insn	2, 0x1600
    1943:	03ae                	.insn	2, 0x03ae
    1945:	0000                	.insn	2, 0x0000
    1947:	1910                	.insn	2, 0x1910
    1949:	0040                	.insn	2, 0x0040
    194b:	ae16                	.insn	2, 0xae16
    194d:	20000003          	lb	zero,512(zero) # 200 <$d.4+0xe>
    1951:	4019                	.insn	2, 0x4019
    1953:	1600                	.insn	2, 0x1600
    1955:	03ae                	.insn	2, 0x03ae
    1957:	0000                	.insn	2, 0x0000
    1959:	1930                	.insn	2, 0x1930
    195b:	0040                	.insn	2, 0x0040
    195d:	ae16                	.insn	2, 0xae16
    195f:	40000003          	lb	zero,1024(zero) # 400 <$d.6+0x170>
    1963:	4019                	.insn	2, 0x4019
    1965:	1600                	.insn	2, 0x1600
    1967:	03ae                	.insn	2, 0x03ae
    1969:	0000                	.insn	2, 0x0000
    196b:	1950                	.insn	2, 0x1950
    196d:	0040                	.insn	2, 0x0040
    196f:	ae16                	.insn	2, 0xae16
    1971:	60000003          	lb	zero,1536(zero) # 600 <$d.3+0xce>
    1975:	4019                	.insn	2, 0x4019
    1977:	1600                	.insn	2, 0x1600
    1979:	03ae                	.insn	2, 0x03ae
    197b:	0000                	.insn	2, 0x0000
    197d:	1974                	.insn	2, 0x1974
    197f:	0040                	.insn	2, 0x0040
    1981:	ae16                	.insn	2, 0xae16
    1983:	98000003          	lb	zero,-1664(zero) # fffff980 <USER_MAX+0xffaff980>
    1987:	4019                	.insn	2, 0x4019
    1989:	1600                	.insn	2, 0x1600
    198b:	03ae                	.insn	2, 0x03ae
    198d:	0000                	.insn	2, 0x0000
    198f:	19a8                	.insn	2, 0x19a8
    1991:	0040                	.insn	2, 0x0040
    1993:	ae16                	.insn	2, 0xae16
    1995:	b8000003          	lb	zero,-1152(zero) # fffffb80 <USER_MAX+0xffaffb80>
    1999:	4019                	.insn	2, 0x4019
    199b:	0000                	.insn	2, 0x0000
    199d:	911c                	.insn	2, 0x911c
    199f:	0000                	.insn	2, 0x0000
    19a1:	0300                	.insn	2, 0x0300
    19a3:	0000003f 00004604 	.insn	8, 0x46040000003f
    19ab:	0d00                	.insn	2, 0x0d00
    19ad:	1c00                	.insn	2, 0x1c00
    19af:	0100                	.insn	2, 0x0100
    19b1:	0000                	.insn	2, 0x0000
	...

セクション .debug_ranges の逆アセンブル:

00000000 <$d.5>:
   0:	0204                	.insn	2, 0x0204
   2:	0000                	.insn	2, 0x0000
   4:	0310                	.insn	2, 0x0310
   6:	0000                	.insn	2, 0x0000
   8:	0314                	.insn	2, 0x0314
   a:	0000                	.insn	2, 0x0000
   c:	08ec                	.insn	2, 0x08ec
	...
  16:	0000                	.insn	2, 0x0000
  18:	0650                	.insn	2, 0x0650
  1a:	0000                	.insn	2, 0x0000
  1c:	0674                	.insn	2, 0x0674
  1e:	0000                	.insn	2, 0x0000
  20:	0780                	.insn	2, 0x0780
  22:	0000                	.insn	2, 0x0000
  24:	0790                	.insn	2, 0x0790
	...
  2e:	0000                	.insn	2, 0x0000
  30:	060c                	.insn	2, 0x060c
  32:	0000                	.insn	2, 0x0000
  34:	0630                	.insn	2, 0x0630
  36:	0000                	.insn	2, 0x0000
  38:	0678                	.insn	2, 0x0678
  3a:	0000                	.insn	2, 0x0000
  3c:	0688                	.insn	2, 0x0688
	...
  46:	0000                	.insn	2, 0x0000
  48:	05a4                	.insn	2, 0x05a4
  4a:	0000                	.insn	2, 0x0000
  4c:	05ec                	.insn	2, 0x05ec
  4e:	0000                	.insn	2, 0x0000
  50:	0634                	.insn	2, 0x0634
  52:	0000                	.insn	2, 0x0000
  54:	0648                	.insn	2, 0x0648
  56:	0000                	.insn	2, 0x0000
  58:	06b4                	.insn	2, 0x06b4
  5a:	0000                	.insn	2, 0x0000
  5c:	075c                	.insn	2, 0x075c
  5e:	0000                	.insn	2, 0x0000
  60:	07d4                	.insn	2, 0x07d4
  62:	0000                	.insn	2, 0x0000
  64:	0834                	.insn	2, 0x0834
	...
  6e:	0000                	.insn	2, 0x0000
  70:	05ac                	.insn	2, 0x05ac
  72:	0000                	.insn	2, 0x0000
  74:	05ec                	.insn	2, 0x05ec
  76:	0000                	.insn	2, 0x0000
  78:	0644                	.insn	2, 0x0644
  7a:	0000                	.insn	2, 0x0000
  7c:	0648                	.insn	2, 0x0648
  7e:	0000                	.insn	2, 0x0000
  80:	06b4                	.insn	2, 0x06b4
  82:	0000                	.insn	2, 0x0000
  84:	0708                	.insn	2, 0x0708
	...
  8e:	0000                	.insn	2, 0x0000
  90:	06b4                	.insn	2, 0x06b4
  92:	0000                	.insn	2, 0x0000
  94:	06c0                	.insn	2, 0x06c0
  96:	0000                	.insn	2, 0x0000
  98:	06c4                	.insn	2, 0x06c4
  9a:	0000                	.insn	2, 0x0000
  9c:	06d0                	.insn	2, 0x06d0
  9e:	0000                	.insn	2, 0x0000
  a0:	06d8                	.insn	2, 0x06d8
  a2:	0000                	.insn	2, 0x0000
  a4:	0708                	.insn	2, 0x0708
	...
  ae:	0000                	.insn	2, 0x0000
  b0:	0714                	.insn	2, 0x0714
  b2:	0000                	.insn	2, 0x0000
  b4:	075c                	.insn	2, 0x075c
  b6:	0000                	.insn	2, 0x0000
  b8:	07d4                	.insn	2, 0x07d4
  ba:	0000                	.insn	2, 0x0000
  bc:	0828                	.insn	2, 0x0828
	...
  c6:	0000                	.insn	2, 0x0000
  c8:	07d4                	.insn	2, 0x07d4
  ca:	0000                	.insn	2, 0x0000
  cc:	07e0                	.insn	2, 0x07e0
  ce:	0000                	.insn	2, 0x0000
  d0:	07e4                	.insn	2, 0x07e4
  d2:	0000                	.insn	2, 0x0000
  d4:	07f0                	.insn	2, 0x07f0
  d6:	0000                	.insn	2, 0x0000
  d8:	07f8                	.insn	2, 0x07f8
  da:	0000                	.insn	2, 0x0000
  dc:	0828                	.insn	2, 0x0828
	...
  e6:	0000                	.insn	2, 0x0000
  e8:	02d8                	.insn	2, 0x02d8
  ea:	0000                	.insn	2, 0x0000
  ec:	0310                	.insn	2, 0x0310
  ee:	0000                	.insn	2, 0x0000
  f0:	0314                	.insn	2, 0x0314
  f2:	0000                	.insn	2, 0x0000
  f4:	03d8                	.insn	2, 0x03d8
  f6:	0000                	.insn	2, 0x0000
  f8:	05ec                	.insn	2, 0x05ec
  fa:	0000                	.insn	2, 0x0000
  fc:	060c                	.insn	2, 0x060c
	...
 106:	0000                	.insn	2, 0x0000
 108:	094c                	.insn	2, 0x094c
 10a:	0000                	.insn	2, 0x0000
 10c:	0964                	.insn	2, 0x0964
 10e:	0000                	.insn	2, 0x0000
 110:	0968                	.insn	2, 0x0968
 112:	0000                	.insn	2, 0x0000
 114:	0974                	.insn	2, 0x0974
 116:	0000                	.insn	2, 0x0000
 118:	097c                	.insn	2, 0x097c
 11a:	0000                	.insn	2, 0x0000
 11c:	09ac                	.insn	2, 0x09ac
	...

00000128 <$d.6>:
 128:	0b30                	.insn	2, 0x0b30
 12a:	0040                	.insn	2, 0x0040
 12c:	0b50                	.insn	2, 0x0b50
 12e:	0040                	.insn	2, 0x0040
 130:	0be0                	.insn	2, 0x0be0
 132:	0040                	.insn	2, 0x0040
 134:	0c00                	.insn	2, 0x0c00
 136:	0040                	.insn	2, 0x0040
	...
 140:	0b50                	.insn	2, 0x0b50
 142:	0040                	.insn	2, 0x0040
 144:	0b60                	.insn	2, 0x0b60
 146:	0040                	.insn	2, 0x0040
 148:	0c00                	.insn	2, 0x0c00
 14a:	0040                	.insn	2, 0x0040
 14c:	0c10                	.insn	2, 0x0c10
 14e:	0040                	.insn	2, 0x0040
	...
 158:	0b60                	.insn	2, 0x0b60
 15a:	0040                	.insn	2, 0x0040
 15c:	0b6c                	.insn	2, 0x0b6c
 15e:	0040                	.insn	2, 0x0040
 160:	0c10                	.insn	2, 0x0c10
 162:	0040                	.insn	2, 0x0040
 164:	0c1c                	.insn	2, 0x0c1c
 166:	0040                	.insn	2, 0x0040
	...
 170:	0c20                	.insn	2, 0x0c20
 172:	0040                	.insn	2, 0x0040
 174:	0c30                	.insn	2, 0x0c30
 176:	0040                	.insn	2, 0x0040
 178:	0ce4                	.insn	2, 0x0ce4
 17a:	0040                	.insn	2, 0x0040
 17c:	0cf4                	.insn	2, 0x0cf4
 17e:	0040                	.insn	2, 0x0040
	...
 188:	0c30                	.insn	2, 0x0c30
 18a:	0040                	.insn	2, 0x0040
 18c:	0c3c                	.insn	2, 0x0c3c
 18e:	0040                	.insn	2, 0x0040
 190:	0cf4                	.insn	2, 0x0cf4
 192:	0040                	.insn	2, 0x0040
 194:	0d00                	.insn	2, 0x0d00
 196:	0040                	.insn	2, 0x0040
	...
 1a0:	0c3c                	.insn	2, 0x0c3c
 1a2:	0040                	.insn	2, 0x0040
 1a4:	0c48                	.insn	2, 0x0c48
 1a6:	0040                	.insn	2, 0x0040
 1a8:	0d00                	.insn	2, 0x0d00
 1aa:	0040                	.insn	2, 0x0040
 1ac:	0d0c                	.insn	2, 0x0d0c
 1ae:	0040                	.insn	2, 0x0040
	...
 1b8:	0cb4                	.insn	2, 0x0cb4
 1ba:	0040                	.insn	2, 0x0040
 1bc:	0cc4                	.insn	2, 0x0cc4
 1be:	0040                	.insn	2, 0x0040
 1c0:	0d10                	.insn	2, 0x0d10
 1c2:	0040                	.insn	2, 0x0040
 1c4:	0d20                	.insn	2, 0x0d20
 1c6:	0040                	.insn	2, 0x0040
	...
 1d0:	0cc4                	.insn	2, 0x0cc4
 1d2:	0040                	.insn	2, 0x0040
 1d4:	0cd0                	.insn	2, 0x0cd0
 1d6:	0040                	.insn	2, 0x0040
 1d8:	0d20                	.insn	2, 0x0d20
 1da:	0040                	.insn	2, 0x0040
 1dc:	0d2c                	.insn	2, 0x0d2c
 1de:	0040                	.insn	2, 0x0040
	...
 1e8:	0cd0                	.insn	2, 0x0cd0
 1ea:	0040                	.insn	2, 0x0040
 1ec:	0ce0                	.insn	2, 0x0ce0
 1ee:	0040                	.insn	2, 0x0040
 1f0:	0d2c                	.insn	2, 0x0d2c
 1f2:	0040                	.insn	2, 0x0040
 1f4:	0d38                	.insn	2, 0x0d38
 1f6:	0040                	.insn	2, 0x0040
	...
 200:	0f34                	.insn	2, 0x0f34
 202:	0040                	.insn	2, 0x0040
 204:	0f58                	.insn	2, 0x0f58
 206:	0040                	.insn	2, 0x0040
 208:	10a4                	.insn	2, 0x10a4
 20a:	0040                	.insn	2, 0x0040
 20c:	1108                	.insn	2, 0x1108
 20e:	0040                	.insn	2, 0x0040
	...
 218:	0f84                	.insn	2, 0x0f84
 21a:	0040                	.insn	2, 0x0040
 21c:	0f90                	.insn	2, 0x0f90
 21e:	0040                	.insn	2, 0x0040
 220:	0fa0                	.insn	2, 0x0fa0
 222:	0040                	.insn	2, 0x0040
 224:	0fac                	.insn	2, 0x0fac
 226:	0040                	.insn	2, 0x0040
 228:	0fbc                	.insn	2, 0x0fbc
 22a:	0040                	.insn	2, 0x0040
 22c:	0fc8                	.insn	2, 0x0fc8
 22e:	0040                	.insn	2, 0x0040
 230:	0fd8                	.insn	2, 0x0fd8
 232:	0040                	.insn	2, 0x0040
 234:	0fe4                	.insn	2, 0x0fe4
 236:	0040                	.insn	2, 0x0040
 238:	0ff4                	.insn	2, 0x0ff4
 23a:	0040                	.insn	2, 0x0040
 23c:	1000                	.insn	2, 0x1000
 23e:	0040                	.insn	2, 0x0040
 240:	1010                	.insn	2, 0x1010
 242:	0040                	.insn	2, 0x0040
 244:	101c                	.insn	2, 0x101c
 246:	0040                	.insn	2, 0x0040
 248:	102c                	.insn	2, 0x102c
 24a:	0040                	.insn	2, 0x0040
 24c:	1038                	.insn	2, 0x1038
 24e:	0040                	.insn	2, 0x0040
 250:	1044                	.insn	2, 0x1044
 252:	0040                	.insn	2, 0x0040
 254:	1050                	.insn	2, 0x1050
 256:	0040                	.insn	2, 0x0040
	...
 260:	1178                	.insn	2, 0x1178
 262:	0040                	.insn	2, 0x0040
 264:	11c4                	.insn	2, 0x11c4
 266:	0040                	.insn	2, 0x0040
 268:	11c8                	.insn	2, 0x11c8
 26a:	0040                	.insn	2, 0x0040
 26c:	11d0                	.insn	2, 0x11d0
 26e:	0040                	.insn	2, 0x0040
	...
 278:	0a90                	.insn	2, 0x0a90
 27a:	0040                	.insn	2, 0x0040
 27c:	1288                	.insn	2, 0x1288
 27e:	0040                	.insn	2, 0x0040
 280:	0000                	.insn	2, 0x0000
 282:	0040                	.insn	2, 0x0040
 284:	001c                	.insn	2, 0x001c
 286:	0040                	.insn	2, 0x0040
	...

00000290 <$d.6>:
 290:	02f4                	.insn	2, 0x02f4
 292:	0000                	.insn	2, 0x0000
 294:	031c                	.insn	2, 0x031c
 296:	0000                	.insn	2, 0x0000
 298:	0328                	.insn	2, 0x0328
 29a:	0000                	.insn	2, 0x0000
 29c:	04b8                	.insn	2, 0x04b8
	...
 2a6:	0000                	.insn	2, 0x0000
 2a8:	02f4                	.insn	2, 0x02f4
 2aa:	0000                	.insn	2, 0x0000
 2ac:	0300                	.insn	2, 0x0300
 2ae:	0000                	.insn	2, 0x0000
 2b0:	0420                	.insn	2, 0x0420
 2b2:	0000                	.insn	2, 0x0000
 2b4:	0424                	.insn	2, 0x0424
 2b6:	0000                	.insn	2, 0x0000
 2b8:	042c                	.insn	2, 0x042c
 2ba:	0000                	.insn	2, 0x0000
 2bc:	0450                	.insn	2, 0x0450
	...
 2c6:	0000                	.insn	2, 0x0000
 2c8:	033c                	.insn	2, 0x033c
 2ca:	0000                	.insn	2, 0x0000
 2cc:	039c                	.insn	2, 0x039c
 2ce:	0000                	.insn	2, 0x0000
 2d0:	03a8                	.insn	2, 0x03a8
 2d2:	0000                	.insn	2, 0x0000
 2d4:	0418                	.insn	2, 0x0418
	...
 2de:	0000                	.insn	2, 0x0000
 2e0:	058c                	.insn	2, 0x058c
 2e2:	0000                	.insn	2, 0x0000
 2e4:	05f8                	.insn	2, 0x05f8
 2e6:	0000                	.insn	2, 0x0000
 2e8:	0604                	.insn	2, 0x0604
 2ea:	0000                	.insn	2, 0x0000
 2ec:	0734                	.insn	2, 0x0734
	...
 2f6:	0000                	.insn	2, 0x0000
 2f8:	0618                	.insn	2, 0x0618
 2fa:	0000                	.insn	2, 0x0000
 2fc:	0654                	.insn	2, 0x0654
 2fe:	0000                	.insn	2, 0x0000
 300:	0660                	.insn	2, 0x0660
 302:	0000                	.insn	2, 0x0000
 304:	06d8                	.insn	2, 0x06d8
	...

セクション .debug_str の逆アセンブル:

00000000 <$d.6-0x13a>:
   0:	615f6473          	csrrsi	s0,htimedeltah,30
   4:	6970                	.insn	2, 0x6970
   6:	7300                	.insn	2, 0x7300
   8:	6174                	.insn	2, 0x6174
   a:	7472                	.insn	2, 0x7472
   c:	6600                	.insn	2, 0x6600
   e:	7461                	.insn	2, 0x7461
  10:	6c5f3233          	.insn	4, 0x6c5f3233
  14:	61660073          	.insn	4, 0x61660073
  18:	3374                	.insn	2, 0x3374
  1a:	5f32                	.insn	2, 0x5f32
  1c:	00746163          	bltu	s0,t2,1e <$d.1+0x1e>
  20:	5f646d63          	bltu	s0,s6,61a <$d.3+0xe8>
  24:	7270                	.insn	2, 0x7270
  26:	6d69                	.insn	2, 0x6d69
  28:	7365                	.insn	2, 0x7365
  2a:	6c00                	.insn	2, 0x6c00
  2c:	6e65                	.insn	2, 0x6e65
  2e:	6d00                	.insn	2, 0x6d00
  30:	7461                	.insn	2, 0x7461
  32:	6972                	.insn	2, 0x6972
  34:	5f78                	.insn	2, 0x5f78
  36:	00690043          	.insn	4, 0x00690043
  3a:	7364                	.insn	2, 0x7364
  3c:	0074                	.insn	2, 0x0074
  3e:	6e756f63          	bltu	a0,t2,73c <$d.3+0x20a>
  42:	0074                	.insn	2, 0x0074
  44:	70007773          	csrrci	a4,0x700,0
  48:	6100                	.insn	2, 0x6100
  4a:	6464                	.insn	2, 0x6464
  4c:	0072                	.insn	2, 0x0072
  4e:	616d                	.insn	2, 0x616d
  50:	7274                	.insn	2, 0x7274
  52:	7869                	.insn	2, 0x7869
  54:	6d5f 7861 6100      	.insn	6, 0x610078616d5f
  5a:	616d0033          	.insn	4, 0x616d0033
  5e:	7274                	.insn	2, 0x7274
  60:	7869                	.insn	2, 0x7869
  62:	415f 6d00 7461      	.insn	6, 0x74616d00415f
  68:	6972                	.insn	2, 0x6972
  6a:	5f78                	.insn	2, 0x5f78
  6c:	657a6973          	csrrsi	s2,hviprio2h,20
  70:	7000                	.insn	2, 0x7000
  72:	6f72                	.insn	2, 0x6f72
  74:	706d                	.insn	2, 0x706d
  76:	0074                	.insn	2, 0x0074
  78:	006e                	.insn	2, 0x006e
  7a:	0074756f          	jal	a0,47880 <$d.5+0x4642f>
  7e:	6975                	.insn	2, 0x6975
  80:	746e                	.insn	2, 0x746e
  82:	7470                	.insn	2, 0x7470
  84:	5f72                	.insn	2, 0x5f72
  86:	0074                	.insn	2, 0x0074
  88:	6166                	.insn	2, 0x6166
  8a:	3374                	.insn	2, 0x3374
  8c:	5f32                	.insn	2, 0x5f32
  8e:	6f6d                	.insn	2, 0x6f6d
  90:	6e75                	.insn	2, 0x6e75
  92:	0074                	.insn	2, 0x0074
  94:	6f72                	.insn	2, 0x6f72
  96:	635f746f          	jal	s0,f7eca <$d.5+0xf6a79>
  9a:	756c                	.insn	2, 0x756c
  9c:	72657473          	csrrci	s0,mhpmevent6h,10
  a0:	6300                	.insn	2, 0x6300
  a2:	756c                	.insn	2, 0x756c
  a4:	72657473          	csrrci	s0,mhpmevent6h,10
  a8:	6c00                	.insn	2, 0x6c00
  aa:	6162                	.insn	2, 0x6162
  ac:	6200                	.insn	2, 0x6200
  ae:	006c6f6f          	jal	t5,c60b4 <$d.5+0xc4c63>
  b2:	3261                	.insn	2, 0x3261
  b4:	6200                	.insn	2, 0x6200
  b6:	6675                	.insn	2, 0x6675
  b8:	6400                	.insn	2, 0x6400
  ba:	7461                	.insn	2, 0x7461
  bc:	5f61                	.insn	2, 0x5f61
  be:	6562                	.insn	2, 0x6562
  c0:	006e6967          	.insn	4, 0x006e6967
  c4:	0076                	.insn	2, 0x0076
  c6:	6c6c6163          	bltu	s8,t1,788 <$d.3+0x256>
  ca:	735f 5f64 6572      	.insn	6, 0x65725f64735f
  d0:	6461                	.insn	2, 0x6461
  d2:	615f 6970 7300      	.insn	6, 0x73006970615f
  d8:	6372                	.insn	2, 0x6372
  da:	6573752f          	.insn	4, 0x6573752f
  de:	2e72                	.insn	2, 0x2e72
  e0:	72700063          	beq	zero,t2,800 <$d.3+0x2ce>
  e4:	6e69                	.insn	2, 0x6e69
  e6:	5f74                	.insn	2, 0x5f74
  e8:	6e69                	.insn	2, 0x6e69
  ea:	0074                	.insn	2, 0x0074
  ec:	7564                	.insn	2, 0x7564
  ee:	706d                	.insn	2, 0x706d
  f0:	615f 6970 6300      	.insn	6, 0x63006970615f
  f6:	756c                	.insn	2, 0x756c
  f8:	72657473          	csrrci	s0,mhpmevent6h,10
  fc:	745f 5f6f 626c      	.insn	6, 0x626c5f6f745f
 102:	0061                	.insn	2, 0x0061
 104:	0065                	.insn	2, 0x0065
 106:	6d630063          	beq	t1,s6,7c6 <$d.3+0x294>
 10a:	6c64                	.insn	2, 0x6c64
 10c:	6e69                	.insn	2, 0x6e69
 10e:	0065                	.insn	2, 0x0065
 110:	696d                	.insn	2, 0x696d
 112:	70615f63          	bge	sp,t1,830 <$d.3+0x2fe>
 116:	0069                	.insn	2, 0x0069
 118:	73003173          	csrrc	sp,mhpmevent16h,zero
 11c:	6600                	.insn	2, 0x6600
 11e:	7461                	.insn	2, 0x7461
 120:	665f3233          	.insn	4, 0x665f3233
 124:	6e69                	.insn	2, 0x6e69
 126:	0064                	.insn	2, 0x0064
 128:	696e006b          	.insn	4, 0x696e006b
 12c:	6262                	.insn	2, 0x6262
 12e:	656c                	.insn	2, 0x656c
 130:	7000                	.insn	2, 0x7000
 132:	7261                	.insn	2, 0x7261
 134:	5f74                	.insn	2, 0x5f74
 136:	626c                	.insn	2, 0x626c
 138:	0061                	.insn	2, 0x0061

0000013a <$d.6>:
 13a:	6255                	.insn	2, 0x6255
 13c:	6e75                	.insn	2, 0x6e75
 13e:	7574                	.insn	2, 0x7574
 140:	6320                	.insn	2, 0x6320
 142:	616c                	.insn	2, 0x616c
 144:	676e                	.insn	2, 0x676e
 146:	7620                	.insn	2, 0x7620
 148:	7265                	.insn	2, 0x7265
 14a:	6e6f6973          	csrrsi	s2,0x6e6,30
 14e:	3120                	.insn	2, 0x3120
 150:	2e38                	.insn	2, 0x2e38
 152:	2e31                	.insn	2, 0x2e31
 154:	31282033          	.insn	4, 0x31282033
 158:	6275                	.insn	2, 0x6275
 15a:	6e75                	.insn	2, 0x6e75
 15c:	7574                	.insn	2, 0x7574
 15e:	2931                	.insn	2, 0x2931
 160:	6d00                	.insn	2, 0x6d00
 162:	7861                	.insn	2, 0x7861
 164:	7200                	.insn	2, 0x7200
 166:	7465                	.insn	2, 0x7465
 168:	7300                	.insn	2, 0x7300
 16a:	7274                	.insn	2, 0x7274
 16c:	00797063          	bgeu	s2,t2,16c <$d.6+0x32>
 170:	6162                	.insn	2, 0x6162
 172:	73006573          	csrrsi	a0,mhpmevent16h,0
 176:	6372                	.insn	2, 0x6372
 178:	7461662f          	.insn	4, 0x7461662f
 17c:	632e3233          	.insn	4, 0x632e3233
 180:	6700                	.insn	2, 0x6700
 182:	665f 7461 3233      	.insn	6, 0x32337461665f
 188:	6300                	.insn	2, 0x6300
 18a:	6c61                	.insn	2, 0x6c61
 18c:	5f6c                	.insn	2, 0x5f6c
 18e:	7564                	.insn	2, 0x7564
 190:	706d                	.insn	2, 0x706d
 192:	615f 6970 6600      	.insn	6, 0x66006970615f
 198:	7461                	.insn	2, 0x7461
 19a:	625f3233          	.insn	4, 0x625f3233
 19e:	6675                	.insn	2, 0x6675
 1a0:	6300                	.insn	2, 0x6300
 1a2:	5f6c                	.insn	2, 0x5f6c
 1a4:	6f6c                	.insn	2, 0x6f6c
 1a6:	7500                	.insn	2, 0x7500
 1a8:	6e69                	.insn	2, 0x6e69
 1aa:	3374                	.insn	2, 0x3374
 1ac:	5f32                	.insn	2, 0x5f32
 1ae:	0074                	.insn	2, 0x0074
 1b0:	6166                	.insn	2, 0x6166
 1b2:	3374                	.insn	2, 0x3374
 1b4:	5f32                	.insn	2, 0x5f32
 1b6:	6e69                	.insn	2, 0x6e69
 1b8:	6f66                	.insn	2, 0x6f66
 1ba:	745f 7200 7365      	.insn	6, 0x73657200745f
 1c0:	7265                	.insn	2, 0x7265
 1c2:	6576                	.insn	2, 0x6576
 1c4:	0064                	.insn	2, 0x0064
 1c6:	73006c63          	bltu	zero,a6,8fe <$d.3+0x3cc>
 1ca:	6372                	.insn	2, 0x6372
 1cc:	6568732f          	.insn	4, 0x6568732f
 1d0:	6c6c                	.insn	2, 0x6c6c
 1d2:	632e                	.insn	2, 0x632e
 1d4:	7300                	.insn	2, 0x7300
 1d6:	7379                	.insn	2, 0x7379
 1d8:	6f6e                	.insn	2, 0x6f6e
 1da:	7300                	.insn	2, 0x7300
 1dc:	6372                	.insn	2, 0x6372
 1de:	6d00                	.insn	2, 0x6d00
 1e0:	6961                	.insn	2, 0x6961
 1e2:	006e                	.insn	2, 0x006e
 1e4:	6e75                	.insn	2, 0x6e75
 1e6:	6e676973          	csrrsi	s2,0x6e6,14
 1ea:	6465                	.insn	2, 0x6465
 1ec:	6320                	.insn	2, 0x6320
 1ee:	6168                	.insn	2, 0x6168
 1f0:	0072                	.insn	2, 0x0072
 1f2:	6166                	.insn	2, 0x6166
 1f4:	5f74                	.insn	2, 0x5f74
 1f6:	6562                	.insn	2, 0x6562
 1f8:	006e6967          	.insn	4, 0x006e6967
 1fc:	72616863          	bltu	sp,t1,92c <$d.11+0x1b>
 200:	6900                	.insn	2, 0x6900
 202:	746e                	.insn	2, 0x746e
 204:	6100                	.insn	2, 0x6100
 206:	6772                	.insn	2, 0x6772
 208:	0076                	.insn	2, 0x0076
 20a:	5f327773          	csrrci	a4,0x5f3,4
 20e:	7270                	.insn	2, 0x7270
 210:	7365                	.insn	2, 0x7365
 212:	00646573          	csrrsi	a0,0x6,8
 216:	615f6173          	csrrsi	sp,htimedeltah,30
 21a:	6970                	.insn	2, 0x6970
 21c:	2f00                	.insn	2, 0x2f00
 21e:	6f68                	.insn	2, 0x6f68
 220:	656d                	.insn	2, 0x656d
 222:	7261682f          	.insn	4, 0x7261682f
 226:	6875                	.insn	2, 0x6875
 228:	6b69                	.insn	2, 0x6b69
 22a:	72502f6f          	jal	t5,314e <$d.5+0x1cfd>
 22e:	6172676f          	jal	a4,27044 <$d.5+0x25bf3>
 232:	2f6d                	.insn	2, 0x2f6d
 234:	5350                	.insn	2, 0x5350
 236:	56525f43          	.insn	4, 0x56525f43
 23a:	2f493233          	.insn	4, 0x2f493233
 23e:	5350                	.insn	2, 0x5350
 240:	4e4f2d43          	.insn	4, 0x4e4f2d43
 244:	2f45                	.insn	2, 0x2f45
 246:	74666f73          	csrrsi	t5,0x746,12
 24a:	65726177          	.insn	4, 0x65726177
 24e:	00736f2f          	.insn	4, 0x00736f2f
 252:	7369                	.insn	2, 0x7369
 254:	705f 6972 656d      	.insn	6, 0x656d6972705f
 25a:	6600                	.insn	2, 0x6600
 25c:	7461                	.insn	2, 0x7461
 25e:	735f 7a69 0065      	.insn	6, 0x00657a69735f
 264:	6f72                	.insn	2, 0x6f72
 266:	6c5f746f          	jal	s0,f812a <$d.5+0xf6cd9>
 26a:	6162                	.insn	2, 0x6162
 26c:	6300                	.insn	2, 0x6300
 26e:	6c61                	.insn	2, 0x6c61
 270:	5f6c                	.insn	2, 0x5f6c
 272:	696d                	.insn	2, 0x696d
 274:	70615f63          	bge	sp,t1,992 <$d.5+0x48>
 278:	0069                	.insn	2, 0x0069
 27a:	6176                	.insn	2, 0x6176
 27c:	756c                	.insn	2, 0x756c
 27e:	0065                	.insn	2, 0x0065
 280:	6c6c6163          	bltu	s8,t1,942 <$d.11+0x31>
 284:	735f 5f64 7277      	.insn	6, 0x72775f64735f
 28a:	7469                	.insn	2, 0x7469
 28c:	5f65                	.insn	2, 0x5f65
 28e:	7061                	.insn	2, 0x7061
 290:	0069                	.insn	2, 0x0069
 292:	6176                	.insn	2, 0x6176
 294:	006c                	.insn	2, 0x006c
 296:	63737973          	csrrci	s2,0x637,6
 29a:	6c61                	.insn	2, 0x6c61
 29c:	006c                	.insn	2, 0x006c
 29e:	3061                	.insn	2, 0x3061
 2a0:	6300                	.insn	2, 0x6300
 2a2:	6c61                	.insn	2, 0x6c61
 2a4:	5f6c                	.insn	2, 0x5f6c
 2a6:	725f6473          	csrrsi	s0,mhpmevent5h,30
 2aa:	6165                	.insn	2, 0x6165
 2ac:	5f64                	.insn	2, 0x5f64
 2ae:	7562                	.insn	2, 0x7562
 2b0:	5f66                	.insn	2, 0x5f66
 2b2:	7061                	.insn	2, 0x7061
 2b4:	0069                	.insn	2, 0x0069
 2b6:	6e75                	.insn	2, 0x6e75
 2b8:	6e676973          	csrrsi	s2,0x6e6,14
 2bc:	6465                	.insn	2, 0x6465
 2be:	6920                	.insn	2, 0x6920
 2c0:	746e                	.insn	2, 0x746e
 2c2:	6100                	.insn	2, 0x6100
 2c4:	6772                	.insn	2, 0x6772
 2c6:	34610063          	beq	sp,t1,606 <$d.3+0xd4>
 2ca:	7300                	.insn	2, 0x7300
 2cc:	0032                	.insn	2, 0x0032
 2ce:	726f6873          	csrrsi	a6,mhpmevent6h,30
 2d2:	6e74                	.insn	2, 0x6e74
 2d4:	6d61                	.insn	2, 0x6d61
 2d6:	0065                	.insn	2, 0x0065
 2d8:	63746567          	.insn	4, 0x63746567
 2dc:	6168                	.insn	2, 0x6168
 2de:	0072                	.insn	2, 0x0072
 2e0:	5f5f 5241 4152      	.insn	6, 0x415252415f5f
 2e6:	5f59                	.insn	2, 0x5f59
 2e8:	455a4953          	.insn	4, 0x455a4953
 2ec:	545f 5059 5f45      	.insn	6, 0x5f455059545f
 2f2:	005f 6170 7372      	.insn	6, 0x73726170005f
 2f8:	5f65                	.insn	2, 0x5f65
 2fa:	6568                	.insn	2, 0x6568
 2fc:	0078                	.insn	2, 0x0078
 2fe:	63727473          	csrrci	s0,0x637,4
 302:	706d                	.insn	2, 0x706d
 304:	6300                	.insn	2, 0x6300
 306:	6c61                	.insn	2, 0x6c61
 308:	5f6c                	.insn	2, 0x5f6c
 30a:	615f6173          	csrrsi	sp,htimedeltah,30
 30e:	6970                	.insn	2, 0x6970
 310:	6100                	.insn	2, 0x6100
 312:	0031                	.insn	2, 0x0031
 314:	616e                	.insn	2, 0x616e
 316:	656d                	.insn	2, 0x656d
 318:	6400                	.insn	2, 0x6400
 31a:	7500                	.insn	2, 0x7500
 31c:	6e69                	.insn	2, 0x6e69
 31e:	3874                	.insn	2, 0x3874
 320:	745f 5f00 625f      	.insn	6, 0x625f5f00745f
 326:	6975                	.insn	2, 0x6975
 328:	746c                	.insn	2, 0x746c
 32a:	6e69                	.insn	2, 0x6e69
 32c:	765f 5f61 696c      	.insn	6, 0x696c5f61765f
 332:	70007473          	csrrci	s0,0x700,0
 336:	6572                	.insn	2, 0x6572
 338:	5f76                	.insn	2, 0x5f76
 33a:	6d007773          	csrrci	a4,0x6d0,0
 33e:	7461                	.insn	2, 0x7461
 340:	6972                	.insn	2, 0x6972
 342:	5f78                	.insn	2, 0x5f78
 344:	0042                	.insn	2, 0x0042
 346:	6e65                	.insn	2, 0x6e65
 348:	0064                	.insn	2, 0x0064
 34a:	685f6c63          	bltu	t5,t0,9e2 <$d.5+0x98>
 34e:	0069                	.insn	2, 0x0069
 350:	6f70                	.insn	2, 0x6f70
 352:	6c6c                	.insn	2, 0x6c6c
 354:	735f 6977 6374      	.insn	6, 0x63746977735f
 35a:	5f68                	.insn	2, 0x5f68
 35c:	7061                	.insn	2, 0x7061
 35e:	0069                	.insn	2, 0x0069
 360:	7261                	.insn	2, 0x7261
 362:	66003067          	.insn	4, 0x66003067
 366:	7461                	.insn	2, 0x7461
 368:	635f 756f 746e      	.insn	6, 0x746e756f635f
 36e:	7000                	.insn	2, 0x7000
 370:	6972                	.insn	2, 0x6972
 372:	746e                	.insn	2, 0x746e
 374:	0066                	.insn	2, 0x0066
 376:	735f6473          	csrrsi	s0,mhpmevent21h,30
 37a:	6365                	.insn	2, 0x6365
 37c:	6f74                	.insn	2, 0x6f74
 37e:	0072                	.insn	2, 0x0072
 380:	74636573          	csrrsi	a0,0x746,6
 384:	6600726f          	jal	tp,79e4 <$d.5+0x6593>
 388:	746d                	.insn	2, 0x746d
 38a:	6700                	.insn	2, 0x6700
 38c:	7465                	.insn	2, 0x7465
 38e:	72616863          	bltu	sp,t1,abe <$d.5+0x174>
 392:	745f 6d69 6f65      	.insn	6, 0x6f656d69745f
 398:	7475                	.insn	2, 0x7475
 39a:	6100                	.insn	2, 0x6100
 39c:	6772                	.insn	2, 0x6772
 39e:	0032                	.insn	2, 0x0032
 3a0:	657a6973          	csrrsi	s2,hviprio2h,20
 3a4:	7300                	.insn	2, 0x7300
 3a6:	705f3177          	.insn	4, 0x705f3177
 3aa:	6572                	.insn	2, 0x6572
 3ac:	64657373          	csrrci	t1,hviprio1,10
 3b0:	6a00                	.insn	2, 0x6a00
 3b2:	7500                	.insn	2, 0x7500
 3b4:	7300                	.insn	2, 0x7300
 3b6:	6365                	.insn	2, 0x6365
 3b8:	6f74                	.insn	2, 0x6f74
 3ba:	7372                	.insn	2, 0x7372
 3bc:	705f 7265 635f      	.insn	6, 0x635f7265705f
 3c2:	756c                	.insn	2, 0x756c
 3c4:	72657473          	csrrci	s0,mhpmevent6h,10
 3c8:	7000                	.insn	2, 0x7000
 3ca:	7475                	.insn	2, 0x7475
 3cc:	72616863          	bltu	sp,t1,afc <$d.5+0x1b2>
 3d0:	7000                	.insn	2, 0x7000
 3d2:	7261                	.insn	2, 0x7261
 3d4:	755f6573          	csrrsi	a0,0x755,30
 3d8:	65003233          	.insn	4, 0x65003233
 3dc:	6978                	.insn	2, 0x6978
 3de:	0074                	.insn	2, 0x0074
 3e0:	61006863          	bltu	zero,a6,9f0 <$d.5+0xa6>
 3e4:	6772                	.insn	2, 0x6772
 3e6:	0031                	.insn	2, 0x0031
 3e8:	6176                	.insn	2, 0x6176
 3ea:	6772                	.insn	2, 0x6772
 3ec:	0073                	.short	0x0073

セクション .comment の逆アセンブル:

00000000 <$d.1>:
   0:	5500                	.insn	2, 0x5500
   2:	7562                	.insn	2, 0x7562
   4:	746e                	.insn	2, 0x746e
   6:	2075                	.insn	2, 0x2075
   8:	6e616c63          	bltu	sp,t1,700 <$d.3+0x1ce>
   c:	65762067          	.insn	4, 0x65762067
  10:	7372                	.insn	2, 0x7372
  12:	6f69                	.insn	2, 0x6f69
  14:	206e                	.insn	2, 0x206e
  16:	3831                	.insn	2, 0x3831
  18:	312e                	.insn	2, 0x312e
  1a:	332e                	.insn	2, 0x332e
  1c:	2820                	.insn	2, 0x2820
  1e:	7531                	.insn	2, 0x7531
  20:	7562                	.insn	2, 0x7562
  22:	746e                	.insn	2, 0x746e
  24:	3175                	.insn	2, 0x3175
  26:	0029                	.insn	2, 0x0029
  28:	694c                	.insn	2, 0x694c
  2a:	6b6e                	.insn	2, 0x6b6e
  2c:	7265                	.insn	2, 0x7265
  2e:	203a                	.insn	2, 0x203a
  30:	6255                	.insn	2, 0x6255
  32:	6e75                	.insn	2, 0x6e75
  34:	7574                	.insn	2, 0x7574
  36:	4c20                	.insn	2, 0x4c20
  38:	444c                	.insn	2, 0x444c
  3a:	3120                	.insn	2, 0x3120
  3c:	2e38                	.insn	2, 0x2e38
  3e:	2e31                	.insn	2, 0x2e31
  40:	0033                	.short	0x0033

セクション .riscv.attributes の逆アセンブル:

00000000 <.riscv.attributes>:
   0:	3941                	.insn	2, 0x3941
   2:	0000                	.insn	2, 0x0000
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <$d.1+0x14>
   c:	0000002f          	.insn	4, 0x002f
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	.insn	2, 0x5f31
  1c:	697a                	.insn	2, 0x697a
  1e:	32727363          	bgeu	tp,t2,344 <$d.6+0xb4>
  22:	3070                	.insn	2, 0x3070
  24:	7a5f 6669 6e65      	.insn	6, 0x6e6566697a5f
  2a:	32696563          	bltu	s2,t1,354 <$d.6+0xc4>
  2e:	3070                	.insn	2, 0x3070
  30:	7a5f 6d6d 6c75      	.insn	6, 0x6c756d6d7a5f
  36:	7031                	.insn	2, 0x7031
  38:	0030                	.insn	2, 0x0030

セクション .debug_frame の逆アセンブル:

00000000 <$d.9>:
   0:	0010                	.insn	2, 0x0010
   2:	0000                	.insn	2, 0x0000
   4:	ffff                	.insn	2, 0xffff
   6:	ffff                	.insn	2, 0xffff
   8:	0004                	.insn	2, 0x0004
   a:	0004                	.insn	2, 0x0004
   c:	7c01                	.insn	2, 0x7c01
   e:	0c01                	.insn	2, 0x0c01
  10:	0002                	.insn	2, 0x0002
  12:	0000                	.insn	2, 0x0000
  14:	002c                	.insn	2, 0x002c
  16:	0000                	.insn	2, 0x0000
  18:	0000                	.insn	2, 0x0000
  1a:	0000                	.insn	2, 0x0000
  1c:	001c                	.insn	2, 0x001c
  1e:	0040                	.insn	2, 0x0040
  20:	08ec                	.insn	2, 0x08ec
  22:	0000                	.insn	2, 0x0000
  24:	0e44                	.insn	2, 0x0e44
  26:	0280                	.insn	2, 0x0280
  28:	8174                	.insn	2, 0x8174
  2a:	8801                	.insn	2, 0x8801
  2c:	8902                	.insn	2, 0x8902
  2e:	93049203          	lh	tp,-1744(s1)
  32:	9405                	.insn	2, 0x9405
  34:	9506                	.insn	2, 0x9506
  36:	97089607          	.insn	4, 0x97089607
  3a:	9809                	.insn	2, 0x9809
  3c:	990a                	.insn	2, 0x990a
  3e:	9b0c9a0b          	.insn	4, 0x9b0c9a0b
  42:	000d                	.insn	2, 0x000d
  44:	000c                	.insn	2, 0x000c
  46:	0000                	.insn	2, 0x0000
  48:	0000                	.insn	2, 0x0000
  4a:	0000                	.insn	2, 0x0000
  4c:	0908                	.insn	2, 0x0908
  4e:	0040                	.insn	2, 0x0040
  50:	00cc                	.insn	2, 0x00cc
  52:	0000                	.insn	2, 0x0000
  54:	001c                	.insn	2, 0x001c
  56:	0000                	.insn	2, 0x0000
  58:	0000                	.insn	2, 0x0000
  5a:	0000                	.insn	2, 0x0000
  5c:	09d4                	.insn	2, 0x09d4
  5e:	0040                	.insn	2, 0x0040
  60:	00bc                	.insn	2, 0x00bc
  62:	0000                	.insn	2, 0x0000
  64:	0e44                	.insn	2, 0x0e44
  66:	5420                	.insn	2, 0x5420
  68:	0181                	.insn	2, 0x0181
  6a:	0288                	.insn	2, 0x0288
  6c:	0389                	.insn	2, 0x0389
  6e:	0492                	.insn	2, 0x0492
  70:	00000593          	li	a1,0

00000074 <$d.10>:
  74:	0010                	.insn	2, 0x0010
  76:	0000                	.insn	2, 0x0000
  78:	ffff                	.insn	2, 0xffff
  7a:	ffff                	.insn	2, 0xffff
  7c:	0004                	.insn	2, 0x0004
  7e:	0004                	.insn	2, 0x0004
  80:	7c01                	.insn	2, 0x7c01
  82:	0c01                	.insn	2, 0x0c01
  84:	0002                	.insn	2, 0x0002
  86:	0000                	.insn	2, 0x0000
  88:	000c                	.insn	2, 0x000c
  8a:	0000                	.insn	2, 0x0000
  8c:	0074                	.insn	2, 0x0074
  8e:	0000                	.insn	2, 0x0000
  90:	0a90                	.insn	2, 0x0a90
  92:	0040                	.insn	2, 0x0040
  94:	0018                	.insn	2, 0x0018
  96:	0000                	.insn	2, 0x0000
  98:	0010                	.insn	2, 0x0010
  9a:	0000                	.insn	2, 0x0000
  9c:	0074                	.insn	2, 0x0074
  9e:	0000                	.insn	2, 0x0000
  a0:	0aa8                	.insn	2, 0x0aa8
  a2:	0040                	.insn	2, 0x0040
  a4:	0304                	.insn	2, 0x0304
  a6:	0000                	.insn	2, 0x0000
  a8:	0e44                	.insn	2, 0x0e44
  aa:	0060                	.insn	2, 0x0060
  ac:	000c                	.insn	2, 0x000c
  ae:	0000                	.insn	2, 0x0000
  b0:	0074                	.insn	2, 0x0074
  b2:	0000                	.insn	2, 0x0000
  b4:	0dac                	.insn	2, 0x0dac
  b6:	0040                	.insn	2, 0x0040
  b8:	0014                	.insn	2, 0x0014
  ba:	0000                	.insn	2, 0x0000
  bc:	000c                	.insn	2, 0x000c
  be:	0000                	.insn	2, 0x0000
  c0:	0074                	.insn	2, 0x0074
  c2:	0000                	.insn	2, 0x0000
  c4:	0dc0                	.insn	2, 0x0dc0
  c6:	0040                	.insn	2, 0x0040
  c8:	0014                	.insn	2, 0x0014
  ca:	0000                	.insn	2, 0x0000
  cc:	000c                	.insn	2, 0x000c
  ce:	0000                	.insn	2, 0x0000
  d0:	0074                	.insn	2, 0x0074
  d2:	0000                	.insn	2, 0x0000
  d4:	0dd4                	.insn	2, 0x0dd4
  d6:	0040                	.insn	2, 0x0040
  d8:	000c                	.insn	2, 0x000c
  da:	0000                	.insn	2, 0x0000
  dc:	000c                	.insn	2, 0x000c
  de:	0000                	.insn	2, 0x0000
  e0:	0074                	.insn	2, 0x0074
  e2:	0000                	.insn	2, 0x0000
  e4:	0de0                	.insn	2, 0x0de0
  e6:	0040                	.insn	2, 0x0040
  e8:	000c                	.insn	2, 0x000c
  ea:	0000                	.insn	2, 0x0000
  ec:	000c                	.insn	2, 0x000c
  ee:	0000                	.insn	2, 0x0000
  f0:	0074                	.insn	2, 0x0074
  f2:	0000                	.insn	2, 0x0000
  f4:	0dec                	.insn	2, 0x0dec
  f6:	0040                	.insn	2, 0x0040
  f8:	000c                	.insn	2, 0x000c
  fa:	0000                	.insn	2, 0x0000
  fc:	000c                	.insn	2, 0x000c
  fe:	0000                	.insn	2, 0x0000
 100:	0074                	.insn	2, 0x0074
 102:	0000                	.insn	2, 0x0000
 104:	0df8                	.insn	2, 0x0df8
 106:	0040                	.insn	2, 0x0040
 108:	000c                	.insn	2, 0x000c
 10a:	0000                	.insn	2, 0x0000
 10c:	000c                	.insn	2, 0x000c
 10e:	0000                	.insn	2, 0x0000
 110:	0074                	.insn	2, 0x0074
 112:	0000                	.insn	2, 0x0000
 114:	0e04                	.insn	2, 0x0e04
 116:	0040                	.insn	2, 0x0040
 118:	0034                	.insn	2, 0x0034
 11a:	0000                	.insn	2, 0x0000
 11c:	000c                	.insn	2, 0x000c
 11e:	0000                	.insn	2, 0x0000
 120:	0074                	.insn	2, 0x0074
 122:	0000                	.insn	2, 0x0000
 124:	0e38                	.insn	2, 0x0e38
 126:	0040                	.insn	2, 0x0040
 128:	0040                	.insn	2, 0x0040
 12a:	0000                	.insn	2, 0x0000
 12c:	001c                	.insn	2, 0x001c
 12e:	0000                	.insn	2, 0x0000
 130:	0074                	.insn	2, 0x0074
 132:	0000                	.insn	2, 0x0000
 134:	0e78                	.insn	2, 0x0e78
 136:	0040                	.insn	2, 0x0040
 138:	02bc                	.insn	2, 0x02bc
 13a:	0000                	.insn	2, 0x0000
 13c:	0e44                	.insn	2, 0x0e44
 13e:	5450                	.insn	2, 0x5450
 140:	0988                	.insn	2, 0x0988
 142:	0a89                	.insn	2, 0x0a89
 144:	0b92                	.insn	2, 0x0b92
 146:	0d940c93          	addi	s9,s0,217 # 11994 <$d.5+0x10543>
 14a:	0000                	.insn	2, 0x0000
 14c:	000c                	.insn	2, 0x000c
 14e:	0000                	.insn	2, 0x0000
 150:	0074                	.insn	2, 0x0074
 152:	0000                	.insn	2, 0x0000
 154:	1134                	.insn	2, 0x1134
 156:	0040                	.insn	2, 0x0040
 158:	00a8                	.insn	2, 0x00a8
 15a:	0000                	.insn	2, 0x0000
 15c:	0018                	.insn	2, 0x0018
 15e:	0000                	.insn	2, 0x0000
 160:	0074                	.insn	2, 0x0074
 162:	0000                	.insn	2, 0x0000
 164:	11dc                	.insn	2, 0x11dc
 166:	0040                	.insn	2, 0x0040
 168:	006c                	.insn	2, 0x006c
 16a:	0000                	.insn	2, 0x0000
 16c:	0e54                	.insn	2, 0x0e54
 16e:	4c10                	.insn	2, 0x4c10
 170:	0181                	.insn	2, 0x0181
 172:	0288                	.insn	2, 0x0288
 174:	0389                	.insn	2, 0x0389
 176:	0000                	.insn	2, 0x0000
 178:	000c                	.insn	2, 0x000c
 17a:	0000                	.insn	2, 0x0000
 17c:	0074                	.insn	2, 0x0074
 17e:	0000                	.insn	2, 0x0000
 180:	1248                	.insn	2, 0x1248
 182:	0040                	.insn	2, 0x0040
 184:	0014                	.insn	2, 0x0014
 186:	0000                	.insn	2, 0x0000
 188:	000c                	.insn	2, 0x000c
 18a:	0000                	.insn	2, 0x0000
 18c:	0074                	.insn	2, 0x0074
 18e:	0000                	.insn	2, 0x0000
 190:	125c                	.insn	2, 0x125c
 192:	0040                	.insn	2, 0x0040
 194:	0014                	.insn	2, 0x0014
 196:	0000                	.insn	2, 0x0000
 198:	000c                	.insn	2, 0x000c
 19a:	0000                	.insn	2, 0x0000
 19c:	0074                	.insn	2, 0x0074
 19e:	0000                	.insn	2, 0x0000
 1a0:	1270                	.insn	2, 0x1270
 1a2:	0040                	.insn	2, 0x0040
 1a4:	000c                	.insn	2, 0x000c
 1a6:	0000                	.insn	2, 0x0000
 1a8:	000c                	.insn	2, 0x000c
 1aa:	0000                	.insn	2, 0x0000
 1ac:	0074                	.insn	2, 0x0074
 1ae:	0000                	.insn	2, 0x0000
 1b0:	127c                	.insn	2, 0x127c
 1b2:	0040                	.insn	2, 0x0040
 1b4:	000c                	.insn	2, 0x000c
 1b6:	0000                	.insn	2, 0x0000
 1b8:	000c                	.insn	2, 0x000c
 1ba:	0000                	.insn	2, 0x0000
 1bc:	0074                	.insn	2, 0x0074
 1be:	0000                	.insn	2, 0x0000
 1c0:	0000                	.insn	2, 0x0000
 1c2:	0040                	.insn	2, 0x0040
 1c4:	001c                	.insn	2, 0x001c
	...

000001c8 <$d.10>:
 1c8:	0010                	.insn	2, 0x0010
 1ca:	0000                	.insn	2, 0x0000
 1cc:	ffff                	.insn	2, 0xffff
 1ce:	ffff                	.insn	2, 0xffff
 1d0:	0004                	.insn	2, 0x0004
 1d2:	0004                	.insn	2, 0x0004
 1d4:	7c01                	.insn	2, 0x7c01
 1d6:	0c01                	.insn	2, 0x0c01
 1d8:	0002                	.insn	2, 0x0002
 1da:	0000                	.insn	2, 0x0000
 1dc:	0018                	.insn	2, 0x0018
 1de:	0000                	.insn	2, 0x0000
 1e0:	01c8                	.insn	2, 0x01c8
 1e2:	0000                	.insn	2, 0x0000
 1e4:	1288                	.insn	2, 0x1288
 1e6:	0040                	.insn	2, 0x0040
 1e8:	00ec                	.insn	2, 0x00ec
 1ea:	0000                	.insn	2, 0x0000
 1ec:	0e44                	.insn	2, 0x0e44
 1ee:	04a0                	.insn	2, 0x04a0
 1f0:	814c                	.insn	2, 0x814c
 1f2:	8801                	.insn	2, 0x8801
 1f4:	8902                	.insn	2, 0x8902
 1f6:	00180003          	lb	zero,1(a6)
 1fa:	0000                	.insn	2, 0x0000
 1fc:	01c8                	.insn	2, 0x01c8
 1fe:	0000                	.insn	2, 0x0000
 200:	1374                	.insn	2, 0x1374
 202:	0040                	.insn	2, 0x0040
 204:	0128                	.insn	2, 0x0128
 206:	0000                	.insn	2, 0x0000
 208:	0e44                	.insn	2, 0x0e44
 20a:	5010                	.insn	2, 0x5010
 20c:	0181                	.insn	2, 0x0181
 20e:	0288                	.insn	2, 0x0288
 210:	0389                	.insn	2, 0x0389
 212:	0492                	.insn	2, 0x0492
 214:	0028                	.insn	2, 0x0028
 216:	0000                	.insn	2, 0x0000
 218:	01c8                	.insn	2, 0x01c8
 21a:	0000                	.insn	2, 0x0000
 21c:	149c                	.insn	2, 0x149c
 21e:	0040                	.insn	2, 0x0040
 220:	02a4                	.insn	2, 0x02a4
 222:	0000                	.insn	2, 0x0000
 224:	0e44                	.insn	2, 0x0e44
 226:	7040                	.insn	2, 0x7040
 228:	0181                	.insn	2, 0x0181
 22a:	0288                	.insn	2, 0x0288
 22c:	0389                	.insn	2, 0x0389
 22e:	0492                	.insn	2, 0x0492
 230:	06940593          	addi	a1,s0,105
 234:	0795                	.insn	2, 0x0795
 236:	0896                	.insn	2, 0x0896
 238:	0a980997          	auipc	s3,0xa980
 23c:	0b99                	.insn	2, 0x0b99
 23e:	0c9a                	.insn	2, 0x0c9a
 240:	000c                	.insn	2, 0x000c
 242:	0000                	.insn	2, 0x0000
 244:	01c8                	.insn	2, 0x01c8
 246:	0000                	.insn	2, 0x0000
 248:	1740                	.insn	2, 0x1740
 24a:	0040                	.insn	2, 0x0040
 24c:	0020                	.insn	2, 0x0020
 24e:	0000                	.insn	2, 0x0000
 250:	0020                	.insn	2, 0x0020
 252:	0000                	.insn	2, 0x0000
 254:	01c8                	.insn	2, 0x01c8
 256:	0000                	.insn	2, 0x0000
 258:	1760                	.insn	2, 0x1760
 25a:	0040                	.insn	2, 0x0040
 25c:	025c                	.insn	2, 0x025c
 25e:	0000                	.insn	2, 0x0000
 260:	0e44                	.insn	2, 0x0e44
 262:	6020                	.insn	2, 0x6020
 264:	0181                	.insn	2, 0x0181
 266:	0288                	.insn	2, 0x0288
 268:	0389                	.insn	2, 0x0389
 26a:	0492                	.insn	2, 0x0492
 26c:	06940593          	addi	a1,s0,105
 270:	0795                	.insn	2, 0x0795
 272:	0896                	.insn	2, 0x0896

セクション .debug_line の逆アセンブル:

00000000 <$d.10>:
       0:	090d                	.insn	2, 0x090d
       2:	0000                	.insn	2, 0x0000
       4:	0004                	.insn	2, 0x0004
       6:	003a                	.insn	2, 0x003a
       8:	0000                	.insn	2, 0x0000
       a:	0101                	.insn	2, 0x0101
       c:	fb01                	.insn	2, 0xfb01
       e:	0d0e                	.insn	2, 0x0d0e
      10:	0100                	.insn	2, 0x0100
      12:	0101                	.insn	2, 0x0101
      14:	0001                	.insn	2, 0x0001
      16:	0000                	.insn	2, 0x0000
      18:	0001                	.insn	2, 0x0001
      1a:	0100                	.insn	2, 0x0100
      1c:	2f2e                	.insn	2, 0x2f2e
      1e:	00637273          	csrrci	tp,0x6,6
      22:	7300                	.insn	2, 0x7300
      24:	6568                	.insn	2, 0x6568
      26:	6c6c                	.insn	2, 0x6c6c
      28:	632e                	.insn	2, 0x632e
      2a:	0100                	.insn	2, 0x0100
      2c:	0000                	.insn	2, 0x0000
      2e:	7375                	.insn	2, 0x7375
      30:	7265                	.insn	2, 0x7265
      32:	682e                	.insn	2, 0x682e
      34:	0100                	.insn	2, 0x0100
      36:	0000                	.insn	2, 0x0000
      38:	6166                	.insn	2, 0x6166
      3a:	3374                	.insn	2, 0x3374
      3c:	2e32                	.insn	2, 0x2e32
      3e:	0068                	.insn	2, 0x0068
      40:	0001                	.insn	2, 0x0001
      42:	0000                	.insn	2, 0x0000
      44:	0500                	.insn	2, 0x0500
      46:	1c02                	.insn	2, 0x1c02
      48:	4000                	.insn	2, 0x4000
      4a:	1600                	.insn	2, 0x1600
      4c:	0505                	.insn	2, 0x0505
      4e:	030a                	.insn	2, 0x030a
      50:	090a                	.insn	2, 0x090a
      52:	0038                	.insn	2, 0x0038
      54:	0601                	.insn	2, 0x0601
      56:	10097103          	.insn	4, 0x10097103
      5a:	0100                	.insn	2, 0x0100
      5c:	0d05                	.insn	2, 0x0d05
      5e:	0306                	.insn	2, 0x0306
      60:	018e                	.insn	2, 0x018e
      62:	bc09                	.insn	2, 0xbc09
      64:	0101                	.insn	2, 0x0101
      66:	0905                	.insn	2, 0x0905
      68:	097f8f03          	lb	t5,151(t6)
      6c:	0008                	.insn	2, 0x0008
      6e:	0501                	.insn	2, 0x0501
      70:	0618                	.insn	2, 0x0618
      72:	0c090003          	lb	zero,192(s2)
      76:	0100                	.insn	2, 0x0100
      78:	2605                	.insn	2, 0x2605
      7a:	0c090003          	lb	zero,192(s2)
      7e:	0100                	.insn	2, 0x0100
      80:	3405                	.insn	2, 0x3405
      82:	0c090003          	lb	zero,192(s2)
      86:	0100                	.insn	2, 0x0100
      88:	4205                	.insn	2, 0x4205
      8a:	0c090003          	lb	zero,192(s2)
      8e:	0100                	.insn	2, 0x0100
      90:	0905                	.insn	2, 0x0905
      92:	0306                	.insn	2, 0x0306
      94:	0902                	.insn	2, 0x0902
      96:	000c                	.insn	2, 0x000c
      98:	0301                	.insn	2, 0x0301
      9a:	0901                	.insn	2, 0x0901
      9c:	000c                	.insn	2, 0x000c
      9e:	0301                	.insn	2, 0x0301
      a0:	0901                	.insn	2, 0x0901
      a2:	000c                	.insn	2, 0x000c
      a4:	0301                	.insn	2, 0x0301
      a6:	0901                	.insn	2, 0x0901
      a8:	000c                	.insn	2, 0x000c
      aa:	0301                	.insn	2, 0x0301
      ac:	0901                	.insn	2, 0x0901
      ae:	000c                	.insn	2, 0x000c
      b0:	0301                	.insn	2, 0x0301
      b2:	0901                	.insn	2, 0x0901
      b4:	000c                	.insn	2, 0x000c
      b6:	0301                	.insn	2, 0x0301
      b8:	0901                	.insn	2, 0x0901
      ba:	000c                	.insn	2, 0x000c
      bc:	0301                	.insn	2, 0x0301
      be:	0901                	.insn	2, 0x0901
      c0:	000c                	.insn	2, 0x000c
      c2:	0301                	.insn	2, 0x0301
      c4:	0902                	.insn	2, 0x0902
      c6:	000c                	.insn	2, 0x000c
      c8:	0501                	.insn	2, 0x0501
      ca:	0618                	.insn	2, 0x0618
      cc:	0c090003          	lb	zero,192(s2)
      d0:	0100                	.insn	2, 0x0100
      d2:	2605                	.insn	2, 0x2605
      d4:	0c090003          	lb	zero,192(s2)
      d8:	0100                	.insn	2, 0x0100
      da:	3405                	.insn	2, 0x3405
      dc:	0c090003          	lb	zero,192(s2)
      e0:	0100                	.insn	2, 0x0100
      e2:	1b05                	.insn	2, 0x1b05
      e4:	0306                	.insn	2, 0x0306
      e6:	090c                	.insn	2, 0x090c
      e8:	000c                	.insn	2, 0x000c
      ea:	0501                	.insn	2, 0x0501
      ec:	032a                	.insn	2, 0x032a
      ee:	0902                	.insn	2, 0x0902
      f0:	0008                	.insn	2, 0x0008
      f2:	0501                	.insn	2, 0x0501
      f4:	0311                	.insn	2, 0x0311
      f6:	00040903          	lb	s2,0(s0)
      fa:	0601                	.insn	2, 0x0601
      fc:	04094703          	lbu	a4,64(s2)
     100:	0100                	.insn	2, 0x0100
     102:	04093903          	.insn	4, 0x04093903
     106:	0100                	.insn	2, 0x0100
     108:	04094703          	lbu	a4,64(s2)
     10c:	0100                	.insn	2, 0x0100
     10e:	2a05                	.insn	2, 0x2a05
     110:	0306                	.insn	2, 0x0306
     112:	000c0937          	lui	s2,0xc0
     116:	0601                	.insn	2, 0x0601
     118:	04094903          	lbu	s2,64(s2) # c0040 <$d.5+0xbebef>
     11c:	0100                	.insn	2, 0x0100
     11e:	1105                	.insn	2, 0x1105
     120:	0306                	.insn	2, 0x0306
     122:	093e                	.insn	2, 0x093e
     124:	0004                	.insn	2, 0x0004
     126:	0501                	.insn	2, 0x0501
     128:	0600                	.insn	2, 0x0600
     12a:	04094203          	lbu	tp,64(s2)
     12e:	0100                	.insn	2, 0x0100
     130:	1105                	.insn	2, 0x1105
     132:	04093e03          	.insn	4, 0x04093e03
     136:	0100                	.insn	2, 0x0100
     138:	0005                	.insn	2, 0x0005
     13a:	04094203          	lbu	tp,64(s2)
     13e:	0100                	.insn	2, 0x0100
     140:	1605                	.insn	2, 0x1605
     142:	0306                	.insn	2, 0x0306
     144:	00c5                	.insn	2, 0x00c5
     146:	0409                	.insn	2, 0x0409
     148:	0100                	.insn	2, 0x0100
     14a:	1105                	.insn	2, 0x1105
     14c:	08090203          	lb	tp,128(s2)
     150:	0100                	.insn	2, 0x0100
     152:	1c05                	.insn	2, 0x1c05
     154:	04090503          	lb	a0,64(s2)
     158:	0100                	.insn	2, 0x0100
     15a:	1905                	.insn	2, 0x1905
     15c:	08090503          	lb	a0,128(s2)
     160:	0100                	.insn	2, 0x0100
     162:	0306                	.insn	2, 0x0306
     164:	08097faf          	.insn	4, 0x08097faf
     168:	0100                	.insn	2, 0x0100
     16a:	0900d103          	lhu	sp,144(ra) # 1170f <$d.5+0x102be>
     16e:	0008                	.insn	2, 0x0008
     170:	0501                	.insn	2, 0x0501
     172:	0615                	.insn	2, 0x0615
     174:	04090103          	lb	sp,64(s2)
     178:	0100                	.insn	2, 0x0100
     17a:	1805                	.insn	2, 0x1805
     17c:	04090103          	lb	sp,64(s2)
     180:	0100                	.insn	2, 0x0100
     182:	1505                	.insn	2, 0x1505
     184:	04090303          	lb	t1,64(s2)
     188:	0100                	.insn	2, 0x0100
     18a:	0c090103          	lb	sp,192(s2)
     18e:	0100                	.insn	2, 0x0100
     190:	0306                	.insn	2, 0x0306
     192:	7fa9                	.insn	2, 0x7fa9
     194:	0c09                	.insn	2, 0x0c09
     196:	0100                	.insn	2, 0x0100
     198:	1905                	.insn	2, 0x1905
     19a:	0306                	.insn	2, 0x0306
     19c:	00d1                	.insn	2, 0x00d1
     19e:	0809                	.insn	2, 0x0809
     1a0:	0100                	.insn	2, 0x0100
     1a2:	1b05                	.insn	2, 0x1b05
     1a4:	08091503          	lh	a0,128(s2)
     1a8:	0100                	.insn	2, 0x0100
     1aa:	0306                	.insn	2, 0x0306
     1ac:	7f9a                	.insn	2, 0x7f9a
     1ae:	0809                	.insn	2, 0x0809
     1b0:	0100                	.insn	2, 0x0100
     1b2:	1105                	.insn	2, 0x1105
     1b4:	0306                	.insn	2, 0x0306
     1b6:	00ea                	.insn	2, 0x00ea
     1b8:	0409                	.insn	2, 0x0409
     1ba:	0100                	.insn	2, 0x0100
     1bc:	0d05                	.insn	2, 0x0d05
     1be:	08090603          	lb	a2,128(s2)
     1c2:	0100                	.insn	2, 0x0100
     1c4:	1805                	.insn	2, 0x1805
     1c6:	0306                	.insn	2, 0x0306
     1c8:	0900                	.insn	2, 0x0900
     1ca:	0008                	.insn	2, 0x0008
     1cc:	0501                	.insn	2, 0x0501
     1ce:	031c                	.insn	2, 0x031c
     1d0:	0900                	.insn	2, 0x0900
     1d2:	0004                	.insn	2, 0x0004
     1d4:	0501                	.insn	2, 0x0501
     1d6:	0300                	.insn	2, 0x0300
     1d8:	7f90                	.insn	2, 0x7f90
     1da:	0409                	.insn	2, 0x0409
     1dc:	0100                	.insn	2, 0x0100
     1de:	1b05                	.insn	2, 0x1b05
     1e0:	0306                	.insn	2, 0x0306
     1e2:	0934                	.insn	2, 0x0934
     1e4:	000c                	.insn	2, 0x000c
     1e6:	0501                	.insn	2, 0x0501
     1e8:	032a                	.insn	2, 0x032a
     1ea:	0902                	.insn	2, 0x0902
     1ec:	0008                	.insn	2, 0x0008
     1ee:	0501                	.insn	2, 0x0501
     1f0:	0311                	.insn	2, 0x0311
     1f2:	00040903          	lb	s2,0(s0)
     1f6:	0501                	.insn	2, 0x0501
     1f8:	0600                	.insn	2, 0x0600
     1fa:	04094703          	lbu	a4,64(s2)
     1fe:	0100                	.insn	2, 0x0100
     200:	1105                	.insn	2, 0x1105
     202:	04093903          	.insn	4, 0x04093903
     206:	0100                	.insn	2, 0x0100
     208:	0306                	.insn	2, 0x0306
     20a:	0901                	.insn	2, 0x0901
     20c:	0004                	.insn	2, 0x0004
     20e:	0601                	.insn	2, 0x0601
     210:	0c094603          	lbu	a2,192(s2)
     214:	0100                	.insn	2, 0x0100
     216:	0306                	.insn	2, 0x0306
     218:	000c093f 41030601 	.insn	8, 0x41030601000c093f
     220:	0809                	.insn	2, 0x0809
     222:	0100                	.insn	2, 0x0100
     224:	2a05                	.insn	2, 0x2a05
     226:	0306                	.insn	2, 0x0306
     228:	00fe                	.insn	2, 0x00fe
     22a:	0c09                	.insn	2, 0x0c09
     22c:	0100                	.insn	2, 0x0100
     22e:	1005                	.insn	2, 0x1005
     230:	0306                	.insn	2, 0x0306
     232:	0900                	.insn	2, 0x0900
     234:	0004                	.insn	2, 0x0004
     236:	0301                	.insn	2, 0x0301
     238:	7f82                	.insn	2, 0x7f82
     23a:	0809                	.insn	2, 0x0809
     23c:	0100                	.insn	2, 0x0100
     23e:	1605                	.insn	2, 0x1605
     240:	0306                	.insn	2, 0x0306
     242:	0181                	.insn	2, 0x0181
     244:	1809                	.insn	2, 0x1809
     246:	0100                	.insn	2, 0x0100
     248:	0d05                	.insn	2, 0x0d05
     24a:	0306                	.insn	2, 0x0306
     24c:	0900                	.insn	2, 0x0900
     24e:	0004                	.insn	2, 0x0004
     250:	0501                	.insn	2, 0x0501
     252:	031a                	.insn	2, 0x031a
     254:	0900                	.insn	2, 0x0900
     256:	0008                	.insn	2, 0x0008
     258:	0501                	.insn	2, 0x0501
     25a:	060d                	.insn	2, 0x060d
     25c:	04090203          	lb	tp,64(s2)
     260:	0100                	.insn	2, 0x0100
     262:	1405                	.insn	2, 0x1405
     264:	0306                	.insn	2, 0x0306
     266:	0900                	.insn	2, 0x0900
     268:	0004                	.insn	2, 0x0004
     26a:	0501                	.insn	2, 0x0501
     26c:	09000317          	auipc	t1,0x9000
     270:	0004                	.insn	2, 0x0004
     272:	0501                	.insn	2, 0x0501
     274:	0334                	.insn	2, 0x0334
     276:	0900                	.insn	2, 0x0900
     278:	000c                	.insn	2, 0x000c
     27a:	0501                	.insn	2, 0x0501
     27c:	030d                	.insn	2, 0x030d
     27e:	0900                	.insn	2, 0x0900
     280:	0004                	.insn	2, 0x0004
     282:	0501                	.insn	2, 0x0501
     284:	0314                	.insn	2, 0x0314
     286:	0900                	.insn	2, 0x0900
     288:	0004                	.insn	2, 0x0004
     28a:	0501                	.insn	2, 0x0501
     28c:	0612                	.insn	2, 0x0612
     28e:	0c090303          	lb	t1,192(s2)
     292:	0100                	.insn	2, 0x0100
     294:	0005                	.insn	2, 0x0005
     296:	0306                	.insn	2, 0x0306
     298:	7efa                	.insn	2, 0x7efa
     29a:	0809                	.insn	2, 0x0809
     29c:	0100                	.insn	2, 0x0100
     29e:	1405                	.insn	2, 0x1405
     2a0:	0306                	.insn	2, 0x0306
     2a2:	04090187          	.insn	4, 0x04090187
     2a6:	0100                	.insn	2, 0x0100
     2a8:	1e05                	.insn	2, 0x1e05
     2aa:	0306                	.insn	2, 0x0306
     2ac:	0900                	.insn	2, 0x0900
     2ae:	0004                	.insn	2, 0x0004
     2b0:	0501                	.insn	2, 0x0501
     2b2:	0609                	.insn	2, 0x0609
     2b4:	08097903          	.insn	4, 0x08097903
     2b8:	0100                	.insn	2, 0x0100
     2ba:	1405                	.insn	2, 0x1405
     2bc:	08090d03          	lb	s10,128(s2)
     2c0:	0100                	.insn	2, 0x0100
     2c2:	0d05                	.insn	2, 0x0d05
     2c4:	0306                	.insn	2, 0x0306
     2c6:	0900                	.insn	2, 0x0900
     2c8:	0004                	.insn	2, 0x0004
     2ca:	0301                	.insn	2, 0x0301
     2cc:	0900                	.insn	2, 0x0900
     2ce:	0010                	.insn	2, 0x0010
     2d0:	0501                	.insn	2, 0x0501
     2d2:	0614                	.insn	2, 0x0614
     2d4:	04090403          	lb	s0,64(s2)
     2d8:	0100                	.insn	2, 0x0100
     2da:	0306                	.insn	2, 0x0306
     2dc:	0900                	.insn	2, 0x0900
     2de:	0010                	.insn	2, 0x0010
     2e0:	0601                	.insn	2, 0x0601
     2e2:	04091d03          	lh	s10,64(s2)
     2e6:	0100                	.insn	2, 0x0100
     2e8:	0306                	.insn	2, 0x0306
     2ea:	0900                	.insn	2, 0x0900
     2ec:	0010                	.insn	2, 0x0010
     2ee:	0601                	.insn	2, 0x0601
     2f0:	04090c03          	lb	s8,64(s2)
     2f4:	0100                	.insn	2, 0x0100
     2f6:	0306                	.insn	2, 0x0306
     2f8:	0900                	.insn	2, 0x0900
     2fa:	0010                	.insn	2, 0x0010
     2fc:	0601                	.insn	2, 0x0601
     2fe:	04090503          	lb	a0,64(s2)
     302:	0100                	.insn	2, 0x0100
     304:	0306                	.insn	2, 0x0306
     306:	0900                	.insn	2, 0x0900
     308:	0010                	.insn	2, 0x0010
     30a:	0601                	.insn	2, 0x0601
     30c:	04090d03          	lb	s10,64(s2)
     310:	0100                	.insn	2, 0x0100
     312:	0306                	.insn	2, 0x0306
     314:	0900                	.insn	2, 0x0900
     316:	0010                	.insn	2, 0x0010
     318:	0601                	.insn	2, 0x0601
     31a:	04090a03          	lb	s4,64(s2)
     31e:	0100                	.insn	2, 0x0100
     320:	0306                	.insn	2, 0x0306
     322:	0900                	.insn	2, 0x0900
     324:	0010                	.insn	2, 0x0010
     326:	0601                	.insn	2, 0x0601
     328:	04090a03          	lb	s4,64(s2)
     32c:	0100                	.insn	2, 0x0100
     32e:	0306                	.insn	2, 0x0306
     330:	0900                	.insn	2, 0x0900
     332:	0010                	.insn	2, 0x0010
     334:	0601                	.insn	2, 0x0601
     336:	04090e03          	lb	t3,64(s2)
     33a:	0100                	.insn	2, 0x0100
     33c:	0306                	.insn	2, 0x0306
     33e:	0900                	.insn	2, 0x0900
     340:	0010                	.insn	2, 0x0010
     342:	0601                	.insn	2, 0x0601
     344:	04090e03          	lb	t3,64(s2)
     348:	0100                	.insn	2, 0x0100
     34a:	0306                	.insn	2, 0x0306
     34c:	0900                	.insn	2, 0x0900
     34e:	0010                	.insn	2, 0x0010
     350:	0601                	.insn	2, 0x0601
     352:	04090503          	lb	a0,64(s2)
     356:	0100                	.insn	2, 0x0100
     358:	0306                	.insn	2, 0x0306
     35a:	0900                	.insn	2, 0x0900
     35c:	0010                	.insn	2, 0x0010
     35e:	0601                	.insn	2, 0x0601
     360:	04090a03          	lb	s4,64(s2)
     364:	0100                	.insn	2, 0x0100
     366:	0306                	.insn	2, 0x0306
     368:	0900                	.insn	2, 0x0900
     36a:	0010                	.insn	2, 0x0010
     36c:	0601                	.insn	2, 0x0601
     36e:	04090b03          	lb	s6,64(s2)
     372:	0100                	.insn	2, 0x0100
     374:	3105                	.insn	2, 0x3105
     376:	0306                	.insn	2, 0x0306
     378:	0900                	.insn	2, 0x0900
     37a:	0010                	.insn	2, 0x0010
     37c:	0501                	.insn	2, 0x0501
     37e:	0614                	.insn	2, 0x0614
     380:	04090103          	lb	sp,64(s2)
     384:	0100                	.insn	2, 0x0100
     386:	3105                	.insn	2, 0x3105
     388:	0306                	.insn	2, 0x0306
     38a:	0900                	.insn	2, 0x0900
     38c:	0010                	.insn	2, 0x0010
     38e:	0501                	.insn	2, 0x0501
     390:	0614                	.insn	2, 0x0614
     392:	04090103          	lb	sp,64(s2)
     396:	0100                	.insn	2, 0x0100
     398:	10097e03          	.insn	4, 0x10097e03
     39c:	0100                	.insn	2, 0x0100
     39e:	0306                	.insn	2, 0x0306
     3a0:	7dea                	.insn	2, 0x7dea
     3a2:	0409                	.insn	2, 0x0409
     3a4:	0100                	.insn	2, 0x0100
     3a6:	0d05                	.insn	2, 0x0d05
     3a8:	0306                	.insn	2, 0x0306
     3aa:	029c                	.insn	2, 0x029c
     3ac:	0409                	.insn	2, 0x0409
     3ae:	0100                	.insn	2, 0x0100
     3b0:	0306                	.insn	2, 0x0306
     3b2:	7de4                	.insn	2, 0x7de4
     3b4:	0c09                	.insn	2, 0x0c09
     3b6:	0100                	.insn	2, 0x0100
     3b8:	1105                	.insn	2, 0x1105
     3ba:	0306                	.insn	2, 0x0306
     3bc:	08090197          	auipc	gp,0x8090
     3c0:	0100                	.insn	2, 0x0100
     3c2:	1f05                	.insn	2, 0x1f05
     3c4:	04090103          	lb	sp,64(s2)
     3c8:	0100                	.insn	2, 0x0100
     3ca:	0505                	.insn	2, 0x0505
     3cc:	0901a003          	lw	zero,144(gp) # 809044c <USER_MAX+0x7b9044c>
     3d0:	0004                	.insn	2, 0x0004
     3d2:	0601                	.insn	2, 0x0601
     3d4:	097dc803          	lbu	a6,151(s11)
     3d8:	0004                	.insn	2, 0x0004
     3da:	0301                	.insn	2, 0x0301
     3dc:	02b8                	.insn	2, 0x02b8
     3de:	0809                	.insn	2, 0x0809
     3e0:	0100                	.insn	2, 0x0100
     3e2:	0c05                	.insn	2, 0x0c05
     3e4:	04090003          	lb	zero,64(s2)
     3e8:	0100                	.insn	2, 0x0100
     3ea:	1605                	.insn	2, 0x1605
     3ec:	04090003          	lb	zero,64(s2)
     3f0:	0100                	.insn	2, 0x0100
     3f2:	1905                	.insn	2, 0x1905
     3f4:	0306                	.insn	2, 0x0306
     3f6:	00100903          	lb	s2,1(zero) # 1 <$d.10+0x1>
     3fa:	0501                	.insn	2, 0x0501
     3fc:	0625                	.insn	2, 0x0625
     3fe:	04090003          	lb	zero,64(s2)
     402:	0100                	.insn	2, 0x0100
     404:	0a05                	.insn	2, 0x0a05
     406:	0306                	.insn	2, 0x0306
     408:	0901                	.insn	2, 0x0901
     40a:	000c                	.insn	2, 0x000c
     40c:	0601                	.insn	2, 0x0601
     40e:	097dc403          	lbu	s0,151(s11)
     412:	0004                	.insn	2, 0x0004
     414:	0501                	.insn	2, 0x0501
     416:	0611                	.insn	2, 0x0611
     418:	0900e003          	.insn	4, 0x0900e003
     41c:	0008                	.insn	2, 0x0008
     41e:	0301                	.insn	2, 0x0301
     420:	0901                	.insn	2, 0x0901
     422:	000c                	.insn	2, 0x000c
     424:	0501                	.insn	2, 0x0501
     426:	061e                	.insn	2, 0x061e
     428:	08090003          	lb	zero,128(s2)
     42c:	0100                	.insn	2, 0x0100
     42e:	1105                	.insn	2, 0x1105
     430:	0306                	.insn	2, 0x0306
     432:	0c0900cf          	.insn	4, 0x0c0900cf
     436:	0100                	.insn	2, 0x0100
     438:	2105                	.insn	2, 0x2105
     43a:	04090103          	lb	sp,64(s2)
     43e:	0100                	.insn	2, 0x0100
     440:	1705                	.insn	2, 0x1705
     442:	0306                	.insn	2, 0x0306
     444:	0900                	.insn	2, 0x0900
     446:	0004                	.insn	2, 0x0004
     448:	0301                	.insn	2, 0x0301
     44a:	0c097ecf          	.insn	4, 0x0c097ecf
     44e:	0100                	.insn	2, 0x0100
     450:	1505                	.insn	2, 0x1505
     452:	0306                	.insn	2, 0x0306
     454:	01b2                	.insn	2, 0x01b2
     456:	0809                	.insn	2, 0x0809
     458:	0100                	.insn	2, 0x0100
     45a:	0306                	.insn	2, 0x0306
     45c:	7ece                	.insn	2, 0x7ece
     45e:	0809                	.insn	2, 0x0809
     460:	0100                	.insn	2, 0x0100
     462:	0d05                	.insn	2, 0x0d05
     464:	0306                	.insn	2, 0x0306
     466:	040901a3          	sb	zero,67(s2)
     46a:	0100                	.insn	2, 0x0100
     46c:	0306                	.insn	2, 0x0306
     46e:	7edd                	.insn	2, 0x7edd
     470:	0809                	.insn	2, 0x0809
     472:	0100                	.insn	2, 0x0100
     474:	0905                	.insn	2, 0x0905
     476:	0306                	.insn	2, 0x0306
     478:	02bc                	.insn	2, 0x02bc
     47a:	0809                	.insn	2, 0x0809
     47c:	0100                	.insn	2, 0x0100
     47e:	0306                	.insn	2, 0x0306
     480:	7dc4                	.insn	2, 0x7dc4
     482:	0409                	.insn	2, 0x0409
     484:	0100                	.insn	2, 0x0100
     486:	1105                	.insn	2, 0x1105
     488:	0306                	.insn	2, 0x0306
     48a:	01c1                	.insn	2, 0x01c1
     48c:	0809                	.insn	2, 0x0809
     48e:	0100                	.insn	2, 0x0100
     490:	2805                	.insn	2, 0x2805
     492:	04090103          	lb	sp,64(s2)
     496:	0100                	.insn	2, 0x0100
     498:	1e05                	.insn	2, 0x1e05
     49a:	0306                	.insn	2, 0x0306
     49c:	0900                	.insn	2, 0x0900
     49e:	0004                	.insn	2, 0x0004
     4a0:	0301                	.insn	2, 0x0301
     4a2:	7ebe                	.insn	2, 0x7ebe
     4a4:	0c09                	.insn	2, 0x0c09
     4a6:	0100                	.insn	2, 0x0100
     4a8:	1505                	.insn	2, 0x1505
     4aa:	0306                	.insn	2, 0x0306
     4ac:	040901c3          	.insn	4, 0x040901c3
     4b0:	0100                	.insn	2, 0x0100
     4b2:	0306                	.insn	2, 0x0306
     4b4:	7ebd                	.insn	2, 0x7ebd
     4b6:	0c09                	.insn	2, 0x0c09
     4b8:	0100                	.insn	2, 0x0100
     4ba:	0d05                	.insn	2, 0x0d05
     4bc:	0306                	.insn	2, 0x0306
     4be:	040901b7          	lui	gp,0x4090
     4c2:	0100                	.insn	2, 0x0100
     4c4:	0306                	.insn	2, 0x0306
     4c6:	7ec9                	.insn	2, 0x7ec9
     4c8:	0c09                	.insn	2, 0x0c09
     4ca:	0100                	.insn	2, 0x0100
     4cc:	1105                	.insn	2, 0x1105
     4ce:	0306                	.insn	2, 0x0306
     4d0:	01cd                	.insn	2, 0x01cd
     4d2:	0809                	.insn	2, 0x0809
     4d4:	0100                	.insn	2, 0x0100
     4d6:	2805                	.insn	2, 0x2805
     4d8:	04090503          	lb	a0,64(s2)
     4dc:	0100                	.insn	2, 0x0100
     4de:	1e05                	.insn	2, 0x1e05
     4e0:	0306                	.insn	2, 0x0306
     4e2:	0900                	.insn	2, 0x0900
     4e4:	0004                	.insn	2, 0x0004
     4e6:	0501                	.insn	2, 0x0501
     4e8:	060d                	.insn	2, 0x060d
     4ea:	08090103          	lb	sp,128(s2)
     4ee:	0100                	.insn	2, 0x0100
     4f0:	0306                	.insn	2, 0x0306
     4f2:	7ead                	.insn	2, 0x7ead
     4f4:	0809                	.insn	2, 0x0809
     4f6:	0100                	.insn	2, 0x0100
     4f8:	1605                	.insn	2, 0x1605
     4fa:	0306                	.insn	2, 0x0306
     4fc:	02c1                	.insn	2, 0x02c1
     4fe:	1009                	.insn	2, 0x1009
     500:	0100                	.insn	2, 0x0100
     502:	0005                	.insn	2, 0x0005
     504:	0306                	.insn	2, 0x0306
     506:	08097dbf 0c050100 	.insn	8, 0x0c05010008097dbf
     50e:	0306                	.insn	2, 0x0306
     510:	02be                	.insn	2, 0x02be
     512:	0409                	.insn	2, 0x0409
     514:	0100                	.insn	2, 0x0100
     516:	0005                	.insn	2, 0x0005
     518:	0306                	.insn	2, 0x0306
     51a:	7dc2                	.insn	2, 0x7dc2
     51c:	0409                	.insn	2, 0x0409
     51e:	0100                	.insn	2, 0x0100
     520:	1005                	.insn	2, 0x1005
     522:	0306                	.insn	2, 0x0306
     524:	02c5                	.insn	2, 0x02c5
     526:	0409                	.insn	2, 0x0409
     528:	0100                	.insn	2, 0x0100
     52a:	1605                	.insn	2, 0x1605
     52c:	0306                	.insn	2, 0x0306
     52e:	0900                	.insn	2, 0x0900
     530:	0004                	.insn	2, 0x0004
     532:	0501                	.insn	2, 0x0501
     534:	0605                	.insn	2, 0x0605
     536:	04097903          	.insn	4, 0x04097903
     53a:	0100                	.insn	2, 0x0100
     53c:	0306                	.insn	2, 0x0306
     53e:	7dc2                	.insn	2, 0x7dc2
     540:	0409                	.insn	2, 0x0409
     542:	0100                	.insn	2, 0x0100
     544:	1605                	.insn	2, 0x1605
     546:	0306                	.insn	2, 0x0306
     548:	02c1                	.insn	2, 0x02c1
     54a:	0409                	.insn	2, 0x0409
     54c:	0100                	.insn	2, 0x0100
     54e:	1b05                	.insn	2, 0x1b05
     550:	10090103          	lb	sp,256(s2)
     554:	0100                	.insn	2, 0x0100
     556:	10090103          	lb	sp,256(s2)
     55a:	0100                	.insn	2, 0x0100
     55c:	1105                	.insn	2, 0x1105
     55e:	097eda03          	lhu	s4,151(t4)
     562:	0010                	.insn	2, 0x0010
     564:	0501                	.insn	2, 0x0501
     566:	031f 0901 0008      	.insn	6, 0x00080901031f
     56c:	0501                	.insn	2, 0x0501
     56e:	0305                	.insn	2, 0x0305
     570:	019a                	.insn	2, 0x019a
     572:	0409                	.insn	2, 0x0409
     574:	0100                	.insn	2, 0x0100
     576:	0306                	.insn	2, 0x0306
     578:	7dc8                	.insn	2, 0x7dc8
     57a:	0409                	.insn	2, 0x0409
     57c:	0100                	.insn	2, 0x0100
     57e:	0902b803          	.insn	4, 0x0902b803
     582:	0004                	.insn	2, 0x0004
     584:	0501                	.insn	2, 0x0501
     586:	030c                	.insn	2, 0x030c
     588:	0900                	.insn	2, 0x0900
     58a:	0004                	.insn	2, 0x0004
     58c:	0501                	.insn	2, 0x0501
     58e:	0316                	.insn	2, 0x0316
     590:	0900                	.insn	2, 0x0900
     592:	0004                	.insn	2, 0x0004
     594:	0501                	.insn	2, 0x0501
     596:	0619                	.insn	2, 0x0619
     598:	10090303          	lb	t1,256(s2)
     59c:	0100                	.insn	2, 0x0100
     59e:	2505                	.insn	2, 0x2505
     5a0:	0306                	.insn	2, 0x0306
     5a2:	0900                	.insn	2, 0x0900
     5a4:	0004                	.insn	2, 0x0004
     5a6:	0501                	.insn	2, 0x0501
     5a8:	060a                	.insn	2, 0x060a
     5aa:	0c090103          	lb	sp,192(s2)
     5ae:	0100                	.insn	2, 0x0100
     5b0:	0905                	.insn	2, 0x0905
     5b2:	0306                	.insn	2, 0x0306
     5b4:	0900                	.insn	2, 0x0900
     5b6:	0004                	.insn	2, 0x0004
     5b8:	0501                	.insn	2, 0x0501
     5ba:	030a                	.insn	2, 0x030a
     5bc:	0900                	.insn	2, 0x0900
     5be:	0008                	.insn	2, 0x0008
     5c0:	0501                	.insn	2, 0x0501
     5c2:	0309                	.insn	2, 0x0309
     5c4:	0900                	.insn	2, 0x0900
     5c6:	0004                	.insn	2, 0x0004
     5c8:	0301                	.insn	2, 0x0301
     5ca:	7dc4                	.insn	2, 0x7dc4
     5cc:	0809                	.insn	2, 0x0809
     5ce:	0100                	.insn	2, 0x0100
     5d0:	1105                	.insn	2, 0x1105
     5d2:	0306                	.insn	2, 0x0306
     5d4:	040901d7          	.insn	4, 0x040901d7
     5d8:	0100                	.insn	2, 0x0100
     5da:	2c05                	.insn	2, 0x2c05
     5dc:	04090503          	lb	a0,64(s2)
     5e0:	0100                	.insn	2, 0x0100
     5e2:	2205                	.insn	2, 0x2205
     5e4:	0306                	.insn	2, 0x0306
     5e6:	0900                	.insn	2, 0x0900
     5e8:	0004                	.insn	2, 0x0004
     5ea:	0501                	.insn	2, 0x0501
     5ec:	060d                	.insn	2, 0x060d
     5ee:	08090103          	lb	sp,128(s2)
     5f2:	0100                	.insn	2, 0x0100
     5f4:	0306                	.insn	2, 0x0306
     5f6:	08097ea3          	.insn	4, 0x08097ea3
     5fa:	0100                	.insn	2, 0x0100
     5fc:	0306                	.insn	2, 0x0306
     5fe:	01c9                	.insn	2, 0x01c9
     600:	0809                	.insn	2, 0x0809
     602:	0100                	.insn	2, 0x0100
     604:	0306                	.insn	2, 0x0306
     606:	0c097eb7          	lui	t4,0xc097
     60a:	0100                	.insn	2, 0x0100
     60c:	1105                	.insn	2, 0x1105
     60e:	0306                	.insn	2, 0x0306
     610:	01e1                	.insn	2, 0x01e1
     612:	0809                	.insn	2, 0x0809
     614:	0100                	.insn	2, 0x0100
     616:	2c05                	.insn	2, 0x2c05
     618:	04090503          	lb	a0,64(s2)
     61c:	0100                	.insn	2, 0x0100
     61e:	2205                	.insn	2, 0x2205
     620:	0306                	.insn	2, 0x0306
     622:	0900                	.insn	2, 0x0900
     624:	0004                	.insn	2, 0x0004
     626:	0501                	.insn	2, 0x0501
     628:	0103061b          	.insn	4, 0x0103061b
     62c:	0c09                	.insn	2, 0x0c09
     62e:	0100                	.insn	2, 0x0100
     630:	1105                	.insn	2, 0x1105
     632:	0306                	.insn	2, 0x0306
     634:	0900                	.insn	2, 0x0900
     636:	0008                	.insn	2, 0x0008
     638:	0501                	.insn	2, 0x0501
     63a:	060d                	.insn	2, 0x060d
     63c:	08090403          	lb	s0,128(s2)
     640:	0100                	.insn	2, 0x0100
     642:	0306                	.insn	2, 0x0306
     644:	7e95                	.insn	2, 0x7e95
     646:	0c09                	.insn	2, 0x0c09
     648:	0100                	.insn	2, 0x0100
     64a:	1605                	.insn	2, 0x1605
     64c:	0306                	.insn	2, 0x0306
     64e:	02c1                	.insn	2, 0x02c1
     650:	1009                	.insn	2, 0x1009
     652:	0100                	.insn	2, 0x0100
     654:	0005                	.insn	2, 0x0005
     656:	0306                	.insn	2, 0x0306
     658:	08097dbf 0c050100 	.insn	8, 0x0c05010008097dbf
     660:	0306                	.insn	2, 0x0306
     662:	02be                	.insn	2, 0x02be
     664:	0409                	.insn	2, 0x0409
     666:	0100                	.insn	2, 0x0100
     668:	0005                	.insn	2, 0x0005
     66a:	0306                	.insn	2, 0x0306
     66c:	7dc2                	.insn	2, 0x7dc2
     66e:	0409                	.insn	2, 0x0409
     670:	0100                	.insn	2, 0x0100
     672:	1005                	.insn	2, 0x1005
     674:	0306                	.insn	2, 0x0306
     676:	02c5                	.insn	2, 0x02c5
     678:	0409                	.insn	2, 0x0409
     67a:	0100                	.insn	2, 0x0100
     67c:	1605                	.insn	2, 0x1605
     67e:	0306                	.insn	2, 0x0306
     680:	0900                	.insn	2, 0x0900
     682:	0004                	.insn	2, 0x0004
     684:	0501                	.insn	2, 0x0501
     686:	0605                	.insn	2, 0x0605
     688:	04097903          	.insn	4, 0x04097903
     68c:	0100                	.insn	2, 0x0100
     68e:	1605                	.insn	2, 0x1605
     690:	08090303          	lb	t1,128(s2)
     694:	0100                	.insn	2, 0x0100
     696:	1b05                	.insn	2, 0x1b05
     698:	10090103          	lb	sp,256(s2)
     69c:	0100                	.insn	2, 0x0100
     69e:	10090103          	lb	sp,256(s2)
     6a2:	0100                	.insn	2, 0x0100
     6a4:	0d05                	.insn	2, 0x0d05
     6a6:	097ee003          	.insn	4, 0x097ee003
     6aa:	0010                	.insn	2, 0x0010
     6ac:	0601                	.insn	2, 0x0601
     6ae:	097edd03          	lhu	s10,151(t4) # c097097 <USER_MAX+0xbb97097>
     6b2:	0008                	.insn	2, 0x0008
     6b4:	0501                	.insn	2, 0x0501
     6b6:	0611                	.insn	2, 0x0611
     6b8:	0901f003          	.insn	4, 0x0901f003
     6bc:	0004                	.insn	2, 0x0004
     6be:	0601                	.insn	2, 0x0601
     6c0:	10090003          	lb	zero,256(s2)
     6c4:	0100                	.insn	2, 0x0100
     6c6:	0005                	.insn	2, 0x0005
     6c8:	097e9003          	lh	zero,151(t4)
     6cc:	0004                	.insn	2, 0x0004
     6ce:	0501                	.insn	2, 0x0501
     6d0:	060d                	.insn	2, 0x060d
     6d2:	0901fe03          	.insn	4, 0x0901fe03
     6d6:	000c                	.insn	2, 0x000c
     6d8:	0601                	.insn	2, 0x0601
     6da:	097e8203          	lb	tp,151(t4)
     6de:	0008                	.insn	2, 0x0008
     6e0:	0501                	.insn	2, 0x0501
     6e2:	0611                	.insn	2, 0x0611
     6e4:	09028303          	lb	t1,144(t0) # 3194472 <USER_MAX+0x2c94472>
     6e8:	0008                	.insn	2, 0x0008
     6ea:	0501                	.insn	2, 0x0501
     6ec:	09050317          	auipc	t1,0x9050
     6f0:	0004                	.insn	2, 0x0004
     6f2:	0501                	.insn	2, 0x0501
     6f4:	060d                	.insn	2, 0x060d
     6f6:	04090003          	lb	zero,64(s2)
     6fa:	0100                	.insn	2, 0x0100
     6fc:	097df803          	.insn	4, 0x097df803
     700:	0008                	.insn	2, 0x0008
     702:	0501                	.insn	2, 0x0501
     704:	0632                	.insn	2, 0x0632
     706:	0901f503          	.insn	4, 0x0901f503
     70a:	0008                	.insn	2, 0x0008
     70c:	0601                	.insn	2, 0x0601
     70e:	097e8b03          	lb	s6,151(t4)
     712:	0008                	.insn	2, 0x0008
     714:	0501                	.insn	2, 0x0501
     716:	030d                	.insn	2, 0x030d
     718:	01f5                	.insn	2, 0x01f5
     71a:	0409                	.insn	2, 0x0409
     71c:	0100                	.insn	2, 0x0100
     71e:	3205                	.insn	2, 0x3205
     720:	0306                	.insn	2, 0x0306
     722:	0901                	.insn	2, 0x0901
     724:	0008                	.insn	2, 0x0008
     726:	0501                	.insn	2, 0x0501
     728:	060d                	.insn	2, 0x060d
     72a:	08090003          	lb	zero,128(s2)
     72e:	0100                	.insn	2, 0x0100
     730:	3205                	.insn	2, 0x3205
     732:	0306                	.insn	2, 0x0306
     734:	0901                	.insn	2, 0x0901
     736:	0008                	.insn	2, 0x0008
     738:	0501                	.insn	2, 0x0501
     73a:	060d                	.insn	2, 0x060d
     73c:	08090003          	lb	zero,128(s2)
     740:	0100                	.insn	2, 0x0100
     742:	3205                	.insn	2, 0x3205
     744:	0306                	.insn	2, 0x0306
     746:	0901                	.insn	2, 0x0901
     748:	0008                	.insn	2, 0x0008
     74a:	0501                	.insn	2, 0x0501
     74c:	060d                	.insn	2, 0x060d
     74e:	08090003          	lb	zero,128(s2)
     752:	0100                	.insn	2, 0x0100
     754:	3205                	.insn	2, 0x3205
     756:	0306                	.insn	2, 0x0306
     758:	0901                	.insn	2, 0x0901
     75a:	0008                	.insn	2, 0x0008
     75c:	0501                	.insn	2, 0x0501
     75e:	060d                	.insn	2, 0x060d
     760:	08090003          	lb	zero,128(s2)
     764:	0100                	.insn	2, 0x0100
     766:	097e8703          	lb	a4,151(t4)
     76a:	0008                	.insn	2, 0x0008
     76c:	0601                	.insn	2, 0x0601
     76e:	09028c03          	lb	s8,144(t0)
     772:	0008                	.insn	2, 0x0008
     774:	0601                	.insn	2, 0x0601
     776:	097df403          	.insn	4, 0x097df403
     77a:	0008                	.insn	2, 0x0008
     77c:	0601                	.insn	2, 0x0601
     77e:	09029903          	lh	s2,144(t0)
     782:	0004                	.insn	2, 0x0004
     784:	0501                	.insn	2, 0x0501
     786:	0a05                	.insn	2, 0x0a05
     788:	08091f03          	lh	t5,128(s2)
     78c:	0100                	.insn	2, 0x0100
     78e:	0c05                	.insn	2, 0x0c05
     790:	0306                	.insn	2, 0x0306
     792:	0900                	.insn	2, 0x0900
     794:	0014                	.insn	2, 0x0014
     796:	0501                	.insn	2, 0x0501
     798:	0316                	.insn	2, 0x0316
     79a:	0900                	.insn	2, 0x0900
     79c:	0004                	.insn	2, 0x0004
     79e:	0301                	.insn	2, 0x0301
     7a0:	7dc8                	.insn	2, 0x7dc8
     7a2:	0809                	.insn	2, 0x0809
     7a4:	0100                	.insn	2, 0x0100
     7a6:	0902b803          	.insn	4, 0x0902b803
     7aa:	0004                	.insn	2, 0x0004
     7ac:	0501                	.insn	2, 0x0501
     7ae:	0619                	.insn	2, 0x0619
     7b0:	04090303          	lb	t1,64(s2)
     7b4:	0100                	.insn	2, 0x0100
     7b6:	2505                	.insn	2, 0x2505
     7b8:	0306                	.insn	2, 0x0306
     7ba:	0900                	.insn	2, 0x0900
     7bc:	0004                	.insn	2, 0x0004
     7be:	0501                	.insn	2, 0x0501
     7c0:	060a                	.insn	2, 0x060a
     7c2:	0c090103          	lb	sp,192(s2)
     7c6:	0100                	.insn	2, 0x0100
     7c8:	0306                	.insn	2, 0x0306
     7ca:	7dc4                	.insn	2, 0x7dc4
     7cc:	0409                	.insn	2, 0x0409
     7ce:	0100                	.insn	2, 0x0100
     7d0:	0902bc03          	.insn	4, 0x0902bc03
     7d4:	0008                	.insn	2, 0x0008
     7d6:	0501                	.insn	2, 0x0501
     7d8:	0309                	.insn	2, 0x0309
     7da:	0900                	.insn	2, 0x0900
     7dc:	0004                	.insn	2, 0x0004
     7de:	0301                	.insn	2, 0x0301
     7e0:	7dc4                	.insn	2, 0x7dc4
     7e2:	0409                	.insn	2, 0x0409
     7e4:	0100                	.insn	2, 0x0100
     7e6:	0105                	.insn	2, 0x0105
     7e8:	0306                	.insn	2, 0x0306
     7ea:	02c9                	.insn	2, 0x02c9
     7ec:	0409                	.insn	2, 0x0409
     7ee:	0100                	.insn	2, 0x0100
     7f0:	0306                	.insn	2, 0x0306
     7f2:	04097db7          	lui	s11,0x4097
     7f6:	0100                	.insn	2, 0x0100
     7f8:	1605                	.insn	2, 0x1605
     7fa:	0306                	.insn	2, 0x0306
     7fc:	02c1                	.insn	2, 0x02c1
     7fe:	0c09                	.insn	2, 0x0c09
     800:	0100                	.insn	2, 0x0100
     802:	0005                	.insn	2, 0x0005
     804:	0306                	.insn	2, 0x0306
     806:	14097dbf 0c050100 	.insn	8, 0x0c05010014097dbf
     80e:	0306                	.insn	2, 0x0306
     810:	02be                	.insn	2, 0x02be
     812:	0409                	.insn	2, 0x0409
     814:	0100                	.insn	2, 0x0100
     816:	0005                	.insn	2, 0x0005
     818:	0306                	.insn	2, 0x0306
     81a:	7dc2                	.insn	2, 0x7dc2
     81c:	0409                	.insn	2, 0x0409
     81e:	0100                	.insn	2, 0x0100
     820:	1005                	.insn	2, 0x1005
     822:	0306                	.insn	2, 0x0306
     824:	02c5                	.insn	2, 0x02c5
     826:	0409                	.insn	2, 0x0409
     828:	0100                	.insn	2, 0x0100
     82a:	1605                	.insn	2, 0x1605
     82c:	0306                	.insn	2, 0x0306
     82e:	0900                	.insn	2, 0x0900
     830:	0004                	.insn	2, 0x0004
     832:	0501                	.insn	2, 0x0501
     834:	0605                	.insn	2, 0x0605
     836:	04097903          	.insn	4, 0x04097903
     83a:	0100                	.insn	2, 0x0100
     83c:	0306                	.insn	2, 0x0306
     83e:	7dc2                	.insn	2, 0x7dc2
     840:	0409                	.insn	2, 0x0409
     842:	0100                	.insn	2, 0x0100
     844:	1605                	.insn	2, 0x1605
     846:	0306                	.insn	2, 0x0306
     848:	02c1                	.insn	2, 0x02c1
     84a:	0409                	.insn	2, 0x0409
     84c:	0100                	.insn	2, 0x0100
     84e:	1b05                	.insn	2, 0x1b05
     850:	10090103          	lb	sp,256(s2)
     854:	0100                	.insn	2, 0x0100
     856:	10090103          	lb	sp,256(s2)
     85a:	0100                	.insn	2, 0x0100
     85c:	0306                	.insn	2, 0x0306
     85e:	7dbd                	.insn	2, 0x7dbd
     860:	1009                	.insn	2, 0x1009
     862:	0100                	.insn	2, 0x0100
     864:	0a05                	.insn	2, 0x0a05
     866:	0306                	.insn	2, 0x0306
     868:	040902c7          	.insn	4, 0x040902c7
     86c:	0100                	.insn	2, 0x0100
     86e:	0105                	.insn	2, 0x0105
     870:	04090203          	lb	tp,64(s2)
     874:	0100                	.insn	2, 0x0100
     876:	0005                	.insn	2, 0x0005
     878:	04095a03          	lhu	s4,64(s2)
     87c:	0100                	.insn	2, 0x0100
     87e:	0505                	.insn	2, 0x0505
     880:	030a                	.insn	2, 0x030a
     882:	0902                	.insn	2, 0x0902
     884:	0024                	.insn	2, 0x0024
     886:	0601                	.insn	2, 0x0601
     888:	097ddb03          	lhu	s6,151(s11) # 4097097 <USER_MAX+0x3b97097>
     88c:	0004                	.insn	2, 0x0004
     88e:	0501                	.insn	2, 0x0501
     890:	0325                	.insn	2, 0x0325
     892:	02a5                	.insn	2, 0x02a5
     894:	0c09                	.insn	2, 0x0c09
     896:	0100                	.insn	2, 0x0100
     898:	0505                	.insn	2, 0x0505
     89a:	04090003          	lb	zero,64(s2)
     89e:	0100                	.insn	2, 0x0100
     8a0:	0d05                	.insn	2, 0x0d05
     8a2:	0306                	.insn	2, 0x0306
     8a4:	0901                	.insn	2, 0x0901
     8a6:	0004                	.insn	2, 0x0004
     8a8:	0601                	.insn	2, 0x0601
     8aa:	097dda03          	lhu	s4,151(s11)
     8ae:	000c                	.insn	2, 0x000c
     8b0:	0601                	.insn	2, 0x0601
     8b2:	0902a703          	lw	a4,144(t0)
     8b6:	0004                	.insn	2, 0x0004
     8b8:	0501                	.insn	2, 0x0501
     8ba:	0312                	.insn	2, 0x0312
     8bc:	0901                	.insn	2, 0x0901
     8be:	0010                	.insn	2, 0x0010
     8c0:	0501                	.insn	2, 0x0501
     8c2:	031d                	.insn	2, 0x031d
     8c4:	0901                	.insn	2, 0x0901
     8c6:	0004                	.insn	2, 0x0004
     8c8:	0501                	.insn	2, 0x0501
     8ca:	0311                	.insn	2, 0x0311
     8cc:	0901                	.insn	2, 0x0901
     8ce:	0008                	.insn	2, 0x0008
     8d0:	0601                	.insn	2, 0x0601
     8d2:	097dd603          	lhu	a2,151(s11)
     8d6:	000c                	.insn	2, 0x000c
     8d8:	0501                	.insn	2, 0x0501
     8da:	0615                	.insn	2, 0x0615
     8dc:	0902ad03          	lw	s10,144(t0)
     8e0:	0004                	.insn	2, 0x0004
     8e2:	0501                	.insn	2, 0x0501
     8e4:	0609                	.insn	2, 0x0609
     8e6:	04090003          	lb	zero,64(s2)
     8ea:	0100                	.insn	2, 0x0100
     8ec:	0306                	.insn	2, 0x0306
     8ee:	0901                	.insn	2, 0x0901
     8f0:	0004                	.insn	2, 0x0004
     8f2:	0501                	.insn	2, 0x0501
     8f4:	0305                	.insn	2, 0x0305
     8f6:	0902                	.insn	2, 0x0902
     8f8:	000c                	.insn	2, 0x000c
     8fa:	0601                	.insn	2, 0x0601
     8fc:	097dd003          	lhu	zero,151(s11)
     900:	0018                	.insn	2, 0x0018
     902:	0b01                	.insn	2, 0x0b01
     904:	0902b003          	.insn	4, 0x0902b003
     908:	000c                	.insn	2, 0x000c
     90a:	0901                	.insn	2, 0x0901
     90c:	000c                	.insn	2, 0x000c
     90e:	0100                	.insn	2, 0x0100
     910:	                	.insn	2, 0xda01

00000911 <$d.11>:
     911:	07da                	.insn	2, 0x07da
     913:	0000                	.insn	2, 0x0000
     915:	0004                	.insn	2, 0x0004
     917:	0060                	.insn	2, 0x0060
     919:	0000                	.insn	2, 0x0000
     91b:	0101                	.insn	2, 0x0101
     91d:	fb01                	.insn	2, 0xfb01
     91f:	0d0e                	.insn	2, 0x0d0e
     921:	0100                	.insn	2, 0x0100
     923:	0101                	.insn	2, 0x0101
     925:	0001                	.insn	2, 0x0001
     927:	0000                	.insn	2, 0x0000
     929:	0001                	.insn	2, 0x0001
     92b:	0100                	.insn	2, 0x0100
     92d:	2f2e                	.insn	2, 0x2f2e
     92f:	00637273          	csrrci	tp,0x6,6
     933:	7273752f          	.insn	4, 0x7273752f
     937:	62696c2f          	.insn	4, 0x62696c2f
     93b:	766c6c2f          	.insn	4, 0x766c6c2f
     93f:	2d6d                	.insn	2, 0x2d6d
     941:	3831                	.insn	2, 0x3831
     943:	62696c2f          	.insn	4, 0x62696c2f
     947:	616c632f          	.insn	4, 0x616c632f
     94b:	676e                	.insn	2, 0x676e
     94d:	2f38312f          	.insn	4, 0x2f38312f
     951:	6e69                	.insn	2, 0x6e69
     953:	64756c63          	bltu	a0,t2,fab <$d.3+0x18a>
     957:	0065                	.insn	2, 0x0065
     959:	7500                	.insn	2, 0x7500
     95b:	2e726573          	csrrsi	a0,0x2e7,4
     95f:	00010063          	beqz	sp,95f <$d.5+0x15>
     963:	7300                	.insn	2, 0x7300
     965:	6474                	.insn	2, 0x6474
     967:	6e69                	.insn	2, 0x6e69
     969:	2e74                	.insn	2, 0x2e74
     96b:	0068                	.insn	2, 0x0068
     96d:	0002                	.insn	2, 0x0002
     96f:	7500                	.insn	2, 0x7500
     971:	2e726573          	csrrsi	a0,0x2e7,4
     975:	0068                	.insn	2, 0x0068
     977:	0001                	.insn	2, 0x0001
     979:	0000                	.insn	2, 0x0000
     97b:	0505                	.insn	2, 0x0505
     97d:	000a                	.insn	2, 0x000a
     97f:	0205                	.insn	2, 0x0205
     981:	0a90                	.insn	2, 0x0a90
     983:	0040                	.insn	2, 0x0040
     985:	03013f03          	.insn	4, 0x03013f03
     989:	00140913          	addi	s2,s0,1
     98d:	0501                	.insn	2, 0x0501
     98f:	0300                	.insn	2, 0x0300
     991:	0925                	.insn	2, 0x0925
     993:	0004                	.insn	2, 0x0004
     995:	0501                	.insn	2, 0x0501
     997:	0a05                	.insn	2, 0x0a05
     999:	08091203          	lh	tp,128(s2)
     99d:	0100                	.insn	2, 0x0100
     99f:	0306                	.insn	2, 0x0306
     9a1:	7ef6                	.insn	2, 0x7ef6
     9a3:	0409                	.insn	2, 0x0409
     9a5:	0100                	.insn	2, 0x0100
     9a7:	0905                	.insn	2, 0x0905
     9a9:	0306                	.insn	2, 0x0306
     9ab:	1409018b          	.insn	4, 0x1409018b
     9af:	0100                	.insn	2, 0x0100
     9b1:	1e05                	.insn	2, 0x1e05
     9b3:	1c090303          	lb	t1,448(s2)
     9b7:	0100                	.insn	2, 0x0100
     9b9:	1c05                	.insn	2, 0x1c05
     9bb:	0306                	.insn	2, 0x0306
     9bd:	0900                	.insn	2, 0x0900
     9bf:	0008                	.insn	2, 0x0008
     9c1:	0501                	.insn	2, 0x0501
     9c3:	061e                	.insn	2, 0x061e
     9c5:	04090103          	lb	sp,64(s2)
     9c9:	0100                	.insn	2, 0x0100
     9cb:	1c05                	.insn	2, 0x1c05
     9cd:	0306                	.insn	2, 0x0306
     9cf:	0900                	.insn	2, 0x0900
     9d1:	0004                	.insn	2, 0x0004
     9d3:	0501                	.insn	2, 0x0501
     9d5:	0620                	.insn	2, 0x0620
     9d7:	04097c03          	.insn	4, 0x04097c03
     9db:	0100                	.insn	2, 0x0100
     9dd:	2c05                	.insn	2, 0x2c05
     9df:	14097f03          	.insn	4, 0x14097f03
     9e3:	0100                	.insn	2, 0x0100
     9e5:	0505                	.insn	2, 0x0505
     9e7:	0306                	.insn	2, 0x0306
     9e9:	0900                	.insn	2, 0x0900
     9eb:	0004                	.insn	2, 0x0004
     9ed:	0301                	.insn	2, 0x0301
     9ef:	7ef6                	.insn	2, 0x7ef6
     9f1:	1009                	.insn	2, 0x1009
     9f3:	0100                	.insn	2, 0x0100
     9f5:	0306                	.insn	2, 0x0306
     9f7:	03ee                	.insn	2, 0x03ee
     9f9:	1009                	.insn	2, 0x1009
     9fb:	0100                	.insn	2, 0x0100
     9fd:	0306                	.insn	2, 0x0306
     9ff:	7c92                	.insn	2, 0x7c92
     a01:	1c09                	.insn	2, 0x1c09
     a03:	0100                	.insn	2, 0x0100
     a05:	0306                	.insn	2, 0x0306
     a07:	03b1                	.insn	2, 0x03b1
     a09:	0409                	.insn	2, 0x0409
     a0b:	0100                	.insn	2, 0x0100
     a0d:	0306                	.insn	2, 0x0306
     a0f:	0900                	.insn	2, 0x0900
     a11:	0010                	.insn	2, 0x0010
     a13:	0601                	.insn	2, 0x0601
     a15:	097df203          	.insn	4, 0x097df203
     a19:	000c                	.insn	2, 0x000c
     a1b:	0601                	.insn	2, 0x0601
     a1d:	097edd03          	lhu	s10,151(t4)
     a21:	0004                	.insn	2, 0x0004
     a23:	0501                	.insn	2, 0x0501
     a25:	0609                	.insn	2, 0x0609
     a27:	0901a403          	lw	s0,144(gp) # 4090090 <USER_MAX+0x3b90090>
     a2b:	0010                	.insn	2, 0x0010
     a2d:	0501                	.insn	2, 0x0501
     a2f:	031c                	.insn	2, 0x031c
     a31:	0901                	.insn	2, 0x0901
     a33:	0010                	.insn	2, 0x0010
     a35:	0501                	.insn	2, 0x0501
     a37:	0305                	.insn	2, 0x0305
     a39:	02b4                	.insn	2, 0x02b4
     a3b:	0409                	.insn	2, 0x0409
     a3d:	0100                	.insn	2, 0x0100
     a3f:	0c095803          	lhu	a6,192(s2)
     a43:	0100                	.insn	2, 0x0100
     a45:	2005                	.insn	2, 0x2005
     a47:	097df303          	.insn	4, 0x097df303
     a4b:	000c                	.insn	2, 0x000c
     a4d:	0501                	.insn	2, 0x0501
     a4f:	0305                	.insn	2, 0x0305
     a51:	028d                	.insn	2, 0x028d
     a53:	0809                	.insn	2, 0x0809
     a55:	0100                	.insn	2, 0x0100
     a57:	2c05                	.insn	2, 0x2c05
     a59:	097df203          	.insn	4, 0x097df203
     a5d:	000c                	.insn	2, 0x000c
     a5f:	0501                	.insn	2, 0x0501
     a61:	0605                	.insn	2, 0x0605
     a63:	04090003          	lb	zero,64(s2)
     a67:	0100                	.insn	2, 0x0100
     a69:	097edd03          	lhu	s10,151(t4)
     a6d:	000c                	.insn	2, 0x000c
     a6f:	0601                	.insn	2, 0x0601
     a71:	0903ee03          	.insn	4, 0x0903ee03
     a75:	0010                	.insn	2, 0x0010
     a77:	0301                	.insn	2, 0x0301
     a79:	00200943          	.insn	4, 0x00200943
     a7d:	0601                	.insn	2, 0x0601
     a7f:	10090003          	lb	zero,256(s2)
     a83:	0100                	.insn	2, 0x0100
     a85:	097ccf03          	lbu	t5,151(s9)
     a89:	000c                	.insn	2, 0x000c
     a8b:	0301                	.insn	2, 0x0301
     a8d:	03b1                	.insn	2, 0x03b1
     a8f:	0409                	.insn	2, 0x0409
     a91:	0100                	.insn	2, 0x0100
     a93:	10090003          	lb	zero,256(s2)
     a97:	0100                	.insn	2, 0x0100
     a99:	0c090003          	lb	zero,192(s2)
     a9d:	0100                	.insn	2, 0x0100
     a9f:	0306                	.insn	2, 0x0306
     aa1:	7dfe                	.insn	2, 0x7dfe
     aa3:	0c09                	.insn	2, 0x0c09
     aa5:	0100                	.insn	2, 0x0100
     aa7:	0306                	.insn	2, 0x0306
     aa9:	7ed1                	.insn	2, 0x7ed1
     aab:	0409                	.insn	2, 0x0409
     aad:	0100                	.insn	2, 0x0100
     aaf:	0905                	.insn	2, 0x0905
     ab1:	0306                	.insn	2, 0x0306
     ab3:	01b0                	.insn	2, 0x01b0
     ab5:	1409                	.insn	2, 0x1409
     ab7:	0100                	.insn	2, 0x0100
     ab9:	1c05                	.insn	2, 0x1c05
     abb:	10090103          	lb	sp,256(s2)
     abf:	0100                	.insn	2, 0x0100
     ac1:	0505                	.insn	2, 0x0505
     ac3:	0902a803          	lw	a6,144(t0)
     ac7:	0004                	.insn	2, 0x0004
     ac9:	0301                	.insn	2, 0x0301
     acb:	0958                	.insn	2, 0x0958
     acd:	000c                	.insn	2, 0x000c
     acf:	0501                	.insn	2, 0x0501
     ad1:	0320                	.insn	2, 0x0320
     ad3:	7dff                	.insn	2, 0x7dff
     ad5:	0c09                	.insn	2, 0x0c09
     ad7:	0100                	.insn	2, 0x0100
     ad9:	0505                	.insn	2, 0x0505
     adb:	09028103          	lb	sp,144(t0)
     adf:	0008                	.insn	2, 0x0008
     ae1:	0501                	.insn	2, 0x0501
     ae3:	032c                	.insn	2, 0x032c
     ae5:	7dfe                	.insn	2, 0x7dfe
     ae7:	0c09                	.insn	2, 0x0c09
     ae9:	0100                	.insn	2, 0x0100
     aeb:	0505                	.insn	2, 0x0505
     aed:	0306                	.insn	2, 0x0306
     aef:	0900                	.insn	2, 0x0900
     af1:	0004                	.insn	2, 0x0004
     af3:	0301                	.insn	2, 0x0301
     af5:	7ed1                	.insn	2, 0x7ed1
     af7:	0c09                	.insn	2, 0x0c09
     af9:	0100                	.insn	2, 0x0100
     afb:	0306                	.insn	2, 0x0306
     afd:	03b1                	.insn	2, 0x03b1
     aff:	0409                	.insn	2, 0x0409
     b01:	0100                	.insn	2, 0x0100
     b03:	0306                	.insn	2, 0x0306
     b05:	0900                	.insn	2, 0x0900
     b07:	0010                	.insn	2, 0x0010
     b09:	0301                	.insn	2, 0x0301
     b0b:	0900                	.insn	2, 0x0900
     b0d:	000c                	.insn	2, 0x000c
     b0f:	0301                	.insn	2, 0x0301
     b11:	10097ccf          	.insn	4, 0x10097ccf
     b15:	0100                	.insn	2, 0x0100
     b17:	0903b103          	.insn	4, 0x0903b103
     b1b:	0004                	.insn	2, 0x0004
     b1d:	0301                	.insn	2, 0x0301
     b1f:	0900                	.insn	2, 0x0900
     b21:	0010                	.insn	2, 0x0010
     b23:	0301                	.insn	2, 0x0301
     b25:	0900                	.insn	2, 0x0900
     b27:	000c                	.insn	2, 0x000c
     b29:	0301                	.insn	2, 0x0301
     b2b:	0c097ccf          	.insn	4, 0x0c097ccf
     b2f:	0100                	.insn	2, 0x0100
     b31:	0903b103          	.insn	4, 0x0903b103
     b35:	0004                	.insn	2, 0x0004
     b37:	0301                	.insn	2, 0x0301
     b39:	0900                	.insn	2, 0x0900
     b3b:	0010                	.insn	2, 0x0010
     b3d:	0301                	.insn	2, 0x0301
     b3f:	0900                	.insn	2, 0x0900
     b41:	000c                	.insn	2, 0x000c
     b43:	0601                	.insn	2, 0x0601
     b45:	097e8a03          	lb	s4,151(t4)
     b49:	000c                	.insn	2, 0x000c
     b4b:	0601                	.insn	2, 0x0601
     b4d:	097ec503          	lbu	a0,151(t4)
     b51:	0004                	.insn	2, 0x0004
     b53:	0501                	.insn	2, 0x0501
     b55:	061c                	.insn	2, 0x061c
     b57:	0901bd03          	.insn	4, 0x0901bd03
     b5b:	0018                	.insn	2, 0x0018
     b5d:	0501                	.insn	2, 0x0501
     b5f:	0305                	.insn	2, 0x0305
     b61:	029c                	.insn	2, 0x029c
     b63:	0409                	.insn	2, 0x0409
     b65:	0100                	.insn	2, 0x0100
     b67:	0c095803          	lhu	a6,192(s2)
     b6b:	0100                	.insn	2, 0x0100
     b6d:	2005                	.insn	2, 0x2005
     b6f:	097e8b03          	lb	s6,151(t4)
     b73:	000c                	.insn	2, 0x000c
     b75:	0501                	.insn	2, 0x0501
     b77:	0305                	.insn	2, 0x0305
     b79:	01f5                	.insn	2, 0x01f5
     b7b:	0c09                	.insn	2, 0x0c09
     b7d:	0100                	.insn	2, 0x0100
     b7f:	2c05                	.insn	2, 0x2c05
     b81:	097e8a03          	lb	s4,151(t4)
     b85:	000c                	.insn	2, 0x000c
     b87:	0501                	.insn	2, 0x0501
     b89:	0605                	.insn	2, 0x0605
     b8b:	04090003          	lb	zero,64(s2)
     b8f:	0100                	.insn	2, 0x0100
     b91:	097ec503          	lbu	a0,151(t4)
     b95:	0008                	.insn	2, 0x0008
     b97:	0601                	.insn	2, 0x0601
     b99:	0903b103          	.insn	4, 0x0903b103
     b9d:	0004                	.insn	2, 0x0004
     b9f:	0501                	.insn	2, 0x0501
     ba1:	0b01                	.insn	2, 0x0b01
     ba3:	097e9203          	lh	tp,151(t4)
     ba7:	000c                	.insn	2, 0x000c
     ba9:	0501                	.insn	2, 0x0501
     bab:	0300                	.insn	2, 0x0300
     bad:	01ed                	.insn	2, 0x01ed
     baf:	0809                	.insn	2, 0x0809
     bb1:	0100                	.insn	2, 0x0100
     bb3:	0505                	.insn	2, 0x0505
     bb5:	030a                	.insn	2, 0x030a
     bb7:	0901                	.insn	2, 0x0901
     bb9:	0004                	.insn	2, 0x0004
     bbb:	0501                	.insn	2, 0x0501
     bbd:	0301                	.insn	2, 0x0301
     bbf:	0908                	.insn	2, 0x0908
     bc1:	000c                	.insn	2, 0x000c
     bc3:	0501                	.insn	2, 0x0501
     bc5:	0300                	.insn	2, 0x0300
     bc7:	091f 0004 0501      	.insn	6, 0x05010004091f
     bcd:	0a05                	.insn	2, 0x0a05
     bcf:	04090103          	lb	sp,64(s2)
     bd3:	0100                	.insn	2, 0x0100
     bd5:	0105                	.insn	2, 0x0105
     bd7:	0c090803          	lb	a6,192(s2)
     bdb:	0100                	.insn	2, 0x0100
     bdd:	0505                	.insn	2, 0x0505
     bdf:	030a                	.insn	2, 0x030a
     be1:	0922                	.insn	2, 0x0922
     be3:	0004                	.insn	2, 0x0004
     be5:	0501                	.insn	2, 0x0501
     be7:	0301                	.insn	2, 0x0301
     be9:	08097dcb          	.insn	4, 0x08097dcb
     bed:	0100                	.insn	2, 0x0100
     bef:	0505                	.insn	2, 0x0505
     bf1:	030a                	.insn	2, 0x030a
     bf3:	02c5                	.insn	2, 0x02c5
     bf5:	0409                	.insn	2, 0x0409
     bf7:	0100                	.insn	2, 0x0100
     bf9:	0105                	.insn	2, 0x0105
     bfb:	097dc603          	lbu	a2,151(s11)
     bff:	0008                	.insn	2, 0x0008
     c01:	0501                	.insn	2, 0x0501
     c03:	0a05                	.insn	2, 0x0a05
     c05:	0902ba03          	.insn	4, 0x0902ba03
     c09:	0004                	.insn	2, 0x0004
     c0b:	0501                	.insn	2, 0x0501
     c0d:	0301                	.insn	2, 0x0301
     c0f:	7dd2                	.insn	2, 0x7dd2
     c11:	0809                	.insn	2, 0x0809
     c13:	0100                	.insn	2, 0x0100
     c15:	0505                	.insn	2, 0x0505
     c17:	030a                	.insn	2, 0x030a
     c19:	02d1                	.insn	2, 0x02d1
     c1b:	0409                	.insn	2, 0x0409
     c1d:	0100                	.insn	2, 0x0100
     c1f:	0105                	.insn	2, 0x0105
     c21:	097dbb03          	.insn	4, 0x097dbb03
     c25:	0008                	.insn	2, 0x0008
     c27:	0501                	.insn	2, 0x0501
     c29:	0a0c                	.insn	2, 0x0a0c
     c2b:	04090503          	lb	a0,64(s2)
     c2f:	0100                	.insn	2, 0x0100
     c31:	0505                	.insn	2, 0x0505
     c33:	0306                	.insn	2, 0x0306
     c35:	0900                	.insn	2, 0x0900
     c37:	0008                	.insn	2, 0x0008
     c39:	0301                	.insn	2, 0x0301
     c3b:	7e8a                	.insn	2, 0x7e8a
     c3d:	0809                	.insn	2, 0x0809
     c3f:	0100                	.insn	2, 0x0100
     c41:	0e05                	.insn	2, 0x0e05
     c43:	0306                	.insn	2, 0x0306
     c45:	040901f7          	.insn	4, 0x040901f7
     c49:	0100                	.insn	2, 0x0100
     c4b:	0c05                	.insn	2, 0x0c05
     c4d:	04097f03          	.insn	4, 0x04097f03
     c51:	0100                	.insn	2, 0x0100
     c53:	0b05                	.insn	2, 0x0b05
     c55:	04090103          	lb	sp,64(s2)
     c59:	0100                	.insn	2, 0x0100
     c5b:	0505                	.insn	2, 0x0505
     c5d:	04097f03          	.insn	4, 0x04097f03
     c61:	0100                	.insn	2, 0x0100
     c63:	0306                	.insn	2, 0x0306
     c65:	7e8a                	.insn	2, 0x7e8a
     c67:	0409                	.insn	2, 0x0409
     c69:	0100                	.insn	2, 0x0100
     c6b:	0901f603          	.insn	4, 0x0901f603
     c6f:	0004                	.insn	2, 0x0004
     c71:	0501                	.insn	2, 0x0501
     c73:	0608                	.insn	2, 0x0608
     c75:	04090203          	lb	tp,64(s2)
     c79:	0100                	.insn	2, 0x0100
     c7b:	0505                	.insn	2, 0x0505
     c7d:	04090103          	lb	sp,64(s2)
     c81:	0100                	.insn	2, 0x0100
     c83:	0c05                	.insn	2, 0x0c05
     c85:	030a                	.insn	2, 0x030a
     c87:	0904                	.insn	2, 0x0904
     c89:	0004                	.insn	2, 0x0004
     c8b:	0501                	.insn	2, 0x0501
     c8d:	0610                	.insn	2, 0x0610
     c8f:	04090003          	lb	zero,64(s2)
     c93:	0100                	.insn	2, 0x0100
     c95:	0505                	.insn	2, 0x0505
     c97:	04090003          	lb	zero,64(s2)
     c9b:	0100                	.insn	2, 0x0100
     c9d:	1305                	.insn	2, 0x1305
     c9f:	04090003          	lb	zero,64(s2)
     ca3:	0100                	.insn	2, 0x0100
     ca5:	0505                	.insn	2, 0x0505
     ca7:	08090003          	lb	zero,128(s2)
     cab:	0100                	.insn	2, 0x0100
     cad:	0c05                	.insn	2, 0x0c05
     caf:	04090003          	lb	zero,64(s2)
     cb3:	0100                	.insn	2, 0x0100
     cb5:	0b05                	.insn	2, 0x0b05
     cb7:	0306                	.insn	2, 0x0306
     cb9:	0904                	.insn	2, 0x0904
     cbb:	0004                	.insn	2, 0x0004
     cbd:	0501                	.insn	2, 0x0501
     cbf:	0310                	.insn	2, 0x0310
     cc1:	097c                	.insn	2, 0x097c
     cc3:	0004                	.insn	2, 0x0004
     cc5:	0501                	.insn	2, 0x0501
     cc7:	030c                	.insn	2, 0x030c
     cc9:	00080907          	.insn	4, 0x00080907
     ccd:	0601                	.insn	2, 0x0601
     ccf:	097dfc03          	.insn	4, 0x097dfc03
     cd3:	0008                	.insn	2, 0x0008
     cd5:	0501                	.insn	2, 0x0501
     cd7:	02840323          	sb	s0,38(s0)
     cdb:	0409                	.insn	2, 0x0409
     cdd:	0100                	.insn	2, 0x0100
     cdf:	2105                	.insn	2, 0x2105
     ce1:	04090003          	lb	zero,64(s2)
     ce5:	0100                	.insn	2, 0x0100
     ce7:	0505                	.insn	2, 0x0505
     ce9:	04090003          	lb	zero,64(s2)
     ced:	0100                	.insn	2, 0x0100
     cef:	0005                	.insn	2, 0x0005
     cf1:	0306                	.insn	2, 0x0306
     cf3:	00040903          	lb	s2,0(s0)
     cf7:	0501                	.insn	2, 0x0501
     cf9:	0a05                	.insn	2, 0x0a05
     cfb:	3c090203          	lb	tp,960(s2)
     cff:	0100                	.insn	2, 0x0100
     d01:	0d05                	.insn	2, 0x0d05
     d03:	44090503          	lb	a0,1088(s2)
     d07:	0100                	.insn	2, 0x0100
     d09:	0c05                	.insn	2, 0x0c05
     d0b:	04093c03          	.insn	4, 0x04093c03
     d0f:	0100                	.insn	2, 0x0100
     d11:	04094103          	lbu	sp,64(s2)
     d15:	0100                	.insn	2, 0x0100
     d17:	0505                	.insn	2, 0x0505
     d19:	0306                	.insn	2, 0x0306
     d1b:	0900                	.insn	2, 0x0900
     d1d:	0004                	.insn	2, 0x0004
     d1f:	0601                	.insn	2, 0x0601
     d21:	0901a603          	lw	a2,144(gp)
     d25:	0008                	.insn	2, 0x0008
     d27:	0501                	.insn	2, 0x0501
     d29:	030c                	.insn	2, 0x030c
     d2b:	7f99                	.insn	2, 0x7f99
     d2d:	0c09                	.insn	2, 0x0c09
     d2f:	0100                	.insn	2, 0x0100
     d31:	0306                	.insn	2, 0x0306
     d33:	7db6                	.insn	2, 0x7db6
     d35:	0409                	.insn	2, 0x0409
     d37:	0100                	.insn	2, 0x0100
     d39:	1505                	.insn	2, 0x1505
     d3b:	0306                	.insn	2, 0x0306
     d3d:	028e                	.insn	2, 0x028e
     d3f:	0409                	.insn	2, 0x0409
     d41:	0100                	.insn	2, 0x0100
     d43:	1005                	.insn	2, 0x1005
     d45:	04097f03          	.insn	4, 0x04097f03
     d49:	0100                	.insn	2, 0x0100
     d4b:	0d05                	.insn	2, 0x0d05
     d4d:	04090103          	lb	sp,64(s2)
     d51:	0100                	.insn	2, 0x0100
     d53:	2105                	.insn	2, 0x2105
     d55:	0c091003          	lh	zero,192(s2)
     d59:	0100                	.insn	2, 0x0100
     d5b:	1905                	.insn	2, 0x1905
     d5d:	10090303          	lb	t1,256(s2)
     d61:	0100                	.insn	2, 0x0100
     d63:	04090d03          	lb	s10,64(s2)
     d67:	0100                	.insn	2, 0x0100
     d69:	0505                	.insn	2, 0x0505
     d6b:	09018303          	lb	t1,144(gp)
     d6f:	0004                	.insn	2, 0x0004
     d71:	0501                	.insn	2, 0x0501
     d73:	030c                	.insn	2, 0x030c
     d75:	7f99                	.insn	2, 0x7f99
     d77:	0c09                	.insn	2, 0x0c09
     d79:	0100                	.insn	2, 0x0100
     d7b:	0306                	.insn	2, 0x0306
     d7d:	7db6                	.insn	2, 0x7db6
     d7f:	0409                	.insn	2, 0x0409
     d81:	0100                	.insn	2, 0x0100
     d83:	0d05                	.insn	2, 0x0d05
     d85:	0306                	.insn	2, 0x0306
     d87:	028e                	.insn	2, 0x028e
     d89:	0409                	.insn	2, 0x0409
     d8b:	0100                	.insn	2, 0x0100
     d8d:	2605                	.insn	2, 0x2605
     d8f:	08093103          	.insn	4, 0x08093103
     d93:	0100                	.insn	2, 0x0100
     d95:	3205                	.insn	2, 0x3205
     d97:	10090203          	lb	tp,256(s2)
     d9b:	0100                	.insn	2, 0x0100
     d9d:	2105                	.insn	2, 0x2105
     d9f:	04090103          	lb	sp,64(s2)
     da3:	0100                	.insn	2, 0x0100
     da5:	0505                	.insn	2, 0x0505
     da7:	0900ef03          	.insn	4, 0x0900ef03
     dab:	0008                	.insn	2, 0x0008
     dad:	0501                	.insn	2, 0x0501
     daf:	033e                	.insn	2, 0x033e
     db1:	7f90                	.insn	2, 0x7f90
     db3:	0c09                	.insn	2, 0x0c09
     db5:	0100                	.insn	2, 0x0100
     db7:	2105                	.insn	2, 0x2105
     db9:	08090103          	lb	sp,128(s2)
     dbd:	0100                	.insn	2, 0x0100
     dbf:	0505                	.insn	2, 0x0505
     dc1:	0900ef03          	.insn	4, 0x0900ef03
     dc5:	0008                	.insn	2, 0x0008
     dc7:	0501                	.insn	2, 0x0501
     dc9:	033e                	.insn	2, 0x033e
     dcb:	7f90                	.insn	2, 0x7f90
     dcd:	0c09                	.insn	2, 0x0c09
     dcf:	0100                	.insn	2, 0x0100
     dd1:	2105                	.insn	2, 0x2105
     dd3:	08090103          	lb	sp,128(s2)
     dd7:	0100                	.insn	2, 0x0100
     dd9:	0505                	.insn	2, 0x0505
     ddb:	0900ef03          	.insn	4, 0x0900ef03
     ddf:	0008                	.insn	2, 0x0008
     de1:	0501                	.insn	2, 0x0501
     de3:	033e                	.insn	2, 0x033e
     de5:	7f90                	.insn	2, 0x7f90
     de7:	0c09                	.insn	2, 0x0c09
     de9:	0100                	.insn	2, 0x0100
     deb:	2105                	.insn	2, 0x2105
     ded:	08090103          	lb	sp,128(s2)
     df1:	0100                	.insn	2, 0x0100
     df3:	0505                	.insn	2, 0x0505
     df5:	0900ef03          	.insn	4, 0x0900ef03
     df9:	0008                	.insn	2, 0x0008
     dfb:	0501                	.insn	2, 0x0501
     dfd:	033e                	.insn	2, 0x033e
     dff:	7f90                	.insn	2, 0x7f90
     e01:	0c09                	.insn	2, 0x0c09
     e03:	0100                	.insn	2, 0x0100
     e05:	2105                	.insn	2, 0x2105
     e07:	08090103          	lb	sp,128(s2)
     e0b:	0100                	.insn	2, 0x0100
     e0d:	0505                	.insn	2, 0x0505
     e0f:	0900ef03          	.insn	4, 0x0900ef03
     e13:	0008                	.insn	2, 0x0008
     e15:	0501                	.insn	2, 0x0501
     e17:	033e                	.insn	2, 0x033e
     e19:	7f90                	.insn	2, 0x7f90
     e1b:	0c09                	.insn	2, 0x0c09
     e1d:	0100                	.insn	2, 0x0100
     e1f:	2105                	.insn	2, 0x2105
     e21:	08090103          	lb	sp,128(s2)
     e25:	0100                	.insn	2, 0x0100
     e27:	0505                	.insn	2, 0x0505
     e29:	0900ef03          	.insn	4, 0x0900ef03
     e2d:	0008                	.insn	2, 0x0008
     e2f:	0501                	.insn	2, 0x0501
     e31:	033e                	.insn	2, 0x033e
     e33:	7f90                	.insn	2, 0x7f90
     e35:	0c09                	.insn	2, 0x0c09
     e37:	0100                	.insn	2, 0x0100
     e39:	2105                	.insn	2, 0x2105
     e3b:	08090103          	lb	sp,128(s2)
     e3f:	0100                	.insn	2, 0x0100
     e41:	0505                	.insn	2, 0x0505
     e43:	0900ef03          	.insn	4, 0x0900ef03
     e47:	0008                	.insn	2, 0x0008
     e49:	0501                	.insn	2, 0x0501
     e4b:	033e                	.insn	2, 0x033e
     e4d:	7f90                	.insn	2, 0x7f90
     e4f:	0c09                	.insn	2, 0x0c09
     e51:	0100                	.insn	2, 0x0100
     e53:	2105                	.insn	2, 0x2105
     e55:	04090103          	lb	sp,64(s2)
     e59:	0100                	.insn	2, 0x0100
     e5b:	0505                	.insn	2, 0x0505
     e5d:	0900ef03          	.insn	4, 0x0900ef03
     e61:	0008                	.insn	2, 0x0008
     e63:	0501                	.insn	2, 0x0501
     e65:	030c                	.insn	2, 0x030c
     e67:	7f99                	.insn	2, 0x7f99
     e69:	0c09                	.insn	2, 0x0c09
     e6b:	0100                	.insn	2, 0x0100
     e6d:	0306                	.insn	2, 0x0306
     e6f:	7db6                	.insn	2, 0x7db6
     e71:	0409                	.insn	2, 0x0409
     e73:	0100                	.insn	2, 0x0100
     e75:	0505                	.insn	2, 0x0505
     e77:	0306                	.insn	2, 0x0306
     e79:	03b1                	.insn	2, 0x03b1
     e7b:	0409                	.insn	2, 0x0409
     e7d:	0100                	.insn	2, 0x0100
     e7f:	0c05                	.insn	2, 0x0c05
     e81:	097f9903          	lh	s2,151(t6)
     e85:	000c                	.insn	2, 0x000c
     e87:	0601                	.insn	2, 0x0601
     e89:	097db603          	.insn	4, 0x097db603
     e8d:	0004                	.insn	2, 0x0004
     e8f:	0501                	.insn	2, 0x0501
     e91:	0625                	.insn	2, 0x0625
     e93:	09029603          	lh	a2,144(t0)
     e97:	0004                	.insn	2, 0x0004
     e99:	0501                	.insn	2, 0x0501
     e9b:	031c                	.insn	2, 0x031c
     e9d:	0901                	.insn	2, 0x0901
     e9f:	0010                	.insn	2, 0x0010
     ea1:	0501                	.insn	2, 0x0501
     ea3:	0615                	.insn	2, 0x0615
     ea5:	04090003          	lb	zero,64(s2)
     ea9:	0100                	.insn	2, 0x0100
     eab:	0505                	.insn	2, 0x0505
     ead:	0306                	.insn	2, 0x0306
     eaf:	019a                	.insn	2, 0x019a
     eb1:	0809                	.insn	2, 0x0809
     eb3:	0100                	.insn	2, 0x0100
     eb5:	1c05                	.insn	2, 0x1c05
     eb7:	097ee603          	.insn	4, 0x097ee603
     ebb:	000c                	.insn	2, 0x000c
     ebd:	0501                	.insn	2, 0x0501
     ebf:	0615                	.insn	2, 0x0615
     ec1:	04090003          	lb	zero,64(s2)
     ec5:	0100                	.insn	2, 0x0100
     ec7:	0505                	.insn	2, 0x0505
     ec9:	0306                	.insn	2, 0x0306
     ecb:	019a                	.insn	2, 0x019a
     ecd:	0c09                	.insn	2, 0x0c09
     ecf:	0100                	.insn	2, 0x0100
     ed1:	3a05                	.insn	2, 0x3a05
     ed3:	097ef303          	.insn	4, 0x097ef303
     ed7:	000c                	.insn	2, 0x000c
     ed9:	0601                	.insn	2, 0x0601
     edb:	097ddc03          	lhu	s8,151(s11)
     edf:	0004                	.insn	2, 0x0004
     ee1:	0501                	.insn	2, 0x0501
     ee3:	b503061b          	.insn	4, 0xb503061b
     ee7:	0902                	.insn	2, 0x0902
     ee9:	000c                	.insn	2, 0x000c
     eeb:	0601                	.insn	2, 0x0601
     eed:	097dcb03          	lbu	s6,151(s11)
     ef1:	0008                	.insn	2, 0x0008
     ef3:	0501                	.insn	2, 0x0501
     ef5:	0624                	.insn	2, 0x0624
     ef7:	0902b403          	.insn	4, 0x0902b403
     efb:	0008                	.insn	2, 0x0008
     efd:	0501                	.insn	2, 0x0501
     eff:	061e                	.insn	2, 0x061e
     f01:	04090003          	lb	zero,64(s2)
     f05:	0100                	.insn	2, 0x0100
     f07:	2205                	.insn	2, 0x2205
     f09:	04090003          	lb	zero,64(s2)
     f0d:	0100                	.insn	2, 0x0100
     f0f:	1505                	.insn	2, 0x1505
     f11:	0306                	.insn	2, 0x0306
     f13:	097f 0008 0501 0321 	.insn	10, 0x0907032105010008097f
     f1b:	0907 
     f1d:	0004                	.insn	2, 0x0004
     f1f:	0501                	.insn	2, 0x0501
     f21:	0305                	.insn	2, 0x0305
     f23:	080900f7          	.insn	4, 0x080900f7
     f27:	0100                	.insn	2, 0x0100
     f29:	1e05                	.insn	2, 0x1e05
     f2b:	097f8803          	lb	a6,151(t6)
     f2f:	000c                	.insn	2, 0x000c
     f31:	0501                	.insn	2, 0x0501
     f33:	0615                	.insn	2, 0x0615
     f35:	08090003          	lb	zero,128(s2)
     f39:	0100                	.insn	2, 0x0100
     f3b:	097dc703          	lbu	a4,151(s11)
     f3f:	0008                	.insn	2, 0x0008
     f41:	0501                	.insn	2, 0x0501
     f43:	0605                	.insn	2, 0x0605
     f45:	0903b103          	.insn	4, 0x0903b103
     f49:	0004                	.insn	2, 0x0004
     f4b:	0601                	.insn	2, 0x0601
     f4d:	097ccf03          	lbu	t5,151(s9)
     f51:	000c                	.insn	2, 0x000c
     f53:	0501                	.insn	2, 0x0501
     f55:	0601                	.insn	2, 0x0601
     f57:	02cf030b          	.insn	4, 0x02cf030b
     f5b:	1409                	.insn	2, 0x1409
     f5d:	0100                	.insn	2, 0x0100
     f5f:	0005                	.insn	2, 0x0005
     f61:	08090603          	lb	a2,128(s2)
     f65:	0100                	.insn	2, 0x0100
     f67:	0a05                	.insn	2, 0x0a05
     f69:	030a                	.insn	2, 0x030a
     f6b:	0902                	.insn	2, 0x0902
     f6d:	0004                	.insn	2, 0x0004
     f6f:	0501                	.insn	2, 0x0501
     f71:	00030617          	auipc	a2,0x30
     f75:	0c09                	.insn	2, 0x0c09
     f77:	0100                	.insn	2, 0x0100
     f79:	1b05                	.insn	2, 0x1b05
     f7b:	04090003          	lb	zero,64(s2)
     f7f:	0100                	.insn	2, 0x0100
     f81:	2705                	.insn	2, 0x2705
     f83:	04090003          	lb	zero,64(s2)
     f87:	0100                	.insn	2, 0x0100
     f89:	0c05                	.insn	2, 0x0c05
     f8b:	0306                	.insn	2, 0x0306
     f8d:	0905                	.insn	2, 0x0905
     f8f:	000c                	.insn	2, 0x000c
     f91:	0501                	.insn	2, 0x0501
     f93:	097d030b          	.insn	4, 0x097d030b
     f97:	0004                	.insn	2, 0x0004
     f99:	0601                	.insn	2, 0x0601
     f9b:	097da703          	lw	a4,151(s11)
     f9f:	0004                	.insn	2, 0x0004
     fa1:	0501                	.insn	2, 0x0501
     fa3:	0605                	.insn	2, 0x0605
     fa5:	0902dc03          	lhu	s8,144(t0)
     fa9:	0008                	.insn	2, 0x0008
     fab:	0601                	.insn	2, 0x0601
     fad:	097da403          	lw	s0,151(s11)
     fb1:	0008                	.insn	2, 0x0008
     fb3:	0501                	.insn	2, 0x0501
     fb5:	0616                	.insn	2, 0x0616
     fb7:	0902df03          	lhu	t5,144(t0)
     fbb:	0008                	.insn	2, 0x0008
     fbd:	0601                	.insn	2, 0x0601
     fbf:	097da103          	lw	sp,151(s11)
     fc3:	0004                	.insn	2, 0x0004
     fc5:	0301                	.insn	2, 0x0301
     fc7:	02df 0c09 0100      	.insn	6, 0x01000c0902df
     fcd:	1b05                	.insn	2, 0x1b05
     fcf:	0306                	.insn	2, 0x0306
     fd1:	0901                	.insn	2, 0x0901
     fd3:	0010                	.insn	2, 0x0010
     fd5:	0301                	.insn	2, 0x0301
     fd7:	0901                	.insn	2, 0x0901
     fd9:	0010                	.insn	2, 0x0010
     fdb:	0501                	.insn	2, 0x0501
     fdd:	0600                	.insn	2, 0x0600
     fdf:	097d9f03          	lh	t5,151(s11)
     fe3:	0010                	.insn	2, 0x0010
     fe5:	0501                	.insn	2, 0x0501
     fe7:	060d                	.insn	2, 0x060d
     fe9:	0902e303          	.insn	4, 0x0902e303
     fed:	0008                	.insn	2, 0x0008
     fef:	0501                	.insn	2, 0x0501
     ff1:	030c                	.insn	2, 0x030c
     ff3:	0979                	.insn	2, 0x0979
     ff5:	0004                	.insn	2, 0x0004
     ff7:	0501                	.insn	2, 0x0501
     ff9:	0908030f          	.insn	4, 0x0908030f
     ffd:	0004                	.insn	2, 0x0004
     fff:	0501                	.insn	2, 0x0501
    1001:	0616                	.insn	2, 0x0616
    1003:	04090003          	lb	zero,64(s2)
    1007:	0100                	.insn	2, 0x0100
    1009:	0505                	.insn	2, 0x0505
    100b:	0306                	.insn	2, 0x0306
    100d:	0978                	.insn	2, 0x0978
    100f:	0004                	.insn	2, 0x0004
    1011:	0301                	.insn	2, 0x0301
    1013:	090a                	.insn	2, 0x090a
    1015:	0008                	.insn	2, 0x0008
    1017:	0501                	.insn	2, 0x0501
    1019:	0300                	.insn	2, 0x0300
    101b:	0905                	.insn	2, 0x0905
    101d:	0004                	.insn	2, 0x0004
    101f:	0501                	.insn	2, 0x0501
    1021:	0a09                	.insn	2, 0x0a09
    1023:	04090103          	lb	sp,64(s2)
    1027:	0100                	.insn	2, 0x0100
    1029:	0306                	.insn	2, 0x0306
    102b:	7d94                	.insn	2, 0x7d94
    102d:	0409                	.insn	2, 0x0409
    102f:	0100                	.insn	2, 0x0100
    1031:	0105                	.insn	2, 0x0105
    1033:	0306                	.insn	2, 0x0306
    1035:	040902f3          	.insn	4, 0x040902f3
    1039:	0100                	.insn	2, 0x0100
    103b:	0306                	.insn	2, 0x0306
    103d:	7d8d                	.insn	2, 0x7d8d
    103f:	1809                	.insn	2, 0x1809
    1041:	0100                	.insn	2, 0x0100
    1043:	0505                	.insn	2, 0x0505
    1045:	0306                	.insn	2, 0x0306
    1047:	02ee                	.insn	2, 0x02ee
    1049:	0809                	.insn	2, 0x0809
    104b:	0100                	.insn	2, 0x0100
    104d:	0306                	.insn	2, 0x0306
    104f:	7d92                	.insn	2, 0x7d92
    1051:	0409                	.insn	2, 0x0409
    1053:	0100                	.insn	2, 0x0100
    1055:	0f05                	.insn	2, 0x0f05
    1057:	0306                	.insn	2, 0x0306
    1059:	040902ef          	jal	t0,91099 <$d.5+0x8fc48>
    105d:	0100                	.insn	2, 0x0100
    105f:	0d05                	.insn	2, 0x0d05
    1061:	0306                	.insn	2, 0x0306
    1063:	0900                	.insn	2, 0x0900
    1065:	0010                	.insn	2, 0x0010
    1067:	0501                	.insn	2, 0x0501
    1069:	7f030627          	.insn	4, 0x7f030627
    106d:	0409                	.insn	2, 0x0409
    106f:	0100                	.insn	2, 0x0100
    1071:	1c05                	.insn	2, 0x1c05
    1073:	0306                	.insn	2, 0x0306
    1075:	0900                	.insn	2, 0x0900
    1077:	0004                	.insn	2, 0x0004
    1079:	0501                	.insn	2, 0x0501
    107b:	0305                	.insn	2, 0x0305
    107d:	0900                	.insn	2, 0x0900
    107f:	0004                	.insn	2, 0x0004
    1081:	0501                	.insn	2, 0x0501
    1083:	01030613          	addi	a2,t1,16 # 90506fc <USER_MAX+0x8b506fc>
    1087:	0409                	.insn	2, 0x0409
    1089:	0100                	.insn	2, 0x0100
    108b:	0306                	.insn	2, 0x0306
    108d:	7d91                	.insn	2, 0x7d91
    108f:	0409                	.insn	2, 0x0409
    1091:	0100                	.insn	2, 0x0100
    1093:	0105                	.insn	2, 0x0105
    1095:	0306                	.insn	2, 0x0306
    1097:	100902f3          	.insn	4, 0x100902f3
    109b:	0100                	.insn	2, 0x0100
    109d:	0505                	.insn	2, 0x0505
    109f:	030a                	.insn	2, 0x030a
    10a1:	040900cb          	.insn	4, 0x040900cb
    10a5:	0100                	.insn	2, 0x0100
    10a7:	0c090803          	lb	a6,192(s2)
    10ab:	0100                	.insn	2, 0x0100
    10ad:	030a                	.insn	2, 0x030a
    10af:	0906                	.insn	2, 0x0906
    10b1:	0008                	.insn	2, 0x0008
    10b3:	0301                	.insn	2, 0x0301
    10b5:	0908                	.insn	2, 0x0908
    10b7:	000c                	.insn	2, 0x000c
    10b9:	0a01                	.insn	2, 0x0a01
    10bb:	0900cf03          	lbu	t5,144(ra)
    10bf:	0008                	.insn	2, 0x0008
    10c1:	0301                	.insn	2, 0x0301
    10c3:	00080907          	.insn	4, 0x00080907
    10c7:	0a01                	.insn	2, 0x0a01
    10c9:	04091c03          	lh	s8,64(s2)
    10cd:	0100                	.insn	2, 0x0100
    10cf:	08090703          	lb	a4,128(s2)
    10d3:	0100                	.insn	2, 0x0100
    10d5:	0409                	.insn	2, 0x0409
    10d7:	0000                	.insn	2, 0x0000
    10d9:	0101                	.insn	2, 0x0101
    10db:	0505                	.insn	2, 0x0505
    10dd:	000a                	.insn	2, 0x000a
    10df:	0205                	.insn	2, 0x0205
    10e1:	0000                	.insn	2, 0x0000
    10e3:	0040                	.insn	2, 0x0040
    10e5:	0104d303          	lhu	t1,16(s1)
    10e9:	1c09                	.insn	2, 0x1c09
    10eb:	0000                	.insn	2, 0x0000
    10ed:	0101                	.insn	2, 0x0101

000010ef <$d.11>:
    10ef:	0944                	.insn	2, 0x0944
    10f1:	0000                	.insn	2, 0x0000
    10f3:	0004                	.insn	2, 0x0004
    10f5:	003a                	.insn	2, 0x003a
    10f7:	0000                	.insn	2, 0x0000
    10f9:	0101                	.insn	2, 0x0101
    10fb:	fb01                	.insn	2, 0xfb01
    10fd:	0d0e                	.insn	2, 0x0d0e
    10ff:	0100                	.insn	2, 0x0100
    1101:	0101                	.insn	2, 0x0101
    1103:	0001                	.insn	2, 0x0001
    1105:	0000                	.insn	2, 0x0000
    1107:	0001                	.insn	2, 0x0001
    1109:	0100                	.insn	2, 0x0100
    110b:	2f2e                	.insn	2, 0x2f2e
    110d:	00637273          	csrrci	tp,0x6,6
    1111:	6600                	.insn	2, 0x6600
    1113:	7461                	.insn	2, 0x7461
    1115:	632e3233          	.insn	4, 0x632e3233
    1119:	0100                	.insn	2, 0x0100
    111b:	0000                	.insn	2, 0x0000
    111d:	7375                	.insn	2, 0x7375
    111f:	7265                	.insn	2, 0x7265
    1121:	682e                	.insn	2, 0x682e
    1123:	0100                	.insn	2, 0x0100
    1125:	0000                	.insn	2, 0x0000
    1127:	6166                	.insn	2, 0x6166
    1129:	3374                	.insn	2, 0x3374
    112b:	2e32                	.insn	2, 0x2e32
    112d:	0068                	.insn	2, 0x0068
    112f:	0001                	.insn	2, 0x0001
    1131:	0000                	.insn	2, 0x0000
    1133:	0500                	.insn	2, 0x0500
    1135:	8802                	.insn	2, 0x8802
    1137:	4012                	.insn	2, 0x4012
    1139:	1900                	.insn	2, 0x1900
    113b:	0905                	.insn	2, 0x0905
    113d:	030a                	.insn	2, 0x030a
    113f:	0906                	.insn	2, 0x0906
    1141:	0014                	.insn	2, 0x0014
    1143:	0601                	.insn	2, 0x0601
    1145:	10090003          	lb	zero,256(s2)
    1149:	0100                	.insn	2, 0x0100
    114b:	0306                	.insn	2, 0x0306
    114d:	00040903          	lb	s2,0(s0)
    1151:	0601                	.insn	2, 0x0601
    1153:	14090003          	lb	zero,320(s2)
    1157:	0100                	.insn	2, 0x0100
    1159:	0306                	.insn	2, 0x0306
    115b:	0901                	.insn	2, 0x0901
    115d:	0004                	.insn	2, 0x0004
    115f:	0601                	.insn	2, 0x0601
    1161:	10096e03          	.insn	4, 0x10096e03
    1165:	0100                	.insn	2, 0x0100
    1167:	1805                	.insn	2, 0x1805
    1169:	0306                	.insn	2, 0x0306
    116b:	00080917          	auipc	s2,0x80
    116f:	0501                	.insn	2, 0x0501
    1171:	0314                	.insn	2, 0x0314
    1173:	00e4                	.insn	2, 0x00e4
    1175:	0409                	.insn	2, 0x0409
    1177:	0100                	.insn	2, 0x0100
    1179:	08090203          	lb	tp,128(s2) # 811eb <$d.5+0x7fd9a>
    117d:	0100                	.insn	2, 0x0100
    117f:	04097e03          	.insn	4, 0x04097e03
    1183:	0100                	.insn	2, 0x0100
    1185:	1505                	.insn	2, 0x1505
    1187:	04090103          	lb	sp,64(s2)
    118b:	0100                	.insn	2, 0x0100
    118d:	1a05                	.insn	2, 0x1a05
    118f:	0306                	.insn	2, 0x0306
    1191:	0900                	.insn	2, 0x0900
    1193:	0004                	.insn	2, 0x0004
    1195:	0501                	.insn	2, 0x0501
    1197:	061f 7f03 0409      	.insn	6, 0x04097f03061f
    119d:	0100                	.insn	2, 0x0100
    119f:	0905                	.insn	2, 0x0905
    11a1:	097f9e03          	lh	t3,151(t6)
    11a5:	0004                	.insn	2, 0x0004
    11a7:	0601                	.insn	2, 0x0601
    11a9:	14090003          	lb	zero,320(s2)
    11ad:	0100                	.insn	2, 0x0100
    11af:	04096703          	.insn	4, 0x04096703
    11b3:	0100                	.insn	2, 0x0100
    11b5:	0505                	.insn	2, 0x0505
    11b7:	0306                	.insn	2, 0x0306
    11b9:	091c                	.insn	2, 0x091c
    11bb:	0004                	.insn	2, 0x0004
    11bd:	0601                	.insn	2, 0x0601
    11bf:	10096403          	.insn	4, 0x10096403
    11c3:	0100                	.insn	2, 0x0100
    11c5:	08091c03          	lh	s8,128(s2)
    11c9:	0100                	.insn	2, 0x0100
    11cb:	1105                	.insn	2, 0x1105
    11cd:	0306                	.insn	2, 0x0306
    11cf:	0905                	.insn	2, 0x0905
    11d1:	0008                	.insn	2, 0x0008
    11d3:	0501                	.insn	2, 0x0501
    11d5:	0609                	.insn	2, 0x0609
    11d7:	04090003          	lb	zero,64(s2)
    11db:	0100                	.insn	2, 0x0100
    11dd:	0505                	.insn	2, 0x0505
    11df:	0306                	.insn	2, 0x0306
    11e1:	0008097b          	.insn	4, 0x0008097b
    11e5:	0301                	.insn	2, 0x0301
    11e7:	0908                	.insn	2, 0x0908
    11e9:	0008                	.insn	2, 0x0008
    11eb:	0601                	.insn	2, 0x0601
    11ed:	0c095c03          	lhu	s8,192(s2)
    11f1:	0100                	.insn	2, 0x0100
    11f3:	0105                	.insn	2, 0x0105
    11f5:	0b06                	.insn	2, 0x0b06
    11f7:	10092703          	lw	a4,256(s2)
    11fb:	0100                	.insn	2, 0x0100
    11fd:	0005                	.insn	2, 0x0005
    11ff:	0900da03          	lhu	s4,144(ra)
    1203:	0008                	.insn	2, 0x0008
    1205:	0501                	.insn	2, 0x0501
    1207:	0a09                	.insn	2, 0x0a09
    1209:	14090303          	lb	t1,320(s2)
    120d:	0100                	.insn	2, 0x0100
    120f:	0306                	.insn	2, 0x0306
    1211:	7efc                	.insn	2, 0x7efc
    1213:	1809                	.insn	2, 0x1809
    1215:	0100                	.insn	2, 0x0100
    1217:	09018403          	lb	s0,144(gp)
    121b:	0004                	.insn	2, 0x0004
    121d:	0501                	.insn	2, 0x0501
    121f:	0614                	.insn	2, 0x0614
    1221:	04090503          	lb	a0,64(s2)
    1225:	0100                	.insn	2, 0x0100
    1227:	04097f03          	.insn	4, 0x04097f03
    122b:	0100                	.insn	2, 0x0100
    122d:	04090203          	lb	tp,64(s2)
    1231:	0100                	.insn	2, 0x0100
    1233:	0a05                	.insn	2, 0x0a05
    1235:	04090103          	lb	sp,64(s2)
    1239:	0100                	.insn	2, 0x0100
    123b:	1f05                	.insn	2, 0x1f05
    123d:	04097e03          	.insn	4, 0x04097e03
    1241:	0100                	.insn	2, 0x0100
    1243:	2005                	.insn	2, 0x2005
    1245:	04097f03          	.insn	4, 0x04097f03
    1249:	0100                	.insn	2, 0x0100
    124b:	1f05                	.insn	2, 0x1f05
    124d:	04090203          	lb	tp,64(s2)
    1251:	0100                	.insn	2, 0x0100
    1253:	04090103          	lb	sp,64(s2)
    1257:	0100                	.insn	2, 0x0100
    1259:	2505                	.insn	2, 0x2505
    125b:	04097e03          	.insn	4, 0x04097e03
    125f:	0100                	.insn	2, 0x0100
    1261:	2605                	.insn	2, 0x2605
    1263:	04090103          	lb	sp,64(s2)
    1267:	0100                	.insn	2, 0x0100
    1269:	1605                	.insn	2, 0x1605
    126b:	04097d03          	.insn	4, 0x04097d03
    126f:	0100                	.insn	2, 0x0100
    1271:	0905                	.insn	2, 0x0905
    1273:	08090603          	lb	a2,128(s2)
    1277:	0100                	.insn	2, 0x0100
    1279:	0306                	.insn	2, 0x0306
    127b:	0900                	.insn	2, 0x0900
    127d:	000c                	.insn	2, 0x000c
    127f:	0501                	.insn	2, 0x0501
    1281:	0614                	.insn	2, 0x0614
    1283:	04090403          	lb	s0,64(s2)
    1287:	0100                	.insn	2, 0x0100
    1289:	08090103          	lb	sp,128(s2)
    128d:	0100                	.insn	2, 0x0100
    128f:	04097f03          	.insn	4, 0x04097f03
    1293:	0100                	.insn	2, 0x0100
    1295:	1c05                	.insn	2, 0x1c05
    1297:	08090103          	lb	sp,128(s2)
    129b:	0100                	.insn	2, 0x0100
    129d:	1d05                	.insn	2, 0x1d05
    129f:	04097f03          	.insn	4, 0x04097f03
    12a3:	0100                	.insn	2, 0x0100
    12a5:	1405                	.insn	2, 0x1405
    12a7:	04090803          	lb	a6,64(s2)
    12ab:	0100                	.insn	2, 0x0100
    12ad:	04097f03          	.insn	4, 0x04097f03
    12b1:	0100                	.insn	2, 0x0100
    12b3:	04090203          	lb	tp,64(s2)
    12b7:	0100                	.insn	2, 0x0100
    12b9:	0a05                	.insn	2, 0x0a05
    12bb:	04090103          	lb	sp,64(s2)
    12bf:	0100                	.insn	2, 0x0100
    12c1:	1c05                	.insn	2, 0x1c05
    12c3:	04097e03          	.insn	4, 0x04097e03
    12c7:	0100                	.insn	2, 0x0100
    12c9:	1d05                	.insn	2, 0x1d05
    12cb:	04097f03          	.insn	4, 0x04097f03
    12cf:	0100                	.insn	2, 0x0100
    12d1:	1c05                	.insn	2, 0x1c05
    12d3:	04090203          	lb	tp,64(s2)
    12d7:	0100                	.insn	2, 0x0100
    12d9:	04090103          	lb	sp,64(s2)
    12dd:	0100                	.insn	2, 0x0100
    12df:	1305                	.insn	2, 0x1305
    12e1:	04090303          	lb	t1,64(s2)
    12e5:	0100                	.insn	2, 0x0100
    12e7:	2205                	.insn	2, 0x2205
    12e9:	04097b03          	.insn	4, 0x04097b03
    12ed:	0100                	.insn	2, 0x0100
    12ef:	2305                	.insn	2, 0x2305
    12f1:	04090103          	lb	sp,64(s2)
    12f5:	0100                	.insn	2, 0x0100
    12f7:	2105                	.insn	2, 0x2105
    12f9:	04090303          	lb	t1,64(s2)
    12fd:	0100                	.insn	2, 0x0100
    12ff:	1405                	.insn	2, 0x1405
    1301:	08090503          	lb	a0,128(s2)
    1305:	0100                	.insn	2, 0x0100
    1307:	04097f03          	.insn	4, 0x04097f03
    130b:	0100                	.insn	2, 0x0100
    130d:	04090203          	lb	tp,64(s2)
    1311:	0100                	.insn	2, 0x0100
    1313:	0a05                	.insn	2, 0x0a05
    1315:	04090103          	lb	sp,64(s2)
    1319:	0100                	.insn	2, 0x0100
    131b:	1c05                	.insn	2, 0x1c05
    131d:	04097e03          	.insn	4, 0x04097e03
    1321:	0100                	.insn	2, 0x0100
    1323:	1d05                	.insn	2, 0x1d05
    1325:	04097f03          	.insn	4, 0x04097f03
    1329:	0100                	.insn	2, 0x0100
    132b:	1c05                	.insn	2, 0x1c05
    132d:	04090203          	lb	tp,64(s2)
    1331:	0100                	.insn	2, 0x0100
    1333:	04090103          	lb	sp,64(s2)
    1337:	0100                	.insn	2, 0x0100
    1339:	2205                	.insn	2, 0x2205
    133b:	04097e03          	.insn	4, 0x04097e03
    133f:	0100                	.insn	2, 0x0100
    1341:	1105                	.insn	2, 0x1105
    1343:	04090503          	lb	a0,64(s2)
    1347:	0100                	.insn	2, 0x0100
    1349:	1305                	.insn	2, 0x1305
    134b:	04096e03          	.insn	4, 0x04096e03
    134f:	0100                	.insn	2, 0x0100
    1351:	2305                	.insn	2, 0x2305
    1353:	04090e03          	lb	t3,64(s2)
    1357:	0100                	.insn	2, 0x0100
    1359:	1a05                	.insn	2, 0x1a05
    135b:	04097d03          	.insn	4, 0x04097d03
    135f:	0100                	.insn	2, 0x0100
    1361:	04090703          	lb	a4,64(s2)
    1365:	0100                	.insn	2, 0x0100
    1367:	1705                	.insn	2, 0x1705
    1369:	04097f03          	.insn	4, 0x04097f03
    136d:	0100                	.insn	2, 0x0100
    136f:	2705                	.insn	2, 0x2705
    1371:	04090403          	lb	s0,64(s2)
    1375:	0100                	.insn	2, 0x0100
    1377:	1b05                	.insn	2, 0x1b05
    1379:	0306                	.insn	2, 0x0306
    137b:	0900                	.insn	2, 0x0900
    137d:	0004                	.insn	2, 0x0004
    137f:	0501                	.insn	2, 0x0501
    1381:	0618                	.insn	2, 0x0618
    1383:	04097f03          	.insn	4, 0x04097f03
    1387:	0100                	.insn	2, 0x0100
    1389:	0105                	.insn	2, 0x0105
    138b:	04090403          	lb	s0,64(s2)
    138f:	0100                	.insn	2, 0x0100
    1391:	0306                	.insn	2, 0x0306
    1393:	10097ed3          	.insn	4, 0x10097ed3
    1397:	0100                	.insn	2, 0x0100
    1399:	01ad030b          	.insn	4, 0x01ad030b
    139d:	0409                	.insn	2, 0x0409
    139f:	0100                	.insn	2, 0x0100
    13a1:	0005                	.insn	2, 0x0005
    13a3:	0306                	.insn	2, 0x0306
    13a5:	7f80                	.insn	2, 0x7f80
    13a7:	0809                	.insn	2, 0x0809
    13a9:	0100                	.insn	2, 0x0100
    13ab:	0905                	.insn	2, 0x0905
    13ad:	030a                	.insn	2, 0x030a
    13af:	00400903          	lb	s2,4(zero) # 4 <$d.10+0x4>
    13b3:	0601                	.insn	2, 0x0601
    13b5:	08095003          	lhu	zero,128(s2)
    13b9:	0100                	.insn	2, 0x0100
    13bb:	04093003          	.insn	4, 0x04093003
    13bf:	0100                	.insn	2, 0x0100
    13c1:	2005                	.insn	2, 0x2005
    13c3:	0306                	.insn	2, 0x0306
    13c5:	0904                	.insn	2, 0x0904
    13c7:	0004                	.insn	2, 0x0004
    13c9:	0501                	.insn	2, 0x0501
    13cb:	0314                	.insn	2, 0x0314
    13cd:	00c9                	.insn	2, 0x00c9
    13cf:	0c09                	.insn	2, 0x0c09
    13d1:	0100                	.insn	2, 0x0100
    13d3:	04097e03          	.insn	4, 0x04097e03
    13d7:	0100                	.insn	2, 0x0100
    13d9:	1505                	.insn	2, 0x1505
    13db:	04090103          	lb	sp,64(s2)
    13df:	0100                	.insn	2, 0x0100
    13e1:	1a05                	.insn	2, 0x1a05
    13e3:	0306                	.insn	2, 0x0306
    13e5:	0900                	.insn	2, 0x0900
    13e7:	0004                	.insn	2, 0x0004
    13e9:	0501                	.insn	2, 0x0501
    13eb:	061f 7f03 0409      	.insn	6, 0x04097f03061f
    13f1:	0100                	.insn	2, 0x0100
    13f3:	0905                	.insn	2, 0x0905
    13f5:	097fbb03          	.insn	4, 0x097fbb03
    13f9:	0004                	.insn	2, 0x0004
    13fb:	0601                	.insn	2, 0x0601
    13fd:	14090003          	lb	zero,320(s2)
    1401:	0100                	.insn	2, 0x0100
    1403:	0105                	.insn	2, 0x0105
    1405:	0306                	.insn	2, 0x0306
    1407:	00c1                	.insn	2, 0x00c1
    1409:	0409                	.insn	2, 0x0409
    140b:	0100                	.insn	2, 0x0100
    140d:	0306                	.insn	2, 0x0306
    140f:	7f89                	.insn	2, 0x7f89
    1411:	0c09                	.insn	2, 0x0c09
    1413:	0100                	.insn	2, 0x0100
    1415:	00f7030b          	.insn	4, 0x00f7030b
    1419:	2809                	.insn	2, 0x2809
    141b:	0100                	.insn	2, 0x0100
    141d:	097f8903          	lb	s2,151(t6)
    1421:	0008                	.insn	2, 0x0008
    1423:	0501                	.insn	2, 0x0501
    1425:	0620                	.insn	2, 0x0620
    1427:	0900d903          	lhu	s2,144(ra)
    142b:	001c                	.insn	2, 0x001c
    142d:	0501                	.insn	2, 0x0501
    142f:	0615                	.insn	2, 0x0615
    1431:	04090003          	lb	zero,64(s2)
    1435:	0100                	.insn	2, 0x0100
    1437:	2405                	.insn	2, 0x2405
    1439:	04090003          	lb	zero,64(s2)
    143d:	0100                	.insn	2, 0x0100
    143f:	0905                	.insn	2, 0x0905
    1441:	0306                	.insn	2, 0x0306
    1443:	0904                	.insn	2, 0x0904
    1445:	0004                	.insn	2, 0x0004
    1447:	0501                	.insn	2, 0x0501
    1449:	0616                	.insn	2, 0x0616
    144b:	04090003          	lb	zero,64(s2)
    144f:	0100                	.insn	2, 0x0100
    1451:	0d05                	.insn	2, 0x0d05
    1453:	0306                	.insn	2, 0x0306
    1455:	0902                	.insn	2, 0x0902
    1457:	0004                	.insn	2, 0x0004
    1459:	0601                	.insn	2, 0x0601
    145b:	10090003          	lb	zero,256(s2)
    145f:	0100                	.insn	2, 0x0100
    1461:	1705                	.insn	2, 0x1705
    1463:	0306                	.insn	2, 0x0306
    1465:	095a                	.insn	2, 0x095a
    1467:	0004                	.insn	2, 0x0004
    1469:	0501                	.insn	2, 0x0501
    146b:	0605                	.insn	2, 0x0605
    146d:	08090003          	lb	zero,128(s2)
    1471:	0100                	.insn	2, 0x0100
    1473:	0d05                	.insn	2, 0x0d05
    1475:	0306                	.insn	2, 0x0306
    1477:	0905                	.insn	2, 0x0905
    1479:	0004                	.insn	2, 0x0004
    147b:	0601                	.insn	2, 0x0601
    147d:	04090003          	lb	zero,64(s2)
    1481:	0100                	.insn	2, 0x0100
    1483:	0306                	.insn	2, 0x0306
    1485:	0908                	.insn	2, 0x0908
    1487:	0008                	.insn	2, 0x0008
    1489:	0601                	.insn	2, 0x0601
    148b:	04090003          	lb	zero,64(s2)
    148f:	0100                	.insn	2, 0x0100
    1491:	1105                	.insn	2, 0x1105
    1493:	0306                	.insn	2, 0x0306
    1495:	0908                	.insn	2, 0x0908
    1497:	0004                	.insn	2, 0x0004
    1499:	0601                	.insn	2, 0x0601
    149b:	097fb203          	.insn	4, 0x097fb203
    149f:	0004                	.insn	2, 0x0004
    14a1:	0301                	.insn	2, 0x0301
    14a3:	00ce                	.insn	2, 0x00ce
    14a5:	0409                	.insn	2, 0x0409
    14a7:	0100                	.insn	2, 0x0100
    14a9:	04090003          	lb	zero,64(s2)
    14ad:	0100                	.insn	2, 0x0100
    14af:	2005                	.insn	2, 0x2005
    14b1:	0306                	.insn	2, 0x0306
    14b3:	0901                	.insn	2, 0x0901
    14b5:	0008                	.insn	2, 0x0008
    14b7:	0501                	.insn	2, 0x0501
    14b9:	0311                	.insn	2, 0x0311
    14bb:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    14c3:	0409 
    14c5:	0100                	.insn	2, 0x0100
    14c7:	0306                	.insn	2, 0x0306
    14c9:	0901                	.insn	2, 0x0901
    14cb:	0004                	.insn	2, 0x0004
    14cd:	0501                	.insn	2, 0x0501
    14cf:	061c                	.insn	2, 0x061c
    14d1:	04090003          	lb	zero,64(s2)
    14d5:	0100                	.insn	2, 0x0100
    14d7:	2005                	.insn	2, 0x2005
    14d9:	04090003          	lb	zero,64(s2)
    14dd:	0100                	.insn	2, 0x0100
    14df:	1105                	.insn	2, 0x1105
    14e1:	0306                	.insn	2, 0x0306
    14e3:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    14eb:	0409 
    14ed:	0100                	.insn	2, 0x0100
    14ef:	04090003          	lb	zero,64(s2)
    14f3:	0100                	.insn	2, 0x0100
    14f5:	04090003          	lb	zero,64(s2)
    14f9:	0100                	.insn	2, 0x0100
    14fb:	04090003          	lb	zero,64(s2)
    14ff:	0100                	.insn	2, 0x0100
    1501:	04090003          	lb	zero,64(s2)
    1505:	0100                	.insn	2, 0x0100
    1507:	04090003          	lb	zero,64(s2)
    150b:	0100                	.insn	2, 0x0100
    150d:	04090003          	lb	zero,64(s2)
    1511:	0100                	.insn	2, 0x0100
    1513:	04090003          	lb	zero,64(s2)
    1517:	0100                	.insn	2, 0x0100
    1519:	04090003          	lb	zero,64(s2)
    151d:	0100                	.insn	2, 0x0100
    151f:	04090003          	lb	zero,64(s2)
    1523:	0100                	.insn	2, 0x0100
    1525:	04090003          	lb	zero,64(s2)
    1529:	0100                	.insn	2, 0x0100
    152b:	0d05                	.insn	2, 0x0d05
    152d:	0306                	.insn	2, 0x0306
    152f:	0905                	.insn	2, 0x0905
    1531:	0004                	.insn	2, 0x0004
    1533:	0601                	.insn	2, 0x0601
    1535:	04090003          	lb	zero,64(s2)
    1539:	0100                	.insn	2, 0x0100
    153b:	1105                	.insn	2, 0x1105
    153d:	0306                	.insn	2, 0x0306
    153f:	097c                	.insn	2, 0x097c
    1541:	0008                	.insn	2, 0x0008
    1543:	0501                	.insn	2, 0x0501
    1545:	061c                	.insn	2, 0x061c
    1547:	04090003          	lb	zero,64(s2)
    154b:	0100                	.insn	2, 0x0100
    154d:	2005                	.insn	2, 0x2005
    154f:	04090003          	lb	zero,64(s2)
    1553:	0100                	.insn	2, 0x0100
    1555:	1105                	.insn	2, 0x1105
    1557:	0306                	.insn	2, 0x0306
    1559:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    1561:	0409 
    1563:	0100                	.insn	2, 0x0100
    1565:	0306                	.insn	2, 0x0306
    1567:	0901                	.insn	2, 0x0901
    1569:	0004                	.insn	2, 0x0004
    156b:	0501                	.insn	2, 0x0501
    156d:	061c                	.insn	2, 0x061c
    156f:	04090003          	lb	zero,64(s2)
    1573:	0100                	.insn	2, 0x0100
    1575:	2005                	.insn	2, 0x2005
    1577:	04090003          	lb	zero,64(s2)
    157b:	0100                	.insn	2, 0x0100
    157d:	1105                	.insn	2, 0x1105
    157f:	0306                	.insn	2, 0x0306
    1581:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    1589:	0409 
    158b:	0100                	.insn	2, 0x0100
    158d:	0306                	.insn	2, 0x0306
    158f:	0901                	.insn	2, 0x0901
    1591:	0004                	.insn	2, 0x0004
    1593:	0501                	.insn	2, 0x0501
    1595:	061c                	.insn	2, 0x061c
    1597:	04090003          	lb	zero,64(s2)
    159b:	0100                	.insn	2, 0x0100
    159d:	2005                	.insn	2, 0x2005
    159f:	04090003          	lb	zero,64(s2)
    15a3:	0100                	.insn	2, 0x0100
    15a5:	1105                	.insn	2, 0x1105
    15a7:	0306                	.insn	2, 0x0306
    15a9:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    15b1:	0409 
    15b3:	0100                	.insn	2, 0x0100
    15b5:	0306                	.insn	2, 0x0306
    15b7:	0901                	.insn	2, 0x0901
    15b9:	0004                	.insn	2, 0x0004
    15bb:	0501                	.insn	2, 0x0501
    15bd:	061c                	.insn	2, 0x061c
    15bf:	04090003          	lb	zero,64(s2)
    15c3:	0100                	.insn	2, 0x0100
    15c5:	2005                	.insn	2, 0x2005
    15c7:	04090003          	lb	zero,64(s2)
    15cb:	0100                	.insn	2, 0x0100
    15cd:	1105                	.insn	2, 0x1105
    15cf:	0306                	.insn	2, 0x0306
    15d1:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    15d9:	0409 
    15db:	0100                	.insn	2, 0x0100
    15dd:	0306                	.insn	2, 0x0306
    15df:	0901                	.insn	2, 0x0901
    15e1:	0004                	.insn	2, 0x0004
    15e3:	0501                	.insn	2, 0x0501
    15e5:	061c                	.insn	2, 0x061c
    15e7:	04090003          	lb	zero,64(s2)
    15eb:	0100                	.insn	2, 0x0100
    15ed:	2005                	.insn	2, 0x2005
    15ef:	04090003          	lb	zero,64(s2)
    15f3:	0100                	.insn	2, 0x0100
    15f5:	1105                	.insn	2, 0x1105
    15f7:	0306                	.insn	2, 0x0306
    15f9:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    1601:	0409 
    1603:	0100                	.insn	2, 0x0100
    1605:	0306                	.insn	2, 0x0306
    1607:	0901                	.insn	2, 0x0901
    1609:	0004                	.insn	2, 0x0004
    160b:	0501                	.insn	2, 0x0501
    160d:	061c                	.insn	2, 0x061c
    160f:	04090003          	lb	zero,64(s2)
    1613:	0100                	.insn	2, 0x0100
    1615:	2005                	.insn	2, 0x2005
    1617:	04090003          	lb	zero,64(s2)
    161b:	0100                	.insn	2, 0x0100
    161d:	0d05                	.insn	2, 0x0d05
    161f:	0306                	.insn	2, 0x0306
    1621:	0904                	.insn	2, 0x0904
    1623:	0004                	.insn	2, 0x0004
    1625:	0601                	.insn	2, 0x0601
    1627:	04090003          	lb	zero,64(s2)
    162b:	0100                	.insn	2, 0x0100
    162d:	1505                	.insn	2, 0x1505
    162f:	0306                	.insn	2, 0x0306
    1631:	0905                	.insn	2, 0x0905
    1633:	0004                	.insn	2, 0x0004
    1635:	0501                	.insn	2, 0x0501
    1637:	030d                	.insn	2, 0x030d
    1639:	097d                	.insn	2, 0x097d
    163b:	0004                	.insn	2, 0x0004
    163d:	0501                	.insn	2, 0x0501
    163f:	061c                	.insn	2, 0x061c
    1641:	04090003          	lb	zero,64(s2)
    1645:	0100                	.insn	2, 0x0100
    1647:	2005                	.insn	2, 0x2005
    1649:	0306                	.insn	2, 0x0306
    164b:	0904                	.insn	2, 0x0904
    164d:	0004                	.insn	2, 0x0004
    164f:	0501                	.insn	2, 0x0501
    1651:	0624                	.insn	2, 0x0624
    1653:	04090003          	lb	zero,64(s2)
    1657:	0100                	.insn	2, 0x0100
    1659:	1505                	.insn	2, 0x1505
    165b:	0306                	.insn	2, 0x0306
    165d:	097f 0004 0301 0901 	.insn	10, 0x0004090103010004097f
    1665:	0004 
    1667:	0501                	.insn	2, 0x0501
    1669:	0620                	.insn	2, 0x0620
    166b:	04090003          	lb	zero,64(s2)
    166f:	0100                	.insn	2, 0x0100
    1671:	2405                	.insn	2, 0x2405
    1673:	04090003          	lb	zero,64(s2)
    1677:	0100                	.insn	2, 0x0100
    1679:	1505                	.insn	2, 0x1505
    167b:	0306                	.insn	2, 0x0306
    167d:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    1685:	0409 
    1687:	0100                	.insn	2, 0x0100
    1689:	097fa803          	lw	a6,151(t6)
    168d:	0004                	.insn	2, 0x0004
    168f:	0501                	.insn	2, 0x0501
    1691:	0612                	.insn	2, 0x0612
    1693:	0900e303          	.insn	4, 0x0900e303
    1697:	000c                	.insn	2, 0x000c
    1699:	0501                	.insn	2, 0x0501
    169b:	031c                	.insn	2, 0x031c
    169d:	097f 0004 0301 0904 	.insn	10, 0x0004090403010004097f
    16a5:	0004 
    16a7:	0301                	.insn	2, 0x0301
    16a9:	0901                	.insn	2, 0x0901
    16ab:	0004                	.insn	2, 0x0004
    16ad:	0501                	.insn	2, 0x0501
    16af:	0318                	.insn	2, 0x0318
    16b1:	00040903          	lb	s2,0(s0)
    16b5:	0501                	.insn	2, 0x0501
    16b7:	097c0323          	sb	s7,134(s8)
    16bb:	0008                	.insn	2, 0x0008
    16bd:	0501                	.insn	2, 0x0501
    16bf:	0322                	.insn	2, 0x0322
    16c1:	0901                	.insn	2, 0x0901
    16c3:	0004                	.insn	2, 0x0004
    16c5:	0501                	.insn	2, 0x0501
    16c7:	0318                	.insn	2, 0x0318
    16c9:	00040903          	lb	s2,0(s0)
    16cd:	0501                	.insn	2, 0x0501
    16cf:	061f 0003 0409      	.insn	6, 0x04090003061f
    16d5:	0100                	.insn	2, 0x0100
    16d7:	1605                	.insn	2, 0x1605
    16d9:	0306                	.insn	2, 0x0306
    16db:	097f 0004 0501 031c 	.insn	10, 0x0905031c05010004097f
    16e3:	0905 
    16e5:	0004                	.insn	2, 0x0004
    16e7:	0301                	.insn	2, 0x0301
    16e9:	097f 0004 0301 0902 	.insn	10, 0x0004090203010004097f
    16f1:	0004 
    16f3:	0501                	.insn	2, 0x0501
    16f5:	0312                	.insn	2, 0x0312
    16f7:	0901                	.insn	2, 0x0901
    16f9:	0004                	.insn	2, 0x0004
    16fb:	0501                	.insn	2, 0x0501
    16fd:	0322                	.insn	2, 0x0322
    16ff:	097e                	.insn	2, 0x097e
    1701:	0004                	.insn	2, 0x0004
    1703:	0501                	.insn	2, 0x0501
    1705:	097f0323          	sb	s7,134(t5) # a5136 <$d.5+0xa3ce5>
    1709:	0004                	.insn	2, 0x0004
    170b:	0501                	.insn	2, 0x0501
    170d:	0322                	.insn	2, 0x0322
    170f:	0902                	.insn	2, 0x0902
    1711:	0004                	.insn	2, 0x0004
    1713:	0301                	.insn	2, 0x0301
    1715:	0901                	.insn	2, 0x0901
    1717:	0004                	.insn	2, 0x0004
    1719:	0501                	.insn	2, 0x0501
    171b:	0328                	.insn	2, 0x0328
    171d:	097e                	.insn	2, 0x097e
    171f:	0004                	.insn	2, 0x0004
    1721:	0501                	.insn	2, 0x0501
    1723:	0329                	.insn	2, 0x0329
    1725:	0901                	.insn	2, 0x0901
    1727:	0004                	.insn	2, 0x0004
    1729:	0501                	.insn	2, 0x0501
    172b:	097d0313          	addi	t1,s10,151
    172f:	0004                	.insn	2, 0x0004
    1731:	0501                	.insn	2, 0x0501
    1733:	0a14                	.insn	2, 0x0a14
    1735:	08090f03          	lb	t5,128(s2)
    1739:	0100                	.insn	2, 0x0100
    173b:	08090203          	lb	tp,128(s2)
    173f:	0100                	.insn	2, 0x0100
    1741:	04097e03          	.insn	4, 0x04097e03
    1745:	0100                	.insn	2, 0x0100
    1747:	1505                	.insn	2, 0x1505
    1749:	04090103          	lb	sp,64(s2)
    174d:	0100                	.insn	2, 0x0100
    174f:	1a05                	.insn	2, 0x1a05
    1751:	0306                	.insn	2, 0x0306
    1753:	0900                	.insn	2, 0x0900
    1755:	0004                	.insn	2, 0x0004
    1757:	0501                	.insn	2, 0x0501
    1759:	061f 7f03 0409      	.insn	6, 0x04097f03061f
    175f:	0100                	.insn	2, 0x0100
    1761:	0505                	.insn	2, 0x0505
    1763:	0306                	.insn	2, 0x0306
    1765:	0900                	.insn	2, 0x0900
    1767:	0004                	.insn	2, 0x0004
    1769:	0501                	.insn	2, 0x0501
    176b:	0600                	.insn	2, 0x0600
    176d:	04093503          	.insn	4, 0x04093503
    1771:	0100                	.insn	2, 0x0100
    1773:	0905                	.insn	2, 0x0905
    1775:	030a                	.insn	2, 0x030a
    1777:	00240903          	lb	s2,2(s0)
    177b:	0601                	.insn	2, 0x0601
    177d:	08090003          	lb	zero,128(s2)
    1781:	0100                	.insn	2, 0x0100
    1783:	2005                	.insn	2, 0x2005
    1785:	0306                	.insn	2, 0x0306
    1787:	0904                	.insn	2, 0x0904
    1789:	0004                	.insn	2, 0x0004
    178b:	0501                	.insn	2, 0x0501
    178d:	0314                	.insn	2, 0x0314
    178f:	0946                	.insn	2, 0x0946
    1791:	000c                	.insn	2, 0x000c
    1793:	0301                	.insn	2, 0x0301
    1795:	097e                	.insn	2, 0x097e
    1797:	0004                	.insn	2, 0x0004
    1799:	0501                	.insn	2, 0x0501
    179b:	0315                	.insn	2, 0x0315
    179d:	0901                	.insn	2, 0x0901
    179f:	0004                	.insn	2, 0x0004
    17a1:	0501                	.insn	2, 0x0501
    17a3:	061a                	.insn	2, 0x061a
    17a5:	04090003          	lb	zero,64(s2)
    17a9:	0100                	.insn	2, 0x0100
    17ab:	1f05                	.insn	2, 0x1f05
    17ad:	0306                	.insn	2, 0x0306
    17af:	097f 0004 0501 0309 	.insn	10, 0x093e030905010004097f
    17b7:	093e 
    17b9:	0004                	.insn	2, 0x0004
    17bb:	0601                	.insn	2, 0x0601
    17bd:	14090003          	lb	zero,320(s2)
    17c1:	0100                	.insn	2, 0x0100
    17c3:	097ec703          	lbu	a4,151(t4)
    17c7:	0004                	.insn	2, 0x0004
    17c9:	0501                	.insn	2, 0x0501
    17cb:	0601                	.insn	2, 0x0601
    17cd:	01eb030b          	.insn	4, 0x01eb030b
    17d1:	2009                	.insn	2, 0x2009
    17d3:	0100                	.insn	2, 0x0100
    17d5:	0306                	.insn	2, 0x0306
    17d7:	7e95                	.insn	2, 0x7e95
    17d9:	0809                	.insn	2, 0x0809
    17db:	0100                	.insn	2, 0x0100
    17dd:	2605                	.insn	2, 0x2605
    17df:	0306                	.insn	2, 0x0306
    17e1:	01d6                	.insn	2, 0x01d6
    17e3:	2409                	.insn	2, 0x2409
    17e5:	0100                	.insn	2, 0x0100
    17e7:	0905                	.insn	2, 0x0905
    17e9:	0306                	.insn	2, 0x0306
    17eb:	0900                	.insn	2, 0x0900
    17ed:	0004                	.insn	2, 0x0004
    17ef:	0501                	.insn	2, 0x0501
    17f1:	0618                	.insn	2, 0x0618
    17f3:	0c090803          	lb	a6,192(s2)
    17f7:	0100                	.insn	2, 0x0100
    17f9:	0e05                	.insn	2, 0x0e05
    17fb:	04097c03          	.insn	4, 0x04097c03
    17ff:	0100                	.insn	2, 0x0100
    1801:	1805                	.insn	2, 0x1805
    1803:	04097f03          	.insn	4, 0x04097f03
    1807:	0100                	.insn	2, 0x0100
    1809:	04090403          	lb	s0,64(s2)
    180d:	0100                	.insn	2, 0x0100
    180f:	1e05                	.insn	2, 0x1e05
    1811:	04090103          	lb	sp,64(s2)
    1815:	0100                	.insn	2, 0x0100
    1817:	1405                	.insn	2, 0x1405
    1819:	04090303          	lb	t1,64(s2)
    181d:	0100                	.insn	2, 0x0100
    181f:	1f05                	.insn	2, 0x1f05
    1821:	08097c03          	.insn	4, 0x08097c03
    1825:	0100                	.insn	2, 0x0100
    1827:	1405                	.insn	2, 0x1405
    1829:	04090403          	lb	s0,64(s2)
    182d:	0100                	.insn	2, 0x0100
    182f:	1b05                	.insn	2, 0x1b05
    1831:	0306                	.insn	2, 0x0306
    1833:	0900                	.insn	2, 0x0900
    1835:	0004                	.insn	2, 0x0004
    1837:	0501                	.insn	2, 0x0501
    1839:	0618                	.insn	2, 0x0618
    183b:	04090403          	lb	s0,64(s2)
    183f:	0100                	.insn	2, 0x0100
    1841:	04097f03          	.insn	4, 0x04097f03
    1845:	0100                	.insn	2, 0x0100
    1847:	04090203          	lb	tp,64(s2)
    184b:	0100                	.insn	2, 0x0100
    184d:	0e05                	.insn	2, 0x0e05
    184f:	04090103          	lb	sp,64(s2)
    1853:	0100                	.insn	2, 0x0100
    1855:	1e05                	.insn	2, 0x1e05
    1857:	04097e03          	.insn	4, 0x04097e03
    185b:	0100                	.insn	2, 0x0100
    185d:	1f05                	.insn	2, 0x1f05
    185f:	04097f03          	.insn	4, 0x04097f03
    1863:	0100                	.insn	2, 0x0100
    1865:	1e05                	.insn	2, 0x1e05
    1867:	04090203          	lb	tp,64(s2)
    186b:	0100                	.insn	2, 0x0100
    186d:	04090103          	lb	sp,64(s2)
    1871:	0100                	.insn	2, 0x0100
    1873:	2405                	.insn	2, 0x2405
    1875:	04097e03          	.insn	4, 0x04097e03
    1879:	0100                	.insn	2, 0x0100
    187b:	2505                	.insn	2, 0x2505
    187d:	04090103          	lb	sp,64(s2)
    1881:	0100                	.insn	2, 0x0100
    1883:	0905                	.insn	2, 0x0905
    1885:	04090303          	lb	t1,64(s2)
    1889:	0100                	.insn	2, 0x0100
    188b:	1705                	.insn	2, 0x1705
    188d:	0c095303          	lhu	t1,192(s2)
    1891:	0100                	.insn	2, 0x0100
    1893:	0505                	.insn	2, 0x0505
    1895:	0306                	.insn	2, 0x0306
    1897:	0900                	.insn	2, 0x0900
    1899:	0008                	.insn	2, 0x0008
    189b:	0501                	.insn	2, 0x0501
    189d:	060d                	.insn	2, 0x060d
    189f:	04090403          	lb	s0,64(s2)
    18a3:	0100                	.insn	2, 0x0100
    18a5:	0306                	.insn	2, 0x0306
    18a7:	0900                	.insn	2, 0x0900
    18a9:	0004                	.insn	2, 0x0004
    18ab:	0601                	.insn	2, 0x0601
    18ad:	08090603          	lb	a2,128(s2)
    18b1:	0100                	.insn	2, 0x0100
    18b3:	0306                	.insn	2, 0x0306
    18b5:	0900                	.insn	2, 0x0900
    18b7:	0004                	.insn	2, 0x0004
    18b9:	0501                	.insn	2, 0x0501
    18bb:	0611                	.insn	2, 0x0611
    18bd:	04090403          	lb	s0,64(s2)
    18c1:	0100                	.insn	2, 0x0100
    18c3:	0306                	.insn	2, 0x0306
    18c5:	0900                	.insn	2, 0x0900
    18c7:	0004                	.insn	2, 0x0004
    18c9:	0301                	.insn	2, 0x0301
    18cb:	0900                	.insn	2, 0x0900
    18cd:	0004                	.insn	2, 0x0004
    18cf:	0301                	.insn	2, 0x0301
    18d1:	0900                	.insn	2, 0x0900
    18d3:	0004                	.insn	2, 0x0004
    18d5:	0301                	.insn	2, 0x0301
    18d7:	0900                	.insn	2, 0x0900
    18d9:	0004                	.insn	2, 0x0004
    18db:	0301                	.insn	2, 0x0301
    18dd:	0900                	.insn	2, 0x0900
    18df:	0004                	.insn	2, 0x0004
    18e1:	0301                	.insn	2, 0x0301
    18e3:	0900                	.insn	2, 0x0900
    18e5:	0004                	.insn	2, 0x0004
    18e7:	0301                	.insn	2, 0x0301
    18e9:	0900                	.insn	2, 0x0900
    18eb:	0004                	.insn	2, 0x0004
    18ed:	0301                	.insn	2, 0x0301
    18ef:	0900                	.insn	2, 0x0900
    18f1:	0004                	.insn	2, 0x0004
    18f3:	0301                	.insn	2, 0x0301
    18f5:	0900                	.insn	2, 0x0900
    18f7:	0004                	.insn	2, 0x0004
    18f9:	0301                	.insn	2, 0x0301
    18fb:	0900                	.insn	2, 0x0900
    18fd:	0004                	.insn	2, 0x0004
    18ff:	0301                	.insn	2, 0x0301
    1901:	0900                	.insn	2, 0x0900
    1903:	0004                	.insn	2, 0x0004
    1905:	0301                	.insn	2, 0x0301
    1907:	0900                	.insn	2, 0x0900
    1909:	0004                	.insn	2, 0x0004
    190b:	0301                	.insn	2, 0x0301
    190d:	0900                	.insn	2, 0x0900
    190f:	0004                	.insn	2, 0x0004
    1911:	0301                	.insn	2, 0x0301
    1913:	0900                	.insn	2, 0x0900
    1915:	0004                	.insn	2, 0x0004
    1917:	0501                	.insn	2, 0x0501
    1919:	060d                	.insn	2, 0x060d
    191b:	04090403          	lb	s0,64(s2)
    191f:	0100                	.insn	2, 0x0100
    1921:	0306                	.insn	2, 0x0306
    1923:	0900                	.insn	2, 0x0900
    1925:	0004                	.insn	2, 0x0004
    1927:	0501                	.insn	2, 0x0501
    1929:	0611                	.insn	2, 0x0611
    192b:	08097d03          	.insn	4, 0x08097d03
    192f:	0100                	.insn	2, 0x0100
    1931:	08097f03          	.insn	4, 0x08097f03
    1935:	0100                	.insn	2, 0x0100
    1937:	0306                	.insn	2, 0x0306
    1939:	0900                	.insn	2, 0x0900
    193b:	0004                	.insn	2, 0x0004
    193d:	0601                	.insn	2, 0x0601
    193f:	04090103          	lb	sp,64(s2)
    1943:	0100                	.insn	2, 0x0100
    1945:	08097f03          	.insn	4, 0x08097f03
    1949:	0100                	.insn	2, 0x0100
    194b:	0306                	.insn	2, 0x0306
    194d:	0900                	.insn	2, 0x0900
    194f:	0004                	.insn	2, 0x0004
    1951:	0601                	.insn	2, 0x0601
    1953:	04090103          	lb	sp,64(s2)
    1957:	0100                	.insn	2, 0x0100
    1959:	08097f03          	.insn	4, 0x08097f03
    195d:	0100                	.insn	2, 0x0100
    195f:	0306                	.insn	2, 0x0306
    1961:	0900                	.insn	2, 0x0900
    1963:	0004                	.insn	2, 0x0004
    1965:	0601                	.insn	2, 0x0601
    1967:	04090103          	lb	sp,64(s2)
    196b:	0100                	.insn	2, 0x0100
    196d:	08097f03          	.insn	4, 0x08097f03
    1971:	0100                	.insn	2, 0x0100
    1973:	0306                	.insn	2, 0x0306
    1975:	0900                	.insn	2, 0x0900
    1977:	0004                	.insn	2, 0x0004
    1979:	0601                	.insn	2, 0x0601
    197b:	04090103          	lb	sp,64(s2)
    197f:	0100                	.insn	2, 0x0100
    1981:	08097f03          	.insn	4, 0x08097f03
    1985:	0100                	.insn	2, 0x0100
    1987:	0306                	.insn	2, 0x0306
    1989:	0900                	.insn	2, 0x0900
    198b:	0004                	.insn	2, 0x0004
    198d:	0601                	.insn	2, 0x0601
    198f:	04090103          	lb	sp,64(s2)
    1993:	0100                	.insn	2, 0x0100
    1995:	08097f03          	.insn	4, 0x08097f03
    1999:	0100                	.insn	2, 0x0100
    199b:	0306                	.insn	2, 0x0306
    199d:	0900                	.insn	2, 0x0900
    199f:	0004                	.insn	2, 0x0004
    19a1:	0601                	.insn	2, 0x0601
    19a3:	04090103          	lb	sp,64(s2)
    19a7:	0100                	.insn	2, 0x0100
    19a9:	08097f03          	.insn	4, 0x08097f03
    19ad:	0100                	.insn	2, 0x0100
    19af:	0306                	.insn	2, 0x0306
    19b1:	0900                	.insn	2, 0x0900
    19b3:	0004                	.insn	2, 0x0004
    19b5:	0601                	.insn	2, 0x0601
    19b7:	04090103          	lb	sp,64(s2)
    19bb:	0100                	.insn	2, 0x0100
    19bd:	0d05                	.insn	2, 0x0d05
    19bf:	08090303          	lb	t1,128(s2)
    19c3:	0100                	.insn	2, 0x0100
    19c5:	0306                	.insn	2, 0x0306
    19c7:	0900                	.insn	2, 0x0900
    19c9:	0004                	.insn	2, 0x0004
    19cb:	0601                	.insn	2, 0x0601
    19cd:	04090103          	lb	sp,64(s2)
    19d1:	0100                	.insn	2, 0x0100
    19d3:	1505                	.insn	2, 0x1505
    19d5:	0c090203          	lb	tp,192(s2)
    19d9:	0100                	.insn	2, 0x0100
    19db:	0306                	.insn	2, 0x0306
    19dd:	0900                	.insn	2, 0x0900
    19df:	0004                	.insn	2, 0x0004
    19e1:	0301                	.insn	2, 0x0301
    19e3:	0900                	.insn	2, 0x0900
    19e5:	0004                	.insn	2, 0x0004
    19e7:	0301                	.insn	2, 0x0301
    19e9:	0900                	.insn	2, 0x0900
    19eb:	0004                	.insn	2, 0x0004
    19ed:	0301                	.insn	2, 0x0301
    19ef:	0900                	.insn	2, 0x0900
    19f1:	0004                	.insn	2, 0x0004
    19f3:	0301                	.insn	2, 0x0301
    19f5:	0900                	.insn	2, 0x0900
    19f7:	0004                	.insn	2, 0x0004
    19f9:	0601                	.insn	2, 0x0601
    19fb:	08090103          	lb	sp,128(s2)
    19ff:	0100                	.insn	2, 0x0100
    1a01:	08097f03          	.insn	4, 0x08097f03
    1a05:	0100                	.insn	2, 0x0100
    1a07:	0306                	.insn	2, 0x0306
    1a09:	0900                	.insn	2, 0x0900
    1a0b:	0004                	.insn	2, 0x0004
    1a0d:	0601                	.insn	2, 0x0601
    1a0f:	04090103          	lb	sp,64(s2)
    1a13:	0100                	.insn	2, 0x0100
    1a15:	08097f03          	.insn	4, 0x08097f03
    1a19:	0100                	.insn	2, 0x0100
    1a1b:	0306                	.insn	2, 0x0306
    1a1d:	0900                	.insn	2, 0x0900
    1a1f:	0004                	.insn	2, 0x0004
    1a21:	0601                	.insn	2, 0x0601
    1a23:	04090103          	lb	sp,64(s2)
    1a27:	0100                	.insn	2, 0x0100
    1a29:	0306                	.insn	2, 0x0306
    1a2b:	7eae                	.insn	2, 0x7eae
    1a2d:	0809                	.insn	2, 0x0809
    1a2f:	0100                	.insn	2, 0x0100
    1a31:	0409                	.insn	2, 0x0409
    1a33:	0000                	.insn	2, 0x0000
    1a35:	0101                	.insn	2, 0x0101
