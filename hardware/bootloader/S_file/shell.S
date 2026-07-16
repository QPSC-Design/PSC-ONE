
./build/shell.elf:     ファイル形式 elf32-littleriscv


セクション .text の逆アセンブル:

00400000 <start>:

/* ===== エントリ ===== */
__attribute__((section(".text.start")))
__attribute__((naked))
void start(void) {
    __asm__ __volatile__(
  400000:	00423537          	lui	a0,0x423
  400004:	65050513          	addi	a0,a0,1616 # 423650 <__user_stack_top>
  400008:	00050113          	mv	sp,a0
  40000c:	00000097          	auipc	ra,0x0
  400010:	010080e7          	jalr	16(ra) # 40001c <main>
  400014:	00001097          	auipc	ra,0x1
  400018:	b20080e7          	jalr	-1248(ra) # 400b34 <exit>

0040001c <main>:
// shell.c
#include "user.h"
#include "fat32.h"

void main(void) {
  40001c:	ef010113          	addi	sp,sp,-272
  400020:	10112623          	sw	ra,268(sp)
  400024:	10812423          	sw	s0,264(sp)
  400028:	10912223          	sw	s1,260(sp)
  40002c:	11212023          	sw	s2,256(sp)
  400030:	0f312e23          	sw	s3,252(sp)
  400034:	0f412c23          	sw	s4,248(sp)
  400038:	0f512a23          	sw	s5,244(sp)
  40003c:	0f612823          	sw	s6,240(sp)
  400040:	0f712623          	sw	s7,236(sp)
  400044:	0f812423          	sw	s8,232(sp)
  400048:	0f912223          	sw	s9,228(sp)
  40004c:	0fa12023          	sw	s10,224(sp)
  400050:	0db12e23          	sw	s11,220(sp)

    // DUMP API call
    //call_dump_api();


    printf("shell start.\n");
  400054:	00402537          	lui	a0,0x402
  400058:	35650513          	addi	a0,a0,854 # 402356 <$d.1>
  40005c:	00001097          	auipc	ra,0x1
  400060:	f2c080e7          	jalr	-212(ra) # 400f88 <printf>
  400064:	00000d13          	li	s10,0
  400068:	00402537          	lui	a0,0x402
  40006c:	29750413          	addi	s0,a0,663 # 402297 <__modsi3+0x1c7>
  400070:	00402537          	lui	a0,0x402
  400074:	16750493          	addi	s1,a0,359 # 402167 <__modsi3+0x97>
  400078:	00402537          	lui	a0,0x402
  40007c:	29150513          	addi	a0,a0,657 # 402291 <__modsi3+0x1c1>
  400080:	08a12c23          	sw	a0,152(sp)
  400084:	00402537          	lui	a0,0x402
  400088:	20c50513          	addi	a0,a0,524 # 40220c <__modsi3+0x13c>
  40008c:	08a12623          	sw	a0,140(sp)
  400090:	00402537          	lui	a0,0x402
  400094:	36450513          	addi	a0,a0,868 # 402364 <$d.1+0xe>
  400098:	08a12a23          	sw	a0,148(sp)
  40009c:	00402537          	lui	a0,0x402
  4000a0:	23050513          	addi	a0,a0,560 # 402230 <__modsi3+0x160>
  4000a4:	08a12823          	sw	a0,144(sp)
  4000a8:	00402537          	lui	a0,0x402
  4000ac:	3d350513          	addi	a0,a0,979 # 4023d3 <$d.1+0x7d>
  4000b0:	06a12e23          	sw	a0,124(sp)
  4000b4:	00018537          	lui	a0,0x18
  4000b8:	6a050513          	addi	a0,a0,1696 # 186a0 <$d.5+0x16eaf>
  4000bc:	06a12c23          	sw	a0,120(sp)
  4000c0:	00402537          	lui	a0,0x402
  4000c4:	20250513          	addi	a0,a0,514 # 402202 <__modsi3+0x132>
  4000c8:	08a12423          	sw	a0,136(sp)
  4000cc:	00402537          	lui	a0,0x402
  4000d0:	26650513          	addi	a0,a0,614 # 402266 <__modsi3+0x196>
  4000d4:	08a12223          	sw	a0,132(sp)
  4000d8:	00402537          	lui	a0,0x402
  4000dc:	2a450513          	addi	a0,a0,676 # 4022a4 <__modsi3+0x1d4>
  4000e0:	06a12623          	sw	a0,108(sp)
  4000e4:	00402537          	lui	a0,0x402
  4000e8:	31a50513          	addi	a0,a0,794 # 40231a <__modsi3+0x24a>
  4000ec:	08a12023          	sw	a0,128(sp)
  4000f0:	00402537          	lui	a0,0x402
  4000f4:	2fa50513          	addi	a0,a0,762 # 4022fa <__modsi3+0x22a>
  4000f8:	06a12423          	sw	a0,104(sp)
  4000fc:	00402537          	lui	a0,0x402
  400100:	2c050513          	addi	a0,a0,704 # 4022c0 <__modsi3+0x1f0>
  400104:	06a12a23          	sw	a0,116(sp)
  400108:	00402537          	lui	a0,0x402
  40010c:	36950513          	addi	a0,a0,873 # 402369 <$d.1+0x13>
  400110:	06a12023          	sw	a0,96(sp)
  400114:	00402537          	lui	a0,0x402
  400118:	1d650513          	addi	a0,a0,470 # 4021d6 <__modsi3+0x106>
  40011c:	06a12823          	sw	a0,112(sp)
  400120:	00402537          	lui	a0,0x402
  400124:	3ba50513          	addi	a0,a0,954 # 4023ba <$d.1+0x64>
  400128:	04a12c23          	sw	a0,88(sp)
  40012c:	00402537          	lui	a0,0x402
  400130:	1de50513          	addi	a0,a0,478 # 4021de <__modsi3+0x10e>
  400134:	06a12223          	sw	a0,100(sp)
  400138:	00402537          	lui	a0,0x402
  40013c:	40250513          	addi	a0,a0,1026 # 402402 <$d.1+0x10>
  400140:	04a12823          	sw	a0,80(sp)
  400144:	00402537          	lui	a0,0x402
  400148:	1ae50513          	addi	a0,a0,430 # 4021ae <__modsi3+0xde>
  40014c:	04a12423          	sw	a0,72(sp)
  400150:	00402537          	lui	a0,0x402
  400154:	26f50513          	addi	a0,a0,623 # 40226f <__modsi3+0x19f>
  400158:	04a12e23          	sw	a0,92(sp)
  40015c:	00402537          	lui	a0,0x402
  400160:	2ca50513          	addi	a0,a0,714 # 4022ca <__modsi3+0x1fa>
  400164:	04a12223          	sw	a0,68(sp)
  400168:	00402537          	lui	a0,0x402
  40016c:	41c50513          	addi	a0,a0,1052 # 40241c <$d.1+0x2a>
  400170:	02a12a23          	sw	a0,52(sp)
  400174:	00402537          	lui	a0,0x402
  400178:	34350513          	addi	a0,a0,835 # 402343 <$d.2+0x8>
  40017c:	02a12823          	sw	a0,48(sp)
  400180:	00402537          	lui	a0,0x402
  400184:	38350513          	addi	a0,a0,899 # 402383 <$d.1+0x2d>
  400188:	02a12623          	sw	a0,44(sp)
  40018c:	00402537          	lui	a0,0x402
  400190:	39b50513          	addi	a0,a0,923 # 40239b <$d.1+0x45>
  400194:	02a12423          	sw	a0,40(sp)
  400198:	00402537          	lui	a0,0x402
  40019c:	2eb50513          	addi	a0,a0,747 # 4022eb <__modsi3+0x21b>
  4001a0:	02a12223          	sw	a0,36(sp)
  4001a4:	00402537          	lui	a0,0x402
  4001a8:	17450513          	addi	a0,a0,372 # 402174 <__modsi3+0xa4>
  4001ac:	04a12a23          	sw	a0,84(sp)
  4001b0:	00402537          	lui	a0,0x402
  4001b4:	17d50513          	addi	a0,a0,381 # 40217d <__modsi3+0xad>
  4001b8:	04a12623          	sw	a0,76(sp)
  4001bc:	00402537          	lui	a0,0x402
  4001c0:	13050513          	addi	a0,a0,304 # 402130 <__modsi3+0x60>
  4001c4:	02a12c23          	sw	a0,56(sp)
  4001c8:	00402537          	lui	a0,0x402
  4001cc:	38b50513          	addi	a0,a0,907 # 40238b <$d.1+0x35>
  4001d0:	04a12023          	sw	a0,64(sp)
  4001d4:	00402537          	lui	a0,0x402
  4001d8:	1e750513          	addi	a0,a0,487 # 4021e7 <__modsi3+0x117>
  4001dc:	00a12823          	sw	a0,16(sp)
  4001e0:	00402537          	lui	a0,0x402
  4001e4:	18750513          	addi	a0,a0,391 # 402187 <__modsi3+0xb7>
  4001e8:	00a12423          	sw	a0,8(sp)
  4001ec:	00402537          	lui	a0,0x402
  4001f0:	31550513          	addi	a0,a0,789 # 402315 <__modsi3+0x245>
  4001f4:	02a12e23          	sw	a0,60(sp)
  4001f8:	00402537          	lui	a0,0x402
  4001fc:	2b550513          	addi	a0,a0,693 # 4022b5 <__modsi3+0x1e5>
  400200:	00a12623          	sw	a0,12(sp)
  400204:	00402537          	lui	a0,0x402
  400208:	42950513          	addi	a0,a0,1065 # 402429 <$d.1+0x37>
  40020c:	02a12023          	sw	a0,32(sp)
  400210:	00402537          	lui	a0,0x402
  400214:	3ed50513          	addi	a0,a0,1005 # 4023ed <$d.1+0x97>
  400218:	00a12e23          	sw	a0,28(sp)
  40021c:	00402537          	lui	a0,0x402
  400220:	35450513          	addi	a0,a0,852 # 402354 <$d.2+0x19>
  400224:	00a12c23          	sw	a0,24(sp)
  400228:	00402537          	lui	a0,0x402
  40022c:	23750513          	addi	a0,a0,567 # 402237 <__modsi3+0x167>
  400230:	00a12a23          	sw	a0,20(sp)
  400234:	02000c93          	li	s9,32
  400238:	00a00c13          	li	s8,10
  40023c:	00c00b93          	li	s7,12
  400240:	00800b13          	li	s6,8
  400244:	00900a93          	li	s5,9
  400248:	01f00a13          	li	s4,31
  40024c:	07f00913          	li	s2,127
  400250:	0140006f          	j	400264 <main+0x248>
  400254:	08c12503          	lw	a0,140(sp)

        if (argc == 0) continue;

        /* ===== コマンド分岐 ===== */
        if (strcmp(argv[0], "hello") == 0) {
            printf("Hello world from shell!\n");
  400258:	00001097          	auipc	ra,0x1
  40025c:	d30080e7          	jalr	-720(ra) # 400f88 <printf>
  400260:	01f00a13          	li	s4,31
        putchar(0x1B); putchar('['); putchar('3'); putchar('4'); putchar('m'); // 青
  400264:	01b00513          	li	a0,27
  400268:	00001097          	auipc	ra,0x1
  40026c:	c40080e7          	jalr	-960(ra) # 400ea8 <putchar>
  400270:	05b00513          	li	a0,91
  400274:	00001097          	auipc	ra,0x1
  400278:	c34080e7          	jalr	-972(ra) # 400ea8 <putchar>
  40027c:	03300513          	li	a0,51
  400280:	00001097          	auipc	ra,0x1
  400284:	c28080e7          	jalr	-984(ra) # 400ea8 <putchar>
  400288:	03400513          	li	a0,52
  40028c:	00001097          	auipc	ra,0x1
  400290:	c1c080e7          	jalr	-996(ra) # 400ea8 <putchar>
  400294:	06d00513          	li	a0,109
  400298:	00001097          	auipc	ra,0x1
  40029c:	c10080e7          	jalr	-1008(ra) # 400ea8 <putchar>
        putchar('P');
  4002a0:	05000513          	li	a0,80
  4002a4:	00001097          	auipc	ra,0x1
  4002a8:	c04080e7          	jalr	-1020(ra) # 400ea8 <putchar>
        putchar('S');
  4002ac:	05300513          	li	a0,83
  4002b0:	00001097          	auipc	ra,0x1
  4002b4:	bf8080e7          	jalr	-1032(ra) # 400ea8 <putchar>
        putchar('C');
  4002b8:	04300513          	li	a0,67
  4002bc:	00001097          	auipc	ra,0x1
  4002c0:	bec080e7          	jalr	-1044(ra) # 400ea8 <putchar>
        putchar('_');
  4002c4:	05f00513          	li	a0,95
  4002c8:	00001097          	auipc	ra,0x1
  4002cc:	be0080e7          	jalr	-1056(ra) # 400ea8 <putchar>
        putchar('O');
  4002d0:	04f00513          	li	a0,79
  4002d4:	00001097          	auipc	ra,0x1
  4002d8:	bd4080e7          	jalr	-1068(ra) # 400ea8 <putchar>
        putchar('S');
  4002dc:	05300513          	li	a0,83
  4002e0:	00001097          	auipc	ra,0x1
  4002e4:	bc8080e7          	jalr	-1080(ra) # 400ea8 <putchar>
        putchar('>');
  4002e8:	03e00513          	li	a0,62
  4002ec:	00001097          	auipc	ra,0x1
  4002f0:	bbc080e7          	jalr	-1092(ra) # 400ea8 <putchar>
        putchar(' ');
  4002f4:	02000513          	li	a0,32
  4002f8:	00001097          	auipc	ra,0x1
  4002fc:	bb0080e7          	jalr	-1104(ra) # 400ea8 <putchar>
        putchar(0x1B); putchar('['); putchar('0'); putchar('m'); // リセット
  400300:	01b00513          	li	a0,27
  400304:	00001097          	auipc	ra,0x1
  400308:	ba4080e7          	jalr	-1116(ra) # 400ea8 <putchar>
  40030c:	05b00513          	li	a0,91
  400310:	00001097          	auipc	ra,0x1
  400314:	b98080e7          	jalr	-1128(ra) # 400ea8 <putchar>
  400318:	03000513          	li	a0,48
  40031c:	00001097          	auipc	ra,0x1
  400320:	b8c080e7          	jalr	-1140(ra) # 400ea8 <putchar>
  400324:	06d00513          	li	a0,109
  400328:	00000993          	li	s3,0
  40032c:	0ff57513          	zext.b	a0,a0
  400330:	00001097          	auipc	ra,0x1
  400334:	b78080e7          	jalr	-1160(ra) # 400ea8 <putchar>
  400338:	00c0006f          	j	400344 <main+0x328>
            if (ch == 8 || ch == 127) {
  40033c:	07251c63          	bne	a0,s2,4003b4 <main+0x398>
                if (len > 0) {
  400340:	0b304063          	bgtz	s3,4003e0 <main+0x3c4>
            uint32_t sw = poll_switch_api() & 0x03;
  400344:	00001097          	auipc	ra,0x1
  400348:	0cc080e7          	jalr	204(ra) # 401410 <poll_switch_api>
            bool sw1_pressed = ((prev_sw & 0x01) != 0) && ((sw & 0x01) == 0);
  40034c:	001d7593          	andi	a1,s10,1
            uint32_t sw = poll_switch_api() & 0x03;
  400350:	00050d93          	mv	s11,a0
            if (sw1_pressed) {
  400354:	00058c63          	beqz	a1,40036c <main+0x350>
  400358:	001df513          	andi	a0,s11,1
  40035c:	00051863          	bnez	a0,40036c <main+0x350>
                printf("SW1 pressed\n");
  400360:	00040513          	mv	a0,s0
  400364:	00001097          	auipc	ra,0x1
  400368:	c24080e7          	jalr	-988(ra) # 400f88 <printf>
  40036c:	001d5513          	srli	a0,s10,0x1
  400370:	002df593          	andi	a1,s11,2
  400374:	0015b593          	seqz	a1,a1
  400378:	00b57533          	and	a0,a0,a1
            if (sw2_pressed) {
  40037c:	00050863          	beqz	a0,40038c <main+0x370>
                printf("SW2 pressed\n");
  400380:	00048513          	mv	a0,s1
  400384:	00001097          	auipc	ra,0x1
  400388:	c04080e7          	jalr	-1020(ra) # 400f88 <printf>
  40038c:	003dfd13          	andi	s10,s11,3
            int ch = getchar_timeout();
  400390:	00001097          	auipc	ra,0x1
  400394:	060080e7          	jalr	96(ra) # 4013f0 <getchar_timeout>
            if (ch < 0) {
  400398:	fa0546e3          	bltz	a0,400344 <main+0x328>
            if (ch == '\n' && len == 0) {
  40039c:	01851463          	bne	a0,s8,4003a4 <main+0x388>
  4003a0:	fa0982e3          	beqz	s3,400344 <main+0x328>
            if (ch == 8 || ch == 127) {
  4003a4:	f8abcce3          	blt	s7,a0,40033c <main+0x320>
  4003a8:	f9650ce3          	beq	a0,s6,400340 <main+0x324>
  4003ac:	01851863          	bne	a0,s8,4003bc <main+0x3a0>
  4003b0:	0540006f          	j	400404 <main+0x3e8>
  4003b4:	00d00593          	li	a1,13
  4003b8:	04b50663          	beq	a0,a1,400404 <main+0x3e8>
  4003bc:	00aa6463          	bltu	s4,a0,4003c4 <main+0x3a8>
  4003c0:	f95512e3          	bne	a0,s5,400344 <main+0x328>
            if (len >= (int)sizeof(cmdline) - 1) {
  4003c4:	01e00593          	li	a1,30
  4003c8:	e935cee3          	blt	a1,s3,400264 <main+0x248>
            cmdline[len++] = (char)ch;
  4003cc:	0bc10593          	addi	a1,sp,188
  4003d0:	013585b3          	add	a1,a1,s3
  4003d4:	00198993          	addi	s3,s3,1
  4003d8:	00a58023          	sb	a0,0(a1)
  4003dc:	f51ff06f          	j	40032c <main+0x310>
                    len--;
  4003e0:	fff98993          	addi	s3,s3,-1
                    putchar('\b');
  4003e4:	00800513          	li	a0,8
  4003e8:	00001097          	auipc	ra,0x1
  4003ec:	ac0080e7          	jalr	-1344(ra) # 400ea8 <putchar>
                    putchar(' ');
  4003f0:	02000513          	li	a0,32
  4003f4:	00001097          	auipc	ra,0x1
  4003f8:	ab4080e7          	jalr	-1356(ra) # 400ea8 <putchar>
  4003fc:	00800513          	li	a0,8
  400400:	f2dff06f          	j	40032c <main+0x310>
                putchar('\n');
  400404:	00a00513          	li	a0,10
  400408:	00001097          	auipc	ra,0x1
  40040c:	aa0080e7          	jalr	-1376(ra) # 400ea8 <putchar>
                cmdline[len] = '\0';
  400410:	0bc10513          	addi	a0,sp,188
  400414:	01350533          	add	a0,a0,s3
  400418:	00050023          	sb	zero,0(a0)
  40041c:	e40984e3          	beqz	s3,400264 <main+0x248>
  400420:	0bc10513          	addi	a0,sp,188
  400424:	0080006f          	j	40042c <main+0x410>
        while (*p == ' ' || *p == '\t') p++;
  400428:	00150513          	addi	a0,a0,1
  40042c:	00054583          	lbu	a1,0(a0)
  400430:	ff558ce3          	beq	a1,s5,400428 <main+0x40c>
  400434:	ff958ae3          	beq	a1,s9,400428 <main+0x40c>
  400438:	e20586e3          	beqz	a1,400264 <main+0x248>
  40043c:	00000a13          	li	s4,0
  400440:	09c10693          	addi	a3,sp,156
  400444:	00600713          	li	a4,6
  400448:	00050593          	mv	a1,a0
  40044c:	000a0993          	mv	s3,s4
            argv[argc++] = p;
  400450:	001a0a13          	addi	s4,s4,1
  400454:	00299513          	slli	a0,s3,0x2
  400458:	00a68533          	add	a0,a3,a0
  40045c:	00b52023          	sw	a1,0(a0)
            while (*p && *p != ' ' && *p != '\t') p++;
  400460:	00158513          	addi	a0,a1,1
  400464:	0005c603          	lbu	a2,0(a1)
  400468:	04060063          	beqz	a2,4004a8 <main+0x48c>
  40046c:	01560e63          	beq	a2,s5,400488 <main+0x46c>
  400470:	01960c63          	beq	a2,s9,400488 <main+0x46c>
  400474:	00158593          	addi	a1,a1,1
  400478:	00150513          	addi	a0,a0,1
  40047c:	0005c603          	lbu	a2,0(a1)
  400480:	fe0616e3          	bnez	a2,40046c <main+0x450>
  400484:	0240006f          	j	4004a8 <main+0x48c>
            *p++ = '\0';
  400488:	00058023          	sb	zero,0(a1)
  40048c:	0080006f          	j	400494 <main+0x478>
  400490:	00150513          	addi	a0,a0,1
            while (*p == ' ' || *p == '\t') p++;
  400494:	00054583          	lbu	a1,0(a0)
  400498:	ff958ce3          	beq	a1,s9,400490 <main+0x474>
  40049c:	ff558ae3          	beq	a1,s5,400490 <main+0x474>
        while (*p && argc < ARGV_MAX) {
  4004a0:	00058463          	beqz	a1,4004a8 <main+0x48c>
  4004a4:	fb3772e3          	bgeu	a4,s3,400448 <main+0x42c>
        if (strcmp(argv[0], "hello") == 0) {
  4004a8:	09c12503          	lw	a0,156(sp)
  4004ac:	00050d93          	mv	s11,a0
  4004b0:	09812583          	lw	a1,152(sp)
  4004b4:	00001097          	auipc	ra,0x1
  4004b8:	e00080e7          	jalr	-512(ra) # 4012b4 <strcmp>
  4004bc:	d8050ce3          	beqz	a0,400254 <main+0x238>

        // ---- Dump ----
        } else if (strcmp(argv[0], "dump") == 0) {
  4004c0:	000d8513          	mv	a0,s11
  4004c4:	09412583          	lw	a1,148(sp)
  4004c8:	00001097          	auipc	ra,0x1
  4004cc:	dec080e7          	jalr	-532(ra) # 4012b4 <strcmp>
  4004d0:	14050463          	beqz	a0,400618 <main+0x5fc>
            unsigned lenb = (argc >= 3) ? parse_u32(argv[2]) : 0x100;
            hexdump((const void*)addr, lenb, (uintptr_t)addr);
        */

        // ---- 素数出力サンプル ----
        } else if (strcmp(argv[0], "primes") == 0) {
  4004d4:	000d8513          	mv	a0,s11
  4004d8:	09012583          	lw	a1,144(sp)
  4004dc:	00001097          	auipc	ra,0x1
  4004e0:	dd8080e7          	jalr	-552(ra) # 4012b4 <strcmp>
  4004e4:	01f00a13          	li	s4,31
  4004e8:	18050063          	beqz	a0,400668 <main+0x64c>
                }
            }
            cmd_primes(max);

        // ---- セルフテスト ----
        } else if (strcmp(argv[0], "self_test") == 0) {
  4004ec:	000d8513          	mv	a0,s11
  4004f0:	08812583          	lw	a1,136(sp)
  4004f4:	00001097          	auipc	ra,0x1
  4004f8:	dc0080e7          	jalr	-576(ra) # 4012b4 <strcmp>
  4004fc:	d60504e3          	beqz	a0,400264 <main+0x248>
            //TBD
            //cmd_primes(max);

        // ---- SynapEngine ----
        } else if (strcmp(argv[0], "sa_start") == 0) {
  400500:	000d8513          	mv	a0,s11
  400504:	08412583          	lw	a1,132(sp)
  400508:	00001097          	auipc	ra,0x1
  40050c:	dac080e7          	jalr	-596(ra) # 4012b4 <strcmp>
  400510:	1a050063          	beqz	a0,4006b0 <main+0x694>
            }
            // SA API call 
            call_sa_api(matrix_max);

        // ---- I2S MIC READ ----
        } else if (strcmp(argv[0], "mic_read") == 0) {
  400514:	000d8513          	mv	a0,s11
  400518:	08012583          	lw	a1,128(sp)
  40051c:	00001097          	auipc	ra,0x1
  400520:	d98080e7          	jalr	-616(ra) # 4012b4 <strcmp>
  400524:	1c050263          	beqz	a0,4006e8 <main+0x6cc>

            unsigned count = parse_u32(argv[1]);
            call_mic_api(count);

        // ---- I2S MIC WRITE to FILE ----
        } else if (strcmp(argv[0], "mic_write") == 0) {
  400528:	000d8513          	mv	a0,s11
  40052c:	07412583          	lw	a1,116(sp)
  400530:	00001097          	auipc	ra,0x1
  400534:	d84080e7          	jalr	-636(ra) # 4012b4 <strcmp>
  400538:	28050e63          	beqz	a0,4007d4 <main+0x7b8>
            unsigned count = parse_u32(argv[1]);
            //call_mic_write_api(count);
            call_mic_write_file(count);

        // ---- SDカードREAD ----
        } else if (strcmp(argv[0], "sd_read") == 0) {
  40053c:	000d8513          	mv	a0,s11
  400540:	07012583          	lw	a1,112(sp)
  400544:	00001097          	auipc	ra,0x1
  400548:	d70080e7          	jalr	-656(ra) # 4012b4 <strcmp>
  40054c:	2a050e63          	beqz	a0,400808 <main+0x7ec>

            unsigned sd_sector = parse_u32(argv[1]);
            call_sd_read_api(sd_sector);

        // ---- SDカードWRITE TEST----
        } else if (strcmp(argv[0], "sd_write") == 0) {
  400550:	000d8513          	mv	a0,s11
  400554:	06412583          	lw	a1,100(sp)
  400558:	00001097          	auipc	ra,0x1
  40055c:	d5c080e7          	jalr	-676(ra) # 4012b4 <strcmp>
  400560:	32050a63          	beqz	a0,400894 <main+0x878>
                goto prompt;
            }
            call_sd_write_test_api(sd_sector);

        // ---- FAT32 Info ----
        } else if (strcmp(argv[0], "fat32_info") == 0) {
  400564:	000d8513          	mv	a0,s11
  400568:	05c12583          	lw	a1,92(sp)
  40056c:	00001097          	auipc	ra,0x1
  400570:	d48080e7          	jalr	-696(ra) # 4012b4 <strcmp>
  400574:	34050c63          	beqz	a0,4008cc <main+0x8b0>
            printf("spc=%x\n",           g_fat32.sectors_per_cluster);
            printf("fat_begin=%x\n",     g_fat32.fat_begin);
            printf("data_begin=%x\n",    g_fat32.data_begin);

        // ---- FAT32 ls ----
        } else if (strcmp(argv[0], "fat32_ls") == 0) {
  400578:	000d8513          	mv	a0,s11
  40057c:	05412583          	lw	a1,84(sp)
  400580:	00001097          	auipc	ra,0x1
  400584:	d34080e7          	jalr	-716(ra) # 4012b4 <strcmp>
  400588:	36050263          	beqz	a0,4008ec <main+0x8d0>

            fat32_ls();

        // ---- FAT32 cat ----
        } else if (strcmp(argv[0], "fat32_cat") == 0) {
  40058c:	000d8513          	mv	a0,s11
  400590:	04c12583          	lw	a1,76(sp)
  400594:	00001097          	auipc	ra,0x1
  400598:	d20080e7          	jalr	-736(ra) # 4012b4 <strcmp>
  40059c:	34050e63          	beqz	a0,4008f8 <main+0x8dc>
            }

            fat32_cat(argv[1]);

        // ---- FAT32 touch ----
        } else if (strcmp(argv[0], "fat32_touch") == 0) {
  4005a0:	000d8513          	mv	a0,s11
  4005a4:	04012583          	lw	a1,64(sp)
  4005a8:	00001097          	auipc	ra,0x1
  4005ac:	d0c080e7          	jalr	-756(ra) # 4012b4 <strcmp>
  4005b0:	3a050e63          	beqz	a0,40096c <main+0x950>
            if (fat32_touch(argv[1]) != 0) {
                printf("fat32_touch failed\n");
            } 
            
        // ---- Helps出力 ----
        } else if (strcmp(argv[0], "help") == 0) {
  4005b4:	000d8513          	mv	a0,s11
  4005b8:	03c12583          	lw	a1,60(sp)
  4005bc:	00001097          	auipc	ra,0x1
  4005c0:	cf8080e7          	jalr	-776(ra) # 4012b4 <strcmp>
  4005c4:	3c050863          	beqz	a0,400994 <main+0x978>
            printf("  sa_start\n");
            printf("  sd_read\n");
            printf("  exit | quit | q\n");
            */

        } else if (strcmp(argv[0], "exit") == 0 ||
  4005c8:	000d8513          	mv	a0,s11
  4005cc:	02012583          	lw	a1,32(sp)
  4005d0:	00001097          	auipc	ra,0x1
  4005d4:	ce4080e7          	jalr	-796(ra) # 4012b4 <strcmp>
  4005d8:	3c050663          	beqz	a0,4009a4 <main+0x988>
                   strcmp(argv[0], "quit") == 0 ||
  4005dc:	000d8513          	mv	a0,s11
  4005e0:	01c12583          	lw	a1,28(sp)
  4005e4:	00001097          	auipc	ra,0x1
  4005e8:	cd0080e7          	jalr	-816(ra) # 4012b4 <strcmp>
  4005ec:	3a050c63          	beqz	a0,4009a4 <main+0x988>
                   strcmp(argv[0], "q") == 0) {
  4005f0:	000d8513          	mv	a0,s11
  4005f4:	01812583          	lw	a1,24(sp)
  4005f8:	00001097          	auipc	ra,0x1
  4005fc:	cbc080e7          	jalr	-836(ra) # 4012b4 <strcmp>
        } else if (strcmp(argv[0], "exit") == 0 ||
  400600:	3a050263          	beqz	a0,4009a4 <main+0x988>
  400604:	01412503          	lw	a0,20(sp)
            exit();
        
        } else {
            printf("unknown command: %s\n", argv[0]);
  400608:	000d8593          	mv	a1,s11
  40060c:	00001097          	auipc	ra,0x1
  400610:	97c080e7          	jalr	-1668(ra) # 400f88 <printf>
  400614:	c51ff06f          	j	400264 <main+0x248>
  400618:	10000593          	li	a1,256
            if (argc >= 2) {
  40061c:	06098863          	beqz	s3,40068c <main+0x670>
                if (parse_hex(argv[1], &val) == 0) {
  400620:	0a012683          	lw	a3,160(sp)
/* 簡易16進パーサ（"  0x1234" / "1234" 形式どちらも可） */
int parse_hex(const char *s, uintptr_t *out) {
    uintptr_t v = 0;

    /* skip leading spaces */
    while (*s == ' ' || *s == '\t') s++;
  400624:	00268693          	addi	a3,a3,2
  400628:	00600813          	li	a6,6
  40062c:	00500893          	li	a7,5
  400630:	0080006f          	j	400638 <main+0x61c>
  400634:	00168693          	addi	a3,a3,1
  400638:	ffe6c603          	lbu	a2,-2(a3)
  40063c:	ff560ce3          	beq	a2,s5,400634 <main+0x618>
  400640:	ff960ae3          	beq	a2,s9,400634 <main+0x618>
  400644:	03000513          	li	a0,48
  400648:	04a61c63          	bne	a2,a0,4006a0 <main+0x684>

    /* optional 0x / 0X */
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  40064c:	fff6c503          	lbu	a0,-1(a3)
  400650:	02056513          	ori	a0,a0,32
  400654:	07800613          	li	a2,120
  400658:	0ac51863          	bne	a0,a2,400708 <main+0x6ec>
    if (!*s) return -1;
  40065c:	0006c603          	lbu	a2,0(a3)
  400660:	0a061863          	bnez	a2,400710 <main+0x6f4>
  400664:	0440006f          	j	4006a8 <main+0x68c>
            if (argc >= 2) {
  400668:	06098663          	beqz	s3,4006d4 <main+0x6b8>
                max = parse_u32(argv[1]);
  40066c:	0a012503          	lw	a0,160(sp)
  400670:	00001097          	auipc	ra,0x1
  400674:	c84080e7          	jalr	-892(ra) # 4012f4 <parse_u32>
  400678:	00050593          	mv	a1,a0
  40067c:	07c12503          	lw	a0,124(sp)
  400680:	07812603          	lw	a2,120(sp)
                if (max > 100000) {
  400684:	04b67a63          	bgeu	a2,a1,4006d8 <main+0x6bc>
  400688:	2580006f          	j	4008e0 <main+0x8c4>
  40068c:	00200537          	lui	a0,0x200
  400690:	01f00a13          	li	s4,31
            call_dump_api(addr, len);
  400694:	00001097          	auipc	ra,0x1
  400698:	be0080e7          	jalr	-1056(ra) # 401274 <call_dump_api>
  40069c:	bc9ff06f          	j	400264 <main+0x248>
  4006a0:	ffe68693          	addi	a3,a3,-2
    if (!*s) return -1;
  4006a4:	06061663          	bnez	a2,400710 <main+0x6f4>
  4006a8:	00200537          	lui	a0,0x200
  4006ac:	0bc0006f          	j	400768 <main+0x74c>
            if (argc >= 2) {
  4006b0:	14098263          	beqz	s3,4007f4 <main+0x7d8>
                matrix_max = parse_u32(argv[1]);
  4006b4:	0a012503          	lw	a0,160(sp)
  4006b8:	00001097          	auipc	ra,0x1
  4006bc:	c3c080e7          	jalr	-964(ra) # 4012f4 <parse_u32>
  4006c0:	00050593          	mv	a1,a0
  4006c4:	06c12503          	lw	a0,108(sp)
                if (matrix_max > 4) {
  4006c8:	00400613          	li	a2,4
  4006cc:	12b67663          	bgeu	a2,a1,4007f8 <main+0x7dc>
  4006d0:	2100006f          	j	4008e0 <main+0x8c4>
  4006d4:	3e800593          	li	a1,1000
            cmd_primes(max);
  4006d8:	00058513          	mv	a0,a1
  4006dc:	00000097          	auipc	ra,0x0
  4006e0:	39c080e7          	jalr	924(ra) # 400a78 <cmd_primes>
  4006e4:	b81ff06f          	j	400264 <main+0x248>
  4006e8:	06812503          	lw	a0,104(sp)
            if (argc < 2) {
  4006ec:	1e098a63          	beqz	s3,4008e0 <main+0x8c4>
            unsigned count = parse_u32(argv[1]);
  4006f0:	0a012503          	lw	a0,160(sp)
  4006f4:	00001097          	auipc	ra,0x1
  4006f8:	c00080e7          	jalr	-1024(ra) # 4012f4 <parse_u32>
            call_mic_api(count);
  4006fc:	00000097          	auipc	ra,0x0
  400700:	7d4080e7          	jalr	2004(ra) # 400ed0 <call_mic_api>
  400704:	b61ff06f          	j	400264 <main+0x248>
  400708:	ffe68693          	addi	a3,a3,-2
  40070c:	03000613          	li	a2,48
  400710:	00000513          	li	a0,0

    while (*s) {
        char c = *s++;
        uint32_t d;
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400714:	00168693          	addi	a3,a3,1
  400718:	0200006f          	j	400738 <main+0x71c>
  40071c:	0ff67793          	zext.b	a5,a2
    while (*s) {
  400720:	0006c603          	lbu	a2,0(a3)
  400724:	00f70733          	add	a4,a4,a5
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
        else break;
        v = (v << 4) | d;
  400728:	00451513          	slli	a0,a0,0x4
  40072c:	00a76533          	or	a0,a4,a0
    while (*s) {
  400730:	00168693          	addi	a3,a3,1
  400734:	02060a63          	beqz	a2,400768 <main+0x74c>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400738:	fd060713          	addi	a4,a2,-48
  40073c:	0ff77793          	zext.b	a5,a4
  400740:	fd000713          	li	a4,-48
  400744:	fd87ece3          	bltu	a5,s8,40071c <main+0x700>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  400748:	f9f60713          	addi	a4,a2,-97
  40074c:	0ff77793          	zext.b	a5,a4
  400750:	fa900713          	li	a4,-87
  400754:	fd07e4e3          	bltu	a5,a6,40071c <main+0x700>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  400758:	fbf60713          	addi	a4,a2,-65
  40075c:	0ff77793          	zext.b	a5,a4
  400760:	fc900713          	li	a4,-55
  400764:	faf8fce3          	bgeu	a7,a5,40071c <main+0x700>
            if (argc >= 3) {
  400768:	00200613          	li	a2,2
  40076c:	00ca1a63          	bne	s4,a2,400780 <main+0x764>
  400770:	01f00a13          	li	s4,31
            call_dump_api(addr, len);
  400774:	00001097          	auipc	ra,0x1
  400778:	b00080e7          	jalr	-1280(ra) # 401274 <call_dump_api>
  40077c:	ae9ff06f          	j	400264 <main+0x248>
                if (parse_hex(argv[2], &val) == 0) {
  400780:	0a412683          	lw	a3,164(sp)
    while (*s == ' ' || *s == '\t') s++;
  400784:	00268693          	addi	a3,a3,2
  400788:	0080006f          	j	400790 <main+0x774>
  40078c:	00168693          	addi	a3,a3,1
  400790:	ffe6c603          	lbu	a2,-2(a3)
  400794:	ff560ce3          	beq	a2,s5,40078c <main+0x770>
  400798:	ff960ae3          	beq	a2,s9,40078c <main+0x770>
  40079c:	03000713          	li	a4,48
  4007a0:	02e61263          	bne	a2,a4,4007c4 <main+0x7a8>
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  4007a4:	fff6c603          	lbu	a2,-1(a3)
  4007a8:	02066613          	ori	a2,a2,32
  4007ac:	07800713          	li	a4,120
  4007b0:	01f00a13          	li	s4,31
  4007b4:	06e61a63          	bne	a2,a4,400828 <main+0x80c>
    if (!*s) return -1;
  4007b8:	0006c603          	lbu	a2,0(a3)
  4007bc:	06061a63          	bnez	a2,400830 <main+0x814>
  4007c0:	0c80006f          	j	400888 <main+0x86c>
  4007c4:	ffe68693          	addi	a3,a3,-2
  4007c8:	01f00a13          	li	s4,31
  4007cc:	06061263          	bnez	a2,400830 <main+0x814>
  4007d0:	0b80006f          	j	400888 <main+0x86c>
  4007d4:	06012503          	lw	a0,96(sp)
            if (argc < 2) {
  4007d8:	10098463          	beqz	s3,4008e0 <main+0x8c4>
            unsigned count = parse_u32(argv[1]);
  4007dc:	0a012503          	lw	a0,160(sp)
  4007e0:	00001097          	auipc	ra,0x1
  4007e4:	b14080e7          	jalr	-1260(ra) # 4012f4 <parse_u32>
            call_mic_write_file(count);
  4007e8:	00000097          	auipc	ra,0x0
  4007ec:	6f4080e7          	jalr	1780(ra) # 400edc <call_mic_write_file>
  4007f0:	a75ff06f          	j	400264 <main+0x248>
  4007f4:	00400593          	li	a1,4
            call_sa_api(matrix_max);
  4007f8:	00058513          	mv	a0,a1
  4007fc:	00000097          	auipc	ra,0x0
  400800:	350080e7          	jalr	848(ra) # 400b4c <call_sa_api>
  400804:	a61ff06f          	j	400264 <main+0x248>
  400808:	05812503          	lw	a0,88(sp)
            if (argc < 2) {
  40080c:	0c098a63          	beqz	s3,4008e0 <main+0x8c4>
            unsigned sd_sector = parse_u32(argv[1]);
  400810:	0a012503          	lw	a0,160(sp)
  400814:	00001097          	auipc	ra,0x1
  400818:	ae0080e7          	jalr	-1312(ra) # 4012f4 <parse_u32>
            call_sd_read_api(sd_sector);
  40081c:	00001097          	auipc	ra,0x1
  400820:	a34080e7          	jalr	-1484(ra) # 401250 <call_sd_read_api>
  400824:	a41ff06f          	j	400264 <main+0x248>
  400828:	ffe68693          	addi	a3,a3,-2
  40082c:	03000613          	li	a2,48
  400830:	00000593          	li	a1,0
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400834:	00168693          	addi	a3,a3,1
  400838:	0200006f          	j	400858 <main+0x83c>
  40083c:	0ff67793          	zext.b	a5,a2
    while (*s) {
  400840:	0006c603          	lbu	a2,0(a3)
  400844:	00f70733          	add	a4,a4,a5
        v = (v << 4) | d;
  400848:	00459593          	slli	a1,a1,0x4
  40084c:	00b765b3          	or	a1,a4,a1
    while (*s) {
  400850:	00168693          	addi	a3,a3,1
  400854:	02060a63          	beqz	a2,400888 <main+0x86c>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400858:	fd060713          	addi	a4,a2,-48
  40085c:	0ff77793          	zext.b	a5,a4
  400860:	fd000713          	li	a4,-48
  400864:	fd87ece3          	bltu	a5,s8,40083c <main+0x820>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  400868:	f9f60713          	addi	a4,a2,-97
  40086c:	0ff77793          	zext.b	a5,a4
  400870:	fa900713          	li	a4,-87
  400874:	fd07e4e3          	bltu	a5,a6,40083c <main+0x820>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  400878:	fbf60713          	addi	a4,a2,-65
  40087c:	0ff77793          	zext.b	a5,a4
  400880:	fc900713          	li	a4,-55
  400884:	faf8fce3          	bgeu	a7,a5,40083c <main+0x820>
            call_dump_api(addr, len);
  400888:	00001097          	auipc	ra,0x1
  40088c:	9ec080e7          	jalr	-1556(ra) # 401274 <call_dump_api>
  400890:	9d5ff06f          	j	400264 <main+0x248>
  400894:	05012503          	lw	a0,80(sp)
            if (argc < 2) {
  400898:	04098463          	beqz	s3,4008e0 <main+0x8c4>
            unsigned sd_sector = parse_u32(argv[1]);
  40089c:	0a012503          	lw	a0,160(sp)
  4008a0:	00001097          	auipc	ra,0x1
  4008a4:	a54080e7          	jalr	-1452(ra) # 4012f4 <parse_u32>
  4008a8:	00050593          	mv	a1,a0
            if (sd_sector < 5000) {
  4008ac:	00355613          	srli	a2,a0,0x3
  4008b0:	04812503          	lw	a0,72(sp)
  4008b4:	27100693          	li	a3,625
  4008b8:	02d66463          	bltu	a2,a3,4008e0 <main+0x8c4>
            call_sd_write_test_api(sd_sector);
  4008bc:	00058513          	mv	a0,a1
  4008c0:	00001097          	auipc	ra,0x1
  4008c4:	99c080e7          	jalr	-1636(ra) # 40125c <call_sd_write_test_api>
  4008c8:	99dff06f          	j	400264 <main+0x248>
            if (fat32_mount() != 0) {
  4008cc:	00001097          	auipc	ra,0x1
  4008d0:	c3c080e7          	jalr	-964(ra) # 401508 <fat32_mount>
  4008d4:	00050593          	mv	a1,a0
  4008d8:	04412503          	lw	a0,68(sp)
  4008dc:	02058a63          	beqz	a1,400910 <main+0x8f4>
  4008e0:	00000097          	auipc	ra,0x0
  4008e4:	6a8080e7          	jalr	1704(ra) # 400f88 <printf>
  4008e8:	97dff06f          	j	400264 <main+0x248>
            fat32_ls();
  4008ec:	00001097          	auipc	ra,0x1
  4008f0:	008080e7          	jalr	8(ra) # 4018f4 <fat32_ls>
  4008f4:	971ff06f          	j	400264 <main+0x248>
  4008f8:	03812503          	lw	a0,56(sp)
            if (argc < 2) {
  4008fc:	fe0982e3          	beqz	s3,4008e0 <main+0x8c4>
            fat32_cat(argv[1]);
  400900:	0a012503          	lw	a0,160(sp)
  400904:	00001097          	auipc	ra,0x1
  400908:	b18080e7          	jalr	-1256(ra) # 40141c <fat32_cat>
  40090c:	959ff06f          	j	400264 <main+0x248>
  400910:	00402537          	lui	a0,0x402
            printf("part_lba=%x\n",      g_fat32.part_lba);
  400914:	63052583          	lw	a1,1584(a0) # 402630 <g_fat32>
  400918:	63050993          	addi	s3,a0,1584
  40091c:	03412503          	lw	a0,52(sp)
  400920:	00000097          	auipc	ra,0x0
  400924:	668080e7          	jalr	1640(ra) # 400f88 <printf>
            printf("root_cluster=%x\n",  g_fat32.root_cluster);
  400928:	00c9a583          	lw	a1,12(s3)
  40092c:	03012503          	lw	a0,48(sp)
  400930:	00000097          	auipc	ra,0x0
  400934:	658080e7          	jalr	1624(ra) # 400f88 <printf>
            printf("spc=%x\n",           g_fat32.sectors_per_cluster);
  400938:	0109a583          	lw	a1,16(s3)
  40093c:	02c12503          	lw	a0,44(sp)
  400940:	00000097          	auipc	ra,0x0
  400944:	648080e7          	jalr	1608(ra) # 400f88 <printf>
            printf("fat_begin=%x\n",     g_fat32.fat_begin);
  400948:	0049a583          	lw	a1,4(s3)
  40094c:	02812503          	lw	a0,40(sp)
  400950:	00000097          	auipc	ra,0x0
  400954:	638080e7          	jalr	1592(ra) # 400f88 <printf>
            printf("data_begin=%x\n",    g_fat32.data_begin);
  400958:	0089a583          	lw	a1,8(s3)
  40095c:	02412503          	lw	a0,36(sp)
  400960:	00000097          	auipc	ra,0x0
  400964:	628080e7          	jalr	1576(ra) # 400f88 <printf>
  400968:	8fdff06f          	j	400264 <main+0x248>
  40096c:	01012503          	lw	a0,16(sp)
            if (argc < 2) {
  400970:	f60988e3          	beqz	s3,4008e0 <main+0x8c4>
            if (fat32_touch(argv[1]) != 0) {
  400974:	0a012503          	lw	a0,160(sp)
  400978:	00001097          	auipc	ra,0x1
  40097c:	208080e7          	jalr	520(ra) # 401b80 <fat32_touch>
  400980:	8e0502e3          	beqz	a0,400264 <main+0x248>
  400984:	00812503          	lw	a0,8(sp)
                printf("fat32_touch failed\n");
  400988:	00000097          	auipc	ra,0x0
  40098c:	600080e7          	jalr	1536(ra) # 400f88 <printf>
  400990:	8d5ff06f          	j	400264 <main+0x248>
  400994:	00c12503          	lw	a0,12(sp)
            printf("commands:\n");
  400998:	00000097          	auipc	ra,0x0
  40099c:	5f0080e7          	jalr	1520(ra) # 400f88 <printf>
  4009a0:	8c5ff06f          	j	400264 <main+0x248>
            exit();
  4009a4:	00000097          	auipc	ra,0x0
  4009a8:	190080e7          	jalr	400(ra) # 400b34 <exit>

004009ac <parse_hex>:
    while (*s == ' ' || *s == '\t') s++;
  4009ac:	00250613          	addi	a2,a0,2
  4009b0:	00900693          	li	a3,9
  4009b4:	02000713          	li	a4,32
  4009b8:	0080006f          	j	4009c0 <parse_hex+0x14>
  4009bc:	00160613          	addi	a2,a2,1
  4009c0:	ffe64503          	lbu	a0,-2(a2)
  4009c4:	fed50ce3          	beq	a0,a3,4009bc <parse_hex+0x10>
  4009c8:	fee50ae3          	beq	a0,a4,4009bc <parse_hex+0x10>
  4009cc:	03000693          	li	a3,48
  4009d0:	02d51063          	bne	a0,a3,4009f0 <parse_hex+0x44>
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  4009d4:	fff64503          	lbu	a0,-1(a2)
  4009d8:	02056513          	ori	a0,a0,32
  4009dc:	07800693          	li	a3,120
  4009e0:	02d51063          	bne	a0,a3,400a00 <parse_hex+0x54>
    if (!*s) return -1;
  4009e4:	00064503          	lbu	a0,0(a2)
  4009e8:	02051063          	bnez	a0,400a08 <parse_hex+0x5c>
  4009ec:	00c0006f          	j	4009f8 <parse_hex+0x4c>
  4009f0:	ffe60613          	addi	a2,a2,-2
  4009f4:	00051a63          	bnez	a0,400a08 <parse_hex+0x5c>
  4009f8:	fff00513          	li	a0,-1
    }
    *out = v;
    return 0;
  4009fc:	00008067          	ret
  400a00:	ffe60613          	addi	a2,a2,-2
  400a04:	03000513          	li	a0,48
  400a08:	00000693          	li	a3,0
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400a0c:	00160613          	addi	a2,a2,1
  400a10:	00a00713          	li	a4,10
  400a14:	00600793          	li	a5,6
  400a18:	00500813          	li	a6,5
  400a1c:	0200006f          	j	400a3c <parse_hex+0x90>
  400a20:	0ff57293          	zext.b	t0,a0
    while (*s) {
  400a24:	00064503          	lbu	a0,0(a2)
  400a28:	005888b3          	add	a7,a7,t0
        v = (v << 4) | d;
  400a2c:	00469693          	slli	a3,a3,0x4
  400a30:	00d8e6b3          	or	a3,a7,a3
    while (*s) {
  400a34:	00160613          	addi	a2,a2,1
  400a38:	02050a63          	beqz	a0,400a6c <parse_hex+0xc0>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400a3c:	fd050893          	addi	a7,a0,-48
  400a40:	0ff8f293          	zext.b	t0,a7
  400a44:	fd000893          	li	a7,-48
  400a48:	fce2ece3          	bltu	t0,a4,400a20 <parse_hex+0x74>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  400a4c:	f9f50893          	addi	a7,a0,-97
  400a50:	0ff8f293          	zext.b	t0,a7
  400a54:	fa900893          	li	a7,-87
  400a58:	fcf2e4e3          	bltu	t0,a5,400a20 <parse_hex+0x74>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  400a5c:	fbf50893          	addi	a7,a0,-65
  400a60:	0ff8f293          	zext.b	t0,a7
  400a64:	fc900893          	li	a7,-55
  400a68:	fa587ce3          	bgeu	a6,t0,400a20 <parse_hex+0x74>
  400a6c:	00000513          	li	a0,0
    *out = v;
  400a70:	00d5a023          	sw	a3,0(a1)
  400a74:	00008067          	ret

00400a78 <cmd_primes>:
{
  400a78:	fe010113          	addi	sp,sp,-32
  400a7c:	00112e23          	sw	ra,28(sp)
  400a80:	00812c23          	sw	s0,24(sp)
  400a84:	00912a23          	sw	s1,20(sp)
  400a88:	01212823          	sw	s2,16(sp)
  400a8c:	01312623          	sw	s3,12(sp)
  400a90:	00200913          	li	s2,2
  400a94:	00050413          	mv	s0,a0
  400a98:	00000493          	li	s1,0
    for (unsigned n = 2; n <= max; n++) {
  400a9c:	07256463          	bltu	a0,s2,400b04 <cmd_primes+0x8c>
  400aa0:	00402537          	lui	a0,0x402
  400aa4:	39750993          	addi	s3,a0,919 # 402397 <$d.1+0x41>
  400aa8:	00c0006f          	j	400ab4 <cmd_primes+0x3c>
  400aac:	00190913          	addi	s2,s2,1
  400ab0:	05246063          	bltu	s0,s2,400af0 <cmd_primes+0x78>
        if (is_prime(n)) {
  400ab4:	00090513          	mv	a0,s2
  400ab8:	00001097          	auipc	ra,0x1
  400abc:	8e4080e7          	jalr	-1820(ra) # 40139c <is_prime>
  400ac0:	fe0506e3          	beqz	a0,400aac <cmd_primes+0x34>
            printf("%d ", (int)n);
  400ac4:	00098513          	mv	a0,s3
  400ac8:	00090593          	mv	a1,s2
  400acc:	00000097          	auipc	ra,0x0
  400ad0:	4bc080e7          	jalr	1212(ra) # 400f88 <printf>
            count++;
  400ad4:	00148493          	addi	s1,s1,1
            if ((count % 8) == 0)
  400ad8:	0074f513          	andi	a0,s1,7
  400adc:	fc0518e3          	bnez	a0,400aac <cmd_primes+0x34>
                putchar('\n');
  400ae0:	00a00513          	li	a0,10
  400ae4:	00000097          	auipc	ra,0x0
  400ae8:	3c4080e7          	jalr	964(ra) # 400ea8 <putchar>
  400aec:	fc1ff06f          	j	400aac <cmd_primes+0x34>
    if ((count % 8) != 0)
  400af0:	0074f513          	andi	a0,s1,7
  400af4:	00050863          	beqz	a0,400b04 <cmd_primes+0x8c>
        putchar('\n');
  400af8:	00a00513          	li	a0,10
  400afc:	00000097          	auipc	ra,0x0
  400b00:	3ac080e7          	jalr	940(ra) # 400ea8 <putchar>
    printf("total primes: %d (0..%d)\n", count, (int)max);
  400b04:	00402537          	lui	a0,0x402
  400b08:	24c50513          	addi	a0,a0,588 # 40224c <__modsi3+0x17c>
  400b0c:	00048593          	mv	a1,s1
  400b10:	00040613          	mv	a2,s0
  400b14:	01c12083          	lw	ra,28(sp)
  400b18:	01812403          	lw	s0,24(sp)
  400b1c:	01412483          	lw	s1,20(sp)
  400b20:	01012903          	lw	s2,16(sp)
  400b24:	00c12983          	lw	s3,12(sp)
  400b28:	02010113          	addi	sp,sp,32
  400b2c:	00000317          	auipc	t1,0x0
  400b30:	45c30067          	jr	1116(t1) # 400f88 <printf>

00400b34 <exit>:
    __asm__ __volatile__ (
  400b34:	05a00693          	li	a3,90
  400b38:	00000593          	li	a1,0
  400b3c:	00000613          	li	a2,0
  400b40:	00000513          	li	a0,0
  400b44:	00000073          	ecall
    for (;;);
  400b48:	0000006f          	j	400b48 <exit+0x14>

00400b4c <call_sa_api>:
{
  400b4c:	000065b7          	lui	a1,0x6
  400b50:	01058593          	addi	a1,a1,16 # 6010 <$d.5+0x481f>
  400b54:	40b10133          	sub	sp,sp,a1
  400b58:	00050793          	mv	a5,a0
    for (uint32_t i = 0; i < matrix_size; i++) {
  400b5c:	14050663          	beqz	a0,400ca8 <call_sa_api+0x15c>
  400b60:	00000513          	li	a0,0
  400b64:	00000593          	li	a1,0
  400b68:	00005637          	lui	a2,0x5
  400b6c:	01060613          	addi	a2,a2,16 # 5010 <$d.5+0x381f>
  400b70:	00c10633          	add	a2,sp,a2
  400b74:	000046b7          	lui	a3,0x4
  400b78:	01068693          	addi	a3,a3,16 # 4010 <$d.5+0x281f>
  400b7c:	00d106b3          	add	a3,sp,a3
  400b80:	00005737          	lui	a4,0x5
  400b84:	01070713          	addi	a4,a4,16 # 5010 <$d.5+0x381f>
  400b88:	00e10733          	add	a4,sp,a4
        for (uint32_t j = 0; j < matrix_size; j++) {
  400b8c:	00659813          	slli	a6,a1,0x6
  400b90:	01078833          	add	a6,a5,a6
  400b94:	01060833          	add	a6,a2,a6
  400b98:	00068893          	mv	a7,a3
  400b9c:	00070293          	mv	t0,a4
  400ba0:	00058313          	mv	t1,a1
  400ba4:	00050393          	mv	t2,a0
            matrix_A[i][j] = (uint8_t)(2*i + 2*j + 2);
  400ba8:	00131e13          	slli	t3,t1,0x1
  400bac:	002e0e13          	addi	t3,t3,2
  400bb0:	01c28023          	sb	t3,0(t0)
            matrix_B[i][j] = (uint8_t)(3*i + j + 5);
  400bb4:	00538e13          	addi	t3,t2,5
  400bb8:	01c88023          	sb	t3,0(a7)
        for (uint32_t j = 0; j < matrix_size; j++) {
  400bbc:	00138393          	addi	t2,t2,1
  400bc0:	00130313          	addi	t1,t1,1
  400bc4:	00128293          	addi	t0,t0,1
  400bc8:	00188893          	addi	a7,a7,1
  400bcc:	fd029ee3          	bne	t0,a6,400ba8 <call_sa_api+0x5c>
    for (uint32_t i = 0; i < matrix_size; i++) {
  400bd0:	00158593          	addi	a1,a1,1
  400bd4:	00350513          	addi	a0,a0,3
  400bd8:	04070713          	addi	a4,a4,64
  400bdc:	04068693          	addi	a3,a3,64
  400be0:	faf596e3          	bne	a1,a5,400b8c <call_sa_api+0x40>
  400be4:	00005537          	lui	a0,0x5
  400be8:	01050513          	addi	a0,a0,16 # 5010 <$d.5+0x381f>
  400bec:	00a10833          	add	a6,sp,a0
  400bf0:	00004537          	lui	a0,0x4
  400bf4:	01050513          	addi	a0,a0,16 # 4010 <$d.5+0x281f>
  400bf8:	00a108b3          	add	a7,sp,a0
  400bfc:	01010293          	addi	t0,sp,16
  400c00:	00a00313          	li	t1,10
    __asm__ __volatile__ (
  400c04:	00080513          	mv	a0,a6
  400c08:	00088593          	mv	a1,a7
  400c0c:	00028613          	mv	a2,t0
  400c10:	00030693          	mv	a3,t1
  400c14:	00078713          	mv	a4,a5
  400c18:	00000073          	ecall
  400c1c:	00050893          	mv	a7,a0
  400c20:	04100593          	li	a1,65
    __asm__ __volatile__ (
  400c24:	00058513          	mv	a0,a1
  400c28:	00100693          	li	a3,1
  400c2c:	00000073          	ecall
  400c30:	00030513          	mv	a0,t1
  400c34:	00100693          	li	a3,1
  400c38:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400c3c:	18078c63          	beqz	a5,400dd4 <call_sa_api+0x288>
  400c40:	00000593          	li	a1,0
  400c44:	02000613          	li	a2,32
  400c48:	00a00713          	li	a4,10
  400c4c:	00005537          	lui	a0,0x5
  400c50:	01050513          	addi	a0,a0,16 # 5010 <$d.5+0x381f>
  400c54:	00a108b3          	add	a7,sp,a0
        for (uint32_t j = 0; j < matrix_size; j++) {
  400c58:	00659513          	slli	a0,a1,0x6
  400c5c:	00a78533          	add	a0,a5,a0
  400c60:	00a802b3          	add	t0,a6,a0
  400c64:	00088313          	mv	t1,a7
            print_int((int)matrix_A[i][j]);
  400c68:	00034383          	lbu	t2,0(t1)
    __asm__ __volatile__ (
  400c6c:	00038513          	mv	a0,t2
  400c70:	05b00693          	li	a3,91
  400c74:	00000073          	ecall
    __asm__ __volatile__ (
  400c78:	00060513          	mv	a0,a2
  400c7c:	00100693          	li	a3,1
  400c80:	00000073          	ecall
        for (uint32_t j = 0; j < matrix_size; j++) {
  400c84:	00130313          	addi	t1,t1,1
  400c88:	fe5310e3          	bne	t1,t0,400c68 <call_sa_api+0x11c>
    __asm__ __volatile__ (
  400c8c:	00070513          	mv	a0,a4
  400c90:	00100693          	li	a3,1
  400c94:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400c98:	00158593          	addi	a1,a1,1
  400c9c:	04088893          	addi	a7,a7,64
  400ca0:	faf59ce3          	bne	a1,a5,400c58 <call_sa_api+0x10c>
  400ca4:	05c0006f          	j	400d00 <call_sa_api+0x1b4>
  400ca8:	00005537          	lui	a0,0x5
  400cac:	01050513          	addi	a0,a0,16 # 5010 <$d.5+0x381f>
  400cb0:	00a10833          	add	a6,sp,a0
  400cb4:	00004537          	lui	a0,0x4
  400cb8:	01050513          	addi	a0,a0,16 # 4010 <$d.5+0x281f>
  400cbc:	00a108b3          	add	a7,sp,a0
  400cc0:	01010293          	addi	t0,sp,16
  400cc4:	00a00313          	li	t1,10
    __asm__ __volatile__ (
  400cc8:	00080513          	mv	a0,a6
  400ccc:	00088593          	mv	a1,a7
  400cd0:	00028613          	mv	a2,t0
  400cd4:	00030693          	mv	a3,t1
  400cd8:	00078713          	mv	a4,a5
  400cdc:	00000073          	ecall
  400ce0:	00050813          	mv	a6,a0
  400ce4:	04100593          	li	a1,65
    __asm__ __volatile__ (
  400ce8:	00058513          	mv	a0,a1
  400cec:	00100693          	li	a3,1
  400cf0:	00000073          	ecall
  400cf4:	00030513          	mv	a0,t1
  400cf8:	00100693          	li	a3,1
  400cfc:	00000073          	ecall
  400d00:	00a00593          	li	a1,10
  400d04:	00058513          	mv	a0,a1
  400d08:	00100693          	li	a3,1
  400d0c:	00000073          	ecall
  400d10:	04200613          	li	a2,66
  400d14:	00060513          	mv	a0,a2
  400d18:	00100693          	li	a3,1
  400d1c:	00000073          	ecall
  400d20:	00058513          	mv	a0,a1
  400d24:	00100693          	li	a3,1
  400d28:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400d2c:	06078c63          	beqz	a5,400da4 <call_sa_api+0x258>
  400d30:	00000593          	li	a1,0
  400d34:	00004537          	lui	a0,0x4
  400d38:	01050513          	addi	a0,a0,16 # 4010 <$d.5+0x281f>
  400d3c:	00a10633          	add	a2,sp,a0
  400d40:	02000713          	li	a4,32
  400d44:	00a00813          	li	a6,10
  400d48:	00004537          	lui	a0,0x4
  400d4c:	01050513          	addi	a0,a0,16 # 4010 <$d.5+0x281f>
  400d50:	00a108b3          	add	a7,sp,a0
        for (uint32_t j = 0; j < matrix_size; j++) {
  400d54:	00659513          	slli	a0,a1,0x6
  400d58:	00a78533          	add	a0,a5,a0
  400d5c:	00a602b3          	add	t0,a2,a0
  400d60:	00088313          	mv	t1,a7
            print_int((int)matrix_B[i][j]);
  400d64:	00034383          	lbu	t2,0(t1)
    __asm__ __volatile__ (
  400d68:	00038513          	mv	a0,t2
  400d6c:	05b00693          	li	a3,91
  400d70:	00000073          	ecall
    __asm__ __volatile__ (
  400d74:	00070513          	mv	a0,a4
  400d78:	00100693          	li	a3,1
  400d7c:	00000073          	ecall
        for (uint32_t j = 0; j < matrix_size; j++) {
  400d80:	00130313          	addi	t1,t1,1
  400d84:	fe5310e3          	bne	t1,t0,400d64 <call_sa_api+0x218>
    __asm__ __volatile__ (
  400d88:	00080513          	mv	a0,a6
  400d8c:	00100693          	li	a3,1
  400d90:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400d94:	00158593          	addi	a1,a1,1
  400d98:	04088893          	addi	a7,a7,64
  400d9c:	faf59ce3          	bne	a1,a5,400d54 <call_sa_api+0x208>
  400da0:	0600006f          	j	400e00 <call_sa_api+0x2b4>
  400da4:	00a00593          	li	a1,10
    __asm__ __volatile__ (
  400da8:	00058513          	mv	a0,a1
  400dac:	00100693          	li	a3,1
  400db0:	00000073          	ecall
  400db4:	04300613          	li	a2,67
  400db8:	00060513          	mv	a0,a2
  400dbc:	00100693          	li	a3,1
  400dc0:	00000073          	ecall
  400dc4:	00058513          	mv	a0,a1
  400dc8:	00100693          	li	a3,1
  400dcc:	00000073          	ecall
  400dd0:	0b80006f          	j	400e88 <call_sa_api+0x33c>
  400dd4:	00a00593          	li	a1,10
  400dd8:	00058513          	mv	a0,a1
  400ddc:	00100693          	li	a3,1
  400de0:	00000073          	ecall
  400de4:	04200613          	li	a2,66
  400de8:	00060513          	mv	a0,a2
  400dec:	00100693          	li	a3,1
  400df0:	00000073          	ecall
  400df4:	00058513          	mv	a0,a1
  400df8:	00100693          	li	a3,1
  400dfc:	00000073          	ecall
  400e00:	00a00593          	li	a1,10
  400e04:	00058513          	mv	a0,a1
  400e08:	00100693          	li	a3,1
  400e0c:	00000073          	ecall
  400e10:	04300613          	li	a2,67
  400e14:	00060513          	mv	a0,a2
  400e18:	00100693          	li	a3,1
  400e1c:	00000073          	ecall
  400e20:	00058513          	mv	a0,a1
  400e24:	00100693          	li	a3,1
  400e28:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400e2c:	04078e63          	beqz	a5,400e88 <call_sa_api+0x33c>
  400e30:	00000593          	li	a1,0
  400e34:	01010613          	addi	a2,sp,16
  400e38:	02000713          	li	a4,32
  400e3c:	00a00813          	li	a6,10
  400e40:	00060893          	mv	a7,a2
  400e44:	00078293          	mv	t0,a5
            print_int((int)matrix_C[i][j]);
  400e48:	0008a303          	lw	t1,0(a7)
    __asm__ __volatile__ (
  400e4c:	00030513          	mv	a0,t1
  400e50:	05b00693          	li	a3,91
  400e54:	00000073          	ecall
    __asm__ __volatile__ (
  400e58:	00070513          	mv	a0,a4
  400e5c:	00100693          	li	a3,1
  400e60:	00000073          	ecall
        for (uint32_t j = 0; j < matrix_size; j++) {
  400e64:	fff28293          	addi	t0,t0,-1
  400e68:	00488893          	addi	a7,a7,4
  400e6c:	fc029ee3          	bnez	t0,400e48 <call_sa_api+0x2fc>
    __asm__ __volatile__ (
  400e70:	00080513          	mv	a0,a6
  400e74:	00100693          	li	a3,1
  400e78:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400e7c:	00158593          	addi	a1,a1,1
  400e80:	10060613          	addi	a2,a2,256
  400e84:	faf59ee3          	bne	a1,a5,400e40 <call_sa_api+0x2f4>
  400e88:	00a00593          	li	a1,10
    __asm__ __volatile__ (
  400e8c:	00058513          	mv	a0,a1
  400e90:	00100693          	li	a3,1
  400e94:	00000073          	ecall
}
  400e98:	00006537          	lui	a0,0x6
  400e9c:	01050513          	addi	a0,a0,16 # 6010 <$d.5+0x481f>
  400ea0:	00a10133          	add	sp,sp,a0
  400ea4:	00008067          	ret

00400ea8 <putchar>:
{
  400ea8:	00050593          	mv	a1,a0
    __asm__ __volatile__ (
  400eac:	00058513          	mv	a0,a1
  400eb0:	00100693          	li	a3,1
  400eb4:	00000073          	ecall
}
  400eb8:	00008067          	ret

00400ebc <print_int>:
{
  400ebc:	00050593          	mv	a1,a0
    __asm__ __volatile__ (
  400ec0:	00058513          	mv	a0,a1
  400ec4:	05b00693          	li	a3,91
  400ec8:	00000073          	ecall
}
  400ecc:	00008067          	ret

00400ed0 <call_mic_api>:
    __asm__ __volatile__(
  400ed0:	01400693          	li	a3,20
  400ed4:	00000073          	ecall
}
  400ed8:	00008067          	ret

00400edc <call_mic_write_file>:
{
  400edc:	fe010113          	addi	sp,sp,-32
  400ee0:	00112e23          	sw	ra,28(sp)
  400ee4:	00812c23          	sw	s0,24(sp)
  400ee8:	00912a23          	sw	s1,20(sp)
  400eec:	00050413          	mv	s0,a0
    if (fat32_find(
  400ef0:	00402537          	lui	a0,0x402
  400ef4:	33b50513          	addi	a0,a0,827 # 40233b <$d.2>
  400ef8:	01010593          	addi	a1,sp,16
  400efc:	00c10613          	addi	a2,sp,12
  400f00:	00000097          	auipc	ra,0x0
  400f04:	730080e7          	jalr	1840(ra) # 401630 <fat32_find>
  400f08:	00050863          	beqz	a0,400f18 <call_mic_write_file+0x3c>
        printf("MIC.TXT not found\n");
  400f0c:	00402537          	lui	a0,0x402
  400f10:	19b50513          	addi	a0,a0,411 # 40219b <__modsi3+0xcb>
  400f14:	0180006f          	j	400f2c <call_mic_write_file+0x50>
    if (cluster < 2) {
  400f18:	01012503          	lw	a0,16(sp)
  400f1c:	00100593          	li	a1,1
  400f20:	02a5e663          	bltu	a1,a0,400f4c <call_mic_write_file+0x70>
        printf("MIC.TXT has no cluster\n");
  400f24:	00402537          	lui	a0,0x402
  400f28:	32350513          	addi	a0,a0,803 # 402323 <__modsi3+0x253>
  400f2c:	00000097          	auipc	ra,0x0
  400f30:	05c080e7          	jalr	92(ra) # 400f88 <printf>
  400f34:	00000513          	li	a0,0
  400f38:	01c12083          	lw	ra,28(sp)
  400f3c:	01812403          	lw	s0,24(sp)
  400f40:	01412483          	lw	s1,20(sp)
}
  400f44:	02010113          	addi	sp,sp,32
  400f48:	00008067          	ret
        cluster_to_lba(cluster);
  400f4c:	00001097          	auipc	ra,0x1
  400f50:	988080e7          	jalr	-1656(ra) # 4018d4 <cluster_to_lba>
        cluster,
  400f54:	01012583          	lw	a1,16(sp)
        size
  400f58:	00c12683          	lw	a3,12(sp)
        cluster_to_lba(cluster);
  400f5c:	00050493          	mv	s1,a0
    printf(
  400f60:	00402537          	lui	a0,0x402
  400f64:	14950513          	addi	a0,a0,329 # 402149 <__modsi3+0x79>
  400f68:	00048613          	mv	a2,s1
  400f6c:	00000097          	auipc	ra,0x0
  400f70:	01c080e7          	jalr	28(ra) # 400f88 <printf>
    __asm__ __volatile__(
  400f74:	01500693          	li	a3,21
  400f78:	00048593          	mv	a1,s1
  400f7c:	00040513          	mv	a0,s0
  400f80:	00000073          	ecall
  400f84:	fb5ff06f          	j	400f38 <call_mic_write_file+0x5c>

00400f88 <printf>:
void printf(const char *fmt, ...) {
  400f88:	fb010113          	addi	sp,sp,-80
  400f8c:	02812623          	sw	s0,44(sp)
  400f90:	02912423          	sw	s1,40(sp)
  400f94:	03212223          	sw	s2,36(sp)
  400f98:	03312023          	sw	s3,32(sp)
  400f9c:	01412e23          	sw	s4,28(sp)
  400fa0:	00050293          	mv	t0,a0
  400fa4:	05112623          	sw	a7,76(sp)
  400fa8:	05012423          	sw	a6,72(sp)
  400fac:	04f12223          	sw	a5,68(sp)
  400fb0:	04e12023          	sw	a4,64(sp)
  400fb4:	02d12e23          	sw	a3,60(sp)
  400fb8:	02c12c23          	sw	a2,56(sp)
  400fbc:	02b12a23          	sw	a1,52(sp)
  400fc0:	03410513          	addi	a0,sp,52
    va_start(vargs, fmt);
  400fc4:	00a12c23          	sw	a0,24(sp)
  400fc8:	02500593          	li	a1,37
  400fcc:	07200613          	li	a2,114
  400fd0:	06400713          	li	a4,100
  400fd4:	02d00793          	li	a5,45
  400fd8:	ccccd537          	lui	a0,0xccccd
  400fdc:	ccd50813          	addi	a6,a0,-819 # cccccccd <USER_MAX+0xcc7ccccd>
  400fe0:	00a00893          	li	a7,10
  400fe4:	00d10313          	addi	t1,sp,13
  400fe8:	00900393          	li	t2,9
  400fec:	00100e13          	li	t3,1
  400ff0:	03000e93          	li	t4,48
  400ff4:	07300f13          	li	t5,115
  400ff8:	07800f93          	li	t6,120
  400ffc:	00402537          	lui	a0,0x402
  401000:	3a950413          	addi	s0,a0,937 # 4023a9 <$d.1+0x53>
  401004:	00c0006f          	j	401010 <printf+0x88>
            switch (*fmt) {
  401008:	20050863          	beqz	a0,401218 <printf+0x290>
        fmt++;
  40100c:	00128293          	addi	t0,t0,1
    while (*fmt) {
  401010:	0002c483          	lbu	s1,0(t0)
  401014:	00b48e63          	beq	s1,a1,401030 <printf+0xa8>
  401018:	20048863          	beqz	s1,401228 <printf+0x2a0>
    __asm__ __volatile__ (
  40101c:	00048513          	mv	a0,s1
  401020:	00100693          	li	a3,1
  401024:	00000073          	ecall
        fmt++;
  401028:	00128293          	addi	t0,t0,1
  40102c:	fe5ff06f          	j	401010 <printf+0x88>
            switch (*fmt) {
  401030:	0012c503          	lbu	a0,1(t0)
            fmt++;
  401034:	00128293          	addi	t0,t0,1
            switch (*fmt) {
  401038:	02a64c63          	blt	a2,a0,401070 <printf+0xe8>
  40103c:	12b50663          	beq	a0,a1,401168 <printf+0x1e0>
  401040:	fce514e3          	bne	a0,a4,401008 <printf+0x80>
                    int value = va_arg(vargs, int);
  401044:	01812503          	lw	a0,24(sp)
  401048:	00450693          	addi	a3,a0,4
  40104c:	00d12c23          	sw	a3,24(sp)
  401050:	00052483          	lw	s1,0(a0)
                    if (value < 0) {
  401054:	1604c063          	bltz	s1,4011b4 <printf+0x22c>
                    if (u == 0) {
  401058:	16049663          	bnez	s1,4011c4 <printf+0x23c>
    __asm__ __volatile__ (
  40105c:	000e8513          	mv	a0,t4
  401060:	00100693          	li	a3,1
  401064:	00000073          	ecall
        fmt++;
  401068:	00128293          	addi	t0,t0,1
  40106c:	fa5ff06f          	j	401010 <printf+0x88>
            switch (*fmt) {
  401070:	11e50663          	beq	a0,t5,40117c <printf+0x1f4>
  401074:	f9f51ce3          	bne	a0,t6,40100c <printf+0x84>
                    unsigned value = va_arg(vargs, unsigned);
  401078:	01812503          	lw	a0,24(sp)
  40107c:	00450693          	addi	a3,a0,4
  401080:	00d12c23          	sw	a3,24(sp)
  401084:	00052483          	lw	s1,0(a0)
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  401088:	01c4d513          	srli	a0,s1,0x1c
                        putchar("0123456789abcdef"[nibble]);
  40108c:	00a40533          	add	a0,s0,a0
  401090:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  401094:	00090513          	mv	a0,s2
  401098:	00100693          	li	a3,1
  40109c:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  4010a0:	00449513          	slli	a0,s1,0x4
  4010a4:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  4010a8:	00a40533          	add	a0,s0,a0
  4010ac:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  4010b0:	00090513          	mv	a0,s2
  4010b4:	00100693          	li	a3,1
  4010b8:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  4010bc:	00849513          	slli	a0,s1,0x8
  4010c0:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  4010c4:	00a40533          	add	a0,s0,a0
  4010c8:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  4010cc:	00090513          	mv	a0,s2
  4010d0:	00100693          	li	a3,1
  4010d4:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  4010d8:	00c49513          	slli	a0,s1,0xc
  4010dc:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  4010e0:	00a40533          	add	a0,s0,a0
  4010e4:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  4010e8:	00090513          	mv	a0,s2
  4010ec:	00100693          	li	a3,1
  4010f0:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  4010f4:	01049513          	slli	a0,s1,0x10
  4010f8:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  4010fc:	00a40533          	add	a0,s0,a0
  401100:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  401104:	00090513          	mv	a0,s2
  401108:	00100693          	li	a3,1
  40110c:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  401110:	01449513          	slli	a0,s1,0x14
  401114:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  401118:	00a40533          	add	a0,s0,a0
  40111c:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  401120:	00090513          	mv	a0,s2
  401124:	00100693          	li	a3,1
  401128:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  40112c:	01849513          	slli	a0,s1,0x18
  401130:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  401134:	00a40533          	add	a0,s0,a0
  401138:	00054903          	lbu	s2,0(a0)
    __asm__ __volatile__ (
  40113c:	00090513          	mv	a0,s2
  401140:	00100693          	li	a3,1
  401144:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  401148:	00f4f493          	andi	s1,s1,15
                        putchar("0123456789abcdef"[nibble]);
  40114c:	009404b3          	add	s1,s0,s1
  401150:	0004c483          	lbu	s1,0(s1)
    __asm__ __volatile__ (
  401154:	00048513          	mv	a0,s1
  401158:	00100693          	li	a3,1
  40115c:	00000073          	ecall
        fmt++;
  401160:	00128293          	addi	t0,t0,1
  401164:	eadff06f          	j	401010 <printf+0x88>
    __asm__ __volatile__ (
  401168:	00058513          	mv	a0,a1
  40116c:	00100693          	li	a3,1
  401170:	00000073          	ecall
        fmt++;
  401174:	00128293          	addi	t0,t0,1
  401178:	e99ff06f          	j	401010 <printf+0x88>
                    const char *s = va_arg(vargs, const char *);
  40117c:	01812503          	lw	a0,24(sp)
  401180:	00450693          	addi	a3,a0,4
  401184:	00d12c23          	sw	a3,24(sp)
  401188:	00052903          	lw	s2,0(a0)
                    while (*s) {
  40118c:	00094483          	lbu	s1,0(s2)
  401190:	e6048ee3          	beqz	s1,40100c <printf+0x84>
  401194:	00190913          	addi	s2,s2,1
    __asm__ __volatile__ (
  401198:	00048513          	mv	a0,s1
  40119c:	00100693          	li	a3,1
  4011a0:	00000073          	ecall
                    while (*s) {
  4011a4:	00094483          	lbu	s1,0(s2)
  4011a8:	00190913          	addi	s2,s2,1
  4011ac:	fe0496e3          	bnez	s1,401198 <printf+0x210>
  4011b0:	e5dff06f          	j	40100c <printf+0x84>
    __asm__ __volatile__ (
  4011b4:	00078513          	mv	a0,a5
  4011b8:	00100693          	li	a3,1
  4011bc:	00000073          	ecall
                        u = (unsigned int)(-(value + 1)) + 1;
  4011c0:	409004b3          	neg	s1,s1
  4011c4:	00000513          	li	a0,0
  4011c8:	00048693          	mv	a3,s1
  4011cc:	00050913          	mv	s2,a0
                        u /= 10;
  4011d0:	0304b4b3          	mulhu	s1,s1,a6
  4011d4:	0034d493          	srli	s1,s1,0x3
  4011d8:	03148533          	mul	a0,s1,a7
  4011dc:	40a68533          	sub	a0,a3,a0
                        buf[i++] = '0' + (u % 10);
  4011e0:	03056993          	ori	s3,a0,48
  4011e4:	00190513          	addi	a0,s2,1
  4011e8:	01230a33          	add	s4,t1,s2
  4011ec:	013a0023          	sb	s3,0(s4)
                    while (u > 0) {
  4011f0:	fcd3ece3          	bltu	t2,a3,4011c8 <printf+0x240>
                        putchar(buf[--i]);
  4011f4:	01230533          	add	a0,t1,s2
  4011f8:	00054483          	lbu	s1,0(a0)
    __asm__ __volatile__ (
  4011fc:	00048513          	mv	a0,s1
  401200:	00100693          	li	a3,1
  401204:	00000073          	ecall
                    while (i > 0) {
  401208:	00190513          	addi	a0,s2,1
  40120c:	fff90913          	addi	s2,s2,-1
  401210:	feae42e3          	blt	t3,a0,4011f4 <printf+0x26c>
  401214:	df9ff06f          	j	40100c <printf+0x84>
  401218:	02500593          	li	a1,37
    __asm__ __volatile__ (
  40121c:	00058513          	mv	a0,a1
  401220:	00100693          	li	a3,1
  401224:	00000073          	ecall
  401228:	02c12403          	lw	s0,44(sp)
  40122c:	02812483          	lw	s1,40(sp)
  401230:	02412903          	lw	s2,36(sp)
  401234:	02012983          	lw	s3,32(sp)
  401238:	01c12a03          	lw	s4,28(sp)
}
  40123c:	05010113          	addi	sp,sp,80
  401240:	00008067          	ret

00401244 <call_mic_write_api>:
    __asm__ __volatile__(
  401244:	01500693          	li	a3,21
  401248:	00000073          	ecall
}
  40124c:	00008067          	ret

00401250 <call_sd_read_api>:
    __asm__ __volatile__(
  401250:	01e00693          	li	a3,30
  401254:	00000073          	ecall
}
  401258:	00008067          	ret

0040125c <call_sd_write_test_api>:
    __asm__ __volatile__(
  40125c:	01f00693          	li	a3,31
  401260:	00000073          	ecall
}
  401264:	00008067          	ret

00401268 <call_sd_write_buf_api>:
    __asm__ __volatile__(
  401268:	02000693          	li	a3,32
  40126c:	00000073          	ecall
    return sd_api2(
  401270:	00008067          	ret

00401274 <call_dump_api>:
    __asm__ __volatile__(
  401274:	02800693          	li	a3,40
  401278:	00000073          	ecall
}
  40127c:	00008067          	ret

00401280 <strcpy>:
    while (*src)
  401280:	0005c603          	lbu	a2,0(a1)
  401284:	00050693          	mv	a3,a0
  401288:	02060263          	beqz	a2,4012ac <strcpy+0x2c>
  40128c:	00158593          	addi	a1,a1,1
  401290:	00050713          	mv	a4,a0
        *d++ = *src++;
  401294:	00c70023          	sb	a2,0(a4)
    while (*src)
  401298:	0005c603          	lbu	a2,0(a1)
        *d++ = *src++;
  40129c:	00170693          	addi	a3,a4,1
    while (*src)
  4012a0:	00158593          	addi	a1,a1,1
  4012a4:	00068713          	mv	a4,a3
  4012a8:	fe0616e3          	bnez	a2,401294 <strcpy+0x14>
    *d = '\0';
  4012ac:	00068023          	sb	zero,0(a3)
    return dst;
  4012b0:	00008067          	ret

004012b4 <strcmp>:
    while (*s1 && *s2) {
  4012b4:	00054603          	lbu	a2,0(a0)
  4012b8:	02060663          	beqz	a2,4012e4 <strcmp+0x30>
  4012bc:	00150513          	addi	a0,a0,1
  4012c0:	0005c683          	lbu	a3,0(a1)
  4012c4:	0ff67713          	zext.b	a4,a2
  4012c8:	00d71a63          	bne	a4,a3,4012dc <strcmp+0x28>
  4012cc:	00054603          	lbu	a2,0(a0)
        s2++;
  4012d0:	00158593          	addi	a1,a1,1
    while (*s1 && *s2) {
  4012d4:	00150513          	addi	a0,a0,1
  4012d8:	fe0614e3          	bnez	a2,4012c0 <strcmp+0xc>
    return *(unsigned char *)s1 - *(unsigned char *)s2;
  4012dc:	0ff67513          	zext.b	a0,a2
  4012e0:	0080006f          	j	4012e8 <strcmp+0x34>
  4012e4:	00000513          	li	a0,0
  4012e8:	0005c583          	lbu	a1,0(a1)
  4012ec:	40b50533          	sub	a0,a0,a1
  4012f0:	00008067          	ret

004012f4 <parse_u32>:
unsigned parse_u32(const char *s) {
  4012f4:	00050593          	mv	a1,a0
    if ((s[0] == '0') && (s[1] == 'x' || s[1] == 'X')) {
  4012f8:	00054503          	lbu	a0,0(a0)
  4012fc:	03000693          	li	a3,48
  401300:	00a00613          	li	a2,10
  401304:	02d51063          	bne	a0,a3,401324 <parse_u32+0x30>
  401308:	0015c503          	lbu	a0,1(a1)
  40130c:	02056513          	ori	a0,a0,32
  401310:	07800613          	li	a2,120
  401314:	00c51e63          	bne	a0,a2,401330 <parse_u32+0x3c>
    while (*s) {
  401318:	0025c503          	lbu	a0,2(a1)
        s += 2;
  40131c:	00258593          	addi	a1,a1,2
  401320:	01000613          	li	a2,16
  401324:	00050693          	mv	a3,a0
    while (*s) {
  401328:	00051663          	bnez	a0,401334 <parse_u32+0x40>
  40132c:	06c0006f          	j	401398 <parse_u32+0xa4>
  401330:	00a00613          	li	a2,10
  401334:	00000513          	li	a0,0
        if (c >= '0' && c <= '9')       d = (unsigned)(c - '0');
  401338:	00158593          	addi	a1,a1,1
  40133c:	00a00713          	li	a4,10
  401340:	00600793          	li	a5,6
  401344:	00500813          	li	a6,5
  401348:	fd068893          	addi	a7,a3,-48
  40134c:	0ff8f293          	zext.b	t0,a7
  401350:	fd000893          	li	a7,-48
  401354:	02e2e263          	bltu	t0,a4,401378 <parse_u32+0x84>
        else if (c >= 'a' && c <= 'f')  d = 10u + (unsigned)(c - 'a');
  401358:	f9f68893          	addi	a7,a3,-97
  40135c:	0ff8f293          	zext.b	t0,a7
  401360:	fa900893          	li	a7,-87
  401364:	00f2ea63          	bltu	t0,a5,401378 <parse_u32+0x84>
        else if (c >= 'A' && c <= 'F')  d = 10u + (unsigned)(c - 'A');
  401368:	fbf68893          	addi	a7,a3,-65
  40136c:	0ff8f293          	zext.b	t0,a7
  401370:	fc900893          	li	a7,-55
  401374:	02586263          	bltu	a6,t0,401398 <parse_u32+0xa4>
  401378:	0ff6f693          	zext.b	a3,a3
  40137c:	00d888b3          	add	a7,a7,a3
        if (d >= base) break;
  401380:	00c8fc63          	bgeu	a7,a2,401398 <parse_u32+0xa4>
    while (*s) {
  401384:	0005c683          	lbu	a3,0(a1)
        v = v * base + d;
  401388:	02c50533          	mul	a0,a0,a2
  40138c:	00a88533          	add	a0,a7,a0
    while (*s) {
  401390:	00158593          	addi	a1,a1,1
  401394:	fa069ae3          	bnez	a3,401348 <parse_u32+0x54>
    return v;
  401398:	00008067          	ret

0040139c <is_prime>:
{
  40139c:	00200593          	li	a1,2
    if (n < 2) return false;
  4013a0:	00b57663          	bgeu	a0,a1,4013ac <is_prime+0x10>
}
  4013a4:	00000513          	li	a0,0
  4013a8:	00008067          	ret
  4013ac:	00400613          	li	a2,4
  4013b0:	00100593          	li	a1,1
    for (unsigned i = 2; i * i <= n; i++) {
  4013b4:	02c56063          	bltu	a0,a2,4013d4 <is_prime+0x38>
  4013b8:	00200593          	li	a1,2
        if (n % i == 0)
  4013bc:	02b57633          	remu	a2,a0,a1
  4013c0:	00060863          	beqz	a2,4013d0 <is_prime+0x34>
    for (unsigned i = 2; i * i <= n; i++) {
  4013c4:	00158593          	addi	a1,a1,1
  4013c8:	02b586b3          	mul	a3,a1,a1
  4013cc:	fed578e3          	bgeu	a0,a3,4013bc <is_prime+0x20>
        if (n % i == 0)
  4013d0:	00c035b3          	snez	a1,a2
}
  4013d4:	00058513          	mv	a0,a1
  4013d8:	00008067          	ret

004013dc <getchar>:
    __asm__ __volatile__ (
  4013dc:	00200693          	li	a3,2
  4013e0:	00000073          	ecall
  4013e4:	00050593          	mv	a1,a0
    return ch;
  4013e8:	00058513          	mv	a0,a1
  4013ec:	00008067          	ret

004013f0 <getchar_timeout>:
    __asm__ __volatile__ (
  4013f0:	00300693          	li	a3,3
  4013f4:	00000073          	ecall
  4013f8:	00050593          	mv	a1,a0
    return ch;
  4013fc:	00058513          	mv	a0,a1
  401400:	00008067          	ret

00401404 <call_sd_read_buf_api>:
    __asm__ __volatile__(
  401404:	02100693          	li	a3,33
  401408:	00000073          	ecall
    return (int)a0;
  40140c:	00008067          	ret

00401410 <poll_switch_api>:
    __asm__ __volatile__(
  401410:	03200693          	li	a3,50
  401414:	00000073          	ecall
    return a0;
  401418:	00008067          	ret

0040141c <fat32_cat>:
static uint8_t fat32_buf[512];

fat32_info_t g_fat32;

int fat32_cat(const char *name)
{
  40141c:	de010113          	addi	sp,sp,-544
  401420:	20112e23          	sw	ra,540(sp)
  401424:	20812c23          	sw	s0,536(sp)
  401428:	20912a23          	sw	s1,532(sp)
  40142c:	00050413          	mv	s0,a0
    uint8_t buf[512];

    uint32_t cluster;
    uint32_t size;

    if (fat32_mount())
  401430:	00000097          	auipc	ra,0x0
  401434:	0d8080e7          	jalr	216(ra) # 401508 <fat32_mount>
  401438:	00050593          	mv	a1,a0
  40143c:	fff00513          	li	a0,-1
  401440:	0a059a63          	bnez	a1,4014f4 <fat32_cat+0xd8>
        return -1;

    if (fat32_find(name, &cluster, &size)) {
  401444:	01010593          	addi	a1,sp,16
  401448:	00c10613          	addi	a2,sp,12
  40144c:	00040513          	mv	a0,s0
  401450:	00000097          	auipc	ra,0x0
  401454:	1e0080e7          	jalr	480(ra) # 401630 <fat32_find>
  401458:	00050e63          	beqz	a0,401474 <fat32_cat+0x58>
        printf("file not found\n");
  40145c:	00402537          	lui	a0,0x402
  401460:	3f250513          	addi	a0,a0,1010 # 4023f2 <$d.1>
  401464:	00000097          	auipc	ra,0x0
  401468:	b24080e7          	jalr	-1244(ra) # 400f88 <printf>
  40146c:	fff00513          	li	a0,-1
  401470:	0840006f          	j	4014f4 <fat32_cat+0xd8>
        return -1;
    }

    uint32_t lba =
        cluster_to_lba(cluster);
  401474:	01012503          	lw	a0,16(sp)
    return -1;
}

uint32_t cluster_to_lba(uint32_t cluster)
{
    return g_fat32.data_begin +
  401478:	004025b7          	lui	a1,0x402
  40147c:	63058593          	addi	a1,a1,1584 # 402630 <g_fat32>
           (cluster - 2) *
           g_fat32.sectors_per_cluster;
  401480:	0105a603          	lw	a2,16(a1)
    return g_fat32.data_begin +
  401484:	0085a583          	lw	a1,8(a1)
           (cluster - 2) *
  401488:	ffe50513          	addi	a0,a0,-2
  40148c:	02a60533          	mul	a0,a2,a0
    return g_fat32.data_begin +
  401490:	00b50533          	add	a0,a0,a1
    if (call_sd_read_buf_api(lba, buf))
  401494:	01410593          	addi	a1,sp,20
  401498:	00000097          	auipc	ra,0x0
  40149c:	f6c080e7          	jalr	-148(ra) # 401404 <call_sd_read_buf_api>
  4014a0:	00050593          	mv	a1,a0
  4014a4:	fff00513          	li	a0,-1
  4014a8:	04059663          	bnez	a1,4014f4 <fat32_cat+0xd8>
  4014ac:	00c12503          	lw	a0,12(sp)
    for (uint32_t i = 0; i < size; i++) {
  4014b0:	02050a63          	beqz	a0,4014e4 <fat32_cat+0xc8>
  4014b4:	fff50513          	addi	a0,a0,-1
  4014b8:	1ff00593          	li	a1,511
  4014bc:	00b56463          	bltu	a0,a1,4014c4 <fat32_cat+0xa8>
  4014c0:	1ff00513          	li	a0,511
  4014c4:	01410413          	addi	s0,sp,20
  4014c8:	00850533          	add	a0,a0,s0
  4014cc:	00150493          	addi	s1,a0,1
        putchar(buf[i]);
  4014d0:	00044503          	lbu	a0,0(s0)
  4014d4:	00000097          	auipc	ra,0x0
  4014d8:	9d4080e7          	jalr	-1580(ra) # 400ea8 <putchar>
    for (uint32_t i = 0; i < size; i++) {
  4014dc:	00140413          	addi	s0,s0,1
  4014e0:	fe9418e3          	bne	s0,s1,4014d0 <fat32_cat+0xb4>
    putchar('\n');
  4014e4:	00a00513          	li	a0,10
  4014e8:	00000097          	auipc	ra,0x0
  4014ec:	9c0080e7          	jalr	-1600(ra) # 400ea8 <putchar>
  4014f0:	00000513          	li	a0,0
  4014f4:	21c12083          	lw	ra,540(sp)
  4014f8:	21812403          	lw	s0,536(sp)
  4014fc:	21412483          	lw	s1,532(sp)
}
  401500:	22010113          	addi	sp,sp,544
  401504:	00008067          	ret

00401508 <fat32_mount>:
}

int fat32_mount(void)
{
  401508:	ff010113          	addi	sp,sp,-16
  40150c:	00112623          	sw	ra,12(sp)
  401510:	00812423          	sw	s0,8(sp)
  401514:	00912223          	sw	s1,4(sp)
  401518:	01212023          	sw	s2,0(sp)
    uint8_t *buf = fat32_buf;

    if (call_sd_read_buf_api(0, buf))
  40151c:	00402537          	lui	a0,0x402
  401520:	43050493          	addi	s1,a0,1072 # 402430 <fat32_buf>
  401524:	00000513          	li	a0,0
  401528:	00048593          	mv	a1,s1
  40152c:	00000097          	auipc	ra,0x0
  401530:	ed8080e7          	jalr	-296(ra) # 401404 <call_sd_read_buf_api>
  401534:	fff00413          	li	s0,-1
  401538:	0c051e63          	bnez	a0,401614 <fat32_mount+0x10c>
        return -1;

    g_fat32.part_lba =
        ((uint32_t)buf[0x1C6]) |
        ((uint32_t)buf[0x1C7] << 8) |
  40153c:	1c74c503          	lbu	a0,455(s1)
        ((uint32_t)buf[0x1C6]) |
  401540:	1c64c583          	lbu	a1,454(s1)
        ((uint32_t)buf[0x1C8] << 16) |
  401544:	1c84c603          	lbu	a2,456(s1)
        ((uint32_t)buf[0x1C9] << 24);
  401548:	1c94c683          	lbu	a3,457(s1)
        ((uint32_t)buf[0x1C7] << 8) |
  40154c:	00851513          	slli	a0,a0,0x8
        ((uint32_t)buf[0x1C6]) |
  401550:	00b56533          	or	a0,a0,a1
        ((uint32_t)buf[0x1C8] << 16) |
  401554:	01061613          	slli	a2,a2,0x10
        ((uint32_t)buf[0x1C9] << 24);
  401558:	01869693          	slli	a3,a3,0x18
        ((uint32_t)buf[0x1C7] << 8) |
  40155c:	00d66633          	or	a2,a2,a3
        ((uint32_t)buf[0x1C8] << 16) |
  401560:	00c56533          	or	a0,a0,a2
    g_fat32.part_lba =
  401564:	00402937          	lui	s2,0x402
  401568:	62a92823          	sw	a0,1584(s2) # 402630 <g_fat32>

    if (call_sd_read_buf_api(g_fat32.part_lba, buf))
  40156c:	00048593          	mv	a1,s1
  401570:	00000097          	auipc	ra,0x0
  401574:	e94080e7          	jalr	-364(ra) # 401404 <call_sd_read_buf_api>
  401578:	08051e63          	bnez	a0,401614 <fat32_mount+0x10c>
        return -1;

    uint32_t reserved =
        ((uint32_t)buf[14]) |
  40157c:	00402537          	lui	a0,0x402
  401580:	43050513          	addi	a0,a0,1072 # 402430 <fat32_buf>
        ((uint32_t)buf[15] << 8);
  401584:	00f54583          	lbu	a1,15(a0)
        ((uint32_t)buf[14]) |
  401588:	00e54603          	lbu	a2,14(a0)
  40158c:	00000413          	li	s0,0
        ((uint32_t)buf[15] << 8);
  401590:	00859593          	slli	a1,a1,0x8
        ((uint32_t)buf[14]) |
  401594:	00c5e5b3          	or	a1,a1,a2
    uint32_t fat_count =
        (uint32_t)buf[16];

    uint32_t fat_size =
        ((uint32_t)buf[36]) |
        ((uint32_t)buf[37] << 8) |
  401598:	02554603          	lbu	a2,37(a0)
        ((uint32_t)buf[36]) |
  40159c:	02454683          	lbu	a3,36(a0)
        ((uint32_t)buf[38] << 16) |
  4015a0:	02654703          	lbu	a4,38(a0)
        ((uint32_t)buf[39] << 24);
  4015a4:	02754783          	lbu	a5,39(a0)
        ((uint32_t)buf[37] << 8) |
  4015a8:	00861613          	slli	a2,a2,0x8
        ((uint32_t)buf[36]) |
  4015ac:	00d66633          	or	a2,a2,a3
        ((uint32_t)buf[38] << 16) |
  4015b0:	01071713          	slli	a4,a4,0x10
        ((uint32_t)buf[39] << 24);
  4015b4:	01879793          	slli	a5,a5,0x18

    g_fat32.sectors_per_cluster =
        (uint32_t)buf[13];
  4015b8:	00d54683          	lbu	a3,13(a0)
        ((uint32_t)buf[37] << 8) |
  4015bc:	00f76733          	or	a4,a4,a5
        ((uint32_t)buf[38] << 16) |
  4015c0:	00e66633          	or	a2,a2,a4
    g_fat32.sectors_per_cluster =
  4015c4:	63090713          	addi	a4,s2,1584
  4015c8:	00d72823          	sw	a3,16(a4)

    g_fat32.root_cluster =
        ((uint32_t)buf[44]) |
        ((uint32_t)buf[45] << 8) |
  4015cc:	02d54683          	lbu	a3,45(a0)
        ((uint32_t)buf[44]) |
  4015d0:	02c54783          	lbu	a5,44(a0)
        ((uint32_t)buf[46] << 16) |
  4015d4:	02e54803          	lbu	a6,46(a0)
        ((uint32_t)buf[47] << 24);
  4015d8:	02f54883          	lbu	a7,47(a0)
        ((uint32_t)buf[45] << 8) |
  4015dc:	00869693          	slli	a3,a3,0x8
        ((uint32_t)buf[44]) |
  4015e0:	00f6e6b3          	or	a3,a3,a5
        ((uint32_t)buf[46] << 16) |
  4015e4:	01081813          	slli	a6,a6,0x10
        ((uint32_t)buf[47] << 24);
  4015e8:	01889893          	slli	a7,a7,0x18
        ((uint32_t)buf[45] << 8) |
  4015ec:	011867b3          	or	a5,a6,a7

    g_fat32.fat_begin =
        g_fat32.part_lba + reserved;
  4015f0:	63092803          	lw	a6,1584(s2)
        (uint32_t)buf[16];
  4015f4:	01054503          	lbu	a0,16(a0)
        ((uint32_t)buf[46] << 16) |
  4015f8:	00f6e6b3          	or	a3,a3,a5
    g_fat32.root_cluster =
  4015fc:	00d72623          	sw	a3,12(a4)
        g_fat32.part_lba + reserved;
  401600:	00b805b3          	add	a1,a6,a1
    g_fat32.fat_begin =
  401604:	00b72223          	sw	a1,4(a4)

    g_fat32.data_begin =
        g_fat32.fat_begin + fat_count * fat_size;
  401608:	02a60533          	mul	a0,a2,a0
  40160c:	00a58533          	add	a0,a1,a0
    g_fat32.data_begin =
  401610:	00a72423          	sw	a0,8(a4)

    return 0;
}
  401614:	00040513          	mv	a0,s0
  401618:	00c12083          	lw	ra,12(sp)
  40161c:	00812403          	lw	s0,8(sp)
  401620:	00412483          	lw	s1,4(sp)
  401624:	00012903          	lw	s2,0(sp)
  401628:	01010113          	addi	sp,sp,16
  40162c:	00008067          	ret

00401630 <fat32_find>:
{
  401630:	fc010113          	addi	sp,sp,-64
  401634:	02112e23          	sw	ra,60(sp)
  401638:	02812c23          	sw	s0,56(sp)
  40163c:	02912a23          	sw	s1,52(sp)
  401640:	03212823          	sw	s2,48(sp)
  401644:	03312623          	sw	s3,44(sp)
  401648:	03412423          	sw	s4,40(sp)
  40164c:	03512223          	sw	s5,36(sp)
  401650:	03612023          	sw	s6,32(sp)
  401654:	01712e23          	sw	s7,28(sp)
  401658:	01812c23          	sw	s8,24(sp)
  40165c:	01912a23          	sw	s9,20(sp)
  401660:	01a12823          	sw	s10,16(sp)
  401664:	00060413          	mv	s0,a2
  401668:	00058493          	mv	s1,a1
  40166c:	00050a13          	mv	s4,a0
    if (fat32_mount())
  401670:	00000097          	auipc	ra,0x0
  401674:	e98080e7          	jalr	-360(ra) # 401508 <fat32_mount>
  401678:	fff00913          	li	s2,-1
  40167c:	02051e63          	bnez	a0,4016b8 <fat32_find+0x88>
        cluster_to_lba(g_fat32.root_cluster);
  401680:	00402537          	lui	a0,0x402
  401684:	63050513          	addi	a0,a0,1584 # 402630 <g_fat32>
  401688:	00c52583          	lw	a1,12(a0)
           g_fat32.sectors_per_cluster;
  40168c:	01052603          	lw	a2,16(a0)
    return g_fat32.data_begin +
  401690:	00852503          	lw	a0,8(a0)
           (cluster - 2) *
  401694:	ffe58593          	addi	a1,a1,-2
  401698:	02b605b3          	mul	a1,a2,a1
    return g_fat32.data_begin +
  40169c:	00a58533          	add	a0,a1,a0
    if (call_sd_read_buf_api(root_lba, buf))
  4016a0:	004025b7          	lui	a1,0x402
  4016a4:	43058993          	addi	s3,a1,1072 # 402430 <fat32_buf>
  4016a8:	00098593          	mv	a1,s3
  4016ac:	00000097          	auipc	ra,0x0
  4016b0:	d58080e7          	jalr	-680(ra) # 401404 <call_sd_read_buf_api>
  4016b4:	04050063          	beqz	a0,4016f4 <fat32_find+0xc4>
}
  4016b8:	00090513          	mv	a0,s2
  4016bc:	03c12083          	lw	ra,60(sp)
  4016c0:	03812403          	lw	s0,56(sp)
  4016c4:	03412483          	lw	s1,52(sp)
  4016c8:	03012903          	lw	s2,48(sp)
  4016cc:	02c12983          	lw	s3,44(sp)
  4016d0:	02812a03          	lw	s4,40(sp)
  4016d4:	02412a83          	lw	s5,36(sp)
  4016d8:	02012b03          	lw	s6,32(sp)
  4016dc:	01c12b83          	lw	s7,28(sp)
  4016e0:	01812c03          	lw	s8,24(sp)
  4016e4:	01412c83          	lw	s9,20(sp)
  4016e8:	01012d03          	lw	s10,16(sp)
  4016ec:	04010113          	addi	sp,sp,64
  4016f0:	00008067          	ret
  4016f4:	01000a93          	li	s5,16
  4016f8:	0e500b13          	li	s6,229
  4016fc:	00f00b93          	li	s7,15
  401700:	02000c13          	li	s8,32
  401704:	00310c93          	addi	s9,sp,3
  401708:	02e00d13          	li	s10,46
  40170c:	0380006f          	j	401744 <fat32_find+0x114>
                    shortname[k++] = e[j];
  401710:	00158513          	addi	a0,a1,1
  401714:	00bc85b3          	add	a1,s9,a1
  401718:	00c58023          	sb	a2,0(a1)
        shortname[k] = '\0';
  40171c:	00ac8533          	add	a0,s9,a0
  401720:	00050023          	sb	zero,0(a0)
        if (strcmp(shortname, name) == 0) {
  401724:	00310513          	addi	a0,sp,3
  401728:	000a0593          	mv	a1,s4
  40172c:	00000097          	auipc	ra,0x0
  401730:	b88080e7          	jalr	-1144(ra) # 4012b4 <strcmp>
  401734:	14050063          	beqz	a0,401874 <fat32_find+0x244>
    for (int i = 0; i < 16; i++) {
  401738:	fffa8a93          	addi	s5,s5,-1
  40173c:	02098993          	addi	s3,s3,32
  401740:	f60a8ce3          	beqz	s5,4016b8 <fat32_find+0x88>
        if (e[0] == 0x00)
  401744:	0009c503          	lbu	a0,0(s3)
  401748:	ff6508e3          	beq	a0,s6,401738 <fat32_find+0x108>
  40174c:	f60506e3          	beqz	a0,4016b8 <fat32_find+0x88>
        if (e[11] == 0x0F)
  401750:	00b9c583          	lbu	a1,11(s3)
  401754:	ff7582e3          	beq	a1,s7,401738 <fat32_find+0x108>
            if (e[j] != ' ')
  401758:	01851a63          	bne	a0,s8,40176c <fat32_find+0x13c>
  40175c:	00000513          	li	a0,0
  401760:	0019c583          	lbu	a1,1(s3)
  401764:	01859c63          	bne	a1,s8,40177c <fat32_find+0x14c>
  401768:	0200006f          	j	401788 <fat32_find+0x158>
                shortname[k++] = e[j];
  40176c:	00a101a3          	sb	a0,3(sp)
  401770:	00100513          	li	a0,1
            if (e[j] != ' ')
  401774:	0019c583          	lbu	a1,1(s3)
  401778:	01858863          	beq	a1,s8,401788 <fat32_find+0x158>
                shortname[k++] = e[j];
  40177c:	00ac8633          	add	a2,s9,a0
  401780:	00150513          	addi	a0,a0,1
  401784:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  401788:	0029c583          	lbu	a1,2(s3)
  40178c:	03859c63          	bne	a1,s8,4017c4 <fat32_find+0x194>
  401790:	0039c583          	lbu	a1,3(s3)
  401794:	05859263          	bne	a1,s8,4017d8 <fat32_find+0x1a8>
  401798:	0049c583          	lbu	a1,4(s3)
  40179c:	05859863          	bne	a1,s8,4017ec <fat32_find+0x1bc>
  4017a0:	0059c583          	lbu	a1,5(s3)
  4017a4:	05859e63          	bne	a1,s8,401800 <fat32_find+0x1d0>
  4017a8:	0069c583          	lbu	a1,6(s3)
  4017ac:	07859463          	bne	a1,s8,401814 <fat32_find+0x1e4>
  4017b0:	0079c583          	lbu	a1,7(s3)
  4017b4:	07859a63          	bne	a1,s8,401828 <fat32_find+0x1f8>
        if (e[8] != ' ') {
  4017b8:	0089c603          	lbu	a2,8(s3)
  4017bc:	f78600e3          	beq	a2,s8,40171c <fat32_find+0xec>
  4017c0:	07c0006f          	j	40183c <fat32_find+0x20c>
                shortname[k++] = e[j];
  4017c4:	00ac8633          	add	a2,s9,a0
  4017c8:	00150513          	addi	a0,a0,1
  4017cc:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  4017d0:	0039c583          	lbu	a1,3(s3)
  4017d4:	fd8582e3          	beq	a1,s8,401798 <fat32_find+0x168>
                shortname[k++] = e[j];
  4017d8:	00ac8633          	add	a2,s9,a0
  4017dc:	00150513          	addi	a0,a0,1
  4017e0:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  4017e4:	0049c583          	lbu	a1,4(s3)
  4017e8:	fb858ce3          	beq	a1,s8,4017a0 <fat32_find+0x170>
                shortname[k++] = e[j];
  4017ec:	00ac8633          	add	a2,s9,a0
  4017f0:	00150513          	addi	a0,a0,1
  4017f4:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  4017f8:	0059c583          	lbu	a1,5(s3)
  4017fc:	fb8586e3          	beq	a1,s8,4017a8 <fat32_find+0x178>
                shortname[k++] = e[j];
  401800:	00ac8633          	add	a2,s9,a0
  401804:	00150513          	addi	a0,a0,1
  401808:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  40180c:	0069c583          	lbu	a1,6(s3)
  401810:	fb8580e3          	beq	a1,s8,4017b0 <fat32_find+0x180>
                shortname[k++] = e[j];
  401814:	00ac8633          	add	a2,s9,a0
  401818:	00150513          	addi	a0,a0,1
  40181c:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  401820:	0079c583          	lbu	a1,7(s3)
  401824:	f9858ae3          	beq	a1,s8,4017b8 <fat32_find+0x188>
                shortname[k++] = e[j];
  401828:	00ac8633          	add	a2,s9,a0
  40182c:	00150513          	addi	a0,a0,1
  401830:	00b60023          	sb	a1,0(a2)
        if (e[8] != ' ') {
  401834:	0089c603          	lbu	a2,8(s3)
  401838:	ef8602e3          	beq	a2,s8,40171c <fat32_find+0xec>
                if (e[j] != ' ')
  40183c:	0099c683          	lbu	a3,9(s3)
            shortname[k++] = '.';
  401840:	00ac8733          	add	a4,s9,a0
  401844:	01a70023          	sb	s10,0(a4)
                    shortname[k++] = e[j];
  401848:	00250593          	addi	a1,a0,2
  40184c:	00c700a3          	sb	a2,1(a4)
                if (e[j] != ' ')
  401850:	01868a63          	beq	a3,s8,401864 <fat32_find+0x234>
                    shortname[k++] = e[j];
  401854:	00bc85b3          	add	a1,s9,a1
  401858:	00350513          	addi	a0,a0,3
  40185c:	00d58023          	sb	a3,0(a1)
  401860:	00050593          	mv	a1,a0
                if (e[j] != ' ')
  401864:	00a9c603          	lbu	a2,10(s3)
  401868:	eb8614e3          	bne	a2,s8,401710 <fat32_find+0xe0>
  40186c:	00058513          	mv	a0,a1
  401870:	eadff06f          	j	40171c <fat32_find+0xec>
  401874:	00000913          	li	s2,0
                ((uint32_t)e[21] << 8);
  401878:	0159c503          	lbu	a0,21(s3)
                ((uint32_t)e[20]) |
  40187c:	0149c583          	lbu	a1,20(s3)
                ((uint32_t)e[26]) |
  401880:	01a9c603          	lbu	a2,26(s3)
                ((uint32_t)e[27] << 8);
  401884:	01b9c683          	lbu	a3,27(s3)
                (cl_hi << 16) | cl_lo;
  401888:	01851513          	slli	a0,a0,0x18
  40188c:	01059593          	slli	a1,a1,0x10
                ((uint32_t)e[26]) |
  401890:	00b56533          	or	a0,a0,a1
                ((uint32_t)e[27] << 8);
  401894:	00869693          	slli	a3,a3,0x8
                (cl_hi << 16) | cl_lo;
  401898:	00d66633          	or	a2,a2,a3
  40189c:	00c56533          	or	a0,a0,a2
            *cluster =
  4018a0:	00a4a023          	sw	a0,0(s1)
                ((uint32_t)e[29] << 8) |
  4018a4:	01d9c503          	lbu	a0,29(s3)
                ((uint32_t)e[28]) |
  4018a8:	01c9c583          	lbu	a1,28(s3)
                ((uint32_t)e[30] << 16) |
  4018ac:	01e9c603          	lbu	a2,30(s3)
                ((uint32_t)e[31] << 24);
  4018b0:	01f9c683          	lbu	a3,31(s3)
                ((uint32_t)e[29] << 8) |
  4018b4:	00851513          	slli	a0,a0,0x8
                ((uint32_t)e[28]) |
  4018b8:	00b56533          	or	a0,a0,a1
                ((uint32_t)e[30] << 16) |
  4018bc:	01061613          	slli	a2,a2,0x10
                ((uint32_t)e[31] << 24);
  4018c0:	01869693          	slli	a3,a3,0x18
                ((uint32_t)e[29] << 8) |
  4018c4:	00d66633          	or	a2,a2,a3
                ((uint32_t)e[30] << 16) |
  4018c8:	00c56533          	or	a0,a0,a2
            *size =
  4018cc:	00a42023          	sw	a0,0(s0)
  4018d0:	de9ff06f          	j	4016b8 <fat32_find+0x88>

004018d4 <cluster_to_lba>:
    return g_fat32.data_begin +
  4018d4:	004025b7          	lui	a1,0x402
  4018d8:	63058593          	addi	a1,a1,1584 # 402630 <g_fat32>
           g_fat32.sectors_per_cluster;
  4018dc:	0105a603          	lw	a2,16(a1)
    return g_fat32.data_begin +
  4018e0:	0085a583          	lw	a1,8(a1)
           (cluster - 2) *
  4018e4:	ffe50513          	addi	a0,a0,-2
  4018e8:	02a60533          	mul	a0,a2,a0
    return g_fat32.data_begin +
  4018ec:	00b50533          	add	a0,a0,a1
  4018f0:	00008067          	ret

004018f4 <fat32_ls>:

void fat32_ls(void)
{
  4018f4:	fd010113          	addi	sp,sp,-48
  4018f8:	02112623          	sw	ra,44(sp)
  4018fc:	02812423          	sw	s0,40(sp)
  401900:	02912223          	sw	s1,36(sp)
  401904:	03212023          	sw	s2,32(sp)
  401908:	01312e23          	sw	s3,28(sp)
  40190c:	01412c23          	sw	s4,24(sp)
  401910:	01512a23          	sw	s5,20(sp)
  401914:	01612823          	sw	s6,16(sp)
  401918:	01712623          	sw	s7,12(sp)
  40191c:	01812423          	sw	s8,8(sp)
    uint8_t *buf = fat32_buf;

    if (fat32_mount())
  401920:	00000097          	auipc	ra,0x0
  401924:	be8080e7          	jalr	-1048(ra) # 401508 <fat32_mount>
  401928:	02051e63          	bnez	a0,401964 <fat32_ls+0x70>
        return;

    uint32_t root_lba =
        cluster_to_lba(g_fat32.root_cluster);
  40192c:	00402537          	lui	a0,0x402
  401930:	63050993          	addi	s3,a0,1584 # 402630 <g_fat32>
  401934:	00c9a503          	lw	a0,12(s3)
           g_fat32.sectors_per_cluster;
  401938:	0109a583          	lw	a1,16(s3)
    return g_fat32.data_begin +
  40193c:	0089a603          	lw	a2,8(s3)
           (cluster - 2) *
  401940:	ffe50513          	addi	a0,a0,-2
  401944:	02a58533          	mul	a0,a1,a0
    return g_fat32.data_begin +
  401948:	00c50533          	add	a0,a0,a2

    if (call_sd_read_buf_api(root_lba, buf))
  40194c:	004025b7          	lui	a1,0x402
  401950:	43058413          	addi	s0,a1,1072 # 402430 <fat32_buf>
  401954:	00040593          	mv	a1,s0
  401958:	00000097          	auipc	ra,0x0
  40195c:	aac080e7          	jalr	-1364(ra) # 401404 <call_sd_read_buf_api>
  401960:	02050a63          	beqz	a0,401994 <fat32_ls+0xa0>
  401964:	02c12083          	lw	ra,44(sp)
  401968:	02812403          	lw	s0,40(sp)
  40196c:	02412483          	lw	s1,36(sp)
  401970:	02012903          	lw	s2,32(sp)
  401974:	01c12983          	lw	s3,28(sp)
  401978:	01812a03          	lw	s4,24(sp)
  40197c:	01412a83          	lw	s5,20(sp)
  401980:	01012b03          	lw	s6,16(sp)
  401984:	00c12b83          	lw	s7,12(sp)
  401988:	00812c03          	lw	s8,8(sp)
        printf(" cl=%x lba=%x size=%x\n",
                cl,
                lba,
                size);
    }
}
  40198c:	03010113          	addi	sp,sp,48
  401990:	00008067          	ret
  401994:	01000a13          	li	s4,16
  401998:	0e500a93          	li	s5,229
  40199c:	00f00b13          	li	s6,15
  4019a0:	02000b93          	li	s7,32
  4019a4:	00402537          	lui	a0,0x402
  4019a8:	1cd50493          	addi	s1,a0,461 # 4021cd <__modsi3+0xfd>
  4019ac:	00200c13          	li	s8,2
  4019b0:	00402537          	lui	a0,0x402
  4019b4:	27a50913          	addi	s2,a0,634 # 40227a <__modsi3+0x1aa>
  4019b8:	0580006f          	j	401a10 <fat32_ls+0x11c>
           g_fat32.sectors_per_cluster;
  4019bc:	0109a503          	lw	a0,16(s3)
    return g_fat32.data_begin +
  4019c0:	0089a603          	lw	a2,8(s3)
           (cluster - 2) *
  4019c4:	ffe58693          	addi	a3,a1,-2
  4019c8:	02d50533          	mul	a0,a0,a3
    return g_fat32.data_begin +
  4019cc:	00c50633          	add	a2,a0,a2
            ((uint32_t)e[29] << 8) |
  4019d0:	01d44503          	lbu	a0,29(s0)
            ((uint32_t)e[28]) |
  4019d4:	01c44683          	lbu	a3,28(s0)
            ((uint32_t)e[30] << 16) |
  4019d8:	01e44703          	lbu	a4,30(s0)
            ((uint32_t)e[31] << 24);
  4019dc:	01f44783          	lbu	a5,31(s0)
            ((uint32_t)e[29] << 8) |
  4019e0:	00851513          	slli	a0,a0,0x8
            ((uint32_t)e[28]) |
  4019e4:	00d56533          	or	a0,a0,a3
            ((uint32_t)e[30] << 16) |
  4019e8:	01071713          	slli	a4,a4,0x10
            ((uint32_t)e[31] << 24);
  4019ec:	01879793          	slli	a5,a5,0x18
            ((uint32_t)e[29] << 8) |
  4019f0:	00f766b3          	or	a3,a4,a5
            ((uint32_t)e[30] << 16) |
  4019f4:	00d566b3          	or	a3,a0,a3
        printf(" cl=%x lba=%x size=%x\n",
  4019f8:	00090513          	mv	a0,s2
  4019fc:	fffff097          	auipc	ra,0xfffff
  401a00:	58c080e7          	jalr	1420(ra) # 400f88 <printf>
    for (int i = 0; i < 16; i++) {
  401a04:	fffa0a13          	addi	s4,s4,-1
  401a08:	02040413          	addi	s0,s0,32
  401a0c:	f40a0ce3          	beqz	s4,401964 <fat32_ls+0x70>
        if (e[0] == 0x00)
  401a10:	00044503          	lbu	a0,0(s0)
  401a14:	ff5508e3          	beq	a0,s5,401a04 <fat32_ls+0x110>
  401a18:	f40506e3          	beqz	a0,401964 <fat32_ls+0x70>
        if (e[11] == 0x0F)
  401a1c:	00b44583          	lbu	a1,11(s0)
  401a20:	ff6582e3          	beq	a1,s6,401a04 <fat32_ls+0x110>
            if (e[j] != ' ')
  401a24:	05751463          	bne	a0,s7,401a6c <fat32_ls+0x178>
  401a28:	00144503          	lbu	a0,1(s0)
  401a2c:	05751863          	bne	a0,s7,401a7c <fat32_ls+0x188>
  401a30:	00244503          	lbu	a0,2(s0)
  401a34:	05751c63          	bne	a0,s7,401a8c <fat32_ls+0x198>
  401a38:	00344503          	lbu	a0,3(s0)
  401a3c:	07751063          	bne	a0,s7,401a9c <fat32_ls+0x1a8>
  401a40:	00444503          	lbu	a0,4(s0)
  401a44:	07751463          	bne	a0,s7,401aac <fat32_ls+0x1b8>
  401a48:	00544503          	lbu	a0,5(s0)
  401a4c:	07751863          	bne	a0,s7,401abc <fat32_ls+0x1c8>
  401a50:	00644503          	lbu	a0,6(s0)
  401a54:	07751c63          	bne	a0,s7,401acc <fat32_ls+0x1d8>
  401a58:	00744503          	lbu	a0,7(s0)
  401a5c:	09751063          	bne	a0,s7,401adc <fat32_ls+0x1e8>
        if (e[8] != ' ') {
  401a60:	00844503          	lbu	a0,8(s0)
  401a64:	09751463          	bne	a0,s7,401aec <fat32_ls+0x1f8>
  401a68:	0b00006f          	j	401b18 <fat32_ls+0x224>
                putchar(e[j]);
  401a6c:	fffff097          	auipc	ra,0xfffff
  401a70:	43c080e7          	jalr	1084(ra) # 400ea8 <putchar>
            if (e[j] != ' ')
  401a74:	00144503          	lbu	a0,1(s0)
  401a78:	fb750ce3          	beq	a0,s7,401a30 <fat32_ls+0x13c>
                putchar(e[j]);
  401a7c:	fffff097          	auipc	ra,0xfffff
  401a80:	42c080e7          	jalr	1068(ra) # 400ea8 <putchar>
            if (e[j] != ' ')
  401a84:	00244503          	lbu	a0,2(s0)
  401a88:	fb7508e3          	beq	a0,s7,401a38 <fat32_ls+0x144>
                putchar(e[j]);
  401a8c:	fffff097          	auipc	ra,0xfffff
  401a90:	41c080e7          	jalr	1052(ra) # 400ea8 <putchar>
            if (e[j] != ' ')
  401a94:	00344503          	lbu	a0,3(s0)
  401a98:	fb7504e3          	beq	a0,s7,401a40 <fat32_ls+0x14c>
                putchar(e[j]);
  401a9c:	fffff097          	auipc	ra,0xfffff
  401aa0:	40c080e7          	jalr	1036(ra) # 400ea8 <putchar>
            if (e[j] != ' ')
  401aa4:	00444503          	lbu	a0,4(s0)
  401aa8:	fb7500e3          	beq	a0,s7,401a48 <fat32_ls+0x154>
                putchar(e[j]);
  401aac:	fffff097          	auipc	ra,0xfffff
  401ab0:	3fc080e7          	jalr	1020(ra) # 400ea8 <putchar>
            if (e[j] != ' ')
  401ab4:	00544503          	lbu	a0,5(s0)
  401ab8:	f9750ce3          	beq	a0,s7,401a50 <fat32_ls+0x15c>
                putchar(e[j]);
  401abc:	fffff097          	auipc	ra,0xfffff
  401ac0:	3ec080e7          	jalr	1004(ra) # 400ea8 <putchar>
            if (e[j] != ' ')
  401ac4:	00644503          	lbu	a0,6(s0)
  401ac8:	f97508e3          	beq	a0,s7,401a58 <fat32_ls+0x164>
                putchar(e[j]);
  401acc:	fffff097          	auipc	ra,0xfffff
  401ad0:	3dc080e7          	jalr	988(ra) # 400ea8 <putchar>
            if (e[j] != ' ')
  401ad4:	00744503          	lbu	a0,7(s0)
  401ad8:	f97504e3          	beq	a0,s7,401a60 <fat32_ls+0x16c>
                putchar(e[j]);
  401adc:	fffff097          	auipc	ra,0xfffff
  401ae0:	3cc080e7          	jalr	972(ra) # 400ea8 <putchar>
        if (e[8] != ' ') {
  401ae4:	00844503          	lbu	a0,8(s0)
  401ae8:	03750863          	beq	a0,s7,401b18 <fat32_ls+0x224>
            putchar('.');
  401aec:	02e00513          	li	a0,46
  401af0:	fffff097          	auipc	ra,0xfffff
  401af4:	3b8080e7          	jalr	952(ra) # 400ea8 <putchar>
                if (e[j] != ' ')
  401af8:	00844503          	lbu	a0,8(s0)
  401afc:	07751063          	bne	a0,s7,401b5c <fat32_ls+0x268>
  401b00:	00944503          	lbu	a0,9(s0)
  401b04:	07751463          	bne	a0,s7,401b6c <fat32_ls+0x278>
  401b08:	00a44503          	lbu	a0,10(s0)
  401b0c:	01750663          	beq	a0,s7,401b18 <fat32_ls+0x224>
                    putchar(e[j]);
  401b10:	fffff097          	auipc	ra,0xfffff
  401b14:	398080e7          	jalr	920(ra) # 400ea8 <putchar>
        printf(" attr=%x", (uint32_t)e[11]);
  401b18:	00b44583          	lbu	a1,11(s0)
  401b1c:	00048513          	mv	a0,s1
  401b20:	fffff097          	auipc	ra,0xfffff
  401b24:	468080e7          	jalr	1128(ra) # 400f88 <printf>
            ((uint32_t)e[27] << 8);
  401b28:	01b44503          	lbu	a0,27(s0)
            ((uint32_t)e[21] << 8);
  401b2c:	01544583          	lbu	a1,21(s0)
            ((uint32_t)e[20]) |
  401b30:	01444603          	lbu	a2,20(s0)
            ((uint32_t)e[26]) |
  401b34:	01a44683          	lbu	a3,26(s0)
            ((uint32_t)e[27] << 8);
  401b38:	00851513          	slli	a0,a0,0x8
            (cl_hi << 16) | cl_lo;
  401b3c:	01859593          	slli	a1,a1,0x18
  401b40:	01061613          	slli	a2,a2,0x10
            ((uint32_t)e[26]) |
  401b44:	00c5e5b3          	or	a1,a1,a2
            (cl_hi << 16) | cl_lo;
  401b48:	00a6e533          	or	a0,a3,a0
  401b4c:	00a5e5b3          	or	a1,a1,a0
        if (cl >= 2)
  401b50:	e785f6e3          	bgeu	a1,s8,4019bc <fat32_ls+0xc8>
  401b54:	00000613          	li	a2,0
  401b58:	e79ff06f          	j	4019d0 <fat32_ls+0xdc>
                    putchar(e[j]);
  401b5c:	fffff097          	auipc	ra,0xfffff
  401b60:	34c080e7          	jalr	844(ra) # 400ea8 <putchar>
                if (e[j] != ' ')
  401b64:	00944503          	lbu	a0,9(s0)
  401b68:	fb7500e3          	beq	a0,s7,401b08 <fat32_ls+0x214>
                    putchar(e[j]);
  401b6c:	fffff097          	auipc	ra,0xfffff
  401b70:	33c080e7          	jalr	828(ra) # 400ea8 <putchar>
                if (e[j] != ' ')
  401b74:	00a44503          	lbu	a0,10(s0)
  401b78:	f9751ce3          	bne	a0,s7,401b10 <fat32_ls+0x21c>
  401b7c:	f9dff06f          	j	401b18 <fat32_ls+0x224>

00401b80 <fat32_touch>:

    return 0;
}

int fat32_touch(const char *name)
{
  401b80:	fe010113          	addi	sp,sp,-32
  401b84:	00112e23          	sw	ra,28(sp)
  401b88:	00812c23          	sw	s0,24(sp)
  401b8c:	00912a23          	sw	s1,20(sp)
  401b90:	01212823          	sw	s2,16(sp)
  401b94:	01312623          	sw	s3,12(sp)
  401b98:	00050413          	mv	s0,a0
    uint8_t *buf = fat32_buf;

    if (fat32_mount())
  401b9c:	00000097          	auipc	ra,0x0
  401ba0:	96c080e7          	jalr	-1684(ra) # 401508 <fat32_mount>
  401ba4:	fff00993          	li	s3,-1
  401ba8:	3e051663          	bnez	a0,401f94 <fat32_touch+0x414>
        return -1;

    uint32_t root_lba =
        cluster_to_lba(g_fat32.root_cluster);
  401bac:	00402537          	lui	a0,0x402
  401bb0:	63050513          	addi	a0,a0,1584 # 402630 <g_fat32>
  401bb4:	00c52583          	lw	a1,12(a0)
           g_fat32.sectors_per_cluster;
  401bb8:	01052603          	lw	a2,16(a0)
    return g_fat32.data_begin +
  401bbc:	00852483          	lw	s1,8(a0)
           (cluster - 2) *
  401bc0:	ffe58593          	addi	a1,a1,-2
  401bc4:	02b60533          	mul	a0,a2,a1
    return g_fat32.data_begin +
  401bc8:	009504b3          	add	s1,a0,s1

    if (call_sd_read_buf_api(root_lba, buf))
  401bcc:	00402537          	lui	a0,0x402
  401bd0:	43050593          	addi	a1,a0,1072 # 402430 <fat32_buf>
  401bd4:	00048513          	mv	a0,s1
  401bd8:	00000097          	auipc	ra,0x0
  401bdc:	82c080e7          	jalr	-2004(ra) # 401404 <call_sd_read_buf_api>
  401be0:	3a051a63          	bnez	a0,401f94 <fat32_touch+0x414>
  401be4:	02000593          	li	a1,32
        out[i] = ' ';
  401be8:	00b100a3          	sb	a1,1(sp)
  401bec:	00b10123          	sb	a1,2(sp)
  401bf0:	00b101a3          	sb	a1,3(sp)
  401bf4:	00b10223          	sb	a1,4(sp)
  401bf8:	00b102a3          	sb	a1,5(sp)
  401bfc:	00b10323          	sb	a1,6(sp)
  401c00:	00b103a3          	sb	a1,7(sp)
    while (*name &&
  401c04:	00044503          	lbu	a0,0(s0)
        out[i] = ' ';
  401c08:	00b10423          	sb	a1,8(sp)
  401c0c:	00b104a3          	sb	a1,9(sp)
  401c10:	00b10523          	sb	a1,10(sp)
  401c14:	00b105a3          	sb	a1,11(sp)
    while (*name &&
  401c18:	04050263          	beqz	a0,401c5c <fat32_touch+0xdc>
  401c1c:	00000593          	li	a1,0
  401c20:	02e00613          	li	a2,46
  401c24:	00700693          	li	a3,7
  401c28:	00110713          	addi	a4,sp,1
           *name != '.' &&
  401c2c:	0ff57793          	zext.b	a5,a0
  401c30:	02c78a63          	beq	a5,a2,401c64 <fat32_touch+0xe4>
  401c34:	02b6e863          	bltu	a3,a1,401c64 <fat32_touch+0xe4>
        out[pos++] = *name++;
  401c38:	00b407b3          	add	a5,s0,a1
  401c3c:	00b70833          	add	a6,a4,a1
  401c40:	00a80023          	sb	a0,0(a6)
    while (*name &&
  401c44:	0017c503          	lbu	a0,1(a5)
        out[pos++] = *name++;
  401c48:	00158793          	addi	a5,a1,1
  401c4c:	00078593          	mv	a1,a5
    while (*name &&
  401c50:	fc051ee3          	bnez	a0,401c2c <fat32_touch+0xac>
    while (*name &&
  401c54:	00f405b3          	add	a1,s0,a5
  401c58:	0100006f          	j	401c68 <fat32_touch+0xe8>
  401c5c:	00040593          	mv	a1,s0
  401c60:	0080006f          	j	401c68 <fat32_touch+0xe8>
  401c64:	00b405b3          	add	a1,s0,a1
  401c68:	00158593          	addi	a1,a1,1
  401c6c:	02e00613          	li	a2,46
  401c70:	0ff57513          	zext.b	a0,a0
  401c74:	00050c63          	beqz	a0,401c8c <fat32_touch+0x10c>
  401c78:	00c50a63          	beq	a0,a2,401c8c <fat32_touch+0x10c>
  401c7c:	0005c503          	lbu	a0,0(a1)
  401c80:	00158593          	addi	a1,a1,1
  401c84:	0ff57513          	zext.b	a0,a0
  401c88:	fe0518e3          	bnez	a0,401c78 <fat32_touch+0xf8>
    if (*name == '.')
  401c8c:	fd250513          	addi	a0,a0,-46
  401c90:	00153513          	seqz	a0,a0
    while (*name && pos < 11) {
  401c94:	00a58533          	add	a0,a1,a0
  401c98:	fff54583          	lbu	a1,-1(a0)
  401c9c:	02058863          	beqz	a1,401ccc <fat32_touch+0x14c>
  401ca0:	00000613          	li	a2,0
  401ca4:	00910693          	addi	a3,sp,9
  401ca8:	00900713          	li	a4,9
        out[pos++] = *name++;
  401cac:	00860793          	addi	a5,a2,8
  401cb0:	00c68833          	add	a6,a3,a2
  401cb4:	00b80023          	sb	a1,0(a6)
    while (*name && pos < 11) {
  401cb8:	00f76a63          	bltu	a4,a5,401ccc <fat32_touch+0x14c>
  401cbc:	00c505b3          	add	a1,a0,a2
  401cc0:	0005c583          	lbu	a1,0(a1)
  401cc4:	00160613          	addi	a2,a2,1
  401cc8:	fe0592e3          	bnez	a1,401cac <fat32_touch+0x12c>

    for (int i = 0; i < 16; i++) {

        uint8_t *e = &buf[i * 32];

        if (e[0] != 0x00 &&
  401ccc:	00402537          	lui	a0,0x402
  401cd0:	43054583          	lbu	a1,1072(a0) # 402430 <fat32_buf>
  401cd4:	43050913          	addi	s2,a0,1072
  401cd8:	0e500613          	li	a2,229
  401cdc:	00090513          	mv	a0,s2
  401ce0:	1ac58a63          	beq	a1,a2,401e94 <fat32_touch+0x314>
  401ce4:	00090513          	mv	a0,s2
  401ce8:	1a058663          	beqz	a1,401e94 <fat32_touch+0x314>
  401cec:	00402537          	lui	a0,0x402
  401cf0:	43050513          	addi	a0,a0,1072 # 402430 <fat32_buf>
  401cf4:	02054583          	lbu	a1,32(a0)
  401cf8:	02050513          	addi	a0,a0,32
  401cfc:	18058c63          	beqz	a1,401e94 <fat32_touch+0x314>
  401d00:	0e500613          	li	a2,229
  401d04:	18c58863          	beq	a1,a2,401e94 <fat32_touch+0x314>
  401d08:	00402537          	lui	a0,0x402
  401d0c:	43050513          	addi	a0,a0,1072 # 402430 <fat32_buf>
  401d10:	04054583          	lbu	a1,64(a0)
  401d14:	04050513          	addi	a0,a0,64
  401d18:	16058e63          	beqz	a1,401e94 <fat32_touch+0x314>
  401d1c:	0e500613          	li	a2,229
  401d20:	16c58a63          	beq	a1,a2,401e94 <fat32_touch+0x314>
  401d24:	00402537          	lui	a0,0x402
  401d28:	43050513          	addi	a0,a0,1072 # 402430 <fat32_buf>
  401d2c:	06054583          	lbu	a1,96(a0)
  401d30:	06050513          	addi	a0,a0,96
  401d34:	16058063          	beqz	a1,401e94 <fat32_touch+0x314>
  401d38:	0e500613          	li	a2,229
  401d3c:	14c58c63          	beq	a1,a2,401e94 <fat32_touch+0x314>
  401d40:	00402537          	lui	a0,0x402
  401d44:	43050513          	addi	a0,a0,1072 # 402430 <fat32_buf>
  401d48:	08054583          	lbu	a1,128(a0)
  401d4c:	08050513          	addi	a0,a0,128
  401d50:	14058263          	beqz	a1,401e94 <fat32_touch+0x314>
  401d54:	0e500613          	li	a2,229
  401d58:	12c58e63          	beq	a1,a2,401e94 <fat32_touch+0x314>
  401d5c:	00402537          	lui	a0,0x402
  401d60:	43050513          	addi	a0,a0,1072 # 402430 <fat32_buf>
  401d64:	0a054583          	lbu	a1,160(a0)
  401d68:	0a050513          	addi	a0,a0,160
  401d6c:	12058463          	beqz	a1,401e94 <fat32_touch+0x314>
  401d70:	0e500613          	li	a2,229
  401d74:	12c58063          	beq	a1,a2,401e94 <fat32_touch+0x314>
  401d78:	00402537          	lui	a0,0x402
  401d7c:	43050513          	addi	a0,a0,1072 # 402430 <fat32_buf>
  401d80:	0c054583          	lbu	a1,192(a0)
  401d84:	0c050513          	addi	a0,a0,192
  401d88:	10058663          	beqz	a1,401e94 <fat32_touch+0x314>
  401d8c:	0e500613          	li	a2,229
  401d90:	10c58263          	beq	a1,a2,401e94 <fat32_touch+0x314>
  401d94:	00402537          	lui	a0,0x402
  401d98:	43050513          	addi	a0,a0,1072 # 402430 <fat32_buf>
  401d9c:	0e054583          	lbu	a1,224(a0)
  401da0:	0e050513          	addi	a0,a0,224
  401da4:	0e058863          	beqz	a1,401e94 <fat32_touch+0x314>
  401da8:	0e500613          	li	a2,229
  401dac:	0ec58463          	beq	a1,a2,401e94 <fat32_touch+0x314>
  401db0:	00402537          	lui	a0,0x402
  401db4:	43050513          	addi	a0,a0,1072 # 402430 <fat32_buf>
  401db8:	10054583          	lbu	a1,256(a0)
  401dbc:	10050513          	addi	a0,a0,256
  401dc0:	0c058a63          	beqz	a1,401e94 <fat32_touch+0x314>
  401dc4:	0e500613          	li	a2,229
  401dc8:	0cc58663          	beq	a1,a2,401e94 <fat32_touch+0x314>
  401dcc:	00402537          	lui	a0,0x402
  401dd0:	43050513          	addi	a0,a0,1072 # 402430 <fat32_buf>
  401dd4:	12054583          	lbu	a1,288(a0)
  401dd8:	12050513          	addi	a0,a0,288
  401ddc:	0a058c63          	beqz	a1,401e94 <fat32_touch+0x314>
  401de0:	0e500613          	li	a2,229
  401de4:	0ac58863          	beq	a1,a2,401e94 <fat32_touch+0x314>
  401de8:	00402537          	lui	a0,0x402
  401dec:	43050513          	addi	a0,a0,1072 # 402430 <fat32_buf>
  401df0:	14054583          	lbu	a1,320(a0)
  401df4:	14050513          	addi	a0,a0,320
  401df8:	08058e63          	beqz	a1,401e94 <fat32_touch+0x314>
  401dfc:	0e500613          	li	a2,229
  401e00:	08c58a63          	beq	a1,a2,401e94 <fat32_touch+0x314>
  401e04:	00402537          	lui	a0,0x402
  401e08:	43050513          	addi	a0,a0,1072 # 402430 <fat32_buf>
  401e0c:	16054583          	lbu	a1,352(a0)
  401e10:	16050513          	addi	a0,a0,352
  401e14:	08058063          	beqz	a1,401e94 <fat32_touch+0x314>
  401e18:	0e500613          	li	a2,229
  401e1c:	06c58c63          	beq	a1,a2,401e94 <fat32_touch+0x314>
  401e20:	00402537          	lui	a0,0x402
  401e24:	43050513          	addi	a0,a0,1072 # 402430 <fat32_buf>
  401e28:	18054583          	lbu	a1,384(a0)
  401e2c:	18050513          	addi	a0,a0,384
  401e30:	06058263          	beqz	a1,401e94 <fat32_touch+0x314>
  401e34:	0e500613          	li	a2,229
  401e38:	04c58e63          	beq	a1,a2,401e94 <fat32_touch+0x314>
  401e3c:	00402537          	lui	a0,0x402
  401e40:	43050513          	addi	a0,a0,1072 # 402430 <fat32_buf>
  401e44:	1a054583          	lbu	a1,416(a0)
  401e48:	1a050513          	addi	a0,a0,416
  401e4c:	04058463          	beqz	a1,401e94 <fat32_touch+0x314>
  401e50:	0e500613          	li	a2,229
  401e54:	04c58063          	beq	a1,a2,401e94 <fat32_touch+0x314>
  401e58:	00402537          	lui	a0,0x402
  401e5c:	43050513          	addi	a0,a0,1072 # 402430 <fat32_buf>
  401e60:	1c054583          	lbu	a1,448(a0)
  401e64:	1c050513          	addi	a0,a0,448
  401e68:	02058663          	beqz	a1,401e94 <fat32_touch+0x314>
  401e6c:	0e500613          	li	a2,229
  401e70:	02c58263          	beq	a1,a2,401e94 <fat32_touch+0x314>
  401e74:	00402537          	lui	a0,0x402
  401e78:	43050513          	addi	a0,a0,1072 # 402430 <fat32_buf>
  401e7c:	1e054583          	lbu	a1,480(a0)
  401e80:	1e050513          	addi	a0,a0,480
  401e84:	00058863          	beqz	a1,401e94 <fat32_touch+0x314>
  401e88:	0e500613          	li	a2,229
  401e8c:	fff00993          	li	s3,-1
  401e90:	10c59263          	bne	a1,a2,401f94 <fat32_touch+0x414>
        for (int j = 0; j < 32; j++)
            e[j] = 0;

        // 8.3 filename
        for (int j = 0; j < 11; j++)
            e[j] = shortname[j];
  401e94:	00114583          	lbu	a1,1(sp)
  401e98:	00214603          	lbu	a2,2(sp)
  401e9c:	00314683          	lbu	a3,3(sp)
  401ea0:	00b50023          	sb	a1,0(a0)
  401ea4:	00c500a3          	sb	a2,1(a0)
  401ea8:	00d50123          	sb	a3,2(a0)
  401eac:	00414583          	lbu	a1,4(sp)
  401eb0:	00514603          	lbu	a2,5(sp)
  401eb4:	00614683          	lbu	a3,6(sp)
  401eb8:	00714703          	lbu	a4,7(sp)
  401ebc:	00b501a3          	sb	a1,3(a0)
  401ec0:	00c50223          	sb	a2,4(a0)
  401ec4:	00d502a3          	sb	a3,5(a0)
  401ec8:	00e50323          	sb	a4,6(a0)
  401ecc:	00814583          	lbu	a1,8(sp)
            e[j] = 0;
  401ed0:	00050623          	sb	zero,12(a0)
  401ed4:	000506a3          	sb	zero,13(a0)
  401ed8:	00050723          	sb	zero,14(a0)
            e[j] = shortname[j];
  401edc:	00b503a3          	sb	a1,7(a0)
  401ee0:	00914583          	lbu	a1,9(sp)
            e[j] = 0;
  401ee4:	000507a3          	sb	zero,15(a0)
  401ee8:	00050823          	sb	zero,16(a0)
  401eec:	000508a3          	sb	zero,17(a0)
            e[j] = shortname[j];
  401ef0:	00b50423          	sb	a1,8(a0)
  401ef4:	00a14583          	lbu	a1,10(sp)
            e[j] = 0;
  401ef8:	00050923          	sb	zero,18(a0)
  401efc:	000509a3          	sb	zero,19(a0)
  401f00:	00050b23          	sb	zero,22(a0)
            e[j] = shortname[j];
  401f04:	00b504a3          	sb	a1,9(a0)
  401f08:	00b14583          	lbu	a1,11(sp)
            e[j] = 0;
  401f0c:	00050ba3          	sb	zero,23(a0)
  401f10:	00050c23          	sb	zero,24(a0)
  401f14:	00050ca3          	sb	zero,25(a0)
            e[j] = shortname[j];
  401f18:	00b50523          	sb	a1,10(a0)
  401f1c:	02000593          	li	a1,32

        // archive
        e[11] = 0x20;
  401f20:	00b505a3          	sb	a1,11(a0)

        // first cluster = 0
        e[20] = 0;
  401f24:	00050a23          	sb	zero,20(a0)
        e[21] = 0;
  401f28:	00050aa3          	sb	zero,21(a0)
        e[26] = 0;
  401f2c:	00050d23          	sb	zero,26(a0)
        e[27] = 0;
  401f30:	00050da3          	sb	zero,27(a0)

        // size = 0
        e[28] = 0;
  401f34:	00050e23          	sb	zero,28(a0)
        e[29] = 0;
  401f38:	00050ea3          	sb	zero,29(a0)
        e[30] = 0;
  401f3c:	00050f23          	sb	zero,30(a0)
        e[31] = 0;
  401f40:	00050fa3          	sb	zero,31(a0)

        printf("USER BUF: ");
  401f44:	00402537          	lui	a0,0x402
  401f48:	22550513          	addi	a0,a0,549 # 402225 <__modsi3+0x155>
  401f4c:	fffff097          	auipc	ra,0xfffff
  401f50:	03c080e7          	jalr	60(ra) # 400f88 <printf>
        for (int i = 0; i < 16; i++) {
            printf("%x ", (uint32_t)buf[i]);
        }
        */

        printf("\n");
  401f54:	00402537          	lui	a0,0x402
  401f58:	31350513          	addi	a0,a0,787 # 402313 <__modsi3+0x243>
  401f5c:	fffff097          	auipc	ra,0xfffff
  401f60:	02c080e7          	jalr	44(ra) # 400f88 <printf>

        if (call_sd_write_buf_api(root_lba, buf))
  401f64:	00048513          	mv	a0,s1
  401f68:	00090593          	mv	a1,s2
  401f6c:	fffff097          	auipc	ra,0xfffff
  401f70:	2fc080e7          	jalr	764(ra) # 401268 <call_sd_write_buf_api>
  401f74:	fff00993          	li	s3,-1
  401f78:	00051e63          	bnez	a0,401f94 <fat32_touch+0x414>
            return -1;

        printf("created: %s\n", name);
  401f7c:	00402537          	lui	a0,0x402
  401f80:	2de50513          	addi	a0,a0,734 # 4022de <__modsi3+0x20e>
  401f84:	00040593          	mv	a1,s0
  401f88:	fffff097          	auipc	ra,0xfffff
  401f8c:	000080e7          	jalr	ra # 400f88 <printf>
  401f90:	00000993          	li	s3,0

        return 0;
    }

    return -1;
  401f94:	00098513          	mv	a0,s3
  401f98:	01c12083          	lw	ra,28(sp)
  401f9c:	01812403          	lw	s0,24(sp)
  401fa0:	01412483          	lw	s1,20(sp)
  401fa4:	01012903          	lw	s2,16(sp)
  401fa8:	00c12983          	lw	s3,12(sp)
  401fac:	02010113          	addi	sp,sp,32
  401fb0:	00008067          	ret

00401fb4 <__udivsi3>:
  401fb4:	04058a63          	beqz	a1,402008 <__udivsi3+0x54>
  401fb8:	00000813          	li	a6,0
  401fbc:	00000613          	li	a2,0
  401fc0:	01f00693          	li	a3,31
  401fc4:	00100713          	li	a4,1
  401fc8:	fff00793          	li	a5,-1
  401fcc:	00181813          	slli	a6,a6,0x1
  401fd0:	00d558b3          	srl	a7,a0,a3
  401fd4:	0018f893          	andi	a7,a7,1
  401fd8:	0108e833          	or	a6,a7,a6
  401fdc:	00b838b3          	sltu	a7,a6,a1
  401fe0:	00d712b3          	sll	t0,a4,a3
  401fe4:	fff88893          	addi	a7,a7,-1
  401fe8:	0058f2b3          	and	t0,a7,t0
  401fec:	00c2e633          	or	a2,t0,a2
  401ff0:	00b8f8b3          	and	a7,a7,a1
  401ff4:	fff68693          	addi	a3,a3,-1
  401ff8:	41180833          	sub	a6,a6,a7
  401ffc:	fcf698e3          	bne	a3,a5,401fcc <__udivsi3+0x18>
  402000:	00060513          	mv	a0,a2
  402004:	00008067          	ret
  402008:	00000513          	li	a0,0
  40200c:	00008067          	ret

00402010 <__umodsi3>:
  402010:	00000613          	li	a2,0
  402014:	02058a63          	beqz	a1,402048 <__umodsi3+0x38>
  402018:	01f00693          	li	a3,31
  40201c:	fff00713          	li	a4,-1
  402020:	00161613          	slli	a2,a2,0x1
  402024:	00d557b3          	srl	a5,a0,a3
  402028:	0017f793          	andi	a5,a5,1
  40202c:	00c7e633          	or	a2,a5,a2
  402030:	00b637b3          	sltu	a5,a2,a1
  402034:	fff78793          	addi	a5,a5,-1
  402038:	00b7f7b3          	and	a5,a5,a1
  40203c:	fff68693          	addi	a3,a3,-1
  402040:	40f60633          	sub	a2,a2,a5
  402044:	fce69ee3          	bne	a3,a4,402020 <__umodsi3+0x10>
  402048:	00060513          	mv	a0,a2
  40204c:	00008067          	ret

00402050 <__divsi3>:
  402050:	06058c63          	beqz	a1,4020c8 <__divsi3+0x78>
  402054:	00000293          	li	t0,0
  402058:	00000613          	li	a2,0
  40205c:	41f55693          	srai	a3,a0,0x1f
  402060:	00d54733          	xor	a4,a0,a3
  402064:	40d706b3          	sub	a3,a4,a3
  402068:	41f5d713          	srai	a4,a1,0x1f
  40206c:	00e5c7b3          	xor	a5,a1,a4
  402070:	40e78733          	sub	a4,a5,a4
  402074:	01f00793          	li	a5,31
  402078:	00100813          	li	a6,1
  40207c:	fff00893          	li	a7,-1
  402080:	00129293          	slli	t0,t0,0x1
  402084:	00f6d333          	srl	t1,a3,a5
  402088:	00137313          	andi	t1,t1,1
  40208c:	005362b3          	or	t0,t1,t0
  402090:	00e2b333          	sltu	t1,t0,a4
  402094:	00f813b3          	sll	t2,a6,a5
  402098:	fff30313          	addi	t1,t1,-1
  40209c:	007373b3          	and	t2,t1,t2
  4020a0:	00c3e633          	or	a2,t2,a2
  4020a4:	00e37333          	and	t1,t1,a4
  4020a8:	fff78793          	addi	a5,a5,-1
  4020ac:	406282b3          	sub	t0,t0,t1
  4020b0:	fd1798e3          	bne	a5,a7,402080 <__divsi3+0x30>
  4020b4:	00a5c533          	xor	a0,a1,a0
  4020b8:	00055463          	bgez	a0,4020c0 <__divsi3+0x70>
  4020bc:	40c00633          	neg	a2,a2
  4020c0:	00060513          	mv	a0,a2
  4020c4:	00008067          	ret
  4020c8:	00000513          	li	a0,0
  4020cc:	00008067          	ret

004020d0 <__modsi3>:
  4020d0:	00000613          	li	a2,0
  4020d4:	04058a63          	beqz	a1,402128 <__modsi3+0x58>
  4020d8:	41f55693          	srai	a3,a0,0x1f
  4020dc:	00d54733          	xor	a4,a0,a3
  4020e0:	40d706b3          	sub	a3,a4,a3
  4020e4:	41f5d713          	srai	a4,a1,0x1f
  4020e8:	00e5c5b3          	xor	a1,a1,a4
  4020ec:	40e585b3          	sub	a1,a1,a4
  4020f0:	01f00713          	li	a4,31
  4020f4:	fff00793          	li	a5,-1
  4020f8:	00161613          	slli	a2,a2,0x1
  4020fc:	00e6d833          	srl	a6,a3,a4
  402100:	00187813          	andi	a6,a6,1
  402104:	00c86633          	or	a2,a6,a2
  402108:	00b63833          	sltu	a6,a2,a1
  40210c:	fff80813          	addi	a6,a6,-1
  402110:	00b87833          	and	a6,a6,a1
  402114:	fff70713          	addi	a4,a4,-1
  402118:	41060633          	sub	a2,a2,a6
  40211c:	fcf71ee3          	bne	a4,a5,4020f8 <__modsi3+0x28>
  402120:	00055463          	bgez	a0,402128 <__modsi3+0x58>
  402124:	40c00633          	neg	a2,a2
  402128:	00060513          	mv	a0,a2
  40212c:	00008067          	ret

セクション .rodata の逆アセンブル:

00402130 <$d.2-0x20b>:
  402130:	7375                	.insn	2, 0x7375
  402132:	6761                	.insn	2, 0x6761
  402134:	3a65                	.insn	2, 0x3a65
  402136:	6620                	.insn	2, 0x6620
  402138:	7461                	.insn	2, 0x7461
  40213a:	635f3233          	.insn	4, 0x635f3233
  40213e:	7461                	.insn	2, 0x7461
  402140:	3c20                	.insn	2, 0x3c20
  402142:	6966                	.insn	2, 0x6966
  402144:	656c                	.insn	2, 0x656c
  402146:	0a3e                	.insn	2, 0x0a3e
  402148:	4d00                	.insn	2, 0x4d00
  40214a:	4349                	.insn	2, 0x4349
  40214c:	542e                	.insn	2, 0x542e
  40214e:	5458                	.insn	2, 0x5458
  402150:	6320                	.insn	2, 0x6320
  402152:	3d6c                	.insn	2, 0x3d6c
  402154:	7825                	.insn	2, 0x7825
  402156:	6c20                	.insn	2, 0x6c20
  402158:	6162                	.insn	2, 0x6162
  40215a:	253d                	.insn	2, 0x253d
  40215c:	2078                	.insn	2, 0x2078
  40215e:	657a6973          	csrrsi	s2,hviprio2h,20
  402162:	253d                	.insn	2, 0x253d
  402164:	0a78                	.insn	2, 0x0a78
  402166:	5300                	.insn	2, 0x5300
  402168:	70203257          	.insn	4, 0x70203257
  40216c:	6572                	.insn	2, 0x6572
  40216e:	64657373          	csrrci	t1,hviprio1,10
  402172:	000a                	.insn	2, 0x000a
  402174:	6166                	.insn	2, 0x6166
  402176:	3374                	.insn	2, 0x3374
  402178:	5f32                	.insn	2, 0x5f32
  40217a:	736c                	.insn	2, 0x736c
  40217c:	6600                	.insn	2, 0x6600
  40217e:	7461                	.insn	2, 0x7461
  402180:	635f3233          	.insn	4, 0x635f3233
  402184:	7461                	.insn	2, 0x7461
  402186:	6600                	.insn	2, 0x6600
  402188:	7461                	.insn	2, 0x7461
  40218a:	745f3233          	.insn	4, 0x745f3233
  40218e:	6863756f          	jal	a0,439814 <__user_stack_top+0x161c4>
  402192:	6620                	.insn	2, 0x6620
  402194:	6961                	.insn	2, 0x6961
  402196:	656c                	.insn	2, 0x656c
  402198:	0a64                	.insn	2, 0x0a64
  40219a:	4d00                	.insn	2, 0x4d00
  40219c:	4349                	.insn	2, 0x4349
  40219e:	542e                	.insn	2, 0x542e
  4021a0:	5458                	.insn	2, 0x5458
  4021a2:	6e20                	.insn	2, 0x6e20
  4021a4:	6620746f          	jal	s0,409806 <__user_stack_start+0x61b6>
  4021a8:	646e756f          	jal	a0,4e97ee <__user_stack_top+0xc619e>
  4021ac:	000a                	.insn	2, 0x000a
  4021ae:	735f6473          	csrrsi	s0,mhpmevent21h,30
  4021b2:	6365                	.insn	2, 0x6365
  4021b4:	6f74                	.insn	2, 0x6f74
  4021b6:	2072                	.insn	2, 0x2072
  4021b8:	74697277          	.insn	4, 0x74697277
  4021bc:	2065                	.insn	2, 0x2065
  4021be:	74636573          	csrrsi	a0,0x746,6
  4021c2:	3c20726f          	jal	tp,409584 <__user_stack_start+0x5f34>
  4021c6:	3520                	.insn	2, 0x3520
  4021c8:	3030                	.insn	2, 0x3030
  4021ca:	0a30                	.insn	2, 0x0a30
  4021cc:	2000                	.insn	2, 0x2000
  4021ce:	7461                	.insn	2, 0x7461
  4021d0:	7274                	.insn	2, 0x7274
  4021d2:	253d                	.insn	2, 0x253d
  4021d4:	0078                	.insn	2, 0x0078
  4021d6:	725f6473          	csrrsi	s0,mhpmevent5h,30
  4021da:	6165                	.insn	2, 0x6165
  4021dc:	0064                	.insn	2, 0x0064
  4021de:	775f6473          	csrrsi	s0,0x775,30
  4021e2:	6972                	.insn	2, 0x6972
  4021e4:	6574                	.insn	2, 0x6574
  4021e6:	7500                	.insn	2, 0x7500
  4021e8:	65676173          	csrrsi	sp,hviprio1h,14
  4021ec:	203a                	.insn	2, 0x203a
  4021ee:	6166                	.insn	2, 0x6166
  4021f0:	3374                	.insn	2, 0x3374
  4021f2:	5f32                	.insn	2, 0x5f32
  4021f4:	6f74                	.insn	2, 0x6f74
  4021f6:	6375                	.insn	2, 0x6375
  4021f8:	2068                	.insn	2, 0x2068
  4021fa:	663c                	.insn	2, 0x663c
  4021fc:	6c69                	.insn	2, 0x6c69
  4021fe:	3e65                	.insn	2, 0x3e65
  402200:	000a                	.insn	2, 0x000a
  402202:	666c6573          	csrrsi	a0,0x666,24
  402206:	745f 7365 0074      	.insn	6, 0x00747365745f
  40220c:	6548                	.insn	2, 0x6548
  40220e:	6c6c                	.insn	2, 0x6c6c
  402210:	6f77206f          	j	475106 <__user_stack_top+0x51ab6>
  402214:	6c72                	.insn	2, 0x6c72
  402216:	2064                	.insn	2, 0x2064
  402218:	7266                	.insn	2, 0x7266
  40221a:	73206d6f          	jal	s10,40894c <__user_stack_start+0x52fc>
  40221e:	6568                	.insn	2, 0x6568
  402220:	6c6c                	.insn	2, 0x6c6c
  402222:	0a21                	.insn	2, 0x0a21
  402224:	5500                	.insn	2, 0x5500
  402226:	20524553          	.insn	4, 0x20524553
  40222a:	5542                	.insn	2, 0x5542
  40222c:	3a46                	.insn	2, 0x3a46
  40222e:	0020                	.insn	2, 0x0020
  402230:	7270                	.insn	2, 0x7270
  402232:	6d69                	.insn	2, 0x6d69
  402234:	7365                	.insn	2, 0x7365
  402236:	7500                	.insn	2, 0x7500
  402238:	6b6e                	.insn	2, 0x6b6e
  40223a:	6f6e                	.insn	2, 0x6f6e
  40223c:	63206e77          	.insn	4, 0x63206e77
  402240:	616d6d6f          	jal	s10,4d8856 <__user_stack_top+0xb5206>
  402244:	646e                	.insn	2, 0x646e
  402246:	203a                	.insn	2, 0x203a
  402248:	7325                	.insn	2, 0x7325
  40224a:	000a                	.insn	2, 0x000a
  40224c:	6f74                	.insn	2, 0x6f74
  40224e:	6174                	.insn	2, 0x6174
  402250:	206c                	.insn	2, 0x206c
  402252:	7270                	.insn	2, 0x7270
  402254:	6d69                	.insn	2, 0x6d69
  402256:	7365                	.insn	2, 0x7365
  402258:	203a                	.insn	2, 0x203a
  40225a:	6425                	.insn	2, 0x6425
  40225c:	2820                	.insn	2, 0x2820
  40225e:	2e30                	.insn	2, 0x2e30
  402260:	252e                	.insn	2, 0x252e
  402262:	2964                	.insn	2, 0x2964
  402264:	000a                	.insn	2, 0x000a
  402266:	735f6173          	csrrsi	sp,mhpmevent21h,30
  40226a:	6174                	.insn	2, 0x6174
  40226c:	7472                	.insn	2, 0x7472
  40226e:	6600                	.insn	2, 0x6600
  402270:	7461                	.insn	2, 0x7461
  402272:	695f3233          	.insn	4, 0x695f3233
  402276:	666e                	.insn	2, 0x666e
  402278:	6320006f          	j	4028aa <__user_stack_bottom+0x25a>
  40227c:	3d6c                	.insn	2, 0x3d6c
  40227e:	7825                	.insn	2, 0x7825
  402280:	6c20                	.insn	2, 0x6c20
  402282:	6162                	.insn	2, 0x6162
  402284:	253d                	.insn	2, 0x253d
  402286:	2078                	.insn	2, 0x2078
  402288:	657a6973          	csrrsi	s2,hviprio2h,20
  40228c:	253d                	.insn	2, 0x253d
  40228e:	0a78                	.insn	2, 0x0a78
  402290:	6800                	.insn	2, 0x6800
  402292:	6c65                	.insn	2, 0x6c65
  402294:	6f6c                	.insn	2, 0x6f6c
  402296:	5300                	.insn	2, 0x5300
  402298:	70203157          	.insn	4, 0x70203157
  40229c:	6572                	.insn	2, 0x6572
  40229e:	64657373          	csrrci	t1,hviprio1,10
  4022a2:	000a                	.insn	2, 0x000a
  4022a4:	616d                	.insn	2, 0x616d
  4022a6:	7274                	.insn	2, 0x7274
  4022a8:	7869                	.insn	2, 0x7869
  4022aa:	7320                	.insn	2, 0x7320
  4022ac:	7a69                	.insn	2, 0x7a69
  4022ae:	2065                	.insn	2, 0x2065
  4022b0:	203e                	.insn	2, 0x203e
  4022b2:	0a34                	.insn	2, 0x0a34
  4022b4:	6300                	.insn	2, 0x6300
  4022b6:	616d6d6f          	jal	s10,4d88cc <__user_stack_top+0xb527c>
  4022ba:	646e                	.insn	2, 0x646e
  4022bc:	000a3a73          	csrrc	s4,0x0,s4
  4022c0:	696d                	.insn	2, 0x696d
  4022c2:	72775f63          	bge	a4,t2,402a00 <__user_stack_bottom+0x3b0>
  4022c6:	7469                	.insn	2, 0x7469
  4022c8:	0065                	.insn	2, 0x0065
  4022ca:	4146                	.insn	2, 0x4146
  4022cc:	3354                	.insn	2, 0x3354
  4022ce:	2032                	.insn	2, 0x2032
  4022d0:	6f6d                	.insn	2, 0x6f6d
  4022d2:	6e75                	.insn	2, 0x6e75
  4022d4:	2074                	.insn	2, 0x2074
  4022d6:	6166                	.insn	2, 0x6166
  4022d8:	6c69                	.insn	2, 0x6c69
  4022da:	6465                	.insn	2, 0x6465
  4022dc:	000a                	.insn	2, 0x000a
  4022de:	61657263          	bgeu	a0,s6,4028e2 <__user_stack_bottom+0x292>
  4022e2:	6574                	.insn	2, 0x6574
  4022e4:	3a64                	.insn	2, 0x3a64
  4022e6:	2520                	.insn	2, 0x2520
  4022e8:	64000a73          	.insn	4, 0x64000a73
  4022ec:	7461                	.insn	2, 0x7461
  4022ee:	5f61                	.insn	2, 0x5f61
  4022f0:	6562                	.insn	2, 0x6562
  4022f2:	3d6e6967          	.insn	4, 0x3d6e6967
  4022f6:	7825                	.insn	2, 0x7825
  4022f8:	000a                	.insn	2, 0x000a
  4022fa:	7375                	.insn	2, 0x7375
  4022fc:	6761                	.insn	2, 0x6761
  4022fe:	3a65                	.insn	2, 0x3a65
  402300:	6d20                	.insn	2, 0x6d20
  402302:	6369                	.insn	2, 0x6369
  402304:	725f 6165 2064      	.insn	6, 0x20646165725f
  40230a:	633c                	.insn	2, 0x633c
  40230c:	746e756f          	jal	a0,4e9a52 <__user_stack_top+0xc6402>
  402310:	0a3e                	.insn	2, 0x0a3e
  402312:	0a00                	.insn	2, 0x0a00
  402314:	6800                	.insn	2, 0x6800
  402316:	6c65                	.insn	2, 0x6c65
  402318:	0070                	.insn	2, 0x0070
  40231a:	696d                	.insn	2, 0x696d
  40231c:	65725f63          	bge	tp,s7,40297a <__user_stack_bottom+0x32a>
  402320:	6461                	.insn	2, 0x6461
  402322:	4d00                	.insn	2, 0x4d00
  402324:	4349                	.insn	2, 0x4349
  402326:	542e                	.insn	2, 0x542e
  402328:	5458                	.insn	2, 0x5458
  40232a:	6820                	.insn	2, 0x6820
  40232c:	7361                	.insn	2, 0x7361
  40232e:	6e20                	.insn	2, 0x6e20
  402330:	6c63206f          	j	4349f6 <__user_stack_top+0x113a6>
  402334:	7375                	.insn	2, 0x7375
  402336:	6574                	.insn	2, 0x6574
  402338:	0a72                	.insn	2, 0x0a72
	...

0040233b <$d.2>:
  40233b:	494d                	.insn	2, 0x494d
  40233d:	58542e43          	.insn	4, 0x58542e43
  402341:	0054                	.insn	2, 0x0054
  402343:	6f72                	.insn	2, 0x6f72
  402345:	635f746f          	jal	s0,4fa179 <__user_stack_top+0xd6b29>
  402349:	756c                	.insn	2, 0x756c
  40234b:	72657473          	csrrci	s0,mhpmevent6h,10
  40234f:	253d                	.insn	2, 0x253d
  402351:	0a78                	.insn	2, 0x0a78
  402353:	7100                	.insn	2, 0x7100
	...

00402356 <$d.1>:
  402356:	6c656873          	csrrsi	a6,0x6c6,10
  40235a:	206c                	.insn	2, 0x206c
  40235c:	72617473          	csrrci	s0,mhpmevent6h,2
  402360:	2e74                	.insn	2, 0x2e74
  402362:	000a                	.insn	2, 0x000a
  402364:	7564                	.insn	2, 0x7564
  402366:	706d                	.insn	2, 0x706d
  402368:	7500                	.insn	2, 0x7500
  40236a:	65676173          	csrrsi	sp,hviprio1h,14
  40236e:	203a                	.insn	2, 0x203a
  402370:	696d                	.insn	2, 0x696d
  402372:	72775f63          	bge	a4,t2,402ab0 <__user_stack_bottom+0x460>
  402376:	7469                	.insn	2, 0x7469
  402378:	2065                	.insn	2, 0x2065
  40237a:	633c                	.insn	2, 0x633c
  40237c:	746e756f          	jal	a0,4e9ac2 <__user_stack_top+0xc6472>
  402380:	0a3e                	.insn	2, 0x0a3e
  402382:	7300                	.insn	2, 0x7300
  402384:	6370                	.insn	2, 0x6370
  402386:	253d                	.insn	2, 0x253d
  402388:	0a78                	.insn	2, 0x0a78
  40238a:	6600                	.insn	2, 0x6600
  40238c:	7461                	.insn	2, 0x7461
  40238e:	745f3233          	.insn	4, 0x745f3233
  402392:	6863756f          	jal	a0,439a18 <__user_stack_top+0x163c8>
  402396:	2500                	.insn	2, 0x2500
  402398:	2064                	.insn	2, 0x2064
  40239a:	6600                	.insn	2, 0x6600
  40239c:	7461                	.insn	2, 0x7461
  40239e:	625f 6765 6e69      	.insn	6, 0x6e696765625f
  4023a4:	253d                	.insn	2, 0x253d
  4023a6:	0a78                	.insn	2, 0x0a78
  4023a8:	3000                	.insn	2, 0x3000
  4023aa:	3231                	.insn	2, 0x3231
  4023ac:	36353433          	.insn	4, 0x36353433
  4023b0:	61393837          	lui	a6,0x61393
  4023b4:	6362                	.insn	2, 0x6362
  4023b6:	6564                	.insn	2, 0x6564
  4023b8:	0066                	.insn	2, 0x0066
  4023ba:	7375                	.insn	2, 0x7375
  4023bc:	6761                	.insn	2, 0x6761
  4023be:	3a65                	.insn	2, 0x3a65
  4023c0:	7320                	.insn	2, 0x7320
  4023c2:	5f64                	.insn	2, 0x5f64
  4023c4:	6572                	.insn	2, 0x6572
  4023c6:	6461                	.insn	2, 0x6461
  4023c8:	3c20                	.insn	2, 0x3c20
  4023ca:	74636573          	csrrsi	a0,0x746,6
  4023ce:	0a3e726f          	jal	tp,4e9c70 <__user_stack_top+0xc6620>
  4023d2:	6d00                	.insn	2, 0x6d00
  4023d4:	7861                	.insn	2, 0x7861
  4023d6:	7420                	.insn	2, 0x7420
  4023d8:	6c206f6f          	jal	t5,408a9a <__user_stack_start+0x544a>
  4023dc:	7261                	.insn	2, 0x7261
  4023de:	28206567          	.insn	4, 0x28206567
  4023e2:	3d3c                	.insn	2, 0x3d3c
  4023e4:	3031                	.insn	2, 0x3031
  4023e6:	3030                	.insn	2, 0x3030
  4023e8:	3030                	.insn	2, 0x3030
  4023ea:	0a29                	.insn	2, 0x0a29
  4023ec:	7100                	.insn	2, 0x7100
  4023ee:	6975                	.insn	2, 0x6975
  4023f0:	0074                	.insn	2, 0x0074

004023f2 <$d.1>:
  4023f2:	6966                	.insn	2, 0x6966
  4023f4:	656c                	.insn	2, 0x656c
  4023f6:	6e20                	.insn	2, 0x6e20
  4023f8:	6620746f          	jal	s0,409a5a <__user_stack_start+0x640a>
  4023fc:	646e756f          	jal	a0,4e9a42 <__user_stack_top+0xc63f2>
  402400:	000a                	.insn	2, 0x000a
  402402:	7375                	.insn	2, 0x7375
  402404:	6761                	.insn	2, 0x6761
  402406:	3a65                	.insn	2, 0x3a65
  402408:	7320                	.insn	2, 0x7320
  40240a:	5f64                	.insn	2, 0x5f64
  40240c:	74697277          	.insn	4, 0x74697277
  402410:	2065                	.insn	2, 0x2065
  402412:	733c                	.insn	2, 0x733c
  402414:	6365                	.insn	2, 0x6365
  402416:	6f74                	.insn	2, 0x6f74
  402418:	3e72                	.insn	2, 0x3e72
  40241a:	000a                	.insn	2, 0x000a
  40241c:	6170                	.insn	2, 0x6170
  40241e:	7472                	.insn	2, 0x7472
  402420:	6c5f 6162 253d      	.insn	6, 0x253d61626c5f
  402426:	0a78                	.insn	2, 0x0a78
  402428:	6500                	.insn	2, 0x6500
  40242a:	6978                	.insn	2, 0x6978
  40242c:	0074                	.insn	2, 0x0074

セクション .debug_loc の逆アセンブル:

00000000 <$d.2>:
       0:	0048                	.insn	2, 0x0048
       2:	0000                	.insn	2, 0x0000
       4:	0238                	.insn	2, 0x0238
       6:	0000                	.insn	2, 0x0000
       8:	0002                	.insn	2, 0x0002
       a:	9f30                	.insn	2, 0x9f30
       c:	0238                	.insn	2, 0x0238
       e:	0000                	.insn	2, 0x0000
      10:	0990                	.insn	2, 0x0990
      12:	0000                	.insn	2, 0x0000
      14:	0001                	.insn	2, 0x0001
      16:	006a                	.insn	2, 0x006a
      18:	0000                	.insn	2, 0x0000
      1a:	0000                	.insn	2, 0x0000
      1c:	0000                	.insn	2, 0x0000
      1e:	3800                	.insn	2, 0x3800
      20:	0002                	.insn	2, 0x0002
      22:	4800                	.insn	2, 0x4800
      24:	0002                	.insn	2, 0x0002
      26:	0100                	.insn	2, 0x0100
      28:	6400                	.insn	2, 0x6400
      2a:	0434                	.insn	2, 0x0434
      2c:	0000                	.insn	2, 0x0000
      2e:	0438                	.insn	2, 0x0438
      30:	0000                	.insn	2, 0x0000
      32:	0001                	.insn	2, 0x0001
      34:	00043863          	.insn	4, 0x00043863
      38:	cc00                	.insn	2, 0xcc00
      3a:	0004                	.insn	2, 0x0004
      3c:	0100                	.insn	2, 0x0100
      3e:	6400                	.insn	2, 0x6400
      40:	05fc                	.insn	2, 0x05fc
      42:	0000                	.insn	2, 0x0000
      44:	064c                	.insn	2, 0x064c
      46:	0000                	.insn	2, 0x0000
      48:	0001                	.insn	2, 0x0001
      4a:	7064                	.insn	2, 0x7064
      4c:	0006                	.insn	2, 0x0006
      4e:	7800                	.insn	2, 0x7800
      50:	0006                	.insn	2, 0x0006
      52:	0100                	.insn	2, 0x0100
      54:	6400                	.insn	2, 0x6400
      56:	0684                	.insn	2, 0x0684
      58:	0000                	.insn	2, 0x0000
      5a:	0694                	.insn	2, 0x0694
      5c:	0000                	.insn	2, 0x0000
      5e:	0001                	.insn	2, 0x0001
      60:	ec64                	.insn	2, 0xec64
      62:	0006                	.insn	2, 0x0006
      64:	5800                	.insn	2, 0x5800
      66:	01000007          	.insn	4, 0x01000007
      6a:	6400                	.insn	2, 0x6400
      6c:	0764                	.insn	2, 0x0764
      6e:	0000                	.insn	2, 0x0000
      70:	0798                	.insn	2, 0x0798
      72:	0000                	.insn	2, 0x0000
      74:	0001                	.insn	2, 0x0001
      76:	a864                	.insn	2, 0xa864
      78:	b0000007          	.insn	4, 0xb0000007
      7c:	01000007          	.insn	4, 0x01000007
      80:	6400                	.insn	2, 0x6400
	...
      8a:	030c                	.insn	2, 0x030c
      8c:	0000                	.insn	2, 0x0000
      8e:	0310                	.insn	2, 0x0310
      90:	0000                	.insn	2, 0x0000
      92:	00110003          	lb	zero,1(sp)
      96:	209f 0003 2c00      	.insn	6, 0x2c000003209f
      9c:	0004                	.insn	2, 0x0004
      9e:	0100                	.insn	2, 0x0100
      a0:	6300                	.insn	2, 0x6300
	...
      aa:	0320                	.insn	2, 0x0320
      ac:	0000                	.insn	2, 0x0000
      ae:	0328                	.insn	2, 0x0328
      b0:	0000                	.insn	2, 0x0000
      b2:	0001                	.insn	2, 0x0001
      b4:	7c5a                	.insn	2, 0x7c5a
      b6:	cc000003          	lb	zero,-832(zero) # fffffcc0 <USER_MAX+0xffaffcc0>
      ba:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
      be:	5a00                	.insn	2, 0x5a00
      c0:	03e8                	.insn	2, 0x03e8
      c2:	0000                	.insn	2, 0x0000
      c4:	03ec                	.insn	2, 0x03ec
      c6:	0000                	.insn	2, 0x0000
      c8:	0001                	.insn	2, 0x0001
      ca:	005a                	.insn	2, 0x005a
      cc:	0000                	.insn	2, 0x0000
      ce:	0000                	.insn	2, 0x0000
      d0:	0000                	.insn	2, 0x0000
      d2:	2000                	.insn	2, 0x2000
      d4:	28000003          	lb	zero,640(zero) # 280 <$d.10+0x84>
      d8:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
      dc:	6a00                	.insn	2, 0x6a00
      de:	0374                	.insn	2, 0x0374
      e0:	0000                	.insn	2, 0x0000
      e2:	0404                	.insn	2, 0x0404
      e4:	0000                	.insn	2, 0x0000
      e6:	0001                	.insn	2, 0x0001
      e8:	006a                	.insn	2, 0x006a
      ea:	0000                	.insn	2, 0x0000
      ec:	0000                	.insn	2, 0x0000
      ee:	0000                	.insn	2, 0x0000
      f0:	6000                	.insn	2, 0x6000
      f2:	68000003          	lb	zero,1664(zero) # 680 <$d.3+0x11e>
      f6:	06000003          	lb	zero,96(zero) # 60 <$d.2+0x60>
      fa:	7a00                	.insn	2, 0x7a00
      fc:	1000                	.insn	2, 0x1000
      fe:	1a01                	.insn	2, 0x1a01
     100:	009f 0000 0000      	.insn	6, 0x009f
     106:	0000                	.insn	2, 0x0000
     108:	0c00                	.insn	2, 0x0c00
     10a:	0004                	.insn	2, 0x0004
     10c:	2c00                	.insn	2, 0x2c00
     10e:	0004                	.insn	2, 0x0004
     110:	0100                	.insn	2, 0x0100
     112:	5a00                	.insn	2, 0x5a00
     114:	0434                	.insn	2, 0x0434
     116:	0000                	.insn	2, 0x0000
     118:	046c                	.insn	2, 0x046c
     11a:	0000                	.insn	2, 0x0000
     11c:	0001                	.insn	2, 0x0001
     11e:	00046c5b          	.insn	4, 0x00046c5b
     122:	7400                	.insn	2, 0x7400
     124:	0004                	.insn	2, 0x0004
     126:	0300                	.insn	2, 0x0300
     128:	7b00                	.insn	2, 0x7b00
     12a:	9f01                	.insn	2, 0x9f01
	...
     134:	05fc                	.insn	2, 0x05fc
     136:	0000                	.insn	2, 0x0000
     138:	064c                	.insn	2, 0x064c
     13a:	0000                	.insn	2, 0x0000
     13c:	0006                	.insn	2, 0x0006
     13e:	8010                	.insn	2, 0x8010
     140:	8080                	.insn	2, 0x8080
     142:	9f01                	.insn	2, 0x9f01
     144:	0670                	.insn	2, 0x0670
     146:	0000                	.insn	2, 0x0000
     148:	068c                	.insn	2, 0x068c
     14a:	0000                	.insn	2, 0x0000
     14c:	0006                	.insn	2, 0x0006
     14e:	8010                	.insn	2, 0x8010
     150:	8080                	.insn	2, 0x8080
     152:	9f01                	.insn	2, 0x9f01
     154:	06f4                	.insn	2, 0x06f4
     156:	0000                	.insn	2, 0x0000
     158:	074c                	.insn	2, 0x074c
     15a:	0000                	.insn	2, 0x0000
     15c:	0006                	.insn	2, 0x0006
     15e:	8010                	.insn	2, 0x8010
     160:	8080                	.insn	2, 0x8080
     162:	9f01                	.insn	2, 0x9f01
     164:	074c                	.insn	2, 0x074c
     166:	0000                	.insn	2, 0x0000
     168:	0760                	.insn	2, 0x0760
     16a:	0000                	.insn	2, 0x0000
     16c:	0001                	.insn	2, 0x0001
     16e:	645a                	.insn	2, 0x645a
     170:	b8000007          	.insn	4, 0xb8000007
     174:	01000007          	.insn	4, 0x01000007
     178:	5a00                	.insn	2, 0x5a00
     17a:	0814                	.insn	2, 0x0814
     17c:	0000                	.insn	2, 0x0000
     17e:	0874                	.insn	2, 0x0874
     180:	0000                	.insn	2, 0x0000
     182:	0001                	.insn	2, 0x0001
     184:	005a                	.insn	2, 0x005a
     186:	0000                	.insn	2, 0x0000
     188:	0000                	.insn	2, 0x0000
     18a:	0000                	.insn	2, 0x0000
     18c:	fc00                	.insn	2, 0xfc00
     18e:	0005                	.insn	2, 0x0005
     190:	4c00                	.insn	2, 0x4c00
     192:	0006                	.insn	2, 0x0006
     194:	0400                	.insn	2, 0x0400
     196:	1000                	.insn	2, 0x1000
     198:	0280                	.insn	2, 0x0280
     19a:	789f 0006 8000      	.insn	6, 0x80000006789f
     1a0:	0006                	.insn	2, 0x0006
     1a2:	0100                	.insn	2, 0x0100
     1a4:	5b00                	.insn	2, 0x5b00
     1a6:	0684                	.insn	2, 0x0684
     1a8:	0000                	.insn	2, 0x0000
     1aa:	068c                	.insn	2, 0x068c
     1ac:	0000                	.insn	2, 0x0000
     1ae:	0004                	.insn	2, 0x0004
     1b0:	8010                	.insn	2, 0x8010
     1b2:	9f02                	.insn	2, 0x9f02
     1b4:	06f4                	.insn	2, 0x06f4
     1b6:	0000                	.insn	2, 0x0000
     1b8:	0758                	.insn	2, 0x0758
     1ba:	0000                	.insn	2, 0x0000
     1bc:	0004                	.insn	2, 0x0004
     1be:	8010                	.insn	2, 0x8010
     1c0:	9f02                	.insn	2, 0x9f02
     1c2:	0758                	.insn	2, 0x0758
     1c4:	0000                	.insn	2, 0x0000
     1c6:	0760                	.insn	2, 0x0760
     1c8:	0000                	.insn	2, 0x0000
     1ca:	0001                	.insn	2, 0x0001
     1cc:	0007645b          	.insn	4, 0x0007645b
     1d0:	b800                	.insn	2, 0xb800
     1d2:	04000007          	.insn	4, 0x04000007
     1d6:	1000                	.insn	2, 0x1000
     1d8:	0280                	.insn	2, 0x0280
     1da:	149f 0008 6c00      	.insn	6, 0x6c000008149f
     1e0:	0008                	.insn	2, 0x0008
     1e2:	0400                	.insn	2, 0x0400
     1e4:	1000                	.insn	2, 0x1000
     1e6:	0280                	.insn	2, 0x0280
     1e8:	6c9f 0008 7400      	.insn	6, 0x740000086c9f
     1ee:	0008                	.insn	2, 0x0008
     1f0:	0100                	.insn	2, 0x0100
     1f2:	5b00                	.insn	2, 0x5b00
	...
     1fc:	0608                	.insn	2, 0x0608
     1fe:	0000                	.insn	2, 0x0000
     200:	064c                	.insn	2, 0x064c
     202:	0000                	.insn	2, 0x0000
     204:	0002                	.insn	2, 0x0002
     206:	9f30                	.insn	2, 0x9f30
     208:	0684                	.insn	2, 0x0684
     20a:	0000                	.insn	2, 0x0000
     20c:	068c                	.insn	2, 0x068c
     20e:	0000                	.insn	2, 0x0000
     210:	0002                	.insn	2, 0x0002
     212:	9f30                	.insn	2, 0x9f30
     214:	06f4                	.insn	2, 0x06f4
     216:	0000                	.insn	2, 0x0000
     218:	0700                	.insn	2, 0x0700
     21a:	0000                	.insn	2, 0x0000
     21c:	0002                	.insn	2, 0x0002
     21e:	9f30                	.insn	2, 0x9f30
     220:	0700                	.insn	2, 0x0700
     222:	0000                	.insn	2, 0x0000
     224:	0710                	.insn	2, 0x0710
     226:	0000                	.insn	2, 0x0000
     228:	0001                	.insn	2, 0x0001
     22a:	145a                	.insn	2, 0x145a
     22c:	4c000007          	.insn	4, 0x4c000007
     230:	01000007          	.insn	4, 0x01000007
     234:	5a00                	.insn	2, 0x5a00
	...
     23e:	0608                	.insn	2, 0x0608
     240:	0000                	.insn	2, 0x0000
     242:	060c                	.insn	2, 0x060c
     244:	0000                	.insn	2, 0x0000
     246:	0001                	.insn	2, 0x0001
     248:	185d                	.insn	2, 0x185d
     24a:	0006                	.insn	2, 0x0006
     24c:	1c00                	.insn	2, 0x1c00
     24e:	0006                	.insn	2, 0x0006
     250:	0300                	.insn	2, 0x0300
     252:	7d00                	.insn	2, 0x7d00
     254:	061c9f7f 06400000 	.insn	12, 0x0003000006400000061c9f7f
     25c:	00030000 
     260:	7e7d                	.insn	2, 0x7e7d
     262:	449f 0006 4c00      	.insn	6, 0x4c000006449f
     268:	0006                	.insn	2, 0x0006
     26a:	0100                	.insn	2, 0x0100
     26c:	5d00                	.insn	2, 0x5d00
     26e:	0688                	.insn	2, 0x0688
     270:	0000                	.insn	2, 0x0000
     272:	068c                	.insn	2, 0x068c
     274:	0000                	.insn	2, 0x0000
     276:	0001                	.insn	2, 0x0001
     278:	005d                	.insn	2, 0x005d
     27a:	18000007          	.insn	4, 0x18000007
     27e:	01000007          	.insn	4, 0x01000007
     282:	5d00                	.insn	2, 0x5d00
     284:	071c                	.insn	2, 0x071c
     286:	0000                	.insn	2, 0x0000
     288:	074c                	.insn	2, 0x074c
     28a:	0000                	.insn	2, 0x0000
     28c:	0001                	.insn	2, 0x0001
     28e:	005d                	.insn	2, 0x005d
     290:	0000                	.insn	2, 0x0000
     292:	0000                	.insn	2, 0x0000
     294:	0000                	.insn	2, 0x0000
     296:	4c00                	.insn	2, 0x4c00
     298:	0006                	.insn	2, 0x0006
     29a:	6000                	.insn	2, 0x6000
     29c:	0006                	.insn	2, 0x0006
     29e:	0400                	.insn	2, 0x0400
     2a0:	1000                	.insn	2, 0x1000
     2a2:	07e8                	.insn	2, 0x07e8
     2a4:	609f 0006 7000      	.insn	6, 0x70000006609f
     2aa:	0006                	.insn	2, 0x0006
     2ac:	0100                	.insn	2, 0x0100
     2ae:	5b00                	.insn	2, 0x5b00
     2b0:	06bc                	.insn	2, 0x06bc
     2b2:	0000                	.insn	2, 0x0000
     2b4:	06c8                	.insn	2, 0x06c8
     2b6:	0000                	.insn	2, 0x0000
     2b8:	0001                	.insn	2, 0x0001
     2ba:	0000005b          	.insn	4, 0x005b
     2be:	0000                	.insn	2, 0x0000
     2c0:	0000                	.insn	2, 0x0000
     2c2:	9400                	.insn	2, 0x9400
     2c4:	0006                	.insn	2, 0x0006
     2c6:	a800                	.insn	2, 0xa800
     2c8:	0006                	.insn	2, 0x0006
     2ca:	0200                	.insn	2, 0x0200
     2cc:	3400                	.insn	2, 0x3400
     2ce:	a89f 0006 b800      	.insn	6, 0xb8000006a89f
     2d4:	0006                	.insn	2, 0x0006
     2d6:	0100                	.insn	2, 0x0100
     2d8:	5b00                	.insn	2, 0x5b00
     2da:	07dc                	.insn	2, 0x07dc
     2dc:	0000                	.insn	2, 0x0000
     2de:	07e8                	.insn	2, 0x07e8
     2e0:	0000                	.insn	2, 0x0000
     2e2:	0001                	.insn	2, 0x0001
     2e4:	0000005b          	.insn	4, 0x005b
     2e8:	0000                	.insn	2, 0x0000
     2ea:	0000                	.insn	2, 0x0000
     2ec:	e000                	.insn	2, 0xe000
     2ee:	0006                	.insn	2, 0x0006
     2f0:	e800                	.insn	2, 0xe800
     2f2:	0006                	.insn	2, 0x0006
     2f4:	0100                	.insn	2, 0x0100
     2f6:	5a00                	.insn	2, 0x5a00
	...
     300:	0700                	.insn	2, 0x0700
     302:	0000                	.insn	2, 0x0000
     304:	0708                	.insn	2, 0x0708
     306:	0000                	.insn	2, 0x0000
     308:	0001                	.insn	2, 0x0001
     30a:	1c5c                	.insn	2, 0x1c5c
     30c:	4c000007          	.insn	4, 0x4c000007
     310:	01000007          	.insn	4, 0x01000007
     314:	5c00                	.insn	2, 0x5c00
	...
     31e:	070c                	.insn	2, 0x070c
     320:	0000                	.insn	2, 0x0000
     322:	071c                	.insn	2, 0x071c
     324:	0000                	.insn	2, 0x0000
     326:	0001                	.insn	2, 0x0001
     328:	005e                	.insn	2, 0x005e
     32a:	0000                	.insn	2, 0x0000
     32c:	0000                	.insn	2, 0x0000
     32e:	0000                	.insn	2, 0x0000
     330:	6800                	.insn	2, 0x6800
     332:	b8000007          	.insn	4, 0xb8000007
     336:	02000007          	.insn	4, 0x02000007
     33a:	3000                	.insn	2, 0x3000
     33c:	149f 0008 2000      	.insn	6, 0x20000008149f
     342:	0008                	.insn	2, 0x0008
     344:	0200                	.insn	2, 0x0200
     346:	3000                	.insn	2, 0x3000
     348:	209f 0008 3000      	.insn	6, 0x30000008209f
     34e:	0008                	.insn	2, 0x0008
     350:	0100                	.insn	2, 0x0100
     352:	5b00                	.insn	2, 0x5b00
     354:	0834                	.insn	2, 0x0834
     356:	0000                	.insn	2, 0x0000
     358:	086c                	.insn	2, 0x086c
     35a:	0000                	.insn	2, 0x0000
     35c:	0001                	.insn	2, 0x0001
     35e:	0000005b          	.insn	4, 0x005b
     362:	0000                	.insn	2, 0x0000
     364:	0000                	.insn	2, 0x0000
     366:	6800                	.insn	2, 0x6800
     368:	6c000007          	.insn	4, 0x6c000007
     36c:	01000007          	.insn	4, 0x01000007
     370:	5d00                	.insn	2, 0x5d00
     372:	0770                	.insn	2, 0x0770
     374:	0000                	.insn	2, 0x0000
     376:	0774                	.insn	2, 0x0774
     378:	0000                	.insn	2, 0x0000
     37a:	7f7d0003          	lb	zero,2039(s10)
     37e:	749f 0007 9c00      	.insn	6, 0x9c000007749f
     384:	03000007          	.insn	4, 0x03000007
     388:	7d00                	.insn	2, 0x7d00
     38a:	9f7e                	.insn	2, 0x9f7e
     38c:	07a0                	.insn	2, 0x07a0
     38e:	0000                	.insn	2, 0x0000
     390:	07a8                	.insn	2, 0x07a8
     392:	0000                	.insn	2, 0x0000
     394:	0001                	.insn	2, 0x0001
     396:	a85d                	.insn	2, 0xa85d
     398:	ac000007          	.insn	4, 0xac000007
     39c:	03000007          	.insn	4, 0x03000007
     3a0:	7d00                	.insn	2, 0x7d00
     3a2:	9f7e                	.insn	2, 0x9f7e
     3a4:	07b0                	.insn	2, 0x07b0
     3a6:	0000                	.insn	2, 0x0000
     3a8:	07b8                	.insn	2, 0x07b8
     3aa:	0000                	.insn	2, 0x0000
     3ac:	0001                	.insn	2, 0x0001
     3ae:	205d                	.insn	2, 0x205d
     3b0:	0008                	.insn	2, 0x0008
     3b2:	3800                	.insn	2, 0x3800
     3b4:	0008                	.insn	2, 0x0008
     3b6:	0100                	.insn	2, 0x0100
     3b8:	5d00                	.insn	2, 0x5d00
     3ba:	083c                	.insn	2, 0x083c
     3bc:	0000                	.insn	2, 0x0000
     3be:	086c                	.insn	2, 0x086c
     3c0:	0000                	.insn	2, 0x0000
     3c2:	0001                	.insn	2, 0x0001
     3c4:	005d                	.insn	2, 0x005d
     3c6:	0000                	.insn	2, 0x0000
     3c8:	0000                	.insn	2, 0x0000
     3ca:	0000                	.insn	2, 0x0000
     3cc:	cc00                	.insn	2, 0xcc00
     3ce:	d4000007          	.insn	4, 0xd4000007
     3d2:	01000007          	.insn	4, 0x01000007
     3d6:	5a00                	.insn	2, 0x5a00
	...
     3e0:	0800                	.insn	2, 0x0800
     3e2:	0000                	.insn	2, 0x0000
     3e4:	0808                	.insn	2, 0x0808
     3e6:	0000                	.insn	2, 0x0000
     3e8:	0001                	.insn	2, 0x0001
     3ea:	005a                	.insn	2, 0x005a
     3ec:	0000                	.insn	2, 0x0000
     3ee:	0000                	.insn	2, 0x0000
     3f0:	0000                	.insn	2, 0x0000
     3f2:	2000                	.insn	2, 0x2000
     3f4:	0008                	.insn	2, 0x0008
     3f6:	2800                	.insn	2, 0x2800
     3f8:	0008                	.insn	2, 0x0008
     3fa:	0100                	.insn	2, 0x0100
     3fc:	5c00                	.insn	2, 0x5c00
     3fe:	083c                	.insn	2, 0x083c
     400:	0000                	.insn	2, 0x0000
     402:	086c                	.insn	2, 0x086c
     404:	0000                	.insn	2, 0x0000
     406:	0001                	.insn	2, 0x0001
     408:	005c                	.insn	2, 0x005c
     40a:	0000                	.insn	2, 0x0000
     40c:	0000                	.insn	2, 0x0000
     40e:	0000                	.insn	2, 0x0000
     410:	2c00                	.insn	2, 0x2c00
     412:	0008                	.insn	2, 0x0008
     414:	3c00                	.insn	2, 0x3c00
     416:	0008                	.insn	2, 0x0008
     418:	0100                	.insn	2, 0x0100
     41a:	5e00                	.insn	2, 0x5e00
	...
     424:	0890                	.insn	2, 0x0890
     426:	0000                	.insn	2, 0x0000
     428:	08ac                	.insn	2, 0x08ac
     42a:	0000                	.insn	2, 0x0000
     42c:	0001                	.insn	2, 0x0001
     42e:	0000005b          	.insn	4, 0x005b
     432:	0000                	.insn	2, 0x0000
     434:	0000                	.insn	2, 0x0000
     436:	9000                	.insn	2, 0x9000
     438:	0009                	.insn	2, 0x0009
     43a:	a000                	.insn	2, 0xa000
     43c:	0009                	.insn	2, 0x0009
     43e:	0100                	.insn	2, 0x0100
     440:	5a00                	.insn	2, 0x5a00
     442:	09a0                	.insn	2, 0x09a0
     444:	0000                	.insn	2, 0x0000
     446:	09a4                	.insn	2, 0x09a4
     448:	0000                	.insn	2, 0x0000
     44a:	7f7c0003          	lb	zero,2039(s8)
     44e:	a49f 0009 c800      	.insn	6, 0xc8000009a49f
     454:	0009                	.insn	2, 0x0009
     456:	0300                	.insn	2, 0x0300
     458:	7c00                	.insn	2, 0x7c00
     45a:	9f7e                	.insn	2, 0x9f7e
     45c:	09cc                	.insn	2, 0x09cc
     45e:	0000                	.insn	2, 0x0000
     460:	09d4                	.insn	2, 0x09d4
     462:	0000                	.insn	2, 0x0000
     464:	0001                	.insn	2, 0x0001
     466:	d45c                	.insn	2, 0xd45c
     468:	0009                	.insn	2, 0x0009
     46a:	d800                	.insn	2, 0xd800
     46c:	0009                	.insn	2, 0x0009
     46e:	0300                	.insn	2, 0x0300
     470:	7c00                	.insn	2, 0x7c00
     472:	9f7e                	.insn	2, 0x9f7e
     474:	09d8                	.insn	2, 0x09d8
     476:	0000                	.insn	2, 0x0000
     478:	09e4                	.insn	2, 0x09e4
     47a:	0000                	.insn	2, 0x0000
     47c:	0001                	.insn	2, 0x0001
     47e:	e45c                	.insn	2, 0xe45c
     480:	0009                	.insn	2, 0x0009
     482:	e800                	.insn	2, 0xe800
     484:	0009                	.insn	2, 0x0009
     486:	0300                	.insn	2, 0x0300
     488:	7c00                	.insn	2, 0x7c00
     48a:	9f7e                	.insn	2, 0x9f7e
     48c:	0a04                	.insn	2, 0x0a04
     48e:	0000                	.insn	2, 0x0000
     490:	0a1c                	.insn	2, 0x0a1c
     492:	0000                	.insn	2, 0x0000
     494:	0001                	.insn	2, 0x0001
     496:	205c                	.insn	2, 0x205c
     498:	000a                	.insn	2, 0x000a
     49a:	5000                	.insn	2, 0x5000
     49c:	000a                	.insn	2, 0x000a
     49e:	0100                	.insn	2, 0x0100
     4a0:	5c00                	.insn	2, 0x5c00
	...
     4aa:	0990                	.insn	2, 0x0990
     4ac:	0000                	.insn	2, 0x0000
     4ae:	0a04                	.insn	2, 0x0a04
     4b0:	0000                	.insn	2, 0x0000
     4b2:	0002                	.insn	2, 0x0002
     4b4:	9f30                	.insn	2, 0x9f30
     4b6:	0a04                	.insn	2, 0x0a04
     4b8:	0000                	.insn	2, 0x0000
     4ba:	0a14                	.insn	2, 0x0a14
     4bc:	0000                	.insn	2, 0x0000
     4be:	0001                	.insn	2, 0x0001
     4c0:	185d                	.insn	2, 0x185d
     4c2:	000a                	.insn	2, 0x000a
     4c4:	5c00                	.insn	2, 0x5c00
     4c6:	000a                	.insn	2, 0x000a
     4c8:	0100                	.insn	2, 0x0100
     4ca:	5d00                	.insn	2, 0x5d00
	...
     4d4:	0a04                	.insn	2, 0x0a04
     4d6:	0000                	.insn	2, 0x0000
     4d8:	0a0c                	.insn	2, 0x0a0c
     4da:	0000                	.insn	2, 0x0000
     4dc:	0001                	.insn	2, 0x0001
     4de:	205a                	.insn	2, 0x205a
     4e0:	000a                	.insn	2, 0x000a
     4e2:	5000                	.insn	2, 0x5000
     4e4:	000a                	.insn	2, 0x000a
     4e6:	0100                	.insn	2, 0x0100
     4e8:	5a00                	.insn	2, 0x5a00
	...
     4f2:	0a10                	.insn	2, 0x0a10
     4f4:	0000                	.insn	2, 0x0000
     4f6:	0a20                	.insn	2, 0x0a20
     4f8:	0000                	.insn	2, 0x0000
     4fa:	0001                	.insn	2, 0x0001
     4fc:	0061                	.insn	2, 0x0061
     4fe:	0000                	.insn	2, 0x0000
     500:	0000                	.insn	2, 0x0000
     502:	0000                	.insn	2, 0x0000
     504:	5c00                	.insn	2, 0x5c00
     506:	000a                	.insn	2, 0x000a
     508:	7c00                	.insn	2, 0x7c00
     50a:	000a                	.insn	2, 0x000a
     50c:	0100                	.insn	2, 0x0100
     50e:	5a00                	.insn	2, 0x5a00
     510:	0a7c                	.insn	2, 0x0a7c
     512:	0000                	.insn	2, 0x0000
     514:	0b00                	.insn	2, 0x0b00
     516:	0000                	.insn	2, 0x0000
     518:	0001                	.insn	2, 0x0001
     51a:	0058                	.insn	2, 0x0058
     51c:	0000                	.insn	2, 0x0000
     51e:	0000                	.insn	2, 0x0000
     520:	0000                	.insn	2, 0x0000
     522:	7c00                	.insn	2, 0x7c00
     524:	000a                	.insn	2, 0x000a
     526:	9000                	.insn	2, 0x9000
     528:	000a                	.insn	2, 0x000a
     52a:	0200                	.insn	2, 0x0200
     52c:	3200                	.insn	2, 0x3200
     52e:	909f 000a d400      	.insn	6, 0xd400000a909f
     534:	000a                	.insn	2, 0x000a
     536:	0100                	.insn	2, 0x0100
     538:	6200                	.insn	2, 0x6200
	...
     542:	0a7c                	.insn	2, 0x0a7c
     544:	0000                	.insn	2, 0x0000
     546:	0a90                	.insn	2, 0x0a90
     548:	0000                	.insn	2, 0x0000
     54a:	00110003          	lb	zero,1(sp)
     54e:	909f 000a e800      	.insn	6, 0xe800000a909f
     554:	000a                	.insn	2, 0x000a
     556:	0100                	.insn	2, 0x0100
     558:	5900                	.insn	2, 0x5900
	...

00000562 <$d.3>:
     562:	ffff                	.insn	2, 0xffff
     564:	ffff                	.insn	2, 0xffff
     566:	0b34                	.insn	2, 0x0b34
     568:	0040                	.insn	2, 0x0040
     56a:	0000                	.insn	2, 0x0000
     56c:	0000                	.insn	2, 0x0000
     56e:	0014                	.insn	2, 0x0014
     570:	0000                	.insn	2, 0x0000
     572:	00110003          	lb	zero,1(sp)
     576:	009f 0000 0000      	.insn	6, 0x009f
     57c:	0000                	.insn	2, 0x0000
     57e:	ff00                	.insn	2, 0xff00
     580:	ffff                	.insn	2, 0xffff
     582:	400b34ff 00001800 	.insn	16, 0x5a0001000000280000001800400b34ff
     58a:	00002800 5a000100 
     592:	0028                	.insn	2, 0x0028
     594:	0000                	.insn	2, 0x0000
     596:	0374                	.insn	2, 0x0374
     598:	0000                	.insn	2, 0x0000
     59a:	0001                	.insn	2, 0x0001
     59c:	005f 0000 0000      	.insn	6, 0x005f
     5a2:	0000                	.insn	2, 0x0000
     5a4:	ff00                	.insn	2, 0xff00
     5a6:	ffff                	.insn	2, 0xffff
     5a8:	400b34ff 00002800 	.insn	16, 0x300002000000580000002800400b34ff
     5b0:	00005800 30000200 
     5b8:	589f 0000 b000      	.insn	6, 0xb0000000589f
     5be:	0000                	.insn	2, 0x0000
     5c0:	0100                	.insn	2, 0x0100
     5c2:	5b00                	.insn	2, 0x5b00
	...
     5cc:	ffff                	.insn	2, 0xffff
     5ce:	ffff                	.insn	2, 0xffff
     5d0:	0b34                	.insn	2, 0x0b34
     5d2:	0040                	.insn	2, 0x0040
     5d4:	0058                	.insn	2, 0x0058
     5d6:	0000                	.insn	2, 0x0000
     5d8:	0074                	.insn	2, 0x0074
     5da:	0000                	.insn	2, 0x0000
     5dc:	0002                	.insn	2, 0x0002
     5de:	9f30                	.insn	2, 0x9f30
     5e0:	0074                	.insn	2, 0x0074
     5e2:	0000                	.insn	2, 0x0000
     5e4:	0088                	.insn	2, 0x0088
     5e6:	0000                	.insn	2, 0x0000
     5e8:	0006                	.insn	2, 0x0006
     5ea:	007a                	.insn	2, 0x007a
     5ec:	0311                	.insn	2, 0x0311
     5ee:	00889f1b          	.insn	4, 0x00889f1b
     5f2:	0000                	.insn	2, 0x0000
     5f4:	009c                	.insn	2, 0x009c
     5f6:	0000                	.insn	2, 0x0000
     5f8:	0009                	.insn	2, 0x0009
     5fa:	007a                	.insn	2, 0x007a
     5fc:	0311                	.insn	2, 0x0311
     5fe:	2201111b          	.insn	4, 0x2201111b
     602:	009f 0000 0000      	.insn	6, 0x009f
     608:	0000                	.insn	2, 0x0000
     60a:	ff00                	.insn	2, 0xff00
     60c:	ffff                	.insn	2, 0xffff
     60e:	400b34ff 0000d000 	.insn	16, 0x5f00010000010c000000d000400b34ff
     616:	00010c00 5f000100 
     61e:	0194                	.insn	2, 0x0194
     620:	0000                	.insn	2, 0x0000
     622:	01cc                	.insn	2, 0x01cc
     624:	0000                	.insn	2, 0x0000
     626:	0001                	.insn	2, 0x0001
     628:	005f 0000 0000      	.insn	6, 0x005f
     62e:	0000                	.insn	2, 0x0000
     630:	ff00                	.insn	2, 0xff00
     632:	ffff                	.insn	2, 0xffff
     634:	400b34ff 0000d000 	.insn	16, 0x3a00020000010c000000d000400b34ff
     63c:	00010c00 3a000200 
     644:	949f 0001 cc00      	.insn	6, 0xcc000001949f
     64a:	0001                	.insn	2, 0x0001
     64c:	0200                	.insn	2, 0x0200
     64e:	3a00                	.insn	2, 0x3a00
     650:	009f 0000 0000      	.insn	6, 0x009f
     656:	0000                	.insn	2, 0x0000
     658:	ff00                	.insn	2, 0xff00
     65a:	ffff                	.insn	2, 0xffff
     65c:	400b34ff 0000d000 	.insn	16, 0x7200030000010c000000d000400b34ff
     664:	00010c00 72000300 
     66c:	9f10                	.insn	2, 0x9f10
	...
     676:	ffff                	.insn	2, 0xffff
     678:	ffff                	.insn	2, 0xffff
     67a:	0b34                	.insn	2, 0x0b34
     67c:	0040                	.insn	2, 0x0040
     67e:	00d0                	.insn	2, 0x00d0
     680:	0000                	.insn	2, 0x0000
     682:	010c                	.insn	2, 0x010c
     684:	0000                	.insn	2, 0x0000
     686:	0005                	.insn	2, 0x0005
     688:	9072                	.insn	2, 0x9072
     68a:	0180                	.insn	2, 0x0180
     68c:	009f 0000 0000      	.insn	6, 0x009f
     692:	0000                	.insn	2, 0x0000
     694:	ff00                	.insn	2, 0xff00
     696:	ffff                	.insn	2, 0xffff
     698:	400b34ff 0000d000 	.insn	16, 0x7200050000010c000000d000400b34ff
     6a0:	00010c00 72000500 
     6a8:	a090                	.insn	2, 0xa090
     6aa:	9f01                	.insn	2, 0x9f01
	...
     6b4:	ffff                	.insn	2, 0xffff
     6b6:	ffff                	.insn	2, 0xffff
     6b8:	0b34                	.insn	2, 0x0b34
     6ba:	0040                	.insn	2, 0x0040
     6bc:	00ec                	.insn	2, 0x00ec
     6be:	0000                	.insn	2, 0x0000
     6c0:	010c                	.insn	2, 0x010c
     6c2:	0000                	.insn	2, 0x0000
     6c4:	0001                	.insn	2, 0x0001
     6c6:	0061                	.insn	2, 0x0061
     6c8:	0000                	.insn	2, 0x0000
     6ca:	0000                	.insn	2, 0x0000
     6cc:	0000                	.insn	2, 0x0000
     6ce:	ff00                	.insn	2, 0xff00
     6d0:	ffff                	.insn	2, 0xffff
     6d2:	400b34ff 0000f000 	.insn	16, 0x1000030000010c000000f000400b34ff
     6da:	00010c00 10000300 
     6e2:	9f41                	.insn	2, 0x9f41
     6e4:	01b4                	.insn	2, 0x01b4
     6e6:	0000                	.insn	2, 0x0000
     6e8:	01cc                	.insn	2, 0x01cc
     6ea:	0000                	.insn	2, 0x0000
     6ec:	41100003          	lb	zero,1041(zero) # 411 <$d.6+0x189>
     6f0:	009f 0000 0000      	.insn	6, 0x009f
     6f6:	0000                	.insn	2, 0x0000
     6f8:	ff00                	.insn	2, 0xff00
     6fa:	ffff                	.insn	2, 0xffff
     6fc:	400b34ff 0000fc00 	.insn	16, 0x3a00020000010c000000fc00400b34ff
     704:	00010c00 3a000200 
     70c:	c09f 0001 cc00      	.insn	6, 0xcc000001c09f
     712:	0001                	.insn	2, 0x0001
     714:	0200                	.insn	2, 0x0200
     716:	3a00                	.insn	2, 0x3a00
     718:	009f 0000 0000      	.insn	6, 0x009f
     71e:	0000                	.insn	2, 0x0000
     720:	ff00                	.insn	2, 0xff00
     722:	ffff                	.insn	2, 0xffff
     724:	400b34ff 00010800 	.insn	16, 0x300002000001240000010800400b34ff
     72c:	00012400 30000200 
     734:	249f 0001 7400      	.insn	6, 0x74000001249f
     73a:	0001                	.insn	2, 0x0001
     73c:	0100                	.insn	2, 0x0100
     73e:	5b00                	.insn	2, 0x5b00
	...
     748:	ffff                	.insn	2, 0xffff
     74a:	ffff                	.insn	2, 0xffff
     74c:	0b34                	.insn	2, 0x0b34
     74e:	0040                	.insn	2, 0x0040
     750:	0124                	.insn	2, 0x0124
     752:	0000                	.insn	2, 0x0000
     754:	0134                	.insn	2, 0x0134
     756:	0000                	.insn	2, 0x0000
     758:	0002                	.insn	2, 0x0002
     75a:	9f30                	.insn	2, 0x9f30
     75c:	0134                	.insn	2, 0x0134
     75e:	0000                	.insn	2, 0x0000
     760:	0150                	.insn	2, 0x0150
     762:	0000                	.insn	2, 0x0000
     764:	000c                	.insn	2, 0x000c
     766:	0081                	.insn	2, 0x0081
     768:	9072                	.insn	2, 0x9072
     76a:	01a0                	.insn	2, 0x01a0
     76c:	111c                	.insn	2, 0x111c
     76e:	00c0                	.insn	2, 0x00c0
     770:	01509f1b          	.insn	4, 0x01509f1b
     774:	0000                	.insn	2, 0x0000
     776:	0158                	.insn	2, 0x0158
     778:	0000                	.insn	2, 0x0000
     77a:	0081000f          	.insn	4, 0x0081000f
     77e:	9072                	.insn	2, 0x9072
     780:	01a0                	.insn	2, 0x01a0
     782:	111c                	.insn	2, 0x111c
     784:	00c0                	.insn	2, 0x00c0
     786:	2201111b          	.insn	4, 0x2201111b
     78a:	009f 0000 0000      	.insn	6, 0x009f
     790:	0000                	.insn	2, 0x0000
     792:	ff00                	.insn	2, 0xff00
     794:	ffff                	.insn	2, 0xffff
     796:	400b34ff 0001d000 	.insn	16, 0x3a0002000001fc000001d000400b34ff
     79e:	0001fc00 3a000200 
     7a6:	a49f 0002 cc00      	.insn	6, 0xcc000002a49f
     7ac:	0002                	.insn	2, 0x0002
     7ae:	0200                	.insn	2, 0x0200
     7b0:	3a00                	.insn	2, 0x3a00
     7b2:	009f 0000 0000      	.insn	6, 0x009f
     7b8:	0000                	.insn	2, 0x0000
     7ba:	ff00                	.insn	2, 0xff00
     7bc:	ffff                	.insn	2, 0xffff
     7be:	400b34ff 0001e000 	.insn	16, 0x100003000001fc000001e000400b34ff
     7c6:	0001fc00 10000300 
     7ce:	9f42                	.insn	2, 0x9f42
     7d0:	02b4                	.insn	2, 0x02b4
     7d2:	0000                	.insn	2, 0x0000
     7d4:	02cc                	.insn	2, 0x02cc
     7d6:	0000                	.insn	2, 0x0000
     7d8:	42100003          	lb	zero,1057(zero) # 421 <$d.6+0x199>
     7dc:	009f 0000 0000      	.insn	6, 0x009f
     7e2:	0000                	.insn	2, 0x0000
     7e4:	ff00                	.insn	2, 0xff00
     7e6:	ffff                	.insn	2, 0xffff
     7e8:	400b34ff 0001ec00 	.insn	16, 0x3a0002000001fc000001ec00400b34ff
     7f0:	0001fc00 3a000200 
     7f8:	c09f 0002 cc00      	.insn	6, 0xcc000002c09f
     7fe:	0002                	.insn	2, 0x0002
     800:	0200                	.insn	2, 0x0200
     802:	3a00                	.insn	2, 0x3a00
     804:	009f 0000 0000      	.insn	6, 0x009f
     80a:	0000                	.insn	2, 0x0000
     80c:	ff00                	.insn	2, 0xff00
     80e:	ffff                	.insn	2, 0xffff
     810:	400b34ff 0001f800 	.insn	16, 0x30000200000220000001f800400b34ff
     818:	00022000 30000200 
     820:	209f 0002 7000      	.insn	6, 0x70000002209f
     826:	0002                	.insn	2, 0x0002
     828:	0100                	.insn	2, 0x0100
     82a:	5b00                	.insn	2, 0x5b00
	...
     834:	ffff                	.insn	2, 0xffff
     836:	ffff                	.insn	2, 0xffff
     838:	0b34                	.insn	2, 0x0b34
     83a:	0040                	.insn	2, 0x0040
     83c:	0220                	.insn	2, 0x0220
     83e:	0000                	.insn	2, 0x0000
     840:	0230                	.insn	2, 0x0230
     842:	0000                	.insn	2, 0x0000
     844:	0002                	.insn	2, 0x0002
     846:	9f30                	.insn	2, 0x9f30
     848:	0230                	.insn	2, 0x0230
     84a:	0000                	.insn	2, 0x0000
     84c:	024c                	.insn	2, 0x024c
     84e:	0000                	.insn	2, 0x0000
     850:	000c                	.insn	2, 0x000c
     852:	0081                	.insn	2, 0x0081
     854:	9072                	.insn	2, 0x9072
     856:	0180                	.insn	2, 0x0180
     858:	111c                	.insn	2, 0x111c
     85a:	00c0                	.insn	2, 0x00c0
     85c:	024c9f1b          	.insn	4, 0x024c9f1b
     860:	0000                	.insn	2, 0x0000
     862:	0254                	.insn	2, 0x0254
     864:	0000                	.insn	2, 0x0000
     866:	0081000f          	.insn	4, 0x0081000f
     86a:	9072                	.insn	2, 0x9072
     86c:	0180                	.insn	2, 0x0180
     86e:	111c                	.insn	2, 0x111c
     870:	00c0                	.insn	2, 0x00c0
     872:	2201111b          	.insn	4, 0x2201111b
     876:	009f 0000 0000      	.insn	6, 0x009f
     87c:	0000                	.insn	2, 0x0000
     87e:	ff00                	.insn	2, 0xff00
     880:	ffff                	.insn	2, 0xffff
     882:	400b34ff 00027400 	.insn	16, 0x3a0002000002a00000027400400b34ff
     88a:	0002a000 3a000200 
     892:	d09f 0002 fc00      	.insn	6, 0xfc000002d09f
     898:	0002                	.insn	2, 0x0002
     89a:	0200                	.insn	2, 0x0200
     89c:	3a00                	.insn	2, 0x3a00
     89e:	009f 0000 0000      	.insn	6, 0x009f
     8a4:	0000                	.insn	2, 0x0000
     8a6:	ff00                	.insn	2, 0xff00
     8a8:	ffff                	.insn	2, 0xffff
     8aa:	400b34ff 00028400 	.insn	16, 0x100003000002a00000028400400b34ff
     8b2:	0002a000 10000300 
     8ba:	02e09f43          	.insn	4, 0x02e09f43
     8be:	0000                	.insn	2, 0x0000
     8c0:	02fc                	.insn	2, 0x02fc
     8c2:	0000                	.insn	2, 0x0000
     8c4:	43100003          	lb	zero,1073(zero) # 431 <$d.6+0x1a9>
     8c8:	009f 0000 0000      	.insn	6, 0x009f
     8ce:	0000                	.insn	2, 0x0000
     8d0:	ff00                	.insn	2, 0xff00
     8d2:	ffff                	.insn	2, 0xffff
     8d4:	400b34ff 00029000 	.insn	16, 0x3a0002000002a00000029000400b34ff
     8dc:	0002a000 3a000200 
     8e4:	ec9f 0002 fc00      	.insn	6, 0xfc000002ec9f
     8ea:	0002                	.insn	2, 0x0002
     8ec:	0200                	.insn	2, 0x0200
     8ee:	3a00                	.insn	2, 0x3a00
     8f0:	009f 0000 0000      	.insn	6, 0x009f
     8f6:	0000                	.insn	2, 0x0000
     8f8:	ff00                	.insn	2, 0xff00
     8fa:	ffff                	.insn	2, 0xffff
     8fc:	400b34ff 0002f800 	.insn	16, 0x3000020000030c000002f800400b34ff
     904:	00030c00 30000200 
     90c:	0c9f 0003 5400      	.insn	6, 0x540000030c9f
     912:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     916:	5b00                	.insn	2, 0x5b00
	...
     920:	ffff                	.insn	2, 0xffff
     922:	ffff                	.insn	2, 0xffff
     924:	0b34                	.insn	2, 0x0b34
     926:	0040                	.insn	2, 0x0040
     928:	0314                	.insn	2, 0x0314
     92a:	0000                	.insn	2, 0x0000
     92c:	0330                	.insn	2, 0x0330
     92e:	0000                	.insn	2, 0x0000
     930:	0009                	.insn	2, 0x0009
     932:	0075                	.insn	2, 0x0075
     934:	007f 111c 1b7f 309f 	.insn	10, 0x0003309f1b7f111c007f
     93c:	0003 
     93e:	3400                	.insn	2, 0x3400
     940:	0c000003          	lb	zero,192(zero) # c0 <$d.10+0x4c>
     944:	7500                	.insn	2, 0x7500
     946:	7f00                	.insn	2, 0x7f00
     948:	1c00                	.insn	2, 0x1c00
     94a:	7f11                	.insn	2, 0x7f11
     94c:	2201111b          	.insn	4, 0x2201111b
     950:	009f 0000 0000      	.insn	6, 0x009f
     956:	0000                	.insn	2, 0x0000
     958:	ff00                	.insn	2, 0xff00
     95a:	ffff                	.insn	2, 0xffff
     95c:	400b34ff 00037400 	.insn	16, 0x5a0001000003780000037400400b34ff
     964:	00037800 5a000100 
     96c:	0378                	.insn	2, 0x0378
     96e:	0000                	.insn	2, 0x0000
     970:	0388                	.insn	2, 0x0388
     972:	0000                	.insn	2, 0x0000
     974:	0001                	.insn	2, 0x0001
     976:	0000005b          	.insn	4, 0x005b
     97a:	0000                	.insn	2, 0x0000
     97c:	0000                	.insn	2, 0x0000
     97e:	ff00                	.insn	2, 0xff00
     980:	ffff                	.insn	2, 0xffff
     982:	400b34ff 00038800 	.insn	16, 0x5a00010000038c0000038800400b34ff
     98a:	00038c00 5a000100 
     992:	038c                	.insn	2, 0x038c
     994:	0000                	.insn	2, 0x0000
     996:	039c                	.insn	2, 0x039c
     998:	0000                	.insn	2, 0x0000
     99a:	0001                	.insn	2, 0x0001
     99c:	0000005b          	.insn	4, 0x005b
     9a0:	0000                	.insn	2, 0x0000
     9a2:	0000                	.insn	2, 0x0000
     9a4:	ff00                	.insn	2, 0xff00
     9a6:	ffff                	.insn	2, 0xffff
     9a8:	400b34ff 00039c00 	.insn	16, 0x5a0001000003a40000039c00400b34ff
     9b0:	0003a400 5a000100 
	...
     9c0:	ffff                	.insn	2, 0xffff
     9c2:	ffff                	.insn	2, 0xffff
     9c4:	0b34                	.insn	2, 0x0b34
     9c6:	0040                	.insn	2, 0x0040
     9c8:	03a8                	.insn	2, 0x03a8
     9ca:	0000                	.insn	2, 0x0000
     9cc:	03bc                	.insn	2, 0x03bc
     9ce:	0000                	.insn	2, 0x0000
     9d0:	0001                	.insn	2, 0x0001
     9d2:	bc5a                	.insn	2, 0xbc5a
     9d4:	0c000003          	lb	zero,192(zero) # c0 <$d.10+0x4c>
     9d8:	0004                	.insn	2, 0x0004
     9da:	0100                	.insn	2, 0x0100
     9dc:	5800                	.insn	2, 0x5800
     9de:	0418                	.insn	2, 0x0418
     9e0:	0000                	.insn	2, 0x0000
     9e2:	0454                	.insn	2, 0x0454
     9e4:	0000                	.insn	2, 0x0000
     9e6:	0001                	.insn	2, 0x0001
     9e8:	0058                	.insn	2, 0x0058
     9ea:	0000                	.insn	2, 0x0000
     9ec:	0000                	.insn	2, 0x0000
     9ee:	0000                	.insn	2, 0x0000
     9f0:	ff00                	.insn	2, 0xff00
     9f2:	ffff                	.insn	2, 0xffff
     9f4:	400b34ff 00042c00 	.insn	16, 0x590001000004540000042c00400b34ff
     9fc:	00045400 59000100 
	...
     a0c:	ffff                	.insn	2, 0xffff
     a0e:	ffff                	.insn	2, 0xffff
     a10:	0b34                	.insn	2, 0x0b34
     a12:	0040                	.insn	2, 0x0040
     a14:	0440                	.insn	2, 0x0440
     a16:	0000                	.insn	2, 0x0000
     a18:	0450                	.insn	2, 0x0450
     a1a:	0000                	.insn	2, 0x0000
     a1c:	0001                	.insn	2, 0x0001
     a1e:	5058                	.insn	2, 0x5058
     a20:	0004                	.insn	2, 0x0004
     a22:	5400                	.insn	2, 0x5400
     a24:	0004                	.insn	2, 0x0004
     a26:	0100                	.insn	2, 0x0100
     a28:	5a00                	.insn	2, 0x5a00
	...
     a32:	ffff                	.insn	2, 0xffff
     a34:	ffff                	.insn	2, 0xffff
     a36:	0b34                	.insn	2, 0x0b34
     a38:	0040                	.insn	2, 0x0040
     a3a:	0454                	.insn	2, 0x0454
     a3c:	0000                	.insn	2, 0x0000
     a3e:	0470                	.insn	2, 0x0470
     a40:	0000                	.insn	2, 0x0000
     a42:	0001                	.insn	2, 0x0001
     a44:	705a                	.insn	2, 0x705a
     a46:	0004                	.insn	2, 0x0004
     a48:	1000                	.insn	2, 0x1000
     a4a:	01000007          	.insn	4, 0x01000007
     a4e:	5500                	.insn	2, 0x5500
	...
     a58:	ffff                	.insn	2, 0xffff
     a5a:	ffff                	.insn	2, 0xffff
     a5c:	0b34                	.insn	2, 0x0b34
     a5e:	0040                	.insn	2, 0x0040
     a60:	0520                	.insn	2, 0x0520
     a62:	0000                	.insn	2, 0x0000
     a64:	053c                	.insn	2, 0x053c
     a66:	0000                	.insn	2, 0x0000
     a68:	0001                	.insn	2, 0x0001
     a6a:	8059                	.insn	2, 0x8059
     a6c:	0006                	.insn	2, 0x0006
     a6e:	9000                	.insn	2, 0x9000
     a70:	0006                	.insn	2, 0x0006
     a72:	0100                	.insn	2, 0x0100
     a74:	5900                	.insn	2, 0x5900
	...
     a7e:	ffff                	.insn	2, 0xffff
     a80:	ffff                	.insn	2, 0xffff
     a82:	0b34                	.insn	2, 0x0b34
     a84:	0040                	.insn	2, 0x0040
     a86:	0524                	.insn	2, 0x0524
     a88:	0000                	.insn	2, 0x0000
     a8a:	053c                	.insn	2, 0x053c
     a8c:	0000                	.insn	2, 0x0000
     a8e:	0001                	.insn	2, 0x0001
     a90:	9059                	.insn	2, 0x9059
     a92:	0006                	.insn	2, 0x0006
     a94:	9c00                	.insn	2, 0x9c00
     a96:	0006                	.insn	2, 0x0006
     a98:	0100                	.insn	2, 0x0100
     a9a:	5900                	.insn	2, 0x5900
     a9c:	069c                	.insn	2, 0x069c
     a9e:	0000                	.insn	2, 0x0000
     aa0:	06a4                	.insn	2, 0x06a4
     aa2:	0000                	.insn	2, 0x0000
     aa4:	0001                	.insn	2, 0x0001
     aa6:	a45d                	.insn	2, 0xa45d
     aa8:	0006                	.insn	2, 0x0006
     aaa:	c000                	.insn	2, 0xc000
     aac:	0006                	.insn	2, 0x0006
     aae:	0100                	.insn	2, 0x0100
     ab0:	5900                	.insn	2, 0x5900
	...
     aba:	ffff                	.insn	2, 0xffff
     abc:	ffff                	.insn	2, 0xffff
     abe:	0b34                	.insn	2, 0x0b34
     ac0:	0040                	.insn	2, 0x0040
     ac2:	0524                	.insn	2, 0x0524
     ac4:	0000                	.insn	2, 0x0000
     ac6:	053c                	.insn	2, 0x053c
     ac8:	0000                	.insn	2, 0x0000
     aca:	00110003          	lb	zero,1(sp)
     ace:	909f 0006 9400      	.insn	6, 0x94000006909f
     ad4:	0006                	.insn	2, 0x0006
     ad6:	0300                	.insn	2, 0x0300
     ad8:	1100                	.insn	2, 0x1100
     ada:	9f00                	.insn	2, 0x9f00
     adc:	069c                	.insn	2, 0x069c
     ade:	0000                	.insn	2, 0x0000
     ae0:	06b4                	.insn	2, 0x06b4
     ae2:	0000                	.insn	2, 0x0000
     ae4:	0001                	.insn	2, 0x0001
     ae6:	b462                	.insn	2, 0xb462
     ae8:	0006                	.insn	2, 0x0006
     aea:	c000                	.insn	2, 0xc000
     aec:	0006                	.insn	2, 0x0006
     aee:	0100                	.insn	2, 0x0100
     af0:	5a00                	.insn	2, 0x5a00
	...
     afa:	ffff                	.insn	2, 0xffff
     afc:	ffff                	.insn	2, 0xffff
     afe:	0b34                	.insn	2, 0x0b34
     b00:	0040                	.insn	2, 0x0040
     b02:	0554                	.insn	2, 0x0554
     b04:	0000                	.insn	2, 0x0000
     b06:	056c                	.insn	2, 0x056c
     b08:	0000                	.insn	2, 0x0000
     b0a:	07110003          	lb	zero,113(sp)
     b0e:	6c9f 0005 8800      	.insn	6, 0x880000056c9f
     b14:	0005                	.insn	2, 0x0005
     b16:	0300                	.insn	2, 0x0300
     b18:	1100                	.insn	2, 0x1100
     b1a:	9f06                	.insn	2, 0x9f06
     b1c:	0588                	.insn	2, 0x0588
     b1e:	0000                	.insn	2, 0x0000
     b20:	05a4                	.insn	2, 0x05a4
     b22:	0000                	.insn	2, 0x0000
     b24:	05110003          	lb	zero,81(sp)
     b28:	a49f 0005 c000      	.insn	6, 0xc0000005a49f
     b2e:	0005                	.insn	2, 0x0005
     b30:	0300                	.insn	2, 0x0300
     b32:	1100                	.insn	2, 0x1100
     b34:	9f04                	.insn	2, 0x9f04
     b36:	05c0                	.insn	2, 0x05c0
     b38:	0000                	.insn	2, 0x0000
     b3a:	05dc                	.insn	2, 0x05dc
     b3c:	0000                	.insn	2, 0x0000
     b3e:	03110003          	lb	zero,49(sp)
     b42:	dc9f 0005 f800      	.insn	6, 0xf8000005dc9f
     b48:	0005                	.insn	2, 0x0005
     b4a:	0300                	.insn	2, 0x0300
     b4c:	1100                	.insn	2, 0x1100
     b4e:	9f02                	.insn	2, 0x9f02
     b50:	05f8                	.insn	2, 0x05f8
     b52:	0000                	.insn	2, 0x0000
     b54:	0614                	.insn	2, 0x0614
     b56:	0000                	.insn	2, 0x0000
     b58:	01110003          	lb	zero,17(sp)
     b5c:	149f 0006 2c00      	.insn	6, 0x2c000006149f
     b62:	0006                	.insn	2, 0x0006
     b64:	0300                	.insn	2, 0x0300
     b66:	1100                	.insn	2, 0x1100
     b68:	9f00                	.insn	2, 0x9f00
     b6a:	062c                	.insn	2, 0x062c
     b6c:	0000                	.insn	2, 0x0000
     b6e:	0634                	.insn	2, 0x0634
     b70:	0000                	.insn	2, 0x0000
     b72:	7f110003          	lb	zero,2033(sp)
     b76:	009f 0000 0000      	.insn	6, 0x009f
     b7c:	0000                	.insn	2, 0x0000
     b7e:	ff00                	.insn	2, 0xff00
     b80:	ffff                	.insn	2, 0xffff
     b82:	400b34ff 00055400 	.insn	16, 0x590001000006180000055400400b34ff
     b8a:	00061800 59000100 
	...
     b9a:	ffff                	.insn	2, 0xffff
     b9c:	ffff                	.insn	2, 0xffff
     b9e:	0b34                	.insn	2, 0x0b34
     ba0:	0040                	.insn	2, 0x0040
     ba2:	0558                	.insn	2, 0x0558
     ba4:	0000                	.insn	2, 0x0000
     ba6:	055c                	.insn	2, 0x055c
     ba8:	0000                	.insn	2, 0x0000
     baa:	0001                	.insn	2, 0x0001
     bac:	745a                	.insn	2, 0x745a
     bae:	0005                	.insn	2, 0x0005
     bb0:	7800                	.insn	2, 0x7800
     bb2:	0005                	.insn	2, 0x0005
     bb4:	0100                	.insn	2, 0x0100
     bb6:	5a00                	.insn	2, 0x5a00
     bb8:	0590                	.insn	2, 0x0590
     bba:	0000                	.insn	2, 0x0000
     bbc:	0594                	.insn	2, 0x0594
     bbe:	0000                	.insn	2, 0x0000
     bc0:	0001                	.insn	2, 0x0001
     bc2:	ac5a                	.insn	2, 0xac5a
     bc4:	0005                	.insn	2, 0x0005
     bc6:	b000                	.insn	2, 0xb000
     bc8:	0005                	.insn	2, 0x0005
     bca:	0100                	.insn	2, 0x0100
     bcc:	5a00                	.insn	2, 0x5a00
     bce:	05c8                	.insn	2, 0x05c8
     bd0:	0000                	.insn	2, 0x0000
     bd2:	05cc                	.insn	2, 0x05cc
     bd4:	0000                	.insn	2, 0x0000
     bd6:	0001                	.insn	2, 0x0001
     bd8:	e45a                	.insn	2, 0xe45a
     bda:	0005                	.insn	2, 0x0005
     bdc:	e800                	.insn	2, 0xe800
     bde:	0005                	.insn	2, 0x0005
     be0:	0100                	.insn	2, 0x0100
     be2:	5a00                	.insn	2, 0x5a00
     be4:	0600                	.insn	2, 0x0600
     be6:	0000                	.insn	2, 0x0000
     be8:	0604                	.insn	2, 0x0604
     bea:	0000                	.insn	2, 0x0000
     bec:	0001                	.insn	2, 0x0001
     bee:	185a                	.insn	2, 0x185a
     bf0:	0006                	.insn	2, 0x0006
     bf2:	1c00                	.insn	2, 0x1c00
     bf4:	0006                	.insn	2, 0x0006
     bf6:	0100                	.insn	2, 0x0100
     bf8:	5900                	.insn	2, 0x5900
	...
     c02:	ffff                	.insn	2, 0xffff
     c04:	ffff                	.insn	2, 0xffff
     c06:	0b34                	.insn	2, 0x0b34
     c08:	0040                	.insn	2, 0x0040
     c0a:	0658                	.insn	2, 0x0658
     c0c:	0000                	.insn	2, 0x0000
     c0e:	0664                	.insn	2, 0x0664
     c10:	0000                	.insn	2, 0x0000
     c12:	0001                	.insn	2, 0x0001
     c14:	6462                	.insn	2, 0x6462
     c16:	0006                	.insn	2, 0x0006
     c18:	7000                	.insn	2, 0x7000
     c1a:	0006                	.insn	2, 0x0006
     c1c:	0300                	.insn	2, 0x0300
     c1e:	8200                	.insn	2, 0x8200
     c20:	06709f7f 06780000 	.insn	12, 0x000100000678000006709f7f
     c28:	00010000 
     c2c:	0062                	.insn	2, 0x0062
     c2e:	0000                	.insn	2, 0x0000
     c30:	0000                	.insn	2, 0x0000
     c32:	0000                	.insn	2, 0x0000
     c34:	ff00                	.insn	2, 0xff00
     c36:	ffff                	.insn	2, 0xffff
     c38:	400b34ff 00071000 	.insn	16, 0x5a0001000007180000071000400b34ff
     c40:	00071800 5a000100 
	...
     c50:	ffff                	.insn	2, 0xffff
     c52:	ffff                	.insn	2, 0xffff
     c54:	0b34                	.insn	2, 0x0b34
     c56:	0040                	.insn	2, 0x0040
     c58:	071c                	.insn	2, 0x071c
     c5a:	0000                	.insn	2, 0x0000
     c5c:	0724                	.insn	2, 0x0724
     c5e:	0000                	.insn	2, 0x0000
     c60:	0001                	.insn	2, 0x0001
     c62:	005a                	.insn	2, 0x005a
     c64:	0000                	.insn	2, 0x0000
     c66:	0000                	.insn	2, 0x0000
     c68:	0000                	.insn	2, 0x0000
     c6a:	ff00                	.insn	2, 0xff00
     c6c:	ffff                	.insn	2, 0xffff
     c6e:	400b34ff 00072800 	.insn	16, 0x5a0001000007300000072800400b34ff
     c76:	00073000 5a000100 
	...
     c86:	ffff                	.insn	2, 0xffff
     c88:	ffff                	.insn	2, 0xffff
     c8a:	0b34                	.insn	2, 0x0b34
     c8c:	0040                	.insn	2, 0x0040
     c8e:	0734                	.insn	2, 0x0734
     c90:	0000                	.insn	2, 0x0000
     c92:	073c                	.insn	2, 0x073c
     c94:	0000                	.insn	2, 0x0000
     c96:	0001                	.insn	2, 0x0001
     c98:	005a                	.insn	2, 0x005a
     c9a:	0000                	.insn	2, 0x0000
     c9c:	0000                	.insn	2, 0x0000
     c9e:	0000                	.insn	2, 0x0000
     ca0:	ff00                	.insn	2, 0xff00
     ca2:	ffff                	.insn	2, 0xffff
     ca4:	400b34ff 00074c00 	.insn	16, 0x5b00010000075c0000074c00400b34ff
     cac:	00075c00 5b000100 
     cb4:	0760                	.insn	2, 0x0760
     cb6:	0000                	.insn	2, 0x0000
     cb8:	0770                	.insn	2, 0x0770
     cba:	0000                	.insn	2, 0x0000
     cbc:	0001                	.insn	2, 0x0001
     cbe:	0000005b          	.insn	4, 0x005b
     cc2:	0000                	.insn	2, 0x0000
     cc4:	0000                	.insn	2, 0x0000
     cc6:	ff00                	.insn	2, 0xff00
     cc8:	ffff                	.insn	2, 0xffff
     cca:	400b34ff 00074c00 	.insn	16, 0x5a0001000007600000074c00400b34ff
     cd2:	00076000 5a000100 
     cda:	0760                	.insn	2, 0x0760
     cdc:	0000                	.insn	2, 0x0000
     cde:	076c                	.insn	2, 0x076c
     ce0:	0000                	.insn	2, 0x0000
     ce2:	0001                	.insn	2, 0x0001
     ce4:	6c5e                	.insn	2, 0x6c5e
     ce6:	78000007          	.insn	4, 0x78000007
     cea:	01000007          	.insn	4, 0x01000007
     cee:	5d00                	.insn	2, 0x5d00
	...
     cf8:	ffff                	.insn	2, 0xffff
     cfa:	ffff                	.insn	2, 0xffff
     cfc:	0b34                	.insn	2, 0x0b34
     cfe:	0040                	.insn	2, 0x0040
     d00:	0780                	.insn	2, 0x0780
     d02:	0000                	.insn	2, 0x0000
     d04:	078c                	.insn	2, 0x078c
     d06:	0000                	.insn	2, 0x0000
     d08:	0001                	.insn	2, 0x0001
     d0a:	8c5a                	.insn	2, 0x8c5a
     d0c:	98000007          	.insn	4, 0x98000007
     d10:	03000007          	.insn	4, 0x03000007
     d14:	7a00                	.insn	2, 0x7a00
     d16:	07989f7f 07a40000 	.insn	12, 0x0001000007a4000007989f7f
     d1e:	00010000 
     d22:	b05a                	.insn	2, 0xb05a
     d24:	b4000007          	.insn	4, 0xb4000007
     d28:	01000007          	.insn	4, 0x01000007
     d2c:	5a00                	.insn	2, 0x5a00
	...
     d36:	ffff                	.insn	2, 0xffff
     d38:	ffff                	.insn	2, 0xffff
     d3a:	0b34                	.insn	2, 0x0b34
     d3c:	0040                	.insn	2, 0x0040
     d3e:	0780                	.insn	2, 0x0780
     d40:	0000                	.insn	2, 0x0000
     d42:	07b8                	.insn	2, 0x07b8
     d44:	0000                	.insn	2, 0x0000
     d46:	0001                	.insn	2, 0x0001
     d48:	0000005b          	.insn	4, 0x005b
     d4c:	0000                	.insn	2, 0x0000
     d4e:	0000                	.insn	2, 0x0000
     d50:	ff00                	.insn	2, 0xff00
     d52:	ffff                	.insn	2, 0xffff
     d54:	400b34ff 0007c000 	.insn	16, 0x5a0001000007c4000007c000400b34ff
     d5c:	0007c400 5a000100 
     d64:	07c4                	.insn	2, 0x07c4
     d66:	0000                	.insn	2, 0x0000
     d68:	0808                	.insn	2, 0x0808
     d6a:	0000                	.insn	2, 0x0000
     d6c:	0001                	.insn	2, 0x0001
     d6e:	0008145b          	.insn	4, 0x0008145b
     d72:	6000                	.insn	2, 0x6000
     d74:	0008                	.insn	2, 0x0008
     d76:	0100                	.insn	2, 0x0100
     d78:	5b00                	.insn	2, 0x5b00
	...
     d82:	ffff                	.insn	2, 0xffff
     d84:	ffff                	.insn	2, 0xffff
     d86:	0b34                	.insn	2, 0x0b34
     d88:	0040                	.insn	2, 0x0040
     d8a:	07c4                	.insn	2, 0x07c4
     d8c:	0000                	.insn	2, 0x0000
     d8e:	07e4                	.insn	2, 0x07e4
     d90:	0000                	.insn	2, 0x0000
     d92:	0002                	.insn	2, 0x0002
     d94:	9f3a                	.insn	2, 0x9f3a
     d96:	07e4                	.insn	2, 0x07e4
     d98:	0000                	.insn	2, 0x0000
     d9a:	07f0                	.insn	2, 0x07f0
     d9c:	0000                	.insn	2, 0x0000
     d9e:	0002                	.insn	2, 0x0002
     da0:	9f40                	.insn	2, 0x9f40
     da2:	07f0                	.insn	2, 0x07f0
     da4:	0000                	.insn	2, 0x0000
     da6:	07fc                	.insn	2, 0x07fc
     da8:	0000                	.insn	2, 0x0000
     daa:	0001                	.insn	2, 0x0001
     dac:	fc5c                	.insn	2, 0xfc5c
     dae:	00000007          	.insn	4, 0x0007
     db2:	0008                	.insn	2, 0x0008
     db4:	0200                	.insn	2, 0x0200
     db6:	3a00                	.insn	2, 0x3a00
     db8:	009f 0000 0000      	.insn	6, 0x009f
     dbe:	0000                	.insn	2, 0x0000
     dc0:	ff00                	.insn	2, 0xff00
     dc2:	ffff                	.insn	2, 0xffff
     dc4:	400b34ff 0007f000 	.insn	16, 0x300002000007fc000007f000400b34ff
     dcc:	0007fc00 30000200 
     dd4:	149f 0008 5800      	.insn	6, 0x58000008149f
     dda:	0008                	.insn	2, 0x0008
     ddc:	0100                	.insn	2, 0x0100
     dde:	5a00                	.insn	2, 0x5a00
     de0:	085c                	.insn	2, 0x085c
     de2:	0000                	.insn	2, 0x0000
     de4:	0868                	.insn	2, 0x0868
     de6:	0000                	.insn	2, 0x0000
     de8:	0001                	.insn	2, 0x0001
     dea:	005a                	.insn	2, 0x005a
     dec:	0000                	.insn	2, 0x0000
     dee:	0000                	.insn	2, 0x0000
     df0:	0000                	.insn	2, 0x0000
     df2:	ff00                	.insn	2, 0xff00
     df4:	ffff                	.insn	2, 0xffff
     df6:	400b34ff 00081400 	.insn	16, 0x5d0001000008480000081400400b34ff
     dfe:	00084800 5d000100 
	...
     e0e:	ffff                	.insn	2, 0xffff
     e10:	ffff                	.insn	2, 0xffff
     e12:	0b34                	.insn	2, 0x0b34
     e14:	0040                	.insn	2, 0x0040
     e16:	084c                	.insn	2, 0x084c
     e18:	0000                	.insn	2, 0x0000
     e1a:	0864                	.insn	2, 0x0864
     e1c:	0000                	.insn	2, 0x0000
     e1e:	0001                	.insn	2, 0x0001
     e20:	0061                	.insn	2, 0x0061
     e22:	0000                	.insn	2, 0x0000
     e24:	0000                	.insn	2, 0x0000
     e26:	0000                	.insn	2, 0x0000
     e28:	ff00                	.insn	2, 0xff00
     e2a:	ffff                	.insn	2, 0xffff
     e2c:	400b34ff 00086800 	.insn	16, 0x5a0001000008740000086800400b34ff
     e34:	00087400 5a000100 
     e3c:	0878                	.insn	2, 0x0878
     e3e:	0000                	.insn	2, 0x0000
     e40:	08a4                	.insn	2, 0x08a4
     e42:	0000                	.insn	2, 0x0000
     e44:	0001                	.insn	2, 0x0001
     e46:	005a                	.insn	2, 0x005a
     e48:	0000                	.insn	2, 0x0000
     e4a:	0000                	.insn	2, 0x0000
     e4c:	0000                	.insn	2, 0x0000
     e4e:	ff00                	.insn	2, 0xff00
     e50:	ffff                	.insn	2, 0xffff
     e52:	400b34ff 00087800 	.insn	16, 0x320002000008880000087800400b34ff
     e5a:	00088800 32000200 
     e62:	889f 0008 8c00      	.insn	6, 0x8c000008889f
     e68:	0008                	.insn	2, 0x0008
     e6a:	0100                	.insn	2, 0x0100
     e6c:	5b00                	.insn	2, 0x5b00
     e6e:	088c                	.insn	2, 0x088c
     e70:	0000                	.insn	2, 0x0000
     e72:	0894                	.insn	2, 0x0894
     e74:	0000                	.insn	2, 0x0000
     e76:	017b0003          	lb	zero,23(s6)
     e7a:	949f 0008 9c00      	.insn	6, 0x9c000008949f
     e80:	0008                	.insn	2, 0x0008
     e82:	0100                	.insn	2, 0x0100
     e84:	5b00                	.insn	2, 0x5b00
	...
     e8e:	ffff                	.insn	2, 0xffff
     e90:	ffff                	.insn	2, 0xffff
     e92:	0b34                	.insn	2, 0x0b34
     e94:	0040                	.insn	2, 0x0040
     e96:	08b4                	.insn	2, 0x08b4
     e98:	0000                	.insn	2, 0x0000
     e9a:	08bc                	.insn	2, 0x08bc
     e9c:	0000                	.insn	2, 0x0000
     e9e:	0001                	.insn	2, 0x0001
     ea0:	0000005b          	.insn	4, 0x005b
     ea4:	0000                	.insn	2, 0x0000
     ea6:	0000                	.insn	2, 0x0000
     ea8:	ff00                	.insn	2, 0xff00
     eaa:	ffff                	.insn	2, 0xffff
     eac:	400b34ff 0008c800 	.insn	16, 0x5b0001000008d0000008c800400b34ff
     eb4:	0008d000 5b000100 
	...
     ec4:	ffff                	.insn	2, 0xffff
     ec6:	ffff                	.insn	2, 0xffff
     ec8:	0b34                	.insn	2, 0x0b34
     eca:	0040                	.insn	2, 0x0040
     ecc:	08d0                	.insn	2, 0x08d0
     ece:	0000                	.insn	2, 0x0000
     ed0:	08d8                	.insn	2, 0x08d8
     ed2:	0000                	.insn	2, 0x0000
     ed4:	0001                	.insn	2, 0x0001
     ed6:	005a                	.insn	2, 0x005a
     ed8:	0000                	.insn	2, 0x0000
     eda:	0000                	.insn	2, 0x0000
     edc:	0000                	.insn	2, 0x0000
     ede:	ff00                	.insn	2, 0xff00
     ee0:	ffff                	.insn	2, 0xffff
     ee2:	400b34ff 0008e400 	.insn	16, 0x5a0001000008e8000008e400400b34ff
     eea:	0008e800 5a000100 
	...

00000efa <$d.3>:
     efa:	0000                	.insn	2, 0x0000
     efc:	0000                	.insn	2, 0x0000
     efe:	0014                	.insn	2, 0x0014
     f00:	0000                	.insn	2, 0x0000
     f02:	0001                	.insn	2, 0x0001
     f04:	145a                	.insn	2, 0x145a
     f06:	0000                	.insn	2, 0x0000
     f08:	ac00                	.insn	2, 0xac00
     f0a:	0000                	.insn	2, 0x0000
     f0c:	0100                	.insn	2, 0x0100
     f0e:	5800                	.insn	2, 0x5800
	...
     f18:	005c                	.insn	2, 0x005c
     f1a:	0000                	.insn	2, 0x0000
     f1c:	0070                	.insn	2, 0x0070
     f1e:	0000                	.insn	2, 0x0000
     f20:	0001                	.insn	2, 0x0001
     f22:	005a                	.insn	2, 0x005a
     f24:	0000                	.insn	2, 0x0000
     f26:	0000                	.insn	2, 0x0000
     f28:	0000                	.insn	2, 0x0000
     f2a:	7800                	.insn	2, 0x7800
     f2c:	0000                	.insn	2, 0x0000
     f2e:	8400                	.insn	2, 0x8400
     f30:	0000                	.insn	2, 0x0000
     f32:	0100                	.insn	2, 0x0100
     f34:	5a00                	.insn	2, 0x5a00
	...
     f3e:	0094                	.insn	2, 0x0094
     f40:	0000                	.insn	2, 0x0000
     f42:	00b4                	.insn	2, 0x00b4
     f44:	0000                	.insn	2, 0x0000
     f46:	0002                	.insn	2, 0x0002
     f48:	9f30                	.insn	2, 0x9f30
     f4a:	00b4                	.insn	2, 0x00b4
     f4c:	0000                	.insn	2, 0x0000
     f4e:	00c0                	.insn	2, 0x00c0
     f50:	0000                	.insn	2, 0x0000
     f52:	0006                	.insn	2, 0x0006
     f54:	0078                	.insn	2, 0x0078
     f56:	1472                	.insn	2, 0x1472
     f58:	9f1c                	.insn	2, 0x9f1c
     f5a:	00c0                	.insn	2, 0x00c0
     f5c:	0000                	.insn	2, 0x0000
     f5e:	00c4                	.insn	2, 0x00c4
     f60:	0000                	.insn	2, 0x0000
     f62:	0009                	.insn	2, 0x0009
     f64:	0078                	.insn	2, 0x0078
     f66:	1472                	.insn	2, 0x1472
     f68:	111c                	.insn	2, 0x111c
     f6a:	2201                	.insn	2, 0x2201
     f6c:	009f 0000 0000      	.insn	6, 0x009f
     f72:	0000                	.insn	2, 0x0000
     f74:	0800                	.insn	2, 0x0800
     f76:	0001                	.insn	2, 0x0001
     f78:	0800                	.insn	2, 0x0800
     f7a:	0002                	.insn	2, 0x0002
     f7c:	0100                	.insn	2, 0x0100
     f7e:	5900                	.insn	2, 0x5900
	...
     f88:	017c                	.insn	2, 0x017c
     f8a:	0000                	.insn	2, 0x0000
     f8c:	01e8                	.insn	2, 0x01e8
     f8e:	0000                	.insn	2, 0x0000
     f90:	0001                	.insn	2, 0x0001
     f92:	0000005b          	.insn	4, 0x005b
     f96:	0000                	.insn	2, 0x0000
     f98:	0000                	.insn	2, 0x0000
     f9a:	a800                	.insn	2, 0xa800
     f9c:	0001                	.insn	2, 0x0001
     f9e:	f800                	.insn	2, 0xf800
     fa0:	0001                	.insn	2, 0x0001
     fa2:	0100                	.insn	2, 0x0100
     fa4:	5c00                	.insn	2, 0x5c00
	...
     fae:	01dc                	.insn	2, 0x01dc
     fb0:	0000                	.insn	2, 0x0000
     fb2:	01f0                	.insn	2, 0x01f0
     fb4:	0000                	.insn	2, 0x0000
     fb6:	0001                	.insn	2, 0x0001
     fb8:	005a                	.insn	2, 0x005a
     fba:	0000                	.insn	2, 0x0000
     fbc:	0000                	.insn	2, 0x0000
     fbe:	0000                	.insn	2, 0x0000
     fc0:	1400                	.insn	2, 0x1400
     fc2:	0002                	.insn	2, 0x0002
     fc4:	5400                	.insn	2, 0x5400
     fc6:	0002                	.insn	2, 0x0002
     fc8:	0100                	.insn	2, 0x0100
     fca:	5a00                	.insn	2, 0x5a00
     fcc:	0254                	.insn	2, 0x0254
     fce:	0000                	.insn	2, 0x0000
     fd0:	02b8                	.insn	2, 0x02b8
     fd2:	0000                	.insn	2, 0x0000
     fd4:	0001                	.insn	2, 0x0001
     fd6:	d864                	.insn	2, 0xd864
     fd8:	0002                	.insn	2, 0x0002
     fda:	b800                	.insn	2, 0xb800
     fdc:	0004                	.insn	2, 0x0004
     fde:	0100                	.insn	2, 0x0100
     fe0:	6400                	.insn	2, 0x6400
	...
     fea:	0214                	.insn	2, 0x0214
     fec:	0000                	.insn	2, 0x0000
     fee:	0250                	.insn	2, 0x0250
     ff0:	0000                	.insn	2, 0x0000
     ff2:	0001                	.insn	2, 0x0001
     ff4:	0002505b          	.insn	4, 0x0002505b
     ff8:	ac00                	.insn	2, 0xac00
     ffa:	0002                	.insn	2, 0x0002
     ffc:	0100                	.insn	2, 0x0100
     ffe:	5900                	.insn	2, 0x5900
    1000:	02d8                	.insn	2, 0x02d8
    1002:	0000                	.insn	2, 0x0000
    1004:	04b8                	.insn	2, 0x04b8
    1006:	0000                	.insn	2, 0x0000
    1008:	0001                	.insn	2, 0x0001
    100a:	0059                	.insn	2, 0x0059
    100c:	0000                	.insn	2, 0x0000
    100e:	0000                	.insn	2, 0x0000
    1010:	0000                	.insn	2, 0x0000
    1012:	1400                	.insn	2, 0x1400
    1014:	0002                	.insn	2, 0x0002
    1016:	4c00                	.insn	2, 0x4c00
    1018:	0002                	.insn	2, 0x0002
    101a:	0100                	.insn	2, 0x0100
    101c:	5c00                	.insn	2, 0x5c00
    101e:	024c                	.insn	2, 0x024c
    1020:	0000                	.insn	2, 0x0000
    1022:	02a8                	.insn	2, 0x02a8
    1024:	0000                	.insn	2, 0x0000
    1026:	0001                	.insn	2, 0x0001
    1028:	d858                	.insn	2, 0xd858
    102a:	0002                	.insn	2, 0x0002
    102c:	b800                	.insn	2, 0xb800
    102e:	0004                	.insn	2, 0x0004
    1030:	0100                	.insn	2, 0x0100
    1032:	5800                	.insn	2, 0x5800
	...
    103c:	0270                	.insn	2, 0x0270
    103e:	0000                	.insn	2, 0x0000
    1040:	027c                	.insn	2, 0x027c
    1042:	0000                	.insn	2, 0x0000
    1044:	0001                	.insn	2, 0x0001
    1046:	0000005b          	.insn	4, 0x005b
    104a:	0000                	.insn	2, 0x0000
    104c:	0000                	.insn	2, 0x0000
    104e:	8400                	.insn	2, 0x8400
    1050:	0002                	.insn	2, 0x0002
    1052:	9800                	.insn	2, 0x9800
    1054:	0002                	.insn	2, 0x0002
    1056:	0100                	.insn	2, 0x0100
    1058:	5a00                	.insn	2, 0x5a00
	...
    1062:	02f4                	.insn	2, 0x02f4
    1064:	0000                	.insn	2, 0x0000
    1066:	0300                	.insn	2, 0x0300
    1068:	0000                	.insn	2, 0x0000
    106a:	0a110003          	lb	zero,161(sp)
    106e:	2c9f 0004 3400      	.insn	6, 0x340000042c9f
    1074:	0004                	.insn	2, 0x0004
    1076:	0300                	.insn	2, 0x0300
    1078:	1100                	.insn	2, 0x1100
    107a:	9f08                	.insn	2, 0x9f08
    107c:	0434                	.insn	2, 0x0434
    107e:	0000                	.insn	2, 0x0000
    1080:	0448                	.insn	2, 0x0448
    1082:	0000                	.insn	2, 0x0000
    1084:	09110003          	lb	zero,145(sp)
    1088:	489f 0004 5000      	.insn	6, 0x50000004489f
    108e:	0004                	.insn	2, 0x0004
    1090:	0300                	.insn	2, 0x0300
    1092:	1100                	.insn	2, 0x1100
    1094:	9f0a                	.insn	2, 0x9f0a
	...
    109e:	02f4                	.insn	2, 0x02f4
    10a0:	0000                	.insn	2, 0x0000
    10a2:	02f8                	.insn	2, 0x02f8
    10a4:	0000                	.insn	2, 0x0000
    10a6:	0001                	.insn	2, 0x0001
    10a8:	0002f85b          	.insn	4, 0x0002f85b
    10ac:	0400                	.insn	2, 0x0400
    10ae:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
    10b2:	5a00                	.insn	2, 0x5a00
    10b4:	033c                	.insn	2, 0x033c
    10b6:	0000                	.insn	2, 0x0000
    10b8:	0344                	.insn	2, 0x0344
    10ba:	0000                	.insn	2, 0x0000
    10bc:	00110003          	lb	zero,1(sp)
    10c0:	449f 0003 5000      	.insn	6, 0x50000003449f
    10c6:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
    10ca:	5a00                	.insn	2, 0x5a00
    10cc:	0350                	.insn	2, 0x0350
    10ce:	0000                	.insn	2, 0x0000
    10d0:	0358                	.insn	2, 0x0358
    10d2:	0000                	.insn	2, 0x0000
    10d4:	01110003          	lb	zero,17(sp)
    10d8:	589f 0003 2000      	.insn	6, 0x20000003589f
    10de:	0004                	.insn	2, 0x0004
    10e0:	0100                	.insn	2, 0x0100
    10e2:	5a00                	.insn	2, 0x5a00
    10e4:	0420                	.insn	2, 0x0420
    10e6:	0000                	.insn	2, 0x0000
    10e8:	042c                	.insn	2, 0x042c
    10ea:	0000                	.insn	2, 0x0000
    10ec:	017a0003          	lb	zero,23(s4)
    10f0:	309f 0004 3c00      	.insn	6, 0x3c000004309f
    10f6:	0004                	.insn	2, 0x0004
    10f8:	0100                	.insn	2, 0x0100
    10fa:	5b00                	.insn	2, 0x5b00
    10fc:	0440                	.insn	2, 0x0440
    10fe:	0000                	.insn	2, 0x0000
    1100:	0448                	.insn	2, 0x0448
    1102:	0000                	.insn	2, 0x0000
    1104:	0001                	.insn	2, 0x0001
    1106:	485a                	.insn	2, 0x485a
    1108:	0004                	.insn	2, 0x0004
    110a:	5800                	.insn	2, 0x5800
    110c:	0004                	.insn	2, 0x0004
    110e:	0100                	.insn	2, 0x0100
    1110:	5b00                	.insn	2, 0x5b00
	...
    111a:	02f4                	.insn	2, 0x02f4
    111c:	0000                	.insn	2, 0x0000
    111e:	031c                	.insn	2, 0x031c
    1120:	0000                	.insn	2, 0x0000
    1122:	0009                	.insn	2, 0x0009
    1124:	0085                	.insn	2, 0x0085
    1126:	1011                	.insn	2, 0x1011
    1128:	111c                	.insn	2, 0x111c
    112a:	1c9f1b7f 20000003 	.insn	12, 0x0c000003200000031c9f1b7f
    1132:	0c000003 
    1136:	8500                	.insn	2, 0x8500
    1138:	1100                	.insn	2, 0x1100
    113a:	1c10                	.insn	2, 0x1c10
    113c:	7f11                	.insn	2, 0x7f11
    113e:	2201111b          	.insn	4, 0x2201111b
    1142:	289f 0003 b800      	.insn	6, 0xb8000003289f
    1148:	0004                	.insn	2, 0x0004
    114a:	0900                	.insn	2, 0x0900
    114c:	8500                	.insn	2, 0x8500
    114e:	1100                	.insn	2, 0x1100
    1150:	1c10                	.insn	2, 0x1c10
    1152:	7f11                	.insn	2, 0x7f11
    1154:	00009f1b          	.insn	4, 0x9f1b
    1158:	0000                	.insn	2, 0x0000
    115a:	0000                	.insn	2, 0x0000
    115c:	0000                	.insn	2, 0x0000
    115e:	033c                	.insn	2, 0x033c
    1160:	0000                	.insn	2, 0x0000
    1162:	0344                	.insn	2, 0x0344
    1164:	0000                	.insn	2, 0x0000
    1166:	00110003          	lb	zero,1(sp)
    116a:	449f 0003 5000      	.insn	6, 0x50000003449f
    1170:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    1174:	1100                	.insn	2, 0x1100
    1176:	9f01                	.insn	2, 0x9f01
    1178:	0350                	.insn	2, 0x0350
    117a:	0000                	.insn	2, 0x0000
    117c:	0358                	.insn	2, 0x0358
    117e:	0000                	.insn	2, 0x0000
    1180:	00110003          	lb	zero,1(sp)
    1184:	589f 0003 6c00      	.insn	6, 0x6c000003589f
    118a:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    118e:	1100                	.insn	2, 0x1100
    1190:	9f01                	.insn	2, 0x9f01
    1192:	036c                	.insn	2, 0x036c
    1194:	0000                	.insn	2, 0x0000
    1196:	0374                	.insn	2, 0x0374
    1198:	0000                	.insn	2, 0x0000
    119a:	02110003          	lb	zero,33(sp)
    119e:	749f 0003 7c00      	.insn	6, 0x7c000003749f
    11a4:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    11a8:	1100                	.insn	2, 0x1100
    11aa:	037c9f03          	lh	t5,55(s9)
    11ae:	0000                	.insn	2, 0x0000
    11b0:	0384                	.insn	2, 0x0384
    11b2:	0000                	.insn	2, 0x0000
    11b4:	04110003          	lb	zero,65(sp)
    11b8:	849f 0003 8c00      	.insn	6, 0x8c000003849f
    11be:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    11c2:	1100                	.insn	2, 0x1100
    11c4:	9f05                	.insn	2, 0x9f05
    11c6:	038c                	.insn	2, 0x038c
    11c8:	0000                	.insn	2, 0x0000
    11ca:	0394                	.insn	2, 0x0394
    11cc:	0000                	.insn	2, 0x0000
    11ce:	06110003          	lb	zero,97(sp)
    11d2:	949f 0003 9c00      	.insn	6, 0x9c000003949f
    11d8:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    11dc:	1100                	.insn	2, 0x1100
    11de:	03a89f07          	.insn	4, 0x03a89f07
    11e2:	0000                	.insn	2, 0x0000
    11e4:	03b4                	.insn	2, 0x03b4
    11e6:	0000                	.insn	2, 0x0000
    11e8:	02110003          	lb	zero,33(sp)
    11ec:	b49f 0003 c800      	.insn	6, 0xc8000003b49f
    11f2:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    11f6:	1100                	.insn	2, 0x1100
    11f8:	03c89f03          	lh	t5,60(a7)
    11fc:	0000                	.insn	2, 0x0000
    11fe:	03dc                	.insn	2, 0x03dc
    1200:	0000                	.insn	2, 0x0000
    1202:	04110003          	lb	zero,65(sp)
    1206:	dc9f 0003 f000      	.insn	6, 0xf0000003dc9f
    120c:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    1210:	1100                	.insn	2, 0x1100
    1212:	9f05                	.insn	2, 0x9f05
    1214:	03f0                	.insn	2, 0x03f0
    1216:	0000                	.insn	2, 0x0000
    1218:	0404                	.insn	2, 0x0404
    121a:	0000                	.insn	2, 0x0000
    121c:	06110003          	lb	zero,97(sp)
    1220:	049f 0004 1800      	.insn	6, 0x18000004049f
    1226:	0004                	.insn	2, 0x0004
    1228:	0300                	.insn	2, 0x0300
    122a:	1100                	.insn	2, 0x1100
    122c:	04189f07          	.insn	4, 0x04189f07
    1230:	0000                	.insn	2, 0x0000
    1232:	0420                	.insn	2, 0x0420
    1234:	0000                	.insn	2, 0x0000
    1236:	08110003          	lb	zero,129(sp)
    123a:	009f 0000 0000      	.insn	6, 0x009f
    1240:	0000                	.insn	2, 0x0000
    1242:	b800                	.insn	2, 0xb800
    1244:	0004                	.insn	2, 0x0004
    1246:	cc00                	.insn	2, 0xcc00
    1248:	0004                	.insn	2, 0x0004
    124a:	0100                	.insn	2, 0x0100
    124c:	5a00                	.insn	2, 0x5a00
	...
    1256:	051c                	.insn	2, 0x051c
    1258:	0000                	.insn	2, 0x0000
    125a:	0528                	.insn	2, 0x0528
    125c:	0000                	.insn	2, 0x0000
    125e:	0001                	.insn	2, 0x0001
    1260:	005a                	.insn	2, 0x005a
    1262:	0000                	.insn	2, 0x0000
    1264:	0000                	.insn	2, 0x0000
    1266:	0000                	.insn	2, 0x0000
    1268:	3000                	.insn	2, 0x3000
    126a:	0005                	.insn	2, 0x0005
    126c:	4400                	.insn	2, 0x4400
    126e:	0005                	.insn	2, 0x0005
    1270:	0100                	.insn	2, 0x0100
    1272:	5a00                	.insn	2, 0x5a00
	...
    127c:	05a0                	.insn	2, 0x05a0
    127e:	0000                	.insn	2, 0x0000
    1280:	05e8                	.insn	2, 0x05e8
    1282:	0000                	.insn	2, 0x0000
    1284:	0001                	.insn	2, 0x0001
    1286:	0007345b          	.insn	4, 0x0007345b
    128a:	4000                	.insn	2, 0x4000
    128c:	01000007          	.insn	4, 0x01000007
    1290:	5b00                	.insn	2, 0x5b00
	...
    129a:	05a0                	.insn	2, 0x05a0
    129c:	0000                	.insn	2, 0x0000
    129e:	05b4                	.insn	2, 0x05b4
    12a0:	0000                	.insn	2, 0x0000
    12a2:	0002                	.insn	2, 0x0002
    12a4:	9f30                	.insn	2, 0x9f30
    12a6:	05b4                	.insn	2, 0x05b4
    12a8:	0000                	.insn	2, 0x0000
    12aa:	05e8                	.insn	2, 0x05e8
    12ac:	0000                	.insn	2, 0x0000
    12ae:	0001                	.insn	2, 0x0001
    12b0:	345c                	.insn	2, 0x345c
    12b2:	40000007          	.insn	4, 0x40000007
    12b6:	02000007          	.insn	4, 0x02000007
    12ba:	3000                	.insn	2, 0x3000
    12bc:	009f 0000 0000      	.insn	6, 0x009f
    12c2:	0000                	.insn	2, 0x0000
    12c4:	a000                	.insn	2, 0xa000
    12c6:	0005                	.insn	2, 0x0005
    12c8:	e800                	.insn	2, 0xe800
    12ca:	0005                	.insn	2, 0x0005
    12cc:	0900                	.insn	2, 0x0900
    12ce:	8400                	.insn	2, 0x8400
    12d0:	1100                	.insn	2, 0x1100
    12d2:	1c10                	.insn	2, 0x1c10
    12d4:	7f11                	.insn	2, 0x7f11
    12d6:	05e89f1b          	.insn	4, 0x05e89f1b
    12da:	0000                	.insn	2, 0x0000
    12dc:	05ec                	.insn	2, 0x05ec
    12de:	0000                	.insn	2, 0x0000
    12e0:	000c                	.insn	2, 0x000c
    12e2:	0084                	.insn	2, 0x0084
    12e4:	1011                	.insn	2, 0x1011
    12e6:	111c                	.insn	2, 0x111c
    12e8:	01111b7f 05f49f22 	.insn	12, 0x0764000005f49f2201111b7f
    12f0:	07640000 
    12f4:	0000                	.insn	2, 0x0000
    12f6:	0009                	.insn	2, 0x0009
    12f8:	0084                	.insn	2, 0x0084
    12fa:	1011                	.insn	2, 0x1011
    12fc:	111c                	.insn	2, 0x111c
    12fe:	009f1b7f 00000000 	.insn	12, 0xdc00000000000000009f1b7f
    1306:	dc000000 
    130a:	0005                	.insn	2, 0x0005
    130c:	e800                	.insn	2, 0xe800
    130e:	0005                	.insn	2, 0x0005
    1310:	0100                	.insn	2, 0x0100
    1312:	5d00                	.insn	2, 0x5d00
	...
    131c:	0608                	.insn	2, 0x0608
    131e:	0000                	.insn	2, 0x0000
    1320:	060c                	.insn	2, 0x060c
    1322:	0000                	.insn	2, 0x0000
    1324:	00110003          	lb	zero,1(sp)
    1328:	0c9f 0006 1400      	.insn	6, 0x140000060c9f
    132e:	0006                	.insn	2, 0x0006
    1330:	0300                	.insn	2, 0x0300
    1332:	1100                	.insn	2, 0x1100
    1334:	9f01                	.insn	2, 0x9f01
    1336:	0614                	.insn	2, 0x0614
    1338:	0000                	.insn	2, 0x0000
    133a:	061c                	.insn	2, 0x061c
    133c:	0000                	.insn	2, 0x0000
    133e:	02110003          	lb	zero,33(sp)
    1342:	1c9f 0006 2400      	.insn	6, 0x240000061c9f
    1348:	0006                	.insn	2, 0x0006
    134a:	0300                	.insn	2, 0x0300
    134c:	1100                	.insn	2, 0x1100
    134e:	06249f03          	lh	t5,98(s1)
    1352:	0000                	.insn	2, 0x0000
    1354:	062c                	.insn	2, 0x062c
    1356:	0000                	.insn	2, 0x0000
    1358:	04110003          	lb	zero,65(sp)
    135c:	2c9f 0006 3400      	.insn	6, 0x340000062c9f
    1362:	0006                	.insn	2, 0x0006
    1364:	0300                	.insn	2, 0x0300
    1366:	1100                	.insn	2, 0x1100
    1368:	9f05                	.insn	2, 0x9f05
    136a:	0634                	.insn	2, 0x0634
    136c:	0000                	.insn	2, 0x0000
    136e:	063c                	.insn	2, 0x063c
    1370:	0000                	.insn	2, 0x0000
    1372:	06110003          	lb	zero,97(sp)
    1376:	3c9f 0006 4400      	.insn	6, 0x440000063c9f
    137c:	0006                	.insn	2, 0x0006
    137e:	0300                	.insn	2, 0x0300
    1380:	1100                	.insn	2, 0x1100
    1382:	06509f07          	.insn	4, 0x06509f07
    1386:	0000                	.insn	2, 0x0000
    1388:	0658                	.insn	2, 0x0658
    138a:	0000                	.insn	2, 0x0000
    138c:	00110003          	lb	zero,1(sp)
    1390:	589f 0006 6800      	.insn	6, 0x68000006589f
    1396:	0006                	.insn	2, 0x0006
    1398:	0300                	.insn	2, 0x0300
    139a:	1100                	.insn	2, 0x1100
    139c:	9f01                	.insn	2, 0x9f01
    139e:	0668                	.insn	2, 0x0668
    13a0:	0000                	.insn	2, 0x0000
    13a2:	0678                	.insn	2, 0x0678
    13a4:	0000                	.insn	2, 0x0000
    13a6:	02110003          	lb	zero,33(sp)
    13aa:	789f 0006 8800      	.insn	6, 0x88000006789f
    13b0:	0006                	.insn	2, 0x0006
    13b2:	0300                	.insn	2, 0x0300
    13b4:	1100                	.insn	2, 0x1100
    13b6:	06889f03          	lh	t5,104(a7)
    13ba:	0000                	.insn	2, 0x0000
    13bc:	0698                	.insn	2, 0x0698
    13be:	0000                	.insn	2, 0x0000
    13c0:	04110003          	lb	zero,65(sp)
    13c4:	989f 0006 a800      	.insn	6, 0xa8000006989f
    13ca:	0006                	.insn	2, 0x0006
    13cc:	0300                	.insn	2, 0x0300
    13ce:	1100                	.insn	2, 0x1100
    13d0:	9f05                	.insn	2, 0x9f05
    13d2:	06a8                	.insn	2, 0x06a8
    13d4:	0000                	.insn	2, 0x0000
    13d6:	06b8                	.insn	2, 0x06b8
    13d8:	0000                	.insn	2, 0x0000
    13da:	06110003          	lb	zero,97(sp)
    13de:	b89f 0006 c800      	.insn	6, 0xc8000006b89f
    13e4:	0006                	.insn	2, 0x0006
    13e6:	0300                	.insn	2, 0x0300
    13e8:	1100                	.insn	2, 0x1100
    13ea:	06c89f07          	.insn	4, 0x06c89f07
    13ee:	0000                	.insn	2, 0x0000
    13f0:	06d0                	.insn	2, 0x06d0
    13f2:	0000                	.insn	2, 0x0000
    13f4:	08110003          	lb	zero,129(sp)
    13f8:	009f 0000 0000      	.insn	6, 0x009f
    13fe:	0000                	.insn	2, 0x0000
    1400:	dc00                	.insn	2, 0xdc00
    1402:	0006                	.insn	2, 0x0006
    1404:	e400                	.insn	2, 0xe400
    1406:	0006                	.insn	2, 0x0006
    1408:	0300                	.insn	2, 0x0300
    140a:	1100                	.insn	2, 0x1100
    140c:	9f08                	.insn	2, 0x9f08
    140e:	06e4                	.insn	2, 0x06e4
    1410:	0000                	.insn	2, 0x0000
    1412:	06ec                	.insn	2, 0x06ec
    1414:	0000                	.insn	2, 0x0000
    1416:	09110003          	lb	zero,145(sp)
    141a:	ec9f 0006 fc00      	.insn	6, 0xfc000006ec9f
    1420:	0006                	.insn	2, 0x0006
    1422:	0300                	.insn	2, 0x0300
    1424:	1100                	.insn	2, 0x1100
    1426:	9f0a                	.insn	2, 0x9f0a
    1428:	0740                	.insn	2, 0x0740
    142a:	0000                	.insn	2, 0x0000
    142c:	0748                	.insn	2, 0x0748
    142e:	0000                	.insn	2, 0x0000
    1430:	08110003          	lb	zero,129(sp)
    1434:	489f 0007 5800      	.insn	6, 0x58000007489f
    143a:	03000007          	.insn	4, 0x03000007
    143e:	1100                	.insn	2, 0x1100
    1440:	9f09                	.insn	2, 0x9f09
    1442:	0758                	.insn	2, 0x0758
    1444:	0000                	.insn	2, 0x0000
    1446:	0764                	.insn	2, 0x0764
    1448:	0000                	.insn	2, 0x0000
    144a:	0a110003          	lb	zero,161(sp)
    144e:	009f 0000 0000      	.insn	6, 0x009f
    1454:	0000                	.insn	2, 0x0000
    1456:	6400                	.insn	2, 0x6400
    1458:	80000007          	.insn	4, 0x80000007
    145c:	01000007          	.insn	4, 0x01000007
    1460:	5a00                	.insn	2, 0x5a00
    1462:	0780                	.insn	2, 0x0780
    1464:	0000                	.insn	2, 0x0000
    1466:	0b84                	.insn	2, 0x0b84
    1468:	0000                	.insn	2, 0x0000
    146a:	0001                	.insn	2, 0x0001
    146c:	0058                	.insn	2, 0x0058
    146e:	0000                	.insn	2, 0x0000
    1470:	0000                	.insn	2, 0x0000
    1472:	0000                	.insn	2, 0x0000
    1474:	9c00                	.insn	2, 0x9c00
    1476:	a8000007          	.insn	4, 0xa8000007
    147a:	01000007          	.insn	4, 0x01000007
    147e:	5b00                	.insn	2, 0x5b00
	...
    1488:	07b0                	.insn	2, 0x07b0
    148a:	0000                	.insn	2, 0x0000
    148c:	0b78                	.insn	2, 0x0b78
    148e:	0000                	.insn	2, 0x0000
    1490:	0001                	.insn	2, 0x0001
    1492:	0059                	.insn	2, 0x0059
    1494:	0000                	.insn	2, 0x0000
    1496:	0000                	.insn	2, 0x0000
    1498:	0000                	.insn	2, 0x0000
    149a:	cc00                	.insn	2, 0xcc00
    149c:	d0000007          	.insn	4, 0xd0000007
    14a0:	03000007          	.insn	4, 0x03000007
    14a4:	1100                	.insn	2, 0x1100
    14a6:	9f00                	.insn	2, 0x9f00
    14a8:	07d0                	.insn	2, 0x07d0
    14aa:	0000                	.insn	2, 0x0000
    14ac:	07d4                	.insn	2, 0x07d4
    14ae:	0000                	.insn	2, 0x0000
    14b0:	01110003          	lb	zero,17(sp)
    14b4:	d49f 0007 d800      	.insn	6, 0xd8000007d49f
    14ba:	03000007          	.insn	4, 0x03000007
    14be:	1100                	.insn	2, 0x1100
    14c0:	9f02                	.insn	2, 0x9f02
    14c2:	07d8                	.insn	2, 0x07d8
    14c4:	0000                	.insn	2, 0x0000
    14c6:	07dc                	.insn	2, 0x07dc
    14c8:	0000                	.insn	2, 0x0000
    14ca:	03110003          	lb	zero,49(sp)
    14ce:	dc9f 0007 e000      	.insn	6, 0xe0000007dc9f
    14d4:	03000007          	.insn	4, 0x03000007
    14d8:	1100                	.insn	2, 0x1100
    14da:	9f04                	.insn	2, 0x9f04
    14dc:	07e0                	.insn	2, 0x07e0
    14de:	0000                	.insn	2, 0x0000
    14e0:	07e4                	.insn	2, 0x07e4
    14e2:	0000                	.insn	2, 0x0000
    14e4:	05110003          	lb	zero,81(sp)
    14e8:	e49f 0007 e800      	.insn	6, 0xe8000007e49f
    14ee:	03000007          	.insn	4, 0x03000007
    14f2:	1100                	.insn	2, 0x1100
    14f4:	9f06                	.insn	2, 0x9f06
    14f6:	07e8                	.insn	2, 0x07e8
    14f8:	0000                	.insn	2, 0x0000
    14fa:	07f0                	.insn	2, 0x07f0
    14fc:	0000                	.insn	2, 0x0000
    14fe:	07110003          	lb	zero,113(sp)
    1502:	f09f 0007 f400      	.insn	6, 0xf4000007f09f
    1508:	03000007          	.insn	4, 0x03000007
    150c:	1100                	.insn	2, 0x1100
    150e:	9f08                	.insn	2, 0x9f08
    1510:	07f4                	.insn	2, 0x07f4
    1512:	0000                	.insn	2, 0x0000
    1514:	07f8                	.insn	2, 0x07f8
    1516:	0000                	.insn	2, 0x0000
    1518:	09110003          	lb	zero,145(sp)
    151c:	f89f 0007 fc00      	.insn	6, 0xfc000007f89f
    1522:	03000007          	.insn	4, 0x03000007
    1526:	1100                	.insn	2, 0x1100
    1528:	9f0a                	.insn	2, 0x9f0a
    152a:	07fc                	.insn	2, 0x07fc
    152c:	0000                	.insn	2, 0x0000
    152e:	08b0                	.insn	2, 0x08b0
    1530:	0000                	.insn	2, 0x0000
    1532:	0b110003          	lb	zero,177(sp)
    1536:	009f 0000 0000      	.insn	6, 0x009f
    153c:	0000                	.insn	2, 0x0000
    153e:	cc00                	.insn	2, 0xcc00
    1540:	54000007          	.insn	4, 0x54000007
    1544:	0008                	.insn	2, 0x0008
    1546:	0100                	.insn	2, 0x0100
    1548:	5800                	.insn	2, 0x5800
	...
    1552:	07fc                	.insn	2, 0x07fc
    1554:	0000                	.insn	2, 0x0000
    1556:	0810                	.insn	2, 0x0810
    1558:	0000                	.insn	2, 0x0000
    155a:	00110003          	lb	zero,1(sp)
    155e:	109f 0008 2000      	.insn	6, 0x20000008109f
    1564:	0008                	.insn	2, 0x0008
    1566:	0100                	.insn	2, 0x0100
    1568:	5b00                	.insn	2, 0x5b00
    156a:	0840                	.insn	2, 0x0840
    156c:	0000                	.insn	2, 0x0000
    156e:	0848                	.insn	2, 0x0848
    1570:	0000                	.insn	2, 0x0000
    1572:	00110003          	lb	zero,1(sp)
    1576:	489f 0008 4c00      	.insn	6, 0x4c000008489f
    157c:	0008                	.insn	2, 0x0008
    157e:	0100                	.insn	2, 0x0100
    1580:	5b00                	.insn	2, 0x5b00
    1582:	0878                	.insn	2, 0x0878
    1584:	0000                	.insn	2, 0x0000
    1586:	0890                	.insn	2, 0x0890
    1588:	0000                	.insn	2, 0x0000
    158a:	08110003          	lb	zero,129(sp)
    158e:	909f 0008 9400      	.insn	6, 0x94000008909f
    1594:	0008                	.insn	2, 0x0008
    1596:	0300                	.insn	2, 0x0300
    1598:	7c00                	.insn	2, 0x7c00
    159a:	9f08                	.insn	2, 0x9f08
    159c:	0894                	.insn	2, 0x0894
    159e:	0000                	.insn	2, 0x0000
    15a0:	08ac                	.insn	2, 0x08ac
    15a2:	0000                	.insn	2, 0x0000
    15a4:	097c0003          	lb	zero,151(s8)
    15a8:	009f 0000 0000      	.insn	6, 0x009f
    15ae:	0000                	.insn	2, 0x0000
    15b0:	b000                	.insn	2, 0xb000
    15b2:	0008                	.insn	2, 0x0008
    15b4:	d000                	.insn	2, 0xd000
    15b6:	0008                	.insn	2, 0x0008
    15b8:	0300                	.insn	2, 0x0300
    15ba:	1100                	.insn	2, 0x1100
    15bc:	9f00                	.insn	2, 0x9f00
    15be:	08d0                	.insn	2, 0x08d0
    15c0:	0000                	.insn	2, 0x0000
    15c2:	08ec                	.insn	2, 0x08ec
    15c4:	0000                	.insn	2, 0x0000
    15c6:	01110003          	lb	zero,17(sp)
    15ca:	ec9f 0008 0800      	.insn	6, 0x08000008ec9f
    15d0:	0009                	.insn	2, 0x0009
    15d2:	0300                	.insn	2, 0x0300
    15d4:	1100                	.insn	2, 0x1100
    15d6:	9f02                	.insn	2, 0x9f02
    15d8:	0908                	.insn	2, 0x0908
    15da:	0000                	.insn	2, 0x0000
    15dc:	0924                	.insn	2, 0x0924
    15de:	0000                	.insn	2, 0x0000
    15e0:	03110003          	lb	zero,49(sp)
    15e4:	249f 0009 4000      	.insn	6, 0x40000009249f
    15ea:	0009                	.insn	2, 0x0009
    15ec:	0300                	.insn	2, 0x0300
    15ee:	1100                	.insn	2, 0x1100
    15f0:	9f04                	.insn	2, 0x9f04
    15f2:	0940                	.insn	2, 0x0940
    15f4:	0000                	.insn	2, 0x0000
    15f6:	095c                	.insn	2, 0x095c
    15f8:	0000                	.insn	2, 0x0000
    15fa:	05110003          	lb	zero,81(sp)
    15fe:	5c9f 0009 7800      	.insn	6, 0x780000095c9f
    1604:	0009                	.insn	2, 0x0009
    1606:	0300                	.insn	2, 0x0300
    1608:	1100                	.insn	2, 0x1100
    160a:	9f06                	.insn	2, 0x9f06
    160c:	0978                	.insn	2, 0x0978
    160e:	0000                	.insn	2, 0x0000
    1610:	0994                	.insn	2, 0x0994
    1612:	0000                	.insn	2, 0x0000
    1614:	07110003          	lb	zero,113(sp)
    1618:	949f 0009 b000      	.insn	6, 0xb0000009949f
    161e:	0009                	.insn	2, 0x0009
    1620:	0300                	.insn	2, 0x0300
    1622:	1100                	.insn	2, 0x1100
    1624:	9f08                	.insn	2, 0x9f08
    1626:	09b0                	.insn	2, 0x09b0
    1628:	0000                	.insn	2, 0x0000
    162a:	09cc                	.insn	2, 0x09cc
    162c:	0000                	.insn	2, 0x0000
    162e:	09110003          	lb	zero,145(sp)
    1632:	cc9f 0009 e800      	.insn	6, 0xe8000009cc9f
    1638:	0009                	.insn	2, 0x0009
    163a:	0300                	.insn	2, 0x0300
    163c:	1100                	.insn	2, 0x1100
    163e:	9f0a                	.insn	2, 0x9f0a
    1640:	09e8                	.insn	2, 0x09e8
    1642:	0000                	.insn	2, 0x0000
    1644:	0a04                	.insn	2, 0x0a04
    1646:	0000                	.insn	2, 0x0000
    1648:	0b110003          	lb	zero,177(sp)
    164c:	049f 000a 2000      	.insn	6, 0x2000000a049f
    1652:	000a                	.insn	2, 0x000a
    1654:	0300                	.insn	2, 0x0300
    1656:	1100                	.insn	2, 0x1100
    1658:	9f0c                	.insn	2, 0x9f0c
    165a:	0a20                	.insn	2, 0x0a20
    165c:	0000                	.insn	2, 0x0000
    165e:	0a3c                	.insn	2, 0x0a3c
    1660:	0000                	.insn	2, 0x0000
    1662:	0d110003          	lb	zero,209(sp)
    1666:	3c9f 000a 5800      	.insn	6, 0x5800000a3c9f
    166c:	000a                	.insn	2, 0x000a
    166e:	0300                	.insn	2, 0x0300
    1670:	1100                	.insn	2, 0x1100
    1672:	9f0e                	.insn	2, 0x9f0e
    1674:	0a58                	.insn	2, 0x0a58
    1676:	0000                	.insn	2, 0x0000
    1678:	0a78                	.insn	2, 0x0a78
    167a:	0000                	.insn	2, 0x0000
    167c:	0f110003          	lb	zero,241(sp)
    1680:	009f 0000 0000      	.insn	6, 0x009f
    1686:	0000                	.insn	2, 0x0000
    1688:	bc00                	.insn	2, 0xbc00
    168a:	0008                	.insn	2, 0x0008
    168c:	e000                	.insn	2, 0xe000
    168e:	0008                	.insn	2, 0x0008
    1690:	0100                	.insn	2, 0x0100
    1692:	6200                	.insn	2, 0x6200
    1694:	08e0                	.insn	2, 0x08e0
    1696:	0000                	.insn	2, 0x0000
    1698:	08f0                	.insn	2, 0x08f0
    169a:	0000                	.insn	2, 0x0000
    169c:	0001                	.insn	2, 0x0001
    169e:	fc5a                	.insn	2, 0xfc5a
    16a0:	0008                	.insn	2, 0x0008
    16a2:	0c00                	.insn	2, 0x0c00
    16a4:	0009                	.insn	2, 0x0009
    16a6:	0100                	.insn	2, 0x0100
    16a8:	5a00                	.insn	2, 0x5a00
    16aa:	0918                	.insn	2, 0x0918
    16ac:	0000                	.insn	2, 0x0000
    16ae:	0928                	.insn	2, 0x0928
    16b0:	0000                	.insn	2, 0x0000
    16b2:	0001                	.insn	2, 0x0001
    16b4:	345a                	.insn	2, 0x345a
    16b6:	0009                	.insn	2, 0x0009
    16b8:	4400                	.insn	2, 0x4400
    16ba:	0009                	.insn	2, 0x0009
    16bc:	0100                	.insn	2, 0x0100
    16be:	5a00                	.insn	2, 0x5a00
    16c0:	0950                	.insn	2, 0x0950
    16c2:	0000                	.insn	2, 0x0000
    16c4:	0960                	.insn	2, 0x0960
    16c6:	0000                	.insn	2, 0x0000
    16c8:	0001                	.insn	2, 0x0001
    16ca:	6c5a                	.insn	2, 0x6c5a
    16cc:	0009                	.insn	2, 0x0009
    16ce:	7c00                	.insn	2, 0x7c00
    16d0:	0009                	.insn	2, 0x0009
    16d2:	0100                	.insn	2, 0x0100
    16d4:	5a00                	.insn	2, 0x5a00
    16d6:	0988                	.insn	2, 0x0988
    16d8:	0000                	.insn	2, 0x0000
    16da:	0998                	.insn	2, 0x0998
    16dc:	0000                	.insn	2, 0x0000
    16de:	0001                	.insn	2, 0x0001
    16e0:	a45a                	.insn	2, 0xa45a
    16e2:	0009                	.insn	2, 0x0009
    16e4:	b400                	.insn	2, 0xb400
    16e6:	0009                	.insn	2, 0x0009
    16e8:	0100                	.insn	2, 0x0100
    16ea:	5a00                	.insn	2, 0x5a00
    16ec:	09c0                	.insn	2, 0x09c0
    16ee:	0000                	.insn	2, 0x0000
    16f0:	09d0                	.insn	2, 0x09d0
    16f2:	0000                	.insn	2, 0x0000
    16f4:	0001                	.insn	2, 0x0001
    16f6:	dc5a                	.insn	2, 0xdc5a
    16f8:	0009                	.insn	2, 0x0009
    16fa:	ec00                	.insn	2, 0xec00
    16fc:	0009                	.insn	2, 0x0009
    16fe:	0100                	.insn	2, 0x0100
    1700:	5a00                	.insn	2, 0x5a00
    1702:	09f8                	.insn	2, 0x09f8
    1704:	0000                	.insn	2, 0x0000
    1706:	0a08                	.insn	2, 0x0a08
    1708:	0000                	.insn	2, 0x0000
    170a:	0001                	.insn	2, 0x0001
    170c:	145a                	.insn	2, 0x145a
    170e:	000a                	.insn	2, 0x000a
    1710:	2400                	.insn	2, 0x2400
    1712:	000a                	.insn	2, 0x000a
    1714:	0100                	.insn	2, 0x0100
    1716:	5a00                	.insn	2, 0x5a00
    1718:	0a30                	.insn	2, 0x0a30
    171a:	0000                	.insn	2, 0x0000
    171c:	0a40                	.insn	2, 0x0a40
    171e:	0000                	.insn	2, 0x0000
    1720:	0001                	.insn	2, 0x0001
    1722:	4c5a                	.insn	2, 0x4c5a
    1724:	000a                	.insn	2, 0x000a
    1726:	5c00                	.insn	2, 0x5c00
    1728:	000a                	.insn	2, 0x000a
    172a:	0100                	.insn	2, 0x0100
    172c:	5a00                	.insn	2, 0x5a00
    172e:	0a68                	.insn	2, 0x0a68
    1730:	0000                	.insn	2, 0x0000
    1732:	0a78                	.insn	2, 0x0a78
    1734:	0000                	.insn	2, 0x0000
    1736:	0001                	.insn	2, 0x0001
    1738:	005a                	.insn	2, 0x005a
    173a:	0000                	.insn	2, 0x0000
    173c:	0000                	.insn	2, 0x0000
    173e:	0000                	.insn	2, 0x0000
    1740:	7800                	.insn	2, 0x7800
    1742:	000a                	.insn	2, 0x000a
    1744:	b800                	.insn	2, 0xb800
    1746:	000a                	.insn	2, 0x000a
    1748:	0300                	.insn	2, 0x0300
    174a:	1100                	.insn	2, 0x1100
    174c:	9f0c                	.insn	2, 0x9f0c
    174e:	0ab8                	.insn	2, 0x0ab8
    1750:	0000                	.insn	2, 0x0000
    1752:	0abc                	.insn	2, 0x0abc
    1754:	0000                	.insn	2, 0x0000
    1756:	0d110003          	lb	zero,209(sp)
    175a:	bc9f 000a c000      	.insn	6, 0xc000000abc9f
    1760:	000a                	.insn	2, 0x000a
    1762:	0300                	.insn	2, 0x0300
    1764:	1100                	.insn	2, 0x1100
    1766:	9f0e                	.insn	2, 0x9f0e
    1768:	0ac0                	.insn	2, 0x0ac0
    176a:	0000                	.insn	2, 0x0000
    176c:	0acc                	.insn	2, 0x0acc
    176e:	0000                	.insn	2, 0x0000
    1770:	0f110003          	lb	zero,241(sp)
    1774:	cc9f 000a d000      	.insn	6, 0xd000000acc9f
    177a:	000a                	.insn	2, 0x000a
    177c:	0300                	.insn	2, 0x0300
    177e:	1100                	.insn	2, 0x1100
    1780:	9f10                	.insn	2, 0x9f10
    1782:	0ad0                	.insn	2, 0x0ad0
    1784:	0000                	.insn	2, 0x0000
    1786:	0ad4                	.insn	2, 0x0ad4
    1788:	0000                	.insn	2, 0x0000
    178a:	11110003          	lb	zero,273(sp)
    178e:	d49f 000a e000      	.insn	6, 0xe000000ad49f
    1794:	000a                	.insn	2, 0x000a
    1796:	0300                	.insn	2, 0x0300
    1798:	1100                	.insn	2, 0x1100
    179a:	9f12                	.insn	2, 0x9f12
    179c:	0ae0                	.insn	2, 0x0ae0
    179e:	0000                	.insn	2, 0x0000
    17a0:	0ae4                	.insn	2, 0x0ae4
    17a2:	0000                	.insn	2, 0x0000
    17a4:	13110003          	lb	zero,305(sp)
    17a8:	e49f 000a e800      	.insn	6, 0xe800000ae49f
    17ae:	000a                	.insn	2, 0x000a
    17b0:	0300                	.insn	2, 0x0300
    17b2:	1100                	.insn	2, 0x1100
    17b4:	9f16                	.insn	2, 0x9f16
    17b6:	0ae8                	.insn	2, 0x0ae8
    17b8:	0000                	.insn	2, 0x0000
    17ba:	0af4                	.insn	2, 0x0af4
    17bc:	0000                	.insn	2, 0x0000
    17be:	17110003          	lb	zero,369(sp)
    17c2:	f49f 000a f800      	.insn	6, 0xf800000af49f
    17c8:	000a                	.insn	2, 0x000a
    17ca:	0300                	.insn	2, 0x0300
    17cc:	1100                	.insn	2, 0x1100
    17ce:	9f18                	.insn	2, 0x9f18
    17d0:	0af8                	.insn	2, 0x0af8
    17d2:	0000                	.insn	2, 0x0000
    17d4:	0afc                	.insn	2, 0x0afc
    17d6:	0000                	.insn	2, 0x0000
    17d8:	19110003          	lb	zero,401(sp)
    17dc:	fc9f 000a 6000      	.insn	6, 0x6000000afc9f
    17e2:	0300000b          	.insn	4, 0x0300000b
    17e6:	1100                	.insn	2, 0x1100
    17e8:	9f20                	.insn	2, 0x9f20
	...
    17f2:	0a88                	.insn	2, 0x0a88
    17f4:	0000                	.insn	2, 0x0000
    17f6:	0a8c                	.insn	2, 0x0a8c
    17f8:	0000                	.insn	2, 0x0000
    17fa:	01110003          	lb	zero,17(sp)
    17fe:	8c9f 000a 9000      	.insn	6, 0x9000000a8c9f
    1804:	000a                	.insn	2, 0x000a
    1806:	0300                	.insn	2, 0x0300
    1808:	1100                	.insn	2, 0x1100
    180a:	9f02                	.insn	2, 0x9f02
    180c:	0a90                	.insn	2, 0x0a90
    180e:	0000                	.insn	2, 0x0000
    1810:	0aa4                	.insn	2, 0x0aa4
    1812:	0000                	.insn	2, 0x0000
    1814:	03110003          	lb	zero,49(sp)
    1818:	a49f 000a a800      	.insn	6, 0xa800000aa49f
    181e:	000a                	.insn	2, 0x000a
    1820:	0300                	.insn	2, 0x0300
    1822:	1100                	.insn	2, 0x1100
    1824:	9f04                	.insn	2, 0x9f04
    1826:	0aa8                	.insn	2, 0x0aa8
    1828:	0000                	.insn	2, 0x0000
    182a:	0aac                	.insn	2, 0x0aac
    182c:	0000                	.insn	2, 0x0000
    182e:	05110003          	lb	zero,81(sp)
    1832:	ac9f 000a b000      	.insn	6, 0xb000000aac9f
    1838:	000a                	.insn	2, 0x000a
    183a:	0300                	.insn	2, 0x0300
    183c:	1100                	.insn	2, 0x1100
    183e:	9f06                	.insn	2, 0x9f06
    1840:	0ab0                	.insn	2, 0x0ab0
    1842:	0000                	.insn	2, 0x0000
    1844:	0ac4                	.insn	2, 0x0ac4
    1846:	0000                	.insn	2, 0x0000
    1848:	07110003          	lb	zero,113(sp)
    184c:	c49f 000a d800      	.insn	6, 0xd800000ac49f
    1852:	000a                	.insn	2, 0x000a
    1854:	0300                	.insn	2, 0x0300
    1856:	1100                	.insn	2, 0x1100
    1858:	9f08                	.insn	2, 0x9f08
    185a:	0ad8                	.insn	2, 0x0ad8
    185c:	0000                	.insn	2, 0x0000
    185e:	0aec                	.insn	2, 0x0aec
    1860:	0000                	.insn	2, 0x0000
    1862:	09110003          	lb	zero,145(sp)
    1866:	ec9f 000a fc00      	.insn	6, 0xfc00000aec9f
    186c:	000a                	.insn	2, 0x000a
    186e:	0300                	.insn	2, 0x0300
    1870:	1100                	.insn	2, 0x1100
    1872:	9f0a                	.insn	2, 0x9f0a
    1874:	0afc                	.insn	2, 0x0afc
    1876:	0000                	.insn	2, 0x0000
    1878:	0b04                	.insn	2, 0x0b04
    187a:	0000                	.insn	2, 0x0000
    187c:	00110003          	lb	zero,1(sp)
    1880:	049f 000b 6000      	.insn	6, 0x6000000b049f
    1886:	0300000b          	.insn	4, 0x0300000b
    188a:	1100                	.insn	2, 0x1100
    188c:	00009f0b          	.insn	4, 0x9f0b
    1890:	0000                	.insn	2, 0x0000
    1892:	0000                	.insn	2, 0x0000
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
 20c:	18020b3b          	.insn	4, 0x18020b3b
 210:	0000                	.insn	2, 0x0000
 212:	49010103          	lb	sp,1168(sp) # 1335ac <$d.5+0x131dbb>
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
 238:	49003407          	.insn	4, 0x49003407
 23c:	3b0b3a13          	sltiu	s4,s6,944
 240:	0205                	.insn	2, 0x0205
 242:	0018                	.insn	2, 0x0018
 244:	0800                	.insn	2, 0x0800
 246:	0016                	.insn	2, 0x0016
 248:	1349                	.insn	2, 0x1349
 24a:	0b3a0e03          	lb	t3,179(s4)
 24e:	0000053b          	.insn	4, 0x053b
 252:	1609                	.insn	2, 0x1609
 254:	4900                	.insn	2, 0x4900
 256:	3a0e0313          	addi	t1,t3,928
 25a:	000b3b0b          	.insn	4, 0x000b3b0b
 25e:	0a00                	.insn	2, 0x0a00
 260:	1349000f          	.insn	4, 0x1349000f
 264:	0000                	.insn	2, 0x0000
 266:	03012e0b          	.insn	4, 0x03012e0b
 26a:	3a0e                	.insn	2, 0x3a0e
 26c:	270b3b0b          	.insn	4, 0x270b3b0b
 270:	4919                	.insn	2, 0x4919
 272:	000b2013          	slti	zero,s6,0
 276:	0c00                	.insn	2, 0x0c00
 278:	0005                	.insn	2, 0x0005
 27a:	0b3a0e03          	lb	t3,179(s4)
 27e:	13490b3b          	.insn	4, 0x13490b3b
 282:	0000                	.insn	2, 0x0000
 284:	340d                	.insn	2, 0x340d
 286:	0300                	.insn	2, 0x0300
 288:	3a0e                	.insn	2, 0x3a0e
 28a:	490b3b0b          	.insn	4, 0x490b3b0b
 28e:	0e000013          	li	zero,224
 292:	012e                	.insn	2, 0x012e
 294:	0111                	.insn	2, 0x0111
 296:	0612                	.insn	2, 0x0612
 298:	1840                	.insn	2, 0x1840
 29a:	03194297          	auipc	t0,0x3194
 29e:	3a0e                	.insn	2, 0x3a0e
 2a0:	270b3b0b          	.insn	4, 0x270b3b0b
 2a4:	3f19                	.insn	2, 0x3f19
 2a6:	8719                	.insn	2, 0x8719
 2a8:	1901                	.insn	2, 0x1901
 2aa:	0000                	.insn	2, 0x0000
 2ac:	31011d0f          	.insn	4, 0x31011d0f
 2b0:	12011113          	.insn	4, 0x12011113
 2b4:	5806                	.insn	2, 0x5806
 2b6:	570b590b          	.insn	4, 0x570b590b
 2ba:	1000000b          	.insn	4, 0x1000000b
 2be:	0005                	.insn	2, 0x0005
 2c0:	0d1c                	.insn	2, 0x0d1c
 2c2:	1331                	.insn	2, 0x1331
 2c4:	0000                	.insn	2, 0x0000
 2c6:	3411                	.insn	2, 0x3411
 2c8:	0200                	.insn	2, 0x0200
 2ca:	00133117          	auipc	sp,0x133
 2ce:	1200                	.insn	2, 0x1200
 2d0:	0034                	.insn	2, 0x0034
 2d2:	0d1c                	.insn	2, 0x0d1c
 2d4:	1331                	.insn	2, 0x1331
 2d6:	0000                	.insn	2, 0x0000
 2d8:	03012e13          	slti	t3,sp,48
 2dc:	3a0e                	.insn	2, 0x3a0e
 2de:	27053b0b          	.insn	4, 0x27053b0b
 2e2:	4919                	.insn	2, 0x4919
 2e4:	000b2013          	slti	zero,s6,0
 2e8:	1400                	.insn	2, 0x1400
 2ea:	0005                	.insn	2, 0x0005
 2ec:	0b3a0e03          	lb	t3,179(s4)
 2f0:	1349053b          	.insn	4, 0x1349053b
 2f4:	0000                	.insn	2, 0x0000
 2f6:	3415                	.insn	2, 0x3415
 2f8:	0300                	.insn	2, 0x0300
 2fa:	3a0e                	.insn	2, 0x3a0e
 2fc:	49053b0b          	.insn	4, 0x49053b0b
 300:	16000013          	li	zero,352
 304:	012e                	.insn	2, 0x012e
 306:	0b3a0e03          	lb	t3,179(s4)
 30a:	1927053b          	.insn	4, 0x1927053b
 30e:	0b20193f 2e170000 	.insn	8, 0x2e1700000b20193f
 316:	1101                	.insn	2, 0x1101
 318:	1201                	.insn	2, 0x1201
 31a:	4006                	.insn	2, 0x4006
 31c:	9718                	.insn	2, 0x9718
 31e:	1942                	.insn	2, 0x1942
 320:	0b3a0e03          	lb	t3,179(s4)
 324:	19270b3b          	.insn	4, 0x19270b3b
 328:	0000193f 02000518 	.insn	8, 0x020005180000193f
 330:	3a0e0317          	auipc	t1,0x3a0e0
 334:	490b3b0b          	.insn	4, 0x490b3b0b
 338:	19000013          	li	zero,400
 33c:	0034                	.insn	2, 0x0034
 33e:	1802                	.insn	2, 0x1802
 340:	0b3a0e03          	lb	t3,179(s4)
 344:	13490b3b          	.insn	4, 0x13490b3b
 348:	0000                	.insn	2, 0x0000
 34a:	0b1a                	.insn	2, 0x0b1a
 34c:	1101                	.insn	2, 0x1101
 34e:	1201                	.insn	2, 0x1201
 350:	0006                	.insn	2, 0x0006
 352:	1b00                	.insn	2, 0x1b00
 354:	0034                	.insn	2, 0x0034
 356:	1702                	.insn	2, 0x1702
 358:	0b3a0e03          	lb	t3,179(s4)
 35c:	13490b3b          	.insn	4, 0x13490b3b
 360:	0000                	.insn	2, 0x0000
 362:	1d1c                	.insn	2, 0x1d1c
 364:	3101                	.insn	2, 0x3101
 366:	58175513          	.insn	4, 0x58175513
 36a:	570b590b          	.insn	4, 0x570b590b
 36e:	1d00000b          	.insn	4, 0x1d00000b
 372:	0005                	.insn	2, 0x0005
 374:	1702                	.insn	2, 0x1702
 376:	1331                	.insn	2, 0x1331
 378:	0000                	.insn	2, 0x0000
 37a:	051e                	.insn	2, 0x051e
 37c:	0200                	.insn	2, 0x0200
 37e:	3118                	.insn	2, 0x3118
 380:	1f000013          	li	zero,496
 384:	0005                	.insn	2, 0x0005
 386:	0f1c                	.insn	2, 0x0f1c
 388:	1331                	.insn	2, 0x1331
 38a:	0000                	.insn	2, 0x0000
 38c:	2e20                	.insn	2, 0x2e20
 38e:	1101                	.insn	2, 0x1101
 390:	1201                	.insn	2, 0x1201
 392:	4006                	.insn	2, 0x4006
 394:	9718                	.insn	2, 0x9718
 396:	1942                	.insn	2, 0x1942
 398:	1331                	.insn	2, 0x1331
 39a:	0000                	.insn	2, 0x0000
 39c:	3421                	.insn	2, 0x3421
 39e:	0200                	.insn	2, 0x0200
 3a0:	3118                	.insn	2, 0x3118
 3a2:	22000013          	li	zero,544
 3a6:	0034                	.insn	2, 0x0034
 3a8:	0f1c                	.insn	2, 0x0f1c
 3aa:	1331                	.insn	2, 0x1331
 3ac:	0000                	.insn	2, 0x0000
 3ae:	11012e23          	sw	a6,284(sp) # 1333e6 <$d.5+0x131bf5>
 3b2:	1201                	.insn	2, 0x1201
 3b4:	4006                	.insn	2, 0x4006
 3b6:	9718                	.insn	2, 0x9718
 3b8:	1942                	.insn	2, 0x1942
 3ba:	0b3a0e03          	lb	t3,179(s4)
 3be:	19270b3b          	.insn	4, 0x19270b3b
 3c2:	1349                	.insn	2, 0x1349
 3c4:	0000193f 31011d24 	.insn	8, 0x31011d240000193f
 3cc:	12011113          	.insn	4, 0x12011113
 3d0:	5806                	.insn	2, 0x5806
 3d2:	5705590b          	.insn	4, 0x5705590b
 3d6:	2500000b          	.insn	4, 0x2500000b
 3da:	8289                	.insn	2, 0x8289
 3dc:	0001                	.insn	2, 0x0001
 3de:	1331                	.insn	2, 0x1331
 3e0:	0111                	.insn	2, 0x0111
 3e2:	0000                	.insn	2, 0x0000
 3e4:	2e26                	.insn	2, 0x2e26
 3e6:	0301                	.insn	2, 0x0301
 3e8:	3a0e                	.insn	2, 0x3a0e
 3ea:	270b3b0b          	.insn	4, 0x270b3b0b
 3ee:	4919                	.insn	2, 0x4919
 3f0:	3f193c13          	sltiu	s8,s2,1009
 3f4:	0019                	.insn	2, 0x0019
 3f6:	2700                	.insn	2, 0x2700
 3f8:	0005                	.insn	2, 0x0005
 3fa:	1349                	.insn	2, 0x1349
 3fc:	0000                	.insn	2, 0x0000
 3fe:	2628                	.insn	2, 0x2628
 400:	4900                	.insn	2, 0x4900
 402:	29000013          	li	zero,656
 406:	012e                	.insn	2, 0x012e
 408:	0111                	.insn	2, 0x0111
 40a:	0612                	.insn	2, 0x0612
 40c:	1840                	.insn	2, 0x1840
 40e:	03194297          	auipc	t0,0x3194
 412:	3a0e                	.insn	2, 0x3a0e
 414:	27053b0b          	.insn	4, 0x27053b0b
 418:	3f19                	.insn	2, 0x3f19
 41a:	0019                	.insn	2, 0x0019
 41c:	2a00                	.insn	2, 0x2a00
 41e:	0005                	.insn	2, 0x0005
 420:	1702                	.insn	2, 0x1702
 422:	0b3a0e03          	lb	t3,179(s4)
 426:	1349053b          	.insn	4, 0x1349053b
 42a:	0000                	.insn	2, 0x0000
 42c:	0200342b          	.insn	4, 0x0200342b
 430:	0318                	.insn	2, 0x0318
 432:	3a0e                	.insn	2, 0x3a0e
 434:	49053b0b          	.insn	4, 0x49053b0b
 438:	2c000013          	li	zero,704
 43c:	000a                	.insn	2, 0x000a
 43e:	0b3a0e03          	lb	t3,179(s4)
 442:	0111053b          	.insn	4, 0x0111053b
 446:	0000                	.insn	2, 0x0000
 448:	0b2d                	.insn	2, 0x0b2d
 44a:	5501                	.insn	2, 0x5501
 44c:	2e000017          	auipc	zero,0x2e000
 450:	0034                	.insn	2, 0x0034
 452:	1702                	.insn	2, 0x1702
 454:	0b3a0e03          	lb	t3,179(s4)
 458:	1349053b          	.insn	4, 0x1349053b
 45c:	0000                	.insn	2, 0x0000
 45e:	31001d2f          	.insn	4, 0x31001d2f
 462:	12011113          	.insn	4, 0x12011113
 466:	5806                	.insn	2, 0x5806
 468:	5705590b          	.insn	4, 0x5705590b
 46c:	3000000b          	.insn	4, 0x3000000b
 470:	001d                	.insn	2, 0x001d
 472:	1331                	.insn	2, 0x1331
 474:	1755                	.insn	2, 0x1755
 476:	0b58                	.insn	2, 0x0b58
 478:	0559                	.insn	2, 0x0559
 47a:	00000b57          	.insn	4, 0x0b57
 47e:	1831                	.insn	2, 0x1831
 480:	0000                	.insn	2, 0x0000
 482:	3200                	.insn	2, 0x3200
 484:	012e                	.insn	2, 0x012e
 486:	0111                	.insn	2, 0x0111
 488:	0612                	.insn	2, 0x0612
 48a:	1840                	.insn	2, 0x1840
 48c:	03194297          	auipc	t0,0x3194
 490:	3a0e                	.insn	2, 0x3a0e
 492:	27053b0b          	.insn	4, 0x27053b0b
 496:	4919                	.insn	2, 0x4919
 498:	00193f13          	seqz	t5,s2
 49c:	3300                	.insn	2, 0x3300
 49e:	0005                	.insn	2, 0x0005
 4a0:	1802                	.insn	2, 0x1802
 4a2:	0b3a0e03          	lb	t3,179(s4)
 4a6:	1349053b          	.insn	4, 0x1349053b
 4aa:	0000                	.insn	2, 0x0000
 4ac:	2e34                	.insn	2, 0x2e34
 4ae:	0301                	.insn	2, 0x0301
 4b0:	3a0e                	.insn	2, 0x3a0e
 4b2:	27053b0b          	.insn	4, 0x27053b0b
 4b6:	2019                	.insn	2, 0x2019
 4b8:	3500000b          	.insn	4, 0x3500000b
 4bc:	0034                	.insn	2, 0x0034
 4be:	0f1c                	.insn	2, 0x0f1c
 4c0:	0b3a0e03          	lb	t3,179(s4)
 4c4:	1349053b          	.insn	4, 0x1349053b
 4c8:	0000                	.insn	2, 0x0000
 4ca:	2e36                	.insn	2, 0x2e36
 4cc:	1100                	.insn	2, 0x1100
 4ce:	1201                	.insn	2, 0x1201
 4d0:	4006                	.insn	2, 0x4006
 4d2:	9718                	.insn	2, 0x9718
 4d4:	1942                	.insn	2, 0x1942
 4d6:	0b3a0e03          	lb	t3,179(s4)
 4da:	1927053b          	.insn	4, 0x1927053b
 4de:	0000193f 49001637 	.insn	8, 0x490016370000193f
 4e6:	000e0313          	mv	t1,t3
 4ea:	3800                	.insn	2, 0x3800
 4ec:	0000000f          	fence	unknown,unknown
	...

000004f1 <$d.4>:
 4f1:	1101                	.insn	2, 0x1101
 4f3:	2501                	.insn	2, 0x2501
 4f5:	130e                	.insn	2, 0x130e
 4f7:	0305                	.insn	2, 0x0305
 4f9:	100e                	.insn	2, 0x100e
 4fb:	110e1b17          	auipc	s6,0x110e1
 4ff:	1201                	.insn	2, 0x1201
 501:	0006                	.insn	2, 0x0006
 503:	0200                	.insn	2, 0x0200
 505:	0034                	.insn	2, 0x0034
 507:	1349                	.insn	2, 0x1349
 509:	0b3a                	.insn	2, 0x0b3a
 50b:	18020b3b          	.insn	4, 0x18020b3b
 50f:	0000                	.insn	2, 0x0000
 511:	49010103          	lb	sp,1168(sp)
 515:	04000013          	li	zero,64
 519:	0021                	.insn	2, 0x0021
 51b:	1349                	.insn	2, 0x1349
 51d:	00000b37          	lui	s6,0x0
 521:	2405                	.insn	2, 0x2405
 523:	0300                	.insn	2, 0x0300
 525:	3e0e                	.insn	2, 0x3e0e
 527:	000b0b0b          	.insn	4, 0x000b0b0b
 52b:	0600                	.insn	2, 0x0600
 52d:	0024                	.insn	2, 0x0024
 52f:	0b0b0e03          	lb	t3,176(s6) # b0 <$d.10+0x3c>
 533:	0b3e                	.insn	2, 0x0b3e
 535:	0000                	.insn	2, 0x0000
 537:	49003407          	.insn	4, 0x49003407
 53b:	3b0b3a13          	sltiu	s4,s6,944
 53f:	0205                	.insn	2, 0x0205
 541:	0018                	.insn	2, 0x0018
 543:	0800                	.insn	2, 0x0800
 545:	0034                	.insn	2, 0x0034
 547:	13490e03          	lb	t3,308(s2)
 54b:	0b3a                	.insn	2, 0x0b3a
 54d:	18020b3b          	.insn	4, 0x18020b3b
 551:	0000                	.insn	2, 0x0000
 553:	2109                	.insn	2, 0x2109
 555:	4900                	.insn	2, 0x4900
 557:	00053713          	sltiu	a4,a0,0
 55b:	0a00                	.insn	2, 0x0a00
 55d:	0016                	.insn	2, 0x0016
 55f:	1349                	.insn	2, 0x1349
 561:	0b3a0e03          	lb	t3,179(s4)
 565:	00000b3b          	.insn	4, 0x0b3b
 569:	0300340b          	.insn	4, 0x0300340b
 56d:	490e                	.insn	2, 0x490e
 56f:	3a193f13          	sltiu	t5,s2,929
 573:	020b3b0b          	.insn	4, 0x020b3b0b
 577:	0018                	.insn	2, 0x0018
 579:	0c00                	.insn	2, 0x0c00
 57b:	0b0b0113          	addi	sp,s6,176
 57f:	0b3a                	.insn	2, 0x0b3a
 581:	00000b3b          	.insn	4, 0x0b3b
 585:	0d0d                	.insn	2, 0x0d0d
 587:	0300                	.insn	2, 0x0300
 589:	490e                	.insn	2, 0x490e
 58b:	3b0b3a13          	sltiu	s4,s6,944
 58f:	000b380b          	.insn	4, 0x000b380b
 593:	0e00                	.insn	2, 0x0e00
 595:	012e                	.insn	2, 0x012e
 597:	0b3a0e03          	lb	t3,179(s4)
 59b:	19270b3b          	.insn	4, 0x19270b3b
 59f:	1349                	.insn	2, 0x1349
 5a1:	0b20193f 050f0000 	.insn	8, 0x050f00000b20193f
 5a9:	0300                	.insn	2, 0x0300
 5ab:	3a0e                	.insn	2, 0x3a0e
 5ad:	490b3b0b          	.insn	4, 0x490b3b0b
 5b1:	10000013          	li	zero,256
 5b5:	012e                	.insn	2, 0x012e
 5b7:	0111                	.insn	2, 0x0111
 5b9:	0612                	.insn	2, 0x0612
 5bb:	1840                	.insn	2, 0x1840
 5bd:	03194297          	auipc	t0,0x3194
 5c1:	3a0e                	.insn	2, 0x3a0e
 5c3:	270b3b0b          	.insn	4, 0x270b3b0b
 5c7:	4919                	.insn	2, 0x4919
 5c9:	00193f13          	seqz	t5,s2
 5cd:	1100                	.insn	2, 0x1100
 5cf:	0005                	.insn	2, 0x0005
 5d1:	1702                	.insn	2, 0x1702
 5d3:	0b3a0e03          	lb	t3,179(s4)
 5d7:	13490b3b          	.insn	4, 0x13490b3b
 5db:	0000                	.insn	2, 0x0000
 5dd:	3412                	.insn	2, 0x3412
 5df:	0200                	.insn	2, 0x0200
 5e1:	0318                	.insn	2, 0x0318
 5e3:	3a0e                	.insn	2, 0x3a0e
 5e5:	490b3b0b          	.insn	4, 0x490b3b0b
 5e9:	13000013          	li	zero,304
 5ed:	0034                	.insn	2, 0x0034
 5ef:	1702                	.insn	2, 0x1702
 5f1:	0b3a0e03          	lb	t3,179(s4)
 5f5:	13490b3b          	.insn	4, 0x13490b3b
 5f9:	0000                	.insn	2, 0x0000
 5fb:	1d14                	.insn	2, 0x1d14
 5fd:	3101                	.insn	2, 0x3101
 5ff:	12011113          	.insn	4, 0x12011113
 603:	5806                	.insn	2, 0x5806
 605:	570b590b          	.insn	4, 0x570b590b
 609:	1500000b          	.insn	4, 0x1500000b
 60d:	0005                	.insn	2, 0x0005
 60f:	1702                	.insn	2, 0x1702
 611:	1331                	.insn	2, 0x1331
 613:	0000                	.insn	2, 0x0000
 615:	0b16                	.insn	2, 0x0b16
 617:	1101                	.insn	2, 0x1101
 619:	1201                	.insn	2, 0x1201
 61b:	0006                	.insn	2, 0x0006
 61d:	1700                	.insn	2, 0x1700
 61f:	8289                	.insn	2, 0x8289
 621:	0001                	.insn	2, 0x0001
 623:	1331                	.insn	2, 0x1331
 625:	0111                	.insn	2, 0x0111
 627:	0000                	.insn	2, 0x0000
 629:	3418                	.insn	2, 0x3418
 62b:	0300                	.insn	2, 0x0300
 62d:	3a0e                	.insn	2, 0x3a0e
 62f:	490b3b0b          	.insn	4, 0x490b3b0b
 633:	19000013          	li	zero,400
 637:	1755010b          	.insn	4, 0x1755010b
 63b:	0000                	.insn	2, 0x0000
 63d:	2e1a                	.insn	2, 0x2e1a
 63f:	0301                	.insn	2, 0x0301
 641:	3a0e                	.insn	2, 0x3a0e
 643:	270b3b0b          	.insn	4, 0x270b3b0b
 647:	3c19                	.insn	2, 0x3c19
 649:	3f19                	.insn	2, 0x3f19
 64b:	0019                	.insn	2, 0x0019
 64d:	1b00                	.insn	2, 0x1b00
 64f:	0005                	.insn	2, 0x0005
 651:	1349                	.insn	2, 0x1349
 653:	0000                	.insn	2, 0x0000
 655:	181c                	.insn	2, 0x181c
 657:	0000                	.insn	2, 0x0000
 659:	1d00                	.insn	2, 0x1d00
 65b:	1349000f          	.insn	4, 0x1349000f
 65f:	0000                	.insn	2, 0x0000
 661:	261e                	.insn	2, 0x261e
 663:	4900                	.insn	2, 0x4900
 665:	1f000013          	li	zero,496
 669:	012e                	.insn	2, 0x012e
 66b:	0b3a0e03          	lb	t3,179(s4)
 66f:	19270b3b          	.insn	4, 0x19270b3b
 673:	1349                	.insn	2, 0x1349
 675:	193c                	.insn	2, 0x193c
 677:	0000193f 00000f20 	.insn	8, 0x0f200000193f
 67f:	2100                	.insn	2, 0x2100
 681:	012e                	.insn	2, 0x012e
 683:	0111                	.insn	2, 0x0111
 685:	0612                	.insn	2, 0x0612
 687:	1840                	.insn	2, 0x1840
 689:	31194297          	auipc	t0,0x31194
 68d:	22000013          	li	zero,544
 691:	012e                	.insn	2, 0x012e
 693:	0111                	.insn	2, 0x0111
 695:	0612                	.insn	2, 0x0612
 697:	1840                	.insn	2, 0x1840
 699:	03194297          	auipc	t0,0x3194
 69d:	3a0e                	.insn	2, 0x3a0e
 69f:	270b3b0b          	.insn	4, 0x270b3b0b
 6a3:	3f19                	.insn	2, 0x3f19
 6a5:	0019                	.insn	2, 0x0019
 6a7:	2300                	.insn	2, 0x2300
 6a9:	0005                	.insn	2, 0x0005
 6ab:	1802                	.insn	2, 0x1802
 6ad:	1331                	.insn	2, 0x1331
 6af:	0000                	.insn	2, 0x0000
 6b1:	2e24                	.insn	2, 0x2e24
 6b3:	0301                	.insn	2, 0x0301
 6b5:	3a0e                	.insn	2, 0x3a0e
 6b7:	270b3b0b          	.insn	4, 0x270b3b0b
 6bb:	4919                	.insn	2, 0x4919
 6bd:	000b2013          	slti	zero,s6,0
 6c1:	2500                	.insn	2, 0x2500
 6c3:	0034                	.insn	2, 0x0034
 6c5:	0b3a0e03          	lb	t3,179(s4)
 6c9:	1349053b          	.insn	4, 0x1349053b
 6cd:	0000                	.insn	2, 0x0000
 6cf:	2e26                	.insn	2, 0x2e26
 6d1:	1101                	.insn	2, 0x1101
 6d3:	1201                	.insn	2, 0x1201
 6d5:	4006                	.insn	2, 0x4006
 6d7:	9718                	.insn	2, 0x9718
 6d9:	1942                	.insn	2, 0x1942
 6db:	0b3a0e03          	lb	t3,179(s4)
 6df:	1927053b          	.insn	4, 0x1927053b
 6e3:	1349                	.insn	2, 0x1349
 6e5:	0000193f 02000527 	.insn	8, 0x020005270000193f
 6ed:	3a0e0317          	auipc	t1,0x3a0e0
 6f1:	49053b0b          	.insn	4, 0x49053b0b
 6f5:	28000013          	li	zero,640
 6f9:	0034                	.insn	2, 0x0034
 6fb:	1802                	.insn	2, 0x1802
 6fd:	0b3a0e03          	lb	t3,179(s4)
 701:	1349053b          	.insn	4, 0x1349053b
 705:	0000                	.insn	2, 0x0000
 707:	3429                	.insn	2, 0x3429
 709:	0200                	.insn	2, 0x0200
 70b:	3a0e0317          	auipc	t1,0x3a0e0
 70f:	49053b0b          	.insn	4, 0x49053b0b
 713:	2a000013          	li	zero,672
 717:	011d                	.insn	2, 0x011d
 719:	1331                	.insn	2, 0x1331
 71b:	0111                	.insn	2, 0x0111
 71d:	0612                	.insn	2, 0x0612
 71f:	0b58                	.insn	2, 0x0b58
 721:	0559                	.insn	2, 0x0559
 723:	00000b57          	.insn	4, 0x0b57
 727:	0200342b          	.insn	4, 0x0200342b
 72b:	00133117          	auipc	sp,0x133
	...

セクション .debug_info の逆アセンブル:

00000000 <$d.4>:
       0:	0a14                	.insn	2, 0x0a14
       2:	0000                	.insn	2, 0x0000
       4:	0004                	.insn	2, 0x0004
       6:	0000                	.insn	2, 0x0000
       8:	0000                	.insn	2, 0x0000
       a:	0104                	.insn	2, 0x0104
       c:	0171                	.insn	2, 0x0171
       e:	0000                	.insn	2, 0x0000
      10:	001d                	.insn	2, 0x001d
      12:	00000213          	li	tp,0
      16:	0000                	.insn	2, 0x0000
      18:	0000                	.insn	2, 0x0000
      1a:	027e                	.insn	2, 0x027e
      1c:	0000                	.insn	2, 0x0000
      1e:	001c                	.insn	2, 0x001c
      20:	0040                	.insn	2, 0x0040
      22:	0b18                	.insn	2, 0x0b18
      24:	0000                	.insn	2, 0x0000
      26:	3302                	.insn	2, 0x3302
      28:	0000                	.insn	2, 0x0000
      2a:	0100                	.insn	2, 0x0100
      2c:	5603050f          	.insn	4, 0x5603050f
      30:	03004023          	.insn	4, 0x03004023
      34:	0000003f 00004604 	.insn	8, 0x46040000003f
      3c:	0e00                	.insn	2, 0x0e00
      3e:	0500                	.insn	2, 0x0500
      40:	025d                	.insn	2, 0x025d
      42:	0000                	.insn	2, 0x0000
      44:	0108                	.insn	2, 0x0108
      46:	4e06                	.insn	2, 0x4e06
      48:	08000003          	lb	zero,128(zero) # 80 <$d.10+0xc>
      4c:	005a0207          	.insn	4, 0x005a0207
      50:	0000                	.insn	2, 0x0000
      52:	3a01                	.insn	2, 0x3a01
      54:	0305                	.insn	2, 0x0305
      56:	00402297          	auipc	t0,0x402
      5a:	00003f03          	.insn	4, 0x3f03
      5e:	0400                	.insn	2, 0x0400
      60:	0046                	.insn	2, 0x0046
      62:	0000                	.insn	2, 0x0000
      64:	000d                	.insn	2, 0x000d
      66:	5a02                	.insn	2, 0x5a02
      68:	0000                	.insn	2, 0x0000
      6a:	0100                	.insn	2, 0x0100
      6c:	6703053f 02004021 	.insn	8, 0x020040216703053f
      74:	0080                	.insn	2, 0x0080
      76:	0000                	.insn	2, 0x0000
      78:	9001                	.insn	2, 0x9001
      7a:	0305                	.insn	2, 0x0305
      7c:	2291                	.insn	2, 0x2291
      7e:	0040                	.insn	2, 0x0040
      80:	00003f03          	.insn	4, 0x3f03
      84:	0400                	.insn	2, 0x0400
      86:	0046                	.insn	2, 0x0046
      88:	0000                	.insn	2, 0x0000
      8a:	0006                	.insn	2, 0x0006
      8c:	9902                	.insn	2, 0x9902
      8e:	0000                	.insn	2, 0x0000
      90:	0100                	.insn	2, 0x0100
      92:	0591                	.insn	2, 0x0591
      94:	40220c03          	lb	s8,1026(tp) # 402 <$d.6+0x17a>
      98:	0300                	.insn	2, 0x0300
      9a:	0000003f 00004604 	.insn	8, 0x46040000003f
      a2:	1900                	.insn	2, 0x1900
      a4:	0200                	.insn	2, 0x0200
      a6:	00b2                	.insn	2, 0x00b2
      a8:	0000                	.insn	2, 0x0000
      aa:	9401                	.insn	2, 0x9401
      ac:	0305                	.insn	2, 0x0305
      ae:	2364                	.insn	2, 0x2364
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
      c6:	40223003          	.insn	4, 0x40223003
      ca:	0300                	.insn	2, 0x0300
      cc:	0000003f 00004604 	.insn	8, 0x46040000003f
      d4:	0700                	.insn	2, 0x0700
      d6:	0200                	.insn	2, 0x0200
      d8:	00e4                	.insn	2, 0x00e4
      da:	0000                	.insn	2, 0x0000
      dc:	b601                	.insn	2, 0xb601
      de:	0305                	.insn	2, 0x0305
      e0:	004023d3          	.insn	4, 0x004023d3
      e4:	00003f03          	.insn	4, 0x3f03
      e8:	0400                	.insn	2, 0x0400
      ea:	0046                	.insn	2, 0x0046
      ec:	0000                	.insn	2, 0x0000
      ee:	001a                	.insn	2, 0x001a
      f0:	fd02                	.insn	2, 0xfd02
      f2:	0000                	.insn	2, 0x0000
      f4:	0100                	.insn	2, 0x0100
      f6:	05bd                	.insn	2, 0x05bd
      f8:	40220203          	lb	tp,1026(tp) # 402 <$d.6+0x17a>
      fc:	0300                	.insn	2, 0x0300
      fe:	0000003f 00004604 	.insn	8, 0x46040000003f
     106:	0a00                	.insn	2, 0x0a00
     108:	0200                	.insn	2, 0x0200
     10a:	0116                	.insn	2, 0x0116
     10c:	0000                	.insn	2, 0x0000
     10e:	c201                	.insn	2, 0xc201
     110:	0305                	.insn	2, 0x0305
     112:	2266                	.insn	2, 0x2266
     114:	0040                	.insn	2, 0x0040
     116:	00003f03          	.insn	4, 0x3f03
     11a:	0400                	.insn	2, 0x0400
     11c:	0046                	.insn	2, 0x0046
     11e:	0000                	.insn	2, 0x0000
     120:	0009                	.insn	2, 0x0009
     122:	2f02                	.insn	2, 0x2f02
     124:	0001                	.insn	2, 0x0001
     126:	0100                	.insn	2, 0x0100
     128:	a40305c7          	.insn	4, 0xa40305c7
     12c:	4022                	.insn	2, 0x4022
     12e:	0300                	.insn	2, 0x0300
     130:	0000003f 00004604 	.insn	8, 0x46040000003f
     138:	1100                	.insn	2, 0x1100
     13a:	0200                	.insn	2, 0x0200
     13c:	0116                	.insn	2, 0x0116
     13e:	0000                	.insn	2, 0x0000
     140:	cf01                	.insn	2, 0xcf01
     142:	0305                	.insn	2, 0x0305
     144:	231a                	.insn	2, 0x231a
     146:	0040                	.insn	2, 0x0040
     148:	9902                	.insn	2, 0x9902
     14a:	0000                	.insn	2, 0x0000
     14c:	0100                	.insn	2, 0x0100
     14e:	05d1                	.insn	2, 0x05d1
     150:	4022fa03          	.insn	4, 0x4022fa03
     154:	0200                	.insn	2, 0x0200
     156:	00fd                	.insn	2, 0x00fd
     158:	0000                	.insn	2, 0x0000
     15a:	d901                	.insn	2, 0xd901
     15c:	0305                	.insn	2, 0x0305
     15e:	22c0                	.insn	2, 0x22c0
     160:	0040                	.insn	2, 0x0040
     162:	e402                	.insn	2, 0xe402
     164:	0000                	.insn	2, 0x0000
     166:	0100                	.insn	2, 0x0100
     168:	690305db          	.insn	4, 0x690305db
     16c:	02004023          	.insn	4, 0x02004023
     170:	017c                	.insn	2, 0x017c
     172:	0000                	.insn	2, 0x0000
     174:	e401                	.insn	2, 0xe401
     176:	0305                	.insn	2, 0x0305
     178:	21d6                	.insn	2, 0x21d6
     17a:	0040                	.insn	2, 0x0040
     17c:	00003f03          	.insn	4, 0x3f03
     180:	0400                	.insn	2, 0x0400
     182:	0046                	.insn	2, 0x0046
     184:	0000                	.insn	2, 0x0000
     186:	0008                	.insn	2, 0x0008
     188:	9902                	.insn	2, 0x9902
     18a:	0000                	.insn	2, 0x0000
     18c:	0100                	.insn	2, 0x0100
     18e:	05e6                	.insn	2, 0x05e6
     190:	4023ba03          	.insn	4, 0x4023ba03
     194:	0200                	.insn	2, 0x0200
     196:	0116                	.insn	2, 0x0116
     198:	0000                	.insn	2, 0x0000
     19a:	ee01                	.insn	2, 0xee01
     19c:	0305                	.insn	2, 0x0305
     19e:	21de                	.insn	2, 0x21de
     1a0:	0040                	.insn	2, 0x0040
     1a2:	e402                	.insn	2, 0xe402
     1a4:	0000                	.insn	2, 0x0000
     1a6:	0100                	.insn	2, 0x0100
     1a8:	05f0                	.insn	2, 0x05f0
     1aa:	40240203          	lb	tp,1026(s0)
     1ae:	0200                	.insn	2, 0x0200
     1b0:	01bc                	.insn	2, 0x01bc
     1b2:	0000                	.insn	2, 0x0000
     1b4:	f601                	.insn	2, 0xf601
     1b6:	0305                	.insn	2, 0x0305
     1b8:	21ae                	.insn	2, 0x21ae
     1ba:	0040                	.insn	2, 0x0040
     1bc:	00003f03          	.insn	4, 0x3f03
     1c0:	0400                	.insn	2, 0x0400
     1c2:	0046                	.insn	2, 0x0046
     1c4:	0000                	.insn	2, 0x0000
     1c6:	001f d502 0001      	.insn	6, 0x0001d502001f
     1cc:	0100                	.insn	2, 0x0100
     1ce:	05fc                	.insn	2, 0x05fc
     1d0:	40226f03          	.insn	4, 0x40226f03
     1d4:	0300                	.insn	2, 0x0300
     1d6:	0000003f 00004604 	.insn	8, 0x46040000003f
     1de:	0b00                	.insn	2, 0x0b00
     1e0:	0200                	.insn	2, 0x0200
     1e2:	01ee                	.insn	2, 0x01ee
     1e4:	0000                	.insn	2, 0x0000
     1e6:	ff01                	.insn	2, 0xff01
     1e8:	0305                	.insn	2, 0x0305
     1ea:	22ca                	.insn	2, 0x22ca
     1ec:	0040                	.insn	2, 0x0040
     1ee:	00003f03          	.insn	4, 0x3f03
     1f2:	0400                	.insn	2, 0x0400
     1f4:	0046                	.insn	2, 0x0046
     1f6:	0000                	.insn	2, 0x0000
     1f8:	0014                	.insn	2, 0x0014
     1fa:	00005a07          	.insn	4, 0x5a07
     1fe:	0100                	.insn	2, 0x0100
     200:	03050103          	lb	sp,48(a0)
     204:	241c                	.insn	2, 0x241c
     206:	0040                	.insn	2, 0x0040
     208:	00012f07          	.insn	4, 0x00012f07
     20c:	0100                	.insn	2, 0x0100
     20e:	0104                	.insn	2, 0x0104
     210:	0305                	.insn	2, 0x0305
     212:	00402343          	.insn	4, 0x00402343
     216:	00017c07          	.insn	4, 0x00017c07
     21a:	0100                	.insn	2, 0x0100
     21c:	0105                	.insn	2, 0x0105
     21e:	0305                	.insn	2, 0x0305
     220:	00402383          	lw	t2,4(zero) # 4 <$d.4+0x4>
     224:	00003307          	.insn	4, 0x3307
     228:	0100                	.insn	2, 0x0100
     22a:	0106                	.insn	2, 0x0106
     22c:	0305                	.insn	2, 0x0305
     22e:	0040239b          	.insn	4, 0x0040239b
     232:	00024007          	.insn	4, 0x00024007
     236:	0100                	.insn	2, 0x0100
     238:	03050107          	.insn	4, 0x03050107
     23c:	004022eb          	.insn	4, 0x004022eb
     240:	00003f03          	.insn	4, 0x3f03
     244:	0400                	.insn	2, 0x0400
     246:	0046                	.insn	2, 0x0046
     248:	0000                	.insn	2, 0x0000
     24a:	1607000f          	.insn	4, 0x1607000f
     24e:	0001                	.insn	2, 0x0001
     250:	0100                	.insn	2, 0x0100
     252:	010a                	.insn	2, 0x010a
     254:	0305                	.insn	2, 0x0305
     256:	2174                	.insn	2, 0x2174
     258:	0040                	.insn	2, 0x0040
     25a:	0000fd07          	.insn	4, 0xfd07
     25e:	0100                	.insn	2, 0x0100
     260:	0305010f          	.insn	4, 0x0305010f
     264:	217d                	.insn	2, 0x217d
     266:	0040                	.insn	2, 0x0040
     268:	00009907          	.insn	4, 0x9907
     26c:	0100                	.insn	2, 0x0100
     26e:	0112                	.insn	2, 0x0112
     270:	0305                	.insn	2, 0x0305
     272:	2130                	.insn	2, 0x2130
     274:	0040                	.insn	2, 0x0040
     276:	00028407          	.insn	4, 0x00028407
     27a:	0100                	.insn	2, 0x0100
     27c:	0119                	.insn	2, 0x0119
     27e:	0305                	.insn	2, 0x0305
     280:	0040238b          	.insn	4, 0x0040238b
     284:	00003f03          	.insn	4, 0x3f03
     288:	0400                	.insn	2, 0x0400
     28a:	0046                	.insn	2, 0x0046
     28c:	0000                	.insn	2, 0x0000
     28e:	000c                	.insn	2, 0x000c
     290:	00029e07          	.insn	4, 0x00029e07
     294:	0100                	.insn	2, 0x0100
     296:	011c                	.insn	2, 0x011c
     298:	0305                	.insn	2, 0x0305
     29a:	004021e7          	.insn	4, 0x004021e7
     29e:	00003f03          	.insn	4, 0x3f03
     2a2:	0400                	.insn	2, 0x0400
     2a4:	0046                	.insn	2, 0x0046
     2a6:	0000                	.insn	2, 0x0000
     2a8:	ee07001b          	.insn	4, 0xee07001b
     2ac:	0001                	.insn	2, 0x0001
     2ae:	0100                	.insn	2, 0x0100
     2b0:	0121                	.insn	2, 0x0121
     2b2:	0305                	.insn	2, 0x0305
     2b4:	00402187          	.insn	4, 0x00402187
     2b8:	0000b207          	.insn	4, 0xb207
     2bc:	0100                	.insn	2, 0x0100
     2be:	0125                	.insn	2, 0x0125
     2c0:	0305                	.insn	2, 0x0305
     2c2:	2315                	.insn	2, 0x2315
     2c4:	0040                	.insn	2, 0x0040
     2c6:	0001d507          	.insn	4, 0x0001d507
     2ca:	0100                	.insn	2, 0x0100
     2cc:	0126                	.insn	2, 0x0126
     2ce:	0305                	.insn	2, 0x0305
     2d0:	22b5                	.insn	2, 0x22b5
     2d2:	0040                	.insn	2, 0x0040
     2d4:	0000b207          	.insn	4, 0xb207
     2d8:	0100                	.insn	2, 0x0100
     2da:	0130                	.insn	2, 0x0130
     2dc:	0305                	.insn	2, 0x0305
     2de:	2429                	.insn	2, 0x2429
     2e0:	0040                	.insn	2, 0x0040
     2e2:	0000b207          	.insn	4, 0xb207
     2e6:	0100                	.insn	2, 0x0100
     2e8:	0131                	.insn	2, 0x0131
     2ea:	0305                	.insn	2, 0x0305
     2ec:	23ed                	.insn	2, 0x23ed
     2ee:	0040                	.insn	2, 0x0040
     2f0:	0002fe07          	.insn	4, 0x0002fe07
     2f4:	0100                	.insn	2, 0x0100
     2f6:	0132                	.insn	2, 0x0132
     2f8:	0305                	.insn	2, 0x0305
     2fa:	2354                	.insn	2, 0x2354
     2fc:	0040                	.insn	2, 0x0040
     2fe:	00003f03          	.insn	4, 0x3f03
     302:	0400                	.insn	2, 0x0400
     304:	0046                	.insn	2, 0x0046
     306:	0000                	.insn	2, 0x0000
     308:	0002                	.insn	2, 0x0002
     30a:	00031807          	.insn	4, 0x00031807
     30e:	0100                	.insn	2, 0x0100
     310:	0136                	.insn	2, 0x0136
     312:	0305                	.insn	2, 0x0305
     314:	00402237          	lui	tp,0x402
     318:	00003f03          	.insn	4, 0x3f03
     31c:	0400                	.insn	2, 0x0400
     31e:	0046                	.insn	2, 0x0046
     320:	0000                	.insn	2, 0x0000
     322:	0015                	.insn	2, 0x0015
     324:	00033207          	.insn	4, 0x00033207
     328:	0100                	.insn	2, 0x0100
     32a:	0141                	.insn	2, 0x0141
     32c:	0305                	.insn	2, 0x0305
     32e:	00402397          	auipc	t2,0x402
     332:	00003f03          	.insn	4, 0x3f03
     336:	0400                	.insn	2, 0x0400
     338:	0046                	.insn	2, 0x0046
     33a:	0000                	.insn	2, 0x0000
     33c:	0004                	.insn	2, 0x0004
     33e:	0000e407          	.insn	4, 0xe407
     342:	0100                	.insn	2, 0x0100
     344:	014a                	.insn	2, 0x014a
     346:	0305                	.insn	2, 0x0305
     348:	224c                	.insn	2, 0x224c
     34a:	0040                	.insn	2, 0x0040
     34c:	6205                	.insn	2, 0x6205
     34e:	0002                	.insn	2, 0x0002
     350:	0500                	.insn	2, 0x0500
     352:	0804                	.insn	2, 0x0804
     354:	035e                	.insn	2, 0x035e
     356:	0000                	.insn	2, 0x0000
     358:	01f1                	.insn	2, 0x01f1
     35a:	0000                	.insn	2, 0x0000
     35c:	1102                	.insn	2, 0x1102
     35e:	2405                	.insn	2, 0x2405
     360:	07000003          	lb	zero,112(zero) # 70 <$d.4+0x70>
     364:	0904                	.insn	2, 0x0904
     366:	0362                	.insn	2, 0x0362
     368:	0000                	.insn	2, 0x0000
     36a:	4e01                	.insn	2, 0x4e01
     36c:	4c01                	.insn	2, 0x4c01
     36e:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     372:	520a                	.insn	2, 0x520a
     374:	0001                	.insn	2, 0x0001
     376:	0100                	.insn	2, 0x0100
     378:	014e                	.insn	2, 0x014e
     37a:	03b1                	.insn	2, 0x03b1
     37c:	0000                	.insn	2, 0x0000
     37e:	a80a                	.insn	2, 0xa80a
     380:	0000                	.insn	2, 0x0000
     382:	0100                	.insn	2, 0x0100
     384:	014e                	.insn	2, 0x014e
     386:	000003bb          	.insn	4, 0x03bb
     38a:	0000f20b          	.insn	4, 0xf20b
     38e:	0100                	.insn	2, 0x0100
     390:	03c0014f          	.insn	4, 0x03c0014f
     394:	0000                	.insn	2, 0x0000
     396:	0b0c                	.insn	2, 0x0b0c
     398:	0134                	.insn	2, 0x0134
     39a:	0000                	.insn	2, 0x0000
     39c:	5901                	.insn	2, 0x5901
     39e:	3f01                	.insn	2, 0x3f01
     3a0:	0000                	.insn	2, 0x0000
     3a2:	0b00                	.insn	2, 0x0b00
     3a4:	00000387          	.insn	4, 0x0387
     3a8:	5a01                	.insn	2, 0x5a01
     3aa:	5301                	.insn	2, 0x5301
     3ac:	00000003          	lb	zero,0(zero) # 0 <$d.4>
     3b0:	0d00                	.insn	2, 0x0d00
     3b2:	03b6                	.insn	2, 0x03b6
     3b4:	0000                	.insn	2, 0x0000
     3b6:	3f0e                	.insn	2, 0x3f0e
     3b8:	0000                	.insn	2, 0x0000
     3ba:	0d00                	.insn	2, 0x0d00
     3bc:	03c0                	.insn	2, 0x03c0
     3be:	0000                	.insn	2, 0x0000
     3c0:	5308                	.insn	2, 0x5308
     3c2:	ac000003          	lb	zero,-1344(zero) # fffffac0 <USER_MAX+0xffaffac0>
     3c6:	0000                	.insn	2, 0x0000
     3c8:	0200                	.insn	2, 0x0200
     3ca:	0f14                	.insn	2, 0x0f14
     3cc:	001c                	.insn	2, 0x001c
     3ce:	0040                	.insn	2, 0x0040
     3d0:	0990                	.insn	2, 0x0990
     3d2:	0000                	.insn	2, 0x0000
     3d4:	5201                	.insn	2, 0x5201
     3d6:	0240                	.insn	2, 0x0240
     3d8:	0000                	.insn	2, 0x0000
     3da:	0501                	.insn	2, 0x0501
     3dc:	0010                	.insn	2, 0x0010
     3de:	0000                	.insn	2, 0x0000
     3e0:	af00                	.insn	2, 0xaf00
     3e2:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     3e6:	5314                	.insn	2, 0x5314
     3e8:	11000003          	lb	zero,272(zero) # 110 <$d.10+0x9c>
     3ec:	0000                	.insn	2, 0x0000
     3ee:	0000                	.insn	2, 0x0000
     3f0:	0312                	.insn	2, 0x0312
     3f2:	bc91                	.insn	2, 0xbc91
     3f4:	3601                	.insn	2, 0x3601
     3f6:	0001                	.insn	2, 0x0001
     3f8:	0100                	.insn	2, 0x0100
     3fa:	fa29                	.insn	2, 0xfa29
     3fc:	0009                	.insn	2, 0x0009
     3fe:	1200                	.insn	2, 0x1200
     400:	019c9103          	lh	sp,25(s9)
     404:	0266                	.insn	2, 0x0266
     406:	0000                	.insn	2, 0x0000
     408:	7c01                	.insn	2, 0x7c01
     40a:	0a06                	.insn	2, 0x0a06
     40c:	0000                	.insn	2, 0x0000
     40e:	1f10                	.insn	2, 0x1f10
     410:	0000                	.insn	2, 0x0000
     412:	3100                	.insn	2, 0x3100
     414:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     418:	4c7d                	.insn	2, 0x4c7d
     41a:	10000003          	lb	zero,256(zero) # 100 <$d.10+0x8c>
     41e:	008a                	.insn	2, 0x008a
     420:	0000                	.insn	2, 0x0000
     422:	0000002f          	.insn	4, 0x002f
     426:	2a01                	.insn	2, 0x2a01
     428:	034c                	.insn	2, 0x034c
     42a:	0000                	.insn	2, 0x0000
     42c:	0910                	.insn	2, 0x0910
     42e:	0001                	.insn	2, 0x0001
     430:	5f00                	.insn	2, 0x5f00
     432:	0000                	.insn	2, 0x0000
     434:	0100                	.insn	2, 0x0100
     436:	1280                	.insn	2, 0x1280
     438:	000a                	.insn	2, 0x000a
     43a:	1300                	.insn	2, 0x1300
     43c:	009f 0000 1801      	.insn	6, 0x18010000009f
     442:	0264                	.insn	2, 0x0264
     444:	0040                	.insn	2, 0x0040
     446:	9814                	.insn	2, 0x9814
     448:	4008                	.insn	2, 0x4008
     44a:	3400                	.insn	2, 0x3400
     44c:	0000                	.insn	2, 0x0000
     44e:	1000                	.insn	2, 0x1000
     450:	0424                	.insn	2, 0x0424
     452:	0000                	.insn	2, 0x0000
     454:	03f8                	.insn	2, 0x03f8
     456:	0000                	.insn	2, 0x0000
     458:	f401                	.insn	2, 0xf401
     45a:	035e                	.insn	2, 0x035e
     45c:	0000                	.insn	2, 0x0000
     45e:	1400                	.insn	2, 0x1400
     460:	080c                	.insn	2, 0x080c
     462:	0040                	.insn	2, 0x0040
     464:	001c                	.insn	2, 0x001c
     466:	0000                	.insn	2, 0x0000
     468:	e010                	.insn	2, 0xe010
     46a:	f8000003          	lb	zero,-128(zero) # ffffff80 <USER_MAX+0xffafff80>
     46e:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     472:	5eea                	.insn	2, 0x5eea
     474:	00000003          	lb	zero,0(zero) # 0 <$d.4>
     478:	d814                	.insn	2, 0xd814
     47a:	1c004007          	.insn	4, 0x1c004007
     47e:	0000                	.insn	2, 0x0000
     480:	1000                	.insn	2, 0x1000
     482:	03cd                	.insn	2, 0x03cd
     484:	0000                	.insn	2, 0x0000
     486:	0056                	.insn	2, 0x0056
     488:	0000                	.insn	2, 0x0000
     48a:	df01                	.insn	2, 0xdf01
     48c:	035e                	.insn	2, 0x035e
     48e:	0000                	.insn	2, 0x0000
     490:	1400                	.insn	2, 0x1400
     492:	06ec                	.insn	2, 0x06ec
     494:	0040                	.insn	2, 0x0040
     496:	001c                	.insn	2, 0x001c
     498:	0000                	.insn	2, 0x0000
     49a:	ed10                	.insn	2, 0xed10
     49c:	0002                	.insn	2, 0x0002
     49e:	5600                	.insn	2, 0x5600
     4a0:	0000                	.insn	2, 0x0000
     4a2:	0100                	.insn	2, 0x0100
     4a4:	5ed5                	.insn	2, 0x5ed5
     4a6:	00000003          	lb	zero,0(zero) # 0 <$d.4>
     4aa:	1811                	.insn	2, 0x1811
     4ac:	0000                	.insn	2, 0x0000
     4ae:	1000                	.insn	2, 0x1000
     4b0:	000002c3          	.insn	4, 0x02c3
     4b4:	0066                	.insn	2, 0x0066
     4b6:	0000                	.insn	2, 0x0000
     4b8:	c301                	.insn	2, 0xc301
     4ba:	00000353          	.insn	4, 0x0353
     4be:	1100                	.insn	2, 0x1100
     4c0:	0030                	.insn	2, 0x0030
     4c2:	0000                	.insn	2, 0x0000
     4c4:	9710                	.insn	2, 0x9710
     4c6:	0002                	.insn	2, 0x0002
     4c8:	9800                	.insn	2, 0x9800
     4ca:	0001                	.insn	2, 0x0001
     4cc:	0100                	.insn	2, 0x0100
     4ce:	5eb2                	.insn	2, 0x5eb2
     4d0:	00000003          	lb	zero,0(zero) # 0 <$d.4>
     4d4:	4811                	.insn	2, 0x4811
     4d6:	0000                	.insn	2, 0x0000
     4d8:	1000                	.insn	2, 0x1000
     4da:	0134                	.insn	2, 0x0134
     4dc:	0000                	.insn	2, 0x0000
     4de:	0061                	.insn	2, 0x0061
     4e0:	0000                	.insn	2, 0x0000
     4e2:	9601                	.insn	2, 0x9601
     4e4:	00000353          	.insn	4, 0x0353
     4e8:	8d10                	.insn	2, 0x8d10
     4ea:	0001                	.insn	2, 0x0001
     4ec:	2f00                	.insn	2, 0x2f00
     4ee:	0000                	.insn	2, 0x0000
     4f0:	0100                	.insn	2, 0x0100
     4f2:	00035397          	auipc	t2,0x35
     4f6:	1500                	.insn	2, 0x1500
     4f8:	02f6                	.insn	2, 0x02f6
     4fa:	0000                	.insn	2, 0x0000
     4fc:	9801                	.insn	2, 0x9801
     4fe:	03c0                	.insn	2, 0x03c0
     500:	0000                	.insn	2, 0x0000
     502:	6516                	.insn	2, 0x6516
     504:	70000003          	lb	zero,1792(zero) # 700 <$d.3+0x19e>
     508:	0000                	.insn	2, 0x0000
     50a:	0100                	.insn	2, 0x0100
     50c:	3e17159b          	.insn	4, 0x3e17159b
     510:	0002                	.insn	2, 0x0002
     512:	7200                	.insn	2, 0x7200
     514:	18000003          	lb	zero,384(zero) # 180 <$d.6+0xf>
     518:	01fc                	.insn	2, 0x01fc
     51a:	0000                	.insn	2, 0x0000
     51c:	038a                	.insn	2, 0x038a
     51e:	0000                	.insn	2, 0x0000
     520:	9011                	.insn	2, 0x9011
     522:	0000                	.insn	2, 0x0000
     524:	1800                	.insn	2, 0x1800
     526:	0300                	.insn	2, 0x0300
     528:	0000                	.insn	2, 0x0000
     52a:	00000397          	auipc	t2,0x0
     52e:	1e18                	.insn	2, 0x1e18
     530:	a3000003          	lb	zero,-1488(zero) # fffffa30 <USER_MAX+0xffaffa30>
     534:	00000003          	lb	zero,0(zero) # 0 <$d.4>
     538:	1600                	.insn	2, 0x1600
     53a:	0365                	.insn	2, 0x0365
     53c:	0000                	.insn	2, 0x0000
     53e:	00b0                	.insn	2, 0x00b0
     540:	0000                	.insn	2, 0x0000
     542:	a101                	.insn	2, 0xa101
     544:	1715                	.insn	2, 0x1715
     546:	00000367          	jalr	t1,zero # 0 <$d.4>
     54a:	0372                	.insn	2, 0x0372
     54c:	0000                	.insn	2, 0x0000
     54e:	3118                	.insn	2, 0x3118
     550:	8a000003          	lb	zero,-1888(zero) # fffff8a0 <USER_MAX+0xffaff8a0>
     554:	11000003          	lb	zero,272(zero) # 110 <$d.10+0x9c>
     558:	00c8                	.insn	2, 0x00c8
     55a:	0000                	.insn	2, 0x0000
     55c:	f318                	.insn	2, 0xf318
     55e:	97000003          	lb	zero,-1680(zero) # fffff970 <USER_MAX+0xffaff970>
     562:	18000003          	lb	zero,384(zero) # 180 <$d.6+0xf>
     566:	0411                	.insn	2, 0x0411
     568:	0000                	.insn	2, 0x0000
     56a:	000003a3          	sb	zero,7(zero) # 7 <$d.4+0x7>
     56e:	0000                	.insn	2, 0x0000
     570:	1100                	.insn	2, 0x1100
     572:	00e8                	.insn	2, 0x00e8
     574:	0000                	.insn	2, 0x0000
     576:	aa10                	.insn	2, 0xaa10
     578:	0000                	.insn	2, 0x0000
     57a:	6200                	.insn	2, 0x6200
     57c:	0004                	.insn	2, 0x0004
     57e:	0100                	.insn	2, 0x0100
     580:	4c48                	.insn	2, 0x4c48
     582:	10000003          	lb	zero,256(zero) # 100 <$d.10+0x8c>
     586:	000000d3          	.insn	4, 0x00d3
     58a:	005c                	.insn	2, 0x005c
     58c:	0000                	.insn	2, 0x0000
     58e:	3401                	.insn	2, 0x3401
     590:	00000353          	.insn	4, 0x0353
     594:	f110                	.insn	2, 0xf110
     596:	0000                	.insn	2, 0x0000
     598:	6b00                	.insn	2, 0x6b00
     59a:	0002                	.insn	2, 0x0002
     59c:	0100                	.insn	2, 0x0100
     59e:	0009ef37          	lui	t5,0x9e
     5a2:	1500                	.insn	2, 0x1500
     5a4:	00000427          	.insn	4, 0x0427
     5a8:	3601                	.insn	2, 0x3601
     5aa:	000009ef          	jal	s3,5aa <$d.3+0x48>
     5ae:	0000                	.insn	2, 0x0000
     5b0:	3919                	.insn	2, 0x3919
     5b2:	0008                	.insn	2, 0x0008
     5b4:	6400                	.insn	2, 0x6400
     5b6:	4000                	.insn	2, 0x4000
     5b8:	1900                	.insn	2, 0x1900
     5ba:	0839                	.insn	2, 0x0839
     5bc:	0000                	.insn	2, 0x0000
     5be:	0260                	.insn	2, 0x0260
     5c0:	0040                	.insn	2, 0x0040
     5c2:	4719                	.insn	2, 0x4719
     5c4:	0008                	.insn	2, 0x0008
     5c6:	7000                	.insn	2, 0x7000
     5c8:	4002                	.insn	2, 0x4002
     5ca:	1900                	.insn	2, 0x1900
     5cc:	00000847          	.insn	4, 0x0847
     5d0:	027c                	.insn	2, 0x027c
     5d2:	0040                	.insn	2, 0x0040
     5d4:	4719                	.insn	2, 0x4719
     5d6:	0008                	.insn	2, 0x0008
     5d8:	8800                	.insn	2, 0x8800
     5da:	4002                	.insn	2, 0x4002
     5dc:	1900                	.insn	2, 0x1900
     5de:	00000847          	.insn	4, 0x0847
     5e2:	0294                	.insn	2, 0x0294
     5e4:	0040                	.insn	2, 0x0040
     5e6:	4719                	.insn	2, 0x4719
     5e8:	0008                	.insn	2, 0x0008
     5ea:	a000                	.insn	2, 0xa000
     5ec:	4002                	.insn	2, 0x4002
     5ee:	1900                	.insn	2, 0x1900
     5f0:	00000847          	.insn	4, 0x0847
     5f4:	02ac                	.insn	2, 0x02ac
     5f6:	0040                	.insn	2, 0x0040
     5f8:	4719                	.insn	2, 0x4719
     5fa:	0008                	.insn	2, 0x0008
     5fc:	b800                	.insn	2, 0xb800
     5fe:	4002                	.insn	2, 0x4002
     600:	1900                	.insn	2, 0x1900
     602:	00000847          	.insn	4, 0x0847
     606:	02c4                	.insn	2, 0x02c4
     608:	0040                	.insn	2, 0x0040
     60a:	4719                	.insn	2, 0x4719
     60c:	0008                	.insn	2, 0x0008
     60e:	d000                	.insn	2, 0xd000
     610:	4002                	.insn	2, 0x4002
     612:	1900                	.insn	2, 0x1900
     614:	00000847          	.insn	4, 0x0847
     618:	02dc                	.insn	2, 0x02dc
     61a:	0040                	.insn	2, 0x0040
     61c:	4719                	.insn	2, 0x4719
     61e:	0008                	.insn	2, 0x0008
     620:	e800                	.insn	2, 0xe800
     622:	4002                	.insn	2, 0x4002
     624:	1900                	.insn	2, 0x1900
     626:	00000847          	.insn	4, 0x0847
     62a:	02f4                	.insn	2, 0x02f4
     62c:	0040                	.insn	2, 0x0040
     62e:	4719                	.insn	2, 0x4719
     630:	0008                	.insn	2, 0x0008
     632:	0000                	.insn	2, 0x0000
     634:	19004003          	lbu	zero,400(zero) # 190 <$d.6+0x1f>
     638:	00000847          	.insn	4, 0x0847
     63c:	030c                	.insn	2, 0x030c
     63e:	0040                	.insn	2, 0x0040
     640:	4719                	.insn	2, 0x4719
     642:	0008                	.insn	2, 0x0008
     644:	1800                	.insn	2, 0x1800
     646:	19004003          	lbu	zero,400(zero) # 190 <$d.6+0x1f>
     64a:	00000847          	.insn	4, 0x0847
     64e:	0324                	.insn	2, 0x0324
     650:	0040                	.insn	2, 0x0040
     652:	4719                	.insn	2, 0x4719
     654:	0008                	.insn	2, 0x0008
     656:	3800                	.insn	2, 0x3800
     658:	19004003          	lbu	zero,400(zero) # 190 <$d.6+0x1f>
     65c:	0854                	.insn	2, 0x0854
     65e:	0000                	.insn	2, 0x0000
     660:	034c                	.insn	2, 0x034c
     662:	0040                	.insn	2, 0x0040
     664:	3919                	.insn	2, 0x3919
     666:	0008                	.insn	2, 0x0008
     668:	6c00                	.insn	2, 0x6c00
     66a:	19004003          	lbu	zero,400(zero) # 190 <$d.6+0x1f>
     66e:	0839                	.insn	2, 0x0839
     670:	0000                	.insn	2, 0x0000
     672:	038c                	.insn	2, 0x038c
     674:	0040                	.insn	2, 0x0040
     676:	5f19                	.insn	2, 0x5f19
     678:	0008                	.insn	2, 0x0008
     67a:	9800                	.insn	2, 0x9800
     67c:	19004003          	lbu	zero,400(zero) # 190 <$d.6+0x1f>
     680:	00000847          	.insn	4, 0x0847
     684:	03f0                	.insn	2, 0x03f0
     686:	0040                	.insn	2, 0x0040
     688:	4719                	.insn	2, 0x4719
     68a:	0008                	.insn	2, 0x0008
     68c:	fc00                	.insn	2, 0xfc00
     68e:	19004003          	lbu	zero,400(zero) # 190 <$d.6+0x1f>
     692:	00000847          	.insn	4, 0x0847
     696:	0410                	.insn	2, 0x0410
     698:	0040                	.insn	2, 0x0040
     69a:	6a19                	.insn	2, 0x6a19
     69c:	0008                	.insn	2, 0x0008
     69e:	bc00                	.insn	2, 0xbc00
     6a0:	4004                	.insn	2, 0x4004
     6a2:	1900                	.insn	2, 0x1900
     6a4:	086a                	.insn	2, 0x086a
     6a6:	0000                	.insn	2, 0x0000
     6a8:	04d0                	.insn	2, 0x04d0
     6aa:	0040                	.insn	2, 0x0040
     6ac:	6a19                	.insn	2, 0x6a19
     6ae:	0008                	.insn	2, 0x0008
     6b0:	e400                	.insn	2, 0xe400
     6b2:	4004                	.insn	2, 0x4004
     6b4:	1900                	.insn	2, 0x1900
     6b6:	086a                	.insn	2, 0x086a
     6b8:	0000                	.insn	2, 0x0000
     6ba:	04fc                	.insn	2, 0x04fc
     6bc:	0040                	.insn	2, 0x0040
     6be:	6a19                	.insn	2, 0x6a19
     6c0:	0008                	.insn	2, 0x0008
     6c2:	1000                	.insn	2, 0x1000
     6c4:	4005                	.insn	2, 0x4005
     6c6:	1900                	.insn	2, 0x1900
     6c8:	086a                	.insn	2, 0x086a
     6ca:	0000                	.insn	2, 0x0000
     6cc:	0524                	.insn	2, 0x0524
     6ce:	0040                	.insn	2, 0x0040
     6d0:	6a19                	.insn	2, 0x6a19
     6d2:	0008                	.insn	2, 0x0008
     6d4:	3800                	.insn	2, 0x3800
     6d6:	4005                	.insn	2, 0x4005
     6d8:	1900                	.insn	2, 0x1900
     6da:	086a                	.insn	2, 0x086a
     6dc:	0000                	.insn	2, 0x0000
     6de:	054c                	.insn	2, 0x054c
     6e0:	0040                	.insn	2, 0x0040
     6e2:	6a19                	.insn	2, 0x6a19
     6e4:	0008                	.insn	2, 0x0008
     6e6:	6000                	.insn	2, 0x6000
     6e8:	4005                	.insn	2, 0x4005
     6ea:	1900                	.insn	2, 0x1900
     6ec:	086a                	.insn	2, 0x086a
     6ee:	0000                	.insn	2, 0x0000
     6f0:	0574                	.insn	2, 0x0574
     6f2:	0040                	.insn	2, 0x0040
     6f4:	6a19                	.insn	2, 0x6a19
     6f6:	0008                	.insn	2, 0x0008
     6f8:	8800                	.insn	2, 0x8800
     6fa:	4005                	.insn	2, 0x4005
     6fc:	1900                	.insn	2, 0x1900
     6fe:	086a                	.insn	2, 0x086a
     700:	0000                	.insn	2, 0x0000
     702:	059c                	.insn	2, 0x059c
     704:	0040                	.insn	2, 0x0040
     706:	6a19                	.insn	2, 0x6a19
     708:	0008                	.insn	2, 0x0008
     70a:	b000                	.insn	2, 0xb000
     70c:	4005                	.insn	2, 0x4005
     70e:	1900                	.insn	2, 0x1900
     710:	086a                	.insn	2, 0x086a
     712:	0000                	.insn	2, 0x0000
     714:	05c4                	.insn	2, 0x05c4
     716:	0040                	.insn	2, 0x0040
     718:	6a19                	.insn	2, 0x6a19
     71a:	0008                	.insn	2, 0x0008
     71c:	d800                	.insn	2, 0xd800
     71e:	4005                	.insn	2, 0x4005
     720:	1900                	.insn	2, 0x1900
     722:	086a                	.insn	2, 0x086a
     724:	0000                	.insn	2, 0x0000
     726:	05ec                	.insn	2, 0x05ec
     728:	0040                	.insn	2, 0x0040
     72a:	6a19                	.insn	2, 0x6a19
     72c:	0008                	.insn	2, 0x0008
     72e:	0000                	.insn	2, 0x0000
     730:	4006                	.insn	2, 0x4006
     732:	1900                	.insn	2, 0x1900
     734:	0839                	.insn	2, 0x0839
     736:	0000                	.insn	2, 0x0000
     738:	0614                	.insn	2, 0x0614
     73a:	0040                	.insn	2, 0x0040
     73c:	8019                	.insn	2, 0x8019
     73e:	0008                	.insn	2, 0x0008
     740:	7800                	.insn	2, 0x7800
     742:	4006                	.insn	2, 0x4006
     744:	1900                	.insn	2, 0x1900
     746:	0891                	.insn	2, 0x0891
     748:	0000                	.insn	2, 0x0000
     74a:	069c                	.insn	2, 0x069c
     74c:	0040                	.insn	2, 0x0040
     74e:	8019                	.insn	2, 0x8019
     750:	0008                	.insn	2, 0x0008
     752:	c000                	.insn	2, 0xc000
     754:	4006                	.insn	2, 0x4006
     756:	1900                	.insn	2, 0x1900
     758:	000008a3          	sb	zero,17(zero) # 11 <$d.4+0x11>
     75c:	06e4                	.insn	2, 0x06e4
     75e:	0040                	.insn	2, 0x0040
     760:	8019                	.insn	2, 0x8019
     762:	0008                	.insn	2, 0x0008
     764:	fc00                	.insn	2, 0xfc00
     766:	4006                	.insn	2, 0x4006
     768:	1900                	.insn	2, 0x1900
     76a:	091d                	.insn	2, 0x091d
     76c:	0000                	.insn	2, 0x0000
     76e:	0704                	.insn	2, 0x0704
     770:	0040                	.insn	2, 0x0040
     772:	9119                	.insn	2, 0x9119
     774:	0008                	.insn	2, 0x0008
     776:	7c00                	.insn	2, 0x7c00
     778:	19004007          	.insn	4, 0x19004007
     77c:	0880                	.insn	2, 0x0880
     77e:	0000                	.insn	2, 0x0000
     780:	07e8                	.insn	2, 0x07e8
     782:	0040                	.insn	2, 0x0040
     784:	2a19                	.insn	2, 0x2a19
     786:	0009                	.insn	2, 0x0009
     788:	f000                	.insn	2, 0xf000
     78a:	19004007          	.insn	4, 0x19004007
     78e:	0000093b          	.insn	4, 0x093b
     792:	0804                	.insn	2, 0x0804
     794:	0040                	.insn	2, 0x0040
     796:	8019                	.insn	2, 0x8019
     798:	0008                	.insn	2, 0x0008
     79a:	1c00                	.insn	2, 0x1c00
     79c:	4008                	.insn	2, 0x4008
     79e:	1900                	.insn	2, 0x1900
     7a0:	0948                	.insn	2, 0x0948
     7a2:	0000                	.insn	2, 0x0000
     7a4:	0824                	.insn	2, 0x0824
     7a6:	0040                	.insn	2, 0x0040
     7a8:	9119                	.insn	2, 0x9119
     7aa:	0008                	.insn	2, 0x0008
     7ac:	9000                	.insn	2, 0x9000
     7ae:	4008                	.insn	2, 0x4008
     7b0:	1900                	.insn	2, 0x1900
     7b2:	0880                	.insn	2, 0x0880
     7b4:	0000                	.insn	2, 0x0000
     7b6:	08a8                	.insn	2, 0x08a8
     7b8:	0040                	.insn	2, 0x0040
     7ba:	5519                	.insn	2, 0x5519
     7bc:	0009                	.insn	2, 0x0009
     7be:	c800                	.insn	2, 0xc800
     7c0:	4008                	.insn	2, 0x4008
     7c2:	1900                	.insn	2, 0x1900
     7c4:	0962                	.insn	2, 0x0962
     7c6:	0000                	.insn	2, 0x0000
     7c8:	08d4                	.insn	2, 0x08d4
     7ca:	0040                	.insn	2, 0x0040
     7cc:	3919                	.insn	2, 0x3919
     7ce:	0008                	.insn	2, 0x0008
     7d0:	e800                	.insn	2, 0xe800
     7d2:	4008                	.insn	2, 0x4008
     7d4:	1900                	.insn	2, 0x1900
     7d6:	096d                	.insn	2, 0x096d
     7d8:	0000                	.insn	2, 0x0000
     7da:	08f4                	.insn	2, 0x08f4
     7dc:	0040                	.insn	2, 0x0040
     7de:	7419                	.insn	2, 0x7419
     7e0:	0009                	.insn	2, 0x0009
     7e2:	0c00                	.insn	2, 0x0c00
     7e4:	4009                	.insn	2, 0x4009
     7e6:	1900                	.insn	2, 0x1900
     7e8:	0839                	.insn	2, 0x0839
     7ea:	0000                	.insn	2, 0x0000
     7ec:	0928                	.insn	2, 0x0928
     7ee:	0040                	.insn	2, 0x0040
     7f0:	3919                	.insn	2, 0x3919
     7f2:	0008                	.insn	2, 0x0008
     7f4:	3800                	.insn	2, 0x3800
     7f6:	4009                	.insn	2, 0x4009
     7f8:	1900                	.insn	2, 0x1900
     7fa:	0839                	.insn	2, 0x0839
     7fc:	0000                	.insn	2, 0x0000
     7fe:	0948                	.insn	2, 0x0948
     800:	0040                	.insn	2, 0x0040
     802:	3919                	.insn	2, 0x3919
     804:	0008                	.insn	2, 0x0008
     806:	5800                	.insn	2, 0x5800
     808:	4009                	.insn	2, 0x4009
     80a:	1900                	.insn	2, 0x1900
     80c:	0839                	.insn	2, 0x0839
     80e:	0000                	.insn	2, 0x0000
     810:	0968                	.insn	2, 0x0968
     812:	0040                	.insn	2, 0x0040
     814:	8519                	.insn	2, 0x8519
     816:	0009                	.insn	2, 0x0009
     818:	8000                	.insn	2, 0x8000
     81a:	4009                	.insn	2, 0x4009
     81c:	1900                	.insn	2, 0x1900
     81e:	0839                	.insn	2, 0x0839
     820:	0000                	.insn	2, 0x0000
     822:	0990                	.insn	2, 0x0990
     824:	0040                	.insn	2, 0x0040
     826:	3919                	.insn	2, 0x3919
     828:	0008                	.insn	2, 0x0008
     82a:	a000                	.insn	2, 0xa000
     82c:	4009                	.insn	2, 0x4009
     82e:	1900                	.insn	2, 0x1900
     830:	0996                	.insn	2, 0x0996
     832:	0000                	.insn	2, 0x0000
     834:	09ac                	.insn	2, 0x09ac
     836:	0040                	.insn	2, 0x0040
     838:	1a00                	.insn	2, 0x1a00
     83a:	03f1                	.insn	2, 0x03f1
     83c:	0000                	.insn	2, 0x0000
     83e:	4b02                	.insn	2, 0x4b02
     840:	0003b11b          	.insn	4, 0x0003b11b
     844:	1c00                	.insn	2, 0x1c00
     846:	1a00                	.insn	2, 0x1a00
     848:	0000044b          	.insn	4, 0x044b
     84c:	3a02                	.insn	2, 0x3a02
     84e:	00003f1b          	.insn	4, 0x3f1b
     852:	0000                	.insn	2, 0x0000
     854:	ca1d                	.insn	2, 0xca1d
     856:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
     85a:	534a                	.insn	2, 0x534a
     85c:	1d000003          	lb	zero,464(zero) # 1d0 <$d.6+0x5f>
     860:	040d                	.insn	2, 0x040d
     862:	0000                	.insn	2, 0x0000
     864:	3c02                	.insn	2, 0x3c02
     866:	034c                	.insn	2, 0x034c
     868:	0000                	.insn	2, 0x0000
     86a:	6c1e                	.insn	2, 0x6c1e
     86c:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
     870:	00034c47          	.insn	4, 0x00034c47
     874:	1b00                	.insn	2, 0x1b00
     876:	03b1                	.insn	2, 0x03b1
     878:	0000                	.insn	2, 0x0000
     87a:	0003b11b          	.insn	4, 0x0003b11b
     87e:	0000                	.insn	2, 0x0000
     880:	531e                	.insn	2, 0x531e
     882:	0004                	.insn	2, 0x0004
     884:	0200                	.insn	2, 0x0200
     886:	5e39                	.insn	2, 0x5e39
     888:	1b000003          	lb	zero,432(zero) # 1b0 <$d.6+0x3f>
     88c:	03b1                	.insn	2, 0x03b1
     88e:	0000                	.insn	2, 0x0000
     890:	1a00                	.insn	2, 0x1a00
     892:	01c0                	.insn	2, 0x01c0
     894:	0000                	.insn	2, 0x0000
     896:	3402                	.insn	2, 0x3402
     898:	0003531b          	.insn	4, 0x0003531b
     89c:	1b00                	.insn	2, 0x1b00
     89e:	00000353          	.insn	4, 0x0353
     8a2:	1f00                	.insn	2, 0x1f00
     8a4:	0a78                	.insn	2, 0x0a78
     8a6:	0040                	.insn	2, 0x0040
     8a8:	00bc                	.insn	2, 0x00bc
     8aa:	0000                	.insn	2, 0x0000
     8ac:	5201                	.insn	2, 0x5201
     8ae:	0024                	.insn	2, 0x0024
     8b0:	0000                	.insn	2, 0x0000
     8b2:	3c01                	.insn	2, 0x3c01
     8b4:	2001                	.insn	2, 0x2001
     8b6:	0505                	.insn	2, 0x0505
     8b8:	0000                	.insn	2, 0x0000
     8ba:	0198                	.insn	2, 0x0198
     8bc:	0000                	.insn	2, 0x0000
     8be:	3c01                	.insn	2, 0x3c01
     8c0:	5e01                	.insn	2, 0x5e01
     8c2:	21000003          	lb	zero,528(zero) # 210 <$d.10+0x14>
     8c6:	0542                	.insn	2, 0x0542
     8c8:	0000                	.insn	2, 0x0000
     8ca:	0056                	.insn	2, 0x0056
     8cc:	0000                	.insn	2, 0x0000
     8ce:	3e01                	.insn	2, 0x3e01
     8d0:	4c01                	.insn	2, 0x4c01
     8d2:	14000003          	lb	zero,320(zero) # 140 <$d.6+0x20>
     8d6:	0a9c                	.insn	2, 0x0a9c
     8d8:	0040                	.insn	2, 0x0040
     8da:	0054                	.insn	2, 0x0054
     8dc:	0000                	.insn	2, 0x0000
     8de:	2321                	.insn	2, 0x2321
     8e0:	0005                	.insn	2, 0x0005
     8e2:	a600                	.insn	2, 0xa600
     8e4:	0000                	.insn	2, 0x0000
     8e6:	0100                	.insn	2, 0x0100
     8e8:	035e013f 19000000 	.insn	8, 0x19000000035e013f
     8f0:	09de                	.insn	2, 0x09de
     8f2:	0000                	.insn	2, 0x0000
     8f4:	0ac0                	.insn	2, 0x0ac0
     8f6:	0040                	.insn	2, 0x0040
     8f8:	3919                	.insn	2, 0x3919
     8fa:	0008                	.insn	2, 0x0008
     8fc:	d400                	.insn	2, 0xd400
     8fe:	400a                	.insn	2, 0x400a
     900:	1900                	.insn	2, 0x1900
     902:	00000847          	.insn	4, 0x0847
     906:	0aec                	.insn	2, 0x0aec
     908:	0040                	.insn	2, 0x0040
     90a:	4719                	.insn	2, 0x4719
     90c:	0008                	.insn	2, 0x0008
     90e:	0400                	.insn	2, 0x0400
     910:	2200400b          	.insn	4, 0x2200400b
     914:	0839                	.insn	2, 0x0839
     916:	0000                	.insn	2, 0x0000
     918:	0b34                	.insn	2, 0x0b34
     91a:	0040                	.insn	2, 0x0040
     91c:	1a00                	.insn	2, 0x1a00
     91e:	000002e3          	beqz	zero,1122 <$d.3+0x228>
     922:	2b02                	.insn	2, 0x2b02
     924:	00035e1b          	.insn	4, 0x00035e1b
     928:	0000                	.insn	2, 0x0000
     92a:	421e                	.insn	2, 0x421e
     92c:	0000                	.insn	2, 0x0000
     92e:	0200                	.insn	2, 0x0200
     930:	532d                	.insn	2, 0x532d
     932:	1b000003          	lb	zero,432(zero) # 1b0 <$d.6+0x3f>
     936:	00000353          	.insn	4, 0x0353
     93a:	1a00                	.insn	2, 0x1a00
     93c:	00000373          	.insn	4, 0x0373
     940:	2902                	.insn	2, 0x2902
     942:	0003531b          	.insn	4, 0x0003531b
     946:	0000                	.insn	2, 0x0000
     948:	f41a                	.insn	2, 0xf41a
     94a:	0000                	.insn	2, 0x0000
     94c:	0200                	.insn	2, 0x0200
     94e:	035e1b2f          	.insn	4, 0x035e1b2f
     952:	0000                	.insn	2, 0x0000
     954:	1a00                	.insn	2, 0x1a00
     956:	0229                	.insn	2, 0x0229
     958:	0000                	.insn	2, 0x0000
     95a:	3002                	.insn	2, 0x3002
     95c:	00035e1b          	.insn	4, 0x00035e1b
     960:	0000                	.insn	2, 0x0000
     962:	b61d                	.insn	2, 0xb61d
     964:	0000                	.insn	2, 0x0000
     966:	0300                	.insn	2, 0x0300
     968:	4c10                	.insn	2, 0x4c10
     96a:	23000003          	lb	zero,560(zero) # 230 <$d.10+0x34>
     96e:	0011                	.insn	2, 0x0011
     970:	0000                	.insn	2, 0x0000
     972:	1a1e1103          	lh	sp,417(t3)
     976:	0000                	.insn	2, 0x0000
     978:	0300                	.insn	2, 0x0300
     97a:	4c0e                	.insn	2, 0x4c0e
     97c:	1b000003          	lb	zero,432(zero) # 1b0 <$d.6+0x3f>
     980:	03b1                	.insn	2, 0x03b1
     982:	0000                	.insn	2, 0x0000
     984:	1e00                	.insn	2, 0x1e00
     986:	000003a3          	sb	zero,7(zero) # 7 <$d.4+0x7>
     98a:	034c1203          	lh	tp,52(s8)
     98e:	0000                	.insn	2, 0x0000
     990:	0003b11b          	.insn	4, 0x0003b11b
     994:	0000                	.insn	2, 0x0000
     996:	5d24                	.insn	2, 0x5d24
     998:	0004                	.insn	2, 0x0004
     99a:	0200                	.insn	2, 0x0200
     99c:	254c                	.insn	2, 0x254c
     99e:	09ac                	.insn	2, 0x09ac
     9a0:	0040                	.insn	2, 0x0040
     9a2:	00cc                	.insn	2, 0x00cc
     9a4:	0000                	.insn	2, 0x0000
     9a6:	5201                	.insn	2, 0x5201
     9a8:	0365                	.insn	2, 0x0365
     9aa:	0000                	.insn	2, 0x0000
     9ac:	00043717          	auipc	a4,0x43
     9b0:	7200                	.insn	2, 0x7200
     9b2:	26000003          	lb	zero,608(zero) # 260 <$d.10+0x64>
     9b6:	5b01                	.insn	2, 0x5b01
     9b8:	037e                	.insn	2, 0x037e
     9ba:	0000                	.insn	2, 0x0000
     9bc:	aa18                	.insn	2, 0xaa18
     9be:	0004                	.insn	2, 0x0004
     9c0:	8a00                	.insn	2, 0x8a00
     9c2:	11000003          	lb	zero,272(zero) # 110 <$d.10+0x9c>
     9c6:	0100                	.insn	2, 0x0100
     9c8:	0000                	.insn	2, 0x0000
     9ca:	d418                	.insn	2, 0xd418
     9cc:	0004                	.insn	2, 0x0004
     9ce:	9700                	.insn	2, 0x9700
     9d0:	18000003          	lb	zero,384(zero) # 180 <$d.6+0xf>
     9d4:	04f2                	.insn	2, 0x04f2
     9d6:	0000                	.insn	2, 0x0000
     9d8:	000003a3          	sb	zero,7(zero) # 7 <$d.4+0x7>
     9dc:	0000                	.insn	2, 0x0000
     9de:	b31e                	.insn	2, 0xb31e
     9e0:	0002                	.insn	2, 0x0002
     9e2:	0200                	.insn	2, 0x0200
     9e4:	ef38                	.insn	2, 0xef38
     9e6:	0009                	.insn	2, 0x0009
     9e8:	1b00                	.insn	2, 0x1b00
     9ea:	035e                	.insn	2, 0x035e
     9ec:	0000                	.insn	2, 0x0000
     9ee:	0800                	.insn	2, 0x0800
     9f0:	034c                	.insn	2, 0x034c
     9f2:	0000                	.insn	2, 0x0000
     9f4:	000000db          	.insn	4, 0x00db
     9f8:	0e02                	.insn	2, 0x0e02
     9fa:	00003f03          	.insn	4, 0x3f03
     9fe:	0400                	.insn	2, 0x0400
     a00:	0046                	.insn	2, 0x0046
     a02:	0000                	.insn	2, 0x0000
     a04:	0020                	.insn	2, 0x0020
     a06:	0003b103          	.insn	4, 0x0003b103
     a0a:	0400                	.insn	2, 0x0400
     a0c:	0046                	.insn	2, 0x0046
     a0e:	0000                	.insn	2, 0x0000
     a10:	0008                	.insn	2, 0x0008
     a12:	3f0d                	.insn	2, 0x3f0d
     a14:	0000                	.insn	2, 0x0000
	...

00000a18 <$d.5>:
     a18:	0dd5                	.insn	2, 0x0dd5
     a1a:	0000                	.insn	2, 0x0000
     a1c:	0004                	.insn	2, 0x0004
     a1e:	01f2                	.insn	2, 0x01f2
     a20:	0000                	.insn	2, 0x0000
     a22:	0104                	.insn	2, 0x0104
     a24:	0171                	.insn	2, 0x0171
     a26:	0000                	.insn	2, 0x0000
     a28:	001d                	.insn	2, 0x001d
     a2a:	0105                	.insn	2, 0x0105
     a2c:	0000                	.insn	2, 0x0000
     a2e:	095d                	.insn	2, 0x095d
     a30:	0000                	.insn	2, 0x0000
     a32:	027e                	.insn	2, 0x027e
     a34:	0000                	.insn	2, 0x0000
     a36:	0000                	.insn	2, 0x0000
     a38:	0000                	.insn	2, 0x0000
     a3a:	0270                	.insn	2, 0x0270
     a3c:	0000                	.insn	2, 0x0000
     a3e:	3302                	.insn	2, 0x3302
     a40:	0000                	.insn	2, 0x0000
     a42:	0100                	.insn	2, 0x0100
     a44:	05ee                	.insn	2, 0x05ee
     a46:	40233b03          	.insn	4, 0x40233b03
     a4a:	0300                	.insn	2, 0x0300
     a4c:	0000003f 00004604 	.insn	8, 0x46040000003f
     a54:	0800                	.insn	2, 0x0800
     a56:	0500                	.insn	2, 0x0500
     a58:	025d                	.insn	2, 0x025d
     a5a:	0000                	.insn	2, 0x0000
     a5c:	0108                	.insn	2, 0x0108
     a5e:	4e06                	.insn	2, 0x4e06
     a60:	08000003          	lb	zero,128(zero) # 80 <$d.10+0xc>
     a64:	005a0207          	.insn	4, 0x005a0207
     a68:	0000                	.insn	2, 0x0000
     a6a:	f201                	.insn	2, 0xf201
     a6c:	0305                	.insn	2, 0x0305
     a6e:	0040219b          	.insn	4, 0x0040219b
     a72:	00003f03          	.insn	4, 0x3f03
     a76:	0400                	.insn	2, 0x0400
     a78:	0046                	.insn	2, 0x0046
     a7a:	0000                	.insn	2, 0x0000
     a7c:	73020013          	addi	zero,tp,1840 # 402730 <__user_stack_bottom+0xe0>
     a80:	0000                	.insn	2, 0x0000
     a82:	0100                	.insn	2, 0x0100
     a84:	230305f7          	.insn	4, 0x230305f7
     a88:	03004023          	.insn	4, 0x03004023
     a8c:	0000003f 00004604 	.insn	8, 0x46040000003f
     a94:	1800                	.insn	2, 0x1800
     a96:	0200                	.insn	2, 0x0200
     a98:	008c                	.insn	2, 0x008c
     a9a:	0000                	.insn	2, 0x0000
     a9c:	ff01                	.insn	2, 0xff01
     a9e:	0305                	.insn	2, 0x0305
     aa0:	2149                	.insn	2, 0x2149
     aa2:	0040                	.insn	2, 0x0040
     aa4:	00003f03          	.insn	4, 0x3f03
     aa8:	0400                	.insn	2, 0x0400
     aaa:	0046                	.insn	2, 0x0046
     aac:	0000                	.insn	2, 0x0000
     aae:	001e                	.insn	2, 0x001e
     ab0:	0000a607          	.insn	4, 0xa607
     ab4:	0100                	.insn	2, 0x0100
     ab6:	0194                	.insn	2, 0x0194
     ab8:	0305                	.insn	2, 0x0305
     aba:	23a9                	.insn	2, 0x23a9
     abc:	0040                	.insn	2, 0x0040
     abe:	00003f03          	.insn	4, 0x3f03
     ac2:	0400                	.insn	2, 0x0400
     ac4:	0046                	.insn	2, 0x0046
     ac6:	0000                	.insn	2, 0x0000
     ac8:	0011                	.insn	2, 0x0011
     aca:	be08                	.insn	2, 0xbe08
     acc:	0000                	.insn	2, 0x0000
     ace:	8900                	.insn	2, 0x8900
     ad0:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
     ad4:	010a                	.insn	2, 0x010a
     ad6:	4505                	.insn	2, 0x4505
     ad8:	0002                	.insn	2, 0x0002
     ada:	0800                	.insn	2, 0x0800
     adc:	0901                	.insn	2, 0x0901
     ade:	00d0                	.insn	2, 0x00d0
     ae0:	0000                	.insn	2, 0x0000
     ae2:	01f1                	.insn	2, 0x01f1
     ae4:	0000                	.insn	2, 0x0000
     ae6:	c602                	.insn	2, 0xc602
     ae8:	2405                	.insn	2, 0x2405
     aea:	07000003          	lb	zero,112(zero) # 70 <$d.4+0x70>
     aee:	0504                	.insn	2, 0x0504
     af0:	0262                	.insn	2, 0x0262
     af2:	0000                	.insn	2, 0x0000
     af4:	0405                	.insn	2, 0x0405
     af6:	be0a                	.insn	2, 0xbe0a
     af8:	0000                	.insn	2, 0x0000
     afa:	0b00                	.insn	2, 0x0b00
     afc:	02fa                	.insn	2, 0x02fa
     afe:	0000                	.insn	2, 0x0000
     b00:	3a01                	.insn	2, 0x3a01
     b02:	000000d7          	.insn	4, 0x00d7
     b06:	0c01                	.insn	2, 0x0c01
     b08:	021f 0000 3a01      	.insn	6, 0x3a010000021f
     b0e:	000000d7          	.insn	4, 0x00d7
     b12:	da0c                	.insn	2, 0xda0c
     b14:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     b18:	d73a                	.insn	2, 0xd73a
     b1a:	0000                	.insn	2, 0x0000
     b1c:	0c00                	.insn	2, 0x0c00
     b1e:	0465                	.insn	2, 0x0465
     b20:	0000                	.insn	2, 0x0000
     b22:	3a01                	.insn	2, 0x3a01
     b24:	000000d7          	.insn	4, 0x00d7
     b28:	1d0c                	.insn	2, 0x1d0c
     b2a:	0004                	.insn	2, 0x0004
     b2c:	0100                	.insn	2, 0x0100
     b2e:	d73a                	.insn	2, 0xd73a
     b30:	0000                	.insn	2, 0x0000
     b32:	0d00                	.insn	2, 0x0d00
     b34:	0302                	.insn	2, 0x0302
     b36:	0000                	.insn	2, 0x0000
     b38:	3c01                	.insn	2, 0x3c01
     b3a:	000000d7          	.insn	4, 0x00d7
     b3e:	7f0d                	.insn	2, 0x7f0d
     b40:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     b44:	d73d                	.insn	2, 0xd73d
     b46:	0000                	.insn	2, 0x0000
     b48:	0d00                	.insn	2, 0x0d00
     b4a:	00e0                	.insn	2, 0x00e0
     b4c:	0000                	.insn	2, 0x0000
     b4e:	3e01                	.insn	2, 0x3e01
     b50:	000000d7          	.insn	4, 0x00d7
     b54:	710d                	.insn	2, 0x710d
     b56:	0000                	.insn	2, 0x0000
     b58:	0100                	.insn	2, 0x0100
     b5a:	0000d73f 340e0000 	.insn	8, 0x340e00000000d73f
     b62:	1800400b          	.insn	4, 0x1800400b
     b66:	0000                	.insn	2, 0x0000
     b68:	0100                	.insn	2, 0x0100
     b6a:	5d52                	.insn	2, 0x5d52
     b6c:	0004                	.insn	2, 0x0004
     b6e:	0100                	.insn	2, 0x0100
     b70:	0f4e                	.insn	2, 0x0f4e
     b72:	000000e3          	beqz	zero,1372 <$d.11+0x193>
     b76:	0b34                	.insn	2, 0x0b34
     b78:	0040                	.insn	2, 0x0040
     b7a:	0014                	.insn	2, 0x0014
     b7c:	0000                	.insn	2, 0x0000
     b7e:	5301                	.insn	2, 0x5301
     b80:	1005                	.insn	2, 0x1005
     b82:	00da                	.insn	2, 0x00da
     b84:	000000ef          	jal	b84 <$d.5+0x16c>
     b88:	0010                	.insn	2, 0x0010
     b8a:	00fa                	.insn	2, 0x00fa
     b8c:	0000                	.insn	2, 0x0000
     b8e:	0010                	.insn	2, 0x0010
     b90:	0105                	.insn	2, 0x0105
     b92:	0000                	.insn	2, 0x0000
     b94:	0010                	.insn	2, 0x0010
     b96:	0110                	.insn	2, 0x0110
     b98:	0000                	.insn	2, 0x0000
     b9a:	6211                	.insn	2, 0x6211
     b9c:	0005                	.insn	2, 0x0005
     b9e:	1b00                	.insn	2, 0x1b00
     ba0:	0001                	.insn	2, 0x0001
     ba2:	1200                	.insn	2, 0x1200
     ba4:	2600                	.insn	2, 0x2600
     ba6:	0001                	.insn	2, 0x0001
     ba8:	1200                	.insn	2, 0x1200
     baa:	3100                	.insn	2, 0x3100
     bac:	0001                	.insn	2, 0x0001
     bae:	1200                	.insn	2, 0x1200
     bb0:	00da                	.insn	2, 0x00da
     bb2:	013c                	.insn	2, 0x013c
     bb4:	0000                	.insn	2, 0x0000
     bb6:	0000                	.insn	2, 0x0000
     bb8:	00027713          	andi	a4,tp,0
     bbc:	0100                	.insn	2, 0x0100
     bbe:	0239                	.insn	2, 0x0239
     bc0:	01f6                	.insn	2, 0x01f6
     bc2:	0000                	.insn	2, 0x0000
     bc4:	1401                	.insn	2, 0x1401
     bc6:	00a6                	.insn	2, 0x00a6
     bc8:	0000                	.insn	2, 0x0000
     bca:	3901                	.insn	2, 0x3901
     bcc:	c502                	.insn	2, 0xc502
     bce:	0000                	.insn	2, 0x0000
     bd0:	1400                	.insn	2, 0x1400
     bd2:	0302                	.insn	2, 0x0302
     bd4:	0000                	.insn	2, 0x0000
     bd6:	3a01                	.insn	2, 0x3a01
     bd8:	c502                	.insn	2, 0xc502
     bda:	0000                	.insn	2, 0x0000
     bdc:	1400                	.insn	2, 0x1400
     bde:	037f 0000 3b01 c502 	.insn	10, 0xc5023b010000037f
     be6:	0000 
     be8:	1400                	.insn	2, 0x1400
     bea:	00e0                	.insn	2, 0x00e0
     bec:	0000                	.insn	2, 0x0000
     bee:	3c01                	.insn	2, 0x3c01
     bf0:	c502                	.insn	2, 0xc502
     bf2:	0000                	.insn	2, 0x0000
     bf4:	1400                	.insn	2, 0x1400
     bf6:	0336                	.insn	2, 0x0336
     bf8:	0000                	.insn	2, 0x0000
     bfa:	3d01                	.insn	2, 0x3d01
     bfc:	c502                	.insn	2, 0xc502
     bfe:	0000                	.insn	2, 0x0000
     c00:	1500                	.insn	2, 0x1500
     c02:	019c                	.insn	2, 0x019c
     c04:	0000                	.insn	2, 0x0000
     c06:	3f01                	.insn	2, 0x3f01
     c08:	c502                	.insn	2, 0xc502
     c0a:	0000                	.insn	2, 0x0000
     c0c:	0000                	.insn	2, 0x0000
     c0e:	d009                	.insn	2, 0xd009
     c10:	0000                	.insn	2, 0x0000
     c12:	f100                	.insn	2, 0xf100
     c14:	0001                	.insn	2, 0x0001
     c16:	0300                	.insn	2, 0x0300
     c18:	1611                	.insn	2, 0x1611
     c1a:	0000044b          	.insn	4, 0x044b
     c1e:	0101                	.insn	2, 0x0101
     c20:	0102                	.insn	2, 0x0102
     c22:	6214                	.insn	2, 0x6214
     c24:	0004                	.insn	2, 0x0004
     c26:	0100                	.insn	2, 0x0100
     c28:	0201                	.insn	2, 0x0201
     c2a:	0000003f 01101600 	.insn	8, 0x011016000000003f
     c32:	0000                	.insn	2, 0x0000
     c34:	2901                	.insn	2, 0x2901
     c36:	0102                	.insn	2, 0x0102
     c38:	f214                	.insn	2, 0xf214
     c3a:	0000                	.insn	2, 0x0000
     c3c:	0100                	.insn	2, 0x0100
     c3e:	0229                	.insn	2, 0x0229
     c40:	000000d7          	.insn	4, 0x00d7
     c44:	1700                	.insn	2, 0x1700
     c46:	0b4c                	.insn	2, 0x0b4c
     c48:	0040                	.insn	2, 0x0040
     c4a:	035c                	.insn	2, 0x035c
     c4c:	0000                	.insn	2, 0x0000
     c4e:	5201                	.insn	2, 0x5201
     c50:	00000373          	.insn	4, 0x0373
     c54:	7801                	.insn	2, 0x7801
     c56:	7f18                	.insn	2, 0x7f18
     c58:	0005                	.insn	2, 0x0005
     c5a:	9300                	.insn	2, 0x9300
     c5c:	0000                	.insn	2, 0x0000
     c5e:	0100                	.insn	2, 0x0100
     c60:	c578                	.insn	2, 0xc578
     c62:	0000                	.insn	2, 0x0000
     c64:	1900                	.insn	2, 0x1900
     c66:	9104                	.insn	2, 0x9104
     c68:	a090                	.insn	2, 0xa090
     c6a:	8a01                	.insn	2, 0x8a01
     c6c:	0000                	.insn	2, 0x0000
     c6e:	0100                	.insn	2, 0x0100
     c70:	9486                	.insn	2, 0x9486
     c72:	000d                	.insn	2, 0x000d
     c74:	1900                	.insn	2, 0x1900
     c76:	9104                	.insn	2, 0x9104
     c78:	8090                	.insn	2, 0x8090
     c7a:	b701                	.insn	2, 0xb701
     c7c:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     c80:	000d9487          	.insn	4, 0x000d9487
     c84:	1900                	.insn	2, 0x1900
     c86:	9102                	.insn	2, 0x9102
     c88:	3310                	.insn	2, 0x3310
     c8a:	0000                	.insn	2, 0x0000
     c8c:	0100                	.insn	2, 0x0100
     c8e:	a688                	.insn	2, 0xa688
     c90:	000d                	.insn	2, 0x000d
     c92:	1a00                	.insn	2, 0x1a00
     c94:	0b5c                	.insn	2, 0x0b5c
     c96:	0040                	.insn	2, 0x0040
     c98:	0088                	.insn	2, 0x0088
     c9a:	0000                	.insn	2, 0x0000
     c9c:	0005a51b          	.insn	4, 0x0005a51b
     ca0:	3c00                	.insn	2, 0x3c00
     ca2:	0000                	.insn	2, 0x0000
     ca4:	0100                	.insn	2, 0x0100
     ca6:	0000c58b          	.insn	4, 0xc58b
     caa:	1a00                	.insn	2, 0x1a00
     cac:	0b8c                	.insn	2, 0x0b8c
     cae:	0040                	.insn	2, 0x0040
     cb0:	0044                	.insn	2, 0x0044
     cb2:	0000                	.insn	2, 0x0000
     cb4:	0005cc1b          	.insn	4, 0x0005cc1b
     cb8:	3300                	.insn	2, 0x3300
     cba:	0004                	.insn	2, 0x0004
     cbc:	0100                	.insn	2, 0x0100
     cbe:	c58c                	.insn	2, 0xc58c
     cc0:	0000                	.insn	2, 0x0000
     cc2:	0000                	.insn	2, 0x0000
     cc4:	1c00                	.insn	2, 0x1c00
     cc6:	01a0                	.insn	2, 0x01a0
     cc8:	0000                	.insn	2, 0x0000
     cca:	0120                	.insn	2, 0x0120
     ccc:	0000                	.insn	2, 0x0000
     cce:	9901                	.insn	2, 0x9901
     cd0:	1d05                	.insn	2, 0x1d05
     cd2:	0631                	.insn	2, 0x0631
     cd4:	0000                	.insn	2, 0x0000
     cd6:	01ad                	.insn	2, 0x01ad
     cd8:	0000                	.insn	2, 0x0000
     cda:	951d                	.insn	2, 0x951d
     cdc:	0006                	.insn	2, 0x0006
     cde:	b900                	.insn	2, 0xb900
     ce0:	0001                	.insn	2, 0x0001
     ce2:	1d00                	.insn	2, 0x1d00
     ce4:	0676                	.insn	2, 0x0676
     ce6:	0000                	.insn	2, 0x0000
     ce8:	01c5                	.insn	2, 0x01c5
     cea:	0000                	.insn	2, 0x0000
     cec:	591d                	.insn	2, 0x591d
     cee:	0006                	.insn	2, 0x0006
     cf0:	d100                	.insn	2, 0xd100
     cf2:	0001                	.insn	2, 0x0001
     cf4:	1d00                	.insn	2, 0x1d00
     cf6:	0000060b          	.insn	4, 0x060b
     cfa:	01dd                	.insn	2, 0x01dd
     cfc:	0000                	.insn	2, 0x0000
     cfe:	b411                	.insn	2, 0xb411
     d00:	0006                	.insn	2, 0x0006
     d02:	e900                	.insn	2, 0xe900
     d04:	0001                	.insn	2, 0x0001
     d06:	0000                	.insn	2, 0x0000
     d08:	011c                	.insn	2, 0x011c
     d0a:	0002                	.insn	2, 0x0002
     d0c:	3800                	.insn	2, 0x3800
     d0e:	0001                	.insn	2, 0x0001
     d10:	0100                	.insn	2, 0x0100
     d12:	05a2                	.insn	2, 0x05a2
     d14:	cf1d                	.insn	2, 0xcf1d
     d16:	0006                	.insn	2, 0x0006
     d18:	0a00                	.insn	2, 0x0a00
     d1a:	0002                	.insn	2, 0x0002
     d1c:	0000                	.insn	2, 0x0000
     d1e:	011c                	.insn	2, 0x011c
     d20:	0002                	.insn	2, 0x0002
     d22:	5000                	.insn	2, 0x5000
     d24:	0001                	.insn	2, 0x0001
     d26:	0100                	.insn	2, 0x0100
     d28:	f91d05a3          	sb	a7,-117(s10)
     d2c:	0006                	.insn	2, 0x0006
     d2e:	0a00                	.insn	2, 0x0a00
     d30:	0002                	.insn	2, 0x0002
     d32:	0000                	.insn	2, 0x0000
     d34:	3c1a                	.insn	2, 0x3c1a
     d36:	400c                	.insn	2, 0x400c
     d38:	6c00                	.insn	2, 0x6c00
     d3a:	0000                	.insn	2, 0x0000
     d3c:	1b00                	.insn	2, 0x1b00
     d3e:	0721                	.insn	2, 0x0721
     d40:	0000                	.insn	2, 0x0000
     d42:	003c                	.insn	2, 0x003c
     d44:	0000                	.insn	2, 0x0000
     d46:	a401                	.insn	2, 0xa401
     d48:	00c5                	.insn	2, 0x00c5
     d4a:	0000                	.insn	2, 0x0000
     d4c:	581a                	.insn	2, 0x581a
     d4e:	400c                	.insn	2, 0x400c
     d50:	3400                	.insn	2, 0x3400
     d52:	0000                	.insn	2, 0x0000
     d54:	1b00                	.insn	2, 0x1b00
     d56:	0748                	.insn	2, 0x0748
     d58:	0000                	.insn	2, 0x0000
     d5a:	00000433          	add	s0,zero,zero
     d5e:	a501                	.insn	2, 0xa501
     d60:	00c5                	.insn	2, 0x00c5
     d62:	0000                	.insn	2, 0x0000
     d64:	0002170f          	.insn	4, 0x0002170f
     d68:	6c00                	.insn	2, 0x6c00
     d6a:	400c                	.insn	2, 0x400c
     d6c:	0c00                	.insn	2, 0x0c00
     d6e:	0000                	.insn	2, 0x0000
     d70:	0100                	.insn	2, 0x0100
     d72:	0da6                	.insn	2, 0x0da6
     d74:	011e                	.insn	2, 0x011e
     d76:	00022057          	.insn	4, 0x00022057
     d7a:	0000                	.insn	2, 0x0000
     d7c:	0002010f          	.insn	4, 0x0002010f
     d80:	7800                	.insn	2, 0x7800
     d82:	400c                	.insn	2, 0x400c
     d84:	0c00                	.insn	2, 0x0c00
     d86:	0000                	.insn	2, 0x0000
     d88:	0100                	.insn	2, 0x0100
     d8a:	201f0da7          	.insn	4, 0x201f0da7
     d8e:	020a                	.insn	2, 0x020a
     d90:	0000                	.insn	2, 0x0000
     d92:	0000                	.insn	2, 0x0000
     d94:	0002010f          	.insn	4, 0x0002010f
     d98:	8c00                	.insn	2, 0x8c00
     d9a:	400c                	.insn	2, 0x400c
     d9c:	0c00                	.insn	2, 0x0c00
     d9e:	0000                	.insn	2, 0x0000
     da0:	0100                	.insn	2, 0x0100
     da2:	09a9                	.insn	2, 0x09a9
     da4:	0a1f 020a 0000      	.insn	6, 0x020a0a1f
     daa:	0000                	.insn	2, 0x0000
     dac:	011c                	.insn	2, 0x011c
     dae:	0002                	.insn	2, 0x0002
     db0:	6800                	.insn	2, 0x6800
     db2:	0001                	.insn	2, 0x0001
     db4:	0100                	.insn	2, 0x0100
     db6:	931d05ab          	.insn	4, 0x931d05ab
     dba:	0a000007          	.insn	4, 0x0a000007
     dbe:	0002                	.insn	2, 0x0002
     dc0:	0000                	.insn	2, 0x0000
     dc2:	011c                	.insn	2, 0x011c
     dc4:	0002                	.insn	2, 0x0002
     dc6:	8000                	.insn	2, 0x8000
     dc8:	0001                	.insn	2, 0x0001
     dca:	0100                	.insn	2, 0x0100
     dcc:	05ae                	.insn	2, 0x05ae
     dce:	bb1d                	.insn	2, 0xbb1d
     dd0:	0a000007          	.insn	4, 0x0a000007
     dd4:	0002                	.insn	2, 0x0002
     dd6:	0000                	.insn	2, 0x0000
     dd8:	011c                	.insn	2, 0x011c
     dda:	0002                	.insn	2, 0x0002
     ddc:	9800                	.insn	2, 0x9800
     dde:	0001                	.insn	2, 0x0001
     de0:	0100                	.insn	2, 0x0100
     de2:	e51d05af          	.insn	4, 0xe51d05af
     de6:	0a000007          	.insn	4, 0x0a000007
     dea:	0002                	.insn	2, 0x0002
     dec:	0000                	.insn	2, 0x0000
     dee:	2c1a                	.insn	2, 0x2c1a
     df0:	400d                	.insn	2, 0x400d
     df2:	7800                	.insn	2, 0x7800
     df4:	0000                	.insn	2, 0x0000
     df6:	1b00                	.insn	2, 0x1b00
     df8:	080d                	.insn	2, 0x080d
     dfa:	0000                	.insn	2, 0x0000
     dfc:	003c                	.insn	2, 0x003c
     dfe:	0000                	.insn	2, 0x0000
     e00:	b001                	.insn	2, 0xb001
     e02:	00c5                	.insn	2, 0x00c5
     e04:	0000                	.insn	2, 0x0000
     e06:	541a                	.insn	2, 0x541a
     e08:	400d                	.insn	2, 0x400d
     e0a:	3400                	.insn	2, 0x3400
     e0c:	0000                	.insn	2, 0x0000
     e0e:	1b00                	.insn	2, 0x1b00
     e10:	0834                	.insn	2, 0x0834
     e12:	0000                	.insn	2, 0x0000
     e14:	00000433          	add	s0,zero,zero
     e18:	b101                	.insn	2, 0xb101
     e1a:	00c5                	.insn	2, 0x00c5
     e1c:	0000                	.insn	2, 0x0000
     e1e:	0002170f          	.insn	4, 0x0002170f
     e22:	6800                	.insn	2, 0x6800
     e24:	400d                	.insn	2, 0x400d
     e26:	0c00                	.insn	2, 0x0c00
     e28:	0000                	.insn	2, 0x0000
     e2a:	0100                	.insn	2, 0x0100
     e2c:	0db2                	.insn	2, 0x0db2
     e2e:	011e                	.insn	2, 0x011e
     e30:	00022057          	.insn	4, 0x00022057
     e34:	0000                	.insn	2, 0x0000
     e36:	0002010f          	.insn	4, 0x0002010f
     e3a:	7400                	.insn	2, 0x7400
     e3c:	400d                	.insn	2, 0x400d
     e3e:	0c00                	.insn	2, 0x0c00
     e40:	0000                	.insn	2, 0x0000
     e42:	0100                	.insn	2, 0x0100
     e44:	201f0db3          	.insn	4, 0x201f0db3
     e48:	020a                	.insn	2, 0x020a
     e4a:	0000                	.insn	2, 0x0000
     e4c:	0000                	.insn	2, 0x0000
     e4e:	0002010f          	.insn	4, 0x0002010f
     e52:	8800                	.insn	2, 0x8800
     e54:	400d                	.insn	2, 0x400d
     e56:	0c00                	.insn	2, 0x0c00
     e58:	0000                	.insn	2, 0x0000
     e5a:	0100                	.insn	2, 0x0100
     e5c:	09b5                	.insn	2, 0x09b5
     e5e:	0a1f 020a 0000      	.insn	6, 0x020a0a1f
     e64:	0000                	.insn	2, 0x0000
     e66:	011c                	.insn	2, 0x011c
     e68:	0002                	.insn	2, 0x0002
     e6a:	b000                	.insn	2, 0xb000
     e6c:	0001                	.insn	2, 0x0001
     e6e:	0100                	.insn	2, 0x0100
     e70:	7f1d05b7          	lui	a1,0x7f1d0
     e74:	0008                	.insn	2, 0x0008
     e76:	0a00                	.insn	2, 0x0a00
     e78:	0002                	.insn	2, 0x0002
     e7a:	0000                	.insn	2, 0x0000
     e7c:	011c                	.insn	2, 0x011c
     e7e:	0002                	.insn	2, 0x0002
     e80:	c800                	.insn	2, 0xc800
     e82:	0001                	.insn	2, 0x0001
     e84:	0100                	.insn	2, 0x0100
     e86:	05ba                	.insn	2, 0x05ba
     e88:	a71d                	.insn	2, 0xa71d
     e8a:	0008                	.insn	2, 0x0008
     e8c:	0a00                	.insn	2, 0x0a00
     e8e:	0002                	.insn	2, 0x0002
     e90:	0000                	.insn	2, 0x0000
     e92:	011c                	.insn	2, 0x011c
     e94:	0002                	.insn	2, 0x0002
     e96:	e000                	.insn	2, 0xe000
     e98:	0001                	.insn	2, 0x0001
     e9a:	0100                	.insn	2, 0x0100
     e9c:	d11d05bb          	.insn	4, 0xd11d05bb
     ea0:	0008                	.insn	2, 0x0008
     ea2:	0a00                	.insn	2, 0x0a00
     ea4:	0002                	.insn	2, 0x0002
     ea6:	0000                	.insn	2, 0x0000
     ea8:	2c1a                	.insn	2, 0x2c1a
     eaa:	400e                	.insn	2, 0x400e
     eac:	5c00                	.insn	2, 0x5c00
     eae:	0000                	.insn	2, 0x0000
     eb0:	1b00                	.insn	2, 0x1b00
     eb2:	08f9                	.insn	2, 0x08f9
     eb4:	0000                	.insn	2, 0x0000
     eb6:	003c                	.insn	2, 0x003c
     eb8:	0000                	.insn	2, 0x0000
     eba:	bc01                	.insn	2, 0xbc01
     ebc:	00c5                	.insn	2, 0x00c5
     ebe:	0000                	.insn	2, 0x0000
     ec0:	481a                	.insn	2, 0x481a
     ec2:	400e                	.insn	2, 0x400e
     ec4:	2800                	.insn	2, 0x2800
     ec6:	0000                	.insn	2, 0x0000
     ec8:	1b00                	.insn	2, 0x1b00
     eca:	0920                	.insn	2, 0x0920
     ecc:	0000                	.insn	2, 0x0000
     ece:	00000433          	add	s0,zero,zero
     ed2:	bd01                	.insn	2, 0xbd01
     ed4:	00c5                	.insn	2, 0x00c5
     ed6:	0000                	.insn	2, 0x0000
     ed8:	0002170f          	.insn	4, 0x0002170f
     edc:	4c00                	.insn	2, 0x4c00
     ede:	400e                	.insn	2, 0x400e
     ee0:	0c00                	.insn	2, 0x0c00
     ee2:	0000                	.insn	2, 0x0000
     ee4:	0100                	.insn	2, 0x0100
     ee6:	0dbe                	.insn	2, 0x0dbe
     ee8:	011e                	.insn	2, 0x011e
     eea:	2056                	.insn	2, 0x2056
     eec:	0002                	.insn	2, 0x0002
     eee:	0000                	.insn	2, 0x0000
     ef0:	0002010f          	.insn	4, 0x0002010f
     ef4:	5800                	.insn	2, 0x5800
     ef6:	400e                	.insn	2, 0x400e
     ef8:	0c00                	.insn	2, 0x0c00
     efa:	0000                	.insn	2, 0x0000
     efc:	0100                	.insn	2, 0x0100
     efe:	201f0dbf 0000020a 	.insn	8, 0x020a201f0dbf
     f06:	0000                	.insn	2, 0x0000
     f08:	0002010f          	.insn	4, 0x0002010f
     f0c:	7000                	.insn	2, 0x7000
     f0e:	400e                	.insn	2, 0x400e
     f10:	0c00                	.insn	2, 0x0c00
     f12:	0000                	.insn	2, 0x0000
     f14:	0100                	.insn	2, 0x0100
     f16:	09c1                	.insn	2, 0x09c1
     f18:	0a1f 020a 0000      	.insn	6, 0x020a0a1f
     f1e:	0000                	.insn	2, 0x0000
     f20:	0002010f          	.insn	4, 0x0002010f
     f24:	8c00                	.insn	2, 0x8c00
     f26:	400e                	.insn	2, 0x400e
     f28:	0c00                	.insn	2, 0x0c00
     f2a:	0000                	.insn	2, 0x0000
     f2c:	0100                	.insn	2, 0x0100
     f2e:	0a1f05c3          	.insn	4, 0x0a1f05c3
     f32:	020a                	.insn	2, 0x020a
     f34:	0000                	.insn	2, 0x0000
     f36:	0000                	.insn	2, 0x0000
     f38:	a820                	.insn	2, 0xa820
     f3a:	400e                	.insn	2, 0x400e
     f3c:	1400                	.insn	2, 0x1400
     f3e:	0000                	.insn	2, 0x0000
     f40:	0100                	.insn	2, 0x0100
     f42:	0152                	.insn	2, 0x0152
     f44:	0002                	.insn	2, 0x0002
     f46:	1d00                	.insn	2, 0x1d00
     f48:	0959                	.insn	2, 0x0959
     f4a:	0000                	.insn	2, 0x0000
     f4c:	020a                	.insn	2, 0x020a
     f4e:	0000                	.insn	2, 0x0000
     f50:	2000                	.insn	2, 0x2000
     f52:	0ebc                	.insn	2, 0x0ebc
     f54:	0040                	.insn	2, 0x0040
     f56:	0014                	.insn	2, 0x0014
     f58:	0000                	.insn	2, 0x0000
     f5a:	5201                	.insn	2, 0x5201
     f5c:	00000217          	auipc	tp,0x0
     f60:	7f1d                	.insn	2, 0x7f1d
     f62:	0009                	.insn	2, 0x0009
     f64:	2000                	.insn	2, 0x2000
     f66:	0002                	.insn	2, 0x0002
     f68:	0000                	.insn	2, 0x0000
     f6a:	00013e13          	sltiu	t3,sp,0
     f6e:	0100                	.insn	2, 0x0100
     f70:	0250                	.insn	2, 0x0250
     f72:	01f6                	.insn	2, 0x01f6
     f74:	0000                	.insn	2, 0x0000
     f76:	1401                	.insn	2, 0x1401
     f78:	021f 0000 5001      	.insn	6, 0x50010000021f
     f7e:	c502                	.insn	2, 0xc502
     f80:	0000                	.insn	2, 0x0000
     f82:	1400                	.insn	2, 0x1400
     f84:	03da                	.insn	2, 0x03da
     f86:	0000                	.insn	2, 0x0000
     f88:	5001                	.insn	2, 0x5001
     f8a:	c502                	.insn	2, 0xc502
     f8c:	0000                	.insn	2, 0x0000
     f8e:	1500                	.insn	2, 0x1500
     f90:	0302                	.insn	2, 0x0302
     f92:	0000                	.insn	2, 0x0000
     f94:	5201                	.insn	2, 0x5201
     f96:	c502                	.insn	2, 0xc502
     f98:	0000                	.insn	2, 0x0000
     f9a:	1500                	.insn	2, 0x1500
     f9c:	0071                	.insn	2, 0x0071
     f9e:	0000                	.insn	2, 0x0000
     fa0:	5301                	.insn	2, 0x5301
     fa2:	c502                	.insn	2, 0xc502
     fa4:	0000                	.insn	2, 0x0000
     fa6:	0000                	.insn	2, 0x0000
     fa8:	400ed017          	auipc	zero,0x400ed
     fac:	0c00                	.insn	2, 0x0c00
     fae:	0000                	.insn	2, 0x0000
     fb0:	0100                	.insn	2, 0x0100
     fb2:	e352                	.insn	2, 0xe352
     fb4:	0002                	.insn	2, 0x0002
     fb6:	0100                	.insn	2, 0x0100
     fb8:	18c8                	.insn	2, 0x18c8
     fba:	09a5                	.insn	2, 0x09a5
     fbc:	0000                	.insn	2, 0x0000
     fbe:	0056                	.insn	2, 0x0056
     fc0:	0000                	.insn	2, 0x0000
     fc2:	c801                	.insn	2, 0xc801
     fc4:	00d0                	.insn	2, 0x00d0
     fc6:	0000                	.insn	2, 0x0000
     fc8:	0005520f          	.insn	4, 0x0005520f
     fcc:	d000                	.insn	2, 0xd000
     fce:	400e                	.insn	2, 0x400e
     fd0:	0800                	.insn	2, 0x0800
     fd2:	0000                	.insn	2, 0x0000
     fd4:	0100                	.insn	2, 0x0100
     fd6:	141f05cb          	.insn	4, 0x141f05cb
     fda:	055f 0000 011e      	.insn	6, 0x011e0000055f
     fe0:	6b5a                	.insn	2, 0x6b5a
     fe2:	0005                	.insn	2, 0x0005
     fe4:	2100                	.insn	2, 0x2100
     fe6:	5a01                	.insn	2, 0x5a01
     fe8:	00000577          	.insn	4, 0x0577
     fec:	1422                	.insn	2, 0x1422
     fee:	00000583          	lb	a1,0(zero) # 0 <$d.4>
     ff2:	0000                	.insn	2, 0x0000
     ff4:	0001460b          	.insn	4, 0x0001460b
     ff8:	0100                	.insn	2, 0x0100
     ffa:	c5d2                	.insn	2, 0xc5d2
     ffc:	0000                	.insn	2, 0x0000
     ffe:	0100                	.insn	2, 0x0100
    1000:	1f0c                	.insn	2, 0x1f0c
    1002:	0002                	.insn	2, 0x0002
    1004:	0100                	.insn	2, 0x0100
    1006:	0000c5d3          	.insn	4, 0xc5d3
    100a:	0c00                	.insn	2, 0x0c00
    100c:	03da                	.insn	2, 0x03da
    100e:	0000                	.insn	2, 0x0000
    1010:	d401                	.insn	2, 0xd401
    1012:	00c5                	.insn	2, 0x00c5
    1014:	0000                	.insn	2, 0x0000
    1016:	650c                	.insn	2, 0x650c
    1018:	0004                	.insn	2, 0x0004
    101a:	0100                	.insn	2, 0x0100
    101c:	c5d5                	.insn	2, 0xc5d5
    101e:	0000                	.insn	2, 0x0000
    1020:	0d00                	.insn	2, 0x0d00
    1022:	0071                	.insn	2, 0x0071
    1024:	0000                	.insn	2, 0x0000
    1026:	d901                	.insn	2, 0xd901
    1028:	00c5                	.insn	2, 0x00c5
    102a:	0000                	.insn	2, 0x0000
    102c:	020d                	.insn	2, 0x020d
    102e:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1032:	0000c5d7          	.insn	4, 0xc5d7
    1036:	0d00                	.insn	2, 0x0d00
    1038:	037f 0000 d801 00c5 	.insn	10, 0x00c5d8010000037f
    1040:	0000 
    1042:	2300                	.insn	2, 0x2300
    1044:	0edc                	.insn	2, 0x0edc
    1046:	0040                	.insn	2, 0x0040
    1048:	00ac                	.insn	2, 0x00ac
    104a:	0000                	.insn	2, 0x0000
    104c:	5201                	.insn	2, 0x5201
    104e:	0042                	.insn	2, 0x0042
    1050:	0000                	.insn	2, 0x0000
    1052:	e701                	.insn	2, 0xe701
    1054:	01f6                	.insn	2, 0x01f6
    1056:	0000                	.insn	2, 0x0000
    1058:	c018                	.insn	2, 0xc018
    105a:	0009                	.insn	2, 0x0009
    105c:	5600                	.insn	2, 0x5600
    105e:	0000                	.insn	2, 0x0000
    1060:	0100                	.insn	2, 0x0100
    1062:	c5e8                	.insn	2, 0xc5e8
    1064:	0000                	.insn	2, 0x0000
    1066:	1900                	.insn	2, 0x1900
    1068:	9102                	.insn	2, 0x9102
    106a:	c210                	.insn	2, 0xc210
    106c:	0000                	.insn	2, 0x0000
    106e:	0100                	.insn	2, 0x0100
    1070:	c5ea                	.insn	2, 0xc5ea
    1072:	0000                	.insn	2, 0x0000
    1074:	1900                	.insn	2, 0x1900
    1076:	9102                	.insn	2, 0x9102
    1078:	220c                	.insn	2, 0x220c
    107a:	0004                	.insn	2, 0x0004
    107c:	0100                	.insn	2, 0x0100
    107e:	0000c5eb          	.insn	4, 0xc5eb
    1082:	1b00                	.insn	2, 0x1b00
    1084:	09f1                	.insn	2, 0x09f1
    1086:	0000                	.insn	2, 0x0000
    1088:	031a                	.insn	2, 0x031a
    108a:	0000                	.insn	2, 0x0000
    108c:	fb01                	.insn	2, 0xfb01
    108e:	00c5                	.insn	2, 0x00c5
    1090:	0000                	.insn	2, 0x0000
    1092:	dc24                	.insn	2, 0xdc24
    1094:	0005                	.insn	2, 0x0005
    1096:	7400                	.insn	2, 0x7400
    1098:	1400400f          	.insn	4, 0x1400400f
    109c:	0000                	.insn	2, 0x0000
    109e:	0100                	.insn	2, 0x0100
    10a0:	0105                	.insn	2, 0x0105
    10a2:	1f0c                	.insn	2, 0x1f0c
    10a4:	e815                	.insn	2, 0xe815
    10a6:	0005                	.insn	2, 0x0005
    10a8:	1e00                	.insn	2, 0x1e00
    10aa:	5801                	.insn	2, 0x5801
    10ac:	000005f3          	.insn	4, 0x05f3
    10b0:	011e                	.insn	2, 0x011e
    10b2:	fe59                	.insn	2, 0xfe59
    10b4:	0005                	.insn	2, 0x0005
    10b6:	2200                	.insn	2, 0x2200
    10b8:	0915                	.insn	2, 0x0915
    10ba:	0006                	.insn	2, 0x0006
    10bc:	1100                	.insn	2, 0x1100
    10be:	0a0c                	.insn	2, 0x0a0c
    10c0:	0000                	.insn	2, 0x0000
    10c2:	0614                	.insn	2, 0x0614
    10c4:	0000                	.insn	2, 0x0000
    10c6:	0121                	.insn	2, 0x0121
    10c8:	1f59                	.insn	2, 0x1f59
    10ca:	0006                	.insn	2, 0x0006
    10cc:	0000                	.insn	2, 0x0000
    10ce:	db25                	.insn	2, 0xdb25
    10d0:	0006                	.insn	2, 0x0006
    10d2:	0800                	.insn	2, 0x0800
    10d4:	2500400f          	.insn	4, 0x2500400f
    10d8:	0710                	.insn	2, 0x0710
    10da:	0000                	.insn	2, 0x0000
    10dc:	0f34                	.insn	2, 0x0f34
    10de:	0040                	.insn	2, 0x0040
    10e0:	ac25                	.insn	2, 0xac25
    10e2:	0008                	.insn	2, 0x0008
    10e4:	5400                	.insn	2, 0x5400
    10e6:	2500400f          	.insn	4, 0x2500400f
    10ea:	0710                	.insn	2, 0x0710
    10ec:	0000                	.insn	2, 0x0000
    10ee:	0f74                	.insn	2, 0x0f74
    10f0:	0040                	.insn	2, 0x0040
    10f2:	2600                	.insn	2, 0x2600
    10f4:	0154                	.insn	2, 0x0154
    10f6:	0000                	.insn	2, 0x0000
    10f8:	0f04                	.insn	2, 0x0f04
    10fa:	000000d7          	.insn	4, 0x00d7
    10fe:	0006f627          	.insn	4, 0x0006f627
    1102:	2700                	.insn	2, 0x2700
    1104:	0700                	.insn	2, 0x0700
    1106:	0000                	.insn	2, 0x0000
    1108:	00070027          	.insn	4, 0x00070027
    110c:	0000                	.insn	2, 0x0000
    110e:	fb0a                	.insn	2, 0xfb0a
    1110:	0006                	.insn	2, 0x0006
    1112:	2800                	.insn	2, 0x2800
    1114:	0000003f 0007050a 	.insn	8, 0x0007050a0000003f
    111c:	0900                	.insn	2, 0x0900
    111e:	00d0                	.insn	2, 0x00d0
    1120:	0000                	.insn	2, 0x0000
    1122:	01f1                	.insn	2, 0x01f1
    1124:	0000                	.insn	2, 0x0000
    1126:	1505                	.insn	2, 0x1505
    1128:	8829                	.insn	2, 0x8829
    112a:	bc00400f          	.insn	4, 0xbc00400f
    112e:	0002                	.insn	2, 0x0002
    1130:	0100                	.insn	2, 0x0100
    1132:	f152                	.insn	2, 0xf152
    1134:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1138:	0159                	.insn	2, 0x0159
    113a:	322a                	.insn	2, 0x322a
    113c:	000a                	.insn	2, 0x000a
    113e:	0200                	.insn	2, 0x0200
    1140:	0004                	.insn	2, 0x0004
    1142:	0100                	.insn	2, 0x0100
    1144:	0159                	.insn	2, 0x0159
    1146:	06f6                	.insn	2, 0x06f6
    1148:	0000                	.insn	2, 0x0000
    114a:	1891022b          	.insn	4, 0x1891022b
    114e:	046a                	.insn	2, 0x046a
    1150:	0000                	.insn	2, 0x0000
    1152:	5a01                	.insn	2, 0x5a01
    1154:	b801                	.insn	2, 0xb801
    1156:	000d                	.insn	2, 0x000d
    1158:	2c00                	.insn	2, 0x2c00
    115a:	03c0                	.insn	2, 0x03c0
    115c:	0000                	.insn	2, 0x0000
    115e:	9f01                	.insn	2, 0x9f01
    1160:	2801                	.insn	2, 0x2801
    1162:	4012                	.insn	2, 0x4012
    1164:	2d00                	.insn	2, 0x2d00
    1166:	01f8                	.insn	2, 0x01f8
    1168:	0000                	.insn	2, 0x0000
    116a:	0d91022b          	.insn	4, 0x0d91022b
    116e:	000000e3          	beqz	zero,196e <$d.5+0x17d>
    1172:	7c01                	.insn	2, 0x7c01
    1174:	c201                	.insn	2, 0xc201
    1176:	000d                	.insn	2, 0x000d
    1178:	2e00                	.insn	2, 0x2e00
    117a:	0a58                	.insn	2, 0x0a58
    117c:	0000                	.insn	2, 0x0000
    117e:	02f0                	.insn	2, 0x02f0
    1180:	0000                	.insn	2, 0x0000
    1182:	7001                	.insn	2, 0x7001
    1184:	d701                	.insn	2, 0xd701
    1186:	0000                	.insn	2, 0x0000
    1188:	2e00                	.insn	2, 0x2e00
    118a:	0a7e                	.insn	2, 0x0a7e
    118c:	0000                	.insn	2, 0x0000
    118e:	0435                	.insn	2, 0x0435
    1190:	0000                	.insn	2, 0x0000
    1192:	7201                	.insn	2, 0x7201
    1194:	d001                	.insn	2, 0xd001
    1196:	0000                	.insn	2, 0x0000
    1198:	2e00                	.insn	2, 0x2e00
    119a:	0aba                	.insn	2, 0x0aba
    119c:	0000                	.insn	2, 0x0000
    119e:	003c                	.insn	2, 0x003c
    11a0:	0000                	.insn	2, 0x0000
    11a2:	7d01                	.insn	2, 0x7d01
    11a4:	d701                	.insn	2, 0xd701
    11a6:	0000                	.insn	2, 0x0000
    11a8:	2400                	.insn	2, 0x2400
    11aa:	0201                	.insn	2, 0x0201
    11ac:	0000                	.insn	2, 0x0000
    11ae:	105c                	.insn	2, 0x105c
    11b0:	0040                	.insn	2, 0x0040
    11b2:	000c                	.insn	2, 0x000c
    11b4:	0000                	.insn	2, 0x0000
    11b6:	8101                	.insn	2, 0x8101
    11b8:	1901                	.insn	2, 0x1901
    11ba:	301f 020a 0000      	.insn	6, 0x020a301f
    11c0:	2400                	.insn	2, 0x2400
    11c2:	0201                	.insn	2, 0x0201
    11c4:	0000                	.insn	2, 0x0000
    11c6:	11b4                	.insn	2, 0x11b4
    11c8:	0040                	.insn	2, 0x0040
    11ca:	000c                	.insn	2, 0x000c
    11cc:	0000                	.insn	2, 0x0000
    11ce:	7401                	.insn	2, 0x7401
    11d0:	1901                	.insn	2, 0x1901
    11d2:	2d1f 020a 0000      	.insn	6, 0x020a2d1f
    11d8:	2f00                	.insn	2, 0x2f00
    11da:	0201                	.insn	2, 0x0201
    11dc:	0000                	.insn	2, 0x0000
    11de:	11fc                	.insn	2, 0x11fc
    11e0:	0040                	.insn	2, 0x0040
    11e2:	000c                	.insn	2, 0x000c
    11e4:	0000                	.insn	2, 0x0000
    11e6:	8c01                	.insn	2, 0x8c01
    11e8:	1901                	.insn	2, 0x1901
    11ea:	1a00                	.insn	2, 0x1a00
    11ec:	1078                	.insn	2, 0x1078
    11ee:	0040                	.insn	2, 0x0040
    11f0:	00e8                	.insn	2, 0x00e8
    11f2:	0000                	.insn	2, 0x0000
    11f4:	7f2e                	.insn	2, 0x7f2e
    11f6:	f000000b          	.insn	4, 0xf000000b
    11fa:	0002                	.insn	2, 0x0002
    11fc:	0100                	.insn	2, 0x0100
    11fe:	0191                	.insn	2, 0x0191
    1200:	00d0                	.insn	2, 0x00d0
    1202:	0000                	.insn	2, 0x0000
    1204:	881a                	.insn	2, 0x881a
    1206:	4010                	.insn	2, 0x4010
    1208:	d800                	.insn	2, 0xd800
    120a:	0000                	.insn	2, 0x0000
    120c:	2e00                	.insn	2, 0x2e00
    120e:	0afa                	.insn	2, 0x0afa
    1210:	0000                	.insn	2, 0x0000
    1212:	003c                	.insn	2, 0x003c
    1214:	0000                	.insn	2, 0x0000
    1216:	9201                	.insn	2, 0x9201
    1218:	d701                	.insn	2, 0xd701
    121a:	0000                	.insn	2, 0x0000
    121c:	1a00                	.insn	2, 0x1a00
    121e:	1088                	.insn	2, 0x1088
    1220:	0040                	.insn	2, 0x0040
    1222:	00d8                	.insn	2, 0x00d8
    1224:	0000                	.insn	2, 0x0000
    1226:	9a2e                	.insn	2, 0x9a2e
    1228:	6100000b          	.insn	4, 0x6100000b
    122c:	0001                	.insn	2, 0x0001
    122e:	0100                	.insn	2, 0x0100
    1230:	00d00193          	li	gp,13
    1234:	0000                	.insn	2, 0x0000
    1236:	0130                	.insn	2, 0x0130
    1238:	0002                	.insn	2, 0x0002
    123a:	1000                	.insn	2, 0x1000
    123c:	0002                	.insn	2, 0x0002
    123e:	0100                	.insn	2, 0x0100
    1240:	0194                	.insn	2, 0x0194
    1242:	0019                	.insn	2, 0x0019
    1244:	0000                	.insn	2, 0x0000
    1246:	0124                	.insn	2, 0x0124
    1248:	0002                	.insn	2, 0x0002
    124a:	6800                	.insn	2, 0x6800
    124c:	4011                	.insn	2, 0x4011
    124e:	0c00                	.insn	2, 0x0c00
    1250:	0000                	.insn	2, 0x0000
    1252:	0100                	.insn	2, 0x0100
    1254:	0165                	.insn	2, 0x0165
    1256:	1f15                	.insn	2, 0x1f15
    1258:	0a25                	.insn	2, 0x0a25
    125a:	0002                	.insn	2, 0x0002
    125c:	0000                	.insn	2, 0x0000
    125e:	7c1a                	.insn	2, 0x7c1a
    1260:	4011                	.insn	2, 0x4011
    1262:	3800                	.insn	2, 0x3800
    1264:	0000                	.insn	2, 0x0000
    1266:	2e00                	.insn	2, 0x2e00
    1268:	0c02                	.insn	2, 0x0c02
    126a:	0000                	.insn	2, 0x0000
    126c:	0152                	.insn	2, 0x0152
    126e:	0000                	.insn	2, 0x0000
    1270:	6801                	.insn	2, 0x6801
    1272:	f601                	.insn	2, 0xf601
    1274:	0006                	.insn	2, 0x0006
    1276:	2400                	.insn	2, 0x2400
    1278:	0201                	.insn	2, 0x0201
    127a:	0000                	.insn	2, 0x0000
    127c:	1198                	.insn	2, 0x1198
    127e:	0040                	.insn	2, 0x0040
    1280:	000c                	.insn	2, 0x000c
    1282:	0000                	.insn	2, 0x0000
    1284:	6a01                	.insn	2, 0x6a01
    1286:	1901                	.insn	2, 0x1901
    1288:	011e                	.insn	2, 0x011e
    128a:	0a59                	.insn	2, 0x0a59
    128c:	0002                	.insn	2, 0x0002
    128e:	0000                	.insn	2, 0x0000
    1290:	2400                	.insn	2, 0x2400
    1292:	0201                	.insn	2, 0x0201
    1294:	0000                	.insn	2, 0x0000
    1296:	121c                	.insn	2, 0x121c
    1298:	0040                	.insn	2, 0x0040
    129a:	000c                	.insn	2, 0x000c
    129c:	0000                	.insn	2, 0x0000
    129e:	6201                	.insn	2, 0x6201
    12a0:	1501                	.insn	2, 0x1501
    12a2:	251f 020a 0000      	.insn	6, 0x020a251f
    12a8:	2400                	.insn	2, 0x2400
    12aa:	0201                	.insn	2, 0x0201
    12ac:	0000                	.insn	2, 0x0000
    12ae:	101c                	.insn	2, 0x101c
    12b0:	0040                	.insn	2, 0x0040
    12b2:	000c                	.insn	2, 0x000c
    12b4:	0000                	.insn	2, 0x0000
    12b6:	9901                	.insn	2, 0x9901
    12b8:	0d01                	.insn	2, 0x0d01
    12ba:	011e                	.insn	2, 0x011e
    12bc:	0a59                	.insn	2, 0x0a59
    12be:	0002                	.insn	2, 0x0002
    12c0:	0000                	.insn	2, 0x0000
    12c2:	0031                	.insn	2, 0x0031
    12c4:	1a26                	.insn	2, 0x1a26
    12c6:	0001                	.insn	2, 0x0001
    12c8:	0300                	.insn	2, 0x0300
    12ca:	f625                	.insn	2, 0xf625
    12cc:	0001                	.insn	2, 0x0001
    12ce:	2700                	.insn	2, 0x2700
    12d0:	01f6                	.insn	2, 0x01f6
    12d2:	0000                	.insn	2, 0x0000
    12d4:	2900                	.insn	2, 0x2900
    12d6:	1244                	.insn	2, 0x1244
    12d8:	0040                	.insn	2, 0x0040
    12da:	000c                	.insn	2, 0x000c
    12dc:	0000                	.insn	2, 0x0000
    12de:	5201                	.insn	2, 0x5201
    12e0:	01ce                	.insn	2, 0x01ce
    12e2:	0000                	.insn	2, 0x0000
    12e4:	0e01                	.insn	2, 0x0e01
    12e6:	2a01                	.insn	2, 0x2a01
    12e8:	0c35                	.insn	2, 0x0c35
    12ea:	0000                	.insn	2, 0x0000
    12ec:	0056                	.insn	2, 0x0056
    12ee:	0000                	.insn	2, 0x0000
    12f0:	0e01                	.insn	2, 0x0e01
    12f2:	d001                	.insn	2, 0xd001
    12f4:	0000                	.insn	2, 0x0000
    12f6:	2400                	.insn	2, 0x2400
    12f8:	0552                	.insn	2, 0x0552
    12fa:	0000                	.insn	2, 0x0000
    12fc:	1244                	.insn	2, 0x1244
    12fe:	0040                	.insn	2, 0x0040
    1300:	0008                	.insn	2, 0x0008
    1302:	0000                	.insn	2, 0x0000
    1304:	1101                	.insn	2, 0x1101
    1306:	0501                	.insn	2, 0x0501
    1308:	151f 055f 0000      	.insn	6, 0x055f151f
    130e:	011e                	.insn	2, 0x011e
    1310:	6b5a                	.insn	2, 0x6b5a
    1312:	0005                	.insn	2, 0x0005
    1314:	2100                	.insn	2, 0x2100
    1316:	5a01                	.insn	2, 0x5a01
    1318:	00000577          	.insn	4, 0x0577
    131c:	1522                	.insn	2, 0x1522
    131e:	00000583          	lb	a1,0(zero) # 0 <$d.4>
    1322:	0000                	.insn	2, 0x0000
    1324:	00000013          	nop
    1328:	0100                	.insn	2, 0x0100
    132a:	0260                	.insn	2, 0x0260
    132c:	01f6                	.insn	2, 0x01f6
    132e:	0000                	.insn	2, 0x0000
    1330:	1401                	.insn	2, 0x1401
    1332:	021f 0000 6001      	.insn	6, 0x60010000021f
    1338:	c502                	.insn	2, 0xc502
    133a:	0000                	.insn	2, 0x0000
    133c:	1400                	.insn	2, 0x1400
    133e:	03da                	.insn	2, 0x03da
    1340:	0000                	.insn	2, 0x0000
    1342:	6001                	.insn	2, 0x6001
    1344:	c502                	.insn	2, 0xc502
    1346:	0000                	.insn	2, 0x0000
    1348:	1500                	.insn	2, 0x1500
    134a:	0302                	.insn	2, 0x0302
    134c:	0000                	.insn	2, 0x0000
    134e:	6201                	.insn	2, 0x6201
    1350:	c502                	.insn	2, 0xc502
    1352:	0000                	.insn	2, 0x0000
    1354:	1500                	.insn	2, 0x1500
    1356:	0071                	.insn	2, 0x0071
    1358:	0000                	.insn	2, 0x0000
    135a:	6301                	.insn	2, 0x6301
    135c:	c502                	.insn	2, 0xc502
    135e:	0000                	.insn	2, 0x0000
    1360:	0000                	.insn	2, 0x0000
    1362:	5029                	.insn	2, 0x5029
    1364:	4012                	.insn	2, 0x4012
    1366:	0c00                	.insn	2, 0x0c00
    1368:	0000                	.insn	2, 0x0000
    136a:	0100                	.insn	2, 0x0100
    136c:	f452                	.insn	2, 0xf452
    136e:	0000                	.insn	2, 0x0000
    1370:	0100                	.insn	2, 0x0100
    1372:	0119                	.insn	2, 0x0119
    1374:	502a                	.insn	2, 0x502a
    1376:	000c                	.insn	2, 0x000c
    1378:	0600                	.insn	2, 0x0600
    137a:	0004                	.insn	2, 0x0004
    137c:	0100                	.insn	2, 0x0100
    137e:	0119                	.insn	2, 0x0119
    1380:	00d0                	.insn	2, 0x00d0
    1382:	0000                	.insn	2, 0x0000
    1384:	0c24                	.insn	2, 0x0c24
    1386:	0009                	.insn	2, 0x0009
    1388:	5000                	.insn	2, 0x5000
    138a:	4012                	.insn	2, 0x4012
    138c:	0800                	.insn	2, 0x0800
    138e:	0000                	.insn	2, 0x0000
    1390:	0100                	.insn	2, 0x0100
    1392:	011c                	.insn	2, 0x011c
    1394:	1f05                	.insn	2, 0x1f05
    1396:	191e                	.insn	2, 0x191e
    1398:	0009                	.insn	2, 0x0009
    139a:	1e00                	.insn	2, 0x1e00
    139c:	5a01                	.insn	2, 0x5a01
    139e:	0925                	.insn	2, 0x0925
    13a0:	0000                	.insn	2, 0x0000
    13a2:	0121                	.insn	2, 0x0121
    13a4:	315a                	.insn	2, 0x315a
    13a6:	0009                	.insn	2, 0x0009
    13a8:	2200                	.insn	2, 0x2200
    13aa:	3d1e                	.insn	2, 0x3d1e
    13ac:	0009                	.insn	2, 0x0009
    13ae:	0000                	.insn	2, 0x0000
    13b0:	2900                	.insn	2, 0x2900
    13b2:	125c                	.insn	2, 0x125c
    13b4:	0040                	.insn	2, 0x0040
    13b6:	000c                	.insn	2, 0x000c
    13b8:	0000                	.insn	2, 0x0000
    13ba:	5201                	.insn	2, 0x5201
    13bc:	0229                	.insn	2, 0x0229
    13be:	0000                	.insn	2, 0x0000
    13c0:	2401                	.insn	2, 0x2401
    13c2:	2a01                	.insn	2, 0x2a01
    13c4:	00000c6b          	.insn	4, 0x0c6b
    13c8:	0406                	.insn	2, 0x0406
    13ca:	0000                	.insn	2, 0x0000
    13cc:	2401                	.insn	2, 0x2401
    13ce:	d001                	.insn	2, 0xd001
    13d0:	0000                	.insn	2, 0x0000
    13d2:	2400                	.insn	2, 0x2400
    13d4:	090c                	.insn	2, 0x090c
    13d6:	0000                	.insn	2, 0x0000
    13d8:	125c                	.insn	2, 0x125c
    13da:	0040                	.insn	2, 0x0040
    13dc:	0008                	.insn	2, 0x0008
    13de:	0000                	.insn	2, 0x0000
    13e0:	2701                	.insn	2, 0x2701
    13e2:	0501                	.insn	2, 0x0501
    13e4:	1f1f 0919 0000      	.insn	6, 0x09191f1f
    13ea:	011e                	.insn	2, 0x011e
    13ec:	255a                	.insn	2, 0x255a
    13ee:	0009                	.insn	2, 0x0009
    13f0:	2100                	.insn	2, 0x2100
    13f2:	5a01                	.insn	2, 0x5a01
    13f4:	0931                	.insn	2, 0x0931
    13f6:	0000                	.insn	2, 0x0000
    13f8:	1f22                	.insn	2, 0x1f22
    13fa:	093d                	.insn	2, 0x093d
    13fc:	0000                	.insn	2, 0x0000
    13fe:	0000                	.insn	2, 0x0000
    1400:	0003df13          	srli	t5,t2,0x0
    1404:	0100                	.insn	2, 0x0100
    1406:	0270                	.insn	2, 0x0270
    1408:	01f6                	.insn	2, 0x01f6
    140a:	0000                	.insn	2, 0x0000
    140c:	1401                	.insn	2, 0x1401
    140e:	021f 0000 7101      	.insn	6, 0x71010000021f
    1414:	c502                	.insn	2, 0xc502
    1416:	0000                	.insn	2, 0x0000
    1418:	1400                	.insn	2, 0x1400
    141a:	03da                	.insn	2, 0x03da
    141c:	0000                	.insn	2, 0x0000
    141e:	7201                	.insn	2, 0x7201
    1420:	c502                	.insn	2, 0xc502
    1422:	0000                	.insn	2, 0x0000
    1424:	1400                	.insn	2, 0x1400
    1426:	0465                	.insn	2, 0x0465
    1428:	0000                	.insn	2, 0x0000
    142a:	7301                	.insn	2, 0x7301
    142c:	c502                	.insn	2, 0xc502
    142e:	0000                	.insn	2, 0x0000
    1430:	1500                	.insn	2, 0x1500
    1432:	0302                	.insn	2, 0x0302
    1434:	0000                	.insn	2, 0x0000
    1436:	7501                	.insn	2, 0x7501
    1438:	c502                	.insn	2, 0xc502
    143a:	0000                	.insn	2, 0x0000
    143c:	1500                	.insn	2, 0x1500
    143e:	037f 0000 7601 c502 	.insn	10, 0xc50276010000037f
    1446:	0000 
    1448:	1500                	.insn	2, 0x1500
    144a:	0071                	.insn	2, 0x0071
    144c:	0000                	.insn	2, 0x0000
    144e:	7701                	.insn	2, 0x7701
    1450:	c502                	.insn	2, 0xc502
    1452:	0000                	.insn	2, 0x0000
    1454:	0000                	.insn	2, 0x0000
    1456:	6832                	.insn	2, 0x6832
    1458:	4012                	.insn	2, 0x4012
    145a:	0c00                	.insn	2, 0x0c00
    145c:	0000                	.insn	2, 0x0000
    145e:	0100                	.insn	2, 0x0100
    1460:	7452                	.insn	2, 0x7452
    1462:	0000                	.insn	2, 0x0000
    1464:	0100                	.insn	2, 0x0100
    1466:	012e                	.insn	2, 0x012e
    1468:	01f6                	.insn	2, 0x01f6
    146a:	0000                	.insn	2, 0x0000
    146c:	862a                	.insn	2, 0x862a
    146e:	000c                	.insn	2, 0x000c
    1470:	0600                	.insn	2, 0x0600
    1472:	0004                	.insn	2, 0x0004
    1474:	0100                	.insn	2, 0x0100
    1476:	00c5012f          	.insn	4, 0x00c5012f
    147a:	0000                	.insn	2, 0x0000
    147c:	e35b0133          	.insn	4, 0xe35b0133
    1480:	0000                	.insn	2, 0x0000
    1482:	0100                	.insn	2, 0x0100
    1484:	0130                	.insn	2, 0x0130
    1486:	0dce                	.insn	2, 0x0dce
    1488:	0000                	.insn	2, 0x0000
    148a:	e824                	.insn	2, 0xe824
    148c:	0009                	.insn	2, 0x0009
    148e:	6800                	.insn	2, 0x6800
    1490:	4012                	.insn	2, 0x4012
    1492:	0800                	.insn	2, 0x0800
    1494:	0000                	.insn	2, 0x0000
    1496:	0100                	.insn	2, 0x0100
    1498:	0132                	.insn	2, 0x0132
    149a:	1f0c                	.insn	2, 0x1f0c
    149c:	f520                	.insn	2, 0xf520
    149e:	0009                	.insn	2, 0x0009
    14a0:	1e00                	.insn	2, 0x1e00
    14a2:	5a01                	.insn	2, 0x5a01
    14a4:	0a01                	.insn	2, 0x0a01
    14a6:	0000                	.insn	2, 0x0000
    14a8:	011e                	.insn	2, 0x011e
    14aa:	000a0d5b          	.insn	4, 0x000a0d5b
    14ae:	2100                	.insn	2, 0x2100
    14b0:	5a01                	.insn	2, 0x5a01
    14b2:	0a19                	.insn	2, 0x0a19
    14b4:	0000                	.insn	2, 0x0000
    14b6:	0121                	.insn	2, 0x0121
    14b8:	000a255b          	.insn	4, 0x000a255b
    14bc:	2200                	.insn	2, 0x2200
    14be:	3120                	.insn	2, 0x3120
    14c0:	000a                	.insn	2, 0x000a
    14c2:	0000                	.insn	2, 0x0000
    14c4:	3400                	.insn	2, 0x3400
    14c6:	0129                	.insn	2, 0x0129
    14c8:	0000                	.insn	2, 0x0000
    14ca:	9601                	.insn	2, 0x9601
    14cc:	0102                	.insn	2, 0x0102
    14ce:	1f14                	.insn	2, 0x1f14
    14d0:	0002                	.insn	2, 0x0002
    14d2:	0100                	.insn	2, 0x0100
    14d4:	0296                	.insn	2, 0x0296
    14d6:	00c5                	.insn	2, 0x00c5
    14d8:	0000                	.insn	2, 0x0000
    14da:	da14                	.insn	2, 0xda14
    14dc:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    14e0:	00c50297          	auipc	t0,0xc50
    14e4:	0000                	.insn	2, 0x0000
    14e6:	6514                	.insn	2, 0x6514
    14e8:	0004                	.insn	2, 0x0004
    14ea:	0100                	.insn	2, 0x0100
    14ec:	0298                	.insn	2, 0x0298
    14ee:	00c5                	.insn	2, 0x00c5
    14f0:	0000                	.insn	2, 0x0000
    14f2:	0215                	.insn	2, 0x0215
    14f4:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    14f8:	029a                	.insn	2, 0x029a
    14fa:	00c5                	.insn	2, 0x00c5
    14fc:	0000                	.insn	2, 0x0000
    14fe:	7f15                	.insn	2, 0x7f15
    1500:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1504:	00c5029b          	.insn	4, 0x00c5029b
    1508:	0000                	.insn	2, 0x0000
    150a:	7115                	.insn	2, 0x7115
    150c:	0000                	.insn	2, 0x0000
    150e:	0100                	.insn	2, 0x0100
    1510:	029c                	.insn	2, 0x029c
    1512:	00c5                	.insn	2, 0x00c5
    1514:	0000                	.insn	2, 0x0000
    1516:	2900                	.insn	2, 0x2900
    1518:	1274                	.insn	2, 0x1274
    151a:	0040                	.insn	2, 0x0040
    151c:	000c                	.insn	2, 0x000c
    151e:	0000                	.insn	2, 0x0000
    1520:	5201                	.insn	2, 0x5201
    1522:	01c0                	.insn	2, 0x01c0
    1524:	0000                	.insn	2, 0x0000
    1526:	3b01                	.insn	2, 0x3b01
    1528:	3301                	.insn	2, 0x3301
    152a:	5a01                	.insn	2, 0x5a01
    152c:	0061                	.insn	2, 0x0061
    152e:	0000                	.insn	2, 0x0000
    1530:	3b01                	.insn	2, 0x3b01
    1532:	c501                	.insn	2, 0xc501
    1534:	0000                	.insn	2, 0x0000
    1536:	3300                	.insn	2, 0x3300
    1538:	5b01                	.insn	2, 0x5b01
    153a:	0000002f          	.insn	4, 0x002f
    153e:	3b01                	.insn	2, 0x3b01
    1540:	c501                	.insn	2, 0xc501
    1542:	0000                	.insn	2, 0x0000
    1544:	2400                	.insn	2, 0x2400
    1546:	0aad                	.insn	2, 0x0aad
    1548:	0000                	.insn	2, 0x0000
    154a:	1274                	.insn	2, 0x1274
    154c:	0040                	.insn	2, 0x0040
    154e:	0008                	.insn	2, 0x0008
    1550:	0000                	.insn	2, 0x0000
    1552:	3e01                	.insn	2, 0x3e01
    1554:	0501                	.insn	2, 0x0501
    1556:	281f 0ab6 0000      	.insn	6, 0x0ab6281f
    155c:	011e                	.insn	2, 0x011e
    155e:	c25a                	.insn	2, 0xc25a
    1560:	000a                	.insn	2, 0x000a
    1562:	1e00                	.insn	2, 0x1e00
    1564:	5b01                	.insn	2, 0x5b01
    1566:	0ace                	.insn	2, 0x0ace
    1568:	0000                	.insn	2, 0x0000
    156a:	0121                	.insn	2, 0x0121
    156c:	da5a                	.insn	2, 0xda5a
    156e:	000a                	.insn	2, 0x000a
    1570:	2100                	.insn	2, 0x2100
    1572:	5b01                	.insn	2, 0x5b01
    1574:	0ae6                	.insn	2, 0x0ae6
    1576:	0000                	.insn	2, 0x0000
    1578:	2822                	.insn	2, 0x2822
    157a:	0af2                	.insn	2, 0x0af2
    157c:	0000                	.insn	2, 0x0000
    157e:	0000                	.insn	2, 0x0000
    1580:	8032                	.insn	2, 0x8032
    1582:	4012                	.insn	2, 0x4012
    1584:	3400                	.insn	2, 0x3400
    1586:	0000                	.insn	2, 0x0000
    1588:	0100                	.insn	2, 0x0100
    158a:	a052                	.insn	2, 0xa052
    158c:	0001                	.insn	2, 0x0001
    158e:	0100                	.insn	2, 0x0100
    1590:	0146                	.insn	2, 0x0146
    1592:	0d84                	.insn	2, 0x0d84
    1594:	0000                	.insn	2, 0x0000
    1596:	3e5a0133          	.insn	4, 0x3e5a0133
    159a:	0000                	.insn	2, 0x0000
    159c:	0100                	.insn	2, 0x0100
    159e:	0146                	.insn	2, 0x0146
    15a0:	0d84                	.insn	2, 0x0d84
    15a2:	0000                	.insn	2, 0x0000
    15a4:	a12a                	.insn	2, 0xa12a
    15a6:	000c                	.insn	2, 0x000c
    15a8:	2500                	.insn	2, 0x2500
    15aa:	0002                	.insn	2, 0x0002
    15ac:	0100                	.insn	2, 0x0100
    15ae:	0146                	.insn	2, 0x0146
    15b0:	06f6                	.insn	2, 0x06f6
    15b2:	0000                	.insn	2, 0x0000
    15b4:	c72e                	.insn	2, 0xc72e
    15b6:	000c                	.insn	2, 0x000c
    15b8:	8700                	.insn	2, 0x8700
    15ba:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    15be:	0d840147          	.insn	4, 0x0d840147
    15c2:	0000                	.insn	2, 0x0000
    15c4:	3200                	.insn	2, 0x3200
    15c6:	12b4                	.insn	2, 0x12b4
    15c8:	0040                	.insn	2, 0x0040
    15ca:	0040                	.insn	2, 0x0040
    15cc:	0000                	.insn	2, 0x0000
    15ce:	5201                	.insn	2, 0x5201
    15d0:	036c                	.insn	2, 0x036c
    15d2:	0000                	.insn	2, 0x0000
    15d4:	4e01                	.insn	2, 0x4e01
    15d6:	d701                	.insn	2, 0xd701
    15d8:	0000                	.insn	2, 0x0000
    15da:	2a00                	.insn	2, 0x2a00
    15dc:	0cf8                	.insn	2, 0x0cf8
    15de:	0000                	.insn	2, 0x0000
    15e0:	0000014f          	.insn	4, 0x014f
    15e4:	4e01                	.insn	2, 0x4e01
    15e6:	f601                	.insn	2, 0xf601
    15e8:	0006                	.insn	2, 0x0006
    15ea:	2a00                	.insn	2, 0x2a00
    15ec:	0d36                	.insn	2, 0x0d36
    15ee:	0000                	.insn	2, 0x0000
    15f0:	0339                	.insn	2, 0x0339
    15f2:	0000                	.insn	2, 0x0000
    15f4:	4e01                	.insn	2, 0x4e01
    15f6:	f601                	.insn	2, 0xf601
    15f8:	0006                	.insn	2, 0x0006
    15fa:	0000                	.insn	2, 0x0000
    15fc:	f432                	.insn	2, 0xf432
    15fe:	4012                	.insn	2, 0x4012
    1600:	a800                	.insn	2, 0xa800
    1602:	0000                	.insn	2, 0x0000
    1604:	0100                	.insn	2, 0x0100
    1606:	5352                	.insn	2, 0x5352
    1608:	0004                	.insn	2, 0x0004
    160a:	0100                	.insn	2, 0x0100
    160c:	00d001a7          	.insn	4, 0x00d001a7
    1610:	0000                	.insn	2, 0x0000
    1612:	512a                	.insn	2, 0x512a
    1614:	000d                	.insn	2, 0x000d
    1616:	5200                	.insn	2, 0x5200
    1618:	0001                	.insn	2, 0x0001
    161a:	0100                	.insn	2, 0x0100
    161c:	06f601a7          	.insn	4, 0x06f601a7
    1620:	0000                	.insn	2, 0x0000
    1622:	822e                	.insn	2, 0x822e
    1624:	000d                	.insn	2, 0x000d
    1626:	a700                	.insn	2, 0xa700
    1628:	0001                	.insn	2, 0x0001
    162a:	0100                	.insn	2, 0x0100
    162c:	01a8                	.insn	2, 0x01a8
    162e:	00d0                	.insn	2, 0x00d0
    1630:	0000                	.insn	2, 0x0000
    1632:	c12e                	.insn	2, 0xc12e
    1634:	000d                	.insn	2, 0x000d
    1636:	f200                	.insn	2, 0xf200
    1638:	0000                	.insn	2, 0x0000
    163a:	0100                	.insn	2, 0x0100
    163c:	01ad                	.insn	2, 0x01ad
    163e:	00d0                	.insn	2, 0x00d0
    1640:	0000                	.insn	2, 0x0000
    1642:	582d                	.insn	2, 0x582d
    1644:	0002                	.insn	2, 0x0002
    1646:	2e00                	.insn	2, 0x2e00
    1648:	00000df3          	.insn	4, 0x0df3
    164c:	0134                	.insn	2, 0x0134
    164e:	0000                	.insn	2, 0x0000
    1650:	af01                	.insn	2, 0xaf01
    1652:	3f01                	.insn	2, 0x3f01
    1654:	0000                	.insn	2, 0x0000
    1656:	2e00                	.insn	2, 0x2e00
    1658:	0e0e                	.insn	2, 0x0e0e
    165a:	0000                	.insn	2, 0x0000
    165c:	00000387          	.insn	4, 0x0387
    1660:	b001                	.insn	2, 0xb001
    1662:	d001                	.insn	2, 0xd001
    1664:	0000                	.insn	2, 0x0000
    1666:	0000                	.insn	2, 0x0000
    1668:	3200                	.insn	2, 0x3200
    166a:	139c                	.insn	2, 0x139c
    166c:	0040                	.insn	2, 0x0040
    166e:	0040                	.insn	2, 0x0040
    1670:	0000                	.insn	2, 0x0000
    1672:	5201                	.insn	2, 0x5201
    1674:	000002b3          	add	t0,zero,zero
    1678:	bc01                	.insn	2, 0xbc01
    167a:	8901                	.insn	2, 0x8901
    167c:	000d                	.insn	2, 0x000d
    167e:	2a00                	.insn	2, 0x2a00
    1680:	0e29                	.insn	2, 0x0e29
    1682:	0000                	.insn	2, 0x0000
    1684:	00a6                	.insn	2, 0x00a6
    1686:	0000                	.insn	2, 0x0000
    1688:	bc01                	.insn	2, 0xbc01
    168a:	d001                	.insn	2, 0xd001
    168c:	0000                	.insn	2, 0x0000
    168e:	1a00                	.insn	2, 0x1a00
    1690:	13b4                	.insn	2, 0x13b4
    1692:	0040                	.insn	2, 0x0040
    1694:	0020                	.insn	2, 0x0020
    1696:	0000                	.insn	2, 0x0000
    1698:	4f2e                	.insn	2, 0x4f2e
    169a:	000e                	.insn	2, 0x000e
    169c:	3c00                	.insn	2, 0x3c00
    169e:	0000                	.insn	2, 0x0000
    16a0:	0100                	.insn	2, 0x0100
    16a2:	01c0                	.insn	2, 0x01c0
    16a4:	00d0                	.insn	2, 0x00d0
    16a6:	0000                	.insn	2, 0x0000
    16a8:	0000                	.insn	2, 0x0000
    16aa:	dc32                	.insn	2, 0xdc32
    16ac:	14004013          	xori	zero,zero,320
    16b0:	0000                	.insn	2, 0x0000
    16b2:	0100                	.insn	2, 0x0100
    16b4:	4652                	.insn	2, 0x4652
    16b6:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    16ba:	020d                	.insn	2, 0x020d
    16bc:	000000d7          	.insn	4, 0x00d7
    16c0:	8e2e                	.insn	2, 0x8e2e
    16c2:	000e                	.insn	2, 0x000e
    16c4:	6200                	.insn	2, 0x6200
    16c6:	0004                	.insn	2, 0x0004
    16c8:	0100                	.insn	2, 0x0100
    16ca:	00d7020f          	.insn	4, 0x00d7020f
    16ce:	0000                	.insn	2, 0x0000
    16d0:	3200                	.insn	2, 0x3200
    16d2:	13f0                	.insn	2, 0x13f0
    16d4:	0040                	.insn	2, 0x0040
    16d6:	0014                	.insn	2, 0x0014
    16d8:	0000                	.insn	2, 0x0000
    16da:	5201                	.insn	2, 0x5201
    16dc:	040d                	.insn	2, 0x040d
    16de:	0000                	.insn	2, 0x0000
    16e0:	1b01                	.insn	2, 0x1b01
    16e2:	d702                	.insn	2, 0xd702
    16e4:	0000                	.insn	2, 0x0000
    16e6:	2e00                	.insn	2, 0x2e00
    16e8:	0ea9                	.insn	2, 0x0ea9
    16ea:	0000                	.insn	2, 0x0000
    16ec:	0462                	.insn	2, 0x0462
    16ee:	0000                	.insn	2, 0x0000
    16f0:	1d01                	.insn	2, 0x1d01
    16f2:	d702                	.insn	2, 0xd702
    16f4:	0000                	.insn	2, 0x0000
    16f6:	0000                	.insn	2, 0x0000
    16f8:	0432                	.insn	2, 0x0432
    16fa:	4014                	.insn	2, 0x4014
    16fc:	0c00                	.insn	2, 0x0c00
    16fe:	0000                	.insn	2, 0x0000
    1700:	0100                	.insn	2, 0x0100
    1702:	0552                	.insn	2, 0x0552
    1704:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1708:	0285                	.insn	2, 0x0285
    170a:	000000d7          	.insn	4, 0x00d7
    170e:	c42a                	.insn	2, 0xc42a
    1710:	000e                	.insn	2, 0x000e
    1712:	0600                	.insn	2, 0x0600
    1714:	0004                	.insn	2, 0x0004
    1716:	0100                	.insn	2, 0x0100
    1718:	0285                	.insn	2, 0x0285
    171a:	00c5                	.insn	2, 0x00c5
    171c:	0000                	.insn	2, 0x0000
    171e:	e35b0133          	.insn	4, 0xe35b0133
    1722:	0000                	.insn	2, 0x0000
    1724:	0100                	.insn	2, 0x0100
    1726:	0285                	.insn	2, 0x0285
    1728:	0dc1                	.insn	2, 0x0dc1
    172a:	0000                	.insn	2, 0x0000
    172c:	025a012b          	.insn	4, 0x025a012b
    1730:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1734:	00c50287          	.insn	4, 0x00c50287
    1738:	0000                	.insn	2, 0x0000
    173a:	7f5b012b          	.insn	4, 0x7f5b012b
    173e:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1742:	0288                	.insn	2, 0x0288
    1744:	00c5                	.insn	2, 0x00c5
    1746:	0000                	.insn	2, 0x0000
    1748:	2135                	.insn	2, 0x2135
    174a:	0071                	.insn	2, 0x0071
    174c:	0000                	.insn	2, 0x0000
    174e:	8901                	.insn	2, 0x8901
    1750:	c502                	.insn	2, 0xc502
    1752:	0000                	.insn	2, 0x0000
    1754:	0000                	.insn	2, 0x0000
    1756:	1032                	.insn	2, 0x1032
    1758:	4014                	.insn	2, 0x4014
    175a:	0c00                	.insn	2, 0x0c00
    175c:	0000                	.insn	2, 0x0000
    175e:	0100                	.insn	2, 0x0100
    1760:	ca52                	.insn	2, 0xca52
    1762:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1766:	02a9                	.insn	2, 0x02a9
    1768:	01f6                	.insn	2, 0x01f6
    176a:	0000                	.insn	2, 0x0000
    176c:	3235                	.insn	2, 0x3235
    176e:	0071                	.insn	2, 0x0071
    1770:	0000                	.insn	2, 0x0000
    1772:	ac01                	.insn	2, 0xac01
    1774:	c502                	.insn	2, 0xc502
    1776:	0000                	.insn	2, 0x0000
    1778:	2e00                	.insn	2, 0x2e00
    177a:	0edf 0000 0302      	.insn	6, 0x030200000edf
    1780:	0000                	.insn	2, 0x0000
    1782:	ab01                	.insn	2, 0xab01
    1784:	c502                	.insn	2, 0xc502
    1786:	0000                	.insn	2, 0x0000
    1788:	0000                	.insn	2, 0x0000
    178a:	0036                	.insn	2, 0x0036
    178c:	4000                	.insn	2, 0x4000
    178e:	1c00                	.insn	2, 0x1c00
    1790:	0000                	.insn	2, 0x0000
    1792:	0100                	.insn	2, 0x0100
    1794:	0752                	.insn	2, 0x0752
    1796:	0000                	.insn	2, 0x0000
    1798:	0100                	.insn	2, 0x0100
    179a:	3f0a02bb          	.insn	4, 0x3f0a02bb
    179e:	0000                	.insn	2, 0x0000
    17a0:	0900                	.insn	2, 0x0900
    17a2:	000000d7          	.insn	4, 0x00d7
    17a6:	000000db          	.insn	4, 0x00db
    17aa:	b2030e03          	lb	t3,-1248(t1) # 3a0e022b <USER_MAX+0x39be022b>
    17ae:	0000                	.insn	2, 0x0000
    17b0:	0400                	.insn	2, 0x0400
    17b2:	0046                	.insn	2, 0x0046
    17b4:	0000                	.insn	2, 0x0000
    17b6:	0440                	.insn	2, 0x0440
    17b8:	0046                	.insn	2, 0x0046
    17ba:	0000                	.insn	2, 0x0000
    17bc:	0040                	.insn	2, 0x0040
    17be:	0000c503          	lbu	a0,0(ra)
    17c2:	0400                	.insn	2, 0x0400
    17c4:	0046                	.insn	2, 0x0046
    17c6:	0000                	.insn	2, 0x0000
    17c8:	0440                	.insn	2, 0x0440
    17ca:	0046                	.insn	2, 0x0046
    17cc:	0000                	.insn	2, 0x0000
    17ce:	0040                	.insn	2, 0x0040
    17d0:	000dc137          	lui	sp,0xdc
    17d4:	9100                	.insn	2, 0x9100
    17d6:	38000003          	lb	zero,896(zero) # 380 <$d.6+0xf8>
    17da:	00003f03          	.insn	4, 0x3f03
    17de:	0400                	.insn	2, 0x0400
    17e0:	0046                	.insn	2, 0x0046
    17e2:	0000                	.insn	2, 0x0000
    17e4:	d30a000b          	.insn	4, 0xd30a000b
    17e8:	000d                	.insn	2, 0x000d
    17ea:	2800                	.insn	2, 0x2800
    17ec:	00b2                	.insn	2, 0x00b2
    17ee:	0000                	.insn	2, 0x0000
	...

000017f1 <$d.5>:
    17f1:	0000076f          	jal	a4,17f1 <$d.5>
    17f5:	0004                	.insn	2, 0x0004
    17f7:	04f1                	.insn	2, 0x04f1
    17f9:	0000                	.insn	2, 0x0000
    17fb:	0104                	.insn	2, 0x0104
    17fd:	0171                	.insn	2, 0x0171
    17ff:	0000                	.insn	2, 0x0000
    1801:	001d                	.insn	2, 0x001d
    1803:	01ac                	.insn	2, 0x01ac
    1805:	0000                	.insn	2, 0x0000
    1807:	11df 0000 027e      	.insn	6, 0x027e000011df
    180d:	0000                	.insn	2, 0x0000
    180f:	141c                	.insn	2, 0x141c
    1811:	0040                	.insn	2, 0x0040
    1813:	0b98                	.insn	2, 0x0b98
    1815:	0000                	.insn	2, 0x0000
    1817:	3302                	.insn	2, 0x3302
    1819:	0000                	.insn	2, 0x0000
    181b:	0100                	.insn	2, 0x0100
    181d:	f2030513          	addi	a0,t1,-224
    1821:	03004023          	.insn	4, 0x03004023
    1825:	0000003f 00004604 	.insn	8, 0x46040000003f
    182d:	1000                	.insn	2, 0x1000
    182f:	0500                	.insn	2, 0x0500
    1831:	025d                	.insn	2, 0x025d
    1833:	0000                	.insn	2, 0x0000
    1835:	0108                	.insn	2, 0x0108
    1837:	4e06                	.insn	2, 0x4e06
    1839:	08000003          	lb	zero,128(zero) # 80 <$d.10+0xc>
    183d:	005a0207          	.insn	4, 0x005a0207
    1841:	0000                	.insn	2, 0x0000
    1843:	d701                	.insn	2, 0xd701
    1845:	0305                	.insn	2, 0x0305
    1847:	21cd                	.insn	2, 0x21cd
    1849:	0040                	.insn	2, 0x0040
    184b:	00003f03          	.insn	4, 0x3f03
    184f:	0400                	.insn	2, 0x0400
    1851:	0046                	.insn	2, 0x0046
    1853:	0000                	.insn	2, 0x0000
    1855:	0009                	.insn	2, 0x0009
    1857:	7302                	.insn	2, 0x7302
    1859:	0000                	.insn	2, 0x0000
    185b:	0100                	.insn	2, 0x0100
    185d:	05f0                	.insn	2, 0x05f0
    185f:	40227a03          	.insn	4, 0x40227a03
    1863:	0300                	.insn	2, 0x0300
    1865:	0000003f 00004604 	.insn	8, 0x46040000003f
    186d:	1700                	.insn	2, 0x1700
    186f:	0700                	.insn	2, 0x0700
    1871:	008d                	.insn	2, 0x008d
    1873:	0000                	.insn	2, 0x0000
    1875:	4c01                	.insn	2, 0x4c01
    1877:	0501                	.insn	2, 0x0501
    1879:	40222503          	lw	a0,1026(tp) # 135e <$d.11+0x17f>
    187d:	0300                	.insn	2, 0x0300
    187f:	0000003f 00004604 	.insn	8, 0x46040000003f
    1887:	0b00                	.insn	2, 0x0b00
    1889:	0700                	.insn	2, 0x0700
    188b:	000000a7          	.insn	4, 0x00a7
    188f:	5401                	.insn	2, 0x5401
    1891:	0501                	.insn	2, 0x0501
    1893:	40231303          	lh	t1,1026(t1)
    1897:	0300                	.insn	2, 0x0300
    1899:	0000003f 00004604 	.insn	8, 0x46040000003f
    18a1:	0200                	.insn	2, 0x0200
    18a3:	0700                	.insn	2, 0x0700
    18a5:	00c1                	.insn	2, 0x00c1
    18a7:	0000                	.insn	2, 0x0000
    18a9:	5901                	.insn	2, 0x5901
    18ab:	0501                	.insn	2, 0x0501
    18ad:	4022de03          	lhu	t3,1026(t0) # c518e2 <USER_MAX+0x7518e2>
    18b1:	0300                	.insn	2, 0x0300
    18b3:	0000003f 00004604 	.insn	8, 0x46040000003f
    18bb:	0d00                	.insn	2, 0x0d00
    18bd:	0800                	.insn	2, 0x0800
    18bf:	01e1                	.insn	2, 0x01e1
    18c1:	0000                	.insn	2, 0x0000
    18c3:	00de                	.insn	2, 0x00de
    18c5:	0000                	.insn	2, 0x0000
    18c7:	0401                	.insn	2, 0x0401
    18c9:	0305                	.insn	2, 0x0305
    18cb:	2430                	.insn	2, 0x2430
    18cd:	0040                	.insn	2, 0x0040
    18cf:	0000eb03          	.insn	4, 0xeb03
    18d3:	0900                	.insn	2, 0x0900
    18d5:	0046                	.insn	2, 0x0046
    18d7:	0000                	.insn	2, 0x0000
    18d9:	0200                	.insn	2, 0x0200
    18db:	0a00                	.insn	2, 0x0a00
    18dd:	00f6                	.insn	2, 0x00f6
    18df:	0000                	.insn	2, 0x0000
    18e1:	0389                	.insn	2, 0x0389
    18e3:	0000                	.insn	2, 0x0000
    18e5:	0f02                	.insn	2, 0x0f02
    18e7:	4505                	.insn	2, 0x4505
    18e9:	0002                	.insn	2, 0x0002
    18eb:	0800                	.insn	2, 0x0800
    18ed:	0b01                	.insn	2, 0x0b01
    18ef:	01b8                	.insn	2, 0x01b8
    18f1:	0000                	.insn	2, 0x0000
    18f3:	010e                	.insn	2, 0x010e
    18f5:	0000                	.insn	2, 0x0000
    18f7:	0601                	.insn	2, 0x0601
    18f9:	0305                	.insn	2, 0x0305
    18fb:	2630                	.insn	2, 0x2630
    18fd:	0040                	.insn	2, 0x0040
    18ff:	190a                	.insn	2, 0x190a
    1901:	0001                	.insn	2, 0x0001
    1903:	fa00                	.insn	2, 0xfa00
    1905:	0001                	.insn	2, 0x0001
    1907:	0300                	.insn	2, 0x0300
    1909:	0c0c                	.insn	2, 0x0c0c
    190b:	0314                	.insn	2, 0x0314
    190d:	0d06                	.insn	2, 0x0d06
    190f:	0168                	.insn	2, 0x0168
    1911:	0000                	.insn	2, 0x0000
    1913:	015a                	.insn	2, 0x015a
    1915:	0000                	.insn	2, 0x0000
    1917:	0d000703          	lb	a4,208(zero) # d0 <$d.10+0x5c>
    191b:	00000253          	.insn	4, 0x0253
    191f:	015a                	.insn	2, 0x015a
    1921:	0000                	.insn	2, 0x0000
    1923:	0d040803          	lb	a6,208(s0)
    1927:	000000e7          	jalr	zero # 0 <$d.4>
    192b:	015a                	.insn	2, 0x015a
    192d:	0000                	.insn	2, 0x0000
    192f:	0d080903          	lb	s2,208(a6) # 613930d0 <USER_MAX+0x60e930d0>
    1933:	00ca                	.insn	2, 0x00ca
    1935:	0000                	.insn	2, 0x0000
    1937:	015a                	.insn	2, 0x015a
    1939:	0000                	.insn	2, 0x0000
    193b:	0d0c0a03          	lb	s4,208(s8)
    193f:	00000437          	lui	s0,0x0
    1943:	015a                	.insn	2, 0x015a
    1945:	0000                	.insn	2, 0x0000
    1947:	00100b03          	lb	s6,1(zero) # 1 <$d.4+0x1>
    194b:	650a                	.insn	2, 0x650a
    194d:	0001                	.insn	2, 0x0001
    194f:	f100                	.insn	2, 0xf100
    1951:	0001                	.insn	2, 0x0001
    1953:	0200                	.insn	2, 0x0200
    1955:	0511                	.insn	2, 0x0511
    1957:	0324                	.insn	2, 0x0324
    1959:	0000                	.insn	2, 0x0000
    195b:	1a0e0407          	.insn	4, 0x1a0e0407
    195f:	0001                	.insn	2, 0x0001
    1961:	0100                	.insn	2, 0x0100
    1963:	5a7a                	.insn	2, 0x5a7a
    1965:	0001                	.insn	2, 0x0001
    1967:	0100                	.insn	2, 0x0100
    1969:	0000c20f          	.insn	4, 0xc20f
    196d:	0100                	.insn	2, 0x0100
    196f:	5a7a                	.insn	2, 0x5a7a
    1971:	0001                	.insn	2, 0x0001
    1973:	0000                	.insn	2, 0x0000
    1975:	1c10                	.insn	2, 0x1c10
    1977:	4014                	.insn	2, 0x4014
    1979:	ec00                	.insn	2, 0xec00
    197b:	0000                	.insn	2, 0x0000
    197d:	0100                	.insn	2, 0x0100
    197f:	1a52                	.insn	2, 0x1a52
    1981:	0000                	.insn	2, 0x0000
    1983:	0100                	.insn	2, 0x0100
    1985:	0008                	.insn	2, 0x0008
    1987:	0004                	.insn	2, 0x0004
    1989:	1100                	.insn	2, 0x1100
    198b:	0efa                	.insn	2, 0x0efa
    198d:	0000                	.insn	2, 0x0000
    198f:	0382                	.insn	2, 0x0382
    1991:	0000                	.insn	2, 0x0000
    1993:	0801                	.insn	2, 0x0801
    1995:	03e0                	.insn	2, 0x03e0
    1997:	0000                	.insn	2, 0x0000
    1999:	0212                	.insn	2, 0x0212
    199b:	1491                	.insn	2, 0x1491
    199d:	000000e3          	beqz	zero,219d <$d.5+0x9ac>
    19a1:	0a01                	.insn	2, 0x0a01
    19a3:	00de                	.insn	2, 0x00de
    19a5:	0000                	.insn	2, 0x0000
    19a7:	0212                	.insn	2, 0x0212
    19a9:	1091                	.insn	2, 0x1091
    19ab:	00c2                	.insn	2, 0x00c2
    19ad:	0000                	.insn	2, 0x0000
    19af:	0c01                	.insn	2, 0x0c01
    19b1:	015a                	.insn	2, 0x015a
    19b3:	0000                	.insn	2, 0x0000
    19b5:	0212                	.insn	2, 0x0212
    19b7:	0c91                	.insn	2, 0x0c91
    19b9:	0422                	.insn	2, 0x0422
    19bb:	0000                	.insn	2, 0x0000
    19bd:	0d01                	.insn	2, 0x0d01
    19bf:	015a                	.insn	2, 0x015a
    19c1:	0000                	.insn	2, 0x0000
    19c3:	000f2b13          	slti	s6,t5,0
    19c7:	d700                	.insn	2, 0xd700
    19c9:	0000                	.insn	2, 0x0000
    19cb:	0100                	.insn	2, 0x0100
    19cd:	00015a17          	auipc	s4,0x15
    19d1:	1400                	.insn	2, 0x1400
    19d3:	016c                	.insn	2, 0x016c
    19d5:	0000                	.insn	2, 0x0000
    19d7:	1478                	.insn	2, 0x1478
    19d9:	0040                	.insn	2, 0x0040
    19db:	001c                	.insn	2, 0x001c
    19dd:	0000                	.insn	2, 0x0000
    19df:	1801                	.insn	2, 0x1801
    19e1:	1509                	.insn	2, 0x1509
    19e3:	0f18                	.insn	2, 0x0f18
    19e5:	0000                	.insn	2, 0x0000
    19e7:	0178                	.insn	2, 0x0178
    19e9:	0000                	.insn	2, 0x0000
    19eb:	1600                	.insn	2, 0x1600
    19ed:	14b0                	.insn	2, 0x14b0
    19ef:	0040                	.insn	2, 0x0040
    19f1:	0034                	.insn	2, 0x0034
    19f3:	0000                	.insn	2, 0x0000
    19f5:	000f3e13          	sltiu	t3,t5,0
    19f9:	3c00                	.insn	2, 0x3c00
    19fb:	0000                	.insn	2, 0x0000
    19fd:	0100                	.insn	2, 0x0100
    19ff:	5a1d                	.insn	2, 0x5a1d
    1a01:	0001                	.insn	2, 0x0001
    1a03:	0000                	.insn	2, 0x0000
    1a05:	00024b17          	auipc	s6,0x24
    1a09:	3800                	.insn	2, 0x3800
    1a0b:	4014                	.insn	2, 0x4014
    1a0d:	1700                	.insn	2, 0x1700
    1a0f:	000002af          	.insn	4, 0x02af
    1a13:	1458                	.insn	2, 0x1458
    1a15:	0040                	.insn	2, 0x0040
    1a17:	0003d217          	auipc	tp,0x3d
    1a1b:	6c00                	.insn	2, 0x6c00
    1a1d:	4014                	.insn	2, 0x4014
    1a1f:	1700                	.insn	2, 0x1700
    1a21:	03ea                	.insn	2, 0x03ea
    1a23:	0000                	.insn	2, 0x0000
    1a25:	14a0                	.insn	2, 0x14a0
    1a27:	0040                	.insn	2, 0x0040
    1a29:	00040817          	auipc	a6,0x40
    1a2d:	dc00                	.insn	2, 0xdc00
    1a2f:	4014                	.insn	2, 0x4014
    1a31:	1700                	.insn	2, 0x1700
    1a33:	0408                	.insn	2, 0x0408
    1a35:	0000                	.insn	2, 0x0000
    1a37:	14f0                	.insn	2, 0x14f0
    1a39:	0040                	.insn	2, 0x0040
    1a3b:	1000                	.insn	2, 0x1000
    1a3d:	1508                	.insn	2, 0x1508
    1a3f:	0040                	.insn	2, 0x0040
    1a41:	0128                	.insn	2, 0x0128
    1a43:	0000                	.insn	2, 0x0000
    1a45:	5201                	.insn	2, 0x5201
    1a47:	00b6                	.insn	2, 0x00b6
    1a49:	0000                	.insn	2, 0x0000
    1a4b:	8101                	.insn	2, 0x8101
    1a4d:	0400                	.insn	2, 0x0400
    1a4f:	0000                	.insn	2, 0x0000
    1a51:	000f7513          	andi	a0,t5,0
    1a55:	e300                	.insn	2, 0xe300
    1a57:	0000                	.insn	2, 0x0000
    1a59:	0100                	.insn	2, 0x0100
    1a5b:	00060383          	lb	t2,0(a2)
    1a5f:	1300                	.insn	2, 0x1300
    1a61:	0f88                	.insn	2, 0x0f88
    1a63:	0000                	.insn	2, 0x0000
    1a65:	00000207          	.insn	4, 0x0207
    1a69:	9101                	.insn	2, 0x9101
    1a6b:	015a                	.insn	2, 0x015a
    1a6d:	0000                	.insn	2, 0x0000
    1a6f:	000f9b13          	slli	s6,t6,0x0
    1a73:	d100                	.insn	2, 0xd100
    1a75:	0002                	.insn	2, 0x0002
    1a77:	0100                	.insn	2, 0x0100
    1a79:	5a98                	.insn	2, 0x5a98
    1a7b:	0001                	.insn	2, 0x0001
    1a7d:	1300                	.insn	2, 0x1300
    1a7f:	0fae                	.insn	2, 0x0fae
    1a81:	0000                	.insn	2, 0x0000
    1a83:	000003e7          	jalr	t2,zero # 0 <$d.4>
    1a87:	9501                	.insn	2, 0x9501
    1a89:	015a                	.insn	2, 0x015a
    1a8b:	0000                	.insn	2, 0x0000
    1a8d:	0003ea17          	auipc	s4,0x3e
    1a91:	3400                	.insn	2, 0x3400
    1a93:	4015                	.insn	2, 0x4015
    1a95:	1700                	.insn	2, 0x1700
    1a97:	03ea                	.insn	2, 0x03ea
    1a99:	0000                	.insn	2, 0x0000
    1a9b:	1578                	.insn	2, 0x1578
    1a9d:	0040                	.insn	2, 0x0040
    1a9f:	1000                	.insn	2, 0x1000
    1aa1:	1630                	.insn	2, 0x1630
    1aa3:	0040                	.insn	2, 0x0040
    1aa5:	02a4                	.insn	2, 0x02a4
    1aa7:	0000                	.insn	2, 0x0000
    1aa9:	5201                	.insn	2, 0x5201
    1aab:	0154                	.insn	2, 0x0154
    1aad:	0000                	.insn	2, 0x0000
    1aaf:	2a01                	.insn	2, 0x2a01
    1ab1:	0400                	.insn	2, 0x0400
    1ab3:	0000                	.insn	2, 0x0000
    1ab5:	c111                	.insn	2, 0xc111
    1ab7:	8200000f          	.insn	4, 0x8200000f
    1abb:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1abf:	0003e02b          	.insn	4, 0x0003e02b
    1ac3:	1100                	.insn	2, 0x1100
    1ac5:	0fea                	.insn	2, 0x0fea
    1ac7:	0000                	.insn	2, 0x0000
    1ac9:	00c2                	.insn	2, 0x00c2
    1acb:	0000                	.insn	2, 0x0000
    1acd:	2c01                	.insn	2, 0x2c01
    1acf:	0761                	.insn	2, 0x0761
    1ad1:	0000                	.insn	2, 0x0000
    1ad3:	1311                	.insn	2, 0x1311
    1ad5:	0010                	.insn	2, 0x0010
    1ad7:	2200                	.insn	2, 0x2200
    1ad9:	0004                	.insn	2, 0x0004
    1adb:	0100                	.insn	2, 0x0100
    1add:	612d                	.insn	2, 0x612d
    1adf:	13000007          	.insn	4, 0x13000007
    1ae3:	0000104f          	.insn	4, 0x104f
    1ae7:	02da                	.insn	2, 0x02da
    1ae9:	0000                	.insn	2, 0x0000
    1aeb:	3401                	.insn	2, 0x3401
    1aed:	015a                	.insn	2, 0x015a
    1aef:	0000                	.insn	2, 0x0000
    1af1:	e318                	.insn	2, 0xe318
    1af3:	0000                	.insn	2, 0x0000
    1af5:	0100                	.insn	2, 0x0100
    1af7:	0006032f          	.insn	4, 0x0006032f
    1afb:	1400                	.insn	2, 0x1400
    1afd:	016c                	.insn	2, 0x016c
    1aff:	0000                	.insn	2, 0x0000
    1b01:	168c                	.insn	2, 0x168c
    1b03:	0040                	.insn	2, 0x0040
    1b05:	0014                	.insn	2, 0x0014
    1b07:	0000                	.insn	2, 0x0000
    1b09:	3501                	.insn	2, 0x3501
    1b0b:	1509                	.insn	2, 0x1509
    1b0d:	103c                	.insn	2, 0x103c
    1b0f:	0000                	.insn	2, 0x0000
    1b11:	0178                	.insn	2, 0x0178
    1b13:	0000                	.insn	2, 0x0000
    1b15:	1600                	.insn	2, 0x1600
    1b17:	1710                	.insn	2, 0x1710
    1b19:	0040                	.insn	2, 0x0040
    1b1b:	01c4                	.insn	2, 0x01c4
    1b1d:	0000                	.insn	2, 0x0000
    1b1f:	00111a13          	slli	s4,sp,0x1
    1b23:	3c00                	.insn	2, 0x3c00
    1b25:	0000                	.insn	2, 0x0000
    1b27:	0100                	.insn	2, 0x0100
    1b29:	003a                	.insn	2, 0x003a
    1b2b:	0004                	.insn	2, 0x0004
    1b2d:	1900                	.insn	2, 0x1900
    1b2f:	0288                	.insn	2, 0x0288
    1b31:	0000                	.insn	2, 0x0000
    1b33:	0212                	.insn	2, 0x0212
    1b35:	0391                	.insn	2, 0x0391
    1b37:	033c                	.insn	2, 0x033c
    1b39:	0000                	.insn	2, 0x0000
    1b3b:	4a01                	.insn	2, 0x4a01
    1b3d:	00c1                	.insn	2, 0x00c1
    1b3f:	0000                	.insn	2, 0x0000
    1b41:	00109e13          	slli	t3,ra,0x1
    1b45:	5f00                	.insn	2, 0x5f00
    1b47:	0001                	.insn	2, 0x0001
    1b49:	0100                	.insn	2, 0x0100
    1b4b:	0004004b          	.insn	4, 0x0004004b
    1b4f:	1800                	.insn	2, 0x1800
    1b51:	0132                	.insn	2, 0x0132
    1b53:	0000                	.insn	2, 0x0000
    1b55:	3c01                	.insn	2, 0x3c01
    1b57:	00000603          	lb	a2,0(zero) # 0 <$d.4>
    1b5b:	a019                	.insn	2, 0xa019
    1b5d:	0002                	.insn	2, 0x0002
    1b5f:	1300                	.insn	2, 0x1300
    1b61:	1062                	.insn	2, 0x1062
    1b63:	0000                	.insn	2, 0x0000
    1b65:	00000433          	add	s0,zero,zero
    1b69:	5801                	.insn	2, 0x5801
    1b6b:	0400                	.insn	2, 0x0400
    1b6d:	0000                	.insn	2, 0x0000
    1b6f:	1600                	.insn	2, 0x1600
    1b71:	1878                	.insn	2, 0x1878
    1b73:	0040                	.insn	2, 0x0040
    1b75:	005c                	.insn	2, 0x005c
    1b77:	0000                	.insn	2, 0x0000
    1b79:	c418                	.insn	2, 0xc418
    1b7b:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1b7f:	5a62                	.insn	2, 0x5a62
    1b81:	0001                	.insn	2, 0x0001
    1b83:	1800                	.insn	2, 0x1800
    1b85:	000001eb          	.insn	4, 0x01eb
    1b89:	6601                	.insn	2, 0x6601
    1b8b:	015a                	.insn	2, 0x015a
    1b8d:	0000                	.insn	2, 0x0000
    1b8f:	1900                	.insn	2, 0x1900
    1b91:	02c0                	.insn	2, 0x02c0
    1b93:	0000                	.insn	2, 0x0000
    1b95:	00115e13          	srli	t3,sp,0x1
    1b99:	3300                	.insn	2, 0x3300
    1b9b:	0004                	.insn	2, 0x0004
    1b9d:	0100                	.insn	2, 0x0100
    1b9f:	004e                	.insn	2, 0x004e
    1ba1:	0004                	.insn	2, 0x0004
    1ba3:	0000                	.insn	2, 0x0000
    1ba5:	0000                	.insn	2, 0x0000
    1ba7:	00024b17          	auipc	s6,0x24
    1bab:	7800                	.insn	2, 0x7800
    1bad:	4016                	.insn	2, 0x4016
    1baf:	1700                	.insn	2, 0x1700
    1bb1:	03ea                	.insn	2, 0x03ea
    1bb3:	0000                	.insn	2, 0x0000
    1bb5:	16b4                	.insn	2, 0x16b4
    1bb7:	0040                	.insn	2, 0x0040
    1bb9:	00041517          	auipc	a0,0x41
    1bbd:	3400                	.insn	2, 0x3400
    1bbf:	00004017          	auipc	zero,0x4
    1bc3:	f11a                	.insn	2, 0xf11a
    1bc5:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
    1bc9:	03e01b4b          	.insn	4, 0x03e01b4b
    1bcd:	0000                	.insn	2, 0x0000
    1bcf:	001c                	.insn	2, 0x001c
    1bd1:	e51d                	.insn	2, 0xe51d
    1bd3:	1e000003          	lb	zero,480(zero) # 1e0 <$d.6+0x6f>
    1bd7:	0000003f 0003051f 	.insn	8, 0x0003051f0000003f
    1bdf:	0200                	.insn	2, 0x0200
    1be1:	0032                	.insn	2, 0x0032
    1be3:	0004                	.insn	2, 0x0004
    1be5:	1b00                	.insn	2, 0x1b00
    1be7:	015a                	.insn	2, 0x015a
    1be9:	0000                	.insn	2, 0x0000
    1beb:	0004071b          	.insn	4, 0x0004071b
    1bef:	0000                	.insn	2, 0x0000
    1bf1:	6205                	.insn	2, 0x6205
    1bf3:	0002                	.insn	2, 0x0002
    1bf5:	0500                	.insn	2, 0x0500
    1bf7:	2004                	.insn	2, 0x2004
    1bf9:	4b1a                	.insn	2, 0x4b1a
    1bfb:	0004                	.insn	2, 0x0004
    1bfd:	0200                	.insn	2, 0x0200
    1bff:	1b3a                	.insn	2, 0x1b3a
    1c01:	0000003f 036c1f00 	.insn	8, 0x036c1f000000003f
    1c09:	0000                	.insn	2, 0x0000
    1c0b:	4702                	.insn	2, 0x4702
    1c0d:	0400                	.insn	2, 0x0400
    1c0f:	0000                	.insn	2, 0x0000
    1c11:	0003e01b          	.insn	4, 0x0003e01b
    1c15:	1b00                	.insn	2, 0x1b00
    1c17:	03e0                	.insn	2, 0x03e0
    1c19:	0000                	.insn	2, 0x0000
    1c1b:	2100                	.insn	2, 0x2100
    1c1d:	18d4                	.insn	2, 0x18d4
    1c1f:	0040                	.insn	2, 0x0040
    1c21:	0020                	.insn	2, 0x0020
    1c23:	0000                	.insn	2, 0x0000
    1c25:	5201                	.insn	2, 0x5201
    1c27:	016c                	.insn	2, 0x016c
    1c29:	0000                	.insn	2, 0x0000
    1c2b:	4315                	.insn	2, 0x4315
    1c2d:	0012                	.insn	2, 0x0012
    1c2f:	7800                	.insn	2, 0x7800
    1c31:	0001                	.insn	2, 0x0001
    1c33:	0000                	.insn	2, 0x0000
    1c35:	f422                	.insn	2, 0xf422
    1c37:	4018                	.insn	2, 0x4018
    1c39:	8c00                	.insn	2, 0x8c00
    1c3b:	0002                	.insn	2, 0x0002
    1c3d:	0100                	.insn	2, 0x0100
    1c3f:	1152                	.insn	2, 0x1152
    1c41:	0000                	.insn	2, 0x0000
    1c43:	0100                	.insn	2, 0x0100
    1c45:	13b0                	.insn	2, 0x13b0
    1c47:	1269                	.insn	2, 0x1269
    1c49:	0000                	.insn	2, 0x0000
    1c4b:	02da                	.insn	2, 0x02da
    1c4d:	0000                	.insn	2, 0x0000
    1c4f:	b701                	.insn	2, 0xb701
    1c51:	015a                	.insn	2, 0x015a
    1c53:	0000                	.insn	2, 0x0000
    1c55:	e318                	.insn	2, 0xe318
    1c57:	0000                	.insn	2, 0x0000
    1c59:	0100                	.insn	2, 0x0100
    1c5b:	03b2                	.insn	2, 0x03b2
    1c5d:	0006                	.insn	2, 0x0006
    1c5f:	1400                	.insn	2, 0x1400
    1c61:	016c                	.insn	2, 0x016c
    1c63:	0000                	.insn	2, 0x0000
    1c65:	1938                	.insn	2, 0x1938
    1c67:	0040                	.insn	2, 0x0040
    1c69:	0014                	.insn	2, 0x0014
    1c6b:	0000                	.insn	2, 0x0000
    1c6d:	b801                	.insn	2, 0xb801
    1c6f:	1509                	.insn	2, 0x1509
    1c71:	1256                	.insn	2, 0x1256
    1c73:	0000                	.insn	2, 0x0000
    1c75:	0178                	.insn	2, 0x0178
    1c77:	0000                	.insn	2, 0x0000
    1c79:	1600                	.insn	2, 0x1600
    1c7b:	19bc                	.insn	2, 0x19bc
    1c7d:	0040                	.insn	2, 0x0040
    1c7f:	01c4                	.insn	2, 0x01c4
    1c81:	0000                	.insn	2, 0x0000
    1c83:	0012c513          	xori	a0,t0,1
    1c87:	3c00                	.insn	2, 0x3c00
    1c89:	0000                	.insn	2, 0x0000
    1c8b:	0100                	.insn	2, 0x0100
    1c8d:	00bd                	.insn	2, 0x00bd
    1c8f:	0004                	.insn	2, 0x0004
    1c91:	1900                	.insn	2, 0x1900
    1c93:	02d8                	.insn	2, 0x02d8
    1c95:	0000                	.insn	2, 0x0000
    1c97:	00127c13          	andi	s8,tp,1
    1c9b:	1000                	.insn	2, 0x1000
    1c9d:	0002                	.insn	2, 0x0002
    1c9f:	0100                	.insn	2, 0x0100
    1ca1:	5ae1                	.insn	2, 0x5ae1
    1ca3:	0001                	.insn	2, 0x0001
    1ca5:	1300                	.insn	2, 0x1300
    1ca7:	129a                	.insn	2, 0x129a
    1ca9:	0000                	.insn	2, 0x0000
    1cab:	000000d7          	.insn	4, 0x00d7
    1caf:	e401                	.insn	2, 0xe401
    1cb1:	015a                	.insn	2, 0x015a
    1cb3:	0000                	.insn	2, 0x0000
    1cb5:	00130913          	addi	s2,t1,1
    1cb9:	2200                	.insn	2, 0x2200
    1cbb:	0004                	.insn	2, 0x0004
    1cbd:	0100                	.insn	2, 0x0100
    1cbf:	5ae9                	.insn	2, 0x5ae9
    1cc1:	0001                	.insn	2, 0x0001
    1cc3:	1800                	.insn	2, 0x1800
    1cc5:	0132                	.insn	2, 0x0132
    1cc7:	0000                	.insn	2, 0x0000
    1cc9:	bf01                	.insn	2, 0xbf01
    1ccb:	00000603          	lb	a2,0(zero) # 0 <$d.4>
    1ccf:	c418                	.insn	2, 0xc418
    1cd1:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1cd5:	5ad9                	.insn	2, 0x5ad9
    1cd7:	0001                	.insn	2, 0x0001
    1cd9:	1800                	.insn	2, 0x1800
    1cdb:	000001eb          	.insn	4, 0x01eb
    1cdf:	dd01                	.insn	2, 0xdd01
    1ce1:	015a                	.insn	2, 0x015a
    1ce3:	0000                	.insn	2, 0x0000
    1ce5:	6c14                	.insn	2, 0x6c14
    1ce7:	0001                	.insn	2, 0x0001
    1ce9:	bc00                	.insn	2, 0xbc00
    1ceb:	4019                	.insn	2, 0x4019
    1ced:	1400                	.insn	2, 0x1400
    1cef:	0000                	.insn	2, 0x0000
    1cf1:	0100                	.insn	2, 0x0100
    1cf3:	012313e7          	.insn	4, 0x012313e7
    1cf7:	0001785b          	.insn	4, 0x0001785b
    1cfb:	0000                	.insn	2, 0x0000
    1cfd:	f019                	.insn	2, 0xf019
    1cff:	0002                	.insn	2, 0x0002
    1d01:	1300                	.insn	2, 0x1300
    1d03:	131c                	.insn	2, 0x131c
    1d05:	0000                	.insn	2, 0x0000
    1d07:	00000433          	add	s0,zero,zero
    1d0b:	ca01                	.insn	2, 0xca01
    1d0d:	0400                	.insn	2, 0x0400
    1d0f:	0000                	.insn	2, 0x0000
    1d11:	1900                	.insn	2, 0x1900
    1d13:	0308                	.insn	2, 0x0308
    1d15:	0000                	.insn	2, 0x0000
    1d17:	00140113          	addi	sp,s0,1 # 1 <$d.4+0x1>
    1d1b:	3300                	.insn	2, 0x3300
    1d1d:	0004                	.insn	2, 0x0004
    1d1f:	0100                	.insn	2, 0x0100
    1d21:	00d1                	.insn	2, 0x00d1
    1d23:	0004                	.insn	2, 0x0004
    1d25:	0000                	.insn	2, 0x0000
    1d27:	0000                	.insn	2, 0x0000
    1d29:	00024b17          	auipc	s6,0x24
    1d2d:	2800                	.insn	2, 0x2800
    1d2f:	4019                	.insn	2, 0x4019
    1d31:	1700                	.insn	2, 0x1700
    1d33:	03ea                	.insn	2, 0x03ea
    1d35:	0000                	.insn	2, 0x0000
    1d37:	1960                	.insn	2, 0x1960
    1d39:	0040                	.insn	2, 0x0040
    1d3b:	0003d217          	auipc	tp,0x3d
    1d3f:	0400                	.insn	2, 0x0400
    1d41:	401a                	.insn	2, 0x401a
    1d43:	1700                	.insn	2, 0x1700
    1d45:	0408                	.insn	2, 0x0408
    1d47:	0000                	.insn	2, 0x0000
    1d49:	1a74                	.insn	2, 0x1a74
    1d4b:	0040                	.insn	2, 0x0040
    1d4d:	00040817          	auipc	a6,0x40
    1d51:	8400                	.insn	2, 0x8400
    1d53:	401a                	.insn	2, 0x401a
    1d55:	1700                	.insn	2, 0x1700
    1d57:	0408                	.insn	2, 0x0408
    1d59:	0000                	.insn	2, 0x0000
    1d5b:	1a94                	.insn	2, 0x1a94
    1d5d:	0040                	.insn	2, 0x0040
    1d5f:	00040817          	auipc	a6,0x40
    1d63:	a400                	.insn	2, 0xa400
    1d65:	401a                	.insn	2, 0x401a
    1d67:	1700                	.insn	2, 0x1700
    1d69:	0408                	.insn	2, 0x0408
    1d6b:	0000                	.insn	2, 0x0000
    1d6d:	1ab4                	.insn	2, 0x1ab4
    1d6f:	0040                	.insn	2, 0x0040
    1d71:	00040817          	auipc	a6,0x40
    1d75:	c400                	.insn	2, 0xc400
    1d77:	401a                	.insn	2, 0x401a
    1d79:	1700                	.insn	2, 0x1700
    1d7b:	0408                	.insn	2, 0x0408
    1d7d:	0000                	.insn	2, 0x0000
    1d7f:	1ad4                	.insn	2, 0x1ad4
    1d81:	0040                	.insn	2, 0x0040
    1d83:	00040817          	auipc	a6,0x40
    1d87:	e400                	.insn	2, 0xe400
    1d89:	401a                	.insn	2, 0x401a
    1d8b:	1700                	.insn	2, 0x1700
    1d8d:	0408                	.insn	2, 0x0408
    1d8f:	0000                	.insn	2, 0x0000
    1d91:	1af8                	.insn	2, 0x1af8
    1d93:	0040                	.insn	2, 0x0040
    1d95:	00040817          	auipc	a6,0x40
    1d99:	1800                	.insn	2, 0x1800
    1d9b:	1700401b          	.insn	4, 0x1700401b
    1d9f:	03d2                	.insn	2, 0x03d2
    1da1:	0000                	.insn	2, 0x0000
    1da3:	1b28                	.insn	2, 0x1b28
    1da5:	0040                	.insn	2, 0x0040
    1da7:	00040817          	auipc	a6,0x40
    1dab:	6400                	.insn	2, 0x6400
    1dad:	1700401b          	.insn	4, 0x1700401b
    1db1:	0408                	.insn	2, 0x0408
    1db3:	0000                	.insn	2, 0x0000
    1db5:	1b74                	.insn	2, 0x1b74
    1db7:	0040                	.insn	2, 0x0040
    1db9:	2400                	.insn	2, 0x2400
    1dbb:	02bc                	.insn	2, 0x02bc
    1dbd:	0000                	.insn	2, 0x0000
    1dbf:	f701                	.insn	2, 0xf701
    1dc1:	0400                	.insn	2, 0x0400
    1dc3:	0000                	.insn	2, 0x0000
    1dc5:	0f01                	.insn	2, 0x0f01
    1dc7:	0382                	.insn	2, 0x0382
    1dc9:	0000                	.insn	2, 0x0000
    1dcb:	f801                	.insn	2, 0xf801
    1dcd:	03e0                	.insn	2, 0x03e0
    1dcf:	0000                	.insn	2, 0x0000
    1dd1:	0000a80f          	.insn	4, 0xa80f
    1dd5:	0100                	.insn	2, 0x0100
    1dd7:	03f9                	.insn	2, 0x03f9
    1dd9:	0006                	.insn	2, 0x0006
    1ddb:	1800                	.insn	2, 0x1800
    1ddd:	003c                	.insn	2, 0x003c
    1ddf:	0000                	.insn	2, 0x0000
    1de1:	fb01                	.insn	2, 0xfb01
    1de3:	0400                	.insn	2, 0x0400
    1de5:	0000                	.insn	2, 0x0000
    1de7:	0d25                	.insn	2, 0x0d25
    1de9:	0000                	.insn	2, 0x0000
    1deb:	0100                	.insn	2, 0x0100
    1ded:	0101                	.insn	2, 0x0101
    1def:	0400                	.insn	2, 0x0400
    1df1:	0000                	.insn	2, 0x0000
    1df3:	1d00                	.insn	2, 0x1d00
    1df5:	000000eb          	.insn	4, 0x00eb
    1df9:	8026                	.insn	2, 0x8026
    1dfb:	3400401b          	.insn	4, 0x3400401b
    1dff:	0004                	.insn	2, 0x0004
    1e01:	0100                	.insn	2, 0x0100
    1e03:	a352                	.insn	2, 0xa352
    1e05:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1e09:	011d                	.insn	2, 0x011d
    1e0b:	0400                	.insn	2, 0x0400
    1e0d:	0000                	.insn	2, 0x0000
    1e0f:	00145727          	.insn	4, 0x00145727
    1e13:	8200                	.insn	2, 0x8200
    1e15:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1e19:	011d                	.insn	2, 0x011d
    1e1b:	03e0                	.insn	2, 0x03e0
    1e1d:	0000                	.insn	2, 0x0000
    1e1f:	0228                	.insn	2, 0x0228
    1e21:	0191                	.insn	2, 0x0191
    1e23:	033c                	.insn	2, 0x033c
    1e25:	0000                	.insn	2, 0x0000
    1e27:	2a01                	.insn	2, 0x2a01
    1e29:	6601                	.insn	2, 0x6601
    1e2b:	29000007          	.insn	4, 0x29000007
    1e2f:	1488                	.insn	2, 0x1488
    1e31:	0000                	.insn	2, 0x0000
    1e33:	02da                	.insn	2, 0x02da
    1e35:	0000                	.insn	2, 0x0000
    1e37:	2401                	.insn	2, 0x2401
    1e39:	5a01                	.insn	2, 0x5a01
    1e3b:	0001                	.insn	2, 0x0001
    1e3d:	2500                	.insn	2, 0x2500
    1e3f:	000000e3          	beqz	zero,263f <$d.5+0xe4e>
    1e43:	1f01                	.insn	2, 0x1f01
    1e45:	0301                	.insn	2, 0x0301
    1e47:	0006                	.insn	2, 0x0006
    1e49:	2a00                	.insn	2, 0x2a00
    1e4b:	016c                	.insn	2, 0x016c
    1e4d:	0000                	.insn	2, 0x0000
    1e4f:	1bb8                	.insn	2, 0x1bb8
    1e51:	0040                	.insn	2, 0x0040
    1e53:	0014                	.insn	2, 0x0014
    1e55:	0000                	.insn	2, 0x0000
    1e57:	2501                	.insn	2, 0x2501
    1e59:	0901                	.insn	2, 0x0901
    1e5b:	7515                	.insn	2, 0x7515
    1e5d:	0014                	.insn	2, 0x0014
    1e5f:	7800                	.insn	2, 0x7800
    1e61:	0001                	.insn	2, 0x0001
    1e63:	0000                	.insn	2, 0x0000
    1e65:	c92a                	.insn	2, 0xc92a
    1e67:	0005                	.insn	2, 0x0005
    1e69:	e800                	.insn	2, 0xe800
    1e6b:	e400401b          	.insn	4, 0xe400401b
    1e6f:	0000                	.insn	2, 0x0000
    1e71:	0100                	.insn	2, 0x0100
    1e73:	012c                	.insn	2, 0x012c
    1e75:	1505                	.insn	2, 0x1505
    1e77:	0000153f 000005d5 	.insn	8, 0x05d50000153f
    1e7f:	01910323          	sb	s9,6(sp) # dc006 <$d.5+0xda815>
    1e83:	e09f 0005 2b00      	.insn	6, 0x2b000005e09f
    1e89:	0000149b          	.insn	4, 0x149b
    1e8d:	000005eb          	.insn	4, 0x05eb
    1e91:	0015522b          	.insn	4, 0x0015522b
    1e95:	f600                	.insn	2, 0xf600
    1e97:	0005                	.insn	2, 0x0005
    1e99:	0000                	.insn	2, 0x0000
    1e9b:	cc16                	.insn	2, 0xcc16
    1e9d:	401c                	.insn	2, 0x401c
    1e9f:	c800                	.insn	2, 0xc800
    1ea1:	0002                	.insn	2, 0x0002
    1ea3:	2900                	.insn	2, 0x2900
    1ea5:	15b1                	.insn	2, 0x15b1
    1ea7:	0000                	.insn	2, 0x0000
    1ea9:	003c                	.insn	2, 0x003c
    1eab:	0000                	.insn	2, 0x0000
    1ead:	2e01                	.insn	2, 0x2e01
    1eaf:	0001                	.insn	2, 0x0001
    1eb1:	0004                	.insn	2, 0x0004
    1eb3:	1600                	.insn	2, 0x1600
    1eb5:	1ccc                	.insn	2, 0x1ccc
    1eb7:	0040                	.insn	2, 0x0040
    1eb9:	02c8                	.insn	2, 0x02c8
    1ebb:	0000                	.insn	2, 0x0000
    1ebd:	8929                	.insn	2, 0x8929
    1ebf:	0016                	.insn	2, 0x0016
    1ec1:	3200                	.insn	2, 0x3200
    1ec3:	0001                	.insn	2, 0x0001
    1ec5:	0100                	.insn	2, 0x0100
    1ec7:	0130                	.insn	2, 0x0130
    1ec9:	00000603          	lb	a2,0(zero) # 0 <$d.4>
    1ecd:	2019                	.insn	2, 0x2019
    1ecf:	29000003          	lb	zero,656(zero) # 290 <$d.6+0x8>
    1ed3:	17f2                	.insn	2, 0x17f2
    1ed5:	0000                	.insn	2, 0x0000
    1ed7:	00000433          	add	s0,zero,zero
    1edb:	3a01                	.insn	2, 0x3a01
    1edd:	0001                	.insn	2, 0x0001
    1edf:	0004                	.insn	2, 0x0004
    1ee1:	0000                	.insn	2, 0x0000
    1ee3:	5019                	.insn	2, 0x5019
    1ee5:	29000003          	lb	zero,656(zero) # 290 <$d.6+0x8>
    1ee9:	1741                	.insn	2, 0x1741
    1eeb:	0000                	.insn	2, 0x0000
    1eed:	00000433          	add	s0,zero,zero
    1ef1:	3601                	.insn	2, 0x3601
    1ef3:	0001                	.insn	2, 0x0001
    1ef5:	0004                	.insn	2, 0x0004
    1ef7:	0000                	.insn	2, 0x0000
    1ef9:	0000                	.insn	2, 0x0000
    1efb:	00024b17          	auipc	s6,0x24
    1eff:	a400                	.insn	2, 0xa400
    1f01:	1700401b          	.insn	4, 0x1700401b
    1f05:	03ea                	.insn	2, 0x03ea
    1f07:	0000                	.insn	2, 0x0000
    1f09:	1be0                	.insn	2, 0x1be0
    1f0b:	0040                	.insn	2, 0x0040
    1f0d:	0003d217          	auipc	tp,0x3d
    1f11:	5400                	.insn	2, 0x5400
    1f13:	401f 1700 03d2      	.insn	6, 0x03d21700401f
    1f19:	0000                	.insn	2, 0x0000
    1f1b:	1f64                	.insn	2, 0x1f64
    1f1d:	0040                	.insn	2, 0x0040
    1f1f:	00074117          	auipc	sp,0x74
    1f23:	7400                	.insn	2, 0x7400
    1f25:	401f 1700 03d2      	.insn	6, 0x03d21700401f
    1f2b:	0000                	.insn	2, 0x0000
    1f2d:	1f90                	.insn	2, 0x1f90
    1f2f:	0040                	.insn	2, 0x0040
    1f31:	1f00                	.insn	2, 0x1f00
    1f33:	0074                	.insn	2, 0x0074
    1f35:	0000                	.insn	2, 0x0000
    1f37:	3102                	.insn	2, 0x3102
    1f39:	015a                	.insn	2, 0x015a
    1f3b:	0000                	.insn	2, 0x0000
    1f3d:	00015a1b          	.insn	4, 0x00015a1b
    1f41:	1b00                	.insn	2, 0x1b00
    1f43:	00000757          	.insn	4, 0x0757
    1f47:	1d00                	.insn	2, 0x1d00
    1f49:	075c                	.insn	2, 0x075c
    1f4b:	0000                	.insn	2, 0x0000
    1f4d:	eb1e                	.insn	2, 0xeb1e
    1f4f:	0000                	.insn	2, 0x0000
    1f51:	1d00                	.insn	2, 0x1d00
    1f53:	015a                	.insn	2, 0x015a
    1f55:	0000                	.insn	2, 0x0000
    1f57:	0000eb03          	.insn	4, 0xeb03
    1f5b:	0400                	.insn	2, 0x0400
    1f5d:	0046                	.insn	2, 0x0046
    1f5f:	0000                	.insn	2, 0x0000
    1f61:	00000b 	.3byte	0x00000b

セクション .debug_ranges の逆アセンブル:

00000000 <$d.5>:
   0:	023c                	.insn	2, 0x023c
   2:	0000                	.insn	2, 0x0000
   4:	0370                	.insn	2, 0x0370
   6:	0000                	.insn	2, 0x0000
   8:	0374                	.insn	2, 0x0374
   a:	0000                	.insn	2, 0x0000
   c:	0990                	.insn	2, 0x0990
	...
  16:	0000                	.insn	2, 0x0000
  18:	0694                	.insn	2, 0x0694
  1a:	0000                	.insn	2, 0x0000
  1c:	06b8                	.insn	2, 0x06b8
  1e:	0000                	.insn	2, 0x0000
  20:	07dc                	.insn	2, 0x07dc
  22:	0000                	.insn	2, 0x0000
  24:	07ec                	.insn	2, 0x07ec
	...
  2e:	0000                	.insn	2, 0x0000
  30:	064c                	.insn	2, 0x064c
  32:	0000                	.insn	2, 0x0000
  34:	0670                	.insn	2, 0x0670
  36:	0000                	.insn	2, 0x0000
  38:	06bc                	.insn	2, 0x06bc
  3a:	0000                	.insn	2, 0x0000
  3c:	06cc                	.insn	2, 0x06cc
	...
  46:	0000                	.insn	2, 0x0000
  48:	0600                	.insn	2, 0x0600
  4a:	0000                	.insn	2, 0x0000
  4c:	064c                	.insn	2, 0x064c
  4e:	0000                	.insn	2, 0x0000
  50:	0678                	.insn	2, 0x0678
  52:	0000                	.insn	2, 0x0000
  54:	068c                	.insn	2, 0x068c
  56:	0000                	.insn	2, 0x0000
  58:	06f8                	.insn	2, 0x06f8
  5a:	0000                	.insn	2, 0x0000
  5c:	07b8                	.insn	2, 0x07b8
  5e:	0000                	.insn	2, 0x0000
  60:	0818                	.insn	2, 0x0818
  62:	0000                	.insn	2, 0x0000
  64:	0878                	.insn	2, 0x0878
	...
  6e:	0000                	.insn	2, 0x0000
  70:	0608                	.insn	2, 0x0608
  72:	0000                	.insn	2, 0x0000
  74:	064c                	.insn	2, 0x064c
  76:	0000                	.insn	2, 0x0000
  78:	0688                	.insn	2, 0x0688
  7a:	0000                	.insn	2, 0x0000
  7c:	068c                	.insn	2, 0x068c
  7e:	0000                	.insn	2, 0x0000
  80:	06f8                	.insn	2, 0x06f8
  82:	0000                	.insn	2, 0x0000
  84:	074c                	.insn	2, 0x074c
	...
  8e:	0000                	.insn	2, 0x0000
  90:	06f8                	.insn	2, 0x06f8
  92:	0000                	.insn	2, 0x0000
  94:	0704                	.insn	2, 0x0704
  96:	0000                	.insn	2, 0x0000
  98:	0708                	.insn	2, 0x0708
  9a:	0000                	.insn	2, 0x0000
  9c:	0714                	.insn	2, 0x0714
  9e:	0000                	.insn	2, 0x0000
  a0:	071c                	.insn	2, 0x071c
  a2:	0000                	.insn	2, 0x0000
  a4:	074c                	.insn	2, 0x074c
	...
  ae:	0000                	.insn	2, 0x0000
  b0:	0768                	.insn	2, 0x0768
  b2:	0000                	.insn	2, 0x0000
  b4:	07b8                	.insn	2, 0x07b8
  b6:	0000                	.insn	2, 0x0000
  b8:	0818                	.insn	2, 0x0818
  ba:	0000                	.insn	2, 0x0000
  bc:	086c                	.insn	2, 0x086c
	...
  c6:	0000                	.insn	2, 0x0000
  c8:	0818                	.insn	2, 0x0818
  ca:	0000                	.insn	2, 0x0000
  cc:	0824                	.insn	2, 0x0824
  ce:	0000                	.insn	2, 0x0000
  d0:	0828                	.insn	2, 0x0828
  d2:	0000                	.insn	2, 0x0000
  d4:	0834                	.insn	2, 0x0834
  d6:	0000                	.insn	2, 0x0000
  d8:	083c                	.insn	2, 0x083c
  da:	0000                	.insn	2, 0x0000
  dc:	086c                	.insn	2, 0x086c
	...
  e6:	0000                	.insn	2, 0x0000
  e8:	0320                	.insn	2, 0x0320
  ea:	0000                	.insn	2, 0x0000
  ec:	0370                	.insn	2, 0x0370
  ee:	0000                	.insn	2, 0x0000
  f0:	0374                	.insn	2, 0x0374
  f2:	0000                	.insn	2, 0x0000
  f4:	0404                	.insn	2, 0x0404
	...
  fe:	0000                	.insn	2, 0x0000
 100:	09f0                	.insn	2, 0x09f0
 102:	0000                	.insn	2, 0x0000
 104:	0a08                	.insn	2, 0x0a08
 106:	0000                	.insn	2, 0x0000
 108:	0a0c                	.insn	2, 0x0a0c
 10a:	0000                	.insn	2, 0x0000
 10c:	0a18                	.insn	2, 0x0a18
 10e:	0000                	.insn	2, 0x0000
 110:	0a20                	.insn	2, 0x0a20
 112:	0000                	.insn	2, 0x0000
 114:	0a50                	.insn	2, 0x0a50
	...

00000120 <$d.6>:
 120:	0c04                	.insn	2, 0x0c04
 122:	0040                	.insn	2, 0x0040
 124:	0c24                	.insn	2, 0x0c24
 126:	0040                	.insn	2, 0x0040
 128:	0cc8                	.insn	2, 0x0cc8
 12a:	0040                	.insn	2, 0x0040
 12c:	0ce8                	.insn	2, 0x0ce8
 12e:	0040                	.insn	2, 0x0040
	...
 138:	0c24                	.insn	2, 0x0c24
 13a:	0040                	.insn	2, 0x0040
 13c:	0c30                	.insn	2, 0x0c30
 13e:	0040                	.insn	2, 0x0040
 140:	0ce8                	.insn	2, 0x0ce8
 142:	0040                	.insn	2, 0x0040
 144:	0cf4                	.insn	2, 0x0cf4
 146:	0040                	.insn	2, 0x0040
	...
 150:	0c30                	.insn	2, 0x0c30
 152:	0040                	.insn	2, 0x0040
 154:	0c3c                	.insn	2, 0x0c3c
 156:	0040                	.insn	2, 0x0040
 158:	0cf4                	.insn	2, 0x0cf4
 15a:	0040                	.insn	2, 0x0040
 15c:	0d00                	.insn	2, 0x0d00
 15e:	0040                	.insn	2, 0x0040
	...
 168:	0d04                	.insn	2, 0x0d04
 16a:	0040                	.insn	2, 0x0040
 16c:	0d14                	.insn	2, 0x0d14
 16e:	0040                	.insn	2, 0x0040
 170:	0dd8                	.insn	2, 0x0dd8
 172:	0040                	.insn	2, 0x0040
 174:	0de8                	.insn	2, 0x0de8
 176:	0040                	.insn	2, 0x0040
	...
 180:	0d14                	.insn	2, 0x0d14
 182:	0040                	.insn	2, 0x0040
 184:	0d20                	.insn	2, 0x0d20
 186:	0040                	.insn	2, 0x0040
 188:	0de8                	.insn	2, 0x0de8
 18a:	0040                	.insn	2, 0x0040
 18c:	0df4                	.insn	2, 0x0df4
 18e:	0040                	.insn	2, 0x0040
	...
 198:	0d20                	.insn	2, 0x0d20
 19a:	0040                	.insn	2, 0x0040
 19c:	0d2c                	.insn	2, 0x0d2c
 19e:	0040                	.insn	2, 0x0040
 1a0:	0df4                	.insn	2, 0x0df4
 1a2:	0040                	.insn	2, 0x0040
 1a4:	0e00                	.insn	2, 0x0e00
 1a6:	0040                	.insn	2, 0x0040
	...
 1b0:	0da8                	.insn	2, 0x0da8
 1b2:	0040                	.insn	2, 0x0040
 1b4:	0db8                	.insn	2, 0x0db8
 1b6:	0040                	.insn	2, 0x0040
 1b8:	0e04                	.insn	2, 0x0e04
 1ba:	0040                	.insn	2, 0x0040
 1bc:	0e14                	.insn	2, 0x0e14
 1be:	0040                	.insn	2, 0x0040
	...
 1c8:	0db8                	.insn	2, 0x0db8
 1ca:	0040                	.insn	2, 0x0040
 1cc:	0dc4                	.insn	2, 0x0dc4
 1ce:	0040                	.insn	2, 0x0040
 1d0:	0e14                	.insn	2, 0x0e14
 1d2:	0040                	.insn	2, 0x0040
 1d4:	0e20                	.insn	2, 0x0e20
 1d6:	0040                	.insn	2, 0x0040
	...
 1e0:	0dc4                	.insn	2, 0x0dc4
 1e2:	0040                	.insn	2, 0x0040
 1e4:	0dd4                	.insn	2, 0x0dd4
 1e6:	0040                	.insn	2, 0x0040
 1e8:	0e20                	.insn	2, 0x0e20
 1ea:	0040                	.insn	2, 0x0040
 1ec:	0e2c                	.insn	2, 0x0e2c
 1ee:	0040                	.insn	2, 0x0040
	...
 1f8:	1044                	.insn	2, 0x1044
 1fa:	0040                	.insn	2, 0x0040
 1fc:	1068                	.insn	2, 0x1068
 1fe:	0040                	.insn	2, 0x0040
 200:	11b4                	.insn	2, 0x11b4
 202:	0040                	.insn	2, 0x0040
 204:	1218                	.insn	2, 0x1218
 206:	0040                	.insn	2, 0x0040
	...
 210:	1094                	.insn	2, 0x1094
 212:	0040                	.insn	2, 0x0040
 214:	10a0                	.insn	2, 0x10a0
 216:	0040                	.insn	2, 0x0040
 218:	10b0                	.insn	2, 0x10b0
 21a:	0040                	.insn	2, 0x0040
 21c:	10bc                	.insn	2, 0x10bc
 21e:	0040                	.insn	2, 0x0040
 220:	10cc                	.insn	2, 0x10cc
 222:	0040                	.insn	2, 0x0040
 224:	10d8                	.insn	2, 0x10d8
 226:	0040                	.insn	2, 0x0040
 228:	10e8                	.insn	2, 0x10e8
 22a:	0040                	.insn	2, 0x0040
 22c:	10f4                	.insn	2, 0x10f4
 22e:	0040                	.insn	2, 0x0040
 230:	1104                	.insn	2, 0x1104
 232:	0040                	.insn	2, 0x0040
 234:	1110                	.insn	2, 0x1110
 236:	0040                	.insn	2, 0x0040
 238:	1120                	.insn	2, 0x1120
 23a:	0040                	.insn	2, 0x0040
 23c:	112c                	.insn	2, 0x112c
 23e:	0040                	.insn	2, 0x0040
 240:	113c                	.insn	2, 0x113c
 242:	0040                	.insn	2, 0x0040
 244:	1148                	.insn	2, 0x1148
 246:	0040                	.insn	2, 0x0040
 248:	1154                	.insn	2, 0x1154
 24a:	0040                	.insn	2, 0x0040
 24c:	1160                	.insn	2, 0x1160
 24e:	0040                	.insn	2, 0x0040
	...
 258:	1338                	.insn	2, 0x1338
 25a:	0040                	.insn	2, 0x0040
 25c:	1384                	.insn	2, 0x1384
 25e:	0040                	.insn	2, 0x0040
 260:	1388                	.insn	2, 0x1388
 262:	0040                	.insn	2, 0x0040
 264:	1390                	.insn	2, 0x1390
 266:	0040                	.insn	2, 0x0040
	...
 270:	0b34                	.insn	2, 0x0b34
 272:	0040                	.insn	2, 0x0040
 274:	141c                	.insn	2, 0x141c
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
 2d8:	05a0                	.insn	2, 0x05a0
 2da:	0000                	.insn	2, 0x0000
 2dc:	05e8                	.insn	2, 0x05e8
 2de:	0000                	.insn	2, 0x0000
 2e0:	05f4                	.insn	2, 0x05f4
 2e2:	0000                	.insn	2, 0x0000
 2e4:	0764                	.insn	2, 0x0764
	...
 2ee:	0000                	.insn	2, 0x0000
 2f0:	0608                	.insn	2, 0x0608
 2f2:	0000                	.insn	2, 0x0000
 2f4:	0644                	.insn	2, 0x0644
 2f6:	0000                	.insn	2, 0x0000
 2f8:	0650                	.insn	2, 0x0650
 2fa:	0000                	.insn	2, 0x0000
 2fc:	06c8                	.insn	2, 0x06c8
	...
 306:	0000                	.insn	2, 0x0000
 308:	06dc                	.insn	2, 0x06dc
 30a:	0000                	.insn	2, 0x0000
 30c:	06fc                	.insn	2, 0x06fc
 30e:	0000                	.insn	2, 0x0000
 310:	0740                	.insn	2, 0x0740
 312:	0000                	.insn	2, 0x0000
 314:	0764                	.insn	2, 0x0764
	...
 31e:	0000                	.insn	2, 0x0000
 320:	0a78                	.insn	2, 0x0a78
 322:	0000                	.insn	2, 0x0000
 324:	0ab4                	.insn	2, 0x0ab4
 326:	0000                	.insn	2, 0x0000
 328:	0ac0                	.insn	2, 0x0ac0
 32a:	0000                	.insn	2, 0x0000
 32c:	0ac8                	.insn	2, 0x0ac8
 32e:	0000                	.insn	2, 0x0000
 330:	0ad4                	.insn	2, 0x0ad4
 332:	0000                	.insn	2, 0x0000
 334:	0adc                	.insn	2, 0x0adc
 336:	0000                	.insn	2, 0x0000
 338:	0ae8                	.insn	2, 0x0ae8
 33a:	0000                	.insn	2, 0x0000
 33c:	0af0                	.insn	2, 0x0af0
 33e:	0000                	.insn	2, 0x0000
 340:	0afc                	.insn	2, 0x0afc
 342:	0000                	.insn	2, 0x0000
 344:	0b04                	.insn	2, 0x0b04
	...
 34e:	0000                	.insn	2, 0x0000
 350:	0ab4                	.insn	2, 0x0ab4
 352:	0000                	.insn	2, 0x0000
 354:	0ac0                	.insn	2, 0x0ac0
 356:	0000                	.insn	2, 0x0000
 358:	0ac8                	.insn	2, 0x0ac8
 35a:	0000                	.insn	2, 0x0000
 35c:	0ad4                	.insn	2, 0x0ad4
 35e:	0000                	.insn	2, 0x0000
 360:	0adc                	.insn	2, 0x0adc
 362:	0000                	.insn	2, 0x0000
 364:	0ae8                	.insn	2, 0x0ae8
 366:	0000                	.insn	2, 0x0000
 368:	0af0                	.insn	2, 0x0af0
 36a:	0000                	.insn	2, 0x0000
 36c:	0afc                	.insn	2, 0x0afc
	...

セクション .debug_str の逆アセンブル:

00000000 <$d.6-0x171>:
   0:	615f6473          	csrrsi	s0,htimedeltah,30
   4:	6970                	.insn	2, 0x6970
   6:	7300                	.insn	2, 0x7300
   8:	6174                	.insn	2, 0x6174
   a:	7472                	.insn	2, 0x7472
   c:	7000                	.insn	2, 0x7000
   e:	6600736f          	jal	t1,766e <$d.5+0x5e7d>
  12:	7461                	.insn	2, 0x7461
  14:	6c5f3233          	.insn	4, 0x6c5f3233
  18:	61660073          	.insn	4, 0x61660073
  1c:	3374                	.insn	2, 0x3374
  1e:	5f32                	.insn	2, 0x5f32
  20:	00746163          	bltu	s0,t2,22 <$d.1+0x22>
  24:	5f646d63          	bltu	s0,s6,61e <$d.3+0xbc>
  28:	7270                	.insn	2, 0x7270
  2a:	6d69                	.insn	2, 0x6d69
  2c:	7365                	.insn	2, 0x7365
  2e:	6c00                	.insn	2, 0x6c00
  30:	6e65                	.insn	2, 0x6e65
  32:	6d00                	.insn	2, 0x6d00
  34:	7461                	.insn	2, 0x7461
  36:	6972                	.insn	2, 0x6972
  38:	5f78                	.insn	2, 0x5f78
  3a:	00690043          	.insn	4, 0x00690043
  3e:	7364                	.insn	2, 0x7364
  40:	0074                	.insn	2, 0x0074
  42:	6c6c6163          	bltu	s8,t1,704 <$d.3+0x1a2>
  46:	6d5f 6369 775f      	.insn	6, 0x775f63696d5f
  4c:	6972                	.insn	2, 0x6972
  4e:	6574                	.insn	2, 0x6574
  50:	665f 6c69 0065      	.insn	6, 0x00656c69665f
  56:	6e756f63          	bltu	a0,t2,754 <$d.3+0x1f2>
  5a:	0074                	.insn	2, 0x0074
  5c:	70007773          	csrrci	a4,0x700,0
  60:	6100                	.insn	2, 0x6100
  62:	6464                	.insn	2, 0x6464
  64:	0072                	.insn	2, 0x0072
  66:	616d                	.insn	2, 0x616d
  68:	7274                	.insn	2, 0x7274
  6a:	7869                	.insn	2, 0x7869
  6c:	6d5f 7861 6100      	.insn	6, 0x610078616d5f
  72:	61630033          	.insn	4, 0x61630033
  76:	6c6c                	.insn	2, 0x6c6c
  78:	735f 5f64 7277      	.insn	6, 0x72775f64735f
  7e:	7469                	.insn	2, 0x7469
  80:	5f65                	.insn	2, 0x5f65
  82:	7562                	.insn	2, 0x7562
  84:	5f66                	.insn	2, 0x5f66
  86:	7061                	.insn	2, 0x7061
  88:	0069                	.insn	2, 0x0069
  8a:	616d                	.insn	2, 0x616d
  8c:	7274                	.insn	2, 0x7274
  8e:	7869                	.insn	2, 0x7869
  90:	415f 6d00 7461      	.insn	6, 0x74616d00415f
  96:	6972                	.insn	2, 0x6972
  98:	5f78                	.insn	2, 0x5f78
  9a:	657a6973          	csrrsi	s2,hviprio2h,20
  9e:	7000                	.insn	2, 0x7000
  a0:	6f72                	.insn	2, 0x6f72
  a2:	706d                	.insn	2, 0x706d
  a4:	0074                	.insn	2, 0x0074
  a6:	006e                	.insn	2, 0x006e
  a8:	0074756f          	jal	a0,478ae <$d.5+0x460bd>
  ac:	6975                	.insn	2, 0x6975
  ae:	746e                	.insn	2, 0x746e
  b0:	7470                	.insn	2, 0x7470
  b2:	5f72                	.insn	2, 0x5f72
  b4:	0074                	.insn	2, 0x0074
  b6:	6166                	.insn	2, 0x6166
  b8:	3374                	.insn	2, 0x3374
  ba:	5f32                	.insn	2, 0x5f32
  bc:	6f6d                	.insn	2, 0x6f6d
  be:	6e75                	.insn	2, 0x6e75
  c0:	0074                	.insn	2, 0x0074
  c2:	73756c63          	bltu	a0,s7,7fa <$d.3+0x298>
  c6:	6574                	.insn	2, 0x6574
  c8:	0072                	.insn	2, 0x0072
  ca:	6f72                	.insn	2, 0x6f72
  cc:	635f746f          	jal	s0,f7f00 <$d.5+0xf670f>
  d0:	756c                	.insn	2, 0x756c
  d2:	72657473          	csrrci	s0,mhpmevent6h,10
  d6:	6c00                	.insn	2, 0x6c00
  d8:	6162                	.insn	2, 0x6162
  da:	6200                	.insn	2, 0x6200
  dc:	006c6f6f          	jal	t5,c60e2 <$d.5+0xc48f1>
  e0:	3261                	.insn	2, 0x3261
  e2:	6200                	.insn	2, 0x6200
  e4:	6675                	.insn	2, 0x6675
  e6:	6400                	.insn	2, 0x6400
  e8:	7461                	.insn	2, 0x7461
  ea:	5f61                	.insn	2, 0x5f61
  ec:	6562                	.insn	2, 0x6562
  ee:	006e6967          	.insn	4, 0x006e6967
  f2:	0076                	.insn	2, 0x0076
  f4:	6c6c6163          	bltu	s8,t1,7b6 <$d.3+0x254>
  f8:	735f 5f64 6572      	.insn	6, 0x65725f64735f
  fe:	6461                	.insn	2, 0x6461
 100:	615f 6970 7300      	.insn	6, 0x73006970615f
 106:	6372                	.insn	2, 0x6372
 108:	6573752f          	.insn	4, 0x6573752f
 10c:	2e72                	.insn	2, 0x2e72
 10e:	72700063          	beq	zero,t2,82e <$d.3+0x2cc>
 112:	6e69                	.insn	2, 0x6e69
 114:	5f74                	.insn	2, 0x5f74
 116:	6e69                	.insn	2, 0x6e69
 118:	0074                	.insn	2, 0x0074
 11a:	73756c63          	bltu	a0,s7,852 <$d.3+0x2f0>
 11e:	6574                	.insn	2, 0x6574
 120:	5f72                	.insn	2, 0x5f72
 122:	6f74                	.insn	2, 0x6f74
 124:	6c5f 6162 6400      	.insn	6, 0x640061626c5f
 12a:	6d75                	.insn	2, 0x6d75
 12c:	5f70                	.insn	2, 0x5f70
 12e:	7061                	.insn	2, 0x7061
 130:	0069                	.insn	2, 0x0069
 132:	0065                	.insn	2, 0x0065
 134:	6d630063          	beq	t1,s6,7f4 <$d.3+0x292>
 138:	6c64                	.insn	2, 0x6c64
 13a:	6e69                	.insn	2, 0x6e69
 13c:	0065                	.insn	2, 0x0065
 13e:	696d                	.insn	2, 0x696d
 140:	70615f63          	bge	sp,t1,85e <$d.3+0x2fc>
 144:	0069                	.insn	2, 0x0069
 146:	696d                	.insn	2, 0x696d
 148:	70615f63          	bge	sp,t1,866 <$d.3+0x304>
 14c:	3269                	.insn	2, 0x3269
 14e:	7300                	.insn	2, 0x7300
 150:	0031                	.insn	2, 0x0031
 152:	61660073          	.insn	4, 0x61660073
 156:	3374                	.insn	2, 0x3374
 158:	5f32                	.insn	2, 0x5f32
 15a:	6966                	.insn	2, 0x6966
 15c:	646e                	.insn	2, 0x646e
 15e:	6b00                	.insn	2, 0x6b00
 160:	6e00                	.insn	2, 0x6e00
 162:	6269                	.insn	2, 0x6269
 164:	6c62                	.insn	2, 0x6c62
 166:	0065                	.insn	2, 0x0065
 168:	6170                	.insn	2, 0x6170
 16a:	7472                	.insn	2, 0x7472
 16c:	6c5f 6162       	.insn	6, 0x550061626c5f

00000171 <$d.6>:
 171:	6255                	.insn	2, 0x6255
 173:	6e75                	.insn	2, 0x6e75
 175:	7574                	.insn	2, 0x7574
 177:	6320                	.insn	2, 0x6320
 179:	616c                	.insn	2, 0x616c
 17b:	676e                	.insn	2, 0x676e
 17d:	7620                	.insn	2, 0x7620
 17f:	7265                	.insn	2, 0x7265
 181:	6e6f6973          	csrrsi	s2,0x6e6,30
 185:	3120                	.insn	2, 0x3120
 187:	2e38                	.insn	2, 0x2e38
 189:	2e31                	.insn	2, 0x2e31
 18b:	31282033          	.insn	4, 0x31282033
 18f:	6275                	.insn	2, 0x6275
 191:	6e75                	.insn	2, 0x6e75
 193:	7574                	.insn	2, 0x7574
 195:	2931                	.insn	2, 0x2931
 197:	6d00                	.insn	2, 0x6d00
 199:	7861                	.insn	2, 0x7861
 19b:	7200                	.insn	2, 0x7200
 19d:	7465                	.insn	2, 0x7465
 19f:	7300                	.insn	2, 0x7300
 1a1:	7274                	.insn	2, 0x7274
 1a3:	00797063          	bgeu	s2,t2,1a3 <$d.6+0x32>
 1a7:	6162                	.insn	2, 0x6162
 1a9:	73006573          	csrrsi	a0,mhpmevent16h,0
 1ad:	6372                	.insn	2, 0x6372
 1af:	7461662f          	.insn	4, 0x7461662f
 1b3:	632e3233          	.insn	4, 0x632e3233
 1b7:	6700                	.insn	2, 0x6700
 1b9:	665f 7461 3233      	.insn	6, 0x32337461665f
 1bf:	6300                	.insn	2, 0x6300
 1c1:	6c61                	.insn	2, 0x6c61
 1c3:	5f6c                	.insn	2, 0x5f6c
 1c5:	7564                	.insn	2, 0x7564
 1c7:	706d                	.insn	2, 0x706d
 1c9:	615f 6970 6300      	.insn	6, 0x63006970615f
 1cf:	6c61                	.insn	2, 0x6c61
 1d1:	5f6c                	.insn	2, 0x5f6c
 1d3:	696d                	.insn	2, 0x696d
 1d5:	72775f63          	bge	a4,t2,913 <$d.3+0x3b1>
 1d9:	7469                	.insn	2, 0x7469
 1db:	5f65                	.insn	2, 0x5f65
 1dd:	7061                	.insn	2, 0x7061
 1df:	0069                	.insn	2, 0x0069
 1e1:	6166                	.insn	2, 0x6166
 1e3:	3374                	.insn	2, 0x3374
 1e5:	5f32                	.insn	2, 0x5f32
 1e7:	7562                	.insn	2, 0x7562
 1e9:	0066                	.insn	2, 0x0066
 1eb:	6c5f6c63          	bltu	t5,t0,8c3 <$d.3+0x361>
 1ef:	6975006f          	j	51085 <$d.5+0x4f894>
 1f3:	746e                	.insn	2, 0x746e
 1f5:	745f3233          	.insn	4, 0x745f3233
 1f9:	6600                	.insn	2, 0x6600
 1fb:	7461                	.insn	2, 0x7461
 1fd:	695f3233          	.insn	4, 0x695f3233
 201:	666e                	.insn	2, 0x666e
 203:	00745f6f          	jal	t5,45a09 <$d.5+0x44218>
 207:	6572                	.insn	2, 0x6572
 209:	76726573          	csrrsi	a0,0x767,4
 20d:	6465                	.insn	2, 0x6465
 20f:	6300                	.insn	2, 0x6300
 211:	006c                	.insn	2, 0x006c
 213:	2f637273          	csrrci	tp,0x2f6,6
 217:	6c656873          	csrrsi	a6,0x6c6,10
 21b:	2e6c                	.insn	2, 0x2e6c
 21d:	79730063          	beq	t1,s7,99d <$d.11+0x40>
 221:	006f6e73          	csrrsi	t3,0x6,30
 225:	00637273          	csrrci	tp,0x6,6
 229:	6c6c6163          	bltu	s8,t1,8eb <$d.3+0x389>
 22d:	735f 5f64 7277      	.insn	6, 0x72775f64735f
 233:	7469                	.insn	2, 0x7469
 235:	5f65                	.insn	2, 0x5f65
 237:	6574                	.insn	2, 0x6574
 239:	615f7473          	csrrci	s0,htimedeltah,30
 23d:	6970                	.insn	2, 0x6970
 23f:	6d00                	.insn	2, 0x6d00
 241:	6961                	.insn	2, 0x6961
 243:	006e                	.insn	2, 0x006e
 245:	6e75                	.insn	2, 0x6e75
 247:	6e676973          	csrrsi	s2,0x6e6,14
 24b:	6465                	.insn	2, 0x6465
 24d:	6320                	.insn	2, 0x6320
 24f:	6168                	.insn	2, 0x6168
 251:	0072                	.insn	2, 0x0072
 253:	6166                	.insn	2, 0x6166
 255:	5f74                	.insn	2, 0x5f74
 257:	6562                	.insn	2, 0x6562
 259:	006e6967          	.insn	4, 0x006e6967
 25d:	72616863          	bltu	sp,t1,98d <$d.11+0x30>
 261:	6900                	.insn	2, 0x6900
 263:	746e                	.insn	2, 0x746e
 265:	6100                	.insn	2, 0x6100
 267:	6772                	.insn	2, 0x6772
 269:	0076                	.insn	2, 0x0076
 26b:	5f327773          	csrrci	a4,0x5f3,4
 26f:	7270                	.insn	2, 0x7270
 271:	7365                	.insn	2, 0x7365
 273:	00646573          	csrrsi	a0,0x6,8
 277:	615f6173          	csrrsi	sp,htimedeltah,30
 27b:	6970                	.insn	2, 0x6970
 27d:	2f00                	.insn	2, 0x2f00
 27f:	6f68                	.insn	2, 0x6f68
 281:	656d                	.insn	2, 0x656d
 283:	7261682f          	.insn	4, 0x7261682f
 287:	6875                	.insn	2, 0x6875
 289:	6b69                	.insn	2, 0x6b69
 28b:	72502f6f          	jal	t5,31af <$d.5+0x19be>
 28f:	6172676f          	jal	a4,270a5 <$d.5+0x258b4>
 293:	2f6d                	.insn	2, 0x2f6d
 295:	5350                	.insn	2, 0x5350
 297:	56525f43          	.insn	4, 0x56525f43
 29b:	2f493233          	.insn	4, 0x2f493233
 29f:	5350                	.insn	2, 0x5350
 2a1:	4e4f2d43          	.insn	4, 0x4e4f2d43
 2a5:	2f45                	.insn	2, 0x2f45
 2a7:	74666f73          	csrrsi	t5,0x746,12
 2ab:	65726177          	.insn	4, 0x65726177
 2af:	00736f2f          	.insn	4, 0x00736f2f
 2b3:	7369                	.insn	2, 0x7369
 2b5:	705f 6972 656d      	.insn	6, 0x656d6972705f
 2bb:	6600                	.insn	2, 0x6600
 2bd:	7461                	.insn	2, 0x7461
 2bf:	6d5f3233          	.insn	4, 0x6d5f3233
 2c3:	6b61                	.insn	2, 0x6b61
 2c5:	5f65                	.insn	2, 0x5f65
 2c7:	726f6873          	csrrsi	a6,mhpmevent6h,30
 2cb:	6e74                	.insn	2, 0x6e74
 2cd:	6d61                	.insn	2, 0x6d61
 2cf:	0065                	.insn	2, 0x0065
 2d1:	6166                	.insn	2, 0x6166
 2d3:	5f74                	.insn	2, 0x5f74
 2d5:	657a6973          	csrrsi	s2,hviprio2h,20
 2d9:	7200                	.insn	2, 0x7200
 2db:	5f746f6f          	jal	t5,470d1 <$d.5+0x458e0>
 2df:	626c                	.insn	2, 0x626c
 2e1:	0061                	.insn	2, 0x0061
 2e3:	6c6c6163          	bltu	s8,t1,9a5 <$d.11+0x48>
 2e7:	6d5f 6369 615f      	.insn	6, 0x615f63696d5f
 2ed:	6970                	.insn	2, 0x6970
 2ef:	7600                	.insn	2, 0x7600
 2f1:	6c61                	.insn	2, 0x6c61
 2f3:	6575                	.insn	2, 0x6575
 2f5:	7600                	.insn	2, 0x7600
 2f7:	6c61                	.insn	2, 0x6c61
 2f9:	7300                	.insn	2, 0x7300
 2fb:	7379                	.insn	2, 0x7379
 2fd:	6c6c6163          	bltu	s8,t1,9bf <$d.11+0x62>
 301:	6100                	.insn	2, 0x6100
 303:	0030                	.insn	2, 0x0030
 305:	6c6c6163          	bltu	s8,t1,9c7 <$d.11+0x6a>
 309:	735f 5f64 6572      	.insn	6, 0x65725f64735f
 30f:	6461                	.insn	2, 0x6461
 311:	625f 6675 615f      	.insn	6, 0x615f6675625f
 317:	6970                	.insn	2, 0x6970
 319:	7300                	.insn	2, 0x7300
 31b:	6174                	.insn	2, 0x6174
 31d:	7472                	.insn	2, 0x7472
 31f:	6c5f 6162 7500      	.insn	6, 0x750061626c5f
 325:	736e                	.insn	2, 0x736e
 327:	6769                	.insn	2, 0x6769
 329:	656e                	.insn	2, 0x656e
 32b:	2064                	.insn	2, 0x2064
 32d:	6e69                	.insn	2, 0x6e69
 32f:	0074                	.insn	2, 0x0074
 331:	7261                	.insn	2, 0x7261
 333:	61006367          	.insn	4, 0x61006367
 337:	0034                	.insn	2, 0x0034
 339:	73003273          	csrrc	tp,mhpmevent16h,zero
 33d:	6f68                	.insn	2, 0x6f68
 33f:	7472                	.insn	2, 0x7472
 341:	616e                	.insn	2, 0x616e
 343:	656d                	.insn	2, 0x656d
 345:	6700                	.insn	2, 0x6700
 347:	7465                	.insn	2, 0x7465
 349:	72616863          	bltu	sp,t1,a79 <$d.5+0x61>
 34d:	5f00                	.insn	2, 0x5f00
 34f:	415f 5252 5941      	.insn	6, 0x59415252415f
 355:	535f 5a49 5f45      	.insn	6, 0x5f455a49535f
 35b:	5954                	.insn	2, 0x5954
 35d:	4550                	.insn	2, 0x4550
 35f:	5f5f 7000 7261      	.insn	6, 0x726170005f5f
 365:	685f6573          	csrrsi	a0,0x685,30
 369:	7865                	.insn	2, 0x7865
 36b:	7300                	.insn	2, 0x7300
 36d:	7274                	.insn	2, 0x7274
 36f:	00706d63          	bltu	zero,t2,389 <$d.6+0x101>
 373:	6c6c6163          	bltu	s8,t1,a35 <$d.5+0x1d>
 377:	735f 5f61 7061      	.insn	6, 0x70615f61735f
 37d:	0069                	.insn	2, 0x0069
 37f:	3161                	.insn	2, 0x3161
 381:	6e00                	.insn	2, 0x6e00
 383:	6d61                	.insn	2, 0x6d61
 385:	0065                	.insn	2, 0x0065
 387:	0064                	.insn	2, 0x0064
 389:	6975                	.insn	2, 0x6975
 38b:	746e                	.insn	2, 0x746e
 38d:	5f38                	.insn	2, 0x5f38
 38f:	0074                	.insn	2, 0x0074
 391:	5f5f 7562 6c69      	.insn	6, 0x6c6975625f5f
 397:	6974                	.insn	2, 0x6974
 399:	5f6e                	.insn	2, 0x5f6e
 39b:	6176                	.insn	2, 0x6176
 39d:	6c5f 7369 0074      	.insn	6, 0x007473696c5f
 3a3:	6166                	.insn	2, 0x6166
 3a5:	3374                	.insn	2, 0x3374
 3a7:	5f32                	.insn	2, 0x5f32
 3a9:	6f74                	.insn	2, 0x6f74
 3ab:	6375                	.insn	2, 0x6375
 3ad:	0068                	.insn	2, 0x0068
 3af:	7270                	.insn	2, 0x7270
 3b1:	7665                	.insn	2, 0x7665
 3b3:	735f 0077 616d      	.insn	6, 0x616d0077735f
 3b9:	7274                	.insn	2, 0x7274
 3bb:	7869                	.insn	2, 0x7869
 3bd:	425f 6500 646e      	.insn	6, 0x646e6500425f
 3c3:	6300                	.insn	2, 0x6300
 3c5:	5f6c                	.insn	2, 0x5f6c
 3c7:	6968                	.insn	2, 0x6968
 3c9:	7000                	.insn	2, 0x7000
 3cb:	5f6c6c6f          	jal	s8,c69c1 <$d.5+0xc51d0>
 3cf:	74697773          	csrrci	a4,0x746,18
 3d3:	615f6863          	bltu	t5,s5,9e3 <$d.11+0x86>
 3d7:	6970                	.insn	2, 0x6970
 3d9:	6100                	.insn	2, 0x6100
 3db:	6772                	.insn	2, 0x6772
 3dd:	0030                	.insn	2, 0x0030
 3df:	615f6473          	csrrsi	s0,htimedeltah,30
 3e3:	6970                	.insn	2, 0x6970
 3e5:	0032                	.insn	2, 0x0032
 3e7:	6166                	.insn	2, 0x6166
 3e9:	5f74                	.insn	2, 0x5f74
 3eb:	6e756f63          	bltu	a0,t2,ae9 <$d.5+0xd1>
 3ef:	0074                	.insn	2, 0x0074
 3f1:	7270                	.insn	2, 0x7270
 3f3:	6e69                	.insn	2, 0x6e69
 3f5:	6674                	.insn	2, 0x6674
 3f7:	7300                	.insn	2, 0x7300
 3f9:	5f64                	.insn	2, 0x5f64
 3fb:	74636573          	csrrsi	a0,0x746,6
 3ff:	6600726f          	jal	tp,7a5f <$d.5+0x626e>
 403:	746d                	.insn	2, 0x746d
 405:	7300                	.insn	2, 0x7300
 407:	6365                	.insn	2, 0x6365
 409:	6f74                	.insn	2, 0x6f74
 40b:	0072                	.insn	2, 0x0072
 40d:	63746567          	.insn	4, 0x63746567
 411:	6168                	.insn	2, 0x6168
 413:	5f72                	.insn	2, 0x5f72
 415:	6974                	.insn	2, 0x6974
 417:	656d                	.insn	2, 0x656d
 419:	0074756f          	jal	a0,47c1f <$d.5+0x4642e>
 41d:	7261                	.insn	2, 0x7261
 41f:	73003267          	.insn	4, 0x73003267
 423:	7a69                	.insn	2, 0x7a69
 425:	0065                	.insn	2, 0x0065
 427:	5f317773          	csrrci	a4,0x5f3,2
 42b:	7270                	.insn	2, 0x7270
 42d:	7365                	.insn	2, 0x7365
 42f:	00646573          	csrrsi	a0,0x6,8
 433:	006a                	.insn	2, 0x006a
 435:	0075                	.insn	2, 0x0075
 437:	74636573          	csrrsi	a0,0x746,6
 43b:	5f73726f          	jal	tp,38231 <$d.5+0x36a40>
 43f:	6570                	.insn	2, 0x6570
 441:	5f72                	.insn	2, 0x5f72
 443:	73756c63          	bltu	a0,s7,b7b <$d.5+0x163>
 447:	6574                	.insn	2, 0x6574
 449:	0072                	.insn	2, 0x0072
 44b:	7570                	.insn	2, 0x7570
 44d:	6374                	.insn	2, 0x6374
 44f:	6168                	.insn	2, 0x6168
 451:	0072                	.insn	2, 0x0072
 453:	6170                	.insn	2, 0x6170
 455:	7372                	.insn	2, 0x7372
 457:	5f65                	.insn	2, 0x5f65
 459:	3375                	.insn	2, 0x3375
 45b:	0032                	.insn	2, 0x0032
 45d:	7865                	.insn	2, 0x7865
 45f:	7469                	.insn	2, 0x7469
 461:	6300                	.insn	2, 0x6300
 463:	0068                	.insn	2, 0x0068
 465:	7261                	.insn	2, 0x7261
 467:	76003167          	.insn	4, 0x76003167
 46b:	7261                	.insn	2, 0x7261
 46d:	007367 	.3byte	0x007367

セクション .comment の逆アセンブル:

00000000 <$d.1>:
   0:	5500                	.insn	2, 0x5500
   2:	7562                	.insn	2, 0x7562
   4:	746e                	.insn	2, 0x746e
   6:	2075                	.insn	2, 0x2075
   8:	6e616c63          	bltu	sp,t1,700 <$d.3+0x19e>
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
   0:	3541                	.insn	2, 0x3541
   2:	0000                	.insn	2, 0x0000
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <$d.1+0x14>
   c:	0000002b          	.insn	4, 0x002b
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	.insn	2, 0x5f31
  1c:	326d                	.insn	2, 0x326d
  1e:	3070                	.insn	2, 0x3070
  20:	7a5f 6369 7273      	.insn	6, 0x727363697a5f
  26:	7032                	.insn	2, 0x7032
  28:	5f30                	.insn	2, 0x5f30
  2a:	697a                	.insn	2, 0x697a
  2c:	6566                	.insn	2, 0x6566
  2e:	636e                	.insn	2, 0x636e
  30:	6965                	.insn	2, 0x6965
  32:	7032                	.insn	2, 0x7032
  34:	0030                	.insn	2, 0x0030

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
  20:	0990                	.insn	2, 0x0990
  22:	0000                	.insn	2, 0x0000
  24:	0e44                	.insn	2, 0x0e44
  26:	0290                	.insn	2, 0x0290
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
  4c:	09ac                	.insn	2, 0x09ac
  4e:	0040                	.insn	2, 0x0040
  50:	00cc                	.insn	2, 0x00cc
  52:	0000                	.insn	2, 0x0000
  54:	001c                	.insn	2, 0x001c
  56:	0000                	.insn	2, 0x0000
  58:	0000                	.insn	2, 0x0000
  5a:	0000                	.insn	2, 0x0000
  5c:	0a78                	.insn	2, 0x0a78
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
  90:	0b34                	.insn	2, 0x0b34
  92:	0040                	.insn	2, 0x0040
  94:	0018                	.insn	2, 0x0018
  96:	0000                	.insn	2, 0x0000
  98:	0014                	.insn	2, 0x0014
  9a:	0000                	.insn	2, 0x0000
  9c:	0074                	.insn	2, 0x0074
  9e:	0000                	.insn	2, 0x0000
  a0:	0b4c                	.insn	2, 0x0b4c
  a2:	0040                	.insn	2, 0x0040
  a4:	035c                	.insn	2, 0x035c
  a6:	0000                	.insn	2, 0x0000
  a8:	0e4c                	.insn	2, 0x0e4c
  aa:	c090                	.insn	2, 0xc090
  ac:	0001                	.insn	2, 0x0001
  ae:	0000                	.insn	2, 0x0000
  b0:	000c                	.insn	2, 0x000c
  b2:	0000                	.insn	2, 0x0000
  b4:	0074                	.insn	2, 0x0074
  b6:	0000                	.insn	2, 0x0000
  b8:	0ea8                	.insn	2, 0x0ea8
  ba:	0040                	.insn	2, 0x0040
  bc:	0014                	.insn	2, 0x0014
  be:	0000                	.insn	2, 0x0000
  c0:	000c                	.insn	2, 0x000c
  c2:	0000                	.insn	2, 0x0000
  c4:	0074                	.insn	2, 0x0074
  c6:	0000                	.insn	2, 0x0000
  c8:	0ebc                	.insn	2, 0x0ebc
  ca:	0040                	.insn	2, 0x0040
  cc:	0014                	.insn	2, 0x0014
  ce:	0000                	.insn	2, 0x0000
  d0:	000c                	.insn	2, 0x000c
  d2:	0000                	.insn	2, 0x0000
  d4:	0074                	.insn	2, 0x0074
  d6:	0000                	.insn	2, 0x0000
  d8:	0ed0                	.insn	2, 0x0ed0
  da:	0040                	.insn	2, 0x0040
  dc:	000c                	.insn	2, 0x000c
  de:	0000                	.insn	2, 0x0000
  e0:	0018                	.insn	2, 0x0018
  e2:	0000                	.insn	2, 0x0000
  e4:	0074                	.insn	2, 0x0074
  e6:	0000                	.insn	2, 0x0000
  e8:	0edc                	.insn	2, 0x0edc
  ea:	0040                	.insn	2, 0x0040
  ec:	00ac                	.insn	2, 0x00ac
  ee:	0000                	.insn	2, 0x0000
  f0:	0e44                	.insn	2, 0x0e44
  f2:	4c20                	.insn	2, 0x4c20
  f4:	0181                	.insn	2, 0x0181
  f6:	0288                	.insn	2, 0x0288
  f8:	0389                	.insn	2, 0x0389
  fa:	0000                	.insn	2, 0x0000
  fc:	001c                	.insn	2, 0x001c
  fe:	0000                	.insn	2, 0x0000
 100:	0074                	.insn	2, 0x0074
 102:	0000                	.insn	2, 0x0000
 104:	0f88                	.insn	2, 0x0f88
 106:	0040                	.insn	2, 0x0040
 108:	02bc                	.insn	2, 0x02bc
 10a:	0000                	.insn	2, 0x0000
 10c:	0e44                	.insn	2, 0x0e44
 10e:	5450                	.insn	2, 0x5450
 110:	0988                	.insn	2, 0x0988
 112:	0a89                	.insn	2, 0x0a89
 114:	0b92                	.insn	2, 0x0b92
 116:	0d940c93          	addi	s9,s0,217
 11a:	0000                	.insn	2, 0x0000
 11c:	000c                	.insn	2, 0x000c
 11e:	0000                	.insn	2, 0x0000
 120:	0074                	.insn	2, 0x0074
 122:	0000                	.insn	2, 0x0000
 124:	1244                	.insn	2, 0x1244
 126:	0040                	.insn	2, 0x0040
 128:	000c                	.insn	2, 0x000c
 12a:	0000                	.insn	2, 0x0000
 12c:	000c                	.insn	2, 0x000c
 12e:	0000                	.insn	2, 0x0000
 130:	0074                	.insn	2, 0x0074
 132:	0000                	.insn	2, 0x0000
 134:	1250                	.insn	2, 0x1250
 136:	0040                	.insn	2, 0x0040
 138:	000c                	.insn	2, 0x000c
 13a:	0000                	.insn	2, 0x0000
 13c:	000c                	.insn	2, 0x000c
 13e:	0000                	.insn	2, 0x0000
 140:	0074                	.insn	2, 0x0074
 142:	0000                	.insn	2, 0x0000
 144:	125c                	.insn	2, 0x125c
 146:	0040                	.insn	2, 0x0040
 148:	000c                	.insn	2, 0x000c
 14a:	0000                	.insn	2, 0x0000
 14c:	000c                	.insn	2, 0x000c
 14e:	0000                	.insn	2, 0x0000
 150:	0074                	.insn	2, 0x0074
 152:	0000                	.insn	2, 0x0000
 154:	1268                	.insn	2, 0x1268
 156:	0040                	.insn	2, 0x0040
 158:	000c                	.insn	2, 0x000c
 15a:	0000                	.insn	2, 0x0000
 15c:	000c                	.insn	2, 0x000c
 15e:	0000                	.insn	2, 0x0000
 160:	0074                	.insn	2, 0x0074
 162:	0000                	.insn	2, 0x0000
 164:	1274                	.insn	2, 0x1274
 166:	0040                	.insn	2, 0x0040
 168:	000c                	.insn	2, 0x000c
 16a:	0000                	.insn	2, 0x0000
 16c:	000c                	.insn	2, 0x000c
 16e:	0000                	.insn	2, 0x0000
 170:	0074                	.insn	2, 0x0074
 172:	0000                	.insn	2, 0x0000
 174:	1280                	.insn	2, 0x1280
 176:	0040                	.insn	2, 0x0040
 178:	0034                	.insn	2, 0x0034
 17a:	0000                	.insn	2, 0x0000
 17c:	000c                	.insn	2, 0x000c
 17e:	0000                	.insn	2, 0x0000
 180:	0074                	.insn	2, 0x0074
 182:	0000                	.insn	2, 0x0000
 184:	12b4                	.insn	2, 0x12b4
 186:	0040                	.insn	2, 0x0040
 188:	0040                	.insn	2, 0x0040
 18a:	0000                	.insn	2, 0x0000
 18c:	000c                	.insn	2, 0x000c
 18e:	0000                	.insn	2, 0x0000
 190:	0074                	.insn	2, 0x0074
 192:	0000                	.insn	2, 0x0000
 194:	12f4                	.insn	2, 0x12f4
 196:	0040                	.insn	2, 0x0040
 198:	00a8                	.insn	2, 0x00a8
 19a:	0000                	.insn	2, 0x0000
 19c:	000c                	.insn	2, 0x000c
 19e:	0000                	.insn	2, 0x0000
 1a0:	0074                	.insn	2, 0x0074
 1a2:	0000                	.insn	2, 0x0000
 1a4:	139c                	.insn	2, 0x139c
 1a6:	0040                	.insn	2, 0x0040
 1a8:	0040                	.insn	2, 0x0040
 1aa:	0000                	.insn	2, 0x0000
 1ac:	000c                	.insn	2, 0x000c
 1ae:	0000                	.insn	2, 0x0000
 1b0:	0074                	.insn	2, 0x0074
 1b2:	0000                	.insn	2, 0x0000
 1b4:	13dc                	.insn	2, 0x13dc
 1b6:	0040                	.insn	2, 0x0040
 1b8:	0014                	.insn	2, 0x0014
 1ba:	0000                	.insn	2, 0x0000
 1bc:	000c                	.insn	2, 0x000c
 1be:	0000                	.insn	2, 0x0000
 1c0:	0074                	.insn	2, 0x0074
 1c2:	0000                	.insn	2, 0x0000
 1c4:	13f0                	.insn	2, 0x13f0
 1c6:	0040                	.insn	2, 0x0040
 1c8:	0014                	.insn	2, 0x0014
 1ca:	0000                	.insn	2, 0x0000
 1cc:	000c                	.insn	2, 0x000c
 1ce:	0000                	.insn	2, 0x0000
 1d0:	0074                	.insn	2, 0x0074
 1d2:	0000                	.insn	2, 0x0000
 1d4:	1404                	.insn	2, 0x1404
 1d6:	0040                	.insn	2, 0x0040
 1d8:	000c                	.insn	2, 0x000c
 1da:	0000                	.insn	2, 0x0000
 1dc:	000c                	.insn	2, 0x000c
 1de:	0000                	.insn	2, 0x0000
 1e0:	0074                	.insn	2, 0x0074
 1e2:	0000                	.insn	2, 0x0000
 1e4:	1410                	.insn	2, 0x1410
 1e6:	0040                	.insn	2, 0x0040
 1e8:	000c                	.insn	2, 0x000c
 1ea:	0000                	.insn	2, 0x0000
 1ec:	000c                	.insn	2, 0x000c
 1ee:	0000                	.insn	2, 0x0000
 1f0:	0074                	.insn	2, 0x0074
 1f2:	0000                	.insn	2, 0x0000
 1f4:	0000                	.insn	2, 0x0000
 1f6:	0040                	.insn	2, 0x0040
 1f8:	001c                	.insn	2, 0x001c
	...

000001fc <$d.10>:
 1fc:	0010                	.insn	2, 0x0010
 1fe:	0000                	.insn	2, 0x0000
 200:	ffff                	.insn	2, 0xffff
 202:	ffff                	.insn	2, 0xffff
 204:	0004                	.insn	2, 0x0004
 206:	0004                	.insn	2, 0x0004
 208:	7c01                	.insn	2, 0x7c01
 20a:	0c01                	.insn	2, 0x0c01
 20c:	0002                	.insn	2, 0x0002
 20e:	0000                	.insn	2, 0x0000
 210:	0018                	.insn	2, 0x0018
 212:	0000                	.insn	2, 0x0000
 214:	01fc                	.insn	2, 0x01fc
 216:	0000                	.insn	2, 0x0000
 218:	141c                	.insn	2, 0x141c
 21a:	0040                	.insn	2, 0x0040
 21c:	00ec                	.insn	2, 0x00ec
 21e:	0000                	.insn	2, 0x0000
 220:	0e44                	.insn	2, 0x0e44
 222:	04a0                	.insn	2, 0x04a0
 224:	814c                	.insn	2, 0x814c
 226:	8801                	.insn	2, 0x8801
 228:	8902                	.insn	2, 0x8902
 22a:	00180003          	lb	zero,1(a6) # 41da8 <$d.5+0x405b7>
 22e:	0000                	.insn	2, 0x0000
 230:	01fc                	.insn	2, 0x01fc
 232:	0000                	.insn	2, 0x0000
 234:	1508                	.insn	2, 0x1508
 236:	0040                	.insn	2, 0x0040
 238:	0128                	.insn	2, 0x0128
 23a:	0000                	.insn	2, 0x0000
 23c:	0e44                	.insn	2, 0x0e44
 23e:	5010                	.insn	2, 0x5010
 240:	0181                	.insn	2, 0x0181
 242:	0288                	.insn	2, 0x0288
 244:	0389                	.insn	2, 0x0389
 246:	0492                	.insn	2, 0x0492
 248:	0028                	.insn	2, 0x0028
 24a:	0000                	.insn	2, 0x0000
 24c:	01fc                	.insn	2, 0x01fc
 24e:	0000                	.insn	2, 0x0000
 250:	1630                	.insn	2, 0x1630
 252:	0040                	.insn	2, 0x0040
 254:	02a4                	.insn	2, 0x02a4
 256:	0000                	.insn	2, 0x0000
 258:	0e44                	.insn	2, 0x0e44
 25a:	7040                	.insn	2, 0x7040
 25c:	0181                	.insn	2, 0x0181
 25e:	0288                	.insn	2, 0x0288
 260:	0389                	.insn	2, 0x0389
 262:	0492                	.insn	2, 0x0492
 264:	06940593          	addi	a1,s0,105
 268:	0795                	.insn	2, 0x0795
 26a:	0896                	.insn	2, 0x0896
 26c:	0a980997          	auipc	s3,0xa980
 270:	0b99                	.insn	2, 0x0b99
 272:	0c9a                	.insn	2, 0x0c9a
 274:	000c                	.insn	2, 0x000c
 276:	0000                	.insn	2, 0x0000
 278:	01fc                	.insn	2, 0x01fc
 27a:	0000                	.insn	2, 0x0000
 27c:	18d4                	.insn	2, 0x18d4
 27e:	0040                	.insn	2, 0x0040
 280:	0020                	.insn	2, 0x0020
 282:	0000                	.insn	2, 0x0000
 284:	0024                	.insn	2, 0x0024
 286:	0000                	.insn	2, 0x0000
 288:	01fc                	.insn	2, 0x01fc
 28a:	0000                	.insn	2, 0x0000
 28c:	18f4                	.insn	2, 0x18f4
 28e:	0040                	.insn	2, 0x0040
 290:	028c                	.insn	2, 0x028c
 292:	0000                	.insn	2, 0x0000
 294:	0e44                	.insn	2, 0x0e44
 296:	6830                	.insn	2, 0x6830
 298:	0181                	.insn	2, 0x0181
 29a:	0288                	.insn	2, 0x0288
 29c:	0389                	.insn	2, 0x0389
 29e:	0492                	.insn	2, 0x0492
 2a0:	06940593          	addi	a1,s0,105
 2a4:	0795                	.insn	2, 0x0795
 2a6:	0896                	.insn	2, 0x0896
 2a8:	0a980997          	auipc	s3,0xa980
 2ac:	001c                	.insn	2, 0x001c
 2ae:	0000                	.insn	2, 0x0000
 2b0:	01fc                	.insn	2, 0x01fc
 2b2:	0000                	.insn	2, 0x0000
 2b4:	1b80                	.insn	2, 0x1b80
 2b6:	0040                	.insn	2, 0x0040
 2b8:	0434                	.insn	2, 0x0434
 2ba:	0000                	.insn	2, 0x0000
 2bc:	0e44                	.insn	2, 0x0e44
 2be:	5420                	.insn	2, 0x5420
 2c0:	0181                	.insn	2, 0x0181
 2c2:	0288                	.insn	2, 0x0288
 2c4:	0389                	.insn	2, 0x0389
 2c6:	0492                	.insn	2, 0x0492
 2c8:	00000593          	li	a1,0

セクション .debug_line の逆アセンブル:

00000000 <$d.10>:
       0:	0959                	.insn	2, 0x0959
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
      60:	0191                	.insn	2, 0x0191
      62:	f409                	.insn	2, 0xf409
      64:	0101                	.insn	2, 0x0101
      66:	0306                	.insn	2, 0x0306
      68:	08097eef          	jal	t4,970e8 <$d.5+0x958f7>
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
     156:	0900c803          	lbu	a6,144(ra)
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
     1b2:	00080963          	beqz	a6,1c4 <$d.6+0x53>
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
     1f0:	09018103          	lb	sp,144(gp)
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
     2fa:	0004090b          	.insn	4, 0x0004090b
     2fe:	0601                	.insn	2, 0x0601
     300:	10090003          	lb	zero,256(s2)
     304:	0100                	.insn	2, 0x0100
     306:	0306                	.insn	2, 0x0306
     308:	090a                	.insn	2, 0x090a
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
     324:	090e                	.insn	2, 0x090e
     326:	0004                	.insn	2, 0x0004
     328:	0601                	.insn	2, 0x0601
     32a:	10090003          	lb	zero,256(s2)
     32e:	0100                	.insn	2, 0x0100
     330:	0306                	.insn	2, 0x0306
     332:	0905                	.insn	2, 0x0905
     334:	0004                	.insn	2, 0x0004
     336:	0601                	.insn	2, 0x0601
     338:	10090003          	lb	zero,256(s2)
     33c:	0100                	.insn	2, 0x0100
     33e:	0306                	.insn	2, 0x0306
     340:	090a                	.insn	2, 0x090a
     342:	0004                	.insn	2, 0x0004
     344:	0601                	.insn	2, 0x0601
     346:	10090003          	lb	zero,256(s2)
     34a:	0100                	.insn	2, 0x0100
     34c:	0306                	.insn	2, 0x0306
     34e:	090c                	.insn	2, 0x090c
     350:	0004                	.insn	2, 0x0004
     352:	0601                	.insn	2, 0x0601
     354:	10090003          	lb	zero,256(s2)
     358:	0100                	.insn	2, 0x0100
     35a:	0306                	.insn	2, 0x0306
     35c:	0004090b          	.insn	4, 0x0004090b
     360:	0501                	.insn	2, 0x0501
     362:	0631                	.insn	2, 0x0631
     364:	10090003          	lb	zero,256(s2)
     368:	0100                	.insn	2, 0x0100
     36a:	1405                	.insn	2, 0x1405
     36c:	0306                	.insn	2, 0x0306
     36e:	0901                	.insn	2, 0x0901
     370:	0004                	.insn	2, 0x0004
     372:	0501                	.insn	2, 0x0501
     374:	0631                	.insn	2, 0x0631
     376:	10090003          	lb	zero,256(s2)
     37a:	0100                	.insn	2, 0x0100
     37c:	1405                	.insn	2, 0x1405
     37e:	0306                	.insn	2, 0x0306
     380:	0901                	.insn	2, 0x0901
     382:	0004                	.insn	2, 0x0004
     384:	0301                	.insn	2, 0x0301
     386:	097e                	.insn	2, 0x097e
     388:	0010                	.insn	2, 0x0010
     38a:	0601                	.insn	2, 0x0601
     38c:	097dd003          	lhu	zero,151(s11)
     390:	0004                	.insn	2, 0x0004
     392:	0501                	.insn	2, 0x0501
     394:	060d                	.insn	2, 0x060d
     396:	0902b603          	.insn	4, 0x0902b603
     39a:	0004                	.insn	2, 0x0004
     39c:	0601                	.insn	2, 0x0601
     39e:	097dca03          	lbu	s4,151(s11)
     3a2:	000c                	.insn	2, 0x000c
     3a4:	0501                	.insn	2, 0x0501
     3a6:	0611                	.insn	2, 0x0611
     3a8:	09019a03          	lh	s4,144(gp)
     3ac:	0008                	.insn	2, 0x0008
     3ae:	0501                	.insn	2, 0x0501
     3b0:	031f 0901 0004      	.insn	6, 0x00040901031f
     3b6:	0501                	.insn	2, 0x0501
     3b8:	0305                	.insn	2, 0x0305
     3ba:	040901b7          	lui	gp,0x4090
     3be:	0100                	.insn	2, 0x0100
     3c0:	0306                	.insn	2, 0x0306
     3c2:	7dae                	.insn	2, 0x7dae
     3c4:	0409                	.insn	2, 0x0409
     3c6:	0100                	.insn	2, 0x0100
     3c8:	0902d203          	lhu	tp,144(t0)
     3cc:	000c                	.insn	2, 0x000c
     3ce:	0501                	.insn	2, 0x0501
     3d0:	030c                	.insn	2, 0x030c
     3d2:	0900                	.insn	2, 0x0900
     3d4:	0004                	.insn	2, 0x0004
     3d6:	0501                	.insn	2, 0x0501
     3d8:	0316                	.insn	2, 0x0316
     3da:	0900                	.insn	2, 0x0900
     3dc:	0004                	.insn	2, 0x0004
     3de:	0501                	.insn	2, 0x0501
     3e0:	0619                	.insn	2, 0x0619
     3e2:	10090303          	lb	t1,256(s2)
     3e6:	0100                	.insn	2, 0x0100
     3e8:	2505                	.insn	2, 0x2505
     3ea:	0306                	.insn	2, 0x0306
     3ec:	0900                	.insn	2, 0x0900
     3ee:	0004                	.insn	2, 0x0004
     3f0:	0501                	.insn	2, 0x0501
     3f2:	060a                	.insn	2, 0x060a
     3f4:	0c090103          	lb	sp,192(s2)
     3f8:	0100                	.insn	2, 0x0100
     3fa:	0306                	.insn	2, 0x0306
     3fc:	7daa                	.insn	2, 0x7daa
     3fe:	0409                	.insn	2, 0x0409
     400:	0100                	.insn	2, 0x0100
     402:	1105                	.insn	2, 0x1105
     404:	0306                	.insn	2, 0x0306
     406:	080901b3          	.insn	4, 0x080901b3
     40a:	0100                	.insn	2, 0x0100
     40c:	2105                	.insn	2, 0x2105
     40e:	04090103          	lb	sp,64(s2)
     412:	0100                	.insn	2, 0x0100
     414:	1705                	.insn	2, 0x1705
     416:	0306                	.insn	2, 0x0306
     418:	0900                	.insn	2, 0x0900
     41a:	0004                	.insn	2, 0x0004
     41c:	0301                	.insn	2, 0x0301
     41e:	7ecc                	.insn	2, 0x7ecc
     420:	0c09                	.insn	2, 0x0c09
     422:	0100                	.insn	2, 0x0100
     424:	1505                	.insn	2, 0x1505
     426:	0306                	.insn	2, 0x0306
     428:	01b5                	.insn	2, 0x01b5
     42a:	0809                	.insn	2, 0x0809
     42c:	0100                	.insn	2, 0x0100
     42e:	0306                	.insn	2, 0x0306
     430:	08097ecb          	.insn	4, 0x08097ecb
     434:	0100                	.insn	2, 0x0100
     436:	0d05                	.insn	2, 0x0d05
     438:	0306                	.insn	2, 0x0306
     43a:	01a6                	.insn	2, 0x01a6
     43c:	0809                	.insn	2, 0x0809
     43e:	0100                	.insn	2, 0x0100
     440:	0306                	.insn	2, 0x0306
     442:	7eda                	.insn	2, 0x7eda
     444:	0809                	.insn	2, 0x0809
     446:	0100                	.insn	2, 0x0100
     448:	0905                	.insn	2, 0x0905
     44a:	0306                	.insn	2, 0x0306
     44c:	02d6                	.insn	2, 0x02d6
     44e:	0809                	.insn	2, 0x0809
     450:	0100                	.insn	2, 0x0100
     452:	0306                	.insn	2, 0x0306
     454:	7daa                	.insn	2, 0x7daa
     456:	0409                	.insn	2, 0x0409
     458:	0100                	.insn	2, 0x0100
     45a:	1105                	.insn	2, 0x1105
     45c:	0306                	.insn	2, 0x0306
     45e:	01c4                	.insn	2, 0x01c4
     460:	0809                	.insn	2, 0x0809
     462:	0100                	.insn	2, 0x0100
     464:	2805                	.insn	2, 0x2805
     466:	04090103          	lb	sp,64(s2)
     46a:	0100                	.insn	2, 0x0100
     46c:	1e05                	.insn	2, 0x1e05
     46e:	0306                	.insn	2, 0x0306
     470:	0900                	.insn	2, 0x0900
     472:	0004                	.insn	2, 0x0004
     474:	0301                	.insn	2, 0x0301
     476:	0c097ebb          	.insn	4, 0x0c097ebb
     47a:	0100                	.insn	2, 0x0100
     47c:	1505                	.insn	2, 0x1505
     47e:	0306                	.insn	2, 0x0306
     480:	01c6                	.insn	2, 0x01c6
     482:	0409                	.insn	2, 0x0409
     484:	0100                	.insn	2, 0x0100
     486:	0306                	.insn	2, 0x0306
     488:	7eba                	.insn	2, 0x7eba
     48a:	0c09                	.insn	2, 0x0c09
     48c:	0100                	.insn	2, 0x0100
     48e:	0d05                	.insn	2, 0x0d05
     490:	0306                	.insn	2, 0x0306
     492:	01ba                	.insn	2, 0x01ba
     494:	0409                	.insn	2, 0x0409
     496:	0100                	.insn	2, 0x0100
     498:	0306                	.insn	2, 0x0306
     49a:	7ec6                	.insn	2, 0x7ec6
     49c:	0c09                	.insn	2, 0x0c09
     49e:	0100                	.insn	2, 0x0100
     4a0:	1105                	.insn	2, 0x1105
     4a2:	0306                	.insn	2, 0x0306
     4a4:	01d0                	.insn	2, 0x01d0
     4a6:	0809                	.insn	2, 0x0809
     4a8:	0100                	.insn	2, 0x0100
     4aa:	2805                	.insn	2, 0x2805
     4ac:	04090503          	lb	a0,64(s2)
     4b0:	0100                	.insn	2, 0x0100
     4b2:	1e05                	.insn	2, 0x1e05
     4b4:	0306                	.insn	2, 0x0306
     4b6:	0900                	.insn	2, 0x0900
     4b8:	0004                	.insn	2, 0x0004
     4ba:	0501                	.insn	2, 0x0501
     4bc:	060d                	.insn	2, 0x060d
     4be:	08090103          	lb	sp,128(s2)
     4c2:	0100                	.insn	2, 0x0100
     4c4:	0306                	.insn	2, 0x0306
     4c6:	7eaa                	.insn	2, 0x7eaa
     4c8:	0809                	.insn	2, 0x0809
     4ca:	0100                	.insn	2, 0x0100
     4cc:	1605                	.insn	2, 0x1605
     4ce:	0306                	.insn	2, 0x0306
     4d0:	100902db          	.insn	4, 0x100902db
     4d4:	0100                	.insn	2, 0x0100
     4d6:	0005                	.insn	2, 0x0005
     4d8:	0306                	.insn	2, 0x0306
     4da:	7da5                	.insn	2, 0x7da5
     4dc:	0809                	.insn	2, 0x0809
     4de:	0100                	.insn	2, 0x0100
     4e0:	0c05                	.insn	2, 0x0c05
     4e2:	0306                	.insn	2, 0x0306
     4e4:	02d8                	.insn	2, 0x02d8
     4e6:	0409                	.insn	2, 0x0409
     4e8:	0100                	.insn	2, 0x0100
     4ea:	0005                	.insn	2, 0x0005
     4ec:	0306                	.insn	2, 0x0306
     4ee:	7da8                	.insn	2, 0x7da8
     4f0:	0409                	.insn	2, 0x0409
     4f2:	0100                	.insn	2, 0x0100
     4f4:	1005                	.insn	2, 0x1005
     4f6:	0306                	.insn	2, 0x0306
     4f8:	02df 0409 0100      	.insn	6, 0x0100040902df
     4fe:	1605                	.insn	2, 0x1605
     500:	0306                	.insn	2, 0x0306
     502:	0900                	.insn	2, 0x0900
     504:	0004                	.insn	2, 0x0004
     506:	0501                	.insn	2, 0x0501
     508:	0605                	.insn	2, 0x0605
     50a:	04097903          	.insn	4, 0x04097903
     50e:	0100                	.insn	2, 0x0100
     510:	0306                	.insn	2, 0x0306
     512:	7da8                	.insn	2, 0x7da8
     514:	0409                	.insn	2, 0x0409
     516:	0100                	.insn	2, 0x0100
     518:	1605                	.insn	2, 0x1605
     51a:	0306                	.insn	2, 0x0306
     51c:	040902db          	.insn	4, 0x040902db
     520:	0100                	.insn	2, 0x0100
     522:	1b05                	.insn	2, 0x1b05
     524:	10090103          	lb	sp,256(s2)
     528:	0100                	.insn	2, 0x0100
     52a:	10090103          	lb	sp,256(s2)
     52e:	0100                	.insn	2, 0x0100
     530:	1105                	.insn	2, 0x1105
     532:	097ec303          	lbu	t1,151(t4)
     536:	0010                	.insn	2, 0x0010
     538:	0601                	.insn	2, 0x0601
     53a:	097ee003          	.insn	4, 0x097ee003
     53e:	0008                	.insn	2, 0x0008
     540:	0501                	.insn	2, 0x0501
     542:	060d                	.insn	2, 0x060d
     544:	0901a603          	lw	a2,144(gp) # 4090090 <USER_MAX+0x3b90090>
     548:	0004                	.insn	2, 0x0004
     54a:	0601                	.insn	2, 0x0601
     54c:	097eda03          	lhu	s4,151(t4)
     550:	0008                	.insn	2, 0x0008
     552:	0501                	.insn	2, 0x0501
     554:	061f a103 0901      	.insn	6, 0x0901a103061f
     55a:	0004                	.insn	2, 0x0004
     55c:	0501                	.insn	2, 0x0501
     55e:	0305                	.insn	2, 0x0305
     560:	01b1                	.insn	2, 0x01b1
     562:	0409                	.insn	2, 0x0409
     564:	0100                	.insn	2, 0x0100
     566:	0306                	.insn	2, 0x0306
     568:	7dae                	.insn	2, 0x7dae
     56a:	0409                	.insn	2, 0x0409
     56c:	0100                	.insn	2, 0x0100
     56e:	0902d203          	lhu	tp,144(t0)
     572:	0004                	.insn	2, 0x0004
     574:	0501                	.insn	2, 0x0501
     576:	030c                	.insn	2, 0x030c
     578:	0900                	.insn	2, 0x0900
     57a:	0004                	.insn	2, 0x0004
     57c:	0501                	.insn	2, 0x0501
     57e:	0316                	.insn	2, 0x0316
     580:	0900                	.insn	2, 0x0900
     582:	0004                	.insn	2, 0x0004
     584:	0501                	.insn	2, 0x0501
     586:	0619                	.insn	2, 0x0619
     588:	10090303          	lb	t1,256(s2)
     58c:	0100                	.insn	2, 0x0100
     58e:	2505                	.insn	2, 0x2505
     590:	0306                	.insn	2, 0x0306
     592:	0900                	.insn	2, 0x0900
     594:	0004                	.insn	2, 0x0004
     596:	0501                	.insn	2, 0x0501
     598:	060a                	.insn	2, 0x060a
     59a:	10090103          	lb	sp,256(s2)
     59e:	0100                	.insn	2, 0x0100
     5a0:	0905                	.insn	2, 0x0905
     5a2:	0306                	.insn	2, 0x0306
     5a4:	0900                	.insn	2, 0x0900
     5a6:	0004                	.insn	2, 0x0004
     5a8:	0301                	.insn	2, 0x0301
     5aa:	7daa                	.insn	2, 0x7daa
     5ac:	0809                	.insn	2, 0x0809
     5ae:	0100                	.insn	2, 0x0100
     5b0:	0902d603          	lhu	a2,144(t0)
     5b4:	0008                	.insn	2, 0x0008
     5b6:	0301                	.insn	2, 0x0301
     5b8:	7daa                	.insn	2, 0x7daa
     5ba:	0809                	.insn	2, 0x0809
     5bc:	0100                	.insn	2, 0x0100
     5be:	1105                	.insn	2, 0x1105
     5c0:	0306                	.insn	2, 0x0306
     5c2:	01da                	.insn	2, 0x01da
     5c4:	0409                	.insn	2, 0x0409
     5c6:	0100                	.insn	2, 0x0100
     5c8:	2805                	.insn	2, 0x2805
     5ca:	04090503          	lb	a0,64(s2)
     5ce:	0100                	.insn	2, 0x0100
     5d0:	1e05                	.insn	2, 0x1e05
     5d2:	0306                	.insn	2, 0x0306
     5d4:	0900                	.insn	2, 0x0900
     5d6:	0004                	.insn	2, 0x0004
     5d8:	0501                	.insn	2, 0x0501
     5da:	060d                	.insn	2, 0x060d
     5dc:	08090203          	lb	tp,128(s2)
     5e0:	0100                	.insn	2, 0x0100
     5e2:	0306                	.insn	2, 0x0306
     5e4:	7e9f 0809 0100      	.insn	6, 0x010008097e9f
     5ea:	0306                	.insn	2, 0x0306
     5ec:	01cc                	.insn	2, 0x01cc
     5ee:	0809                	.insn	2, 0x0809
     5f0:	0100                	.insn	2, 0x0100
     5f2:	0306                	.insn	2, 0x0306
     5f4:	7eb4                	.insn	2, 0x7eb4
     5f6:	0c09                	.insn	2, 0x0c09
     5f8:	0100                	.insn	2, 0x0100
     5fa:	1105                	.insn	2, 0x1105
     5fc:	0306                	.insn	2, 0x0306
     5fe:	01e5                	.insn	2, 0x01e5
     600:	0809                	.insn	2, 0x0809
     602:	0100                	.insn	2, 0x0100
     604:	2c05                	.insn	2, 0x2c05
     606:	04090503          	lb	a0,64(s2)
     60a:	0100                	.insn	2, 0x0100
     60c:	2205                	.insn	2, 0x2205
     60e:	0306                	.insn	2, 0x0306
     610:	0900                	.insn	2, 0x0900
     612:	0004                	.insn	2, 0x0004
     614:	0501                	.insn	2, 0x0501
     616:	060d                	.insn	2, 0x060d
     618:	08090103          	lb	sp,128(s2)
     61c:	0100                	.insn	2, 0x0100
     61e:	0306                	.insn	2, 0x0306
     620:	7e95                	.insn	2, 0x7e95
     622:	0809                	.insn	2, 0x0809
     624:	0100                	.insn	2, 0x0100
     626:	1605                	.insn	2, 0x1605
     628:	0306                	.insn	2, 0x0306
     62a:	100902db          	.insn	4, 0x100902db
     62e:	0100                	.insn	2, 0x0100
     630:	0005                	.insn	2, 0x0005
     632:	0306                	.insn	2, 0x0306
     634:	7da5                	.insn	2, 0x7da5
     636:	0809                	.insn	2, 0x0809
     638:	0100                	.insn	2, 0x0100
     63a:	0c05                	.insn	2, 0x0c05
     63c:	0306                	.insn	2, 0x0306
     63e:	02d8                	.insn	2, 0x02d8
     640:	0409                	.insn	2, 0x0409
     642:	0100                	.insn	2, 0x0100
     644:	0005                	.insn	2, 0x0005
     646:	0306                	.insn	2, 0x0306
     648:	7da8                	.insn	2, 0x7da8
     64a:	0409                	.insn	2, 0x0409
     64c:	0100                	.insn	2, 0x0100
     64e:	1005                	.insn	2, 0x1005
     650:	0306                	.insn	2, 0x0306
     652:	02df 0409 0100      	.insn	6, 0x0100040902df
     658:	1605                	.insn	2, 0x1605
     65a:	0306                	.insn	2, 0x0306
     65c:	0900                	.insn	2, 0x0900
     65e:	0004                	.insn	2, 0x0004
     660:	0501                	.insn	2, 0x0501
     662:	0605                	.insn	2, 0x0605
     664:	04097903          	.insn	4, 0x04097903
     668:	0100                	.insn	2, 0x0100
     66a:	1605                	.insn	2, 0x1605
     66c:	08090303          	lb	t1,128(s2)
     670:	0100                	.insn	2, 0x0100
     672:	1b05                	.insn	2, 0x1b05
     674:	10090103          	lb	sp,256(s2)
     678:	0100                	.insn	2, 0x0100
     67a:	10090103          	lb	sp,256(s2)
     67e:	0100                	.insn	2, 0x0100
     680:	0d05                	.insn	2, 0x0d05
     682:	097ec903          	lbu	s2,151(t4)
     686:	0010                	.insn	2, 0x0010
     688:	0601                	.insn	2, 0x0601
     68a:	097eda03          	lhu	s4,151(t4)
     68e:	0008                	.insn	2, 0x0008
     690:	0501                	.insn	2, 0x0501
     692:	0611                	.insn	2, 0x0611
     694:	0901ef03          	.insn	4, 0x0901ef03
     698:	0008                	.insn	2, 0x0008
     69a:	0501                	.insn	2, 0x0501
     69c:	032c                	.insn	2, 0x032c
     69e:	0905                	.insn	2, 0x0905
     6a0:	0004                	.insn	2, 0x0004
     6a2:	0501                	.insn	2, 0x0501
     6a4:	0622                	.insn	2, 0x0622
     6a6:	04090003          	lb	zero,64(s2)
     6aa:	0100                	.insn	2, 0x0100
     6ac:	1b05                	.insn	2, 0x1b05
     6ae:	0306                	.insn	2, 0x0306
     6b0:	0901                	.insn	2, 0x0901
     6b2:	000c                	.insn	2, 0x000c
     6b4:	0501                	.insn	2, 0x0501
     6b6:	0611                	.insn	2, 0x0611
     6b8:	08090003          	lb	zero,128(s2)
     6bc:	0100                	.insn	2, 0x0100
     6be:	0d05                	.insn	2, 0x0d05
     6c0:	0306                	.insn	2, 0x0306
     6c2:	0904                	.insn	2, 0x0904
     6c4:	0008                	.insn	2, 0x0008
     6c6:	0601                	.insn	2, 0x0601
     6c8:	097e8703          	lb	a4,151(t4)
     6cc:	000c                	.insn	2, 0x000c
     6ce:	0501                	.insn	2, 0x0501
     6d0:	0611                	.insn	2, 0x0611
     6d2:	0901fe03          	.insn	4, 0x0901fe03
     6d6:	0004                	.insn	2, 0x0004
     6d8:	0601                	.insn	2, 0x0601
     6da:	10090003          	lb	zero,256(s2)
     6de:	0100                	.insn	2, 0x0100
     6e0:	0005                	.insn	2, 0x0005
     6e2:	097e8203          	lb	tp,151(t4)
     6e6:	0004                	.insn	2, 0x0004
     6e8:	0501                	.insn	2, 0x0501
     6ea:	060d                	.insn	2, 0x060d
     6ec:	09028c03          	lb	s8,144(t0)
     6f0:	000c                	.insn	2, 0x000c
     6f2:	0601                	.insn	2, 0x0601
     6f4:	097df403          	.insn	4, 0x097df403
     6f8:	0008                	.insn	2, 0x0008
     6fa:	0501                	.insn	2, 0x0501
     6fc:	0611                	.insn	2, 0x0611
     6fe:	09029103          	lh	sp,144(t0)
     702:	0008                	.insn	2, 0x0008
     704:	0501                	.insn	2, 0x0501
     706:	09050317          	auipc	t1,0x9050
     70a:	0004                	.insn	2, 0x0004
     70c:	0501                	.insn	2, 0x0501
     70e:	060d                	.insn	2, 0x060d
     710:	04090003          	lb	zero,64(s2)
     714:	0100                	.insn	2, 0x0100
     716:	097dea03          	.insn	4, 0x097dea03
     71a:	0008                	.insn	2, 0x0008
     71c:	0501                	.insn	2, 0x0501
     71e:	0632                	.insn	2, 0x0632
     720:	09028303          	lb	t1,144(t0)
     724:	0008                	.insn	2, 0x0008
     726:	0501                	.insn	2, 0x0501
     728:	060d                	.insn	2, 0x060d
     72a:	0c090003          	lb	zero,192(s2)
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
     766:	3205                	.insn	2, 0x3205
     768:	0306                	.insn	2, 0x0306
     76a:	0901                	.insn	2, 0x0901
     76c:	0008                	.insn	2, 0x0008
     76e:	0501                	.insn	2, 0x0501
     770:	060d                	.insn	2, 0x060d
     772:	08090003          	lb	zero,128(s2)
     776:	0100                	.insn	2, 0x0100
     778:	097df903          	.insn	4, 0x097df903
     77c:	0008                	.insn	2, 0x0008
     77e:	0501                	.insn	2, 0x0501
     780:	0611                	.insn	2, 0x0611
     782:	09029b03          	lh	s6,144(t0)
     786:	0008                	.insn	2, 0x0008
     788:	0501                	.insn	2, 0x0501
     78a:	031d                	.insn	2, 0x031d
     78c:	0905                	.insn	2, 0x0905
     78e:	0004                	.insn	2, 0x0004
     790:	0501                	.insn	2, 0x0501
     792:	0611                	.insn	2, 0x0611
     794:	04090003          	lb	zero,64(s2)
     798:	0100                	.insn	2, 0x0100
     79a:	08090003          	lb	zero,128(s2)
     79e:	0100                	.insn	2, 0x0100
     7a0:	097de003          	.insn	4, 0x097de003
     7a4:	0004                	.insn	2, 0x0004
     7a6:	0601                	.insn	2, 0x0601
     7a8:	0902a103          	lw	sp,144(t0)
     7ac:	0004                	.insn	2, 0x0004
     7ae:	0601                	.insn	2, 0x0601
     7b0:	097ddf03          	lhu	t5,151(s11)
     7b4:	0008                	.insn	2, 0x0008
     7b6:	0501                	.insn	2, 0x0501
     7b8:	060d                	.insn	2, 0x060d
     7ba:	0902a603          	lw	a2,144(t0)
     7be:	0008                	.insn	2, 0x0008
     7c0:	0601                	.insn	2, 0x0601
     7c2:	097dda03          	lhu	s4,151(s11)
     7c6:	0008                	.insn	2, 0x0008
     7c8:	0601                	.insn	2, 0x0601
     7ca:	0902b303          	.insn	4, 0x0902b303
     7ce:	0004                	.insn	2, 0x0004
     7d0:	0501                	.insn	2, 0x0501
     7d2:	0a05                	.insn	2, 0x0a05
     7d4:	08091f03          	lh	t5,128(s2)
     7d8:	0100                	.insn	2, 0x0100
     7da:	0c05                	.insn	2, 0x0c05
     7dc:	0306                	.insn	2, 0x0306
     7de:	0900                	.insn	2, 0x0900
     7e0:	0014                	.insn	2, 0x0014
     7e2:	0501                	.insn	2, 0x0501
     7e4:	0316                	.insn	2, 0x0316
     7e6:	0900                	.insn	2, 0x0900
     7e8:	0004                	.insn	2, 0x0004
     7ea:	0301                	.insn	2, 0x0301
     7ec:	7dae                	.insn	2, 0x7dae
     7ee:	0809                	.insn	2, 0x0809
     7f0:	0100                	.insn	2, 0x0100
     7f2:	0902d203          	lhu	tp,144(t0)
     7f6:	0004                	.insn	2, 0x0004
     7f8:	0501                	.insn	2, 0x0501
     7fa:	0619                	.insn	2, 0x0619
     7fc:	04090303          	lb	t1,64(s2)
     800:	0100                	.insn	2, 0x0100
     802:	2505                	.insn	2, 0x2505
     804:	0306                	.insn	2, 0x0306
     806:	0900                	.insn	2, 0x0900
     808:	0004                	.insn	2, 0x0004
     80a:	0501                	.insn	2, 0x0501
     80c:	060a                	.insn	2, 0x060a
     80e:	0c090103          	lb	sp,192(s2)
     812:	0100                	.insn	2, 0x0100
     814:	0306                	.insn	2, 0x0306
     816:	7daa                	.insn	2, 0x7daa
     818:	0409                	.insn	2, 0x0409
     81a:	0100                	.insn	2, 0x0100
     81c:	0902d603          	lhu	a2,144(t0)
     820:	0008                	.insn	2, 0x0008
     822:	0501                	.insn	2, 0x0501
     824:	0309                	.insn	2, 0x0309
     826:	0900                	.insn	2, 0x0900
     828:	0004                	.insn	2, 0x0004
     82a:	0301                	.insn	2, 0x0301
     82c:	7daa                	.insn	2, 0x7daa
     82e:	0409                	.insn	2, 0x0409
     830:	0100                	.insn	2, 0x0100
     832:	0105                	.insn	2, 0x0105
     834:	0306                	.insn	2, 0x0306
     836:	040902e3          	beqz	s2,107a <$d.3+0x180>
     83a:	0100                	.insn	2, 0x0100
     83c:	0306                	.insn	2, 0x0306
     83e:	7d9d                	.insn	2, 0x7d9d
     840:	0409                	.insn	2, 0x0409
     842:	0100                	.insn	2, 0x0100
     844:	1605                	.insn	2, 0x1605
     846:	0306                	.insn	2, 0x0306
     848:	0c0902db          	.insn	4, 0x0c0902db
     84c:	0100                	.insn	2, 0x0100
     84e:	0005                	.insn	2, 0x0005
     850:	0306                	.insn	2, 0x0306
     852:	7da5                	.insn	2, 0x7da5
     854:	1409                	.insn	2, 0x1409
     856:	0100                	.insn	2, 0x0100
     858:	0c05                	.insn	2, 0x0c05
     85a:	0306                	.insn	2, 0x0306
     85c:	02d8                	.insn	2, 0x02d8
     85e:	0409                	.insn	2, 0x0409
     860:	0100                	.insn	2, 0x0100
     862:	0005                	.insn	2, 0x0005
     864:	0306                	.insn	2, 0x0306
     866:	7da8                	.insn	2, 0x7da8
     868:	0409                	.insn	2, 0x0409
     86a:	0100                	.insn	2, 0x0100
     86c:	1005                	.insn	2, 0x1005
     86e:	0306                	.insn	2, 0x0306
     870:	02df 0409 0100      	.insn	6, 0x0100040902df
     876:	1605                	.insn	2, 0x1605
     878:	0306                	.insn	2, 0x0306
     87a:	0900                	.insn	2, 0x0900
     87c:	0004                	.insn	2, 0x0004
     87e:	0501                	.insn	2, 0x0501
     880:	0605                	.insn	2, 0x0605
     882:	04097903          	.insn	4, 0x04097903
     886:	0100                	.insn	2, 0x0100
     888:	0306                	.insn	2, 0x0306
     88a:	7da8                	.insn	2, 0x7da8
     88c:	0409                	.insn	2, 0x0409
     88e:	0100                	.insn	2, 0x0100
     890:	1605                	.insn	2, 0x1605
     892:	0306                	.insn	2, 0x0306
     894:	040902db          	.insn	4, 0x040902db
     898:	0100                	.insn	2, 0x0100
     89a:	1b05                	.insn	2, 0x1b05
     89c:	10090103          	lb	sp,256(s2)
     8a0:	0100                	.insn	2, 0x0100
     8a2:	10090103          	lb	sp,256(s2)
     8a6:	0100                	.insn	2, 0x0100
     8a8:	0306                	.insn	2, 0x0306
     8aa:	10097da3          	.insn	4, 0x10097da3
     8ae:	0100                	.insn	2, 0x0100
     8b0:	0a05                	.insn	2, 0x0a05
     8b2:	0306                	.insn	2, 0x0306
     8b4:	02e1                	.insn	2, 0x02e1
     8b6:	0409                	.insn	2, 0x0409
     8b8:	0100                	.insn	2, 0x0100
     8ba:	0105                	.insn	2, 0x0105
     8bc:	04090203          	lb	tp,64(s2)
     8c0:	0100                	.insn	2, 0x0100
     8c2:	0005                	.insn	2, 0x0005
     8c4:	04095a03          	lhu	s4,64(s2)
     8c8:	0100                	.insn	2, 0x0100
     8ca:	0505                	.insn	2, 0x0505
     8cc:	030a                	.insn	2, 0x030a
     8ce:	0902                	.insn	2, 0x0902
     8d0:	0024                	.insn	2, 0x0024
     8d2:	0601                	.insn	2, 0x0601
     8d4:	097dc103          	lbu	sp,151(s11)
     8d8:	0004                	.insn	2, 0x0004
     8da:	0501                	.insn	2, 0x0501
     8dc:	0325                	.insn	2, 0x0325
     8de:	0c0902bf 05050100 	.insn	8, 0x050501000c0902bf
     8e6:	04090003          	lb	zero,64(s2)
     8ea:	0100                	.insn	2, 0x0100
     8ec:	0d05                	.insn	2, 0x0d05
     8ee:	0306                	.insn	2, 0x0306
     8f0:	0901                	.insn	2, 0x0901
     8f2:	0004                	.insn	2, 0x0004
     8f4:	0601                	.insn	2, 0x0601
     8f6:	097dc003          	lbu	zero,151(s11)
     8fa:	000c                	.insn	2, 0x000c
     8fc:	0601                	.insn	2, 0x0601
     8fe:	0902c103          	lbu	sp,144(t0)
     902:	0004                	.insn	2, 0x0004
     904:	0501                	.insn	2, 0x0501
     906:	0312                	.insn	2, 0x0312
     908:	0901                	.insn	2, 0x0901
     90a:	0010                	.insn	2, 0x0010
     90c:	0501                	.insn	2, 0x0501
     90e:	031d                	.insn	2, 0x031d
     910:	0901                	.insn	2, 0x0901
     912:	0004                	.insn	2, 0x0004
     914:	0501                	.insn	2, 0x0501
     916:	0311                	.insn	2, 0x0311
     918:	0901                	.insn	2, 0x0901
     91a:	0008                	.insn	2, 0x0008
     91c:	0601                	.insn	2, 0x0601
     91e:	097dbc03          	.insn	4, 0x097dbc03
     922:	000c                	.insn	2, 0x000c
     924:	0501                	.insn	2, 0x0501
     926:	0615                	.insn	2, 0x0615
     928:	0902c703          	lbu	a4,144(t0)
     92c:	0004                	.insn	2, 0x0004
     92e:	0501                	.insn	2, 0x0501
     930:	0609                	.insn	2, 0x0609
     932:	04090003          	lb	zero,64(s2)
     936:	0100                	.insn	2, 0x0100
     938:	0306                	.insn	2, 0x0306
     93a:	0901                	.insn	2, 0x0901
     93c:	0004                	.insn	2, 0x0004
     93e:	0501                	.insn	2, 0x0501
     940:	0305                	.insn	2, 0x0305
     942:	0902                	.insn	2, 0x0902
     944:	000c                	.insn	2, 0x000c
     946:	0601                	.insn	2, 0x0601
     948:	097db603          	.insn	4, 0x097db603
     94c:	0018                	.insn	2, 0x0018
     94e:	0b01                	.insn	2, 0x0b01
     950:	0902ca03          	lbu	s4,144(t0)
     954:	000c                	.insn	2, 0x000c
     956:	0901                	.insn	2, 0x0901
     958:	000c                	.insn	2, 0x000c
     95a:	0100                	.insn	2, 0x0100
     95c:	                	.insn	2, 0x7e01

0000095d <$d.11>:
     95d:	087e                	.insn	2, 0x087e
     95f:	0000                	.insn	2, 0x0000
     961:	0004                	.insn	2, 0x0004
     963:	007a                	.insn	2, 0x007a
     965:	0000                	.insn	2, 0x0000
     967:	0101                	.insn	2, 0x0101
     969:	fb01                	.insn	2, 0xfb01
     96b:	0d0e                	.insn	2, 0x0d0e
     96d:	0100                	.insn	2, 0x0100
     96f:	0101                	.insn	2, 0x0101
     971:	0001                	.insn	2, 0x0001
     973:	0000                	.insn	2, 0x0000
     975:	0001                	.insn	2, 0x0001
     977:	0100                	.insn	2, 0x0100
     979:	2f2e                	.insn	2, 0x2f2e
     97b:	00637273          	csrrci	tp,0x6,6
     97f:	7273752f          	.insn	4, 0x7273752f
     983:	62696c2f          	.insn	4, 0x62696c2f
     987:	766c6c2f          	.insn	4, 0x766c6c2f
     98b:	2d6d                	.insn	2, 0x2d6d
     98d:	3831                	.insn	2, 0x3831
     98f:	62696c2f          	.insn	4, 0x62696c2f
     993:	616c632f          	.insn	4, 0x616c632f
     997:	676e                	.insn	2, 0x676e
     999:	2f38312f          	.insn	4, 0x2f38312f
     99d:	6e69                	.insn	2, 0x6e69
     99f:	64756c63          	bltu	a0,t2,ff7 <$d.3+0xfd>
     9a3:	0065                	.insn	2, 0x0065
     9a5:	7500                	.insn	2, 0x7500
     9a7:	2e726573          	csrrsi	a0,0x2e7,4
     9ab:	00010063          	beqz	sp,9ab <$d.11+0x4e>
     9af:	7300                	.insn	2, 0x7300
     9b1:	6474                	.insn	2, 0x6474
     9b3:	6e69                	.insn	2, 0x6e69
     9b5:	2e74                	.insn	2, 0x2e74
     9b7:	0068                	.insn	2, 0x0068
     9b9:	0002                	.insn	2, 0x0002
     9bb:	7500                	.insn	2, 0x7500
     9bd:	2e726573          	csrrsi	a0,0x2e7,4
     9c1:	0068                	.insn	2, 0x0068
     9c3:	0001                	.insn	2, 0x0001
     9c5:	6600                	.insn	2, 0x6600
     9c7:	7461                	.insn	2, 0x7461
     9c9:	682e3233          	.insn	4, 0x682e3233
     9cd:	0100                	.insn	2, 0x0100
     9cf:	0000                	.insn	2, 0x0000
     9d1:	616e7973          	csrrci	s2,0x616,28
     9d5:	5f70                	.insn	2, 0x5f70
     9d7:	7061                	.insn	2, 0x7061
     9d9:	2e69                	.insn	2, 0x2e69
     9db:	0068                	.insn	2, 0x0068
     9dd:	0001                	.insn	2, 0x0001
     9df:	0000                	.insn	2, 0x0000
     9e1:	0505                	.insn	2, 0x0505
     9e3:	000a                	.insn	2, 0x000a
     9e5:	0205                	.insn	2, 0x0205
     9e7:	0b34                	.insn	2, 0x0b34
     9e9:	0040                	.insn	2, 0x0040
     9eb:	0100c003          	lbu	zero,16(ra)
     9ef:	14091303          	lh	t1,320(s2)
     9f3:	0100                	.insn	2, 0x0100
     9f5:	0005                	.insn	2, 0x0005
     9f7:	04092503          	lw	a0,64(s2)
     9fb:	0100                	.insn	2, 0x0100
     9fd:	0505                	.insn	2, 0x0505
     9ff:	030a                	.insn	2, 0x030a
     a01:	0912                	.insn	2, 0x0912
     a03:	0010                	.insn	2, 0x0010
     a05:	0601                	.insn	2, 0x0601
     a07:	097ef503          	.insn	4, 0x097ef503
     a0b:	0004                	.insn	2, 0x0004
     a0d:	0501                	.insn	2, 0x0501
     a0f:	0609                	.insn	2, 0x0609
     a11:	09018c03          	lb	s8,144(gp)
     a15:	002c                	.insn	2, 0x002c
     a17:	0501                	.insn	2, 0x0501
     a19:	031e                	.insn	2, 0x031e
     a1b:	001c0903          	lb	s2,1(s8)
     a1f:	0501                	.insn	2, 0x0501
     a21:	061c                	.insn	2, 0x061c
     a23:	08090003          	lb	zero,128(s2)
     a27:	0100                	.insn	2, 0x0100
     a29:	1e05                	.insn	2, 0x1e05
     a2b:	0306                	.insn	2, 0x0306
     a2d:	0901                	.insn	2, 0x0901
     a2f:	0004                	.insn	2, 0x0004
     a31:	0501                	.insn	2, 0x0501
     a33:	061c                	.insn	2, 0x061c
     a35:	04090003          	lb	zero,64(s2)
     a39:	0100                	.insn	2, 0x0100
     a3b:	2005                	.insn	2, 0x2005
     a3d:	0306                	.insn	2, 0x0306
     a3f:	097c                	.insn	2, 0x097c
     a41:	0004                	.insn	2, 0x0004
     a43:	0501                	.insn	2, 0x0501
     a45:	032c                	.insn	2, 0x032c
     a47:	097f 0014 0501 0605 	.insn	10, 0x0003060505010014097f
     a4f:	0003 
     a51:	0409                	.insn	2, 0x0409
     a53:	0100                	.insn	2, 0x0100
     a55:	097ef503          	.insn	4, 0x097ef503
     a59:	0010                	.insn	2, 0x0010
     a5b:	0601                	.insn	2, 0x0601
     a5d:	0904c003          	lbu	zero,144(s1)
     a61:	0020                	.insn	2, 0x0020
     a63:	0601                	.insn	2, 0x0601
     a65:	097bc003          	lbu	zero,151(s7)
     a69:	001c                	.insn	2, 0x001c
     a6b:	0601                	.insn	2, 0x0601
     a6d:	09048303          	lb	t1,144(s1)
     a71:	0004                	.insn	2, 0x0004
     a73:	0601                	.insn	2, 0x0601
     a75:	0c090003          	lb	zero,192(s2)
     a79:	0100                	.insn	2, 0x0100
     a7b:	0306                	.insn	2, 0x0306
     a7d:	7da1                	.insn	2, 0x7da1
     a7f:	0c09                	.insn	2, 0x0c09
     a81:	0100                	.insn	2, 0x0100
     a83:	0306                	.insn	2, 0x0306
     a85:	7edc                	.insn	2, 0x7edc
     a87:	0409                	.insn	2, 0x0409
     a89:	0100                	.insn	2, 0x0100
     a8b:	0905                	.insn	2, 0x0905
     a8d:	0306                	.insn	2, 0x0306
     a8f:	01a5                	.insn	2, 0x01a5
     a91:	1809                	.insn	2, 0x1809
     a93:	0100                	.insn	2, 0x0100
     a95:	1c05                	.insn	2, 0x1c05
     a97:	10090103          	lb	sp,256(s2)
     a9b:	0100                	.insn	2, 0x0100
     a9d:	0505                	.insn	2, 0x0505
     a9f:	09038503          	lb	a0,144(t2) # 5ba <$d.3+0x58>
     aa3:	0004                	.insn	2, 0x0004
     aa5:	0301                	.insn	2, 0x0301
     aa7:	0958                	.insn	2, 0x0958
     aa9:	000c                	.insn	2, 0x000c
     aab:	0501                	.insn	2, 0x0501
     aad:	0320                	.insn	2, 0x0320
     aaf:	7da2                	.insn	2, 0x7da2
     ab1:	0c09                	.insn	2, 0x0c09
     ab3:	0100                	.insn	2, 0x0100
     ab5:	0505                	.insn	2, 0x0505
     ab7:	0902de03          	lhu	t3,144(t0)
     abb:	0008                	.insn	2, 0x0008
     abd:	0501                	.insn	2, 0x0501
     abf:	032c                	.insn	2, 0x032c
     ac1:	7da1                	.insn	2, 0x7da1
     ac3:	0c09                	.insn	2, 0x0c09
     ac5:	0100                	.insn	2, 0x0100
     ac7:	0505                	.insn	2, 0x0505
     ac9:	0306                	.insn	2, 0x0306
     acb:	0900                	.insn	2, 0x0900
     acd:	0004                	.insn	2, 0x0004
     acf:	0301                	.insn	2, 0x0301
     ad1:	7edc                	.insn	2, 0x7edc
     ad3:	0c09                	.insn	2, 0x0c09
     ad5:	0100                	.insn	2, 0x0100
     ad7:	0306                	.insn	2, 0x0306
     ad9:	04c0                	.insn	2, 0x04c0
     adb:	2009                	.insn	2, 0x2009
     add:	0100                	.insn	2, 0x0100
     adf:	20094303          	lbu	t1,512(s2)
     ae3:	0100                	.insn	2, 0x0100
     ae5:	0306                	.insn	2, 0x0306
     ae7:	0900                	.insn	2, 0x0900
     ae9:	000c                	.insn	2, 0x000c
     aeb:	0301                	.insn	2, 0x0301
     aed:	7bfd                	.insn	2, 0x7bfd
     aef:	0c09                	.insn	2, 0x0c09
     af1:	0100                	.insn	2, 0x0100
     af3:	09048303          	lb	t1,144(s1)
     af7:	0004                	.insn	2, 0x0004
     af9:	0301                	.insn	2, 0x0301
     afb:	0900                	.insn	2, 0x0900
     afd:	0010                	.insn	2, 0x0010
     aff:	0301                	.insn	2, 0x0301
     b01:	0900                	.insn	2, 0x0900
     b03:	000c                	.insn	2, 0x000c
     b05:	0601                	.insn	2, 0x0601
     b07:	097dad03          	lw	s10,151(s11)
     b0b:	000c                	.insn	2, 0x000c
     b0d:	0601                	.insn	2, 0x0601
     b0f:	097ed003          	lhu	zero,151(t4)
     b13:	0004                	.insn	2, 0x0004
     b15:	0501                	.insn	2, 0x0501
     b17:	0609                	.insn	2, 0x0609
     b19:	0901b103          	.insn	4, 0x0901b103
     b1d:	0024                	.insn	2, 0x0024
     b1f:	0501                	.insn	2, 0x0501
     b21:	031c                	.insn	2, 0x031c
     b23:	0901                	.insn	2, 0x0901
     b25:	0010                	.insn	2, 0x0010
     b27:	0501                	.insn	2, 0x0501
     b29:	0305                	.insn	2, 0x0305
     b2b:	02f9                	.insn	2, 0x02f9
     b2d:	0409                	.insn	2, 0x0409
     b2f:	0100                	.insn	2, 0x0100
     b31:	0c095803          	lhu	a6,192(s2)
     b35:	0100                	.insn	2, 0x0100
     b37:	2005                	.insn	2, 0x2005
     b39:	097dae03          	lw	t3,151(s11)
     b3d:	000c                	.insn	2, 0x000c
     b3f:	0501                	.insn	2, 0x0501
     b41:	0305                	.insn	2, 0x0305
     b43:	02d2                	.insn	2, 0x02d2
     b45:	0809                	.insn	2, 0x0809
     b47:	0100                	.insn	2, 0x0100
     b49:	2c05                	.insn	2, 0x2c05
     b4b:	097dad03          	lw	s10,151(s11)
     b4f:	000c                	.insn	2, 0x000c
     b51:	0501                	.insn	2, 0x0501
     b53:	0605                	.insn	2, 0x0605
     b55:	04090003          	lb	zero,64(s2)
     b59:	0100                	.insn	2, 0x0100
     b5b:	097ed003          	lhu	zero,151(t4)
     b5f:	000c                	.insn	2, 0x000c
     b61:	0601                	.insn	2, 0x0601
     b63:	09048303          	lb	t1,144(s1)
     b67:	0004                	.insn	2, 0x0004
     b69:	0601                	.insn	2, 0x0601
     b6b:	10090003          	lb	zero,256(s2)
     b6f:	0100                	.insn	2, 0x0100
     b71:	0c090003          	lb	zero,192(s2)
     b75:	0100                	.insn	2, 0x0100
     b77:	097bfd03          	.insn	4, 0x097bfd03
     b7b:	0010                	.insn	2, 0x0010
     b7d:	0301                	.insn	2, 0x0301
     b7f:	04090483          	lb	s1,64(s2)
     b83:	0100                	.insn	2, 0x0100
     b85:	10090003          	lb	zero,256(s2)
     b89:	0100                	.insn	2, 0x0100
     b8b:	0c090003          	lb	zero,192(s2)
     b8f:	0100                	.insn	2, 0x0100
     b91:	097bfd03          	.insn	4, 0x097bfd03
     b95:	000c                	.insn	2, 0x000c
     b97:	0301                	.insn	2, 0x0301
     b99:	04090483          	lb	s1,64(s2)
     b9d:	0100                	.insn	2, 0x0100
     b9f:	10090003          	lb	zero,256(s2)
     ba3:	0100                	.insn	2, 0x0100
     ba5:	0c090003          	lb	zero,192(s2)
     ba9:	0100                	.insn	2, 0x0100
     bab:	0306                	.insn	2, 0x0306
     bad:	7db9                	.insn	2, 0x7db9
     baf:	0c09                	.insn	2, 0x0c09
     bb1:	0100                	.insn	2, 0x0100
     bb3:	0306                	.insn	2, 0x0306
     bb5:	7ec4                	.insn	2, 0x7ec4
     bb7:	0409                	.insn	2, 0x0409
     bb9:	0100                	.insn	2, 0x0100
     bbb:	1c05                	.insn	2, 0x1c05
     bbd:	0306                	.insn	2, 0x0306
     bbf:	01be                	.insn	2, 0x01be
     bc1:	1809                	.insn	2, 0x1809
     bc3:	0100                	.insn	2, 0x0100
     bc5:	0505                	.insn	2, 0x0505
     bc7:	0902ed03          	.insn	4, 0x0902ed03
     bcb:	0004                	.insn	2, 0x0004
     bcd:	0301                	.insn	2, 0x0301
     bcf:	0958                	.insn	2, 0x0958
     bd1:	000c                	.insn	2, 0x000c
     bd3:	0501                	.insn	2, 0x0501
     bd5:	0320                	.insn	2, 0x0320
     bd7:	7dba                	.insn	2, 0x7dba
     bd9:	0c09                	.insn	2, 0x0c09
     bdb:	0100                	.insn	2, 0x0100
     bdd:	0505                	.insn	2, 0x0505
     bdf:	0902c603          	lbu	a2,144(t0)
     be3:	000c                	.insn	2, 0x000c
     be5:	0501                	.insn	2, 0x0501
     be7:	032c                	.insn	2, 0x032c
     be9:	7db9                	.insn	2, 0x7db9
     beb:	0c09                	.insn	2, 0x0c09
     bed:	0100                	.insn	2, 0x0100
     bef:	0505                	.insn	2, 0x0505
     bf1:	0306                	.insn	2, 0x0306
     bf3:	0900                	.insn	2, 0x0900
     bf5:	0004                	.insn	2, 0x0004
     bf7:	0301                	.insn	2, 0x0301
     bf9:	7ec4                	.insn	2, 0x7ec4
     bfb:	0809                	.insn	2, 0x0809
     bfd:	0100                	.insn	2, 0x0100
     bff:	0306                	.insn	2, 0x0306
     c01:	04090483          	lb	s1,64(s2)
     c05:	0100                	.insn	2, 0x0100
     c07:	0105                	.insn	2, 0x0105
     c09:	7dc1030b          	.insn	4, 0x7dc1030b
     c0d:	0c09                	.insn	2, 0x0c09
     c0f:	0100                	.insn	2, 0x0100
     c11:	0005                	.insn	2, 0x0005
     c13:	0902be03          	.insn	4, 0x0902be03
     c17:	0010                	.insn	2, 0x0010
     c19:	0501                	.insn	2, 0x0501
     c1b:	0a05                	.insn	2, 0x0a05
     c1d:	04090103          	lb	sp,64(s2)
     c21:	0100                	.insn	2, 0x0100
     c23:	0105                	.insn	2, 0x0105
     c25:	0c090803          	lb	a6,192(s2)
     c29:	0100                	.insn	2, 0x0100
     c2b:	0005                	.insn	2, 0x0005
     c2d:	04091f03          	lh	t5,64(s2)
     c31:	0100                	.insn	2, 0x0100
     c33:	0505                	.insn	2, 0x0505
     c35:	030a                	.insn	2, 0x030a
     c37:	0901                	.insn	2, 0x0901
     c39:	0004                	.insn	2, 0x0004
     c3b:	0501                	.insn	2, 0x0501
     c3d:	0301                	.insn	2, 0x0301
     c3f:	0908                	.insn	2, 0x0908
     c41:	000c                	.insn	2, 0x000c
     c43:	0501                	.insn	2, 0x0501
     c45:	0a05                	.insn	2, 0x0a05
     c47:	04092203          	lw	tp,64(s2)
     c4b:	0100                	.insn	2, 0x0100
     c4d:	0105                	.insn	2, 0x0105
     c4f:	097cfa03          	.insn	4, 0x097cfa03
     c53:	0008                	.insn	2, 0x0008
     c55:	0501                	.insn	2, 0x0501
     c57:	0300                	.insn	2, 0x0300
     c59:	091a                	.insn	2, 0x091a
     c5b:	0004                	.insn	2, 0x0004
     c5d:	0501                	.insn	2, 0x0501
     c5f:	0a09                	.insn	2, 0x0a09
     c61:	14090403          	lb	s0,320(s2)
     c65:	0100                	.insn	2, 0x0100
     c67:	0306                	.insn	2, 0x0306
     c69:	0900                	.insn	2, 0x0900
     c6b:	0018                	.insn	2, 0x0018
     c6d:	0601                	.insn	2, 0x0601
     c6f:	04090503          	lb	a0,64(s2)
     c73:	0100                	.insn	2, 0x0100
     c75:	0c090403          	lb	s0,192(s2)
     c79:	0100                	.insn	2, 0x0100
     c7b:	0306                	.insn	2, 0x0306
     c7d:	0900                	.insn	2, 0x0900
     c7f:	0008                	.insn	2, 0x0008
     c81:	0601                	.insn	2, 0x0601
     c83:	04090103          	lb	sp,64(s2)
     c87:	0100                	.insn	2, 0x0100
     c89:	0005                	.insn	2, 0x0005
     c8b:	0306                	.insn	2, 0x0306
     c8d:	7e89                	.insn	2, 0x7e89
     c8f:	0809                	.insn	2, 0x0809
     c91:	0100                	.insn	2, 0x0100
     c93:	0105                	.insn	2, 0x0105
     c95:	0b06                	.insn	2, 0x0b06
     c97:	09028a03          	lb	s4,144(t0)
     c9b:	0018                	.insn	2, 0x0018
     c9d:	0501                	.insn	2, 0x0501
     c9f:	0309                	.insn	2, 0x0309
     ca1:	0972                	.insn	2, 0x0972
     ca3:	0008                	.insn	2, 0x0008
     ca5:	0301                	.insn	2, 0x0301
     ca7:	0904                	.insn	2, 0x0904
     ca9:	0008                	.insn	2, 0x0008
     cab:	0301                	.insn	2, 0x0301
     cad:	0902                	.insn	2, 0x0902
     caf:	0004                	.insn	2, 0x0004
     cb1:	0301                	.insn	2, 0x0301
     cb3:	097a                	.insn	2, 0x097a
     cb5:	0004                	.insn	2, 0x0004
     cb7:	0501                	.insn	2, 0x0501
     cb9:	0305                	.insn	2, 0x0305
     cbb:	0902                	.insn	2, 0x0902
     cbd:	0004                	.insn	2, 0x0004
     cbf:	0301                	.insn	2, 0x0301
     cc1:	095d                	.insn	2, 0x095d
     cc3:	0014                	.insn	2, 0x0014
     cc5:	0601                	.insn	2, 0x0601
     cc7:	097ea503          	lw	a0,151(t4)
     ccb:	0010                	.insn	2, 0x0010
     ccd:	0501                	.insn	2, 0x0501
     ccf:	0600                	.insn	2, 0x0600
     cd1:	0902d903          	lhu	s2,144(t0)
     cd5:	0004                	.insn	2, 0x0004
     cd7:	0501                	.insn	2, 0x0501
     cd9:	0a05                	.insn	2, 0x0a05
     cdb:	3c090203          	lb	tp,960(s2)
     cdf:	0100                	.insn	2, 0x0100
     ce1:	0d05                	.insn	2, 0x0d05
     ce3:	44090503          	lb	a0,1088(s2)
     ce7:	0100                	.insn	2, 0x0100
     ce9:	0c05                	.insn	2, 0x0c05
     ceb:	04093c03          	.insn	4, 0x04093c03
     cef:	0100                	.insn	2, 0x0100
     cf1:	04094103          	lbu	sp,64(s2)
     cf5:	0100                	.insn	2, 0x0100
     cf7:	0505                	.insn	2, 0x0505
     cf9:	0306                	.insn	2, 0x0306
     cfb:	0900                	.insn	2, 0x0900
     cfd:	0004                	.insn	2, 0x0004
     cff:	0601                	.insn	2, 0x0601
     d01:	0901a603          	lw	a2,144(gp)
     d05:	0008                	.insn	2, 0x0008
     d07:	0501                	.insn	2, 0x0501
     d09:	030c                	.insn	2, 0x030c
     d0b:	7f99                	.insn	2, 0x7f99
     d0d:	0c09                	.insn	2, 0x0c09
     d0f:	0100                	.insn	2, 0x0100
     d11:	0306                	.insn	2, 0x0306
     d13:	7ce4                	.insn	2, 0x7ce4
     d15:	0409                	.insn	2, 0x0409
     d17:	0100                	.insn	2, 0x0100
     d19:	1505                	.insn	2, 0x1505
     d1b:	0306                	.insn	2, 0x0306
     d1d:	02e0                	.insn	2, 0x02e0
     d1f:	0409                	.insn	2, 0x0409
     d21:	0100                	.insn	2, 0x0100
     d23:	1005                	.insn	2, 0x1005
     d25:	04097f03          	.insn	4, 0x04097f03
     d29:	0100                	.insn	2, 0x0100
     d2b:	0d05                	.insn	2, 0x0d05
     d2d:	04090103          	lb	sp,64(s2)
     d31:	0100                	.insn	2, 0x0100
     d33:	2105                	.insn	2, 0x2105
     d35:	0c091003          	lh	zero,192(s2)
     d39:	0100                	.insn	2, 0x0100
     d3b:	1905                	.insn	2, 0x1905
     d3d:	10090303          	lb	t1,256(s2)
     d41:	0100                	.insn	2, 0x0100
     d43:	04090d03          	lb	s10,64(s2)
     d47:	0100                	.insn	2, 0x0100
     d49:	0505                	.insn	2, 0x0505
     d4b:	09018303          	lb	t1,144(gp)
     d4f:	0004                	.insn	2, 0x0004
     d51:	0501                	.insn	2, 0x0501
     d53:	030c                	.insn	2, 0x030c
     d55:	7f99                	.insn	2, 0x7f99
     d57:	0c09                	.insn	2, 0x0c09
     d59:	0100                	.insn	2, 0x0100
     d5b:	0306                	.insn	2, 0x0306
     d5d:	7ce4                	.insn	2, 0x7ce4
     d5f:	0409                	.insn	2, 0x0409
     d61:	0100                	.insn	2, 0x0100
     d63:	0d05                	.insn	2, 0x0d05
     d65:	0306                	.insn	2, 0x0306
     d67:	02e0                	.insn	2, 0x02e0
     d69:	0409                	.insn	2, 0x0409
     d6b:	0100                	.insn	2, 0x0100
     d6d:	2605                	.insn	2, 0x2605
     d6f:	08093103          	.insn	4, 0x08093103
     d73:	0100                	.insn	2, 0x0100
     d75:	3205                	.insn	2, 0x3205
     d77:	10090203          	lb	tp,256(s2)
     d7b:	0100                	.insn	2, 0x0100
     d7d:	2105                	.insn	2, 0x2105
     d7f:	04090103          	lb	sp,64(s2)
     d83:	0100                	.insn	2, 0x0100
     d85:	0505                	.insn	2, 0x0505
     d87:	0900ef03          	.insn	4, 0x0900ef03
     d8b:	0008                	.insn	2, 0x0008
     d8d:	0501                	.insn	2, 0x0501
     d8f:	033e                	.insn	2, 0x033e
     d91:	7f90                	.insn	2, 0x7f90
     d93:	0c09                	.insn	2, 0x0c09
     d95:	0100                	.insn	2, 0x0100
     d97:	2105                	.insn	2, 0x2105
     d99:	08090103          	lb	sp,128(s2)
     d9d:	0100                	.insn	2, 0x0100
     d9f:	0505                	.insn	2, 0x0505
     da1:	0900ef03          	.insn	4, 0x0900ef03
     da5:	0008                	.insn	2, 0x0008
     da7:	0501                	.insn	2, 0x0501
     da9:	033e                	.insn	2, 0x033e
     dab:	7f90                	.insn	2, 0x7f90
     dad:	0c09                	.insn	2, 0x0c09
     daf:	0100                	.insn	2, 0x0100
     db1:	2105                	.insn	2, 0x2105
     db3:	08090103          	lb	sp,128(s2)
     db7:	0100                	.insn	2, 0x0100
     db9:	0505                	.insn	2, 0x0505
     dbb:	0900ef03          	.insn	4, 0x0900ef03
     dbf:	0008                	.insn	2, 0x0008
     dc1:	0501                	.insn	2, 0x0501
     dc3:	033e                	.insn	2, 0x033e
     dc5:	7f90                	.insn	2, 0x7f90
     dc7:	0c09                	.insn	2, 0x0c09
     dc9:	0100                	.insn	2, 0x0100
     dcb:	2105                	.insn	2, 0x2105
     dcd:	08090103          	lb	sp,128(s2)
     dd1:	0100                	.insn	2, 0x0100
     dd3:	0505                	.insn	2, 0x0505
     dd5:	0900ef03          	.insn	4, 0x0900ef03
     dd9:	0008                	.insn	2, 0x0008
     ddb:	0501                	.insn	2, 0x0501
     ddd:	033e                	.insn	2, 0x033e
     ddf:	7f90                	.insn	2, 0x7f90
     de1:	0c09                	.insn	2, 0x0c09
     de3:	0100                	.insn	2, 0x0100
     de5:	2105                	.insn	2, 0x2105
     de7:	08090103          	lb	sp,128(s2)
     deb:	0100                	.insn	2, 0x0100
     ded:	0505                	.insn	2, 0x0505
     def:	0900ef03          	.insn	4, 0x0900ef03
     df3:	0008                	.insn	2, 0x0008
     df5:	0501                	.insn	2, 0x0501
     df7:	033e                	.insn	2, 0x033e
     df9:	7f90                	.insn	2, 0x7f90
     dfb:	0c09                	.insn	2, 0x0c09
     dfd:	0100                	.insn	2, 0x0100
     dff:	2105                	.insn	2, 0x2105
     e01:	08090103          	lb	sp,128(s2)
     e05:	0100                	.insn	2, 0x0100
     e07:	0505                	.insn	2, 0x0505
     e09:	0900ef03          	.insn	4, 0x0900ef03
     e0d:	0008                	.insn	2, 0x0008
     e0f:	0501                	.insn	2, 0x0501
     e11:	033e                	.insn	2, 0x033e
     e13:	7f90                	.insn	2, 0x7f90
     e15:	0c09                	.insn	2, 0x0c09
     e17:	0100                	.insn	2, 0x0100
     e19:	2105                	.insn	2, 0x2105
     e1b:	08090103          	lb	sp,128(s2)
     e1f:	0100                	.insn	2, 0x0100
     e21:	0505                	.insn	2, 0x0505
     e23:	0900ef03          	.insn	4, 0x0900ef03
     e27:	0008                	.insn	2, 0x0008
     e29:	0501                	.insn	2, 0x0501
     e2b:	033e                	.insn	2, 0x033e
     e2d:	7f90                	.insn	2, 0x7f90
     e2f:	0c09                	.insn	2, 0x0c09
     e31:	0100                	.insn	2, 0x0100
     e33:	2105                	.insn	2, 0x2105
     e35:	04090103          	lb	sp,64(s2)
     e39:	0100                	.insn	2, 0x0100
     e3b:	0505                	.insn	2, 0x0505
     e3d:	0900ef03          	.insn	4, 0x0900ef03
     e41:	0008                	.insn	2, 0x0008
     e43:	0501                	.insn	2, 0x0501
     e45:	030c                	.insn	2, 0x030c
     e47:	7f99                	.insn	2, 0x7f99
     e49:	0c09                	.insn	2, 0x0c09
     e4b:	0100                	.insn	2, 0x0100
     e4d:	0306                	.insn	2, 0x0306
     e4f:	7ce4                	.insn	2, 0x7ce4
     e51:	0409                	.insn	2, 0x0409
     e53:	0100                	.insn	2, 0x0100
     e55:	0505                	.insn	2, 0x0505
     e57:	0306                	.insn	2, 0x0306
     e59:	04090483          	lb	s1,64(s2)
     e5d:	0100                	.insn	2, 0x0100
     e5f:	0c05                	.insn	2, 0x0c05
     e61:	097f9903          	lh	s2,151(t6)
     e65:	000c                	.insn	2, 0x000c
     e67:	0601                	.insn	2, 0x0601
     e69:	097ce403          	.insn	4, 0x097ce403
     e6d:	0004                	.insn	2, 0x0004
     e6f:	0501                	.insn	2, 0x0501
     e71:	0625                	.insn	2, 0x0625
     e73:	0902e803          	.insn	4, 0x0902e803
     e77:	0004                	.insn	2, 0x0004
     e79:	0501                	.insn	2, 0x0501
     e7b:	031c                	.insn	2, 0x031c
     e7d:	0901                	.insn	2, 0x0901
     e7f:	0010                	.insn	2, 0x0010
     e81:	0501                	.insn	2, 0x0501
     e83:	0615                	.insn	2, 0x0615
     e85:	04090003          	lb	zero,64(s2)
     e89:	0100                	.insn	2, 0x0100
     e8b:	0505                	.insn	2, 0x0505
     e8d:	0306                	.insn	2, 0x0306
     e8f:	019a                	.insn	2, 0x019a
     e91:	0809                	.insn	2, 0x0809
     e93:	0100                	.insn	2, 0x0100
     e95:	1c05                	.insn	2, 0x1c05
     e97:	097ee603          	.insn	4, 0x097ee603
     e9b:	000c                	.insn	2, 0x000c
     e9d:	0501                	.insn	2, 0x0501
     e9f:	0615                	.insn	2, 0x0615
     ea1:	04090003          	lb	zero,64(s2)
     ea5:	0100                	.insn	2, 0x0100
     ea7:	0505                	.insn	2, 0x0505
     ea9:	0306                	.insn	2, 0x0306
     eab:	019a                	.insn	2, 0x019a
     ead:	0c09                	.insn	2, 0x0c09
     eaf:	0100                	.insn	2, 0x0100
     eb1:	3a05                	.insn	2, 0x3a05
     eb3:	097ef303          	.insn	4, 0x097ef303
     eb7:	000c                	.insn	2, 0x000c
     eb9:	0601                	.insn	2, 0x0601
     ebb:	097d8a03          	lb	s4,151(s11)
     ebf:	0004                	.insn	2, 0x0004
     ec1:	0501                	.insn	2, 0x0501
     ec3:	8703061b          	.insn	4, 0x8703061b
     ec7:	000c0903          	lb	s2,0(s8)
     ecb:	0601                	.insn	2, 0x0601
     ecd:	097cf903          	.insn	4, 0x097cf903
     ed1:	0008                	.insn	2, 0x0008
     ed3:	0501                	.insn	2, 0x0501
     ed5:	0624                	.insn	2, 0x0624
     ed7:	09038603          	lb	a2,144(t2)
     edb:	0008                	.insn	2, 0x0008
     edd:	0501                	.insn	2, 0x0501
     edf:	061e                	.insn	2, 0x061e
     ee1:	04090003          	lb	zero,64(s2)
     ee5:	0100                	.insn	2, 0x0100
     ee7:	2205                	.insn	2, 0x2205
     ee9:	04090003          	lb	zero,64(s2)
     eed:	0100                	.insn	2, 0x0100
     eef:	1505                	.insn	2, 0x1505
     ef1:	0306                	.insn	2, 0x0306
     ef3:	097f 0008 0501 0321 	.insn	10, 0x0907032105010008097f
     efb:	0907 
     efd:	0004                	.insn	2, 0x0004
     eff:	0501                	.insn	2, 0x0501
     f01:	0305                	.insn	2, 0x0305
     f03:	080900f7          	.insn	4, 0x080900f7
     f07:	0100                	.insn	2, 0x0100
     f09:	1e05                	.insn	2, 0x1e05
     f0b:	097f8803          	lb	a6,151(t6)
     f0f:	000c                	.insn	2, 0x000c
     f11:	0501                	.insn	2, 0x0501
     f13:	0615                	.insn	2, 0x0615
     f15:	08090003          	lb	zero,128(s2)
     f19:	0100                	.insn	2, 0x0100
     f1b:	097cf503          	.insn	4, 0x097cf503
     f1f:	0008                	.insn	2, 0x0008
     f21:	0501                	.insn	2, 0x0501
     f23:	0605                	.insn	2, 0x0605
     f25:	09048303          	lb	t1,144(s1)
     f29:	0004                	.insn	2, 0x0004
     f2b:	0601                	.insn	2, 0x0601
     f2d:	097bfd03          	.insn	4, 0x097bfd03
     f31:	000c                	.insn	2, 0x000c
     f33:	0501                	.insn	2, 0x0501
     f35:	0601                	.insn	2, 0x0601
     f37:	03a1030b          	.insn	4, 0x03a1030b
     f3b:	1409                	.insn	2, 0x1409
     f3d:	0100                	.insn	2, 0x0100
     f3f:	0505                	.insn	2, 0x0505
     f41:	030a                	.insn	2, 0x030a
     f43:	01b4                	.insn	2, 0x01b4
     f45:	0809                	.insn	2, 0x0809
     f47:	0100                	.insn	2, 0x0100
     f49:	0105                	.insn	2, 0x0105
     f4b:	097dc003          	lbu	zero,151(s11)
     f4f:	0008                	.insn	2, 0x0008
     f51:	0501                	.insn	2, 0x0501
     f53:	0a05                	.insn	2, 0x0a05
     f55:	0902d003          	lhu	zero,144(t0)
     f59:	0004                	.insn	2, 0x0004
     f5b:	0501                	.insn	2, 0x0501
     f5d:	0301                	.insn	2, 0x0301
     f5f:	08097dbb          	.insn	4, 0x08097dbb
     f63:	0100                	.insn	2, 0x0100
     f65:	0505                	.insn	2, 0x0505
     f67:	030a                	.insn	2, 0x030a
     f69:	02c5                	.insn	2, 0x02c5
     f6b:	0409                	.insn	2, 0x0409
     f6d:	0100                	.insn	2, 0x0100
     f6f:	0105                	.insn	2, 0x0105
     f71:	097dc603          	lbu	a2,151(s11)
     f75:	0008                	.insn	2, 0x0008
     f77:	0501                	.insn	2, 0x0501
     f79:	0a05                	.insn	2, 0x0a05
     f7b:	0902ce03          	lbu	t3,144(t0)
     f7f:	0004                	.insn	2, 0x0004
     f81:	0301                	.insn	2, 0x0301
     f83:	7db9                	.insn	2, 0x7db9
     f85:	0809                	.insn	2, 0x0809
     f87:	0100                	.insn	2, 0x0100
     f89:	030a                	.insn	2, 0x030a
     f8b:	02ec                	.insn	2, 0x02ec
     f8d:	0409                	.insn	2, 0x0409
     f8f:	0100                	.insn	2, 0x0100
     f91:	0105                	.insn	2, 0x0105
     f93:	097da503          	lw	a0,151(s11)
     f97:	0008                	.insn	2, 0x0008
     f99:	0501                	.insn	2, 0x0501
     f9b:	0a0c                	.insn	2, 0x0a0c
     f9d:	04090503          	lb	a0,64(s2)
     fa1:	0100                	.insn	2, 0x0100
     fa3:	0505                	.insn	2, 0x0505
     fa5:	0306                	.insn	2, 0x0306
     fa7:	0900                	.insn	2, 0x0900
     fa9:	0008                	.insn	2, 0x0008
     fab:	0301                	.insn	2, 0x0301
     fad:	7db8                	.insn	2, 0x7db8
     faf:	0809                	.insn	2, 0x0809
     fb1:	0100                	.insn	2, 0x0100
     fb3:	0e05                	.insn	2, 0x0e05
     fb5:	0306                	.insn	2, 0x0306
     fb7:	02c9                	.insn	2, 0x02c9
     fb9:	0409                	.insn	2, 0x0409
     fbb:	0100                	.insn	2, 0x0100
     fbd:	0c05                	.insn	2, 0x0c05
     fbf:	04097f03          	.insn	4, 0x04097f03
     fc3:	0100                	.insn	2, 0x0100
     fc5:	0b05                	.insn	2, 0x0b05
     fc7:	04090103          	lb	sp,64(s2)
     fcb:	0100                	.insn	2, 0x0100
     fcd:	0505                	.insn	2, 0x0505
     fcf:	04097f03          	.insn	4, 0x04097f03
     fd3:	0100                	.insn	2, 0x0100
     fd5:	0306                	.insn	2, 0x0306
     fd7:	7db8                	.insn	2, 0x7db8
     fd9:	0409                	.insn	2, 0x0409
     fdb:	0100                	.insn	2, 0x0100
     fdd:	0902c803          	lbu	a6,144(t0)
     fe1:	0004                	.insn	2, 0x0004
     fe3:	0501                	.insn	2, 0x0501
     fe5:	0608                	.insn	2, 0x0608
     fe7:	04090203          	lb	tp,64(s2)
     feb:	0100                	.insn	2, 0x0100
     fed:	0505                	.insn	2, 0x0505
     fef:	04090103          	lb	sp,64(s2)
     ff3:	0100                	.insn	2, 0x0100
     ff5:	0c05                	.insn	2, 0x0c05
     ff7:	030a                	.insn	2, 0x030a
     ff9:	0904                	.insn	2, 0x0904
     ffb:	0004                	.insn	2, 0x0004
     ffd:	0501                	.insn	2, 0x0501
     fff:	0610                	.insn	2, 0x0610
    1001:	04090003          	lb	zero,64(s2)
    1005:	0100                	.insn	2, 0x0100
    1007:	0505                	.insn	2, 0x0505
    1009:	04090003          	lb	zero,64(s2)
    100d:	0100                	.insn	2, 0x0100
    100f:	1305                	.insn	2, 0x1305
    1011:	04090003          	lb	zero,64(s2)
    1015:	0100                	.insn	2, 0x0100
    1017:	0505                	.insn	2, 0x0505
    1019:	08090003          	lb	zero,128(s2)
    101d:	0100                	.insn	2, 0x0100
    101f:	0c05                	.insn	2, 0x0c05
    1021:	04090003          	lb	zero,64(s2)
    1025:	0100                	.insn	2, 0x0100
    1027:	0b05                	.insn	2, 0x0b05
    1029:	0306                	.insn	2, 0x0306
    102b:	0904                	.insn	2, 0x0904
    102d:	0004                	.insn	2, 0x0004
    102f:	0501                	.insn	2, 0x0501
    1031:	0310                	.insn	2, 0x0310
    1033:	097c                	.insn	2, 0x097c
    1035:	0004                	.insn	2, 0x0004
    1037:	0501                	.insn	2, 0x0501
    1039:	030c                	.insn	2, 0x030c
    103b:	00080907          	.insn	4, 0x00080907
    103f:	0601                	.insn	2, 0x0601
    1041:	097daa03          	lw	s4,151(s11)
    1045:	0008                	.insn	2, 0x0008
    1047:	0501                	.insn	2, 0x0501
    1049:	02d60323          	sb	a3,38(a2)
    104d:	0409                	.insn	2, 0x0409
    104f:	0100                	.insn	2, 0x0100
    1051:	2105                	.insn	2, 0x2105
    1053:	04090003          	lb	zero,64(s2)
    1057:	0100                	.insn	2, 0x0100
    1059:	0505                	.insn	2, 0x0505
    105b:	04090003          	lb	zero,64(s2)
    105f:	0100                	.insn	2, 0x0100
    1061:	0005                	.insn	2, 0x0005
    1063:	0306                	.insn	2, 0x0306
    1065:	00d1                	.insn	2, 0x00d1
    1067:	0409                	.insn	2, 0x0409
    1069:	0100                	.insn	2, 0x0100
    106b:	0a05                	.insn	2, 0x0a05
    106d:	030a                	.insn	2, 0x030a
    106f:	0902                	.insn	2, 0x0902
    1071:	0004                	.insn	2, 0x0004
    1073:	0501                	.insn	2, 0x0501
    1075:	00030617          	auipc	a2,0x30
    1079:	0c09                	.insn	2, 0x0c09
    107b:	0100                	.insn	2, 0x0100
    107d:	1b05                	.insn	2, 0x1b05
    107f:	04090003          	lb	zero,64(s2)
    1083:	0100                	.insn	2, 0x0100
    1085:	2705                	.insn	2, 0x2705
    1087:	04090003          	lb	zero,64(s2)
    108b:	0100                	.insn	2, 0x0100
    108d:	0c05                	.insn	2, 0x0c05
    108f:	0306                	.insn	2, 0x0306
    1091:	0905                	.insn	2, 0x0905
    1093:	000c                	.insn	2, 0x000c
    1095:	0501                	.insn	2, 0x0501
    1097:	097d030b          	.insn	4, 0x097d030b
    109b:	0004                	.insn	2, 0x0004
    109d:	0601                	.insn	2, 0x0601
    109f:	097cd503          	lhu	a0,151(s9)
    10a3:	0004                	.insn	2, 0x0004
    10a5:	0501                	.insn	2, 0x0501
    10a7:	0605                	.insn	2, 0x0605
    10a9:	0903ae03          	lw	t3,144(t2)
    10ad:	0008                	.insn	2, 0x0008
    10af:	0601                	.insn	2, 0x0601
    10b1:	097cd203          	lhu	tp,151(s9)
    10b5:	0008                	.insn	2, 0x0008
    10b7:	0501                	.insn	2, 0x0501
    10b9:	0616                	.insn	2, 0x0616
    10bb:	0903b103          	.insn	4, 0x0903b103
    10bf:	0008                	.insn	2, 0x0008
    10c1:	0601                	.insn	2, 0x0601
    10c3:	097ccf03          	lbu	t5,151(s9)
    10c7:	0004                	.insn	2, 0x0004
    10c9:	0301                	.insn	2, 0x0301
    10cb:	03b1                	.insn	2, 0x03b1
    10cd:	0c09                	.insn	2, 0x0c09
    10cf:	0100                	.insn	2, 0x0100
    10d1:	1b05                	.insn	2, 0x1b05
    10d3:	0306                	.insn	2, 0x0306
    10d5:	0901                	.insn	2, 0x0901
    10d7:	0010                	.insn	2, 0x0010
    10d9:	0301                	.insn	2, 0x0301
    10db:	0901                	.insn	2, 0x0901
    10dd:	0010                	.insn	2, 0x0010
    10df:	0501                	.insn	2, 0x0501
    10e1:	0600                	.insn	2, 0x0600
    10e3:	097ccd03          	lbu	s10,151(s9)
    10e7:	0010                	.insn	2, 0x0010
    10e9:	0501                	.insn	2, 0x0501
    10eb:	060d                	.insn	2, 0x060d
    10ed:	0903b503          	.insn	4, 0x0903b503
    10f1:	0008                	.insn	2, 0x0008
    10f3:	0501                	.insn	2, 0x0501
    10f5:	030c                	.insn	2, 0x030c
    10f7:	0979                	.insn	2, 0x0979
    10f9:	0004                	.insn	2, 0x0004
    10fb:	0501                	.insn	2, 0x0501
    10fd:	0908030f          	.insn	4, 0x0908030f
    1101:	0004                	.insn	2, 0x0004
    1103:	0501                	.insn	2, 0x0501
    1105:	0616                	.insn	2, 0x0616
    1107:	04090003          	lb	zero,64(s2)
    110b:	0100                	.insn	2, 0x0100
    110d:	0505                	.insn	2, 0x0505
    110f:	0306                	.insn	2, 0x0306
    1111:	0978                	.insn	2, 0x0978
    1113:	0004                	.insn	2, 0x0004
    1115:	0301                	.insn	2, 0x0301
    1117:	090a                	.insn	2, 0x090a
    1119:	0008                	.insn	2, 0x0008
    111b:	0501                	.insn	2, 0x0501
    111d:	0300                	.insn	2, 0x0300
    111f:	0905                	.insn	2, 0x0905
    1121:	0004                	.insn	2, 0x0004
    1123:	0501                	.insn	2, 0x0501
    1125:	0a09                	.insn	2, 0x0a09
    1127:	04090103          	lb	sp,64(s2)
    112b:	0100                	.insn	2, 0x0100
    112d:	0105                	.insn	2, 0x0105
    112f:	04090703          	lb	a4,64(s2)
    1133:	0100                	.insn	2, 0x0100
    1135:	0306                	.insn	2, 0x0306
    1137:	08097cbb          	.insn	4, 0x08097cbb
    113b:	0100                	.insn	2, 0x0100
    113d:	0505                	.insn	2, 0x0505
    113f:	0306                	.insn	2, 0x0306
    1141:	03c0                	.insn	2, 0x03c0
    1143:	0809                	.insn	2, 0x0809
    1145:	0100                	.insn	2, 0x0100
    1147:	0306                	.insn	2, 0x0306
    1149:	7cc0                	.insn	2, 0x7cc0
    114b:	0409                	.insn	2, 0x0409
    114d:	0100                	.insn	2, 0x0100
    114f:	0f05                	.insn	2, 0x0f05
    1151:	0306                	.insn	2, 0x0306
    1153:	03c1                	.insn	2, 0x03c1
    1155:	0409                	.insn	2, 0x0409
    1157:	0100                	.insn	2, 0x0100
    1159:	0d05                	.insn	2, 0x0d05
    115b:	0306                	.insn	2, 0x0306
    115d:	0900                	.insn	2, 0x0900
    115f:	0004                	.insn	2, 0x0004
    1161:	0501                	.insn	2, 0x0501
    1163:	7f030627          	.insn	4, 0x7f030627
    1167:	0409                	.insn	2, 0x0409
    1169:	0100                	.insn	2, 0x0100
    116b:	1c05                	.insn	2, 0x1c05
    116d:	0306                	.insn	2, 0x0306
    116f:	0900                	.insn	2, 0x0900
    1171:	0004                	.insn	2, 0x0004
    1173:	0501                	.insn	2, 0x0501
    1175:	0305                	.insn	2, 0x0305
    1177:	0900                	.insn	2, 0x0900
    1179:	0004                	.insn	2, 0x0004
    117b:	0501                	.insn	2, 0x0501
    117d:	01030613          	addi	a2,t1,16 # 9050716 <USER_MAX+0x8b50716>
    1181:	0409                	.insn	2, 0x0409
    1183:	0100                	.insn	2, 0x0100
    1185:	0105                	.insn	2, 0x0105
    1187:	04090403          	lb	s0,64(s2)
    118b:	0100                	.insn	2, 0x0100
    118d:	0505                	.insn	2, 0x0505
    118f:	030a                	.insn	2, 0x030a
    1191:	080900cb          	.insn	4, 0x080900cb
    1195:	0100                	.insn	2, 0x0100
    1197:	0c090803          	lb	a6,192(s2)
    119b:	0100                	.insn	2, 0x0100
    119d:	030a                	.insn	2, 0x030a
    119f:	0906                	.insn	2, 0x0906
    11a1:	0008                	.insn	2, 0x0008
    11a3:	0301                	.insn	2, 0x0301
    11a5:	0908                	.insn	2, 0x0908
    11a7:	000c                	.insn	2, 0x000c
    11a9:	0a01                	.insn	2, 0x0a01
    11ab:	0900e503          	.insn	4, 0x0900e503
    11af:	0008                	.insn	2, 0x0008
    11b1:	0301                	.insn	2, 0x0301
    11b3:	00080907          	.insn	4, 0x00080907
    11b7:	0a01                	.insn	2, 0x0a01
    11b9:	04091c03          	lh	s8,64(s2)
    11bd:	0100                	.insn	2, 0x0100
    11bf:	08090703          	lb	a4,128(s2)
    11c3:	0100                	.insn	2, 0x0100
    11c5:	0409                	.insn	2, 0x0409
    11c7:	0000                	.insn	2, 0x0000
    11c9:	0101                	.insn	2, 0x0101
    11cb:	0505                	.insn	2, 0x0505
    11cd:	000a                	.insn	2, 0x000a
    11cf:	0205                	.insn	2, 0x0205
    11d1:	0000                	.insn	2, 0x0000
    11d3:	0040                	.insn	2, 0x0040
    11d5:	0105bb03          	.insn	4, 0x0105bb03
    11d9:	1c09                	.insn	2, 0x1c09
    11db:	0000                	.insn	2, 0x0000
    11dd:	0101                	.insn	2, 0x0101

000011df <$d.11>:
    11df:	00000dcf          	.insn	4, 0x0dcf
    11e3:	0004                	.insn	2, 0x0004
    11e5:	003a                	.insn	2, 0x003a
    11e7:	0000                	.insn	2, 0x0000
    11e9:	0101                	.insn	2, 0x0101
    11eb:	fb01                	.insn	2, 0xfb01
    11ed:	0d0e                	.insn	2, 0x0d0e
    11ef:	0100                	.insn	2, 0x0100
    11f1:	0101                	.insn	2, 0x0101
    11f3:	0001                	.insn	2, 0x0001
    11f5:	0000                	.insn	2, 0x0000
    11f7:	0001                	.insn	2, 0x0001
    11f9:	0100                	.insn	2, 0x0100
    11fb:	2f2e                	.insn	2, 0x2f2e
    11fd:	00637273          	csrrci	tp,0x6,6
    1201:	6600                	.insn	2, 0x6600
    1203:	7461                	.insn	2, 0x7461
    1205:	632e3233          	.insn	4, 0x632e3233
    1209:	0100                	.insn	2, 0x0100
    120b:	0000                	.insn	2, 0x0000
    120d:	7375                	.insn	2, 0x7375
    120f:	7265                	.insn	2, 0x7265
    1211:	682e                	.insn	2, 0x682e
    1213:	0100                	.insn	2, 0x0100
    1215:	0000                	.insn	2, 0x0000
    1217:	6166                	.insn	2, 0x6166
    1219:	3374                	.insn	2, 0x3374
    121b:	2e32                	.insn	2, 0x2e32
    121d:	0068                	.insn	2, 0x0068
    121f:	0001                	.insn	2, 0x0001
    1221:	0000                	.insn	2, 0x0000
    1223:	0500                	.insn	2, 0x0500
    1225:	1c02                	.insn	2, 0x1c02
    1227:	4014                	.insn	2, 0x4014
    1229:	1a00                	.insn	2, 0x1a00
    122b:	0905                	.insn	2, 0x0905
    122d:	030a                	.insn	2, 0x030a
    122f:	0906                	.insn	2, 0x0906
    1231:	0014                	.insn	2, 0x0014
    1233:	0601                	.insn	2, 0x0601
    1235:	10090003          	lb	zero,256(s2)
    1239:	0100                	.insn	2, 0x0100
    123b:	0306                	.insn	2, 0x0306
    123d:	00040903          	lb	s2,0(s0)
    1241:	0601                	.insn	2, 0x0601
    1243:	14090003          	lb	zero,320(s2)
    1247:	0100                	.insn	2, 0x0100
    1249:	0306                	.insn	2, 0x0306
    124b:	0901                	.insn	2, 0x0901
    124d:	0004                	.insn	2, 0x0004
    124f:	0601                	.insn	2, 0x0601
    1251:	10096d03          	.insn	4, 0x10096d03
    1255:	0100                	.insn	2, 0x0100
    1257:	1805                	.insn	2, 0x1805
    1259:	0306                	.insn	2, 0x0306
    125b:	0918                	.insn	2, 0x0918
    125d:	0008                	.insn	2, 0x0008
    125f:	0501                	.insn	2, 0x0501
    1261:	0314                	.insn	2, 0x0314
    1263:	00e4                	.insn	2, 0x00e4
    1265:	0409                	.insn	2, 0x0409
    1267:	0100                	.insn	2, 0x0100
    1269:	08090203          	lb	tp,128(s2)
    126d:	0100                	.insn	2, 0x0100
    126f:	04097e03          	.insn	4, 0x04097e03
    1273:	0100                	.insn	2, 0x0100
    1275:	1505                	.insn	2, 0x1505
    1277:	04090103          	lb	sp,64(s2)
    127b:	0100                	.insn	2, 0x0100
    127d:	1a05                	.insn	2, 0x1a05
    127f:	0306                	.insn	2, 0x0306
    1281:	0900                	.insn	2, 0x0900
    1283:	0004                	.insn	2, 0x0004
    1285:	0501                	.insn	2, 0x0501
    1287:	061f 7f03 0409      	.insn	6, 0x04097f03061f
    128d:	0100                	.insn	2, 0x0100
    128f:	0905                	.insn	2, 0x0905
    1291:	097f9e03          	lh	t3,151(t6)
    1295:	0004                	.insn	2, 0x0004
    1297:	0601                	.insn	2, 0x0601
    1299:	14090003          	lb	zero,320(s2)
    129d:	0100                	.insn	2, 0x0100
    129f:	04096603          	.insn	4, 0x04096603
    12a3:	0100                	.insn	2, 0x0100
    12a5:	0505                	.insn	2, 0x0505
    12a7:	0306                	.insn	2, 0x0306
    12a9:	091d                	.insn	2, 0x091d
    12ab:	0004                	.insn	2, 0x0004
    12ad:	0601                	.insn	2, 0x0601
    12af:	10096303          	.insn	4, 0x10096303
    12b3:	0100                	.insn	2, 0x0100
    12b5:	08091d03          	lh	s10,128(s2)
    12b9:	0100                	.insn	2, 0x0100
    12bb:	1105                	.insn	2, 0x1105
    12bd:	0306                	.insn	2, 0x0306
    12bf:	0905                	.insn	2, 0x0905
    12c1:	0008                	.insn	2, 0x0008
    12c3:	0501                	.insn	2, 0x0501
    12c5:	0609                	.insn	2, 0x0609
    12c7:	04090003          	lb	zero,64(s2)
    12cb:	0100                	.insn	2, 0x0100
    12cd:	0505                	.insn	2, 0x0505
    12cf:	0306                	.insn	2, 0x0306
    12d1:	0008097b          	.insn	4, 0x0008097b
    12d5:	0301                	.insn	2, 0x0301
    12d7:	0908                	.insn	2, 0x0908
    12d9:	0008                	.insn	2, 0x0008
    12db:	0601                	.insn	2, 0x0601
    12dd:	0c095b03          	lhu	s6,192(s2)
    12e1:	0100                	.insn	2, 0x0100
    12e3:	0105                	.insn	2, 0x0105
    12e5:	0b06                	.insn	2, 0x0b06
    12e7:	10092803          	lw	a6,256(s2)
    12eb:	0100                	.insn	2, 0x0100
    12ed:	0005                	.insn	2, 0x0005
    12ef:	0900da03          	lhu	s4,144(ra)
    12f3:	0008                	.insn	2, 0x0008
    12f5:	0501                	.insn	2, 0x0501
    12f7:	0a09                	.insn	2, 0x0a09
    12f9:	14090303          	lb	t1,320(s2)
    12fd:	0100                	.insn	2, 0x0100
    12ff:	0306                	.insn	2, 0x0306
    1301:	18097efb          	.insn	4, 0x18097efb
    1305:	0100                	.insn	2, 0x0100
    1307:	09018503          	lb	a0,144(gp)
    130b:	0004                	.insn	2, 0x0004
    130d:	0501                	.insn	2, 0x0501
    130f:	0614                	.insn	2, 0x0614
    1311:	04090503          	lb	a0,64(s2)
    1315:	0100                	.insn	2, 0x0100
    1317:	04097f03          	.insn	4, 0x04097f03
    131b:	0100                	.insn	2, 0x0100
    131d:	04090203          	lb	tp,64(s2)
    1321:	0100                	.insn	2, 0x0100
    1323:	0a05                	.insn	2, 0x0a05
    1325:	04090103          	lb	sp,64(s2)
    1329:	0100                	.insn	2, 0x0100
    132b:	1f05                	.insn	2, 0x1f05
    132d:	04097e03          	.insn	4, 0x04097e03
    1331:	0100                	.insn	2, 0x0100
    1333:	2005                	.insn	2, 0x2005
    1335:	04097f03          	.insn	4, 0x04097f03
    1339:	0100                	.insn	2, 0x0100
    133b:	1f05                	.insn	2, 0x1f05
    133d:	04090203          	lb	tp,64(s2)
    1341:	0100                	.insn	2, 0x0100
    1343:	04090103          	lb	sp,64(s2)
    1347:	0100                	.insn	2, 0x0100
    1349:	2505                	.insn	2, 0x2505
    134b:	04097e03          	.insn	4, 0x04097e03
    134f:	0100                	.insn	2, 0x0100
    1351:	2605                	.insn	2, 0x2605
    1353:	04090103          	lb	sp,64(s2)
    1357:	0100                	.insn	2, 0x0100
    1359:	1605                	.insn	2, 0x1605
    135b:	04097d03          	.insn	4, 0x04097d03
    135f:	0100                	.insn	2, 0x0100
    1361:	0905                	.insn	2, 0x0905
    1363:	08090603          	lb	a2,128(s2)
    1367:	0100                	.insn	2, 0x0100
    1369:	0306                	.insn	2, 0x0306
    136b:	0900                	.insn	2, 0x0900
    136d:	000c                	.insn	2, 0x000c
    136f:	0501                	.insn	2, 0x0501
    1371:	0614                	.insn	2, 0x0614
    1373:	04090403          	lb	s0,64(s2)
    1377:	0100                	.insn	2, 0x0100
    1379:	08090103          	lb	sp,128(s2)
    137d:	0100                	.insn	2, 0x0100
    137f:	04097f03          	.insn	4, 0x04097f03
    1383:	0100                	.insn	2, 0x0100
    1385:	1c05                	.insn	2, 0x1c05
    1387:	08090103          	lb	sp,128(s2)
    138b:	0100                	.insn	2, 0x0100
    138d:	1d05                	.insn	2, 0x1d05
    138f:	04097f03          	.insn	4, 0x04097f03
    1393:	0100                	.insn	2, 0x0100
    1395:	1405                	.insn	2, 0x1405
    1397:	04090803          	lb	a6,64(s2)
    139b:	0100                	.insn	2, 0x0100
    139d:	04097f03          	.insn	4, 0x04097f03
    13a1:	0100                	.insn	2, 0x0100
    13a3:	04090203          	lb	tp,64(s2)
    13a7:	0100                	.insn	2, 0x0100
    13a9:	0a05                	.insn	2, 0x0a05
    13ab:	04090103          	lb	sp,64(s2)
    13af:	0100                	.insn	2, 0x0100
    13b1:	1c05                	.insn	2, 0x1c05
    13b3:	04097e03          	.insn	4, 0x04097e03
    13b7:	0100                	.insn	2, 0x0100
    13b9:	1d05                	.insn	2, 0x1d05
    13bb:	04097f03          	.insn	4, 0x04097f03
    13bf:	0100                	.insn	2, 0x0100
    13c1:	1c05                	.insn	2, 0x1c05
    13c3:	04090203          	lb	tp,64(s2)
    13c7:	0100                	.insn	2, 0x0100
    13c9:	04090103          	lb	sp,64(s2)
    13cd:	0100                	.insn	2, 0x0100
    13cf:	1305                	.insn	2, 0x1305
    13d1:	04090303          	lb	t1,64(s2)
    13d5:	0100                	.insn	2, 0x0100
    13d7:	2205                	.insn	2, 0x2205
    13d9:	04097b03          	.insn	4, 0x04097b03
    13dd:	0100                	.insn	2, 0x0100
    13df:	2305                	.insn	2, 0x2305
    13e1:	04090103          	lb	sp,64(s2)
    13e5:	0100                	.insn	2, 0x0100
    13e7:	2105                	.insn	2, 0x2105
    13e9:	04090303          	lb	t1,64(s2)
    13ed:	0100                	.insn	2, 0x0100
    13ef:	1405                	.insn	2, 0x1405
    13f1:	08090503          	lb	a0,128(s2)
    13f5:	0100                	.insn	2, 0x0100
    13f7:	04097f03          	.insn	4, 0x04097f03
    13fb:	0100                	.insn	2, 0x0100
    13fd:	04090203          	lb	tp,64(s2)
    1401:	0100                	.insn	2, 0x0100
    1403:	0a05                	.insn	2, 0x0a05
    1405:	04090103          	lb	sp,64(s2)
    1409:	0100                	.insn	2, 0x0100
    140b:	1c05                	.insn	2, 0x1c05
    140d:	04097e03          	.insn	4, 0x04097e03
    1411:	0100                	.insn	2, 0x0100
    1413:	1d05                	.insn	2, 0x1d05
    1415:	04097f03          	.insn	4, 0x04097f03
    1419:	0100                	.insn	2, 0x0100
    141b:	1c05                	.insn	2, 0x1c05
    141d:	04090203          	lb	tp,64(s2)
    1421:	0100                	.insn	2, 0x0100
    1423:	04090103          	lb	sp,64(s2)
    1427:	0100                	.insn	2, 0x0100
    1429:	2205                	.insn	2, 0x2205
    142b:	04097e03          	.insn	4, 0x04097e03
    142f:	0100                	.insn	2, 0x0100
    1431:	1105                	.insn	2, 0x1105
    1433:	04090503          	lb	a0,64(s2)
    1437:	0100                	.insn	2, 0x0100
    1439:	1305                	.insn	2, 0x1305
    143b:	04096e03          	.insn	4, 0x04096e03
    143f:	0100                	.insn	2, 0x0100
    1441:	2305                	.insn	2, 0x2305
    1443:	04090e03          	lb	t3,64(s2)
    1447:	0100                	.insn	2, 0x0100
    1449:	1a05                	.insn	2, 0x1a05
    144b:	04097d03          	.insn	4, 0x04097d03
    144f:	0100                	.insn	2, 0x0100
    1451:	04090703          	lb	a4,64(s2)
    1455:	0100                	.insn	2, 0x0100
    1457:	1705                	.insn	2, 0x1705
    1459:	04097f03          	.insn	4, 0x04097f03
    145d:	0100                	.insn	2, 0x0100
    145f:	2705                	.insn	2, 0x2705
    1461:	04090403          	lb	s0,64(s2)
    1465:	0100                	.insn	2, 0x0100
    1467:	1b05                	.insn	2, 0x1b05
    1469:	0306                	.insn	2, 0x0306
    146b:	0900                	.insn	2, 0x0900
    146d:	0004                	.insn	2, 0x0004
    146f:	0501                	.insn	2, 0x0501
    1471:	0618                	.insn	2, 0x0618
    1473:	04097f03          	.insn	4, 0x04097f03
    1477:	0100                	.insn	2, 0x0100
    1479:	0105                	.insn	2, 0x0105
    147b:	04090403          	lb	s0,64(s2)
    147f:	0100                	.insn	2, 0x0100
    1481:	0306                	.insn	2, 0x0306
    1483:	7ed2                	.insn	2, 0x7ed2
    1485:	1009                	.insn	2, 0x1009
    1487:	0100                	.insn	2, 0x0100
    1489:	01ae030b          	.insn	4, 0x01ae030b
    148d:	0409                	.insn	2, 0x0409
    148f:	0100                	.insn	2, 0x0100
    1491:	0005                	.insn	2, 0x0005
    1493:	0306                	.insn	2, 0x0306
    1495:	7f80                	.insn	2, 0x7f80
    1497:	0809                	.insn	2, 0x0809
    1499:	0100                	.insn	2, 0x0100
    149b:	0905                	.insn	2, 0x0905
    149d:	030a                	.insn	2, 0x030a
    149f:	00400903          	lb	s2,4(zero) # 4 <$d.10+0x4>
    14a3:	0601                	.insn	2, 0x0601
    14a5:	08094f03          	lbu	t5,128(s2)
    14a9:	0100                	.insn	2, 0x0100
    14ab:	04093103          	.insn	4, 0x04093103
    14af:	0100                	.insn	2, 0x0100
    14b1:	2005                	.insn	2, 0x2005
    14b3:	0306                	.insn	2, 0x0306
    14b5:	0904                	.insn	2, 0x0904
    14b7:	0004                	.insn	2, 0x0004
    14b9:	0501                	.insn	2, 0x0501
    14bb:	0314                	.insn	2, 0x0314
    14bd:	00c9                	.insn	2, 0x00c9
    14bf:	0c09                	.insn	2, 0x0c09
    14c1:	0100                	.insn	2, 0x0100
    14c3:	04097e03          	.insn	4, 0x04097e03
    14c7:	0100                	.insn	2, 0x0100
    14c9:	1505                	.insn	2, 0x1505
    14cb:	04090103          	lb	sp,64(s2)
    14cf:	0100                	.insn	2, 0x0100
    14d1:	1a05                	.insn	2, 0x1a05
    14d3:	0306                	.insn	2, 0x0306
    14d5:	0900                	.insn	2, 0x0900
    14d7:	0004                	.insn	2, 0x0004
    14d9:	0501                	.insn	2, 0x0501
    14db:	061f 7f03 0409      	.insn	6, 0x04097f03061f
    14e1:	0100                	.insn	2, 0x0100
    14e3:	0905                	.insn	2, 0x0905
    14e5:	097fbb03          	.insn	4, 0x097fbb03
    14e9:	0004                	.insn	2, 0x0004
    14eb:	0601                	.insn	2, 0x0601
    14ed:	14090003          	lb	zero,320(s2)
    14f1:	0100                	.insn	2, 0x0100
    14f3:	0105                	.insn	2, 0x0105
    14f5:	0306                	.insn	2, 0x0306
    14f7:	00c1                	.insn	2, 0x00c1
    14f9:	0409                	.insn	2, 0x0409
    14fb:	0100                	.insn	2, 0x0100
    14fd:	0306                	.insn	2, 0x0306
    14ff:	7f88                	.insn	2, 0x7f88
    1501:	0c09                	.insn	2, 0x0c09
    1503:	0100                	.insn	2, 0x0100
    1505:	00f8030b          	.insn	4, 0x00f8030b
    1509:	2809                	.insn	2, 0x2809
    150b:	0100                	.insn	2, 0x0100
    150d:	097f8803          	lb	a6,151(t6)
    1511:	0008                	.insn	2, 0x0008
    1513:	0501                	.insn	2, 0x0501
    1515:	0620                	.insn	2, 0x0620
    1517:	0900da03          	lhu	s4,144(ra)
    151b:	001c                	.insn	2, 0x001c
    151d:	0501                	.insn	2, 0x0501
    151f:	0615                	.insn	2, 0x0615
    1521:	04090003          	lb	zero,64(s2)
    1525:	0100                	.insn	2, 0x0100
    1527:	2405                	.insn	2, 0x2405
    1529:	04090003          	lb	zero,64(s2)
    152d:	0100                	.insn	2, 0x0100
    152f:	0905                	.insn	2, 0x0905
    1531:	0306                	.insn	2, 0x0306
    1533:	0904                	.insn	2, 0x0904
    1535:	0004                	.insn	2, 0x0004
    1537:	0501                	.insn	2, 0x0501
    1539:	0616                	.insn	2, 0x0616
    153b:	04090003          	lb	zero,64(s2)
    153f:	0100                	.insn	2, 0x0100
    1541:	0d05                	.insn	2, 0x0d05
    1543:	0306                	.insn	2, 0x0306
    1545:	0902                	.insn	2, 0x0902
    1547:	0004                	.insn	2, 0x0004
    1549:	0601                	.insn	2, 0x0601
    154b:	10090003          	lb	zero,256(s2)
    154f:	0100                	.insn	2, 0x0100
    1551:	1705                	.insn	2, 0x1705
    1553:	0306                	.insn	2, 0x0306
    1555:	095a                	.insn	2, 0x095a
    1557:	0004                	.insn	2, 0x0004
    1559:	0501                	.insn	2, 0x0501
    155b:	0605                	.insn	2, 0x0605
    155d:	08090003          	lb	zero,128(s2)
    1561:	0100                	.insn	2, 0x0100
    1563:	0d05                	.insn	2, 0x0d05
    1565:	0306                	.insn	2, 0x0306
    1567:	0905                	.insn	2, 0x0905
    1569:	0004                	.insn	2, 0x0004
    156b:	0601                	.insn	2, 0x0601
    156d:	04090003          	lb	zero,64(s2)
    1571:	0100                	.insn	2, 0x0100
    1573:	0306                	.insn	2, 0x0306
    1575:	0908                	.insn	2, 0x0908
    1577:	0008                	.insn	2, 0x0008
    1579:	0601                	.insn	2, 0x0601
    157b:	04090003          	lb	zero,64(s2)
    157f:	0100                	.insn	2, 0x0100
    1581:	1105                	.insn	2, 0x1105
    1583:	0306                	.insn	2, 0x0306
    1585:	0908                	.insn	2, 0x0908
    1587:	0004                	.insn	2, 0x0004
    1589:	0601                	.insn	2, 0x0601
    158b:	097fb103          	.insn	4, 0x097fb103
    158f:	0004                	.insn	2, 0x0004
    1591:	0301                	.insn	2, 0x0301
    1593:	040900cf          	.insn	4, 0x040900cf
    1597:	0100                	.insn	2, 0x0100
    1599:	04090003          	lb	zero,64(s2)
    159d:	0100                	.insn	2, 0x0100
    159f:	2005                	.insn	2, 0x2005
    15a1:	0306                	.insn	2, 0x0306
    15a3:	0901                	.insn	2, 0x0901
    15a5:	0008                	.insn	2, 0x0008
    15a7:	0501                	.insn	2, 0x0501
    15a9:	0311                	.insn	2, 0x0311
    15ab:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    15b3:	0409 
    15b5:	0100                	.insn	2, 0x0100
    15b7:	0306                	.insn	2, 0x0306
    15b9:	0901                	.insn	2, 0x0901
    15bb:	0004                	.insn	2, 0x0004
    15bd:	0501                	.insn	2, 0x0501
    15bf:	061c                	.insn	2, 0x061c
    15c1:	04090003          	lb	zero,64(s2)
    15c5:	0100                	.insn	2, 0x0100
    15c7:	2005                	.insn	2, 0x2005
    15c9:	04090003          	lb	zero,64(s2)
    15cd:	0100                	.insn	2, 0x0100
    15cf:	1105                	.insn	2, 0x1105
    15d1:	0306                	.insn	2, 0x0306
    15d3:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    15db:	0409 
    15dd:	0100                	.insn	2, 0x0100
    15df:	04090003          	lb	zero,64(s2)
    15e3:	0100                	.insn	2, 0x0100
    15e5:	04090003          	lb	zero,64(s2)
    15e9:	0100                	.insn	2, 0x0100
    15eb:	04090003          	lb	zero,64(s2)
    15ef:	0100                	.insn	2, 0x0100
    15f1:	04090003          	lb	zero,64(s2)
    15f5:	0100                	.insn	2, 0x0100
    15f7:	04090003          	lb	zero,64(s2)
    15fb:	0100                	.insn	2, 0x0100
    15fd:	04090003          	lb	zero,64(s2)
    1601:	0100                	.insn	2, 0x0100
    1603:	04090003          	lb	zero,64(s2)
    1607:	0100                	.insn	2, 0x0100
    1609:	04090003          	lb	zero,64(s2)
    160d:	0100                	.insn	2, 0x0100
    160f:	04090003          	lb	zero,64(s2)
    1613:	0100                	.insn	2, 0x0100
    1615:	04090003          	lb	zero,64(s2)
    1619:	0100                	.insn	2, 0x0100
    161b:	0d05                	.insn	2, 0x0d05
    161d:	0306                	.insn	2, 0x0306
    161f:	0905                	.insn	2, 0x0905
    1621:	0004                	.insn	2, 0x0004
    1623:	0601                	.insn	2, 0x0601
    1625:	04090003          	lb	zero,64(s2)
    1629:	0100                	.insn	2, 0x0100
    162b:	1105                	.insn	2, 0x1105
    162d:	0306                	.insn	2, 0x0306
    162f:	097c                	.insn	2, 0x097c
    1631:	0008                	.insn	2, 0x0008
    1633:	0501                	.insn	2, 0x0501
    1635:	061c                	.insn	2, 0x061c
    1637:	04090003          	lb	zero,64(s2)
    163b:	0100                	.insn	2, 0x0100
    163d:	2005                	.insn	2, 0x2005
    163f:	04090003          	lb	zero,64(s2)
    1643:	0100                	.insn	2, 0x0100
    1645:	1105                	.insn	2, 0x1105
    1647:	0306                	.insn	2, 0x0306
    1649:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    1651:	0409 
    1653:	0100                	.insn	2, 0x0100
    1655:	0306                	.insn	2, 0x0306
    1657:	0901                	.insn	2, 0x0901
    1659:	0004                	.insn	2, 0x0004
    165b:	0501                	.insn	2, 0x0501
    165d:	061c                	.insn	2, 0x061c
    165f:	04090003          	lb	zero,64(s2)
    1663:	0100                	.insn	2, 0x0100
    1665:	2005                	.insn	2, 0x2005
    1667:	04090003          	lb	zero,64(s2)
    166b:	0100                	.insn	2, 0x0100
    166d:	1105                	.insn	2, 0x1105
    166f:	0306                	.insn	2, 0x0306
    1671:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    1679:	0409 
    167b:	0100                	.insn	2, 0x0100
    167d:	0306                	.insn	2, 0x0306
    167f:	0901                	.insn	2, 0x0901
    1681:	0004                	.insn	2, 0x0004
    1683:	0501                	.insn	2, 0x0501
    1685:	061c                	.insn	2, 0x061c
    1687:	04090003          	lb	zero,64(s2)
    168b:	0100                	.insn	2, 0x0100
    168d:	2005                	.insn	2, 0x2005
    168f:	04090003          	lb	zero,64(s2)
    1693:	0100                	.insn	2, 0x0100
    1695:	1105                	.insn	2, 0x1105
    1697:	0306                	.insn	2, 0x0306
    1699:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    16a1:	0409 
    16a3:	0100                	.insn	2, 0x0100
    16a5:	0306                	.insn	2, 0x0306
    16a7:	0901                	.insn	2, 0x0901
    16a9:	0004                	.insn	2, 0x0004
    16ab:	0501                	.insn	2, 0x0501
    16ad:	061c                	.insn	2, 0x061c
    16af:	04090003          	lb	zero,64(s2)
    16b3:	0100                	.insn	2, 0x0100
    16b5:	2005                	.insn	2, 0x2005
    16b7:	04090003          	lb	zero,64(s2)
    16bb:	0100                	.insn	2, 0x0100
    16bd:	1105                	.insn	2, 0x1105
    16bf:	0306                	.insn	2, 0x0306
    16c1:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    16c9:	0409 
    16cb:	0100                	.insn	2, 0x0100
    16cd:	0306                	.insn	2, 0x0306
    16cf:	0901                	.insn	2, 0x0901
    16d1:	0004                	.insn	2, 0x0004
    16d3:	0501                	.insn	2, 0x0501
    16d5:	061c                	.insn	2, 0x061c
    16d7:	04090003          	lb	zero,64(s2)
    16db:	0100                	.insn	2, 0x0100
    16dd:	2005                	.insn	2, 0x2005
    16df:	04090003          	lb	zero,64(s2)
    16e3:	0100                	.insn	2, 0x0100
    16e5:	1105                	.insn	2, 0x1105
    16e7:	0306                	.insn	2, 0x0306
    16e9:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    16f1:	0409 
    16f3:	0100                	.insn	2, 0x0100
    16f5:	0306                	.insn	2, 0x0306
    16f7:	0901                	.insn	2, 0x0901
    16f9:	0004                	.insn	2, 0x0004
    16fb:	0501                	.insn	2, 0x0501
    16fd:	061c                	.insn	2, 0x061c
    16ff:	04090003          	lb	zero,64(s2)
    1703:	0100                	.insn	2, 0x0100
    1705:	2005                	.insn	2, 0x2005
    1707:	04090003          	lb	zero,64(s2)
    170b:	0100                	.insn	2, 0x0100
    170d:	0d05                	.insn	2, 0x0d05
    170f:	0306                	.insn	2, 0x0306
    1711:	0904                	.insn	2, 0x0904
    1713:	0004                	.insn	2, 0x0004
    1715:	0601                	.insn	2, 0x0601
    1717:	04090003          	lb	zero,64(s2)
    171b:	0100                	.insn	2, 0x0100
    171d:	1505                	.insn	2, 0x1505
    171f:	0306                	.insn	2, 0x0306
    1721:	0905                	.insn	2, 0x0905
    1723:	0004                	.insn	2, 0x0004
    1725:	0501                	.insn	2, 0x0501
    1727:	030d                	.insn	2, 0x030d
    1729:	097d                	.insn	2, 0x097d
    172b:	0004                	.insn	2, 0x0004
    172d:	0501                	.insn	2, 0x0501
    172f:	061c                	.insn	2, 0x061c
    1731:	04090003          	lb	zero,64(s2)
    1735:	0100                	.insn	2, 0x0100
    1737:	2005                	.insn	2, 0x2005
    1739:	0306                	.insn	2, 0x0306
    173b:	0904                	.insn	2, 0x0904
    173d:	0004                	.insn	2, 0x0004
    173f:	0501                	.insn	2, 0x0501
    1741:	0624                	.insn	2, 0x0624
    1743:	04090003          	lb	zero,64(s2)
    1747:	0100                	.insn	2, 0x0100
    1749:	1505                	.insn	2, 0x1505
    174b:	0306                	.insn	2, 0x0306
    174d:	097f 0004 0301 0901 	.insn	10, 0x0004090103010004097f
    1755:	0004 
    1757:	0501                	.insn	2, 0x0501
    1759:	0620                	.insn	2, 0x0620
    175b:	04090003          	lb	zero,64(s2)
    175f:	0100                	.insn	2, 0x0100
    1761:	2405                	.insn	2, 0x2405
    1763:	04090003          	lb	zero,64(s2)
    1767:	0100                	.insn	2, 0x0100
    1769:	1505                	.insn	2, 0x1505
    176b:	0306                	.insn	2, 0x0306
    176d:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    1775:	0409 
    1777:	0100                	.insn	2, 0x0100
    1779:	097fa703          	lw	a4,151(t6)
    177d:	0004                	.insn	2, 0x0004
    177f:	0501                	.insn	2, 0x0501
    1781:	0612                	.insn	2, 0x0612
    1783:	0900e403          	.insn	4, 0x0900e403
    1787:	000c                	.insn	2, 0x000c
    1789:	0501                	.insn	2, 0x0501
    178b:	031c                	.insn	2, 0x031c
    178d:	097f 0004 0301 0904 	.insn	10, 0x0004090403010004097f
    1795:	0004 
    1797:	0301                	.insn	2, 0x0301
    1799:	0901                	.insn	2, 0x0901
    179b:	0004                	.insn	2, 0x0004
    179d:	0501                	.insn	2, 0x0501
    179f:	0318                	.insn	2, 0x0318
    17a1:	00040903          	lb	s2,0(s0)
    17a5:	0501                	.insn	2, 0x0501
    17a7:	097c0323          	sb	s7,134(s8)
    17ab:	0008                	.insn	2, 0x0008
    17ad:	0501                	.insn	2, 0x0501
    17af:	0322                	.insn	2, 0x0322
    17b1:	0901                	.insn	2, 0x0901
    17b3:	0004                	.insn	2, 0x0004
    17b5:	0501                	.insn	2, 0x0501
    17b7:	0318                	.insn	2, 0x0318
    17b9:	00040903          	lb	s2,0(s0)
    17bd:	0501                	.insn	2, 0x0501
    17bf:	061f 0003 0409      	.insn	6, 0x04090003061f
    17c5:	0100                	.insn	2, 0x0100
    17c7:	1605                	.insn	2, 0x1605
    17c9:	0306                	.insn	2, 0x0306
    17cb:	097f 0004 0501 031c 	.insn	10, 0x0905031c05010004097f
    17d3:	0905 
    17d5:	0004                	.insn	2, 0x0004
    17d7:	0301                	.insn	2, 0x0301
    17d9:	097f 0004 0301 0902 	.insn	10, 0x0004090203010004097f
    17e1:	0004 
    17e3:	0501                	.insn	2, 0x0501
    17e5:	0312                	.insn	2, 0x0312
    17e7:	0901                	.insn	2, 0x0901
    17e9:	0004                	.insn	2, 0x0004
    17eb:	0501                	.insn	2, 0x0501
    17ed:	0322                	.insn	2, 0x0322
    17ef:	097e                	.insn	2, 0x097e
    17f1:	0004                	.insn	2, 0x0004
    17f3:	0501                	.insn	2, 0x0501
    17f5:	097f0323          	sb	s7,134(t5) # 9e086 <$d.5+0x9c895>
    17f9:	0004                	.insn	2, 0x0004
    17fb:	0501                	.insn	2, 0x0501
    17fd:	0322                	.insn	2, 0x0322
    17ff:	0902                	.insn	2, 0x0902
    1801:	0004                	.insn	2, 0x0004
    1803:	0301                	.insn	2, 0x0301
    1805:	0901                	.insn	2, 0x0901
    1807:	0004                	.insn	2, 0x0004
    1809:	0501                	.insn	2, 0x0501
    180b:	0328                	.insn	2, 0x0328
    180d:	097e                	.insn	2, 0x097e
    180f:	0004                	.insn	2, 0x0004
    1811:	0501                	.insn	2, 0x0501
    1813:	0329                	.insn	2, 0x0329
    1815:	0901                	.insn	2, 0x0901
    1817:	0004                	.insn	2, 0x0004
    1819:	0501                	.insn	2, 0x0501
    181b:	097d0313          	addi	t1,s10,151
    181f:	0004                	.insn	2, 0x0004
    1821:	0501                	.insn	2, 0x0501
    1823:	0a14                	.insn	2, 0x0a14
    1825:	08090f03          	lb	t5,128(s2)
    1829:	0100                	.insn	2, 0x0100
    182b:	08090203          	lb	tp,128(s2)
    182f:	0100                	.insn	2, 0x0100
    1831:	04097e03          	.insn	4, 0x04097e03
    1835:	0100                	.insn	2, 0x0100
    1837:	1505                	.insn	2, 0x1505
    1839:	04090103          	lb	sp,64(s2)
    183d:	0100                	.insn	2, 0x0100
    183f:	1a05                	.insn	2, 0x1a05
    1841:	0306                	.insn	2, 0x0306
    1843:	0900                	.insn	2, 0x0900
    1845:	0004                	.insn	2, 0x0004
    1847:	0501                	.insn	2, 0x0501
    1849:	061f 7f03 0409      	.insn	6, 0x04097f03061f
    184f:	0100                	.insn	2, 0x0100
    1851:	0505                	.insn	2, 0x0505
    1853:	0306                	.insn	2, 0x0306
    1855:	0900                	.insn	2, 0x0900
    1857:	0004                	.insn	2, 0x0004
    1859:	0501                	.insn	2, 0x0501
    185b:	0600                	.insn	2, 0x0600
    185d:	04093503          	.insn	4, 0x04093503
    1861:	0100                	.insn	2, 0x0100
    1863:	0905                	.insn	2, 0x0905
    1865:	030a                	.insn	2, 0x030a
    1867:	002c0903          	lb	s2,2(s8)
    186b:	0601                	.insn	2, 0x0601
    186d:	08090003          	lb	zero,128(s2)
    1871:	0100                	.insn	2, 0x0100
    1873:	2005                	.insn	2, 0x2005
    1875:	0306                	.insn	2, 0x0306
    1877:	0904                	.insn	2, 0x0904
    1879:	0004                	.insn	2, 0x0004
    187b:	0501                	.insn	2, 0x0501
    187d:	0314                	.insn	2, 0x0314
    187f:	0946                	.insn	2, 0x0946
    1881:	000c                	.insn	2, 0x000c
    1883:	0301                	.insn	2, 0x0301
    1885:	097e                	.insn	2, 0x097e
    1887:	0004                	.insn	2, 0x0004
    1889:	0501                	.insn	2, 0x0501
    188b:	0315                	.insn	2, 0x0315
    188d:	0901                	.insn	2, 0x0901
    188f:	0004                	.insn	2, 0x0004
    1891:	0501                	.insn	2, 0x0501
    1893:	061a                	.insn	2, 0x061a
    1895:	04090003          	lb	zero,64(s2)
    1899:	0100                	.insn	2, 0x0100
    189b:	1f05                	.insn	2, 0x1f05
    189d:	0306                	.insn	2, 0x0306
    189f:	097f 0004 0501 0309 	.insn	10, 0x093e030905010004097f
    18a7:	093e 
    18a9:	0004                	.insn	2, 0x0004
    18ab:	0601                	.insn	2, 0x0601
    18ad:	14090003          	lb	zero,320(s2)
    18b1:	0100                	.insn	2, 0x0100
    18b3:	097ec603          	lbu	a2,151(t4)
    18b7:	0004                	.insn	2, 0x0004
    18b9:	0501                	.insn	2, 0x0501
    18bb:	0601                	.insn	2, 0x0601
    18bd:	01f5030b          	.insn	4, 0x01f5030b
    18c1:	2809                	.insn	2, 0x2809
    18c3:	0100                	.insn	2, 0x0100
    18c5:	0306                	.insn	2, 0x0306
    18c7:	08097e8b          	.insn	4, 0x08097e8b
    18cb:	0100                	.insn	2, 0x0100
    18cd:	1405                	.insn	2, 0x1405
    18cf:	0306                	.insn	2, 0x0306
    18d1:	00fe                	.insn	2, 0x00fe
    18d3:	2809                	.insn	2, 0x2809
    18d5:	0100                	.insn	2, 0x0100
    18d7:	04097e03          	.insn	4, 0x04097e03
    18db:	0100                	.insn	2, 0x0100
    18dd:	1505                	.insn	2, 0x1505
    18df:	04090103          	lb	sp,64(s2)
    18e3:	0100                	.insn	2, 0x0100
    18e5:	1a05                	.insn	2, 0x1a05
    18e7:	0306                	.insn	2, 0x0306
    18e9:	0900                	.insn	2, 0x0900
    18eb:	0004                	.insn	2, 0x0004
    18ed:	0501                	.insn	2, 0x0501
    18ef:	061f 7f03 0409      	.insn	6, 0x04097f03061f
    18f5:	0100                	.insn	2, 0x0100
    18f7:	1805                	.insn	2, 0x1805
    18f9:	0900ef03          	.insn	4, 0x0900ef03
    18fd:	0004                	.insn	2, 0x0004
    18ff:	0301                	.insn	2, 0x0301
    1901:	097f 0004 0301 0902 	.insn	10, 0x0004090203010004097f
    1909:	0004 
    190b:	0501                	.insn	2, 0x0501
    190d:	030e                	.insn	2, 0x030e
    190f:	0901                	.insn	2, 0x0901
    1911:	0004                	.insn	2, 0x0004
    1913:	0501                	.insn	2, 0x0501
    1915:	031e                	.insn	2, 0x031e
    1917:	097e                	.insn	2, 0x097e
    1919:	0004                	.insn	2, 0x0004
    191b:	0501                	.insn	2, 0x0501
    191d:	031f 097f 0004      	.insn	6, 0x0004097f031f
    1923:	0501                	.insn	2, 0x0501
    1925:	031e                	.insn	2, 0x031e
    1927:	0902                	.insn	2, 0x0902
    1929:	0004                	.insn	2, 0x0004
    192b:	0301                	.insn	2, 0x0301
    192d:	0901                	.insn	2, 0x0901
    192f:	0004                	.insn	2, 0x0004
    1931:	0501                	.insn	2, 0x0501
    1933:	0324                	.insn	2, 0x0324
    1935:	097e                	.insn	2, 0x097e
    1937:	0004                	.insn	2, 0x0004
    1939:	0501                	.insn	2, 0x0501
    193b:	0325                	.insn	2, 0x0325
    193d:	0901                	.insn	2, 0x0901
    193f:	0004                	.insn	2, 0x0004
    1941:	0501                	.insn	2, 0x0501
    1943:	0309                	.insn	2, 0x0309
    1945:	0904                	.insn	2, 0x0904
    1947:	0004                	.insn	2, 0x0004
    1949:	0501                	.insn	2, 0x0501
    194b:	094d0317          	auipc	t1,0x94d0
    194f:	000c                	.insn	2, 0x000c
    1951:	0501                	.insn	2, 0x0501
    1953:	0605                	.insn	2, 0x0605
    1955:	08090003          	lb	zero,128(s2)
    1959:	0100                	.insn	2, 0x0100
    195b:	0d05                	.insn	2, 0x0d05
    195d:	0306                	.insn	2, 0x0306
    195f:	0904                	.insn	2, 0x0904
    1961:	0004                	.insn	2, 0x0004
    1963:	0601                	.insn	2, 0x0601
    1965:	04090003          	lb	zero,64(s2)
    1969:	0100                	.insn	2, 0x0100
    196b:	0306                	.insn	2, 0x0306
    196d:	0906                	.insn	2, 0x0906
    196f:	0008                	.insn	2, 0x0008
    1971:	0601                	.insn	2, 0x0601
    1973:	04090003          	lb	zero,64(s2)
    1977:	0100                	.insn	2, 0x0100
    1979:	1105                	.insn	2, 0x1105
    197b:	0306                	.insn	2, 0x0306
    197d:	0904                	.insn	2, 0x0904
    197f:	0004                	.insn	2, 0x0004
    1981:	0601                	.insn	2, 0x0601
    1983:	04090003          	lb	zero,64(s2)
    1987:	0100                	.insn	2, 0x0100
    1989:	04090003          	lb	zero,64(s2)
    198d:	0100                	.insn	2, 0x0100
    198f:	04090003          	lb	zero,64(s2)
    1993:	0100                	.insn	2, 0x0100
    1995:	04090003          	lb	zero,64(s2)
    1999:	0100                	.insn	2, 0x0100
    199b:	04090003          	lb	zero,64(s2)
    199f:	0100                	.insn	2, 0x0100
    19a1:	04090003          	lb	zero,64(s2)
    19a5:	0100                	.insn	2, 0x0100
    19a7:	04090003          	lb	zero,64(s2)
    19ab:	0100                	.insn	2, 0x0100
    19ad:	04090003          	lb	zero,64(s2)
    19b1:	0100                	.insn	2, 0x0100
    19b3:	04090003          	lb	zero,64(s2)
    19b7:	0100                	.insn	2, 0x0100
    19b9:	04090003          	lb	zero,64(s2)
    19bd:	0100                	.insn	2, 0x0100
    19bf:	04090003          	lb	zero,64(s2)
    19c3:	0100                	.insn	2, 0x0100
    19c5:	04090003          	lb	zero,64(s2)
    19c9:	0100                	.insn	2, 0x0100
    19cb:	04090003          	lb	zero,64(s2)
    19cf:	0100                	.insn	2, 0x0100
    19d1:	04090003          	lb	zero,64(s2)
    19d5:	0100                	.insn	2, 0x0100
    19d7:	0d05                	.insn	2, 0x0d05
    19d9:	0306                	.insn	2, 0x0306
    19db:	0904                	.insn	2, 0x0904
    19dd:	0004                	.insn	2, 0x0004
    19df:	0601                	.insn	2, 0x0601
    19e1:	04090003          	lb	zero,64(s2)
    19e5:	0100                	.insn	2, 0x0100
    19e7:	1105                	.insn	2, 0x1105
    19e9:	0306                	.insn	2, 0x0306
    19eb:	097d                	.insn	2, 0x097d
    19ed:	0008                	.insn	2, 0x0008
    19ef:	0301                	.insn	2, 0x0301
    19f1:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    19f9:	0409 
    19fb:	0100                	.insn	2, 0x0100
    19fd:	0306                	.insn	2, 0x0306
    19ff:	0901                	.insn	2, 0x0901
    1a01:	0004                	.insn	2, 0x0004
    1a03:	0301                	.insn	2, 0x0301
    1a05:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    1a0d:	0409 
    1a0f:	0100                	.insn	2, 0x0100
    1a11:	0306                	.insn	2, 0x0306
    1a13:	0901                	.insn	2, 0x0901
    1a15:	0004                	.insn	2, 0x0004
    1a17:	0301                	.insn	2, 0x0301
    1a19:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    1a21:	0409 
    1a23:	0100                	.insn	2, 0x0100
    1a25:	0306                	.insn	2, 0x0306
    1a27:	0901                	.insn	2, 0x0901
    1a29:	0004                	.insn	2, 0x0004
    1a2b:	0301                	.insn	2, 0x0301
    1a2d:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    1a35:	0409 
    1a37:	0100                	.insn	2, 0x0100
    1a39:	0306                	.insn	2, 0x0306
    1a3b:	0901                	.insn	2, 0x0901
    1a3d:	0004                	.insn	2, 0x0004
    1a3f:	0301                	.insn	2, 0x0301
    1a41:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    1a49:	0409 
    1a4b:	0100                	.insn	2, 0x0100
    1a4d:	0306                	.insn	2, 0x0306
    1a4f:	0901                	.insn	2, 0x0901
    1a51:	0004                	.insn	2, 0x0004
    1a53:	0301                	.insn	2, 0x0301
    1a55:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    1a5d:	0409 
    1a5f:	0100                	.insn	2, 0x0100
    1a61:	0306                	.insn	2, 0x0306
    1a63:	0901                	.insn	2, 0x0901
    1a65:	0004                	.insn	2, 0x0004
    1a67:	0301                	.insn	2, 0x0301
    1a69:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    1a71:	0409 
    1a73:	0100                	.insn	2, 0x0100
    1a75:	0306                	.insn	2, 0x0306
    1a77:	0901                	.insn	2, 0x0901
    1a79:	0004                	.insn	2, 0x0004
    1a7b:	0501                	.insn	2, 0x0501
    1a7d:	030d                	.insn	2, 0x030d
    1a7f:	00080903          	lb	s2,0(a6)
    1a83:	0601                	.insn	2, 0x0601
    1a85:	04090003          	lb	zero,64(s2)
    1a89:	0100                	.insn	2, 0x0100
    1a8b:	0306                	.insn	2, 0x0306
    1a8d:	0901                	.insn	2, 0x0901
    1a8f:	0004                	.insn	2, 0x0004
    1a91:	0501                	.insn	2, 0x0501
    1a93:	0315                	.insn	2, 0x0315
    1a95:	0902                	.insn	2, 0x0902
    1a97:	000c                	.insn	2, 0x000c
    1a99:	0601                	.insn	2, 0x0601
    1a9b:	04090003          	lb	zero,64(s2)
    1a9f:	0100                	.insn	2, 0x0100
    1aa1:	04090003          	lb	zero,64(s2)
    1aa5:	0100                	.insn	2, 0x0100
    1aa7:	04090003          	lb	zero,64(s2)
    1aab:	0100                	.insn	2, 0x0100
    1aad:	04090003          	lb	zero,64(s2)
    1ab1:	0100                	.insn	2, 0x0100
    1ab3:	04090003          	lb	zero,64(s2)
    1ab7:	0100                	.insn	2, 0x0100
    1ab9:	0306                	.insn	2, 0x0306
    1abb:	0901                	.insn	2, 0x0901
    1abd:	0004                	.insn	2, 0x0004
    1abf:	0501                	.insn	2, 0x0501
    1ac1:	0326                	.insn	2, 0x0326
    1ac3:	0904                	.insn	2, 0x0904
    1ac5:	0008                	.insn	2, 0x0008
    1ac7:	0501                	.insn	2, 0x0501
    1ac9:	0609                	.insn	2, 0x0609
    1acb:	04090003          	lb	zero,64(s2)
    1acf:	0100                	.insn	2, 0x0100
    1ad1:	1805                	.insn	2, 0x1805
    1ad3:	0306                	.insn	2, 0x0306
    1ad5:	0908                	.insn	2, 0x0908
    1ad7:	000c                	.insn	2, 0x000c
    1ad9:	0501                	.insn	2, 0x0501
    1adb:	030e                	.insn	2, 0x030e
    1add:	097c                	.insn	2, 0x097c
    1adf:	0004                	.insn	2, 0x0004
    1ae1:	0501                	.insn	2, 0x0501
    1ae3:	0318                	.insn	2, 0x0318
    1ae5:	097f 0004 0301 0904 	.insn	10, 0x0004090403010004097f
    1aed:	0004 
    1aef:	0501                	.insn	2, 0x0501
    1af1:	031e                	.insn	2, 0x031e
    1af3:	0901                	.insn	2, 0x0901
    1af5:	0004                	.insn	2, 0x0004
    1af7:	0501                	.insn	2, 0x0501
    1af9:	0314                	.insn	2, 0x0314
    1afb:	00040903          	lb	s2,0(s0)
    1aff:	0501                	.insn	2, 0x0501
    1b01:	031f 097c 0008      	.insn	6, 0x0008097c031f
    1b07:	0501                	.insn	2, 0x0501
    1b09:	0314                	.insn	2, 0x0314
    1b0b:	0904                	.insn	2, 0x0904
    1b0d:	0004                	.insn	2, 0x0004
    1b0f:	0501                	.insn	2, 0x0501
    1b11:	0003061b          	.insn	4, 0x0003061b
    1b15:	0409                	.insn	2, 0x0409
    1b17:	0100                	.insn	2, 0x0100
    1b19:	0d05                	.insn	2, 0x0d05
    1b1b:	0306                	.insn	2, 0x0306
    1b1d:	0904                	.insn	2, 0x0904
    1b1f:	0004                	.insn	2, 0x0004
    1b21:	0601                	.insn	2, 0x0601
    1b23:	097e9a03          	lh	s4,151(t4)
    1b27:	0004                	.insn	2, 0x0004
    1b29:	0501                	.insn	2, 0x0501
    1b2b:	0615                	.insn	2, 0x0615
    1b2d:	0901d303          	lhu	t1,144(gp)
    1b31:	0008                	.insn	2, 0x0008
    1b33:	0301                	.insn	2, 0x0301
    1b35:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    1b3d:	0409 
    1b3f:	0100                	.insn	2, 0x0100
    1b41:	0306                	.insn	2, 0x0306
    1b43:	0901                	.insn	2, 0x0901
    1b45:	0004                	.insn	2, 0x0004
    1b47:	0301                	.insn	2, 0x0301
    1b49:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    1b51:	0409 
    1b53:	0100                	.insn	2, 0x0100
    1b55:	0005                	.insn	2, 0x0005
    1b57:	0306                	.insn	2, 0x0306
    1b59:	00cc                	.insn	2, 0x00cc
    1b5b:	0809                	.insn	2, 0x0809
    1b5d:	0100                	.insn	2, 0x0100
    1b5f:	0905                	.insn	2, 0x0905
    1b61:	030a                	.insn	2, 0x030a
    1b63:	001c0903          	lb	s2,1(s8)
    1b67:	0601                	.insn	2, 0x0601
    1b69:	097ddf03          	lhu	t5,151(s11)
    1b6d:	0008                	.insn	2, 0x0008
    1b6f:	0301                	.insn	2, 0x0301
    1b71:	02a1                	.insn	2, 0x02a1
    1b73:	0409                	.insn	2, 0x0409
    1b75:	0100                	.insn	2, 0x0100
    1b77:	2005                	.insn	2, 0x2005
    1b79:	0306                	.insn	2, 0x0306
    1b7b:	0904                	.insn	2, 0x0904
    1b7d:	0004                	.insn	2, 0x0004
    1b7f:	0501                	.insn	2, 0x0501
    1b81:	0314                	.insn	2, 0x0314
    1b83:	7ed9                	.insn	2, 0x7ed9
    1b85:	0c09                	.insn	2, 0x0c09
    1b87:	0100                	.insn	2, 0x0100
    1b89:	04097e03          	.insn	4, 0x04097e03
    1b8d:	0100                	.insn	2, 0x0100
    1b8f:	1505                	.insn	2, 0x1505
    1b91:	04090103          	lb	sp,64(s2)
    1b95:	0100                	.insn	2, 0x0100
    1b97:	1a05                	.insn	2, 0x1a05
    1b99:	0306                	.insn	2, 0x0306
    1b9b:	0900                	.insn	2, 0x0900
    1b9d:	0004                	.insn	2, 0x0004
    1b9f:	0501                	.insn	2, 0x0501
    1ba1:	061f 7f03 0409      	.insn	6, 0x04097f03061f
    1ba7:	0100                	.insn	2, 0x0100
    1ba9:	0905                	.insn	2, 0x0905
    1bab:	0901ab03          	lw	s6,144(gp)
    1baf:	0004                	.insn	2, 0x0004
    1bb1:	0601                	.insn	2, 0x0601
    1bb3:	14090003          	lb	zero,320(s2)
    1bb7:	0100                	.insn	2, 0x0100
    1bb9:	097dd903          	lhu	s2,151(s11)
    1bbd:	0004                	.insn	2, 0x0004
    1bbf:	0501                	.insn	2, 0x0501
    1bc1:	0610                	.insn	2, 0x0610
    1bc3:	0901ff03          	.insn	4, 0x0901ff03
    1bc7:	0004                	.insn	2, 0x0004
    1bc9:	0501                	.insn	2, 0x0501
    1bcb:	030c                	.insn	2, 0x030c
    1bcd:	0905                	.insn	2, 0x0905
    1bcf:	001c                	.insn	2, 0x001c
    1bd1:	0501                	.insn	2, 0x0501
    1bd3:	0310                	.insn	2, 0x0310
    1bd5:	0004097b          	.insn	4, 0x0004097b
    1bd9:	0501                	.insn	2, 0x0501
    1bdb:	0312                	.insn	2, 0x0312
    1bdd:	0905                	.insn	2, 0x0905
    1bdf:	0010                	.insn	2, 0x0010
    1be1:	0601                	.insn	2, 0x0601
    1be3:	097dfc03          	.insn	4, 0x097dfc03
    1be7:	0004                	.insn	2, 0x0004
    1be9:	0601                	.insn	2, 0x0601
    1beb:	09028503          	lb	a0,144(t0)
    1bef:	0010                	.insn	2, 0x0010
    1bf1:	0501                	.insn	2, 0x0501
    1bf3:	0619                	.insn	2, 0x0619
    1bf5:	04090003          	lb	zero,64(s2)
    1bf9:	0100                	.insn	2, 0x0100
    1bfb:	0905                	.insn	2, 0x0905
    1bfd:	0306                	.insn	2, 0x0306
    1bff:	00080903          	lb	s2,0(a6)
    1c03:	0501                	.insn	2, 0x0501
    1c05:	0614                	.insn	2, 0x0614
    1c07:	08090003          	lb	zero,128(s2)
    1c0b:	0100                	.insn	2, 0x0100
    1c0d:	0c05                	.insn	2, 0x0c05
    1c0f:	0306                	.insn	2, 0x0306
    1c11:	097c                	.insn	2, 0x097c
    1c13:	0004                	.insn	2, 0x0004
    1c15:	0501                	.insn	2, 0x0501
    1c17:	0310                	.insn	2, 0x0310
    1c19:	0904                	.insn	2, 0x0904
    1c1b:	0004                	.insn	2, 0x0004
    1c1d:	0501                	.insn	2, 0x0501
    1c1f:	0312                	.insn	2, 0x0312
    1c21:	097c                	.insn	2, 0x097c
    1c23:	0008                	.insn	2, 0x0008
    1c25:	0501                	.insn	2, 0x0501
    1c27:	0305                	.insn	2, 0x0305
    1c29:	0908                	.insn	2, 0x0908
    1c2b:	0004                	.insn	2, 0x0004
    1c2d:	0601                	.insn	2, 0x0601
    1c2f:	097df403          	.insn	4, 0x097df403
    1c33:	0008                	.insn	2, 0x0008
    1c35:	0301                	.insn	2, 0x0301
    1c37:	028c                	.insn	2, 0x028c
    1c39:	0c09                	.insn	2, 0x0c09
    1c3b:	0100                	.insn	2, 0x0100
    1c3d:	1205                	.insn	2, 0x1205
    1c3f:	08090003          	lb	zero,128(s2)
    1c43:	0100                	.insn	2, 0x0100
    1c45:	0c05                	.insn	2, 0x0c05
    1c47:	0c090003          	lb	zero,192(s2)
    1c4b:	0100                	.insn	2, 0x0100
    1c4d:	0505                	.insn	2, 0x0505
    1c4f:	04090003          	lb	zero,64(s2)
    1c53:	0100                	.insn	2, 0x0100
    1c55:	1205                	.insn	2, 0x1205
    1c57:	04090003          	lb	zero,64(s2)
    1c5b:	0100                	.insn	2, 0x0100
    1c5d:	0f05                	.insn	2, 0x0f05
    1c5f:	0306                	.insn	2, 0x0306
    1c61:	0904                	.insn	2, 0x0904
    1c63:	0008                	.insn	2, 0x0008
    1c65:	0501                	.insn	2, 0x0501
    1c67:	030c                	.insn	2, 0x030c
    1c69:	0906                	.insn	2, 0x0906
    1c6b:	0008                	.insn	2, 0x0008
    1c6d:	0501                	.insn	2, 0x0501
    1c6f:	0605                	.insn	2, 0x0605
    1c71:	08090003          	lb	zero,128(s2)
    1c75:	0100                	.insn	2, 0x0100
    1c77:	097dea03          	.insn	4, 0x097dea03
    1c7b:	0004                	.insn	2, 0x0004
    1c7d:	0301                	.insn	2, 0x0301
    1c7f:	0296                	.insn	2, 0x0296
    1c81:	0409                	.insn	2, 0x0409
    1c83:	0100                	.insn	2, 0x0100
    1c85:	1b05                	.insn	2, 0x1b05
    1c87:	0306                	.insn	2, 0x0306
    1c89:	0901                	.insn	2, 0x0901
    1c8b:	0008                	.insn	2, 0x0008
    1c8d:	0501                	.insn	2, 0x0501
    1c8f:	0614                	.insn	2, 0x0614
    1c91:	04090003          	lb	zero,64(s2)
    1c95:	0100                	.insn	2, 0x0100
    1c97:	0505                	.insn	2, 0x0505
    1c99:	0306                	.insn	2, 0x0306
    1c9b:	097f 0008 0501 0600 	.insn	10, 0xea03060005010008097f
    1ca3:	ea03 
    1ca5:	097d                	.insn	2, 0x097d
    1ca7:	0004                	.insn	2, 0x0004
    1ca9:	0301                	.insn	2, 0x0301
    1cab:	0296                	.insn	2, 0x0296
    1cad:	0409                	.insn	2, 0x0409
    1caf:	0100                	.insn	2, 0x0100
    1cb1:	0505                	.insn	2, 0x0505
    1cb3:	04090003          	lb	zero,64(s2)
    1cb7:	0100                	.insn	2, 0x0100
    1cb9:	0d05                	.insn	2, 0x0d05
    1cbb:	0306                	.insn	2, 0x0306
    1cbd:	091c                	.insn	2, 0x091c
    1cbf:	0008                	.insn	2, 0x0008
    1cc1:	0601                	.insn	2, 0x0601
    1cc3:	097dce03          	lbu	t3,151(s11)
    1cc7:	000c                	.insn	2, 0x000c
    1cc9:	0501                	.insn	2, 0x0501
    1ccb:	031a                	.insn	2, 0x031a
    1ccd:	02b2                	.insn	2, 0x02b2
    1ccf:	0809                	.insn	2, 0x0809
    1cd1:	0100                	.insn	2, 0x0100
    1cd3:	097dce03          	lbu	t3,151(s11)
    1cd7:	0004                	.insn	2, 0x0004
    1cd9:	0301                	.insn	2, 0x0301
    1cdb:	02b2                	.insn	2, 0x02b2
    1cdd:	0409                	.insn	2, 0x0409
    1cdf:	0100                	.insn	2, 0x0100
    1ce1:	0d05                	.insn	2, 0x0d05
    1ce3:	04090003          	lb	zero,64(s2)
    1ce7:	0100                	.insn	2, 0x0100
    1ce9:	1a05                	.insn	2, 0x1a05
    1ceb:	10090003          	lb	zero,256(s2)
    1cef:	0100                	.insn	2, 0x0100
    1cf1:	097dce03          	lbu	t3,151(s11)
    1cf5:	0004                	.insn	2, 0x0004
    1cf7:	0301                	.insn	2, 0x0301
    1cf9:	02b2                	.insn	2, 0x02b2
    1cfb:	0409                	.insn	2, 0x0409
    1cfd:	0100                	.insn	2, 0x0100
    1cff:	0d05                	.insn	2, 0x0d05
    1d01:	04090003          	lb	zero,64(s2)
    1d05:	0100                	.insn	2, 0x0100
    1d07:	1a05                	.insn	2, 0x1a05
    1d09:	10090003          	lb	zero,256(s2)
    1d0d:	0100                	.insn	2, 0x0100
    1d0f:	097dce03          	lbu	t3,151(s11)
    1d13:	0004                	.insn	2, 0x0004
    1d15:	0301                	.insn	2, 0x0301
    1d17:	02b2                	.insn	2, 0x02b2
    1d19:	0409                	.insn	2, 0x0409
    1d1b:	0100                	.insn	2, 0x0100
    1d1d:	0d05                	.insn	2, 0x0d05
    1d1f:	04090003          	lb	zero,64(s2)
    1d23:	0100                	.insn	2, 0x0100
    1d25:	1a05                	.insn	2, 0x1a05
    1d27:	10090003          	lb	zero,256(s2)
    1d2b:	0100                	.insn	2, 0x0100
    1d2d:	097dce03          	lbu	t3,151(s11)
    1d31:	0004                	.insn	2, 0x0004
    1d33:	0301                	.insn	2, 0x0301
    1d35:	02b2                	.insn	2, 0x02b2
    1d37:	0409                	.insn	2, 0x0409
    1d39:	0100                	.insn	2, 0x0100
    1d3b:	0d05                	.insn	2, 0x0d05
    1d3d:	04090003          	lb	zero,64(s2)
    1d41:	0100                	.insn	2, 0x0100
    1d43:	1a05                	.insn	2, 0x1a05
    1d45:	10090003          	lb	zero,256(s2)
    1d49:	0100                	.insn	2, 0x0100
    1d4b:	097dce03          	lbu	t3,151(s11)
    1d4f:	0004                	.insn	2, 0x0004
    1d51:	0301                	.insn	2, 0x0301
    1d53:	02b2                	.insn	2, 0x02b2
    1d55:	0409                	.insn	2, 0x0409
    1d57:	0100                	.insn	2, 0x0100
    1d59:	0d05                	.insn	2, 0x0d05
    1d5b:	04090003          	lb	zero,64(s2)
    1d5f:	0100                	.insn	2, 0x0100
    1d61:	1a05                	.insn	2, 0x1a05
    1d63:	10090003          	lb	zero,256(s2)
    1d67:	0100                	.insn	2, 0x0100
    1d69:	097dce03          	lbu	t3,151(s11)
    1d6d:	0004                	.insn	2, 0x0004
    1d6f:	0301                	.insn	2, 0x0301
    1d71:	02b2                	.insn	2, 0x02b2
    1d73:	0409                	.insn	2, 0x0409
    1d75:	0100                	.insn	2, 0x0100
    1d77:	0d05                	.insn	2, 0x0d05
    1d79:	04090003          	lb	zero,64(s2)
    1d7d:	0100                	.insn	2, 0x0100
    1d7f:	1a05                	.insn	2, 0x1a05
    1d81:	10090003          	lb	zero,256(s2)
    1d85:	0100                	.insn	2, 0x0100
    1d87:	097dce03          	lbu	t3,151(s11)
    1d8b:	0004                	.insn	2, 0x0004
    1d8d:	0301                	.insn	2, 0x0301
    1d8f:	02b2                	.insn	2, 0x02b2
    1d91:	0409                	.insn	2, 0x0409
    1d93:	0100                	.insn	2, 0x0100
    1d95:	0d05                	.insn	2, 0x0d05
    1d97:	04090003          	lb	zero,64(s2)
    1d9b:	0100                	.insn	2, 0x0100
    1d9d:	1a05                	.insn	2, 0x1a05
    1d9f:	10090003          	lb	zero,256(s2)
    1da3:	0100                	.insn	2, 0x0100
    1da5:	097dce03          	lbu	t3,151(s11)
    1da9:	0004                	.insn	2, 0x0004
    1dab:	0301                	.insn	2, 0x0301
    1dad:	02b2                	.insn	2, 0x02b2
    1daf:	0409                	.insn	2, 0x0409
    1db1:	0100                	.insn	2, 0x0100
    1db3:	0d05                	.insn	2, 0x0d05
    1db5:	04090003          	lb	zero,64(s2)
    1db9:	0100                	.insn	2, 0x0100
    1dbb:	1a05                	.insn	2, 0x1a05
    1dbd:	10090003          	lb	zero,256(s2)
    1dc1:	0100                	.insn	2, 0x0100
    1dc3:	097dce03          	lbu	t3,151(s11)
    1dc7:	0004                	.insn	2, 0x0004
    1dc9:	0301                	.insn	2, 0x0301
    1dcb:	02b2                	.insn	2, 0x02b2
    1dcd:	0409                	.insn	2, 0x0409
    1dcf:	0100                	.insn	2, 0x0100
    1dd1:	0d05                	.insn	2, 0x0d05
    1dd3:	04090003          	lb	zero,64(s2)
    1dd7:	0100                	.insn	2, 0x0100
    1dd9:	1a05                	.insn	2, 0x1a05
    1ddb:	10090003          	lb	zero,256(s2)
    1ddf:	0100                	.insn	2, 0x0100
    1de1:	097dce03          	lbu	t3,151(s11)
    1de5:	0004                	.insn	2, 0x0004
    1de7:	0301                	.insn	2, 0x0301
    1de9:	02b2                	.insn	2, 0x02b2
    1deb:	0409                	.insn	2, 0x0409
    1ded:	0100                	.insn	2, 0x0100
    1def:	0d05                	.insn	2, 0x0d05
    1df1:	04090003          	lb	zero,64(s2)
    1df5:	0100                	.insn	2, 0x0100
    1df7:	1a05                	.insn	2, 0x1a05
    1df9:	10090003          	lb	zero,256(s2)
    1dfd:	0100                	.insn	2, 0x0100
    1dff:	097dce03          	lbu	t3,151(s11)
    1e03:	0004                	.insn	2, 0x0004
    1e05:	0301                	.insn	2, 0x0301
    1e07:	02b2                	.insn	2, 0x02b2
    1e09:	0409                	.insn	2, 0x0409
    1e0b:	0100                	.insn	2, 0x0100
    1e0d:	0d05                	.insn	2, 0x0d05
    1e0f:	04090003          	lb	zero,64(s2)
    1e13:	0100                	.insn	2, 0x0100
    1e15:	1a05                	.insn	2, 0x1a05
    1e17:	10090003          	lb	zero,256(s2)
    1e1b:	0100                	.insn	2, 0x0100
    1e1d:	097dce03          	lbu	t3,151(s11)
    1e21:	0004                	.insn	2, 0x0004
    1e23:	0301                	.insn	2, 0x0301
    1e25:	02b2                	.insn	2, 0x02b2
    1e27:	0409                	.insn	2, 0x0409
    1e29:	0100                	.insn	2, 0x0100
    1e2b:	0d05                	.insn	2, 0x0d05
    1e2d:	04090003          	lb	zero,64(s2)
    1e31:	0100                	.insn	2, 0x0100
    1e33:	1a05                	.insn	2, 0x1a05
    1e35:	10090003          	lb	zero,256(s2)
    1e39:	0100                	.insn	2, 0x0100
    1e3b:	097dce03          	lbu	t3,151(s11)
    1e3f:	0004                	.insn	2, 0x0004
    1e41:	0301                	.insn	2, 0x0301
    1e43:	02b2                	.insn	2, 0x02b2
    1e45:	0409                	.insn	2, 0x0409
    1e47:	0100                	.insn	2, 0x0100
    1e49:	0d05                	.insn	2, 0x0d05
    1e4b:	04090003          	lb	zero,64(s2)
    1e4f:	0100                	.insn	2, 0x0100
    1e51:	1a05                	.insn	2, 0x1a05
    1e53:	10090003          	lb	zero,256(s2)
    1e57:	0100                	.insn	2, 0x0100
    1e59:	097dce03          	lbu	t3,151(s11)
    1e5d:	0004                	.insn	2, 0x0004
    1e5f:	0301                	.insn	2, 0x0301
    1e61:	02b2                	.insn	2, 0x02b2
    1e63:	0409                	.insn	2, 0x0409
    1e65:	0100                	.insn	2, 0x0100
    1e67:	0d05                	.insn	2, 0x0d05
    1e69:	04090003          	lb	zero,64(s2)
    1e6d:	0100                	.insn	2, 0x0100
    1e6f:	1a05                	.insn	2, 0x1a05
    1e71:	10090003          	lb	zero,256(s2)
    1e75:	0100                	.insn	2, 0x0100
    1e77:	097dce03          	lbu	t3,151(s11)
    1e7b:	0004                	.insn	2, 0x0004
    1e7d:	0301                	.insn	2, 0x0301
    1e7f:	02b2                	.insn	2, 0x02b2
    1e81:	0409                	.insn	2, 0x0409
    1e83:	0100                	.insn	2, 0x0100
    1e85:	0d05                	.insn	2, 0x0d05
    1e87:	04090003          	lb	zero,64(s2)
    1e8b:	0100                	.insn	2, 0x0100
    1e8d:	1a05                	.insn	2, 0x1a05
    1e8f:	10090003          	lb	zero,256(s2)
    1e93:	0100                	.insn	2, 0x0100
    1e95:	097dce03          	lbu	t3,151(s11)
    1e99:	0004                	.insn	2, 0x0004
    1e9b:	0301                	.insn	2, 0x0301
    1e9d:	02b2                	.insn	2, 0x02b2
    1e9f:	0809                	.insn	2, 0x0809
    1ea1:	0100                	.insn	2, 0x0100
    1ea3:	1405                	.insn	2, 0x1405
    1ea5:	0306                	.insn	2, 0x0306
    1ea7:	0909                	.insn	2, 0x0909
    1ea9:	0004                	.insn	2, 0x0004
    1eab:	0501                	.insn	2, 0x0501
    1ead:	0612                	.insn	2, 0x0612
    1eaf:	0c090003          	lb	zero,192(s2)
    1eb3:	0100                	.insn	2, 0x0100
    1eb5:	1405                	.insn	2, 0x1405
    1eb7:	0c090003          	lb	zero,192(s2)
    1ebb:	0100                	.insn	2, 0x0100
    1ebd:	1205                	.insn	2, 0x1205
    1ebf:	10090003          	lb	zero,256(s2)
    1ec3:	0100                	.insn	2, 0x0100
    1ec5:	1405                	.insn	2, 0x1405
    1ec7:	10090003          	lb	zero,256(s2)
    1ecb:	0100                	.insn	2, 0x0100
    1ecd:	1205                	.insn	2, 0x1205
    1ecf:	0306                	.insn	2, 0x0306
    1ed1:	097c                	.insn	2, 0x097c
    1ed3:	0004                	.insn	2, 0x0004
    1ed5:	0301                	.insn	2, 0x0301
    1ed7:	0904                	.insn	2, 0x0904
    1ed9:	000c                	.insn	2, 0x000c
    1edb:	0501                	.insn	2, 0x0501
    1edd:	0614                	.insn	2, 0x0614
    1edf:	04090003          	lb	zero,64(s2)
    1ee3:	0100                	.insn	2, 0x0100
    1ee5:	1205                	.insn	2, 0x1205
    1ee7:	0306                	.insn	2, 0x0306
    1ee9:	097c                	.insn	2, 0x097c
    1eeb:	0004                	.insn	2, 0x0004
    1eed:	0301                	.insn	2, 0x0301
    1eef:	0904                	.insn	2, 0x0904
    1ef1:	000c                	.insn	2, 0x000c
    1ef3:	0501                	.insn	2, 0x0501
    1ef5:	0614                	.insn	2, 0x0614
    1ef7:	04090003          	lb	zero,64(s2)
    1efb:	0100                	.insn	2, 0x0100
    1efd:	1205                	.insn	2, 0x1205
    1eff:	0306                	.insn	2, 0x0306
    1f01:	097c                	.insn	2, 0x097c
    1f03:	0004                	.insn	2, 0x0004
    1f05:	0301                	.insn	2, 0x0301
    1f07:	0904                	.insn	2, 0x0904
    1f09:	000c                	.insn	2, 0x000c
    1f0b:	0501                	.insn	2, 0x0501
    1f0d:	0614                	.insn	2, 0x0614
    1f0f:	04090003          	lb	zero,64(s2)
    1f13:	0100                	.insn	2, 0x0100
    1f15:	1205                	.insn	2, 0x1205
    1f17:	0306                	.insn	2, 0x0306
    1f19:	097c                	.insn	2, 0x097c
    1f1b:	0004                	.insn	2, 0x0004
    1f1d:	0301                	.insn	2, 0x0301
    1f1f:	0904                	.insn	2, 0x0904
    1f21:	000c                	.insn	2, 0x000c
    1f23:	0501                	.insn	2, 0x0501
    1f25:	0903030f          	.insn	4, 0x0903030f
    1f29:	0008                	.insn	2, 0x0008
    1f2b:	0301                	.insn	2, 0x0301
    1f2d:	00040903          	lb	s2,0(s0)
    1f31:	0301                	.insn	2, 0x0301
    1f33:	0901                	.insn	2, 0x0901
    1f35:	0004                	.insn	2, 0x0004
    1f37:	0301                	.insn	2, 0x0301
    1f39:	0901                	.insn	2, 0x0901
    1f3b:	0004                	.insn	2, 0x0004
    1f3d:	0301                	.insn	2, 0x0301
    1f3f:	0901                	.insn	2, 0x0901
    1f41:	0004                	.insn	2, 0x0004
    1f43:	0301                	.insn	2, 0x0301
    1f45:	00040903          	lb	s2,0(s0)
    1f49:	0301                	.insn	2, 0x0301
    1f4b:	0901                	.insn	2, 0x0901
    1f4d:	0004                	.insn	2, 0x0004
    1f4f:	0301                	.insn	2, 0x0301
    1f51:	0901                	.insn	2, 0x0901
    1f53:	0004                	.insn	2, 0x0004
    1f55:	0301                	.insn	2, 0x0301
    1f57:	0901                	.insn	2, 0x0901
    1f59:	0004                	.insn	2, 0x0004
    1f5b:	0501                	.insn	2, 0x0501
    1f5d:	0309                	.insn	2, 0x0309
    1f5f:	0902                	.insn	2, 0x0902
    1f61:	0004                	.insn	2, 0x0004
    1f63:	0301                	.insn	2, 0x0301
    1f65:	0908                	.insn	2, 0x0908
    1f67:	0010                	.insn	2, 0x0010
    1f69:	0501                	.insn	2, 0x0501
    1f6b:	030d                	.insn	2, 0x030d
    1f6d:	0902                	.insn	2, 0x0902
    1f6f:	0010                	.insn	2, 0x0010
    1f71:	0601                	.insn	2, 0x0601
    1f73:	097daa03          	lw	s4,151(s11)
    1f77:	0010                	.insn	2, 0x0010
    1f79:	0301                	.insn	2, 0x0301
    1f7b:	02d6                	.insn	2, 0x02d6
    1f7d:	0409                	.insn	2, 0x0409
    1f7f:	0100                	.insn	2, 0x0100
    1f81:	0905                	.insn	2, 0x0905
    1f83:	0306                	.insn	2, 0x0306
    1f85:	00040903          	lb	s2,0(s0)
    1f89:	0601                	.insn	2, 0x0601
    1f8b:	097da703          	lw	a4,151(s11)
    1f8f:	0014                	.insn	2, 0x0014
    1f91:	0501                	.insn	2, 0x0501
    1f93:	0601                	.insn	2, 0x0601
    1f95:	0902df03          	lhu	t5,144(t0)
    1f99:	0004                	.insn	2, 0x0004
    1f9b:	0601                	.insn	2, 0x0601
    1f9d:	097da103          	lw	sp,151(s11)
    1fa1:	000c                	.insn	2, 0x000c
    1fa3:	0b01                	.insn	2, 0x0b01
    1fa5:	0902df03          	lhu	t5,144(t0)
    1fa9:	000c                	.insn	2, 0x000c
    1fab:	0901                	.insn	2, 0x0901
    1fad:	0008                	.insn	2, 0x0008
    1faf:	0100                	.insn	2, 0x0100
    1fb1:	01                	.byte	0x01
