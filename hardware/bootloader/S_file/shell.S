
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
  400018:	a74080e7          	jalr	-1420(ra) # 400a88 <exit>

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
  400058:	c9b50513          	addi	a0,a0,-869 # 401c9b <$d.1>
  40005c:	00001097          	auipc	ra,0x1
  400060:	e14080e7          	jalr	-492(ra) # 400e70 <printf>
  400064:	00000d13          	li	s10,0
  400068:	00402537          	lui	a0,0x402
  40006c:	c1550413          	addi	s0,a0,-1003 # 401c15 <__modsi3+0x145>
  400070:	00402537          	lui	a0,0x402
  400074:	b4950493          	addi	s1,a0,-1207 # 401b49 <__modsi3+0x79>
  400078:	00402537          	lui	a0,0x402
  40007c:	c0f50513          	addi	a0,a0,-1009 # 401c0f <__modsi3+0x13f>
  400080:	08a12423          	sw	a0,136(sp)
  400084:	00402537          	lui	a0,0x402
  400088:	bac50513          	addi	a0,a0,-1108 # 401bac <__modsi3+0xdc>
  40008c:	06a12e23          	sw	a0,124(sp)
  400090:	00402537          	lui	a0,0x402
  400094:	ca950513          	addi	a0,a0,-855 # 401ca9 <$d.1+0xe>
  400098:	08a12223          	sw	a0,132(sp)
  40009c:	00402537          	lui	a0,0x402
  4000a0:	bc550513          	addi	a0,a0,-1083 # 401bc5 <__modsi3+0xf5>
  4000a4:	08a12023          	sw	a0,128(sp)
  4000a8:	00402537          	lui	a0,0x402
  4000ac:	d0250513          	addi	a0,a0,-766 # 401d02 <$d.2+0x2a>
  4000b0:	06a12623          	sw	a0,108(sp)
  4000b4:	00018537          	lui	a0,0x18
  4000b8:	6a050513          	addi	a0,a0,1696 # 186a0 <$d.5+0x17254>
  4000bc:	06a12423          	sw	a0,104(sp)
  4000c0:	00402537          	lui	a0,0x402
  4000c4:	ba250513          	addi	a0,a0,-1118 # 401ba2 <__modsi3+0xd2>
  4000c8:	06a12c23          	sw	a0,120(sp)
  4000cc:	00402537          	lui	a0,0x402
  4000d0:	bfb50513          	addi	a0,a0,-1029 # 401bfb <__modsi3+0x12b>
  4000d4:	06a12a23          	sw	a0,116(sp)
  4000d8:	00402537          	lui	a0,0x402
  4000dc:	c2250513          	addi	a0,a0,-990 # 401c22 <__modsi3+0x152>
  4000e0:	04a12e23          	sw	a0,92(sp)
  4000e4:	00402537          	lui	a0,0x402
  4000e8:	c7f50513          	addi	a0,a0,-897 # 401c7f <__modsi3+0x1af>
  4000ec:	06a12823          	sw	a0,112(sp)
  4000f0:	00402537          	lui	a0,0x402
  4000f4:	c6150513          	addi	a0,a0,-927 # 401c61 <__modsi3+0x191>
  4000f8:	04a12c23          	sw	a0,88(sp)
  4000fc:	00402537          	lui	a0,0x402
  400100:	b9150513          	addi	a0,a0,-1135 # 401b91 <__modsi3+0xc1>
  400104:	06a12223          	sw	a0,100(sp)
  400108:	00402537          	lui	a0,0x402
  40010c:	ce950513          	addi	a0,a0,-791 # 401ce9 <$d.2+0x11>
  400110:	04a12823          	sw	a0,80(sp)
  400114:	00402537          	lui	a0,0x402
  400118:	b9950513          	addi	a0,a0,-1127 # 401b99 <__modsi3+0xc9>
  40011c:	06a12023          	sw	a0,96(sp)
  400120:	00402537          	lui	a0,0x402
  400124:	d3150513          	addi	a0,a0,-719 # 401d31 <$d.1+0x10>
  400128:	04a12423          	sw	a0,72(sp)
  40012c:	00402537          	lui	a0,0x402
  400130:	b6950513          	addi	a0,a0,-1175 # 401b69 <__modsi3+0x99>
  400134:	04a12023          	sw	a0,64(sp)
  400138:	00402537          	lui	a0,0x402
  40013c:	c0450513          	addi	a0,a0,-1020 # 401c04 <__modsi3+0x134>
  400140:	04a12a23          	sw	a0,84(sp)
  400144:	00402537          	lui	a0,0x402
  400148:	c3e50513          	addi	a0,a0,-962 # 401c3e <__modsi3+0x16e>
  40014c:	02a12e23          	sw	a0,60(sp)
  400150:	00402537          	lui	a0,0x402
  400154:	d4b50513          	addi	a0,a0,-693 # 401d4b <$d.1+0x2a>
  400158:	02a12023          	sw	a0,32(sp)
  40015c:	00402537          	lui	a0,0x402
  400160:	c8850513          	addi	a0,a0,-888 # 401c88 <__modsi3+0x1b8>
  400164:	00a12e23          	sw	a0,28(sp)
  400168:	00402537          	lui	a0,0x402
  40016c:	cae50513          	addi	a0,a0,-850 # 401cae <$d.1+0x13>
  400170:	00a12c23          	sw	a0,24(sp)
  400174:	00402537          	lui	a0,0x402
  400178:	cca50513          	addi	a0,a0,-822 # 401cca <$d.1+0x2f>
  40017c:	00a12a23          	sw	a0,20(sp)
  400180:	00402537          	lui	a0,0x402
  400184:	c5250513          	addi	a0,a0,-942 # 401c52 <__modsi3+0x182>
  400188:	00a12823          	sw	a0,16(sp)
  40018c:	00402537          	lui	a0,0x402
  400190:	b5650513          	addi	a0,a0,-1194 # 401b56 <__modsi3+0x86>
  400194:	04a12623          	sw	a0,76(sp)
  400198:	00402537          	lui	a0,0x402
  40019c:	b5f50513          	addi	a0,a0,-1185 # 401b5f <__modsi3+0x8f>
  4001a0:	04a12223          	sw	a0,68(sp)
  4001a4:	00402537          	lui	a0,0x402
  4001a8:	b3050513          	addi	a0,a0,-1232 # 401b30 <__modsi3+0x60>
  4001ac:	02a12223          	sw	a0,36(sp)
  4001b0:	00402537          	lui	a0,0x402
  4001b4:	c7a50513          	addi	a0,a0,-902 # 401c7a <__modsi3+0x1aa>
  4001b8:	02a12c23          	sw	a0,56(sp)
  4001bc:	00402537          	lui	a0,0x402
  4001c0:	c3350513          	addi	a0,a0,-973 # 401c33 <__modsi3+0x163>
  4001c4:	00a12623          	sw	a0,12(sp)
  4001c8:	00402537          	lui	a0,0x402
  4001cc:	d5850513          	addi	a0,a0,-680 # 401d58 <$d.1+0x37>
  4001d0:	02a12a23          	sw	a0,52(sp)
  4001d4:	00402537          	lui	a0,0x402
  4001d8:	d1c50513          	addi	a0,a0,-740 # 401d1c <$d.2+0x44>
  4001dc:	02a12823          	sw	a0,48(sp)
  4001e0:	00402537          	lui	a0,0x402
  4001e4:	c9950513          	addi	a0,a0,-871 # 401c99 <__modsi3+0x1c9>
  4001e8:	02a12623          	sw	a0,44(sp)
  4001ec:	00402537          	lui	a0,0x402
  4001f0:	bcc50513          	addi	a0,a0,-1076 # 401bcc <__modsi3+0xfc>
  4001f4:	02a12423          	sw	a0,40(sp)
  4001f8:	02000c93          	li	s9,32
  4001fc:	00a00c13          	li	s8,10
  400200:	00c00b93          	li	s7,12
  400204:	00800b13          	li	s6,8
  400208:	00900a93          	li	s5,9
  40020c:	01f00a13          	li	s4,31
  400210:	07f00913          	li	s2,127
  400214:	0140006f          	j	400228 <main+0x20c>
  400218:	07c12503          	lw	a0,124(sp)

        if (argc == 0) continue;

        /* ===== コマンド分岐 ===== */
        if (strcmp(argv[0], "hello") == 0) {
            printf("Hello world from shell!\n");
  40021c:	00001097          	auipc	ra,0x1
  400220:	c54080e7          	jalr	-940(ra) # 400e70 <printf>
  400224:	01f00a13          	li	s4,31
        putchar(0x1B); putchar('['); putchar('3'); putchar('4'); putchar('m'); // 青
  400228:	01b00513          	li	a0,27
  40022c:	00001097          	auipc	ra,0x1
  400230:	b78080e7          	jalr	-1160(ra) # 400da4 <putchar>
  400234:	05b00513          	li	a0,91
  400238:	00001097          	auipc	ra,0x1
  40023c:	b6c080e7          	jalr	-1172(ra) # 400da4 <putchar>
  400240:	03300513          	li	a0,51
  400244:	00001097          	auipc	ra,0x1
  400248:	b60080e7          	jalr	-1184(ra) # 400da4 <putchar>
  40024c:	03400513          	li	a0,52
  400250:	00001097          	auipc	ra,0x1
  400254:	b54080e7          	jalr	-1196(ra) # 400da4 <putchar>
  400258:	06d00513          	li	a0,109
  40025c:	00001097          	auipc	ra,0x1
  400260:	b48080e7          	jalr	-1208(ra) # 400da4 <putchar>
        putchar('P');
  400264:	05000513          	li	a0,80
  400268:	00001097          	auipc	ra,0x1
  40026c:	b3c080e7          	jalr	-1220(ra) # 400da4 <putchar>
        putchar('S');
  400270:	05300513          	li	a0,83
  400274:	00001097          	auipc	ra,0x1
  400278:	b30080e7          	jalr	-1232(ra) # 400da4 <putchar>
        putchar('C');
  40027c:	04300513          	li	a0,67
  400280:	00001097          	auipc	ra,0x1
  400284:	b24080e7          	jalr	-1244(ra) # 400da4 <putchar>
        putchar('_');
  400288:	05f00513          	li	a0,95
  40028c:	00001097          	auipc	ra,0x1
  400290:	b18080e7          	jalr	-1256(ra) # 400da4 <putchar>
        putchar('O');
  400294:	04f00513          	li	a0,79
  400298:	00001097          	auipc	ra,0x1
  40029c:	b0c080e7          	jalr	-1268(ra) # 400da4 <putchar>
        putchar('S');
  4002a0:	05300513          	li	a0,83
  4002a4:	00001097          	auipc	ra,0x1
  4002a8:	b00080e7          	jalr	-1280(ra) # 400da4 <putchar>
        putchar('>');
  4002ac:	03e00513          	li	a0,62
  4002b0:	00001097          	auipc	ra,0x1
  4002b4:	af4080e7          	jalr	-1292(ra) # 400da4 <putchar>
        putchar(' ');
  4002b8:	02000513          	li	a0,32
  4002bc:	00001097          	auipc	ra,0x1
  4002c0:	ae8080e7          	jalr	-1304(ra) # 400da4 <putchar>
        putchar(0x1B); putchar('['); putchar('0'); putchar('m'); // リセット
  4002c4:	01b00513          	li	a0,27
  4002c8:	00001097          	auipc	ra,0x1
  4002cc:	adc080e7          	jalr	-1316(ra) # 400da4 <putchar>
  4002d0:	05b00513          	li	a0,91
  4002d4:	00001097          	auipc	ra,0x1
  4002d8:	ad0080e7          	jalr	-1328(ra) # 400da4 <putchar>
  4002dc:	03000513          	li	a0,48
  4002e0:	00001097          	auipc	ra,0x1
  4002e4:	ac4080e7          	jalr	-1340(ra) # 400da4 <putchar>
  4002e8:	06d00513          	li	a0,109
  4002ec:	00000993          	li	s3,0
  4002f0:	0ff57513          	zext.b	a0,a0
  4002f4:	00001097          	auipc	ra,0x1
  4002f8:	ab0080e7          	jalr	-1360(ra) # 400da4 <putchar>
  4002fc:	00c0006f          	j	400308 <main+0x2ec>
            if (ch == 8 || ch == 127) {
  400300:	07251c63          	bne	a0,s2,400378 <main+0x35c>
                if (len > 0) {
  400304:	0b304063          	bgtz	s3,4003a4 <main+0x388>
            uint32_t sw = poll_switch_api() & 0x03;
  400308:	00001097          	auipc	ra,0x1
  40030c:	f6c080e7          	jalr	-148(ra) # 401274 <poll_switch_api>
            bool sw1_pressed = ((prev_sw & 0x01) != 0) && ((sw & 0x01) == 0);
  400310:	001d7593          	andi	a1,s10,1
            uint32_t sw = poll_switch_api() & 0x03;
  400314:	00050d93          	mv	s11,a0
            if (sw1_pressed) {
  400318:	00058c63          	beqz	a1,400330 <main+0x314>
  40031c:	001df513          	andi	a0,s11,1
  400320:	00051863          	bnez	a0,400330 <main+0x314>
                printf("SW1 pressed\n");
  400324:	00040513          	mv	a0,s0
  400328:	00001097          	auipc	ra,0x1
  40032c:	b48080e7          	jalr	-1208(ra) # 400e70 <printf>
  400330:	001d5513          	srli	a0,s10,0x1
  400334:	002df593          	andi	a1,s11,2
  400338:	0015b593          	seqz	a1,a1
  40033c:	00b57533          	and	a0,a0,a1
            if (sw2_pressed) {
  400340:	00050863          	beqz	a0,400350 <main+0x334>
                printf("SW2 pressed\n");
  400344:	00048513          	mv	a0,s1
  400348:	00001097          	auipc	ra,0x1
  40034c:	b28080e7          	jalr	-1240(ra) # 400e70 <printf>
  400350:	003dfd13          	andi	s10,s11,3
            int ch = getchar_timeout();
  400354:	00001097          	auipc	ra,0x1
  400358:	f00080e7          	jalr	-256(ra) # 401254 <getchar_timeout>
            if (ch < 0) {
  40035c:	fa0546e3          	bltz	a0,400308 <main+0x2ec>
            if (ch == '\n' && len == 0) {
  400360:	01851463          	bne	a0,s8,400368 <main+0x34c>
  400364:	fa0982e3          	beqz	s3,400308 <main+0x2ec>
            if (ch == 8 || ch == 127) {
  400368:	f8abcce3          	blt	s7,a0,400300 <main+0x2e4>
  40036c:	f9650ce3          	beq	a0,s6,400304 <main+0x2e8>
  400370:	01851863          	bne	a0,s8,400380 <main+0x364>
  400374:	0540006f          	j	4003c8 <main+0x3ac>
  400378:	00d00593          	li	a1,13
  40037c:	04b50663          	beq	a0,a1,4003c8 <main+0x3ac>
  400380:	00aa6463          	bltu	s4,a0,400388 <main+0x36c>
  400384:	f95512e3          	bne	a0,s5,400308 <main+0x2ec>
            if (len >= (int)sizeof(cmdline) - 1) {
  400388:	01e00593          	li	a1,30
  40038c:	e935cee3          	blt	a1,s3,400228 <main+0x20c>
            cmdline[len++] = (char)ch;
  400390:	0ac10593          	addi	a1,sp,172
  400394:	013585b3          	add	a1,a1,s3
  400398:	00198993          	addi	s3,s3,1
  40039c:	00a58023          	sb	a0,0(a1)
  4003a0:	f51ff06f          	j	4002f0 <main+0x2d4>
                    len--;
  4003a4:	fff98993          	addi	s3,s3,-1
                    putchar('\b');
  4003a8:	00800513          	li	a0,8
  4003ac:	00001097          	auipc	ra,0x1
  4003b0:	9f8080e7          	jalr	-1544(ra) # 400da4 <putchar>
                    putchar(' ');
  4003b4:	02000513          	li	a0,32
  4003b8:	00001097          	auipc	ra,0x1
  4003bc:	9ec080e7          	jalr	-1556(ra) # 400da4 <putchar>
  4003c0:	00800513          	li	a0,8
  4003c4:	f2dff06f          	j	4002f0 <main+0x2d4>
                putchar('\n');
  4003c8:	00a00513          	li	a0,10
  4003cc:	00001097          	auipc	ra,0x1
  4003d0:	9d8080e7          	jalr	-1576(ra) # 400da4 <putchar>
                cmdline[len] = '\0';
  4003d4:	0ac10513          	addi	a0,sp,172
  4003d8:	01350533          	add	a0,a0,s3
  4003dc:	00050023          	sb	zero,0(a0)
  4003e0:	e40984e3          	beqz	s3,400228 <main+0x20c>
  4003e4:	0ac10513          	addi	a0,sp,172
  4003e8:	0080006f          	j	4003f0 <main+0x3d4>
        while (*p == ' ' || *p == '\t') p++;
  4003ec:	00150513          	addi	a0,a0,1
  4003f0:	00054583          	lbu	a1,0(a0)
  4003f4:	ff558ce3          	beq	a1,s5,4003ec <main+0x3d0>
  4003f8:	ff958ae3          	beq	a1,s9,4003ec <main+0x3d0>
  4003fc:	e20586e3          	beqz	a1,400228 <main+0x20c>
  400400:	00000a13          	li	s4,0
  400404:	08c10693          	addi	a3,sp,140
  400408:	00600713          	li	a4,6
  40040c:	000a0993          	mv	s3,s4
  400410:	00050593          	mv	a1,a0
            argv[argc++] = p;
  400414:	001a0a13          	addi	s4,s4,1
  400418:	00299513          	slli	a0,s3,0x2
  40041c:	00a68533          	add	a0,a3,a0
  400420:	00b52023          	sw	a1,0(a0)
            while (*p && *p != ' ' && *p != '\t') p++;
  400424:	00158513          	addi	a0,a1,1
  400428:	0005c603          	lbu	a2,0(a1)
  40042c:	04060063          	beqz	a2,40046c <main+0x450>
  400430:	01560e63          	beq	a2,s5,40044c <main+0x430>
  400434:	01960c63          	beq	a2,s9,40044c <main+0x430>
  400438:	00158593          	addi	a1,a1,1
  40043c:	00150513          	addi	a0,a0,1
  400440:	0005c603          	lbu	a2,0(a1)
  400444:	fe0616e3          	bnez	a2,400430 <main+0x414>
  400448:	0240006f          	j	40046c <main+0x450>
            *p++ = '\0';
  40044c:	00058023          	sb	zero,0(a1)
  400450:	0080006f          	j	400458 <main+0x43c>
  400454:	00150513          	addi	a0,a0,1
            while (*p == ' ' || *p == '\t') p++;
  400458:	00054583          	lbu	a1,0(a0)
  40045c:	ff958ce3          	beq	a1,s9,400454 <main+0x438>
  400460:	ff558ae3          	beq	a1,s5,400454 <main+0x438>
        while (*p && argc < ARGV_MAX) {
  400464:	00058463          	beqz	a1,40046c <main+0x450>
  400468:	fb3772e3          	bgeu	a4,s3,40040c <main+0x3f0>
        if (strcmp(argv[0], "hello") == 0) {
  40046c:	08c12503          	lw	a0,140(sp)
  400470:	00050d93          	mv	s11,a0
  400474:	08812583          	lw	a1,136(sp)
  400478:	00001097          	auipc	ra,0x1
  40047c:	9b8080e7          	jalr	-1608(ra) # 400e30 <strcmp>
  400480:	d8050ce3          	beqz	a0,400218 <main+0x1fc>

        // ---- Dump ----
        } else if (strcmp(argv[0], "dump") == 0) {
  400484:	000d8513          	mv	a0,s11
  400488:	08412583          	lw	a1,132(sp)
  40048c:	00001097          	auipc	ra,0x1
  400490:	9a4080e7          	jalr	-1628(ra) # 400e30 <strcmp>
  400494:	12050063          	beqz	a0,4005b4 <main+0x598>
            unsigned lenb = (argc >= 3) ? parse_u32(argv[2]) : 0x100;
            hexdump((const void*)addr, lenb, (uintptr_t)addr);
        */

        // ---- 素数出力サンプル ----
        } else if (strcmp(argv[0], "primes") == 0) {
  400498:	000d8513          	mv	a0,s11
  40049c:	08012583          	lw	a1,128(sp)
  4004a0:	00001097          	auipc	ra,0x1
  4004a4:	990080e7          	jalr	-1648(ra) # 400e30 <strcmp>
  4004a8:	01f00a13          	li	s4,31
  4004ac:	14050c63          	beqz	a0,400604 <main+0x5e8>
                }
            }
            cmd_primes(max);

        // ---- セルフテスト ----
        } else if (strcmp(argv[0], "self_test") == 0) {
  4004b0:	000d8513          	mv	a0,s11
  4004b4:	07812583          	lw	a1,120(sp)
  4004b8:	00001097          	auipc	ra,0x1
  4004bc:	978080e7          	jalr	-1672(ra) # 400e30 <strcmp>
  4004c0:	d60504e3          	beqz	a0,400228 <main+0x20c>
            //TBD
            //cmd_primes(max);

        // ---- SynapEngine ----
        } else if (strcmp(argv[0], "sa_start") == 0) {
  4004c4:	000d8513          	mv	a0,s11
  4004c8:	07412583          	lw	a1,116(sp)
  4004cc:	00001097          	auipc	ra,0x1
  4004d0:	964080e7          	jalr	-1692(ra) # 400e30 <strcmp>
  4004d4:	16050c63          	beqz	a0,40064c <main+0x630>
            }
            // SA API call 
            call_sa_api(matrix_max);

        // ---- I2S MIC READ ----
        } else if (strcmp(argv[0], "mic_read") == 0) {
  4004d8:	000d8513          	mv	a0,s11
  4004dc:	07012583          	lw	a1,112(sp)
  4004e0:	00001097          	auipc	ra,0x1
  4004e4:	950080e7          	jalr	-1712(ra) # 400e30 <strcmp>
  4004e8:	18050e63          	beqz	a0,400684 <main+0x668>

            unsigned count = parse_u32(argv[1]);
            call_mic_api(count);

        // ---- SDカードREAD ----
        } else if (strcmp(argv[0], "sd_read") == 0) {
  4004ec:	000d8513          	mv	a0,s11
  4004f0:	06412583          	lw	a1,100(sp)
  4004f4:	00001097          	auipc	ra,0x1
  4004f8:	93c080e7          	jalr	-1732(ra) # 400e30 <strcmp>
  4004fc:	26050a63          	beqz	a0,400770 <main+0x754>

            unsigned sd_sector = parse_u32(argv[1]);
            call_sd_read_api(sd_sector);

        // ---- SDカードWRITE ----
        } else if (strcmp(argv[0], "sd_write") == 0) {
  400500:	000d8513          	mv	a0,s11
  400504:	06012583          	lw	a1,96(sp)
  400508:	00001097          	auipc	ra,0x1
  40050c:	928080e7          	jalr	-1752(ra) # 400e30 <strcmp>
  400510:	28050a63          	beqz	a0,4007a4 <main+0x788>
                goto prompt;
            }
            call_sd_write_api(sd_sector);

        // ---- FAT32 Info ----
        } else if (strcmp(argv[0], "fat32_info") == 0) {
  400514:	000d8513          	mv	a0,s11
  400518:	05412583          	lw	a1,84(sp)
  40051c:	00001097          	auipc	ra,0x1
  400520:	914080e7          	jalr	-1772(ra) # 400e30 <strcmp>
  400524:	32050263          	beqz	a0,400848 <main+0x82c>
            printf("spc=%x\n",           g_fat32.sectors_per_cluster);
            printf("fat_begin=%x\n",     g_fat32.fat_begin);
            printf("data_begin=%x\n",    g_fat32.data_begin);

        // ---- FAT32 ls ----
        } else if (strcmp(argv[0], "fat32_ls") == 0) {
  400528:	000d8513          	mv	a0,s11
  40052c:	04c12583          	lw	a1,76(sp)
  400530:	00001097          	auipc	ra,0x1
  400534:	900080e7          	jalr	-1792(ra) # 400e30 <strcmp>
  400538:	32050863          	beqz	a0,400868 <main+0x84c>

            fat32_ls();

        // ---- FAT32 cat ----
        } else if (strcmp(argv[0], "fat32_cat") == 0) {
  40053c:	000d8513          	mv	a0,s11
  400540:	04412583          	lw	a1,68(sp)
  400544:	00001097          	auipc	ra,0x1
  400548:	8ec080e7          	jalr	-1812(ra) # 400e30 <strcmp>
  40054c:	32050463          	beqz	a0,400874 <main+0x858>
            }

            fat32_cat(argv[1]);

        // ---- Helps出力 ----
        } else if (strcmp(argv[0], "help") == 0) {
  400550:	000d8513          	mv	a0,s11
  400554:	03812583          	lw	a1,56(sp)
  400558:	00001097          	auipc	ra,0x1
  40055c:	8d8080e7          	jalr	-1832(ra) # 400e30 <strcmp>
  400560:	38050463          	beqz	a0,4008e8 <main+0x8cc>
            printf("  sa_start\n");
            printf("  sd_read\n");
            printf("  exit | quit | q\n");
            */

        } else if (strcmp(argv[0], "exit") == 0 ||
  400564:	000d8513          	mv	a0,s11
  400568:	03412583          	lw	a1,52(sp)
  40056c:	00001097          	auipc	ra,0x1
  400570:	8c4080e7          	jalr	-1852(ra) # 400e30 <strcmp>
  400574:	38050263          	beqz	a0,4008f8 <main+0x8dc>
                   strcmp(argv[0], "quit") == 0 ||
  400578:	000d8513          	mv	a0,s11
  40057c:	03012583          	lw	a1,48(sp)
  400580:	00001097          	auipc	ra,0x1
  400584:	8b0080e7          	jalr	-1872(ra) # 400e30 <strcmp>
  400588:	36050863          	beqz	a0,4008f8 <main+0x8dc>
                   strcmp(argv[0], "q") == 0) {
  40058c:	000d8513          	mv	a0,s11
  400590:	02c12583          	lw	a1,44(sp)
  400594:	00001097          	auipc	ra,0x1
  400598:	89c080e7          	jalr	-1892(ra) # 400e30 <strcmp>
        } else if (strcmp(argv[0], "exit") == 0 ||
  40059c:	34050e63          	beqz	a0,4008f8 <main+0x8dc>
  4005a0:	02812503          	lw	a0,40(sp)
            exit();
        
        } else {
            printf("unknown command: %s\n", argv[0]);
  4005a4:	000d8593          	mv	a1,s11
  4005a8:	00001097          	auipc	ra,0x1
  4005ac:	8c8080e7          	jalr	-1848(ra) # 400e70 <printf>
  4005b0:	c79ff06f          	j	400228 <main+0x20c>
  4005b4:	10000593          	li	a1,256
            if (argc >= 2) {
  4005b8:	06098863          	beqz	s3,400628 <main+0x60c>
                if (parse_hex(argv[1], &val) == 0) {
  4005bc:	09012683          	lw	a3,144(sp)
/* 簡易16進パーサ（"  0x1234" / "1234" 形式どちらも可） */
int parse_hex(const char *s, uintptr_t *out) {
    uintptr_t v = 0;

    /* skip leading spaces */
    while (*s == ' ' || *s == '\t') s++;
  4005c0:	00268693          	addi	a3,a3,2
  4005c4:	00600813          	li	a6,6
  4005c8:	00500893          	li	a7,5
  4005cc:	0080006f          	j	4005d4 <main+0x5b8>
  4005d0:	00168693          	addi	a3,a3,1
  4005d4:	ffe6c603          	lbu	a2,-2(a3)
  4005d8:	ff560ce3          	beq	a2,s5,4005d0 <main+0x5b4>
  4005dc:	ff960ae3          	beq	a2,s9,4005d0 <main+0x5b4>
  4005e0:	03000513          	li	a0,48
  4005e4:	04a61c63          	bne	a2,a0,40063c <main+0x620>

    /* optional 0x / 0X */
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  4005e8:	fff6c503          	lbu	a0,-1(a3)
  4005ec:	02056513          	ori	a0,a0,32
  4005f0:	07800613          	li	a2,120
  4005f4:	0ac51863          	bne	a0,a2,4006a4 <main+0x688>
    if (!*s) return -1;
  4005f8:	0006c603          	lbu	a2,0(a3)
  4005fc:	0a061863          	bnez	a2,4006ac <main+0x690>
  400600:	0440006f          	j	400644 <main+0x628>
            if (argc >= 2) {
  400604:	06098663          	beqz	s3,400670 <main+0x654>
                max = parse_u32(argv[1]);
  400608:	09012503          	lw	a0,144(sp)
  40060c:	00001097          	auipc	ra,0x1
  400610:	b20080e7          	jalr	-1248(ra) # 40112c <parse_u32>
  400614:	00050593          	mv	a1,a0
  400618:	06c12503          	lw	a0,108(sp)
  40061c:	06812603          	lw	a2,104(sp)
                if (max > 100000) {
  400620:	04b67a63          	bgeu	a2,a1,400674 <main+0x658>
  400624:	2380006f          	j	40085c <main+0x840>
  400628:	00200537          	lui	a0,0x200
  40062c:	01f00a13          	li	s4,31
            call_dump_api(addr, len);
  400630:	00000097          	auipc	ra,0x0
  400634:	7c0080e7          	jalr	1984(ra) # 400df0 <call_dump_api>
  400638:	bf1ff06f          	j	400228 <main+0x20c>
  40063c:	ffe68693          	addi	a3,a3,-2
    if (!*s) return -1;
  400640:	06061663          	bnez	a2,4006ac <main+0x690>
  400644:	00200537          	lui	a0,0x200
  400648:	0bc0006f          	j	400704 <main+0x6e8>
            if (argc >= 2) {
  40064c:	14098263          	beqz	s3,400790 <main+0x774>
                matrix_max = parse_u32(argv[1]);
  400650:	09012503          	lw	a0,144(sp)
  400654:	00001097          	auipc	ra,0x1
  400658:	ad8080e7          	jalr	-1320(ra) # 40112c <parse_u32>
  40065c:	00050593          	mv	a1,a0
  400660:	05c12503          	lw	a0,92(sp)
                if (matrix_max > 4) {
  400664:	00400613          	li	a2,4
  400668:	12b67663          	bgeu	a2,a1,400794 <main+0x778>
  40066c:	1f00006f          	j	40085c <main+0x840>
  400670:	3e800593          	li	a1,1000
            cmd_primes(max);
  400674:	00058513          	mv	a0,a1
  400678:	00000097          	auipc	ra,0x0
  40067c:	354080e7          	jalr	852(ra) # 4009cc <cmd_primes>
  400680:	ba9ff06f          	j	400228 <main+0x20c>
  400684:	05812503          	lw	a0,88(sp)
            if (argc < 2) {
  400688:	1c098a63          	beqz	s3,40085c <main+0x840>
            unsigned count = parse_u32(argv[1]);
  40068c:	09012503          	lw	a0,144(sp)
  400690:	00001097          	auipc	ra,0x1
  400694:	a9c080e7          	jalr	-1380(ra) # 40112c <parse_u32>
            call_mic_api(count);
  400698:	00000097          	auipc	ra,0x0
  40069c:	734080e7          	jalr	1844(ra) # 400dcc <call_mic_api>
  4006a0:	b89ff06f          	j	400228 <main+0x20c>
  4006a4:	ffe68693          	addi	a3,a3,-2
  4006a8:	03000613          	li	a2,48
  4006ac:	00000513          	li	a0,0

    while (*s) {
        char c = *s++;
        uint32_t d;
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  4006b0:	00168693          	addi	a3,a3,1
  4006b4:	0200006f          	j	4006d4 <main+0x6b8>
  4006b8:	0ff67793          	zext.b	a5,a2
    while (*s) {
  4006bc:	0006c603          	lbu	a2,0(a3)
  4006c0:	00f70733          	add	a4,a4,a5
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
        else break;
        v = (v << 4) | d;
  4006c4:	00451513          	slli	a0,a0,0x4
  4006c8:	00a76533          	or	a0,a4,a0
    while (*s) {
  4006cc:	00168693          	addi	a3,a3,1
  4006d0:	02060a63          	beqz	a2,400704 <main+0x6e8>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  4006d4:	fd060713          	addi	a4,a2,-48
  4006d8:	0ff77793          	zext.b	a5,a4
  4006dc:	fd000713          	li	a4,-48
  4006e0:	fd87ece3          	bltu	a5,s8,4006b8 <main+0x69c>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  4006e4:	f9f60713          	addi	a4,a2,-97
  4006e8:	0ff77793          	zext.b	a5,a4
  4006ec:	fa900713          	li	a4,-87
  4006f0:	fd07e4e3          	bltu	a5,a6,4006b8 <main+0x69c>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  4006f4:	fbf60713          	addi	a4,a2,-65
  4006f8:	0ff77793          	zext.b	a5,a4
  4006fc:	fc900713          	li	a4,-55
  400700:	faf8fce3          	bgeu	a7,a5,4006b8 <main+0x69c>
            if (argc >= 3) {
  400704:	00200613          	li	a2,2
  400708:	00ca1a63          	bne	s4,a2,40071c <main+0x700>
  40070c:	01f00a13          	li	s4,31
            call_dump_api(addr, len);
  400710:	00000097          	auipc	ra,0x0
  400714:	6e0080e7          	jalr	1760(ra) # 400df0 <call_dump_api>
  400718:	b11ff06f          	j	400228 <main+0x20c>
                if (parse_hex(argv[2], &val) == 0) {
  40071c:	09412683          	lw	a3,148(sp)
    while (*s == ' ' || *s == '\t') s++;
  400720:	00268693          	addi	a3,a3,2
  400724:	0080006f          	j	40072c <main+0x710>
  400728:	00168693          	addi	a3,a3,1
  40072c:	ffe6c603          	lbu	a2,-2(a3)
  400730:	ff560ce3          	beq	a2,s5,400728 <main+0x70c>
  400734:	ff960ae3          	beq	a2,s9,400728 <main+0x70c>
  400738:	03000713          	li	a4,48
  40073c:	02e61263          	bne	a2,a4,400760 <main+0x744>
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  400740:	fff6c603          	lbu	a2,-1(a3)
  400744:	02066613          	ori	a2,a2,32
  400748:	07800713          	li	a4,120
  40074c:	01f00a13          	li	s4,31
  400750:	08e61663          	bne	a2,a4,4007dc <main+0x7c0>
    if (!*s) return -1;
  400754:	0006c603          	lbu	a2,0(a3)
  400758:	08061663          	bnez	a2,4007e4 <main+0x7c8>
  40075c:	0e00006f          	j	40083c <main+0x820>
  400760:	ffe68693          	addi	a3,a3,-2
  400764:	01f00a13          	li	s4,31
  400768:	06061e63          	bnez	a2,4007e4 <main+0x7c8>
  40076c:	0d00006f          	j	40083c <main+0x820>
  400770:	05012503          	lw	a0,80(sp)
            if (argc < 2) {
  400774:	0e098463          	beqz	s3,40085c <main+0x840>
            unsigned sd_sector = parse_u32(argv[1]);
  400778:	09012503          	lw	a0,144(sp)
  40077c:	00001097          	auipc	ra,0x1
  400780:	9b0080e7          	jalr	-1616(ra) # 40112c <parse_u32>
            call_sd_read_api(sd_sector);
  400784:	00000097          	auipc	ra,0x0
  400788:	654080e7          	jalr	1620(ra) # 400dd8 <call_sd_read_api>
  40078c:	a9dff06f          	j	400228 <main+0x20c>
  400790:	00400593          	li	a1,4
            call_sa_api(matrix_max);
  400794:	00058513          	mv	a0,a1
  400798:	00000097          	auipc	ra,0x0
  40079c:	308080e7          	jalr	776(ra) # 400aa0 <call_sa_api>
  4007a0:	a89ff06f          	j	400228 <main+0x20c>
  4007a4:	04812503          	lw	a0,72(sp)
            if (argc < 2) {
  4007a8:	0a098a63          	beqz	s3,40085c <main+0x840>
            unsigned sd_sector = parse_u32(argv[1]);
  4007ac:	09012503          	lw	a0,144(sp)
  4007b0:	00001097          	auipc	ra,0x1
  4007b4:	97c080e7          	jalr	-1668(ra) # 40112c <parse_u32>
  4007b8:	00050593          	mv	a1,a0
            if (sd_sector < 5000) {
  4007bc:	00355613          	srli	a2,a0,0x3
  4007c0:	04012503          	lw	a0,64(sp)
  4007c4:	27100693          	li	a3,625
  4007c8:	08d66a63          	bltu	a2,a3,40085c <main+0x840>
            call_sd_write_api(sd_sector);
  4007cc:	00058513          	mv	a0,a1
  4007d0:	00000097          	auipc	ra,0x0
  4007d4:	614080e7          	jalr	1556(ra) # 400de4 <call_sd_write_api>
  4007d8:	a51ff06f          	j	400228 <main+0x20c>
  4007dc:	ffe68693          	addi	a3,a3,-2
  4007e0:	03000613          	li	a2,48
  4007e4:	00000593          	li	a1,0
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  4007e8:	00168693          	addi	a3,a3,1
  4007ec:	0200006f          	j	40080c <main+0x7f0>
  4007f0:	0ff67793          	zext.b	a5,a2
    while (*s) {
  4007f4:	0006c603          	lbu	a2,0(a3)
  4007f8:	00f70733          	add	a4,a4,a5
        v = (v << 4) | d;
  4007fc:	00459593          	slli	a1,a1,0x4
  400800:	00b765b3          	or	a1,a4,a1
    while (*s) {
  400804:	00168693          	addi	a3,a3,1
  400808:	02060a63          	beqz	a2,40083c <main+0x820>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  40080c:	fd060713          	addi	a4,a2,-48
  400810:	0ff77793          	zext.b	a5,a4
  400814:	fd000713          	li	a4,-48
  400818:	fd87ece3          	bltu	a5,s8,4007f0 <main+0x7d4>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  40081c:	f9f60713          	addi	a4,a2,-97
  400820:	0ff77793          	zext.b	a5,a4
  400824:	fa900713          	li	a4,-87
  400828:	fd07e4e3          	bltu	a5,a6,4007f0 <main+0x7d4>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  40082c:	fbf60713          	addi	a4,a2,-65
  400830:	0ff77793          	zext.b	a5,a4
  400834:	fc900713          	li	a4,-55
  400838:	faf8fce3          	bgeu	a7,a5,4007f0 <main+0x7d4>
            call_dump_api(addr, len);
  40083c:	00000097          	auipc	ra,0x0
  400840:	5b4080e7          	jalr	1460(ra) # 400df0 <call_dump_api>
  400844:	9e5ff06f          	j	400228 <main+0x20c>
            if (fat32_mount() != 0) {
  400848:	00001097          	auipc	ra,0x1
  40084c:	b24080e7          	jalr	-1244(ra) # 40136c <fat32_mount>
  400850:	00050593          	mv	a1,a0
  400854:	03c12503          	lw	a0,60(sp)
  400858:	02058a63          	beqz	a1,40088c <main+0x870>
  40085c:	00000097          	auipc	ra,0x0
  400860:	614080e7          	jalr	1556(ra) # 400e70 <printf>
  400864:	9c5ff06f          	j	400228 <main+0x20c>
            fat32_ls();
  400868:	00001097          	auipc	ra,0x1
  40086c:	ef0080e7          	jalr	-272(ra) # 401758 <fat32_ls>
  400870:	9b9ff06f          	j	400228 <main+0x20c>
  400874:	02412503          	lw	a0,36(sp)
            if (argc < 2) {
  400878:	fe0982e3          	beqz	s3,40085c <main+0x840>
            fat32_cat(argv[1]);
  40087c:	09012503          	lw	a0,144(sp)
  400880:	00001097          	auipc	ra,0x1
  400884:	a00080e7          	jalr	-1536(ra) # 401280 <fat32_cat>
  400888:	9a1ff06f          	j	400228 <main+0x20c>
  40088c:	00402537          	lui	a0,0x402
            printf("part_lba=%x\n",      g_fat32.part_lba);
  400890:	f6052583          	lw	a1,-160(a0) # 401f60 <g_fat32>
  400894:	f6050993          	addi	s3,a0,-160
  400898:	02012503          	lw	a0,32(sp)
  40089c:	00000097          	auipc	ra,0x0
  4008a0:	5d4080e7          	jalr	1492(ra) # 400e70 <printf>
            printf("root_cluster=%x\n",  g_fat32.root_cluster);
  4008a4:	00c9a583          	lw	a1,12(s3)
  4008a8:	01c12503          	lw	a0,28(sp)
  4008ac:	00000097          	auipc	ra,0x0
  4008b0:	5c4080e7          	jalr	1476(ra) # 400e70 <printf>
            printf("spc=%x\n",           g_fat32.sectors_per_cluster);
  4008b4:	0109a583          	lw	a1,16(s3)
  4008b8:	01812503          	lw	a0,24(sp)
  4008bc:	00000097          	auipc	ra,0x0
  4008c0:	5b4080e7          	jalr	1460(ra) # 400e70 <printf>
            printf("fat_begin=%x\n",     g_fat32.fat_begin);
  4008c4:	0049a583          	lw	a1,4(s3)
  4008c8:	01412503          	lw	a0,20(sp)
  4008cc:	00000097          	auipc	ra,0x0
  4008d0:	5a4080e7          	jalr	1444(ra) # 400e70 <printf>
            printf("data_begin=%x\n",    g_fat32.data_begin);
  4008d4:	0089a583          	lw	a1,8(s3)
  4008d8:	01012503          	lw	a0,16(sp)
  4008dc:	00000097          	auipc	ra,0x0
  4008e0:	594080e7          	jalr	1428(ra) # 400e70 <printf>
  4008e4:	945ff06f          	j	400228 <main+0x20c>
  4008e8:	00c12503          	lw	a0,12(sp)
            printf("commands:\n");
  4008ec:	00000097          	auipc	ra,0x0
  4008f0:	584080e7          	jalr	1412(ra) # 400e70 <printf>
  4008f4:	935ff06f          	j	400228 <main+0x20c>
            exit();
  4008f8:	00000097          	auipc	ra,0x0
  4008fc:	190080e7          	jalr	400(ra) # 400a88 <exit>

00400900 <parse_hex>:
    while (*s == ' ' || *s == '\t') s++;
  400900:	00250613          	addi	a2,a0,2
  400904:	00900693          	li	a3,9
  400908:	02000713          	li	a4,32
  40090c:	0080006f          	j	400914 <parse_hex+0x14>
  400910:	00160613          	addi	a2,a2,1
  400914:	ffe64503          	lbu	a0,-2(a2)
  400918:	fed50ce3          	beq	a0,a3,400910 <parse_hex+0x10>
  40091c:	fee50ae3          	beq	a0,a4,400910 <parse_hex+0x10>
  400920:	03000693          	li	a3,48
  400924:	02d51063          	bne	a0,a3,400944 <parse_hex+0x44>
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  400928:	fff64503          	lbu	a0,-1(a2)
  40092c:	02056513          	ori	a0,a0,32
  400930:	07800693          	li	a3,120
  400934:	02d51063          	bne	a0,a3,400954 <parse_hex+0x54>
    if (!*s) return -1;
  400938:	00064503          	lbu	a0,0(a2)
  40093c:	02051063          	bnez	a0,40095c <parse_hex+0x5c>
  400940:	00c0006f          	j	40094c <parse_hex+0x4c>
  400944:	ffe60613          	addi	a2,a2,-2
  400948:	00051a63          	bnez	a0,40095c <parse_hex+0x5c>
  40094c:	fff00513          	li	a0,-1
    }
    *out = v;
    return 0;
  400950:	00008067          	ret
  400954:	ffe60613          	addi	a2,a2,-2
  400958:	03000513          	li	a0,48
  40095c:	00000693          	li	a3,0
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400960:	00160613          	addi	a2,a2,1
  400964:	00a00713          	li	a4,10
  400968:	00600793          	li	a5,6
  40096c:	00500813          	li	a6,5
  400970:	0200006f          	j	400990 <parse_hex+0x90>
  400974:	0ff57293          	zext.b	t0,a0
    while (*s) {
  400978:	00064503          	lbu	a0,0(a2)
  40097c:	005888b3          	add	a7,a7,t0
        v = (v << 4) | d;
  400980:	00469693          	slli	a3,a3,0x4
  400984:	00d8e6b3          	or	a3,a7,a3
    while (*s) {
  400988:	00160613          	addi	a2,a2,1
  40098c:	02050a63          	beqz	a0,4009c0 <parse_hex+0xc0>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400990:	fd050893          	addi	a7,a0,-48
  400994:	0ff8f293          	zext.b	t0,a7
  400998:	fd000893          	li	a7,-48
  40099c:	fce2ece3          	bltu	t0,a4,400974 <parse_hex+0x74>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  4009a0:	f9f50893          	addi	a7,a0,-97
  4009a4:	0ff8f293          	zext.b	t0,a7
  4009a8:	fa900893          	li	a7,-87
  4009ac:	fcf2e4e3          	bltu	t0,a5,400974 <parse_hex+0x74>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  4009b0:	fbf50893          	addi	a7,a0,-65
  4009b4:	0ff8f293          	zext.b	t0,a7
  4009b8:	fc900893          	li	a7,-55
  4009bc:	fa587ce3          	bgeu	a6,t0,400974 <parse_hex+0x74>
  4009c0:	00000513          	li	a0,0
    *out = v;
  4009c4:	00d5a023          	sw	a3,0(a1)
  4009c8:	00008067          	ret

004009cc <cmd_primes>:
{
  4009cc:	fe010113          	addi	sp,sp,-32
  4009d0:	00112e23          	sw	ra,28(sp)
  4009d4:	00812c23          	sw	s0,24(sp)
  4009d8:	00912a23          	sw	s1,20(sp)
  4009dc:	01212823          	sw	s2,16(sp)
  4009e0:	01312623          	sw	s3,12(sp)
  4009e4:	00200913          	li	s2,2
  4009e8:	00050413          	mv	s0,a0
  4009ec:	00000493          	li	s1,0
    for (unsigned n = 2; n <= max; n++) {
  4009f0:	07256463          	bltu	a0,s2,400a58 <cmd_primes+0x8c>
  4009f4:	00402537          	lui	a0,0x402
  4009f8:	cb650993          	addi	s3,a0,-842 # 401cb6 <$d.1+0x1b>
  4009fc:	00c0006f          	j	400a08 <cmd_primes+0x3c>
  400a00:	00190913          	addi	s2,s2,1
  400a04:	05246063          	bltu	s0,s2,400a44 <cmd_primes+0x78>
        if (is_prime(n)) {
  400a08:	00090513          	mv	a0,s2
  400a0c:	00000097          	auipc	ra,0x0
  400a10:	7c8080e7          	jalr	1992(ra) # 4011d4 <is_prime>
  400a14:	fe0506e3          	beqz	a0,400a00 <cmd_primes+0x34>
            printf("%d ", (int)n);
  400a18:	00098513          	mv	a0,s3
  400a1c:	00090593          	mv	a1,s2
  400a20:	00000097          	auipc	ra,0x0
  400a24:	450080e7          	jalr	1104(ra) # 400e70 <printf>
            count++;
  400a28:	00148493          	addi	s1,s1,1
            if ((count % 8) == 0)
  400a2c:	0074f513          	andi	a0,s1,7
  400a30:	fc0518e3          	bnez	a0,400a00 <cmd_primes+0x34>
                putchar('\n');
  400a34:	00a00513          	li	a0,10
  400a38:	00000097          	auipc	ra,0x0
  400a3c:	36c080e7          	jalr	876(ra) # 400da4 <putchar>
  400a40:	fc1ff06f          	j	400a00 <cmd_primes+0x34>
    if ((count % 8) != 0)
  400a44:	0074f513          	andi	a0,s1,7
  400a48:	00050863          	beqz	a0,400a58 <cmd_primes+0x8c>
        putchar('\n');
  400a4c:	00a00513          	li	a0,10
  400a50:	00000097          	auipc	ra,0x0
  400a54:	354080e7          	jalr	852(ra) # 400da4 <putchar>
    printf("total primes: %d (0..%d)\n", count, (int)max);
  400a58:	00402537          	lui	a0,0x402
  400a5c:	be150513          	addi	a0,a0,-1055 # 401be1 <__modsi3+0x111>
  400a60:	00048593          	mv	a1,s1
  400a64:	00040613          	mv	a2,s0
  400a68:	01c12083          	lw	ra,28(sp)
  400a6c:	01812403          	lw	s0,24(sp)
  400a70:	01412483          	lw	s1,20(sp)
  400a74:	01012903          	lw	s2,16(sp)
  400a78:	00c12983          	lw	s3,12(sp)
  400a7c:	02010113          	addi	sp,sp,32
  400a80:	00000317          	auipc	t1,0x0
  400a84:	3f030067          	jr	1008(t1) # 400e70 <printf>

00400a88 <exit>:
    __asm__ __volatile__ (
  400a88:	00d00693          	li	a3,13
  400a8c:	00000593          	li	a1,0
  400a90:	00000613          	li	a2,0
  400a94:	00000513          	li	a0,0
  400a98:	00000073          	ecall
    for (;;);
  400a9c:	0000006f          	j	400a9c <exit+0x14>

00400aa0 <call_sa_api>:
{
  400aa0:	fa010113          	addi	sp,sp,-96
  400aa4:	00050793          	mv	a5,a0
    for (uint32_t i = 0; i < matrix_size; i++) {
  400aa8:	12050063          	beqz	a0,400bc8 <call_sa_api+0x128>
  400aac:	00000513          	li	a0,0
  400ab0:	00000593          	li	a1,0
  400ab4:	05010613          	addi	a2,sp,80
  400ab8:	04010693          	addi	a3,sp,64
  400abc:	05010713          	addi	a4,sp,80
        for (uint32_t j = 0; j < matrix_size; j++) {
  400ac0:	00259813          	slli	a6,a1,0x2
  400ac4:	01078833          	add	a6,a5,a6
  400ac8:	01060833          	add	a6,a2,a6
  400acc:	00068893          	mv	a7,a3
  400ad0:	00070293          	mv	t0,a4
  400ad4:	00058313          	mv	t1,a1
  400ad8:	00050393          	mv	t2,a0
            matrix_A[i][j] = (uint8_t)(2*i + 2*j + 2);
  400adc:	00131e13          	slli	t3,t1,0x1
  400ae0:	002e0e13          	addi	t3,t3,2
  400ae4:	01c28023          	sb	t3,0(t0)
            matrix_B[i][j] = (uint8_t)(3*i + j + 5);
  400ae8:	00538e13          	addi	t3,t2,5
  400aec:	01c88023          	sb	t3,0(a7)
        for (uint32_t j = 0; j < matrix_size; j++) {
  400af0:	00138393          	addi	t2,t2,1
  400af4:	00130313          	addi	t1,t1,1
  400af8:	00128293          	addi	t0,t0,1
  400afc:	00188893          	addi	a7,a7,1
  400b00:	fd029ee3          	bne	t0,a6,400adc <call_sa_api+0x3c>
    for (uint32_t i = 0; i < matrix_size; i++) {
  400b04:	00158593          	addi	a1,a1,1
  400b08:	00350513          	addi	a0,a0,3
  400b0c:	00470713          	addi	a4,a4,4
  400b10:	00468693          	addi	a3,a3,4
  400b14:	faf596e3          	bne	a1,a5,400ac0 <call_sa_api+0x20>
  400b18:	05010813          	addi	a6,sp,80
  400b1c:	04010893          	addi	a7,sp,64
  400b20:	00010293          	mv	t0,sp
  400b24:	00400313          	li	t1,4
    __asm__ __volatile__ (
  400b28:	00080513          	mv	a0,a6
  400b2c:	00088593          	mv	a1,a7
  400b30:	00028613          	mv	a2,t0
  400b34:	00030693          	mv	a3,t1
  400b38:	00078713          	mv	a4,a5
  400b3c:	00000073          	ecall
  400b40:	00050893          	mv	a7,a0
  400b44:	04100593          	li	a1,65
    __asm__ __volatile__ (
  400b48:	00058513          	mv	a0,a1
  400b4c:	00100693          	li	a3,1
  400b50:	00000073          	ecall
  400b54:	00a00593          	li	a1,10
  400b58:	00058513          	mv	a0,a1
  400b5c:	00100693          	li	a3,1
  400b60:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400b64:	16078a63          	beqz	a5,400cd8 <call_sa_api+0x238>
  400b68:	00000593          	li	a1,0
  400b6c:	02000613          	li	a2,32
  400b70:	00a00713          	li	a4,10
  400b74:	05010893          	addi	a7,sp,80
        for (uint32_t j = 0; j < matrix_size; j++) {
  400b78:	00259513          	slli	a0,a1,0x2
  400b7c:	00a78533          	add	a0,a5,a0
  400b80:	00a802b3          	add	t0,a6,a0
  400b84:	00088313          	mv	t1,a7
            print_int((int)matrix_A[i][j]);
  400b88:	00034383          	lbu	t2,0(t1)
    __asm__ __volatile__ (
  400b8c:	00038513          	mv	a0,t2
  400b90:	00e00693          	li	a3,14
  400b94:	00000073          	ecall
    __asm__ __volatile__ (
  400b98:	00060513          	mv	a0,a2
  400b9c:	00100693          	li	a3,1
  400ba0:	00000073          	ecall
        for (uint32_t j = 0; j < matrix_size; j++) {
  400ba4:	00130313          	addi	t1,t1,1
  400ba8:	fe5310e3          	bne	t1,t0,400b88 <call_sa_api+0xe8>
    __asm__ __volatile__ (
  400bac:	00070513          	mv	a0,a4
  400bb0:	00100693          	li	a3,1
  400bb4:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400bb8:	00158593          	addi	a1,a1,1
  400bbc:	00488893          	addi	a7,a7,4
  400bc0:	faf59ce3          	bne	a1,a5,400b78 <call_sa_api+0xd8>
  400bc4:	0500006f          	j	400c14 <call_sa_api+0x174>
  400bc8:	05010813          	addi	a6,sp,80
  400bcc:	04010893          	addi	a7,sp,64
  400bd0:	00010293          	mv	t0,sp
  400bd4:	00400313          	li	t1,4
    __asm__ __volatile__ (
  400bd8:	00080513          	mv	a0,a6
  400bdc:	00088593          	mv	a1,a7
  400be0:	00028613          	mv	a2,t0
  400be4:	00030693          	mv	a3,t1
  400be8:	00078713          	mv	a4,a5
  400bec:	00000073          	ecall
  400bf0:	00050813          	mv	a6,a0
  400bf4:	04100593          	li	a1,65
    __asm__ __volatile__ (
  400bf8:	00058513          	mv	a0,a1
  400bfc:	00100693          	li	a3,1
  400c00:	00000073          	ecall
  400c04:	00a00593          	li	a1,10
  400c08:	00058513          	mv	a0,a1
  400c0c:	00100693          	li	a3,1
  400c10:	00000073          	ecall
  400c14:	00a00593          	li	a1,10
  400c18:	00058513          	mv	a0,a1
  400c1c:	00100693          	li	a3,1
  400c20:	00000073          	ecall
  400c24:	04200613          	li	a2,66
  400c28:	00060513          	mv	a0,a2
  400c2c:	00100693          	li	a3,1
  400c30:	00000073          	ecall
  400c34:	00058513          	mv	a0,a1
  400c38:	00100693          	li	a3,1
  400c3c:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400c40:	06078463          	beqz	a5,400ca8 <call_sa_api+0x208>
  400c44:	00000593          	li	a1,0
  400c48:	04010613          	addi	a2,sp,64
  400c4c:	02000713          	li	a4,32
  400c50:	00a00813          	li	a6,10
  400c54:	04010893          	addi	a7,sp,64
        for (uint32_t j = 0; j < matrix_size; j++) {
  400c58:	00259513          	slli	a0,a1,0x2
  400c5c:	00a78533          	add	a0,a5,a0
  400c60:	00a602b3          	add	t0,a2,a0
  400c64:	00088313          	mv	t1,a7
            print_int((int)matrix_B[i][j]);
  400c68:	00034383          	lbu	t2,0(t1)
    __asm__ __volatile__ (
  400c6c:	00038513          	mv	a0,t2
  400c70:	00e00693          	li	a3,14
  400c74:	00000073          	ecall
    __asm__ __volatile__ (
  400c78:	00070513          	mv	a0,a4
  400c7c:	00100693          	li	a3,1
  400c80:	00000073          	ecall
        for (uint32_t j = 0; j < matrix_size; j++) {
  400c84:	00130313          	addi	t1,t1,1
  400c88:	fe5310e3          	bne	t1,t0,400c68 <call_sa_api+0x1c8>
    __asm__ __volatile__ (
  400c8c:	00080513          	mv	a0,a6
  400c90:	00100693          	li	a3,1
  400c94:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400c98:	00158593          	addi	a1,a1,1
  400c9c:	00488893          	addi	a7,a7,4
  400ca0:	faf59ce3          	bne	a1,a5,400c58 <call_sa_api+0x1b8>
  400ca4:	0600006f          	j	400d04 <call_sa_api+0x264>
  400ca8:	00a00593          	li	a1,10
    __asm__ __volatile__ (
  400cac:	00058513          	mv	a0,a1
  400cb0:	00100693          	li	a3,1
  400cb4:	00000073          	ecall
  400cb8:	04300613          	li	a2,67
  400cbc:	00060513          	mv	a0,a2
  400cc0:	00100693          	li	a3,1
  400cc4:	00000073          	ecall
  400cc8:	00058513          	mv	a0,a1
  400ccc:	00100693          	li	a3,1
  400cd0:	00000073          	ecall
  400cd4:	0b80006f          	j	400d8c <call_sa_api+0x2ec>
  400cd8:	00a00593          	li	a1,10
  400cdc:	00058513          	mv	a0,a1
  400ce0:	00100693          	li	a3,1
  400ce4:	00000073          	ecall
  400ce8:	04200613          	li	a2,66
  400cec:	00060513          	mv	a0,a2
  400cf0:	00100693          	li	a3,1
  400cf4:	00000073          	ecall
  400cf8:	00058513          	mv	a0,a1
  400cfc:	00100693          	li	a3,1
  400d00:	00000073          	ecall
  400d04:	00a00593          	li	a1,10
  400d08:	00058513          	mv	a0,a1
  400d0c:	00100693          	li	a3,1
  400d10:	00000073          	ecall
  400d14:	04300613          	li	a2,67
  400d18:	00060513          	mv	a0,a2
  400d1c:	00100693          	li	a3,1
  400d20:	00000073          	ecall
  400d24:	00058513          	mv	a0,a1
  400d28:	00100693          	li	a3,1
  400d2c:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400d30:	04078e63          	beqz	a5,400d8c <call_sa_api+0x2ec>
  400d34:	00000593          	li	a1,0
  400d38:	00010613          	mv	a2,sp
  400d3c:	02000713          	li	a4,32
  400d40:	00a00813          	li	a6,10
  400d44:	00060893          	mv	a7,a2
  400d48:	00078293          	mv	t0,a5
            print_int((int)matrix_C[i][j]);
  400d4c:	0008a303          	lw	t1,0(a7)
    __asm__ __volatile__ (
  400d50:	00030513          	mv	a0,t1
  400d54:	00e00693          	li	a3,14
  400d58:	00000073          	ecall
    __asm__ __volatile__ (
  400d5c:	00070513          	mv	a0,a4
  400d60:	00100693          	li	a3,1
  400d64:	00000073          	ecall
        for (uint32_t j = 0; j < matrix_size; j++) {
  400d68:	fff28293          	addi	t0,t0,-1
  400d6c:	00488893          	addi	a7,a7,4
  400d70:	fc029ee3          	bnez	t0,400d4c <call_sa_api+0x2ac>
    __asm__ __volatile__ (
  400d74:	00080513          	mv	a0,a6
  400d78:	00100693          	li	a3,1
  400d7c:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400d80:	00158593          	addi	a1,a1,1
  400d84:	01060613          	addi	a2,a2,16
  400d88:	faf59ee3          	bne	a1,a5,400d44 <call_sa_api+0x2a4>
  400d8c:	00a00593          	li	a1,10
    __asm__ __volatile__ (
  400d90:	00058513          	mv	a0,a1
  400d94:	00100693          	li	a3,1
  400d98:	00000073          	ecall
}
  400d9c:	06010113          	addi	sp,sp,96
  400da0:	00008067          	ret

00400da4 <putchar>:
{
  400da4:	00050593          	mv	a1,a0
    __asm__ __volatile__ (
  400da8:	00058513          	mv	a0,a1
  400dac:	00100693          	li	a3,1
  400db0:	00000073          	ecall
}
  400db4:	00008067          	ret

00400db8 <print_int>:
{
  400db8:	00050593          	mv	a1,a0
    __asm__ __volatile__ (
  400dbc:	00058513          	mv	a0,a1
  400dc0:	00e00693          	li	a3,14
  400dc4:	00000073          	ecall
}
  400dc8:	00008067          	ret

00400dcc <call_mic_api>:
    __asm__ __volatile__(
  400dcc:	00500693          	li	a3,5
  400dd0:	00000073          	ecall
}
  400dd4:	00008067          	ret

00400dd8 <call_sd_read_api>:
    __asm__ __volatile__(
  400dd8:	00600693          	li	a3,6
  400ddc:	00000073          	ecall
}
  400de0:	00008067          	ret

00400de4 <call_sd_write_api>:
    __asm__ __volatile__(
  400de4:	00600693          	li	a3,6
  400de8:	00000073          	ecall
}
  400dec:	00008067          	ret

00400df0 <call_dump_api>:
    __asm__ __volatile__(
  400df0:	00900693          	li	a3,9
  400df4:	00000073          	ecall
}
  400df8:	00008067          	ret

00400dfc <strcpy>:
    while (*src)
  400dfc:	0005c603          	lbu	a2,0(a1)
  400e00:	00050693          	mv	a3,a0
  400e04:	02060263          	beqz	a2,400e28 <strcpy+0x2c>
  400e08:	00158593          	addi	a1,a1,1
  400e0c:	00050713          	mv	a4,a0
        *d++ = *src++;
  400e10:	00c70023          	sb	a2,0(a4)
    while (*src)
  400e14:	0005c603          	lbu	a2,0(a1)
        *d++ = *src++;
  400e18:	00170693          	addi	a3,a4,1
    while (*src)
  400e1c:	00158593          	addi	a1,a1,1
  400e20:	00068713          	mv	a4,a3
  400e24:	fe0616e3          	bnez	a2,400e10 <strcpy+0x14>
    *d = '\0';
  400e28:	00068023          	sb	zero,0(a3)
    return dst;
  400e2c:	00008067          	ret

00400e30 <strcmp>:
    while (*s1 && *s2) {
  400e30:	00054603          	lbu	a2,0(a0)
  400e34:	02060663          	beqz	a2,400e60 <strcmp+0x30>
  400e38:	00150513          	addi	a0,a0,1
  400e3c:	0005c683          	lbu	a3,0(a1)
  400e40:	0ff67713          	zext.b	a4,a2
  400e44:	00d71a63          	bne	a4,a3,400e58 <strcmp+0x28>
  400e48:	00054603          	lbu	a2,0(a0)
        s2++;
  400e4c:	00158593          	addi	a1,a1,1
    while (*s1 && *s2) {
  400e50:	00150513          	addi	a0,a0,1
  400e54:	fe0614e3          	bnez	a2,400e3c <strcmp+0xc>
    return *(unsigned char *)s1 - *(unsigned char *)s2;
  400e58:	0ff67513          	zext.b	a0,a2
  400e5c:	0080006f          	j	400e64 <strcmp+0x34>
  400e60:	00000513          	li	a0,0
  400e64:	0005c583          	lbu	a1,0(a1)
  400e68:	40b50533          	sub	a0,a0,a1
  400e6c:	00008067          	ret

00400e70 <printf>:
void printf(const char *fmt, ...) {
  400e70:	fb010113          	addi	sp,sp,-80
  400e74:	02812623          	sw	s0,44(sp)
  400e78:	02912423          	sw	s1,40(sp)
  400e7c:	03212223          	sw	s2,36(sp)
  400e80:	03312023          	sw	s3,32(sp)
  400e84:	01412e23          	sw	s4,28(sp)
  400e88:	00050293          	mv	t0,a0
  400e8c:	05112623          	sw	a7,76(sp)
  400e90:	05012423          	sw	a6,72(sp)
  400e94:	04f12223          	sw	a5,68(sp)
  400e98:	04e12023          	sw	a4,64(sp)
  400e9c:	02d12e23          	sw	a3,60(sp)
  400ea0:	02c12c23          	sw	a2,56(sp)
  400ea4:	02b12a23          	sw	a1,52(sp)
  400ea8:	03410513          	addi	a0,sp,52
    va_start(vargs, fmt);
  400eac:	00a12c23          	sw	a0,24(sp)
  400eb0:	02500593          	li	a1,37
  400eb4:	07200613          	li	a2,114
  400eb8:	06400713          	li	a4,100
  400ebc:	02d00793          	li	a5,45
  400ec0:	ccccd537          	lui	a0,0xccccd
  400ec4:	ccd50813          	addi	a6,a0,-819 # cccccccd <USER_MAX+0xcc7ccccd>
  400ec8:	00a00893          	li	a7,10
  400ecc:	00d10313          	addi	t1,sp,13
  400ed0:	00900393          	li	t2,9
  400ed4:	00100e13          	li	t3,1
  400ed8:	03000e93          	li	t4,48
  400edc:	07300f13          	li	t5,115
  400ee0:	07800f93          	li	t6,120
  400ee4:	00402537          	lui	a0,0x402
  400ee8:	cd850413          	addi	s0,a0,-808 # 401cd8 <$d.2>
  400eec:	00c0006f          	j	400ef8 <printf+0x88>
            switch (*fmt) {
  400ef0:	20050863          	beqz	a0,401100 <printf+0x290>
        fmt++;
  400ef4:	00128293          	addi	t0,t0,1
    while (*fmt) {
  400ef8:	0002c483          	lbu	s1,0(t0)
  400efc:	00b48e63          	beq	s1,a1,400f18 <printf+0xa8>
  400f00:	20048863          	beqz	s1,401110 <printf+0x2a0>
    __asm__ __volatile__ (
  400f04:	00048513          	mv	a0,s1
  400f08:	00100693          	li	a3,1
  400f0c:	00000073          	ecall
        fmt++;
  400f10:	00128293          	addi	t0,t0,1
  400f14:	fe5ff06f          	j	400ef8 <printf+0x88>
            switch (*fmt) {
  400f18:	0012c503          	lbu	a0,1(t0)
            fmt++;
  400f1c:	00128293          	addi	t0,t0,1
            switch (*fmt) {
  400f20:	02a64c63          	blt	a2,a0,400f58 <printf+0xe8>
  400f24:	12b50663          	beq	a0,a1,401050 <printf+0x1e0>
  400f28:	fce514e3          	bne	a0,a4,400ef0 <printf+0x80>
                    int value = va_arg(vargs, int);
  400f2c:	01812503          	lw	a0,24(sp)
  400f30:	00450693          	addi	a3,a0,4
  400f34:	00d12c23          	sw	a3,24(sp)
  400f38:	00052483          	lw	s1,0(a0)
                    if (value < 0) {
  400f3c:	1604c063          	bltz	s1,40109c <printf+0x22c>
                    if (u == 0) {
  400f40:	16049663          	bnez	s1,4010ac <printf+0x23c>
    __asm__ __volatile__ (
  400f44:	000e8513          	mv	a0,t4
  400f48:	00100693          	li	a3,1
  400f4c:	00000073          	ecall
        fmt++;
  400f50:	00128293          	addi	t0,t0,1
  400f54:	fa5ff06f          	j	400ef8 <printf+0x88>
            switch (*fmt) {
  400f58:	11e50663          	beq	a0,t5,401064 <printf+0x1f4>
  400f5c:	f9f51ce3          	bne	a0,t6,400ef4 <printf+0x84>
                    unsigned value = va_arg(vargs, unsigned);
  400f60:	01812503          	lw	a0,24(sp)
  400f64:	00450693          	addi	a3,a0,4
  400f68:	00d12c23          	sw	a3,24(sp)
  400f6c:	00052483          	lw	s1,0(a0)
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400f70:	01c4d513          	srli	a0,s1,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400f74:	00a40533          	add	a0,s0,a0
  400f78:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  400f7c:	00090513          	mv	a0,s2
  400f80:	00100693          	li	a3,1
  400f84:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400f88:	00449513          	slli	a0,s1,0x4
  400f8c:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400f90:	00a40533          	add	a0,s0,a0
  400f94:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  400f98:	00090513          	mv	a0,s2
  400f9c:	00100693          	li	a3,1
  400fa0:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400fa4:	00849513          	slli	a0,s1,0x8
  400fa8:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400fac:	00a40533          	add	a0,s0,a0
  400fb0:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  400fb4:	00090513          	mv	a0,s2
  400fb8:	00100693          	li	a3,1
  400fbc:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400fc0:	00c49513          	slli	a0,s1,0xc
  400fc4:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400fc8:	00a40533          	add	a0,s0,a0
  400fcc:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  400fd0:	00090513          	mv	a0,s2
  400fd4:	00100693          	li	a3,1
  400fd8:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400fdc:	01049513          	slli	a0,s1,0x10
  400fe0:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400fe4:	00a40533          	add	a0,s0,a0
  400fe8:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  400fec:	00090513          	mv	a0,s2
  400ff0:	00100693          	li	a3,1
  400ff4:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400ff8:	01449513          	slli	a0,s1,0x14
  400ffc:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  401000:	00a40533          	add	a0,s0,a0
  401004:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  401008:	00090513          	mv	a0,s2
  40100c:	00100693          	li	a3,1
  401010:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  401014:	01849513          	slli	a0,s1,0x18
  401018:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  40101c:	00a40533          	add	a0,s0,a0
  401020:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  401024:	00090513          	mv	a0,s2
  401028:	00100693          	li	a3,1
  40102c:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  401030:	00f4f493          	andi	s1,s1,15
                        putchar("0123456789abcdef"[nibble]);
  401034:	009404b3          	add	s1,s0,s1
  401038:	0004c483          	lbu	s1,0(s1)
    __asm__ __volatile__ (
  40103c:	00048513          	mv	a0,s1
  401040:	00100693          	li	a3,1
  401044:	00000073          	ecall
        fmt++;
  401048:	00128293          	addi	t0,t0,1
  40104c:	eadff06f          	j	400ef8 <printf+0x88>
    __asm__ __volatile__ (
  401050:	00058513          	mv	a0,a1
  401054:	00100693          	li	a3,1
  401058:	00000073          	ecall
        fmt++;
  40105c:	00128293          	addi	t0,t0,1
  401060:	e99ff06f          	j	400ef8 <printf+0x88>
                    const char *s = va_arg(vargs, const char *);
  401064:	01812503          	lw	a0,24(sp)
  401068:	00450693          	addi	a3,a0,4
  40106c:	00d12c23          	sw	a3,24(sp)
  401070:	00052903          	lw	s2,0(a0)
                    while (*s) {
  401074:	00094483          	lbu	s1,0(s2)
  401078:	e6048ee3          	beqz	s1,400ef4 <printf+0x84>
  40107c:	00190913          	addi	s2,s2,1
    __asm__ __volatile__ (
  401080:	00048513          	mv	a0,s1
  401084:	00100693          	li	a3,1
  401088:	00000073          	ecall
                    while (*s) {
  40108c:	00094483          	lbu	s1,0(s2)
  401090:	00190913          	addi	s2,s2,1
  401094:	fe0496e3          	bnez	s1,401080 <printf+0x210>
  401098:	e5dff06f          	j	400ef4 <printf+0x84>
    __asm__ __volatile__ (
  40109c:	00078513          	mv	a0,a5
  4010a0:	00100693          	li	a3,1
  4010a4:	00000073          	ecall
                        u = (unsigned int)(-(value + 1)) + 1;
  4010a8:	409004b3          	neg	s1,s1
  4010ac:	00000513          	li	a0,0
  4010b0:	00048693          	mv	a3,s1
  4010b4:	00050913          	mv	s2,a0
                        u /= 10;
  4010b8:	0304b4b3          	mulhu	s1,s1,a6
  4010bc:	0034d493          	srli	s1,s1,0x3
  4010c0:	03148533          	mul	a0,s1,a7
  4010c4:	40a68533          	sub	a0,a3,a0
                        buf[i++] = '0' + (u % 10);
  4010c8:	03056993          	ori	s3,a0,48
  4010cc:	00190513          	addi	a0,s2,1
  4010d0:	01230a33          	add	s4,t1,s2
  4010d4:	013a0023          	sb	s3,0(s4)
                    while (u > 0) {
  4010d8:	fcd3ece3          	bltu	t2,a3,4010b0 <printf+0x240>
                        putchar(buf[--i]);
  4010dc:	01230533          	add	a0,t1,s2
  4010e0:	00054483          	lbu	s1,0(a0)
    __asm__ __volatile__ (
  4010e4:	00048513          	mv	a0,s1
  4010e8:	00100693          	li	a3,1
  4010ec:	00000073          	ecall
                    while (i > 0) {
  4010f0:	00190513          	addi	a0,s2,1
  4010f4:	fff90913          	addi	s2,s2,-1
  4010f8:	feae42e3          	blt	t3,a0,4010dc <printf+0x26c>
  4010fc:	df9ff06f          	j	400ef4 <printf+0x84>
  401100:	02500593          	li	a1,37
    __asm__ __volatile__ (
  401104:	00058513          	mv	a0,a1
  401108:	00100693          	li	a3,1
  40110c:	00000073          	ecall
  401110:	02c12403          	lw	s0,44(sp)
  401114:	02812483          	lw	s1,40(sp)
  401118:	02412903          	lw	s2,36(sp)
  40111c:	02012983          	lw	s3,32(sp)
  401120:	01c12a03          	lw	s4,28(sp)
}
  401124:	05010113          	addi	sp,sp,80
  401128:	00008067          	ret

0040112c <parse_u32>:
unsigned parse_u32(const char *s) {
  40112c:	00050593          	mv	a1,a0
    if ((s[0] == '0') && (s[1] == 'x' || s[1] == 'X')) {
  401130:	00054503          	lbu	a0,0(a0)
  401134:	03000693          	li	a3,48
  401138:	00a00613          	li	a2,10
  40113c:	02d51063          	bne	a0,a3,40115c <parse_u32+0x30>
  401140:	0015c503          	lbu	a0,1(a1)
  401144:	02056513          	ori	a0,a0,32
  401148:	07800613          	li	a2,120
  40114c:	00c51e63          	bne	a0,a2,401168 <parse_u32+0x3c>
    while (*s) {
  401150:	0025c503          	lbu	a0,2(a1)
        s += 2;
  401154:	00258593          	addi	a1,a1,2
  401158:	01000613          	li	a2,16
  40115c:	00050693          	mv	a3,a0
    while (*s) {
  401160:	00051663          	bnez	a0,40116c <parse_u32+0x40>
  401164:	06c0006f          	j	4011d0 <parse_u32+0xa4>
  401168:	00a00613          	li	a2,10
  40116c:	00000513          	li	a0,0
        if (c >= '0' && c <= '9')       d = (unsigned)(c - '0');
  401170:	00158593          	addi	a1,a1,1
  401174:	00a00713          	li	a4,10
  401178:	00600793          	li	a5,6
  40117c:	00500813          	li	a6,5
  401180:	fd068893          	addi	a7,a3,-48
  401184:	0ff8f293          	zext.b	t0,a7
  401188:	fd000893          	li	a7,-48
  40118c:	02e2e263          	bltu	t0,a4,4011b0 <parse_u32+0x84>
        else if (c >= 'a' && c <= 'f')  d = 10u + (unsigned)(c - 'a');
  401190:	f9f68893          	addi	a7,a3,-97
  401194:	0ff8f293          	zext.b	t0,a7
  401198:	fa900893          	li	a7,-87
  40119c:	00f2ea63          	bltu	t0,a5,4011b0 <parse_u32+0x84>
        else if (c >= 'A' && c <= 'F')  d = 10u + (unsigned)(c - 'A');
  4011a0:	fbf68893          	addi	a7,a3,-65
  4011a4:	0ff8f293          	zext.b	t0,a7
  4011a8:	fc900893          	li	a7,-55
  4011ac:	02586263          	bltu	a6,t0,4011d0 <parse_u32+0xa4>
  4011b0:	0ff6f693          	zext.b	a3,a3
  4011b4:	00d888b3          	add	a7,a7,a3
        if (d >= base) break;
  4011b8:	00c8fc63          	bgeu	a7,a2,4011d0 <parse_u32+0xa4>
    while (*s) {
  4011bc:	0005c683          	lbu	a3,0(a1)
        v = v * base + d;
  4011c0:	02c50533          	mul	a0,a0,a2
  4011c4:	00a88533          	add	a0,a7,a0
    while (*s) {
  4011c8:	00158593          	addi	a1,a1,1
  4011cc:	fa069ae3          	bnez	a3,401180 <parse_u32+0x54>
    return v;
  4011d0:	00008067          	ret

004011d4 <is_prime>:
{
  4011d4:	00200593          	li	a1,2
    if (n < 2) return false;
  4011d8:	00b57663          	bgeu	a0,a1,4011e4 <is_prime+0x10>
  4011dc:	00000513          	li	a0,0
}
  4011e0:	00008067          	ret
  4011e4:	ff010113          	addi	sp,sp,-16
  4011e8:	00112623          	sw	ra,12(sp)
  4011ec:	00812423          	sw	s0,8(sp)
  4011f0:	00912223          	sw	s1,4(sp)
  4011f4:	00050413          	mv	s0,a0
  4011f8:	00400593          	li	a1,4
  4011fc:	00100513          	li	a0,1
    for (unsigned i = 2; i * i <= n; i++) {
  401200:	02b46663          	bltu	s0,a1,40122c <is_prime+0x58>
  401204:	00200493          	li	s1,2
        if (n % i == 0)
  401208:	00040513          	mv	a0,s0
  40120c:	00048593          	mv	a1,s1
  401210:	00001097          	auipc	ra,0x1
  401214:	800080e7          	jalr	-2048(ra) # 401a10 <__umodsi3>
  401218:	00050863          	beqz	a0,401228 <is_prime+0x54>
    for (unsigned i = 2; i * i <= n; i++) {
  40121c:	00148493          	addi	s1,s1,1
  401220:	029485b3          	mul	a1,s1,s1
  401224:	feb472e3          	bgeu	s0,a1,401208 <is_prime+0x34>
        if (n % i == 0)
  401228:	00a03533          	snez	a0,a0
  40122c:	00c12083          	lw	ra,12(sp)
  401230:	00812403          	lw	s0,8(sp)
  401234:	00412483          	lw	s1,4(sp)
  401238:	01010113          	addi	sp,sp,16
}
  40123c:	00008067          	ret

00401240 <getchar>:
    __asm__ __volatile__ (
  401240:	00200693          	li	a3,2
  401244:	00000073          	ecall
  401248:	00050593          	mv	a1,a0
    return ch;
  40124c:	00058513          	mv	a0,a1
  401250:	00008067          	ret

00401254 <getchar_timeout>:
    __asm__ __volatile__ (
  401254:	00300693          	li	a3,3
  401258:	00000073          	ecall
  40125c:	00050593          	mv	a1,a0
    return ch;
  401260:	00058513          	mv	a0,a1
  401264:	00008067          	ret

00401268 <call_sd_read_buf_api>:
    __asm__ __volatile__(
  401268:	00800693          	li	a3,8
  40126c:	00000073          	ecall
    return (int)a0;
  401270:	00008067          	ret

00401274 <poll_switch_api>:
    __asm__ __volatile__(
  401274:	00a00693          	li	a3,10
  401278:	00000073          	ecall
    return a0;
  40127c:	00008067          	ret

00401280 <fat32_cat>:
static uint8_t fat32_buf[512];

fat32_info_t g_fat32;

int fat32_cat(const char *name)
{
  401280:	de010113          	addi	sp,sp,-544
  401284:	20112e23          	sw	ra,540(sp)
  401288:	20812c23          	sw	s0,536(sp)
  40128c:	20912a23          	sw	s1,532(sp)
  401290:	00050413          	mv	s0,a0
    uint8_t buf[512];

    uint32_t cluster;
    uint32_t size;

    if (fat32_mount())
  401294:	00000097          	auipc	ra,0x0
  401298:	0d8080e7          	jalr	216(ra) # 40136c <fat32_mount>
  40129c:	00050593          	mv	a1,a0
  4012a0:	fff00513          	li	a0,-1
  4012a4:	0a059a63          	bnez	a1,401358 <fat32_cat+0xd8>
        return -1;

    if (fat32_find(name, &cluster, &size)) {
  4012a8:	01010593          	addi	a1,sp,16
  4012ac:	00c10613          	addi	a2,sp,12
  4012b0:	00040513          	mv	a0,s0
  4012b4:	00000097          	auipc	ra,0x0
  4012b8:	1e0080e7          	jalr	480(ra) # 401494 <fat32_find>
  4012bc:	00050e63          	beqz	a0,4012d8 <fat32_cat+0x58>
        printf("file not found\n");
  4012c0:	00402537          	lui	a0,0x402
  4012c4:	d2150513          	addi	a0,a0,-735 # 401d21 <$d.1>
  4012c8:	00000097          	auipc	ra,0x0
  4012cc:	ba8080e7          	jalr	-1112(ra) # 400e70 <printf>
  4012d0:	fff00513          	li	a0,-1
  4012d4:	0840006f          	j	401358 <fat32_cat+0xd8>
        return -1;
    }

    uint32_t lba =
        cluster_to_lba(cluster);
  4012d8:	01012503          	lw	a0,16(sp)
    return -1;
}

uint32_t cluster_to_lba(uint32_t cluster)
{
    return g_fat32.data_begin +
  4012dc:	004025b7          	lui	a1,0x402
  4012e0:	f6058593          	addi	a1,a1,-160 # 401f60 <g_fat32>
           (cluster - 2) *
           g_fat32.sectors_per_cluster;
  4012e4:	0105a603          	lw	a2,16(a1)
    return g_fat32.data_begin +
  4012e8:	0085a583          	lw	a1,8(a1)
           (cluster - 2) *
  4012ec:	ffe50513          	addi	a0,a0,-2
  4012f0:	02a60533          	mul	a0,a2,a0
    return g_fat32.data_begin +
  4012f4:	00b50533          	add	a0,a0,a1
    if (call_sd_read_buf_api(lba, buf))
  4012f8:	01410593          	addi	a1,sp,20
  4012fc:	00000097          	auipc	ra,0x0
  401300:	f6c080e7          	jalr	-148(ra) # 401268 <call_sd_read_buf_api>
  401304:	00050593          	mv	a1,a0
  401308:	fff00513          	li	a0,-1
  40130c:	04059663          	bnez	a1,401358 <fat32_cat+0xd8>
  401310:	00c12503          	lw	a0,12(sp)
    for (uint32_t i = 0; i < size; i++) {
  401314:	02050a63          	beqz	a0,401348 <fat32_cat+0xc8>
  401318:	fff50513          	addi	a0,a0,-1
  40131c:	1ff00593          	li	a1,511
  401320:	00b56463          	bltu	a0,a1,401328 <fat32_cat+0xa8>
  401324:	1ff00513          	li	a0,511
  401328:	01410413          	addi	s0,sp,20
  40132c:	00850533          	add	a0,a0,s0
  401330:	00150493          	addi	s1,a0,1
        putchar(buf[i]);
  401334:	00044503          	lbu	a0,0(s0)
  401338:	00000097          	auipc	ra,0x0
  40133c:	a6c080e7          	jalr	-1428(ra) # 400da4 <putchar>
    for (uint32_t i = 0; i < size; i++) {
  401340:	00140413          	addi	s0,s0,1
  401344:	fe9418e3          	bne	s0,s1,401334 <fat32_cat+0xb4>
    putchar('\n');
  401348:	00a00513          	li	a0,10
  40134c:	00000097          	auipc	ra,0x0
  401350:	a58080e7          	jalr	-1448(ra) # 400da4 <putchar>
  401354:	00000513          	li	a0,0
  401358:	21c12083          	lw	ra,540(sp)
  40135c:	21812403          	lw	s0,536(sp)
  401360:	21412483          	lw	s1,532(sp)
}
  401364:	22010113          	addi	sp,sp,544
  401368:	00008067          	ret

0040136c <fat32_mount>:
}

int fat32_mount(void)
{
  40136c:	ff010113          	addi	sp,sp,-16
  401370:	00112623          	sw	ra,12(sp)
  401374:	00812423          	sw	s0,8(sp)
  401378:	00912223          	sw	s1,4(sp)
  40137c:	01212023          	sw	s2,0(sp)
    uint8_t *buf = fat32_buf;

    if (call_sd_read_buf_api(0, buf))
  401380:	00402537          	lui	a0,0x402
  401384:	d6050493          	addi	s1,a0,-672 # 401d60 <fat32_buf>
  401388:	00000513          	li	a0,0
  40138c:	00048593          	mv	a1,s1
  401390:	00000097          	auipc	ra,0x0
  401394:	ed8080e7          	jalr	-296(ra) # 401268 <call_sd_read_buf_api>
  401398:	fff00413          	li	s0,-1
  40139c:	0c051e63          	bnez	a0,401478 <fat32_mount+0x10c>
        return -1;

    g_fat32.part_lba =
        ((uint32_t)buf[0x1C6]) |
        ((uint32_t)buf[0x1C7] << 8) |
  4013a0:	1c74c503          	lbu	a0,455(s1)
        ((uint32_t)buf[0x1C6]) |
  4013a4:	1c64c583          	lbu	a1,454(s1)
        ((uint32_t)buf[0x1C8] << 16) |
  4013a8:	1c84c603          	lbu	a2,456(s1)
        ((uint32_t)buf[0x1C9] << 24);
  4013ac:	1c94c683          	lbu	a3,457(s1)
        ((uint32_t)buf[0x1C7] << 8) |
  4013b0:	00851513          	slli	a0,a0,0x8
        ((uint32_t)buf[0x1C6]) |
  4013b4:	00b56533          	or	a0,a0,a1
        ((uint32_t)buf[0x1C8] << 16) |
  4013b8:	01061613          	slli	a2,a2,0x10
        ((uint32_t)buf[0x1C9] << 24);
  4013bc:	01869693          	slli	a3,a3,0x18
        ((uint32_t)buf[0x1C7] << 8) |
  4013c0:	00d66633          	or	a2,a2,a3
        ((uint32_t)buf[0x1C8] << 16) |
  4013c4:	00c56533          	or	a0,a0,a2
    g_fat32.part_lba =
  4013c8:	00402937          	lui	s2,0x402
  4013cc:	f6a92023          	sw	a0,-160(s2) # 401f60 <g_fat32>

    if (call_sd_read_buf_api(g_fat32.part_lba, buf))
  4013d0:	00048593          	mv	a1,s1
  4013d4:	00000097          	auipc	ra,0x0
  4013d8:	e94080e7          	jalr	-364(ra) # 401268 <call_sd_read_buf_api>
  4013dc:	08051e63          	bnez	a0,401478 <fat32_mount+0x10c>
        return -1;

    uint32_t reserved =
        ((uint32_t)buf[14]) |
  4013e0:	00402537          	lui	a0,0x402
  4013e4:	d6050513          	addi	a0,a0,-672 # 401d60 <fat32_buf>
        ((uint32_t)buf[15] << 8);
  4013e8:	00f54583          	lbu	a1,15(a0)
        ((uint32_t)buf[14]) |
  4013ec:	00e54603          	lbu	a2,14(a0)
  4013f0:	00000413          	li	s0,0
        ((uint32_t)buf[15] << 8);
  4013f4:	00859593          	slli	a1,a1,0x8
        ((uint32_t)buf[14]) |
  4013f8:	00c5e5b3          	or	a1,a1,a2
    uint32_t fat_count =
        (uint32_t)buf[16];

    uint32_t fat_size =
        ((uint32_t)buf[36]) |
        ((uint32_t)buf[37] << 8) |
  4013fc:	02554603          	lbu	a2,37(a0)
        ((uint32_t)buf[36]) |
  401400:	02454683          	lbu	a3,36(a0)
        ((uint32_t)buf[38] << 16) |
  401404:	02654703          	lbu	a4,38(a0)
        ((uint32_t)buf[39] << 24);
  401408:	02754783          	lbu	a5,39(a0)
        ((uint32_t)buf[37] << 8) |
  40140c:	00861613          	slli	a2,a2,0x8
        ((uint32_t)buf[36]) |
  401410:	00d66633          	or	a2,a2,a3
        ((uint32_t)buf[38] << 16) |
  401414:	01071713          	slli	a4,a4,0x10
        ((uint32_t)buf[39] << 24);
  401418:	01879793          	slli	a5,a5,0x18

    g_fat32.sectors_per_cluster =
        (uint32_t)buf[13];
  40141c:	00d54683          	lbu	a3,13(a0)
        ((uint32_t)buf[37] << 8) |
  401420:	00f76733          	or	a4,a4,a5
        ((uint32_t)buf[38] << 16) |
  401424:	00e66633          	or	a2,a2,a4
    g_fat32.sectors_per_cluster =
  401428:	f6090713          	addi	a4,s2,-160
  40142c:	00d72823          	sw	a3,16(a4)

    g_fat32.root_cluster =
        ((uint32_t)buf[44]) |
        ((uint32_t)buf[45] << 8) |
  401430:	02d54683          	lbu	a3,45(a0)
        ((uint32_t)buf[44]) |
  401434:	02c54783          	lbu	a5,44(a0)
        ((uint32_t)buf[46] << 16) |
  401438:	02e54803          	lbu	a6,46(a0)
        ((uint32_t)buf[47] << 24);
  40143c:	02f54883          	lbu	a7,47(a0)
        ((uint32_t)buf[45] << 8) |
  401440:	00869693          	slli	a3,a3,0x8
        ((uint32_t)buf[44]) |
  401444:	00f6e6b3          	or	a3,a3,a5
        ((uint32_t)buf[46] << 16) |
  401448:	01081813          	slli	a6,a6,0x10
        ((uint32_t)buf[47] << 24);
  40144c:	01889893          	slli	a7,a7,0x18
        ((uint32_t)buf[45] << 8) |
  401450:	011867b3          	or	a5,a6,a7

    g_fat32.fat_begin =
        g_fat32.part_lba + reserved;
  401454:	f6092803          	lw	a6,-160(s2)
        (uint32_t)buf[16];
  401458:	01054503          	lbu	a0,16(a0)
        ((uint32_t)buf[46] << 16) |
  40145c:	00f6e6b3          	or	a3,a3,a5
    g_fat32.root_cluster =
  401460:	00d72623          	sw	a3,12(a4)
        g_fat32.part_lba + reserved;
  401464:	00b805b3          	add	a1,a6,a1
    g_fat32.fat_begin =
  401468:	00b72223          	sw	a1,4(a4)

    g_fat32.data_begin =
        g_fat32.fat_begin + fat_count * fat_size;
  40146c:	02a60533          	mul	a0,a2,a0
  401470:	00a58533          	add	a0,a1,a0
    g_fat32.data_begin =
  401474:	00a72423          	sw	a0,8(a4)

    return 0;
}
  401478:	00040513          	mv	a0,s0
  40147c:	00c12083          	lw	ra,12(sp)
  401480:	00812403          	lw	s0,8(sp)
  401484:	00412483          	lw	s1,4(sp)
  401488:	00012903          	lw	s2,0(sp)
  40148c:	01010113          	addi	sp,sp,16
  401490:	00008067          	ret

00401494 <fat32_find>:
{
  401494:	fc010113          	addi	sp,sp,-64
  401498:	02112e23          	sw	ra,60(sp)
  40149c:	02812c23          	sw	s0,56(sp)
  4014a0:	02912a23          	sw	s1,52(sp)
  4014a4:	03212823          	sw	s2,48(sp)
  4014a8:	03312623          	sw	s3,44(sp)
  4014ac:	03412423          	sw	s4,40(sp)
  4014b0:	03512223          	sw	s5,36(sp)
  4014b4:	03612023          	sw	s6,32(sp)
  4014b8:	01712e23          	sw	s7,28(sp)
  4014bc:	01812c23          	sw	s8,24(sp)
  4014c0:	01912a23          	sw	s9,20(sp)
  4014c4:	01a12823          	sw	s10,16(sp)
  4014c8:	00060413          	mv	s0,a2
  4014cc:	00058493          	mv	s1,a1
  4014d0:	00050a13          	mv	s4,a0
    if (fat32_mount())
  4014d4:	00000097          	auipc	ra,0x0
  4014d8:	e98080e7          	jalr	-360(ra) # 40136c <fat32_mount>
  4014dc:	fff00913          	li	s2,-1
  4014e0:	02051e63          	bnez	a0,40151c <fat32_find+0x88>
        cluster_to_lba(g_fat32.root_cluster);
  4014e4:	00402537          	lui	a0,0x402
  4014e8:	f6050513          	addi	a0,a0,-160 # 401f60 <g_fat32>
  4014ec:	00c52583          	lw	a1,12(a0)
           g_fat32.sectors_per_cluster;
  4014f0:	01052603          	lw	a2,16(a0)
    return g_fat32.data_begin +
  4014f4:	00852503          	lw	a0,8(a0)
           (cluster - 2) *
  4014f8:	ffe58593          	addi	a1,a1,-2
  4014fc:	02b605b3          	mul	a1,a2,a1
    return g_fat32.data_begin +
  401500:	00a58533          	add	a0,a1,a0
    if (call_sd_read_buf_api(root_lba, buf))
  401504:	004025b7          	lui	a1,0x402
  401508:	d6058993          	addi	s3,a1,-672 # 401d60 <fat32_buf>
  40150c:	00098593          	mv	a1,s3
  401510:	00000097          	auipc	ra,0x0
  401514:	d58080e7          	jalr	-680(ra) # 401268 <call_sd_read_buf_api>
  401518:	04050063          	beqz	a0,401558 <fat32_find+0xc4>
}
  40151c:	00090513          	mv	a0,s2
  401520:	03c12083          	lw	ra,60(sp)
  401524:	03812403          	lw	s0,56(sp)
  401528:	03412483          	lw	s1,52(sp)
  40152c:	03012903          	lw	s2,48(sp)
  401530:	02c12983          	lw	s3,44(sp)
  401534:	02812a03          	lw	s4,40(sp)
  401538:	02412a83          	lw	s5,36(sp)
  40153c:	02012b03          	lw	s6,32(sp)
  401540:	01c12b83          	lw	s7,28(sp)
  401544:	01812c03          	lw	s8,24(sp)
  401548:	01412c83          	lw	s9,20(sp)
  40154c:	01012d03          	lw	s10,16(sp)
  401550:	04010113          	addi	sp,sp,64
  401554:	00008067          	ret
  401558:	01000a93          	li	s5,16
  40155c:	0e500b13          	li	s6,229
  401560:	00f00b93          	li	s7,15
  401564:	02000c13          	li	s8,32
  401568:	00310c93          	addi	s9,sp,3
  40156c:	02e00d13          	li	s10,46
  401570:	0380006f          	j	4015a8 <fat32_find+0x114>
                    shortname[k++] = e[j];
  401574:	00158513          	addi	a0,a1,1
  401578:	00bc85b3          	add	a1,s9,a1
  40157c:	00c58023          	sb	a2,0(a1)
        shortname[k] = '\0';
  401580:	00ac8533          	add	a0,s9,a0
  401584:	00050023          	sb	zero,0(a0)
        if (strcmp(shortname, name) == 0) {
  401588:	00310513          	addi	a0,sp,3
  40158c:	000a0593          	mv	a1,s4
  401590:	00000097          	auipc	ra,0x0
  401594:	8a0080e7          	jalr	-1888(ra) # 400e30 <strcmp>
  401598:	14050063          	beqz	a0,4016d8 <fat32_find+0x244>
    for (int i = 0; i < 16; i++) {
  40159c:	fffa8a93          	addi	s5,s5,-1
  4015a0:	02098993          	addi	s3,s3,32
  4015a4:	f60a8ce3          	beqz	s5,40151c <fat32_find+0x88>
        if (e[0] == 0x00)
  4015a8:	0009c503          	lbu	a0,0(s3)
  4015ac:	ff6508e3          	beq	a0,s6,40159c <fat32_find+0x108>
  4015b0:	f60506e3          	beqz	a0,40151c <fat32_find+0x88>
        if (e[11] == 0x0F)
  4015b4:	00b9c583          	lbu	a1,11(s3)
  4015b8:	ff7582e3          	beq	a1,s7,40159c <fat32_find+0x108>
            if (e[j] != ' ')
  4015bc:	01851a63          	bne	a0,s8,4015d0 <fat32_find+0x13c>
  4015c0:	00000513          	li	a0,0
  4015c4:	0019c583          	lbu	a1,1(s3)
  4015c8:	01859c63          	bne	a1,s8,4015e0 <fat32_find+0x14c>
  4015cc:	0200006f          	j	4015ec <fat32_find+0x158>
                shortname[k++] = e[j];
  4015d0:	00a101a3          	sb	a0,3(sp)
  4015d4:	00100513          	li	a0,1
            if (e[j] != ' ')
  4015d8:	0019c583          	lbu	a1,1(s3)
  4015dc:	01858863          	beq	a1,s8,4015ec <fat32_find+0x158>
                shortname[k++] = e[j];
  4015e0:	00ac8633          	add	a2,s9,a0
  4015e4:	00150513          	addi	a0,a0,1
  4015e8:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  4015ec:	0029c583          	lbu	a1,2(s3)
  4015f0:	03859c63          	bne	a1,s8,401628 <fat32_find+0x194>
  4015f4:	0039c583          	lbu	a1,3(s3)
  4015f8:	05859263          	bne	a1,s8,40163c <fat32_find+0x1a8>
  4015fc:	0049c583          	lbu	a1,4(s3)
  401600:	05859863          	bne	a1,s8,401650 <fat32_find+0x1bc>
  401604:	0059c583          	lbu	a1,5(s3)
  401608:	05859e63          	bne	a1,s8,401664 <fat32_find+0x1d0>
  40160c:	0069c583          	lbu	a1,6(s3)
  401610:	07859463          	bne	a1,s8,401678 <fat32_find+0x1e4>
  401614:	0079c583          	lbu	a1,7(s3)
  401618:	07859a63          	bne	a1,s8,40168c <fat32_find+0x1f8>
        if (e[8] != ' ') {
  40161c:	0089c603          	lbu	a2,8(s3)
  401620:	f78600e3          	beq	a2,s8,401580 <fat32_find+0xec>
  401624:	07c0006f          	j	4016a0 <fat32_find+0x20c>
                shortname[k++] = e[j];
  401628:	00ac8633          	add	a2,s9,a0
  40162c:	00150513          	addi	a0,a0,1
  401630:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  401634:	0039c583          	lbu	a1,3(s3)
  401638:	fd8582e3          	beq	a1,s8,4015fc <fat32_find+0x168>
                shortname[k++] = e[j];
  40163c:	00ac8633          	add	a2,s9,a0
  401640:	00150513          	addi	a0,a0,1
  401644:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  401648:	0049c583          	lbu	a1,4(s3)
  40164c:	fb858ce3          	beq	a1,s8,401604 <fat32_find+0x170>
                shortname[k++] = e[j];
  401650:	00ac8633          	add	a2,s9,a0
  401654:	00150513          	addi	a0,a0,1
  401658:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  40165c:	0059c583          	lbu	a1,5(s3)
  401660:	fb8586e3          	beq	a1,s8,40160c <fat32_find+0x178>
                shortname[k++] = e[j];
  401664:	00ac8633          	add	a2,s9,a0
  401668:	00150513          	addi	a0,a0,1
  40166c:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  401670:	0069c583          	lbu	a1,6(s3)
  401674:	fb8580e3          	beq	a1,s8,401614 <fat32_find+0x180>
                shortname[k++] = e[j];
  401678:	00ac8633          	add	a2,s9,a0
  40167c:	00150513          	addi	a0,a0,1
  401680:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  401684:	0079c583          	lbu	a1,7(s3)
  401688:	f9858ae3          	beq	a1,s8,40161c <fat32_find+0x188>
                shortname[k++] = e[j];
  40168c:	00ac8633          	add	a2,s9,a0
  401690:	00150513          	addi	a0,a0,1
  401694:	00b60023          	sb	a1,0(a2)
        if (e[8] != ' ') {
  401698:	0089c603          	lbu	a2,8(s3)
  40169c:	ef8602e3          	beq	a2,s8,401580 <fat32_find+0xec>
                if (e[j] != ' ')
  4016a0:	0099c683          	lbu	a3,9(s3)
            shortname[k++] = '.';
  4016a4:	00ac8733          	add	a4,s9,a0
  4016a8:	01a70023          	sb	s10,0(a4)
                    shortname[k++] = e[j];
  4016ac:	00250593          	addi	a1,a0,2
  4016b0:	00c700a3          	sb	a2,1(a4)
                if (e[j] != ' ')
  4016b4:	01868a63          	beq	a3,s8,4016c8 <fat32_find+0x234>
                    shortname[k++] = e[j];
  4016b8:	00bc85b3          	add	a1,s9,a1
  4016bc:	00350513          	addi	a0,a0,3
  4016c0:	00d58023          	sb	a3,0(a1)
  4016c4:	00050593          	mv	a1,a0
                if (e[j] != ' ')
  4016c8:	00a9c603          	lbu	a2,10(s3)
  4016cc:	eb8614e3          	bne	a2,s8,401574 <fat32_find+0xe0>
  4016d0:	00058513          	mv	a0,a1
  4016d4:	eadff06f          	j	401580 <fat32_find+0xec>
  4016d8:	00000913          	li	s2,0
                ((uint32_t)e[21] << 8);
  4016dc:	0159c503          	lbu	a0,21(s3)
                ((uint32_t)e[20]) |
  4016e0:	0149c583          	lbu	a1,20(s3)
                ((uint32_t)e[26]) |
  4016e4:	01a9c603          	lbu	a2,26(s3)
                ((uint32_t)e[27] << 8);
  4016e8:	01b9c683          	lbu	a3,27(s3)
                (cl_hi << 16) | cl_lo;
  4016ec:	01851513          	slli	a0,a0,0x18
  4016f0:	01059593          	slli	a1,a1,0x10
                ((uint32_t)e[26]) |
  4016f4:	00b56533          	or	a0,a0,a1
                ((uint32_t)e[27] << 8);
  4016f8:	00869693          	slli	a3,a3,0x8
                (cl_hi << 16) | cl_lo;
  4016fc:	00d66633          	or	a2,a2,a3
  401700:	00c56533          	or	a0,a0,a2
            *cluster =
  401704:	00a4a023          	sw	a0,0(s1)
                ((uint32_t)e[29] << 8) |
  401708:	01d9c503          	lbu	a0,29(s3)
                ((uint32_t)e[28]) |
  40170c:	01c9c583          	lbu	a1,28(s3)
                ((uint32_t)e[30] << 16) |
  401710:	01e9c603          	lbu	a2,30(s3)
                ((uint32_t)e[31] << 24);
  401714:	01f9c683          	lbu	a3,31(s3)
                ((uint32_t)e[29] << 8) |
  401718:	00851513          	slli	a0,a0,0x8
                ((uint32_t)e[28]) |
  40171c:	00b56533          	or	a0,a0,a1
                ((uint32_t)e[30] << 16) |
  401720:	01061613          	slli	a2,a2,0x10
                ((uint32_t)e[31] << 24);
  401724:	01869693          	slli	a3,a3,0x18
                ((uint32_t)e[29] << 8) |
  401728:	00d66633          	or	a2,a2,a3
                ((uint32_t)e[30] << 16) |
  40172c:	00c56533          	or	a0,a0,a2
            *size =
  401730:	00a42023          	sw	a0,0(s0)
  401734:	de9ff06f          	j	40151c <fat32_find+0x88>

00401738 <cluster_to_lba>:
    return g_fat32.data_begin +
  401738:	004025b7          	lui	a1,0x402
  40173c:	f6058593          	addi	a1,a1,-160 # 401f60 <g_fat32>
           g_fat32.sectors_per_cluster;
  401740:	0105a603          	lw	a2,16(a1)
    return g_fat32.data_begin +
  401744:	0085a583          	lw	a1,8(a1)
           (cluster - 2) *
  401748:	ffe50513          	addi	a0,a0,-2
  40174c:	02a60533          	mul	a0,a2,a0
    return g_fat32.data_begin +
  401750:	00b50533          	add	a0,a0,a1
  401754:	00008067          	ret

00401758 <fat32_ls>:

void fat32_ls(void)
{
  401758:	fe010113          	addi	sp,sp,-32
  40175c:	00112e23          	sw	ra,28(sp)
  401760:	00812c23          	sw	s0,24(sp)
  401764:	00912a23          	sw	s1,20(sp)
  401768:	01212823          	sw	s2,16(sp)
  40176c:	01312623          	sw	s3,12(sp)
  401770:	01412423          	sw	s4,8(sp)
  401774:	01512223          	sw	s5,4(sp)
  401778:	01612023          	sw	s6,0(sp)
    uint8_t *buf = fat32_buf;

    if (fat32_mount())
  40177c:	00000097          	auipc	ra,0x0
  401780:	bf0080e7          	jalr	-1040(ra) # 40136c <fat32_mount>
  401784:	02051e63          	bnez	a0,4017c0 <fat32_ls+0x68>
        return;

    uint32_t root_lba =
        cluster_to_lba(g_fat32.root_cluster);
  401788:	00402537          	lui	a0,0x402
  40178c:	f6050513          	addi	a0,a0,-160 # 401f60 <g_fat32>
  401790:	00c52583          	lw	a1,12(a0)
           g_fat32.sectors_per_cluster;
  401794:	01052603          	lw	a2,16(a0)
    return g_fat32.data_begin +
  401798:	00852503          	lw	a0,8(a0)
           (cluster - 2) *
  40179c:	ffe58593          	addi	a1,a1,-2
  4017a0:	02b605b3          	mul	a1,a2,a1
    return g_fat32.data_begin +
  4017a4:	00a58533          	add	a0,a1,a0

    if (call_sd_read_buf_api(root_lba, buf))
  4017a8:	004025b7          	lui	a1,0x402
  4017ac:	d6058413          	addi	s0,a1,-672 # 401d60 <fat32_buf>
  4017b0:	00040593          	mv	a1,s0
  4017b4:	00000097          	auipc	ra,0x0
  4017b8:	ab4080e7          	jalr	-1356(ra) # 401268 <call_sd_read_buf_api>
  4017bc:	02050663          	beqz	a0,4017e8 <fat32_ls+0x90>
  4017c0:	01c12083          	lw	ra,28(sp)
  4017c4:	01812403          	lw	s0,24(sp)
  4017c8:	01412483          	lw	s1,20(sp)
  4017cc:	01012903          	lw	s2,16(sp)
  4017d0:	00c12983          	lw	s3,12(sp)
  4017d4:	00812a03          	lw	s4,8(sp)
  4017d8:	00412a83          	lw	s5,4(sp)
  4017dc:	00012b03          	lw	s6,0(sp)
            ((uint32_t)e[30] << 16) |
            ((uint32_t)e[31] << 24);

        printf(" cl=%x size=%x\n", cl, size);
    }
  4017e0:	02010113          	addi	sp,sp,32
  4017e4:	00008067          	ret
  4017e8:	01000993          	li	s3,16
  4017ec:	0e500a13          	li	s4,229
  4017f0:	00f00a93          	li	s5,15
  4017f4:	02000b13          	li	s6,32
  4017f8:	00402537          	lui	a0,0x402
  4017fc:	b8850493          	addi	s1,a0,-1144 # 401b88 <__modsi3+0xb8>
  401800:	00402537          	lui	a0,0x402
  401804:	cba50913          	addi	s2,a0,-838 # 401cba <$d.1+0x1f>
  401808:	07c0006f          	j	401884 <fat32_ls+0x12c>
        printf(" attr=%x", (uint32_t)e[11]);
  40180c:	00b44583          	lbu	a1,11(s0)
  401810:	00048513          	mv	a0,s1
  401814:	fffff097          	auipc	ra,0xfffff
  401818:	65c080e7          	jalr	1628(ra) # 400e70 <printf>
            ((uint32_t)e[27] << 8);
  40181c:	01b44503          	lbu	a0,27(s0)
            ((uint32_t)e[21] << 8);
  401820:	01544583          	lbu	a1,21(s0)
            ((uint32_t)e[20]) |
  401824:	01444603          	lbu	a2,20(s0)
            ((uint32_t)e[26]) |
  401828:	01a44683          	lbu	a3,26(s0)
            ((uint32_t)e[27] << 8);
  40182c:	00851513          	slli	a0,a0,0x8
            (cl_hi << 16) | cl_lo;
  401830:	01859593          	slli	a1,a1,0x18
  401834:	01061613          	slli	a2,a2,0x10
            ((uint32_t)e[26]) |
  401838:	00c5e5b3          	or	a1,a1,a2
            (cl_hi << 16) | cl_lo;
  40183c:	00a6e533          	or	a0,a3,a0
  401840:	00a5e5b3          	or	a1,a1,a0
            ((uint32_t)e[29] << 8) |
  401844:	01d44503          	lbu	a0,29(s0)
            ((uint32_t)e[28]) |
  401848:	01c44603          	lbu	a2,28(s0)
            ((uint32_t)e[30] << 16) |
  40184c:	01e44683          	lbu	a3,30(s0)
            ((uint32_t)e[31] << 24);
  401850:	01f44703          	lbu	a4,31(s0)
            ((uint32_t)e[29] << 8) |
  401854:	00851513          	slli	a0,a0,0x8
            ((uint32_t)e[28]) |
  401858:	00c56533          	or	a0,a0,a2
            ((uint32_t)e[30] << 16) |
  40185c:	01069693          	slli	a3,a3,0x10
            ((uint32_t)e[31] << 24);
  401860:	01871713          	slli	a4,a4,0x18
            ((uint32_t)e[29] << 8) |
  401864:	00e6e633          	or	a2,a3,a4
            ((uint32_t)e[30] << 16) |
  401868:	00c56633          	or	a2,a0,a2
        printf(" cl=%x size=%x\n", cl, size);
  40186c:	00090513          	mv	a0,s2
  401870:	fffff097          	auipc	ra,0xfffff
  401874:	600080e7          	jalr	1536(ra) # 400e70 <printf>
    for (int i = 0; i < 16; i++) {
  401878:	fff98993          	addi	s3,s3,-1
  40187c:	02040413          	addi	s0,s0,32
  401880:	f40980e3          	beqz	s3,4017c0 <fat32_ls+0x68>
        if (e[0] == 0x00)
  401884:	00044503          	lbu	a0,0(s0)
  401888:	ff4508e3          	beq	a0,s4,401878 <fat32_ls+0x120>
  40188c:	f2050ae3          	beqz	a0,4017c0 <fat32_ls+0x68>
        if (e[11] == 0x0F)
  401890:	00b44583          	lbu	a1,11(s0)
  401894:	ff5582e3          	beq	a1,s5,401878 <fat32_ls+0x120>
            if (e[j] != ' ')
  401898:	05651463          	bne	a0,s6,4018e0 <fat32_ls+0x188>
  40189c:	00144503          	lbu	a0,1(s0)
  4018a0:	05651863          	bne	a0,s6,4018f0 <fat32_ls+0x198>
  4018a4:	00244503          	lbu	a0,2(s0)
  4018a8:	05651c63          	bne	a0,s6,401900 <fat32_ls+0x1a8>
  4018ac:	00344503          	lbu	a0,3(s0)
  4018b0:	07651063          	bne	a0,s6,401910 <fat32_ls+0x1b8>
  4018b4:	00444503          	lbu	a0,4(s0)
  4018b8:	07651463          	bne	a0,s6,401920 <fat32_ls+0x1c8>
  4018bc:	00544503          	lbu	a0,5(s0)
  4018c0:	07651863          	bne	a0,s6,401930 <fat32_ls+0x1d8>
  4018c4:	00644503          	lbu	a0,6(s0)
  4018c8:	07651c63          	bne	a0,s6,401940 <fat32_ls+0x1e8>
  4018cc:	00744503          	lbu	a0,7(s0)
  4018d0:	09651063          	bne	a0,s6,401950 <fat32_ls+0x1f8>
        if (e[8] != ' ') {
  4018d4:	00844503          	lbu	a0,8(s0)
  4018d8:	f3650ae3          	beq	a0,s6,40180c <fat32_ls+0xb4>
  4018dc:	0840006f          	j	401960 <fat32_ls+0x208>
                putchar(e[j]);
  4018e0:	fffff097          	auipc	ra,0xfffff
  4018e4:	4c4080e7          	jalr	1220(ra) # 400da4 <putchar>
            if (e[j] != ' ')
  4018e8:	00144503          	lbu	a0,1(s0)
  4018ec:	fb650ce3          	beq	a0,s6,4018a4 <fat32_ls+0x14c>
                putchar(e[j]);
  4018f0:	fffff097          	auipc	ra,0xfffff
  4018f4:	4b4080e7          	jalr	1204(ra) # 400da4 <putchar>
            if (e[j] != ' ')
  4018f8:	00244503          	lbu	a0,2(s0)
  4018fc:	fb6508e3          	beq	a0,s6,4018ac <fat32_ls+0x154>
                putchar(e[j]);
  401900:	fffff097          	auipc	ra,0xfffff
  401904:	4a4080e7          	jalr	1188(ra) # 400da4 <putchar>
            if (e[j] != ' ')
  401908:	00344503          	lbu	a0,3(s0)
  40190c:	fb6504e3          	beq	a0,s6,4018b4 <fat32_ls+0x15c>
                putchar(e[j]);
  401910:	fffff097          	auipc	ra,0xfffff
  401914:	494080e7          	jalr	1172(ra) # 400da4 <putchar>
            if (e[j] != ' ')
  401918:	00444503          	lbu	a0,4(s0)
  40191c:	fb6500e3          	beq	a0,s6,4018bc <fat32_ls+0x164>
                putchar(e[j]);
  401920:	fffff097          	auipc	ra,0xfffff
  401924:	484080e7          	jalr	1156(ra) # 400da4 <putchar>
            if (e[j] != ' ')
  401928:	00544503          	lbu	a0,5(s0)
  40192c:	f9650ce3          	beq	a0,s6,4018c4 <fat32_ls+0x16c>
                putchar(e[j]);
  401930:	fffff097          	auipc	ra,0xfffff
  401934:	474080e7          	jalr	1140(ra) # 400da4 <putchar>
            if (e[j] != ' ')
  401938:	00644503          	lbu	a0,6(s0)
  40193c:	f96508e3          	beq	a0,s6,4018cc <fat32_ls+0x174>
                putchar(e[j]);
  401940:	fffff097          	auipc	ra,0xfffff
  401944:	464080e7          	jalr	1124(ra) # 400da4 <putchar>
            if (e[j] != ' ')
  401948:	00744503          	lbu	a0,7(s0)
  40194c:	f96504e3          	beq	a0,s6,4018d4 <fat32_ls+0x17c>
                putchar(e[j]);
  401950:	fffff097          	auipc	ra,0xfffff
  401954:	454080e7          	jalr	1108(ra) # 400da4 <putchar>
        if (e[8] != ' ') {
  401958:	00844503          	lbu	a0,8(s0)
  40195c:	eb6508e3          	beq	a0,s6,40180c <fat32_ls+0xb4>
            putchar('.');
  401960:	02e00513          	li	a0,46
  401964:	fffff097          	auipc	ra,0xfffff
  401968:	440080e7          	jalr	1088(ra) # 400da4 <putchar>
                if (e[j] != ' ')
  40196c:	00844503          	lbu	a0,8(s0)
  401970:	01651c63          	bne	a0,s6,401988 <fat32_ls+0x230>
  401974:	00944503          	lbu	a0,9(s0)
  401978:	03651063          	bne	a0,s6,401998 <fat32_ls+0x240>
  40197c:	00a44503          	lbu	a0,10(s0)
  401980:	e96506e3          	beq	a0,s6,40180c <fat32_ls+0xb4>
  401984:	0240006f          	j	4019a8 <fat32_ls+0x250>
                    putchar(e[j]);
  401988:	fffff097          	auipc	ra,0xfffff
  40198c:	41c080e7          	jalr	1052(ra) # 400da4 <putchar>
                if (e[j] != ' ')
  401990:	00944503          	lbu	a0,9(s0)
  401994:	ff6504e3          	beq	a0,s6,40197c <fat32_ls+0x224>
                    putchar(e[j]);
  401998:	fffff097          	auipc	ra,0xfffff
  40199c:	40c080e7          	jalr	1036(ra) # 400da4 <putchar>
                if (e[j] != ' ')
  4019a0:	00a44503          	lbu	a0,10(s0)
  4019a4:	e76504e3          	beq	a0,s6,40180c <fat32_ls+0xb4>
                    putchar(e[j]);
  4019a8:	fffff097          	auipc	ra,0xfffff
  4019ac:	3fc080e7          	jalr	1020(ra) # 400da4 <putchar>
  4019b0:	e5dff06f          	j	40180c <fat32_ls+0xb4>

004019b4 <__udivsi3>:
  4019b4:	04058a63          	beqz	a1,401a08 <__udivsi3+0x54>
  4019b8:	00000813          	li	a6,0
  4019bc:	00000613          	li	a2,0
  4019c0:	01f00693          	li	a3,31
  4019c4:	00100713          	li	a4,1
  4019c8:	fff00793          	li	a5,-1
  4019cc:	00181813          	slli	a6,a6,0x1
  4019d0:	00d558b3          	srl	a7,a0,a3
  4019d4:	0018f893          	andi	a7,a7,1
  4019d8:	0108e833          	or	a6,a7,a6
  4019dc:	00b838b3          	sltu	a7,a6,a1
  4019e0:	00d712b3          	sll	t0,a4,a3
  4019e4:	fff88893          	addi	a7,a7,-1
  4019e8:	0058f2b3          	and	t0,a7,t0
  4019ec:	00c2e633          	or	a2,t0,a2
  4019f0:	00b8f8b3          	and	a7,a7,a1
  4019f4:	fff68693          	addi	a3,a3,-1
  4019f8:	41180833          	sub	a6,a6,a7
  4019fc:	fcf698e3          	bne	a3,a5,4019cc <__udivsi3+0x18>
  401a00:	00060513          	mv	a0,a2
  401a04:	00008067          	ret
  401a08:	00000513          	li	a0,0
  401a0c:	00008067          	ret

00401a10 <__umodsi3>:
  401a10:	00000613          	li	a2,0
  401a14:	02058a63          	beqz	a1,401a48 <__umodsi3+0x38>
  401a18:	01f00693          	li	a3,31
  401a1c:	fff00713          	li	a4,-1
  401a20:	00161613          	slli	a2,a2,0x1
  401a24:	00d557b3          	srl	a5,a0,a3
  401a28:	0017f793          	andi	a5,a5,1
  401a2c:	00c7e633          	or	a2,a5,a2
  401a30:	00b637b3          	sltu	a5,a2,a1
  401a34:	fff78793          	addi	a5,a5,-1
  401a38:	00b7f7b3          	and	a5,a5,a1
  401a3c:	fff68693          	addi	a3,a3,-1
  401a40:	40f60633          	sub	a2,a2,a5
  401a44:	fce69ee3          	bne	a3,a4,401a20 <__umodsi3+0x10>
  401a48:	00060513          	mv	a0,a2
  401a4c:	00008067          	ret

00401a50 <__divsi3>:
  401a50:	06058c63          	beqz	a1,401ac8 <__divsi3+0x78>
  401a54:	00000293          	li	t0,0
  401a58:	00000613          	li	a2,0
  401a5c:	41f55693          	srai	a3,a0,0x1f
  401a60:	00d54733          	xor	a4,a0,a3
  401a64:	40d706b3          	sub	a3,a4,a3
  401a68:	41f5d713          	srai	a4,a1,0x1f
  401a6c:	00e5c7b3          	xor	a5,a1,a4
  401a70:	40e78733          	sub	a4,a5,a4
  401a74:	01f00793          	li	a5,31
  401a78:	00100813          	li	a6,1
  401a7c:	fff00893          	li	a7,-1
  401a80:	00129293          	slli	t0,t0,0x1
  401a84:	00f6d333          	srl	t1,a3,a5
  401a88:	00137313          	andi	t1,t1,1
  401a8c:	005362b3          	or	t0,t1,t0
  401a90:	00e2b333          	sltu	t1,t0,a4
  401a94:	00f813b3          	sll	t2,a6,a5
  401a98:	fff30313          	addi	t1,t1,-1
  401a9c:	007373b3          	and	t2,t1,t2
  401aa0:	00c3e633          	or	a2,t2,a2
  401aa4:	00e37333          	and	t1,t1,a4
  401aa8:	fff78793          	addi	a5,a5,-1
  401aac:	406282b3          	sub	t0,t0,t1
  401ab0:	fd1798e3          	bne	a5,a7,401a80 <__divsi3+0x30>
  401ab4:	00a5c533          	xor	a0,a1,a0
  401ab8:	00055463          	bgez	a0,401ac0 <__divsi3+0x70>
  401abc:	40c00633          	neg	a2,a2
  401ac0:	00060513          	mv	a0,a2
  401ac4:	00008067          	ret
  401ac8:	00000513          	li	a0,0
  401acc:	00008067          	ret

00401ad0 <__modsi3>:
  401ad0:	00000613          	li	a2,0
  401ad4:	04058a63          	beqz	a1,401b28 <__modsi3+0x58>
  401ad8:	41f55693          	srai	a3,a0,0x1f
  401adc:	00d54733          	xor	a4,a0,a3
  401ae0:	40d706b3          	sub	a3,a4,a3
  401ae4:	41f5d713          	srai	a4,a1,0x1f
  401ae8:	00e5c5b3          	xor	a1,a1,a4
  401aec:	40e585b3          	sub	a1,a1,a4
  401af0:	01f00713          	li	a4,31
  401af4:	fff00793          	li	a5,-1
  401af8:	00161613          	slli	a2,a2,0x1
  401afc:	00e6d833          	srl	a6,a3,a4
  401b00:	00187813          	andi	a6,a6,1
  401b04:	00c86633          	or	a2,a6,a2
  401b08:	00b63833          	sltu	a6,a2,a1
  401b0c:	fff80813          	addi	a6,a6,-1
  401b10:	00b87833          	and	a6,a6,a1
  401b14:	fff70713          	addi	a4,a4,-1
  401b18:	41060633          	sub	a2,a2,a6
  401b1c:	fcf71ee3          	bne	a4,a5,401af8 <__modsi3+0x28>
  401b20:	00055463          	bgez	a0,401b28 <__modsi3+0x58>
  401b24:	40c00633          	neg	a2,a2
  401b28:	00060513          	mv	a0,a2
  401b2c:	00008067          	ret

セクション .rodata の逆アセンブル:

00401b30 <$d.1-0x16b>:
  401b30:	7375                	.insn	2, 0x7375
  401b32:	6761                	.insn	2, 0x6761
  401b34:	3a65                	.insn	2, 0x3a65
  401b36:	6620                	.insn	2, 0x6620
  401b38:	7461                	.insn	2, 0x7461
  401b3a:	635f3233          	.insn	4, 0x635f3233
  401b3e:	7461                	.insn	2, 0x7461
  401b40:	3c20                	.insn	2, 0x3c20
  401b42:	6966                	.insn	2, 0x6966
  401b44:	656c                	.insn	2, 0x656c
  401b46:	0a3e                	.insn	2, 0x0a3e
  401b48:	5300                	.insn	2, 0x5300
  401b4a:	70203257          	.insn	4, 0x70203257
  401b4e:	6572                	.insn	2, 0x6572
  401b50:	64657373          	csrrci	t1,hviprio1,10
  401b54:	000a                	.insn	2, 0x000a
  401b56:	6166                	.insn	2, 0x6166
  401b58:	3374                	.insn	2, 0x3374
  401b5a:	5f32                	.insn	2, 0x5f32
  401b5c:	736c                	.insn	2, 0x736c
  401b5e:	6600                	.insn	2, 0x6600
  401b60:	7461                	.insn	2, 0x7461
  401b62:	635f3233          	.insn	4, 0x635f3233
  401b66:	7461                	.insn	2, 0x7461
  401b68:	7300                	.insn	2, 0x7300
  401b6a:	5f64                	.insn	2, 0x5f64
  401b6c:	74636573          	csrrsi	a0,0x746,6
  401b70:	7720726f          	jal	tp,4092e2 <__user_stack_start+0x6362>
  401b74:	6972                	.insn	2, 0x6972
  401b76:	6574                	.insn	2, 0x6574
  401b78:	7320                	.insn	2, 0x7320
  401b7a:	6365                	.insn	2, 0x6365
  401b7c:	6f74                	.insn	2, 0x6f74
  401b7e:	2072                	.insn	2, 0x2072
  401b80:	203c                	.insn	2, 0x203c
  401b82:	3035                	.insn	2, 0x3035
  401b84:	3030                	.insn	2, 0x3030
  401b86:	000a                	.insn	2, 0x000a
  401b88:	6120                	.insn	2, 0x6120
  401b8a:	7474                	.insn	2, 0x7474
  401b8c:	3d72                	.insn	2, 0x3d72
  401b8e:	7825                	.insn	2, 0x7825
  401b90:	7300                	.insn	2, 0x7300
  401b92:	5f64                	.insn	2, 0x5f64
  401b94:	6572                	.insn	2, 0x6572
  401b96:	6461                	.insn	2, 0x6461
  401b98:	7300                	.insn	2, 0x7300
  401b9a:	5f64                	.insn	2, 0x5f64
  401b9c:	74697277          	.insn	4, 0x74697277
  401ba0:	0065                	.insn	2, 0x0065
  401ba2:	666c6573          	csrrsi	a0,0x666,24
  401ba6:	745f 7365 0074      	.insn	6, 0x00747365745f
  401bac:	6548                	.insn	2, 0x6548
  401bae:	6c6c                	.insn	2, 0x6c6c
  401bb0:	6f77206f          	j	474aa6 <__user_stack_top+0x51b26>
  401bb4:	6c72                	.insn	2, 0x6c72
  401bb6:	2064                	.insn	2, 0x2064
  401bb8:	7266                	.insn	2, 0x7266
  401bba:	73206d6f          	jal	s10,4082ec <__user_stack_start+0x536c>
  401bbe:	6568                	.insn	2, 0x6568
  401bc0:	6c6c                	.insn	2, 0x6c6c
  401bc2:	0a21                	.insn	2, 0x0a21
  401bc4:	7000                	.insn	2, 0x7000
  401bc6:	6972                	.insn	2, 0x6972
  401bc8:	656d                	.insn	2, 0x656d
  401bca:	6e750073          	.insn	4, 0x6e750073
  401bce:	776f6e6b          	.insn	4, 0x776f6e6b
  401bd2:	206e                	.insn	2, 0x206e
  401bd4:	6d6d6f63          	bltu	s10,s6,4022b2 <__user_stack_bottom+0x332>
  401bd8:	6e61                	.insn	2, 0x6e61
  401bda:	3a64                	.insn	2, 0x3a64
  401bdc:	2520                	.insn	2, 0x2520
  401bde:	74000a73          	.insn	4, 0x74000a73
  401be2:	6c61746f          	jal	s0,4192a8 <__user_stack_start+0x16328>
  401be6:	7020                	.insn	2, 0x7020
  401be8:	6972                	.insn	2, 0x6972
  401bea:	656d                	.insn	2, 0x656d
  401bec:	25203a73          	csrrc	s4,vsireg2,zero
  401bf0:	2064                	.insn	2, 0x2064
  401bf2:	3028                	.insn	2, 0x3028
  401bf4:	2e2e                	.insn	2, 0x2e2e
  401bf6:	6425                	.insn	2, 0x6425
  401bf8:	0a29                	.insn	2, 0x0a29
  401bfa:	7300                	.insn	2, 0x7300
  401bfc:	5f61                	.insn	2, 0x5f61
  401bfe:	72617473          	csrrci	s0,mhpmevent6h,2
  401c02:	0074                	.insn	2, 0x0074
  401c04:	6166                	.insn	2, 0x6166
  401c06:	3374                	.insn	2, 0x3374
  401c08:	5f32                	.insn	2, 0x5f32
  401c0a:	6e69                	.insn	2, 0x6e69
  401c0c:	6f66                	.insn	2, 0x6f66
  401c0e:	6800                	.insn	2, 0x6800
  401c10:	6c65                	.insn	2, 0x6c65
  401c12:	6f6c                	.insn	2, 0x6f6c
  401c14:	5300                	.insn	2, 0x5300
  401c16:	70203157          	.insn	4, 0x70203157
  401c1a:	6572                	.insn	2, 0x6572
  401c1c:	64657373          	csrrci	t1,hviprio1,10
  401c20:	000a                	.insn	2, 0x000a
  401c22:	616d                	.insn	2, 0x616d
  401c24:	7274                	.insn	2, 0x7274
  401c26:	7869                	.insn	2, 0x7869
  401c28:	7320                	.insn	2, 0x7320
  401c2a:	7a69                	.insn	2, 0x7a69
  401c2c:	2065                	.insn	2, 0x2065
  401c2e:	203e                	.insn	2, 0x203e
  401c30:	0a34                	.insn	2, 0x0a34
  401c32:	6300                	.insn	2, 0x6300
  401c34:	616d6d6f          	jal	s10,4d824a <__user_stack_top+0xb52ca>
  401c38:	646e                	.insn	2, 0x646e
  401c3a:	000a3a73          	csrrc	s4,0x0,s4
  401c3e:	4146                	.insn	2, 0x4146
  401c40:	3354                	.insn	2, 0x3354
  401c42:	2032                	.insn	2, 0x2032
  401c44:	6f6d                	.insn	2, 0x6f6d
  401c46:	6e75                	.insn	2, 0x6e75
  401c48:	2074                	.insn	2, 0x2074
  401c4a:	6166                	.insn	2, 0x6166
  401c4c:	6c69                	.insn	2, 0x6c69
  401c4e:	6465                	.insn	2, 0x6465
  401c50:	000a                	.insn	2, 0x000a
  401c52:	6164                	.insn	2, 0x6164
  401c54:	6174                	.insn	2, 0x6174
  401c56:	625f 6765 6e69      	.insn	6, 0x6e696765625f
  401c5c:	253d                	.insn	2, 0x253d
  401c5e:	0a78                	.insn	2, 0x0a78
  401c60:	7500                	.insn	2, 0x7500
  401c62:	65676173          	csrrsi	sp,hviprio1h,14
  401c66:	203a                	.insn	2, 0x203a
  401c68:	696d                	.insn	2, 0x696d
  401c6a:	65725f63          	bge	tp,s7,4022c8 <__user_stack_bottom+0x348>
  401c6e:	6461                	.insn	2, 0x6461
  401c70:	3c20                	.insn	2, 0x3c20
  401c72:	6e756f63          	bltu	a0,t2,402370 <__user_stack_bottom+0x3f0>
  401c76:	3e74                	.insn	2, 0x3e74
  401c78:	000a                	.insn	2, 0x000a
  401c7a:	6568                	.insn	2, 0x6568
  401c7c:	706c                	.insn	2, 0x706c
  401c7e:	6d00                	.insn	2, 0x6d00
  401c80:	6369                	.insn	2, 0x6369
  401c82:	725f 6165 0064      	.insn	6, 0x00646165725f
  401c88:	6f72                	.insn	2, 0x6f72
  401c8a:	635f746f          	jal	s0,4f9abe <__user_stack_top+0xd6b3e>
  401c8e:	756c                	.insn	2, 0x756c
  401c90:	72657473          	csrrci	s0,mhpmevent6h,10
  401c94:	253d                	.insn	2, 0x253d
  401c96:	0a78                	.insn	2, 0x0a78
  401c98:	7100                	.insn	2, 0x7100
	...

00401c9b <$d.1>:
  401c9b:	6c656873          	csrrsi	a6,0x6c6,10
  401c9f:	206c                	.insn	2, 0x206c
  401ca1:	72617473          	csrrci	s0,mhpmevent6h,2
  401ca5:	2e74                	.insn	2, 0x2e74
  401ca7:	000a                	.insn	2, 0x000a
  401ca9:	7564                	.insn	2, 0x7564
  401cab:	706d                	.insn	2, 0x706d
  401cad:	7300                	.insn	2, 0x7300
  401caf:	6370                	.insn	2, 0x6370
  401cb1:	253d                	.insn	2, 0x253d
  401cb3:	0a78                	.insn	2, 0x0a78
  401cb5:	2500                	.insn	2, 0x2500
  401cb7:	2064                	.insn	2, 0x2064
  401cb9:	2000                	.insn	2, 0x2000
  401cbb:	253d6c63          	bltu	s10,s3,401f13 <fat32_buf+0x1b3>
  401cbf:	2078                	.insn	2, 0x2078
  401cc1:	657a6973          	csrrsi	s2,hviprio2h,20
  401cc5:	253d                	.insn	2, 0x253d
  401cc7:	0a78                	.insn	2, 0x0a78
  401cc9:	6600                	.insn	2, 0x6600
  401ccb:	7461                	.insn	2, 0x7461
  401ccd:	625f 6765 6e69      	.insn	6, 0x6e696765625f
  401cd3:	253d                	.insn	2, 0x253d
  401cd5:	0a78                	.insn	2, 0x0a78
	...

00401cd8 <$d.2>:
  401cd8:	3130                	.insn	2, 0x3130
  401cda:	3332                	.insn	2, 0x3332
  401cdc:	3534                	.insn	2, 0x3534
  401cde:	3736                	.insn	2, 0x3736
  401ce0:	3938                	.insn	2, 0x3938
  401ce2:	6261                	.insn	2, 0x6261
  401ce4:	66656463          	bltu	a0,t1,40234c <__user_stack_bottom+0x3cc>
  401ce8:	7500                	.insn	2, 0x7500
  401cea:	65676173          	csrrsi	sp,hviprio1h,14
  401cee:	203a                	.insn	2, 0x203a
  401cf0:	725f6473          	csrrsi	s0,mhpmevent5h,30
  401cf4:	6165                	.insn	2, 0x6165
  401cf6:	2064                	.insn	2, 0x2064
  401cf8:	733c                	.insn	2, 0x733c
  401cfa:	6365                	.insn	2, 0x6365
  401cfc:	6f74                	.insn	2, 0x6f74
  401cfe:	3e72                	.insn	2, 0x3e72
  401d00:	000a                	.insn	2, 0x000a
  401d02:	616d                	.insn	2, 0x616d
  401d04:	2078                	.insn	2, 0x2078
  401d06:	6f74                	.insn	2, 0x6f74
  401d08:	616c206f          	j	4c431e <__user_stack_top+0xa139e>
  401d0c:	6772                	.insn	2, 0x6772
  401d0e:	2065                	.insn	2, 0x2065
  401d10:	3c28                	.insn	2, 0x3c28
  401d12:	313d                	.insn	2, 0x313d
  401d14:	3030                	.insn	2, 0x3030
  401d16:	3030                	.insn	2, 0x3030
  401d18:	2930                	.insn	2, 0x2930
  401d1a:	000a                	.insn	2, 0x000a
  401d1c:	7571                	.insn	2, 0x7571
  401d1e:	7469                	.insn	2, 0x7469
	...

00401d21 <$d.1>:
  401d21:	6966                	.insn	2, 0x6966
  401d23:	656c                	.insn	2, 0x656c
  401d25:	6e20                	.insn	2, 0x6e20
  401d27:	6620746f          	jal	s0,409389 <__user_stack_start+0x6409>
  401d2b:	646e756f          	jal	a0,4e9371 <__user_stack_top+0xc63f1>
  401d2f:	000a                	.insn	2, 0x000a
  401d31:	7375                	.insn	2, 0x7375
  401d33:	6761                	.insn	2, 0x6761
  401d35:	3a65                	.insn	2, 0x3a65
  401d37:	7320                	.insn	2, 0x7320
  401d39:	5f64                	.insn	2, 0x5f64
  401d3b:	74697277          	.insn	4, 0x74697277
  401d3f:	2065                	.insn	2, 0x2065
  401d41:	733c                	.insn	2, 0x733c
  401d43:	6365                	.insn	2, 0x6365
  401d45:	6f74                	.insn	2, 0x6f74
  401d47:	3e72                	.insn	2, 0x3e72
  401d49:	000a                	.insn	2, 0x000a
  401d4b:	6170                	.insn	2, 0x6170
  401d4d:	7472                	.insn	2, 0x7472
  401d4f:	6c5f 6162 253d      	.insn	6, 0x253d61626c5f
  401d55:	0a78                	.insn	2, 0x0a78
  401d57:	6500                	.insn	2, 0x6500
  401d59:	6978                	.insn	2, 0x6978
  401d5b:	0074                	.insn	2, 0x0074

セクション .debug_loc の逆アセンブル:

00000000 <$d.2>:
       0:	0048                	.insn	2, 0x0048
       2:	0000                	.insn	2, 0x0000
       4:	01fc                	.insn	2, 0x01fc
       6:	0000                	.insn	2, 0x0000
       8:	0002                	.insn	2, 0x0002
       a:	9f30                	.insn	2, 0x9f30
       c:	01fc                	.insn	2, 0x01fc
       e:	0000                	.insn	2, 0x0000
      10:	08e4                	.insn	2, 0x08e4
      12:	0000                	.insn	2, 0x0000
      14:	0001                	.insn	2, 0x0001
      16:	006a                	.insn	2, 0x006a
      18:	0000                	.insn	2, 0x0000
      1a:	0000                	.insn	2, 0x0000
      1c:	0000                	.insn	2, 0x0000
      1e:	fc00                	.insn	2, 0xfc00
      20:	0001                	.insn	2, 0x0001
      22:	0c00                	.insn	2, 0x0c00
      24:	0002                	.insn	2, 0x0002
      26:	0100                	.insn	2, 0x0100
      28:	6400                	.insn	2, 0x6400
      2a:	03f8                	.insn	2, 0x03f8
      2c:	0000                	.insn	2, 0x0000
      2e:	03fc                	.insn	2, 0x03fc
      30:	0000                	.insn	2, 0x0000
      32:	0001                	.insn	2, 0x0001
      34:	0003fc63          	bgeu	t2,zero,4c <$d.2+0x4c>
      38:	9000                	.insn	2, 0x9000
      3a:	0004                	.insn	2, 0x0004
      3c:	0100                	.insn	2, 0x0100
      3e:	6400                	.insn	2, 0x6400
      40:	0598                	.insn	2, 0x0598
      42:	0000                	.insn	2, 0x0000
      44:	05e8                	.insn	2, 0x05e8
      46:	0000                	.insn	2, 0x0000
      48:	0001                	.insn	2, 0x0001
      4a:	0c64                	.insn	2, 0x0c64
      4c:	0006                	.insn	2, 0x0006
      4e:	1400                	.insn	2, 0x1400
      50:	0006                	.insn	2, 0x0006
      52:	0100                	.insn	2, 0x0100
      54:	6400                	.insn	2, 0x6400
      56:	0620                	.insn	2, 0x0620
      58:	0000                	.insn	2, 0x0000
      5a:	0630                	.insn	2, 0x0630
      5c:	0000                	.insn	2, 0x0000
      5e:	0001                	.insn	2, 0x0001
      60:	8864                	.insn	2, 0x8864
      62:	0006                	.insn	2, 0x0006
      64:	f400                	.insn	2, 0xf400
      66:	0006                	.insn	2, 0x0006
      68:	0100                	.insn	2, 0x0100
      6a:	6400                	.insn	2, 0x6400
      6c:	0700                	.insn	2, 0x0700
      6e:	0000                	.insn	2, 0x0000
      70:	0734                	.insn	2, 0x0734
      72:	0000                	.insn	2, 0x0000
      74:	0001                	.insn	2, 0x0001
      76:	4464                	.insn	2, 0x4464
      78:	4c000007          	.insn	4, 0x4c000007
      7c:	01000007          	.insn	4, 0x01000007
      80:	6400                	.insn	2, 0x6400
	...
      8a:	02d0                	.insn	2, 0x02d0
      8c:	0000                	.insn	2, 0x0000
      8e:	02d4                	.insn	2, 0x02d4
      90:	0000                	.insn	2, 0x0000
      92:	00110003          	lb	zero,1(sp)
      96:	e49f 0002 f000      	.insn	6, 0xf0000002e49f
      9c:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
      a0:	6300                	.insn	2, 0x6300
	...
      aa:	02e4                	.insn	2, 0x02e4
      ac:	0000                	.insn	2, 0x0000
      ae:	02ec                	.insn	2, 0x02ec
      b0:	0000                	.insn	2, 0x0000
      b2:	0001                	.insn	2, 0x0001
      b4:	405a                	.insn	2, 0x405a
      b6:	90000003          	lb	zero,-1792(zero) # fffff900 <USER_MAX+0xffaff900>
      ba:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
      be:	5a00                	.insn	2, 0x5a00
      c0:	03ac                	.insn	2, 0x03ac
      c2:	0000                	.insn	2, 0x0000
      c4:	03b0                	.insn	2, 0x03b0
      c6:	0000                	.insn	2, 0x0000
      c8:	0001                	.insn	2, 0x0001
      ca:	005a                	.insn	2, 0x005a
      cc:	0000                	.insn	2, 0x0000
      ce:	0000                	.insn	2, 0x0000
      d0:	0000                	.insn	2, 0x0000
      d2:	e400                	.insn	2, 0xe400
      d4:	0002                	.insn	2, 0x0002
      d6:	ec00                	.insn	2, 0xec00
      d8:	0002                	.insn	2, 0x0002
      da:	0100                	.insn	2, 0x0100
      dc:	6a00                	.insn	2, 0x6a00
      de:	0338                	.insn	2, 0x0338
      e0:	0000                	.insn	2, 0x0000
      e2:	03c8                	.insn	2, 0x03c8
      e4:	0000                	.insn	2, 0x0000
      e6:	0001                	.insn	2, 0x0001
      e8:	006a                	.insn	2, 0x006a
      ea:	0000                	.insn	2, 0x0000
      ec:	0000                	.insn	2, 0x0000
      ee:	0000                	.insn	2, 0x0000
      f0:	2400                	.insn	2, 0x2400
      f2:	2c000003          	lb	zero,704(zero) # 2c0 <$d.6+0x38>
      f6:	06000003          	lb	zero,96(zero) # 60 <$d.2+0x60>
      fa:	7a00                	.insn	2, 0x7a00
      fc:	1000                	.insn	2, 0x1000
      fe:	1a01                	.insn	2, 0x1a01
     100:	009f 0000 0000      	.insn	6, 0x009f
     106:	0000                	.insn	2, 0x0000
     108:	d000                	.insn	2, 0xd000
     10a:	f0000003          	lb	zero,-256(zero) # ffffff00 <USER_MAX+0xffafff00>
     10e:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     112:	5a00                	.insn	2, 0x5a00
     114:	03f8                	.insn	2, 0x03f8
     116:	0000                	.insn	2, 0x0000
     118:	0430                	.insn	2, 0x0430
     11a:	0000                	.insn	2, 0x0000
     11c:	0001                	.insn	2, 0x0001
     11e:	0004305b          	.insn	4, 0x0004305b
     122:	3800                	.insn	2, 0x3800
     124:	0004                	.insn	2, 0x0004
     126:	0300                	.insn	2, 0x0300
     128:	7b00                	.insn	2, 0x7b00
     12a:	9f01                	.insn	2, 0x9f01
	...
     134:	0598                	.insn	2, 0x0598
     136:	0000                	.insn	2, 0x0000
     138:	05e8                	.insn	2, 0x05e8
     13a:	0000                	.insn	2, 0x0000
     13c:	0006                	.insn	2, 0x0006
     13e:	8010                	.insn	2, 0x8010
     140:	8080                	.insn	2, 0x8080
     142:	9f01                	.insn	2, 0x9f01
     144:	060c                	.insn	2, 0x060c
     146:	0000                	.insn	2, 0x0000
     148:	0628                	.insn	2, 0x0628
     14a:	0000                	.insn	2, 0x0000
     14c:	0006                	.insn	2, 0x0006
     14e:	8010                	.insn	2, 0x8010
     150:	8080                	.insn	2, 0x8080
     152:	9f01                	.insn	2, 0x9f01
     154:	0690                	.insn	2, 0x0690
     156:	0000                	.insn	2, 0x0000
     158:	06e8                	.insn	2, 0x06e8
     15a:	0000                	.insn	2, 0x0000
     15c:	0006                	.insn	2, 0x0006
     15e:	8010                	.insn	2, 0x8010
     160:	8080                	.insn	2, 0x8080
     162:	9f01                	.insn	2, 0x9f01
     164:	06e8                	.insn	2, 0x06e8
     166:	0000                	.insn	2, 0x0000
     168:	06fc                	.insn	2, 0x06fc
     16a:	0000                	.insn	2, 0x0000
     16c:	0001                	.insn	2, 0x0001
     16e:	005a                	.insn	2, 0x005a
     170:	54000007          	.insn	4, 0x54000007
     174:	01000007          	.insn	4, 0x01000007
     178:	5a00                	.insn	2, 0x5a00
     17a:	07c8                	.insn	2, 0x07c8
     17c:	0000                	.insn	2, 0x0000
     17e:	0828                	.insn	2, 0x0828
     180:	0000                	.insn	2, 0x0000
     182:	0001                	.insn	2, 0x0001
     184:	005a                	.insn	2, 0x005a
     186:	0000                	.insn	2, 0x0000
     188:	0000                	.insn	2, 0x0000
     18a:	0000                	.insn	2, 0x0000
     18c:	9800                	.insn	2, 0x9800
     18e:	0005                	.insn	2, 0x0005
     190:	e800                	.insn	2, 0xe800
     192:	0005                	.insn	2, 0x0005
     194:	0400                	.insn	2, 0x0400
     196:	1000                	.insn	2, 0x1000
     198:	0280                	.insn	2, 0x0280
     19a:	149f 0006 1c00      	.insn	6, 0x1c000006149f
     1a0:	0006                	.insn	2, 0x0006
     1a2:	0100                	.insn	2, 0x0100
     1a4:	5b00                	.insn	2, 0x5b00
     1a6:	0620                	.insn	2, 0x0620
     1a8:	0000                	.insn	2, 0x0000
     1aa:	0628                	.insn	2, 0x0628
     1ac:	0000                	.insn	2, 0x0000
     1ae:	0004                	.insn	2, 0x0004
     1b0:	8010                	.insn	2, 0x8010
     1b2:	9f02                	.insn	2, 0x9f02
     1b4:	0690                	.insn	2, 0x0690
     1b6:	0000                	.insn	2, 0x0000
     1b8:	06f4                	.insn	2, 0x06f4
     1ba:	0000                	.insn	2, 0x0000
     1bc:	0004                	.insn	2, 0x0004
     1be:	8010                	.insn	2, 0x8010
     1c0:	9f02                	.insn	2, 0x9f02
     1c2:	06f4                	.insn	2, 0x06f4
     1c4:	0000                	.insn	2, 0x0000
     1c6:	06fc                	.insn	2, 0x06fc
     1c8:	0000                	.insn	2, 0x0000
     1ca:	0001                	.insn	2, 0x0001
     1cc:	0007005b          	.insn	4, 0x0007005b
     1d0:	5400                	.insn	2, 0x5400
     1d2:	04000007          	.insn	4, 0x04000007
     1d6:	1000                	.insn	2, 0x1000
     1d8:	0280                	.insn	2, 0x0280
     1da:	c89f 0007 2000      	.insn	6, 0x20000007c89f
     1e0:	0008                	.insn	2, 0x0008
     1e2:	0400                	.insn	2, 0x0400
     1e4:	1000                	.insn	2, 0x1000
     1e6:	0280                	.insn	2, 0x0280
     1e8:	209f 0008 2800      	.insn	6, 0x28000008209f
     1ee:	0008                	.insn	2, 0x0008
     1f0:	0100                	.insn	2, 0x0100
     1f2:	5b00                	.insn	2, 0x5b00
	...
     1fc:	05a4                	.insn	2, 0x05a4
     1fe:	0000                	.insn	2, 0x0000
     200:	05e8                	.insn	2, 0x05e8
     202:	0000                	.insn	2, 0x0000
     204:	0002                	.insn	2, 0x0002
     206:	9f30                	.insn	2, 0x9f30
     208:	0620                	.insn	2, 0x0620
     20a:	0000                	.insn	2, 0x0000
     20c:	0628                	.insn	2, 0x0628
     20e:	0000                	.insn	2, 0x0000
     210:	0002                	.insn	2, 0x0002
     212:	9f30                	.insn	2, 0x9f30
     214:	0690                	.insn	2, 0x0690
     216:	0000                	.insn	2, 0x0000
     218:	069c                	.insn	2, 0x069c
     21a:	0000                	.insn	2, 0x0000
     21c:	0002                	.insn	2, 0x0002
     21e:	9f30                	.insn	2, 0x9f30
     220:	069c                	.insn	2, 0x069c
     222:	0000                	.insn	2, 0x0000
     224:	06ac                	.insn	2, 0x06ac
     226:	0000                	.insn	2, 0x0000
     228:	0001                	.insn	2, 0x0001
     22a:	b05a                	.insn	2, 0xb05a
     22c:	0006                	.insn	2, 0x0006
     22e:	e800                	.insn	2, 0xe800
     230:	0006                	.insn	2, 0x0006
     232:	0100                	.insn	2, 0x0100
     234:	5a00                	.insn	2, 0x5a00
	...
     23e:	05a4                	.insn	2, 0x05a4
     240:	0000                	.insn	2, 0x0000
     242:	05a8                	.insn	2, 0x05a8
     244:	0000                	.insn	2, 0x0000
     246:	0001                	.insn	2, 0x0001
     248:	b45d                	.insn	2, 0xb45d
     24a:	0005                	.insn	2, 0x0005
     24c:	b800                	.insn	2, 0xb800
     24e:	0005                	.insn	2, 0x0005
     250:	0300                	.insn	2, 0x0300
     252:	7d00                	.insn	2, 0x7d00
     254:	05b89f7f 05dc0000 	.insn	12, 0x0003000005dc000005b89f7f
     25c:	00030000 
     260:	7e7d                	.insn	2, 0x7e7d
     262:	e09f 0005 e800      	.insn	6, 0xe8000005e09f
     268:	0005                	.insn	2, 0x0005
     26a:	0100                	.insn	2, 0x0100
     26c:	5d00                	.insn	2, 0x5d00
     26e:	0624                	.insn	2, 0x0624
     270:	0000                	.insn	2, 0x0000
     272:	0628                	.insn	2, 0x0628
     274:	0000                	.insn	2, 0x0000
     276:	0001                	.insn	2, 0x0001
     278:	9c5d                	.insn	2, 0x9c5d
     27a:	0006                	.insn	2, 0x0006
     27c:	b400                	.insn	2, 0xb400
     27e:	0006                	.insn	2, 0x0006
     280:	0100                	.insn	2, 0x0100
     282:	5d00                	.insn	2, 0x5d00
     284:	06b8                	.insn	2, 0x06b8
     286:	0000                	.insn	2, 0x0000
     288:	06e8                	.insn	2, 0x06e8
     28a:	0000                	.insn	2, 0x0000
     28c:	0001                	.insn	2, 0x0001
     28e:	005d                	.insn	2, 0x005d
     290:	0000                	.insn	2, 0x0000
     292:	0000                	.insn	2, 0x0000
     294:	0000                	.insn	2, 0x0000
     296:	e800                	.insn	2, 0xe800
     298:	0005                	.insn	2, 0x0005
     29a:	fc00                	.insn	2, 0xfc00
     29c:	0005                	.insn	2, 0x0005
     29e:	0400                	.insn	2, 0x0400
     2a0:	1000                	.insn	2, 0x1000
     2a2:	07e8                	.insn	2, 0x07e8
     2a4:	fc9f 0005 0c00      	.insn	6, 0x0c000005fc9f
     2aa:	0006                	.insn	2, 0x0006
     2ac:	0100                	.insn	2, 0x0100
     2ae:	5b00                	.insn	2, 0x5b00
     2b0:	0658                	.insn	2, 0x0658
     2b2:	0000                	.insn	2, 0x0000
     2b4:	0664                	.insn	2, 0x0664
     2b6:	0000                	.insn	2, 0x0000
     2b8:	0001                	.insn	2, 0x0001
     2ba:	0000005b          	.insn	4, 0x005b
     2be:	0000                	.insn	2, 0x0000
     2c0:	0000                	.insn	2, 0x0000
     2c2:	3000                	.insn	2, 0x3000
     2c4:	0006                	.insn	2, 0x0006
     2c6:	4400                	.insn	2, 0x4400
     2c8:	0006                	.insn	2, 0x0006
     2ca:	0200                	.insn	2, 0x0200
     2cc:	3400                	.insn	2, 0x3400
     2ce:	449f 0006 5400      	.insn	6, 0x54000006449f
     2d4:	0006                	.insn	2, 0x0006
     2d6:	0100                	.insn	2, 0x0100
     2d8:	5b00                	.insn	2, 0x5b00
     2da:	0778                	.insn	2, 0x0778
     2dc:	0000                	.insn	2, 0x0000
     2de:	0784                	.insn	2, 0x0784
     2e0:	0000                	.insn	2, 0x0000
     2e2:	0001                	.insn	2, 0x0001
     2e4:	0000005b          	.insn	4, 0x005b
     2e8:	0000                	.insn	2, 0x0000
     2ea:	0000                	.insn	2, 0x0000
     2ec:	7c00                	.insn	2, 0x7c00
     2ee:	0006                	.insn	2, 0x0006
     2f0:	8400                	.insn	2, 0x8400
     2f2:	0006                	.insn	2, 0x0006
     2f4:	0100                	.insn	2, 0x0100
     2f6:	5a00                	.insn	2, 0x5a00
	...
     300:	069c                	.insn	2, 0x069c
     302:	0000                	.insn	2, 0x0000
     304:	06a4                	.insn	2, 0x06a4
     306:	0000                	.insn	2, 0x0000
     308:	0001                	.insn	2, 0x0001
     30a:	b85c                	.insn	2, 0xb85c
     30c:	0006                	.insn	2, 0x0006
     30e:	e800                	.insn	2, 0xe800
     310:	0006                	.insn	2, 0x0006
     312:	0100                	.insn	2, 0x0100
     314:	5c00                	.insn	2, 0x5c00
	...
     31e:	06a8                	.insn	2, 0x06a8
     320:	0000                	.insn	2, 0x0000
     322:	06b8                	.insn	2, 0x06b8
     324:	0000                	.insn	2, 0x0000
     326:	0001                	.insn	2, 0x0001
     328:	005e                	.insn	2, 0x005e
     32a:	0000                	.insn	2, 0x0000
     32c:	0000                	.insn	2, 0x0000
     32e:	0000                	.insn	2, 0x0000
     330:	0400                	.insn	2, 0x0400
     332:	54000007          	.insn	4, 0x54000007
     336:	02000007          	.insn	4, 0x02000007
     33a:	3000                	.insn	2, 0x3000
     33c:	c89f 0007 d400      	.insn	6, 0xd4000007c89f
     342:	02000007          	.insn	4, 0x02000007
     346:	3000                	.insn	2, 0x3000
     348:	d49f 0007 e400      	.insn	6, 0xe4000007d49f
     34e:	01000007          	.insn	4, 0x01000007
     352:	5b00                	.insn	2, 0x5b00
     354:	07e8                	.insn	2, 0x07e8
     356:	0000                	.insn	2, 0x0000
     358:	0820                	.insn	2, 0x0820
     35a:	0000                	.insn	2, 0x0000
     35c:	0001                	.insn	2, 0x0001
     35e:	0000005b          	.insn	4, 0x005b
     362:	0000                	.insn	2, 0x0000
     364:	0000                	.insn	2, 0x0000
     366:	0400                	.insn	2, 0x0400
     368:	08000007          	.insn	4, 0x08000007
     36c:	01000007          	.insn	4, 0x01000007
     370:	5d00                	.insn	2, 0x5d00
     372:	070c                	.insn	2, 0x070c
     374:	0000                	.insn	2, 0x0000
     376:	0710                	.insn	2, 0x0710
     378:	0000                	.insn	2, 0x0000
     37a:	7f7d0003          	lb	zero,2039(s10)
     37e:	109f 0007 3800      	.insn	6, 0x38000007109f
     384:	03000007          	.insn	4, 0x03000007
     388:	7d00                	.insn	2, 0x7d00
     38a:	9f7e                	.insn	2, 0x9f7e
     38c:	073c                	.insn	2, 0x073c
     38e:	0000                	.insn	2, 0x0000
     390:	0744                	.insn	2, 0x0744
     392:	0000                	.insn	2, 0x0000
     394:	0001                	.insn	2, 0x0001
     396:	445d                	.insn	2, 0x445d
     398:	48000007          	.insn	4, 0x48000007
     39c:	03000007          	.insn	4, 0x03000007
     3a0:	7d00                	.insn	2, 0x7d00
     3a2:	9f7e                	.insn	2, 0x9f7e
     3a4:	074c                	.insn	2, 0x074c
     3a6:	0000                	.insn	2, 0x0000
     3a8:	0754                	.insn	2, 0x0754
     3aa:	0000                	.insn	2, 0x0000
     3ac:	0001                	.insn	2, 0x0001
     3ae:	d45d                	.insn	2, 0xd45d
     3b0:	ec000007          	.insn	4, 0xec000007
     3b4:	01000007          	.insn	4, 0x01000007
     3b8:	5d00                	.insn	2, 0x5d00
     3ba:	07f0                	.insn	2, 0x07f0
     3bc:	0000                	.insn	2, 0x0000
     3be:	0820                	.insn	2, 0x0820
     3c0:	0000                	.insn	2, 0x0000
     3c2:	0001                	.insn	2, 0x0001
     3c4:	005d                	.insn	2, 0x005d
     3c6:	0000                	.insn	2, 0x0000
     3c8:	0000                	.insn	2, 0x0000
     3ca:	0000                	.insn	2, 0x0000
     3cc:	6800                	.insn	2, 0x6800
     3ce:	70000007          	.insn	4, 0x70000007
     3d2:	01000007          	.insn	4, 0x01000007
     3d6:	5a00                	.insn	2, 0x5a00
	...
     3e0:	07a0                	.insn	2, 0x07a0
     3e2:	0000                	.insn	2, 0x0000
     3e4:	07bc                	.insn	2, 0x07bc
     3e6:	0000                	.insn	2, 0x0000
     3e8:	0001                	.insn	2, 0x0001
     3ea:	0000005b          	.insn	4, 0x005b
     3ee:	0000                	.insn	2, 0x0000
     3f0:	0000                	.insn	2, 0x0000
     3f2:	d400                	.insn	2, 0xd400
     3f4:	dc000007          	.insn	4, 0xdc000007
     3f8:	01000007          	.insn	4, 0x01000007
     3fc:	5c00                	.insn	2, 0x5c00
     3fe:	07f0                	.insn	2, 0x07f0
     400:	0000                	.insn	2, 0x0000
     402:	0820                	.insn	2, 0x0820
     404:	0000                	.insn	2, 0x0000
     406:	0001                	.insn	2, 0x0001
     408:	005c                	.insn	2, 0x005c
     40a:	0000                	.insn	2, 0x0000
     40c:	0000                	.insn	2, 0x0000
     40e:	0000                	.insn	2, 0x0000
     410:	e000                	.insn	2, 0xe000
     412:	f0000007          	.insn	4, 0xf0000007
     416:	01000007          	.insn	4, 0x01000007
     41a:	5e00                	.insn	2, 0x5e00
	...
     424:	08e4                	.insn	2, 0x08e4
     426:	0000                	.insn	2, 0x0000
     428:	08f4                	.insn	2, 0x08f4
     42a:	0000                	.insn	2, 0x0000
     42c:	0001                	.insn	2, 0x0001
     42e:	f45a                	.insn	2, 0xf45a
     430:	0008                	.insn	2, 0x0008
     432:	f800                	.insn	2, 0xf800
     434:	0008                	.insn	2, 0x0008
     436:	0300                	.insn	2, 0x0300
     438:	7c00                	.insn	2, 0x7c00
     43a:	08f89f7f 091c0000 	.insn	12, 0x00030000091c000008f89f7f
     442:	00030000 
     446:	7e7c                	.insn	2, 0x7e7c
     448:	209f 0009 2800      	.insn	6, 0x28000009209f
     44e:	0009                	.insn	2, 0x0009
     450:	0100                	.insn	2, 0x0100
     452:	5c00                	.insn	2, 0x5c00
     454:	0928                	.insn	2, 0x0928
     456:	0000                	.insn	2, 0x0000
     458:	092c                	.insn	2, 0x092c
     45a:	0000                	.insn	2, 0x0000
     45c:	7e7c0003          	lb	zero,2023(s8)
     460:	2c9f 0009 3800      	.insn	6, 0x380000092c9f
     466:	0009                	.insn	2, 0x0009
     468:	0100                	.insn	2, 0x0100
     46a:	5c00                	.insn	2, 0x5c00
     46c:	0938                	.insn	2, 0x0938
     46e:	0000                	.insn	2, 0x0000
     470:	093c                	.insn	2, 0x093c
     472:	0000                	.insn	2, 0x0000
     474:	7e7c0003          	lb	zero,2023(s8)
     478:	589f 0009 7000      	.insn	6, 0x70000009589f
     47e:	0009                	.insn	2, 0x0009
     480:	0100                	.insn	2, 0x0100
     482:	5c00                	.insn	2, 0x5c00
     484:	0974                	.insn	2, 0x0974
     486:	0000                	.insn	2, 0x0000
     488:	09a4                	.insn	2, 0x09a4
     48a:	0000                	.insn	2, 0x0000
     48c:	0001                	.insn	2, 0x0001
     48e:	005c                	.insn	2, 0x005c
     490:	0000                	.insn	2, 0x0000
     492:	0000                	.insn	2, 0x0000
     494:	0000                	.insn	2, 0x0000
     496:	e400                	.insn	2, 0xe400
     498:	0008                	.insn	2, 0x0008
     49a:	5800                	.insn	2, 0x5800
     49c:	0009                	.insn	2, 0x0009
     49e:	0200                	.insn	2, 0x0200
     4a0:	3000                	.insn	2, 0x3000
     4a2:	589f 0009 6800      	.insn	6, 0x68000009589f
     4a8:	0009                	.insn	2, 0x0009
     4aa:	0100                	.insn	2, 0x0100
     4ac:	5d00                	.insn	2, 0x5d00
     4ae:	096c                	.insn	2, 0x096c
     4b0:	0000                	.insn	2, 0x0000
     4b2:	09b0                	.insn	2, 0x09b0
     4b4:	0000                	.insn	2, 0x0000
     4b6:	0001                	.insn	2, 0x0001
     4b8:	005d                	.insn	2, 0x005d
     4ba:	0000                	.insn	2, 0x0000
     4bc:	0000                	.insn	2, 0x0000
     4be:	0000                	.insn	2, 0x0000
     4c0:	5800                	.insn	2, 0x5800
     4c2:	0009                	.insn	2, 0x0009
     4c4:	6000                	.insn	2, 0x6000
     4c6:	0009                	.insn	2, 0x0009
     4c8:	0100                	.insn	2, 0x0100
     4ca:	5a00                	.insn	2, 0x5a00
     4cc:	0974                	.insn	2, 0x0974
     4ce:	0000                	.insn	2, 0x0000
     4d0:	09a4                	.insn	2, 0x09a4
     4d2:	0000                	.insn	2, 0x0000
     4d4:	0001                	.insn	2, 0x0001
     4d6:	005a                	.insn	2, 0x005a
     4d8:	0000                	.insn	2, 0x0000
     4da:	0000                	.insn	2, 0x0000
     4dc:	0000                	.insn	2, 0x0000
     4de:	6400                	.insn	2, 0x6400
     4e0:	0009                	.insn	2, 0x0009
     4e2:	7400                	.insn	2, 0x7400
     4e4:	0009                	.insn	2, 0x0009
     4e6:	0100                	.insn	2, 0x0100
     4e8:	6100                	.insn	2, 0x6100
	...
     4f2:	09b0                	.insn	2, 0x09b0
     4f4:	0000                	.insn	2, 0x0000
     4f6:	09d0                	.insn	2, 0x09d0
     4f8:	0000                	.insn	2, 0x0000
     4fa:	0001                	.insn	2, 0x0001
     4fc:	d05a                	.insn	2, 0xd05a
     4fe:	0009                	.insn	2, 0x0009
     500:	5400                	.insn	2, 0x5400
     502:	000a                	.insn	2, 0x000a
     504:	0100                	.insn	2, 0x0100
     506:	5800                	.insn	2, 0x5800
	...
     510:	09d0                	.insn	2, 0x09d0
     512:	0000                	.insn	2, 0x0000
     514:	09e4                	.insn	2, 0x09e4
     516:	0000                	.insn	2, 0x0000
     518:	0002                	.insn	2, 0x0002
     51a:	9f32                	.insn	2, 0x9f32
     51c:	09e4                	.insn	2, 0x09e4
     51e:	0000                	.insn	2, 0x0000
     520:	0a28                	.insn	2, 0x0a28
     522:	0000                	.insn	2, 0x0000
     524:	0001                	.insn	2, 0x0001
     526:	0062                	.insn	2, 0x0062
     528:	0000                	.insn	2, 0x0000
     52a:	0000                	.insn	2, 0x0000
     52c:	0000                	.insn	2, 0x0000
     52e:	d000                	.insn	2, 0xd000
     530:	0009                	.insn	2, 0x0009
     532:	e400                	.insn	2, 0xe400
     534:	0009                	.insn	2, 0x0009
     536:	0300                	.insn	2, 0x0300
     538:	1100                	.insn	2, 0x1100
     53a:	9f00                	.insn	2, 0x9f00
     53c:	09e4                	.insn	2, 0x09e4
     53e:	0000                	.insn	2, 0x0000
     540:	0a3c                	.insn	2, 0x0a3c
     542:	0000                	.insn	2, 0x0000
     544:	0001                	.insn	2, 0x0001
     546:	0059                	.insn	2, 0x0059
     548:	0000                	.insn	2, 0x0000
     54a:	0000                	.insn	2, 0x0000
     54c:	0000                	.insn	2, 0x0000
	...

0000054f <$d.3>:
     54f:	ffff                	.insn	2, 0xffff
     551:	ffff                	.insn	2, 0xffff
     553:	0a88                	.insn	2, 0x0a88
     555:	0040                	.insn	2, 0x0040
     557:	0000                	.insn	2, 0x0000
     559:	0000                	.insn	2, 0x0000
     55b:	0014                	.insn	2, 0x0014
     55d:	0000                	.insn	2, 0x0000
     55f:	00110003          	lb	zero,1(sp)
     563:	009f 0000 0000      	.insn	6, 0x009f
     569:	0000                	.insn	2, 0x0000
     56b:	ff00                	.insn	2, 0xff00
     56d:	ffff                	.insn	2, 0xffff
     56f:	88ff 400a 1800 0000 	.insn	10, 0x200000001800400a88ff
     577:	2000 
     579:	0000                	.insn	2, 0x0000
     57b:	0100                	.insn	2, 0x0100
     57d:	5a00                	.insn	2, 0x5a00
     57f:	0020                	.insn	2, 0x0020
     581:	0000                	.insn	2, 0x0000
     583:	031c                	.insn	2, 0x031c
     585:	0000                	.insn	2, 0x0000
     587:	0001                	.insn	2, 0x0001
     589:	005f 0000 0000      	.insn	6, 0x005f
     58f:	0000                	.insn	2, 0x0000
     591:	ff00                	.insn	2, 0xff00
     593:	ffff                	.insn	2, 0xffff
     595:	88ff 400a 2000 0000 	.insn	10, 0x380000002000400a88ff
     59d:	3800 
     59f:	0000                	.insn	2, 0x0000
     5a1:	0200                	.insn	2, 0x0200
     5a3:	3000                	.insn	2, 0x3000
     5a5:	389f 0000 9000      	.insn	6, 0x90000000389f
     5ab:	0000                	.insn	2, 0x0000
     5ad:	0100                	.insn	2, 0x0100
     5af:	5b00                	.insn	2, 0x5b00
	...
     5b9:	ffff                	.insn	2, 0xffff
     5bb:	ffff                	.insn	2, 0xffff
     5bd:	0a88                	.insn	2, 0x0a88
     5bf:	0040                	.insn	2, 0x0040
     5c1:	0038                	.insn	2, 0x0038
     5c3:	0000                	.insn	2, 0x0000
     5c5:	0054                	.insn	2, 0x0054
     5c7:	0000                	.insn	2, 0x0000
     5c9:	0002                	.insn	2, 0x0002
     5cb:	9f30                	.insn	2, 0x9f30
     5cd:	0054                	.insn	2, 0x0054
     5cf:	0000                	.insn	2, 0x0000
     5d1:	0068                	.insn	2, 0x0068
     5d3:	0000                	.insn	2, 0x0000
     5d5:	0006                	.insn	2, 0x0006
     5d7:	007a                	.insn	2, 0x007a
     5d9:	0311                	.insn	2, 0x0311
     5db:	00689f1b          	.insn	4, 0x00689f1b
     5df:	0000                	.insn	2, 0x0000
     5e1:	007c                	.insn	2, 0x007c
     5e3:	0000                	.insn	2, 0x0000
     5e5:	0009                	.insn	2, 0x0009
     5e7:	007a                	.insn	2, 0x007a
     5e9:	0311                	.insn	2, 0x0311
     5eb:	2201111b          	.insn	4, 0x2201111b
     5ef:	009f 0000 0000      	.insn	6, 0x009f
     5f5:	0000                	.insn	2, 0x0000
     5f7:	ff00                	.insn	2, 0xff00
     5f9:	ffff                	.insn	2, 0xffff
     5fb:	88ff 400a a000 0000 	.insn	10, 0xe0000000a000400a88ff
     603:	e000 
     605:	0000                	.insn	2, 0x0000
     607:	0100                	.insn	2, 0x0100
     609:	5f00                	.insn	2, 0x5f00
     60b:	0150                	.insn	2, 0x0150
     60d:	0000                	.insn	2, 0x0000
     60f:	018c                	.insn	2, 0x018c
     611:	0000                	.insn	2, 0x0000
     613:	0001                	.insn	2, 0x0001
     615:	005f 0000 0000      	.insn	6, 0x005f
     61b:	0000                	.insn	2, 0x0000
     61d:	ff00                	.insn	2, 0xff00
     61f:	ffff                	.insn	2, 0xffff
     621:	88ff 400a a000 0000 	.insn	10, 0xe0000000a000400a88ff
     629:	e000 
     62b:	0000                	.insn	2, 0x0000
     62d:	0200                	.insn	2, 0x0200
     62f:	3400                	.insn	2, 0x3400
     631:	509f 0001 8c00      	.insn	6, 0x8c000001509f
     637:	0001                	.insn	2, 0x0001
     639:	0200                	.insn	2, 0x0200
     63b:	3400                	.insn	2, 0x3400
     63d:	009f 0000 0000      	.insn	6, 0x009f
     643:	0000                	.insn	2, 0x0000
     645:	ff00                	.insn	2, 0xff00
     647:	ffff                	.insn	2, 0xffff
     649:	88ff 400a a000 0000 	.insn	10, 0xe0000000a000400a88ff
     651:	e000 
     653:	0000                	.insn	2, 0x0000
     655:	0100                	.insn	2, 0x0100
     657:	5200                	.insn	2, 0x5200
	...
     661:	ffff                	.insn	2, 0xffff
     663:	ffff                	.insn	2, 0xffff
     665:	0a88                	.insn	2, 0x0a88
     667:	0040                	.insn	2, 0x0040
     669:	00a0                	.insn	2, 0x00a0
     66b:	0000                	.insn	2, 0x0000
     66d:	00e0                	.insn	2, 0x00e0
     66f:	0000                	.insn	2, 0x0000
     671:	0004                	.insn	2, 0x0004
     673:	c072                	.insn	2, 0xc072
     675:	9f00                	.insn	2, 0x9f00
	...
     67f:	ffff                	.insn	2, 0xffff
     681:	ffff                	.insn	2, 0xffff
     683:	0a88                	.insn	2, 0x0a88
     685:	0040                	.insn	2, 0x0040
     687:	00a0                	.insn	2, 0x00a0
     689:	0000                	.insn	2, 0x0000
     68b:	00e0                	.insn	2, 0x00e0
     68d:	0000                	.insn	2, 0x0000
     68f:	0004                	.insn	2, 0x0004
     691:	d072                	.insn	2, 0xd072
     693:	9f00                	.insn	2, 0x9f00
	...
     69d:	ffff                	.insn	2, 0xffff
     69f:	ffff                	.insn	2, 0xffff
     6a1:	0a88                	.insn	2, 0x0a88
     6a3:	0040                	.insn	2, 0x0040
     6a5:	00bc                	.insn	2, 0x00bc
     6a7:	0000                	.insn	2, 0x0000
     6a9:	00e0                	.insn	2, 0x00e0
     6ab:	0000                	.insn	2, 0x0000
     6ad:	0001                	.insn	2, 0x0001
     6af:	0061                	.insn	2, 0x0061
     6b1:	0000                	.insn	2, 0x0000
     6b3:	0000                	.insn	2, 0x0000
     6b5:	0000                	.insn	2, 0x0000
     6b7:	ff00                	.insn	2, 0xff00
     6b9:	ffff                	.insn	2, 0xffff
     6bb:	88ff 400a c000 0000 	.insn	10, 0xe0000000c000400a88ff
     6c3:	e000 
     6c5:	0000                	.insn	2, 0x0000
     6c7:	0300                	.insn	2, 0x0300
     6c9:	1000                	.insn	2, 0x1000
     6cb:	9f41                	.insn	2, 0x9f41
     6cd:	0170                	.insn	2, 0x0170
     6cf:	0000                	.insn	2, 0x0000
     6d1:	018c                	.insn	2, 0x018c
     6d3:	0000                	.insn	2, 0x0000
     6d5:	41100003          	lb	zero,1041(zero) # 411 <$d.6+0x189>
     6d9:	009f 0000 0000      	.insn	6, 0x009f
     6df:	0000                	.insn	2, 0x0000
     6e1:	ff00                	.insn	2, 0xff00
     6e3:	ffff                	.insn	2, 0xffff
     6e5:	88ff 400a d000 0000 	.insn	10, 0xe0000000d000400a88ff
     6ed:	e000 
     6ef:	0000                	.insn	2, 0x0000
     6f1:	0200                	.insn	2, 0x0200
     6f3:	3a00                	.insn	2, 0x3a00
     6f5:	809f 0001 8c00      	.insn	6, 0x8c000001809f
     6fb:	0001                	.insn	2, 0x0001
     6fd:	0200                	.insn	2, 0x0200
     6ff:	3a00                	.insn	2, 0x3a00
     701:	009f 0000 0000      	.insn	6, 0x009f
     707:	0000                	.insn	2, 0x0000
     709:	ff00                	.insn	2, 0xff00
     70b:	ffff                	.insn	2, 0xffff
     70d:	88ff 400a dc00 0000 	.insn	10, 0xf0000000dc00400a88ff
     715:	f000 
     717:	0000                	.insn	2, 0x0000
     719:	0200                	.insn	2, 0x0200
     71b:	3000                	.insn	2, 0x3000
     71d:	f09f 0000 4000      	.insn	6, 0x40000000f09f
     723:	0001                	.insn	2, 0x0001
     725:	0100                	.insn	2, 0x0100
     727:	5b00                	.insn	2, 0x5b00
	...
     731:	ffff                	.insn	2, 0xffff
     733:	ffff                	.insn	2, 0xffff
     735:	0a88                	.insn	2, 0x0a88
     737:	0040                	.insn	2, 0x0040
     739:	00f0                	.insn	2, 0x00f0
     73b:	0000                	.insn	2, 0x0000
     73d:	0100                	.insn	2, 0x0100
     73f:	0000                	.insn	2, 0x0000
     741:	0002                	.insn	2, 0x0002
     743:	9f30                	.insn	2, 0x9f30
     745:	0100                	.insn	2, 0x0100
     747:	0000                	.insn	2, 0x0000
     749:	011c                	.insn	2, 0x011c
     74b:	0000                	.insn	2, 0x0000
     74d:	000a                	.insn	2, 0x000a
     74f:	0081                	.insn	2, 0x0081
     751:	d072                	.insn	2, 0xd072
     753:	1c00                	.insn	2, 0x1c00
     755:	0411                	.insn	2, 0x0411
     757:	011c9f1b          	.insn	4, 0x011c9f1b
     75b:	0000                	.insn	2, 0x0000
     75d:	0124                	.insn	2, 0x0124
     75f:	0000                	.insn	2, 0x0000
     761:	000d                	.insn	2, 0x000d
     763:	0081                	.insn	2, 0x0081
     765:	d072                	.insn	2, 0xd072
     767:	1c00                	.insn	2, 0x1c00
     769:	0411                	.insn	2, 0x0411
     76b:	2201111b          	.insn	4, 0x2201111b
     76f:	009f 0000 0000      	.insn	6, 0x009f
     775:	0000                	.insn	2, 0x0000
     777:	ff00                	.insn	2, 0xff00
     779:	ffff                	.insn	2, 0xffff
     77b:	88ff 400a 9000 0001 	.insn	10, 0xbc0000019000400a88ff
     783:	bc00 
     785:	0001                	.insn	2, 0x0001
     787:	0200                	.insn	2, 0x0200
     789:	3a00                	.insn	2, 0x3a00
     78b:	549f 0002 7c00      	.insn	6, 0x7c000002549f
     791:	0002                	.insn	2, 0x0002
     793:	0200                	.insn	2, 0x0200
     795:	3a00                	.insn	2, 0x3a00
     797:	009f 0000 0000      	.insn	6, 0x009f
     79d:	0000                	.insn	2, 0x0000
     79f:	ff00                	.insn	2, 0xff00
     7a1:	ffff                	.insn	2, 0xffff
     7a3:	88ff 400a a000 0001 	.insn	10, 0xbc000001a000400a88ff
     7ab:	bc00 
     7ad:	0001                	.insn	2, 0x0001
     7af:	0300                	.insn	2, 0x0300
     7b1:	1000                	.insn	2, 0x1000
     7b3:	9f42                	.insn	2, 0x9f42
     7b5:	0264                	.insn	2, 0x0264
     7b7:	0000                	.insn	2, 0x0000
     7b9:	027c                	.insn	2, 0x027c
     7bb:	0000                	.insn	2, 0x0000
     7bd:	42100003          	lb	zero,1057(zero) # 421 <$d.6+0x199>
     7c1:	009f 0000 0000      	.insn	6, 0x009f
     7c7:	0000                	.insn	2, 0x0000
     7c9:	ff00                	.insn	2, 0xff00
     7cb:	ffff                	.insn	2, 0xffff
     7cd:	88ff 400a ac00 0001 	.insn	10, 0xbc000001ac00400a88ff
     7d5:	bc00 
     7d7:	0001                	.insn	2, 0x0001
     7d9:	0200                	.insn	2, 0x0200
     7db:	3a00                	.insn	2, 0x3a00
     7dd:	709f 0002 7c00      	.insn	6, 0x7c000002709f
     7e3:	0002                	.insn	2, 0x0002
     7e5:	0200                	.insn	2, 0x0200
     7e7:	3a00                	.insn	2, 0x3a00
     7e9:	009f 0000 0000      	.insn	6, 0x009f
     7ef:	0000                	.insn	2, 0x0000
     7f1:	ff00                	.insn	2, 0xff00
     7f3:	ffff                	.insn	2, 0xffff
     7f5:	88ff 400a b800 0001 	.insn	10, 0xd0000001b800400a88ff
     7fd:	d000 
     7ff:	0001                	.insn	2, 0x0001
     801:	0200                	.insn	2, 0x0200
     803:	3000                	.insn	2, 0x3000
     805:	d09f 0001 2000      	.insn	6, 0x20000001d09f
     80b:	0002                	.insn	2, 0x0002
     80d:	0100                	.insn	2, 0x0100
     80f:	5b00                	.insn	2, 0x5b00
	...
     819:	ffff                	.insn	2, 0xffff
     81b:	ffff                	.insn	2, 0xffff
     81d:	0a88                	.insn	2, 0x0a88
     81f:	0040                	.insn	2, 0x0040
     821:	01d0                	.insn	2, 0x01d0
     823:	0000                	.insn	2, 0x0000
     825:	01e0                	.insn	2, 0x01e0
     827:	0000                	.insn	2, 0x0000
     829:	0002                	.insn	2, 0x0002
     82b:	9f30                	.insn	2, 0x9f30
     82d:	01e0                	.insn	2, 0x01e0
     82f:	0000                	.insn	2, 0x0000
     831:	01fc                	.insn	2, 0x01fc
     833:	0000                	.insn	2, 0x0000
     835:	000a                	.insn	2, 0x000a
     837:	0081                	.insn	2, 0x0081
     839:	c072                	.insn	2, 0xc072
     83b:	1c00                	.insn	2, 0x1c00
     83d:	0411                	.insn	2, 0x0411
     83f:	01fc9f1b          	.insn	4, 0x01fc9f1b
     843:	0000                	.insn	2, 0x0000
     845:	0204                	.insn	2, 0x0204
     847:	0000                	.insn	2, 0x0000
     849:	000d                	.insn	2, 0x000d
     84b:	0081                	.insn	2, 0x0081
     84d:	c072                	.insn	2, 0xc072
     84f:	1c00                	.insn	2, 0x1c00
     851:	0411                	.insn	2, 0x0411
     853:	2201111b          	.insn	4, 0x2201111b
     857:	009f 0000 0000      	.insn	6, 0x009f
     85d:	0000                	.insn	2, 0x0000
     85f:	ff00                	.insn	2, 0xff00
     861:	ffff                	.insn	2, 0xffff
     863:	88ff 400a 2400 0002 	.insn	10, 0x500000022400400a88ff
     86b:	5000 
     86d:	0002                	.insn	2, 0x0002
     86f:	0200                	.insn	2, 0x0200
     871:	3a00                	.insn	2, 0x3a00
     873:	809f 0002 ac00      	.insn	6, 0xac000002809f
     879:	0002                	.insn	2, 0x0002
     87b:	0200                	.insn	2, 0x0200
     87d:	3a00                	.insn	2, 0x3a00
     87f:	009f 0000 0000      	.insn	6, 0x009f
     885:	0000                	.insn	2, 0x0000
     887:	ff00                	.insn	2, 0xff00
     889:	ffff                	.insn	2, 0xffff
     88b:	88ff 400a 3400 0002 	.insn	10, 0x500000023400400a88ff
     893:	5000 
     895:	0002                	.insn	2, 0x0002
     897:	0300                	.insn	2, 0x0300
     899:	1000                	.insn	2, 0x1000
     89b:	02909f43          	.insn	4, 0x02909f43
     89f:	0000                	.insn	2, 0x0000
     8a1:	02ac                	.insn	2, 0x02ac
     8a3:	0000                	.insn	2, 0x0000
     8a5:	43100003          	lb	zero,1073(zero) # 431 <$d.6+0x1a9>
     8a9:	009f 0000 0000      	.insn	6, 0x009f
     8af:	0000                	.insn	2, 0x0000
     8b1:	ff00                	.insn	2, 0xff00
     8b3:	ffff                	.insn	2, 0xffff
     8b5:	88ff 400a 4000 0002 	.insn	10, 0x500000024000400a88ff
     8bd:	5000 
     8bf:	0002                	.insn	2, 0x0002
     8c1:	0200                	.insn	2, 0x0200
     8c3:	3a00                	.insn	2, 0x3a00
     8c5:	9c9f 0002 ac00      	.insn	6, 0xac0000029c9f
     8cb:	0002                	.insn	2, 0x0002
     8cd:	0200                	.insn	2, 0x0200
     8cf:	3a00                	.insn	2, 0x3a00
     8d1:	009f 0000 0000      	.insn	6, 0x009f
     8d7:	0000                	.insn	2, 0x0000
     8d9:	ff00                	.insn	2, 0xff00
     8db:	ffff                	.insn	2, 0xffff
     8dd:	88ff 400a a800 0002 	.insn	10, 0xbc000002a800400a88ff
     8e5:	bc00 
     8e7:	0002                	.insn	2, 0x0002
     8e9:	0200                	.insn	2, 0x0200
     8eb:	3000                	.insn	2, 0x3000
     8ed:	bc9f 0002 0400      	.insn	6, 0x04000002bc9f
     8f3:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     8f7:	5b00                	.insn	2, 0x5b00
	...
     901:	ffff                	.insn	2, 0xffff
     903:	ffff                	.insn	2, 0xffff
     905:	0a88                	.insn	2, 0x0a88
     907:	0040                	.insn	2, 0x0040
     909:	02c4                	.insn	2, 0x02c4
     90b:	0000                	.insn	2, 0x0000
     90d:	02e0                	.insn	2, 0x02e0
     90f:	0000                	.insn	2, 0x0000
     911:	0009                	.insn	2, 0x0009
     913:	0075                	.insn	2, 0x0075
     915:	007f 111c 1b7f e09f 	.insn	10, 0x0002e09f1b7f111c007f
     91d:	0002 
     91f:	e400                	.insn	2, 0xe400
     921:	0002                	.insn	2, 0x0002
     923:	0c00                	.insn	2, 0x0c00
     925:	7500                	.insn	2, 0x7500
     927:	7f00                	.insn	2, 0x7f00
     929:	1c00                	.insn	2, 0x1c00
     92b:	7f11                	.insn	2, 0x7f11
     92d:	2201111b          	.insn	4, 0x2201111b
     931:	009f 0000 0000      	.insn	6, 0x009f
     937:	0000                	.insn	2, 0x0000
     939:	ff00                	.insn	2, 0xff00
     93b:	ffff                	.insn	2, 0xffff
     93d:	88ff 400a 1c00 0003 	.insn	10, 0x200000031c00400a88ff
     945:	2000 
     947:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     94b:	5a00                	.insn	2, 0x5a00
     94d:	0320                	.insn	2, 0x0320
     94f:	0000                	.insn	2, 0x0000
     951:	0330                	.insn	2, 0x0330
     953:	0000                	.insn	2, 0x0000
     955:	0001                	.insn	2, 0x0001
     957:	0000005b          	.insn	4, 0x005b
     95b:	0000                	.insn	2, 0x0000
     95d:	0000                	.insn	2, 0x0000
     95f:	ff00                	.insn	2, 0xff00
     961:	ffff                	.insn	2, 0xffff
     963:	88ff 400a 3000 0003 	.insn	10, 0x340000033000400a88ff
     96b:	3400 
     96d:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     971:	5a00                	.insn	2, 0x5a00
     973:	0334                	.insn	2, 0x0334
     975:	0000                	.insn	2, 0x0000
     977:	0344                	.insn	2, 0x0344
     979:	0000                	.insn	2, 0x0000
     97b:	0001                	.insn	2, 0x0001
     97d:	0000005b          	.insn	4, 0x005b
     981:	0000                	.insn	2, 0x0000
     983:	0000                	.insn	2, 0x0000
     985:	ff00                	.insn	2, 0xff00
     987:	ffff                	.insn	2, 0xffff
     989:	88ff 400a 4400 0003 	.insn	10, 0x4c0000034400400a88ff
     991:	4c00 
     993:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     997:	5a00                	.insn	2, 0x5a00
	...
     9a1:	ffff                	.insn	2, 0xffff
     9a3:	ffff                	.insn	2, 0xffff
     9a5:	0a88                	.insn	2, 0x0a88
     9a7:	0040                	.insn	2, 0x0040
     9a9:	0350                	.insn	2, 0x0350
     9ab:	0000                	.insn	2, 0x0000
     9ad:	0358                	.insn	2, 0x0358
     9af:	0000                	.insn	2, 0x0000
     9b1:	0001                	.insn	2, 0x0001
     9b3:	005a                	.insn	2, 0x005a
     9b5:	0000                	.insn	2, 0x0000
     9b7:	0000                	.insn	2, 0x0000
     9b9:	0000                	.insn	2, 0x0000
     9bb:	ff00                	.insn	2, 0xff00
     9bd:	ffff                	.insn	2, 0xffff
     9bf:	88ff 400a 5c00 0003 	.insn	10, 0x640000035c00400a88ff
     9c7:	6400 
     9c9:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     9cd:	5a00                	.insn	2, 0x5a00
	...
     9d7:	ffff                	.insn	2, 0xffff
     9d9:	ffff                	.insn	2, 0xffff
     9db:	0a88                	.insn	2, 0x0a88
     9dd:	0040                	.insn	2, 0x0040
     9df:	0374                	.insn	2, 0x0374
     9e1:	0000                	.insn	2, 0x0000
     9e3:	0384                	.insn	2, 0x0384
     9e5:	0000                	.insn	2, 0x0000
     9e7:	0001                	.insn	2, 0x0001
     9e9:	0003885b          	.insn	4, 0x0003885b
     9ed:	9800                	.insn	2, 0x9800
     9ef:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     9f3:	5b00                	.insn	2, 0x5b00
	...
     9fd:	ffff                	.insn	2, 0xffff
     9ff:	ffff                	.insn	2, 0xffff
     a01:	0a88                	.insn	2, 0x0a88
     a03:	0040                	.insn	2, 0x0040
     a05:	0374                	.insn	2, 0x0374
     a07:	0000                	.insn	2, 0x0000
     a09:	0388                	.insn	2, 0x0388
     a0b:	0000                	.insn	2, 0x0000
     a0d:	0001                	.insn	2, 0x0001
     a0f:	885a                	.insn	2, 0x885a
     a11:	94000003          	lb	zero,-1728(zero) # fffff940 <USER_MAX+0xffaff940>
     a15:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     a19:	5e00                	.insn	2, 0x5e00
     a1b:	0394                	.insn	2, 0x0394
     a1d:	0000                	.insn	2, 0x0000
     a1f:	03a0                	.insn	2, 0x03a0
     a21:	0000                	.insn	2, 0x0000
     a23:	0001                	.insn	2, 0x0001
     a25:	005d                	.insn	2, 0x005d
     a27:	0000                	.insn	2, 0x0000
     a29:	0000                	.insn	2, 0x0000
     a2b:	0000                	.insn	2, 0x0000
     a2d:	ff00                	.insn	2, 0xff00
     a2f:	ffff                	.insn	2, 0xffff
     a31:	88ff 400a a800 0003 	.insn	10, 0xb4000003a800400a88ff
     a39:	b400 
     a3b:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     a3f:	5a00                	.insn	2, 0x5a00
     a41:	03b4                	.insn	2, 0x03b4
     a43:	0000                	.insn	2, 0x0000
     a45:	03c0                	.insn	2, 0x03c0
     a47:	0000                	.insn	2, 0x0000
     a49:	7f7a0003          	lb	zero,2039(s4)
     a4d:	c09f 0003 cc00      	.insn	6, 0xcc000003c09f
     a53:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     a57:	5a00                	.insn	2, 0x5a00
     a59:	03d8                	.insn	2, 0x03d8
     a5b:	0000                	.insn	2, 0x0000
     a5d:	03dc                	.insn	2, 0x03dc
     a5f:	0000                	.insn	2, 0x0000
     a61:	0001                	.insn	2, 0x0001
     a63:	005a                	.insn	2, 0x005a
     a65:	0000                	.insn	2, 0x0000
     a67:	0000                	.insn	2, 0x0000
     a69:	0000                	.insn	2, 0x0000
     a6b:	ff00                	.insn	2, 0xff00
     a6d:	ffff                	.insn	2, 0xffff
     a6f:	88ff 400a a800 0003 	.insn	10, 0xe0000003a800400a88ff
     a77:	e000 
     a79:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     a7d:	5b00                	.insn	2, 0x5b00
	...
     a87:	ffff                	.insn	2, 0xffff
     a89:	ffff                	.insn	2, 0xffff
     a8b:	0a88                	.insn	2, 0x0a88
     a8d:	0040                	.insn	2, 0x0040
     a8f:	03e8                	.insn	2, 0x03e8
     a91:	0000                	.insn	2, 0x0000
     a93:	0404                	.insn	2, 0x0404
     a95:	0000                	.insn	2, 0x0000
     a97:	0001                	.insn	2, 0x0001
     a99:	045a                	.insn	2, 0x045a
     a9b:	0004                	.insn	2, 0x0004
     a9d:	a400                	.insn	2, 0xa400
     a9f:	0006                	.insn	2, 0x0006
     aa1:	0100                	.insn	2, 0x0100
     aa3:	5500                	.insn	2, 0x5500
	...
     aad:	ffff                	.insn	2, 0xffff
     aaf:	ffff                	.insn	2, 0xffff
     ab1:	0a88                	.insn	2, 0x0a88
     ab3:	0040                	.insn	2, 0x0040
     ab5:	04b4                	.insn	2, 0x04b4
     ab7:	0000                	.insn	2, 0x0000
     ab9:	04d0                	.insn	2, 0x04d0
     abb:	0000                	.insn	2, 0x0000
     abd:	0001                	.insn	2, 0x0001
     abf:	1459                	.insn	2, 0x1459
     ac1:	0006                	.insn	2, 0x0006
     ac3:	2400                	.insn	2, 0x2400
     ac5:	0006                	.insn	2, 0x0006
     ac7:	0100                	.insn	2, 0x0100
     ac9:	5900                	.insn	2, 0x5900
	...
     ad3:	ffff                	.insn	2, 0xffff
     ad5:	ffff                	.insn	2, 0xffff
     ad7:	0a88                	.insn	2, 0x0a88
     ad9:	0040                	.insn	2, 0x0040
     adb:	04b8                	.insn	2, 0x04b8
     add:	0000                	.insn	2, 0x0000
     adf:	04d0                	.insn	2, 0x04d0
     ae1:	0000                	.insn	2, 0x0000
     ae3:	0001                	.insn	2, 0x0001
     ae5:	2459                	.insn	2, 0x2459
     ae7:	0006                	.insn	2, 0x0006
     ae9:	3000                	.insn	2, 0x3000
     aeb:	0006                	.insn	2, 0x0006
     aed:	0100                	.insn	2, 0x0100
     aef:	5900                	.insn	2, 0x5900
     af1:	0630                	.insn	2, 0x0630
     af3:	0000                	.insn	2, 0x0000
     af5:	0638                	.insn	2, 0x0638
     af7:	0000                	.insn	2, 0x0000
     af9:	0001                	.insn	2, 0x0001
     afb:	385d                	.insn	2, 0x385d
     afd:	0006                	.insn	2, 0x0006
     aff:	5400                	.insn	2, 0x5400
     b01:	0006                	.insn	2, 0x0006
     b03:	0100                	.insn	2, 0x0100
     b05:	5900                	.insn	2, 0x5900
	...
     b0f:	ffff                	.insn	2, 0xffff
     b11:	ffff                	.insn	2, 0xffff
     b13:	0a88                	.insn	2, 0x0a88
     b15:	0040                	.insn	2, 0x0040
     b17:	04b8                	.insn	2, 0x04b8
     b19:	0000                	.insn	2, 0x0000
     b1b:	04d0                	.insn	2, 0x04d0
     b1d:	0000                	.insn	2, 0x0000
     b1f:	00110003          	lb	zero,1(sp)
     b23:	249f 0006 2800      	.insn	6, 0x28000006249f
     b29:	0006                	.insn	2, 0x0006
     b2b:	0300                	.insn	2, 0x0300
     b2d:	1100                	.insn	2, 0x1100
     b2f:	9f00                	.insn	2, 0x9f00
     b31:	0630                	.insn	2, 0x0630
     b33:	0000                	.insn	2, 0x0000
     b35:	0648                	.insn	2, 0x0648
     b37:	0000                	.insn	2, 0x0000
     b39:	0001                	.insn	2, 0x0001
     b3b:	4862                	.insn	2, 0x4862
     b3d:	0006                	.insn	2, 0x0006
     b3f:	5400                	.insn	2, 0x5400
     b41:	0006                	.insn	2, 0x0006
     b43:	0100                	.insn	2, 0x0100
     b45:	5a00                	.insn	2, 0x5a00
	...
     b4f:	ffff                	.insn	2, 0xffff
     b51:	ffff                	.insn	2, 0xffff
     b53:	0a88                	.insn	2, 0x0a88
     b55:	0040                	.insn	2, 0x0040
     b57:	04e8                	.insn	2, 0x04e8
     b59:	0000                	.insn	2, 0x0000
     b5b:	0500                	.insn	2, 0x0500
     b5d:	0000                	.insn	2, 0x0000
     b5f:	07110003          	lb	zero,113(sp)
     b63:	009f 0005 1c00      	.insn	6, 0x1c000005009f
     b69:	0005                	.insn	2, 0x0005
     b6b:	0300                	.insn	2, 0x0300
     b6d:	1100                	.insn	2, 0x1100
     b6f:	9f06                	.insn	2, 0x9f06
     b71:	051c                	.insn	2, 0x051c
     b73:	0000                	.insn	2, 0x0000
     b75:	0538                	.insn	2, 0x0538
     b77:	0000                	.insn	2, 0x0000
     b79:	05110003          	lb	zero,81(sp)
     b7d:	389f 0005 5400      	.insn	6, 0x54000005389f
     b83:	0005                	.insn	2, 0x0005
     b85:	0300                	.insn	2, 0x0300
     b87:	1100                	.insn	2, 0x1100
     b89:	9f04                	.insn	2, 0x9f04
     b8b:	0554                	.insn	2, 0x0554
     b8d:	0000                	.insn	2, 0x0000
     b8f:	0570                	.insn	2, 0x0570
     b91:	0000                	.insn	2, 0x0000
     b93:	03110003          	lb	zero,49(sp)
     b97:	709f 0005 8c00      	.insn	6, 0x8c000005709f
     b9d:	0005                	.insn	2, 0x0005
     b9f:	0300                	.insn	2, 0x0300
     ba1:	1100                	.insn	2, 0x1100
     ba3:	9f02                	.insn	2, 0x9f02
     ba5:	058c                	.insn	2, 0x058c
     ba7:	0000                	.insn	2, 0x0000
     ba9:	05a8                	.insn	2, 0x05a8
     bab:	0000                	.insn	2, 0x0000
     bad:	01110003          	lb	zero,17(sp)
     bb1:	a89f 0005 c000      	.insn	6, 0xc0000005a89f
     bb7:	0005                	.insn	2, 0x0005
     bb9:	0300                	.insn	2, 0x0300
     bbb:	1100                	.insn	2, 0x1100
     bbd:	9f00                	.insn	2, 0x9f00
     bbf:	05c0                	.insn	2, 0x05c0
     bc1:	0000                	.insn	2, 0x0000
     bc3:	05c8                	.insn	2, 0x05c8
     bc5:	0000                	.insn	2, 0x0000
     bc7:	7f110003          	lb	zero,2033(sp)
     bcb:	009f 0000 0000      	.insn	6, 0x009f
     bd1:	0000                	.insn	2, 0x0000
     bd3:	ff00                	.insn	2, 0xff00
     bd5:	ffff                	.insn	2, 0xffff
     bd7:	88ff 400a e800 0004 	.insn	10, 0xac000004e800400a88ff
     bdf:	ac00 
     be1:	0005                	.insn	2, 0x0005
     be3:	0100                	.insn	2, 0x0100
     be5:	5900                	.insn	2, 0x5900
	...
     bef:	ffff                	.insn	2, 0xffff
     bf1:	ffff                	.insn	2, 0xffff
     bf3:	0a88                	.insn	2, 0x0a88
     bf5:	0040                	.insn	2, 0x0040
     bf7:	04ec                	.insn	2, 0x04ec
     bf9:	0000                	.insn	2, 0x0000
     bfb:	04f0                	.insn	2, 0x04f0
     bfd:	0000                	.insn	2, 0x0000
     bff:	0001                	.insn	2, 0x0001
     c01:	085a                	.insn	2, 0x085a
     c03:	0005                	.insn	2, 0x0005
     c05:	0c00                	.insn	2, 0x0c00
     c07:	0005                	.insn	2, 0x0005
     c09:	0100                	.insn	2, 0x0100
     c0b:	5a00                	.insn	2, 0x5a00
     c0d:	0524                	.insn	2, 0x0524
     c0f:	0000                	.insn	2, 0x0000
     c11:	0528                	.insn	2, 0x0528
     c13:	0000                	.insn	2, 0x0000
     c15:	0001                	.insn	2, 0x0001
     c17:	405a                	.insn	2, 0x405a
     c19:	0005                	.insn	2, 0x0005
     c1b:	4400                	.insn	2, 0x4400
     c1d:	0005                	.insn	2, 0x0005
     c1f:	0100                	.insn	2, 0x0100
     c21:	5a00                	.insn	2, 0x5a00
     c23:	055c                	.insn	2, 0x055c
     c25:	0000                	.insn	2, 0x0000
     c27:	0560                	.insn	2, 0x0560
     c29:	0000                	.insn	2, 0x0000
     c2b:	0001                	.insn	2, 0x0001
     c2d:	785a                	.insn	2, 0x785a
     c2f:	0005                	.insn	2, 0x0005
     c31:	7c00                	.insn	2, 0x7c00
     c33:	0005                	.insn	2, 0x0005
     c35:	0100                	.insn	2, 0x0100
     c37:	5a00                	.insn	2, 0x5a00
     c39:	0594                	.insn	2, 0x0594
     c3b:	0000                	.insn	2, 0x0000
     c3d:	0598                	.insn	2, 0x0598
     c3f:	0000                	.insn	2, 0x0000
     c41:	0001                	.insn	2, 0x0001
     c43:	ac5a                	.insn	2, 0xac5a
     c45:	0005                	.insn	2, 0x0005
     c47:	b000                	.insn	2, 0xb000
     c49:	0005                	.insn	2, 0x0005
     c4b:	0100                	.insn	2, 0x0100
     c4d:	5900                	.insn	2, 0x5900
	...
     c57:	ffff                	.insn	2, 0xffff
     c59:	ffff                	.insn	2, 0xffff
     c5b:	0a88                	.insn	2, 0x0a88
     c5d:	0040                	.insn	2, 0x0040
     c5f:	05ec                	.insn	2, 0x05ec
     c61:	0000                	.insn	2, 0x0000
     c63:	05f8                	.insn	2, 0x05f8
     c65:	0000                	.insn	2, 0x0000
     c67:	0001                	.insn	2, 0x0001
     c69:	f862                	.insn	2, 0xf862
     c6b:	0005                	.insn	2, 0x0005
     c6d:	0400                	.insn	2, 0x0400
     c6f:	0006                	.insn	2, 0x0006
     c71:	0300                	.insn	2, 0x0300
     c73:	8200                	.insn	2, 0x8200
     c75:	06049f7f 060c0000 	.insn	12, 0x00010000060c000006049f7f
     c7d:	00010000 
     c81:	0062                	.insn	2, 0x0062
     c83:	0000                	.insn	2, 0x0000
     c85:	0000                	.insn	2, 0x0000
     c87:	0000                	.insn	2, 0x0000
     c89:	ff00                	.insn	2, 0xff00
     c8b:	ffff                	.insn	2, 0xffff
     c8d:	88ff 400a a400 0006 	.insn	10, 0xa8000006a400400a88ff
     c95:	a800 
     c97:	0006                	.insn	2, 0x0006
     c99:	0100                	.insn	2, 0x0100
     c9b:	5a00                	.insn	2, 0x5a00
     c9d:	06a8                	.insn	2, 0x06a8
     c9f:	0000                	.insn	2, 0x0000
     ca1:	06ec                	.insn	2, 0x06ec
     ca3:	0000                	.insn	2, 0x0000
     ca5:	0001                	.insn	2, 0x0001
     ca7:	0006f85b          	.insn	4, 0x0006f85b
     cab:	4400                	.insn	2, 0x4400
     cad:	01000007          	.insn	4, 0x01000007
     cb1:	5b00                	.insn	2, 0x5b00
	...
     cbb:	ffff                	.insn	2, 0xffff
     cbd:	ffff                	.insn	2, 0xffff
     cbf:	0a88                	.insn	2, 0x0a88
     cc1:	0040                	.insn	2, 0x0040
     cc3:	06a8                	.insn	2, 0x06a8
     cc5:	0000                	.insn	2, 0x0000
     cc7:	06c8                	.insn	2, 0x06c8
     cc9:	0000                	.insn	2, 0x0000
     ccb:	0002                	.insn	2, 0x0002
     ccd:	9f3a                	.insn	2, 0x9f3a
     ccf:	06c8                	.insn	2, 0x06c8
     cd1:	0000                	.insn	2, 0x0000
     cd3:	06d4                	.insn	2, 0x06d4
     cd5:	0000                	.insn	2, 0x0000
     cd7:	0002                	.insn	2, 0x0002
     cd9:	9f40                	.insn	2, 0x9f40
     cdb:	06d4                	.insn	2, 0x06d4
     cdd:	0000                	.insn	2, 0x0000
     cdf:	06e0                	.insn	2, 0x06e0
     ce1:	0000                	.insn	2, 0x0000
     ce3:	0001                	.insn	2, 0x0001
     ce5:	e05c                	.insn	2, 0xe05c
     ce7:	0006                	.insn	2, 0x0006
     ce9:	e400                	.insn	2, 0xe400
     ceb:	0006                	.insn	2, 0x0006
     ced:	0200                	.insn	2, 0x0200
     cef:	3a00                	.insn	2, 0x3a00
     cf1:	009f 0000 0000      	.insn	6, 0x009f
     cf7:	0000                	.insn	2, 0x0000
     cf9:	ff00                	.insn	2, 0xff00
     cfb:	ffff                	.insn	2, 0xffff
     cfd:	88ff 400a d400 0006 	.insn	10, 0xe0000006d400400a88ff
     d05:	e000 
     d07:	0006                	.insn	2, 0x0006
     d09:	0200                	.insn	2, 0x0200
     d0b:	3000                	.insn	2, 0x3000
     d0d:	f89f 0006 3c00      	.insn	6, 0x3c000006f89f
     d13:	01000007          	.insn	4, 0x01000007
     d17:	5a00                	.insn	2, 0x5a00
     d19:	0740                	.insn	2, 0x0740
     d1b:	0000                	.insn	2, 0x0000
     d1d:	074c                	.insn	2, 0x074c
     d1f:	0000                	.insn	2, 0x0000
     d21:	0001                	.insn	2, 0x0001
     d23:	005a                	.insn	2, 0x005a
     d25:	0000                	.insn	2, 0x0000
     d27:	0000                	.insn	2, 0x0000
     d29:	0000                	.insn	2, 0x0000
     d2b:	ff00                	.insn	2, 0xff00
     d2d:	ffff                	.insn	2, 0xffff
     d2f:	88ff 400a f800 0006 	.insn	10, 0x2c000006f800400a88ff
     d37:	2c00 
     d39:	01000007          	.insn	4, 0x01000007
     d3d:	5d00                	.insn	2, 0x5d00
	...
     d47:	ffff                	.insn	2, 0xffff
     d49:	ffff                	.insn	2, 0xffff
     d4b:	0a88                	.insn	2, 0x0a88
     d4d:	0040                	.insn	2, 0x0040
     d4f:	0730                	.insn	2, 0x0730
     d51:	0000                	.insn	2, 0x0000
     d53:	0748                	.insn	2, 0x0748
     d55:	0000                	.insn	2, 0x0000
     d57:	0001                	.insn	2, 0x0001
     d59:	0061                	.insn	2, 0x0061
     d5b:	0000                	.insn	2, 0x0000
     d5d:	0000                	.insn	2, 0x0000
     d5f:	0000                	.insn	2, 0x0000
     d61:	ff00                	.insn	2, 0xff00
     d63:	ffff                	.insn	2, 0xffff
     d65:	88ff 400a 4c00 0007 	.insn	10, 0x580000074c00400a88ff
     d6d:	5800 
     d6f:	01000007          	.insn	4, 0x01000007
     d73:	5a00                	.insn	2, 0x5a00
     d75:	075c                	.insn	2, 0x075c
     d77:	0000                	.insn	2, 0x0000
     d79:	0770                	.insn	2, 0x0770
     d7b:	0000                	.insn	2, 0x0000
     d7d:	0001                	.insn	2, 0x0001
     d7f:	705a                	.insn	2, 0x705a
     d81:	ac000007          	.insn	4, 0xac000007
     d85:	01000007          	.insn	4, 0x01000007
     d89:	5800                	.insn	2, 0x5800
	...
     d93:	ffff                	.insn	2, 0xffff
     d95:	ffff                	.insn	2, 0xffff
     d97:	0a88                	.insn	2, 0x0a88
     d99:	0040                	.insn	2, 0x0040
     d9b:	0770                	.insn	2, 0x0770
     d9d:	0000                	.insn	2, 0x0000
     d9f:	0780                	.insn	2, 0x0780
     da1:	0000                	.insn	2, 0x0000
     da3:	0002                	.insn	2, 0x0002
     da5:	9f32                	.insn	2, 0x9f32
     da7:	0780                	.insn	2, 0x0780
     da9:	0000                	.insn	2, 0x0000
     dab:	0790                	.insn	2, 0x0790
     dad:	0000                	.insn	2, 0x0000
     daf:	0001                	.insn	2, 0x0001
     db1:	9059                	.insn	2, 0x9059
     db3:	98000007          	.insn	4, 0x98000007
     db7:	03000007          	.insn	4, 0x03000007
     dbb:	7900                	.insn	2, 0x7900
     dbd:	9f01                	.insn	2, 0x9f01
     dbf:	0798                	.insn	2, 0x0798
     dc1:	0000                	.insn	2, 0x0000
     dc3:	07a0                	.insn	2, 0x07a0
     dc5:	0000                	.insn	2, 0x0000
     dc7:	0001                	.insn	2, 0x0001
     dc9:	0059                	.insn	2, 0x0059
     dcb:	0000                	.insn	2, 0x0000
     dcd:	0000                	.insn	2, 0x0000
     dcf:	0000                	.insn	2, 0x0000
     dd1:	ff00                	.insn	2, 0xff00
     dd3:	ffff                	.insn	2, 0xffff
     dd5:	88ff 400a c400 0007 	.insn	10, 0xcc000007c400400a88ff
     ddd:	cc00 
     ddf:	01000007          	.insn	4, 0x01000007
     de3:	5b00                	.insn	2, 0x5b00
	...
     ded:	ffff                	.insn	2, 0xffff
     def:	ffff                	.insn	2, 0xffff
     df1:	0a88                	.insn	2, 0x0a88
     df3:	0040                	.insn	2, 0x0040
     df5:	07d8                	.insn	2, 0x07d8
     df7:	0000                	.insn	2, 0x0000
     df9:	07e0                	.insn	2, 0x07e0
     dfb:	0000                	.insn	2, 0x0000
     dfd:	0001                	.insn	2, 0x0001
     dff:	0000005b          	.insn	4, 0x005b
     e03:	0000                	.insn	2, 0x0000
     e05:	0000                	.insn	2, 0x0000
     e07:	ff00                	.insn	2, 0xff00
     e09:	ffff                	.insn	2, 0xffff
     e0b:	88ff 400a e000 0007 	.insn	10, 0xe8000007e000400a88ff
     e13:	e800 
     e15:	01000007          	.insn	4, 0x01000007
     e19:	5a00                	.insn	2, 0x5a00
	...
     e23:	ffff                	.insn	2, 0xffff
     e25:	ffff                	.insn	2, 0xffff
     e27:	0a88                	.insn	2, 0x0a88
     e29:	0040                	.insn	2, 0x0040
     e2b:	07f4                	.insn	2, 0x07f4
     e2d:	0000                	.insn	2, 0x0000
     e2f:	07f8                	.insn	2, 0x07f8
     e31:	0000                	.insn	2, 0x0000
     e33:	0001                	.insn	2, 0x0001
     e35:	005a                	.insn	2, 0x005a
     e37:	0000                	.insn	2, 0x0000
     e39:	0000                	.insn	2, 0x0000
     e3b:	0000                	.insn	2, 0x0000
	...

00000e3e <$d.3>:
     e3e:	0000                	.insn	2, 0x0000
     e40:	0000                	.insn	2, 0x0000
     e42:	0014                	.insn	2, 0x0014
     e44:	0000                	.insn	2, 0x0000
     e46:	0001                	.insn	2, 0x0001
     e48:	145a                	.insn	2, 0x145a
     e4a:	0000                	.insn	2, 0x0000
     e4c:	ac00                	.insn	2, 0xac00
     e4e:	0000                	.insn	2, 0x0000
     e50:	0100                	.insn	2, 0x0100
     e52:	5800                	.insn	2, 0x5800
	...
     e5c:	005c                	.insn	2, 0x005c
     e5e:	0000                	.insn	2, 0x0000
     e60:	0070                	.insn	2, 0x0070
     e62:	0000                	.insn	2, 0x0000
     e64:	0001                	.insn	2, 0x0001
     e66:	005a                	.insn	2, 0x005a
     e68:	0000                	.insn	2, 0x0000
     e6a:	0000                	.insn	2, 0x0000
     e6c:	0000                	.insn	2, 0x0000
     e6e:	7800                	.insn	2, 0x7800
     e70:	0000                	.insn	2, 0x0000
     e72:	8400                	.insn	2, 0x8400
     e74:	0000                	.insn	2, 0x0000
     e76:	0100                	.insn	2, 0x0100
     e78:	5a00                	.insn	2, 0x5a00
	...
     e82:	0094                	.insn	2, 0x0094
     e84:	0000                	.insn	2, 0x0000
     e86:	00b4                	.insn	2, 0x00b4
     e88:	0000                	.insn	2, 0x0000
     e8a:	0002                	.insn	2, 0x0002
     e8c:	9f30                	.insn	2, 0x9f30
     e8e:	00b4                	.insn	2, 0x00b4
     e90:	0000                	.insn	2, 0x0000
     e92:	00c0                	.insn	2, 0x00c0
     e94:	0000                	.insn	2, 0x0000
     e96:	0006                	.insn	2, 0x0006
     e98:	0078                	.insn	2, 0x0078
     e9a:	1472                	.insn	2, 0x1472
     e9c:	9f1c                	.insn	2, 0x9f1c
     e9e:	00c0                	.insn	2, 0x00c0
     ea0:	0000                	.insn	2, 0x0000
     ea2:	00c4                	.insn	2, 0x00c4
     ea4:	0000                	.insn	2, 0x0000
     ea6:	0009                	.insn	2, 0x0009
     ea8:	0078                	.insn	2, 0x0078
     eaa:	1472                	.insn	2, 0x1472
     eac:	111c                	.insn	2, 0x111c
     eae:	2201                	.insn	2, 0x2201
     eb0:	009f 0000 0000      	.insn	6, 0x009f
     eb6:	0000                	.insn	2, 0x0000
     eb8:	0800                	.insn	2, 0x0800
     eba:	0001                	.insn	2, 0x0001
     ebc:	0800                	.insn	2, 0x0800
     ebe:	0002                	.insn	2, 0x0002
     ec0:	0100                	.insn	2, 0x0100
     ec2:	5900                	.insn	2, 0x5900
	...
     ecc:	017c                	.insn	2, 0x017c
     ece:	0000                	.insn	2, 0x0000
     ed0:	01e8                	.insn	2, 0x01e8
     ed2:	0000                	.insn	2, 0x0000
     ed4:	0001                	.insn	2, 0x0001
     ed6:	0000005b          	.insn	4, 0x005b
     eda:	0000                	.insn	2, 0x0000
     edc:	0000                	.insn	2, 0x0000
     ede:	a800                	.insn	2, 0xa800
     ee0:	0001                	.insn	2, 0x0001
     ee2:	f800                	.insn	2, 0xf800
     ee4:	0001                	.insn	2, 0x0001
     ee6:	0100                	.insn	2, 0x0100
     ee8:	5c00                	.insn	2, 0x5c00
	...
     ef2:	01dc                	.insn	2, 0x01dc
     ef4:	0000                	.insn	2, 0x0000
     ef6:	01f0                	.insn	2, 0x01f0
     ef8:	0000                	.insn	2, 0x0000
     efa:	0001                	.insn	2, 0x0001
     efc:	005a                	.insn	2, 0x005a
     efe:	0000                	.insn	2, 0x0000
     f00:	0000                	.insn	2, 0x0000
     f02:	0000                	.insn	2, 0x0000
     f04:	1400                	.insn	2, 0x1400
     f06:	0002                	.insn	2, 0x0002
     f08:	5400                	.insn	2, 0x5400
     f0a:	0002                	.insn	2, 0x0002
     f0c:	0100                	.insn	2, 0x0100
     f0e:	5a00                	.insn	2, 0x5a00
     f10:	0254                	.insn	2, 0x0254
     f12:	0000                	.insn	2, 0x0000
     f14:	02b8                	.insn	2, 0x02b8
     f16:	0000                	.insn	2, 0x0000
     f18:	0001                	.insn	2, 0x0001
     f1a:	d864                	.insn	2, 0xd864
     f1c:	0002                	.insn	2, 0x0002
     f1e:	b800                	.insn	2, 0xb800
     f20:	0004                	.insn	2, 0x0004
     f22:	0100                	.insn	2, 0x0100
     f24:	6400                	.insn	2, 0x6400
	...
     f2e:	0214                	.insn	2, 0x0214
     f30:	0000                	.insn	2, 0x0000
     f32:	0250                	.insn	2, 0x0250
     f34:	0000                	.insn	2, 0x0000
     f36:	0001                	.insn	2, 0x0001
     f38:	0002505b          	.insn	4, 0x0002505b
     f3c:	ac00                	.insn	2, 0xac00
     f3e:	0002                	.insn	2, 0x0002
     f40:	0100                	.insn	2, 0x0100
     f42:	5900                	.insn	2, 0x5900
     f44:	02d8                	.insn	2, 0x02d8
     f46:	0000                	.insn	2, 0x0000
     f48:	04b8                	.insn	2, 0x04b8
     f4a:	0000                	.insn	2, 0x0000
     f4c:	0001                	.insn	2, 0x0001
     f4e:	0059                	.insn	2, 0x0059
     f50:	0000                	.insn	2, 0x0000
     f52:	0000                	.insn	2, 0x0000
     f54:	0000                	.insn	2, 0x0000
     f56:	1400                	.insn	2, 0x1400
     f58:	0002                	.insn	2, 0x0002
     f5a:	4c00                	.insn	2, 0x4c00
     f5c:	0002                	.insn	2, 0x0002
     f5e:	0100                	.insn	2, 0x0100
     f60:	5c00                	.insn	2, 0x5c00
     f62:	024c                	.insn	2, 0x024c
     f64:	0000                	.insn	2, 0x0000
     f66:	02a8                	.insn	2, 0x02a8
     f68:	0000                	.insn	2, 0x0000
     f6a:	0001                	.insn	2, 0x0001
     f6c:	d858                	.insn	2, 0xd858
     f6e:	0002                	.insn	2, 0x0002
     f70:	b800                	.insn	2, 0xb800
     f72:	0004                	.insn	2, 0x0004
     f74:	0100                	.insn	2, 0x0100
     f76:	5800                	.insn	2, 0x5800
	...
     f80:	0270                	.insn	2, 0x0270
     f82:	0000                	.insn	2, 0x0000
     f84:	027c                	.insn	2, 0x027c
     f86:	0000                	.insn	2, 0x0000
     f88:	0001                	.insn	2, 0x0001
     f8a:	0000005b          	.insn	4, 0x005b
     f8e:	0000                	.insn	2, 0x0000
     f90:	0000                	.insn	2, 0x0000
     f92:	8400                	.insn	2, 0x8400
     f94:	0002                	.insn	2, 0x0002
     f96:	9800                	.insn	2, 0x9800
     f98:	0002                	.insn	2, 0x0002
     f9a:	0100                	.insn	2, 0x0100
     f9c:	5a00                	.insn	2, 0x5a00
	...
     fa6:	02f4                	.insn	2, 0x02f4
     fa8:	0000                	.insn	2, 0x0000
     faa:	0300                	.insn	2, 0x0300
     fac:	0000                	.insn	2, 0x0000
     fae:	0a110003          	lb	zero,161(sp)
     fb2:	2c9f 0004 3400      	.insn	6, 0x340000042c9f
     fb8:	0004                	.insn	2, 0x0004
     fba:	0300                	.insn	2, 0x0300
     fbc:	1100                	.insn	2, 0x1100
     fbe:	9f08                	.insn	2, 0x9f08
     fc0:	0434                	.insn	2, 0x0434
     fc2:	0000                	.insn	2, 0x0000
     fc4:	0448                	.insn	2, 0x0448
     fc6:	0000                	.insn	2, 0x0000
     fc8:	09110003          	lb	zero,145(sp)
     fcc:	489f 0004 5000      	.insn	6, 0x50000004489f
     fd2:	0004                	.insn	2, 0x0004
     fd4:	0300                	.insn	2, 0x0300
     fd6:	1100                	.insn	2, 0x1100
     fd8:	9f0a                	.insn	2, 0x9f0a
	...
     fe2:	02f4                	.insn	2, 0x02f4
     fe4:	0000                	.insn	2, 0x0000
     fe6:	02f8                	.insn	2, 0x02f8
     fe8:	0000                	.insn	2, 0x0000
     fea:	0001                	.insn	2, 0x0001
     fec:	0002f85b          	.insn	4, 0x0002f85b
     ff0:	0400                	.insn	2, 0x0400
     ff2:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     ff6:	5a00                	.insn	2, 0x5a00
     ff8:	033c                	.insn	2, 0x033c
     ffa:	0000                	.insn	2, 0x0000
     ffc:	0344                	.insn	2, 0x0344
     ffe:	0000                	.insn	2, 0x0000
    1000:	00110003          	lb	zero,1(sp)
    1004:	449f 0003 5000      	.insn	6, 0x50000003449f
    100a:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
    100e:	5a00                	.insn	2, 0x5a00
    1010:	0350                	.insn	2, 0x0350
    1012:	0000                	.insn	2, 0x0000
    1014:	0358                	.insn	2, 0x0358
    1016:	0000                	.insn	2, 0x0000
    1018:	01110003          	lb	zero,17(sp)
    101c:	589f 0003 2000      	.insn	6, 0x20000003589f
    1022:	0004                	.insn	2, 0x0004
    1024:	0100                	.insn	2, 0x0100
    1026:	5a00                	.insn	2, 0x5a00
    1028:	0420                	.insn	2, 0x0420
    102a:	0000                	.insn	2, 0x0000
    102c:	042c                	.insn	2, 0x042c
    102e:	0000                	.insn	2, 0x0000
    1030:	017a0003          	lb	zero,23(s4)
    1034:	309f 0004 3c00      	.insn	6, 0x3c000004309f
    103a:	0004                	.insn	2, 0x0004
    103c:	0100                	.insn	2, 0x0100
    103e:	5b00                	.insn	2, 0x5b00
    1040:	0440                	.insn	2, 0x0440
    1042:	0000                	.insn	2, 0x0000
    1044:	0448                	.insn	2, 0x0448
    1046:	0000                	.insn	2, 0x0000
    1048:	0001                	.insn	2, 0x0001
    104a:	485a                	.insn	2, 0x485a
    104c:	0004                	.insn	2, 0x0004
    104e:	5800                	.insn	2, 0x5800
    1050:	0004                	.insn	2, 0x0004
    1052:	0100                	.insn	2, 0x0100
    1054:	5b00                	.insn	2, 0x5b00
	...
    105e:	02f4                	.insn	2, 0x02f4
    1060:	0000                	.insn	2, 0x0000
    1062:	031c                	.insn	2, 0x031c
    1064:	0000                	.insn	2, 0x0000
    1066:	0009                	.insn	2, 0x0009
    1068:	0085                	.insn	2, 0x0085
    106a:	1011                	.insn	2, 0x1011
    106c:	111c                	.insn	2, 0x111c
    106e:	1c9f1b7f 20000003 	.insn	12, 0x0c000003200000031c9f1b7f
    1076:	0c000003 
    107a:	8500                	.insn	2, 0x8500
    107c:	1100                	.insn	2, 0x1100
    107e:	1c10                	.insn	2, 0x1c10
    1080:	7f11                	.insn	2, 0x7f11
    1082:	2201111b          	.insn	4, 0x2201111b
    1086:	289f 0003 b800      	.insn	6, 0xb8000003289f
    108c:	0004                	.insn	2, 0x0004
    108e:	0900                	.insn	2, 0x0900
    1090:	8500                	.insn	2, 0x8500
    1092:	1100                	.insn	2, 0x1100
    1094:	1c10                	.insn	2, 0x1c10
    1096:	7f11                	.insn	2, 0x7f11
    1098:	00009f1b          	.insn	4, 0x9f1b
    109c:	0000                	.insn	2, 0x0000
    109e:	0000                	.insn	2, 0x0000
    10a0:	0000                	.insn	2, 0x0000
    10a2:	033c                	.insn	2, 0x033c
    10a4:	0000                	.insn	2, 0x0000
    10a6:	0344                	.insn	2, 0x0344
    10a8:	0000                	.insn	2, 0x0000
    10aa:	00110003          	lb	zero,1(sp)
    10ae:	449f 0003 5000      	.insn	6, 0x50000003449f
    10b4:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    10b8:	1100                	.insn	2, 0x1100
    10ba:	9f01                	.insn	2, 0x9f01
    10bc:	0350                	.insn	2, 0x0350
    10be:	0000                	.insn	2, 0x0000
    10c0:	0358                	.insn	2, 0x0358
    10c2:	0000                	.insn	2, 0x0000
    10c4:	00110003          	lb	zero,1(sp)
    10c8:	589f 0003 6c00      	.insn	6, 0x6c000003589f
    10ce:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    10d2:	1100                	.insn	2, 0x1100
    10d4:	9f01                	.insn	2, 0x9f01
    10d6:	036c                	.insn	2, 0x036c
    10d8:	0000                	.insn	2, 0x0000
    10da:	0374                	.insn	2, 0x0374
    10dc:	0000                	.insn	2, 0x0000
    10de:	02110003          	lb	zero,33(sp)
    10e2:	749f 0003 7c00      	.insn	6, 0x7c000003749f
    10e8:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    10ec:	1100                	.insn	2, 0x1100
    10ee:	037c9f03          	lh	t5,55(s9)
    10f2:	0000                	.insn	2, 0x0000
    10f4:	0384                	.insn	2, 0x0384
    10f6:	0000                	.insn	2, 0x0000
    10f8:	04110003          	lb	zero,65(sp)
    10fc:	849f 0003 8c00      	.insn	6, 0x8c000003849f
    1102:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    1106:	1100                	.insn	2, 0x1100
    1108:	9f05                	.insn	2, 0x9f05
    110a:	038c                	.insn	2, 0x038c
    110c:	0000                	.insn	2, 0x0000
    110e:	0394                	.insn	2, 0x0394
    1110:	0000                	.insn	2, 0x0000
    1112:	06110003          	lb	zero,97(sp)
    1116:	949f 0003 9c00      	.insn	6, 0x9c000003949f
    111c:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    1120:	1100                	.insn	2, 0x1100
    1122:	03a89f07          	.insn	4, 0x03a89f07
    1126:	0000                	.insn	2, 0x0000
    1128:	03b4                	.insn	2, 0x03b4
    112a:	0000                	.insn	2, 0x0000
    112c:	02110003          	lb	zero,33(sp)
    1130:	b49f 0003 c800      	.insn	6, 0xc8000003b49f
    1136:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    113a:	1100                	.insn	2, 0x1100
    113c:	03c89f03          	lh	t5,60(a7)
    1140:	0000                	.insn	2, 0x0000
    1142:	03dc                	.insn	2, 0x03dc
    1144:	0000                	.insn	2, 0x0000
    1146:	04110003          	lb	zero,65(sp)
    114a:	dc9f 0003 f000      	.insn	6, 0xf0000003dc9f
    1150:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    1154:	1100                	.insn	2, 0x1100
    1156:	9f05                	.insn	2, 0x9f05
    1158:	03f0                	.insn	2, 0x03f0
    115a:	0000                	.insn	2, 0x0000
    115c:	0404                	.insn	2, 0x0404
    115e:	0000                	.insn	2, 0x0000
    1160:	06110003          	lb	zero,97(sp)
    1164:	049f 0004 1800      	.insn	6, 0x18000004049f
    116a:	0004                	.insn	2, 0x0004
    116c:	0300                	.insn	2, 0x0300
    116e:	1100                	.insn	2, 0x1100
    1170:	04189f07          	.insn	4, 0x04189f07
    1174:	0000                	.insn	2, 0x0000
    1176:	0420                	.insn	2, 0x0420
    1178:	0000                	.insn	2, 0x0000
    117a:	08110003          	lb	zero,129(sp)
    117e:	009f 0000 0000      	.insn	6, 0x009f
    1184:	0000                	.insn	2, 0x0000
    1186:	b800                	.insn	2, 0xb800
    1188:	0004                	.insn	2, 0x0004
    118a:	cc00                	.insn	2, 0xcc00
    118c:	0004                	.insn	2, 0x0004
    118e:	0100                	.insn	2, 0x0100
    1190:	5a00                	.insn	2, 0x5a00
	...
    119a:	0514                	.insn	2, 0x0514
    119c:	0000                	.insn	2, 0x0000
    119e:	0520                	.insn	2, 0x0520
    11a0:	0000                	.insn	2, 0x0000
    11a2:	0001                	.insn	2, 0x0001
    11a4:	0000005b          	.insn	4, 0x005b
    11a8:	0000                	.insn	2, 0x0000
    11aa:	0000                	.insn	2, 0x0000
    11ac:	2800                	.insn	2, 0x2800
    11ae:	0005                	.insn	2, 0x0005
    11b0:	3c00                	.insn	2, 0x3c00
    11b2:	0005                	.insn	2, 0x0005
    11b4:	0100                	.insn	2, 0x0100
    11b6:	5a00                	.insn	2, 0x5a00
	...
    11c0:	058c                	.insn	2, 0x058c
    11c2:	0000                	.insn	2, 0x0000
    11c4:	05f8                	.insn	2, 0x05f8
    11c6:	0000                	.insn	2, 0x0000
    11c8:	0009                	.insn	2, 0x0009
    11ca:	10110083          	lb	ra,257(sp)
    11ce:	111c                	.insn	2, 0x111c
    11d0:	f89f1b7f fc000005 	.insn	12, 0x0c000005fc000005f89f1b7f
    11d8:	0c000005 
    11dc:	8300                	.insn	2, 0x8300
    11de:	1100                	.insn	2, 0x1100
    11e0:	1c10                	.insn	2, 0x1c10
    11e2:	7f11                	.insn	2, 0x7f11
    11e4:	2201111b          	.insn	4, 0x2201111b
    11e8:	049f 0006 3400      	.insn	6, 0x34000006049f
    11ee:	09000007          	.insn	4, 0x09000007
    11f2:	8300                	.insn	2, 0x8300
    11f4:	1100                	.insn	2, 0x1100
    11f6:	1c10                	.insn	2, 0x1c10
    11f8:	7f11                	.insn	2, 0x7f11
    11fa:	00009f1b          	.insn	4, 0x9f1b
    11fe:	0000                	.insn	2, 0x0000
    1200:	0000                	.insn	2, 0x0000
    1202:	0000                	.insn	2, 0x0000
    1204:	05c4                	.insn	2, 0x05c4
    1206:	0000                	.insn	2, 0x0000
    1208:	05f8                	.insn	2, 0x05f8
    120a:	0000                	.insn	2, 0x0000
    120c:	0001                	.insn	2, 0x0001
    120e:	0000005b          	.insn	4, 0x005b
    1212:	0000                	.insn	2, 0x0000
    1214:	0000                	.insn	2, 0x0000
    1216:	ec00                	.insn	2, 0xec00
    1218:	0005                	.insn	2, 0x0005
    121a:	f800                	.insn	2, 0xf800
    121c:	0005                	.insn	2, 0x0005
    121e:	0100                	.insn	2, 0x0100
    1220:	5c00                	.insn	2, 0x5c00
	...
    122a:	0618                	.insn	2, 0x0618
    122c:	0000                	.insn	2, 0x0000
    122e:	061c                	.insn	2, 0x061c
    1230:	0000                	.insn	2, 0x0000
    1232:	00110003          	lb	zero,1(sp)
    1236:	1c9f 0006 2400      	.insn	6, 0x240000061c9f
    123c:	0006                	.insn	2, 0x0006
    123e:	0300                	.insn	2, 0x0300
    1240:	1100                	.insn	2, 0x1100
    1242:	9f01                	.insn	2, 0x9f01
    1244:	0624                	.insn	2, 0x0624
    1246:	0000                	.insn	2, 0x0000
    1248:	062c                	.insn	2, 0x062c
    124a:	0000                	.insn	2, 0x0000
    124c:	02110003          	lb	zero,33(sp)
    1250:	2c9f 0006 3400      	.insn	6, 0x340000062c9f
    1256:	0006                	.insn	2, 0x0006
    1258:	0300                	.insn	2, 0x0300
    125a:	1100                	.insn	2, 0x1100
    125c:	06349f03          	lh	t5,99(s1)
    1260:	0000                	.insn	2, 0x0000
    1262:	063c                	.insn	2, 0x063c
    1264:	0000                	.insn	2, 0x0000
    1266:	04110003          	lb	zero,65(sp)
    126a:	3c9f 0006 4400      	.insn	6, 0x440000063c9f
    1270:	0006                	.insn	2, 0x0006
    1272:	0300                	.insn	2, 0x0300
    1274:	1100                	.insn	2, 0x1100
    1276:	9f05                	.insn	2, 0x9f05
    1278:	0644                	.insn	2, 0x0644
    127a:	0000                	.insn	2, 0x0000
    127c:	064c                	.insn	2, 0x064c
    127e:	0000                	.insn	2, 0x0000
    1280:	06110003          	lb	zero,97(sp)
    1284:	4c9f 0006 5400      	.insn	6, 0x540000064c9f
    128a:	0006                	.insn	2, 0x0006
    128c:	0300                	.insn	2, 0x0300
    128e:	1100                	.insn	2, 0x1100
    1290:	06609f07          	.insn	4, 0x06609f07
    1294:	0000                	.insn	2, 0x0000
    1296:	0668                	.insn	2, 0x0668
    1298:	0000                	.insn	2, 0x0000
    129a:	00110003          	lb	zero,1(sp)
    129e:	689f 0006 7800      	.insn	6, 0x78000006689f
    12a4:	0006                	.insn	2, 0x0006
    12a6:	0300                	.insn	2, 0x0300
    12a8:	1100                	.insn	2, 0x1100
    12aa:	9f01                	.insn	2, 0x9f01
    12ac:	0678                	.insn	2, 0x0678
    12ae:	0000                	.insn	2, 0x0000
    12b0:	0688                	.insn	2, 0x0688
    12b2:	0000                	.insn	2, 0x0000
    12b4:	02110003          	lb	zero,33(sp)
    12b8:	889f 0006 9800      	.insn	6, 0x98000006889f
    12be:	0006                	.insn	2, 0x0006
    12c0:	0300                	.insn	2, 0x0300
    12c2:	1100                	.insn	2, 0x1100
    12c4:	06989f03          	lh	t5,105(a7)
    12c8:	0000                	.insn	2, 0x0000
    12ca:	06a8                	.insn	2, 0x06a8
    12cc:	0000                	.insn	2, 0x0000
    12ce:	04110003          	lb	zero,65(sp)
    12d2:	a89f 0006 b800      	.insn	6, 0xb8000006a89f
    12d8:	0006                	.insn	2, 0x0006
    12da:	0300                	.insn	2, 0x0300
    12dc:	1100                	.insn	2, 0x1100
    12de:	9f05                	.insn	2, 0x9f05
    12e0:	06b8                	.insn	2, 0x06b8
    12e2:	0000                	.insn	2, 0x0000
    12e4:	06c8                	.insn	2, 0x06c8
    12e6:	0000                	.insn	2, 0x0000
    12e8:	06110003          	lb	zero,97(sp)
    12ec:	c89f 0006 d800      	.insn	6, 0xd8000006c89f
    12f2:	0006                	.insn	2, 0x0006
    12f4:	0300                	.insn	2, 0x0300
    12f6:	1100                	.insn	2, 0x1100
    12f8:	06d89f07          	.insn	4, 0x06d89f07
    12fc:	0000                	.insn	2, 0x0000
    12fe:	06e0                	.insn	2, 0x06e0
    1300:	0000                	.insn	2, 0x0000
    1302:	08110003          	lb	zero,129(sp)
    1306:	009f 0000 0000      	.insn	6, 0x009f
    130c:	0000                	.insn	2, 0x0000
    130e:	ec00                	.insn	2, 0xec00
    1310:	0006                	.insn	2, 0x0006
    1312:	f400                	.insn	2, 0xf400
    1314:	0006                	.insn	2, 0x0006
    1316:	0300                	.insn	2, 0x0300
    1318:	1100                	.insn	2, 0x1100
    131a:	9f08                	.insn	2, 0x9f08
    131c:	06f4                	.insn	2, 0x06f4
    131e:	0000                	.insn	2, 0x0000
    1320:	06fc                	.insn	2, 0x06fc
    1322:	0000                	.insn	2, 0x0000
    1324:	09110003          	lb	zero,145(sp)
    1328:	fc9f 0006 0800      	.insn	6, 0x08000006fc9f
    132e:	03000007          	.insn	4, 0x03000007
    1332:	1100                	.insn	2, 0x1100
    1334:	9f0a                	.insn	2, 0x9f0a
    1336:	0708                	.insn	2, 0x0708
    1338:	0000                	.insn	2, 0x0000
    133a:	0710                	.insn	2, 0x0710
    133c:	0000                	.insn	2, 0x0000
    133e:	08110003          	lb	zero,129(sp)
    1342:	109f 0007 2000      	.insn	6, 0x20000007109f
    1348:	03000007          	.insn	4, 0x03000007
    134c:	1100                	.insn	2, 0x1100
    134e:	9f09                	.insn	2, 0x9f09
    1350:	0720                	.insn	2, 0x0720
    1352:	0000                	.insn	2, 0x0000
    1354:	0734                	.insn	2, 0x0734
    1356:	0000                	.insn	2, 0x0000
    1358:	0a110003          	lb	zero,161(sp)
    135c:	009f 0000 0000      	.insn	6, 0x009f
    1362:	0000                	.insn	2, 0x0000
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
 212:	49010103          	lb	sp,1168(sp) # 1335ac <$d.5+0x132160>
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
 4ee:	49010103          	lb	sp,1168(sp) # 1337f8 <$d.5+0x1323ac>
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
       0:	0941                	.insn	2, 0x0941
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
      22:	0a6c                	.insn	2, 0x0a6c
      24:	0000                	.insn	2, 0x0000
      26:	3302                	.insn	2, 0x3302
      28:	0000                	.insn	2, 0x0000
      2a:	0100                	.insn	2, 0x0100
      2c:	9b03050f          	.insn	4, 0x9b03050f
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
      56:	1c15                	.insn	2, 0x1c15
      58:	0040                	.insn	2, 0x0040
      5a:	00003f03          	.insn	4, 0x3f03
      5e:	0400                	.insn	2, 0x0400
      60:	0046                	.insn	2, 0x0046
      62:	0000                	.insn	2, 0x0000
      64:	000d                	.insn	2, 0x000d
      66:	5a02                	.insn	2, 0x5a02
      68:	0000                	.insn	2, 0x0000
      6a:	0100                	.insn	2, 0x0100
      6c:	4903053f 0200401b 	.insn	8, 0x0200401b4903053f
      74:	0080                	.insn	2, 0x0080
      76:	0000                	.insn	2, 0x0000
      78:	9001                	.insn	2, 0x9001
      7a:	0305                	.insn	2, 0x0305
      7c:	00401c0f          	.insn	4, 0x00401c0f
      80:	00003f03          	.insn	4, 0x3f03
      84:	0400                	.insn	2, 0x0400
      86:	0046                	.insn	2, 0x0046
      88:	0000                	.insn	2, 0x0000
      8a:	0006                	.insn	2, 0x0006
      8c:	9902                	.insn	2, 0x9902
      8e:	0000                	.insn	2, 0x0000
      90:	0100                	.insn	2, 0x0100
      92:	0591                	.insn	2, 0x0591
      94:	401bac03          	lw	s8,1025(s7)
      98:	0300                	.insn	2, 0x0300
      9a:	0000003f 00004604 	.insn	8, 0x46040000003f
      a2:	1900                	.insn	2, 0x1900
      a4:	0200                	.insn	2, 0x0200
      a6:	00b2                	.insn	2, 0x00b2
      a8:	0000                	.insn	2, 0x0000
      aa:	9401                	.insn	2, 0x9401
      ac:	0305                	.insn	2, 0x0305
      ae:	1ca9                	.insn	2, 0x1ca9
      b0:	0040                	.insn	2, 0x0040
      b2:	00003f03          	.insn	4, 0x3f03
      b6:	0400                	.insn	2, 0x0400
      b8:	0046                	.insn	2, 0x0046
      ba:	0000                	.insn	2, 0x0000
      bc:	0005                	.insn	2, 0x0005
      be:	cb02                	.insn	2, 0xcb02
      c0:	0000                	.insn	2, 0x0000
      c2:	0100                	.insn	2, 0x0100
      c4:	05b1                	.insn	2, 0x05b1
      c6:	401bc503          	lbu	a0,1025(s7)
      ca:	0300                	.insn	2, 0x0300
      cc:	0000003f 00004604 	.insn	8, 0x46040000003f
      d4:	0700                	.insn	2, 0x0700
      d6:	0200                	.insn	2, 0x0200
      d8:	00e4                	.insn	2, 0x00e4
      da:	0000                	.insn	2, 0x0000
      dc:	b601                	.insn	2, 0xb601
      de:	0305                	.insn	2, 0x0305
      e0:	1d02                	.insn	2, 0x1d02
      e2:	0040                	.insn	2, 0x0040
      e4:	00003f03          	.insn	4, 0x3f03
      e8:	0400                	.insn	2, 0x0400
      ea:	0046                	.insn	2, 0x0046
      ec:	0000                	.insn	2, 0x0000
      ee:	001a                	.insn	2, 0x001a
      f0:	fd02                	.insn	2, 0xfd02
      f2:	0000                	.insn	2, 0x0000
      f4:	0100                	.insn	2, 0x0100
      f6:	05bd                	.insn	2, 0x05bd
      f8:	401ba203          	lw	tp,1025(s7)
      fc:	0300                	.insn	2, 0x0300
      fe:	0000003f 00004604 	.insn	8, 0x46040000003f
     106:	0a00                	.insn	2, 0x0a00
     108:	0200                	.insn	2, 0x0200
     10a:	0116                	.insn	2, 0x0116
     10c:	0000                	.insn	2, 0x0000
     10e:	c201                	.insn	2, 0xc201
     110:	0305                	.insn	2, 0x0305
     112:	00401bfb          	.insn	4, 0x00401bfb
     116:	00003f03          	.insn	4, 0x3f03
     11a:	0400                	.insn	2, 0x0400
     11c:	0046                	.insn	2, 0x0046
     11e:	0000                	.insn	2, 0x0000
     120:	0009                	.insn	2, 0x0009
     122:	2f02                	.insn	2, 0x2f02
     124:	0001                	.insn	2, 0x0001
     126:	0100                	.insn	2, 0x0100
     128:	220305c7          	.insn	4, 0x220305c7
     12c:	401c                	.insn	2, 0x401c
     12e:	0300                	.insn	2, 0x0300
     130:	0000003f 00004604 	.insn	8, 0x46040000003f
     138:	1100                	.insn	2, 0x1100
     13a:	0200                	.insn	2, 0x0200
     13c:	0116                	.insn	2, 0x0116
     13e:	0000                	.insn	2, 0x0000
     140:	cf01                	.insn	2, 0xcf01
     142:	0305                	.insn	2, 0x0305
     144:	00401c7f 00009902 	.insn	12, 0x05d101000000990200401c7f
     14c:	05d10100 
     150:	401c6103          	.insn	4, 0x401c6103
     154:	0200                	.insn	2, 0x0200
     156:	0162                	.insn	2, 0x0162
     158:	0000                	.insn	2, 0x0000
     15a:	d901                	.insn	2, 0xd901
     15c:	0305                	.insn	2, 0x0305
     15e:	1b91                	.insn	2, 0x1b91
     160:	0040                	.insn	2, 0x0040
     162:	00003f03          	.insn	4, 0x3f03
     166:	0400                	.insn	2, 0x0400
     168:	0046                	.insn	2, 0x0046
     16a:	0000                	.insn	2, 0x0000
     16c:	0008                	.insn	2, 0x0008
     16e:	9902                	.insn	2, 0x9902
     170:	0000                	.insn	2, 0x0000
     172:	0100                	.insn	2, 0x0100
     174:	e90305db          	.insn	4, 0xe90305db
     178:	401c                	.insn	2, 0x401c
     17a:	0200                	.insn	2, 0x0200
     17c:	0116                	.insn	2, 0x0116
     17e:	0000                	.insn	2, 0x0000
     180:	e301                	.insn	2, 0xe301
     182:	0305                	.insn	2, 0x0305
     184:	1b99                	.insn	2, 0x1b99
     186:	0040                	.insn	2, 0x0040
     188:	e402                	.insn	2, 0xe402
     18a:	0000                	.insn	2, 0x0000
     18c:	0100                	.insn	2, 0x0100
     18e:	05e5                	.insn	2, 0x05e5
     190:	401d3103          	.insn	4, 0x401d3103
     194:	0200                	.insn	2, 0x0200
     196:	01a2                	.insn	2, 0x01a2
     198:	0000                	.insn	2, 0x0000
     19a:	eb01                	.insn	2, 0xeb01
     19c:	0305                	.insn	2, 0x0305
     19e:	1b69                	.insn	2, 0x1b69
     1a0:	0040                	.insn	2, 0x0040
     1a2:	00003f03          	.insn	4, 0x3f03
     1a6:	0400                	.insn	2, 0x0400
     1a8:	0046                	.insn	2, 0x0046
     1aa:	0000                	.insn	2, 0x0000
     1ac:	001f bb02 0001      	.insn	6, 0x0001bb02001f
     1b2:	0100                	.insn	2, 0x0100
     1b4:	05f1                	.insn	2, 0x05f1
     1b6:	401c0403          	lb	s0,1025(s8)
     1ba:	0300                	.insn	2, 0x0300
     1bc:	0000003f 00004604 	.insn	8, 0x46040000003f
     1c4:	0b00                	.insn	2, 0x0b00
     1c6:	0200                	.insn	2, 0x0200
     1c8:	01d4                	.insn	2, 0x01d4
     1ca:	0000                	.insn	2, 0x0000
     1cc:	f401                	.insn	2, 0xf401
     1ce:	0305                	.insn	2, 0x0305
     1d0:	1c3e                	.insn	2, 0x1c3e
     1d2:	0040                	.insn	2, 0x0040
     1d4:	00003f03          	.insn	4, 0x3f03
     1d8:	0400                	.insn	2, 0x0400
     1da:	0046                	.insn	2, 0x0046
     1dc:	0000                	.insn	2, 0x0000
     1de:	0014                	.insn	2, 0x0014
     1e0:	5a02                	.insn	2, 0x5a02
     1e2:	0000                	.insn	2, 0x0000
     1e4:	0100                	.insn	2, 0x0100
     1e6:	05f8                	.insn	2, 0x05f8
     1e8:	401d4b03          	lbu	s6,1025(s10)
     1ec:	0200                	.insn	2, 0x0200
     1ee:	0000012f          	.insn	4, 0x012f
     1f2:	f901                	.insn	2, 0xf901
     1f4:	0305                	.insn	2, 0x0305
     1f6:	1c88                	.insn	2, 0x1c88
     1f8:	0040                	.insn	2, 0x0040
     1fa:	6202                	.insn	2, 0x6202
     1fc:	0001                	.insn	2, 0x0001
     1fe:	0100                	.insn	2, 0x0100
     200:	05fa                	.insn	2, 0x05fa
     202:	401cae03          	lw	t3,1025(s9)
     206:	0200                	.insn	2, 0x0200
     208:	00000033          	add	zero,zero,zero
     20c:	fb01                	.insn	2, 0xfb01
     20e:	0305                	.insn	2, 0x0305
     210:	1cca                	.insn	2, 0x1cca
     212:	0040                	.insn	2, 0x0040
     214:	2102                	.insn	2, 0x2102
     216:	0002                	.insn	2, 0x0002
     218:	0100                	.insn	2, 0x0100
     21a:	05fc                	.insn	2, 0x05fc
     21c:	401c5203          	lhu	tp,1025(s8)
     220:	0300                	.insn	2, 0x0300
     222:	0000003f 00004604 	.insn	8, 0x46040000003f
     22a:	0f00                	.insn	2, 0x0f00
     22c:	0200                	.insn	2, 0x0200
     22e:	0116                	.insn	2, 0x0116
     230:	0000                	.insn	2, 0x0000
     232:	ff01                	.insn	2, 0xff01
     234:	0305                	.insn	2, 0x0305
     236:	1b56                	.insn	2, 0x1b56
     238:	0040                	.insn	2, 0x0040
     23a:	0000fd07          	.insn	4, 0xfd07
     23e:	0100                	.insn	2, 0x0100
     240:	0104                	.insn	2, 0x0104
     242:	0305                	.insn	2, 0x0305
     244:	1b5f 0040 9907      	.insn	6, 0x990700401b5f
     24a:	0000                	.insn	2, 0x0000
     24c:	0100                	.insn	2, 0x0100
     24e:	03050107          	.insn	4, 0x03050107
     252:	1b30                	.insn	2, 0x1b30
     254:	0040                	.insn	2, 0x0040
     256:	0000b207          	.insn	4, 0xb207
     25a:	0100                	.insn	2, 0x0100
     25c:	010e                	.insn	2, 0x010e
     25e:	0305                	.insn	2, 0x0305
     260:	1c7a                	.insn	2, 0x1c7a
     262:	0040                	.insn	2, 0x0040
     264:	0001bb07          	.insn	4, 0x0001bb07
     268:	0100                	.insn	2, 0x0100
     26a:	0305010f          	.insn	4, 0x0305010f
     26e:	00401c33          	sll	s8,zero,tp
     272:	0000b207          	.insn	4, 0xb207
     276:	0100                	.insn	2, 0x0100
     278:	0119                	.insn	2, 0x0119
     27a:	0305                	.insn	2, 0x0305
     27c:	1d58                	.insn	2, 0x1d58
     27e:	0040                	.insn	2, 0x0040
     280:	0000b207          	.insn	4, 0xb207
     284:	0100                	.insn	2, 0x0100
     286:	011a                	.insn	2, 0x011a
     288:	0305                	.insn	2, 0x0305
     28a:	1d1c                	.insn	2, 0x1d1c
     28c:	0040                	.insn	2, 0x0040
     28e:	00029c07          	.insn	4, 0x00029c07
     292:	0100                	.insn	2, 0x0100
     294:	0305011b          	.insn	4, 0x0305011b
     298:	1c99                	.insn	2, 0x1c99
     29a:	0040                	.insn	2, 0x0040
     29c:	00003f03          	.insn	4, 0x3f03
     2a0:	0400                	.insn	2, 0x0400
     2a2:	0046                	.insn	2, 0x0046
     2a4:	0000                	.insn	2, 0x0000
     2a6:	0002                	.insn	2, 0x0002
     2a8:	0002b607          	.insn	4, 0x0002b607
     2ac:	0100                	.insn	2, 0x0100
     2ae:	011f 0305 1bcc      	.insn	6, 0x1bcc0305011f
     2b4:	0040                	.insn	2, 0x0040
     2b6:	00003f03          	.insn	4, 0x3f03
     2ba:	0400                	.insn	2, 0x0400
     2bc:	0046                	.insn	2, 0x0046
     2be:	0000                	.insn	2, 0x0000
     2c0:	0015                	.insn	2, 0x0015
     2c2:	0002d007          	.insn	4, 0x0002d007
     2c6:	0100                	.insn	2, 0x0100
     2c8:	012a                	.insn	2, 0x012a
     2ca:	0305                	.insn	2, 0x0305
     2cc:	1cb6                	.insn	2, 0x1cb6
     2ce:	0040                	.insn	2, 0x0040
     2d0:	00003f03          	.insn	4, 0x3f03
     2d4:	0400                	.insn	2, 0x0400
     2d6:	0046                	.insn	2, 0x0046
     2d8:	0000                	.insn	2, 0x0000
     2da:	0004                	.insn	2, 0x0004
     2dc:	0000e407          	.insn	4, 0xe407
     2e0:	0100                	.insn	2, 0x0100
     2e2:	03050133          	mul	sp,a0,a6
     2e6:	1be1                	.insn	2, 0x1be1
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
     308:	3701                	.insn	2, 0x3701
     30a:	ea01                	.insn	2, 0xea01
     30c:	0002                	.insn	2, 0x0002
     30e:	0100                	.insn	2, 0x0100
     310:	1b0a                	.insn	2, 0x1b0a
     312:	0001                	.insn	2, 0x0001
     314:	0100                	.insn	2, 0x0100
     316:	034f0137          	lui	sp,0x34f0
     31a:	0000                	.insn	2, 0x0000
     31c:	7a0a                	.insn	2, 0x7a0a
     31e:	0000                	.insn	2, 0x0000
     320:	0100                	.insn	2, 0x0100
     322:	03590137          	lui	sp,0x3590
     326:	0000                	.insn	2, 0x0000
     328:	0000c40b          	.insn	4, 0xc40b
     32c:	0100                	.insn	2, 0x0100
     32e:	0138                	.insn	2, 0x0138
     330:	035e                	.insn	2, 0x035e
     332:	0000                	.insn	2, 0x0000
     334:	0b0c                	.insn	2, 0x0b0c
     336:	0106                	.insn	2, 0x0106
     338:	0000                	.insn	2, 0x0000
     33a:	4201                	.insn	2, 0x4201
     33c:	3f01                	.insn	2, 0x3f01
     33e:	0000                	.insn	2, 0x0000
     340:	0b00                	.insn	2, 0x0b00
     342:	0319                	.insn	2, 0x0319
     344:	0000                	.insn	2, 0x0000
     346:	4301                	.insn	2, 0x4301
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
     36e:	08e4                	.insn	2, 0x08e4
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
     398:	2729                	.insn	2, 0x2729
     39a:	0009                	.insn	2, 0x0009
     39c:	1200                	.insn	2, 0x1200
     39e:	018c9103          	lh	sp,24(s9)
     3a2:	0205                	.insn	2, 0x0205
     3a4:	0000                	.insn	2, 0x0000
     3a6:	7c01                	.insn	2, 0x7c01
     3a8:	00000933          	add	s2,zero,zero
     3ac:	1f10                	.insn	2, 0x1f10
     3ae:	0000                	.insn	2, 0x0000
     3b0:	c300                	.insn	2, 0xc300
     3b2:	0002                	.insn	2, 0x0002
     3b4:	0100                	.insn	2, 0x0100
     3b6:	ea7d                	.insn	2, 0xea7d
     3b8:	0002                	.insn	2, 0x0002
     3ba:	1000                	.insn	2, 0x1000
     3bc:	008a                	.insn	2, 0x008a
     3be:	0000                	.insn	2, 0x0000
     3c0:	0000002b          	.insn	4, 0x002b
     3c4:	2a01                	.insn	2, 0x2a01
     3c6:	02ea                	.insn	2, 0x02ea
     3c8:	0000                	.insn	2, 0x0000
     3ca:	0910                	.insn	2, 0x0910
     3cc:	0001                	.insn	2, 0x0001
     3ce:	4700                	.insn	2, 0x4700
     3d0:	0000                	.insn	2, 0x0000
     3d2:	0100                	.insn	2, 0x0100
     3d4:	3f80                	.insn	2, 0x3f80
     3d6:	0009                	.insn	2, 0x0009
     3d8:	1300                	.insn	2, 0x1300
     3da:	0071                	.insn	2, 0x0071
     3dc:	0000                	.insn	2, 0x0000
     3de:	1801                	.insn	2, 0x1801
     3e0:	0228                	.insn	2, 0x0228
     3e2:	0040                	.insn	2, 0x0040
     3e4:	a814                	.insn	2, 0xa814
     3e6:	34004007          	.insn	4, 0x34004007
     3ea:	0000                	.insn	2, 0x0000
     3ec:	1000                	.insn	2, 0x1000
     3ee:	03e0                	.insn	2, 0x03e0
     3f0:	0000                	.insn	2, 0x0000
     3f2:	0376                	.insn	2, 0x0376
     3f4:	0000                	.insn	2, 0x0000
     3f6:	e901                	.insn	2, 0xe901
     3f8:	02fc                	.insn	2, 0x02fc
     3fa:	0000                	.insn	2, 0x0000
     3fc:	1400                	.insn	2, 0x1400
     3fe:	0774                	.insn	2, 0x0774
     400:	0040                	.insn	2, 0x0040
     402:	001c                	.insn	2, 0x001c
     404:	0000                	.insn	2, 0x0000
     406:	cd10                	.insn	2, 0xcd10
     408:	76000003          	lb	zero,1888(zero) # 760 <$d.3+0x211>
     40c:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     410:	fcdf 0002 0000      	.insn	6, 0x0002fcdf
     416:	8814                	.insn	2, 0x8814
     418:	4006                	.insn	2, 0x4006
     41a:	1c00                	.insn	2, 0x1c00
     41c:	0000                	.insn	2, 0x0000
     41e:	1000                	.insn	2, 0x1000
     420:	02ed                	.insn	2, 0x02ed
     422:	0000                	.insn	2, 0x0000
     424:	003e                	.insn	2, 0x003e
     426:	0000                	.insn	2, 0x0000
     428:	d501                	.insn	2, 0xd501
     42a:	02fc                	.insn	2, 0x02fc
     42c:	0000                	.insn	2, 0x0000
     42e:	1100                	.insn	2, 0x1100
     430:	0018                	.insn	2, 0x0018
     432:	0000                	.insn	2, 0x0000
     434:	c310                	.insn	2, 0xc310
     436:	0002                	.insn	2, 0x0002
     438:	4e00                	.insn	2, 0x4e00
     43a:	0000                	.insn	2, 0x0000
     43c:	0100                	.insn	2, 0x0100
     43e:	0002f1c3          	.insn	4, 0x0002f1c3
     442:	0000                	.insn	2, 0x0000
     444:	3011                	.insn	2, 0x3011
     446:	0000                	.insn	2, 0x0000
     448:	1000                	.insn	2, 0x1000
     44a:	00000297          	auipc	t0,0x0
     44e:	0161                	.insn	2, 0x0161
     450:	0000                	.insn	2, 0x0000
     452:	b201                	.insn	2, 0xb201
     454:	02fc                	.insn	2, 0x02fc
     456:	0000                	.insn	2, 0x0000
     458:	1100                	.insn	2, 0x1100
     45a:	0048                	.insn	2, 0x0048
     45c:	0000                	.insn	2, 0x0000
     45e:	3410                	.insn	2, 0x3410
     460:	0001                	.insn	2, 0x0001
     462:	4900                	.insn	2, 0x4900
     464:	0000                	.insn	2, 0x0000
     466:	0100                	.insn	2, 0x0100
     468:	f196                	.insn	2, 0xf196
     46a:	0002                	.insn	2, 0x0002
     46c:	1000                	.insn	2, 0x1000
     46e:	018d                	.insn	2, 0x018d
     470:	0000                	.insn	2, 0x0000
     472:	0000002b          	.insn	4, 0x002b
     476:	9701                	.insn	2, 0x9701
     478:	02f1                	.insn	2, 0x02f1
     47a:	0000                	.insn	2, 0x0000
     47c:	9215                	.insn	2, 0x9215
     47e:	0002                	.insn	2, 0x0002
     480:	0100                	.insn	2, 0x0100
     482:	5e98                	.insn	2, 0x5e98
     484:	16000003          	lb	zero,352(zero) # 160 <$d.6+0x26>
     488:	00000303          	lb	t1,0(zero) # 0 <$d.4>
     48c:	0070                	.insn	2, 0x0070
     48e:	0000                	.insn	2, 0x0000
     490:	9b01                	.insn	2, 0x9b01
     492:	1715                	.insn	2, 0x1715
     494:	023e                	.insn	2, 0x023e
     496:	0000                	.insn	2, 0x0000
     498:	0310                	.insn	2, 0x0310
     49a:	0000                	.insn	2, 0x0000
     49c:	fc18                	.insn	2, 0xfc18
     49e:	0001                	.insn	2, 0x0001
     4a0:	2800                	.insn	2, 0x2800
     4a2:	11000003          	lb	zero,272(zero) # 110 <$d.10+0x9c>
     4a6:	0090                	.insn	2, 0x0090
     4a8:	0000                	.insn	2, 0x0000
     4aa:	0018                	.insn	2, 0x0018
     4ac:	35000003          	lb	zero,848(zero) # 350 <$d.6+0xc8>
     4b0:	18000003          	lb	zero,384(zero) # 180 <$d.6+0x46>
     4b4:	031e                	.insn	2, 0x031e
     4b6:	0000                	.insn	2, 0x0000
     4b8:	0341                	.insn	2, 0x0341
     4ba:	0000                	.insn	2, 0x0000
     4bc:	0000                	.insn	2, 0x0000
     4be:	0316                	.insn	2, 0x0316
     4c0:	b0000003          	lb	zero,-1280(zero) # fffffb00 <USER_MAX+0xffaffb00>
     4c4:	0000                	.insn	2, 0x0000
     4c6:	0100                	.insn	2, 0x0100
     4c8:	15a1                	.insn	2, 0x15a1
     4ca:	00036717          	auipc	a4,0x36
     4ce:	1000                	.insn	2, 0x1000
     4d0:	18000003          	lb	zero,384(zero) # 180 <$d.6+0x46>
     4d4:	0331                	.insn	2, 0x0331
     4d6:	0000                	.insn	2, 0x0000
     4d8:	0328                	.insn	2, 0x0328
     4da:	0000                	.insn	2, 0x0000
     4dc:	c811                	.insn	2, 0xc811
     4de:	0000                	.insn	2, 0x0000
     4e0:	1800                	.insn	2, 0x1800
     4e2:	000003f3          	.insn	4, 0x03f3
     4e6:	0335                	.insn	2, 0x0335
     4e8:	0000                	.insn	2, 0x0000
     4ea:	1118                	.insn	2, 0x1118
     4ec:	0004                	.insn	2, 0x0004
     4ee:	4100                	.insn	2, 0x4100
     4f0:	00000003          	lb	zero,0(zero) # 0 <$d.4>
     4f4:	0000                	.insn	2, 0x0000
     4f6:	e811                	.insn	2, 0xe811
     4f8:	0000                	.insn	2, 0x0000
     4fa:	1000                	.insn	2, 0x1000
     4fc:	00aa                	.insn	2, 0x00aa
     4fe:	0000                	.insn	2, 0x0000
     500:	03e0                	.insn	2, 0x03e0
     502:	0000                	.insn	2, 0x0000
     504:	4801                	.insn	2, 0x4801
     506:	02ea                	.insn	2, 0x02ea
     508:	0000                	.insn	2, 0x0000
     50a:	d310                	.insn	2, 0xd310
     50c:	0000                	.insn	2, 0x0000
     50e:	4400                	.insn	2, 0x4400
     510:	0000                	.insn	2, 0x0000
     512:	0100                	.insn	2, 0x0100
     514:	f134                	.insn	2, 0xf134
     516:	0002                	.insn	2, 0x0002
     518:	1000                	.insn	2, 0x1000
     51a:	00f1                	.insn	2, 0x00f1
     51c:	0000                	.insn	2, 0x0000
     51e:	020a                	.insn	2, 0x020a
     520:	0000                	.insn	2, 0x0000
     522:	3701                	.insn	2, 0x3701
     524:	091c                	.insn	2, 0x091c
     526:	0000                	.insn	2, 0x0000
     528:	a515                	.insn	2, 0xa515
     52a:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     52e:	1c36                	.insn	2, 0x1c36
     530:	0009                	.insn	2, 0x0009
     532:	0000                	.insn	2, 0x0000
     534:	1900                	.insn	2, 0x1900
     536:	0788                	.insn	2, 0x0788
     538:	0000                	.insn	2, 0x0000
     53a:	0064                	.insn	2, 0x0064
     53c:	0040                	.insn	2, 0x0040
     53e:	8819                	.insn	2, 0x8819
     540:	24000007          	.insn	4, 0x24000007
     544:	4002                	.insn	2, 0x4002
     546:	1900                	.insn	2, 0x1900
     548:	0796                	.insn	2, 0x0796
     54a:	0000                	.insn	2, 0x0000
     54c:	0234                	.insn	2, 0x0234
     54e:	0040                	.insn	2, 0x0040
     550:	9619                	.insn	2, 0x9619
     552:	40000007          	.insn	4, 0x40000007
     556:	4002                	.insn	2, 0x4002
     558:	1900                	.insn	2, 0x1900
     55a:	0796                	.insn	2, 0x0796
     55c:	0000                	.insn	2, 0x0000
     55e:	024c                	.insn	2, 0x024c
     560:	0040                	.insn	2, 0x0040
     562:	9619                	.insn	2, 0x9619
     564:	58000007          	.insn	4, 0x58000007
     568:	4002                	.insn	2, 0x4002
     56a:	1900                	.insn	2, 0x1900
     56c:	0796                	.insn	2, 0x0796
     56e:	0000                	.insn	2, 0x0000
     570:	0264                	.insn	2, 0x0264
     572:	0040                	.insn	2, 0x0040
     574:	9619                	.insn	2, 0x9619
     576:	70000007          	.insn	4, 0x70000007
     57a:	4002                	.insn	2, 0x4002
     57c:	1900                	.insn	2, 0x1900
     57e:	0796                	.insn	2, 0x0796
     580:	0000                	.insn	2, 0x0000
     582:	027c                	.insn	2, 0x027c
     584:	0040                	.insn	2, 0x0040
     586:	9619                	.insn	2, 0x9619
     588:	88000007          	.insn	4, 0x88000007
     58c:	4002                	.insn	2, 0x4002
     58e:	1900                	.insn	2, 0x1900
     590:	0796                	.insn	2, 0x0796
     592:	0000                	.insn	2, 0x0000
     594:	0294                	.insn	2, 0x0294
     596:	0040                	.insn	2, 0x0040
     598:	9619                	.insn	2, 0x9619
     59a:	a0000007          	.insn	4, 0xa0000007
     59e:	4002                	.insn	2, 0x4002
     5a0:	1900                	.insn	2, 0x1900
     5a2:	0796                	.insn	2, 0x0796
     5a4:	0000                	.insn	2, 0x0000
     5a6:	02ac                	.insn	2, 0x02ac
     5a8:	0040                	.insn	2, 0x0040
     5aa:	9619                	.insn	2, 0x9619
     5ac:	b8000007          	.insn	4, 0xb8000007
     5b0:	4002                	.insn	2, 0x4002
     5b2:	1900                	.insn	2, 0x1900
     5b4:	0796                	.insn	2, 0x0796
     5b6:	0000                	.insn	2, 0x0000
     5b8:	02c4                	.insn	2, 0x02c4
     5ba:	0040                	.insn	2, 0x0040
     5bc:	9619                	.insn	2, 0x9619
     5be:	d0000007          	.insn	4, 0xd0000007
     5c2:	4002                	.insn	2, 0x4002
     5c4:	1900                	.insn	2, 0x1900
     5c6:	0796                	.insn	2, 0x0796
     5c8:	0000                	.insn	2, 0x0000
     5ca:	02dc                	.insn	2, 0x02dc
     5cc:	0040                	.insn	2, 0x0040
     5ce:	9619                	.insn	2, 0x9619
     5d0:	e8000007          	.insn	4, 0xe8000007
     5d4:	4002                	.insn	2, 0x4002
     5d6:	1900                	.insn	2, 0x1900
     5d8:	0796                	.insn	2, 0x0796
     5da:	0000                	.insn	2, 0x0000
     5dc:	02fc                	.insn	2, 0x02fc
     5de:	0040                	.insn	2, 0x0040
     5e0:	a319                	.insn	2, 0xa319
     5e2:	10000007          	.insn	4, 0x10000007
     5e6:	19004003          	lbu	zero,400(zero) # 190 <$d.6+0x56>
     5ea:	0788                	.insn	2, 0x0788
     5ec:	0000                	.insn	2, 0x0000
     5ee:	0330                	.insn	2, 0x0330
     5f0:	0040                	.insn	2, 0x0040
     5f2:	8819                	.insn	2, 0x8819
     5f4:	50000007          	.insn	4, 0x50000007
     5f8:	19004003          	lbu	zero,400(zero) # 190 <$d.6+0x56>
     5fc:	07ae                	.insn	2, 0x07ae
     5fe:	0000                	.insn	2, 0x0000
     600:	035c                	.insn	2, 0x035c
     602:	0040                	.insn	2, 0x0040
     604:	9619                	.insn	2, 0x9619
     606:	b4000007          	.insn	4, 0xb4000007
     60a:	19004003          	lbu	zero,400(zero) # 190 <$d.6+0x56>
     60e:	0796                	.insn	2, 0x0796
     610:	0000                	.insn	2, 0x0000
     612:	03c0                	.insn	2, 0x03c0
     614:	0040                	.insn	2, 0x0040
     616:	9619                	.insn	2, 0x9619
     618:	d4000007          	.insn	4, 0xd4000007
     61c:	19004003          	lbu	zero,400(zero) # 190 <$d.6+0x56>
     620:	07b9                	.insn	2, 0x07b9
     622:	0000                	.insn	2, 0x0000
     624:	0480                	.insn	2, 0x0480
     626:	0040                	.insn	2, 0x0040
     628:	b919                	.insn	2, 0xb919
     62a:	94000007          	.insn	4, 0x94000007
     62e:	4004                	.insn	2, 0x4004
     630:	1900                	.insn	2, 0x1900
     632:	07b9                	.insn	2, 0x07b9
     634:	0000                	.insn	2, 0x0000
     636:	04a8                	.insn	2, 0x04a8
     638:	0040                	.insn	2, 0x0040
     63a:	b919                	.insn	2, 0xb919
     63c:	c0000007          	.insn	4, 0xc0000007
     640:	4004                	.insn	2, 0x4004
     642:	1900                	.insn	2, 0x1900
     644:	07b9                	.insn	2, 0x07b9
     646:	0000                	.insn	2, 0x0000
     648:	04d4                	.insn	2, 0x04d4
     64a:	0040                	.insn	2, 0x0040
     64c:	b919                	.insn	2, 0xb919
     64e:	e8000007          	.insn	4, 0xe8000007
     652:	4004                	.insn	2, 0x4004
     654:	1900                	.insn	2, 0x1900
     656:	07b9                	.insn	2, 0x07b9
     658:	0000                	.insn	2, 0x0000
     65a:	04fc                	.insn	2, 0x04fc
     65c:	0040                	.insn	2, 0x0040
     65e:	b919                	.insn	2, 0xb919
     660:	10000007          	.insn	4, 0x10000007
     664:	4005                	.insn	2, 0x4005
     666:	1900                	.insn	2, 0x1900
     668:	07b9                	.insn	2, 0x07b9
     66a:	0000                	.insn	2, 0x0000
     66c:	0524                	.insn	2, 0x0524
     66e:	0040                	.insn	2, 0x0040
     670:	b919                	.insn	2, 0xb919
     672:	38000007          	.insn	4, 0x38000007
     676:	4005                	.insn	2, 0x4005
     678:	1900                	.insn	2, 0x1900
     67a:	07b9                	.insn	2, 0x07b9
     67c:	0000                	.insn	2, 0x0000
     67e:	054c                	.insn	2, 0x054c
     680:	0040                	.insn	2, 0x0040
     682:	b919                	.insn	2, 0xb919
     684:	60000007          	.insn	4, 0x60000007
     688:	4005                	.insn	2, 0x4005
     68a:	1900                	.insn	2, 0x1900
     68c:	07b9                	.insn	2, 0x07b9
     68e:	0000                	.insn	2, 0x0000
     690:	0574                	.insn	2, 0x0574
     692:	0040                	.insn	2, 0x0040
     694:	b919                	.insn	2, 0xb919
     696:	88000007          	.insn	4, 0x88000007
     69a:	4005                	.insn	2, 0x4005
     69c:	1900                	.insn	2, 0x1900
     69e:	07b9                	.insn	2, 0x07b9
     6a0:	0000                	.insn	2, 0x0000
     6a2:	059c                	.insn	2, 0x059c
     6a4:	0040                	.insn	2, 0x0040
     6a6:	8819                	.insn	2, 0x8819
     6a8:	b0000007          	.insn	4, 0xb0000007
     6ac:	4005                	.insn	2, 0x4005
     6ae:	1900                	.insn	2, 0x1900
     6b0:	000007cf          	.insn	4, 0x07cf
     6b4:	0614                	.insn	2, 0x0614
     6b6:	0040                	.insn	2, 0x0040
     6b8:	e019                	.insn	2, 0xe019
     6ba:	38000007          	.insn	4, 0x38000007
     6be:	4006                	.insn	2, 0x4006
     6c0:	1900                	.insn	2, 0x1900
     6c2:	000007cf          	.insn	4, 0x07cf
     6c6:	065c                	.insn	2, 0x065c
     6c8:	0040                	.insn	2, 0x0040
     6ca:	f219                	.insn	2, 0xf219
     6cc:	80000007          	.insn	4, 0x80000007
     6d0:	4006                	.insn	2, 0x4006
     6d2:	1900                	.insn	2, 0x1900
     6d4:	000007cf          	.insn	4, 0x07cf
     6d8:	0698                	.insn	2, 0x0698
     6da:	0040                	.insn	2, 0x0040
     6dc:	6c19                	.insn	2, 0x6c19
     6de:	0008                	.insn	2, 0x0008
     6e0:	a000                	.insn	2, 0xa000
     6e2:	4006                	.insn	2, 0x4006
     6e4:	1900                	.insn	2, 0x1900
     6e6:	07e0                	.insn	2, 0x07e0
     6e8:	0000                	.insn	2, 0x0000
     6ea:	0718                	.insn	2, 0x0718
     6ec:	0040                	.insn	2, 0x0040
     6ee:	cf19                	.insn	2, 0xcf19
     6f0:	84000007          	.insn	4, 0x84000007
     6f4:	19004007          	.insn	4, 0x19004007
     6f8:	0879                	.insn	2, 0x0879
     6fa:	0000                	.insn	2, 0x0000
     6fc:	078c                	.insn	2, 0x078c
     6fe:	0040                	.insn	2, 0x0040
     700:	8619                	.insn	2, 0x8619
     702:	0008                	.insn	2, 0x0008
     704:	a000                	.insn	2, 0xa000
     706:	19004007          	.insn	4, 0x19004007
     70a:	000007cf          	.insn	4, 0x07cf
     70e:	07b8                	.insn	2, 0x07b8
     710:	0040                	.insn	2, 0x0040
     712:	9319                	.insn	2, 0x9319
     714:	0008                	.insn	2, 0x0008
     716:	d800                	.insn	2, 0xd800
     718:	19004007          	.insn	4, 0x19004007
     71c:	07e0                	.insn	2, 0x07e0
     71e:	0000                	.insn	2, 0x0000
     720:	0844                	.insn	2, 0x0844
     722:	0040                	.insn	2, 0x0040
     724:	a019                	.insn	2, 0xa019
     726:	0008                	.insn	2, 0x0008
     728:	5000                	.insn	2, 0x5000
     72a:	4008                	.insn	2, 0x4008
     72c:	1900                	.insn	2, 0x1900
     72e:	0788                	.insn	2, 0x0788
     730:	0000                	.insn	2, 0x0000
     732:	0864                	.insn	2, 0x0864
     734:	0040                	.insn	2, 0x0040
     736:	ab19                	.insn	2, 0xab19
     738:	0008                	.insn	2, 0x0008
     73a:	7000                	.insn	2, 0x7000
     73c:	4008                	.insn	2, 0x4008
     73e:	1900                	.insn	2, 0x1900
     740:	08b2                	.insn	2, 0x08b2
     742:	0000                	.insn	2, 0x0000
     744:	0888                	.insn	2, 0x0888
     746:	0040                	.insn	2, 0x0040
     748:	8819                	.insn	2, 0x8819
     74a:	a4000007          	.insn	4, 0xa4000007
     74e:	4008                	.insn	2, 0x4008
     750:	1900                	.insn	2, 0x1900
     752:	0788                	.insn	2, 0x0788
     754:	0000                	.insn	2, 0x0000
     756:	08b4                	.insn	2, 0x08b4
     758:	0040                	.insn	2, 0x0040
     75a:	8819                	.insn	2, 0x8819
     75c:	c4000007          	.insn	4, 0xc4000007
     760:	4008                	.insn	2, 0x4008
     762:	1900                	.insn	2, 0x1900
     764:	0788                	.insn	2, 0x0788
     766:	0000                	.insn	2, 0x0000
     768:	08d4                	.insn	2, 0x08d4
     76a:	0040                	.insn	2, 0x0040
     76c:	8819                	.insn	2, 0x8819
     76e:	e4000007          	.insn	4, 0xe4000007
     772:	4008                	.insn	2, 0x4008
     774:	1900                	.insn	2, 0x1900
     776:	0788                	.insn	2, 0x0788
     778:	0000                	.insn	2, 0x0000
     77a:	08f4                	.insn	2, 0x08f4
     77c:	0040                	.insn	2, 0x0040
     77e:	c319                	.insn	2, 0xc319
     780:	0008                	.insn	2, 0x0008
     782:	0000                	.insn	2, 0x0000
     784:	4009                	.insn	2, 0x4009
     786:	0000                	.insn	2, 0x0000
     788:	6f1a                	.insn	2, 0x6f1a
     78a:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
     78e:	1b41                	.insn	2, 0x1b41
     790:	0000034f          	.insn	4, 0x034f
     794:	001c                	.insn	2, 0x001c
     796:	c91a                	.insn	2, 0xc91a
     798:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
     79c:	003f1b33          	sll	s6,t5,gp
     7a0:	0000                	.insn	2, 0x0000
     7a2:	1d00                	.insn	2, 0x1d00
     7a4:	0350                	.insn	2, 0x0350
     7a6:	0000                	.insn	2, 0x0000
     7a8:	4002                	.insn	2, 0x4002
     7aa:	02f1                	.insn	2, 0x02f1
     7ac:	0000                	.insn	2, 0x0000
     7ae:	8b1d                	.insn	2, 0x8b1d
     7b0:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
     7b4:	ea35                	.insn	2, 0xea35
     7b6:	0002                	.insn	2, 0x0002
     7b8:	1e00                	.insn	2, 0x1e00
     7ba:	02fe                	.insn	2, 0x02fe
     7bc:	0000                	.insn	2, 0x0000
     7be:	3d02                	.insn	2, 0x3d02
     7c0:	02ea                	.insn	2, 0x02ea
     7c2:	0000                	.insn	2, 0x0000
     7c4:	00034f1b          	.insn	4, 0x00034f1b
     7c8:	1b00                	.insn	2, 0x1b00
     7ca:	0000034f          	.insn	4, 0x034f
     7ce:	1e00                	.insn	2, 0x1e00
     7d0:	03d1                	.insn	2, 0x03d1
     7d2:	0000                	.insn	2, 0x0000
     7d4:	3202                	.insn	2, 0x3202
     7d6:	02fc                	.insn	2, 0x02fc
     7d8:	0000                	.insn	2, 0x0000
     7da:	00034f1b          	.insn	4, 0x00034f1b
     7de:	0000                	.insn	2, 0x0000
     7e0:	891a                	.insn	2, 0x891a
     7e2:	0001                	.insn	2, 0x0001
     7e4:	0200                	.insn	2, 0x0200
     7e6:	1b2d                	.insn	2, 0x1b2d
     7e8:	02f1                	.insn	2, 0x02f1
     7ea:	0000                	.insn	2, 0x0000
     7ec:	0002f11b          	.insn	4, 0x0002f11b
     7f0:	0000                	.insn	2, 0x0000
     7f2:	cc1f 4009 bc00      	.insn	6, 0xbc004009cc1f
     7f8:	0000                	.insn	2, 0x0000
     7fa:	0100                	.insn	2, 0x0100
     7fc:	2052                	.insn	2, 0x2052
     7fe:	0000                	.insn	2, 0x0000
     800:	0100                	.insn	2, 0x0100
     802:	0125                	.insn	2, 0x0125
     804:	f220                	.insn	2, 0xf220
     806:	0004                	.insn	2, 0x0004
     808:	6100                	.insn	2, 0x6100
     80a:	0001                	.insn	2, 0x0001
     80c:	0100                	.insn	2, 0x0100
     80e:	0125                	.insn	2, 0x0125
     810:	02fc                	.insn	2, 0x02fc
     812:	0000                	.insn	2, 0x0000
     814:	2f21                	.insn	2, 0x2f21
     816:	0005                	.insn	2, 0x0005
     818:	3e00                	.insn	2, 0x3e00
     81a:	0000                	.insn	2, 0x0000
     81c:	0100                	.insn	2, 0x0100
     81e:	02ea0127          	.insn	4, 0x02ea0127
     822:	0000                	.insn	2, 0x0000
     824:	f014                	.insn	2, 0xf014
     826:	4009                	.insn	2, 0x4009
     828:	5400                	.insn	2, 0x5400
     82a:	0000                	.insn	2, 0x0000
     82c:	2100                	.insn	2, 0x2100
     82e:	0510                	.insn	2, 0x0510
     830:	0000                	.insn	2, 0x0000
     832:	0078                	.insn	2, 0x0078
     834:	0000                	.insn	2, 0x0000
     836:	2801                	.insn	2, 0x2801
     838:	fc01                	.insn	2, 0xfc01
     83a:	0002                	.insn	2, 0x0002
     83c:	0000                	.insn	2, 0x0000
     83e:	0b19                	.insn	2, 0x0b19
     840:	0009                	.insn	2, 0x0009
     842:	1400                	.insn	2, 0x1400
     844:	400a                	.insn	2, 0x400a
     846:	1900                	.insn	2, 0x1900
     848:	0788                	.insn	2, 0x0788
     84a:	0000                	.insn	2, 0x0000
     84c:	0a28                	.insn	2, 0x0a28
     84e:	0040                	.insn	2, 0x0040
     850:	9619                	.insn	2, 0x9619
     852:	40000007          	.insn	4, 0x40000007
     856:	400a                	.insn	2, 0x400a
     858:	1900                	.insn	2, 0x1900
     85a:	0796                	.insn	2, 0x0796
     85c:	0000                	.insn	2, 0x0000
     85e:	0a58                	.insn	2, 0x0a58
     860:	0040                	.insn	2, 0x0040
     862:	8822                	.insn	2, 0x8822
     864:	88000007          	.insn	4, 0x88000007
     868:	400a                	.insn	2, 0x400a
     86a:	0000                	.insn	2, 0x0000
     86c:	6d1a                	.insn	2, 0x6d1a
     86e:	0002                	.insn	2, 0x0002
     870:	0200                	.insn	2, 0x0200
     872:	1b29                	.insn	2, 0x1b29
     874:	02fc                	.insn	2, 0x02fc
     876:	0000                	.insn	2, 0x0000
     878:	1a00                	.insn	2, 0x1a00
     87a:	00c6                	.insn	2, 0x00c6
     87c:	0000                	.insn	2, 0x0000
     87e:	2a02                	.insn	2, 0x2a02
     880:	0002fc1b          	.insn	4, 0x0002fc1b
     884:	0000                	.insn	2, 0x0000
     886:	051a                	.insn	2, 0x051a
     888:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
     88c:	1b28                	.insn	2, 0x1b28
     88e:	02f1                	.insn	2, 0x02f1
     890:	0000                	.insn	2, 0x0000
     892:	1a00                	.insn	2, 0x1a00
     894:	0280                	.insn	2, 0x0280
     896:	0000                	.insn	2, 0x0000
     898:	2b02                	.insn	2, 0x2b02
     89a:	0002fc1b          	.insn	4, 0x0002fc1b
     89e:	0000                	.insn	2, 0x0000
     8a0:	881d                	.insn	2, 0x881d
     8a2:	0000                	.insn	2, 0x0000
     8a4:	0300                	.insn	2, 0x0300
     8a6:	ea10                	.insn	2, 0xea10
     8a8:	0002                	.insn	2, 0x0002
     8aa:	2300                	.insn	2, 0x2300
     8ac:	000d                	.insn	2, 0x000d
     8ae:	0000                	.insn	2, 0x0000
     8b0:	161e1103          	lh	sp,353(t3)
     8b4:	0000                	.insn	2, 0x0000
     8b6:	0300                	.insn	2, 0x0300
     8b8:	ea0e                	.insn	2, 0xea0e
     8ba:	0002                	.insn	2, 0x0002
     8bc:	1b00                	.insn	2, 0x1b00
     8be:	0000034f          	.insn	4, 0x034f
     8c2:	2400                	.insn	2, 0x2400
     8c4:	000003db          	.insn	4, 0x03db
     8c8:	4202                	.insn	2, 0x4202
     8ca:	0025                	.insn	2, 0x0025
     8cc:	4009                	.insn	2, 0x4009
     8ce:	cc00                	.insn	2, 0xcc00
     8d0:	0000                	.insn	2, 0x0000
     8d2:	0100                	.insn	2, 0x0100
     8d4:	0352                	.insn	2, 0x0352
     8d6:	17000003          	lb	zero,368(zero) # 170 <$d.6+0x36>
     8da:	0424                	.insn	2, 0x0424
     8dc:	0000                	.insn	2, 0x0000
     8de:	0310                	.insn	2, 0x0310
     8e0:	0000                	.insn	2, 0x0000
     8e2:	0126                	.insn	2, 0x0126
     8e4:	00031c5b          	.insn	4, 0x00031c5b
     8e8:	1800                	.insn	2, 0x1800
     8ea:	00000497          	auipc	s1,0x0
     8ee:	0328                	.insn	2, 0x0328
     8f0:	0000                	.insn	2, 0x0000
     8f2:	0011                	.insn	2, 0x0011
     8f4:	0001                	.insn	2, 0x0001
     8f6:	1800                	.insn	2, 0x1800
     8f8:	04c1                	.insn	2, 0x04c1
     8fa:	0000                	.insn	2, 0x0000
     8fc:	0335                	.insn	2, 0x0335
     8fe:	0000                	.insn	2, 0x0000
     900:	df18                	.insn	2, 0xdf18
     902:	0004                	.insn	2, 0x0004
     904:	4100                	.insn	2, 0x4100
     906:	00000003          	lb	zero,0(zero) # 0 <$d.4>
     90a:	1e00                	.insn	2, 0x1e00
     90c:	0252                	.insn	2, 0x0252
     90e:	0000                	.insn	2, 0x0000
     910:	3102                	.insn	2, 0x3102
     912:	091c                	.insn	2, 0x091c
     914:	0000                	.insn	2, 0x0000
     916:	0002fc1b          	.insn	4, 0x0002fc1b
     91a:	0000                	.insn	2, 0x0000
     91c:	ea08                	.insn	2, 0xea08
     91e:	0002                	.insn	2, 0x0002
     920:	ad00                	.insn	2, 0xad00
     922:	0000                	.insn	2, 0x0000
     924:	0200                	.insn	2, 0x0200
     926:	030e                	.insn	2, 0x030e
     928:	0000003f 00004604 	.insn	8, 0x46040000003f
     930:	2000                	.insn	2, 0x2000
     932:	0300                	.insn	2, 0x0300
     934:	0000034f          	.insn	4, 0x034f
     938:	4604                	.insn	2, 0x4604
     93a:	0000                	.insn	2, 0x0000
     93c:	0800                	.insn	2, 0x0800
     93e:	0d00                	.insn	2, 0x0d00
     940:	0000003f  	.insn	8, 0x000b03000000003f

00000945 <$d.5>:
     945:	00000b03          	lb	s6,0(zero) # 0 <$d.4>
     949:	0004                	.insn	2, 0x0004
     94b:	01f2                	.insn	2, 0x01f2
     94d:	0000                	.insn	2, 0x0000
     94f:	0104                	.insn	2, 0x0104
     951:	013a                	.insn	2, 0x013a
     953:	0000                	.insn	2, 0x0000
     955:	001d                	.insn	2, 0x001d
     957:	000000d7          	.insn	4, 0x00d7
     95b:	000008db          	.insn	4, 0x08db
     95f:	021d                	.insn	2, 0x021d
     961:	0000                	.insn	2, 0x0000
     963:	0000                	.insn	2, 0x0000
     965:	0000                	.insn	2, 0x0000
     967:	0270                	.insn	2, 0x0270
     969:	0000                	.insn	2, 0x0000
     96b:	3402                	.insn	2, 0x3402
     96d:	0000                	.insn	2, 0x0000
     96f:	0100                	.insn	2, 0x0100
     971:	0142                	.insn	2, 0x0142
     973:	0305                	.insn	2, 0x0305
     975:	1cd8                	.insn	2, 0x1cd8
     977:	0040                	.insn	2, 0x0040
     979:	00004003          	lbu	zero,0(zero) # 0 <$d.4>
     97d:	0400                	.insn	2, 0x0400
     97f:	00000047          	.insn	4, 0x0047
     983:	0011                	.insn	2, 0x0011
     985:	fc05                	.insn	2, 0xfc05
     987:	0001                	.insn	2, 0x0001
     989:	0800                	.insn	2, 0x0800
     98b:	0601                	.insn	2, 0x0601
     98d:	02e0                	.insn	2, 0x02e0
     98f:	0000                	.insn	2, 0x0000
     991:	0708                	.insn	2, 0x0708
     993:	00005a07          	.insn	4, 0x5a07
     997:	1b00                	.insn	2, 0x1b00
     999:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
     99d:	010a                	.insn	2, 0x010a
     99f:	e405                	.insn	2, 0xe405
     9a1:	0001                	.insn	2, 0x0001
     9a3:	0800                	.insn	2, 0x0800
     9a5:	0801                	.insn	2, 0x0801
     9a7:	006c                	.insn	2, 0x006c
     9a9:	0000                	.insn	2, 0x0000
     9ab:	000001a7          	.insn	4, 0x01a7
     9af:	c602                	.insn	2, 0xc602
     9b1:	b605                	.insn	2, 0xb605
     9b3:	0002                	.insn	2, 0x0002
     9b5:	0700                	.insn	2, 0x0700
     9b7:	0504                	.insn	2, 0x0504
     9b9:	0201                	.insn	2, 0x0201
     9bb:	0000                	.insn	2, 0x0000
     9bd:	0405                	.insn	2, 0x0405
     9bf:	5a09                	.insn	2, 0x5a09
     9c1:	0000                	.insn	2, 0x0000
     9c3:	0a00                	.insn	2, 0x0a00
     9c5:	0296                	.insn	2, 0x0296
     9c7:	0000                	.insn	2, 0x0000
     9c9:	3901                	.insn	2, 0x3901
     9cb:	00000073          	ecall
     9cf:	0b01                	.insn	2, 0x0b01
     9d1:	01d5                	.insn	2, 0x01d5
     9d3:	0000                	.insn	2, 0x0000
     9d5:	3901                	.insn	2, 0x3901
     9d7:	00000073          	ecall
     9db:	0003600b          	.insn	4, 0x0003600b
     9df:	0100                	.insn	2, 0x0100
     9e1:	7339                	.insn	2, 0x7339
     9e3:	0000                	.insn	2, 0x0000
     9e5:	0b00                	.insn	2, 0x0b00
     9e7:	000003e3          	beqz	zero,11ed <$d.11+0x134>
     9eb:	3901                	.insn	2, 0x3901
     9ed:	00000073          	ecall
     9f1:	00039b0b          	.insn	4, 0x00039b0b
     9f5:	0100                	.insn	2, 0x0100
     9f7:	7339                	.insn	2, 0x7339
     9f9:	0000                	.insn	2, 0x0000
     9fb:	0c00                	.insn	2, 0x0c00
     9fd:	029e                	.insn	2, 0x029e
     9ff:	0000                	.insn	2, 0x0000
     a01:	3b01                	.insn	2, 0x3b01
     a03:	00000073          	ecall
     a07:	110c                	.insn	2, 0x110c
     a09:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     a0d:	733c                	.insn	2, 0x733c
     a0f:	0000                	.insn	2, 0x0000
     a11:	0c00                	.insn	2, 0x0c00
     a13:	00b2                	.insn	2, 0x00b2
     a15:	0000                	.insn	2, 0x0000
     a17:	3d01                	.insn	2, 0x3d01
     a19:	00000073          	ecall
     a1d:	590c                	.insn	2, 0x590c
     a1f:	0000                	.insn	2, 0x0000
     a21:	0100                	.insn	2, 0x0100
     a23:	733e                	.insn	2, 0x733e
     a25:	0000                	.insn	2, 0x0000
     a27:	0000                	.insn	2, 0x0000
     a29:	880d                	.insn	2, 0x880d
     a2b:	400a                	.insn	2, 0x400a
     a2d:	1800                	.insn	2, 0x1800
     a2f:	0000                	.insn	2, 0x0000
     a31:	0100                	.insn	2, 0x0100
     a33:	db52                	.insn	2, 0xdb52
     a35:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     a39:	0e4d                	.insn	2, 0x0e4d
     a3b:	007f 0000 0a88 0040 	.insn	10, 0x001400400a880000007f
     a43:	0014 
     a45:	0000                	.insn	2, 0x0000
     a47:	5201                	.insn	2, 0x5201
     a49:	0f05                	.insn	2, 0x0f05
     a4b:	8b0d                	.insn	2, 0x8b0d
     a4d:	0000                	.insn	2, 0x0000
     a4f:	0f00                	.insn	2, 0x0f00
     a51:	9600                	.insn	2, 0x9600
     a53:	0000                	.insn	2, 0x0000
     a55:	0f00                	.insn	2, 0x0f00
     a57:	a100                	.insn	2, 0xa100
     a59:	0000                	.insn	2, 0x0000
     a5b:	0f00                	.insn	2, 0x0f00
     a5d:	ac00                	.insn	2, 0xac00
     a5f:	0000                	.insn	2, 0x0000
     a61:	1000                	.insn	2, 0x1000
     a63:	0000054f          	.insn	4, 0x054f
     a67:	000000b7          	lui	ra,0x0
     a6b:	0011                	.insn	2, 0x0011
     a6d:	00c2                	.insn	2, 0x00c2
     a6f:	0000                	.insn	2, 0x0000
     a71:	0011                	.insn	2, 0x0011
     a73:	00cd                	.insn	2, 0x00cd
     a75:	0000                	.insn	2, 0x0000
     a77:	0d11                	.insn	2, 0x0d11
     a79:	00d8                	.insn	2, 0x00d8
     a7b:	0000                	.insn	2, 0x0000
     a7d:	0000                	.insn	2, 0x0000
     a7f:	1612                	.insn	2, 0x1612
     a81:	0002                	.insn	2, 0x0002
     a83:	0100                	.insn	2, 0x0100
     a85:	019001e7          	jalr	gp,25(zero) # 19 <$d.4+0x19>
     a89:	0000                	.insn	2, 0x0000
     a8b:	1301                	.insn	2, 0x1301
     a8d:	0078                	.insn	2, 0x0078
     a8f:	0000                	.insn	2, 0x0000
     a91:	e701                	.insn	2, 0xe701
     a93:	6101                	.insn	2, 0x6101
     a95:	0000                	.insn	2, 0x0000
     a97:	1300                	.insn	2, 0x1300
     a99:	029e                	.insn	2, 0x029e
     a9b:	0000                	.insn	2, 0x0000
     a9d:	e801                	.insn	2, 0xe801
     a9f:	6101                	.insn	2, 0x6101
     aa1:	0000                	.insn	2, 0x0000
     aa3:	1300                	.insn	2, 0x1300
     aa5:	0311                	.insn	2, 0x0311
     aa7:	0000                	.insn	2, 0x0000
     aa9:	e901                	.insn	2, 0xe901
     aab:	6101                	.insn	2, 0x6101
     aad:	0000                	.insn	2, 0x0000
     aaf:	1300                	.insn	2, 0x1300
     ab1:	00b2                	.insn	2, 0x00b2
     ab3:	0000                	.insn	2, 0x0000
     ab5:	ea01                	.insn	2, 0xea01
     ab7:	6101                	.insn	2, 0x6101
     ab9:	0000                	.insn	2, 0x0000
     abb:	1300                	.insn	2, 0x1300
     abd:	02c8                	.insn	2, 0x02c8
     abf:	0000                	.insn	2, 0x0000
     ac1:	eb01                	.insn	2, 0xeb01
     ac3:	6101                	.insn	2, 0x6101
     ac5:	0000                	.insn	2, 0x0000
     ac7:	1400                	.insn	2, 0x1400
     ac9:	0165                	.insn	2, 0x0165
     acb:	0000                	.insn	2, 0x0000
     acd:	ed01                	.insn	2, 0xed01
     acf:	6101                	.insn	2, 0x6101
     ad1:	0000                	.insn	2, 0x0000
     ad3:	0000                	.insn	2, 0x0000
     ad5:	6c08                	.insn	2, 0x6c08
     ad7:	0000                	.insn	2, 0x0000
     ad9:	a700                	.insn	2, 0xa700
     adb:	0001                	.insn	2, 0x0001
     add:	0300                	.insn	2, 0x0300
     adf:	1511                	.insn	2, 0x1511
     ae1:	03c9                	.insn	2, 0x03c9
     ae3:	0000                	.insn	2, 0x0000
     ae5:	af01                	.insn	2, 0xaf01
     ae7:	0101                	.insn	2, 0x0101
     ae9:	0003e013          	ori	zero,t2,0
     aed:	0100                	.insn	2, 0x0100
     aef:	004001af          	.insn	4, 0x004001af
     af3:	0000                	.insn	2, 0x0000
     af5:	1500                	.insn	2, 0x1500
     af7:	00e2                	.insn	2, 0x00e2
     af9:	0000                	.insn	2, 0x0000
     afb:	d701                	.insn	2, 0xd701
     afd:	0101                	.insn	2, 0x0101
     aff:	0000c413          	xori	s0,ra,0
     b03:	0100                	.insn	2, 0x0100
     b05:	007301d7          	.insn	4, 0x007301d7
     b09:	0000                	.insn	2, 0x0000
     b0b:	1600                	.insn	2, 0x1600
     b0d:	0aa0                	.insn	2, 0x0aa0
     b0f:	0040                	.insn	2, 0x0040
     b11:	0304                	.insn	2, 0x0304
     b13:	0000                	.insn	2, 0x0000
     b15:	5201                	.insn	2, 0x5201
     b17:	0305                	.insn	2, 0x0305
     b19:	0000                	.insn	2, 0x0000
     b1b:	7701                	.insn	2, 0x7701
     b1d:	00056c17          	auipc	s8,0x56
     b21:	6500                	.insn	2, 0x6500
     b23:	0000                	.insn	2, 0x0000
     b25:	0100                	.insn	2, 0x0100
     b27:	00006177          	.insn	4, 0x6177
     b2b:	1800                	.insn	2, 0x1800
     b2d:	00d09103          	lh	sp,13(ra) # d <$d.4+0xd>
     b31:	005c                	.insn	2, 0x005c
     b33:	0000                	.insn	2, 0x0000
     b35:	8501                	.insn	2, 0x8501
     b37:	0ac2                	.insn	2, 0x0ac2
     b39:	0000                	.insn	2, 0x0000
     b3b:	0318                	.insn	2, 0x0318
     b3d:	c091                	.insn	2, 0xc091
     b3f:	3d00                	.insn	2, 0x3d00
     b41:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     b45:	c286                	.insn	2, 0xc286
     b47:	000a                	.insn	2, 0x000a
     b49:	1800                	.insn	2, 0x1800
     b4b:	9102                	.insn	2, 0x9102
     b4d:	2f00                	.insn	2, 0x2f00
     b4f:	0000                	.insn	2, 0x0000
     b51:	0100                	.insn	2, 0x0100
     b53:	000ad487          	.insn	4, 0x000ad487
     b57:	1900                	.insn	2, 0x1900
     b59:	0aa8                	.insn	2, 0x0aa8
     b5b:	0040                	.insn	2, 0x0040
     b5d:	0070                	.insn	2, 0x0070
     b5f:	0000                	.insn	2, 0x0000
     b61:	921a                	.insn	2, 0x921a
     b63:	0005                	.insn	2, 0x0005
     b65:	3800                	.insn	2, 0x3800
     b67:	0000                	.insn	2, 0x0000
     b69:	0100                	.insn	2, 0x0100
     b6b:	618a                	.insn	2, 0x618a
     b6d:	0000                	.insn	2, 0x0000
     b6f:	1900                	.insn	2, 0x1900
     b71:	0ac0                	.insn	2, 0x0ac0
     b73:	0040                	.insn	2, 0x0040
     b75:	0044                	.insn	2, 0x0044
     b77:	0000                	.insn	2, 0x0000
     b79:	b91a                	.insn	2, 0xb91a
     b7b:	0005                	.insn	2, 0x0005
     b7d:	b100                	.insn	2, 0xb100
     b7f:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     b83:	0000618b          	.insn	4, 0x618b
     b87:	0000                	.insn	2, 0x0000
     b89:	1b00                	.insn	2, 0x1b00
     b8b:	013a                	.insn	2, 0x013a
     b8d:	0000                	.insn	2, 0x0000
     b8f:	0120                	.insn	2, 0x0120
     b91:	0000                	.insn	2, 0x0000
     b93:	9801                	.insn	2, 0x9801
     b95:	1c05                	.insn	2, 0x1c05
     b97:	061e                	.insn	2, 0x061e
     b99:	0000                	.insn	2, 0x0000
     b9b:	00000147          	.insn	4, 0x0147
     b9f:	7f1c                	.insn	2, 0x7f1c
     ba1:	0006                	.insn	2, 0x0006
     ba3:	5300                	.insn	2, 0x5300
     ba5:	0001                	.insn	2, 0x0001
     ba7:	1c00                	.insn	2, 0x1c00
     ba9:	0661                	.insn	2, 0x0661
     bab:	0000                	.insn	2, 0x0000
     bad:	015f 0000 461c      	.insn	6, 0x461c0000015f
     bb3:	0006                	.insn	2, 0x0006
     bb5:	6b00                	.insn	2, 0x6b00
     bb7:	0001                	.insn	2, 0x0001
     bb9:	1c00                	.insn	2, 0x1c00
     bbb:	05f8                	.insn	2, 0x05f8
     bbd:	0000                	.insn	2, 0x0000
     bbf:	00000177          	.insn	4, 0x0177
     bc3:	9d10                	.insn	2, 0x9d10
     bc5:	0006                	.insn	2, 0x0006
     bc7:	8300                	.insn	2, 0x8300
     bc9:	0001                	.insn	2, 0x0001
     bcb:	0000                	.insn	2, 0x0000
     bcd:	00019b1b          	.insn	4, 0x00019b1b
     bd1:	3800                	.insn	2, 0x3800
     bd3:	0001                	.insn	2, 0x0001
     bd5:	0100                	.insn	2, 0x0100
     bd7:	05a1                	.insn	2, 0x05a1
     bd9:	b81c                	.insn	2, 0xb81c
     bdb:	0006                	.insn	2, 0x0006
     bdd:	a400                	.insn	2, 0xa400
     bdf:	0001                	.insn	2, 0x0001
     be1:	0000                	.insn	2, 0x0000
     be3:	00019b1b          	.insn	4, 0x00019b1b
     be7:	5000                	.insn	2, 0x5000
     be9:	0001                	.insn	2, 0x0001
     beb:	0100                	.insn	2, 0x0100
     bed:	05a2                	.insn	2, 0x05a2
     bef:	e21c                	.insn	2, 0xe21c
     bf1:	0006                	.insn	2, 0x0006
     bf3:	a400                	.insn	2, 0xa400
     bf5:	0001                	.insn	2, 0x0001
     bf7:	0000                	.insn	2, 0x0000
     bf9:	6419                	.insn	2, 0x6419
     bfb:	6400400b          	.insn	4, 0x6400400b
     bff:	0000                	.insn	2, 0x0000
     c01:	1a00                	.insn	2, 0x1a00
     c03:	070a                	.insn	2, 0x070a
     c05:	0000                	.insn	2, 0x0000
     c07:	0038                	.insn	2, 0x0038
     c09:	0000                	.insn	2, 0x0000
     c0b:	a301                	.insn	2, 0xa301
     c0d:	0061                	.insn	2, 0x0061
     c0f:	0000                	.insn	2, 0x0000
     c11:	7819                	.insn	2, 0x7819
     c13:	3400400b          	.insn	4, 0x3400400b
     c17:	0000                	.insn	2, 0x0000
     c19:	1a00                	.insn	2, 0x1a00
     c1b:	0731                	.insn	2, 0x0731
     c1d:	0000                	.insn	2, 0x0000
     c1f:	03b1                	.insn	2, 0x03b1
     c21:	0000                	.insn	2, 0x0000
     c23:	a401                	.insn	2, 0xa401
     c25:	0061                	.insn	2, 0x0061
     c27:	0000                	.insn	2, 0x0000
     c29:	b10e                	.insn	2, 0xb10e
     c2b:	0001                	.insn	2, 0x0001
     c2d:	8c00                	.insn	2, 0x8c00
     c2f:	0c00400b          	.insn	4, 0x0c00400b
     c33:	0000                	.insn	2, 0x0000
     c35:	0100                	.insn	2, 0x0100
     c37:	0da5                	.insn	2, 0x0da5
     c39:	011d                	.insn	2, 0x011d
     c3b:	0001ba57          	.insn	4, 0x0001ba57
     c3f:	0000                	.insn	2, 0x0000
     c41:	9b0e                	.insn	2, 0x9b0e
     c43:	0001                	.insn	2, 0x0001
     c45:	9800                	.insn	2, 0x9800
     c47:	0c00400b          	.insn	4, 0x0c00400b
     c4b:	0000                	.insn	2, 0x0000
     c4d:	0100                	.insn	2, 0x0100
     c4f:	0da6                	.insn	2, 0x0da6
     c51:	201e                	.insn	2, 0x201e
     c53:	01a4                	.insn	2, 0x01a4
     c55:	0000                	.insn	2, 0x0000
     c57:	0000                	.insn	2, 0x0000
     c59:	9b0e                	.insn	2, 0x9b0e
     c5b:	0001                	.insn	2, 0x0001
     c5d:	ac00                	.insn	2, 0xac00
     c5f:	0c00400b          	.insn	4, 0x0c00400b
     c63:	0000                	.insn	2, 0x0000
     c65:	0100                	.insn	2, 0x0100
     c67:	09a8                	.insn	2, 0x09a8
     c69:	0a1e                	.insn	2, 0x0a1e
     c6b:	01a4                	.insn	2, 0x01a4
     c6d:	0000                	.insn	2, 0x0000
     c6f:	0000                	.insn	2, 0x0000
     c71:	00019b1b          	.insn	4, 0x00019b1b
     c75:	6800                	.insn	2, 0x6800
     c77:	0001                	.insn	2, 0x0001
     c79:	0100                	.insn	2, 0x0100
     c7b:	05aa                	.insn	2, 0x05aa
     c7d:	781c                	.insn	2, 0x781c
     c7f:	a4000007          	.insn	4, 0xa4000007
     c83:	0001                	.insn	2, 0x0001
     c85:	0000                	.insn	2, 0x0000
     c87:	00019b1b          	.insn	4, 0x00019b1b
     c8b:	8000                	.insn	2, 0x8000
     c8d:	0001                	.insn	2, 0x0001
     c8f:	0100                	.insn	2, 0x0100
     c91:	05ad                	.insn	2, 0x05ad
     c93:	a01c                	.insn	2, 0xa01c
     c95:	a4000007          	.insn	4, 0xa4000007
     c99:	0001                	.insn	2, 0x0001
     c9b:	0000                	.insn	2, 0x0000
     c9d:	00019b1b          	.insn	4, 0x00019b1b
     ca1:	9800                	.insn	2, 0x9800
     ca3:	0001                	.insn	2, 0x0001
     ca5:	0100                	.insn	2, 0x0100
     ca7:	05ae                	.insn	2, 0x05ae
     ca9:	ca1c                	.insn	2, 0xca1c
     cab:	a4000007          	.insn	4, 0xa4000007
     caf:	0001                	.insn	2, 0x0001
     cb1:	0000                	.insn	2, 0x0000
     cb3:	4019                	.insn	2, 0x4019
     cb5:	400c                	.insn	2, 0x400c
     cb7:	6800                	.insn	2, 0x6800
     cb9:	0000                	.insn	2, 0x0000
     cbb:	1a00                	.insn	2, 0x1a00
     cbd:	07f2                	.insn	2, 0x07f2
     cbf:	0000                	.insn	2, 0x0000
     cc1:	0038                	.insn	2, 0x0038
     cc3:	0000                	.insn	2, 0x0000
     cc5:	af01                	.insn	2, 0xaf01
     cc7:	0061                	.insn	2, 0x0061
     cc9:	0000                	.insn	2, 0x0000
     ccb:	5819                	.insn	2, 0x5819
     ccd:	400c                	.insn	2, 0x400c
     ccf:	3400                	.insn	2, 0x3400
     cd1:	0000                	.insn	2, 0x0000
     cd3:	1a00                	.insn	2, 0x1a00
     cd5:	0819                	.insn	2, 0x0819
     cd7:	0000                	.insn	2, 0x0000
     cd9:	03b1                	.insn	2, 0x03b1
     cdb:	0000                	.insn	2, 0x0000
     cdd:	b001                	.insn	2, 0xb001
     cdf:	0061                	.insn	2, 0x0061
     ce1:	0000                	.insn	2, 0x0000
     ce3:	b10e                	.insn	2, 0xb10e
     ce5:	0001                	.insn	2, 0x0001
     ce7:	6c00                	.insn	2, 0x6c00
     ce9:	400c                	.insn	2, 0x400c
     ceb:	0c00                	.insn	2, 0x0c00
     ced:	0000                	.insn	2, 0x0000
     cef:	0100                	.insn	2, 0x0100
     cf1:	0db1                	.insn	2, 0x0db1
     cf3:	011d                	.insn	2, 0x011d
     cf5:	0001ba57          	.insn	4, 0x0001ba57
     cf9:	0000                	.insn	2, 0x0000
     cfb:	9b0e                	.insn	2, 0x9b0e
     cfd:	0001                	.insn	2, 0x0001
     cff:	7800                	.insn	2, 0x7800
     d01:	400c                	.insn	2, 0x400c
     d03:	0c00                	.insn	2, 0x0c00
     d05:	0000                	.insn	2, 0x0000
     d07:	0100                	.insn	2, 0x0100
     d09:	0db2                	.insn	2, 0x0db2
     d0b:	201e                	.insn	2, 0x201e
     d0d:	01a4                	.insn	2, 0x01a4
     d0f:	0000                	.insn	2, 0x0000
     d11:	0000                	.insn	2, 0x0000
     d13:	9b0e                	.insn	2, 0x9b0e
     d15:	0001                	.insn	2, 0x0001
     d17:	8c00                	.insn	2, 0x8c00
     d19:	400c                	.insn	2, 0x400c
     d1b:	0c00                	.insn	2, 0x0c00
     d1d:	0000                	.insn	2, 0x0000
     d1f:	0100                	.insn	2, 0x0100
     d21:	09b4                	.insn	2, 0x09b4
     d23:	0a1e                	.insn	2, 0x0a1e
     d25:	01a4                	.insn	2, 0x01a4
     d27:	0000                	.insn	2, 0x0000
     d29:	0000                	.insn	2, 0x0000
     d2b:	00019b1b          	.insn	4, 0x00019b1b
     d2f:	b000                	.insn	2, 0xb000
     d31:	0001                	.insn	2, 0x0001
     d33:	0100                	.insn	2, 0x0100
     d35:	05b6                	.insn	2, 0x05b6
     d37:	601c                	.insn	2, 0x601c
     d39:	0008                	.insn	2, 0x0008
     d3b:	a400                	.insn	2, 0xa400
     d3d:	0001                	.insn	2, 0x0001
     d3f:	0000                	.insn	2, 0x0000
     d41:	00019b1b          	.insn	4, 0x00019b1b
     d45:	c800                	.insn	2, 0xc800
     d47:	0001                	.insn	2, 0x0001
     d49:	0100                	.insn	2, 0x0100
     d4b:	05b9                	.insn	2, 0x05b9
     d4d:	881c                	.insn	2, 0x881c
     d4f:	0008                	.insn	2, 0x0008
     d51:	a400                	.insn	2, 0xa400
     d53:	0001                	.insn	2, 0x0001
     d55:	0000                	.insn	2, 0x0000
     d57:	00019b1b          	.insn	4, 0x00019b1b
     d5b:	e000                	.insn	2, 0xe000
     d5d:	0001                	.insn	2, 0x0001
     d5f:	0100                	.insn	2, 0x0100
     d61:	05ba                	.insn	2, 0x05ba
     d63:	b21c                	.insn	2, 0xb21c
     d65:	0008                	.insn	2, 0x0008
     d67:	a400                	.insn	2, 0xa400
     d69:	0001                	.insn	2, 0x0001
     d6b:	0000                	.insn	2, 0x0000
     d6d:	3019                	.insn	2, 0x3019
     d6f:	400d                	.insn	2, 0x400d
     d71:	5c00                	.insn	2, 0x5c00
     d73:	0000                	.insn	2, 0x0000
     d75:	1a00                	.insn	2, 0x1a00
     d77:	08da                	.insn	2, 0x08da
     d79:	0000                	.insn	2, 0x0000
     d7b:	0038                	.insn	2, 0x0038
     d7d:	0000                	.insn	2, 0x0000
     d7f:	bb01                	.insn	2, 0xbb01
     d81:	0061                	.insn	2, 0x0061
     d83:	0000                	.insn	2, 0x0000
     d85:	4c19                	.insn	2, 0x4c19
     d87:	400d                	.insn	2, 0x400d
     d89:	2800                	.insn	2, 0x2800
     d8b:	0000                	.insn	2, 0x0000
     d8d:	1a00                	.insn	2, 0x1a00
     d8f:	0901                	.insn	2, 0x0901
     d91:	0000                	.insn	2, 0x0000
     d93:	03b1                	.insn	2, 0x03b1
     d95:	0000                	.insn	2, 0x0000
     d97:	bc01                	.insn	2, 0xbc01
     d99:	0061                	.insn	2, 0x0061
     d9b:	0000                	.insn	2, 0x0000
     d9d:	b10e                	.insn	2, 0xb10e
     d9f:	0001                	.insn	2, 0x0001
     da1:	5000                	.insn	2, 0x5000
     da3:	400d                	.insn	2, 0x400d
     da5:	0c00                	.insn	2, 0x0c00
     da7:	0000                	.insn	2, 0x0000
     da9:	0100                	.insn	2, 0x0100
     dab:	0dbd                	.insn	2, 0x0dbd
     dad:	011d                	.insn	2, 0x011d
     daf:	ba56                	.insn	2, 0xba56
     db1:	0001                	.insn	2, 0x0001
     db3:	0000                	.insn	2, 0x0000
     db5:	9b0e                	.insn	2, 0x9b0e
     db7:	0001                	.insn	2, 0x0001
     db9:	5c00                	.insn	2, 0x5c00
     dbb:	400d                	.insn	2, 0x400d
     dbd:	0c00                	.insn	2, 0x0c00
     dbf:	0000                	.insn	2, 0x0000
     dc1:	0100                	.insn	2, 0x0100
     dc3:	0dbe                	.insn	2, 0x0dbe
     dc5:	201e                	.insn	2, 0x201e
     dc7:	01a4                	.insn	2, 0x01a4
     dc9:	0000                	.insn	2, 0x0000
     dcb:	0000                	.insn	2, 0x0000
     dcd:	9b0e                	.insn	2, 0x9b0e
     dcf:	0001                	.insn	2, 0x0001
     dd1:	7400                	.insn	2, 0x7400
     dd3:	400d                	.insn	2, 0x400d
     dd5:	0c00                	.insn	2, 0x0c00
     dd7:	0000                	.insn	2, 0x0000
     dd9:	0100                	.insn	2, 0x0100
     ddb:	09c0                	.insn	2, 0x09c0
     ddd:	0a1e                	.insn	2, 0x0a1e
     ddf:	01a4                	.insn	2, 0x01a4
     de1:	0000                	.insn	2, 0x0000
     de3:	0000                	.insn	2, 0x0000
     de5:	9b0e                	.insn	2, 0x9b0e
     de7:	0001                	.insn	2, 0x0001
     de9:	9000                	.insn	2, 0x9000
     deb:	400d                	.insn	2, 0x400d
     ded:	0c00                	.insn	2, 0x0c00
     def:	0000                	.insn	2, 0x0000
     df1:	0100                	.insn	2, 0x0100
     df3:	05c2                	.insn	2, 0x05c2
     df5:	0a1e                	.insn	2, 0x0a1e
     df7:	01a4                	.insn	2, 0x01a4
     df9:	0000                	.insn	2, 0x0000
     dfb:	0000                	.insn	2, 0x0000
     dfd:	a41f 400d 1400      	.insn	6, 0x1400400da41f
     e03:	0000                	.insn	2, 0x0000
     e05:	0100                	.insn	2, 0x0100
     e07:	9b52                	.insn	2, 0x9b52
     e09:	0001                	.insn	2, 0x0001
     e0b:	1c00                	.insn	2, 0x1c00
     e0d:	093a                	.insn	2, 0x093a
     e0f:	0000                	.insn	2, 0x0000
     e11:	01a4                	.insn	2, 0x01a4
     e13:	0000                	.insn	2, 0x0000
     e15:	1f00                	.insn	2, 0x1f00
     e17:	0db8                	.insn	2, 0x0db8
     e19:	0040                	.insn	2, 0x0040
     e1b:	0014                	.insn	2, 0x0014
     e1d:	0000                	.insn	2, 0x0000
     e1f:	5201                	.insn	2, 0x5201
     e21:	01b1                	.insn	2, 0x01b1
     e23:	0000                	.insn	2, 0x0000
     e25:	601c                	.insn	2, 0x601c
     e27:	0009                	.insn	2, 0x0009
     e29:	ba00                	.insn	2, 0xba00
     e2b:	0001                	.insn	2, 0x0001
     e2d:	0000                	.insn	2, 0x0000
     e2f:	1012                	.insn	2, 0x1012
     e31:	0001                	.insn	2, 0x0001
     e33:	0100                	.insn	2, 0x0100
     e35:	01fe                	.insn	2, 0x01fe
     e37:	0190                	.insn	2, 0x0190
     e39:	0000                	.insn	2, 0x0000
     e3b:	1301                	.insn	2, 0x1301
     e3d:	01d5                	.insn	2, 0x01d5
     e3f:	0000                	.insn	2, 0x0000
     e41:	fe01                	.insn	2, 0xfe01
     e43:	6101                	.insn	2, 0x6101
     e45:	0000                	.insn	2, 0x0000
     e47:	1300                	.insn	2, 0x1300
     e49:	0360                	.insn	2, 0x0360
     e4b:	0000                	.insn	2, 0x0000
     e4d:	fe01                	.insn	2, 0xfe01
     e4f:	6101                	.insn	2, 0x6101
     e51:	0000                	.insn	2, 0x0000
     e53:	1400                	.insn	2, 0x1400
     e55:	029e                	.insn	2, 0x029e
     e57:	0000                	.insn	2, 0x0000
     e59:	0001                	.insn	2, 0x0001
     e5b:	6102                	.insn	2, 0x6102
     e5d:	0000                	.insn	2, 0x0000
     e5f:	1400                	.insn	2, 0x1400
     e61:	0059                	.insn	2, 0x0059
     e63:	0000                	.insn	2, 0x0000
     e65:	0101                	.insn	2, 0x0101
     e67:	6102                	.insn	2, 0x6102
     e69:	0000                	.insn	2, 0x0000
     e6b:	0000                	.insn	2, 0x0000
     e6d:	cc16                	.insn	2, 0xcc16
     e6f:	400d                	.insn	2, 0x400d
     e71:	0c00                	.insn	2, 0x0c00
     e73:	0000                	.insn	2, 0x0000
     e75:	0100                	.insn	2, 0x0100
     e77:	6d52                	.insn	2, 0x6d52
     e79:	0002                	.insn	2, 0x0002
     e7b:	0100                	.insn	2, 0x0100
     e7d:	098617c7          	.insn	4, 0x098617c7
     e81:	0000                	.insn	2, 0x0000
     e83:	003e                	.insn	2, 0x003e
     e85:	0000                	.insn	2, 0x0000
     e87:	c701                	.insn	2, 0xc701
     e89:	006c                	.insn	2, 0x006c
     e8b:	0000                	.insn	2, 0x0000
     e8d:	ea0e                	.insn	2, 0xea0e
     e8f:	0004                	.insn	2, 0x0004
     e91:	cc00                	.insn	2, 0xcc00
     e93:	400d                	.insn	2, 0x400d
     e95:	0800                	.insn	2, 0x0800
     e97:	0000                	.insn	2, 0x0000
     e99:	0100                	.insn	2, 0x0100
     e9b:	05ca                	.insn	2, 0x05ca
     e9d:	051e                	.insn	2, 0x051e
     e9f:	000004f7          	.insn	4, 0x04f7
     ea3:	011d                	.insn	2, 0x011d
     ea5:	035a                	.insn	2, 0x035a
     ea7:	0005                	.insn	2, 0x0005
     ea9:	2000                	.insn	2, 0x2000
     eab:	5a01                	.insn	2, 0x5a01
     ead:	0000050f          	.insn	4, 0x050f
     eb1:	0521                	.insn	2, 0x0521
     eb3:	0000051b          	.insn	4, 0x051b
     eb7:	0000                	.insn	2, 0x0000
     eb9:	0012                	.insn	2, 0x0012
     ebb:	0000                	.insn	2, 0x0000
     ebd:	0100                	.insn	2, 0x0100
     ebf:	020e                	.insn	2, 0x020e
     ec1:	0190                	.insn	2, 0x0190
     ec3:	0000                	.insn	2, 0x0000
     ec5:	1301                	.insn	2, 0x1301
     ec7:	01d5                	.insn	2, 0x01d5
     ec9:	0000                	.insn	2, 0x0000
     ecb:	0e01                	.insn	2, 0x0e01
     ecd:	6102                	.insn	2, 0x6102
     ecf:	0000                	.insn	2, 0x0000
     ed1:	1300                	.insn	2, 0x1300
     ed3:	0360                	.insn	2, 0x0360
     ed5:	0000                	.insn	2, 0x0000
     ed7:	0e01                	.insn	2, 0x0e01
     ed9:	6102                	.insn	2, 0x6102
     edb:	0000                	.insn	2, 0x0000
     edd:	1400                	.insn	2, 0x1400
     edf:	029e                	.insn	2, 0x029e
     ee1:	0000                	.insn	2, 0x0000
     ee3:	1001                	.insn	2, 0x1001
     ee5:	6102                	.insn	2, 0x6102
     ee7:	0000                	.insn	2, 0x0000
     ee9:	1400                	.insn	2, 0x1400
     eeb:	0059                	.insn	2, 0x0059
     eed:	0000                	.insn	2, 0x0000
     eef:	1101                	.insn	2, 0x1101
     ef1:	6102                	.insn	2, 0x6102
     ef3:	0000                	.insn	2, 0x0000
     ef5:	0000                	.insn	2, 0x0000
     ef7:	d816                	.insn	2, 0xd816
     ef9:	400d                	.insn	2, 0x400d
     efb:	0c00                	.insn	2, 0x0c00
     efd:	0000                	.insn	2, 0x0000
     eff:	0100                	.insn	2, 0x0100
     f01:	c652                	.insn	2, 0xc652
     f03:	0000                	.insn	2, 0x0000
     f05:	0100                	.insn	2, 0x0100
     f07:	17d2                	.insn	2, 0x17d2
     f09:	09a1                	.insn	2, 0x09a1
     f0b:	0000                	.insn	2, 0x0000
     f0d:	0380                	.insn	2, 0x0380
     f0f:	0000                	.insn	2, 0x0000
     f11:	d201                	.insn	2, 0xd201
     f13:	006c                	.insn	2, 0x006c
     f15:	0000                	.insn	2, 0x0000
     f17:	740e                	.insn	2, 0x740e
     f19:	0005                	.insn	2, 0x0005
     f1b:	d800                	.insn	2, 0xd800
     f1d:	400d                	.insn	2, 0x400d
     f1f:	0800                	.insn	2, 0x0800
     f21:	0000                	.insn	2, 0x0000
     f23:	0100                	.insn	2, 0x0100
     f25:	05d5                	.insn	2, 0x05d5
     f27:	061e                	.insn	2, 0x061e
     f29:	0581                	.insn	2, 0x0581
     f2b:	0000                	.insn	2, 0x0000
     f2d:	011d                	.insn	2, 0x011d
     f2f:	8d5a                	.insn	2, 0x8d5a
     f31:	0005                	.insn	2, 0x0005
     f33:	2000                	.insn	2, 0x2000
     f35:	5a01                	.insn	2, 0x5a01
     f37:	0599                	.insn	2, 0x0599
     f39:	0000                	.insn	2, 0x0000
     f3b:	0621                	.insn	2, 0x0621
     f3d:	05a5                	.insn	2, 0x05a5
     f3f:	0000                	.insn	2, 0x0000
     f41:	0000                	.insn	2, 0x0000
     f43:	e416                	.insn	2, 0xe416
     f45:	400d                	.insn	2, 0x400d
     f47:	0c00                	.insn	2, 0x0c00
     f49:	0000                	.insn	2, 0x0000
     f4b:	0100                	.insn	2, 0x0100
     f4d:	8052                	.insn	2, 0x8052
     f4f:	0002                	.insn	2, 0x0002
     f51:	0100                	.insn	2, 0x0100
     f53:	17dd                	.insn	2, 0x17dd
     f55:	09bc                	.insn	2, 0x09bc
     f57:	0000                	.insn	2, 0x0000
     f59:	0380                	.insn	2, 0x0380
     f5b:	0000                	.insn	2, 0x0000
     f5d:	dd01                	.insn	2, 0xdd01
     f5f:	006c                	.insn	2, 0x006c
     f61:	0000                	.insn	2, 0x0000
     f63:	740e                	.insn	2, 0x740e
     f65:	0005                	.insn	2, 0x0005
     f67:	e400                	.insn	2, 0xe400
     f69:	400d                	.insn	2, 0x400d
     f6b:	0800                	.insn	2, 0x0800
     f6d:	0000                	.insn	2, 0x0000
     f6f:	0100                	.insn	2, 0x0100
     f71:	05e1                	.insn	2, 0x05e1
     f73:	061e                	.insn	2, 0x061e
     f75:	0581                	.insn	2, 0x0581
     f77:	0000                	.insn	2, 0x0000
     f79:	011d                	.insn	2, 0x011d
     f7b:	8d5a                	.insn	2, 0x8d5a
     f7d:	0005                	.insn	2, 0x0005
     f7f:	2000                	.insn	2, 0x2000
     f81:	5a01                	.insn	2, 0x5a01
     f83:	0599                	.insn	2, 0x0599
     f85:	0000                	.insn	2, 0x0000
     f87:	0621                	.insn	2, 0x0621
     f89:	05a5                	.insn	2, 0x05a5
     f8b:	0000                	.insn	2, 0x0000
     f8d:	0000                	.insn	2, 0x0000
     f8f:	ec22                	.insn	2, 0xec22
     f91:	0000                	.insn	2, 0x0000
     f93:	0100                	.insn	2, 0x0100
     f95:	022e                	.insn	2, 0x022e
     f97:	1301                	.insn	2, 0x1301
     f99:	01d5                	.insn	2, 0x01d5
     f9b:	0000                	.insn	2, 0x0000
     f9d:	2e01                	.insn	2, 0x2e01
     f9f:	6102                	.insn	2, 0x6102
     fa1:	0000                	.insn	2, 0x0000
     fa3:	1300                	.insn	2, 0x1300
     fa5:	0360                	.insn	2, 0x0360
     fa7:	0000                	.insn	2, 0x0000
     fa9:	2f01                	.insn	2, 0x2f01
     fab:	6102                	.insn	2, 0x6102
     fad:	0000                	.insn	2, 0x0000
     faf:	1300                	.insn	2, 0x1300
     fb1:	000003e3          	beqz	zero,17b7 <$d.5+0x36b>
     fb5:	3001                	.insn	2, 0x3001
     fb7:	6102                	.insn	2, 0x6102
     fb9:	0000                	.insn	2, 0x0000
     fbb:	1400                	.insn	2, 0x1400
     fbd:	029e                	.insn	2, 0x029e
     fbf:	0000                	.insn	2, 0x0000
     fc1:	3201                	.insn	2, 0x3201
     fc3:	6102                	.insn	2, 0x6102
     fc5:	0000                	.insn	2, 0x0000
     fc7:	1400                	.insn	2, 0x1400
     fc9:	0311                	.insn	2, 0x0311
     fcb:	0000                	.insn	2, 0x0000
     fcd:	3301                	.insn	2, 0x3301
     fcf:	6102                	.insn	2, 0x6102
     fd1:	0000                	.insn	2, 0x0000
     fd3:	1400                	.insn	2, 0x1400
     fd5:	0059                	.insn	2, 0x0059
     fd7:	0000                	.insn	2, 0x0000
     fd9:	3401                	.insn	2, 0x3401
     fdb:	6102                	.insn	2, 0x6102
     fdd:	0000                	.insn	2, 0x0000
     fdf:	0000                	.insn	2, 0x0000
     fe1:	f016                	.insn	2, 0xf016
     fe3:	400d                	.insn	2, 0x400d
     fe5:	0c00                	.insn	2, 0x0c00
     fe7:	0000                	.insn	2, 0x0000
     fe9:	0100                	.insn	2, 0x0100
     feb:	8952                	.insn	2, 0x8952
     fed:	0001                	.insn	2, 0x0001
     fef:	0100                	.insn	2, 0x0100
     ff1:	23e9                	.insn	2, 0x23e9
     ff3:	5a01                	.insn	2, 0x5a01
     ff5:	0049                	.insn	2, 0x0049
     ff7:	0000                	.insn	2, 0x0000
     ff9:	e901                	.insn	2, 0xe901
     ffb:	0061                	.insn	2, 0x0061
     ffd:	0000                	.insn	2, 0x0000
     fff:	2b5b0123          	sb	s5,674(s6)
    1003:	0000                	.insn	2, 0x0000
    1005:	0100                	.insn	2, 0x0100
    1007:	61e9                	.insn	2, 0x61e9
    1009:	0000                	.insn	2, 0x0000
    100b:	0e00                	.insn	2, 0x0e00
    100d:	064a                	.insn	2, 0x064a
    100f:	0000                	.insn	2, 0x0000
    1011:	0df0                	.insn	2, 0x0df0
    1013:	0040                	.insn	2, 0x0040
    1015:	0008                	.insn	2, 0x0008
    1017:	0000                	.insn	2, 0x0000
    1019:	ec01                	.insn	2, 0xec01
    101b:	1e05                	.insn	2, 0x1e05
    101d:	5309                	.insn	2, 0x5309
    101f:	0006                	.insn	2, 0x0006
    1021:	1d00                	.insn	2, 0x1d00
    1023:	5a01                	.insn	2, 0x5a01
    1025:	065f 0000 011d      	.insn	6, 0x011d0000065f
    102b:	00066b5b          	.insn	4, 0x00066b5b
    102f:	2000                	.insn	2, 0x2000
    1031:	5a01                	.insn	2, 0x5a01
    1033:	00000677          	.insn	4, 0x0677
    1037:	0120                	.insn	2, 0x0120
    1039:	0006835b          	.insn	4, 0x0006835b
    103d:	2100                	.insn	2, 0x2100
    103f:	8f09                	.insn	2, 0x8f09
    1041:	0006                	.insn	2, 0x0006
    1043:	0000                	.insn	2, 0x0000
    1045:	2400                	.insn	2, 0x2400
    1047:	0dfc                	.insn	2, 0x0dfc
    1049:	0040                	.insn	2, 0x0040
    104b:	0034                	.insn	2, 0x0034
    104d:	0000                	.insn	2, 0x0000
    104f:	5201                	.insn	2, 0x5201
    1051:	0169                	.insn	2, 0x0169
    1053:	0000                	.insn	2, 0x0000
    1055:	f401                	.insn	2, 0xf401
    1057:	0ab2                	.insn	2, 0x0ab2
    1059:	0000                	.insn	2, 0x0000
    105b:	3a5a0123          	sb	t0,930(s4)
    105f:	0000                	.insn	2, 0x0000
    1061:	0100                	.insn	2, 0x0100
    1063:	b2f4                	.insn	2, 0xb2f4
    1065:	000a                	.insn	2, 0x000a
    1067:	1700                	.insn	2, 0x1700
    1069:	000009d7          	.insn	4, 0x09d7
    106d:	000001db          	.insn	4, 0x01db
    1071:	f401                	.insn	2, 0xf401
    1073:	0ae6                	.insn	2, 0x0ae6
    1075:	0000                	.insn	2, 0x0000
    1077:	fd1a                	.insn	2, 0xfd1a
    1079:	0009                	.insn	2, 0x0009
    107b:	1900                	.insn	2, 0x1900
    107d:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1081:	b2f5                	.insn	2, 0xb2f5
    1083:	000a                	.insn	2, 0x000a
    1085:	0000                	.insn	2, 0x0000
    1087:	3024                	.insn	2, 0x3024
    1089:	400e                	.insn	2, 0x400e
    108b:	4000                	.insn	2, 0x4000
    108d:	0000                	.insn	2, 0x0000
    108f:	0100                	.insn	2, 0x0100
    1091:	fe52                	.insn	2, 0xfe52
    1093:	0002                	.insn	2, 0x0002
    1095:	0100                	.insn	2, 0x0100
    1097:	73fc                	.insn	2, 0x73fc
    1099:	0000                	.insn	2, 0x0000
    109b:	1700                	.insn	2, 0x1700
    109d:	0a2e                	.insn	2, 0x0a2e
    109f:	0000                	.insn	2, 0x0000
    10a1:	0118                	.insn	2, 0x0118
    10a3:	0000                	.insn	2, 0x0000
    10a5:	fc01                	.insn	2, 0xfc01
    10a7:	0ae6                	.insn	2, 0x0ae6
    10a9:	0000                	.insn	2, 0x0000
    10ab:	000a6c17          	auipc	s8,0xa6
    10af:	cb00                	.insn	2, 0xcb00
    10b1:	0002                	.insn	2, 0x0002
    10b3:	0100                	.insn	2, 0x0100
    10b5:	e6fc                	.insn	2, 0xe6fc
    10b7:	000a                	.insn	2, 0x000a
    10b9:	0000                	.insn	2, 0x0000
    10bb:	7025                	.insn	2, 0x7025
    10bd:	400e                	.insn	2, 0x400e
    10bf:	bc00                	.insn	2, 0xbc00
    10c1:	0002                	.insn	2, 0x0002
    10c3:	0100                	.insn	2, 0x0100
    10c5:	6f52                	.insn	2, 0x6f52
    10c7:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    10cb:	87260107          	.insn	4, 0x87260107
    10cf:	000a                	.insn	2, 0x000a
    10d1:	8700                	.insn	2, 0x8700
    10d3:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    10d7:	0ae60107          	.insn	4, 0x0ae60107
    10db:	0000                	.insn	2, 0x0000
    10dd:	18910227          	.insn	4, 0x18910227
    10e1:	03e8                	.insn	2, 0x03e8
    10e3:	0000                	.insn	2, 0x0000
    10e5:	0801                	.insn	2, 0x0801
    10e7:	f001                	.insn	2, 0xf001
    10e9:	000a                	.insn	2, 0x000a
    10eb:	2800                	.insn	2, 0x2800
    10ed:	0346                	.insn	2, 0x0346
    10ef:	0000                	.insn	2, 0x0000
    10f1:	4d01                	.insn	2, 0x4d01
    10f3:	1001                	.insn	2, 0x1001
    10f5:	4011                	.insn	2, 0x4011
    10f7:	2900                	.insn	2, 0x2900
    10f9:	01f8                	.insn	2, 0x01f8
    10fb:	0000                	.insn	2, 0x0000
    10fd:	0d910227          	.insn	4, 0x0d910227
    1101:	00b5                	.insn	2, 0x00b5
    1103:	0000                	.insn	2, 0x0000
    1105:	2a01                	.insn	2, 0x2a01
    1107:	fa01                	.insn	2, 0xfa01
    1109:	000a                	.insn	2, 0x000a
    110b:	2a00                	.insn	2, 0x2a00
    110d:	0aad                	.insn	2, 0x0aad
    110f:	0000                	.insn	2, 0x0000
    1111:	027a                	.insn	2, 0x027a
    1113:	0000                	.insn	2, 0x0000
    1115:	1e01                	.insn	2, 0x1e01
    1117:	7301                	.insn	2, 0x7301
    1119:	0000                	.insn	2, 0x0000
    111b:	2a00                	.insn	2, 0x2a00
    111d:	00000ad3          	.insn	4, 0x0ad3
    1121:	000003b3          	add	t2,zero,zero
    1125:	2001                	.insn	2, 0x2001
    1127:	6c01                	.insn	2, 0x6c01
    1129:	0000                	.insn	2, 0x0000
    112b:	2a00                	.insn	2, 0x2a00
    112d:	00000b0f          	.insn	4, 0x0b0f
    1131:	0038                	.insn	2, 0x0038
    1133:	0000                	.insn	2, 0x0000
    1135:	2b01                	.insn	2, 0x2b01
    1137:	7301                	.insn	2, 0x7301
    1139:	0000                	.insn	2, 0x0000
    113b:	2b00                	.insn	2, 0x2b00
    113d:	0000019b          	.insn	4, 0x019b
    1141:	0f44                	.insn	2, 0x0f44
    1143:	0040                	.insn	2, 0x0040
    1145:	000c                	.insn	2, 0x000c
    1147:	0000                	.insn	2, 0x0000
    1149:	2f01                	.insn	2, 0x2f01
    114b:	1901                	.insn	2, 0x1901
    114d:	301e                	.insn	2, 0x301e
    114f:	01a4                	.insn	2, 0x01a4
    1151:	0000                	.insn	2, 0x0000
    1153:	2b00                	.insn	2, 0x2b00
    1155:	0000019b          	.insn	4, 0x019b
    1159:	109c                	.insn	2, 0x109c
    115b:	0040                	.insn	2, 0x0040
    115d:	000c                	.insn	2, 0x000c
    115f:	0000                	.insn	2, 0x0000
    1161:	2201                	.insn	2, 0x2201
    1163:	1901                	.insn	2, 0x1901
    1165:	2d1e                	.insn	2, 0x2d1e
    1167:	01a4                	.insn	2, 0x01a4
    1169:	0000                	.insn	2, 0x0000
    116b:	2c00                	.insn	2, 0x2c00
    116d:	0000019b          	.insn	4, 0x019b
    1171:	10e4                	.insn	2, 0x10e4
    1173:	0040                	.insn	2, 0x0040
    1175:	000c                	.insn	2, 0x000c
    1177:	0000                	.insn	2, 0x0000
    1179:	3a01                	.insn	2, 0x3a01
    117b:	1901                	.insn	2, 0x1901
    117d:	1900                	.insn	2, 0x1900
    117f:	0f60                	.insn	2, 0x0f60
    1181:	0040                	.insn	2, 0x0040
    1183:	00e8                	.insn	2, 0x00e8
    1185:	0000                	.insn	2, 0x0000
    1187:	d42a                	.insn	2, 0xd42a
    1189:	7a00000b          	.insn	4, 0x7a00000b
    118d:	0002                	.insn	2, 0x0002
    118f:	0100                	.insn	2, 0x0100
    1191:	006c013f 70190000 	.insn	8, 0x70190000006c013f
    1199:	d800400f          	.insn	4, 0xd800400f
    119d:	0000                	.insn	2, 0x0000
    119f:	2a00                	.insn	2, 0x2a00
    11a1:	00000b4f          	.insn	4, 0x0b4f
    11a5:	0038                	.insn	2, 0x0038
    11a7:	0000                	.insn	2, 0x0000
    11a9:	4001                	.insn	2, 0x4001
    11ab:	7301                	.insn	2, 0x7301
    11ad:	0000                	.insn	2, 0x0000
    11af:	1900                	.insn	2, 0x1900
    11b1:	0f70                	.insn	2, 0x0f70
    11b3:	0040                	.insn	2, 0x0040
    11b5:	00d8                	.insn	2, 0x00d8
    11b7:	0000                	.insn	2, 0x0000
    11b9:	ef2a                	.insn	2, 0xef2a
    11bb:	2a00000b          	.insn	4, 0x2a00000b
    11bf:	0001                	.insn	2, 0x0001
    11c1:	0100                	.insn	2, 0x0100
    11c3:	0141                	.insn	2, 0x0141
    11c5:	006c                	.insn	2, 0x006c
    11c7:	0000                	.insn	2, 0x0000
    11c9:	9b2d                	.insn	2, 0x9b2d
    11cb:	0001                	.insn	2, 0x0001
    11cd:	1000                	.insn	2, 0x1000
    11cf:	0002                	.insn	2, 0x0002
    11d1:	0100                	.insn	2, 0x0100
    11d3:	0142                	.insn	2, 0x0142
    11d5:	0019                	.insn	2, 0x0019
    11d7:	0000                	.insn	2, 0x0000
    11d9:	00019b2b          	.insn	4, 0x00019b2b
    11dd:	5000                	.insn	2, 0x5000
    11df:	4010                	.insn	2, 0x4010
    11e1:	0c00                	.insn	2, 0x0c00
    11e3:	0000                	.insn	2, 0x0000
    11e5:	0100                	.insn	2, 0x0100
    11e7:	1e150113          	addi	sp,a0,481 # 1e1 <$d.10+0x19>
    11eb:	a425                	.insn	2, 0xa425
    11ed:	0001                	.insn	2, 0x0001
    11ef:	0000                	.insn	2, 0x0000
    11f1:	6419                	.insn	2, 0x6419
    11f3:	4010                	.insn	2, 0x4010
    11f5:	3800                	.insn	2, 0x3800
    11f7:	0000                	.insn	2, 0x0000
    11f9:	2a00                	.insn	2, 0x2a00
    11fb:	00000c57          	.insn	4, 0x0c57
    11ff:	0000011b          	.insn	4, 0x011b
    1203:	1601                	.insn	2, 0x1601
    1205:	e601                	.insn	2, 0xe601
    1207:	000a                	.insn	2, 0x000a
    1209:	2b00                	.insn	2, 0x2b00
    120b:	0000019b          	.insn	4, 0x019b
    120f:	1080                	.insn	2, 0x1080
    1211:	0040                	.insn	2, 0x0040
    1213:	000c                	.insn	2, 0x000c
    1215:	0000                	.insn	2, 0x0000
    1217:	1801                	.insn	2, 0x1801
    1219:	1901                	.insn	2, 0x1901
    121b:	011d                	.insn	2, 0x011d
    121d:	a459                	.insn	2, 0xa459
    121f:	0001                	.insn	2, 0x0001
    1221:	0000                	.insn	2, 0x0000
    1223:	2b00                	.insn	2, 0x2b00
    1225:	0000019b          	.insn	4, 0x019b
    1229:	1104                	.insn	2, 0x1104
    122b:	0040                	.insn	2, 0x0040
    122d:	000c                	.insn	2, 0x000c
    122f:	0000                	.insn	2, 0x0000
    1231:	1001                	.insn	2, 0x1001
    1233:	1501                	.insn	2, 0x1501
    1235:	251e                	.insn	2, 0x251e
    1237:	01a4                	.insn	2, 0x01a4
    1239:	0000                	.insn	2, 0x0000
    123b:	2b00                	.insn	2, 0x2b00
    123d:	0000019b          	.insn	4, 0x019b
    1241:	0f04                	.insn	2, 0x0f04
    1243:	0040                	.insn	2, 0x0040
    1245:	000c                	.insn	2, 0x000c
    1247:	0000                	.insn	2, 0x0000
    1249:	4701                	.insn	2, 0x4701
    124b:	0d01                	.insn	2, 0x0d01
    124d:	011d                	.insn	2, 0x011d
    124f:	a459                	.insn	2, 0xa459
    1251:	0001                	.insn	2, 0x0001
    1253:	0000                	.insn	2, 0x0000
    1255:	002e                	.insn	2, 0x002e
    1257:	40112c2f          	.insn	4, 0x40112c2f
    125b:	a800                	.insn	2, 0xa800
    125d:	0000                	.insn	2, 0x0000
    125f:	0100                	.insn	2, 0x0100
    1261:	d152                	.insn	2, 0xd152
    1263:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1267:	0155                	.insn	2, 0x0155
    1269:	006c                	.insn	2, 0x006c
    126b:	0000                	.insn	2, 0x0000
    126d:	8a26                	.insn	2, 0x8a26
    126f:	000c                	.insn	2, 0x000c
    1271:	1b00                	.insn	2, 0x1b00
    1273:	0001                	.insn	2, 0x0001
    1275:	0100                	.insn	2, 0x0100
    1277:	0155                	.insn	2, 0x0155
    1279:	0ae6                	.insn	2, 0x0ae6
    127b:	0000                	.insn	2, 0x0000
    127d:	bb2a                	.insn	2, 0xbb2a
    127f:	000c                	.insn	2, 0x000c
    1281:	7000                	.insn	2, 0x7000
    1283:	0001                	.insn	2, 0x0001
    1285:	0100                	.insn	2, 0x0100
    1287:	0156                	.insn	2, 0x0156
    1289:	006c                	.insn	2, 0x006c
    128b:	0000                	.insn	2, 0x0000
    128d:	fa2a                	.insn	2, 0xfa2a
    128f:	000c                	.insn	2, 0x000c
    1291:	c400                	.insn	2, 0xc400
    1293:	0000                	.insn	2, 0x0000
    1295:	0100                	.insn	2, 0x0100
    1297:	006c015b          	.insn	4, 0x006c015b
    129b:	0000                	.insn	2, 0x0000
    129d:	5829                	.insn	2, 0x5829
    129f:	0002                	.insn	2, 0x0002
    12a1:	2a00                	.insn	2, 0x2a00
    12a3:	0d2c                	.insn	2, 0x0d2c
    12a5:	0000                	.insn	2, 0x0000
    12a7:	0106                	.insn	2, 0x0106
    12a9:	0000                	.insn	2, 0x0000
    12ab:	5d01                	.insn	2, 0x5d01
    12ad:	4001                	.insn	2, 0x4001
    12af:	0000                	.insn	2, 0x0000
    12b1:	2a00                	.insn	2, 0x2a00
    12b3:	00000d47          	.insn	4, 0x0d47
    12b7:	0319                	.insn	2, 0x0319
    12b9:	0000                	.insn	2, 0x0000
    12bb:	5e01                	.insn	2, 0x5e01
    12bd:	6c01                	.insn	2, 0x6c01
    12bf:	0000                	.insn	2, 0x0000
    12c1:	0000                	.insn	2, 0x0000
    12c3:	2f00                	.insn	2, 0x2f00
    12c5:	11d4                	.insn	2, 0x11d4
    12c7:	0040                	.insn	2, 0x0040
    12c9:	006c                	.insn	2, 0x006c
    12cb:	0000                	.insn	2, 0x0000
    12cd:	5201                	.insn	2, 0x5201
    12cf:	0252                	.insn	2, 0x0252
    12d1:	0000                	.insn	2, 0x0000
    12d3:	6a01                	.insn	2, 0x6a01
    12d5:	b701                	.insn	2, 0xb701
    12d7:	000a                	.insn	2, 0x000a
    12d9:	2600                	.insn	2, 0x2600
    12db:	0d62                	.insn	2, 0x0d62
    12dd:	0000                	.insn	2, 0x0000
    12df:	0078                	.insn	2, 0x0078
    12e1:	0000                	.insn	2, 0x0000
    12e3:	6a01                	.insn	2, 0x6a01
    12e5:	6c01                	.insn	2, 0x6c01
    12e7:	0000                	.insn	2, 0x0000
    12e9:	1900                	.insn	2, 0x1900
    12eb:	1200                	.insn	2, 0x1200
    12ed:	0040                	.insn	2, 0x0040
    12ef:	002c                	.insn	2, 0x002c
    12f1:	0000                	.insn	2, 0x0000
    12f3:	932a                	.insn	2, 0x932a
    12f5:	000d                	.insn	2, 0x000d
    12f7:	3800                	.insn	2, 0x3800
    12f9:	0000                	.insn	2, 0x0000
    12fb:	0100                	.insn	2, 0x0100
    12fd:	016e                	.insn	2, 0x016e
    12ff:	006c                	.insn	2, 0x006c
    1301:	0000                	.insn	2, 0x0000
    1303:	0000                	.insn	2, 0x0000
    1305:	4012402f          	.insn	4, 0x4012402f
    1309:	1400                	.insn	2, 0x1400
    130b:	0000                	.insn	2, 0x0000
    130d:	0100                	.insn	2, 0x0100
    130f:	d852                	.insn	2, 0xd852
    1311:	0002                	.insn	2, 0x0002
    1313:	0100                	.insn	2, 0x0100
    1315:	007301bb          	.insn	4, 0x007301bb
    1319:	0000                	.insn	2, 0x0000
    131b:	d22a                	.insn	2, 0xd22a
    131d:	000d                	.insn	2, 0x000d
    131f:	e000                	.insn	2, 0xe000
    1321:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1325:	01bd                	.insn	2, 0x01bd
    1327:	00000073          	ecall
    132b:	2f00                	.insn	2, 0x2f00
    132d:	1254                	.insn	2, 0x1254
    132f:	0040                	.insn	2, 0x0040
    1331:	0014                	.insn	2, 0x0014
    1333:	0000                	.insn	2, 0x0000
    1335:	5201                	.insn	2, 0x5201
    1337:	0000038b          	.insn	4, 0x038b
    133b:	c901                	.insn	2, 0xc901
    133d:	7301                	.insn	2, 0x7301
    133f:	0000                	.insn	2, 0x0000
    1341:	2a00                	.insn	2, 0x2a00
    1343:	0ded                	.insn	2, 0x0ded
    1345:	0000                	.insn	2, 0x0000
    1347:	03e0                	.insn	2, 0x03e0
    1349:	0000                	.insn	2, 0x0000
    134b:	cb01                	.insn	2, 0xcb01
    134d:	7301                	.insn	2, 0x7301
    134f:	0000                	.insn	2, 0x0000
    1351:	0000                	.insn	2, 0x0000
    1353:	4012682f          	.insn	4, 0x4012682f
    1357:	0c00                	.insn	2, 0x0c00
    1359:	0000                	.insn	2, 0x0000
    135b:	0100                	.insn	2, 0x0100
    135d:	a152                	.insn	2, 0xa152
    135f:	0002                	.insn	2, 0x0002
    1361:	0100                	.insn	2, 0x0100
    1363:	021d                	.insn	2, 0x021d
    1365:	00000073          	ecall
    1369:	0826                	.insn	2, 0x0826
    136b:	000e                	.insn	2, 0x000e
    136d:	8000                	.insn	2, 0x8000
    136f:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1373:	021d                	.insn	2, 0x021d
    1375:	0061                	.insn	2, 0x0061
    1377:	0000                	.insn	2, 0x0000
    1379:	0130                	.insn	2, 0x0130
    137b:	0000b55b          	.insn	4, 0xb55b
    137f:	0100                	.insn	2, 0x0100
    1381:	021d                	.insn	2, 0x021d
    1383:	0af9                	.insn	2, 0x0af9
    1385:	0000                	.insn	2, 0x0000
    1387:	9e5a0127          	.insn	4, 0x9e5a0127
    138b:	0002                	.insn	2, 0x0002
    138d:	0100                	.insn	2, 0x0100
    138f:	021f 0061 0000      	.insn	6, 0x0061021f
    1395:	115b0127          	.insn	4, 0x115b0127
    1399:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    139d:	0220                	.insn	2, 0x0220
    139f:	0061                	.insn	2, 0x0061
    13a1:	0000                	.insn	2, 0x0000
    13a3:	0831                	.insn	2, 0x0831
    13a5:	0059                	.insn	2, 0x0059
    13a7:	0000                	.insn	2, 0x0000
    13a9:	2101                	.insn	2, 0x2101
    13ab:	6102                	.insn	2, 0x6102
    13ad:	0000                	.insn	2, 0x0000
    13af:	0000                	.insn	2, 0x0000
    13b1:	4012742f          	.insn	4, 0x4012742f
    13b5:	0c00                	.insn	2, 0x0c00
    13b7:	0000                	.insn	2, 0x0000
    13b9:	0100                	.insn	2, 0x0100
    13bb:	5052                	.insn	2, 0x5052
    13bd:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    13c1:	0241                	.insn	2, 0x0241
    13c3:	0190                	.insn	2, 0x0190
    13c5:	0000                	.insn	2, 0x0000
    13c7:	0a31                	.insn	2, 0x0a31
    13c9:	0059                	.insn	2, 0x0059
    13cb:	0000                	.insn	2, 0x0000
    13cd:	4401                	.insn	2, 0x4401
    13cf:	6102                	.insn	2, 0x6102
    13d1:	0000                	.insn	2, 0x0000
    13d3:	2a00                	.insn	2, 0x2a00
    13d5:	00000e23          	sb	zero,28(zero) # 1c <$d.4+0x1c>
    13d9:	029e                	.insn	2, 0x029e
    13db:	0000                	.insn	2, 0x0000
    13dd:	4301                	.insn	2, 0x4301
    13df:	6102                	.insn	2, 0x6102
    13e1:	0000                	.insn	2, 0x0000
    13e3:	0000                	.insn	2, 0x0000
    13e5:	0032                	.insn	2, 0x0032
    13e7:	4000                	.insn	2, 0x4000
    13e9:	1c00                	.insn	2, 0x1c00
    13eb:	0000                	.insn	2, 0x0000
    13ed:	0100                	.insn	2, 0x0100
    13ef:	0752                	.insn	2, 0x0752
    13f1:	0000                	.insn	2, 0x0000
    13f3:	0100                	.insn	2, 0x0100
    13f5:	40090253          	.insn	4, 0x40090253
    13f9:	0000                	.insn	2, 0x0000
    13fb:	0800                	.insn	2, 0x0800
    13fd:	00000073          	ecall
    1401:	00ad                	.insn	2, 0x00ad
    1403:	0000                	.insn	2, 0x0000
    1405:	4e030e03          	lb	t3,1248(t1) # 3a0e0aa0 <USER_MAX+0x39be0aa0>
    1409:	0000                	.insn	2, 0x0000
    140b:	0400                	.insn	2, 0x0400
    140d:	00000047          	.insn	4, 0x0047
    1411:	0404                	.insn	2, 0x0404
    1413:	00000047          	.insn	4, 0x0047
    1417:	0004                	.insn	2, 0x0004
    1419:	00006103          	.insn	4, 0x6103
    141d:	0400                	.insn	2, 0x0400
    141f:	00000047          	.insn	4, 0x0047
    1423:	0404                	.insn	2, 0x0404
    1425:	00000047          	.insn	4, 0x0047
    1429:	0004                	.insn	2, 0x0004
    142b:	eb09                	.insn	2, 0xeb09
    142d:	000a                	.insn	2, 0x000a
    142f:	3300                	.insn	2, 0x3300
    1431:	0040                	.insn	2, 0x0040
    1433:	0000                	.insn	2, 0x0000
    1435:	f934                	.insn	2, 0xf934
    1437:	000a                	.insn	2, 0x000a
    1439:	2300                	.insn	2, 0x2300
    143b:	35000003          	lb	zero,848(zero) # 350 <$d.6+0xc8>
    143f:	00004003          	lbu	zero,0(zero) # 0 <$d.4>
    1443:	0400                	.insn	2, 0x0400
    1445:	00000047          	.insn	4, 0x0047
    1449:	          	.insn	4, 0x5f00000b

0000144c <$d.5>:
    144c:	055f 0000 0004      	.insn	6, 0x00040000055f
    1452:	04ce                	.insn	2, 0x04ce
    1454:	0000                	.insn	2, 0x0000
    1456:	0104                	.insn	2, 0x0104
    1458:	013a                	.insn	2, 0x013a
    145a:	0000                	.insn	2, 0x0000
    145c:	001d                	.insn	2, 0x001d
    145e:	0175                	.insn	2, 0x0175
    1460:	0000                	.insn	2, 0x0000
    1462:	10b9                	.insn	2, 0x10b9
    1464:	0000                	.insn	2, 0x0000
    1466:	021d                	.insn	2, 0x021d
    1468:	0000                	.insn	2, 0x0000
    146a:	1280                	.insn	2, 0x1280
    146c:	0040                	.insn	2, 0x0040
    146e:	0734                	.insn	2, 0x0734
    1470:	0000                	.insn	2, 0x0000
    1472:	3302                	.insn	2, 0x3302
    1474:	0000                	.insn	2, 0x0000
    1476:	0100                	.insn	2, 0x0100
    1478:	0512                	.insn	2, 0x0512
    147a:	401d2103          	lw	sp,1025(s10)
    147e:	0300                	.insn	2, 0x0300
    1480:	0000003f 00004604 	.insn	8, 0x46040000003f
    1488:	1000                	.insn	2, 0x1000
    148a:	0500                	.insn	2, 0x0500
    148c:	01fc                	.insn	2, 0x01fc
    148e:	0000                	.insn	2, 0x0000
    1490:	0108                	.insn	2, 0x0108
    1492:	e006                	.insn	2, 0xe006
    1494:	0002                	.insn	2, 0x0002
    1496:	0800                	.insn	2, 0x0800
    1498:	005a0207          	.insn	4, 0x005a0207
    149c:	0000                	.insn	2, 0x0000
    149e:	d601                	.insn	2, 0xd601
    14a0:	0305                	.insn	2, 0x0305
    14a2:	1b88                	.insn	2, 0x1b88
    14a4:	0040                	.insn	2, 0x0040
    14a6:	00003f03          	.insn	4, 0x3f03
    14aa:	0400                	.insn	2, 0x0400
    14ac:	0046                	.insn	2, 0x0046
    14ae:	0000                	.insn	2, 0x0000
    14b0:	0009                	.insn	2, 0x0009
    14b2:	3302                	.insn	2, 0x3302
    14b4:	0000                	.insn	2, 0x0000
    14b6:	0100                	.insn	2, 0x0100
    14b8:	05e9                	.insn	2, 0x05e9
    14ba:	401cba03          	.insn	4, 0x401cba03
    14be:	0700                	.insn	2, 0x0700
    14c0:	00000197          	auipc	gp,0x0
    14c4:	0084                	.insn	2, 0x0084
    14c6:	0000                	.insn	2, 0x0000
    14c8:	0301                	.insn	2, 0x0301
    14ca:	0305                	.insn	2, 0x0305
    14cc:	1d60                	.insn	2, 0x1d60
    14ce:	0040                	.insn	2, 0x0040
    14d0:	00009103          	lh	sp,0(ra)
    14d4:	0800                	.insn	2, 0x0800
    14d6:	0046                	.insn	2, 0x0046
    14d8:	0000                	.insn	2, 0x0000
    14da:	0200                	.insn	2, 0x0200
    14dc:	0900                	.insn	2, 0x0900
    14de:	009c                	.insn	2, 0x009c
    14e0:	0000                	.insn	2, 0x0000
    14e2:	0000031b          	.insn	4, 0x031b
    14e6:	0f02                	.insn	2, 0x0f02
    14e8:	e405                	.insn	2, 0xe405
    14ea:	0001                	.insn	2, 0x0001
    14ec:	0800                	.insn	2, 0x0800
    14ee:	0a01                	.insn	2, 0x0a01
    14f0:	0181                	.insn	2, 0x0181
    14f2:	0000                	.insn	2, 0x0000
    14f4:	00b4                	.insn	2, 0x00b4
    14f6:	0000                	.insn	2, 0x0000
    14f8:	0501                	.insn	2, 0x0501
    14fa:	0305                	.insn	2, 0x0305
    14fc:	1f60                	.insn	2, 0x1f60
    14fe:	0040                	.insn	2, 0x0040
    1500:	bf09                	.insn	2, 0xbf09
    1502:	0000                	.insn	2, 0x0000
    1504:	b000                	.insn	2, 0xb000
    1506:	0001                	.insn	2, 0x0001
    1508:	0300                	.insn	2, 0x0300
    150a:	0b0c                	.insn	2, 0x0b0c
    150c:	0314                	.insn	2, 0x0314
    150e:	0c06                	.insn	2, 0x0c06
    1510:	0131                	.insn	2, 0x0131
    1512:	0000                	.insn	2, 0x0000
    1514:	0100                	.insn	2, 0x0100
    1516:	0000                	.insn	2, 0x0000
    1518:	0c000703          	lb	a4,192(zero) # c0 <$d.10+0x4c>
    151c:	01f2                	.insn	2, 0x01f2
    151e:	0000                	.insn	2, 0x0000
    1520:	0100                	.insn	2, 0x0100
    1522:	0000                	.insn	2, 0x0000
    1524:	0c040803          	lb	a6,192(s0)
    1528:	00b9                	.insn	2, 0x00b9
    152a:	0000                	.insn	2, 0x0000
    152c:	0100                	.insn	2, 0x0100
    152e:	0000                	.insn	2, 0x0000
    1530:	0c080903          	lb	s2,192(a6)
    1534:	0094                	.insn	2, 0x0094
    1536:	0000                	.insn	2, 0x0000
    1538:	0100                	.insn	2, 0x0100
    153a:	0000                	.insn	2, 0x0000
    153c:	0c0c0a03          	lb	s4,192(s8) # a716b <$d.5+0xa5d1f>
    1540:	03b5                	.insn	2, 0x03b5
    1542:	0000                	.insn	2, 0x0000
    1544:	0100                	.insn	2, 0x0100
    1546:	0000                	.insn	2, 0x0000
    1548:	00100b03          	lb	s6,1(zero) # 1 <$d.4+0x1>
    154c:	0b09                	.insn	2, 0x0b09
    154e:	0001                	.insn	2, 0x0001
    1550:	a700                	.insn	2, 0xa700
    1552:	0001                	.insn	2, 0x0001
    1554:	0200                	.insn	2, 0x0200
    1556:	0511                	.insn	2, 0x0511
    1558:	02b6                	.insn	2, 0x02b6
    155a:	0000                	.insn	2, 0x0000
    155c:	f50d0407          	.insn	4, 0xf50d0407
    1560:	0000                	.insn	2, 0x0000
    1562:	0100                	.insn	2, 0x0100
    1564:	0079                	.insn	2, 0x0079
    1566:	0001                	.insn	2, 0x0001
    1568:	0100                	.insn	2, 0x0100
    156a:	a10e                	.insn	2, 0xa10e
    156c:	0000                	.insn	2, 0x0000
    156e:	0100                	.insn	2, 0x0100
    1570:	0079                	.insn	2, 0x0079
    1572:	0001                	.insn	2, 0x0001
    1574:	0000                	.insn	2, 0x0000
    1576:	4012800f          	.insn	4, 0x4012800f
    157a:	ec00                	.insn	2, 0xec00
    157c:	0000                	.insn	2, 0x0000
    157e:	0100                	.insn	2, 0x0100
    1580:	1652                	.insn	2, 0x1652
    1582:	0000                	.insn	2, 0x0000
    1584:	0100                	.insn	2, 0x0100
    1586:	0003a607          	.insn	4, 0x0003a607
    158a:	1000                	.insn	2, 0x1000
    158c:	0e3e                	.insn	2, 0x0e3e
    158e:	0000                	.insn	2, 0x0000
    1590:	0314                	.insn	2, 0x0314
    1592:	0000                	.insn	2, 0x0000
    1594:	0701                	.insn	2, 0x0701
    1596:	0386                	.insn	2, 0x0386
    1598:	0000                	.insn	2, 0x0000
    159a:	0211                	.insn	2, 0x0211
    159c:	1491                	.insn	2, 0x1491
    159e:	00b5                	.insn	2, 0x00b5
    15a0:	0000                	.insn	2, 0x0000
    15a2:	0901                	.insn	2, 0x0901
    15a4:	0084                	.insn	2, 0x0084
    15a6:	0000                	.insn	2, 0x0000
    15a8:	0211                	.insn	2, 0x0211
    15aa:	1091                	.insn	2, 0x1091
    15ac:	00a1                	.insn	2, 0x00a1
    15ae:	0000                	.insn	2, 0x0000
    15b0:	0b01                	.insn	2, 0x0b01
    15b2:	0100                	.insn	2, 0x0100
    15b4:	0000                	.insn	2, 0x0000
    15b6:	0211                	.insn	2, 0x0211
    15b8:	0c91                	.insn	2, 0x0c91
    15ba:	03a0                	.insn	2, 0x03a0
    15bc:	0000                	.insn	2, 0x0000
    15be:	0c01                	.insn	2, 0x0c01
    15c0:	0100                	.insn	2, 0x0100
    15c2:	0000                	.insn	2, 0x0000
    15c4:	6f12                	.insn	2, 0x6f12
    15c6:	000e                	.insn	2, 0x000e
    15c8:	a900                	.insn	2, 0xa900
    15ca:	0000                	.insn	2, 0x0000
    15cc:	0100                	.insn	2, 0x0100
    15ce:	0016                	.insn	2, 0x0016
    15d0:	0001                	.insn	2, 0x0001
    15d2:	1300                	.insn	2, 0x1300
    15d4:	0112                	.insn	2, 0x0112
    15d6:	0000                	.insn	2, 0x0000
    15d8:	12dc                	.insn	2, 0x12dc
    15da:	0040                	.insn	2, 0x0040
    15dc:	001c                	.insn	2, 0x001c
    15de:	0000                	.insn	2, 0x0000
    15e0:	1701                	.insn	2, 0x1701
    15e2:	1409                	.insn	2, 0x1409
    15e4:	0e5c                	.insn	2, 0x0e5c
    15e6:	0000                	.insn	2, 0x0000
    15e8:	011e                	.insn	2, 0x011e
    15ea:	0000                	.insn	2, 0x0000
    15ec:	1500                	.insn	2, 0x1500
    15ee:	1314                	.insn	2, 0x1314
    15f0:	0040                	.insn	2, 0x0040
    15f2:	0034                	.insn	2, 0x0034
    15f4:	0000                	.insn	2, 0x0000
    15f6:	8212                	.insn	2, 0x8212
    15f8:	000e                	.insn	2, 0x000e
    15fa:	3800                	.insn	2, 0x3800
    15fc:	0000                	.insn	2, 0x0000
    15fe:	0100                	.insn	2, 0x0100
    1600:	001c                	.insn	2, 0x001c
    1602:	0001                	.insn	2, 0x0001
    1604:	0000                	.insn	2, 0x0000
    1606:	f116                	.insn	2, 0xf116
    1608:	0001                	.insn	2, 0x0001
    160a:	9c00                	.insn	2, 0x9c00
    160c:	4012                	.insn	2, 0x4012
    160e:	1600                	.insn	2, 0x1600
    1610:	0255                	.insn	2, 0x0255
    1612:	0000                	.insn	2, 0x0000
    1614:	12bc                	.insn	2, 0x12bc
    1616:	0040                	.insn	2, 0x0040
    1618:	7816                	.insn	2, 0x7816
    161a:	d0000003          	lb	zero,-768(zero) # fffffd00 <USER_MAX+0xffaffd00>
    161e:	4012                	.insn	2, 0x4012
    1620:	1600                	.insn	2, 0x1600
    1622:	0390                	.insn	2, 0x0390
    1624:	0000                	.insn	2, 0x0000
    1626:	1304                	.insn	2, 0x1304
    1628:	0040                	.insn	2, 0x0040
    162a:	ae16                	.insn	2, 0xae16
    162c:	40000003          	lb	zero,1024(zero) # 400 <$d.6+0x178>
    1630:	16004013          	xori	zero,zero,352
    1634:	03ae                	.insn	2, 0x03ae
    1636:	0000                	.insn	2, 0x0000
    1638:	1354                	.insn	2, 0x1354
    163a:	0040                	.insn	2, 0x0040
    163c:	0f00                	.insn	2, 0x0f00
    163e:	136c                	.insn	2, 0x136c
    1640:	0040                	.insn	2, 0x0040
    1642:	0128                	.insn	2, 0x0128
    1644:	0000                	.insn	2, 0x0000
    1646:	5201                	.insn	2, 0x5201
    1648:	0088                	.insn	2, 0x0088
    164a:	0000                	.insn	2, 0x0000
    164c:	8001                	.insn	2, 0x8001
    164e:	03a6                	.insn	2, 0x03a6
    1650:	0000                	.insn	2, 0x0000
    1652:	b912                	.insn	2, 0xb912
    1654:	000e                	.insn	2, 0x000e
    1656:	b500                	.insn	2, 0xb500
    1658:	0000                	.insn	2, 0x0000
    165a:	0100                	.insn	2, 0x0100
    165c:	4c82                	.insn	2, 0x4c82
    165e:	0005                	.insn	2, 0x0005
    1660:	1200                	.insn	2, 0x1200
    1662:	0ecc                	.insn	2, 0x0ecc
    1664:	0000                	.insn	2, 0x0000
    1666:	01bd                	.insn	2, 0x01bd
    1668:	0000                	.insn	2, 0x0000
    166a:	9001                	.insn	2, 0x9001
    166c:	0100                	.insn	2, 0x0100
    166e:	0000                	.insn	2, 0x0000
    1670:	df12                	.insn	2, 0xdf12
    1672:	000e                	.insn	2, 0x000e
    1674:	5b00                	.insn	2, 0x5b00
    1676:	0002                	.insn	2, 0x0002
    1678:	0100                	.insn	2, 0x0100
    167a:	00010097          	auipc	ra,0x10
    167e:	1200                	.insn	2, 0x1200
    1680:	0ef2                	.insn	2, 0x0ef2
    1682:	0000                	.insn	2, 0x0000
    1684:	0365                	.insn	2, 0x0365
    1686:	0000                	.insn	2, 0x0000
    1688:	9401                	.insn	2, 0x9401
    168a:	0100                	.insn	2, 0x0100
    168c:	0000                	.insn	2, 0x0000
    168e:	9016                	.insn	2, 0x9016
    1690:	98000003          	lb	zero,-1664(zero) # fffff980 <USER_MAX+0xffaff980>
    1694:	16004013          	xori	zero,zero,352
    1698:	0390                	.insn	2, 0x0390
    169a:	0000                	.insn	2, 0x0000
    169c:	13dc                	.insn	2, 0x13dc
    169e:	0040                	.insn	2, 0x0040
    16a0:	0f00                	.insn	2, 0x0f00
    16a2:	1494                	.insn	2, 0x1494
    16a4:	0040                	.insn	2, 0x0040
    16a6:	02a4                	.insn	2, 0x02a4
    16a8:	0000                	.insn	2, 0x0000
    16aa:	5201                	.insn	2, 0x5201
    16ac:	011d                	.insn	2, 0x011d
    16ae:	0000                	.insn	2, 0x0000
    16b0:	2901                	.insn	2, 0x2901
    16b2:	03a6                	.insn	2, 0x03a6
    16b4:	0000                	.insn	2, 0x0000
    16b6:	0510                	.insn	2, 0x0510
    16b8:	1400000f          	.insn	4, 0x1400000f
    16bc:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    16c0:	862a                	.insn	2, 0x862a
    16c2:	10000003          	lb	zero,256(zero) # 100 <$d.10+0x8c>
    16c6:	0f2e                	.insn	2, 0x0f2e
    16c8:	0000                	.insn	2, 0x0000
    16ca:	00a1                	.insn	2, 0x00a1
    16cc:	0000                	.insn	2, 0x0000
    16ce:	2b01                	.insn	2, 0x2b01
    16d0:	055d                	.insn	2, 0x055d
    16d2:	0000                	.insn	2, 0x0000
    16d4:	5710                	.insn	2, 0x5710
    16d6:	a000000f          	.insn	4, 0xa000000f
    16da:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    16de:	5d2c                	.insn	2, 0x5d2c
    16e0:	0005                	.insn	2, 0x0005
    16e2:	1200                	.insn	2, 0x1200
    16e4:	00000f93          	li	t6,0
    16e8:	0264                	.insn	2, 0x0264
    16ea:	0000                	.insn	2, 0x0000
    16ec:	3301                	.insn	2, 0x3301
    16ee:	0100                	.insn	2, 0x0100
    16f0:	0000                	.insn	2, 0x0000
    16f2:	0000b517          	auipc	a0,0xb
    16f6:	0100                	.insn	2, 0x0100
    16f8:	4c2e                	.insn	2, 0x4c2e
    16fa:	0005                	.insn	2, 0x0005
    16fc:	1300                	.insn	2, 0x1300
    16fe:	0112                	.insn	2, 0x0112
    1700:	0000                	.insn	2, 0x0000
    1702:	14f0                	.insn	2, 0x14f0
    1704:	0040                	.insn	2, 0x0040
    1706:	0014                	.insn	2, 0x0014
    1708:	0000                	.insn	2, 0x0000
    170a:	3401                	.insn	2, 0x3401
    170c:	1409                	.insn	2, 0x1409
    170e:	0f80                	.insn	2, 0x0f80
    1710:	0000                	.insn	2, 0x0000
    1712:	011e                	.insn	2, 0x011e
    1714:	0000                	.insn	2, 0x0000
    1716:	1500                	.insn	2, 0x1500
    1718:	1574                	.insn	2, 0x1574
    171a:	0040                	.insn	2, 0x0040
    171c:	01c4                	.insn	2, 0x01c4
    171e:	0000                	.insn	2, 0x0000
    1720:	5e12                	.insn	2, 0x5e12
    1722:	0010                	.insn	2, 0x0010
    1724:	3800                	.insn	2, 0x3800
    1726:	0000                	.insn	2, 0x0000
    1728:	0100                	.insn	2, 0x0100
    172a:	a639                	.insn	2, 0xa639
    172c:	18000003          	lb	zero,384(zero) # 180 <$d.6+0x46>
    1730:	0288                	.insn	2, 0x0288
    1732:	0000                	.insn	2, 0x0000
    1734:	0211                	.insn	2, 0x0211
    1736:	0391                	.insn	2, 0x0391
    1738:	02ce                	.insn	2, 0x02ce
    173a:	0000                	.insn	2, 0x0000
    173c:	4901                	.insn	2, 0x4901
    173e:	0551                	.insn	2, 0x0551
    1740:	0000                	.insn	2, 0x0000
    1742:	e212                	.insn	2, 0xe212
    1744:	2800000f          	.insn	4, 0x2800000f
    1748:	0001                	.insn	2, 0x0001
    174a:	0100                	.insn	2, 0x0100
    174c:	a64a                	.insn	2, 0xa64a
    174e:	17000003          	lb	zero,368(zero) # 170 <$d.6+0x36>
    1752:	0104                	.insn	2, 0x0104
    1754:	0000                	.insn	2, 0x0000
    1756:	3b01                	.insn	2, 0x3b01
    1758:	054c                	.insn	2, 0x054c
    175a:	0000                	.insn	2, 0x0000
    175c:	a018                	.insn	2, 0xa018
    175e:	0002                	.insn	2, 0x0002
    1760:	1200                	.insn	2, 0x1200
    1762:	0fa6                	.insn	2, 0x0fa6
    1764:	0000                	.insn	2, 0x0000
    1766:	03b1                	.insn	2, 0x03b1
    1768:	0000                	.insn	2, 0x0000
    176a:	5701                	.insn	2, 0x5701
    176c:	03a6                	.insn	2, 0x03a6
    176e:	0000                	.insn	2, 0x0000
    1770:	1500                	.insn	2, 0x1500
    1772:	16dc                	.insn	2, 0x16dc
    1774:	0040                	.insn	2, 0x0040
    1776:	005c                	.insn	2, 0x005c
    1778:	0000                	.insn	2, 0x0000
    177a:	00034a17          	auipc	s4,0x34
    177e:	0100                	.insn	2, 0x0100
    1780:	0061                	.insn	2, 0x0061
    1782:	0001                	.insn	2, 0x0001
    1784:	1700                	.insn	2, 0x1700
    1786:	01a1                	.insn	2, 0x01a1
    1788:	0000                	.insn	2, 0x0000
    178a:	6501                	.insn	2, 0x6501
    178c:	0100                	.insn	2, 0x0100
    178e:	0000                	.insn	2, 0x0000
    1790:	1800                	.insn	2, 0x1800
    1792:	02c0                	.insn	2, 0x02c0
    1794:	0000                	.insn	2, 0x0000
    1796:	a212                	.insn	2, 0xa212
    1798:	0010                	.insn	2, 0x0010
    179a:	b100                	.insn	2, 0xb100
    179c:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    17a0:	a64d                	.insn	2, 0xa64d
    17a2:	00000003          	lb	zero,0(zero) # 0 <$d.4>
    17a6:	0000                	.insn	2, 0x0000
    17a8:	f116                	.insn	2, 0xf116
    17aa:	0001                	.insn	2, 0x0001
    17ac:	dc00                	.insn	2, 0xdc00
    17ae:	4014                	.insn	2, 0x4014
    17b0:	1600                	.insn	2, 0x1600
    17b2:	0390                	.insn	2, 0x0390
    17b4:	0000                	.insn	2, 0x0000
    17b6:	1518                	.insn	2, 0x1518
    17b8:	0040                	.insn	2, 0x0040
    17ba:	bb16                	.insn	2, 0xbb16
    17bc:	98000003          	lb	zero,-1664(zero) # fffff980 <USER_MAX+0xffaff980>
    17c0:	4015                	.insn	2, 0x4015
    17c2:	0000                	.insn	2, 0x0000
    17c4:	6f19                	.insn	2, 0x6f19
    17c6:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
    17ca:	1a41                	.insn	2, 0x1a41
    17cc:	0386                	.insn	2, 0x0386
    17ce:	0000                	.insn	2, 0x0000
    17d0:	8b1c001b          	.insn	4, 0x8b1c001b
    17d4:	1d000003          	lb	zero,464(zero) # 1d0 <$d.10+0x8>
    17d8:	0000003f 0002a11e 	.insn	8, 0x0002a11e0000003f
    17e0:	0200                	.insn	2, 0x0200
    17e2:	a62c                	.insn	2, 0xa62c
    17e4:	1a000003          	lb	zero,416(zero) # 1a0 <$d.6+0x66>
    17e8:	0100                	.insn	2, 0x0100
    17ea:	0000                	.insn	2, 0x0000
    17ec:	ad1a                	.insn	2, 0xad1a
    17ee:	00000003          	lb	zero,0(zero) # 0 <$d.4>
    17f2:	0105                	.insn	2, 0x0105
    17f4:	0002                	.insn	2, 0x0002
    17f6:	0500                	.insn	2, 0x0500
    17f8:	1f04                	.insn	2, 0x1f04
    17fa:	c919                	.insn	2, 0xc919
    17fc:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
    1800:	003f1a33          	sll	s4,t5,gp
    1804:	0000                	.insn	2, 0x0000
    1806:	1e00                	.insn	2, 0x1e00
    1808:	02fe                	.insn	2, 0x02fe
    180a:	0000                	.insn	2, 0x0000
    180c:	3d02                	.insn	2, 0x3d02
    180e:	03a6                	.insn	2, 0x03a6
    1810:	0000                	.insn	2, 0x0000
    1812:	861a                	.insn	2, 0x861a
    1814:	1a000003          	lb	zero,416(zero) # 1a0 <$d.6+0x66>
    1818:	0386                	.insn	2, 0x0386
    181a:	0000                	.insn	2, 0x0000
    181c:	2000                	.insn	2, 0x2000
    181e:	1738                	.insn	2, 0x1738
    1820:	0040                	.insn	2, 0x0040
    1822:	0020                	.insn	2, 0x0020
    1824:	0000                	.insn	2, 0x0000
    1826:	5201                	.insn	2, 0x5201
    1828:	0112                	.insn	2, 0x0112
    182a:	0000                	.insn	2, 0x0000
    182c:	8714                	.insn	2, 0x8714
    182e:	0011                	.insn	2, 0x0011
    1830:	1e00                	.insn	2, 0x1e00
    1832:	0001                	.insn	2, 0x0001
    1834:	0000                	.insn	2, 0x0000
    1836:	5821                	.insn	2, 0x5821
    1838:	5c004017          	auipc	zero,0x5c004
    183c:	0002                	.insn	2, 0x0002
    183e:	0100                	.insn	2, 0x0100
    1840:	0d52                	.insn	2, 0x0d52
    1842:	0000                	.insn	2, 0x0000
    1844:	0100                	.insn	2, 0x0100
    1846:	11ad12af          	.insn	4, 0x11ad12af
    184a:	0000                	.insn	2, 0x0000
    184c:	0264                	.insn	2, 0x0264
    184e:	0000                	.insn	2, 0x0000
    1850:	b601                	.insn	2, 0xb601
    1852:	0100                	.insn	2, 0x0100
    1854:	0000                	.insn	2, 0x0000
    1856:	0000b517          	auipc	a0,0xb
    185a:	0100                	.insn	2, 0x0100
    185c:	4cb1                	.insn	2, 0x4cb1
    185e:	0005                	.insn	2, 0x0005
    1860:	1300                	.insn	2, 0x1300
    1862:	0112                	.insn	2, 0x0112
    1864:	0000                	.insn	2, 0x0000
    1866:	1794                	.insn	2, 0x1794
    1868:	0040                	.insn	2, 0x0040
    186a:	0014                	.insn	2, 0x0014
    186c:	0000                	.insn	2, 0x0000
    186e:	b701                	.insn	2, 0xb701
    1870:	1409                	.insn	2, 0x1409
    1872:	119a                	.insn	2, 0x119a
    1874:	0000                	.insn	2, 0x0000
    1876:	011e                	.insn	2, 0x011e
    1878:	0000                	.insn	2, 0x0000
    187a:	1500                	.insn	2, 0x1500
    187c:	180c                	.insn	2, 0x180c
    187e:	0040                	.insn	2, 0x0040
    1880:	01a8                	.insn	2, 0x01a8
    1882:	0000                	.insn	2, 0x0000
    1884:	c012                	.insn	2, 0xc012
    1886:	0011                	.insn	2, 0x0011
    1888:	3800                	.insn	2, 0x3800
    188a:	0000                	.insn	2, 0x0000
    188c:	0100                	.insn	2, 0x0100
    188e:	a6bc                	.insn	2, 0xa6bc
    1890:	18000003          	lb	zero,384(zero) # 180 <$d.6+0x46>
    1894:	02d8                	.insn	2, 0x02d8
    1896:	0000                	.insn	2, 0x0000
    1898:	0412                	.insn	2, 0x0412
    189a:	0012                	.insn	2, 0x0012
    189c:	c600                	.insn	2, 0xc600
    189e:	0001                	.insn	2, 0x0001
    18a0:	0100                	.insn	2, 0x0100
    18a2:	00e0                	.insn	2, 0x00e0
    18a4:	0001                	.insn	2, 0x0001
    18a6:	1200                	.insn	2, 0x1200
    18a8:	00001217          	auipc	tp,0x1
    18ac:	03a0                	.insn	2, 0x03a0
    18ae:	0000                	.insn	2, 0x0000
    18b0:	e301                	.insn	2, 0xe301
    18b2:	0100                	.insn	2, 0x0100
    18b4:	0000                	.insn	2, 0x0000
    18b6:	00010417          	auipc	s0,0x10
    18ba:	0100                	.insn	2, 0x0100
    18bc:	4cbe                	.insn	2, 0x4cbe
    18be:	0005                	.insn	2, 0x0005
    18c0:	1700                	.insn	2, 0x1700
    18c2:	034a                	.insn	2, 0x034a
    18c4:	0000                	.insn	2, 0x0000
    18c6:	d801                	.insn	2, 0xd801
    18c8:	0100                	.insn	2, 0x0100
    18ca:	0000                	.insn	2, 0x0000
    18cc:	0001a117          	auipc	sp,0x1a
    18d0:	0100                	.insn	2, 0x0100
    18d2:	00dc                	.insn	2, 0x00dc
    18d4:	0001                	.insn	2, 0x0001
    18d6:	1800                	.insn	2, 0x1800
    18d8:	02f0                	.insn	2, 0x02f0
    18da:	0000                	.insn	2, 0x0000
    18dc:	2a12                	.insn	2, 0x2a12
    18de:	0012                	.insn	2, 0x0012
    18e0:	b100                	.insn	2, 0xb100
    18e2:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    18e6:	a6c9                	.insn	2, 0xa6c9
    18e8:	00000003          	lb	zero,0(zero) # 0 <$d.4>
    18ec:	6c15                	.insn	2, 0x6c15
    18ee:	4019                	.insn	2, 0x4019
    18f0:	4800                	.insn	2, 0x4800
    18f2:	0000                	.insn	2, 0x0000
    18f4:	1200                	.insn	2, 0x1200
    18f6:	0000130f          	.insn	4, 0x130f
    18fa:	03b1                	.insn	2, 0x03b1
    18fc:	0000                	.insn	2, 0x0000
    18fe:	d001                	.insn	2, 0xd001
    1900:	03a6                	.insn	2, 0x03a6
    1902:	0000                	.insn	2, 0x0000
    1904:	0000                	.insn	2, 0x0000
    1906:	1600                	.insn	2, 0x1600
    1908:	01f1                	.insn	2, 0x01f1
    190a:	0000                	.insn	2, 0x0000
    190c:	1784                	.insn	2, 0x1784
    190e:	0040                	.insn	2, 0x0040
    1910:	9016                	.insn	2, 0x9016
    1912:	bc000003          	lb	zero,-1088(zero) # fffffbc0 <USER_MAX+0xffaffbc0>
    1916:	16004017          	auipc	zero,0x16004
    191a:	0378                	.insn	2, 0x0378
    191c:	0000                	.insn	2, 0x0000
    191e:	181c                	.insn	2, 0x181c
    1920:	0040                	.insn	2, 0x0040
    1922:	7816                	.insn	2, 0x7816
    1924:	78000003          	lb	zero,1920(zero) # 780 <$d.3+0x231>
    1928:	4018                	.insn	2, 0x4018
    192a:	1600                	.insn	2, 0x1600
    192c:	03ae                	.insn	2, 0x03ae
    192e:	0000                	.insn	2, 0x0000
    1930:	18e8                	.insn	2, 0x18e8
    1932:	0040                	.insn	2, 0x0040
    1934:	ae16                	.insn	2, 0xae16
    1936:	f8000003          	lb	zero,-128(zero) # ffffff80 <USER_MAX+0xffafff80>
    193a:	4018                	.insn	2, 0x4018
    193c:	1600                	.insn	2, 0x1600
    193e:	03ae                	.insn	2, 0x03ae
    1940:	0000                	.insn	2, 0x0000
    1942:	1908                	.insn	2, 0x1908
    1944:	0040                	.insn	2, 0x0040
    1946:	ae16                	.insn	2, 0xae16
    1948:	18000003          	lb	zero,384(zero) # 180 <$d.6+0x46>
    194c:	4019                	.insn	2, 0x4019
    194e:	1600                	.insn	2, 0x1600
    1950:	03ae                	.insn	2, 0x03ae
    1952:	0000                	.insn	2, 0x0000
    1954:	1928                	.insn	2, 0x1928
    1956:	0040                	.insn	2, 0x0040
    1958:	ae16                	.insn	2, 0xae16
    195a:	38000003          	lb	zero,896(zero) # 380 <$d.6+0xf8>
    195e:	4019                	.insn	2, 0x4019
    1960:	1600                	.insn	2, 0x1600
    1962:	03ae                	.insn	2, 0x03ae
    1964:	0000                	.insn	2, 0x0000
    1966:	1948                	.insn	2, 0x1948
    1968:	0040                	.insn	2, 0x0040
    196a:	ae16                	.insn	2, 0xae16
    196c:	58000003          	lb	zero,1408(zero) # 580 <$d.3+0x31>
    1970:	4019                	.insn	2, 0x4019
    1972:	1600                	.insn	2, 0x1600
    1974:	03ae                	.insn	2, 0x03ae
    1976:	0000                	.insn	2, 0x0000
    1978:	196c                	.insn	2, 0x196c
    197a:	0040                	.insn	2, 0x0040
    197c:	ae16                	.insn	2, 0xae16
    197e:	90000003          	lb	zero,-1792(zero) # fffff900 <USER_MAX+0xffaff900>
    1982:	4019                	.insn	2, 0x4019
    1984:	1600                	.insn	2, 0x1600
    1986:	03ae                	.insn	2, 0x03ae
    1988:	0000                	.insn	2, 0x0000
    198a:	19a0                	.insn	2, 0x19a0
    198c:	0040                	.insn	2, 0x0040
    198e:	ae16                	.insn	2, 0xae16
    1990:	b0000003          	lb	zero,-1280(zero) # fffffb00 <USER_MAX+0xffaffb00>
    1994:	4019                	.insn	2, 0x4019
    1996:	0000                	.insn	2, 0x0000
    1998:	911c                	.insn	2, 0x911c
    199a:	0000                	.insn	2, 0x0000
    199c:	0300                	.insn	2, 0x0300
    199e:	0000003f 00004604 	.insn	8, 0x46040000003f
    19a6:	0d00                	.insn	2, 0x0d00
    19a8:	1c00                	.insn	2, 0x1c00
    19aa:	0100                	.insn	2, 0x0100
    19ac:	0000                	.insn	2, 0x0000
	...

セクション .debug_ranges の逆アセンブル:

00000000 <$d.5>:
   0:	0200                	.insn	2, 0x0200
   2:	0000                	.insn	2, 0x0000
   4:	0334                	.insn	2, 0x0334
   6:	0000                	.insn	2, 0x0000
   8:	0338                	.insn	2, 0x0338
   a:	0000                	.insn	2, 0x0000
   c:	08e4                	.insn	2, 0x08e4
	...
  16:	0000                	.insn	2, 0x0000
  18:	0630                	.insn	2, 0x0630
  1a:	0000                	.insn	2, 0x0000
  1c:	0654                	.insn	2, 0x0654
  1e:	0000                	.insn	2, 0x0000
  20:	0778                	.insn	2, 0x0778
  22:	0000                	.insn	2, 0x0000
  24:	0788                	.insn	2, 0x0788
	...
  2e:	0000                	.insn	2, 0x0000
  30:	05e8                	.insn	2, 0x05e8
  32:	0000                	.insn	2, 0x0000
  34:	060c                	.insn	2, 0x060c
  36:	0000                	.insn	2, 0x0000
  38:	0658                	.insn	2, 0x0658
  3a:	0000                	.insn	2, 0x0000
  3c:	0668                	.insn	2, 0x0668
	...
  46:	0000                	.insn	2, 0x0000
  48:	059c                	.insn	2, 0x059c
  4a:	0000                	.insn	2, 0x0000
  4c:	05e8                	.insn	2, 0x05e8
  4e:	0000                	.insn	2, 0x0000
  50:	0614                	.insn	2, 0x0614
  52:	0000                	.insn	2, 0x0000
  54:	0628                	.insn	2, 0x0628
  56:	0000                	.insn	2, 0x0000
  58:	0694                	.insn	2, 0x0694
  5a:	0000                	.insn	2, 0x0000
  5c:	0754                	.insn	2, 0x0754
  5e:	0000                	.insn	2, 0x0000
  60:	07cc                	.insn	2, 0x07cc
  62:	0000                	.insn	2, 0x0000
  64:	082c                	.insn	2, 0x082c
	...
  6e:	0000                	.insn	2, 0x0000
  70:	05a4                	.insn	2, 0x05a4
  72:	0000                	.insn	2, 0x0000
  74:	05e8                	.insn	2, 0x05e8
  76:	0000                	.insn	2, 0x0000
  78:	0624                	.insn	2, 0x0624
  7a:	0000                	.insn	2, 0x0000
  7c:	0628                	.insn	2, 0x0628
  7e:	0000                	.insn	2, 0x0000
  80:	0694                	.insn	2, 0x0694
  82:	0000                	.insn	2, 0x0000
  84:	06e8                	.insn	2, 0x06e8
	...
  8e:	0000                	.insn	2, 0x0000
  90:	0694                	.insn	2, 0x0694
  92:	0000                	.insn	2, 0x0000
  94:	06a0                	.insn	2, 0x06a0
  96:	0000                	.insn	2, 0x0000
  98:	06a4                	.insn	2, 0x06a4
  9a:	0000                	.insn	2, 0x0000
  9c:	06b0                	.insn	2, 0x06b0
  9e:	0000                	.insn	2, 0x0000
  a0:	06b8                	.insn	2, 0x06b8
  a2:	0000                	.insn	2, 0x0000
  a4:	06e8                	.insn	2, 0x06e8
	...
  ae:	0000                	.insn	2, 0x0000
  b0:	0704                	.insn	2, 0x0704
  b2:	0000                	.insn	2, 0x0000
  b4:	0754                	.insn	2, 0x0754
  b6:	0000                	.insn	2, 0x0000
  b8:	07cc                	.insn	2, 0x07cc
  ba:	0000                	.insn	2, 0x0000
  bc:	0820                	.insn	2, 0x0820
	...
  c6:	0000                	.insn	2, 0x0000
  c8:	07cc                	.insn	2, 0x07cc
  ca:	0000                	.insn	2, 0x0000
  cc:	07d8                	.insn	2, 0x07d8
  ce:	0000                	.insn	2, 0x0000
  d0:	07dc                	.insn	2, 0x07dc
  d2:	0000                	.insn	2, 0x0000
  d4:	07e8                	.insn	2, 0x07e8
  d6:	0000                	.insn	2, 0x0000
  d8:	07f0                	.insn	2, 0x07f0
  da:	0000                	.insn	2, 0x0000
  dc:	0820                	.insn	2, 0x0820
	...
  e6:	0000                	.insn	2, 0x0000
  e8:	02e4                	.insn	2, 0x02e4
  ea:	0000                	.insn	2, 0x0000
  ec:	0334                	.insn	2, 0x0334
  ee:	0000                	.insn	2, 0x0000
  f0:	0338                	.insn	2, 0x0338
  f2:	0000                	.insn	2, 0x0000
  f4:	03c8                	.insn	2, 0x03c8
	...
  fe:	0000                	.insn	2, 0x0000
 100:	0944                	.insn	2, 0x0944
 102:	0000                	.insn	2, 0x0000
 104:	095c                	.insn	2, 0x095c
 106:	0000                	.insn	2, 0x0000
 108:	0960                	.insn	2, 0x0960
 10a:	0000                	.insn	2, 0x0000
 10c:	096c                	.insn	2, 0x096c
 10e:	0000                	.insn	2, 0x0000
 110:	0974                	.insn	2, 0x0974
 112:	0000                	.insn	2, 0x0000
 114:	09a4                	.insn	2, 0x09a4
	...

00000120 <$d.6>:
 120:	0b28                	.insn	2, 0x0b28
 122:	0040                	.insn	2, 0x0040
 124:	0b48                	.insn	2, 0x0b48
 126:	0040                	.insn	2, 0x0040
 128:	0bd8                	.insn	2, 0x0bd8
 12a:	0040                	.insn	2, 0x0040
 12c:	0bf8                	.insn	2, 0x0bf8
 12e:	0040                	.insn	2, 0x0040
	...
 138:	0b48                	.insn	2, 0x0b48
 13a:	0040                	.insn	2, 0x0040
 13c:	0b58                	.insn	2, 0x0b58
 13e:	0040                	.insn	2, 0x0040
 140:	0bf8                	.insn	2, 0x0bf8
 142:	0040                	.insn	2, 0x0040
 144:	0c08                	.insn	2, 0x0c08
 146:	0040                	.insn	2, 0x0040
	...
 150:	0b58                	.insn	2, 0x0b58
 152:	0040                	.insn	2, 0x0040
 154:	0b64                	.insn	2, 0x0b64
 156:	0040                	.insn	2, 0x0040
 158:	0c08                	.insn	2, 0x0c08
 15a:	0040                	.insn	2, 0x0040
 15c:	0c14                	.insn	2, 0x0c14
 15e:	0040                	.insn	2, 0x0040
	...
 168:	0c18                	.insn	2, 0x0c18
 16a:	0040                	.insn	2, 0x0040
 16c:	0c28                	.insn	2, 0x0c28
 16e:	0040                	.insn	2, 0x0040
 170:	0cdc                	.insn	2, 0x0cdc
 172:	0040                	.insn	2, 0x0040
 174:	0cec                	.insn	2, 0x0cec
 176:	0040                	.insn	2, 0x0040
	...
 180:	0c28                	.insn	2, 0x0c28
 182:	0040                	.insn	2, 0x0040
 184:	0c34                	.insn	2, 0x0c34
 186:	0040                	.insn	2, 0x0040
 188:	0cec                	.insn	2, 0x0cec
 18a:	0040                	.insn	2, 0x0040
 18c:	0cf8                	.insn	2, 0x0cf8
 18e:	0040                	.insn	2, 0x0040
	...
 198:	0c34                	.insn	2, 0x0c34
 19a:	0040                	.insn	2, 0x0040
 19c:	0c40                	.insn	2, 0x0c40
 19e:	0040                	.insn	2, 0x0040
 1a0:	0cf8                	.insn	2, 0x0cf8
 1a2:	0040                	.insn	2, 0x0040
 1a4:	0d04                	.insn	2, 0x0d04
 1a6:	0040                	.insn	2, 0x0040
	...
 1b0:	0cac                	.insn	2, 0x0cac
 1b2:	0040                	.insn	2, 0x0040
 1b4:	0cbc                	.insn	2, 0x0cbc
 1b6:	0040                	.insn	2, 0x0040
 1b8:	0d08                	.insn	2, 0x0d08
 1ba:	0040                	.insn	2, 0x0040
 1bc:	0d18                	.insn	2, 0x0d18
 1be:	0040                	.insn	2, 0x0040
	...
 1c8:	0cbc                	.insn	2, 0x0cbc
 1ca:	0040                	.insn	2, 0x0040
 1cc:	0cc8                	.insn	2, 0x0cc8
 1ce:	0040                	.insn	2, 0x0040
 1d0:	0d18                	.insn	2, 0x0d18
 1d2:	0040                	.insn	2, 0x0040
 1d4:	0d24                	.insn	2, 0x0d24
 1d6:	0040                	.insn	2, 0x0040
	...
 1e0:	0cc8                	.insn	2, 0x0cc8
 1e2:	0040                	.insn	2, 0x0040
 1e4:	0cd8                	.insn	2, 0x0cd8
 1e6:	0040                	.insn	2, 0x0040
 1e8:	0d24                	.insn	2, 0x0d24
 1ea:	0040                	.insn	2, 0x0040
 1ec:	0d30                	.insn	2, 0x0d30
 1ee:	0040                	.insn	2, 0x0040
	...
 1f8:	0f2c                	.insn	2, 0x0f2c
 1fa:	0040                	.insn	2, 0x0040
 1fc:	0f50                	.insn	2, 0x0f50
 1fe:	0040                	.insn	2, 0x0040
 200:	109c                	.insn	2, 0x109c
 202:	0040                	.insn	2, 0x0040
 204:	1100                	.insn	2, 0x1100
 206:	0040                	.insn	2, 0x0040
	...
 210:	0f7c                	.insn	2, 0x0f7c
 212:	0040                	.insn	2, 0x0040
 214:	0f88                	.insn	2, 0x0f88
 216:	0040                	.insn	2, 0x0040
 218:	0f98                	.insn	2, 0x0f98
 21a:	0040                	.insn	2, 0x0040
 21c:	0fa4                	.insn	2, 0x0fa4
 21e:	0040                	.insn	2, 0x0040
 220:	0fb4                	.insn	2, 0x0fb4
 222:	0040                	.insn	2, 0x0040
 224:	0fc0                	.insn	2, 0x0fc0
 226:	0040                	.insn	2, 0x0040
 228:	0fd0                	.insn	2, 0x0fd0
 22a:	0040                	.insn	2, 0x0040
 22c:	0fdc                	.insn	2, 0x0fdc
 22e:	0040                	.insn	2, 0x0040
 230:	0fec                	.insn	2, 0x0fec
 232:	0040                	.insn	2, 0x0040
 234:	0ff8                	.insn	2, 0x0ff8
 236:	0040                	.insn	2, 0x0040
 238:	1008                	.insn	2, 0x1008
 23a:	0040                	.insn	2, 0x0040
 23c:	1014                	.insn	2, 0x1014
 23e:	0040                	.insn	2, 0x0040
 240:	1024                	.insn	2, 0x1024
 242:	0040                	.insn	2, 0x0040
 244:	1030                	.insn	2, 0x1030
 246:	0040                	.insn	2, 0x0040
 248:	103c                	.insn	2, 0x103c
 24a:	0040                	.insn	2, 0x0040
 24c:	1048                	.insn	2, 0x1048
 24e:	0040                	.insn	2, 0x0040
	...
 258:	1170                	.insn	2, 0x1170
 25a:	0040                	.insn	2, 0x0040
 25c:	11bc                	.insn	2, 0x11bc
 25e:	0040                	.insn	2, 0x0040
 260:	11c0                	.insn	2, 0x11c0
 262:	0040                	.insn	2, 0x0040
 264:	11c8                	.insn	2, 0x11c8
 266:	0040                	.insn	2, 0x0040
	...
 270:	0a88                	.insn	2, 0x0a88
 272:	0040                	.insn	2, 0x0040
 274:	1280                	.insn	2, 0x1280
 276:	0040                	.insn	2, 0x0040
 278:	0000                	.insn	2, 0x0000
 27a:	0040                	.insn	2, 0x0040
 27c:	001c                	.insn	2, 0x001c
 27e:	0040                	.insn	2, 0x0040
	...

00000288 <$d.6>:
 288:	02f4                	.insn	2, 0x02f4
 28a:	0000                	.insn	2, 0x0000
 28c:	031c                	.insn	2, 0x031c
 28e:	0000                	.insn	2, 0x0000
 290:	0328                	.insn	2, 0x0328
 292:	0000                	.insn	2, 0x0000
 294:	04b8                	.insn	2, 0x04b8
	...
 29e:	0000                	.insn	2, 0x0000
 2a0:	02f4                	.insn	2, 0x02f4
 2a2:	0000                	.insn	2, 0x0000
 2a4:	0300                	.insn	2, 0x0300
 2a6:	0000                	.insn	2, 0x0000
 2a8:	0420                	.insn	2, 0x0420
 2aa:	0000                	.insn	2, 0x0000
 2ac:	0424                	.insn	2, 0x0424
 2ae:	0000                	.insn	2, 0x0000
 2b0:	042c                	.insn	2, 0x042c
 2b2:	0000                	.insn	2, 0x0000
 2b4:	0450                	.insn	2, 0x0450
	...
 2be:	0000                	.insn	2, 0x0000
 2c0:	033c                	.insn	2, 0x033c
 2c2:	0000                	.insn	2, 0x0000
 2c4:	039c                	.insn	2, 0x039c
 2c6:	0000                	.insn	2, 0x0000
 2c8:	03a8                	.insn	2, 0x03a8
 2ca:	0000                	.insn	2, 0x0000
 2cc:	0418                	.insn	2, 0x0418
	...
 2d6:	0000                	.insn	2, 0x0000
 2d8:	058c                	.insn	2, 0x058c
 2da:	0000                	.insn	2, 0x0000
 2dc:	05f8                	.insn	2, 0x05f8
 2de:	0000                	.insn	2, 0x0000
 2e0:	0604                	.insn	2, 0x0604
 2e2:	0000                	.insn	2, 0x0000
 2e4:	0734                	.insn	2, 0x0734
	...
 2ee:	0000                	.insn	2, 0x0000
 2f0:	0618                	.insn	2, 0x0618
 2f2:	0000                	.insn	2, 0x0000
 2f4:	0654                	.insn	2, 0x0654
 2f6:	0000                	.insn	2, 0x0000
 2f8:	0660                	.insn	2, 0x0660
 2fa:	0000                	.insn	2, 0x0000
 2fc:	06d8                	.insn	2, 0x06d8
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
  20:	5f646d63          	bltu	s0,s6,61a <$d.3+0xcb>
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
  3e:	6e756f63          	bltu	a0,t2,73c <$d.3+0x1ed>
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
  7a:	0074756f          	jal	a0,47880 <$d.5+0x46434>
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
  96:	635f746f          	jal	s0,f7eca <$d.5+0xf6a7e>
  9a:	756c                	.insn	2, 0x756c
  9c:	72657473          	csrrci	s0,mhpmevent6h,10
  a0:	6300                	.insn	2, 0x6300
  a2:	756c                	.insn	2, 0x756c
  a4:	72657473          	csrrci	s0,mhpmevent6h,10
  a8:	6c00                	.insn	2, 0x6c00
  aa:	6162                	.insn	2, 0x6162
  ac:	6200                	.insn	2, 0x6200
  ae:	006c6f6f          	jal	t5,c60b4 <$d.5+0xc4c68>
  b2:	3261                	.insn	2, 0x3261
  b4:	6200                	.insn	2, 0x6200
  b6:	6675                	.insn	2, 0x6675
  b8:	6400                	.insn	2, 0x6400
  ba:	7461                	.insn	2, 0x7461
  bc:	5f61                	.insn	2, 0x5f61
  be:	6562                	.insn	2, 0x6562
  c0:	006e6967          	.insn	4, 0x006e6967
  c4:	0076                	.insn	2, 0x0076
  c6:	6c6c6163          	bltu	s8,t1,788 <$d.3+0x239>
  ca:	735f 5f64 6572      	.insn	6, 0x65725f64735f
  d0:	6461                	.insn	2, 0x6461
  d2:	615f 6970 7300      	.insn	6, 0x73006970615f
  d8:	6372                	.insn	2, 0x6372
  da:	6573752f          	.insn	4, 0x6573752f
  de:	2e72                	.insn	2, 0x2e72
  e0:	72700063          	beq	zero,t2,800 <$d.3+0x2b1>
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
 106:	6d630063          	beq	t1,s6,7c6 <$d.3+0x277>
 10a:	6c64                	.insn	2, 0x6c64
 10c:	6e69                	.insn	2, 0x6e69
 10e:	0065                	.insn	2, 0x0065
 110:	696d                	.insn	2, 0x696d
 112:	70615f63          	bge	sp,t1,830 <$d.3+0x2e1>
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
 1c6:	73006c63          	bltu	zero,a6,8fe <$d.11+0x23>
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
 1fc:	72616863          	bltu	sp,t1,92c <$d.11+0x51>
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
 22a:	72502f6f          	jal	t5,314e <$d.5+0x1d02>
 22e:	6172676f          	jal	a4,27044 <$d.5+0x25bf8>
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
 266:	6c5f746f          	jal	s0,f812a <$d.5+0xf6cde>
 26a:	6162                	.insn	2, 0x6162
 26c:	6300                	.insn	2, 0x6300
 26e:	6c61                	.insn	2, 0x6c61
 270:	5f6c                	.insn	2, 0x5f6c
 272:	696d                	.insn	2, 0x696d
 274:	70615f63          	bge	sp,t1,992 <$d.5+0x4d>
 278:	0069                	.insn	2, 0x0069
 27a:	6176                	.insn	2, 0x6176
 27c:	756c                	.insn	2, 0x756c
 27e:	0065                	.insn	2, 0x0065
 280:	6c6c6163          	bltu	s8,t1,942 <$d.11+0x67>
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
 2c6:	34610063          	beq	sp,t1,606 <$d.3+0xb7>
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
 34a:	685f6c63          	bltu	t5,t0,9e2 <$d.5+0x9d>
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
 384:	6600726f          	jal	tp,79e4 <$d.5+0x6598>
 388:	746d                	.insn	2, 0x746d
 38a:	6700                	.insn	2, 0x6700
 38c:	7465                	.insn	2, 0x7465
 38e:	72616863          	bltu	sp,t1,abe <$d.5+0x179>
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
 3cc:	72616863          	bltu	sp,t1,afc <$d.5+0x1b7>
 3d0:	7000                	.insn	2, 0x7000
 3d2:	7261                	.insn	2, 0x7261
 3d4:	755f6573          	csrrsi	a0,0x755,30
 3d8:	65003233          	.insn	4, 0x65003233
 3dc:	6978                	.insn	2, 0x6978
 3de:	0074                	.insn	2, 0x0074
 3e0:	61006863          	bltu	zero,a6,9f0 <$d.5+0xab>
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
   8:	6e616c63          	bltu	sp,t1,700 <$d.3+0x1b1>
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
  1e:	32727363          	bgeu	tp,t2,344 <$d.6+0xbc>
  22:	3070                	.insn	2, 0x3070
  24:	7a5f 6669 6e65      	.insn	6, 0x6e6566697a5f
  2a:	32696563          	bltu	s2,t1,354 <$d.6+0xcc>
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
  20:	08e4                	.insn	2, 0x08e4
  22:	0000                	.insn	2, 0x0000
  24:	0e44                	.insn	2, 0x0e44
  26:	0280                	.insn	2, 0x0280
  28:	8174                	.insn	2, 0x8174
  2a:	8801                	.insn	2, 0x8801
  2c:	8902                	.insn	2, 0x8902
  2e:	93049203          	lh	tp,-1744(s1) # 21a <$d.4+0x28>
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
  4c:	0900                	.insn	2, 0x0900
  4e:	0040                	.insn	2, 0x0040
  50:	00cc                	.insn	2, 0x00cc
  52:	0000                	.insn	2, 0x0000
  54:	001c                	.insn	2, 0x001c
  56:	0000                	.insn	2, 0x0000
  58:	0000                	.insn	2, 0x0000
  5a:	0000                	.insn	2, 0x0000
  5c:	09cc                	.insn	2, 0x09cc
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
  90:	0a88                	.insn	2, 0x0a88
  92:	0040                	.insn	2, 0x0040
  94:	0018                	.insn	2, 0x0018
  96:	0000                	.insn	2, 0x0000
  98:	0010                	.insn	2, 0x0010
  9a:	0000                	.insn	2, 0x0000
  9c:	0074                	.insn	2, 0x0074
  9e:	0000                	.insn	2, 0x0000
  a0:	0aa0                	.insn	2, 0x0aa0
  a2:	0040                	.insn	2, 0x0040
  a4:	0304                	.insn	2, 0x0304
  a6:	0000                	.insn	2, 0x0000
  a8:	0e44                	.insn	2, 0x0e44
  aa:	0060                	.insn	2, 0x0060
  ac:	000c                	.insn	2, 0x000c
  ae:	0000                	.insn	2, 0x0000
  b0:	0074                	.insn	2, 0x0074
  b2:	0000                	.insn	2, 0x0000
  b4:	0da4                	.insn	2, 0x0da4
  b6:	0040                	.insn	2, 0x0040
  b8:	0014                	.insn	2, 0x0014
  ba:	0000                	.insn	2, 0x0000
  bc:	000c                	.insn	2, 0x000c
  be:	0000                	.insn	2, 0x0000
  c0:	0074                	.insn	2, 0x0074
  c2:	0000                	.insn	2, 0x0000
  c4:	0db8                	.insn	2, 0x0db8
  c6:	0040                	.insn	2, 0x0040
  c8:	0014                	.insn	2, 0x0014
  ca:	0000                	.insn	2, 0x0000
  cc:	000c                	.insn	2, 0x000c
  ce:	0000                	.insn	2, 0x0000
  d0:	0074                	.insn	2, 0x0074
  d2:	0000                	.insn	2, 0x0000
  d4:	0dcc                	.insn	2, 0x0dcc
  d6:	0040                	.insn	2, 0x0040
  d8:	000c                	.insn	2, 0x000c
  da:	0000                	.insn	2, 0x0000
  dc:	000c                	.insn	2, 0x000c
  de:	0000                	.insn	2, 0x0000
  e0:	0074                	.insn	2, 0x0074
  e2:	0000                	.insn	2, 0x0000
  e4:	0dd8                	.insn	2, 0x0dd8
  e6:	0040                	.insn	2, 0x0040
  e8:	000c                	.insn	2, 0x000c
  ea:	0000                	.insn	2, 0x0000
  ec:	000c                	.insn	2, 0x000c
  ee:	0000                	.insn	2, 0x0000
  f0:	0074                	.insn	2, 0x0074
  f2:	0000                	.insn	2, 0x0000
  f4:	0de4                	.insn	2, 0x0de4
  f6:	0040                	.insn	2, 0x0040
  f8:	000c                	.insn	2, 0x000c
  fa:	0000                	.insn	2, 0x0000
  fc:	000c                	.insn	2, 0x000c
  fe:	0000                	.insn	2, 0x0000
 100:	0074                	.insn	2, 0x0074
 102:	0000                	.insn	2, 0x0000
 104:	0df0                	.insn	2, 0x0df0
 106:	0040                	.insn	2, 0x0040
 108:	000c                	.insn	2, 0x000c
 10a:	0000                	.insn	2, 0x0000
 10c:	000c                	.insn	2, 0x000c
 10e:	0000                	.insn	2, 0x0000
 110:	0074                	.insn	2, 0x0074
 112:	0000                	.insn	2, 0x0000
 114:	0dfc                	.insn	2, 0x0dfc
 116:	0040                	.insn	2, 0x0040
 118:	0034                	.insn	2, 0x0034
 11a:	0000                	.insn	2, 0x0000
 11c:	000c                	.insn	2, 0x000c
 11e:	0000                	.insn	2, 0x0000
 120:	0074                	.insn	2, 0x0074
 122:	0000                	.insn	2, 0x0000
 124:	0e30                	.insn	2, 0x0e30
 126:	0040                	.insn	2, 0x0040
 128:	0040                	.insn	2, 0x0040
 12a:	0000                	.insn	2, 0x0000
 12c:	001c                	.insn	2, 0x001c
 12e:	0000                	.insn	2, 0x0000
 130:	0074                	.insn	2, 0x0074
 132:	0000                	.insn	2, 0x0000
 134:	0e70                	.insn	2, 0x0e70
 136:	0040                	.insn	2, 0x0040
 138:	02bc                	.insn	2, 0x02bc
 13a:	0000                	.insn	2, 0x0000
 13c:	0e44                	.insn	2, 0x0e44
 13e:	5450                	.insn	2, 0x5450
 140:	0988                	.insn	2, 0x0988
 142:	0a89                	.insn	2, 0x0a89
 144:	0b92                	.insn	2, 0x0b92
 146:	0d940c93          	addi	s9,s0,217 # 1198f <$d.5+0x10543>
 14a:	0000                	.insn	2, 0x0000
 14c:	000c                	.insn	2, 0x000c
 14e:	0000                	.insn	2, 0x0000
 150:	0074                	.insn	2, 0x0074
 152:	0000                	.insn	2, 0x0000
 154:	112c                	.insn	2, 0x112c
 156:	0040                	.insn	2, 0x0040
 158:	00a8                	.insn	2, 0x00a8
 15a:	0000                	.insn	2, 0x0000
 15c:	0018                	.insn	2, 0x0018
 15e:	0000                	.insn	2, 0x0000
 160:	0074                	.insn	2, 0x0074
 162:	0000                	.insn	2, 0x0000
 164:	11d4                	.insn	2, 0x11d4
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
 180:	1240                	.insn	2, 0x1240
 182:	0040                	.insn	2, 0x0040
 184:	0014                	.insn	2, 0x0014
 186:	0000                	.insn	2, 0x0000
 188:	000c                	.insn	2, 0x000c
 18a:	0000                	.insn	2, 0x0000
 18c:	0074                	.insn	2, 0x0074
 18e:	0000                	.insn	2, 0x0000
 190:	1254                	.insn	2, 0x1254
 192:	0040                	.insn	2, 0x0040
 194:	0014                	.insn	2, 0x0014
 196:	0000                	.insn	2, 0x0000
 198:	000c                	.insn	2, 0x000c
 19a:	0000                	.insn	2, 0x0000
 19c:	0074                	.insn	2, 0x0074
 19e:	0000                	.insn	2, 0x0000
 1a0:	1268                	.insn	2, 0x1268
 1a2:	0040                	.insn	2, 0x0040
 1a4:	000c                	.insn	2, 0x000c
 1a6:	0000                	.insn	2, 0x0000
 1a8:	000c                	.insn	2, 0x000c
 1aa:	0000                	.insn	2, 0x0000
 1ac:	0074                	.insn	2, 0x0074
 1ae:	0000                	.insn	2, 0x0000
 1b0:	1274                	.insn	2, 0x1274
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
 1e4:	1280                	.insn	2, 0x1280
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
 200:	136c                	.insn	2, 0x136c
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
 21c:	1494                	.insn	2, 0x1494
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
 248:	1738                	.insn	2, 0x1738
 24a:	0040                	.insn	2, 0x0040
 24c:	0020                	.insn	2, 0x0020
 24e:	0000                	.insn	2, 0x0000
 250:	0020                	.insn	2, 0x0020
 252:	0000                	.insn	2, 0x0000
 254:	01c8                	.insn	2, 0x01c8
 256:	0000                	.insn	2, 0x0000
 258:	1758                	.insn	2, 0x1758
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
       0:	000008d7          	.insn	4, 0x08d7
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
      60:	0191                	.insn	2, 0x0191
      62:	b809                	.insn	2, 0xb809
      64:	0101                	.insn	2, 0x0101
      66:	0306                	.insn	2, 0x0306
      68:	08097eef          	jal	t4,970e8 <$d.5+0x95c9c>
      6c:	0100                	.insn	2, 0x0100
      6e:	0905                	.insn	2, 0x0905
      70:	0306                	.insn	2, 0x0306
      72:	091d                	.insn	2, 0x091d
      74:	0004                	.insn	2, 0x0004
      76:	0501                	.insn	2, 0x0501
      78:	0618                	.insn	2, 0x0618
      7a:	0c090003          	lb	zero,192(s2)
      7e:	0100                	.insn	2, 0x0100
      80:	2605                	.insn	2, 0x2605
      82:	0c090003          	lb	zero,192(s2)
      86:	0100                	.insn	2, 0x0100
      88:	3405                	.insn	2, 0x3405
      8a:	0c090003          	lb	zero,192(s2)
      8e:	0100                	.insn	2, 0x0100
      90:	4205                	.insn	2, 0x4205
      92:	0c090003          	lb	zero,192(s2)
      96:	0100                	.insn	2, 0x0100
      98:	0905                	.insn	2, 0x0905
      9a:	0306                	.insn	2, 0x0306
      9c:	0902                	.insn	2, 0x0902
      9e:	000c                	.insn	2, 0x000c
      a0:	0301                	.insn	2, 0x0301
      a2:	0901                	.insn	2, 0x0901
      a4:	000c                	.insn	2, 0x000c
      a6:	0301                	.insn	2, 0x0301
      a8:	0901                	.insn	2, 0x0901
      aa:	000c                	.insn	2, 0x000c
      ac:	0301                	.insn	2, 0x0301
      ae:	0901                	.insn	2, 0x0901
      b0:	000c                	.insn	2, 0x000c
      b2:	0301                	.insn	2, 0x0301
      b4:	0901                	.insn	2, 0x0901
      b6:	000c                	.insn	2, 0x000c
      b8:	0301                	.insn	2, 0x0301
      ba:	0901                	.insn	2, 0x0901
      bc:	000c                	.insn	2, 0x000c
      be:	0301                	.insn	2, 0x0301
      c0:	0901                	.insn	2, 0x0901
      c2:	000c                	.insn	2, 0x000c
      c4:	0301                	.insn	2, 0x0301
      c6:	0901                	.insn	2, 0x0901
      c8:	000c                	.insn	2, 0x000c
      ca:	0301                	.insn	2, 0x0301
      cc:	0902                	.insn	2, 0x0902
      ce:	000c                	.insn	2, 0x000c
      d0:	0501                	.insn	2, 0x0501
      d2:	0618                	.insn	2, 0x0618
      d4:	0c090003          	lb	zero,192(s2)
      d8:	0100                	.insn	2, 0x0100
      da:	2605                	.insn	2, 0x2605
      dc:	0c090003          	lb	zero,192(s2)
      e0:	0100                	.insn	2, 0x0100
      e2:	0c095803          	lhu	a6,192(s2)
      e6:	0100                	.insn	2, 0x0100
      e8:	1905                	.insn	2, 0x1905
      ea:	0306                	.insn	2, 0x0306
      ec:	00d4                	.insn	2, 0x00d4
      ee:	1809                	.insn	2, 0x1809
      f0:	0100                	.insn	2, 0x0100
      f2:	1505                	.insn	2, 0x1505
      f4:	04090103          	lb	sp,64(s2)
      f8:	0100                	.insn	2, 0x0100
      fa:	1b05                	.insn	2, 0x1b05
      fc:	04095f03          	lhu	t5,64(s2)
     100:	0100                	.insn	2, 0x0100
     102:	2a05                	.insn	2, 0x2a05
     104:	08090203          	lb	tp,128(s2)
     108:	0100                	.insn	2, 0x0100
     10a:	1b05                	.insn	2, 0x1b05
     10c:	04097e03          	.insn	4, 0x04097e03
     110:	0100                	.insn	2, 0x0100
     112:	1105                	.insn	2, 0x1105
     114:	04090503          	lb	a0,64(s2)
     118:	0100                	.insn	2, 0x0100
     11a:	0005                	.insn	2, 0x0005
     11c:	0306                	.insn	2, 0x0306
     11e:	00040947          	.insn	4, 0x00040947
     122:	0501                	.insn	2, 0x0501
     124:	0311                	.insn	2, 0x0311
     126:	0939                	.insn	2, 0x0939
     128:	0004                	.insn	2, 0x0004
     12a:	0601                	.insn	2, 0x0601
     12c:	04090103          	lb	sp,64(s2)
     130:	0100                	.insn	2, 0x0100
     132:	0005                	.insn	2, 0x0005
     134:	0306                	.insn	2, 0x0306
     136:	0946                	.insn	2, 0x0946
     138:	000c                	.insn	2, 0x000c
     13a:	0501                	.insn	2, 0x0501
     13c:	0611                	.insn	2, 0x0611
     13e:	10093e03          	.insn	4, 0x10093e03
     142:	0100                	.insn	2, 0x0100
     144:	04090103          	lb	sp,64(s2)
     148:	0100                	.insn	2, 0x0100
     14a:	0005                	.insn	2, 0x0005
     14c:	0306                	.insn	2, 0x0306
     14e:	0941                	.insn	2, 0x0941
     150:	000c                	.insn	2, 0x000c
     152:	0501                	.insn	2, 0x0501
     154:	0616                	.insn	2, 0x0616
     156:	0900c803          	lbu	a6,144(ra) # 1170a <$d.5+0x102be>
     15a:	0004                	.insn	2, 0x0004
     15c:	0501                	.insn	2, 0x0501
     15e:	0311                	.insn	2, 0x0311
     160:	0902                	.insn	2, 0x0902
     162:	0008                	.insn	2, 0x0008
     164:	0501                	.insn	2, 0x0501
     166:	031c                	.insn	2, 0x031c
     168:	0905                	.insn	2, 0x0905
     16a:	0004                	.insn	2, 0x0004
     16c:	0501                	.insn	2, 0x0501
     16e:	0319                	.insn	2, 0x0319
     170:	0905                	.insn	2, 0x0905
     172:	0008                	.insn	2, 0x0008
     174:	0601                	.insn	2, 0x0601
     176:	097fac03          	lw	s8,151(t6)
     17a:	0008                	.insn	2, 0x0008
     17c:	0301                	.insn	2, 0x0301
     17e:	00d4                	.insn	2, 0x00d4
     180:	0809                	.insn	2, 0x0809
     182:	0100                	.insn	2, 0x0100
     184:	097fac03          	lw	s8,151(t6)
     188:	0008                	.insn	2, 0x0008
     18a:	0501                	.insn	2, 0x0501
     18c:	0611                	.insn	2, 0x0611
     18e:	0900ed03          	.insn	4, 0x0900ed03
     192:	0008                	.insn	2, 0x0008
     194:	0501                	.insn	2, 0x0501
     196:	030d                	.insn	2, 0x030d
     198:	0906                	.insn	2, 0x0906
     19a:	0008                	.insn	2, 0x0008
     19c:	0501                	.insn	2, 0x0501
     19e:	0618                	.insn	2, 0x0618
     1a0:	08090003          	lb	zero,128(s2)
     1a4:	0100                	.insn	2, 0x0100
     1a6:	1c05                	.insn	2, 0x1c05
     1a8:	04090003          	lb	zero,64(s2)
     1ac:	0100                	.insn	2, 0x0100
     1ae:	1805                	.insn	2, 0x1805
     1b0:	0306                	.insn	2, 0x0306
     1b2:	00080963          	beqz	a6,1c4 <$d.6+0x8a>
     1b6:	0501                	.insn	2, 0x0501
     1b8:	0315                	.insn	2, 0x0315
     1ba:	00040903          	lb	s2,0(s0)
     1be:	0301                	.insn	2, 0x0301
     1c0:	0901                	.insn	2, 0x0901
     1c2:	000c                	.insn	2, 0x000c
     1c4:	0601                	.insn	2, 0x0601
     1c6:	097fa603          	lw	a2,151(t6)
     1ca:	000c                	.insn	2, 0x000c
     1cc:	0501                	.insn	2, 0x0501
     1ce:	0611                	.insn	2, 0x0611
     1d0:	0900e303          	.insn	4, 0x0900e303
     1d4:	0008                	.insn	2, 0x0008
     1d6:	0301                	.insn	2, 0x0301
     1d8:	0901                	.insn	2, 0x0901
     1da:	000c                	.insn	2, 0x000c
     1dc:	0501                	.insn	2, 0x0501
     1de:	061e                	.insn	2, 0x061e
     1e0:	08090003          	lb	zero,128(s2)
     1e4:	0100                	.insn	2, 0x0100
     1e6:	097f9c03          	lh	s8,151(t6)
     1ea:	0008                	.insn	2, 0x0008
     1ec:	0501                	.insn	2, 0x0501
     1ee:	062a                	.insn	2, 0x062a
     1f0:	09018103          	lb	sp,144(gp) # 1550 <$d.5+0x104>
     1f4:	0008                	.insn	2, 0x0008
     1f6:	0501                	.insn	2, 0x0501
     1f8:	0610                	.insn	2, 0x0610
     1fa:	04090003          	lb	zero,64(s2)
     1fe:	0100                	.insn	2, 0x0100
     200:	097eff03          	.insn	4, 0x097eff03
     204:	0008                	.insn	2, 0x0008
     206:	0501                	.insn	2, 0x0501
     208:	0616                	.insn	2, 0x0616
     20a:	09018403          	lb	s0,144(gp)
     20e:	001c                	.insn	2, 0x001c
     210:	0501                	.insn	2, 0x0501
     212:	060d                	.insn	2, 0x060d
     214:	04090003          	lb	zero,64(s2)
     218:	0100                	.insn	2, 0x0100
     21a:	1a05                	.insn	2, 0x1a05
     21c:	08090003          	lb	zero,128(s2)
     220:	0100                	.insn	2, 0x0100
     222:	0d05                	.insn	2, 0x0d05
     224:	0306                	.insn	2, 0x0306
     226:	0902                	.insn	2, 0x0902
     228:	0004                	.insn	2, 0x0004
     22a:	0501                	.insn	2, 0x0501
     22c:	0614                	.insn	2, 0x0614
     22e:	04090003          	lb	zero,64(s2)
     232:	0100                	.insn	2, 0x0100
     234:	1705                	.insn	2, 0x1705
     236:	04090003          	lb	zero,64(s2)
     23a:	0100                	.insn	2, 0x0100
     23c:	3405                	.insn	2, 0x3405
     23e:	0c090003          	lb	zero,192(s2)
     242:	0100                	.insn	2, 0x0100
     244:	0d05                	.insn	2, 0x0d05
     246:	04090003          	lb	zero,64(s2)
     24a:	0100                	.insn	2, 0x0100
     24c:	1405                	.insn	2, 0x1405
     24e:	04090003          	lb	zero,64(s2)
     252:	0100                	.insn	2, 0x0100
     254:	1205                	.insn	2, 0x1205
     256:	0306                	.insn	2, 0x0306
     258:	000c0903          	lb	s2,0(s8)
     25c:	0501                	.insn	2, 0x0501
     25e:	0600                	.insn	2, 0x0600
     260:	097ef703          	.insn	4, 0x097ef703
     264:	0008                	.insn	2, 0x0008
     266:	0501                	.insn	2, 0x0501
     268:	0614                	.insn	2, 0x0614
     26a:	09018a03          	lb	s4,144(gp)
     26e:	0004                	.insn	2, 0x0004
     270:	0501                	.insn	2, 0x0501
     272:	061e                	.insn	2, 0x061e
     274:	04090003          	lb	zero,64(s2)
     278:	0100                	.insn	2, 0x0100
     27a:	0905                	.insn	2, 0x0905
     27c:	0306                	.insn	2, 0x0306
     27e:	0979                	.insn	2, 0x0979
     280:	0008                	.insn	2, 0x0008
     282:	0501                	.insn	2, 0x0501
     284:	0314                	.insn	2, 0x0314
     286:	090d                	.insn	2, 0x090d
     288:	0008                	.insn	2, 0x0008
     28a:	0501                	.insn	2, 0x0501
     28c:	060d                	.insn	2, 0x060d
     28e:	0c090003          	lb	zero,192(s2)
     292:	0100                	.insn	2, 0x0100
     294:	08090003          	lb	zero,128(s2)
     298:	0100                	.insn	2, 0x0100
     29a:	1405                	.insn	2, 0x1405
     29c:	0306                	.insn	2, 0x0306
     29e:	0904                	.insn	2, 0x0904
     2a0:	0004                	.insn	2, 0x0004
     2a2:	0601                	.insn	2, 0x0601
     2a4:	10090003          	lb	zero,256(s2)
     2a8:	0100                	.insn	2, 0x0100
     2aa:	0306                	.insn	2, 0x0306
     2ac:	091d                	.insn	2, 0x091d
     2ae:	0004                	.insn	2, 0x0004
     2b0:	0601                	.insn	2, 0x0601
     2b2:	097ecf03          	lbu	t5,151(t4)
     2b6:	0010                	.insn	2, 0x0010
     2b8:	0301                	.insn	2, 0x0301
     2ba:	01b1                	.insn	2, 0x01b1
     2bc:	0409                	.insn	2, 0x0409
     2be:	0100                	.insn	2, 0x0100
     2c0:	0306                	.insn	2, 0x0306
     2c2:	090c                	.insn	2, 0x090c
     2c4:	0004                	.insn	2, 0x0004
     2c6:	0601                	.insn	2, 0x0601
     2c8:	10090003          	lb	zero,256(s2)
     2cc:	0100                	.insn	2, 0x0100
     2ce:	0306                	.insn	2, 0x0306
     2d0:	0905                	.insn	2, 0x0905
     2d2:	0004                	.insn	2, 0x0004
     2d4:	0601                	.insn	2, 0x0601
     2d6:	10090003          	lb	zero,256(s2)
     2da:	0100                	.insn	2, 0x0100
     2dc:	0306                	.insn	2, 0x0306
     2de:	090d                	.insn	2, 0x090d
     2e0:	0004                	.insn	2, 0x0004
     2e2:	0601                	.insn	2, 0x0601
     2e4:	10090003          	lb	zero,256(s2)
     2e8:	0100                	.insn	2, 0x0100
     2ea:	0306                	.insn	2, 0x0306
     2ec:	090a                	.insn	2, 0x090a
     2ee:	0004                	.insn	2, 0x0004
     2f0:	0601                	.insn	2, 0x0601
     2f2:	10090003          	lb	zero,256(s2)
     2f6:	0100                	.insn	2, 0x0100
     2f8:	0306                	.insn	2, 0x0306
     2fa:	090a                	.insn	2, 0x090a
     2fc:	0004                	.insn	2, 0x0004
     2fe:	0601                	.insn	2, 0x0601
     300:	10090003          	lb	zero,256(s2)
     304:	0100                	.insn	2, 0x0100
     306:	0306                	.insn	2, 0x0306
     308:	090e                	.insn	2, 0x090e
     30a:	0004                	.insn	2, 0x0004
     30c:	0601                	.insn	2, 0x0601
     30e:	10090003          	lb	zero,256(s2)
     312:	0100                	.insn	2, 0x0100
     314:	0306                	.insn	2, 0x0306
     316:	090e                	.insn	2, 0x090e
     318:	0004                	.insn	2, 0x0004
     31a:	0601                	.insn	2, 0x0601
     31c:	10090003          	lb	zero,256(s2)
     320:	0100                	.insn	2, 0x0100
     322:	0306                	.insn	2, 0x0306
     324:	0905                	.insn	2, 0x0905
     326:	0004                	.insn	2, 0x0004
     328:	0601                	.insn	2, 0x0601
     32a:	10090003          	lb	zero,256(s2)
     32e:	0100                	.insn	2, 0x0100
     330:	0306                	.insn	2, 0x0306
     332:	090a                	.insn	2, 0x090a
     334:	0004                	.insn	2, 0x0004
     336:	0601                	.insn	2, 0x0601
     338:	10090003          	lb	zero,256(s2)
     33c:	0100                	.insn	2, 0x0100
     33e:	0306                	.insn	2, 0x0306
     340:	0004090b          	.insn	4, 0x0004090b
     344:	0501                	.insn	2, 0x0501
     346:	0631                	.insn	2, 0x0631
     348:	10090003          	lb	zero,256(s2)
     34c:	0100                	.insn	2, 0x0100
     34e:	1405                	.insn	2, 0x1405
     350:	0306                	.insn	2, 0x0306
     352:	0901                	.insn	2, 0x0901
     354:	0004                	.insn	2, 0x0004
     356:	0501                	.insn	2, 0x0501
     358:	0631                	.insn	2, 0x0631
     35a:	10090003          	lb	zero,256(s2)
     35e:	0100                	.insn	2, 0x0100
     360:	1405                	.insn	2, 0x1405
     362:	0306                	.insn	2, 0x0306
     364:	0901                	.insn	2, 0x0901
     366:	0004                	.insn	2, 0x0004
     368:	0301                	.insn	2, 0x0301
     36a:	097e                	.insn	2, 0x097e
     36c:	0010                	.insn	2, 0x0010
     36e:	0601                	.insn	2, 0x0601
     370:	097de703          	.insn	4, 0x097de703
     374:	0004                	.insn	2, 0x0004
     376:	0501                	.insn	2, 0x0501
     378:	060d                	.insn	2, 0x060d
     37a:	09029f03          	lh	t5,144(t0) # 4da <$d.4+0xc>
     37e:	0004                	.insn	2, 0x0004
     380:	0601                	.insn	2, 0x0601
     382:	097de103          	.insn	4, 0x097de103
     386:	000c                	.insn	2, 0x000c
     388:	0501                	.insn	2, 0x0501
     38a:	0611                	.insn	2, 0x0611
     38c:	09019a03          	lh	s4,144(gp)
     390:	0008                	.insn	2, 0x0008
     392:	0501                	.insn	2, 0x0501
     394:	031f 0901 0004      	.insn	6, 0x00040901031f
     39a:	0501                	.insn	2, 0x0501
     39c:	0305                	.insn	2, 0x0305
     39e:	01a0                	.insn	2, 0x01a0
     3a0:	0409                	.insn	2, 0x0409
     3a2:	0100                	.insn	2, 0x0100
     3a4:	0306                	.insn	2, 0x0306
     3a6:	7dc5                	.insn	2, 0x7dc5
     3a8:	0409                	.insn	2, 0x0409
     3aa:	0100                	.insn	2, 0x0100
     3ac:	0902bb03          	.insn	4, 0x0902bb03
     3b0:	000c                	.insn	2, 0x000c
     3b2:	0501                	.insn	2, 0x0501
     3b4:	030c                	.insn	2, 0x030c
     3b6:	0900                	.insn	2, 0x0900
     3b8:	0004                	.insn	2, 0x0004
     3ba:	0501                	.insn	2, 0x0501
     3bc:	0316                	.insn	2, 0x0316
     3be:	0900                	.insn	2, 0x0900
     3c0:	0004                	.insn	2, 0x0004
     3c2:	0501                	.insn	2, 0x0501
     3c4:	0619                	.insn	2, 0x0619
     3c6:	10090303          	lb	t1,256(s2)
     3ca:	0100                	.insn	2, 0x0100
     3cc:	2505                	.insn	2, 0x2505
     3ce:	0306                	.insn	2, 0x0306
     3d0:	0900                	.insn	2, 0x0900
     3d2:	0004                	.insn	2, 0x0004
     3d4:	0501                	.insn	2, 0x0501
     3d6:	060a                	.insn	2, 0x060a
     3d8:	0c090103          	lb	sp,192(s2)
     3dc:	0100                	.insn	2, 0x0100
     3de:	0306                	.insn	2, 0x0306
     3e0:	7dc1                	.insn	2, 0x7dc1
     3e2:	0409                	.insn	2, 0x0409
     3e4:	0100                	.insn	2, 0x0100
     3e6:	1105                	.insn	2, 0x1105
     3e8:	0306                	.insn	2, 0x0306
     3ea:	080901b3          	.insn	4, 0x080901b3
     3ee:	0100                	.insn	2, 0x0100
     3f0:	2105                	.insn	2, 0x2105
     3f2:	04090103          	lb	sp,64(s2)
     3f6:	0100                	.insn	2, 0x0100
     3f8:	1705                	.insn	2, 0x1705
     3fa:	0306                	.insn	2, 0x0306
     3fc:	0900                	.insn	2, 0x0900
     3fe:	0004                	.insn	2, 0x0004
     400:	0301                	.insn	2, 0x0301
     402:	7ecc                	.insn	2, 0x7ecc
     404:	0c09                	.insn	2, 0x0c09
     406:	0100                	.insn	2, 0x0100
     408:	1505                	.insn	2, 0x1505
     40a:	0306                	.insn	2, 0x0306
     40c:	01b5                	.insn	2, 0x01b5
     40e:	0809                	.insn	2, 0x0809
     410:	0100                	.insn	2, 0x0100
     412:	0306                	.insn	2, 0x0306
     414:	08097ecb          	.insn	4, 0x08097ecb
     418:	0100                	.insn	2, 0x0100
     41a:	0d05                	.insn	2, 0x0d05
     41c:	0306                	.insn	2, 0x0306
     41e:	01a6                	.insn	2, 0x01a6
     420:	0809                	.insn	2, 0x0809
     422:	0100                	.insn	2, 0x0100
     424:	0306                	.insn	2, 0x0306
     426:	7eda                	.insn	2, 0x7eda
     428:	0809                	.insn	2, 0x0809
     42a:	0100                	.insn	2, 0x0100
     42c:	0905                	.insn	2, 0x0905
     42e:	0306                	.insn	2, 0x0306
     430:	080902bf 03060100 	.insn	8, 0x03060100080902bf
     438:	7dc1                	.insn	2, 0x7dc1
     43a:	0409                	.insn	2, 0x0409
     43c:	0100                	.insn	2, 0x0100
     43e:	1105                	.insn	2, 0x1105
     440:	0306                	.insn	2, 0x0306
     442:	01c4                	.insn	2, 0x01c4
     444:	0809                	.insn	2, 0x0809
     446:	0100                	.insn	2, 0x0100
     448:	2805                	.insn	2, 0x2805
     44a:	04090103          	lb	sp,64(s2)
     44e:	0100                	.insn	2, 0x0100
     450:	1e05                	.insn	2, 0x1e05
     452:	0306                	.insn	2, 0x0306
     454:	0900                	.insn	2, 0x0900
     456:	0004                	.insn	2, 0x0004
     458:	0301                	.insn	2, 0x0301
     45a:	0c097ebb          	.insn	4, 0x0c097ebb
     45e:	0100                	.insn	2, 0x0100
     460:	1505                	.insn	2, 0x1505
     462:	0306                	.insn	2, 0x0306
     464:	01c6                	.insn	2, 0x01c6
     466:	0409                	.insn	2, 0x0409
     468:	0100                	.insn	2, 0x0100
     46a:	0306                	.insn	2, 0x0306
     46c:	7eba                	.insn	2, 0x7eba
     46e:	0c09                	.insn	2, 0x0c09
     470:	0100                	.insn	2, 0x0100
     472:	0d05                	.insn	2, 0x0d05
     474:	0306                	.insn	2, 0x0306
     476:	01ba                	.insn	2, 0x01ba
     478:	0409                	.insn	2, 0x0409
     47a:	0100                	.insn	2, 0x0100
     47c:	0306                	.insn	2, 0x0306
     47e:	7ec6                	.insn	2, 0x7ec6
     480:	0c09                	.insn	2, 0x0c09
     482:	0100                	.insn	2, 0x0100
     484:	1105                	.insn	2, 0x1105
     486:	0306                	.insn	2, 0x0306
     488:	01d0                	.insn	2, 0x01d0
     48a:	0809                	.insn	2, 0x0809
     48c:	0100                	.insn	2, 0x0100
     48e:	2805                	.insn	2, 0x2805
     490:	04090503          	lb	a0,64(s2)
     494:	0100                	.insn	2, 0x0100
     496:	1e05                	.insn	2, 0x1e05
     498:	0306                	.insn	2, 0x0306
     49a:	0900                	.insn	2, 0x0900
     49c:	0004                	.insn	2, 0x0004
     49e:	0501                	.insn	2, 0x0501
     4a0:	060d                	.insn	2, 0x060d
     4a2:	08090103          	lb	sp,128(s2)
     4a6:	0100                	.insn	2, 0x0100
     4a8:	0306                	.insn	2, 0x0306
     4aa:	7eaa                	.insn	2, 0x7eaa
     4ac:	0809                	.insn	2, 0x0809
     4ae:	0100                	.insn	2, 0x0100
     4b0:	1605                	.insn	2, 0x1605
     4b2:	0306                	.insn	2, 0x0306
     4b4:	02c4                	.insn	2, 0x02c4
     4b6:	1009                	.insn	2, 0x1009
     4b8:	0100                	.insn	2, 0x0100
     4ba:	0005                	.insn	2, 0x0005
     4bc:	0306                	.insn	2, 0x0306
     4be:	7dbc                	.insn	2, 0x7dbc
     4c0:	0809                	.insn	2, 0x0809
     4c2:	0100                	.insn	2, 0x0100
     4c4:	0c05                	.insn	2, 0x0c05
     4c6:	0306                	.insn	2, 0x0306
     4c8:	02c1                	.insn	2, 0x02c1
     4ca:	0409                	.insn	2, 0x0409
     4cc:	0100                	.insn	2, 0x0100
     4ce:	0005                	.insn	2, 0x0005
     4d0:	0306                	.insn	2, 0x0306
     4d2:	04097dbf 10050100 	.insn	8, 0x1005010004097dbf
     4da:	0306                	.insn	2, 0x0306
     4dc:	02c8                	.insn	2, 0x02c8
     4de:	0409                	.insn	2, 0x0409
     4e0:	0100                	.insn	2, 0x0100
     4e2:	1605                	.insn	2, 0x1605
     4e4:	0306                	.insn	2, 0x0306
     4e6:	0900                	.insn	2, 0x0900
     4e8:	0004                	.insn	2, 0x0004
     4ea:	0501                	.insn	2, 0x0501
     4ec:	0605                	.insn	2, 0x0605
     4ee:	04097903          	.insn	4, 0x04097903
     4f2:	0100                	.insn	2, 0x0100
     4f4:	0306                	.insn	2, 0x0306
     4f6:	04097dbf 16050100 	.insn	8, 0x1605010004097dbf
     4fe:	0306                	.insn	2, 0x0306
     500:	02c4                	.insn	2, 0x02c4
     502:	0409                	.insn	2, 0x0409
     504:	0100                	.insn	2, 0x0100
     506:	1b05                	.insn	2, 0x1b05
     508:	10090103          	lb	sp,256(s2)
     50c:	0100                	.insn	2, 0x0100
     50e:	10090103          	lb	sp,256(s2)
     512:	0100                	.insn	2, 0x0100
     514:	1105                	.insn	2, 0x1105
     516:	097eda03          	lhu	s4,151(t4)
     51a:	0010                	.insn	2, 0x0010
     51c:	0601                	.insn	2, 0x0601
     51e:	097ee003          	.insn	4, 0x097ee003
     522:	0008                	.insn	2, 0x0008
     524:	0501                	.insn	2, 0x0501
     526:	060d                	.insn	2, 0x060d
     528:	0901a603          	lw	a2,144(gp)
     52c:	0004                	.insn	2, 0x0004
     52e:	0601                	.insn	2, 0x0601
     530:	097eda03          	lhu	s4,151(t4)
     534:	0008                	.insn	2, 0x0008
     536:	0501                	.insn	2, 0x0501
     538:	061f a103 0901      	.insn	6, 0x0901a103061f
     53e:	0004                	.insn	2, 0x0004
     540:	0501                	.insn	2, 0x0501
     542:	0305                	.insn	2, 0x0305
     544:	019a                	.insn	2, 0x019a
     546:	0409                	.insn	2, 0x0409
     548:	0100                	.insn	2, 0x0100
     54a:	0306                	.insn	2, 0x0306
     54c:	7dc5                	.insn	2, 0x7dc5
     54e:	0409                	.insn	2, 0x0409
     550:	0100                	.insn	2, 0x0100
     552:	0902bb03          	.insn	4, 0x0902bb03
     556:	0004                	.insn	2, 0x0004
     558:	0501                	.insn	2, 0x0501
     55a:	030c                	.insn	2, 0x030c
     55c:	0900                	.insn	2, 0x0900
     55e:	0004                	.insn	2, 0x0004
     560:	0501                	.insn	2, 0x0501
     562:	0316                	.insn	2, 0x0316
     564:	0900                	.insn	2, 0x0900
     566:	0004                	.insn	2, 0x0004
     568:	0501                	.insn	2, 0x0501
     56a:	0619                	.insn	2, 0x0619
     56c:	10090303          	lb	t1,256(s2)
     570:	0100                	.insn	2, 0x0100
     572:	2505                	.insn	2, 0x2505
     574:	0306                	.insn	2, 0x0306
     576:	0900                	.insn	2, 0x0900
     578:	0004                	.insn	2, 0x0004
     57a:	0501                	.insn	2, 0x0501
     57c:	060a                	.insn	2, 0x060a
     57e:	10090103          	lb	sp,256(s2)
     582:	0100                	.insn	2, 0x0100
     584:	0905                	.insn	2, 0x0905
     586:	0306                	.insn	2, 0x0306
     588:	0900                	.insn	2, 0x0900
     58a:	0004                	.insn	2, 0x0004
     58c:	0301                	.insn	2, 0x0301
     58e:	7dc1                	.insn	2, 0x7dc1
     590:	0809                	.insn	2, 0x0809
     592:	0100                	.insn	2, 0x0100
     594:	0902bf03          	.insn	4, 0x0902bf03
     598:	0008                	.insn	2, 0x0008
     59a:	0301                	.insn	2, 0x0301
     59c:	7dc1                	.insn	2, 0x7dc1
     59e:	0809                	.insn	2, 0x0809
     5a0:	0100                	.insn	2, 0x0100
     5a2:	1105                	.insn	2, 0x1105
     5a4:	0306                	.insn	2, 0x0306
     5a6:	01da                	.insn	2, 0x01da
     5a8:	0409                	.insn	2, 0x0409
     5aa:	0100                	.insn	2, 0x0100
     5ac:	2c05                	.insn	2, 0x2c05
     5ae:	04090503          	lb	a0,64(s2)
     5b2:	0100                	.insn	2, 0x0100
     5b4:	2205                	.insn	2, 0x2205
     5b6:	0306                	.insn	2, 0x0306
     5b8:	0900                	.insn	2, 0x0900
     5ba:	0004                	.insn	2, 0x0004
     5bc:	0501                	.insn	2, 0x0501
     5be:	060d                	.insn	2, 0x060d
     5c0:	08090103          	lb	sp,128(s2)
     5c4:	0100                	.insn	2, 0x0100
     5c6:	0306                	.insn	2, 0x0306
     5c8:	7ea0                	.insn	2, 0x7ea0
     5ca:	0809                	.insn	2, 0x0809
     5cc:	0100                	.insn	2, 0x0100
     5ce:	0306                	.insn	2, 0x0306
     5d0:	01cc                	.insn	2, 0x01cc
     5d2:	0809                	.insn	2, 0x0809
     5d4:	0100                	.insn	2, 0x0100
     5d6:	0306                	.insn	2, 0x0306
     5d8:	7eb4                	.insn	2, 0x7eb4
     5da:	0c09                	.insn	2, 0x0c09
     5dc:	0100                	.insn	2, 0x0100
     5de:	1105                	.insn	2, 0x1105
     5e0:	0306                	.insn	2, 0x0306
     5e2:	01e4                	.insn	2, 0x01e4
     5e4:	0809                	.insn	2, 0x0809
     5e6:	0100                	.insn	2, 0x0100
     5e8:	2c05                	.insn	2, 0x2c05
     5ea:	04090503          	lb	a0,64(s2)
     5ee:	0100                	.insn	2, 0x0100
     5f0:	2205                	.insn	2, 0x2205
     5f2:	0306                	.insn	2, 0x0306
     5f4:	0900                	.insn	2, 0x0900
     5f6:	0004                	.insn	2, 0x0004
     5f8:	0501                	.insn	2, 0x0501
     5fa:	0103061b          	.insn	4, 0x0103061b
     5fe:	0c09                	.insn	2, 0x0c09
     600:	0100                	.insn	2, 0x0100
     602:	1105                	.insn	2, 0x1105
     604:	0306                	.insn	2, 0x0306
     606:	0900                	.insn	2, 0x0900
     608:	0008                	.insn	2, 0x0008
     60a:	0501                	.insn	2, 0x0501
     60c:	060d                	.insn	2, 0x060d
     60e:	08090403          	lb	s0,128(s2)
     612:	0100                	.insn	2, 0x0100
     614:	0306                	.insn	2, 0x0306
     616:	7e92                	.insn	2, 0x7e92
     618:	0c09                	.insn	2, 0x0c09
     61a:	0100                	.insn	2, 0x0100
     61c:	1605                	.insn	2, 0x1605
     61e:	0306                	.insn	2, 0x0306
     620:	02c4                	.insn	2, 0x02c4
     622:	1009                	.insn	2, 0x1009
     624:	0100                	.insn	2, 0x0100
     626:	0005                	.insn	2, 0x0005
     628:	0306                	.insn	2, 0x0306
     62a:	7dbc                	.insn	2, 0x7dbc
     62c:	0809                	.insn	2, 0x0809
     62e:	0100                	.insn	2, 0x0100
     630:	0c05                	.insn	2, 0x0c05
     632:	0306                	.insn	2, 0x0306
     634:	02c1                	.insn	2, 0x02c1
     636:	0409                	.insn	2, 0x0409
     638:	0100                	.insn	2, 0x0100
     63a:	0005                	.insn	2, 0x0005
     63c:	0306                	.insn	2, 0x0306
     63e:	04097dbf 10050100 	.insn	8, 0x1005010004097dbf
     646:	0306                	.insn	2, 0x0306
     648:	02c8                	.insn	2, 0x02c8
     64a:	0409                	.insn	2, 0x0409
     64c:	0100                	.insn	2, 0x0100
     64e:	1605                	.insn	2, 0x1605
     650:	0306                	.insn	2, 0x0306
     652:	0900                	.insn	2, 0x0900
     654:	0004                	.insn	2, 0x0004
     656:	0501                	.insn	2, 0x0501
     658:	0605                	.insn	2, 0x0605
     65a:	04097903          	.insn	4, 0x04097903
     65e:	0100                	.insn	2, 0x0100
     660:	1605                	.insn	2, 0x1605
     662:	08090303          	lb	t1,128(s2)
     666:	0100                	.insn	2, 0x0100
     668:	1b05                	.insn	2, 0x1b05
     66a:	10090103          	lb	sp,256(s2)
     66e:	0100                	.insn	2, 0x0100
     670:	10090103          	lb	sp,256(s2)
     674:	0100                	.insn	2, 0x0100
     676:	0d05                	.insn	2, 0x0d05
     678:	097ee003          	.insn	4, 0x097ee003
     67c:	0010                	.insn	2, 0x0010
     67e:	0601                	.insn	2, 0x0601
     680:	097eda03          	lhu	s4,151(t4)
     684:	0008                	.insn	2, 0x0008
     686:	0501                	.insn	2, 0x0501
     688:	0611                	.insn	2, 0x0611
     68a:	0901f303          	.insn	4, 0x0901f303
     68e:	0004                	.insn	2, 0x0004
     690:	0601                	.insn	2, 0x0601
     692:	10090003          	lb	zero,256(s2)
     696:	0100                	.insn	2, 0x0100
     698:	0005                	.insn	2, 0x0005
     69a:	097e8d03          	lb	s10,151(t4)
     69e:	0004                	.insn	2, 0x0004
     6a0:	0501                	.insn	2, 0x0501
     6a2:	060d                	.insn	2, 0x060d
     6a4:	09028103          	lb	sp,144(t0)
     6a8:	000c                	.insn	2, 0x000c
     6aa:	0601                	.insn	2, 0x0601
     6ac:	097dff03          	.insn	4, 0x097dff03
     6b0:	0008                	.insn	2, 0x0008
     6b2:	0501                	.insn	2, 0x0501
     6b4:	0611                	.insn	2, 0x0611
     6b6:	09028603          	lb	a2,144(t0)
     6ba:	0008                	.insn	2, 0x0008
     6bc:	0501                	.insn	2, 0x0501
     6be:	09050317          	auipc	t1,0x9050
     6c2:	0004                	.insn	2, 0x0004
     6c4:	0501                	.insn	2, 0x0501
     6c6:	060d                	.insn	2, 0x060d
     6c8:	04090003          	lb	zero,64(s2)
     6cc:	0100                	.insn	2, 0x0100
     6ce:	097df503          	.insn	4, 0x097df503
     6d2:	0008                	.insn	2, 0x0008
     6d4:	0501                	.insn	2, 0x0501
     6d6:	0632                	.insn	2, 0x0632
     6d8:	0901f803          	.insn	4, 0x0901f803
     6dc:	0008                	.insn	2, 0x0008
     6de:	0501                	.insn	2, 0x0501
     6e0:	060d                	.insn	2, 0x060d
     6e2:	0c090003          	lb	zero,192(s2)
     6e6:	0100                	.insn	2, 0x0100
     6e8:	3205                	.insn	2, 0x3205
     6ea:	0306                	.insn	2, 0x0306
     6ec:	0901                	.insn	2, 0x0901
     6ee:	0008                	.insn	2, 0x0008
     6f0:	0501                	.insn	2, 0x0501
     6f2:	060d                	.insn	2, 0x060d
     6f4:	08090003          	lb	zero,128(s2)
     6f8:	0100                	.insn	2, 0x0100
     6fa:	3205                	.insn	2, 0x3205
     6fc:	0306                	.insn	2, 0x0306
     6fe:	0901                	.insn	2, 0x0901
     700:	0008                	.insn	2, 0x0008
     702:	0501                	.insn	2, 0x0501
     704:	060d                	.insn	2, 0x060d
     706:	08090003          	lb	zero,128(s2)
     70a:	0100                	.insn	2, 0x0100
     70c:	3205                	.insn	2, 0x3205
     70e:	0306                	.insn	2, 0x0306
     710:	0901                	.insn	2, 0x0901
     712:	0008                	.insn	2, 0x0008
     714:	0501                	.insn	2, 0x0501
     716:	060d                	.insn	2, 0x060d
     718:	08090003          	lb	zero,128(s2)
     71c:	0100                	.insn	2, 0x0100
     71e:	3205                	.insn	2, 0x3205
     720:	0306                	.insn	2, 0x0306
     722:	0901                	.insn	2, 0x0901
     724:	0008                	.insn	2, 0x0008
     726:	0501                	.insn	2, 0x0501
     728:	060d                	.insn	2, 0x060d
     72a:	08090003          	lb	zero,128(s2)
     72e:	0100                	.insn	2, 0x0100
     730:	097e8403          	lb	s0,151(t4)
     734:	0008                	.insn	2, 0x0008
     736:	0601                	.insn	2, 0x0601
     738:	09028f03          	lb	t5,144(t0)
     73c:	0008                	.insn	2, 0x0008
     73e:	0601                	.insn	2, 0x0601
     740:	097df103          	.insn	4, 0x097df103
     744:	0008                	.insn	2, 0x0008
     746:	0601                	.insn	2, 0x0601
     748:	09029c03          	lh	s8,144(t0)
     74c:	0004                	.insn	2, 0x0004
     74e:	0501                	.insn	2, 0x0501
     750:	0a05                	.insn	2, 0x0a05
     752:	08091f03          	lh	t5,128(s2)
     756:	0100                	.insn	2, 0x0100
     758:	0c05                	.insn	2, 0x0c05
     75a:	0306                	.insn	2, 0x0306
     75c:	0900                	.insn	2, 0x0900
     75e:	0014                	.insn	2, 0x0014
     760:	0501                	.insn	2, 0x0501
     762:	0316                	.insn	2, 0x0316
     764:	0900                	.insn	2, 0x0900
     766:	0004                	.insn	2, 0x0004
     768:	0301                	.insn	2, 0x0301
     76a:	7dc5                	.insn	2, 0x7dc5
     76c:	0809                	.insn	2, 0x0809
     76e:	0100                	.insn	2, 0x0100
     770:	0902bb03          	.insn	4, 0x0902bb03
     774:	0004                	.insn	2, 0x0004
     776:	0501                	.insn	2, 0x0501
     778:	0619                	.insn	2, 0x0619
     77a:	04090303          	lb	t1,64(s2)
     77e:	0100                	.insn	2, 0x0100
     780:	2505                	.insn	2, 0x2505
     782:	0306                	.insn	2, 0x0306
     784:	0900                	.insn	2, 0x0900
     786:	0004                	.insn	2, 0x0004
     788:	0501                	.insn	2, 0x0501
     78a:	060a                	.insn	2, 0x060a
     78c:	0c090103          	lb	sp,192(s2)
     790:	0100                	.insn	2, 0x0100
     792:	0306                	.insn	2, 0x0306
     794:	7dc1                	.insn	2, 0x7dc1
     796:	0409                	.insn	2, 0x0409
     798:	0100                	.insn	2, 0x0100
     79a:	0902bf03          	.insn	4, 0x0902bf03
     79e:	0008                	.insn	2, 0x0008
     7a0:	0501                	.insn	2, 0x0501
     7a2:	0309                	.insn	2, 0x0309
     7a4:	0900                	.insn	2, 0x0900
     7a6:	0004                	.insn	2, 0x0004
     7a8:	0301                	.insn	2, 0x0301
     7aa:	7dc1                	.insn	2, 0x7dc1
     7ac:	0409                	.insn	2, 0x0409
     7ae:	0100                	.insn	2, 0x0100
     7b0:	0105                	.insn	2, 0x0105
     7b2:	0306                	.insn	2, 0x0306
     7b4:	02cc                	.insn	2, 0x02cc
     7b6:	0409                	.insn	2, 0x0409
     7b8:	0100                	.insn	2, 0x0100
     7ba:	0306                	.insn	2, 0x0306
     7bc:	7db4                	.insn	2, 0x7db4
     7be:	0409                	.insn	2, 0x0409
     7c0:	0100                	.insn	2, 0x0100
     7c2:	1605                	.insn	2, 0x1605
     7c4:	0306                	.insn	2, 0x0306
     7c6:	02c4                	.insn	2, 0x02c4
     7c8:	0c09                	.insn	2, 0x0c09
     7ca:	0100                	.insn	2, 0x0100
     7cc:	0005                	.insn	2, 0x0005
     7ce:	0306                	.insn	2, 0x0306
     7d0:	7dbc                	.insn	2, 0x7dbc
     7d2:	1409                	.insn	2, 0x1409
     7d4:	0100                	.insn	2, 0x0100
     7d6:	0c05                	.insn	2, 0x0c05
     7d8:	0306                	.insn	2, 0x0306
     7da:	02c1                	.insn	2, 0x02c1
     7dc:	0409                	.insn	2, 0x0409
     7de:	0100                	.insn	2, 0x0100
     7e0:	0005                	.insn	2, 0x0005
     7e2:	0306                	.insn	2, 0x0306
     7e4:	04097dbf 10050100 	.insn	8, 0x1005010004097dbf
     7ec:	0306                	.insn	2, 0x0306
     7ee:	02c8                	.insn	2, 0x02c8
     7f0:	0409                	.insn	2, 0x0409
     7f2:	0100                	.insn	2, 0x0100
     7f4:	1605                	.insn	2, 0x1605
     7f6:	0306                	.insn	2, 0x0306
     7f8:	0900                	.insn	2, 0x0900
     7fa:	0004                	.insn	2, 0x0004
     7fc:	0501                	.insn	2, 0x0501
     7fe:	0605                	.insn	2, 0x0605
     800:	04097903          	.insn	4, 0x04097903
     804:	0100                	.insn	2, 0x0100
     806:	0306                	.insn	2, 0x0306
     808:	04097dbf 16050100 	.insn	8, 0x1605010004097dbf
     810:	0306                	.insn	2, 0x0306
     812:	02c4                	.insn	2, 0x02c4
     814:	0409                	.insn	2, 0x0409
     816:	0100                	.insn	2, 0x0100
     818:	1b05                	.insn	2, 0x1b05
     81a:	10090103          	lb	sp,256(s2)
     81e:	0100                	.insn	2, 0x0100
     820:	10090103          	lb	sp,256(s2)
     824:	0100                	.insn	2, 0x0100
     826:	0306                	.insn	2, 0x0306
     828:	7dba                	.insn	2, 0x7dba
     82a:	1009                	.insn	2, 0x1009
     82c:	0100                	.insn	2, 0x0100
     82e:	0a05                	.insn	2, 0x0a05
     830:	0306                	.insn	2, 0x0306
     832:	02ca                	.insn	2, 0x02ca
     834:	0409                	.insn	2, 0x0409
     836:	0100                	.insn	2, 0x0100
     838:	0105                	.insn	2, 0x0105
     83a:	04090203          	lb	tp,64(s2)
     83e:	0100                	.insn	2, 0x0100
     840:	0005                	.insn	2, 0x0005
     842:	04095a03          	lhu	s4,64(s2)
     846:	0100                	.insn	2, 0x0100
     848:	0505                	.insn	2, 0x0505
     84a:	030a                	.insn	2, 0x030a
     84c:	0902                	.insn	2, 0x0902
     84e:	0024                	.insn	2, 0x0024
     850:	0601                	.insn	2, 0x0601
     852:	097dd803          	lhu	a6,151(s11)
     856:	0004                	.insn	2, 0x0004
     858:	0501                	.insn	2, 0x0501
     85a:	0325                	.insn	2, 0x0325
     85c:	02a8                	.insn	2, 0x02a8
     85e:	0c09                	.insn	2, 0x0c09
     860:	0100                	.insn	2, 0x0100
     862:	0505                	.insn	2, 0x0505
     864:	04090003          	lb	zero,64(s2)
     868:	0100                	.insn	2, 0x0100
     86a:	0d05                	.insn	2, 0x0d05
     86c:	0306                	.insn	2, 0x0306
     86e:	0901                	.insn	2, 0x0901
     870:	0004                	.insn	2, 0x0004
     872:	0601                	.insn	2, 0x0601
     874:	097dd703          	lhu	a4,151(s11)
     878:	000c                	.insn	2, 0x000c
     87a:	0601                	.insn	2, 0x0601
     87c:	0902aa03          	lw	s4,144(t0)
     880:	0004                	.insn	2, 0x0004
     882:	0501                	.insn	2, 0x0501
     884:	0312                	.insn	2, 0x0312
     886:	0901                	.insn	2, 0x0901
     888:	0010                	.insn	2, 0x0010
     88a:	0501                	.insn	2, 0x0501
     88c:	031d                	.insn	2, 0x031d
     88e:	0901                	.insn	2, 0x0901
     890:	0004                	.insn	2, 0x0004
     892:	0501                	.insn	2, 0x0501
     894:	0311                	.insn	2, 0x0311
     896:	0901                	.insn	2, 0x0901
     898:	0008                	.insn	2, 0x0008
     89a:	0601                	.insn	2, 0x0601
     89c:	097dd303          	lhu	t1,151(s11)
     8a0:	000c                	.insn	2, 0x000c
     8a2:	0501                	.insn	2, 0x0501
     8a4:	0615                	.insn	2, 0x0615
     8a6:	0902b003          	.insn	4, 0x0902b003
     8aa:	0004                	.insn	2, 0x0004
     8ac:	0501                	.insn	2, 0x0501
     8ae:	0609                	.insn	2, 0x0609
     8b0:	04090003          	lb	zero,64(s2)
     8b4:	0100                	.insn	2, 0x0100
     8b6:	0306                	.insn	2, 0x0306
     8b8:	0901                	.insn	2, 0x0901
     8ba:	0004                	.insn	2, 0x0004
     8bc:	0501                	.insn	2, 0x0501
     8be:	0305                	.insn	2, 0x0305
     8c0:	0902                	.insn	2, 0x0902
     8c2:	000c                	.insn	2, 0x000c
     8c4:	0601                	.insn	2, 0x0601
     8c6:	097dcd03          	lbu	s10,151(s11)
     8ca:	0018                	.insn	2, 0x0018
     8cc:	0b01                	.insn	2, 0x0b01
     8ce:	0902b303          	.insn	4, 0x0902b303
     8d2:	000c                	.insn	2, 0x000c
     8d4:	0901                	.insn	2, 0x0901
     8d6:	000c                	.insn	2, 0x000c
     8d8:	0100                	.insn	2, 0x0100
     8da:	                	.insn	2, 0xda01

000008db <$d.11>:
     8db:	07da                	.insn	2, 0x07da
     8dd:	0000                	.insn	2, 0x0000
     8df:	0004                	.insn	2, 0x0004
     8e1:	0060                	.insn	2, 0x0060
     8e3:	0000                	.insn	2, 0x0000
     8e5:	0101                	.insn	2, 0x0101
     8e7:	fb01                	.insn	2, 0xfb01
     8e9:	0d0e                	.insn	2, 0x0d0e
     8eb:	0100                	.insn	2, 0x0100
     8ed:	0101                	.insn	2, 0x0101
     8ef:	0001                	.insn	2, 0x0001
     8f1:	0000                	.insn	2, 0x0000
     8f3:	0001                	.insn	2, 0x0001
     8f5:	0100                	.insn	2, 0x0100
     8f7:	2f2e                	.insn	2, 0x2f2e
     8f9:	00637273          	csrrci	tp,0x6,6
     8fd:	7273752f          	.insn	4, 0x7273752f
     901:	62696c2f          	.insn	4, 0x62696c2f
     905:	766c6c2f          	.insn	4, 0x766c6c2f
     909:	2d6d                	.insn	2, 0x2d6d
     90b:	3831                	.insn	2, 0x3831
     90d:	62696c2f          	.insn	4, 0x62696c2f
     911:	616c632f          	.insn	4, 0x616c632f
     915:	676e                	.insn	2, 0x676e
     917:	2f38312f          	.insn	4, 0x2f38312f
     91b:	6e69                	.insn	2, 0x6e69
     91d:	64756c63          	bltu	a0,t2,f75 <$d.3+0x137>
     921:	0065                	.insn	2, 0x0065
     923:	7500                	.insn	2, 0x7500
     925:	2e726573          	csrrsi	a0,0x2e7,4
     929:	00010063          	beqz	sp,929 <$d.11+0x4e>
     92d:	7300                	.insn	2, 0x7300
     92f:	6474                	.insn	2, 0x6474
     931:	6e69                	.insn	2, 0x6e69
     933:	2e74                	.insn	2, 0x2e74
     935:	0068                	.insn	2, 0x0068
     937:	0002                	.insn	2, 0x0002
     939:	7500                	.insn	2, 0x7500
     93b:	2e726573          	csrrsi	a0,0x2e7,4
     93f:	0068                	.insn	2, 0x0068
     941:	0001                	.insn	2, 0x0001
     943:	0000                	.insn	2, 0x0000
     945:	0505                	.insn	2, 0x0505
     947:	000a                	.insn	2, 0x000a
     949:	0205                	.insn	2, 0x0205
     94b:	0a88                	.insn	2, 0x0a88
     94d:	0040                	.insn	2, 0x0040
     94f:	03013f03          	.insn	4, 0x03013f03
     953:	00140913          	addi	s2,s0,1
     957:	0501                	.insn	2, 0x0501
     959:	0300                	.insn	2, 0x0300
     95b:	0925                	.insn	2, 0x0925
     95d:	0004                	.insn	2, 0x0004
     95f:	0501                	.insn	2, 0x0501
     961:	0a05                	.insn	2, 0x0a05
     963:	08091203          	lh	tp,128(s2)
     967:	0100                	.insn	2, 0x0100
     969:	0306                	.insn	2, 0x0306
     96b:	7ef6                	.insn	2, 0x7ef6
     96d:	0409                	.insn	2, 0x0409
     96f:	0100                	.insn	2, 0x0100
     971:	0905                	.insn	2, 0x0905
     973:	0306                	.insn	2, 0x0306
     975:	1409018b          	.insn	4, 0x1409018b
     979:	0100                	.insn	2, 0x0100
     97b:	1e05                	.insn	2, 0x1e05
     97d:	1c090303          	lb	t1,448(s2)
     981:	0100                	.insn	2, 0x0100
     983:	1c05                	.insn	2, 0x1c05
     985:	0306                	.insn	2, 0x0306
     987:	0900                	.insn	2, 0x0900
     989:	0008                	.insn	2, 0x0008
     98b:	0501                	.insn	2, 0x0501
     98d:	061e                	.insn	2, 0x061e
     98f:	04090103          	lb	sp,64(s2)
     993:	0100                	.insn	2, 0x0100
     995:	1c05                	.insn	2, 0x1c05
     997:	0306                	.insn	2, 0x0306
     999:	0900                	.insn	2, 0x0900
     99b:	0004                	.insn	2, 0x0004
     99d:	0501                	.insn	2, 0x0501
     99f:	0620                	.insn	2, 0x0620
     9a1:	04097c03          	.insn	4, 0x04097c03
     9a5:	0100                	.insn	2, 0x0100
     9a7:	2c05                	.insn	2, 0x2c05
     9a9:	14097f03          	.insn	4, 0x14097f03
     9ad:	0100                	.insn	2, 0x0100
     9af:	0505                	.insn	2, 0x0505
     9b1:	0306                	.insn	2, 0x0306
     9b3:	0900                	.insn	2, 0x0900
     9b5:	0004                	.insn	2, 0x0004
     9b7:	0301                	.insn	2, 0x0301
     9b9:	7ef6                	.insn	2, 0x7ef6
     9bb:	1009                	.insn	2, 0x1009
     9bd:	0100                	.insn	2, 0x0100
     9bf:	0306                	.insn	2, 0x0306
     9c1:	03ee                	.insn	2, 0x03ee
     9c3:	1009                	.insn	2, 0x1009
     9c5:	0100                	.insn	2, 0x0100
     9c7:	0306                	.insn	2, 0x0306
     9c9:	7c92                	.insn	2, 0x7c92
     9cb:	1c09                	.insn	2, 0x1c09
     9cd:	0100                	.insn	2, 0x0100
     9cf:	0306                	.insn	2, 0x0306
     9d1:	03b1                	.insn	2, 0x03b1
     9d3:	0409                	.insn	2, 0x0409
     9d5:	0100                	.insn	2, 0x0100
     9d7:	0306                	.insn	2, 0x0306
     9d9:	0900                	.insn	2, 0x0900
     9db:	0010                	.insn	2, 0x0010
     9dd:	0601                	.insn	2, 0x0601
     9df:	097df203          	.insn	4, 0x097df203
     9e3:	000c                	.insn	2, 0x000c
     9e5:	0601                	.insn	2, 0x0601
     9e7:	097edd03          	lhu	s10,151(t4)
     9eb:	0004                	.insn	2, 0x0004
     9ed:	0501                	.insn	2, 0x0501
     9ef:	0609                	.insn	2, 0x0609
     9f1:	0901a403          	lw	s0,144(gp)
     9f5:	0010                	.insn	2, 0x0010
     9f7:	0501                	.insn	2, 0x0501
     9f9:	031c                	.insn	2, 0x031c
     9fb:	0901                	.insn	2, 0x0901
     9fd:	0010                	.insn	2, 0x0010
     9ff:	0501                	.insn	2, 0x0501
     a01:	0305                	.insn	2, 0x0305
     a03:	02b4                	.insn	2, 0x02b4
     a05:	0409                	.insn	2, 0x0409
     a07:	0100                	.insn	2, 0x0100
     a09:	0c095803          	lhu	a6,192(s2)
     a0d:	0100                	.insn	2, 0x0100
     a0f:	2005                	.insn	2, 0x2005
     a11:	097df303          	.insn	4, 0x097df303
     a15:	000c                	.insn	2, 0x000c
     a17:	0501                	.insn	2, 0x0501
     a19:	0305                	.insn	2, 0x0305
     a1b:	028d                	.insn	2, 0x028d
     a1d:	0809                	.insn	2, 0x0809
     a1f:	0100                	.insn	2, 0x0100
     a21:	2c05                	.insn	2, 0x2c05
     a23:	097df203          	.insn	4, 0x097df203
     a27:	000c                	.insn	2, 0x000c
     a29:	0501                	.insn	2, 0x0501
     a2b:	0605                	.insn	2, 0x0605
     a2d:	04090003          	lb	zero,64(s2)
     a31:	0100                	.insn	2, 0x0100
     a33:	097edd03          	lhu	s10,151(t4)
     a37:	000c                	.insn	2, 0x000c
     a39:	0601                	.insn	2, 0x0601
     a3b:	0903ee03          	.insn	4, 0x0903ee03
     a3f:	0010                	.insn	2, 0x0010
     a41:	0301                	.insn	2, 0x0301
     a43:	00200943          	.insn	4, 0x00200943
     a47:	0601                	.insn	2, 0x0601
     a49:	10090003          	lb	zero,256(s2)
     a4d:	0100                	.insn	2, 0x0100
     a4f:	097ccf03          	lbu	t5,151(s9)
     a53:	000c                	.insn	2, 0x000c
     a55:	0301                	.insn	2, 0x0301
     a57:	03b1                	.insn	2, 0x03b1
     a59:	0409                	.insn	2, 0x0409
     a5b:	0100                	.insn	2, 0x0100
     a5d:	10090003          	lb	zero,256(s2)
     a61:	0100                	.insn	2, 0x0100
     a63:	0c090003          	lb	zero,192(s2)
     a67:	0100                	.insn	2, 0x0100
     a69:	0306                	.insn	2, 0x0306
     a6b:	7dfe                	.insn	2, 0x7dfe
     a6d:	0c09                	.insn	2, 0x0c09
     a6f:	0100                	.insn	2, 0x0100
     a71:	0306                	.insn	2, 0x0306
     a73:	7ed1                	.insn	2, 0x7ed1
     a75:	0409                	.insn	2, 0x0409
     a77:	0100                	.insn	2, 0x0100
     a79:	0905                	.insn	2, 0x0905
     a7b:	0306                	.insn	2, 0x0306
     a7d:	01b0                	.insn	2, 0x01b0
     a7f:	1409                	.insn	2, 0x1409
     a81:	0100                	.insn	2, 0x0100
     a83:	1c05                	.insn	2, 0x1c05
     a85:	10090103          	lb	sp,256(s2)
     a89:	0100                	.insn	2, 0x0100
     a8b:	0505                	.insn	2, 0x0505
     a8d:	0902a803          	lw	a6,144(t0)
     a91:	0004                	.insn	2, 0x0004
     a93:	0301                	.insn	2, 0x0301
     a95:	0958                	.insn	2, 0x0958
     a97:	000c                	.insn	2, 0x000c
     a99:	0501                	.insn	2, 0x0501
     a9b:	0320                	.insn	2, 0x0320
     a9d:	7dff                	.insn	2, 0x7dff
     a9f:	0c09                	.insn	2, 0x0c09
     aa1:	0100                	.insn	2, 0x0100
     aa3:	0505                	.insn	2, 0x0505
     aa5:	09028103          	lb	sp,144(t0)
     aa9:	0008                	.insn	2, 0x0008
     aab:	0501                	.insn	2, 0x0501
     aad:	032c                	.insn	2, 0x032c
     aaf:	7dfe                	.insn	2, 0x7dfe
     ab1:	0c09                	.insn	2, 0x0c09
     ab3:	0100                	.insn	2, 0x0100
     ab5:	0505                	.insn	2, 0x0505
     ab7:	0306                	.insn	2, 0x0306
     ab9:	0900                	.insn	2, 0x0900
     abb:	0004                	.insn	2, 0x0004
     abd:	0301                	.insn	2, 0x0301
     abf:	7ed1                	.insn	2, 0x7ed1
     ac1:	0c09                	.insn	2, 0x0c09
     ac3:	0100                	.insn	2, 0x0100
     ac5:	0306                	.insn	2, 0x0306
     ac7:	03b1                	.insn	2, 0x03b1
     ac9:	0409                	.insn	2, 0x0409
     acb:	0100                	.insn	2, 0x0100
     acd:	0306                	.insn	2, 0x0306
     acf:	0900                	.insn	2, 0x0900
     ad1:	0010                	.insn	2, 0x0010
     ad3:	0301                	.insn	2, 0x0301
     ad5:	0900                	.insn	2, 0x0900
     ad7:	000c                	.insn	2, 0x000c
     ad9:	0301                	.insn	2, 0x0301
     adb:	10097ccf          	.insn	4, 0x10097ccf
     adf:	0100                	.insn	2, 0x0100
     ae1:	0903b103          	.insn	4, 0x0903b103
     ae5:	0004                	.insn	2, 0x0004
     ae7:	0301                	.insn	2, 0x0301
     ae9:	0900                	.insn	2, 0x0900
     aeb:	0010                	.insn	2, 0x0010
     aed:	0301                	.insn	2, 0x0301
     aef:	0900                	.insn	2, 0x0900
     af1:	000c                	.insn	2, 0x000c
     af3:	0301                	.insn	2, 0x0301
     af5:	0c097ccf          	.insn	4, 0x0c097ccf
     af9:	0100                	.insn	2, 0x0100
     afb:	0903b103          	.insn	4, 0x0903b103
     aff:	0004                	.insn	2, 0x0004
     b01:	0301                	.insn	2, 0x0301
     b03:	0900                	.insn	2, 0x0900
     b05:	0010                	.insn	2, 0x0010
     b07:	0301                	.insn	2, 0x0301
     b09:	0900                	.insn	2, 0x0900
     b0b:	000c                	.insn	2, 0x000c
     b0d:	0601                	.insn	2, 0x0601
     b0f:	097e8a03          	lb	s4,151(t4)
     b13:	000c                	.insn	2, 0x000c
     b15:	0601                	.insn	2, 0x0601
     b17:	097ec503          	lbu	a0,151(t4)
     b1b:	0004                	.insn	2, 0x0004
     b1d:	0501                	.insn	2, 0x0501
     b1f:	061c                	.insn	2, 0x061c
     b21:	0901bd03          	.insn	4, 0x0901bd03
     b25:	0018                	.insn	2, 0x0018
     b27:	0501                	.insn	2, 0x0501
     b29:	0305                	.insn	2, 0x0305
     b2b:	029c                	.insn	2, 0x029c
     b2d:	0409                	.insn	2, 0x0409
     b2f:	0100                	.insn	2, 0x0100
     b31:	0c095803          	lhu	a6,192(s2)
     b35:	0100                	.insn	2, 0x0100
     b37:	2005                	.insn	2, 0x2005
     b39:	097e8b03          	lb	s6,151(t4)
     b3d:	000c                	.insn	2, 0x000c
     b3f:	0501                	.insn	2, 0x0501
     b41:	0305                	.insn	2, 0x0305
     b43:	01f5                	.insn	2, 0x01f5
     b45:	0c09                	.insn	2, 0x0c09
     b47:	0100                	.insn	2, 0x0100
     b49:	2c05                	.insn	2, 0x2c05
     b4b:	097e8a03          	lb	s4,151(t4)
     b4f:	000c                	.insn	2, 0x000c
     b51:	0501                	.insn	2, 0x0501
     b53:	0605                	.insn	2, 0x0605
     b55:	04090003          	lb	zero,64(s2)
     b59:	0100                	.insn	2, 0x0100
     b5b:	097ec503          	lbu	a0,151(t4)
     b5f:	0008                	.insn	2, 0x0008
     b61:	0601                	.insn	2, 0x0601
     b63:	0903b103          	.insn	4, 0x0903b103
     b67:	0004                	.insn	2, 0x0004
     b69:	0501                	.insn	2, 0x0501
     b6b:	0b01                	.insn	2, 0x0b01
     b6d:	097e9203          	lh	tp,151(t4)
     b71:	000c                	.insn	2, 0x000c
     b73:	0501                	.insn	2, 0x0501
     b75:	0300                	.insn	2, 0x0300
     b77:	01ed                	.insn	2, 0x01ed
     b79:	0809                	.insn	2, 0x0809
     b7b:	0100                	.insn	2, 0x0100
     b7d:	0505                	.insn	2, 0x0505
     b7f:	030a                	.insn	2, 0x030a
     b81:	0901                	.insn	2, 0x0901
     b83:	0004                	.insn	2, 0x0004
     b85:	0501                	.insn	2, 0x0501
     b87:	0301                	.insn	2, 0x0301
     b89:	0908                	.insn	2, 0x0908
     b8b:	000c                	.insn	2, 0x000c
     b8d:	0501                	.insn	2, 0x0501
     b8f:	0300                	.insn	2, 0x0300
     b91:	091f 0004 0501      	.insn	6, 0x05010004091f
     b97:	0a05                	.insn	2, 0x0a05
     b99:	04090103          	lb	sp,64(s2)
     b9d:	0100                	.insn	2, 0x0100
     b9f:	0105                	.insn	2, 0x0105
     ba1:	0c090803          	lb	a6,192(s2)
     ba5:	0100                	.insn	2, 0x0100
     ba7:	0505                	.insn	2, 0x0505
     ba9:	030a                	.insn	2, 0x030a
     bab:	0922                	.insn	2, 0x0922
     bad:	0004                	.insn	2, 0x0004
     baf:	0501                	.insn	2, 0x0501
     bb1:	0301                	.insn	2, 0x0301
     bb3:	08097dcb          	.insn	4, 0x08097dcb
     bb7:	0100                	.insn	2, 0x0100
     bb9:	0505                	.insn	2, 0x0505
     bbb:	030a                	.insn	2, 0x030a
     bbd:	02c5                	.insn	2, 0x02c5
     bbf:	0409                	.insn	2, 0x0409
     bc1:	0100                	.insn	2, 0x0100
     bc3:	0105                	.insn	2, 0x0105
     bc5:	097dc603          	lbu	a2,151(s11)
     bc9:	0008                	.insn	2, 0x0008
     bcb:	0501                	.insn	2, 0x0501
     bcd:	0a05                	.insn	2, 0x0a05
     bcf:	0902ba03          	.insn	4, 0x0902ba03
     bd3:	0004                	.insn	2, 0x0004
     bd5:	0501                	.insn	2, 0x0501
     bd7:	0301                	.insn	2, 0x0301
     bd9:	7dd2                	.insn	2, 0x7dd2
     bdb:	0809                	.insn	2, 0x0809
     bdd:	0100                	.insn	2, 0x0100
     bdf:	0505                	.insn	2, 0x0505
     be1:	030a                	.insn	2, 0x030a
     be3:	02d1                	.insn	2, 0x02d1
     be5:	0409                	.insn	2, 0x0409
     be7:	0100                	.insn	2, 0x0100
     be9:	0105                	.insn	2, 0x0105
     beb:	097dbb03          	.insn	4, 0x097dbb03
     bef:	0008                	.insn	2, 0x0008
     bf1:	0501                	.insn	2, 0x0501
     bf3:	0a0c                	.insn	2, 0x0a0c
     bf5:	04090503          	lb	a0,64(s2)
     bf9:	0100                	.insn	2, 0x0100
     bfb:	0505                	.insn	2, 0x0505
     bfd:	0306                	.insn	2, 0x0306
     bff:	0900                	.insn	2, 0x0900
     c01:	0008                	.insn	2, 0x0008
     c03:	0301                	.insn	2, 0x0301
     c05:	7e8a                	.insn	2, 0x7e8a
     c07:	0809                	.insn	2, 0x0809
     c09:	0100                	.insn	2, 0x0100
     c0b:	0e05                	.insn	2, 0x0e05
     c0d:	0306                	.insn	2, 0x0306
     c0f:	040901f7          	.insn	4, 0x040901f7
     c13:	0100                	.insn	2, 0x0100
     c15:	0c05                	.insn	2, 0x0c05
     c17:	04097f03          	.insn	4, 0x04097f03
     c1b:	0100                	.insn	2, 0x0100
     c1d:	0b05                	.insn	2, 0x0b05
     c1f:	04090103          	lb	sp,64(s2)
     c23:	0100                	.insn	2, 0x0100
     c25:	0505                	.insn	2, 0x0505
     c27:	04097f03          	.insn	4, 0x04097f03
     c2b:	0100                	.insn	2, 0x0100
     c2d:	0306                	.insn	2, 0x0306
     c2f:	7e8a                	.insn	2, 0x7e8a
     c31:	0409                	.insn	2, 0x0409
     c33:	0100                	.insn	2, 0x0100
     c35:	0901f603          	.insn	4, 0x0901f603
     c39:	0004                	.insn	2, 0x0004
     c3b:	0501                	.insn	2, 0x0501
     c3d:	0608                	.insn	2, 0x0608
     c3f:	04090203          	lb	tp,64(s2)
     c43:	0100                	.insn	2, 0x0100
     c45:	0505                	.insn	2, 0x0505
     c47:	04090103          	lb	sp,64(s2)
     c4b:	0100                	.insn	2, 0x0100
     c4d:	0c05                	.insn	2, 0x0c05
     c4f:	030a                	.insn	2, 0x030a
     c51:	0904                	.insn	2, 0x0904
     c53:	0004                	.insn	2, 0x0004
     c55:	0501                	.insn	2, 0x0501
     c57:	0610                	.insn	2, 0x0610
     c59:	04090003          	lb	zero,64(s2)
     c5d:	0100                	.insn	2, 0x0100
     c5f:	0505                	.insn	2, 0x0505
     c61:	04090003          	lb	zero,64(s2)
     c65:	0100                	.insn	2, 0x0100
     c67:	1305                	.insn	2, 0x1305
     c69:	04090003          	lb	zero,64(s2)
     c6d:	0100                	.insn	2, 0x0100
     c6f:	0505                	.insn	2, 0x0505
     c71:	08090003          	lb	zero,128(s2)
     c75:	0100                	.insn	2, 0x0100
     c77:	0c05                	.insn	2, 0x0c05
     c79:	04090003          	lb	zero,64(s2)
     c7d:	0100                	.insn	2, 0x0100
     c7f:	0b05                	.insn	2, 0x0b05
     c81:	0306                	.insn	2, 0x0306
     c83:	0904                	.insn	2, 0x0904
     c85:	0004                	.insn	2, 0x0004
     c87:	0501                	.insn	2, 0x0501
     c89:	0310                	.insn	2, 0x0310
     c8b:	097c                	.insn	2, 0x097c
     c8d:	0004                	.insn	2, 0x0004
     c8f:	0501                	.insn	2, 0x0501
     c91:	030c                	.insn	2, 0x030c
     c93:	00080907          	.insn	4, 0x00080907
     c97:	0601                	.insn	2, 0x0601
     c99:	097dfc03          	.insn	4, 0x097dfc03
     c9d:	0008                	.insn	2, 0x0008
     c9f:	0501                	.insn	2, 0x0501
     ca1:	02840323          	sb	s0,38(s0)
     ca5:	0409                	.insn	2, 0x0409
     ca7:	0100                	.insn	2, 0x0100
     ca9:	2105                	.insn	2, 0x2105
     cab:	04090003          	lb	zero,64(s2)
     caf:	0100                	.insn	2, 0x0100
     cb1:	0505                	.insn	2, 0x0505
     cb3:	04090003          	lb	zero,64(s2)
     cb7:	0100                	.insn	2, 0x0100
     cb9:	0005                	.insn	2, 0x0005
     cbb:	0306                	.insn	2, 0x0306
     cbd:	00040903          	lb	s2,0(s0)
     cc1:	0501                	.insn	2, 0x0501
     cc3:	0a05                	.insn	2, 0x0a05
     cc5:	3c090203          	lb	tp,960(s2)
     cc9:	0100                	.insn	2, 0x0100
     ccb:	0d05                	.insn	2, 0x0d05
     ccd:	44090503          	lb	a0,1088(s2)
     cd1:	0100                	.insn	2, 0x0100
     cd3:	0c05                	.insn	2, 0x0c05
     cd5:	04093c03          	.insn	4, 0x04093c03
     cd9:	0100                	.insn	2, 0x0100
     cdb:	04094103          	lbu	sp,64(s2)
     cdf:	0100                	.insn	2, 0x0100
     ce1:	0505                	.insn	2, 0x0505
     ce3:	0306                	.insn	2, 0x0306
     ce5:	0900                	.insn	2, 0x0900
     ce7:	0004                	.insn	2, 0x0004
     ce9:	0601                	.insn	2, 0x0601
     ceb:	0901a603          	lw	a2,144(gp)
     cef:	0008                	.insn	2, 0x0008
     cf1:	0501                	.insn	2, 0x0501
     cf3:	030c                	.insn	2, 0x030c
     cf5:	7f99                	.insn	2, 0x7f99
     cf7:	0c09                	.insn	2, 0x0c09
     cf9:	0100                	.insn	2, 0x0100
     cfb:	0306                	.insn	2, 0x0306
     cfd:	7db6                	.insn	2, 0x7db6
     cff:	0409                	.insn	2, 0x0409
     d01:	0100                	.insn	2, 0x0100
     d03:	1505                	.insn	2, 0x1505
     d05:	0306                	.insn	2, 0x0306
     d07:	028e                	.insn	2, 0x028e
     d09:	0409                	.insn	2, 0x0409
     d0b:	0100                	.insn	2, 0x0100
     d0d:	1005                	.insn	2, 0x1005
     d0f:	04097f03          	.insn	4, 0x04097f03
     d13:	0100                	.insn	2, 0x0100
     d15:	0d05                	.insn	2, 0x0d05
     d17:	04090103          	lb	sp,64(s2)
     d1b:	0100                	.insn	2, 0x0100
     d1d:	2105                	.insn	2, 0x2105
     d1f:	0c091003          	lh	zero,192(s2)
     d23:	0100                	.insn	2, 0x0100
     d25:	1905                	.insn	2, 0x1905
     d27:	10090303          	lb	t1,256(s2)
     d2b:	0100                	.insn	2, 0x0100
     d2d:	04090d03          	lb	s10,64(s2)
     d31:	0100                	.insn	2, 0x0100
     d33:	0505                	.insn	2, 0x0505
     d35:	09018303          	lb	t1,144(gp)
     d39:	0004                	.insn	2, 0x0004
     d3b:	0501                	.insn	2, 0x0501
     d3d:	030c                	.insn	2, 0x030c
     d3f:	7f99                	.insn	2, 0x7f99
     d41:	0c09                	.insn	2, 0x0c09
     d43:	0100                	.insn	2, 0x0100
     d45:	0306                	.insn	2, 0x0306
     d47:	7db6                	.insn	2, 0x7db6
     d49:	0409                	.insn	2, 0x0409
     d4b:	0100                	.insn	2, 0x0100
     d4d:	0d05                	.insn	2, 0x0d05
     d4f:	0306                	.insn	2, 0x0306
     d51:	028e                	.insn	2, 0x028e
     d53:	0409                	.insn	2, 0x0409
     d55:	0100                	.insn	2, 0x0100
     d57:	2605                	.insn	2, 0x2605
     d59:	08093103          	.insn	4, 0x08093103
     d5d:	0100                	.insn	2, 0x0100
     d5f:	3205                	.insn	2, 0x3205
     d61:	10090203          	lb	tp,256(s2)
     d65:	0100                	.insn	2, 0x0100
     d67:	2105                	.insn	2, 0x2105
     d69:	04090103          	lb	sp,64(s2)
     d6d:	0100                	.insn	2, 0x0100
     d6f:	0505                	.insn	2, 0x0505
     d71:	0900ef03          	.insn	4, 0x0900ef03
     d75:	0008                	.insn	2, 0x0008
     d77:	0501                	.insn	2, 0x0501
     d79:	033e                	.insn	2, 0x033e
     d7b:	7f90                	.insn	2, 0x7f90
     d7d:	0c09                	.insn	2, 0x0c09
     d7f:	0100                	.insn	2, 0x0100
     d81:	2105                	.insn	2, 0x2105
     d83:	08090103          	lb	sp,128(s2)
     d87:	0100                	.insn	2, 0x0100
     d89:	0505                	.insn	2, 0x0505
     d8b:	0900ef03          	.insn	4, 0x0900ef03
     d8f:	0008                	.insn	2, 0x0008
     d91:	0501                	.insn	2, 0x0501
     d93:	033e                	.insn	2, 0x033e
     d95:	7f90                	.insn	2, 0x7f90
     d97:	0c09                	.insn	2, 0x0c09
     d99:	0100                	.insn	2, 0x0100
     d9b:	2105                	.insn	2, 0x2105
     d9d:	08090103          	lb	sp,128(s2)
     da1:	0100                	.insn	2, 0x0100
     da3:	0505                	.insn	2, 0x0505
     da5:	0900ef03          	.insn	4, 0x0900ef03
     da9:	0008                	.insn	2, 0x0008
     dab:	0501                	.insn	2, 0x0501
     dad:	033e                	.insn	2, 0x033e
     daf:	7f90                	.insn	2, 0x7f90
     db1:	0c09                	.insn	2, 0x0c09
     db3:	0100                	.insn	2, 0x0100
     db5:	2105                	.insn	2, 0x2105
     db7:	08090103          	lb	sp,128(s2)
     dbb:	0100                	.insn	2, 0x0100
     dbd:	0505                	.insn	2, 0x0505
     dbf:	0900ef03          	.insn	4, 0x0900ef03
     dc3:	0008                	.insn	2, 0x0008
     dc5:	0501                	.insn	2, 0x0501
     dc7:	033e                	.insn	2, 0x033e
     dc9:	7f90                	.insn	2, 0x7f90
     dcb:	0c09                	.insn	2, 0x0c09
     dcd:	0100                	.insn	2, 0x0100
     dcf:	2105                	.insn	2, 0x2105
     dd1:	08090103          	lb	sp,128(s2)
     dd5:	0100                	.insn	2, 0x0100
     dd7:	0505                	.insn	2, 0x0505
     dd9:	0900ef03          	.insn	4, 0x0900ef03
     ddd:	0008                	.insn	2, 0x0008
     ddf:	0501                	.insn	2, 0x0501
     de1:	033e                	.insn	2, 0x033e
     de3:	7f90                	.insn	2, 0x7f90
     de5:	0c09                	.insn	2, 0x0c09
     de7:	0100                	.insn	2, 0x0100
     de9:	2105                	.insn	2, 0x2105
     deb:	08090103          	lb	sp,128(s2)
     def:	0100                	.insn	2, 0x0100
     df1:	0505                	.insn	2, 0x0505
     df3:	0900ef03          	.insn	4, 0x0900ef03
     df7:	0008                	.insn	2, 0x0008
     df9:	0501                	.insn	2, 0x0501
     dfb:	033e                	.insn	2, 0x033e
     dfd:	7f90                	.insn	2, 0x7f90
     dff:	0c09                	.insn	2, 0x0c09
     e01:	0100                	.insn	2, 0x0100
     e03:	2105                	.insn	2, 0x2105
     e05:	08090103          	lb	sp,128(s2)
     e09:	0100                	.insn	2, 0x0100
     e0b:	0505                	.insn	2, 0x0505
     e0d:	0900ef03          	.insn	4, 0x0900ef03
     e11:	0008                	.insn	2, 0x0008
     e13:	0501                	.insn	2, 0x0501
     e15:	033e                	.insn	2, 0x033e
     e17:	7f90                	.insn	2, 0x7f90
     e19:	0c09                	.insn	2, 0x0c09
     e1b:	0100                	.insn	2, 0x0100
     e1d:	2105                	.insn	2, 0x2105
     e1f:	04090103          	lb	sp,64(s2)
     e23:	0100                	.insn	2, 0x0100
     e25:	0505                	.insn	2, 0x0505
     e27:	0900ef03          	.insn	4, 0x0900ef03
     e2b:	0008                	.insn	2, 0x0008
     e2d:	0501                	.insn	2, 0x0501
     e2f:	030c                	.insn	2, 0x030c
     e31:	7f99                	.insn	2, 0x7f99
     e33:	0c09                	.insn	2, 0x0c09
     e35:	0100                	.insn	2, 0x0100
     e37:	0306                	.insn	2, 0x0306
     e39:	7db6                	.insn	2, 0x7db6
     e3b:	0409                	.insn	2, 0x0409
     e3d:	0100                	.insn	2, 0x0100
     e3f:	0505                	.insn	2, 0x0505
     e41:	0306                	.insn	2, 0x0306
     e43:	03b1                	.insn	2, 0x03b1
     e45:	0409                	.insn	2, 0x0409
     e47:	0100                	.insn	2, 0x0100
     e49:	0c05                	.insn	2, 0x0c05
     e4b:	097f9903          	lh	s2,151(t6)
     e4f:	000c                	.insn	2, 0x000c
     e51:	0601                	.insn	2, 0x0601
     e53:	097db603          	.insn	4, 0x097db603
     e57:	0004                	.insn	2, 0x0004
     e59:	0501                	.insn	2, 0x0501
     e5b:	0625                	.insn	2, 0x0625
     e5d:	09029603          	lh	a2,144(t0)
     e61:	0004                	.insn	2, 0x0004
     e63:	0501                	.insn	2, 0x0501
     e65:	031c                	.insn	2, 0x031c
     e67:	0901                	.insn	2, 0x0901
     e69:	0010                	.insn	2, 0x0010
     e6b:	0501                	.insn	2, 0x0501
     e6d:	0615                	.insn	2, 0x0615
     e6f:	04090003          	lb	zero,64(s2)
     e73:	0100                	.insn	2, 0x0100
     e75:	0505                	.insn	2, 0x0505
     e77:	0306                	.insn	2, 0x0306
     e79:	019a                	.insn	2, 0x019a
     e7b:	0809                	.insn	2, 0x0809
     e7d:	0100                	.insn	2, 0x0100
     e7f:	1c05                	.insn	2, 0x1c05
     e81:	097ee603          	.insn	4, 0x097ee603
     e85:	000c                	.insn	2, 0x000c
     e87:	0501                	.insn	2, 0x0501
     e89:	0615                	.insn	2, 0x0615
     e8b:	04090003          	lb	zero,64(s2)
     e8f:	0100                	.insn	2, 0x0100
     e91:	0505                	.insn	2, 0x0505
     e93:	0306                	.insn	2, 0x0306
     e95:	019a                	.insn	2, 0x019a
     e97:	0c09                	.insn	2, 0x0c09
     e99:	0100                	.insn	2, 0x0100
     e9b:	3a05                	.insn	2, 0x3a05
     e9d:	097ef303          	.insn	4, 0x097ef303
     ea1:	000c                	.insn	2, 0x000c
     ea3:	0601                	.insn	2, 0x0601
     ea5:	097ddc03          	lhu	s8,151(s11)
     ea9:	0004                	.insn	2, 0x0004
     eab:	0501                	.insn	2, 0x0501
     ead:	b503061b          	.insn	4, 0xb503061b
     eb1:	0902                	.insn	2, 0x0902
     eb3:	000c                	.insn	2, 0x000c
     eb5:	0601                	.insn	2, 0x0601
     eb7:	097dcb03          	lbu	s6,151(s11)
     ebb:	0008                	.insn	2, 0x0008
     ebd:	0501                	.insn	2, 0x0501
     ebf:	0624                	.insn	2, 0x0624
     ec1:	0902b403          	.insn	4, 0x0902b403
     ec5:	0008                	.insn	2, 0x0008
     ec7:	0501                	.insn	2, 0x0501
     ec9:	061e                	.insn	2, 0x061e
     ecb:	04090003          	lb	zero,64(s2)
     ecf:	0100                	.insn	2, 0x0100
     ed1:	2205                	.insn	2, 0x2205
     ed3:	04090003          	lb	zero,64(s2)
     ed7:	0100                	.insn	2, 0x0100
     ed9:	1505                	.insn	2, 0x1505
     edb:	0306                	.insn	2, 0x0306
     edd:	097f 0008 0501 0321 	.insn	10, 0x0907032105010008097f
     ee5:	0907 
     ee7:	0004                	.insn	2, 0x0004
     ee9:	0501                	.insn	2, 0x0501
     eeb:	0305                	.insn	2, 0x0305
     eed:	080900f7          	.insn	4, 0x080900f7
     ef1:	0100                	.insn	2, 0x0100
     ef3:	1e05                	.insn	2, 0x1e05
     ef5:	097f8803          	lb	a6,151(t6)
     ef9:	000c                	.insn	2, 0x000c
     efb:	0501                	.insn	2, 0x0501
     efd:	0615                	.insn	2, 0x0615
     eff:	08090003          	lb	zero,128(s2)
     f03:	0100                	.insn	2, 0x0100
     f05:	097dc703          	lbu	a4,151(s11)
     f09:	0008                	.insn	2, 0x0008
     f0b:	0501                	.insn	2, 0x0501
     f0d:	0605                	.insn	2, 0x0605
     f0f:	0903b103          	.insn	4, 0x0903b103
     f13:	0004                	.insn	2, 0x0004
     f15:	0601                	.insn	2, 0x0601
     f17:	097ccf03          	lbu	t5,151(s9)
     f1b:	000c                	.insn	2, 0x000c
     f1d:	0501                	.insn	2, 0x0501
     f1f:	0601                	.insn	2, 0x0601
     f21:	02cf030b          	.insn	4, 0x02cf030b
     f25:	1409                	.insn	2, 0x1409
     f27:	0100                	.insn	2, 0x0100
     f29:	0005                	.insn	2, 0x0005
     f2b:	08090603          	lb	a2,128(s2)
     f2f:	0100                	.insn	2, 0x0100
     f31:	0a05                	.insn	2, 0x0a05
     f33:	030a                	.insn	2, 0x030a
     f35:	0902                	.insn	2, 0x0902
     f37:	0004                	.insn	2, 0x0004
     f39:	0501                	.insn	2, 0x0501
     f3b:	00030617          	auipc	a2,0x30
     f3f:	0c09                	.insn	2, 0x0c09
     f41:	0100                	.insn	2, 0x0100
     f43:	1b05                	.insn	2, 0x1b05
     f45:	04090003          	lb	zero,64(s2)
     f49:	0100                	.insn	2, 0x0100
     f4b:	2705                	.insn	2, 0x2705
     f4d:	04090003          	lb	zero,64(s2)
     f51:	0100                	.insn	2, 0x0100
     f53:	0c05                	.insn	2, 0x0c05
     f55:	0306                	.insn	2, 0x0306
     f57:	0905                	.insn	2, 0x0905
     f59:	000c                	.insn	2, 0x000c
     f5b:	0501                	.insn	2, 0x0501
     f5d:	097d030b          	.insn	4, 0x097d030b
     f61:	0004                	.insn	2, 0x0004
     f63:	0601                	.insn	2, 0x0601
     f65:	097da703          	lw	a4,151(s11)
     f69:	0004                	.insn	2, 0x0004
     f6b:	0501                	.insn	2, 0x0501
     f6d:	0605                	.insn	2, 0x0605
     f6f:	0902dc03          	lhu	s8,144(t0)
     f73:	0008                	.insn	2, 0x0008
     f75:	0601                	.insn	2, 0x0601
     f77:	097da403          	lw	s0,151(s11)
     f7b:	0008                	.insn	2, 0x0008
     f7d:	0501                	.insn	2, 0x0501
     f7f:	0616                	.insn	2, 0x0616
     f81:	0902df03          	lhu	t5,144(t0)
     f85:	0008                	.insn	2, 0x0008
     f87:	0601                	.insn	2, 0x0601
     f89:	097da103          	lw	sp,151(s11)
     f8d:	0004                	.insn	2, 0x0004
     f8f:	0301                	.insn	2, 0x0301
     f91:	02df 0c09 0100      	.insn	6, 0x01000c0902df
     f97:	1b05                	.insn	2, 0x1b05
     f99:	0306                	.insn	2, 0x0306
     f9b:	0901                	.insn	2, 0x0901
     f9d:	0010                	.insn	2, 0x0010
     f9f:	0301                	.insn	2, 0x0301
     fa1:	0901                	.insn	2, 0x0901
     fa3:	0010                	.insn	2, 0x0010
     fa5:	0501                	.insn	2, 0x0501
     fa7:	0600                	.insn	2, 0x0600
     fa9:	097d9f03          	lh	t5,151(s11)
     fad:	0010                	.insn	2, 0x0010
     faf:	0501                	.insn	2, 0x0501
     fb1:	060d                	.insn	2, 0x060d
     fb3:	0902e303          	.insn	4, 0x0902e303
     fb7:	0008                	.insn	2, 0x0008
     fb9:	0501                	.insn	2, 0x0501
     fbb:	030c                	.insn	2, 0x030c
     fbd:	0979                	.insn	2, 0x0979
     fbf:	0004                	.insn	2, 0x0004
     fc1:	0501                	.insn	2, 0x0501
     fc3:	0908030f          	.insn	4, 0x0908030f
     fc7:	0004                	.insn	2, 0x0004
     fc9:	0501                	.insn	2, 0x0501
     fcb:	0616                	.insn	2, 0x0616
     fcd:	04090003          	lb	zero,64(s2)
     fd1:	0100                	.insn	2, 0x0100
     fd3:	0505                	.insn	2, 0x0505
     fd5:	0306                	.insn	2, 0x0306
     fd7:	0978                	.insn	2, 0x0978
     fd9:	0004                	.insn	2, 0x0004
     fdb:	0301                	.insn	2, 0x0301
     fdd:	090a                	.insn	2, 0x090a
     fdf:	0008                	.insn	2, 0x0008
     fe1:	0501                	.insn	2, 0x0501
     fe3:	0300                	.insn	2, 0x0300
     fe5:	0905                	.insn	2, 0x0905
     fe7:	0004                	.insn	2, 0x0004
     fe9:	0501                	.insn	2, 0x0501
     feb:	0a09                	.insn	2, 0x0a09
     fed:	04090103          	lb	sp,64(s2)
     ff1:	0100                	.insn	2, 0x0100
     ff3:	0306                	.insn	2, 0x0306
     ff5:	7d94                	.insn	2, 0x7d94
     ff7:	0409                	.insn	2, 0x0409
     ff9:	0100                	.insn	2, 0x0100
     ffb:	0105                	.insn	2, 0x0105
     ffd:	0306                	.insn	2, 0x0306
     fff:	040902f3          	.insn	4, 0x040902f3
    1003:	0100                	.insn	2, 0x0100
    1005:	0306                	.insn	2, 0x0306
    1007:	7d8d                	.insn	2, 0x7d8d
    1009:	1809                	.insn	2, 0x1809
    100b:	0100                	.insn	2, 0x0100
    100d:	0505                	.insn	2, 0x0505
    100f:	0306                	.insn	2, 0x0306
    1011:	02ee                	.insn	2, 0x02ee
    1013:	0809                	.insn	2, 0x0809
    1015:	0100                	.insn	2, 0x0100
    1017:	0306                	.insn	2, 0x0306
    1019:	7d92                	.insn	2, 0x7d92
    101b:	0409                	.insn	2, 0x0409
    101d:	0100                	.insn	2, 0x0100
    101f:	0f05                	.insn	2, 0x0f05
    1021:	0306                	.insn	2, 0x0306
    1023:	040902ef          	jal	t0,91063 <$d.5+0x8fc17>
    1027:	0100                	.insn	2, 0x0100
    1029:	0d05                	.insn	2, 0x0d05
    102b:	0306                	.insn	2, 0x0306
    102d:	0900                	.insn	2, 0x0900
    102f:	0010                	.insn	2, 0x0010
    1031:	0501                	.insn	2, 0x0501
    1033:	7f030627          	.insn	4, 0x7f030627
    1037:	0409                	.insn	2, 0x0409
    1039:	0100                	.insn	2, 0x0100
    103b:	1c05                	.insn	2, 0x1c05
    103d:	0306                	.insn	2, 0x0306
    103f:	0900                	.insn	2, 0x0900
    1041:	0004                	.insn	2, 0x0004
    1043:	0501                	.insn	2, 0x0501
    1045:	0305                	.insn	2, 0x0305
    1047:	0900                	.insn	2, 0x0900
    1049:	0004                	.insn	2, 0x0004
    104b:	0501                	.insn	2, 0x0501
    104d:	01030613          	addi	a2,t1,16 # 90506ce <USER_MAX+0x8b506ce>
    1051:	0409                	.insn	2, 0x0409
    1053:	0100                	.insn	2, 0x0100
    1055:	0306                	.insn	2, 0x0306
    1057:	7d91                	.insn	2, 0x7d91
    1059:	0409                	.insn	2, 0x0409
    105b:	0100                	.insn	2, 0x0100
    105d:	0105                	.insn	2, 0x0105
    105f:	0306                	.insn	2, 0x0306
    1061:	100902f3          	.insn	4, 0x100902f3
    1065:	0100                	.insn	2, 0x0100
    1067:	0505                	.insn	2, 0x0505
    1069:	030a                	.insn	2, 0x030a
    106b:	040900cb          	.insn	4, 0x040900cb
    106f:	0100                	.insn	2, 0x0100
    1071:	0c090803          	lb	a6,192(s2)
    1075:	0100                	.insn	2, 0x0100
    1077:	030a                	.insn	2, 0x030a
    1079:	0906                	.insn	2, 0x0906
    107b:	0008                	.insn	2, 0x0008
    107d:	0301                	.insn	2, 0x0301
    107f:	0908                	.insn	2, 0x0908
    1081:	000c                	.insn	2, 0x000c
    1083:	0a01                	.insn	2, 0x0a01
    1085:	0900cf03          	lbu	t5,144(ra)
    1089:	0008                	.insn	2, 0x0008
    108b:	0301                	.insn	2, 0x0301
    108d:	00080907          	.insn	4, 0x00080907
    1091:	0a01                	.insn	2, 0x0a01
    1093:	04091c03          	lh	s8,64(s2)
    1097:	0100                	.insn	2, 0x0100
    1099:	08090703          	lb	a4,128(s2)
    109d:	0100                	.insn	2, 0x0100
    109f:	0409                	.insn	2, 0x0409
    10a1:	0000                	.insn	2, 0x0000
    10a3:	0101                	.insn	2, 0x0101
    10a5:	0505                	.insn	2, 0x0505
    10a7:	000a                	.insn	2, 0x000a
    10a9:	0205                	.insn	2, 0x0205
    10ab:	0000                	.insn	2, 0x0000
    10ad:	0040                	.insn	2, 0x0040
    10af:	0104d303          	lhu	t1,16(s1)
    10b3:	1c09                	.insn	2, 0x1c09
    10b5:	0000                	.insn	2, 0x0000
    10b7:	0101                	.insn	2, 0x0101

000010b9 <$d.11>:
    10b9:	0944                	.insn	2, 0x0944
    10bb:	0000                	.insn	2, 0x0000
    10bd:	0004                	.insn	2, 0x0004
    10bf:	003a                	.insn	2, 0x003a
    10c1:	0000                	.insn	2, 0x0000
    10c3:	0101                	.insn	2, 0x0101
    10c5:	fb01                	.insn	2, 0xfb01
    10c7:	0d0e                	.insn	2, 0x0d0e
    10c9:	0100                	.insn	2, 0x0100
    10cb:	0101                	.insn	2, 0x0101
    10cd:	0001                	.insn	2, 0x0001
    10cf:	0000                	.insn	2, 0x0000
    10d1:	0001                	.insn	2, 0x0001
    10d3:	0100                	.insn	2, 0x0100
    10d5:	2f2e                	.insn	2, 0x2f2e
    10d7:	00637273          	csrrci	tp,0x6,6
    10db:	6600                	.insn	2, 0x6600
    10dd:	7461                	.insn	2, 0x7461
    10df:	632e3233          	.insn	4, 0x632e3233
    10e3:	0100                	.insn	2, 0x0100
    10e5:	0000                	.insn	2, 0x0000
    10e7:	7375                	.insn	2, 0x7375
    10e9:	7265                	.insn	2, 0x7265
    10eb:	682e                	.insn	2, 0x682e
    10ed:	0100                	.insn	2, 0x0100
    10ef:	0000                	.insn	2, 0x0000
    10f1:	6166                	.insn	2, 0x6166
    10f3:	3374                	.insn	2, 0x3374
    10f5:	2e32                	.insn	2, 0x2e32
    10f7:	0068                	.insn	2, 0x0068
    10f9:	0001                	.insn	2, 0x0001
    10fb:	0000                	.insn	2, 0x0000
    10fd:	0500                	.insn	2, 0x0500
    10ff:	8002                	.insn	2, 0x8002
    1101:	4012                	.insn	2, 0x4012
    1103:	1900                	.insn	2, 0x1900
    1105:	0905                	.insn	2, 0x0905
    1107:	030a                	.insn	2, 0x030a
    1109:	0906                	.insn	2, 0x0906
    110b:	0014                	.insn	2, 0x0014
    110d:	0601                	.insn	2, 0x0601
    110f:	10090003          	lb	zero,256(s2)
    1113:	0100                	.insn	2, 0x0100
    1115:	0306                	.insn	2, 0x0306
    1117:	00040903          	lb	s2,0(s0)
    111b:	0601                	.insn	2, 0x0601
    111d:	14090003          	lb	zero,320(s2)
    1121:	0100                	.insn	2, 0x0100
    1123:	0306                	.insn	2, 0x0306
    1125:	0901                	.insn	2, 0x0901
    1127:	0004                	.insn	2, 0x0004
    1129:	0601                	.insn	2, 0x0601
    112b:	10096e03          	.insn	4, 0x10096e03
    112f:	0100                	.insn	2, 0x0100
    1131:	1805                	.insn	2, 0x1805
    1133:	0306                	.insn	2, 0x0306
    1135:	00080917          	auipc	s2,0x80
    1139:	0501                	.insn	2, 0x0501
    113b:	0314                	.insn	2, 0x0314
    113d:	00e4                	.insn	2, 0x00e4
    113f:	0409                	.insn	2, 0x0409
    1141:	0100                	.insn	2, 0x0100
    1143:	08090203          	lb	tp,128(s2) # 811b5 <$d.5+0x7fd69>
    1147:	0100                	.insn	2, 0x0100
    1149:	04097e03          	.insn	4, 0x04097e03
    114d:	0100                	.insn	2, 0x0100
    114f:	1505                	.insn	2, 0x1505
    1151:	04090103          	lb	sp,64(s2)
    1155:	0100                	.insn	2, 0x0100
    1157:	1a05                	.insn	2, 0x1a05
    1159:	0306                	.insn	2, 0x0306
    115b:	0900                	.insn	2, 0x0900
    115d:	0004                	.insn	2, 0x0004
    115f:	0501                	.insn	2, 0x0501
    1161:	061f 7f03 0409      	.insn	6, 0x04097f03061f
    1167:	0100                	.insn	2, 0x0100
    1169:	0905                	.insn	2, 0x0905
    116b:	097f9e03          	lh	t3,151(t6)
    116f:	0004                	.insn	2, 0x0004
    1171:	0601                	.insn	2, 0x0601
    1173:	14090003          	lb	zero,320(s2)
    1177:	0100                	.insn	2, 0x0100
    1179:	04096703          	.insn	4, 0x04096703
    117d:	0100                	.insn	2, 0x0100
    117f:	0505                	.insn	2, 0x0505
    1181:	0306                	.insn	2, 0x0306
    1183:	091c                	.insn	2, 0x091c
    1185:	0004                	.insn	2, 0x0004
    1187:	0601                	.insn	2, 0x0601
    1189:	10096403          	.insn	4, 0x10096403
    118d:	0100                	.insn	2, 0x0100
    118f:	08091c03          	lh	s8,128(s2)
    1193:	0100                	.insn	2, 0x0100
    1195:	1105                	.insn	2, 0x1105
    1197:	0306                	.insn	2, 0x0306
    1199:	0905                	.insn	2, 0x0905
    119b:	0008                	.insn	2, 0x0008
    119d:	0501                	.insn	2, 0x0501
    119f:	0609                	.insn	2, 0x0609
    11a1:	04090003          	lb	zero,64(s2)
    11a5:	0100                	.insn	2, 0x0100
    11a7:	0505                	.insn	2, 0x0505
    11a9:	0306                	.insn	2, 0x0306
    11ab:	0008097b          	.insn	4, 0x0008097b
    11af:	0301                	.insn	2, 0x0301
    11b1:	0908                	.insn	2, 0x0908
    11b3:	0008                	.insn	2, 0x0008
    11b5:	0601                	.insn	2, 0x0601
    11b7:	0c095c03          	lhu	s8,192(s2)
    11bb:	0100                	.insn	2, 0x0100
    11bd:	0105                	.insn	2, 0x0105
    11bf:	0b06                	.insn	2, 0x0b06
    11c1:	10092703          	lw	a4,256(s2)
    11c5:	0100                	.insn	2, 0x0100
    11c7:	0005                	.insn	2, 0x0005
    11c9:	0900da03          	lhu	s4,144(ra)
    11cd:	0008                	.insn	2, 0x0008
    11cf:	0501                	.insn	2, 0x0501
    11d1:	0a09                	.insn	2, 0x0a09
    11d3:	14090303          	lb	t1,320(s2)
    11d7:	0100                	.insn	2, 0x0100
    11d9:	0306                	.insn	2, 0x0306
    11db:	7efc                	.insn	2, 0x7efc
    11dd:	1809                	.insn	2, 0x1809
    11df:	0100                	.insn	2, 0x0100
    11e1:	09018403          	lb	s0,144(gp)
    11e5:	0004                	.insn	2, 0x0004
    11e7:	0501                	.insn	2, 0x0501
    11e9:	0614                	.insn	2, 0x0614
    11eb:	04090503          	lb	a0,64(s2)
    11ef:	0100                	.insn	2, 0x0100
    11f1:	04097f03          	.insn	4, 0x04097f03
    11f5:	0100                	.insn	2, 0x0100
    11f7:	04090203          	lb	tp,64(s2)
    11fb:	0100                	.insn	2, 0x0100
    11fd:	0a05                	.insn	2, 0x0a05
    11ff:	04090103          	lb	sp,64(s2)
    1203:	0100                	.insn	2, 0x0100
    1205:	1f05                	.insn	2, 0x1f05
    1207:	04097e03          	.insn	4, 0x04097e03
    120b:	0100                	.insn	2, 0x0100
    120d:	2005                	.insn	2, 0x2005
    120f:	04097f03          	.insn	4, 0x04097f03
    1213:	0100                	.insn	2, 0x0100
    1215:	1f05                	.insn	2, 0x1f05
    1217:	04090203          	lb	tp,64(s2)
    121b:	0100                	.insn	2, 0x0100
    121d:	04090103          	lb	sp,64(s2)
    1221:	0100                	.insn	2, 0x0100
    1223:	2505                	.insn	2, 0x2505
    1225:	04097e03          	.insn	4, 0x04097e03
    1229:	0100                	.insn	2, 0x0100
    122b:	2605                	.insn	2, 0x2605
    122d:	04090103          	lb	sp,64(s2)
    1231:	0100                	.insn	2, 0x0100
    1233:	1605                	.insn	2, 0x1605
    1235:	04097d03          	.insn	4, 0x04097d03
    1239:	0100                	.insn	2, 0x0100
    123b:	0905                	.insn	2, 0x0905
    123d:	08090603          	lb	a2,128(s2)
    1241:	0100                	.insn	2, 0x0100
    1243:	0306                	.insn	2, 0x0306
    1245:	0900                	.insn	2, 0x0900
    1247:	000c                	.insn	2, 0x000c
    1249:	0501                	.insn	2, 0x0501
    124b:	0614                	.insn	2, 0x0614
    124d:	04090403          	lb	s0,64(s2)
    1251:	0100                	.insn	2, 0x0100
    1253:	08090103          	lb	sp,128(s2)
    1257:	0100                	.insn	2, 0x0100
    1259:	04097f03          	.insn	4, 0x04097f03
    125d:	0100                	.insn	2, 0x0100
    125f:	1c05                	.insn	2, 0x1c05
    1261:	08090103          	lb	sp,128(s2)
    1265:	0100                	.insn	2, 0x0100
    1267:	1d05                	.insn	2, 0x1d05
    1269:	04097f03          	.insn	4, 0x04097f03
    126d:	0100                	.insn	2, 0x0100
    126f:	1405                	.insn	2, 0x1405
    1271:	04090803          	lb	a6,64(s2)
    1275:	0100                	.insn	2, 0x0100
    1277:	04097f03          	.insn	4, 0x04097f03
    127b:	0100                	.insn	2, 0x0100
    127d:	04090203          	lb	tp,64(s2)
    1281:	0100                	.insn	2, 0x0100
    1283:	0a05                	.insn	2, 0x0a05
    1285:	04090103          	lb	sp,64(s2)
    1289:	0100                	.insn	2, 0x0100
    128b:	1c05                	.insn	2, 0x1c05
    128d:	04097e03          	.insn	4, 0x04097e03
    1291:	0100                	.insn	2, 0x0100
    1293:	1d05                	.insn	2, 0x1d05
    1295:	04097f03          	.insn	4, 0x04097f03
    1299:	0100                	.insn	2, 0x0100
    129b:	1c05                	.insn	2, 0x1c05
    129d:	04090203          	lb	tp,64(s2)
    12a1:	0100                	.insn	2, 0x0100
    12a3:	04090103          	lb	sp,64(s2)
    12a7:	0100                	.insn	2, 0x0100
    12a9:	1305                	.insn	2, 0x1305
    12ab:	04090303          	lb	t1,64(s2)
    12af:	0100                	.insn	2, 0x0100
    12b1:	2205                	.insn	2, 0x2205
    12b3:	04097b03          	.insn	4, 0x04097b03
    12b7:	0100                	.insn	2, 0x0100
    12b9:	2305                	.insn	2, 0x2305
    12bb:	04090103          	lb	sp,64(s2)
    12bf:	0100                	.insn	2, 0x0100
    12c1:	2105                	.insn	2, 0x2105
    12c3:	04090303          	lb	t1,64(s2)
    12c7:	0100                	.insn	2, 0x0100
    12c9:	1405                	.insn	2, 0x1405
    12cb:	08090503          	lb	a0,128(s2)
    12cf:	0100                	.insn	2, 0x0100
    12d1:	04097f03          	.insn	4, 0x04097f03
    12d5:	0100                	.insn	2, 0x0100
    12d7:	04090203          	lb	tp,64(s2)
    12db:	0100                	.insn	2, 0x0100
    12dd:	0a05                	.insn	2, 0x0a05
    12df:	04090103          	lb	sp,64(s2)
    12e3:	0100                	.insn	2, 0x0100
    12e5:	1c05                	.insn	2, 0x1c05
    12e7:	04097e03          	.insn	4, 0x04097e03
    12eb:	0100                	.insn	2, 0x0100
    12ed:	1d05                	.insn	2, 0x1d05
    12ef:	04097f03          	.insn	4, 0x04097f03
    12f3:	0100                	.insn	2, 0x0100
    12f5:	1c05                	.insn	2, 0x1c05
    12f7:	04090203          	lb	tp,64(s2)
    12fb:	0100                	.insn	2, 0x0100
    12fd:	04090103          	lb	sp,64(s2)
    1301:	0100                	.insn	2, 0x0100
    1303:	2205                	.insn	2, 0x2205
    1305:	04097e03          	.insn	4, 0x04097e03
    1309:	0100                	.insn	2, 0x0100
    130b:	1105                	.insn	2, 0x1105
    130d:	04090503          	lb	a0,64(s2)
    1311:	0100                	.insn	2, 0x0100
    1313:	1305                	.insn	2, 0x1305
    1315:	04096e03          	.insn	4, 0x04096e03
    1319:	0100                	.insn	2, 0x0100
    131b:	2305                	.insn	2, 0x2305
    131d:	04090e03          	lb	t3,64(s2)
    1321:	0100                	.insn	2, 0x0100
    1323:	1a05                	.insn	2, 0x1a05
    1325:	04097d03          	.insn	4, 0x04097d03
    1329:	0100                	.insn	2, 0x0100
    132b:	04090703          	lb	a4,64(s2)
    132f:	0100                	.insn	2, 0x0100
    1331:	1705                	.insn	2, 0x1705
    1333:	04097f03          	.insn	4, 0x04097f03
    1337:	0100                	.insn	2, 0x0100
    1339:	2705                	.insn	2, 0x2705
    133b:	04090403          	lb	s0,64(s2)
    133f:	0100                	.insn	2, 0x0100
    1341:	1b05                	.insn	2, 0x1b05
    1343:	0306                	.insn	2, 0x0306
    1345:	0900                	.insn	2, 0x0900
    1347:	0004                	.insn	2, 0x0004
    1349:	0501                	.insn	2, 0x0501
    134b:	0618                	.insn	2, 0x0618
    134d:	04097f03          	.insn	4, 0x04097f03
    1351:	0100                	.insn	2, 0x0100
    1353:	0105                	.insn	2, 0x0105
    1355:	04090403          	lb	s0,64(s2)
    1359:	0100                	.insn	2, 0x0100
    135b:	0306                	.insn	2, 0x0306
    135d:	10097ed3          	.insn	4, 0x10097ed3
    1361:	0100                	.insn	2, 0x0100
    1363:	01ad030b          	.insn	4, 0x01ad030b
    1367:	0409                	.insn	2, 0x0409
    1369:	0100                	.insn	2, 0x0100
    136b:	0005                	.insn	2, 0x0005
    136d:	0306                	.insn	2, 0x0306
    136f:	7f80                	.insn	2, 0x7f80
    1371:	0809                	.insn	2, 0x0809
    1373:	0100                	.insn	2, 0x0100
    1375:	0905                	.insn	2, 0x0905
    1377:	030a                	.insn	2, 0x030a
    1379:	00400903          	lb	s2,4(zero) # 4 <$d.10+0x4>
    137d:	0601                	.insn	2, 0x0601
    137f:	08095003          	lhu	zero,128(s2)
    1383:	0100                	.insn	2, 0x0100
    1385:	04093003          	.insn	4, 0x04093003
    1389:	0100                	.insn	2, 0x0100
    138b:	2005                	.insn	2, 0x2005
    138d:	0306                	.insn	2, 0x0306
    138f:	0904                	.insn	2, 0x0904
    1391:	0004                	.insn	2, 0x0004
    1393:	0501                	.insn	2, 0x0501
    1395:	0314                	.insn	2, 0x0314
    1397:	00c9                	.insn	2, 0x00c9
    1399:	0c09                	.insn	2, 0x0c09
    139b:	0100                	.insn	2, 0x0100
    139d:	04097e03          	.insn	4, 0x04097e03
    13a1:	0100                	.insn	2, 0x0100
    13a3:	1505                	.insn	2, 0x1505
    13a5:	04090103          	lb	sp,64(s2)
    13a9:	0100                	.insn	2, 0x0100
    13ab:	1a05                	.insn	2, 0x1a05
    13ad:	0306                	.insn	2, 0x0306
    13af:	0900                	.insn	2, 0x0900
    13b1:	0004                	.insn	2, 0x0004
    13b3:	0501                	.insn	2, 0x0501
    13b5:	061f 7f03 0409      	.insn	6, 0x04097f03061f
    13bb:	0100                	.insn	2, 0x0100
    13bd:	0905                	.insn	2, 0x0905
    13bf:	097fbb03          	.insn	4, 0x097fbb03
    13c3:	0004                	.insn	2, 0x0004
    13c5:	0601                	.insn	2, 0x0601
    13c7:	14090003          	lb	zero,320(s2)
    13cb:	0100                	.insn	2, 0x0100
    13cd:	0105                	.insn	2, 0x0105
    13cf:	0306                	.insn	2, 0x0306
    13d1:	00c1                	.insn	2, 0x00c1
    13d3:	0409                	.insn	2, 0x0409
    13d5:	0100                	.insn	2, 0x0100
    13d7:	0306                	.insn	2, 0x0306
    13d9:	7f89                	.insn	2, 0x7f89
    13db:	0c09                	.insn	2, 0x0c09
    13dd:	0100                	.insn	2, 0x0100
    13df:	00f7030b          	.insn	4, 0x00f7030b
    13e3:	2809                	.insn	2, 0x2809
    13e5:	0100                	.insn	2, 0x0100
    13e7:	097f8903          	lb	s2,151(t6)
    13eb:	0008                	.insn	2, 0x0008
    13ed:	0501                	.insn	2, 0x0501
    13ef:	0620                	.insn	2, 0x0620
    13f1:	0900d903          	lhu	s2,144(ra)
    13f5:	001c                	.insn	2, 0x001c
    13f7:	0501                	.insn	2, 0x0501
    13f9:	0615                	.insn	2, 0x0615
    13fb:	04090003          	lb	zero,64(s2)
    13ff:	0100                	.insn	2, 0x0100
    1401:	2405                	.insn	2, 0x2405
    1403:	04090003          	lb	zero,64(s2)
    1407:	0100                	.insn	2, 0x0100
    1409:	0905                	.insn	2, 0x0905
    140b:	0306                	.insn	2, 0x0306
    140d:	0904                	.insn	2, 0x0904
    140f:	0004                	.insn	2, 0x0004
    1411:	0501                	.insn	2, 0x0501
    1413:	0616                	.insn	2, 0x0616
    1415:	04090003          	lb	zero,64(s2)
    1419:	0100                	.insn	2, 0x0100
    141b:	0d05                	.insn	2, 0x0d05
    141d:	0306                	.insn	2, 0x0306
    141f:	0902                	.insn	2, 0x0902
    1421:	0004                	.insn	2, 0x0004
    1423:	0601                	.insn	2, 0x0601
    1425:	10090003          	lb	zero,256(s2)
    1429:	0100                	.insn	2, 0x0100
    142b:	1705                	.insn	2, 0x1705
    142d:	0306                	.insn	2, 0x0306
    142f:	095a                	.insn	2, 0x095a
    1431:	0004                	.insn	2, 0x0004
    1433:	0501                	.insn	2, 0x0501
    1435:	0605                	.insn	2, 0x0605
    1437:	08090003          	lb	zero,128(s2)
    143b:	0100                	.insn	2, 0x0100
    143d:	0d05                	.insn	2, 0x0d05
    143f:	0306                	.insn	2, 0x0306
    1441:	0905                	.insn	2, 0x0905
    1443:	0004                	.insn	2, 0x0004
    1445:	0601                	.insn	2, 0x0601
    1447:	04090003          	lb	zero,64(s2)
    144b:	0100                	.insn	2, 0x0100
    144d:	0306                	.insn	2, 0x0306
    144f:	0908                	.insn	2, 0x0908
    1451:	0008                	.insn	2, 0x0008
    1453:	0601                	.insn	2, 0x0601
    1455:	04090003          	lb	zero,64(s2)
    1459:	0100                	.insn	2, 0x0100
    145b:	1105                	.insn	2, 0x1105
    145d:	0306                	.insn	2, 0x0306
    145f:	0908                	.insn	2, 0x0908
    1461:	0004                	.insn	2, 0x0004
    1463:	0601                	.insn	2, 0x0601
    1465:	097fb203          	.insn	4, 0x097fb203
    1469:	0004                	.insn	2, 0x0004
    146b:	0301                	.insn	2, 0x0301
    146d:	00ce                	.insn	2, 0x00ce
    146f:	0409                	.insn	2, 0x0409
    1471:	0100                	.insn	2, 0x0100
    1473:	04090003          	lb	zero,64(s2)
    1477:	0100                	.insn	2, 0x0100
    1479:	2005                	.insn	2, 0x2005
    147b:	0306                	.insn	2, 0x0306
    147d:	0901                	.insn	2, 0x0901
    147f:	0008                	.insn	2, 0x0008
    1481:	0501                	.insn	2, 0x0501
    1483:	0311                	.insn	2, 0x0311
    1485:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    148d:	0409 
    148f:	0100                	.insn	2, 0x0100
    1491:	0306                	.insn	2, 0x0306
    1493:	0901                	.insn	2, 0x0901
    1495:	0004                	.insn	2, 0x0004
    1497:	0501                	.insn	2, 0x0501
    1499:	061c                	.insn	2, 0x061c
    149b:	04090003          	lb	zero,64(s2)
    149f:	0100                	.insn	2, 0x0100
    14a1:	2005                	.insn	2, 0x2005
    14a3:	04090003          	lb	zero,64(s2)
    14a7:	0100                	.insn	2, 0x0100
    14a9:	1105                	.insn	2, 0x1105
    14ab:	0306                	.insn	2, 0x0306
    14ad:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    14b5:	0409 
    14b7:	0100                	.insn	2, 0x0100
    14b9:	04090003          	lb	zero,64(s2)
    14bd:	0100                	.insn	2, 0x0100
    14bf:	04090003          	lb	zero,64(s2)
    14c3:	0100                	.insn	2, 0x0100
    14c5:	04090003          	lb	zero,64(s2)
    14c9:	0100                	.insn	2, 0x0100
    14cb:	04090003          	lb	zero,64(s2)
    14cf:	0100                	.insn	2, 0x0100
    14d1:	04090003          	lb	zero,64(s2)
    14d5:	0100                	.insn	2, 0x0100
    14d7:	04090003          	lb	zero,64(s2)
    14db:	0100                	.insn	2, 0x0100
    14dd:	04090003          	lb	zero,64(s2)
    14e1:	0100                	.insn	2, 0x0100
    14e3:	04090003          	lb	zero,64(s2)
    14e7:	0100                	.insn	2, 0x0100
    14e9:	04090003          	lb	zero,64(s2)
    14ed:	0100                	.insn	2, 0x0100
    14ef:	04090003          	lb	zero,64(s2)
    14f3:	0100                	.insn	2, 0x0100
    14f5:	0d05                	.insn	2, 0x0d05
    14f7:	0306                	.insn	2, 0x0306
    14f9:	0905                	.insn	2, 0x0905
    14fb:	0004                	.insn	2, 0x0004
    14fd:	0601                	.insn	2, 0x0601
    14ff:	04090003          	lb	zero,64(s2)
    1503:	0100                	.insn	2, 0x0100
    1505:	1105                	.insn	2, 0x1105
    1507:	0306                	.insn	2, 0x0306
    1509:	097c                	.insn	2, 0x097c
    150b:	0008                	.insn	2, 0x0008
    150d:	0501                	.insn	2, 0x0501
    150f:	061c                	.insn	2, 0x061c
    1511:	04090003          	lb	zero,64(s2)
    1515:	0100                	.insn	2, 0x0100
    1517:	2005                	.insn	2, 0x2005
    1519:	04090003          	lb	zero,64(s2)
    151d:	0100                	.insn	2, 0x0100
    151f:	1105                	.insn	2, 0x1105
    1521:	0306                	.insn	2, 0x0306
    1523:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    152b:	0409 
    152d:	0100                	.insn	2, 0x0100
    152f:	0306                	.insn	2, 0x0306
    1531:	0901                	.insn	2, 0x0901
    1533:	0004                	.insn	2, 0x0004
    1535:	0501                	.insn	2, 0x0501
    1537:	061c                	.insn	2, 0x061c
    1539:	04090003          	lb	zero,64(s2)
    153d:	0100                	.insn	2, 0x0100
    153f:	2005                	.insn	2, 0x2005
    1541:	04090003          	lb	zero,64(s2)
    1545:	0100                	.insn	2, 0x0100
    1547:	1105                	.insn	2, 0x1105
    1549:	0306                	.insn	2, 0x0306
    154b:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    1553:	0409 
    1555:	0100                	.insn	2, 0x0100
    1557:	0306                	.insn	2, 0x0306
    1559:	0901                	.insn	2, 0x0901
    155b:	0004                	.insn	2, 0x0004
    155d:	0501                	.insn	2, 0x0501
    155f:	061c                	.insn	2, 0x061c
    1561:	04090003          	lb	zero,64(s2)
    1565:	0100                	.insn	2, 0x0100
    1567:	2005                	.insn	2, 0x2005
    1569:	04090003          	lb	zero,64(s2)
    156d:	0100                	.insn	2, 0x0100
    156f:	1105                	.insn	2, 0x1105
    1571:	0306                	.insn	2, 0x0306
    1573:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    157b:	0409 
    157d:	0100                	.insn	2, 0x0100
    157f:	0306                	.insn	2, 0x0306
    1581:	0901                	.insn	2, 0x0901
    1583:	0004                	.insn	2, 0x0004
    1585:	0501                	.insn	2, 0x0501
    1587:	061c                	.insn	2, 0x061c
    1589:	04090003          	lb	zero,64(s2)
    158d:	0100                	.insn	2, 0x0100
    158f:	2005                	.insn	2, 0x2005
    1591:	04090003          	lb	zero,64(s2)
    1595:	0100                	.insn	2, 0x0100
    1597:	1105                	.insn	2, 0x1105
    1599:	0306                	.insn	2, 0x0306
    159b:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    15a3:	0409 
    15a5:	0100                	.insn	2, 0x0100
    15a7:	0306                	.insn	2, 0x0306
    15a9:	0901                	.insn	2, 0x0901
    15ab:	0004                	.insn	2, 0x0004
    15ad:	0501                	.insn	2, 0x0501
    15af:	061c                	.insn	2, 0x061c
    15b1:	04090003          	lb	zero,64(s2)
    15b5:	0100                	.insn	2, 0x0100
    15b7:	2005                	.insn	2, 0x2005
    15b9:	04090003          	lb	zero,64(s2)
    15bd:	0100                	.insn	2, 0x0100
    15bf:	1105                	.insn	2, 0x1105
    15c1:	0306                	.insn	2, 0x0306
    15c3:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    15cb:	0409 
    15cd:	0100                	.insn	2, 0x0100
    15cf:	0306                	.insn	2, 0x0306
    15d1:	0901                	.insn	2, 0x0901
    15d3:	0004                	.insn	2, 0x0004
    15d5:	0501                	.insn	2, 0x0501
    15d7:	061c                	.insn	2, 0x061c
    15d9:	04090003          	lb	zero,64(s2)
    15dd:	0100                	.insn	2, 0x0100
    15df:	2005                	.insn	2, 0x2005
    15e1:	04090003          	lb	zero,64(s2)
    15e5:	0100                	.insn	2, 0x0100
    15e7:	0d05                	.insn	2, 0x0d05
    15e9:	0306                	.insn	2, 0x0306
    15eb:	0904                	.insn	2, 0x0904
    15ed:	0004                	.insn	2, 0x0004
    15ef:	0601                	.insn	2, 0x0601
    15f1:	04090003          	lb	zero,64(s2)
    15f5:	0100                	.insn	2, 0x0100
    15f7:	1505                	.insn	2, 0x1505
    15f9:	0306                	.insn	2, 0x0306
    15fb:	0905                	.insn	2, 0x0905
    15fd:	0004                	.insn	2, 0x0004
    15ff:	0501                	.insn	2, 0x0501
    1601:	030d                	.insn	2, 0x030d
    1603:	097d                	.insn	2, 0x097d
    1605:	0004                	.insn	2, 0x0004
    1607:	0501                	.insn	2, 0x0501
    1609:	061c                	.insn	2, 0x061c
    160b:	04090003          	lb	zero,64(s2)
    160f:	0100                	.insn	2, 0x0100
    1611:	2005                	.insn	2, 0x2005
    1613:	0306                	.insn	2, 0x0306
    1615:	0904                	.insn	2, 0x0904
    1617:	0004                	.insn	2, 0x0004
    1619:	0501                	.insn	2, 0x0501
    161b:	0624                	.insn	2, 0x0624
    161d:	04090003          	lb	zero,64(s2)
    1621:	0100                	.insn	2, 0x0100
    1623:	1505                	.insn	2, 0x1505
    1625:	0306                	.insn	2, 0x0306
    1627:	097f 0004 0301 0901 	.insn	10, 0x0004090103010004097f
    162f:	0004 
    1631:	0501                	.insn	2, 0x0501
    1633:	0620                	.insn	2, 0x0620
    1635:	04090003          	lb	zero,64(s2)
    1639:	0100                	.insn	2, 0x0100
    163b:	2405                	.insn	2, 0x2405
    163d:	04090003          	lb	zero,64(s2)
    1641:	0100                	.insn	2, 0x0100
    1643:	1505                	.insn	2, 0x1505
    1645:	0306                	.insn	2, 0x0306
    1647:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    164f:	0409 
    1651:	0100                	.insn	2, 0x0100
    1653:	097fa803          	lw	a6,151(t6)
    1657:	0004                	.insn	2, 0x0004
    1659:	0501                	.insn	2, 0x0501
    165b:	0612                	.insn	2, 0x0612
    165d:	0900e303          	.insn	4, 0x0900e303
    1661:	000c                	.insn	2, 0x000c
    1663:	0501                	.insn	2, 0x0501
    1665:	031c                	.insn	2, 0x031c
    1667:	097f 0004 0301 0904 	.insn	10, 0x0004090403010004097f
    166f:	0004 
    1671:	0301                	.insn	2, 0x0301
    1673:	0901                	.insn	2, 0x0901
    1675:	0004                	.insn	2, 0x0004
    1677:	0501                	.insn	2, 0x0501
    1679:	0318                	.insn	2, 0x0318
    167b:	00040903          	lb	s2,0(s0)
    167f:	0501                	.insn	2, 0x0501
    1681:	097c0323          	sb	s7,134(s8)
    1685:	0008                	.insn	2, 0x0008
    1687:	0501                	.insn	2, 0x0501
    1689:	0322                	.insn	2, 0x0322
    168b:	0901                	.insn	2, 0x0901
    168d:	0004                	.insn	2, 0x0004
    168f:	0501                	.insn	2, 0x0501
    1691:	0318                	.insn	2, 0x0318
    1693:	00040903          	lb	s2,0(s0)
    1697:	0501                	.insn	2, 0x0501
    1699:	061f 0003 0409      	.insn	6, 0x04090003061f
    169f:	0100                	.insn	2, 0x0100
    16a1:	1605                	.insn	2, 0x1605
    16a3:	0306                	.insn	2, 0x0306
    16a5:	097f 0004 0501 031c 	.insn	10, 0x0905031c05010004097f
    16ad:	0905 
    16af:	0004                	.insn	2, 0x0004
    16b1:	0301                	.insn	2, 0x0301
    16b3:	097f 0004 0301 0902 	.insn	10, 0x0004090203010004097f
    16bb:	0004 
    16bd:	0501                	.insn	2, 0x0501
    16bf:	0312                	.insn	2, 0x0312
    16c1:	0901                	.insn	2, 0x0901
    16c3:	0004                	.insn	2, 0x0004
    16c5:	0501                	.insn	2, 0x0501
    16c7:	0322                	.insn	2, 0x0322
    16c9:	097e                	.insn	2, 0x097e
    16cb:	0004                	.insn	2, 0x0004
    16cd:	0501                	.insn	2, 0x0501
    16cf:	097f0323          	sb	s7,134(t5)
    16d3:	0004                	.insn	2, 0x0004
    16d5:	0501                	.insn	2, 0x0501
    16d7:	0322                	.insn	2, 0x0322
    16d9:	0902                	.insn	2, 0x0902
    16db:	0004                	.insn	2, 0x0004
    16dd:	0301                	.insn	2, 0x0301
    16df:	0901                	.insn	2, 0x0901
    16e1:	0004                	.insn	2, 0x0004
    16e3:	0501                	.insn	2, 0x0501
    16e5:	0328                	.insn	2, 0x0328
    16e7:	097e                	.insn	2, 0x097e
    16e9:	0004                	.insn	2, 0x0004
    16eb:	0501                	.insn	2, 0x0501
    16ed:	0329                	.insn	2, 0x0329
    16ef:	0901                	.insn	2, 0x0901
    16f1:	0004                	.insn	2, 0x0004
    16f3:	0501                	.insn	2, 0x0501
    16f5:	097d0313          	addi	t1,s10,151
    16f9:	0004                	.insn	2, 0x0004
    16fb:	0501                	.insn	2, 0x0501
    16fd:	0a14                	.insn	2, 0x0a14
    16ff:	08090f03          	lb	t5,128(s2)
    1703:	0100                	.insn	2, 0x0100
    1705:	08090203          	lb	tp,128(s2)
    1709:	0100                	.insn	2, 0x0100
    170b:	04097e03          	.insn	4, 0x04097e03
    170f:	0100                	.insn	2, 0x0100
    1711:	1505                	.insn	2, 0x1505
    1713:	04090103          	lb	sp,64(s2)
    1717:	0100                	.insn	2, 0x0100
    1719:	1a05                	.insn	2, 0x1a05
    171b:	0306                	.insn	2, 0x0306
    171d:	0900                	.insn	2, 0x0900
    171f:	0004                	.insn	2, 0x0004
    1721:	0501                	.insn	2, 0x0501
    1723:	061f 7f03 0409      	.insn	6, 0x04097f03061f
    1729:	0100                	.insn	2, 0x0100
    172b:	0505                	.insn	2, 0x0505
    172d:	0306                	.insn	2, 0x0306
    172f:	0900                	.insn	2, 0x0900
    1731:	0004                	.insn	2, 0x0004
    1733:	0501                	.insn	2, 0x0501
    1735:	0600                	.insn	2, 0x0600
    1737:	04093503          	.insn	4, 0x04093503
    173b:	0100                	.insn	2, 0x0100
    173d:	0905                	.insn	2, 0x0905
    173f:	030a                	.insn	2, 0x030a
    1741:	00240903          	lb	s2,2(s0)
    1745:	0601                	.insn	2, 0x0601
    1747:	08090003          	lb	zero,128(s2)
    174b:	0100                	.insn	2, 0x0100
    174d:	2005                	.insn	2, 0x2005
    174f:	0306                	.insn	2, 0x0306
    1751:	0904                	.insn	2, 0x0904
    1753:	0004                	.insn	2, 0x0004
    1755:	0501                	.insn	2, 0x0501
    1757:	0314                	.insn	2, 0x0314
    1759:	0946                	.insn	2, 0x0946
    175b:	000c                	.insn	2, 0x000c
    175d:	0301                	.insn	2, 0x0301
    175f:	097e                	.insn	2, 0x097e
    1761:	0004                	.insn	2, 0x0004
    1763:	0501                	.insn	2, 0x0501
    1765:	0315                	.insn	2, 0x0315
    1767:	0901                	.insn	2, 0x0901
    1769:	0004                	.insn	2, 0x0004
    176b:	0501                	.insn	2, 0x0501
    176d:	061a                	.insn	2, 0x061a
    176f:	04090003          	lb	zero,64(s2)
    1773:	0100                	.insn	2, 0x0100
    1775:	1f05                	.insn	2, 0x1f05
    1777:	0306                	.insn	2, 0x0306
    1779:	097f 0004 0501 0309 	.insn	10, 0x093e030905010004097f
    1781:	093e 
    1783:	0004                	.insn	2, 0x0004
    1785:	0601                	.insn	2, 0x0601
    1787:	14090003          	lb	zero,320(s2)
    178b:	0100                	.insn	2, 0x0100
    178d:	097ec703          	lbu	a4,151(t4)
    1791:	0004                	.insn	2, 0x0004
    1793:	0501                	.insn	2, 0x0501
    1795:	0601                	.insn	2, 0x0601
    1797:	01eb030b          	.insn	4, 0x01eb030b
    179b:	2009                	.insn	2, 0x2009
    179d:	0100                	.insn	2, 0x0100
    179f:	0306                	.insn	2, 0x0306
    17a1:	7e95                	.insn	2, 0x7e95
    17a3:	0809                	.insn	2, 0x0809
    17a5:	0100                	.insn	2, 0x0100
    17a7:	2605                	.insn	2, 0x2605
    17a9:	0306                	.insn	2, 0x0306
    17ab:	01d6                	.insn	2, 0x01d6
    17ad:	2409                	.insn	2, 0x2409
    17af:	0100                	.insn	2, 0x0100
    17b1:	0905                	.insn	2, 0x0905
    17b3:	0306                	.insn	2, 0x0306
    17b5:	0900                	.insn	2, 0x0900
    17b7:	0004                	.insn	2, 0x0004
    17b9:	0501                	.insn	2, 0x0501
    17bb:	0618                	.insn	2, 0x0618
    17bd:	0c090803          	lb	a6,192(s2)
    17c1:	0100                	.insn	2, 0x0100
    17c3:	0e05                	.insn	2, 0x0e05
    17c5:	04097c03          	.insn	4, 0x04097c03
    17c9:	0100                	.insn	2, 0x0100
    17cb:	1805                	.insn	2, 0x1805
    17cd:	04097f03          	.insn	4, 0x04097f03
    17d1:	0100                	.insn	2, 0x0100
    17d3:	04090403          	lb	s0,64(s2)
    17d7:	0100                	.insn	2, 0x0100
    17d9:	1e05                	.insn	2, 0x1e05
    17db:	04090103          	lb	sp,64(s2)
    17df:	0100                	.insn	2, 0x0100
    17e1:	1405                	.insn	2, 0x1405
    17e3:	04090303          	lb	t1,64(s2)
    17e7:	0100                	.insn	2, 0x0100
    17e9:	1f05                	.insn	2, 0x1f05
    17eb:	08097c03          	.insn	4, 0x08097c03
    17ef:	0100                	.insn	2, 0x0100
    17f1:	1405                	.insn	2, 0x1405
    17f3:	04090403          	lb	s0,64(s2)
    17f7:	0100                	.insn	2, 0x0100
    17f9:	1b05                	.insn	2, 0x1b05
    17fb:	0306                	.insn	2, 0x0306
    17fd:	0900                	.insn	2, 0x0900
    17ff:	0004                	.insn	2, 0x0004
    1801:	0501                	.insn	2, 0x0501
    1803:	0618                	.insn	2, 0x0618
    1805:	04090403          	lb	s0,64(s2)
    1809:	0100                	.insn	2, 0x0100
    180b:	04097f03          	.insn	4, 0x04097f03
    180f:	0100                	.insn	2, 0x0100
    1811:	04090203          	lb	tp,64(s2)
    1815:	0100                	.insn	2, 0x0100
    1817:	0e05                	.insn	2, 0x0e05
    1819:	04090103          	lb	sp,64(s2)
    181d:	0100                	.insn	2, 0x0100
    181f:	1e05                	.insn	2, 0x1e05
    1821:	04097e03          	.insn	4, 0x04097e03
    1825:	0100                	.insn	2, 0x0100
    1827:	1f05                	.insn	2, 0x1f05
    1829:	04097f03          	.insn	4, 0x04097f03
    182d:	0100                	.insn	2, 0x0100
    182f:	1e05                	.insn	2, 0x1e05
    1831:	04090203          	lb	tp,64(s2)
    1835:	0100                	.insn	2, 0x0100
    1837:	04090103          	lb	sp,64(s2)
    183b:	0100                	.insn	2, 0x0100
    183d:	2405                	.insn	2, 0x2405
    183f:	04097e03          	.insn	4, 0x04097e03
    1843:	0100                	.insn	2, 0x0100
    1845:	2505                	.insn	2, 0x2505
    1847:	04090103          	lb	sp,64(s2)
    184b:	0100                	.insn	2, 0x0100
    184d:	0905                	.insn	2, 0x0905
    184f:	04090303          	lb	t1,64(s2)
    1853:	0100                	.insn	2, 0x0100
    1855:	1705                	.insn	2, 0x1705
    1857:	0c095303          	lhu	t1,192(s2)
    185b:	0100                	.insn	2, 0x0100
    185d:	0505                	.insn	2, 0x0505
    185f:	0306                	.insn	2, 0x0306
    1861:	0900                	.insn	2, 0x0900
    1863:	0008                	.insn	2, 0x0008
    1865:	0501                	.insn	2, 0x0501
    1867:	060d                	.insn	2, 0x060d
    1869:	04090403          	lb	s0,64(s2)
    186d:	0100                	.insn	2, 0x0100
    186f:	0306                	.insn	2, 0x0306
    1871:	0900                	.insn	2, 0x0900
    1873:	0004                	.insn	2, 0x0004
    1875:	0601                	.insn	2, 0x0601
    1877:	08090603          	lb	a2,128(s2)
    187b:	0100                	.insn	2, 0x0100
    187d:	0306                	.insn	2, 0x0306
    187f:	0900                	.insn	2, 0x0900
    1881:	0004                	.insn	2, 0x0004
    1883:	0501                	.insn	2, 0x0501
    1885:	0611                	.insn	2, 0x0611
    1887:	04090403          	lb	s0,64(s2)
    188b:	0100                	.insn	2, 0x0100
    188d:	0306                	.insn	2, 0x0306
    188f:	0900                	.insn	2, 0x0900
    1891:	0004                	.insn	2, 0x0004
    1893:	0301                	.insn	2, 0x0301
    1895:	0900                	.insn	2, 0x0900
    1897:	0004                	.insn	2, 0x0004
    1899:	0301                	.insn	2, 0x0301
    189b:	0900                	.insn	2, 0x0900
    189d:	0004                	.insn	2, 0x0004
    189f:	0301                	.insn	2, 0x0301
    18a1:	0900                	.insn	2, 0x0900
    18a3:	0004                	.insn	2, 0x0004
    18a5:	0301                	.insn	2, 0x0301
    18a7:	0900                	.insn	2, 0x0900
    18a9:	0004                	.insn	2, 0x0004
    18ab:	0301                	.insn	2, 0x0301
    18ad:	0900                	.insn	2, 0x0900
    18af:	0004                	.insn	2, 0x0004
    18b1:	0301                	.insn	2, 0x0301
    18b3:	0900                	.insn	2, 0x0900
    18b5:	0004                	.insn	2, 0x0004
    18b7:	0301                	.insn	2, 0x0301
    18b9:	0900                	.insn	2, 0x0900
    18bb:	0004                	.insn	2, 0x0004
    18bd:	0301                	.insn	2, 0x0301
    18bf:	0900                	.insn	2, 0x0900
    18c1:	0004                	.insn	2, 0x0004
    18c3:	0301                	.insn	2, 0x0301
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
    18e1:	0501                	.insn	2, 0x0501
    18e3:	060d                	.insn	2, 0x060d
    18e5:	04090403          	lb	s0,64(s2)
    18e9:	0100                	.insn	2, 0x0100
    18eb:	0306                	.insn	2, 0x0306
    18ed:	0900                	.insn	2, 0x0900
    18ef:	0004                	.insn	2, 0x0004
    18f1:	0501                	.insn	2, 0x0501
    18f3:	0611                	.insn	2, 0x0611
    18f5:	08097d03          	.insn	4, 0x08097d03
    18f9:	0100                	.insn	2, 0x0100
    18fb:	08097f03          	.insn	4, 0x08097f03
    18ff:	0100                	.insn	2, 0x0100
    1901:	0306                	.insn	2, 0x0306
    1903:	0900                	.insn	2, 0x0900
    1905:	0004                	.insn	2, 0x0004
    1907:	0601                	.insn	2, 0x0601
    1909:	04090103          	lb	sp,64(s2)
    190d:	0100                	.insn	2, 0x0100
    190f:	08097f03          	.insn	4, 0x08097f03
    1913:	0100                	.insn	2, 0x0100
    1915:	0306                	.insn	2, 0x0306
    1917:	0900                	.insn	2, 0x0900
    1919:	0004                	.insn	2, 0x0004
    191b:	0601                	.insn	2, 0x0601
    191d:	04090103          	lb	sp,64(s2)
    1921:	0100                	.insn	2, 0x0100
    1923:	08097f03          	.insn	4, 0x08097f03
    1927:	0100                	.insn	2, 0x0100
    1929:	0306                	.insn	2, 0x0306
    192b:	0900                	.insn	2, 0x0900
    192d:	0004                	.insn	2, 0x0004
    192f:	0601                	.insn	2, 0x0601
    1931:	04090103          	lb	sp,64(s2)
    1935:	0100                	.insn	2, 0x0100
    1937:	08097f03          	.insn	4, 0x08097f03
    193b:	0100                	.insn	2, 0x0100
    193d:	0306                	.insn	2, 0x0306
    193f:	0900                	.insn	2, 0x0900
    1941:	0004                	.insn	2, 0x0004
    1943:	0601                	.insn	2, 0x0601
    1945:	04090103          	lb	sp,64(s2)
    1949:	0100                	.insn	2, 0x0100
    194b:	08097f03          	.insn	4, 0x08097f03
    194f:	0100                	.insn	2, 0x0100
    1951:	0306                	.insn	2, 0x0306
    1953:	0900                	.insn	2, 0x0900
    1955:	0004                	.insn	2, 0x0004
    1957:	0601                	.insn	2, 0x0601
    1959:	04090103          	lb	sp,64(s2)
    195d:	0100                	.insn	2, 0x0100
    195f:	08097f03          	.insn	4, 0x08097f03
    1963:	0100                	.insn	2, 0x0100
    1965:	0306                	.insn	2, 0x0306
    1967:	0900                	.insn	2, 0x0900
    1969:	0004                	.insn	2, 0x0004
    196b:	0601                	.insn	2, 0x0601
    196d:	04090103          	lb	sp,64(s2)
    1971:	0100                	.insn	2, 0x0100
    1973:	08097f03          	.insn	4, 0x08097f03
    1977:	0100                	.insn	2, 0x0100
    1979:	0306                	.insn	2, 0x0306
    197b:	0900                	.insn	2, 0x0900
    197d:	0004                	.insn	2, 0x0004
    197f:	0601                	.insn	2, 0x0601
    1981:	04090103          	lb	sp,64(s2)
    1985:	0100                	.insn	2, 0x0100
    1987:	0d05                	.insn	2, 0x0d05
    1989:	08090303          	lb	t1,128(s2)
    198d:	0100                	.insn	2, 0x0100
    198f:	0306                	.insn	2, 0x0306
    1991:	0900                	.insn	2, 0x0900
    1993:	0004                	.insn	2, 0x0004
    1995:	0601                	.insn	2, 0x0601
    1997:	04090103          	lb	sp,64(s2)
    199b:	0100                	.insn	2, 0x0100
    199d:	1505                	.insn	2, 0x1505
    199f:	0c090203          	lb	tp,192(s2)
    19a3:	0100                	.insn	2, 0x0100
    19a5:	0306                	.insn	2, 0x0306
    19a7:	0900                	.insn	2, 0x0900
    19a9:	0004                	.insn	2, 0x0004
    19ab:	0301                	.insn	2, 0x0301
    19ad:	0900                	.insn	2, 0x0900
    19af:	0004                	.insn	2, 0x0004
    19b1:	0301                	.insn	2, 0x0301
    19b3:	0900                	.insn	2, 0x0900
    19b5:	0004                	.insn	2, 0x0004
    19b7:	0301                	.insn	2, 0x0301
    19b9:	0900                	.insn	2, 0x0900
    19bb:	0004                	.insn	2, 0x0004
    19bd:	0301                	.insn	2, 0x0301
    19bf:	0900                	.insn	2, 0x0900
    19c1:	0004                	.insn	2, 0x0004
    19c3:	0601                	.insn	2, 0x0601
    19c5:	08090103          	lb	sp,128(s2)
    19c9:	0100                	.insn	2, 0x0100
    19cb:	08097f03          	.insn	4, 0x08097f03
    19cf:	0100                	.insn	2, 0x0100
    19d1:	0306                	.insn	2, 0x0306
    19d3:	0900                	.insn	2, 0x0900
    19d5:	0004                	.insn	2, 0x0004
    19d7:	0601                	.insn	2, 0x0601
    19d9:	04090103          	lb	sp,64(s2)
    19dd:	0100                	.insn	2, 0x0100
    19df:	08097f03          	.insn	4, 0x08097f03
    19e3:	0100                	.insn	2, 0x0100
    19e5:	0306                	.insn	2, 0x0306
    19e7:	0900                	.insn	2, 0x0900
    19e9:	0004                	.insn	2, 0x0004
    19eb:	0601                	.insn	2, 0x0601
    19ed:	04090103          	lb	sp,64(s2)
    19f1:	0100                	.insn	2, 0x0100
    19f3:	0306                	.insn	2, 0x0306
    19f5:	7eae                	.insn	2, 0x7eae
    19f7:	0809                	.insn	2, 0x0809
    19f9:	0100                	.insn	2, 0x0100
    19fb:	0409                	.insn	2, 0x0409
    19fd:	0000                	.insn	2, 0x0000
    19ff:	0101                	.insn	2, 0x0101
