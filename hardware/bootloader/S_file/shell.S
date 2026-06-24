
./build/shell.elf:     ファイル形式 elf32-littleriscv


セクション .text の逆アセンブル:

00400000 <start>:

/* ===== エントリ ===== */
__attribute__((section(".text.start")))
__attribute__((naked))
void start(void) {
    __asm__ __volatile__(
  400000:	00423537          	lui	a0,0x423
  400004:	f5050513          	addi	a0,a0,-176 # 422f50 <__user_stack_top>
  400008:	00050113          	mv	sp,a0
  40000c:	00000097          	auipc	ra,0x0
  400010:	010080e7          	jalr	16(ra) # 40001c <main>
  400014:	00001097          	auipc	ra,0x1
  400018:	9d8080e7          	jalr	-1576(ra) # 4009ec <exit>

0040001c <main>:
// shell.c
#include "user.h"
#include "fat32.h"

void main(void) {
  40001c:	f1010113          	addi	sp,sp,-240
  400020:	0e112623          	sw	ra,236(sp)
  400024:	0e812423          	sw	s0,232(sp)
  400028:	0e912223          	sw	s1,228(sp)
  40002c:	0f212023          	sw	s2,224(sp)
  400030:	0d312e23          	sw	s3,220(sp)
  400034:	0d412c23          	sw	s4,216(sp)
  400038:	0d512a23          	sw	s5,212(sp)
  40003c:	0d612823          	sw	s6,208(sp)
  400040:	0d712623          	sw	s7,204(sp)
  400044:	0d812423          	sw	s8,200(sp)
  400048:	0d912223          	sw	s9,196(sp)
  40004c:	0da12023          	sw	s10,192(sp)
  400050:	0bb12e23          	sw	s11,188(sp)

    // DUMP API call
    //call_dump_api();


    printf("shell start.\n");
  400054:	00402537          	lui	a0,0x402
  400058:	c8f50513          	addi	a0,a0,-881 # 401c8f <$d.1>
  40005c:	00001097          	auipc	ra,0x1
  400060:	d6c080e7          	jalr	-660(ra) # 400dc8 <printf>
  400064:	00402537          	lui	a0,0x402
  400068:	c1050513          	addi	a0,a0,-1008 # 401c10 <__modsi3+0x100>
  40006c:	06a12c23          	sw	a0,120(sp)
  400070:	00402537          	lui	a0,0x402
  400074:	bad50513          	addi	a0,a0,-1107 # 401bad <__modsi3+0x9d>
  400078:	06a12623          	sw	a0,108(sp)
  40007c:	00402537          	lui	a0,0x402
  400080:	c9d50513          	addi	a0,a0,-867 # 401c9d <$d.1+0xe>
  400084:	06a12a23          	sw	a0,116(sp)
  400088:	00402537          	lui	a0,0x402
  40008c:	bc650513          	addi	a0,a0,-1082 # 401bc6 <__modsi3+0xb6>
  400090:	06a12823          	sw	a0,112(sp)
  400094:	00018537          	lui	a0,0x18
  400098:	6a050513          	addi	a0,a0,1696 # 186a0 <$d.5+0x173c6>
  40009c:	04a12e23          	sw	a0,92(sp)
  4000a0:	00402537          	lui	a0,0x402
  4000a4:	cf650513          	addi	a0,a0,-778 # 401cf6 <$d.2+0x2a>
  4000a8:	04a12a23          	sw	a0,84(sp)
  4000ac:	00402537          	lui	a0,0x402
  4000b0:	bfc50513          	addi	a0,a0,-1028 # 401bfc <__modsi3+0xec>
  4000b4:	06a12423          	sw	a0,104(sp)
  4000b8:	00402537          	lui	a0,0x402
  4000bc:	c1650513          	addi	a0,a0,-1002 # 401c16 <__modsi3+0x106>
  4000c0:	04a12623          	sw	a0,76(sp)
  4000c4:	00402537          	lui	a0,0x402
  4000c8:	c7350513          	addi	a0,a0,-909 # 401c73 <__modsi3+0x163>
  4000cc:	06a12223          	sw	a0,100(sp)
  4000d0:	00402537          	lui	a0,0x402
  4000d4:	c5550513          	addi	a0,a0,-939 # 401c55 <__modsi3+0x145>
  4000d8:	04a12223          	sw	a0,68(sp)
  4000dc:	00402537          	lui	a0,0x402
  4000e0:	ba550513          	addi	a0,a0,-1115 # 401ba5 <__modsi3+0x95>
  4000e4:	06a12023          	sw	a0,96(sp)
  4000e8:	00402537          	lui	a0,0x402
  4000ec:	cdd50513          	addi	a0,a0,-803 # 401cdd <$d.2+0x11>
  4000f0:	02a12c23          	sw	a0,56(sp)
  4000f4:	00402537          	lui	a0,0x402
  4000f8:	c0550513          	addi	a0,a0,-1019 # 401c05 <__modsi3+0xf5>
  4000fc:	04a12c23          	sw	a0,88(sp)
  400100:	00402537          	lui	a0,0x402
  400104:	d2550513          	addi	a0,a0,-731 # 401d25 <$d.1+0x10>
  400108:	02a12223          	sw	a0,36(sp)
  40010c:	00402537          	lui	a0,0x402
  400110:	c7c50513          	addi	a0,a0,-900 # 401c7c <__modsi3+0x16c>
  400114:	02a12023          	sw	a0,32(sp)
  400118:	00402537          	lui	a0,0x402
  40011c:	ca250513          	addi	a0,a0,-862 # 401ca2 <$d.1+0x13>
  400120:	00a12e23          	sw	a0,28(sp)
  400124:	00402537          	lui	a0,0x402
  400128:	cbe50513          	addi	a0,a0,-834 # 401cbe <$d.1+0x2f>
  40012c:	00a12c23          	sw	a0,24(sp)
  400130:	00402537          	lui	a0,0x402
  400134:	c4650513          	addi	a0,a0,-954 # 401c46 <__modsi3+0x136>
  400138:	00a12a23          	sw	a0,20(sp)
  40013c:	00402537          	lui	a0,0x402
  400140:	c3250513          	addi	a0,a0,-974 # 401c32 <__modsi3+0x122>
  400144:	02a12e23          	sw	a0,60(sp)
  400148:	00402537          	lui	a0,0x402
  40014c:	b8950513          	addi	a0,a0,-1143 # 401b89 <__modsi3+0x79>
  400150:	04a12823          	sw	a0,80(sp)
  400154:	00402537          	lui	a0,0x402
  400158:	b9250513          	addi	a0,a0,-1134 # 401b92 <__modsi3+0x82>
  40015c:	04a12423          	sw	a0,72(sp)
  400160:	00402537          	lui	a0,0x402
  400164:	b7050513          	addi	a0,a0,-1168 # 401b70 <__modsi3+0x60>
  400168:	00a12623          	sw	a0,12(sp)
  40016c:	00402537          	lui	a0,0x402
  400170:	c6e50513          	addi	a0,a0,-914 # 401c6e <__modsi3+0x15e>
  400174:	04a12023          	sw	a0,64(sp)
  400178:	00402537          	lui	a0,0x402
  40017c:	c2750513          	addi	a0,a0,-985 # 401c27 <__modsi3+0x117>
  400180:	00a12823          	sw	a0,16(sp)
  400184:	00402537          	lui	a0,0x402
  400188:	d3250513          	addi	a0,a0,-718 # 401d32 <$d.1+0x1d>
  40018c:	02a12a23          	sw	a0,52(sp)
  400190:	00402537          	lui	a0,0x402
  400194:	d1050513          	addi	a0,a0,-752 # 401d10 <$d.2+0x44>
  400198:	02a12823          	sw	a0,48(sp)
  40019c:	00402537          	lui	a0,0x402
  4001a0:	c8d50513          	addi	a0,a0,-883 # 401c8d <__modsi3+0x17d>
  4001a4:	02a12623          	sw	a0,44(sp)
  4001a8:	00402537          	lui	a0,0x402
  4001ac:	bcd50513          	addi	a0,a0,-1075 # 401bcd <__modsi3+0xbd>
  4001b0:	02a12423          	sw	a0,40(sp)
  4001b4:	02000d13          	li	s10,32
  4001b8:	00a00d93          	li	s11,10
  4001bc:	00c00b13          	li	s6,12
  4001c0:	00800c93          	li	s9,8
  4001c4:	09c10a13          	addi	s4,sp,156
  4001c8:	00900b93          	li	s7,9
  4001cc:	07c10c13          	addi	s8,sp,124
  4001d0:	01f00993          	li	s3,31
  4001d4:	07f00913          	li	s2,127
  4001d8:	00d00413          	li	s0,13
  4001dc:	0140006f          	j	4001f0 <main+0x1d4>
  4001e0:	06c12503          	lw	a0,108(sp)
  4001e4:	00001097          	auipc	ra,0x1
  4001e8:	be4080e7          	jalr	-1052(ra) # 400dc8 <printf>
  4001ec:	07c10c13          	addi	s8,sp,124
prompt:
        //printf("main(void) start.\n");
        //printf("SP=%x\n", __builtin_frame_address(0));

        //printf("> ");
        putchar(0x1B); putchar('['); putchar('3'); putchar('4'); putchar('m'); // 青
  4001f0:	01b00513          	li	a0,27
  4001f4:	00001097          	auipc	ra,0x1
  4001f8:	b14080e7          	jalr	-1260(ra) # 400d08 <putchar>
  4001fc:	05b00513          	li	a0,91
  400200:	00001097          	auipc	ra,0x1
  400204:	b08080e7          	jalr	-1272(ra) # 400d08 <putchar>
  400208:	03300513          	li	a0,51
  40020c:	00001097          	auipc	ra,0x1
  400210:	afc080e7          	jalr	-1284(ra) # 400d08 <putchar>
  400214:	03400513          	li	a0,52
  400218:	00001097          	auipc	ra,0x1
  40021c:	af0080e7          	jalr	-1296(ra) # 400d08 <putchar>
  400220:	06d00513          	li	a0,109
  400224:	00001097          	auipc	ra,0x1
  400228:	ae4080e7          	jalr	-1308(ra) # 400d08 <putchar>
        
        putchar('P');
  40022c:	05000513          	li	a0,80
  400230:	00001097          	auipc	ra,0x1
  400234:	ad8080e7          	jalr	-1320(ra) # 400d08 <putchar>
        putchar('S');
  400238:	05300513          	li	a0,83
  40023c:	00001097          	auipc	ra,0x1
  400240:	acc080e7          	jalr	-1332(ra) # 400d08 <putchar>
        putchar('C');
  400244:	04300513          	li	a0,67
  400248:	00001097          	auipc	ra,0x1
  40024c:	ac0080e7          	jalr	-1344(ra) # 400d08 <putchar>
        putchar('_');
  400250:	05f00513          	li	a0,95
  400254:	00001097          	auipc	ra,0x1
  400258:	ab4080e7          	jalr	-1356(ra) # 400d08 <putchar>
        putchar('O');
  40025c:	04f00513          	li	a0,79
  400260:	00001097          	auipc	ra,0x1
  400264:	aa8080e7          	jalr	-1368(ra) # 400d08 <putchar>
        putchar('S');
  400268:	05300513          	li	a0,83
  40026c:	00001097          	auipc	ra,0x1
  400270:	a9c080e7          	jalr	-1380(ra) # 400d08 <putchar>
        putchar('>');
  400274:	03e00513          	li	a0,62
  400278:	00001097          	auipc	ra,0x1
  40027c:	a90080e7          	jalr	-1392(ra) # 400d08 <putchar>
        putchar(' ');
  400280:	02000513          	li	a0,32
  400284:	00001097          	auipc	ra,0x1
  400288:	a84080e7          	jalr	-1404(ra) # 400d08 <putchar>
        
        putchar(0x1B); putchar('['); putchar('0'); putchar('m'); // リセット
  40028c:	01b00513          	li	a0,27
  400290:	00001097          	auipc	ra,0x1
  400294:	a78080e7          	jalr	-1416(ra) # 400d08 <putchar>
  400298:	05b00513          	li	a0,91
  40029c:	00001097          	auipc	ra,0x1
  4002a0:	a6c080e7          	jalr	-1428(ra) # 400d08 <putchar>
  4002a4:	03000513          	li	a0,48
  4002a8:	00001097          	auipc	ra,0x1
  4002ac:	a60080e7          	jalr	-1440(ra) # 400d08 <putchar>
  4002b0:	06d00513          	li	a0,109
  4002b4:	00001097          	auipc	ra,0x1
  4002b8:	a54080e7          	jalr	-1452(ra) # 400d08 <putchar>
  4002bc:	00000493          	li	s1,0
  4002c0:	00c0006f          	j	4002cc <main+0x2b0>
            if (ch == '\n' && len == 0) {
                continue;
            }

            // バックスペース処理
            if (ch == 8 || ch == 127) {
  4002c4:	03251463          	bne	a0,s2,4002ec <main+0x2d0>
                if (len > 0) {
  4002c8:	04904463          	bgtz	s1,400310 <main+0x2f4>
            int ch = getchar();
  4002cc:	00001097          	auipc	ra,0x1
  4002d0:	f78080e7          	jalr	-136(ra) # 401244 <getchar>
            if (ch == '\n' && len == 0) {
  4002d4:	01b51463          	bne	a0,s11,4002dc <main+0x2c0>
  4002d8:	fe048ae3          	beqz	s1,4002cc <main+0x2b0>
            if (ch == 8 || ch == 127) {
  4002dc:	feab44e3          	blt	s6,a0,4002c4 <main+0x2a8>
  4002e0:	ff9504e3          	beq	a0,s9,4002c8 <main+0x2ac>
  4002e4:	01b51663          	bne	a0,s11,4002f0 <main+0x2d4>
  4002e8:	0580006f          	j	400340 <main+0x324>
  4002ec:	04850a63          	beq	a0,s0,400340 <main+0x324>
  4002f0:	00a9c463          	blt	s3,a0,4002f8 <main+0x2dc>
  4002f4:	fd751ce3          	bne	a0,s7,4002cc <main+0x2b0>
            // 制御文字は基本スキップ（\tは許容）
            if (ch < 0x20 && ch != '\t')
                continue;

            // 長さチェック（終端NULぶんを確保）
            if (len >= (int)sizeof(cmdline) - 1) {
  4002f8:	01e00593          	li	a1,30
  4002fc:	ee95cae3          	blt	a1,s1,4001f0 <main+0x1d4>
                //printf("\ncommand line too long\n");
                goto prompt;
            }

            // 文字を追加 & エコー
            cmdline[len++] = (char)ch;
  400300:	009a05b3          	add	a1,s4,s1
  400304:	00148493          	addi	s1,s1,1
  400308:	00a58023          	sb	a0,0(a1)
  40030c:	0240006f          	j	400330 <main+0x314>
                    len--;
  400310:	fff48493          	addi	s1,s1,-1
                    putchar('\b');
  400314:	00800513          	li	a0,8
  400318:	00001097          	auipc	ra,0x1
  40031c:	9f0080e7          	jalr	-1552(ra) # 400d08 <putchar>
                    putchar(' ');
  400320:	02000513          	li	a0,32
  400324:	00001097          	auipc	ra,0x1
  400328:	9e4080e7          	jalr	-1564(ra) # 400d08 <putchar>
  40032c:	00800513          	li	a0,8
  400330:	0ff57513          	zext.b	a0,a0
  400334:	00001097          	auipc	ra,0x1
  400338:	9d4080e7          	jalr	-1580(ra) # 400d08 <putchar>
  40033c:	f91ff06f          	j	4002cc <main+0x2b0>
                putchar('\n');
  400340:	00a00513          	li	a0,10
  400344:	00001097          	auipc	ra,0x1
  400348:	9c4080e7          	jalr	-1596(ra) # 400d08 <putchar>
                cmdline[len] = '\0';
  40034c:	009a0533          	add	a0,s4,s1
  400350:	00050023          	sb	zero,0(a0)
  400354:	e8048ee3          	beqz	s1,4001f0 <main+0x1d4>
  400358:	09c10513          	addi	a0,sp,156
  40035c:	0080006f          	j	400364 <main+0x348>
        const char *argv[ARGV_MAX];
        int argc = 0;

        // 先頭空白をスキップ
        char *p = cmdline;
        while (*p == ' ' || *p == '\t') p++;
  400360:	00150513          	addi	a0,a0,1
  400364:	00054583          	lbu	a1,0(a0)
  400368:	ff758ce3          	beq	a1,s7,400360 <main+0x344>
  40036c:	ffa58ae3          	beq	a1,s10,400360 <main+0x344>
  400370:	e80580e3          	beqz	a1,4001f0 <main+0x1d4>
  400374:	00000493          	li	s1,0
  400378:	00048a93          	mv	s5,s1
  40037c:	00050593          	mv	a1,a0

        while (*p && argc < ARGV_MAX) {
            argv[argc++] = p;
  400380:	00148493          	addi	s1,s1,1
  400384:	002a9513          	slli	a0,s5,0x2
  400388:	00ac0533          	add	a0,s8,a0
  40038c:	00b52023          	sw	a1,0(a0)
            // 次の区切りまで進める
            while (*p && *p != ' ' && *p != '\t') p++;
  400390:	00158513          	addi	a0,a1,1
  400394:	0005c603          	lbu	a2,0(a1)
  400398:	04060263          	beqz	a2,4003dc <main+0x3c0>
  40039c:	01760e63          	beq	a2,s7,4003b8 <main+0x39c>
  4003a0:	01a60c63          	beq	a2,s10,4003b8 <main+0x39c>
  4003a4:	00158593          	addi	a1,a1,1
  4003a8:	00150513          	addi	a0,a0,1
  4003ac:	0005c603          	lbu	a2,0(a1)
  4003b0:	fe0616e3          	bnez	a2,40039c <main+0x380>
  4003b4:	0280006f          	j	4003dc <main+0x3c0>
            if (!*p) break;
            // 区切りをNULに
            *p++ = '\0';
  4003b8:	00058023          	sb	zero,0(a1)
  4003bc:	0080006f          	j	4003c4 <main+0x3a8>
  4003c0:	00150513          	addi	a0,a0,1
            while (*p == ' ' || *p == '\t') p++;
  4003c4:	00054583          	lbu	a1,0(a0)
  4003c8:	ffa58ce3          	beq	a1,s10,4003c0 <main+0x3a4>
  4003cc:	ff758ae3          	beq	a1,s7,4003c0 <main+0x3a4>
        while (*p && argc < ARGV_MAX) {
  4003d0:	00058663          	beqz	a1,4003dc <main+0x3c0>
  4003d4:	00600593          	li	a1,6
  4003d8:	fb55f0e3          	bgeu	a1,s5,400378 <main+0x35c>
        }

        if (argc == 0) continue;

        /* ===== コマンド分岐 ===== */
        if (strcmp(argv[0], "hello") == 0) {
  4003dc:	07c12c03          	lw	s8,124(sp)
  4003e0:	000c0513          	mv	a0,s8
  4003e4:	07812583          	lw	a1,120(sp)
  4003e8:	00001097          	auipc	ra,0x1
  4003ec:	9a0080e7          	jalr	-1632(ra) # 400d88 <strcmp>
  4003f0:	de0508e3          	beqz	a0,4001e0 <main+0x1c4>
            printf("Hello world from shell!\n");

        // ---- Dump ----
        } else if (strcmp(argv[0], "dump") == 0) {
  4003f4:	000c0513          	mv	a0,s8
  4003f8:	07412583          	lw	a1,116(sp)
  4003fc:	00001097          	auipc	ra,0x1
  400400:	98c080e7          	jalr	-1652(ra) # 400d88 <strcmp>
  400404:	0e050c63          	beqz	a0,4004fc <main+0x4e0>
            unsigned lenb = (argc >= 3) ? parse_u32(argv[2]) : 0x100;
            hexdump((const void*)addr, lenb, (uintptr_t)addr);
        */

        // ---- 素数出力サンプル ----
        } else if (strcmp(argv[0], "primes") == 0) {
  400408:	000c0513          	mv	a0,s8
  40040c:	07012583          	lw	a1,112(sp)
  400410:	00001097          	auipc	ra,0x1
  400414:	978080e7          	jalr	-1672(ra) # 400d88 <strcmp>
  400418:	12050a63          	beqz	a0,40054c <main+0x530>
                }
            }
            cmd_primes(max);

        // ---- SynapEngine ----
        } else if (strcmp(argv[0], "sa_start") == 0) {
  40041c:	000c0513          	mv	a0,s8
  400420:	06812583          	lw	a1,104(sp)
  400424:	00001097          	auipc	ra,0x1
  400428:	964080e7          	jalr	-1692(ra) # 400d88 <strcmp>
  40042c:	14050663          	beqz	a0,400578 <main+0x55c>
            }
            // SA API call 
            call_sa_api(matrix_max);

        // ---- I2S MIC READ ----
        } else if (strcmp(argv[0], "mic_read") == 0) {
  400430:	000c0513          	mv	a0,s8
  400434:	06412583          	lw	a1,100(sp)
  400438:	00001097          	auipc	ra,0x1
  40043c:	950080e7          	jalr	-1712(ra) # 400d88 <strcmp>
  400440:	18050463          	beqz	a0,4005c8 <main+0x5ac>

            unsigned count = parse_u32(argv[1]);
            call_mic_api(count);

        // ---- SDカードREAD ----
        } else if (strcmp(argv[0], "sd_read") == 0) {
  400444:	000c0513          	mv	a0,s8
  400448:	06012583          	lw	a1,96(sp)
  40044c:	00001097          	auipc	ra,0x1
  400450:	93c080e7          	jalr	-1732(ra) # 400d88 <strcmp>
  400454:	1a050a63          	beqz	a0,400608 <main+0x5ec>

            unsigned sd_sector = parse_u32(argv[1]);
            call_sd_api(sd_sector);

        // ---- FAT32 Info ----
        } else if (strcmp(argv[0], "fat32_info") == 0) {
  400458:	000c0513          	mv	a0,s8
  40045c:	05812583          	lw	a1,88(sp)
  400460:	00001097          	auipc	ra,0x1
  400464:	928080e7          	jalr	-1752(ra) # 400d88 <strcmp>
  400468:	28050a63          	beqz	a0,4006fc <main+0x6e0>
            printf("spc=%x\n",           g_fat32.sectors_per_cluster);
            printf("fat_begin=%x\n",     g_fat32.fat_begin);
            printf("data_begin=%x\n",    g_fat32.data_begin);

        // ---- FAT32 ls ----
        } else if (strcmp(argv[0], "fat32_ls") == 0) {
  40046c:	000c0513          	mv	a0,s8
  400470:	05012583          	lw	a1,80(sp)
  400474:	00001097          	auipc	ra,0x1
  400478:	914080e7          	jalr	-1772(ra) # 400d88 <strcmp>
  40047c:	2a050a63          	beqz	a0,400730 <main+0x714>

            fat32_ls();

        // ---- FAT32 cat ----
        } else if (strcmp(argv[0], "fat32_cat") == 0) {
  400480:	000c0513          	mv	a0,s8
  400484:	04812583          	lw	a1,72(sp)
  400488:	00001097          	auipc	ra,0x1
  40048c:	900080e7          	jalr	-1792(ra) # 400d88 <strcmp>
  400490:	32050a63          	beqz	a0,4007c4 <main+0x7a8>
            }

            fat32_cat(argv[1]);

        // ---- Helps出力 ----
        } else if (strcmp(argv[0], "help") == 0) {
  400494:	000c0513          	mv	a0,s8
  400498:	04012583          	lw	a1,64(sp)
  40049c:	00001097          	auipc	ra,0x1
  4004a0:	8ec080e7          	jalr	-1812(ra) # 400d88 <strcmp>
  4004a4:	38050a63          	beqz	a0,400838 <main+0x81c>
            printf("  sa_start\n");
            printf("  sd_read\n");
            printf("  exit | quit | q\n");
            */

        } else if (strcmp(argv[0], "exit") == 0 ||
  4004a8:	000c0513          	mv	a0,s8
  4004ac:	03412583          	lw	a1,52(sp)
  4004b0:	00001097          	auipc	ra,0x1
  4004b4:	8d8080e7          	jalr	-1832(ra) # 400d88 <strcmp>
  4004b8:	3a050263          	beqz	a0,40085c <main+0x840>
                   strcmp(argv[0], "quit") == 0 ||
  4004bc:	000c0513          	mv	a0,s8
  4004c0:	03012583          	lw	a1,48(sp)
  4004c4:	00001097          	auipc	ra,0x1
  4004c8:	8c4080e7          	jalr	-1852(ra) # 400d88 <strcmp>
  4004cc:	38050863          	beqz	a0,40085c <main+0x840>
                   strcmp(argv[0], "q") == 0) {
  4004d0:	000c0513          	mv	a0,s8
  4004d4:	02c12583          	lw	a1,44(sp)
  4004d8:	00001097          	auipc	ra,0x1
  4004dc:	8b0080e7          	jalr	-1872(ra) # 400d88 <strcmp>
        } else if (strcmp(argv[0], "exit") == 0 ||
  4004e0:	36050e63          	beqz	a0,40085c <main+0x840>
  4004e4:	02812503          	lw	a0,40(sp)
            exit();
        
        } else {
            printf("unknown command: %s\n", argv[0]);
  4004e8:	000c0593          	mv	a1,s8
  4004ec:	00001097          	auipc	ra,0x1
  4004f0:	8dc080e7          	jalr	-1828(ra) # 400dc8 <printf>
  4004f4:	07c10c13          	addi	s8,sp,124
  4004f8:	cf9ff06f          	j	4001f0 <main+0x1d4>
  4004fc:	10000593          	li	a1,256
            if (argc >= 2) {
  400500:	0a0a8263          	beqz	s5,4005a4 <main+0x588>
                if (parse_hex(argv[1], &val) == 0) {
  400504:	08012683          	lw	a3,128(sp)
/* 簡易16進パーサ（"  0x1234" / "1234" 形式どちらも可） */
int parse_hex(const char *s, uintptr_t *out) {
    uintptr_t v = 0;

    /* skip leading spaces */
    while (*s == ' ' || *s == '\t') s++;
  400508:	00268693          	addi	a3,a3,2
  40050c:	07c10c13          	addi	s8,sp,124
  400510:	00500893          	li	a7,5
  400514:	0080006f          	j	40051c <main+0x500>
  400518:	00168693          	addi	a3,a3,1
  40051c:	ffe6c603          	lbu	a2,-2(a3)
  400520:	ff760ce3          	beq	a2,s7,400518 <main+0x4fc>
  400524:	ffa60ae3          	beq	a2,s10,400518 <main+0x4fc>
  400528:	03000513          	li	a0,48
  40052c:	08a61663          	bne	a2,a0,4005b8 <main+0x59c>

    /* optional 0x / 0X */
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  400530:	fff6c503          	lbu	a0,-1(a3)
  400534:	02056513          	ori	a0,a0,32
  400538:	07800613          	li	a2,120
  40053c:	10c51463          	bne	a0,a2,400644 <main+0x628>
    if (!*s) return -1;
  400540:	0006c603          	lbu	a2,0(a3)
  400544:	10061463          	bnez	a2,40064c <main+0x630>
  400548:	0780006f          	j	4005c0 <main+0x5a4>
            if (argc >= 2) {
  40054c:	080a8e63          	beqz	s5,4005e8 <main+0x5cc>
                max = parse_u32(argv[1]);
  400550:	08012503          	lw	a0,128(sp)
  400554:	00001097          	auipc	ra,0x1
  400558:	b7c080e7          	jalr	-1156(ra) # 4010d0 <parse_u32>
  40055c:	05c12583          	lw	a1,92(sp)
  400560:	07c10c13          	addi	s8,sp,124
                if (max > 100000) {
  400564:	08a5fc63          	bgeu	a1,a0,4005fc <main+0x5e0>
  400568:	05412503          	lw	a0,84(sp)
                    printf("max too large (<=100000)\n");
  40056c:	00001097          	auipc	ra,0x1
  400570:	85c080e7          	jalr	-1956(ra) # 400dc8 <printf>
  400574:	c7dff06f          	j	4001f0 <main+0x1d4>
  400578:	07c10c13          	addi	s8,sp,124
            if (argc >= 2) {
  40057c:	0a0a8663          	beqz	s5,400628 <main+0x60c>
                matrix_max = parse_u32(argv[1]);
  400580:	08012503          	lw	a0,128(sp)
  400584:	00001097          	auipc	ra,0x1
  400588:	b4c080e7          	jalr	-1204(ra) # 4010d0 <parse_u32>
                if (matrix_max > 4) {
  40058c:	00400593          	li	a1,4
  400590:	0aa5f463          	bgeu	a1,a0,400638 <main+0x61c>
  400594:	04c12503          	lw	a0,76(sp)
                    printf("matrix size > 4\n");
  400598:	00001097          	auipc	ra,0x1
  40059c:	830080e7          	jalr	-2000(ra) # 400dc8 <printf>
  4005a0:	c51ff06f          	j	4001f0 <main+0x1d4>
  4005a4:	00200537          	lui	a0,0x200
  4005a8:	07c10c13          	addi	s8,sp,124
            call_dump_api(addr, len);
  4005ac:	00000097          	auipc	ra,0x0
  4005b0:	79c080e7          	jalr	1948(ra) # 400d48 <call_dump_api>
  4005b4:	c3dff06f          	j	4001f0 <main+0x1d4>
    if (!*s) return -1;
  4005b8:	ffe68693          	addi	a3,a3,-2
  4005bc:	08061863          	bnez	a2,40064c <main+0x630>
  4005c0:	00200537          	lui	a0,0x200
  4005c4:	0e40006f          	j	4006a8 <main+0x68c>
            if (argc < 2) {
  4005c8:	140a8a63          	beqz	s5,40071c <main+0x700>
            unsigned count = parse_u32(argv[1]);
  4005cc:	08012503          	lw	a0,128(sp)
  4005d0:	00001097          	auipc	ra,0x1
  4005d4:	b00080e7          	jalr	-1280(ra) # 4010d0 <parse_u32>
            call_mic_api(count);
  4005d8:	00000097          	auipc	ra,0x0
  4005dc:	758080e7          	jalr	1880(ra) # 400d30 <call_mic_api>
  4005e0:	07c10c13          	addi	s8,sp,124
  4005e4:	c0dff06f          	j	4001f0 <main+0x1d4>
  4005e8:	3e800513          	li	a0,1000
  4005ec:	07c10c13          	addi	s8,sp,124
            cmd_primes(max);
  4005f0:	00000097          	auipc	ra,0x0
  4005f4:	340080e7          	jalr	832(ra) # 400930 <cmd_primes>
  4005f8:	bf9ff06f          	j	4001f0 <main+0x1d4>
  4005fc:	00000097          	auipc	ra,0x0
  400600:	334080e7          	jalr	820(ra) # 400930 <cmd_primes>
  400604:	bedff06f          	j	4001f0 <main+0x1d4>
            if (argc < 2) {
  400608:	120a8c63          	beqz	s5,400740 <main+0x724>
            unsigned sd_sector = parse_u32(argv[1]);
  40060c:	08012503          	lw	a0,128(sp)
  400610:	00001097          	auipc	ra,0x1
  400614:	ac0080e7          	jalr	-1344(ra) # 4010d0 <parse_u32>
            call_sd_api(sd_sector);
  400618:	00000097          	auipc	ra,0x0
  40061c:	724080e7          	jalr	1828(ra) # 400d3c <call_sd_api>
  400620:	07c10c13          	addi	s8,sp,124
  400624:	bcdff06f          	j	4001f0 <main+0x1d4>
  400628:	00400513          	li	a0,4
            call_sa_api(matrix_max);
  40062c:	00000097          	auipc	ra,0x0
  400630:	3d8080e7          	jalr	984(ra) # 400a04 <call_sa_api>
  400634:	bbdff06f          	j	4001f0 <main+0x1d4>
  400638:	00000097          	auipc	ra,0x0
  40063c:	3cc080e7          	jalr	972(ra) # 400a04 <call_sa_api>
  400640:	bb1ff06f          	j	4001f0 <main+0x1d4>
  400644:	ffe68693          	addi	a3,a3,-2
  400648:	03000613          	li	a2,48
  40064c:	00000513          	li	a0,0

    while (*s) {
        char c = *s++;
        uint32_t d;
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400650:	00168693          	addi	a3,a3,1
  400654:	0200006f          	j	400674 <main+0x658>
  400658:	0ff67793          	zext.b	a5,a2
    while (*s) {
  40065c:	0006c603          	lbu	a2,0(a3)
  400660:	00f70733          	add	a4,a4,a5
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
        else break;
        v = (v << 4) | d;
  400664:	00451513          	slli	a0,a0,0x4
  400668:	00a76533          	or	a0,a4,a0
    while (*s) {
  40066c:	00168693          	addi	a3,a3,1
  400670:	02060c63          	beqz	a2,4006a8 <main+0x68c>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400674:	fd060713          	addi	a4,a2,-48
  400678:	0ff77793          	zext.b	a5,a4
  40067c:	fd000713          	li	a4,-48
  400680:	fdb7ece3          	bltu	a5,s11,400658 <main+0x63c>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  400684:	f9f60713          	addi	a4,a2,-97
  400688:	0ff77793          	zext.b	a5,a4
  40068c:	fa900713          	li	a4,-87
  400690:	00600813          	li	a6,6
  400694:	fd07e2e3          	bltu	a5,a6,400658 <main+0x63c>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  400698:	fbf60713          	addi	a4,a2,-65
  40069c:	0ff77793          	zext.b	a5,a4
  4006a0:	fc900713          	li	a4,-55
  4006a4:	faf8fae3          	bgeu	a7,a5,400658 <main+0x63c>
            if (argc >= 3) {
  4006a8:	00200613          	li	a2,2
  4006ac:	10c48663          	beq	s1,a2,4007b8 <main+0x79c>
                if (parse_hex(argv[2], &val) == 0) {
  4006b0:	08412683          	lw	a3,132(sp)
    while (*s == ' ' || *s == '\t') s++;
  4006b4:	00268693          	addi	a3,a3,2
  4006b8:	0080006f          	j	4006c0 <main+0x6a4>
  4006bc:	00168693          	addi	a3,a3,1
  4006c0:	ffe6c603          	lbu	a2,-2(a3)
  4006c4:	ff760ce3          	beq	a2,s7,4006bc <main+0x6a0>
  4006c8:	ffa60ae3          	beq	a2,s10,4006bc <main+0x6a0>
  4006cc:	03000713          	li	a4,48
  4006d0:	02e61063          	bne	a2,a4,4006f0 <main+0x6d4>
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  4006d4:	fff6c603          	lbu	a2,-1(a3)
  4006d8:	02066613          	ori	a2,a2,32
  4006dc:	07800713          	li	a4,120
  4006e0:	06e61a63          	bne	a2,a4,400754 <main+0x738>
    if (!*s) return -1;
  4006e4:	0006c603          	lbu	a2,0(a3)
  4006e8:	06061a63          	bnez	a2,40075c <main+0x740>
  4006ec:	0cc0006f          	j	4007b8 <main+0x79c>
  4006f0:	ffe68693          	addi	a3,a3,-2
  4006f4:	06061463          	bnez	a2,40075c <main+0x740>
  4006f8:	0c00006f          	j	4007b8 <main+0x79c>
            if (fat32_mount() != 0) {
  4006fc:	00001097          	auipc	ra,0x1
  400700:	c58080e7          	jalr	-936(ra) # 401354 <fat32_mount>
  400704:	07c10c13          	addi	s8,sp,124
  400708:	0c050a63          	beqz	a0,4007dc <main+0x7c0>
  40070c:	03c12503          	lw	a0,60(sp)
                printf("FAT32 mount failed\n");
  400710:	00000097          	auipc	ra,0x0
  400714:	6b8080e7          	jalr	1720(ra) # 400dc8 <printf>
  400718:	ad9ff06f          	j	4001f0 <main+0x1d4>
  40071c:	04412503          	lw	a0,68(sp)
  400720:	00000097          	auipc	ra,0x0
  400724:	6a8080e7          	jalr	1704(ra) # 400dc8 <printf>
  400728:	07c10c13          	addi	s8,sp,124
  40072c:	ac5ff06f          	j	4001f0 <main+0x1d4>
            fat32_ls();
  400730:	00001097          	auipc	ra,0x1
  400734:	038080e7          	jalr	56(ra) # 401768 <fat32_ls>
  400738:	07c10c13          	addi	s8,sp,124
  40073c:	ab5ff06f          	j	4001f0 <main+0x1d4>
  400740:	03812503          	lw	a0,56(sp)
  400744:	00000097          	auipc	ra,0x0
  400748:	684080e7          	jalr	1668(ra) # 400dc8 <printf>
  40074c:	07c10c13          	addi	s8,sp,124
  400750:	aa1ff06f          	j	4001f0 <main+0x1d4>
  400754:	ffe68693          	addi	a3,a3,-2
  400758:	03000613          	li	a2,48
  40075c:	00000593          	li	a1,0
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400760:	00168693          	addi	a3,a3,1
  400764:	0200006f          	j	400784 <main+0x768>
  400768:	0ff67793          	zext.b	a5,a2
    while (*s) {
  40076c:	0006c603          	lbu	a2,0(a3)
  400770:	00f70733          	add	a4,a4,a5
        v = (v << 4) | d;
  400774:	00459593          	slli	a1,a1,0x4
  400778:	00b765b3          	or	a1,a4,a1
    while (*s) {
  40077c:	00168693          	addi	a3,a3,1
  400780:	02060c63          	beqz	a2,4007b8 <main+0x79c>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400784:	fd060713          	addi	a4,a2,-48
  400788:	0ff77793          	zext.b	a5,a4
  40078c:	fd000713          	li	a4,-48
  400790:	fdb7ece3          	bltu	a5,s11,400768 <main+0x74c>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  400794:	f9f60713          	addi	a4,a2,-97
  400798:	0ff77793          	zext.b	a5,a4
  40079c:	fa900713          	li	a4,-87
  4007a0:	00600813          	li	a6,6
  4007a4:	fd07e2e3          	bltu	a5,a6,400768 <main+0x74c>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  4007a8:	fbf60713          	addi	a4,a2,-65
  4007ac:	0ff77793          	zext.b	a5,a4
  4007b0:	fc900713          	li	a4,-55
  4007b4:	faf8fae3          	bgeu	a7,a5,400768 <main+0x74c>
            call_dump_api(addr, len);
  4007b8:	00000097          	auipc	ra,0x0
  4007bc:	590080e7          	jalr	1424(ra) # 400d48 <call_dump_api>
  4007c0:	a31ff06f          	j	4001f0 <main+0x1d4>
  4007c4:	07c10c13          	addi	s8,sp,124
            if (argc < 2) {
  4007c8:	080a8263          	beqz	s5,40084c <main+0x830>
            fat32_cat(argv[1]);
  4007cc:	08012503          	lw	a0,128(sp)
  4007d0:	00001097          	auipc	ra,0x1
  4007d4:	a94080e7          	jalr	-1388(ra) # 401264 <fat32_cat>
  4007d8:	a19ff06f          	j	4001f0 <main+0x1d4>
  4007dc:	00402537          	lui	a0,0x402
            printf("part_lba=%x\n",      g_fat32.part_lba);
  4007e0:	f3852583          	lw	a1,-200(a0) # 401f38 <g_fat32>
  4007e4:	f3850493          	addi	s1,a0,-200
  4007e8:	02412503          	lw	a0,36(sp)
  4007ec:	00000097          	auipc	ra,0x0
  4007f0:	5dc080e7          	jalr	1500(ra) # 400dc8 <printf>
            printf("root_cluster=%x\n",  g_fat32.root_cluster);
  4007f4:	00c4a583          	lw	a1,12(s1)
  4007f8:	02012503          	lw	a0,32(sp)
  4007fc:	00000097          	auipc	ra,0x0
  400800:	5cc080e7          	jalr	1484(ra) # 400dc8 <printf>
            printf("spc=%x\n",           g_fat32.sectors_per_cluster);
  400804:	0104a583          	lw	a1,16(s1)
  400808:	01c12503          	lw	a0,28(sp)
  40080c:	00000097          	auipc	ra,0x0
  400810:	5bc080e7          	jalr	1468(ra) # 400dc8 <printf>
            printf("fat_begin=%x\n",     g_fat32.fat_begin);
  400814:	0044a583          	lw	a1,4(s1)
  400818:	01812503          	lw	a0,24(sp)
  40081c:	00000097          	auipc	ra,0x0
  400820:	5ac080e7          	jalr	1452(ra) # 400dc8 <printf>
            printf("data_begin=%x\n",    g_fat32.data_begin);
  400824:	0084a583          	lw	a1,8(s1)
  400828:	01412503          	lw	a0,20(sp)
  40082c:	00000097          	auipc	ra,0x0
  400830:	59c080e7          	jalr	1436(ra) # 400dc8 <printf>
  400834:	9bdff06f          	j	4001f0 <main+0x1d4>
  400838:	01012503          	lw	a0,16(sp)
  40083c:	00000097          	auipc	ra,0x0
  400840:	58c080e7          	jalr	1420(ra) # 400dc8 <printf>
  400844:	07c10c13          	addi	s8,sp,124
  400848:	9a9ff06f          	j	4001f0 <main+0x1d4>
  40084c:	00c12503          	lw	a0,12(sp)
                printf("usage: fat32_cat <file>\n");
  400850:	00000097          	auipc	ra,0x0
  400854:	578080e7          	jalr	1400(ra) # 400dc8 <printf>
  400858:	999ff06f          	j	4001f0 <main+0x1d4>
            exit();
  40085c:	00000097          	auipc	ra,0x0
  400860:	190080e7          	jalr	400(ra) # 4009ec <exit>

00400864 <parse_hex>:
    while (*s == ' ' || *s == '\t') s++;
  400864:	00250613          	addi	a2,a0,2
  400868:	00900693          	li	a3,9
  40086c:	02000713          	li	a4,32
  400870:	0080006f          	j	400878 <parse_hex+0x14>
  400874:	00160613          	addi	a2,a2,1
  400878:	ffe64503          	lbu	a0,-2(a2)
  40087c:	fed50ce3          	beq	a0,a3,400874 <parse_hex+0x10>
  400880:	fee50ae3          	beq	a0,a4,400874 <parse_hex+0x10>
  400884:	03000693          	li	a3,48
  400888:	02d51063          	bne	a0,a3,4008a8 <parse_hex+0x44>
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  40088c:	fff64503          	lbu	a0,-1(a2)
  400890:	02056513          	ori	a0,a0,32
  400894:	07800693          	li	a3,120
  400898:	02d51063          	bne	a0,a3,4008b8 <parse_hex+0x54>
    if (!*s) return -1;
  40089c:	00064503          	lbu	a0,0(a2)
  4008a0:	02051063          	bnez	a0,4008c0 <parse_hex+0x5c>
  4008a4:	00c0006f          	j	4008b0 <parse_hex+0x4c>
  4008a8:	ffe60613          	addi	a2,a2,-2
  4008ac:	00051a63          	bnez	a0,4008c0 <parse_hex+0x5c>
  4008b0:	fff00513          	li	a0,-1
    }
    *out = v;
    return 0;
  4008b4:	00008067          	ret
  4008b8:	ffe60613          	addi	a2,a2,-2
  4008bc:	03000513          	li	a0,48
  4008c0:	00000693          	li	a3,0
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  4008c4:	00160613          	addi	a2,a2,1
  4008c8:	00a00713          	li	a4,10
  4008cc:	00600793          	li	a5,6
  4008d0:	00500813          	li	a6,5
  4008d4:	0200006f          	j	4008f4 <parse_hex+0x90>
  4008d8:	0ff57293          	zext.b	t0,a0
    while (*s) {
  4008dc:	00064503          	lbu	a0,0(a2)
  4008e0:	005888b3          	add	a7,a7,t0
        v = (v << 4) | d;
  4008e4:	00469693          	slli	a3,a3,0x4
  4008e8:	00d8e6b3          	or	a3,a7,a3
    while (*s) {
  4008ec:	00160613          	addi	a2,a2,1
  4008f0:	02050a63          	beqz	a0,400924 <parse_hex+0xc0>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  4008f4:	fd050893          	addi	a7,a0,-48
  4008f8:	0ff8f293          	zext.b	t0,a7
  4008fc:	fd000893          	li	a7,-48
  400900:	fce2ece3          	bltu	t0,a4,4008d8 <parse_hex+0x74>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  400904:	f9f50893          	addi	a7,a0,-97
  400908:	0ff8f293          	zext.b	t0,a7
  40090c:	fa900893          	li	a7,-87
  400910:	fcf2e4e3          	bltu	t0,a5,4008d8 <parse_hex+0x74>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  400914:	fbf50893          	addi	a7,a0,-65
  400918:	0ff8f293          	zext.b	t0,a7
  40091c:	fc900893          	li	a7,-55
  400920:	fa587ce3          	bgeu	a6,t0,4008d8 <parse_hex+0x74>
  400924:	00000513          	li	a0,0
    *out = v;
  400928:	00d5a023          	sw	a3,0(a1)
  40092c:	00008067          	ret

00400930 <cmd_primes>:
{
  400930:	fe010113          	addi	sp,sp,-32
  400934:	00112e23          	sw	ra,28(sp)
  400938:	00812c23          	sw	s0,24(sp)
  40093c:	00912a23          	sw	s1,20(sp)
  400940:	01212823          	sw	s2,16(sp)
  400944:	01312623          	sw	s3,12(sp)
  400948:	00200913          	li	s2,2
  40094c:	00050413          	mv	s0,a0
  400950:	00000493          	li	s1,0
    for (unsigned n = 2; n <= max; n++) {
  400954:	07256463          	bltu	a0,s2,4009bc <cmd_primes+0x8c>
  400958:	00402537          	lui	a0,0x402
  40095c:	caa50993          	addi	s3,a0,-854 # 401caa <$d.1+0x1b>
  400960:	00c0006f          	j	40096c <cmd_primes+0x3c>
  400964:	00190913          	addi	s2,s2,1
  400968:	05246063          	bltu	s0,s2,4009a8 <cmd_primes+0x78>
        if (is_prime(n)) {
  40096c:	00090513          	mv	a0,s2
  400970:	00001097          	auipc	ra,0x1
  400974:	850080e7          	jalr	-1968(ra) # 4011c0 <is_prime>
  400978:	fe0506e3          	beqz	a0,400964 <cmd_primes+0x34>
            printf("%d ", (int)n);
  40097c:	00098513          	mv	a0,s3
  400980:	00090593          	mv	a1,s2
  400984:	00000097          	auipc	ra,0x0
  400988:	444080e7          	jalr	1092(ra) # 400dc8 <printf>
            count++;
  40098c:	00148493          	addi	s1,s1,1
            if ((count % 8) == 0)
  400990:	0074f513          	andi	a0,s1,7
  400994:	fc0518e3          	bnez	a0,400964 <cmd_primes+0x34>
                putchar('\n');
  400998:	00a00513          	li	a0,10
  40099c:	00000097          	auipc	ra,0x0
  4009a0:	36c080e7          	jalr	876(ra) # 400d08 <putchar>
  4009a4:	fc1ff06f          	j	400964 <cmd_primes+0x34>
    if ((count % 8) != 0)
  4009a8:	0074f513          	andi	a0,s1,7
  4009ac:	00050863          	beqz	a0,4009bc <cmd_primes+0x8c>
        putchar('\n');
  4009b0:	00a00513          	li	a0,10
  4009b4:	00000097          	auipc	ra,0x0
  4009b8:	354080e7          	jalr	852(ra) # 400d08 <putchar>
    printf("total primes: %d (0..%d)\n", count, (int)max);
  4009bc:	00402537          	lui	a0,0x402
  4009c0:	be250513          	addi	a0,a0,-1054 # 401be2 <__modsi3+0xd2>
  4009c4:	00048593          	mv	a1,s1
  4009c8:	00040613          	mv	a2,s0
  4009cc:	01c12083          	lw	ra,28(sp)
  4009d0:	01812403          	lw	s0,24(sp)
  4009d4:	01412483          	lw	s1,20(sp)
  4009d8:	01012903          	lw	s2,16(sp)
  4009dc:	00c12983          	lw	s3,12(sp)
  4009e0:	02010113          	addi	sp,sp,32
  4009e4:	00000317          	auipc	t1,0x0
  4009e8:	3e430067          	jr	996(t1) # 400dc8 <printf>

004009ec <exit>:
    __asm__ __volatile__ (
  4009ec:	00a00693          	li	a3,10
  4009f0:	00000593          	li	a1,0
  4009f4:	00000613          	li	a2,0
  4009f8:	00000513          	li	a0,0
  4009fc:	00000073          	ecall
    for (;;);
  400a00:	0000006f          	j	400a00 <exit+0x14>

00400a04 <call_sa_api>:
{
  400a04:	fa010113          	addi	sp,sp,-96
  400a08:	00050793          	mv	a5,a0
    for (uint32_t i = 0; i < matrix_size; i++) {
  400a0c:	12050063          	beqz	a0,400b2c <call_sa_api+0x128>
  400a10:	00000513          	li	a0,0
  400a14:	00000593          	li	a1,0
  400a18:	05010613          	addi	a2,sp,80
  400a1c:	04010693          	addi	a3,sp,64
  400a20:	05010713          	addi	a4,sp,80
        for (uint32_t j = 0; j < matrix_size; j++) {
  400a24:	00259813          	slli	a6,a1,0x2
  400a28:	01078833          	add	a6,a5,a6
  400a2c:	01060833          	add	a6,a2,a6
  400a30:	00068893          	mv	a7,a3
  400a34:	00070293          	mv	t0,a4
  400a38:	00058313          	mv	t1,a1
  400a3c:	00050393          	mv	t2,a0
            matrix_A[i][j] = (uint8_t)(2*i + 2*j + 2);
  400a40:	00131e13          	slli	t3,t1,0x1
  400a44:	002e0e13          	addi	t3,t3,2
  400a48:	01c28023          	sb	t3,0(t0)
            matrix_B[i][j] = (uint8_t)(3*i + j + 5);
  400a4c:	00538e13          	addi	t3,t2,5
  400a50:	01c88023          	sb	t3,0(a7)
        for (uint32_t j = 0; j < matrix_size; j++) {
  400a54:	00138393          	addi	t2,t2,1
  400a58:	00130313          	addi	t1,t1,1
  400a5c:	00128293          	addi	t0,t0,1
  400a60:	00188893          	addi	a7,a7,1
  400a64:	fd029ee3          	bne	t0,a6,400a40 <call_sa_api+0x3c>
    for (uint32_t i = 0; i < matrix_size; i++) {
  400a68:	00158593          	addi	a1,a1,1
  400a6c:	00350513          	addi	a0,a0,3
  400a70:	00470713          	addi	a4,a4,4
  400a74:	00468693          	addi	a3,a3,4
  400a78:	faf596e3          	bne	a1,a5,400a24 <call_sa_api+0x20>
  400a7c:	05010813          	addi	a6,sp,80
  400a80:	04010893          	addi	a7,sp,64
  400a84:	00010293          	mv	t0,sp
  400a88:	00300313          	li	t1,3
    __asm__ __volatile__ (
  400a8c:	00080513          	mv	a0,a6
  400a90:	00088593          	mv	a1,a7
  400a94:	00028613          	mv	a2,t0
  400a98:	00030693          	mv	a3,t1
  400a9c:	00078713          	mv	a4,a5
  400aa0:	00000073          	ecall
  400aa4:	00050893          	mv	a7,a0
  400aa8:	04100593          	li	a1,65
    __asm__ __volatile__ (
  400aac:	00058513          	mv	a0,a1
  400ab0:	00100693          	li	a3,1
  400ab4:	00000073          	ecall
  400ab8:	00a00593          	li	a1,10
  400abc:	00058513          	mv	a0,a1
  400ac0:	00100693          	li	a3,1
  400ac4:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400ac8:	16078a63          	beqz	a5,400c3c <call_sa_api+0x238>
  400acc:	00000593          	li	a1,0
  400ad0:	02000613          	li	a2,32
  400ad4:	00a00713          	li	a4,10
  400ad8:	05010893          	addi	a7,sp,80
        for (uint32_t j = 0; j < matrix_size; j++) {
  400adc:	00259513          	slli	a0,a1,0x2
  400ae0:	00a78533          	add	a0,a5,a0
  400ae4:	00a802b3          	add	t0,a6,a0
  400ae8:	00088313          	mv	t1,a7
            print_int((int)matrix_A[i][j]);
  400aec:	00034383          	lbu	t2,0(t1)
    __asm__ __volatile__ (
  400af0:	00038513          	mv	a0,t2
  400af4:	00b00693          	li	a3,11
  400af8:	00000073          	ecall
    __asm__ __volatile__ (
  400afc:	00060513          	mv	a0,a2
  400b00:	00100693          	li	a3,1
  400b04:	00000073          	ecall
        for (uint32_t j = 0; j < matrix_size; j++) {
  400b08:	00130313          	addi	t1,t1,1
  400b0c:	fe5310e3          	bne	t1,t0,400aec <call_sa_api+0xe8>
    __asm__ __volatile__ (
  400b10:	00070513          	mv	a0,a4
  400b14:	00100693          	li	a3,1
  400b18:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400b1c:	00158593          	addi	a1,a1,1
  400b20:	00488893          	addi	a7,a7,4
  400b24:	faf59ce3          	bne	a1,a5,400adc <call_sa_api+0xd8>
  400b28:	0500006f          	j	400b78 <call_sa_api+0x174>
  400b2c:	05010813          	addi	a6,sp,80
  400b30:	04010893          	addi	a7,sp,64
  400b34:	00010293          	mv	t0,sp
  400b38:	00300313          	li	t1,3
    __asm__ __volatile__ (
  400b3c:	00080513          	mv	a0,a6
  400b40:	00088593          	mv	a1,a7
  400b44:	00028613          	mv	a2,t0
  400b48:	00030693          	mv	a3,t1
  400b4c:	00078713          	mv	a4,a5
  400b50:	00000073          	ecall
  400b54:	00050813          	mv	a6,a0
  400b58:	04100593          	li	a1,65
    __asm__ __volatile__ (
  400b5c:	00058513          	mv	a0,a1
  400b60:	00100693          	li	a3,1
  400b64:	00000073          	ecall
  400b68:	00a00593          	li	a1,10
  400b6c:	00058513          	mv	a0,a1
  400b70:	00100693          	li	a3,1
  400b74:	00000073          	ecall
  400b78:	00a00593          	li	a1,10
  400b7c:	00058513          	mv	a0,a1
  400b80:	00100693          	li	a3,1
  400b84:	00000073          	ecall
  400b88:	04200613          	li	a2,66
  400b8c:	00060513          	mv	a0,a2
  400b90:	00100693          	li	a3,1
  400b94:	00000073          	ecall
  400b98:	00058513          	mv	a0,a1
  400b9c:	00100693          	li	a3,1
  400ba0:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400ba4:	06078463          	beqz	a5,400c0c <call_sa_api+0x208>
  400ba8:	00000593          	li	a1,0
  400bac:	04010613          	addi	a2,sp,64
  400bb0:	02000713          	li	a4,32
  400bb4:	00a00813          	li	a6,10
  400bb8:	04010893          	addi	a7,sp,64
        for (uint32_t j = 0; j < matrix_size; j++) {
  400bbc:	00259513          	slli	a0,a1,0x2
  400bc0:	00a78533          	add	a0,a5,a0
  400bc4:	00a602b3          	add	t0,a2,a0
  400bc8:	00088313          	mv	t1,a7
            print_int((int)matrix_B[i][j]);
  400bcc:	00034383          	lbu	t2,0(t1)
    __asm__ __volatile__ (
  400bd0:	00038513          	mv	a0,t2
  400bd4:	00b00693          	li	a3,11
  400bd8:	00000073          	ecall
    __asm__ __volatile__ (
  400bdc:	00070513          	mv	a0,a4
  400be0:	00100693          	li	a3,1
  400be4:	00000073          	ecall
        for (uint32_t j = 0; j < matrix_size; j++) {
  400be8:	00130313          	addi	t1,t1,1
  400bec:	fe5310e3          	bne	t1,t0,400bcc <call_sa_api+0x1c8>
    __asm__ __volatile__ (
  400bf0:	00080513          	mv	a0,a6
  400bf4:	00100693          	li	a3,1
  400bf8:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400bfc:	00158593          	addi	a1,a1,1
  400c00:	00488893          	addi	a7,a7,4
  400c04:	faf59ce3          	bne	a1,a5,400bbc <call_sa_api+0x1b8>
  400c08:	0600006f          	j	400c68 <call_sa_api+0x264>
  400c0c:	00a00593          	li	a1,10
    __asm__ __volatile__ (
  400c10:	00058513          	mv	a0,a1
  400c14:	00100693          	li	a3,1
  400c18:	00000073          	ecall
  400c1c:	04300613          	li	a2,67
  400c20:	00060513          	mv	a0,a2
  400c24:	00100693          	li	a3,1
  400c28:	00000073          	ecall
  400c2c:	00058513          	mv	a0,a1
  400c30:	00100693          	li	a3,1
  400c34:	00000073          	ecall
  400c38:	0b80006f          	j	400cf0 <call_sa_api+0x2ec>
  400c3c:	00a00593          	li	a1,10
  400c40:	00058513          	mv	a0,a1
  400c44:	00100693          	li	a3,1
  400c48:	00000073          	ecall
  400c4c:	04200613          	li	a2,66
  400c50:	00060513          	mv	a0,a2
  400c54:	00100693          	li	a3,1
  400c58:	00000073          	ecall
  400c5c:	00058513          	mv	a0,a1
  400c60:	00100693          	li	a3,1
  400c64:	00000073          	ecall
  400c68:	00a00593          	li	a1,10
  400c6c:	00058513          	mv	a0,a1
  400c70:	00100693          	li	a3,1
  400c74:	00000073          	ecall
  400c78:	04300613          	li	a2,67
  400c7c:	00060513          	mv	a0,a2
  400c80:	00100693          	li	a3,1
  400c84:	00000073          	ecall
  400c88:	00058513          	mv	a0,a1
  400c8c:	00100693          	li	a3,1
  400c90:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400c94:	04078e63          	beqz	a5,400cf0 <call_sa_api+0x2ec>
  400c98:	00000593          	li	a1,0
  400c9c:	00010613          	mv	a2,sp
  400ca0:	02000713          	li	a4,32
  400ca4:	00a00813          	li	a6,10
  400ca8:	00060893          	mv	a7,a2
  400cac:	00078293          	mv	t0,a5
            print_int((int)matrix_C[i][j]);
  400cb0:	0008a303          	lw	t1,0(a7)
    __asm__ __volatile__ (
  400cb4:	00030513          	mv	a0,t1
  400cb8:	00b00693          	li	a3,11
  400cbc:	00000073          	ecall
    __asm__ __volatile__ (
  400cc0:	00070513          	mv	a0,a4
  400cc4:	00100693          	li	a3,1
  400cc8:	00000073          	ecall
        for (uint32_t j = 0; j < matrix_size; j++) {
  400ccc:	fff28293          	addi	t0,t0,-1
  400cd0:	00488893          	addi	a7,a7,4
  400cd4:	fc029ee3          	bnez	t0,400cb0 <call_sa_api+0x2ac>
    __asm__ __volatile__ (
  400cd8:	00080513          	mv	a0,a6
  400cdc:	00100693          	li	a3,1
  400ce0:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400ce4:	00158593          	addi	a1,a1,1
  400ce8:	01060613          	addi	a2,a2,16
  400cec:	faf59ee3          	bne	a1,a5,400ca8 <call_sa_api+0x2a4>
  400cf0:	00a00593          	li	a1,10
    __asm__ __volatile__ (
  400cf4:	00058513          	mv	a0,a1
  400cf8:	00100693          	li	a3,1
  400cfc:	00000073          	ecall
}
  400d00:	06010113          	addi	sp,sp,96
  400d04:	00008067          	ret

00400d08 <putchar>:
{
  400d08:	00050593          	mv	a1,a0
    __asm__ __volatile__ (
  400d0c:	00058513          	mv	a0,a1
  400d10:	00100693          	li	a3,1
  400d14:	00000073          	ecall
}
  400d18:	00008067          	ret

00400d1c <print_int>:
{
  400d1c:	00050593          	mv	a1,a0
    __asm__ __volatile__ (
  400d20:	00058513          	mv	a0,a1
  400d24:	00b00693          	li	a3,11
  400d28:	00000073          	ecall
}
  400d2c:	00008067          	ret

00400d30 <call_mic_api>:
    __asm__ __volatile__(
  400d30:	00400693          	li	a3,4
  400d34:	00000073          	ecall
}
  400d38:	00008067          	ret

00400d3c <call_sd_api>:
    __asm__ __volatile__(
  400d3c:	00500693          	li	a3,5
  400d40:	00000073          	ecall
}
  400d44:	00008067          	ret

00400d48 <call_dump_api>:
    __asm__ __volatile__(
  400d48:	00700693          	li	a3,7
  400d4c:	00000073          	ecall
}
  400d50:	00008067          	ret

00400d54 <strcpy>:
    while (*src)
  400d54:	0005c603          	lbu	a2,0(a1)
  400d58:	00050693          	mv	a3,a0
  400d5c:	02060263          	beqz	a2,400d80 <strcpy+0x2c>
  400d60:	00158593          	addi	a1,a1,1
  400d64:	00050713          	mv	a4,a0
        *d++ = *src++;
  400d68:	00c70023          	sb	a2,0(a4)
    while (*src)
  400d6c:	0005c603          	lbu	a2,0(a1)
        *d++ = *src++;
  400d70:	00170693          	addi	a3,a4,1
    while (*src)
  400d74:	00158593          	addi	a1,a1,1
  400d78:	00068713          	mv	a4,a3
  400d7c:	fe0616e3          	bnez	a2,400d68 <strcpy+0x14>
    *d = '\0';
  400d80:	00068023          	sb	zero,0(a3)
    return dst;
  400d84:	00008067          	ret

00400d88 <strcmp>:
    while (*s1 && *s2) {
  400d88:	00054603          	lbu	a2,0(a0)
  400d8c:	02060663          	beqz	a2,400db8 <strcmp+0x30>
  400d90:	00150513          	addi	a0,a0,1
  400d94:	0005c683          	lbu	a3,0(a1)
  400d98:	0ff67713          	zext.b	a4,a2
  400d9c:	00d71a63          	bne	a4,a3,400db0 <strcmp+0x28>
  400da0:	00054603          	lbu	a2,0(a0)
        s2++;
  400da4:	00158593          	addi	a1,a1,1
    while (*s1 && *s2) {
  400da8:	00150513          	addi	a0,a0,1
  400dac:	fe0614e3          	bnez	a2,400d94 <strcmp+0xc>
    return *(unsigned char *)s1 - *(unsigned char *)s2;
  400db0:	0ff67513          	zext.b	a0,a2
  400db4:	0080006f          	j	400dbc <strcmp+0x34>
  400db8:	00000513          	li	a0,0
  400dbc:	0005c583          	lbu	a1,0(a1)
  400dc0:	40b50533          	sub	a0,a0,a1
  400dc4:	00008067          	ret

00400dc8 <printf>:
void printf(const char *fmt, ...) {
  400dc8:	f9010113          	addi	sp,sp,-112
  400dcc:	04112623          	sw	ra,76(sp)
  400dd0:	04812423          	sw	s0,72(sp)
  400dd4:	04912223          	sw	s1,68(sp)
  400dd8:	05212023          	sw	s2,64(sp)
  400ddc:	03312e23          	sw	s3,60(sp)
  400de0:	03412c23          	sw	s4,56(sp)
  400de4:	03512a23          	sw	s5,52(sp)
  400de8:	03612823          	sw	s6,48(sp)
  400dec:	03712623          	sw	s7,44(sp)
  400df0:	03812423          	sw	s8,40(sp)
  400df4:	03912223          	sw	s9,36(sp)
  400df8:	03a12023          	sw	s10,32(sp)
  400dfc:	01b12e23          	sw	s11,28(sp)
  400e00:	00050a93          	mv	s5,a0
  400e04:	07112623          	sw	a7,108(sp)
  400e08:	07012423          	sw	a6,104(sp)
  400e0c:	06f12223          	sw	a5,100(sp)
  400e10:	06e12023          	sw	a4,96(sp)
  400e14:	04d12e23          	sw	a3,92(sp)
  400e18:	04c12c23          	sw	a2,88(sp)
  400e1c:	04b12a23          	sw	a1,84(sp)
  400e20:	05410513          	addi	a0,sp,84
    va_start(vargs, fmt);
  400e24:	00a12c23          	sw	a0,24(sp)
  400e28:	02500913          	li	s2,37
  400e2c:	07200993          	li	s3,114
  400e30:	06400713          	li	a4,100
  400e34:	00d10b13          	addi	s6,sp,13
  400e38:	00900b93          	li	s7,9
  400e3c:	00100c13          	li	s8,1
  400e40:	07300d13          	li	s10,115
  400e44:	07800d93          	li	s11,120
  400e48:	00402537          	lui	a0,0x402
  400e4c:	ccc50c93          	addi	s9,a0,-820 # 401ccc <$d.2>
  400e50:	00c0006f          	j	400e5c <printf+0x94>
            switch (*fmt) {
  400e54:	22050863          	beqz	a0,401084 <printf+0x2bc>
        fmt++;
  400e58:	001a8a93          	addi	s5,s5,1
    while (*fmt) {
  400e5c:	000ac583          	lbu	a1,0(s5)
  400e60:	01258e63          	beq	a1,s2,400e7c <printf+0xb4>
  400e64:	22058863          	beqz	a1,401094 <printf+0x2cc>
    __asm__ __volatile__ (
  400e68:	00058513          	mv	a0,a1
  400e6c:	00100693          	li	a3,1
  400e70:	00000073          	ecall
        fmt++;
  400e74:	001a8a93          	addi	s5,s5,1
  400e78:	fe5ff06f          	j	400e5c <printf+0x94>
            switch (*fmt) {
  400e7c:	001ac503          	lbu	a0,1(s5)
            fmt++;
  400e80:	001a8a93          	addi	s5,s5,1
            switch (*fmt) {
  400e84:	02a9ce63          	blt	s3,a0,400ec0 <printf+0xf8>
  400e88:	13250863          	beq	a0,s2,400fb8 <printf+0x1f0>
  400e8c:	fce514e3          	bne	a0,a4,400e54 <printf+0x8c>
                    int value = va_arg(vargs, int);
  400e90:	01812503          	lw	a0,24(sp)
  400e94:	00450593          	addi	a1,a0,4
  400e98:	00b12c23          	sw	a1,24(sp)
  400e9c:	00052403          	lw	s0,0(a0)
                    if (value < 0) {
  400ea0:	16044263          	bltz	s0,401004 <printf+0x23c>
                    if (u == 0) {
  400ea4:	16041a63          	bnez	s0,401018 <printf+0x250>
    __asm__ __volatile__ (
  400ea8:	03000593          	li	a1,48
  400eac:	00058513          	mv	a0,a1
  400eb0:	00100693          	li	a3,1
  400eb4:	00000073          	ecall
        fmt++;
  400eb8:	001a8a93          	addi	s5,s5,1
  400ebc:	fa1ff06f          	j	400e5c <printf+0x94>
            switch (*fmt) {
  400ec0:	11a50663          	beq	a0,s10,400fcc <printf+0x204>
  400ec4:	f9b51ae3          	bne	a0,s11,400e58 <printf+0x90>
                    unsigned value = va_arg(vargs, unsigned);
  400ec8:	01812503          	lw	a0,24(sp)
  400ecc:	00450593          	addi	a1,a0,4
  400ed0:	00b12c23          	sw	a1,24(sp)
  400ed4:	00052583          	lw	a1,0(a0)
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400ed8:	01c5d513          	srli	a0,a1,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400edc:	00ac8533          	add	a0,s9,a0
  400ee0:	00054603          	lbu	a2,0(a0)
    __asm__ __volatile__ (
  400ee4:	00060513          	mv	a0,a2
  400ee8:	00100693          	li	a3,1
  400eec:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400ef0:	00459513          	slli	a0,a1,0x4
  400ef4:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400ef8:	00ac8533          	add	a0,s9,a0
  400efc:	00054603          	lbu	a2,0(a0)
    __asm__ __volatile__ (
  400f00:	00060513          	mv	a0,a2
  400f04:	00100693          	li	a3,1
  400f08:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400f0c:	00859513          	slli	a0,a1,0x8
  400f10:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400f14:	00ac8533          	add	a0,s9,a0
  400f18:	00054603          	lbu	a2,0(a0)
    __asm__ __volatile__ (
  400f1c:	00060513          	mv	a0,a2
  400f20:	00100693          	li	a3,1
  400f24:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400f28:	00c59513          	slli	a0,a1,0xc
  400f2c:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400f30:	00ac8533          	add	a0,s9,a0
  400f34:	00054603          	lbu	a2,0(a0)
    __asm__ __volatile__ (
  400f38:	00060513          	mv	a0,a2
  400f3c:	00100693          	li	a3,1
  400f40:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400f44:	01059513          	slli	a0,a1,0x10
  400f48:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400f4c:	00ac8533          	add	a0,s9,a0
  400f50:	00054603          	lbu	a2,0(a0)
    __asm__ __volatile__ (
  400f54:	00060513          	mv	a0,a2
  400f58:	00100693          	li	a3,1
  400f5c:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400f60:	01459513          	slli	a0,a1,0x14
  400f64:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400f68:	00ac8533          	add	a0,s9,a0
  400f6c:	00054603          	lbu	a2,0(a0)
    __asm__ __volatile__ (
  400f70:	00060513          	mv	a0,a2
  400f74:	00100693          	li	a3,1
  400f78:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400f7c:	01859513          	slli	a0,a1,0x18
  400f80:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400f84:	00ac8533          	add	a0,s9,a0
  400f88:	00054603          	lbu	a2,0(a0)
    __asm__ __volatile__ (
  400f8c:	00060513          	mv	a0,a2
  400f90:	00100693          	li	a3,1
  400f94:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400f98:	00f5f593          	andi	a1,a1,15
                        putchar("0123456789abcdef"[nibble]);
  400f9c:	00bc85b3          	add	a1,s9,a1
  400fa0:	0005c583          	lbu	a1,0(a1)
    __asm__ __volatile__ (
  400fa4:	00058513          	mv	a0,a1
  400fa8:	00100693          	li	a3,1
  400fac:	00000073          	ecall
        fmt++;
  400fb0:	001a8a93          	addi	s5,s5,1
  400fb4:	ea9ff06f          	j	400e5c <printf+0x94>
    __asm__ __volatile__ (
  400fb8:	00090513          	mv	a0,s2
  400fbc:	00100693          	li	a3,1
  400fc0:	00000073          	ecall
        fmt++;
  400fc4:	001a8a93          	addi	s5,s5,1
  400fc8:	e95ff06f          	j	400e5c <printf+0x94>
                    const char *s = va_arg(vargs, const char *);
  400fcc:	01812503          	lw	a0,24(sp)
  400fd0:	00450593          	addi	a1,a0,4
  400fd4:	00b12c23          	sw	a1,24(sp)
  400fd8:	00052603          	lw	a2,0(a0)
                    while (*s) {
  400fdc:	00064583          	lbu	a1,0(a2)
  400fe0:	e6058ce3          	beqz	a1,400e58 <printf+0x90>
  400fe4:	00160613          	addi	a2,a2,1
    __asm__ __volatile__ (
  400fe8:	00058513          	mv	a0,a1
  400fec:	00100693          	li	a3,1
  400ff0:	00000073          	ecall
                    while (*s) {
  400ff4:	00064583          	lbu	a1,0(a2)
  400ff8:	00160613          	addi	a2,a2,1
  400ffc:	fe0596e3          	bnez	a1,400fe8 <printf+0x220>
  401000:	e59ff06f          	j	400e58 <printf+0x90>
    __asm__ __volatile__ (
  401004:	02d00593          	li	a1,45
  401008:	00058513          	mv	a0,a1
  40100c:	00100693          	li	a3,1
  401010:	00000073          	ecall
                        u = (unsigned int)(-(value + 1)) + 1;
  401014:	40800433          	neg	s0,s0
  401018:	00000513          	li	a0,0
  40101c:	00040493          	mv	s1,s0
  401020:	00050a13          	mv	s4,a0
                        u /= 10;
  401024:	00a00593          	li	a1,10
  401028:	00040513          	mv	a0,s0
  40102c:	00001097          	auipc	ra,0x1
  401030:	9c8080e7          	jalr	-1592(ra) # 4019f4 <__udivsi3>
  401034:	00050413          	mv	s0,a0
  401038:	00a00593          	li	a1,10
  40103c:	00001097          	auipc	ra,0x1
  401040:	98c080e7          	jalr	-1652(ra) # 4019c8 <__mulsi3>
  401044:	40a48533          	sub	a0,s1,a0
                        buf[i++] = '0' + (u % 10);
  401048:	03056593          	ori	a1,a0,48
  40104c:	001a0513          	addi	a0,s4,1
  401050:	014b0633          	add	a2,s6,s4
  401054:	00b60023          	sb	a1,0(a2)
                    while (u > 0) {
  401058:	fc9be2e3          	bltu	s7,s1,40101c <printf+0x254>
  40105c:	06400713          	li	a4,100
                        putchar(buf[--i]);
  401060:	014b0533          	add	a0,s6,s4
  401064:	00054583          	lbu	a1,0(a0)
    __asm__ __volatile__ (
  401068:	00058513          	mv	a0,a1
  40106c:	00100693          	li	a3,1
  401070:	00000073          	ecall
                    while (i > 0) {
  401074:	001a0513          	addi	a0,s4,1
  401078:	fffa0a13          	addi	s4,s4,-1
  40107c:	feac42e3          	blt	s8,a0,401060 <printf+0x298>
  401080:	dd9ff06f          	j	400e58 <printf+0x90>
  401084:	02500593          	li	a1,37
    __asm__ __volatile__ (
  401088:	00058513          	mv	a0,a1
  40108c:	00100693          	li	a3,1
  401090:	00000073          	ecall
  401094:	04c12083          	lw	ra,76(sp)
  401098:	04812403          	lw	s0,72(sp)
  40109c:	04412483          	lw	s1,68(sp)
  4010a0:	04012903          	lw	s2,64(sp)
  4010a4:	03c12983          	lw	s3,60(sp)
  4010a8:	03812a03          	lw	s4,56(sp)
  4010ac:	03412a83          	lw	s5,52(sp)
  4010b0:	03012b03          	lw	s6,48(sp)
  4010b4:	02c12b83          	lw	s7,44(sp)
  4010b8:	02812c03          	lw	s8,40(sp)
  4010bc:	02412c83          	lw	s9,36(sp)
  4010c0:	02012d03          	lw	s10,32(sp)
  4010c4:	01c12d83          	lw	s11,28(sp)
}
  4010c8:	07010113          	addi	sp,sp,112
  4010cc:	00008067          	ret

004010d0 <parse_u32>:
unsigned parse_u32(const char *s) {
  4010d0:	fe010113          	addi	sp,sp,-32
  4010d4:	00112e23          	sw	ra,28(sp)
  4010d8:	00812c23          	sw	s0,24(sp)
  4010dc:	00912a23          	sw	s1,20(sp)
  4010e0:	01212823          	sw	s2,16(sp)
  4010e4:	01312623          	sw	s3,12(sp)
  4010e8:	01412423          	sw	s4,8(sp)
  4010ec:	01512223          	sw	s5,4(sp)
  4010f0:	00050593          	mv	a1,a0
    if ((s[0] == '0') && (s[1] == 'x' || s[1] == 'X')) {
  4010f4:	00054503          	lbu	a0,0(a0)
  4010f8:	03000613          	li	a2,48
  4010fc:	00a00413          	li	s0,10
  401100:	02c51063          	bne	a0,a2,401120 <parse_u32+0x50>
  401104:	0015c503          	lbu	a0,1(a1)
  401108:	02056513          	ori	a0,a0,32
  40110c:	07800693          	li	a3,120
  401110:	00d51e63          	bne	a0,a3,40112c <parse_u32+0x5c>
    while (*s) {
  401114:	0025c503          	lbu	a0,2(a1)
        s += 2;
  401118:	00258593          	addi	a1,a1,2
  40111c:	01000413          	li	s0,16
  401120:	00050613          	mv	a2,a0
    while (*s) {
  401124:	00051663          	bnez	a0,401130 <parse_u32+0x60>
  401128:	0740006f          	j	40119c <parse_u32+0xcc>
  40112c:	00a00413          	li	s0,10
  401130:	00000513          	li	a0,0
        if (c >= '0' && c <= '9')       d = (unsigned)(c - '0');
  401134:	00158493          	addi	s1,a1,1
  401138:	00a00913          	li	s2,10
  40113c:	00600993          	li	s3,6
  401140:	00500a13          	li	s4,5
  401144:	fd060593          	addi	a1,a2,-48
  401148:	0ff5f693          	zext.b	a3,a1
  40114c:	fd000593          	li	a1,-48
  401150:	0326e263          	bltu	a3,s2,401174 <parse_u32+0xa4>
        else if (c >= 'a' && c <= 'f')  d = 10u + (unsigned)(c - 'a');
  401154:	f9f60593          	addi	a1,a2,-97
  401158:	0ff5f693          	zext.b	a3,a1
  40115c:	fa900593          	li	a1,-87
  401160:	0136ea63          	bltu	a3,s3,401174 <parse_u32+0xa4>
        else if (c >= 'A' && c <= 'F')  d = 10u + (unsigned)(c - 'A');
  401164:	fbf60593          	addi	a1,a2,-65
  401168:	0ff5f693          	zext.b	a3,a1
  40116c:	fc900593          	li	a1,-55
  401170:	02da6663          	bltu	s4,a3,40119c <parse_u32+0xcc>
  401174:	0ff67a93          	zext.b	s5,a2
  401178:	01558ab3          	add	s5,a1,s5
        if (d >= base) break;
  40117c:	028af063          	bgeu	s5,s0,40119c <parse_u32+0xcc>
        v = v * base + d;
  401180:	00040593          	mv	a1,s0
  401184:	00001097          	auipc	ra,0x1
  401188:	844080e7          	jalr	-1980(ra) # 4019c8 <__mulsi3>
    while (*s) {
  40118c:	0004c603          	lbu	a2,0(s1)
        v = v * base + d;
  401190:	00aa8533          	add	a0,s5,a0
    while (*s) {
  401194:	00148493          	addi	s1,s1,1
  401198:	fa0616e3          	bnez	a2,401144 <parse_u32+0x74>
  40119c:	01c12083          	lw	ra,28(sp)
  4011a0:	01812403          	lw	s0,24(sp)
  4011a4:	01412483          	lw	s1,20(sp)
  4011a8:	01012903          	lw	s2,16(sp)
  4011ac:	00c12983          	lw	s3,12(sp)
  4011b0:	00812a03          	lw	s4,8(sp)
  4011b4:	00412a83          	lw	s5,4(sp)
    return v;
  4011b8:	02010113          	addi	sp,sp,32
  4011bc:	00008067          	ret

004011c0 <is_prime>:
{
  4011c0:	00200593          	li	a1,2
    if (n < 2) return false;
  4011c4:	00b57663          	bgeu	a0,a1,4011d0 <is_prime+0x10>
  4011c8:	00000513          	li	a0,0
}
  4011cc:	00008067          	ret
  4011d0:	ff010113          	addi	sp,sp,-16
  4011d4:	00112623          	sw	ra,12(sp)
  4011d8:	00812423          	sw	s0,8(sp)
  4011dc:	00912223          	sw	s1,4(sp)
  4011e0:	01212023          	sw	s2,0(sp)
  4011e4:	00050413          	mv	s0,a0
  4011e8:	00400593          	li	a1,4
  4011ec:	00100513          	li	a0,1
    for (unsigned i = 2; i * i <= n; i++) {
  4011f0:	02b46e63          	bltu	s0,a1,40122c <is_prime+0x6c>
  4011f4:	00200493          	li	s1,2
        if (n % i == 0)
  4011f8:	00040513          	mv	a0,s0
  4011fc:	00048593          	mv	a1,s1
  401200:	00001097          	auipc	ra,0x1
  401204:	850080e7          	jalr	-1968(ra) # 401a50 <__umodsi3>
  401208:	00050913          	mv	s2,a0
  40120c:	00050e63          	beqz	a0,401228 <is_prime+0x68>
    for (unsigned i = 2; i * i <= n; i++) {
  401210:	00148493          	addi	s1,s1,1
  401214:	00048513          	mv	a0,s1
  401218:	00048593          	mv	a1,s1
  40121c:	00000097          	auipc	ra,0x0
  401220:	7ac080e7          	jalr	1964(ra) # 4019c8 <__mulsi3>
  401224:	fca47ae3          	bgeu	s0,a0,4011f8 <is_prime+0x38>
        if (n % i == 0)
  401228:	01203533          	snez	a0,s2
  40122c:	00c12083          	lw	ra,12(sp)
  401230:	00812403          	lw	s0,8(sp)
  401234:	00412483          	lw	s1,4(sp)
  401238:	00012903          	lw	s2,0(sp)
  40123c:	01010113          	addi	sp,sp,16
}
  401240:	00008067          	ret

00401244 <getchar>:
    __asm__ __volatile__ (
  401244:	00200693          	li	a3,2
  401248:	00000073          	ecall
  40124c:	00050593          	mv	a1,a0
    return ch;
  401250:	00058513          	mv	a0,a1
  401254:	00008067          	ret

00401258 <call_sd_read_buf_api>:
    __asm__ __volatile__(
  401258:	00600693          	li	a3,6
  40125c:	00000073          	ecall
    return (int)a0;
  401260:	00008067          	ret

00401264 <fat32_cat>:
static uint8_t fat32_buf[512];

fat32_info_t g_fat32;

int fat32_cat(const char *name)
{
  401264:	de010113          	addi	sp,sp,-544
  401268:	20112e23          	sw	ra,540(sp)
  40126c:	20812c23          	sw	s0,536(sp)
  401270:	20912a23          	sw	s1,532(sp)
  401274:	00050413          	mv	s0,a0
    uint8_t buf[512];

    uint32_t cluster;
    uint32_t size;

    if (fat32_mount())
  401278:	00000097          	auipc	ra,0x0
  40127c:	0dc080e7          	jalr	220(ra) # 401354 <fat32_mount>
  401280:	00050593          	mv	a1,a0
  401284:	fff00513          	li	a0,-1
  401288:	0a059c63          	bnez	a1,401340 <fat32_cat+0xdc>
        return -1;

    if (fat32_find(name, &cluster, &size)) {
  40128c:	01010593          	addi	a1,sp,16
  401290:	00c10613          	addi	a2,sp,12
  401294:	00040513          	mv	a0,s0
  401298:	00000097          	auipc	ra,0x0
  40129c:	1e8080e7          	jalr	488(ra) # 401480 <fat32_find>
  4012a0:	00050e63          	beqz	a0,4012bc <fat32_cat+0x58>
        printf("file not found\n");
  4012a4:	00402537          	lui	a0,0x402
  4012a8:	d1550513          	addi	a0,a0,-747 # 401d15 <$d.1>
  4012ac:	00000097          	auipc	ra,0x0
  4012b0:	b1c080e7          	jalr	-1252(ra) # 400dc8 <printf>
  4012b4:	fff00513          	li	a0,-1
  4012b8:	0880006f          	j	401340 <fat32_cat+0xdc>
        return -1;
    }

    uint32_t lba =
        cluster_to_lba(cluster);
  4012bc:	01012583          	lw	a1,16(sp)
    return -1;
}

uint32_t cluster_to_lba(uint32_t cluster)
{
    return g_fat32.data_begin +
  4012c0:	00402537          	lui	a0,0x402
  4012c4:	f3850513          	addi	a0,a0,-200 # 401f38 <g_fat32>
  4012c8:	00852403          	lw	s0,8(a0)
           (cluster - 2) *
           g_fat32.sectors_per_cluster;
  4012cc:	01052503          	lw	a0,16(a0)
           (cluster - 2) *
  4012d0:	ffe58593          	addi	a1,a1,-2
  4012d4:	00000097          	auipc	ra,0x0
  4012d8:	6f4080e7          	jalr	1780(ra) # 4019c8 <__mulsi3>
    return g_fat32.data_begin +
  4012dc:	00850533          	add	a0,a0,s0
    if (call_sd_read_buf_api(lba, buf))
  4012e0:	01410593          	addi	a1,sp,20
  4012e4:	00000097          	auipc	ra,0x0
  4012e8:	f74080e7          	jalr	-140(ra) # 401258 <call_sd_read_buf_api>
  4012ec:	00050593          	mv	a1,a0
  4012f0:	fff00513          	li	a0,-1
  4012f4:	04059663          	bnez	a1,401340 <fat32_cat+0xdc>
  4012f8:	00c12503          	lw	a0,12(sp)
    for (uint32_t i = 0; i < size; i++) {
  4012fc:	02050a63          	beqz	a0,401330 <fat32_cat+0xcc>
  401300:	fff50513          	addi	a0,a0,-1
  401304:	1ff00593          	li	a1,511
  401308:	00b56463          	bltu	a0,a1,401310 <fat32_cat+0xac>
  40130c:	1ff00513          	li	a0,511
  401310:	01410413          	addi	s0,sp,20
  401314:	00850533          	add	a0,a0,s0
  401318:	00150493          	addi	s1,a0,1
        putchar(buf[i]);
  40131c:	00044503          	lbu	a0,0(s0)
  401320:	00000097          	auipc	ra,0x0
  401324:	9e8080e7          	jalr	-1560(ra) # 400d08 <putchar>
    for (uint32_t i = 0; i < size; i++) {
  401328:	00140413          	addi	s0,s0,1
  40132c:	fe9418e3          	bne	s0,s1,40131c <fat32_cat+0xb8>
    putchar('\n');
  401330:	00a00513          	li	a0,10
  401334:	00000097          	auipc	ra,0x0
  401338:	9d4080e7          	jalr	-1580(ra) # 400d08 <putchar>
  40133c:	00000513          	li	a0,0
  401340:	21c12083          	lw	ra,540(sp)
  401344:	21812403          	lw	s0,536(sp)
  401348:	21412483          	lw	s1,532(sp)
}
  40134c:	22010113          	addi	sp,sp,544
  401350:	00008067          	ret

00401354 <fat32_mount>:
}

int fat32_mount(void)
{
  401354:	ff010113          	addi	sp,sp,-16
  401358:	00112623          	sw	ra,12(sp)
  40135c:	00812423          	sw	s0,8(sp)
  401360:	00912223          	sw	s1,4(sp)
  401364:	01212023          	sw	s2,0(sp)
    uint8_t *buf = fat32_buf;

    if (call_sd_read_buf_api(0, buf))
  401368:	00402537          	lui	a0,0x402
  40136c:	d3850493          	addi	s1,a0,-712 # 401d38 <fat32_buf>
  401370:	00000513          	li	a0,0
  401374:	00048593          	mv	a1,s1
  401378:	00000097          	auipc	ra,0x0
  40137c:	ee0080e7          	jalr	-288(ra) # 401258 <call_sd_read_buf_api>
  401380:	fff00413          	li	s0,-1
  401384:	0e051063          	bnez	a0,401464 <fat32_mount+0x110>
        return -1;

    g_fat32.part_lba =
        ((uint32_t)buf[0x1C6]) |
        ((uint32_t)buf[0x1C7] << 8) |
  401388:	1c74c503          	lbu	a0,455(s1)
        ((uint32_t)buf[0x1C6]) |
  40138c:	1c64c583          	lbu	a1,454(s1)
        ((uint32_t)buf[0x1C8] << 16) |
  401390:	1c84c603          	lbu	a2,456(s1)
        ((uint32_t)buf[0x1C9] << 24);
  401394:	1c94c683          	lbu	a3,457(s1)
        ((uint32_t)buf[0x1C7] << 8) |
  401398:	00851513          	slli	a0,a0,0x8
        ((uint32_t)buf[0x1C6]) |
  40139c:	00b56533          	or	a0,a0,a1
        ((uint32_t)buf[0x1C8] << 16) |
  4013a0:	01061613          	slli	a2,a2,0x10
        ((uint32_t)buf[0x1C9] << 24);
  4013a4:	01869693          	slli	a3,a3,0x18
        ((uint32_t)buf[0x1C7] << 8) |
  4013a8:	00d66633          	or	a2,a2,a3
        ((uint32_t)buf[0x1C8] << 16) |
  4013ac:	00c56533          	or	a0,a0,a2
    g_fat32.part_lba =
  4013b0:	00402937          	lui	s2,0x402
  4013b4:	f2a92c23          	sw	a0,-200(s2) # 401f38 <g_fat32>

    if (call_sd_read_buf_api(g_fat32.part_lba, buf))
  4013b8:	00048593          	mv	a1,s1
  4013bc:	00000097          	auipc	ra,0x0
  4013c0:	e9c080e7          	jalr	-356(ra) # 401258 <call_sd_read_buf_api>
  4013c4:	0a051063          	bnez	a0,401464 <fat32_mount+0x110>
        return -1;

    uint32_t reserved =
        ((uint32_t)buf[14]) |
  4013c8:	00402537          	lui	a0,0x402
  4013cc:	d3850593          	addi	a1,a0,-712 # 401d38 <fat32_buf>
        ((uint32_t)buf[15] << 8);
  4013d0:	00f5c503          	lbu	a0,15(a1)
        ((uint32_t)buf[14]) |
  4013d4:	00e5c603          	lbu	a2,14(a1)
        ((uint32_t)buf[15] << 8);
  4013d8:	00851513          	slli	a0,a0,0x8
        ((uint32_t)buf[14]) |
  4013dc:	00c56633          	or	a2,a0,a2
    uint32_t fat_count =
        (uint32_t)buf[16];

    uint32_t fat_size =
        ((uint32_t)buf[36]) |
        ((uint32_t)buf[37] << 8) |
  4013e0:	0255c503          	lbu	a0,37(a1)
        ((uint32_t)buf[36]) |
  4013e4:	0245c683          	lbu	a3,36(a1)
        ((uint32_t)buf[38] << 16) |
  4013e8:	0265c703          	lbu	a4,38(a1)
        ((uint32_t)buf[39] << 24);
  4013ec:	0275c783          	lbu	a5,39(a1)
        ((uint32_t)buf[37] << 8) |
  4013f0:	00851513          	slli	a0,a0,0x8
        ((uint32_t)buf[36]) |
  4013f4:	00d56533          	or	a0,a0,a3
        ((uint32_t)buf[38] << 16) |
  4013f8:	01071713          	slli	a4,a4,0x10
        ((uint32_t)buf[39] << 24);
  4013fc:	01879793          	slli	a5,a5,0x18
        ((uint32_t)buf[37] << 8) |
  401400:	00f76733          	or	a4,a4,a5

    g_fat32.sectors_per_cluster =
        (uint32_t)buf[13];
  401404:	00d5c683          	lbu	a3,13(a1)
        ((uint32_t)buf[38] << 16) |
  401408:	00e56533          	or	a0,a0,a4

    g_fat32.root_cluster =
        ((uint32_t)buf[44]) |
        ((uint32_t)buf[45] << 8) |
  40140c:	02d5c703          	lbu	a4,45(a1)
    g_fat32.sectors_per_cluster =
  401410:	f3890493          	addi	s1,s2,-200
  401414:	00d4a823          	sw	a3,16(s1)
        ((uint32_t)buf[44]) |
  401418:	02c5c683          	lbu	a3,44(a1)
        ((uint32_t)buf[45] << 8) |
  40141c:	00871713          	slli	a4,a4,0x8
        ((uint32_t)buf[46] << 16) |
  401420:	02e5c783          	lbu	a5,46(a1)
        ((uint32_t)buf[47] << 24);
  401424:	02f5c803          	lbu	a6,47(a1)
        ((uint32_t)buf[44]) |
  401428:	00d766b3          	or	a3,a4,a3
        (uint32_t)buf[16];
  40142c:	0105c583          	lbu	a1,16(a1)
        ((uint32_t)buf[46] << 16) |
  401430:	01079793          	slli	a5,a5,0x10
        ((uint32_t)buf[47] << 24);
  401434:	01881813          	slli	a6,a6,0x18

    g_fat32.fat_begin =
        g_fat32.part_lba + reserved;
  401438:	f3892703          	lw	a4,-200(s2)
        ((uint32_t)buf[45] << 8) |
  40143c:	0107e7b3          	or	a5,a5,a6
        ((uint32_t)buf[46] << 16) |
  401440:	00f6e6b3          	or	a3,a3,a5
    g_fat32.root_cluster =
  401444:	00d4a623          	sw	a3,12(s1)
        g_fat32.part_lba + reserved;
  401448:	00c70933          	add	s2,a4,a2
    g_fat32.fat_begin =
  40144c:	0124a223          	sw	s2,4(s1)

    g_fat32.data_begin =
        g_fat32.fat_begin + fat_count * fat_size;
  401450:	00000097          	auipc	ra,0x0
  401454:	578080e7          	jalr	1400(ra) # 4019c8 <__mulsi3>
  401458:	00000413          	li	s0,0
  40145c:	00a90533          	add	a0,s2,a0
    g_fat32.data_begin =
  401460:	00a4a423          	sw	a0,8(s1)

    return 0;
}
  401464:	00040513          	mv	a0,s0
  401468:	00c12083          	lw	ra,12(sp)
  40146c:	00812403          	lw	s0,8(sp)
  401470:	00412483          	lw	s1,4(sp)
  401474:	00012903          	lw	s2,0(sp)
  401478:	01010113          	addi	sp,sp,16
  40147c:	00008067          	ret

00401480 <fat32_find>:
{
  401480:	fc010113          	addi	sp,sp,-64
  401484:	02112e23          	sw	ra,60(sp)
  401488:	02812c23          	sw	s0,56(sp)
  40148c:	02912a23          	sw	s1,52(sp)
  401490:	03212823          	sw	s2,48(sp)
  401494:	03312623          	sw	s3,44(sp)
  401498:	03412423          	sw	s4,40(sp)
  40149c:	03512223          	sw	s5,36(sp)
  4014a0:	03612023          	sw	s6,32(sp)
  4014a4:	01712e23          	sw	s7,28(sp)
  4014a8:	01812c23          	sw	s8,24(sp)
  4014ac:	01912a23          	sw	s9,20(sp)
  4014b0:	01a12823          	sw	s10,16(sp)
  4014b4:	00060413          	mv	s0,a2
  4014b8:	00058493          	mv	s1,a1
  4014bc:	00050a13          	mv	s4,a0
    if (fat32_mount())
  4014c0:	00000097          	auipc	ra,0x0
  4014c4:	e94080e7          	jalr	-364(ra) # 401354 <fat32_mount>
  4014c8:	fff00913          	li	s2,-1
  4014cc:	04051063          	bnez	a0,40150c <fat32_find+0x8c>
        cluster_to_lba(g_fat32.root_cluster);
  4014d0:	00402537          	lui	a0,0x402
  4014d4:	f3850513          	addi	a0,a0,-200 # 401f38 <g_fat32>
  4014d8:	00c52583          	lw	a1,12(a0)
    return g_fat32.data_begin +
  4014dc:	00852983          	lw	s3,8(a0)
           g_fat32.sectors_per_cluster;
  4014e0:	01052503          	lw	a0,16(a0)
           (cluster - 2) *
  4014e4:	ffe58593          	addi	a1,a1,-2
  4014e8:	00000097          	auipc	ra,0x0
  4014ec:	4e0080e7          	jalr	1248(ra) # 4019c8 <__mulsi3>
    return g_fat32.data_begin +
  4014f0:	01350533          	add	a0,a0,s3
    if (call_sd_read_buf_api(root_lba, buf))
  4014f4:	004025b7          	lui	a1,0x402
  4014f8:	d3858993          	addi	s3,a1,-712 # 401d38 <fat32_buf>
  4014fc:	00098593          	mv	a1,s3
  401500:	00000097          	auipc	ra,0x0
  401504:	d58080e7          	jalr	-680(ra) # 401258 <call_sd_read_buf_api>
  401508:	04050063          	beqz	a0,401548 <fat32_find+0xc8>
}
  40150c:	00090513          	mv	a0,s2
  401510:	03c12083          	lw	ra,60(sp)
  401514:	03812403          	lw	s0,56(sp)
  401518:	03412483          	lw	s1,52(sp)
  40151c:	03012903          	lw	s2,48(sp)
  401520:	02c12983          	lw	s3,44(sp)
  401524:	02812a03          	lw	s4,40(sp)
  401528:	02412a83          	lw	s5,36(sp)
  40152c:	02012b03          	lw	s6,32(sp)
  401530:	01c12b83          	lw	s7,28(sp)
  401534:	01812c03          	lw	s8,24(sp)
  401538:	01412c83          	lw	s9,20(sp)
  40153c:	01012d03          	lw	s10,16(sp)
  401540:	04010113          	addi	sp,sp,64
  401544:	00008067          	ret
  401548:	01000a93          	li	s5,16
  40154c:	0e500b13          	li	s6,229
  401550:	00f00b93          	li	s7,15
  401554:	02000c13          	li	s8,32
  401558:	00310c93          	addi	s9,sp,3
  40155c:	02e00d13          	li	s10,46
  401560:	0380006f          	j	401598 <fat32_find+0x118>
                    shortname[k++] = e[j];
  401564:	00158513          	addi	a0,a1,1
  401568:	00bc85b3          	add	a1,s9,a1
  40156c:	00c58023          	sb	a2,0(a1)
        shortname[k] = '\0';
  401570:	00ac8533          	add	a0,s9,a0
  401574:	00050023          	sb	zero,0(a0)
        if (strcmp(shortname, name) == 0) {
  401578:	00310513          	addi	a0,sp,3
  40157c:	000a0593          	mv	a1,s4
  401580:	00000097          	auipc	ra,0x0
  401584:	808080e7          	jalr	-2040(ra) # 400d88 <strcmp>
  401588:	14050063          	beqz	a0,4016c8 <fat32_find+0x248>
    for (int i = 0; i < 16; i++) {
  40158c:	fffa8a93          	addi	s5,s5,-1
  401590:	02098993          	addi	s3,s3,32
  401594:	f60a8ce3          	beqz	s5,40150c <fat32_find+0x8c>
        if (e[0] == 0x00)
  401598:	0009c503          	lbu	a0,0(s3)
  40159c:	ff6508e3          	beq	a0,s6,40158c <fat32_find+0x10c>
  4015a0:	f60506e3          	beqz	a0,40150c <fat32_find+0x8c>
        if (e[11] == 0x0F)
  4015a4:	00b9c583          	lbu	a1,11(s3)
  4015a8:	ff7582e3          	beq	a1,s7,40158c <fat32_find+0x10c>
            if (e[j] != ' ')
  4015ac:	01851a63          	bne	a0,s8,4015c0 <fat32_find+0x140>
  4015b0:	00000513          	li	a0,0
  4015b4:	0019c583          	lbu	a1,1(s3)
  4015b8:	01859c63          	bne	a1,s8,4015d0 <fat32_find+0x150>
  4015bc:	0200006f          	j	4015dc <fat32_find+0x15c>
                shortname[k++] = e[j];
  4015c0:	00a101a3          	sb	a0,3(sp)
  4015c4:	00100513          	li	a0,1
            if (e[j] != ' ')
  4015c8:	0019c583          	lbu	a1,1(s3)
  4015cc:	01858863          	beq	a1,s8,4015dc <fat32_find+0x15c>
                shortname[k++] = e[j];
  4015d0:	00ac8633          	add	a2,s9,a0
  4015d4:	00150513          	addi	a0,a0,1
  4015d8:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  4015dc:	0029c583          	lbu	a1,2(s3)
  4015e0:	03859c63          	bne	a1,s8,401618 <fat32_find+0x198>
  4015e4:	0039c583          	lbu	a1,3(s3)
  4015e8:	05859263          	bne	a1,s8,40162c <fat32_find+0x1ac>
  4015ec:	0049c583          	lbu	a1,4(s3)
  4015f0:	05859863          	bne	a1,s8,401640 <fat32_find+0x1c0>
  4015f4:	0059c583          	lbu	a1,5(s3)
  4015f8:	05859e63          	bne	a1,s8,401654 <fat32_find+0x1d4>
  4015fc:	0069c583          	lbu	a1,6(s3)
  401600:	07859463          	bne	a1,s8,401668 <fat32_find+0x1e8>
  401604:	0079c583          	lbu	a1,7(s3)
  401608:	07859a63          	bne	a1,s8,40167c <fat32_find+0x1fc>
        if (e[8] != ' ') {
  40160c:	0089c603          	lbu	a2,8(s3)
  401610:	f78600e3          	beq	a2,s8,401570 <fat32_find+0xf0>
  401614:	07c0006f          	j	401690 <fat32_find+0x210>
                shortname[k++] = e[j];
  401618:	00ac8633          	add	a2,s9,a0
  40161c:	00150513          	addi	a0,a0,1
  401620:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  401624:	0039c583          	lbu	a1,3(s3)
  401628:	fd8582e3          	beq	a1,s8,4015ec <fat32_find+0x16c>
                shortname[k++] = e[j];
  40162c:	00ac8633          	add	a2,s9,a0
  401630:	00150513          	addi	a0,a0,1
  401634:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  401638:	0049c583          	lbu	a1,4(s3)
  40163c:	fb858ce3          	beq	a1,s8,4015f4 <fat32_find+0x174>
                shortname[k++] = e[j];
  401640:	00ac8633          	add	a2,s9,a0
  401644:	00150513          	addi	a0,a0,1
  401648:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  40164c:	0059c583          	lbu	a1,5(s3)
  401650:	fb8586e3          	beq	a1,s8,4015fc <fat32_find+0x17c>
                shortname[k++] = e[j];
  401654:	00ac8633          	add	a2,s9,a0
  401658:	00150513          	addi	a0,a0,1
  40165c:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  401660:	0069c583          	lbu	a1,6(s3)
  401664:	fb8580e3          	beq	a1,s8,401604 <fat32_find+0x184>
                shortname[k++] = e[j];
  401668:	00ac8633          	add	a2,s9,a0
  40166c:	00150513          	addi	a0,a0,1
  401670:	00b60023          	sb	a1,0(a2)
            if (e[j] != ' ')
  401674:	0079c583          	lbu	a1,7(s3)
  401678:	f9858ae3          	beq	a1,s8,40160c <fat32_find+0x18c>
                shortname[k++] = e[j];
  40167c:	00ac8633          	add	a2,s9,a0
  401680:	00150513          	addi	a0,a0,1
  401684:	00b60023          	sb	a1,0(a2)
        if (e[8] != ' ') {
  401688:	0089c603          	lbu	a2,8(s3)
  40168c:	ef8602e3          	beq	a2,s8,401570 <fat32_find+0xf0>
                if (e[j] != ' ')
  401690:	0099c683          	lbu	a3,9(s3)
            shortname[k++] = '.';
  401694:	00ac8733          	add	a4,s9,a0
  401698:	01a70023          	sb	s10,0(a4)
                    shortname[k++] = e[j];
  40169c:	00250593          	addi	a1,a0,2
  4016a0:	00c700a3          	sb	a2,1(a4)
                if (e[j] != ' ')
  4016a4:	01868a63          	beq	a3,s8,4016b8 <fat32_find+0x238>
                    shortname[k++] = e[j];
  4016a8:	00bc85b3          	add	a1,s9,a1
  4016ac:	00350513          	addi	a0,a0,3
  4016b0:	00d58023          	sb	a3,0(a1)
  4016b4:	00050593          	mv	a1,a0
                if (e[j] != ' ')
  4016b8:	00a9c603          	lbu	a2,10(s3)
  4016bc:	eb8614e3          	bne	a2,s8,401564 <fat32_find+0xe4>
  4016c0:	00058513          	mv	a0,a1
  4016c4:	eadff06f          	j	401570 <fat32_find+0xf0>
  4016c8:	00000913          	li	s2,0
                ((uint32_t)e[21] << 8);
  4016cc:	0159c503          	lbu	a0,21(s3)
                ((uint32_t)e[20]) |
  4016d0:	0149c583          	lbu	a1,20(s3)
                ((uint32_t)e[26]) |
  4016d4:	01a9c603          	lbu	a2,26(s3)
                ((uint32_t)e[27] << 8);
  4016d8:	01b9c683          	lbu	a3,27(s3)
                (cl_hi << 16) | cl_lo;
  4016dc:	01851513          	slli	a0,a0,0x18
  4016e0:	01059593          	slli	a1,a1,0x10
                ((uint32_t)e[26]) |
  4016e4:	00b56533          	or	a0,a0,a1
                ((uint32_t)e[27] << 8);
  4016e8:	00869693          	slli	a3,a3,0x8
                (cl_hi << 16) | cl_lo;
  4016ec:	00d66633          	or	a2,a2,a3
  4016f0:	00c56533          	or	a0,a0,a2
            *cluster =
  4016f4:	00a4a023          	sw	a0,0(s1)
                ((uint32_t)e[29] << 8) |
  4016f8:	01d9c503          	lbu	a0,29(s3)
                ((uint32_t)e[28]) |
  4016fc:	01c9c583          	lbu	a1,28(s3)
                ((uint32_t)e[30] << 16) |
  401700:	01e9c603          	lbu	a2,30(s3)
                ((uint32_t)e[31] << 24);
  401704:	01f9c683          	lbu	a3,31(s3)
                ((uint32_t)e[29] << 8) |
  401708:	00851513          	slli	a0,a0,0x8
                ((uint32_t)e[28]) |
  40170c:	00b56533          	or	a0,a0,a1
                ((uint32_t)e[30] << 16) |
  401710:	01061613          	slli	a2,a2,0x10
                ((uint32_t)e[31] << 24);
  401714:	01869693          	slli	a3,a3,0x18
                ((uint32_t)e[29] << 8) |
  401718:	00d66633          	or	a2,a2,a3
                ((uint32_t)e[30] << 16) |
  40171c:	00c56533          	or	a0,a0,a2
            *size =
  401720:	00a42023          	sw	a0,0(s0)
  401724:	de9ff06f          	j	40150c <fat32_find+0x8c>

00401728 <cluster_to_lba>:
{
  401728:	ff010113          	addi	sp,sp,-16
  40172c:	00112623          	sw	ra,12(sp)
  401730:	00812423          	sw	s0,8(sp)
    return g_fat32.data_begin +
  401734:	004025b7          	lui	a1,0x402
  401738:	f3858593          	addi	a1,a1,-200 # 401f38 <g_fat32>
  40173c:	0085a403          	lw	s0,8(a1)
           g_fat32.sectors_per_cluster;
  401740:	0105a603          	lw	a2,16(a1)
           (cluster - 2) *
  401744:	ffe50593          	addi	a1,a0,-2
  401748:	00060513          	mv	a0,a2
  40174c:	00000097          	auipc	ra,0x0
  401750:	27c080e7          	jalr	636(ra) # 4019c8 <__mulsi3>
    return g_fat32.data_begin +
  401754:	00850533          	add	a0,a0,s0
  401758:	00c12083          	lw	ra,12(sp)
  40175c:	00812403          	lw	s0,8(sp)
  401760:	01010113          	addi	sp,sp,16
  401764:	00008067          	ret

00401768 <fat32_ls>:

void fat32_ls(void)
{
  401768:	fe010113          	addi	sp,sp,-32
  40176c:	00112e23          	sw	ra,28(sp)
  401770:	00812c23          	sw	s0,24(sp)
  401774:	00912a23          	sw	s1,20(sp)
  401778:	01212823          	sw	s2,16(sp)
  40177c:	01312623          	sw	s3,12(sp)
  401780:	01412423          	sw	s4,8(sp)
  401784:	01512223          	sw	s5,4(sp)
  401788:	01612023          	sw	s6,0(sp)
    uint8_t *buf = fat32_buf;

    if (fat32_mount())
  40178c:	00000097          	auipc	ra,0x0
  401790:	bc8080e7          	jalr	-1080(ra) # 401354 <fat32_mount>
  401794:	04051063          	bnez	a0,4017d4 <fat32_ls+0x6c>
        return;

    uint32_t root_lba =
        cluster_to_lba(g_fat32.root_cluster);
  401798:	00402537          	lui	a0,0x402
  40179c:	f3850513          	addi	a0,a0,-200 # 401f38 <g_fat32>
  4017a0:	00c52583          	lw	a1,12(a0)
    return g_fat32.data_begin +
  4017a4:	00852403          	lw	s0,8(a0)
           g_fat32.sectors_per_cluster;
  4017a8:	01052503          	lw	a0,16(a0)
           (cluster - 2) *
  4017ac:	ffe58593          	addi	a1,a1,-2
  4017b0:	00000097          	auipc	ra,0x0
  4017b4:	218080e7          	jalr	536(ra) # 4019c8 <__mulsi3>
    return g_fat32.data_begin +
  4017b8:	00850533          	add	a0,a0,s0

    if (call_sd_read_buf_api(root_lba, buf))
  4017bc:	004025b7          	lui	a1,0x402
  4017c0:	d3858413          	addi	s0,a1,-712 # 401d38 <fat32_buf>
  4017c4:	00040593          	mv	a1,s0
  4017c8:	00000097          	auipc	ra,0x0
  4017cc:	a90080e7          	jalr	-1392(ra) # 401258 <call_sd_read_buf_api>
  4017d0:	02050663          	beqz	a0,4017fc <fat32_ls+0x94>
  4017d4:	01c12083          	lw	ra,28(sp)
  4017d8:	01812403          	lw	s0,24(sp)
  4017dc:	01412483          	lw	s1,20(sp)
  4017e0:	01012903          	lw	s2,16(sp)
  4017e4:	00c12983          	lw	s3,12(sp)
  4017e8:	00812a03          	lw	s4,8(sp)
  4017ec:	00412a83          	lw	s5,4(sp)
  4017f0:	00012b03          	lw	s6,0(sp)
            ((uint32_t)e[30] << 16) |
            ((uint32_t)e[31] << 24);

        printf(" cl=%x size=%x\n", cl, size);
    }
  4017f4:	02010113          	addi	sp,sp,32
  4017f8:	00008067          	ret
  4017fc:	01000993          	li	s3,16
  401800:	0e500a13          	li	s4,229
  401804:	00f00a93          	li	s5,15
  401808:	02000b13          	li	s6,32
  40180c:	00402537          	lui	a0,0x402
  401810:	b9c50493          	addi	s1,a0,-1124 # 401b9c <__modsi3+0x8c>
  401814:	00402537          	lui	a0,0x402
  401818:	cae50913          	addi	s2,a0,-850 # 401cae <$d.1+0x1f>
  40181c:	07c0006f          	j	401898 <fat32_ls+0x130>
        printf(" attr=%x", (uint32_t)e[11]);
  401820:	00b44583          	lbu	a1,11(s0)
  401824:	00048513          	mv	a0,s1
  401828:	fffff097          	auipc	ra,0xfffff
  40182c:	5a0080e7          	jalr	1440(ra) # 400dc8 <printf>
            ((uint32_t)e[27] << 8);
  401830:	01b44503          	lbu	a0,27(s0)
            ((uint32_t)e[21] << 8);
  401834:	01544583          	lbu	a1,21(s0)
            ((uint32_t)e[20]) |
  401838:	01444603          	lbu	a2,20(s0)
            ((uint32_t)e[26]) |
  40183c:	01a44683          	lbu	a3,26(s0)
            ((uint32_t)e[27] << 8);
  401840:	00851513          	slli	a0,a0,0x8
            (cl_hi << 16) | cl_lo;
  401844:	01859593          	slli	a1,a1,0x18
  401848:	01061613          	slli	a2,a2,0x10
            ((uint32_t)e[26]) |
  40184c:	00c5e5b3          	or	a1,a1,a2
            (cl_hi << 16) | cl_lo;
  401850:	00a6e533          	or	a0,a3,a0
  401854:	00a5e5b3          	or	a1,a1,a0
            ((uint32_t)e[29] << 8) |
  401858:	01d44503          	lbu	a0,29(s0)
            ((uint32_t)e[28]) |
  40185c:	01c44603          	lbu	a2,28(s0)
            ((uint32_t)e[30] << 16) |
  401860:	01e44683          	lbu	a3,30(s0)
            ((uint32_t)e[31] << 24);
  401864:	01f44703          	lbu	a4,31(s0)
            ((uint32_t)e[29] << 8) |
  401868:	00851513          	slli	a0,a0,0x8
            ((uint32_t)e[28]) |
  40186c:	00c56533          	or	a0,a0,a2
            ((uint32_t)e[30] << 16) |
  401870:	01069693          	slli	a3,a3,0x10
            ((uint32_t)e[31] << 24);
  401874:	01871713          	slli	a4,a4,0x18
            ((uint32_t)e[29] << 8) |
  401878:	00e6e633          	or	a2,a3,a4
            ((uint32_t)e[30] << 16) |
  40187c:	00c56633          	or	a2,a0,a2
        printf(" cl=%x size=%x\n", cl, size);
  401880:	00090513          	mv	a0,s2
  401884:	fffff097          	auipc	ra,0xfffff
  401888:	544080e7          	jalr	1348(ra) # 400dc8 <printf>
    for (int i = 0; i < 16; i++) {
  40188c:	fff98993          	addi	s3,s3,-1
  401890:	02040413          	addi	s0,s0,32
  401894:	f40980e3          	beqz	s3,4017d4 <fat32_ls+0x6c>
        if (e[0] == 0x00)
  401898:	00044503          	lbu	a0,0(s0)
  40189c:	ff4508e3          	beq	a0,s4,40188c <fat32_ls+0x124>
  4018a0:	f2050ae3          	beqz	a0,4017d4 <fat32_ls+0x6c>
        if (e[11] == 0x0F)
  4018a4:	00b44583          	lbu	a1,11(s0)
  4018a8:	ff5582e3          	beq	a1,s5,40188c <fat32_ls+0x124>
            if (e[j] != ' ')
  4018ac:	05651463          	bne	a0,s6,4018f4 <fat32_ls+0x18c>
  4018b0:	00144503          	lbu	a0,1(s0)
  4018b4:	05651863          	bne	a0,s6,401904 <fat32_ls+0x19c>
  4018b8:	00244503          	lbu	a0,2(s0)
  4018bc:	05651c63          	bne	a0,s6,401914 <fat32_ls+0x1ac>
  4018c0:	00344503          	lbu	a0,3(s0)
  4018c4:	07651063          	bne	a0,s6,401924 <fat32_ls+0x1bc>
  4018c8:	00444503          	lbu	a0,4(s0)
  4018cc:	07651463          	bne	a0,s6,401934 <fat32_ls+0x1cc>
  4018d0:	00544503          	lbu	a0,5(s0)
  4018d4:	07651863          	bne	a0,s6,401944 <fat32_ls+0x1dc>
  4018d8:	00644503          	lbu	a0,6(s0)
  4018dc:	07651c63          	bne	a0,s6,401954 <fat32_ls+0x1ec>
  4018e0:	00744503          	lbu	a0,7(s0)
  4018e4:	09651063          	bne	a0,s6,401964 <fat32_ls+0x1fc>
        if (e[8] != ' ') {
  4018e8:	00844503          	lbu	a0,8(s0)
  4018ec:	f3650ae3          	beq	a0,s6,401820 <fat32_ls+0xb8>
  4018f0:	0840006f          	j	401974 <fat32_ls+0x20c>
                putchar(e[j]);
  4018f4:	fffff097          	auipc	ra,0xfffff
  4018f8:	414080e7          	jalr	1044(ra) # 400d08 <putchar>
            if (e[j] != ' ')
  4018fc:	00144503          	lbu	a0,1(s0)
  401900:	fb650ce3          	beq	a0,s6,4018b8 <fat32_ls+0x150>
                putchar(e[j]);
  401904:	fffff097          	auipc	ra,0xfffff
  401908:	404080e7          	jalr	1028(ra) # 400d08 <putchar>
            if (e[j] != ' ')
  40190c:	00244503          	lbu	a0,2(s0)
  401910:	fb6508e3          	beq	a0,s6,4018c0 <fat32_ls+0x158>
                putchar(e[j]);
  401914:	fffff097          	auipc	ra,0xfffff
  401918:	3f4080e7          	jalr	1012(ra) # 400d08 <putchar>
            if (e[j] != ' ')
  40191c:	00344503          	lbu	a0,3(s0)
  401920:	fb6504e3          	beq	a0,s6,4018c8 <fat32_ls+0x160>
                putchar(e[j]);
  401924:	fffff097          	auipc	ra,0xfffff
  401928:	3e4080e7          	jalr	996(ra) # 400d08 <putchar>
            if (e[j] != ' ')
  40192c:	00444503          	lbu	a0,4(s0)
  401930:	fb6500e3          	beq	a0,s6,4018d0 <fat32_ls+0x168>
                putchar(e[j]);
  401934:	fffff097          	auipc	ra,0xfffff
  401938:	3d4080e7          	jalr	980(ra) # 400d08 <putchar>
            if (e[j] != ' ')
  40193c:	00544503          	lbu	a0,5(s0)
  401940:	f9650ce3          	beq	a0,s6,4018d8 <fat32_ls+0x170>
                putchar(e[j]);
  401944:	fffff097          	auipc	ra,0xfffff
  401948:	3c4080e7          	jalr	964(ra) # 400d08 <putchar>
            if (e[j] != ' ')
  40194c:	00644503          	lbu	a0,6(s0)
  401950:	f96508e3          	beq	a0,s6,4018e0 <fat32_ls+0x178>
                putchar(e[j]);
  401954:	fffff097          	auipc	ra,0xfffff
  401958:	3b4080e7          	jalr	948(ra) # 400d08 <putchar>
            if (e[j] != ' ')
  40195c:	00744503          	lbu	a0,7(s0)
  401960:	f96504e3          	beq	a0,s6,4018e8 <fat32_ls+0x180>
                putchar(e[j]);
  401964:	fffff097          	auipc	ra,0xfffff
  401968:	3a4080e7          	jalr	932(ra) # 400d08 <putchar>
        if (e[8] != ' ') {
  40196c:	00844503          	lbu	a0,8(s0)
  401970:	eb6508e3          	beq	a0,s6,401820 <fat32_ls+0xb8>
            putchar('.');
  401974:	02e00513          	li	a0,46
  401978:	fffff097          	auipc	ra,0xfffff
  40197c:	390080e7          	jalr	912(ra) # 400d08 <putchar>
                if (e[j] != ' ')
  401980:	00844503          	lbu	a0,8(s0)
  401984:	01651c63          	bne	a0,s6,40199c <fat32_ls+0x234>
  401988:	00944503          	lbu	a0,9(s0)
  40198c:	03651063          	bne	a0,s6,4019ac <fat32_ls+0x244>
  401990:	00a44503          	lbu	a0,10(s0)
  401994:	e96506e3          	beq	a0,s6,401820 <fat32_ls+0xb8>
  401998:	0240006f          	j	4019bc <fat32_ls+0x254>
                    putchar(e[j]);
  40199c:	fffff097          	auipc	ra,0xfffff
  4019a0:	36c080e7          	jalr	876(ra) # 400d08 <putchar>
                if (e[j] != ' ')
  4019a4:	00944503          	lbu	a0,9(s0)
  4019a8:	ff6504e3          	beq	a0,s6,401990 <fat32_ls+0x228>
                    putchar(e[j]);
  4019ac:	fffff097          	auipc	ra,0xfffff
  4019b0:	35c080e7          	jalr	860(ra) # 400d08 <putchar>
                if (e[j] != ' ')
  4019b4:	00a44503          	lbu	a0,10(s0)
  4019b8:	e76504e3          	beq	a0,s6,401820 <fat32_ls+0xb8>
                    putchar(e[j]);
  4019bc:	fffff097          	auipc	ra,0xfffff
  4019c0:	34c080e7          	jalr	844(ra) # 400d08 <putchar>
  4019c4:	e5dff06f          	j	401820 <fat32_ls+0xb8>

004019c8 <__mulsi3>:
  4019c8:	00000613          	li	a2,0
  4019cc:	02058063          	beqz	a1,4019ec <__mulsi3+0x24>
  4019d0:	01f59693          	slli	a3,a1,0x1f
  4019d4:	41f6d693          	srai	a3,a3,0x1f
  4019d8:	00a6f6b3          	and	a3,a3,a0
  4019dc:	00c68633          	add	a2,a3,a2
  4019e0:	0015d593          	srli	a1,a1,0x1
  4019e4:	00151513          	slli	a0,a0,0x1
  4019e8:	fe0594e3          	bnez	a1,4019d0 <__mulsi3+0x8>
  4019ec:	00060513          	mv	a0,a2
  4019f0:	00008067          	ret

004019f4 <__udivsi3>:
  4019f4:	04058a63          	beqz	a1,401a48 <__udivsi3+0x54>
  4019f8:	00000813          	li	a6,0
  4019fc:	00000613          	li	a2,0
  401a00:	01f00693          	li	a3,31
  401a04:	00100713          	li	a4,1
  401a08:	fff00793          	li	a5,-1
  401a0c:	00181813          	slli	a6,a6,0x1
  401a10:	00d558b3          	srl	a7,a0,a3
  401a14:	0018f893          	andi	a7,a7,1
  401a18:	0108e833          	or	a6,a7,a6
  401a1c:	00b838b3          	sltu	a7,a6,a1
  401a20:	00d712b3          	sll	t0,a4,a3
  401a24:	fff88893          	addi	a7,a7,-1
  401a28:	0058f2b3          	and	t0,a7,t0
  401a2c:	00c2e633          	or	a2,t0,a2
  401a30:	00b8f8b3          	and	a7,a7,a1
  401a34:	fff68693          	addi	a3,a3,-1
  401a38:	41180833          	sub	a6,a6,a7
  401a3c:	fcf698e3          	bne	a3,a5,401a0c <__udivsi3+0x18>
  401a40:	00060513          	mv	a0,a2
  401a44:	00008067          	ret
  401a48:	00000513          	li	a0,0
  401a4c:	00008067          	ret

00401a50 <__umodsi3>:
  401a50:	00000613          	li	a2,0
  401a54:	02058a63          	beqz	a1,401a88 <__umodsi3+0x38>
  401a58:	01f00693          	li	a3,31
  401a5c:	fff00713          	li	a4,-1
  401a60:	00161613          	slli	a2,a2,0x1
  401a64:	00d557b3          	srl	a5,a0,a3
  401a68:	0017f793          	andi	a5,a5,1
  401a6c:	00c7e633          	or	a2,a5,a2
  401a70:	00b637b3          	sltu	a5,a2,a1
  401a74:	fff78793          	addi	a5,a5,-1
  401a78:	00b7f7b3          	and	a5,a5,a1
  401a7c:	fff68693          	addi	a3,a3,-1
  401a80:	40f60633          	sub	a2,a2,a5
  401a84:	fce69ee3          	bne	a3,a4,401a60 <__umodsi3+0x10>
  401a88:	00060513          	mv	a0,a2
  401a8c:	00008067          	ret

00401a90 <__divsi3>:
  401a90:	06058c63          	beqz	a1,401b08 <__divsi3+0x78>
  401a94:	00000293          	li	t0,0
  401a98:	00000613          	li	a2,0
  401a9c:	41f55693          	srai	a3,a0,0x1f
  401aa0:	00d54733          	xor	a4,a0,a3
  401aa4:	40d706b3          	sub	a3,a4,a3
  401aa8:	41f5d713          	srai	a4,a1,0x1f
  401aac:	00e5c7b3          	xor	a5,a1,a4
  401ab0:	40e78733          	sub	a4,a5,a4
  401ab4:	01f00793          	li	a5,31
  401ab8:	00100813          	li	a6,1
  401abc:	fff00893          	li	a7,-1
  401ac0:	00129293          	slli	t0,t0,0x1
  401ac4:	00f6d333          	srl	t1,a3,a5
  401ac8:	00137313          	andi	t1,t1,1
  401acc:	005362b3          	or	t0,t1,t0
  401ad0:	00e2b333          	sltu	t1,t0,a4
  401ad4:	00f813b3          	sll	t2,a6,a5
  401ad8:	fff30313          	addi	t1,t1,-1
  401adc:	007373b3          	and	t2,t1,t2
  401ae0:	00c3e633          	or	a2,t2,a2
  401ae4:	00e37333          	and	t1,t1,a4
  401ae8:	fff78793          	addi	a5,a5,-1
  401aec:	406282b3          	sub	t0,t0,t1
  401af0:	fd1798e3          	bne	a5,a7,401ac0 <__divsi3+0x30>
  401af4:	00a5c533          	xor	a0,a1,a0
  401af8:	00055463          	bgez	a0,401b00 <__divsi3+0x70>
  401afc:	40c00633          	neg	a2,a2
  401b00:	00060513          	mv	a0,a2
  401b04:	00008067          	ret
  401b08:	00000513          	li	a0,0
  401b0c:	00008067          	ret

00401b10 <__modsi3>:
  401b10:	00000613          	li	a2,0
  401b14:	04058a63          	beqz	a1,401b68 <__modsi3+0x58>
  401b18:	41f55693          	srai	a3,a0,0x1f
  401b1c:	00d54733          	xor	a4,a0,a3
  401b20:	40d706b3          	sub	a3,a4,a3
  401b24:	41f5d713          	srai	a4,a1,0x1f
  401b28:	00e5c5b3          	xor	a1,a1,a4
  401b2c:	40e585b3          	sub	a1,a1,a4
  401b30:	01f00713          	li	a4,31
  401b34:	fff00793          	li	a5,-1
  401b38:	00161613          	slli	a2,a2,0x1
  401b3c:	00e6d833          	srl	a6,a3,a4
  401b40:	00187813          	andi	a6,a6,1
  401b44:	00c86633          	or	a2,a6,a2
  401b48:	00b63833          	sltu	a6,a2,a1
  401b4c:	fff80813          	addi	a6,a6,-1
  401b50:	00b87833          	and	a6,a6,a1
  401b54:	fff70713          	addi	a4,a4,-1
  401b58:	41060633          	sub	a2,a2,a6
  401b5c:	fcf71ee3          	bne	a4,a5,401b38 <__modsi3+0x28>
  401b60:	00055463          	bgez	a0,401b68 <__modsi3+0x58>
  401b64:	40c00633          	neg	a2,a2
  401b68:	00060513          	mv	a0,a2
  401b6c:	00008067          	ret

セクション .rodata の逆アセンブル:

00401b70 <$d.1-0x11f>:
  401b70:	7375                	.insn	2, 0x7375
  401b72:	6761                	.insn	2, 0x6761
  401b74:	3a65                	.insn	2, 0x3a65
  401b76:	6620                	.insn	2, 0x6620
  401b78:	7461                	.insn	2, 0x7461
  401b7a:	635f3233          	.insn	4, 0x635f3233
  401b7e:	7461                	.insn	2, 0x7461
  401b80:	3c20                	.insn	2, 0x3c20
  401b82:	6966                	.insn	2, 0x6966
  401b84:	656c                	.insn	2, 0x656c
  401b86:	0a3e                	.insn	2, 0x0a3e
  401b88:	6600                	.insn	2, 0x6600
  401b8a:	7461                	.insn	2, 0x7461
  401b8c:	6c5f3233          	.insn	4, 0x6c5f3233
  401b90:	61660073          	.insn	4, 0x61660073
  401b94:	3374                	.insn	2, 0x3374
  401b96:	5f32                	.insn	2, 0x5f32
  401b98:	00746163          	bltu	s0,t2,401b9a <__modsi3+0x8a>
  401b9c:	6120                	.insn	2, 0x6120
  401b9e:	7474                	.insn	2, 0x7474
  401ba0:	3d72                	.insn	2, 0x3d72
  401ba2:	7825                	.insn	2, 0x7825
  401ba4:	7300                	.insn	2, 0x7300
  401ba6:	5f64                	.insn	2, 0x5f64
  401ba8:	6572                	.insn	2, 0x6572
  401baa:	6461                	.insn	2, 0x6461
  401bac:	4800                	.insn	2, 0x4800
  401bae:	6c65                	.insn	2, 0x6c65
  401bb0:	6f6c                	.insn	2, 0x6f6c
  401bb2:	7720                	.insn	2, 0x7720
  401bb4:	646c726f          	jal	tp,4c91fa <__user_stack_top+0xa62aa>
  401bb8:	6620                	.insn	2, 0x6620
  401bba:	6f72                	.insn	2, 0x6f72
  401bbc:	206d                	.insn	2, 0x206d
  401bbe:	6c656873          	csrrsi	a6,0x6c6,10
  401bc2:	216c                	.insn	2, 0x216c
  401bc4:	000a                	.insn	2, 0x000a
  401bc6:	7270                	.insn	2, 0x7270
  401bc8:	6d69                	.insn	2, 0x6d69
  401bca:	7365                	.insn	2, 0x7365
  401bcc:	7500                	.insn	2, 0x7500
  401bce:	6b6e                	.insn	2, 0x6b6e
  401bd0:	6f6e                	.insn	2, 0x6f6e
  401bd2:	63206e77          	.insn	4, 0x63206e77
  401bd6:	616d6d6f          	jal	s10,4d81ec <__user_stack_top+0xb529c>
  401bda:	646e                	.insn	2, 0x646e
  401bdc:	203a                	.insn	2, 0x203a
  401bde:	7325                	.insn	2, 0x7325
  401be0:	000a                	.insn	2, 0x000a
  401be2:	6f74                	.insn	2, 0x6f74
  401be4:	6174                	.insn	2, 0x6174
  401be6:	206c                	.insn	2, 0x206c
  401be8:	7270                	.insn	2, 0x7270
  401bea:	6d69                	.insn	2, 0x6d69
  401bec:	7365                	.insn	2, 0x7365
  401bee:	203a                	.insn	2, 0x203a
  401bf0:	6425                	.insn	2, 0x6425
  401bf2:	2820                	.insn	2, 0x2820
  401bf4:	2e30                	.insn	2, 0x2e30
  401bf6:	252e                	.insn	2, 0x252e
  401bf8:	2964                	.insn	2, 0x2964
  401bfa:	000a                	.insn	2, 0x000a
  401bfc:	735f6173          	csrrsi	sp,mhpmevent21h,30
  401c00:	6174                	.insn	2, 0x6174
  401c02:	7472                	.insn	2, 0x7472
  401c04:	6600                	.insn	2, 0x6600
  401c06:	7461                	.insn	2, 0x7461
  401c08:	695f3233          	.insn	4, 0x695f3233
  401c0c:	666e                	.insn	2, 0x666e
  401c0e:	6568006f          	j	482264 <__user_stack_top+0x5f314>
  401c12:	6c6c                	.insn	2, 0x6c6c
  401c14:	616d006f          	j	4d222a <__user_stack_top+0xaf2da>
  401c18:	7274                	.insn	2, 0x7274
  401c1a:	7869                	.insn	2, 0x7869
  401c1c:	7320                	.insn	2, 0x7320
  401c1e:	7a69                	.insn	2, 0x7a69
  401c20:	2065                	.insn	2, 0x2065
  401c22:	203e                	.insn	2, 0x203e
  401c24:	0a34                	.insn	2, 0x0a34
  401c26:	6300                	.insn	2, 0x6300
  401c28:	616d6d6f          	jal	s10,4d823e <__user_stack_top+0xb52ee>
  401c2c:	646e                	.insn	2, 0x646e
  401c2e:	000a3a73          	csrrc	s4,0x0,s4
  401c32:	4146                	.insn	2, 0x4146
  401c34:	3354                	.insn	2, 0x3354
  401c36:	2032                	.insn	2, 0x2032
  401c38:	6f6d                	.insn	2, 0x6f6d
  401c3a:	6e75                	.insn	2, 0x6e75
  401c3c:	2074                	.insn	2, 0x2074
  401c3e:	6166                	.insn	2, 0x6166
  401c40:	6c69                	.insn	2, 0x6c69
  401c42:	6465                	.insn	2, 0x6465
  401c44:	000a                	.insn	2, 0x000a
  401c46:	6164                	.insn	2, 0x6164
  401c48:	6174                	.insn	2, 0x6174
  401c4a:	625f 6765 6e69      	.insn	6, 0x6e696765625f
  401c50:	253d                	.insn	2, 0x253d
  401c52:	0a78                	.insn	2, 0x0a78
  401c54:	7500                	.insn	2, 0x7500
  401c56:	65676173          	csrrsi	sp,hviprio1h,14
  401c5a:	203a                	.insn	2, 0x203a
  401c5c:	696d                	.insn	2, 0x696d
  401c5e:	65725f63          	bge	tp,s7,4022bc <__user_stack_bottom+0x36c>
  401c62:	6461                	.insn	2, 0x6461
  401c64:	3c20                	.insn	2, 0x3c20
  401c66:	6e756f63          	bltu	a0,t2,402364 <__user_stack_bottom+0x414>
  401c6a:	3e74                	.insn	2, 0x3e74
  401c6c:	000a                	.insn	2, 0x000a
  401c6e:	6568                	.insn	2, 0x6568
  401c70:	706c                	.insn	2, 0x706c
  401c72:	6d00                	.insn	2, 0x6d00
  401c74:	6369                	.insn	2, 0x6369
  401c76:	725f 6165 0064      	.insn	6, 0x00646165725f
  401c7c:	6f72                	.insn	2, 0x6f72
  401c7e:	635f746f          	jal	s0,4f9ab2 <__user_stack_top+0xd6b62>
  401c82:	756c                	.insn	2, 0x756c
  401c84:	72657473          	csrrci	s0,mhpmevent6h,10
  401c88:	253d                	.insn	2, 0x253d
  401c8a:	0a78                	.insn	2, 0x0a78
  401c8c:	7100                	.insn	2, 0x7100
	...

00401c8f <$d.1>:
  401c8f:	6c656873          	csrrsi	a6,0x6c6,10
  401c93:	206c                	.insn	2, 0x206c
  401c95:	72617473          	csrrci	s0,mhpmevent6h,2
  401c99:	2e74                	.insn	2, 0x2e74
  401c9b:	000a                	.insn	2, 0x000a
  401c9d:	7564                	.insn	2, 0x7564
  401c9f:	706d                	.insn	2, 0x706d
  401ca1:	7300                	.insn	2, 0x7300
  401ca3:	6370                	.insn	2, 0x6370
  401ca5:	253d                	.insn	2, 0x253d
  401ca7:	0a78                	.insn	2, 0x0a78
  401ca9:	2500                	.insn	2, 0x2500
  401cab:	2064                	.insn	2, 0x2064
  401cad:	2000                	.insn	2, 0x2000
  401caf:	253d6c63          	bltu	s10,s3,401f07 <fat32_buf+0x1cf>
  401cb3:	2078                	.insn	2, 0x2078
  401cb5:	657a6973          	csrrsi	s2,hviprio2h,20
  401cb9:	253d                	.insn	2, 0x253d
  401cbb:	0a78                	.insn	2, 0x0a78
  401cbd:	6600                	.insn	2, 0x6600
  401cbf:	7461                	.insn	2, 0x7461
  401cc1:	625f 6765 6e69      	.insn	6, 0x6e696765625f
  401cc7:	253d                	.insn	2, 0x253d
  401cc9:	0a78                	.insn	2, 0x0a78
	...

00401ccc <$d.2>:
  401ccc:	3130                	.insn	2, 0x3130
  401cce:	3332                	.insn	2, 0x3332
  401cd0:	3534                	.insn	2, 0x3534
  401cd2:	3736                	.insn	2, 0x3736
  401cd4:	3938                	.insn	2, 0x3938
  401cd6:	6261                	.insn	2, 0x6261
  401cd8:	66656463          	bltu	a0,t1,402340 <__user_stack_bottom+0x3f0>
  401cdc:	7500                	.insn	2, 0x7500
  401cde:	65676173          	csrrsi	sp,hviprio1h,14
  401ce2:	203a                	.insn	2, 0x203a
  401ce4:	725f6473          	csrrsi	s0,mhpmevent5h,30
  401ce8:	6165                	.insn	2, 0x6165
  401cea:	2064                	.insn	2, 0x2064
  401cec:	733c                	.insn	2, 0x733c
  401cee:	6365                	.insn	2, 0x6365
  401cf0:	6f74                	.insn	2, 0x6f74
  401cf2:	3e72                	.insn	2, 0x3e72
  401cf4:	000a                	.insn	2, 0x000a
  401cf6:	616d                	.insn	2, 0x616d
  401cf8:	2078                	.insn	2, 0x2078
  401cfa:	6f74                	.insn	2, 0x6f74
  401cfc:	616c206f          	j	4c4312 <__user_stack_top+0xa13c2>
  401d00:	6772                	.insn	2, 0x6772
  401d02:	2065                	.insn	2, 0x2065
  401d04:	3c28                	.insn	2, 0x3c28
  401d06:	313d                	.insn	2, 0x313d
  401d08:	3030                	.insn	2, 0x3030
  401d0a:	3030                	.insn	2, 0x3030
  401d0c:	2930                	.insn	2, 0x2930
  401d0e:	000a                	.insn	2, 0x000a
  401d10:	7571                	.insn	2, 0x7571
  401d12:	7469                	.insn	2, 0x7469
	...

00401d15 <$d.1>:
  401d15:	6966                	.insn	2, 0x6966
  401d17:	656c                	.insn	2, 0x656c
  401d19:	6e20                	.insn	2, 0x6e20
  401d1b:	6620746f          	jal	s0,40937d <__user_stack_start+0x642d>
  401d1f:	646e756f          	jal	a0,4e9365 <__user_stack_top+0xc6415>
  401d23:	000a                	.insn	2, 0x000a
  401d25:	6170                	.insn	2, 0x6170
  401d27:	7472                	.insn	2, 0x7472
  401d29:	6c5f 6162 253d      	.insn	6, 0x253d61626c5f
  401d2f:	0a78                	.insn	2, 0x0a78
  401d31:	6500                	.insn	2, 0x6500
  401d33:	6978                	.insn	2, 0x6978
  401d35:	0074                	.insn	2, 0x0074

セクション .debug_loc の逆アセンブル:

00000000 <$d.2>:
       0:	01c4                	.insn	2, 0x01c4
       2:	0000                	.insn	2, 0x0000
       4:	01d4                	.insn	2, 0x01d4
       6:	0000                	.insn	2, 0x0000
       8:	0001                	.insn	2, 0x0001
       a:	4059                	.insn	2, 0x4059
       c:	5c000003          	lb	zero,1472(zero) # 5c0 <$d.3+0xf6>
      10:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
      14:	1100                	.insn	2, 0x1100
      16:	9f00                	.insn	2, 0x9f00
      18:	0364                	.insn	2, 0x0364
      1a:	0000                	.insn	2, 0x0000
      1c:	0368                	.insn	2, 0x0368
      1e:	0000                	.insn	2, 0x0000
      20:	0001                	.insn	2, 0x0001
      22:	6865                	.insn	2, 0x6865
      24:	cc000003          	lb	zero,-832(zero) # fffffcc0 <USER_MAX+0xffaffcc0>
      28:	01000007          	.insn	4, 0x01000007
      2c:	5900                	.insn	2, 0x5900
      2e:	081c                	.insn	2, 0x081c
      30:	0000                	.insn	2, 0x0000
      32:	0848                	.insn	2, 0x0848
      34:	0000                	.insn	2, 0x0000
      36:	0001                	.insn	2, 0x0001
      38:	0059                	.insn	2, 0x0059
      3a:	0000                	.insn	2, 0x0000
      3c:	0000                	.insn	2, 0x0000
      3e:	0000                	.insn	2, 0x0000
      40:	a000                	.insn	2, 0xa000
      42:	0002                	.insn	2, 0x0002
      44:	a800                	.insn	2, 0xa800
      46:	0002                	.insn	2, 0x0002
      48:	0300                	.insn	2, 0x0300
      4a:	1100                	.insn	2, 0x1100
      4c:	9f00                	.insn	2, 0x9f00
      4e:	02a8                	.insn	2, 0x02a8
      50:	0000                	.insn	2, 0x0000
      52:	035c                	.insn	2, 0x035c
      54:	0000                	.insn	2, 0x0000
      56:	0001                	.insn	2, 0x0001
      58:	0059                	.insn	2, 0x0059
      5a:	0000                	.insn	2, 0x0000
      5c:	0000                	.insn	2, 0x0000
      5e:	0000                	.insn	2, 0x0000
      60:	a800                	.insn	2, 0xa800
      62:	0002                	.insn	2, 0x0002
      64:	b000                	.insn	2, 0xb000
      66:	0002                	.insn	2, 0x0002
      68:	0100                	.insn	2, 0x0100
      6a:	5a00                	.insn	2, 0x5a00
      6c:	02b8                	.insn	2, 0x02b8
      6e:	0000                	.insn	2, 0x0000
      70:	02fc                	.insn	2, 0x02fc
      72:	0000                	.insn	2, 0x0000
      74:	0001                	.insn	2, 0x0001
      76:	245a                	.insn	2, 0x245a
      78:	28000003          	lb	zero,640(zero) # 280 <$d.6+0x28>
      7c:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
      80:	5a00                	.insn	2, 0x5a00
	...
      8a:	0340                	.insn	2, 0x0340
      8c:	0000                	.insn	2, 0x0000
      8e:	0344                	.insn	2, 0x0344
      90:	0000                	.insn	2, 0x0000
      92:	0004                	.insn	2, 0x0004
      94:	9c72                	.insn	2, 0x9c72
      96:	9f01                	.insn	2, 0x9f01
      98:	0344                	.insn	2, 0x0344
      9a:	0000                	.insn	2, 0x0000
      9c:	035c                	.insn	2, 0x035c
      9e:	0000                	.insn	2, 0x0000
      a0:	0001                	.insn	2, 0x0001
      a2:	645a                	.insn	2, 0x645a
      a4:	9c000003          	lb	zero,-1600(zero) # fffff9c0 <USER_MAX+0xffaff9c0>
      a8:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
      ac:	5b00                	.insn	2, 0x5b00
      ae:	039c                	.insn	2, 0x039c
      b0:	0000                	.insn	2, 0x0000
      b2:	03a4                	.insn	2, 0x03a4
      b4:	0000                	.insn	2, 0x0000
      b6:	017b0003          	lb	zero,23(s6)
      ba:	009f 0000 0000      	.insn	6, 0x009f
      c0:	0000                	.insn	2, 0x0000
      c2:	e000                	.insn	2, 0xe000
      c4:	0004                	.insn	2, 0x0004
      c6:	3000                	.insn	2, 0x3000
      c8:	0005                	.insn	2, 0x0005
      ca:	0600                	.insn	2, 0x0600
      cc:	1000                	.insn	2, 0x1000
      ce:	8080                	.insn	2, 0x8080
      d0:	0180                	.insn	2, 0x0180
      d2:	889f 0005 a400      	.insn	6, 0xa4000005889f
      d8:	0005                	.insn	2, 0x0005
      da:	0600                	.insn	2, 0x0600
      dc:	1000                	.insn	2, 0x1000
      de:	8080                	.insn	2, 0x8080
      e0:	0180                	.insn	2, 0x0180
      e2:	309f 0006 8c00      	.insn	6, 0x8c000006309f
      e8:	0006                	.insn	2, 0x0006
      ea:	0600                	.insn	2, 0x0600
      ec:	1000                	.insn	2, 0x1000
      ee:	8080                	.insn	2, 0x8080
      f0:	0180                	.insn	2, 0x0180
      f2:	8c9f 0006 e000      	.insn	6, 0xe00000068c9f
      f8:	0006                	.insn	2, 0x0006
      fa:	0100                	.insn	2, 0x0100
      fc:	5a00                	.insn	2, 0x5a00
      fe:	0740                	.insn	2, 0x0740
     100:	0000                	.insn	2, 0x0000
     102:	07a4                	.insn	2, 0x07a4
     104:	0000                	.insn	2, 0x0000
     106:	0001                	.insn	2, 0x0001
     108:	005a                	.insn	2, 0x005a
     10a:	0000                	.insn	2, 0x0000
     10c:	0000                	.insn	2, 0x0000
     10e:	0000                	.insn	2, 0x0000
     110:	e000                	.insn	2, 0xe000
     112:	0004                	.insn	2, 0x0004
     114:	3000                	.insn	2, 0x3000
     116:	0005                	.insn	2, 0x0005
     118:	0400                	.insn	2, 0x0400
     11a:	1000                	.insn	2, 0x1000
     11c:	0280                	.insn	2, 0x0280
     11e:	909f 0005 9800      	.insn	6, 0x98000005909f
     124:	0005                	.insn	2, 0x0005
     126:	0100                	.insn	2, 0x0100
     128:	5b00                	.insn	2, 0x5b00
     12a:	059c                	.insn	2, 0x059c
     12c:	0000                	.insn	2, 0x0000
     12e:	05a4                	.insn	2, 0x05a4
     130:	0000                	.insn	2, 0x0000
     132:	0004                	.insn	2, 0x0004
     134:	8010                	.insn	2, 0x8010
     136:	9f02                	.insn	2, 0x9f02
     138:	0630                	.insn	2, 0x0630
     13a:	0000                	.insn	2, 0x0000
     13c:	06e0                	.insn	2, 0x06e0
     13e:	0000                	.insn	2, 0x0000
     140:	0004                	.insn	2, 0x0004
     142:	8010                	.insn	2, 0x8010
     144:	9f02                	.insn	2, 0x9f02
     146:	0740                	.insn	2, 0x0740
     148:	0000                	.insn	2, 0x0000
     14a:	079c                	.insn	2, 0x079c
     14c:	0000                	.insn	2, 0x0000
     14e:	0004                	.insn	2, 0x0004
     150:	8010                	.insn	2, 0x8010
     152:	9f02                	.insn	2, 0x9f02
     154:	079c                	.insn	2, 0x079c
     156:	0000                	.insn	2, 0x0000
     158:	07a4                	.insn	2, 0x07a4
     15a:	0000                	.insn	2, 0x0000
     15c:	0001                	.insn	2, 0x0001
     15e:	0000005b          	.insn	4, 0x005b
     162:	0000                	.insn	2, 0x0000
     164:	0000                	.insn	2, 0x0000
     166:	ec00                	.insn	2, 0xec00
     168:	0004                	.insn	2, 0x0004
     16a:	3000                	.insn	2, 0x3000
     16c:	0005                	.insn	2, 0x0005
     16e:	0200                	.insn	2, 0x0200
     170:	3000                	.insn	2, 0x3000
     172:	9c9f 0005 a400      	.insn	6, 0xa40000059c9f
     178:	0005                	.insn	2, 0x0005
     17a:	0200                	.insn	2, 0x0200
     17c:	3000                	.insn	2, 0x3000
     17e:	309f 0006 3c00      	.insn	6, 0x3c000006309f
     184:	0006                	.insn	2, 0x0006
     186:	0200                	.insn	2, 0x0200
     188:	3000                	.insn	2, 0x3000
     18a:	3c9f 0006 4c00      	.insn	6, 0x4c0000063c9f
     190:	0006                	.insn	2, 0x0006
     192:	0100                	.insn	2, 0x0100
     194:	5a00                	.insn	2, 0x5a00
     196:	0650                	.insn	2, 0x0650
     198:	0000                	.insn	2, 0x0000
     19a:	068c                	.insn	2, 0x068c
     19c:	0000                	.insn	2, 0x0000
     19e:	0001                	.insn	2, 0x0001
     1a0:	005a                	.insn	2, 0x005a
     1a2:	0000                	.insn	2, 0x0000
     1a4:	0000                	.insn	2, 0x0000
     1a6:	0000                	.insn	2, 0x0000
     1a8:	ec00                	.insn	2, 0xec00
     1aa:	0004                	.insn	2, 0x0004
     1ac:	f000                	.insn	2, 0xf000
     1ae:	0004                	.insn	2, 0x0004
     1b0:	0100                	.insn	2, 0x0100
     1b2:	5d00                	.insn	2, 0x5d00
     1b4:	04fc                	.insn	2, 0x04fc
     1b6:	0000                	.insn	2, 0x0000
     1b8:	0500                	.insn	2, 0x0500
     1ba:	0000                	.insn	2, 0x0000
     1bc:	7f7d0003          	lb	zero,2039(s10)
     1c0:	009f 0005 2400      	.insn	6, 0x24000005009f
     1c6:	0005                	.insn	2, 0x0005
     1c8:	0300                	.insn	2, 0x0300
     1ca:	7d00                	.insn	2, 0x7d00
     1cc:	9f7e                	.insn	2, 0x9f7e
     1ce:	0528                	.insn	2, 0x0528
     1d0:	0000                	.insn	2, 0x0000
     1d2:	0530                	.insn	2, 0x0530
     1d4:	0000                	.insn	2, 0x0000
     1d6:	0001                	.insn	2, 0x0001
     1d8:	9c5d                	.insn	2, 0x9c5d
     1da:	0005                	.insn	2, 0x0005
     1dc:	a000                	.insn	2, 0xa000
     1de:	0005                	.insn	2, 0x0005
     1e0:	0300                	.insn	2, 0x0300
     1e2:	7d00                	.insn	2, 0x7d00
     1e4:	9f7e                	.insn	2, 0x9f7e
     1e6:	05a0                	.insn	2, 0x05a0
     1e8:	0000                	.insn	2, 0x0000
     1ea:	05a4                	.insn	2, 0x05a4
     1ec:	0000                	.insn	2, 0x0000
     1ee:	0001                	.insn	2, 0x0001
     1f0:	3c5d                	.insn	2, 0x3c5d
     1f2:	0006                	.insn	2, 0x0006
     1f4:	5400                	.insn	2, 0x5400
     1f6:	0006                	.insn	2, 0x0006
     1f8:	0100                	.insn	2, 0x0100
     1fa:	5d00                	.insn	2, 0x5d00
     1fc:	0658                	.insn	2, 0x0658
     1fe:	0000                	.insn	2, 0x0000
     200:	068c                	.insn	2, 0x068c
     202:	0000                	.insn	2, 0x0000
     204:	0001                	.insn	2, 0x0001
     206:	005d                	.insn	2, 0x005d
     208:	0000                	.insn	2, 0x0000
     20a:	0000                	.insn	2, 0x0000
     20c:	0000                	.insn	2, 0x0000
     20e:	3000                	.insn	2, 0x3000
     210:	0005                	.insn	2, 0x0005
     212:	4000                	.insn	2, 0x4000
     214:	0005                	.insn	2, 0x0005
     216:	0400                	.insn	2, 0x0400
     218:	1000                	.insn	2, 0x1000
     21a:	07e8                	.insn	2, 0x07e8
     21c:	409f 0005 5000      	.insn	6, 0x50000005409f
     222:	0005                	.insn	2, 0x0005
     224:	0100                	.insn	2, 0x0100
     226:	5a00                	.insn	2, 0x5a00
     228:	05d4                	.insn	2, 0x05d4
     22a:	0000                	.insn	2, 0x0000
     22c:	05dc                	.insn	2, 0x05dc
     22e:	0000                	.insn	2, 0x0000
     230:	0001                	.insn	2, 0x0001
     232:	e05a                	.insn	2, 0xe05a
     234:	0005                	.insn	2, 0x0005
     236:	e800                	.insn	2, 0xe800
     238:	0005                	.insn	2, 0x0005
     23a:	0100                	.insn	2, 0x0100
     23c:	5a00                	.insn	2, 0x5a00
	...
     246:	055c                	.insn	2, 0x055c
     248:	0000                	.insn	2, 0x0000
     24a:	0570                	.insn	2, 0x0570
     24c:	0000                	.insn	2, 0x0000
     24e:	0002                	.insn	2, 0x0002
     250:	9f34                	.insn	2, 0x9f34
     252:	0570                	.insn	2, 0x0570
     254:	0000                	.insn	2, 0x0000
     256:	057c                	.insn	2, 0x057c
     258:	0000                	.insn	2, 0x0000
     25a:	0001                	.insn	2, 0x0001
     25c:	105a                	.insn	2, 0x105a
     25e:	0006                	.insn	2, 0x0006
     260:	1800                	.insn	2, 0x1800
     262:	0006                	.insn	2, 0x0006
     264:	0100                	.insn	2, 0x0100
     266:	5a00                	.insn	2, 0x5a00
     268:	061c                	.insn	2, 0x061c
     26a:	0000                	.insn	2, 0x0000
     26c:	0624                	.insn	2, 0x0624
     26e:	0000                	.insn	2, 0x0000
     270:	0001                	.insn	2, 0x0001
     272:	005a                	.insn	2, 0x005a
     274:	0000                	.insn	2, 0x0000
     276:	0000                	.insn	2, 0x0000
     278:	0000                	.insn	2, 0x0000
     27a:	bc00                	.insn	2, 0xbc00
     27c:	0005                	.insn	2, 0x0005
     27e:	c400                	.insn	2, 0xc400
     280:	0005                	.insn	2, 0x0005
     282:	0100                	.insn	2, 0x0100
     284:	5a00                	.insn	2, 0x5a00
	...
     28e:	05fc                	.insn	2, 0x05fc
     290:	0000                	.insn	2, 0x0000
     292:	0604                	.insn	2, 0x0604
     294:	0000                	.insn	2, 0x0000
     296:	0001                	.insn	2, 0x0001
     298:	005a                	.insn	2, 0x005a
     29a:	0000                	.insn	2, 0x0000
     29c:	0000                	.insn	2, 0x0000
     29e:	0000                	.insn	2, 0x0000
     2a0:	3c00                	.insn	2, 0x3c00
     2a2:	0006                	.insn	2, 0x0006
     2a4:	4400                	.insn	2, 0x4400
     2a6:	0006                	.insn	2, 0x0006
     2a8:	0100                	.insn	2, 0x0100
     2aa:	5c00                	.insn	2, 0x5c00
     2ac:	0658                	.insn	2, 0x0658
     2ae:	0000                	.insn	2, 0x0000
     2b0:	068c                	.insn	2, 0x068c
     2b2:	0000                	.insn	2, 0x0000
     2b4:	0001                	.insn	2, 0x0001
     2b6:	005c                	.insn	2, 0x005c
     2b8:	0000                	.insn	2, 0x0000
     2ba:	0000                	.insn	2, 0x0000
     2bc:	0000                	.insn	2, 0x0000
     2be:	4800                	.insn	2, 0x4800
     2c0:	0006                	.insn	2, 0x0006
     2c2:	5800                	.insn	2, 0x5800
     2c4:	0006                	.insn	2, 0x0006
     2c6:	0100                	.insn	2, 0x0100
     2c8:	5e00                	.insn	2, 0x5e00
	...
     2d2:	0698                	.insn	2, 0x0698
     2d4:	0000                	.insn	2, 0x0000
     2d6:	06e0                	.insn	2, 0x06e0
     2d8:	0000                	.insn	2, 0x0000
     2da:	0002                	.insn	2, 0x0002
     2dc:	9f30                	.insn	2, 0x9f30
     2de:	0740                	.insn	2, 0x0740
     2e0:	0000                	.insn	2, 0x0000
     2e2:	074c                	.insn	2, 0x074c
     2e4:	0000                	.insn	2, 0x0000
     2e6:	0002                	.insn	2, 0x0002
     2e8:	9f30                	.insn	2, 0x9f30
     2ea:	074c                	.insn	2, 0x074c
     2ec:	0000                	.insn	2, 0x0000
     2ee:	075c                	.insn	2, 0x075c
     2f0:	0000                	.insn	2, 0x0000
     2f2:	0001                	.insn	2, 0x0001
     2f4:	0007605b          	.insn	4, 0x0007605b
     2f8:	9c00                	.insn	2, 0x9c00
     2fa:	01000007          	.insn	4, 0x01000007
     2fe:	5b00                	.insn	2, 0x5b00
	...
     308:	0698                	.insn	2, 0x0698
     30a:	0000                	.insn	2, 0x0000
     30c:	069c                	.insn	2, 0x069c
     30e:	0000                	.insn	2, 0x0000
     310:	0001                	.insn	2, 0x0001
     312:	a05d                	.insn	2, 0xa05d
     314:	0006                	.insn	2, 0x0006
     316:	a400                	.insn	2, 0xa400
     318:	0006                	.insn	2, 0x0006
     31a:	0300                	.insn	2, 0x0300
     31c:	7d00                	.insn	2, 0x7d00
     31e:	06a49f7f 06c80000 	.insn	12, 0x0003000006c8000006a49f7f
     326:	00030000 
     32a:	7e7d                	.insn	2, 0x7e7d
     32c:	cc9f 0006 d400      	.insn	6, 0xd4000006cc9f
     332:	0006                	.insn	2, 0x0006
     334:	0100                	.insn	2, 0x0100
     336:	5d00                	.insn	2, 0x5d00
     338:	06d4                	.insn	2, 0x06d4
     33a:	0000                	.insn	2, 0x0000
     33c:	06d8                	.insn	2, 0x06d8
     33e:	0000                	.insn	2, 0x0000
     340:	7e7d0003          	lb	zero,2023(s10)
     344:	d89f 0006 e000      	.insn	6, 0xe0000006d89f
     34a:	0006                	.insn	2, 0x0006
     34c:	0100                	.insn	2, 0x0100
     34e:	5d00                	.insn	2, 0x5d00
     350:	074c                	.insn	2, 0x074c
     352:	0000                	.insn	2, 0x0000
     354:	0764                	.insn	2, 0x0764
     356:	0000                	.insn	2, 0x0000
     358:	0001                	.insn	2, 0x0001
     35a:	685d                	.insn	2, 0x685d
     35c:	9c000007          	.insn	4, 0x9c000007
     360:	01000007          	.insn	4, 0x01000007
     364:	5d00                	.insn	2, 0x5d00
	...
     36e:	074c                	.insn	2, 0x074c
     370:	0000                	.insn	2, 0x0000
     372:	0754                	.insn	2, 0x0754
     374:	0000                	.insn	2, 0x0000
     376:	0001                	.insn	2, 0x0001
     378:	685c                	.insn	2, 0x685c
     37a:	9c000007          	.insn	4, 0x9c000007
     37e:	01000007          	.insn	4, 0x01000007
     382:	5c00                	.insn	2, 0x5c00
	...
     38c:	0758                	.insn	2, 0x0758
     38e:	0000                	.insn	2, 0x0000
     390:	0768                	.insn	2, 0x0768
     392:	0000                	.insn	2, 0x0000
     394:	0001                	.insn	2, 0x0001
     396:	005e                	.insn	2, 0x005e
     398:	0000                	.insn	2, 0x0000
     39a:	0000                	.insn	2, 0x0000
     39c:	0000                	.insn	2, 0x0000
     39e:	4800                	.insn	2, 0x4800
     3a0:	0008                	.insn	2, 0x0008
     3a2:	5800                	.insn	2, 0x5800
     3a4:	0008                	.insn	2, 0x0008
     3a6:	0100                	.insn	2, 0x0100
     3a8:	5a00                	.insn	2, 0x5a00
     3aa:	0858                	.insn	2, 0x0858
     3ac:	0000                	.insn	2, 0x0000
     3ae:	085c                	.insn	2, 0x085c
     3b0:	0000                	.insn	2, 0x0000
     3b2:	7f7c0003          	lb	zero,2039(s8)
     3b6:	5c9f 0008 8000      	.insn	6, 0x800000085c9f
     3bc:	0008                	.insn	2, 0x0008
     3be:	0300                	.insn	2, 0x0300
     3c0:	7c00                	.insn	2, 0x7c00
     3c2:	9f7e                	.insn	2, 0x9f7e
     3c4:	0884                	.insn	2, 0x0884
     3c6:	0000                	.insn	2, 0x0000
     3c8:	088c                	.insn	2, 0x088c
     3ca:	0000                	.insn	2, 0x0000
     3cc:	0001                	.insn	2, 0x0001
     3ce:	8c5c                	.insn	2, 0x8c5c
     3d0:	0008                	.insn	2, 0x0008
     3d2:	9000                	.insn	2, 0x9000
     3d4:	0008                	.insn	2, 0x0008
     3d6:	0300                	.insn	2, 0x0300
     3d8:	7c00                	.insn	2, 0x7c00
     3da:	9f7e                	.insn	2, 0x9f7e
     3dc:	0890                	.insn	2, 0x0890
     3de:	0000                	.insn	2, 0x0000
     3e0:	089c                	.insn	2, 0x089c
     3e2:	0000                	.insn	2, 0x0000
     3e4:	0001                	.insn	2, 0x0001
     3e6:	9c5c                	.insn	2, 0x9c5c
     3e8:	0008                	.insn	2, 0x0008
     3ea:	a000                	.insn	2, 0xa000
     3ec:	0008                	.insn	2, 0x0008
     3ee:	0300                	.insn	2, 0x0300
     3f0:	7c00                	.insn	2, 0x7c00
     3f2:	9f7e                	.insn	2, 0x9f7e
     3f4:	08bc                	.insn	2, 0x08bc
     3f6:	0000                	.insn	2, 0x0000
     3f8:	08d4                	.insn	2, 0x08d4
     3fa:	0000                	.insn	2, 0x0000
     3fc:	0001                	.insn	2, 0x0001
     3fe:	d85c                	.insn	2, 0xd85c
     400:	0008                	.insn	2, 0x0008
     402:	0800                	.insn	2, 0x0800
     404:	0009                	.insn	2, 0x0009
     406:	0100                	.insn	2, 0x0100
     408:	5c00                	.insn	2, 0x5c00
	...
     412:	0848                	.insn	2, 0x0848
     414:	0000                	.insn	2, 0x0000
     416:	08bc                	.insn	2, 0x08bc
     418:	0000                	.insn	2, 0x0000
     41a:	0002                	.insn	2, 0x0002
     41c:	9f30                	.insn	2, 0x9f30
     41e:	08bc                	.insn	2, 0x08bc
     420:	0000                	.insn	2, 0x0000
     422:	08cc                	.insn	2, 0x08cc
     424:	0000                	.insn	2, 0x0000
     426:	0001                	.insn	2, 0x0001
     428:	d05d                	.insn	2, 0xd05d
     42a:	0008                	.insn	2, 0x0008
     42c:	1400                	.insn	2, 0x1400
     42e:	0009                	.insn	2, 0x0009
     430:	0100                	.insn	2, 0x0100
     432:	5d00                	.insn	2, 0x5d00
	...
     43c:	08bc                	.insn	2, 0x08bc
     43e:	0000                	.insn	2, 0x0000
     440:	08c4                	.insn	2, 0x08c4
     442:	0000                	.insn	2, 0x0000
     444:	0001                	.insn	2, 0x0001
     446:	d85a                	.insn	2, 0xd85a
     448:	0008                	.insn	2, 0x0008
     44a:	0800                	.insn	2, 0x0800
     44c:	0009                	.insn	2, 0x0009
     44e:	0100                	.insn	2, 0x0100
     450:	5a00                	.insn	2, 0x5a00
	...
     45a:	08c8                	.insn	2, 0x08c8
     45c:	0000                	.insn	2, 0x0000
     45e:	08d8                	.insn	2, 0x08d8
     460:	0000                	.insn	2, 0x0000
     462:	0001                	.insn	2, 0x0001
     464:	0061                	.insn	2, 0x0061
     466:	0000                	.insn	2, 0x0000
     468:	0000                	.insn	2, 0x0000
     46a:	0000                	.insn	2, 0x0000
     46c:	1400                	.insn	2, 0x1400
     46e:	0009                	.insn	2, 0x0009
     470:	3400                	.insn	2, 0x3400
     472:	0009                	.insn	2, 0x0009
     474:	0100                	.insn	2, 0x0100
     476:	5a00                	.insn	2, 0x5a00
     478:	0934                	.insn	2, 0x0934
     47a:	0000                	.insn	2, 0x0000
     47c:	09b8                	.insn	2, 0x09b8
     47e:	0000                	.insn	2, 0x0000
     480:	0001                	.insn	2, 0x0001
     482:	0058                	.insn	2, 0x0058
     484:	0000                	.insn	2, 0x0000
     486:	0000                	.insn	2, 0x0000
     488:	0000                	.insn	2, 0x0000
     48a:	3400                	.insn	2, 0x3400
     48c:	0009                	.insn	2, 0x0009
     48e:	4800                	.insn	2, 0x4800
     490:	0009                	.insn	2, 0x0009
     492:	0200                	.insn	2, 0x0200
     494:	3200                	.insn	2, 0x3200
     496:	489f 0009 8c00      	.insn	6, 0x8c000009489f
     49c:	0009                	.insn	2, 0x0009
     49e:	0100                	.insn	2, 0x0100
     4a0:	6200                	.insn	2, 0x6200
	...
     4aa:	0934                	.insn	2, 0x0934
     4ac:	0000                	.insn	2, 0x0000
     4ae:	0948                	.insn	2, 0x0948
     4b0:	0000                	.insn	2, 0x0000
     4b2:	00110003          	lb	zero,1(sp)
     4b6:	489f 0009 a000      	.insn	6, 0xa0000009489f
     4bc:	0009                	.insn	2, 0x0009
     4be:	0100                	.insn	2, 0x0100
     4c0:	5900                	.insn	2, 0x5900
	...

000004ca <$d.3>:
     4ca:	ffff                	.insn	2, 0xffff
     4cc:	ffff                	.insn	2, 0xffff
     4ce:	09ec                	.insn	2, 0x09ec
     4d0:	0040                	.insn	2, 0x0040
     4d2:	0000                	.insn	2, 0x0000
     4d4:	0000                	.insn	2, 0x0000
     4d6:	0014                	.insn	2, 0x0014
     4d8:	0000                	.insn	2, 0x0000
     4da:	00110003          	lb	zero,1(sp)
     4de:	009f 0000 0000      	.insn	6, 0x009f
     4e4:	0000                	.insn	2, 0x0000
     4e6:	ff00                	.insn	2, 0xff00
     4e8:	ffff                	.insn	2, 0xffff
     4ea:	ecff 4009 1800 0000 	.insn	22, 0x031c000000205a00010000002000000018004009ecff
     4f2:	2000 0000 0100 5a00 
     4fa:	0020 0000 031c 
     500:	0000                	.insn	2, 0x0000
     502:	0001                	.insn	2, 0x0001
     504:	005f 0000 0000      	.insn	6, 0x005f
     50a:	0000                	.insn	2, 0x0000
     50c:	ff00                	.insn	2, 0xff00
     50e:	ffff                	.insn	2, 0xffff
     510:	ecff 4009 2000 0000 	.insn	22, 0x90000000389f3000020000003800000020004009ecff
     518:	3800 0000 0200 3000 
     520:	389f 0000 9000 
     526:	0000                	.insn	2, 0x0000
     528:	0100                	.insn	2, 0x0100
     52a:	5b00                	.insn	2, 0x5b00
	...
     534:	ffff                	.insn	2, 0xffff
     536:	ffff                	.insn	2, 0xffff
     538:	09ec                	.insn	2, 0x09ec
     53a:	0040                	.insn	2, 0x0040
     53c:	0038                	.insn	2, 0x0038
     53e:	0000                	.insn	2, 0x0000
     540:	0054                	.insn	2, 0x0054
     542:	0000                	.insn	2, 0x0000
     544:	0002                	.insn	2, 0x0002
     546:	9f30                	.insn	2, 0x9f30
     548:	0054                	.insn	2, 0x0054
     54a:	0000                	.insn	2, 0x0000
     54c:	0068                	.insn	2, 0x0068
     54e:	0000                	.insn	2, 0x0000
     550:	0006                	.insn	2, 0x0006
     552:	007a                	.insn	2, 0x007a
     554:	0311                	.insn	2, 0x0311
     556:	00689f1b          	.insn	4, 0x00689f1b
     55a:	0000                	.insn	2, 0x0000
     55c:	007c                	.insn	2, 0x007c
     55e:	0000                	.insn	2, 0x0000
     560:	0009                	.insn	2, 0x0009
     562:	007a                	.insn	2, 0x007a
     564:	0311                	.insn	2, 0x0311
     566:	2201111b          	.insn	4, 0x2201111b
     56a:	009f 0000 0000      	.insn	6, 0x009f
     570:	0000                	.insn	2, 0x0000
     572:	ff00                	.insn	2, 0xff00
     574:	ffff                	.insn	2, 0xffff
     576:	ecff 4009 a000 0000 	.insn	22, 0x018c000001505f0001000000e0000000a0004009ecff
     57e:	e000 0000 0100 5f00 
     586:	0150 0000 018c 
     58c:	0000                	.insn	2, 0x0000
     58e:	0001                	.insn	2, 0x0001
     590:	005f 0000 0000      	.insn	6, 0x005f
     596:	0000                	.insn	2, 0x0000
     598:	ff00                	.insn	2, 0xff00
     59a:	ffff                	.insn	2, 0xffff
     59c:	ecff 4009 a000 0000 	.insn	22, 0x8c000001509f330002000000e0000000a0004009ecff
     5a4:	e000 0000 0200 3300 
     5ac:	509f 0001 8c00 
     5b2:	0001                	.insn	2, 0x0001
     5b4:	0200                	.insn	2, 0x0200
     5b6:	3300                	.insn	2, 0x3300
     5b8:	009f 0000 0000      	.insn	6, 0x009f
     5be:	0000                	.insn	2, 0x0000
     5c0:	ff00                	.insn	2, 0xff00
     5c2:	ffff                	.insn	2, 0xffff
     5c4:	ecff 4009 a000 0000 	.insn	22, 0x520001000000e0000000a0004009ecff
     5cc:	e000 0000 0100 5200 
     5d4:	0000 0000 0000 
     5da:	0000                	.insn	2, 0x0000
     5dc:	ffff                	.insn	2, 0xffff
     5de:	ffff                	.insn	2, 0xffff
     5e0:	09ec                	.insn	2, 0x09ec
     5e2:	0040                	.insn	2, 0x0040
     5e4:	00a0                	.insn	2, 0x00a0
     5e6:	0000                	.insn	2, 0x0000
     5e8:	00e0                	.insn	2, 0x00e0
     5ea:	0000                	.insn	2, 0x0000
     5ec:	0004                	.insn	2, 0x0004
     5ee:	c072                	.insn	2, 0xc072
     5f0:	9f00                	.insn	2, 0x9f00
	...
     5fa:	ffff                	.insn	2, 0xffff
     5fc:	ffff                	.insn	2, 0xffff
     5fe:	09ec                	.insn	2, 0x09ec
     600:	0040                	.insn	2, 0x0040
     602:	00a0                	.insn	2, 0x00a0
     604:	0000                	.insn	2, 0x0000
     606:	00e0                	.insn	2, 0x00e0
     608:	0000                	.insn	2, 0x0000
     60a:	0004                	.insn	2, 0x0004
     60c:	d072                	.insn	2, 0xd072
     60e:	9f00                	.insn	2, 0x9f00
	...
     618:	ffff                	.insn	2, 0xffff
     61a:	ffff                	.insn	2, 0xffff
     61c:	09ec                	.insn	2, 0x09ec
     61e:	0040                	.insn	2, 0x0040
     620:	00bc                	.insn	2, 0x00bc
     622:	0000                	.insn	2, 0x0000
     624:	00e0                	.insn	2, 0x00e0
     626:	0000                	.insn	2, 0x0000
     628:	0001                	.insn	2, 0x0001
     62a:	0061                	.insn	2, 0x0061
     62c:	0000                	.insn	2, 0x0000
     62e:	0000                	.insn	2, 0x0000
     630:	0000                	.insn	2, 0x0000
     632:	ff00                	.insn	2, 0xff00
     634:	ffff                	.insn	2, 0xffff
     636:	ecff 4009 c000 0000 	.insn	22, 0x01709f41100003000000e0000000c0004009ecff
     63e:	e000 0000 0300 1000 
     646:	9f41 0170 0000 
     64c:	018c                	.insn	2, 0x018c
     64e:	0000                	.insn	2, 0x0000
     650:	41100003          	lb	zero,1041(zero) # 411 <$d.6+0x1b9>
     654:	009f 0000 0000      	.insn	6, 0x009f
     65a:	0000                	.insn	2, 0x0000
     65c:	ff00                	.insn	2, 0xff00
     65e:	ffff                	.insn	2, 0xffff
     660:	ecff 4009 d000 0000 	.insn	22, 0x8c000001809f3a0002000000e0000000d0004009ecff
     668:	e000 0000 0200 3a00 
     670:	809f 0001 8c00 
     676:	0001                	.insn	2, 0x0001
     678:	0200                	.insn	2, 0x0200
     67a:	3a00                	.insn	2, 0x3a00
     67c:	009f 0000 0000      	.insn	6, 0x009f
     682:	0000                	.insn	2, 0x0000
     684:	ff00                	.insn	2, 0xff00
     686:	ffff                	.insn	2, 0xffff
     688:	ecff 4009 dc00 0000 	.insn	22, 0x40000000f09f300002000000f0000000dc004009ecff
     690:	f000 0000 0200 3000 
     698:	f09f 0000 4000 
     69e:	0001                	.insn	2, 0x0001
     6a0:	0100                	.insn	2, 0x0100
     6a2:	5b00                	.insn	2, 0x5b00
	...
     6ac:	ffff                	.insn	2, 0xffff
     6ae:	ffff                	.insn	2, 0xffff
     6b0:	09ec                	.insn	2, 0x09ec
     6b2:	0040                	.insn	2, 0x0040
     6b4:	00f0                	.insn	2, 0x00f0
     6b6:	0000                	.insn	2, 0x0000
     6b8:	0100                	.insn	2, 0x0100
     6ba:	0000                	.insn	2, 0x0000
     6bc:	0002                	.insn	2, 0x0002
     6be:	9f30                	.insn	2, 0x9f30
     6c0:	0100                	.insn	2, 0x0100
     6c2:	0000                	.insn	2, 0x0000
     6c4:	011c                	.insn	2, 0x011c
     6c6:	0000                	.insn	2, 0x0000
     6c8:	000a                	.insn	2, 0x000a
     6ca:	0081                	.insn	2, 0x0081
     6cc:	d072                	.insn	2, 0xd072
     6ce:	1c00                	.insn	2, 0x1c00
     6d0:	0411                	.insn	2, 0x0411
     6d2:	011c9f1b          	.insn	4, 0x011c9f1b
     6d6:	0000                	.insn	2, 0x0000
     6d8:	0124                	.insn	2, 0x0124
     6da:	0000                	.insn	2, 0x0000
     6dc:	000d                	.insn	2, 0x000d
     6de:	0081                	.insn	2, 0x0081
     6e0:	d072                	.insn	2, 0xd072
     6e2:	1c00                	.insn	2, 0x1c00
     6e4:	0411                	.insn	2, 0x0411
     6e6:	2201111b          	.insn	4, 0x2201111b
     6ea:	009f 0000 0000      	.insn	6, 0x009f
     6f0:	0000                	.insn	2, 0x0000
     6f2:	ff00                	.insn	2, 0xff00
     6f4:	ffff                	.insn	2, 0xffff
     6f6:	ecff 4009 9000 0001 	.insn	22, 0x7c000002549f3a0002000001bc00000190004009ecff
     6fe:	bc00 0001 0200 3a00 
     706:	549f 0002 7c00 
     70c:	0002                	.insn	2, 0x0002
     70e:	0200                	.insn	2, 0x0200
     710:	3a00                	.insn	2, 0x3a00
     712:	009f 0000 0000      	.insn	6, 0x009f
     718:	0000                	.insn	2, 0x0000
     71a:	ff00                	.insn	2, 0xff00
     71c:	ffff                	.insn	2, 0xffff
     71e:	ecff 4009 a000 0001 	.insn	22, 0x02649f42100003000001bc000001a0004009ecff
     726:	bc00 0001 0300 1000 
     72e:	9f42 0264 0000 
     734:	027c                	.insn	2, 0x027c
     736:	0000                	.insn	2, 0x0000
     738:	42100003          	lb	zero,1057(zero) # 421 <$d.6+0x1c9>
     73c:	009f 0000 0000      	.insn	6, 0x009f
     742:	0000                	.insn	2, 0x0000
     744:	ff00                	.insn	2, 0xff00
     746:	ffff                	.insn	2, 0xffff
     748:	ecff 4009 ac00 0001 	.insn	22, 0x7c000002709f3a0002000001bc000001ac004009ecff
     750:	bc00 0001 0200 3a00 
     758:	709f 0002 7c00 
     75e:	0002                	.insn	2, 0x0002
     760:	0200                	.insn	2, 0x0200
     762:	3a00                	.insn	2, 0x3a00
     764:	009f 0000 0000      	.insn	6, 0x009f
     76a:	0000                	.insn	2, 0x0000
     76c:	ff00                	.insn	2, 0xff00
     76e:	ffff                	.insn	2, 0xffff
     770:	ecff 4009 b800 0001 	.insn	22, 0x20000001d09f300002000001d0000001b8004009ecff
     778:	d000 0001 0200 3000 
     780:	d09f 0001 2000 
     786:	0002                	.insn	2, 0x0002
     788:	0100                	.insn	2, 0x0100
     78a:	5b00                	.insn	2, 0x5b00
	...
     794:	ffff                	.insn	2, 0xffff
     796:	ffff                	.insn	2, 0xffff
     798:	09ec                	.insn	2, 0x09ec
     79a:	0040                	.insn	2, 0x0040
     79c:	01d0                	.insn	2, 0x01d0
     79e:	0000                	.insn	2, 0x0000
     7a0:	01e0                	.insn	2, 0x01e0
     7a2:	0000                	.insn	2, 0x0000
     7a4:	0002                	.insn	2, 0x0002
     7a6:	9f30                	.insn	2, 0x9f30
     7a8:	01e0                	.insn	2, 0x01e0
     7aa:	0000                	.insn	2, 0x0000
     7ac:	01fc                	.insn	2, 0x01fc
     7ae:	0000                	.insn	2, 0x0000
     7b0:	000a                	.insn	2, 0x000a
     7b2:	0081                	.insn	2, 0x0081
     7b4:	c072                	.insn	2, 0xc072
     7b6:	1c00                	.insn	2, 0x1c00
     7b8:	0411                	.insn	2, 0x0411
     7ba:	01fc9f1b          	.insn	4, 0x01fc9f1b
     7be:	0000                	.insn	2, 0x0000
     7c0:	0204                	.insn	2, 0x0204
     7c2:	0000                	.insn	2, 0x0000
     7c4:	000d                	.insn	2, 0x000d
     7c6:	0081                	.insn	2, 0x0081
     7c8:	c072                	.insn	2, 0xc072
     7ca:	1c00                	.insn	2, 0x1c00
     7cc:	0411                	.insn	2, 0x0411
     7ce:	2201111b          	.insn	4, 0x2201111b
     7d2:	009f 0000 0000      	.insn	6, 0x009f
     7d8:	0000                	.insn	2, 0x0000
     7da:	ff00                	.insn	2, 0xff00
     7dc:	ffff                	.insn	2, 0xffff
     7de:	ecff 4009 2400 0002 	.insn	22, 0xac000002809f3a00020000025000000224004009ecff
     7e6:	5000 0002 0200 3a00 
     7ee:	809f 0002 ac00 
     7f4:	0002                	.insn	2, 0x0002
     7f6:	0200                	.insn	2, 0x0200
     7f8:	3a00                	.insn	2, 0x3a00
     7fa:	009f 0000 0000      	.insn	6, 0x009f
     800:	0000                	.insn	2, 0x0000
     802:	ff00                	.insn	2, 0xff00
     804:	ffff                	.insn	2, 0xffff
     806:	ecff 4009 3400 0002 	.insn	22, 0x02909f431000030000025000000234004009ecff
     80e:	5000 0002 0300 1000 
     816:	9f43 0290 0000 
     81c:	02ac                	.insn	2, 0x02ac
     81e:	0000                	.insn	2, 0x0000
     820:	43100003          	lb	zero,1073(zero) # 431 <$d.6+0x1d9>
     824:	009f 0000 0000      	.insn	6, 0x009f
     82a:	0000                	.insn	2, 0x0000
     82c:	ff00                	.insn	2, 0xff00
     82e:	ffff                	.insn	2, 0xffff
     830:	ecff 4009 4000 0002 	.insn	22, 0xac0000029c9f3a00020000025000000240004009ecff
     838:	5000 0002 0200 3a00 
     840:	9c9f 0002 ac00 
     846:	0002                	.insn	2, 0x0002
     848:	0200                	.insn	2, 0x0200
     84a:	3a00                	.insn	2, 0x3a00
     84c:	009f 0000 0000      	.insn	6, 0x009f
     852:	0000                	.insn	2, 0x0000
     854:	ff00                	.insn	2, 0xff00
     856:	ffff                	.insn	2, 0xffff
     858:	ecff 4009 a800 0002 	.insn	22, 0x04000002bc9f300002000002bc000002a8004009ecff
     860:	bc00 0002 0200 3000 
     868:	bc9f 0002 0400 
     86e:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     872:	5b00                	.insn	2, 0x5b00
	...
     87c:	ffff                	.insn	2, 0xffff
     87e:	ffff                	.insn	2, 0xffff
     880:	09ec                	.insn	2, 0x09ec
     882:	0040                	.insn	2, 0x0040
     884:	02c4                	.insn	2, 0x02c4
     886:	0000                	.insn	2, 0x0000
     888:	02e0                	.insn	2, 0x02e0
     88a:	0000                	.insn	2, 0x0000
     88c:	0009                	.insn	2, 0x0009
     88e:	0075                	.insn	2, 0x0075
     890:	007f 111c 1b7f e09f 	.insn	10, 0x0002e09f1b7f111c007f
     898:	0002 
     89a:	e400                	.insn	2, 0xe400
     89c:	0002                	.insn	2, 0x0002
     89e:	0c00                	.insn	2, 0x0c00
     8a0:	7500                	.insn	2, 0x7500
     8a2:	7f00                	.insn	2, 0x7f00
     8a4:	1c00                	.insn	2, 0x1c00
     8a6:	7f11                	.insn	2, 0x7f11
     8a8:	2201111b          	.insn	4, 0x2201111b
     8ac:	009f 0000 0000      	.insn	6, 0x009f
     8b2:	0000                	.insn	2, 0x0000
     8b4:	ff00                	.insn	2, 0xff00
     8b6:	ffff                	.insn	2, 0xffff
     8b8:	ecff 4009 1c00 0003 	.insn	22, 0x0330000003205a0001000003200000031c004009ecff
     8c0:	2000 0003 0100 5a00 
     8c8:	0320 0000 0330 
     8ce:	0000                	.insn	2, 0x0000
     8d0:	0001                	.insn	2, 0x0001
     8d2:	0000005b          	.insn	4, 0x005b
     8d6:	0000                	.insn	2, 0x0000
     8d8:	0000                	.insn	2, 0x0000
     8da:	ff00                	.insn	2, 0xff00
     8dc:	ffff                	.insn	2, 0xffff
     8de:	ecff 4009 3000 0003 	.insn	22, 0x0344000003345a00010000033400000330004009ecff
     8e6:	3400 0003 0100 5a00 
     8ee:	0334 0000 0344 
     8f4:	0000                	.insn	2, 0x0000
     8f6:	0001                	.insn	2, 0x0001
     8f8:	0000005b          	.insn	4, 0x005b
     8fc:	0000                	.insn	2, 0x0000
     8fe:	0000                	.insn	2, 0x0000
     900:	ff00                	.insn	2, 0xff00
     902:	ffff                	.insn	2, 0xffff
     904:	ecff 4009 4400 0003 	.insn	22, 0x5a00010000034c00000344004009ecff
     90c:	4c00 0003 0100 5a00 
     914:	0000 0000 0000 
     91a:	0000                	.insn	2, 0x0000
     91c:	ffff                	.insn	2, 0xffff
     91e:	ffff                	.insn	2, 0xffff
     920:	09ec                	.insn	2, 0x09ec
     922:	0040                	.insn	2, 0x0040
     924:	0350                	.insn	2, 0x0350
     926:	0000                	.insn	2, 0x0000
     928:	0358                	.insn	2, 0x0358
     92a:	0000                	.insn	2, 0x0000
     92c:	0001                	.insn	2, 0x0001
     92e:	005a                	.insn	2, 0x005a
     930:	0000                	.insn	2, 0x0000
     932:	0000                	.insn	2, 0x0000
     934:	0000                	.insn	2, 0x0000
     936:	ff00                	.insn	2, 0xff00
     938:	ffff                	.insn	2, 0xffff
     93a:	ecff 4009 6800 0003 	.insn	22, 0x038c0000037c5b00010000037800000368004009ecff
     942:	7800 0003 0100 5b00 
     94a:	037c 0000 038c 
     950:	0000                	.insn	2, 0x0000
     952:	0001                	.insn	2, 0x0001
     954:	0000005b          	.insn	4, 0x005b
     958:	0000                	.insn	2, 0x0000
     95a:	0000                	.insn	2, 0x0000
     95c:	ff00                	.insn	2, 0xff00
     95e:	ffff                	.insn	2, 0xffff
     960:	ecff 4009 6800 0003 	.insn	22, 0x03880000037c5a00010000037c00000368004009ecff
     968:	7c00 0003 0100 5a00 
     970:	037c 0000 0388 
     976:	0000                	.insn	2, 0x0000
     978:	0001                	.insn	2, 0x0001
     97a:	885e                	.insn	2, 0x885e
     97c:	94000003          	lb	zero,-1728(zero) # fffff940 <USER_MAX+0xffaff940>
     980:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     984:	5d00                	.insn	2, 0x5d00
	...
     98e:	ffff                	.insn	2, 0xffff
     990:	ffff                	.insn	2, 0xffff
     992:	09ec                	.insn	2, 0x09ec
     994:	0040                	.insn	2, 0x0040
     996:	039c                	.insn	2, 0x039c
     998:	0000                	.insn	2, 0x0000
     99a:	03a8                	.insn	2, 0x03a8
     99c:	0000                	.insn	2, 0x0000
     99e:	0001                	.insn	2, 0x0001
     9a0:	a85a                	.insn	2, 0xa85a
     9a2:	b4000003          	lb	zero,-1216(zero) # fffffb40 <USER_MAX+0xffaffb40>
     9a6:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
     9aa:	7a00                	.insn	2, 0x7a00
     9ac:	03b49f7f 03c00000 	.insn	12, 0x0001000003c0000003b49f7f
     9b4:	00010000 
     9b8:	cc5a                	.insn	2, 0xcc5a
     9ba:	d0000003          	lb	zero,-768(zero) # fffffd00 <USER_MAX+0xffaffd00>
     9be:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     9c2:	5a00                	.insn	2, 0x5a00
	...
     9cc:	ffff                	.insn	2, 0xffff
     9ce:	ffff                	.insn	2, 0xffff
     9d0:	09ec                	.insn	2, 0x09ec
     9d2:	0040                	.insn	2, 0x0040
     9d4:	039c                	.insn	2, 0x039c
     9d6:	0000                	.insn	2, 0x0000
     9d8:	03d4                	.insn	2, 0x03d4
     9da:	0000                	.insn	2, 0x0000
     9dc:	0001                	.insn	2, 0x0001
     9de:	0000005b          	.insn	4, 0x005b
     9e2:	0000                	.insn	2, 0x0000
     9e4:	0000                	.insn	2, 0x0000
     9e6:	ff00                	.insn	2, 0xff00
     9e8:	ffff                	.insn	2, 0xffff
     9ea:	ecff 4009 dc00 0003 	.insn	22, 0x06c4000004185a000100000418000003dc004009ecff
     9f2:	1800 0004 0100 5a00 
     9fa:	0418 0000 06c4 
     a00:	0000                	.insn	2, 0x0000
     a02:	0001                	.insn	2, 0x0001
     a04:	0065                	.insn	2, 0x0065
     a06:	0000                	.insn	2, 0x0000
     a08:	0000                	.insn	2, 0x0000
     a0a:	0000                	.insn	2, 0x0000
     a0c:	ff00                	.insn	2, 0xff00
     a0e:	ffff                	.insn	2, 0xffff
     a10:	ecff 4009 b400 0004 	.insn	22, 0x062c00000618580001000004d4000004b4004009ecff
     a18:	d400 0004 0100 5800 
     a20:	0618 0000 062c 
     a26:	0000                	.insn	2, 0x0000
     a28:	0001                	.insn	2, 0x0001
     a2a:	0058                	.insn	2, 0x0058
     a2c:	0000                	.insn	2, 0x0000
     a2e:	0000                	.insn	2, 0x0000
     a30:	0000                	.insn	2, 0x0000
     a32:	ff00                	.insn	2, 0xff00
     a34:	ffff                	.insn	2, 0xffff
     a36:	ecff 4009 b800 0004 	.insn	22, 0x06380000062c580001000004d4000004b8004009ecff
     a3e:	d400 0004 0100 5800 
     a46:	062c 0000 0638 
     a4c:	0000                	.insn	2, 0x0000
     a4e:	0001                	.insn	2, 0x0001
     a50:	3858                	.insn	2, 0x3858
     a52:	0006                	.insn	2, 0x0006
     a54:	4c00                	.insn	2, 0x4c00
     a56:	0006                	.insn	2, 0x0006
     a58:	0100                	.insn	2, 0x0100
     a5a:	5900                	.insn	2, 0x5900
     a5c:	064c                	.insn	2, 0x064c
     a5e:	0000                	.insn	2, 0x0000
     a60:	0698                	.insn	2, 0x0698
     a62:	0000                	.insn	2, 0x0000
     a64:	0001                	.insn	2, 0x0001
     a66:	0058                	.insn	2, 0x0058
     a68:	0000                	.insn	2, 0x0000
     a6a:	0000                	.insn	2, 0x0000
     a6c:	0000                	.insn	2, 0x0000
     a6e:	ff00                	.insn	2, 0xff00
     a70:	ffff                	.insn	2, 0xffff
     a72:	ecff 4009 b800 0004 	.insn	22, 0x062c9f00110003000004d4000004b8004009ecff
     a7a:	d400 0004 0300 1100 
     a82:	9f00 062c 0000 
     a88:	0630                	.insn	2, 0x0630
     a8a:	0000                	.insn	2, 0x0000
     a8c:	00110003          	lb	zero,1(sp)
     a90:	389f 0006 6400      	.insn	6, 0x64000006389f
     a96:	0006                	.insn	2, 0x0006
     a98:	0100                	.insn	2, 0x0100
     a9a:	6400                	.insn	2, 0x6400
     a9c:	0664                	.insn	2, 0x0664
     a9e:	0000                	.insn	2, 0x0000
     aa0:	0674                	.insn	2, 0x0674
     aa2:	0000                	.insn	2, 0x0000
     aa4:	0001                	.insn	2, 0x0001
     aa6:	005a                	.insn	2, 0x005a
     aa8:	0000                	.insn	2, 0x0000
     aaa:	0000                	.insn	2, 0x0000
     aac:	0000                	.insn	2, 0x0000
     aae:	ff00                	.insn	2, 0xff00
     ab0:	ffff                	.insn	2, 0xffff
     ab2:	ecff 4009 ec00 0004 	.insn	22, 0x05049f0711000300000504000004ec004009ecff
     aba:	0400 0005 0300 1100 
     ac2:	9f07 0504 0000 
     ac8:	0520                	.insn	2, 0x0520
     aca:	0000                	.insn	2, 0x0000
     acc:	06110003          	lb	zero,97(sp)
     ad0:	209f 0005 3c00      	.insn	6, 0x3c000005209f
     ad6:	0005                	.insn	2, 0x0005
     ad8:	0300                	.insn	2, 0x0300
     ada:	1100                	.insn	2, 0x1100
     adc:	9f05                	.insn	2, 0x9f05
     ade:	053c                	.insn	2, 0x053c
     ae0:	0000                	.insn	2, 0x0000
     ae2:	0558                	.insn	2, 0x0558
     ae4:	0000                	.insn	2, 0x0000
     ae6:	04110003          	lb	zero,65(sp)
     aea:	589f 0005 7400      	.insn	6, 0x74000005589f
     af0:	0005                	.insn	2, 0x0005
     af2:	0300                	.insn	2, 0x0300
     af4:	1100                	.insn	2, 0x1100
     af6:	05749f03          	lh	t5,87(s1)
     afa:	0000                	.insn	2, 0x0000
     afc:	0590                	.insn	2, 0x0590
     afe:	0000                	.insn	2, 0x0000
     b00:	02110003          	lb	zero,33(sp)
     b04:	909f 0005 ac00      	.insn	6, 0xac000005909f
     b0a:	0005                	.insn	2, 0x0005
     b0c:	0300                	.insn	2, 0x0300
     b0e:	1100                	.insn	2, 0x1100
     b10:	9f01                	.insn	2, 0x9f01
     b12:	05ac                	.insn	2, 0x05ac
     b14:	0000                	.insn	2, 0x0000
     b16:	05c4                	.insn	2, 0x05c4
     b18:	0000                	.insn	2, 0x0000
     b1a:	00110003          	lb	zero,1(sp)
     b1e:	c49f 0005 cc00      	.insn	6, 0xcc000005c49f
     b24:	0005                	.insn	2, 0x0005
     b26:	0300                	.insn	2, 0x0300
     b28:	1100                	.insn	2, 0x1100
     b2a:	00009f7f 00000000 	.insn	12, 0xffff00000000000000009f7f
     b32:	ffff0000 
     b36:	ffff                	.insn	2, 0xffff
     b38:	09ec                	.insn	2, 0x09ec
     b3a:	0040                	.insn	2, 0x0040
     b3c:	04ec                	.insn	2, 0x04ec
     b3e:	0000                	.insn	2, 0x0000
     b40:	05b0                	.insn	2, 0x05b0
     b42:	0000                	.insn	2, 0x0000
     b44:	0001                	.insn	2, 0x0001
     b46:	0000005b          	.insn	4, 0x005b
     b4a:	0000                	.insn	2, 0x0000
     b4c:	0000                	.insn	2, 0x0000
     b4e:	ff00                	.insn	2, 0xff00
     b50:	ffff                	.insn	2, 0xffff
     b52:	ecff 4009 f000 0004 	.insn	22, 0x05100000050c5a0001000004f4000004f0004009ecff
     b5a:	f400 0004 0100 5a00 
     b62:	050c 0000 0510 
     b68:	0000                	.insn	2, 0x0000
     b6a:	0001                	.insn	2, 0x0001
     b6c:	285a                	.insn	2, 0x285a
     b6e:	0005                	.insn	2, 0x0005
     b70:	2c00                	.insn	2, 0x2c00
     b72:	0005                	.insn	2, 0x0005
     b74:	0100                	.insn	2, 0x0100
     b76:	5a00                	.insn	2, 0x5a00
     b78:	0544                	.insn	2, 0x0544
     b7a:	0000                	.insn	2, 0x0000
     b7c:	0548                	.insn	2, 0x0548
     b7e:	0000                	.insn	2, 0x0000
     b80:	0001                	.insn	2, 0x0001
     b82:	605a                	.insn	2, 0x605a
     b84:	0005                	.insn	2, 0x0005
     b86:	6400                	.insn	2, 0x6400
     b88:	0005                	.insn	2, 0x0005
     b8a:	0100                	.insn	2, 0x0100
     b8c:	5a00                	.insn	2, 0x5a00
     b8e:	057c                	.insn	2, 0x057c
     b90:	0000                	.insn	2, 0x0000
     b92:	0580                	.insn	2, 0x0580
     b94:	0000                	.insn	2, 0x0000
     b96:	0001                	.insn	2, 0x0001
     b98:	985a                	.insn	2, 0x985a
     b9a:	0005                	.insn	2, 0x0005
     b9c:	9c00                	.insn	2, 0x9c00
     b9e:	0005                	.insn	2, 0x0005
     ba0:	0100                	.insn	2, 0x0100
     ba2:	5a00                	.insn	2, 0x5a00
     ba4:	05b0                	.insn	2, 0x05b0
     ba6:	0000                	.insn	2, 0x0000
     ba8:	05b4                	.insn	2, 0x05b4
     baa:	0000                	.insn	2, 0x0000
     bac:	0001                	.insn	2, 0x0001
     bae:	0000005b          	.insn	4, 0x005b
     bb2:	0000                	.insn	2, 0x0000
     bb4:	0000                	.insn	2, 0x0000
     bb6:	ff00                	.insn	2, 0xff00
     bb8:	ffff                	.insn	2, 0xffff
     bba:	ecff 4009 f000 0005 	.insn	22, 0x0608000005fc5c0001000005fc000005f0004009ecff
     bc2:	fc00 0005 0100 5c00 
     bca:	05fc 0000 0608 
     bd0:	0000                	.insn	2, 0x0000
     bd2:	7f7c0003          	lb	zero,2039(s8)
     bd6:	089f 0006 1000      	.insn	6, 0x10000006089f
     bdc:	0006                	.insn	2, 0x0006
     bde:	0100                	.insn	2, 0x0100
     be0:	5c00                	.insn	2, 0x5c00
	...
     bea:	ffff                	.insn	2, 0xffff
     bec:	ffff                	.insn	2, 0xffff
     bee:	09ec                	.insn	2, 0x09ec
     bf0:	0040                	.insn	2, 0x0040
     bf2:	06e4                	.insn	2, 0x06e4
     bf4:	0000                	.insn	2, 0x0000
     bf6:	0708                	.insn	2, 0x0708
     bf8:	0000                	.insn	2, 0x0000
     bfa:	0001                	.insn	2, 0x0001
     bfc:	085a                	.insn	2, 0x085a
     bfe:	58000007          	.insn	4, 0x58000007
     c02:	01000007          	.insn	4, 0x01000007
     c06:	5b00                	.insn	2, 0x5b00
     c08:	0758                	.insn	2, 0x0758
     c0a:	0000                	.insn	2, 0x0000
     c0c:	07ac                	.insn	2, 0x07ac
     c0e:	0000                	.insn	2, 0x0000
     c10:	0001                	.insn	2, 0x0001
     c12:	0059                	.insn	2, 0x0059
     c14:	0000                	.insn	2, 0x0000
     c16:	0000                	.insn	2, 0x0000
     c18:	0000                	.insn	2, 0x0000
     c1a:	ff00                	.insn	2, 0xff00
     c1c:	ffff                	.insn	2, 0xffff
     c1e:	ecff 4009 0800 0007 	.insn	22, 0x34000007289f3a00020000072800000708004009ecff
     c26:	2800 0007 0200 3a00 
     c2e:	289f 0007 3400 
     c34:	02000007          	.insn	4, 0x02000007
     c38:	4000                	.insn	2, 0x4000
     c3a:	349f 0007 4000      	.insn	6, 0x40000007349f
     c40:	01000007          	.insn	4, 0x01000007
     c44:	5800                	.insn	2, 0x5800
     c46:	0740                	.insn	2, 0x0740
     c48:	0000                	.insn	2, 0x0000
     c4a:	0744                	.insn	2, 0x0744
     c4c:	0000                	.insn	2, 0x0000
     c4e:	0002                	.insn	2, 0x0002
     c50:	9f3a                	.insn	2, 0x9f3a
	...
     c5a:	ffff                	.insn	2, 0xffff
     c5c:	ffff                	.insn	2, 0xffff
     c5e:	09ec                	.insn	2, 0x09ec
     c60:	0040                	.insn	2, 0x0040
     c62:	0734                	.insn	2, 0x0734
     c64:	0000                	.insn	2, 0x0000
     c66:	0740                	.insn	2, 0x0740
     c68:	0000                	.insn	2, 0x0000
     c6a:	0002                	.insn	2, 0x0002
     c6c:	9f30                	.insn	2, 0x9f30
     c6e:	0758                	.insn	2, 0x0758
     c70:	0000                	.insn	2, 0x0000
     c72:	07a0                	.insn	2, 0x07a0
     c74:	0000                	.insn	2, 0x0000
     c76:	0001                	.insn	2, 0x0001
     c78:	a85a                	.insn	2, 0xa85a
     c7a:	d4000007          	.insn	4, 0xd4000007
     c7e:	01000007          	.insn	4, 0x01000007
     c82:	5a00                	.insn	2, 0x5a00
	...
     c8c:	ffff                	.insn	2, 0xffff
     c8e:	ffff                	.insn	2, 0xffff
     c90:	09ec                	.insn	2, 0x09ec
     c92:	0040                	.insn	2, 0x0040
     c94:	0758                	.insn	2, 0x0758
     c96:	0000                	.insn	2, 0x0000
     c98:	07a0                	.insn	2, 0x07a0
     c9a:	0000                	.insn	2, 0x0000
     c9c:	0001                	.insn	2, 0x0001
     c9e:	005c                	.insn	2, 0x005c
     ca0:	0000                	.insn	2, 0x0000
     ca2:	0000                	.insn	2, 0x0000
     ca4:	0000                	.insn	2, 0x0000
     ca6:	ff00                	.insn	2, 0xff00
     ca8:	ffff                	.insn	2, 0xffff
     caa:	ecff 4009 9000 0007 	.insn	22, 0x650001000007b000000790004009ecff
     cb2:	b000 0007 0100 6500 
     cba:	0000 0000 0000 
     cc0:	0000                	.insn	2, 0x0000
     cc2:	ffff                	.insn	2, 0xffff
     cc4:	ffff                	.insn	2, 0xffff
     cc6:	09ec                	.insn	2, 0x09ec
     cc8:	0040                	.insn	2, 0x0040
     cca:	07d4                	.insn	2, 0x07d4
     ccc:	0000                	.insn	2, 0x0000
     cce:	07e0                	.insn	2, 0x07e0
     cd0:	0000                	.insn	2, 0x0000
     cd2:	0001                	.insn	2, 0x0001
     cd4:	e45a                	.insn	2, 0xe45a
     cd6:	fc000007          	.insn	4, 0xfc000007
     cda:	01000007          	.insn	4, 0x01000007
     cde:	5a00                	.insn	2, 0x5a00
     ce0:	07fc                	.insn	2, 0x07fc
     ce2:	0000                	.insn	2, 0x0000
     ce4:	0848                	.insn	2, 0x0848
     ce6:	0000                	.insn	2, 0x0000
     ce8:	0001                	.insn	2, 0x0001
     cea:	0058                	.insn	2, 0x0058
     cec:	0000                	.insn	2, 0x0000
     cee:	0000                	.insn	2, 0x0000
     cf0:	0000                	.insn	2, 0x0000
     cf2:	ff00                	.insn	2, 0xff00
     cf4:	ffff                	.insn	2, 0xffff
     cf6:	ecff 4009 fc00 0007 	.insn	22, 0x200000080c9f3200020000080c000007fc004009ecff
     cfe:	0c00 0008 0200 3200 
     d06:	0c9f 0008 2000 
     d0c:	0008                	.insn	2, 0x0008
     d0e:	0100                	.insn	2, 0x0100
     d10:	5900                	.insn	2, 0x5900
     d12:	0820                	.insn	2, 0x0820
     d14:	0000                	.insn	2, 0x0000
     d16:	0828                	.insn	2, 0x0828
     d18:	0000                	.insn	2, 0x0000
     d1a:	01790003          	lb	zero,23(s2)
     d1e:	289f 0008 3c00      	.insn	6, 0x3c000008289f
     d24:	0008                	.insn	2, 0x0008
     d26:	0100                	.insn	2, 0x0100
     d28:	5900                	.insn	2, 0x5900
	...
     d32:	ffff                	.insn	2, 0xffff
     d34:	ffff                	.insn	2, 0xffff
     d36:	09ec                	.insn	2, 0x09ec
     d38:	0040                	.insn	2, 0x0040
     d3a:	0864                	.insn	2, 0x0864
     d3c:	0000                	.insn	2, 0x0000
     d3e:	086c                	.insn	2, 0x086c
     d40:	0000                	.insn	2, 0x0000
     d42:	0001                	.insn	2, 0x0001
     d44:	0000005b          	.insn	4, 0x005b
     d48:	0000                	.insn	2, 0x0000
     d4a:	0000                	.insn	2, 0x0000
     d4c:	ff00                	.insn	2, 0xff00
     d4e:	ffff                	.insn	2, 0xffff
     d50:	ecff 4009 6c00 0008 	.insn	22, 0x5a0001000008740000086c004009ecff
     d58:	7400 0008 0100 5a00 
     d60:	0000 0000 0000 
	...

00000d68 <$d.3>:
     d68:	0000                	.insn	2, 0x0000
     d6a:	0000                	.insn	2, 0x0000
     d6c:	0014                	.insn	2, 0x0014
     d6e:	0000                	.insn	2, 0x0000
     d70:	0001                	.insn	2, 0x0001
     d72:	145a                	.insn	2, 0x145a
     d74:	0000                	.insn	2, 0x0000
     d76:	6800                	.insn	2, 0x6800
     d78:	0000                	.insn	2, 0x0000
     d7a:	0100                	.insn	2, 0x0100
     d7c:	5800                	.insn	2, 0x5800
	...
     d86:	005c                	.insn	2, 0x005c
     d88:	0000                	.insn	2, 0x0000
     d8a:	0070                	.insn	2, 0x0070
     d8c:	0000                	.insn	2, 0x0000
     d8e:	0001                	.insn	2, 0x0001
     d90:	0000005b          	.insn	4, 0x005b
     d94:	0000                	.insn	2, 0x0000
     d96:	0000                	.insn	2, 0x0000
     d98:	7c00                	.insn	2, 0x7c00
     d9a:	0000                	.insn	2, 0x0000
     d9c:	8800                	.insn	2, 0x8800
     d9e:	0000                	.insn	2, 0x0000
     da0:	0100                	.insn	2, 0x0100
     da2:	5a00                	.insn	2, 0x5a00
	...
     dac:	0098                	.insn	2, 0x0098
     dae:	0000                	.insn	2, 0x0000
     db0:	00b8                	.insn	2, 0x00b8
     db2:	0000                	.insn	2, 0x0000
     db4:	0002                	.insn	2, 0x0002
     db6:	9f30                	.insn	2, 0x9f30
     db8:	00b8                	.insn	2, 0x00b8
     dba:	0000                	.insn	2, 0x0000
     dbc:	00c4                	.insn	2, 0x00c4
     dbe:	0000                	.insn	2, 0x0000
     dc0:	0006                	.insn	2, 0x0006
     dc2:	0078                	.insn	2, 0x0078
     dc4:	1472                	.insn	2, 0x1472
     dc6:	9f1c                	.insn	2, 0x9f1c
     dc8:	00c4                	.insn	2, 0x00c4
     dca:	0000                	.insn	2, 0x0000
     dcc:	00c8                	.insn	2, 0x00c8
     dce:	0000                	.insn	2, 0x0000
     dd0:	0009                	.insn	2, 0x0009
     dd2:	0078                	.insn	2, 0x0078
     dd4:	1472                	.insn	2, 0x1472
     dd6:	111c                	.insn	2, 0x111c
     dd8:	2201                	.insn	2, 0x2201
     dda:	009f 0000 0000      	.insn	6, 0x009f
     de0:	0000                	.insn	2, 0x0000
     de2:	0c00                	.insn	2, 0x0c00
     de4:	0001                	.insn	2, 0x0001
     de6:	b000                	.insn	2, 0xb000
     de8:	0001                	.insn	2, 0x0001
     dea:	0100                	.insn	2, 0x0100
     dec:	5900                	.insn	2, 0x5900
	...
     df6:	017c                	.insn	2, 0x017c
     df8:	0000                	.insn	2, 0x0000
     dfa:	01f4                	.insn	2, 0x01f4
     dfc:	0000                	.insn	2, 0x0000
     dfe:	0001                	.insn	2, 0x0001
     e00:	005c                	.insn	2, 0x005c
     e02:	0000                	.insn	2, 0x0000
     e04:	0000                	.insn	2, 0x0000
     e06:	0000                	.insn	2, 0x0000
     e08:	a800                	.insn	2, 0xa800
     e0a:	0001                	.insn	2, 0x0001
     e0c:	f400                	.insn	2, 0xf400
     e0e:	0001                	.insn	2, 0x0001
     e10:	0100                	.insn	2, 0x0100
     e12:	5a00                	.insn	2, 0x5a00
	...
     e1c:	01cc                	.insn	2, 0x01cc
     e1e:	0000                	.insn	2, 0x0000
     e20:	01f4                	.insn	2, 0x01f4
     e22:	0000                	.insn	2, 0x0000
     e24:	0001                	.insn	2, 0x0001
     e26:	0000005b          	.insn	4, 0x005b
     e2a:	0000                	.insn	2, 0x0000
     e2c:	0000                	.insn	2, 0x0000
     e2e:	1c00                	.insn	2, 0x1c00
     e30:	0002                	.insn	2, 0x0002
     e32:	5c00                	.insn	2, 0x5c00
     e34:	0002                	.insn	2, 0x0002
     e36:	0100                	.insn	2, 0x0100
     e38:	5a00                	.insn	2, 0x5a00
     e3a:	025c                	.insn	2, 0x025c
     e3c:	0000                	.insn	2, 0x0000
     e3e:	02c4                	.insn	2, 0x02c4
     e40:	0000                	.insn	2, 0x0000
     e42:	0001                	.insn	2, 0x0001
     e44:	e464                	.insn	2, 0xe464
     e46:	0002                	.insn	2, 0x0002
     e48:	c400                	.insn	2, 0xc400
     e4a:	0004                	.insn	2, 0x0004
     e4c:	0100                	.insn	2, 0x0100
     e4e:	6400                	.insn	2, 0x6400
	...
     e58:	021c                	.insn	2, 0x021c
     e5a:	0000                	.insn	2, 0x0000
     e5c:	0258                	.insn	2, 0x0258
     e5e:	0000                	.insn	2, 0x0000
     e60:	0001                	.insn	2, 0x0001
     e62:	0002585b          	.insn	4, 0x0002585b
     e66:	b800                	.insn	2, 0xb800
     e68:	0002                	.insn	2, 0x0002
     e6a:	0100                	.insn	2, 0x0100
     e6c:	5900                	.insn	2, 0x5900
     e6e:	02e4                	.insn	2, 0x02e4
     e70:	0000                	.insn	2, 0x0000
     e72:	04c4                	.insn	2, 0x04c4
     e74:	0000                	.insn	2, 0x0000
     e76:	0001                	.insn	2, 0x0001
     e78:	0059                	.insn	2, 0x0059
     e7a:	0000                	.insn	2, 0x0000
     e7c:	0000                	.insn	2, 0x0000
     e7e:	0000                	.insn	2, 0x0000
     e80:	1c00                	.insn	2, 0x1c00
     e82:	0002                	.insn	2, 0x0002
     e84:	5400                	.insn	2, 0x5400
     e86:	0002                	.insn	2, 0x0002
     e88:	0100                	.insn	2, 0x0100
     e8a:	5c00                	.insn	2, 0x5c00
     e8c:	0254                	.insn	2, 0x0254
     e8e:	0000                	.insn	2, 0x0000
     e90:	02b4                	.insn	2, 0x02b4
     e92:	0000                	.insn	2, 0x0000
     e94:	0001                	.insn	2, 0x0001
     e96:	e458                	.insn	2, 0xe458
     e98:	0002                	.insn	2, 0x0002
     e9a:	c400                	.insn	2, 0xc400
     e9c:	0004                	.insn	2, 0x0004
     e9e:	0100                	.insn	2, 0x0100
     ea0:	5800                	.insn	2, 0x5800
	...
     eaa:	0278                	.insn	2, 0x0278
     eac:	0000                	.insn	2, 0x0000
     eae:	0284                	.insn	2, 0x0284
     eb0:	0000                	.insn	2, 0x0000
     eb2:	0001                	.insn	2, 0x0001
     eb4:	0000005b          	.insn	4, 0x005b
     eb8:	0000                	.insn	2, 0x0000
     eba:	0000                	.insn	2, 0x0000
     ebc:	9000                	.insn	2, 0x9000
     ebe:	0002                	.insn	2, 0x0002
     ec0:	a400                	.insn	2, 0xa400
     ec2:	0002                	.insn	2, 0x0002
     ec4:	0100                	.insn	2, 0x0100
     ec6:	5a00                	.insn	2, 0x5a00
	...
     ed0:	0300                	.insn	2, 0x0300
     ed2:	0000                	.insn	2, 0x0000
     ed4:	030c                	.insn	2, 0x030c
     ed6:	0000                	.insn	2, 0x0000
     ed8:	0a110003          	lb	zero,161(sp)
     edc:	389f 0004 4000      	.insn	6, 0x40000004389f
     ee2:	0004                	.insn	2, 0x0004
     ee4:	0300                	.insn	2, 0x0300
     ee6:	1100                	.insn	2, 0x1100
     ee8:	9f08                	.insn	2, 0x9f08
     eea:	0440                	.insn	2, 0x0440
     eec:	0000                	.insn	2, 0x0000
     eee:	0454                	.insn	2, 0x0454
     ef0:	0000                	.insn	2, 0x0000
     ef2:	09110003          	lb	zero,145(sp)
     ef6:	549f 0004 5c00      	.insn	6, 0x5c000004549f
     efc:	0004                	.insn	2, 0x0004
     efe:	0300                	.insn	2, 0x0300
     f00:	1100                	.insn	2, 0x1100
     f02:	9f0a                	.insn	2, 0x9f0a
	...
     f0c:	0300                	.insn	2, 0x0300
     f0e:	0000                	.insn	2, 0x0000
     f10:	0304                	.insn	2, 0x0304
     f12:	0000                	.insn	2, 0x0000
     f14:	0001                	.insn	2, 0x0001
     f16:	0003045b          	.insn	4, 0x0003045b
     f1a:	1000                	.insn	2, 0x1000
     f1c:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     f20:	5a00                	.insn	2, 0x5a00
     f22:	0348                	.insn	2, 0x0348
     f24:	0000                	.insn	2, 0x0000
     f26:	0350                	.insn	2, 0x0350
     f28:	0000                	.insn	2, 0x0000
     f2a:	00110003          	lb	zero,1(sp)
     f2e:	509f 0003 5c00      	.insn	6, 0x5c000003509f
     f34:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
     f38:	5a00                	.insn	2, 0x5a00
     f3a:	035c                	.insn	2, 0x035c
     f3c:	0000                	.insn	2, 0x0000
     f3e:	0364                	.insn	2, 0x0364
     f40:	0000                	.insn	2, 0x0000
     f42:	01110003          	lb	zero,17(sp)
     f46:	649f 0003 2c00      	.insn	6, 0x2c000003649f
     f4c:	0004                	.insn	2, 0x0004
     f4e:	0100                	.insn	2, 0x0100
     f50:	5a00                	.insn	2, 0x5a00
     f52:	042c                	.insn	2, 0x042c
     f54:	0000                	.insn	2, 0x0000
     f56:	0438                	.insn	2, 0x0438
     f58:	0000                	.insn	2, 0x0000
     f5a:	017a0003          	lb	zero,23(s4)
     f5e:	3c9f 0004 4800      	.insn	6, 0x480000043c9f
     f64:	0004                	.insn	2, 0x0004
     f66:	0100                	.insn	2, 0x0100
     f68:	5b00                	.insn	2, 0x5b00
     f6a:	044c                	.insn	2, 0x044c
     f6c:	0000                	.insn	2, 0x0000
     f6e:	0454                	.insn	2, 0x0454
     f70:	0000                	.insn	2, 0x0000
     f72:	0001                	.insn	2, 0x0001
     f74:	545a                	.insn	2, 0x545a
     f76:	0004                	.insn	2, 0x0004
     f78:	6400                	.insn	2, 0x6400
     f7a:	0004                	.insn	2, 0x0004
     f7c:	0100                	.insn	2, 0x0100
     f7e:	5b00                	.insn	2, 0x5b00
	...
     f88:	0300                	.insn	2, 0x0300
     f8a:	0000                	.insn	2, 0x0000
     f8c:	0328                	.insn	2, 0x0328
     f8e:	0000                	.insn	2, 0x0000
     f90:	0009                	.insn	2, 0x0009
     f92:	0085                	.insn	2, 0x0085
     f94:	1011                	.insn	2, 0x1011
     f96:	111c                	.insn	2, 0x111c
     f98:	289f1b7f 2c000003 	.insn	12, 0x0c0000032c000003289f1b7f
     fa0:	0c000003 
     fa4:	8500                	.insn	2, 0x8500
     fa6:	1100                	.insn	2, 0x1100
     fa8:	1c10                	.insn	2, 0x1c10
     faa:	7f11                	.insn	2, 0x7f11
     fac:	2201111b          	.insn	4, 0x2201111b
     fb0:	349f 0003 c400      	.insn	6, 0xc4000003349f
     fb6:	0004                	.insn	2, 0x0004
     fb8:	0900                	.insn	2, 0x0900
     fba:	8500                	.insn	2, 0x8500
     fbc:	1100                	.insn	2, 0x1100
     fbe:	1c10                	.insn	2, 0x1c10
     fc0:	7f11                	.insn	2, 0x7f11
     fc2:	00009f1b          	.insn	4, 0x9f1b
     fc6:	0000                	.insn	2, 0x0000
     fc8:	0000                	.insn	2, 0x0000
     fca:	0000                	.insn	2, 0x0000
     fcc:	0348                	.insn	2, 0x0348
     fce:	0000                	.insn	2, 0x0000
     fd0:	0350                	.insn	2, 0x0350
     fd2:	0000                	.insn	2, 0x0000
     fd4:	00110003          	lb	zero,1(sp)
     fd8:	509f 0003 5c00      	.insn	6, 0x5c000003509f
     fde:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
     fe2:	1100                	.insn	2, 0x1100
     fe4:	9f01                	.insn	2, 0x9f01
     fe6:	035c                	.insn	2, 0x035c
     fe8:	0000                	.insn	2, 0x0000
     fea:	0364                	.insn	2, 0x0364
     fec:	0000                	.insn	2, 0x0000
     fee:	00110003          	lb	zero,1(sp)
     ff2:	649f 0003 7800      	.insn	6, 0x78000003649f
     ff8:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
     ffc:	1100                	.insn	2, 0x1100
     ffe:	9f01                	.insn	2, 0x9f01
    1000:	0378                	.insn	2, 0x0378
    1002:	0000                	.insn	2, 0x0000
    1004:	0380                	.insn	2, 0x0380
    1006:	0000                	.insn	2, 0x0000
    1008:	02110003          	lb	zero,33(sp)
    100c:	809f 0003 8800      	.insn	6, 0x88000003809f
    1012:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    1016:	1100                	.insn	2, 0x1100
    1018:	03889f03          	lh	t5,56(a7)
    101c:	0000                	.insn	2, 0x0000
    101e:	0390                	.insn	2, 0x0390
    1020:	0000                	.insn	2, 0x0000
    1022:	04110003          	lb	zero,65(sp)
    1026:	909f 0003 9800      	.insn	6, 0x98000003909f
    102c:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    1030:	1100                	.insn	2, 0x1100
    1032:	9f05                	.insn	2, 0x9f05
    1034:	0398                	.insn	2, 0x0398
    1036:	0000                	.insn	2, 0x0000
    1038:	03a0                	.insn	2, 0x03a0
    103a:	0000                	.insn	2, 0x0000
    103c:	06110003          	lb	zero,97(sp)
    1040:	a09f 0003 a800      	.insn	6, 0xa8000003a09f
    1046:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    104a:	1100                	.insn	2, 0x1100
    104c:	03b49f07          	.insn	4, 0x03b49f07
    1050:	0000                	.insn	2, 0x0000
    1052:	03c0                	.insn	2, 0x03c0
    1054:	0000                	.insn	2, 0x0000
    1056:	02110003          	lb	zero,33(sp)
    105a:	c09f 0003 d400      	.insn	6, 0xd4000003c09f
    1060:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    1064:	1100                	.insn	2, 0x1100
    1066:	03d49f03          	lh	t5,61(s1)
    106a:	0000                	.insn	2, 0x0000
    106c:	03e8                	.insn	2, 0x03e8
    106e:	0000                	.insn	2, 0x0000
    1070:	04110003          	lb	zero,65(sp)
    1074:	e89f 0003 fc00      	.insn	6, 0xfc000003e89f
    107a:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
    107e:	1100                	.insn	2, 0x1100
    1080:	9f05                	.insn	2, 0x9f05
    1082:	03fc                	.insn	2, 0x03fc
    1084:	0000                	.insn	2, 0x0000
    1086:	0410                	.insn	2, 0x0410
    1088:	0000                	.insn	2, 0x0000
    108a:	06110003          	lb	zero,97(sp)
    108e:	109f 0004 2400      	.insn	6, 0x24000004109f
    1094:	0004                	.insn	2, 0x0004
    1096:	0300                	.insn	2, 0x0300
    1098:	1100                	.insn	2, 0x1100
    109a:	04249f07          	.insn	4, 0x04249f07
    109e:	0000                	.insn	2, 0x0000
    10a0:	042c                	.insn	2, 0x042c
    10a2:	0000                	.insn	2, 0x0000
    10a4:	08110003          	lb	zero,129(sp)
    10a8:	009f 0000 0000      	.insn	6, 0x009f
    10ae:	0000                	.insn	2, 0x0000
    10b0:	c400                	.insn	2, 0xc400
    10b2:	0004                	.insn	2, 0x0004
    10b4:	e800                	.insn	2, 0xe800
    10b6:	0004                	.insn	2, 0x0004
    10b8:	0100                	.insn	2, 0x0100
    10ba:	5a00                	.insn	2, 0x5a00
	...
    10c4:	0540                	.insn	2, 0x0540
    10c6:	0000                	.insn	2, 0x0000
    10c8:	054c                	.insn	2, 0x054c
    10ca:	0000                	.insn	2, 0x0000
    10cc:	0001                	.insn	2, 0x0001
    10ce:	0000005b          	.insn	4, 0x005b
    10d2:	0000                	.insn	2, 0x0000
    10d4:	0000                	.insn	2, 0x0000
    10d6:	5800                	.insn	2, 0x5800
    10d8:	0005                	.insn	2, 0x0005
    10da:	6c00                	.insn	2, 0x6c00
    10dc:	0005                	.insn	2, 0x0005
    10de:	0100                	.insn	2, 0x0100
    10e0:	5a00                	.insn	2, 0x5a00
	...
    10ea:	05bc                	.insn	2, 0x05bc
    10ec:	0000                	.insn	2, 0x0000
    10ee:	0628                	.insn	2, 0x0628
    10f0:	0000                	.insn	2, 0x0000
    10f2:	0009                	.insn	2, 0x0009
    10f4:	10110083          	lb	ra,257(sp)
    10f8:	111c                	.insn	2, 0x111c
    10fa:	289f1b7f 2c000006 	.insn	12, 0x0c0000062c000006289f1b7f
    1102:	0c000006 
    1106:	8300                	.insn	2, 0x8300
    1108:	1100                	.insn	2, 0x1100
    110a:	1c10                	.insn	2, 0x1c10
    110c:	7f11                	.insn	2, 0x7f11
    110e:	2201111b          	.insn	4, 0x2201111b
    1112:	349f 0006 6400      	.insn	6, 0x64000006349f
    1118:	09000007          	.insn	4, 0x09000007
    111c:	8300                	.insn	2, 0x8300
    111e:	1100                	.insn	2, 0x1100
    1120:	1c10                	.insn	2, 0x1c10
    1122:	7f11                	.insn	2, 0x7f11
    1124:	00009f1b          	.insn	4, 0x9f1b
    1128:	0000                	.insn	2, 0x0000
    112a:	0000                	.insn	2, 0x0000
    112c:	0000                	.insn	2, 0x0000
    112e:	05f4                	.insn	2, 0x05f4
    1130:	0000                	.insn	2, 0x0000
    1132:	0628                	.insn	2, 0x0628
    1134:	0000                	.insn	2, 0x0000
    1136:	0001                	.insn	2, 0x0001
    1138:	0000005b          	.insn	4, 0x005b
    113c:	0000                	.insn	2, 0x0000
    113e:	0000                	.insn	2, 0x0000
    1140:	1c00                	.insn	2, 0x1c00
    1142:	0006                	.insn	2, 0x0006
    1144:	2800                	.insn	2, 0x2800
    1146:	0006                	.insn	2, 0x0006
    1148:	0100                	.insn	2, 0x0100
    114a:	5c00                	.insn	2, 0x5c00
	...
    1154:	0648                	.insn	2, 0x0648
    1156:	0000                	.insn	2, 0x0000
    1158:	064c                	.insn	2, 0x064c
    115a:	0000                	.insn	2, 0x0000
    115c:	00110003          	lb	zero,1(sp)
    1160:	4c9f 0006 5400      	.insn	6, 0x540000064c9f
    1166:	0006                	.insn	2, 0x0006
    1168:	0300                	.insn	2, 0x0300
    116a:	1100                	.insn	2, 0x1100
    116c:	9f01                	.insn	2, 0x9f01
    116e:	0654                	.insn	2, 0x0654
    1170:	0000                	.insn	2, 0x0000
    1172:	065c                	.insn	2, 0x065c
    1174:	0000                	.insn	2, 0x0000
    1176:	02110003          	lb	zero,33(sp)
    117a:	5c9f 0006 6400      	.insn	6, 0x640000065c9f
    1180:	0006                	.insn	2, 0x0006
    1182:	0300                	.insn	2, 0x0300
    1184:	1100                	.insn	2, 0x1100
    1186:	06649f03          	lh	t5,102(s1)
    118a:	0000                	.insn	2, 0x0000
    118c:	066c                	.insn	2, 0x066c
    118e:	0000                	.insn	2, 0x0000
    1190:	04110003          	lb	zero,65(sp)
    1194:	6c9f 0006 7400      	.insn	6, 0x740000066c9f
    119a:	0006                	.insn	2, 0x0006
    119c:	0300                	.insn	2, 0x0300
    119e:	1100                	.insn	2, 0x1100
    11a0:	9f05                	.insn	2, 0x9f05
    11a2:	0674                	.insn	2, 0x0674
    11a4:	0000                	.insn	2, 0x0000
    11a6:	067c                	.insn	2, 0x067c
    11a8:	0000                	.insn	2, 0x0000
    11aa:	06110003          	lb	zero,97(sp)
    11ae:	7c9f 0006 8400      	.insn	6, 0x840000067c9f
    11b4:	0006                	.insn	2, 0x0006
    11b6:	0300                	.insn	2, 0x0300
    11b8:	1100                	.insn	2, 0x1100
    11ba:	06909f07          	.insn	4, 0x06909f07
    11be:	0000                	.insn	2, 0x0000
    11c0:	0698                	.insn	2, 0x0698
    11c2:	0000                	.insn	2, 0x0000
    11c4:	00110003          	lb	zero,1(sp)
    11c8:	989f 0006 a800      	.insn	6, 0xa8000006989f
    11ce:	0006                	.insn	2, 0x0006
    11d0:	0300                	.insn	2, 0x0300
    11d2:	1100                	.insn	2, 0x1100
    11d4:	9f01                	.insn	2, 0x9f01
    11d6:	06a8                	.insn	2, 0x06a8
    11d8:	0000                	.insn	2, 0x0000
    11da:	06b8                	.insn	2, 0x06b8
    11dc:	0000                	.insn	2, 0x0000
    11de:	02110003          	lb	zero,33(sp)
    11e2:	b89f 0006 c800      	.insn	6, 0xc8000006b89f
    11e8:	0006                	.insn	2, 0x0006
    11ea:	0300                	.insn	2, 0x0300
    11ec:	1100                	.insn	2, 0x1100
    11ee:	06c89f03          	lh	t5,108(a7)
    11f2:	0000                	.insn	2, 0x0000
    11f4:	06d8                	.insn	2, 0x06d8
    11f6:	0000                	.insn	2, 0x0000
    11f8:	04110003          	lb	zero,65(sp)
    11fc:	d89f 0006 e800      	.insn	6, 0xe8000006d89f
    1202:	0006                	.insn	2, 0x0006
    1204:	0300                	.insn	2, 0x0300
    1206:	1100                	.insn	2, 0x1100
    1208:	9f05                	.insn	2, 0x9f05
    120a:	06e8                	.insn	2, 0x06e8
    120c:	0000                	.insn	2, 0x0000
    120e:	06f8                	.insn	2, 0x06f8
    1210:	0000                	.insn	2, 0x0000
    1212:	06110003          	lb	zero,97(sp)
    1216:	f89f 0006 0800      	.insn	6, 0x08000006f89f
    121c:	03000007          	.insn	4, 0x03000007
    1220:	1100                	.insn	2, 0x1100
    1222:	07089f07          	.insn	4, 0x07089f07
    1226:	0000                	.insn	2, 0x0000
    1228:	0710                	.insn	2, 0x0710
    122a:	0000                	.insn	2, 0x0000
    122c:	08110003          	lb	zero,129(sp)
    1230:	009f 0000 0000      	.insn	6, 0x009f
    1236:	0000                	.insn	2, 0x0000
    1238:	1c00                	.insn	2, 0x1c00
    123a:	24000007          	.insn	4, 0x24000007
    123e:	03000007          	.insn	4, 0x03000007
    1242:	1100                	.insn	2, 0x1100
    1244:	9f08                	.insn	2, 0x9f08
    1246:	0724                	.insn	2, 0x0724
    1248:	0000                	.insn	2, 0x0000
    124a:	072c                	.insn	2, 0x072c
    124c:	0000                	.insn	2, 0x0000
    124e:	09110003          	lb	zero,145(sp)
    1252:	2c9f 0007 3800      	.insn	6, 0x380000072c9f
    1258:	03000007          	.insn	4, 0x03000007
    125c:	1100                	.insn	2, 0x1100
    125e:	9f0a                	.insn	2, 0x9f0a
    1260:	0738                	.insn	2, 0x0738
    1262:	0000                	.insn	2, 0x0000
    1264:	0740                	.insn	2, 0x0740
    1266:	0000                	.insn	2, 0x0000
    1268:	08110003          	lb	zero,129(sp)
    126c:	409f 0007 5000      	.insn	6, 0x50000007409f
    1272:	03000007          	.insn	4, 0x03000007
    1276:	1100                	.insn	2, 0x1100
    1278:	9f09                	.insn	2, 0x9f09
    127a:	0750                	.insn	2, 0x0750
    127c:	0000                	.insn	2, 0x0000
    127e:	0764                	.insn	2, 0x0764
    1280:	0000                	.insn	2, 0x0000
    1282:	0a110003          	lb	zero,161(sp)
    1286:	009f 0000 0000      	.insn	6, 0x009f
    128c:	0000                	.insn	2, 0x0000
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
  b4:	0000193f 11010b10 	.insn	8, 0x11010b100000193f
  bc:	1201                	.insn	2, 0x1201
  be:	0006                	.insn	2, 0x0006
  c0:	1100                	.insn	2, 0x1100
  c2:	0034                	.insn	2, 0x0034
  c4:	1802                	.insn	2, 0x1802
  c6:	0b3a0e03          	lb	t3,179(s4)
  ca:	13490b3b          	.insn	4, 0x13490b3b
  ce:	0000                	.insn	2, 0x0000
  d0:	3412                	.insn	2, 0x3412
  d2:	0200                	.insn	2, 0x0200
  d4:	3a0e0317          	auipc	t1,0x3a0e0
  d8:	490b3b0b          	.insn	4, 0x490b3b0b
  dc:	13000013          	li	zero,304
  e0:	000a                	.insn	2, 0x000a
  e2:	0b3a0e03          	lb	t3,179(s4)
  e6:	01110b3b          	.insn	4, 0x01110b3b
  ea:	0000                	.insn	2, 0x0000
  ec:	0b14                	.insn	2, 0x0b14
  ee:	5501                	.insn	2, 0x5501
  f0:	15000017          	auipc	zero,0x15000
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
 170:	0005                	.insn	2, 0x0005
 172:	1702                	.insn	2, 0x1702
 174:	0b3a0e03          	lb	t3,179(s4)
 178:	13490b3b          	.insn	4, 0x13490b3b
 17c:	0000                	.insn	2, 0x0000
 17e:	8920                	.insn	2, 0x8920
 180:	0182                	.insn	2, 0x0182
 182:	3100                	.insn	2, 0x3100
 184:	19429513          	.insn	4, 0x19429513
 188:	0111                	.insn	2, 0x0111
 18a:	0000                	.insn	2, 0x0000
 18c:	2e21                	.insn	2, 0x2e21
 18e:	0300                	.insn	2, 0x0300
 190:	3a0e                	.insn	2, 0x3a0e
 192:	270b3b0b          	.insn	4, 0x270b3b0b
 196:	3c19                	.insn	2, 0x3c19
 198:	3f19                	.insn	2, 0x3f19
 19a:	0019                	.insn	2, 0x0019
 19c:	2200                	.insn	2, 0x2200
 19e:	002e                	.insn	2, 0x002e
 1a0:	0b3a0e03          	lb	t3,179(s4)
 1a4:	19270b3b          	.insn	4, 0x19270b3b
 1a8:	193c                	.insn	2, 0x193c
 1aa:	0187193f 23000019 	.insn	8, 0x230000190187193f
 1b2:	012e                	.insn	2, 0x012e
 1b4:	0111                	.insn	2, 0x0111
 1b6:	0612                	.insn	2, 0x0612
 1b8:	1840                	.insn	2, 0x1840
 1ba:	31194297          	auipc	t0,0x31194
 1be:	24000013          	li	zero,576
 1c2:	0005                	.insn	2, 0x0005
 1c4:	1802                	.insn	2, 0x1802
 1c6:	1331                	.insn	2, 0x1331
 1c8:	0000                	.insn	2, 0x0000
	...

000001cb <$d.4>:
 1cb:	1101                	.insn	2, 0x1101
 1cd:	2501                	.insn	2, 0x2501
 1cf:	130e                	.insn	2, 0x130e
 1d1:	0305                	.insn	2, 0x0305
 1d3:	100e                	.insn	2, 0x100e
 1d5:	110e1b17          	auipc	s6,0x110e1
 1d9:	5501                	.insn	2, 0x5501
 1db:	02000017          	auipc	zero,0x2000
 1df:	0034                	.insn	2, 0x0034
 1e1:	1349                	.insn	2, 0x1349
 1e3:	0b3a                	.insn	2, 0x0b3a
 1e5:	1802053b          	.insn	4, 0x1802053b
 1e9:	0000                	.insn	2, 0x0000
 1eb:	49010103          	lb	sp,1168(sp) # 1335ac <$d.5+0x1322d2>
 1ef:	04000013          	li	zero,64
 1f3:	0021                	.insn	2, 0x0021
 1f5:	1349                	.insn	2, 0x1349
 1f7:	00000b37          	lui	s6,0x0
 1fb:	2405                	.insn	2, 0x2405
 1fd:	0300                	.insn	2, 0x0300
 1ff:	3e0e                	.insn	2, 0x3e0e
 201:	000b0b0b          	.insn	4, 0x000b0b0b
 205:	0600                	.insn	2, 0x0600
 207:	0024                	.insn	2, 0x0024
 209:	0b0b0e03          	lb	t3,176(s6) # b0 <$d.10+0x3c>
 20d:	0b3e                	.insn	2, 0x0b3e
 20f:	0000                	.insn	2, 0x0000
 211:	49001607          	.insn	4, 0x49001607
 215:	3a0e0313          	addi	t1,t3,928
 219:	00053b0b          	.insn	4, 0x00053b0b
 21d:	0800                	.insn	2, 0x0800
 21f:	0016                	.insn	2, 0x0016
 221:	1349                	.insn	2, 0x1349
 223:	0b3a0e03          	lb	t3,179(s4)
 227:	00000b3b          	.insn	4, 0x0b3b
 22b:	0f09                	.insn	2, 0x0f09
 22d:	4900                	.insn	2, 0x4900
 22f:	0a000013          	li	zero,160
 233:	012e                	.insn	2, 0x012e
 235:	0b3a0e03          	lb	t3,179(s4)
 239:	19270b3b          	.insn	4, 0x19270b3b
 23d:	1349                	.insn	2, 0x1349
 23f:	0b20                	.insn	2, 0x0b20
 241:	0000                	.insn	2, 0x0000
 243:	0300050b          	.insn	4, 0x0300050b
 247:	3a0e                	.insn	2, 0x3a0e
 249:	490b3b0b          	.insn	4, 0x490b3b0b
 24d:	0c000013          	li	zero,192
 251:	0034                	.insn	2, 0x0034
 253:	0b3a0e03          	lb	t3,179(s4)
 257:	13490b3b          	.insn	4, 0x13490b3b
 25b:	0000                	.insn	2, 0x0000
 25d:	2e0d                	.insn	2, 0x2e0d
 25f:	1101                	.insn	2, 0x1101
 261:	1201                	.insn	2, 0x1201
 263:	4006                	.insn	2, 0x4006
 265:	9718                	.insn	2, 0x9718
 267:	1942                	.insn	2, 0x1942
 269:	0b3a0e03          	lb	t3,179(s4)
 26d:	19270b3b          	.insn	4, 0x19270b3b
 271:	0187193f 0e000019 	.insn	8, 0x0e0000190187193f
 279:	011d                	.insn	2, 0x011d
 27b:	1331                	.insn	2, 0x1331
 27d:	0111                	.insn	2, 0x0111
 27f:	0612                	.insn	2, 0x0612
 281:	0b58                	.insn	2, 0x0b58
 283:	0b59                	.insn	2, 0x0b59
 285:	00000b57          	.insn	4, 0x0b57
 289:	1c00050f          	.insn	4, 0x1c00050f
 28d:	310d                	.insn	2, 0x310d
 28f:	10000013          	li	zero,256
 293:	0034                	.insn	2, 0x0034
 295:	1702                	.insn	2, 0x1702
 297:	1331                	.insn	2, 0x1331
 299:	0000                	.insn	2, 0x0000
 29b:	3411                	.insn	2, 0x3411
 29d:	1c00                	.insn	2, 0x1c00
 29f:	310d                	.insn	2, 0x310d
 2a1:	12000013          	li	zero,288
 2a5:	012e                	.insn	2, 0x012e
 2a7:	0b3a0e03          	lb	t3,179(s4)
 2ab:	1927053b          	.insn	4, 0x1927053b
 2af:	1349                	.insn	2, 0x1349
 2b1:	0b20                	.insn	2, 0x0b20
 2b3:	0000                	.insn	2, 0x0000
 2b5:	03000513          	li	a0,48
 2b9:	3a0e                	.insn	2, 0x3a0e
 2bb:	49053b0b          	.insn	4, 0x49053b0b
 2bf:	14000013          	li	zero,320
 2c3:	0034                	.insn	2, 0x0034
 2c5:	0b3a0e03          	lb	t3,179(s4)
 2c9:	1349053b          	.insn	4, 0x1349053b
 2cd:	0000                	.insn	2, 0x0000
 2cf:	2e15                	.insn	2, 0x2e15
 2d1:	0301                	.insn	2, 0x0301
 2d3:	3a0e                	.insn	2, 0x3a0e
 2d5:	27053b0b          	.insn	4, 0x27053b0b
 2d9:	3f19                	.insn	2, 0x3f19
 2db:	2019                	.insn	2, 0x2019
 2dd:	1600000b          	.insn	4, 0x1600000b
 2e1:	012e                	.insn	2, 0x012e
 2e3:	0111                	.insn	2, 0x0111
 2e5:	0612                	.insn	2, 0x0612
 2e7:	1840                	.insn	2, 0x1840
 2e9:	03194297          	auipc	t0,0x3194
 2ed:	3a0e                	.insn	2, 0x3a0e
 2ef:	270b3b0b          	.insn	4, 0x270b3b0b
 2f3:	3f19                	.insn	2, 0x3f19
 2f5:	0019                	.insn	2, 0x0019
 2f7:	1700                	.insn	2, 0x1700
 2f9:	0005                	.insn	2, 0x0005
 2fb:	1702                	.insn	2, 0x1702
 2fd:	0b3a0e03          	lb	t3,179(s4)
 301:	13490b3b          	.insn	4, 0x13490b3b
 305:	0000                	.insn	2, 0x0000
 307:	3418                	.insn	2, 0x3418
 309:	0200                	.insn	2, 0x0200
 30b:	0318                	.insn	2, 0x0318
 30d:	3a0e                	.insn	2, 0x3a0e
 30f:	490b3b0b          	.insn	4, 0x490b3b0b
 313:	19000013          	li	zero,400
 317:	0111010b          	.insn	4, 0x0111010b
 31b:	0612                	.insn	2, 0x0612
 31d:	0000                	.insn	2, 0x0000
 31f:	341a                	.insn	2, 0x341a
 321:	0200                	.insn	2, 0x0200
 323:	3a0e0317          	auipc	t1,0x3a0e0
 327:	490b3b0b          	.insn	4, 0x490b3b0b
 32b:	1b000013          	li	zero,432
 32f:	011d                	.insn	2, 0x011d
 331:	1331                	.insn	2, 0x1331
 333:	1755                	.insn	2, 0x1755
 335:	0b58                	.insn	2, 0x0b58
 337:	0b59                	.insn	2, 0x0b59
 339:	00000b57          	.insn	4, 0x0b57
 33d:	051c                	.insn	2, 0x051c
 33f:	0200                	.insn	2, 0x0200
 341:	00133117          	auipc	sp,0x133
 345:	1d00                	.insn	2, 0x1d00
 347:	0005                	.insn	2, 0x0005
 349:	1802                	.insn	2, 0x1802
 34b:	1331                	.insn	2, 0x1331
 34d:	0000                	.insn	2, 0x0000
 34f:	051e                	.insn	2, 0x051e
 351:	1c00                	.insn	2, 0x1c00
 353:	0013310f          	.insn	4, 0x0013310f
 357:	1f00                	.insn	2, 0x1f00
 359:	012e                	.insn	2, 0x012e
 35b:	0111                	.insn	2, 0x0111
 35d:	0612                	.insn	2, 0x0612
 35f:	1840                	.insn	2, 0x1840
 361:	31194297          	auipc	t0,0x31194
 365:	20000013          	li	zero,512
 369:	0034                	.insn	2, 0x0034
 36b:	1802                	.insn	2, 0x1802
 36d:	1331                	.insn	2, 0x1331
 36f:	0000                	.insn	2, 0x0000
 371:	3421                	.insn	2, 0x3421
 373:	1c00                	.insn	2, 0x1c00
 375:	0013310f          	.insn	4, 0x0013310f
 379:	2200                	.insn	2, 0x2200
 37b:	012e                	.insn	2, 0x012e
 37d:	0b3a0e03          	lb	t3,179(s4)
 381:	1927053b          	.insn	4, 0x1927053b
 385:	0b20                	.insn	2, 0x0b20
 387:	0000                	.insn	2, 0x0000
 389:	02000523          	sb	zero,42(zero) # 2a <$d.3+0x2a>
 38d:	0318                	.insn	2, 0x0318
 38f:	3a0e                	.insn	2, 0x3a0e
 391:	490b3b0b          	.insn	4, 0x490b3b0b
 395:	24000013          	li	zero,576
 399:	012e                	.insn	2, 0x012e
 39b:	0111                	.insn	2, 0x0111
 39d:	0612                	.insn	2, 0x0612
 39f:	1840                	.insn	2, 0x1840
 3a1:	03194297          	auipc	t0,0x3194
 3a5:	3a0e                	.insn	2, 0x3a0e
 3a7:	270b3b0b          	.insn	4, 0x270b3b0b
 3ab:	4919                	.insn	2, 0x4919
 3ad:	00193f13          	seqz	t5,s2
 3b1:	2500                	.insn	2, 0x2500
 3b3:	000a                	.insn	2, 0x000a
 3b5:	0b3a0e03          	lb	t3,179(s4)
 3b9:	0111053b          	.insn	4, 0x0111053b
 3bd:	0000                	.insn	2, 0x0000
 3bf:	0b26                	.insn	2, 0x0b26
 3c1:	5501                	.insn	2, 0x5501
 3c3:	27000017          	auipc	zero,0x27000
 3c7:	0034                	.insn	2, 0x0034
 3c9:	1802                	.insn	2, 0x1802
 3cb:	0b3a0e03          	lb	t3,179(s4)
 3cf:	1349053b          	.insn	4, 0x1349053b
 3d3:	0000                	.insn	2, 0x0000
 3d5:	3428                	.insn	2, 0x3428
 3d7:	0200                	.insn	2, 0x0200
 3d9:	3a0e0317          	auipc	t1,0x3a0e0
 3dd:	49053b0b          	.insn	4, 0x49053b0b
 3e1:	29000013          	li	zero,656
 3e5:	011d                	.insn	2, 0x011d
 3e7:	1331                	.insn	2, 0x1331
 3e9:	0111                	.insn	2, 0x0111
 3eb:	0612                	.insn	2, 0x0612
 3ed:	0b58                	.insn	2, 0x0b58
 3ef:	0559                	.insn	2, 0x0559
 3f1:	00000b57          	.insn	4, 0x0b57
 3f5:	1d2a                	.insn	2, 0x1d2a
 3f7:	3100                	.insn	2, 0x3100
 3f9:	12011113          	.insn	4, 0x12011113
 3fd:	5806                	.insn	2, 0x5806
 3ff:	5705590b          	.insn	4, 0x5705590b
 403:	2b00000b          	.insn	4, 0x2b00000b
 407:	001d                	.insn	2, 0x001d
 409:	1331                	.insn	2, 0x1331
 40b:	1755                	.insn	2, 0x1755
 40d:	0b58                	.insn	2, 0x0b58
 40f:	0559                	.insn	2, 0x0559
 411:	00000b57          	.insn	4, 0x0b57
 415:	182c                	.insn	2, 0x182c
 417:	0000                	.insn	2, 0x0000
 419:	2d00                	.insn	2, 0x2d00
 41b:	012e                	.insn	2, 0x012e
 41d:	0111                	.insn	2, 0x0111
 41f:	0612                	.insn	2, 0x0612
 421:	1840                	.insn	2, 0x1840
 423:	03194297          	auipc	t0,0x3194
 427:	3a0e                	.insn	2, 0x3a0e
 429:	27053b0b          	.insn	4, 0x27053b0b
 42d:	4919                	.insn	2, 0x4919
 42f:	00193f13          	seqz	t5,s2
 433:	2e00                	.insn	2, 0x2e00
 435:	0005                	.insn	2, 0x0005
 437:	1702                	.insn	2, 0x1702
 439:	0b3a0e03          	lb	t3,179(s4)
 43d:	1349053b          	.insn	4, 0x1349053b
 441:	0000                	.insn	2, 0x0000
 443:	0200052f          	.insn	4, 0x0200052f
 447:	0318                	.insn	2, 0x0318
 449:	3a0e                	.insn	2, 0x3a0e
 44b:	49053b0b          	.insn	4, 0x49053b0b
 44f:	30000013          	li	zero,768
 453:	0034                	.insn	2, 0x0034
 455:	0f1c                	.insn	2, 0x0f1c
 457:	0b3a0e03          	lb	t3,179(s4)
 45b:	1349053b          	.insn	4, 0x1349053b
 45f:	0000                	.insn	2, 0x0000
 461:	2e31                	.insn	2, 0x2e31
 463:	1100                	.insn	2, 0x1100
 465:	1201                	.insn	2, 0x1201
 467:	4006                	.insn	2, 0x4006
 469:	9718                	.insn	2, 0x9718
 46b:	1942                	.insn	2, 0x1942
 46d:	0b3a0e03          	lb	t3,179(s4)
 471:	1927053b          	.insn	4, 0x1927053b
 475:	0000193f 49002632 	.insn	8, 0x490026320000193f
 47d:	33000013          	li	zero,816
 481:	0016                	.insn	2, 0x0016
 483:	1349                	.insn	2, 0x1349
 485:	00000e03          	lb	t3,0(zero) # 0 <$d.3>
 489:	0f34                	.insn	2, 0x0f34
 48b:	0000                	.insn	2, 0x0000
	...

0000048f <$d.4>:
 48f:	1101                	.insn	2, 0x1101
 491:	2501                	.insn	2, 0x2501
 493:	130e                	.insn	2, 0x130e
 495:	0305                	.insn	2, 0x0305
 497:	100e                	.insn	2, 0x100e
 499:	110e1b17          	auipc	s6,0x110e1
 49d:	1201                	.insn	2, 0x1201
 49f:	0006                	.insn	2, 0x0006
 4a1:	0200                	.insn	2, 0x0200
 4a3:	0034                	.insn	2, 0x0034
 4a5:	1349                	.insn	2, 0x1349
 4a7:	0b3a                	.insn	2, 0x0b3a
 4a9:	18020b3b          	.insn	4, 0x18020b3b
 4ad:	0000                	.insn	2, 0x0000
 4af:	49010103          	lb	sp,1168(sp) # 1337d1 <$d.5+0x1324f7>
 4b3:	04000013          	li	zero,64
 4b7:	0021                	.insn	2, 0x0021
 4b9:	1349                	.insn	2, 0x1349
 4bb:	00000b37          	lui	s6,0x0
 4bf:	2405                	.insn	2, 0x2405
 4c1:	0300                	.insn	2, 0x0300
 4c3:	3e0e                	.insn	2, 0x3e0e
 4c5:	000b0b0b          	.insn	4, 0x000b0b0b
 4c9:	0600                	.insn	2, 0x0600
 4cb:	0024                	.insn	2, 0x0024
 4cd:	0b0b0e03          	lb	t3,176(s6) # b0 <$d.10+0x3c>
 4d1:	0b3e                	.insn	2, 0x0b3e
 4d3:	0000                	.insn	2, 0x0000
 4d5:	03003407          	.insn	4, 0x03003407
 4d9:	490e                	.insn	2, 0x490e
 4db:	3b0b3a13          	sltiu	s4,s6,944
 4df:	0018020b          	.insn	4, 0x0018020b
 4e3:	0800                	.insn	2, 0x0800
 4e5:	0021                	.insn	2, 0x0021
 4e7:	1349                	.insn	2, 0x1349
 4e9:	00000537          	lui	a0,0x0
 4ed:	1609                	.insn	2, 0x1609
 4ef:	4900                	.insn	2, 0x4900
 4f1:	3a0e0313          	addi	t1,t3,928
 4f5:	000b3b0b          	.insn	4, 0x000b3b0b
 4f9:	0a00                	.insn	2, 0x0a00
 4fb:	0034                	.insn	2, 0x0034
 4fd:	13490e03          	lb	t3,308(s2)
 501:	0b3a193f 18020b3b 	.insn	8, 0x18020b3b0b3a193f
 509:	0000                	.insn	2, 0x0000
 50b:	0b01130b          	.insn	4, 0x0b01130b
 50f:	3b0b3a0b          	.insn	4, 0x3b0b3a0b
 513:	0c00000b          	.insn	4, 0x0c00000b
 517:	000d                	.insn	2, 0x000d
 519:	13490e03          	lb	t3,308(s2)
 51d:	0b3a                	.insn	2, 0x0b3a
 51f:	0b380b3b          	.insn	4, 0x0b380b3b
 523:	0000                	.insn	2, 0x0000
 525:	2e0d                	.insn	2, 0x2e0d
 527:	0301                	.insn	2, 0x0301
 529:	3a0e                	.insn	2, 0x3a0e
 52b:	270b3b0b          	.insn	4, 0x270b3b0b
 52f:	4919                	.insn	2, 0x4919
 531:	20193f13          	sltiu	t5,s2,513
 535:	0e00000b          	.insn	4, 0x0e00000b
 539:	0005                	.insn	2, 0x0005
 53b:	0b3a0e03          	lb	t3,179(s4)
 53f:	13490b3b          	.insn	4, 0x13490b3b
 543:	0000                	.insn	2, 0x0000
 545:	11012e0f          	.insn	4, 0x11012e0f
 549:	1201                	.insn	2, 0x1201
 54b:	4006                	.insn	2, 0x4006
 54d:	9718                	.insn	2, 0x9718
 54f:	1942                	.insn	2, 0x1942
 551:	0b3a0e03          	lb	t3,179(s4)
 555:	19270b3b          	.insn	4, 0x19270b3b
 559:	1349                	.insn	2, 0x1349
 55b:	0000193f 02000510 	.insn	8, 0x020005100000193f
 563:	3a0e0317          	auipc	t1,0x3a0e0
 567:	490b3b0b          	.insn	4, 0x490b3b0b
 56b:	11000013          	li	zero,272
 56f:	0034                	.insn	2, 0x0034
 571:	1802                	.insn	2, 0x1802
 573:	0b3a0e03          	lb	t3,179(s4)
 577:	13490b3b          	.insn	4, 0x13490b3b
 57b:	0000                	.insn	2, 0x0000
 57d:	3412                	.insn	2, 0x3412
 57f:	0200                	.insn	2, 0x0200
 581:	3a0e0317          	auipc	t1,0x3a0e0
 585:	490b3b0b          	.insn	4, 0x490b3b0b
 589:	13000013          	li	zero,304
 58d:	011d                	.insn	2, 0x011d
 58f:	1331                	.insn	2, 0x1331
 591:	0111                	.insn	2, 0x0111
 593:	0612                	.insn	2, 0x0612
 595:	0b58                	.insn	2, 0x0b58
 597:	0b59                	.insn	2, 0x0b59
 599:	00000b57          	.insn	4, 0x0b57
 59d:	0514                	.insn	2, 0x0514
 59f:	0200                	.insn	2, 0x0200
 5a1:	00133117          	auipc	sp,0x133
 5a5:	1500                	.insn	2, 0x1500
 5a7:	0111010b          	.insn	4, 0x0111010b
 5ab:	0612                	.insn	2, 0x0612
 5ad:	0000                	.insn	2, 0x0000
 5af:	8916                	.insn	2, 0x8916
 5b1:	0182                	.insn	2, 0x0182
 5b3:	3100                	.insn	2, 0x3100
 5b5:	00011113          	slli	sp,sp,0x0
 5b9:	1700                	.insn	2, 0x1700
 5bb:	0034                	.insn	2, 0x0034
 5bd:	0b3a0e03          	lb	t3,179(s4)
 5c1:	13490b3b          	.insn	4, 0x13490b3b
 5c5:	0000                	.insn	2, 0x0000
 5c7:	0b18                	.insn	2, 0x0b18
 5c9:	5501                	.insn	2, 0x5501
 5cb:	19000017          	auipc	zero,0x19000
 5cf:	012e                	.insn	2, 0x012e
 5d1:	0b3a0e03          	lb	t3,179(s4)
 5d5:	19270b3b          	.insn	4, 0x19270b3b
 5d9:	193c                	.insn	2, 0x193c
 5db:	0000193f 4900051a 	.insn	8, 0x4900051a0000193f
 5e3:	1b000013          	li	zero,432
 5e7:	0018                	.insn	2, 0x0018
 5e9:	0000                	.insn	2, 0x0000
 5eb:	0f1c                	.insn	2, 0x0f1c
 5ed:	4900                	.insn	2, 0x4900
 5ef:	1d000013          	li	zero,464
 5f3:	0026                	.insn	2, 0x0026
 5f5:	1349                	.insn	2, 0x1349
 5f7:	0000                	.insn	2, 0x0000
 5f9:	2e1e                	.insn	2, 0x2e1e
 5fb:	0301                	.insn	2, 0x0301
 5fd:	3a0e                	.insn	2, 0x3a0e
 5ff:	270b3b0b          	.insn	4, 0x270b3b0b
 603:	4919                	.insn	2, 0x4919
 605:	3f193c13          	sltiu	s8,s2,1009
 609:	0019                	.insn	2, 0x0019
 60b:	1f00                	.insn	2, 0x1f00
 60d:	0000000f          	fence	unknown,unknown
 611:	2e20                	.insn	2, 0x2e20
 613:	1101                	.insn	2, 0x1101
 615:	1201                	.insn	2, 0x1201
 617:	4006                	.insn	2, 0x4006
 619:	9718                	.insn	2, 0x9718
 61b:	1942                	.insn	2, 0x1942
 61d:	1331                	.insn	2, 0x1331
 61f:	0000                	.insn	2, 0x0000
 621:	2e21                	.insn	2, 0x2e21
 623:	1101                	.insn	2, 0x1101
 625:	1201                	.insn	2, 0x1201
 627:	4006                	.insn	2, 0x4006
 629:	9718                	.insn	2, 0x9718
 62b:	1942                	.insn	2, 0x1942
 62d:	0b3a0e03          	lb	t3,179(s4)
 631:	19270b3b          	.insn	4, 0x19270b3b
 635:	000000193f 	.5byte	0x000000193f

セクション .debug_info の逆アセンブル:

00000000 <$d.4>:
       0:	0879                	.insn	2, 0x0879
       2:	0000                	.insn	2, 0x0000
       4:	0004                	.insn	2, 0x0004
       6:	0000                	.insn	2, 0x0000
       8:	0000                	.insn	2, 0x0000
       a:	0104                	.insn	2, 0x0104
       c:	0126                	.insn	2, 0x0126
       e:	0000                	.insn	2, 0x0000
      10:	001d                	.insn	2, 0x001d
      12:	01b5                	.insn	2, 0x01b5
      14:	0000                	.insn	2, 0x0000
      16:	0000                	.insn	2, 0x0000
      18:	0000                	.insn	2, 0x0000
      1a:	01fd                	.insn	2, 0x01fd
      1c:	0000                	.insn	2, 0x0000
      1e:	001c                	.insn	2, 0x001c
      20:	0040                	.insn	2, 0x0040
      22:	09d0                	.insn	2, 0x09d0
      24:	0000                	.insn	2, 0x0000
      26:	3302                	.insn	2, 0x3302
      28:	0000                	.insn	2, 0x0000
      2a:	0100                	.insn	2, 0x0100
      2c:	8f03050f          	.insn	4, 0x8f03050f
      30:	401c                	.insn	2, 0x401c
      32:	0300                	.insn	2, 0x0300
      34:	0000003f 00004604 	.insn	8, 0x46040000003f
      3c:	0e00                	.insn	2, 0x0e00
      3e:	0500                	.insn	2, 0x0500
      40:	01e8                	.insn	2, 0x01e8
      42:	0000                	.insn	2, 0x0000
      44:	0108                	.insn	2, 0x0108
      46:	ae06                	.insn	2, 0xae06
      48:	0002                	.insn	2, 0x0002
      4a:	0800                	.insn	2, 0x0800
      4c:	005a0207          	.insn	4, 0x005a0207
      50:	0000                	.insn	2, 0x0000
      52:	7301                	.insn	2, 0x7301
      54:	0305                	.insn	2, 0x0305
      56:	1c10                	.insn	2, 0x1c10
      58:	0040                	.insn	2, 0x0040
      5a:	00003f03          	.insn	4, 0x3f03
      5e:	0400                	.insn	2, 0x0400
      60:	0046                	.insn	2, 0x0046
      62:	0000                	.insn	2, 0x0000
      64:	0006                	.insn	2, 0x0006
      66:	7302                	.insn	2, 0x7302
      68:	0000                	.insn	2, 0x0000
      6a:	0100                	.insn	2, 0x0100
      6c:	0574                	.insn	2, 0x0574
      6e:	401bad03          	lw	s10,1025(s7)
      72:	0300                	.insn	2, 0x0300
      74:	0000003f 00004604 	.insn	8, 0x46040000003f
      7c:	1900                	.insn	2, 0x1900
      7e:	0200                	.insn	2, 0x0200
      80:	008c                	.insn	2, 0x008c
      82:	0000                	.insn	2, 0x0000
      84:	7701                	.insn	2, 0x7701
      86:	0305                	.insn	2, 0x0305
      88:	1c9d                	.insn	2, 0x1c9d
      8a:	0040                	.insn	2, 0x0040
      8c:	00003f03          	.insn	4, 0x3f03
      90:	0400                	.insn	2, 0x0400
      92:	0046                	.insn	2, 0x0046
      94:	0000                	.insn	2, 0x0000
      96:	0005                	.insn	2, 0x0005
      98:	a502                	.insn	2, 0xa502
      9a:	0000                	.insn	2, 0x0000
      9c:	0100                	.insn	2, 0x0100
      9e:	0594                	.insn	2, 0x0594
      a0:	401bc603          	lbu	a2,1025(s7)
      a4:	0300                	.insn	2, 0x0300
      a6:	0000003f 00004604 	.insn	8, 0x46040000003f
      ae:	0700                	.insn	2, 0x0700
      b0:	0200                	.insn	2, 0x0200
      b2:	00be                	.insn	2, 0x00be
      b4:	0000                	.insn	2, 0x0000
      b6:	9901                	.insn	2, 0x9901
      b8:	0305                	.insn	2, 0x0305
      ba:	1cf6                	.insn	2, 0x1cf6
      bc:	0040                	.insn	2, 0x0040
      be:	00003f03          	.insn	4, 0x3f03
      c2:	0400                	.insn	2, 0x0400
      c4:	0046                	.insn	2, 0x0046
      c6:	0000                	.insn	2, 0x0000
      c8:	001a                	.insn	2, 0x001a
      ca:	d702                	.insn	2, 0xd702
      cc:	0000                	.insn	2, 0x0000
      ce:	0100                	.insn	2, 0x0100
      d0:	05a0                	.insn	2, 0x05a0
      d2:	401bfc03          	.insn	4, 0x401bfc03
      d6:	0300                	.insn	2, 0x0300
      d8:	0000003f 00004604 	.insn	8, 0x46040000003f
      e0:	0900                	.insn	2, 0x0900
      e2:	0200                	.insn	2, 0x0200
      e4:	00f0                	.insn	2, 0x00f0
      e6:	0000                	.insn	2, 0x0000
      e8:	a501                	.insn	2, 0xa501
      ea:	0305                	.insn	2, 0x0305
      ec:	1c16                	.insn	2, 0x1c16
      ee:	0040                	.insn	2, 0x0040
      f0:	00003f03          	.insn	4, 0x3f03
      f4:	0400                	.insn	2, 0x0400
      f6:	0046                	.insn	2, 0x0046
      f8:	0000                	.insn	2, 0x0000
      fa:	0011                	.insn	2, 0x0011
      fc:	d702                	.insn	2, 0xd702
      fe:	0000                	.insn	2, 0x0000
     100:	0100                	.insn	2, 0x0100
     102:	05ad                	.insn	2, 0x05ad
     104:	401c7303          	.insn	4, 0x401c7303
     108:	0200                	.insn	2, 0x0200
     10a:	00000073          	ecall
     10e:	af01                	.insn	2, 0xaf01
     110:	0305                	.insn	2, 0x0305
     112:	1c55                	.insn	2, 0x1c55
     114:	0040                	.insn	2, 0x0040
     116:	2302                	.insn	2, 0x2302
     118:	0001                	.insn	2, 0x0001
     11a:	0100                	.insn	2, 0x0100
     11c:	a50305b7          	lui	a1,0xa5030
     120:	0300401b          	.insn	4, 0x0300401b
     124:	0000003f 00004604 	.insn	8, 0x46040000003f
     12c:	0800                	.insn	2, 0x0800
     12e:	0200                	.insn	2, 0x0200
     130:	00000073          	ecall
     134:	b901                	.insn	2, 0xb901
     136:	0305                	.insn	2, 0x0305
     138:	1cdd                	.insn	2, 0x1cdd
     13a:	0040                	.insn	2, 0x0040
     13c:	4902                	.insn	2, 0x4902
     13e:	0001                	.insn	2, 0x0001
     140:	0100                	.insn	2, 0x0100
     142:	05c1                	.insn	2, 0x05c1
     144:	401c0503          	lb	a0,1025(s8)
     148:	0300                	.insn	2, 0x0300
     14a:	0000003f 00004604 	.insn	8, 0x46040000003f
     152:	0b00                	.insn	2, 0x0b00
     154:	0200                	.insn	2, 0x0200
     156:	0162                	.insn	2, 0x0162
     158:	0000                	.insn	2, 0x0000
     15a:	c401                	.insn	2, 0xc401
     15c:	0305                	.insn	2, 0x0305
     15e:	1c32                	.insn	2, 0x1c32
     160:	0040                	.insn	2, 0x0040
     162:	00003f03          	.insn	4, 0x3f03
     166:	0400                	.insn	2, 0x0400
     168:	0046                	.insn	2, 0x0046
     16a:	0000                	.insn	2, 0x0000
     16c:	0014                	.insn	2, 0x0014
     16e:	7b02                	.insn	2, 0x7b02
     170:	0001                	.insn	2, 0x0001
     172:	0100                	.insn	2, 0x0100
     174:	05c8                	.insn	2, 0x05c8
     176:	401d2503          	lw	a0,1025(s10)
     17a:	0300                	.insn	2, 0x0300
     17c:	0000003f 00004604 	.insn	8, 0x46040000003f
     184:	0d00                	.insn	2, 0x0d00
     186:	0200                	.insn	2, 0x0200
     188:	00f0                	.insn	2, 0x00f0
     18a:	0000                	.insn	2, 0x0000
     18c:	c901                	.insn	2, 0xc901
     18e:	0305                	.insn	2, 0x0305
     190:	1c7c                	.insn	2, 0x1c7c
     192:	0040                	.insn	2, 0x0040
     194:	2302                	.insn	2, 0x2302
     196:	0001                	.insn	2, 0x0001
     198:	0100                	.insn	2, 0x0100
     19a:	05ca                	.insn	2, 0x05ca
     19c:	401ca203          	lw	tp,1025(s9)
     1a0:	0200                	.insn	2, 0x0200
     1a2:	00000033          	add	zero,zero,zero
     1a6:	cb01                	.insn	2, 0xcb01
     1a8:	0305                	.insn	2, 0x0305
     1aa:	1cbe                	.insn	2, 0x1cbe
     1ac:	0040                	.insn	2, 0x0040
     1ae:	bb02                	.insn	2, 0xbb02
     1b0:	0001                	.insn	2, 0x0001
     1b2:	0100                	.insn	2, 0x0100
     1b4:	05cc                	.insn	2, 0x05cc
     1b6:	401c4603          	lbu	a2,1025(s8)
     1ba:	0300                	.insn	2, 0x0300
     1bc:	0000003f 00004604 	.insn	8, 0x46040000003f
     1c4:	0f00                	.insn	2, 0x0f00
     1c6:	0200                	.insn	2, 0x0200
     1c8:	000000d7          	.insn	4, 0x00d7
     1cc:	cf01                	.insn	2, 0xcf01
     1ce:	0305                	.insn	2, 0x0305
     1d0:	1b89                	.insn	2, 0x1b89
     1d2:	0040                	.insn	2, 0x0040
     1d4:	e102                	.insn	2, 0xe102
     1d6:	0001                	.insn	2, 0x0001
     1d8:	0100                	.insn	2, 0x0100
     1da:	05d4                	.insn	2, 0x05d4
     1dc:	401b9203          	lh	tp,1025(s7)
     1e0:	0300                	.insn	2, 0x0300
     1e2:	0000003f 00004604 	.insn	8, 0x46040000003f
     1ea:	0a00                	.insn	2, 0x0a00
     1ec:	0200                	.insn	2, 0x0200
     1ee:	00000073          	ecall
     1f2:	d701                	.insn	2, 0xd701
     1f4:	0305                	.insn	2, 0x0305
     1f6:	1b70                	.insn	2, 0x1b70
     1f8:	0040                	.insn	2, 0x0040
     1fa:	8c02                	.insn	2, 0x8c02
     1fc:	0000                	.insn	2, 0x0000
     1fe:	0100                	.insn	2, 0x0100
     200:	05de                	.insn	2, 0x05de
     202:	401c6e03          	.insn	4, 0x401c6e03
     206:	0200                	.insn	2, 0x0200
     208:	0149                	.insn	2, 0x0149
     20a:	0000                	.insn	2, 0x0000
     20c:	df01                	.insn	2, 0xdf01
     20e:	0305                	.insn	2, 0x0305
     210:	00401c27          	.insn	4, 0x00401c27
     214:	8c02                	.insn	2, 0x8c02
     216:	0000                	.insn	2, 0x0000
     218:	0100                	.insn	2, 0x0100
     21a:	05e9                	.insn	2, 0x05e9
     21c:	401d3203          	.insn	4, 0x401d3203
     220:	0200                	.insn	2, 0x0200
     222:	008c                	.insn	2, 0x008c
     224:	0000                	.insn	2, 0x0000
     226:	ea01                	.insn	2, 0xea01
     228:	0305                	.insn	2, 0x0305
     22a:	1d10                	.insn	2, 0x1d10
     22c:	0040                	.insn	2, 0x0040
     22e:	3b02                	.insn	2, 0x3b02
     230:	0002                	.insn	2, 0x0002
     232:	0100                	.insn	2, 0x0100
     234:	8d0305eb          	.insn	4, 0x8d0305eb
     238:	401c                	.insn	2, 0x401c
     23a:	0300                	.insn	2, 0x0300
     23c:	0000003f 00004604 	.insn	8, 0x46040000003f
     244:	0200                	.insn	2, 0x0200
     246:	0200                	.insn	2, 0x0200
     248:	0254                	.insn	2, 0x0254
     24a:	0000                	.insn	2, 0x0000
     24c:	ef01                	.insn	2, 0xef01
     24e:	0305                	.insn	2, 0x0305
     250:	1bcd                	.insn	2, 0x1bcd
     252:	0040                	.insn	2, 0x0040
     254:	00003f03          	.insn	4, 0x3f03
     258:	0400                	.insn	2, 0x0400
     25a:	0046                	.insn	2, 0x0046
     25c:	0000                	.insn	2, 0x0000
     25e:	0015                	.insn	2, 0x0015
     260:	6d02                	.insn	2, 0x6d02
     262:	0002                	.insn	2, 0x0002
     264:	0100                	.insn	2, 0x0100
     266:	05fa                	.insn	2, 0x05fa
     268:	401caa03          	lw	s4,1025(s9)
     26c:	0300                	.insn	2, 0x0300
     26e:	0000003f 00004604 	.insn	8, 0x46040000003f
     276:	0400                	.insn	2, 0x0400
     278:	0700                	.insn	2, 0x0700
     27a:	00be                	.insn	2, 0x00be
     27c:	0000                	.insn	2, 0x0000
     27e:	0301                	.insn	2, 0x0301
     280:	0501                	.insn	2, 0x0501
     282:	401be203          	.insn	4, 0x401be203
     286:	0500                	.insn	2, 0x0500
     288:	01ed                	.insn	2, 0x01ed
     28a:	0000                	.insn	2, 0x0000
     28c:	0405                	.insn	2, 0x0405
     28e:	9908                	.insn	2, 0x9908
     290:	0002                	.insn	2, 0x0002
     292:	9300                	.insn	2, 0x9300
     294:	0001                	.insn	2, 0x0001
     296:	0200                	.insn	2, 0x0200
     298:	0511                	.insn	2, 0x0511
     29a:	0284                	.insn	2, 0x0284
     29c:	0000                	.insn	2, 0x0000
     29e:	c2090407          	.insn	4, 0xc2090407
     2a2:	0002                	.insn	2, 0x0002
     2a4:	0100                	.insn	2, 0x0100
     2a6:	02870107          	.insn	4, 0x02870107
     2aa:	0000                	.insn	2, 0x0000
     2ac:	0a01                	.insn	2, 0x0a01
     2ae:	00000107          	.insn	4, 0x0107
     2b2:	0701                	.insn	2, 0x0701
     2b4:	ec01                	.insn	2, 0xec01
     2b6:	0002                	.insn	2, 0x0002
     2b8:	0a00                	.insn	2, 0x0a00
     2ba:	00000077          	.insn	4, 0x0077
     2be:	0701                	.insn	2, 0x0701
     2c0:	f601                	.insn	2, 0xf601
     2c2:	0002                	.insn	2, 0x0002
     2c4:	0b00                	.insn	2, 0x0b00
     2c6:	00c1                	.insn	2, 0x00c1
     2c8:	0000                	.insn	2, 0x0000
     2ca:	0801                	.insn	2, 0x0801
     2cc:	fb01                	.insn	2, 0xfb01
     2ce:	0002                	.insn	2, 0x0002
     2d0:	0c00                	.insn	2, 0x0c00
     2d2:	0000f20b          	.insn	4, 0xf20b
     2d6:	0100                	.insn	2, 0x0100
     2d8:	0112                	.insn	2, 0x0112
     2da:	0000003f 0002f30b 	.insn	8, 0x0002f30b0000003f
     2e2:	0100                	.insn	2, 0x0100
     2e4:	028e0113          	addi	sp,t3,40
     2e8:	0000                	.insn	2, 0x0000
     2ea:	0000                	.insn	2, 0x0000
     2ec:	f10d                	.insn	2, 0xf10d
     2ee:	0002                	.insn	2, 0x0002
     2f0:	0e00                	.insn	2, 0x0e00
     2f2:	0000003f 0002fb0d 	.insn	8, 0x0002fb0d0000003f
     2fa:	0800                	.insn	2, 0x0800
     2fc:	028e                	.insn	2, 0x028e
     2fe:	0000                	.insn	2, 0x0000
     300:	0000007b          	.insn	4, 0x007b
     304:	1402                	.insn	2, 0x1402
     306:	40001c0f          	.insn	4, 0x40001c0f
     30a:	4800                	.insn	2, 0x4800
     30c:	0008                	.insn	2, 0x0008
     30e:	0100                	.insn	2, 0x0100
     310:	cb52                	.insn	2, 0xcb52
     312:	0001                	.insn	2, 0x0001
     314:	0100                	.insn	2, 0x0100
     316:	1005                	.insn	2, 0x1005
     318:	01e4                	.insn	2, 0x01e4
     31a:	0040                	.insn	2, 0x0040
     31c:	0680                	.insn	2, 0x0680
     31e:	0000                	.insn	2, 0x0000
     320:	0311                	.insn	2, 0x0311
     322:	9c91                	.insn	2, 0x9c91
     324:	f401                	.insn	2, 0xf401
     326:	0000                	.insn	2, 0x0000
     328:	0100                	.insn	2, 0x0100
     32a:	5f26                	.insn	2, 0x5f26
     32c:	0008                	.insn	2, 0x0008
     32e:	1100                	.insn	2, 0x1100
     330:	00fc9103          	lh	sp,15(s9)
     334:	01f1                	.insn	2, 0x01f1
     336:	0000                	.insn	2, 0x0000
     338:	5f01                	.insn	2, 0x5f01
     33a:	0000086b          	.insn	4, 0x086b
     33e:	0012                	.insn	2, 0x0012
     340:	0000                	.insn	2, 0x0000
     342:	9100                	.insn	2, 0x9100
     344:	0002                	.insn	2, 0x0002
     346:	0100                	.insn	2, 0x0100
     348:	8760                	.insn	2, 0x8760
     34a:	0002                	.insn	2, 0x0002
     34c:	1200                	.insn	2, 0x1200
     34e:	0041                	.insn	2, 0x0041
     350:	0000                	.insn	2, 0x0000
     352:	0000002b          	.insn	4, 0x002b
     356:	2701                	.insn	2, 0x2701
     358:	00000287          	.insn	4, 0x0287
     35c:	8a12                	.insn	2, 0x8a12
     35e:	0000                	.insn	2, 0x0000
     360:	4400                	.insn	2, 0x4400
     362:	0000                	.insn	2, 0x0000
     364:	0100                	.insn	2, 0x0100
     366:	00087763          	bgeu	a6,zero,374 <$d.6+0x11c>
     36a:	1300                	.insn	2, 0x1300
     36c:	006e                	.insn	2, 0x006e
     36e:	0000                	.insn	2, 0x0000
     370:	1501                	.insn	2, 0x1501
     372:	01f0                	.insn	2, 0x01f0
     374:	0040                	.insn	2, 0x0040
     376:	0810                	.insn	2, 0x0810
     378:	4006                	.insn	2, 0x4006
     37a:	2000                	.insn	2, 0x2000
     37c:	0000                	.insn	2, 0x0000
     37e:	1200                	.insn	2, 0x1200
     380:	028e                	.insn	2, 0x028e
     382:	0000                	.insn	2, 0x0000
     384:	0338                	.insn	2, 0x0338
     386:	0000                	.insn	2, 0x0000
     388:	bd01                	.insn	2, 0xbd01
     38a:	0299                	.insn	2, 0x0299
     38c:	0000                	.insn	2, 0x0000
     38e:	1000                	.insn	2, 0x1000
     390:	05c8                	.insn	2, 0x05c8
     392:	0040                	.insn	2, 0x0040
     394:	0020                	.insn	2, 0x0020
     396:	0000                	.insn	2, 0x0000
     398:	7b12                	.insn	2, 0x7b12
     39a:	0002                	.insn	2, 0x0002
     39c:	3e00                	.insn	2, 0x3e00
     39e:	0000                	.insn	2, 0x0000
     3a0:	0100                	.insn	2, 0x0100
     3a2:	000299b3          	sll	s3,t0,zero
     3a6:	0000                	.insn	2, 0x0000
     3a8:	0014                	.insn	2, 0x0014
     3aa:	0000                	.insn	2, 0x0000
     3ac:	1200                	.insn	2, 0x1200
     3ae:	0246                	.insn	2, 0x0246
     3b0:	0000                	.insn	2, 0x0000
     3b2:	0000004b          	.insn	4, 0x004b
     3b6:	a101                	.insn	2, 0xa101
     3b8:	028e                	.insn	2, 0x028e
     3ba:	0000                	.insn	2, 0x0000
     3bc:	1400                	.insn	2, 0x1400
     3be:	0018                	.insn	2, 0x0018
     3c0:	0000                	.insn	2, 0x0000
     3c2:	0f12                	.insn	2, 0x0f12
     3c4:	0002                	.insn	2, 0x0002
     3c6:	4d00                	.insn	2, 0x4d00
     3c8:	0001                	.insn	2, 0x0001
     3ca:	0100                	.insn	2, 0x0100
     3cc:	9995                	.insn	2, 0x9995
     3ce:	0002                	.insn	2, 0x0002
     3d0:	0000                	.insn	2, 0x0000
     3d2:	3014                	.insn	2, 0x3014
     3d4:	0000                	.insn	2, 0x0000
     3d6:	1200                	.insn	2, 0x1200
     3d8:	000000c3          	.insn	4, 0x00c3
     3dc:	0046                	.insn	2, 0x0046
     3de:	0000                	.insn	2, 0x0000
     3e0:	7901                	.insn	2, 0x7901
     3e2:	028e                	.insn	2, 0x028e
     3e4:	0000                	.insn	2, 0x0000
     3e6:	1112                	.insn	2, 0x1112
     3e8:	0001                	.insn	2, 0x0001
     3ea:	2b00                	.insn	2, 0x2b00
     3ec:	0000                	.insn	2, 0x0000
     3ee:	0100                	.insn	2, 0x0100
     3f0:	8e7a                	.insn	2, 0x8e7a
     3f2:	0002                	.insn	2, 0x0002
     3f4:	1500                	.insn	2, 0x1500
     3f6:	0260                	.insn	2, 0x0260
     3f8:	0000                	.insn	2, 0x0000
     3fa:	7b01                	.insn	2, 0x7b01
     3fc:	000002fb          	.insn	4, 0x02fb
     400:	a016                	.insn	2, 0xa016
     402:	0002                	.insn	2, 0x0002
     404:	5800                	.insn	2, 0x5800
     406:	0000                	.insn	2, 0x0000
     408:	0100                	.insn	2, 0x0100
     40a:	157e                	.insn	2, 0x157e
     40c:	0001a917          	auipc	s2,0x1a
     410:	ad00                	.insn	2, 0xad00
     412:	0002                	.insn	2, 0x0002
     414:	1800                	.insn	2, 0x1800
     416:	00000167          	jalr	sp,zero # 0 <$d.4>
     41a:	02c5                	.insn	2, 0x02c5
     41c:	0000                	.insn	2, 0x0000
     41e:	7814                	.insn	2, 0x7814
     420:	0000                	.insn	2, 0x0000
     422:	1800                	.insn	2, 0x1800
     424:	02a1                	.insn	2, 0x02a1
     426:	0000                	.insn	2, 0x0000
     428:	02d2                	.insn	2, 0x02d2
     42a:	0000                	.insn	2, 0x0000
     42c:	bf18                	.insn	2, 0xbf18
     42e:	0002                	.insn	2, 0x0002
     430:	de00                	.insn	2, 0xde00
     432:	0002                	.insn	2, 0x0002
     434:	0000                	.insn	2, 0x0000
     436:	1600                	.insn	2, 0x1600
     438:	02a0                	.insn	2, 0x02a0
     43a:	0000                	.insn	2, 0x0000
     43c:	0098                	.insn	2, 0x0098
     43e:	0000                	.insn	2, 0x0000
     440:	8401                	.insn	2, 0x8401
     442:	1715                	.insn	2, 0x1715
     444:	0308                	.insn	2, 0x0308
     446:	0000                	.insn	2, 0x0000
     448:	02ad                	.insn	2, 0x02ad
     44a:	0000                	.insn	2, 0x0000
     44c:	d218                	.insn	2, 0xd218
     44e:	0002                	.insn	2, 0x0002
     450:	c500                	.insn	2, 0xc500
     452:	0002                	.insn	2, 0x0002
     454:	1400                	.insn	2, 0x1400
     456:	00b0                	.insn	2, 0x00b0
     458:	0000                	.insn	2, 0x0000
     45a:	6e18                	.insn	2, 0x6e18
     45c:	d2000003          	lb	zero,-736(zero) # fffffd20 <USER_MAX+0xffaffd20>
     460:	0002                	.insn	2, 0x0002
     462:	1800                	.insn	2, 0x1800
     464:	038c                	.insn	2, 0x038c
     466:	0000                	.insn	2, 0x0000
     468:	02de                	.insn	2, 0x02de
     46a:	0000                	.insn	2, 0x0000
     46c:	0000                	.insn	2, 0x0000
     46e:	1000                	.insn	2, 0x1000
     470:	02c4                	.insn	2, 0x02c4
     472:	0040                	.insn	2, 0x0040
     474:	0094                	.insn	2, 0x0094
     476:	0000                	.insn	2, 0x0000
     478:	6112                	.insn	2, 0x6112
     47a:	0000                	.insn	2, 0x0000
     47c:	8600                	.insn	2, 0x8600
     47e:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     482:	0002872f          	.insn	4, 0x0002872f
     486:	0000                	.insn	2, 0x0000
     488:	1900                	.insn	2, 0x1900
     48a:	06dc                	.insn	2, 0x06dc
     48c:	0000                	.insn	2, 0x0000
     48e:	0064                	.insn	2, 0x0064
     490:	0040                	.insn	2, 0x0040
     492:	dc19                	.insn	2, 0xdc19
     494:	0006                	.insn	2, 0x0006
     496:	ec00                	.insn	2, 0xec00
     498:	4001                	.insn	2, 0x4001
     49a:	1900                	.insn	2, 0x1900
     49c:	06ea                	.insn	2, 0x06ea
     49e:	0000                	.insn	2, 0x0000
     4a0:	01fc                	.insn	2, 0x01fc
     4a2:	0040                	.insn	2, 0x0040
     4a4:	ea19                	.insn	2, 0xea19
     4a6:	0006                	.insn	2, 0x0006
     4a8:	0800                	.insn	2, 0x0800
     4aa:	4002                	.insn	2, 0x4002
     4ac:	1900                	.insn	2, 0x1900
     4ae:	06ea                	.insn	2, 0x06ea
     4b0:	0000                	.insn	2, 0x0000
     4b2:	0214                	.insn	2, 0x0214
     4b4:	0040                	.insn	2, 0x0040
     4b6:	ea19                	.insn	2, 0xea19
     4b8:	0006                	.insn	2, 0x0006
     4ba:	2000                	.insn	2, 0x2000
     4bc:	4002                	.insn	2, 0x4002
     4be:	1900                	.insn	2, 0x1900
     4c0:	06ea                	.insn	2, 0x06ea
     4c2:	0000                	.insn	2, 0x0000
     4c4:	022c                	.insn	2, 0x022c
     4c6:	0040                	.insn	2, 0x0040
     4c8:	ea19                	.insn	2, 0xea19
     4ca:	0006                	.insn	2, 0x0006
     4cc:	3800                	.insn	2, 0x3800
     4ce:	4002                	.insn	2, 0x4002
     4d0:	1900                	.insn	2, 0x1900
     4d2:	06ea                	.insn	2, 0x06ea
     4d4:	0000                	.insn	2, 0x0000
     4d6:	0244                	.insn	2, 0x0244
     4d8:	0040                	.insn	2, 0x0040
     4da:	ea19                	.insn	2, 0xea19
     4dc:	0006                	.insn	2, 0x0006
     4de:	5000                	.insn	2, 0x5000
     4e0:	4002                	.insn	2, 0x4002
     4e2:	1900                	.insn	2, 0x1900
     4e4:	06ea                	.insn	2, 0x06ea
     4e6:	0000                	.insn	2, 0x0000
     4e8:	025c                	.insn	2, 0x025c
     4ea:	0040                	.insn	2, 0x0040
     4ec:	ea19                	.insn	2, 0xea19
     4ee:	0006                	.insn	2, 0x0006
     4f0:	6800                	.insn	2, 0x6800
     4f2:	4002                	.insn	2, 0x4002
     4f4:	1900                	.insn	2, 0x1900
     4f6:	06ea                	.insn	2, 0x06ea
     4f8:	0000                	.insn	2, 0x0000
     4fa:	0274                	.insn	2, 0x0274
     4fc:	0040                	.insn	2, 0x0040
     4fe:	ea19                	.insn	2, 0xea19
     500:	0006                	.insn	2, 0x0006
     502:	8000                	.insn	2, 0x8000
     504:	4002                	.insn	2, 0x4002
     506:	1900                	.insn	2, 0x1900
     508:	06ea                	.insn	2, 0x06ea
     50a:	0000                	.insn	2, 0x0000
     50c:	028c                	.insn	2, 0x028c
     50e:	0040                	.insn	2, 0x0040
     510:	ea19                	.insn	2, 0xea19
     512:	0006                	.insn	2, 0x0006
     514:	9800                	.insn	2, 0x9800
     516:	4002                	.insn	2, 0x4002
     518:	1900                	.insn	2, 0x1900
     51a:	06ea                	.insn	2, 0x06ea
     51c:	0000                	.insn	2, 0x0000
     51e:	02a4                	.insn	2, 0x02a4
     520:	0040                	.insn	2, 0x0040
     522:	ea19                	.insn	2, 0xea19
     524:	0006                	.insn	2, 0x0006
     526:	b000                	.insn	2, 0xb000
     528:	4002                	.insn	2, 0x4002
     52a:	1900                	.insn	2, 0x1900
     52c:	06ea                	.insn	2, 0x06ea
     52e:	0000                	.insn	2, 0x0000
     530:	02bc                	.insn	2, 0x02bc
     532:	0040                	.insn	2, 0x0040
     534:	f719                	.insn	2, 0xf719
     536:	0006                	.insn	2, 0x0006
     538:	d400                	.insn	2, 0xd400
     53a:	4002                	.insn	2, 0x4002
     53c:	1900                	.insn	2, 0x1900
     53e:	06ea                	.insn	2, 0x06ea
     540:	0000                	.insn	2, 0x0000
     542:	0320                	.insn	2, 0x0320
     544:	0040                	.insn	2, 0x0040
     546:	ea19                	.insn	2, 0xea19
     548:	0006                	.insn	2, 0x0006
     54a:	2c00                	.insn	2, 0x2c00
     54c:	19004003          	lbu	zero,400(zero) # 190 <$d.6+0x6a>
     550:	06ea                	.insn	2, 0x06ea
     552:	0000                	.insn	2, 0x0000
     554:	033c                	.insn	2, 0x033c
     556:	0040                	.insn	2, 0x0040
     558:	ea19                	.insn	2, 0xea19
     55a:	0006                	.insn	2, 0x0006
     55c:	4c00                	.insn	2, 0x4c00
     55e:	19004003          	lbu	zero,400(zero) # 190 <$d.6+0x6a>
     562:	0702                	.insn	2, 0x0702
     564:	0000                	.insn	2, 0x0000
     566:	03f0                	.insn	2, 0x03f0
     568:	0040                	.insn	2, 0x0040
     56a:	0219                	.insn	2, 0x0219
     56c:	04000007          	.insn	4, 0x04000007
     570:	4004                	.insn	2, 0x4004
     572:	1900                	.insn	2, 0x1900
     574:	0702                	.insn	2, 0x0702
     576:	0000                	.insn	2, 0x0000
     578:	0418                	.insn	2, 0x0418
     57a:	0040                	.insn	2, 0x0040
     57c:	0219                	.insn	2, 0x0219
     57e:	2c000007          	.insn	4, 0x2c000007
     582:	4004                	.insn	2, 0x4004
     584:	1900                	.insn	2, 0x1900
     586:	0702                	.insn	2, 0x0702
     588:	0000                	.insn	2, 0x0000
     58a:	0440                	.insn	2, 0x0440
     58c:	0040                	.insn	2, 0x0040
     58e:	0219                	.insn	2, 0x0219
     590:	54000007          	.insn	4, 0x54000007
     594:	4004                	.insn	2, 0x4004
     596:	1900                	.insn	2, 0x1900
     598:	0702                	.insn	2, 0x0702
     59a:	0000                	.insn	2, 0x0000
     59c:	0468                	.insn	2, 0x0468
     59e:	0040                	.insn	2, 0x0040
     5a0:	0219                	.insn	2, 0x0219
     5a2:	7c000007          	.insn	4, 0x7c000007
     5a6:	4004                	.insn	2, 0x4004
     5a8:	1900                	.insn	2, 0x1900
     5aa:	0702                	.insn	2, 0x0702
     5ac:	0000                	.insn	2, 0x0000
     5ae:	0490                	.insn	2, 0x0490
     5b0:	0040                	.insn	2, 0x0040
     5b2:	0219                	.insn	2, 0x0219
     5b4:	a4000007          	.insn	4, 0xa4000007
     5b8:	4004                	.insn	2, 0x4004
     5ba:	1900                	.insn	2, 0x1900
     5bc:	0702                	.insn	2, 0x0702
     5be:	0000                	.insn	2, 0x0000
     5c0:	04b8                	.insn	2, 0x04b8
     5c2:	0040                	.insn	2, 0x0040
     5c4:	0219                	.insn	2, 0x0219
     5c6:	cc000007          	.insn	4, 0xcc000007
     5ca:	4004                	.insn	2, 0x4004
     5cc:	1900                	.insn	2, 0x1900
     5ce:	0702                	.insn	2, 0x0702
     5d0:	0000                	.insn	2, 0x0000
     5d2:	04e0                	.insn	2, 0x04e0
     5d4:	0040                	.insn	2, 0x0040
     5d6:	dc19                	.insn	2, 0xdc19
     5d8:	0006                	.insn	2, 0x0006
     5da:	f400                	.insn	2, 0xf400
     5dc:	4004                	.insn	2, 0x4004
     5de:	1900                	.insn	2, 0x1900
     5e0:	0718                	.insn	2, 0x0718
     5e2:	0000                	.insn	2, 0x0000
     5e4:	055c                	.insn	2, 0x055c
     5e6:	0040                	.insn	2, 0x0040
     5e8:	dc19                	.insn	2, 0xdc19
     5ea:	0006                	.insn	2, 0x0006
     5ec:	7400                	.insn	2, 0x7400
     5ee:	4005                	.insn	2, 0x4005
     5f0:	1900                	.insn	2, 0x1900
     5f2:	0718                	.insn	2, 0x0718
     5f4:	0000                	.insn	2, 0x0000
     5f6:	058c                	.insn	2, 0x058c
     5f8:	0040                	.insn	2, 0x0040
     5fa:	dc19                	.insn	2, 0xdc19
     5fc:	0006                	.insn	2, 0x0006
     5fe:	a000                	.insn	2, 0xa000
     600:	4005                	.insn	2, 0x4005
     602:	1900                	.insn	2, 0x1900
     604:	0729                	.insn	2, 0x0729
     606:	0000                	.insn	2, 0x0000
     608:	05b4                	.insn	2, 0x05b4
     60a:	0040                	.insn	2, 0x0040
     60c:	1819                	.insn	2, 0x1819
     60e:	d8000007          	.insn	4, 0xd8000007
     612:	4005                	.insn	2, 0x4005
     614:	1900                	.insn	2, 0x1900
     616:	0000073b          	.insn	4, 0x073b
     61a:	05e0                	.insn	2, 0x05e0
     61c:	0040                	.insn	2, 0x0040
     61e:	4819                	.insn	2, 0x4819
     620:	f8000007          	.insn	4, 0xf8000007
     624:	4005                	.insn	2, 0x4005
     626:	1900                	.insn	2, 0x1900
     628:	0748                	.insn	2, 0x0748
     62a:	0000                	.insn	2, 0x0000
     62c:	0604                	.insn	2, 0x0604
     62e:	0040                	.insn	2, 0x0040
     630:	1819                	.insn	2, 0x1819
     632:	18000007          	.insn	4, 0x18000007
     636:	4006                	.insn	2, 0x4006
     638:	1900                	.insn	2, 0x1900
     63a:	07be                	.insn	2, 0x07be
     63c:	0000                	.insn	2, 0x0000
     63e:	0620                	.insn	2, 0x0620
     640:	0040                	.insn	2, 0x0040
     642:	cb19                	.insn	2, 0xcb19
     644:	34000007          	.insn	4, 0x34000007
     648:	4006                	.insn	2, 0x4006
     64a:	1900                	.insn	2, 0x1900
     64c:	000007cb          	.insn	4, 0x07cb
     650:	0640                	.insn	2, 0x0640
     652:	0040                	.insn	2, 0x0040
     654:	d819                	.insn	2, 0xd819
     656:	04000007          	.insn	4, 0x04000007
     65a:	19004007          	.insn	4, 0x19004007
     65e:	06dc                	.insn	2, 0x06dc
     660:	0000                	.insn	2, 0x0000
     662:	0718                	.insn	2, 0x0718
     664:	0040                	.insn	2, 0x0040
     666:	dc19                	.insn	2, 0xdc19
     668:	0006                	.insn	2, 0x0006
     66a:	2800                	.insn	2, 0x2800
     66c:	19004007          	.insn	4, 0x19004007
     670:	000007e3          	beqz	zero,e7e <$d.3+0x116>
     674:	0738                	.insn	2, 0x0738
     676:	0040                	.insn	2, 0x0040
     678:	dc19                	.insn	2, 0xdc19
     67a:	0006                	.insn	2, 0x0006
     67c:	4c00                	.insn	2, 0x4c00
     67e:	19004007          	.insn	4, 0x19004007
     682:	0729                	.insn	2, 0x0729
     684:	0000                	.insn	2, 0x0000
     686:	07c0                	.insn	2, 0x07c0
     688:	0040                	.insn	2, 0x0040
     68a:	ea19                	.insn	2, 0xea19
     68c:	d8000007          	.insn	4, 0xd8000007
     690:	19004007          	.insn	4, 0x19004007
     694:	06dc                	.insn	2, 0x06dc
     696:	0000                	.insn	2, 0x0000
     698:	07f4                	.insn	2, 0x07f4
     69a:	0040                	.insn	2, 0x0040
     69c:	dc19                	.insn	2, 0xdc19
     69e:	0006                	.insn	2, 0x0006
     6a0:	0400                	.insn	2, 0x0400
     6a2:	4008                	.insn	2, 0x4008
     6a4:	1900                	.insn	2, 0x1900
     6a6:	06dc                	.insn	2, 0x06dc
     6a8:	0000                	.insn	2, 0x0000
     6aa:	0814                	.insn	2, 0x0814
     6ac:	0040                	.insn	2, 0x0040
     6ae:	dc19                	.insn	2, 0xdc19
     6b0:	0006                	.insn	2, 0x0006
     6b2:	2400                	.insn	2, 0x2400
     6b4:	4008                	.insn	2, 0x4008
     6b6:	1900                	.insn	2, 0x1900
     6b8:	06dc                	.insn	2, 0x06dc
     6ba:	0000                	.insn	2, 0x0000
     6bc:	0834                	.insn	2, 0x0834
     6be:	0040                	.insn	2, 0x0040
     6c0:	dc19                	.insn	2, 0xdc19
     6c2:	0006                	.insn	2, 0x0006
     6c4:	4400                	.insn	2, 0x4400
     6c6:	4008                	.insn	2, 0x4008
     6c8:	1900                	.insn	2, 0x1900
     6ca:	06dc                	.insn	2, 0x06dc
     6cc:	0000                	.insn	2, 0x0000
     6ce:	0858                	.insn	2, 0x0858
     6d0:	0040                	.insn	2, 0x0040
     6d2:	fb19                	.insn	2, 0xfb19
     6d4:	64000007          	.insn	4, 0x64000007
     6d8:	4008                	.insn	2, 0x4008
     6da:	0000                	.insn	2, 0x0000
     6dc:	311a                	.insn	2, 0x311a
     6de:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
     6e2:	1b3e                	.insn	2, 0x1b3e
     6e4:	02ec                	.insn	2, 0x02ec
     6e6:	0000                	.insn	2, 0x0000
     6e8:	001c                	.insn	2, 0x001c
     6ea:	6f1a                	.insn	2, 0x6f1a
     6ec:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
     6f0:	1b32                	.insn	2, 0x1b32
     6f2:	0000003f 02a61d00 	.insn	8, 0x02a61d000000003f
     6fa:	0000                	.insn	2, 0x0000
     6fc:	3302                	.insn	2, 0x3302
     6fe:	00000287          	.insn	4, 0x0287
     702:	cc1e                	.insn	2, 0xcc1e
     704:	0002                	.insn	2, 0x0002
     706:	0200                	.insn	2, 0x0200
     708:	0002873b          	.insn	4, 0x0002873b
     70c:	1b00                	.insn	2, 0x1b00
     70e:	02ec                	.insn	2, 0x02ec
     710:	0000                	.insn	2, 0x0000
     712:	0002ec1b          	.insn	4, 0x0002ec1b
     716:	0000                	.insn	2, 0x0000
     718:	771e                	.insn	2, 0x771e
     71a:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
     71e:	9931                	.insn	2, 0x9931
     720:	0002                	.insn	2, 0x0002
     722:	1b00                	.insn	2, 0x1b00
     724:	02ec                	.insn	2, 0x02ec
     726:	0000                	.insn	2, 0x0000
     728:	1a00                	.insn	2, 0x1a00
     72a:	0175                	.insn	2, 0x0175
     72c:	0000                	.insn	2, 0x0000
     72e:	2c02                	.insn	2, 0x2c02
     730:	00028e1b          	.insn	4, 0x00028e1b
     734:	1b00                	.insn	2, 0x1b00
     736:	028e                	.insn	2, 0x028e
     738:	0000                	.insn	2, 0x0000
     73a:	1a00                	.insn	2, 0x1a00
     73c:	024d                	.insn	2, 0x024d
     73e:	0000                	.insn	2, 0x0000
     740:	2902                	.insn	2, 0x2902
     742:	0002991b          	.insn	4, 0x0002991b
     746:	0000                	.insn	2, 0x0000
     748:	4009300f          	.insn	4, 0x4009300f
     74c:	bc00                	.insn	2, 0xbc00
     74e:	0000                	.insn	2, 0x0000
     750:	0100                	.insn	2, 0x0100
     752:	2052                	.insn	2, 0x2052
     754:	0000                	.insn	2, 0x0000
     756:	0100                	.insn	2, 0x0100
     758:	1ff5                	.insn	2, 0x1ff5
     75a:	046d                	.insn	2, 0x046d
     75c:	0000                	.insn	2, 0x0000
     75e:	014d                	.insn	2, 0x014d
     760:	0000                	.insn	2, 0x0000
     762:	f501                	.insn	2, 0xf501
     764:	0299                	.insn	2, 0x0299
     766:	0000                	.insn	2, 0x0000
     768:	aa12                	.insn	2, 0xaa12
     76a:	0004                	.insn	2, 0x0004
     76c:	3e00                	.insn	2, 0x3e00
     76e:	0000                	.insn	2, 0x0000
     770:	0100                	.insn	2, 0x0100
     772:	000287f7          	.insn	4, 0x000287f7
     776:	1000                	.insn	2, 0x1000
     778:	0954                	.insn	2, 0x0954
     77a:	0040                	.insn	2, 0x0040
     77c:	0054                	.insn	2, 0x0054
     77e:	0000                	.insn	2, 0x0000
     780:	8b12                	.insn	2, 0x8b12
     782:	0004                	.insn	2, 0x0004
     784:	7500                	.insn	2, 0x7500
     786:	0000                	.insn	2, 0x0000
     788:	0100                	.insn	2, 0x0100
     78a:	99f8                	.insn	2, 0x99f8
     78c:	0002                	.insn	2, 0x0002
     78e:	0000                	.insn	2, 0x0000
     790:	4319                	.insn	2, 0x4319
     792:	0008                	.insn	2, 0x0008
     794:	7800                	.insn	2, 0x7800
     796:	4009                	.insn	2, 0x4009
     798:	1900                	.insn	2, 0x1900
     79a:	06dc                	.insn	2, 0x06dc
     79c:	0000                	.insn	2, 0x0000
     79e:	098c                	.insn	2, 0x098c
     7a0:	0040                	.insn	2, 0x0040
     7a2:	ea19                	.insn	2, 0xea19
     7a4:	0006                	.insn	2, 0x0006
     7a6:	a400                	.insn	2, 0xa400
     7a8:	4009                	.insn	2, 0x4009
     7aa:	1900                	.insn	2, 0x1900
     7ac:	06ea                	.insn	2, 0x06ea
     7ae:	0000                	.insn	2, 0x0000
     7b0:	09bc                	.insn	2, 0x09bc
     7b2:	0040                	.insn	2, 0x0040
     7b4:	dc20                	.insn	2, 0xdc20
     7b6:	0006                	.insn	2, 0x0006
     7b8:	ec00                	.insn	2, 0xec00
     7ba:	4009                	.insn	2, 0x4009
     7bc:	0000                	.insn	2, 0x0000
     7be:	d31a                	.insn	2, 0xd31a
     7c0:	0002                	.insn	2, 0x0002
     7c2:	0200                	.insn	2, 0x0200
     7c4:	1b2a                	.insn	2, 0x1b2a
     7c6:	0299                	.insn	2, 0x0299
     7c8:	0000                	.insn	2, 0x0000
     7ca:	1a00                	.insn	2, 0x1a00
     7cc:	02df 0000 2802      	.insn	6, 0x2802000002df
     7d2:	00028e1b          	.insn	4, 0x00028e1b
     7d6:	0000                	.insn	2, 0x0000
     7d8:	851d                	.insn	2, 0x851d
     7da:	0000                	.insn	2, 0x0000
     7dc:	0300                	.insn	2, 0x0300
     7de:	8710                	.insn	2, 0x8710
     7e0:	0002                	.insn	2, 0x0002
     7e2:	2100                	.insn	2, 0x2100
     7e4:	000d                	.insn	2, 0x000d
     7e6:	0000                	.insn	2, 0x0000
     7e8:	161e1103          	lh	sp,353(t3)
     7ec:	0000                	.insn	2, 0x0000
     7ee:	0300                	.insn	2, 0x0300
     7f0:	870e                	.insn	2, 0x870e
     7f2:	0002                	.insn	2, 0x0002
     7f4:	1b00                	.insn	2, 0x1b00
     7f6:	02ec                	.insn	2, 0x02ec
     7f8:	0000                	.insn	2, 0x0000
     7fa:	2200                	.insn	2, 0x2200
     7fc:	0381                	.insn	2, 0x0381
     7fe:	0000                	.insn	2, 0x0000
     800:	3f02                	.insn	2, 0x3f02
     802:	40086423          	.insn	4, 0x40086423
     806:	cc00                	.insn	2, 0xcc00
     808:	0000                	.insn	2, 0x0000
     80a:	0100                	.insn	2, 0x0100
     80c:	a052                	.insn	2, 0xa052
     80e:	0002                	.insn	2, 0x0002
     810:	1700                	.insn	2, 0x1700
     812:	039f 0000 02ad      	.insn	6, 0x02ad0000039f
     818:	0000                	.insn	2, 0x0000
     81a:	0124                	.insn	2, 0x0124
     81c:	0002b95b          	.insn	4, 0x0002b95b
     820:	1800                	.insn	2, 0x1800
     822:	0412                	.insn	2, 0x0412
     824:	0000                	.insn	2, 0x0000
     826:	02c5                	.insn	2, 0x02c5
     828:	0000                	.insn	2, 0x0000
     82a:	d014                	.insn	2, 0xd014
     82c:	0000                	.insn	2, 0x0000
     82e:	1800                	.insn	2, 0x1800
     830:	043c                	.insn	2, 0x043c
     832:	0000                	.insn	2, 0x0000
     834:	02d2                	.insn	2, 0x02d2
     836:	0000                	.insn	2, 0x0000
     838:	5a18                	.insn	2, 0x5a18
     83a:	0004                	.insn	2, 0x0004
     83c:	de00                	.insn	2, 0xde00
     83e:	0002                	.insn	2, 0x0002
     840:	0000                	.insn	2, 0x0000
     842:	1e00                	.insn	2, 0x1e00
     844:	0232                	.insn	2, 0x0232
     846:	0000                	.insn	2, 0x0000
     848:	3002                	.insn	2, 0x3002
     84a:	0854                	.insn	2, 0x0854
     84c:	0000                	.insn	2, 0x0000
     84e:	0002991b          	.insn	4, 0x0002991b
     852:	0000                	.insn	2, 0x0000
     854:	8708                	.insn	2, 0x8708
     856:	0002                	.insn	2, 0x0002
     858:	aa00                	.insn	2, 0xaa00
     85a:	0000                	.insn	2, 0x0000
     85c:	0200                	.insn	2, 0x0200
     85e:	030e                	.insn	2, 0x030e
     860:	0000003f 00004604 	.insn	8, 0x46040000003f
     868:	2000                	.insn	2, 0x2000
     86a:	0300                	.insn	2, 0x0300
     86c:	02ec                	.insn	2, 0x02ec
     86e:	0000                	.insn	2, 0x0000
     870:	4604                	.insn	2, 0x4604
     872:	0000                	.insn	2, 0x0000
     874:	0800                	.insn	2, 0x0800
     876:	0d00                	.insn	2, 0x0d00
     878:	0000003f  	.insn	8, 0x000a59000000003f

0000087d <$d.5>:
     87d:	0a59                	.insn	2, 0x0a59
     87f:	0000                	.insn	2, 0x0000
     881:	0004                	.insn	2, 0x0004
     883:	000001cb          	.insn	4, 0x01cb
     887:	0104                	.insn	2, 0x0104
     889:	0126                	.insn	2, 0x0126
     88b:	0000                	.insn	2, 0x0000
     88d:	001d                	.insn	2, 0x001d
     88f:	000000c3          	.insn	4, 0x00c3
     893:	0840                	.insn	2, 0x0840
     895:	0000                	.insn	2, 0x0000
     897:	01fd                	.insn	2, 0x01fd
     899:	0000                	.insn	2, 0x0000
     89b:	0000                	.insn	2, 0x0000
     89d:	0000                	.insn	2, 0x0000
     89f:	0240                	.insn	2, 0x0240
     8a1:	0000                	.insn	2, 0x0000
     8a3:	3402                	.insn	2, 0x3402
     8a5:	0000                	.insn	2, 0x0000
     8a7:	0100                	.insn	2, 0x0100
     8a9:	0136                	.insn	2, 0x0136
     8ab:	0305                	.insn	2, 0x0305
     8ad:	1ccc                	.insn	2, 0x1ccc
     8af:	0040                	.insn	2, 0x0040
     8b1:	00004003          	lbu	zero,0(zero) # 0 <$d.4>
     8b5:	0400                	.insn	2, 0x0400
     8b7:	00000047          	.insn	4, 0x0047
     8bb:	0011                	.insn	2, 0x0011
     8bd:	e805                	.insn	2, 0xe805
     8bf:	0001                	.insn	2, 0x0001
     8c1:	0800                	.insn	2, 0x0800
     8c3:	0601                	.insn	2, 0x0601
     8c5:	02ae                	.insn	2, 0x02ae
     8c7:	0000                	.insn	2, 0x0000
     8c9:	0708                	.insn	2, 0x0708
     8cb:	00005a07          	.insn	4, 0x5a07
     8cf:	f500                	.insn	2, 0xf500
     8d1:	0002                	.insn	2, 0x0002
     8d3:	0200                	.insn	2, 0x0200
     8d5:	010a                	.insn	2, 0x010a
     8d7:	d005                	.insn	2, 0xd005
     8d9:	0001                	.insn	2, 0x0001
     8db:	0800                	.insn	2, 0x0800
     8dd:	0801                	.insn	2, 0x0801
     8df:	006c                	.insn	2, 0x006c
     8e1:	0000                	.insn	2, 0x0000
     8e3:	00000193          	li	gp,0
     8e7:	c602                	.insn	2, 0xc602
     8e9:	8405                	.insn	2, 0x8405
     8eb:	0002                	.insn	2, 0x0002
     8ed:	0700                	.insn	2, 0x0700
     8ef:	0504                	.insn	2, 0x0504
     8f1:	01ed                	.insn	2, 0x01ed
     8f3:	0000                	.insn	2, 0x0000
     8f5:	0405                	.insn	2, 0x0405
     8f7:	5a09                	.insn	2, 0x5a09
     8f9:	0000                	.insn	2, 0x0000
     8fb:	0a00                	.insn	2, 0x0a00
     8fd:	0264                	.insn	2, 0x0264
     8ff:	0000                	.insn	2, 0x0000
     901:	3901                	.insn	2, 0x3901
     903:	00000073          	ecall
     907:	0b01                	.insn	2, 0x0b01
     909:	01c1                	.insn	2, 0x01c1
     90b:	0000                	.insn	2, 0x0000
     90d:	3901                	.insn	2, 0x3901
     90f:	00000073          	ecall
     913:	0003220b          	.insn	4, 0x0003220b
     917:	0100                	.insn	2, 0x0100
     919:	7339                	.insn	2, 0x7339
     91b:	0000                	.insn	2, 0x0000
     91d:	0b00                	.insn	2, 0x0b00
     91f:	0389                	.insn	2, 0x0389
     921:	0000                	.insn	2, 0x0000
     923:	3901                	.insn	2, 0x3901
     925:	00000073          	ecall
     929:	00034d0b          	.insn	4, 0x00034d0b
     92d:	0100                	.insn	2, 0x0100
     92f:	7339                	.insn	2, 0x7339
     931:	0000                	.insn	2, 0x0000
     933:	0c00                	.insn	2, 0x0c00
     935:	026c                	.insn	2, 0x026c
     937:	0000                	.insn	2, 0x0000
     939:	3b01                	.insn	2, 0x3b01
     93b:	00000073          	ecall
     93f:	eb0c                	.insn	2, 0xeb0c
     941:	0002                	.insn	2, 0x0002
     943:	0100                	.insn	2, 0x0100
     945:	733c                	.insn	2, 0x733c
     947:	0000                	.insn	2, 0x0000
     949:	0c00                	.insn	2, 0x0c00
     94b:	000000af          	.insn	4, 0x00af
     94f:	3d01                	.insn	2, 0x3d01
     951:	00000073          	ecall
     955:	560c                	.insn	2, 0x560c
     957:	0000                	.insn	2, 0x0000
     959:	0100                	.insn	2, 0x0100
     95b:	733e                	.insn	2, 0x733e
     95d:	0000                	.insn	2, 0x0000
     95f:	0000                	.insn	2, 0x0000
     961:	ec0d                	.insn	2, 0xec0d
     963:	4009                	.insn	2, 0x4009
     965:	1800                	.insn	2, 0x1800
     967:	0000                	.insn	2, 0x0000
     969:	0100                	.insn	2, 0x0100
     96b:	8152                	.insn	2, 0x8152
     96d:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     971:	0e4d                	.insn	2, 0x0e4d
     973:	007f 0000 09ec 0040 	.insn	10, 0x0014004009ec0000007f
     97b:	0014 
     97d:	0000                	.insn	2, 0x0000
     97f:	5201                	.insn	2, 0x5201
     981:	0f05                	.insn	2, 0x0f05
     983:	8b0a                	.insn	2, 0x8b0a
     985:	0000                	.insn	2, 0x0000
     987:	0f00                	.insn	2, 0x0f00
     989:	9600                	.insn	2, 0x9600
     98b:	0000                	.insn	2, 0x0000
     98d:	0f00                	.insn	2, 0x0f00
     98f:	a100                	.insn	2, 0xa100
     991:	0000                	.insn	2, 0x0000
     993:	0f00                	.insn	2, 0x0f00
     995:	ac00                	.insn	2, 0xac00
     997:	0000                	.insn	2, 0x0000
     999:	1000                	.insn	2, 0x1000
     99b:	04ca                	.insn	2, 0x04ca
     99d:	0000                	.insn	2, 0x0000
     99f:	000000b7          	lui	ra,0x0
     9a3:	0011                	.insn	2, 0x0011
     9a5:	00c2                	.insn	2, 0x00c2
     9a7:	0000                	.insn	2, 0x0000
     9a9:	0011                	.insn	2, 0x0011
     9ab:	00cd                	.insn	2, 0x00cd
     9ad:	0000                	.insn	2, 0x0000
     9af:	0a11                	.insn	2, 0x0a11
     9b1:	00d8                	.insn	2, 0x00d8
     9b3:	0000                	.insn	2, 0x0000
     9b5:	0000                	.insn	2, 0x0000
     9b7:	f612                	.insn	2, 0xf612
     9b9:	0001                	.insn	2, 0x0001
     9bb:	0100                	.insn	2, 0x0100
     9bd:	01cd                	.insn	2, 0x01cd
     9bf:	0190                	.insn	2, 0x0190
     9c1:	0000                	.insn	2, 0x0000
     9c3:	1301                	.insn	2, 0x1301
     9c5:	0075                	.insn	2, 0x0075
     9c7:	0000                	.insn	2, 0x0000
     9c9:	cd01                	.insn	2, 0xcd01
     9cb:	6101                	.insn	2, 0x6101
     9cd:	0000                	.insn	2, 0x0000
     9cf:	1300                	.insn	2, 0x1300
     9d1:	026c                	.insn	2, 0x026c
     9d3:	0000                	.insn	2, 0x0000
     9d5:	ce01                	.insn	2, 0xce01
     9d7:	6101                	.insn	2, 0x6101
     9d9:	0000                	.insn	2, 0x0000
     9db:	1300                	.insn	2, 0x1300
     9dd:	000002eb          	.insn	4, 0x02eb
     9e1:	cf01                	.insn	2, 0xcf01
     9e3:	6101                	.insn	2, 0x6101
     9e5:	0000                	.insn	2, 0x0000
     9e7:	1300                	.insn	2, 0x1300
     9e9:	000000af          	.insn	4, 0x00af
     9ed:	d001                	.insn	2, 0xd001
     9ef:	6101                	.insn	2, 0x6101
     9f1:	0000                	.insn	2, 0x0000
     9f3:	1300                	.insn	2, 0x1300
     9f5:	0296                	.insn	2, 0x0296
     9f7:	0000                	.insn	2, 0x0000
     9f9:	d101                	.insn	2, 0xd101
     9fb:	6101                	.insn	2, 0x6101
     9fd:	0000                	.insn	2, 0x0000
     9ff:	1400                	.insn	2, 0x1400
     a01:	0151                	.insn	2, 0x0151
     a03:	0000                	.insn	2, 0x0000
     a05:	d301                	.insn	2, 0xd301
     a07:	6101                	.insn	2, 0x6101
     a09:	0000                	.insn	2, 0x0000
     a0b:	0000                	.insn	2, 0x0000
     a0d:	6c08                	.insn	2, 0x6c08
     a0f:	0000                	.insn	2, 0x0000
     a11:	9300                	.insn	2, 0x9300
     a13:	0001                	.insn	2, 0x0001
     a15:	0300                	.insn	2, 0x0300
     a17:	1511                	.insn	2, 0x1511
     a19:	0000036f          	jal	t1,a19 <$d.5+0x19c>
     a1d:	a301                	.insn	2, 0xa301
     a1f:	0101                	.insn	2, 0x0101
     a21:	00038613          	mv	a2,t2
     a25:	0100                	.insn	2, 0x0100
     a27:	004001a3          	sb	tp,3(zero) # 3 <$d.4+0x3>
     a2b:	0000                	.insn	2, 0x0000
     a2d:	1500                	.insn	2, 0x1500
     a2f:	00ce                	.insn	2, 0x00ce
     a31:	0000                	.insn	2, 0x0000
     a33:	bd01                	.insn	2, 0xbd01
     a35:	0101                	.insn	2, 0x0101
     a37:	0000c113          	xori	sp,ra,0
     a3b:	0100                	.insn	2, 0x0100
     a3d:	01bd                	.insn	2, 0x01bd
     a3f:	00000073          	ecall
     a43:	1600                	.insn	2, 0x1600
     a45:	0a04                	.insn	2, 0x0a04
     a47:	0040                	.insn	2, 0x0040
     a49:	0304                	.insn	2, 0x0304
     a4b:	0000                	.insn	2, 0x0000
     a4d:	5201                	.insn	2, 0x5201
     a4f:	02df 0000 7701      	.insn	6, 0x7701000002df
     a55:	0004e717          	auipc	a4,0x4e
     a59:	6200                	.insn	2, 0x6200
     a5b:	0000                	.insn	2, 0x0000
     a5d:	0100                	.insn	2, 0x0100
     a5f:	00006177          	.insn	4, 0x6177
     a63:	1800                	.insn	2, 0x1800
     a65:	00d09103          	lh	sp,13(ra) # d <$d.4+0xd>
     a69:	0059                	.insn	2, 0x0059
     a6b:	0000                	.insn	2, 0x0000
     a6d:	8501                	.insn	2, 0x8501
     a6f:	0a18                	.insn	2, 0x0a18
     a71:	0000                	.insn	2, 0x0000
     a73:	0318                	.insn	2, 0x0318
     a75:	c091                	.insn	2, 0xc091
     a77:	0f00                	.insn	2, 0x0f00
     a79:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     a7d:	1886                	.insn	2, 0x1886
     a7f:	000a                	.insn	2, 0x000a
     a81:	1800                	.insn	2, 0x1800
     a83:	9102                	.insn	2, 0x9102
     a85:	2f00                	.insn	2, 0x2f00
     a87:	0000                	.insn	2, 0x0000
     a89:	0100                	.insn	2, 0x0100
     a8b:	000a2a87          	.insn	4, 0x000a2a87
     a8f:	1900                	.insn	2, 0x1900
     a91:	0a0c                	.insn	2, 0x0a0c
     a93:	0040                	.insn	2, 0x0040
     a95:	0070                	.insn	2, 0x0070
     a97:	0000                	.insn	2, 0x0000
     a99:	0d1a                	.insn	2, 0x0d1a
     a9b:	0005                	.insn	2, 0x0005
     a9d:	3800                	.insn	2, 0x3800
     a9f:	0000                	.insn	2, 0x0000
     aa1:	0100                	.insn	2, 0x0100
     aa3:	618a                	.insn	2, 0x618a
     aa5:	0000                	.insn	2, 0x0000
     aa7:	1900                	.insn	2, 0x1900
     aa9:	0a24                	.insn	2, 0x0a24
     aab:	0040                	.insn	2, 0x0040
     aad:	0044                	.insn	2, 0x0044
     aaf:	0000                	.insn	2, 0x0000
     ab1:	341a                	.insn	2, 0x341a
     ab3:	0005                	.insn	2, 0x0005
     ab5:	5700                	.insn	2, 0x5700
     ab7:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     abb:	0000618b          	.insn	4, 0x618b
     abf:	0000                	.insn	2, 0x0000
     ac1:	1b00                	.insn	2, 0x1b00
     ac3:	013a                	.insn	2, 0x013a
     ac5:	0000                	.insn	2, 0x0000
     ac7:	00f0                	.insn	2, 0x00f0
     ac9:	0000                	.insn	2, 0x0000
     acb:	9801                	.insn	2, 0x9801
     acd:	1c05                	.insn	2, 0x1c05
     acf:	0599                	.insn	2, 0x0599
     ad1:	0000                	.insn	2, 0x0000
     ad3:	00000147          	.insn	4, 0x0147
     ad7:	fa1c                	.insn	2, 0xfa1c
     ad9:	0005                	.insn	2, 0x0005
     adb:	5300                	.insn	2, 0x5300
     add:	0001                	.insn	2, 0x0001
     adf:	1c00                	.insn	2, 0x1c00
     ae1:	05dc                	.insn	2, 0x05dc
     ae3:	0000                	.insn	2, 0x0000
     ae5:	015f 0000 c11c      	.insn	6, 0xc11c0000015f
     aeb:	0005                	.insn	2, 0x0005
     aed:	6b00                	.insn	2, 0x6b00
     aef:	0001                	.insn	2, 0x0001
     af1:	1c00                	.insn	2, 0x1c00
     af3:	00000573          	.insn	4, 0x0573
     af7:	00000177          	.insn	4, 0x0177
     afb:	1810                	.insn	2, 0x1810
     afd:	0006                	.insn	2, 0x0006
     aff:	8300                	.insn	2, 0x8300
     b01:	0001                	.insn	2, 0x0001
     b03:	0000                	.insn	2, 0x0000
     b05:	00019b1b          	.insn	4, 0x00019b1b
     b09:	0800                	.insn	2, 0x0800
     b0b:	0001                	.insn	2, 0x0001
     b0d:	0100                	.insn	2, 0x0100
     b0f:	05a1                	.insn	2, 0x05a1
     b11:	331c                	.insn	2, 0x331c
     b13:	0006                	.insn	2, 0x0006
     b15:	a400                	.insn	2, 0xa400
     b17:	0001                	.insn	2, 0x0001
     b19:	0000                	.insn	2, 0x0000
     b1b:	00019b1b          	.insn	4, 0x00019b1b
     b1f:	2000                	.insn	2, 0x2000
     b21:	0001                	.insn	2, 0x0001
     b23:	0100                	.insn	2, 0x0100
     b25:	05a2                	.insn	2, 0x05a2
     b27:	5d1c                	.insn	2, 0x5d1c
     b29:	0006                	.insn	2, 0x0006
     b2b:	a400                	.insn	2, 0xa400
     b2d:	0001                	.insn	2, 0x0001
     b2f:	0000                	.insn	2, 0x0000
     b31:	c819                	.insn	2, 0xc819
     b33:	400a                	.insn	2, 0x400a
     b35:	6400                	.insn	2, 0x6400
     b37:	0000                	.insn	2, 0x0000
     b39:	1a00                	.insn	2, 0x1a00
     b3b:	0685                	.insn	2, 0x0685
     b3d:	0000                	.insn	2, 0x0000
     b3f:	0038                	.insn	2, 0x0038
     b41:	0000                	.insn	2, 0x0000
     b43:	a301                	.insn	2, 0xa301
     b45:	0061                	.insn	2, 0x0061
     b47:	0000                	.insn	2, 0x0000
     b49:	dc19                	.insn	2, 0xdc19
     b4b:	400a                	.insn	2, 0x400a
     b4d:	3400                	.insn	2, 0x3400
     b4f:	0000                	.insn	2, 0x0000
     b51:	1a00                	.insn	2, 0x1a00
     b53:	06ac                	.insn	2, 0x06ac
     b55:	0000                	.insn	2, 0x0000
     b57:	00000357          	.insn	4, 0x0357
     b5b:	a401                	.insn	2, 0xa401
     b5d:	0061                	.insn	2, 0x0061
     b5f:	0000                	.insn	2, 0x0000
     b61:	b10e                	.insn	2, 0xb10e
     b63:	0001                	.insn	2, 0x0001
     b65:	f000                	.insn	2, 0xf000
     b67:	400a                	.insn	2, 0x400a
     b69:	0c00                	.insn	2, 0x0c00
     b6b:	0000                	.insn	2, 0x0000
     b6d:	0100                	.insn	2, 0x0100
     b6f:	0da5                	.insn	2, 0x0da5
     b71:	011d                	.insn	2, 0x011d
     b73:	0001ba57          	.insn	4, 0x0001ba57
     b77:	0000                	.insn	2, 0x0000
     b79:	9b0e                	.insn	2, 0x9b0e
     b7b:	0001                	.insn	2, 0x0001
     b7d:	fc00                	.insn	2, 0xfc00
     b7f:	400a                	.insn	2, 0x400a
     b81:	0c00                	.insn	2, 0x0c00
     b83:	0000                	.insn	2, 0x0000
     b85:	0100                	.insn	2, 0x0100
     b87:	0da6                	.insn	2, 0x0da6
     b89:	201e                	.insn	2, 0x201e
     b8b:	01a4                	.insn	2, 0x01a4
     b8d:	0000                	.insn	2, 0x0000
     b8f:	0000                	.insn	2, 0x0000
     b91:	9b0e                	.insn	2, 0x9b0e
     b93:	0001                	.insn	2, 0x0001
     b95:	1000                	.insn	2, 0x1000
     b97:	0c00400b          	.insn	4, 0x0c00400b
     b9b:	0000                	.insn	2, 0x0000
     b9d:	0100                	.insn	2, 0x0100
     b9f:	09a8                	.insn	2, 0x09a8
     ba1:	0a1e                	.insn	2, 0x0a1e
     ba3:	01a4                	.insn	2, 0x01a4
     ba5:	0000                	.insn	2, 0x0000
     ba7:	0000                	.insn	2, 0x0000
     ba9:	00019b1b          	.insn	4, 0x00019b1b
     bad:	3800                	.insn	2, 0x3800
     baf:	0001                	.insn	2, 0x0001
     bb1:	0100                	.insn	2, 0x0100
     bb3:	05aa                	.insn	2, 0x05aa
     bb5:	f31c                	.insn	2, 0xf31c
     bb7:	0006                	.insn	2, 0x0006
     bb9:	a400                	.insn	2, 0xa400
     bbb:	0001                	.insn	2, 0x0001
     bbd:	0000                	.insn	2, 0x0000
     bbf:	00019b1b          	.insn	4, 0x00019b1b
     bc3:	5000                	.insn	2, 0x5000
     bc5:	0001                	.insn	2, 0x0001
     bc7:	0100                	.insn	2, 0x0100
     bc9:	05ad                	.insn	2, 0x05ad
     bcb:	1b1c                	.insn	2, 0x1b1c
     bcd:	a4000007          	.insn	4, 0xa4000007
     bd1:	0001                	.insn	2, 0x0001
     bd3:	0000                	.insn	2, 0x0000
     bd5:	00019b1b          	.insn	4, 0x00019b1b
     bd9:	6800                	.insn	2, 0x6800
     bdb:	0001                	.insn	2, 0x0001
     bdd:	0100                	.insn	2, 0x0100
     bdf:	05ae                	.insn	2, 0x05ae
     be1:	451c                	.insn	2, 0x451c
     be3:	a4000007          	.insn	4, 0xa4000007
     be7:	0001                	.insn	2, 0x0001
     be9:	0000                	.insn	2, 0x0000
     beb:	a419                	.insn	2, 0xa419
     bed:	6800400b          	.insn	4, 0x6800400b
     bf1:	0000                	.insn	2, 0x0000
     bf3:	1a00                	.insn	2, 0x1a00
     bf5:	076d                	.insn	2, 0x076d
     bf7:	0000                	.insn	2, 0x0000
     bf9:	0038                	.insn	2, 0x0038
     bfb:	0000                	.insn	2, 0x0000
     bfd:	af01                	.insn	2, 0xaf01
     bff:	0061                	.insn	2, 0x0061
     c01:	0000                	.insn	2, 0x0000
     c03:	bc19                	.insn	2, 0xbc19
     c05:	3400400b          	.insn	4, 0x3400400b
     c09:	0000                	.insn	2, 0x0000
     c0b:	1a00                	.insn	2, 0x1a00
     c0d:	0794                	.insn	2, 0x0794
     c0f:	0000                	.insn	2, 0x0000
     c11:	00000357          	.insn	4, 0x0357
     c15:	b001                	.insn	2, 0xb001
     c17:	0061                	.insn	2, 0x0061
     c19:	0000                	.insn	2, 0x0000
     c1b:	b10e                	.insn	2, 0xb10e
     c1d:	0001                	.insn	2, 0x0001
     c1f:	d000                	.insn	2, 0xd000
     c21:	0c00400b          	.insn	4, 0x0c00400b
     c25:	0000                	.insn	2, 0x0000
     c27:	0100                	.insn	2, 0x0100
     c29:	0db1                	.insn	2, 0x0db1
     c2b:	011d                	.insn	2, 0x011d
     c2d:	0001ba57          	.insn	4, 0x0001ba57
     c31:	0000                	.insn	2, 0x0000
     c33:	9b0e                	.insn	2, 0x9b0e
     c35:	0001                	.insn	2, 0x0001
     c37:	dc00                	.insn	2, 0xdc00
     c39:	0c00400b          	.insn	4, 0x0c00400b
     c3d:	0000                	.insn	2, 0x0000
     c3f:	0100                	.insn	2, 0x0100
     c41:	0db2                	.insn	2, 0x0db2
     c43:	201e                	.insn	2, 0x201e
     c45:	01a4                	.insn	2, 0x01a4
     c47:	0000                	.insn	2, 0x0000
     c49:	0000                	.insn	2, 0x0000
     c4b:	9b0e                	.insn	2, 0x9b0e
     c4d:	0001                	.insn	2, 0x0001
     c4f:	f000                	.insn	2, 0xf000
     c51:	0c00400b          	.insn	4, 0x0c00400b
     c55:	0000                	.insn	2, 0x0000
     c57:	0100                	.insn	2, 0x0100
     c59:	09b4                	.insn	2, 0x09b4
     c5b:	0a1e                	.insn	2, 0x0a1e
     c5d:	01a4                	.insn	2, 0x01a4
     c5f:	0000                	.insn	2, 0x0000
     c61:	0000                	.insn	2, 0x0000
     c63:	00019b1b          	.insn	4, 0x00019b1b
     c67:	8000                	.insn	2, 0x8000
     c69:	0001                	.insn	2, 0x0001
     c6b:	0100                	.insn	2, 0x0100
     c6d:	05b6                	.insn	2, 0x05b6
     c6f:	db1c                	.insn	2, 0xdb1c
     c71:	a4000007          	.insn	4, 0xa4000007
     c75:	0001                	.insn	2, 0x0001
     c77:	0000                	.insn	2, 0x0000
     c79:	00019b1b          	.insn	4, 0x00019b1b
     c7d:	9800                	.insn	2, 0x9800
     c7f:	0001                	.insn	2, 0x0001
     c81:	0100                	.insn	2, 0x0100
     c83:	05b9                	.insn	2, 0x05b9
     c85:	031c                	.insn	2, 0x031c
     c87:	0008                	.insn	2, 0x0008
     c89:	a400                	.insn	2, 0xa400
     c8b:	0001                	.insn	2, 0x0001
     c8d:	0000                	.insn	2, 0x0000
     c8f:	00019b1b          	.insn	4, 0x00019b1b
     c93:	b000                	.insn	2, 0xb000
     c95:	0001                	.insn	2, 0x0001
     c97:	0100                	.insn	2, 0x0100
     c99:	05ba                	.insn	2, 0x05ba
     c9b:	2d1c                	.insn	2, 0x2d1c
     c9d:	0008                	.insn	2, 0x0008
     c9f:	a400                	.insn	2, 0xa400
     ca1:	0001                	.insn	2, 0x0001
     ca3:	0000                	.insn	2, 0x0000
     ca5:	9419                	.insn	2, 0x9419
     ca7:	400c                	.insn	2, 0x400c
     ca9:	5c00                	.insn	2, 0x5c00
     cab:	0000                	.insn	2, 0x0000
     cad:	1a00                	.insn	2, 0x1a00
     caf:	0855                	.insn	2, 0x0855
     cb1:	0000                	.insn	2, 0x0000
     cb3:	0038                	.insn	2, 0x0038
     cb5:	0000                	.insn	2, 0x0000
     cb7:	bb01                	.insn	2, 0xbb01
     cb9:	0061                	.insn	2, 0x0061
     cbb:	0000                	.insn	2, 0x0000
     cbd:	b019                	.insn	2, 0xb019
     cbf:	400c                	.insn	2, 0x400c
     cc1:	2800                	.insn	2, 0x2800
     cc3:	0000                	.insn	2, 0x0000
     cc5:	1a00                	.insn	2, 0x1a00
     cc7:	087c                	.insn	2, 0x087c
     cc9:	0000                	.insn	2, 0x0000
     ccb:	00000357          	.insn	4, 0x0357
     ccf:	bc01                	.insn	2, 0xbc01
     cd1:	0061                	.insn	2, 0x0061
     cd3:	0000                	.insn	2, 0x0000
     cd5:	b10e                	.insn	2, 0xb10e
     cd7:	0001                	.insn	2, 0x0001
     cd9:	b400                	.insn	2, 0xb400
     cdb:	400c                	.insn	2, 0x400c
     cdd:	0c00                	.insn	2, 0x0c00
     cdf:	0000                	.insn	2, 0x0000
     ce1:	0100                	.insn	2, 0x0100
     ce3:	0dbd                	.insn	2, 0x0dbd
     ce5:	011d                	.insn	2, 0x011d
     ce7:	ba56                	.insn	2, 0xba56
     ce9:	0001                	.insn	2, 0x0001
     ceb:	0000                	.insn	2, 0x0000
     ced:	9b0e                	.insn	2, 0x9b0e
     cef:	0001                	.insn	2, 0x0001
     cf1:	c000                	.insn	2, 0xc000
     cf3:	400c                	.insn	2, 0x400c
     cf5:	0c00                	.insn	2, 0x0c00
     cf7:	0000                	.insn	2, 0x0000
     cf9:	0100                	.insn	2, 0x0100
     cfb:	0dbe                	.insn	2, 0x0dbe
     cfd:	201e                	.insn	2, 0x201e
     cff:	01a4                	.insn	2, 0x01a4
     d01:	0000                	.insn	2, 0x0000
     d03:	0000                	.insn	2, 0x0000
     d05:	9b0e                	.insn	2, 0x9b0e
     d07:	0001                	.insn	2, 0x0001
     d09:	d800                	.insn	2, 0xd800
     d0b:	400c                	.insn	2, 0x400c
     d0d:	0c00                	.insn	2, 0x0c00
     d0f:	0000                	.insn	2, 0x0000
     d11:	0100                	.insn	2, 0x0100
     d13:	09c0                	.insn	2, 0x09c0
     d15:	0a1e                	.insn	2, 0x0a1e
     d17:	01a4                	.insn	2, 0x01a4
     d19:	0000                	.insn	2, 0x0000
     d1b:	0000                	.insn	2, 0x0000
     d1d:	9b0e                	.insn	2, 0x9b0e
     d1f:	0001                	.insn	2, 0x0001
     d21:	f400                	.insn	2, 0xf400
     d23:	400c                	.insn	2, 0x400c
     d25:	0c00                	.insn	2, 0x0c00
     d27:	0000                	.insn	2, 0x0000
     d29:	0100                	.insn	2, 0x0100
     d2b:	05c2                	.insn	2, 0x05c2
     d2d:	0a1e                	.insn	2, 0x0a1e
     d2f:	01a4                	.insn	2, 0x01a4
     d31:	0000                	.insn	2, 0x0000
     d33:	0000                	.insn	2, 0x0000
     d35:	081f 400d 1400      	.insn	6, 0x1400400d081f
     d3b:	0000                	.insn	2, 0x0000
     d3d:	0100                	.insn	2, 0x0100
     d3f:	9b52                	.insn	2, 0x9b52
     d41:	0001                	.insn	2, 0x0001
     d43:	1c00                	.insn	2, 0x1c00
     d45:	08b5                	.insn	2, 0x08b5
     d47:	0000                	.insn	2, 0x0000
     d49:	01a4                	.insn	2, 0x01a4
     d4b:	0000                	.insn	2, 0x0000
     d4d:	1f00                	.insn	2, 0x1f00
     d4f:	0d1c                	.insn	2, 0x0d1c
     d51:	0040                	.insn	2, 0x0040
     d53:	0014                	.insn	2, 0x0014
     d55:	0000                	.insn	2, 0x0000
     d57:	5201                	.insn	2, 0x5201
     d59:	01b1                	.insn	2, 0x01b1
     d5b:	0000                	.insn	2, 0x0000
     d5d:	db1c                	.insn	2, 0xdb1c
     d5f:	0008                	.insn	2, 0x0008
     d61:	ba00                	.insn	2, 0xba00
     d63:	0001                	.insn	2, 0x0001
     d65:	0000                	.insn	2, 0x0000
     d67:	fc12                	.insn	2, 0xfc12
     d69:	0000                	.insn	2, 0x0000
     d6b:	0100                	.insn	2, 0x0100
     d6d:	01e4                	.insn	2, 0x01e4
     d6f:	0190                	.insn	2, 0x0190
     d71:	0000                	.insn	2, 0x0000
     d73:	1301                	.insn	2, 0x1301
     d75:	01c1                	.insn	2, 0x01c1
     d77:	0000                	.insn	2, 0x0000
     d79:	e401                	.insn	2, 0xe401
     d7b:	6101                	.insn	2, 0x6101
     d7d:	0000                	.insn	2, 0x0000
     d7f:	1300                	.insn	2, 0x1300
     d81:	0322                	.insn	2, 0x0322
     d83:	0000                	.insn	2, 0x0000
     d85:	e401                	.insn	2, 0xe401
     d87:	6101                	.insn	2, 0x6101
     d89:	0000                	.insn	2, 0x0000
     d8b:	1400                	.insn	2, 0x1400
     d8d:	026c                	.insn	2, 0x026c
     d8f:	0000                	.insn	2, 0x0000
     d91:	e601                	.insn	2, 0xe601
     d93:	6101                	.insn	2, 0x6101
     d95:	0000                	.insn	2, 0x0000
     d97:	1400                	.insn	2, 0x1400
     d99:	0056                	.insn	2, 0x0056
     d9b:	0000                	.insn	2, 0x0000
     d9d:	e701                	.insn	2, 0xe701
     d9f:	6101                	.insn	2, 0x6101
     da1:	0000                	.insn	2, 0x0000
     da3:	0000                	.insn	2, 0x0000
     da5:	3016                	.insn	2, 0x3016
     da7:	400d                	.insn	2, 0x400d
     da9:	0c00                	.insn	2, 0x0c00
     dab:	0000                	.insn	2, 0x0000
     dad:	0100                	.insn	2, 0x0100
     daf:	4d52                	.insn	2, 0x4d52
     db1:	0002                	.insn	2, 0x0002
     db3:	0100                	.insn	2, 0x0100
     db5:	090117c7          	.insn	4, 0x090117c7
     db9:	0000                	.insn	2, 0x0000
     dbb:	003e                	.insn	2, 0x003e
     dbd:	0000                	.insn	2, 0x0000
     dbf:	c701                	.insn	2, 0xc701
     dc1:	006c                	.insn	2, 0x006c
     dc3:	0000                	.insn	2, 0x0000
     dc5:	ea0e                	.insn	2, 0xea0e
     dc7:	0004                	.insn	2, 0x0004
     dc9:	3000                	.insn	2, 0x3000
     dcb:	400d                	.insn	2, 0x400d
     dcd:	0800                	.insn	2, 0x0800
     dcf:	0000                	.insn	2, 0x0000
     dd1:	0100                	.insn	2, 0x0100
     dd3:	05ca                	.insn	2, 0x05ca
     dd5:	041e                	.insn	2, 0x041e
     dd7:	000004f7          	.insn	4, 0x04f7
     ddb:	011d                	.insn	2, 0x011d
     ddd:	035a                	.insn	2, 0x035a
     ddf:	0005                	.insn	2, 0x0005
     de1:	2000                	.insn	2, 0x2000
     de3:	5a01                	.insn	2, 0x5a01
     de5:	0000050f          	.insn	4, 0x050f
     de9:	0421                	.insn	2, 0x0421
     deb:	0000051b          	.insn	4, 0x051b
     def:	0000                	.insn	2, 0x0000
     df1:	0012                	.insn	2, 0x0012
     df3:	0000                	.insn	2, 0x0000
     df5:	0100                	.insn	2, 0x0100
     df7:	01f4                	.insn	2, 0x01f4
     df9:	0190                	.insn	2, 0x0190
     dfb:	0000                	.insn	2, 0x0000
     dfd:	1301                	.insn	2, 0x1301
     dff:	01c1                	.insn	2, 0x01c1
     e01:	0000                	.insn	2, 0x0000
     e03:	f401                	.insn	2, 0xf401
     e05:	6101                	.insn	2, 0x6101
     e07:	0000                	.insn	2, 0x0000
     e09:	1300                	.insn	2, 0x1300
     e0b:	0322                	.insn	2, 0x0322
     e0d:	0000                	.insn	2, 0x0000
     e0f:	f401                	.insn	2, 0xf401
     e11:	6101                	.insn	2, 0x6101
     e13:	0000                	.insn	2, 0x0000
     e15:	1400                	.insn	2, 0x1400
     e17:	026c                	.insn	2, 0x026c
     e19:	0000                	.insn	2, 0x0000
     e1b:	f601                	.insn	2, 0xf601
     e1d:	6101                	.insn	2, 0x6101
     e1f:	0000                	.insn	2, 0x0000
     e21:	1400                	.insn	2, 0x1400
     e23:	0056                	.insn	2, 0x0056
     e25:	0000                	.insn	2, 0x0000
     e27:	f701                	.insn	2, 0xf701
     e29:	6101                	.insn	2, 0x6101
     e2b:	0000                	.insn	2, 0x0000
     e2d:	0000                	.insn	2, 0x0000
     e2f:	3c16                	.insn	2, 0x3c16
     e31:	400d                	.insn	2, 0x400d
     e33:	0c00                	.insn	2, 0x0c00
     e35:	0000                	.insn	2, 0x0000
     e37:	0100                	.insn	2, 0x0100
     e39:	d352                	.insn	2, 0xd352
     e3b:	0002                	.insn	2, 0x0002
     e3d:	0100                	.insn	2, 0x0100
     e3f:	17d2                	.insn	2, 0x17d2
     e41:	091c                	.insn	2, 0x091c
     e43:	0000                	.insn	2, 0x0000
     e45:	0342                	.insn	2, 0x0342
     e47:	0000                	.insn	2, 0x0000
     e49:	d201                	.insn	2, 0xd201
     e4b:	006c                	.insn	2, 0x006c
     e4d:	0000                	.insn	2, 0x0000
     e4f:	740e                	.insn	2, 0x740e
     e51:	0005                	.insn	2, 0x0005
     e53:	3c00                	.insn	2, 0x3c00
     e55:	400d                	.insn	2, 0x400d
     e57:	0800                	.insn	2, 0x0800
     e59:	0000                	.insn	2, 0x0000
     e5b:	0100                	.insn	2, 0x0100
     e5d:	05d5                	.insn	2, 0x05d5
     e5f:	051e                	.insn	2, 0x051e
     e61:	0581                	.insn	2, 0x0581
     e63:	0000                	.insn	2, 0x0000
     e65:	011d                	.insn	2, 0x011d
     e67:	8d5a                	.insn	2, 0x8d5a
     e69:	0005                	.insn	2, 0x0005
     e6b:	2000                	.insn	2, 0x2000
     e6d:	5a01                	.insn	2, 0x5a01
     e6f:	0599                	.insn	2, 0x0599
     e71:	0000                	.insn	2, 0x0000
     e73:	0521                	.insn	2, 0x0521
     e75:	05a5                	.insn	2, 0x05a5
     e77:	0000                	.insn	2, 0x0000
     e79:	0000                	.insn	2, 0x0000
     e7b:	d822                	.insn	2, 0xd822
     e7d:	0000                	.insn	2, 0x0000
     e7f:	0100                	.insn	2, 0x0100
     e81:	0214                	.insn	2, 0x0214
     e83:	1301                	.insn	2, 0x1301
     e85:	01c1                	.insn	2, 0x01c1
     e87:	0000                	.insn	2, 0x0000
     e89:	1401                	.insn	2, 0x1401
     e8b:	6102                	.insn	2, 0x6102
     e8d:	0000                	.insn	2, 0x0000
     e8f:	1300                	.insn	2, 0x1300
     e91:	0322                	.insn	2, 0x0322
     e93:	0000                	.insn	2, 0x0000
     e95:	1501                	.insn	2, 0x1501
     e97:	6102                	.insn	2, 0x6102
     e99:	0000                	.insn	2, 0x0000
     e9b:	1300                	.insn	2, 0x1300
     e9d:	0389                	.insn	2, 0x0389
     e9f:	0000                	.insn	2, 0x0000
     ea1:	1601                	.insn	2, 0x1601
     ea3:	6102                	.insn	2, 0x6102
     ea5:	0000                	.insn	2, 0x0000
     ea7:	1400                	.insn	2, 0x1400
     ea9:	026c                	.insn	2, 0x026c
     eab:	0000                	.insn	2, 0x0000
     ead:	1801                	.insn	2, 0x1801
     eaf:	6102                	.insn	2, 0x6102
     eb1:	0000                	.insn	2, 0x0000
     eb3:	1400                	.insn	2, 0x1400
     eb5:	000002eb          	.insn	4, 0x02eb
     eb9:	1901                	.insn	2, 0x1901
     ebb:	6102                	.insn	2, 0x6102
     ebd:	0000                	.insn	2, 0x0000
     ebf:	1400                	.insn	2, 0x1400
     ec1:	0056                	.insn	2, 0x0056
     ec3:	0000                	.insn	2, 0x0000
     ec5:	1a01                	.insn	2, 0x1a01
     ec7:	6102                	.insn	2, 0x6102
     ec9:	0000                	.insn	2, 0x0000
     ecb:	0000                	.insn	2, 0x0000
     ecd:	4816                	.insn	2, 0x4816
     ecf:	400d                	.insn	2, 0x400d
     ed1:	0c00                	.insn	2, 0x0c00
     ed3:	0000                	.insn	2, 0x0000
     ed5:	0100                	.insn	2, 0x0100
     ed7:	7552                	.insn	2, 0x7552
     ed9:	0001                	.insn	2, 0x0001
     edb:	0100                	.insn	2, 0x0100
     edd:	23dd                	.insn	2, 0x23dd
     edf:	5a01                	.insn	2, 0x5a01
     ee1:	0046                	.insn	2, 0x0046
     ee3:	0000                	.insn	2, 0x0000
     ee5:	dd01                	.insn	2, 0xdd01
     ee7:	0061                	.insn	2, 0x0061
     ee9:	0000                	.insn	2, 0x0000
     eeb:	2b5b0123          	sb	s5,674(s6)
     eef:	0000                	.insn	2, 0x0000
     ef1:	0100                	.insn	2, 0x0100
     ef3:	61dd                	.insn	2, 0x61dd
     ef5:	0000                	.insn	2, 0x0000
     ef7:	0e00                	.insn	2, 0x0e00
     ef9:	05fe                	.insn	2, 0x05fe
     efb:	0000                	.insn	2, 0x0000
     efd:	0d48                	.insn	2, 0x0d48
     eff:	0040                	.insn	2, 0x0040
     f01:	0008                	.insn	2, 0x0008
     f03:	0000                	.insn	2, 0x0000
     f05:	e001                	.insn	2, 0xe001
     f07:	1e05                	.insn	2, 0x1e05
     f09:	00060707          	.insn	4, 0x00060707
     f0d:	1d00                	.insn	2, 0x1d00
     f0f:	5a01                	.insn	2, 0x5a01
     f11:	00000613          	li	a2,0
     f15:	011d                	.insn	2, 0x011d
     f17:	00061f5b          	.insn	4, 0x00061f5b
     f1b:	2000                	.insn	2, 0x2000
     f1d:	5a01                	.insn	2, 0x5a01
     f1f:	0000062b          	.insn	4, 0x062b
     f23:	0120                	.insn	2, 0x0120
     f25:	0006375b          	.insn	4, 0x0006375b
     f29:	2100                	.insn	2, 0x2100
     f2b:	00064307          	.insn	4, 0x00064307
     f2f:	0000                	.insn	2, 0x0000
     f31:	2400                	.insn	2, 0x2400
     f33:	0d54                	.insn	2, 0x0d54
     f35:	0040                	.insn	2, 0x0040
     f37:	0034                	.insn	2, 0x0034
     f39:	0000                	.insn	2, 0x0000
     f3b:	5201                	.insn	2, 0x5201
     f3d:	0155                	.insn	2, 0x0155
     f3f:	0000                	.insn	2, 0x0000
     f41:	e801                	.insn	2, 0xe801
     f43:	0a08                	.insn	2, 0x0a08
     f45:	0000                	.insn	2, 0x0000
     f47:	3a5a0123          	sb	t0,930(s4)
     f4b:	0000                	.insn	2, 0x0000
     f4d:	0100                	.insn	2, 0x0100
     f4f:	08e8                	.insn	2, 0x08e8
     f51:	000a                	.insn	2, 0x000a
     f53:	1700                	.insn	2, 0x1700
     f55:	00000937          	lui	s2,0x0
     f59:	000001c7          	.insn	4, 0x01c7
     f5d:	e801                	.insn	2, 0xe801
     f5f:	0a3c                	.insn	2, 0x0a3c
     f61:	0000                	.insn	2, 0x0000
     f63:	5d1a                	.insn	2, 0x5d1a
     f65:	0009                	.insn	2, 0x0009
     f67:	f300                	.insn	2, 0xf300
     f69:	0002                	.insn	2, 0x0002
     f6b:	0100                	.insn	2, 0x0100
     f6d:	08e9                	.insn	2, 0x08e9
     f6f:	000a                	.insn	2, 0x000a
     f71:	0000                	.insn	2, 0x0000
     f73:	8824                	.insn	2, 0x8824
     f75:	400d                	.insn	2, 0x400d
     f77:	4000                	.insn	2, 0x4000
     f79:	0000                	.insn	2, 0x0000
     f7b:	0100                	.insn	2, 0x0100
     f7d:	cc52                	.insn	2, 0xcc52
     f7f:	0002                	.insn	2, 0x0002
     f81:	0100                	.insn	2, 0x0100
     f83:	73f0                	.insn	2, 0x73f0
     f85:	0000                	.insn	2, 0x0000
     f87:	1700                	.insn	2, 0x1700
     f89:	098e                	.insn	2, 0x098e
     f8b:	0000                	.insn	2, 0x0000
     f8d:	0104                	.insn	2, 0x0104
     f8f:	0000                	.insn	2, 0x0000
     f91:	f001                	.insn	2, 0xf001
     f93:	0a3c                	.insn	2, 0x0a3c
     f95:	0000                	.insn	2, 0x0000
     f97:	0009cc17          	auipc	s8,0x9c
     f9b:	9900                	.insn	2, 0x9900
     f9d:	0002                	.insn	2, 0x0002
     f9f:	0100                	.insn	2, 0x0100
     fa1:	3cf0                	.insn	2, 0x3cf0
     fa3:	000a                	.insn	2, 0x000a
     fa5:	0000                	.insn	2, 0x0000
     fa7:	c816                	.insn	2, 0xc816
     fa9:	400d                	.insn	2, 0x400d
     fab:	0800                	.insn	2, 0x0800
     fad:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     fb1:	3152                	.insn	2, 0x3152
     fb3:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     fb7:	09e717fb          	.insn	4, 0x09e717fb
     fbb:	0000                	.insn	2, 0x0000
     fbd:	0349                	.insn	2, 0x0349
     fbf:	0000                	.insn	2, 0x0000
     fc1:	fb01                	.insn	2, 0xfb01
     fc3:	0a3c                	.insn	2, 0x0a3c
     fc5:	0000                	.insn	2, 0x0000
     fc7:	0218                	.insn	2, 0x0218
     fc9:	1891                	.insn	2, 0x1891
     fcb:	038e                	.insn	2, 0x038e
     fcd:	0000                	.insn	2, 0x0000
     fcf:	fc01                	.insn	2, 0xfc01
     fd1:	0a46                	.insn	2, 0x0a46
     fd3:	0000                	.insn	2, 0x0000
     fd5:	1825                	.insn	2, 0x1825
     fd7:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     fdb:	0141                	.insn	2, 0x0141
     fdd:	1094                	.insn	2, 0x1094
     fdf:	0040                	.insn	2, 0x0040
     fe1:	c826                	.insn	2, 0xc826
     fe3:	0001                	.insn	2, 0x0001
     fe5:	2700                	.insn	2, 0x2700
     fe7:	9102                	.insn	2, 0x9102
     fe9:	b20d                	.insn	2, 0xb20d
     feb:	0000                	.insn	2, 0x0000
     fed:	0100                	.insn	2, 0x0100
     fef:	011e                	.insn	2, 0x011e
     ff1:	0a50                	.insn	2, 0x0a50
     ff3:	0000                	.insn	2, 0x0000
     ff5:	0d28                	.insn	2, 0x0d28
     ff7:	000a                	.insn	2, 0x000a
     ff9:	5a00                	.insn	2, 0x5a00
     ffb:	0002                	.insn	2, 0x0002
     ffd:	0100                	.insn	2, 0x0100
     fff:	0112                	.insn	2, 0x0112
    1001:	00000073          	ecall
    1005:	3328                	.insn	2, 0x3328
    1007:	000a                	.insn	2, 0x000a
    1009:	5900                	.insn	2, 0x5900
    100b:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    100f:	0114                	.insn	2, 0x0114
    1011:	006c                	.insn	2, 0x006c
    1013:	0000                	.insn	2, 0x0000
    1015:	6f28                	.insn	2, 0x6f28
    1017:	000a                	.insn	2, 0x000a
    1019:	3800                	.insn	2, 0x3800
    101b:	0000                	.insn	2, 0x0000
    101d:	0100                	.insn	2, 0x0100
    101f:	011f 0073 0000      	.insn	6, 0x0073011f
    1025:	9b29                	.insn	2, 0x9b29
    1027:	0001                	.insn	2, 0x0001
    1029:	a800                	.insn	2, 0xa800
    102b:	400e                	.insn	2, 0x400e
    102d:	1000                	.insn	2, 0x1000
    102f:	0000                	.insn	2, 0x0000
    1031:	0100                	.insn	2, 0x0100
    1033:	1e190123          	sb	ra,482(s2) # 1e2 <$d.4+0x17>
    1037:	a430                	.insn	2, 0xa430
    1039:	0001                	.insn	2, 0x0001
    103b:	0000                	.insn	2, 0x0000
    103d:	9b29                	.insn	2, 0x9b29
    103f:	0001                	.insn	2, 0x0001
    1041:	0400                	.insn	2, 0x0400
    1043:	4010                	.insn	2, 0x4010
    1045:	1000                	.insn	2, 0x1000
    1047:	0000                	.insn	2, 0x0000
    1049:	0100                	.insn	2, 0x0100
    104b:	0116                	.insn	2, 0x0116
    104d:	1e19                	.insn	2, 0x1e19
    104f:	a42d                	.insn	2, 0xa42d
    1051:	0001                	.insn	2, 0x0001
    1053:	0000                	.insn	2, 0x0000
    1055:	9b2a                	.insn	2, 0x9b2a
    1057:	0001                	.insn	2, 0x0001
    1059:	6800                	.insn	2, 0x6800
    105b:	4010                	.insn	2, 0x4010
    105d:	0c00                	.insn	2, 0x0c00
    105f:	0000                	.insn	2, 0x0000
    1061:	0100                	.insn	2, 0x0100
    1063:	012e                	.insn	2, 0x012e
    1065:	0019                	.insn	2, 0x0019
    1067:	c819                	.insn	2, 0xc819
    1069:	400e                	.insn	2, 0x400e
    106b:	e800                	.insn	2, 0xe800
    106d:	0000                	.insn	2, 0x0000
    106f:	2800                	.insn	2, 0x2800
    1071:	0b34                	.insn	2, 0x0b34
    1073:	0000                	.insn	2, 0x0000
    1075:	025a                	.insn	2, 0x025a
    1077:	0000                	.insn	2, 0x0000
    1079:	3301                	.insn	2, 0x3301
    107b:	6c01                	.insn	2, 0x6c01
    107d:	0000                	.insn	2, 0x0000
    107f:	1900                	.insn	2, 0x1900
    1081:	0ed8                	.insn	2, 0x0ed8
    1083:	0040                	.insn	2, 0x0040
    1085:	00d8                	.insn	2, 0x00d8
    1087:	0000                	.insn	2, 0x0000
    1089:	af28                	.insn	2, 0xaf28
    108b:	000a                	.insn	2, 0x000a
    108d:	3800                	.insn	2, 0x3800
    108f:	0000                	.insn	2, 0x0000
    1091:	0100                	.insn	2, 0x0100
    1093:	0134                	.insn	2, 0x0134
    1095:	00000073          	ecall
    1099:	d819                	.insn	2, 0xd819
    109b:	400e                	.insn	2, 0x400e
    109d:	d800                	.insn	2, 0xd800
    109f:	0000                	.insn	2, 0x0000
    10a1:	2800                	.insn	2, 0x2800
    10a3:	00000b4f          	.insn	4, 0x0b4f
    10a7:	0116                	.insn	2, 0x0116
    10a9:	0000                	.insn	2, 0x0000
    10ab:	3501                	.insn	2, 0x3501
    10ad:	6c01                	.insn	2, 0x6c01
    10af:	0000                	.insn	2, 0x0000
    10b1:	2b00                	.insn	2, 0x2b00
    10b3:	0000019b          	.insn	4, 0x019b
    10b7:	01e0                	.insn	2, 0x01e0
    10b9:	0000                	.insn	2, 0x0000
    10bb:	3601                	.insn	2, 0x3601
    10bd:	1901                	.insn	2, 0x1901
    10bf:	0000                	.insn	2, 0x0000
    10c1:	2900                	.insn	2, 0x2900
    10c3:	0000019b          	.insn	4, 0x019b
    10c7:	0fb8                	.insn	2, 0x0fb8
    10c9:	0040                	.insn	2, 0x0040
    10cb:	000c                	.insn	2, 0x000c
    10cd:	0000                	.insn	2, 0x0000
    10cf:	0701                	.insn	2, 0x0701
    10d1:	1501                	.insn	2, 0x1501
    10d3:	251e                	.insn	2, 0x251e
    10d5:	01a4                	.insn	2, 0x01a4
    10d7:	0000                	.insn	2, 0x0000
    10d9:	1900                	.insn	2, 0x1900
    10db:	0fcc                	.insn	2, 0x0fcc
    10dd:	0040                	.insn	2, 0x0040
    10df:	0038                	.insn	2, 0x0038
    10e1:	0000                	.insn	2, 0x0000
    10e3:	b728                	.insn	2, 0xb728
    10e5:	0700000b          	.insn	4, 0x0700000b
    10e9:	0001                	.insn	2, 0x0001
    10eb:	0100                	.insn	2, 0x0100
    10ed:	010a                	.insn	2, 0x010a
    10ef:	0a3c                	.insn	2, 0x0a3c
    10f1:	0000                	.insn	2, 0x0000
    10f3:	9b29                	.insn	2, 0x9b29
    10f5:	0001                	.insn	2, 0x0001
    10f7:	e800                	.insn	2, 0xe800
    10f9:	0c00400f          	.insn	4, 0x0c00400f
    10fd:	0000                	.insn	2, 0x0000
    10ff:	0100                	.insn	2, 0x0100
    1101:	010c                	.insn	2, 0x010c
    1103:	1d19                	.insn	2, 0x1d19
    1105:	5b01                	.insn	2, 0x5b01
    1107:	01a4                	.insn	2, 0x01a4
    1109:	0000                	.insn	2, 0x0000
    110b:	0000                	.insn	2, 0x0000
    110d:	9b29                	.insn	2, 0x9b29
    110f:	0001                	.insn	2, 0x0001
    1111:	8800                	.insn	2, 0x8800
    1113:	4010                	.insn	2, 0x4010
    1115:	0c00                	.insn	2, 0x0c00
    1117:	0000                	.insn	2, 0x0000
    1119:	0100                	.insn	2, 0x0100
    111b:	0104                	.insn	2, 0x0104
    111d:	1e15                	.insn	2, 0x1e15
    111f:	a425                	.insn	2, 0xa425
    1121:	0001                	.insn	2, 0x0001
    1123:	0000                	.insn	2, 0x0000
    1125:	9b29                	.insn	2, 0x9b29
    1127:	0001                	.insn	2, 0x0001
    1129:	6800                	.insn	2, 0x6800
    112b:	400e                	.insn	2, 0x400e
    112d:	0c00                	.insn	2, 0x0c00
    112f:	0000                	.insn	2, 0x0000
    1131:	0100                	.insn	2, 0x0100
    1133:	1d0d013b          	.insn	4, 0x1d0d013b
    1137:	5b01                	.insn	2, 0x5b01
    1139:	01a4                	.insn	2, 0x01a4
    113b:	0000                	.insn	2, 0x0000
    113d:	2c00                	.insn	2, 0x2c00
    113f:	2d00                	.insn	2, 0x2d00
    1141:	10d0                	.insn	2, 0x10d0
    1143:	0040                	.insn	2, 0x0040
    1145:	00f0                	.insn	2, 0x00f0
    1147:	0000                	.insn	2, 0x0000
    1149:	5201                	.insn	2, 0x5201
    114b:	00000377          	.insn	4, 0x0377
    114f:	4901                	.insn	2, 0x4901
    1151:	6c01                	.insn	2, 0x6c01
    1153:	0000                	.insn	2, 0x0000
    1155:	2e00                	.insn	2, 0x2e00
    1157:	0bea                	.insn	2, 0x0bea
    1159:	0000                	.insn	2, 0x0000
    115b:	00000107          	.insn	4, 0x0107
    115f:	4901                	.insn	2, 0x4901
    1161:	3c01                	.insn	2, 0x3c01
    1163:	000a                	.insn	2, 0x000a
    1165:	2800                	.insn	2, 0x2800
    1167:	00000c1b          	.insn	4, 0x0c1b
    116b:	015c                	.insn	2, 0x015c
    116d:	0000                	.insn	2, 0x0000
    116f:	4a01                	.insn	2, 0x4a01
    1171:	6c01                	.insn	2, 0x6c01
    1173:	0000                	.insn	2, 0x0000
    1175:	2800                	.insn	2, 0x2800
    1177:	0c5a                	.insn	2, 0x0c5a
    1179:	0000                	.insn	2, 0x0000
    117b:	00c1                	.insn	2, 0x00c1
    117d:	0000                	.insn	2, 0x0000
    117f:	4f01                	.insn	2, 0x4f01
    1181:	6c01                	.insn	2, 0x6c01
    1183:	0000                	.insn	2, 0x0000
    1185:	2600                	.insn	2, 0x2600
    1187:	0228                	.insn	2, 0x0228
    1189:	0000                	.insn	2, 0x0000
    118b:	8c28                	.insn	2, 0x8c28
    118d:	000c                	.insn	2, 0x000c
    118f:	f200                	.insn	2, 0xf200
    1191:	0000                	.insn	2, 0x0000
    1193:	0100                	.insn	2, 0x0100
    1195:	0151                	.insn	2, 0x0151
    1197:	0040                	.insn	2, 0x0040
    1199:	0000                	.insn	2, 0x0000
    119b:	a728                	.insn	2, 0xa728
    119d:	000c                	.insn	2, 0x000c
    119f:	f300                	.insn	2, 0xf300
    11a1:	0002                	.insn	2, 0x0002
    11a3:	0100                	.insn	2, 0x0100
    11a5:	0152                	.insn	2, 0x0152
    11a7:	006c                	.insn	2, 0x006c
    11a9:	0000                	.insn	2, 0x0000
    11ab:	0000                	.insn	2, 0x0000
    11ad:	c02d                	.insn	2, 0xc02d
    11af:	4011                	.insn	2, 0x4011
    11b1:	8400                	.insn	2, 0x8400
    11b3:	0000                	.insn	2, 0x0000
    11b5:	0100                	.insn	2, 0x0100
    11b7:	3252                	.insn	2, 0x3252
    11b9:	0002                	.insn	2, 0x0002
    11bb:	0100                	.insn	2, 0x0100
    11bd:	015e                	.insn	2, 0x015e
    11bf:	0a0d                	.insn	2, 0x0a0d
    11c1:	0000                	.insn	2, 0x0000
    11c3:	c22e                	.insn	2, 0xc22e
    11c5:	000c                	.insn	2, 0x000c
    11c7:	7500                	.insn	2, 0x7500
    11c9:	0000                	.insn	2, 0x0000
    11cb:	0100                	.insn	2, 0x0100
    11cd:	015e                	.insn	2, 0x015e
    11cf:	006c                	.insn	2, 0x006c
    11d1:	0000                	.insn	2, 0x0000
    11d3:	f019                	.insn	2, 0xf019
    11d5:	4011                	.insn	2, 0x4011
    11d7:	3c00                	.insn	2, 0x3c00
    11d9:	0000                	.insn	2, 0x0000
    11db:	2800                	.insn	2, 0x2800
    11dd:	00000cf3          	.insn	4, 0x0cf3
    11e1:	0038                	.insn	2, 0x0038
    11e3:	0000                	.insn	2, 0x0000
    11e5:	6201                	.insn	2, 0x6201
    11e7:	6c01                	.insn	2, 0x6c01
    11e9:	0000                	.insn	2, 0x0000
    11eb:	0000                	.insn	2, 0x0000
    11ed:	2d00                	.insn	2, 0x2d00
    11ef:	1244                	.insn	2, 0x1244
    11f1:	0040                	.insn	2, 0x0040
    11f3:	0014                	.insn	2, 0x0014
    11f5:	0000                	.insn	2, 0x0000
    11f7:	5201                	.insn	2, 0x5201
    11f9:	02a6                	.insn	2, 0x02a6
    11fb:	0000                	.insn	2, 0x0000
    11fd:	af01                	.insn	2, 0xaf01
    11ff:	7301                	.insn	2, 0x7301
    1201:	0000                	.insn	2, 0x0000
    1203:	2800                	.insn	2, 0x2800
    1205:	0d32                	.insn	2, 0x0d32
    1207:	0000                	.insn	2, 0x0000
    1209:	0386                	.insn	2, 0x0386
    120b:	0000                	.insn	2, 0x0000
    120d:	b101                	.insn	2, 0xb101
    120f:	7301                	.insn	2, 0x7301
    1211:	0000                	.insn	2, 0x0000
    1213:	0000                	.insn	2, 0x0000
    1215:	582d                	.insn	2, 0x582d
    1217:	4012                	.insn	2, 0x4012
    1219:	0c00                	.insn	2, 0x0c00
    121b:	0000                	.insn	2, 0x0000
    121d:	0100                	.insn	2, 0x0100
    121f:	6f52                	.insn	2, 0x6f52
    1221:	0002                	.insn	2, 0x0002
    1223:	0100                	.insn	2, 0x0100
    1225:	00730203          	lb	tp,7(t1) # 3a0e0588 <USER_MAX+0x39be0588>
    1229:	0000                	.insn	2, 0x0000
    122b:	4d2e                	.insn	2, 0x4d2e
    122d:	000d                	.insn	2, 0x000d
    122f:	4200                	.insn	2, 0x4200
    1231:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1235:	00610203          	lb	tp,6(sp) # 1335a7 <$d.5+0x1322cd>
    1239:	0000                	.insn	2, 0x0000
    123b:	b25b012f          	.insn	4, 0xb25b012f
    123f:	0000                	.insn	2, 0x0000
    1241:	0100                	.insn	2, 0x0100
    1243:	0a4f0203          	lb	tp,164(t5)
    1247:	0000                	.insn	2, 0x0000
    1249:	6c5a0127          	.insn	4, 0x6c5a0127
    124d:	0002                	.insn	2, 0x0002
    124f:	0100                	.insn	2, 0x0100
    1251:	0205                	.insn	2, 0x0205
    1253:	0061                	.insn	2, 0x0061
    1255:	0000                	.insn	2, 0x0000
    1257:	eb5b0127          	.insn	4, 0xeb5b0127
    125b:	0002                	.insn	2, 0x0002
    125d:	0100                	.insn	2, 0x0100
    125f:	0206                	.insn	2, 0x0206
    1261:	0061                	.insn	2, 0x0061
    1263:	0000                	.insn	2, 0x0000
    1265:	0630                	.insn	2, 0x0630
    1267:	0056                	.insn	2, 0x0056
    1269:	0000                	.insn	2, 0x0000
    126b:	0701                	.insn	2, 0x0701
    126d:	6102                	.insn	2, 0x6102
    126f:	0000                	.insn	2, 0x0000
    1271:	0000                	.insn	2, 0x0000
    1273:	0031                	.insn	2, 0x0031
    1275:	4000                	.insn	2, 0x4000
    1277:	1c00                	.insn	2, 0x1c00
    1279:	0000                	.insn	2, 0x0000
    127b:	0100                	.insn	2, 0x0100
    127d:	0752                	.insn	2, 0x0752
    127f:	0000                	.insn	2, 0x0000
    1281:	0100                	.insn	2, 0x0100
    1283:	0229                	.insn	2, 0x0229
    1285:	4009                	.insn	2, 0x4009
    1287:	0000                	.insn	2, 0x0000
    1289:	0800                	.insn	2, 0x0800
    128b:	00000073          	ecall
    128f:	00aa                	.insn	2, 0x00aa
    1291:	0000                	.insn	2, 0x0000
    1293:	4e030e03          	lb	t3,1248(t1)
    1297:	0000                	.insn	2, 0x0000
    1299:	0400                	.insn	2, 0x0400
    129b:	00000047          	.insn	4, 0x0047
    129f:	0404                	.insn	2, 0x0404
    12a1:	00000047          	.insn	4, 0x0047
    12a5:	0004                	.insn	2, 0x0004
    12a7:	00006103          	.insn	4, 0x6103
    12ab:	0400                	.insn	2, 0x0400
    12ad:	00000047          	.insn	4, 0x0047
    12b1:	0404                	.insn	2, 0x0404
    12b3:	00000047          	.insn	4, 0x0047
    12b7:	0004                	.insn	2, 0x0004
    12b9:	4109                	.insn	2, 0x4109
    12bb:	000a                	.insn	2, 0x000a
    12bd:	3200                	.insn	2, 0x3200
    12bf:	0040                	.insn	2, 0x0040
    12c1:	0000                	.insn	2, 0x0000
    12c3:	000a4f33          	xor	t5,s4,zero
    12c7:	fd00                	.insn	2, 0xfd00
    12c9:	0002                	.insn	2, 0x0002
    12cb:	3400                	.insn	2, 0x3400
    12cd:	00004003          	lbu	zero,0(zero) # 0 <$d.4>
    12d1:	0400                	.insn	2, 0x0400
    12d3:	00000047          	.insn	4, 0x0047
    12d7:	          	.insn	4, 0x5f00000b

000012da <$d.5>:
    12da:	055f 0000 0004      	.insn	6, 0x00040000055f
    12e0:	0000048f          	.insn	4, 0x048f
    12e4:	0104                	.insn	2, 0x0104
    12e6:	0126                	.insn	2, 0x0126
    12e8:	0000                	.insn	2, 0x0000
    12ea:	001d                	.insn	2, 0x001d
    12ec:	0161                	.insn	2, 0x0161
    12ee:	0000                	.insn	2, 0x0000
    12f0:	0ff4                	.insn	2, 0x0ff4
    12f2:	0000                	.insn	2, 0x0000
    12f4:	01fd                	.insn	2, 0x01fd
    12f6:	0000                	.insn	2, 0x0000
    12f8:	1264                	.insn	2, 0x1264
    12fa:	0040                	.insn	2, 0x0040
    12fc:	0764                	.insn	2, 0x0764
    12fe:	0000                	.insn	2, 0x0000
    1300:	3302                	.insn	2, 0x3302
    1302:	0000                	.insn	2, 0x0000
    1304:	0100                	.insn	2, 0x0100
    1306:	0512                	.insn	2, 0x0512
    1308:	401d1503          	lh	a0,1025(s10)
    130c:	0300                	.insn	2, 0x0300
    130e:	0000003f 00004604 	.insn	8, 0x46040000003f
    1316:	1000                	.insn	2, 0x1000
    1318:	0500                	.insn	2, 0x0500
    131a:	01e8                	.insn	2, 0x01e8
    131c:	0000                	.insn	2, 0x0000
    131e:	0108                	.insn	2, 0x0108
    1320:	ae06                	.insn	2, 0xae06
    1322:	0002                	.insn	2, 0x0002
    1324:	0800                	.insn	2, 0x0800
    1326:	005a0207          	.insn	4, 0x005a0207
    132a:	0000                	.insn	2, 0x0000
    132c:	d601                	.insn	2, 0xd601
    132e:	0305                	.insn	2, 0x0305
    1330:	1b9c                	.insn	2, 0x1b9c
    1332:	0040                	.insn	2, 0x0040
    1334:	00003f03          	.insn	4, 0x3f03
    1338:	0400                	.insn	2, 0x0400
    133a:	0046                	.insn	2, 0x0046
    133c:	0000                	.insn	2, 0x0000
    133e:	0009                	.insn	2, 0x0009
    1340:	3302                	.insn	2, 0x3302
    1342:	0000                	.insn	2, 0x0000
    1344:	0100                	.insn	2, 0x0100
    1346:	05e9                	.insn	2, 0x05e9
    1348:	401cae03          	lw	t3,1025(s9)
    134c:	0700                	.insn	2, 0x0700
    134e:	00000183          	lb	gp,0(zero) # 0 <$d.4>
    1352:	0084                	.insn	2, 0x0084
    1354:	0000                	.insn	2, 0x0000
    1356:	0301                	.insn	2, 0x0301
    1358:	0305                	.insn	2, 0x0305
    135a:	1d38                	.insn	2, 0x1d38
    135c:	0040                	.insn	2, 0x0040
    135e:	00009103          	lh	sp,0(ra)
    1362:	0800                	.insn	2, 0x0800
    1364:	0046                	.insn	2, 0x0046
    1366:	0000                	.insn	2, 0x0000
    1368:	0200                	.insn	2, 0x0200
    136a:	0900                	.insn	2, 0x0900
    136c:	009c                	.insn	2, 0x009c
    136e:	0000                	.insn	2, 0x0000
    1370:	02f5                	.insn	2, 0x02f5
    1372:	0000                	.insn	2, 0x0000
    1374:	0f02                	.insn	2, 0x0f02
    1376:	d005                	.insn	2, 0xd005
    1378:	0001                	.insn	2, 0x0001
    137a:	0800                	.insn	2, 0x0800
    137c:	0a01                	.insn	2, 0x0a01
    137e:	016d                	.insn	2, 0x016d
    1380:	0000                	.insn	2, 0x0000
    1382:	00b4                	.insn	2, 0x00b4
    1384:	0000                	.insn	2, 0x0000
    1386:	0501                	.insn	2, 0x0501
    1388:	0305                	.insn	2, 0x0305
    138a:	1f38                	.insn	2, 0x1f38
    138c:	0040                	.insn	2, 0x0040
    138e:	bf09                	.insn	2, 0xbf09
    1390:	0000                	.insn	2, 0x0000
    1392:	9c00                	.insn	2, 0x9c00
    1394:	0001                	.insn	2, 0x0001
    1396:	0300                	.insn	2, 0x0300
    1398:	0b0c                	.insn	2, 0x0b0c
    139a:	0314                	.insn	2, 0x0314
    139c:	0c06                	.insn	2, 0x0c06
    139e:	011d                	.insn	2, 0x011d
    13a0:	0000                	.insn	2, 0x0000
    13a2:	0100                	.insn	2, 0x0100
    13a4:	0000                	.insn	2, 0x0000
    13a6:	0c000703          	lb	a4,192(zero) # c0 <$d.10+0x4c>
    13aa:	01de                	.insn	2, 0x01de
    13ac:	0000                	.insn	2, 0x0000
    13ae:	0100                	.insn	2, 0x0100
    13b0:	0000                	.insn	2, 0x0000
    13b2:	0c040803          	lb	a6,192(s0)
    13b6:	00b6                	.insn	2, 0x00b6
    13b8:	0000                	.insn	2, 0x0000
    13ba:	0100                	.insn	2, 0x0100
    13bc:	0000                	.insn	2, 0x0000
    13be:	0c080903          	lb	s2,192(a6)
    13c2:	0091                	.insn	2, 0x0091
    13c4:	0000                	.insn	2, 0x0000
    13c6:	0100                	.insn	2, 0x0100
    13c8:	0000                	.insn	2, 0x0000
    13ca:	0c0c0a03          	lb	s4,192(s8) # 9d057 <$d.5+0x9bd7d>
    13ce:	0000035b          	.insn	4, 0x035b
    13d2:	0100                	.insn	2, 0x0100
    13d4:	0000                	.insn	2, 0x0000
    13d6:	00100b03          	lb	s6,1(zero) # 1 <$d.4+0x1>
    13da:	0b09                	.insn	2, 0x0b09
    13dc:	0001                	.insn	2, 0x0001
    13de:	9300                	.insn	2, 0x9300
    13e0:	0001                	.insn	2, 0x0001
    13e2:	0200                	.insn	2, 0x0200
    13e4:	0511                	.insn	2, 0x0511
    13e6:	0284                	.insn	2, 0x0284
    13e8:	0000                	.insn	2, 0x0000
    13ea:	e10d0407          	.insn	4, 0xe10d0407
    13ee:	0000                	.insn	2, 0x0000
    13f0:	0100                	.insn	2, 0x0100
    13f2:	0079                	.insn	2, 0x0079
    13f4:	0001                	.insn	2, 0x0001
    13f6:	0100                	.insn	2, 0x0100
    13f8:	9e0e                	.insn	2, 0x9e0e
    13fa:	0000                	.insn	2, 0x0000
    13fc:	0100                	.insn	2, 0x0100
    13fe:	0079                	.insn	2, 0x0079
    1400:	0001                	.insn	2, 0x0001
    1402:	0000                	.insn	2, 0x0000
    1404:	4012640f          	.insn	4, 0x4012640f
    1408:	f000                	.insn	2, 0xf000
    140a:	0000                	.insn	2, 0x0000
    140c:	0100                	.insn	2, 0x0100
    140e:	1652                	.insn	2, 0x1652
    1410:	0000                	.insn	2, 0x0000
    1412:	0100                	.insn	2, 0x0100
    1414:	0003a607          	.insn	4, 0x0003a607
    1418:	1000                	.insn	2, 0x1000
    141a:	0d68                	.insn	2, 0x0d68
    141c:	0000                	.insn	2, 0x0000
    141e:	02ee                	.insn	2, 0x02ee
    1420:	0000                	.insn	2, 0x0000
    1422:	0701                	.insn	2, 0x0701
    1424:	0386                	.insn	2, 0x0386
    1426:	0000                	.insn	2, 0x0000
    1428:	0211                	.insn	2, 0x0211
    142a:	1491                	.insn	2, 0x1491
    142c:	00b2                	.insn	2, 0x00b2
    142e:	0000                	.insn	2, 0x0000
    1430:	0901                	.insn	2, 0x0901
    1432:	0084                	.insn	2, 0x0084
    1434:	0000                	.insn	2, 0x0000
    1436:	0211                	.insn	2, 0x0211
    1438:	1091                	.insn	2, 0x1091
    143a:	009e                	.insn	2, 0x009e
    143c:	0000                	.insn	2, 0x0000
    143e:	0b01                	.insn	2, 0x0b01
    1440:	0100                	.insn	2, 0x0100
    1442:	0000                	.insn	2, 0x0000
    1444:	0211                	.insn	2, 0x0211
    1446:	0c91                	.insn	2, 0x0c91
    1448:	0352                	.insn	2, 0x0352
    144a:	0000                	.insn	2, 0x0000
    144c:	0c01                	.insn	2, 0x0c01
    144e:	0100                	.insn	2, 0x0100
    1450:	0000                	.insn	2, 0x0000
    1452:	9912                	.insn	2, 0x9912
    1454:	000d                	.insn	2, 0x000d
    1456:	a600                	.insn	2, 0xa600
    1458:	0000                	.insn	2, 0x0000
    145a:	0100                	.insn	2, 0x0100
    145c:	0016                	.insn	2, 0x0016
    145e:	0001                	.insn	2, 0x0001
    1460:	1300                	.insn	2, 0x1300
    1462:	0112                	.insn	2, 0x0112
    1464:	0000                	.insn	2, 0x0000
    1466:	12c0                	.insn	2, 0x12c0
    1468:	0040                	.insn	2, 0x0040
    146a:	0020                	.insn	2, 0x0020
    146c:	0000                	.insn	2, 0x0000
    146e:	1701                	.insn	2, 0x1701
    1470:	1409                	.insn	2, 0x1409
    1472:	0d86                	.insn	2, 0x0d86
    1474:	0000                	.insn	2, 0x0000
    1476:	011e                	.insn	2, 0x011e
    1478:	0000                	.insn	2, 0x0000
    147a:	1500                	.insn	2, 0x1500
    147c:	12fc                	.insn	2, 0x12fc
    147e:	0040                	.insn	2, 0x0040
    1480:	0034                	.insn	2, 0x0034
    1482:	0000                	.insn	2, 0x0000
    1484:	ac12                	.insn	2, 0xac12
    1486:	000d                	.insn	2, 0x000d
    1488:	3800                	.insn	2, 0x3800
    148a:	0000                	.insn	2, 0x0000
    148c:	0100                	.insn	2, 0x0100
    148e:	001c                	.insn	2, 0x001c
    1490:	0001                	.insn	2, 0x0001
    1492:	0000                	.insn	2, 0x0000
    1494:	f116                	.insn	2, 0xf116
    1496:	0001                	.insn	2, 0x0001
    1498:	8000                	.insn	2, 0x8000
    149a:	4012                	.insn	2, 0x4012
    149c:	1600                	.insn	2, 0x1600
    149e:	0255                	.insn	2, 0x0255
    14a0:	0000                	.insn	2, 0x0000
    14a2:	12a0                	.insn	2, 0x12a0
    14a4:	0040                	.insn	2, 0x0040
    14a6:	7816                	.insn	2, 0x7816
    14a8:	b4000003          	lb	zero,-1216(zero) # fffffb40 <USER_MAX+0xffaffb40>
    14ac:	4012                	.insn	2, 0x4012
    14ae:	1600                	.insn	2, 0x1600
    14b0:	0390                	.insn	2, 0x0390
    14b2:	0000                	.insn	2, 0x0000
    14b4:	12ec                	.insn	2, 0x12ec
    14b6:	0040                	.insn	2, 0x0040
    14b8:	ae16                	.insn	2, 0xae16
    14ba:	28000003          	lb	zero,640(zero) # 280 <$d.6+0x28>
    14be:	16004013          	xori	zero,zero,352
    14c2:	03ae                	.insn	2, 0x03ae
    14c4:	0000                	.insn	2, 0x0000
    14c6:	133c                	.insn	2, 0x133c
    14c8:	0040                	.insn	2, 0x0040
    14ca:	0f00                	.insn	2, 0x0f00
    14cc:	1354                	.insn	2, 0x1354
    14ce:	0040                	.insn	2, 0x0040
    14d0:	012c                	.insn	2, 0x012c
    14d2:	0000                	.insn	2, 0x0000
    14d4:	5201                	.insn	2, 0x5201
    14d6:	0085                	.insn	2, 0x0085
    14d8:	0000                	.insn	2, 0x0000
    14da:	8001                	.insn	2, 0x8001
    14dc:	03a6                	.insn	2, 0x03a6
    14de:	0000                	.insn	2, 0x0000
    14e0:	e312                	.insn	2, 0xe312
    14e2:	000d                	.insn	2, 0x000d
    14e4:	b200                	.insn	2, 0xb200
    14e6:	0000                	.insn	2, 0x0000
    14e8:	0100                	.insn	2, 0x0100
    14ea:	4c82                	.insn	2, 0x4c82
    14ec:	0005                	.insn	2, 0x0005
    14ee:	1200                	.insn	2, 0x1200
    14f0:	0df6                	.insn	2, 0x0df6
    14f2:	0000                	.insn	2, 0x0000
    14f4:	01a9                	.insn	2, 0x01a9
    14f6:	0000                	.insn	2, 0x0000
    14f8:	9001                	.insn	2, 0x9001
    14fa:	0100                	.insn	2, 0x0100
    14fc:	0000                	.insn	2, 0x0000
    14fe:	0912                	.insn	2, 0x0912
    1500:	000e                	.insn	2, 0x000e
    1502:	3b00                	.insn	2, 0x3b00
    1504:	0002                	.insn	2, 0x0002
    1506:	0100                	.insn	2, 0x0100
    1508:	00010097          	auipc	ra,0x10
    150c:	1200                	.insn	2, 0x1200
    150e:	0e1c                	.insn	2, 0x0e1c
    1510:	0000                	.insn	2, 0x0000
    1512:	00000327          	.insn	4, 0x0327
    1516:	9401                	.insn	2, 0x9401
    1518:	0100                	.insn	2, 0x0100
    151a:	0000                	.insn	2, 0x0000
    151c:	9016                	.insn	2, 0x9016
    151e:	80000003          	lb	zero,-2048(zero) # fffff800 <USER_MAX+0xffaff800>
    1522:	16004013          	xori	zero,zero,352
    1526:	0390                	.insn	2, 0x0390
    1528:	0000                	.insn	2, 0x0000
    152a:	13c4                	.insn	2, 0x13c4
    152c:	0040                	.insn	2, 0x0040
    152e:	0f00                	.insn	2, 0x0f00
    1530:	1480                	.insn	2, 0x1480
    1532:	0040                	.insn	2, 0x0040
    1534:	02a8                	.insn	2, 0x02a8
    1536:	0000                	.insn	2, 0x0000
    1538:	5201                	.insn	2, 0x5201
    153a:	0109                	.insn	2, 0x0109
    153c:	0000                	.insn	2, 0x0000
    153e:	2901                	.insn	2, 0x2901
    1540:	03a6                	.insn	2, 0x03a6
    1542:	0000                	.insn	2, 0x0000
    1544:	2f10                	.insn	2, 0x2f10
    1546:	000e                	.insn	2, 0x000e
    1548:	ee00                	.insn	2, 0xee00
    154a:	0002                	.insn	2, 0x0002
    154c:	0100                	.insn	2, 0x0100
    154e:	862a                	.insn	2, 0x862a
    1550:	10000003          	lb	zero,256(zero) # 100 <$d.6+0x10>
    1554:	0e58                	.insn	2, 0x0e58
    1556:	0000                	.insn	2, 0x0000
    1558:	009e                	.insn	2, 0x009e
    155a:	0000                	.insn	2, 0x0000
    155c:	2b01                	.insn	2, 0x2b01
    155e:	055d                	.insn	2, 0x055d
    1560:	0000                	.insn	2, 0x0000
    1562:	8110                	.insn	2, 0x8110
    1564:	000e                	.insn	2, 0x000e
    1566:	5200                	.insn	2, 0x5200
    1568:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    156c:	5d2c                	.insn	2, 0x5d2c
    156e:	0005                	.insn	2, 0x0005
    1570:	1200                	.insn	2, 0x1200
    1572:	0ebd                	.insn	2, 0x0ebd
    1574:	0000                	.insn	2, 0x0000
    1576:	0244                	.insn	2, 0x0244
    1578:	0000                	.insn	2, 0x0000
    157a:	3301                	.insn	2, 0x3301
    157c:	0100                	.insn	2, 0x0100
    157e:	0000                	.insn	2, 0x0000
    1580:	0000b217          	auipc	tp,0xb
    1584:	0100                	.insn	2, 0x0100
    1586:	4c2e                	.insn	2, 0x4c2e
    1588:	0005                	.insn	2, 0x0005
    158a:	1300                	.insn	2, 0x1300
    158c:	0112                	.insn	2, 0x0112
    158e:	0000                	.insn	2, 0x0000
    1590:	14dc                	.insn	2, 0x14dc
    1592:	0040                	.insn	2, 0x0040
    1594:	0018                	.insn	2, 0x0018
    1596:	0000                	.insn	2, 0x0000
    1598:	3401                	.insn	2, 0x3401
    159a:	1409                	.insn	2, 0x1409
    159c:	0eaa                	.insn	2, 0x0eaa
    159e:	0000                	.insn	2, 0x0000
    15a0:	011e                	.insn	2, 0x011e
    15a2:	0000                	.insn	2, 0x0000
    15a4:	1500                	.insn	2, 0x1500
    15a6:	1564                	.insn	2, 0x1564
    15a8:	0040                	.insn	2, 0x0040
    15aa:	01c4                	.insn	2, 0x01c4
    15ac:	0000                	.insn	2, 0x0000
    15ae:	8812                	.insn	2, 0x8812
    15b0:	3800000f          	.insn	4, 0x3800000f
    15b4:	0000                	.insn	2, 0x0000
    15b6:	0100                	.insn	2, 0x0100
    15b8:	a639                	.insn	2, 0xa639
    15ba:	18000003          	lb	zero,384(zero) # 180 <$d.6+0x5a>
    15be:	0258                	.insn	2, 0x0258
    15c0:	0000                	.insn	2, 0x0000
    15c2:	0211                	.insn	2, 0x0211
    15c4:	0391                	.insn	2, 0x0391
    15c6:	029c                	.insn	2, 0x029c
    15c8:	0000                	.insn	2, 0x0000
    15ca:	4901                	.insn	2, 0x4901
    15cc:	0551                	.insn	2, 0x0551
    15ce:	0000                	.insn	2, 0x0000
    15d0:	0c12                	.insn	2, 0x0c12
    15d2:	1400000f          	.insn	4, 0x1400000f
    15d6:	0001                	.insn	2, 0x0001
    15d8:	0100                	.insn	2, 0x0100
    15da:	a64a                	.insn	2, 0xa64a
    15dc:	17000003          	lb	zero,368(zero) # 170 <$d.6+0x4a>
    15e0:	00f0                	.insn	2, 0x00f0
    15e2:	0000                	.insn	2, 0x0000
    15e4:	3b01                	.insn	2, 0x3b01
    15e6:	054c                	.insn	2, 0x054c
    15e8:	0000                	.insn	2, 0x0000
    15ea:	7018                	.insn	2, 0x7018
    15ec:	0002                	.insn	2, 0x0002
    15ee:	1200                	.insn	2, 0x1200
    15f0:	0ed0                	.insn	2, 0x0ed0
    15f2:	0000                	.insn	2, 0x0000
    15f4:	00000357          	.insn	4, 0x0357
    15f8:	5701                	.insn	2, 0x5701
    15fa:	03a6                	.insn	2, 0x03a6
    15fc:	0000                	.insn	2, 0x0000
    15fe:	1500                	.insn	2, 0x1500
    1600:	16cc                	.insn	2, 0x16cc
    1602:	0040                	.insn	2, 0x0040
    1604:	005c                	.insn	2, 0x005c
    1606:	0000                	.insn	2, 0x0000
    1608:	00031c17          	auipc	s8,0x31
    160c:	0100                	.insn	2, 0x0100
    160e:	0061                	.insn	2, 0x0061
    1610:	0001                	.insn	2, 0x0001
    1612:	1700                	.insn	2, 0x1700
    1614:	018d                	.insn	2, 0x018d
    1616:	0000                	.insn	2, 0x0000
    1618:	6501                	.insn	2, 0x6501
    161a:	0100                	.insn	2, 0x0100
    161c:	0000                	.insn	2, 0x0000
    161e:	1800                	.insn	2, 0x1800
    1620:	0290                	.insn	2, 0x0290
    1622:	0000                	.insn	2, 0x0000
    1624:	cc12                	.insn	2, 0xcc12
    1626:	5700000f          	.insn	4, 0x5700000f
    162a:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    162e:	a64d                	.insn	2, 0xa64d
    1630:	00000003          	lb	zero,0(zero) # 0 <$d.4>
    1634:	0000                	.insn	2, 0x0000
    1636:	f116                	.insn	2, 0xf116
    1638:	0001                	.insn	2, 0x0001
    163a:	c800                	.insn	2, 0xc800
    163c:	4014                	.insn	2, 0x4014
    163e:	1600                	.insn	2, 0x1600
    1640:	0390                	.insn	2, 0x0390
    1642:	0000                	.insn	2, 0x0000
    1644:	1508                	.insn	2, 0x1508
    1646:	0040                	.insn	2, 0x0040
    1648:	bb16                	.insn	2, 0xbb16
    164a:	88000003          	lb	zero,-1920(zero) # fffff880 <USER_MAX+0xffaff880>
    164e:	4015                	.insn	2, 0x4015
    1650:	0000                	.insn	2, 0x0000
    1652:	3119                	.insn	2, 0x3119
    1654:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
    1658:	1a3e                	.insn	2, 0x1a3e
    165a:	0386                	.insn	2, 0x0386
    165c:	0000                	.insn	2, 0x0000
    165e:	8b1c001b          	.insn	4, 0x8b1c001b
    1662:	1d000003          	lb	zero,464(zero) # 1d0 <$d.4+0x5>
    1666:	0000003f 00026f1e 	.insn	8, 0x00026f1e0000003f
    166e:	0200                	.insn	2, 0x0200
    1670:	0003a62b          	.insn	4, 0x0003a62b
    1674:	1a00                	.insn	2, 0x1a00
    1676:	0100                	.insn	2, 0x0100
    1678:	0000                	.insn	2, 0x0000
    167a:	ad1a                	.insn	2, 0xad1a
    167c:	00000003          	lb	zero,0(zero) # 0 <$d.4>
    1680:	ed05                	.insn	2, 0xed05
    1682:	0001                	.insn	2, 0x0001
    1684:	0500                	.insn	2, 0x0500
    1686:	1f04                	.insn	2, 0x1f04
    1688:	6f19                	.insn	2, 0x6f19
    168a:	02000003          	lb	zero,32(zero) # 20 <$d.4+0x20>
    168e:	1a32                	.insn	2, 0x1a32
    1690:	0000003f 02cc1e00 	.insn	8, 0x02cc1e000000003f
    1698:	0000                	.insn	2, 0x0000
    169a:	3b02                	.insn	2, 0x3b02
    169c:	03a6                	.insn	2, 0x03a6
    169e:	0000                	.insn	2, 0x0000
    16a0:	861a                	.insn	2, 0x861a
    16a2:	1a000003          	lb	zero,416(zero) # 1a0 <$d.6+0x7a>
    16a6:	0386                	.insn	2, 0x0386
    16a8:	0000                	.insn	2, 0x0000
    16aa:	2000                	.insn	2, 0x2000
    16ac:	1728                	.insn	2, 0x1728
    16ae:	0040                	.insn	2, 0x0040
    16b0:	0040                	.insn	2, 0x0040
    16b2:	0000                	.insn	2, 0x0000
    16b4:	5201                	.insn	2, 0x5201
    16b6:	0112                	.insn	2, 0x0112
    16b8:	0000                	.insn	2, 0x0000
    16ba:	b114                	.insn	2, 0xb114
    16bc:	0010                	.insn	2, 0x0010
    16be:	1e00                	.insn	2, 0x1e00
    16c0:	0001                	.insn	2, 0x0001
    16c2:	0000                	.insn	2, 0x0000
    16c4:	6821                	.insn	2, 0x6821
    16c6:	60004017          	auipc	zero,0x60004
    16ca:	0002                	.insn	2, 0x0002
    16cc:	0100                	.insn	2, 0x0100
    16ce:	0d52                	.insn	2, 0x0d52
    16d0:	0000                	.insn	2, 0x0000
    16d2:	0100                	.insn	2, 0x0100
    16d4:	10d712af          	.insn	4, 0x10d712af
    16d8:	0000                	.insn	2, 0x0000
    16da:	0244                	.insn	2, 0x0244
    16dc:	0000                	.insn	2, 0x0000
    16de:	b601                	.insn	2, 0xb601
    16e0:	0100                	.insn	2, 0x0100
    16e2:	0000                	.insn	2, 0x0000
    16e4:	0000b217          	auipc	tp,0xb
    16e8:	0100                	.insn	2, 0x0100
    16ea:	4cb1                	.insn	2, 0x4cb1
    16ec:	0005                	.insn	2, 0x0005
    16ee:	1300                	.insn	2, 0x1300
    16f0:	0112                	.insn	2, 0x0112
    16f2:	0000                	.insn	2, 0x0000
    16f4:	17a4                	.insn	2, 0x17a4
    16f6:	0040                	.insn	2, 0x0040
    16f8:	0018                	.insn	2, 0x0018
    16fa:	0000                	.insn	2, 0x0000
    16fc:	b701                	.insn	2, 0xb701
    16fe:	1409                	.insn	2, 0x1409
    1700:	10c4                	.insn	2, 0x10c4
    1702:	0000                	.insn	2, 0x0000
    1704:	011e                	.insn	2, 0x011e
    1706:	0000                	.insn	2, 0x0000
    1708:	1500                	.insn	2, 0x1500
    170a:	1820                	.insn	2, 0x1820
    170c:	0040                	.insn	2, 0x0040
    170e:	01a8                	.insn	2, 0x01a8
    1710:	0000                	.insn	2, 0x0000
    1712:	ea12                	.insn	2, 0xea12
    1714:	0010                	.insn	2, 0x0010
    1716:	3800                	.insn	2, 0x3800
    1718:	0000                	.insn	2, 0x0000
    171a:	0100                	.insn	2, 0x0100
    171c:	a6bc                	.insn	2, 0xa6bc
    171e:	18000003          	lb	zero,384(zero) # 180 <$d.6+0x5a>
    1722:	02a8                	.insn	2, 0x02a8
    1724:	0000                	.insn	2, 0x0000
    1726:	2e12                	.insn	2, 0x2e12
    1728:	0011                	.insn	2, 0x0011
    172a:	b200                	.insn	2, 0xb200
    172c:	0001                	.insn	2, 0x0001
    172e:	0100                	.insn	2, 0x0100
    1730:	00e0                	.insn	2, 0x00e0
    1732:	0001                	.insn	2, 0x0001
    1734:	1200                	.insn	2, 0x1200
    1736:	1141                	.insn	2, 0x1141
    1738:	0000                	.insn	2, 0x0000
    173a:	0352                	.insn	2, 0x0352
    173c:	0000                	.insn	2, 0x0000
    173e:	e301                	.insn	2, 0xe301
    1740:	0100                	.insn	2, 0x0100
    1742:	0000                	.insn	2, 0x0000
    1744:	0000f017          	auipc	zero,0xf
    1748:	0100                	.insn	2, 0x0100
    174a:	4cbe                	.insn	2, 0x4cbe
    174c:	0005                	.insn	2, 0x0005
    174e:	1700                	.insn	2, 0x1700
    1750:	031c                	.insn	2, 0x031c
    1752:	0000                	.insn	2, 0x0000
    1754:	d801                	.insn	2, 0xd801
    1756:	0100                	.insn	2, 0x0100
    1758:	0000                	.insn	2, 0x0000
    175a:	00018d17          	auipc	s10,0x18
    175e:	0100                	.insn	2, 0x0100
    1760:	00dc                	.insn	2, 0x00dc
    1762:	0001                	.insn	2, 0x0001
    1764:	1800                	.insn	2, 0x1800
    1766:	02c0                	.insn	2, 0x02c0
    1768:	0000                	.insn	2, 0x0000
    176a:	5412                	.insn	2, 0x5412
    176c:	0011                	.insn	2, 0x0011
    176e:	5700                	.insn	2, 0x5700
    1770:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
    1774:	a6c9                	.insn	2, 0xa6c9
    1776:	00000003          	lb	zero,0(zero) # 0 <$d.4>
    177a:	8015                	.insn	2, 0x8015
    177c:	4019                	.insn	2, 0x4019
    177e:	4800                	.insn	2, 0x4800
    1780:	0000                	.insn	2, 0x0000
    1782:	1200                	.insn	2, 0x1200
    1784:	1239                	.insn	2, 0x1239
    1786:	0000                	.insn	2, 0x0000
    1788:	00000357          	.insn	4, 0x0357
    178c:	d001                	.insn	2, 0xd001
    178e:	03a6                	.insn	2, 0x03a6
    1790:	0000                	.insn	2, 0x0000
    1792:	0000                	.insn	2, 0x0000
    1794:	1600                	.insn	2, 0x1600
    1796:	01f1                	.insn	2, 0x01f1
    1798:	0000                	.insn	2, 0x0000
    179a:	1794                	.insn	2, 0x1794
    179c:	0040                	.insn	2, 0x0040
    179e:	9016                	.insn	2, 0x9016
    17a0:	d0000003          	lb	zero,-768(zero) # fffffd00 <USER_MAX+0xffaffd00>
    17a4:	16004017          	auipc	zero,0x16004
    17a8:	0378                	.insn	2, 0x0378
    17aa:	0000                	.insn	2, 0x0000
    17ac:	1830                	.insn	2, 0x1830
    17ae:	0040                	.insn	2, 0x0040
    17b0:	7816                	.insn	2, 0x7816
    17b2:	8c000003          	lb	zero,-1856(zero) # fffff8c0 <USER_MAX+0xffaff8c0>
    17b6:	4018                	.insn	2, 0x4018
    17b8:	1600                	.insn	2, 0x1600
    17ba:	03ae                	.insn	2, 0x03ae
    17bc:	0000                	.insn	2, 0x0000
    17be:	18fc                	.insn	2, 0x18fc
    17c0:	0040                	.insn	2, 0x0040
    17c2:	ae16                	.insn	2, 0xae16
    17c4:	0c000003          	lb	zero,192(zero) # c0 <$d.10+0x4c>
    17c8:	4019                	.insn	2, 0x4019
    17ca:	1600                	.insn	2, 0x1600
    17cc:	03ae                	.insn	2, 0x03ae
    17ce:	0000                	.insn	2, 0x0000
    17d0:	191c                	.insn	2, 0x191c
    17d2:	0040                	.insn	2, 0x0040
    17d4:	ae16                	.insn	2, 0xae16
    17d6:	2c000003          	lb	zero,704(zero) # 2c0 <$d.6+0x68>
    17da:	4019                	.insn	2, 0x4019
    17dc:	1600                	.insn	2, 0x1600
    17de:	03ae                	.insn	2, 0x03ae
    17e0:	0000                	.insn	2, 0x0000
    17e2:	193c                	.insn	2, 0x193c
    17e4:	0040                	.insn	2, 0x0040
    17e6:	ae16                	.insn	2, 0xae16
    17e8:	4c000003          	lb	zero,1216(zero) # 4c0 <$d.4+0x31>
    17ec:	4019                	.insn	2, 0x4019
    17ee:	1600                	.insn	2, 0x1600
    17f0:	03ae                	.insn	2, 0x03ae
    17f2:	0000                	.insn	2, 0x0000
    17f4:	195c                	.insn	2, 0x195c
    17f6:	0040                	.insn	2, 0x0040
    17f8:	ae16                	.insn	2, 0xae16
    17fa:	6c000003          	lb	zero,1728(zero) # 6c0 <$d.3+0x1f6>
    17fe:	4019                	.insn	2, 0x4019
    1800:	1600                	.insn	2, 0x1600
    1802:	03ae                	.insn	2, 0x03ae
    1804:	0000                	.insn	2, 0x0000
    1806:	1980                	.insn	2, 0x1980
    1808:	0040                	.insn	2, 0x0040
    180a:	ae16                	.insn	2, 0xae16
    180c:	a4000003          	lb	zero,-1472(zero) # fffffa40 <USER_MAX+0xffaffa40>
    1810:	4019                	.insn	2, 0x4019
    1812:	1600                	.insn	2, 0x1600
    1814:	03ae                	.insn	2, 0x03ae
    1816:	0000                	.insn	2, 0x0000
    1818:	19b4                	.insn	2, 0x19b4
    181a:	0040                	.insn	2, 0x0040
    181c:	ae16                	.insn	2, 0xae16
    181e:	c4000003          	lb	zero,-960(zero) # fffffc40 <USER_MAX+0xffaffc40>
    1822:	4019                	.insn	2, 0x4019
    1824:	0000                	.insn	2, 0x0000
    1826:	911c                	.insn	2, 0x911c
    1828:	0000                	.insn	2, 0x0000
    182a:	0300                	.insn	2, 0x0300
    182c:	0000003f 00004604 	.insn	8, 0x46040000003f
    1834:	0d00                	.insn	2, 0x0d00
    1836:	1c00                	.insn	2, 0x1c00
    1838:	0100                	.insn	2, 0x0100
    183a:	0000                	.insn	2, 0x0000
	...

セクション .debug_ranges の逆アセンブル:

00000000 <$d.5>:
   0:	0560                	.insn	2, 0x0560
   2:	0000                	.insn	2, 0x0000
   4:	0588                	.insn	2, 0x0588
   6:	0000                	.insn	2, 0x0000
   8:	0610                	.insn	2, 0x0610
   a:	0000                	.insn	2, 0x0000
   c:	0628                	.insn	2, 0x0628
	...
  16:	0000                	.insn	2, 0x0000
  18:	0530                	.insn	2, 0x0530
  1a:	0000                	.insn	2, 0x0000
  1c:	055c                	.insn	2, 0x055c
  1e:	0000                	.insn	2, 0x0000
  20:	05d4                	.insn	2, 0x05d4
  22:	0000                	.insn	2, 0x0000
  24:	05ec                	.insn	2, 0x05ec
	...
  2e:	0000                	.insn	2, 0x0000
  30:	04e4                	.insn	2, 0x04e4
  32:	0000                	.insn	2, 0x0000
  34:	0530                	.insn	2, 0x0530
  36:	0000                	.insn	2, 0x0000
  38:	0590                	.insn	2, 0x0590
  3a:	0000                	.insn	2, 0x0000
  3c:	05a4                	.insn	2, 0x05a4
  3e:	0000                	.insn	2, 0x0000
  40:	0634                	.insn	2, 0x0634
  42:	0000                	.insn	2, 0x0000
  44:	06e0                	.insn	2, 0x06e0
  46:	0000                	.insn	2, 0x0000
  48:	0744                	.insn	2, 0x0744
  4a:	0000                	.insn	2, 0x0000
  4c:	07a8                	.insn	2, 0x07a8
	...
  56:	0000                	.insn	2, 0x0000
  58:	04ec                	.insn	2, 0x04ec
  5a:	0000                	.insn	2, 0x0000
  5c:	0530                	.insn	2, 0x0530
  5e:	0000                	.insn	2, 0x0000
  60:	059c                	.insn	2, 0x059c
  62:	0000                	.insn	2, 0x0000
  64:	05a4                	.insn	2, 0x05a4
  66:	0000                	.insn	2, 0x0000
  68:	0634                	.insn	2, 0x0634
  6a:	0000                	.insn	2, 0x0000
  6c:	068c                	.insn	2, 0x068c
	...
  76:	0000                	.insn	2, 0x0000
  78:	0634                	.insn	2, 0x0634
  7a:	0000                	.insn	2, 0x0000
  7c:	0640                	.insn	2, 0x0640
  7e:	0000                	.insn	2, 0x0000
  80:	0644                	.insn	2, 0x0644
  82:	0000                	.insn	2, 0x0000
  84:	0650                	.insn	2, 0x0650
  86:	0000                	.insn	2, 0x0000
  88:	0658                	.insn	2, 0x0658
  8a:	0000                	.insn	2, 0x0000
  8c:	068c                	.insn	2, 0x068c
	...
  96:	0000                	.insn	2, 0x0000
  98:	0698                	.insn	2, 0x0698
  9a:	0000                	.insn	2, 0x0000
  9c:	06e0                	.insn	2, 0x06e0
  9e:	0000                	.insn	2, 0x0000
  a0:	0744                	.insn	2, 0x0744
  a2:	0000                	.insn	2, 0x0000
  a4:	079c                	.insn	2, 0x079c
	...
  ae:	0000                	.insn	2, 0x0000
  b0:	0744                	.insn	2, 0x0744
  b2:	0000                	.insn	2, 0x0000
  b4:	0750                	.insn	2, 0x0750
  b6:	0000                	.insn	2, 0x0000
  b8:	0754                	.insn	2, 0x0754
  ba:	0000                	.insn	2, 0x0000
  bc:	0760                	.insn	2, 0x0760
  be:	0000                	.insn	2, 0x0000
  c0:	0768                	.insn	2, 0x0768
  c2:	0000                	.insn	2, 0x0000
  c4:	079c                	.insn	2, 0x079c
	...
  ce:	0000                	.insn	2, 0x0000
  d0:	08a8                	.insn	2, 0x08a8
  d2:	0000                	.insn	2, 0x0000
  d4:	08c0                	.insn	2, 0x08c0
  d6:	0000                	.insn	2, 0x0000
  d8:	08c4                	.insn	2, 0x08c4
  da:	0000                	.insn	2, 0x0000
  dc:	08d0                	.insn	2, 0x08d0
  de:	0000                	.insn	2, 0x0000
  e0:	08d8                	.insn	2, 0x08d8
  e2:	0000                	.insn	2, 0x0000
  e4:	0908                	.insn	2, 0x0908
	...

000000f0 <$d.6>:
  f0:	0a8c                	.insn	2, 0x0a8c
  f2:	0040                	.insn	2, 0x0040
  f4:	0aac                	.insn	2, 0x0aac
  f6:	0040                	.insn	2, 0x0040
  f8:	0b3c                	.insn	2, 0x0b3c
  fa:	0040                	.insn	2, 0x0040
  fc:	0b5c                	.insn	2, 0x0b5c
  fe:	0040                	.insn	2, 0x0040
	...
 108:	0aac                	.insn	2, 0x0aac
 10a:	0040                	.insn	2, 0x0040
 10c:	0abc                	.insn	2, 0x0abc
 10e:	0040                	.insn	2, 0x0040
 110:	0b5c                	.insn	2, 0x0b5c
 112:	0040                	.insn	2, 0x0040
 114:	0b6c                	.insn	2, 0x0b6c
 116:	0040                	.insn	2, 0x0040
	...
 120:	0abc                	.insn	2, 0x0abc
 122:	0040                	.insn	2, 0x0040
 124:	0ac8                	.insn	2, 0x0ac8
 126:	0040                	.insn	2, 0x0040
 128:	0b6c                	.insn	2, 0x0b6c
 12a:	0040                	.insn	2, 0x0040
 12c:	0b78                	.insn	2, 0x0b78
 12e:	0040                	.insn	2, 0x0040
	...
 138:	0b7c                	.insn	2, 0x0b7c
 13a:	0040                	.insn	2, 0x0040
 13c:	0b8c                	.insn	2, 0x0b8c
 13e:	0040                	.insn	2, 0x0040
 140:	0c40                	.insn	2, 0x0c40
 142:	0040                	.insn	2, 0x0040
 144:	0c50                	.insn	2, 0x0c50
 146:	0040                	.insn	2, 0x0040
	...
 150:	0b8c                	.insn	2, 0x0b8c
 152:	0040                	.insn	2, 0x0040
 154:	0b98                	.insn	2, 0x0b98
 156:	0040                	.insn	2, 0x0040
 158:	0c50                	.insn	2, 0x0c50
 15a:	0040                	.insn	2, 0x0040
 15c:	0c5c                	.insn	2, 0x0c5c
 15e:	0040                	.insn	2, 0x0040
	...
 168:	0b98                	.insn	2, 0x0b98
 16a:	0040                	.insn	2, 0x0040
 16c:	0ba4                	.insn	2, 0x0ba4
 16e:	0040                	.insn	2, 0x0040
 170:	0c5c                	.insn	2, 0x0c5c
 172:	0040                	.insn	2, 0x0040
 174:	0c68                	.insn	2, 0x0c68
 176:	0040                	.insn	2, 0x0040
	...
 180:	0c10                	.insn	2, 0x0c10
 182:	0040                	.insn	2, 0x0040
 184:	0c20                	.insn	2, 0x0c20
 186:	0040                	.insn	2, 0x0040
 188:	0c6c                	.insn	2, 0x0c6c
 18a:	0040                	.insn	2, 0x0040
 18c:	0c7c                	.insn	2, 0x0c7c
 18e:	0040                	.insn	2, 0x0040
	...
 198:	0c20                	.insn	2, 0x0c20
 19a:	0040                	.insn	2, 0x0040
 19c:	0c2c                	.insn	2, 0x0c2c
 19e:	0040                	.insn	2, 0x0040
 1a0:	0c7c                	.insn	2, 0x0c7c
 1a2:	0040                	.insn	2, 0x0040
 1a4:	0c88                	.insn	2, 0x0c88
 1a6:	0040                	.insn	2, 0x0040
	...
 1b0:	0c2c                	.insn	2, 0x0c2c
 1b2:	0040                	.insn	2, 0x0040
 1b4:	0c3c                	.insn	2, 0x0c3c
 1b6:	0040                	.insn	2, 0x0040
 1b8:	0c88                	.insn	2, 0x0c88
 1ba:	0040                	.insn	2, 0x0040
 1bc:	0c94                	.insn	2, 0x0c94
 1be:	0040                	.insn	2, 0x0040
	...
 1c8:	0e90                	.insn	2, 0x0e90
 1ca:	0040                	.insn	2, 0x0040
 1cc:	0eb8                	.insn	2, 0x0eb8
 1ce:	0040                	.insn	2, 0x0040
 1d0:	1004                	.insn	2, 0x1004
 1d2:	0040                	.insn	2, 0x0040
 1d4:	1084                	.insn	2, 0x1084
 1d6:	0040                	.insn	2, 0x0040
	...
 1e0:	0ee4                	.insn	2, 0x0ee4
 1e2:	0040                	.insn	2, 0x0040
 1e4:	0ef0                	.insn	2, 0x0ef0
 1e6:	0040                	.insn	2, 0x0040
 1e8:	0f00                	.insn	2, 0x0f00
 1ea:	0040                	.insn	2, 0x0040
 1ec:	0f0c                	.insn	2, 0x0f0c
 1ee:	0040                	.insn	2, 0x0040
 1f0:	0f1c                	.insn	2, 0x0f1c
 1f2:	0040                	.insn	2, 0x0040
 1f4:	0f28                	.insn	2, 0x0f28
 1f6:	0040                	.insn	2, 0x0040
 1f8:	0f38                	.insn	2, 0x0f38
 1fa:	0040                	.insn	2, 0x0040
 1fc:	0f44                	.insn	2, 0x0f44
 1fe:	0040                	.insn	2, 0x0040
 200:	0f54                	.insn	2, 0x0f54
 202:	0040                	.insn	2, 0x0040
 204:	0f60                	.insn	2, 0x0f60
 206:	0040                	.insn	2, 0x0040
 208:	0f70                	.insn	2, 0x0f70
 20a:	0040                	.insn	2, 0x0040
 20c:	0f7c                	.insn	2, 0x0f7c
 20e:	0040                	.insn	2, 0x0040
 210:	0f8c                	.insn	2, 0x0f8c
 212:	0040                	.insn	2, 0x0040
 214:	0f98                	.insn	2, 0x0f98
 216:	0040                	.insn	2, 0x0040
 218:	0fa4                	.insn	2, 0x0fa4
 21a:	0040                	.insn	2, 0x0040
 21c:	0fb0                	.insn	2, 0x0fb0
 21e:	0040                	.insn	2, 0x0040
	...
 228:	1134                	.insn	2, 0x1134
 22a:	0040                	.insn	2, 0x0040
 22c:	118c                	.insn	2, 0x118c
 22e:	0040                	.insn	2, 0x0040
 230:	1190                	.insn	2, 0x1190
 232:	0040                	.insn	2, 0x0040
 234:	1194                	.insn	2, 0x1194
 236:	0040                	.insn	2, 0x0040
	...
 240:	09ec                	.insn	2, 0x09ec
 242:	0040                	.insn	2, 0x0040
 244:	1264                	.insn	2, 0x1264
 246:	0040                	.insn	2, 0x0040
 248:	0000                	.insn	2, 0x0000
 24a:	0040                	.insn	2, 0x0040
 24c:	001c                	.insn	2, 0x001c
 24e:	0040                	.insn	2, 0x0040
	...

00000258 <$d.6>:
 258:	0300                	.insn	2, 0x0300
 25a:	0000                	.insn	2, 0x0000
 25c:	0328                	.insn	2, 0x0328
 25e:	0000                	.insn	2, 0x0000
 260:	0334                	.insn	2, 0x0334
 262:	0000                	.insn	2, 0x0000
 264:	04c4                	.insn	2, 0x04c4
	...
 26e:	0000                	.insn	2, 0x0000
 270:	0300                	.insn	2, 0x0300
 272:	0000                	.insn	2, 0x0000
 274:	030c                	.insn	2, 0x030c
 276:	0000                	.insn	2, 0x0000
 278:	042c                	.insn	2, 0x042c
 27a:	0000                	.insn	2, 0x0000
 27c:	0430                	.insn	2, 0x0430
 27e:	0000                	.insn	2, 0x0000
 280:	0438                	.insn	2, 0x0438
 282:	0000                	.insn	2, 0x0000
 284:	045c                	.insn	2, 0x045c
	...
 28e:	0000                	.insn	2, 0x0000
 290:	0348                	.insn	2, 0x0348
 292:	0000                	.insn	2, 0x0000
 294:	03a8                	.insn	2, 0x03a8
 296:	0000                	.insn	2, 0x0000
 298:	03b4                	.insn	2, 0x03b4
 29a:	0000                	.insn	2, 0x0000
 29c:	0424                	.insn	2, 0x0424
	...
 2a6:	0000                	.insn	2, 0x0000
 2a8:	05bc                	.insn	2, 0x05bc
 2aa:	0000                	.insn	2, 0x0000
 2ac:	0628                	.insn	2, 0x0628
 2ae:	0000                	.insn	2, 0x0000
 2b0:	0634                	.insn	2, 0x0634
 2b2:	0000                	.insn	2, 0x0000
 2b4:	0764                	.insn	2, 0x0764
	...
 2be:	0000                	.insn	2, 0x0000
 2c0:	0648                	.insn	2, 0x0648
 2c2:	0000                	.insn	2, 0x0000
 2c4:	0684                	.insn	2, 0x0684
 2c6:	0000                	.insn	2, 0x0000
 2c8:	0690                	.insn	2, 0x0690
 2ca:	0000                	.insn	2, 0x0000
 2cc:	0708                	.insn	2, 0x0708
	...

セクション .debug_str の逆アセンブル:

00000000 <$d.6-0x126>:
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
  20:	5f646d63          	bltu	s0,s6,61a <$d.3+0x150>
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
  3e:	6e756f63          	bltu	a0,t2,73c <$d.3+0x272>
  42:	0074                	.insn	2, 0x0074
  44:	0070                	.insn	2, 0x0070
  46:	6461                	.insn	2, 0x6461
  48:	7264                	.insn	2, 0x7264
  4a:	6d00                	.insn	2, 0x6d00
  4c:	7461                	.insn	2, 0x7461
  4e:	6972                	.insn	2, 0x6972
  50:	5f78                	.insn	2, 0x5f78
  52:	616d                	.insn	2, 0x616d
  54:	0078                	.insn	2, 0x0078
  56:	3361                	.insn	2, 0x3361
  58:	6d00                	.insn	2, 0x6d00
  5a:	7461                	.insn	2, 0x7461
  5c:	6972                	.insn	2, 0x6972
  5e:	5f78                	.insn	2, 0x5f78
  60:	0041                	.insn	2, 0x0041
  62:	616d                	.insn	2, 0x616d
  64:	7274                	.insn	2, 0x7274
  66:	7869                	.insn	2, 0x7869
  68:	735f 7a69 0065      	.insn	6, 0x00657a69735f
  6e:	7270                	.insn	2, 0x7270
  70:	74706d6f          	jal	s10,6fb6 <$d.5+0x5cdc>
  74:	6e00                	.insn	2, 0x6e00
  76:	6f00                	.insn	2, 0x6f00
  78:	7475                	.insn	2, 0x7475
  7a:	7500                	.insn	2, 0x7500
  7c:	6e69                	.insn	2, 0x6e69
  7e:	7074                	.insn	2, 0x7074
  80:	7274                	.insn	2, 0x7274
  82:	745f 6600 7461      	.insn	6, 0x74616600745f
  88:	6d5f3233          	.insn	4, 0x6d5f3233
  8c:	746e756f          	jal	a0,e77d2 <$d.5+0xe64f8>
  90:	7200                	.insn	2, 0x7200
  92:	5f746f6f          	jal	t5,46e88 <$d.5+0x45bae>
  96:	73756c63          	bltu	a0,s7,7ce <$d.3+0x304>
  9a:	6574                	.insn	2, 0x6574
  9c:	0072                	.insn	2, 0x0072
  9e:	73756c63          	bltu	a0,s7,7d6 <$d.3+0x30c>
  a2:	6574                	.insn	2, 0x6574
  a4:	0072                	.insn	2, 0x0072
  a6:	626c                	.insn	2, 0x626c
  a8:	0061                	.insn	2, 0x0061
  aa:	6f62                	.insn	2, 0x6f62
  ac:	61006c6f          	jal	s8,66bc <$d.5+0x53e2>
  b0:	0032                	.insn	2, 0x0032
  b2:	7562                	.insn	2, 0x7562
  b4:	0066                	.insn	2, 0x0066
  b6:	6164                	.insn	2, 0x6164
  b8:	6174                	.insn	2, 0x6174
  ba:	625f 6765 6e69      	.insn	6, 0x6e696765625f
  c0:	7600                	.insn	2, 0x7600
  c2:	7300                	.insn	2, 0x7300
  c4:	6372                	.insn	2, 0x6372
  c6:	6573752f          	.insn	4, 0x6573752f
  ca:	2e72                	.insn	2, 0x2e72
  cc:	72700063          	beq	zero,t2,7ec <$d.3+0x322>
  d0:	6e69                	.insn	2, 0x6e69
  d2:	5f74                	.insn	2, 0x5f74
  d4:	6e69                	.insn	2, 0x6e69
  d6:	0074                	.insn	2, 0x0074
  d8:	7564                	.insn	2, 0x7564
  da:	706d                	.insn	2, 0x706d
  dc:	615f 6970 6300      	.insn	6, 0x63006970615f
  e2:	756c                	.insn	2, 0x756c
  e4:	72657473          	csrrci	s0,mhpmevent6h,10
  e8:	745f 5f6f 626c      	.insn	6, 0x626c5f6f745f
  ee:	0061                	.insn	2, 0x0061
  f0:	0065                	.insn	2, 0x0065
  f2:	6d630063          	beq	t1,s6,7b2 <$d.3+0x2e8>
  f6:	6c64                	.insn	2, 0x6c64
  f8:	6e69                	.insn	2, 0x6e69
  fa:	0065                	.insn	2, 0x0065
  fc:	696d                	.insn	2, 0x696d
  fe:	70615f63          	bge	sp,t1,81c <$d.3+0x352>
 102:	0069                	.insn	2, 0x0069
 104:	73003173          	csrrc	sp,mhpmevent16h,zero
 108:	6600                	.insn	2, 0x6600
 10a:	7461                	.insn	2, 0x7461
 10c:	665f3233          	.insn	4, 0x665f3233
 110:	6e69                	.insn	2, 0x6e69
 112:	0064                	.insn	2, 0x0064
 114:	696e006b          	.insn	4, 0x696e006b
 118:	6262                	.insn	2, 0x6262
 11a:	656c                	.insn	2, 0x656c
 11c:	7000                	.insn	2, 0x7000
 11e:	7261                	.insn	2, 0x7261
 120:	5f74                	.insn	2, 0x5f74
 122:	626c                	.insn	2, 0x626c
 124:	0061                	.insn	2, 0x0061

00000126 <$d.6>:
 126:	6255                	.insn	2, 0x6255
 128:	6e75                	.insn	2, 0x6e75
 12a:	7574                	.insn	2, 0x7574
 12c:	6320                	.insn	2, 0x6320
 12e:	616c                	.insn	2, 0x616c
 130:	676e                	.insn	2, 0x676e
 132:	7620                	.insn	2, 0x7620
 134:	7265                	.insn	2, 0x7265
 136:	6e6f6973          	csrrsi	s2,0x6e6,30
 13a:	3120                	.insn	2, 0x3120
 13c:	2e38                	.insn	2, 0x2e38
 13e:	2e31                	.insn	2, 0x2e31
 140:	31282033          	.insn	4, 0x31282033
 144:	6275                	.insn	2, 0x6275
 146:	6e75                	.insn	2, 0x6e75
 148:	7574                	.insn	2, 0x7574
 14a:	2931                	.insn	2, 0x2931
 14c:	6d00                	.insn	2, 0x6d00
 14e:	7861                	.insn	2, 0x7861
 150:	7200                	.insn	2, 0x7200
 152:	7465                	.insn	2, 0x7465
 154:	7300                	.insn	2, 0x7300
 156:	7274                	.insn	2, 0x7274
 158:	00797063          	bgeu	s2,t2,158 <$d.6+0x32>
 15c:	6162                	.insn	2, 0x6162
 15e:	73006573          	csrrsi	a0,mhpmevent16h,0
 162:	6372                	.insn	2, 0x6372
 164:	7461662f          	.insn	4, 0x7461662f
 168:	632e3233          	.insn	4, 0x632e3233
 16c:	6700                	.insn	2, 0x6700
 16e:	665f 7461 3233      	.insn	6, 0x32337461665f
 174:	6300                	.insn	2, 0x6300
 176:	6c61                	.insn	2, 0x6c61
 178:	5f6c                	.insn	2, 0x5f6c
 17a:	7564                	.insn	2, 0x7564
 17c:	706d                	.insn	2, 0x706d
 17e:	615f 6970 6600      	.insn	6, 0x66006970615f
 184:	7461                	.insn	2, 0x7461
 186:	625f3233          	.insn	4, 0x625f3233
 18a:	6675                	.insn	2, 0x6675
 18c:	6300                	.insn	2, 0x6300
 18e:	5f6c                	.insn	2, 0x5f6c
 190:	6f6c                	.insn	2, 0x6f6c
 192:	7500                	.insn	2, 0x7500
 194:	6e69                	.insn	2, 0x6e69
 196:	3374                	.insn	2, 0x3374
 198:	5f32                	.insn	2, 0x5f32
 19a:	0074                	.insn	2, 0x0074
 19c:	6166                	.insn	2, 0x6166
 19e:	3374                	.insn	2, 0x3374
 1a0:	5f32                	.insn	2, 0x5f32
 1a2:	6e69                	.insn	2, 0x6e69
 1a4:	6f66                	.insn	2, 0x6f66
 1a6:	745f 7200 7365      	.insn	6, 0x73657200745f
 1ac:	7265                	.insn	2, 0x7265
 1ae:	6576                	.insn	2, 0x6576
 1b0:	0064                	.insn	2, 0x0064
 1b2:	73006c63          	bltu	zero,a6,8ea <$d.5+0x6d>
 1b6:	6372                	.insn	2, 0x6372
 1b8:	6568732f          	.insn	4, 0x6568732f
 1bc:	6c6c                	.insn	2, 0x6c6c
 1be:	632e                	.insn	2, 0x632e
 1c0:	7300                	.insn	2, 0x7300
 1c2:	7379                	.insn	2, 0x7379
 1c4:	6f6e                	.insn	2, 0x6f6e
 1c6:	7300                	.insn	2, 0x7300
 1c8:	6372                	.insn	2, 0x6372
 1ca:	6d00                	.insn	2, 0x6d00
 1cc:	6961                	.insn	2, 0x6961
 1ce:	006e                	.insn	2, 0x006e
 1d0:	6e75                	.insn	2, 0x6e75
 1d2:	6e676973          	csrrsi	s2,0x6e6,14
 1d6:	6465                	.insn	2, 0x6465
 1d8:	6320                	.insn	2, 0x6320
 1da:	6168                	.insn	2, 0x6168
 1dc:	0072                	.insn	2, 0x0072
 1de:	6166                	.insn	2, 0x6166
 1e0:	5f74                	.insn	2, 0x5f74
 1e2:	6562                	.insn	2, 0x6562
 1e4:	006e6967          	.insn	4, 0x006e6967
 1e8:	72616863          	bltu	sp,t1,918 <$d.5+0x9b>
 1ec:	6900                	.insn	2, 0x6900
 1ee:	746e                	.insn	2, 0x746e
 1f0:	6100                	.insn	2, 0x6100
 1f2:	6772                	.insn	2, 0x6772
 1f4:	0076                	.insn	2, 0x0076
 1f6:	615f6173          	csrrsi	sp,htimedeltah,30
 1fa:	6970                	.insn	2, 0x6970
 1fc:	2f00                	.insn	2, 0x2f00
 1fe:	6f68                	.insn	2, 0x6f68
 200:	656d                	.insn	2, 0x656d
 202:	7261682f          	.insn	4, 0x7261682f
 206:	6875                	.insn	2, 0x6875
 208:	6b69                	.insn	2, 0x6b69
 20a:	72502f6f          	jal	t5,312e <$d.5+0x1e54>
 20e:	6172676f          	jal	a4,27024 <$d.5+0x25d4a>
 212:	2f6d                	.insn	2, 0x2f6d
 214:	5350                	.insn	2, 0x5350
 216:	56525f43          	.insn	4, 0x56525f43
 21a:	2f493233          	.insn	4, 0x2f493233
 21e:	5350                	.insn	2, 0x5350
 220:	4e4f2d43          	.insn	4, 0x4e4f2d43
 224:	2f45                	.insn	2, 0x2f45
 226:	74666f73          	csrrsi	t5,0x746,12
 22a:	65726177          	.insn	4, 0x65726177
 22e:	00736f2f          	.insn	4, 0x00736f2f
 232:	7369                	.insn	2, 0x7369
 234:	705f 6972 656d      	.insn	6, 0x656d6972705f
 23a:	6600                	.insn	2, 0x6600
 23c:	7461                	.insn	2, 0x7461
 23e:	735f 7a69 0065      	.insn	6, 0x00657a69735f
 244:	6f72                	.insn	2, 0x6f72
 246:	6c5f746f          	jal	s0,f810a <$d.5+0xf6e30>
 24a:	6162                	.insn	2, 0x6162
 24c:	6300                	.insn	2, 0x6300
 24e:	6c61                	.insn	2, 0x6c61
 250:	5f6c                	.insn	2, 0x5f6c
 252:	696d                	.insn	2, 0x696d
 254:	70615f63          	bge	sp,t1,972 <$d.5+0xf5>
 258:	0069                	.insn	2, 0x0069
 25a:	6176                	.insn	2, 0x6176
 25c:	756c                	.insn	2, 0x756c
 25e:	0065                	.insn	2, 0x0065
 260:	6176                	.insn	2, 0x6176
 262:	006c                	.insn	2, 0x006c
 264:	63737973          	csrrci	s2,0x637,6
 268:	6c61                	.insn	2, 0x6c61
 26a:	006c                	.insn	2, 0x006c
 26c:	3061                	.insn	2, 0x3061
 26e:	6300                	.insn	2, 0x6300
 270:	6c61                	.insn	2, 0x6c61
 272:	5f6c                	.insn	2, 0x5f6c
 274:	725f6473          	csrrsi	s0,mhpmevent5h,30
 278:	6165                	.insn	2, 0x6165
 27a:	5f64                	.insn	2, 0x5f64
 27c:	7562                	.insn	2, 0x7562
 27e:	5f66                	.insn	2, 0x5f66
 280:	7061                	.insn	2, 0x7061
 282:	0069                	.insn	2, 0x0069
 284:	6e75                	.insn	2, 0x6e75
 286:	6e676973          	csrrsi	s2,0x6e6,14
 28a:	6465                	.insn	2, 0x6465
 28c:	6920                	.insn	2, 0x6920
 28e:	746e                	.insn	2, 0x746e
 290:	6100                	.insn	2, 0x6100
 292:	6772                	.insn	2, 0x6772
 294:	34610063          	beq	sp,t1,5d4 <$d.3+0x10a>
 298:	7300                	.insn	2, 0x7300
 29a:	0032                	.insn	2, 0x0032
 29c:	726f6873          	csrrsi	a6,mhpmevent6h,30
 2a0:	6e74                	.insn	2, 0x6e74
 2a2:	6d61                	.insn	2, 0x6d61
 2a4:	0065                	.insn	2, 0x0065
 2a6:	63746567          	.insn	4, 0x63746567
 2aa:	6168                	.insn	2, 0x6168
 2ac:	0072                	.insn	2, 0x0072
 2ae:	5f5f 5241 4152      	.insn	6, 0x415252415f5f
 2b4:	5f59                	.insn	2, 0x5f59
 2b6:	455a4953          	.insn	4, 0x455a4953
 2ba:	545f 5059 5f45      	.insn	6, 0x5f455059545f
 2c0:	005f 6170 7372      	.insn	6, 0x73726170005f
 2c6:	5f65                	.insn	2, 0x5f65
 2c8:	6568                	.insn	2, 0x6568
 2ca:	0078                	.insn	2, 0x0078
 2cc:	63727473          	csrrci	s0,0x637,4
 2d0:	706d                	.insn	2, 0x706d
 2d2:	6300                	.insn	2, 0x6300
 2d4:	6c61                	.insn	2, 0x6c61
 2d6:	5f6c                	.insn	2, 0x5f6c
 2d8:	615f6473          	csrrsi	s0,htimedeltah,30
 2dc:	6970                	.insn	2, 0x6970
 2de:	6300                	.insn	2, 0x6300
 2e0:	6c61                	.insn	2, 0x6c61
 2e2:	5f6c                	.insn	2, 0x5f6c
 2e4:	615f6173          	csrrsi	sp,htimedeltah,30
 2e8:	6970                	.insn	2, 0x6970
 2ea:	6100                	.insn	2, 0x6100
 2ec:	0031                	.insn	2, 0x0031
 2ee:	616e                	.insn	2, 0x616e
 2f0:	656d                	.insn	2, 0x656d
 2f2:	6400                	.insn	2, 0x6400
 2f4:	7500                	.insn	2, 0x7500
 2f6:	6e69                	.insn	2, 0x6e69
 2f8:	3874                	.insn	2, 0x3874
 2fa:	745f 5f00 625f      	.insn	6, 0x625f5f00745f
 300:	6975                	.insn	2, 0x6975
 302:	746c                	.insn	2, 0x746c
 304:	6e69                	.insn	2, 0x6e69
 306:	765f 5f61 696c      	.insn	6, 0x696c5f61765f
 30c:	6d007473          	csrrci	s0,0x6d0,0
 310:	7461                	.insn	2, 0x7461
 312:	6972                	.insn	2, 0x6972
 314:	5f78                	.insn	2, 0x5f78
 316:	0042                	.insn	2, 0x0042
 318:	6e65                	.insn	2, 0x6e65
 31a:	0064                	.insn	2, 0x0064
 31c:	685f6c63          	bltu	t5,t0,9b4 <$d.5+0x137>
 320:	0069                	.insn	2, 0x0069
 322:	7261                	.insn	2, 0x7261
 324:	66003067          	.insn	4, 0x66003067
 328:	7461                	.insn	2, 0x7461
 32a:	635f 756f 746e      	.insn	6, 0x746e756f635f
 330:	7000                	.insn	2, 0x7000
 332:	6972                	.insn	2, 0x6972
 334:	746e                	.insn	2, 0x746e
 336:	0066                	.insn	2, 0x0066
 338:	735f6473          	csrrsi	s0,mhpmevent21h,30
 33c:	6365                	.insn	2, 0x6365
 33e:	6f74                	.insn	2, 0x6f74
 340:	0072                	.insn	2, 0x0072
 342:	74636573          	csrrsi	a0,0x746,6
 346:	6600726f          	jal	tp,79a6 <$d.5+0x66cc>
 34a:	746d                	.insn	2, 0x746d
 34c:	6100                	.insn	2, 0x6100
 34e:	6772                	.insn	2, 0x6772
 350:	0032                	.insn	2, 0x0032
 352:	657a6973          	csrrsi	s2,hviprio2h,20
 356:	6a00                	.insn	2, 0x6a00
 358:	7500                	.insn	2, 0x7500
 35a:	7300                	.insn	2, 0x7300
 35c:	6365                	.insn	2, 0x6365
 35e:	6f74                	.insn	2, 0x6f74
 360:	7372                	.insn	2, 0x7372
 362:	705f 7265 635f      	.insn	6, 0x635f7265705f
 368:	756c                	.insn	2, 0x756c
 36a:	72657473          	csrrci	s0,mhpmevent6h,10
 36e:	7000                	.insn	2, 0x7000
 370:	7475                	.insn	2, 0x7475
 372:	72616863          	bltu	sp,t1,aa2 <$d.5+0x225>
 376:	7000                	.insn	2, 0x7000
 378:	7261                	.insn	2, 0x7261
 37a:	755f6573          	csrrsi	a0,0x755,30
 37e:	65003233          	.insn	4, 0x65003233
 382:	6978                	.insn	2, 0x6978
 384:	0074                	.insn	2, 0x0074
 386:	61006863          	bltu	zero,a6,996 <$d.5+0x119>
 38a:	6772                	.insn	2, 0x6772
 38c:	0031                	.insn	2, 0x0031
 38e:	6176                	.insn	2, 0x6176
 390:	6772                	.insn	2, 0x6772
 392:	0073                	.short	0x0073

セクション .comment の逆アセンブル:

00000000 <$d.1>:
   0:	5500                	.insn	2, 0x5500
   2:	7562                	.insn	2, 0x7562
   4:	746e                	.insn	2, 0x746e
   6:	2075                	.insn	2, 0x2075
   8:	6e616c63          	bltu	sp,t1,700 <$d.3+0x236>
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
   0:	2441                	.insn	2, 0x2441
   2:	0000                	.insn	2, 0x0000
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <$d.1+0x14>
   c:	001a                	.insn	2, 0x001a
   e:	0000                	.insn	2, 0x0000
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	.insn	2, 0x5f31
  1c:	697a                	.insn	2, 0x697a
  1e:	32727363          	bgeu	tp,t2,344 <$d.6+0xec>
  22:	3070                	.insn	2, 0x3070
	...

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
  20:	0848                	.insn	2, 0x0848
  22:	0000                	.insn	2, 0x0000
  24:	0e44                	.insn	2, 0x0e44
  26:	01f0                	.insn	2, 0x01f0
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
  4c:	0864                	.insn	2, 0x0864
  4e:	0040                	.insn	2, 0x0040
  50:	00cc                	.insn	2, 0x00cc
  52:	0000                	.insn	2, 0x0000
  54:	001c                	.insn	2, 0x001c
  56:	0000                	.insn	2, 0x0000
  58:	0000                	.insn	2, 0x0000
  5a:	0000                	.insn	2, 0x0000
  5c:	0930                	.insn	2, 0x0930
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
  90:	09ec                	.insn	2, 0x09ec
  92:	0040                	.insn	2, 0x0040
  94:	0018                	.insn	2, 0x0018
  96:	0000                	.insn	2, 0x0000
  98:	0010                	.insn	2, 0x0010
  9a:	0000                	.insn	2, 0x0000
  9c:	0074                	.insn	2, 0x0074
  9e:	0000                	.insn	2, 0x0000
  a0:	0a04                	.insn	2, 0x0a04
  a2:	0040                	.insn	2, 0x0040
  a4:	0304                	.insn	2, 0x0304
  a6:	0000                	.insn	2, 0x0000
  a8:	0e44                	.insn	2, 0x0e44
  aa:	0060                	.insn	2, 0x0060
  ac:	000c                	.insn	2, 0x000c
  ae:	0000                	.insn	2, 0x0000
  b0:	0074                	.insn	2, 0x0074
  b2:	0000                	.insn	2, 0x0000
  b4:	0d08                	.insn	2, 0x0d08
  b6:	0040                	.insn	2, 0x0040
  b8:	0014                	.insn	2, 0x0014
  ba:	0000                	.insn	2, 0x0000
  bc:	000c                	.insn	2, 0x000c
  be:	0000                	.insn	2, 0x0000
  c0:	0074                	.insn	2, 0x0074
  c2:	0000                	.insn	2, 0x0000
  c4:	0d1c                	.insn	2, 0x0d1c
  c6:	0040                	.insn	2, 0x0040
  c8:	0014                	.insn	2, 0x0014
  ca:	0000                	.insn	2, 0x0000
  cc:	000c                	.insn	2, 0x000c
  ce:	0000                	.insn	2, 0x0000
  d0:	0074                	.insn	2, 0x0074
  d2:	0000                	.insn	2, 0x0000
  d4:	0d30                	.insn	2, 0x0d30
  d6:	0040                	.insn	2, 0x0040
  d8:	000c                	.insn	2, 0x000c
  da:	0000                	.insn	2, 0x0000
  dc:	000c                	.insn	2, 0x000c
  de:	0000                	.insn	2, 0x0000
  e0:	0074                	.insn	2, 0x0074
  e2:	0000                	.insn	2, 0x0000
  e4:	0d3c                	.insn	2, 0x0d3c
  e6:	0040                	.insn	2, 0x0040
  e8:	000c                	.insn	2, 0x000c
  ea:	0000                	.insn	2, 0x0000
  ec:	000c                	.insn	2, 0x000c
  ee:	0000                	.insn	2, 0x0000
  f0:	0074                	.insn	2, 0x0074
  f2:	0000                	.insn	2, 0x0000
  f4:	0d48                	.insn	2, 0x0d48
  f6:	0040                	.insn	2, 0x0040
  f8:	000c                	.insn	2, 0x000c
  fa:	0000                	.insn	2, 0x0000
  fc:	000c                	.insn	2, 0x000c
  fe:	0000                	.insn	2, 0x0000
 100:	0074                	.insn	2, 0x0074
 102:	0000                	.insn	2, 0x0000
 104:	0d54                	.insn	2, 0x0d54
 106:	0040                	.insn	2, 0x0040
 108:	0034                	.insn	2, 0x0034
 10a:	0000                	.insn	2, 0x0000
 10c:	000c                	.insn	2, 0x000c
 10e:	0000                	.insn	2, 0x0000
 110:	0074                	.insn	2, 0x0074
 112:	0000                	.insn	2, 0x0000
 114:	0d88                	.insn	2, 0x0d88
 116:	0040                	.insn	2, 0x0040
 118:	0040                	.insn	2, 0x0040
 11a:	0000                	.insn	2, 0x0000
 11c:	002c                	.insn	2, 0x002c
 11e:	0000                	.insn	2, 0x0000
 120:	0074                	.insn	2, 0x0074
 122:	0000                	.insn	2, 0x0000
 124:	0dc8                	.insn	2, 0x0dc8
 126:	0040                	.insn	2, 0x0040
 128:	0308                	.insn	2, 0x0308
 12a:	0000                	.insn	2, 0x0000
 12c:	0e44                	.insn	2, 0x0e44
 12e:	7470                	.insn	2, 0x7470
 130:	0981                	.insn	2, 0x0981
 132:	0a88                	.insn	2, 0x0a88
 134:	0b89                	.insn	2, 0x0b89
 136:	0c92                	.insn	2, 0x0c92
 138:	0e940d93          	addi	s11,s0,233
 13c:	0f95                	.insn	2, 0x0f95
 13e:	1096                	.insn	2, 0x1096
 140:	12981197          	auipc	gp,0x12981
 144:	1399                	.insn	2, 0x1399
 146:	149a                	.insn	2, 0x149a
 148:	0000159b          	.insn	4, 0x159b
 14c:	0020                	.insn	2, 0x0020
 14e:	0000                	.insn	2, 0x0000
 150:	0074                	.insn	2, 0x0074
 152:	0000                	.insn	2, 0x0000
 154:	10d0                	.insn	2, 0x10d0
 156:	0040                	.insn	2, 0x0040
 158:	00f0                	.insn	2, 0x00f0
 15a:	0000                	.insn	2, 0x0000
 15c:	0e44                	.insn	2, 0x0e44
 15e:	5c20                	.insn	2, 0x5c20
 160:	0181                	.insn	2, 0x0181
 162:	0288                	.insn	2, 0x0288
 164:	0389                	.insn	2, 0x0389
 166:	0492                	.insn	2, 0x0492
 168:	06940593          	addi	a1,s0,105
 16c:	0795                	.insn	2, 0x0795
 16e:	0000                	.insn	2, 0x0000
 170:	0018                	.insn	2, 0x0018
 172:	0000                	.insn	2, 0x0000
 174:	0074                	.insn	2, 0x0074
 176:	0000                	.insn	2, 0x0000
 178:	11c0                	.insn	2, 0x11c0
 17a:	0040                	.insn	2, 0x0040
 17c:	0084                	.insn	2, 0x0084
 17e:	0000                	.insn	2, 0x0000
 180:	0e54                	.insn	2, 0x0e54
 182:	5010                	.insn	2, 0x5010
 184:	0181                	.insn	2, 0x0181
 186:	0288                	.insn	2, 0x0288
 188:	0389                	.insn	2, 0x0389
 18a:	0492                	.insn	2, 0x0492
 18c:	000c                	.insn	2, 0x000c
 18e:	0000                	.insn	2, 0x0000
 190:	0074                	.insn	2, 0x0074
 192:	0000                	.insn	2, 0x0000
 194:	1244                	.insn	2, 0x1244
 196:	0040                	.insn	2, 0x0040
 198:	0014                	.insn	2, 0x0014
 19a:	0000                	.insn	2, 0x0000
 19c:	000c                	.insn	2, 0x000c
 19e:	0000                	.insn	2, 0x0000
 1a0:	0074                	.insn	2, 0x0074
 1a2:	0000                	.insn	2, 0x0000
 1a4:	1258                	.insn	2, 0x1258
 1a6:	0040                	.insn	2, 0x0040
 1a8:	000c                	.insn	2, 0x000c
 1aa:	0000                	.insn	2, 0x0000
 1ac:	000c                	.insn	2, 0x000c
 1ae:	0000                	.insn	2, 0x0000
 1b0:	0074                	.insn	2, 0x0074
 1b2:	0000                	.insn	2, 0x0000
 1b4:	0000                	.insn	2, 0x0000
 1b6:	0040                	.insn	2, 0x0040
 1b8:	001c                	.insn	2, 0x001c
	...

000001bc <$d.10>:
 1bc:	0010                	.insn	2, 0x0010
 1be:	0000                	.insn	2, 0x0000
 1c0:	ffff                	.insn	2, 0xffff
 1c2:	ffff                	.insn	2, 0xffff
 1c4:	0004                	.insn	2, 0x0004
 1c6:	0004                	.insn	2, 0x0004
 1c8:	7c01                	.insn	2, 0x7c01
 1ca:	0c01                	.insn	2, 0x0c01
 1cc:	0002                	.insn	2, 0x0002
 1ce:	0000                	.insn	2, 0x0000
 1d0:	0018                	.insn	2, 0x0018
 1d2:	0000                	.insn	2, 0x0000
 1d4:	01bc                	.insn	2, 0x01bc
 1d6:	0000                	.insn	2, 0x0000
 1d8:	1264                	.insn	2, 0x1264
 1da:	0040                	.insn	2, 0x0040
 1dc:	00f0                	.insn	2, 0x00f0
 1de:	0000                	.insn	2, 0x0000
 1e0:	0e44                	.insn	2, 0x0e44
 1e2:	04a0                	.insn	2, 0x04a0
 1e4:	814c                	.insn	2, 0x814c
 1e6:	8801                	.insn	2, 0x8801
 1e8:	8902                	.insn	2, 0x8902
 1ea:	00180003          	lb	zero,1(a6)
 1ee:	0000                	.insn	2, 0x0000
 1f0:	01bc                	.insn	2, 0x01bc
 1f2:	0000                	.insn	2, 0x0000
 1f4:	1354                	.insn	2, 0x1354
 1f6:	0040                	.insn	2, 0x0040
 1f8:	012c                	.insn	2, 0x012c
 1fa:	0000                	.insn	2, 0x0000
 1fc:	0e44                	.insn	2, 0x0e44
 1fe:	5010                	.insn	2, 0x5010
 200:	0181                	.insn	2, 0x0181
 202:	0288                	.insn	2, 0x0288
 204:	0389                	.insn	2, 0x0389
 206:	0492                	.insn	2, 0x0492
 208:	0028                	.insn	2, 0x0028
 20a:	0000                	.insn	2, 0x0000
 20c:	01bc                	.insn	2, 0x01bc
 20e:	0000                	.insn	2, 0x0000
 210:	1480                	.insn	2, 0x1480
 212:	0040                	.insn	2, 0x0040
 214:	02a8                	.insn	2, 0x02a8
 216:	0000                	.insn	2, 0x0000
 218:	0e44                	.insn	2, 0x0e44
 21a:	7040                	.insn	2, 0x7040
 21c:	0181                	.insn	2, 0x0181
 21e:	0288                	.insn	2, 0x0288
 220:	0389                	.insn	2, 0x0389
 222:	0492                	.insn	2, 0x0492
 224:	06940593          	addi	a1,s0,105
 228:	0795                	.insn	2, 0x0795
 22a:	0896                	.insn	2, 0x0896
 22c:	0a980997          	auipc	s3,0xa980
 230:	0b99                	.insn	2, 0x0b99
 232:	0c9a                	.insn	2, 0x0c9a
 234:	0014                	.insn	2, 0x0014
 236:	0000                	.insn	2, 0x0000
 238:	01bc                	.insn	2, 0x01bc
 23a:	0000                	.insn	2, 0x0000
 23c:	1728                	.insn	2, 0x1728
 23e:	0040                	.insn	2, 0x0040
 240:	0040                	.insn	2, 0x0040
 242:	0000                	.insn	2, 0x0000
 244:	0e44                	.insn	2, 0x0e44
 246:	4810                	.insn	2, 0x4810
 248:	0181                	.insn	2, 0x0181
 24a:	0288                	.insn	2, 0x0288
 24c:	0020                	.insn	2, 0x0020
 24e:	0000                	.insn	2, 0x0000
 250:	01bc                	.insn	2, 0x01bc
 252:	0000                	.insn	2, 0x0000
 254:	1768                	.insn	2, 0x1768
 256:	0040                	.insn	2, 0x0040
 258:	0260                	.insn	2, 0x0260
 25a:	0000                	.insn	2, 0x0000
 25c:	0e44                	.insn	2, 0x0e44
 25e:	6020                	.insn	2, 0x6020
 260:	0181                	.insn	2, 0x0181
 262:	0288                	.insn	2, 0x0288
 264:	0389                	.insn	2, 0x0389
 266:	0492                	.insn	2, 0x0492
 268:	06940593          	addi	a1,s0,105
 26c:	0795                	.insn	2, 0x0795
 26e:	0896                	.insn	2, 0x0896

セクション .debug_line の逆アセンブル:

00000000 <$d.10>:
       0:	083c                	.insn	2, 0x083c
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
      5c:	0905                	.insn	2, 0x0905
      5e:	0306                	.insn	2, 0x0306
      60:	091a                	.insn	2, 0x091a
      62:	018c                	.insn	2, 0x018c
      64:	0501                	.insn	2, 0x0501
      66:	0618                	.insn	2, 0x0618
      68:	0c090003          	lb	zero,192(s2)
      6c:	0100                	.insn	2, 0x0100
      6e:	2605                	.insn	2, 0x2605
      70:	0c090003          	lb	zero,192(s2)
      74:	0100                	.insn	2, 0x0100
      76:	3405                	.insn	2, 0x3405
      78:	0c090003          	lb	zero,192(s2)
      7c:	0100                	.insn	2, 0x0100
      7e:	4205                	.insn	2, 0x4205
      80:	0c090003          	lb	zero,192(s2)
      84:	0100                	.insn	2, 0x0100
      86:	0905                	.insn	2, 0x0905
      88:	0306                	.insn	2, 0x0306
      8a:	0902                	.insn	2, 0x0902
      8c:	000c                	.insn	2, 0x000c
      8e:	0301                	.insn	2, 0x0301
      90:	0901                	.insn	2, 0x0901
      92:	000c                	.insn	2, 0x000c
      94:	0301                	.insn	2, 0x0301
      96:	0901                	.insn	2, 0x0901
      98:	000c                	.insn	2, 0x000c
      9a:	0301                	.insn	2, 0x0301
      9c:	0901                	.insn	2, 0x0901
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
      ba:	0902                	.insn	2, 0x0902
      bc:	000c                	.insn	2, 0x000c
      be:	0501                	.insn	2, 0x0501
      c0:	0618                	.insn	2, 0x0618
      c2:	0c090003          	lb	zero,192(s2)
      c6:	0100                	.insn	2, 0x0100
      c8:	2605                	.insn	2, 0x2605
      ca:	0c090003          	lb	zero,192(s2)
      ce:	0100                	.insn	2, 0x0100
      d0:	3405                	.insn	2, 0x3405
      d2:	0c090003          	lb	zero,192(s2)
      d6:	0100                	.insn	2, 0x0100
      d8:	0c095b03          	lhu	s6,192(s2)
      dc:	0100                	.insn	2, 0x0100
      de:	1905                	.insn	2, 0x1905
      e0:	0306                	.insn	2, 0x0306
      e2:	00080937          	lui	s2,0x80
      e6:	0501                	.insn	2, 0x0501
      e8:	0315                	.insn	2, 0x0315
      ea:	0901                	.insn	2, 0x0901
      ec:	0004                	.insn	2, 0x0004
      ee:	0501                	.insn	2, 0x0501
      f0:	0316                	.insn	2, 0x0316
      f2:	00040977          	.insn	4, 0x00040977
      f6:	0501                	.insn	2, 0x0501
      f8:	031c                	.insn	2, 0x031c
      fa:	00080903          	lb	s2,0(a6)
      fe:	0501                	.insn	2, 0x0501
     100:	0319                	.insn	2, 0x0319
     102:	0905                	.insn	2, 0x0905
     104:	0008                	.insn	2, 0x0008
     106:	0601                	.insn	2, 0x0601
     108:	08094903          	lbu	s2,128(s2) # 80080 <$d.5+0x7eda6>
     10c:	0100                	.insn	2, 0x0100
     10e:	08093703          	.insn	4, 0x08093703
     112:	0100                	.insn	2, 0x0100
     114:	04094903          	lbu	s2,64(s2)
     118:	0100                	.insn	2, 0x0100
     11a:	1105                	.insn	2, 0x1105
     11c:	0306                	.insn	2, 0x0306
     11e:	00d0                	.insn	2, 0x00d0
     120:	0809                	.insn	2, 0x0809
     122:	0100                	.insn	2, 0x0100
     124:	0d05                	.insn	2, 0x0d05
     126:	08090603          	lb	a2,128(s2)
     12a:	0100                	.insn	2, 0x0100
     12c:	1805                	.insn	2, 0x1805
     12e:	0306                	.insn	2, 0x0306
     130:	0900                	.insn	2, 0x0900
     132:	0004                	.insn	2, 0x0004
     134:	0501                	.insn	2, 0x0501
     136:	031c                	.insn	2, 0x031c
     138:	0900                	.insn	2, 0x0900
     13a:	0004                	.insn	2, 0x0004
     13c:	0501                	.insn	2, 0x0501
     13e:	0618                	.insn	2, 0x0618
     140:	08096303          	.insn	4, 0x08096303
     144:	0100                	.insn	2, 0x0100
     146:	1505                	.insn	2, 0x1505
     148:	04090303          	lb	t1,64(s2)
     14c:	0100                	.insn	2, 0x0100
     14e:	0c090103          	lb	sp,192(s2)
     152:	0100                	.insn	2, 0x0100
     154:	0306                	.insn	2, 0x0306
     156:	000c0943          	.insn	4, 0x000c0943
     15a:	0501                	.insn	2, 0x0501
     15c:	0611                	.insn	2, 0x0611
     15e:	0900c603          	lbu	a2,144(ra) # 11598 <$d.5+0x102be>
     162:	0014                	.insn	2, 0x0014
     164:	0301                	.insn	2, 0x0301
     166:	0901                	.insn	2, 0x0901
     168:	000c                	.insn	2, 0x000c
     16a:	0501                	.insn	2, 0x0501
     16c:	061e                	.insn	2, 0x061e
     16e:	04090003          	lb	zero,64(s2)
     172:	0100                	.insn	2, 0x0100
     174:	097fb903          	.insn	4, 0x097fb903
     178:	0008                	.insn	2, 0x0008
     17a:	0501                	.insn	2, 0x0501
     17c:	062a                	.insn	2, 0x062a
     17e:	0900e403          	.insn	4, 0x0900e403
     182:	0008                	.insn	2, 0x0008
     184:	0501                	.insn	2, 0x0501
     186:	0610                	.insn	2, 0x0610
     188:	04090003          	lb	zero,64(s2)
     18c:	0100                	.insn	2, 0x0100
     18e:	097f9c03          	lh	s8,151(t6)
     192:	0008                	.insn	2, 0x0008
     194:	0501                	.insn	2, 0x0501
     196:	0616                	.insn	2, 0x0616
     198:	0900e703          	.insn	4, 0x0900e703
     19c:	0014                	.insn	2, 0x0014
     19e:	0501                	.insn	2, 0x0501
     1a0:	060d                	.insn	2, 0x060d
     1a2:	04090003          	lb	zero,64(s2)
     1a6:	0100                	.insn	2, 0x0100
     1a8:	1a05                	.insn	2, 0x1a05
     1aa:	08090003          	lb	zero,128(s2)
     1ae:	0100                	.insn	2, 0x0100
     1b0:	0d05                	.insn	2, 0x0d05
     1b2:	0306                	.insn	2, 0x0306
     1b4:	0902                	.insn	2, 0x0902
     1b6:	0004                	.insn	2, 0x0004
     1b8:	0501                	.insn	2, 0x0501
     1ba:	0614                	.insn	2, 0x0614
     1bc:	04090003          	lb	zero,64(s2)
     1c0:	0100                	.insn	2, 0x0100
     1c2:	1705                	.insn	2, 0x1705
     1c4:	04090003          	lb	zero,64(s2)
     1c8:	0100                	.insn	2, 0x0100
     1ca:	3405                	.insn	2, 0x3405
     1cc:	0c090003          	lb	zero,192(s2)
     1d0:	0100                	.insn	2, 0x0100
     1d2:	0d05                	.insn	2, 0x0d05
     1d4:	04090003          	lb	zero,64(s2)
     1d8:	0100                	.insn	2, 0x0100
     1da:	1405                	.insn	2, 0x1405
     1dc:	04090003          	lb	zero,64(s2)
     1e0:	0100                	.insn	2, 0x0100
     1e2:	1205                	.insn	2, 0x1205
     1e4:	0306                	.insn	2, 0x0306
     1e6:	000c0903          	lb	s2,0(s8) # 32608 <$d.5+0x3132e>
     1ea:	0501                	.insn	2, 0x0501
     1ec:	0600                	.insn	2, 0x0600
     1ee:	097f9403          	lh	s0,151(t6)
     1f2:	0008                	.insn	2, 0x0008
     1f4:	0501                	.insn	2, 0x0501
     1f6:	0614                	.insn	2, 0x0614
     1f8:	0900ed03          	.insn	4, 0x0900ed03
     1fc:	0004                	.insn	2, 0x0004
     1fe:	0501                	.insn	2, 0x0501
     200:	061e                	.insn	2, 0x061e
     202:	04090003          	lb	zero,64(s2)
     206:	0100                	.insn	2, 0x0100
     208:	0905                	.insn	2, 0x0905
     20a:	0306                	.insn	2, 0x0306
     20c:	0979                	.insn	2, 0x0979
     20e:	0008                	.insn	2, 0x0008
     210:	0501                	.insn	2, 0x0501
     212:	0314                	.insn	2, 0x0314
     214:	090d                	.insn	2, 0x090d
     216:	000c                	.insn	2, 0x000c
     218:	0501                	.insn	2, 0x0501
     21a:	060d                	.insn	2, 0x060d
     21c:	04090003          	lb	zero,64(s2)
     220:	0100                	.insn	2, 0x0100
     222:	10090003          	lb	zero,256(s2)
     226:	0100                	.insn	2, 0x0100
     228:	1405                	.insn	2, 0x1405
     22a:	0306                	.insn	2, 0x0306
     22c:	0904                	.insn	2, 0x0904
     22e:	0004                	.insn	2, 0x0004
     230:	0601                	.insn	2, 0x0601
     232:	10090003          	lb	zero,256(s2)
     236:	0100                	.insn	2, 0x0100
     238:	0306                	.insn	2, 0x0306
     23a:	091d                	.insn	2, 0x091d
     23c:	0004                	.insn	2, 0x0004
     23e:	0601                	.insn	2, 0x0601
     240:	10090003          	lb	zero,256(s2)
     244:	0100                	.insn	2, 0x0100
     246:	0306                	.insn	2, 0x0306
     248:	090c                	.insn	2, 0x090c
     24a:	0004                	.insn	2, 0x0004
     24c:	0601                	.insn	2, 0x0601
     24e:	10090003          	lb	zero,256(s2)
     252:	0100                	.insn	2, 0x0100
     254:	0306                	.insn	2, 0x0306
     256:	090d                	.insn	2, 0x090d
     258:	0004                	.insn	2, 0x0004
     25a:	0601                	.insn	2, 0x0601
     25c:	10090003          	lb	zero,256(s2)
     260:	0100                	.insn	2, 0x0100
     262:	0306                	.insn	2, 0x0306
     264:	090a                	.insn	2, 0x090a
     266:	0004                	.insn	2, 0x0004
     268:	0601                	.insn	2, 0x0601
     26a:	10090003          	lb	zero,256(s2)
     26e:	0100                	.insn	2, 0x0100
     270:	0306                	.insn	2, 0x0306
     272:	090a                	.insn	2, 0x090a
     274:	0004                	.insn	2, 0x0004
     276:	0601                	.insn	2, 0x0601
     278:	10090003          	lb	zero,256(s2)
     27c:	0100                	.insn	2, 0x0100
     27e:	0306                	.insn	2, 0x0306
     280:	090e                	.insn	2, 0x090e
     282:	0004                	.insn	2, 0x0004
     284:	0601                	.insn	2, 0x0601
     286:	10090003          	lb	zero,256(s2)
     28a:	0100                	.insn	2, 0x0100
     28c:	0306                	.insn	2, 0x0306
     28e:	0905                	.insn	2, 0x0905
     290:	0004                	.insn	2, 0x0004
     292:	0601                	.insn	2, 0x0601
     294:	10090003          	lb	zero,256(s2)
     298:	0100                	.insn	2, 0x0100
     29a:	0306                	.insn	2, 0x0306
     29c:	090a                	.insn	2, 0x090a
     29e:	0004                	.insn	2, 0x0004
     2a0:	0601                	.insn	2, 0x0601
     2a2:	10090003          	lb	zero,256(s2)
     2a6:	0100                	.insn	2, 0x0100
     2a8:	0306                	.insn	2, 0x0306
     2aa:	0004090b          	.insn	4, 0x0004090b
     2ae:	0501                	.insn	2, 0x0501
     2b0:	0631                	.insn	2, 0x0631
     2b2:	10090003          	lb	zero,256(s2)
     2b6:	0100                	.insn	2, 0x0100
     2b8:	1405                	.insn	2, 0x1405
     2ba:	0306                	.insn	2, 0x0306
     2bc:	0901                	.insn	2, 0x0901
     2be:	0004                	.insn	2, 0x0004
     2c0:	0501                	.insn	2, 0x0501
     2c2:	0631                	.insn	2, 0x0631
     2c4:	10090003          	lb	zero,256(s2)
     2c8:	0100                	.insn	2, 0x0100
     2ca:	1405                	.insn	2, 0x1405
     2cc:	0306                	.insn	2, 0x0306
     2ce:	0901                	.insn	2, 0x0901
     2d0:	0004                	.insn	2, 0x0004
     2d2:	0301                	.insn	2, 0x0301
     2d4:	097e                	.insn	2, 0x097e
     2d6:	0010                	.insn	2, 0x0010
     2d8:	0601                	.insn	2, 0x0601
     2da:	097e9703          	lh	a4,151(t4)
     2de:	0004                	.insn	2, 0x0004
     2e0:	0501                	.insn	2, 0x0501
     2e2:	060d                	.insn	2, 0x060d
     2e4:	0901ef03          	.insn	4, 0x0901ef03
     2e8:	0004                	.insn	2, 0x0004
     2ea:	0601                	.insn	2, 0x0601
     2ec:	097e9103          	lh	sp,151(t4)
     2f0:	000c                	.insn	2, 0x000c
     2f2:	0501                	.insn	2, 0x0501
     2f4:	0611                	.insn	2, 0x0611
     2f6:	0900fd03          	.insn	4, 0x0900fd03
     2fa:	000c                	.insn	2, 0x000c
     2fc:	0501                	.insn	2, 0x0501
     2fe:	031f 0901 0004      	.insn	6, 0x00040901031f
     304:	0501                	.insn	2, 0x0501
     306:	0305                	.insn	2, 0x0305
     308:	018d                	.insn	2, 0x018d
     30a:	0409                	.insn	2, 0x0409
     30c:	0100                	.insn	2, 0x0100
     30e:	0306                	.insn	2, 0x0306
     310:	7df5                	.insn	2, 0x7df5
     312:	0409                	.insn	2, 0x0409
     314:	0100                	.insn	2, 0x0100
     316:	09028b03          	lb	s6,144(t0) # 31944b3 <USER_MAX+0x2c944b3>
     31a:	000c                	.insn	2, 0x000c
     31c:	0501                	.insn	2, 0x0501
     31e:	030c                	.insn	2, 0x030c
     320:	0900                	.insn	2, 0x0900
     322:	0004                	.insn	2, 0x0004
     324:	0501                	.insn	2, 0x0501
     326:	0316                	.insn	2, 0x0316
     328:	0900                	.insn	2, 0x0900
     32a:	0004                	.insn	2, 0x0004
     32c:	0501                	.insn	2, 0x0501
     32e:	0619                	.insn	2, 0x0619
     330:	10090303          	lb	t1,256(s2)
     334:	0100                	.insn	2, 0x0100
     336:	2505                	.insn	2, 0x2505
     338:	0306                	.insn	2, 0x0306
     33a:	0900                	.insn	2, 0x0900
     33c:	0004                	.insn	2, 0x0004
     33e:	0501                	.insn	2, 0x0501
     340:	060a                	.insn	2, 0x060a
     342:	0c090103          	lb	sp,192(s2)
     346:	0100                	.insn	2, 0x0100
     348:	0306                	.insn	2, 0x0306
     34a:	7df1                	.insn	2, 0x7df1
     34c:	0409                	.insn	2, 0x0409
     34e:	0100                	.insn	2, 0x0100
     350:	1105                	.insn	2, 0x1105
     352:	0306                	.insn	2, 0x0306
     354:	0196                	.insn	2, 0x0196
     356:	0809                	.insn	2, 0x0809
     358:	0100                	.insn	2, 0x0100
     35a:	2105                	.insn	2, 0x2105
     35c:	04090103          	lb	sp,64(s2)
     360:	0100                	.insn	2, 0x0100
     362:	1705                	.insn	2, 0x1705
     364:	0306                	.insn	2, 0x0306
     366:	0900                	.insn	2, 0x0900
     368:	0004                	.insn	2, 0x0004
     36a:	0301                	.insn	2, 0x0301
     36c:	7ee9                	.insn	2, 0x7ee9
     36e:	0809                	.insn	2, 0x0809
     370:	0100                	.insn	2, 0x0100
     372:	1505                	.insn	2, 0x1505
     374:	0306                	.insn	2, 0x0306
     376:	0198                	.insn	2, 0x0198
     378:	0809                	.insn	2, 0x0809
     37a:	0100                	.insn	2, 0x0100
     37c:	0306                	.insn	2, 0x0306
     37e:	7ee8                	.insn	2, 0x7ee8
     380:	0409                	.insn	2, 0x0409
     382:	0100                	.insn	2, 0x0100
     384:	0306                	.insn	2, 0x0306
     386:	0199                	.insn	2, 0x0199
     388:	0409                	.insn	2, 0x0409
     38a:	0100                	.insn	2, 0x0100
     38c:	0306                	.insn	2, 0x0306
     38e:	08097ee7          	.insn	4, 0x08097ee7
     392:	0100                	.insn	2, 0x0100
     394:	1105                	.insn	2, 0x1105
     396:	0306                	.insn	2, 0x0306
     398:	01a2                	.insn	2, 0x01a2
     39a:	0809                	.insn	2, 0x0809
     39c:	0100                	.insn	2, 0x0100
     39e:	2805                	.insn	2, 0x2805
     3a0:	04090103          	lb	sp,64(s2)
     3a4:	0100                	.insn	2, 0x0100
     3a6:	1e05                	.insn	2, 0x1e05
     3a8:	0306                	.insn	2, 0x0306
     3aa:	0900                	.insn	2, 0x0900
     3ac:	0004                	.insn	2, 0x0004
     3ae:	0501                	.insn	2, 0x0501
     3b0:	0615                	.insn	2, 0x0615
     3b2:	08090103          	lb	sp,128(s2)
     3b6:	0100                	.insn	2, 0x0100
     3b8:	0306                	.insn	2, 0x0306
     3ba:	7edc                	.insn	2, 0x7edc
     3bc:	0809                	.insn	2, 0x0809
     3be:	0100                	.insn	2, 0x0100
     3c0:	0306                	.insn	2, 0x0306
     3c2:	01a5                	.insn	2, 0x01a5
     3c4:	0409                	.insn	2, 0x0409
     3c6:	0100                	.insn	2, 0x0100
     3c8:	0306                	.insn	2, 0x0306
     3ca:	08097edb          	.insn	4, 0x08097edb
     3ce:	0100                	.insn	2, 0x0100
     3d0:	0d05                	.insn	2, 0x0d05
     3d2:	0306                	.insn	2, 0x0306
     3d4:	0189                	.insn	2, 0x0189
     3d6:	0c09                	.insn	2, 0x0c09
     3d8:	0100                	.insn	2, 0x0100
     3da:	0306                	.insn	2, 0x0306
     3dc:	08097ef7          	.insn	4, 0x08097ef7
     3e0:	0100                	.insn	2, 0x0100
     3e2:	0a05                	.insn	2, 0x0a05
     3e4:	0306                	.insn	2, 0x0306
     3e6:	0409028f          	.insn	4, 0x0409028f
     3ea:	0100                	.insn	2, 0x0100
     3ec:	0905                	.insn	2, 0x0905
     3ee:	0306                	.insn	2, 0x0306
     3f0:	0900                	.insn	2, 0x0900
     3f2:	0004                	.insn	2, 0x0004
     3f4:	0301                	.insn	2, 0x0301
     3f6:	7df1                	.insn	2, 0x7df1
     3f8:	0409                	.insn	2, 0x0409
     3fa:	0100                	.insn	2, 0x0100
     3fc:	1105                	.insn	2, 0x1105
     3fe:	0306                	.insn	2, 0x0306
     400:	01ae                	.insn	2, 0x01ae
     402:	0809                	.insn	2, 0x0809
     404:	0100                	.insn	2, 0x0100
     406:	2805                	.insn	2, 0x2805
     408:	04090503          	lb	a0,64(s2)
     40c:	0100                	.insn	2, 0x0100
     40e:	1e05                	.insn	2, 0x1e05
     410:	0306                	.insn	2, 0x0306
     412:	0900                	.insn	2, 0x0900
     414:	0004                	.insn	2, 0x0004
     416:	0501                	.insn	2, 0x0501
     418:	060d                	.insn	2, 0x060d
     41a:	08090103          	lb	sp,128(s2)
     41e:	0100                	.insn	2, 0x0100
     420:	0306                	.insn	2, 0x0306
     422:	7ecc                	.insn	2, 0x7ecc
     424:	0809                	.insn	2, 0x0809
     426:	0100                	.insn	2, 0x0100
     428:	0306                	.insn	2, 0x0306
     42a:	019d                	.insn	2, 0x019d
     42c:	1009                	.insn	2, 0x1009
     42e:	0100                	.insn	2, 0x0100
     430:	0306                	.insn	2, 0x0306
     432:	08097ee3          	bgeu	s2,zero,cce <$d.5+0x451>
     436:	0100                	.insn	2, 0x0100
     438:	09019d03          	lh	s10,144(gp) # 129811d0 <USER_MAX+0x124811d0>
     43c:	0004                	.insn	2, 0x0004
     43e:	0301                	.insn	2, 0x0301
     440:	08097ee3          	bgeu	s2,zero,cdc <$d.5+0x45f>
     444:	0100                	.insn	2, 0x0100
     446:	1105                	.insn	2, 0x1105
     448:	0306                	.insn	2, 0x0306
     44a:	01b8                	.insn	2, 0x01b8
     44c:	0409                	.insn	2, 0x0409
     44e:	0100                	.insn	2, 0x0100
     450:	2c05                	.insn	2, 0x2c05
     452:	04090503          	lb	a0,64(s2)
     456:	0100                	.insn	2, 0x0100
     458:	2205                	.insn	2, 0x2205
     45a:	0306                	.insn	2, 0x0306
     45c:	0900                	.insn	2, 0x0900
     45e:	0004                	.insn	2, 0x0004
     460:	0501                	.insn	2, 0x0501
     462:	060d                	.insn	2, 0x060d
     464:	08090103          	lb	sp,128(s2)
     468:	0100                	.insn	2, 0x0100
     46a:	0306                	.insn	2, 0x0306
     46c:	7ec2                	.insn	2, 0x7ec2
     46e:	0809                	.insn	2, 0x0809
     470:	0100                	.insn	2, 0x0100
     472:	0306                	.insn	2, 0x0306
     474:	01aa                	.insn	2, 0x01aa
     476:	0c09                	.insn	2, 0x0c09
     478:	0100                	.insn	2, 0x0100
     47a:	0306                	.insn	2, 0x0306
     47c:	7ed6                	.insn	2, 0x7ed6
     47e:	0809                	.insn	2, 0x0809
     480:	0100                	.insn	2, 0x0100
     482:	0901aa03          	lw	s4,144(gp)
     486:	0004                	.insn	2, 0x0004
     488:	0301                	.insn	2, 0x0301
     48a:	7ed6                	.insn	2, 0x7ed6
     48c:	0809                	.insn	2, 0x0809
     48e:	0100                	.insn	2, 0x0100
     490:	1605                	.insn	2, 0x1605
     492:	0306                	.insn	2, 0x0306
     494:	0294                	.insn	2, 0x0294
     496:	1009                	.insn	2, 0x1009
     498:	0100                	.insn	2, 0x0100
     49a:	0005                	.insn	2, 0x0005
     49c:	0306                	.insn	2, 0x0306
     49e:	7dec                	.insn	2, 0x7dec
     4a0:	0809                	.insn	2, 0x0809
     4a2:	0100                	.insn	2, 0x0100
     4a4:	0c05                	.insn	2, 0x0c05
     4a6:	0306                	.insn	2, 0x0306
     4a8:	0291                	.insn	2, 0x0291
     4aa:	0409                	.insn	2, 0x0409
     4ac:	0100                	.insn	2, 0x0100
     4ae:	0005                	.insn	2, 0x0005
     4b0:	0306                	.insn	2, 0x0306
     4b2:	04097def          	jal	s11,974f2 <$d.5+0x96218>
     4b6:	0100                	.insn	2, 0x0100
     4b8:	1005                	.insn	2, 0x1005
     4ba:	0306                	.insn	2, 0x0306
     4bc:	0298                	.insn	2, 0x0298
     4be:	0409                	.insn	2, 0x0409
     4c0:	0100                	.insn	2, 0x0100
     4c2:	1605                	.insn	2, 0x1605
     4c4:	0306                	.insn	2, 0x0306
     4c6:	0900                	.insn	2, 0x0900
     4c8:	0004                	.insn	2, 0x0004
     4ca:	0501                	.insn	2, 0x0501
     4cc:	0605                	.insn	2, 0x0605
     4ce:	04097903          	.insn	4, 0x04097903
     4d2:	0100                	.insn	2, 0x0100
     4d4:	0306                	.insn	2, 0x0306
     4d6:	04097def          	jal	s11,97516 <$d.5+0x9623c>
     4da:	0100                	.insn	2, 0x0100
     4dc:	1605                	.insn	2, 0x1605
     4de:	0306                	.insn	2, 0x0306
     4e0:	0294                	.insn	2, 0x0294
     4e2:	0409                	.insn	2, 0x0409
     4e4:	0100                	.insn	2, 0x0100
     4e6:	1b05                	.insn	2, 0x1b05
     4e8:	10090103          	lb	sp,256(s2)
     4ec:	0100                	.insn	2, 0x0100
     4ee:	14090103          	lb	sp,320(s2)
     4f2:	0100                	.insn	2, 0x0100
     4f4:	1105                	.insn	2, 0x1105
     4f6:	097eed03          	.insn	4, 0x097eed03
     4fa:	0010                	.insn	2, 0x0010
     4fc:	0501                	.insn	2, 0x0501
     4fe:	031f 0901 0008      	.insn	6, 0x00080901031f
     504:	0501                	.insn	2, 0x0501
     506:	0305                	.insn	2, 0x0305
     508:	04090187          	.insn	4, 0x04090187
     50c:	0100                	.insn	2, 0x0100
     50e:	0306                	.insn	2, 0x0306
     510:	7df5                	.insn	2, 0x7df5
     512:	0409                	.insn	2, 0x0409
     514:	0100                	.insn	2, 0x0100
     516:	09028b03          	lb	s6,144(t0)
     51a:	0004                	.insn	2, 0x0004
     51c:	0501                	.insn	2, 0x0501
     51e:	030c                	.insn	2, 0x030c
     520:	0900                	.insn	2, 0x0900
     522:	0004                	.insn	2, 0x0004
     524:	0501                	.insn	2, 0x0501
     526:	0316                	.insn	2, 0x0316
     528:	0900                	.insn	2, 0x0900
     52a:	0004                	.insn	2, 0x0004
     52c:	0501                	.insn	2, 0x0501
     52e:	0619                	.insn	2, 0x0619
     530:	10090303          	lb	t1,256(s2)
     534:	0100                	.insn	2, 0x0100
     536:	2505                	.insn	2, 0x2505
     538:	0306                	.insn	2, 0x0306
     53a:	0900                	.insn	2, 0x0900
     53c:	0004                	.insn	2, 0x0004
     53e:	0501                	.insn	2, 0x0501
     540:	060a                	.insn	2, 0x060a
     542:	0c090103          	lb	sp,192(s2)
     546:	0100                	.insn	2, 0x0100
     548:	0905                	.insn	2, 0x0905
     54a:	0306                	.insn	2, 0x0306
     54c:	0900                	.insn	2, 0x0900
     54e:	0004                	.insn	2, 0x0004
     550:	0301                	.insn	2, 0x0301
     552:	7df1                	.insn	2, 0x7df1
     554:	0809                	.insn	2, 0x0809
     556:	0100                	.insn	2, 0x0100
     558:	09028f03          	lb	t5,144(t0)
     55c:	0004                	.insn	2, 0x0004
     55e:	0501                	.insn	2, 0x0501
     560:	0611                	.insn	2, 0x0611
     562:	097fb403          	.insn	4, 0x097fb403
     566:	0008                	.insn	2, 0x0008
     568:	0601                	.insn	2, 0x0601
     56a:	097ebd03          	.insn	4, 0x097ebd03
     56e:	0008                	.insn	2, 0x0008
     570:	0301                	.insn	2, 0x0301
     572:	040901c3          	.insn	4, 0x040901c3
     576:	0100                	.insn	2, 0x0100
     578:	097ebd03          	.insn	4, 0x097ebd03
     57c:	0004                	.insn	2, 0x0004
     57e:	0601                	.insn	2, 0x0601
     580:	0901c403          	lbu	s0,144(gp)
     584:	0004                	.insn	2, 0x0004
     586:	0601                	.insn	2, 0x0601
     588:	097ebc03          	.insn	4, 0x097ebc03
     58c:	0008                	.insn	2, 0x0008
     58e:	0501                	.insn	2, 0x0501
     590:	060d                	.insn	2, 0x060d
     592:	0901d103          	lhu	sp,144(gp)
     596:	0018                	.insn	2, 0x0018
     598:	0601                	.insn	2, 0x0601
     59a:	097eaf03          	lw	t5,151(t4)
     59e:	0008                	.insn	2, 0x0008
     5a0:	0501                	.insn	2, 0x0501
     5a2:	0616                	.insn	2, 0x0616
     5a4:	09029403          	lh	s0,144(t0)
     5a8:	0028                	.insn	2, 0x0028
     5aa:	0501                	.insn	2, 0x0501
     5ac:	0600                	.insn	2, 0x0600
     5ae:	097dec03          	.insn	4, 0x097dec03
     5b2:	0008                	.insn	2, 0x0008
     5b4:	0501                	.insn	2, 0x0501
     5b6:	060c                	.insn	2, 0x060c
     5b8:	09029103          	lh	sp,144(t0)
     5bc:	0004                	.insn	2, 0x0004
     5be:	0501                	.insn	2, 0x0501
     5c0:	0600                	.insn	2, 0x0600
     5c2:	097def03          	.insn	4, 0x097def03
     5c6:	0004                	.insn	2, 0x0004
     5c8:	0501                	.insn	2, 0x0501
     5ca:	0610                	.insn	2, 0x0610
     5cc:	09029803          	lh	a6,144(t0)
     5d0:	0004                	.insn	2, 0x0004
     5d2:	0501                	.insn	2, 0x0501
     5d4:	0616                	.insn	2, 0x0616
     5d6:	04090003          	lb	zero,64(s2)
     5da:	0100                	.insn	2, 0x0100
     5dc:	0505                	.insn	2, 0x0505
     5de:	0306                	.insn	2, 0x0306
     5e0:	0979                	.insn	2, 0x0979
     5e2:	0004                	.insn	2, 0x0004
     5e4:	0501                	.insn	2, 0x0501
     5e6:	0316                	.insn	2, 0x0316
     5e8:	00080903          	lb	s2,0(a6)
     5ec:	0501                	.insn	2, 0x0501
     5ee:	0901031b          	.insn	4, 0x0901031b
     5f2:	0010                	.insn	2, 0x0010
     5f4:	0301                	.insn	2, 0x0301
     5f6:	0901                	.insn	2, 0x0901
     5f8:	0014                	.insn	2, 0x0014
     5fa:	0501                	.insn	2, 0x0501
     5fc:	030d                	.insn	2, 0x030d
     5fe:	10097ef3          	csrrci	t4,sstatus,18
     602:	0100                	.insn	2, 0x0100
     604:	0306                	.insn	2, 0x0306
     606:	08097ef7          	.insn	4, 0x08097ef7
     60a:	0100                	.insn	2, 0x0100
     60c:	1105                	.insn	2, 0x1105
     60e:	0306                	.insn	2, 0x0306
     610:	01d6                	.insn	2, 0x01d6
     612:	0809                	.insn	2, 0x0809
     614:	0100                	.insn	2, 0x0100
     616:	1705                	.insn	2, 0x1705
     618:	04090503          	lb	a0,64(s2)
     61c:	0100                	.insn	2, 0x0100
     61e:	0d05                	.insn	2, 0x0d05
     620:	0306                	.insn	2, 0x0306
     622:	0900                	.insn	2, 0x0900
     624:	0004                	.insn	2, 0x0004
     626:	0301                	.insn	2, 0x0301
     628:	7ea5                	.insn	2, 0x7ea5
     62a:	0809                	.insn	2, 0x0809
     62c:	0100                	.insn	2, 0x0100
     62e:	3205                	.insn	2, 0x3205
     630:	0306                	.insn	2, 0x0306
     632:	01c8                	.insn	2, 0x01c8
     634:	0809                	.insn	2, 0x0809
     636:	0100                	.insn	2, 0x0100
     638:	0306                	.insn	2, 0x0306
     63a:	7eb8                	.insn	2, 0x7eb8
     63c:	0809                	.insn	2, 0x0809
     63e:	0100                	.insn	2, 0x0100
     640:	0d05                	.insn	2, 0x0d05
     642:	0901c803          	lbu	a6,144(gp)
     646:	0004                	.insn	2, 0x0004
     648:	0501                	.insn	2, 0x0501
     64a:	0632                	.insn	2, 0x0632
     64c:	08090103          	lb	sp,128(s2)
     650:	0100                	.insn	2, 0x0100
     652:	0d05                	.insn	2, 0x0d05
     654:	0306                	.insn	2, 0x0306
     656:	0900                	.insn	2, 0x0900
     658:	0008                	.insn	2, 0x0008
     65a:	0501                	.insn	2, 0x0501
     65c:	0632                	.insn	2, 0x0632
     65e:	08090103          	lb	sp,128(s2)
     662:	0100                	.insn	2, 0x0100
     664:	0d05                	.insn	2, 0x0d05
     666:	0306                	.insn	2, 0x0306
     668:	0900                	.insn	2, 0x0900
     66a:	0008                	.insn	2, 0x0008
     66c:	0501                	.insn	2, 0x0501
     66e:	0632                	.insn	2, 0x0632
     670:	08090103          	lb	sp,128(s2)
     674:	0100                	.insn	2, 0x0100
     676:	0d05                	.insn	2, 0x0d05
     678:	0306                	.insn	2, 0x0306
     67a:	0900                	.insn	2, 0x0900
     67c:	0008                	.insn	2, 0x0008
     67e:	0501                	.insn	2, 0x0501
     680:	0632                	.insn	2, 0x0632
     682:	08090103          	lb	sp,128(s2)
     686:	0100                	.insn	2, 0x0100
     688:	0d05                	.insn	2, 0x0d05
     68a:	0306                	.insn	2, 0x0306
     68c:	0900                	.insn	2, 0x0900
     68e:	0008                	.insn	2, 0x0008
     690:	0301                	.insn	2, 0x0301
     692:	7eb4                	.insn	2, 0x7eb4
     694:	0809                	.insn	2, 0x0809
     696:	0100                	.insn	2, 0x0100
     698:	1105                	.insn	2, 0x1105
     69a:	0306                	.insn	2, 0x0306
     69c:	1c0901d7          	.insn	4, 0x1c0901d7
     6a0:	0100                	.insn	2, 0x0100
     6a2:	0306                	.insn	2, 0x0306
     6a4:	7ea9                	.insn	2, 0x7ea9
     6a6:	0809                	.insn	2, 0x0809
     6a8:	0100                	.insn	2, 0x0100
     6aa:	0d05                	.insn	2, 0x0d05
     6ac:	0306                	.insn	2, 0x0306
     6ae:	01ec                	.insn	2, 0x01ec
     6b0:	0409                	.insn	2, 0x0409
     6b2:	0100                	.insn	2, 0x0100
     6b4:	0505                	.insn	2, 0x0505
     6b6:	030a                	.insn	2, 0x030a
     6b8:	091f 0008 0501      	.insn	6, 0x05010008091f
     6be:	060c                	.insn	2, 0x060c
     6c0:	14090003          	lb	zero,320(s2)
     6c4:	0100                	.insn	2, 0x0100
     6c6:	1605                	.insn	2, 0x1605
     6c8:	04090003          	lb	zero,64(s2)
     6cc:	0100                	.insn	2, 0x0100
     6ce:	097df503          	.insn	4, 0x097df503
     6d2:	0008                	.insn	2, 0x0008
     6d4:	0301                	.insn	2, 0x0301
     6d6:	0409028b          	.insn	4, 0x0409028b
     6da:	0100                	.insn	2, 0x0100
     6dc:	1905                	.insn	2, 0x1905
     6de:	0306                	.insn	2, 0x0306
     6e0:	00040903          	lb	s2,0(s0)
     6e4:	0501                	.insn	2, 0x0501
     6e6:	0625                	.insn	2, 0x0625
     6e8:	04090003          	lb	zero,64(s2)
     6ec:	0100                	.insn	2, 0x0100
     6ee:	0a05                	.insn	2, 0x0a05
     6f0:	0306                	.insn	2, 0x0306
     6f2:	0901                	.insn	2, 0x0901
     6f4:	000c                	.insn	2, 0x000c
     6f6:	0601                	.insn	2, 0x0601
     6f8:	097df103          	.insn	4, 0x097df103
     6fc:	0004                	.insn	2, 0x0004
     6fe:	0301                	.insn	2, 0x0301
     700:	0809028f          	.insn	4, 0x0809028f
     704:	0100                	.insn	2, 0x0100
     706:	0905                	.insn	2, 0x0905
     708:	04090003          	lb	zero,64(s2)
     70c:	0100                	.insn	2, 0x0100
     70e:	097df103          	.insn	4, 0x097df103
     712:	0004                	.insn	2, 0x0004
     714:	0501                	.insn	2, 0x0501
     716:	0601                	.insn	2, 0x0601
     718:	09029c03          	lh	s8,144(t0)
     71c:	0004                	.insn	2, 0x0004
     71e:	0601                	.insn	2, 0x0601
     720:	097de403          	.insn	4, 0x097de403
     724:	0004                	.insn	2, 0x0004
     726:	0501                	.insn	2, 0x0501
     728:	0616                	.insn	2, 0x0616
     72a:	09029403          	lh	s0,144(t0)
     72e:	000c                	.insn	2, 0x000c
     730:	0501                	.insn	2, 0x0501
     732:	0600                	.insn	2, 0x0600
     734:	097dec03          	.insn	4, 0x097dec03
     738:	0014                	.insn	2, 0x0014
     73a:	0501                	.insn	2, 0x0501
     73c:	060c                	.insn	2, 0x060c
     73e:	09029103          	lh	sp,144(t0)
     742:	0004                	.insn	2, 0x0004
     744:	0501                	.insn	2, 0x0501
     746:	0600                	.insn	2, 0x0600
     748:	097def03          	.insn	4, 0x097def03
     74c:	0004                	.insn	2, 0x0004
     74e:	0501                	.insn	2, 0x0501
     750:	0610                	.insn	2, 0x0610
     752:	09029803          	lh	a6,144(t0)
     756:	0004                	.insn	2, 0x0004
     758:	0501                	.insn	2, 0x0501
     75a:	0616                	.insn	2, 0x0616
     75c:	04090003          	lb	zero,64(s2)
     760:	0100                	.insn	2, 0x0100
     762:	0505                	.insn	2, 0x0505
     764:	0306                	.insn	2, 0x0306
     766:	0979                	.insn	2, 0x0979
     768:	0004                	.insn	2, 0x0004
     76a:	0601                	.insn	2, 0x0601
     76c:	097def03          	.insn	4, 0x097def03
     770:	0004                	.insn	2, 0x0004
     772:	0501                	.insn	2, 0x0501
     774:	0616                	.insn	2, 0x0616
     776:	09029403          	lh	s0,144(t0)
     77a:	0004                	.insn	2, 0x0004
     77c:	0501                	.insn	2, 0x0501
     77e:	0901031b          	.insn	4, 0x0901031b
     782:	0010                	.insn	2, 0x0010
     784:	0301                	.insn	2, 0x0301
     786:	0901                	.insn	2, 0x0901
     788:	0010                	.insn	2, 0x0010
     78a:	0601                	.insn	2, 0x0601
     78c:	097dea03          	.insn	4, 0x097dea03
     790:	0010                	.insn	2, 0x0010
     792:	0501                	.insn	2, 0x0501
     794:	060a                	.insn	2, 0x060a
     796:	09029a03          	lh	s4,144(t0)
     79a:	0004                	.insn	2, 0x0004
     79c:	0501                	.insn	2, 0x0501
     79e:	0301                	.insn	2, 0x0301
     7a0:	0902                	.insn	2, 0x0902
     7a2:	0004                	.insn	2, 0x0004
     7a4:	0501                	.insn	2, 0x0501
     7a6:	0300                	.insn	2, 0x0300
     7a8:	095a                	.insn	2, 0x095a
     7aa:	0004                	.insn	2, 0x0004
     7ac:	0501                	.insn	2, 0x0501
     7ae:	0a05                	.insn	2, 0x0a05
     7b0:	24090203          	lb	tp,576(s2)
     7b4:	0100                	.insn	2, 0x0100
     7b6:	0306                	.insn	2, 0x0306
     7b8:	7e88                	.insn	2, 0x7e88
     7ba:	0409                	.insn	2, 0x0409
     7bc:	0100                	.insn	2, 0x0100
     7be:	2505                	.insn	2, 0x2505
     7c0:	0901f803          	.insn	4, 0x0901f803
     7c4:	000c                	.insn	2, 0x000c
     7c6:	0501                	.insn	2, 0x0501
     7c8:	0305                	.insn	2, 0x0305
     7ca:	0900                	.insn	2, 0x0900
     7cc:	0004                	.insn	2, 0x0004
     7ce:	0501                	.insn	2, 0x0501
     7d0:	060d                	.insn	2, 0x060d
     7d2:	04090103          	lb	sp,64(s2)
     7d6:	0100                	.insn	2, 0x0100
     7d8:	0306                	.insn	2, 0x0306
     7da:	0c097e87          	.insn	4, 0x0c097e87
     7de:	0100                	.insn	2, 0x0100
     7e0:	0306                	.insn	2, 0x0306
     7e2:	01fa                	.insn	2, 0x01fa
     7e4:	0409                	.insn	2, 0x0409
     7e6:	0100                	.insn	2, 0x0100
     7e8:	1205                	.insn	2, 0x1205
     7ea:	10090103          	lb	sp,256(s2)
     7ee:	0100                	.insn	2, 0x0100
     7f0:	1d05                	.insn	2, 0x1d05
     7f2:	04090103          	lb	sp,64(s2)
     7f6:	0100                	.insn	2, 0x0100
     7f8:	1105                	.insn	2, 0x1105
     7fa:	08090103          	lb	sp,128(s2)
     7fe:	0100                	.insn	2, 0x0100
     800:	0306                	.insn	2, 0x0306
     802:	0c097e83          	.insn	4, 0x0c097e83
     806:	0100                	.insn	2, 0x0100
     808:	1505                	.insn	2, 0x1505
     80a:	0306                	.insn	2, 0x0306
     80c:	0280                	.insn	2, 0x0280
     80e:	0409                	.insn	2, 0x0409
     810:	0100                	.insn	2, 0x0100
     812:	0905                	.insn	2, 0x0905
     814:	0306                	.insn	2, 0x0306
     816:	0900                	.insn	2, 0x0900
     818:	0004                	.insn	2, 0x0004
     81a:	0601                	.insn	2, 0x0601
     81c:	04090103          	lb	sp,64(s2)
     820:	0100                	.insn	2, 0x0100
     822:	0505                	.insn	2, 0x0505
     824:	0c090203          	lb	tp,192(s2)
     828:	0100                	.insn	2, 0x0100
     82a:	0306                	.insn	2, 0x0306
     82c:	7dfd                	.insn	2, 0x7dfd
     82e:	1809                	.insn	2, 0x1809
     830:	0100                	.insn	2, 0x0100
     832:	0283030b          	.insn	4, 0x0283030b
     836:	0c09                	.insn	2, 0x0c09
     838:	0100                	.insn	2, 0x0100
     83a:	0c09                	.insn	2, 0x0c09
     83c:	0000                	.insn	2, 0x0000
     83e:	0101                	.insn	2, 0x0101

00000840 <$d.11>:
     840:	07b0                	.insn	2, 0x07b0
     842:	0000                	.insn	2, 0x0000
     844:	0004                	.insn	2, 0x0004
     846:	0060                	.insn	2, 0x0060
     848:	0000                	.insn	2, 0x0000
     84a:	0101                	.insn	2, 0x0101
     84c:	fb01                	.insn	2, 0xfb01
     84e:	0d0e                	.insn	2, 0x0d0e
     850:	0100                	.insn	2, 0x0100
     852:	0101                	.insn	2, 0x0101
     854:	0001                	.insn	2, 0x0001
     856:	0000                	.insn	2, 0x0000
     858:	0001                	.insn	2, 0x0001
     85a:	0100                	.insn	2, 0x0100
     85c:	2f2e                	.insn	2, 0x2f2e
     85e:	00637273          	csrrci	tp,0x6,6
     862:	7273752f          	.insn	4, 0x7273752f
     866:	62696c2f          	.insn	4, 0x62696c2f
     86a:	766c6c2f          	.insn	4, 0x766c6c2f
     86e:	2d6d                	.insn	2, 0x2d6d
     870:	3831                	.insn	2, 0x3831
     872:	62696c2f          	.insn	4, 0x62696c2f
     876:	616c632f          	.insn	4, 0x616c632f
     87a:	676e                	.insn	2, 0x676e
     87c:	2f38312f          	.insn	4, 0x2f38312f
     880:	6e69                	.insn	2, 0x6e69
     882:	64756c63          	bltu	a0,t2,eda <$d.3+0x172>
     886:	0065                	.insn	2, 0x0065
     888:	7500                	.insn	2, 0x7500
     88a:	2e726573          	csrrsi	a0,0x2e7,4
     88e:	00010063          	beqz	sp,88e <$d.5+0x11>
     892:	7300                	.insn	2, 0x7300
     894:	6474                	.insn	2, 0x6474
     896:	6e69                	.insn	2, 0x6e69
     898:	2e74                	.insn	2, 0x2e74
     89a:	0068                	.insn	2, 0x0068
     89c:	0002                	.insn	2, 0x0002
     89e:	7500                	.insn	2, 0x7500
     8a0:	2e726573          	csrrsi	a0,0x2e7,4
     8a4:	0068                	.insn	2, 0x0068
     8a6:	0001                	.insn	2, 0x0001
     8a8:	0000                	.insn	2, 0x0000
     8aa:	0505                	.insn	2, 0x0505
     8ac:	000a                	.insn	2, 0x000a
     8ae:	0205                	.insn	2, 0x0205
     8b0:	09ec                	.insn	2, 0x09ec
     8b2:	0040                	.insn	2, 0x0040
     8b4:	03013f03          	.insn	4, 0x03013f03
     8b8:	00140913          	addi	s2,s0,1
     8bc:	0501                	.insn	2, 0x0501
     8be:	0300                	.insn	2, 0x0300
     8c0:	0925                	.insn	2, 0x0925
     8c2:	0004                	.insn	2, 0x0004
     8c4:	0501                	.insn	2, 0x0501
     8c6:	0a05                	.insn	2, 0x0a05
     8c8:	08091203          	lh	tp,128(s2)
     8cc:	0100                	.insn	2, 0x0100
     8ce:	0306                	.insn	2, 0x0306
     8d0:	7ef6                	.insn	2, 0x7ef6
     8d2:	0409                	.insn	2, 0x0409
     8d4:	0100                	.insn	2, 0x0100
     8d6:	0905                	.insn	2, 0x0905
     8d8:	0306                	.insn	2, 0x0306
     8da:	1409018b          	.insn	4, 0x1409018b
     8de:	0100                	.insn	2, 0x0100
     8e0:	1e05                	.insn	2, 0x1e05
     8e2:	1c090303          	lb	t1,448(s2)
     8e6:	0100                	.insn	2, 0x0100
     8e8:	1c05                	.insn	2, 0x1c05
     8ea:	0306                	.insn	2, 0x0306
     8ec:	0900                	.insn	2, 0x0900
     8ee:	0008                	.insn	2, 0x0008
     8f0:	0501                	.insn	2, 0x0501
     8f2:	061e                	.insn	2, 0x061e
     8f4:	04090103          	lb	sp,64(s2)
     8f8:	0100                	.insn	2, 0x0100
     8fa:	1c05                	.insn	2, 0x1c05
     8fc:	0306                	.insn	2, 0x0306
     8fe:	0900                	.insn	2, 0x0900
     900:	0004                	.insn	2, 0x0004
     902:	0501                	.insn	2, 0x0501
     904:	0620                	.insn	2, 0x0620
     906:	04097c03          	.insn	4, 0x04097c03
     90a:	0100                	.insn	2, 0x0100
     90c:	2c05                	.insn	2, 0x2c05
     90e:	14097f03          	.insn	4, 0x14097f03
     912:	0100                	.insn	2, 0x0100
     914:	0505                	.insn	2, 0x0505
     916:	0306                	.insn	2, 0x0306
     918:	0900                	.insn	2, 0x0900
     91a:	0004                	.insn	2, 0x0004
     91c:	0301                	.insn	2, 0x0301
     91e:	7ef6                	.insn	2, 0x7ef6
     920:	1009                	.insn	2, 0x1009
     922:	0100                	.insn	2, 0x0100
     924:	0306                	.insn	2, 0x0306
     926:	03d4                	.insn	2, 0x03d4
     928:	1009                	.insn	2, 0x1009
     92a:	0100                	.insn	2, 0x0100
     92c:	0306                	.insn	2, 0x0306
     92e:	7cac                	.insn	2, 0x7cac
     930:	1c09                	.insn	2, 0x1c09
     932:	0100                	.insn	2, 0x0100
     934:	0306                	.insn	2, 0x0306
     936:	03a5                	.insn	2, 0x03a5
     938:	0409                	.insn	2, 0x0409
     93a:	0100                	.insn	2, 0x0100
     93c:	0306                	.insn	2, 0x0306
     93e:	0900                	.insn	2, 0x0900
     940:	0010                	.insn	2, 0x0010
     942:	0601                	.insn	2, 0x0601
     944:	097dfe03          	.insn	4, 0x097dfe03
     948:	000c                	.insn	2, 0x000c
     94a:	0601                	.insn	2, 0x0601
     94c:	097edd03          	lhu	s10,151(t4)
     950:	0004                	.insn	2, 0x0004
     952:	0501                	.insn	2, 0x0501
     954:	0609                	.insn	2, 0x0609
     956:	0901a403          	lw	s0,144(gp)
     95a:	0010                	.insn	2, 0x0010
     95c:	0501                	.insn	2, 0x0501
     95e:	031c                	.insn	2, 0x031c
     960:	0901                	.insn	2, 0x0901
     962:	0010                	.insn	2, 0x0010
     964:	0501                	.insn	2, 0x0501
     966:	0305                	.insn	2, 0x0305
     968:	029a                	.insn	2, 0x029a
     96a:	0409                	.insn	2, 0x0409
     96c:	0100                	.insn	2, 0x0100
     96e:	0c096603          	.insn	4, 0x0c096603
     972:	0100                	.insn	2, 0x0100
     974:	2005                	.insn	2, 0x2005
     976:	097dff03          	.insn	4, 0x097dff03
     97a:	000c                	.insn	2, 0x000c
     97c:	0501                	.insn	2, 0x0501
     97e:	0305                	.insn	2, 0x0305
     980:	0281                	.insn	2, 0x0281
     982:	0809                	.insn	2, 0x0809
     984:	0100                	.insn	2, 0x0100
     986:	2c05                	.insn	2, 0x2c05
     988:	097dfe03          	.insn	4, 0x097dfe03
     98c:	000c                	.insn	2, 0x000c
     98e:	0501                	.insn	2, 0x0501
     990:	0605                	.insn	2, 0x0605
     992:	04090003          	lb	zero,64(s2)
     996:	0100                	.insn	2, 0x0100
     998:	097edd03          	lhu	s10,151(t4)
     99c:	000c                	.insn	2, 0x000c
     99e:	0601                	.insn	2, 0x0601
     9a0:	0903d403          	lhu	s0,144(t2)
     9a4:	0010                	.insn	2, 0x0010
     9a6:	0301                	.insn	2, 0x0301
     9a8:	0951                	.insn	2, 0x0951
     9aa:	0020                	.insn	2, 0x0020
     9ac:	0601                	.insn	2, 0x0601
     9ae:	10090003          	lb	zero,256(s2)
     9b2:	0100                	.insn	2, 0x0100
     9b4:	097cdb03          	lhu	s6,151(s9)
     9b8:	000c                	.insn	2, 0x000c
     9ba:	0301                	.insn	2, 0x0301
     9bc:	03a5                	.insn	2, 0x03a5
     9be:	0409                	.insn	2, 0x0409
     9c0:	0100                	.insn	2, 0x0100
     9c2:	10090003          	lb	zero,256(s2)
     9c6:	0100                	.insn	2, 0x0100
     9c8:	0c090003          	lb	zero,192(s2)
     9cc:	0100                	.insn	2, 0x0100
     9ce:	0306                	.insn	2, 0x0306
     9d0:	7e8a                	.insn	2, 0x7e8a
     9d2:	0c09                	.insn	2, 0x0c09
     9d4:	0100                	.insn	2, 0x0100
     9d6:	0306                	.insn	2, 0x0306
     9d8:	7ed1                	.insn	2, 0x7ed1
     9da:	0409                	.insn	2, 0x0409
     9dc:	0100                	.insn	2, 0x0100
     9de:	0905                	.insn	2, 0x0905
     9e0:	0306                	.insn	2, 0x0306
     9e2:	01b0                	.insn	2, 0x01b0
     9e4:	1409                	.insn	2, 0x1409
     9e6:	0100                	.insn	2, 0x0100
     9e8:	1c05                	.insn	2, 0x1c05
     9ea:	10090103          	lb	sp,256(s2)
     9ee:	0100                	.insn	2, 0x0100
     9f0:	0505                	.insn	2, 0x0505
     9f2:	09028e03          	lb	t3,144(t0)
     9f6:	0004                	.insn	2, 0x0004
     9f8:	0301                	.insn	2, 0x0301
     9fa:	0966                	.insn	2, 0x0966
     9fc:	000c                	.insn	2, 0x000c
     9fe:	0501                	.insn	2, 0x0501
     a00:	0320                	.insn	2, 0x0320
     a02:	0c097e8b          	.insn	4, 0x0c097e8b
     a06:	0100                	.insn	2, 0x0100
     a08:	0505                	.insn	2, 0x0505
     a0a:	0901f503          	.insn	4, 0x0901f503
     a0e:	0008                	.insn	2, 0x0008
     a10:	0501                	.insn	2, 0x0501
     a12:	032c                	.insn	2, 0x032c
     a14:	7e8a                	.insn	2, 0x7e8a
     a16:	0c09                	.insn	2, 0x0c09
     a18:	0100                	.insn	2, 0x0100
     a1a:	0505                	.insn	2, 0x0505
     a1c:	0306                	.insn	2, 0x0306
     a1e:	0900                	.insn	2, 0x0900
     a20:	0004                	.insn	2, 0x0004
     a22:	0301                	.insn	2, 0x0301
     a24:	7ed1                	.insn	2, 0x7ed1
     a26:	0c09                	.insn	2, 0x0c09
     a28:	0100                	.insn	2, 0x0100
     a2a:	0306                	.insn	2, 0x0306
     a2c:	03a5                	.insn	2, 0x03a5
     a2e:	0409                	.insn	2, 0x0409
     a30:	0100                	.insn	2, 0x0100
     a32:	0306                	.insn	2, 0x0306
     a34:	0900                	.insn	2, 0x0900
     a36:	0010                	.insn	2, 0x0010
     a38:	0301                	.insn	2, 0x0301
     a3a:	0900                	.insn	2, 0x0900
     a3c:	000c                	.insn	2, 0x000c
     a3e:	0301                	.insn	2, 0x0301
     a40:	10097cdb          	.insn	4, 0x10097cdb
     a44:	0100                	.insn	2, 0x0100
     a46:	0903a503          	lw	a0,144(t2)
     a4a:	0004                	.insn	2, 0x0004
     a4c:	0301                	.insn	2, 0x0301
     a4e:	0900                	.insn	2, 0x0900
     a50:	0010                	.insn	2, 0x0010
     a52:	0301                	.insn	2, 0x0301
     a54:	0900                	.insn	2, 0x0900
     a56:	000c                	.insn	2, 0x000c
     a58:	0301                	.insn	2, 0x0301
     a5a:	0c097cdb          	.insn	4, 0x0c097cdb
     a5e:	0100                	.insn	2, 0x0100
     a60:	0903a503          	lw	a0,144(t2)
     a64:	0004                	.insn	2, 0x0004
     a66:	0301                	.insn	2, 0x0301
     a68:	0900                	.insn	2, 0x0900
     a6a:	0010                	.insn	2, 0x0010
     a6c:	0301                	.insn	2, 0x0301
     a6e:	0900                	.insn	2, 0x0900
     a70:	000c                	.insn	2, 0x000c
     a72:	0601                	.insn	2, 0x0601
     a74:	097e9603          	lh	a2,151(t4)
     a78:	000c                	.insn	2, 0x000c
     a7a:	0601                	.insn	2, 0x0601
     a7c:	097ec503          	lbu	a0,151(t4)
     a80:	0004                	.insn	2, 0x0004
     a82:	0501                	.insn	2, 0x0501
     a84:	061c                	.insn	2, 0x061c
     a86:	0901bd03          	.insn	4, 0x0901bd03
     a8a:	0018                	.insn	2, 0x0018
     a8c:	0501                	.insn	2, 0x0501
     a8e:	0305                	.insn	2, 0x0305
     a90:	0282                	.insn	2, 0x0282
     a92:	0409                	.insn	2, 0x0409
     a94:	0100                	.insn	2, 0x0100
     a96:	0c096603          	.insn	4, 0x0c096603
     a9a:	0100                	.insn	2, 0x0100
     a9c:	2005                	.insn	2, 0x2005
     a9e:	097e9703          	lh	a4,151(t4)
     aa2:	000c                	.insn	2, 0x000c
     aa4:	0501                	.insn	2, 0x0501
     aa6:	0305                	.insn	2, 0x0305
     aa8:	01e9                	.insn	2, 0x01e9
     aaa:	0c09                	.insn	2, 0x0c09
     aac:	0100                	.insn	2, 0x0100
     aae:	2c05                	.insn	2, 0x2c05
     ab0:	097e9603          	lh	a2,151(t4)
     ab4:	000c                	.insn	2, 0x000c
     ab6:	0501                	.insn	2, 0x0501
     ab8:	0605                	.insn	2, 0x0605
     aba:	04090003          	lb	zero,64(s2)
     abe:	0100                	.insn	2, 0x0100
     ac0:	097ec503          	lbu	a0,151(t4)
     ac4:	0008                	.insn	2, 0x0008
     ac6:	0601                	.insn	2, 0x0601
     ac8:	0903a503          	lw	a0,144(t2)
     acc:	0004                	.insn	2, 0x0004
     ace:	0501                	.insn	2, 0x0501
     ad0:	0b01                	.insn	2, 0x0b01
     ad2:	097e9e03          	lh	t3,151(t4)
     ad6:	000c                	.insn	2, 0x000c
     ad8:	0501                	.insn	2, 0x0501
     ada:	0300                	.insn	2, 0x0300
     adc:	01e1                	.insn	2, 0x01e1
     ade:	0809                	.insn	2, 0x0809
     ae0:	0100                	.insn	2, 0x0100
     ae2:	0505                	.insn	2, 0x0505
     ae4:	030a                	.insn	2, 0x030a
     ae6:	0901                	.insn	2, 0x0901
     ae8:	0004                	.insn	2, 0x0004
     aea:	0501                	.insn	2, 0x0501
     aec:	0301                	.insn	2, 0x0301
     aee:	0908                	.insn	2, 0x0908
     af0:	000c                	.insn	2, 0x000c
     af2:	0501                	.insn	2, 0x0501
     af4:	0300                	.insn	2, 0x0300
     af6:	0911                	.insn	2, 0x0911
     af8:	0004                	.insn	2, 0x0004
     afa:	0501                	.insn	2, 0x0501
     afc:	0a05                	.insn	2, 0x0a05
     afe:	04090103          	lb	sp,64(s2)
     b02:	0100                	.insn	2, 0x0100
     b04:	0105                	.insn	2, 0x0105
     b06:	0c090803          	lb	a6,192(s2)
     b0a:	0100                	.insn	2, 0x0100
     b0c:	0505                	.insn	2, 0x0505
     b0e:	030a                	.insn	2, 0x030a
     b10:	0922                	.insn	2, 0x0922
     b12:	0004                	.insn	2, 0x0004
     b14:	0501                	.insn	2, 0x0501
     b16:	0301                	.insn	2, 0x0301
     b18:	7de5                	.insn	2, 0x7de5
     b1a:	0809                	.insn	2, 0x0809
     b1c:	0100                	.insn	2, 0x0100
     b1e:	0505                	.insn	2, 0x0505
     b20:	030a                	.insn	2, 0x030a
     b22:	040902ab          	.insn	4, 0x040902ab
     b26:	0100                	.insn	2, 0x0100
     b28:	0105                	.insn	2, 0x0105
     b2a:	097de003          	.insn	4, 0x097de003
     b2e:	0008                	.insn	2, 0x0008
     b30:	0501                	.insn	2, 0x0501
     b32:	0a05                	.insn	2, 0x0a05
     b34:	0902c303          	lbu	t1,144(t0)
     b38:	0004                	.insn	2, 0x0004
     b3a:	0501                	.insn	2, 0x0501
     b3c:	0301                	.insn	2, 0x0301
     b3e:	7dc9                	.insn	2, 0x7dc9
     b40:	0809                	.insn	2, 0x0809
     b42:	0100                	.insn	2, 0x0100
     b44:	0c05                	.insn	2, 0x0c05
     b46:	030a                	.insn	2, 0x030a
     b48:	0905                	.insn	2, 0x0905
     b4a:	0004                	.insn	2, 0x0004
     b4c:	0501                	.insn	2, 0x0501
     b4e:	0605                	.insn	2, 0x0605
     b50:	08090003          	lb	zero,128(s2)
     b54:	0100                	.insn	2, 0x0100
     b56:	097e9603          	lh	a2,151(t4)
     b5a:	0008                	.insn	2, 0x0008
     b5c:	0501                	.insn	2, 0x0501
     b5e:	060e                	.insn	2, 0x060e
     b60:	0901eb03          	.insn	4, 0x0901eb03
     b64:	0004                	.insn	2, 0x0004
     b66:	0501                	.insn	2, 0x0501
     b68:	030c                	.insn	2, 0x030c
     b6a:	097f 0004 0501 030b 	.insn	10, 0x0901030b05010004097f
     b72:	0901 
     b74:	0004                	.insn	2, 0x0004
     b76:	0501                	.insn	2, 0x0501
     b78:	0305                	.insn	2, 0x0305
     b7a:	097f 0004 0601 9603 	.insn	10, 0x097e960306010004097f
     b82:	097e 
     b84:	0004                	.insn	2, 0x0004
     b86:	0301                	.insn	2, 0x0301
     b88:	01ea                	.insn	2, 0x01ea
     b8a:	0409                	.insn	2, 0x0409
     b8c:	0100                	.insn	2, 0x0100
     b8e:	0805                	.insn	2, 0x0805
     b90:	0306                	.insn	2, 0x0306
     b92:	0902                	.insn	2, 0x0902
     b94:	0004                	.insn	2, 0x0004
     b96:	0501                	.insn	2, 0x0501
     b98:	0305                	.insn	2, 0x0305
     b9a:	0901                	.insn	2, 0x0901
     b9c:	0004                	.insn	2, 0x0004
     b9e:	0501                	.insn	2, 0x0501
     ba0:	0a0c                	.insn	2, 0x0a0c
     ba2:	04090403          	lb	s0,64(s2)
     ba6:	0100                	.insn	2, 0x0100
     ba8:	1005                	.insn	2, 0x1005
     baa:	0306                	.insn	2, 0x0306
     bac:	0900                	.insn	2, 0x0900
     bae:	0004                	.insn	2, 0x0004
     bb0:	0501                	.insn	2, 0x0501
     bb2:	0305                	.insn	2, 0x0305
     bb4:	0900                	.insn	2, 0x0900
     bb6:	0004                	.insn	2, 0x0004
     bb8:	0501                	.insn	2, 0x0501
     bba:	09000313          	li	t1,144
     bbe:	0004                	.insn	2, 0x0004
     bc0:	0501                	.insn	2, 0x0501
     bc2:	0305                	.insn	2, 0x0305
     bc4:	0900                	.insn	2, 0x0900
     bc6:	0008                	.insn	2, 0x0008
     bc8:	0501                	.insn	2, 0x0501
     bca:	030c                	.insn	2, 0x030c
     bcc:	0900                	.insn	2, 0x0900
     bce:	0004                	.insn	2, 0x0004
     bd0:	0501                	.insn	2, 0x0501
     bd2:	0403060b          	.insn	4, 0x0403060b
     bd6:	0409                	.insn	2, 0x0409
     bd8:	0100                	.insn	2, 0x0100
     bda:	1005                	.insn	2, 0x1005
     bdc:	04097c03          	.insn	4, 0x04097c03
     be0:	0100                	.insn	2, 0x0100
     be2:	0c05                	.insn	2, 0x0c05
     be4:	08090703          	lb	a4,128(s2)
     be8:	0100                	.insn	2, 0x0100
     bea:	0306                	.insn	2, 0x0306
     bec:	7e88                	.insn	2, 0x7e88
     bee:	0809                	.insn	2, 0x0809
     bf0:	0100                	.insn	2, 0x0100
     bf2:	2305                	.insn	2, 0x2305
     bf4:	0901f803          	.insn	4, 0x0901f803
     bf8:	0004                	.insn	2, 0x0004
     bfa:	0501                	.insn	2, 0x0501
     bfc:	0321                	.insn	2, 0x0321
     bfe:	0900                	.insn	2, 0x0900
     c00:	0004                	.insn	2, 0x0004
     c02:	0501                	.insn	2, 0x0501
     c04:	0305                	.insn	2, 0x0305
     c06:	0900                	.insn	2, 0x0900
     c08:	0004                	.insn	2, 0x0004
     c0a:	0501                	.insn	2, 0x0501
     c0c:	0600                	.insn	2, 0x0600
     c0e:	04090303          	lb	t1,64(s2)
     c12:	0100                	.insn	2, 0x0100
     c14:	0505                	.insn	2, 0x0505
     c16:	030a                	.insn	2, 0x030a
     c18:	0902                	.insn	2, 0x0902
     c1a:	005c                	.insn	2, 0x005c
     c1c:	0501                	.insn	2, 0x0501
     c1e:	030d                	.insn	2, 0x030d
     c20:	0905                	.insn	2, 0x0905
     c22:	0030                	.insn	2, 0x0030
     c24:	0501                	.insn	2, 0x0501
     c26:	030c                	.insn	2, 0x030c
     c28:	093c                	.insn	2, 0x093c
     c2a:	0004                	.insn	2, 0x0004
     c2c:	0301                	.insn	2, 0x0301
     c2e:	0941                	.insn	2, 0x0941
     c30:	0004                	.insn	2, 0x0004
     c32:	0501                	.insn	2, 0x0501
     c34:	0605                	.insn	2, 0x0605
     c36:	04090003          	lb	zero,64(s2)
     c3a:	0100                	.insn	2, 0x0100
     c3c:	0306                	.insn	2, 0x0306
     c3e:	01a6                	.insn	2, 0x01a6
     c40:	0809                	.insn	2, 0x0809
     c42:	0100                	.insn	2, 0x0100
     c44:	0c05                	.insn	2, 0x0c05
     c46:	097f9903          	lh	s2,151(t6)
     c4a:	000c                	.insn	2, 0x000c
     c4c:	0601                	.insn	2, 0x0601
     c4e:	097dc203          	lbu	tp,151(s11)
     c52:	0004                	.insn	2, 0x0004
     c54:	0501                	.insn	2, 0x0501
     c56:	0615                	.insn	2, 0x0615
     c58:	09028203          	lb	tp,144(t0)
     c5c:	0004                	.insn	2, 0x0004
     c5e:	0501                	.insn	2, 0x0501
     c60:	0310                	.insn	2, 0x0310
     c62:	097f 0004 0501 030d 	.insn	10, 0x0901030d05010004097f
     c6a:	0901 
     c6c:	0004                	.insn	2, 0x0004
     c6e:	0501                	.insn	2, 0x0501
     c70:	0321                	.insn	2, 0x0321
     c72:	0910                	.insn	2, 0x0910
     c74:	000c                	.insn	2, 0x000c
     c76:	0501                	.insn	2, 0x0501
     c78:	0319                	.insn	2, 0x0319
     c7a:	00100903          	lb	s2,1(zero) # 1 <$d.10+0x1>
     c7e:	0301                	.insn	2, 0x0301
     c80:	090d                	.insn	2, 0x090d
     c82:	0004                	.insn	2, 0x0004
     c84:	0501                	.insn	2, 0x0501
     c86:	0305                	.insn	2, 0x0305
     c88:	04090183          	lb	gp,64(s2)
     c8c:	0100                	.insn	2, 0x0100
     c8e:	0c05                	.insn	2, 0x0c05
     c90:	097f9903          	lh	s2,151(t6)
     c94:	0010                	.insn	2, 0x0010
     c96:	0601                	.insn	2, 0x0601
     c98:	097dc203          	lbu	tp,151(s11)
     c9c:	0004                	.insn	2, 0x0004
     c9e:	0501                	.insn	2, 0x0501
     ca0:	060d                	.insn	2, 0x060d
     ca2:	09028203          	lb	tp,144(t0)
     ca6:	0004                	.insn	2, 0x0004
     ca8:	0501                	.insn	2, 0x0501
     caa:	0326                	.insn	2, 0x0326
     cac:	0931                	.insn	2, 0x0931
     cae:	0008                	.insn	2, 0x0008
     cb0:	0501                	.insn	2, 0x0501
     cb2:	0332                	.insn	2, 0x0332
     cb4:	0902                	.insn	2, 0x0902
     cb6:	0010                	.insn	2, 0x0010
     cb8:	0501                	.insn	2, 0x0501
     cba:	0321                	.insn	2, 0x0321
     cbc:	0901                	.insn	2, 0x0901
     cbe:	0004                	.insn	2, 0x0004
     cc0:	0501                	.insn	2, 0x0501
     cc2:	0305                	.insn	2, 0x0305
     cc4:	080900ef          	jal	90d44 <$d.5+0x8fa6a>
     cc8:	0100                	.insn	2, 0x0100
     cca:	3e05                	.insn	2, 0x3e05
     ccc:	097f9003          	lh	zero,151(t6)
     cd0:	000c                	.insn	2, 0x000c
     cd2:	0501                	.insn	2, 0x0501
     cd4:	0321                	.insn	2, 0x0321
     cd6:	0901                	.insn	2, 0x0901
     cd8:	0008                	.insn	2, 0x0008
     cda:	0501                	.insn	2, 0x0501
     cdc:	0305                	.insn	2, 0x0305
     cde:	080900ef          	jal	90d5e <$d.5+0x8fa84>
     ce2:	0100                	.insn	2, 0x0100
     ce4:	3e05                	.insn	2, 0x3e05
     ce6:	097f9003          	lh	zero,151(t6)
     cea:	000c                	.insn	2, 0x000c
     cec:	0501                	.insn	2, 0x0501
     cee:	0321                	.insn	2, 0x0321
     cf0:	0901                	.insn	2, 0x0901
     cf2:	0008                	.insn	2, 0x0008
     cf4:	0501                	.insn	2, 0x0501
     cf6:	0305                	.insn	2, 0x0305
     cf8:	080900ef          	jal	90d78 <$d.5+0x8fa9e>
     cfc:	0100                	.insn	2, 0x0100
     cfe:	3e05                	.insn	2, 0x3e05
     d00:	097f9003          	lh	zero,151(t6)
     d04:	000c                	.insn	2, 0x000c
     d06:	0501                	.insn	2, 0x0501
     d08:	0321                	.insn	2, 0x0321
     d0a:	0901                	.insn	2, 0x0901
     d0c:	0008                	.insn	2, 0x0008
     d0e:	0501                	.insn	2, 0x0501
     d10:	0305                	.insn	2, 0x0305
     d12:	080900ef          	jal	90d92 <$d.5+0x8fab8>
     d16:	0100                	.insn	2, 0x0100
     d18:	3e05                	.insn	2, 0x3e05
     d1a:	097f9003          	lh	zero,151(t6)
     d1e:	000c                	.insn	2, 0x000c
     d20:	0501                	.insn	2, 0x0501
     d22:	0321                	.insn	2, 0x0321
     d24:	0901                	.insn	2, 0x0901
     d26:	0008                	.insn	2, 0x0008
     d28:	0501                	.insn	2, 0x0501
     d2a:	0305                	.insn	2, 0x0305
     d2c:	080900ef          	jal	90dac <$d.5+0x8fad2>
     d30:	0100                	.insn	2, 0x0100
     d32:	3e05                	.insn	2, 0x3e05
     d34:	097f9003          	lh	zero,151(t6)
     d38:	000c                	.insn	2, 0x000c
     d3a:	0501                	.insn	2, 0x0501
     d3c:	0321                	.insn	2, 0x0321
     d3e:	0901                	.insn	2, 0x0901
     d40:	0008                	.insn	2, 0x0008
     d42:	0501                	.insn	2, 0x0501
     d44:	0305                	.insn	2, 0x0305
     d46:	080900ef          	jal	90dc6 <$d.5+0x8faec>
     d4a:	0100                	.insn	2, 0x0100
     d4c:	3e05                	.insn	2, 0x3e05
     d4e:	097f9003          	lh	zero,151(t6)
     d52:	000c                	.insn	2, 0x000c
     d54:	0501                	.insn	2, 0x0501
     d56:	0321                	.insn	2, 0x0321
     d58:	0901                	.insn	2, 0x0901
     d5a:	0008                	.insn	2, 0x0008
     d5c:	0501                	.insn	2, 0x0501
     d5e:	0305                	.insn	2, 0x0305
     d60:	080900ef          	jal	90de0 <$d.5+0x8fb06>
     d64:	0100                	.insn	2, 0x0100
     d66:	3e05                	.insn	2, 0x3e05
     d68:	097f9003          	lh	zero,151(t6)
     d6c:	000c                	.insn	2, 0x000c
     d6e:	0501                	.insn	2, 0x0501
     d70:	0321                	.insn	2, 0x0321
     d72:	0901                	.insn	2, 0x0901
     d74:	0004                	.insn	2, 0x0004
     d76:	0501                	.insn	2, 0x0501
     d78:	0305                	.insn	2, 0x0305
     d7a:	080900ef          	jal	90dfa <$d.5+0x8fb20>
     d7e:	0100                	.insn	2, 0x0100
     d80:	0c05                	.insn	2, 0x0c05
     d82:	097f9903          	lh	s2,151(t6)
     d86:	000c                	.insn	2, 0x000c
     d88:	0601                	.insn	2, 0x0601
     d8a:	097dc203          	lbu	tp,151(s11)
     d8e:	0004                	.insn	2, 0x0004
     d90:	0501                	.insn	2, 0x0501
     d92:	0605                	.insn	2, 0x0605
     d94:	0903a503          	lw	a0,144(t2)
     d98:	0004                	.insn	2, 0x0004
     d9a:	0501                	.insn	2, 0x0501
     d9c:	030c                	.insn	2, 0x030c
     d9e:	7f99                	.insn	2, 0x7f99
     da0:	0c09                	.insn	2, 0x0c09
     da2:	0100                	.insn	2, 0x0100
     da4:	0306                	.insn	2, 0x0306
     da6:	7dc2                	.insn	2, 0x7dc2
     da8:	0409                	.insn	2, 0x0409
     daa:	0100                	.insn	2, 0x0100
     dac:	2505                	.insn	2, 0x2505
     dae:	0306                	.insn	2, 0x0306
     db0:	028a                	.insn	2, 0x028a
     db2:	0409                	.insn	2, 0x0409
     db4:	0100                	.insn	2, 0x0100
     db6:	1c05                	.insn	2, 0x1c05
     db8:	10090103          	lb	sp,256(s2)
     dbc:	0100                	.insn	2, 0x0100
     dbe:	1505                	.insn	2, 0x1505
     dc0:	0306                	.insn	2, 0x0306
     dc2:	0900                	.insn	2, 0x0900
     dc4:	0004                	.insn	2, 0x0004
     dc6:	0501                	.insn	2, 0x0501
     dc8:	0605                	.insn	2, 0x0605
     dca:	09019a03          	lh	s4,144(gp)
     dce:	0008                	.insn	2, 0x0008
     dd0:	0501                	.insn	2, 0x0501
     dd2:	031c                	.insn	2, 0x031c
     dd4:	7ee6                	.insn	2, 0x7ee6
     dd6:	0c09                	.insn	2, 0x0c09
     dd8:	0100                	.insn	2, 0x0100
     dda:	1505                	.insn	2, 0x1505
     ddc:	0306                	.insn	2, 0x0306
     dde:	0900                	.insn	2, 0x0900
     de0:	0004                	.insn	2, 0x0004
     de2:	0501                	.insn	2, 0x0501
     de4:	0605                	.insn	2, 0x0605
     de6:	09019a03          	lh	s4,144(gp)
     dea:	000c                	.insn	2, 0x000c
     dec:	0501                	.insn	2, 0x0501
     dee:	033a                	.insn	2, 0x033a
     df0:	10097ef3          	csrrci	t4,sstatus,18
     df4:	0100                	.insn	2, 0x0100
     df6:	0306                	.insn	2, 0x0306
     df8:	7de8                	.insn	2, 0x7de8
     dfa:	0409                	.insn	2, 0x0409
     dfc:	0100                	.insn	2, 0x0100
     dfe:	1b05                	.insn	2, 0x1b05
     e00:	0306                	.insn	2, 0x0306
     e02:	02a9                	.insn	2, 0x02a9
     e04:	0c09                	.insn	2, 0x0c09
     e06:	0100                	.insn	2, 0x0100
     e08:	0306                	.insn	2, 0x0306
     e0a:	14097dd7          	.insn	4, 0x14097dd7
     e0e:	0100                	.insn	2, 0x0100
     e10:	2405                	.insn	2, 0x2405
     e12:	0306                	.insn	2, 0x0306
     e14:	02a8                	.insn	2, 0x02a8
     e16:	1009                	.insn	2, 0x1009
     e18:	0100                	.insn	2, 0x0100
     e1a:	1e05                	.insn	2, 0x1e05
     e1c:	0306                	.insn	2, 0x0306
     e1e:	0900                	.insn	2, 0x0900
     e20:	0004                	.insn	2, 0x0004
     e22:	0501                	.insn	2, 0x0501
     e24:	0322                	.insn	2, 0x0322
     e26:	0900                	.insn	2, 0x0900
     e28:	0004                	.insn	2, 0x0004
     e2a:	0501                	.insn	2, 0x0501
     e2c:	0615                	.insn	2, 0x0615
     e2e:	08097f03          	.insn	4, 0x08097f03
     e32:	0100                	.insn	2, 0x0100
     e34:	0306                	.insn	2, 0x0306
     e36:	7dd9                	.insn	2, 0x7dd9
     e38:	0409                	.insn	2, 0x0409
     e3a:	0100                	.insn	2, 0x0100
     e3c:	2105                	.insn	2, 0x2105
     e3e:	0306                	.insn	2, 0x0306
     e40:	02ae                	.insn	2, 0x02ae
     e42:	0409                	.insn	2, 0x0409
     e44:	0100                	.insn	2, 0x0100
     e46:	0505                	.insn	2, 0x0505
     e48:	0900f703          	.insn	4, 0x0900f703
     e4c:	0008                	.insn	2, 0x0008
     e4e:	0501                	.insn	2, 0x0501
     e50:	031e                	.insn	2, 0x031e
     e52:	7f88                	.insn	2, 0x7f88
     e54:	0c09                	.insn	2, 0x0c09
     e56:	0100                	.insn	2, 0x0100
     e58:	1505                	.insn	2, 0x1505
     e5a:	0306                	.insn	2, 0x0306
     e5c:	0900                	.insn	2, 0x0900
     e5e:	0008                	.insn	2, 0x0008
     e60:	0301                	.insn	2, 0x0301
     e62:	08097dd3          	.insn	4, 0x08097dd3
     e66:	0100                	.insn	2, 0x0100
     e68:	0505                	.insn	2, 0x0505
     e6a:	0306                	.insn	2, 0x0306
     e6c:	03a5                	.insn	2, 0x03a5
     e6e:	0409                	.insn	2, 0x0409
     e70:	0100                	.insn	2, 0x0100
     e72:	0306                	.insn	2, 0x0306
     e74:	0c097cdb          	.insn	4, 0x0c097cdb
     e78:	0100                	.insn	2, 0x0100
     e7a:	0105                	.insn	2, 0x0105
     e7c:	0b06                	.insn	2, 0x0b06
     e7e:	0902c303          	lbu	t1,144(t0)
     e82:	0034                	.insn	2, 0x0034
     e84:	0501                	.insn	2, 0x0501
     e86:	0300                	.insn	2, 0x0300
     e88:	0906                	.insn	2, 0x0906
     e8a:	0008                	.insn	2, 0x0008
     e8c:	0501                	.insn	2, 0x0501
     e8e:	0a0a                	.insn	2, 0x0a0a
     e90:	24090203          	lb	tp,576(s2)
     e94:	0100                	.insn	2, 0x0100
     e96:	1705                	.insn	2, 0x1705
     e98:	0306                	.insn	2, 0x0306
     e9a:	0900                	.insn	2, 0x0900
     e9c:	000c                	.insn	2, 0x000c
     e9e:	0501                	.insn	2, 0x0501
     ea0:	0900031b          	.insn	4, 0x0900031b
     ea4:	0004                	.insn	2, 0x0004
     ea6:	0501                	.insn	2, 0x0501
     ea8:	09000327          	.insn	4, 0x09000327
     eac:	0004                	.insn	2, 0x0004
     eae:	0501                	.insn	2, 0x0501
     eb0:	060c                	.insn	2, 0x060c
     eb2:	0c090503          	lb	a0,192(s2)
     eb6:	0100                	.insn	2, 0x0100
     eb8:	0b05                	.insn	2, 0x0b05
     eba:	04097d03          	.insn	4, 0x04097d03
     ebe:	0100                	.insn	2, 0x0100
     ec0:	0306                	.insn	2, 0x0306
     ec2:	04097db3          	.insn	4, 0x04097db3
     ec6:	0100                	.insn	2, 0x0100
     ec8:	0505                	.insn	2, 0x0505
     eca:	0306                	.insn	2, 0x0306
     ecc:	02d0                	.insn	2, 0x02d0
     ece:	0809                	.insn	2, 0x0809
     ed0:	0100                	.insn	2, 0x0100
     ed2:	0306                	.insn	2, 0x0306
     ed4:	7db0                	.insn	2, 0x7db0
     ed6:	0809                	.insn	2, 0x0809
     ed8:	0100                	.insn	2, 0x0100
     eda:	1605                	.insn	2, 0x1605
     edc:	0306                	.insn	2, 0x0306
     ede:	080902d3          	.insn	4, 0x080902d3
     ee2:	0100                	.insn	2, 0x0100
     ee4:	1b05                	.insn	2, 0x1b05
     ee6:	20090103          	lb	sp,512(s2)
     eea:	0100                	.insn	2, 0x0100
     eec:	10090103          	lb	sp,256(s2)
     ef0:	0100                	.insn	2, 0x0100
     ef2:	0005                	.insn	2, 0x0005
     ef4:	0306                	.insn	2, 0x0306
     ef6:	10097dab          	.insn	4, 0x10097dab
     efa:	0100                	.insn	2, 0x0100
     efc:	0d05                	.insn	2, 0x0d05
     efe:	0306                	.insn	2, 0x0306
     f00:	080902d7          	.insn	4, 0x080902d7
     f04:	0100                	.insn	2, 0x0100
     f06:	0f05                	.insn	2, 0x0f05
     f08:	04090103          	lb	sp,64(s2)
     f0c:	0100                	.insn	2, 0x0100
     f0e:	0c05                	.insn	2, 0x0c05
     f10:	0c097803          	.insn	4, 0x0c097803
     f14:	0100                	.insn	2, 0x0100
     f16:	1605                	.insn	2, 0x1605
     f18:	04090803          	lb	a6,64(s2)
     f1c:	0100                	.insn	2, 0x0100
     f1e:	0505                	.insn	2, 0x0505
     f20:	04097803          	.insn	4, 0x04097803
     f24:	0100                	.insn	2, 0x0100
     f26:	0306                	.insn	2, 0x0306
     f28:	7db0                	.insn	2, 0x7db0
     f2a:	0809                	.insn	2, 0x0809
     f2c:	0100                	.insn	2, 0x0100
     f2e:	0b06                	.insn	2, 0x0b06
     f30:	0902da03          	lhu	s4,144(t0)
     f34:	001c                	.insn	2, 0x001c
     f36:	0501                	.insn	2, 0x0501
     f38:	0300                	.insn	2, 0x0300
     f3a:	0905                	.insn	2, 0x0905
     f3c:	0008                	.insn	2, 0x0008
     f3e:	0501                	.insn	2, 0x0501
     f40:	0a09                	.insn	2, 0x0a09
     f42:	04090103          	lb	sp,64(s2)
     f46:	0100                	.insn	2, 0x0100
     f48:	0306                	.insn	2, 0x0306
     f4a:	7da0                	.insn	2, 0x7da0
     f4c:	0409                	.insn	2, 0x0409
     f4e:	0100                	.insn	2, 0x0100
     f50:	0105                	.insn	2, 0x0105
     f52:	0306                	.insn	2, 0x0306
     f54:	040902e7          	jalr	t0,64(s2)
     f58:	0100                	.insn	2, 0x0100
     f5a:	0306                	.insn	2, 0x0306
     f5c:	7d99                	.insn	2, 0x7d99
     f5e:	1c09                	.insn	2, 0x1c09
     f60:	0100                	.insn	2, 0x0100
     f62:	0505                	.insn	2, 0x0505
     f64:	0306                	.insn	2, 0x0306
     f66:	02e2                	.insn	2, 0x02e2
     f68:	0809                	.insn	2, 0x0809
     f6a:	0100                	.insn	2, 0x0100
     f6c:	0306                	.insn	2, 0x0306
     f6e:	7d9e                	.insn	2, 0x7d9e
     f70:	0409                	.insn	2, 0x0409
     f72:	0100                	.insn	2, 0x0100
     f74:	0f05                	.insn	2, 0x0f05
     f76:	0306                	.insn	2, 0x0306
     f78:	040902e3          	beqz	s2,17bc <$d.5+0x4e2>
     f7c:	0100                	.insn	2, 0x0100
     f7e:	0d05                	.insn	2, 0x0d05
     f80:	0306                	.insn	2, 0x0306
     f82:	0900                	.insn	2, 0x0900
     f84:	0014                	.insn	2, 0x0014
     f86:	0501                	.insn	2, 0x0501
     f88:	7f030627          	.insn	4, 0x7f030627
     f8c:	0409                	.insn	2, 0x0409
     f8e:	0100                	.insn	2, 0x0100
     f90:	1c05                	.insn	2, 0x1c05
     f92:	0306                	.insn	2, 0x0306
     f94:	0900                	.insn	2, 0x0900
     f96:	0004                	.insn	2, 0x0004
     f98:	0501                	.insn	2, 0x0501
     f9a:	0305                	.insn	2, 0x0305
     f9c:	0900                	.insn	2, 0x0900
     f9e:	0010                	.insn	2, 0x0010
     fa0:	0501                	.insn	2, 0x0501
     fa2:	01030613          	addi	a2,t1,16
     fa6:	0409                	.insn	2, 0x0409
     fa8:	0100                	.insn	2, 0x0100
     faa:	0306                	.insn	2, 0x0306
     fac:	7d9d                	.insn	2, 0x7d9d
     fae:	0409                	.insn	2, 0x0409
     fb0:	0100                	.insn	2, 0x0100
     fb2:	0105                	.insn	2, 0x0105
     fb4:	0306                	.insn	2, 0x0306
     fb6:	140902e7          	jalr	t0,320(s2)
     fba:	0100                	.insn	2, 0x0100
     fbc:	0505                	.insn	2, 0x0505
     fbe:	030a                	.insn	2, 0x030a
     fc0:	040900cb          	.insn	4, 0x040900cb
     fc4:	0100                	.insn	2, 0x0100
     fc6:	0c090803          	lb	a6,192(s2)
     fca:	0100                	.insn	2, 0x0100
     fcc:	030a                	.insn	2, 0x030a
     fce:	080900cf          	.insn	4, 0x080900cf
     fd2:	0100                	.insn	2, 0x0100
     fd4:	08090703          	lb	a4,128(s2)
     fd8:	0100                	.insn	2, 0x0100
     fda:	0409                	.insn	2, 0x0409
     fdc:	0000                	.insn	2, 0x0000
     fde:	0101                	.insn	2, 0x0101
     fe0:	0505                	.insn	2, 0x0505
     fe2:	000a                	.insn	2, 0x000a
     fe4:	0205                	.insn	2, 0x0205
     fe6:	0000                	.insn	2, 0x0000
     fe8:	0040                	.insn	2, 0x0040
     fea:	0104a903          	lw	s2,16(s1)
     fee:	1c09                	.insn	2, 0x1c09
     ff0:	0000                	.insn	2, 0x0000
     ff2:	0101                	.insn	2, 0x0101

00000ff4 <$d.11>:
     ff4:	0945                	.insn	2, 0x0945
     ff6:	0000                	.insn	2, 0x0000
     ff8:	0004                	.insn	2, 0x0004
     ffa:	003a                	.insn	2, 0x003a
     ffc:	0000                	.insn	2, 0x0000
     ffe:	0101                	.insn	2, 0x0101
    1000:	fb01                	.insn	2, 0xfb01
    1002:	0d0e                	.insn	2, 0x0d0e
    1004:	0100                	.insn	2, 0x0100
    1006:	0101                	.insn	2, 0x0101
    1008:	0001                	.insn	2, 0x0001
    100a:	0000                	.insn	2, 0x0000
    100c:	0001                	.insn	2, 0x0001
    100e:	0100                	.insn	2, 0x0100
    1010:	2f2e                	.insn	2, 0x2f2e
    1012:	00637273          	csrrci	tp,0x6,6
    1016:	6600                	.insn	2, 0x6600
    1018:	7461                	.insn	2, 0x7461
    101a:	632e3233          	.insn	4, 0x632e3233
    101e:	0100                	.insn	2, 0x0100
    1020:	0000                	.insn	2, 0x0000
    1022:	7375                	.insn	2, 0x7375
    1024:	7265                	.insn	2, 0x7265
    1026:	682e                	.insn	2, 0x682e
    1028:	0100                	.insn	2, 0x0100
    102a:	0000                	.insn	2, 0x0000
    102c:	6166                	.insn	2, 0x6166
    102e:	3374                	.insn	2, 0x3374
    1030:	2e32                	.insn	2, 0x2e32
    1032:	0068                	.insn	2, 0x0068
    1034:	0001                	.insn	2, 0x0001
    1036:	0000                	.insn	2, 0x0000
    1038:	0500                	.insn	2, 0x0500
    103a:	6402                	.insn	2, 0x6402
    103c:	4012                	.insn	2, 0x4012
    103e:	1900                	.insn	2, 0x1900
    1040:	0905                	.insn	2, 0x0905
    1042:	030a                	.insn	2, 0x030a
    1044:	0906                	.insn	2, 0x0906
    1046:	0014                	.insn	2, 0x0014
    1048:	0601                	.insn	2, 0x0601
    104a:	10090003          	lb	zero,256(s2)
    104e:	0100                	.insn	2, 0x0100
    1050:	0306                	.insn	2, 0x0306
    1052:	00040903          	lb	s2,0(s0)
    1056:	0601                	.insn	2, 0x0601
    1058:	14090003          	lb	zero,320(s2)
    105c:	0100                	.insn	2, 0x0100
    105e:	0306                	.insn	2, 0x0306
    1060:	0901                	.insn	2, 0x0901
    1062:	0004                	.insn	2, 0x0004
    1064:	0601                	.insn	2, 0x0601
    1066:	10096e03          	.insn	4, 0x10096e03
    106a:	0100                	.insn	2, 0x0100
    106c:	1805                	.insn	2, 0x1805
    106e:	0306                	.insn	2, 0x0306
    1070:	00080917          	auipc	s2,0x80
    1074:	0501                	.insn	2, 0x0501
    1076:	0314                	.insn	2, 0x0314
    1078:	00e4                	.insn	2, 0x00e4
    107a:	0409                	.insn	2, 0x0409
    107c:	0100                	.insn	2, 0x0100
    107e:	0c090203          	lb	tp,192(s2) # 81130 <$d.5+0x7fe56>
    1082:	0100                	.insn	2, 0x0100
    1084:	1505                	.insn	2, 0x1505
    1086:	04097f03          	.insn	4, 0x04097f03
    108a:	0100                	.insn	2, 0x0100
    108c:	1a05                	.insn	2, 0x1a05
    108e:	0306                	.insn	2, 0x0306
    1090:	0900                	.insn	2, 0x0900
    1092:	0004                	.insn	2, 0x0004
    1094:	0501                	.insn	2, 0x0501
    1096:	061f 7f03 0809      	.insn	6, 0x08097f03061f
    109c:	0100                	.insn	2, 0x0100
    109e:	0905                	.insn	2, 0x0905
    10a0:	097f9e03          	lh	t3,151(t6)
    10a4:	0004                	.insn	2, 0x0004
    10a6:	0601                	.insn	2, 0x0601
    10a8:	14090003          	lb	zero,320(s2)
    10ac:	0100                	.insn	2, 0x0100
    10ae:	04096703          	.insn	4, 0x04096703
    10b2:	0100                	.insn	2, 0x0100
    10b4:	0505                	.insn	2, 0x0505
    10b6:	0306                	.insn	2, 0x0306
    10b8:	091c                	.insn	2, 0x091c
    10ba:	0004                	.insn	2, 0x0004
    10bc:	0601                	.insn	2, 0x0601
    10be:	10096403          	.insn	4, 0x10096403
    10c2:	0100                	.insn	2, 0x0100
    10c4:	08091c03          	lh	s8,128(s2)
    10c8:	0100                	.insn	2, 0x0100
    10ca:	1105                	.insn	2, 0x1105
    10cc:	0306                	.insn	2, 0x0306
    10ce:	0905                	.insn	2, 0x0905
    10d0:	0008                	.insn	2, 0x0008
    10d2:	0501                	.insn	2, 0x0501
    10d4:	0609                	.insn	2, 0x0609
    10d6:	04090003          	lb	zero,64(s2)
    10da:	0100                	.insn	2, 0x0100
    10dc:	0505                	.insn	2, 0x0505
    10de:	0306                	.insn	2, 0x0306
    10e0:	0008097b          	.insn	4, 0x0008097b
    10e4:	0301                	.insn	2, 0x0301
    10e6:	0908                	.insn	2, 0x0908
    10e8:	0008                	.insn	2, 0x0008
    10ea:	0601                	.insn	2, 0x0601
    10ec:	0c095c03          	lhu	s8,192(s2)
    10f0:	0100                	.insn	2, 0x0100
    10f2:	0105                	.insn	2, 0x0105
    10f4:	0b06                	.insn	2, 0x0b06
    10f6:	10092703          	lw	a4,256(s2)
    10fa:	0100                	.insn	2, 0x0100
    10fc:	0005                	.insn	2, 0x0005
    10fe:	0900da03          	lhu	s4,144(ra)
    1102:	0008                	.insn	2, 0x0008
    1104:	0501                	.insn	2, 0x0501
    1106:	0a09                	.insn	2, 0x0a09
    1108:	14090303          	lb	t1,320(s2)
    110c:	0100                	.insn	2, 0x0100
    110e:	0306                	.insn	2, 0x0306
    1110:	7efc                	.insn	2, 0x7efc
    1112:	1809                	.insn	2, 0x1809
    1114:	0100                	.insn	2, 0x0100
    1116:	09018403          	lb	s0,144(gp)
    111a:	0004                	.insn	2, 0x0004
    111c:	0501                	.insn	2, 0x0501
    111e:	0614                	.insn	2, 0x0614
    1120:	04090503          	lb	a0,64(s2)
    1124:	0100                	.insn	2, 0x0100
    1126:	04097f03          	.insn	4, 0x04097f03
    112a:	0100                	.insn	2, 0x0100
    112c:	04090203          	lb	tp,64(s2)
    1130:	0100                	.insn	2, 0x0100
    1132:	0a05                	.insn	2, 0x0a05
    1134:	04090103          	lb	sp,64(s2)
    1138:	0100                	.insn	2, 0x0100
    113a:	1f05                	.insn	2, 0x1f05
    113c:	04097e03          	.insn	4, 0x04097e03
    1140:	0100                	.insn	2, 0x0100
    1142:	2005                	.insn	2, 0x2005
    1144:	04097f03          	.insn	4, 0x04097f03
    1148:	0100                	.insn	2, 0x0100
    114a:	1f05                	.insn	2, 0x1f05
    114c:	04090203          	lb	tp,64(s2)
    1150:	0100                	.insn	2, 0x0100
    1152:	04090103          	lb	sp,64(s2)
    1156:	0100                	.insn	2, 0x0100
    1158:	2505                	.insn	2, 0x2505
    115a:	04097e03          	.insn	4, 0x04097e03
    115e:	0100                	.insn	2, 0x0100
    1160:	2605                	.insn	2, 0x2605
    1162:	04090103          	lb	sp,64(s2)
    1166:	0100                	.insn	2, 0x0100
    1168:	1605                	.insn	2, 0x1605
    116a:	04097d03          	.insn	4, 0x04097d03
    116e:	0100                	.insn	2, 0x0100
    1170:	0905                	.insn	2, 0x0905
    1172:	08090603          	lb	a2,128(s2)
    1176:	0100                	.insn	2, 0x0100
    1178:	0306                	.insn	2, 0x0306
    117a:	0900                	.insn	2, 0x0900
    117c:	000c                	.insn	2, 0x000c
    117e:	0501                	.insn	2, 0x0501
    1180:	0614                	.insn	2, 0x0614
    1182:	04090403          	lb	s0,64(s2)
    1186:	0100                	.insn	2, 0x0100
    1188:	08090103          	lb	sp,128(s2)
    118c:	0100                	.insn	2, 0x0100
    118e:	04097f03          	.insn	4, 0x04097f03
    1192:	0100                	.insn	2, 0x0100
    1194:	1c05                	.insn	2, 0x1c05
    1196:	04090103          	lb	sp,64(s2)
    119a:	0100                	.insn	2, 0x0100
    119c:	1d05                	.insn	2, 0x1d05
    119e:	04097f03          	.insn	4, 0x04097f03
    11a2:	0100                	.insn	2, 0x0100
    11a4:	1405                	.insn	2, 0x1405
    11a6:	04090803          	lb	a6,64(s2)
    11aa:	0100                	.insn	2, 0x0100
    11ac:	04097f03          	.insn	4, 0x04097f03
    11b0:	0100                	.insn	2, 0x0100
    11b2:	04090203          	lb	tp,64(s2)
    11b6:	0100                	.insn	2, 0x0100
    11b8:	0a05                	.insn	2, 0x0a05
    11ba:	04090103          	lb	sp,64(s2)
    11be:	0100                	.insn	2, 0x0100
    11c0:	1c05                	.insn	2, 0x1c05
    11c2:	04097e03          	.insn	4, 0x04097e03
    11c6:	0100                	.insn	2, 0x0100
    11c8:	1d05                	.insn	2, 0x1d05
    11ca:	04097f03          	.insn	4, 0x04097f03
    11ce:	0100                	.insn	2, 0x0100
    11d0:	1c05                	.insn	2, 0x1c05
    11d2:	04090203          	lb	tp,64(s2)
    11d6:	0100                	.insn	2, 0x0100
    11d8:	04090103          	lb	sp,64(s2)
    11dc:	0100                	.insn	2, 0x0100
    11de:	2205                	.insn	2, 0x2205
    11e0:	04097e03          	.insn	4, 0x04097e03
    11e4:	0100                	.insn	2, 0x0100
    11e6:	1305                	.insn	2, 0x1305
    11e8:	04090503          	lb	a0,64(s2)
    11ec:	0100                	.insn	2, 0x0100
    11ee:	2305                	.insn	2, 0x2305
    11f0:	04097c03          	.insn	4, 0x04097c03
    11f4:	0100                	.insn	2, 0x0100
    11f6:	1405                	.insn	2, 0x1405
    11f8:	04090803          	lb	a6,64(s2)
    11fc:	0100                	.insn	2, 0x0100
    11fe:	2105                	.insn	2, 0x2105
    1200:	04097b03          	.insn	4, 0x04097b03
    1204:	0100                	.insn	2, 0x0100
    1206:	1405                	.insn	2, 0x1405
    1208:	08090403          	lb	s0,128(s2)
    120c:	0100                	.insn	2, 0x0100
    120e:	1c05                	.insn	2, 0x1c05
    1210:	04090103          	lb	sp,64(s2)
    1214:	0100                	.insn	2, 0x0100
    1216:	1405                	.insn	2, 0x1405
    1218:	04090103          	lb	sp,64(s2)
    121c:	0100                	.insn	2, 0x0100
    121e:	0a05                	.insn	2, 0x0a05
    1220:	04090103          	lb	sp,64(s2)
    1224:	0100                	.insn	2, 0x0100
    1226:	1d05                	.insn	2, 0x1d05
    1228:	04097d03          	.insn	4, 0x04097d03
    122c:	0100                	.insn	2, 0x0100
    122e:	1305                	.insn	2, 0x1305
    1230:	04097403          	.insn	4, 0x04097403
    1234:	0100                	.insn	2, 0x0100
    1236:	1c05                	.insn	2, 0x1c05
    1238:	04090e03          	lb	t3,64(s2)
    123c:	0100                	.insn	2, 0x0100
    123e:	04090103          	lb	sp,64(s2)
    1242:	0100                	.insn	2, 0x0100
    1244:	1105                	.insn	2, 0x1105
    1246:	04090303          	lb	t1,64(s2)
    124a:	0100                	.insn	2, 0x0100
    124c:	2205                	.insn	2, 0x2205
    124e:	04097b03          	.insn	4, 0x04097b03
    1252:	0100                	.insn	2, 0x0100
    1254:	2305                	.insn	2, 0x2305
    1256:	04090103          	lb	sp,64(s2)
    125a:	0100                	.insn	2, 0x0100
    125c:	1a05                	.insn	2, 0x1a05
    125e:	04097d03          	.insn	4, 0x04097d03
    1262:	0100                	.insn	2, 0x0100
    1264:	04090703          	lb	a4,64(s2)
    1268:	0100                	.insn	2, 0x0100
    126a:	1705                	.insn	2, 0x1705
    126c:	04097f03          	.insn	4, 0x04097f03
    1270:	0100                	.insn	2, 0x0100
    1272:	2705                	.insn	2, 0x2705
    1274:	04090403          	lb	s0,64(s2)
    1278:	0100                	.insn	2, 0x0100
    127a:	0306                	.insn	2, 0x0306
    127c:	7ed6                	.insn	2, 0x7ed6
    127e:	0809                	.insn	2, 0x0809
    1280:	0100                	.insn	2, 0x0100
    1282:	1b05                	.insn	2, 0x1b05
    1284:	0901aa03          	lw	s4,144(gp)
    1288:	0004                	.insn	2, 0x0004
    128a:	0501                	.insn	2, 0x0501
    128c:	0618                	.insn	2, 0x0618
    128e:	04097f03          	.insn	4, 0x04097f03
    1292:	0100                	.insn	2, 0x0100
    1294:	0105                	.insn	2, 0x0105
    1296:	04090403          	lb	s0,64(s2)
    129a:	0100                	.insn	2, 0x0100
    129c:	0b06                	.insn	2, 0x0b06
    129e:	14090003          	lb	zero,320(s2)
    12a2:	0100                	.insn	2, 0x0100
    12a4:	0005                	.insn	2, 0x0005
    12a6:	0306                	.insn	2, 0x0306
    12a8:	7f80                	.insn	2, 0x7f80
    12aa:	0809                	.insn	2, 0x0809
    12ac:	0100                	.insn	2, 0x0100
    12ae:	0905                	.insn	2, 0x0905
    12b0:	030a                	.insn	2, 0x030a
    12b2:	00400903          	lb	s2,4(zero) # 4 <$d.10+0x4>
    12b6:	0601                	.insn	2, 0x0601
    12b8:	08095003          	lhu	zero,128(s2)
    12bc:	0100                	.insn	2, 0x0100
    12be:	04093003          	.insn	4, 0x04093003
    12c2:	0100                	.insn	2, 0x0100
    12c4:	2005                	.insn	2, 0x2005
    12c6:	0306                	.insn	2, 0x0306
    12c8:	0904                	.insn	2, 0x0904
    12ca:	0004                	.insn	2, 0x0004
    12cc:	0501                	.insn	2, 0x0501
    12ce:	0314                	.insn	2, 0x0314
    12d0:	0c0900c7          	.insn	4, 0x0c0900c7
    12d4:	0100                	.insn	2, 0x0100
    12d6:	04090203          	lb	tp,64(s2)
    12da:	0100                	.insn	2, 0x0100
    12dc:	1505                	.insn	2, 0x1505
    12de:	04097f03          	.insn	4, 0x04097f03
    12e2:	0100                	.insn	2, 0x0100
    12e4:	1a05                	.insn	2, 0x1a05
    12e6:	0306                	.insn	2, 0x0306
    12e8:	0900                	.insn	2, 0x0900
    12ea:	0004                	.insn	2, 0x0004
    12ec:	0501                	.insn	2, 0x0501
    12ee:	061f 7f03 0809      	.insn	6, 0x08097f03061f
    12f4:	0100                	.insn	2, 0x0100
    12f6:	0905                	.insn	2, 0x0905
    12f8:	097fbb03          	.insn	4, 0x097fbb03
    12fc:	0004                	.insn	2, 0x0004
    12fe:	0601                	.insn	2, 0x0601
    1300:	14090003          	lb	zero,320(s2)
    1304:	0100                	.insn	2, 0x0100
    1306:	0105                	.insn	2, 0x0105
    1308:	0306                	.insn	2, 0x0306
    130a:	00c1                	.insn	2, 0x00c1
    130c:	0409                	.insn	2, 0x0409
    130e:	0100                	.insn	2, 0x0100
    1310:	0306                	.insn	2, 0x0306
    1312:	7f89                	.insn	2, 0x7f89
    1314:	0c09                	.insn	2, 0x0c09
    1316:	0100                	.insn	2, 0x0100
    1318:	00f7030b          	.insn	4, 0x00f7030b
    131c:	2809                	.insn	2, 0x2809
    131e:	0100                	.insn	2, 0x0100
    1320:	097f8903          	lb	s2,151(t6)
    1324:	0008                	.insn	2, 0x0008
    1326:	0501                	.insn	2, 0x0501
    1328:	0620                	.insn	2, 0x0620
    132a:	0900d903          	lhu	s2,144(ra)
    132e:	001c                	.insn	2, 0x001c
    1330:	0501                	.insn	2, 0x0501
    1332:	0615                	.insn	2, 0x0615
    1334:	04090003          	lb	zero,64(s2)
    1338:	0100                	.insn	2, 0x0100
    133a:	2405                	.insn	2, 0x2405
    133c:	04090003          	lb	zero,64(s2)
    1340:	0100                	.insn	2, 0x0100
    1342:	0905                	.insn	2, 0x0905
    1344:	0306                	.insn	2, 0x0306
    1346:	0904                	.insn	2, 0x0904
    1348:	0004                	.insn	2, 0x0004
    134a:	0501                	.insn	2, 0x0501
    134c:	0616                	.insn	2, 0x0616
    134e:	04090003          	lb	zero,64(s2)
    1352:	0100                	.insn	2, 0x0100
    1354:	0d05                	.insn	2, 0x0d05
    1356:	0306                	.insn	2, 0x0306
    1358:	0902                	.insn	2, 0x0902
    135a:	0004                	.insn	2, 0x0004
    135c:	0601                	.insn	2, 0x0601
    135e:	10090003          	lb	zero,256(s2)
    1362:	0100                	.insn	2, 0x0100
    1364:	1705                	.insn	2, 0x1705
    1366:	0306                	.insn	2, 0x0306
    1368:	095a                	.insn	2, 0x095a
    136a:	0004                	.insn	2, 0x0004
    136c:	0501                	.insn	2, 0x0501
    136e:	0605                	.insn	2, 0x0605
    1370:	08090003          	lb	zero,128(s2)
    1374:	0100                	.insn	2, 0x0100
    1376:	0d05                	.insn	2, 0x0d05
    1378:	0306                	.insn	2, 0x0306
    137a:	0905                	.insn	2, 0x0905
    137c:	0004                	.insn	2, 0x0004
    137e:	0601                	.insn	2, 0x0601
    1380:	04090003          	lb	zero,64(s2)
    1384:	0100                	.insn	2, 0x0100
    1386:	0306                	.insn	2, 0x0306
    1388:	0908                	.insn	2, 0x0908
    138a:	0008                	.insn	2, 0x0008
    138c:	0601                	.insn	2, 0x0601
    138e:	04090003          	lb	zero,64(s2)
    1392:	0100                	.insn	2, 0x0100
    1394:	1105                	.insn	2, 0x1105
    1396:	0306                	.insn	2, 0x0306
    1398:	0908                	.insn	2, 0x0908
    139a:	0004                	.insn	2, 0x0004
    139c:	0601                	.insn	2, 0x0601
    139e:	097fb203          	.insn	4, 0x097fb203
    13a2:	0004                	.insn	2, 0x0004
    13a4:	0301                	.insn	2, 0x0301
    13a6:	00ce                	.insn	2, 0x00ce
    13a8:	0409                	.insn	2, 0x0409
    13aa:	0100                	.insn	2, 0x0100
    13ac:	04090003          	lb	zero,64(s2)
    13b0:	0100                	.insn	2, 0x0100
    13b2:	2005                	.insn	2, 0x2005
    13b4:	0306                	.insn	2, 0x0306
    13b6:	0901                	.insn	2, 0x0901
    13b8:	0008                	.insn	2, 0x0008
    13ba:	0501                	.insn	2, 0x0501
    13bc:	0311                	.insn	2, 0x0311
    13be:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    13c6:	0409 
    13c8:	0100                	.insn	2, 0x0100
    13ca:	0306                	.insn	2, 0x0306
    13cc:	0901                	.insn	2, 0x0901
    13ce:	0004                	.insn	2, 0x0004
    13d0:	0501                	.insn	2, 0x0501
    13d2:	061c                	.insn	2, 0x061c
    13d4:	04090003          	lb	zero,64(s2)
    13d8:	0100                	.insn	2, 0x0100
    13da:	2005                	.insn	2, 0x2005
    13dc:	04090003          	lb	zero,64(s2)
    13e0:	0100                	.insn	2, 0x0100
    13e2:	1105                	.insn	2, 0x1105
    13e4:	0306                	.insn	2, 0x0306
    13e6:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    13ee:	0409 
    13f0:	0100                	.insn	2, 0x0100
    13f2:	04090003          	lb	zero,64(s2)
    13f6:	0100                	.insn	2, 0x0100
    13f8:	04090003          	lb	zero,64(s2)
    13fc:	0100                	.insn	2, 0x0100
    13fe:	04090003          	lb	zero,64(s2)
    1402:	0100                	.insn	2, 0x0100
    1404:	04090003          	lb	zero,64(s2)
    1408:	0100                	.insn	2, 0x0100
    140a:	04090003          	lb	zero,64(s2)
    140e:	0100                	.insn	2, 0x0100
    1410:	04090003          	lb	zero,64(s2)
    1414:	0100                	.insn	2, 0x0100
    1416:	04090003          	lb	zero,64(s2)
    141a:	0100                	.insn	2, 0x0100
    141c:	04090003          	lb	zero,64(s2)
    1420:	0100                	.insn	2, 0x0100
    1422:	04090003          	lb	zero,64(s2)
    1426:	0100                	.insn	2, 0x0100
    1428:	04090003          	lb	zero,64(s2)
    142c:	0100                	.insn	2, 0x0100
    142e:	0d05                	.insn	2, 0x0d05
    1430:	0306                	.insn	2, 0x0306
    1432:	0905                	.insn	2, 0x0905
    1434:	0004                	.insn	2, 0x0004
    1436:	0601                	.insn	2, 0x0601
    1438:	04090003          	lb	zero,64(s2)
    143c:	0100                	.insn	2, 0x0100
    143e:	1105                	.insn	2, 0x1105
    1440:	0306                	.insn	2, 0x0306
    1442:	097c                	.insn	2, 0x097c
    1444:	0008                	.insn	2, 0x0008
    1446:	0501                	.insn	2, 0x0501
    1448:	061c                	.insn	2, 0x061c
    144a:	04090003          	lb	zero,64(s2)
    144e:	0100                	.insn	2, 0x0100
    1450:	2005                	.insn	2, 0x2005
    1452:	04090003          	lb	zero,64(s2)
    1456:	0100                	.insn	2, 0x0100
    1458:	1105                	.insn	2, 0x1105
    145a:	0306                	.insn	2, 0x0306
    145c:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    1464:	0409 
    1466:	0100                	.insn	2, 0x0100
    1468:	0306                	.insn	2, 0x0306
    146a:	0901                	.insn	2, 0x0901
    146c:	0004                	.insn	2, 0x0004
    146e:	0501                	.insn	2, 0x0501
    1470:	061c                	.insn	2, 0x061c
    1472:	04090003          	lb	zero,64(s2)
    1476:	0100                	.insn	2, 0x0100
    1478:	2005                	.insn	2, 0x2005
    147a:	04090003          	lb	zero,64(s2)
    147e:	0100                	.insn	2, 0x0100
    1480:	1105                	.insn	2, 0x1105
    1482:	0306                	.insn	2, 0x0306
    1484:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    148c:	0409 
    148e:	0100                	.insn	2, 0x0100
    1490:	0306                	.insn	2, 0x0306
    1492:	0901                	.insn	2, 0x0901
    1494:	0004                	.insn	2, 0x0004
    1496:	0501                	.insn	2, 0x0501
    1498:	061c                	.insn	2, 0x061c
    149a:	04090003          	lb	zero,64(s2)
    149e:	0100                	.insn	2, 0x0100
    14a0:	2005                	.insn	2, 0x2005
    14a2:	04090003          	lb	zero,64(s2)
    14a6:	0100                	.insn	2, 0x0100
    14a8:	1105                	.insn	2, 0x1105
    14aa:	0306                	.insn	2, 0x0306
    14ac:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    14b4:	0409 
    14b6:	0100                	.insn	2, 0x0100
    14b8:	0306                	.insn	2, 0x0306
    14ba:	0901                	.insn	2, 0x0901
    14bc:	0004                	.insn	2, 0x0004
    14be:	0501                	.insn	2, 0x0501
    14c0:	061c                	.insn	2, 0x061c
    14c2:	04090003          	lb	zero,64(s2)
    14c6:	0100                	.insn	2, 0x0100
    14c8:	2005                	.insn	2, 0x2005
    14ca:	04090003          	lb	zero,64(s2)
    14ce:	0100                	.insn	2, 0x0100
    14d0:	1105                	.insn	2, 0x1105
    14d2:	0306                	.insn	2, 0x0306
    14d4:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    14dc:	0409 
    14de:	0100                	.insn	2, 0x0100
    14e0:	0306                	.insn	2, 0x0306
    14e2:	0901                	.insn	2, 0x0901
    14e4:	0004                	.insn	2, 0x0004
    14e6:	0501                	.insn	2, 0x0501
    14e8:	061c                	.insn	2, 0x061c
    14ea:	04090003          	lb	zero,64(s2)
    14ee:	0100                	.insn	2, 0x0100
    14f0:	2005                	.insn	2, 0x2005
    14f2:	04090003          	lb	zero,64(s2)
    14f6:	0100                	.insn	2, 0x0100
    14f8:	1105                	.insn	2, 0x1105
    14fa:	0306                	.insn	2, 0x0306
    14fc:	097f 0004 0601 0003 	.insn	10, 0x0409000306010004097f
    1504:	0409 
    1506:	0100                	.insn	2, 0x0100
    1508:	0306                	.insn	2, 0x0306
    150a:	0901                	.insn	2, 0x0901
    150c:	0004                	.insn	2, 0x0004
    150e:	0501                	.insn	2, 0x0501
    1510:	061c                	.insn	2, 0x061c
    1512:	04090003          	lb	zero,64(s2)
    1516:	0100                	.insn	2, 0x0100
    1518:	2005                	.insn	2, 0x2005
    151a:	04090003          	lb	zero,64(s2)
    151e:	0100                	.insn	2, 0x0100
    1520:	0d05                	.insn	2, 0x0d05
    1522:	0306                	.insn	2, 0x0306
    1524:	0904                	.insn	2, 0x0904
    1526:	0004                	.insn	2, 0x0004
    1528:	0601                	.insn	2, 0x0601
    152a:	04090003          	lb	zero,64(s2)
    152e:	0100                	.insn	2, 0x0100
    1530:	1505                	.insn	2, 0x1505
    1532:	0306                	.insn	2, 0x0306
    1534:	0905                	.insn	2, 0x0905
    1536:	0004                	.insn	2, 0x0004
    1538:	0501                	.insn	2, 0x0501
    153a:	030d                	.insn	2, 0x030d
    153c:	097d                	.insn	2, 0x097d
    153e:	0004                	.insn	2, 0x0004
    1540:	0501                	.insn	2, 0x0501
    1542:	061c                	.insn	2, 0x061c
    1544:	04090003          	lb	zero,64(s2)
    1548:	0100                	.insn	2, 0x0100
    154a:	2005                	.insn	2, 0x2005
    154c:	0306                	.insn	2, 0x0306
    154e:	0904                	.insn	2, 0x0904
    1550:	0004                	.insn	2, 0x0004
    1552:	0501                	.insn	2, 0x0501
    1554:	0624                	.insn	2, 0x0624
    1556:	04090003          	lb	zero,64(s2)
    155a:	0100                	.insn	2, 0x0100
    155c:	1505                	.insn	2, 0x1505
    155e:	0306                	.insn	2, 0x0306
    1560:	097f 0004 0301 0901 	.insn	10, 0x0004090103010004097f
    1568:	0004 
    156a:	0501                	.insn	2, 0x0501
    156c:	0620                	.insn	2, 0x0620
    156e:	04090003          	lb	zero,64(s2)
    1572:	0100                	.insn	2, 0x0100
    1574:	2405                	.insn	2, 0x2405
    1576:	04090003          	lb	zero,64(s2)
    157a:	0100                	.insn	2, 0x0100
    157c:	1505                	.insn	2, 0x1505
    157e:	0306                	.insn	2, 0x0306
    1580:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    1588:	0409 
    158a:	0100                	.insn	2, 0x0100
    158c:	097fa803          	lw	a6,151(t6)
    1590:	0004                	.insn	2, 0x0004
    1592:	0501                	.insn	2, 0x0501
    1594:	0612                	.insn	2, 0x0612
    1596:	0900e303          	.insn	4, 0x0900e303
    159a:	000c                	.insn	2, 0x000c
    159c:	0501                	.insn	2, 0x0501
    159e:	031c                	.insn	2, 0x031c
    15a0:	097f 0004 0301 0904 	.insn	10, 0x0004090403010004097f
    15a8:	0004 
    15aa:	0301                	.insn	2, 0x0301
    15ac:	0901                	.insn	2, 0x0901
    15ae:	0004                	.insn	2, 0x0004
    15b0:	0501                	.insn	2, 0x0501
    15b2:	0318                	.insn	2, 0x0318
    15b4:	00040903          	lb	s2,0(s0)
    15b8:	0501                	.insn	2, 0x0501
    15ba:	097c0323          	sb	s7,134(s8)
    15be:	0008                	.insn	2, 0x0008
    15c0:	0501                	.insn	2, 0x0501
    15c2:	0322                	.insn	2, 0x0322
    15c4:	0901                	.insn	2, 0x0901
    15c6:	0004                	.insn	2, 0x0004
    15c8:	0501                	.insn	2, 0x0501
    15ca:	0318                	.insn	2, 0x0318
    15cc:	00040903          	lb	s2,0(s0)
    15d0:	0501                	.insn	2, 0x0501
    15d2:	061f 0003 0409      	.insn	6, 0x04090003061f
    15d8:	0100                	.insn	2, 0x0100
    15da:	1605                	.insn	2, 0x1605
    15dc:	0306                	.insn	2, 0x0306
    15de:	097f 0004 0501 031c 	.insn	10, 0x0905031c05010004097f
    15e6:	0905 
    15e8:	0004                	.insn	2, 0x0004
    15ea:	0301                	.insn	2, 0x0301
    15ec:	097f 0004 0301 0902 	.insn	10, 0x0004090203010004097f
    15f4:	0004 
    15f6:	0501                	.insn	2, 0x0501
    15f8:	0312                	.insn	2, 0x0312
    15fa:	0901                	.insn	2, 0x0901
    15fc:	0004                	.insn	2, 0x0004
    15fe:	0501                	.insn	2, 0x0501
    1600:	0322                	.insn	2, 0x0322
    1602:	097e                	.insn	2, 0x097e
    1604:	0004                	.insn	2, 0x0004
    1606:	0501                	.insn	2, 0x0501
    1608:	097f0323          	sb	s7,134(t5)
    160c:	0004                	.insn	2, 0x0004
    160e:	0501                	.insn	2, 0x0501
    1610:	0322                	.insn	2, 0x0322
    1612:	0902                	.insn	2, 0x0902
    1614:	0004                	.insn	2, 0x0004
    1616:	0301                	.insn	2, 0x0301
    1618:	0901                	.insn	2, 0x0901
    161a:	0004                	.insn	2, 0x0004
    161c:	0501                	.insn	2, 0x0501
    161e:	0328                	.insn	2, 0x0328
    1620:	097e                	.insn	2, 0x097e
    1622:	0004                	.insn	2, 0x0004
    1624:	0501                	.insn	2, 0x0501
    1626:	0329                	.insn	2, 0x0329
    1628:	0901                	.insn	2, 0x0901
    162a:	0004                	.insn	2, 0x0004
    162c:	0501                	.insn	2, 0x0501
    162e:	097d0313          	addi	t1,s10,151 # 197f1 <$d.5+0x18517>
    1632:	0004                	.insn	2, 0x0004
    1634:	0501                	.insn	2, 0x0501
    1636:	0300                	.insn	2, 0x0300
    1638:	090e                	.insn	2, 0x090e
    163a:	0008                	.insn	2, 0x0008
    163c:	0501                	.insn	2, 0x0501
    163e:	0a14                	.insn	2, 0x0a14
    1640:	0c090103          	lb	sp,192(s2)
    1644:	0100                	.insn	2, 0x0100
    1646:	0c090203          	lb	tp,192(s2)
    164a:	0100                	.insn	2, 0x0100
    164c:	1505                	.insn	2, 0x1505
    164e:	04097f03          	.insn	4, 0x04097f03
    1652:	0100                	.insn	2, 0x0100
    1654:	1a05                	.insn	2, 0x1a05
    1656:	0306                	.insn	2, 0x0306
    1658:	0900                	.insn	2, 0x0900
    165a:	0004                	.insn	2, 0x0004
    165c:	0501                	.insn	2, 0x0501
    165e:	061f 7f03 0c09      	.insn	6, 0x0c097f03061f
    1664:	0100                	.insn	2, 0x0100
    1666:	0505                	.insn	2, 0x0505
    1668:	0b06                	.insn	2, 0x0b06
    166a:	0c090003          	lb	zero,192(s2)
    166e:	0100                	.insn	2, 0x0100
    1670:	0005                	.insn	2, 0x0005
    1672:	0306                	.insn	2, 0x0306
    1674:	0935                	.insn	2, 0x0935
    1676:	0008                	.insn	2, 0x0008
    1678:	0501                	.insn	2, 0x0501
    167a:	0a09                	.insn	2, 0x0a09
    167c:	24090303          	lb	t1,576(s2)
    1680:	0100                	.insn	2, 0x0100
    1682:	0306                	.insn	2, 0x0306
    1684:	0900                	.insn	2, 0x0900
    1686:	0008                	.insn	2, 0x0008
    1688:	0501                	.insn	2, 0x0501
    168a:	0620                	.insn	2, 0x0620
    168c:	04090403          	lb	s0,64(s2)
    1690:	0100                	.insn	2, 0x0100
    1692:	1405                	.insn	2, 0x1405
    1694:	0c094403          	lbu	s0,192(s2)
    1698:	0100                	.insn	2, 0x0100
    169a:	04090203          	lb	tp,64(s2)
    169e:	0100                	.insn	2, 0x0100
    16a0:	1505                	.insn	2, 0x1505
    16a2:	04097f03          	.insn	4, 0x04097f03
    16a6:	0100                	.insn	2, 0x0100
    16a8:	1a05                	.insn	2, 0x1a05
    16aa:	0306                	.insn	2, 0x0306
    16ac:	0900                	.insn	2, 0x0900
    16ae:	0004                	.insn	2, 0x0004
    16b0:	0501                	.insn	2, 0x0501
    16b2:	061f 7f03 0809      	.insn	6, 0x08097f03061f
    16b8:	0100                	.insn	2, 0x0100
    16ba:	0905                	.insn	2, 0x0905
    16bc:	04093e03          	.insn	4, 0x04093e03
    16c0:	0100                	.insn	2, 0x0100
    16c2:	0306                	.insn	2, 0x0306
    16c4:	0900                	.insn	2, 0x0900
    16c6:	0014                	.insn	2, 0x0014
    16c8:	0301                	.insn	2, 0x0301
    16ca:	04097ec7          	.insn	4, 0x04097ec7
    16ce:	0100                	.insn	2, 0x0100
    16d0:	0105                	.insn	2, 0x0105
    16d2:	0b06                	.insn	2, 0x0b06
    16d4:	0901eb03          	.insn	4, 0x0901eb03
    16d8:	0020                	.insn	2, 0x0020
    16da:	0601                	.insn	2, 0x0601
    16dc:	097e9503          	lh	a0,151(t4)
    16e0:	0008                	.insn	2, 0x0008
    16e2:	0501                	.insn	2, 0x0501
    16e4:	0626                	.insn	2, 0x0626
    16e6:	0901d603          	lhu	a2,144(gp)
    16ea:	0024                	.insn	2, 0x0024
    16ec:	0501                	.insn	2, 0x0501
    16ee:	0609                	.insn	2, 0x0609
    16f0:	04090003          	lb	zero,64(s2)
    16f4:	0100                	.insn	2, 0x0100
    16f6:	1805                	.insn	2, 0x1805
    16f8:	0306                	.insn	2, 0x0306
    16fa:	0908                	.insn	2, 0x0908
    16fc:	000c                	.insn	2, 0x000c
    16fe:	0501                	.insn	2, 0x0501
    1700:	030e                	.insn	2, 0x030e
    1702:	097c                	.insn	2, 0x097c
    1704:	0004                	.insn	2, 0x0004
    1706:	0501                	.insn	2, 0x0501
    1708:	0318                	.insn	2, 0x0318
    170a:	097f 0004 0301 0904 	.insn	10, 0x0004090403010004097f
    1712:	0004 
    1714:	0501                	.insn	2, 0x0501
    1716:	031e                	.insn	2, 0x031e
    1718:	0901                	.insn	2, 0x0901
    171a:	0004                	.insn	2, 0x0004
    171c:	0501                	.insn	2, 0x0501
    171e:	0314                	.insn	2, 0x0314
    1720:	00040903          	lb	s2,0(s0)
    1724:	0501                	.insn	2, 0x0501
    1726:	031f 097c 0008      	.insn	6, 0x0008097c031f
    172c:	0501                	.insn	2, 0x0501
    172e:	0314                	.insn	2, 0x0314
    1730:	0904                	.insn	2, 0x0904
    1732:	0004                	.insn	2, 0x0004
    1734:	0501                	.insn	2, 0x0501
    1736:	0003061b          	.insn	4, 0x0003061b
    173a:	0409                	.insn	2, 0x0409
    173c:	0100                	.insn	2, 0x0100
    173e:	1805                	.insn	2, 0x1805
    1740:	0306                	.insn	2, 0x0306
    1742:	0904                	.insn	2, 0x0904
    1744:	0004                	.insn	2, 0x0004
    1746:	0301                	.insn	2, 0x0301
    1748:	097f 0004 0301 0902 	.insn	10, 0x0004090203010004097f
    1750:	0004 
    1752:	0501                	.insn	2, 0x0501
    1754:	030e                	.insn	2, 0x030e
    1756:	0901                	.insn	2, 0x0901
    1758:	0004                	.insn	2, 0x0004
    175a:	0501                	.insn	2, 0x0501
    175c:	031e                	.insn	2, 0x031e
    175e:	097e                	.insn	2, 0x097e
    1760:	0004                	.insn	2, 0x0004
    1762:	0501                	.insn	2, 0x0501
    1764:	031f 097f 0004      	.insn	6, 0x0004097f031f
    176a:	0501                	.insn	2, 0x0501
    176c:	031e                	.insn	2, 0x031e
    176e:	0902                	.insn	2, 0x0902
    1770:	0004                	.insn	2, 0x0004
    1772:	0301                	.insn	2, 0x0301
    1774:	0901                	.insn	2, 0x0901
    1776:	0004                	.insn	2, 0x0004
    1778:	0501                	.insn	2, 0x0501
    177a:	0324                	.insn	2, 0x0324
    177c:	097e                	.insn	2, 0x097e
    177e:	0004                	.insn	2, 0x0004
    1780:	0501                	.insn	2, 0x0501
    1782:	0325                	.insn	2, 0x0325
    1784:	0901                	.insn	2, 0x0901
    1786:	0004                	.insn	2, 0x0004
    1788:	0501                	.insn	2, 0x0501
    178a:	0309                	.insn	2, 0x0309
    178c:	00040903          	lb	s2,0(s0)
    1790:	0501                	.insn	2, 0x0501
    1792:	09530317          	auipc	t1,0x9530
    1796:	000c                	.insn	2, 0x000c
    1798:	0501                	.insn	2, 0x0501
    179a:	0605                	.insn	2, 0x0605
    179c:	08090003          	lb	zero,128(s2)
    17a0:	0100                	.insn	2, 0x0100
    17a2:	0d05                	.insn	2, 0x0d05
    17a4:	0306                	.insn	2, 0x0306
    17a6:	0904                	.insn	2, 0x0904
    17a8:	0004                	.insn	2, 0x0004
    17aa:	0601                	.insn	2, 0x0601
    17ac:	04090003          	lb	zero,64(s2)
    17b0:	0100                	.insn	2, 0x0100
    17b2:	0306                	.insn	2, 0x0306
    17b4:	0906                	.insn	2, 0x0906
    17b6:	0008                	.insn	2, 0x0008
    17b8:	0601                	.insn	2, 0x0601
    17ba:	04090003          	lb	zero,64(s2)
    17be:	0100                	.insn	2, 0x0100
    17c0:	1105                	.insn	2, 0x1105
    17c2:	0306                	.insn	2, 0x0306
    17c4:	0904                	.insn	2, 0x0904
    17c6:	0004                	.insn	2, 0x0004
    17c8:	0601                	.insn	2, 0x0601
    17ca:	04090003          	lb	zero,64(s2)
    17ce:	0100                	.insn	2, 0x0100
    17d0:	04090003          	lb	zero,64(s2)
    17d4:	0100                	.insn	2, 0x0100
    17d6:	04090003          	lb	zero,64(s2)
    17da:	0100                	.insn	2, 0x0100
    17dc:	04090003          	lb	zero,64(s2)
    17e0:	0100                	.insn	2, 0x0100
    17e2:	04090003          	lb	zero,64(s2)
    17e6:	0100                	.insn	2, 0x0100
    17e8:	04090003          	lb	zero,64(s2)
    17ec:	0100                	.insn	2, 0x0100
    17ee:	04090003          	lb	zero,64(s2)
    17f2:	0100                	.insn	2, 0x0100
    17f4:	04090003          	lb	zero,64(s2)
    17f8:	0100                	.insn	2, 0x0100
    17fa:	04090003          	lb	zero,64(s2)
    17fe:	0100                	.insn	2, 0x0100
    1800:	04090003          	lb	zero,64(s2)
    1804:	0100                	.insn	2, 0x0100
    1806:	04090003          	lb	zero,64(s2)
    180a:	0100                	.insn	2, 0x0100
    180c:	04090003          	lb	zero,64(s2)
    1810:	0100                	.insn	2, 0x0100
    1812:	04090003          	lb	zero,64(s2)
    1816:	0100                	.insn	2, 0x0100
    1818:	04090003          	lb	zero,64(s2)
    181c:	0100                	.insn	2, 0x0100
    181e:	0d05                	.insn	2, 0x0d05
    1820:	0306                	.insn	2, 0x0306
    1822:	0904                	.insn	2, 0x0904
    1824:	0004                	.insn	2, 0x0004
    1826:	0601                	.insn	2, 0x0601
    1828:	04090003          	lb	zero,64(s2)
    182c:	0100                	.insn	2, 0x0100
    182e:	1105                	.insn	2, 0x1105
    1830:	0306                	.insn	2, 0x0306
    1832:	097d                	.insn	2, 0x097d
    1834:	0008                	.insn	2, 0x0008
    1836:	0301                	.insn	2, 0x0301
    1838:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    1840:	0409 
    1842:	0100                	.insn	2, 0x0100
    1844:	0306                	.insn	2, 0x0306
    1846:	0901                	.insn	2, 0x0901
    1848:	0004                	.insn	2, 0x0004
    184a:	0301                	.insn	2, 0x0301
    184c:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    1854:	0409 
    1856:	0100                	.insn	2, 0x0100
    1858:	0306                	.insn	2, 0x0306
    185a:	0901                	.insn	2, 0x0901
    185c:	0004                	.insn	2, 0x0004
    185e:	0301                	.insn	2, 0x0301
    1860:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    1868:	0409 
    186a:	0100                	.insn	2, 0x0100
    186c:	0306                	.insn	2, 0x0306
    186e:	0901                	.insn	2, 0x0901
    1870:	0004                	.insn	2, 0x0004
    1872:	0301                	.insn	2, 0x0301
    1874:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    187c:	0409 
    187e:	0100                	.insn	2, 0x0100
    1880:	0306                	.insn	2, 0x0306
    1882:	0901                	.insn	2, 0x0901
    1884:	0004                	.insn	2, 0x0004
    1886:	0301                	.insn	2, 0x0301
    1888:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    1890:	0409 
    1892:	0100                	.insn	2, 0x0100
    1894:	0306                	.insn	2, 0x0306
    1896:	0901                	.insn	2, 0x0901
    1898:	0004                	.insn	2, 0x0004
    189a:	0301                	.insn	2, 0x0301
    189c:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    18a4:	0409 
    18a6:	0100                	.insn	2, 0x0100
    18a8:	0306                	.insn	2, 0x0306
    18aa:	0901                	.insn	2, 0x0901
    18ac:	0004                	.insn	2, 0x0004
    18ae:	0301                	.insn	2, 0x0301
    18b0:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    18b8:	0409 
    18ba:	0100                	.insn	2, 0x0100
    18bc:	0306                	.insn	2, 0x0306
    18be:	0901                	.insn	2, 0x0901
    18c0:	0004                	.insn	2, 0x0004
    18c2:	0501                	.insn	2, 0x0501
    18c4:	030d                	.insn	2, 0x030d
    18c6:	00080903          	lb	s2,0(a6)
    18ca:	0601                	.insn	2, 0x0601
    18cc:	04090003          	lb	zero,64(s2)
    18d0:	0100                	.insn	2, 0x0100
    18d2:	0306                	.insn	2, 0x0306
    18d4:	0901                	.insn	2, 0x0901
    18d6:	0004                	.insn	2, 0x0004
    18d8:	0501                	.insn	2, 0x0501
    18da:	0315                	.insn	2, 0x0315
    18dc:	0902                	.insn	2, 0x0902
    18de:	000c                	.insn	2, 0x000c
    18e0:	0601                	.insn	2, 0x0601
    18e2:	04090003          	lb	zero,64(s2)
    18e6:	0100                	.insn	2, 0x0100
    18e8:	04090003          	lb	zero,64(s2)
    18ec:	0100                	.insn	2, 0x0100
    18ee:	04090003          	lb	zero,64(s2)
    18f2:	0100                	.insn	2, 0x0100
    18f4:	04090003          	lb	zero,64(s2)
    18f8:	0100                	.insn	2, 0x0100
    18fa:	04090003          	lb	zero,64(s2)
    18fe:	0100                	.insn	2, 0x0100
    1900:	0306                	.insn	2, 0x0306
    1902:	0901                	.insn	2, 0x0901
    1904:	0008                	.insn	2, 0x0008
    1906:	0301                	.insn	2, 0x0301
    1908:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    1910:	0409 
    1912:	0100                	.insn	2, 0x0100
    1914:	0306                	.insn	2, 0x0306
    1916:	0901                	.insn	2, 0x0901
    1918:	0004                	.insn	2, 0x0004
    191a:	0301                	.insn	2, 0x0301
    191c:	097f 0008 0601 0003 	.insn	10, 0x0409000306010008097f
    1924:	0409 
    1926:	0100                	.insn	2, 0x0100
    1928:	0306                	.insn	2, 0x0306
    192a:	0901                	.insn	2, 0x0901
    192c:	0004                	.insn	2, 0x0004
    192e:	0601                	.insn	2, 0x0601
    1930:	097eae03          	lw	t3,151(t4)
    1934:	0008                	.insn	2, 0x0008
    1936:	0901                	.insn	2, 0x0901
    1938:	0004                	.insn	2, 0x0004
    193a:	0100                	.insn	2, 0x0100
    193c:	01                	.byte	0x01
