
divmod_test1.elf:     ファイル形式 elf32-littleriscv


セクション .text の逆アセンブル:

00000000 <_start>:
   0:	00010117          	auipc	sp,0x10
   4:	00010113          	mv	sp,sp
   8:	06000513          	li	a0,96
   c:	06400593          	li	a1,100
  10:	00b50863          	beq	a0,a1,20 <_start+0x20>
  14:	00052023          	sw	zero,0(a0)
  18:	00450513          	addi	a0,a0,4
  1c:	ff5ff06f          	j	10 <_start+0x10>
  20:	0040006f          	j	24 <run>

00000024 <run>:
  24:	100017b7          	lui	a5,0x10001
  28:	00e00713          	li	a4,14
  2c:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
  30:	000016b7          	lui	a3,0x1
  34:	00200713          	li	a4,2
  38:	00e7a023          	sw	a4,0(a5)
  3c:	e0268693          	addi	a3,a3,-510 # e02 <__bss_end+0xd9e>
  40:	0000f737          	lui	a4,0xf
  44:	06d02023          	sw	a3,96(zero) # 60 <result>
  48:	e0170713          	addi	a4,a4,-511 # ee01 <__bss_end+0xed9d>
  4c:	00e7a023          	sw	a4,0(a5)
  50:	06002703          	lw	a4,96(zero) # 60 <result>
  54:	00e7a023          	sw	a4,0(a5)
  58:	0000006f          	j	58 <run+0x34>
