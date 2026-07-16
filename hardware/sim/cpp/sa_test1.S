
sa_test1.elf:     ファイル形式 elf32-littleriscv


セクション .text の逆アセンブル:

00000000 <_start>:
   0:	00010117          	auipc	sp,0x10
   4:	00010113          	mv	sp,sp
   8:	54400513          	li	a0,1348
   c:	54400593          	li	a1,1348
  10:	00b50863          	beq	a0,a1,20 <_start+0x20>
  14:	00052023          	sw	zero,0(a0)
  18:	00450513          	addi	a0,a0,4
  1c:	ff5ff06f          	j	10 <_start+0x10>
  20:	2cc0006f          	j	2ec <run>

00000024 <_ZL21sa_read_result_matrixPt>:
  24:	fd010113          	addi	sp,sp,-48 # ffd0 <__bss_end+0xfa8c>
  28:	02112623          	sw	ra,44(sp)
  2c:	02812423          	sw	s0,40(sp)
  30:	03010413          	addi	s0,sp,48
  34:	fca42e23          	sw	a0,-36(s0)
  38:	000227b7          	lui	a5,0x22
  3c:	fef42423          	sw	a5,-24(s0)
  40:	fe042623          	sw	zero,-20(s0)
  44:	0480006f          	j	8c <_ZL21sa_read_result_matrixPt+0x68>
  48:	fec42783          	lw	a5,-20(s0)
  4c:	00279713          	slli	a4,a5,0x2
  50:	000227b7          	lui	a5,0x22
  54:	00f707b3          	add	a5,a4,a5
  58:	0007a783          	lw	a5,0(a5) # 22000 <_stack_top+0x12000>
  5c:	fef42223          	sw	a5,-28(s0)
  60:	fec42783          	lw	a5,-20(s0)
  64:	00179793          	slli	a5,a5,0x1
  68:	fdc42703          	lw	a4,-36(s0)
  6c:	00f707b3          	add	a5,a4,a5
  70:	fe442703          	lw	a4,-28(s0)
  74:	01071713          	slli	a4,a4,0x10
  78:	01075713          	srli	a4,a4,0x10
  7c:	00e79023          	sh	a4,0(a5)
  80:	fec42783          	lw	a5,-20(s0)
  84:	00178793          	addi	a5,a5,1
  88:	fef42623          	sw	a5,-20(s0)
  8c:	fec42703          	lw	a4,-20(s0)
  90:	00f00793          	li	a5,15
  94:	fae7dae3          	bge	a5,a4,48 <_ZL21sa_read_result_matrixPt+0x24>
  98:	00000013          	nop
  9c:	00000013          	nop
  a0:	02c12083          	lw	ra,44(sp)
  a4:	02812403          	lw	s0,40(sp)
  a8:	03010113          	addi	sp,sp,48
  ac:	00008067          	ret

000000b0 <_ZL12matmul2x2_swPA4_KhS1_PA4_t>:
  b0:	fd010113          	addi	sp,sp,-48
  b4:	02112623          	sw	ra,44(sp)
  b8:	02812423          	sw	s0,40(sp)
  bc:	03010413          	addi	s0,sp,48
  c0:	fca42e23          	sw	a0,-36(s0)
  c4:	fcb42c23          	sw	a1,-40(s0)
  c8:	fcc42a23          	sw	a2,-44(s0)
  cc:	fe042623          	sw	zero,-20(s0)
  d0:	0cc0006f          	j	19c <_ZL12matmul2x2_swPA4_KhS1_PA4_t+0xec>
  d4:	fe042423          	sw	zero,-24(s0)
  d8:	0ac0006f          	j	184 <_ZL12matmul2x2_swPA4_KhS1_PA4_t+0xd4>
  dc:	fe042223          	sw	zero,-28(s0)
  e0:	fe042023          	sw	zero,-32(s0)
  e4:	05c0006f          	j	140 <_ZL12matmul2x2_swPA4_KhS1_PA4_t+0x90>
  e8:	fec42783          	lw	a5,-20(s0)
  ec:	00279793          	slli	a5,a5,0x2
  f0:	fdc42703          	lw	a4,-36(s0)
  f4:	00f70733          	add	a4,a4,a5
  f8:	fe042783          	lw	a5,-32(s0)
  fc:	00f707b3          	add	a5,a4,a5
 100:	0007c783          	lbu	a5,0(a5)
 104:	00078693          	mv	a3,a5
 108:	fe042783          	lw	a5,-32(s0)
 10c:	00279793          	slli	a5,a5,0x2
 110:	fd842703          	lw	a4,-40(s0)
 114:	00f70733          	add	a4,a4,a5
 118:	fe842783          	lw	a5,-24(s0)
 11c:	00f707b3          	add	a5,a4,a5
 120:	0007c783          	lbu	a5,0(a5)
 124:	02f687b3          	mul	a5,a3,a5
 128:	fe442703          	lw	a4,-28(s0)
 12c:	00f707b3          	add	a5,a4,a5
 130:	fef42223          	sw	a5,-28(s0)
 134:	fe042783          	lw	a5,-32(s0)
 138:	00178793          	addi	a5,a5,1
 13c:	fef42023          	sw	a5,-32(s0)
 140:	fe042703          	lw	a4,-32(s0)
 144:	00300793          	li	a5,3
 148:	fae7d0e3          	bge	a5,a4,e8 <_ZL12matmul2x2_swPA4_KhS1_PA4_t+0x38>
 14c:	fec42783          	lw	a5,-20(s0)
 150:	00379793          	slli	a5,a5,0x3
 154:	fd442703          	lw	a4,-44(s0)
 158:	00f706b3          	add	a3,a4,a5
 15c:	fe442783          	lw	a5,-28(s0)
 160:	01079713          	slli	a4,a5,0x10
 164:	01075713          	srli	a4,a4,0x10
 168:	fe842783          	lw	a5,-24(s0)
 16c:	00179793          	slli	a5,a5,0x1
 170:	00f687b3          	add	a5,a3,a5
 174:	00e79023          	sh	a4,0(a5)
 178:	fe842783          	lw	a5,-24(s0)
 17c:	00178793          	addi	a5,a5,1
 180:	fef42423          	sw	a5,-24(s0)
 184:	fe842703          	lw	a4,-24(s0)
 188:	00300793          	li	a5,3
 18c:	f4e7d8e3          	bge	a5,a4,dc <_ZL12matmul2x2_swPA4_KhS1_PA4_t+0x2c>
 190:	fec42783          	lw	a5,-20(s0)
 194:	00178793          	addi	a5,a5,1
 198:	fef42623          	sw	a5,-20(s0)
 19c:	fec42703          	lw	a4,-20(s0)
 1a0:	00300793          	li	a5,3
 1a4:	f2e7d8e3          	bge	a5,a4,d4 <_ZL12matmul2x2_swPA4_KhS1_PA4_t+0x24>
 1a8:	00000013          	nop
 1ac:	00000013          	nop
 1b0:	02c12083          	lw	ra,44(sp)
 1b4:	02812403          	lw	s0,40(sp)
 1b8:	03010113          	addi	sp,sp,48
 1bc:	00008067          	ret

000001c0 <_ZL16verify_sa_resultPA4_KtPS_>:
 1c0:	fd010113          	addi	sp,sp,-48
 1c4:	02112623          	sw	ra,44(sp)
 1c8:	02812423          	sw	s0,40(sp)
 1cc:	03010413          	addi	s0,sp,48
 1d0:	fca42e23          	sw	a0,-36(s0)
 1d4:	fcb42c23          	sw	a1,-40(s0)
 1d8:	fe042623          	sw	zero,-20(s0)
 1dc:	0b80006f          	j	294 <_ZL16verify_sa_resultPA4_KtPS_+0xd4>
 1e0:	fe042423          	sw	zero,-24(s0)
 1e4:	0980006f          	j	27c <_ZL16verify_sa_resultPA4_KtPS_+0xbc>
 1e8:	fec42783          	lw	a5,-20(s0)
 1ec:	00379793          	slli	a5,a5,0x3
 1f0:	fdc42703          	lw	a4,-36(s0)
 1f4:	00f70733          	add	a4,a4,a5
 1f8:	fe842783          	lw	a5,-24(s0)
 1fc:	00179793          	slli	a5,a5,0x1
 200:	00f707b3          	add	a5,a4,a5
 204:	0007d783          	lhu	a5,0(a5)
 208:	fef41323          	sh	a5,-26(s0)
 20c:	fec42783          	lw	a5,-20(s0)
 210:	00279713          	slli	a4,a5,0x2
 214:	fe842783          	lw	a5,-24(s0)
 218:	00f707b3          	add	a5,a4,a5
 21c:	00179793          	slli	a5,a5,0x1
 220:	fd842703          	lw	a4,-40(s0)
 224:	00f707b3          	add	a5,a4,a5
 228:	0007d783          	lhu	a5,0(a5)
 22c:	fef41223          	sh	a5,-28(s0)
 230:	fe645703          	lhu	a4,-26(s0)
 234:	fe445783          	lhu	a5,-28(s0)
 238:	02f70c63          	beq	a4,a5,270 <_ZL16verify_sa_resultPA4_KtPS_+0xb0>
 23c:	fec42783          	lw	a5,-20(s0)
 240:	00179713          	slli	a4,a5,0x1
 244:	fe842783          	lw	a5,-24(s0)
 248:	00f707b3          	add	a5,a4,a5
 24c:	00078713          	mv	a4,a5
 250:	dead07b7          	lui	a5,0xdead0
 254:	00f767b3          	or	a5,a4,a5
 258:	fef42023          	sw	a5,-32(s0)
 25c:	100017b7          	lui	a5,0x10001
 260:	fe042703          	lw	a4,-32(s0)
 264:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 268:	00000793          	li	a5,0
 26c:	0380006f          	j	2a4 <_ZL16verify_sa_resultPA4_KtPS_+0xe4>
 270:	fe842783          	lw	a5,-24(s0)
 274:	00178793          	addi	a5,a5,1
 278:	fef42423          	sw	a5,-24(s0)
 27c:	fe842703          	lw	a4,-24(s0)
 280:	00300793          	li	a5,3
 284:	f6e7d2e3          	bge	a5,a4,1e8 <_ZL16verify_sa_resultPA4_KtPS_+0x28>
 288:	fec42783          	lw	a5,-20(s0)
 28c:	00178793          	addi	a5,a5,1
 290:	fef42623          	sw	a5,-20(s0)
 294:	fec42703          	lw	a4,-20(s0)
 298:	00300793          	li	a5,3
 29c:	f4e7d2e3          	bge	a5,a4,1e0 <_ZL16verify_sa_resultPA4_KtPS_+0x20>
 2a0:	00100793          	li	a5,1
 2a4:	00078513          	mv	a0,a5
 2a8:	02c12083          	lw	ra,44(sp)
 2ac:	02812403          	lw	s0,40(sp)
 2b0:	03010113          	addi	sp,sp,48
 2b4:	00008067          	ret

000002b8 <_ZZ3runENKUlvE_clEv>:
 2b8:	fd010113          	addi	sp,sp,-48
 2bc:	02112623          	sw	ra,44(sp)
 2c0:	02812423          	sw	s0,40(sp)
 2c4:	03010413          	addi	s0,sp,48
 2c8:	fca42e23          	sw	a0,-36(s0)
 2cc:	7c8027f3          	csrr	a5,0x7c8
 2d0:	fef42623          	sw	a5,-20(s0)
 2d4:	fec42783          	lw	a5,-20(s0)
 2d8:	00078513          	mv	a0,a5
 2dc:	02c12083          	lw	ra,44(sp)
 2e0:	02812403          	lw	s0,40(sp)
 2e4:	03010113          	addi	sp,sp,48
 2e8:	00008067          	ret

000002ec <run>:
 2ec:	f9010113          	addi	sp,sp,-112
 2f0:	06112623          	sw	ra,108(sp)
 2f4:	06812423          	sw	s0,104(sp)
 2f8:	07010413          	addi	s0,sp,112
 2fc:	000207b7          	lui	a5,0x20
 300:	7d079073          	csrw	0x7d0,a5
 304:	000217b7          	lui	a5,0x21
 308:	7d479073          	csrw	0x7d4,a5
 30c:	000227b7          	lui	a5,0x22
 310:	7d879073          	csrw	0x7d8,a5
 314:	52000793          	li	a5,1312
 318:	fef42023          	sw	a5,-32(s0)
 31c:	53000793          	li	a5,1328
 320:	fcf42e23          	sw	a5,-36(s0)
 324:	52000793          	li	a5,1312
 328:	7d079073          	csrw	0x7d0,a5
 32c:	53000793          	li	a5,1328
 330:	7d479073          	csrw	0x7d4,a5
 334:	100017b7          	lui	a5,0x10001
 338:	0000c737          	lui	a4,0xc
 33c:	b0170713          	addi	a4,a4,-1279 # bb01 <__bss_end+0xb5bd>
 340:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 344:	fb840793          	addi	a5,s0,-72
 348:	00078613          	mv	a2,a5
 34c:	53000593          	li	a1,1328
 350:	52000513          	li	a0,1312
 354:	d5dff0ef          	jal	b0 <_ZL12matmul2x2_swPA4_KhS1_PA4_t>
 358:	100017b7          	lui	a5,0x10001
 35c:	0000c737          	lui	a4,0xc
 360:	b0270713          	addi	a4,a4,-1278 # bb02 <__bss_end+0xb5be>
 364:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 368:	fe042623          	sw	zero,-20(s0)
 36c:	0580006f          	j	3c4 <run+0xd8>
 370:	fe042423          	sw	zero,-24(s0)
 374:	0380006f          	j	3ac <run+0xc0>
 378:	fec42783          	lw	a5,-20(s0)
 37c:	00279713          	slli	a4,a5,0x2
 380:	fe842783          	lw	a5,-24(s0)
 384:	00f70733          	add	a4,a4,a5
 388:	fb840793          	addi	a5,s0,-72
 38c:	00171713          	slli	a4,a4,0x1
 390:	00f707b3          	add	a5,a4,a5
 394:	0007d703          	lhu	a4,0(a5)
 398:	100017b7          	lui	a5,0x10001
 39c:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 3a0:	fe842783          	lw	a5,-24(s0)
 3a4:	00178793          	addi	a5,a5,1
 3a8:	fef42423          	sw	a5,-24(s0)
 3ac:	fe842703          	lw	a4,-24(s0)
 3b0:	00300793          	li	a5,3
 3b4:	fce7f2e3          	bgeu	a5,a4,378 <run+0x8c>
 3b8:	fec42783          	lw	a5,-20(s0)
 3bc:	00178793          	addi	a5,a5,1
 3c0:	fef42623          	sw	a5,-20(s0)
 3c4:	fec42703          	lw	a4,-20(s0)
 3c8:	00300793          	li	a5,3
 3cc:	fae7f2e3          	bgeu	a5,a4,370 <run+0x84>
 3d0:	00200793          	li	a5,2
 3d4:	7c079073          	csrw	0x7c0,a5
 3d8:	00000793          	li	a5,0
 3dc:	7c079073          	csrw	0x7c0,a5
 3e0:	00100793          	li	a5,1
 3e4:	7c479073          	csrw	0x7c4,a5
 3e8:	100017b7          	lui	a5,0x10001
 3ec:	0000b737          	lui	a4,0xb
 3f0:	a0170713          	addi	a4,a4,-1535 # aa01 <__bss_end+0xa4bd>
 3f4:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 3f8:	00100793          	li	a5,1
 3fc:	7c079073          	csrw	0x7c0,a5
 400:	00000793          	li	a5,0
 404:	7c079073          	csrw	0x7c0,a5
 408:	0080006f          	j	410 <run+0x124>
 40c:	00000013          	nop
 410:	fd840793          	addi	a5,s0,-40
 414:	00078513          	mv	a0,a5
 418:	ea1ff0ef          	jal	2b8 <_ZZ3runENKUlvE_clEv>
 41c:	00050793          	mv	a5,a0
 420:	0017f793          	andi	a5,a5,1
 424:	0017f793          	andi	a5,a5,1
 428:	0017c793          	xori	a5,a5,1
 42c:	0ff7f793          	zext.b	a5,a5
 430:	fc079ee3          	bnez	a5,40c <run+0x120>
 434:	100017b7          	lui	a5,0x10001
 438:	0000b737          	lui	a4,0xb
 43c:	a0270713          	addi	a4,a4,-1534 # aa02 <__bss_end+0xa4be>
 440:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 444:	f9840793          	addi	a5,s0,-104
 448:	00078513          	mv	a0,a5
 44c:	bd9ff0ef          	jal	24 <_ZL21sa_read_result_matrixPt>
 450:	100017b7          	lui	a5,0x10001
 454:	0000f737          	lui	a4,0xf
 458:	e3370713          	addi	a4,a4,-461 # ee33 <__bss_end+0xe8ef>
 45c:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 460:	fe042223          	sw	zero,-28(s0)
 464:	02c0006f          	j	490 <run+0x1a4>
 468:	fe442703          	lw	a4,-28(s0)
 46c:	f9840793          	addi	a5,s0,-104
 470:	00171713          	slli	a4,a4,0x1
 474:	00f707b3          	add	a5,a4,a5
 478:	0007d703          	lhu	a4,0(a5)
 47c:	100017b7          	lui	a5,0x10001
 480:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 484:	fe442783          	lw	a5,-28(s0)
 488:	00178793          	addi	a5,a5,1
 48c:	fef42223          	sw	a5,-28(s0)
 490:	fe442703          	lw	a4,-28(s0)
 494:	00f00793          	li	a5,15
 498:	fce7f8e3          	bgeu	a5,a4,468 <run+0x17c>
 49c:	100017b7          	lui	a5,0x10001
 4a0:	0000f737          	lui	a4,0xf
 4a4:	e4470713          	addi	a4,a4,-444 # ee44 <__bss_end+0xe900>
 4a8:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 4ac:	f9840713          	addi	a4,s0,-104
 4b0:	fb840793          	addi	a5,s0,-72
 4b4:	00070593          	mv	a1,a4
 4b8:	00078513          	mv	a0,a5
 4bc:	d05ff0ef          	jal	1c0 <_ZL16verify_sa_resultPA4_KtPS_>
 4c0:	00050793          	mv	a5,a0
 4c4:	fcf40da3          	sb	a5,-37(s0)
 4c8:	fdb44783          	lbu	a5,-37(s0)
 4cc:	02078463          	beqz	a5,4f4 <run+0x208>
 4d0:	100017b7          	lui	a5,0x10001
 4d4:	0000f737          	lui	a4,0xf
 4d8:	e0170713          	addi	a4,a4,-511 # ee01 <__bss_end+0xe8bd>
 4dc:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 4e0:	100017b7          	lui	a5,0x10001
 4e4:	0000c737          	lui	a4,0xc
 4e8:	eef70713          	addi	a4,a4,-273 # beef <__bss_end+0xb9ab>
 4ec:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 4f0:	0280006f          	j	518 <run+0x22c>
 4f4:	100017b7          	lui	a5,0x10001
 4f8:	0000f737          	lui	a4,0xf
 4fc:	e0170713          	addi	a4,a4,-511 # ee01 <__bss_end+0xe8bd>
 500:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 504:	100017b7          	lui	a5,0x10001
 508:	0000e737          	lui	a4,0xe
 50c:	ead70713          	addi	a4,a4,-339 # dead <__bss_end+0xd969>
 510:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 514:	00000013          	nop
 518:	00000013          	nop
 51c:	ffdff06f          	j	518 <run+0x22c>

00000520 <_ZL5A_mat>:
 520:	03010201 02010303 02010103 02010301     ................

00000530 <_ZL5B_mat>:
 530:	02010201 02010203 01030103 02010301     ................
