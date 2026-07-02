
divmod_test1.elf:     ファイル形式 elf32-littleriscv


セクション .text の逆アセンブル:

00000000 <_start>:
   0:	00010117          	auipc	sp,0x10
   4:	00010113          	mv	sp,sp
   8:	39000513          	li	a0,912
   c:	39400593          	li	a1,916
  10:	00b50863          	beq	a0,a1,20 <_start+0x20>
  14:	00052023          	sw	zero,0(a0)
  18:	00450513          	addi	a0,a0,4
  1c:	ff5ff06f          	j	10 <_start+0x10>
  20:	0040006f          	j	24 <run>

00000024 <run>:
  24:	fd010113          	addi	sp,sp,-48 # ffd0 <__bss_end+0xfc3c>
  28:	02112623          	sw	ra,44(sp)
  2c:	02812423          	sw	s0,40(sp)
  30:	03010413          	addi	s0,sp,48
  34:	06400793          	li	a5,100
  38:	fef42623          	sw	a5,-20(s0)
  3c:	00700793          	li	a5,7
  40:	fef42423          	sw	a5,-24(s0)
  44:	fe842583          	lw	a1,-24(s0)
  48:	fec42503          	lw	a0,-20(s0)
  4c:	140000ef          	jal	18c <__udivsi3>
  50:	00050793          	mv	a5,a0
  54:	fef42223          	sw	a5,-28(s0)
  58:	fec42783          	lw	a5,-20(s0)
  5c:	fe842583          	lw	a1,-24(s0)
  60:	00078513          	mv	a0,a5
  64:	17c000ef          	jal	1e0 <__umodsi3>
  68:	00050793          	mv	a5,a0
  6c:	fef42023          	sw	a5,-32(s0)
  70:	100017b7          	lui	a5,0x10001
  74:	fe442703          	lw	a4,-28(s0)
  78:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
  7c:	100017b7          	lui	a5,0x10001
  80:	fe042703          	lw	a4,-32(s0)
  84:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
  88:	fe442783          	lw	a5,-28(s0)
  8c:	00879793          	slli	a5,a5,0x8
  90:	fe042703          	lw	a4,-32(s0)
  94:	00f767b3          	or	a5,a4,a5
  98:	fcf42e23          	sw	a5,-36(s0)
  9c:	fdc42703          	lw	a4,-36(s0)
  a0:	38e02823          	sw	a4,912(zero) # 390 <result>
  a4:	100017b7          	lui	a5,0x10001
  a8:	0000f737          	lui	a4,0xf
  ac:	e0170713          	addi	a4,a4,-511 # ee01 <__bss_end+0xea6d>
  b0:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
  b4:	100017b7          	lui	a5,0x10001
  b8:	39002703          	lw	a4,912(zero) # 390 <result>
  bc:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
  c0:	00000013          	nop
  c4:	ffdff06f          	j	c0 <run+0x9c>

000000c8 <udivmod32>:
  c8:	fd010113          	addi	sp,sp,-48
  cc:	02112623          	sw	ra,44(sp)
  d0:	02812423          	sw	s0,40(sp)
  d4:	03010413          	addi	s0,sp,48
  d8:	fca42e23          	sw	a0,-36(s0)
  dc:	fcb42c23          	sw	a1,-40(s0)
  e0:	fcc42a23          	sw	a2,-44(s0)
  e4:	fe042623          	sw	zero,-20(s0)
  e8:	fe042423          	sw	zero,-24(s0)
  ec:	01f00793          	li	a5,31
  f0:	fef42223          	sw	a5,-28(s0)
  f4:	0640006f          	j	158 <udivmod32+0x90>
  f8:	fe842783          	lw	a5,-24(s0)
  fc:	00179713          	slli	a4,a5,0x1
 100:	fe442783          	lw	a5,-28(s0)
 104:	fdc42683          	lw	a3,-36(s0)
 108:	00f6d7b3          	srl	a5,a3,a5
 10c:	0017f793          	andi	a5,a5,1
 110:	00f767b3          	or	a5,a4,a5
 114:	fef42423          	sw	a5,-24(s0)
 118:	fe842703          	lw	a4,-24(s0)
 11c:	fd842783          	lw	a5,-40(s0)
 120:	02f76663          	bltu	a4,a5,14c <udivmod32+0x84>
 124:	fe842703          	lw	a4,-24(s0)
 128:	fd842783          	lw	a5,-40(s0)
 12c:	40f707b3          	sub	a5,a4,a5
 130:	fef42423          	sw	a5,-24(s0)
 134:	fe442783          	lw	a5,-28(s0)
 138:	00100713          	li	a4,1
 13c:	00f717b3          	sll	a5,a4,a5
 140:	fec42703          	lw	a4,-20(s0)
 144:	00f767b3          	or	a5,a4,a5
 148:	fef42623          	sw	a5,-20(s0)
 14c:	fe442783          	lw	a5,-28(s0)
 150:	fff78793          	addi	a5,a5,-1
 154:	fef42223          	sw	a5,-28(s0)
 158:	fe442783          	lw	a5,-28(s0)
 15c:	f807dee3          	bgez	a5,f8 <udivmod32+0x30>
 160:	fd442783          	lw	a5,-44(s0)
 164:	00078863          	beqz	a5,174 <udivmod32+0xac>
 168:	fd442783          	lw	a5,-44(s0)
 16c:	fe842703          	lw	a4,-24(s0)
 170:	00e7a023          	sw	a4,0(a5)
 174:	fec42783          	lw	a5,-20(s0)
 178:	00078513          	mv	a0,a5
 17c:	02c12083          	lw	ra,44(sp)
 180:	02812403          	lw	s0,40(sp)
 184:	03010113          	addi	sp,sp,48
 188:	00008067          	ret

0000018c <__udivsi3>:
 18c:	fe010113          	addi	sp,sp,-32
 190:	00112e23          	sw	ra,28(sp)
 194:	00812c23          	sw	s0,24(sp)
 198:	02010413          	addi	s0,sp,32
 19c:	fea42623          	sw	a0,-20(s0)
 1a0:	feb42423          	sw	a1,-24(s0)
 1a4:	fe842783          	lw	a5,-24(s0)
 1a8:	00079663          	bnez	a5,1b4 <__udivsi3+0x28>
 1ac:	00000793          	li	a5,0
 1b0:	01c0006f          	j	1cc <__udivsi3+0x40>
 1b4:	00000613          	li	a2,0
 1b8:	fe842583          	lw	a1,-24(s0)
 1bc:	fec42503          	lw	a0,-20(s0)
 1c0:	f09ff0ef          	jal	c8 <udivmod32>
 1c4:	00050793          	mv	a5,a0
 1c8:	00000013          	nop
 1cc:	00078513          	mv	a0,a5
 1d0:	01c12083          	lw	ra,28(sp)
 1d4:	01812403          	lw	s0,24(sp)
 1d8:	02010113          	addi	sp,sp,32
 1dc:	00008067          	ret

000001e0 <__umodsi3>:
 1e0:	fd010113          	addi	sp,sp,-48
 1e4:	02112623          	sw	ra,44(sp)
 1e8:	02812423          	sw	s0,40(sp)
 1ec:	03010413          	addi	s0,sp,48
 1f0:	fca42e23          	sw	a0,-36(s0)
 1f4:	fcb42c23          	sw	a1,-40(s0)
 1f8:	fd842783          	lw	a5,-40(s0)
 1fc:	00079663          	bnez	a5,208 <__umodsi3+0x28>
 200:	00000793          	li	a5,0
 204:	01c0006f          	j	220 <__umodsi3+0x40>
 208:	fec40793          	addi	a5,s0,-20
 20c:	00078613          	mv	a2,a5
 210:	fd842583          	lw	a1,-40(s0)
 214:	fdc42503          	lw	a0,-36(s0)
 218:	eb1ff0ef          	jal	c8 <udivmod32>
 21c:	fec42783          	lw	a5,-20(s0)
 220:	00078513          	mv	a0,a5
 224:	02c12083          	lw	ra,44(sp)
 228:	02812403          	lw	s0,40(sp)
 22c:	03010113          	addi	sp,sp,48
 230:	00008067          	ret

00000234 <__divsi3>:
 234:	fd010113          	addi	sp,sp,-48
 238:	02112623          	sw	ra,44(sp)
 23c:	02812423          	sw	s0,40(sp)
 240:	03010413          	addi	s0,sp,48
 244:	fca42e23          	sw	a0,-36(s0)
 248:	fcb42c23          	sw	a1,-40(s0)
 24c:	fd842783          	lw	a5,-40(s0)
 250:	00079663          	bnez	a5,25c <__divsi3+0x28>
 254:	00000793          	li	a5,0
 258:	0780006f          	j	2d0 <__divsi3+0x9c>
 25c:	fdc42783          	lw	a5,-36(s0)
 260:	0007da63          	bgez	a5,274 <__divsi3+0x40>
 264:	fdc42783          	lw	a5,-36(s0)
 268:	40f007b3          	neg	a5,a5
 26c:	fef42623          	sw	a5,-20(s0)
 270:	00c0006f          	j	27c <__divsi3+0x48>
 274:	fdc42783          	lw	a5,-36(s0)
 278:	fef42623          	sw	a5,-20(s0)
 27c:	fd842783          	lw	a5,-40(s0)
 280:	0007da63          	bgez	a5,294 <__divsi3+0x60>
 284:	fd842783          	lw	a5,-40(s0)
 288:	40f007b3          	neg	a5,a5
 28c:	fef42423          	sw	a5,-24(s0)
 290:	00c0006f          	j	29c <__divsi3+0x68>
 294:	fd842783          	lw	a5,-40(s0)
 298:	fef42423          	sw	a5,-24(s0)
 29c:	00000613          	li	a2,0
 2a0:	fe842583          	lw	a1,-24(s0)
 2a4:	fec42503          	lw	a0,-20(s0)
 2a8:	e21ff0ef          	jal	c8 <udivmod32>
 2ac:	fea42223          	sw	a0,-28(s0)
 2b0:	fdc42703          	lw	a4,-36(s0)
 2b4:	fd842783          	lw	a5,-40(s0)
 2b8:	00f747b3          	xor	a5,a4,a5
 2bc:	0007d863          	bgez	a5,2cc <__divsi3+0x98>
 2c0:	fe442783          	lw	a5,-28(s0)
 2c4:	40f007b3          	neg	a5,a5
 2c8:	0080006f          	j	2d0 <__divsi3+0x9c>
 2cc:	fe442783          	lw	a5,-28(s0)
 2d0:	00078513          	mv	a0,a5
 2d4:	02c12083          	lw	ra,44(sp)
 2d8:	02812403          	lw	s0,40(sp)
 2dc:	03010113          	addi	sp,sp,48
 2e0:	00008067          	ret

000002e4 <__modsi3>:
 2e4:	fd010113          	addi	sp,sp,-48
 2e8:	02112623          	sw	ra,44(sp)
 2ec:	02812423          	sw	s0,40(sp)
 2f0:	03010413          	addi	s0,sp,48
 2f4:	fca42e23          	sw	a0,-36(s0)
 2f8:	fcb42c23          	sw	a1,-40(s0)
 2fc:	fd842783          	lw	a5,-40(s0)
 300:	00079663          	bnez	a5,30c <__modsi3+0x28>
 304:	00000793          	li	a5,0
 308:	0700006f          	j	378 <__modsi3+0x94>
 30c:	fdc42783          	lw	a5,-36(s0)
 310:	0007da63          	bgez	a5,324 <__modsi3+0x40>
 314:	fdc42783          	lw	a5,-36(s0)
 318:	40f007b3          	neg	a5,a5
 31c:	fef42623          	sw	a5,-20(s0)
 320:	00c0006f          	j	32c <__modsi3+0x48>
 324:	fdc42783          	lw	a5,-36(s0)
 328:	fef42623          	sw	a5,-20(s0)
 32c:	fd842783          	lw	a5,-40(s0)
 330:	0007da63          	bgez	a5,344 <__modsi3+0x60>
 334:	fd842783          	lw	a5,-40(s0)
 338:	40f007b3          	neg	a5,a5
 33c:	fef42423          	sw	a5,-24(s0)
 340:	00c0006f          	j	34c <__modsi3+0x68>
 344:	fd842783          	lw	a5,-40(s0)
 348:	fef42423          	sw	a5,-24(s0)
 34c:	fe440793          	addi	a5,s0,-28
 350:	00078613          	mv	a2,a5
 354:	fe842583          	lw	a1,-24(s0)
 358:	fec42503          	lw	a0,-20(s0)
 35c:	d6dff0ef          	jal	c8 <udivmod32>
 360:	fdc42783          	lw	a5,-36(s0)
 364:	0007d863          	bgez	a5,374 <__modsi3+0x90>
 368:	fe442783          	lw	a5,-28(s0)
 36c:	40f007b3          	neg	a5,a5
 370:	0080006f          	j	378 <__modsi3+0x94>
 374:	fe442783          	lw	a5,-28(s0)
 378:	00078513          	mv	a0,a5
 37c:	02c12083          	lw	ra,44(sp)
 380:	02812403          	lw	s0,40(sp)
 384:	03010113          	addi	sp,sp,48
 388:	00008067          	ret
