
cachewb_test1.elf:     ファイル形式 elf32-littleriscv


セクション .text の逆アセンブル:

00000000 <_start>:
   0:	00010117          	auipc	sp,0x10
   4:	00010113          	mv	sp,sp
   8:	26c00513          	li	a0,620
   c:	27000593          	li	a1,624
  10:	00b50863          	beq	a0,a1,20 <_start+0x20>
  14:	00052023          	sw	zero,0(a0)
  18:	00450513          	addi	a0,a0,4
  1c:	ff5ff06f          	j	10 <_start+0x10>
  20:	0800006f          	j	a0 <run>

00000024 <_ZL17dcache_ctrl_writem>:
  24:	fe010113          	addi	sp,sp,-32 # ffe0 <__bss_end+0xfd70>
  28:	00112e23          	sw	ra,28(sp)
  2c:	00812c23          	sw	s0,24(sp)
  30:	02010413          	addi	s0,sp,32
  34:	fea42623          	sw	a0,-20(s0)
  38:	fec42783          	lw	a5,-20(s0)
  3c:	7f079073          	csrw	0x7f0,a5
  40:	00000013          	nop
  44:	01c12083          	lw	ra,28(sp)
  48:	01812403          	lw	s0,24(sp)
  4c:	02010113          	addi	sp,sp,32
  50:	00008067          	ret

00000054 <_ZL10tiny_delayj>:
  54:	fe010113          	addi	sp,sp,-32
  58:	00112e23          	sw	ra,28(sp)
  5c:	00812c23          	sw	s0,24(sp)
  60:	02010413          	addi	s0,sp,32
  64:	fea42623          	sw	a0,-20(s0)
  68:	0080006f          	j	70 <_ZL10tiny_delayj+0x1c>
  6c:	00000013          	nop
  70:	fec42783          	lw	a5,-20(s0)
  74:	fff78713          	addi	a4,a5,-1
  78:	fee42623          	sw	a4,-20(s0)
  7c:	00f037b3          	snez	a5,a5
  80:	0ff7f793          	zext.b	a5,a5
  84:	fe0794e3          	bnez	a5,6c <_ZL10tiny_delayj+0x18>
  88:	00000013          	nop
  8c:	00000013          	nop
  90:	01c12083          	lw	ra,28(sp)
  94:	01812403          	lw	s0,24(sp)
  98:	02010113          	addi	sp,sp,32
  9c:	00008067          	ret

000000a0 <run>:
  a0:	fc010113          	addi	sp,sp,-64
  a4:	02112e23          	sw	ra,60(sp)
  a8:	02812c23          	sw	s0,56(sp)
  ac:	04010413          	addi	s0,sp,64
  b0:	004107b7          	lui	a5,0x410
  b4:	fcf42e23          	sw	a5,-36(s0)
  b8:	01000793          	li	a5,16
  bc:	fcf42c23          	sw	a5,-40(s0)
  c0:	00200793          	li	a5,2
  c4:	fcf42a23          	sw	a5,-44(s0)
  c8:	004107b7          	lui	a5,0x410
  cc:	fcf42823          	sw	a5,-48(s0)
  d0:	fe042623          	sw	zero,-20(s0)
  d4:	fe042423          	sw	zero,-24(s0)
  d8:	1540006f          	j	22c <run+0x18c>
  dc:	fe042223          	sw	zero,-28(s0)
  e0:	0500006f          	j	130 <run+0x90>
  e4:	fe842783          	lw	a5,-24(s0)
  e8:	01079713          	slli	a4,a5,0x10
  ec:	fe442783          	lw	a5,-28(s0)
  f0:	00f74733          	xor	a4,a4,a5
  f4:	fe442783          	lw	a5,-28(s0)
  f8:	00879793          	slli	a5,a5,0x8
  fc:	00f74733          	xor	a4,a4,a5
 100:	a5a507b7          	lui	a5,0xa5a50
 104:	00f747b3          	xor	a5,a4,a5
 108:	fcf42223          	sw	a5,-60(s0)
 10c:	fe442783          	lw	a5,-28(s0)
 110:	00279793          	slli	a5,a5,0x2
 114:	fd042703          	lw	a4,-48(s0)
 118:	00f707b3          	add	a5,a4,a5
 11c:	fc442703          	lw	a4,-60(s0)
 120:	00e7a023          	sw	a4,0(a5) # a5a50000 <_stack_top+0xa5a40000>
 124:	fe442783          	lw	a5,-28(s0)
 128:	00178793          	addi	a5,a5,1
 12c:	fef42223          	sw	a5,-28(s0)
 130:	fe442703          	lw	a4,-28(s0)
 134:	00f00793          	li	a5,15
 138:	fae7f6e3          	bgeu	a5,a4,e4 <run+0x44>
 13c:	100017b7          	lui	a5,0x10001
 140:	0a100713          	li	a4,161
 144:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 148:	00200513          	li	a0,2
 14c:	ed9ff0ef          	jal	24 <_ZL17dcache_ctrl_writem>
 150:	00000513          	li	a0,0
 154:	ed1ff0ef          	jal	24 <_ZL17dcache_ctrl_writem>
 158:	100017b7          	lui	a5,0x10001
 15c:	0a200713          	li	a4,162
 160:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 164:	3e800513          	li	a0,1000
 168:	eedff0ef          	jal	54 <_ZL10tiny_delayj>
 16c:	00100513          	li	a0,1
 170:	eb5ff0ef          	jal	24 <_ZL17dcache_ctrl_writem>
 174:	00000513          	li	a0,0
 178:	eadff0ef          	jal	24 <_ZL17dcache_ctrl_writem>
 17c:	100017b7          	lui	a5,0x10001
 180:	0a300713          	li	a4,163
 184:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 188:	3e800513          	li	a0,1000
 18c:	ec9ff0ef          	jal	54 <_ZL10tiny_delayj>
 190:	fe042023          	sw	zero,-32(s0)
 194:	0680006f          	j	1fc <run+0x15c>
 198:	fe842783          	lw	a5,-24(s0)
 19c:	01079713          	slli	a4,a5,0x10
 1a0:	fe042783          	lw	a5,-32(s0)
 1a4:	00f74733          	xor	a4,a4,a5
 1a8:	fe042783          	lw	a5,-32(s0)
 1ac:	00879793          	slli	a5,a5,0x8
 1b0:	00f74733          	xor	a4,a4,a5
 1b4:	a5a507b7          	lui	a5,0xa5a50
 1b8:	00f747b3          	xor	a5,a4,a5
 1bc:	fcf42623          	sw	a5,-52(s0)
 1c0:	fe042783          	lw	a5,-32(s0)
 1c4:	00279793          	slli	a5,a5,0x2
 1c8:	fd042703          	lw	a4,-48(s0)
 1cc:	00f707b3          	add	a5,a4,a5
 1d0:	0007a783          	lw	a5,0(a5) # a5a50000 <_stack_top+0xa5a40000>
 1d4:	fcf42423          	sw	a5,-56(s0)
 1d8:	fc842703          	lw	a4,-56(s0)
 1dc:	fcc42783          	lw	a5,-52(s0)
 1e0:	00f70863          	beq	a4,a5,1f0 <run+0x150>
 1e4:	fec42783          	lw	a5,-20(s0)
 1e8:	00178793          	addi	a5,a5,1
 1ec:	fef42623          	sw	a5,-20(s0)
 1f0:	fe042783          	lw	a5,-32(s0)
 1f4:	00178793          	addi	a5,a5,1
 1f8:	fef42023          	sw	a5,-32(s0)
 1fc:	fe042703          	lw	a4,-32(s0)
 200:	00f00793          	li	a5,15
 204:	f8e7fae3          	bgeu	a5,a4,198 <run+0xf8>
 208:	100017b7          	lui	a5,0x10001
 20c:	0a400713          	li	a4,164
 210:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 214:	100017b7          	lui	a5,0x10001
 218:	fec42703          	lw	a4,-20(s0)
 21c:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 220:	fe842783          	lw	a5,-24(s0)
 224:	00178793          	addi	a5,a5,1
 228:	fef42423          	sw	a5,-24(s0)
 22c:	fe842703          	lw	a4,-24(s0)
 230:	00100793          	li	a5,1
 234:	eae7f4e3          	bgeu	a5,a4,dc <run+0x3c>
 238:	fec42703          	lw	a4,-20(s0)
 23c:	26e02623          	sw	a4,620(zero) # 26c <result>
 240:	100017b7          	lui	a5,0x10001
 244:	0000f737          	lui	a4,0xf
 248:	e0170713          	addi	a4,a4,-511 # ee01 <__bss_end+0xeb91>
 24c:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 250:	100017b7          	lui	a5,0x10001
 254:	26c02703          	lw	a4,620(zero) # 26c <result>
 258:	00e7a023          	sw	a4,0(a5) # 10001000 <_stack_top+0xfff1000>
 25c:	00000013          	nop
 260:	ffdff06f          	j	25c <run+0x1bc>
