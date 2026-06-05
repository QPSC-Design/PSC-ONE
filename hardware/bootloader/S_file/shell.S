
./build/shell.elf:     ファイル形式 elf32-littleriscv


セクション .text の逆アセンブル:

00400000 <start>:

/* ===== エントリ ===== */
__attribute__((section(".text.start")))
__attribute__((naked))
void start(void) {
    __asm__ __volatile__(
  400000:	00422537          	lui	a0,0x422
  400004:	39050513          	addi	a0,a0,912 # 422390 <__user_stack_top>
  400008:	00050113          	mv	sp,a0
  40000c:	00000097          	auipc	ra,0x0
  400010:	010080e7          	jalr	16(ra) # 40001c <main>
  400014:	00000097          	auipc	ra,0x0
  400018:	7fc080e7          	jalr	2044(ra) # 400810 <exit>

0040001c <main>:
// shell.c
#include "user.h"

void main(void) {
  40001c:	f4010113          	addi	sp,sp,-192
  400020:	0a112e23          	sw	ra,188(sp)
  400024:	0a812c23          	sw	s0,184(sp)
  400028:	0a912a23          	sw	s1,180(sp)
  40002c:	0b212823          	sw	s2,176(sp)
  400030:	0b312623          	sw	s3,172(sp)
  400034:	0b412423          	sw	s4,168(sp)
  400038:	0b512223          	sw	s5,164(sp)
  40003c:	0b612023          	sw	s6,160(sp)
  400040:	09712e23          	sw	s7,156(sp)
  400044:	09812c23          	sw	s8,152(sp)
  400048:	09912a23          	sw	s9,148(sp)
  40004c:	09a12823          	sw	s10,144(sp)
  400050:	09b12623          	sw	s11,140(sp)

    // DUMP API call
    //call_dump_api();


    printf("shell start.\n");
  400054:	00401537          	lui	a0,0x401
  400058:	31f50513          	addi	a0,a0,799 # 40131f <$d.1>
  40005c:	00001097          	auipc	ra,0x1
  400060:	c00080e7          	jalr	-1024(ra) # 400c5c <printf>
  400064:	02000d93          	li	s11,32
  400068:	00a00b13          	li	s6,10
  40006c:	00c00d13          	li	s10,12
  400070:	00800c93          	li	s9,8
  400074:	06c10c13          	addi	s8,sp,108
  400078:	00900b93          	li	s7,9
  40007c:	04c10a13          	addi	s4,sp,76
  400080:	00401537          	lui	a0,0x401
  400084:	30750513          	addi	a0,a0,775 # 401307 <__modsi3+0xd3>
  400088:	04a12423          	sw	a0,72(sp)
  40008c:	00401537          	lui	a0,0x401
  400090:	2af50513          	addi	a0,a0,687 # 4012af <__modsi3+0x7b>
  400094:	02a12e23          	sw	a0,60(sp)
  400098:	00401537          	lui	a0,0x401
  40009c:	32d50513          	addi	a0,a0,813 # 40132d <$d.1+0xe>
  4000a0:	04a12223          	sw	a0,68(sp)
  4000a4:	00401537          	lui	a0,0x401
  4000a8:	2c850513          	addi	a0,a0,712 # 4012c8 <__modsi3+0x94>
  4000ac:	04a12023          	sw	a0,64(sp)
  4000b0:	00018537          	lui	a0,0x18
  4000b4:	6a050513          	addi	a0,a0,1696 # 186a0 <$d.11+0x17fc0>
  4000b8:	02a12623          	sw	a0,44(sp)
  4000bc:	00401537          	lui	a0,0x401
  4000c0:	36050513          	addi	a0,a0,864 # 401360 <$d.2+0x2a>
  4000c4:	00a12c23          	sw	a0,24(sp)
  4000c8:	00401537          	lui	a0,0x401
  4000cc:	2fe50513          	addi	a0,a0,766 # 4012fe <__modsi3+0xca>
  4000d0:	02a12c23          	sw	a0,56(sp)
  4000d4:	00401537          	lui	a0,0x401
  4000d8:	29450513          	addi	a0,a0,660 # 401294 <__modsi3+0x60>
  4000dc:	00a12823          	sw	a0,16(sp)
  4000e0:	00401537          	lui	a0,0x401
  4000e4:	2a750513          	addi	a0,a0,679 # 4012a7 <__modsi3+0x73>
  4000e8:	02a12a23          	sw	a0,52(sp)
  4000ec:	00401537          	lui	a0,0x401
  4000f0:	34750513          	addi	a0,a0,839 # 401347 <$d.2+0x11>
  4000f4:	00a12623          	sw	a0,12(sp)
  4000f8:	00401537          	lui	a0,0x401
  4000fc:	31850513          	addi	a0,a0,792 # 401318 <__modsi3+0xe4>
  400100:	02a12823          	sw	a0,48(sp)
  400104:	00401537          	lui	a0,0x401
  400108:	30d50513          	addi	a0,a0,781 # 40130d <__modsi3+0xd9>
  40010c:	00a12a23          	sw	a0,20(sp)
  400110:	00401537          	lui	a0,0x401
  400114:	37f50513          	addi	a0,a0,895 # 40137f <$d.2+0x49>
  400118:	02a12423          	sw	a0,40(sp)
  40011c:	00401537          	lui	a0,0x401
  400120:	37a50513          	addi	a0,a0,890 # 40137a <$d.2+0x44>
  400124:	02a12223          	sw	a0,36(sp)
  400128:	00401537          	lui	a0,0x401
  40012c:	31d50513          	addi	a0,a0,797 # 40131d <__modsi3+0xe9>
  400130:	02a12023          	sw	a0,32(sp)
  400134:	00401537          	lui	a0,0x401
  400138:	2cf50513          	addi	a0,a0,719 # 4012cf <__modsi3+0x9b>
  40013c:	00a12e23          	sw	a0,28(sp)
  400140:	01f00993          	li	s3,31
  400144:	07f00913          	li	s2,127
  400148:	00d00413          	li	s0,13
  40014c:	0140006f          	j	400160 <main+0x144>
  400150:	03c12503          	lw	a0,60(sp)
  400154:	00001097          	auipc	ra,0x1
  400158:	b08080e7          	jalr	-1272(ra) # 400c5c <printf>
  40015c:	04c10a13          	addi	s4,sp,76
prompt:
        //printf("main(void) start.\n");
        //printf("SP=%x\n", __builtin_frame_address(0));

        //printf("> ");
        putchar(0x1B); putchar('['); putchar('3'); putchar('4'); putchar('m'); // 青
  400160:	01b00513          	li	a0,27
  400164:	00001097          	auipc	ra,0x1
  400168:	a44080e7          	jalr	-1468(ra) # 400ba8 <putchar>
  40016c:	05b00513          	li	a0,91
  400170:	00001097          	auipc	ra,0x1
  400174:	a38080e7          	jalr	-1480(ra) # 400ba8 <putchar>
  400178:	03300513          	li	a0,51
  40017c:	00001097          	auipc	ra,0x1
  400180:	a2c080e7          	jalr	-1492(ra) # 400ba8 <putchar>
  400184:	03400513          	li	a0,52
  400188:	00001097          	auipc	ra,0x1
  40018c:	a20080e7          	jalr	-1504(ra) # 400ba8 <putchar>
  400190:	06d00513          	li	a0,109
  400194:	00001097          	auipc	ra,0x1
  400198:	a14080e7          	jalr	-1516(ra) # 400ba8 <putchar>
        
        putchar('P');
  40019c:	05000513          	li	a0,80
  4001a0:	00001097          	auipc	ra,0x1
  4001a4:	a08080e7          	jalr	-1528(ra) # 400ba8 <putchar>
        putchar('S');
  4001a8:	05300513          	li	a0,83
  4001ac:	00001097          	auipc	ra,0x1
  4001b0:	9fc080e7          	jalr	-1540(ra) # 400ba8 <putchar>
        putchar('C');
  4001b4:	04300513          	li	a0,67
  4001b8:	00001097          	auipc	ra,0x1
  4001bc:	9f0080e7          	jalr	-1552(ra) # 400ba8 <putchar>
        putchar('_');
  4001c0:	05f00513          	li	a0,95
  4001c4:	00001097          	auipc	ra,0x1
  4001c8:	9e4080e7          	jalr	-1564(ra) # 400ba8 <putchar>
        putchar('O');
  4001cc:	04f00513          	li	a0,79
  4001d0:	00001097          	auipc	ra,0x1
  4001d4:	9d8080e7          	jalr	-1576(ra) # 400ba8 <putchar>
        putchar('S');
  4001d8:	05300513          	li	a0,83
  4001dc:	00001097          	auipc	ra,0x1
  4001e0:	9cc080e7          	jalr	-1588(ra) # 400ba8 <putchar>
        putchar('>');
  4001e4:	03e00513          	li	a0,62
  4001e8:	00001097          	auipc	ra,0x1
  4001ec:	9c0080e7          	jalr	-1600(ra) # 400ba8 <putchar>
        putchar(' ');
  4001f0:	02000513          	li	a0,32
  4001f4:	00001097          	auipc	ra,0x1
  4001f8:	9b4080e7          	jalr	-1612(ra) # 400ba8 <putchar>
        
        putchar(0x1B); putchar('['); putchar('0'); putchar('m'); // リセット
  4001fc:	01b00513          	li	a0,27
  400200:	00001097          	auipc	ra,0x1
  400204:	9a8080e7          	jalr	-1624(ra) # 400ba8 <putchar>
  400208:	05b00513          	li	a0,91
  40020c:	00001097          	auipc	ra,0x1
  400210:	99c080e7          	jalr	-1636(ra) # 400ba8 <putchar>
  400214:	03000513          	li	a0,48
  400218:	00001097          	auipc	ra,0x1
  40021c:	990080e7          	jalr	-1648(ra) # 400ba8 <putchar>
  400220:	06d00513          	li	a0,109
  400224:	00001097          	auipc	ra,0x1
  400228:	984080e7          	jalr	-1660(ra) # 400ba8 <putchar>
  40022c:	00000493          	li	s1,0
  400230:	00c0006f          	j	40023c <main+0x220>
            if (ch == '\n' && len == 0) {
                continue;
            }

            // バックスペース処理
            if (ch == 8 || ch == 127) {
  400234:	03251463          	bne	a0,s2,40025c <main+0x240>
                if (len > 0) {
  400238:	04904463          	bgtz	s1,400280 <main+0x264>
            int ch = getchar();
  40023c:	00001097          	auipc	ra,0x1
  400240:	e9c080e7          	jalr	-356(ra) # 4010d8 <getchar>
            if (ch == '\n' && len == 0) {
  400244:	01651463          	bne	a0,s6,40024c <main+0x230>
  400248:	fe048ae3          	beqz	s1,40023c <main+0x220>
            if (ch == 8 || ch == 127) {
  40024c:	fead44e3          	blt	s10,a0,400234 <main+0x218>
  400250:	ff9504e3          	beq	a0,s9,400238 <main+0x21c>
  400254:	01651663          	bne	a0,s6,400260 <main+0x244>
  400258:	0580006f          	j	4002b0 <main+0x294>
  40025c:	04850a63          	beq	a0,s0,4002b0 <main+0x294>
  400260:	00a9c463          	blt	s3,a0,400268 <main+0x24c>
  400264:	fd751ce3          	bne	a0,s7,40023c <main+0x220>
            // 制御文字は基本スキップ（\tは許容）
            if (ch < 0x20 && ch != '\t')
                continue;

            // 長さチェック（終端NULぶんを確保）
            if (len >= (int)sizeof(cmdline) - 1) {
  400268:	01e00593          	li	a1,30
  40026c:	ee95cae3          	blt	a1,s1,400160 <main+0x144>
                //printf("\ncommand line too long\n");
                goto prompt;
            }

            // 文字を追加 & エコー
            cmdline[len++] = (char)ch;
  400270:	009c05b3          	add	a1,s8,s1
  400274:	00148493          	addi	s1,s1,1
  400278:	00a58023          	sb	a0,0(a1)
  40027c:	0240006f          	j	4002a0 <main+0x284>
                    len--;
  400280:	fff48493          	addi	s1,s1,-1
                    putchar('\b');
  400284:	00800513          	li	a0,8
  400288:	00001097          	auipc	ra,0x1
  40028c:	920080e7          	jalr	-1760(ra) # 400ba8 <putchar>
                    putchar(' ');
  400290:	02000513          	li	a0,32
  400294:	00001097          	auipc	ra,0x1
  400298:	914080e7          	jalr	-1772(ra) # 400ba8 <putchar>
  40029c:	00800513          	li	a0,8
  4002a0:	0ff57513          	zext.b	a0,a0
  4002a4:	00001097          	auipc	ra,0x1
  4002a8:	904080e7          	jalr	-1788(ra) # 400ba8 <putchar>
  4002ac:	f91ff06f          	j	40023c <main+0x220>
                putchar('\n');
  4002b0:	00a00513          	li	a0,10
  4002b4:	00001097          	auipc	ra,0x1
  4002b8:	8f4080e7          	jalr	-1804(ra) # 400ba8 <putchar>
                cmdline[len] = '\0';
  4002bc:	009c0533          	add	a0,s8,s1
  4002c0:	00050023          	sb	zero,0(a0)
  4002c4:	e8048ee3          	beqz	s1,400160 <main+0x144>
  4002c8:	06c10513          	addi	a0,sp,108
  4002cc:	0080006f          	j	4002d4 <main+0x2b8>
        const char *argv[ARGV_MAX];
        int argc = 0;

        // 先頭空白をスキップ
        char *p = cmdline;
        while (*p == ' ' || *p == '\t') p++;
  4002d0:	00150513          	addi	a0,a0,1
  4002d4:	00054583          	lbu	a1,0(a0)
  4002d8:	ff758ce3          	beq	a1,s7,4002d0 <main+0x2b4>
  4002dc:	ffb58ae3          	beq	a1,s11,4002d0 <main+0x2b4>
  4002e0:	e80580e3          	beqz	a1,400160 <main+0x144>
  4002e4:	00000493          	li	s1,0
  4002e8:	00048a93          	mv	s5,s1
  4002ec:	00050593          	mv	a1,a0

        while (*p && argc < ARGV_MAX) {
            argv[argc++] = p;
  4002f0:	00148493          	addi	s1,s1,1
  4002f4:	002a9513          	slli	a0,s5,0x2
  4002f8:	00aa0533          	add	a0,s4,a0
  4002fc:	00b52023          	sw	a1,0(a0)
            // 次の区切りまで進める
            while (*p && *p != ' ' && *p != '\t') p++;
  400300:	00158513          	addi	a0,a1,1
  400304:	0005c603          	lbu	a2,0(a1)
  400308:	04060263          	beqz	a2,40034c <main+0x330>
  40030c:	01760e63          	beq	a2,s7,400328 <main+0x30c>
  400310:	01b60c63          	beq	a2,s11,400328 <main+0x30c>
  400314:	00158593          	addi	a1,a1,1
  400318:	00150513          	addi	a0,a0,1
  40031c:	0005c603          	lbu	a2,0(a1)
  400320:	fe0616e3          	bnez	a2,40030c <main+0x2f0>
  400324:	0280006f          	j	40034c <main+0x330>
            if (!*p) break;
            // 区切りをNULに
            *p++ = '\0';
  400328:	00058023          	sb	zero,0(a1)
  40032c:	0080006f          	j	400334 <main+0x318>
  400330:	00150513          	addi	a0,a0,1
            while (*p == ' ' || *p == '\t') p++;
  400334:	00054583          	lbu	a1,0(a0)
  400338:	ffb58ce3          	beq	a1,s11,400330 <main+0x314>
  40033c:	ff758ae3          	beq	a1,s7,400330 <main+0x314>
        while (*p && argc < ARGV_MAX) {
  400340:	00058663          	beqz	a1,40034c <main+0x330>
  400344:	00600593          	li	a1,6
  400348:	fb55f0e3          	bgeu	a1,s5,4002e8 <main+0x2cc>
        }

        if (argc == 0) continue;

        /* ===== コマンド分岐 ===== */
        if (strcmp(argv[0], "hello") == 0) {
  40034c:	04c12a03          	lw	s4,76(sp)
  400350:	000a0513          	mv	a0,s4
  400354:	04812583          	lw	a1,72(sp)
  400358:	00001097          	auipc	ra,0x1
  40035c:	8c4080e7          	jalr	-1852(ra) # 400c1c <strcmp>
  400360:	de0508e3          	beqz	a0,400150 <main+0x134>
            printf("Hello world from shell!\n");

        // ---- Dump ----
        } else if (strcmp(argv[0], "dump") == 0) {
  400364:	000a0513          	mv	a0,s4
  400368:	04412583          	lw	a1,68(sp)
  40036c:	00001097          	auipc	ra,0x1
  400370:	8b0080e7          	jalr	-1872(ra) # 400c1c <strcmp>
  400374:	0a050463          	beqz	a0,40041c <main+0x400>
            unsigned lenb = (argc >= 3) ? parse_u32(argv[2]) : 0x100;
            hexdump((const void*)addr, lenb, (uintptr_t)addr);
        */

        // ---- 素数出力サンプル ----
        } else if (strcmp(argv[0], "primes") == 0) {
  400378:	000a0513          	mv	a0,s4
  40037c:	04012583          	lw	a1,64(sp)
  400380:	00001097          	auipc	ra,0x1
  400384:	89c080e7          	jalr	-1892(ra) # 400c1c <strcmp>
  400388:	0e050263          	beqz	a0,40046c <main+0x450>
                }
            }
            cmd_primes(max);

        // ---- SynapEngine ----
        } else if (strcmp(argv[0], "sa_start") == 0) {
  40038c:	000a0513          	mv	a0,s4
  400390:	03812583          	lw	a1,56(sp)
  400394:	00001097          	auipc	ra,0x1
  400398:	888080e7          	jalr	-1912(ra) # 400c1c <strcmp>
  40039c:	0e050e63          	beqz	a0,400498 <main+0x47c>
            }
            // SA API call 
            call_sa_api(matrix_max);

        // ---- SDカードREAD ----
        } else if (strcmp(argv[0], "sd_read") == 0) {
  4003a0:	000a0513          	mv	a0,s4
  4003a4:	03412583          	lw	a1,52(sp)
  4003a8:	00001097          	auipc	ra,0x1
  4003ac:	874080e7          	jalr	-1932(ra) # 400c1c <strcmp>
  4003b0:	12050a63          	beqz	a0,4004e4 <main+0x4c8>

            unsigned sd_sector = parse_u32(argv[1]);
            call_sd_api(sd_sector);

        // ---- Helps出力 ----
        } else if (strcmp(argv[0], "help") == 0) {
  4003b4:	000a0513          	mv	a0,s4
  4003b8:	03012583          	lw	a1,48(sp)
  4003bc:	00001097          	auipc	ra,0x1
  4003c0:	860080e7          	jalr	-1952(ra) # 400c1c <strcmp>
  4003c4:	14050e63          	beqz	a0,400520 <main+0x504>
            printf("  sa_start\n");
            printf("  sd_read\n");
            printf("  exit | quit | q\n");
            */

        } else if (strcmp(argv[0], "exit") == 0 ||
  4003c8:	000a0513          	mv	a0,s4
  4003cc:	02812583          	lw	a1,40(sp)
  4003d0:	00001097          	auipc	ra,0x1
  4003d4:	84c080e7          	jalr	-1972(ra) # 400c1c <strcmp>
  4003d8:	2a050463          	beqz	a0,400680 <main+0x664>
                   strcmp(argv[0], "quit") == 0 ||
  4003dc:	000a0513          	mv	a0,s4
  4003e0:	02412583          	lw	a1,36(sp)
  4003e4:	00001097          	auipc	ra,0x1
  4003e8:	838080e7          	jalr	-1992(ra) # 400c1c <strcmp>
  4003ec:	28050a63          	beqz	a0,400680 <main+0x664>
                   strcmp(argv[0], "q") == 0) {
  4003f0:	000a0513          	mv	a0,s4
  4003f4:	02012583          	lw	a1,32(sp)
  4003f8:	00001097          	auipc	ra,0x1
  4003fc:	824080e7          	jalr	-2012(ra) # 400c1c <strcmp>
        } else if (strcmp(argv[0], "exit") == 0 ||
  400400:	28050063          	beqz	a0,400680 <main+0x664>
  400404:	01c12503          	lw	a0,28(sp)
            exit();
        
        } else {
            printf("unknown command: %s\n", argv[0]);
  400408:	000a0593          	mv	a1,s4
  40040c:	00001097          	auipc	ra,0x1
  400410:	850080e7          	jalr	-1968(ra) # 400c5c <printf>
  400414:	04c10a13          	addi	s4,sp,76
  400418:	d49ff06f          	j	400160 <main+0x144>
  40041c:	10000593          	li	a1,256
            if (argc >= 2) {
  400420:	0a0a8063          	beqz	s5,4004c0 <main+0x4a4>
                if (parse_hex(argv[1], &val) == 0) {
  400424:	05012683          	lw	a3,80(sp)
/* 簡易16進パーサ（"  0x1234" / "1234" 形式どちらも可） */
int parse_hex(const char *s, uintptr_t *out) {
    uintptr_t v = 0;

    /* skip leading spaces */
    while (*s == ' ' || *s == '\t') s++;
  400428:	00268693          	addi	a3,a3,2
  40042c:	04c10a13          	addi	s4,sp,76
  400430:	00500893          	li	a7,5
  400434:	0080006f          	j	40043c <main+0x420>
  400438:	00168693          	addi	a3,a3,1
  40043c:	ffe6c603          	lbu	a2,-2(a3)
  400440:	ff760ce3          	beq	a2,s7,400438 <main+0x41c>
  400444:	ffb60ae3          	beq	a2,s11,400438 <main+0x41c>
  400448:	03000513          	li	a0,48
  40044c:	08a61463          	bne	a2,a0,4004d4 <main+0x4b8>

    /* optional 0x / 0X */
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  400450:	fff6c503          	lbu	a0,-1(a3)
  400454:	02056513          	ori	a0,a0,32
  400458:	07800613          	li	a2,120
  40045c:	0ec51663          	bne	a0,a2,400548 <main+0x52c>
    if (!*s) return -1;
  400460:	0006c603          	lbu	a2,0(a3)
  400464:	0e061663          	bnez	a2,400550 <main+0x534>
  400468:	0740006f          	j	4004dc <main+0x4c0>
  40046c:	04c10a13          	addi	s4,sp,76
            if (argc >= 2) {
  400470:	080a8a63          	beqz	s5,400504 <main+0x4e8>
                max = parse_u32(argv[1]);
  400474:	05012503          	lw	a0,80(sp)
  400478:	00001097          	auipc	ra,0x1
  40047c:	aec080e7          	jalr	-1300(ra) # 400f64 <parse_u32>
  400480:	02c12583          	lw	a1,44(sp)
                if (max > 100000) {
  400484:	08a5f863          	bgeu	a1,a0,400514 <main+0x4f8>
  400488:	01812503          	lw	a0,24(sp)
                    printf("max too large (<=100000)\n");
  40048c:	00000097          	auipc	ra,0x0
  400490:	7d0080e7          	jalr	2000(ra) # 400c5c <printf>
  400494:	ccdff06f          	j	400160 <main+0x144>
            if (argc >= 2) {
  400498:	000a8a63          	beqz	s5,4004ac <main+0x490>
                matrix_max = parse_u32(argv[1]);
  40049c:	05012503          	lw	a0,80(sp)
  4004a0:	00001097          	auipc	ra,0x1
  4004a4:	ac4080e7          	jalr	-1340(ra) # 400f64 <parse_u32>
                if (matrix_max != 12) {
  4004a8:	09a51663          	bne	a0,s10,400534 <main+0x518>
            call_sa_api(matrix_max);
  4004ac:	00c00513          	li	a0,12
  4004b0:	00000097          	auipc	ra,0x0
  4004b4:	378080e7          	jalr	888(ra) # 400828 <call_sa_api>
  4004b8:	04c10a13          	addi	s4,sp,76
  4004bc:	ca5ff06f          	j	400160 <main+0x144>
  4004c0:	00200537          	lui	a0,0x200
  4004c4:	04c10a13          	addi	s4,sp,76
            call_dump_api(addr, len);
  4004c8:	00000097          	auipc	ra,0x0
  4004cc:	714080e7          	jalr	1812(ra) # 400bdc <call_dump_api>
  4004d0:	c91ff06f          	j	400160 <main+0x144>
    if (!*s) return -1;
  4004d4:	ffe68693          	addi	a3,a3,-2
  4004d8:	06061c63          	bnez	a2,400550 <main+0x534>
  4004dc:	00200537          	lui	a0,0x200
  4004e0:	0cc0006f          	j	4005ac <main+0x590>
  4004e4:	04c10a13          	addi	s4,sp,76
            if (argc < 2) {
  4004e8:	100a8c63          	beqz	s5,400600 <main+0x5e4>
            unsigned sd_sector = parse_u32(argv[1]);
  4004ec:	05012503          	lw	a0,80(sp)
  4004f0:	00001097          	auipc	ra,0x1
  4004f4:	a74080e7          	jalr	-1420(ra) # 400f64 <parse_u32>
            call_sd_api(sd_sector);
  4004f8:	00000097          	auipc	ra,0x0
  4004fc:	6d8080e7          	jalr	1752(ra) # 400bd0 <call_sd_api>
  400500:	c61ff06f          	j	400160 <main+0x144>
  400504:	3e800513          	li	a0,1000
            cmd_primes(max);
  400508:	00000097          	auipc	ra,0x0
  40050c:	24c080e7          	jalr	588(ra) # 400754 <cmd_primes>
  400510:	c51ff06f          	j	400160 <main+0x144>
  400514:	00000097          	auipc	ra,0x0
  400518:	240080e7          	jalr	576(ra) # 400754 <cmd_primes>
  40051c:	c45ff06f          	j	400160 <main+0x144>
  400520:	01412503          	lw	a0,20(sp)
  400524:	00000097          	auipc	ra,0x0
  400528:	738080e7          	jalr	1848(ra) # 400c5c <printf>
  40052c:	04c10a13          	addi	s4,sp,76
  400530:	c31ff06f          	j	400160 <main+0x144>
  400534:	01012503          	lw	a0,16(sp)
  400538:	00000097          	auipc	ra,0x0
  40053c:	724080e7          	jalr	1828(ra) # 400c5c <printf>
  400540:	04c10a13          	addi	s4,sp,76
  400544:	c1dff06f          	j	400160 <main+0x144>
  400548:	ffe68693          	addi	a3,a3,-2
  40054c:	03000613          	li	a2,48
  400550:	00000513          	li	a0,0

    while (*s) {
        char c = *s++;
        uint32_t d;
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400554:	00168693          	addi	a3,a3,1
  400558:	0200006f          	j	400578 <main+0x55c>
  40055c:	0ff67793          	zext.b	a5,a2
    while (*s) {
  400560:	0006c603          	lbu	a2,0(a3)
  400564:	00f70733          	add	a4,a4,a5
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
        else break;
        v = (v << 4) | d;
  400568:	00451513          	slli	a0,a0,0x4
  40056c:	00a76533          	or	a0,a4,a0
    while (*s) {
  400570:	00168693          	addi	a3,a3,1
  400574:	02060c63          	beqz	a2,4005ac <main+0x590>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400578:	fd060713          	addi	a4,a2,-48
  40057c:	0ff77793          	zext.b	a5,a4
  400580:	fd000713          	li	a4,-48
  400584:	fd67ece3          	bltu	a5,s6,40055c <main+0x540>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  400588:	f9f60713          	addi	a4,a2,-97
  40058c:	0ff77793          	zext.b	a5,a4
  400590:	fa900713          	li	a4,-87
  400594:	00600813          	li	a6,6
  400598:	fd07e2e3          	bltu	a5,a6,40055c <main+0x540>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  40059c:	fbf60713          	addi	a4,a2,-65
  4005a0:	0ff77793          	zext.b	a5,a4
  4005a4:	fc900713          	li	a4,-55
  4005a8:	faf8fae3          	bgeu	a7,a5,40055c <main+0x540>
            if (argc >= 3) {
  4005ac:	00200613          	li	a2,2
  4005b0:	0cc48263          	beq	s1,a2,400674 <main+0x658>
                if (parse_hex(argv[2], &val) == 0) {
  4005b4:	05412683          	lw	a3,84(sp)
    while (*s == ' ' || *s == '\t') s++;
  4005b8:	00268693          	addi	a3,a3,2
  4005bc:	0080006f          	j	4005c4 <main+0x5a8>
  4005c0:	00168693          	addi	a3,a3,1
  4005c4:	ffe6c603          	lbu	a2,-2(a3)
  4005c8:	ff760ce3          	beq	a2,s7,4005c0 <main+0x5a4>
  4005cc:	ffb60ae3          	beq	a2,s11,4005c0 <main+0x5a4>
  4005d0:	03000713          	li	a4,48
  4005d4:	02e61063          	bne	a2,a4,4005f4 <main+0x5d8>
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  4005d8:	fff6c603          	lbu	a2,-1(a3)
  4005dc:	02066613          	ori	a2,a2,32
  4005e0:	07800713          	li	a4,120
  4005e4:	02e61663          	bne	a2,a4,400610 <main+0x5f4>
    if (!*s) return -1;
  4005e8:	0006c603          	lbu	a2,0(a3)
  4005ec:	02061663          	bnez	a2,400618 <main+0x5fc>
  4005f0:	0840006f          	j	400674 <main+0x658>
  4005f4:	ffe68693          	addi	a3,a3,-2
  4005f8:	02061063          	bnez	a2,400618 <main+0x5fc>
  4005fc:	0780006f          	j	400674 <main+0x658>
  400600:	00c12503          	lw	a0,12(sp)
                printf("usage: sd_read <sector>\n");
  400604:	00000097          	auipc	ra,0x0
  400608:	658080e7          	jalr	1624(ra) # 400c5c <printf>
  40060c:	b55ff06f          	j	400160 <main+0x144>
  400610:	ffe68693          	addi	a3,a3,-2
  400614:	03000613          	li	a2,48
  400618:	00000593          	li	a1,0
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  40061c:	00168693          	addi	a3,a3,1
  400620:	0200006f          	j	400640 <main+0x624>
  400624:	0ff67793          	zext.b	a5,a2
    while (*s) {
  400628:	0006c603          	lbu	a2,0(a3)
  40062c:	00f70733          	add	a4,a4,a5
        v = (v << 4) | d;
  400630:	00459593          	slli	a1,a1,0x4
  400634:	00b765b3          	or	a1,a4,a1
    while (*s) {
  400638:	00168693          	addi	a3,a3,1
  40063c:	02060c63          	beqz	a2,400674 <main+0x658>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400640:	fd060713          	addi	a4,a2,-48
  400644:	0ff77793          	zext.b	a5,a4
  400648:	fd000713          	li	a4,-48
  40064c:	fd67ece3          	bltu	a5,s6,400624 <main+0x608>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  400650:	f9f60713          	addi	a4,a2,-97
  400654:	0ff77793          	zext.b	a5,a4
  400658:	fa900713          	li	a4,-87
  40065c:	00600813          	li	a6,6
  400660:	fd07e2e3          	bltu	a5,a6,400624 <main+0x608>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  400664:	fbf60713          	addi	a4,a2,-65
  400668:	0ff77793          	zext.b	a5,a4
  40066c:	fc900713          	li	a4,-55
  400670:	faf8fae3          	bgeu	a7,a5,400624 <main+0x608>
            call_dump_api(addr, len);
  400674:	00000097          	auipc	ra,0x0
  400678:	568080e7          	jalr	1384(ra) # 400bdc <call_dump_api>
  40067c:	ae5ff06f          	j	400160 <main+0x144>
            exit();
  400680:	00000097          	auipc	ra,0x0
  400684:	190080e7          	jalr	400(ra) # 400810 <exit>

00400688 <parse_hex>:
    while (*s == ' ' || *s == '\t') s++;
  400688:	00250613          	addi	a2,a0,2 # 200002 <$d.11+0x1ff922>
  40068c:	00900693          	li	a3,9
  400690:	02000713          	li	a4,32
  400694:	0080006f          	j	40069c <parse_hex+0x14>
  400698:	00160613          	addi	a2,a2,1
  40069c:	ffe64503          	lbu	a0,-2(a2)
  4006a0:	fed50ce3          	beq	a0,a3,400698 <parse_hex+0x10>
  4006a4:	fee50ae3          	beq	a0,a4,400698 <parse_hex+0x10>
  4006a8:	03000693          	li	a3,48
  4006ac:	02d51063          	bne	a0,a3,4006cc <parse_hex+0x44>
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  4006b0:	fff64503          	lbu	a0,-1(a2)
  4006b4:	02056513          	ori	a0,a0,32
  4006b8:	07800693          	li	a3,120
  4006bc:	02d51063          	bne	a0,a3,4006dc <parse_hex+0x54>
    if (!*s) return -1;
  4006c0:	00064503          	lbu	a0,0(a2)
  4006c4:	02051063          	bnez	a0,4006e4 <parse_hex+0x5c>
  4006c8:	00c0006f          	j	4006d4 <parse_hex+0x4c>
  4006cc:	ffe60613          	addi	a2,a2,-2
  4006d0:	00051a63          	bnez	a0,4006e4 <parse_hex+0x5c>
  4006d4:	fff00513          	li	a0,-1
    }
    *out = v;
    return 0;
}
  4006d8:	00008067          	ret
  4006dc:	ffe60613          	addi	a2,a2,-2
  4006e0:	03000513          	li	a0,48
  4006e4:	00000693          	li	a3,0
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  4006e8:	00160613          	addi	a2,a2,1
  4006ec:	00a00713          	li	a4,10
  4006f0:	00600793          	li	a5,6
  4006f4:	00500813          	li	a6,5
  4006f8:	0200006f          	j	400718 <parse_hex+0x90>
  4006fc:	0ff57293          	zext.b	t0,a0
    while (*s) {
  400700:	00064503          	lbu	a0,0(a2)
  400704:	005888b3          	add	a7,a7,t0
        v = (v << 4) | d;
  400708:	00469693          	slli	a3,a3,0x4
  40070c:	00d8e6b3          	or	a3,a7,a3
    while (*s) {
  400710:	00160613          	addi	a2,a2,1
  400714:	02050a63          	beqz	a0,400748 <parse_hex+0xc0>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  400718:	fd050893          	addi	a7,a0,-48
  40071c:	0ff8f293          	zext.b	t0,a7
  400720:	fd000893          	li	a7,-48
  400724:	fce2ece3          	bltu	t0,a4,4006fc <parse_hex+0x74>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  400728:	f9f50893          	addi	a7,a0,-97
  40072c:	0ff8f293          	zext.b	t0,a7
  400730:	fa900893          	li	a7,-87
  400734:	fcf2e4e3          	bltu	t0,a5,4006fc <parse_hex+0x74>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  400738:	fbf50893          	addi	a7,a0,-65
  40073c:	0ff8f293          	zext.b	t0,a7
  400740:	fc900893          	li	a7,-55
  400744:	fa587ce3          	bgeu	a6,t0,4006fc <parse_hex+0x74>
  400748:	00000513          	li	a0,0
    *out = v;
  40074c:	00d5a023          	sw	a3,0(a1)
}
  400750:	00008067          	ret

00400754 <cmd_primes>:
{
  400754:	fe010113          	addi	sp,sp,-32
  400758:	00112e23          	sw	ra,28(sp)
  40075c:	00812c23          	sw	s0,24(sp)
  400760:	00912a23          	sw	s1,20(sp)
  400764:	01212823          	sw	s2,16(sp)
  400768:	01312623          	sw	s3,12(sp)
  40076c:	00200913          	li	s2,2
  400770:	00050413          	mv	s0,a0
  400774:	00000493          	li	s1,0
    for (unsigned n = 2; n <= max; n++) {
  400778:	07256463          	bltu	a0,s2,4007e0 <cmd_primes+0x8c>
  40077c:	00401537          	lui	a0,0x401
  400780:	33250993          	addi	s3,a0,818 # 401332 <$d.1+0x13>
  400784:	00c0006f          	j	400790 <cmd_primes+0x3c>
  400788:	00190913          	addi	s2,s2,1
  40078c:	05246063          	bltu	s0,s2,4007cc <cmd_primes+0x78>
        if (is_prime(n)) {
  400790:	00090513          	mv	a0,s2
  400794:	00001097          	auipc	ra,0x1
  400798:	8c0080e7          	jalr	-1856(ra) # 401054 <is_prime>
  40079c:	fe0506e3          	beqz	a0,400788 <cmd_primes+0x34>
            printf("%d ", (int)n);
  4007a0:	00098513          	mv	a0,s3
  4007a4:	00090593          	mv	a1,s2
  4007a8:	00000097          	auipc	ra,0x0
  4007ac:	4b4080e7          	jalr	1204(ra) # 400c5c <printf>
            count++;
  4007b0:	00148493          	addi	s1,s1,1
            if ((count % 8) == 0)
  4007b4:	0074f513          	andi	a0,s1,7
  4007b8:	fc0518e3          	bnez	a0,400788 <cmd_primes+0x34>
                putchar('\n');
  4007bc:	00a00513          	li	a0,10
  4007c0:	00000097          	auipc	ra,0x0
  4007c4:	3e8080e7          	jalr	1000(ra) # 400ba8 <putchar>
  4007c8:	fc1ff06f          	j	400788 <cmd_primes+0x34>
    if ((count % 8) != 0)
  4007cc:	0074f513          	andi	a0,s1,7
  4007d0:	00050863          	beqz	a0,4007e0 <cmd_primes+0x8c>
        putchar('\n');
  4007d4:	00a00513          	li	a0,10
  4007d8:	00000097          	auipc	ra,0x0
  4007dc:	3d0080e7          	jalr	976(ra) # 400ba8 <putchar>
    printf("total primes: %d (0..%d)\n", count, (int)max);
  4007e0:	00401537          	lui	a0,0x401
  4007e4:	2e450513          	addi	a0,a0,740 # 4012e4 <__modsi3+0xb0>
  4007e8:	00048593          	mv	a1,s1
  4007ec:	00040613          	mv	a2,s0
  4007f0:	01c12083          	lw	ra,28(sp)
  4007f4:	01812403          	lw	s0,24(sp)
  4007f8:	01412483          	lw	s1,20(sp)
  4007fc:	01012903          	lw	s2,16(sp)
  400800:	00c12983          	lw	s3,12(sp)
  400804:	02010113          	addi	sp,sp,32
  400808:	00000317          	auipc	t1,0x0
  40080c:	45430067          	jr	1108(t1) # 400c5c <printf>

00400810 <exit>:
    __asm__ __volatile__ (
  400810:	00800693          	li	a3,8
  400814:	00000593          	li	a1,0
  400818:	00000613          	li	a2,0
  40081c:	00000513          	li	a0,0
  400820:	00000073          	ecall
    for (;;);
  400824:	0000006f          	j	400824 <exit+0x14>

00400828 <call_sa_api>:
{
  400828:	c8010113          	addi	sp,sp,-896
  40082c:	36112e23          	sw	ra,892(sp)
  400830:	36812c23          	sw	s0,888(sp)
  400834:	36912a23          	sw	s1,884(sp)
  400838:	37212823          	sw	s2,880(sp)
  40083c:	37312623          	sw	s3,876(sp)
  400840:	37412423          	sw	s4,872(sp)
  400844:	37512223          	sw	s5,868(sp)
  400848:	00050413          	mv	s0,a0
    for (uint32_t i = 0; i < matrix_size; i++) {
  40084c:	14050463          	beqz	a0,400994 <call_sa_api+0x16c>
  400850:	00000913          	li	s2,0
  400854:	00000493          	li	s1,0
  400858:	2d410993          	addi	s3,sp,724
  40085c:	24410a13          	addi	s4,sp,580
  400860:	2d410a93          	addi	s5,sp,724
        for (uint32_t j = 0; j < matrix_size; j++) {
  400864:	00c00593          	li	a1,12
  400868:	00048513          	mv	a0,s1
  40086c:	00001097          	auipc	ra,0x1
  400870:	880080e7          	jalr	-1920(ra) # 4010ec <__mulsi3>
  400874:	00a40533          	add	a0,s0,a0
  400878:	00a98533          	add	a0,s3,a0
  40087c:	000a0593          	mv	a1,s4
  400880:	000a8613          	mv	a2,s5
  400884:	00048693          	mv	a3,s1
  400888:	00090713          	mv	a4,s2
            matrix_A[i][j] = (uint8_t)(2*i + 2*j + 2);
  40088c:	00169793          	slli	a5,a3,0x1
  400890:	00278793          	addi	a5,a5,2
  400894:	00f60023          	sb	a5,0(a2)
            matrix_B[i][j] = (uint8_t)(3*i + j + 5);
  400898:	00570793          	addi	a5,a4,5
  40089c:	00f58023          	sb	a5,0(a1)
        for (uint32_t j = 0; j < matrix_size; j++) {
  4008a0:	00170713          	addi	a4,a4,1
  4008a4:	00168693          	addi	a3,a3,1
  4008a8:	00160613          	addi	a2,a2,1
  4008ac:	00158593          	addi	a1,a1,1
  4008b0:	fca61ee3          	bne	a2,a0,40088c <call_sa_api+0x64>
    for (uint32_t i = 0; i < matrix_size; i++) {
  4008b4:	00148493          	addi	s1,s1,1
  4008b8:	00390913          	addi	s2,s2,3
  4008bc:	00ca8a93          	addi	s5,s5,12
  4008c0:	00ca0a13          	addi	s4,s4,12
  4008c4:	fa8490e3          	bne	s1,s0,400864 <call_sa_api+0x3c>
  4008c8:	00600513          	li	a0,6
    matrix_A[2][3] = 6;
  4008cc:	2ea107a3          	sb	a0,751(sp)
  4008d0:	00200513          	li	a0,2
    matrix_B[5][3] = 2;
  4008d4:	28a101a3          	sb	a0,643(sp)
  4008d8:	2d410913          	addi	s2,sp,724
  4008dc:	24410793          	addi	a5,sp,580
  4008e0:	00410813          	addi	a6,sp,4
  4008e4:	00300893          	li	a7,3
    __asm__ __volatile__ (
  4008e8:	00090513          	mv	a0,s2
  4008ec:	00078593          	mv	a1,a5
  4008f0:	00080613          	mv	a2,a6
  4008f4:	00088693          	mv	a3,a7
  4008f8:	00040713          	mv	a4,s0
  4008fc:	00000073          	ecall
  400900:	00050793          	mv	a5,a0
  400904:	04100593          	li	a1,65
    __asm__ __volatile__ (
  400908:	00058513          	mv	a0,a1
  40090c:	00100693          	li	a3,1
  400910:	00000073          	ecall
  400914:	00a00593          	li	a1,10
  400918:	00058513          	mv	a0,a1
  40091c:	00100693          	li	a3,1
  400920:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400924:	18040e63          	beqz	s0,400ac0 <call_sa_api+0x298>
  400928:	00000493          	li	s1,0
  40092c:	02000993          	li	s3,32
  400930:	00a00a13          	li	s4,10
  400934:	2d410a93          	addi	s5,sp,724
        for (uint32_t j = 0; j < matrix_size; j++) {
  400938:	00c00593          	li	a1,12
  40093c:	00048513          	mv	a0,s1
  400940:	00000097          	auipc	ra,0x0
  400944:	7ac080e7          	jalr	1964(ra) # 4010ec <__mulsi3>
  400948:	00a40533          	add	a0,s0,a0
  40094c:	00a905b3          	add	a1,s2,a0
  400950:	000a8613          	mv	a2,s5
            print_int((int)matrix_A[i][j]);
  400954:	00064703          	lbu	a4,0(a2)
    __asm__ __volatile__ (
  400958:	00070513          	mv	a0,a4
  40095c:	00a00693          	li	a3,10
  400960:	00000073          	ecall
    __asm__ __volatile__ (
  400964:	00098513          	mv	a0,s3
  400968:	00100693          	li	a3,1
  40096c:	00000073          	ecall
        for (uint32_t j = 0; j < matrix_size; j++) {
  400970:	00160613          	addi	a2,a2,1
  400974:	feb610e3          	bne	a2,a1,400954 <call_sa_api+0x12c>
    __asm__ __volatile__ (
  400978:	000a0513          	mv	a0,s4
  40097c:	00100693          	li	a3,1
  400980:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400984:	00148493          	addi	s1,s1,1
  400988:	00ca8a93          	addi	s5,s5,12
  40098c:	fa8496e3          	bne	s1,s0,400938 <call_sa_api+0x110>
  400990:	0600006f          	j	4009f0 <call_sa_api+0x1c8>
  400994:	00600513          	li	a0,6
    matrix_A[2][3] = 6;
  400998:	2ea107a3          	sb	a0,751(sp)
  40099c:	00200513          	li	a0,2
    matrix_B[5][3] = 2;
  4009a0:	28a101a3          	sb	a0,643(sp)
  4009a4:	2d410793          	addi	a5,sp,724
  4009a8:	24410813          	addi	a6,sp,580
  4009ac:	00410893          	addi	a7,sp,4
  4009b0:	00300293          	li	t0,3
    __asm__ __volatile__ (
  4009b4:	00078513          	mv	a0,a5
  4009b8:	00080593          	mv	a1,a6
  4009bc:	00088613          	mv	a2,a7
  4009c0:	00028693          	mv	a3,t0
  4009c4:	00040713          	mv	a4,s0
  4009c8:	00000073          	ecall
  4009cc:	00050793          	mv	a5,a0
  4009d0:	04100593          	li	a1,65
    __asm__ __volatile__ (
  4009d4:	00058513          	mv	a0,a1
  4009d8:	00100693          	li	a3,1
  4009dc:	00000073          	ecall
  4009e0:	00a00593          	li	a1,10
  4009e4:	00058513          	mv	a0,a1
  4009e8:	00100693          	li	a3,1
  4009ec:	00000073          	ecall
  4009f0:	00a00593          	li	a1,10
  4009f4:	00058513          	mv	a0,a1
  4009f8:	00100693          	li	a3,1
  4009fc:	00000073          	ecall
  400a00:	04200613          	li	a2,66
  400a04:	00060513          	mv	a0,a2
  400a08:	00100693          	li	a3,1
  400a0c:	00000073          	ecall
  400a10:	00058513          	mv	a0,a1
  400a14:	00100693          	li	a3,1
  400a18:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400a1c:	06040a63          	beqz	s0,400a90 <call_sa_api+0x268>
  400a20:	00000493          	li	s1,0
  400a24:	24410913          	addi	s2,sp,580
  400a28:	02000993          	li	s3,32
  400a2c:	00a00a13          	li	s4,10
  400a30:	24410a93          	addi	s5,sp,580
        for (uint32_t j = 0; j < matrix_size; j++) {
  400a34:	00c00593          	li	a1,12
  400a38:	00048513          	mv	a0,s1
  400a3c:	00000097          	auipc	ra,0x0
  400a40:	6b0080e7          	jalr	1712(ra) # 4010ec <__mulsi3>
  400a44:	00a40533          	add	a0,s0,a0
  400a48:	00a905b3          	add	a1,s2,a0
  400a4c:	000a8613          	mv	a2,s5
            print_int((int)matrix_B[i][j]);
  400a50:	00064703          	lbu	a4,0(a2)
    __asm__ __volatile__ (
  400a54:	00070513          	mv	a0,a4
  400a58:	00a00693          	li	a3,10
  400a5c:	00000073          	ecall
    __asm__ __volatile__ (
  400a60:	00098513          	mv	a0,s3
  400a64:	00100693          	li	a3,1
  400a68:	00000073          	ecall
        for (uint32_t j = 0; j < matrix_size; j++) {
  400a6c:	00160613          	addi	a2,a2,1
  400a70:	feb610e3          	bne	a2,a1,400a50 <call_sa_api+0x228>
    __asm__ __volatile__ (
  400a74:	000a0513          	mv	a0,s4
  400a78:	00100693          	li	a3,1
  400a7c:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400a80:	00148493          	addi	s1,s1,1
  400a84:	00ca8a93          	addi	s5,s5,12
  400a88:	fa8496e3          	bne	s1,s0,400a34 <call_sa_api+0x20c>
  400a8c:	0600006f          	j	400aec <call_sa_api+0x2c4>
  400a90:	00a00593          	li	a1,10
    __asm__ __volatile__ (
  400a94:	00058513          	mv	a0,a1
  400a98:	00100693          	li	a3,1
  400a9c:	00000073          	ecall
  400aa0:	04300613          	li	a2,67
  400aa4:	00060513          	mv	a0,a2
  400aa8:	00100693          	li	a3,1
  400aac:	00000073          	ecall
  400ab0:	00058513          	mv	a0,a1
  400ab4:	00100693          	li	a3,1
  400ab8:	00000073          	ecall
  400abc:	0b80006f          	j	400b74 <call_sa_api+0x34c>
  400ac0:	00a00593          	li	a1,10
  400ac4:	00058513          	mv	a0,a1
  400ac8:	00100693          	li	a3,1
  400acc:	00000073          	ecall
  400ad0:	04200613          	li	a2,66
  400ad4:	00060513          	mv	a0,a2
  400ad8:	00100693          	li	a3,1
  400adc:	00000073          	ecall
  400ae0:	00058513          	mv	a0,a1
  400ae4:	00100693          	li	a3,1
  400ae8:	00000073          	ecall
  400aec:	00a00593          	li	a1,10
  400af0:	00058513          	mv	a0,a1
  400af4:	00100693          	li	a3,1
  400af8:	00000073          	ecall
  400afc:	04300613          	li	a2,67
  400b00:	00060513          	mv	a0,a2
  400b04:	00100693          	li	a3,1
  400b08:	00000073          	ecall
  400b0c:	00058513          	mv	a0,a1
  400b10:	00100693          	li	a3,1
  400b14:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400b18:	04040e63          	beqz	s0,400b74 <call_sa_api+0x34c>
  400b1c:	00000593          	li	a1,0
  400b20:	00410613          	addi	a2,sp,4
  400b24:	02000713          	li	a4,32
  400b28:	00a00793          	li	a5,10
  400b2c:	00060813          	mv	a6,a2
  400b30:	00040893          	mv	a7,s0
            print_int((int)matrix_C[i][j]);
  400b34:	00082283          	lw	t0,0(a6)
    __asm__ __volatile__ (
  400b38:	00028513          	mv	a0,t0
  400b3c:	00a00693          	li	a3,10
  400b40:	00000073          	ecall
    __asm__ __volatile__ (
  400b44:	00070513          	mv	a0,a4
  400b48:	00100693          	li	a3,1
  400b4c:	00000073          	ecall
        for (uint32_t j = 0; j < matrix_size; j++) {
  400b50:	fff88893          	addi	a7,a7,-1
  400b54:	00480813          	addi	a6,a6,4
  400b58:	fc089ee3          	bnez	a7,400b34 <call_sa_api+0x30c>
    __asm__ __volatile__ (
  400b5c:	00078513          	mv	a0,a5
  400b60:	00100693          	li	a3,1
  400b64:	00000073          	ecall
    for (uint32_t i = 0; i < matrix_size; i++) {
  400b68:	00158593          	addi	a1,a1,1
  400b6c:	03060613          	addi	a2,a2,48
  400b70:	fa859ee3          	bne	a1,s0,400b2c <call_sa_api+0x304>
  400b74:	00a00593          	li	a1,10
    __asm__ __volatile__ (
  400b78:	00058513          	mv	a0,a1
  400b7c:	00100693          	li	a3,1
  400b80:	00000073          	ecall
  400b84:	37c12083          	lw	ra,892(sp)
  400b88:	37812403          	lw	s0,888(sp)
  400b8c:	37412483          	lw	s1,884(sp)
  400b90:	37012903          	lw	s2,880(sp)
  400b94:	36c12983          	lw	s3,876(sp)
  400b98:	36812a03          	lw	s4,872(sp)
  400b9c:	36412a83          	lw	s5,868(sp)
}
  400ba0:	38010113          	addi	sp,sp,896
  400ba4:	00008067          	ret

00400ba8 <putchar>:
{
  400ba8:	00050593          	mv	a1,a0
    __asm__ __volatile__ (
  400bac:	00058513          	mv	a0,a1
  400bb0:	00100693          	li	a3,1
  400bb4:	00000073          	ecall
}
  400bb8:	00008067          	ret

00400bbc <print_int>:
{
  400bbc:	00050593          	mv	a1,a0
    __asm__ __volatile__ (
  400bc0:	00058513          	mv	a0,a1
  400bc4:	00a00693          	li	a3,10
  400bc8:	00000073          	ecall
}
  400bcc:	00008067          	ret

00400bd0 <call_sd_api>:
    __asm__ __volatile__(
  400bd0:	00400693          	li	a3,4
  400bd4:	00000073          	ecall
}
  400bd8:	00008067          	ret

00400bdc <call_dump_api>:
    __asm__ __volatile__(
  400bdc:	00500693          	li	a3,5
  400be0:	00000073          	ecall
}
  400be4:	00008067          	ret

00400be8 <strcpy>:
    while (*src)
  400be8:	0005c603          	lbu	a2,0(a1)
  400bec:	00050693          	mv	a3,a0
  400bf0:	02060263          	beqz	a2,400c14 <strcpy+0x2c>
  400bf4:	00158593          	addi	a1,a1,1
  400bf8:	00050713          	mv	a4,a0
        *d++ = *src++;
  400bfc:	00c70023          	sb	a2,0(a4)
    while (*src)
  400c00:	0005c603          	lbu	a2,0(a1)
        *d++ = *src++;
  400c04:	00170693          	addi	a3,a4,1
    while (*src)
  400c08:	00158593          	addi	a1,a1,1
  400c0c:	00068713          	mv	a4,a3
  400c10:	fe0616e3          	bnez	a2,400bfc <strcpy+0x14>
    *d = '\0';
  400c14:	00068023          	sb	zero,0(a3)
    return dst;
  400c18:	00008067          	ret

00400c1c <strcmp>:
    while (*s1 && *s2) {
  400c1c:	00054603          	lbu	a2,0(a0)
  400c20:	02060663          	beqz	a2,400c4c <strcmp+0x30>
  400c24:	00150513          	addi	a0,a0,1
  400c28:	0005c683          	lbu	a3,0(a1)
  400c2c:	0ff67713          	zext.b	a4,a2
  400c30:	00d71a63          	bne	a4,a3,400c44 <strcmp+0x28>
  400c34:	00054603          	lbu	a2,0(a0)
        s2++;
  400c38:	00158593          	addi	a1,a1,1
    while (*s1 && *s2) {
  400c3c:	00150513          	addi	a0,a0,1
  400c40:	fe0614e3          	bnez	a2,400c28 <strcmp+0xc>
    return *(unsigned char *)s1 - *(unsigned char *)s2;
  400c44:	0ff67513          	zext.b	a0,a2
  400c48:	0080006f          	j	400c50 <strcmp+0x34>
  400c4c:	00000513          	li	a0,0
  400c50:	0005c583          	lbu	a1,0(a1)
  400c54:	40b50533          	sub	a0,a0,a1
  400c58:	00008067          	ret

00400c5c <printf>:
void printf(const char *fmt, ...) {
  400c5c:	f9010113          	addi	sp,sp,-112
  400c60:	04112623          	sw	ra,76(sp)
  400c64:	04812423          	sw	s0,72(sp)
  400c68:	04912223          	sw	s1,68(sp)
  400c6c:	05212023          	sw	s2,64(sp)
  400c70:	03312e23          	sw	s3,60(sp)
  400c74:	03412c23          	sw	s4,56(sp)
  400c78:	03512a23          	sw	s5,52(sp)
  400c7c:	03612823          	sw	s6,48(sp)
  400c80:	03712623          	sw	s7,44(sp)
  400c84:	03812423          	sw	s8,40(sp)
  400c88:	03912223          	sw	s9,36(sp)
  400c8c:	03a12023          	sw	s10,32(sp)
  400c90:	01b12e23          	sw	s11,28(sp)
  400c94:	00050a93          	mv	s5,a0
  400c98:	07112623          	sw	a7,108(sp)
  400c9c:	07012423          	sw	a6,104(sp)
  400ca0:	06f12223          	sw	a5,100(sp)
  400ca4:	06e12023          	sw	a4,96(sp)
  400ca8:	04d12e23          	sw	a3,92(sp)
  400cac:	04c12c23          	sw	a2,88(sp)
  400cb0:	04b12a23          	sw	a1,84(sp)
  400cb4:	05410513          	addi	a0,sp,84
    va_start(vargs, fmt);
  400cb8:	00a12c23          	sw	a0,24(sp)
  400cbc:	02500913          	li	s2,37
  400cc0:	07200993          	li	s3,114
  400cc4:	06400713          	li	a4,100
  400cc8:	00d10b13          	addi	s6,sp,13
  400ccc:	00900b93          	li	s7,9
  400cd0:	00100c13          	li	s8,1
  400cd4:	07300d13          	li	s10,115
  400cd8:	07800d93          	li	s11,120
  400cdc:	00401537          	lui	a0,0x401
  400ce0:	33650c93          	addi	s9,a0,822 # 401336 <$d.2>
  400ce4:	00c0006f          	j	400cf0 <printf+0x94>
            switch (*fmt) {
  400ce8:	22050863          	beqz	a0,400f18 <printf+0x2bc>
        fmt++;
  400cec:	001a8a93          	addi	s5,s5,1
    while (*fmt) {
  400cf0:	000ac583          	lbu	a1,0(s5)
  400cf4:	01258e63          	beq	a1,s2,400d10 <printf+0xb4>
  400cf8:	22058863          	beqz	a1,400f28 <printf+0x2cc>
    __asm__ __volatile__ (
  400cfc:	00058513          	mv	a0,a1
  400d00:	00100693          	li	a3,1
  400d04:	00000073          	ecall
        fmt++;
  400d08:	001a8a93          	addi	s5,s5,1
  400d0c:	fe5ff06f          	j	400cf0 <printf+0x94>
            switch (*fmt) {
  400d10:	001ac503          	lbu	a0,1(s5)
            fmt++;
  400d14:	001a8a93          	addi	s5,s5,1
            switch (*fmt) {
  400d18:	02a9ce63          	blt	s3,a0,400d54 <printf+0xf8>
  400d1c:	13250863          	beq	a0,s2,400e4c <printf+0x1f0>
  400d20:	fce514e3          	bne	a0,a4,400ce8 <printf+0x8c>
                    int value = va_arg(vargs, int);
  400d24:	01812503          	lw	a0,24(sp)
  400d28:	00450593          	addi	a1,a0,4
  400d2c:	00b12c23          	sw	a1,24(sp)
  400d30:	00052403          	lw	s0,0(a0)
                    if (value < 0) {
  400d34:	16044263          	bltz	s0,400e98 <printf+0x23c>
                    if (u == 0) {
  400d38:	16041a63          	bnez	s0,400eac <printf+0x250>
    __asm__ __volatile__ (
  400d3c:	03000593          	li	a1,48
  400d40:	00058513          	mv	a0,a1
  400d44:	00100693          	li	a3,1
  400d48:	00000073          	ecall
        fmt++;
  400d4c:	001a8a93          	addi	s5,s5,1
  400d50:	fa1ff06f          	j	400cf0 <printf+0x94>
            switch (*fmt) {
  400d54:	11a50663          	beq	a0,s10,400e60 <printf+0x204>
  400d58:	f9b51ae3          	bne	a0,s11,400cec <printf+0x90>
                    unsigned value = va_arg(vargs, unsigned);
  400d5c:	01812503          	lw	a0,24(sp)
  400d60:	00450593          	addi	a1,a0,4
  400d64:	00b12c23          	sw	a1,24(sp)
  400d68:	00052583          	lw	a1,0(a0)
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400d6c:	01c5d513          	srli	a0,a1,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400d70:	00ac8533          	add	a0,s9,a0
  400d74:	00054603          	lbu	a2,0(a0)
    __asm__ __volatile__ (
  400d78:	00060513          	mv	a0,a2
  400d7c:	00100693          	li	a3,1
  400d80:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400d84:	00459513          	slli	a0,a1,0x4
  400d88:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400d8c:	00ac8533          	add	a0,s9,a0
  400d90:	00054603          	lbu	a2,0(a0)
    __asm__ __volatile__ (
  400d94:	00060513          	mv	a0,a2
  400d98:	00100693          	li	a3,1
  400d9c:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400da0:	00859513          	slli	a0,a1,0x8
  400da4:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400da8:	00ac8533          	add	a0,s9,a0
  400dac:	00054603          	lbu	a2,0(a0)
    __asm__ __volatile__ (
  400db0:	00060513          	mv	a0,a2
  400db4:	00100693          	li	a3,1
  400db8:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400dbc:	00c59513          	slli	a0,a1,0xc
  400dc0:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400dc4:	00ac8533          	add	a0,s9,a0
  400dc8:	00054603          	lbu	a2,0(a0)
    __asm__ __volatile__ (
  400dcc:	00060513          	mv	a0,a2
  400dd0:	00100693          	li	a3,1
  400dd4:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400dd8:	01059513          	slli	a0,a1,0x10
  400ddc:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400de0:	00ac8533          	add	a0,s9,a0
  400de4:	00054603          	lbu	a2,0(a0)
    __asm__ __volatile__ (
  400de8:	00060513          	mv	a0,a2
  400dec:	00100693          	li	a3,1
  400df0:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400df4:	01459513          	slli	a0,a1,0x14
  400df8:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400dfc:	00ac8533          	add	a0,s9,a0
  400e00:	00054603          	lbu	a2,0(a0)
    __asm__ __volatile__ (
  400e04:	00060513          	mv	a0,a2
  400e08:	00100693          	li	a3,1
  400e0c:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400e10:	01859513          	slli	a0,a1,0x18
  400e14:	01c55513          	srli	a0,a0,0x1c
                        putchar("0123456789abcdef"[nibble]);
  400e18:	00ac8533          	add	a0,s9,a0
  400e1c:	00054603          	lbu	a2,0(a0)
    __asm__ __volatile__ (
  400e20:	00060513          	mv	a0,a2
  400e24:	00100693          	li	a3,1
  400e28:	00000073          	ecall
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  400e2c:	00f5f593          	andi	a1,a1,15
                        putchar("0123456789abcdef"[nibble]);
  400e30:	00bc85b3          	add	a1,s9,a1
  400e34:	0005c583          	lbu	a1,0(a1)
    __asm__ __volatile__ (
  400e38:	00058513          	mv	a0,a1
  400e3c:	00100693          	li	a3,1
  400e40:	00000073          	ecall
        fmt++;
  400e44:	001a8a93          	addi	s5,s5,1
  400e48:	ea9ff06f          	j	400cf0 <printf+0x94>
    __asm__ __volatile__ (
  400e4c:	00090513          	mv	a0,s2
  400e50:	00100693          	li	a3,1
  400e54:	00000073          	ecall
        fmt++;
  400e58:	001a8a93          	addi	s5,s5,1
  400e5c:	e95ff06f          	j	400cf0 <printf+0x94>
                    const char *s = va_arg(vargs, const char *);
  400e60:	01812503          	lw	a0,24(sp)
  400e64:	00450593          	addi	a1,a0,4
  400e68:	00b12c23          	sw	a1,24(sp)
  400e6c:	00052603          	lw	a2,0(a0)
                    while (*s) {
  400e70:	00064583          	lbu	a1,0(a2)
  400e74:	e6058ce3          	beqz	a1,400cec <printf+0x90>
  400e78:	00160613          	addi	a2,a2,1
    __asm__ __volatile__ (
  400e7c:	00058513          	mv	a0,a1
  400e80:	00100693          	li	a3,1
  400e84:	00000073          	ecall
                    while (*s) {
  400e88:	00064583          	lbu	a1,0(a2)
  400e8c:	00160613          	addi	a2,a2,1
  400e90:	fe0596e3          	bnez	a1,400e7c <printf+0x220>
  400e94:	e59ff06f          	j	400cec <printf+0x90>
    __asm__ __volatile__ (
  400e98:	02d00593          	li	a1,45
  400e9c:	00058513          	mv	a0,a1
  400ea0:	00100693          	li	a3,1
  400ea4:	00000073          	ecall
                        u = (unsigned int)(-(value + 1)) + 1;
  400ea8:	40800433          	neg	s0,s0
  400eac:	00000513          	li	a0,0
  400eb0:	00040493          	mv	s1,s0
  400eb4:	00050a13          	mv	s4,a0
                        u /= 10;
  400eb8:	00a00593          	li	a1,10
  400ebc:	00040513          	mv	a0,s0
  400ec0:	00000097          	auipc	ra,0x0
  400ec4:	258080e7          	jalr	600(ra) # 401118 <__udivsi3>
  400ec8:	00050413          	mv	s0,a0
  400ecc:	00a00593          	li	a1,10
  400ed0:	00000097          	auipc	ra,0x0
  400ed4:	21c080e7          	jalr	540(ra) # 4010ec <__mulsi3>
  400ed8:	40a48533          	sub	a0,s1,a0
                        buf[i++] = '0' + (u % 10);
  400edc:	03056593          	ori	a1,a0,48
  400ee0:	001a0513          	addi	a0,s4,1
  400ee4:	014b0633          	add	a2,s6,s4
  400ee8:	00b60023          	sb	a1,0(a2)
                    while (u > 0) {
  400eec:	fc9be2e3          	bltu	s7,s1,400eb0 <printf+0x254>
  400ef0:	06400713          	li	a4,100
                        putchar(buf[--i]);
  400ef4:	014b0533          	add	a0,s6,s4
  400ef8:	00054583          	lbu	a1,0(a0)
    __asm__ __volatile__ (
  400efc:	00058513          	mv	a0,a1
  400f00:	00100693          	li	a3,1
  400f04:	00000073          	ecall
                    while (i > 0) {
  400f08:	001a0513          	addi	a0,s4,1
  400f0c:	fffa0a13          	addi	s4,s4,-1
  400f10:	feac42e3          	blt	s8,a0,400ef4 <printf+0x298>
  400f14:	dd9ff06f          	j	400cec <printf+0x90>
  400f18:	02500593          	li	a1,37
    __asm__ __volatile__ (
  400f1c:	00058513          	mv	a0,a1
  400f20:	00100693          	li	a3,1
  400f24:	00000073          	ecall
  400f28:	04c12083          	lw	ra,76(sp)
  400f2c:	04812403          	lw	s0,72(sp)
  400f30:	04412483          	lw	s1,68(sp)
  400f34:	04012903          	lw	s2,64(sp)
  400f38:	03c12983          	lw	s3,60(sp)
  400f3c:	03812a03          	lw	s4,56(sp)
  400f40:	03412a83          	lw	s5,52(sp)
  400f44:	03012b03          	lw	s6,48(sp)
  400f48:	02c12b83          	lw	s7,44(sp)
  400f4c:	02812c03          	lw	s8,40(sp)
  400f50:	02412c83          	lw	s9,36(sp)
  400f54:	02012d03          	lw	s10,32(sp)
  400f58:	01c12d83          	lw	s11,28(sp)
}
  400f5c:	07010113          	addi	sp,sp,112
  400f60:	00008067          	ret

00400f64 <parse_u32>:
unsigned parse_u32(const char *s) {
  400f64:	fe010113          	addi	sp,sp,-32
  400f68:	00112e23          	sw	ra,28(sp)
  400f6c:	00812c23          	sw	s0,24(sp)
  400f70:	00912a23          	sw	s1,20(sp)
  400f74:	01212823          	sw	s2,16(sp)
  400f78:	01312623          	sw	s3,12(sp)
  400f7c:	01412423          	sw	s4,8(sp)
  400f80:	01512223          	sw	s5,4(sp)
  400f84:	00050593          	mv	a1,a0
    if ((s[0] == '0') && (s[1] == 'x' || s[1] == 'X')) {
  400f88:	00054503          	lbu	a0,0(a0)
  400f8c:	03000613          	li	a2,48
  400f90:	00a00413          	li	s0,10
  400f94:	02c51063          	bne	a0,a2,400fb4 <parse_u32+0x50>
  400f98:	0015c503          	lbu	a0,1(a1)
  400f9c:	02056513          	ori	a0,a0,32
  400fa0:	07800693          	li	a3,120
  400fa4:	00d51e63          	bne	a0,a3,400fc0 <parse_u32+0x5c>
    while (*s) {
  400fa8:	0025c503          	lbu	a0,2(a1)
        s += 2;
  400fac:	00258593          	addi	a1,a1,2
  400fb0:	01000413          	li	s0,16
  400fb4:	00050613          	mv	a2,a0
    while (*s) {
  400fb8:	00051663          	bnez	a0,400fc4 <parse_u32+0x60>
  400fbc:	0740006f          	j	401030 <parse_u32+0xcc>
  400fc0:	00a00413          	li	s0,10
  400fc4:	00000513          	li	a0,0
        if (c >= '0' && c <= '9')       d = (unsigned)(c - '0');
  400fc8:	00158493          	addi	s1,a1,1
  400fcc:	00a00913          	li	s2,10
  400fd0:	00600993          	li	s3,6
  400fd4:	00500a13          	li	s4,5
  400fd8:	fd060593          	addi	a1,a2,-48
  400fdc:	0ff5f693          	zext.b	a3,a1
  400fe0:	fd000593          	li	a1,-48
  400fe4:	0326e263          	bltu	a3,s2,401008 <parse_u32+0xa4>
        else if (c >= 'a' && c <= 'f')  d = 10u + (unsigned)(c - 'a');
  400fe8:	f9f60593          	addi	a1,a2,-97
  400fec:	0ff5f693          	zext.b	a3,a1
  400ff0:	fa900593          	li	a1,-87
  400ff4:	0136ea63          	bltu	a3,s3,401008 <parse_u32+0xa4>
        else if (c >= 'A' && c <= 'F')  d = 10u + (unsigned)(c - 'A');
  400ff8:	fbf60593          	addi	a1,a2,-65
  400ffc:	0ff5f693          	zext.b	a3,a1
  401000:	fc900593          	li	a1,-55
  401004:	02da6663          	bltu	s4,a3,401030 <parse_u32+0xcc>
  401008:	0ff67a93          	zext.b	s5,a2
  40100c:	01558ab3          	add	s5,a1,s5
        if (d >= base) break;
  401010:	028af063          	bgeu	s5,s0,401030 <parse_u32+0xcc>
        v = v * base + d;
  401014:	00040593          	mv	a1,s0
  401018:	00000097          	auipc	ra,0x0
  40101c:	0d4080e7          	jalr	212(ra) # 4010ec <__mulsi3>
    while (*s) {
  401020:	0004c603          	lbu	a2,0(s1)
        v = v * base + d;
  401024:	00aa8533          	add	a0,s5,a0
    while (*s) {
  401028:	00148493          	addi	s1,s1,1
  40102c:	fa0616e3          	bnez	a2,400fd8 <parse_u32+0x74>
  401030:	01c12083          	lw	ra,28(sp)
  401034:	01812403          	lw	s0,24(sp)
  401038:	01412483          	lw	s1,20(sp)
  40103c:	01012903          	lw	s2,16(sp)
  401040:	00c12983          	lw	s3,12(sp)
  401044:	00812a03          	lw	s4,8(sp)
  401048:	00412a83          	lw	s5,4(sp)
    return v;
  40104c:	02010113          	addi	sp,sp,32
  401050:	00008067          	ret

00401054 <is_prime>:
{
  401054:	00200593          	li	a1,2
    if (n < 2) return false;
  401058:	00b57663          	bgeu	a0,a1,401064 <is_prime+0x10>
  40105c:	00000513          	li	a0,0
}
  401060:	00008067          	ret
  401064:	ff010113          	addi	sp,sp,-16
  401068:	00112623          	sw	ra,12(sp)
  40106c:	00812423          	sw	s0,8(sp)
  401070:	00912223          	sw	s1,4(sp)
  401074:	01212023          	sw	s2,0(sp)
  401078:	00050413          	mv	s0,a0
  40107c:	00400593          	li	a1,4
  401080:	00100513          	li	a0,1
    for (unsigned i = 2; i * i <= n; i++) {
  401084:	02b46e63          	bltu	s0,a1,4010c0 <is_prime+0x6c>
  401088:	00200493          	li	s1,2
        if (n % i == 0)
  40108c:	00040513          	mv	a0,s0
  401090:	00048593          	mv	a1,s1
  401094:	00000097          	auipc	ra,0x0
  401098:	0e0080e7          	jalr	224(ra) # 401174 <__umodsi3>
  40109c:	00050913          	mv	s2,a0
  4010a0:	00050e63          	beqz	a0,4010bc <is_prime+0x68>
    for (unsigned i = 2; i * i <= n; i++) {
  4010a4:	00148493          	addi	s1,s1,1
  4010a8:	00048513          	mv	a0,s1
  4010ac:	00048593          	mv	a1,s1
  4010b0:	00000097          	auipc	ra,0x0
  4010b4:	03c080e7          	jalr	60(ra) # 4010ec <__mulsi3>
  4010b8:	fca47ae3          	bgeu	s0,a0,40108c <is_prime+0x38>
        if (n % i == 0)
  4010bc:	01203533          	snez	a0,s2
  4010c0:	00c12083          	lw	ra,12(sp)
  4010c4:	00812403          	lw	s0,8(sp)
  4010c8:	00412483          	lw	s1,4(sp)
  4010cc:	00012903          	lw	s2,0(sp)
  4010d0:	01010113          	addi	sp,sp,16
}
  4010d4:	00008067          	ret

004010d8 <getchar>:
    __asm__ __volatile__ (
  4010d8:	00200693          	li	a3,2
  4010dc:	00000073          	ecall
  4010e0:	00050593          	mv	a1,a0
    return ch;
  4010e4:	00058513          	mv	a0,a1
  4010e8:	00008067          	ret

004010ec <__mulsi3>:
  4010ec:	00000613          	li	a2,0
  4010f0:	02058063          	beqz	a1,401110 <__mulsi3+0x24>
  4010f4:	01f59693          	slli	a3,a1,0x1f
  4010f8:	41f6d693          	srai	a3,a3,0x1f
  4010fc:	00a6f6b3          	and	a3,a3,a0
  401100:	00c68633          	add	a2,a3,a2
  401104:	0015d593          	srli	a1,a1,0x1
  401108:	00151513          	slli	a0,a0,0x1
  40110c:	fe0594e3          	bnez	a1,4010f4 <__mulsi3+0x8>
  401110:	00060513          	mv	a0,a2
  401114:	00008067          	ret

00401118 <__udivsi3>:
  401118:	04058a63          	beqz	a1,40116c <__udivsi3+0x54>
  40111c:	00000813          	li	a6,0
  401120:	00000613          	li	a2,0
  401124:	01f00693          	li	a3,31
  401128:	00100713          	li	a4,1
  40112c:	fff00793          	li	a5,-1
  401130:	00181813          	slli	a6,a6,0x1
  401134:	00d558b3          	srl	a7,a0,a3
  401138:	0018f893          	andi	a7,a7,1
  40113c:	0108e833          	or	a6,a7,a6
  401140:	00b838b3          	sltu	a7,a6,a1
  401144:	00d712b3          	sll	t0,a4,a3
  401148:	fff88893          	addi	a7,a7,-1
  40114c:	0058f2b3          	and	t0,a7,t0
  401150:	00c2e633          	or	a2,t0,a2
  401154:	00b8f8b3          	and	a7,a7,a1
  401158:	fff68693          	addi	a3,a3,-1
  40115c:	41180833          	sub	a6,a6,a7
  401160:	fcf698e3          	bne	a3,a5,401130 <__udivsi3+0x18>
  401164:	00060513          	mv	a0,a2
  401168:	00008067          	ret
  40116c:	00000513          	li	a0,0
  401170:	00008067          	ret

00401174 <__umodsi3>:
  401174:	00000613          	li	a2,0
  401178:	02058a63          	beqz	a1,4011ac <__umodsi3+0x38>
  40117c:	01f00693          	li	a3,31
  401180:	fff00713          	li	a4,-1
  401184:	00161613          	slli	a2,a2,0x1
  401188:	00d557b3          	srl	a5,a0,a3
  40118c:	0017f793          	andi	a5,a5,1
  401190:	00c7e633          	or	a2,a5,a2
  401194:	00b637b3          	sltu	a5,a2,a1
  401198:	fff78793          	addi	a5,a5,-1
  40119c:	00b7f7b3          	and	a5,a5,a1
  4011a0:	fff68693          	addi	a3,a3,-1
  4011a4:	40f60633          	sub	a2,a2,a5
  4011a8:	fce69ee3          	bne	a3,a4,401184 <__umodsi3+0x10>
  4011ac:	00060513          	mv	a0,a2
  4011b0:	00008067          	ret

004011b4 <__divsi3>:
  4011b4:	06058c63          	beqz	a1,40122c <__divsi3+0x78>
  4011b8:	00000293          	li	t0,0
  4011bc:	00000613          	li	a2,0
  4011c0:	41f55693          	srai	a3,a0,0x1f
  4011c4:	00d54733          	xor	a4,a0,a3
  4011c8:	40d706b3          	sub	a3,a4,a3
  4011cc:	41f5d713          	srai	a4,a1,0x1f
  4011d0:	00e5c7b3          	xor	a5,a1,a4
  4011d4:	40e78733          	sub	a4,a5,a4
  4011d8:	01f00793          	li	a5,31
  4011dc:	00100813          	li	a6,1
  4011e0:	fff00893          	li	a7,-1
  4011e4:	00129293          	slli	t0,t0,0x1
  4011e8:	00f6d333          	srl	t1,a3,a5
  4011ec:	00137313          	andi	t1,t1,1
  4011f0:	005362b3          	or	t0,t1,t0
  4011f4:	00e2b333          	sltu	t1,t0,a4
  4011f8:	00f813b3          	sll	t2,a6,a5
  4011fc:	fff30313          	addi	t1,t1,-1
  401200:	007373b3          	and	t2,t1,t2
  401204:	00c3e633          	or	a2,t2,a2
  401208:	00e37333          	and	t1,t1,a4
  40120c:	fff78793          	addi	a5,a5,-1
  401210:	406282b3          	sub	t0,t0,t1
  401214:	fd1798e3          	bne	a5,a7,4011e4 <__divsi3+0x30>
  401218:	00a5c533          	xor	a0,a1,a0
  40121c:	00055463          	bgez	a0,401224 <__divsi3+0x70>
  401220:	40c00633          	neg	a2,a2
  401224:	00060513          	mv	a0,a2
  401228:	00008067          	ret
  40122c:	00000513          	li	a0,0
  401230:	00008067          	ret

00401234 <__modsi3>:
  401234:	00000613          	li	a2,0
  401238:	04058a63          	beqz	a1,40128c <__modsi3+0x58>
  40123c:	41f55693          	srai	a3,a0,0x1f
  401240:	00d54733          	xor	a4,a0,a3
  401244:	40d706b3          	sub	a3,a4,a3
  401248:	41f5d713          	srai	a4,a1,0x1f
  40124c:	00e5c5b3          	xor	a1,a1,a4
  401250:	40e585b3          	sub	a1,a1,a4
  401254:	01f00713          	li	a4,31
  401258:	fff00793          	li	a5,-1
  40125c:	00161613          	slli	a2,a2,0x1
  401260:	00e6d833          	srl	a6,a3,a4
  401264:	00187813          	andi	a6,a6,1
  401268:	00c86633          	or	a2,a6,a2
  40126c:	00b63833          	sltu	a6,a2,a1
  401270:	fff80813          	addi	a6,a6,-1
  401274:	00b87833          	and	a6,a6,a1
  401278:	fff70713          	addi	a4,a4,-1
  40127c:	41060633          	sub	a2,a2,a6
  401280:	fcf71ee3          	bne	a4,a5,40125c <__modsi3+0x28>
  401284:	00055463          	bgez	a0,40128c <__modsi3+0x58>
  401288:	40c00633          	neg	a2,a2
  40128c:	00060513          	mv	a0,a2
  401290:	00008067          	ret

セクション .rodata の逆アセンブル:

00401294 <$d.1-0x8b>:
  401294:	616d                	.insn	2, 0x616d
  401296:	7274                	.insn	2, 0x7274
  401298:	7869                	.insn	2, 0x7869
  40129a:	7320                	.insn	2, 0x7320
  40129c:	7a69                	.insn	2, 0x7a69
  40129e:	2065                	.insn	2, 0x2065
  4012a0:	3d21                	.insn	2, 0x3d21
  4012a2:	3120                	.insn	2, 0x3120
  4012a4:	0a32                	.insn	2, 0x0a32
  4012a6:	7300                	.insn	2, 0x7300
  4012a8:	5f64                	.insn	2, 0x5f64
  4012aa:	6572                	.insn	2, 0x6572
  4012ac:	6461                	.insn	2, 0x6461
  4012ae:	4800                	.insn	2, 0x4800
  4012b0:	6c65                	.insn	2, 0x6c65
  4012b2:	6f6c                	.insn	2, 0x6f6c
  4012b4:	7720                	.insn	2, 0x7720
  4012b6:	646c726f          	jal	tp,4c88fc <__user_stack_top+0xa656c>
  4012ba:	6620                	.insn	2, 0x6620
  4012bc:	6f72                	.insn	2, 0x6f72
  4012be:	206d                	.insn	2, 0x206d
  4012c0:	6c656873          	csrrsi	a6,0x6c6,10
  4012c4:	216c                	.insn	2, 0x216c
  4012c6:	000a                	.insn	2, 0x000a
  4012c8:	7270                	.insn	2, 0x7270
  4012ca:	6d69                	.insn	2, 0x6d69
  4012cc:	7365                	.insn	2, 0x7365
  4012ce:	7500                	.insn	2, 0x7500
  4012d0:	6b6e                	.insn	2, 0x6b6e
  4012d2:	6f6e                	.insn	2, 0x6f6e
  4012d4:	63206e77          	.insn	4, 0x63206e77
  4012d8:	616d6d6f          	jal	s10,4d78ee <__user_stack_top+0xb555e>
  4012dc:	646e                	.insn	2, 0x646e
  4012de:	203a                	.insn	2, 0x203a
  4012e0:	7325                	.insn	2, 0x7325
  4012e2:	000a                	.insn	2, 0x000a
  4012e4:	6f74                	.insn	2, 0x6f74
  4012e6:	6174                	.insn	2, 0x6174
  4012e8:	206c                	.insn	2, 0x206c
  4012ea:	7270                	.insn	2, 0x7270
  4012ec:	6d69                	.insn	2, 0x6d69
  4012ee:	7365                	.insn	2, 0x7365
  4012f0:	203a                	.insn	2, 0x203a
  4012f2:	6425                	.insn	2, 0x6425
  4012f4:	2820                	.insn	2, 0x2820
  4012f6:	2e30                	.insn	2, 0x2e30
  4012f8:	252e                	.insn	2, 0x252e
  4012fa:	2964                	.insn	2, 0x2964
  4012fc:	000a                	.insn	2, 0x000a
  4012fe:	735f6173          	csrrsi	sp,mhpmevent21h,30
  401302:	6174                	.insn	2, 0x6174
  401304:	7472                	.insn	2, 0x7472
  401306:	6800                	.insn	2, 0x6800
  401308:	6c65                	.insn	2, 0x6c65
  40130a:	6f6c                	.insn	2, 0x6f6c
  40130c:	6300                	.insn	2, 0x6300
  40130e:	616d6d6f          	jal	s10,4d7924 <__user_stack_top+0xb5594>
  401312:	646e                	.insn	2, 0x646e
  401314:	000a3a73          	csrrc	s4,0x0,s4
  401318:	6568                	.insn	2, 0x6568
  40131a:	706c                	.insn	2, 0x706c
  40131c:	7100                	.insn	2, 0x7100
	...

0040131f <$d.1>:
  40131f:	6c656873          	csrrsi	a6,0x6c6,10
  401323:	206c                	.insn	2, 0x206c
  401325:	72617473          	csrrci	s0,mhpmevent6h,2
  401329:	2e74                	.insn	2, 0x2e74
  40132b:	000a                	.insn	2, 0x000a
  40132d:	7564                	.insn	2, 0x7564
  40132f:	706d                	.insn	2, 0x706d
  401331:	2500                	.insn	2, 0x2500
  401333:	2064                	.insn	2, 0x2064
	...

00401336 <$d.2>:
  401336:	3130                	.insn	2, 0x3130
  401338:	3332                	.insn	2, 0x3332
  40133a:	3534                	.insn	2, 0x3534
  40133c:	3736                	.insn	2, 0x3736
  40133e:	3938                	.insn	2, 0x3938
  401340:	6261                	.insn	2, 0x6261
  401342:	66656463          	bltu	a0,t1,4019aa <__user_stack_bottom+0x61a>
  401346:	7500                	.insn	2, 0x7500
  401348:	65676173          	csrrsi	sp,hviprio1h,14
  40134c:	203a                	.insn	2, 0x203a
  40134e:	725f6473          	csrrsi	s0,mhpmevent5h,30
  401352:	6165                	.insn	2, 0x6165
  401354:	2064                	.insn	2, 0x2064
  401356:	733c                	.insn	2, 0x733c
  401358:	6365                	.insn	2, 0x6365
  40135a:	6f74                	.insn	2, 0x6f74
  40135c:	3e72                	.insn	2, 0x3e72
  40135e:	000a                	.insn	2, 0x000a
  401360:	616d                	.insn	2, 0x616d
  401362:	2078                	.insn	2, 0x2078
  401364:	6f74                	.insn	2, 0x6f74
  401366:	616c206f          	j	4c397c <__user_stack_top+0xa15ec>
  40136a:	6772                	.insn	2, 0x6772
  40136c:	2065                	.insn	2, 0x2065
  40136e:	3c28                	.insn	2, 0x3c28
  401370:	313d                	.insn	2, 0x313d
  401372:	3030                	.insn	2, 0x3030
  401374:	3030                	.insn	2, 0x3030
  401376:	2930                	.insn	2, 0x2930
  401378:	000a                	.insn	2, 0x000a
  40137a:	7571                	.insn	2, 0x7571
  40137c:	7469                	.insn	2, 0x7469
  40137e:	6500                	.insn	2, 0x6500
  401380:	6978                	.insn	2, 0x6978
  401382:	0074                	.insn	2, 0x0074

セクション .debug_loc の逆アセンブル:

00000000 <$d.2>:
   0:	0134                	.insn	2, 0x0134
   2:	0000                	.insn	2, 0x0000
   4:	0144                	.insn	2, 0x0144
   6:	0000                	.insn	2, 0x0000
   8:	0001                	.insn	2, 0x0001
   a:	b059                	.insn	2, 0xb059
   c:	0002                	.insn	2, 0x0002
   e:	cc00                	.insn	2, 0xcc00
  10:	0002                	.insn	2, 0x0002
  12:	0300                	.insn	2, 0x0300
  14:	1100                	.insn	2, 0x1100
  16:	9f00                	.insn	2, 0x9f00
  18:	02d4                	.insn	2, 0x02d4
  1a:	0000                	.insn	2, 0x0000
  1c:	02d8                	.insn	2, 0x02d8
  1e:	0000                	.insn	2, 0x0000
  20:	0001                	.insn	2, 0x0001
  22:	d865                	.insn	2, 0xd865
  24:	0002                	.insn	2, 0x0002
  26:	6c00                	.insn	2, 0x6c00
  28:	0006                	.insn	2, 0x0006
  2a:	0100                	.insn	2, 0x0100
  2c:	5900                	.insn	2, 0x5900
	...
  36:	0210                	.insn	2, 0x0210
  38:	0000                	.insn	2, 0x0000
  3a:	0218                	.insn	2, 0x0218
  3c:	0000                	.insn	2, 0x0000
  3e:	00110003          	lb	zero,1(sp)
  42:	189f 0002 cc00      	.insn	6, 0xcc000002189f
  48:	0002                	.insn	2, 0x0002
  4a:	0100                	.insn	2, 0x0100
  4c:	5900                	.insn	2, 0x5900
	...
  56:	0218                	.insn	2, 0x0218
  58:	0000                	.insn	2, 0x0000
  5a:	0220                	.insn	2, 0x0220
  5c:	0000                	.insn	2, 0x0000
  5e:	0001                	.insn	2, 0x0001
  60:	285a                	.insn	2, 0x285a
  62:	0002                	.insn	2, 0x0002
  64:	6c00                	.insn	2, 0x6c00
  66:	0002                	.insn	2, 0x0002
  68:	0100                	.insn	2, 0x0100
  6a:	5a00                	.insn	2, 0x5a00
  6c:	0294                	.insn	2, 0x0294
  6e:	0000                	.insn	2, 0x0000
  70:	0298                	.insn	2, 0x0298
  72:	0000                	.insn	2, 0x0000
  74:	0001                	.insn	2, 0x0001
  76:	005a                	.insn	2, 0x005a
  78:	0000                	.insn	2, 0x0000
  7a:	0000                	.insn	2, 0x0000
  7c:	0000                	.insn	2, 0x0000
  7e:	b000                	.insn	2, 0xb000
  80:	0002                	.insn	2, 0x0002
  82:	b400                	.insn	2, 0xb400
  84:	0002                	.insn	2, 0x0002
  86:	0400                	.insn	2, 0x0400
  88:	7200                	.insn	2, 0x7200
  8a:	00ec                	.insn	2, 0x00ec
  8c:	b49f 0002 cc00      	.insn	6, 0xcc000002b49f
  92:	0002                	.insn	2, 0x0002
  94:	0100                	.insn	2, 0x0100
  96:	5a00                	.insn	2, 0x5a00
  98:	02d4                	.insn	2, 0x02d4
  9a:	0000                	.insn	2, 0x0000
  9c:	030c                	.insn	2, 0x030c
  9e:	0000                	.insn	2, 0x0000
  a0:	0001                	.insn	2, 0x0001
  a2:	00030c5b          	.insn	4, 0x00030c5b
  a6:	1400                	.insn	2, 0x1400
  a8:	03000003          	lb	zero,48(zero) # 30 <$d.2+0x30>
  ac:	7b00                	.insn	2, 0x7b00
  ae:	9f01                	.insn	2, 0x9f01
	...
  b8:	0400                	.insn	2, 0x0400
  ba:	0000                	.insn	2, 0x0000
  bc:	0450                	.insn	2, 0x0450
  be:	0000                	.insn	2, 0x0000
  c0:	0006                	.insn	2, 0x0006
  c2:	8010                	.insn	2, 0x8010
  c4:	8080                	.insn	2, 0x8080
  c6:	9f01                	.insn	2, 0x9f01
  c8:	04a4                	.insn	2, 0x04a4
  ca:	0000                	.insn	2, 0x0000
  cc:	04c0                	.insn	2, 0x04c0
  ce:	0000                	.insn	2, 0x0000
  d0:	0006                	.insn	2, 0x0006
  d2:	8010                	.insn	2, 0x8010
  d4:	8080                	.insn	2, 0x8080
  d6:	9f01                	.insn	2, 0x9f01
  d8:	0534                	.insn	2, 0x0534
  da:	0000                	.insn	2, 0x0000
  dc:	0590                	.insn	2, 0x0590
  de:	0000                	.insn	2, 0x0000
  e0:	0006                	.insn	2, 0x0006
  e2:	8010                	.insn	2, 0x8010
  e4:	8080                	.insn	2, 0x8080
  e6:	9f01                	.insn	2, 0x9f01
  e8:	0590                	.insn	2, 0x0590
  ea:	0000                	.insn	2, 0x0000
  ec:	05e4                	.insn	2, 0x05e4
  ee:	0000                	.insn	2, 0x0000
  f0:	0001                	.insn	2, 0x0001
  f2:	fc5a                	.insn	2, 0xfc5a
  f4:	0005                	.insn	2, 0x0005
  f6:	6000                	.insn	2, 0x6000
  f8:	0006                	.insn	2, 0x0006
  fa:	0100                	.insn	2, 0x0100
  fc:	5a00                	.insn	2, 0x5a00
	...
 106:	0400                	.insn	2, 0x0400
 108:	0000                	.insn	2, 0x0000
 10a:	0450                	.insn	2, 0x0450
 10c:	0000                	.insn	2, 0x0000
 10e:	0004                	.insn	2, 0x0004
 110:	8010                	.insn	2, 0x8010
 112:	9f02                	.insn	2, 0x9f02
 114:	04ac                	.insn	2, 0x04ac
 116:	0000                	.insn	2, 0x0000
 118:	04b4                	.insn	2, 0x04b4
 11a:	0000                	.insn	2, 0x0000
 11c:	0001                	.insn	2, 0x0001
 11e:	0004b85b          	.insn	4, 0x0004b85b
 122:	c000                	.insn	2, 0xc000
 124:	0004                	.insn	2, 0x0004
 126:	0400                	.insn	2, 0x0400
 128:	1000                	.insn	2, 0x1000
 12a:	0280                	.insn	2, 0x0280
 12c:	349f 0005 e400      	.insn	6, 0xe4000005349f
 132:	0005                	.insn	2, 0x0005
 134:	0400                	.insn	2, 0x0400
 136:	1000                	.insn	2, 0x1000
 138:	0280                	.insn	2, 0x0280
 13a:	fc9f 0005 5800      	.insn	6, 0x58000005fc9f
 140:	0006                	.insn	2, 0x0006
 142:	0400                	.insn	2, 0x0400
 144:	1000                	.insn	2, 0x1000
 146:	0280                	.insn	2, 0x0280
 148:	589f 0006 6000      	.insn	6, 0x60000006589f
 14e:	0006                	.insn	2, 0x0006
 150:	0100                	.insn	2, 0x0100
 152:	5b00                	.insn	2, 0x5b00
	...
 15c:	040c                	.insn	2, 0x040c
 15e:	0000                	.insn	2, 0x0000
 160:	0450                	.insn	2, 0x0450
 162:	0000                	.insn	2, 0x0000
 164:	0002                	.insn	2, 0x0002
 166:	9f30                	.insn	2, 0x9f30
 168:	04b8                	.insn	2, 0x04b8
 16a:	0000                	.insn	2, 0x0000
 16c:	04c0                	.insn	2, 0x04c0
 16e:	0000                	.insn	2, 0x0000
 170:	0002                	.insn	2, 0x0002
 172:	9f30                	.insn	2, 0x9f30
 174:	0534                	.insn	2, 0x0534
 176:	0000                	.insn	2, 0x0000
 178:	0540                	.insn	2, 0x0540
 17a:	0000                	.insn	2, 0x0000
 17c:	0002                	.insn	2, 0x0002
 17e:	9f30                	.insn	2, 0x9f30
 180:	0540                	.insn	2, 0x0540
 182:	0000                	.insn	2, 0x0000
 184:	0550                	.insn	2, 0x0550
 186:	0000                	.insn	2, 0x0000
 188:	0001                	.insn	2, 0x0001
 18a:	545a                	.insn	2, 0x545a
 18c:	0005                	.insn	2, 0x0005
 18e:	9000                	.insn	2, 0x9000
 190:	0005                	.insn	2, 0x0005
 192:	0100                	.insn	2, 0x0100
 194:	5a00                	.insn	2, 0x5a00
	...
 19e:	040c                	.insn	2, 0x040c
 1a0:	0000                	.insn	2, 0x0000
 1a2:	0410                	.insn	2, 0x0410
 1a4:	0000                	.insn	2, 0x0000
 1a6:	0001                	.insn	2, 0x0001
 1a8:	1c5d                	.insn	2, 0x1c5d
 1aa:	0004                	.insn	2, 0x0004
 1ac:	2000                	.insn	2, 0x2000
 1ae:	0004                	.insn	2, 0x0004
 1b0:	0300                	.insn	2, 0x0300
 1b2:	7d00                	.insn	2, 0x7d00
 1b4:	04209f7f 04440000 	.insn	12, 0x000300000444000004209f7f
 1bc:	00030000 
 1c0:	7e7d                	.insn	2, 0x7e7d
 1c2:	489f 0004 5000      	.insn	6, 0x50000004489f
 1c8:	0004                	.insn	2, 0x0004
 1ca:	0100                	.insn	2, 0x0100
 1cc:	5d00                	.insn	2, 0x5d00
 1ce:	04b8                	.insn	2, 0x04b8
 1d0:	0000                	.insn	2, 0x0000
 1d2:	04bc                	.insn	2, 0x04bc
 1d4:	0000                	.insn	2, 0x0000
 1d6:	7e7d0003          	lb	zero,2023(s10)
 1da:	bc9f 0004 c000      	.insn	6, 0xc0000004bc9f
 1e0:	0004                	.insn	2, 0x0004
 1e2:	0100                	.insn	2, 0x0100
 1e4:	5d00                	.insn	2, 0x5d00
 1e6:	0540                	.insn	2, 0x0540
 1e8:	0000                	.insn	2, 0x0000
 1ea:	0558                	.insn	2, 0x0558
 1ec:	0000                	.insn	2, 0x0000
 1ee:	0001                	.insn	2, 0x0001
 1f0:	5c5d                	.insn	2, 0x5c5d
 1f2:	0005                	.insn	2, 0x0005
 1f4:	9000                	.insn	2, 0x9000
 1f6:	0005                	.insn	2, 0x0005
 1f8:	0100                	.insn	2, 0x0100
 1fa:	5d00                	.insn	2, 0x5d00
	...
 204:	0450                	.insn	2, 0x0450
 206:	0000                	.insn	2, 0x0000
 208:	0464                	.insn	2, 0x0464
 20a:	0000                	.insn	2, 0x0000
 20c:	0004                	.insn	2, 0x0004
 20e:	e810                	.insn	2, 0xe810
 210:	04649f07          	.insn	4, 0x04649f07
 214:	0000                	.insn	2, 0x0000
 216:	0470                	.insn	2, 0x0470
 218:	0000                	.insn	2, 0x0000
 21a:	0001                	.insn	2, 0x0001
 21c:	ec5a                	.insn	2, 0xec5a
 21e:	0004                	.insn	2, 0x0004
 220:	f400                	.insn	2, 0xf400
 222:	0004                	.insn	2, 0x0004
 224:	0100                	.insn	2, 0x0100
 226:	5a00                	.insn	2, 0x5a00
 228:	04f8                	.insn	2, 0x04f8
 22a:	0000                	.insn	2, 0x0000
 22c:	0500                	.insn	2, 0x0500
 22e:	0000                	.insn	2, 0x0000
 230:	0001                	.insn	2, 0x0001
 232:	005a                	.insn	2, 0x005a
 234:	0000                	.insn	2, 0x0000
 236:	0000                	.insn	2, 0x0000
 238:	0000                	.insn	2, 0x0000
 23a:	7c00                	.insn	2, 0x7c00
 23c:	0004                	.insn	2, 0x0004
 23e:	8c00                	.insn	2, 0x8c00
 240:	0004                	.insn	2, 0x0004
 242:	0200                	.insn	2, 0x0200
 244:	3c00                	.insn	2, 0x3c00
 246:	8c9f 0004 9000      	.insn	6, 0x900000048c9f
 24c:	0004                	.insn	2, 0x0004
 24e:	0100                	.insn	2, 0x0100
 250:	5a00                	.insn	2, 0x5a00
 252:	0490                	.insn	2, 0x0490
 254:	0000                	.insn	2, 0x0000
 256:	04a4                	.insn	2, 0x04a4
 258:	0000                	.insn	2, 0x0000
 25a:	0002                	.insn	2, 0x0002
 25c:	9f3c                	.insn	2, 0x9f3c
	...
 266:	04dc                	.insn	2, 0x04dc
 268:	0000                	.insn	2, 0x0000
 26a:	04e4                	.insn	2, 0x04e4
 26c:	0000                	.insn	2, 0x0000
 26e:	0001                	.insn	2, 0x0001
 270:	005a                	.insn	2, 0x005a
 272:	0000                	.insn	2, 0x0000
 274:	0000                	.insn	2, 0x0000
 276:	0000                	.insn	2, 0x0000
 278:	4000                	.insn	2, 0x4000
 27a:	0005                	.insn	2, 0x0005
 27c:	4800                	.insn	2, 0x4800
 27e:	0005                	.insn	2, 0x0005
 280:	0100                	.insn	2, 0x0100
 282:	5c00                	.insn	2, 0x5c00
 284:	055c                	.insn	2, 0x055c
 286:	0000                	.insn	2, 0x0000
 288:	0590                	.insn	2, 0x0590
 28a:	0000                	.insn	2, 0x0000
 28c:	0001                	.insn	2, 0x0001
 28e:	005c                	.insn	2, 0x005c
 290:	0000                	.insn	2, 0x0000
 292:	0000                	.insn	2, 0x0000
 294:	0000                	.insn	2, 0x0000
 296:	4c00                	.insn	2, 0x4c00
 298:	0005                	.insn	2, 0x0005
 29a:	5c00                	.insn	2, 0x5c00
 29c:	0005                	.insn	2, 0x0005
 29e:	0100                	.insn	2, 0x0100
 2a0:	5e00                	.insn	2, 0x5e00
	...
 2aa:	059c                	.insn	2, 0x059c
 2ac:	0000                	.insn	2, 0x0000
 2ae:	05e4                	.insn	2, 0x05e4
 2b0:	0000                	.insn	2, 0x0000
 2b2:	0002                	.insn	2, 0x0002
 2b4:	9f30                	.insn	2, 0x9f30
 2b6:	05fc                	.insn	2, 0x05fc
 2b8:	0000                	.insn	2, 0x0000
 2ba:	0608                	.insn	2, 0x0608
 2bc:	0000                	.insn	2, 0x0000
 2be:	0002                	.insn	2, 0x0002
 2c0:	9f30                	.insn	2, 0x9f30
 2c2:	0608                	.insn	2, 0x0608
 2c4:	0000                	.insn	2, 0x0000
 2c6:	0618                	.insn	2, 0x0618
 2c8:	0000                	.insn	2, 0x0000
 2ca:	0001                	.insn	2, 0x0001
 2cc:	00061c5b          	.insn	4, 0x00061c5b
 2d0:	5800                	.insn	2, 0x5800
 2d2:	0006                	.insn	2, 0x0006
 2d4:	0100                	.insn	2, 0x0100
 2d6:	5b00                	.insn	2, 0x5b00
	...
 2e0:	059c                	.insn	2, 0x059c
 2e2:	0000                	.insn	2, 0x0000
 2e4:	05a0                	.insn	2, 0x05a0
 2e6:	0000                	.insn	2, 0x0000
 2e8:	0001                	.insn	2, 0x0001
 2ea:	a45d                	.insn	2, 0xa45d
 2ec:	0005                	.insn	2, 0x0005
 2ee:	a800                	.insn	2, 0xa800
 2f0:	0005                	.insn	2, 0x0005
 2f2:	0300                	.insn	2, 0x0300
 2f4:	7d00                	.insn	2, 0x7d00
 2f6:	05a89f7f 05cc0000 	.insn	12, 0x0003000005cc000005a89f7f
 2fe:	00030000 
 302:	7e7d                	.insn	2, 0x7e7d
 304:	d09f 0005 d800      	.insn	6, 0xd8000005d09f
 30a:	0005                	.insn	2, 0x0005
 30c:	0100                	.insn	2, 0x0100
 30e:	5d00                	.insn	2, 0x5d00
 310:	05d8                	.insn	2, 0x05d8
 312:	0000                	.insn	2, 0x0000
 314:	05dc                	.insn	2, 0x05dc
 316:	0000                	.insn	2, 0x0000
 318:	7e7d0003          	lb	zero,2023(s10)
 31c:	dc9f 0005 e400      	.insn	6, 0xe4000005dc9f
 322:	0005                	.insn	2, 0x0005
 324:	0100                	.insn	2, 0x0100
 326:	5d00                	.insn	2, 0x5d00
 328:	0608                	.insn	2, 0x0608
 32a:	0000                	.insn	2, 0x0000
 32c:	0620                	.insn	2, 0x0620
 32e:	0000                	.insn	2, 0x0000
 330:	0001                	.insn	2, 0x0001
 332:	245d                	.insn	2, 0x245d
 334:	0006                	.insn	2, 0x0006
 336:	5800                	.insn	2, 0x5800
 338:	0006                	.insn	2, 0x0006
 33a:	0100                	.insn	2, 0x0100
 33c:	5d00                	.insn	2, 0x5d00
	...
 346:	0608                	.insn	2, 0x0608
 348:	0000                	.insn	2, 0x0000
 34a:	0610                	.insn	2, 0x0610
 34c:	0000                	.insn	2, 0x0000
 34e:	0001                	.insn	2, 0x0001
 350:	245c                	.insn	2, 0x245c
 352:	0006                	.insn	2, 0x0006
 354:	5800                	.insn	2, 0x5800
 356:	0006                	.insn	2, 0x0006
 358:	0100                	.insn	2, 0x0100
 35a:	5c00                	.insn	2, 0x5c00
	...
 364:	0614                	.insn	2, 0x0614
 366:	0000                	.insn	2, 0x0000
 368:	0624                	.insn	2, 0x0624
 36a:	0000                	.insn	2, 0x0000
 36c:	0001                	.insn	2, 0x0001
 36e:	005e                	.insn	2, 0x005e
 370:	0000                	.insn	2, 0x0000
 372:	0000                	.insn	2, 0x0000
 374:	0000                	.insn	2, 0x0000
 376:	6c00                	.insn	2, 0x6c00
 378:	0006                	.insn	2, 0x0006
 37a:	7c00                	.insn	2, 0x7c00
 37c:	0006                	.insn	2, 0x0006
 37e:	0100                	.insn	2, 0x0100
 380:	5a00                	.insn	2, 0x5a00
 382:	067c                	.insn	2, 0x067c
 384:	0000                	.insn	2, 0x0000
 386:	0680                	.insn	2, 0x0680
 388:	0000                	.insn	2, 0x0000
 38a:	7f7c0003          	lb	zero,2039(s8)
 38e:	809f 0006 a400      	.insn	6, 0xa4000006809f
 394:	0006                	.insn	2, 0x0006
 396:	0300                	.insn	2, 0x0300
 398:	7c00                	.insn	2, 0x7c00
 39a:	9f7e                	.insn	2, 0x9f7e
 39c:	06a8                	.insn	2, 0x06a8
 39e:	0000                	.insn	2, 0x0000
 3a0:	06b0                	.insn	2, 0x06b0
 3a2:	0000                	.insn	2, 0x0000
 3a4:	0001                	.insn	2, 0x0001
 3a6:	b05c                	.insn	2, 0xb05c
 3a8:	0006                	.insn	2, 0x0006
 3aa:	b400                	.insn	2, 0xb400
 3ac:	0006                	.insn	2, 0x0006
 3ae:	0300                	.insn	2, 0x0300
 3b0:	7c00                	.insn	2, 0x7c00
 3b2:	9f7e                	.insn	2, 0x9f7e
 3b4:	06b4                	.insn	2, 0x06b4
 3b6:	0000                	.insn	2, 0x0000
 3b8:	06c0                	.insn	2, 0x06c0
 3ba:	0000                	.insn	2, 0x0000
 3bc:	0001                	.insn	2, 0x0001
 3be:	c05c                	.insn	2, 0xc05c
 3c0:	0006                	.insn	2, 0x0006
 3c2:	c400                	.insn	2, 0xc400
 3c4:	0006                	.insn	2, 0x0006
 3c6:	0300                	.insn	2, 0x0300
 3c8:	7c00                	.insn	2, 0x7c00
 3ca:	9f7e                	.insn	2, 0x9f7e
 3cc:	06e0                	.insn	2, 0x06e0
 3ce:	0000                	.insn	2, 0x0000
 3d0:	06f8                	.insn	2, 0x06f8
 3d2:	0000                	.insn	2, 0x0000
 3d4:	0001                	.insn	2, 0x0001
 3d6:	fc5c                	.insn	2, 0xfc5c
 3d8:	0006                	.insn	2, 0x0006
 3da:	2c00                	.insn	2, 0x2c00
 3dc:	01000007          	.insn	4, 0x01000007
 3e0:	5c00                	.insn	2, 0x5c00
	...
 3ea:	066c                	.insn	2, 0x066c
 3ec:	0000                	.insn	2, 0x0000
 3ee:	06e0                	.insn	2, 0x06e0
 3f0:	0000                	.insn	2, 0x0000
 3f2:	0002                	.insn	2, 0x0002
 3f4:	9f30                	.insn	2, 0x9f30
 3f6:	06e0                	.insn	2, 0x06e0
 3f8:	0000                	.insn	2, 0x0000
 3fa:	06f0                	.insn	2, 0x06f0
 3fc:	0000                	.insn	2, 0x0000
 3fe:	0001                	.insn	2, 0x0001
 400:	f45d                	.insn	2, 0xf45d
 402:	0006                	.insn	2, 0x0006
 404:	3800                	.insn	2, 0x3800
 406:	01000007          	.insn	4, 0x01000007
 40a:	5d00                	.insn	2, 0x5d00
	...
 414:	06e0                	.insn	2, 0x06e0
 416:	0000                	.insn	2, 0x0000
 418:	06e8                	.insn	2, 0x06e8
 41a:	0000                	.insn	2, 0x0000
 41c:	0001                	.insn	2, 0x0001
 41e:	fc5a                	.insn	2, 0xfc5a
 420:	0006                	.insn	2, 0x0006
 422:	2c00                	.insn	2, 0x2c00
 424:	01000007          	.insn	4, 0x01000007
 428:	5a00                	.insn	2, 0x5a00
	...
 432:	06ec                	.insn	2, 0x06ec
 434:	0000                	.insn	2, 0x0000
 436:	06fc                	.insn	2, 0x06fc
 438:	0000                	.insn	2, 0x0000
 43a:	0001                	.insn	2, 0x0001
 43c:	0061                	.insn	2, 0x0061
 43e:	0000                	.insn	2, 0x0000
 440:	0000                	.insn	2, 0x0000
 442:	0000                	.insn	2, 0x0000
 444:	3800                	.insn	2, 0x3800
 446:	58000007          	.insn	4, 0x58000007
 44a:	01000007          	.insn	4, 0x01000007
 44e:	5a00                	.insn	2, 0x5a00
 450:	0758                	.insn	2, 0x0758
 452:	0000                	.insn	2, 0x0000
 454:	07dc                	.insn	2, 0x07dc
 456:	0000                	.insn	2, 0x0000
 458:	0001                	.insn	2, 0x0001
 45a:	0058                	.insn	2, 0x0058
 45c:	0000                	.insn	2, 0x0000
 45e:	0000                	.insn	2, 0x0000
 460:	0000                	.insn	2, 0x0000
 462:	5800                	.insn	2, 0x5800
 464:	6c000007          	.insn	4, 0x6c000007
 468:	02000007          	.insn	4, 0x02000007
 46c:	3200                	.insn	2, 0x3200
 46e:	6c9f 0007 b000      	.insn	6, 0xb00000076c9f
 474:	01000007          	.insn	4, 0x01000007
 478:	6200                	.insn	2, 0x6200
	...
 482:	0758                	.insn	2, 0x0758
 484:	0000                	.insn	2, 0x0000
 486:	076c                	.insn	2, 0x076c
 488:	0000                	.insn	2, 0x0000
 48a:	00110003          	lb	zero,1(sp)
 48e:	6c9f 0007 c400      	.insn	6, 0xc40000076c9f
 494:	01000007          	.insn	4, 0x01000007
 498:	5900                	.insn	2, 0x5900
	...

000004a2 <$d.3>:
 4a2:	ffff                	.insn	2, 0xffff
 4a4:	ffff                	.insn	2, 0xffff
 4a6:	0810                	.insn	2, 0x0810
 4a8:	0040                	.insn	2, 0x0040
 4aa:	0000                	.insn	2, 0x0000
 4ac:	0000                	.insn	2, 0x0000
 4ae:	0014                	.insn	2, 0x0014
 4b0:	0000                	.insn	2, 0x0000
 4b2:	00110003          	lb	zero,1(sp)
 4b6:	009f 0000 0000      	.insn	6, 0x009f
 4bc:	0000                	.insn	2, 0x0000
 4be:	ff00                	.insn	2, 0xff00
 4c0:	ffff                	.insn	2, 0xffff
 4c2:	400810ff 00001800 	.insn	12, 0x3c0000001800400810ff
 4ca:	00003c00 
 4ce:	0100                	.insn	2, 0x0100
 4d0:	5a00                	.insn	2, 0x5a00
 4d2:	003c                	.insn	2, 0x003c
 4d4:	0000                	.insn	2, 0x0000
 4d6:	037c                	.insn	2, 0x037c
 4d8:	0000                	.insn	2, 0x0000
 4da:	0001                	.insn	2, 0x0001
 4dc:	0058                	.insn	2, 0x0058
 4de:	0000                	.insn	2, 0x0000
 4e0:	0000                	.insn	2, 0x0000
 4e2:	0000                	.insn	2, 0x0000
 4e4:	ff00                	.insn	2, 0xff00
 4e6:	ffff                	.insn	2, 0xffff
 4e8:	400810ff 00003c00 	.insn	12, 0x540000003c00400810ff
 4f0:	00005400 
 4f4:	0200                	.insn	2, 0x0200
 4f6:	3000                	.insn	2, 0x3000
 4f8:	549f 0000 b800      	.insn	6, 0xb8000000549f
 4fe:	0000                	.insn	2, 0x0000
 500:	0100                	.insn	2, 0x0100
 502:	5900                	.insn	2, 0x5900
	...
 50c:	ffff                	.insn	2, 0xffff
 50e:	ffff                	.insn	2, 0xffff
 510:	0810                	.insn	2, 0x0810
 512:	0040                	.insn	2, 0x0040
 514:	0054                	.insn	2, 0x0054
 516:	0000                	.insn	2, 0x0000
 518:	007c                	.insn	2, 0x007c
 51a:	0000                	.insn	2, 0x0000
 51c:	0002                	.insn	2, 0x0002
 51e:	9f30                	.insn	2, 0x9f30
 520:	007c                	.insn	2, 0x007c
 522:	0000                	.insn	2, 0x0000
 524:	0090                	.insn	2, 0x0090
 526:	0000                	.insn	2, 0x0000
 528:	0006                	.insn	2, 0x0006
 52a:	0082                	.insn	2, 0x0082
 52c:	0311                	.insn	2, 0x0311
 52e:	00909f1b          	.insn	4, 0x00909f1b
 532:	0000                	.insn	2, 0x0000
 534:	00a4                	.insn	2, 0x00a4
 536:	0000                	.insn	2, 0x0000
 538:	0009                	.insn	2, 0x0009
 53a:	0082                	.insn	2, 0x0082
 53c:	0311                	.insn	2, 0x0311
 53e:	2201111b          	.insn	4, 0x2201111b
 542:	009f 0000 0000      	.insn	6, 0x009f
 548:	0000                	.insn	2, 0x0000
 54a:	ff00                	.insn	2, 0xff00
 54c:	ffff                	.insn	2, 0xffff
 54e:	400810ff 0000d800 	.insn	12, 0x000118000000d800400810ff
 556:	00011800 
 55a:	0100                	.insn	2, 0x0100
 55c:	5800                	.insn	2, 0x5800
 55e:	01a4                	.insn	2, 0x01a4
 560:	0000                	.insn	2, 0x0000
 562:	01e0                	.insn	2, 0x01e0
 564:	0000                	.insn	2, 0x0000
 566:	0001                	.insn	2, 0x0001
 568:	0058                	.insn	2, 0x0058
 56a:	0000                	.insn	2, 0x0000
 56c:	0000                	.insn	2, 0x0000
 56e:	0000                	.insn	2, 0x0000
 570:	ff00                	.insn	2, 0xff00
 572:	ffff                	.insn	2, 0xffff
 574:	400810ff 0000d800 	.insn	12, 0x000118000000d800400810ff
 57c:	00011800 
 580:	0200                	.insn	2, 0x0200
 582:	3300                	.insn	2, 0x3300
 584:	a49f 0001 e000      	.insn	6, 0xe0000001a49f
 58a:	0001                	.insn	2, 0x0001
 58c:	0200                	.insn	2, 0x0200
 58e:	3300                	.insn	2, 0x3300
 590:	009f 0000 0000      	.insn	6, 0x009f
 596:	0000                	.insn	2, 0x0000
 598:	ff00                	.insn	2, 0xff00
 59a:	ffff                	.insn	2, 0xffff
 59c:	400810ff 0000d800 	.insn	12, 0x000118000000d800400810ff
 5a4:	00011800 
 5a8:	0300                	.insn	2, 0x0300
 5aa:	7200                	.insn	2, 0x7200
 5ac:	9f04                	.insn	2, 0x9f04
	...
 5b6:	ffff                	.insn	2, 0xffff
 5b8:	ffff                	.insn	2, 0xffff
 5ba:	0810                	.insn	2, 0x0810
 5bc:	0040                	.insn	2, 0x0040
 5be:	00d8                	.insn	2, 0x00d8
 5c0:	0000                	.insn	2, 0x0000
 5c2:	0118                	.insn	2, 0x0118
 5c4:	0000                	.insn	2, 0x0000
 5c6:	0004                	.insn	2, 0x0004
 5c8:	c472                	.insn	2, 0xc472
 5ca:	9f04                	.insn	2, 0x9f04
	...
 5d4:	ffff                	.insn	2, 0xffff
 5d6:	ffff                	.insn	2, 0xffff
 5d8:	0810                	.insn	2, 0x0810
 5da:	0040                	.insn	2, 0x0040
 5dc:	00d8                	.insn	2, 0x00d8
 5de:	0000                	.insn	2, 0x0000
 5e0:	0118                	.insn	2, 0x0118
 5e2:	0000                	.insn	2, 0x0000
 5e4:	0004                	.insn	2, 0x0004
 5e6:	d472                	.insn	2, 0xd472
 5e8:	9f05                	.insn	2, 0x9f05
	...
 5f2:	ffff                	.insn	2, 0xffff
 5f4:	ffff                	.insn	2, 0xffff
 5f6:	0810                	.insn	2, 0x0810
 5f8:	0040                	.insn	2, 0x0040
 5fa:	00f4                	.insn	2, 0x00f4
 5fc:	0000                	.insn	2, 0x0000
 5fe:	0118                	.insn	2, 0x0118
 600:	0000                	.insn	2, 0x0000
 602:	0001                	.insn	2, 0x0001
 604:	005f 0000 0000      	.insn	6, 0x005f
 60a:	0000                	.insn	2, 0x0000
 60c:	ff00                	.insn	2, 0xff00
 60e:	ffff                	.insn	2, 0xffff
 610:	400810ff 0000f800 	.insn	12, 0x000118000000f800400810ff
 618:	00011800 
 61c:	0300                	.insn	2, 0x0300
 61e:	1000                	.insn	2, 0x1000
 620:	9f41                	.insn	2, 0x9f41
 622:	01c4                	.insn	2, 0x01c4
 624:	0000                	.insn	2, 0x0000
 626:	01e0                	.insn	2, 0x01e0
 628:	0000                	.insn	2, 0x0000
 62a:	41100003          	lb	zero,1041(zero) # 411 <$d.4+0x271>
 62e:	009f 0000 0000      	.insn	6, 0x009f
 634:	0000                	.insn	2, 0x0000
 636:	ff00                	.insn	2, 0xff00
 638:	ffff                	.insn	2, 0xffff
 63a:	400810ff 00010800 	.insn	12, 0x0001180000010800400810ff
 642:	00011800 
 646:	0200                	.insn	2, 0x0200
 648:	3a00                	.insn	2, 0x3a00
 64a:	d49f 0001 e000      	.insn	6, 0xe0000001d49f
 650:	0001                	.insn	2, 0x0001
 652:	0200                	.insn	2, 0x0200
 654:	3a00                	.insn	2, 0x3a00
 656:	009f 0000 0000      	.insn	6, 0x009f
 65c:	0000                	.insn	2, 0x0000
 65e:	ff00                	.insn	2, 0xff00
 660:	ffff                	.insn	2, 0xffff
 662:	400810ff 00011400 	.insn	12, 0x0001280000011400400810ff
 66a:	00012800 
 66e:	0200                	.insn	2, 0x0200
 670:	3000                	.insn	2, 0x3000
 672:	289f 0001 8400      	.insn	6, 0x84000001289f
 678:	0001                	.insn	2, 0x0001
 67a:	0100                	.insn	2, 0x0100
 67c:	5900                	.insn	2, 0x5900
	...
 686:	ffff                	.insn	2, 0xffff
 688:	ffff                	.insn	2, 0xffff
 68a:	0810                	.insn	2, 0x0810
 68c:	0040                	.insn	2, 0x0040
 68e:	0128                	.insn	2, 0x0128
 690:	0000                	.insn	2, 0x0000
 692:	0144                	.insn	2, 0x0144
 694:	0000                	.insn	2, 0x0000
 696:	0002                	.insn	2, 0x0002
 698:	9f30                	.insn	2, 0x9f30
 69a:	0144                	.insn	2, 0x0144
 69c:	0000                	.insn	2, 0x0000
 69e:	0160                	.insn	2, 0x0160
 6a0:	0000                	.insn	2, 0x0000
 6a2:	000a                	.insn	2, 0x000a
 6a4:	0085                	.insn	2, 0x0085
 6a6:	d472                	.insn	2, 0xd472
 6a8:	1c05                	.insn	2, 0x1c05
 6aa:	0c11                	.insn	2, 0x0c11
 6ac:	01609f1b          	.insn	4, 0x01609f1b
 6b0:	0000                	.insn	2, 0x0000
 6b2:	0168                	.insn	2, 0x0168
 6b4:	0000                	.insn	2, 0x0000
 6b6:	000d                	.insn	2, 0x000d
 6b8:	0085                	.insn	2, 0x0085
 6ba:	d472                	.insn	2, 0xd472
 6bc:	1c05                	.insn	2, 0x1c05
 6be:	0c11                	.insn	2, 0x0c11
 6c0:	2201111b          	.insn	4, 0x2201111b
 6c4:	009f 0000 0000      	.insn	6, 0x009f
 6ca:	0000                	.insn	2, 0x0000
 6cc:	ff00                	.insn	2, 0xff00
 6ce:	ffff                	.insn	2, 0xffff
 6d0:	400810ff 0001e400 	.insn	12, 0x000210000001e400400810ff
 6d8:	00021000 
 6dc:	0200                	.insn	2, 0x0200
 6de:	3a00                	.insn	2, 0x3a00
 6e0:	b49f 0002 dc00      	.insn	6, 0xdc000002b49f
 6e6:	0002                	.insn	2, 0x0002
 6e8:	0200                	.insn	2, 0x0200
 6ea:	3a00                	.insn	2, 0x3a00
 6ec:	009f 0000 0000      	.insn	6, 0x009f
 6f2:	0000                	.insn	2, 0x0000
 6f4:	ff00                	.insn	2, 0xff00
 6f6:	ffff                	.insn	2, 0xffff
 6f8:	400810ff 0001f400 	.insn	12, 0x000210000001f400400810ff
 700:	00021000 
 704:	0300                	.insn	2, 0x0300
 706:	1000                	.insn	2, 0x1000
 708:	9f42                	.insn	2, 0x9f42
 70a:	02c4                	.insn	2, 0x02c4
 70c:	0000                	.insn	2, 0x0000
 70e:	02dc                	.insn	2, 0x02dc
 710:	0000                	.insn	2, 0x0000
 712:	42100003          	lb	zero,1057(zero) # 421 <$d.4+0x281>
 716:	009f 0000 0000      	.insn	6, 0x009f
 71c:	0000                	.insn	2, 0x0000
 71e:	ff00                	.insn	2, 0xff00
 720:	ffff                	.insn	2, 0xffff
 722:	400810ff 00020000 	.insn	12, 0x0002100000020000400810ff
 72a:	00021000 
 72e:	0200                	.insn	2, 0x0200
 730:	3a00                	.insn	2, 0x3a00
 732:	d09f 0002 dc00      	.insn	6, 0xdc000002d09f
 738:	0002                	.insn	2, 0x0002
 73a:	0200                	.insn	2, 0x0200
 73c:	3a00                	.insn	2, 0x3a00
 73e:	009f 0000 0000      	.insn	6, 0x009f
 744:	0000                	.insn	2, 0x0000
 746:	ff00                	.insn	2, 0xff00
 748:	ffff                	.insn	2, 0xffff
 74a:	400810ff 00020c00 	.insn	12, 0x0002240000020c00400810ff
 752:	00022400 
 756:	0200                	.insn	2, 0x0200
 758:	3000                	.insn	2, 0x3000
 75a:	249f 0002 8000      	.insn	6, 0x80000002249f
 760:	0002                	.insn	2, 0x0002
 762:	0100                	.insn	2, 0x0100
 764:	5900                	.insn	2, 0x5900
	...
 76e:	ffff                	.insn	2, 0xffff
 770:	ffff                	.insn	2, 0xffff
 772:	0810                	.insn	2, 0x0810
 774:	0040                	.insn	2, 0x0040
 776:	0224                	.insn	2, 0x0224
 778:	0000                	.insn	2, 0x0000
 77a:	0240                	.insn	2, 0x0240
 77c:	0000                	.insn	2, 0x0000
 77e:	0002                	.insn	2, 0x0002
 780:	9f30                	.insn	2, 0x9f30
 782:	0240                	.insn	2, 0x0240
 784:	0000                	.insn	2, 0x0000
 786:	025c                	.insn	2, 0x025c
 788:	0000                	.insn	2, 0x0000
 78a:	000a                	.insn	2, 0x000a
 78c:	0085                	.insn	2, 0x0085
 78e:	c472                	.insn	2, 0xc472
 790:	1c04                	.insn	2, 0x1c04
 792:	0c11                	.insn	2, 0x0c11
 794:	025c9f1b          	.insn	4, 0x025c9f1b
 798:	0000                	.insn	2, 0x0000
 79a:	0264                	.insn	2, 0x0264
 79c:	0000                	.insn	2, 0x0000
 79e:	000d                	.insn	2, 0x000d
 7a0:	0085                	.insn	2, 0x0085
 7a2:	c472                	.insn	2, 0xc472
 7a4:	1c04                	.insn	2, 0x1c04
 7a6:	0c11                	.insn	2, 0x0c11
 7a8:	2201111b          	.insn	4, 0x2201111b
 7ac:	009f 0000 0000      	.insn	6, 0x009f
 7b2:	0000                	.insn	2, 0x0000
 7b4:	ff00                	.insn	2, 0xff00
 7b6:	ffff                	.insn	2, 0xffff
 7b8:	400810ff 00028400 	.insn	12, 0x0002b00000028400400810ff
 7c0:	0002b000 
 7c4:	0200                	.insn	2, 0x0200
 7c6:	3a00                	.insn	2, 0x3a00
 7c8:	e09f 0002 0c00      	.insn	6, 0x0c000002e09f
 7ce:	02000003          	lb	zero,32(zero) # 20 <$d.2+0x20>
 7d2:	3a00                	.insn	2, 0x3a00
 7d4:	009f 0000 0000      	.insn	6, 0x009f
 7da:	0000                	.insn	2, 0x0000
 7dc:	ff00                	.insn	2, 0xff00
 7de:	ffff                	.insn	2, 0xffff
 7e0:	400810ff 00029400 	.insn	12, 0x0002b00000029400400810ff
 7e8:	0002b000 
 7ec:	0300                	.insn	2, 0x0300
 7ee:	1000                	.insn	2, 0x1000
 7f0:	02f09f43          	.insn	4, 0x02f09f43
 7f4:	0000                	.insn	2, 0x0000
 7f6:	030c                	.insn	2, 0x030c
 7f8:	0000                	.insn	2, 0x0000
 7fa:	43100003          	lb	zero,1073(zero) # 431 <$d.4+0x291>
 7fe:	009f 0000 0000      	.insn	6, 0x009f
 804:	0000                	.insn	2, 0x0000
 806:	ff00                	.insn	2, 0xff00
 808:	ffff                	.insn	2, 0xffff
 80a:	400810ff 0002a000 	.insn	12, 0x0002b0000002a000400810ff
 812:	0002b000 
 816:	0200                	.insn	2, 0x0200
 818:	3a00                	.insn	2, 0x3a00
 81a:	fc9f 0002 0c00      	.insn	6, 0x0c000002fc9f
 820:	02000003          	lb	zero,32(zero) # 20 <$d.2+0x20>
 824:	3a00                	.insn	2, 0x3a00
 826:	009f 0000 0000      	.insn	6, 0x009f
 82c:	0000                	.insn	2, 0x0000
 82e:	ff00                	.insn	2, 0xff00
 830:	ffff                	.insn	2, 0xffff
 832:	400810ff 00030800 	.insn	12, 0x00031c0000030800400810ff
 83a:	00031c00 
 83e:	0200                	.insn	2, 0x0200
 840:	3000                	.insn	2, 0x3000
 842:	1c9f 0003 6400      	.insn	6, 0x640000031c9f
 848:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
 84c:	5b00                	.insn	2, 0x5b00
	...
 856:	ffff                	.insn	2, 0xffff
 858:	ffff                	.insn	2, 0xffff
 85a:	0810                	.insn	2, 0x0810
 85c:	0040                	.insn	2, 0x0040
 85e:	0324                	.insn	2, 0x0324
 860:	0000                	.insn	2, 0x0000
 862:	0340                	.insn	2, 0x0340
 864:	0000                	.insn	2, 0x0000
 866:	0009                	.insn	2, 0x0009
 868:	0081                	.insn	2, 0x0081
 86a:	0078                	.insn	2, 0x0078
 86c:	111c                	.insn	2, 0x111c
 86e:	409f1b7f 44000003 	.insn	12, 0x0c00000344000003409f1b7f
 876:	0c000003 
 87a:	8100                	.insn	2, 0x8100
 87c:	7800                	.insn	2, 0x7800
 87e:	1c00                	.insn	2, 0x1c00
 880:	7f11                	.insn	2, 0x7f11
 882:	2201111b          	.insn	4, 0x2201111b
 886:	009f 0000 0000      	.insn	6, 0x009f
 88c:	0000                	.insn	2, 0x0000
 88e:	ff00                	.insn	2, 0xff00
 890:	ffff                	.insn	2, 0xffff
 892:	400810ff 00039800 	.insn	12, 0x00039c0000039800400810ff
 89a:	00039c00 
 89e:	0100                	.insn	2, 0x0100
 8a0:	5a00                	.insn	2, 0x5a00
 8a2:	039c                	.insn	2, 0x039c
 8a4:	0000                	.insn	2, 0x0000
 8a6:	03ac                	.insn	2, 0x03ac
 8a8:	0000                	.insn	2, 0x0000
 8aa:	0001                	.insn	2, 0x0001
 8ac:	0000005b          	.insn	4, 0x005b
 8b0:	0000                	.insn	2, 0x0000
 8b2:	0000                	.insn	2, 0x0000
 8b4:	ff00                	.insn	2, 0xff00
 8b6:	ffff                	.insn	2, 0xffff
 8b8:	400810ff 0003ac00 	.insn	12, 0x0003b0000003ac00400810ff
 8c0:	0003b000 
 8c4:	0100                	.insn	2, 0x0100
 8c6:	5a00                	.insn	2, 0x5a00
 8c8:	03b0                	.insn	2, 0x03b0
 8ca:	0000                	.insn	2, 0x0000
 8cc:	03c0                	.insn	2, 0x03c0
 8ce:	0000                	.insn	2, 0x0000
 8d0:	0001                	.insn	2, 0x0001
 8d2:	0000005b          	.insn	4, 0x005b
 8d6:	0000                	.insn	2, 0x0000
 8d8:	0000                	.insn	2, 0x0000
 8da:	ff00                	.insn	2, 0xff00
 8dc:	ffff                	.insn	2, 0xffff
 8de:	400810ff 0003c000 	.insn	12, 0x0003c8000003c000400810ff
 8e6:	0003c800 
 8ea:	0100                	.insn	2, 0x0100
 8ec:	5a00                	.insn	2, 0x5a00
	...
 8f6:	ffff                	.insn	2, 0xffff
 8f8:	ffff                	.insn	2, 0xffff
 8fa:	0810                	.insn	2, 0x0810
 8fc:	0040                	.insn	2, 0x0040
 8fe:	03d8                	.insn	2, 0x03d8
 900:	0000                	.insn	2, 0x0000
 902:	03e8                	.insn	2, 0x03e8
 904:	0000                	.insn	2, 0x0000
 906:	0001                	.insn	2, 0x0001
 908:	0003ec5b          	.insn	4, 0x0003ec5b
 90c:	fc00                	.insn	2, 0xfc00
 90e:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
 912:	5b00                	.insn	2, 0x5b00
	...
 91c:	ffff                	.insn	2, 0xffff
 91e:	ffff                	.insn	2, 0xffff
 920:	0810                	.insn	2, 0x0810
 922:	0040                	.insn	2, 0x0040
 924:	03d8                	.insn	2, 0x03d8
 926:	0000                	.insn	2, 0x0000
 928:	03ec                	.insn	2, 0x03ec
 92a:	0000                	.insn	2, 0x0000
 92c:	0001                	.insn	2, 0x0001
 92e:	ec5a                	.insn	2, 0xec5a
 930:	f8000003          	lb	zero,-128(zero) # ffffff80 <USER_MAX+0xffafff80>
 934:	01000003          	lb	zero,16(zero) # 10 <$d.2+0x10>
 938:	5e00                	.insn	2, 0x5e00
 93a:	03f8                	.insn	2, 0x03f8
 93c:	0000                	.insn	2, 0x0000
 93e:	0404                	.insn	2, 0x0404
 940:	0000                	.insn	2, 0x0000
 942:	0001                	.insn	2, 0x0001
 944:	005d                	.insn	2, 0x005d
 946:	0000                	.insn	2, 0x0000
 948:	0000                	.insn	2, 0x0000
 94a:	0000                	.insn	2, 0x0000
 94c:	ff00                	.insn	2, 0xff00
 94e:	ffff                	.insn	2, 0xffff
 950:	400810ff 00040c00 	.insn	12, 0x0004180000040c00400810ff
 958:	00041800 
 95c:	0100                	.insn	2, 0x0100
 95e:	5a00                	.insn	2, 0x5a00
 960:	0418                	.insn	2, 0x0418
 962:	0000                	.insn	2, 0x0000
 964:	0424                	.insn	2, 0x0424
 966:	0000                	.insn	2, 0x0000
 968:	7f7a0003          	lb	zero,2039(s4)
 96c:	249f 0004 3000      	.insn	6, 0x30000004249f
 972:	0004                	.insn	2, 0x0004
 974:	0100                	.insn	2, 0x0100
 976:	5a00                	.insn	2, 0x5a00
 978:	043c                	.insn	2, 0x043c
 97a:	0000                	.insn	2, 0x0000
 97c:	0440                	.insn	2, 0x0440
 97e:	0000                	.insn	2, 0x0000
 980:	0001                	.insn	2, 0x0001
 982:	005a                	.insn	2, 0x005a
 984:	0000                	.insn	2, 0x0000
 986:	0000                	.insn	2, 0x0000
 988:	0000                	.insn	2, 0x0000
 98a:	ff00                	.insn	2, 0xff00
 98c:	ffff                	.insn	2, 0xffff
 98e:	400810ff 00040c00 	.insn	12, 0x0004440000040c00400810ff
 996:	00044400 
 99a:	0100                	.insn	2, 0x0100
 99c:	5b00                	.insn	2, 0x5b00
	...
 9a6:	ffff                	.insn	2, 0xffff
 9a8:	ffff                	.insn	2, 0xffff
 9aa:	0810                	.insn	2, 0x0810
 9ac:	0040                	.insn	2, 0x0040
 9ae:	044c                	.insn	2, 0x044c
 9b0:	0000                	.insn	2, 0x0000
 9b2:	0488                	.insn	2, 0x0488
 9b4:	0000                	.insn	2, 0x0000
 9b6:	0001                	.insn	2, 0x0001
 9b8:	885a                	.insn	2, 0x885a
 9ba:	0004                	.insn	2, 0x0004
 9bc:	3400                	.insn	2, 0x3400
 9be:	01000007          	.insn	4, 0x01000007
 9c2:	6500                	.insn	2, 0x6500
	...
 9cc:	ffff                	.insn	2, 0xffff
 9ce:	ffff                	.insn	2, 0xffff
 9d0:	0810                	.insn	2, 0x0810
 9d2:	0040                	.insn	2, 0x0040
 9d4:	0524                	.insn	2, 0x0524
 9d6:	0000                	.insn	2, 0x0000
 9d8:	0544                	.insn	2, 0x0544
 9da:	0000                	.insn	2, 0x0000
 9dc:	0001                	.insn	2, 0x0001
 9de:	8858                	.insn	2, 0x8858
 9e0:	0006                	.insn	2, 0x0006
 9e2:	9c00                	.insn	2, 0x9c00
 9e4:	0006                	.insn	2, 0x0006
 9e6:	0100                	.insn	2, 0x0100
 9e8:	5800                	.insn	2, 0x5800
	...
 9f2:	ffff                	.insn	2, 0xffff
 9f4:	ffff                	.insn	2, 0xffff
 9f6:	0810                	.insn	2, 0x0810
 9f8:	0040                	.insn	2, 0x0040
 9fa:	0528                	.insn	2, 0x0528
 9fc:	0000                	.insn	2, 0x0000
 9fe:	0544                	.insn	2, 0x0544
 a00:	0000                	.insn	2, 0x0000
 a02:	0001                	.insn	2, 0x0001
 a04:	9c58                	.insn	2, 0x9c58
 a06:	0006                	.insn	2, 0x0006
 a08:	a800                	.insn	2, 0xa800
 a0a:	0006                	.insn	2, 0x0006
 a0c:	0100                	.insn	2, 0x0100
 a0e:	5800                	.insn	2, 0x5800
 a10:	06a8                	.insn	2, 0x06a8
 a12:	0000                	.insn	2, 0x0000
 a14:	06bc                	.insn	2, 0x06bc
 a16:	0000                	.insn	2, 0x0000
 a18:	0001                	.insn	2, 0x0001
 a1a:	bc59                	.insn	2, 0xbc59
 a1c:	0006                	.insn	2, 0x0006
 a1e:	0800                	.insn	2, 0x0800
 a20:	01000007          	.insn	4, 0x01000007
 a24:	5800                	.insn	2, 0x5800
	...
 a2e:	ffff                	.insn	2, 0xffff
 a30:	ffff                	.insn	2, 0xffff
 a32:	0810                	.insn	2, 0x0810
 a34:	0040                	.insn	2, 0x0040
 a36:	0528                	.insn	2, 0x0528
 a38:	0000                	.insn	2, 0x0000
 a3a:	0544                	.insn	2, 0x0544
 a3c:	0000                	.insn	2, 0x0000
 a3e:	00110003          	lb	zero,1(sp)
 a42:	9c9f 0006 a000      	.insn	6, 0xa00000069c9f
 a48:	0006                	.insn	2, 0x0006
 a4a:	0300                	.insn	2, 0x0300
 a4c:	1100                	.insn	2, 0x1100
 a4e:	9f00                	.insn	2, 0x9f00
 a50:	06a8                	.insn	2, 0x06a8
 a52:	0000                	.insn	2, 0x0000
 a54:	06d4                	.insn	2, 0x06d4
 a56:	0000                	.insn	2, 0x0000
 a58:	0001                	.insn	2, 0x0001
 a5a:	d464                	.insn	2, 0xd464
 a5c:	0006                	.insn	2, 0x0006
 a5e:	e400                	.insn	2, 0xe400
 a60:	0006                	.insn	2, 0x0006
 a62:	0100                	.insn	2, 0x0100
 a64:	5a00                	.insn	2, 0x5a00
	...
 a6e:	ffff                	.insn	2, 0xffff
 a70:	ffff                	.insn	2, 0xffff
 a72:	0810                	.insn	2, 0x0810
 a74:	0040                	.insn	2, 0x0040
 a76:	055c                	.insn	2, 0x055c
 a78:	0000                	.insn	2, 0x0000
 a7a:	0574                	.insn	2, 0x0574
 a7c:	0000                	.insn	2, 0x0000
 a7e:	07110003          	lb	zero,113(sp)
 a82:	749f 0005 9000      	.insn	6, 0x90000005749f
 a88:	0005                	.insn	2, 0x0005
 a8a:	0300                	.insn	2, 0x0300
 a8c:	1100                	.insn	2, 0x1100
 a8e:	9f06                	.insn	2, 0x9f06
 a90:	0590                	.insn	2, 0x0590
 a92:	0000                	.insn	2, 0x0000
 a94:	05ac                	.insn	2, 0x05ac
 a96:	0000                	.insn	2, 0x0000
 a98:	05110003          	lb	zero,81(sp)
 a9c:	ac9f 0005 c800      	.insn	6, 0xc8000005ac9f
 aa2:	0005                	.insn	2, 0x0005
 aa4:	0300                	.insn	2, 0x0300
 aa6:	1100                	.insn	2, 0x1100
 aa8:	9f04                	.insn	2, 0x9f04
 aaa:	05c8                	.insn	2, 0x05c8
 aac:	0000                	.insn	2, 0x0000
 aae:	05e4                	.insn	2, 0x05e4
 ab0:	0000                	.insn	2, 0x0000
 ab2:	03110003          	lb	zero,49(sp)
 ab6:	e49f 0005 0000      	.insn	6, 0x0005e49f
 abc:	0006                	.insn	2, 0x0006
 abe:	0300                	.insn	2, 0x0300
 ac0:	1100                	.insn	2, 0x1100
 ac2:	9f02                	.insn	2, 0x9f02
 ac4:	0600                	.insn	2, 0x0600
 ac6:	0000                	.insn	2, 0x0000
 ac8:	061c                	.insn	2, 0x061c
 aca:	0000                	.insn	2, 0x0000
 acc:	01110003          	lb	zero,17(sp)
 ad0:	1c9f 0006 3400      	.insn	6, 0x340000061c9f
 ad6:	0006                	.insn	2, 0x0006
 ad8:	0300                	.insn	2, 0x0300
 ada:	1100                	.insn	2, 0x1100
 adc:	9f00                	.insn	2, 0x9f00
 ade:	0634                	.insn	2, 0x0634
 ae0:	0000                	.insn	2, 0x0000
 ae2:	063c                	.insn	2, 0x063c
 ae4:	0000                	.insn	2, 0x0000
 ae6:	7f110003          	lb	zero,2033(sp)
 aea:	009f 0000 0000      	.insn	6, 0x009f
 af0:	0000                	.insn	2, 0x0000
 af2:	ff00                	.insn	2, 0xff00
 af4:	ffff                	.insn	2, 0xffff
 af6:	400810ff 00055c00 	.insn	12, 0x0006200000055c00400810ff
 afe:	00062000 
 b02:	0100                	.insn	2, 0x0100
 b04:	5b00                	.insn	2, 0x5b00
	...
 b0e:	ffff                	.insn	2, 0xffff
 b10:	ffff                	.insn	2, 0xffff
 b12:	0810                	.insn	2, 0x0810
 b14:	0040                	.insn	2, 0x0040
 b16:	0560                	.insn	2, 0x0560
 b18:	0000                	.insn	2, 0x0000
 b1a:	0564                	.insn	2, 0x0564
 b1c:	0000                	.insn	2, 0x0000
 b1e:	0001                	.insn	2, 0x0001
 b20:	7c5a                	.insn	2, 0x7c5a
 b22:	0005                	.insn	2, 0x0005
 b24:	8000                	.insn	2, 0x8000
 b26:	0005                	.insn	2, 0x0005
 b28:	0100                	.insn	2, 0x0100
 b2a:	5a00                	.insn	2, 0x5a00
 b2c:	0598                	.insn	2, 0x0598
 b2e:	0000                	.insn	2, 0x0000
 b30:	059c                	.insn	2, 0x059c
 b32:	0000                	.insn	2, 0x0000
 b34:	0001                	.insn	2, 0x0001
 b36:	b45a                	.insn	2, 0xb45a
 b38:	0005                	.insn	2, 0x0005
 b3a:	b800                	.insn	2, 0xb800
 b3c:	0005                	.insn	2, 0x0005
 b3e:	0100                	.insn	2, 0x0100
 b40:	5a00                	.insn	2, 0x5a00
 b42:	05d0                	.insn	2, 0x05d0
 b44:	0000                	.insn	2, 0x0000
 b46:	05d4                	.insn	2, 0x05d4
 b48:	0000                	.insn	2, 0x0000
 b4a:	0001                	.insn	2, 0x0001
 b4c:	ec5a                	.insn	2, 0xec5a
 b4e:	0005                	.insn	2, 0x0005
 b50:	f000                	.insn	2, 0xf000
 b52:	0005                	.insn	2, 0x0005
 b54:	0100                	.insn	2, 0x0100
 b56:	5a00                	.insn	2, 0x5a00
 b58:	0608                	.insn	2, 0x0608
 b5a:	0000                	.insn	2, 0x0000
 b5c:	060c                	.insn	2, 0x060c
 b5e:	0000                	.insn	2, 0x0000
 b60:	0001                	.insn	2, 0x0001
 b62:	205a                	.insn	2, 0x205a
 b64:	0006                	.insn	2, 0x0006
 b66:	2400                	.insn	2, 0x2400
 b68:	0006                	.insn	2, 0x0006
 b6a:	0100                	.insn	2, 0x0100
 b6c:	5b00                	.insn	2, 0x5b00
	...
 b76:	ffff                	.insn	2, 0xffff
 b78:	ffff                	.insn	2, 0xffff
 b7a:	0810                	.insn	2, 0x0810
 b7c:	0040                	.insn	2, 0x0040
 b7e:	0660                	.insn	2, 0x0660
 b80:	0000                	.insn	2, 0x0000
 b82:	066c                	.insn	2, 0x066c
 b84:	0000                	.insn	2, 0x0000
 b86:	0001                	.insn	2, 0x0001
 b88:	6c5c                	.insn	2, 0x6c5c
 b8a:	0006                	.insn	2, 0x0006
 b8c:	7800                	.insn	2, 0x7800
 b8e:	0006                	.insn	2, 0x0006
 b90:	0300                	.insn	2, 0x0300
 b92:	7c00                	.insn	2, 0x7c00
 b94:	06789f7f 06800000 	.insn	12, 0x000100000680000006789f7f
 b9c:	00010000 
 ba0:	005c                	.insn	2, 0x005c
 ba2:	0000                	.insn	2, 0x0000
 ba4:	0000                	.insn	2, 0x0000
 ba6:	0000                	.insn	2, 0x0000
 ba8:	ff00                	.insn	2, 0xff00
 baa:	ffff                	.insn	2, 0xffff
 bac:	400810ff 00075400 	.insn	12, 0x0007780000075400400810ff
 bb4:	00077800 
 bb8:	0100                	.insn	2, 0x0100
 bba:	5a00                	.insn	2, 0x5a00
 bbc:	0778                	.insn	2, 0x0778
 bbe:	0000                	.insn	2, 0x0000
 bc0:	07c8                	.insn	2, 0x07c8
 bc2:	0000                	.insn	2, 0x0000
 bc4:	0001                	.insn	2, 0x0001
 bc6:	0007c85b          	.insn	4, 0x0007c85b
 bca:	1c00                	.insn	2, 0x1c00
 bcc:	0008                	.insn	2, 0x0008
 bce:	0100                	.insn	2, 0x0100
 bd0:	5900                	.insn	2, 0x5900
	...
 bda:	ffff                	.insn	2, 0xffff
 bdc:	ffff                	.insn	2, 0xffff
 bde:	0810                	.insn	2, 0x0810
 be0:	0040                	.insn	2, 0x0040
 be2:	0778                	.insn	2, 0x0778
 be4:	0000                	.insn	2, 0x0000
 be6:	0798                	.insn	2, 0x0798
 be8:	0000                	.insn	2, 0x0000
 bea:	0002                	.insn	2, 0x0002
 bec:	9f3a                	.insn	2, 0x9f3a
 bee:	0798                	.insn	2, 0x0798
 bf0:	0000                	.insn	2, 0x0000
 bf2:	07a4                	.insn	2, 0x07a4
 bf4:	0000                	.insn	2, 0x0000
 bf6:	0002                	.insn	2, 0x0002
 bf8:	9f40                	.insn	2, 0x9f40
 bfa:	07a4                	.insn	2, 0x07a4
 bfc:	0000                	.insn	2, 0x0000
 bfe:	07b0                	.insn	2, 0x07b0
 c00:	0000                	.insn	2, 0x0000
 c02:	0001                	.insn	2, 0x0001
 c04:	b058                	.insn	2, 0xb058
 c06:	b4000007          	.insn	4, 0xb4000007
 c0a:	02000007          	.insn	4, 0x02000007
 c0e:	3a00                	.insn	2, 0x3a00
 c10:	009f 0000 0000      	.insn	6, 0x009f
 c16:	0000                	.insn	2, 0x0000
 c18:	ff00                	.insn	2, 0xff00
 c1a:	ffff                	.insn	2, 0xffff
 c1c:	400810ff 0007a400 	.insn	12, 0x0007b0000007a400400810ff
 c24:	0007b000 
 c28:	0200                	.insn	2, 0x0200
 c2a:	3000                	.insn	2, 0x3000
 c2c:	c89f 0007 1000      	.insn	6, 0x10000007c89f
 c32:	0008                	.insn	2, 0x0008
 c34:	0100                	.insn	2, 0x0100
 c36:	5a00                	.insn	2, 0x5a00
 c38:	0818                	.insn	2, 0x0818
 c3a:	0000                	.insn	2, 0x0000
 c3c:	0844                	.insn	2, 0x0844
 c3e:	0000                	.insn	2, 0x0000
 c40:	0001                	.insn	2, 0x0001
 c42:	005a                	.insn	2, 0x005a
 c44:	0000                	.insn	2, 0x0000
 c46:	0000                	.insn	2, 0x0000
 c48:	0000                	.insn	2, 0x0000
 c4a:	ff00                	.insn	2, 0xff00
 c4c:	ffff                	.insn	2, 0xffff
 c4e:	400810ff 0007c800 	.insn	12, 0x000810000007c800400810ff
 c56:	00081000 
 c5a:	0100                	.insn	2, 0x0100
 c5c:	5c00                	.insn	2, 0x5c00
	...
 c66:	ffff                	.insn	2, 0xffff
 c68:	ffff                	.insn	2, 0xffff
 c6a:	0810                	.insn	2, 0x0810
 c6c:	0040                	.insn	2, 0x0040
 c6e:	0800                	.insn	2, 0x0800
 c70:	0000                	.insn	2, 0x0000
 c72:	0820                	.insn	2, 0x0820
 c74:	0000                	.insn	2, 0x0000
 c76:	0001                	.insn	2, 0x0001
 c78:	0065                	.insn	2, 0x0065
 c7a:	0000                	.insn	2, 0x0000
 c7c:	0000                	.insn	2, 0x0000
 c7e:	0000                	.insn	2, 0x0000
 c80:	ff00                	.insn	2, 0xff00
 c82:	ffff                	.insn	2, 0xffff
 c84:	400810ff 00084400 	.insn	12, 0x0008500000084400400810ff
 c8c:	00085000 
 c90:	0100                	.insn	2, 0x0100
 c92:	5a00                	.insn	2, 0x5a00
 c94:	0854                	.insn	2, 0x0854
 c96:	0000                	.insn	2, 0x0000
 c98:	086c                	.insn	2, 0x086c
 c9a:	0000                	.insn	2, 0x0000
 c9c:	0001                	.insn	2, 0x0001
 c9e:	6c5a                	.insn	2, 0x6c5a
 ca0:	0008                	.insn	2, 0x0008
 ca2:	b800                	.insn	2, 0xb800
 ca4:	0008                	.insn	2, 0x0008
 ca6:	0100                	.insn	2, 0x0100
 ca8:	5800                	.insn	2, 0x5800
	...
 cb2:	ffff                	.insn	2, 0xffff
 cb4:	ffff                	.insn	2, 0xffff
 cb6:	0810                	.insn	2, 0x0810
 cb8:	0040                	.insn	2, 0x0040
 cba:	086c                	.insn	2, 0x086c
 cbc:	0000                	.insn	2, 0x0000
 cbe:	087c                	.insn	2, 0x087c
 cc0:	0000                	.insn	2, 0x0000
 cc2:	0002                	.insn	2, 0x0002
 cc4:	9f32                	.insn	2, 0x9f32
 cc6:	087c                	.insn	2, 0x087c
 cc8:	0000                	.insn	2, 0x0000
 cca:	0890                	.insn	2, 0x0890
 ccc:	0000                	.insn	2, 0x0000
 cce:	0001                	.insn	2, 0x0001
 cd0:	9059                	.insn	2, 0x9059
 cd2:	0008                	.insn	2, 0x0008
 cd4:	9800                	.insn	2, 0x9800
 cd6:	0008                	.insn	2, 0x0008
 cd8:	0300                	.insn	2, 0x0300
 cda:	7900                	.insn	2, 0x7900
 cdc:	9f01                	.insn	2, 0x9f01
 cde:	0898                	.insn	2, 0x0898
 ce0:	0000                	.insn	2, 0x0000
 ce2:	08ac                	.insn	2, 0x08ac
 ce4:	0000                	.insn	2, 0x0000
 ce6:	0001                	.insn	2, 0x0001
 ce8:	0059                	.insn	2, 0x0059
 cea:	0000                	.insn	2, 0x0000
 cec:	0000                	.insn	2, 0x0000
 cee:	0000                	.insn	2, 0x0000
 cf0:	ff00                	.insn	2, 0xff00
 cf2:	ffff                	.insn	2, 0xffff
 cf4:	400810ff 0008d400 	.insn	12, 0x0008dc000008d400400810ff
 cfc:	0008dc00 
 d00:	0100                	.insn	2, 0x0100
 d02:	5b00                	.insn	2, 0x5b00
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
  46:	49001607          	.insn	4, 0x49001607
  4a:	3a0e0313          	addi	t1,t3,928
  4e:	000b3b0b          	.insn	4, 0x000b3b0b
  52:	0800                	.insn	2, 0x0800
  54:	012e                	.insn	2, 0x012e
  56:	0b3a0e03          	lb	t3,179(s4)
  5a:	19270b3b          	.insn	4, 0x19270b3b
  5e:	1349                	.insn	2, 0x1349
  60:	0b20193f 05090000 	.insn	8, 0x050900000b20193f
  68:	0300                	.insn	2, 0x0300
  6a:	3a0e                	.insn	2, 0x3a0e
  6c:	490b3b0b          	.insn	4, 0x490b3b0b
  70:	0a000013          	li	zero,160
  74:	0034                	.insn	2, 0x0034
  76:	0b3a0e03          	lb	t3,179(s4)
  7a:	13490b3b          	.insn	4, 0x13490b3b
  7e:	0000                	.insn	2, 0x0000
  80:	00010b0b          	.insn	4, 0x00010b0b
  84:	0c00                	.insn	2, 0x0c00
  86:	1349000f          	.insn	4, 0x1349000f
  8a:	0000                	.insn	2, 0x0000
  8c:	260d                	.insn	2, 0x260d
  8e:	4900                	.insn	2, 0x4900
  90:	0e000013          	li	zero,224
  94:	012e                	.insn	2, 0x012e
  96:	0111                	.insn	2, 0x0111
  98:	0612                	.insn	2, 0x0612
  9a:	1840                	.insn	2, 0x1840
  9c:	03194297          	auipc	t0,0x3194
  a0:	3a0e                	.insn	2, 0x3a0e
  a2:	270b3b0b          	.insn	4, 0x270b3b0b
  a6:	3f19                	.insn	2, 0x3f19
  a8:	0019                	.insn	2, 0x0019
  aa:	0f00                	.insn	2, 0x0f00
  ac:	0111010b          	.insn	4, 0x0111010b
  b0:	0612                	.insn	2, 0x0612
  b2:	0000                	.insn	2, 0x0000
  b4:	3410                	.insn	2, 0x3410
  b6:	0200                	.insn	2, 0x0200
  b8:	0318                	.insn	2, 0x0318
  ba:	3a0e                	.insn	2, 0x3a0e
  bc:	490b3b0b          	.insn	4, 0x490b3b0b
  c0:	11000013          	li	zero,272
  c4:	0034                	.insn	2, 0x0034
  c6:	1702                	.insn	2, 0x1702
  c8:	0b3a0e03          	lb	t3,179(s4)
  cc:	13490b3b          	.insn	4, 0x13490b3b
  d0:	0000                	.insn	2, 0x0000
  d2:	0a12                	.insn	2, 0x0a12
  d4:	0300                	.insn	2, 0x0300
  d6:	3a0e                	.insn	2, 0x3a0e
  d8:	110b3b0b          	.insn	4, 0x110b3b0b
  dc:	0001                	.insn	2, 0x0001
  de:	1300                	.insn	2, 0x1300
  e0:	1755010b          	.insn	4, 0x1755010b
  e4:	0000                	.insn	2, 0x0000
  e6:	1d14                	.insn	2, 0x1d14
  e8:	3101                	.insn	2, 0x3101
  ea:	58175513          	.insn	4, 0x58175513
  ee:	570b590b          	.insn	4, 0x570b590b
  f2:	1500000b          	.insn	4, 0x1500000b
  f6:	0005                	.insn	2, 0x0005
  f8:	1702                	.insn	2, 0x1702
  fa:	1331                	.insn	2, 0x1331
  fc:	0000                	.insn	2, 0x0000
  fe:	3416                	.insn	2, 0x3416
 100:	0200                	.insn	2, 0x0200
 102:	00133117          	auipc	sp,0x133
 106:	1700                	.insn	2, 0x1700
 108:	8289                	.insn	2, 0x8289
 10a:	0001                	.insn	2, 0x0001
 10c:	1331                	.insn	2, 0x1331
 10e:	0111                	.insn	2, 0x0111
 110:	0000                	.insn	2, 0x0000
 112:	2e18                	.insn	2, 0x2e18
 114:	0301                	.insn	2, 0x0301
 116:	3a0e                	.insn	2, 0x3a0e
 118:	270b3b0b          	.insn	4, 0x270b3b0b
 11c:	3c19                	.insn	2, 0x3c19
 11e:	3f19                	.insn	2, 0x3f19
 120:	0019                	.insn	2, 0x0019
 122:	1900                	.insn	2, 0x1900
 124:	0005                	.insn	2, 0x0005
 126:	1349                	.insn	2, 0x1349
 128:	0000                	.insn	2, 0x0000
 12a:	181a                	.insn	2, 0x181a
 12c:	0000                	.insn	2, 0x0000
 12e:	1b00                	.insn	2, 0x1b00
 130:	002e                	.insn	2, 0x002e
 132:	0b3a0e03          	lb	t3,179(s4)
 136:	19270b3b          	.insn	4, 0x19270b3b
 13a:	1349                	.insn	2, 0x1349
 13c:	193c                	.insn	2, 0x193c
 13e:	0000193f 03012e1c 	.insn	8, 0x03012e1c0000193f
 146:	3a0e                	.insn	2, 0x3a0e
 148:	270b3b0b          	.insn	4, 0x270b3b0b
 14c:	4919                	.insn	2, 0x4919
 14e:	3f193c13          	sltiu	s8,s2,1009
 152:	0019                	.insn	2, 0x0019
 154:	1d00                	.insn	2, 0x1d00
 156:	0005                	.insn	2, 0x0005
 158:	1702                	.insn	2, 0x1702
 15a:	0b3a0e03          	lb	t3,179(s4)
 15e:	13490b3b          	.insn	4, 0x13490b3b
 162:	0000                	.insn	2, 0x0000
 164:	891e                	.insn	2, 0x891e
 166:	0182                	.insn	2, 0x0182
 168:	3100                	.insn	2, 0x3100
 16a:	19429513          	.insn	4, 0x19429513
 16e:	0111                	.insn	2, 0x0111
 170:	0000                	.insn	2, 0x0000
 172:	2e1f 0300 3a0e      	.insn	6, 0x3a0e03002e1f
 178:	270b3b0b          	.insn	4, 0x270b3b0b
 17c:	3c19                	.insn	2, 0x3c19
 17e:	3f19                	.insn	2, 0x3f19
 180:	8719                	.insn	2, 0x8719
 182:	1901                	.insn	2, 0x1901
 184:	0000                	.insn	2, 0x0000
 186:	2e20                	.insn	2, 0x2e20
 188:	1101                	.insn	2, 0x1101
 18a:	1201                	.insn	2, 0x1201
 18c:	4006                	.insn	2, 0x4006
 18e:	9718                	.insn	2, 0x9718
 190:	1942                	.insn	2, 0x1942
 192:	1331                	.insn	2, 0x1331
 194:	0000                	.insn	2, 0x0000
 196:	0521                	.insn	2, 0x0521
 198:	0200                	.insn	2, 0x0200
 19a:	3118                	.insn	2, 0x3118
 19c:	00000013          	nop

000001a0 <$d.4>:
 1a0:	1101                	.insn	2, 0x1101
 1a2:	2501                	.insn	2, 0x2501
 1a4:	130e                	.insn	2, 0x130e
 1a6:	0305                	.insn	2, 0x0305
 1a8:	100e                	.insn	2, 0x100e
 1aa:	110e1b17          	auipc	s6,0x110e1
 1ae:	5501                	.insn	2, 0x5501
 1b0:	02000017          	auipc	zero,0x2000
 1b4:	0034                	.insn	2, 0x0034
 1b6:	1349                	.insn	2, 0x1349
 1b8:	0b3a                	.insn	2, 0x0b3a
 1ba:	1802053b          	.insn	4, 0x1802053b
 1be:	0000                	.insn	2, 0x0000
 1c0:	49010103          	lb	sp,1168(sp) # 133592 <$d.11+0x132eb2>
 1c4:	04000013          	li	zero,64
 1c8:	0021                	.insn	2, 0x0021
 1ca:	1349                	.insn	2, 0x1349
 1cc:	00000b37          	lui	s6,0x0
 1d0:	2405                	.insn	2, 0x2405
 1d2:	0300                	.insn	2, 0x0300
 1d4:	3e0e                	.insn	2, 0x3e0e
 1d6:	000b0b0b          	.insn	4, 0x000b0b0b
 1da:	0600                	.insn	2, 0x0600
 1dc:	0024                	.insn	2, 0x0024
 1de:	0b0b0e03          	lb	t3,176(s6) # b0 <$d.10+0x3c>
 1e2:	0b3e                	.insn	2, 0x0b3e
 1e4:	0000                	.insn	2, 0x0000
 1e6:	49001607          	.insn	4, 0x49001607
 1ea:	3a0e0313          	addi	t1,t3,928
 1ee:	00053b0b          	.insn	4, 0x00053b0b
 1f2:	0800                	.insn	2, 0x0800
 1f4:	0016                	.insn	2, 0x0016
 1f6:	1349                	.insn	2, 0x1349
 1f8:	0b3a0e03          	lb	t3,179(s4)
 1fc:	00000b3b          	.insn	4, 0x0b3b
 200:	0f09                	.insn	2, 0x0f09
 202:	4900                	.insn	2, 0x4900
 204:	0a000013          	li	zero,160
 208:	012e                	.insn	2, 0x012e
 20a:	0b3a0e03          	lb	t3,179(s4)
 20e:	19270b3b          	.insn	4, 0x19270b3b
 212:	1349                	.insn	2, 0x1349
 214:	0b20                	.insn	2, 0x0b20
 216:	0000                	.insn	2, 0x0000
 218:	0300050b          	.insn	4, 0x0300050b
 21c:	3a0e                	.insn	2, 0x3a0e
 21e:	490b3b0b          	.insn	4, 0x490b3b0b
 222:	0c000013          	li	zero,192
 226:	0034                	.insn	2, 0x0034
 228:	0b3a0e03          	lb	t3,179(s4)
 22c:	13490b3b          	.insn	4, 0x13490b3b
 230:	0000                	.insn	2, 0x0000
 232:	2e0d                	.insn	2, 0x2e0d
 234:	1101                	.insn	2, 0x1101
 236:	1201                	.insn	2, 0x1201
 238:	4006                	.insn	2, 0x4006
 23a:	9718                	.insn	2, 0x9718
 23c:	1942                	.insn	2, 0x1942
 23e:	0b3a0e03          	lb	t3,179(s4)
 242:	19270b3b          	.insn	4, 0x19270b3b
 246:	0187193f 0e000019 	.insn	8, 0x0e0000190187193f
 24e:	011d                	.insn	2, 0x011d
 250:	1331                	.insn	2, 0x1331
 252:	0111                	.insn	2, 0x0111
 254:	0612                	.insn	2, 0x0612
 256:	0b58                	.insn	2, 0x0b58
 258:	0b59                	.insn	2, 0x0b59
 25a:	00000b57          	.insn	4, 0x0b57
 25e:	1c00050f          	.insn	4, 0x1c00050f
 262:	310d                	.insn	2, 0x310d
 264:	10000013          	li	zero,256
 268:	0034                	.insn	2, 0x0034
 26a:	1702                	.insn	2, 0x1702
 26c:	1331                	.insn	2, 0x1331
 26e:	0000                	.insn	2, 0x0000
 270:	3411                	.insn	2, 0x3411
 272:	1c00                	.insn	2, 0x1c00
 274:	310d                	.insn	2, 0x310d
 276:	12000013          	li	zero,288
 27a:	012e                	.insn	2, 0x012e
 27c:	0b3a0e03          	lb	t3,179(s4)
 280:	1927053b          	.insn	4, 0x1927053b
 284:	1349                	.insn	2, 0x1349
 286:	0b20                	.insn	2, 0x0b20
 288:	0000                	.insn	2, 0x0000
 28a:	03000513          	li	a0,48
 28e:	3a0e                	.insn	2, 0x3a0e
 290:	49053b0b          	.insn	4, 0x49053b0b
 294:	14000013          	li	zero,320
 298:	0034                	.insn	2, 0x0034
 29a:	0b3a0e03          	lb	t3,179(s4)
 29e:	1349053b          	.insn	4, 0x1349053b
 2a2:	0000                	.insn	2, 0x0000
 2a4:	2e15                	.insn	2, 0x2e15
 2a6:	0301                	.insn	2, 0x0301
 2a8:	3a0e                	.insn	2, 0x3a0e
 2aa:	27053b0b          	.insn	4, 0x27053b0b
 2ae:	3f19                	.insn	2, 0x3f19
 2b0:	2019                	.insn	2, 0x2019
 2b2:	1600000b          	.insn	4, 0x1600000b
 2b6:	012e                	.insn	2, 0x012e
 2b8:	0111                	.insn	2, 0x0111
 2ba:	0612                	.insn	2, 0x0612
 2bc:	1840                	.insn	2, 0x1840
 2be:	03194297          	auipc	t0,0x3194
 2c2:	3a0e                	.insn	2, 0x3a0e
 2c4:	270b3b0b          	.insn	4, 0x270b3b0b
 2c8:	3f19                	.insn	2, 0x3f19
 2ca:	0019                	.insn	2, 0x0019
 2cc:	1700                	.insn	2, 0x1700
 2ce:	0005                	.insn	2, 0x0005
 2d0:	1702                	.insn	2, 0x1702
 2d2:	0b3a0e03          	lb	t3,179(s4)
 2d6:	13490b3b          	.insn	4, 0x13490b3b
 2da:	0000                	.insn	2, 0x0000
 2dc:	3418                	.insn	2, 0x3418
 2de:	0200                	.insn	2, 0x0200
 2e0:	0318                	.insn	2, 0x0318
 2e2:	3a0e                	.insn	2, 0x3a0e
 2e4:	490b3b0b          	.insn	4, 0x490b3b0b
 2e8:	19000013          	li	zero,400
 2ec:	0111010b          	.insn	4, 0x0111010b
 2f0:	0612                	.insn	2, 0x0612
 2f2:	0000                	.insn	2, 0x0000
 2f4:	341a                	.insn	2, 0x341a
 2f6:	0200                	.insn	2, 0x0200
 2f8:	3a0e0317          	auipc	t1,0x3a0e0
 2fc:	490b3b0b          	.insn	4, 0x490b3b0b
 300:	1b000013          	li	zero,432
 304:	011d                	.insn	2, 0x011d
 306:	1331                	.insn	2, 0x1331
 308:	1755                	.insn	2, 0x1755
 30a:	0b58                	.insn	2, 0x0b58
 30c:	0b59                	.insn	2, 0x0b59
 30e:	00000b57          	.insn	4, 0x0b57
 312:	051c                	.insn	2, 0x051c
 314:	0200                	.insn	2, 0x0200
 316:	00133117          	auipc	sp,0x133
 31a:	1d00                	.insn	2, 0x1d00
 31c:	0005                	.insn	2, 0x0005
 31e:	1802                	.insn	2, 0x1802
 320:	1331                	.insn	2, 0x1331
 322:	0000                	.insn	2, 0x0000
 324:	051e                	.insn	2, 0x051e
 326:	1c00                	.insn	2, 0x1c00
 328:	0013310f          	.insn	4, 0x0013310f
 32c:	1f00                	.insn	2, 0x1f00
 32e:	012e                	.insn	2, 0x012e
 330:	0111                	.insn	2, 0x0111
 332:	0612                	.insn	2, 0x0612
 334:	1840                	.insn	2, 0x1840
 336:	31194297          	auipc	t0,0x31194
 33a:	20000013          	li	zero,512
 33e:	0034                	.insn	2, 0x0034
 340:	1802                	.insn	2, 0x1802
 342:	1331                	.insn	2, 0x1331
 344:	0000                	.insn	2, 0x0000
 346:	3421                	.insn	2, 0x3421
 348:	1c00                	.insn	2, 0x1c00
 34a:	0013310f          	.insn	4, 0x0013310f
 34e:	2200                	.insn	2, 0x2200
 350:	012e                	.insn	2, 0x012e
 352:	0b3a0e03          	lb	t3,179(s4)
 356:	1927053b          	.insn	4, 0x1927053b
 35a:	0b20                	.insn	2, 0x0b20
 35c:	0000                	.insn	2, 0x0000
 35e:	02000523          	sb	zero,42(zero) # 2a <$d.3+0x2a>
 362:	0318                	.insn	2, 0x0318
 364:	3a0e                	.insn	2, 0x3a0e
 366:	490b3b0b          	.insn	4, 0x490b3b0b
 36a:	24000013          	li	zero,576
 36e:	012e                	.insn	2, 0x012e
 370:	0111                	.insn	2, 0x0111
 372:	0612                	.insn	2, 0x0612
 374:	1840                	.insn	2, 0x1840
 376:	03194297          	auipc	t0,0x3194
 37a:	3a0e                	.insn	2, 0x3a0e
 37c:	270b3b0b          	.insn	4, 0x270b3b0b
 380:	4919                	.insn	2, 0x4919
 382:	00193f13          	seqz	t5,s2
 386:	2500                	.insn	2, 0x2500
 388:	000a                	.insn	2, 0x000a
 38a:	0b3a0e03          	lb	t3,179(s4)
 38e:	0111053b          	.insn	4, 0x0111053b
 392:	0000                	.insn	2, 0x0000
 394:	0b26                	.insn	2, 0x0b26
 396:	5501                	.insn	2, 0x5501
 398:	27000017          	auipc	zero,0x27000
 39c:	0034                	.insn	2, 0x0034
 39e:	1802                	.insn	2, 0x1802
 3a0:	0b3a0e03          	lb	t3,179(s4)
 3a4:	1349053b          	.insn	4, 0x1349053b
 3a8:	0000                	.insn	2, 0x0000
 3aa:	3428                	.insn	2, 0x3428
 3ac:	0200                	.insn	2, 0x0200
 3ae:	3a0e0317          	auipc	t1,0x3a0e0
 3b2:	49053b0b          	.insn	4, 0x49053b0b
 3b6:	29000013          	li	zero,656
 3ba:	011d                	.insn	2, 0x011d
 3bc:	1331                	.insn	2, 0x1331
 3be:	0111                	.insn	2, 0x0111
 3c0:	0612                	.insn	2, 0x0612
 3c2:	0b58                	.insn	2, 0x0b58
 3c4:	0559                	.insn	2, 0x0559
 3c6:	00000b57          	.insn	4, 0x0b57
 3ca:	1d2a                	.insn	2, 0x1d2a
 3cc:	3100                	.insn	2, 0x3100
 3ce:	12011113          	.insn	4, 0x12011113
 3d2:	5806                	.insn	2, 0x5806
 3d4:	5705590b          	.insn	4, 0x5705590b
 3d8:	2b00000b          	.insn	4, 0x2b00000b
 3dc:	001d                	.insn	2, 0x001d
 3de:	1331                	.insn	2, 0x1331
 3e0:	1755                	.insn	2, 0x1755
 3e2:	0b58                	.insn	2, 0x0b58
 3e4:	0559                	.insn	2, 0x0559
 3e6:	00000b57          	.insn	4, 0x0b57
 3ea:	182c                	.insn	2, 0x182c
 3ec:	0000                	.insn	2, 0x0000
 3ee:	2d00                	.insn	2, 0x2d00
 3f0:	012e                	.insn	2, 0x012e
 3f2:	0111                	.insn	2, 0x0111
 3f4:	0612                	.insn	2, 0x0612
 3f6:	1840                	.insn	2, 0x1840
 3f8:	03194297          	auipc	t0,0x3194
 3fc:	3a0e                	.insn	2, 0x3a0e
 3fe:	27053b0b          	.insn	4, 0x27053b0b
 402:	4919                	.insn	2, 0x4919
 404:	00193f13          	seqz	t5,s2
 408:	2e00                	.insn	2, 0x2e00
 40a:	0005                	.insn	2, 0x0005
 40c:	1702                	.insn	2, 0x1702
 40e:	0b3a0e03          	lb	t3,179(s4)
 412:	1349053b          	.insn	4, 0x1349053b
 416:	0000                	.insn	2, 0x0000
 418:	11002e2f          	.insn	4, 0x11002e2f
 41c:	1201                	.insn	2, 0x1201
 41e:	4006                	.insn	2, 0x4006
 420:	9718                	.insn	2, 0x9718
 422:	1942                	.insn	2, 0x1942
 424:	0b3a0e03          	lb	t3,179(s4)
 428:	1927053b          	.insn	4, 0x1927053b
 42c:	0000193f 49002630 	.insn	8, 0x490026300000193f
 434:	31000013          	li	zero,784
 438:	0016                	.insn	2, 0x0016
 43a:	1349                	.insn	2, 0x1349
 43c:	00000e03          	lb	t3,0(zero) # 0 <$d.3>
 440:	0f32                	.insn	2, 0x0f32
 442:	0000                	.insn	2, 0x0000
	...

セクション .debug_info の逆アセンブル:

00000000 <$d.4>:
       0:	000006bb          	.insn	4, 0x06bb
       4:	0004                	.insn	2, 0x0004
       6:	0000                	.insn	2, 0x0000
       8:	0000                	.insn	2, 0x0000
       a:	0104                	.insn	2, 0x0104
       c:	00b4                	.insn	2, 0x00b4
       e:	0000                	.insn	2, 0x0000
      10:	001d                	.insn	2, 0x001d
      12:	0106                	.insn	2, 0x0106
      14:	0000                	.insn	2, 0x0000
      16:	0000                	.insn	2, 0x0000
      18:	0000                	.insn	2, 0x0000
      1a:	0144                	.insn	2, 0x0144
      1c:	0000                	.insn	2, 0x0000
      1e:	001c                	.insn	2, 0x001c
      20:	0040                	.insn	2, 0x0040
      22:	07f4                	.insn	2, 0x07f4
      24:	0000                	.insn	2, 0x0000
      26:	3302                	.insn	2, 0x3302
      28:	0000                	.insn	2, 0x0000
      2a:	0100                	.insn	2, 0x0100
      2c:	050e                	.insn	2, 0x050e
      2e:	40131f03          	lh	t5,1025(t1) # 3a0e07af <USER_MAX+0x39be07af>
      32:	0300                	.insn	2, 0x0300
      34:	0000003f 00004604 	.insn	8, 0x46040000003f
      3c:	0e00                	.insn	2, 0x0e00
      3e:	0500                	.insn	2, 0x0500
      40:	0000012f          	.insn	4, 0x012f
      44:	0108                	.insn	2, 0x0108
      46:	b706                	.insn	2, 0xb706
      48:	0001                	.insn	2, 0x0001
      4a:	0800                	.insn	2, 0x0800
      4c:	005a0207          	.insn	4, 0x005a0207
      50:	0000                	.insn	2, 0x0000
      52:	7201                	.insn	2, 0x7201
      54:	0305                	.insn	2, 0x0305
      56:	00401307          	.insn	4, 0x00401307
      5a:	00003f03          	.insn	4, 0x3f03
      5e:	0400                	.insn	2, 0x0400
      60:	0046                	.insn	2, 0x0046
      62:	0000                	.insn	2, 0x0000
      64:	0006                	.insn	2, 0x0006
      66:	7302                	.insn	2, 0x7302
      68:	0000                	.insn	2, 0x0000
      6a:	0100                	.insn	2, 0x0100
      6c:	af030573          	.insn	4, 0xaf030573
      70:	4012                	.insn	2, 0x4012
      72:	0300                	.insn	2, 0x0300
      74:	0000003f 00004604 	.insn	8, 0x46040000003f
      7c:	1900                	.insn	2, 0x1900
      7e:	0200                	.insn	2, 0x0200
      80:	008c                	.insn	2, 0x008c
      82:	0000                	.insn	2, 0x0000
      84:	7601                	.insn	2, 0x7601
      86:	0305                	.insn	2, 0x0305
      88:	132d                	.insn	2, 0x132d
      8a:	0040                	.insn	2, 0x0040
      8c:	00003f03          	.insn	4, 0x3f03
      90:	0400                	.insn	2, 0x0400
      92:	0046                	.insn	2, 0x0046
      94:	0000                	.insn	2, 0x0000
      96:	0005                	.insn	2, 0x0005
      98:	a502                	.insn	2, 0xa502
      9a:	0000                	.insn	2, 0x0000
      9c:	0100                	.insn	2, 0x0100
      9e:	c8030593          	addi	a1,t1,-896
      a2:	4012                	.insn	2, 0x4012
      a4:	0300                	.insn	2, 0x0300
      a6:	0000003f 00004604 	.insn	8, 0x46040000003f
      ae:	0700                	.insn	2, 0x0700
      b0:	0200                	.insn	2, 0x0200
      b2:	00be                	.insn	2, 0x00be
      b4:	0000                	.insn	2, 0x0000
      b6:	9801                	.insn	2, 0x9801
      b8:	0305                	.insn	2, 0x0305
      ba:	1360                	.insn	2, 0x1360
      bc:	0040                	.insn	2, 0x0040
      be:	00003f03          	.insn	4, 0x3f03
      c2:	0400                	.insn	2, 0x0400
      c4:	0046                	.insn	2, 0x0046
      c6:	0000                	.insn	2, 0x0000
      c8:	001a                	.insn	2, 0x001a
      ca:	d702                	.insn	2, 0xd702
      cc:	0000                	.insn	2, 0x0000
      ce:	0100                	.insn	2, 0x0100
      d0:	059f fe03 4012      	.insn	6, 0x4012fe03059f
      d6:	0300                	.insn	2, 0x0300
      d8:	0000003f 00004604 	.insn	8, 0x46040000003f
      e0:	0900                	.insn	2, 0x0900
      e2:	0200                	.insn	2, 0x0200
      e4:	00f0                	.insn	2, 0x00f0
      e6:	0000                	.insn	2, 0x0000
      e8:	a401                	.insn	2, 0xa401
      ea:	0305                	.insn	2, 0x0305
      ec:	1294                	.insn	2, 0x1294
      ee:	0040                	.insn	2, 0x0040
      f0:	00003f03          	.insn	4, 0x3f03
      f4:	0400                	.insn	2, 0x0400
      f6:	0046                	.insn	2, 0x0046
      f8:	0000                	.insn	2, 0x0000
      fa:	09020013          	addi	zero,tp,144 # 90 <$d.10+0x1c>
      fe:	0001                	.insn	2, 0x0001
     100:	0100                	.insn	2, 0x0100
     102:	05ac                	.insn	2, 0x05ac
     104:	4012a703          	lw	a4,1025(t0) # 31947f9 <USER_MAX+0x2c947f9>
     108:	0300                	.insn	2, 0x0300
     10a:	0000003f 00004604 	.insn	8, 0x46040000003f
     112:	0800                	.insn	2, 0x0800
     114:	0200                	.insn	2, 0x0200
     116:	00000073          	ecall
     11a:	ae01                	.insn	2, 0xae01
     11c:	0305                	.insn	2, 0x0305
     11e:	00401347          	.insn	4, 0x00401347
     122:	8c02                	.insn	2, 0x8c02
     124:	0000                	.insn	2, 0x0000
     126:	0100                	.insn	2, 0x0100
     128:	05b6                	.insn	2, 0x05b6
     12a:	40131803          	lh	a6,1025(t1)
     12e:	0200                	.insn	2, 0x0200
     130:	013c                	.insn	2, 0x013c
     132:	0000                	.insn	2, 0x0000
     134:	b701                	.insn	2, 0xb701
     136:	0305                	.insn	2, 0x0305
     138:	130d                	.insn	2, 0x130d
     13a:	0040                	.insn	2, 0x0040
     13c:	00003f03          	.insn	4, 0x3f03
     140:	0400                	.insn	2, 0x0400
     142:	0046                	.insn	2, 0x0046
     144:	0000                	.insn	2, 0x0000
     146:	8c02000b          	.insn	4, 0x8c02000b
     14a:	0000                	.insn	2, 0x0000
     14c:	0100                	.insn	2, 0x0100
     14e:	05c1                	.insn	2, 0x05c1
     150:	40137f03          	.insn	4, 0x40137f03
     154:	0200                	.insn	2, 0x0200
     156:	008c                	.insn	2, 0x008c
     158:	0000                	.insn	2, 0x0000
     15a:	c201                	.insn	2, 0xc201
     15c:	0305                	.insn	2, 0x0305
     15e:	137a                	.insn	2, 0x137a
     160:	0040                	.insn	2, 0x0040
     162:	6f02                	.insn	2, 0x6f02
     164:	0001                	.insn	2, 0x0001
     166:	0100                	.insn	2, 0x0100
     168:	1d0305c3          	.insn	4, 0x1d0305c3
     16c:	03004013          	xori	zero,zero,48
     170:	0000003f 00004604 	.insn	8, 0x46040000003f
     178:	0200                	.insn	2, 0x0200
     17a:	0200                	.insn	2, 0x0200
     17c:	0188                	.insn	2, 0x0188
     17e:	0000                	.insn	2, 0x0000
     180:	c701                	.insn	2, 0xc701
     182:	0305                	.insn	2, 0x0305
     184:	004012cf          	.insn	4, 0x004012cf
     188:	00003f03          	.insn	4, 0x3f03
     18c:	0400                	.insn	2, 0x0400
     18e:	0046                	.insn	2, 0x0046
     190:	0000                	.insn	2, 0x0000
     192:	0015                	.insn	2, 0x0015
     194:	a102                	.insn	2, 0xa102
     196:	0001                	.insn	2, 0x0001
     198:	0100                	.insn	2, 0x0100
     19a:	05d1                	.insn	2, 0x05d1
     19c:	40133203          	.insn	4, 0x40133203
     1a0:	0300                	.insn	2, 0x0300
     1a2:	0000003f 00004604 	.insn	8, 0x46040000003f
     1aa:	0400                	.insn	2, 0x0400
     1ac:	0200                	.insn	2, 0x0200
     1ae:	00be                	.insn	2, 0x00be
     1b0:	0000                	.insn	2, 0x0000
     1b2:	da01                	.insn	2, 0xda01
     1b4:	0305                	.insn	2, 0x0305
     1b6:	12e4                	.insn	2, 0x12e4
     1b8:	0040                	.insn	2, 0x0040
     1ba:	3405                	.insn	2, 0x3405
     1bc:	0001                	.insn	2, 0x0001
     1be:	0500                	.insn	2, 0x0500
     1c0:	0704                	.insn	2, 0x0704
     1c2:	01cc                	.insn	2, 0x01cc
     1c4:	0000                	.insn	2, 0x0000
     1c6:	00fd                	.insn	2, 0x00fd
     1c8:	0000                	.insn	2, 0x0000
     1ca:	1102                	.insn	2, 0x1102
     1cc:	9705                	.insn	2, 0x9705
     1ce:	0001                	.insn	2, 0x0001
     1d0:	0700                	.insn	2, 0x0700
     1d2:	0804                	.insn	2, 0x0804
     1d4:	000001cb          	.insn	4, 0x01cb
     1d8:	de01                	.insn	2, 0xde01
     1da:	01ba                	.insn	2, 0x01ba
     1dc:	0000                	.insn	2, 0x0000
     1de:	0901                	.insn	2, 0x0901
     1e0:	000000ab          	.insn	4, 0x00ab
     1e4:	de01                	.insn	2, 0xde01
     1e6:	0219                	.insn	2, 0x0219
     1e8:	0000                	.insn	2, 0x0000
     1ea:	6409                	.insn	2, 0x6409
     1ec:	0000                	.insn	2, 0x0000
     1ee:	0100                	.insn	2, 0x0100
     1f0:	23de                	.insn	2, 0x23de
     1f2:	0002                	.insn	2, 0x0002
     1f4:	0a00                	.insn	2, 0x0a00
     1f6:	007e                	.insn	2, 0x007e
     1f8:	0000                	.insn	2, 0x0000
     1fa:	df01                	.insn	2, 0xdf01
     1fc:	0228                	.insn	2, 0x0228
     1fe:	0000                	.insn	2, 0x0000
     200:	009e0a0b          	.insn	4, 0x009e0a0b
     204:	0000                	.insn	2, 0x0000
     206:	e901                	.insn	2, 0xe901
     208:	0000003f 0001f70a 	.insn	8, 0x0001f70a0000003f
     210:	0100                	.insn	2, 0x0100
     212:	c1ea                	.insn	2, 0xc1ea
     214:	0001                	.insn	2, 0x0001
     216:	0000                	.insn	2, 0x0000
     218:	0c00                	.insn	2, 0x0c00
     21a:	021e                	.insn	2, 0x021e
     21c:	0000                	.insn	2, 0x0000
     21e:	3f0d                	.insn	2, 0x3f0d
     220:	0000                	.insn	2, 0x0000
     222:	0c00                	.insn	2, 0x0c00
     224:	0228                	.insn	2, 0x0228
     226:	0000                	.insn	2, 0x0000
     228:	0001c107          	.insn	4, 0x0001c107
     22c:	6800                	.insn	2, 0x6800
     22e:	0000                	.insn	2, 0x0000
     230:	0200                	.insn	2, 0x0200
     232:	0e14                	.insn	2, 0x0e14
     234:	001c                	.insn	2, 0x001c
     236:	0040                	.insn	2, 0x0040
     238:	066c                	.insn	2, 0x066c
     23a:	0000                	.insn	2, 0x0000
     23c:	5201                	.insn	2, 0x5201
     23e:	011c                	.insn	2, 0x011c
     240:	0000                	.insn	2, 0x0000
     242:	0401                	.insn	2, 0x0401
     244:	4001540f          	.insn	4, 0x4001540f
     248:	3400                	.insn	2, 0x3400
     24a:	0005                	.insn	2, 0x0005
     24c:	1000                	.insn	2, 0x1000
     24e:	00ec9103          	lh	sp,14(s9)
     252:	00a0                	.insn	2, 0x00a0
     254:	0000                	.insn	2, 0x0000
     256:	2501                	.insn	2, 0x2501
     258:	06a1                	.insn	2, 0x06a1
     25a:	0000                	.insn	2, 0x0000
     25c:	0310                	.insn	2, 0x0310
     25e:	cc91                	.insn	2, 0xcc91
     260:	3800                	.insn	2, 0x3800
     262:	0001                	.insn	2, 0x0001
     264:	0100                	.insn	2, 0x0100
     266:	ad5e                	.insn	2, 0xad5e
     268:	0006                	.insn	2, 0x0006
     26a:	1100                	.insn	2, 0x1100
     26c:	0000                	.insn	2, 0x0000
     26e:	0000                	.insn	2, 0x0000
     270:	01a4                	.insn	2, 0x01a4
     272:	0000                	.insn	2, 0x0000
     274:	5f01                	.insn	2, 0x5f01
     276:	01ba                	.insn	2, 0x01ba
     278:	0000                	.insn	2, 0x0000
     27a:	3611                	.insn	2, 0x3611
     27c:	0000                	.insn	2, 0x0000
     27e:	1800                	.insn	2, 0x1800
     280:	0000                	.insn	2, 0x0000
     282:	0100                	.insn	2, 0x0100
     284:	ba26                	.insn	2, 0xba26
     286:	0001                	.insn	2, 0x0001
     288:	1100                	.insn	2, 0x1100
     28a:	007f 0000 0031 0000 	.insn	10, 0x6201000000310000007f
     292:	6201 
     294:	06b9                	.insn	2, 0x06b9
     296:	0000                	.insn	2, 0x0000
     298:	5b12                	.insn	2, 0x5b12
     29a:	0000                	.insn	2, 0x0000
     29c:	0100                	.insn	2, 0x0100
     29e:	6014                	.insn	2, 0x6014
     2a0:	4001                	.insn	2, 0x4001
     2a2:	1300                	.insn	2, 0x1300
     2a4:	0000                	.insn	2, 0x0000
     2a6:	0000                	.insn	2, 0x0000
     2a8:	6611                	.insn	2, 0x6611
     2aa:	0002                	.insn	2, 0x0002
     2ac:	2c00                	.insn	2, 0x2c00
     2ae:	0002                	.insn	2, 0x0002
     2b0:	0100                	.insn	2, 0x0100
     2b2:	ccb2                	.insn	2, 0xccb2
     2b4:	0001                	.insn	2, 0x0001
     2b6:	0000                	.insn	2, 0x0000
     2b8:	4004980f          	.insn	4, 0x4004980f
     2bc:	2800                	.insn	2, 0x2800
     2be:	0000                	.insn	2, 0x0000
     2c0:	1100                	.insn	2, 0x1100
     2c2:	0000023b          	.insn	4, 0x023b
     2c6:	0038                	.insn	2, 0x0038
     2c8:	0000                	.insn	2, 0x0000
     2ca:	a001                	.insn	2, 0xa001
     2cc:	01c1                	.insn	2, 0x01c1
     2ce:	0000                	.insn	2, 0x0000
     2d0:	1300                	.insn	2, 0x1300
     2d2:	0018                	.insn	2, 0x0018
     2d4:	0000                	.insn	2, 0x0000
     2d6:	0411                	.insn	2, 0x0411
     2d8:	0002                	.insn	2, 0x0002
     2da:	db00                	.insn	2, 0xdb00
     2dc:	0000                	.insn	2, 0x0000
     2de:	0100                	.insn	2, 0x0100
     2e0:	cc94                	.insn	2, 0xcc94
     2e2:	0001                	.insn	2, 0x0001
     2e4:	0000                	.insn	2, 0x0000
     2e6:	00003013          	sltiu	zero,zero,0
     2ea:	1100                	.insn	2, 0x1100
     2ec:	00b8                	.insn	2, 0x00b8
     2ee:	0000                	.insn	2, 0x0000
     2f0:	00000033          	add	zero,zero,zero
     2f4:	7801                	.insn	2, 0x7801
     2f6:	01c1                	.insn	2, 0x01c1
     2f8:	0000                	.insn	2, 0x0000
     2fa:	0611                	.insn	2, 0x0611
     2fc:	0001                	.insn	2, 0x0001
     2fe:	1800                	.insn	2, 0x1800
     300:	0000                	.insn	2, 0x0000
     302:	0100                	.insn	2, 0x0100
     304:	c179                	.insn	2, 0xc179
     306:	0001                	.insn	2, 0x0001
     308:	0a00                	.insn	2, 0x0a00
     30a:	0188                	.insn	2, 0x0188
     30c:	0000                	.insn	2, 0x0000
     30e:	7a01                	.insn	2, 0x7a01
     310:	0228                	.insn	2, 0x0228
     312:	0000                	.insn	2, 0x0000
     314:	d314                	.insn	2, 0xd314
     316:	0001                	.insn	2, 0x0001
     318:	5800                	.insn	2, 0x5800
     31a:	0000                	.insn	2, 0x0000
     31c:	0100                	.insn	2, 0x0100
     31e:	157d                	.insn	2, 0x157d
     320:	9e15                	.insn	2, 0x9e15
     322:	0001                	.insn	2, 0x0001
     324:	df00                	.insn	2, 0xdf00
     326:	0001                	.insn	2, 0x0001
     328:	1600                	.insn	2, 0x1600
     32a:	015c                	.insn	2, 0x015c
     32c:	0000                	.insn	2, 0x0000
     32e:	01f5                	.insn	2, 0x01f5
     330:	0000                	.insn	2, 0x0000
     332:	00007813          	andi	a6,zero,0
     336:	1600                	.insn	2, 0x1600
     338:	0279                	.insn	2, 0x0279
     33a:	0000                	.insn	2, 0x0000
     33c:	0201                	.insn	2, 0x0201
     33e:	0000                	.insn	2, 0x0000
     340:	9716                	.insn	2, 0x9716
     342:	0002                	.insn	2, 0x0002
     344:	0c00                	.insn	2, 0x0c00
     346:	0002                	.insn	2, 0x0002
     348:	0000                	.insn	2, 0x0000
     34a:	1400                	.insn	2, 0x1400
     34c:	000001d3          	.insn	4, 0x01d3
     350:	0098                	.insn	2, 0x0098
     352:	0000                	.insn	2, 0x0000
     354:	8301                	.insn	2, 0x8301
     356:	1515                	.insn	2, 0x1515
     358:	02e0                	.insn	2, 0x02e0
     35a:	0000                	.insn	2, 0x0000
     35c:	01df 0000 aa16      	.insn	6, 0xaa16000001df
     362:	0002                	.insn	2, 0x0002
     364:	f500                	.insn	2, 0xf500
     366:	0001                	.insn	2, 0x0001
     368:	1300                	.insn	2, 0x1300
     36a:	00b0                	.insn	2, 0x00b0
     36c:	0000                	.insn	2, 0x0000
     36e:	4616                	.insn	2, 0x4616
     370:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     374:	0002                	.insn	2, 0x0002
     376:	1600                	.insn	2, 0x1600
     378:	0364                	.insn	2, 0x0364
     37a:	0000                	.insn	2, 0x0000
     37c:	020c                	.insn	2, 0x020c
     37e:	0000                	.insn	2, 0x0000
     380:	0000                	.insn	2, 0x0000
     382:	0f00                	.insn	2, 0x0f00
     384:	0234                	.insn	2, 0x0234
     386:	0040                	.insn	2, 0x0040
     388:	0094                	.insn	2, 0x0094
     38a:	0000                	.insn	2, 0x0000
     38c:	5611                	.insn	2, 0x5611
     38e:	0000                	.insn	2, 0x0000
     390:	6100                	.insn	2, 0x6100
     392:	0002                	.insn	2, 0x0002
     394:	0100                	.insn	2, 0x0100
     396:	ba2e                	.insn	2, 0xba2e
     398:	0001                	.insn	2, 0x0001
     39a:	0000                	.insn	2, 0x0000
     39c:	1700                	.insn	2, 0x1700
     39e:	054e                	.insn	2, 0x054e
     3a0:	0000                	.insn	2, 0x0000
     3a2:	0064                	.insn	2, 0x0064
     3a4:	0040                	.insn	2, 0x0040
     3a6:	00054e17          	auipc	t3,0x54
     3aa:	5c00                	.insn	2, 0x5c00
     3ac:	4001                	.insn	2, 0x4001
     3ae:	1700                	.insn	2, 0x1700
     3b0:	055c                	.insn	2, 0x055c
     3b2:	0000                	.insn	2, 0x0000
     3b4:	016c                	.insn	2, 0x016c
     3b6:	0040                	.insn	2, 0x0040
     3b8:	00055c17          	auipc	s8,0x55
     3bc:	7800                	.insn	2, 0x7800
     3be:	4001                	.insn	2, 0x4001
     3c0:	1700                	.insn	2, 0x1700
     3c2:	055c                	.insn	2, 0x055c
     3c4:	0000                	.insn	2, 0x0000
     3c6:	0184                	.insn	2, 0x0184
     3c8:	0040                	.insn	2, 0x0040
     3ca:	00055c17          	auipc	s8,0x55
     3ce:	9000                	.insn	2, 0x9000
     3d0:	4001                	.insn	2, 0x4001
     3d2:	1700                	.insn	2, 0x1700
     3d4:	055c                	.insn	2, 0x055c
     3d6:	0000                	.insn	2, 0x0000
     3d8:	019c                	.insn	2, 0x019c
     3da:	0040                	.insn	2, 0x0040
     3dc:	00055c17          	auipc	s8,0x55
     3e0:	a800                	.insn	2, 0xa800
     3e2:	4001                	.insn	2, 0x4001
     3e4:	1700                	.insn	2, 0x1700
     3e6:	055c                	.insn	2, 0x055c
     3e8:	0000                	.insn	2, 0x0000
     3ea:	01b4                	.insn	2, 0x01b4
     3ec:	0040                	.insn	2, 0x0040
     3ee:	00055c17          	auipc	s8,0x55
     3f2:	c000                	.insn	2, 0xc000
     3f4:	4001                	.insn	2, 0x4001
     3f6:	1700                	.insn	2, 0x1700
     3f8:	055c                	.insn	2, 0x055c
     3fa:	0000                	.insn	2, 0x0000
     3fc:	01cc                	.insn	2, 0x01cc
     3fe:	0040                	.insn	2, 0x0040
     400:	00055c17          	auipc	s8,0x55
     404:	d800                	.insn	2, 0xd800
     406:	4001                	.insn	2, 0x4001
     408:	1700                	.insn	2, 0x1700
     40a:	055c                	.insn	2, 0x055c
     40c:	0000                	.insn	2, 0x0000
     40e:	01e4                	.insn	2, 0x01e4
     410:	0040                	.insn	2, 0x0040
     412:	00055c17          	auipc	s8,0x55
     416:	f000                	.insn	2, 0xf000
     418:	4001                	.insn	2, 0x4001
     41a:	1700                	.insn	2, 0x1700
     41c:	055c                	.insn	2, 0x055c
     41e:	0000                	.insn	2, 0x0000
     420:	01fc                	.insn	2, 0x01fc
     422:	0040                	.insn	2, 0x0040
     424:	00055c17          	auipc	s8,0x55
     428:	0800                	.insn	2, 0x0800
     42a:	4002                	.insn	2, 0x4002
     42c:	1700                	.insn	2, 0x1700
     42e:	055c                	.insn	2, 0x055c
     430:	0000                	.insn	2, 0x0000
     432:	0214                	.insn	2, 0x0214
     434:	0040                	.insn	2, 0x0040
     436:	00055c17          	auipc	s8,0x55
     43a:	2000                	.insn	2, 0x2000
     43c:	4002                	.insn	2, 0x4002
     43e:	1700                	.insn	2, 0x1700
     440:	055c                	.insn	2, 0x055c
     442:	0000                	.insn	2, 0x0000
     444:	022c                	.insn	2, 0x022c
     446:	0040                	.insn	2, 0x0040
     448:	00056917          	auipc	s2,0x56
     44c:	4400                	.insn	2, 0x4400
     44e:	4002                	.insn	2, 0x4002
     450:	1700                	.insn	2, 0x1700
     452:	055c                	.insn	2, 0x055c
     454:	0000                	.insn	2, 0x0000
     456:	0290                	.insn	2, 0x0290
     458:	0040                	.insn	2, 0x0040
     45a:	00055c17          	auipc	s8,0x55
     45e:	9c00                	.insn	2, 0x9c00
     460:	4002                	.insn	2, 0x4002
     462:	1700                	.insn	2, 0x1700
     464:	055c                	.insn	2, 0x055c
     466:	0000                	.insn	2, 0x0000
     468:	02ac                	.insn	2, 0x02ac
     46a:	0040                	.insn	2, 0x0040
     46c:	00055c17          	auipc	s8,0x55
     470:	bc00                	.insn	2, 0xbc00
     472:	4002                	.insn	2, 0x4002
     474:	1700                	.insn	2, 0x1700
     476:	0574                	.insn	2, 0x0574
     478:	0000                	.insn	2, 0x0000
     47a:	0360                	.insn	2, 0x0360
     47c:	0040                	.insn	2, 0x0040
     47e:	00057417          	auipc	s0,0x57
     482:	7400                	.insn	2, 0x7400
     484:	17004003          	lbu	zero,368(zero) # 170 <$d.6+0x80>
     488:	0574                	.insn	2, 0x0574
     48a:	0000                	.insn	2, 0x0000
     48c:	0388                	.insn	2, 0x0388
     48e:	0040                	.insn	2, 0x0040
     490:	00057417          	auipc	s0,0x57
     494:	9c00                	.insn	2, 0x9c00
     496:	17004003          	lbu	zero,368(zero) # 170 <$d.6+0x80>
     49a:	0574                	.insn	2, 0x0574
     49c:	0000                	.insn	2, 0x0000
     49e:	03b0                	.insn	2, 0x03b0
     4a0:	0040                	.insn	2, 0x0040
     4a2:	00057417          	auipc	s0,0x57
     4a6:	c400                	.insn	2, 0xc400
     4a8:	17004003          	lbu	zero,368(zero) # 170 <$d.6+0x80>
     4ac:	0574                	.insn	2, 0x0574
     4ae:	0000                	.insn	2, 0x0000
     4b0:	03d8                	.insn	2, 0x03d8
     4b2:	0040                	.insn	2, 0x0040
     4b4:	00057417          	auipc	s0,0x57
     4b8:	ec00                	.insn	2, 0xec00
     4ba:	17004003          	lbu	zero,368(zero) # 170 <$d.6+0x80>
     4be:	0574                	.insn	2, 0x0574
     4c0:	0000                	.insn	2, 0x0000
     4c2:	0400                	.insn	2, 0x0400
     4c4:	0040                	.insn	2, 0x0040
     4c6:	00054e17          	auipc	t3,0x54
     4ca:	1400                	.insn	2, 0x1400
     4cc:	4004                	.insn	2, 0x4004
     4ce:	1700                	.insn	2, 0x1700
     4d0:	058a                	.insn	2, 0x058a
     4d2:	0000                	.insn	2, 0x0000
     4d4:	0480                	.insn	2, 0x0480
     4d6:	0040                	.insn	2, 0x0040
     4d8:	00054e17          	auipc	t3,0x54
     4dc:	9400                	.insn	2, 0x9400
     4de:	4004                	.insn	2, 0x4004
     4e0:	1700                	.insn	2, 0x1700
     4e2:	058a                	.insn	2, 0x058a
     4e4:	0000                	.insn	2, 0x0000
     4e6:	04a8                	.insn	2, 0x04a8
     4e8:	0040                	.insn	2, 0x0040
     4ea:	00059b17          	auipc	s6,0x59
     4ee:	b800                	.insn	2, 0xb800
     4f0:	4004                	.insn	2, 0x4004
     4f2:	1700                	.insn	2, 0x1700
     4f4:	05a8                	.insn	2, 0x05a8
     4f6:	0000                	.insn	2, 0x0000
     4f8:	04d0                	.insn	2, 0x04d0
     4fa:	0040                	.insn	2, 0x0040
     4fc:	00058a17          	auipc	s4,0x58
     500:	f800                	.insn	2, 0xf800
     502:	4004                	.insn	2, 0x4004
     504:	1700                	.insn	2, 0x1700
     506:	05ba                	.insn	2, 0x05ba
     508:	0000                	.insn	2, 0x0000
     50a:	0500                	.insn	2, 0x0500
     50c:	0040                	.insn	2, 0x0040
     50e:	0005c717          	auipc	a4,0x5c
     512:	1000                	.insn	2, 0x1000
     514:	4005                	.insn	2, 0x4005
     516:	1700                	.insn	2, 0x1700
     518:	000005c7          	.insn	4, 0x05c7
     51c:	051c                	.insn	2, 0x051c
     51e:	0040                	.insn	2, 0x0040
     520:	00054e17          	auipc	t3,0x54
     524:	2c00                	.insn	2, 0x2c00
     526:	4005                	.insn	2, 0x4005
     528:	1700                	.insn	2, 0x1700
     52a:	054e                	.insn	2, 0x054e
     52c:	0000                	.insn	2, 0x0000
     52e:	0540                	.insn	2, 0x0540
     530:	0040                	.insn	2, 0x0040
     532:	00054e17          	auipc	t3,0x54
     536:	0c00                	.insn	2, 0x0c00
     538:	4006                	.insn	2, 0x4006
     53a:	1700                	.insn	2, 0x1700
     53c:	05a8                	.insn	2, 0x05a8
     53e:	0000                	.insn	2, 0x0000
     540:	067c                	.insn	2, 0x067c
     542:	0040                	.insn	2, 0x0040
     544:	00063d17          	auipc	s10,0x63
     548:	8800                	.insn	2, 0x8800
     54a:	4006                	.insn	2, 0x4006
     54c:	0000                	.insn	2, 0x0000
     54e:	2518                	.insn	2, 0x2518
     550:	0002                	.insn	2, 0x0002
     552:	0200                	.insn	2, 0x0200
     554:	1936                	.insn	2, 0x1936
     556:	0219                	.insn	2, 0x0219
     558:	0000                	.insn	2, 0x0000
     55a:	001a                	.insn	2, 0x001a
     55c:	4a18                	.insn	2, 0x4a18
     55e:	0002                	.insn	2, 0x0002
     560:	0200                	.insn	2, 0x0200
     562:	192c                	.insn	2, 0x192c
     564:	0000003f 01af1b00 	.insn	8, 0x01af1b000000003f
     56c:	0000                	.insn	2, 0x0000
     56e:	2d02                	.insn	2, 0x2d02
     570:	01ba                	.insn	2, 0x01ba
     572:	0000                	.insn	2, 0x0000
     574:	d51c                	.insn	2, 0xd51c
     576:	0001                	.insn	2, 0x0001
     578:	0200                	.insn	2, 0x0200
     57a:	0001ba33          	sltu	s4,gp,zero
     57e:	1900                	.insn	2, 0x1900
     580:	0219                	.insn	2, 0x0219
     582:	0000                	.insn	2, 0x0000
     584:	1919                	.insn	2, 0x1919
     586:	0002                	.insn	2, 0x0002
     588:	0000                	.insn	2, 0x0000
     58a:	521c                	.insn	2, 0x521c
     58c:	0002                	.insn	2, 0x0002
     58e:	0200                	.insn	2, 0x0200
     590:	0001cc2b          	.insn	4, 0x0001cc2b
     594:	1900                	.insn	2, 0x1900
     596:	0219                	.insn	2, 0x0219
     598:	0000                	.insn	2, 0x0000
     59a:	1800                	.insn	2, 0x1800
     59c:	01dc                	.insn	2, 0x01dc
     59e:	0000                	.insn	2, 0x0000
     5a0:	2502                	.insn	2, 0x2502
     5a2:	c119                	.insn	2, 0xc119
     5a4:	0001                	.insn	2, 0x0001
     5a6:	0000                	.insn	2, 0x0000
     5a8:	ef18                	.insn	2, 0xef18
     5aa:	0000                	.insn	2, 0x0000
     5ac:	0200                	.insn	2, 0x0200
     5ae:	01c11927          	.insn	4, 0x01c11927
     5b2:	0000                	.insn	2, 0x0000
     5b4:	c119                	.insn	2, 0xc119
     5b6:	0001                	.insn	2, 0x0001
     5b8:	0000                	.insn	2, 0x0000
     5ba:	e818                	.insn	2, 0xe818
     5bc:	0001                	.insn	2, 0x0001
     5be:	0200                	.insn	2, 0x0200
     5c0:	1926                	.insn	2, 0x1926
     5c2:	01cc                	.insn	2, 0x01cc
     5c4:	0000                	.insn	2, 0x0000
     5c6:	0e00                	.insn	2, 0x0e00
     5c8:	0754                	.insn	2, 0x0754
     5ca:	0040                	.insn	2, 0x0040
     5cc:	00bc                	.insn	2, 0x00bc
     5ce:	0000                	.insn	2, 0x0000
     5d0:	5201                	.insn	2, 0x5201
     5d2:	000d                	.insn	2, 0x000d
     5d4:	0000                	.insn	2, 0x0000
     5d6:	cc01                	.insn	2, 0xcc01
     5d8:	451d                	.insn	2, 0x451d
     5da:	0004                	.insn	2, 0x0004
     5dc:	db00                	.insn	2, 0xdb00
     5de:	0000                	.insn	2, 0x0000
     5e0:	0100                	.insn	2, 0x0100
     5e2:	cccc                	.insn	2, 0xcccc
     5e4:	0001                	.insn	2, 0x0001
     5e6:	1100                	.insn	2, 0x1100
     5e8:	0482                	.insn	2, 0x0482
     5ea:	0000                	.insn	2, 0x0000
     5ec:	0000002b          	.insn	4, 0x002b
     5f0:	ce01                	.insn	2, 0xce01
     5f2:	01ba                	.insn	2, 0x01ba
     5f4:	0000                	.insn	2, 0x0000
     5f6:	4007780f          	.insn	4, 0x4007780f
     5fa:	5400                	.insn	2, 0x5400
     5fc:	0000                	.insn	2, 0x0000
     5fe:	1100                	.insn	2, 0x1100
     600:	00000463          	beqz	zero,608 <$d.3+0x166>
     604:	0062                	.insn	2, 0x0062
     606:	0000                	.insn	2, 0x0000
     608:	cf01                	.insn	2, 0xcf01
     60a:	01cc                	.insn	2, 0x01cc
     60c:	0000                	.insn	2, 0x0000
     60e:	1700                	.insn	2, 0x1700
     610:	0685                	.insn	2, 0x0685
     612:	0000                	.insn	2, 0x0000
     614:	079c                	.insn	2, 0x079c
     616:	0040                	.insn	2, 0x0040
     618:	00054e17          	auipc	t3,0x54
     61c:	b000                	.insn	2, 0xb000
     61e:	17004007          	.insn	4, 0x17004007
     622:	055c                	.insn	2, 0x055c
     624:	0000                	.insn	2, 0x0000
     626:	07c8                	.insn	2, 0x07c8
     628:	0040                	.insn	2, 0x0040
     62a:	00055c17          	auipc	s8,0x55
     62e:	e000                	.insn	2, 0xe000
     630:	1e004007          	.insn	4, 0x1e004007
     634:	054e                	.insn	2, 0x054e
     636:	0000                	.insn	2, 0x0000
     638:	0810                	.insn	2, 0x0810
     63a:	0040                	.insn	2, 0x0040
     63c:	1f00                	.insn	2, 0x1f00
     63e:	025c                	.insn	2, 0x025c
     640:	0000                	.insn	2, 0x0000
     642:	3702                	.insn	2, 0x3702
     644:	8820                	.insn	2, 0x8820
     646:	4006                	.insn	2, 0x4006
     648:	cc00                	.insn	2, 0xcc00
     64a:	0000                	.insn	2, 0x0000
     64c:	0100                	.insn	2, 0x0100
     64e:	d352                	.insn	2, 0xd352
     650:	0001                	.insn	2, 0x0001
     652:	1500                	.insn	2, 0x1500
     654:	00000377          	.insn	4, 0x0377
     658:	01df 0000 0121      	.insn	6, 0x0121000001df
     65e:	0001ea5b          	.insn	4, 0x0001ea5b
     662:	1600                	.insn	2, 0x1600
     664:	03ea                	.insn	2, 0x03ea
     666:	0000                	.insn	2, 0x0000
     668:	01f5                	.insn	2, 0x01f5
     66a:	0000                	.insn	2, 0x0000
     66c:	0000d013          	srli	zero,ra,0x0
     670:	1600                	.insn	2, 0x1600
     672:	0414                	.insn	2, 0x0414
     674:	0000                	.insn	2, 0x0000
     676:	0201                	.insn	2, 0x0201
     678:	0000                	.insn	2, 0x0000
     67a:	3216                	.insn	2, 0x3216
     67c:	0004                	.insn	2, 0x0004
     67e:	0c00                	.insn	2, 0x0c00
     680:	0002                	.insn	2, 0x0002
     682:	0000                	.insn	2, 0x0000
     684:	1c00                	.insn	2, 0x1c00
     686:	0179                	.insn	2, 0x0179
     688:	0000                	.insn	2, 0x0000
     68a:	2a02                	.insn	2, 0x2a02
     68c:	0696                	.insn	2, 0x0696
     68e:	0000                	.insn	2, 0x0000
     690:	cc19                	.insn	2, 0xcc19
     692:	0001                	.insn	2, 0x0001
     694:	0000                	.insn	2, 0x0000
     696:	0001ba07          	.insn	4, 0x0001ba07
     69a:	7200                	.insn	2, 0x7200
     69c:	0000                	.insn	2, 0x0000
     69e:	0200                	.insn	2, 0x0200
     6a0:	030e                	.insn	2, 0x030e
     6a2:	0000003f 00004604 	.insn	8, 0x46040000003f
     6aa:	2000                	.insn	2, 0x2000
     6ac:	0300                	.insn	2, 0x0300
     6ae:	0219                	.insn	2, 0x0219
     6b0:	0000                	.insn	2, 0x0000
     6b2:	4604                	.insn	2, 0x4604
     6b4:	0000                	.insn	2, 0x0000
     6b6:	0800                	.insn	2, 0x0800
     6b8:	0c00                	.insn	2, 0x0c00
     6ba:	0000003f  	.insn	8, 0x00096d000000003f

000006bf <$d.5>:
     6bf:	096d                	.insn	2, 0x096d
     6c1:	0000                	.insn	2, 0x0000
     6c3:	0004                	.insn	2, 0x0004
     6c5:	01a0                	.insn	2, 0x01a0
     6c7:	0000                	.insn	2, 0x0000
     6c9:	0104                	.insn	2, 0x0104
     6cb:	00b4                	.insn	2, 0x00b4
     6cd:	0000                	.insn	2, 0x0000
     6cf:	001d                	.insn	2, 0x001d
     6d1:	0080                	.insn	2, 0x0080
     6d3:	0000                	.insn	2, 0x0000
     6d5:	06e0                	.insn	2, 0x06e0
     6d7:	0000                	.insn	2, 0x0000
     6d9:	0144                	.insn	2, 0x0144
     6db:	0000                	.insn	2, 0x0000
     6dd:	0000                	.insn	2, 0x0000
     6df:	0000                	.insn	2, 0x0000
     6e1:	0240                	.insn	2, 0x0240
     6e3:	0000                	.insn	2, 0x0000
     6e5:	3402                	.insn	2, 0x3402
     6e7:	0000                	.insn	2, 0x0000
     6e9:	0100                	.insn	2, 0x0100
     6eb:	0129                	.insn	2, 0x0129
     6ed:	0305                	.insn	2, 0x0305
     6ef:	1336                	.insn	2, 0x1336
     6f1:	0040                	.insn	2, 0x0040
     6f3:	00004003          	lbu	zero,0(zero) # 0 <$d.4>
     6f7:	0400                	.insn	2, 0x0400
     6f9:	00000047          	.insn	4, 0x0047
     6fd:	0011                	.insn	2, 0x0011
     6ff:	2f05                	.insn	2, 0x2f05
     701:	0001                	.insn	2, 0x0001
     703:	0800                	.insn	2, 0x0800
     705:	0601                	.insn	2, 0x0601
     707:	000001b7          	lui	gp,0x0
     70b:	0708                	.insn	2, 0x0708
     70d:	00005a07          	.insn	4, 0x5a07
     711:	f900                	.insn	2, 0xf900
     713:	0001                	.insn	2, 0x0001
     715:	0200                	.insn	2, 0x0200
     717:	010a                	.insn	2, 0x010a
     719:	2105                	.insn	2, 0x2105
     71b:	0001                	.insn	2, 0x0001
     71d:	0800                	.insn	2, 0x0800
     71f:	0801                	.insn	2, 0x0801
     721:	006c                	.insn	2, 0x006c
     723:	0000                	.insn	2, 0x0000
     725:	00fd                	.insn	2, 0x00fd
     727:	0000                	.insn	2, 0x0000
     729:	c602                	.insn	2, 0xc602
     72b:	9705                	.insn	2, 0x9705
     72d:	0001                	.insn	2, 0x0001
     72f:	0700                	.insn	2, 0x0700
     731:	0504                	.insn	2, 0x0504
     733:	0134                	.insn	2, 0x0134
     735:	0000                	.insn	2, 0x0000
     737:	0405                	.insn	2, 0x0405
     739:	5a09                	.insn	2, 0x5a09
     73b:	0000                	.insn	2, 0x0000
     73d:	0a00                	.insn	2, 0x0a00
     73f:	018c                	.insn	2, 0x018c
     741:	0000                	.insn	2, 0x0000
     743:	3901                	.insn	2, 0x3901
     745:	00000073          	ecall
     749:	0b01                	.insn	2, 0x0b01
     74b:	0112                	.insn	2, 0x0112
     74d:	0000                	.insn	2, 0x0000
     74f:	3901                	.insn	2, 0x3901
     751:	00000073          	ecall
     755:	0002200b          	.insn	4, 0x0002200b
     759:	0100                	.insn	2, 0x0100
     75b:	7339                	.insn	2, 0x7339
     75d:	0000                	.insn	2, 0x0000
     75f:	0b00                	.insn	2, 0x0b00
     761:	0264                	.insn	2, 0x0264
     763:	0000                	.insn	2, 0x0000
     765:	3901                	.insn	2, 0x3901
     767:	00000073          	ecall
     76b:	0002410b          	.insn	4, 0x0002410b
     76f:	0100                	.insn	2, 0x0100
     771:	7339                	.insn	2, 0x7339
     773:	0000                	.insn	2, 0x0000
     775:	0c00                	.insn	2, 0x0c00
     777:	0194                	.insn	2, 0x0194
     779:	0000                	.insn	2, 0x0000
     77b:	3b01                	.insn	2, 0x3b01
     77d:	00000073          	ecall
     781:	f40c                	.insn	2, 0xf40c
     783:	0001                	.insn	2, 0x0001
     785:	0100                	.insn	2, 0x0100
     787:	733c                	.insn	2, 0x733c
     789:	0000                	.insn	2, 0x0000
     78b:	0c00                	.insn	2, 0x0c00
     78d:	00000077          	.insn	4, 0x0077
     791:	3d01                	.insn	2, 0x3d01
     793:	00000073          	ecall
     797:	430c                	.insn	2, 0x430c
     799:	0000                	.insn	2, 0x0000
     79b:	0100                	.insn	2, 0x0100
     79d:	733e                	.insn	2, 0x733e
     79f:	0000                	.insn	2, 0x0000
     7a1:	0000                	.insn	2, 0x0000
     7a3:	100d                	.insn	2, 0x100d
     7a5:	4008                	.insn	2, 0x4008
     7a7:	1800                	.insn	2, 0x1800
     7a9:	0000                	.insn	2, 0x0000
     7ab:	0100                	.insn	2, 0x0100
     7ad:	5c52                	.insn	2, 0x5c52
     7af:	0002                	.insn	2, 0x0002
     7b1:	0100                	.insn	2, 0x0100
     7b3:	0e4d                	.insn	2, 0x0e4d
     7b5:	007f 0000 0810 0040 	.insn	10, 0x0014004008100000007f
     7bd:	0014 
     7bf:	0000                	.insn	2, 0x0000
     7c1:	5201                	.insn	2, 0x5201
     7c3:	0f05                	.insn	2, 0x0f05
     7c5:	8b08                	.insn	2, 0x8b08
     7c7:	0000                	.insn	2, 0x0000
     7c9:	0f00                	.insn	2, 0x0f00
     7cb:	9600                	.insn	2, 0x9600
     7cd:	0000                	.insn	2, 0x0000
     7cf:	0f00                	.insn	2, 0x0f00
     7d1:	a100                	.insn	2, 0xa100
     7d3:	0000                	.insn	2, 0x0000
     7d5:	0f00                	.insn	2, 0x0f00
     7d7:	ac00                	.insn	2, 0xac00
     7d9:	0000                	.insn	2, 0x0000
     7db:	1000                	.insn	2, 0x1000
     7dd:	04a2                	.insn	2, 0x04a2
     7df:	0000                	.insn	2, 0x0000
     7e1:	000000b7          	lui	ra,0x0
     7e5:	0011                	.insn	2, 0x0011
     7e7:	00c2                	.insn	2, 0x00c2
     7e9:	0000                	.insn	2, 0x0000
     7eb:	0011                	.insn	2, 0x0011
     7ed:	00cd                	.insn	2, 0x00cd
     7ef:	0000                	.insn	2, 0x0000
     7f1:	0811                	.insn	2, 0x0811
     7f3:	00d8                	.insn	2, 0x00d8
     7f5:	0000                	.insn	2, 0x0000
     7f7:	0000                	.insn	2, 0x0000
     7f9:	3d12                	.insn	2, 0x3d12
     7fb:	0001                	.insn	2, 0x0001
     7fd:	0100                	.insn	2, 0x0100
     7ff:	01c0                	.insn	2, 0x01c0
     801:	0190                	.insn	2, 0x0190
     803:	0000                	.insn	2, 0x0000
     805:	1301                	.insn	2, 0x1301
     807:	0062                	.insn	2, 0x0062
     809:	0000                	.insn	2, 0x0000
     80b:	c001                	.insn	2, 0xc001
     80d:	6101                	.insn	2, 0x6101
     80f:	0000                	.insn	2, 0x0000
     811:	1300                	.insn	2, 0x1300
     813:	0194                	.insn	2, 0x0194
     815:	0000                	.insn	2, 0x0000
     817:	c101                	.insn	2, 0xc101
     819:	6101                	.insn	2, 0x6101
     81b:	0000                	.insn	2, 0x0000
     81d:	1300                	.insn	2, 0x1300
     81f:	01f4                	.insn	2, 0x01f4
     821:	0000                	.insn	2, 0x0000
     823:	c201                	.insn	2, 0xc201
     825:	6101                	.insn	2, 0x6101
     827:	0000                	.insn	2, 0x0000
     829:	1300                	.insn	2, 0x1300
     82b:	00000077          	.insn	4, 0x0077
     82f:	c301                	.insn	2, 0xc301
     831:	6101                	.insn	2, 0x6101
     833:	0000                	.insn	2, 0x0000
     835:	1300                	.insn	2, 0x1300
     837:	01a9                	.insn	2, 0x01a9
     839:	0000                	.insn	2, 0x0000
     83b:	c401                	.insn	2, 0xc401
     83d:	6101                	.insn	2, 0x6101
     83f:	0000                	.insn	2, 0x0000
     841:	1400                	.insn	2, 0x1400
     843:	00df 0000 c601      	.insn	6, 0xc601000000df
     849:	6101                	.insn	2, 0x6101
     84b:	0000                	.insn	2, 0x0000
     84d:	0000                	.insn	2, 0x0000
     84f:	6c08                	.insn	2, 0x6c08
     851:	0000                	.insn	2, 0x0000
     853:	fd00                	.insn	2, 0xfd00
     855:	0000                	.insn	2, 0x0000
     857:	0300                	.insn	2, 0x0300
     859:	1511                	.insn	2, 0x1511
     85b:	024a                	.insn	2, 0x024a
     85d:	0000                	.insn	2, 0x0000
     85f:	9601                	.insn	2, 0x9601
     861:	0101                	.insn	2, 0x0101
     863:	00026113          	ori	sp,tp,0
     867:	0100                	.insn	2, 0x0100
     869:	0196                	.insn	2, 0x0196
     86b:	0040                	.insn	2, 0x0040
     86d:	0000                	.insn	2, 0x0000
     86f:	1500                	.insn	2, 0x1500
     871:	0000008b          	.insn	4, 0x008b
     875:	b001                	.insn	2, 0xb001
     877:	0101                	.insn	2, 0x0101
     879:	00007e13          	andi	t3,zero,0
     87d:	0100                	.insn	2, 0x0100
     87f:	01b0                	.insn	2, 0x01b0
     881:	00000073          	ecall
     885:	1600                	.insn	2, 0x1600
     887:	0828                	.insn	2, 0x0828
     889:	0040                	.insn	2, 0x0040
     88b:	0380                	.insn	2, 0x0380
     88d:	0000                	.insn	2, 0x0000
     88f:	5201                	.insn	2, 0x5201
     891:	01dc                	.insn	2, 0x01dc
     893:	0000                	.insn	2, 0x0000
     895:	7701                	.insn	2, 0x7701
     897:	0004bf17          	auipc	t5,0x4b
     89b:	4f00                	.insn	2, 0x4f00
     89d:	0000                	.insn	2, 0x0000
     89f:	0100                	.insn	2, 0x0100
     8a1:	00006177          	.insn	4, 0x6177
     8a5:	1800                	.insn	2, 0x1800
     8a7:	05d49103          	lh	sp,93(s1)
     8ab:	0046                	.insn	2, 0x0046
     8ad:	0000                	.insn	2, 0x0000
     8af:	8501                	.insn	2, 0x8501
     8b1:	092c                	.insn	2, 0x092c
     8b3:	0000                	.insn	2, 0x0000
     8b5:	0318                	.insn	2, 0x0318
     8b7:	c491                	.insn	2, 0xc491
     8b9:	1304                	.insn	2, 0x1304
     8bb:	0002                	.insn	2, 0x0002
     8bd:	0100                	.insn	2, 0x0100
     8bf:	2c86                	.insn	2, 0x2c86
     8c1:	0009                	.insn	2, 0x0009
     8c3:	1800                	.insn	2, 0x1800
     8c5:	9102                	.insn	2, 0x9102
     8c7:	1c04                	.insn	2, 0x1c04
     8c9:	0000                	.insn	2, 0x0000
     8cb:	0100                	.insn	2, 0x0100
     8cd:	00093e87          	.insn	4, 0x00093e87
     8d1:	1900                	.insn	2, 0x1900
     8d3:	084c                	.insn	2, 0x084c
     8d5:	0040                	.insn	2, 0x0040
     8d7:	007c                	.insn	2, 0x007c
     8d9:	0000                	.insn	2, 0x0000
     8db:	e51a                	.insn	2, 0xe51a
     8dd:	0004                	.insn	2, 0x0004
     8df:	2500                	.insn	2, 0x2500
     8e1:	0000                	.insn	2, 0x0000
     8e3:	0100                	.insn	2, 0x0100
     8e5:	618a                	.insn	2, 0x618a
     8e7:	0000                	.insn	2, 0x0000
     8e9:	1900                	.insn	2, 0x1900
     8eb:	0864                	.insn	2, 0x0864
     8ed:	0040                	.insn	2, 0x0040
     8ef:	0050                	.insn	2, 0x0050
     8f1:	0000                	.insn	2, 0x0000
     8f3:	0c1a                	.insn	2, 0x0c1a
     8f5:	0005                	.insn	2, 0x0005
     8f7:	4600                	.insn	2, 0x4600
     8f9:	0002                	.insn	2, 0x0002
     8fb:	0100                	.insn	2, 0x0100
     8fd:	0000618b          	.insn	4, 0x618b
     901:	0000                	.insn	2, 0x0000
     903:	1b00                	.insn	2, 0x1b00
     905:	013a                	.insn	2, 0x013a
     907:	0000                	.insn	2, 0x0000
     909:	00f0                	.insn	2, 0x00f0
     90b:	0000                	.insn	2, 0x0000
     90d:	9601                	.insn	2, 0x9601
     90f:	1c05                	.insn	2, 0x1c05
     911:	0571                	.insn	2, 0x0571
     913:	0000                	.insn	2, 0x0000
     915:	00000147          	.insn	4, 0x0147
     919:	d41c                	.insn	2, 0xd41c
     91b:	0005                	.insn	2, 0x0005
     91d:	5300                	.insn	2, 0x5300
     91f:	0001                	.insn	2, 0x0001
     921:	1c00                	.insn	2, 0x1c00
     923:	05b6                	.insn	2, 0x05b6
     925:	0000                	.insn	2, 0x0000
     927:	015f 0000 991c      	.insn	6, 0x991c0000015f
     92d:	0005                	.insn	2, 0x0005
     92f:	6b00                	.insn	2, 0x6b00
     931:	0001                	.insn	2, 0x0001
     933:	1c00                	.insn	2, 0x1c00
     935:	0000054b          	.insn	4, 0x054b
     939:	00000177          	.insn	4, 0x0177
     93d:	f210                	.insn	2, 0xf210
     93f:	0005                	.insn	2, 0x0005
     941:	8300                	.insn	2, 0x8300
     943:	0001                	.insn	2, 0x0001
     945:	0000                	.insn	2, 0x0000
     947:	00019b1b          	.insn	4, 0x00019b1b
     94b:	0800                	.insn	2, 0x0800
     94d:	0001                	.insn	2, 0x0001
     94f:	0100                	.insn	2, 0x0100
     951:	059f 0d1c 0006      	.insn	6, 0x00060d1c059f
     957:	a400                	.insn	2, 0xa400
     959:	0001                	.insn	2, 0x0001
     95b:	0000                	.insn	2, 0x0000
     95d:	00019b1b          	.insn	4, 0x00019b1b
     961:	2000                	.insn	2, 0x2000
     963:	0001                	.insn	2, 0x0001
     965:	0100                	.insn	2, 0x0100
     967:	05a0                	.insn	2, 0x05a0
     969:	371c                	.insn	2, 0x371c
     96b:	0006                	.insn	2, 0x0006
     96d:	a400                	.insn	2, 0xa400
     96f:	0001                	.insn	2, 0x0001
     971:	0000                	.insn	2, 0x0000
     973:	2419                	.insn	2, 0x2419
     975:	4009                	.insn	2, 0x4009
     977:	7000                	.insn	2, 0x7000
     979:	0000                	.insn	2, 0x0000
     97b:	1a00                	.insn	2, 0x1a00
     97d:	065f 0000 0025      	.insn	6, 0x00250000065f
     983:	0000                	.insn	2, 0x0000
     985:	a101                	.insn	2, 0xa101
     987:	0061                	.insn	2, 0x0061
     989:	0000                	.insn	2, 0x0000
     98b:	3819                	.insn	2, 0x3819
     98d:	4009                	.insn	2, 0x4009
     98f:	4000                	.insn	2, 0x4000
     991:	0000                	.insn	2, 0x0000
     993:	1a00                	.insn	2, 0x1a00
     995:	0686                	.insn	2, 0x0686
     997:	0000                	.insn	2, 0x0000
     999:	0246                	.insn	2, 0x0246
     99b:	0000                	.insn	2, 0x0000
     99d:	a201                	.insn	2, 0xa201
     99f:	0061                	.insn	2, 0x0061
     9a1:	0000                	.insn	2, 0x0000
     9a3:	b10e                	.insn	2, 0xb10e
     9a5:	0001                	.insn	2, 0x0001
     9a7:	5800                	.insn	2, 0x5800
     9a9:	4009                	.insn	2, 0x4009
     9ab:	0c00                	.insn	2, 0x0c00
     9ad:	0000                	.insn	2, 0x0000
     9af:	0100                	.insn	2, 0x0100
     9b1:	011d0da3          	sb	a7,27(s10) # 6355f <$d.11+0x62e7f>
     9b5:	ba5e                	.insn	2, 0xba5e
     9b7:	0001                	.insn	2, 0x0001
     9b9:	0000                	.insn	2, 0x0000
     9bb:	9b0e                	.insn	2, 0x9b0e
     9bd:	0001                	.insn	2, 0x0001
     9bf:	6400                	.insn	2, 0x6400
     9c1:	4009                	.insn	2, 0x4009
     9c3:	0c00                	.insn	2, 0x0c00
     9c5:	0000                	.insn	2, 0x0000
     9c7:	0100                	.insn	2, 0x0100
     9c9:	0da4                	.insn	2, 0x0da4
     9cb:	201e                	.insn	2, 0x201e
     9cd:	01a4                	.insn	2, 0x01a4
     9cf:	0000                	.insn	2, 0x0000
     9d1:	0000                	.insn	2, 0x0000
     9d3:	9b0e                	.insn	2, 0x9b0e
     9d5:	0001                	.insn	2, 0x0001
     9d7:	7800                	.insn	2, 0x7800
     9d9:	4009                	.insn	2, 0x4009
     9db:	0c00                	.insn	2, 0x0c00
     9dd:	0000                	.insn	2, 0x0000
     9df:	0100                	.insn	2, 0x0100
     9e1:	09a6                	.insn	2, 0x09a6
     9e3:	0a1e                	.insn	2, 0x0a1e
     9e5:	01a4                	.insn	2, 0x01a4
     9e7:	0000                	.insn	2, 0x0000
     9e9:	0000                	.insn	2, 0x0000
     9eb:	00019b1b          	.insn	4, 0x00019b1b
     9ef:	3800                	.insn	2, 0x3800
     9f1:	0001                	.insn	2, 0x0001
     9f3:	0100                	.insn	2, 0x0100
     9f5:	05a8                	.insn	2, 0x05a8
     9f7:	cd1c                	.insn	2, 0xcd1c
     9f9:	0006                	.insn	2, 0x0006
     9fb:	a400                	.insn	2, 0xa400
     9fd:	0001                	.insn	2, 0x0001
     9ff:	0000                	.insn	2, 0x0000
     a01:	00019b1b          	.insn	4, 0x00019b1b
     a05:	5000                	.insn	2, 0x5000
     a07:	0001                	.insn	2, 0x0001
     a09:	0100                	.insn	2, 0x0100
     a0b:	f51c05ab          	.insn	4, 0xf51c05ab
     a0f:	0006                	.insn	2, 0x0006
     a11:	a400                	.insn	2, 0xa400
     a13:	0001                	.insn	2, 0x0001
     a15:	0000                	.insn	2, 0x0000
     a17:	00019b1b          	.insn	4, 0x00019b1b
     a1b:	6800                	.insn	2, 0x6800
     a1d:	0001                	.insn	2, 0x0001
     a1f:	0100                	.insn	2, 0x0100
     a21:	05ac                	.insn	2, 0x05ac
     a23:	1f1c                	.insn	2, 0x1f1c
     a25:	a4000007          	.insn	4, 0xa4000007
     a29:	0001                	.insn	2, 0x0001
     a2b:	0000                	.insn	2, 0x0000
     a2d:	1c19                	.insn	2, 0x1c19
     a2f:	400a                	.insn	2, 0x400a
     a31:	7400                	.insn	2, 0x7400
     a33:	0000                	.insn	2, 0x0000
     a35:	1a00                	.insn	2, 0x1a00
     a37:	00000747          	.insn	4, 0x0747
     a3b:	0025                	.insn	2, 0x0025
     a3d:	0000                	.insn	2, 0x0000
     a3f:	ad01                	.insn	2, 0xad01
     a41:	0061                	.insn	2, 0x0061
     a43:	0000                	.insn	2, 0x0000
     a45:	3419                	.insn	2, 0x3419
     a47:	400a                	.insn	2, 0x400a
     a49:	4000                	.insn	2, 0x4000
     a4b:	0000                	.insn	2, 0x0000
     a4d:	1a00                	.insn	2, 0x1a00
     a4f:	076e                	.insn	2, 0x076e
     a51:	0000                	.insn	2, 0x0000
     a53:	0246                	.insn	2, 0x0246
     a55:	0000                	.insn	2, 0x0000
     a57:	ae01                	.insn	2, 0xae01
     a59:	0061                	.insn	2, 0x0061
     a5b:	0000                	.insn	2, 0x0000
     a5d:	b10e                	.insn	2, 0xb10e
     a5f:	0001                	.insn	2, 0x0001
     a61:	5400                	.insn	2, 0x5400
     a63:	400a                	.insn	2, 0x400a
     a65:	0c00                	.insn	2, 0x0c00
     a67:	0000                	.insn	2, 0x0000
     a69:	0100                	.insn	2, 0x0100
     a6b:	011d0daf          	.insn	4, 0x011d0daf
     a6f:	ba5e                	.insn	2, 0xba5e
     a71:	0001                	.insn	2, 0x0001
     a73:	0000                	.insn	2, 0x0000
     a75:	9b0e                	.insn	2, 0x9b0e
     a77:	0001                	.insn	2, 0x0001
     a79:	6000                	.insn	2, 0x6000
     a7b:	400a                	.insn	2, 0x400a
     a7d:	0c00                	.insn	2, 0x0c00
     a7f:	0000                	.insn	2, 0x0000
     a81:	0100                	.insn	2, 0x0100
     a83:	0db0                	.insn	2, 0x0db0
     a85:	201e                	.insn	2, 0x201e
     a87:	01a4                	.insn	2, 0x01a4
     a89:	0000                	.insn	2, 0x0000
     a8b:	0000                	.insn	2, 0x0000
     a8d:	9b0e                	.insn	2, 0x9b0e
     a8f:	0001                	.insn	2, 0x0001
     a91:	7400                	.insn	2, 0x7400
     a93:	400a                	.insn	2, 0x400a
     a95:	0c00                	.insn	2, 0x0c00
     a97:	0000                	.insn	2, 0x0000
     a99:	0100                	.insn	2, 0x0100
     a9b:	09b2                	.insn	2, 0x09b2
     a9d:	0a1e                	.insn	2, 0x0a1e
     a9f:	01a4                	.insn	2, 0x01a4
     aa1:	0000                	.insn	2, 0x0000
     aa3:	0000                	.insn	2, 0x0000
     aa5:	00019b1b          	.insn	4, 0x00019b1b
     aa9:	8000                	.insn	2, 0x8000
     aab:	0001                	.insn	2, 0x0001
     aad:	0100                	.insn	2, 0x0100
     aaf:	05b4                	.insn	2, 0x05b4
     ab1:	b51c                	.insn	2, 0xb51c
     ab3:	a4000007          	.insn	4, 0xa4000007
     ab7:	0001                	.insn	2, 0x0001
     ab9:	0000                	.insn	2, 0x0000
     abb:	00019b1b          	.insn	4, 0x00019b1b
     abf:	9800                	.insn	2, 0x9800
     ac1:	0001                	.insn	2, 0x0001
     ac3:	0100                	.insn	2, 0x0100
     ac5:	dd1c05b7          	lui	a1,0xdd1c0
     ac9:	a4000007          	.insn	4, 0xa4000007
     acd:	0001                	.insn	2, 0x0001
     acf:	0000                	.insn	2, 0x0000
     ad1:	00019b1b          	.insn	4, 0x00019b1b
     ad5:	b000                	.insn	2, 0xb000
     ad7:	0001                	.insn	2, 0x0001
     ad9:	0100                	.insn	2, 0x0100
     adb:	05b8                	.insn	2, 0x05b8
     add:	071c                	.insn	2, 0x071c
     adf:	0008                	.insn	2, 0x0008
     ae1:	a400                	.insn	2, 0xa400
     ae3:	0001                	.insn	2, 0x0001
     ae5:	0000                	.insn	2, 0x0000
     ae7:	1819                	.insn	2, 0x1819
     ae9:	5c00400b          	.insn	4, 0x5c00400b
     aed:	0000                	.insn	2, 0x0000
     aef:	1a00                	.insn	2, 0x1a00
     af1:	0000082f          	.insn	4, 0x082f
     af5:	0025                	.insn	2, 0x0025
     af7:	0000                	.insn	2, 0x0000
     af9:	b901                	.insn	2, 0xb901
     afb:	0061                	.insn	2, 0x0061
     afd:	0000                	.insn	2, 0x0000
     aff:	3419                	.insn	2, 0x3419
     b01:	2800400b          	.insn	4, 0x2800400b
     b05:	0000                	.insn	2, 0x0000
     b07:	1a00                	.insn	2, 0x1a00
     b09:	0856                	.insn	2, 0x0856
     b0b:	0000                	.insn	2, 0x0000
     b0d:	0246                	.insn	2, 0x0246
     b0f:	0000                	.insn	2, 0x0000
     b11:	ba01                	.insn	2, 0xba01
     b13:	0061                	.insn	2, 0x0061
     b15:	0000                	.insn	2, 0x0000
     b17:	b10e                	.insn	2, 0xb10e
     b19:	0001                	.insn	2, 0x0001
     b1b:	3800                	.insn	2, 0x3800
     b1d:	0c00400b          	.insn	4, 0x0c00400b
     b21:	0000                	.insn	2, 0x0000
     b23:	0100                	.insn	2, 0x0100
     b25:	011d0dbb          	.insn	4, 0x011d0dbb
     b29:	ba55                	.insn	2, 0xba55
     b2b:	0001                	.insn	2, 0x0001
     b2d:	0000                	.insn	2, 0x0000
     b2f:	9b0e                	.insn	2, 0x9b0e
     b31:	0001                	.insn	2, 0x0001
     b33:	4400                	.insn	2, 0x4400
     b35:	0c00400b          	.insn	4, 0x0c00400b
     b39:	0000                	.insn	2, 0x0000
     b3b:	0100                	.insn	2, 0x0100
     b3d:	0dbc                	.insn	2, 0x0dbc
     b3f:	201e                	.insn	2, 0x201e
     b41:	01a4                	.insn	2, 0x01a4
     b43:	0000                	.insn	2, 0x0000
     b45:	0000                	.insn	2, 0x0000
     b47:	9b0e                	.insn	2, 0x9b0e
     b49:	0001                	.insn	2, 0x0001
     b4b:	5c00                	.insn	2, 0x5c00
     b4d:	0c00400b          	.insn	4, 0x0c00400b
     b51:	0000                	.insn	2, 0x0000
     b53:	0100                	.insn	2, 0x0100
     b55:	09be                	.insn	2, 0x09be
     b57:	0a1e                	.insn	2, 0x0a1e
     b59:	01a4                	.insn	2, 0x01a4
     b5b:	0000                	.insn	2, 0x0000
     b5d:	0000                	.insn	2, 0x0000
     b5f:	9b0e                	.insn	2, 0x9b0e
     b61:	0001                	.insn	2, 0x0001
     b63:	7800                	.insn	2, 0x7800
     b65:	2800400b          	.insn	4, 0x2800400b
     b69:	0000                	.insn	2, 0x0000
     b6b:	0100                	.insn	2, 0x0100
     b6d:	05c0                	.insn	2, 0x05c0
     b6f:	0a1e                	.insn	2, 0x0a1e
     b71:	01a4                	.insn	2, 0x01a4
     b73:	0000                	.insn	2, 0x0000
     b75:	0000                	.insn	2, 0x0000
     b77:	a81f 400b 1400      	.insn	6, 0x1400400ba81f
     b7d:	0000                	.insn	2, 0x0000
     b7f:	0100                	.insn	2, 0x0100
     b81:	9b52                	.insn	2, 0x9b52
     b83:	0001                	.insn	2, 0x0001
     b85:	1c00                	.insn	2, 0x1c00
     b87:	0000088f          	.insn	4, 0x088f
     b8b:	01a4                	.insn	2, 0x01a4
     b8d:	0000                	.insn	2, 0x0000
     b8f:	1f00                	.insn	2, 0x1f00
     b91:	0bbc                	.insn	2, 0x0bbc
     b93:	0040                	.insn	2, 0x0040
     b95:	0014                	.insn	2, 0x0014
     b97:	0000                	.insn	2, 0x0000
     b99:	5201                	.insn	2, 0x5201
     b9b:	01b1                	.insn	2, 0x01b1
     b9d:	0000                	.insn	2, 0x0000
     b9f:	b51c                	.insn	2, 0xb51c
     ba1:	0008                	.insn	2, 0x0008
     ba3:	ba00                	.insn	2, 0xba00
     ba5:	0001                	.insn	2, 0x0001
     ba7:	0000                	.insn	2, 0x0000
     ba9:	0012                	.insn	2, 0x0012
     bab:	0000                	.insn	2, 0x0000
     bad:	0100                	.insn	2, 0x0100
     baf:	019001d7          	.insn	4, 0x019001d7
     bb3:	0000                	.insn	2, 0x0000
     bb5:	1301                	.insn	2, 0x1301
     bb7:	0112                	.insn	2, 0x0112
     bb9:	0000                	.insn	2, 0x0000
     bbb:	d701                	.insn	2, 0xd701
     bbd:	6101                	.insn	2, 0x6101
     bbf:	0000                	.insn	2, 0x0000
     bc1:	1300                	.insn	2, 0x1300
     bc3:	0220                	.insn	2, 0x0220
     bc5:	0000                	.insn	2, 0x0000
     bc7:	d701                	.insn	2, 0xd701
     bc9:	6101                	.insn	2, 0x6101
     bcb:	0000                	.insn	2, 0x0000
     bcd:	1400                	.insn	2, 0x1400
     bcf:	0194                	.insn	2, 0x0194
     bd1:	0000                	.insn	2, 0x0000
     bd3:	d901                	.insn	2, 0xd901
     bd5:	6101                	.insn	2, 0x6101
     bd7:	0000                	.insn	2, 0x0000
     bd9:	1400                	.insn	2, 0x1400
     bdb:	00000043          	.insn	4, 0x0043
     bdf:	da01                	.insn	2, 0xda01
     be1:	6101                	.insn	2, 0x6101
     be3:	0000                	.insn	2, 0x0000
     be5:	0000                	.insn	2, 0x0000
     be7:	d016                	.insn	2, 0xd016
     be9:	0c00400b          	.insn	4, 0x0c00400b
     bed:	0000                	.insn	2, 0x0000
     bef:	0100                	.insn	2, 0x0100
     bf1:	e852                	.insn	2, 0xe852
     bf3:	0001                	.insn	2, 0x0001
     bf5:	0100                	.insn	2, 0x0100
     bf7:	17c5                	.insn	2, 0x17c5
     bf9:	000008db          	.insn	4, 0x08db
     bfd:	0236                	.insn	2, 0x0236
     bff:	0000                	.insn	2, 0x0000
     c01:	c501                	.insn	2, 0xc501
     c03:	006c                	.insn	2, 0x006c
     c05:	0000                	.insn	2, 0x0000
     c07:	ea0e                	.insn	2, 0xea0e
     c09:	0004                	.insn	2, 0x0004
     c0b:	d000                	.insn	2, 0xd000
     c0d:	0800400b          	.insn	4, 0x0800400b
     c11:	0000                	.insn	2, 0x0000
     c13:	0100                	.insn	2, 0x0100
     c15:	05c8                	.insn	2, 0x05c8
     c17:	041e                	.insn	2, 0x041e
     c19:	000004f7          	.insn	4, 0x04f7
     c1d:	011d                	.insn	2, 0x011d
     c1f:	035a                	.insn	2, 0x035a
     c21:	0005                	.insn	2, 0x0005
     c23:	2000                	.insn	2, 0x2000
     c25:	5a01                	.insn	2, 0x5a01
     c27:	0000050f          	.insn	4, 0x050f
     c2b:	0421                	.insn	2, 0x0421
     c2d:	0000051b          	.insn	4, 0x051b
     c31:	0000                	.insn	2, 0x0000
     c33:	9522                	.insn	2, 0x9522
     c35:	0000                	.insn	2, 0x0000
     c37:	0100                	.insn	2, 0x0100
     c39:	130101e7          	jalr	gp,304(sp) # 133446 <$d.11+0x132d66>
     c3d:	0112                	.insn	2, 0x0112
     c3f:	0000                	.insn	2, 0x0000
     c41:	e701                	.insn	2, 0xe701
     c43:	6101                	.insn	2, 0x6101
     c45:	0000                	.insn	2, 0x0000
     c47:	1300                	.insn	2, 0x1300
     c49:	0220                	.insn	2, 0x0220
     c4b:	0000                	.insn	2, 0x0000
     c4d:	e801                	.insn	2, 0xe801
     c4f:	6101                	.insn	2, 0x6101
     c51:	0000                	.insn	2, 0x0000
     c53:	1300                	.insn	2, 0x1300
     c55:	0264                	.insn	2, 0x0264
     c57:	0000                	.insn	2, 0x0000
     c59:	e901                	.insn	2, 0xe901
     c5b:	6101                	.insn	2, 0x6101
     c5d:	0000                	.insn	2, 0x0000
     c5f:	1400                	.insn	2, 0x1400
     c61:	0194                	.insn	2, 0x0194
     c63:	0000                	.insn	2, 0x0000
     c65:	eb01                	.insn	2, 0xeb01
     c67:	6101                	.insn	2, 0x6101
     c69:	0000                	.insn	2, 0x0000
     c6b:	1400                	.insn	2, 0x1400
     c6d:	01f4                	.insn	2, 0x01f4
     c6f:	0000                	.insn	2, 0x0000
     c71:	ec01                	.insn	2, 0xec01
     c73:	6101                	.insn	2, 0x6101
     c75:	0000                	.insn	2, 0x0000
     c77:	1400                	.insn	2, 0x1400
     c79:	00000043          	.insn	4, 0x0043
     c7d:	ed01                	.insn	2, 0xed01
     c7f:	6101                	.insn	2, 0x6101
     c81:	0000                	.insn	2, 0x0000
     c83:	0000                	.insn	2, 0x0000
     c85:	dc16                	.insn	2, 0xdc16
     c87:	0c00400b          	.insn	4, 0x0c00400b
     c8b:	0000                	.insn	2, 0x0000
     c8d:	0100                	.insn	2, 0x0100
     c8f:	ef52                	.insn	2, 0xef52
     c91:	0000                	.insn	2, 0x0000
     c93:	0100                	.insn	2, 0x0100
     c95:	23d0                	.insn	2, 0x23d0
     c97:	5a01                	.insn	2, 0x5a01
     c99:	00000033          	add	zero,zero,zero
     c9d:	d001                	.insn	2, 0xd001
     c9f:	0061                	.insn	2, 0x0061
     ca1:	0000                	.insn	2, 0x0000
     ca3:	185b0123          	sb	t0,386(s6) # 5966c <$d.11+0x58f8c>
     ca7:	0000                	.insn	2, 0x0000
     ca9:	0100                	.insn	2, 0x0100
     cab:	61d0                	.insn	2, 0x61d0
     cad:	0000                	.insn	2, 0x0000
     caf:	0e00                	.insn	2, 0x0e00
     cb1:	0574                	.insn	2, 0x0574
     cb3:	0000                	.insn	2, 0x0000
     cb5:	0bdc                	.insn	2, 0x0bdc
     cb7:	0040                	.insn	2, 0x0040
     cb9:	0008                	.insn	2, 0x0008
     cbb:	0000                	.insn	2, 0x0000
     cbd:	d301                	.insn	2, 0xd301
     cbf:	1e05                	.insn	2, 0x1e05
     cc1:	7d05                	.insn	2, 0x7d05
     cc3:	0005                	.insn	2, 0x0005
     cc5:	1d00                	.insn	2, 0x1d00
     cc7:	5a01                	.insn	2, 0x5a01
     cc9:	0589                	.insn	2, 0x0589
     ccb:	0000                	.insn	2, 0x0000
     ccd:	011d                	.insn	2, 0x011d
     ccf:	0005955b          	.insn	4, 0x0005955b
     cd3:	2000                	.insn	2, 0x2000
     cd5:	5a01                	.insn	2, 0x5a01
     cd7:	05a1                	.insn	2, 0x05a1
     cd9:	0000                	.insn	2, 0x0000
     cdb:	0120                	.insn	2, 0x0120
     cdd:	0005ad5b          	.insn	4, 0x0005ad5b
     ce1:	2100                	.insn	2, 0x2100
     ce3:	b905                	.insn	2, 0xb905
     ce5:	0005                	.insn	2, 0x0005
     ce7:	0000                	.insn	2, 0x0000
     ce9:	2400                	.insn	2, 0x2400
     ceb:	0be8                	.insn	2, 0x0be8
     ced:	0040                	.insn	2, 0x0040
     cef:	0034                	.insn	2, 0x0034
     cf1:	0000                	.insn	2, 0x0000
     cf3:	5201                	.insn	2, 0x5201
     cf5:	000000e3          	beqz	zero,14f5 <$d.11+0xe15>
     cf9:	db01                	.insn	2, 0xdb01
     cfb:	091c                	.insn	2, 0x091c
     cfd:	0000                	.insn	2, 0x0000
     cff:	275a0123          	sb	s5,610(s4) # 5875e <$d.11+0x5807e>
     d03:	0000                	.insn	2, 0x0000
     d05:	0100                	.insn	2, 0x0100
     d07:	00091cdb          	.insn	4, 0x00091cdb
     d0b:	1700                	.insn	2, 0x1700
     d0d:	08f6                	.insn	2, 0x08f6
     d0f:	0000                	.insn	2, 0x0000
     d11:	0118                	.insn	2, 0x0118
     d13:	0000                	.insn	2, 0x0000
     d15:	db01                	.insn	2, 0xdb01
     d17:	0950                	.insn	2, 0x0950
     d19:	0000                	.insn	2, 0x0000
     d1b:	1c1a                	.insn	2, 0x1c1a
     d1d:	0009                	.insn	2, 0x0009
     d1f:	f700                	.insn	2, 0xf700
     d21:	0001                	.insn	2, 0x0001
     d23:	0100                	.insn	2, 0x0100
     d25:	1cdc                	.insn	2, 0x1cdc
     d27:	0009                	.insn	2, 0x0009
     d29:	0000                	.insn	2, 0x0000
     d2b:	1c24                	.insn	2, 0x1c24
     d2d:	400c                	.insn	2, 0x400c
     d2f:	4000                	.insn	2, 0x4000
     d31:	0000                	.insn	2, 0x0000
     d33:	0100                	.insn	2, 0x0100
     d35:	d552                	.insn	2, 0xd552
     d37:	0001                	.insn	2, 0x0001
     d39:	0100                	.insn	2, 0x0100
     d3b:	000073e3          	bgeu	zero,zero,1541 <$d.11+0xe61>
     d3f:	1700                	.insn	2, 0x1700
     d41:	094d                	.insn	2, 0x094d
     d43:	0000                	.insn	2, 0x0000
     d45:	00a8                	.insn	2, 0x00a8
     d47:	0000                	.insn	2, 0x0000
     d49:	e301                	.insn	2, 0xe301
     d4b:	0950                	.insn	2, 0x0950
     d4d:	0000                	.insn	2, 0x0000
     d4f:	00098b17          	auipc	s6,0x98
     d53:	ac00                	.insn	2, 0xac00
     d55:	0001                	.insn	2, 0x0001
     d57:	0100                	.insn	2, 0x0100
     d59:	000950e3          	bgez	s2,1559 <$d.11+0xe79>
     d5d:	0000                	.insn	2, 0x0000
     d5f:	5c16                	.insn	2, 0x5c16
     d61:	400c                	.insn	2, 0x400c
     d63:	0800                	.insn	2, 0x0800
     d65:	01000003          	lb	zero,16(zero) # 10 <$d.4+0x10>
     d69:	2552                	.insn	2, 0x2552
     d6b:	0002                	.insn	2, 0x0002
     d6d:	0100                	.insn	2, 0x0100
     d6f:	17ee                	.insn	2, 0x17ee
     d71:	09a6                	.insn	2, 0x09a6
     d73:	0000                	.insn	2, 0x0000
     d75:	023d                	.insn	2, 0x023d
     d77:	0000                	.insn	2, 0x0000
     d79:	ee01                	.insn	2, 0xee01
     d7b:	0950                	.insn	2, 0x0950
     d7d:	0000                	.insn	2, 0x0000
     d7f:	0218                	.insn	2, 0x0218
     d81:	1891                	.insn	2, 0x1891
     d83:	0269                	.insn	2, 0x0269
     d85:	0000                	.insn	2, 0x0000
     d87:	ef01                	.insn	2, 0xef01
     d89:	095a                	.insn	2, 0x095a
     d8b:	0000                	.insn	2, 0x0000
     d8d:	1c25                	.insn	2, 0x1c25
     d8f:	0002                	.insn	2, 0x0002
     d91:	0100                	.insn	2, 0x0100
     d93:	0134                	.insn	2, 0x0134
     d95:	0f28                	.insn	2, 0x0f28
     d97:	0040                	.insn	2, 0x0040
     d99:	c826                	.insn	2, 0xc826
     d9b:	0001                	.insn	2, 0x0001
     d9d:	2700                	.insn	2, 0x2700
     d9f:	9102                	.insn	2, 0x9102
     da1:	7a0d                	.insn	2, 0x7a0d
     da3:	0000                	.insn	2, 0x0000
     da5:	0100                	.insn	2, 0x0100
     da7:	0111                	.insn	2, 0x0111
     da9:	0964                	.insn	2, 0x0964
     dab:	0000                	.insn	2, 0x0000
     dad:	cc28                	.insn	2, 0xcc28
     daf:	0009                	.insn	2, 0x0009
     db1:	8200                	.insn	2, 0x8200
     db3:	0001                	.insn	2, 0x0001
     db5:	0100                	.insn	2, 0x0100
     db7:	0105                	.insn	2, 0x0105
     db9:	00000073          	ecall
     dbd:	f228                	.insn	2, 0xf228
     dbf:	0009                	.insn	2, 0x0009
     dc1:	4800                	.insn	2, 0x4800
     dc3:	0002                	.insn	2, 0x0002
     dc5:	0100                	.insn	2, 0x0100
     dc7:	006c0107          	.insn	4, 0x006c0107
     dcb:	0000                	.insn	2, 0x0000
     dcd:	2e28                	.insn	2, 0x2e28
     dcf:	000a                	.insn	2, 0x000a
     dd1:	2500                	.insn	2, 0x2500
     dd3:	0000                	.insn	2, 0x0000
     dd5:	0100                	.insn	2, 0x0100
     dd7:	0112                	.insn	2, 0x0112
     dd9:	00000073          	ecall
     ddd:	9b29                	.insn	2, 0x9b29
     ddf:	0001                	.insn	2, 0x0001
     de1:	3c00                	.insn	2, 0x3c00
     de3:	400d                	.insn	2, 0x400d
     de5:	1000                	.insn	2, 0x1000
     de7:	0000                	.insn	2, 0x0000
     de9:	0100                	.insn	2, 0x0100
     deb:	0116                	.insn	2, 0x0116
     ded:	1e19                	.insn	2, 0x1e19
     def:	a430                	.insn	2, 0xa430
     df1:	0001                	.insn	2, 0x0001
     df3:	0000                	.insn	2, 0x0000
     df5:	9b29                	.insn	2, 0x9b29
     df7:	0001                	.insn	2, 0x0001
     df9:	9800                	.insn	2, 0x9800
     dfb:	400e                	.insn	2, 0x400e
     dfd:	1000                	.insn	2, 0x1000
     dff:	0000                	.insn	2, 0x0000
     e01:	0100                	.insn	2, 0x0100
     e03:	0109                	.insn	2, 0x0109
     e05:	1e19                	.insn	2, 0x1e19
     e07:	a42d                	.insn	2, 0xa42d
     e09:	0001                	.insn	2, 0x0001
     e0b:	0000                	.insn	2, 0x0000
     e0d:	9b2a                	.insn	2, 0x9b2a
     e0f:	0001                	.insn	2, 0x0001
     e11:	fc00                	.insn	2, 0xfc00
     e13:	400e                	.insn	2, 0x400e
     e15:	0c00                	.insn	2, 0x0c00
     e17:	0000                	.insn	2, 0x0000
     e19:	0100                	.insn	2, 0x0100
     e1b:	0121                	.insn	2, 0x0121
     e1d:	0019                	.insn	2, 0x0019
     e1f:	5c19                	.insn	2, 0x5c19
     e21:	400d                	.insn	2, 0x400d
     e23:	e800                	.insn	2, 0xe800
     e25:	0000                	.insn	2, 0x0000
     e27:	2800                	.insn	2, 0x2800
     e29:	00000af3          	.insn	4, 0x0af3
     e2d:	0182                	.insn	2, 0x0182
     e2f:	0000                	.insn	2, 0x0000
     e31:	2601                	.insn	2, 0x2601
     e33:	6c01                	.insn	2, 0x6c01
     e35:	0000                	.insn	2, 0x0000
     e37:	1900                	.insn	2, 0x1900
     e39:	0d6c                	.insn	2, 0x0d6c
     e3b:	0040                	.insn	2, 0x0040
     e3d:	00d8                	.insn	2, 0x00d8
     e3f:	0000                	.insn	2, 0x0000
     e41:	6e28                	.insn	2, 0x6e28
     e43:	000a                	.insn	2, 0x000a
     e45:	2500                	.insn	2, 0x2500
     e47:	0000                	.insn	2, 0x0000
     e49:	0100                	.insn	2, 0x0100
     e4b:	00730127          	.insn	4, 0x00730127
     e4f:	0000                	.insn	2, 0x0000
     e51:	6c19                	.insn	2, 0x6c19
     e53:	400d                	.insn	2, 0x400d
     e55:	d800                	.insn	2, 0xd800
     e57:	0000                	.insn	2, 0x0000
     e59:	2800                	.insn	2, 0x2800
     e5b:	0b0e                	.insn	2, 0x0b0e
     e5d:	0000                	.insn	2, 0x0000
     e5f:	00ad                	.insn	2, 0x00ad
     e61:	0000                	.insn	2, 0x0000
     e63:	2801                	.insn	2, 0x2801
     e65:	6c01                	.insn	2, 0x6c01
     e67:	0000                	.insn	2, 0x0000
     e69:	2b00                	.insn	2, 0x2b00
     e6b:	0000019b          	.insn	4, 0x019b
     e6f:	01e0                	.insn	2, 0x01e0
     e71:	0000                	.insn	2, 0x0000
     e73:	2901                	.insn	2, 0x2901
     e75:	1901                	.insn	2, 0x1901
     e77:	0000                	.insn	2, 0x0000
     e79:	0e00                	.insn	2, 0x0e00
     e7b:	0000019b          	.insn	4, 0x019b
     e7f:	0e4c                	.insn	2, 0x0e4c
     e81:	0040                	.insn	2, 0x0040
     e83:	000c                	.insn	2, 0x000c
     e85:	0000                	.insn	2, 0x0000
     e87:	fa01                	.insn	2, 0xfa01
     e89:	1e15                	.insn	2, 0x1e15
     e8b:	a425                	.insn	2, 0xa425
     e8d:	0001                	.insn	2, 0x0001
     e8f:	0000                	.insn	2, 0x0000
     e91:	6019                	.insn	2, 0x6019
     e93:	400e                	.insn	2, 0x400e
     e95:	3800                	.insn	2, 0x3800
     e97:	0000                	.insn	2, 0x0000
     e99:	1a00                	.insn	2, 0x1a00
     e9b:	0b76                	.insn	2, 0x0b76
     e9d:	0000                	.insn	2, 0x0000
     e9f:	000000ab          	.insn	4, 0x00ab
     ea3:	fd01                	.insn	2, 0xfd01
     ea5:	0950                	.insn	2, 0x0950
     ea7:	0000                	.insn	2, 0x0000
     ea9:	9b0e                	.insn	2, 0x9b0e
     eab:	0001                	.insn	2, 0x0001
     ead:	7c00                	.insn	2, 0x7c00
     eaf:	400e                	.insn	2, 0x400e
     eb1:	0c00                	.insn	2, 0x0c00
     eb3:	0000                	.insn	2, 0x0000
     eb5:	0100                	.insn	2, 0x0100
     eb7:	011d19ff 0001a45b 	.insn	12, 0x0e0000000001a45b011d19ff
     ebf:	0e000000 
     ec3:	0000019b          	.insn	4, 0x019b
     ec7:	0f1c                	.insn	2, 0x0f1c
     ec9:	0040                	.insn	2, 0x0040
     ecb:	000c                	.insn	2, 0x000c
     ecd:	0000                	.insn	2, 0x0000
     ecf:	f701                	.insn	2, 0xf701
     ed1:	1e15                	.insn	2, 0x1e15
     ed3:	a425                	.insn	2, 0xa425
     ed5:	0001                	.insn	2, 0x0001
     ed7:	0000                	.insn	2, 0x0000
     ed9:	9b29                	.insn	2, 0x9b29
     edb:	0001                	.insn	2, 0x0001
     edd:	fc00                	.insn	2, 0xfc00
     edf:	400c                	.insn	2, 0x400c
     ee1:	0c00                	.insn	2, 0x0c00
     ee3:	0000                	.insn	2, 0x0000
     ee5:	0100                	.insn	2, 0x0100
     ee7:	012e                	.insn	2, 0x012e
     ee9:	1d0d                	.insn	2, 0x1d0d
     eeb:	5b01                	.insn	2, 0x5b01
     eed:	01a4                	.insn	2, 0x01a4
     eef:	0000                	.insn	2, 0x0000
     ef1:	2c00                	.insn	2, 0x2c00
     ef3:	2d00                	.insn	2, 0x2d00
     ef5:	0f64                	.insn	2, 0x0f64
     ef7:	0040                	.insn	2, 0x0040
     ef9:	00f0                	.insn	2, 0x00f0
     efb:	0000                	.insn	2, 0x0000
     efd:	5201                	.insn	2, 0x5201
     eff:	0252                	.insn	2, 0x0252
     f01:	0000                	.insn	2, 0x0000
     f03:	3c01                	.insn	2, 0x3c01
     f05:	6c01                	.insn	2, 0x6c01
     f07:	0000                	.insn	2, 0x0000
     f09:	2e00                	.insn	2, 0x2e00
     f0b:	0ba9                	.insn	2, 0x0ba9
     f0d:	0000                	.insn	2, 0x0000
     f0f:	000000ab          	.insn	4, 0x00ab
     f13:	3c01                	.insn	2, 0x3c01
     f15:	5001                	.insn	2, 0x5001
     f17:	0009                	.insn	2, 0x0009
     f19:	2800                	.insn	2, 0x2800
     f1b:	0bda                	.insn	2, 0x0bda
     f1d:	0000                	.insn	2, 0x0000
     f1f:	00ea                	.insn	2, 0x00ea
     f21:	0000                	.insn	2, 0x0000
     f23:	3d01                	.insn	2, 0x3d01
     f25:	6c01                	.insn	2, 0x6c01
     f27:	0000                	.insn	2, 0x0000
     f29:	2800                	.insn	2, 0x2800
     f2b:	0c19                	.insn	2, 0x0c19
     f2d:	0000                	.insn	2, 0x0000
     f2f:	007e                	.insn	2, 0x007e
     f31:	0000                	.insn	2, 0x0000
     f33:	4201                	.insn	2, 0x4201
     f35:	6c01                	.insn	2, 0x6c01
     f37:	0000                	.insn	2, 0x0000
     f39:	2600                	.insn	2, 0x2600
     f3b:	0228                	.insn	2, 0x0228
     f3d:	0000                	.insn	2, 0x0000
     f3f:	4b28                	.insn	2, 0x4b28
     f41:	000c                	.insn	2, 0x000c
     f43:	9e00                	.insn	2, 0x9e00
     f45:	0000                	.insn	2, 0x0000
     f47:	0100                	.insn	2, 0x0100
     f49:	0144                	.insn	2, 0x0144
     f4b:	0040                	.insn	2, 0x0040
     f4d:	0000                	.insn	2, 0x0000
     f4f:	6628                	.insn	2, 0x6628
     f51:	000c                	.insn	2, 0x000c
     f53:	f700                	.insn	2, 0xf700
     f55:	0001                	.insn	2, 0x0001
     f57:	0100                	.insn	2, 0x0100
     f59:	0145                	.insn	2, 0x0145
     f5b:	006c                	.insn	2, 0x006c
     f5d:	0000                	.insn	2, 0x0000
     f5f:	0000                	.insn	2, 0x0000
     f61:	542d                	.insn	2, 0x542d
     f63:	4010                	.insn	2, 0x4010
     f65:	8400                	.insn	2, 0x8400
     f67:	0000                	.insn	2, 0x0000
     f69:	0100                	.insn	2, 0x0100
     f6b:	7952                	.insn	2, 0x7952
     f6d:	0001                	.insn	2, 0x0001
     f6f:	0100                	.insn	2, 0x0100
     f71:	0151                	.insn	2, 0x0151
     f73:	0921                	.insn	2, 0x0921
     f75:	0000                	.insn	2, 0x0000
     f77:	812e                	.insn	2, 0x812e
     f79:	000c                	.insn	2, 0x000c
     f7b:	6200                	.insn	2, 0x6200
     f7d:	0000                	.insn	2, 0x0000
     f7f:	0100                	.insn	2, 0x0100
     f81:	0151                	.insn	2, 0x0151
     f83:	006c                	.insn	2, 0x006c
     f85:	0000                	.insn	2, 0x0000
     f87:	8419                	.insn	2, 0x8419
     f89:	4010                	.insn	2, 0x4010
     f8b:	3c00                	.insn	2, 0x3c00
     f8d:	0000                	.insn	2, 0x0000
     f8f:	2800                	.insn	2, 0x2800
     f91:	0cb2                	.insn	2, 0x0cb2
     f93:	0000                	.insn	2, 0x0000
     f95:	0025                	.insn	2, 0x0025
     f97:	0000                	.insn	2, 0x0000
     f99:	5501                	.insn	2, 0x5501
     f9b:	6c01                	.insn	2, 0x6c01
     f9d:	0000                	.insn	2, 0x0000
     f9f:	0000                	.insn	2, 0x0000
     fa1:	2d00                	.insn	2, 0x2d00
     fa3:	10d8                	.insn	2, 0x10d8
     fa5:	0040                	.insn	2, 0x0040
     fa7:	0014                	.insn	2, 0x0014
     fa9:	0000                	.insn	2, 0x0000
     fab:	5201                	.insn	2, 0x5201
     fad:	000001af          	.insn	4, 0x01af
     fb1:	a201                	.insn	2, 0xa201
     fb3:	7301                	.insn	2, 0x7301
     fb5:	0000                	.insn	2, 0x0000
     fb7:	2800                	.insn	2, 0x2800
     fb9:	0cf1                	.insn	2, 0x0cf1
     fbb:	0000                	.insn	2, 0x0000
     fbd:	0261                	.insn	2, 0x0261
     fbf:	0000                	.insn	2, 0x0000
     fc1:	a401                	.insn	2, 0xa401
     fc3:	7301                	.insn	2, 0x7301
     fc5:	0000                	.insn	2, 0x0000
     fc7:	0000                	.insn	2, 0x0000
     fc9:	4000002f          	.insn	4, 0x4000002f
     fcd:	1c00                	.insn	2, 0x1c00
     fcf:	0000                	.insn	2, 0x0000
     fd1:	0100                	.insn	2, 0x0100
     fd3:	0752                	.insn	2, 0x0752
     fd5:	0000                	.insn	2, 0x0000
     fd7:	0100                	.insn	2, 0x0100
     fd9:	01fc                	.insn	2, 0x01fc
     fdb:	4009                	.insn	2, 0x4009
     fdd:	0000                	.insn	2, 0x0000
     fdf:	0800                	.insn	2, 0x0800
     fe1:	00000073          	ecall
     fe5:	0072                	.insn	2, 0x0072
     fe7:	0000                	.insn	2, 0x0000
     fe9:	4e030e03          	lb	t3,1248(t1)
     fed:	0000                	.insn	2, 0x0000
     fef:	0400                	.insn	2, 0x0400
     ff1:	00000047          	.insn	4, 0x0047
     ff5:	040c                	.insn	2, 0x040c
     ff7:	00000047          	.insn	4, 0x0047
     ffb:	000c                	.insn	2, 0x000c
     ffd:	00006103          	.insn	4, 0x6103
    1001:	0400                	.insn	2, 0x0400
    1003:	00000047          	.insn	4, 0x0047
    1007:	040c                	.insn	2, 0x040c
    1009:	00000047          	.insn	4, 0x0047
    100d:	000c                	.insn	2, 0x000c
    100f:	5509                	.insn	2, 0x5509
    1011:	0009                	.insn	2, 0x0009
    1013:	3000                	.insn	2, 0x3000
    1015:	0040                	.insn	2, 0x0040
    1017:	0000                	.insn	2, 0x0000
    1019:	6331                	.insn	2, 0x6331
    101b:	0009                	.insn	2, 0x0009
    101d:	0100                	.insn	2, 0x0100
    101f:	0002                	.insn	2, 0x0002
    1021:	3200                	.insn	2, 0x3200
    1023:	00004003          	lbu	zero,0(zero) # 0 <$d.4>
    1027:	0400                	.insn	2, 0x0400
    1029:	00000047          	.insn	4, 0x0047
    102d:	00000b 	.3byte	0x00000b

セクション .debug_ranges の逆アセンブル:

00000000 <$d.5>:
   0:	04cc                	.insn	2, 0x04cc
   2:	0000                	.insn	2, 0x0000
   4:	04e8                	.insn	2, 0x04e8
   6:	0000                	.insn	2, 0x0000
   8:	05e8                	.insn	2, 0x05e8
   a:	0000                	.insn	2, 0x0000
   c:	05f4                	.insn	2, 0x05f4
	...
  16:	0000                	.insn	2, 0x0000
  18:	0454                	.insn	2, 0x0454
  1a:	0000                	.insn	2, 0x0000
  1c:	047c                	.insn	2, 0x047c
  1e:	0000                	.insn	2, 0x0000
  20:	04ec                	.insn	2, 0x04ec
  22:	0000                	.insn	2, 0x0000
  24:	0504                	.insn	2, 0x0504
	...
  2e:	0000                	.insn	2, 0x0000
  30:	0404                	.insn	2, 0x0404
  32:	0000                	.insn	2, 0x0000
  34:	0450                	.insn	2, 0x0450
  36:	0000                	.insn	2, 0x0000
  38:	04ac                	.insn	2, 0x04ac
  3a:	0000                	.insn	2, 0x0000
  3c:	04c0                	.insn	2, 0x04c0
  3e:	0000                	.insn	2, 0x0000
  40:	0538                	.insn	2, 0x0538
  42:	0000                	.insn	2, 0x0000
  44:	05e4                	.insn	2, 0x05e4
  46:	0000                	.insn	2, 0x0000
  48:	0600                	.insn	2, 0x0600
  4a:	0000                	.insn	2, 0x0000
  4c:	0664                	.insn	2, 0x0664
	...
  56:	0000                	.insn	2, 0x0000
  58:	040c                	.insn	2, 0x040c
  5a:	0000                	.insn	2, 0x0000
  5c:	0450                	.insn	2, 0x0450
  5e:	0000                	.insn	2, 0x0000
  60:	04b8                	.insn	2, 0x04b8
  62:	0000                	.insn	2, 0x0000
  64:	04c0                	.insn	2, 0x04c0
  66:	0000                	.insn	2, 0x0000
  68:	0538                	.insn	2, 0x0538
  6a:	0000                	.insn	2, 0x0000
  6c:	0590                	.insn	2, 0x0590
	...
  76:	0000                	.insn	2, 0x0000
  78:	0538                	.insn	2, 0x0538
  7a:	0000                	.insn	2, 0x0000
  7c:	0544                	.insn	2, 0x0544
  7e:	0000                	.insn	2, 0x0000
  80:	0548                	.insn	2, 0x0548
  82:	0000                	.insn	2, 0x0000
  84:	0554                	.insn	2, 0x0554
  86:	0000                	.insn	2, 0x0000
  88:	055c                	.insn	2, 0x055c
  8a:	0000                	.insn	2, 0x0000
  8c:	0590                	.insn	2, 0x0590
	...
  96:	0000                	.insn	2, 0x0000
  98:	059c                	.insn	2, 0x059c
  9a:	0000                	.insn	2, 0x0000
  9c:	05e4                	.insn	2, 0x05e4
  9e:	0000                	.insn	2, 0x0000
  a0:	0600                	.insn	2, 0x0600
  a2:	0000                	.insn	2, 0x0000
  a4:	0658                	.insn	2, 0x0658
	...
  ae:	0000                	.insn	2, 0x0000
  b0:	0600                	.insn	2, 0x0600
  b2:	0000                	.insn	2, 0x0000
  b4:	060c                	.insn	2, 0x060c
  b6:	0000                	.insn	2, 0x0000
  b8:	0610                	.insn	2, 0x0610
  ba:	0000                	.insn	2, 0x0000
  bc:	061c                	.insn	2, 0x061c
  be:	0000                	.insn	2, 0x0000
  c0:	0624                	.insn	2, 0x0624
  c2:	0000                	.insn	2, 0x0000
  c4:	0658                	.insn	2, 0x0658
	...
  ce:	0000                	.insn	2, 0x0000
  d0:	06cc                	.insn	2, 0x06cc
  d2:	0000                	.insn	2, 0x0000
  d4:	06e4                	.insn	2, 0x06e4
  d6:	0000                	.insn	2, 0x0000
  d8:	06e8                	.insn	2, 0x06e8
  da:	0000                	.insn	2, 0x0000
  dc:	06f4                	.insn	2, 0x06f4
  de:	0000                	.insn	2, 0x0000
  e0:	06fc                	.insn	2, 0x06fc
  e2:	0000                	.insn	2, 0x0000
  e4:	072c                	.insn	2, 0x072c
	...

000000f0 <$d.6>:
  f0:	08e8                	.insn	2, 0x08e8
  f2:	0040                	.insn	2, 0x0040
  f4:	0908                	.insn	2, 0x0908
  f6:	0040                	.insn	2, 0x0040
  f8:	09b4                	.insn	2, 0x09b4
  fa:	0040                	.insn	2, 0x0040
  fc:	09d4                	.insn	2, 0x09d4
  fe:	0040                	.insn	2, 0x0040
	...
 108:	0908                	.insn	2, 0x0908
 10a:	0040                	.insn	2, 0x0040
 10c:	0918                	.insn	2, 0x0918
 10e:	0040                	.insn	2, 0x0040
 110:	09d4                	.insn	2, 0x09d4
 112:	0040                	.insn	2, 0x0040
 114:	09e4                	.insn	2, 0x09e4
 116:	0040                	.insn	2, 0x0040
	...
 120:	0918                	.insn	2, 0x0918
 122:	0040                	.insn	2, 0x0040
 124:	0924                	.insn	2, 0x0924
 126:	0040                	.insn	2, 0x0040
 128:	09e4                	.insn	2, 0x09e4
 12a:	0040                	.insn	2, 0x0040
 12c:	09f0                	.insn	2, 0x09f0
 12e:	0040                	.insn	2, 0x0040
	...
 138:	09f4                	.insn	2, 0x09f4
 13a:	0040                	.insn	2, 0x0040
 13c:	0a04                	.insn	2, 0x0a04
 13e:	0040                	.insn	2, 0x0040
 140:	0ac4                	.insn	2, 0x0ac4
 142:	0040                	.insn	2, 0x0040
 144:	0ad4                	.insn	2, 0x0ad4
 146:	0040                	.insn	2, 0x0040
	...
 150:	0a04                	.insn	2, 0x0a04
 152:	0040                	.insn	2, 0x0040
 154:	0a10                	.insn	2, 0x0a10
 156:	0040                	.insn	2, 0x0040
 158:	0ad4                	.insn	2, 0x0ad4
 15a:	0040                	.insn	2, 0x0040
 15c:	0ae0                	.insn	2, 0x0ae0
 15e:	0040                	.insn	2, 0x0040
	...
 168:	0a10                	.insn	2, 0x0a10
 16a:	0040                	.insn	2, 0x0040
 16c:	0a1c                	.insn	2, 0x0a1c
 16e:	0040                	.insn	2, 0x0040
 170:	0ae0                	.insn	2, 0x0ae0
 172:	0040                	.insn	2, 0x0040
 174:	0aec                	.insn	2, 0x0aec
 176:	0040                	.insn	2, 0x0040
	...
 180:	0a94                	.insn	2, 0x0a94
 182:	0040                	.insn	2, 0x0040
 184:	0aa4                	.insn	2, 0x0aa4
 186:	0040                	.insn	2, 0x0040
 188:	0af0                	.insn	2, 0x0af0
 18a:	0040                	.insn	2, 0x0040
 18c:	0b00                	.insn	2, 0x0b00
 18e:	0040                	.insn	2, 0x0040
	...
 198:	0aa4                	.insn	2, 0x0aa4
 19a:	0040                	.insn	2, 0x0040
 19c:	0ab0                	.insn	2, 0x0ab0
 19e:	0040                	.insn	2, 0x0040
 1a0:	0b00                	.insn	2, 0x0b00
 1a2:	0040                	.insn	2, 0x0040
 1a4:	0b0c                	.insn	2, 0x0b0c
 1a6:	0040                	.insn	2, 0x0040
	...
 1b0:	0ab0                	.insn	2, 0x0ab0
 1b2:	0040                	.insn	2, 0x0040
 1b4:	0ac0                	.insn	2, 0x0ac0
 1b6:	0040                	.insn	2, 0x0040
 1b8:	0b0c                	.insn	2, 0x0b0c
 1ba:	0040                	.insn	2, 0x0040
 1bc:	0b18                	.insn	2, 0x0b18
 1be:	0040                	.insn	2, 0x0040
	...
 1c8:	0d24                	.insn	2, 0x0d24
 1ca:	0040                	.insn	2, 0x0040
 1cc:	0d4c                	.insn	2, 0x0d4c
 1ce:	0040                	.insn	2, 0x0040
 1d0:	0e98                	.insn	2, 0x0e98
 1d2:	0040                	.insn	2, 0x0040
 1d4:	0f18                	.insn	2, 0x0f18
 1d6:	0040                	.insn	2, 0x0040
	...
 1e0:	0d78                	.insn	2, 0x0d78
 1e2:	0040                	.insn	2, 0x0040
 1e4:	0d84                	.insn	2, 0x0d84
 1e6:	0040                	.insn	2, 0x0040
 1e8:	0d94                	.insn	2, 0x0d94
 1ea:	0040                	.insn	2, 0x0040
 1ec:	0da0                	.insn	2, 0x0da0
 1ee:	0040                	.insn	2, 0x0040
 1f0:	0db0                	.insn	2, 0x0db0
 1f2:	0040                	.insn	2, 0x0040
 1f4:	0dbc                	.insn	2, 0x0dbc
 1f6:	0040                	.insn	2, 0x0040
 1f8:	0dcc                	.insn	2, 0x0dcc
 1fa:	0040                	.insn	2, 0x0040
 1fc:	0dd8                	.insn	2, 0x0dd8
 1fe:	0040                	.insn	2, 0x0040
 200:	0de8                	.insn	2, 0x0de8
 202:	0040                	.insn	2, 0x0040
 204:	0df4                	.insn	2, 0x0df4
 206:	0040                	.insn	2, 0x0040
 208:	0e04                	.insn	2, 0x0e04
 20a:	0040                	.insn	2, 0x0040
 20c:	0e10                	.insn	2, 0x0e10
 20e:	0040                	.insn	2, 0x0040
 210:	0e20                	.insn	2, 0x0e20
 212:	0040                	.insn	2, 0x0040
 214:	0e2c                	.insn	2, 0x0e2c
 216:	0040                	.insn	2, 0x0040
 218:	0e38                	.insn	2, 0x0e38
 21a:	0040                	.insn	2, 0x0040
 21c:	0e44                	.insn	2, 0x0e44
 21e:	0040                	.insn	2, 0x0040
	...
 228:	0fc8                	.insn	2, 0x0fc8
 22a:	0040                	.insn	2, 0x0040
 22c:	1020                	.insn	2, 0x1020
 22e:	0040                	.insn	2, 0x0040
 230:	1024                	.insn	2, 0x1024
 232:	0040                	.insn	2, 0x0040
 234:	1028                	.insn	2, 0x1028
 236:	0040                	.insn	2, 0x0040
	...
 240:	0810                	.insn	2, 0x0810
 242:	0040                	.insn	2, 0x0040
 244:	10ec                	.insn	2, 0x10ec
 246:	0040                	.insn	2, 0x0040
 248:	0000                	.insn	2, 0x0000
 24a:	0040                	.insn	2, 0x0040
 24c:	001c                	.insn	2, 0x001c
 24e:	0040                	.insn	2, 0x0040
	...

セクション .debug_str の逆アセンブル:

00000000 <$d.6-0xb4>:
   0:	615f6473          	csrrsi	s0,htimedeltah,30
   4:	6970                	.insn	2, 0x6970
   6:	7300                	.insn	2, 0x7300
   8:	6174                	.insn	2, 0x6174
   a:	7472                	.insn	2, 0x7472
   c:	6300                	.insn	2, 0x6300
   e:	646d                	.insn	2, 0x646d
  10:	705f 6972 656d      	.insn	6, 0x656d6972705f
  16:	656c0073          	.insn	4, 0x656c0073
  1a:	006e                	.insn	2, 0x006e
  1c:	616d                	.insn	2, 0x616d
  1e:	7274                	.insn	2, 0x7274
  20:	7869                	.insn	2, 0x7869
  22:	435f 6900 6400      	.insn	6, 0x64006900435f
  28:	63007473          	csrrci	s0,0x630,0
  2c:	746e756f          	jal	a0,e7772 <$d.11+0xe7092>
  30:	7000                	.insn	2, 0x7000
  32:	6100                	.insn	2, 0x6100
  34:	6464                	.insn	2, 0x6464
  36:	0072                	.insn	2, 0x0072
  38:	616d                	.insn	2, 0x616d
  3a:	7274                	.insn	2, 0x7274
  3c:	7869                	.insn	2, 0x7869
  3e:	6d5f 7861 6100      	.insn	6, 0x610078616d5f
  44:	616d0033          	.insn	4, 0x616d0033
  48:	7274                	.insn	2, 0x7274
  4a:	7869                	.insn	2, 0x7869
  4c:	415f 6d00 7461      	.insn	6, 0x74616d00415f
  52:	6972                	.insn	2, 0x6972
  54:	5f78                	.insn	2, 0x5f78
  56:	657a6973          	csrrsi	s2,hviprio2h,20
  5a:	7000                	.insn	2, 0x7000
  5c:	6f72                	.insn	2, 0x6f72
  5e:	706d                	.insn	2, 0x706d
  60:	0074                	.insn	2, 0x0074
  62:	006e                	.insn	2, 0x006e
  64:	0074756f          	jal	a0,4786a <$d.11+0x4718a>
  68:	6975                	.insn	2, 0x6975
  6a:	746e                	.insn	2, 0x746e
  6c:	7470                	.insn	2, 0x7470
  6e:	5f72                	.insn	2, 0x5f72
  70:	0074                	.insn	2, 0x0074
  72:	6f62                	.insn	2, 0x6f62
  74:	61006c6f          	jal	s8,6684 <$d.11+0x5fa4>
  78:	0032                	.insn	2, 0x0032
  7a:	7562                	.insn	2, 0x7562
  7c:	0066                	.insn	2, 0x0066
  7e:	0076                	.insn	2, 0x0076
  80:	2f637273          	csrrci	tp,0x2f6,6
  84:	7375                	.insn	2, 0x7375
  86:	7265                	.insn	2, 0x7265
  88:	632e                	.insn	2, 0x632e
  8a:	7000                	.insn	2, 0x7000
  8c:	6972                	.insn	2, 0x6972
  8e:	746e                	.insn	2, 0x746e
  90:	695f 746e 6400      	.insn	6, 0x6400746e695f
  96:	6d75                	.insn	2, 0x6d75
  98:	5f70                	.insn	2, 0x5f70
  9a:	7061                	.insn	2, 0x7061
  9c:	0069                	.insn	2, 0x0069
  9e:	6d630063          	beq	t1,s6,75e <$d.11+0x7e>
  a2:	6c64                	.insn	2, 0x6c64
  a4:	6e69                	.insn	2, 0x6e69
  a6:	0065                	.insn	2, 0x0065
  a8:	73003173          	csrrc	sp,mhpmevent16h,zero
  ac:	6e00                	.insn	2, 0x6e00
  ae:	6269                	.insn	2, 0x6269
  b0:	6c62                	.insn	2, 0x6c62
  b2:	0065                	.insn	2, 0x0065

000000b4 <$d.6>:
  b4:	6255                	.insn	2, 0x6255
  b6:	6e75                	.insn	2, 0x6e75
  b8:	7574                	.insn	2, 0x7574
  ba:	6320                	.insn	2, 0x6320
  bc:	616c                	.insn	2, 0x616c
  be:	676e                	.insn	2, 0x676e
  c0:	7620                	.insn	2, 0x7620
  c2:	7265                	.insn	2, 0x7265
  c4:	6e6f6973          	csrrsi	s2,0x6e6,30
  c8:	3120                	.insn	2, 0x3120
  ca:	2e38                	.insn	2, 0x2e38
  cc:	2e31                	.insn	2, 0x2e31
  ce:	31282033          	.insn	4, 0x31282033
  d2:	6275                	.insn	2, 0x6275
  d4:	6e75                	.insn	2, 0x6e75
  d6:	7574                	.insn	2, 0x7574
  d8:	2931                	.insn	2, 0x2931
  da:	6d00                	.insn	2, 0x6d00
  dc:	7861                	.insn	2, 0x7861
  de:	7200                	.insn	2, 0x7200
  e0:	7465                	.insn	2, 0x7465
  e2:	7300                	.insn	2, 0x7300
  e4:	7274                	.insn	2, 0x7274
  e6:	00797063          	bgeu	s2,t2,e6 <$d.6+0x32>
  ea:	6162                	.insn	2, 0x6162
  ec:	63006573          	csrrsi	a0,0x630,0
  f0:	6c61                	.insn	2, 0x6c61
  f2:	5f6c                	.insn	2, 0x5f6c
  f4:	7564                	.insn	2, 0x7564
  f6:	706d                	.insn	2, 0x706d
  f8:	615f 6970 7500      	.insn	6, 0x75006970615f
  fe:	6e69                	.insn	2, 0x6e69
 100:	3374                	.insn	2, 0x3374
 102:	5f32                	.insn	2, 0x5f32
 104:	0074                	.insn	2, 0x0074
 106:	2f637273          	csrrci	tp,0x2f6,6
 10a:	6c656873          	csrrsi	a6,0x6c6,10
 10e:	2e6c                	.insn	2, 0x2e6c
 110:	79730063          	beq	t1,s7,890 <$d.11+0x1b0>
 114:	006f6e73          	csrrsi	t3,0x6,30
 118:	00637273          	csrrci	tp,0x6,6
 11c:	616d                	.insn	2, 0x616d
 11e:	6e69                	.insn	2, 0x6e69
 120:	7500                	.insn	2, 0x7500
 122:	736e                	.insn	2, 0x736e
 124:	6769                	.insn	2, 0x6769
 126:	656e                	.insn	2, 0x656e
 128:	2064                	.insn	2, 0x2064
 12a:	72616863          	bltu	sp,t1,85a <$d.11+0x17a>
 12e:	6300                	.insn	2, 0x6300
 130:	6168                	.insn	2, 0x6168
 132:	0072                	.insn	2, 0x0072
 134:	6e69                	.insn	2, 0x6e69
 136:	0074                	.insn	2, 0x0074
 138:	7261                	.insn	2, 0x7261
 13a:	73007667          	.insn	4, 0x73007667
 13e:	5f61                	.insn	2, 0x5f61
 140:	7061                	.insn	2, 0x7061
 142:	0069                	.insn	2, 0x0069
 144:	6d6f682f          	.insn	4, 0x6d6f682f
 148:	2f65                	.insn	2, 0x2f65
 14a:	6168                	.insn	2, 0x6168
 14c:	7572                	.insn	2, 0x7572
 14e:	6968                	.insn	2, 0x6968
 150:	502f6f6b          	.insn	4, 0x502f6f6b
 154:	6f72                	.insn	2, 0x6f72
 156:	6d617267          	.insn	4, 0x6d617267
 15a:	4353502f          	.insn	4, 0x4353502f
 15e:	525f 3356 4932      	.insn	6, 0x49323356525f
 164:	4353502f          	.insn	4, 0x4353502f
 168:	4f2d                	.insn	2, 0x4f2d
 16a:	454e                	.insn	2, 0x454e
 16c:	666f732f          	.insn	4, 0x666f732f
 170:	7774                	.insn	2, 0x7774
 172:	7261                	.insn	2, 0x7261
 174:	2f65                	.insn	2, 0x2f65
 176:	6900736f          	jal	t1,7806 <$d.11+0x7126>
 17a:	72705f73          	csrrwi	t5,mhpmevent7h,0
 17e:	6d69                	.insn	2, 0x6d69
 180:	0065                	.insn	2, 0x0065
 182:	6176                	.insn	2, 0x6176
 184:	756c                	.insn	2, 0x756c
 186:	0065                	.insn	2, 0x0065
 188:	6176                	.insn	2, 0x6176
 18a:	006c                	.insn	2, 0x006c
 18c:	63737973          	csrrci	s2,0x637,6
 190:	6c61                	.insn	2, 0x6c61
 192:	006c                	.insn	2, 0x006c
 194:	3061                	.insn	2, 0x3061
 196:	7500                	.insn	2, 0x7500
 198:	736e                	.insn	2, 0x736e
 19a:	6769                	.insn	2, 0x6769
 19c:	656e                	.insn	2, 0x656e
 19e:	2064                	.insn	2, 0x2064
 1a0:	6e69                	.insn	2, 0x6e69
 1a2:	0074                	.insn	2, 0x0074
 1a4:	7261                	.insn	2, 0x7261
 1a6:	61006367          	.insn	4, 0x61006367
 1aa:	0034                	.insn	2, 0x0034
 1ac:	67003273          	csrrc	tp,0x670,zero
 1b0:	7465                	.insn	2, 0x7465
 1b2:	72616863          	bltu	sp,t1,8e2 <$d.11+0x202>
 1b6:	5f00                	.insn	2, 0x5f00
 1b8:	415f 5252 5941      	.insn	6, 0x59415252415f
 1be:	535f 5a49 5f45      	.insn	6, 0x5f455a49535f
 1c4:	5954                	.insn	2, 0x5954
 1c6:	4550                	.insn	2, 0x4550
 1c8:	5f5f 7000 7261      	.insn	6, 0x726170005f5f
 1ce:	685f6573          	csrrsi	a0,0x685,30
 1d2:	7865                	.insn	2, 0x7865
 1d4:	7300                	.insn	2, 0x7300
 1d6:	7274                	.insn	2, 0x7274
 1d8:	00706d63          	bltu	zero,t2,1f2 <$d.4+0x52>
 1dc:	6c6c6163          	bltu	s8,t1,89e <$d.11+0x1be>
 1e0:	735f 5f61 7061      	.insn	6, 0x70615f61735f
 1e6:	0069                	.insn	2, 0x0069
 1e8:	6c6c6163          	bltu	s8,t1,8aa <$d.11+0x1ca>
 1ec:	735f 5f64 7061      	.insn	6, 0x70615f64735f
 1f2:	0069                	.insn	2, 0x0069
 1f4:	3161                	.insn	2, 0x3161
 1f6:	6400                	.insn	2, 0x6400
 1f8:	7500                	.insn	2, 0x7500
 1fa:	6e69                	.insn	2, 0x6e69
 1fc:	3874                	.insn	2, 0x3874
 1fe:	745f 5f00 625f      	.insn	6, 0x625f5f00745f
 204:	6975                	.insn	2, 0x6975
 206:	746c                	.insn	2, 0x746c
 208:	6e69                	.insn	2, 0x6e69
 20a:	765f 5f61 696c      	.insn	6, 0x696c5f61765f
 210:	6d007473          	csrrci	s0,0x6d0,0
 214:	7461                	.insn	2, 0x7461
 216:	6972                	.insn	2, 0x6972
 218:	5f78                	.insn	2, 0x5f78
 21a:	0042                	.insn	2, 0x0042
 21c:	6e65                	.insn	2, 0x6e65
 21e:	0064                	.insn	2, 0x0064
 220:	7261                	.insn	2, 0x7261
 222:	70003067          	.insn	4, 0x70003067
 226:	6972                	.insn	2, 0x6972
 228:	746e                	.insn	2, 0x746e
 22a:	0066                	.insn	2, 0x0066
 22c:	735f6473          	csrrsi	s0,mhpmevent21h,30
 230:	6365                	.insn	2, 0x6365
 232:	6f74                	.insn	2, 0x6f74
 234:	0072                	.insn	2, 0x0072
 236:	74636573          	csrrsi	a0,0x746,6
 23a:	6600726f          	jal	tp,789a <$d.11+0x71ba>
 23e:	746d                	.insn	2, 0x746d
 240:	6100                	.insn	2, 0x6100
 242:	6772                	.insn	2, 0x6772
 244:	0032                	.insn	2, 0x0032
 246:	006a                	.insn	2, 0x006a
 248:	0075                	.insn	2, 0x0075
 24a:	7570                	.insn	2, 0x7570
 24c:	6374                	.insn	2, 0x6374
 24e:	6168                	.insn	2, 0x6168
 250:	0072                	.insn	2, 0x0072
 252:	6170                	.insn	2, 0x6170
 254:	7372                	.insn	2, 0x7372
 256:	5f65                	.insn	2, 0x5f65
 258:	3375                	.insn	2, 0x3375
 25a:	0032                	.insn	2, 0x0032
 25c:	7865                	.insn	2, 0x7865
 25e:	7469                	.insn	2, 0x7469
 260:	6300                	.insn	2, 0x6300
 262:	0068                	.insn	2, 0x0068
 264:	7261                	.insn	2, 0x7261
 266:	76003167          	.insn	4, 0x76003167
 26a:	7261                	.insn	2, 0x7261
 26c:	007367 	.3byte	0x007367

セクション .comment の逆アセンブル:

00000000 <$d.1>:
   0:	5500                	.insn	2, 0x5500
   2:	7562                	.insn	2, 0x7562
   4:	746e                	.insn	2, 0x746e
   6:	2075                	.insn	2, 0x2075
   8:	6e616c63          	bltu	sp,t1,700 <$d.11+0x20>
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
  1e:	32727363          	bgeu	tp,t2,344 <$d.4+0x1a4>
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
  20:	066c                	.insn	2, 0x066c
  22:	0000                	.insn	2, 0x0000
  24:	0e44                	.insn	2, 0x0e44
  26:	01c0                	.insn	2, 0x01c0
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
  4c:	0688                	.insn	2, 0x0688
  4e:	0040                	.insn	2, 0x0040
  50:	00cc                	.insn	2, 0x00cc
  52:	0000                	.insn	2, 0x0000
  54:	001c                	.insn	2, 0x001c
  56:	0000                	.insn	2, 0x0000
  58:	0000                	.insn	2, 0x0000
  5a:	0000                	.insn	2, 0x0000
  5c:	0754                	.insn	2, 0x0754
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
  90:	0810                	.insn	2, 0x0810
  92:	0040                	.insn	2, 0x0040
  94:	0018                	.insn	2, 0x0018
  96:	0000                	.insn	2, 0x0000
  98:	0020                	.insn	2, 0x0020
  9a:	0000                	.insn	2, 0x0000
  9c:	0074                	.insn	2, 0x0074
  9e:	0000                	.insn	2, 0x0000
  a0:	0828                	.insn	2, 0x0828
  a2:	0040                	.insn	2, 0x0040
  a4:	0380                	.insn	2, 0x0380
  a6:	0000                	.insn	2, 0x0000
  a8:	0e44                	.insn	2, 0x0e44
  aa:	0780                	.insn	2, 0x0780
  ac:	815c                	.insn	2, 0x815c
  ae:	8801                	.insn	2, 0x8801
  b0:	8902                	.insn	2, 0x8902
  b2:	93049203          	lh	tp,-1744(s1)
  b6:	9405                	.insn	2, 0x9405
  b8:	9506                	.insn	2, 0x9506
  ba:	000c0007          	.insn	4, 0x000c0007
  be:	0000                	.insn	2, 0x0000
  c0:	0074                	.insn	2, 0x0074
  c2:	0000                	.insn	2, 0x0000
  c4:	0ba8                	.insn	2, 0x0ba8
  c6:	0040                	.insn	2, 0x0040
  c8:	0014                	.insn	2, 0x0014
  ca:	0000                	.insn	2, 0x0000
  cc:	000c                	.insn	2, 0x000c
  ce:	0000                	.insn	2, 0x0000
  d0:	0074                	.insn	2, 0x0074
  d2:	0000                	.insn	2, 0x0000
  d4:	0bbc                	.insn	2, 0x0bbc
  d6:	0040                	.insn	2, 0x0040
  d8:	0014                	.insn	2, 0x0014
  da:	0000                	.insn	2, 0x0000
  dc:	000c                	.insn	2, 0x000c
  de:	0000                	.insn	2, 0x0000
  e0:	0074                	.insn	2, 0x0074
  e2:	0000                	.insn	2, 0x0000
  e4:	0bd0                	.insn	2, 0x0bd0
  e6:	0040                	.insn	2, 0x0040
  e8:	000c                	.insn	2, 0x000c
  ea:	0000                	.insn	2, 0x0000
  ec:	000c                	.insn	2, 0x000c
  ee:	0000                	.insn	2, 0x0000
  f0:	0074                	.insn	2, 0x0074
  f2:	0000                	.insn	2, 0x0000
  f4:	0bdc                	.insn	2, 0x0bdc
  f6:	0040                	.insn	2, 0x0040
  f8:	000c                	.insn	2, 0x000c
  fa:	0000                	.insn	2, 0x0000
  fc:	000c                	.insn	2, 0x000c
  fe:	0000                	.insn	2, 0x0000
 100:	0074                	.insn	2, 0x0074
 102:	0000                	.insn	2, 0x0000
 104:	0be8                	.insn	2, 0x0be8
 106:	0040                	.insn	2, 0x0040
 108:	0034                	.insn	2, 0x0034
 10a:	0000                	.insn	2, 0x0000
 10c:	000c                	.insn	2, 0x000c
 10e:	0000                	.insn	2, 0x0000
 110:	0074                	.insn	2, 0x0074
 112:	0000                	.insn	2, 0x0000
 114:	0c1c                	.insn	2, 0x0c1c
 116:	0040                	.insn	2, 0x0040
 118:	0040                	.insn	2, 0x0040
 11a:	0000                	.insn	2, 0x0000
 11c:	002c                	.insn	2, 0x002c
 11e:	0000                	.insn	2, 0x0000
 120:	0074                	.insn	2, 0x0074
 122:	0000                	.insn	2, 0x0000
 124:	0c5c                	.insn	2, 0x0c5c
 126:	0040                	.insn	2, 0x0040
 128:	0308                	.insn	2, 0x0308
 12a:	0000                	.insn	2, 0x0000
 12c:	0e44                	.insn	2, 0x0e44
 12e:	7470                	.insn	2, 0x7470
 130:	0981                	.insn	2, 0x0981
 132:	0a88                	.insn	2, 0x0a88
 134:	0b89                	.insn	2, 0x0b89
 136:	0c92                	.insn	2, 0x0c92
 138:	0e940d93          	addi	s11,s0,233 # 5759d <$d.11+0x56ebd>
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
 154:	0f64                	.insn	2, 0x0f64
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
 178:	1054                	.insn	2, 0x1054
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
 194:	10d8                	.insn	2, 0x10d8
 196:	0040                	.insn	2, 0x0040
 198:	0014                	.insn	2, 0x0014
 19a:	0000                	.insn	2, 0x0000
 19c:	000c                	.insn	2, 0x000c
 19e:	0000                	.insn	2, 0x0000
 1a0:	0074                	.insn	2, 0x0074
 1a2:	0000                	.insn	2, 0x0000
 1a4:	0000                	.insn	2, 0x0000
 1a6:	0040                	.insn	2, 0x0040
 1a8:	001c                	.insn	2, 0x001c
	...

セクション .debug_line の逆アセンブル:

00000000 <$d.10>:
   0:	06dc                	.insn	2, 0x06dc
   2:	0000                	.insn	2, 0x0000
   4:	0004                	.insn	2, 0x0004
   6:	0000002f          	.insn	4, 0x002f
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
  38:	0000                	.insn	2, 0x0000
  3a:	0205                	.insn	2, 0x0205
  3c:	001c                	.insn	2, 0x001c
  3e:	0040                	.insn	2, 0x0040
  40:	0515                	.insn	2, 0x0515
  42:	0a05                	.insn	2, 0x0a05
  44:	38090a03          	lb	s4,896(s2) # 567c8 <$d.11+0x560e8>
  48:	0100                	.insn	2, 0x0100
  4a:	0306                	.insn	2, 0x0306
  4c:	0972                	.insn	2, 0x0972
  4e:	0010                	.insn	2, 0x0010
  50:	0501                	.insn	2, 0x0501
  52:	0609                	.insn	2, 0x0609
  54:	fc091903          	lh	s2,-64(s2)
  58:	0100                	.insn	2, 0x0100
  5a:	1805                	.insn	2, 0x1805
  5c:	0306                	.insn	2, 0x0306
  5e:	0900                	.insn	2, 0x0900
  60:	000c                	.insn	2, 0x000c
  62:	0501                	.insn	2, 0x0501
  64:	0326                	.insn	2, 0x0326
  66:	0900                	.insn	2, 0x0900
  68:	000c                	.insn	2, 0x000c
  6a:	0501                	.insn	2, 0x0501
  6c:	0334                	.insn	2, 0x0334
  6e:	0900                	.insn	2, 0x0900
  70:	000c                	.insn	2, 0x000c
  72:	0501                	.insn	2, 0x0501
  74:	0342                	.insn	2, 0x0342
  76:	0900                	.insn	2, 0x0900
  78:	000c                	.insn	2, 0x000c
  7a:	0501                	.insn	2, 0x0501
  7c:	0609                	.insn	2, 0x0609
  7e:	0c090203          	lb	tp,192(s2)
  82:	0100                	.insn	2, 0x0100
  84:	0c090103          	lb	sp,192(s2)
  88:	0100                	.insn	2, 0x0100
  8a:	0c090103          	lb	sp,192(s2)
  8e:	0100                	.insn	2, 0x0100
  90:	0c090103          	lb	sp,192(s2)
  94:	0100                	.insn	2, 0x0100
  96:	0c090103          	lb	sp,192(s2)
  9a:	0100                	.insn	2, 0x0100
  9c:	0c090103          	lb	sp,192(s2)
  a0:	0100                	.insn	2, 0x0100
  a2:	0c090103          	lb	sp,192(s2)
  a6:	0100                	.insn	2, 0x0100
  a8:	0c090103          	lb	sp,192(s2)
  ac:	0100                	.insn	2, 0x0100
  ae:	0c090203          	lb	tp,192(s2)
  b2:	0100                	.insn	2, 0x0100
  b4:	1805                	.insn	2, 0x1805
  b6:	0306                	.insn	2, 0x0306
  b8:	0900                	.insn	2, 0x0900
  ba:	000c                	.insn	2, 0x000c
  bc:	0501                	.insn	2, 0x0501
  be:	0326                	.insn	2, 0x0326
  c0:	0900                	.insn	2, 0x0900
  c2:	000c                	.insn	2, 0x000c
  c4:	0501                	.insn	2, 0x0501
  c6:	0334                	.insn	2, 0x0334
  c8:	0900                	.insn	2, 0x0900
  ca:	000c                	.insn	2, 0x000c
  cc:	0301                	.insn	2, 0x0301
  ce:	095c                	.insn	2, 0x095c
  d0:	000c                	.insn	2, 0x000c
  d2:	0501                	.insn	2, 0x0501
  d4:	0619                	.insn	2, 0x0619
  d6:	08093603          	.insn	4, 0x08093603
  da:	0100                	.insn	2, 0x0100
  dc:	1505                	.insn	2, 0x1505
  de:	04090103          	lb	sp,64(s2)
  e2:	0100                	.insn	2, 0x0100
  e4:	1605                	.insn	2, 0x1605
  e6:	04097703          	.insn	4, 0x04097703
  ea:	0100                	.insn	2, 0x0100
  ec:	1c05                	.insn	2, 0x1c05
  ee:	08090303          	lb	t1,128(s2)
  f2:	0100                	.insn	2, 0x0100
  f4:	1905                	.insn	2, 0x1905
  f6:	08090503          	lb	a0,128(s2)
  fa:	0100                	.insn	2, 0x0100
  fc:	0306                	.insn	2, 0x0306
  fe:	094a                	.insn	2, 0x094a
 100:	0008                	.insn	2, 0x0008
 102:	0301                	.insn	2, 0x0301
 104:	0936                	.insn	2, 0x0936
 106:	0008                	.insn	2, 0x0008
 108:	0301                	.insn	2, 0x0301
 10a:	094a                	.insn	2, 0x094a
 10c:	0004                	.insn	2, 0x0004
 10e:	0501                	.insn	2, 0x0501
 110:	0611                	.insn	2, 0x0611
 112:	0900cf03          	lbu	t5,144(ra) # 90 <$d.10+0x1c>
 116:	0008                	.insn	2, 0x0008
 118:	0501                	.insn	2, 0x0501
 11a:	030d                	.insn	2, 0x030d
 11c:	0906                	.insn	2, 0x0906
 11e:	0008                	.insn	2, 0x0008
 120:	0501                	.insn	2, 0x0501
 122:	0618                	.insn	2, 0x0618
 124:	04090003          	lb	zero,64(s2)
 128:	0100                	.insn	2, 0x0100
 12a:	1c05                	.insn	2, 0x1c05
 12c:	04090003          	lb	zero,64(s2)
 130:	0100                	.insn	2, 0x0100
 132:	1805                	.insn	2, 0x1805
 134:	0306                	.insn	2, 0x0306
 136:	00080963          	beqz	a6,148 <$d.6+0x58>
 13a:	0501                	.insn	2, 0x0501
 13c:	0315                	.insn	2, 0x0315
 13e:	00040903          	lb	s2,0(s0)
 142:	0301                	.insn	2, 0x0301
 144:	0901                	.insn	2, 0x0901
 146:	000c                	.insn	2, 0x000c
 148:	0601                	.insn	2, 0x0601
 14a:	0c094403          	lbu	s0,192(s2)
 14e:	0100                	.insn	2, 0x0100
 150:	1105                	.insn	2, 0x1105
 152:	0306                	.insn	2, 0x0306
 154:	00c5                	.insn	2, 0x00c5
 156:	1409                	.insn	2, 0x1409
 158:	0100                	.insn	2, 0x0100
 15a:	0c090103          	lb	sp,192(s2)
 15e:	0100                	.insn	2, 0x0100
 160:	1e05                	.insn	2, 0x1e05
 162:	0306                	.insn	2, 0x0306
 164:	0900                	.insn	2, 0x0900
 166:	0004                	.insn	2, 0x0004
 168:	0301                	.insn	2, 0x0301
 16a:	7fba                	.insn	2, 0x7fba
 16c:	0809                	.insn	2, 0x0809
 16e:	0100                	.insn	2, 0x0100
 170:	2a05                	.insn	2, 0x2a05
 172:	0306                	.insn	2, 0x0306
 174:	080900e3          	beqz	s2,9f4 <$d.11+0x314>
 178:	0100                	.insn	2, 0x0100
 17a:	1005                	.insn	2, 0x1005
 17c:	0306                	.insn	2, 0x0306
 17e:	0900                	.insn	2, 0x0900
 180:	0004                	.insn	2, 0x0004
 182:	0301                	.insn	2, 0x0301
 184:	7f9d                	.insn	2, 0x7f9d
 186:	0809                	.insn	2, 0x0809
 188:	0100                	.insn	2, 0x0100
 18a:	1605                	.insn	2, 0x1605
 18c:	0306                	.insn	2, 0x0306
 18e:	00e6                	.insn	2, 0x00e6
 190:	1409                	.insn	2, 0x1409
 192:	0100                	.insn	2, 0x0100
 194:	0d05                	.insn	2, 0x0d05
 196:	0306                	.insn	2, 0x0306
 198:	0900                	.insn	2, 0x0900
 19a:	0004                	.insn	2, 0x0004
 19c:	0501                	.insn	2, 0x0501
 19e:	031a                	.insn	2, 0x031a
 1a0:	0900                	.insn	2, 0x0900
 1a2:	0008                	.insn	2, 0x0008
 1a4:	0501                	.insn	2, 0x0501
 1a6:	060d                	.insn	2, 0x060d
 1a8:	04090203          	lb	tp,64(s2)
 1ac:	0100                	.insn	2, 0x0100
 1ae:	1405                	.insn	2, 0x1405
 1b0:	0306                	.insn	2, 0x0306
 1b2:	0900                	.insn	2, 0x0900
 1b4:	0004                	.insn	2, 0x0004
 1b6:	0501                	.insn	2, 0x0501
 1b8:	09000317          	auipc	t1,0x9000
 1bc:	0004                	.insn	2, 0x0004
 1be:	0501                	.insn	2, 0x0501
 1c0:	0334                	.insn	2, 0x0334
 1c2:	0900                	.insn	2, 0x0900
 1c4:	000c                	.insn	2, 0x000c
 1c6:	0501                	.insn	2, 0x0501
 1c8:	030d                	.insn	2, 0x030d
 1ca:	0900                	.insn	2, 0x0900
 1cc:	0004                	.insn	2, 0x0004
 1ce:	0501                	.insn	2, 0x0501
 1d0:	0314                	.insn	2, 0x0314
 1d2:	0900                	.insn	2, 0x0900
 1d4:	0004                	.insn	2, 0x0004
 1d6:	0501                	.insn	2, 0x0501
 1d8:	0612                	.insn	2, 0x0612
 1da:	0c090303          	lb	t1,192(s2)
 1de:	0100                	.insn	2, 0x0100
 1e0:	0005                	.insn	2, 0x0005
 1e2:	0306                	.insn	2, 0x0306
 1e4:	7f95                	.insn	2, 0x7f95
 1e6:	0809                	.insn	2, 0x0809
 1e8:	0100                	.insn	2, 0x0100
 1ea:	1405                	.insn	2, 0x1405
 1ec:	0306                	.insn	2, 0x0306
 1ee:	00ec                	.insn	2, 0x00ec
 1f0:	0409                	.insn	2, 0x0409
 1f2:	0100                	.insn	2, 0x0100
 1f4:	1e05                	.insn	2, 0x1e05
 1f6:	0306                	.insn	2, 0x0306
 1f8:	0900                	.insn	2, 0x0900
 1fa:	0004                	.insn	2, 0x0004
 1fc:	0501                	.insn	2, 0x0501
 1fe:	0609                	.insn	2, 0x0609
 200:	08097903          	.insn	4, 0x08097903
 204:	0100                	.insn	2, 0x0100
 206:	1405                	.insn	2, 0x1405
 208:	0c090d03          	lb	s10,192(s2)
 20c:	0100                	.insn	2, 0x0100
 20e:	0d05                	.insn	2, 0x0d05
 210:	0306                	.insn	2, 0x0306
 212:	0900                	.insn	2, 0x0900
 214:	0004                	.insn	2, 0x0004
 216:	0301                	.insn	2, 0x0301
 218:	0900                	.insn	2, 0x0900
 21a:	0010                	.insn	2, 0x0010
 21c:	0501                	.insn	2, 0x0501
 21e:	0614                	.insn	2, 0x0614
 220:	04090403          	lb	s0,64(s2)
 224:	0100                	.insn	2, 0x0100
 226:	0306                	.insn	2, 0x0306
 228:	0900                	.insn	2, 0x0900
 22a:	0010                	.insn	2, 0x0010
 22c:	0601                	.insn	2, 0x0601
 22e:	04091d03          	lh	s10,64(s2)
 232:	0100                	.insn	2, 0x0100
 234:	0306                	.insn	2, 0x0306
 236:	0900                	.insn	2, 0x0900
 238:	0010                	.insn	2, 0x0010
 23a:	0601                	.insn	2, 0x0601
 23c:	04090c03          	lb	s8,64(s2)
 240:	0100                	.insn	2, 0x0100
 242:	0306                	.insn	2, 0x0306
 244:	0900                	.insn	2, 0x0900
 246:	0010                	.insn	2, 0x0010
 248:	0601                	.insn	2, 0x0601
 24a:	04090d03          	lb	s10,64(s2)
 24e:	0100                	.insn	2, 0x0100
 250:	0306                	.insn	2, 0x0306
 252:	0900                	.insn	2, 0x0900
 254:	0010                	.insn	2, 0x0010
 256:	0601                	.insn	2, 0x0601
 258:	04090a03          	lb	s4,64(s2)
 25c:	0100                	.insn	2, 0x0100
 25e:	0306                	.insn	2, 0x0306
 260:	0900                	.insn	2, 0x0900
 262:	0010                	.insn	2, 0x0010
 264:	0601                	.insn	2, 0x0601
 266:	04090b03          	lb	s6,64(s2)
 26a:	0100                	.insn	2, 0x0100
 26c:	3105                	.insn	2, 0x3105
 26e:	0306                	.insn	2, 0x0306
 270:	0900                	.insn	2, 0x0900
 272:	0010                	.insn	2, 0x0010
 274:	0501                	.insn	2, 0x0501
 276:	0614                	.insn	2, 0x0614
 278:	04090103          	lb	sp,64(s2)
 27c:	0100                	.insn	2, 0x0100
 27e:	3105                	.insn	2, 0x3105
 280:	0306                	.insn	2, 0x0306
 282:	0900                	.insn	2, 0x0900
 284:	0010                	.insn	2, 0x0010
 286:	0501                	.insn	2, 0x0501
 288:	0614                	.insn	2, 0x0614
 28a:	04090103          	lb	sp,64(s2)
 28e:	0100                	.insn	2, 0x0100
 290:	10097e03          	.insn	4, 0x10097e03
 294:	0100                	.insn	2, 0x0100
 296:	0306                	.insn	2, 0x0306
 298:	04097ebf 0d050100 	.insn	8, 0x0d05010004097ebf
 2a0:	0306                	.insn	2, 0x0306
 2a2:	040901c7          	.insn	4, 0x040901c7
 2a6:	0100                	.insn	2, 0x0100
 2a8:	0306                	.insn	2, 0x0306
 2aa:	7eb9                	.insn	2, 0x7eb9
 2ac:	0c09                	.insn	2, 0x0c09
 2ae:	0100                	.insn	2, 0x0100
 2b0:	1105                	.insn	2, 0x1105
 2b2:	0306                	.insn	2, 0x0306
 2b4:	00fc                	.insn	2, 0x00fc
 2b6:	0c09                	.insn	2, 0x0c09
 2b8:	0100                	.insn	2, 0x0100
 2ba:	1f05                	.insn	2, 0x1f05
 2bc:	04090103          	lb	sp,64(s2)
 2c0:	0100                	.insn	2, 0x0100
 2c2:	0505                	.insn	2, 0x0505
 2c4:	0900e503          	.insn	4, 0x0900e503
 2c8:	0004                	.insn	2, 0x0004
 2ca:	0601                	.insn	2, 0x0601
 2cc:	097e9e03          	lh	t3,151(t4)
 2d0:	0004                	.insn	2, 0x0004
 2d2:	0301                	.insn	2, 0x0301
 2d4:	01e2                	.insn	2, 0x01e2
 2d6:	0c09                	.insn	2, 0x0c09
 2d8:	0100                	.insn	2, 0x0100
 2da:	0c05                	.insn	2, 0x0c05
 2dc:	04090003          	lb	zero,64(s2)
 2e0:	0100                	.insn	2, 0x0100
 2e2:	1605                	.insn	2, 0x1605
 2e4:	04090003          	lb	zero,64(s2)
 2e8:	0100                	.insn	2, 0x0100
 2ea:	1905                	.insn	2, 0x1905
 2ec:	0306                	.insn	2, 0x0306
 2ee:	00100903          	lb	s2,1(zero) # 1 <$d.10+0x1>
 2f2:	0501                	.insn	2, 0x0501
 2f4:	0625                	.insn	2, 0x0625
 2f6:	04090003          	lb	zero,64(s2)
 2fa:	0100                	.insn	2, 0x0100
 2fc:	0a05                	.insn	2, 0x0a05
 2fe:	0306                	.insn	2, 0x0306
 300:	0901                	.insn	2, 0x0901
 302:	000c                	.insn	2, 0x000c
 304:	0601                	.insn	2, 0x0601
 306:	097e9a03          	lh	s4,151(t4)
 30a:	0004                	.insn	2, 0x0004
 30c:	0501                	.insn	2, 0x0501
 30e:	0611                	.insn	2, 0x0611
 310:	09019503          	lh	a0,144(gp) # 129811d0 <USER_MAX+0x124811d0>
 314:	000c                	.insn	2, 0x000c
 316:	0501                	.insn	2, 0x0501
 318:	0321                	.insn	2, 0x0321
 31a:	0901                	.insn	2, 0x0901
 31c:	0004                	.insn	2, 0x0004
 31e:	0501                	.insn	2, 0x0501
 320:	00030617          	auipc	a2,0x30
 324:	0409                	.insn	2, 0x0409
 326:	0100                	.insn	2, 0x0100
 328:	097eea03          	.insn	4, 0x097eea03
 32c:	0008                	.insn	2, 0x0008
 32e:	0501                	.insn	2, 0x0501
 330:	0615                	.insn	2, 0x0615
 332:	09019703          	lh	a4,144(gp)
 336:	0004                	.insn	2, 0x0004
 338:	0601                	.insn	2, 0x0601
 33a:	097ee903          	.insn	4, 0x097ee903
 33e:	0004                	.insn	2, 0x0004
 340:	0601                	.insn	2, 0x0601
 342:	09019803          	lh	a6,144(gp)
 346:	0004                	.insn	2, 0x0004
 348:	0601                	.insn	2, 0x0601
 34a:	097ee803          	.insn	4, 0x097ee803
 34e:	0008                	.insn	2, 0x0008
 350:	0501                	.insn	2, 0x0501
 352:	0611                	.insn	2, 0x0611
 354:	0901a103          	lw	sp,144(gp)
 358:	0004                	.insn	2, 0x0004
 35a:	0501                	.insn	2, 0x0501
 35c:	0328                	.insn	2, 0x0328
 35e:	0901                	.insn	2, 0x0901
 360:	0004                	.insn	2, 0x0004
 362:	0501                	.insn	2, 0x0501
 364:	061e                	.insn	2, 0x061e
 366:	04090003          	lb	zero,64(s2)
 36a:	0100                	.insn	2, 0x0100
 36c:	1505                	.insn	2, 0x1505
 36e:	0306                	.insn	2, 0x0306
 370:	0901                	.insn	2, 0x0901
 372:	0008                	.insn	2, 0x0008
 374:	0501                	.insn	2, 0x0501
 376:	030d                	.insn	2, 0x030d
 378:	0906                	.insn	2, 0x0906
 37a:	0004                	.insn	2, 0x0004
 37c:	0601                	.insn	2, 0x0601
 37e:	097ed703          	lhu	a4,151(t4)
 382:	000c                	.insn	2, 0x000c
 384:	0601                	.insn	2, 0x0601
 386:	09018803          	lb	a6,144(gp)
 38a:	0010                	.insn	2, 0x0010
 38c:	0601                	.insn	2, 0x0601
 38e:	097ef803          	.insn	4, 0x097ef803
 392:	0008                	.insn	2, 0x0008
 394:	0501                	.insn	2, 0x0501
 396:	060a                	.insn	2, 0x060a
 398:	0901e603          	.insn	4, 0x0901e603
 39c:	0004                	.insn	2, 0x0004
 39e:	0501                	.insn	2, 0x0501
 3a0:	0609                	.insn	2, 0x0609
 3a2:	04090003          	lb	zero,64(s2)
 3a6:	0100                	.insn	2, 0x0100
 3a8:	097e9a03          	lh	s4,151(t4)
 3ac:	0004                	.insn	2, 0x0004
 3ae:	0501                	.insn	2, 0x0501
 3b0:	0611                	.insn	2, 0x0611
 3b2:	0901ad03          	lw	s10,144(gp)
 3b6:	000c                	.insn	2, 0x000c
 3b8:	0501                	.insn	2, 0x0501
 3ba:	032c                	.insn	2, 0x032c
 3bc:	0905                	.insn	2, 0x0905
 3be:	0004                	.insn	2, 0x0004
 3c0:	0501                	.insn	2, 0x0501
 3c2:	0622                	.insn	2, 0x0622
 3c4:	04090003          	lb	zero,64(s2)
 3c8:	0100                	.insn	2, 0x0100
 3ca:	0d05                	.insn	2, 0x0d05
 3cc:	0306                	.insn	2, 0x0306
 3ce:	0901                	.insn	2, 0x0901
 3d0:	0008                	.insn	2, 0x0008
 3d2:	0601                	.insn	2, 0x0601
 3d4:	097ecd03          	lbu	s10,151(t4)
 3d8:	0008                	.insn	2, 0x0008
 3da:	0601                	.insn	2, 0x0601
 3dc:	09019c03          	lh	s8,144(gp)
 3e0:	0008                	.insn	2, 0x0008
 3e2:	0601                	.insn	2, 0x0601
 3e4:	097ee403          	.insn	4, 0x097ee403
 3e8:	0008                	.insn	2, 0x0008
 3ea:	0301                	.insn	2, 0x0301
 3ec:	019c                	.insn	2, 0x019c
 3ee:	0409                	.insn	2, 0x0409
 3f0:	0100                	.insn	2, 0x0100
 3f2:	097ee403          	.insn	4, 0x097ee403
 3f6:	0008                	.insn	2, 0x0008
 3f8:	0501                	.insn	2, 0x0501
 3fa:	0616                	.insn	2, 0x0616
 3fc:	0901eb03          	.insn	4, 0x0901eb03
 400:	0038                	.insn	2, 0x0038
 402:	0501                	.insn	2, 0x0501
 404:	0600                	.insn	2, 0x0600
 406:	097e9503          	lh	a0,151(t4)
 40a:	0008                	.insn	2, 0x0008
 40c:	0501                	.insn	2, 0x0501
 40e:	060c                	.insn	2, 0x060c
 410:	0901e803          	.insn	4, 0x0901e803
 414:	0004                	.insn	2, 0x0004
 416:	0501                	.insn	2, 0x0501
 418:	0600                	.insn	2, 0x0600
 41a:	097e9803          	lh	a6,151(t4)
 41e:	0004                	.insn	2, 0x0004
 420:	0501                	.insn	2, 0x0501
 422:	0610                	.insn	2, 0x0610
 424:	0901ef03          	.insn	4, 0x0901ef03
 428:	0004                	.insn	2, 0x0004
 42a:	0501                	.insn	2, 0x0501
 42c:	0616                	.insn	2, 0x0616
 42e:	04090003          	lb	zero,64(s2)
 432:	0100                	.insn	2, 0x0100
 434:	0505                	.insn	2, 0x0505
 436:	0306                	.insn	2, 0x0306
 438:	0979                	.insn	2, 0x0979
 43a:	0004                	.insn	2, 0x0004
 43c:	0601                	.insn	2, 0x0601
 43e:	097e9803          	lh	a6,151(t4)
 442:	0004                	.insn	2, 0x0004
 444:	0501                	.insn	2, 0x0501
 446:	0616                	.insn	2, 0x0616
 448:	0901eb03          	.insn	4, 0x0901eb03
 44c:	0004                	.insn	2, 0x0004
 44e:	0501                	.insn	2, 0x0501
 450:	0901031b          	.insn	4, 0x0901031b
 454:	0010                	.insn	2, 0x0010
 456:	0301                	.insn	2, 0x0301
 458:	0901                	.insn	2, 0x0901
 45a:	0014                	.insn	2, 0x0014
 45c:	0501                	.insn	2, 0x0501
 45e:	0311                	.insn	2, 0x0311
 460:	7f95                	.insn	2, 0x7f95
 462:	1009                	.insn	2, 0x1009
 464:	0100                	.insn	2, 0x0100
 466:	1f05                	.insn	2, 0x1f05
 468:	08090103          	lb	sp,128(s2)
 46c:	0100                	.insn	2, 0x0100
 46e:	0505                	.insn	2, 0x0505
 470:	0900df03          	lhu	t5,144(ra)
 474:	0004                	.insn	2, 0x0004
 476:	0601                	.insn	2, 0x0601
 478:	097e9e03          	lh	t3,151(t4)
 47c:	0004                	.insn	2, 0x0004
 47e:	0301                	.insn	2, 0x0301
 480:	01e2                	.insn	2, 0x01e2
 482:	0409                	.insn	2, 0x0409
 484:	0100                	.insn	2, 0x0100
 486:	0c05                	.insn	2, 0x0c05
 488:	04090003          	lb	zero,64(s2)
 48c:	0100                	.insn	2, 0x0100
 48e:	1605                	.insn	2, 0x1605
 490:	04090003          	lb	zero,64(s2)
 494:	0100                	.insn	2, 0x0100
 496:	1905                	.insn	2, 0x1905
 498:	0306                	.insn	2, 0x0306
 49a:	00100903          	lb	s2,1(zero) # 1 <$d.10+0x1>
 49e:	0501                	.insn	2, 0x0501
 4a0:	0625                	.insn	2, 0x0625
 4a2:	04090003          	lb	zero,64(s2)
 4a6:	0100                	.insn	2, 0x0100
 4a8:	0a05                	.insn	2, 0x0a05
 4aa:	0306                	.insn	2, 0x0306
 4ac:	0901                	.insn	2, 0x0901
 4ae:	000c                	.insn	2, 0x000c
 4b0:	0501                	.insn	2, 0x0501
 4b2:	0609                	.insn	2, 0x0609
 4b4:	04090003          	lb	zero,64(s2)
 4b8:	0100                	.insn	2, 0x0100
 4ba:	097e9a03          	lh	s4,151(t4)
 4be:	0008                	.insn	2, 0x0008
 4c0:	0301                	.insn	2, 0x0301
 4c2:	01e6                	.insn	2, 0x01e6
 4c4:	0409                	.insn	2, 0x0409
 4c6:	0100                	.insn	2, 0x0100
 4c8:	097e9a03          	lh	s4,151(t4)
 4cc:	0008                	.insn	2, 0x0008
 4ce:	0501                	.insn	2, 0x0501
 4d0:	0611                	.insn	2, 0x0611
 4d2:	0901ae03          	lw	t3,144(gp)
 4d6:	0004                	.insn	2, 0x0004
 4d8:	0601                	.insn	2, 0x0601
 4da:	097ed203          	lhu	tp,151(t4)
 4de:	0008                	.insn	2, 0x0008
 4e0:	0501                	.insn	2, 0x0501
 4e2:	0616                	.insn	2, 0x0616
 4e4:	0901eb03          	.insn	4, 0x0901eb03
 4e8:	0010                	.insn	2, 0x0010
 4ea:	0501                	.insn	2, 0x0501
 4ec:	0600                	.insn	2, 0x0600
 4ee:	097e9503          	lh	a0,151(t4)
 4f2:	0008                	.insn	2, 0x0008
 4f4:	0501                	.insn	2, 0x0501
 4f6:	060c                	.insn	2, 0x060c
 4f8:	0901e803          	.insn	4, 0x0901e803
 4fc:	0004                	.insn	2, 0x0004
 4fe:	0501                	.insn	2, 0x0501
 500:	0600                	.insn	2, 0x0600
 502:	097e9803          	lh	a6,151(t4)
 506:	0004                	.insn	2, 0x0004
 508:	0501                	.insn	2, 0x0501
 50a:	0610                	.insn	2, 0x0610
 50c:	0901ef03          	.insn	4, 0x0901ef03
 510:	0004                	.insn	2, 0x0004
 512:	0501                	.insn	2, 0x0501
 514:	0616                	.insn	2, 0x0616
 516:	04090003          	lb	zero,64(s2)
 51a:	0100                	.insn	2, 0x0100
 51c:	0505                	.insn	2, 0x0505
 51e:	0306                	.insn	2, 0x0306
 520:	0979                	.insn	2, 0x0979
 522:	0004                	.insn	2, 0x0004
 524:	0501                	.insn	2, 0x0501
 526:	0316                	.insn	2, 0x0316
 528:	00080903          	lb	s2,0(a6)
 52c:	0501                	.insn	2, 0x0501
 52e:	0901031b          	.insn	4, 0x0901031b
 532:	0010                	.insn	2, 0x0010
 534:	0301                	.insn	2, 0x0301
 536:	0901                	.insn	2, 0x0901
 538:	0014                	.insn	2, 0x0014
 53a:	0501                	.insn	2, 0x0501
 53c:	030d                	.insn	2, 0x030d
 53e:	10097f9b          	.insn	4, 0x10097f9b
 542:	0100                	.insn	2, 0x0100
 544:	0306                	.insn	2, 0x0306
 546:	7ef8                	.insn	2, 0x7ef8
 548:	0809                	.insn	2, 0x0809
 54a:	0100                	.insn	2, 0x0100
 54c:	0306                	.insn	2, 0x0306
 54e:	01c4                	.insn	2, 0x01c4
 550:	0409                	.insn	2, 0x0409
 552:	0100                	.insn	2, 0x0100
 554:	0505                	.insn	2, 0x0505
 556:	030a                	.insn	2, 0x030a
 558:	091e                	.insn	2, 0x091e
 55a:	0008                	.insn	2, 0x0008
 55c:	0501                	.insn	2, 0x0501
 55e:	060c                	.insn	2, 0x060c
 560:	14090003          	lb	zero,320(s2)
 564:	0100                	.insn	2, 0x0100
 566:	1605                	.insn	2, 0x1605
 568:	04090003          	lb	zero,64(s2)
 56c:	0100                	.insn	2, 0x0100
 56e:	097e9e03          	lh	t3,151(t4)
 572:	0008                	.insn	2, 0x0008
 574:	0301                	.insn	2, 0x0301
 576:	01e2                	.insn	2, 0x01e2
 578:	0409                	.insn	2, 0x0409
 57a:	0100                	.insn	2, 0x0100
 57c:	1905                	.insn	2, 0x1905
 57e:	0306                	.insn	2, 0x0306
 580:	00040903          	lb	s2,0(s0)
 584:	0501                	.insn	2, 0x0501
 586:	0625                	.insn	2, 0x0625
 588:	04090003          	lb	zero,64(s2)
 58c:	0100                	.insn	2, 0x0100
 58e:	0a05                	.insn	2, 0x0a05
 590:	0306                	.insn	2, 0x0306
 592:	0901                	.insn	2, 0x0901
 594:	000c                	.insn	2, 0x000c
 596:	0601                	.insn	2, 0x0601
 598:	097e9a03          	lh	s4,151(t4)
 59c:	0004                	.insn	2, 0x0004
 59e:	0301                	.insn	2, 0x0301
 5a0:	01e6                	.insn	2, 0x01e6
 5a2:	0809                	.insn	2, 0x0809
 5a4:	0100                	.insn	2, 0x0100
 5a6:	0905                	.insn	2, 0x0905
 5a8:	04090003          	lb	zero,64(s2)
 5ac:	0100                	.insn	2, 0x0100
 5ae:	097e9a03          	lh	s4,151(t4)
 5b2:	0004                	.insn	2, 0x0004
 5b4:	0501                	.insn	2, 0x0501
 5b6:	0601                	.insn	2, 0x0601
 5b8:	0901f303          	.insn	4, 0x0901f303
 5bc:	0004                	.insn	2, 0x0004
 5be:	0601                	.insn	2, 0x0601
 5c0:	097e8d03          	lb	s10,151(t4)
 5c4:	0004                	.insn	2, 0x0004
 5c6:	0501                	.insn	2, 0x0501
 5c8:	0616                	.insn	2, 0x0616
 5ca:	0901eb03          	.insn	4, 0x0901eb03
 5ce:	000c                	.insn	2, 0x000c
 5d0:	0501                	.insn	2, 0x0501
 5d2:	0600                	.insn	2, 0x0600
 5d4:	097e9503          	lh	a0,151(t4)
 5d8:	0014                	.insn	2, 0x0014
 5da:	0501                	.insn	2, 0x0501
 5dc:	060c                	.insn	2, 0x060c
 5de:	0901e803          	.insn	4, 0x0901e803
 5e2:	0004                	.insn	2, 0x0004
 5e4:	0501                	.insn	2, 0x0501
 5e6:	0600                	.insn	2, 0x0600
 5e8:	097e9803          	lh	a6,151(t4)
 5ec:	0004                	.insn	2, 0x0004
 5ee:	0501                	.insn	2, 0x0501
 5f0:	0610                	.insn	2, 0x0610
 5f2:	0901ef03          	.insn	4, 0x0901ef03
 5f6:	0004                	.insn	2, 0x0004
 5f8:	0501                	.insn	2, 0x0501
 5fa:	0616                	.insn	2, 0x0616
 5fc:	04090003          	lb	zero,64(s2)
 600:	0100                	.insn	2, 0x0100
 602:	0505                	.insn	2, 0x0505
 604:	0306                	.insn	2, 0x0306
 606:	0979                	.insn	2, 0x0979
 608:	0004                	.insn	2, 0x0004
 60a:	0601                	.insn	2, 0x0601
 60c:	097e9803          	lh	a6,151(t4)
 610:	0004                	.insn	2, 0x0004
 612:	0501                	.insn	2, 0x0501
 614:	0616                	.insn	2, 0x0616
 616:	0901eb03          	.insn	4, 0x0901eb03
 61a:	0004                	.insn	2, 0x0004
 61c:	0501                	.insn	2, 0x0501
 61e:	0901031b          	.insn	4, 0x0901031b
 622:	0010                	.insn	2, 0x0010
 624:	0301                	.insn	2, 0x0301
 626:	0901                	.insn	2, 0x0901
 628:	0010                	.insn	2, 0x0010
 62a:	0601                	.insn	2, 0x0601
 62c:	097e9303          	lh	t1,151(t4)
 630:	0010                	.insn	2, 0x0010
 632:	0501                	.insn	2, 0x0501
 634:	060a                	.insn	2, 0x060a
 636:	0901f103          	.insn	4, 0x0901f103
 63a:	0004                	.insn	2, 0x0004
 63c:	0501                	.insn	2, 0x0501
 63e:	0301                	.insn	2, 0x0301
 640:	0902                	.insn	2, 0x0902
 642:	0004                	.insn	2, 0x0004
 644:	0501                	.insn	2, 0x0501
 646:	0300                	.insn	2, 0x0300
 648:	095a                	.insn	2, 0x095a
 64a:	0004                	.insn	2, 0x0004
 64c:	0501                	.insn	2, 0x0501
 64e:	0a05                	.insn	2, 0x0a05
 650:	24090203          	lb	tp,576(s2)
 654:	0100                	.insn	2, 0x0100
 656:	0306                	.insn	2, 0x0306
 658:	7eb1                	.insn	2, 0x7eb1
 65a:	0409                	.insn	2, 0x0409
 65c:	0100                	.insn	2, 0x0100
 65e:	2505                	.insn	2, 0x2505
 660:	0901cf03          	lbu	t5,144(gp)
 664:	000c                	.insn	2, 0x000c
 666:	0501                	.insn	2, 0x0501
 668:	0305                	.insn	2, 0x0305
 66a:	0900                	.insn	2, 0x0900
 66c:	0004                	.insn	2, 0x0004
 66e:	0501                	.insn	2, 0x0501
 670:	060d                	.insn	2, 0x060d
 672:	04090103          	lb	sp,64(s2)
 676:	0100                	.insn	2, 0x0100
 678:	0306                	.insn	2, 0x0306
 67a:	7eb0                	.insn	2, 0x7eb0
 67c:	0c09                	.insn	2, 0x0c09
 67e:	0100                	.insn	2, 0x0100
 680:	0306                	.insn	2, 0x0306
 682:	01d1                	.insn	2, 0x01d1
 684:	0409                	.insn	2, 0x0409
 686:	0100                	.insn	2, 0x0100
 688:	1205                	.insn	2, 0x1205
 68a:	10090103          	lb	sp,256(s2)
 68e:	0100                	.insn	2, 0x0100
 690:	1d05                	.insn	2, 0x1d05
 692:	04090103          	lb	sp,64(s2)
 696:	0100                	.insn	2, 0x0100
 698:	1105                	.insn	2, 0x1105
 69a:	08090103          	lb	sp,128(s2)
 69e:	0100                	.insn	2, 0x0100
 6a0:	0306                	.insn	2, 0x0306
 6a2:	7eac                	.insn	2, 0x7eac
 6a4:	0c09                	.insn	2, 0x0c09
 6a6:	0100                	.insn	2, 0x0100
 6a8:	1505                	.insn	2, 0x1505
 6aa:	0306                	.insn	2, 0x0306
 6ac:	040901d7          	.insn	4, 0x040901d7
 6b0:	0100                	.insn	2, 0x0100
 6b2:	0905                	.insn	2, 0x0905
 6b4:	0306                	.insn	2, 0x0306
 6b6:	0900                	.insn	2, 0x0900
 6b8:	0004                	.insn	2, 0x0004
 6ba:	0601                	.insn	2, 0x0601
 6bc:	04090103          	lb	sp,64(s2)
 6c0:	0100                	.insn	2, 0x0100
 6c2:	0505                	.insn	2, 0x0505
 6c4:	0c090203          	lb	tp,192(s2)
 6c8:	0100                	.insn	2, 0x0100
 6ca:	0306                	.insn	2, 0x0306
 6cc:	7ea6                	.insn	2, 0x7ea6
 6ce:	1809                	.insn	2, 0x1809
 6d0:	0100                	.insn	2, 0x0100
 6d2:	01da030b          	.insn	4, 0x01da030b
 6d6:	0c09                	.insn	2, 0x0c09
 6d8:	0100                	.insn	2, 0x0100
 6da:	0c09                	.insn	2, 0x0c09
 6dc:	0000                	.insn	2, 0x0000
 6de:	0101                	.insn	2, 0x0101

000006e0 <$d.11>:
 6e0:	07ba                	.insn	2, 0x07ba
 6e2:	0000                	.insn	2, 0x0000
 6e4:	0004                	.insn	2, 0x0004
 6e6:	0060                	.insn	2, 0x0060
 6e8:	0000                	.insn	2, 0x0000
 6ea:	0101                	.insn	2, 0x0101
 6ec:	fb01                	.insn	2, 0xfb01
 6ee:	0d0e                	.insn	2, 0x0d0e
 6f0:	0100                	.insn	2, 0x0100
 6f2:	0101                	.insn	2, 0x0101
 6f4:	0001                	.insn	2, 0x0001
 6f6:	0000                	.insn	2, 0x0000
 6f8:	0001                	.insn	2, 0x0001
 6fa:	0100                	.insn	2, 0x0100
 6fc:	2f2e                	.insn	2, 0x2f2e
 6fe:	00637273          	csrrci	tp,0x6,6
 702:	7273752f          	.insn	4, 0x7273752f
 706:	62696c2f          	.insn	4, 0x62696c2f
 70a:	766c6c2f          	.insn	4, 0x766c6c2f
 70e:	2d6d                	.insn	2, 0x2d6d
 710:	3831                	.insn	2, 0x3831
 712:	62696c2f          	.insn	4, 0x62696c2f
 716:	616c632f          	.insn	4, 0x616c632f
 71a:	676e                	.insn	2, 0x676e
 71c:	2f38312f          	.insn	4, 0x2f38312f
 720:	6e69                	.insn	2, 0x6e69
 722:	64756c63          	bltu	a0,t2,d7a <$d.11+0x69a>
 726:	0065                	.insn	2, 0x0065
 728:	7500                	.insn	2, 0x7500
 72a:	2e726573          	csrrsi	a0,0x2e7,4
 72e:	00010063          	beqz	sp,72e <$d.11+0x4e>
 732:	7300                	.insn	2, 0x7300
 734:	6474                	.insn	2, 0x6474
 736:	6e69                	.insn	2, 0x6e69
 738:	2e74                	.insn	2, 0x2e74
 73a:	0068                	.insn	2, 0x0068
 73c:	0002                	.insn	2, 0x0002
 73e:	7500                	.insn	2, 0x7500
 740:	2e726573          	csrrsi	a0,0x2e7,4
 744:	0068                	.insn	2, 0x0068
 746:	0001                	.insn	2, 0x0001
 748:	0000                	.insn	2, 0x0000
 74a:	0505                	.insn	2, 0x0505
 74c:	000a                	.insn	2, 0x000a
 74e:	0205                	.insn	2, 0x0205
 750:	0810                	.insn	2, 0x0810
 752:	0040                	.insn	2, 0x0040
 754:	03013f03          	.insn	4, 0x03013f03
 758:	00140913          	addi	s2,s0,1
 75c:	0501                	.insn	2, 0x0501
 75e:	0300                	.insn	2, 0x0300
 760:	0925                	.insn	2, 0x0925
 762:	0004                	.insn	2, 0x0004
 764:	0501                	.insn	2, 0x0501
 766:	0a05                	.insn	2, 0x0a05
 768:	24091203          	lh	tp,576(s2)
 76c:	0100                	.insn	2, 0x0100
 76e:	0306                	.insn	2, 0x0306
 770:	7ef6                	.insn	2, 0x7ef6
 772:	0409                	.insn	2, 0x0409
 774:	0100                	.insn	2, 0x0100
 776:	0905                	.insn	2, 0x0905
 778:	0306                	.insn	2, 0x0306
 77a:	1409018b          	.insn	4, 0x1409018b
 77e:	0100                	.insn	2, 0x0100
 780:	1e05                	.insn	2, 0x1e05
 782:	28090303          	lb	t1,640(s2)
 786:	0100                	.insn	2, 0x0100
 788:	1c05                	.insn	2, 0x1c05
 78a:	0306                	.insn	2, 0x0306
 78c:	0900                	.insn	2, 0x0900
 78e:	0008                	.insn	2, 0x0008
 790:	0501                	.insn	2, 0x0501
 792:	061e                	.insn	2, 0x061e
 794:	04090103          	lb	sp,64(s2)
 798:	0100                	.insn	2, 0x0100
 79a:	1c05                	.insn	2, 0x1c05
 79c:	0306                	.insn	2, 0x0306
 79e:	0900                	.insn	2, 0x0900
 7a0:	0004                	.insn	2, 0x0004
 7a2:	0501                	.insn	2, 0x0501
 7a4:	0620                	.insn	2, 0x0620
 7a6:	04097c03          	.insn	4, 0x04097c03
 7aa:	0100                	.insn	2, 0x0100
 7ac:	2c05                	.insn	2, 0x2c05
 7ae:	14097f03          	.insn	4, 0x14097f03
 7b2:	0100                	.insn	2, 0x0100
 7b4:	0505                	.insn	2, 0x0505
 7b6:	0306                	.insn	2, 0x0306
 7b8:	0900                	.insn	2, 0x0900
 7ba:	0004                	.insn	2, 0x0004
 7bc:	0301                	.insn	2, 0x0301
 7be:	7ef6                	.insn	2, 0x7ef6
 7c0:	1009                	.insn	2, 0x1009
 7c2:	0100                	.insn	2, 0x0100
 7c4:	1405                	.insn	2, 0x1405
 7c6:	0306                	.insn	2, 0x0306
 7c8:	04090193          	addi	gp,s2,64
 7cc:	0100                	.insn	2, 0x0100
 7ce:	08090103          	lb	sp,128(s2)
 7d2:	0100                	.insn	2, 0x0100
 7d4:	0505                	.insn	2, 0x0505
 7d6:	0902b303          	.insn	4, 0x0902b303
 7da:	0014                	.insn	2, 0x0014
 7dc:	0601                	.insn	2, 0x0601
 7de:	097cb903          	.insn	4, 0x097cb903
 7e2:	001c                	.insn	2, 0x001c
 7e4:	0601                	.insn	2, 0x0601
 7e6:	09039803          	lh	a6,144(t2)
 7ea:	0004                	.insn	2, 0x0004
 7ec:	0601                	.insn	2, 0x0601
 7ee:	10090003          	lb	zero,256(s2)
 7f2:	0100                	.insn	2, 0x0100
 7f4:	0306                	.insn	2, 0x0306
 7f6:	7e89                	.insn	2, 0x7e89
 7f8:	0c09                	.insn	2, 0x0c09
 7fa:	0100                	.insn	2, 0x0100
 7fc:	0306                	.insn	2, 0x0306
 7fe:	7edf 0409 0100      	.insn	6, 0x010004097edf
 804:	0905                	.insn	2, 0x0905
 806:	0306                	.insn	2, 0x0306
 808:	01a2                	.insn	2, 0x01a2
 80a:	1009                	.insn	2, 0x1009
 80c:	0100                	.insn	2, 0x0100
 80e:	1c05                	.insn	2, 0x1c05
 810:	1c090103          	lb	sp,448(s2)
 814:	0100                	.insn	2, 0x0100
 816:	0505                	.insn	2, 0x0505
 818:	09028f03          	lb	t5,144(t0)
 81c:	0004                	.insn	2, 0x0004
 81e:	0301                	.insn	2, 0x0301
 820:	0966                	.insn	2, 0x0966
 822:	000c                	.insn	2, 0x000c
 824:	0501                	.insn	2, 0x0501
 826:	0320                	.insn	2, 0x0320
 828:	7e8a                	.insn	2, 0x7e8a
 82a:	0c09                	.insn	2, 0x0c09
 82c:	0100                	.insn	2, 0x0100
 82e:	0505                	.insn	2, 0x0505
 830:	0901f603          	.insn	4, 0x0901f603
 834:	0008                	.insn	2, 0x0008
 836:	0501                	.insn	2, 0x0501
 838:	032c                	.insn	2, 0x032c
 83a:	7e89                	.insn	2, 0x7e89
 83c:	0c09                	.insn	2, 0x0c09
 83e:	0100                	.insn	2, 0x0100
 840:	0505                	.insn	2, 0x0505
 842:	0306                	.insn	2, 0x0306
 844:	0900                	.insn	2, 0x0900
 846:	0004                	.insn	2, 0x0004
 848:	0301                	.insn	2, 0x0301
 84a:	7edf 0c09 0100      	.insn	6, 0x01000c097edf
 850:	1405                	.insn	2, 0x1405
 852:	0306                	.insn	2, 0x0306
 854:	04090193          	addi	gp,s2,64
 858:	0100                	.insn	2, 0x0100
 85a:	08090103          	lb	sp,128(s2)
 85e:	0100                	.insn	2, 0x0100
 860:	0505                	.insn	2, 0x0505
 862:	0902b303          	.insn	4, 0x0902b303
 866:	0014                	.insn	2, 0x0014
 868:	0301                	.insn	2, 0x0301
 86a:	0951                	.insn	2, 0x0951
 86c:	0020                	.insn	2, 0x0020
 86e:	0601                	.insn	2, 0x0601
 870:	10090003          	lb	zero,256(s2)
 874:	0100                	.insn	2, 0x0100
 876:	097ce803          	.insn	4, 0x097ce803
 87a:	000c                	.insn	2, 0x000c
 87c:	0301                	.insn	2, 0x0301
 87e:	0398                	.insn	2, 0x0398
 880:	0409                	.insn	2, 0x0409
 882:	0100                	.insn	2, 0x0100
 884:	10090003          	lb	zero,256(s2)
 888:	0100                	.insn	2, 0x0100
 88a:	0c090003          	lb	zero,192(s2)
 88e:	0100                	.insn	2, 0x0100
 890:	0306                	.insn	2, 0x0306
 892:	7e95                	.insn	2, 0x7e95
 894:	0c09                	.insn	2, 0x0c09
 896:	0100                	.insn	2, 0x0100
 898:	0306                	.insn	2, 0x0306
 89a:	04097ed3          	.insn	4, 0x04097ed3
 89e:	0100                	.insn	2, 0x0100
 8a0:	0905                	.insn	2, 0x0905
 8a2:	0306                	.insn	2, 0x0306
 8a4:	01ae                	.insn	2, 0x01ae
 8a6:	1409                	.insn	2, 0x1409
 8a8:	0100                	.insn	2, 0x0100
 8aa:	1c05                	.insn	2, 0x1c05
 8ac:	1c090103          	lb	sp,448(s2)
 8b0:	0100                	.insn	2, 0x0100
 8b2:	0505                	.insn	2, 0x0505
 8b4:	09028303          	lb	t1,144(t0)
 8b8:	0004                	.insn	2, 0x0004
 8ba:	0301                	.insn	2, 0x0301
 8bc:	0966                	.insn	2, 0x0966
 8be:	000c                	.insn	2, 0x000c
 8c0:	0501                	.insn	2, 0x0501
 8c2:	0320                	.insn	2, 0x0320
 8c4:	7e96                	.insn	2, 0x7e96
 8c6:	0c09                	.insn	2, 0x0c09
 8c8:	0100                	.insn	2, 0x0100
 8ca:	0505                	.insn	2, 0x0505
 8cc:	0901ea03          	.insn	4, 0x0901ea03
 8d0:	0008                	.insn	2, 0x0008
 8d2:	0501                	.insn	2, 0x0501
 8d4:	032c                	.insn	2, 0x032c
 8d6:	7e95                	.insn	2, 0x7e95
 8d8:	0c09                	.insn	2, 0x0c09
 8da:	0100                	.insn	2, 0x0100
 8dc:	0505                	.insn	2, 0x0505
 8de:	0306                	.insn	2, 0x0306
 8e0:	0900                	.insn	2, 0x0900
 8e2:	0004                	.insn	2, 0x0004
 8e4:	0301                	.insn	2, 0x0301
 8e6:	0c097ed3          	.insn	4, 0x0c097ed3
 8ea:	0100                	.insn	2, 0x0100
 8ec:	0306                	.insn	2, 0x0306
 8ee:	0398                	.insn	2, 0x0398
 8f0:	0409                	.insn	2, 0x0409
 8f2:	0100                	.insn	2, 0x0100
 8f4:	0306                	.insn	2, 0x0306
 8f6:	0900                	.insn	2, 0x0900
 8f8:	0010                	.insn	2, 0x0010
 8fa:	0301                	.insn	2, 0x0301
 8fc:	0900                	.insn	2, 0x0900
 8fe:	000c                	.insn	2, 0x000c
 900:	0301                	.insn	2, 0x0301
 902:	7ce8                	.insn	2, 0x7ce8
 904:	1009                	.insn	2, 0x1009
 906:	0100                	.insn	2, 0x0100
 908:	09039803          	lh	a6,144(t2)
 90c:	0004                	.insn	2, 0x0004
 90e:	0301                	.insn	2, 0x0301
 910:	0900                	.insn	2, 0x0900
 912:	0010                	.insn	2, 0x0010
 914:	0301                	.insn	2, 0x0301
 916:	0900                	.insn	2, 0x0900
 918:	000c                	.insn	2, 0x000c
 91a:	0301                	.insn	2, 0x0301
 91c:	7ce8                	.insn	2, 0x7ce8
 91e:	0c09                	.insn	2, 0x0c09
 920:	0100                	.insn	2, 0x0100
 922:	09039803          	lh	a6,144(t2)
 926:	0004                	.insn	2, 0x0004
 928:	0301                	.insn	2, 0x0301
 92a:	0900                	.insn	2, 0x0900
 92c:	0010                	.insn	2, 0x0010
 92e:	0301                	.insn	2, 0x0301
 930:	0900                	.insn	2, 0x0900
 932:	000c                	.insn	2, 0x000c
 934:	0601                	.insn	2, 0x0601
 936:	097ea103          	lw	sp,151(t4)
 93a:	000c                	.insn	2, 0x000c
 93c:	0601                	.insn	2, 0x0601
 93e:	097ec703          	lbu	a4,151(t4)
 942:	0004                	.insn	2, 0x0004
 944:	0501                	.insn	2, 0x0501
 946:	061c                	.insn	2, 0x061c
 948:	0901bb03          	.insn	4, 0x0901bb03
 94c:	0018                	.insn	2, 0x0018
 94e:	0501                	.insn	2, 0x0501
 950:	0305                	.insn	2, 0x0305
 952:	040901f7          	.insn	4, 0x040901f7
 956:	0100                	.insn	2, 0x0100
 958:	0c096603          	.insn	4, 0x0c096603
 95c:	0100                	.insn	2, 0x0100
 95e:	2005                	.insn	2, 0x2005
 960:	097ea203          	lw	tp,151(t4)
 964:	000c                	.insn	2, 0x000c
 966:	0501                	.insn	2, 0x0501
 968:	0305                	.insn	2, 0x0305
 96a:	01de                	.insn	2, 0x01de
 96c:	0c09                	.insn	2, 0x0c09
 96e:	0100                	.insn	2, 0x0100
 970:	2c05                	.insn	2, 0x2c05
 972:	097ea103          	lw	sp,151(t4)
 976:	000c                	.insn	2, 0x000c
 978:	0501                	.insn	2, 0x0501
 97a:	0605                	.insn	2, 0x0605
 97c:	04090003          	lb	zero,64(s2)
 980:	0100                	.insn	2, 0x0100
 982:	097ec703          	lbu	a4,151(t4)
 986:	0008                	.insn	2, 0x0008
 988:	0601                	.insn	2, 0x0601
 98a:	09039803          	lh	a6,144(t2)
 98e:	0004                	.insn	2, 0x0004
 990:	0601                	.insn	2, 0x0601
 992:	097ce803          	.insn	4, 0x097ce803
 996:	0014                	.insn	2, 0x0014
 998:	0501                	.insn	2, 0x0501
 99a:	0601                	.insn	2, 0x0601
 99c:	01c1030b          	.insn	4, 0x01c1030b
 9a0:	1409                	.insn	2, 0x1409
 9a2:	0100                	.insn	2, 0x0100
 9a4:	0005                	.insn	2, 0x0005
 9a6:	0901d603          	lhu	a2,144(gp)
 9aa:	0008                	.insn	2, 0x0008
 9ac:	0501                	.insn	2, 0x0501
 9ae:	0a05                	.insn	2, 0x0a05
 9b0:	04090103          	lb	sp,64(s2)
 9b4:	0100                	.insn	2, 0x0100
 9b6:	0105                	.insn	2, 0x0105
 9b8:	0c090803          	lb	a6,192(s2)
 9bc:	0100                	.insn	2, 0x0100
 9be:	0005                	.insn	2, 0x0005
 9c0:	04091103          	lh	sp,64(s2)
 9c4:	0100                	.insn	2, 0x0100
 9c6:	0505                	.insn	2, 0x0505
 9c8:	030a                	.insn	2, 0x030a
 9ca:	0901                	.insn	2, 0x0901
 9cc:	0004                	.insn	2, 0x0004
 9ce:	0501                	.insn	2, 0x0501
 9d0:	0301                	.insn	2, 0x0301
 9d2:	0908                	.insn	2, 0x0908
 9d4:	000c                	.insn	2, 0x000c
 9d6:	0501                	.insn	2, 0x0501
 9d8:	0a05                	.insn	2, 0x0a05
 9da:	04092203          	lw	tp,64(s2)
 9de:	0100                	.insn	2, 0x0100
 9e0:	0105                	.insn	2, 0x0105
 9e2:	097df003          	.insn	4, 0x097df003
 9e6:	0008                	.insn	2, 0x0008
 9e8:	0501                	.insn	2, 0x0501
 9ea:	0a05                	.insn	2, 0x0a05
 9ec:	0902a303          	lw	t1,144(t0)
 9f0:	0004                	.insn	2, 0x0004
 9f2:	0501                	.insn	2, 0x0501
 9f4:	0301                	.insn	2, 0x0301
 9f6:	7de9                	.insn	2, 0x7de9
 9f8:	0809                	.insn	2, 0x0809
 9fa:	0100                	.insn	2, 0x0100
 9fc:	0c05                	.insn	2, 0x0c05
 9fe:	030a                	.insn	2, 0x030a
 a00:	0905                	.insn	2, 0x0905
 a02:	0004                	.insn	2, 0x0004
 a04:	0501                	.insn	2, 0x0501
 a06:	0605                	.insn	2, 0x0605
 a08:	08090003          	lb	zero,128(s2)
 a0c:	0100                	.insn	2, 0x0100
 a0e:	097ea303          	lw	t1,151(t4)
 a12:	0008                	.insn	2, 0x0008
 a14:	0501                	.insn	2, 0x0501
 a16:	060e                	.insn	2, 0x060e
 a18:	0901de03          	lhu	t3,144(gp)
 a1c:	0004                	.insn	2, 0x0004
 a1e:	0501                	.insn	2, 0x0501
 a20:	030c                	.insn	2, 0x030c
 a22:	097f 0004 0501 030b 	.insn	10, 0x0901030b05010004097f
 a2a:	0901 
 a2c:	0004                	.insn	2, 0x0004
 a2e:	0501                	.insn	2, 0x0501
 a30:	0305                	.insn	2, 0x0305
 a32:	097f 0004 0601 a303 	.insn	10, 0x097ea30306010004097f
 a3a:	097e 
 a3c:	0004                	.insn	2, 0x0004
 a3e:	0301                	.insn	2, 0x0301
 a40:	01dd                	.insn	2, 0x01dd
 a42:	0409                	.insn	2, 0x0409
 a44:	0100                	.insn	2, 0x0100
 a46:	0805                	.insn	2, 0x0805
 a48:	0306                	.insn	2, 0x0306
 a4a:	0902                	.insn	2, 0x0902
 a4c:	0004                	.insn	2, 0x0004
 a4e:	0501                	.insn	2, 0x0501
 a50:	0305                	.insn	2, 0x0305
 a52:	0901                	.insn	2, 0x0901
 a54:	0004                	.insn	2, 0x0004
 a56:	0501                	.insn	2, 0x0501
 a58:	0a0c                	.insn	2, 0x0a0c
 a5a:	04090403          	lb	s0,64(s2)
 a5e:	0100                	.insn	2, 0x0100
 a60:	1005                	.insn	2, 0x1005
 a62:	0306                	.insn	2, 0x0306
 a64:	0900                	.insn	2, 0x0900
 a66:	0004                	.insn	2, 0x0004
 a68:	0501                	.insn	2, 0x0501
 a6a:	0305                	.insn	2, 0x0305
 a6c:	0900                	.insn	2, 0x0900
 a6e:	0004                	.insn	2, 0x0004
 a70:	0501                	.insn	2, 0x0501
 a72:	09000313          	li	t1,144
 a76:	0004                	.insn	2, 0x0004
 a78:	0501                	.insn	2, 0x0501
 a7a:	0305                	.insn	2, 0x0305
 a7c:	0900                	.insn	2, 0x0900
 a7e:	0008                	.insn	2, 0x0008
 a80:	0501                	.insn	2, 0x0501
 a82:	030c                	.insn	2, 0x030c
 a84:	0900                	.insn	2, 0x0900
 a86:	0004                	.insn	2, 0x0004
 a88:	0501                	.insn	2, 0x0501
 a8a:	0403060b          	.insn	4, 0x0403060b
 a8e:	0409                	.insn	2, 0x0409
 a90:	0100                	.insn	2, 0x0100
 a92:	1005                	.insn	2, 0x1005
 a94:	04097c03          	.insn	4, 0x04097c03
 a98:	0100                	.insn	2, 0x0100
 a9a:	0c05                	.insn	2, 0x0c05
 a9c:	08090703          	lb	a4,128(s2)
 aa0:	0100                	.insn	2, 0x0100
 aa2:	0306                	.insn	2, 0x0306
 aa4:	7e95                	.insn	2, 0x7e95
 aa6:	0809                	.insn	2, 0x0809
 aa8:	0100                	.insn	2, 0x0100
 aaa:	2305                	.insn	2, 0x2305
 aac:	0901eb03          	.insn	4, 0x0901eb03
 ab0:	0004                	.insn	2, 0x0004
 ab2:	0501                	.insn	2, 0x0501
 ab4:	0321                	.insn	2, 0x0321
 ab6:	0900                	.insn	2, 0x0900
 ab8:	0004                	.insn	2, 0x0004
 aba:	0501                	.insn	2, 0x0501
 abc:	0305                	.insn	2, 0x0305
 abe:	0900                	.insn	2, 0x0900
 ac0:	0004                	.insn	2, 0x0004
 ac2:	0501                	.insn	2, 0x0501
 ac4:	0600                	.insn	2, 0x0600
 ac6:	04090303          	lb	t1,64(s2)
 aca:	0100                	.insn	2, 0x0100
 acc:	0505                	.insn	2, 0x0505
 ace:	030a                	.insn	2, 0x030a
 ad0:	0902                	.insn	2, 0x0902
 ad2:	005c                	.insn	2, 0x005c
 ad4:	0501                	.insn	2, 0x0501
 ad6:	030d                	.insn	2, 0x030d
 ad8:	0905                	.insn	2, 0x0905
 ada:	0030                	.insn	2, 0x0030
 adc:	0501                	.insn	2, 0x0501
 ade:	030c                	.insn	2, 0x030c
 ae0:	093c                	.insn	2, 0x093c
 ae2:	0004                	.insn	2, 0x0004
 ae4:	0301                	.insn	2, 0x0301
 ae6:	0941                	.insn	2, 0x0941
 ae8:	0004                	.insn	2, 0x0004
 aea:	0501                	.insn	2, 0x0501
 aec:	0605                	.insn	2, 0x0605
 aee:	04090003          	lb	zero,64(s2)
 af2:	0100                	.insn	2, 0x0100
 af4:	0306                	.insn	2, 0x0306
 af6:	01a6                	.insn	2, 0x01a6
 af8:	0809                	.insn	2, 0x0809
 afa:	0100                	.insn	2, 0x0100
 afc:	0c05                	.insn	2, 0x0c05
 afe:	097f9903          	lh	s2,151(t6)
 b02:	000c                	.insn	2, 0x000c
 b04:	0601                	.insn	2, 0x0601
 b06:	097dcf03          	lbu	t5,151(s11)
 b0a:	0004                	.insn	2, 0x0004
 b0c:	0501                	.insn	2, 0x0501
 b0e:	0615                	.insn	2, 0x0615
 b10:	0901f503          	.insn	4, 0x0901f503
 b14:	0004                	.insn	2, 0x0004
 b16:	0501                	.insn	2, 0x0501
 b18:	0310                	.insn	2, 0x0310
 b1a:	097f 0004 0501 030d 	.insn	10, 0x0901030d05010004097f
 b22:	0901 
 b24:	0004                	.insn	2, 0x0004
 b26:	0501                	.insn	2, 0x0501
 b28:	0321                	.insn	2, 0x0321
 b2a:	0910                	.insn	2, 0x0910
 b2c:	000c                	.insn	2, 0x000c
 b2e:	0501                	.insn	2, 0x0501
 b30:	0319                	.insn	2, 0x0319
 b32:	00100903          	lb	s2,1(zero) # 1 <$d.10+0x1>
 b36:	0301                	.insn	2, 0x0301
 b38:	090d                	.insn	2, 0x090d
 b3a:	0004                	.insn	2, 0x0004
 b3c:	0501                	.insn	2, 0x0501
 b3e:	0305                	.insn	2, 0x0305
 b40:	04090183          	lb	gp,64(s2)
 b44:	0100                	.insn	2, 0x0100
 b46:	0c05                	.insn	2, 0x0c05
 b48:	097f9903          	lh	s2,151(t6)
 b4c:	0010                	.insn	2, 0x0010
 b4e:	0601                	.insn	2, 0x0601
 b50:	097dcf03          	lbu	t5,151(s11)
 b54:	0004                	.insn	2, 0x0004
 b56:	0501                	.insn	2, 0x0501
 b58:	060d                	.insn	2, 0x060d
 b5a:	0901f503          	.insn	4, 0x0901f503
 b5e:	0004                	.insn	2, 0x0004
 b60:	0501                	.insn	2, 0x0501
 b62:	0326                	.insn	2, 0x0326
 b64:	0931                	.insn	2, 0x0931
 b66:	0008                	.insn	2, 0x0008
 b68:	0501                	.insn	2, 0x0501
 b6a:	0332                	.insn	2, 0x0332
 b6c:	0902                	.insn	2, 0x0902
 b6e:	0010                	.insn	2, 0x0010
 b70:	0501                	.insn	2, 0x0501
 b72:	0321                	.insn	2, 0x0321
 b74:	0901                	.insn	2, 0x0901
 b76:	0004                	.insn	2, 0x0004
 b78:	0501                	.insn	2, 0x0501
 b7a:	0305                	.insn	2, 0x0305
 b7c:	080900ef          	jal	90bfc <$d.11+0x9051c>
 b80:	0100                	.insn	2, 0x0100
 b82:	3e05                	.insn	2, 0x3e05
 b84:	097f9003          	lh	zero,151(t6)
 b88:	000c                	.insn	2, 0x000c
 b8a:	0501                	.insn	2, 0x0501
 b8c:	0321                	.insn	2, 0x0321
 b8e:	0901                	.insn	2, 0x0901
 b90:	0008                	.insn	2, 0x0008
 b92:	0501                	.insn	2, 0x0501
 b94:	0305                	.insn	2, 0x0305
 b96:	080900ef          	jal	90c16 <$d.11+0x90536>
 b9a:	0100                	.insn	2, 0x0100
 b9c:	3e05                	.insn	2, 0x3e05
 b9e:	097f9003          	lh	zero,151(t6)
 ba2:	000c                	.insn	2, 0x000c
 ba4:	0501                	.insn	2, 0x0501
 ba6:	0321                	.insn	2, 0x0321
 ba8:	0901                	.insn	2, 0x0901
 baa:	0008                	.insn	2, 0x0008
 bac:	0501                	.insn	2, 0x0501
 bae:	0305                	.insn	2, 0x0305
 bb0:	080900ef          	jal	90c30 <$d.11+0x90550>
 bb4:	0100                	.insn	2, 0x0100
 bb6:	3e05                	.insn	2, 0x3e05
 bb8:	097f9003          	lh	zero,151(t6)
 bbc:	000c                	.insn	2, 0x000c
 bbe:	0501                	.insn	2, 0x0501
 bc0:	0321                	.insn	2, 0x0321
 bc2:	0901                	.insn	2, 0x0901
 bc4:	0008                	.insn	2, 0x0008
 bc6:	0501                	.insn	2, 0x0501
 bc8:	0305                	.insn	2, 0x0305
 bca:	080900ef          	jal	90c4a <$d.11+0x9056a>
 bce:	0100                	.insn	2, 0x0100
 bd0:	3e05                	.insn	2, 0x3e05
 bd2:	097f9003          	lh	zero,151(t6)
 bd6:	000c                	.insn	2, 0x000c
 bd8:	0501                	.insn	2, 0x0501
 bda:	0321                	.insn	2, 0x0321
 bdc:	0901                	.insn	2, 0x0901
 bde:	0008                	.insn	2, 0x0008
 be0:	0501                	.insn	2, 0x0501
 be2:	0305                	.insn	2, 0x0305
 be4:	080900ef          	jal	90c64 <$d.11+0x90584>
 be8:	0100                	.insn	2, 0x0100
 bea:	3e05                	.insn	2, 0x3e05
 bec:	097f9003          	lh	zero,151(t6)
 bf0:	000c                	.insn	2, 0x000c
 bf2:	0501                	.insn	2, 0x0501
 bf4:	0321                	.insn	2, 0x0321
 bf6:	0901                	.insn	2, 0x0901
 bf8:	0008                	.insn	2, 0x0008
 bfa:	0501                	.insn	2, 0x0501
 bfc:	0305                	.insn	2, 0x0305
 bfe:	080900ef          	jal	90c7e <$d.11+0x9059e>
 c02:	0100                	.insn	2, 0x0100
 c04:	3e05                	.insn	2, 0x3e05
 c06:	097f9003          	lh	zero,151(t6)
 c0a:	000c                	.insn	2, 0x000c
 c0c:	0501                	.insn	2, 0x0501
 c0e:	0321                	.insn	2, 0x0321
 c10:	0901                	.insn	2, 0x0901
 c12:	0008                	.insn	2, 0x0008
 c14:	0501                	.insn	2, 0x0501
 c16:	0305                	.insn	2, 0x0305
 c18:	080900ef          	jal	90c98 <$d.11+0x905b8>
 c1c:	0100                	.insn	2, 0x0100
 c1e:	3e05                	.insn	2, 0x3e05
 c20:	097f9003          	lh	zero,151(t6)
 c24:	000c                	.insn	2, 0x000c
 c26:	0501                	.insn	2, 0x0501
 c28:	0321                	.insn	2, 0x0321
 c2a:	0901                	.insn	2, 0x0901
 c2c:	0004                	.insn	2, 0x0004
 c2e:	0501                	.insn	2, 0x0501
 c30:	0305                	.insn	2, 0x0305
 c32:	080900ef          	jal	90cb2 <$d.11+0x905d2>
 c36:	0100                	.insn	2, 0x0100
 c38:	0c05                	.insn	2, 0x0c05
 c3a:	097f9903          	lh	s2,151(t6)
 c3e:	000c                	.insn	2, 0x000c
 c40:	0601                	.insn	2, 0x0601
 c42:	097dcf03          	lbu	t5,151(s11)
 c46:	0004                	.insn	2, 0x0004
 c48:	0501                	.insn	2, 0x0501
 c4a:	0605                	.insn	2, 0x0605
 c4c:	09039803          	lh	a6,144(t2)
 c50:	0004                	.insn	2, 0x0004
 c52:	0501                	.insn	2, 0x0501
 c54:	030c                	.insn	2, 0x030c
 c56:	7f99                	.insn	2, 0x7f99
 c58:	0c09                	.insn	2, 0x0c09
 c5a:	0100                	.insn	2, 0x0100
 c5c:	0306                	.insn	2, 0x0306
 c5e:	04097dcf          	.insn	4, 0x04097dcf
 c62:	0100                	.insn	2, 0x0100
 c64:	2505                	.insn	2, 0x2505
 c66:	0306                	.insn	2, 0x0306
 c68:	01fd                	.insn	2, 0x01fd
 c6a:	0409                	.insn	2, 0x0409
 c6c:	0100                	.insn	2, 0x0100
 c6e:	1c05                	.insn	2, 0x1c05
 c70:	10090103          	lb	sp,256(s2)
 c74:	0100                	.insn	2, 0x0100
 c76:	1505                	.insn	2, 0x1505
 c78:	0306                	.insn	2, 0x0306
 c7a:	0900                	.insn	2, 0x0900
 c7c:	0004                	.insn	2, 0x0004
 c7e:	0501                	.insn	2, 0x0501
 c80:	0605                	.insn	2, 0x0605
 c82:	09019a03          	lh	s4,144(gp)
 c86:	0008                	.insn	2, 0x0008
 c88:	0501                	.insn	2, 0x0501
 c8a:	031c                	.insn	2, 0x031c
 c8c:	7ee6                	.insn	2, 0x7ee6
 c8e:	0c09                	.insn	2, 0x0c09
 c90:	0100                	.insn	2, 0x0100
 c92:	1505                	.insn	2, 0x1505
 c94:	0306                	.insn	2, 0x0306
 c96:	0900                	.insn	2, 0x0900
 c98:	0004                	.insn	2, 0x0004
 c9a:	0501                	.insn	2, 0x0501
 c9c:	0605                	.insn	2, 0x0605
 c9e:	09019a03          	lh	s4,144(gp)
 ca2:	000c                	.insn	2, 0x000c
 ca4:	0501                	.insn	2, 0x0501
 ca6:	033a                	.insn	2, 0x033a
 ca8:	10097ef3          	csrrci	t4,sstatus,18
 cac:	0100                	.insn	2, 0x0100
 cae:	0306                	.insn	2, 0x0306
 cb0:	7df5                	.insn	2, 0x7df5
 cb2:	0409                	.insn	2, 0x0409
 cb4:	0100                	.insn	2, 0x0100
 cb6:	1b05                	.insn	2, 0x1b05
 cb8:	0306                	.insn	2, 0x0306
 cba:	029c                	.insn	2, 0x029c
 cbc:	0c09                	.insn	2, 0x0c09
 cbe:	0100                	.insn	2, 0x0100
 cc0:	0306                	.insn	2, 0x0306
 cc2:	7de4                	.insn	2, 0x7de4
 cc4:	1409                	.insn	2, 0x1409
 cc6:	0100                	.insn	2, 0x0100
 cc8:	2405                	.insn	2, 0x2405
 cca:	0306                	.insn	2, 0x0306
 ccc:	1009029b          	.insn	4, 0x1009029b
 cd0:	0100                	.insn	2, 0x0100
 cd2:	1e05                	.insn	2, 0x1e05
 cd4:	0306                	.insn	2, 0x0306
 cd6:	0900                	.insn	2, 0x0900
 cd8:	0004                	.insn	2, 0x0004
 cda:	0501                	.insn	2, 0x0501
 cdc:	0322                	.insn	2, 0x0322
 cde:	0900                	.insn	2, 0x0900
 ce0:	0004                	.insn	2, 0x0004
 ce2:	0501                	.insn	2, 0x0501
 ce4:	0615                	.insn	2, 0x0615
 ce6:	08097f03          	.insn	4, 0x08097f03
 cea:	0100                	.insn	2, 0x0100
 cec:	0306                	.insn	2, 0x0306
 cee:	7de6                	.insn	2, 0x7de6
 cf0:	0409                	.insn	2, 0x0409
 cf2:	0100                	.insn	2, 0x0100
 cf4:	2105                	.insn	2, 0x2105
 cf6:	0306                	.insn	2, 0x0306
 cf8:	02a1                	.insn	2, 0x02a1
 cfa:	0409                	.insn	2, 0x0409
 cfc:	0100                	.insn	2, 0x0100
 cfe:	0505                	.insn	2, 0x0505
 d00:	0900f703          	.insn	4, 0x0900f703
 d04:	0008                	.insn	2, 0x0008
 d06:	0501                	.insn	2, 0x0501
 d08:	031e                	.insn	2, 0x031e
 d0a:	7f88                	.insn	2, 0x7f88
 d0c:	0c09                	.insn	2, 0x0c09
 d0e:	0100                	.insn	2, 0x0100
 d10:	1505                	.insn	2, 0x1505
 d12:	0306                	.insn	2, 0x0306
 d14:	0900                	.insn	2, 0x0900
 d16:	0008                	.insn	2, 0x0008
 d18:	0301                	.insn	2, 0x0301
 d1a:	7de0                	.insn	2, 0x7de0
 d1c:	0809                	.insn	2, 0x0809
 d1e:	0100                	.insn	2, 0x0100
 d20:	0505                	.insn	2, 0x0505
 d22:	0306                	.insn	2, 0x0306
 d24:	0398                	.insn	2, 0x0398
 d26:	0409                	.insn	2, 0x0409
 d28:	0100                	.insn	2, 0x0100
 d2a:	0306                	.insn	2, 0x0306
 d2c:	7ce8                	.insn	2, 0x7ce8
 d2e:	0c09                	.insn	2, 0x0c09
 d30:	0100                	.insn	2, 0x0100
 d32:	0105                	.insn	2, 0x0105
 d34:	0b06                	.insn	2, 0x0b06
 d36:	0902b603          	.insn	4, 0x0902b603
 d3a:	0034                	.insn	2, 0x0034
 d3c:	0501                	.insn	2, 0x0501
 d3e:	0300                	.insn	2, 0x0300
 d40:	0906                	.insn	2, 0x0906
 d42:	0008                	.insn	2, 0x0008
 d44:	0501                	.insn	2, 0x0501
 d46:	0a0a                	.insn	2, 0x0a0a
 d48:	24090203          	lb	tp,576(s2)
 d4c:	0100                	.insn	2, 0x0100
 d4e:	1705                	.insn	2, 0x1705
 d50:	0306                	.insn	2, 0x0306
 d52:	0900                	.insn	2, 0x0900
 d54:	000c                	.insn	2, 0x000c
 d56:	0501                	.insn	2, 0x0501
 d58:	0900031b          	.insn	4, 0x0900031b
 d5c:	0004                	.insn	2, 0x0004
 d5e:	0501                	.insn	2, 0x0501
 d60:	09000327          	.insn	4, 0x09000327
 d64:	0004                	.insn	2, 0x0004
 d66:	0501                	.insn	2, 0x0501
 d68:	060c                	.insn	2, 0x060c
 d6a:	0c090503          	lb	a0,192(s2)
 d6e:	0100                	.insn	2, 0x0100
 d70:	0b05                	.insn	2, 0x0b05
 d72:	04097d03          	.insn	4, 0x04097d03
 d76:	0100                	.insn	2, 0x0100
 d78:	0306                	.insn	2, 0x0306
 d7a:	7dc0                	.insn	2, 0x7dc0
 d7c:	0409                	.insn	2, 0x0409
 d7e:	0100                	.insn	2, 0x0100
 d80:	0505                	.insn	2, 0x0505
 d82:	0306                	.insn	2, 0x0306
 d84:	080902c3          	.insn	4, 0x080902c3
 d88:	0100                	.insn	2, 0x0100
 d8a:	0306                	.insn	2, 0x0306
 d8c:	7dbd                	.insn	2, 0x7dbd
 d8e:	0809                	.insn	2, 0x0809
 d90:	0100                	.insn	2, 0x0100
 d92:	1605                	.insn	2, 0x1605
 d94:	0306                	.insn	2, 0x0306
 d96:	02c6                	.insn	2, 0x02c6
 d98:	0809                	.insn	2, 0x0809
 d9a:	0100                	.insn	2, 0x0100
 d9c:	1b05                	.insn	2, 0x1b05
 d9e:	20090103          	lb	sp,512(s2)
 da2:	0100                	.insn	2, 0x0100
 da4:	10090103          	lb	sp,256(s2)
 da8:	0100                	.insn	2, 0x0100
 daa:	0005                	.insn	2, 0x0005
 dac:	0306                	.insn	2, 0x0306
 dae:	7db8                	.insn	2, 0x7db8
 db0:	1009                	.insn	2, 0x1009
 db2:	0100                	.insn	2, 0x0100
 db4:	0d05                	.insn	2, 0x0d05
 db6:	0306                	.insn	2, 0x0306
 db8:	02ca                	.insn	2, 0x02ca
 dba:	0809                	.insn	2, 0x0809
 dbc:	0100                	.insn	2, 0x0100
 dbe:	0f05                	.insn	2, 0x0f05
 dc0:	04090103          	lb	sp,64(s2)
 dc4:	0100                	.insn	2, 0x0100
 dc6:	0c05                	.insn	2, 0x0c05
 dc8:	0c097803          	.insn	4, 0x0c097803
 dcc:	0100                	.insn	2, 0x0100
 dce:	1605                	.insn	2, 0x1605
 dd0:	04090803          	lb	a6,64(s2)
 dd4:	0100                	.insn	2, 0x0100
 dd6:	0505                	.insn	2, 0x0505
 dd8:	04097803          	.insn	4, 0x04097803
 ddc:	0100                	.insn	2, 0x0100
 dde:	0306                	.insn	2, 0x0306
 de0:	7dbd                	.insn	2, 0x7dbd
 de2:	0809                	.insn	2, 0x0809
 de4:	0100                	.insn	2, 0x0100
 de6:	0b06                	.insn	2, 0x0b06
 de8:	0902cd03          	lbu	s10,144(t0)
 dec:	001c                	.insn	2, 0x001c
 dee:	0501                	.insn	2, 0x0501
 df0:	0300                	.insn	2, 0x0300
 df2:	0905                	.insn	2, 0x0905
 df4:	0008                	.insn	2, 0x0008
 df6:	0501                	.insn	2, 0x0501
 df8:	0a09                	.insn	2, 0x0a09
 dfa:	04090103          	lb	sp,64(s2)
 dfe:	0100                	.insn	2, 0x0100
 e00:	0306                	.insn	2, 0x0306
 e02:	7dad                	.insn	2, 0x7dad
 e04:	0409                	.insn	2, 0x0409
 e06:	0100                	.insn	2, 0x0100
 e08:	0105                	.insn	2, 0x0105
 e0a:	0306                	.insn	2, 0x0306
 e0c:	02da                	.insn	2, 0x02da
 e0e:	0409                	.insn	2, 0x0409
 e10:	0100                	.insn	2, 0x0100
 e12:	0306                	.insn	2, 0x0306
 e14:	7da6                	.insn	2, 0x7da6
 e16:	1c09                	.insn	2, 0x1c09
 e18:	0100                	.insn	2, 0x0100
 e1a:	0505                	.insn	2, 0x0505
 e1c:	0306                	.insn	2, 0x0306
 e1e:	02d5                	.insn	2, 0x02d5
 e20:	0809                	.insn	2, 0x0809
 e22:	0100                	.insn	2, 0x0100
 e24:	0306                	.insn	2, 0x0306
 e26:	04097dab          	.insn	4, 0x04097dab
 e2a:	0100                	.insn	2, 0x0100
 e2c:	0f05                	.insn	2, 0x0f05
 e2e:	0306                	.insn	2, 0x0306
 e30:	02d6                	.insn	2, 0x02d6
 e32:	0409                	.insn	2, 0x0409
 e34:	0100                	.insn	2, 0x0100
 e36:	0d05                	.insn	2, 0x0d05
 e38:	0306                	.insn	2, 0x0306
 e3a:	0900                	.insn	2, 0x0900
 e3c:	0014                	.insn	2, 0x0014
 e3e:	0501                	.insn	2, 0x0501
 e40:	7f030627          	.insn	4, 0x7f030627
 e44:	0409                	.insn	2, 0x0409
 e46:	0100                	.insn	2, 0x0100
 e48:	1c05                	.insn	2, 0x1c05
 e4a:	0306                	.insn	2, 0x0306
 e4c:	0900                	.insn	2, 0x0900
 e4e:	0004                	.insn	2, 0x0004
 e50:	0501                	.insn	2, 0x0501
 e52:	0305                	.insn	2, 0x0305
 e54:	0900                	.insn	2, 0x0900
 e56:	0010                	.insn	2, 0x0010
 e58:	0501                	.insn	2, 0x0501
 e5a:	01030613          	addi	a2,t1,16 # 90001c8 <USER_MAX+0x8b001c8>
 e5e:	0409                	.insn	2, 0x0409
 e60:	0100                	.insn	2, 0x0100
 e62:	0306                	.insn	2, 0x0306
 e64:	7daa                	.insn	2, 0x7daa
 e66:	0409                	.insn	2, 0x0409
 e68:	0100                	.insn	2, 0x0100
 e6a:	0105                	.insn	2, 0x0105
 e6c:	0306                	.insn	2, 0x0306
 e6e:	02da                	.insn	2, 0x02da
 e70:	1409                	.insn	2, 0x1409
 e72:	0100                	.insn	2, 0x0100
 e74:	0505                	.insn	2, 0x0505
 e76:	030a                	.insn	2, 0x030a
 e78:	040900cb          	.insn	4, 0x040900cb
 e7c:	0100                	.insn	2, 0x0100
 e7e:	0c090803          	lb	a6,192(s2)
 e82:	0100                	.insn	2, 0x0100
 e84:	0809                	.insn	2, 0x0809
 e86:	0000                	.insn	2, 0x0000
 e88:	0101                	.insn	2, 0x0101
 e8a:	0505                	.insn	2, 0x0505
 e8c:	000a                	.insn	2, 0x000a
 e8e:	0205                	.insn	2, 0x0205
 e90:	0000                	.insn	2, 0x0000
 e92:	0040                	.insn	2, 0x0040
 e94:	0103fc03          	.insn	4, 0x0103fc03
 e98:	1c09                	.insn	2, 0x1c09
 e9a:	0000                	.insn	2, 0x0000
 e9c:	0101                	.insn	2, 0x0101
