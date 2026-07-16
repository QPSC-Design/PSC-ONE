
sret_test1.elf:     ファイル形式 elf32-littleriscv


セクション .text の逆アセンブル:

00000000 <_start>:
   0:	00010117          	auipc	sp,0x10
   4:	00010113          	mv	sp,sp
   8:	40800513          	li	a0,1032
   c:	40800593          	li	a1,1032
  10:	00b50863          	beq	a0,a1,20 <_start+0x20>
  14:	00052023          	sw	zero,0(a0)
  18:	00450513          	addi	a0,a0,4
  1c:	ff5ff06f          	j	10 <_start+0x10>
  20:	0040006f          	j	24 <run>

00000024 <run>:
  24:	fe010113          	addi	sp,sp,-32 # ffe0 <__bss_end+0xfbd8>
  28:	00112e23          	sw	ra,28(sp)
  2c:	00812c23          	sw	s0,24(sp)
  30:	02010413          	addi	s0,sp,32
  34:	07800793          	li	a5,120
  38:	fef42623          	sw	a5,-20(s0)
  3c:	fec42783          	lw	a5,-20(s0)
  40:	34179073          	csrw	mepc,a5
  44:	000022b7          	lui	t0,0x2
  48:	80028293          	addi	t0,t0,-2048 # 1800 <__bss_end+0x13f8>
  4c:	3002b073          	csrc	mstatus,t0
  50:	000012b7          	lui	t0,0x1
  54:	80028293          	addi	t0,t0,-2048 # 800 <__bss_end+0x3f8>
  58:	3002a073          	csrs	mstatus,t0
  5c:	100017b7          	lui	a5,0x10001
  60:	00001737          	lui	a4,0x1
  64:	00170713          	addi	a4,a4,1 # 1001 <__bss_end+0xbf9>
  68:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
  6c:	30200073          	mret
  70:	00000013          	nop
  74:	ffdff06f          	j	70 <run+0x4c>

00000078 <s_mode_entry>:
  78:	fe010113          	addi	sp,sp,-32
  7c:	00112e23          	sw	ra,28(sp)
  80:	00812c23          	sw	s0,24(sp)
  84:	02010413          	addi	s0,sp,32
  88:	0bc00793          	li	a5,188
  8c:	fef42623          	sw	a5,-20(s0)
  90:	fec42783          	lw	a5,-20(s0)
  94:	14179073          	csrw	sepc,a5
  98:	10000293          	li	t0,256
  9c:	1002a073          	csrs	sstatus,t0
  a0:	100017b7          	lui	a5,0x10001
  a4:	00002737          	lui	a4,0x2
  a8:	00170713          	addi	a4,a4,1 # 2001 <__bss_end+0x1bf9>
  ac:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
  b0:	10200073          	sret
  b4:	00000013          	nop
  b8:	ffdff06f          	j	b4 <s_mode_entry+0x3c>

000000bc <sret_target>:
  bc:	fe010113          	addi	sp,sp,-32
  c0:	00112e23          	sw	ra,28(sp)
  c4:	00812c23          	sw	s0,24(sp)
  c8:	02010413          	addi	s0,sp,32
  cc:	100027f3          	csrr	a5,sstatus
  d0:	fef42423          	sw	a5,-24(s0)
  d4:	fe842703          	lw	a4,-24(s0)
  d8:	000017b7          	lui	a5,0x1
  dc:	fff78793          	addi	a5,a5,-1 # fff <__bss_end+0xbf7>
  e0:	00f776b3          	and	a3,a4,a5
  e4:	100017b7          	lui	a5,0x10001
  e8:	0000b737          	lui	a4,0xb
  ec:	00e6e733          	or	a4,a3,a4
  f0:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
  f4:	fe842783          	lw	a5,-24(s0)
  f8:	1007f793          	andi	a5,a5,256
  fc:	00079a63          	bnez	a5,110 <sret_target+0x54>
 100:	0000e7b7          	lui	a5,0xe
 104:	c1278793          	addi	a5,a5,-1006 # dc12 <__bss_end+0xd80a>
 108:	fef42623          	sw	a5,-20(s0)
 10c:	0100006f          	j	11c <sret_target+0x60>
 110:	000017b7          	lui	a5,0x1
 114:	23478793          	addi	a5,a5,564 # 1234 <__bss_end+0xe2c>
 118:	fef42623          	sw	a5,-20(s0)
 11c:	100017b7          	lui	a5,0x10001
 120:	0000f737          	lui	a4,0xf
 124:	e0170713          	addi	a4,a4,-511 # ee01 <__bss_end+0xe9f9>
 128:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 12c:	100017b7          	lui	a5,0x10001
 130:	fec42703          	lw	a4,-20(s0)
 134:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 138:	00000013          	nop
 13c:	ffdff06f          	j	138 <sret_target+0x7c>

00000140 <udivmod32>:
 140:	fd010113          	addi	sp,sp,-48
 144:	02112623          	sw	ra,44(sp)
 148:	02812423          	sw	s0,40(sp)
 14c:	03010413          	addi	s0,sp,48
 150:	fca42e23          	sw	a0,-36(s0)
 154:	fcb42c23          	sw	a1,-40(s0)
 158:	fcc42a23          	sw	a2,-44(s0)
 15c:	fe042623          	sw	zero,-20(s0)
 160:	fe042423          	sw	zero,-24(s0)
 164:	01f00793          	li	a5,31
 168:	fef42223          	sw	a5,-28(s0)
 16c:	0640006f          	j	1d0 <udivmod32+0x90>
 170:	fe842783          	lw	a5,-24(s0)
 174:	00179713          	slli	a4,a5,0x1
 178:	fe442783          	lw	a5,-28(s0)
 17c:	fdc42683          	lw	a3,-36(s0)
 180:	00f6d7b3          	srl	a5,a3,a5
 184:	0017f793          	andi	a5,a5,1
 188:	00f767b3          	or	a5,a4,a5
 18c:	fef42423          	sw	a5,-24(s0)
 190:	fe842703          	lw	a4,-24(s0)
 194:	fd842783          	lw	a5,-40(s0)
 198:	02f76663          	bltu	a4,a5,1c4 <udivmod32+0x84>
 19c:	fe842703          	lw	a4,-24(s0)
 1a0:	fd842783          	lw	a5,-40(s0)
 1a4:	40f707b3          	sub	a5,a4,a5
 1a8:	fef42423          	sw	a5,-24(s0)
 1ac:	fe442783          	lw	a5,-28(s0)
 1b0:	00100713          	li	a4,1
 1b4:	00f717b3          	sll	a5,a4,a5
 1b8:	fec42703          	lw	a4,-20(s0)
 1bc:	00f767b3          	or	a5,a4,a5
 1c0:	fef42623          	sw	a5,-20(s0)
 1c4:	fe442783          	lw	a5,-28(s0)
 1c8:	fff78793          	addi	a5,a5,-1
 1cc:	fef42223          	sw	a5,-28(s0)
 1d0:	fe442783          	lw	a5,-28(s0)
 1d4:	f807dee3          	bgez	a5,170 <udivmod32+0x30>
 1d8:	fd442783          	lw	a5,-44(s0)
 1dc:	00078863          	beqz	a5,1ec <udivmod32+0xac>
 1e0:	fd442783          	lw	a5,-44(s0)
 1e4:	fe842703          	lw	a4,-24(s0)
 1e8:	00e7a023          	sw	a4,0(a5)
 1ec:	fec42783          	lw	a5,-20(s0)
 1f0:	00078513          	mv	a0,a5
 1f4:	02c12083          	lw	ra,44(sp)
 1f8:	02812403          	lw	s0,40(sp)
 1fc:	03010113          	addi	sp,sp,48
 200:	00008067          	ret

00000204 <__udivsi3>:
 204:	fe010113          	addi	sp,sp,-32
 208:	00112e23          	sw	ra,28(sp)
 20c:	00812c23          	sw	s0,24(sp)
 210:	02010413          	addi	s0,sp,32
 214:	fea42623          	sw	a0,-20(s0)
 218:	feb42423          	sw	a1,-24(s0)
 21c:	fe842783          	lw	a5,-24(s0)
 220:	00079663          	bnez	a5,22c <__udivsi3+0x28>
 224:	00000793          	li	a5,0
 228:	01c0006f          	j	244 <__udivsi3+0x40>
 22c:	00000613          	li	a2,0
 230:	fe842583          	lw	a1,-24(s0)
 234:	fec42503          	lw	a0,-20(s0)
 238:	f09ff0ef          	jal	140 <udivmod32>
 23c:	00050793          	mv	a5,a0
 240:	00000013          	nop
 244:	00078513          	mv	a0,a5
 248:	01c12083          	lw	ra,28(sp)
 24c:	01812403          	lw	s0,24(sp)
 250:	02010113          	addi	sp,sp,32
 254:	00008067          	ret

00000258 <__umodsi3>:
 258:	fd010113          	addi	sp,sp,-48
 25c:	02112623          	sw	ra,44(sp)
 260:	02812423          	sw	s0,40(sp)
 264:	03010413          	addi	s0,sp,48
 268:	fca42e23          	sw	a0,-36(s0)
 26c:	fcb42c23          	sw	a1,-40(s0)
 270:	fd842783          	lw	a5,-40(s0)
 274:	00079663          	bnez	a5,280 <__umodsi3+0x28>
 278:	00000793          	li	a5,0
 27c:	01c0006f          	j	298 <__umodsi3+0x40>
 280:	fec40793          	addi	a5,s0,-20
 284:	00078613          	mv	a2,a5
 288:	fd842583          	lw	a1,-40(s0)
 28c:	fdc42503          	lw	a0,-36(s0)
 290:	eb1ff0ef          	jal	140 <udivmod32>
 294:	fec42783          	lw	a5,-20(s0)
 298:	00078513          	mv	a0,a5
 29c:	02c12083          	lw	ra,44(sp)
 2a0:	02812403          	lw	s0,40(sp)
 2a4:	03010113          	addi	sp,sp,48
 2a8:	00008067          	ret

000002ac <__divsi3>:
 2ac:	fd010113          	addi	sp,sp,-48
 2b0:	02112623          	sw	ra,44(sp)
 2b4:	02812423          	sw	s0,40(sp)
 2b8:	03010413          	addi	s0,sp,48
 2bc:	fca42e23          	sw	a0,-36(s0)
 2c0:	fcb42c23          	sw	a1,-40(s0)
 2c4:	fd842783          	lw	a5,-40(s0)
 2c8:	00079663          	bnez	a5,2d4 <__divsi3+0x28>
 2cc:	00000793          	li	a5,0
 2d0:	0780006f          	j	348 <__divsi3+0x9c>
 2d4:	fdc42783          	lw	a5,-36(s0)
 2d8:	0007da63          	bgez	a5,2ec <__divsi3+0x40>
 2dc:	fdc42783          	lw	a5,-36(s0)
 2e0:	40f007b3          	neg	a5,a5
 2e4:	fef42623          	sw	a5,-20(s0)
 2e8:	00c0006f          	j	2f4 <__divsi3+0x48>
 2ec:	fdc42783          	lw	a5,-36(s0)
 2f0:	fef42623          	sw	a5,-20(s0)
 2f4:	fd842783          	lw	a5,-40(s0)
 2f8:	0007da63          	bgez	a5,30c <__divsi3+0x60>
 2fc:	fd842783          	lw	a5,-40(s0)
 300:	40f007b3          	neg	a5,a5
 304:	fef42423          	sw	a5,-24(s0)
 308:	00c0006f          	j	314 <__divsi3+0x68>
 30c:	fd842783          	lw	a5,-40(s0)
 310:	fef42423          	sw	a5,-24(s0)
 314:	00000613          	li	a2,0
 318:	fe842583          	lw	a1,-24(s0)
 31c:	fec42503          	lw	a0,-20(s0)
 320:	e21ff0ef          	jal	140 <udivmod32>
 324:	fea42223          	sw	a0,-28(s0)
 328:	fdc42703          	lw	a4,-36(s0)
 32c:	fd842783          	lw	a5,-40(s0)
 330:	00f747b3          	xor	a5,a4,a5
 334:	0007d863          	bgez	a5,344 <__divsi3+0x98>
 338:	fe442783          	lw	a5,-28(s0)
 33c:	40f007b3          	neg	a5,a5
 340:	0080006f          	j	348 <__divsi3+0x9c>
 344:	fe442783          	lw	a5,-28(s0)
 348:	00078513          	mv	a0,a5
 34c:	02c12083          	lw	ra,44(sp)
 350:	02812403          	lw	s0,40(sp)
 354:	03010113          	addi	sp,sp,48
 358:	00008067          	ret

0000035c <__modsi3>:
 35c:	fd010113          	addi	sp,sp,-48
 360:	02112623          	sw	ra,44(sp)
 364:	02812423          	sw	s0,40(sp)
 368:	03010413          	addi	s0,sp,48
 36c:	fca42e23          	sw	a0,-36(s0)
 370:	fcb42c23          	sw	a1,-40(s0)
 374:	fd842783          	lw	a5,-40(s0)
 378:	00079663          	bnez	a5,384 <__modsi3+0x28>
 37c:	00000793          	li	a5,0
 380:	0700006f          	j	3f0 <__modsi3+0x94>
 384:	fdc42783          	lw	a5,-36(s0)
 388:	0007da63          	bgez	a5,39c <__modsi3+0x40>
 38c:	fdc42783          	lw	a5,-36(s0)
 390:	40f007b3          	neg	a5,a5
 394:	fef42623          	sw	a5,-20(s0)
 398:	00c0006f          	j	3a4 <__modsi3+0x48>
 39c:	fdc42783          	lw	a5,-36(s0)
 3a0:	fef42623          	sw	a5,-20(s0)
 3a4:	fd842783          	lw	a5,-40(s0)
 3a8:	0007da63          	bgez	a5,3bc <__modsi3+0x60>
 3ac:	fd842783          	lw	a5,-40(s0)
 3b0:	40f007b3          	neg	a5,a5
 3b4:	fef42423          	sw	a5,-24(s0)
 3b8:	00c0006f          	j	3c4 <__modsi3+0x68>
 3bc:	fd842783          	lw	a5,-40(s0)
 3c0:	fef42423          	sw	a5,-24(s0)
 3c4:	fe440793          	addi	a5,s0,-28
 3c8:	00078613          	mv	a2,a5
 3cc:	fe842583          	lw	a1,-24(s0)
 3d0:	fec42503          	lw	a0,-20(s0)
 3d4:	d6dff0ef          	jal	140 <udivmod32>
 3d8:	fdc42783          	lw	a5,-36(s0)
 3dc:	0007d863          	bgez	a5,3ec <__modsi3+0x90>
 3e0:	fe442783          	lw	a5,-28(s0)
 3e4:	40f007b3          	neg	a5,a5
 3e8:	0080006f          	j	3f0 <__modsi3+0x94>
 3ec:	fe442783          	lw	a5,-28(s0)
 3f0:	00078513          	mv	a0,a5
 3f4:	02c12083          	lw	ra,44(sp)
 3f8:	02812403          	lw	s0,40(sp)
 3fc:	03010113          	addi	sp,sp,48
 400:	00008067          	ret
