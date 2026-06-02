
mulsi3_test1.elf:     ファイル形式 elf32-littleriscv


セクション .text の逆アセンブル:

00000000 <_start>:
   0:	00010117          	auipc	sp,0x10
   4:	00010113          	mv	sp,sp
   8:	3cc00513          	li	a0,972
   c:	3d000593          	li	a1,976
  10:	00b50863          	beq	a0,a1,20 <_start+0x20>
  14:	00052023          	sw	zero,0(a0)
  18:	00450513          	addi	a0,a0,4
  1c:	ff5ff06f          	j	10 <_start+0x10>
  20:	0040006f          	j	24 <run>

00000024 <run>:
  24:	fe010113          	addi	sp,sp,-32 # ffe0 <__bss_end+0xfc10>
  28:	00112e23          	sw	ra,28(sp)
  2c:	00812c23          	sw	s0,24(sp)
  30:	02010413          	addi	s0,sp,32
  34:	00300793          	li	a5,3
  38:	fef42623          	sw	a5,-20(s0)
  3c:	00700793          	li	a5,7
  40:	fef42423          	sw	a5,-24(s0)
  44:	fe842583          	lw	a1,-24(s0)
  48:	fec42503          	lw	a0,-20(s0)
  4c:	044000ef          	jal	90 <__mulsi3>
  50:	00050793          	mv	a5,a0
  54:	fef42223          	sw	a5,-28(s0)
  58:	100017b7          	lui	a5,0x10001
  5c:	fe442703          	lw	a4,-28(s0)
  60:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
  64:	fe442703          	lw	a4,-28(s0)
  68:	3ce02623          	sw	a4,972(zero) # 3cc <result>
  6c:	100017b7          	lui	a5,0x10001
  70:	0000f737          	lui	a4,0xf
  74:	e0170713          	addi	a4,a4,-511 # ee01 <__bss_end+0xea31>
  78:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
  7c:	100017b7          	lui	a5,0x10001
  80:	3cc02703          	lw	a4,972(zero) # 3cc <result>
  84:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
  88:	00000013          	nop
  8c:	ffdff06f          	j	88 <run+0x64>

00000090 <__mulsi3>:
  90:	fd010113          	addi	sp,sp,-48
  94:	02112623          	sw	ra,44(sp)
  98:	02812423          	sw	s0,40(sp)
  9c:	03010413          	addi	s0,sp,48
  a0:	fca42e23          	sw	a0,-36(s0)
  a4:	fcb42c23          	sw	a1,-40(s0)
  a8:	fe042623          	sw	zero,-20(s0)
  ac:	0380006f          	j	e4 <__mulsi3+0x54>
  b0:	fd842783          	lw	a5,-40(s0)
  b4:	0017f793          	andi	a5,a5,1
  b8:	00078a63          	beqz	a5,cc <__mulsi3+0x3c>
  bc:	fec42703          	lw	a4,-20(s0)
  c0:	fdc42783          	lw	a5,-36(s0)
  c4:	00f707b3          	add	a5,a4,a5
  c8:	fef42623          	sw	a5,-20(s0)
  cc:	fdc42783          	lw	a5,-36(s0)
  d0:	00179793          	slli	a5,a5,0x1
  d4:	fcf42e23          	sw	a5,-36(s0)
  d8:	fd842783          	lw	a5,-40(s0)
  dc:	0017d793          	srli	a5,a5,0x1
  e0:	fcf42c23          	sw	a5,-40(s0)
  e4:	fd842783          	lw	a5,-40(s0)
  e8:	fc0794e3          	bnez	a5,b0 <__mulsi3+0x20>
  ec:	fec42783          	lw	a5,-20(s0)
  f0:	00078513          	mv	a0,a5
  f4:	02c12083          	lw	ra,44(sp)
  f8:	02812403          	lw	s0,40(sp)
  fc:	03010113          	addi	sp,sp,48
 100:	00008067          	ret

00000104 <udivmod32>:
 104:	fd010113          	addi	sp,sp,-48
 108:	02112623          	sw	ra,44(sp)
 10c:	02812423          	sw	s0,40(sp)
 110:	03010413          	addi	s0,sp,48
 114:	fca42e23          	sw	a0,-36(s0)
 118:	fcb42c23          	sw	a1,-40(s0)
 11c:	fcc42a23          	sw	a2,-44(s0)
 120:	fe042623          	sw	zero,-20(s0)
 124:	fe042423          	sw	zero,-24(s0)
 128:	01f00793          	li	a5,31
 12c:	fef42223          	sw	a5,-28(s0)
 130:	0640006f          	j	194 <udivmod32+0x90>
 134:	fe842783          	lw	a5,-24(s0)
 138:	00179713          	slli	a4,a5,0x1
 13c:	fe442783          	lw	a5,-28(s0)
 140:	fdc42683          	lw	a3,-36(s0)
 144:	00f6d7b3          	srl	a5,a3,a5
 148:	0017f793          	andi	a5,a5,1
 14c:	00f767b3          	or	a5,a4,a5
 150:	fef42423          	sw	a5,-24(s0)
 154:	fe842703          	lw	a4,-24(s0)
 158:	fd842783          	lw	a5,-40(s0)
 15c:	02f76663          	bltu	a4,a5,188 <udivmod32+0x84>
 160:	fe842703          	lw	a4,-24(s0)
 164:	fd842783          	lw	a5,-40(s0)
 168:	40f707b3          	sub	a5,a4,a5
 16c:	fef42423          	sw	a5,-24(s0)
 170:	fe442783          	lw	a5,-28(s0)
 174:	00100713          	li	a4,1
 178:	00f717b3          	sll	a5,a4,a5
 17c:	fec42703          	lw	a4,-20(s0)
 180:	00f767b3          	or	a5,a4,a5
 184:	fef42623          	sw	a5,-20(s0)
 188:	fe442783          	lw	a5,-28(s0)
 18c:	fff78793          	addi	a5,a5,-1
 190:	fef42223          	sw	a5,-28(s0)
 194:	fe442783          	lw	a5,-28(s0)
 198:	f807dee3          	bgez	a5,134 <udivmod32+0x30>
 19c:	fd442783          	lw	a5,-44(s0)
 1a0:	00078863          	beqz	a5,1b0 <udivmod32+0xac>
 1a4:	fd442783          	lw	a5,-44(s0)
 1a8:	fe842703          	lw	a4,-24(s0)
 1ac:	00e7a023          	sw	a4,0(a5)
 1b0:	fec42783          	lw	a5,-20(s0)
 1b4:	00078513          	mv	a0,a5
 1b8:	02c12083          	lw	ra,44(sp)
 1bc:	02812403          	lw	s0,40(sp)
 1c0:	03010113          	addi	sp,sp,48
 1c4:	00008067          	ret

000001c8 <__udivsi3>:
 1c8:	fe010113          	addi	sp,sp,-32
 1cc:	00112e23          	sw	ra,28(sp)
 1d0:	00812c23          	sw	s0,24(sp)
 1d4:	02010413          	addi	s0,sp,32
 1d8:	fea42623          	sw	a0,-20(s0)
 1dc:	feb42423          	sw	a1,-24(s0)
 1e0:	fe842783          	lw	a5,-24(s0)
 1e4:	00079663          	bnez	a5,1f0 <__udivsi3+0x28>
 1e8:	00000793          	li	a5,0
 1ec:	01c0006f          	j	208 <__udivsi3+0x40>
 1f0:	00000613          	li	a2,0
 1f4:	fe842583          	lw	a1,-24(s0)
 1f8:	fec42503          	lw	a0,-20(s0)
 1fc:	f09ff0ef          	jal	104 <udivmod32>
 200:	00050793          	mv	a5,a0
 204:	00000013          	nop
 208:	00078513          	mv	a0,a5
 20c:	01c12083          	lw	ra,28(sp)
 210:	01812403          	lw	s0,24(sp)
 214:	02010113          	addi	sp,sp,32
 218:	00008067          	ret

0000021c <__umodsi3>:
 21c:	fd010113          	addi	sp,sp,-48
 220:	02112623          	sw	ra,44(sp)
 224:	02812423          	sw	s0,40(sp)
 228:	03010413          	addi	s0,sp,48
 22c:	fca42e23          	sw	a0,-36(s0)
 230:	fcb42c23          	sw	a1,-40(s0)
 234:	fd842783          	lw	a5,-40(s0)
 238:	00079663          	bnez	a5,244 <__umodsi3+0x28>
 23c:	00000793          	li	a5,0
 240:	01c0006f          	j	25c <__umodsi3+0x40>
 244:	fec40793          	addi	a5,s0,-20
 248:	00078613          	mv	a2,a5
 24c:	fd842583          	lw	a1,-40(s0)
 250:	fdc42503          	lw	a0,-36(s0)
 254:	eb1ff0ef          	jal	104 <udivmod32>
 258:	fec42783          	lw	a5,-20(s0)
 25c:	00078513          	mv	a0,a5
 260:	02c12083          	lw	ra,44(sp)
 264:	02812403          	lw	s0,40(sp)
 268:	03010113          	addi	sp,sp,48
 26c:	00008067          	ret

00000270 <__divsi3>:
 270:	fd010113          	addi	sp,sp,-48
 274:	02112623          	sw	ra,44(sp)
 278:	02812423          	sw	s0,40(sp)
 27c:	03010413          	addi	s0,sp,48
 280:	fca42e23          	sw	a0,-36(s0)
 284:	fcb42c23          	sw	a1,-40(s0)
 288:	fd842783          	lw	a5,-40(s0)
 28c:	00079663          	bnez	a5,298 <__divsi3+0x28>
 290:	00000793          	li	a5,0
 294:	0780006f          	j	30c <__divsi3+0x9c>
 298:	fdc42783          	lw	a5,-36(s0)
 29c:	0007da63          	bgez	a5,2b0 <__divsi3+0x40>
 2a0:	fdc42783          	lw	a5,-36(s0)
 2a4:	40f007b3          	neg	a5,a5
 2a8:	fef42623          	sw	a5,-20(s0)
 2ac:	00c0006f          	j	2b8 <__divsi3+0x48>
 2b0:	fdc42783          	lw	a5,-36(s0)
 2b4:	fef42623          	sw	a5,-20(s0)
 2b8:	fd842783          	lw	a5,-40(s0)
 2bc:	0007da63          	bgez	a5,2d0 <__divsi3+0x60>
 2c0:	fd842783          	lw	a5,-40(s0)
 2c4:	40f007b3          	neg	a5,a5
 2c8:	fef42423          	sw	a5,-24(s0)
 2cc:	00c0006f          	j	2d8 <__divsi3+0x68>
 2d0:	fd842783          	lw	a5,-40(s0)
 2d4:	fef42423          	sw	a5,-24(s0)
 2d8:	00000613          	li	a2,0
 2dc:	fe842583          	lw	a1,-24(s0)
 2e0:	fec42503          	lw	a0,-20(s0)
 2e4:	e21ff0ef          	jal	104 <udivmod32>
 2e8:	fea42223          	sw	a0,-28(s0)
 2ec:	fdc42703          	lw	a4,-36(s0)
 2f0:	fd842783          	lw	a5,-40(s0)
 2f4:	00f747b3          	xor	a5,a4,a5
 2f8:	0007d863          	bgez	a5,308 <__divsi3+0x98>
 2fc:	fe442783          	lw	a5,-28(s0)
 300:	40f007b3          	neg	a5,a5
 304:	0080006f          	j	30c <__divsi3+0x9c>
 308:	fe442783          	lw	a5,-28(s0)
 30c:	00078513          	mv	a0,a5
 310:	02c12083          	lw	ra,44(sp)
 314:	02812403          	lw	s0,40(sp)
 318:	03010113          	addi	sp,sp,48
 31c:	00008067          	ret

00000320 <__modsi3>:
 320:	fd010113          	addi	sp,sp,-48
 324:	02112623          	sw	ra,44(sp)
 328:	02812423          	sw	s0,40(sp)
 32c:	03010413          	addi	s0,sp,48
 330:	fca42e23          	sw	a0,-36(s0)
 334:	fcb42c23          	sw	a1,-40(s0)
 338:	fd842783          	lw	a5,-40(s0)
 33c:	00079663          	bnez	a5,348 <__modsi3+0x28>
 340:	00000793          	li	a5,0
 344:	0700006f          	j	3b4 <__modsi3+0x94>
 348:	fdc42783          	lw	a5,-36(s0)
 34c:	0007da63          	bgez	a5,360 <__modsi3+0x40>
 350:	fdc42783          	lw	a5,-36(s0)
 354:	40f007b3          	neg	a5,a5
 358:	fef42623          	sw	a5,-20(s0)
 35c:	00c0006f          	j	368 <__modsi3+0x48>
 360:	fdc42783          	lw	a5,-36(s0)
 364:	fef42623          	sw	a5,-20(s0)
 368:	fd842783          	lw	a5,-40(s0)
 36c:	0007da63          	bgez	a5,380 <__modsi3+0x60>
 370:	fd842783          	lw	a5,-40(s0)
 374:	40f007b3          	neg	a5,a5
 378:	fef42423          	sw	a5,-24(s0)
 37c:	00c0006f          	j	388 <__modsi3+0x68>
 380:	fd842783          	lw	a5,-40(s0)
 384:	fef42423          	sw	a5,-24(s0)
 388:	fe440793          	addi	a5,s0,-28
 38c:	00078613          	mv	a2,a5
 390:	fe842583          	lw	a1,-24(s0)
 394:	fec42503          	lw	a0,-20(s0)
 398:	d6dff0ef          	jal	104 <udivmod32>
 39c:	fdc42783          	lw	a5,-36(s0)
 3a0:	0007d863          	bgez	a5,3b0 <__modsi3+0x90>
 3a4:	fe442783          	lw	a5,-28(s0)
 3a8:	40f007b3          	neg	a5,a5
 3ac:	0080006f          	j	3b4 <__modsi3+0x94>
 3b0:	fe442783          	lw	a5,-28(s0)
 3b4:	00078513          	mv	a0,a5
 3b8:	02c12083          	lw	ra,44(sp)
 3bc:	02812403          	lw	s0,40(sp)
 3c0:	03010113          	addi	sp,sp,48
 3c4:	00008067          	ret
