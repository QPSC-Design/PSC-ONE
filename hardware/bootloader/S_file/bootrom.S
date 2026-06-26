
./build/bootrom.elf:     ファイル形式 elf32-littleriscv


セクション .text の逆アセンブル:

00000000 <_start>:

/* ------------------------------------------------------------
 * M-mode Boot Entry
 * ------------------------------------------------------------ */
_start:
    la      sp, _mstack_top
   0:	00001117          	auipc	sp,0x1
   4:	13010113          	addi	sp,sp,304 # 1130 <_mstack_top>

    # mtvec = trap handler
    la      t0, m_trap_vector
   8:	00000297          	auipc	t0,0x0
   c:	04428293          	addi	t0,t0,68 # 4c <m_trap_vector>
    csrw    mtvec, t0
  10:	30529073          	csrw	mtvec,t0

    # Disable MMU
    csrw    satp, zero
  14:	18001073          	csrw	satp,zero

    # Delegate U-mode ECALL to S-mode
    li      t0, (1 << 8)
  18:	10000293          	li	t0,256
    csrw    medeleg, t0
  1c:	30229073          	csrw	medeleg,t0

    # mstatus.MPP = S-mode (01)
    csrr    t0, mstatus
  20:	300022f3          	csrr	t0,mstatus
    li      t1, ~(3 << 11)     # MPP mask clear
  24:	ffffe337          	lui	t1,0xffffe
  28:	7ff30313          	addi	t1,t1,2047 # ffffe7ff <_mstack_top+0xffffd6cf>
    and     t0, t0, t1
  2c:	0062f2b3          	and	t0,t0,t1
    li      t1, (1 << 11)      # MPP = S
  30:	00100313          	li	t1,1
  34:	00b31313          	slli	t1,t1,0xb
    or      t0, t0, t1
  38:	0062e2b3          	or	t0,t0,t1
    csrw    mstatus, t0
  3c:	30029073          	csrw	mstatus,t0

    # mepc = S kernel entry (0x00200000)
#ifdef USE_BOOTLOADER
    li t0, 0x00100000
  40:	001002b7          	lui	t0,0x100
#else
    li t0, 0x00200000
#endif

    csrw mepc, t0
  44:	34129073          	csrw	mepc,t0
    mret
  48:	30200073          	mret

0000004c <m_trap_vector>:

/* ------------------------------------------------------------
 * M-mode trap handler
 * ------------------------------------------------------------ */
m_trap_vector:
    addi    sp, sp, -128
  4c:	f8010113          	addi	sp,sp,-128
    sw      ra,   0(sp)
  50:	00112023          	sw	ra,0(sp)
    sw      t0,   4(sp)
  54:	00512223          	sw	t0,4(sp)
    sw      t1,   8(sp)
  58:	00612423          	sw	t1,8(sp)
    sw      t2,  12(sp)
  5c:	00712623          	sw	t2,12(sp)
    sw      a0,  16(sp)
  60:	00a12823          	sw	a0,16(sp)
    sw      a1,  20(sp)
  64:	00b12a23          	sw	a1,20(sp)
    sw      a2,  24(sp)
  68:	00c12c23          	sw	a2,24(sp)
    sw      a3,  28(sp)
  6c:	00d12e23          	sw	a3,28(sp)
    sw      a4,  32(sp)
  70:	02e12023          	sw	a4,32(sp)
    sw      a5,  36(sp)
  74:	02f12223          	sw	a5,36(sp)
    sw      a6,  40(sp)
  78:	03012423          	sw	a6,40(sp)
    sw      a7,  44(sp)
  7c:	03112623          	sw	a7,44(sp)

    csrr    t0, mcause
  80:	342022f3          	csrr	t0,mcause
    li      t1, 9              # S-mode ECALL
  84:	00900313          	li	t1,9
    beq     t0, t1, sbi_ecall
  88:	00628463          	beq	t0,t1,90 <sbi_ecall>

0000008c <illegal>:

illegal:
    j       illegal
  8c:	0000006f          	j	8c <illegal>

00000090 <sbi_ecall>:
/* ------------------------------------------------------------
 * SBI Dispatcher
 * a7 = ext (1=putchar, 2=getchar)
 * ------------------------------------------------------------ */
sbi_ecall:
    li t1, 1
  90:	00100313          	li	t1,1
    beq a7, t1, sbi_putchar
  94:	00688a63          	beq	a7,t1,a8 <$x.2>

    li t1, 2
  98:	00200313          	li	t1,2
    beq a7, t1, sbi_getchar
  9c:	02688863          	beq	a7,t1,cc <sbi_getchar>

    j illegal
  a0:	fedff06f          	j	8c <illegal>

000000a4 <$d.1>:
  a4:	0000                	.insn	2, 0x0000
  a6:	1000                	.insn	2, 0x1000

000000a8 <$x.2>:

/* ------------------------------------------------------------
 * SBI console putchar
 * ------------------------------------------------------------ */
sbi_putchar:
    la t1, uart_base
  a8:	00000317          	auipc	t1,0x0
  ac:	ffc30313          	addi	t1,t1,-4 # a4 <$d.1>
    lw t1, 0(t1)
  b0:	00032303          	lw	t1,0(t1)

1:
    lw t2, 8(t1)   # UART_ST
  b4:	00832383          	lw	t2,8(t1)
    andi t2, t2, 1 # TX busy
  b8:	0013f393          	andi	t2,t2,1
    bnez t2, 1b
  bc:	fe039ce3          	bnez	t2,b4 <$x.2+0xc>

    sb a0, 0(t1)   # UART_TX
  c0:	00a30023          	sb	a0,0(t1)
    li a0, 0       # return OK
  c4:	00000513          	li	a0,0
    j sbi_ret
  c8:	0240006f          	j	ec <sbi_ret>

000000cc <sbi_getchar>:

/* ------------------------------------------------------------
 * SBI console getchar
 * ------------------------------------------------------------ */
sbi_getchar:
    la t1, uart_base
  cc:	00000317          	auipc	t1,0x0
  d0:	fd830313          	addi	t1,t1,-40 # a4 <$d.1>
    lw t1, 0(t1)
  d4:	00032303          	lw	t1,0(t1)

2:
    lw t2, 8(t1)    # UART_ST
  d8:	00832383          	lw	t2,8(t1)
    andi t2, t2, 2  # RX available
  dc:	0023f393          	andi	t2,t2,2
    beqz t2, 2b
  e0:	fe038ce3          	beqz	t2,d8 <sbi_getchar+0xc>

    lb a0, 4(t1)    # UART_RX
  e4:	00430503          	lb	a0,4(t1)
    j sbi_ret
  e8:	0040006f          	j	ec <sbi_ret>

000000ec <sbi_ret>:

/* ------------------------------------------------------------
 * SBI return
 * ------------------------------------------------------------ */
sbi_ret:
    csrr t0, mepc
  ec:	341022f3          	csrr	t0,mepc
    addi t0, t0, 4
  f0:	00428293          	addi	t0,t0,4 # 100004 <_mstack_top+0xfeed4>
    csrw mepc, t0
  f4:	34129073          	csrw	mepc,t0

    lw      ra,   0(sp)
  f8:	00012083          	lw	ra,0(sp)
    lw      t0,   4(sp)
  fc:	00412283          	lw	t0,4(sp)
    lw      t1,   8(sp)
 100:	00812303          	lw	t1,8(sp)
    lw      t2,  12(sp)
 104:	00c12383          	lw	t2,12(sp)
    lw      a0,  16(sp)
 108:	01012503          	lw	a0,16(sp)
    lw      a1,  20(sp)
 10c:	01412583          	lw	a1,20(sp)
    lw      a2,  24(sp)
 110:	01812603          	lw	a2,24(sp)
    lw      a3,  28(sp)
 114:	01c12683          	lw	a3,28(sp)
    lw      a4,  32(sp)
 118:	02012703          	lw	a4,32(sp)
    lw      a5,  36(sp)
 11c:	02412783          	lw	a5,36(sp)
    lw      a6,  40(sp)
 120:	02812803          	lw	a6,40(sp)
    lw      a7,  44(sp)
 124:	02c12883          	lw	a7,44(sp)
    addi    sp, sp, 128
 128:	08010113          	addi	sp,sp,128

    mret
 12c:	30200073          	mret

セクション .riscv.attributes の逆アセンブル:

00000000 <.riscv.attributes>:
    la      sp, _mstack_top
   0:	3741                	.insn	2, 0x3741
   2:	0000                	.insn	2, 0x0000
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
    la      t0, m_trap_vector
   8:	01007663          	bgeu	zero,a6,14 <_start+0x14>
   c:	002d                	.insn	2, 0x002d
   e:	0000                	.insn	2, 0x0000
    csrw    mtvec, t0
  10:	7205                	.insn	2, 0x7205
  12:	3376                	.insn	2, 0x3376
    csrw    satp, zero
  14:	6932                	.insn	2, 0x6932
  16:	7032                	.insn	2, 0x7032
    li      t0, (1 << 8)
  18:	5f31                	.insn	2, 0x5f31
  1a:	697a                	.insn	2, 0x697a
    csrw    medeleg, t0
  1c:	32727363          	bgeu	tp,t2,342 <$d.3+0x212>
    csrr    t0, mstatus
  20:	3070                	.insn	2, 0x3070
  22:	7a5f 6669 6e65      	.insn	6, 0x6e6566697a5f
    li      t1, ~(3 << 11)     # MPP mask clear
  28:	32696563          	bltu	s2,t1,352 <$d.3+0x222>
    and     t0, t0, t1
  2c:	3070                	.insn	2, 0x3070
  2e:	7a5f 6d6d 6c75      	.insn	6, 0x6c756d6d7a5f
    li      t1, (1 << 11)      # MPP = S
  34:	7031                	.insn	2, 0x7031
  36:	0030                	.insn	2, 0x0030

セクション .debug_info の逆アセンブル:

00000000 <$d.7>:
   0:	013d                	.insn	2, 0x013d
    la      sp, _mstack_top
   2:	0000                	.insn	2, 0x0000
   4:	0004                	.insn	2, 0x0004
   6:	0000                	.insn	2, 0x0000
    la      t0, m_trap_vector
   8:	0000                	.insn	2, 0x0000
   a:	0104                	.insn	2, 0x0104
	...
    csrw    satp, zero
  14:	0130                	.insn	2, 0x0130
  16:	0000                	.insn	2, 0x0000
    li      t0, (1 << 8)
  18:	2f2e                	.insn	2, 0x2f2e
  1a:	2f637273          	csrrci	tp,0x2f6,6
    csrw    medeleg, t0
  1e:	7370                	.insn	2, 0x7370
    csrr    t0, mstatus
  20:	626d5f63          	bge	s10,t1,65e <$d.3+0x52e>
    li      t1, ~(3 << 11)     # MPP mask clear
  24:	6f69                	.insn	2, 0x6f69
  26:	00532e73          	csrrs	t3,0x5,t1
  2a:	6d6f682f          	.insn	4, 0x6d6f682f
    and     t0, t0, t1
  2e:	2f65                	.insn	2, 0x2f65
    li      t1, (1 << 11)      # MPP = S
  30:	6168                	.insn	2, 0x6168
  32:	7572                	.insn	2, 0x7572
  34:	6968                	.insn	2, 0x6968
  36:	502f6f6b          	.insn	4, 0x502f6f6b
    or      t0, t0, t1
  3a:	6f72                	.insn	2, 0x6f72
    csrw    mstatus, t0
  3c:	6d617267          	.insn	4, 0x6d617267
    li t0, 0x00100000
  40:	4353502f          	.insn	4, 0x4353502f
    csrw mepc, t0
  44:	525f 3356 4932      	.insn	6, 0x49323356525f
    mret
  4a:	4353502f          	.insn	4, 0x4353502f
    addi    sp, sp, -128
  4e:	4f2d                	.insn	2, 0x4f2d
    sw      ra,   0(sp)
  50:	454e                	.insn	2, 0x454e
  52:	666f732f          	.insn	4, 0x666f732f
    sw      t0,   4(sp)
  56:	7774                	.insn	2, 0x7774
    sw      t1,   8(sp)
  58:	7261                	.insn	2, 0x7261
  5a:	2f65                	.insn	2, 0x2f65
    sw      t2,  12(sp)
  5c:	5500736f          	jal	t1,75ac <_mstack_top+0x647c>
    sw      a0,  16(sp)
  60:	7562                	.insn	2, 0x7562
  62:	746e                	.insn	2, 0x746e
    sw      a1,  20(sp)
  64:	2075                	.insn	2, 0x2075
  66:	6e616c63          	bltu	sp,t1,75e <$d.3+0x62e>
    sw      a2,  24(sp)
  6a:	65762067          	.insn	4, 0x65762067
    sw      a3,  28(sp)
  6e:	7372                	.insn	2, 0x7372
    sw      a4,  32(sp)
  70:	6f69                	.insn	2, 0x6f69
  72:	206e                	.insn	2, 0x206e
    sw      a5,  36(sp)
  74:	3831                	.insn	2, 0x3831
  76:	312e                	.insn	2, 0x312e
    sw      a6,  40(sp)
  78:	332e                	.insn	2, 0x332e
  7a:	2820                	.insn	2, 0x2820
    sw      a7,  44(sp)
  7c:	7531                	.insn	2, 0x7531
  7e:	7562                	.insn	2, 0x7562
    csrr    t0, mcause
  80:	746e                	.insn	2, 0x746e
  82:	3175                	.insn	2, 0x3175
    li      t1, 9              # S-mode ECALL
  84:	0029                	.insn	2, 0x0029
  86:	8001                	.insn	2, 0x8001
    beq     t0, t1, sbi_ecall
  88:	7302                	.insn	2, 0x7302
  8a:	6174                	.insn	2, 0x6174
    j       illegal
  8c:	7472                	.insn	2, 0x7472
  8e:	0100                	.insn	2, 0x0100
    li t1, 1
  90:	0000                	.insn	2, 0x0000
  92:	1700                	.insn	2, 0x1700
    beq a7, t1, sbi_putchar
  94:	0000                	.insn	2, 0x0000
  96:	0000                	.insn	2, 0x0000
    li t1, 2
  98:	0000                	.insn	2, 0x0000
  9a:	0200                	.insn	2, 0x0200
    beq a7, t1, sbi_getchar
  9c:	5f6d                	.insn	2, 0x5f6d
  9e:	7274                	.insn	2, 0x7274
    j illegal
  a0:	7061                	.insn	2, 0x7061
  a2:	765f 6365 6f74      	.insn	6, 0x6f746365765f
    la t1, uart_base
  a8:	0072                	.insn	2, 0x0072
  aa:	0001                	.insn	2, 0x0001
  ac:	0000                	.insn	2, 0x0000
  ae:	003a                	.insn	2, 0x003a
    lw t1, 0(t1)
  b0:	0000                	.insn	2, 0x0000
  b2:	004c                	.insn	2, 0x004c
    lw t2, 8(t1)   # UART_ST
  b4:	0000                	.insn	2, 0x0000
  b6:	6902                	.insn	2, 0x6902
    andi t2, t2, 1 # TX busy
  b8:	6c6c                	.insn	2, 0x6c6c
  ba:	6765                	.insn	2, 0x6765
    bnez t2, 1b
  bc:	6c61                	.insn	2, 0x6c61
  be:	0100                	.insn	2, 0x0100
    sb a0, 0(t1)   # UART_TX
  c0:	0000                	.insn	2, 0x0000
  c2:	4d00                	.insn	2, 0x4d00
    li a0, 0       # return OK
  c4:	0000                	.insn	2, 0x0000
  c6:	8c00                	.insn	2, 0x8c00
    j sbi_ret
  c8:	0000                	.insn	2, 0x0000
  ca:	0200                	.insn	2, 0x0200
    la t1, uart_base
  cc:	5f696273          	csrrsi	tp,0x5f6,18
  d0:	6365                	.insn	2, 0x6365
  d2:	6c61                	.insn	2, 0x6c61
    lw t1, 0(t1)
  d4:	006c                	.insn	2, 0x006c
  d6:	0001                	.insn	2, 0x0001
    lw t2, 8(t1)    # UART_ST
  d8:	0000                	.insn	2, 0x0000
  da:	0055                	.insn	2, 0x0055
    andi t2, t2, 2  # RX available
  dc:	0000                	.insn	2, 0x0000
  de:	0090                	.insn	2, 0x0090
    beqz t2, 2b
  e0:	0000                	.insn	2, 0x0000
  e2:	7502                	.insn	2, 0x7502
    lb a0, 4(t1)    # UART_RX
  e4:	7261                	.insn	2, 0x7261
  e6:	5f74                	.insn	2, 0x5f74
    j sbi_ret
  e8:	6162                	.insn	2, 0x6162
  ea:	01006573          	csrrsi	a0,0x10,0
    csrr t0, mepc
  ee:	0000                	.insn	2, 0x0000
    addi t0, t0, 4
  f0:	6200                	.insn	2, 0x6200
  f2:	0000                	.insn	2, 0x0000
    csrw mepc, t0
  f4:	a400                	.insn	2, 0xa400
  f6:	0000                	.insn	2, 0x0000
    lw      ra,   0(sp)
  f8:	0200                	.insn	2, 0x0200
  fa:	5f696273          	csrrsi	tp,0x5f6,18
    lw      t0,   4(sp)
  fe:	7570                	.insn	2, 0x7570
    lw      t1,   8(sp)
 100:	6374                	.insn	2, 0x6374
 102:	6168                	.insn	2, 0x6168
    lw      t2,  12(sp)
 104:	0072                	.insn	2, 0x0072
 106:	0001                	.insn	2, 0x0001
    lw      a0,  16(sp)
 108:	0000                	.insn	2, 0x0000
 10a:	0068                	.insn	2, 0x0068
    lw      a1,  20(sp)
 10c:	0000                	.insn	2, 0x0000
 10e:	00a8                	.insn	2, 0x00a8
    lw      a2,  24(sp)
 110:	0000                	.insn	2, 0x0000
 112:	7302                	.insn	2, 0x7302
    lw      a3,  28(sp)
 114:	6962                	.insn	2, 0x6962
 116:	675f 7465 6863      	.insn	6, 0x68637465675f
    lw      a5,  36(sp)
 11c:	7261                	.insn	2, 0x7261
 11e:	0100                	.insn	2, 0x0100
    lw      a6,  40(sp)
 120:	0000                	.insn	2, 0x0000
 122:	7800                	.insn	2, 0x7800
    lw      a7,  44(sp)
 124:	0000                	.insn	2, 0x0000
 126:	cc00                	.insn	2, 0xcc00
    addi    sp, sp, 128
 128:	0000                	.insn	2, 0x0000
 12a:	0200                	.insn	2, 0x0200
    mret
 12c:	5f696273          	csrrsi	tp,0x5f6,18
 130:	6572                	.insn	2, 0x6572
 132:	0074                	.insn	2, 0x0074
 134:	0001                	.insn	2, 0x0001
 136:	0000                	.insn	2, 0x0000
 138:	00000087          	.insn	4, 0x0087
 13c:	00ec                	.insn	2, 0x00ec
 13e:	0000                	.insn	2, 0x0000
	...

セクション .debug_abbrev の逆アセンブル:

00000000 <$d.6>:
   0:	1101                	.insn	2, 0x1101
    la      sp, _mstack_top
   2:	1001                	.insn	2, 0x1001
   4:	12011117          	auipc	sp,0x12011
    la      t0, m_trap_vector
   8:	0301                	.insn	2, 0x0301
   a:	1b08                	.insn	2, 0x1b08
   c:	2508                	.insn	2, 0x2508
   e:	1308                	.insn	2, 0x1308
    csrw    mtvec, t0
  10:	0005                	.insn	2, 0x0005
  12:	0200                	.insn	2, 0x0200
    csrw    satp, zero
  14:	000a                	.insn	2, 0x000a
  16:	063a0803          	lb	a6,99(s4)
    li      t0, (1 << 8)
  1a:	0111063b          	.insn	4, 0x0111063b
    csrw    medeleg, t0
  1e:	0000                	.insn	2, 0x0000
	...

セクション .debug_aranges の逆アセンブル:

00000000 <$d.5>:
   0:	001c                	.insn	2, 0x001c
    la      sp, _mstack_top
   2:	0000                	.insn	2, 0x0000
   4:	0002                	.insn	2, 0x0002
   6:	0000                	.insn	2, 0x0000
    la      t0, m_trap_vector
   8:	0000                	.insn	2, 0x0000
   a:	0004                	.insn	2, 0x0004
	...
    csrw    satp, zero
  14:	0130                	.insn	2, 0x0130
	...

セクション .debug_line の逆アセンブル:

00000000 <$d.8>:
   0:	000001d7          	.insn	4, 0x01d7
    la      sp, _mstack_top
   4:	0004                	.insn	2, 0x0004
   6:	0029                	.insn	2, 0x0029
    la      t0, m_trap_vector
   8:	0000                	.insn	2, 0x0000
   a:	0101                	.insn	2, 0x0101
   c:	fb01                	.insn	2, 0xfb01
   e:	0d0e                	.insn	2, 0x0d0e
    csrw    mtvec, t0
  10:	0100                	.insn	2, 0x0100
  12:	0101                	.insn	2, 0x0101
    csrw    satp, zero
  14:	0001                	.insn	2, 0x0001
  16:	0000                	.insn	2, 0x0000
    li      t0, (1 << 8)
  18:	0001                	.insn	2, 0x0001
  1a:	0100                	.insn	2, 0x0100
    csrw    medeleg, t0
  1c:	2f2e                	.insn	2, 0x2f2e
  1e:	00637273          	csrrci	tp,0x6,6
    csrr    t0, mstatus
  22:	7000                	.insn	2, 0x7000
    li      t1, ~(3 << 11)     # MPP mask clear
  24:	6d5f6373          	csrrsi	t1,0x6d5,30
  28:	6962                	.insn	2, 0x6962
  2a:	532e736f          	jal	t1,e755c <_mstack_top+0xe642c>
    and     t0, t0, t1
  2e:	0100                	.insn	2, 0x0100
    li      t1, (1 << 11)      # MPP = S
  30:	0000                	.insn	2, 0x0000
  32:	0000                	.insn	2, 0x0000
  34:	0205                	.insn	2, 0x0205
  36:	0000                	.insn	2, 0x0000
    or      t0, t0, t1
  38:	0000                	.insn	2, 0x0000
  3a:	03011003          	lh	zero,48(sp) # 12011034 <_mstack_top+0x1200ff04>
    csrw    mstatus, t0
  3e:	00080903          	lb	s2,0(a6)
    li t0, 0x00100000
  42:	0301                	.insn	2, 0x0301
    csrw mepc, t0
  44:	0901                	.insn	2, 0x0901
  46:	0008                	.insn	2, 0x0008
    mret
  48:	0301                	.insn	2, 0x0301
  4a:	00040903          	lb	s2,0(s0)
    addi    sp, sp, -128
  4e:	0301                	.insn	2, 0x0301
    sw      ra,   0(sp)
  50:	00040903          	lb	s2,0(s0)
    sw      t0,   4(sp)
  54:	0301                	.insn	2, 0x0301
  56:	0901                	.insn	2, 0x0901
    sw      t1,   8(sp)
  58:	0004                	.insn	2, 0x0004
  5a:	0301                	.insn	2, 0x0301
    sw      t2,  12(sp)
  5c:	00040903          	lb	s2,0(s0)
    sw      a0,  16(sp)
  60:	0301                	.insn	2, 0x0301
  62:	0901                	.insn	2, 0x0901
    sw      a1,  20(sp)
  64:	0004                	.insn	2, 0x0004
  66:	0301                	.insn	2, 0x0301
    sw      a2,  24(sp)
  68:	0901                	.insn	2, 0x0901
  6a:	0008                	.insn	2, 0x0008
    sw      a3,  28(sp)
  6c:	0301                	.insn	2, 0x0301
  6e:	0901                	.insn	2, 0x0901
    sw      a4,  32(sp)
  70:	0004                	.insn	2, 0x0004
  72:	0301                	.insn	2, 0x0301
    sw      a5,  36(sp)
  74:	0901                	.insn	2, 0x0901
  76:	0008                	.insn	2, 0x0008
    sw      a6,  40(sp)
  78:	0301                	.insn	2, 0x0301
  7a:	0901                	.insn	2, 0x0901
    sw      a7,  44(sp)
  7c:	0004                	.insn	2, 0x0004
  7e:	0301                	.insn	2, 0x0301
    csrr    t0, mcause
  80:	0904                	.insn	2, 0x0904
  82:	0004                	.insn	2, 0x0004
    li      t1, 9              # S-mode ECALL
  84:	0301                	.insn	2, 0x0301
  86:	0905                	.insn	2, 0x0905
    beq     t0, t1, sbi_ecall
  88:	0004                	.insn	2, 0x0004
  8a:	0301                	.insn	2, 0x0301
    j       illegal
  8c:	0901                	.insn	2, 0x0901
  8e:	0004                	.insn	2, 0x0004
    li t1, 1
  90:	0301                	.insn	2, 0x0301
  92:	0906                	.insn	2, 0x0906
    beq a7, t1, sbi_putchar
  94:	0004                	.insn	2, 0x0004
  96:	0301                	.insn	2, 0x0301
    li t1, 2
  98:	0901                	.insn	2, 0x0901
  9a:	0004                	.insn	2, 0x0004
    beq a7, t1, sbi_getchar
  9c:	0301                	.insn	2, 0x0301
  9e:	0901                	.insn	2, 0x0901
    j illegal
  a0:	0004                	.insn	2, 0x0004
  a2:	0301                	.insn	2, 0x0301
  a4:	0901                	.insn	2, 0x0901
  a6:	0004                	.insn	2, 0x0004
    la t1, uart_base
  a8:	0301                	.insn	2, 0x0301
  aa:	0901                	.insn	2, 0x0901
  ac:	0004                	.insn	2, 0x0004
  ae:	0301                	.insn	2, 0x0301
    lw t1, 0(t1)
  b0:	0901                	.insn	2, 0x0901
  b2:	0004                	.insn	2, 0x0004
    lw t2, 8(t1)   # UART_ST
  b4:	0301                	.insn	2, 0x0301
  b6:	0901                	.insn	2, 0x0901
    andi t2, t2, 1 # TX busy
  b8:	0004                	.insn	2, 0x0004
  ba:	0301                	.insn	2, 0x0301
    bnez t2, 1b
  bc:	0901                	.insn	2, 0x0901
  be:	0004                	.insn	2, 0x0004
    sb a0, 0(t1)   # UART_TX
  c0:	0301                	.insn	2, 0x0301
  c2:	0901                	.insn	2, 0x0901
    li a0, 0       # return OK
  c4:	0004                	.insn	2, 0x0004
  c6:	0301                	.insn	2, 0x0301
    j sbi_ret
  c8:	0901                	.insn	2, 0x0901
  ca:	0004                	.insn	2, 0x0004
    la t1, uart_base
  cc:	0301                	.insn	2, 0x0301
  ce:	0901                	.insn	2, 0x0901
  d0:	0004                	.insn	2, 0x0004
  d2:	0301                	.insn	2, 0x0301
    lw t1, 0(t1)
  d4:	0901                	.insn	2, 0x0901
  d6:	0004                	.insn	2, 0x0004
    lw t2, 8(t1)    # UART_ST
  d8:	0301                	.insn	2, 0x0301
  da:	0901                	.insn	2, 0x0901
    andi t2, t2, 2  # RX available
  dc:	0004                	.insn	2, 0x0004
  de:	0301                	.insn	2, 0x0301
    beqz t2, 2b
  e0:	0902                	.insn	2, 0x0902
  e2:	0004                	.insn	2, 0x0004
    lb a0, 4(t1)    # UART_RX
  e4:	0301                	.insn	2, 0x0301
  e6:	0901                	.insn	2, 0x0901
    j sbi_ret
  e8:	0004                	.insn	2, 0x0004
  ea:	0301                	.insn	2, 0x0301
    csrr t0, mepc
  ec:	0901                	.insn	2, 0x0901
  ee:	0004                	.insn	2, 0x0004
    addi t0, t0, 4
  f0:	0301                	.insn	2, 0x0301
  f2:	00040903          	lb	s2,0(s0)
    csrw mepc, t0
  f6:	0301                	.insn	2, 0x0301
    lw      ra,   0(sp)
  f8:	0908                	.insn	2, 0x0908
  fa:	0004                	.insn	2, 0x0004
    lw      t0,   4(sp)
  fc:	0301                	.insn	2, 0x0301
  fe:	0901                	.insn	2, 0x0901
    lw      t1,   8(sp)
 100:	0004                	.insn	2, 0x0004
 102:	0301                	.insn	2, 0x0301
    lw      t2,  12(sp)
 104:	0902                	.insn	2, 0x0902
 106:	0004                	.insn	2, 0x0004
    lw      a0,  16(sp)
 108:	0301                	.insn	2, 0x0301
 10a:	0901                	.insn	2, 0x0901
    lw      a1,  20(sp)
 10c:	0004                	.insn	2, 0x0004
 10e:	0301                	.insn	2, 0x0301
    lw      a2,  24(sp)
 110:	0902                	.insn	2, 0x0902
 112:	0004                	.insn	2, 0x0004
    lw      a3,  28(sp)
 114:	0301                	.insn	2, 0x0301
 116:	090d                	.insn	2, 0x090d
    lw      a4,  32(sp)
 118:	0008                	.insn	2, 0x0008
 11a:	0301                	.insn	2, 0x0301
    lw      a5,  36(sp)
 11c:	0901                	.insn	2, 0x0901
 11e:	0008                	.insn	2, 0x0008
    lw      a6,  40(sp)
 120:	0301                	.insn	2, 0x0301
 122:	00040903          	lb	s2,0(s0)
    lw      a7,  44(sp)
 126:	0301                	.insn	2, 0x0301
    addi    sp, sp, 128
 128:	0901                	.insn	2, 0x0901
 12a:	0004                	.insn	2, 0x0004
    mret
 12c:	0301                	.insn	2, 0x0301
 12e:	0901                	.insn	2, 0x0901
 130:	0004                	.insn	2, 0x0004
 132:	0301                	.insn	2, 0x0301
 134:	0902                	.insn	2, 0x0902
 136:	0004                	.insn	2, 0x0004
 138:	0301                	.insn	2, 0x0301
 13a:	0901                	.insn	2, 0x0901
 13c:	0004                	.insn	2, 0x0004
 13e:	0301                	.insn	2, 0x0301
 140:	0901                	.insn	2, 0x0901
 142:	0004                	.insn	2, 0x0004
 144:	0301                	.insn	2, 0x0301
 146:	0906                	.insn	2, 0x0906
 148:	0004                	.insn	2, 0x0004
 14a:	0301                	.insn	2, 0x0301
 14c:	0901                	.insn	2, 0x0901
 14e:	0008                	.insn	2, 0x0008
 150:	0301                	.insn	2, 0x0301
 152:	00040903          	lb	s2,0(s0)
 156:	0301                	.insn	2, 0x0301
 158:	0901                	.insn	2, 0x0901
 15a:	0004                	.insn	2, 0x0004
 15c:	0301                	.insn	2, 0x0301
 15e:	0901                	.insn	2, 0x0901
 160:	0004                	.insn	2, 0x0004
 162:	0301                	.insn	2, 0x0301
 164:	0902                	.insn	2, 0x0902
 166:	0004                	.insn	2, 0x0004
 168:	0301                	.insn	2, 0x0301
 16a:	0901                	.insn	2, 0x0901
 16c:	0004                	.insn	2, 0x0004
 16e:	0301                	.insn	2, 0x0301
 170:	0906                	.insn	2, 0x0906
 172:	0004                	.insn	2, 0x0004
 174:	0301                	.insn	2, 0x0301
 176:	0901                	.insn	2, 0x0901
 178:	0004                	.insn	2, 0x0004
 17a:	0301                	.insn	2, 0x0301
 17c:	0901                	.insn	2, 0x0901
 17e:	0004                	.insn	2, 0x0004
 180:	0301                	.insn	2, 0x0301
 182:	0902                	.insn	2, 0x0902
 184:	0004                	.insn	2, 0x0004
 186:	0301                	.insn	2, 0x0301
 188:	0901                	.insn	2, 0x0901
 18a:	0004                	.insn	2, 0x0004
 18c:	0301                	.insn	2, 0x0301
 18e:	0901                	.insn	2, 0x0901
 190:	0004                	.insn	2, 0x0004
 192:	0301                	.insn	2, 0x0301
 194:	0901                	.insn	2, 0x0901
 196:	0004                	.insn	2, 0x0004
 198:	0301                	.insn	2, 0x0301
 19a:	0901                	.insn	2, 0x0901
 19c:	0004                	.insn	2, 0x0004
 19e:	0301                	.insn	2, 0x0301
 1a0:	0901                	.insn	2, 0x0901
 1a2:	0004                	.insn	2, 0x0004
 1a4:	0301                	.insn	2, 0x0301
 1a6:	0901                	.insn	2, 0x0901
 1a8:	0004                	.insn	2, 0x0004
 1aa:	0301                	.insn	2, 0x0301
 1ac:	0901                	.insn	2, 0x0901
 1ae:	0004                	.insn	2, 0x0004
 1b0:	0301                	.insn	2, 0x0301
 1b2:	0901                	.insn	2, 0x0901
 1b4:	0004                	.insn	2, 0x0004
 1b6:	0301                	.insn	2, 0x0301
 1b8:	0901                	.insn	2, 0x0901
 1ba:	0004                	.insn	2, 0x0004
 1bc:	0301                	.insn	2, 0x0301
 1be:	0901                	.insn	2, 0x0901
 1c0:	0004                	.insn	2, 0x0004
 1c2:	0301                	.insn	2, 0x0301
 1c4:	0901                	.insn	2, 0x0901
 1c6:	0004                	.insn	2, 0x0004
 1c8:	0301                	.insn	2, 0x0301
 1ca:	0901                	.insn	2, 0x0901
 1cc:	0004                	.insn	2, 0x0004
 1ce:	0301                	.insn	2, 0x0301
 1d0:	0902                	.insn	2, 0x0902
 1d2:	0004                	.insn	2, 0x0004
 1d4:	0901                	.insn	2, 0x0901
 1d6:	0004                	.insn	2, 0x0004
 1d8:	0100                	.insn	2, 0x0100
 1da:	01                	.byte	0x01

セクション .comment の逆アセンブル:

00000000 <.comment>:
    la      sp, _mstack_top
   0:	694c                	.insn	2, 0x694c
   2:	6b6e                	.insn	2, 0x6b6e
   4:	7265                	.insn	2, 0x7265
   6:	203a                	.insn	2, 0x203a
    la      t0, m_trap_vector
   8:	6255                	.insn	2, 0x6255
   a:	6e75                	.insn	2, 0x6e75
   c:	7574                	.insn	2, 0x7574
   e:	4c20                	.insn	2, 0x4c20
    csrw    mtvec, t0
  10:	444c                	.insn	2, 0x444c
  12:	3120                	.insn	2, 0x3120
    csrw    satp, zero
  14:	2e38                	.insn	2, 0x2e38
  16:	2e31                	.insn	2, 0x2e31
    li      t0, (1 << 8)
  18:	0033                	.short	0x0033
