
./build/kernel.elf:     ファイル形式 elf32-littleriscv


セクション .text の逆アセンブル:

00200000 <boot>:


__attribute__((section(".text.boot")))
__attribute__((naked))
void boot(void) {
    __asm__ __volatile__(
  200000:	00256537          	lui	a0,0x256
  200004:	b1450513          	addi	a0,a0,-1260 # 255b14 <__kernel_stack_top>
  200008:	00050113          	mv	sp,a0
  20000c:	5000106f          	j	20150c <kernel_main>

00200010 <putchar>:
void putchar(char ch) {
  200010:	100005b7          	lui	a1,0x10000

static inline void mmio_w32(uint32_t addr, uint32_t v) {
    *(volatile uint32_t*)addr = v;
}
static inline uint32_t mmio_r32(uint32_t addr) {
    return *(volatile uint32_t*)addr;
  200014:	0085a603          	lw	a2,8(a1) # 10000008 <__free_ram_end+0xfcaa008>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  200018:	00167613          	andi	a2,a2,1
  20001c:	00060663          	beqz	a2,200028 <putchar+0x18>
        __asm__ __volatile__("nop");
  200020:	00000013          	nop
  200024:	ff1ff06f          	j	200014 <putchar+0x4>
    *(volatile uint32_t*)addr = v;
  200028:	00a5a023          	sw	a0,0(a1)
}
  20002c:	00008067          	ret

00200030 <uart_putchar>:
void uart_putchar(char ch) {
  200030:	100005b7          	lui	a1,0x10000
    return *(volatile uint32_t*)addr;
  200034:	0085a603          	lw	a2,8(a1) # 10000008 <__free_ram_end+0xfcaa008>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  200038:	00167613          	andi	a2,a2,1
  20003c:	00060663          	beqz	a2,200048 <uart_putchar+0x18>
        __asm__ __volatile__("nop");
  200040:	00000013          	nop
  200044:	ff1ff06f          	j	200034 <uart_putchar+0x4>
    *(volatile uint32_t*)addr = v;
  200048:	00a5a023          	sw	a0,0(a1)
}
  20004c:	00008067          	ret

00200050 <uart_getchar>:
long uart_getchar(void) {
  200050:	10000537          	lui	a0,0x10000
    return *(volatile uint32_t*)addr;
  200054:	00852583          	lw	a1,8(a0) # 10000008 <__free_ram_end+0xfcaa008>
    while ((mmio_r32(UART_MMIO_BASE + UART_ST) & ST_RX_AVAIL) == 0) {
  200058:	0025f593          	andi	a1,a1,2
  20005c:	00059663          	bnez	a1,200068 <uart_getchar+0x18>
        __asm__ __volatile__("nop");
  200060:	00000013          	nop
  200064:	ff1ff06f          	j	200054 <uart_getchar+0x4>
  200068:	00452503          	lw	a0,4(a0)
    return (long)(mmio_r32(UART_MMIO_BASE + UART_RX) & 0xFF);
  20006c:	0ff57513          	zext.b	a0,a0
  200070:	00008067          	ret

00200074 <alloc_pages>:
paddr_t alloc_pages(uint32_t n) {
  200074:	ff010113          	addi	sp,sp,-16
  200078:	00112623          	sw	ra,12(sp)
  20007c:	00812423          	sw	s0,8(sp)
    if (!initialized) {
  200080:	002255b7          	lui	a1,0x225
  200084:	7085c603          	lbu	a2,1800(a1) # 225708 <alloc_pages.initialized>
  200088:	00060863          	beqz	a2,200098 <alloc_pages+0x24>
    paddr_t paddr = next_paddr;
  20008c:	002255b7          	lui	a1,0x225
  200090:	70c5a403          	lw	s0,1804(a1) # 22570c <alloc_pages.next_paddr>
  200094:	0140006f          	j	2000a8 <alloc_pages+0x34>
  200098:	00100613          	li	a2,1
        initialized = 1;
  20009c:	70c58423          	sb	a2,1800(a1)
  2000a0:	002565b7          	lui	a1,0x256
  2000a4:	00058413          	mv	s0,a1
    next_paddr += n * PAGE_SIZE;
  2000a8:	00c51613          	slli	a2,a0,0xc
  2000ac:	00c40533          	add	a0,s0,a2
  2000b0:	002255b7          	lui	a1,0x225
    if (next_paddr > (paddr_t)__free_ram_end)
  2000b4:	003566b7          	lui	a3,0x356
  2000b8:	00068693          	mv	a3,a3
    next_paddr += n * PAGE_SIZE;
  2000bc:	70a5a623          	sw	a0,1804(a1) # 22570c <alloc_pages.next_paddr>
    if (next_paddr > (paddr_t)__free_ram_end)
  2000c0:	02a6f263          	bgeu	a3,a0,2000e4 <alloc_pages+0x70>
        PANIC("out of memory");
  2000c4:	00203537          	lui	a0,0x203
  2000c8:	11550513          	addi	a0,a0,277 # 203115 <$d.4>
  2000cc:	002035b7          	lui	a1,0x203
  2000d0:	d2658593          	addi	a1,a1,-730 # 202d26 <$d.1+0x14>
  2000d4:	08900613          	li	a2,137
  2000d8:	00001097          	auipc	ra,0x1
  2000dc:	6d8080e7          	jalr	1752(ra) # 2017b0 <s_printf>
  2000e0:	0000006f          	j	2000e0 <alloc_pages+0x6c>
    memset((void *) paddr, 0, n * PAGE_SIZE);
  2000e4:	00040513          	mv	a0,s0
  2000e8:	00000593          	li	a1,0
  2000ec:	00001097          	auipc	ra,0x1
  2000f0:	5a8080e7          	jalr	1448(ra) # 201694 <memset>
    return paddr;
  2000f4:	00040513          	mv	a0,s0
  2000f8:	00c12083          	lw	ra,12(sp)
  2000fc:	00812403          	lw	s0,8(sp)
  200100:	01010113          	addi	sp,sp,16
  200104:	00008067          	ret

00200108 <user_entry>:
__attribute__((naked)) void user_entry(void) {
  200108:	00500537          	lui	a0,0x500
  20010c:	004005b7          	lui	a1,0x400
    __asm__ __volatile__(
  200110:	00050113          	mv	sp,a0
  200114:	14159073          	csrw	sepc,a1
  200118:	02000293          	li	t0,32
  20011c:	10029073          	csrw	sstatus,t0
  200120:	10200073          	sret

00200124 <kernel_entry>:
    __asm__ __volatile__(
  200124:	14011073          	csrw	sscratch,sp
  200128:	f8410113          	addi	sp,sp,-124
  20012c:	00000013          	nop
  200130:	00112023          	sw	ra,0(sp)
  200134:	00312223          	sw	gp,4(sp)
  200138:	00412423          	sw	tp,8(sp)
  20013c:	00512623          	sw	t0,12(sp)
  200140:	00612823          	sw	t1,16(sp)
  200144:	00712a23          	sw	t2,20(sp)
  200148:	01c12c23          	sw	t3,24(sp)
  20014c:	01d12e23          	sw	t4,28(sp)
  200150:	03e12023          	sw	t5,32(sp)
  200154:	03f12223          	sw	t6,36(sp)
  200158:	02a12423          	sw	a0,40(sp)
  20015c:	02b12623          	sw	a1,44(sp)
  200160:	02c12823          	sw	a2,48(sp)
  200164:	02d12a23          	sw	a3,52(sp)
  200168:	02e12c23          	sw	a4,56(sp)
  20016c:	02f12e23          	sw	a5,60(sp)
  200170:	05012023          	sw	a6,64(sp)
  200174:	05112223          	sw	a7,68(sp)
  200178:	04812423          	sw	s0,72(sp)
  20017c:	04912623          	sw	s1,76(sp)
  200180:	05212823          	sw	s2,80(sp)
  200184:	05312a23          	sw	s3,84(sp)
  200188:	05412c23          	sw	s4,88(sp)
  20018c:	05512e23          	sw	s5,92(sp)
  200190:	07612023          	sw	s6,96(sp)
  200194:	07712223          	sw	s7,100(sp)
  200198:	07812423          	sw	s8,104(sp)
  20019c:	07912623          	sw	s9,108(sp)
  2001a0:	07a12823          	sw	s10,112(sp)
  2001a4:	07b12a23          	sw	s11,116(sp)
  2001a8:	14002573          	csrr	a0,sscratch
  2001ac:	06a12c23          	sw	a0,120(sp)
  2001b0:	00010513          	mv	a0,sp
  2001b4:	00001097          	auipc	ra,0x1
  2001b8:	fac080e7          	jalr	-84(ra) # 201160 <handle_trap>
  2001bc:	00012083          	lw	ra,0(sp)
  2001c0:	00412183          	lw	gp,4(sp)
  2001c4:	00812203          	lw	tp,8(sp)
  2001c8:	00c12283          	lw	t0,12(sp)
  2001cc:	01012303          	lw	t1,16(sp)
  2001d0:	01412383          	lw	t2,20(sp)
  2001d4:	01812e03          	lw	t3,24(sp)
  2001d8:	01c12e83          	lw	t4,28(sp)
  2001dc:	02012f03          	lw	t5,32(sp)
  2001e0:	02412f83          	lw	t6,36(sp)
  2001e4:	02812503          	lw	a0,40(sp)
  2001e8:	02c12583          	lw	a1,44(sp)
  2001ec:	03012603          	lw	a2,48(sp)
  2001f0:	03412683          	lw	a3,52(sp)
  2001f4:	03812703          	lw	a4,56(sp)
  2001f8:	03c12783          	lw	a5,60(sp)
  2001fc:	04012803          	lw	a6,64(sp)
  200200:	04412883          	lw	a7,68(sp)
  200204:	04812403          	lw	s0,72(sp)
  200208:	04c12483          	lw	s1,76(sp)
  20020c:	05012903          	lw	s2,80(sp)
  200210:	05412983          	lw	s3,84(sp)
  200214:	05812a03          	lw	s4,88(sp)
  200218:	05c12a83          	lw	s5,92(sp)
  20021c:	06012b03          	lw	s6,96(sp)
  200220:	06412b83          	lw	s7,100(sp)
  200224:	06812c03          	lw	s8,104(sp)
  200228:	06c12c83          	lw	s9,108(sp)
  20022c:	07012d03          	lw	s10,112(sp)
  200230:	07412d83          	lw	s11,116(sp)
  200234:	07812103          	lw	sp,120(sp)
  200238:	10200073          	sret

0020023c <switch_context>:
    __asm__ __volatile__(
  20023c:	fcc10113          	addi	sp,sp,-52
  200240:	00112023          	sw	ra,0(sp)
  200244:	00812223          	sw	s0,4(sp)
  200248:	00912423          	sw	s1,8(sp)
  20024c:	01212623          	sw	s2,12(sp)
  200250:	01312823          	sw	s3,16(sp)
  200254:	01412a23          	sw	s4,20(sp)
  200258:	01512c23          	sw	s5,24(sp)
  20025c:	01612e23          	sw	s6,28(sp)
  200260:	03712023          	sw	s7,32(sp)
  200264:	03812223          	sw	s8,36(sp)
  200268:	03912423          	sw	s9,40(sp)
  20026c:	03a12623          	sw	s10,44(sp)
  200270:	03b12823          	sw	s11,48(sp)
  200274:	00252023          	sw	sp,0(a0) # 500000 <__free_ram_end+0x1aa000>
  200278:	0005a103          	lw	sp,0(a1) # 400000 <__free_ram_end+0xaa000>
  20027c:	00012083          	lw	ra,0(sp)
  200280:	00412403          	lw	s0,4(sp)
  200284:	00812483          	lw	s1,8(sp)
  200288:	00c12903          	lw	s2,12(sp)
  20028c:	01012983          	lw	s3,16(sp)
  200290:	01412a03          	lw	s4,20(sp)
  200294:	01812a83          	lw	s5,24(sp)
  200298:	01c12b03          	lw	s6,28(sp)
  20029c:	02012b83          	lw	s7,32(sp)
  2002a0:	02412c03          	lw	s8,36(sp)
  2002a4:	02812c83          	lw	s9,40(sp)
  2002a8:	02c12d03          	lw	s10,44(sp)
  2002ac:	03012d83          	lw	s11,48(sp)
  2002b0:	03410113          	addi	sp,sp,52
  2002b4:	00008067          	ret

002002b8 <map_page>:
void map_page(uint32_t *table1, uint32_t vaddr, paddr_t paddr, uint32_t flags) {
  2002b8:	fe010113          	addi	sp,sp,-32
  2002bc:	00112e23          	sw	ra,28(sp)
  2002c0:	00812c23          	sw	s0,24(sp)
  2002c4:	00912a23          	sw	s1,20(sp)
  2002c8:	01212823          	sw	s2,16(sp)
  2002cc:	01312623          	sw	s3,12(sp)
  2002d0:	01412423          	sw	s4,8(sp)
  2002d4:	00058413          	mv	s0,a1
    if (!is_aligned(vaddr, PAGE_SIZE))
  2002d8:	01459593          	slli	a1,a1,0x14
  2002dc:	02058463          	beqz	a1,200304 <map_page+0x4c>
        PANIC("unaligned vaddr %x", vaddr);
  2002e0:	00203537          	lui	a0,0x203
  2002e4:	2e850513          	addi	a0,a0,744 # 2032e8 <$d.4+0x1d3>
  2002e8:	002035b7          	lui	a1,0x203
  2002ec:	d2658593          	addi	a1,a1,-730 # 202d26 <$d.1+0x14>
  2002f0:	13e00613          	li	a2,318
  2002f4:	00040693          	mv	a3,s0
  2002f8:	00001097          	auipc	ra,0x1
  2002fc:	4b8080e7          	jalr	1208(ra) # 2017b0 <s_printf>
  200300:	0000006f          	j	200300 <map_page+0x48>
  200304:	000015b7          	lui	a1,0x1
  200308:	fff58593          	addi	a1,a1,-1 # fff <$d.3+0x879>
    if (!is_aligned(paddr, PAGE_SIZE))
  20030c:	00b675b3          	and	a1,a2,a1
  200310:	02058463          	beqz	a1,200338 <map_page+0x80>
        PANIC("unaligned paddr %x", paddr);
  200314:	00203537          	lui	a0,0x203
  200318:	19250513          	addi	a0,a0,402 # 203192 <$d.4+0x7d>
  20031c:	002035b7          	lui	a1,0x203
  200320:	d2658593          	addi	a1,a1,-730 # 202d26 <$d.1+0x14>
  200324:	00060693          	mv	a3,a2
  200328:	14100613          	li	a2,321
  20032c:	00001097          	auipc	ra,0x1
  200330:	484080e7          	jalr	1156(ra) # 2017b0 <s_printf>
  200334:	0000006f          	j	200334 <map_page+0x7c>
    if ((table1[vpn1] & PAGE_V) == 0) {
  200338:	01445593          	srli	a1,s0,0x14
  20033c:	ffc5f593          	andi	a1,a1,-4
  200340:	00b50933          	add	s2,a0,a1
  200344:	00092503          	lw	a0,0(s2)
  200348:	00157593          	andi	a1,a0,1
  20034c:	08059e63          	bnez	a1,2003e8 <map_page+0x130>
    if (!initialized) {
  200350:	00225537          	lui	a0,0x225
  200354:	70854583          	lbu	a1,1800(a0) # 225708 <alloc_pages.initialized>
  200358:	00058863          	beqz	a1,200368 <map_page+0xb0>
    paddr_t paddr = next_paddr;
  20035c:	00225537          	lui	a0,0x225
  200360:	70c52483          	lw	s1,1804(a0) # 22570c <alloc_pages.next_paddr>
  200364:	0140006f          	j	200378 <map_page+0xc0>
  200368:	00100593          	li	a1,1
        initialized = 1;
  20036c:	70b50423          	sb	a1,1800(a0)
  200370:	00256537          	lui	a0,0x256
  200374:	00050493          	mv	s1,a0
  200378:	00001537          	lui	a0,0x1
    next_paddr += n * PAGE_SIZE;
  20037c:	00a48533          	add	a0,s1,a0
  200380:	002255b7          	lui	a1,0x225
    if (next_paddr > (paddr_t)__free_ram_end)
  200384:	00356737          	lui	a4,0x356
  200388:	00070713          	mv	a4,a4
    next_paddr += n * PAGE_SIZE;
  20038c:	70a5a623          	sw	a0,1804(a1) # 22570c <alloc_pages.next_paddr>
    if (next_paddr > (paddr_t)__free_ram_end)
  200390:	02a77263          	bgeu	a4,a0,2003b4 <map_page+0xfc>
        PANIC("out of memory");
  200394:	00203537          	lui	a0,0x203
  200398:	11550513          	addi	a0,a0,277 # 203115 <$d.4>
  20039c:	002035b7          	lui	a1,0x203
  2003a0:	d2658593          	addi	a1,a1,-730 # 202d26 <$d.1+0x14>
  2003a4:	08900613          	li	a2,137
  2003a8:	00001097          	auipc	ra,0x1
  2003ac:	408080e7          	jalr	1032(ra) # 2017b0 <s_printf>
  2003b0:	0000006f          	j	2003b0 <map_page+0xf8>
  2003b4:	00060993          	mv	s3,a2
    memset((void *) paddr, 0, n * PAGE_SIZE);
  2003b8:	00001637          	lui	a2,0x1
  2003bc:	00048513          	mv	a0,s1
  2003c0:	00000593          	li	a1,0
  2003c4:	00068a13          	mv	s4,a3
  2003c8:	00001097          	auipc	ra,0x1
  2003cc:	2cc080e7          	jalr	716(ra) # 201694 <memset>
  2003d0:	000a0693          	mv	a3,s4
  2003d4:	00098613          	mv	a2,s3
        table1[vpn1] = ((pt_paddr / PAGE_SIZE) << 10) | PAGE_V;
  2003d8:	00c4d493          	srli	s1,s1,0xc
  2003dc:	00a49513          	slli	a0,s1,0xa
  2003e0:	00150513          	addi	a0,a0,1
  2003e4:	00a92023          	sw	a0,0(s2)
    uint32_t *table0 = (uint32_t *) ((table1[vpn1] >> 10) * PAGE_SIZE);
  2003e8:	00a55513          	srli	a0,a0,0xa
  2003ec:	00c51513          	slli	a0,a0,0xc
    table0[vpn0] = ((paddr / PAGE_SIZE) << 10) | flags | PAGE_V;
  2003f0:	00265613          	srli	a2,a2,0x2
  2003f4:	00d66633          	or	a2,a2,a3
  2003f8:	00166593          	ori	a1,a2,1
  2003fc:	00a45413          	srli	s0,s0,0xa
  200400:	00001637          	lui	a2,0x1
  200404:	ffc60613          	addi	a2,a2,-4 # ffc <$d.3+0x876>
  200408:	00c47633          	and	a2,s0,a2
  20040c:	00c56533          	or	a0,a0,a2
  200410:	00b52023          	sw	a1,0(a0)
  200414:	01c12083          	lw	ra,28(sp)
  200418:	01812403          	lw	s0,24(sp)
  20041c:	01412483          	lw	s1,20(sp)
  200420:	01012903          	lw	s2,16(sp)
  200424:	00c12983          	lw	s3,12(sp)
  200428:	00812a03          	lw	s4,8(sp)
}
  20042c:	02010113          	addi	sp,sp,32
  200430:	00008067          	ret

00200434 <idle_entry>:
        __asm__ volatile("nop");
  200434:	00000013          	nop
    while (1) {
  200438:	ffdff06f          	j	200434 <idle_entry>

0020043c <create_process>:
struct process *create_process(const void *image, size_t image_size) {
  20043c:	fc010113          	addi	sp,sp,-64
  200440:	02112e23          	sw	ra,60(sp)
  200444:	02812c23          	sw	s0,56(sp)
  200448:	02912a23          	sw	s1,52(sp)
  20044c:	03212823          	sw	s2,48(sp)
  200450:	03312623          	sw	s3,44(sp)
  200454:	03412423          	sw	s4,40(sp)
  200458:	03512223          	sw	s5,36(sp)
  20045c:	03612023          	sw	s6,32(sp)
  200460:	01712e23          	sw	s7,28(sp)
  200464:	01812c23          	sw	s8,24(sp)
  200468:	01912a23          	sw	s9,20(sp)
  20046c:	01a12823          	sw	s10,16(sp)
  200470:	01b12623          	sw	s11,12(sp)
        if (procs[i].state == PROC_UNUSED) {
  200474:	00225637          	lui	a2,0x225
  200478:	73060613          	addi	a2,a2,1840 # 225730 <procs>
  20047c:	00462683          	lw	a3,4(a2)
  200480:	00058b13          	mv	s6,a1
  200484:	00050a93          	mv	s5,a0
  200488:	0a068663          	beqz	a3,200534 <create_process+0xf8>
  20048c:	00002537          	lui	a0,0x2
  200490:	00a60533          	add	a0,a2,a0
  200494:	01452503          	lw	a0,20(a0) # 2014 <$d.6+0x30>
  200498:	0a050263          	beqz	a0,20053c <create_process+0x100>
  20049c:	00225537          	lui	a0,0x225
  2004a0:	73050513          	addi	a0,a0,1840 # 225730 <procs>
  2004a4:	000045b7          	lui	a1,0x4
  2004a8:	00b505b3          	add	a1,a0,a1
  2004ac:	0245a583          	lw	a1,36(a1) # 4024 <$d.4+0x18b7>
  2004b0:	08058a63          	beqz	a1,200544 <create_process+0x108>
  2004b4:	000065b7          	lui	a1,0x6
  2004b8:	00b50533          	add	a0,a0,a1
  2004bc:	03452503          	lw	a0,52(a0)
  2004c0:	08050663          	beqz	a0,20054c <create_process+0x110>
  2004c4:	00225537          	lui	a0,0x225
  2004c8:	73050513          	addi	a0,a0,1840 # 225730 <procs>
  2004cc:	000085b7          	lui	a1,0x8
  2004d0:	00b505b3          	add	a1,a0,a1
  2004d4:	0445a583          	lw	a1,68(a1) # 8044 <$d.4+0x58d7>
  2004d8:	06058e63          	beqz	a1,200554 <create_process+0x118>
  2004dc:	0000a5b7          	lui	a1,0xa
  2004e0:	00b50533          	add	a0,a0,a1
  2004e4:	05452503          	lw	a0,84(a0)
  2004e8:	06050a63          	beqz	a0,20055c <create_process+0x120>
  2004ec:	00225537          	lui	a0,0x225
  2004f0:	73050513          	addi	a0,a0,1840 # 225730 <procs>
  2004f4:	0000c5b7          	lui	a1,0xc
  2004f8:	00b505b3          	add	a1,a0,a1
  2004fc:	0645a583          	lw	a1,100(a1) # c064 <$d.4+0x98f7>
  200500:	06058263          	beqz	a1,200564 <create_process+0x128>
  200504:	0000e5b7          	lui	a1,0xe
  200508:	00b50533          	add	a0,a0,a1
  20050c:	07452503          	lw	a0,116(a0)
  200510:	04050e63          	beqz	a0,20056c <create_process+0x130>
    if (!proc) PANIC("no free process slots");
  200514:	00203537          	lui	a0,0x203
  200518:	32e50513          	addi	a0,a0,814 # 20332e <print_hex8.HEX+0x11>
  20051c:	002035b7          	lui	a1,0x203
  200520:	d2658593          	addi	a1,a1,-730 # 202d26 <$d.1+0x14>
  200524:	16400613          	li	a2,356
  200528:	00001097          	auipc	ra,0x1
  20052c:	288080e7          	jalr	648(ra) # 2017b0 <s_printf>
  200530:	0000006f          	j	200530 <create_process+0xf4>
  200534:	00000a13          	li	s4,0
  200538:	0380006f          	j	200570 <create_process+0x134>
  20053c:	00100a13          	li	s4,1
  200540:	0300006f          	j	200570 <create_process+0x134>
  200544:	00200a13          	li	s4,2
  200548:	0280006f          	j	200570 <create_process+0x134>
  20054c:	00300a13          	li	s4,3
  200550:	0200006f          	j	200570 <create_process+0x134>
  200554:	00400a13          	li	s4,4
  200558:	0180006f          	j	200570 <create_process+0x134>
  20055c:	00500a13          	li	s4,5
  200560:	0100006f          	j	200570 <create_process+0x134>
  200564:	00600a13          	li	s4,6
  200568:	0080006f          	j	200570 <create_process+0x134>
  20056c:	00700a13          	li	s4,7
    *--sp = 0;  // s11
  200570:	004a1513          	slli	a0,s4,0x4
  200574:	00da1593          	slli	a1,s4,0xd
  200578:	00a5ebb3          	or	s7,a1,a0
  20057c:	01760633          	add	a2,a2,s7
  200580:	00002537          	lui	a0,0x2
  200584:	00a605b3          	add	a1,a2,a0
  200588:	0005a623          	sw	zero,12(a1)
    *--sp = 0;  // s10
  20058c:	0005a423          	sw	zero,8(a1)
    *--sp = 0;  // s9
  200590:	0005a223          	sw	zero,4(a1)
    *--sp = 0;  // s8
  200594:	0005a023          	sw	zero,0(a1)
    *--sp = 0;  // s7
  200598:	fe05ae23          	sw	zero,-4(a1)
    *--sp = 0;  // s6
  20059c:	fe05ac23          	sw	zero,-8(a1)
    *--sp = 0;  // s5
  2005a0:	fe05aa23          	sw	zero,-12(a1)
    *--sp = 0;  // s4
  2005a4:	fe05a823          	sw	zero,-16(a1)
    *--sp = 0;  // s3
  2005a8:	fe05a623          	sw	zero,-20(a1)
    *--sp = 0;  // s2
  2005ac:	fe05a423          	sw	zero,-24(a1)
    *--sp = 0;  // s1
  2005b0:	fe05a223          	sw	zero,-28(a1)
    *--sp = 0;  // s0
  2005b4:	fe05a023          	sw	zero,-32(a1)
  2005b8:	fdc50593          	addi	a1,a0,-36 # 1fdc <$d.2+0x12e>
    if (!initialized) {
  2005bc:	00225537          	lui	a0,0x225
  2005c0:	70854683          	lbu	a3,1800(a0) # 225708 <alloc_pages.initialized>
    *--sp = (uint32_t)user_entry;  // ra
  2005c4:	00b60c33          	add	s8,a2,a1
  2005c8:	002005b7          	lui	a1,0x200
  2005cc:	10858593          	addi	a1,a1,264 # 200108 <user_entry>
  2005d0:	00bc2023          	sw	a1,0(s8)
  2005d4:	00068863          	beqz	a3,2005e4 <create_process+0x1a8>
    paddr_t paddr = next_paddr;
  2005d8:	00225537          	lui	a0,0x225
  2005dc:	70c52903          	lw	s2,1804(a0) # 22570c <alloc_pages.next_paddr>
  2005e0:	0140006f          	j	2005f4 <create_process+0x1b8>
  2005e4:	00100593          	li	a1,1
        initialized = 1;
  2005e8:	70b50423          	sb	a1,1800(a0)
  2005ec:	00256537          	lui	a0,0x256
  2005f0:	00050913          	mv	s2,a0
  2005f4:	00001537          	lui	a0,0x1
    next_paddr += n * PAGE_SIZE;
  2005f8:	00a90533          	add	a0,s2,a0
  2005fc:	002255b7          	lui	a1,0x225
    if (next_paddr > (paddr_t)__free_ram_end)
  200600:	00356637          	lui	a2,0x356
  200604:	00060493          	mv	s1,a2
    next_paddr += n * PAGE_SIZE;
  200608:	70a5a623          	sw	a0,1804(a1) # 22570c <alloc_pages.next_paddr>
    if (next_paddr > (paddr_t)__free_ram_end)
  20060c:	02a4f263          	bgeu	s1,a0,200630 <create_process+0x1f4>
        PANIC("out of memory");
  200610:	00203537          	lui	a0,0x203
  200614:	11550513          	addi	a0,a0,277 # 203115 <$d.4>
  200618:	002035b7          	lui	a1,0x203
  20061c:	d2658593          	addi	a1,a1,-730 # 202d26 <$d.1+0x14>
  200620:	08900613          	li	a2,137
  200624:	00001097          	auipc	ra,0x1
  200628:	18c080e7          	jalr	396(ra) # 2017b0 <s_printf>
  20062c:	0000006f          	j	20062c <create_process+0x1f0>
    memset((void *) paddr, 0, n * PAGE_SIZE);
  200630:	00001637          	lui	a2,0x1
  200634:	00001437          	lui	s0,0x1
  200638:	00090513          	mv	a0,s2
  20063c:	00000593          	li	a1,0
  200640:	00001097          	auipc	ra,0x1
  200644:	054080e7          	jalr	84(ra) # 201694 <memset>
    s_printf("---- kernel map start. ----\n");
  200648:	00203537          	lui	a0,0x203
  20064c:	35650513          	addi	a0,a0,854 # 203356 <$d.1+0x3>
  200650:	00001097          	auipc	ra,0x1
  200654:	160080e7          	jalr	352(ra) # 2017b0 <s_printf>
    for (paddr_t paddr = (paddr_t) __kernel_base;
  200658:	00200537          	lui	a0,0x200
  20065c:	00050993          	mv	s3,a0
  200660:	0299f663          	bgeu	s3,s1,20068c <create_process+0x250>
  200664:	00356537          	lui	a0,0x356
  200668:	00050493          	mv	s1,a0
        map_page(page_table, paddr, paddr, PAGE_R | PAGE_W | PAGE_X);
  20066c:	00e00693          	li	a3,14
  200670:	00090513          	mv	a0,s2
  200674:	00098593          	mv	a1,s3
  200678:	00098613          	mv	a2,s3
  20067c:	00000097          	auipc	ra,0x0
  200680:	c3c080e7          	jalr	-964(ra) # 2002b8 <map_page>
         paddr < (paddr_t) __free_ram_end; paddr += PAGE_SIZE)
  200684:	008989b3          	add	s3,s3,s0
    for (paddr_t paddr = (paddr_t) __kernel_base;
  200688:	fe99e2e3          	bltu	s3,s1,20066c <create_process+0x230>
    s_printf("---- MMIO map start. ----\n");
  20068c:	00203537          	lui	a0,0x203
  200690:	0fa50513          	addi	a0,a0,250 # 2030fa <$d.3+0x345>
  200694:	00001097          	auipc	ra,0x1
  200698:	11c080e7          	jalr	284(ra) # 2017b0 <s_printf>
    if ((table1[vpn1] & PAGE_V) == 0) {
  20069c:	10092503          	lw	a0,256(s2)
  2006a0:	00157593          	andi	a1,a0,1
  2006a4:	08059663          	bnez	a1,200730 <create_process+0x2f4>
    if (!initialized) {
  2006a8:	00225537          	lui	a0,0x225
  2006ac:	70854583          	lbu	a1,1800(a0) # 225708 <alloc_pages.initialized>
  2006b0:	00058863          	beqz	a1,2006c0 <create_process+0x284>
    paddr_t paddr = next_paddr;
  2006b4:	00225537          	lui	a0,0x225
  2006b8:	70c52983          	lw	s3,1804(a0) # 22570c <alloc_pages.next_paddr>
  2006bc:	0140006f          	j	2006d0 <create_process+0x294>
  2006c0:	00100593          	li	a1,1
        initialized = 1;
  2006c4:	70b50423          	sb	a1,1800(a0)
  2006c8:	00256537          	lui	a0,0x256
  2006cc:	00050993          	mv	s3,a0
  2006d0:	00001537          	lui	a0,0x1
    next_paddr += n * PAGE_SIZE;
  2006d4:	00a98533          	add	a0,s3,a0
  2006d8:	002255b7          	lui	a1,0x225
    if (next_paddr > (paddr_t)__free_ram_end)
  2006dc:	00356637          	lui	a2,0x356
  2006e0:	00060613          	mv	a2,a2
    next_paddr += n * PAGE_SIZE;
  2006e4:	70a5a623          	sw	a0,1804(a1) # 22570c <alloc_pages.next_paddr>
    if (next_paddr > (paddr_t)__free_ram_end)
  2006e8:	02a67263          	bgeu	a2,a0,20070c <create_process+0x2d0>
        PANIC("out of memory");
  2006ec:	00203537          	lui	a0,0x203
  2006f0:	11550513          	addi	a0,a0,277 # 203115 <$d.4>
  2006f4:	002035b7          	lui	a1,0x203
  2006f8:	d2658593          	addi	a1,a1,-730 # 202d26 <$d.1+0x14>
  2006fc:	08900613          	li	a2,137
  200700:	00001097          	auipc	ra,0x1
  200704:	0b0080e7          	jalr	176(ra) # 2017b0 <s_printf>
  200708:	0000006f          	j	200708 <create_process+0x2cc>
    memset((void *) paddr, 0, n * PAGE_SIZE);
  20070c:	00001637          	lui	a2,0x1
  200710:	00098513          	mv	a0,s3
  200714:	00000593          	li	a1,0
  200718:	00001097          	auipc	ra,0x1
  20071c:	f7c080e7          	jalr	-132(ra) # 201694 <memset>
        table1[vpn1] = ((pt_paddr / PAGE_SIZE) << 10) | PAGE_V;
  200720:	00c9d513          	srli	a0,s3,0xc
  200724:	00a51513          	slli	a0,a0,0xa
  200728:	00150513          	addi	a0,a0,1
  20072c:	10a92023          	sw	a0,256(s2)
    uint32_t *table0 = (uint32_t *) ((table1[vpn1] >> 10) * PAGE_SIZE);
  200730:	00a55513          	srli	a0,a0,0xa
  200734:	00c51513          	slli	a0,a0,0xc
  200738:	040005b7          	lui	a1,0x4000
  20073c:	00758593          	addi	a1,a1,7 # 4000007 <__free_ram_end+0x3caa007>
    table0[vpn0] = ((paddr / PAGE_SIZE) << 10) | flags | PAGE_V;
  200740:	00b52023          	sw	a1,0(a0)
    s_printf("---- SA core address map start. ----\n");
  200744:	00203537          	lui	a0,0x203
  200748:	dc450513          	addi	a0,a0,-572 # 202dc4 <$d.3+0xf>
  20074c:	00001097          	auipc	ra,0x1
  200750:	064080e7          	jalr	100(ra) # 2017b0 <s_printf>
    if ((table1[vpn1] & PAGE_V) == 0) {
  200754:	10092503          	lw	a0,256(s2)
  200758:	00157593          	andi	a1,a0,1
  20075c:	08059663          	bnez	a1,2007e8 <create_process+0x3ac>
    if (!initialized) {
  200760:	00225537          	lui	a0,0x225
  200764:	70854583          	lbu	a1,1800(a0) # 225708 <alloc_pages.initialized>
  200768:	00058863          	beqz	a1,200778 <create_process+0x33c>
    paddr_t paddr = next_paddr;
  20076c:	00225537          	lui	a0,0x225
  200770:	70c52983          	lw	s3,1804(a0) # 22570c <alloc_pages.next_paddr>
  200774:	0140006f          	j	200788 <create_process+0x34c>
  200778:	00100593          	li	a1,1
        initialized = 1;
  20077c:	70b50423          	sb	a1,1800(a0)
  200780:	00256537          	lui	a0,0x256
  200784:	00050993          	mv	s3,a0
  200788:	00001537          	lui	a0,0x1
    next_paddr += n * PAGE_SIZE;
  20078c:	00a98533          	add	a0,s3,a0
  200790:	002255b7          	lui	a1,0x225
    if (next_paddr > (paddr_t)__free_ram_end)
  200794:	00356637          	lui	a2,0x356
  200798:	00060613          	mv	a2,a2
    next_paddr += n * PAGE_SIZE;
  20079c:	70a5a623          	sw	a0,1804(a1) # 22570c <alloc_pages.next_paddr>
    if (next_paddr > (paddr_t)__free_ram_end)
  2007a0:	02a67263          	bgeu	a2,a0,2007c4 <create_process+0x388>
        PANIC("out of memory");
  2007a4:	00203537          	lui	a0,0x203
  2007a8:	11550513          	addi	a0,a0,277 # 203115 <$d.4>
  2007ac:	002035b7          	lui	a1,0x203
  2007b0:	d2658593          	addi	a1,a1,-730 # 202d26 <$d.1+0x14>
  2007b4:	08900613          	li	a2,137
  2007b8:	00001097          	auipc	ra,0x1
  2007bc:	ff8080e7          	jalr	-8(ra) # 2017b0 <s_printf>
  2007c0:	0000006f          	j	2007c0 <create_process+0x384>
    memset((void *) paddr, 0, n * PAGE_SIZE);
  2007c4:	00001637          	lui	a2,0x1
  2007c8:	00098513          	mv	a0,s3
  2007cc:	00000593          	li	a1,0
  2007d0:	00001097          	auipc	ra,0x1
  2007d4:	ec4080e7          	jalr	-316(ra) # 201694 <memset>
        table1[vpn1] = ((pt_paddr / PAGE_SIZE) << 10) | PAGE_V;
  2007d8:	00c9d513          	srli	a0,s3,0xc
  2007dc:	00a51513          	slli	a0,a0,0xa
  2007e0:	00150513          	addi	a0,a0,1
  2007e4:	10a92023          	sw	a0,256(s2)
    uint32_t *table0 = (uint32_t *) ((table1[vpn1] >> 10) * PAGE_SIZE);
  2007e8:	00a55513          	srli	a0,a0,0xa
  2007ec:	00c51513          	slli	a0,a0,0xc
  2007f0:	040015b7          	lui	a1,0x4001
  2007f4:	40758593          	addi	a1,a1,1031 # 4001407 <__free_ram_end+0x3cab407>
    table0[vpn0] = ((paddr / PAGE_SIZE) << 10) | flags | PAGE_V;
  2007f8:	00b52a23          	sw	a1,20(a0)
    s_printf("---- SA core data address map start. ----\n");
  2007fc:	00203537          	lui	a0,0x203
  200800:	e5550513          	addi	a0,a0,-427 # 202e55 <$d.3+0xa0>
  200804:	00001097          	auipc	ra,0x1
  200808:	fac080e7          	jalr	-84(ra) # 2017b0 <s_printf>
    if ((table1[vpn1] & PAGE_V) == 0) {
  20080c:	00092503          	lw	a0,0(s2)
  200810:	00157593          	andi	a1,a0,1
  200814:	08059663          	bnez	a1,2008a0 <create_process+0x464>
    if (!initialized) {
  200818:	00225537          	lui	a0,0x225
  20081c:	70854583          	lbu	a1,1800(a0) # 225708 <alloc_pages.initialized>
  200820:	00058863          	beqz	a1,200830 <create_process+0x3f4>
    paddr_t paddr = next_paddr;
  200824:	00225537          	lui	a0,0x225
  200828:	70c52983          	lw	s3,1804(a0) # 22570c <alloc_pages.next_paddr>
  20082c:	0140006f          	j	200840 <create_process+0x404>
  200830:	00100593          	li	a1,1
        initialized = 1;
  200834:	70b50423          	sb	a1,1800(a0)
  200838:	00256537          	lui	a0,0x256
  20083c:	00050993          	mv	s3,a0
  200840:	00001537          	lui	a0,0x1
    next_paddr += n * PAGE_SIZE;
  200844:	00a98533          	add	a0,s3,a0
  200848:	002255b7          	lui	a1,0x225
    if (next_paddr > (paddr_t)__free_ram_end)
  20084c:	00356637          	lui	a2,0x356
  200850:	00060613          	mv	a2,a2
    next_paddr += n * PAGE_SIZE;
  200854:	70a5a623          	sw	a0,1804(a1) # 22570c <alloc_pages.next_paddr>
    if (next_paddr > (paddr_t)__free_ram_end)
  200858:	02a67263          	bgeu	a2,a0,20087c <create_process+0x440>
        PANIC("out of memory");
  20085c:	00203537          	lui	a0,0x203
  200860:	11550513          	addi	a0,a0,277 # 203115 <$d.4>
  200864:	002035b7          	lui	a1,0x203
  200868:	d2658593          	addi	a1,a1,-730 # 202d26 <$d.1+0x14>
  20086c:	08900613          	li	a2,137
  200870:	00001097          	auipc	ra,0x1
  200874:	f40080e7          	jalr	-192(ra) # 2017b0 <s_printf>
  200878:	0000006f          	j	200878 <create_process+0x43c>
    memset((void *) paddr, 0, n * PAGE_SIZE);
  20087c:	00001637          	lui	a2,0x1
  200880:	00098513          	mv	a0,s3
  200884:	00000593          	li	a1,0
  200888:	00001097          	auipc	ra,0x1
  20088c:	e0c080e7          	jalr	-500(ra) # 201694 <memset>
        table1[vpn1] = ((pt_paddr / PAGE_SIZE) << 10) | PAGE_V;
  200890:	00c9d513          	srli	a0,s3,0xc
  200894:	00a51513          	slli	a0,a0,0xa
  200898:	00150513          	addi	a0,a0,1
  20089c:	00a92023          	sw	a0,0(s2)
    uint32_t *table0 = (uint32_t *) ((table1[vpn1] >> 10) * PAGE_SIZE);
  2008a0:	00a55513          	srli	a0,a0,0xa
  2008a4:	00c51513          	slli	a0,a0,0xc
  2008a8:	000085b7          	lui	a1,0x8
  2008ac:	00758593          	addi	a1,a1,7 # 8007 <$d.4+0x589a>
    table0[vpn0] = ((paddr / PAGE_SIZE) << 10) | flags | PAGE_V;
  2008b0:	08b52023          	sw	a1,128(a0)
    s_printf("---- SA core data wb address map start. ----\n");
  2008b4:	00203537          	lui	a0,0x203
  2008b8:	e2750513          	addi	a0,a0,-473 # 202e27 <$d.3+0x72>
  2008bc:	00001097          	auipc	ra,0x1
  2008c0:	ef4080e7          	jalr	-268(ra) # 2017b0 <s_printf>
    if ((table1[vpn1] & PAGE_V) == 0) {
  2008c4:	00092503          	lw	a0,0(s2)
  2008c8:	00157593          	andi	a1,a0,1
  2008cc:	08059663          	bnez	a1,200958 <create_process+0x51c>
    if (!initialized) {
  2008d0:	00225537          	lui	a0,0x225
  2008d4:	70854583          	lbu	a1,1800(a0) # 225708 <alloc_pages.initialized>
  2008d8:	00058863          	beqz	a1,2008e8 <create_process+0x4ac>
    paddr_t paddr = next_paddr;
  2008dc:	00225537          	lui	a0,0x225
  2008e0:	70c52983          	lw	s3,1804(a0) # 22570c <alloc_pages.next_paddr>
  2008e4:	0140006f          	j	2008f8 <create_process+0x4bc>
  2008e8:	00100593          	li	a1,1
        initialized = 1;
  2008ec:	70b50423          	sb	a1,1800(a0)
  2008f0:	00256537          	lui	a0,0x256
  2008f4:	00050993          	mv	s3,a0
  2008f8:	00001537          	lui	a0,0x1
    next_paddr += n * PAGE_SIZE;
  2008fc:	00a98533          	add	a0,s3,a0
  200900:	002255b7          	lui	a1,0x225
    if (next_paddr > (paddr_t)__free_ram_end)
  200904:	00356637          	lui	a2,0x356
  200908:	00060613          	mv	a2,a2
    next_paddr += n * PAGE_SIZE;
  20090c:	70a5a623          	sw	a0,1804(a1) # 22570c <alloc_pages.next_paddr>
    if (next_paddr > (paddr_t)__free_ram_end)
  200910:	02a67263          	bgeu	a2,a0,200934 <create_process+0x4f8>
        PANIC("out of memory");
  200914:	00203537          	lui	a0,0x203
  200918:	11550513          	addi	a0,a0,277 # 203115 <$d.4>
  20091c:	002035b7          	lui	a1,0x203
  200920:	d2658593          	addi	a1,a1,-730 # 202d26 <$d.1+0x14>
  200924:	08900613          	li	a2,137
  200928:	00001097          	auipc	ra,0x1
  20092c:	e88080e7          	jalr	-376(ra) # 2017b0 <s_printf>
  200930:	0000006f          	j	200930 <create_process+0x4f4>
    memset((void *) paddr, 0, n * PAGE_SIZE);
  200934:	00001637          	lui	a2,0x1
  200938:	00098513          	mv	a0,s3
  20093c:	00000593          	li	a1,0
  200940:	00001097          	auipc	ra,0x1
  200944:	d54080e7          	jalr	-684(ra) # 201694 <memset>
        table1[vpn1] = ((pt_paddr / PAGE_SIZE) << 10) | PAGE_V;
  200948:	00c9d513          	srli	a0,s3,0xc
  20094c:	00a51513          	slli	a0,a0,0xa
  200950:	00150513          	addi	a0,a0,1
  200954:	00a92023          	sw	a0,0(s2)
  200958:	01812023          	sw	s8,0(sp)
  20095c:	01712223          	sw	s7,4(sp)
  200960:	01412423          	sw	s4,8(sp)
    uint32_t *table0 = (uint32_t *) ((table1[vpn1] >> 10) * PAGE_SIZE);
  200964:	00a55513          	srli	a0,a0,0xa
  200968:	00c51513          	slli	a0,a0,0xc
  20096c:	0000c5b7          	lui	a1,0xc
  200970:	00758593          	addi	a1,a1,7 # c007 <$d.4+0x989a>
    table0[vpn0] = ((paddr / PAGE_SIZE) << 10) | flags | PAGE_V;
  200974:	0cb52023          	sw	a1,192(a0)
    s_printf("---- SD-Card IF address map start. ----\n");
  200978:	00203537          	lui	a0,0x203
  20097c:	d3550513          	addi	a0,a0,-715 # 202d35 <$d.1+0x23>
  200980:	00001097          	auipc	ra,0x1
  200984:	e30080e7          	jalr	-464(ra) # 2017b0 <s_printf>
    if ((table1[vpn1] & PAGE_V) == 0) {
  200988:	10092503          	lw	a0,256(s2)
  20098c:	00157593          	andi	a1,a0,1
  200990:	08059663          	bnez	a1,200a1c <create_process+0x5e0>
    if (!initialized) {
  200994:	00225537          	lui	a0,0x225
  200998:	70854583          	lbu	a1,1800(a0) # 225708 <alloc_pages.initialized>
  20099c:	00058863          	beqz	a1,2009ac <create_process+0x570>
    paddr_t paddr = next_paddr;
  2009a0:	00225537          	lui	a0,0x225
  2009a4:	70c52983          	lw	s3,1804(a0) # 22570c <alloc_pages.next_paddr>
  2009a8:	0140006f          	j	2009bc <create_process+0x580>
  2009ac:	00100593          	li	a1,1
        initialized = 1;
  2009b0:	70b50423          	sb	a1,1800(a0)
  2009b4:	00256537          	lui	a0,0x256
  2009b8:	00050993          	mv	s3,a0
  2009bc:	00001537          	lui	a0,0x1
    next_paddr += n * PAGE_SIZE;
  2009c0:	00a98533          	add	a0,s3,a0
  2009c4:	002255b7          	lui	a1,0x225
    if (next_paddr > (paddr_t)__free_ram_end)
  2009c8:	00356637          	lui	a2,0x356
  2009cc:	00060613          	mv	a2,a2
    next_paddr += n * PAGE_SIZE;
  2009d0:	70a5a623          	sw	a0,1804(a1) # 22570c <alloc_pages.next_paddr>
    if (next_paddr > (paddr_t)__free_ram_end)
  2009d4:	02a67263          	bgeu	a2,a0,2009f8 <create_process+0x5bc>
        PANIC("out of memory");
  2009d8:	00203537          	lui	a0,0x203
  2009dc:	11550513          	addi	a0,a0,277 # 203115 <$d.4>
  2009e0:	002035b7          	lui	a1,0x203
  2009e4:	d2658593          	addi	a1,a1,-730 # 202d26 <$d.1+0x14>
  2009e8:	08900613          	li	a2,137
  2009ec:	00001097          	auipc	ra,0x1
  2009f0:	dc4080e7          	jalr	-572(ra) # 2017b0 <s_printf>
  2009f4:	0000006f          	j	2009f4 <create_process+0x5b8>
    memset((void *) paddr, 0, n * PAGE_SIZE);
  2009f8:	00001637          	lui	a2,0x1
  2009fc:	00098513          	mv	a0,s3
  200a00:	00000593          	li	a1,0
  200a04:	00001097          	auipc	ra,0x1
  200a08:	c90080e7          	jalr	-880(ra) # 201694 <memset>
        table1[vpn1] = ((pt_paddr / PAGE_SIZE) << 10) | PAGE_V;
  200a0c:	00c9d513          	srli	a0,s3,0xc
  200a10:	00a51513          	slli	a0,a0,0xa
  200a14:	00150513          	addi	a0,a0,1
  200a18:	10a92023          	sw	a0,256(s2)
    uint32_t *table0 = (uint32_t *) ((table1[vpn1] >> 10) * PAGE_SIZE);
  200a1c:	00a55513          	srli	a0,a0,0xa
  200a20:	00c51513          	slli	a0,a0,0xc
  200a24:	040025b7          	lui	a1,0x4002
  200a28:	80758593          	addi	a1,a1,-2041 # 4001807 <__free_ram_end+0x3cab807>
    table0[vpn0] = ((paddr / PAGE_SIZE) << 10) | flags | PAGE_V;
  200a2c:	00b52c23          	sw	a1,24(a0)
    if (image && image_size > 0) {
  200a30:	180a8463          	beqz	s5,200bb8 <create_process+0x77c>
  200a34:	180b0263          	beqz	s6,200bb8 <create_process+0x77c>
        s_printf("---- user image map start. ----\n");
  200a38:	00203537          	lui	a0,0x203
  200a3c:	df350513          	addi	a0,a0,-525 # 202df3 <$d.3+0x3e>
  200a40:	00001097          	auipc	ra,0x1
  200a44:	d70080e7          	jalr	-656(ra) # 2017b0 <s_printf>
  200a48:	00000b93          	li	s7,0
  200a4c:	00225c37          	lui	s8,0x225
  200a50:	00225cb7          	lui	s9,0x225
  200a54:	00356537          	lui	a0,0x356
  200a58:	00050d93          	mv	s11,a0
  200a5c:	004004b7          	lui	s1,0x400
  200a60:	00256537          	lui	a0,0x256
  200a64:	00050d13          	mv	s10,a0
  200a68:	000b0413          	mv	s0,s6
  200a6c:	00001a37          	lui	s4,0x1
  200a70:	03c0006f          	j	200aac <create_process+0x670>
            memcpy((void *)page, (const uint8_t *)image + off, copy_size);
  200a74:	017a85b3          	add	a1,s5,s7
  200a78:	00098513          	mv	a0,s3
  200a7c:	00001097          	auipc	ra,0x1
  200a80:	bf0080e7          	jalr	-1040(ra) # 20166c <memcpy>
                    USER_BASE + off,
  200a84:	009b85b3          	add	a1,s7,s1
            map_page(page_table,
  200a88:	01e00693          	li	a3,30
  200a8c:	00090513          	mv	a0,s2
  200a90:	00098613          	mv	a2,s3
  200a94:	00000097          	auipc	ra,0x0
  200a98:	824080e7          	jalr	-2012(ra) # 2002b8 <map_page>
        for (uint32_t off = 0; off < image_size; off += PAGE_SIZE) {
  200a9c:	014b8bb3          	add	s7,s7,s4
  200aa0:	80040513          	addi	a0,s0,-2048 # 800 <$d.3+0x7a>
  200aa4:	80050413          	addi	s0,a0,-2048 # 255800 <__bss_end+0x1fcec>
  200aa8:	076bfa63          	bgeu	s7,s6,200b1c <create_process+0x6e0>
    if (!initialized) {
  200aac:	708c4503          	lbu	a0,1800(s8) # 225708 <alloc_pages.initialized>
  200ab0:	00050663          	beqz	a0,200abc <create_process+0x680>
    paddr_t paddr = next_paddr;
  200ab4:	70cca983          	lw	s3,1804(s9) # 22570c <alloc_pages.next_paddr>
  200ab8:	0100006f          	j	200ac8 <create_process+0x68c>
        initialized = 1;
  200abc:	00100513          	li	a0,1
  200ac0:	70ac0423          	sb	a0,1800(s8)
  200ac4:	000d0993          	mv	s3,s10
    next_paddr += n * PAGE_SIZE;
  200ac8:	00001537          	lui	a0,0x1
  200acc:	00a98533          	add	a0,s3,a0
  200ad0:	70aca623          	sw	a0,1804(s9)
    if (next_paddr > (paddr_t)__free_ram_end)
  200ad4:	02ade463          	bltu	s11,a0,200afc <create_process+0x6c0>
    memset((void *) paddr, 0, n * PAGE_SIZE);
  200ad8:	00001637          	lui	a2,0x1
  200adc:	00098513          	mv	a0,s3
  200ae0:	00000593          	li	a1,0
  200ae4:	00001097          	auipc	ra,0x1
  200ae8:	bb0080e7          	jalr	-1104(ra) # 201694 <memset>
  200aec:	00040613          	mv	a2,s0
            size_t copy_size = (remaining < PAGE_SIZE) ? remaining : PAGE_SIZE;
  200af0:	f94462e3          	bltu	s0,s4,200a74 <create_process+0x638>
  200af4:	00001637          	lui	a2,0x1
  200af8:	f7dff06f          	j	200a74 <create_process+0x638>
        PANIC("out of memory");
  200afc:	00203537          	lui	a0,0x203
  200b00:	11550513          	addi	a0,a0,277 # 203115 <$d.4>
  200b04:	002035b7          	lui	a1,0x203
  200b08:	d2658593          	addi	a1,a1,-730 # 202d26 <$d.1+0x14>
  200b0c:	08900613          	li	a2,137
  200b10:	00001097          	auipc	ra,0x1
  200b14:	ca0080e7          	jalr	-864(ra) # 2017b0 <s_printf>
  200b18:	0000006f          	j	200b18 <create_process+0x6dc>
        s_printf("---- user stack map start. ----\n");
  200b1c:	00203537          	lui	a0,0x203
  200b20:	2ac50513          	addi	a0,a0,684 # 2032ac <$d.4+0x197>
  200b24:	00001097          	auipc	ra,0x1
  200b28:	c8c080e7          	jalr	-884(ra) # 2017b0 <s_printf>
  200b2c:	004e0437          	lui	s0,0x4e0
  200b30:	004df9b7          	lui	s3,0x4df
  200b34:	00225ab7          	lui	s5,0x225
  200b38:	00225bb7          	lui	s7,0x225
  200b3c:	00001c37          	lui	s8,0x1
  200b40:	00356537          	lui	a0,0x356
  200b44:	00050c93          	mv	s9,a0
  200b48:	4ff00d13          	li	s10,1279
  200b4c:	00100a13          	li	s4,1
  200b50:	00256537          	lui	a0,0x256
  200b54:	00050d93          	mv	s11,a0
    if (!initialized) {
  200b58:	708ac503          	lbu	a0,1800(s5) # 225708 <alloc_pages.initialized>
  200b5c:	00050663          	beqz	a0,200b68 <create_process+0x72c>
    paddr_t paddr = next_paddr;
  200b60:	70cba483          	lw	s1,1804(s7) # 22570c <alloc_pages.next_paddr>
  200b64:	00c0006f          	j	200b70 <create_process+0x734>
        initialized = 1;
  200b68:	714a8423          	sb	s4,1800(s5)
  200b6c:	000d8493          	mv	s1,s11
    next_paddr += n * PAGE_SIZE;
  200b70:	01848533          	add	a0,s1,s8
  200b74:	70aba623          	sw	a0,1804(s7)
    if (next_paddr > (paddr_t)__free_ram_end)
  200b78:	0cace063          	bltu	s9,a0,200c38 <create_process+0x7fc>
    memset((void *) paddr, 0, n * PAGE_SIZE);
  200b7c:	00001637          	lui	a2,0x1
  200b80:	00048513          	mv	a0,s1
  200b84:	00000593          	li	a1,0
  200b88:	00001097          	auipc	ra,0x1
  200b8c:	b0c080e7          	jalr	-1268(ra) # 201694 <memset>
            map_page(page_table,
  200b90:	01600693          	li	a3,22
  200b94:	00090513          	mv	a0,s2
  200b98:	00040593          	mv	a1,s0
  200b9c:	00048613          	mv	a2,s1
  200ba0:	fffff097          	auipc	ra,0xfffff
  200ba4:	718080e7          	jalr	1816(ra) # 2002b8 <map_page>
            va < USER_STACK_TOP;
  200ba8:	018989b3          	add	s3,s3,s8
  200bac:	00c9d513          	srli	a0,s3,0xc
            va += PAGE_SIZE) {
  200bb0:	01840433          	add	s0,s0,s8
        for (uint32_t va = stack_bottom;
  200bb4:	fba562e3          	bltu	a0,s10,200b58 <create_process+0x71c>
        if (procs[i].state == PROC_UNUSED) {
  200bb8:	00225537          	lui	a0,0x225
  200bbc:	73050413          	addi	s0,a0,1840 # 225730 <procs>
  200bc0:	00412503          	lw	a0,4(sp)
  200bc4:	00a40433          	add	s0,s0,a0
  200bc8:	00812a03          	lw	s4,8(sp)
    proc->pid        = i + 1;
  200bcc:	001a0a13          	addi	s4,s4,1 # 1001 <$d.3+0x87b>
  200bd0:	01442023          	sw	s4,0(s0) # 4e0000 <__free_ram_end+0x18a000>
  200bd4:	00100513          	li	a0,1
    proc->state      = PROC_RUNNABLE;
  200bd8:	00a42223          	sw	a0,4(s0)
  200bdc:	00012503          	lw	a0,0(sp)
    proc->sp         = (uint32_t)sp;
  200be0:	00a42423          	sw	a0,8(s0)
    proc->page_table = page_table;
  200be4:	01242623          	sw	s2,12(s0)
    s_printf("create_process_End\n");
  200be8:	00203537          	lui	a0,0x203
  200bec:	1b450513          	addi	a0,a0,436 # 2031b4 <$d.4+0x9f>
  200bf0:	00001097          	auipc	ra,0x1
  200bf4:	bc0080e7          	jalr	-1088(ra) # 2017b0 <s_printf>
    return proc;
  200bf8:	00040513          	mv	a0,s0
  200bfc:	03c12083          	lw	ra,60(sp)
  200c00:	03812403          	lw	s0,56(sp)
  200c04:	03412483          	lw	s1,52(sp)
  200c08:	03012903          	lw	s2,48(sp)
  200c0c:	02c12983          	lw	s3,44(sp)
  200c10:	02812a03          	lw	s4,40(sp)
  200c14:	02412a83          	lw	s5,36(sp)
  200c18:	02012b03          	lw	s6,32(sp)
  200c1c:	01c12b83          	lw	s7,28(sp)
  200c20:	01812c03          	lw	s8,24(sp)
  200c24:	01412c83          	lw	s9,20(sp)
  200c28:	01012d03          	lw	s10,16(sp)
  200c2c:	00c12d83          	lw	s11,12(sp)
  200c30:	04010113          	addi	sp,sp,64
  200c34:	00008067          	ret
        PANIC("out of memory");
  200c38:	00203537          	lui	a0,0x203
  200c3c:	11550513          	addi	a0,a0,277 # 203115 <$d.4>
  200c40:	002035b7          	lui	a1,0x203
  200c44:	d2658593          	addi	a1,a1,-730 # 202d26 <$d.1+0x14>
  200c48:	08900613          	li	a2,137
  200c4c:	00001097          	auipc	ra,0x1
  200c50:	b64080e7          	jalr	-1180(ra) # 2017b0 <s_printf>
  200c54:	0000006f          	j	200c54 <create_process+0x818>

00200c58 <yield>:
void yield(void) {
  200c58:	00225537          	lui	a0,0x225
  200c5c:	71452503          	lw	a0,1812(a0) # 225714 <current_proc>
  200c60:	00052603          	lw	a2,0(a0)
    struct process *next = idle_proc;
  200c64:	002255b7          	lui	a1,0x225
        struct process *proc = &procs[(current_proc->pid + i) % PROCS_MAX];
  200c68:	41f65693          	srai	a3,a2,0x1f
  200c6c:	01d6d693          	srli	a3,a3,0x1d
  200c70:	00d606b3          	add	a3,a2,a3
  200c74:	ff86f693          	andi	a3,a3,-8
  200c78:	40d606b3          	sub	a3,a2,a3
        if (proc->state == PROC_RUNNABLE && proc->pid > 0) {
  200c7c:	00469713          	slli	a4,a3,0x4
  200c80:	00d69693          	slli	a3,a3,0xd
  200c84:	00e686b3          	add	a3,a3,a4
  200c88:	00225737          	lui	a4,0x225
  200c8c:	73070713          	addi	a4,a4,1840 # 225730 <procs>
  200c90:	00d706b3          	add	a3,a4,a3
  200c94:	0046a803          	lw	a6,4(a3) # 356004 <__free_ram_end+0x4>
    struct process *next = idle_proc;
  200c98:	7105a583          	lw	a1,1808(a1) # 225710 <idle_proc>
  200c9c:	00100793          	li	a5,1
        if (proc->state == PROC_RUNNABLE && proc->pid > 0) {
  200ca0:	00f81663          	bne	a6,a5,200cac <yield+0x54>
  200ca4:	0006a803          	lw	a6,0(a3)
  200ca8:	1f004263          	bgtz	a6,200e8c <yield+0x234>
        struct process *proc = &procs[(current_proc->pid + i) % PROCS_MAX];
  200cac:	00160693          	addi	a3,a2,1 # 1001 <$d.3+0x87b>
  200cb0:	41f6d813          	srai	a6,a3,0x1f
  200cb4:	01d85813          	srli	a6,a6,0x1d
  200cb8:	01068833          	add	a6,a3,a6
  200cbc:	ff887813          	andi	a6,a6,-8
  200cc0:	410686b3          	sub	a3,a3,a6
        if (proc->state == PROC_RUNNABLE && proc->pid > 0) {
  200cc4:	00469813          	slli	a6,a3,0x4
  200cc8:	00d69693          	slli	a3,a3,0xd
  200ccc:	010686b3          	add	a3,a3,a6
  200cd0:	00d70733          	add	a4,a4,a3
  200cd4:	00472703          	lw	a4,4(a4)
  200cd8:	00f71c63          	bne	a4,a5,200cf0 <yield+0x98>
        struct process *proc = &procs[(current_proc->pid + i) % PROCS_MAX];
  200cdc:	00225737          	lui	a4,0x225
  200ce0:	73070713          	addi	a4,a4,1840 # 225730 <procs>
  200ce4:	00d706b3          	add	a3,a4,a3
        if (proc->state == PROC_RUNNABLE && proc->pid > 0) {
  200ce8:	0006a703          	lw	a4,0(a3)
  200cec:	1ae04063          	bgtz	a4,200e8c <yield+0x234>
        struct process *proc = &procs[(current_proc->pid + i) % PROCS_MAX];
  200cf0:	00260693          	addi	a3,a2,2
  200cf4:	41f6d713          	srai	a4,a3,0x1f
  200cf8:	01d75713          	srli	a4,a4,0x1d
  200cfc:	00e68733          	add	a4,a3,a4
  200d00:	ff877713          	andi	a4,a4,-8
  200d04:	40e686b3          	sub	a3,a3,a4
        if (proc->state == PROC_RUNNABLE && proc->pid > 0) {
  200d08:	00469713          	slli	a4,a3,0x4
  200d0c:	00d69693          	slli	a3,a3,0xd
  200d10:	00e686b3          	add	a3,a3,a4
  200d14:	00225737          	lui	a4,0x225
  200d18:	73070713          	addi	a4,a4,1840 # 225730 <procs>
  200d1c:	00d706b3          	add	a3,a4,a3
  200d20:	0046a803          	lw	a6,4(a3)
  200d24:	00100793          	li	a5,1
  200d28:	00f81663          	bne	a6,a5,200d34 <yield+0xdc>
  200d2c:	0006a803          	lw	a6,0(a3)
  200d30:	15004e63          	bgtz	a6,200e8c <yield+0x234>
        struct process *proc = &procs[(current_proc->pid + i) % PROCS_MAX];
  200d34:	00360693          	addi	a3,a2,3
  200d38:	41f6d813          	srai	a6,a3,0x1f
  200d3c:	01d85813          	srli	a6,a6,0x1d
  200d40:	01068833          	add	a6,a3,a6
  200d44:	ff887813          	andi	a6,a6,-8
  200d48:	410686b3          	sub	a3,a3,a6
        if (proc->state == PROC_RUNNABLE && proc->pid > 0) {
  200d4c:	00469813          	slli	a6,a3,0x4
  200d50:	00d69693          	slli	a3,a3,0xd
  200d54:	010686b3          	add	a3,a3,a6
  200d58:	00d70733          	add	a4,a4,a3
  200d5c:	00472703          	lw	a4,4(a4)
  200d60:	00f71c63          	bne	a4,a5,200d78 <yield+0x120>
        struct process *proc = &procs[(current_proc->pid + i) % PROCS_MAX];
  200d64:	00225737          	lui	a4,0x225
  200d68:	73070713          	addi	a4,a4,1840 # 225730 <procs>
  200d6c:	00d706b3          	add	a3,a4,a3
        if (proc->state == PROC_RUNNABLE && proc->pid > 0) {
  200d70:	0006a703          	lw	a4,0(a3)
  200d74:	10e04c63          	bgtz	a4,200e8c <yield+0x234>
        struct process *proc = &procs[(current_proc->pid + i) % PROCS_MAX];
  200d78:	00460693          	addi	a3,a2,4
  200d7c:	41f6d713          	srai	a4,a3,0x1f
  200d80:	01d75713          	srli	a4,a4,0x1d
  200d84:	00e68733          	add	a4,a3,a4
  200d88:	ff877713          	andi	a4,a4,-8
  200d8c:	40e686b3          	sub	a3,a3,a4
        if (proc->state == PROC_RUNNABLE && proc->pid > 0) {
  200d90:	00469713          	slli	a4,a3,0x4
  200d94:	00d69693          	slli	a3,a3,0xd
  200d98:	00e686b3          	add	a3,a3,a4
  200d9c:	00225737          	lui	a4,0x225
  200da0:	73070713          	addi	a4,a4,1840 # 225730 <procs>
  200da4:	00d706b3          	add	a3,a4,a3
  200da8:	0046a803          	lw	a6,4(a3)
  200dac:	00100793          	li	a5,1
  200db0:	00f81663          	bne	a6,a5,200dbc <yield+0x164>
  200db4:	0006a803          	lw	a6,0(a3)
  200db8:	0d004a63          	bgtz	a6,200e8c <yield+0x234>
        struct process *proc = &procs[(current_proc->pid + i) % PROCS_MAX];
  200dbc:	00560693          	addi	a3,a2,5
  200dc0:	41f6d813          	srai	a6,a3,0x1f
  200dc4:	01d85813          	srli	a6,a6,0x1d
  200dc8:	01068833          	add	a6,a3,a6
  200dcc:	ff887813          	andi	a6,a6,-8
  200dd0:	410686b3          	sub	a3,a3,a6
        if (proc->state == PROC_RUNNABLE && proc->pid > 0) {
  200dd4:	00469813          	slli	a6,a3,0x4
  200dd8:	00d69693          	slli	a3,a3,0xd
  200ddc:	010686b3          	add	a3,a3,a6
  200de0:	00d70733          	add	a4,a4,a3
  200de4:	00472703          	lw	a4,4(a4)
  200de8:	00f71c63          	bne	a4,a5,200e00 <yield+0x1a8>
        struct process *proc = &procs[(current_proc->pid + i) % PROCS_MAX];
  200dec:	00225737          	lui	a4,0x225
  200df0:	73070713          	addi	a4,a4,1840 # 225730 <procs>
  200df4:	00d706b3          	add	a3,a4,a3
        if (proc->state == PROC_RUNNABLE && proc->pid > 0) {
  200df8:	0006a703          	lw	a4,0(a3)
  200dfc:	08e04863          	bgtz	a4,200e8c <yield+0x234>
        struct process *proc = &procs[(current_proc->pid + i) % PROCS_MAX];
  200e00:	00660693          	addi	a3,a2,6
  200e04:	41f6d713          	srai	a4,a3,0x1f
  200e08:	01d75713          	srli	a4,a4,0x1d
  200e0c:	00e68733          	add	a4,a3,a4
  200e10:	ff877713          	andi	a4,a4,-8
  200e14:	40e686b3          	sub	a3,a3,a4
        if (proc->state == PROC_RUNNABLE && proc->pid > 0) {
  200e18:	00469713          	slli	a4,a3,0x4
  200e1c:	00d69693          	slli	a3,a3,0xd
  200e20:	00e686b3          	add	a3,a3,a4
  200e24:	00225737          	lui	a4,0x225
  200e28:	73070713          	addi	a4,a4,1840 # 225730 <procs>
  200e2c:	00d706b3          	add	a3,a4,a3
  200e30:	0046a803          	lw	a6,4(a3)
  200e34:	00100793          	li	a5,1
  200e38:	00f81663          	bne	a6,a5,200e44 <yield+0x1ec>
  200e3c:	0006a803          	lw	a6,0(a3)
  200e40:	05004663          	bgtz	a6,200e8c <yield+0x234>
        struct process *proc = &procs[(current_proc->pid + i) % PROCS_MAX];
  200e44:	00760613          	addi	a2,a2,7
  200e48:	41f65693          	srai	a3,a2,0x1f
  200e4c:	01d6d693          	srli	a3,a3,0x1d
  200e50:	00d606b3          	add	a3,a2,a3
  200e54:	ff86f693          	andi	a3,a3,-8
  200e58:	40d60633          	sub	a2,a2,a3
        if (proc->state == PROC_RUNNABLE && proc->pid > 0) {
  200e5c:	00461693          	slli	a3,a2,0x4
  200e60:	00d61613          	slli	a2,a2,0xd
  200e64:	00d606b3          	add	a3,a2,a3
  200e68:	00d70733          	add	a4,a4,a3
  200e6c:	00472603          	lw	a2,4(a4)
  200e70:	00f61c63          	bne	a2,a5,200e88 <yield+0x230>
        struct process *proc = &procs[(current_proc->pid + i) % PROCS_MAX];
  200e74:	00225637          	lui	a2,0x225
  200e78:	73060613          	addi	a2,a2,1840 # 225730 <procs>
  200e7c:	00d606b3          	add	a3,a2,a3
        if (proc->state == PROC_RUNNABLE && proc->pid > 0) {
  200e80:	0006a603          	lw	a2,0(a3)
  200e84:	00c04463          	bgtz	a2,200e8c <yield+0x234>
  200e88:	00058693          	mv	a3,a1
    if (next == current_proc)
  200e8c:	00a69463          	bne	a3,a0,200e94 <yield+0x23c>
}
  200e90:	00008067          	ret
  200e94:	ff010113          	addi	sp,sp,-16
  200e98:	00112623          	sw	ra,12(sp)
        : [satp] "r" (SATP_SV32 | ((uint32_t) next->page_table / PAGE_SIZE)),
  200e9c:	00c6a583          	lw	a1,12(a3)
    current_proc = next;
  200ea0:	00225637          	lui	a2,0x225
  200ea4:	70d62a23          	sw	a3,1812(a2) # 225714 <current_proc>
        : [satp] "r" (SATP_SV32 | ((uint32_t) next->page_table / PAGE_SIZE)),
  200ea8:	00c5d593          	srli	a1,a1,0xc
  200eac:	80000637          	lui	a2,0x80000
  200eb0:	00c5e5b3          	or	a1,a1,a2
  200eb4:	00002637          	lui	a2,0x2
  200eb8:	01060613          	addi	a2,a2,16 # 2010 <$d.6+0x2c>
          [sscratch] "r" ((uint32_t) &next->stack[sizeof(next->stack)])
  200ebc:	00c68633          	add	a2,a3,a2
    __asm__ __volatile__(
  200ec0:	12000073          	sfence.vma
  200ec4:	18059073          	csrw	satp,a1
  200ec8:	12000073          	sfence.vma
  200ecc:	14061073          	csrw	sscratch,a2
    switch_context(&prev->sp, &next->sp);
  200ed0:	00850513          	addi	a0,a0,8
  200ed4:	00868593          	addi	a1,a3,8
  200ed8:	fffff097          	auipc	ra,0xfffff
  200edc:	364080e7          	jalr	868(ra) # 20023c <switch_context>

00200ee0 <reboot>:
    __asm__ __volatile__(
  200ee0:	18001073          	csrw	satp,zero
  200ee4:	12000073          	sfence.vma
  200ee8:	0000100f          	.insn	4, 0x100f

00200eec <handle_syscall>:
void handle_syscall(struct trap_frame *f) {
  200eec:	ff010113          	addi	sp,sp,-16
  200ef0:	00112623          	sw	ra,12(sp)
    switch (f->a3) {             // ★ syscall番号は a3
  200ef4:	03554583          	lbu	a1,53(a0)
  200ef8:	03454603          	lbu	a2,52(a0)
  200efc:	03654683          	lbu	a3,54(a0)
  200f00:	03754703          	lbu	a4,55(a0)
  200f04:	00859593          	slli	a1,a1,0x8
  200f08:	00c5e5b3          	or	a1,a1,a2
  200f0c:	01069693          	slli	a3,a3,0x10
  200f10:	01871713          	slli	a4,a4,0x18
  200f14:	00d766b3          	or	a3,a4,a3
  200f18:	00b6e6b3          	or	a3,a3,a1
  200f1c:	fff68593          	addi	a1,a3,-1
  200f20:	00900613          	li	a2,9
  200f24:	10b66063          	bltu	a2,a1,201024 <handle_syscall+0x138>
  200f28:	00259593          	slli	a1,a1,0x2
  200f2c:	00203637          	lui	a2,0x203
  200f30:	c0860613          	addi	a2,a2,-1016 # 202c08 <$d.1>
  200f34:	00c585b3          	add	a1,a1,a2
  200f38:	0005a583          	lw	a1,0(a1)
  200f3c:	00058067          	jr	a1
            uart_putchar(f->a0);      // ★ 引数は a0
  200f40:	02854503          	lbu	a0,40(a0)
  200f44:	100005b7          	lui	a1,0x10000
  200f48:	0085a603          	lw	a2,8(a1) # 10000008 <__free_ram_end+0xfcaa008>
    while (mmio_r32(UART_MMIO_BASE + UART_ST) & ST_TX_BUSY) {
  200f4c:	00167613          	andi	a2,a2,1
  200f50:	0e060a63          	beqz	a2,201044 <handle_syscall+0x158>
        __asm__ __volatile__("nop");
  200f54:	00000013          	nop
  200f58:	ff1ff06f          	j	200f48 <handle_syscall+0x5c>
            s_print_int(f->a0);   // ← kernel の print_int
  200f5c:	02954583          	lbu	a1,41(a0)
  200f60:	02854603          	lbu	a2,40(a0)
  200f64:	02a54683          	lbu	a3,42(a0)
  200f68:	02b54503          	lbu	a0,43(a0)
  200f6c:	00859593          	slli	a1,a1,0x8
  200f70:	00c5e5b3          	or	a1,a1,a2
  200f74:	01069693          	slli	a3,a3,0x10
  200f78:	01851513          	slli	a0,a0,0x18
  200f7c:	00d56533          	or	a0,a0,a3
  200f80:	00b56533          	or	a0,a0,a1
  200f84:	00c12083          	lw	ra,12(sp)
  200f88:	01010113          	addi	sp,sp,16
  200f8c:	00000317          	auipc	t1,0x0
  200f90:	72830067          	jr	1832(t1) # 2016b4 <s_print_int>
                (const uint8_t *)(uint32_t)f->a0;
  200f94:	02954583          	lbu	a1,41(a0)
  200f98:	02854603          	lbu	a2,40(a0)
  200f9c:	02a54683          	lbu	a3,42(a0)
  200fa0:	02b54703          	lbu	a4,43(a0)
  200fa4:	00859593          	slli	a1,a1,0x8
  200fa8:	00c5e5b3          	or	a1,a1,a2
  200fac:	01069693          	slli	a3,a3,0x10
  200fb0:	01871713          	slli	a4,a4,0x18
  200fb4:	00d766b3          	or	a3,a4,a3
  200fb8:	00b6e733          	or	a4,a3,a1
                (const uint8_t *)(uint32_t)f->a1;
  200fbc:	02d54583          	lbu	a1,45(a0)
  200fc0:	02c54603          	lbu	a2,44(a0)
  200fc4:	02e54683          	lbu	a3,46(a0)
  200fc8:	02f54783          	lbu	a5,47(a0)
  200fcc:	00859593          	slli	a1,a1,0x8
  200fd0:	00c5e5b3          	or	a1,a1,a2
  200fd4:	01069693          	slli	a3,a3,0x10
  200fd8:	01879793          	slli	a5,a5,0x18
  200fdc:	00d7e6b3          	or	a3,a5,a3
                (uint32_t *)(uint32_t)f->a2;
  200fe0:	03154603          	lbu	a2,49(a0)
                (const uint8_t *)(uint32_t)f->a1;
  200fe4:	00b6e5b3          	or	a1,a3,a1
                (uint32_t *)(uint32_t)f->a2;
  200fe8:	03054683          	lbu	a3,48(a0)
  200fec:	03254783          	lbu	a5,50(a0)
  200ff0:	00861613          	slli	a2,a2,0x8
  200ff4:	03354803          	lbu	a6,51(a0)
  200ff8:	00d666b3          	or	a3,a2,a3
  200ffc:	01079793          	slli	a5,a5,0x10
                (uint8_t)f->a4;
  201000:	03854603          	lbu	a2,56(a0)
                (uint32_t *)(uint32_t)f->a2;
  201004:	01881813          	slli	a6,a6,0x18
  201008:	00f86533          	or	a0,a6,a5
  20100c:	00d566b3          	or	a3,a0,a3
            sa_run(in_A, in_B, max_matrix, out);
  201010:	00070513          	mv	a0,a4
  201014:	00c12083          	lw	ra,12(sp)
  201018:	01010113          	addi	sp,sp,16
  20101c:	00001317          	auipc	t1,0x1
  201020:	00830067          	jr	8(t1) # 202024 <sa_run>
            PANIC("unexpected syscall a3=%x\n", f->a3);
  201024:	00203537          	lui	a0,0x203
  201028:	09750513          	addi	a0,a0,151 # 203097 <$d.3+0x2e2>
  20102c:	002035b7          	lui	a1,0x203
  201030:	d2658593          	addi	a1,a1,-730 # 202d26 <$d.1+0x14>
  201034:	29100613          	li	a2,657
  201038:	00000097          	auipc	ra,0x0
  20103c:	778080e7          	jalr	1912(ra) # 2017b0 <s_printf>
  201040:	0000006f          	j	201040 <handle_syscall+0x154>
    *(volatile uint32_t*)addr = v;
  201044:	00a5a023          	sw	a0,0(a1)
  201048:	0300006f          	j	201078 <handle_syscall+0x18c>
  20104c:	100005b7          	lui	a1,0x10000
    return *(volatile uint32_t*)addr;
  201050:	0085a603          	lw	a2,8(a1) # 10000008 <__free_ram_end+0xfcaa008>
    while ((mmio_r32(UART_MMIO_BASE + UART_ST) & ST_RX_AVAIL) == 0) {
  201054:	00267613          	andi	a2,a2,2
  201058:	00061663          	bnez	a2,201064 <handle_syscall+0x178>
        __asm__ __volatile__("nop");
  20105c:	00000013          	nop
  201060:	ff1ff06f          	j	201050 <handle_syscall+0x164>
  201064:	0045a583          	lw	a1,4(a1)
                    f->a0 = ch;       // 戻り値
  201068:	020505a3          	sb	zero,43(a0)
  20106c:	02050523          	sb	zero,42(a0)
  201070:	020504a3          	sb	zero,41(a0)
  201074:	02b50423          	sb	a1,40(a0)
  201078:	00c12083          	lw	ra,12(sp)
}
  20107c:	01010113          	addi	sp,sp,16
  201080:	00008067          	ret
            s_call_sdcard_read_api(f->a0);
  201084:	02954583          	lbu	a1,41(a0)
  201088:	02854603          	lbu	a2,40(a0)
  20108c:	02a54683          	lbu	a3,42(a0)
  201090:	02b54503          	lbu	a0,43(a0)
  201094:	00859593          	slli	a1,a1,0x8
  201098:	00c5e5b3          	or	a1,a1,a2
  20109c:	01069693          	slli	a3,a3,0x10
  2010a0:	01851513          	slli	a0,a0,0x18
  2010a4:	00d56533          	or	a0,a0,a3
  2010a8:	00b56533          	or	a0,a0,a1
  2010ac:	00c12083          	lw	ra,12(sp)
  2010b0:	01010113          	addi	sp,sp,16
  2010b4:	00001317          	auipc	t1,0x1
  2010b8:	5a430067          	jr	1444(t1) # 202658 <s_call_sdcard_read_api>
            uintptr_t addr = (uintptr_t)f->a0;
  2010bc:	02954583          	lbu	a1,41(a0)
  2010c0:	02854603          	lbu	a2,40(a0)
            size_t    len  = (size_t)f->a1;
  2010c4:	02d54683          	lbu	a3,45(a0)
  2010c8:	02c54703          	lbu	a4,44(a0)
            uintptr_t addr = (uintptr_t)f->a0;
  2010cc:	00859593          	slli	a1,a1,0x8
  2010d0:	00c5e633          	or	a2,a1,a2
            size_t    len  = (size_t)f->a1;
  2010d4:	00869693          	slli	a3,a3,0x8
  2010d8:	00e6e6b3          	or	a3,a3,a4
  2010dc:	02e54583          	lbu	a1,46(a0)
  2010e0:	02f54703          	lbu	a4,47(a0)
            uintptr_t addr = (uintptr_t)f->a0;
  2010e4:	02a54783          	lbu	a5,42(a0)
  2010e8:	02b54503          	lbu	a0,43(a0)
            size_t    len  = (size_t)f->a1;
  2010ec:	01059593          	slli	a1,a1,0x10
  2010f0:	01871713          	slli	a4,a4,0x18
  2010f4:	00b765b3          	or	a1,a4,a1
            uintptr_t addr = (uintptr_t)f->a0;
  2010f8:	01079793          	slli	a5,a5,0x10
  2010fc:	01851513          	slli	a0,a0,0x18
            size_t    len  = (size_t)f->a1;
  201100:	00d5e6b3          	or	a3,a1,a3
  201104:	00001737          	lui	a4,0x1
            uintptr_t addr = (uintptr_t)f->a0;
  201108:	00f56533          	or	a0,a0,a5
  20110c:	00068593          	mv	a1,a3
            if (len == 0) {
  201110:	00e6e463          	bltu	a3,a4,201118 <handle_syscall+0x22c>
  201114:	000015b7          	lui	a1,0x1
  201118:	00c56533          	or	a0,a0,a2
  20111c:	00069463          	bnez	a3,201124 <handle_syscall+0x238>
  201120:	10000593          	li	a1,256
            hexdump((const void *)addr, len, addr);
  201124:	00050613          	mv	a2,a0
  201128:	00c12083          	lw	ra,12(sp)
  20112c:	01010113          	addi	sp,sp,16
  201130:	00001317          	auipc	t1,0x1
  201134:	a2430067          	jr	-1500(t1) # 201b54 <hexdump>
            s_printf("process %d exited\n", current_proc->pid);
  201138:	00225537          	lui	a0,0x225
  20113c:	71452503          	lw	a0,1812(a0) # 225714 <current_proc>
  201140:	00052583          	lw	a1,0(a0)
  201144:	00203537          	lui	a0,0x203
  201148:	26850513          	addi	a0,a0,616 # 203268 <$d.4+0x153>
  20114c:	00000097          	auipc	ra,0x0
  201150:	664080e7          	jalr	1636(ra) # 2017b0 <s_printf>
    __asm__ __volatile__(
  201154:	18001073          	csrw	satp,zero
  201158:	12000073          	sfence.vma
  20115c:	0000100f          	.insn	4, 0x100f

00201160 <handle_trap>:
{
  201160:	ff010113          	addi	sp,sp,-16
  201164:	00112623          	sw	ra,12(sp)
  201168:	00812423          	sw	s0,8(sp)
    uint32_t scause = READ_CSR(scause);
  20116c:	142026f3          	csrr	a3,scause
    uint32_t stval  = READ_CSR(stval);
  201170:	14302773          	csrr	a4,stval
    uint32_t sepc   = READ_CSR(sepc);
  201174:	14102473          	csrr	s0,sepc
    uint32_t sstatus = READ_CSR(sstatus);
  201178:	100027f3          	csrr	a5,sstatus
    if (scause == SCAUSE_ECALL) {
  20117c:	02068663          	beqz	a3,2011a8 <handle_trap+0x48>
  201180:	00800593          	li	a1,8
  201184:	04b69463          	bne	a3,a1,2011cc <handle_trap+0x6c>
        handle_syscall(f);
  201188:	00000097          	auipc	ra,0x0
  20118c:	d64080e7          	jalr	-668(ra) # 200eec <handle_syscall>
        sepc += 4;   // ecall の次へ
  201190:	00440413          	addi	s0,s0,4
        WRITE_CSR(sepc, sepc);
  201194:	14141073          	csrw	sepc,s0
  201198:	00c12083          	lw	ra,12(sp)
  20119c:	00812403          	lw	s0,8(sp)
}
  2011a0:	01010113          	addi	sp,sp,16
  2011a4:	00008067          	ret
        PANIC("PC misaligned sepc=%x stval=%x sstatus=%x\n",
  2011a8:	00203537          	lui	a0,0x203
  2011ac:	21450513          	addi	a0,a0,532 # 203214 <$d.4+0xff>
  2011b0:	002035b7          	lui	a1,0x203
  2011b4:	d2658593          	addi	a1,a1,-730 # 202d26 <$d.1+0x14>
  2011b8:	2b900613          	li	a2,697
  2011bc:	00040693          	mv	a3,s0
  2011c0:	00000097          	auipc	ra,0x0
  2011c4:	5f0080e7          	jalr	1520(ra) # 2017b0 <s_printf>
  2011c8:	0000006f          	j	2011c8 <handle_trap+0x68>
    PANIC("unexpected trap scause=%x stval=%x sepc=%x\n",
  2011cc:	00203537          	lui	a0,0x203
  2011d0:	d5e50513          	addi	a0,a0,-674 # 202d5e <$d.1+0x4c>
  2011d4:	002035b7          	lui	a1,0x203
  2011d8:	d2658593          	addi	a1,a1,-730 # 202d26 <$d.1+0x14>
  2011dc:	2bd00613          	li	a2,701
  2011e0:	00040793          	mv	a5,s0
  2011e4:	00000097          	auipc	ra,0x0
  2011e8:	5cc080e7          	jalr	1484(ra) # 2017b0 <s_printf>
  2011ec:	0000006f          	j	2011ec <handle_trap+0x8c>

002011f0 <random_mem_check>:
static inline uint32_t test_pattern(uint32_t addr) {
    return addr ^ 0xA5A5A5A5u;
}

void random_mem_check(uint32_t start_addr, uint32_t end_addr)
{
  2011f0:	fd010113          	addi	sp,sp,-48
  2011f4:	02112623          	sw	ra,44(sp)
  2011f8:	02812423          	sw	s0,40(sp)
  2011fc:	02912223          	sw	s1,36(sp)
  201200:	03212023          	sw	s2,32(sp)
  201204:	01312e23          	sw	s3,28(sp)
  201208:	01412c23          	sw	s4,24(sp)
  20120c:	01512a23          	sw	s5,20(sp)
  201210:	01612823          	sw	s6,16(sp)
  201214:	01712623          	sw	s7,12(sp)
  201218:	01812423          	sw	s8,8(sp)
  20121c:	00058613          	mv	a2,a1
  201220:	00050413          	mv	s0,a0
    bool TestPass = true;
    uint32_t lfsr;
    uint32_t addr;

    uint32_t range_bytes = end_addr - start_addr;
  201224:	40a58a33          	sub	s4,a1,a0
    uint32_t range_words = range_bytes / MEM_STEP;
  201228:	002a5493          	srli	s1,s4,0x2

    /* range_bytes must be power-of-two */
    uint32_t mask = range_bytes - MEM_STEP;

    s_printf("[mem_check] range %x - %x\n", start_addr, end_addr);
  20122c:	00203537          	lui	a0,0x203
  201230:	2cd50513          	addi	a0,a0,717 # 2032cd <$d.4+0x1b8>
  201234:	00040593          	mv	a1,s0
  201238:	00000097          	auipc	ra,0x0
  20123c:	578080e7          	jalr	1400(ra) # 2017b0 <s_printf>

    /* ================= write phase ================= */
    s_printf("[mem_check] random write phase\n");
  201240:	00203537          	lui	a0,0x203
  201244:	0d150513          	addi	a0,a0,209 # 2030d1 <$d.3+0x31c>
  201248:	00000097          	auipc	ra,0x0
  20124c:	568080e7          	jalr	1384(ra) # 2017b0 <s_printf>

    lfsr = 0x12345678u;

    for (uint32_t i = 0; i < range_words; i++)
  201250:	0c048e63          	beqz	s1,20132c <random_mem_check+0x13c>
  201254:	ffca0913          	addi	s2,s4,-4
  201258:	a5a5a537          	lui	a0,0xa5a5a
  20125c:	5a550993          	addi	s3,a0,1445 # a5a5a5a5 <__free_ram_end+0xa57045a5>
  201260:	0014ba93          	seqz	s5,s1
  201264:	01548533          	add	a0,s1,s5
  201268:	123455b7          	lui	a1,0x12345
  20126c:	67858613          	addi	a2,a1,1656 # 12345678 <__free_ram_end+0x11fef678>
  201270:	a30005b7          	lui	a1,0xa3000
    {
        addr = start_addr + (lfsr & mask);
  201274:	012676b3          	and	a3,a2,s2
  201278:	008686b3          	add	a3,a3,s0
    return addr ^ 0xA5A5A5A5u;
  20127c:	0136c733          	xor	a4,a3,s3

        *(volatile uint32_t *)addr = test_pattern(addr);
  201280:	00e6a023          	sw	a4,0(a3)
    uint32_t lsb = x & 1u;
  201284:	01f61693          	slli	a3,a2,0x1f
  201288:	41f6d693          	srai	a3,a3,0x1f
    x >>= 1;
  20128c:	00165613          	srli	a2,a2,0x1
    if (lsb) {
  201290:	00b6f6b3          	and	a3,a3,a1
    for (uint32_t i = 0; i < range_words; i++)
  201294:	fff50513          	addi	a0,a0,-1
    if (lsb) {
  201298:	00d64633          	xor	a2,a2,a3
    for (uint32_t i = 0; i < range_words; i++)
  20129c:	fc051ce3          	bnez	a0,201274 <random_mem_check+0x84>

        lfsr = lfsr_next(lfsr);
    }

    /* ================= read & verify ================= */
    s_printf("[mem_check] random read & verify phase\n");
  2012a0:	00203537          	lui	a0,0x203
  2012a4:	cb150513          	addi	a0,a0,-847 # 202cb1 <$d.1+0xa9>
  2012a8:	00000097          	auipc	ra,0x0
  2012ac:	508080e7          	jalr	1288(ra) # 2017b0 <s_printf>
  2012b0:	00400513          	li	a0,4

    lfsr = 0x12345678u;

    for (uint32_t i = 0; i < range_words; i++)
  2012b4:	08aa6863          	bltu	s4,a0,201344 <random_mem_check+0x154>
  2012b8:	01548a33          	add	s4,s1,s5
  2012bc:	00100513          	li	a0,1
  2012c0:	123455b7          	lui	a1,0x12345
  2012c4:	67858b13          	addi	s6,a1,1656 # 12345678 <__free_ram_end+0x11fef678>
  2012c8:	a3000ab7          	lui	s5,0xa3000
  2012cc:	002035b7          	lui	a1,0x203
  2012d0:	1c858493          	addi	s1,a1,456 # 2031c8 <$d.4+0xb3>
  2012d4:	0000f5b7          	lui	a1,0xf
  2012d8:	e0158b93          	addi	s7,a1,-511 # ee01 <$d.4+0xc694>
  2012dc:	10000c37          	lui	s8,0x10000
  2012e0:	0200006f          	j	201300 <random_mem_check+0x110>
    uint32_t lsb = x & 1u;
  2012e4:	01fb1593          	slli	a1,s6,0x1f
  2012e8:	41f5d593          	srai	a1,a1,0x1f
    x >>= 1;
  2012ec:	001b5613          	srli	a2,s6,0x1
    if (lsb) {
  2012f0:	0155f5b3          	and	a1,a1,s5
    for (uint32_t i = 0; i < range_words; i++)
  2012f4:	fffa0a13          	addi	s4,s4,-1
    if (lsb) {
  2012f8:	00b64b33          	xor	s6,a2,a1
    for (uint32_t i = 0; i < range_words; i++)
  2012fc:	040a0263          	beqz	s4,201340 <random_mem_check+0x150>
    {
        addr = start_addr + (lfsr & mask);
  201300:	012b75b3          	and	a1,s6,s2
  201304:	008585b3          	add	a1,a1,s0

        uint32_t v   = *(volatile uint32_t *)addr;
  201308:	0005a603          	lw	a2,0(a1)
    return addr ^ 0xA5A5A5A5u;
  20130c:	0135c6b3          	xor	a3,a1,s3
        uint32_t exp = test_pattern(addr);

        if (v != exp)
  201310:	fcd60ae3          	beq	a2,a3,2012e4 <random_mem_check+0xf4>
        {
            TestPass = false;

            s_printf("MEM ERROR addr=%x read=%x exp=%x\n",
  201314:	00048513          	mv	a0,s1
  201318:	00000097          	auipc	ra,0x0
  20131c:	498080e7          	jalr	1176(ra) # 2017b0 <s_printf>
  201320:	00000513          	li	a0,0
    *(volatile uint32_t*)addr = v;
  201324:	017c2023          	sw	s7,0(s8) # 10000000 <__free_ram_end+0xfcaa000>
  201328:	fbdff06f          	j	2012e4 <random_mem_check+0xf4>
    s_printf("[mem_check] random read & verify phase\n");
  20132c:	00203537          	lui	a0,0x203
  201330:	cb150513          	addi	a0,a0,-847 # 202cb1 <$d.1+0xa9>
  201334:	00000097          	auipc	ra,0x0
  201338:	47c080e7          	jalr	1148(ra) # 2017b0 <s_printf>
  20133c:	0080006f          	j	201344 <random_mem_check+0x154>
        lfsr = lfsr_next(lfsr);
    }

    /* ================= result ================= */

    if (TestPass)
  201340:	04050063          	beqz	a0,201380 <random_mem_check+0x190>
  201344:	00203537          	lui	a0,0x203
  201348:	ea150513          	addi	a0,a0,-351 # 202ea1 <$d.3+0xec>
  20134c:	02c12083          	lw	ra,44(sp)
  201350:	02812403          	lw	s0,40(sp)
  201354:	02412483          	lw	s1,36(sp)
  201358:	02012903          	lw	s2,32(sp)
  20135c:	01c12983          	lw	s3,28(sp)
  201360:	01812a03          	lw	s4,24(sp)
  201364:	01412a83          	lw	s5,20(sp)
  201368:	01012b03          	lw	s6,16(sp)
  20136c:	00c12b83          	lw	s7,12(sp)
  201370:	00812c03          	lw	s8,8(sp)
  201374:	03010113          	addi	sp,sp,48
  201378:	00000317          	auipc	t1,0x0
  20137c:	43830067          	jr	1080(t1) # 2017b0 <s_printf>
  201380:	00203537          	lui	a0,0x203
  201384:	ebe50513          	addi	a0,a0,-322 # 202ebe <$d.3+0x109>
  201388:	fc5ff06f          	j	20134c <random_mem_check+0x15c>

0020138c <seqential_mem_check>:
        s_printf("[mem_check] OK (RV32I safe)\n");
    else
        s_printf("[mem_check] NG!!! (RV32I fail)\n");
}

void seqential_mem_check(uint32_t start_addr, uint32_t end_addr) {
  20138c:	fd010113          	addi	sp,sp,-48
  201390:	02112623          	sw	ra,44(sp)
  201394:	02812423          	sw	s0,40(sp)
  201398:	02912223          	sw	s1,36(sp)
  20139c:	03212023          	sw	s2,32(sp)
  2013a0:	01312e23          	sw	s3,28(sp)
  2013a4:	01412c23          	sw	s4,24(sp)
  2013a8:	01512a23          	sw	s5,20(sp)
  2013ac:	01612823          	sw	s6,16(sp)
  2013b0:	01712623          	sw	s7,12(sp)
  2013b4:	00058613          	mv	a2,a1
  2013b8:	00050413          	mv	s0,a0
    volatile uint32_t *p;
    uint32_t lfsr;
    uint32_t addr;

    /* 範囲サイズ（バイト） */
    uint32_t range_bytes = end_addr - start_addr;
  2013bc:	40a589b3          	sub	s3,a1,a0

    s_printf("[mem_check] range %x - %x\n", start_addr, end_addr);
  2013c0:	00203537          	lui	a0,0x203
  2013c4:	2cd50513          	addi	a0,a0,717 # 2032cd <$d.4+0x1b8>
  2013c8:	00040593          	mv	a1,s0
  2013cc:	00000097          	auipc	ra,0x0
  2013d0:	3e4080e7          	jalr	996(ra) # 2017b0 <s_printf>

    /* ---------- write phase ---------- */
    s_printf("[mem_check] sequential write phase\n");
  2013d4:	00203537          	lui	a0,0x203
  2013d8:	13250513          	addi	a0,a0,306 # 203132 <$d.4+0x1d>
  2013dc:	00000097          	auipc	ra,0x0
  2013e0:	3d4080e7          	jalr	980(ra) # 2017b0 <s_printf>
  2013e4:	0029d493          	srli	s1,s3,0x2

    lfsr = 0x123456ABu;
    for (uint32_t i = 0; i < (range_bytes / MEM_STEP); i++) {
  2013e8:	0c048263          	beqz	s1,2014ac <seqential_mem_check+0x120>
  2013ec:	a5a5a537          	lui	a0,0xa5a5a
  2013f0:	5a550913          	addi	s2,a0,1445 # a5a5a5a5 <__free_ram_end+0xa57045a5>
  2013f4:	0014b513          	seqz	a0,s1
  2013f8:	00a48533          	add	a0,s1,a0
  2013fc:	00251513          	slli	a0,a0,0x2
  201400:	00a40533          	add	a0,s0,a0
  201404:	00040593          	mv	a1,s0
    return addr ^ 0xA5A5A5A5u;
  201408:	0125c633          	xor	a2,a1,s2
        addr = start_addr + i * MEM_STEP;

        p = (volatile uint32_t *)addr;
        *p = test_pattern(addr);
  20140c:	00c5a023          	sw	a2,0(a1)
    for (uint32_t i = 0; i < (range_bytes / MEM_STEP); i++) {
  201410:	00458593          	addi	a1,a1,4
  201414:	fea59ae3          	bne	a1,a0,201408 <seqential_mem_check+0x7c>

        lfsr = lfsr_next(lfsr);
    }

    /* ---------- read & verify ---------- */
    s_printf("[mem_check] sequential read & verify phase\n");
  201418:	00203537          	lui	a0,0x203
  20141c:	c5250513          	addi	a0,a0,-942 # 202c52 <$d.1+0x4a>
  201420:	00000097          	auipc	ra,0x0
  201424:	390080e7          	jalr	912(ra) # 2017b0 <s_printf>
  201428:	00400513          	li	a0,4

    lfsr = 0x123456ABu;
    for (uint32_t i = 0; i < (range_bytes / MEM_STEP); i++) {
  20142c:	08a9ee63          	bltu	s3,a0,2014c8 <seqential_mem_check+0x13c>
  201430:	00000993          	li	s3,0
  201434:	40900533          	neg	a0,s1
  201438:	0024b593          	sltiu	a1,s1,2
  20143c:	40b005b3          	neg	a1,a1
  201440:	00a5ea33          	or	s4,a1,a0
  201444:	00100a93          	li	s5,1
  201448:	00203537          	lui	a0,0x203
  20144c:	1c850493          	addi	s1,a0,456 # 2031c8 <$d.4+0xb3>
  201450:	0000f537          	lui	a0,0xf
  201454:	e0150b13          	addi	s6,a0,-511 # ee01 <$d.4+0xc694>
  201458:	10000bb7          	lui	s7,0x10000
  20145c:	00100513          	li	a0,1
  201460:	00299593          	slli	a1,s3,0x2
  201464:	00198993          	addi	s3,s3,1 # 4df001 <__free_ram_end+0x189001>
  201468:	00b405b3          	add	a1,s0,a1
        addr = start_addr + i * MEM_STEP;

        p = (volatile uint32_t *)addr;
        uint32_t v   = *p;
  20146c:	0005a603          	lw	a2,0(a1)
    return addr ^ 0xA5A5A5A5u;
  201470:	0125c6b3          	xor	a3,a1,s2
  201474:	00d61c63          	bne	a2,a3,20148c <seqential_mem_check+0x100>
    for (uint32_t i = 0; i < (range_bytes / MEM_STEP); i++) {
  201478:	00198993          	addi	s3,s3,1
  20147c:	013a0633          	add	a2,s4,s3
  201480:	00458593          	addi	a1,a1,4
  201484:	ff5614e3          	bne	a2,s5,20146c <seqential_mem_check+0xe0>
  201488:	0380006f          	j	2014c0 <seqential_mem_check+0x134>
        uint32_t exp = test_pattern(addr);

        if (v != exp) {
            TestPass = false;
            s_printf("MEM ERROR addr=%x read=%x exp=%x\n",
  20148c:	00048513          	mv	a0,s1
  201490:	00000097          	auipc	ra,0x0
  201494:	320080e7          	jalr	800(ra) # 2017b0 <s_printf>
  201498:	00000513          	li	a0,0
    for (uint32_t i = 0; i < (range_bytes / MEM_STEP); i++) {
  20149c:	013a05b3          	add	a1,s4,s3
  2014a0:	016ba023          	sw	s6,0(s7) # 10000000 <__free_ram_end+0xfcaa000>
  2014a4:	fa059ee3          	bnez	a1,201460 <seqential_mem_check+0xd4>
  2014a8:	0580006f          	j	201500 <seqential_mem_check+0x174>
    s_printf("[mem_check] sequential read & verify phase\n");
  2014ac:	00203537          	lui	a0,0x203
  2014b0:	c5250513          	addi	a0,a0,-942 # 202c52 <$d.1+0x4a>
  2014b4:	00000097          	auipc	ra,0x0
  2014b8:	2fc080e7          	jalr	764(ra) # 2017b0 <s_printf>
  2014bc:	00c0006f          	j	2014c8 <seqential_mem_check+0x13c>
        }

        lfsr = lfsr_next(lfsr);
    }

    if(TestPass==true) {
  2014c0:	00157513          	andi	a0,a0,1
  2014c4:	02050e63          	beqz	a0,201500 <seqential_mem_check+0x174>
  2014c8:	00203537          	lui	a0,0x203
  2014cc:	ea150513          	addi	a0,a0,-351 # 202ea1 <$d.3+0xec>
  2014d0:	02c12083          	lw	ra,44(sp)
  2014d4:	02812403          	lw	s0,40(sp)
  2014d8:	02412483          	lw	s1,36(sp)
  2014dc:	02012903          	lw	s2,32(sp)
  2014e0:	01c12983          	lw	s3,28(sp)
  2014e4:	01812a03          	lw	s4,24(sp)
  2014e8:	01412a83          	lw	s5,20(sp)
  2014ec:	01012b03          	lw	s6,16(sp)
  2014f0:	00c12b83          	lw	s7,12(sp)
  2014f4:	03010113          	addi	sp,sp,48
  2014f8:	00000317          	auipc	t1,0x0
  2014fc:	2b830067          	jr	696(t1) # 2017b0 <s_printf>
  201500:	00203537          	lui	a0,0x203
  201504:	ebe50513          	addi	a0,a0,-322 # 202ebe <$d.3+0x109>
  201508:	fc9ff06f          	j	2014d0 <seqential_mem_check+0x144>

0020150c <kernel_main>:

#define MAT_N 8

extern char __kernel_base[];

void kernel_main(void) {
  20150c:	ff010113          	addi	sp,sp,-16
  201510:	00112623          	sw	ra,12(sp)
    // compline number.
    s_printf("Ver: test_1.4.2\n");
  201514:	00203537          	lui	a0,0x203
  201518:	0c050513          	addi	a0,a0,192 # 2030c0 <$d.3+0x30b>
  20151c:	00000097          	auipc	ra,0x0
  201520:	294080e7          	jalr	660(ra) # 2017b0 <s_printf>

#if 1
    // Memory Check
    s_printf("\n");
  201524:	00203537          	lui	a0,0x203
  201528:	1ea50513          	addi	a0,a0,490 # 2031ea <$d.4+0xd5>
  20152c:	00000097          	auipc	ra,0x0
  201530:	284080e7          	jalr	644(ra) # 2017b0 <s_printf>
#if 0
    s_call_sa_api(MAT_N);
    s_printf("\n");
#endif
    // dump
    const char *argv[] = {
  201534:	00203537          	lui	a0,0x203
  201538:	c3452583          	lw	a1,-972(a0) # 202c34 <$d.1+0x2c>
  20153c:	c3052503          	lw	a0,-976(a0)
  201540:	00b12223          	sw	a1,4(sp)
  201544:	00a12023          	sw	a0,0(sp)
        "0x200000",
        "100",
    };

    cmd_dump(2, argv);
  201548:	00200513          	li	a0,2
  20154c:	00010593          	mv	a1,sp
  201550:	00001097          	auipc	ra,0x1
  201554:	884080e7          	jalr	-1916(ra) # 201dd4 <cmd_dump>
    //s_call_sdcard_read_api(0x0000);
    //s_call_sdcard_read_api(0x0010);
    //s_call_sdcard_read_api(0x0020);
    //s_call_sdcard_read_api(0x0030);

    s_printf("PSC_OS Boot Start.........\n");
  201558:	00203537          	lui	a0,0x203
  20155c:	d9950513          	addi	a0,a0,-615 # 202d99 <$d.1+0x87>
  201560:	00000097          	auipc	ra,0x0
  201564:	250080e7          	jalr	592(ra) # 2017b0 <s_printf>
    s_printf("--- memset ---\n");
  201568:	00203537          	lui	a0,0x203
  20156c:	c7e50513          	addi	a0,a0,-898 # 202c7e <$d.1+0x76>
  201570:	00000097          	auipc	ra,0x0
  201574:	240080e7          	jalr	576(ra) # 2017b0 <s_printf>
    memset(__bss, 0, (size_t) __bss_end - (size_t) __bss);
  201578:	00225537          	lui	a0,0x225
  20157c:	70850513          	addi	a0,a0,1800 # 225708 <alloc_pages.initialized>
  201580:	002365b7          	lui	a1,0x236
  201584:	b1458613          	addi	a2,a1,-1260 # 235b14 <__bss_end>
  201588:	40a60633          	sub	a2,a2,a0
  20158c:	00000593          	li	a1,0
  201590:	00000097          	auipc	ra,0x0
  201594:	104080e7          	jalr	260(ra) # 201694 <memset>

    s_printf(
  201598:	00203537          	lui	a0,0x203
  20159c:	ede50513          	addi	a0,a0,-290 # 202ede <$d.3+0x129>
  2015a0:	002035b7          	lui	a1,0x203
  2015a4:	15658593          	addi	a1,a1,342 # 203156 <$d.4+0x41>
  2015a8:	00203637          	lui	a2,0x203
  2015ac:	dea60613          	addi	a2,a2,-534 # 202dea <$d.3+0x35>
  2015b0:	00000097          	auipc	ra,0x0
  2015b4:	200080e7          	jalr	512(ra) # 2017b0 <s_printf>
       (uint32_t)__free_ram,
       (uint32_t)__free_ram_end);
    */

    // -------------------------------------------
    WRITE_CSR(stvec, (uint32_t) kernel_entry);
  2015b8:	00200537          	lui	a0,0x200
  2015bc:	12450513          	addi	a0,a0,292 # 200124 <kernel_entry>
  2015c0:	10551073          	csrw	stvec,a0

    //printf("================================================\n");
    s_printf("--- create_process_1 ---\n");
  2015c4:	00203537          	lui	a0,0x203
  2015c8:	c3850513          	addi	a0,a0,-968 # 202c38 <$d.1+0x30>
  2015cc:	00000097          	auipc	ra,0x0
  2015d0:	1e4080e7          	jalr	484(ra) # 2017b0 <s_printf>
    idle_proc = create_process(NULL, 0);
  2015d4:	00000513          	li	a0,0
  2015d8:	00000593          	li	a1,0
  2015dc:	fffff097          	auipc	ra,0xfffff
  2015e0:	e60080e7          	jalr	-416(ra) # 20043c <create_process>
  2015e4:	002255b7          	lui	a1,0x225
  2015e8:	70a5a823          	sw	a0,1808(a1) # 225710 <idle_proc>
    idle_proc->pid = 0; // idle
  2015ec:	00052023          	sw	zero,0(a0)
    current_proc = idle_proc;
  2015f0:	002255b7          	lui	a1,0x225
  2015f4:	70a5aa23          	sw	a0,1812(a1) # 225714 <current_proc>
    //   (uint32_t)_binary_shell_bin_start,
    //   (uint32_t)_binary_shell_bin_end);

    size_t shell_size = _binary_shell_bin_end - _binary_shell_bin_start;
    //printf("================================================\n");
    s_printf("--- create_process_2 ---\n");
  2015f8:	00203537          	lui	a0,0x203
  2015fc:	24e50513          	addi	a0,a0,590 # 20324e <$d.4+0x139>
  201600:	00000097          	auipc	ra,0x0
  201604:	1b0080e7          	jalr	432(ra) # 2017b0 <s_printf>
    create_process(_binary_shell_bin_start, shell_size);
  201608:	00203537          	lui	a0,0x203
  20160c:	37350513          	addi	a0,a0,883 # 203373 <_binary_shell_bin_start>
  201610:	002255b7          	lui	a1,0x225
  201614:	70358593          	addi	a1,a1,1795 # 225703 <_binary_shell_bin_end>
  201618:	40a585b3          	sub	a1,a1,a0
  20161c:	fffff097          	auipc	ra,0xfffff
  201620:	e20080e7          	jalr	-480(ra) # 20043c <create_process>

    //printf("================================================\n");
    s_printf("--- yield ---\n");
  201624:	00203537          	lui	a0,0x203
  201628:	c8e50513          	addi	a0,a0,-882 # 202c8e <$d.1+0x86>
  20162c:	00000097          	auipc	ra,0x0
  201630:	184080e7          	jalr	388(ra) # 2017b0 <s_printf>
    yield();
  201634:	fffff097          	auipc	ra,0xfffff
  201638:	624080e7          	jalr	1572(ra) # 200c58 <yield>

    //uint32_t satp_now = READ_CSR(satp);
    //printf("satp after yield = %x\n", satp_now);

    s_printf("--- yield end ---\n");
  20163c:	00203537          	lui	a0,0x203
  201640:	30a50513          	addi	a0,a0,778 # 20330a <$d.4+0x1f5>
  201644:	00000097          	auipc	ra,0x0
  201648:	16c080e7          	jalr	364(ra) # 2017b0 <s_printf>
    PANIC("switched to idle process");
  20164c:	00203537          	lui	a0,0x203
  201650:	1ec50513          	addi	a0,a0,492 # 2031ec <$d.4+0xd7>
  201654:	002035b7          	lui	a1,0x203
  201658:	d2658593          	addi	a1,a1,-730 # 202d26 <$d.1+0x14>
  20165c:	3a800613          	li	a2,936
  201660:	00000097          	auipc	ra,0x0
  201664:	150080e7          	jalr	336(ra) # 2017b0 <s_printf>
  201668:	0000006f          	j	201668 <kernel_main+0x15c>

0020166c <memcpy>:
#include "common.h"

void *memcpy(void *dst, const void *src, size_t n) {
    uint8_t *d = (uint8_t *) dst;
    const uint8_t *s = (const uint8_t *) src;
    while (n--)
  20166c:	02060263          	beqz	a2,201690 <memcpy+0x24>
  201670:	00c50633          	add	a2,a0,a2
  201674:	00050693          	mv	a3,a0
        *d++ = *s++;
  201678:	0005c703          	lbu	a4,0(a1)
  20167c:	00158593          	addi	a1,a1,1
  201680:	00168793          	addi	a5,a3,1
  201684:	00e68023          	sb	a4,0(a3)
  201688:	00078693          	mv	a3,a5
    while (n--)
  20168c:	fec796e3          	bne	a5,a2,201678 <memcpy+0xc>
    return dst;
  201690:	00008067          	ret

00201694 <memset>:
}
*/

void *memset(void *buf, char c, size_t n) {
    uint8_t *p = (uint8_t *) buf;
    while (n--)
  201694:	00060e63          	beqz	a2,2016b0 <memset+0x1c>
  201698:	00c50633          	add	a2,a0,a2
  20169c:	00050693          	mv	a3,a0
        *p++ = c;
  2016a0:	00168713          	addi	a4,a3,1
  2016a4:	00b68023          	sb	a1,0(a3)
  2016a8:	00070693          	mv	a3,a4
    while (n--)
  2016ac:	fec71ae3          	bne	a4,a2,2016a0 <memset+0xc>
    return buf;
  2016b0:	00008067          	ret

002016b4 <s_print_int>:
    *rem = r;
    return q;
}

void s_print_int(int v)
{
  2016b4:	fe010113          	addi	sp,sp,-32
  2016b8:	00112e23          	sw	ra,28(sp)
  2016bc:	00812c23          	sw	s0,24(sp)
  2016c0:	00912a23          	sw	s1,20(sp)
  2016c4:	01212823          	sw	s2,16(sp)
    uint32_t u;
    char buf[10];
    int idx = 0;

    if (v < 0) {
  2016c8:	02054463          	bltz	a0,2016f0 <s_print_int+0x3c>
        u = (uint32_t)(-(v + 1)) + 1u;
    } else {
        u = (uint32_t)v;
    }

    if (u == 0) {
  2016cc:	02051e63          	bnez	a0,201708 <s_print_int+0x54>
        uart_putchar('0');
  2016d0:	03000513          	li	a0,48
  2016d4:	01c12083          	lw	ra,28(sp)
  2016d8:	01812403          	lw	s0,24(sp)
  2016dc:	01412483          	lw	s1,20(sp)
  2016e0:	01012903          	lw	s2,16(sp)
  2016e4:	02010113          	addi	sp,sp,32
  2016e8:	fffff317          	auipc	t1,0xfffff
  2016ec:	94830067          	jr	-1720(t1) # 200030 <uart_putchar>
  2016f0:	00050413          	mv	s0,a0
        uart_putchar('-');
  2016f4:	02d00513          	li	a0,45
  2016f8:	fffff097          	auipc	ra,0xfffff
  2016fc:	938080e7          	jalr	-1736(ra) # 200030 <uart_putchar>
  201700:	00040513          	mv	a0,s0
        u = (uint32_t)(-(v + 1)) + 1u;
  201704:	40800533          	neg	a0,s0
  201708:	00000793          	li	a5,0
  20170c:	00100593          	li	a1,1
  201710:	fff00613          	li	a2,-1
  201714:	00610693          	addi	a3,sp,6
  201718:	00000813          	li	a6,0
  20171c:	00000713          	li	a4,0
  201720:	00078413          	mv	s0,a5
  201724:	01f00793          	li	a5,31
        r = (r << 1) | ((u >> i) & 1u);
  201728:	00181813          	slli	a6,a6,0x1
  20172c:	00f558b3          	srl	a7,a0,a5
  201730:	0018f893          	andi	a7,a7,1
  201734:	0108e833          	or	a6,a7,a6
        if (r >= 10u) {
  201738:	00a83893          	sltiu	a7,a6,10
  20173c:	00f592b3          	sll	t0,a1,a5
  201740:	fff88893          	addi	a7,a7,-1
  201744:	0058f2b3          	and	t0,a7,t0
  201748:	00e2e733          	or	a4,t0,a4
  20174c:	ff68f893          	andi	a7,a7,-10
    for (int i = 31; i >= 0; --i) {
  201750:	fff78793          	addi	a5,a5,-1
        if (r >= 10u) {
  201754:	01180833          	add	a6,a6,a7
    for (int i = 31; i >= 0; --i) {
  201758:	fcc798e3          	bne	a5,a2,201728 <s_print_int+0x74>
    }

    while (u != 0) {
        uint32_t rem;
        u = divmod10(u, &rem);
        buf[idx++] = (char)('0' + rem);
  20175c:	03080513          	addi	a0,a6,48
  201760:	00140793          	addi	a5,s0,1
  201764:	00868833          	add	a6,a3,s0
  201768:	00a80023          	sb	a0,0(a6)
  20176c:	00070513          	mv	a0,a4
    while (u != 0) {
  201770:	fa0714e3          	bnez	a4,201718 <s_print_int+0x64>
  201774:	00610493          	addi	s1,sp,6
  201778:	00100913          	li	s2,1
    }

    while (idx > 0) {
        uart_putchar(buf[--idx]);
  20177c:	00848533          	add	a0,s1,s0
  201780:	00054503          	lbu	a0,0(a0)
  201784:	fffff097          	auipc	ra,0xfffff
  201788:	8ac080e7          	jalr	-1876(ra) # 200030 <uart_putchar>
    while (idx > 0) {
  20178c:	00140513          	addi	a0,s0,1
  201790:	fff40413          	addi	s0,s0,-1
  201794:	fea944e3          	blt	s2,a0,20177c <s_print_int+0xc8>
  201798:	01c12083          	lw	ra,28(sp)
  20179c:	01812403          	lw	s0,24(sp)
  2017a0:	01412483          	lw	s1,20(sp)
  2017a4:	01012903          	lw	s2,16(sp)
    }
}
  2017a8:	02010113          	addi	sp,sp,32
  2017ac:	00008067          	ret

002017b0 <s_printf>:

void s_printf(const char *fmt, ...) {
  2017b0:	f9010113          	addi	sp,sp,-112
  2017b4:	04112623          	sw	ra,76(sp)
  2017b8:	04812423          	sw	s0,72(sp)
  2017bc:	04912223          	sw	s1,68(sp)
  2017c0:	05212023          	sw	s2,64(sp)
  2017c4:	03312e23          	sw	s3,60(sp)
  2017c8:	03412c23          	sw	s4,56(sp)
  2017cc:	03512a23          	sw	s5,52(sp)
  2017d0:	03612823          	sw	s6,48(sp)
  2017d4:	03712623          	sw	s7,44(sp)
  2017d8:	03812423          	sw	s8,40(sp)
  2017dc:	03912223          	sw	s9,36(sp)
  2017e0:	03a12023          	sw	s10,32(sp)
  2017e4:	01b12e23          	sw	s11,28(sp)
  2017e8:	00050413          	mv	s0,a0
  2017ec:	07112623          	sw	a7,108(sp)
  2017f0:	07012423          	sw	a6,104(sp)
  2017f4:	06f12223          	sw	a5,100(sp)
  2017f8:	06e12023          	sw	a4,96(sp)
  2017fc:	04d12e23          	sw	a3,92(sp)
  201800:	04c12c23          	sw	a2,88(sp)
  201804:	04b12a23          	sw	a1,84(sp)
  201808:	05410513          	addi	a0,sp,84
    va_list vargs;
    va_start(vargs, fmt);
  20180c:	00a12c23          	sw	a0,24(sp)
  201810:	02500913          	li	s2,37
  201814:	07200993          	li	s3,114
  201818:	06400493          	li	s1,100
  20181c:	00d10a93          	addi	s5,sp,13
  201820:	00900b13          	li	s6,9
  201824:	00100b93          	li	s7,1
  201828:	07300c13          	li	s8,115
  20182c:	07800c93          	li	s9,120
  201830:	00203537          	lui	a0,0x203
  201834:	31d50d13          	addi	s10,a0,797 # 20331d <print_hex8.HEX>
  201838:	00c0006f          	j	201844 <s_printf+0x94>

    while (*fmt) {
        if (*fmt == '%') {
            fmt++;
            switch (*fmt) {
  20183c:	20050263          	beqz	a0,201a40 <s_printf+0x290>
            }
        } else {
            uart_putchar(*fmt);
        }

        fmt++;
  201840:	001d8413          	addi	s0,s11,1
    while (*fmt) {
  201844:	00044503          	lbu	a0,0(s0)
  201848:	01250e63          	beq	a0,s2,201864 <s_printf+0xb4>
  20184c:	20050063          	beqz	a0,201a4c <s_printf+0x29c>
            uart_putchar(*fmt);
  201850:	ffffe097          	auipc	ra,0xffffe
  201854:	7e0080e7          	jalr	2016(ra) # 200030 <uart_putchar>
  201858:	00040d93          	mv	s11,s0
        fmt++;
  20185c:	00140413          	addi	s0,s0,1
  201860:	fe5ff06f          	j	201844 <s_printf+0x94>
            switch (*fmt) {
  201864:	00144503          	lbu	a0,1(s0)
            fmt++;
  201868:	00140d93          	addi	s11,s0,1
            switch (*fmt) {
  20186c:	02a9cc63          	blt	s3,a0,2018a4 <s_printf+0xf4>
  201870:	11250663          	beq	a0,s2,20197c <s_printf+0x1cc>
  201874:	fc9514e3          	bne	a0,s1,20183c <s_printf+0x8c>
                    int value = va_arg(vargs, int);
  201878:	01812503          	lw	a0,24(sp)
  20187c:	00450593          	addi	a1,a0,4
  201880:	00b12c23          	sw	a1,24(sp)
  201884:	00052403          	lw	s0,0(a0)
                    if (value < 0) {
  201888:	14044063          	bltz	s0,2019c8 <s_printf+0x218>
                    if (u == 0) {
  20188c:	14041663          	bnez	s0,2019d8 <s_printf+0x228>
                        uart_putchar('0');
  201890:	03000513          	li	a0,48
  201894:	ffffe097          	auipc	ra,0xffffe
  201898:	79c080e7          	jalr	1948(ra) # 200030 <uart_putchar>
        fmt++;
  20189c:	001d8413          	addi	s0,s11,1
  2018a0:	fa5ff06f          	j	201844 <s_printf+0x94>
            switch (*fmt) {
  2018a4:	0f850663          	beq	a0,s8,201990 <s_printf+0x1e0>
  2018a8:	f9951ce3          	bne	a0,s9,201840 <s_printf+0x90>
                    unsigned value = va_arg(vargs, unsigned);
  2018ac:	01812503          	lw	a0,24(sp)
  2018b0:	00450593          	addi	a1,a0,4
  2018b4:	00b12c23          	sw	a1,24(sp)
  2018b8:	00052403          	lw	s0,0(a0)
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  2018bc:	01c45513          	srli	a0,s0,0x1c
                        uart_putchar("0123456789abcdef"[nibble]);
  2018c0:	00ad0533          	add	a0,s10,a0
  2018c4:	00054503          	lbu	a0,0(a0)
  2018c8:	ffffe097          	auipc	ra,0xffffe
  2018cc:	768080e7          	jalr	1896(ra) # 200030 <uart_putchar>
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  2018d0:	00441513          	slli	a0,s0,0x4
  2018d4:	01c55513          	srli	a0,a0,0x1c
                        uart_putchar("0123456789abcdef"[nibble]);
  2018d8:	00ad0533          	add	a0,s10,a0
  2018dc:	00054503          	lbu	a0,0(a0)
  2018e0:	ffffe097          	auipc	ra,0xffffe
  2018e4:	750080e7          	jalr	1872(ra) # 200030 <uart_putchar>
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  2018e8:	00841513          	slli	a0,s0,0x8
  2018ec:	01c55513          	srli	a0,a0,0x1c
                        uart_putchar("0123456789abcdef"[nibble]);
  2018f0:	00ad0533          	add	a0,s10,a0
  2018f4:	00054503          	lbu	a0,0(a0)
  2018f8:	ffffe097          	auipc	ra,0xffffe
  2018fc:	738080e7          	jalr	1848(ra) # 200030 <uart_putchar>
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  201900:	00c41513          	slli	a0,s0,0xc
  201904:	01c55513          	srli	a0,a0,0x1c
                        uart_putchar("0123456789abcdef"[nibble]);
  201908:	00ad0533          	add	a0,s10,a0
  20190c:	00054503          	lbu	a0,0(a0)
  201910:	ffffe097          	auipc	ra,0xffffe
  201914:	720080e7          	jalr	1824(ra) # 200030 <uart_putchar>
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  201918:	01041513          	slli	a0,s0,0x10
  20191c:	01c55513          	srli	a0,a0,0x1c
                        uart_putchar("0123456789abcdef"[nibble]);
  201920:	00ad0533          	add	a0,s10,a0
  201924:	00054503          	lbu	a0,0(a0)
  201928:	ffffe097          	auipc	ra,0xffffe
  20192c:	708080e7          	jalr	1800(ra) # 200030 <uart_putchar>
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  201930:	01441513          	slli	a0,s0,0x14
  201934:	01c55513          	srli	a0,a0,0x1c
                        uart_putchar("0123456789abcdef"[nibble]);
  201938:	00ad0533          	add	a0,s10,a0
  20193c:	00054503          	lbu	a0,0(a0)
  201940:	ffffe097          	auipc	ra,0xffffe
  201944:	6f0080e7          	jalr	1776(ra) # 200030 <uart_putchar>
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  201948:	01841513          	slli	a0,s0,0x18
  20194c:	01c55513          	srli	a0,a0,0x1c
                        uart_putchar("0123456789abcdef"[nibble]);
  201950:	00ad0533          	add	a0,s10,a0
  201954:	00054503          	lbu	a0,0(a0)
  201958:	ffffe097          	auipc	ra,0xffffe
  20195c:	6d8080e7          	jalr	1752(ra) # 200030 <uart_putchar>
                        unsigned nibble = (value >> (i * 4)) & 0xf;
  201960:	00f47413          	andi	s0,s0,15
                        uart_putchar("0123456789abcdef"[nibble]);
  201964:	008d0433          	add	s0,s10,s0
  201968:	00044503          	lbu	a0,0(s0)
  20196c:	ffffe097          	auipc	ra,0xffffe
  201970:	6c4080e7          	jalr	1732(ra) # 200030 <uart_putchar>
        fmt++;
  201974:	001d8413          	addi	s0,s11,1
  201978:	ecdff06f          	j	201844 <s_printf+0x94>
                    uart_putchar('%');
  20197c:	02500513          	li	a0,37
  201980:	ffffe097          	auipc	ra,0xffffe
  201984:	6b0080e7          	jalr	1712(ra) # 200030 <uart_putchar>
        fmt++;
  201988:	001d8413          	addi	s0,s11,1
  20198c:	eb9ff06f          	j	201844 <s_printf+0x94>
                    const char *s = va_arg(vargs, const char *);
  201990:	01812503          	lw	a0,24(sp)
  201994:	00450593          	addi	a1,a0,4
  201998:	00b12c23          	sw	a1,24(sp)
  20199c:	00052403          	lw	s0,0(a0)
                    while (*s) {
  2019a0:	00044503          	lbu	a0,0(s0)
  2019a4:	e8050ee3          	beqz	a0,201840 <s_printf+0x90>
  2019a8:	00140413          	addi	s0,s0,1
                        uart_putchar(*s);
  2019ac:	0ff57513          	zext.b	a0,a0
  2019b0:	ffffe097          	auipc	ra,0xffffe
  2019b4:	680080e7          	jalr	1664(ra) # 200030 <uart_putchar>
                    while (*s) {
  2019b8:	00044503          	lbu	a0,0(s0)
  2019bc:	00140413          	addi	s0,s0,1
  2019c0:	fe0516e3          	bnez	a0,2019ac <s_printf+0x1fc>
  2019c4:	e7dff06f          	j	201840 <s_printf+0x90>
                        uart_putchar('-');
  2019c8:	02d00513          	li	a0,45
  2019cc:	ffffe097          	auipc	ra,0xffffe
  2019d0:	664080e7          	jalr	1636(ra) # 200030 <uart_putchar>
                        u = (unsigned int)(-(value + 1)) + 1;
  2019d4:	40800433          	neg	s0,s0
  2019d8:	00000513          	li	a0,0
  2019dc:	00040493          	mv	s1,s0
  2019e0:	00050a13          	mv	s4,a0
                        u /= 10;
  2019e4:	00a00593          	li	a1,10
  2019e8:	00040513          	mv	a0,s0
  2019ec:	00001097          	auipc	ra,0x1
  2019f0:	09c080e7          	jalr	156(ra) # 202a88 <__udivsi3>
  2019f4:	00050413          	mv	s0,a0
  2019f8:	00a00593          	li	a1,10
  2019fc:	00001097          	auipc	ra,0x1
  201a00:	060080e7          	jalr	96(ra) # 202a5c <__mulsi3>
  201a04:	40a48533          	sub	a0,s1,a0
                        buf[i++] = '0' + (u % 10);
  201a08:	03056593          	ori	a1,a0,48
  201a0c:	001a0513          	addi	a0,s4,1
  201a10:	014a8633          	add	a2,s5,s4
  201a14:	00b60023          	sb	a1,0(a2)
                    while (u > 0) {
  201a18:	fc9b62e3          	bltu	s6,s1,2019dc <s_printf+0x22c>
  201a1c:	06400493          	li	s1,100
                        uart_putchar(buf[--i]);
  201a20:	014a8533          	add	a0,s5,s4
  201a24:	00054503          	lbu	a0,0(a0)
  201a28:	ffffe097          	auipc	ra,0xffffe
  201a2c:	608080e7          	jalr	1544(ra) # 200030 <uart_putchar>
                    while (i > 0) {
  201a30:	001a0513          	addi	a0,s4,1
  201a34:	fffa0a13          	addi	s4,s4,-1
  201a38:	feabc4e3          	blt	s7,a0,201a20 <s_printf+0x270>
  201a3c:	e05ff06f          	j	201840 <s_printf+0x90>
                    uart_putchar('%');
  201a40:	02500513          	li	a0,37
  201a44:	ffffe097          	auipc	ra,0xffffe
  201a48:	5ec080e7          	jalr	1516(ra) # 200030 <uart_putchar>
  201a4c:	04c12083          	lw	ra,76(sp)
  201a50:	04812403          	lw	s0,72(sp)
  201a54:	04412483          	lw	s1,68(sp)
  201a58:	04012903          	lw	s2,64(sp)
  201a5c:	03c12983          	lw	s3,60(sp)
  201a60:	03812a03          	lw	s4,56(sp)
  201a64:	03412a83          	lw	s5,52(sp)
  201a68:	03012b03          	lw	s6,48(sp)
  201a6c:	02c12b83          	lw	s7,44(sp)
  201a70:	02812c03          	lw	s8,40(sp)
  201a74:	02412c83          	lw	s9,36(sp)
  201a78:	02012d03          	lw	s10,32(sp)
  201a7c:	01c12d83          	lw	s11,28(sp)
    }

end:
    va_end(vargs);
}
  201a80:	07010113          	addi	sp,sp,112
  201a84:	00008067          	ret

00201a88 <parse_hex>:
/* 簡易16進パーサ（"  0x1234" / "1234" 形式どちらも可） */
int parse_hex(const char *s, uintptr_t *out) {
    uintptr_t v = 0;

    /* skip leading spaces */
    while (*s == ' ' || *s == '\t') s++;
  201a88:	00250613          	addi	a2,a0,2
  201a8c:	00900693          	li	a3,9
  201a90:	02000713          	li	a4,32
  201a94:	0080006f          	j	201a9c <parse_hex+0x14>
  201a98:	00160613          	addi	a2,a2,1
  201a9c:	ffe64503          	lbu	a0,-2(a2)
  201aa0:	fed50ce3          	beq	a0,a3,201a98 <parse_hex+0x10>
  201aa4:	fee50ae3          	beq	a0,a4,201a98 <parse_hex+0x10>
  201aa8:	03000693          	li	a3,48
  201aac:	02d51063          	bne	a0,a3,201acc <parse_hex+0x44>

    /* optional 0x / 0X */
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  201ab0:	fff64503          	lbu	a0,-1(a2)
  201ab4:	02056513          	ori	a0,a0,32
  201ab8:	07800693          	li	a3,120
  201abc:	02d51063          	bne	a0,a3,201adc <parse_hex+0x54>
    if (!*s) return -1;
  201ac0:	00064503          	lbu	a0,0(a2)
  201ac4:	02051063          	bnez	a0,201ae4 <parse_hex+0x5c>
  201ac8:	00c0006f          	j	201ad4 <parse_hex+0x4c>
  201acc:	ffe60613          	addi	a2,a2,-2
  201ad0:	00051a63          	bnez	a0,201ae4 <parse_hex+0x5c>
  201ad4:	fff00513          	li	a0,-1
        else break;
        v = (v << 4) | d;
    }
    *out = v;
    return 0;
}
  201ad8:	00008067          	ret
  201adc:	ffe60613          	addi	a2,a2,-2
  201ae0:	03000513          	li	a0,48
  201ae4:	00000693          	li	a3,0
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  201ae8:	00160613          	addi	a2,a2,1
  201aec:	00a00713          	li	a4,10
  201af0:	00600793          	li	a5,6
  201af4:	00500813          	li	a6,5
  201af8:	0200006f          	j	201b18 <parse_hex+0x90>
  201afc:	0ff57293          	zext.b	t0,a0
    while (*s) {
  201b00:	00064503          	lbu	a0,0(a2)
  201b04:	005888b3          	add	a7,a7,t0
        v = (v << 4) | d;
  201b08:	00469693          	slli	a3,a3,0x4
  201b0c:	00d8e6b3          	or	a3,a7,a3
    while (*s) {
  201b10:	00160613          	addi	a2,a2,1
  201b14:	02050a63          	beqz	a0,201b48 <parse_hex+0xc0>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  201b18:	fd050893          	addi	a7,a0,-48
  201b1c:	0ff8f293          	zext.b	t0,a7
  201b20:	fd000893          	li	a7,-48
  201b24:	fce2ece3          	bltu	t0,a4,201afc <parse_hex+0x74>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  201b28:	f9f50893          	addi	a7,a0,-97
  201b2c:	0ff8f293          	zext.b	t0,a7
  201b30:	fa900893          	li	a7,-87
  201b34:	fcf2e4e3          	bltu	t0,a5,201afc <parse_hex+0x74>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  201b38:	fbf50893          	addi	a7,a0,-65
  201b3c:	0ff8f293          	zext.b	t0,a7
  201b40:	fc900893          	li	a7,-55
  201b44:	fa587ce3          	bgeu	a6,t0,201afc <parse_hex+0x74>
  201b48:	00000513          	li	a0,0
    *out = v;
  201b4c:	00d5a023          	sw	a3,0(a1)
}
  201b50:	00008067          	ret

00201b54 <hexdump>:
/* 汎用hexdump本体：
 *  - addr: 先頭アドレス（今のページテーブルで有効な仮想アドレス）
 *  - len : ダンプ長
 *  - base_addr_label: 行頭に表示するベースアドレス（通常は addr と同じ）
 */
void hexdump(const void *addr, size_t len, uintptr_t base_addr_label) {
  201b54:	fc010113          	addi	sp,sp,-64
  201b58:	02112e23          	sw	ra,60(sp)
  201b5c:	02812c23          	sw	s0,56(sp)
  201b60:	02912a23          	sw	s1,52(sp)
  201b64:	03212823          	sw	s2,48(sp)
  201b68:	03312623          	sw	s3,44(sp)
  201b6c:	03412423          	sw	s4,40(sp)
  201b70:	03512223          	sw	s5,36(sp)
  201b74:	03612023          	sw	s6,32(sp)
  201b78:	01712e23          	sw	s7,28(sp)
  201b7c:	01812c23          	sw	s8,24(sp)
  201b80:	01912a23          	sw	s9,20(sp)
  201b84:	01a12823          	sw	s10,16(sp)
  201b88:	01b12623          	sw	s11,12(sp)
  201b8c:	00c12423          	sw	a2,8(sp)
    const uint8_t *p = (const uint8_t *)addr;
    size_t off = 0;

    while (off < len) {
  201b90:	20058463          	beqz	a1,201d98 <hexdump+0x244>
  201b94:	00058493          	mv	s1,a1
  201b98:	00050913          	mv	s2,a0
  201b9c:	00000a93          	li	s5,0
  201ba0:	00203537          	lui	a0,0x203
  201ba4:	31d50b13          	addi	s6,a0,797 # 20331d <print_hex8.HEX>
  201ba8:	00203537          	lui	a0,0x203
  201bac:	35350993          	addi	s3,a0,851 # 203353 <$d.1>
  201bb0:	00700b93          	li	s7,7
  201bb4:	01000c13          	li	s8,16
  201bb8:	05f00c93          	li	s9,95
  201bbc:	0240006f          	j	201be0 <hexdump+0x8c>
        uart_putchar('|');
        for (size_t i = 0; i < line; i++) {
            uint8_t c = p[off + i];
            uart_putchar((c >= 0x20 && c <= 0x7e) ? (char)c : '.');
        }
        uart_putchar('|');
  201bc0:	07c00513          	li	a0,124
  201bc4:	ffffe097          	auipc	ra,0xffffe
  201bc8:	46c080e7          	jalr	1132(ra) # 200030 <uart_putchar>
        uart_putchar('\n');
  201bcc:	00a00513          	li	a0,10
  201bd0:	ffffe097          	auipc	ra,0xffffe
  201bd4:	460080e7          	jalr	1120(ra) # 200030 <uart_putchar>

        off += line;
  201bd8:	015d0ab3          	add	s5,s10,s5
  201bdc:	1a9afe63          	bgeu	s5,s1,201d98 <hexdump+0x244>
  201be0:	00812a03          	lw	s4,8(sp)
        print_hex32((uint32_t)(base_addr_label + off));
  201be4:	014a8a33          	add	s4,s5,s4
        uint8_t nib = (v >> (i * 4)) & 0x0F;
  201be8:	01ca5513          	srli	a0,s4,0x1c
        uart_putchar(HEX[nib]);
  201bec:	00ab0533          	add	a0,s6,a0
  201bf0:	00054503          	lbu	a0,0(a0)
        size_t line = (len - off > 16) ? 16 : (len - off);
  201bf4:	41548d33          	sub	s10,s1,s5
        uart_putchar(HEX[nib]);
  201bf8:	ffffe097          	auipc	ra,0xffffe
  201bfc:	438080e7          	jalr	1080(ra) # 200030 <uart_putchar>
        uint8_t nib = (v >> (i * 4)) & 0x0F;
  201c00:	004a1513          	slli	a0,s4,0x4
  201c04:	01c55513          	srli	a0,a0,0x1c
        uart_putchar(HEX[nib]);
  201c08:	00ab0533          	add	a0,s6,a0
  201c0c:	00054503          	lbu	a0,0(a0)
  201c10:	ffffe097          	auipc	ra,0xffffe
  201c14:	420080e7          	jalr	1056(ra) # 200030 <uart_putchar>
        uint8_t nib = (v >> (i * 4)) & 0x0F;
  201c18:	008a1513          	slli	a0,s4,0x8
  201c1c:	01c55513          	srli	a0,a0,0x1c
        uart_putchar(HEX[nib]);
  201c20:	00ab0533          	add	a0,s6,a0
  201c24:	00054503          	lbu	a0,0(a0)
  201c28:	ffffe097          	auipc	ra,0xffffe
  201c2c:	408080e7          	jalr	1032(ra) # 200030 <uart_putchar>
        uint8_t nib = (v >> (i * 4)) & 0x0F;
  201c30:	00ca1513          	slli	a0,s4,0xc
  201c34:	01c55513          	srli	a0,a0,0x1c
        uart_putchar(HEX[nib]);
  201c38:	00ab0533          	add	a0,s6,a0
  201c3c:	00054503          	lbu	a0,0(a0)
  201c40:	ffffe097          	auipc	ra,0xffffe
  201c44:	3f0080e7          	jalr	1008(ra) # 200030 <uart_putchar>
        uint8_t nib = (v >> (i * 4)) & 0x0F;
  201c48:	010a1513          	slli	a0,s4,0x10
  201c4c:	01c55513          	srli	a0,a0,0x1c
        uart_putchar(HEX[nib]);
  201c50:	00ab0533          	add	a0,s6,a0
  201c54:	00054503          	lbu	a0,0(a0)
  201c58:	ffffe097          	auipc	ra,0xffffe
  201c5c:	3d8080e7          	jalr	984(ra) # 200030 <uart_putchar>
        uint8_t nib = (v >> (i * 4)) & 0x0F;
  201c60:	014a1513          	slli	a0,s4,0x14
  201c64:	01c55513          	srli	a0,a0,0x1c
        uart_putchar(HEX[nib]);
  201c68:	00ab0533          	add	a0,s6,a0
  201c6c:	00054503          	lbu	a0,0(a0)
  201c70:	ffffe097          	auipc	ra,0xffffe
  201c74:	3c0080e7          	jalr	960(ra) # 200030 <uart_putchar>
        uint8_t nib = (v >> (i * 4)) & 0x0F;
  201c78:	018a1513          	slli	a0,s4,0x18
  201c7c:	01c55513          	srli	a0,a0,0x1c
        uart_putchar(HEX[nib]);
  201c80:	00ab0533          	add	a0,s6,a0
  201c84:	00054503          	lbu	a0,0(a0)
  201c88:	ffffe097          	auipc	ra,0xffffe
  201c8c:	3a8080e7          	jalr	936(ra) # 200030 <uart_putchar>
        uint8_t nib = (v >> (i * 4)) & 0x0F;
  201c90:	00fa7513          	andi	a0,s4,15
        uart_putchar(HEX[nib]);
  201c94:	00ab0533          	add	a0,s6,a0
  201c98:	00054503          	lbu	a0,0(a0)
  201c9c:	ffffe097          	auipc	ra,0xffffe
  201ca0:	394080e7          	jalr	916(ra) # 200030 <uart_putchar>
        s_printf(": ");
  201ca4:	00098513          	mv	a0,s3
  201ca8:	00000097          	auipc	ra,0x0
  201cac:	b08080e7          	jalr	-1272(ra) # 2017b0 <s_printf>
  201cb0:	00000413          	li	s0,0
  201cb4:	01590db3          	add	s11,s2,s5
  201cb8:	00c0006f          	j	201cc4 <hexdump+0x170>
        for (size_t i = 0; i < 16; i++) {
  201cbc:	00140413          	addi	s0,s0,1
  201cc0:	07840863          	beq	s0,s8,201d30 <hexdump+0x1dc>
  201cc4:	03a47863          	bgeu	s0,s10,201cf4 <hexdump+0x1a0>
                print_hex8(p[off + i]);
  201cc8:	008d8533          	add	a0,s11,s0
  201ccc:	00054a03          	lbu	s4,0(a0)
  201cd0:	004a5513          	srli	a0,s4,0x4
    uart_putchar(HEX[v >> 4]);
  201cd4:	00ab0533          	add	a0,s6,a0
  201cd8:	00054503          	lbu	a0,0(a0)
  201cdc:	ffffe097          	auipc	ra,0xffffe
  201ce0:	354080e7          	jalr	852(ra) # 200030 <uart_putchar>
    uart_putchar(HEX[v & 0x0F]);
  201ce4:	00fa7513          	andi	a0,s4,15
  201ce8:	00ab0533          	add	a0,s6,a0
  201cec:	00054a03          	lbu	s4,0(a0)
  201cf0:	0140006f          	j	201d04 <hexdump+0x1b0>
                uart_putchar(' ');
  201cf4:	02000513          	li	a0,32
  201cf8:	02000a13          	li	s4,32
  201cfc:	ffffe097          	auipc	ra,0xffffe
  201d00:	334080e7          	jalr	820(ra) # 200030 <uart_putchar>
  201d04:	000a0513          	mv	a0,s4
  201d08:	ffffe097          	auipc	ra,0xffffe
  201d0c:	328080e7          	jalr	808(ra) # 200030 <uart_putchar>
            uart_putchar(' ');
  201d10:	02000513          	li	a0,32
  201d14:	ffffe097          	auipc	ra,0xffffe
  201d18:	31c080e7          	jalr	796(ra) # 200030 <uart_putchar>
            if (i == 7) uart_putchar(' '); /* 8バイト境界でスペース追加 */
  201d1c:	fb7410e3          	bne	s0,s7,201cbc <hexdump+0x168>
  201d20:	02000513          	li	a0,32
  201d24:	ffffe097          	auipc	ra,0xffffe
  201d28:	30c080e7          	jalr	780(ra) # 200030 <uart_putchar>
  201d2c:	f91ff06f          	j	201cbc <hexdump+0x168>
  201d30:	01000513          	li	a0,16
        size_t line = (len - off > 16) ? 16 : (len - off);
  201d34:	00ad6463          	bltu	s10,a0,201d3c <hexdump+0x1e8>
  201d38:	01000d13          	li	s10,16
        uart_putchar(' ');
  201d3c:	02000513          	li	a0,32
  201d40:	ffffe097          	auipc	ra,0xffffe
  201d44:	2f0080e7          	jalr	752(ra) # 200030 <uart_putchar>
        uart_putchar('|');
  201d48:	07c00513          	li	a0,124
  201d4c:	ffffe097          	auipc	ra,0xffffe
  201d50:	2e4080e7          	jalr	740(ra) # 200030 <uart_putchar>
        for (size_t i = 0; i < line; i++) {
  201d54:	e75486e3          	beq	s1,s5,201bc0 <hexdump+0x6c>
  201d58:	001d3513          	seqz	a0,s10
  201d5c:	01aa85b3          	add	a1,s5,s10
  201d60:	00a58533          	add	a0,a1,a0
  201d64:	00a90433          	add	s0,s2,a0
  201d68:	0180006f          	j	201d80 <hexdump+0x22c>
            uart_putchar((c >= 0x20 && c <= 0x7e) ? (char)c : '.');
  201d6c:	0ff57513          	zext.b	a0,a0
  201d70:	ffffe097          	auipc	ra,0xffffe
  201d74:	2c0080e7          	jalr	704(ra) # 200030 <uart_putchar>
        for (size_t i = 0; i < line; i++) {
  201d78:	001d8d93          	addi	s11,s11,1
  201d7c:	e48d82e3          	beq	s11,s0,201bc0 <hexdump+0x6c>
            uint8_t c = p[off + i];
  201d80:	000dc503          	lbu	a0,0(s11)
            uart_putchar((c >= 0x20 && c <= 0x7e) ? (char)c : '.');
  201d84:	fe050593          	addi	a1,a0,-32
  201d88:	0ff5f593          	zext.b	a1,a1
  201d8c:	ff95e0e3          	bltu	a1,s9,201d6c <hexdump+0x218>
  201d90:	02e00513          	li	a0,46
  201d94:	fd9ff06f          	j	201d6c <hexdump+0x218>
  201d98:	03c12083          	lw	ra,60(sp)
  201d9c:	03812403          	lw	s0,56(sp)
  201da0:	03412483          	lw	s1,52(sp)
  201da4:	03012903          	lw	s2,48(sp)
  201da8:	02c12983          	lw	s3,44(sp)
  201dac:	02812a03          	lw	s4,40(sp)
  201db0:	02412a83          	lw	s5,36(sp)
  201db4:	02012b03          	lw	s6,32(sp)
  201db8:	01c12b83          	lw	s7,28(sp)
  201dbc:	01812c03          	lw	s8,24(sp)
  201dc0:	01412c83          	lw	s9,20(sp)
  201dc4:	01012d03          	lw	s10,16(sp)
  201dc8:	00c12d83          	lw	s11,12(sp)
    }
}
  201dcc:	04010113          	addi	sp,sp,64
  201dd0:	00008067          	ret

00201dd4 <cmd_dump>:

void cmd_dump(int argc, const char **argv) {
  201dd4:	ff010113          	addi	sp,sp,-16
  201dd8:	00112623          	sw	ra,12(sp)
  201ddc:	00812423          	sw	s0,8(sp)
  201de0:	00000413          	li	s0,0
    const size_t    MAX_LEN      = 0x1000u;      /* 誤爆防止の上限 */

    uintptr_t addr = DEFAULT_BASE;
    size_t    len  = DEFAULT_LEN;

    if (argc >= 1 && argv && argv[0] && argv[0][0]) {
  201de4:	06a05463          	blez	a0,201e4c <cmd_dump+0x78>
  201de8:	06058263          	beqz	a1,201e4c <cmd_dump+0x78>
  201dec:	0005a683          	lw	a3,0(a1)
  201df0:	04068c63          	beqz	a3,201e48 <cmd_dump+0x74>
  201df4:	0006c603          	lbu	a2,0(a3)
  201df8:	04060863          	beqz	a2,201e48 <cmd_dump+0x74>
    while (*s == ' ' || *s == '\t') s++;
  201dfc:	00268693          	addi	a3,a3,2
  201e00:	00900713          	li	a4,9
  201e04:	02000793          	li	a5,32
  201e08:	00c0006f          	j	201e14 <cmd_dump+0x40>
  201e0c:	fff6c603          	lbu	a2,-1(a3)
  201e10:	00168693          	addi	a3,a3,1
  201e14:	0ff67813          	zext.b	a6,a2
  201e18:	fee80ae3          	beq	a6,a4,201e0c <cmd_dump+0x38>
  201e1c:	fef808e3          	beq	a6,a5,201e0c <cmd_dump+0x38>
  201e20:	03000713          	li	a4,48
  201e24:	08e81a63          	bne	a6,a4,201eb8 <cmd_dump+0xe4>
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  201e28:	fff6c603          	lbu	a2,-1(a3)
  201e2c:	02066613          	ori	a2,a2,32
  201e30:	07800713          	li	a4,120
  201e34:	0ce61263          	bne	a2,a4,201ef8 <cmd_dump+0x124>
    if (!*s) return -1;
  201e38:	0006c603          	lbu	a2,0(a3)
  201e3c:	0ff67713          	zext.b	a4,a2
  201e40:	0c071063          	bnez	a4,201f00 <cmd_dump+0x12c>
  201e44:	0800006f          	j	201ec4 <cmd_dump+0xf0>
  201e48:	00000413          	li	s0,0
  201e4c:	00200693          	li	a3,2
  201e50:	10000613          	li	a2,256
  201e54:	1ad54863          	blt	a0,a3,202004 <cmd_dump+0x230>
  201e58:	1a058663          	beqz	a1,202004 <cmd_dump+0x230>
            s_printf("usage: dmp [offset_hex] [len_hex]\n");
            return;
        }
        addr = DEFAULT_BASE + offset;
    }
    if (argc >= 2 && argv && argv[1] && argv[1][0]) {
  201e5c:	0045a583          	lw	a1,4(a1)
  201e60:	1a058263          	beqz	a1,202004 <cmd_dump+0x230>
  201e64:	0005c503          	lbu	a0,0(a1)
  201e68:	18050e63          	beqz	a0,202004 <cmd_dump+0x230>
    while (*s == ' ' || *s == '\t') s++;
  201e6c:	00258593          	addi	a1,a1,2
  201e70:	00900693          	li	a3,9
  201e74:	02000713          	li	a4,32
  201e78:	00c0006f          	j	201e84 <cmd_dump+0xb0>
  201e7c:	fff5c503          	lbu	a0,-1(a1)
  201e80:	00158593          	addi	a1,a1,1
  201e84:	0ff57793          	zext.b	a5,a0
  201e88:	fed78ae3          	beq	a5,a3,201e7c <cmd_dump+0xa8>
  201e8c:	fee788e3          	beq	a5,a4,201e7c <cmd_dump+0xa8>
  201e90:	03000693          	li	a3,48
  201e94:	02d79e63          	bne	a5,a3,201ed0 <cmd_dump+0xfc>
    if (s[0] == '0' && (s[1] == 'x' || s[1] == 'X')) s += 2;
  201e98:	fff5c503          	lbu	a0,-1(a1)
  201e9c:	02056513          	ori	a0,a0,32
  201ea0:	07800693          	li	a3,120
  201ea4:	0cd51263          	bne	a0,a3,201f68 <cmd_dump+0x194>
    if (!*s) return -1;
  201ea8:	0005c503          	lbu	a0,0(a1)
  201eac:	0ff57693          	zext.b	a3,a0
  201eb0:	0c069063          	bnez	a3,201f70 <cmd_dump+0x19c>
  201eb4:	0280006f          	j	201edc <cmd_dump+0x108>
  201eb8:	ffe68693          	addi	a3,a3,-2
  201ebc:	0ff67713          	zext.b	a4,a2
  201ec0:	04071063          	bnez	a4,201f00 <cmd_dump+0x12c>
            s_printf("usage: dmp [offset_hex] [len_hex]\n");
  201ec4:	00203537          	lui	a0,0x203
  201ec8:	27b50513          	addi	a0,a0,635 # 20327b <$d.4+0x166>
  201ecc:	0180006f          	j	201ee4 <cmd_dump+0x110>
    if (!*s) return -1;
  201ed0:	ffe58593          	addi	a1,a1,-2
  201ed4:	0ff57693          	zext.b	a3,a0
  201ed8:	08069c63          	bnez	a3,201f70 <cmd_dump+0x19c>
        uintptr_t lhex = 0;
        if (parse_hex(argv[1], &lhex) != 0) {
            s_printf("usage: dump [offset_hex] [len_hex]\n");
  201edc:	00203537          	lui	a0,0x203
  201ee0:	cdd50513          	addi	a0,a0,-803 # 202cdd <$d.1+0xd5>
  201ee4:	00c12083          	lw	ra,12(sp)
  201ee8:	00812403          	lw	s0,8(sp)
  201eec:	01010113          	addi	sp,sp,16
  201ef0:	00000317          	auipc	t1,0x0
  201ef4:	8c030067          	jr	-1856(t1) # 2017b0 <s_printf>
  201ef8:	ffe68693          	addi	a3,a3,-2
  201efc:	03000613          	li	a2,48
  201f00:	00000413          	li	s0,0
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  201f04:	00168693          	addi	a3,a3,1
  201f08:	00a00713          	li	a4,10
  201f0c:	00600793          	li	a5,6
  201f10:	00500813          	li	a6,5
  201f14:	0200006f          	j	201f34 <cmd_dump+0x160>
  201f18:	0ff67293          	zext.b	t0,a2
    while (*s) {
  201f1c:	0006c603          	lbu	a2,0(a3)
  201f20:	005888b3          	add	a7,a7,t0
        v = (v << 4) | d;
  201f24:	00441413          	slli	s0,s0,0x4
  201f28:	0088e433          	or	s0,a7,s0
    while (*s) {
  201f2c:	00168693          	addi	a3,a3,1
  201f30:	f0060ee3          	beqz	a2,201e4c <cmd_dump+0x78>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  201f34:	fd060893          	addi	a7,a2,-48
  201f38:	0ff8f293          	zext.b	t0,a7
  201f3c:	fd000893          	li	a7,-48
  201f40:	fce2ece3          	bltu	t0,a4,201f18 <cmd_dump+0x144>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  201f44:	f9f60893          	addi	a7,a2,-97
  201f48:	0ff8f293          	zext.b	t0,a7
  201f4c:	fa900893          	li	a7,-87
  201f50:	fcf2e4e3          	bltu	t0,a5,201f18 <cmd_dump+0x144>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  201f54:	fbf60893          	addi	a7,a2,-65
  201f58:	0ff8f293          	zext.b	t0,a7
  201f5c:	fc900893          	li	a7,-55
  201f60:	fa587ce3          	bgeu	a6,t0,201f18 <cmd_dump+0x144>
  201f64:	ee9ff06f          	j	201e4c <cmd_dump+0x78>
  201f68:	ffe58593          	addi	a1,a1,-2
  201f6c:	03000513          	li	a0,48
  201f70:	00000693          	li	a3,0
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  201f74:	00158593          	addi	a1,a1,1
  201f78:	00a00713          	li	a4,10
  201f7c:	00600793          	li	a5,6
  201f80:	00500813          	li	a6,5
  201f84:	0200006f          	j	201fa4 <cmd_dump+0x1d0>
  201f88:	0ff57293          	zext.b	t0,a0
    while (*s) {
  201f8c:	0005c503          	lbu	a0,0(a1)
  201f90:	005888b3          	add	a7,a7,t0
        v = (v << 4) | d;
  201f94:	00469693          	slli	a3,a3,0x4
  201f98:	00d8e6b3          	or	a3,a7,a3
    while (*s) {
  201f9c:	00158593          	addi	a1,a1,1
  201fa0:	02050a63          	beqz	a0,201fd4 <cmd_dump+0x200>
        if (c >= '0' && c <= '9') d = (uint32_t)(c - '0');
  201fa4:	fd050893          	addi	a7,a0,-48
  201fa8:	0ff8f293          	zext.b	t0,a7
  201fac:	fd000893          	li	a7,-48
  201fb0:	fce2ece3          	bltu	t0,a4,201f88 <cmd_dump+0x1b4>
        else if (c >= 'a' && c <= 'f') d = 10u + (uint32_t)(c - 'a');
  201fb4:	f9f50893          	addi	a7,a0,-97
  201fb8:	0ff8f293          	zext.b	t0,a7
  201fbc:	fa900893          	li	a7,-87
  201fc0:	fcf2e4e3          	bltu	t0,a5,201f88 <cmd_dump+0x1b4>
        else if (c >= 'A' && c <= 'F') d = 10u + (uint32_t)(c - 'A');
  201fc4:	fbf50893          	addi	a7,a0,-65
  201fc8:	0ff8f293          	zext.b	t0,a7
  201fcc:	fc900893          	li	a7,-55
  201fd0:	fa587ce3          	bgeu	a6,t0,201f88 <cmd_dump+0x1b4>
            return;
        }
        len = (size_t)lhex;
    }

    if (len == 0) {
  201fd4:	02068863          	beqz	a3,202004 <cmd_dump+0x230>
  201fd8:	00001537          	lui	a0,0x1
  201fdc:	00150513          	addi	a0,a0,1 # 1001 <$d.3+0x87b>
  201fe0:	00068613          	mv	a2,a3
        len = DEFAULT_LEN;
    } else if (len > MAX_LEN) {
  201fe4:	02a6e063          	bltu	a3,a0,202004 <cmd_dump+0x230>
        s_printf("[info] len too big (>0x%X), round down to 0x%X\n",
  201fe8:	00203537          	lui	a0,0x203
  201fec:	16250513          	addi	a0,a0,354 # 203162 <$d.4+0x4d>
  201ff0:	000015b7          	lui	a1,0x1
  201ff4:	00001637          	lui	a2,0x1
  201ff8:	fffff097          	auipc	ra,0xfffff
  201ffc:	7b8080e7          	jalr	1976(ra) # 2017b0 <s_printf>
  202000:	00001637          	lui	a2,0x1
               (unsigned)MAX_LEN, (unsigned)MAX_LEN);
        len = MAX_LEN;
    }

    hexdump((const void *)addr, len, addr);
  202004:	00040513          	mv	a0,s0
  202008:	00060593          	mv	a1,a2
  20200c:	00040613          	mv	a2,s0
  202010:	00c12083          	lw	ra,12(sp)
  202014:	00812403          	lw	s0,8(sp)
  202018:	01010113          	addi	sp,sp,16
  20201c:	00000317          	auipc	t1,0x0
  202020:	b3830067          	jr	-1224(t1) # 201b54 <hexdump>

00202024 <sa_run>:
            out[i][j] = in_B[(bk*2+i)*N + (bj*2+j)];
}

// SA API本体
void sa_run(const uint8_t *in_A, const uint8_t *in_B, const uint8_t Matrix_N, uint32_t *out_C)
{
  202024:	f9010113          	addi	sp,sp,-112
  202028:	06112623          	sw	ra,108(sp)
  20202c:	06812423          	sw	s0,104(sp)
  202030:	06912223          	sw	s1,100(sp)
  202034:	07212023          	sw	s2,96(sp)
  202038:	05312e23          	sw	s3,92(sp)
  20203c:	05412c23          	sw	s4,88(sp)
  202040:	05512a23          	sw	s5,84(sp)
  202044:	05612823          	sw	s6,80(sp)
  202048:	05712623          	sw	s7,76(sp)
  20204c:	05812423          	sw	s8,72(sp)
  202050:	05912223          	sw	s9,68(sp)
  202054:	05a12023          	sw	s10,64(sp)
  202058:	03b12e23          	sw	s11,60(sp)
  20205c:	00d12423          	sw	a3,8(sp)
  202060:	00058913          	mv	s2,a1
  202064:	00a12223          	sw	a0,4(sp)
  202068:	00000513          	li	a0,0
  20206c:	00020b37          	lui	s6,0x20
    // --------------------------------------------------------
    // 0. SA_ADDR_A,B,C設定
    // --------------------------------------------------------
    // csr_SA_ADDR_A,B
    CSR_WRITE(0x7D0, PSC_SA_ADDR_A);
  202070:	7d0b1073          	csrw	0x7d0,s6
  202074:	020b0593          	addi	a1,s6,32 # 20020 <$d.4+0x1d8b3>
    CSR_WRITE(0x7D4, PSC_SA_ADDR_B);
  202078:	7d459073          	csrw	0x7d4,a1
  20207c:	040b0593          	addi	a1,s6,64
    // csr_SA_ADDR_C
    CSR_WRITE(0x7D8, PSC_SA_ADDR_C);
  202080:	7d859073          	csrw	0x7d8,a1
  202084:	00200593          	li	a1,2
    //sa_write_B(B_sa);
    //wb = sa_write_matrix_and_wb();

    // -------- SA 実行 --------
    // sa_reset
    CSR_WRITE(0x7C0, 0x02);
  202088:	7c059073          	csrw	0x7c0,a1
    CSR_WRITE(0x7C0, 0x00);
  20208c:	7c051073          	csrw	0x7c0,a0
  202090:	00100513          	li	a0,1
    // sa_mode : OS mode.
    CSR_WRITE(0x7C4, 0x01);
  202094:	7c451073          	csrw	0x7c4,a0

    //uint32_t (*out2D)[Matrix_N] = (uint32_t (*)[Matrix_N])out_C;

    for (int bi = 0; bi < Matrix_N/2; bi++) {
  202098:	22b66063          	bltu	a2,a1,2022b8 <sa_run+0x294>
  20209c:	00060493          	mv	s1,a2
  2020a0:	00000513          	li	a0,0
  2020a4:	00165593          	srli	a1,a2,0x1
  2020a8:	02b12c23          	sw	a1,56(sp)
  2020ac:	fff58593          	addi	a1,a1,-1 # fff <$d.3+0x879>
  2020b0:	02b12223          	sw	a1,36(sp)
  2020b4:	00a12623          	sw	a0,12(sp)
  2020b8:	00151a13          	slli	s4,a0,0x1
  2020bc:	000a0513          	mv	a0,s4
  2020c0:	00048593          	mv	a1,s1
  2020c4:	00001097          	auipc	ra,0x1
  2020c8:	998080e7          	jalr	-1640(ra) # 202a5c <__mulsi3>
  2020cc:	00050993          	mv	s3,a0
  2020d0:	00412403          	lw	s0,4(sp)
  2020d4:	00a40533          	add	a0,s0,a0
  2020d8:	02a12a23          	sw	a0,52(sp)
  2020dc:	00150513          	addi	a0,a0,1
  2020e0:	02a12823          	sw	a0,48(sp)
  2020e4:	001a0513          	addi	a0,s4,1
  2020e8:	00048593          	mv	a1,s1
  2020ec:	00001097          	auipc	ra,0x1
  2020f0:	970080e7          	jalr	-1680(ra) # 202a5c <__mulsi3>
  2020f4:	00000713          	li	a4,0
  2020f8:	00a40433          	add	s0,s0,a0
  2020fc:	02812623          	sw	s0,44(sp)
  202100:	00140413          	addi	s0,s0,1
  202104:	02812423          	sw	s0,40(sp)
  202108:	00299593          	slli	a1,s3,0x2
  20210c:	00812603          	lw	a2,8(sp)
  202110:	00b605b3          	add	a1,a2,a1
  202114:	00b12e23          	sw	a1,28(sp)
  202118:	00458593          	addi	a1,a1,4
  20211c:	00b12c23          	sw	a1,24(sp)
  202120:	00251513          	slli	a0,a0,0x2
  202124:	00a60533          	add	a0,a2,a0
  202128:	00a12a23          	sw	a0,20(sp)
  20212c:	00450513          	addi	a0,a0,4
  202130:	00a12823          	sw	a0,16(sp)
  202134:	00000d93          	li	s11,0
        for (int bj = 0; bj < Matrix_N/2; bj++) {

            // sa_clear:bit[2]
            CSR_WRITE(0x7C0, 0x04);
  202138:	00400513          	li	a0,4
  20213c:	7c051073          	csrw	0x7c0,a0
            CSR_WRITE(0x7C0, 0x00);
  202140:	7c0d9073          	csrw	0x7c0,s11
  202144:	02e12023          	sw	a4,32(sp)
  202148:	00171413          	slli	s0,a4,0x1
  20214c:	001d9a13          	slli	s4,s11,0x1
  202150:	03412503          	lw	a0,52(sp)
            out[i][j] = in_A[(bi*2+i)*N + (bk*2+j)];
  202154:	01450533          	add	a0,a0,s4
  202158:	00054c83          	lbu	s9,0(a0)
  20215c:	03012503          	lw	a0,48(sp)
  202160:	01450533          	add	a0,a0,s4
  202164:	00054c03          	lbu	s8,0(a0)
  202168:	02c12503          	lw	a0,44(sp)
  20216c:	01450533          	add	a0,a0,s4
  202170:	00054d03          	lbu	s10,0(a0)
  202174:	02812503          	lw	a0,40(sp)
  202178:	01450533          	add	a0,a0,s4
  20217c:	00054a83          	lbu	s5,0(a0)
  202180:	000a0513          	mv	a0,s4
  202184:	00048593          	mv	a1,s1
  202188:	00001097          	auipc	ra,0x1
  20218c:	8d4080e7          	jalr	-1836(ra) # 202a5c <__mulsi3>
  202190:	008905b3          	add	a1,s2,s0
            out[i][j] = in_B[(bk*2+i)*N + (bj*2+j)];
  202194:	00a58533          	add	a0,a1,a0
  202198:	00054b83          	lbu	s7,0(a0)
  20219c:	00154983          	lbu	s3,1(a0)
  2021a0:	001a0513          	addi	a0,s4,1
  2021a4:	00048593          	mv	a1,s1
  2021a8:	00001097          	auipc	ra,0x1
  2021ac:	8b4080e7          	jalr	-1868(ra) # 202a5c <__mulsi3>
  2021b0:	00000593          	li	a1,0
  2021b4:	00890633          	add	a2,s2,s0
  2021b8:	00a60533          	add	a0,a2,a0
            ((uint32_t)B << 8) |
  2021bc:	008c1c13          	slli	s8,s8,0x8
  2021c0:	019c6633          	or	a2,s8,s9
            out[i][j] = in_B[(bk*2+i)*N + (bj*2+j)];
  2021c4:	00054683          	lbu	a3,0(a0)
  2021c8:	00154503          	lbu	a0,1(a0)
        *REG[i] = packed;
  2021cc:	00cb2023          	sw	a2,0(s6)
            ((uint32_t)B << 8) |
  2021d0:	008a9a93          	slli	s5,s5,0x8
  2021d4:	01aae633          	or	a2,s5,s10
        *REG[i] = packed;
  2021d8:	00cb2223          	sw	a2,4(s6)
            ((uint32_t)B << 8) |
  2021dc:	00899993          	slli	s3,s3,0x8
  2021e0:	0179e633          	or	a2,s3,s7
        *REG[i] = packed;
  2021e4:	02cb2023          	sw	a2,32(s6)
            ((uint32_t)B << 8) |
  2021e8:	00851513          	slli	a0,a0,0x8
  2021ec:	00d56533          	or	a0,a0,a3
        *REG[i] = packed;
  2021f0:	02ab2223          	sw	a0,36(s6)

                sa_write_A(A_sa);
                sa_write_B(B_sa);

                // sa_reset:bit[1]
                CSR_WRITE(0x7C0, (0x02));
  2021f4:	00200513          	li	a0,2
  2021f8:	7c051073          	csrw	0x7c0,a0
                CSR_WRITE(0x7C0, (0x00));
  2021fc:	7c059073          	csrw	0x7c0,a1
  202200:	02412503          	lw	a0,36(sp)
  202204:	00ad9e63          	bne	s11,a0,202220 <sa_run+0x1fc>
                // start:bit[0]
                if (bk == Matrix_N/2 - 1) {
                    CSR_WRITE(0x7C0, (0x08 | 0x01));
  202208:	00900513          	li	a0,9
  20220c:	7c051073          	csrw	0x7c0,a0
                    CSR_WRITE(0x7C0, (0x08 | 0x00));
  202210:	00800513          	li	a0,8
  202214:	7c051073          	csrw	0x7c0,a0

                // wait 
                //tiny_delay(100);

                // 0x7C8 = csr_SA_STATUS
                while ((CSR_READ(0x7C8) & 0x01) != 0x01) {
  202218:	7c802573          	csrr	a0,0x7c8
  20221c:	0240006f          	j	202240 <sa_run+0x21c>
  202220:	00000513          	li	a0,0
                    CSR_WRITE(0x7C0, 0x01);
  202224:	00100593          	li	a1,1
  202228:	7c059073          	csrw	0x7c0,a1
                    CSR_WRITE(0x7C0, 0x00);
  20222c:	7c051073          	csrw	0x7c0,a0
                while ((CSR_READ(0x7C8) & 0x01) != 0x01) {
  202230:	7c802573          	csrr	a0,0x7c8
  202234:	00c0006f          	j	202240 <sa_run+0x21c>
                    __asm__ volatile("nop");
  202238:	00000013          	nop
                while ((CSR_READ(0x7C8) & 0x01) != 0x01) {
  20223c:	7c802573          	csrr	a0,0x7c8
  202240:	00157513          	andi	a0,a0,1
  202244:	fe050ae3          	beqz	a0,202238 <sa_run+0x214>
            for (int bk = 0; bk < Matrix_N/2; bk++) {
  202248:	001d8d93          	addi	s11,s11,1
  20224c:	03812503          	lw	a0,56(sp)
  202250:	eead9ee3          	bne	s11,a0,20214c <sa_run+0x128>
    uint32_t v0 = base[0];
  202254:	040b2503          	lw	a0,64(s6)
    uint32_t v1 = base[1];
  202258:	044b2583          	lw	a1,68(s6)
    uint32_t v2 = base[2];
  20225c:	048b2603          	lw	a2,72(s6)
    uint32_t v3 = base[3];
  202260:	04cb2683          	lw	a3,76(s6)

            // -------- out[4] に格納 --------
            for (int mi = 0; mi < 2; mi++) {
                for (int mj = 0; mj < 2; mj++) {
                    //out2D[bi*2+mi][bj*2+mj] = C_sa[mi][mj];
                    out_C[(bi*2+mi)*Matrix_N + (bj*2+mj)] = C_sa[mi][mj];
  202264:	00241413          	slli	s0,s0,0x2
  202268:	01c12703          	lw	a4,28(sp)
  20226c:	00870733          	add	a4,a4,s0
  202270:	00a72023          	sw	a0,0(a4) # 1000 <$d.3+0x87a>
  202274:	01812503          	lw	a0,24(sp)
  202278:	00850533          	add	a0,a0,s0
  20227c:	00b52023          	sw	a1,0(a0)
  202280:	01412503          	lw	a0,20(sp)
  202284:	00850533          	add	a0,a0,s0
  202288:	00c52023          	sw	a2,0(a0)
  20228c:	01012503          	lw	a0,16(sp)
  202290:	00850433          	add	s0,a0,s0
  202294:	02012703          	lw	a4,32(sp)
        for (int bj = 0; bj < Matrix_N/2; bj++) {
  202298:	00170713          	addi	a4,a4,1
                    out_C[(bi*2+mi)*Matrix_N + (bj*2+mj)] = C_sa[mi][mj];
  20229c:	00d42023          	sw	a3,0(s0)
  2022a0:	03812503          	lw	a0,56(sp)
        for (int bj = 0; bj < Matrix_N/2; bj++) {
  2022a4:	e8a718e3          	bne	a4,a0,202134 <sa_run+0x110>
  2022a8:	00c12503          	lw	a0,12(sp)
    for (int bi = 0; bi < Matrix_N/2; bi++) {
  2022ac:	00150513          	addi	a0,a0,1
  2022b0:	03812583          	lw	a1,56(sp)
  2022b4:	e0b510e3          	bne	a0,a1,2020b4 <sa_run+0x90>
  2022b8:	06c12083          	lw	ra,108(sp)
  2022bc:	06812403          	lw	s0,104(sp)
  2022c0:	06412483          	lw	s1,100(sp)
  2022c4:	06012903          	lw	s2,96(sp)
  2022c8:	05c12983          	lw	s3,92(sp)
  2022cc:	05812a03          	lw	s4,88(sp)
  2022d0:	05412a83          	lw	s5,84(sp)
  2022d4:	05012b03          	lw	s6,80(sp)
  2022d8:	04c12b83          	lw	s7,76(sp)
  2022dc:	04812c03          	lw	s8,72(sp)
  2022e0:	04412c83          	lw	s9,68(sp)
  2022e4:	04012d03          	lw	s10,64(sp)
  2022e8:	03c12d83          	lw	s11,60(sp)
                    //putchar('\n');
                }
            }
        }
    }
}
  2022ec:	07010113          	addi	sp,sp,112
  2022f0:	00008067          	ret

002022f4 <rand32>:
// -------------------------------------------------------
static uint32_t lfsr;

uint32_t rand32()
{
    if (lfsr == 0) lfsr = 143253719;
  2022f4:	002355b7          	lui	a1,0x235
  2022f8:	7b05a503          	lw	a0,1968(a1) # 2357b0 <lfsr>
  2022fc:	00051663          	bnez	a0,202308 <rand32+0x14>
  202300:	0889e537          	lui	a0,0x889e
  202304:	0d750513          	addi	a0,a0,215 # 889e0d7 <__free_ram_end+0x85480d7>

    lfsr ^= lfsr << 13;
  202308:	00d51613          	slli	a2,a0,0xd
  20230c:	00a64533          	xor	a0,a2,a0
    lfsr ^= lfsr >> 17;
  202310:	01155613          	srli	a2,a0,0x11
  202314:	00a64533          	xor	a0,a2,a0
    lfsr ^= lfsr << 5;
  202318:	00551613          	slli	a2,a0,0x5
  20231c:	00a64533          	xor	a0,a2,a0
  202320:	7aa5a823          	sw	a0,1968(a1)
    return lfsr;
  202324:	00008067          	ret

00202328 <s_call_sa_api>:
}

// -------------------------------------------------------
// SA実行関数
void s_call_sa_api(const uint8_t matrix_N)
{
  202328:	fe010113          	addi	sp,sp,-32
  20232c:	00112e23          	sw	ra,28(sp)
  202330:	00812c23          	sw	s0,24(sp)
  202334:	00912a23          	sw	s1,20(sp)
  202338:	01212823          	sw	s2,16(sp)
  20233c:	01312623          	sw	s3,12(sp)
  202340:	01412423          	sw	s4,8(sp)
  202344:	01512223          	sw	s5,4(sp)
  202348:	01612023          	sw	s6,0(sp)
  20234c:	00050413          	mv	s0,a0
  202350:	00000513          	li	a0,0
  202354:	002355b7          	lui	a1,0x235
  202358:	7b958593          	addi	a1,a1,1977 # 2357b9 <s_call_sa_api.A_mat+0x5>
  20235c:	00236637          	lui	a2,0x236
  202360:	84960613          	addi	a2,a2,-1975 # 235849 <s_call_sa_api.B_mat+0x5>
  202364:	02400693          	li	a3,36

    for (int i = 0; i < SA_MAT_MAX; i++) {
        for (int j = 0; j < SA_MAT_MAX; j++) {
            //A_mat[i][j] = (uint8_t)(rand32() % 64);
            //B_mat[i][j] = (uint8_t)(rand32() % 64);
            A_mat[i][j] = (uint8_t)(3*i + 2*j);
  202368:	fea58da3          	sb	a0,-5(a1)
            B_mat[i][j] = (uint8_t)(3*i + j + 5);
  20236c:	00550713          	addi	a4,a0,5
  202370:	fee60da3          	sb	a4,-5(a2)
            A_mat[i][j] = (uint8_t)(3*i + 2*j);
  202374:	00250713          	addi	a4,a0,2
  202378:	fee58e23          	sb	a4,-4(a1)
            B_mat[i][j] = (uint8_t)(3*i + j + 5);
  20237c:	00650713          	addi	a4,a0,6
  202380:	fee60e23          	sb	a4,-4(a2)
            A_mat[i][j] = (uint8_t)(3*i + 2*j);
  202384:	00450793          	addi	a5,a0,4
  202388:	fef58ea3          	sb	a5,-3(a1)
            B_mat[i][j] = (uint8_t)(3*i + j + 5);
  20238c:	00750793          	addi	a5,a0,7
  202390:	fef60ea3          	sb	a5,-3(a2)
            A_mat[i][j] = (uint8_t)(3*i + 2*j);
  202394:	fee58f23          	sb	a4,-2(a1)
            B_mat[i][j] = (uint8_t)(3*i + j + 5);
  202398:	00850713          	addi	a4,a0,8
  20239c:	fee60f23          	sb	a4,-2(a2)
            A_mat[i][j] = (uint8_t)(3*i + 2*j);
  2023a0:	fee58fa3          	sb	a4,-1(a1)
            B_mat[i][j] = (uint8_t)(3*i + j + 5);
  2023a4:	00950713          	addi	a4,a0,9
  2023a8:	fee60fa3          	sb	a4,-1(a2)
            A_mat[i][j] = (uint8_t)(3*i + 2*j);
  2023ac:	00a50713          	addi	a4,a0,10
  2023b0:	00e58023          	sb	a4,0(a1)
            B_mat[i][j] = (uint8_t)(3*i + j + 5);
  2023b4:	00e60023          	sb	a4,0(a2)
            A_mat[i][j] = (uint8_t)(3*i + 2*j);
  2023b8:	00c50713          	addi	a4,a0,12
  2023bc:	00e580a3          	sb	a4,1(a1)
            B_mat[i][j] = (uint8_t)(3*i + j + 5);
  2023c0:	00b50793          	addi	a5,a0,11
  2023c4:	00f600a3          	sb	a5,1(a2)
            A_mat[i][j] = (uint8_t)(3*i + 2*j);
  2023c8:	00e50793          	addi	a5,a0,14
  2023cc:	00f58123          	sb	a5,2(a1)
            B_mat[i][j] = (uint8_t)(3*i + j + 5);
  2023d0:	00e60123          	sb	a4,2(a2)
            A_mat[i][j] = (uint8_t)(3*i + 2*j);
  2023d4:	01050713          	addi	a4,a0,16
  2023d8:	00e581a3          	sb	a4,3(a1)
            B_mat[i][j] = (uint8_t)(3*i + j + 5);
  2023dc:	00d50813          	addi	a6,a0,13
  2023e0:	010601a3          	sb	a6,3(a2)
            A_mat[i][j] = (uint8_t)(3*i + 2*j);
  2023e4:	01250813          	addi	a6,a0,18
  2023e8:	01058223          	sb	a6,4(a1)
            B_mat[i][j] = (uint8_t)(3*i + j + 5);
  2023ec:	00f60223          	sb	a5,4(a2)
            A_mat[i][j] = (uint8_t)(3*i + 2*j);
  2023f0:	01450793          	addi	a5,a0,20
  2023f4:	00f582a3          	sb	a5,5(a1)
            B_mat[i][j] = (uint8_t)(3*i + j + 5);
  2023f8:	00f50793          	addi	a5,a0,15
  2023fc:	00f602a3          	sb	a5,5(a2)
            A_mat[i][j] = (uint8_t)(3*i + 2*j);
  202400:	01650793          	addi	a5,a0,22
  202404:	00f58323          	sb	a5,6(a1)
            B_mat[i][j] = (uint8_t)(3*i + j + 5);
  202408:	00e60323          	sb	a4,6(a2)
    for (int i = 0; i < SA_MAT_MAX; i++) {
  20240c:	00350513          	addi	a0,a0,3
  202410:	00c58593          	addi	a1,a1,12
  202414:	00c60613          	addi	a2,a2,12
  202418:	f4d518e3          	bne	a0,a3,202368 <s_call_sa_api+0x40>
        }
    }

    A_mat[0][0] = 1;
    A_mat[2][3] = 2;
  20241c:	00235537          	lui	a0,0x235
  202420:	7b450913          	addi	s2,a0,1972 # 2357b4 <s_call_sa_api.A_mat>
  202424:	00200593          	li	a1,2
  202428:	00b90da3          	sb	a1,27(s2)
    A_mat[5][3] = 0;
  20242c:	02090fa3          	sb	zero,63(s2)
  202430:	00300593          	li	a1,3
    A_mat[0][0] = 3;
  202434:	7ab50a23          	sb	a1,1972(a0)

#if 1
    // ---- A,B表示 ----
    for (int i = 0; i < matrix_N; i++) {
  202438:	0c040c63          	beqz	s0,202510 <s_call_sa_api+0x1e8>
  20243c:	00000493          	li	s1,0
  202440:	00090993          	mv	s3,s2
        for (int j = 0; j < matrix_N; j++) {
  202444:	00c00593          	li	a1,12
  202448:	00048513          	mv	a0,s1
  20244c:	00000097          	auipc	ra,0x0
  202450:	610080e7          	jalr	1552(ra) # 202a5c <__mulsi3>
  202454:	00a40533          	add	a0,s0,a0
  202458:	00a90a33          	add	s4,s2,a0
  20245c:	00098a93          	mv	s5,s3
            s_print_int((int)A_mat[i][j]);
  202460:	000ac503          	lbu	a0,0(s5) # a3000000 <__free_ram_end+0xa2caa000>
  202464:	fffff097          	auipc	ra,0xfffff
  202468:	250080e7          	jalr	592(ra) # 2016b4 <s_print_int>
            putchar(' ');
  20246c:	02000513          	li	a0,32
  202470:	ffffe097          	auipc	ra,0xffffe
  202474:	ba0080e7          	jalr	-1120(ra) # 200010 <putchar>
        for (int j = 0; j < matrix_N; j++) {
  202478:	001a8a93          	addi	s5,s5,1
  20247c:	ff4a92e3          	bne	s5,s4,202460 <s_call_sa_api+0x138>
        }
        putchar('\n');
  202480:	00a00513          	li	a0,10
  202484:	ffffe097          	auipc	ra,0xffffe
  202488:	b8c080e7          	jalr	-1140(ra) # 200010 <putchar>
    for (int i = 0; i < matrix_N; i++) {
  20248c:	00148493          	addi	s1,s1,1 # 400001 <__free_ram_end+0xaa001>
  202490:	00c98993          	addi	s3,s3,12
  202494:	fa8498e3          	bne	s1,s0,202444 <s_call_sa_api+0x11c>
    }
    putchar('\n');
  202498:	00a00513          	li	a0,10
  20249c:	ffffe097          	auipc	ra,0xffffe
  2024a0:	b74080e7          	jalr	-1164(ra) # 200010 <putchar>
    
    for (int i = 0; i < matrix_N; i++) {
  2024a4:	12040a63          	beqz	s0,2025d8 <s_call_sa_api+0x2b0>
  2024a8:	00236537          	lui	a0,0x236
  2024ac:	84450913          	addi	s2,a0,-1980 # 235844 <s_call_sa_api.B_mat>
  2024b0:	00000493          	li	s1,0
  2024b4:	00090993          	mv	s3,s2
        for (int j = 0; j < matrix_N; j++) {
  2024b8:	00c00593          	li	a1,12
  2024bc:	00048513          	mv	a0,s1
  2024c0:	00000097          	auipc	ra,0x0
  2024c4:	59c080e7          	jalr	1436(ra) # 202a5c <__mulsi3>
  2024c8:	00a40533          	add	a0,s0,a0
  2024cc:	00a90a33          	add	s4,s2,a0
  2024d0:	00098a93          	mv	s5,s3
            s_print_int((int)B_mat[i][j]);
  2024d4:	000ac503          	lbu	a0,0(s5)
  2024d8:	fffff097          	auipc	ra,0xfffff
  2024dc:	1dc080e7          	jalr	476(ra) # 2016b4 <s_print_int>
            putchar(' ');
  2024e0:	02000513          	li	a0,32
  2024e4:	ffffe097          	auipc	ra,0xffffe
  2024e8:	b2c080e7          	jalr	-1236(ra) # 200010 <putchar>
        for (int j = 0; j < matrix_N; j++) {
  2024ec:	001a8a93          	addi	s5,s5,1
  2024f0:	ff4a92e3          	bne	s5,s4,2024d4 <s_call_sa_api+0x1ac>
        }
        putchar('\n');
  2024f4:	00a00513          	li	a0,10
  2024f8:	ffffe097          	auipc	ra,0xffffe
  2024fc:	b18080e7          	jalr	-1256(ra) # 200010 <putchar>
    for (int i = 0; i < matrix_N; i++) {
  202500:	00148493          	addi	s1,s1,1
  202504:	00c98993          	addi	s3,s3,12
  202508:	fa8498e3          	bne	s1,s0,2024b8 <s_call_sa_api+0x190>
  20250c:	0100006f          	j	20251c <s_call_sa_api+0x1f4>
    putchar('\n');
  202510:	00a00513          	li	a0,10
  202514:	ffffe097          	auipc	ra,0xffffe
  202518:	afc080e7          	jalr	-1284(ra) # 200010 <putchar>
    }
    putchar('\n');
  20251c:	00a00513          	li	a0,10
  202520:	ffffe097          	auipc	ra,0xffffe
  202524:	af0080e7          	jalr	-1296(ra) # 200010 <putchar>
#endif

    //static uint32_t mat_C[(SA_MAT_MAX * SA_MAT_MAX)];

#if 1
    s_printf("sa_run start.\n");
  202528:	00203537          	lui	a0,0x203
  20252c:	db550513          	addi	a0,a0,-587 # 202db5 <$d.3>
  202530:	fffff097          	auipc	ra,0xfffff
  202534:	280080e7          	jalr	640(ra) # 2017b0 <s_printf>
    sa_run(
  202538:	00235537          	lui	a0,0x235
  20253c:	7b450513          	addi	a0,a0,1972 # 2357b4 <s_call_sa_api.A_mat>
  202540:	002365b7          	lui	a1,0x236
  202544:	84458593          	addi	a1,a1,-1980 # 235844 <s_call_sa_api.B_mat>
  202548:	00236637          	lui	a2,0x236
  20254c:	8d460493          	addi	s1,a2,-1836 # 2358d4 <s_call_sa_api.C_mat>
  202550:	00040613          	mv	a2,s0
  202554:	00048693          	mv	a3,s1
  202558:	00000097          	auipc	ra,0x0
  20255c:	acc080e7          	jalr	-1332(ra) # 202024 <sa_run>
        &A_mat[0][0],
        &B_mat[0][0],
        matrix_N,
        &C_mat[0][0]
    );
    s_printf("sa_run end.\n\n");
  202560:	00203537          	lui	a0,0x203
  202564:	29e50513          	addi	a0,a0,670 # 20329e <$d.4+0x189>
  202568:	fffff097          	auipc	ra,0xfffff
  20256c:	248080e7          	jalr	584(ra) # 2017b0 <s_printf>
#endif

    // ---- 結果表示 ----
    for (int i = 0; i < matrix_N; i++) {
  202570:	0a040c63          	beqz	s0,202628 <s_call_sa_api+0x300>
  202574:	00000913          	li	s2,0
  202578:	00241993          	slli	s3,s0,0x2
  20257c:	00048a13          	mv	s4,s1
        for (int j = 0; j < matrix_N; j++) {
  202580:	03000593          	li	a1,48
  202584:	00090513          	mv	a0,s2
  202588:	00000097          	auipc	ra,0x0
  20258c:	4d4080e7          	jalr	1236(ra) # 202a5c <__mulsi3>
  202590:	00a98533          	add	a0,s3,a0
  202594:	00a48ab3          	add	s5,s1,a0
  202598:	000a0b13          	mv	s6,s4
            s_print_int((int)C_mat[i][j]);
  20259c:	000b2503          	lw	a0,0(s6)
  2025a0:	fffff097          	auipc	ra,0xfffff
  2025a4:	114080e7          	jalr	276(ra) # 2016b4 <s_print_int>
            putchar(' ');
  2025a8:	02000513          	li	a0,32
  2025ac:	ffffe097          	auipc	ra,0xffffe
  2025b0:	a64080e7          	jalr	-1436(ra) # 200010 <putchar>
        for (int j = 0; j < matrix_N; j++) {
  2025b4:	004b0b13          	addi	s6,s6,4
  2025b8:	ff5b12e3          	bne	s6,s5,20259c <s_call_sa_api+0x274>
        }
        putchar('\n');
  2025bc:	00a00513          	li	a0,10
  2025c0:	ffffe097          	auipc	ra,0xffffe
  2025c4:	a50080e7          	jalr	-1456(ra) # 200010 <putchar>
    for (int i = 0; i < matrix_N; i++) {
  2025c8:	00190913          	addi	s2,s2,1
  2025cc:	030a0a13          	addi	s4,s4,48
  2025d0:	fa8918e3          	bne	s2,s0,202580 <s_call_sa_api+0x258>
  2025d4:	0540006f          	j	202628 <s_call_sa_api+0x300>
    putchar('\n');
  2025d8:	00a00513          	li	a0,10
  2025dc:	ffffe097          	auipc	ra,0xffffe
  2025e0:	a34080e7          	jalr	-1484(ra) # 200010 <putchar>
    s_printf("sa_run start.\n");
  2025e4:	00203537          	lui	a0,0x203
  2025e8:	db550513          	addi	a0,a0,-587 # 202db5 <$d.3>
  2025ec:	fffff097          	auipc	ra,0xfffff
  2025f0:	1c4080e7          	jalr	452(ra) # 2017b0 <s_printf>
    sa_run(
  2025f4:	00235537          	lui	a0,0x235
  2025f8:	7b450513          	addi	a0,a0,1972 # 2357b4 <s_call_sa_api.A_mat>
  2025fc:	002365b7          	lui	a1,0x236
  202600:	84458593          	addi	a1,a1,-1980 # 235844 <s_call_sa_api.B_mat>
  202604:	00236637          	lui	a2,0x236
  202608:	8d460693          	addi	a3,a2,-1836 # 2358d4 <s_call_sa_api.C_mat>
  20260c:	00040613          	mv	a2,s0
  202610:	00000097          	auipc	ra,0x0
  202614:	a14080e7          	jalr	-1516(ra) # 202024 <sa_run>
    s_printf("sa_run end.\n\n");
  202618:	00203537          	lui	a0,0x203
  20261c:	29e50513          	addi	a0,a0,670 # 20329e <$d.4+0x189>
  202620:	fffff097          	auipc	ra,0xfffff
  202624:	190080e7          	jalr	400(ra) # 2017b0 <s_printf>
    }
    putchar('\n');
  202628:	00a00513          	li	a0,10
  20262c:	01c12083          	lw	ra,28(sp)
  202630:	01812403          	lw	s0,24(sp)
  202634:	01412483          	lw	s1,20(sp)
  202638:	01012903          	lw	s2,16(sp)
  20263c:	00c12983          	lw	s3,12(sp)
  202640:	00812a03          	lw	s4,8(sp)
  202644:	00412a83          	lw	s5,4(sp)
  202648:	00012b03          	lw	s6,0(sp)
  20264c:	02010113          	addi	sp,sp,32
  202650:	ffffe317          	auipc	t1,0xffffe
  202654:	9c030067          	jr	-1600(t1) # 200010 <putchar>

00202658 <s_call_sdcard_read_api>:
}

// -------------------------------------------------------
// SDカードREAD実行関数
void s_call_sdcard_read_api(uint32_t sd_sector_address)
{
  202658:	dc010113          	addi	sp,sp,-576
  20265c:	22112e23          	sw	ra,572(sp)
  202660:	22812c23          	sw	s0,568(sp)
  202664:	22912a23          	sw	s1,564(sp)
  202668:	23212823          	sw	s2,560(sp)
  20266c:	23312623          	sw	s3,556(sp)
  202670:	23412423          	sw	s4,552(sp)
  202674:	23512223          	sw	s5,548(sp)
  202678:	23612023          	sw	s6,544(sp)
  20267c:	21712e23          	sw	s7,540(sp)
  202680:	21812c23          	sw	s8,536(sp)
  202684:	21912a23          	sw	s9,532(sp)
  202688:	21a12823          	sw	s10,528(sp)
  20268c:	21b12623          	sw	s11,524(sp)
  202690:	00050413          	mv	s0,a0
  202694:	00000493          	li	s1,0
    unsigned char buf[512];

    int retry_max = 3;
    int success = 0;

    for (int retry = 0; retry < retry_max; retry++) {
  202698:	20c10d13          	addi	s10,sp,524
  20269c:	10006ab7          	lui	s5,0x10006
  2026a0:	00400b13          	li	s6,4
  2026a4:	00100b93          	li	s7,1
  2026a8:	ffff4537          	lui	a0,0xffff4
  2026ac:	cb050c13          	addi	s8,a0,-848 # ffff3cb0 <__free_ram_end+0xffc9dcb0>
  2026b0:	00200c93          	li	s9,2
  2026b4:	20000d93          	li	s11,512
  2026b8:	00001537          	lui	a0,0x1
  2026bc:	02150913          	addi	s2,a0,33 # 1021 <$d.3+0x89b>
  2026c0:	00203537          	lui	a0,0x203
  2026c4:	e8050513          	addi	a0,a0,-384 # 202e80 <$d.3+0xcb>
  2026c8:	00a12423          	sw	a0,8(sp)
  2026cc:	00203537          	lui	a0,0x203
  2026d0:	d1250993          	addi	s3,a0,-750 # 202d12 <$d.1>
  2026d4:	00300a13          	li	s4,3
    PSC_SD_IF_CTRL = 0x04;
  2026d8:	016aa423          	sw	s6,8(s5) # 10006008 <__free_ram_end+0xfcb0008>
  2026dc:	f9c00513          	li	a0,-100
    while (n--) {
  2026e0:	00150513          	addi	a0,a0,1
        __asm__ __volatile__("nop");
  2026e4:	00000013          	nop
    while (n--) {
  2026e8:	fe051ce3          	bnez	a0,2026e0 <s_call_sdcard_read_api+0x88>
    if ((PSC_SD_IF_CTRL & 0x04) == 0x00) {
  2026ec:	008aa503          	lw	a0,8(s5)
  2026f0:	00457513          	andi	a0,a0,4
  2026f4:	00051463          	bnez	a0,2026fc <s_call_sdcard_read_api+0xa4>
        PSC_SD_IF_CTRL = 0x01;
  2026f8:	017aa423          	sw	s7,8(s5)
  2026fc:	000c0513          	mv	a0,s8
    while (PSC_SD_IF_CTRL & 0x02) {
  202700:	008aa583          	lw	a1,8(s5)
  202704:	0025f593          	andi	a1,a1,2
  202708:	00058863          	beqz	a1,202718 <s_call_sdcard_read_api+0xc0>
        if (--timeout == 0) return -1;
  20270c:	00150513          	addi	a0,a0,1
  202710:	fe0518e3          	bnez	a0,202700 <s_call_sdcard_read_api+0xa8>
  202714:	0440006f          	j	202758 <s_call_sdcard_read_api+0x100>
  202718:	f9c00513          	li	a0,-100
    while (n--) {
  20271c:	00150513          	addi	a0,a0,1
        __asm__ __volatile__("nop");
  202720:	00000013          	nop
    while (n--) {
  202724:	fe051ce3          	bnez	a0,20271c <s_call_sdcard_read_api+0xc4>
    PSC_SD_SECTOR = sd_sector_address;
  202728:	008aa223          	sw	s0,4(s5)
    PSC_SD_IF_CTRL = 0x02;
  20272c:	019aa423          	sw	s9,8(s5)
  202730:	f9c00513          	li	a0,-100
    while (n--) {
  202734:	00150513          	addi	a0,a0,1
        __asm__ __volatile__("nop");
  202738:	00000013          	nop
    while (n--) {
  20273c:	fe051ce3          	bnez	a0,202734 <s_call_sdcard_read_api+0xdc>
  202740:	000c0513          	mv	a0,s8
    while ((PSC_SD_IF_CTRL & 0x04) == 0) {
  202744:	008aa583          	lw	a1,8(s5)
  202748:	0045f593          	andi	a1,a1,4
  20274c:	02059463          	bnez	a1,202774 <s_call_sdcard_read_api+0x11c>
        if (--timeout == 0) return -2;
  202750:	00150513          	addi	a0,a0,1
  202754:	fe0518e3          	bnez	a0,202744 <s_call_sdcard_read_api+0xec>

        if (sd_read_once(sd_sector_address, buf) != 0) {
            s_printf("READ FAIL retry=%d\n", retry);
  202758:	00098513          	mv	a0,s3
  20275c:	00048593          	mv	a1,s1
  202760:	fffff097          	auipc	ra,0xfffff
  202764:	050080e7          	jalr	80(ra) # 2017b0 <s_printf>
    for (int retry = 0; retry < retry_max; retry++) {
  202768:	00148493          	addi	s1,s1,1
  20276c:	f74496e3          	bne	s1,s4,2026d8 <s_call_sdcard_read_api+0x80>
  202770:	2100006f          	j	202980 <s_call_sdcard_read_api+0x328>
  202774:	00000513          	li	a0,0
        __asm__ __volatile__("nop");
  202778:	00000013          	nop
  20277c:	00000013          	nop
  202780:	00000013          	nop
  202784:	00000013          	nop
  202788:	00000013          	nop
  20278c:	00000013          	nop
  202790:	00000013          	nop
  202794:	00000013          	nop
  202798:	00000013          	nop
  20279c:	00000013          	nop
  2027a0:	00000013          	nop
  2027a4:	00000013          	nop
  2027a8:	00000013          	nop
  2027ac:	00000013          	nop
  2027b0:	00000013          	nop
  2027b4:	00000013          	nop
  2027b8:	00000013          	nop
  2027bc:	00000013          	nop
  2027c0:	00000013          	nop
  2027c4:	00000013          	nop
  2027c8:	00000013          	nop
  2027cc:	00000013          	nop
  2027d0:	00000013          	nop
  2027d4:	00000013          	nop
  2027d8:	00000013          	nop
  2027dc:	00000013          	nop
  2027e0:	00000013          	nop
  2027e4:	00000013          	nop
  2027e8:	00000013          	nop
  2027ec:	00000013          	nop
  2027f0:	00000013          	nop
  2027f4:	00000013          	nop
  2027f8:	00000013          	nop
  2027fc:	00000013          	nop
  202800:	00000013          	nop
  202804:	00000013          	nop
  202808:	00000013          	nop
  20280c:	00000013          	nop
  202810:	00000013          	nop
  202814:	00000013          	nop
  202818:	00000013          	nop
  20281c:	00000013          	nop
  202820:	00000013          	nop
  202824:	00000013          	nop
  202828:	00000013          	nop
  20282c:	00000013          	nop
  202830:	00000013          	nop
  202834:	00000013          	nop
  202838:	00000013          	nop
  20283c:	00000013          	nop
  202840:	000c0593          	mv	a1,s8
        while (PSC_SD_IF_CTRL & (1 << 3)) {
  202844:	008aa603          	lw	a2,8(s5)
  202848:	00867613          	andi	a2,a2,8
  20284c:	00060863          	beqz	a2,20285c <s_call_sdcard_read_api+0x204>
            if (--timeout == 0) return -3;
  202850:	00158593          	addi	a1,a1,1
  202854:	fe0598e3          	bnez	a1,202844 <s_call_sdcard_read_api+0x1ec>
  202858:	f01ff06f          	j	202758 <s_call_sdcard_read_api+0x100>
        buf[i] = (unsigned char)(PSC_SD_ADDR & 0xFF);
  20285c:	000aa583          	lw	a1,0(s5)
  202860:	00c10613          	addi	a2,sp,12
  202864:	00a60633          	add	a2,a2,a0
    for (int i = 0; i < 512; i++) {
  202868:	00150513          	addi	a0,a0,1
        buf[i] = (unsigned char)(PSC_SD_ADDR & 0xFF);
  20286c:	00b60023          	sb	a1,0(a2)
    for (int i = 0; i < 512; i++) {
  202870:	fdb518e3          	bne	a0,s11,202840 <s_call_sdcard_read_api+0x1e8>
            continue;
        }

        // CRC HW
        uint32_t ctrl = PSC_SD_IF_CTRL;
  202874:	008aa683          	lw	a3,8(s5)
  202878:	00000593          	li	a1,0
  20287c:	00c10513          	addi	a0,sp,12
  202880:	000d0893          	mv	a7,s10
        crc ^= (uint16_t)buf[i] << 8;
  202884:	00054603          	lbu	a2,0(a0)
  202888:	00861613          	slli	a2,a2,0x8
  20288c:	00b645b3          	xor	a1,a2,a1
  202890:	01059613          	slli	a2,a1,0x10
  202894:	41065613          	srai	a2,a2,0x10
            crc = (crc & 0x8000) ? (crc << 1) ^ 0x1021 : (crc << 1);
  202898:	01159713          	slli	a4,a1,0x11
  20289c:	41075713          	srai	a4,a4,0x10
  2028a0:	00159793          	slli	a5,a1,0x1
  2028a4:	00f65613          	srli	a2,a2,0xf
  2028a8:	01267633          	and	a2,a2,s2
  2028ac:	00c7c633          	xor	a2,a5,a2
  2028b0:	00161793          	slli	a5,a2,0x1
  2028b4:	01259813          	slli	a6,a1,0x12
  2028b8:	41085813          	srai	a6,a6,0x10
  2028bc:	00f75713          	srli	a4,a4,0xf
  2028c0:	01277733          	and	a4,a4,s2
  2028c4:	00e7c733          	xor	a4,a5,a4
  2028c8:	00171793          	slli	a5,a4,0x1
  2028cc:	01359593          	slli	a1,a1,0x13
  2028d0:	4105d593          	srai	a1,a1,0x10
  2028d4:	00f85813          	srli	a6,a6,0xf
  2028d8:	01287833          	and	a6,a6,s2
  2028dc:	0107c7b3          	xor	a5,a5,a6
  2028e0:	01361613          	slli	a2,a2,0x13
  2028e4:	41065613          	srai	a2,a2,0x10
  2028e8:	00179813          	slli	a6,a5,0x1
  2028ec:	00f5d593          	srli	a1,a1,0xf
  2028f0:	0125f5b3          	and	a1,a1,s2
  2028f4:	00b845b3          	xor	a1,a6,a1
  2028f8:	01371713          	slli	a4,a4,0x13
  2028fc:	41075713          	srai	a4,a4,0x10
  202900:	00f65613          	srli	a2,a2,0xf
  202904:	01267633          	and	a2,a2,s2
  202908:	00161613          	slli	a2,a2,0x1
  20290c:	00259813          	slli	a6,a1,0x2
  202910:	01379793          	slli	a5,a5,0x13
  202914:	4107d793          	srai	a5,a5,0x10
  202918:	00f75713          	srli	a4,a4,0xf
  20291c:	01277733          	and	a4,a4,s2
  202920:	00e64633          	xor	a2,a2,a4
  202924:	00c84633          	xor	a2,a6,a2
  202928:	01359593          	slli	a1,a1,0x13
  20292c:	4105d593          	srai	a1,a1,0x10
  202930:	00f7d793          	srli	a5,a5,0xf
  202934:	0127f733          	and	a4,a5,s2
  202938:	00261613          	slli	a2,a2,0x2
  20293c:	00171713          	slli	a4,a4,0x1
  202940:	00e64633          	xor	a2,a2,a4
  202944:	00f5d593          	srli	a1,a1,0xf
  202948:	0125f5b3          	and	a1,a1,s2
    for (int i = 0; i < 512; i++) {
  20294c:	00150513          	addi	a0,a0,1
            crc = (crc & 0x8000) ? (crc << 1) ^ 0x1021 : (crc << 1);
  202950:	00b645b3          	xor	a1,a2,a1
    for (int i = 0; i < 512; i++) {
  202954:	f31518e3          	bne	a0,a7,202884 <s_call_sdcard_read_api+0x22c>
        uint16_t crc_hw = ((ctrl >> 24) & 0xFF) << 8 |
  202958:	0106d693          	srli	a3,a3,0x10
                          ((ctrl >> 16) & 0xFF);

        // CRC SW
        uint16_t crc = sd_crc16(buf);

        if (crc == crc_hw) {
  20295c:	01059593          	slli	a1,a1,0x10
  202960:	0105d613          	srli	a2,a1,0x10
  202964:	0ec68063          	beq	a3,a2,202a44 <s_call_sdcard_read_api+0x3ec>
  202968:	00812503          	lw	a0,8(sp)
            s_printf("CRC OK (retry=%d)\n", retry);
            success = 1;
            break;
        } else {
            s_printf("CRC NG retry=%d (calc=%x hw=%x)\n",
  20296c:	00048593          	mv	a1,s1
  202970:	fffff097          	auipc	ra,0xfffff
  202974:	e40080e7          	jalr	-448(ra) # 2017b0 <s_printf>
    for (int retry = 0; retry < retry_max; retry++) {
  202978:	00148493          	addi	s1,s1,1
  20297c:	d5449ee3          	bne	s1,s4,2026d8 <s_call_sdcard_read_api+0x80>
                     retry, crc, crc_hw);
        }
    }

    if (!success) {
        s_printf("CRC FAILED (final)\n");
  202980:	00203537          	lui	a0,0x203
  202984:	c9d50513          	addi	a0,a0,-867 # 202c9d <$d.1+0x95>
  202988:	fffff097          	auipc	ra,0xfffff
  20298c:	e28080e7          	jalr	-472(ra) # 2017b0 <s_printf>
  202990:	00000413          	li	s0,0
  202994:	00c10493          	addi	s1,sp,12
  202998:	00203537          	lui	a0,0x203
  20299c:	d0150913          	addi	s2,a0,-767 # 202d01 <$d.1+0xf9>
  2029a0:	00f00993          	li	s3,15
  2029a4:	20000a13          	li	s4,512
  2029a8:	00c0006f          	j	2029b4 <s_call_sdcard_read_api+0x35c>
    }

    // ---- dump（常に実行）----
    const char hex[] = "0123456789ABCDEF";

    for (int i = 0; i < 512; i++) {
  2029ac:	00140413          	addi	s0,s0,1
  2029b0:	05440c63          	beq	s0,s4,202a08 <s_call_sdcard_read_api+0x3b0>
        unsigned char d = buf[i];
  2029b4:	00848533          	add	a0,s1,s0
  2029b8:	00054a83          	lbu	s5,0(a0)
  2029bc:	004ad513          	srli	a0,s5,0x4
        putchar(hex[(d >> 4) & 0xF]);
  2029c0:	00a90533          	add	a0,s2,a0
  2029c4:	00054503          	lbu	a0,0(a0)
  2029c8:	ffffd097          	auipc	ra,0xffffd
  2029cc:	648080e7          	jalr	1608(ra) # 200010 <putchar>
        putchar(hex[d & 0xF]);
  2029d0:	00faf513          	andi	a0,s5,15
  2029d4:	00a90533          	add	a0,s2,a0
  2029d8:	00054503          	lbu	a0,0(a0)
  2029dc:	ffffd097          	auipc	ra,0xffffd
  2029e0:	634080e7          	jalr	1588(ra) # 200010 <putchar>
        putchar(' ');
  2029e4:	02000513          	li	a0,32
  2029e8:	ffffd097          	auipc	ra,0xffffd
  2029ec:	628080e7          	jalr	1576(ra) # 200010 <putchar>
        if ((i & 15) == 15) putchar('\n');
  2029f0:	00f47513          	andi	a0,s0,15
  2029f4:	fb351ce3          	bne	a0,s3,2029ac <s_call_sdcard_read_api+0x354>
  2029f8:	00a00513          	li	a0,10
  2029fc:	ffffd097          	auipc	ra,0xffffd
  202a00:	614080e7          	jalr	1556(ra) # 200010 <putchar>
  202a04:	fa9ff06f          	j	2029ac <s_call_sdcard_read_api+0x354>
  202a08:	23c12083          	lw	ra,572(sp)
  202a0c:	23812403          	lw	s0,568(sp)
  202a10:	23412483          	lw	s1,564(sp)
  202a14:	23012903          	lw	s2,560(sp)
  202a18:	22c12983          	lw	s3,556(sp)
  202a1c:	22812a03          	lw	s4,552(sp)
  202a20:	22412a83          	lw	s5,548(sp)
  202a24:	22012b03          	lw	s6,544(sp)
  202a28:	21c12b83          	lw	s7,540(sp)
  202a2c:	21812c03          	lw	s8,536(sp)
  202a30:	21412c83          	lw	s9,532(sp)
  202a34:	21012d03          	lw	s10,528(sp)
  202a38:	20c12d83          	lw	s11,524(sp)
    }
  202a3c:	24010113          	addi	sp,sp,576
  202a40:	00008067          	ret
            s_printf("CRC OK (retry=%d)\n", retry);
  202a44:	00203537          	lui	a0,0x203
  202a48:	e1450513          	addi	a0,a0,-492 # 202e14 <$d.3+0x5f>
  202a4c:	00048593          	mv	a1,s1
  202a50:	fffff097          	auipc	ra,0xfffff
  202a54:	d60080e7          	jalr	-672(ra) # 2017b0 <s_printf>
  202a58:	f39ff06f          	j	202990 <s_call_sdcard_read_api+0x338>

00202a5c <__mulsi3>:
  202a5c:	00000613          	li	a2,0
  202a60:	02058063          	beqz	a1,202a80 <__mulsi3+0x24>
  202a64:	01f59693          	slli	a3,a1,0x1f
  202a68:	41f6d693          	srai	a3,a3,0x1f
  202a6c:	00a6f6b3          	and	a3,a3,a0
  202a70:	00c68633          	add	a2,a3,a2
  202a74:	0015d593          	srli	a1,a1,0x1
  202a78:	00151513          	slli	a0,a0,0x1
  202a7c:	fe0594e3          	bnez	a1,202a64 <__mulsi3+0x8>
  202a80:	00060513          	mv	a0,a2
  202a84:	00008067          	ret

00202a88 <__udivsi3>:
  202a88:	04058a63          	beqz	a1,202adc <__udivsi3+0x54>
  202a8c:	00000813          	li	a6,0
  202a90:	00000613          	li	a2,0
  202a94:	01f00693          	li	a3,31
  202a98:	00100713          	li	a4,1
  202a9c:	fff00793          	li	a5,-1
  202aa0:	00181813          	slli	a6,a6,0x1
  202aa4:	00d558b3          	srl	a7,a0,a3
  202aa8:	0018f893          	andi	a7,a7,1
  202aac:	0108e833          	or	a6,a7,a6
  202ab0:	00b838b3          	sltu	a7,a6,a1
  202ab4:	00d712b3          	sll	t0,a4,a3
  202ab8:	fff88893          	addi	a7,a7,-1
  202abc:	0058f2b3          	and	t0,a7,t0
  202ac0:	00c2e633          	or	a2,t0,a2
  202ac4:	00b8f8b3          	and	a7,a7,a1
  202ac8:	fff68693          	addi	a3,a3,-1
  202acc:	41180833          	sub	a6,a6,a7
  202ad0:	fcf698e3          	bne	a3,a5,202aa0 <__udivsi3+0x18>
  202ad4:	00060513          	mv	a0,a2
  202ad8:	00008067          	ret
  202adc:	00000513          	li	a0,0
  202ae0:	00008067          	ret

00202ae4 <__umodsi3>:
  202ae4:	00000613          	li	a2,0
  202ae8:	02058a63          	beqz	a1,202b1c <__umodsi3+0x38>
  202aec:	01f00693          	li	a3,31
  202af0:	fff00713          	li	a4,-1
  202af4:	00161613          	slli	a2,a2,0x1
  202af8:	00d557b3          	srl	a5,a0,a3
  202afc:	0017f793          	andi	a5,a5,1
  202b00:	00c7e633          	or	a2,a5,a2
  202b04:	00b637b3          	sltu	a5,a2,a1
  202b08:	fff78793          	addi	a5,a5,-1
  202b0c:	00b7f7b3          	and	a5,a5,a1
  202b10:	fff68693          	addi	a3,a3,-1
  202b14:	40f60633          	sub	a2,a2,a5
  202b18:	fce69ee3          	bne	a3,a4,202af4 <__umodsi3+0x10>
  202b1c:	00060513          	mv	a0,a2
  202b20:	00008067          	ret

00202b24 <__divsi3>:
  202b24:	06058c63          	beqz	a1,202b9c <__divsi3+0x78>
  202b28:	00000293          	li	t0,0
  202b2c:	00000613          	li	a2,0
  202b30:	41f55693          	srai	a3,a0,0x1f
  202b34:	00d54733          	xor	a4,a0,a3
  202b38:	40d706b3          	sub	a3,a4,a3
  202b3c:	41f5d713          	srai	a4,a1,0x1f
  202b40:	00e5c7b3          	xor	a5,a1,a4
  202b44:	40e78733          	sub	a4,a5,a4
  202b48:	01f00793          	li	a5,31
  202b4c:	00100813          	li	a6,1
  202b50:	fff00893          	li	a7,-1
  202b54:	00129293          	slli	t0,t0,0x1
  202b58:	00f6d333          	srl	t1,a3,a5
  202b5c:	00137313          	andi	t1,t1,1
  202b60:	005362b3          	or	t0,t1,t0
  202b64:	00e2b333          	sltu	t1,t0,a4
  202b68:	00f813b3          	sll	t2,a6,a5
  202b6c:	fff30313          	addi	t1,t1,-1
  202b70:	007373b3          	and	t2,t1,t2
  202b74:	00c3e633          	or	a2,t2,a2
  202b78:	00e37333          	and	t1,t1,a4
  202b7c:	fff78793          	addi	a5,a5,-1
  202b80:	406282b3          	sub	t0,t0,t1
  202b84:	fd1798e3          	bne	a5,a7,202b54 <__divsi3+0x30>
  202b88:	00a5c533          	xor	a0,a1,a0
  202b8c:	00055463          	bgez	a0,202b94 <__divsi3+0x70>
  202b90:	40c00633          	neg	a2,a2
  202b94:	00060513          	mv	a0,a2
  202b98:	00008067          	ret
  202b9c:	00000513          	li	a0,0
  202ba0:	00008067          	ret

00202ba4 <__modsi3>:
  202ba4:	00000613          	li	a2,0
  202ba8:	04058a63          	beqz	a1,202bfc <__modsi3+0x58>
  202bac:	41f55693          	srai	a3,a0,0x1f
  202bb0:	00d54733          	xor	a4,a0,a3
  202bb4:	40d706b3          	sub	a3,a4,a3
  202bb8:	41f5d713          	srai	a4,a1,0x1f
  202bbc:	00e5c5b3          	xor	a1,a1,a4
  202bc0:	40e585b3          	sub	a1,a1,a4
  202bc4:	01f00713          	li	a4,31
  202bc8:	fff00793          	li	a5,-1
  202bcc:	00161613          	slli	a2,a2,0x1
  202bd0:	00e6d833          	srl	a6,a3,a4
  202bd4:	00187813          	andi	a6,a6,1
  202bd8:	00c86633          	or	a2,a6,a2
  202bdc:	00b63833          	sltu	a6,a2,a1
  202be0:	fff80813          	addi	a6,a6,-1
  202be4:	00b87833          	and	a6,a6,a1
  202be8:	fff70713          	addi	a4,a4,-1
  202bec:	41060633          	sub	a2,a2,a6
  202bf0:	fcf71ee3          	bne	a4,a5,202bcc <__modsi3+0x28>
  202bf4:	00055463          	bgez	a0,202bfc <__modsi3+0x58>
  202bf8:	40c00633          	neg	a2,a2
  202bfc:	00060513          	mv	a0,a2
  202c00:	00008067          	ret

セクション .rodata の逆アセンブル:

00202c08 <$d.1>:
  202c08:	0f40                	.insn	2, 0x0f40
  202c0a:	0020                	.insn	2, 0x0020
  202c0c:	104c                	.insn	2, 0x104c
  202c0e:	0020                	.insn	2, 0x0020
  202c10:	0f94                	.insn	2, 0x0f94
  202c12:	0020                	.insn	2, 0x0020
  202c14:	1084                	.insn	2, 0x1084
  202c16:	0020                	.insn	2, 0x0020
  202c18:	10bc                	.insn	2, 0x10bc
  202c1a:	0020                	.insn	2, 0x0020
  202c1c:	1024                	.insn	2, 0x1024
  202c1e:	0020                	.insn	2, 0x0020
  202c20:	1024                	.insn	2, 0x1024
  202c22:	0020                	.insn	2, 0x0020
  202c24:	1138                	.insn	2, 0x1138
  202c26:	0020                	.insn	2, 0x0020
  202c28:	1024                	.insn	2, 0x1024
  202c2a:	0020                	.insn	2, 0x0020
  202c2c:	0f5c                	.insn	2, 0x0f5c
  202c2e:	0020                	.insn	2, 0x0020
  202c30:	30f1                	.insn	2, 0x30f1
  202c32:	0020                	.insn	2, 0x0020
  202c34:	2cd9                	.insn	2, 0x2cd9
  202c36:	0020                	.insn	2, 0x0020
  202c38:	2d2d                	.insn	2, 0x2d2d
  202c3a:	202d                	.insn	2, 0x202d
  202c3c:	61657263          	bgeu	a0,s6,203240 <$d.4+0x12b>
  202c40:	6574                	.insn	2, 0x6574
  202c42:	705f 6f72 6563      	.insn	6, 0x65636f72705f
  202c48:	315f7373          	csrrci	t1,0x315,30
  202c4c:	2d20                	.insn	2, 0x2d20
  202c4e:	2d2d                	.insn	2, 0x2d2d
  202c50:	000a                	.insn	2, 0x000a
  202c52:	6d656d5b          	.insn	4, 0x6d656d5b
  202c56:	635f 6568 6b63      	.insn	6, 0x6b636568635f
  202c5c:	205d                	.insn	2, 0x205d
  202c5e:	75716573          	csrrsi	a0,mseccfgh,2
  202c62:	6e65                	.insn	2, 0x6e65
  202c64:	6974                	.insn	2, 0x6974
  202c66:	6c61                	.insn	2, 0x6c61
  202c68:	7220                	.insn	2, 0x7220
  202c6a:	6165                	.insn	2, 0x6165
  202c6c:	2064                	.insn	2, 0x2064
  202c6e:	2026                	.insn	2, 0x2026
  202c70:	6576                	.insn	2, 0x6576
  202c72:	6972                	.insn	2, 0x6972
  202c74:	7966                	.insn	2, 0x7966
  202c76:	7020                	.insn	2, 0x7020
  202c78:	6168                	.insn	2, 0x6168
  202c7a:	000a6573          	csrrsi	a0,0x0,20
  202c7e:	2d2d                	.insn	2, 0x2d2d
  202c80:	202d                	.insn	2, 0x202d
  202c82:	656d                	.insn	2, 0x656d
  202c84:	736d                	.insn	2, 0x736d
  202c86:	7465                	.insn	2, 0x7465
  202c88:	2d20                	.insn	2, 0x2d20
  202c8a:	2d2d                	.insn	2, 0x2d2d
  202c8c:	000a                	.insn	2, 0x000a
  202c8e:	2d2d                	.insn	2, 0x2d2d
  202c90:	202d                	.insn	2, 0x202d
  202c92:	6979                	.insn	2, 0x6979
  202c94:	6c65                	.insn	2, 0x6c65
  202c96:	2064                	.insn	2, 0x2064
  202c98:	2d2d                	.insn	2, 0x2d2d
  202c9a:	0a2d                	.insn	2, 0x0a2d
  202c9c:	4300                	.insn	2, 0x4300
  202c9e:	4352                	.insn	2, 0x4352
  202ca0:	4620                	.insn	2, 0x4620
  202ca2:	4941                	.insn	2, 0x4941
  202ca4:	454c                	.insn	2, 0x454c
  202ca6:	2044                	.insn	2, 0x2044
  202ca8:	6628                	.insn	2, 0x6628
  202caa:	6e69                	.insn	2, 0x6e69
  202cac:	6c61                	.insn	2, 0x6c61
  202cae:	0a29                	.insn	2, 0x0a29
  202cb0:	5b00                	.insn	2, 0x5b00
  202cb2:	656d                	.insn	2, 0x656d
  202cb4:	5f6d                	.insn	2, 0x5f6d
  202cb6:	63656863          	bltu	a0,s6,2032e6 <$d.4+0x1d1>
  202cba:	72205d6b          	.insn	4, 0x72205d6b
  202cbe:	6e61                	.insn	2, 0x6e61
  202cc0:	6f64                	.insn	2, 0x6f64
  202cc2:	206d                	.insn	2, 0x206d
  202cc4:	6572                	.insn	2, 0x6572
  202cc6:	6461                	.insn	2, 0x6461
  202cc8:	2620                	.insn	2, 0x2620
  202cca:	7620                	.insn	2, 0x7620
  202ccc:	7265                	.insn	2, 0x7265
  202cce:	6669                	.insn	2, 0x6669
  202cd0:	2079                	.insn	2, 0x2079
  202cd2:	6870                	.insn	2, 0x6870
  202cd4:	7361                	.insn	2, 0x7361
  202cd6:	0a65                	.insn	2, 0x0a65
  202cd8:	3100                	.insn	2, 0x3100
  202cda:	3030                	.insn	2, 0x3030
  202cdc:	7500                	.insn	2, 0x7500
  202cde:	65676173          	csrrsi	sp,hviprio1h,14
  202ce2:	203a                	.insn	2, 0x203a
  202ce4:	7564                	.insn	2, 0x7564
  202ce6:	706d                	.insn	2, 0x706d
  202ce8:	5b20                	.insn	2, 0x5b20
  202cea:	7366666f          	jal	a2,269420 <__free_ram+0x13420>
  202cee:	7465                	.insn	2, 0x7465
  202cf0:	685f 7865 205d      	.insn	6, 0x205d7865685f
  202cf6:	6e656c5b          	.insn	4, 0x6e656c5b
  202cfa:	685f 7865 0a5d      	.insn	6, 0x0a5d7865685f
  202d00:	3000                	.insn	2, 0x3000
  202d02:	3231                	.insn	2, 0x3231
  202d04:	36353433          	.insn	4, 0x36353433
  202d08:	41393837          	lui	a6,0x41393
  202d0c:	4342                	.insn	2, 0x4342
  202d0e:	4544                	.insn	2, 0x4544
  202d10:	0046                	.insn	2, 0x0046

00202d12 <$d.1>:
  202d12:	4552                	.insn	2, 0x4552
  202d14:	4441                	.insn	2, 0x4441
  202d16:	4620                	.insn	2, 0x4620
  202d18:	4941                	.insn	2, 0x4941
  202d1a:	204c                	.insn	2, 0x204c
  202d1c:	6572                	.insn	2, 0x6572
  202d1e:	7274                	.insn	2, 0x7274
  202d20:	3d79                	.insn	2, 0x3d79
  202d22:	6425                	.insn	2, 0x6425
  202d24:	000a                	.insn	2, 0x000a
  202d26:	2f2e                	.insn	2, 0x2f2e
  202d28:	2f637273          	csrrci	tp,0x2f6,6
  202d2c:	6e72656b          	.insn	4, 0x6e72656b
  202d30:	6c65                	.insn	2, 0x6c65
  202d32:	632e                	.insn	2, 0x632e
  202d34:	2d00                	.insn	2, 0x2d00
  202d36:	2d2d                	.insn	2, 0x2d2d
  202d38:	202d                	.insn	2, 0x202d
  202d3a:	432d4453          	.insn	4, 0x432d4453
  202d3e:	7261                	.insn	2, 0x7261
  202d40:	2064                	.insn	2, 0x2064
  202d42:	4649                	.insn	2, 0x4649
  202d44:	6120                	.insn	2, 0x6120
  202d46:	6464                	.insn	2, 0x6464
  202d48:	6572                	.insn	2, 0x6572
  202d4a:	6d207373          	csrrci	t1,0x6d2,0
  202d4e:	7061                	.insn	2, 0x7061
  202d50:	7320                	.insn	2, 0x7320
  202d52:	6174                	.insn	2, 0x6174
  202d54:	7472                	.insn	2, 0x7472
  202d56:	202e                	.insn	2, 0x202e
  202d58:	2d2d                	.insn	2, 0x2d2d
  202d5a:	2d2d                	.insn	2, 0x2d2d
  202d5c:	000a                	.insn	2, 0x000a
  202d5e:	4150                	.insn	2, 0x4150
  202d60:	494e                	.insn	2, 0x494e
  202d62:	25203a43          	.insn	4, 0x25203a43
  202d66:	64253a73          	csrrc	s4,0x642,a0
  202d6a:	203a                	.insn	2, 0x203a
  202d6c:	6e75                	.insn	2, 0x6e75
  202d6e:	7865                	.insn	2, 0x7865
  202d70:	6570                	.insn	2, 0x6570
  202d72:	64657463          	bgeu	a0,t1,2033ba <_binary_shell_bin_start+0x47>
  202d76:	7420                	.insn	2, 0x7420
  202d78:	6172                	.insn	2, 0x6172
  202d7a:	2070                	.insn	2, 0x2070
  202d7c:	75616373          	csrrsi	t1,0x756,2
  202d80:	253d6573          	csrrsi	a0,vsireg3,26
  202d84:	2078                	.insn	2, 0x2078
  202d86:	61767473          	csrrci	s0,0x617,12
  202d8a:	3d6c                	.insn	2, 0x3d6c
  202d8c:	7825                	.insn	2, 0x7825
  202d8e:	7320                	.insn	2, 0x7320
  202d90:	7065                	.insn	2, 0x7065
  202d92:	78253d63          	.insn	4, 0x78253d63
  202d96:	0a0a                	.insn	2, 0x0a0a
  202d98:	5000                	.insn	2, 0x5000
  202d9a:	4f5f4353          	.insn	4, 0x4f5f4353
  202d9e:	6f422053          	.insn	4, 0x6f422053
  202da2:	5320746f          	jal	s0,20a2d4 <_binary_shell_bin_start+0x6f61>
  202da6:	6174                	.insn	2, 0x6174
  202da8:	7472                	.insn	2, 0x7472
  202daa:	2e2e                	.insn	2, 0x2e2e
  202dac:	2e2e                	.insn	2, 0x2e2e
  202dae:	2e2e                	.insn	2, 0x2e2e
  202db0:	2e2e                	.insn	2, 0x2e2e
  202db2:	0a2e                	.insn	2, 0x0a2e
	...

00202db5 <$d.3>:
  202db5:	725f6173          	csrrsi	sp,mhpmevent5h,30
  202db9:	6e75                	.insn	2, 0x6e75
  202dbb:	7320                	.insn	2, 0x7320
  202dbd:	6174                	.insn	2, 0x6174
  202dbf:	7472                	.insn	2, 0x7472
  202dc1:	0a2e                	.insn	2, 0x0a2e
  202dc3:	2d00                	.insn	2, 0x2d00
  202dc5:	2d2d                	.insn	2, 0x2d2d
  202dc7:	202d                	.insn	2, 0x202d
  202dc9:	63204153          	.insn	4, 0x63204153
  202dcd:	2065726f          	jal	tp,259fd3 <__free_ram+0x3fd3>
  202dd1:	6461                	.insn	2, 0x6461
  202dd3:	7264                	.insn	2, 0x7264
  202dd5:	7365                	.insn	2, 0x7365
  202dd7:	616d2073          	csrs	0x616,s10
  202ddb:	2070                	.insn	2, 0x2070
  202ddd:	72617473          	csrrci	s0,mhpmevent6h,2
  202de1:	2e74                	.insn	2, 0x2e74
  202de3:	2d20                	.insn	2, 0x2d20
  202de5:	2d2d                	.insn	2, 0x2d2d
  202de7:	0a2d                	.insn	2, 0x0a2d
  202de9:	3000                	.insn	2, 0x3000
  202deb:	3a38                	.insn	2, 0x3a38
  202ded:	3734                	.insn	2, 0x3734
  202def:	343a                	.insn	2, 0x343a
  202df1:	0038                	.insn	2, 0x0038
  202df3:	2d2d                	.insn	2, 0x2d2d
  202df5:	2d2d                	.insn	2, 0x2d2d
  202df7:	7520                	.insn	2, 0x7520
  202df9:	20726573          	csrrsi	a0,0x207,4
  202dfd:	6d69                	.insn	2, 0x6d69
  202dff:	6761                	.insn	2, 0x6761
  202e01:	2065                	.insn	2, 0x2065
  202e03:	616d                	.insn	2, 0x616d
  202e05:	2070                	.insn	2, 0x2070
  202e07:	72617473          	csrrci	s0,mhpmevent6h,2
  202e0b:	2e74                	.insn	2, 0x2e74
  202e0d:	2d20                	.insn	2, 0x2d20
  202e0f:	2d2d                	.insn	2, 0x2d2d
  202e11:	0a2d                	.insn	2, 0x0a2d
  202e13:	4300                	.insn	2, 0x4300
  202e15:	4352                	.insn	2, 0x4352
  202e17:	4f20                	.insn	2, 0x4f20
  202e19:	7228204b          	.insn	4, 0x7228204b
  202e1d:	7465                	.insn	2, 0x7465
  202e1f:	7972                	.insn	2, 0x7972
  202e21:	253d                	.insn	2, 0x253d
  202e23:	2964                	.insn	2, 0x2964
  202e25:	000a                	.insn	2, 0x000a
  202e27:	2d2d                	.insn	2, 0x2d2d
  202e29:	2d2d                	.insn	2, 0x2d2d
  202e2b:	5320                	.insn	2, 0x5320
  202e2d:	2041                	.insn	2, 0x2041
  202e2f:	65726f63          	bltu	tp,s7,20348d <_binary_shell_bin_start+0x11a>
  202e33:	6420                	.insn	2, 0x6420
  202e35:	7461                	.insn	2, 0x7461
  202e37:	2061                	.insn	2, 0x2061
  202e39:	61206277          	.insn	4, 0x61206277
  202e3d:	6464                	.insn	2, 0x6464
  202e3f:	6572                	.insn	2, 0x6572
  202e41:	6d207373          	csrrci	t1,0x6d2,0
  202e45:	7061                	.insn	2, 0x7061
  202e47:	7320                	.insn	2, 0x7320
  202e49:	6174                	.insn	2, 0x6174
  202e4b:	7472                	.insn	2, 0x7472
  202e4d:	202e                	.insn	2, 0x202e
  202e4f:	2d2d                	.insn	2, 0x2d2d
  202e51:	2d2d                	.insn	2, 0x2d2d
  202e53:	000a                	.insn	2, 0x000a
  202e55:	2d2d                	.insn	2, 0x2d2d
  202e57:	2d2d                	.insn	2, 0x2d2d
  202e59:	5320                	.insn	2, 0x5320
  202e5b:	2041                	.insn	2, 0x2041
  202e5d:	65726f63          	bltu	tp,s7,2034bb <_binary_shell_bin_start+0x148>
  202e61:	6420                	.insn	2, 0x6420
  202e63:	7461                	.insn	2, 0x7461
  202e65:	2061                	.insn	2, 0x2061
  202e67:	6461                	.insn	2, 0x6461
  202e69:	7264                	.insn	2, 0x7264
  202e6b:	7365                	.insn	2, 0x7365
  202e6d:	616d2073          	csrs	0x616,s10
  202e71:	2070                	.insn	2, 0x2070
  202e73:	72617473          	csrrci	s0,mhpmevent6h,2
  202e77:	2e74                	.insn	2, 0x2e74
  202e79:	2d20                	.insn	2, 0x2d20
  202e7b:	2d2d                	.insn	2, 0x2d2d
  202e7d:	0a2d                	.insn	2, 0x0a2d
  202e7f:	4300                	.insn	2, 0x4300
  202e81:	4352                	.insn	2, 0x4352
  202e83:	4e20                	.insn	2, 0x4e20
  202e85:	65722047          	.insn	4, 0x65722047
  202e89:	7274                	.insn	2, 0x7274
  202e8b:	3d79                	.insn	2, 0x3d79
  202e8d:	6425                	.insn	2, 0x6425
  202e8f:	2820                	.insn	2, 0x2820
  202e91:	636c6163          	bltu	s8,s6,2034b3 <_binary_shell_bin_start+0x140>
  202e95:	253d                	.insn	2, 0x253d
  202e97:	2078                	.insn	2, 0x2078
  202e99:	7768                	.insn	2, 0x7768
  202e9b:	253d                	.insn	2, 0x253d
  202e9d:	2978                	.insn	2, 0x2978
  202e9f:	000a                	.insn	2, 0x000a
  202ea1:	6d656d5b          	.insn	4, 0x6d656d5b
  202ea5:	635f 6568 6b63      	.insn	6, 0x6b636568635f
  202eab:	205d                	.insn	2, 0x205d
  202ead:	28204b4f          	.insn	4, 0x28204b4f
  202eb1:	5652                	.insn	2, 0x5652
  202eb3:	20493233          	.insn	4, 0x20493233
  202eb7:	65666173          	csrrsi	sp,hviprio1h,12
  202ebb:	0a29                	.insn	2, 0x0a29
  202ebd:	5b00                	.insn	2, 0x5b00
  202ebf:	656d                	.insn	2, 0x656d
  202ec1:	5f6d                	.insn	2, 0x5f6d
  202ec3:	63656863          	bltu	a0,s6,2034f3 <_binary_shell_bin_start+0x180>
  202ec7:	4e205d6b          	.insn	4, 0x4e205d6b
  202ecb:	21212147          	.insn	4, 0x21212147
  202ecf:	2820                	.insn	2, 0x2820
  202ed1:	5652                	.insn	2, 0x5652
  202ed3:	20493233          	.insn	4, 0x20493233
  202ed7:	6166                	.insn	2, 0x6166
  202ed9:	6c69                	.insn	2, 0x6c69
  202edb:	0a29                	.insn	2, 0x0a29
  202edd:	0a00                	.insn	2, 0x0a00
  202edf:	2d2d2d2b          	.insn	4, 0x2d2d2d2b
  202ee3:	2d2d                	.insn	2, 0x2d2d
  202ee5:	2d2d                	.insn	2, 0x2d2d
  202ee7:	2d2d                	.insn	2, 0x2d2d
  202ee9:	2d2d                	.insn	2, 0x2d2d
  202eeb:	2d2d                	.insn	2, 0x2d2d
  202eed:	2d2d                	.insn	2, 0x2d2d
  202eef:	2d2d                	.insn	2, 0x2d2d
  202ef1:	2d2d                	.insn	2, 0x2d2d
  202ef3:	2d2d                	.insn	2, 0x2d2d
  202ef5:	2d2d                	.insn	2, 0x2d2d
  202ef7:	2d2d                	.insn	2, 0x2d2d
  202ef9:	2d2d                	.insn	2, 0x2d2d
  202efb:	2d2d                	.insn	2, 0x2d2d
  202efd:	2d2d                	.insn	2, 0x2d2d
  202eff:	2d2d                	.insn	2, 0x2d2d
  202f01:	2d2d                	.insn	2, 0x2d2d
  202f03:	2d2d                	.insn	2, 0x2d2d
  202f05:	2d2d                	.insn	2, 0x2d2d
  202f07:	2d2d                	.insn	2, 0x2d2d
  202f09:	2d2d                	.insn	2, 0x2d2d
  202f0b:	2d2d                	.insn	2, 0x2d2d
  202f0d:	2d2d                	.insn	2, 0x2d2d
  202f0f:	2d2d                	.insn	2, 0x2d2d
  202f11:	2b2d                	.insn	2, 0x2b2d
  202f13:	7c0a                	.insn	2, 0x7c0a
  202f15:	2020                	.insn	2, 0x2020
  202f17:	2020                	.insn	2, 0x2020
  202f19:	2020                	.insn	2, 0x2020
  202f1b:	2020                	.insn	2, 0x2020
  202f1d:	2020                	.insn	2, 0x2020
  202f1f:	2020                	.insn	2, 0x2020
  202f21:	2020                	.insn	2, 0x2020
  202f23:	2020                	.insn	2, 0x2020
  202f25:	2020                	.insn	2, 0x2020
  202f27:	2020                	.insn	2, 0x2020
  202f29:	5350                	.insn	2, 0x5350
  202f2b:	534f5f43          	.insn	4, 0x534f5f43
  202f2f:	2020                	.insn	2, 0x2020
  202f31:	2020                	.insn	2, 0x2020
  202f33:	2020                	.insn	2, 0x2020
  202f35:	2020                	.insn	2, 0x2020
  202f37:	2020                	.insn	2, 0x2020
  202f39:	2020                	.insn	2, 0x2020
  202f3b:	2020                	.insn	2, 0x2020
  202f3d:	2020                	.insn	2, 0x2020
  202f3f:	2020                	.insn	2, 0x2020
  202f41:	2020                	.insn	2, 0x2020
  202f43:	2020                	.insn	2, 0x2020
  202f45:	2020                	.insn	2, 0x2020
  202f47:	0a7c                	.insn	2, 0x0a7c
  202f49:	207c                	.insn	2, 0x207c
  202f4b:	2020                	.insn	2, 0x2020
  202f4d:	2020                	.insn	2, 0x2020
  202f4f:	2020                	.insn	2, 0x2020
  202f51:	2020                	.insn	2, 0x2020
  202f53:	2020                	.insn	2, 0x2020
  202f55:	4d20                	.insn	2, 0x4d20
  202f57:	6e69                	.insn	2, 0x6e69
  202f59:	6d69                	.insn	2, 0x6d69
  202f5b:	6c61                	.insn	2, 0x6c61
  202f5d:	5220                	.insn	2, 0x5220
  202f5f:	5349                	.insn	2, 0x5349
  202f61:	20562d43          	.insn	4, 0x20562d43
  202f65:	6e72654b          	.insn	4, 0x6e72654b
  202f69:	6c65                	.insn	2, 0x6c65
  202f6b:	4220                	.insn	2, 0x4220
  202f6d:	20746f6f          	jal	t5,249973 <__bss_end+0x13e5f>
  202f71:	2020                	.insn	2, 0x2020
  202f73:	2020                	.insn	2, 0x2020
  202f75:	2020                	.insn	2, 0x2020
  202f77:	2020                	.insn	2, 0x2020
  202f79:	2020                	.insn	2, 0x2020
  202f7b:	7c20                	.insn	2, 0x7c20
  202f7d:	2b0a                	.insn	2, 0x2b0a
  202f7f:	2d2d                	.insn	2, 0x2d2d
  202f81:	2d2d                	.insn	2, 0x2d2d
  202f83:	2d2d                	.insn	2, 0x2d2d
  202f85:	2d2d                	.insn	2, 0x2d2d
  202f87:	2d2d                	.insn	2, 0x2d2d
  202f89:	2d2d                	.insn	2, 0x2d2d
  202f8b:	2d2d                	.insn	2, 0x2d2d
  202f8d:	2d2d                	.insn	2, 0x2d2d
  202f8f:	2d2d                	.insn	2, 0x2d2d
  202f91:	2d2d                	.insn	2, 0x2d2d
  202f93:	2d2d                	.insn	2, 0x2d2d
  202f95:	2d2d                	.insn	2, 0x2d2d
  202f97:	2d2d                	.insn	2, 0x2d2d
  202f99:	2d2d                	.insn	2, 0x2d2d
  202f9b:	2d2d                	.insn	2, 0x2d2d
  202f9d:	2d2d                	.insn	2, 0x2d2d
  202f9f:	2d2d                	.insn	2, 0x2d2d
  202fa1:	2d2d                	.insn	2, 0x2d2d
  202fa3:	2d2d                	.insn	2, 0x2d2d
  202fa5:	2d2d                	.insn	2, 0x2d2d
  202fa7:	2d2d                	.insn	2, 0x2d2d
  202fa9:	2d2d                	.insn	2, 0x2d2d
  202fab:	2d2d                	.insn	2, 0x2d2d
  202fad:	2d2d                	.insn	2, 0x2d2d
  202faf:	2d2d                	.insn	2, 0x2d2d
  202fb1:	207c0a2b          	.insn	4, 0x207c0a2b
  202fb5:	7542                	.insn	2, 0x7542
  202fb7:	6c69                	.insn	2, 0x6c69
  202fb9:	2064                	.insn	2, 0x2064
  202fbb:	203a                	.insn	2, 0x203a
  202fbd:	7325                	.insn	2, 0x7325
  202fbf:	2520                	.insn	2, 0x2520
  202fc1:	207c0a73          	.insn	4, 0x207c0a73
  202fc5:	20555043          	.insn	4, 0x20555043
  202fc9:	2020                	.insn	2, 0x2020
  202fcb:	203a                	.insn	2, 0x203a
  202fcd:	5652                	.insn	2, 0x5652
  202fcf:	28203233          	.insn	4, 0x28203233
  202fd3:	65707553          	.insn	4, 0x65707553
  202fd7:	7672                	.insn	2, 0x7672
  202fd9:	7369                	.insn	2, 0x7369
  202fdb:	6d20726f          	jal	tp,20a6ad <_binary_shell_bin_start+0x733a>
  202fdf:	2965646f          	jal	s0,259275 <__free_ram+0x3275>
  202fe3:	7c0a                	.insn	2, 0x7c0a
  202fe5:	4d20                	.insn	2, 0x4d20
  202fe7:	554d                	.insn	2, 0x554d
  202fe9:	2020                	.insn	2, 0x2020
  202feb:	3a20                	.insn	2, 0x3a20
  202fed:	5320                	.insn	2, 0x5320
  202fef:	3356                	.insn	2, 0x3356
  202ff1:	0a32                	.insn	2, 0x0a32
  202ff3:	207c                	.insn	2, 0x207c
  202ff5:	4155                	.insn	2, 0x4155
  202ff7:	5452                	.insn	2, 0x5452
  202ff9:	2020                	.insn	2, 0x2020
  202ffb:	203a                	.insn	2, 0x203a
  202ffd:	20494253          	.insn	4, 0x20494253
  203001:	736e6f63          	bltu	t3,s6,20373f <_binary_shell_bin_start+0x3cc>
  203005:	20656c6f          	jal	s8,25920b <__free_ram+0x320b>
  203009:	7c0a726f          	jal	tp,2aa7c9 <__free_ram+0x547c9>
  20300d:	5520                	.insn	2, 0x5520
  20300f:	5241                	.insn	2, 0x5241
  203011:	2054                	.insn	2, 0x2054
  203013:	3a20                	.insn	2, 0x3a20
  203015:	4d20                	.insn	2, 0x4d20
  203017:	494d                	.insn	2, 0x494d
  203019:	6f63204f          	.insn	4, 0x6f63204f
  20301d:	736e                	.insn	2, 0x736e
  20301f:	0a656c6f          	jal	s8,2590c5 <__free_ram+0x30c5>
  203023:	207c                	.insn	2, 0x207c
  203025:	20444d43          	.insn	4, 0x20444d43
  203029:	2020                	.insn	2, 0x2020
  20302b:	203a                	.insn	2, 0x203a
  20302d:	6568                	.insn	2, 0x6568
  20302f:	6c6c                	.insn	2, 0x6c6c
  203031:	70202c6f          	jal	s8,205733 <_binary_shell_bin_start+0x23c0>
  203035:	6972                	.insn	2, 0x6972
  203037:	656d                	.insn	2, 0x656d
  203039:	64202c73          	csrr	s8,0x642
  20303d:	6d75                	.insn	2, 0x6d75
  20303f:	2c70                	.insn	2, 0x2c70
  203041:	7320                	.insn	2, 0x7320
  203043:	5f61                	.insn	2, 0x5f61
  203045:	72617473          	csrrci	s0,mhpmevent6h,2
  203049:	0a74                	.insn	2, 0x0a74
  20304b:	207c                	.insn	2, 0x207c
  20304d:	7571                	.insn	2, 0x7571
  20304f:	7469                	.insn	2, 0x7469
  203051:	2020                	.insn	2, 0x2020
  203053:	203a                	.insn	2, 0x203a
  203055:	2b6c7443          	.insn	4, 0x2b6c7443
  203059:	2041                	.insn	2, 0x2041
  20305b:	71202e43          	.insn	4, 0x71202e43
  20305f:	0a2e                	.insn	2, 0x0a2e
  203061:	2d2d2d2b          	.insn	4, 0x2d2d2d2b
  203065:	2d2d                	.insn	2, 0x2d2d
  203067:	2d2d                	.insn	2, 0x2d2d
  203069:	2d2d                	.insn	2, 0x2d2d
  20306b:	2d2d                	.insn	2, 0x2d2d
  20306d:	2d2d                	.insn	2, 0x2d2d
  20306f:	2d2d                	.insn	2, 0x2d2d
  203071:	2d2d                	.insn	2, 0x2d2d
  203073:	2d2d                	.insn	2, 0x2d2d
  203075:	2d2d                	.insn	2, 0x2d2d
  203077:	2d2d                	.insn	2, 0x2d2d
  203079:	2d2d                	.insn	2, 0x2d2d
  20307b:	2d2d                	.insn	2, 0x2d2d
  20307d:	2d2d                	.insn	2, 0x2d2d
  20307f:	2d2d                	.insn	2, 0x2d2d
  203081:	2d2d                	.insn	2, 0x2d2d
  203083:	2d2d                	.insn	2, 0x2d2d
  203085:	2d2d                	.insn	2, 0x2d2d
  203087:	2d2d                	.insn	2, 0x2d2d
  203089:	2d2d                	.insn	2, 0x2d2d
  20308b:	2d2d                	.insn	2, 0x2d2d
  20308d:	2d2d                	.insn	2, 0x2d2d
  20308f:	2d2d                	.insn	2, 0x2d2d
  203091:	2d2d                	.insn	2, 0x2d2d
  203093:	2b2d                	.insn	2, 0x2b2d
  203095:	000a                	.insn	2, 0x000a
  203097:	4150                	.insn	2, 0x4150
  203099:	494e                	.insn	2, 0x494e
  20309b:	25203a43          	.insn	4, 0x25203a43
  20309f:	64253a73          	csrrc	s4,0x642,a0
  2030a3:	203a                	.insn	2, 0x203a
  2030a5:	6e75                	.insn	2, 0x6e75
  2030a7:	7865                	.insn	2, 0x7865
  2030a9:	6570                	.insn	2, 0x6570
  2030ab:	64657463          	bgeu	a0,t1,2036f3 <_binary_shell_bin_start+0x380>
  2030af:	7320                	.insn	2, 0x7320
  2030b1:	7379                	.insn	2, 0x7379
  2030b3:	6c6c6163          	bltu	s8,t1,203775 <_binary_shell_bin_start+0x402>
  2030b7:	6120                	.insn	2, 0x6120
  2030b9:	78253d33          	.insn	4, 0x78253d33
  2030bd:	0a0a                	.insn	2, 0x0a0a
  2030bf:	5600                	.insn	2, 0x5600
  2030c1:	7265                	.insn	2, 0x7265
  2030c3:	203a                	.insn	2, 0x203a
  2030c5:	6574                	.insn	2, 0x6574
  2030c7:	315f7473          	csrrci	s0,0x315,30
  2030cb:	342e                	.insn	2, 0x342e
  2030cd:	322e                	.insn	2, 0x322e
  2030cf:	000a                	.insn	2, 0x000a
  2030d1:	6d656d5b          	.insn	4, 0x6d656d5b
  2030d5:	635f 6568 6b63      	.insn	6, 0x6b636568635f
  2030db:	205d                	.insn	2, 0x205d
  2030dd:	6172                	.insn	2, 0x6172
  2030df:	646e                	.insn	2, 0x646e
  2030e1:	77206d6f          	jal	s10,209853 <_binary_shell_bin_start+0x64e0>
  2030e5:	6972                	.insn	2, 0x6972
  2030e7:	6574                	.insn	2, 0x6574
  2030e9:	7020                	.insn	2, 0x7020
  2030eb:	6168                	.insn	2, 0x6168
  2030ed:	000a6573          	csrrsi	a0,0x0,20
  2030f1:	7830                	.insn	2, 0x7830
  2030f3:	3032                	.insn	2, 0x3032
  2030f5:	3030                	.insn	2, 0x3030
  2030f7:	3030                	.insn	2, 0x3030
  2030f9:	2d00                	.insn	2, 0x2d00
  2030fb:	2d2d                	.insn	2, 0x2d2d
  2030fd:	202d                	.insn	2, 0x202d
  2030ff:	4d4d                	.insn	2, 0x4d4d
  203101:	4f49                	.insn	2, 0x4f49
  203103:	6d20                	.insn	2, 0x6d20
  203105:	7061                	.insn	2, 0x7061
  203107:	7320                	.insn	2, 0x7320
  203109:	6174                	.insn	2, 0x6174
  20310b:	7472                	.insn	2, 0x7472
  20310d:	202e                	.insn	2, 0x202e
  20310f:	2d2d                	.insn	2, 0x2d2d
  203111:	2d2d                	.insn	2, 0x2d2d
  203113:	000a                	.insn	2, 0x000a

00203115 <$d.4>:
  203115:	4150                	.insn	2, 0x4150
  203117:	494e                	.insn	2, 0x494e
  203119:	25203a43          	.insn	4, 0x25203a43
  20311d:	64253a73          	csrrc	s4,0x642,a0
  203121:	203a                	.insn	2, 0x203a
  203123:	2074756f          	jal	a0,24ab29 <__bss_end+0x15015>
  203127:	6d20666f          	jal	a2,2097f9 <_binary_shell_bin_start+0x6486>
  20312b:	6d65                	.insn	2, 0x6d65
  20312d:	0a79726f          	jal	tp,29a9d3 <__free_ram+0x449d3>
  203131:	5b00                	.insn	2, 0x5b00
  203133:	656d                	.insn	2, 0x656d
  203135:	5f6d                	.insn	2, 0x5f6d
  203137:	63656863          	bltu	a0,s6,203767 <_binary_shell_bin_start+0x3f4>
  20313b:	73205d6b          	.insn	4, 0x73205d6b
  20313f:	7165                	.insn	2, 0x7165
  203141:	6575                	.insn	2, 0x6575
  203143:	746e                	.insn	2, 0x746e
  203145:	6169                	.insn	2, 0x6169
  203147:	206c                	.insn	2, 0x206c
  203149:	74697277          	.insn	4, 0x74697277
  20314d:	2065                	.insn	2, 0x2065
  20314f:	6870                	.insn	2, 0x6870
  203151:	7361                	.insn	2, 0x7361
  203153:	0a65                	.insn	2, 0x0a65
  203155:	4a00                	.insn	2, 0x4a00
  203157:	6e75                	.insn	2, 0x6e75
  203159:	2020                	.insn	2, 0x2020
  20315b:	2036                	.insn	2, 0x2036
  20315d:	3032                	.insn	2, 0x3032
  20315f:	3632                	.insn	2, 0x3632
  203161:	5b00                	.insn	2, 0x5b00
  203163:	6e69                	.insn	2, 0x6e69
  203165:	6f66                	.insn	2, 0x6f66
  203167:	205d                	.insn	2, 0x205d
  203169:	656c                	.insn	2, 0x656c
  20316b:	206e                	.insn	2, 0x206e
  20316d:	6f74                	.insn	2, 0x6f74
  20316f:	6962206f          	j	225805 <procs+0xd5>
  203173:	3e282067          	.insn	4, 0x3e282067
  203177:	7830                	.insn	2, 0x7830
  203179:	5825                	.insn	2, 0x5825
  20317b:	2c29                	.insn	2, 0x2c29
  20317d:	7220                	.insn	2, 0x7220
  20317f:	646e756f          	jal	a0,2ea7c5 <__free_ram+0x947c5>
  203183:	6420                	.insn	2, 0x6420
  203185:	206e776f          	jal	a4,2ea38b <__free_ram+0x9438b>
  203189:	6f74                	.insn	2, 0x6f74
  20318b:	3020                	.insn	2, 0x3020
  20318d:	2578                	.insn	2, 0x2578
  20318f:	0a58                	.insn	2, 0x0a58
  203191:	5000                	.insn	2, 0x5000
  203193:	4e41                	.insn	2, 0x4e41
  203195:	4349                	.insn	2, 0x4349
  203197:	203a                	.insn	2, 0x203a
  203199:	7325                	.insn	2, 0x7325
  20319b:	253a                	.insn	2, 0x253a
  20319d:	3a64                	.insn	2, 0x3a64
  20319f:	7520                	.insn	2, 0x7520
  2031a1:	616e                	.insn	2, 0x616e
  2031a3:	696c                	.insn	2, 0x696c
  2031a5:	64656e67          	.insn	4, 0x64656e67
  2031a9:	7020                	.insn	2, 0x7020
  2031ab:	6461                	.insn	2, 0x6461
  2031ad:	7264                	.insn	2, 0x7264
  2031af:	2520                	.insn	2, 0x2520
  2031b1:	0a78                	.insn	2, 0x0a78
  2031b3:	6300                	.insn	2, 0x6300
  2031b5:	6572                	.insn	2, 0x6572
  2031b7:	7461                	.insn	2, 0x7461
  2031b9:	5f65                	.insn	2, 0x5f65
  2031bb:	7270                	.insn	2, 0x7270
  2031bd:	7365636f          	jal	t1,2598f3 <__free_ram+0x38f3>
  2031c1:	6e455f73          	csrrwi	t5,0x6e4,10
  2031c5:	0a64                	.insn	2, 0x0a64
  2031c7:	4d00                	.insn	2, 0x4d00
  2031c9:	4d45                	.insn	2, 0x4d45
  2031cb:	4520                	.insn	2, 0x4520
  2031cd:	5252                	.insn	2, 0x5252
  2031cf:	6120524f          	.insn	4, 0x6120524f
  2031d3:	6464                	.insn	2, 0x6464
  2031d5:	3d72                	.insn	2, 0x3d72
  2031d7:	7825                	.insn	2, 0x7825
  2031d9:	7220                	.insn	2, 0x7220
  2031db:	6165                	.insn	2, 0x6165
  2031dd:	3d64                	.insn	2, 0x3d64
  2031df:	7825                	.insn	2, 0x7825
  2031e1:	6520                	.insn	2, 0x6520
  2031e3:	7078                	.insn	2, 0x7078
  2031e5:	253d                	.insn	2, 0x253d
  2031e7:	0a78                	.insn	2, 0x0a78
  2031e9:	0a00                	.insn	2, 0x0a00
  2031eb:	5000                	.insn	2, 0x5000
  2031ed:	4e41                	.insn	2, 0x4e41
  2031ef:	4349                	.insn	2, 0x4349
  2031f1:	203a                	.insn	2, 0x203a
  2031f3:	7325                	.insn	2, 0x7325
  2031f5:	253a                	.insn	2, 0x253a
  2031f7:	3a64                	.insn	2, 0x3a64
  2031f9:	7320                	.insn	2, 0x7320
  2031fb:	63746977          	.insn	4, 0x63746977
  2031ff:	6568                	.insn	2, 0x6568
  203201:	2064                	.insn	2, 0x2064
  203203:	6f74                	.insn	2, 0x6f74
  203205:	6920                	.insn	2, 0x6920
  203207:	6c64                	.insn	2, 0x6c64
  203209:	2065                	.insn	2, 0x2065
  20320b:	7270                	.insn	2, 0x7270
  20320d:	7365636f          	jal	t1,259943 <__free_ram+0x3943>
  203211:	50000a73          	.insn	4, 0x50000a73
  203215:	4e41                	.insn	2, 0x4e41
  203217:	4349                	.insn	2, 0x4349
  203219:	203a                	.insn	2, 0x203a
  20321b:	7325                	.insn	2, 0x7325
  20321d:	253a                	.insn	2, 0x253a
  20321f:	3a64                	.insn	2, 0x3a64
  203221:	5020                	.insn	2, 0x5020
  203223:	696d2043          	.insn	4, 0x696d2043
  203227:	696c6173          	csrrsi	sp,0x696,24
  20322b:	64656e67          	.insn	4, 0x64656e67
  20322f:	7320                	.insn	2, 0x7320
  203231:	7065                	.insn	2, 0x7065
  203233:	78253d63          	.insn	4, 0x78253d63
  203237:	7320                	.insn	2, 0x7320
  203239:	7674                	.insn	2, 0x7674
  20323b:	6c61                	.insn	2, 0x6c61
  20323d:	253d                	.insn	2, 0x253d
  20323f:	2078                	.insn	2, 0x2078
  203241:	61747373          	csrrci	t1,0x617,8
  203245:	7574                	.insn	2, 0x7574
  203247:	78253d73          	csrrc	s10,0x782,a0
  20324b:	0a0a                	.insn	2, 0x0a0a
  20324d:	2d00                	.insn	2, 0x2d00
  20324f:	2d2d                	.insn	2, 0x2d2d
  203251:	6320                	.insn	2, 0x6320
  203253:	6572                	.insn	2, 0x6572
  203255:	7461                	.insn	2, 0x7461
  203257:	5f65                	.insn	2, 0x5f65
  203259:	7270                	.insn	2, 0x7270
  20325b:	7365636f          	jal	t1,259991 <__free_ram+0x3991>
  20325f:	20325f73          	csrrwi	t5,0x203,4
  203263:	2d2d                	.insn	2, 0x2d2d
  203265:	0a2d                	.insn	2, 0x0a2d
  203267:	7000                	.insn	2, 0x7000
  203269:	6f72                	.insn	2, 0x6f72
  20326b:	73736563          	bltu	t1,s7,203995 <_binary_shell_bin_start+0x622>
  20326f:	2520                	.insn	2, 0x2520
  203271:	2064                	.insn	2, 0x2064
  203273:	7865                	.insn	2, 0x7865
  203275:	7469                	.insn	2, 0x7469
  203277:	6465                	.insn	2, 0x6465
  203279:	000a                	.insn	2, 0x000a
  20327b:	7375                	.insn	2, 0x7375
  20327d:	6761                	.insn	2, 0x6761
  20327f:	3a65                	.insn	2, 0x3a65
  203281:	6420                	.insn	2, 0x6420
  203283:	706d                	.insn	2, 0x706d
  203285:	5b20                	.insn	2, 0x5b20
  203287:	7366666f          	jal	a2,2699bd <__free_ram+0x139bd>
  20328b:	7465                	.insn	2, 0x7465
  20328d:	685f 7865 205d      	.insn	6, 0x205d7865685f
  203293:	6e656c5b          	.insn	4, 0x6e656c5b
  203297:	685f 7865 0a5d      	.insn	6, 0x0a5d7865685f
  20329d:	7300                	.insn	2, 0x7300
  20329f:	5f61                	.insn	2, 0x5f61
  2032a1:	7572                	.insn	2, 0x7572
  2032a3:	206e                	.insn	2, 0x206e
  2032a5:	6e65                	.insn	2, 0x6e65
  2032a7:	2e64                	.insn	2, 0x2e64
  2032a9:	0a0a                	.insn	2, 0x0a0a
  2032ab:	2d00                	.insn	2, 0x2d00
  2032ad:	2d2d                	.insn	2, 0x2d2d
  2032af:	202d                	.insn	2, 0x202d
  2032b1:	7375                	.insn	2, 0x7375
  2032b3:	7265                	.insn	2, 0x7265
  2032b5:	7320                	.insn	2, 0x7320
  2032b7:	6174                	.insn	2, 0x6174
  2032b9:	6d206b63          	bltu	zero,s2,20398f <_binary_shell_bin_start+0x61c>
  2032bd:	7061                	.insn	2, 0x7061
  2032bf:	7320                	.insn	2, 0x7320
  2032c1:	6174                	.insn	2, 0x6174
  2032c3:	7472                	.insn	2, 0x7472
  2032c5:	202e                	.insn	2, 0x202e
  2032c7:	2d2d                	.insn	2, 0x2d2d
  2032c9:	2d2d                	.insn	2, 0x2d2d
  2032cb:	000a                	.insn	2, 0x000a
  2032cd:	6d656d5b          	.insn	4, 0x6d656d5b
  2032d1:	635f 6568 6b63      	.insn	6, 0x6b636568635f
  2032d7:	205d                	.insn	2, 0x205d
  2032d9:	6172                	.insn	2, 0x6172
  2032db:	676e                	.insn	2, 0x676e
  2032dd:	2065                	.insn	2, 0x2065
  2032df:	7825                	.insn	2, 0x7825
  2032e1:	2d20                	.insn	2, 0x2d20
  2032e3:	2520                	.insn	2, 0x2520
  2032e5:	0a78                	.insn	2, 0x0a78
  2032e7:	5000                	.insn	2, 0x5000
  2032e9:	4e41                	.insn	2, 0x4e41
  2032eb:	4349                	.insn	2, 0x4349
  2032ed:	203a                	.insn	2, 0x203a
  2032ef:	7325                	.insn	2, 0x7325
  2032f1:	253a                	.insn	2, 0x253a
  2032f3:	3a64                	.insn	2, 0x3a64
  2032f5:	7520                	.insn	2, 0x7520
  2032f7:	616e                	.insn	2, 0x616e
  2032f9:	696c                	.insn	2, 0x696c
  2032fb:	64656e67          	.insn	4, 0x64656e67
  2032ff:	7620                	.insn	2, 0x7620
  203301:	6461                	.insn	2, 0x6461
  203303:	7264                	.insn	2, 0x7264
  203305:	2520                	.insn	2, 0x2520
  203307:	0a78                	.insn	2, 0x0a78
  203309:	2d00                	.insn	2, 0x2d00
  20330b:	2d2d                	.insn	2, 0x2d2d
  20330d:	7920                	.insn	2, 0x7920
  20330f:	6569                	.insn	2, 0x6569
  203311:	646c                	.insn	2, 0x646c
  203313:	6520                	.insn	2, 0x6520
  203315:	646e                	.insn	2, 0x646e
  203317:	2d20                	.insn	2, 0x2d20
  203319:	2d2d                	.insn	2, 0x2d2d
  20331b:	000a                	.insn	2, 0x000a

0020331d <print_hex8.HEX>:
    static const char HEX[] = "0123456789abcdef";
  20331d:	3130                	.insn	2, 0x3130
  20331f:	3332                	.insn	2, 0x3332
  203321:	3534                	.insn	2, 0x3534
  203323:	3736                	.insn	2, 0x3736
  203325:	3938                	.insn	2, 0x3938
  203327:	6261                	.insn	2, 0x6261
  203329:	66656463          	bltu	a0,t1,203991 <_binary_shell_bin_start+0x61e>
  20332d:	5000                	.insn	2, 0x5000
  20332f:	4e41                	.insn	2, 0x4e41
  203331:	4349                	.insn	2, 0x4349
  203333:	203a                	.insn	2, 0x203a
  203335:	7325                	.insn	2, 0x7325
  203337:	253a                	.insn	2, 0x253a
  203339:	3a64                	.insn	2, 0x3a64
  20333b:	6e20                	.insn	2, 0x6e20
  20333d:	7266206f          	j	265a63 <__free_ram+0xfa63>
  203341:	6565                	.insn	2, 0x6565
  203343:	7020                	.insn	2, 0x7020
  203345:	6f72                	.insn	2, 0x6f72
  203347:	73736563          	bltu	t1,s7,203a71 <_binary_shell_bin_start+0x6fe>
  20334b:	7320                	.insn	2, 0x7320
  20334d:	6f6c                	.insn	2, 0x6f6c
  20334f:	7374                	.insn	2, 0x7374
  203351:	000a                	.insn	2, 0x000a

00203353 <$d.1>:
  203353:	203a                	.insn	2, 0x203a
  203355:	2d00                	.insn	2, 0x2d00
  203357:	2d2d                	.insn	2, 0x2d2d
  203359:	202d                	.insn	2, 0x202d
  20335b:	6e72656b          	.insn	4, 0x6e72656b
  20335f:	6c65                	.insn	2, 0x6c65
  203361:	6d20                	.insn	2, 0x6d20
  203363:	7061                	.insn	2, 0x7061
  203365:	7320                	.insn	2, 0x7320
  203367:	6174                	.insn	2, 0x6174
  203369:	7472                	.insn	2, 0x7472
  20336b:	202e                	.insn	2, 0x202e
  20336d:	2d2d                	.insn	2, 0x2d2d
  20336f:	2d2d                	.insn	2, 0x2d2d
  203371:	000a                	.insn	2, 0x000a

00203373 <_binary_shell_bin_start>:
  203373:	00422537          	lui	a0,0x422
  203377:	39050513          	addi	a0,a0,912 # 422390 <__free_ram_end+0xcc390>
  20337b:	00050113          	mv	sp,a0
  20337f:	00000097          	auipc	ra,0x0
  203383:	010080e7          	jalr	16(ra) # 20338f <_binary_shell_bin_start+0x1c>
  203387:	00000097          	auipc	ra,0x0
  20338b:	7fc080e7          	jalr	2044(ra) # 203b83 <_binary_shell_bin_start+0x810>
  20338f:	f4010113          	addi	sp,sp,-192
  203393:	0a112e23          	sw	ra,188(sp)
  203397:	0a812c23          	sw	s0,184(sp)
  20339b:	0a912a23          	sw	s1,180(sp)
  20339f:	0b212823          	sw	s2,176(sp)
  2033a3:	0b312623          	sw	s3,172(sp)
  2033a7:	0b412423          	sw	s4,168(sp)
  2033ab:	0b512223          	sw	s5,164(sp)
  2033af:	0b612023          	sw	s6,160(sp)
  2033b3:	09712e23          	sw	s7,156(sp)
  2033b7:	09812c23          	sw	s8,152(sp)
  2033bb:	09912a23          	sw	s9,148(sp)
  2033bf:	09a12823          	sw	s10,144(sp)
  2033c3:	09b12623          	sw	s11,140(sp)
  2033c7:	00401537          	lui	a0,0x401
  2033cb:	31f50513          	addi	a0,a0,799 # 40131f <__free_ram_end+0xab31f>
  2033cf:	00001097          	auipc	ra,0x1
  2033d3:	c00080e7          	jalr	-1024(ra) # 203fcf <_binary_shell_bin_start+0xc5c>
  2033d7:	02000d93          	li	s11,32
  2033db:	00a00b13          	li	s6,10
  2033df:	00c00d13          	li	s10,12
  2033e3:	00800c93          	li	s9,8
  2033e7:	06c10c13          	addi	s8,sp,108
  2033eb:	00900b93          	li	s7,9
  2033ef:	04c10a13          	addi	s4,sp,76
  2033f3:	00401537          	lui	a0,0x401
  2033f7:	30750513          	addi	a0,a0,775 # 401307 <__free_ram_end+0xab307>
  2033fb:	04a12423          	sw	a0,72(sp)
  2033ff:	00401537          	lui	a0,0x401
  203403:	2af50513          	addi	a0,a0,687 # 4012af <__free_ram_end+0xab2af>
  203407:	02a12e23          	sw	a0,60(sp)
  20340b:	00401537          	lui	a0,0x401
  20340f:	32d50513          	addi	a0,a0,813 # 40132d <__free_ram_end+0xab32d>
  203413:	04a12223          	sw	a0,68(sp)
  203417:	00401537          	lui	a0,0x401
  20341b:	2c850513          	addi	a0,a0,712 # 4012c8 <__free_ram_end+0xab2c8>
  20341f:	04a12023          	sw	a0,64(sp)
  203423:	00018537          	lui	a0,0x18
  203427:	6a050513          	addi	a0,a0,1696 # 186a0 <$d.4+0x15f33>
  20342b:	02a12623          	sw	a0,44(sp)
  20342f:	00401537          	lui	a0,0x401
  203433:	36050513          	addi	a0,a0,864 # 401360 <__free_ram_end+0xab360>
  203437:	00a12c23          	sw	a0,24(sp)
  20343b:	00401537          	lui	a0,0x401
  20343f:	2fe50513          	addi	a0,a0,766 # 4012fe <__free_ram_end+0xab2fe>
  203443:	02a12c23          	sw	a0,56(sp)
  203447:	00401537          	lui	a0,0x401
  20344b:	29450513          	addi	a0,a0,660 # 401294 <__free_ram_end+0xab294>
  20344f:	00a12823          	sw	a0,16(sp)
  203453:	00401537          	lui	a0,0x401
  203457:	2a750513          	addi	a0,a0,679 # 4012a7 <__free_ram_end+0xab2a7>
  20345b:	02a12a23          	sw	a0,52(sp)
  20345f:	00401537          	lui	a0,0x401
  203463:	34750513          	addi	a0,a0,839 # 401347 <__free_ram_end+0xab347>
  203467:	00a12623          	sw	a0,12(sp)
  20346b:	00401537          	lui	a0,0x401
  20346f:	31850513          	addi	a0,a0,792 # 401318 <__free_ram_end+0xab318>
  203473:	02a12823          	sw	a0,48(sp)
  203477:	00401537          	lui	a0,0x401
  20347b:	30d50513          	addi	a0,a0,781 # 40130d <__free_ram_end+0xab30d>
  20347f:	00a12a23          	sw	a0,20(sp)
  203483:	00401537          	lui	a0,0x401
  203487:	37f50513          	addi	a0,a0,895 # 40137f <__free_ram_end+0xab37f>
  20348b:	02a12423          	sw	a0,40(sp)
  20348f:	00401537          	lui	a0,0x401
  203493:	37a50513          	addi	a0,a0,890 # 40137a <__free_ram_end+0xab37a>
  203497:	02a12223          	sw	a0,36(sp)
  20349b:	00401537          	lui	a0,0x401
  20349f:	31d50513          	addi	a0,a0,797 # 40131d <__free_ram_end+0xab31d>
  2034a3:	02a12023          	sw	a0,32(sp)
  2034a7:	00401537          	lui	a0,0x401
  2034ab:	2cf50513          	addi	a0,a0,719 # 4012cf <__free_ram_end+0xab2cf>
  2034af:	00a12e23          	sw	a0,28(sp)
  2034b3:	01f00993          	li	s3,31
  2034b7:	07f00913          	li	s2,127
  2034bb:	00d00413          	li	s0,13
  2034bf:	0140006f          	j	2034d3 <_binary_shell_bin_start+0x160>
  2034c3:	03c12503          	lw	a0,60(sp)
  2034c7:	00001097          	auipc	ra,0x1
  2034cb:	b08080e7          	jalr	-1272(ra) # 203fcf <_binary_shell_bin_start+0xc5c>
  2034cf:	04c10a13          	addi	s4,sp,76
  2034d3:	01b00513          	li	a0,27
  2034d7:	00001097          	auipc	ra,0x1
  2034db:	a44080e7          	jalr	-1468(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  2034df:	05b00513          	li	a0,91
  2034e3:	00001097          	auipc	ra,0x1
  2034e7:	a38080e7          	jalr	-1480(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  2034eb:	03300513          	li	a0,51
  2034ef:	00001097          	auipc	ra,0x1
  2034f3:	a2c080e7          	jalr	-1492(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  2034f7:	03400513          	li	a0,52
  2034fb:	00001097          	auipc	ra,0x1
  2034ff:	a20080e7          	jalr	-1504(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  203503:	06d00513          	li	a0,109
  203507:	00001097          	auipc	ra,0x1
  20350b:	a14080e7          	jalr	-1516(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  20350f:	05000513          	li	a0,80
  203513:	00001097          	auipc	ra,0x1
  203517:	a08080e7          	jalr	-1528(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  20351b:	05300513          	li	a0,83
  20351f:	00001097          	auipc	ra,0x1
  203523:	9fc080e7          	jalr	-1540(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  203527:	04300513          	li	a0,67
  20352b:	00001097          	auipc	ra,0x1
  20352f:	9f0080e7          	jalr	-1552(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  203533:	05f00513          	li	a0,95
  203537:	00001097          	auipc	ra,0x1
  20353b:	9e4080e7          	jalr	-1564(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  20353f:	04f00513          	li	a0,79
  203543:	00001097          	auipc	ra,0x1
  203547:	9d8080e7          	jalr	-1576(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  20354b:	05300513          	li	a0,83
  20354f:	00001097          	auipc	ra,0x1
  203553:	9cc080e7          	jalr	-1588(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  203557:	03e00513          	li	a0,62
  20355b:	00001097          	auipc	ra,0x1
  20355f:	9c0080e7          	jalr	-1600(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  203563:	02000513          	li	a0,32
  203567:	00001097          	auipc	ra,0x1
  20356b:	9b4080e7          	jalr	-1612(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  20356f:	01b00513          	li	a0,27
  203573:	00001097          	auipc	ra,0x1
  203577:	9a8080e7          	jalr	-1624(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  20357b:	05b00513          	li	a0,91
  20357f:	00001097          	auipc	ra,0x1
  203583:	99c080e7          	jalr	-1636(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  203587:	03000513          	li	a0,48
  20358b:	00001097          	auipc	ra,0x1
  20358f:	990080e7          	jalr	-1648(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  203593:	06d00513          	li	a0,109
  203597:	00001097          	auipc	ra,0x1
  20359b:	984080e7          	jalr	-1660(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  20359f:	00000493          	li	s1,0
  2035a3:	00c0006f          	j	2035af <_binary_shell_bin_start+0x23c>
  2035a7:	03251463          	bne	a0,s2,2035cf <_binary_shell_bin_start+0x25c>
  2035ab:	04904463          	bgtz	s1,2035f3 <_binary_shell_bin_start+0x280>
  2035af:	00001097          	auipc	ra,0x1
  2035b3:	e9c080e7          	jalr	-356(ra) # 20444b <_binary_shell_bin_start+0x10d8>
  2035b7:	01651463          	bne	a0,s6,2035bf <_binary_shell_bin_start+0x24c>
  2035bb:	fe048ae3          	beqz	s1,2035af <_binary_shell_bin_start+0x23c>
  2035bf:	fead44e3          	blt	s10,a0,2035a7 <_binary_shell_bin_start+0x234>
  2035c3:	ff9504e3          	beq	a0,s9,2035ab <_binary_shell_bin_start+0x238>
  2035c7:	01651663          	bne	a0,s6,2035d3 <_binary_shell_bin_start+0x260>
  2035cb:	0580006f          	j	203623 <_binary_shell_bin_start+0x2b0>
  2035cf:	04850a63          	beq	a0,s0,203623 <_binary_shell_bin_start+0x2b0>
  2035d3:	00a9c463          	blt	s3,a0,2035db <_binary_shell_bin_start+0x268>
  2035d7:	fd751ce3          	bne	a0,s7,2035af <_binary_shell_bin_start+0x23c>
  2035db:	01e00593          	li	a1,30
  2035df:	ee95cae3          	blt	a1,s1,2034d3 <_binary_shell_bin_start+0x160>
  2035e3:	009c05b3          	add	a1,s8,s1
  2035e7:	00148493          	addi	s1,s1,1
  2035eb:	00a58023          	sb	a0,0(a1)
  2035ef:	0240006f          	j	203613 <_binary_shell_bin_start+0x2a0>
  2035f3:	fff48493          	addi	s1,s1,-1
  2035f7:	00800513          	li	a0,8
  2035fb:	00001097          	auipc	ra,0x1
  2035ff:	920080e7          	jalr	-1760(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  203603:	02000513          	li	a0,32
  203607:	00001097          	auipc	ra,0x1
  20360b:	914080e7          	jalr	-1772(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  20360f:	00800513          	li	a0,8
  203613:	0ff57513          	zext.b	a0,a0
  203617:	00001097          	auipc	ra,0x1
  20361b:	904080e7          	jalr	-1788(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  20361f:	f91ff06f          	j	2035af <_binary_shell_bin_start+0x23c>
  203623:	00a00513          	li	a0,10
  203627:	00001097          	auipc	ra,0x1
  20362b:	8f4080e7          	jalr	-1804(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  20362f:	009c0533          	add	a0,s8,s1
  203633:	00050023          	sb	zero,0(a0)
  203637:	e8048ee3          	beqz	s1,2034d3 <_binary_shell_bin_start+0x160>
  20363b:	06c10513          	addi	a0,sp,108
  20363f:	0080006f          	j	203647 <_binary_shell_bin_start+0x2d4>
  203643:	00150513          	addi	a0,a0,1
  203647:	00054583          	lbu	a1,0(a0)
  20364b:	ff758ce3          	beq	a1,s7,203643 <_binary_shell_bin_start+0x2d0>
  20364f:	ffb58ae3          	beq	a1,s11,203643 <_binary_shell_bin_start+0x2d0>
  203653:	e80580e3          	beqz	a1,2034d3 <_binary_shell_bin_start+0x160>
  203657:	00000493          	li	s1,0
  20365b:	00048a93          	mv	s5,s1
  20365f:	00050593          	mv	a1,a0
  203663:	00148493          	addi	s1,s1,1
  203667:	002a9513          	slli	a0,s5,0x2
  20366b:	00aa0533          	add	a0,s4,a0
  20366f:	00b52023          	sw	a1,0(a0)
  203673:	00158513          	addi	a0,a1,1
  203677:	0005c603          	lbu	a2,0(a1)
  20367b:	04060263          	beqz	a2,2036bf <_binary_shell_bin_start+0x34c>
  20367f:	01760e63          	beq	a2,s7,20369b <_binary_shell_bin_start+0x328>
  203683:	01b60c63          	beq	a2,s11,20369b <_binary_shell_bin_start+0x328>
  203687:	00158593          	addi	a1,a1,1
  20368b:	00150513          	addi	a0,a0,1
  20368f:	0005c603          	lbu	a2,0(a1)
  203693:	fe0616e3          	bnez	a2,20367f <_binary_shell_bin_start+0x30c>
  203697:	0280006f          	j	2036bf <_binary_shell_bin_start+0x34c>
  20369b:	00058023          	sb	zero,0(a1)
  20369f:	0080006f          	j	2036a7 <_binary_shell_bin_start+0x334>
  2036a3:	00150513          	addi	a0,a0,1
  2036a7:	00054583          	lbu	a1,0(a0)
  2036ab:	ffb58ce3          	beq	a1,s11,2036a3 <_binary_shell_bin_start+0x330>
  2036af:	ff758ae3          	beq	a1,s7,2036a3 <_binary_shell_bin_start+0x330>
  2036b3:	00058663          	beqz	a1,2036bf <_binary_shell_bin_start+0x34c>
  2036b7:	00600593          	li	a1,6
  2036bb:	fb55f0e3          	bgeu	a1,s5,20365b <_binary_shell_bin_start+0x2e8>
  2036bf:	04c12a03          	lw	s4,76(sp)
  2036c3:	000a0513          	mv	a0,s4
  2036c7:	04812583          	lw	a1,72(sp)
  2036cb:	00001097          	auipc	ra,0x1
  2036cf:	8c4080e7          	jalr	-1852(ra) # 203f8f <_binary_shell_bin_start+0xc1c>
  2036d3:	de0508e3          	beqz	a0,2034c3 <_binary_shell_bin_start+0x150>
  2036d7:	000a0513          	mv	a0,s4
  2036db:	04412583          	lw	a1,68(sp)
  2036df:	00001097          	auipc	ra,0x1
  2036e3:	8b0080e7          	jalr	-1872(ra) # 203f8f <_binary_shell_bin_start+0xc1c>
  2036e7:	0a050463          	beqz	a0,20378f <_binary_shell_bin_start+0x41c>
  2036eb:	000a0513          	mv	a0,s4
  2036ef:	04012583          	lw	a1,64(sp)
  2036f3:	00001097          	auipc	ra,0x1
  2036f7:	89c080e7          	jalr	-1892(ra) # 203f8f <_binary_shell_bin_start+0xc1c>
  2036fb:	0e050263          	beqz	a0,2037df <_binary_shell_bin_start+0x46c>
  2036ff:	000a0513          	mv	a0,s4
  203703:	03812583          	lw	a1,56(sp)
  203707:	00001097          	auipc	ra,0x1
  20370b:	888080e7          	jalr	-1912(ra) # 203f8f <_binary_shell_bin_start+0xc1c>
  20370f:	0e050e63          	beqz	a0,20380b <_binary_shell_bin_start+0x498>
  203713:	000a0513          	mv	a0,s4
  203717:	03412583          	lw	a1,52(sp)
  20371b:	00001097          	auipc	ra,0x1
  20371f:	874080e7          	jalr	-1932(ra) # 203f8f <_binary_shell_bin_start+0xc1c>
  203723:	12050a63          	beqz	a0,203857 <_binary_shell_bin_start+0x4e4>
  203727:	000a0513          	mv	a0,s4
  20372b:	03012583          	lw	a1,48(sp)
  20372f:	00001097          	auipc	ra,0x1
  203733:	860080e7          	jalr	-1952(ra) # 203f8f <_binary_shell_bin_start+0xc1c>
  203737:	14050e63          	beqz	a0,203893 <_binary_shell_bin_start+0x520>
  20373b:	000a0513          	mv	a0,s4
  20373f:	02812583          	lw	a1,40(sp)
  203743:	00001097          	auipc	ra,0x1
  203747:	84c080e7          	jalr	-1972(ra) # 203f8f <_binary_shell_bin_start+0xc1c>
  20374b:	2a050463          	beqz	a0,2039f3 <_binary_shell_bin_start+0x680>
  20374f:	000a0513          	mv	a0,s4
  203753:	02412583          	lw	a1,36(sp)
  203757:	00001097          	auipc	ra,0x1
  20375b:	838080e7          	jalr	-1992(ra) # 203f8f <_binary_shell_bin_start+0xc1c>
  20375f:	28050a63          	beqz	a0,2039f3 <_binary_shell_bin_start+0x680>
  203763:	000a0513          	mv	a0,s4
  203767:	02012583          	lw	a1,32(sp)
  20376b:	00001097          	auipc	ra,0x1
  20376f:	824080e7          	jalr	-2012(ra) # 203f8f <_binary_shell_bin_start+0xc1c>
  203773:	28050063          	beqz	a0,2039f3 <_binary_shell_bin_start+0x680>
  203777:	01c12503          	lw	a0,28(sp)
  20377b:	000a0593          	mv	a1,s4
  20377f:	00001097          	auipc	ra,0x1
  203783:	850080e7          	jalr	-1968(ra) # 203fcf <_binary_shell_bin_start+0xc5c>
  203787:	04c10a13          	addi	s4,sp,76
  20378b:	d49ff06f          	j	2034d3 <_binary_shell_bin_start+0x160>
  20378f:	10000593          	li	a1,256
  203793:	0a0a8063          	beqz	s5,203833 <_binary_shell_bin_start+0x4c0>
  203797:	05012683          	lw	a3,80(sp)
  20379b:	00268693          	addi	a3,a3,2
  20379f:	04c10a13          	addi	s4,sp,76
  2037a3:	00500893          	li	a7,5
  2037a7:	0080006f          	j	2037af <_binary_shell_bin_start+0x43c>
  2037ab:	00168693          	addi	a3,a3,1
  2037af:	ffe6c603          	lbu	a2,-2(a3)
  2037b3:	ff760ce3          	beq	a2,s7,2037ab <_binary_shell_bin_start+0x438>
  2037b7:	ffb60ae3          	beq	a2,s11,2037ab <_binary_shell_bin_start+0x438>
  2037bb:	03000513          	li	a0,48
  2037bf:	08a61463          	bne	a2,a0,203847 <_binary_shell_bin_start+0x4d4>
  2037c3:	fff6c503          	lbu	a0,-1(a3)
  2037c7:	02056513          	ori	a0,a0,32
  2037cb:	07800613          	li	a2,120
  2037cf:	0ec51663          	bne	a0,a2,2038bb <_binary_shell_bin_start+0x548>
  2037d3:	0006c603          	lbu	a2,0(a3)
  2037d7:	0e061663          	bnez	a2,2038c3 <_binary_shell_bin_start+0x550>
  2037db:	0740006f          	j	20384f <_binary_shell_bin_start+0x4dc>
  2037df:	04c10a13          	addi	s4,sp,76
  2037e3:	080a8a63          	beqz	s5,203877 <_binary_shell_bin_start+0x504>
  2037e7:	05012503          	lw	a0,80(sp)
  2037eb:	00001097          	auipc	ra,0x1
  2037ef:	aec080e7          	jalr	-1300(ra) # 2042d7 <_binary_shell_bin_start+0xf64>
  2037f3:	02c12583          	lw	a1,44(sp)
  2037f7:	08a5f863          	bgeu	a1,a0,203887 <_binary_shell_bin_start+0x514>
  2037fb:	01812503          	lw	a0,24(sp)
  2037ff:	00000097          	auipc	ra,0x0
  203803:	7d0080e7          	jalr	2000(ra) # 203fcf <_binary_shell_bin_start+0xc5c>
  203807:	ccdff06f          	j	2034d3 <_binary_shell_bin_start+0x160>
  20380b:	000a8a63          	beqz	s5,20381f <_binary_shell_bin_start+0x4ac>
  20380f:	05012503          	lw	a0,80(sp)
  203813:	00001097          	auipc	ra,0x1
  203817:	ac4080e7          	jalr	-1340(ra) # 2042d7 <_binary_shell_bin_start+0xf64>
  20381b:	09a51663          	bne	a0,s10,2038a7 <_binary_shell_bin_start+0x534>
  20381f:	00c00513          	li	a0,12
  203823:	00000097          	auipc	ra,0x0
  203827:	378080e7          	jalr	888(ra) # 203b9b <_binary_shell_bin_start+0x828>
  20382b:	04c10a13          	addi	s4,sp,76
  20382f:	ca5ff06f          	j	2034d3 <_binary_shell_bin_start+0x160>
  203833:	00200537          	lui	a0,0x200
  203837:	04c10a13          	addi	s4,sp,76
  20383b:	00000097          	auipc	ra,0x0
  20383f:	714080e7          	jalr	1812(ra) # 203f4f <_binary_shell_bin_start+0xbdc>
  203843:	c91ff06f          	j	2034d3 <_binary_shell_bin_start+0x160>
  203847:	ffe68693          	addi	a3,a3,-2
  20384b:	06061c63          	bnez	a2,2038c3 <_binary_shell_bin_start+0x550>
  20384f:	00200537          	lui	a0,0x200
  203853:	0cc0006f          	j	20391f <_binary_shell_bin_start+0x5ac>
  203857:	04c10a13          	addi	s4,sp,76
  20385b:	100a8c63          	beqz	s5,203973 <_binary_shell_bin_start+0x600>
  20385f:	05012503          	lw	a0,80(sp)
  203863:	00001097          	auipc	ra,0x1
  203867:	a74080e7          	jalr	-1420(ra) # 2042d7 <_binary_shell_bin_start+0xf64>
  20386b:	00000097          	auipc	ra,0x0
  20386f:	6d8080e7          	jalr	1752(ra) # 203f43 <_binary_shell_bin_start+0xbd0>
  203873:	c61ff06f          	j	2034d3 <_binary_shell_bin_start+0x160>
  203877:	3e800513          	li	a0,1000
  20387b:	00000097          	auipc	ra,0x0
  20387f:	24c080e7          	jalr	588(ra) # 203ac7 <_binary_shell_bin_start+0x754>
  203883:	c51ff06f          	j	2034d3 <_binary_shell_bin_start+0x160>
  203887:	00000097          	auipc	ra,0x0
  20388b:	240080e7          	jalr	576(ra) # 203ac7 <_binary_shell_bin_start+0x754>
  20388f:	c45ff06f          	j	2034d3 <_binary_shell_bin_start+0x160>
  203893:	01412503          	lw	a0,20(sp)
  203897:	00000097          	auipc	ra,0x0
  20389b:	738080e7          	jalr	1848(ra) # 203fcf <_binary_shell_bin_start+0xc5c>
  20389f:	04c10a13          	addi	s4,sp,76
  2038a3:	c31ff06f          	j	2034d3 <_binary_shell_bin_start+0x160>
  2038a7:	01012503          	lw	a0,16(sp)
  2038ab:	00000097          	auipc	ra,0x0
  2038af:	724080e7          	jalr	1828(ra) # 203fcf <_binary_shell_bin_start+0xc5c>
  2038b3:	04c10a13          	addi	s4,sp,76
  2038b7:	c1dff06f          	j	2034d3 <_binary_shell_bin_start+0x160>
  2038bb:	ffe68693          	addi	a3,a3,-2
  2038bf:	03000613          	li	a2,48
  2038c3:	00000513          	li	a0,0
  2038c7:	00168693          	addi	a3,a3,1
  2038cb:	0200006f          	j	2038eb <_binary_shell_bin_start+0x578>
  2038cf:	0ff67793          	zext.b	a5,a2
  2038d3:	0006c603          	lbu	a2,0(a3)
  2038d7:	00f70733          	add	a4,a4,a5
  2038db:	00451513          	slli	a0,a0,0x4
  2038df:	00a76533          	or	a0,a4,a0
  2038e3:	00168693          	addi	a3,a3,1
  2038e7:	02060c63          	beqz	a2,20391f <_binary_shell_bin_start+0x5ac>
  2038eb:	fd060713          	addi	a4,a2,-48
  2038ef:	0ff77793          	zext.b	a5,a4
  2038f3:	fd000713          	li	a4,-48
  2038f7:	fd67ece3          	bltu	a5,s6,2038cf <_binary_shell_bin_start+0x55c>
  2038fb:	f9f60713          	addi	a4,a2,-97
  2038ff:	0ff77793          	zext.b	a5,a4
  203903:	fa900713          	li	a4,-87
  203907:	00600813          	li	a6,6
  20390b:	fd07e2e3          	bltu	a5,a6,2038cf <_binary_shell_bin_start+0x55c>
  20390f:	fbf60713          	addi	a4,a2,-65
  203913:	0ff77793          	zext.b	a5,a4
  203917:	fc900713          	li	a4,-55
  20391b:	faf8fae3          	bgeu	a7,a5,2038cf <_binary_shell_bin_start+0x55c>
  20391f:	00200613          	li	a2,2
  203923:	0cc48263          	beq	s1,a2,2039e7 <_binary_shell_bin_start+0x674>
  203927:	05412683          	lw	a3,84(sp)
  20392b:	00268693          	addi	a3,a3,2
  20392f:	0080006f          	j	203937 <_binary_shell_bin_start+0x5c4>
  203933:	00168693          	addi	a3,a3,1
  203937:	ffe6c603          	lbu	a2,-2(a3)
  20393b:	ff760ce3          	beq	a2,s7,203933 <_binary_shell_bin_start+0x5c0>
  20393f:	ffb60ae3          	beq	a2,s11,203933 <_binary_shell_bin_start+0x5c0>
  203943:	03000713          	li	a4,48
  203947:	02e61063          	bne	a2,a4,203967 <_binary_shell_bin_start+0x5f4>
  20394b:	fff6c603          	lbu	a2,-1(a3)
  20394f:	02066613          	ori	a2,a2,32
  203953:	07800713          	li	a4,120
  203957:	02e61663          	bne	a2,a4,203983 <_binary_shell_bin_start+0x610>
  20395b:	0006c603          	lbu	a2,0(a3)
  20395f:	02061663          	bnez	a2,20398b <_binary_shell_bin_start+0x618>
  203963:	0840006f          	j	2039e7 <_binary_shell_bin_start+0x674>
  203967:	ffe68693          	addi	a3,a3,-2
  20396b:	02061063          	bnez	a2,20398b <_binary_shell_bin_start+0x618>
  20396f:	0780006f          	j	2039e7 <_binary_shell_bin_start+0x674>
  203973:	00c12503          	lw	a0,12(sp)
  203977:	00000097          	auipc	ra,0x0
  20397b:	658080e7          	jalr	1624(ra) # 203fcf <_binary_shell_bin_start+0xc5c>
  20397f:	b55ff06f          	j	2034d3 <_binary_shell_bin_start+0x160>
  203983:	ffe68693          	addi	a3,a3,-2
  203987:	03000613          	li	a2,48
  20398b:	00000593          	li	a1,0
  20398f:	00168693          	addi	a3,a3,1
  203993:	0200006f          	j	2039b3 <_binary_shell_bin_start+0x640>
  203997:	0ff67793          	zext.b	a5,a2
  20399b:	0006c603          	lbu	a2,0(a3)
  20399f:	00f70733          	add	a4,a4,a5
  2039a3:	00459593          	slli	a1,a1,0x4
  2039a7:	00b765b3          	or	a1,a4,a1
  2039ab:	00168693          	addi	a3,a3,1
  2039af:	02060c63          	beqz	a2,2039e7 <_binary_shell_bin_start+0x674>
  2039b3:	fd060713          	addi	a4,a2,-48
  2039b7:	0ff77793          	zext.b	a5,a4
  2039bb:	fd000713          	li	a4,-48
  2039bf:	fd67ece3          	bltu	a5,s6,203997 <_binary_shell_bin_start+0x624>
  2039c3:	f9f60713          	addi	a4,a2,-97
  2039c7:	0ff77793          	zext.b	a5,a4
  2039cb:	fa900713          	li	a4,-87
  2039cf:	00600813          	li	a6,6
  2039d3:	fd07e2e3          	bltu	a5,a6,203997 <_binary_shell_bin_start+0x624>
  2039d7:	fbf60713          	addi	a4,a2,-65
  2039db:	0ff77793          	zext.b	a5,a4
  2039df:	fc900713          	li	a4,-55
  2039e3:	faf8fae3          	bgeu	a7,a5,203997 <_binary_shell_bin_start+0x624>
  2039e7:	00000097          	auipc	ra,0x0
  2039eb:	568080e7          	jalr	1384(ra) # 203f4f <_binary_shell_bin_start+0xbdc>
  2039ef:	ae5ff06f          	j	2034d3 <_binary_shell_bin_start+0x160>
  2039f3:	00000097          	auipc	ra,0x0
  2039f7:	190080e7          	jalr	400(ra) # 203b83 <_binary_shell_bin_start+0x810>
  2039fb:	00250613          	addi	a2,a0,2 # 200002 <boot+0x2>
  2039ff:	00900693          	li	a3,9
  203a03:	02000713          	li	a4,32
  203a07:	0080006f          	j	203a0f <_binary_shell_bin_start+0x69c>
  203a0b:	00160613          	addi	a2,a2,1
  203a0f:	ffe64503          	lbu	a0,-2(a2)
  203a13:	fed50ce3          	beq	a0,a3,203a0b <_binary_shell_bin_start+0x698>
  203a17:	fee50ae3          	beq	a0,a4,203a0b <_binary_shell_bin_start+0x698>
  203a1b:	03000693          	li	a3,48
  203a1f:	02d51063          	bne	a0,a3,203a3f <_binary_shell_bin_start+0x6cc>
  203a23:	fff64503          	lbu	a0,-1(a2)
  203a27:	02056513          	ori	a0,a0,32
  203a2b:	07800693          	li	a3,120
  203a2f:	02d51063          	bne	a0,a3,203a4f <_binary_shell_bin_start+0x6dc>
  203a33:	00064503          	lbu	a0,0(a2)
  203a37:	02051063          	bnez	a0,203a57 <_binary_shell_bin_start+0x6e4>
  203a3b:	00c0006f          	j	203a47 <_binary_shell_bin_start+0x6d4>
  203a3f:	ffe60613          	addi	a2,a2,-2
  203a43:	00051a63          	bnez	a0,203a57 <_binary_shell_bin_start+0x6e4>
  203a47:	fff00513          	li	a0,-1
  203a4b:	00008067          	ret
  203a4f:	ffe60613          	addi	a2,a2,-2
  203a53:	03000513          	li	a0,48
  203a57:	00000693          	li	a3,0
  203a5b:	00160613          	addi	a2,a2,1
  203a5f:	00a00713          	li	a4,10
  203a63:	00600793          	li	a5,6
  203a67:	00500813          	li	a6,5
  203a6b:	0200006f          	j	203a8b <_binary_shell_bin_start+0x718>
  203a6f:	0ff57293          	zext.b	t0,a0
  203a73:	00064503          	lbu	a0,0(a2)
  203a77:	005888b3          	add	a7,a7,t0
  203a7b:	00469693          	slli	a3,a3,0x4
  203a7f:	00d8e6b3          	or	a3,a7,a3
  203a83:	00160613          	addi	a2,a2,1
  203a87:	02050a63          	beqz	a0,203abb <_binary_shell_bin_start+0x748>
  203a8b:	fd050893          	addi	a7,a0,-48
  203a8f:	0ff8f293          	zext.b	t0,a7
  203a93:	fd000893          	li	a7,-48
  203a97:	fce2ece3          	bltu	t0,a4,203a6f <_binary_shell_bin_start+0x6fc>
  203a9b:	f9f50893          	addi	a7,a0,-97
  203a9f:	0ff8f293          	zext.b	t0,a7
  203aa3:	fa900893          	li	a7,-87
  203aa7:	fcf2e4e3          	bltu	t0,a5,203a6f <_binary_shell_bin_start+0x6fc>
  203aab:	fbf50893          	addi	a7,a0,-65
  203aaf:	0ff8f293          	zext.b	t0,a7
  203ab3:	fc900893          	li	a7,-55
  203ab7:	fa587ce3          	bgeu	a6,t0,203a6f <_binary_shell_bin_start+0x6fc>
  203abb:	00000513          	li	a0,0
  203abf:	00d5a023          	sw	a3,0(a1)
  203ac3:	00008067          	ret
  203ac7:	fe010113          	addi	sp,sp,-32
  203acb:	00112e23          	sw	ra,28(sp)
  203acf:	00812c23          	sw	s0,24(sp)
  203ad3:	00912a23          	sw	s1,20(sp)
  203ad7:	01212823          	sw	s2,16(sp)
  203adb:	01312623          	sw	s3,12(sp)
  203adf:	00200913          	li	s2,2
  203ae3:	00050413          	mv	s0,a0
  203ae7:	00000493          	li	s1,0
  203aeb:	07256463          	bltu	a0,s2,203b53 <_binary_shell_bin_start+0x7e0>
  203aef:	00401537          	lui	a0,0x401
  203af3:	33250993          	addi	s3,a0,818 # 401332 <__free_ram_end+0xab332>
  203af7:	00c0006f          	j	203b03 <_binary_shell_bin_start+0x790>
  203afb:	00190913          	addi	s2,s2,1
  203aff:	05246063          	bltu	s0,s2,203b3f <_binary_shell_bin_start+0x7cc>
  203b03:	00090513          	mv	a0,s2
  203b07:	00001097          	auipc	ra,0x1
  203b0b:	8c0080e7          	jalr	-1856(ra) # 2043c7 <_binary_shell_bin_start+0x1054>
  203b0f:	fe0506e3          	beqz	a0,203afb <_binary_shell_bin_start+0x788>
  203b13:	00098513          	mv	a0,s3
  203b17:	00090593          	mv	a1,s2
  203b1b:	00000097          	auipc	ra,0x0
  203b1f:	4b4080e7          	jalr	1204(ra) # 203fcf <_binary_shell_bin_start+0xc5c>
  203b23:	00148493          	addi	s1,s1,1
  203b27:	0074f513          	andi	a0,s1,7
  203b2b:	fc0518e3          	bnez	a0,203afb <_binary_shell_bin_start+0x788>
  203b2f:	00a00513          	li	a0,10
  203b33:	00000097          	auipc	ra,0x0
  203b37:	3e8080e7          	jalr	1000(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  203b3b:	fc1ff06f          	j	203afb <_binary_shell_bin_start+0x788>
  203b3f:	0074f513          	andi	a0,s1,7
  203b43:	00050863          	beqz	a0,203b53 <_binary_shell_bin_start+0x7e0>
  203b47:	00a00513          	li	a0,10
  203b4b:	00000097          	auipc	ra,0x0
  203b4f:	3d0080e7          	jalr	976(ra) # 203f1b <_binary_shell_bin_start+0xba8>
  203b53:	00401537          	lui	a0,0x401
  203b57:	2e450513          	addi	a0,a0,740 # 4012e4 <__free_ram_end+0xab2e4>
  203b5b:	00048593          	mv	a1,s1
  203b5f:	00040613          	mv	a2,s0
  203b63:	01c12083          	lw	ra,28(sp)
  203b67:	01812403          	lw	s0,24(sp)
  203b6b:	01412483          	lw	s1,20(sp)
  203b6f:	01012903          	lw	s2,16(sp)
  203b73:	00c12983          	lw	s3,12(sp)
  203b77:	02010113          	addi	sp,sp,32
  203b7b:	00000317          	auipc	t1,0x0
  203b7f:	45430067          	jr	1108(t1) # 203fcf <_binary_shell_bin_start+0xc5c>
  203b83:	00800693          	li	a3,8
  203b87:	00000593          	li	a1,0
  203b8b:	00000613          	li	a2,0
  203b8f:	00000513          	li	a0,0
  203b93:	00000073          	ecall
  203b97:	0000006f          	j	203b97 <_binary_shell_bin_start+0x824>
  203b9b:	c8010113          	addi	sp,sp,-896
  203b9f:	36112e23          	sw	ra,892(sp)
  203ba3:	36812c23          	sw	s0,888(sp)
  203ba7:	36912a23          	sw	s1,884(sp)
  203bab:	37212823          	sw	s2,880(sp)
  203baf:	37312623          	sw	s3,876(sp)
  203bb3:	37412423          	sw	s4,872(sp)
  203bb7:	37512223          	sw	s5,868(sp)
  203bbb:	00050413          	mv	s0,a0
  203bbf:	14050463          	beqz	a0,203d07 <_binary_shell_bin_start+0x994>
  203bc3:	00000913          	li	s2,0
  203bc7:	00000493          	li	s1,0
  203bcb:	2d410993          	addi	s3,sp,724
  203bcf:	24410a13          	addi	s4,sp,580
  203bd3:	2d410a93          	addi	s5,sp,724
  203bd7:	00c00593          	li	a1,12
  203bdb:	00048513          	mv	a0,s1
  203bdf:	00001097          	auipc	ra,0x1
  203be3:	880080e7          	jalr	-1920(ra) # 20445f <_binary_shell_bin_start+0x10ec>
  203be7:	00a40533          	add	a0,s0,a0
  203beb:	00a98533          	add	a0,s3,a0
  203bef:	000a0593          	mv	a1,s4
  203bf3:	000a8613          	mv	a2,s5
  203bf7:	00048693          	mv	a3,s1
  203bfb:	00090713          	mv	a4,s2
  203bff:	00169793          	slli	a5,a3,0x1
  203c03:	00278793          	addi	a5,a5,2
  203c07:	00f60023          	sb	a5,0(a2)
  203c0b:	00570793          	addi	a5,a4,5
  203c0f:	00f58023          	sb	a5,0(a1)
  203c13:	00170713          	addi	a4,a4,1
  203c17:	00168693          	addi	a3,a3,1
  203c1b:	00160613          	addi	a2,a2,1
  203c1f:	00158593          	addi	a1,a1,1
  203c23:	fca61ee3          	bne	a2,a0,203bff <_binary_shell_bin_start+0x88c>
  203c27:	00148493          	addi	s1,s1,1
  203c2b:	00390913          	addi	s2,s2,3
  203c2f:	00ca8a93          	addi	s5,s5,12
  203c33:	00ca0a13          	addi	s4,s4,12
  203c37:	fa8490e3          	bne	s1,s0,203bd7 <_binary_shell_bin_start+0x864>
  203c3b:	00600513          	li	a0,6
  203c3f:	2ea107a3          	sb	a0,751(sp)
  203c43:	00200513          	li	a0,2
  203c47:	28a101a3          	sb	a0,643(sp)
  203c4b:	2d410913          	addi	s2,sp,724
  203c4f:	24410793          	addi	a5,sp,580
  203c53:	00410813          	addi	a6,sp,4
  203c57:	00300893          	li	a7,3
  203c5b:	00090513          	mv	a0,s2
  203c5f:	00078593          	mv	a1,a5
  203c63:	00080613          	mv	a2,a6
  203c67:	00088693          	mv	a3,a7
  203c6b:	00040713          	mv	a4,s0
  203c6f:	00000073          	ecall
  203c73:	00050793          	mv	a5,a0
  203c77:	04100593          	li	a1,65
  203c7b:	00058513          	mv	a0,a1
  203c7f:	00100693          	li	a3,1
  203c83:	00000073          	ecall
  203c87:	00a00593          	li	a1,10
  203c8b:	00058513          	mv	a0,a1
  203c8f:	00100693          	li	a3,1
  203c93:	00000073          	ecall
  203c97:	18040e63          	beqz	s0,203e33 <_binary_shell_bin_start+0xac0>
  203c9b:	00000493          	li	s1,0
  203c9f:	02000993          	li	s3,32
  203ca3:	00a00a13          	li	s4,10
  203ca7:	2d410a93          	addi	s5,sp,724
  203cab:	00c00593          	li	a1,12
  203caf:	00048513          	mv	a0,s1
  203cb3:	00000097          	auipc	ra,0x0
  203cb7:	7ac080e7          	jalr	1964(ra) # 20445f <_binary_shell_bin_start+0x10ec>
  203cbb:	00a40533          	add	a0,s0,a0
  203cbf:	00a905b3          	add	a1,s2,a0
  203cc3:	000a8613          	mv	a2,s5
  203cc7:	00064703          	lbu	a4,0(a2)
  203ccb:	00070513          	mv	a0,a4
  203ccf:	00a00693          	li	a3,10
  203cd3:	00000073          	ecall
  203cd7:	00098513          	mv	a0,s3
  203cdb:	00100693          	li	a3,1
  203cdf:	00000073          	ecall
  203ce3:	00160613          	addi	a2,a2,1
  203ce7:	feb610e3          	bne	a2,a1,203cc7 <_binary_shell_bin_start+0x954>
  203ceb:	000a0513          	mv	a0,s4
  203cef:	00100693          	li	a3,1
  203cf3:	00000073          	ecall
  203cf7:	00148493          	addi	s1,s1,1
  203cfb:	00ca8a93          	addi	s5,s5,12
  203cff:	fa8496e3          	bne	s1,s0,203cab <_binary_shell_bin_start+0x938>
  203d03:	0600006f          	j	203d63 <_binary_shell_bin_start+0x9f0>
  203d07:	00600513          	li	a0,6
  203d0b:	2ea107a3          	sb	a0,751(sp)
  203d0f:	00200513          	li	a0,2
  203d13:	28a101a3          	sb	a0,643(sp)
  203d17:	2d410793          	addi	a5,sp,724
  203d1b:	24410813          	addi	a6,sp,580
  203d1f:	00410893          	addi	a7,sp,4
  203d23:	00300293          	li	t0,3
  203d27:	00078513          	mv	a0,a5
  203d2b:	00080593          	mv	a1,a6
  203d2f:	00088613          	mv	a2,a7
  203d33:	00028693          	mv	a3,t0
  203d37:	00040713          	mv	a4,s0
  203d3b:	00000073          	ecall
  203d3f:	00050793          	mv	a5,a0
  203d43:	04100593          	li	a1,65
  203d47:	00058513          	mv	a0,a1
  203d4b:	00100693          	li	a3,1
  203d4f:	00000073          	ecall
  203d53:	00a00593          	li	a1,10
  203d57:	00058513          	mv	a0,a1
  203d5b:	00100693          	li	a3,1
  203d5f:	00000073          	ecall
  203d63:	00a00593          	li	a1,10
  203d67:	00058513          	mv	a0,a1
  203d6b:	00100693          	li	a3,1
  203d6f:	00000073          	ecall
  203d73:	04200613          	li	a2,66
  203d77:	00060513          	mv	a0,a2
  203d7b:	00100693          	li	a3,1
  203d7f:	00000073          	ecall
  203d83:	00058513          	mv	a0,a1
  203d87:	00100693          	li	a3,1
  203d8b:	00000073          	ecall
  203d8f:	06040a63          	beqz	s0,203e03 <_binary_shell_bin_start+0xa90>
  203d93:	00000493          	li	s1,0
  203d97:	24410913          	addi	s2,sp,580
  203d9b:	02000993          	li	s3,32
  203d9f:	00a00a13          	li	s4,10
  203da3:	24410a93          	addi	s5,sp,580
  203da7:	00c00593          	li	a1,12
  203dab:	00048513          	mv	a0,s1
  203daf:	00000097          	auipc	ra,0x0
  203db3:	6b0080e7          	jalr	1712(ra) # 20445f <_binary_shell_bin_start+0x10ec>
  203db7:	00a40533          	add	a0,s0,a0
  203dbb:	00a905b3          	add	a1,s2,a0
  203dbf:	000a8613          	mv	a2,s5
  203dc3:	00064703          	lbu	a4,0(a2)
  203dc7:	00070513          	mv	a0,a4
  203dcb:	00a00693          	li	a3,10
  203dcf:	00000073          	ecall
  203dd3:	00098513          	mv	a0,s3
  203dd7:	00100693          	li	a3,1
  203ddb:	00000073          	ecall
  203ddf:	00160613          	addi	a2,a2,1
  203de3:	feb610e3          	bne	a2,a1,203dc3 <_binary_shell_bin_start+0xa50>
  203de7:	000a0513          	mv	a0,s4
  203deb:	00100693          	li	a3,1
  203def:	00000073          	ecall
  203df3:	00148493          	addi	s1,s1,1
  203df7:	00ca8a93          	addi	s5,s5,12
  203dfb:	fa8496e3          	bne	s1,s0,203da7 <_binary_shell_bin_start+0xa34>
  203dff:	0600006f          	j	203e5f <_binary_shell_bin_start+0xaec>
  203e03:	00a00593          	li	a1,10
  203e07:	00058513          	mv	a0,a1
  203e0b:	00100693          	li	a3,1
  203e0f:	00000073          	ecall
  203e13:	04300613          	li	a2,67
  203e17:	00060513          	mv	a0,a2
  203e1b:	00100693          	li	a3,1
  203e1f:	00000073          	ecall
  203e23:	00058513          	mv	a0,a1
  203e27:	00100693          	li	a3,1
  203e2b:	00000073          	ecall
  203e2f:	0b80006f          	j	203ee7 <_binary_shell_bin_start+0xb74>
  203e33:	00a00593          	li	a1,10
  203e37:	00058513          	mv	a0,a1
  203e3b:	00100693          	li	a3,1
  203e3f:	00000073          	ecall
  203e43:	04200613          	li	a2,66
  203e47:	00060513          	mv	a0,a2
  203e4b:	00100693          	li	a3,1
  203e4f:	00000073          	ecall
  203e53:	00058513          	mv	a0,a1
  203e57:	00100693          	li	a3,1
  203e5b:	00000073          	ecall
  203e5f:	00a00593          	li	a1,10
  203e63:	00058513          	mv	a0,a1
  203e67:	00100693          	li	a3,1
  203e6b:	00000073          	ecall
  203e6f:	04300613          	li	a2,67
  203e73:	00060513          	mv	a0,a2
  203e77:	00100693          	li	a3,1
  203e7b:	00000073          	ecall
  203e7f:	00058513          	mv	a0,a1
  203e83:	00100693          	li	a3,1
  203e87:	00000073          	ecall
  203e8b:	04040e63          	beqz	s0,203ee7 <_binary_shell_bin_start+0xb74>
  203e8f:	00000593          	li	a1,0
  203e93:	00410613          	addi	a2,sp,4
  203e97:	02000713          	li	a4,32
  203e9b:	00a00793          	li	a5,10
  203e9f:	00060813          	mv	a6,a2
  203ea3:	00040893          	mv	a7,s0
  203ea7:	00082283          	lw	t0,0(a6) # 41393000 <__free_ram_end+0x4103d000>
  203eab:	00028513          	mv	a0,t0
  203eaf:	00a00693          	li	a3,10
  203eb3:	00000073          	ecall
  203eb7:	00070513          	mv	a0,a4
  203ebb:	00100693          	li	a3,1
  203ebf:	00000073          	ecall
  203ec3:	fff88893          	addi	a7,a7,-1
  203ec7:	00480813          	addi	a6,a6,4
  203ecb:	fc089ee3          	bnez	a7,203ea7 <_binary_shell_bin_start+0xb34>
  203ecf:	00078513          	mv	a0,a5
  203ed3:	00100693          	li	a3,1
  203ed7:	00000073          	ecall
  203edb:	00158593          	addi	a1,a1,1
  203edf:	03060613          	addi	a2,a2,48
  203ee3:	fa859ee3          	bne	a1,s0,203e9f <_binary_shell_bin_start+0xb2c>
  203ee7:	00a00593          	li	a1,10
  203eeb:	00058513          	mv	a0,a1
  203eef:	00100693          	li	a3,1
  203ef3:	00000073          	ecall
  203ef7:	37c12083          	lw	ra,892(sp)
  203efb:	37812403          	lw	s0,888(sp)
  203eff:	37412483          	lw	s1,884(sp)
  203f03:	37012903          	lw	s2,880(sp)
  203f07:	36c12983          	lw	s3,876(sp)
  203f0b:	36812a03          	lw	s4,872(sp)
  203f0f:	36412a83          	lw	s5,868(sp)
  203f13:	38010113          	addi	sp,sp,896
  203f17:	00008067          	ret
  203f1b:	00050593          	mv	a1,a0
  203f1f:	00058513          	mv	a0,a1
  203f23:	00100693          	li	a3,1
  203f27:	00000073          	ecall
  203f2b:	00008067          	ret
  203f2f:	00050593          	mv	a1,a0
  203f33:	00058513          	mv	a0,a1
  203f37:	00a00693          	li	a3,10
  203f3b:	00000073          	ecall
  203f3f:	00008067          	ret
  203f43:	00400693          	li	a3,4
  203f47:	00000073          	ecall
  203f4b:	00008067          	ret
  203f4f:	00500693          	li	a3,5
  203f53:	00000073          	ecall
  203f57:	00008067          	ret
  203f5b:	0005c603          	lbu	a2,0(a1)
  203f5f:	00050693          	mv	a3,a0
  203f63:	02060263          	beqz	a2,203f87 <_binary_shell_bin_start+0xc14>
  203f67:	00158593          	addi	a1,a1,1
  203f6b:	00050713          	mv	a4,a0
  203f6f:	00c70023          	sb	a2,0(a4)
  203f73:	0005c603          	lbu	a2,0(a1)
  203f77:	00170693          	addi	a3,a4,1
  203f7b:	00158593          	addi	a1,a1,1
  203f7f:	00068713          	mv	a4,a3
  203f83:	fe0616e3          	bnez	a2,203f6f <_binary_shell_bin_start+0xbfc>
  203f87:	00068023          	sb	zero,0(a3)
  203f8b:	00008067          	ret
  203f8f:	00054603          	lbu	a2,0(a0)
  203f93:	02060663          	beqz	a2,203fbf <_binary_shell_bin_start+0xc4c>
  203f97:	00150513          	addi	a0,a0,1
  203f9b:	0005c683          	lbu	a3,0(a1)
  203f9f:	0ff67713          	zext.b	a4,a2
  203fa3:	00d71a63          	bne	a4,a3,203fb7 <_binary_shell_bin_start+0xc44>
  203fa7:	00054603          	lbu	a2,0(a0)
  203fab:	00158593          	addi	a1,a1,1
  203faf:	00150513          	addi	a0,a0,1
  203fb3:	fe0614e3          	bnez	a2,203f9b <_binary_shell_bin_start+0xc28>
  203fb7:	0ff67513          	zext.b	a0,a2
  203fbb:	0080006f          	j	203fc3 <_binary_shell_bin_start+0xc50>
  203fbf:	00000513          	li	a0,0
  203fc3:	0005c583          	lbu	a1,0(a1)
  203fc7:	40b50533          	sub	a0,a0,a1
  203fcb:	00008067          	ret
  203fcf:	f9010113          	addi	sp,sp,-112
  203fd3:	04112623          	sw	ra,76(sp)
  203fd7:	04812423          	sw	s0,72(sp)
  203fdb:	04912223          	sw	s1,68(sp)
  203fdf:	05212023          	sw	s2,64(sp)
  203fe3:	03312e23          	sw	s3,60(sp)
  203fe7:	03412c23          	sw	s4,56(sp)
  203feb:	03512a23          	sw	s5,52(sp)
  203fef:	03612823          	sw	s6,48(sp)
  203ff3:	03712623          	sw	s7,44(sp)
  203ff7:	03812423          	sw	s8,40(sp)
  203ffb:	03912223          	sw	s9,36(sp)
  203fff:	03a12023          	sw	s10,32(sp)
  204003:	01b12e23          	sw	s11,28(sp)
  204007:	00050a93          	mv	s5,a0
  20400b:	07112623          	sw	a7,108(sp)
  20400f:	07012423          	sw	a6,104(sp)
  204013:	06f12223          	sw	a5,100(sp)
  204017:	06e12023          	sw	a4,96(sp)
  20401b:	04d12e23          	sw	a3,92(sp)
  20401f:	04c12c23          	sw	a2,88(sp)
  204023:	04b12a23          	sw	a1,84(sp)
  204027:	05410513          	addi	a0,sp,84
  20402b:	00a12c23          	sw	a0,24(sp)
  20402f:	02500913          	li	s2,37
  204033:	07200993          	li	s3,114
  204037:	06400713          	li	a4,100
  20403b:	00d10b13          	addi	s6,sp,13
  20403f:	00900b93          	li	s7,9
  204043:	00100c13          	li	s8,1
  204047:	07300d13          	li	s10,115
  20404b:	07800d93          	li	s11,120
  20404f:	00401537          	lui	a0,0x401
  204053:	33650c93          	addi	s9,a0,822 # 401336 <__free_ram_end+0xab336>
  204057:	00c0006f          	j	204063 <_binary_shell_bin_start+0xcf0>
  20405b:	22050863          	beqz	a0,20428b <_binary_shell_bin_start+0xf18>
  20405f:	001a8a93          	addi	s5,s5,1
  204063:	000ac583          	lbu	a1,0(s5)
  204067:	01258e63          	beq	a1,s2,204083 <_binary_shell_bin_start+0xd10>
  20406b:	22058863          	beqz	a1,20429b <_binary_shell_bin_start+0xf28>
  20406f:	00058513          	mv	a0,a1
  204073:	00100693          	li	a3,1
  204077:	00000073          	ecall
  20407b:	001a8a93          	addi	s5,s5,1
  20407f:	fe5ff06f          	j	204063 <_binary_shell_bin_start+0xcf0>
  204083:	001ac503          	lbu	a0,1(s5)
  204087:	001a8a93          	addi	s5,s5,1
  20408b:	02a9ce63          	blt	s3,a0,2040c7 <_binary_shell_bin_start+0xd54>
  20408f:	13250863          	beq	a0,s2,2041bf <_binary_shell_bin_start+0xe4c>
  204093:	fce514e3          	bne	a0,a4,20405b <_binary_shell_bin_start+0xce8>
  204097:	01812503          	lw	a0,24(sp)
  20409b:	00450593          	addi	a1,a0,4
  20409f:	00b12c23          	sw	a1,24(sp)
  2040a3:	00052403          	lw	s0,0(a0)
  2040a7:	16044263          	bltz	s0,20420b <_binary_shell_bin_start+0xe98>
  2040ab:	16041a63          	bnez	s0,20421f <_binary_shell_bin_start+0xeac>
  2040af:	03000593          	li	a1,48
  2040b3:	00058513          	mv	a0,a1
  2040b7:	00100693          	li	a3,1
  2040bb:	00000073          	ecall
  2040bf:	001a8a93          	addi	s5,s5,1
  2040c3:	fa1ff06f          	j	204063 <_binary_shell_bin_start+0xcf0>
  2040c7:	11a50663          	beq	a0,s10,2041d3 <_binary_shell_bin_start+0xe60>
  2040cb:	f9b51ae3          	bne	a0,s11,20405f <_binary_shell_bin_start+0xcec>
  2040cf:	01812503          	lw	a0,24(sp)
  2040d3:	00450593          	addi	a1,a0,4
  2040d7:	00b12c23          	sw	a1,24(sp)
  2040db:	00052583          	lw	a1,0(a0)
  2040df:	01c5d513          	srli	a0,a1,0x1c
  2040e3:	00ac8533          	add	a0,s9,a0
  2040e7:	00054603          	lbu	a2,0(a0)
  2040eb:	00060513          	mv	a0,a2
  2040ef:	00100693          	li	a3,1
  2040f3:	00000073          	ecall
  2040f7:	00459513          	slli	a0,a1,0x4
  2040fb:	01c55513          	srli	a0,a0,0x1c
  2040ff:	00ac8533          	add	a0,s9,a0
  204103:	00054603          	lbu	a2,0(a0)
  204107:	00060513          	mv	a0,a2
  20410b:	00100693          	li	a3,1
  20410f:	00000073          	ecall
  204113:	00859513          	slli	a0,a1,0x8
  204117:	01c55513          	srli	a0,a0,0x1c
  20411b:	00ac8533          	add	a0,s9,a0
  20411f:	00054603          	lbu	a2,0(a0)
  204123:	00060513          	mv	a0,a2
  204127:	00100693          	li	a3,1
  20412b:	00000073          	ecall
  20412f:	00c59513          	slli	a0,a1,0xc
  204133:	01c55513          	srli	a0,a0,0x1c
  204137:	00ac8533          	add	a0,s9,a0
  20413b:	00054603          	lbu	a2,0(a0)
  20413f:	00060513          	mv	a0,a2
  204143:	00100693          	li	a3,1
  204147:	00000073          	ecall
  20414b:	01059513          	slli	a0,a1,0x10
  20414f:	01c55513          	srli	a0,a0,0x1c
  204153:	00ac8533          	add	a0,s9,a0
  204157:	00054603          	lbu	a2,0(a0)
  20415b:	00060513          	mv	a0,a2
  20415f:	00100693          	li	a3,1
  204163:	00000073          	ecall
  204167:	01459513          	slli	a0,a1,0x14
  20416b:	01c55513          	srli	a0,a0,0x1c
  20416f:	00ac8533          	add	a0,s9,a0
  204173:	00054603          	lbu	a2,0(a0)
  204177:	00060513          	mv	a0,a2
  20417b:	00100693          	li	a3,1
  20417f:	00000073          	ecall
  204183:	01859513          	slli	a0,a1,0x18
  204187:	01c55513          	srli	a0,a0,0x1c
  20418b:	00ac8533          	add	a0,s9,a0
  20418f:	00054603          	lbu	a2,0(a0)
  204193:	00060513          	mv	a0,a2
  204197:	00100693          	li	a3,1
  20419b:	00000073          	ecall
  20419f:	00f5f593          	andi	a1,a1,15
  2041a3:	00bc85b3          	add	a1,s9,a1
  2041a7:	0005c583          	lbu	a1,0(a1)
  2041ab:	00058513          	mv	a0,a1
  2041af:	00100693          	li	a3,1
  2041b3:	00000073          	ecall
  2041b7:	001a8a93          	addi	s5,s5,1
  2041bb:	ea9ff06f          	j	204063 <_binary_shell_bin_start+0xcf0>
  2041bf:	00090513          	mv	a0,s2
  2041c3:	00100693          	li	a3,1
  2041c7:	00000073          	ecall
  2041cb:	001a8a93          	addi	s5,s5,1
  2041cf:	e95ff06f          	j	204063 <_binary_shell_bin_start+0xcf0>
  2041d3:	01812503          	lw	a0,24(sp)
  2041d7:	00450593          	addi	a1,a0,4
  2041db:	00b12c23          	sw	a1,24(sp)
  2041df:	00052603          	lw	a2,0(a0)
  2041e3:	00064583          	lbu	a1,0(a2)
  2041e7:	e6058ce3          	beqz	a1,20405f <_binary_shell_bin_start+0xcec>
  2041eb:	00160613          	addi	a2,a2,1
  2041ef:	00058513          	mv	a0,a1
  2041f3:	00100693          	li	a3,1
  2041f7:	00000073          	ecall
  2041fb:	00064583          	lbu	a1,0(a2)
  2041ff:	00160613          	addi	a2,a2,1
  204203:	fe0596e3          	bnez	a1,2041ef <_binary_shell_bin_start+0xe7c>
  204207:	e59ff06f          	j	20405f <_binary_shell_bin_start+0xcec>
  20420b:	02d00593          	li	a1,45
  20420f:	00058513          	mv	a0,a1
  204213:	00100693          	li	a3,1
  204217:	00000073          	ecall
  20421b:	40800433          	neg	s0,s0
  20421f:	00000513          	li	a0,0
  204223:	00040493          	mv	s1,s0
  204227:	00050a13          	mv	s4,a0
  20422b:	00a00593          	li	a1,10
  20422f:	00040513          	mv	a0,s0
  204233:	00000097          	auipc	ra,0x0
  204237:	258080e7          	jalr	600(ra) # 20448b <_binary_shell_bin_start+0x1118>
  20423b:	00050413          	mv	s0,a0
  20423f:	00a00593          	li	a1,10
  204243:	00000097          	auipc	ra,0x0
  204247:	21c080e7          	jalr	540(ra) # 20445f <_binary_shell_bin_start+0x10ec>
  20424b:	40a48533          	sub	a0,s1,a0
  20424f:	03056593          	ori	a1,a0,48
  204253:	001a0513          	addi	a0,s4,1
  204257:	014b0633          	add	a2,s6,s4
  20425b:	00b60023          	sb	a1,0(a2)
  20425f:	fc9be2e3          	bltu	s7,s1,204223 <_binary_shell_bin_start+0xeb0>
  204263:	06400713          	li	a4,100
  204267:	014b0533          	add	a0,s6,s4
  20426b:	00054583          	lbu	a1,0(a0)
  20426f:	00058513          	mv	a0,a1
  204273:	00100693          	li	a3,1
  204277:	00000073          	ecall
  20427b:	001a0513          	addi	a0,s4,1
  20427f:	fffa0a13          	addi	s4,s4,-1
  204283:	feac42e3          	blt	s8,a0,204267 <_binary_shell_bin_start+0xef4>
  204287:	dd9ff06f          	j	20405f <_binary_shell_bin_start+0xcec>
  20428b:	02500593          	li	a1,37
  20428f:	00058513          	mv	a0,a1
  204293:	00100693          	li	a3,1
  204297:	00000073          	ecall
  20429b:	04c12083          	lw	ra,76(sp)
  20429f:	04812403          	lw	s0,72(sp)
  2042a3:	04412483          	lw	s1,68(sp)
  2042a7:	04012903          	lw	s2,64(sp)
  2042ab:	03c12983          	lw	s3,60(sp)
  2042af:	03812a03          	lw	s4,56(sp)
  2042b3:	03412a83          	lw	s5,52(sp)
  2042b7:	03012b03          	lw	s6,48(sp)
  2042bb:	02c12b83          	lw	s7,44(sp)
  2042bf:	02812c03          	lw	s8,40(sp)
  2042c3:	02412c83          	lw	s9,36(sp)
  2042c7:	02012d03          	lw	s10,32(sp)
  2042cb:	01c12d83          	lw	s11,28(sp)
  2042cf:	07010113          	addi	sp,sp,112
  2042d3:	00008067          	ret
  2042d7:	fe010113          	addi	sp,sp,-32
  2042db:	00112e23          	sw	ra,28(sp)
  2042df:	00812c23          	sw	s0,24(sp)
  2042e3:	00912a23          	sw	s1,20(sp)
  2042e7:	01212823          	sw	s2,16(sp)
  2042eb:	01312623          	sw	s3,12(sp)
  2042ef:	01412423          	sw	s4,8(sp)
  2042f3:	01512223          	sw	s5,4(sp)
  2042f7:	00050593          	mv	a1,a0
  2042fb:	00054503          	lbu	a0,0(a0)
  2042ff:	03000613          	li	a2,48
  204303:	00a00413          	li	s0,10
  204307:	02c51063          	bne	a0,a2,204327 <_binary_shell_bin_start+0xfb4>
  20430b:	0015c503          	lbu	a0,1(a1)
  20430f:	02056513          	ori	a0,a0,32
  204313:	07800693          	li	a3,120
  204317:	00d51e63          	bne	a0,a3,204333 <_binary_shell_bin_start+0xfc0>
  20431b:	0025c503          	lbu	a0,2(a1)
  20431f:	00258593          	addi	a1,a1,2
  204323:	01000413          	li	s0,16
  204327:	00050613          	mv	a2,a0
  20432b:	00051663          	bnez	a0,204337 <_binary_shell_bin_start+0xfc4>
  20432f:	0740006f          	j	2043a3 <_binary_shell_bin_start+0x1030>
  204333:	00a00413          	li	s0,10
  204337:	00000513          	li	a0,0
  20433b:	00158493          	addi	s1,a1,1
  20433f:	00a00913          	li	s2,10
  204343:	00600993          	li	s3,6
  204347:	00500a13          	li	s4,5
  20434b:	fd060593          	addi	a1,a2,-48
  20434f:	0ff5f693          	zext.b	a3,a1
  204353:	fd000593          	li	a1,-48
  204357:	0326e263          	bltu	a3,s2,20437b <_binary_shell_bin_start+0x1008>
  20435b:	f9f60593          	addi	a1,a2,-97
  20435f:	0ff5f693          	zext.b	a3,a1
  204363:	fa900593          	li	a1,-87
  204367:	0136ea63          	bltu	a3,s3,20437b <_binary_shell_bin_start+0x1008>
  20436b:	fbf60593          	addi	a1,a2,-65
  20436f:	0ff5f693          	zext.b	a3,a1
  204373:	fc900593          	li	a1,-55
  204377:	02da6663          	bltu	s4,a3,2043a3 <_binary_shell_bin_start+0x1030>
  20437b:	0ff67a93          	zext.b	s5,a2
  20437f:	01558ab3          	add	s5,a1,s5
  204383:	028af063          	bgeu	s5,s0,2043a3 <_binary_shell_bin_start+0x1030>
  204387:	00040593          	mv	a1,s0
  20438b:	00000097          	auipc	ra,0x0
  20438f:	0d4080e7          	jalr	212(ra) # 20445f <_binary_shell_bin_start+0x10ec>
  204393:	0004c603          	lbu	a2,0(s1)
  204397:	00aa8533          	add	a0,s5,a0
  20439b:	00148493          	addi	s1,s1,1
  20439f:	fa0616e3          	bnez	a2,20434b <_binary_shell_bin_start+0xfd8>
  2043a3:	01c12083          	lw	ra,28(sp)
  2043a7:	01812403          	lw	s0,24(sp)
  2043ab:	01412483          	lw	s1,20(sp)
  2043af:	01012903          	lw	s2,16(sp)
  2043b3:	00c12983          	lw	s3,12(sp)
  2043b7:	00812a03          	lw	s4,8(sp)
  2043bb:	00412a83          	lw	s5,4(sp)
  2043bf:	02010113          	addi	sp,sp,32
  2043c3:	00008067          	ret
  2043c7:	00200593          	li	a1,2
  2043cb:	00b57663          	bgeu	a0,a1,2043d7 <_binary_shell_bin_start+0x1064>
  2043cf:	00000513          	li	a0,0
  2043d3:	00008067          	ret
  2043d7:	ff010113          	addi	sp,sp,-16
  2043db:	00112623          	sw	ra,12(sp)
  2043df:	00812423          	sw	s0,8(sp)
  2043e3:	00912223          	sw	s1,4(sp)
  2043e7:	01212023          	sw	s2,0(sp)
  2043eb:	00050413          	mv	s0,a0
  2043ef:	00400593          	li	a1,4
  2043f3:	00100513          	li	a0,1
  2043f7:	02b46e63          	bltu	s0,a1,204433 <_binary_shell_bin_start+0x10c0>
  2043fb:	00200493          	li	s1,2
  2043ff:	00040513          	mv	a0,s0
  204403:	00048593          	mv	a1,s1
  204407:	00000097          	auipc	ra,0x0
  20440b:	0e0080e7          	jalr	224(ra) # 2044e7 <_binary_shell_bin_start+0x1174>
  20440f:	00050913          	mv	s2,a0
  204413:	00050e63          	beqz	a0,20442f <_binary_shell_bin_start+0x10bc>
  204417:	00148493          	addi	s1,s1,1
  20441b:	00048513          	mv	a0,s1
  20441f:	00048593          	mv	a1,s1
  204423:	00000097          	auipc	ra,0x0
  204427:	03c080e7          	jalr	60(ra) # 20445f <_binary_shell_bin_start+0x10ec>
  20442b:	fca47ae3          	bgeu	s0,a0,2043ff <_binary_shell_bin_start+0x108c>
  20442f:	01203533          	snez	a0,s2
  204433:	00c12083          	lw	ra,12(sp)
  204437:	00812403          	lw	s0,8(sp)
  20443b:	00412483          	lw	s1,4(sp)
  20443f:	00012903          	lw	s2,0(sp)
  204443:	01010113          	addi	sp,sp,16
  204447:	00008067          	ret
  20444b:	00200693          	li	a3,2
  20444f:	00000073          	ecall
  204453:	00050593          	mv	a1,a0
  204457:	00058513          	mv	a0,a1
  20445b:	00008067          	ret
  20445f:	00000613          	li	a2,0
  204463:	02058063          	beqz	a1,204483 <_binary_shell_bin_start+0x1110>
  204467:	01f59693          	slli	a3,a1,0x1f
  20446b:	41f6d693          	srai	a3,a3,0x1f
  20446f:	00a6f6b3          	and	a3,a3,a0
  204473:	00c68633          	add	a2,a3,a2
  204477:	0015d593          	srli	a1,a1,0x1
  20447b:	00151513          	slli	a0,a0,0x1
  20447f:	fe0594e3          	bnez	a1,204467 <_binary_shell_bin_start+0x10f4>
  204483:	00060513          	mv	a0,a2
  204487:	00008067          	ret
  20448b:	04058a63          	beqz	a1,2044df <_binary_shell_bin_start+0x116c>
  20448f:	00000813          	li	a6,0
  204493:	00000613          	li	a2,0
  204497:	01f00693          	li	a3,31
  20449b:	00100713          	li	a4,1
  20449f:	fff00793          	li	a5,-1
  2044a3:	00181813          	slli	a6,a6,0x1
  2044a7:	00d558b3          	srl	a7,a0,a3
  2044ab:	0018f893          	andi	a7,a7,1
  2044af:	0108e833          	or	a6,a7,a6
  2044b3:	00b838b3          	sltu	a7,a6,a1
  2044b7:	00d712b3          	sll	t0,a4,a3
  2044bb:	fff88893          	addi	a7,a7,-1
  2044bf:	0058f2b3          	and	t0,a7,t0
  2044c3:	00c2e633          	or	a2,t0,a2
  2044c7:	00b8f8b3          	and	a7,a7,a1
  2044cb:	fff68693          	addi	a3,a3,-1
  2044cf:	41180833          	sub	a6,a6,a7
  2044d3:	fcf698e3          	bne	a3,a5,2044a3 <_binary_shell_bin_start+0x1130>
  2044d7:	00060513          	mv	a0,a2
  2044db:	00008067          	ret
  2044df:	00000513          	li	a0,0
  2044e3:	00008067          	ret
  2044e7:	00000613          	li	a2,0
  2044eb:	02058a63          	beqz	a1,20451f <_binary_shell_bin_start+0x11ac>
  2044ef:	01f00693          	li	a3,31
  2044f3:	fff00713          	li	a4,-1
  2044f7:	00161613          	slli	a2,a2,0x1
  2044fb:	00d557b3          	srl	a5,a0,a3
  2044ff:	0017f793          	andi	a5,a5,1
  204503:	00c7e633          	or	a2,a5,a2
  204507:	00b637b3          	sltu	a5,a2,a1
  20450b:	fff78793          	addi	a5,a5,-1
  20450f:	00b7f7b3          	and	a5,a5,a1
  204513:	fff68693          	addi	a3,a3,-1
  204517:	40f60633          	sub	a2,a2,a5
  20451b:	fce69ee3          	bne	a3,a4,2044f7 <_binary_shell_bin_start+0x1184>
  20451f:	00060513          	mv	a0,a2
  204523:	00008067          	ret
  204527:	06058c63          	beqz	a1,20459f <_binary_shell_bin_start+0x122c>
  20452b:	00000293          	li	t0,0
  20452f:	00000613          	li	a2,0
  204533:	41f55693          	srai	a3,a0,0x1f
  204537:	00d54733          	xor	a4,a0,a3
  20453b:	40d706b3          	sub	a3,a4,a3
  20453f:	41f5d713          	srai	a4,a1,0x1f
  204543:	00e5c7b3          	xor	a5,a1,a4
  204547:	40e78733          	sub	a4,a5,a4
  20454b:	01f00793          	li	a5,31
  20454f:	00100813          	li	a6,1
  204553:	fff00893          	li	a7,-1
  204557:	00129293          	slli	t0,t0,0x1
  20455b:	00f6d333          	srl	t1,a3,a5
  20455f:	00137313          	andi	t1,t1,1
  204563:	005362b3          	or	t0,t1,t0
  204567:	00e2b333          	sltu	t1,t0,a4
  20456b:	00f813b3          	sll	t2,a6,a5
  20456f:	fff30313          	addi	t1,t1,-1
  204573:	007373b3          	and	t2,t1,t2
  204577:	00c3e633          	or	a2,t2,a2
  20457b:	00e37333          	and	t1,t1,a4
  20457f:	fff78793          	addi	a5,a5,-1
  204583:	406282b3          	sub	t0,t0,t1
  204587:	fd1798e3          	bne	a5,a7,204557 <_binary_shell_bin_start+0x11e4>
  20458b:	00a5c533          	xor	a0,a1,a0
  20458f:	00055463          	bgez	a0,204597 <_binary_shell_bin_start+0x1224>
  204593:	40c00633          	neg	a2,a2
  204597:	00060513          	mv	a0,a2
  20459b:	00008067          	ret
  20459f:	00000513          	li	a0,0
  2045a3:	00008067          	ret
  2045a7:	00000613          	li	a2,0
  2045ab:	04058a63          	beqz	a1,2045ff <_binary_shell_bin_start+0x128c>
  2045af:	41f55693          	srai	a3,a0,0x1f
  2045b3:	00d54733          	xor	a4,a0,a3
  2045b7:	40d706b3          	sub	a3,a4,a3
  2045bb:	41f5d713          	srai	a4,a1,0x1f
  2045bf:	00e5c5b3          	xor	a1,a1,a4
  2045c3:	40e585b3          	sub	a1,a1,a4
  2045c7:	01f00713          	li	a4,31
  2045cb:	fff00793          	li	a5,-1
  2045cf:	00161613          	slli	a2,a2,0x1
  2045d3:	00e6d833          	srl	a6,a3,a4
  2045d7:	00187813          	andi	a6,a6,1
  2045db:	00c86633          	or	a2,a6,a2
  2045df:	00b63833          	sltu	a6,a2,a1
  2045e3:	fff80813          	addi	a6,a6,-1
  2045e7:	00b87833          	and	a6,a6,a1
  2045eb:	fff70713          	addi	a4,a4,-1
  2045ef:	41060633          	sub	a2,a2,a6
  2045f3:	fcf71ee3          	bne	a4,a5,2045cf <_binary_shell_bin_start+0x125c>
  2045f7:	00055463          	bgez	a0,2045ff <_binary_shell_bin_start+0x128c>
  2045fb:	40c00633          	neg	a2,a2
  2045ff:	00060513          	mv	a0,a2
  204603:	00008067          	ret
  204607:	616d                	.insn	2, 0x616d
  204609:	7274                	.insn	2, 0x7274
  20460b:	7869                	.insn	2, 0x7869
  20460d:	7320                	.insn	2, 0x7320
  20460f:	7a69                	.insn	2, 0x7a69
  204611:	2065                	.insn	2, 0x2065
  204613:	3d21                	.insn	2, 0x3d21
  204615:	3120                	.insn	2, 0x3120
  204617:	0a32                	.insn	2, 0x0a32
  204619:	7300                	.insn	2, 0x7300
  20461b:	5f64                	.insn	2, 0x5f64
  20461d:	6572                	.insn	2, 0x6572
  20461f:	6461                	.insn	2, 0x6461
  204621:	4800                	.insn	2, 0x4800
  204623:	6c65                	.insn	2, 0x6c65
  204625:	6f6c                	.insn	2, 0x6f6c
  204627:	7720                	.insn	2, 0x7720
  204629:	646c726f          	jal	tp,2cbc6f <__free_ram+0x75c6f>
  20462d:	6620                	.insn	2, 0x6620
  20462f:	6f72                	.insn	2, 0x6f72
  204631:	206d                	.insn	2, 0x206d
  204633:	6c656873          	csrrsi	a6,0x6c6,10
  204637:	216c                	.insn	2, 0x216c
  204639:	000a                	.insn	2, 0x000a
  20463b:	7270                	.insn	2, 0x7270
  20463d:	6d69                	.insn	2, 0x6d69
  20463f:	7365                	.insn	2, 0x7365
  204641:	7500                	.insn	2, 0x7500
  204643:	6b6e                	.insn	2, 0x6b6e
  204645:	6f6e                	.insn	2, 0x6f6e
  204647:	63206e77          	.insn	4, 0x63206e77
  20464b:	616d6d6f          	jal	s10,2dac61 <__free_ram+0x84c61>
  20464f:	646e                	.insn	2, 0x646e
  204651:	203a                	.insn	2, 0x203a
  204653:	7325                	.insn	2, 0x7325
  204655:	000a                	.insn	2, 0x000a
  204657:	6f74                	.insn	2, 0x6f74
  204659:	6174                	.insn	2, 0x6174
  20465b:	206c                	.insn	2, 0x206c
  20465d:	7270                	.insn	2, 0x7270
  20465f:	6d69                	.insn	2, 0x6d69
  204661:	7365                	.insn	2, 0x7365
  204663:	203a                	.insn	2, 0x203a
  204665:	6425                	.insn	2, 0x6425
  204667:	2820                	.insn	2, 0x2820
  204669:	2e30                	.insn	2, 0x2e30
  20466b:	252e                	.insn	2, 0x252e
  20466d:	2964                	.insn	2, 0x2964
  20466f:	000a                	.insn	2, 0x000a
  204671:	735f6173          	csrrsi	sp,mhpmevent21h,30
  204675:	6174                	.insn	2, 0x6174
  204677:	7472                	.insn	2, 0x7472
  204679:	6800                	.insn	2, 0x6800
  20467b:	6c65                	.insn	2, 0x6c65
  20467d:	6f6c                	.insn	2, 0x6f6c
  20467f:	6300                	.insn	2, 0x6300
  204681:	616d6d6f          	jal	s10,2dac97 <__free_ram+0x84c97>
  204685:	646e                	.insn	2, 0x646e
  204687:	000a3a73          	csrrc	s4,0x0,s4
  20468b:	6568                	.insn	2, 0x6568
  20468d:	706c                	.insn	2, 0x706c
  20468f:	7100                	.insn	2, 0x7100
  204691:	7300                	.insn	2, 0x7300
  204693:	6568                	.insn	2, 0x6568
  204695:	6c6c                	.insn	2, 0x6c6c
  204697:	7320                	.insn	2, 0x7320
  204699:	6174                	.insn	2, 0x6174
  20469b:	7472                	.insn	2, 0x7472
  20469d:	0a2e                	.insn	2, 0x0a2e
  20469f:	6400                	.insn	2, 0x6400
  2046a1:	6d75                	.insn	2, 0x6d75
  2046a3:	0070                	.insn	2, 0x0070
  2046a5:	6425                	.insn	2, 0x6425
  2046a7:	0020                	.insn	2, 0x0020
  2046a9:	3130                	.insn	2, 0x3130
  2046ab:	3332                	.insn	2, 0x3332
  2046ad:	3534                	.insn	2, 0x3534
  2046af:	3736                	.insn	2, 0x3736
  2046b1:	3938                	.insn	2, 0x3938
  2046b3:	6261                	.insn	2, 0x6261
  2046b5:	66656463          	bltu	a0,t1,204d1d <_binary_shell_bin_start+0x19aa>
  2046b9:	7500                	.insn	2, 0x7500
  2046bb:	65676173          	csrrsi	sp,hviprio1h,14
  2046bf:	203a                	.insn	2, 0x203a
  2046c1:	725f6473          	csrrsi	s0,mhpmevent5h,30
  2046c5:	6165                	.insn	2, 0x6165
  2046c7:	2064                	.insn	2, 0x2064
  2046c9:	733c                	.insn	2, 0x733c
  2046cb:	6365                	.insn	2, 0x6365
  2046cd:	6f74                	.insn	2, 0x6f74
  2046cf:	3e72                	.insn	2, 0x3e72
  2046d1:	000a                	.insn	2, 0x000a
  2046d3:	616d                	.insn	2, 0x616d
  2046d5:	2078                	.insn	2, 0x2078
  2046d7:	6f74                	.insn	2, 0x6f74
  2046d9:	616c206f          	j	2c6cef <__free_ram+0x70cef>
  2046dd:	6772                	.insn	2, 0x6772
  2046df:	2065                	.insn	2, 0x2065
  2046e1:	3c28                	.insn	2, 0x3c28
  2046e3:	313d                	.insn	2, 0x313d
  2046e5:	3030                	.insn	2, 0x3030
  2046e7:	3030                	.insn	2, 0x3030
  2046e9:	2930                	.insn	2, 0x2930
  2046eb:	000a                	.insn	2, 0x000a
  2046ed:	7571                	.insn	2, 0x7571
  2046ef:	7469                	.insn	2, 0x7469
  2046f1:	6500                	.insn	2, 0x6500
  2046f3:	6978                	.insn	2, 0x6978
  2046f5:	0074                	.insn	2, 0x0074
	...

セクション .debug_loc の逆アセンブル:

00000000 <$d.6>:
       0:	ffff                	.insn	2, 0xffff
       2:	ffff                	.insn	2, 0xffff
       4:	0010                	.insn	2, 0x0010
       6:	0020                	.insn	2, 0x0020
       8:	0064                	.insn	2, 0x0064
       a:	0000                	.insn	2, 0x0000
       c:	00a0                	.insn	2, 0x00a0
       e:	0000                	.insn	2, 0x0000
      10:	0001                	.insn	2, 0x0001
      12:	005a                	.insn	2, 0x005a
      14:	0000                	.insn	2, 0x0000
      16:	0000                	.insn	2, 0x0000
      18:	0000                	.insn	2, 0x0000
      1a:	ff00                	.insn	2, 0xff00
      1c:	ffff                	.insn	2, 0xffff
      1e:	200010ff 00009800 	.insn	12, 0xf00000009800200010ff
      26:	0000f000 
      2a:	0100                	.insn	2, 0x0100
      2c:	5800                	.insn	2, 0x5800
	...
      36:	ffff                	.insn	2, 0xffff
      38:	ffff                	.insn	2, 0xffff
      3a:	0010                	.insn	2, 0x0010
      3c:	0020                	.insn	2, 0x0020
      3e:	02a8                	.insn	2, 0x02a8
      40:	0000                	.insn	2, 0x0000
      42:	02d4                	.insn	2, 0x02d4
      44:	0000                	.insn	2, 0x0000
      46:	0001                	.insn	2, 0x0001
      48:	f45a                	.insn	2, 0xf45a
      4a:	0002                	.insn	2, 0x0002
      4c:	0800                	.insn	2, 0x0800
      4e:	01000003          	lb	zero,16(zero) # 10 <$d.6+0x10>
      52:	5a00                	.insn	2, 0x5a00
      54:	0328                	.insn	2, 0x0328
      56:	0000                	.insn	2, 0x0000
      58:	0338                	.insn	2, 0x0338
      5a:	0000                	.insn	2, 0x0000
      5c:	0001                	.insn	2, 0x0001
      5e:	005a                	.insn	2, 0x005a
      60:	0000                	.insn	2, 0x0000
      62:	0000                	.insn	2, 0x0000
      64:	0000                	.insn	2, 0x0000
      66:	ff00                	.insn	2, 0xff00
      68:	ffff                	.insn	2, 0xffff
      6a:	200010ff 0002a800 	.insn	12, 0x0002c8000002a800200010ff
      72:	0002c800 
      76:	0100                	.insn	2, 0x0100
      78:	5b00                	.insn	2, 0x5b00
      7a:	02c8                	.insn	2, 0x02c8
      7c:	0000                	.insn	2, 0x0000
      7e:	03f0                	.insn	2, 0x03f0
      80:	0000                	.insn	2, 0x0000
      82:	0001                	.insn	2, 0x0001
      84:	0058                	.insn	2, 0x0058
      86:	0000                	.insn	2, 0x0000
      88:	0000                	.insn	2, 0x0000
      8a:	0000                	.insn	2, 0x0000
      8c:	ff00                	.insn	2, 0xff00
      8e:	ffff                	.insn	2, 0xffff
      90:	200010ff 0002a800 	.insn	12, 0x0002e4000002a800200010ff
      98:	0002e400 
      9c:	0100                	.insn	2, 0x0100
      9e:	5c00                	.insn	2, 0x5c00
      a0:	02f4                	.insn	2, 0x02f4
      a2:	0000                	.insn	2, 0x0000
      a4:	031c                	.insn	2, 0x031c
      a6:	0000                	.insn	2, 0x0000
      a8:	0001                	.insn	2, 0x0001
      aa:	285c                	.insn	2, 0x285c
      ac:	98000003          	lb	zero,-1664(zero) # fffff980 <__free_ram_end+0xffca9980>
      b0:	01000003          	lb	zero,16(zero) # 10 <$d.6+0x10>
      b4:	5c00                	.insn	2, 0x5c00
      b6:	03a4                	.insn	2, 0x03a4
      b8:	0000                	.insn	2, 0x0000
      ba:	03a8                	.insn	2, 0x03a8
      bc:	0000                	.insn	2, 0x0000
      be:	0001                	.insn	2, 0x0001
      c0:	a85c                	.insn	2, 0xa85c
      c2:	d8000003          	lb	zero,-640(zero) # fffffd80 <__free_ram_end+0xffca9d80>
      c6:	01000003          	lb	zero,16(zero) # 10 <$d.6+0x10>
      ca:	6300                	.insn	2, 0x6300
	...
      d4:	ffff                	.insn	2, 0xffff
      d6:	ffff                	.insn	2, 0xffff
      d8:	0010                	.insn	2, 0x0010
      da:	0020                	.insn	2, 0x0020
      dc:	02a8                	.insn	2, 0x02a8
      de:	0000                	.insn	2, 0x0000
      e0:	02e8                	.insn	2, 0x02e8
      e2:	0000                	.insn	2, 0x0000
      e4:	0001                	.insn	2, 0x0001
      e6:	f45d                	.insn	2, 0xf45d
      e8:	0002                	.insn	2, 0x0002
      ea:	1800                	.insn	2, 0x1800
      ec:	01000003          	lb	zero,16(zero) # 10 <$d.6+0x10>
      f0:	5d00                	.insn	2, 0x5d00
      f2:	0328                	.insn	2, 0x0328
      f4:	0000                	.insn	2, 0x0000
      f6:	03a0                	.insn	2, 0x03a0
      f8:	0000                	.insn	2, 0x0000
      fa:	0001                	.insn	2, 0x0001
      fc:	a45d                	.insn	2, 0xa45d
      fe:	b8000003          	lb	zero,-1152(zero) # fffffb80 <__free_ram_end+0xffca9b80>
     102:	01000003          	lb	zero,16(zero) # 10 <$d.6+0x10>
     106:	5d00                	.insn	2, 0x5d00
     108:	03b8                	.insn	2, 0x03b8
     10a:	0000                	.insn	2, 0x0000
     10c:	03d8                	.insn	2, 0x03d8
     10e:	0000                	.insn	2, 0x0000
     110:	0001                	.insn	2, 0x0001
     112:	0064                	.insn	2, 0x0064
     114:	0000                	.insn	2, 0x0000
     116:	0000                	.insn	2, 0x0000
     118:	0000                	.insn	2, 0x0000
     11a:	ff00                	.insn	2, 0xff00
     11c:	ffff                	.insn	2, 0xffff
     11e:	200010ff 00036800 	.insn	12, 0x0003cc0000036800200010ff
     126:	0003cc00 
     12a:	0100                	.insn	2, 0x0100
     12c:	5900                	.insn	2, 0x5900
	...
     136:	ffff                	.insn	2, 0xffff
     138:	ffff                	.insn	2, 0xffff
     13a:	0010                	.insn	2, 0x0010
     13c:	0020                	.insn	2, 0x0020
     13e:	03c8                	.insn	2, 0x03c8
     140:	0000                	.insn	2, 0x0000
     142:	03cc                	.insn	2, 0x03cc
     144:	0000                	.insn	2, 0x0000
     146:	0001                	.insn	2, 0x0001
     148:	0059                	.insn	2, 0x0059
     14a:	0000                	.insn	2, 0x0000
     14c:	0000                	.insn	2, 0x0000
     14e:	0000                	.insn	2, 0x0000
     150:	ff00                	.insn	2, 0xff00
     152:	ffff                	.insn	2, 0xffff
     154:	200010ff 0003e000 	.insn	12, 0x000400000003e000200010ff
     15c:	00040000 
     160:	0100                	.insn	2, 0x0100
     162:	5a00                	.insn	2, 0x5a00
	...
     16c:	ffff                	.insn	2, 0xffff
     16e:	ffff                	.insn	2, 0xffff
     170:	0010                	.insn	2, 0x0010
     172:	0020                	.insn	2, 0x0020
     174:	042c                	.insn	2, 0x042c
     176:	0000                	.insn	2, 0x0000
     178:	0478                	.insn	2, 0x0478
     17a:	0000                	.insn	2, 0x0000
     17c:	0001                	.insn	2, 0x0001
     17e:	785a                	.insn	2, 0x785a
     180:	0004                	.insn	2, 0x0004
     182:	2800                	.insn	2, 0x2800
     184:	0100000b          	.insn	4, 0x0100000b
     188:	6500                	.insn	2, 0x6500
	...
     192:	ffff                	.insn	2, 0xffff
     194:	ffff                	.insn	2, 0xffff
     196:	0010                	.insn	2, 0x0010
     198:	0020                	.insn	2, 0x0020
     19a:	042c                	.insn	2, 0x042c
     19c:	0000                	.insn	2, 0x0000
     19e:	0474                	.insn	2, 0x0474
     1a0:	0000                	.insn	2, 0x0000
     1a2:	0001                	.insn	2, 0x0001
     1a4:	0004745b          	.insn	4, 0x0004745b
     1a8:	0c00                	.insn	2, 0x0c00
     1aa:	000c                	.insn	2, 0x000c
     1ac:	0100                	.insn	2, 0x0100
     1ae:	6600                	.insn	2, 0x6600
     1b0:	0c28                	.insn	2, 0x0c28
     1b2:	0000                	.insn	2, 0x0000
     1b4:	0c48                	.insn	2, 0x0c48
     1b6:	0000                	.insn	2, 0x0000
     1b8:	0001                	.insn	2, 0x0001
     1ba:	0066                	.insn	2, 0x0066
     1bc:	0000                	.insn	2, 0x0000
     1be:	0000                	.insn	2, 0x0000
     1c0:	0000                	.insn	2, 0x0000
     1c2:	ff00                	.insn	2, 0xff00
     1c4:	ffff                	.insn	2, 0xffff
     1c6:	200010ff 00047800 	.insn	12, 0x00047c0000047800200010ff
     1ce:	00047c00 
     1d2:	0300                	.insn	2, 0x0300
     1d4:	1100                	.insn	2, 0x1100
     1d6:	9f00                	.insn	2, 0x9f00
     1d8:	047c                	.insn	2, 0x047c
     1da:	0000                	.insn	2, 0x0000
     1dc:	048c                	.insn	2, 0x048c
     1de:	0000                	.insn	2, 0x0000
     1e0:	01110003          	lb	zero,17(sp)
     1e4:	8c9f 0004 a400      	.insn	6, 0xa40000048c9f
     1ea:	0004                	.insn	2, 0x0004
     1ec:	0300                	.insn	2, 0x0300
     1ee:	1100                	.insn	2, 0x1100
     1f0:	9f02                	.insn	2, 0x9f02
     1f2:	04a4                	.insn	2, 0x04a4
     1f4:	0000                	.insn	2, 0x0000
     1f6:	04b4                	.insn	2, 0x04b4
     1f8:	0000                	.insn	2, 0x0000
     1fa:	03110003          	lb	zero,49(sp)
     1fe:	b49f 0004 cc00      	.insn	6, 0xcc000004b49f
     204:	0004                	.insn	2, 0x0004
     206:	0300                	.insn	2, 0x0300
     208:	1100                	.insn	2, 0x1100
     20a:	9f04                	.insn	2, 0x9f04
     20c:	04cc                	.insn	2, 0x04cc
     20e:	0000                	.insn	2, 0x0000
     210:	04dc                	.insn	2, 0x04dc
     212:	0000                	.insn	2, 0x0000
     214:	05110003          	lb	zero,81(sp)
     218:	dc9f 0004 f400      	.insn	6, 0xf4000004dc9f
     21e:	0004                	.insn	2, 0x0004
     220:	0300                	.insn	2, 0x0300
     222:	1100                	.insn	2, 0x1100
     224:	9f06                	.insn	2, 0x9f06
     226:	04f4                	.insn	2, 0x04f4
     228:	0000                	.insn	2, 0x0000
     22a:	0504                	.insn	2, 0x0504
     22c:	0000                	.insn	2, 0x0000
     22e:	07110003          	lb	zero,113(sp)
     232:	049f 0005 2400      	.insn	6, 0x24000005049f
     238:	0005                	.insn	2, 0x0005
     23a:	0300                	.insn	2, 0x0300
     23c:	1100                	.insn	2, 0x1100
     23e:	9f08                	.insn	2, 0x9f08
     240:	0524                	.insn	2, 0x0524
     242:	0000                	.insn	2, 0x0000
     244:	052c                	.insn	2, 0x052c
     246:	0000                	.insn	2, 0x0000
     248:	00110003          	lb	zero,1(sp)
     24c:	2c9f 0005 3400      	.insn	6, 0x340000052c9f
     252:	0005                	.insn	2, 0x0005
     254:	0300                	.insn	2, 0x0300
     256:	1100                	.insn	2, 0x1100
     258:	9f01                	.insn	2, 0x9f01
     25a:	0534                	.insn	2, 0x0534
     25c:	0000                	.insn	2, 0x0000
     25e:	053c                	.insn	2, 0x053c
     260:	0000                	.insn	2, 0x0000
     262:	02110003          	lb	zero,33(sp)
     266:	3c9f 0005 4400      	.insn	6, 0x440000053c9f
     26c:	0005                	.insn	2, 0x0005
     26e:	0300                	.insn	2, 0x0300
     270:	1100                	.insn	2, 0x1100
     272:	05449f03          	lh	t5,84(s1)
     276:	0000                	.insn	2, 0x0000
     278:	054c                	.insn	2, 0x054c
     27a:	0000                	.insn	2, 0x0000
     27c:	04110003          	lb	zero,65(sp)
     280:	4c9f 0005 5400      	.insn	6, 0x540000054c9f
     286:	0005                	.insn	2, 0x0005
     288:	0300                	.insn	2, 0x0300
     28a:	1100                	.insn	2, 0x1100
     28c:	9f05                	.insn	2, 0x9f05
     28e:	0554                	.insn	2, 0x0554
     290:	0000                	.insn	2, 0x0000
     292:	055c                	.insn	2, 0x055c
     294:	0000                	.insn	2, 0x0000
     296:	06110003          	lb	zero,97(sp)
     29a:	5c9f 0005 6000      	.insn	6, 0x600000055c9f
     2a0:	0005                	.insn	2, 0x0005
     2a2:	0300                	.insn	2, 0x0300
     2a4:	1100                	.insn	2, 0x1100
     2a6:	00009f07          	.insn	4, 0x9f07
     2aa:	0000                	.insn	2, 0x0000
     2ac:	0000                	.insn	2, 0x0000
     2ae:	0000                	.insn	2, 0x0000
     2b0:	ffff                	.insn	2, 0xffff
     2b2:	ffff                	.insn	2, 0xffff
     2b4:	0010                	.insn	2, 0x0010
     2b6:	0020                	.insn	2, 0x0020
     2b8:	0478                	.insn	2, 0x0478
     2ba:	0000                	.insn	2, 0x0000
     2bc:	0560                	.insn	2, 0x0560
     2be:	0000                	.insn	2, 0x0000
     2c0:	0002                	.insn	2, 0x0002
     2c2:	9f30                	.insn	2, 0x9f30
     2c4:	0bb8                	.insn	2, 0x0bb8
     2c6:	0000                	.insn	2, 0x0000
     2c8:	0bf4                	.insn	2, 0x0bf4
     2ca:	0000                	.insn	2, 0x0000
     2cc:	0001                	.insn	2, 0x0001
     2ce:	0058                	.insn	2, 0x0058
     2d0:	0000                	.insn	2, 0x0000
     2d2:	0000                	.insn	2, 0x0000
     2d4:	0000                	.insn	2, 0x0000
     2d6:	ff00                	.insn	2, 0xff00
     2d8:	ffff                	.insn	2, 0xffff
     2da:	200010ff 00057000 	.insn	12, 0x0005b80000057000200010ff
     2e2:	0005b800 
     2e6:	0500                	.insn	2, 0x0500
     2e8:	7c00                	.insn	2, 0x7c00
     2ea:	c08c                	.insn	2, 0xc08c
     2ec:	9f00                	.insn	2, 0x9f00
     2ee:	05b8                	.insn	2, 0x05b8
     2f0:	0000                	.insn	2, 0x0000
     2f2:	094c                	.insn	2, 0x094c
     2f4:	0000                	.insn	2, 0x0000
     2f6:	0001                	.insn	2, 0x0001
     2f8:	4c68                	.insn	2, 0x4c68
     2fa:	0009                	.insn	2, 0x0009
     2fc:	b800                	.insn	2, 0xb800
     2fe:	0200000b          	.insn	4, 0x0200000b
     302:	7200                	.insn	2, 0x7200
     304:	b800                	.insn	2, 0xb800
     306:	f400000b          	.insn	4, 0xf400000b
     30a:	0500000b          	.insn	4, 0x0500000b
     30e:	7800                	.insn	2, 0x7800
     310:	c090                	.insn	2, 0xc090
     312:	9f00                	.insn	2, 0x9f00
     314:	0c28                	.insn	2, 0x0c28
     316:	0000                	.insn	2, 0x0000
     318:	0c48                	.insn	2, 0x0c48
     31a:	0000                	.insn	2, 0x0000
     31c:	0002                	.insn	2, 0x0002
     31e:	0072                	.insn	2, 0x0072
	...
     328:	ffff                	.insn	2, 0xffff
     32a:	ffff                	.insn	2, 0xffff
     32c:	0010                	.insn	2, 0x0010
     32e:	0020                	.insn	2, 0x0020
     330:	05c8                	.insn	2, 0x05c8
     332:	0000                	.insn	2, 0x0000
     334:	0654                	.insn	2, 0x0654
     336:	0000                	.insn	2, 0x0000
     338:	0002                	.insn	2, 0x0002
     33a:	9f31                	.insn	2, 0x9f31
	...
     344:	ffff                	.insn	2, 0xffff
     346:	ffff                	.insn	2, 0xffff
     348:	0010                	.insn	2, 0x0010
     34a:	0020                	.insn	2, 0x0020
     34c:	05e4                	.insn	2, 0x05e4
     34e:	0000                	.insn	2, 0x0000
     350:	0654                	.insn	2, 0x0654
     352:	0000                	.insn	2, 0x0000
     354:	0001                	.insn	2, 0x0001
     356:	0062                	.insn	2, 0x0062
     358:	0000                	.insn	2, 0x0000
     35a:	0000                	.insn	2, 0x0000
     35c:	0000                	.insn	2, 0x0000
     35e:	ff00                	.insn	2, 0xff00
     360:	ffff                	.insn	2, 0xffff
     362:	200010ff 00063800 	.insn	12, 0x000bfc0000063800200010ff
     36a:	000bfc00 
     36e:	0100                	.insn	2, 0x0100
     370:	6200                	.insn	2, 0x6200
     372:	0c28                	.insn	2, 0x0c28
     374:	0000                	.insn	2, 0x0000
     376:	0c48                	.insn	2, 0x0c48
     378:	0000                	.insn	2, 0x0000
     37a:	0001                	.insn	2, 0x0001
     37c:	0062                	.insn	2, 0x0062
     37e:	0000                	.insn	2, 0x0000
     380:	0000                	.insn	2, 0x0000
     382:	0000                	.insn	2, 0x0000
     384:	ff00                	.insn	2, 0xff00
     386:	ffff                	.insn	2, 0xffff
     388:	200010ff 00065c00 	.insn	12, 0x00067c0000065c00200010ff
     390:	00067c00 
     394:	0100                	.insn	2, 0x0100
     396:	6300                	.insn	2, 0x6300
	...
     3a0:	ffff                	.insn	2, 0xffff
     3a2:	ffff                	.insn	2, 0xffff
     3a4:	0010                	.insn	2, 0x0010
     3a6:	0020                	.insn	2, 0x0020
     3a8:	068c                	.insn	2, 0x068c
     3aa:	0000                	.insn	2, 0x0000
     3ac:	0c48                	.insn	2, 0x0c48
     3ae:	0000                	.insn	2, 0x0000
     3b0:	80100007          	.insn	4, 0x80100007
     3b4:	8080                	.insn	2, 0x8080
     3b6:	0180                	.insn	2, 0x0180
     3b8:	009f 0000 0000      	.insn	6, 0x009f
     3be:	0000                	.insn	2, 0x0000
     3c0:	ff00                	.insn	2, 0xff00
     3c2:	ffff                	.insn	2, 0xffff
     3c4:	200010ff 00069400 	.insn	12, 0x0007500000069400200010ff
     3cc:	00075000 
     3d0:	0100                	.insn	2, 0x0100
     3d2:	6200                	.insn	2, 0x6200
	...
     3dc:	ffff                	.insn	2, 0xffff
     3de:	ffff                	.insn	2, 0xffff
     3e0:	0010                	.insn	2, 0x0010
     3e2:	0020                	.insn	2, 0x0020
     3e4:	06c0                	.insn	2, 0x06c0
     3e6:	0000                	.insn	2, 0x0000
     3e8:	0720                	.insn	2, 0x0720
     3ea:	0000                	.insn	2, 0x0000
     3ec:	0001                	.insn	2, 0x0001
     3ee:	00000063          	beqz	zero,3ee <$d.5+0x1e>
     3f2:	0000                	.insn	2, 0x0000
     3f4:	0000                	.insn	2, 0x0000
     3f6:	ff00                	.insn	2, 0xff00
     3f8:	ffff                	.insn	2, 0xffff
     3fa:	200010ff 00071000 	.insn	12, 0x0007200000071000200010ff
     402:	00072000 
     406:	0100                	.insn	2, 0x0100
     408:	6300                	.insn	2, 0x6300
	...
     412:	ffff                	.insn	2, 0xffff
     414:	ffff                	.insn	2, 0xffff
     416:	0010                	.insn	2, 0x0010
     418:	0020                	.insn	2, 0x0020
     41a:	0720                	.insn	2, 0x0720
     41c:	0000                	.insn	2, 0x0000
     41e:	0750                	.insn	2, 0x0750
     420:	0000                	.insn	2, 0x0000
     422:	0002                	.insn	2, 0x0002
     424:	9f30                	.insn	2, 0x9f30
	...
     42e:	ffff                	.insn	2, 0xffff
     430:	ffff                	.insn	2, 0xffff
     432:	0010                	.insn	2, 0x0010
     434:	0020                	.insn	2, 0x0020
     436:	0728                	.insn	2, 0x0728
     438:	0000                	.insn	2, 0x0000
     43a:	0738                	.insn	2, 0x0738
     43c:	0000                	.insn	2, 0x0000
     43e:	0001                	.insn	2, 0x0001
     440:	005a                	.insn	2, 0x005a
     442:	0000                	.insn	2, 0x0000
     444:	0000                	.insn	2, 0x0000
     446:	0000                	.insn	2, 0x0000
     448:	ff00                	.insn	2, 0xff00
     44a:	ffff                	.insn	2, 0xffff
     44c:	200010ff 00074400 	.insn	12, 0x000c480000074400200010ff
     454:	000c4800 
     458:	0700                	.insn	2, 0x0700
     45a:	1000                	.insn	2, 0x1000
     45c:	a080                	.insn	2, 0xa080
     45e:	8081                	.insn	2, 0x8081
     460:	9f01                	.insn	2, 0x9f01
	...
     46a:	ffff                	.insn	2, 0xffff
     46c:	ffff                	.insn	2, 0xffff
     46e:	0010                	.insn	2, 0x0010
     470:	0020                	.insn	2, 0x0020
     472:	074c                	.insn	2, 0x074c
     474:	0000                	.insn	2, 0x0000
     476:	0808                	.insn	2, 0x0808
     478:	0000                	.insn	2, 0x0000
     47a:	0001                	.insn	2, 0x0001
     47c:	0062                	.insn	2, 0x0062
     47e:	0000                	.insn	2, 0x0000
     480:	0000                	.insn	2, 0x0000
     482:	0000                	.insn	2, 0x0000
     484:	ff00                	.insn	2, 0xff00
     486:	ffff                	.insn	2, 0xffff
     488:	200010ff 00077800 	.insn	12, 0x0007d80000077800200010ff
     490:	0007d800 
     494:	0100                	.insn	2, 0x0100
     496:	6300                	.insn	2, 0x6300
	...
     4a0:	ffff                	.insn	2, 0xffff
     4a2:	ffff                	.insn	2, 0xffff
     4a4:	0010                	.insn	2, 0x0010
     4a6:	0020                	.insn	2, 0x0020
     4a8:	07c8                	.insn	2, 0x07c8
     4aa:	0000                	.insn	2, 0x0000
     4ac:	07d8                	.insn	2, 0x07d8
     4ae:	0000                	.insn	2, 0x0000
     4b0:	0001                	.insn	2, 0x0001
     4b2:	00000063          	beqz	zero,4b2 <$d.5+0xe2>
     4b6:	0000                	.insn	2, 0x0000
     4b8:	0000                	.insn	2, 0x0000
     4ba:	ff00                	.insn	2, 0xff00
     4bc:	ffff                	.insn	2, 0xffff
     4be:	200010ff 0007d800 	.insn	12, 0x000808000007d800200010ff
     4c6:	00080800 
     4ca:	0200                	.insn	2, 0x0200
     4cc:	3500                	.insn	2, 0x3500
     4ce:	009f 0000 0000      	.insn	6, 0x009f
     4d4:	0000                	.insn	2, 0x0000
     4d6:	ff00                	.insn	2, 0xff00
     4d8:	ffff                	.insn	2, 0xffff
     4da:	200010ff 0007e000 	.insn	12, 0x0007f0000007e000200010ff
     4e2:	0007f000 
     4e6:	0100                	.insn	2, 0x0100
     4e8:	5a00                	.insn	2, 0x5a00
	...
     4f2:	ffff                	.insn	2, 0xffff
     4f4:	ffff                	.insn	2, 0xffff
     4f6:	0010                	.insn	2, 0x0010
     4f8:	0020                	.insn	2, 0x0020
     4fa:	07fc                	.insn	2, 0x07fc
     4fc:	0000                	.insn	2, 0x0000
     4fe:	0c48                	.insn	2, 0x0c48
     500:	0000                	.insn	2, 0x0000
     502:	0005                	.insn	2, 0x0005
     504:	8010                	.insn	2, 0x8010
     506:	0880                	.insn	2, 0x0880
     508:	009f 0000 0000      	.insn	6, 0x009f
     50e:	0000                	.insn	2, 0x0000
     510:	ff00                	.insn	2, 0xff00
     512:	ffff                	.insn	2, 0xffff
     514:	200010ff 00080400 	.insn	12, 0x0008c00000080400200010ff
     51c:	0008c000 
     520:	0100                	.insn	2, 0x0100
     522:	6200                	.insn	2, 0x6200
	...
     52c:	ffff                	.insn	2, 0xffff
     52e:	ffff                	.insn	2, 0xffff
     530:	0010                	.insn	2, 0x0010
     532:	0020                	.insn	2, 0x0020
     534:	0830                	.insn	2, 0x0830
     536:	0000                	.insn	2, 0x0000
     538:	0890                	.insn	2, 0x0890
     53a:	0000                	.insn	2, 0x0000
     53c:	0001                	.insn	2, 0x0001
     53e:	00000063          	beqz	zero,53e <$d.5+0x16e>
     542:	0000                	.insn	2, 0x0000
     544:	0000                	.insn	2, 0x0000
     546:	ff00                	.insn	2, 0xff00
     548:	ffff                	.insn	2, 0xffff
     54a:	200010ff 00088000 	.insn	12, 0x0008900000088000200010ff
     552:	00089000 
     556:	0100                	.insn	2, 0x0100
     558:	6300                	.insn	2, 0x6300
	...
     562:	ffff                	.insn	2, 0xffff
     564:	ffff                	.insn	2, 0xffff
     566:	0010                	.insn	2, 0x0010
     568:	0020                	.insn	2, 0x0020
     56a:	0890                	.insn	2, 0x0890
     56c:	0000                	.insn	2, 0x0000
     56e:	08c0                	.insn	2, 0x08c0
     570:	0000                	.insn	2, 0x0000
     572:	20100003          	lb	zero,513(zero) # 201 <$d.9+0x45>
     576:	009f 0000 0000      	.insn	6, 0x009f
     57c:	0000                	.insn	2, 0x0000
     57e:	ff00                	.insn	2, 0xff00
     580:	ffff                	.insn	2, 0xffff
     582:	200010ff 00089800 	.insn	12, 0x0008a80000089800200010ff
     58a:	0008a800 
     58e:	0100                	.insn	2, 0x0100
     590:	5a00                	.insn	2, 0x5a00
	...
     59a:	ffff                	.insn	2, 0xffff
     59c:	ffff                	.insn	2, 0xffff
     59e:	0010                	.insn	2, 0x0010
     5a0:	0020                	.insn	2, 0x0020
     5a2:	08b4                	.insn	2, 0x08b4
     5a4:	0000                	.insn	2, 0x0000
     5a6:	0c48                	.insn	2, 0x0c48
     5a8:	0000                	.insn	2, 0x0000
     5aa:	0005                	.insn	2, 0x0005
     5ac:	8010                	.insn	2, 0x8010
     5ae:	0c80                	.insn	2, 0x0c80
     5b0:	009f 0000 0000      	.insn	6, 0x009f
     5b6:	0000                	.insn	2, 0x0000
     5b8:	ff00                	.insn	2, 0xff00
     5ba:	ffff                	.insn	2, 0xffff
     5bc:	200010ff 0008bc00 	.insn	12, 0x000984000008bc00200010ff
     5c4:	00098400 
     5c8:	0100                	.insn	2, 0x0100
     5ca:	6200                	.insn	2, 0x6200
	...
     5d4:	ffff                	.insn	2, 0xffff
     5d6:	ffff                	.insn	2, 0xffff
     5d8:	0010                	.insn	2, 0x0010
     5da:	0020                	.insn	2, 0x0020
     5dc:	08e8                	.insn	2, 0x08e8
     5de:	0000                	.insn	2, 0x0000
     5e0:	0948                	.insn	2, 0x0948
     5e2:	0000                	.insn	2, 0x0000
     5e4:	0001                	.insn	2, 0x0001
     5e6:	00000063          	beqz	zero,5e6 <$d.5+0x3a>
     5ea:	0000                	.insn	2, 0x0000
     5ec:	0000                	.insn	2, 0x0000
     5ee:	ff00                	.insn	2, 0xff00
     5f0:	ffff                	.insn	2, 0xffff
     5f2:	200010ff 00093800 	.insn	12, 0x0009480000093800200010ff
     5fa:	00094800 
     5fe:	0100                	.insn	2, 0x0100
     600:	6300                	.insn	2, 0x6300
	...
     60a:	ffff                	.insn	2, 0xffff
     60c:	ffff                	.insn	2, 0xffff
     60e:	0010                	.insn	2, 0x0010
     610:	0020                	.insn	2, 0x0020
     612:	0948                	.insn	2, 0x0948
     614:	0000                	.insn	2, 0x0000
     616:	0984                	.insn	2, 0x0984
     618:	0000                	.insn	2, 0x0000
     61a:	30100003          	lb	zero,769(zero) # 301 <$d.7+0x29>
     61e:	009f 0000 0000      	.insn	6, 0x009f
     624:	0000                	.insn	2, 0x0000
     626:	ff00                	.insn	2, 0xff00
     628:	ffff                	.insn	2, 0xffff
     62a:	200010ff 00095c00 	.insn	12, 0x00096c0000095c00200010ff
     632:	00096c00 
     636:	0100                	.insn	2, 0x0100
     638:	5a00                	.insn	2, 0x5a00
	...
     642:	ffff                	.insn	2, 0xffff
     644:	ffff                	.insn	2, 0xffff
     646:	0010                	.insn	2, 0x0010
     648:	0020                	.insn	2, 0x0020
     64a:	0978                	.insn	2, 0x0978
     64c:	0000                	.insn	2, 0x0000
     64e:	0c48                	.insn	2, 0x0c48
     650:	0000                	.insn	2, 0x0000
     652:	80100007          	.insn	4, 0x80100007
     656:	81c0                	.insn	2, 0x81c0
     658:	0180                	.insn	2, 0x0180
     65a:	009f 0000 0000      	.insn	6, 0x009f
     660:	0000                	.insn	2, 0x0000
     662:	ff00                	.insn	2, 0xff00
     664:	ffff                	.insn	2, 0xffff
     666:	200010ff 00098000 	.insn	12, 0x000a240000098000200010ff
     66e:	000a2400 
     672:	0100                	.insn	2, 0x0100
     674:	6200                	.insn	2, 0x6200
	...
     67e:	ffff                	.insn	2, 0xffff
     680:	ffff                	.insn	2, 0xffff
     682:	0010                	.insn	2, 0x0010
     684:	0020                	.insn	2, 0x0020
     686:	09ac                	.insn	2, 0x09ac
     688:	0000                	.insn	2, 0x0000
     68a:	0a0c                	.insn	2, 0x0a0c
     68c:	0000                	.insn	2, 0x0000
     68e:	0001                	.insn	2, 0x0001
     690:	00000063          	beqz	zero,690 <$d.5+0xe4>
     694:	0000                	.insn	2, 0x0000
     696:	0000                	.insn	2, 0x0000
     698:	ff00                	.insn	2, 0xff00
     69a:	ffff                	.insn	2, 0xffff
     69c:	200010ff 0009fc00 	.insn	12, 0x000a0c000009fc00200010ff
     6a4:	000a0c00 
     6a8:	0100                	.insn	2, 0x0100
     6aa:	6300                	.insn	2, 0x6300
	...
     6b4:	ffff                	.insn	2, 0xffff
     6b6:	ffff                	.insn	2, 0xffff
     6b8:	0010                	.insn	2, 0x0010
     6ba:	0020                	.insn	2, 0x0020
     6bc:	0a0c                	.insn	2, 0x0a0c
     6be:	0000                	.insn	2, 0x0000
     6c0:	0a24                	.insn	2, 0x0a24
     6c2:	0000                	.insn	2, 0x0000
     6c4:	0002                	.insn	2, 0x0002
     6c6:	9f36                	.insn	2, 0x9f36
	...
     6d0:	ffff                	.insn	2, 0xffff
     6d2:	ffff                	.insn	2, 0xffff
     6d4:	0010                	.insn	2, 0x0010
     6d6:	0020                	.insn	2, 0x0020
     6d8:	0a14                	.insn	2, 0x0a14
     6da:	0000                	.insn	2, 0x0000
     6dc:	0a24                	.insn	2, 0x0a24
     6de:	0000                	.insn	2, 0x0000
     6e0:	0001                	.insn	2, 0x0001
     6e2:	005a                	.insn	2, 0x005a
     6e4:	0000                	.insn	2, 0x0000
     6e6:	0000                	.insn	2, 0x0000
     6e8:	0000                	.insn	2, 0x0000
     6ea:	ff00                	.insn	2, 0xff00
     6ec:	ffff                	.insn	2, 0xffff
     6ee:	200010ff 000a6400 	.insn	12, 0x000a9c00000a6400200010ff
     6f6:	000a9c00 
     6fa:	0100                	.insn	2, 0x0100
     6fc:	6300                	.insn	2, 0x6300
     6fe:	0adc                	.insn	2, 0x0adc
     700:	0000                	.insn	2, 0x0000
     702:	0aec                	.insn	2, 0x0aec
     704:	0000                	.insn	2, 0x0000
     706:	0001                	.insn	2, 0x0001
     708:	00000063          	beqz	zero,708 <$d.5+0x15c>
     70c:	0000                	.insn	2, 0x0000
     70e:	0000                	.insn	2, 0x0000
     710:	ff00                	.insn	2, 0xff00
     712:	ffff                	.insn	2, 0xffff
     714:	200010ff 000a6400 	.insn	12, 0x000a9000000a6400200010ff
     71c:	000a9000 
     720:	0600                	.insn	2, 0x0600
     722:	8600                	.insn	2, 0x8600
     724:	8700                	.insn	2, 0x8700
     726:	1c00                	.insn	2, 0x1c00
     728:	dc9f 000a ec00      	.insn	6, 0xec00000adc9f
     72e:	000a                	.insn	2, 0x000a
     730:	0600                	.insn	2, 0x0600
     732:	8600                	.insn	2, 0x8600
     734:	8700                	.insn	2, 0x8700
     736:	1c00                	.insn	2, 0x1c00
     738:	009f 0000 0000      	.insn	6, 0x009f
     73e:	0000                	.insn	2, 0x0000
     740:	ff00                	.insn	2, 0xff00
     742:	ffff                	.insn	2, 0xffff
     744:	200010ff 000a6400 	.insn	12, 0x000a7400000a6400200010ff
     74c:	000a7400 
     750:	0100                	.insn	2, 0x0100
     752:	5c00                	.insn	2, 0x5c00
	...
     75c:	ffff                	.insn	2, 0xffff
     75e:	ffff                	.insn	2, 0xffff
     760:	0010                	.insn	2, 0x0010
     762:	0020                	.insn	2, 0x0020
     764:	0a9c                	.insn	2, 0x0a9c
     766:	0000                	.insn	2, 0x0000
     768:	0ae4                	.insn	2, 0x0ae4
     76a:	0000                	.insn	2, 0x0000
     76c:	0002                	.insn	2, 0x0002
     76e:	9f31                	.insn	2, 0x9f31
     770:	0aec                	.insn	2, 0x0aec
     772:	0000                	.insn	2, 0x0000
     774:	0b0c                	.insn	2, 0x0b0c
     776:	0000                	.insn	2, 0x0000
     778:	0002                	.insn	2, 0x0002
     77a:	9f31                	.insn	2, 0x9f31
	...
     784:	ffff                	.insn	2, 0xffff
     786:	ffff                	.insn	2, 0xffff
     788:	0010                	.insn	2, 0x0010
     78a:	0020                	.insn	2, 0x0020
     78c:	0ab8                	.insn	2, 0x0ab8
     78e:	0000                	.insn	2, 0x0000
     790:	0ae4                	.insn	2, 0x0ae4
     792:	0000                	.insn	2, 0x0000
     794:	0001                	.insn	2, 0x0001
     796:	000aec63          	bltu	s5,zero,7ae <$d.3+0x28>
     79a:	0c00                	.insn	2, 0x0c00
     79c:	0100000b          	.insn	4, 0x0100000b
     7a0:	6300                	.insn	2, 0x6300
	...
     7aa:	ffff                	.insn	2, 0xffff
     7ac:	ffff                	.insn	2, 0xffff
     7ae:	0010                	.insn	2, 0x0010
     7b0:	0020                	.insn	2, 0x0020
     7b2:	0b48                	.insn	2, 0x0b48
     7b4:	0000                	.insn	2, 0x0000
     7b6:	0ba8                	.insn	2, 0x0ba8
     7b8:	0000                	.insn	2, 0x0000
     7ba:	0001                	.insn	2, 0x0001
     7bc:	2858                	.insn	2, 0x2858
     7be:	000c                	.insn	2, 0x000c
     7c0:	4800                	.insn	2, 0x4800
     7c2:	000c                	.insn	2, 0x000c
     7c4:	0100                	.insn	2, 0x0100
     7c6:	5800                	.insn	2, 0x5800
	...
     7d0:	ffff                	.insn	2, 0xffff
     7d2:	ffff                	.insn	2, 0xffff
     7d4:	0010                	.insn	2, 0x0010
     7d6:	0020                	.insn	2, 0x0020
     7d8:	0b24                	.insn	2, 0x0b24
     7da:	0000                	.insn	2, 0x0000
     7dc:	0ba8                	.insn	2, 0x0ba8
     7de:	0000                	.insn	2, 0x0000
     7e0:	0006                	.insn	2, 0x0006
     7e2:	8010                	.insn	2, 0x8010
     7e4:	b880                	.insn	2, 0xb880
     7e6:	9f02                	.insn	2, 0x9f02
     7e8:	0c28                	.insn	2, 0x0c28
     7ea:	0000                	.insn	2, 0x0000
     7ec:	0c48                	.insn	2, 0x0c48
     7ee:	0000                	.insn	2, 0x0000
     7f0:	0006                	.insn	2, 0x0006
     7f2:	8010                	.insn	2, 0x8010
     7f4:	b880                	.insn	2, 0xb880
     7f6:	9f02                	.insn	2, 0x9f02
	...
     800:	ffff                	.insn	2, 0xffff
     802:	ffff                	.insn	2, 0xffff
     804:	0010                	.insn	2, 0x0010
     806:	0020                	.insn	2, 0x0020
     808:	0b48                	.insn	2, 0x0b48
     80a:	0000                	.insn	2, 0x0000
     80c:	0ba8                	.insn	2, 0x0ba8
     80e:	0000                	.insn	2, 0x0000
     810:	0002                	.insn	2, 0x0002
     812:	9f31                	.insn	2, 0x9f31
     814:	0c28                	.insn	2, 0x0c28
     816:	0000                	.insn	2, 0x0000
     818:	0c48                	.insn	2, 0x0c48
     81a:	0000                	.insn	2, 0x0000
     81c:	0002                	.insn	2, 0x0002
     81e:	9f31                	.insn	2, 0x9f31
	...
     828:	ffff                	.insn	2, 0xffff
     82a:	ffff                	.insn	2, 0xffff
     82c:	0010                	.insn	2, 0x0010
     82e:	0020                	.insn	2, 0x0020
     830:	0b60                	.insn	2, 0x0b60
     832:	0000                	.insn	2, 0x0000
     834:	0ba8                	.insn	2, 0x0ba8
     836:	0000                	.insn	2, 0x0000
     838:	0001                	.insn	2, 0x0001
     83a:	2859                	.insn	2, 0x2859
     83c:	000c                	.insn	2, 0x000c
     83e:	4800                	.insn	2, 0x4800
     840:	000c                	.insn	2, 0x000c
     842:	0100                	.insn	2, 0x0100
     844:	5900                	.insn	2, 0x5900
	...
     84e:	ffff                	.insn	2, 0xffff
     850:	ffff                	.insn	2, 0xffff
     852:	0010                	.insn	2, 0x0010
     854:	0020                	.insn	2, 0x0020
     856:	0b80                	.insn	2, 0x0b80
     858:	0000                	.insn	2, 0x0000
     85a:	0ba8                	.insn	2, 0x0ba8
     85c:	0000                	.insn	2, 0x0000
     85e:	0001                	.insn	2, 0x0001
     860:	0059                	.insn	2, 0x0059
     862:	0000                	.insn	2, 0x0000
     864:	0000                	.insn	2, 0x0000
     866:	0000                	.insn	2, 0x0000
     868:	ff00                	.insn	2, 0xff00
     86a:	ffff                	.insn	2, 0xffff
     86c:	200010ff 000c9400 	.insn	12, 0x000c9c00000c9400200010ff
     874:	000c9c00 
     878:	0100                	.insn	2, 0x0100
     87a:	5d00                	.insn	2, 0x5d00
     87c:	0cd8                	.insn	2, 0x0cd8
     87e:	0000                	.insn	2, 0x0000
     880:	0ce0                	.insn	2, 0x0ce0
     882:	0000                	.insn	2, 0x0000
     884:	0001                	.insn	2, 0x0001
     886:	1c5d                	.insn	2, 0x1c5d
     888:	000d                	.insn	2, 0x000d
     88a:	2400                	.insn	2, 0x2400
     88c:	000d                	.insn	2, 0x000d
     88e:	0100                	.insn	2, 0x0100
     890:	5d00                	.insn	2, 0x5d00
     892:	0d60                	.insn	2, 0x0d60
     894:	0000                	.insn	2, 0x0000
     896:	0d68                	.insn	2, 0x0d68
     898:	0000                	.insn	2, 0x0000
     89a:	0001                	.insn	2, 0x0001
     89c:	a45d                	.insn	2, 0xa45d
     89e:	000d                	.insn	2, 0x000d
     8a0:	ac00                	.insn	2, 0xac00
     8a2:	000d                	.insn	2, 0x000d
     8a4:	0100                	.insn	2, 0x0100
     8a6:	5d00                	.insn	2, 0x5d00
     8a8:	0de8                	.insn	2, 0x0de8
     8aa:	0000                	.insn	2, 0x0000
     8ac:	0df0                	.insn	2, 0x0df0
     8ae:	0000                	.insn	2, 0x0000
     8b0:	0001                	.insn	2, 0x0001
     8b2:	2c5d                	.insn	2, 0x2c5d
     8b4:	000e                	.insn	2, 0x000e
     8b6:	3400                	.insn	2, 0x3400
     8b8:	000e                	.insn	2, 0x000e
     8ba:	0100                	.insn	2, 0x0100
     8bc:	5d00                	.insn	2, 0x5d00
     8be:	0e70                	.insn	2, 0x0e70
     8c0:	0000                	.insn	2, 0x0000
     8c2:	0e78                	.insn	2, 0x0e78
     8c4:	0000                	.insn	2, 0x0000
     8c6:	0001                	.insn	2, 0x0001
     8c8:	005d                	.insn	2, 0x005d
     8ca:	0000                	.insn	2, 0x0000
     8cc:	0000                	.insn	2, 0x0000
     8ce:	0000                	.insn	2, 0x0000
     8d0:	ff00                	.insn	2, 0xff00
     8d2:	ffff                	.insn	2, 0xffff
     8d4:	200010ff 000c8c00 	.insn	12, 0x000c9c00000c8c00200010ff
     8dc:	000c9c00 
     8e0:	0300                	.insn	2, 0x0300
     8e2:	1100                	.insn	2, 0x1100
     8e4:	9f00                	.insn	2, 0x9f00
     8e6:	0c9c                	.insn	2, 0x0c9c
     8e8:	0000                	.insn	2, 0x0000
     8ea:	0ce0                	.insn	2, 0x0ce0
     8ec:	0000                	.insn	2, 0x0000
     8ee:	01110003          	lb	zero,17(sp)
     8f2:	e09f 000c 2400      	.insn	6, 0x2400000ce09f
     8f8:	000d                	.insn	2, 0x000d
     8fa:	0300                	.insn	2, 0x0300
     8fc:	1100                	.insn	2, 0x1100
     8fe:	9f02                	.insn	2, 0x9f02
     900:	0d24                	.insn	2, 0x0d24
     902:	0000                	.insn	2, 0x0000
     904:	0d68                	.insn	2, 0x0d68
     906:	0000                	.insn	2, 0x0000
     908:	03110003          	lb	zero,49(sp)
     90c:	689f 000d ac00      	.insn	6, 0xac00000d689f
     912:	000d                	.insn	2, 0x000d
     914:	0300                	.insn	2, 0x0300
     916:	1100                	.insn	2, 0x1100
     918:	9f04                	.insn	2, 0x9f04
     91a:	0dac                	.insn	2, 0x0dac
     91c:	0000                	.insn	2, 0x0000
     91e:	0df0                	.insn	2, 0x0df0
     920:	0000                	.insn	2, 0x0000
     922:	05110003          	lb	zero,81(sp)
     926:	f09f 000d 3400      	.insn	6, 0x3400000df09f
     92c:	000e                	.insn	2, 0x000e
     92e:	0300                	.insn	2, 0x0300
     930:	1100                	.insn	2, 0x1100
     932:	9f06                	.insn	2, 0x9f06
     934:	0e34                	.insn	2, 0x0e34
     936:	0000                	.insn	2, 0x0000
     938:	0e78                	.insn	2, 0x0e78
     93a:	0000                	.insn	2, 0x0000
     93c:	07110003          	lb	zero,113(sp)
     940:	789f 000e 7c00      	.insn	6, 0x7c00000e789f
     946:	000e                	.insn	2, 0x000e
     948:	0300                	.insn	2, 0x0300
     94a:	1100                	.insn	2, 0x1100
     94c:	9f08                	.insn	2, 0x9f08
	...
     956:	ffff                	.insn	2, 0xffff
     958:	ffff                	.insn	2, 0xffff
     95a:	0010                	.insn	2, 0x0010
     95c:	0020                	.insn	2, 0x0020
     95e:	0c8c                	.insn	2, 0x0c8c
     960:	0000                	.insn	2, 0x0000
     962:	0e7c                	.insn	2, 0x0e7c
     964:	0000                	.insn	2, 0x0000
     966:	0001                	.insn	2, 0x0001
     968:	000e7c5b          	.insn	4, 0x000e7c5b
     96c:	d000                	.insn	2, 0xd000
     96e:	000e                	.insn	2, 0x000e
     970:	0100                	.insn	2, 0x0100
     972:	5d00                	.insn	2, 0x5d00
	...
     97c:	ffff                	.insn	2, 0xffff
     97e:	ffff                	.insn	2, 0xffff
     980:	0010                	.insn	2, 0x0010
     982:	0020                	.insn	2, 0x0020
     984:	0e8c                	.insn	2, 0x0e8c
     986:	0000                	.insn	2, 0x0000
     988:	0ec4                	.insn	2, 0x0ec4
     98a:	0000                	.insn	2, 0x0000
     98c:	0001                	.insn	2, 0x0001
     98e:	005a                	.insn	2, 0x005a
     990:	0000                	.insn	2, 0x0000
     992:	0000                	.insn	2, 0x0000
     994:	0000                	.insn	2, 0x0000
     996:	ff00                	.insn	2, 0xff00
     998:	ffff                	.insn	2, 0xffff
     99a:	200010ff 000edc00 	.insn	12, 0x000f3400000edc00200010ff
     9a2:	000f3400 
     9a6:	0100                	.insn	2, 0x0100
     9a8:	5a00                	.insn	2, 0x5a00
     9aa:	0f4c                	.insn	2, 0x0f4c
     9ac:	0000                	.insn	2, 0x0000
     9ae:	0f5c                	.insn	2, 0x0f5c
     9b0:	0000                	.insn	2, 0x0000
     9b2:	0001                	.insn	2, 0x0001
     9b4:	845a                	.insn	2, 0x845a
     9b6:	fc00000f          	.insn	4, 0xfc00000f
     9ba:	0100000f          	fence	w,unknown
     9be:	5a00                	.insn	2, 0x5a00
     9c0:	1014                	.insn	2, 0x1014
     9c2:	0000                	.insn	2, 0x0000
     9c4:	1018                	.insn	2, 0x1018
     9c6:	0000                	.insn	2, 0x0000
     9c8:	0001                	.insn	2, 0x0001
     9ca:	3c5a                	.insn	2, 0x3c5a
     9cc:	0010                	.insn	2, 0x0010
     9ce:	6800                	.insn	2, 0x6800
     9d0:	0010                	.insn	2, 0x0010
     9d2:	0100                	.insn	2, 0x0100
     9d4:	5a00                	.insn	2, 0x5a00
     9d6:	1074                	.insn	2, 0x1074
     9d8:	0000                	.insn	2, 0x0000
     9da:	1084                	.insn	2, 0x1084
     9dc:	0000                	.insn	2, 0x0000
     9de:	0001                	.insn	2, 0x0001
     9e0:	ac5a                	.insn	2, 0xac5a
     9e2:	0010                	.insn	2, 0x0010
     9e4:	dc00                	.insn	2, 0xdc00
     9e6:	0010                	.insn	2, 0x0010
     9e8:	0100                	.insn	2, 0x0100
     9ea:	5a00                	.insn	2, 0x5a00
     9ec:	1128                	.insn	2, 0x1128
     9ee:	0000                	.insn	2, 0x0000
     9f0:	112c                	.insn	2, 0x112c
     9f2:	0000                	.insn	2, 0x0000
     9f4:	0001                	.insn	2, 0x0001
     9f6:	005a                	.insn	2, 0x005a
     9f8:	0000                	.insn	2, 0x0000
     9fa:	0000                	.insn	2, 0x0000
     9fc:	0000                	.insn	2, 0x0000
     9fe:	ff00                	.insn	2, 0xff00
     a00:	ffff                	.insn	2, 0xffff
     a02:	200010ff 000f3800 	.insn	12, 0x000f4c00000f3800200010ff
     a0a:	000f4c00 
     a0e:	0300                	.insn	2, 0x0300
     a10:	7a00                	.insn	2, 0x7a00
     a12:	9f00                	.insn	2, 0x9f00
     a14:	1034                	.insn	2, 0x1034
     a16:	0000                	.insn	2, 0x0000
     a18:	103c                	.insn	2, 0x103c
     a1a:	0000                	.insn	2, 0x0000
     a1c:	007a0003          	lb	zero,7(s4)
     a20:	009f 0000 0000      	.insn	6, 0x009f
     a26:	0000                	.insn	2, 0x0000
     a28:	ff00                	.insn	2, 0xff00
     a2a:	ffff                	.insn	2, 0xffff
     a2c:	200010ff 000fac00 	.insn	12, 0x00101400000fac00200010ff
     a34:	00101400 
     a38:	0100                	.insn	2, 0x0100
     a3a:	5e00                	.insn	2, 0x5e00
	...
     a44:	ffff                	.insn	2, 0xffff
     a46:	ffff                	.insn	2, 0xffff
     a48:	0010                	.insn	2, 0x0010
     a4a:	0020                	.insn	2, 0x0020
     a4c:	0fd8                	.insn	2, 0x0fd8
     a4e:	0000                	.insn	2, 0x0000
     a50:	1014                	.insn	2, 0x1014
     a52:	0000                	.insn	2, 0x0000
     a54:	0001                	.insn	2, 0x0001
     a56:	0000005b          	.insn	4, 0x005b
     a5a:	0000                	.insn	2, 0x0000
     a5c:	0000                	.insn	2, 0x0000
     a5e:	ff00                	.insn	2, 0xff00
     a60:	ffff                	.insn	2, 0xffff
     a62:	200010ff 00100000 	.insn	12, 0x0010140000100000200010ff
     a6a:	00101400 
     a6e:	0100                	.insn	2, 0x0100
     a70:	5d00                	.insn	2, 0x5d00
	...
     a7a:	ffff                	.insn	2, 0xffff
     a7c:	ffff                	.insn	2, 0xffff
     a7e:	0010                	.insn	2, 0x0010
     a80:	0020                	.insn	2, 0x0020
     a82:	1058                	.insn	2, 0x1058
     a84:	0000                	.insn	2, 0x0000
     a86:	1068                	.insn	2, 0x1068
     a88:	0000                	.insn	2, 0x0000
     a8a:	0001                	.insn	2, 0x0001
     a8c:	0050                	.insn	2, 0x0050
     a8e:	0000                	.insn	2, 0x0000
     a90:	0000                	.insn	2, 0x0000
     a92:	0000                	.insn	2, 0x0000
     a94:	ff00                	.insn	2, 0xff00
     a96:	ffff                	.insn	2, 0xffff
     a98:	200010ff 0010f400 	.insn	12, 0x001114000010f400200010ff
     aa0:	00111400 
     aa4:	0100                	.insn	2, 0x0100
     aa6:	5d00                	.insn	2, 0x5d00
     aa8:	1114                	.insn	2, 0x1114
     aaa:	0000                	.insn	2, 0x0000
     aac:	1128                	.insn	2, 0x1128
     aae:	0000                	.insn	2, 0x0000
     ab0:	0001                	.insn	2, 0x0001
     ab2:	0000005b          	.insn	4, 0x005b
     ab6:	0000                	.insn	2, 0x0000
     ab8:	0000                	.insn	2, 0x0000
     aba:	ff00                	.insn	2, 0xff00
     abc:	ffff                	.insn	2, 0xffff
     abe:	200010ff 00110c00 	.insn	12, 0x0011280000110c00200010ff
     ac6:	00112800 
     aca:	0100                	.insn	2, 0x0100
     acc:	5a00                	.insn	2, 0x5a00
	...
     ad6:	ffff                	.insn	2, 0xffff
     ad8:	ffff                	.insn	2, 0xffff
     ada:	0010                	.insn	2, 0x0010
     adc:	0020                	.insn	2, 0x0020
     ade:	1150                	.insn	2, 0x1150
     ae0:	0000                	.insn	2, 0x0000
     ae2:	1180                	.insn	2, 0x1180
     ae4:	0000                	.insn	2, 0x0000
     ae6:	0001                	.insn	2, 0x0001
     ae8:	985a                	.insn	2, 0x985a
     aea:	0011                	.insn	2, 0x0011
     aec:	9c00                	.insn	2, 0x9c00
     aee:	0011                	.insn	2, 0x0011
     af0:	0100                	.insn	2, 0x0100
     af2:	5a00                	.insn	2, 0x5a00
     af4:	11bc                	.insn	2, 0x11bc
     af6:	0000                	.insn	2, 0x0000
     af8:	11c0                	.insn	2, 0x11c0
     afa:	0000                	.insn	2, 0x0000
     afc:	0001                	.insn	2, 0x0001
     afe:	005a                	.insn	2, 0x005a
     b00:	0000                	.insn	2, 0x0000
     b02:	0000                	.insn	2, 0x0000
     b04:	0000                	.insn	2, 0x0000
     b06:	ff00                	.insn	2, 0xff00
     b08:	ffff                	.insn	2, 0xffff
     b0a:	200010ff 00116000 	.insn	12, 0x0011800000116000200010ff
     b12:	00118000 
     b16:	0100                	.insn	2, 0x0100
     b18:	5d00                	.insn	2, 0x5d00
     b1a:	1198                	.insn	2, 0x1198
     b1c:	0000                	.insn	2, 0x0000
     b1e:	11b0                	.insn	2, 0x11b0
     b20:	0000                	.insn	2, 0x0000
     b22:	0001                	.insn	2, 0x0001
     b24:	bc5d                	.insn	2, 0xbc5d
     b26:	0011                	.insn	2, 0x0011
     b28:	dc00                	.insn	2, 0xdc00
     b2a:	0011                	.insn	2, 0x0011
     b2c:	0100                	.insn	2, 0x0100
     b2e:	5d00                	.insn	2, 0x5d00
	...
     b38:	ffff                	.insn	2, 0xffff
     b3a:	ffff                	.insn	2, 0xffff
     b3c:	0010                	.insn	2, 0x0010
     b3e:	0020                	.insn	2, 0x0020
     b40:	1164                	.insn	2, 0x1164
     b42:	0000                	.insn	2, 0x0000
     b44:	1180                	.insn	2, 0x1180
     b46:	0000                	.insn	2, 0x0000
     b48:	0001                	.insn	2, 0x0001
     b4a:	985e                	.insn	2, 0x985e
     b4c:	0011                	.insn	2, 0x0011
     b4e:	b800                	.insn	2, 0xb800
     b50:	0011                	.insn	2, 0x0011
     b52:	0100                	.insn	2, 0x0100
     b54:	5e00                	.insn	2, 0x5e00
     b56:	11bc                	.insn	2, 0x11bc
     b58:	0000                	.insn	2, 0x0000
     b5a:	11dc                	.insn	2, 0x11dc
     b5c:	0000                	.insn	2, 0x0000
     b5e:	0001                	.insn	2, 0x0001
     b60:	005e                	.insn	2, 0x005e
     b62:	0000                	.insn	2, 0x0000
     b64:	0000                	.insn	2, 0x0000
     b66:	0000                	.insn	2, 0x0000
     b68:	ff00                	.insn	2, 0xff00
     b6a:	ffff                	.insn	2, 0xffff
     b6c:	200010ff 00116800 	.insn	12, 0x0011900000116800200010ff
     b74:	00119000 
     b78:	0100                	.insn	2, 0x0100
     b7a:	5800                	.insn	2, 0x5800
     b7c:	1198                	.insn	2, 0x1198
     b7e:	0000                	.insn	2, 0x0000
     b80:	11e0                	.insn	2, 0x11e0
     b82:	0000                	.insn	2, 0x0000
     b84:	0001                	.insn	2, 0x0001
     b86:	0058                	.insn	2, 0x0058
     b88:	0000                	.insn	2, 0x0000
     b8a:	0000                	.insn	2, 0x0000
     b8c:	0000                	.insn	2, 0x0000
     b8e:	ff00                	.insn	2, 0xff00
     b90:	ffff                	.insn	2, 0xffff
     b92:	200010ff 00116c00 	.insn	12, 0x0011800000116c00200010ff
     b9a:	00118000 
     b9e:	0100                	.insn	2, 0x0100
     ba0:	5f00                	.insn	2, 0x5f00
     ba2:	1198                	.insn	2, 0x1198
     ba4:	0000                	.insn	2, 0x0000
     ba6:	11b8                	.insn	2, 0x11b8
     ba8:	0000                	.insn	2, 0x0000
     baa:	0001                	.insn	2, 0x0001
     bac:	bc5f 0011 d400      	.insn	6, 0xd4000011bc5f
     bb2:	0011                	.insn	2, 0x0011
     bb4:	0100                	.insn	2, 0x0100
     bb6:	5f00                	.insn	2, 0x5f00
	...
     bc0:	ffff                	.insn	2, 0xffff
     bc2:	ffff                	.insn	2, 0xffff
     bc4:	0010                	.insn	2, 0x0010
     bc6:	0020                	.insn	2, 0x0020
     bc8:	11e0                	.insn	2, 0x11e0
     bca:	0000                	.insn	2, 0x0000
     bcc:	1214                	.insn	2, 0x1214
     bce:	0000                	.insn	2, 0x0000
     bd0:	0001                	.insn	2, 0x0001
     bd2:	145a                	.insn	2, 0x145a
     bd4:	0012                	.insn	2, 0x0012
     bd6:	4400                	.insn	2, 0x4400
     bd8:	01000013          	li	zero,16
     bdc:	5800                	.insn	2, 0x5800
     bde:	1370                	.insn	2, 0x1370
     be0:	0000                	.insn	2, 0x0000
     be2:	137c                	.insn	2, 0x137c
     be4:	0000                	.insn	2, 0x0000
     be6:	0001                	.insn	2, 0x0001
     be8:	0058                	.insn	2, 0x0058
     bea:	0000                	.insn	2, 0x0000
     bec:	0000                	.insn	2, 0x0000
     bee:	0000                	.insn	2, 0x0000
     bf0:	ff00                	.insn	2, 0xff00
     bf2:	ffff                	.insn	2, 0xffff
     bf4:	200010ff 0011e000 	.insn	12, 0x001210000011e000200010ff
     bfc:	00121000 
     c00:	0100                	.insn	2, 0x0100
     c02:	5b00                	.insn	2, 0x5b00
     c04:	1210                	.insn	2, 0x1210
     c06:	0000                	.insn	2, 0x0000
     c08:	1230                	.insn	2, 0x1230
     c0a:	0000                	.insn	2, 0x0000
     c0c:	0001                	.insn	2, 0x0001
     c0e:	005c                	.insn	2, 0x005c
     c10:	0000                	.insn	2, 0x0000
     c12:	0000                	.insn	2, 0x0000
     c14:	0000                	.insn	2, 0x0000
     c16:	ff00                	.insn	2, 0xff00
     c18:	ffff                	.insn	2, 0xffff
     c1a:	200010ff 00121400 	.insn	12, 0x0012d40000121400200010ff
     c22:	0012d400 
     c26:	0200                	.insn	2, 0x0200
     c28:	3100                	.insn	2, 0x3100
     c2a:	d49f 0012 0400      	.insn	6, 0x04000012d49f
     c30:	01000013          	li	zero,16
     c34:	5a00                	.insn	2, 0x5a00
     c36:	1304                	.insn	2, 0x1304
     c38:	0000                	.insn	2, 0x0000
     c3a:	131c                	.insn	2, 0x131c
     c3c:	0000                	.insn	2, 0x0000
     c3e:	0002                	.insn	2, 0x0002
     c40:	9f30                	.insn	2, 0x9f30
     c42:	131c                	.insn	2, 0x131c
     c44:	0000                	.insn	2, 0x0000
     c46:	1330                	.insn	2, 0x1330
     c48:	0000                	.insn	2, 0x0000
     c4a:	0002                	.insn	2, 0x0002
     c4c:	9f31                	.insn	2, 0x9f31
     c4e:	1330                	.insn	2, 0x1330
     c50:	0000                	.insn	2, 0x0000
     c52:	1334                	.insn	2, 0x1334
     c54:	0000                	.insn	2, 0x0000
     c56:	0001                	.insn	2, 0x0001
     c58:	705a                	.insn	2, 0x705a
     c5a:	74000013          	li	zero,1856
     c5e:	01000013          	li	zero,16
     c62:	5a00                	.insn	2, 0x5a00
	...
     c6c:	ffff                	.insn	2, 0xffff
     c6e:	ffff                	.insn	2, 0xffff
     c70:	0010                	.insn	2, 0x0010
     c72:	0020                	.insn	2, 0x0020
     c74:	1218                	.insn	2, 0x1218
     c76:	0000                	.insn	2, 0x0000
     c78:	12ac                	.insn	2, 0x12ac
     c7a:	0000                	.insn	2, 0x0000
     c7c:	0001                	.insn	2, 0x0001
     c7e:	1c64                	.insn	2, 0x1c64
     c80:	30000013          	li	zero,768
     c84:	01000013          	li	zero,16
     c88:	6400                	.insn	2, 0x6400
	...
     c92:	ffff                	.insn	2, 0xffff
     c94:	ffff                	.insn	2, 0xffff
     c96:	0010                	.insn	2, 0x0010
     c98:	0020                	.insn	2, 0x0020
     c9a:	1248                	.insn	2, 0x1248
     c9c:	0000                	.insn	2, 0x0000
     c9e:	131c                	.insn	2, 0x131c
     ca0:	0000                	.insn	2, 0x0000
     ca2:	0001                	.insn	2, 0x0001
     ca4:	3062                	.insn	2, 0x3062
     ca6:	34000013          	li	zero,832
     caa:	01000013          	li	zero,16
     cae:	6200                	.insn	2, 0x6200
     cb0:	1370                	.insn	2, 0x1370
     cb2:	0000                	.insn	2, 0x0000
     cb4:	137c                	.insn	2, 0x137c
     cb6:	0000                	.insn	2, 0x0000
     cb8:	0001                	.insn	2, 0x0001
     cba:	0062                	.insn	2, 0x0062
     cbc:	0000                	.insn	2, 0x0000
     cbe:	0000                	.insn	2, 0x0000
     cc0:	0000                	.insn	2, 0x0000
     cc2:	ff00                	.insn	2, 0xff00
     cc4:	ffff                	.insn	2, 0xffff
     cc6:	200010ff 00121c00 	.insn	12, 0x0012c40000121c00200010ff
     cce:	0012c400 
     cd2:	0100                	.insn	2, 0x0100
     cd4:	5900                	.insn	2, 0x5900
     cd6:	131c                	.insn	2, 0x131c
     cd8:	0000                	.insn	2, 0x0000
     cda:	1330                	.insn	2, 0x1330
     cdc:	0000                	.insn	2, 0x0000
     cde:	0001                	.insn	2, 0x0001
     ce0:	0059                	.insn	2, 0x0059
     ce2:	0000                	.insn	2, 0x0000
     ce4:	0000                	.insn	2, 0x0000
     ce6:	0000                	.insn	2, 0x0000
     ce8:	ff00                	.insn	2, 0xff00
     cea:	ffff                	.insn	2, 0xffff
     cec:	200010ff 00124000 	.insn	12, 0x0012640000124000200010ff
     cf4:	00126400 
     cf8:	0200                	.insn	2, 0x0200
     cfa:	3000                	.insn	2, 0x3000
     cfc:	009f 0000 0000      	.insn	6, 0x009f
     d02:	0000                	.insn	2, 0x0000
     d04:	ff00                	.insn	2, 0xff00
     d06:	ffff                	.insn	2, 0xffff
     d08:	200010ff 00124000 	.insn	12, 0x0012640000124000200010ff
     d10:	00126400 
     d14:	0700                	.insn	2, 0x0700
     d16:	1000                	.insn	2, 0x1000
     d18:	acf8                	.insn	2, 0xacf8
     d1a:	91d1                	.insn	2, 0x91d1
     d1c:	9f01                	.insn	2, 0x9f01
     d1e:	1264                	.insn	2, 0x1264
     d20:	0000                	.insn	2, 0x0000
     d22:	1280                	.insn	2, 0x1280
     d24:	0000                	.insn	2, 0x0000
     d26:	0001                	.insn	2, 0x0001
     d28:	8c5c                	.insn	2, 0x8c5c
     d2a:	0012                	.insn	2, 0x0012
     d2c:	a000                	.insn	2, 0xa000
     d2e:	0012                	.insn	2, 0x0012
     d30:	0100                	.insn	2, 0x0100
     d32:	5c00                	.insn	2, 0x5c00
     d34:	12a4                	.insn	2, 0x12a4
     d36:	0000                	.insn	2, 0x0000
     d38:	12d4                	.insn	2, 0x12d4
     d3a:	0000                	.insn	2, 0x0000
     d3c:	f8100007          	.insn	4, 0xf8100007
     d40:	d1ac                	.insn	2, 0xd1ac
     d42:	0191                	.insn	2, 0x0191
     d44:	d49f 0012 1c00      	.insn	6, 0x1c000012d49f
     d4a:	01000013          	li	zero,16
     d4e:	6600                	.insn	2, 0x6600
     d50:	131c                	.insn	2, 0x131c
     d52:	0000                	.insn	2, 0x0000
     d54:	1330                	.insn	2, 0x1330
     d56:	0000                	.insn	2, 0x0000
     d58:	f8100007          	.insn	4, 0xf8100007
     d5c:	d1ac                	.insn	2, 0xd1ac
     d5e:	0191                	.insn	2, 0x0191
     d60:	309f 0013 3400      	.insn	6, 0x34000013309f
     d66:	01000013          	li	zero,16
     d6a:	6600                	.insn	2, 0x6600
     d6c:	1370                	.insn	2, 0x1370
     d6e:	0000                	.insn	2, 0x0000
     d70:	137c                	.insn	2, 0x137c
     d72:	0000                	.insn	2, 0x0000
     d74:	0001                	.insn	2, 0x0001
     d76:	0066                	.insn	2, 0x0066
     d78:	0000                	.insn	2, 0x0000
     d7a:	0000                	.insn	2, 0x0000
     d7c:	0000                	.insn	2, 0x0000
     d7e:	ff00                	.insn	2, 0xff00
     d80:	ffff                	.insn	2, 0xffff
     d82:	200010ff 00126c00 	.insn	12, 0x0012780000126c00200010ff
     d8a:	00127800 
     d8e:	0100                	.insn	2, 0x0100
     d90:	5d00                	.insn	2, 0x5d00
     d92:	12f8                	.insn	2, 0x12f8
     d94:	0000                	.insn	2, 0x0000
     d96:	1310                	.insn	2, 0x1310
     d98:	0000                	.insn	2, 0x0000
     d9a:	0001                	.insn	2, 0x0001
     d9c:	0000005b          	.insn	4, 0x005b
     da0:	0000                	.insn	2, 0x0000
     da2:	0000                	.insn	2, 0x0000
     da4:	ff00                	.insn	2, 0xff00
     da6:	ffff                	.insn	2, 0xffff
     da8:	200010ff 0012a400 	.insn	12, 0x0012d4000012a400200010ff
     db0:	0012d400 
     db4:	0200                	.insn	2, 0x0200
     db6:	3000                	.insn	2, 0x3000
     db8:	009f 0000 0000      	.insn	6, 0x009f
     dbe:	0000                	.insn	2, 0x0000
     dc0:	ff00                	.insn	2, 0xff00
     dc2:	ffff                	.insn	2, 0xffff
     dc4:	200010ff 0012d400 	.insn	12, 0x0012e0000012d400200010ff
     dcc:	0012e000 
     dd0:	0100                	.insn	2, 0x0100
     dd2:	6600                	.insn	2, 0x6600
     dd4:	12e0                	.insn	2, 0x12e0
     dd6:	0000                	.insn	2, 0x0000
     dd8:	12f0                	.insn	2, 0x12f0
     dda:	0000                	.insn	2, 0x0000
     ddc:	0001                	.insn	2, 0x0001
     dde:	005c                	.insn	2, 0x005c
     de0:	0000                	.insn	2, 0x0000
     de2:	0000                	.insn	2, 0x0000
     de4:	0000                	.insn	2, 0x0000
     de6:	ff00                	.insn	2, 0xff00
     de8:	ffff                	.insn	2, 0xffff
     dea:	200010ff 0012fc00 	.insn	12, 0x001310000012fc00200010ff
     df2:	00131000 
     df6:	0100                	.insn	2, 0x0100
     df8:	5c00                	.insn	2, 0x5c00
	...
     e02:	ffff                	.insn	2, 0xffff
     e04:	ffff                	.insn	2, 0xffff
     e06:	0010                	.insn	2, 0x0010
     e08:	0020                	.insn	2, 0x0020
     e0a:	1300                	.insn	2, 0x1300
     e0c:	0000                	.insn	2, 0x0000
     e0e:	1310                	.insn	2, 0x1310
     e10:	0000                	.insn	2, 0x0000
     e12:	0001                	.insn	2, 0x0001
     e14:	005d                	.insn	2, 0x005d
     e16:	0000                	.insn	2, 0x0000
     e18:	0000                	.insn	2, 0x0000
     e1a:	0000                	.insn	2, 0x0000
     e1c:	ff00                	.insn	2, 0xff00
     e1e:	ffff                	.insn	2, 0xffff
     e20:	200010ff 00137c00 	.insn	12, 0x0013ac0000137c00200010ff
     e28:	0013ac00 
     e2c:	0100                	.insn	2, 0x0100
     e2e:	5a00                	.insn	2, 0x5a00
     e30:	13ac                	.insn	2, 0x13ac
     e32:	0000                	.insn	2, 0x0000
     e34:	14c8                	.insn	2, 0x14c8
     e36:	0000                	.insn	2, 0x0000
     e38:	0001                	.insn	2, 0x0001
     e3a:	f058                	.insn	2, 0xf058
     e3c:	0014                	.insn	2, 0x0014
     e3e:	fc00                	.insn	2, 0xfc00
     e40:	0014                	.insn	2, 0x0014
     e42:	0100                	.insn	2, 0x0100
     e44:	5800                	.insn	2, 0x5800
	...
     e4e:	ffff                	.insn	2, 0xffff
     e50:	ffff                	.insn	2, 0xffff
     e52:	0010                	.insn	2, 0x0010
     e54:	0020                	.insn	2, 0x0020
     e56:	137c                	.insn	2, 0x137c
     e58:	0000                	.insn	2, 0x0000
     e5a:	13a8                	.insn	2, 0x13a8
     e5c:	0000                	.insn	2, 0x0000
     e5e:	0001                	.insn	2, 0x0001
     e60:	0013a85b          	.insn	4, 0x0013a85b
     e64:	c400                	.insn	2, 0xc400
     e66:	01000013          	li	zero,16
     e6a:	5c00                	.insn	2, 0x5c00
	...
     e74:	ffff                	.insn	2, 0xffff
     e76:	ffff                	.insn	2, 0xffff
     e78:	0010                	.insn	2, 0x0010
     e7a:	0020                	.insn	2, 0x0020
     e7c:	13ac                	.insn	2, 0x13ac
     e7e:	0000                	.insn	2, 0x0000
     e80:	1450                	.insn	2, 0x1450
     e82:	0000                	.insn	2, 0x0000
     e84:	0002                	.insn	2, 0x0002
     e86:	9f31                	.insn	2, 0x9f31
     e88:	147c                	.insn	2, 0x147c
     e8a:	0000                	.insn	2, 0x0000
     e8c:	149c                	.insn	2, 0x149c
     e8e:	0000                	.insn	2, 0x0000
     e90:	0002                	.insn	2, 0x0002
     e92:	9f30                	.insn	2, 0x9f30
     e94:	149c                	.insn	2, 0x149c
     e96:	0000                	.insn	2, 0x0000
     e98:	14b0                	.insn	2, 0x14b0
     e9a:	0000                	.insn	2, 0x0000
     e9c:	0002                	.insn	2, 0x0002
     e9e:	9f31                	.insn	2, 0x9f31
	...
     ea8:	ffff                	.insn	2, 0xffff
     eaa:	ffff                	.insn	2, 0xffff
     eac:	0010                	.insn	2, 0x0010
     eae:	0020                	.insn	2, 0x0020
     eb0:	13b0                	.insn	2, 0x13b0
     eb2:	0000                	.insn	2, 0x0000
     eb4:	1424                	.insn	2, 0x1424
     eb6:	0000                	.insn	2, 0x0000
     eb8:	0001                	.insn	2, 0x0001
     eba:	00149c63          	bne	s1,ra,ed2 <$d.3+0x74c>
     ebe:	b000                	.insn	2, 0xb000
     ec0:	0014                	.insn	2, 0x0014
     ec2:	0100                	.insn	2, 0x0100
     ec4:	6300                	.insn	2, 0x6300
	...
     ece:	ffff                	.insn	2, 0xffff
     ed0:	ffff                	.insn	2, 0xffff
     ed2:	0010                	.insn	2, 0x0010
     ed4:	0020                	.insn	2, 0x0020
     ed6:	13d4                	.insn	2, 0x13d4
     ed8:	0000                	.insn	2, 0x0000
     eda:	13f8                	.insn	2, 0x13f8
     edc:	0000                	.insn	2, 0x0000
     ede:	0002                	.insn	2, 0x0002
     ee0:	9f30                	.insn	2, 0x9f30
     ee2:	13f8                	.insn	2, 0x13f8
     ee4:	0000                	.insn	2, 0x0000
     ee6:	1400                	.insn	2, 0x1400
     ee8:	0000                	.insn	2, 0x0000
     eea:	0009                	.insn	2, 0x0009
     eec:	0078007b          	.insn	4, 0x0078007b
     ef0:	111c                	.insn	2, 0x111c
     ef2:	1b04                	.insn	2, 0x1b04
     ef4:	009f 0014 0400      	.insn	6, 0x04000014009f
     efa:	0014                	.insn	2, 0x0014
     efc:	0c00                	.insn	2, 0x0c00
     efe:	7b00                	.insn	2, 0x7b00
     f00:	7800                	.insn	2, 0x7800
     f02:	1c00                	.insn	2, 0x1c00
     f04:	0411                	.insn	2, 0x0411
     f06:	2201111b          	.insn	4, 0x2201111b
     f0a:	009f 0000 0000      	.insn	6, 0x009f
     f10:	0000                	.insn	2, 0x0000
     f12:	ff00                	.insn	2, 0xff00
     f14:	ffff                	.insn	2, 0xffff
     f16:	200010ff 0013d400 	.insn	12, 0x0013f8000013d400200010ff
     f1e:	0013f800 
     f22:	0700                	.insn	2, 0x0700
     f24:	1000                	.insn	2, 0x1000
     f26:	91d1adab          	.insn	4, 0x91d1adab
     f2a:	9f01                	.insn	2, 0x9f01
     f2c:	141c                	.insn	2, 0x141c
     f2e:	0000                	.insn	2, 0x0000
     f30:	1450                	.insn	2, 0x1450
     f32:	0000                	.insn	2, 0x0000
     f34:	ab100007          	.insn	4, 0xab100007
     f38:	d1ad                	.insn	2, 0xd1ad
     f3a:	0191                	.insn	2, 0x0191
     f3c:	9c9f 0014 b000      	.insn	6, 0xb00000149c9f
     f42:	0014                	.insn	2, 0x0014
     f44:	0700                	.insn	2, 0x0700
     f46:	1000                	.insn	2, 0x1000
     f48:	91d1adab          	.insn	4, 0x91d1adab
     f4c:	9f01                	.insn	2, 0x9f01
	...
     f56:	ffff                	.insn	2, 0xffff
     f58:	ffff                	.insn	2, 0xffff
     f5a:	0010                	.insn	2, 0x0010
     f5c:	0020                	.insn	2, 0x0020
     f5e:	13f8                	.insn	2, 0x13f8
     f60:	0000                	.insn	2, 0x0000
     f62:	1404                	.insn	2, 0x1404
     f64:	0000                	.insn	2, 0x0000
     f66:	0001                	.insn	2, 0x0001
     f68:	0000005b          	.insn	4, 0x005b
     f6c:	0000                	.insn	2, 0x0000
     f6e:	0000                	.insn	2, 0x0000
     f70:	ff00                	.insn	2, 0xff00
     f72:	ffff                	.insn	2, 0xffff
     f74:	200010ff 0013f800 	.insn	12, 0x001404000013f800200010ff
     f7c:	00140400 
     f80:	0100                	.insn	2, 0x0100
     f82:	5b00                	.insn	2, 0x5b00
     f84:	145c                	.insn	2, 0x145c
     f86:	0000                	.insn	2, 0x0000
     f88:	1474                	.insn	2, 0x1474
     f8a:	0000                	.insn	2, 0x0000
     f8c:	0001                	.insn	2, 0x0001
     f8e:	00147c5b          	.insn	4, 0x00147c5b
     f92:	8800                	.insn	2, 0x8800
     f94:	0014                	.insn	2, 0x0014
     f96:	0100                	.insn	2, 0x0100
     f98:	5b00                	.insn	2, 0x5b00
	...
     fa2:	ffff                	.insn	2, 0xffff
     fa4:	ffff                	.insn	2, 0xffff
     fa6:	0010                	.insn	2, 0x0010
     fa8:	0020                	.insn	2, 0x0020
     faa:	141c                	.insn	2, 0x141c
     fac:	0000                	.insn	2, 0x0000
     fae:	1450                	.insn	2, 0x1450
     fb0:	0000                	.insn	2, 0x0000
     fb2:	0002                	.insn	2, 0x0002
     fb4:	9f30                	.insn	2, 0x9f30
     fb6:	145c                	.insn	2, 0x145c
     fb8:	0000                	.insn	2, 0x0000
     fba:	1468                	.insn	2, 0x1468
     fbc:	0000                	.insn	2, 0x0000
     fbe:	7f830003          	lb	zero,2040(t1)
     fc2:	689f 0014 6c00      	.insn	6, 0x6c000014689f
     fc8:	0014                	.insn	2, 0x0014
     fca:	0100                	.insn	2, 0x0100
     fcc:	6300                	.insn	2, 0x6300
     fce:	147c                	.insn	2, 0x147c
     fd0:	0000                	.insn	2, 0x0000
     fd2:	1494                	.insn	2, 0x1494
     fd4:	0000                	.insn	2, 0x0000
     fd6:	7f830003          	lb	zero,2040(t1)
     fda:	009f 0000 0000      	.insn	6, 0x009f
     fe0:	0000                	.insn	2, 0x0000
     fe2:	ff00                	.insn	2, 0xff00
     fe4:	ffff                	.insn	2, 0xffff
     fe6:	200010ff 00146000 	.insn	12, 0x0014680000146000200010ff
     fee:	00146800 
     ff2:	0100                	.insn	2, 0x0100
     ff4:	5c00                	.insn	2, 0x5c00
     ff6:	147c                	.insn	2, 0x147c
     ff8:	0000                	.insn	2, 0x0000
     ffa:	1488                	.insn	2, 0x1488
     ffc:	0000                	.insn	2, 0x0000
     ffe:	0001                	.insn	2, 0x0001
    1000:	005c                	.insn	2, 0x005c
    1002:	0000                	.insn	2, 0x0000
    1004:	0000                	.insn	2, 0x0000
    1006:	0000                	.insn	2, 0x0000
    1008:	ff00                	.insn	2, 0xff00
    100a:	ffff                	.insn	2, 0xffff
    100c:	200010ff 00146400 	.insn	12, 0x0014680000146400200010ff
    1014:	00146800 
    1018:	0100                	.insn	2, 0x0100
    101a:	5d00                	.insn	2, 0x5d00
    101c:	147c                	.insn	2, 0x147c
    101e:	0000                	.insn	2, 0x0000
    1020:	1488                	.insn	2, 0x1488
    1022:	0000                	.insn	2, 0x0000
    1024:	0001                	.insn	2, 0x0001
    1026:	005d                	.insn	2, 0x005d
    1028:	0000                	.insn	2, 0x0000
    102a:	0000                	.insn	2, 0x0000
    102c:	0000                	.insn	2, 0x0000
    102e:	ff00                	.insn	2, 0xff00
    1030:	ffff                	.insn	2, 0xffff
    1032:	200010ff 0015b000 	.insn	12, 0x0015b8000015b000200010ff
    103a:	0015b800 
    103e:	0100                	.insn	2, 0x0100
    1040:	5a00                	.insn	2, 0x5a00
	...
    104a:	ffff                	.insn	2, 0xffff
    104c:	ffff                	.insn	2, 0xffff
    104e:	0010                	.insn	2, 0x0010
    1050:	0020                	.insn	2, 0x0020
    1052:	160c                	.insn	2, 0x160c
    1054:	0000                	.insn	2, 0x0000
    1056:	1614                	.insn	2, 0x1614
    1058:	0000                	.insn	2, 0x0000
    105a:	0001                	.insn	2, 0x0001
    105c:	0000005b          	.insn	4, 0x005b
    1060:	0000                	.insn	2, 0x0000
    1062:	0000                	.insn	2, 0x0000
	...

00001065 <$d.2>:
    1065:	0000                	.insn	2, 0x0000
    1067:	0000                	.insn	2, 0x0000
    1069:	000c                	.insn	2, 0x000c
    106b:	0000                	.insn	2, 0x0000
    106d:	0001                	.insn	2, 0x0001
    106f:	0000005b          	.insn	4, 0x005b
	...
    107b:	0c00                	.insn	2, 0x0c00
    107d:	0000                	.insn	2, 0x0000
    107f:	0100                	.insn	2, 0x0100
    1081:	5a00                	.insn	2, 0x5a00
    1083:	000c                	.insn	2, 0x000c
    1085:	0000                	.insn	2, 0x0000
    1087:	0018                	.insn	2, 0x0018
    1089:	0000                	.insn	2, 0x0000
    108b:	0001                	.insn	2, 0x0001
    108d:	185d                	.insn	2, 0x185d
    108f:	0000                	.insn	2, 0x0000
    1091:	2000                	.insn	2, 0x2000
    1093:	0000                	.insn	2, 0x0000
    1095:	0100                	.insn	2, 0x0100
    1097:	5f00                	.insn	2, 0x5f00
    1099:	0020                	.insn	2, 0x0020
    109b:	0000                	.insn	2, 0x0000
    109d:	0024                	.insn	2, 0x0024
    109f:	0000                	.insn	2, 0x0000
    10a1:	0001                	.insn	2, 0x0001
    10a3:	005d                	.insn	2, 0x005d
	...
    10ad:	0000                	.insn	2, 0x0000
    10af:	0800                	.insn	2, 0x0800
    10b1:	0000                	.insn	2, 0x0000
    10b3:	0300                	.insn	2, 0x0300
    10b5:	7c00                	.insn	2, 0x7c00
    10b7:	00009f7f 00000000 	.insn	12, 0x002800000000000000009f7f
    10bf:	00280000 
    10c3:	0000                	.insn	2, 0x0000
    10c5:	0034                	.insn	2, 0x0034
    10c7:	0000                	.insn	2, 0x0000
    10c9:	0001                	.insn	2, 0x0001
    10cb:	345a                	.insn	2, 0x345a
    10cd:	0000                	.insn	2, 0x0000
    10cf:	3800                	.insn	2, 0x3800
    10d1:	0000                	.insn	2, 0x0000
    10d3:	0100                	.insn	2, 0x0100
    10d5:	5d00                	.insn	2, 0x5d00
    10d7:	0038                	.insn	2, 0x0038
    10d9:	0000                	.insn	2, 0x0000
    10db:	0040                	.insn	2, 0x0040
    10dd:	0000                	.insn	2, 0x0000
    10df:	0001                	.insn	2, 0x0001
    10e1:	405e                	.insn	2, 0x405e
    10e3:	0000                	.insn	2, 0x0000
    10e5:	4400                	.insn	2, 0x4400
    10e7:	0000                	.insn	2, 0x0000
    10e9:	0100                	.insn	2, 0x0100
    10eb:	5d00                	.insn	2, 0x5d00
	...
    10f5:	0028                	.insn	2, 0x0028
    10f7:	0000                	.insn	2, 0x0000
    10f9:	0030                	.insn	2, 0x0030
    10fb:	0000                	.insn	2, 0x0000
    10fd:	7f7c0003          	lb	zero,2039(s8)
    1101:	009f 0000 0000      	.insn	6, 0x009f
    1107:	0000                	.insn	2, 0x0000
    1109:	4800                	.insn	2, 0x4800
    110b:	0000                	.insn	2, 0x0000
    110d:	6800                	.insn	2, 0x6800
    110f:	0000                	.insn	2, 0x0000
    1111:	0100                	.insn	2, 0x0100
    1113:	5a00                	.insn	2, 0x5a00
    1115:	0084                	.insn	2, 0x0084
    1117:	0000                	.insn	2, 0x0000
    1119:	0088                	.insn	2, 0x0088
    111b:	0000                	.insn	2, 0x0000
    111d:	0001                	.insn	2, 0x0001
    111f:	885a                	.insn	2, 0x885a
    1121:	0000                	.insn	2, 0x0000
    1123:	9c00                	.insn	2, 0x9c00
    1125:	0000                	.insn	2, 0x0000
    1127:	0100                	.insn	2, 0x0100
    1129:	5800                	.insn	2, 0x5800
	...
    1133:	005c                	.insn	2, 0x005c
    1135:	0000                	.insn	2, 0x0000
    1137:	00ac                	.insn	2, 0x00ac
    1139:	0000                	.insn	2, 0x0000
    113b:	00110003          	lb	zero,1(sp)
    113f:	bc9f 0000 f800      	.insn	6, 0xf8000000bc9f
    1145:	0000                	.insn	2, 0x0000
    1147:	0100                	.insn	2, 0x0100
    1149:	5800                	.insn	2, 0x5800
    114b:	00f8                	.insn	2, 0x00f8
    114d:	0000                	.insn	2, 0x0000
    114f:	0110                	.insn	2, 0x0110
    1151:	0000                	.insn	2, 0x0000
    1153:	0001                	.insn	2, 0x0001
    1155:	005f 0000 0000      	.insn	6, 0x005f
    115b:	0000                	.insn	2, 0x0000
    115d:	6000                	.insn	2, 0x6000
    115f:	0000                	.insn	2, 0x0000
    1161:	6800                	.insn	2, 0x6800
    1163:	0000                	.insn	2, 0x0000
    1165:	0100                	.insn	2, 0x0100
    1167:	5a00                	.insn	2, 0x5a00
    1169:	009c                	.insn	2, 0x009c
    116b:	0000                	.insn	2, 0x0000
    116d:	00f0                	.insn	2, 0x00f0
    116f:	0000                	.insn	2, 0x0000
    1171:	0001                	.insn	2, 0x0001
    1173:	f05a                	.insn	2, 0xf05a
    1175:	0000                	.insn	2, 0x0000
    1177:	0400                	.insn	2, 0x0400
    1179:	0001                	.insn	2, 0x0001
    117b:	0100                	.insn	2, 0x0100
    117d:	5e00                	.insn	2, 0x5e00
    117f:	0104                	.insn	2, 0x0104
    1181:	0000                	.insn	2, 0x0000
    1183:	0110                	.insn	2, 0x0110
    1185:	0000                	.insn	2, 0x0000
    1187:	0001                	.insn	2, 0x0001
    1189:	005a                	.insn	2, 0x005a
    118b:	0000                	.insn	2, 0x0000
    118d:	0000                	.insn	2, 0x0000
    118f:	0000                	.insn	2, 0x0000
    1191:	bc00                	.insn	2, 0xbc00
    1193:	0000                	.insn	2, 0x0000
    1195:	c000                	.insn	2, 0xc000
    1197:	0000                	.insn	2, 0x0000
    1199:	0100                	.insn	2, 0x0100
    119b:	6000                	.insn	2, 0x6000
    119d:	00cc                	.insn	2, 0x00cc
    119f:	0000                	.insn	2, 0x0000
    11a1:	00f0                	.insn	2, 0x00f0
    11a3:	0000                	.insn	2, 0x0000
    11a5:	0001                	.insn	2, 0x0001
    11a7:	0060                	.insn	2, 0x0060
    11a9:	0000                	.insn	2, 0x0000
    11ab:	0000                	.insn	2, 0x0000
    11ad:	0000                	.insn	2, 0x0000
    11af:	bc00                	.insn	2, 0xbc00
    11b1:	0000                	.insn	2, 0x0000
    11b3:	e000                	.insn	2, 0xe000
    11b5:	0000                	.insn	2, 0x0000
    11b7:	0100                	.insn	2, 0x0100
    11b9:	5e00                	.insn	2, 0x5e00
    11bb:	00ec                	.insn	2, 0x00ec
    11bd:	0000                	.insn	2, 0x0000
    11bf:	00f0                	.insn	2, 0x00f0
    11c1:	0000                	.insn	2, 0x0000
    11c3:	0001                	.insn	2, 0x0001
    11c5:	005e                	.insn	2, 0x005e
    11c7:	0000                	.insn	2, 0x0000
    11c9:	0000                	.insn	2, 0x0000
    11cb:	0000                	.insn	2, 0x0000
    11cd:	f000                	.insn	2, 0xf000
    11cf:	0000                	.insn	2, 0x0000
    11d1:	fc00                	.insn	2, 0xfc00
    11d3:	0000                	.insn	2, 0x0000
    11d5:	0100                	.insn	2, 0x0100
    11d7:	6000                	.insn	2, 0x6000
	...
    11e1:	0144                	.insn	2, 0x0144
    11e3:	0000                	.insn	2, 0x0000
    11e5:	0180                	.insn	2, 0x0180
    11e7:	0000                	.insn	2, 0x0000
    11e9:	0001                	.insn	2, 0x0001
    11eb:	805a                	.insn	2, 0x805a
    11ed:	0001                	.insn	2, 0x0001
    11ef:	d000                	.insn	2, 0xd000
    11f1:	0001                	.insn	2, 0x0001
    11f3:	0100                	.insn	2, 0x0100
    11f5:	5800                	.insn	2, 0x5800
    11f7:	01d0                	.insn	2, 0x01d0
    11f9:	0000                	.insn	2, 0x0000
    11fb:	01d8                	.insn	2, 0x01d8
    11fd:	0000                	.insn	2, 0x0000
    11ff:	0001                	.insn	2, 0x0001
    1201:	0001d86b          	.insn	4, 0x0001d86b
    1205:	f000                	.insn	2, 0xf000
    1207:	0001                	.insn	2, 0x0001
    1209:	0100                	.insn	2, 0x0100
    120b:	5800                	.insn	2, 0x5800
    120d:	01f0                	.insn	2, 0x01f0
    120f:	0000                	.insn	2, 0x0000
    1211:	01f4                	.insn	2, 0x01f4
    1213:	0000                	.insn	2, 0x0000
    1215:	0001                	.insn	2, 0x0001
    1217:	0001f46b          	.insn	4, 0x0001f46b
    121b:	0000                	.insn	2, 0x0000
    121d:	0002                	.insn	2, 0x0002
    121f:	0100                	.insn	2, 0x0100
    1221:	5800                	.insn	2, 0x5800
    1223:	0200                	.insn	2, 0x0200
    1225:	0000                	.insn	2, 0x0000
    1227:	0234                	.insn	2, 0x0234
    1229:	0000                	.insn	2, 0x0000
    122b:	0001                	.insn	2, 0x0001
    122d:	0002346b          	.insn	4, 0x0002346b
    1231:	3800                	.insn	2, 0x3800
    1233:	0002                	.insn	2, 0x0002
    1235:	0100                	.insn	2, 0x0100
    1237:	5800                	.insn	2, 0x5800
    1239:	0238                	.insn	2, 0x0238
    123b:	0000                	.insn	2, 0x0000
    123d:	030c                	.insn	2, 0x030c
    123f:	0000                	.insn	2, 0x0000
    1241:	0001                	.insn	2, 0x0001
    1243:	00030c6b          	.insn	4, 0x00030c6b
    1247:	1000                	.insn	2, 0x1000
    1249:	01000003          	lb	zero,16(zero) # 10 <$d.6+0x10>
    124d:	5800                	.insn	2, 0x5800
    124f:	0310                	.insn	2, 0x0310
    1251:	0000                	.insn	2, 0x0000
    1253:	0320                	.insn	2, 0x0320
    1255:	0000                	.insn	2, 0x0000
    1257:	0001                	.insn	2, 0x0001
    1259:	0003206b          	.insn	4, 0x0003206b
    125d:	2400                	.insn	2, 0x2400
    125f:	01000003          	lb	zero,16(zero) # 10 <$d.6+0x10>
    1263:	5800                	.insn	2, 0x5800
    1265:	0324                	.insn	2, 0x0324
    1267:	0000                	.insn	2, 0x0000
    1269:	03e0                	.insn	2, 0x03e0
    126b:	0000                	.insn	2, 0x0000
    126d:	0001                	.insn	2, 0x0001
    126f:	0000006b          	.insn	4, 0x006b
    1273:	0000                	.insn	2, 0x0000
    1275:	0000                	.insn	2, 0x0000
    1277:	1c00                	.insn	2, 0x1c00
    1279:	0002                	.insn	2, 0x0002
    127b:	3400                	.insn	2, 0x3400
    127d:	0002                	.insn	2, 0x0002
    127f:	0100                	.insn	2, 0x0100
    1281:	5800                	.insn	2, 0x5800
    1283:	035c                	.insn	2, 0x035c
    1285:	0000                	.insn	2, 0x0000
    1287:	036c                	.insn	2, 0x036c
    1289:	0000                	.insn	2, 0x0000
    128b:	0001                	.insn	2, 0x0001
    128d:	0058                	.insn	2, 0x0058
    128f:	0000                	.insn	2, 0x0000
    1291:	0000                	.insn	2, 0x0000
    1293:	0000                	.insn	2, 0x0000
    1295:	2000                	.insn	2, 0x2000
    1297:	0002                	.insn	2, 0x0002
    1299:	3400                	.insn	2, 0x3400
    129b:	0002                	.insn	2, 0x0002
    129d:	0100                	.insn	2, 0x0100
    129f:	5800                	.insn	2, 0x5800
    12a1:	036c                	.insn	2, 0x036c
    12a3:	0000                	.insn	2, 0x0000
    12a5:	0378                	.insn	2, 0x0378
    12a7:	0000                	.insn	2, 0x0000
    12a9:	0001                	.insn	2, 0x0001
    12ab:	7858                	.insn	2, 0x7858
    12ad:	8c000003          	lb	zero,-1856(zero) # fffff8c0 <__free_ram_end+0xffca98c0>
    12b1:	01000003          	lb	zero,16(zero) # 10 <$d.6+0x10>
    12b5:	5900                	.insn	2, 0x5900
    12b7:	038c                	.insn	2, 0x038c
    12b9:	0000                	.insn	2, 0x0000
    12bb:	03d4                	.insn	2, 0x03d4
    12bd:	0000                	.insn	2, 0x0000
    12bf:	0001                	.insn	2, 0x0001
    12c1:	0058                	.insn	2, 0x0058
    12c3:	0000                	.insn	2, 0x0000
    12c5:	0000                	.insn	2, 0x0000
    12c7:	0000                	.insn	2, 0x0000
    12c9:	2000                	.insn	2, 0x2000
    12cb:	0002                	.insn	2, 0x0002
    12cd:	3800                	.insn	2, 0x3800
    12cf:	0002                	.insn	2, 0x0002
    12d1:	0300                	.insn	2, 0x0300
    12d3:	1100                	.insn	2, 0x1100
    12d5:	9f00                	.insn	2, 0x9f00
    12d7:	036c                	.insn	2, 0x036c
    12d9:	0000                	.insn	2, 0x0000
    12db:	0370                	.insn	2, 0x0370
    12dd:	0000                	.insn	2, 0x0000
    12df:	00110003          	lb	zero,1(sp)
    12e3:	789f 0003 a400      	.insn	6, 0xa4000003789f
    12e9:	01000003          	lb	zero,16(zero) # 10 <$d.6+0x10>
    12ed:	6400                	.insn	2, 0x6400
    12ef:	03a4                	.insn	2, 0x03a4
    12f1:	0000                	.insn	2, 0x0000
    12f3:	03b4                	.insn	2, 0x03b4
    12f5:	0000                	.insn	2, 0x0000
    12f7:	0001                	.insn	2, 0x0001
    12f9:	005a                	.insn	2, 0x005a
    12fb:	0000                	.insn	2, 0x0000
    12fd:	0000                	.insn	2, 0x0000
    12ff:	0000                	.insn	2, 0x0000
    1301:	5000                	.insn	2, 0x5000
    1303:	0002                	.insn	2, 0x0002
    1305:	6400                	.insn	2, 0x6400
    1307:	0002                	.insn	2, 0x0002
    1309:	0300                	.insn	2, 0x0300
    130b:	1100                	.insn	2, 0x1100
    130d:	02649f07          	.insn	4, 0x02649f07
    1311:	0000                	.insn	2, 0x0000
    1313:	027c                	.insn	2, 0x027c
    1315:	0000                	.insn	2, 0x0000
    1317:	06110003          	lb	zero,97(sp)
    131b:	7c9f 0002 9400      	.insn	6, 0x940000027c9f
    1321:	0002                	.insn	2, 0x0002
    1323:	0300                	.insn	2, 0x0300
    1325:	1100                	.insn	2, 0x1100
    1327:	9f05                	.insn	2, 0x9f05
    1329:	0294                	.insn	2, 0x0294
    132b:	0000                	.insn	2, 0x0000
    132d:	02ac                	.insn	2, 0x02ac
    132f:	0000                	.insn	2, 0x0000
    1331:	04110003          	lb	zero,65(sp)
    1335:	ac9f 0002 c400      	.insn	6, 0xc4000002ac9f
    133b:	0002                	.insn	2, 0x0002
    133d:	0300                	.insn	2, 0x0300
    133f:	1100                	.insn	2, 0x1100
    1341:	02c49f03          	lh	t5,44(s1)
    1345:	0000                	.insn	2, 0x0000
    1347:	02dc                	.insn	2, 0x02dc
    1349:	0000                	.insn	2, 0x0000
    134b:	02110003          	lb	zero,33(sp)
    134f:	dc9f 0002 f400      	.insn	6, 0xf4000002dc9f
    1355:	0002                	.insn	2, 0x0002
    1357:	0300                	.insn	2, 0x0300
    1359:	1100                	.insn	2, 0x1100
    135b:	9f01                	.insn	2, 0x9f01
    135d:	02f4                	.insn	2, 0x02f4
    135f:	0000                	.insn	2, 0x0000
    1361:	0308                	.insn	2, 0x0308
    1363:	0000                	.insn	2, 0x0000
    1365:	00110003          	lb	zero,1(sp)
    1369:	089f 0003 1000      	.insn	6, 0x10000003089f
    136f:	03000003          	lb	zero,48(zero) # 30 <$d.6+0x30>
    1373:	1100                	.insn	2, 0x1100
    1375:	00009f7f 00000000 	.insn	12, 0x025000000000000000009f7f
    137d:	02500000 
    1381:	0000                	.insn	2, 0x0000
    1383:	02f8                	.insn	2, 0x02f8
    1385:	0000                	.insn	2, 0x0000
    1387:	0001                	.insn	2, 0x0001
    1389:	0058                	.insn	2, 0x0058
    138b:	0000                	.insn	2, 0x0000
    138d:	0000                	.insn	2, 0x0000
    138f:	0000                	.insn	2, 0x0000
    1391:	5400                	.insn	2, 0x5400
    1393:	0002                	.insn	2, 0x0002
    1395:	5800                	.insn	2, 0x5800
    1397:	0002                	.insn	2, 0x0002
    1399:	0100                	.insn	2, 0x0100
    139b:	5a00                	.insn	2, 0x5a00
    139d:	026c                	.insn	2, 0x026c
    139f:	0000                	.insn	2, 0x0000
    13a1:	0270                	.insn	2, 0x0270
    13a3:	0000                	.insn	2, 0x0000
    13a5:	0001                	.insn	2, 0x0001
    13a7:	845a                	.insn	2, 0x845a
    13a9:	0002                	.insn	2, 0x0002
    13ab:	8800                	.insn	2, 0x8800
    13ad:	0002                	.insn	2, 0x0002
    13af:	0100                	.insn	2, 0x0100
    13b1:	5a00                	.insn	2, 0x5a00
    13b3:	029c                	.insn	2, 0x029c
    13b5:	0000                	.insn	2, 0x0000
    13b7:	02a0                	.insn	2, 0x02a0
    13b9:	0000                	.insn	2, 0x0000
    13bb:	0001                	.insn	2, 0x0001
    13bd:	b45a                	.insn	2, 0xb45a
    13bf:	0002                	.insn	2, 0x0002
    13c1:	b800                	.insn	2, 0xb800
    13c3:	0002                	.insn	2, 0x0002
    13c5:	0100                	.insn	2, 0x0100
    13c7:	5a00                	.insn	2, 0x5a00
    13c9:	02cc                	.insn	2, 0x02cc
    13cb:	0000                	.insn	2, 0x0000
    13cd:	02d0                	.insn	2, 0x02d0
    13cf:	0000                	.insn	2, 0x0000
    13d1:	0001                	.insn	2, 0x0001
    13d3:	e45a                	.insn	2, 0xe45a
    13d5:	0002                	.insn	2, 0x0002
    13d7:	e800                	.insn	2, 0xe800
    13d9:	0002                	.insn	2, 0x0002
    13db:	0100                	.insn	2, 0x0100
    13dd:	5a00                	.insn	2, 0x5a00
    13df:	02f8                	.insn	2, 0x02f8
    13e1:	0000                	.insn	2, 0x0000
    13e3:	02fc                	.insn	2, 0x02fc
    13e5:	0000                	.insn	2, 0x0000
    13e7:	0001                	.insn	2, 0x0001
    13e9:	0058                	.insn	2, 0x0058
    13eb:	0000                	.insn	2, 0x0000
    13ed:	0000                	.insn	2, 0x0000
    13ef:	0000                	.insn	2, 0x0000
    13f1:	3400                	.insn	2, 0x3400
    13f3:	40000003          	lb	zero,1024(zero) # 400 <$d.5+0x30>
    13f7:	01000003          	lb	zero,16(zero) # 10 <$d.6+0x10>
    13fb:	5800                	.insn	2, 0x5800
    13fd:	0340                	.insn	2, 0x0340
    13ff:	0000                	.insn	2, 0x0000
    1401:	034c                	.insn	2, 0x034c
    1403:	0000                	.insn	2, 0x0000
    1405:	7f780003          	lb	zero,2039(a6)
    1409:	4c9f 0003 5400      	.insn	6, 0x540000034c9f
    140f:	01000003          	lb	zero,16(zero) # 10 <$d.6+0x10>
    1413:	5800                	.insn	2, 0x5800
	...
    141d:	041c                	.insn	2, 0x041c
    141f:	0000                	.insn	2, 0x0000
    1421:	042c                	.insn	2, 0x042c
    1423:	0000                	.insn	2, 0x0000
    1425:	0001                	.insn	2, 0x0001
    1427:	2c5a                	.insn	2, 0x2c5a
    1429:	0004                	.insn	2, 0x0004
    142b:	3000                	.insn	2, 0x3000
    142d:	0004                	.insn	2, 0x0004
    142f:	0300                	.insn	2, 0x0300
    1431:	7c00                	.insn	2, 0x7c00
    1433:	04309f7f 04540000 	.insn	12, 0x000300000454000004309f7f
    143b:	00030000 
    143f:	7e7c                	.insn	2, 0x7e7c
    1441:	589f 0004 6000      	.insn	6, 0x60000004589f
    1447:	0004                	.insn	2, 0x0004
    1449:	0100                	.insn	2, 0x0100
    144b:	5c00                	.insn	2, 0x5c00
    144d:	0460                	.insn	2, 0x0460
    144f:	0000                	.insn	2, 0x0000
    1451:	0464                	.insn	2, 0x0464
    1453:	0000                	.insn	2, 0x0000
    1455:	7e7c0003          	lb	zero,2023(s8)
    1459:	649f 0004 7000      	.insn	6, 0x70000004649f
    145f:	0004                	.insn	2, 0x0004
    1461:	0100                	.insn	2, 0x0100
    1463:	5c00                	.insn	2, 0x5c00
    1465:	0470                	.insn	2, 0x0470
    1467:	0000                	.insn	2, 0x0000
    1469:	0474                	.insn	2, 0x0474
    146b:	0000                	.insn	2, 0x0000
    146d:	7e7c0003          	lb	zero,2023(s8)
    1471:	909f 0004 a800      	.insn	6, 0xa8000004909f
    1477:	0004                	.insn	2, 0x0004
    1479:	0100                	.insn	2, 0x0100
    147b:	5c00                	.insn	2, 0x5c00
    147d:	04ac                	.insn	2, 0x04ac
    147f:	0000                	.insn	2, 0x0000
    1481:	04dc                	.insn	2, 0x04dc
    1483:	0000                	.insn	2, 0x0000
    1485:	0001                	.insn	2, 0x0001
    1487:	005c                	.insn	2, 0x005c
    1489:	0000                	.insn	2, 0x0000
    148b:	0000                	.insn	2, 0x0000
    148d:	0000                	.insn	2, 0x0000
    148f:	1c00                	.insn	2, 0x1c00
    1491:	0004                	.insn	2, 0x0004
    1493:	9000                	.insn	2, 0x9000
    1495:	0004                	.insn	2, 0x0004
    1497:	0200                	.insn	2, 0x0200
    1499:	3000                	.insn	2, 0x3000
    149b:	909f 0004 a000      	.insn	6, 0xa0000004909f
    14a1:	0004                	.insn	2, 0x0004
    14a3:	0100                	.insn	2, 0x0100
    14a5:	5d00                	.insn	2, 0x5d00
    14a7:	04a4                	.insn	2, 0x04a4
    14a9:	0000                	.insn	2, 0x0000
    14ab:	04e8                	.insn	2, 0x04e8
    14ad:	0000                	.insn	2, 0x0000
    14af:	0001                	.insn	2, 0x0001
    14b1:	005d                	.insn	2, 0x005d
    14b3:	0000                	.insn	2, 0x0000
    14b5:	0000                	.insn	2, 0x0000
    14b7:	0000                	.insn	2, 0x0000
    14b9:	9000                	.insn	2, 0x9000
    14bb:	0004                	.insn	2, 0x0004
    14bd:	9800                	.insn	2, 0x9800
    14bf:	0004                	.insn	2, 0x0004
    14c1:	0100                	.insn	2, 0x0100
    14c3:	5a00                	.insn	2, 0x5a00
    14c5:	04ac                	.insn	2, 0x04ac
    14c7:	0000                	.insn	2, 0x0000
    14c9:	04dc                	.insn	2, 0x04dc
    14cb:	0000                	.insn	2, 0x0000
    14cd:	0001                	.insn	2, 0x0001
    14cf:	005a                	.insn	2, 0x005a
    14d1:	0000                	.insn	2, 0x0000
    14d3:	0000                	.insn	2, 0x0000
    14d5:	0000                	.insn	2, 0x0000
    14d7:	9c00                	.insn	2, 0x9c00
    14d9:	0004                	.insn	2, 0x0004
    14db:	ac00                	.insn	2, 0xac00
    14dd:	0004                	.insn	2, 0x0004
    14df:	0100                	.insn	2, 0x0100
    14e1:	6100                	.insn	2, 0x6100
	...
    14eb:	04e8                	.insn	2, 0x04e8
    14ed:	0000                	.insn	2, 0x0000
    14ef:	0530                	.insn	2, 0x0530
    14f1:	0000                	.insn	2, 0x0000
    14f3:	0001                	.insn	2, 0x0001
    14f5:	305a                	.insn	2, 0x305a
    14f7:	0005                	.insn	2, 0x0005
    14f9:	2c00                	.insn	2, 0x2c00
    14fb:	01000007          	.insn	4, 0x01000007
    14ff:	6200                	.insn	2, 0x6200
	...
    1509:	04e8                	.insn	2, 0x04e8
    150b:	0000                	.insn	2, 0x0000
    150d:	052c                	.insn	2, 0x052c
    150f:	0000                	.insn	2, 0x0000
    1511:	0001                	.insn	2, 0x0001
    1513:	00052c5b          	.insn	4, 0x00052c5b
    1517:	2c00                	.insn	2, 0x2c00
    1519:	01000007          	.insn	4, 0x01000007
    151d:	5900                	.insn	2, 0x5900
	...
    1527:	04e8                	.insn	2, 0x04e8
    1529:	0000                	.insn	2, 0x0000
    152b:	0524                	.insn	2, 0x0524
    152d:	0000                	.insn	2, 0x0000
    152f:	0001                	.insn	2, 0x0001
    1531:	245c                	.insn	2, 0x245c
    1533:	0005                	.insn	2, 0x0005
    1535:	6800                	.insn	2, 0x6800
    1537:	02000007          	.insn	4, 0x02000007
    153b:	7200                	.insn	2, 0x7200
    153d:	0008                	.insn	2, 0x0008
    153f:	0000                	.insn	2, 0x0000
    1541:	0000                	.insn	2, 0x0000
    1543:	0000                	.insn	2, 0x0000
    1545:	2000                	.insn	2, 0x2000
    1547:	0005                	.insn	2, 0x0005
    1549:	3000                	.insn	2, 0x3000
    154b:	0005                	.insn	2, 0x0005
    154d:	0100                	.insn	2, 0x0100
    154f:	5a00                	.insn	2, 0x5a00
    1551:	0530                	.insn	2, 0x0530
    1553:	0000                	.insn	2, 0x0000
    1555:	072c                	.insn	2, 0x072c
    1557:	0000                	.insn	2, 0x0000
    1559:	0001                	.insn	2, 0x0001
    155b:	0062                	.insn	2, 0x0062
    155d:	0000                	.insn	2, 0x0000
    155f:	0000                	.insn	2, 0x0000
    1561:	0000                	.insn	2, 0x0000
    1563:	2400                	.insn	2, 0x2400
    1565:	0005                	.insn	2, 0x0005
    1567:	5400                	.insn	2, 0x5400
    1569:	0005                	.insn	2, 0x0005
    156b:	0200                	.insn	2, 0x0200
    156d:	3000                	.insn	2, 0x3000
    156f:	549f 0005 2c00      	.insn	6, 0x2c000005549f
    1575:	01000007          	.insn	4, 0x01000007
    1579:	6500                	.insn	2, 0x6500
	...
    1583:	0554                	.insn	2, 0x0554
    1585:	0000                	.insn	2, 0x0000
    1587:	0574                	.insn	2, 0x0574
    1589:	0000                	.insn	2, 0x0000
    158b:	0001                	.insn	2, 0x0001
    158d:	d06a                	.insn	2, 0xd06a
    158f:	0006                	.insn	2, 0x0006
    1591:	2400                	.insn	2, 0x2400
    1593:	01000007          	.insn	4, 0x01000007
    1597:	6a00                	.insn	2, 0x6a00
	...
    15a1:	057c                	.insn	2, 0x057c
    15a3:	0000                	.insn	2, 0x0000
    15a5:	0594                	.insn	2, 0x0594
    15a7:	0000                	.insn	2, 0x0000
    15a9:	07110003          	lb	zero,113(sp)
    15ad:	949f 0005 ac00      	.insn	6, 0xac000005949f
    15b3:	0005                	.insn	2, 0x0005
    15b5:	0300                	.insn	2, 0x0300
    15b7:	1100                	.insn	2, 0x1100
    15b9:	9f06                	.insn	2, 0x9f06
    15bb:	05ac                	.insn	2, 0x05ac
    15bd:	0000                	.insn	2, 0x0000
    15bf:	05c4                	.insn	2, 0x05c4
    15c1:	0000                	.insn	2, 0x0000
    15c3:	05110003          	lb	zero,81(sp)
    15c7:	c49f 0005 dc00      	.insn	6, 0xdc000005c49f
    15cd:	0005                	.insn	2, 0x0005
    15cf:	0300                	.insn	2, 0x0300
    15d1:	1100                	.insn	2, 0x1100
    15d3:	9f04                	.insn	2, 0x9f04
    15d5:	05dc                	.insn	2, 0x05dc
    15d7:	0000                	.insn	2, 0x0000
    15d9:	05f4                	.insn	2, 0x05f4
    15db:	0000                	.insn	2, 0x0000
    15dd:	03110003          	lb	zero,49(sp)
    15e1:	f49f 0005 0c00      	.insn	6, 0x0c000005f49f
    15e7:	0006                	.insn	2, 0x0006
    15e9:	0300                	.insn	2, 0x0300
    15eb:	1100                	.insn	2, 0x1100
    15ed:	9f02                	.insn	2, 0x9f02
    15ef:	060c                	.insn	2, 0x060c
    15f1:	0000                	.insn	2, 0x0000
    15f3:	0624                	.insn	2, 0x0624
    15f5:	0000                	.insn	2, 0x0000
    15f7:	01110003          	lb	zero,17(sp)
    15fb:	249f 0006 3800      	.insn	6, 0x38000006249f
    1601:	0006                	.insn	2, 0x0006
    1603:	0300                	.insn	2, 0x0300
    1605:	1100                	.insn	2, 0x1100
    1607:	9f00                	.insn	2, 0x9f00
    1609:	0638                	.insn	2, 0x0638
    160b:	0000                	.insn	2, 0x0000
    160d:	0650                	.insn	2, 0x0650
    160f:	0000                	.insn	2, 0x0000
    1611:	7f110003          	lb	zero,2033(sp)
    1615:	009f 0000 0000      	.insn	6, 0x009f
    161b:	0000                	.insn	2, 0x0000
    161d:	8000                	.insn	2, 0x8000
    161f:	0005                	.insn	2, 0x0005
    1621:	8400                	.insn	2, 0x8400
    1623:	0005                	.insn	2, 0x0005
    1625:	0100                	.insn	2, 0x0100
    1627:	5a00                	.insn	2, 0x5a00
    1629:	059c                	.insn	2, 0x059c
    162b:	0000                	.insn	2, 0x0000
    162d:	05a0                	.insn	2, 0x05a0
    162f:	0000                	.insn	2, 0x0000
    1631:	0001                	.insn	2, 0x0001
    1633:	b45a                	.insn	2, 0xb45a
    1635:	0005                	.insn	2, 0x0005
    1637:	b800                	.insn	2, 0xb800
    1639:	0005                	.insn	2, 0x0005
    163b:	0100                	.insn	2, 0x0100
    163d:	5a00                	.insn	2, 0x5a00
    163f:	05cc                	.insn	2, 0x05cc
    1641:	0000                	.insn	2, 0x0000
    1643:	05d0                	.insn	2, 0x05d0
    1645:	0000                	.insn	2, 0x0000
    1647:	0001                	.insn	2, 0x0001
    1649:	e45a                	.insn	2, 0xe45a
    164b:	0005                	.insn	2, 0x0005
    164d:	e800                	.insn	2, 0xe800
    164f:	0005                	.insn	2, 0x0005
    1651:	0100                	.insn	2, 0x0100
    1653:	5a00                	.insn	2, 0x5a00
    1655:	05fc                	.insn	2, 0x05fc
    1657:	0000                	.insn	2, 0x0000
    1659:	0600                	.insn	2, 0x0600
    165b:	0000                	.insn	2, 0x0000
    165d:	0001                	.insn	2, 0x0001
    165f:	145a                	.insn	2, 0x145a
    1661:	0006                	.insn	2, 0x0006
    1663:	1800                	.insn	2, 0x1800
    1665:	0006                	.insn	2, 0x0006
    1667:	0100                	.insn	2, 0x0100
    1669:	5a00                	.insn	2, 0x5a00
    166b:	0628                	.insn	2, 0x0628
    166d:	0000                	.insn	2, 0x0000
    166f:	062c                	.insn	2, 0x062c
    1671:	0000                	.insn	2, 0x0000
    1673:	0001                	.insn	2, 0x0001
    1675:	005a                	.insn	2, 0x005a
    1677:	0000                	.insn	2, 0x0000
    1679:	0000                	.insn	2, 0x0000
    167b:	0000                	.insn	2, 0x0000
    167d:	e800                	.insn	2, 0xe800
    167f:	0006                	.insn	2, 0x0006
    1681:	0000                	.insn	2, 0x0000
    1683:	02000007          	.insn	4, 0x02000007
    1687:	3000                	.insn	2, 0x3000
    1689:	009f 0007 0c00      	.insn	6, 0x0c000007009f
    168f:	09000007          	.insn	4, 0x09000007
    1693:	8b00                	.insn	2, 0x8b00
    1695:	8500                	.insn	2, 0x8500
    1697:	8200                	.insn	2, 0x8200
    1699:	2200                	.insn	2, 0x2200
    169b:	9f1c                	.insn	2, 0x9f1c
    169d:	070c                	.insn	2, 0x070c
    169f:	0000                	.insn	2, 0x0000
    16a1:	0710                	.insn	2, 0x0710
    16a3:	0000                	.insn	2, 0x0000
    16a5:	000c                	.insn	2, 0x000c
    16a7:	0085008b          	.insn	4, 0x0085008b
    16ab:	0082                	.insn	2, 0x0082
    16ad:	1c22                	.insn	2, 0x1c22
    16af:	0111                	.insn	2, 0x0111
    16b1:	9f22                	.insn	2, 0x9f22
    16b3:	0714                	.insn	2, 0x0714
    16b5:	0000                	.insn	2, 0x0000
    16b7:	0724                	.insn	2, 0x0724
    16b9:	0000                	.insn	2, 0x0000
    16bb:	0009                	.insn	2, 0x0009
    16bd:	0085008b          	.insn	4, 0x0085008b
    16c1:	0082                	.insn	2, 0x0082
    16c3:	1c22                	.insn	2, 0x1c22
    16c5:	009f 0000 0000      	.insn	6, 0x009f
    16cb:	0000                	.insn	2, 0x0000
    16cd:	1800                	.insn	2, 0x1800
    16cf:	24000007          	.insn	4, 0x24000007
    16d3:	01000007          	.insn	4, 0x01000007
    16d7:	5a00                	.insn	2, 0x5a00
	...
    16e1:	0768                	.insn	2, 0x0768
    16e3:	0000                	.insn	2, 0x0000
    16e5:	07fc                	.insn	2, 0x07fc
    16e7:	0000                	.insn	2, 0x0000
    16e9:	0001                	.insn	2, 0x0001
    16eb:	4c5a                	.insn	2, 0x4c5a
    16ed:	0008                	.insn	2, 0x0008
    16ef:	5c00                	.insn	2, 0x5c00
    16f1:	0008                	.insn	2, 0x0008
    16f3:	0100                	.insn	2, 0x0100
    16f5:	5a00                	.insn	2, 0x5a00
    16f7:	088c                	.insn	2, 0x088c
    16f9:	0000                	.insn	2, 0x0000
    16fb:	08fc                	.insn	2, 0x08fc
    16fd:	0000                	.insn	2, 0x0000
    16ff:	0001                	.insn	2, 0x0001
    1701:	005a                	.insn	2, 0x005a
    1703:	0000                	.insn	2, 0x0000
    1705:	0000                	.insn	2, 0x0000
    1707:	0000                	.insn	2, 0x0000
    1709:	6800                	.insn	2, 0x6800
    170b:	f4000007          	.insn	4, 0xf4000007
    170f:	01000007          	.insn	4, 0x01000007
    1713:	5b00                	.insn	2, 0x5b00
    1715:	084c                	.insn	2, 0x084c
    1717:	0000                	.insn	2, 0x0000
    1719:	0864                	.insn	2, 0x0864
    171b:	0000                	.insn	2, 0x0000
    171d:	0001                	.insn	2, 0x0001
    171f:	00088c5b          	.insn	4, 0x00088c5b
    1723:	fc00                	.insn	2, 0xfc00
    1725:	0008                	.insn	2, 0x0008
    1727:	0100                	.insn	2, 0x0100
    1729:	5b00                	.insn	2, 0x5b00
	...
    1733:	0774                	.insn	2, 0x0774
    1735:	0000                	.insn	2, 0x0000
    1737:	07e0                	.insn	2, 0x07e0
    1739:	0000                	.insn	2, 0x0000
    173b:	0002                	.insn	2, 0x0002
    173d:	9f30                	.insn	2, 0x9f30
    173f:	07e0                	.insn	2, 0x07e0
    1741:	0000                	.insn	2, 0x0000
    1743:	084c                	.insn	2, 0x084c
    1745:	0000                	.insn	2, 0x0000
    1747:	0001                	.insn	2, 0x0001
    1749:	4c58                	.insn	2, 0x4c58
    174b:	0008                	.insn	2, 0x0008
    174d:	6400                	.insn	2, 0x6400
    174f:	0008                	.insn	2, 0x0008
    1751:	0200                	.insn	2, 0x0200
    1753:	3000                	.insn	2, 0x3000
    1755:	649f 0008 7800      	.insn	6, 0x78000008649f
    175b:	0008                	.insn	2, 0x0008
    175d:	0100                	.insn	2, 0x0100
    175f:	5800                	.insn	2, 0x5800
    1761:	088c                	.insn	2, 0x088c
    1763:	0000                	.insn	2, 0x0000
    1765:	08fc                	.insn	2, 0x08fc
    1767:	0000                	.insn	2, 0x0000
    1769:	0002                	.insn	2, 0x0002
    176b:	9f30                	.insn	2, 0x9f30
    176d:	08fc                	.insn	2, 0x08fc
    176f:	0000                	.insn	2, 0x0000
    1771:	09ac                	.insn	2, 0x09ac
    1773:	0000                	.insn	2, 0x0000
    1775:	0001                	.insn	2, 0x0001
    1777:	0058                	.insn	2, 0x0058
    1779:	0000                	.insn	2, 0x0000
    177b:	0000                	.insn	2, 0x0000
    177d:	0000                	.insn	2, 0x0000
    177f:	7400                	.insn	2, 0x7400
    1781:	68000007          	.insn	4, 0x68000007
    1785:	0009                	.insn	2, 0x0009
    1787:	0400                	.insn	2, 0x0400
    1789:	1000                	.insn	2, 0x1000
    178b:	0280                	.insn	2, 0x0280
    178d:	689f 0009 9400      	.insn	6, 0x94000009689f
    1793:	0009                	.insn	2, 0x0009
    1795:	0100                	.insn	2, 0x0100
    1797:	5d00                	.insn	2, 0x5d00
    1799:	0994                	.insn	2, 0x0994
    179b:	0000                	.insn	2, 0x0000
    179d:	0998                	.insn	2, 0x0998
    179f:	0000                	.insn	2, 0x0000
    17a1:	0004                	.insn	2, 0x0004
    17a3:	8010                	.insn	2, 0x8010
    17a5:	9f20                	.insn	2, 0x9f20
    17a7:	0998                	.insn	2, 0x0998
    17a9:	0000                	.insn	2, 0x0000
    17ab:	09a4                	.insn	2, 0x09a4
    17ad:	0000                	.insn	2, 0x0000
    17af:	0001                	.insn	2, 0x0001
    17b1:	005c                	.insn	2, 0x005c
    17b3:	0000                	.insn	2, 0x0000
    17b5:	0000                	.insn	2, 0x0000
    17b7:	0000                	.insn	2, 0x0000
    17b9:	a000                	.insn	2, 0xa000
    17bb:	a8000007          	.insn	4, 0xa8000007
    17bf:	03000007          	.insn	4, 0x03000007
    17c3:	7d00                	.insn	2, 0x7d00
    17c5:	07a89f7f 07cc0000 	.insn	12, 0x0003000007cc000007a89f7f
    17cd:	00030000 
    17d1:	7e7d                	.insn	2, 0x7e7d
    17d3:	d09f 0007 dc00      	.insn	6, 0xdc000007d09f
    17d9:	01000007          	.insn	4, 0x01000007
    17dd:	5d00                	.insn	2, 0x5d00
    17df:	084c                	.insn	2, 0x084c
    17e1:	0000                	.insn	2, 0x0000
    17e3:	0850                	.insn	2, 0x0850
    17e5:	0000                	.insn	2, 0x0000
    17e7:	7e7d0003          	lb	zero,2023(s10)
    17eb:	509f 0008 5800      	.insn	6, 0x58000008509f
    17f1:	0008                	.insn	2, 0x0008
    17f3:	0100                	.insn	2, 0x0100
    17f5:	5d00                	.insn	2, 0x5d00
    17f7:	08ac                	.insn	2, 0x08ac
    17f9:	0000                	.insn	2, 0x0000
    17fb:	08c4                	.insn	2, 0x08c4
    17fd:	0000                	.insn	2, 0x0000
    17ff:	0001                	.insn	2, 0x0001
    1801:	c85d                	.insn	2, 0xc85d
    1803:	0008                	.insn	2, 0x0008
    1805:	fc00                	.insn	2, 0xfc00
    1807:	0008                	.insn	2, 0x0008
    1809:	0100                	.insn	2, 0x0100
    180b:	5d00                	.insn	2, 0x5d00
	...
    1815:	0810                	.insn	2, 0x0810
    1817:	0000                	.insn	2, 0x0000
    1819:	0818                	.insn	2, 0x0818
    181b:	0000                	.insn	2, 0x0000
    181d:	7f7b0003          	lb	zero,2039(s6)
    1821:	189f 0008 3c00      	.insn	6, 0x3c000008189f
    1827:	0008                	.insn	2, 0x0008
    1829:	0300                	.insn	2, 0x0300
    182b:	7b00                	.insn	2, 0x7b00
    182d:	9f7e                	.insn	2, 0x9f7e
    182f:	0840                	.insn	2, 0x0840
    1831:	0000                	.insn	2, 0x0000
    1833:	084c                	.insn	2, 0x084c
    1835:	0000                	.insn	2, 0x0000
    1837:	0001                	.insn	2, 0x0001
    1839:	0008645b          	.insn	4, 0x0008645b
    183d:	6800                	.insn	2, 0x6800
    183f:	0008                	.insn	2, 0x0008
    1841:	0300                	.insn	2, 0x0300
    1843:	7b00                	.insn	2, 0x7b00
    1845:	9f7e                	.insn	2, 0x9f7e
    1847:	0868                	.insn	2, 0x0868
    1849:	0000                	.insn	2, 0x0000
    184b:	0870                	.insn	2, 0x0870
    184d:	0000                	.insn	2, 0x0000
    184f:	0001                	.insn	2, 0x0001
    1851:	00091c5b          	.insn	4, 0x00091c5b
    1855:	3400                	.insn	2, 0x3400
    1857:	0009                	.insn	2, 0x0009
    1859:	0100                	.insn	2, 0x0100
    185b:	5b00                	.insn	2, 0x5b00
    185d:	0938                	.insn	2, 0x0938
    185f:	0000                	.insn	2, 0x0000
    1861:	0968                	.insn	2, 0x0968
    1863:	0000                	.insn	2, 0x0000
    1865:	0001                	.insn	2, 0x0001
    1867:	0000005b          	.insn	4, 0x005b
    186b:	0000                	.insn	2, 0x0000
    186d:	0000                	.insn	2, 0x0000
    186f:	5800                	.insn	2, 0x5800
    1871:	0008                	.insn	2, 0x0008
    1873:	6400                	.insn	2, 0x6400
    1875:	0008                	.insn	2, 0x0008
    1877:	0200                	.insn	2, 0x0200
    1879:	3000                	.insn	2, 0x3000
    187b:	009f 0000 0000      	.insn	6, 0x009f
    1881:	0000                	.insn	2, 0x0000
    1883:	7000                	.insn	2, 0x7000
    1885:	0008                	.insn	2, 0x0008
    1887:	7800                	.insn	2, 0x7800
    1889:	0008                	.insn	2, 0x0008
    188b:	0200                	.insn	2, 0x0200
    188d:	3000                	.insn	2, 0x3000
    188f:	009f 0000 0000      	.insn	6, 0x009f
    1895:	0000                	.insn	2, 0x0000
    1897:	ac00                	.insn	2, 0xac00
    1899:	0008                	.insn	2, 0x0008
    189b:	b400                	.insn	2, 0xb400
    189d:	0008                	.insn	2, 0x0008
    189f:	0100                	.insn	2, 0x0100
    18a1:	5c00                	.insn	2, 0x5c00
    18a3:	08c8                	.insn	2, 0x08c8
    18a5:	0000                	.insn	2, 0x0000
    18a7:	08fc                	.insn	2, 0x08fc
    18a9:	0000                	.insn	2, 0x0000
    18ab:	0001                	.insn	2, 0x0001
    18ad:	005c                	.insn	2, 0x005c
    18af:	0000                	.insn	2, 0x0000
    18b1:	0000                	.insn	2, 0x0000
    18b3:	0000                	.insn	2, 0x0000
    18b5:	ac00                	.insn	2, 0xac00
    18b7:	0008                	.insn	2, 0x0008
    18b9:	bc00                	.insn	2, 0xbc00
    18bb:	0008                	.insn	2, 0x0008
    18bd:	0100                	.insn	2, 0x0100
    18bf:	5800                	.insn	2, 0x5800
    18c1:	08c0                	.insn	2, 0x08c0
    18c3:	0000                	.insn	2, 0x0000
    18c5:	08fc                	.insn	2, 0x08fc
    18c7:	0000                	.insn	2, 0x0000
    18c9:	0001                	.insn	2, 0x0001
    18cb:	0058                	.insn	2, 0x0058
    18cd:	0000                	.insn	2, 0x0000
    18cf:	0000                	.insn	2, 0x0000
    18d1:	0000                	.insn	2, 0x0000
    18d3:	b800                	.insn	2, 0xb800
    18d5:	0008                	.insn	2, 0x0008
    18d7:	c800                	.insn	2, 0xc800
    18d9:	0008                	.insn	2, 0x0008
    18db:	0100                	.insn	2, 0x0100
    18dd:	6100                	.insn	2, 0x6100
	...
    18e7:	091c                	.insn	2, 0x091c
    18e9:	0000                	.insn	2, 0x0000
    18eb:	0924                	.insn	2, 0x0924
    18ed:	0000                	.insn	2, 0x0000
    18ef:	0001                	.insn	2, 0x0001
    18f1:	385a                	.insn	2, 0x385a
    18f3:	0009                	.insn	2, 0x0009
    18f5:	6800                	.insn	2, 0x6800
    18f7:	0009                	.insn	2, 0x0009
    18f9:	0100                	.insn	2, 0x0100
    18fb:	5a00                	.insn	2, 0x5a00
	...
    1905:	091c                	.insn	2, 0x091c
    1907:	0000                	.insn	2, 0x0000
    1909:	092c                	.insn	2, 0x092c
    190b:	0000                	.insn	2, 0x0000
    190d:	0001                	.insn	2, 0x0001
    190f:	305d                	.insn	2, 0x305d
    1911:	0009                	.insn	2, 0x0009
    1913:	6800                	.insn	2, 0x6800
    1915:	0009                	.insn	2, 0x0009
    1917:	0100                	.insn	2, 0x0100
    1919:	5d00                	.insn	2, 0x5d00
	...
    1923:	0928                	.insn	2, 0x0928
    1925:	0000                	.insn	2, 0x0000
    1927:	0938                	.insn	2, 0x0938
    1929:	0000                	.insn	2, 0x0000
    192b:	0001                	.insn	2, 0x0001
    192d:	0061                	.insn	2, 0x0061
    192f:	0000                	.insn	2, 0x0000
    1931:	0000                	.insn	2, 0x0000
    1933:	0000                	.insn	2, 0x0000
	...

00001936 <$d.4>:
    1936:	0000                	.insn	2, 0x0000
    1938:	0000                	.insn	2, 0x0000
    193a:	0044                	.insn	2, 0x0044
    193c:	0000                	.insn	2, 0x0000
    193e:	0001                	.insn	2, 0x0001
    1940:	445a                	.insn	2, 0x445a
    1942:	0000                	.insn	2, 0x0000
    1944:	d000                	.insn	2, 0xd000
    1946:	0002                	.insn	2, 0x0002
    1948:	0200                	.insn	2, 0x0200
    194a:	7200                	.insn	2, 0x7200
    194c:	0004                	.insn	2, 0x0004
	...
    1956:	0000                	.insn	2, 0x0000
    1958:	4000                	.insn	2, 0x4000
    195a:	0000                	.insn	2, 0x0000
    195c:	0100                	.insn	2, 0x0100
    195e:	5b00                	.insn	2, 0x5b00
    1960:	0040                	.insn	2, 0x0040
    1962:	0000                	.insn	2, 0x0000
    1964:	02a4                	.insn	2, 0x02a4
    1966:	0000                	.insn	2, 0x0000
    1968:	0001                	.insn	2, 0x0001
    196a:	0062                	.insn	2, 0x0062
	...
    1974:	0000                	.insn	2, 0x0000
    1976:	7c00                	.insn	2, 0x7c00
    1978:	0000                	.insn	2, 0x0000
    197a:	0100                	.insn	2, 0x0100
    197c:	5c00                	.insn	2, 0x5c00
    197e:	007c                	.insn	2, 0x007c
    1980:	0000                	.insn	2, 0x0000
    1982:	0294                	.insn	2, 0x0294
    1984:	0000                	.insn	2, 0x0000
    1986:	0001                	.insn	2, 0x0001
    1988:	0059                	.insn	2, 0x0059
	...
    1992:	0000                	.insn	2, 0x0000
    1994:	3c00                	.insn	2, 0x3c00
    1996:	0000                	.insn	2, 0x0000
    1998:	0100                	.insn	2, 0x0100
    199a:	5d00                	.insn	2, 0x5d00
    199c:	003c                	.insn	2, 0x003c
    199e:	0000                	.insn	2, 0x0000
    19a0:	02d0                	.insn	2, 0x02d0
    19a2:	0000                	.insn	2, 0x0000
    19a4:	0002                	.insn	2, 0x0002
    19a6:	0872                	.insn	2, 0x0872
	...
    19b0:	0074                	.insn	2, 0x0074
    19b2:	0000                	.insn	2, 0x0000
    19b4:	0090                	.insn	2, 0x0090
    19b6:	0000                	.insn	2, 0x0000
    19b8:	00110003          	lb	zero,1(sp)
    19bc:	909f 0000 9400      	.insn	6, 0x94000000909f
    19c2:	0000                	.insn	2, 0x0000
    19c4:	0100                	.insn	2, 0x0100
    19c6:	5a00                	.insn	2, 0x5a00
    19c8:	0094                	.insn	2, 0x0094
    19ca:	0000                	.insn	2, 0x0000
    19cc:	028c                	.insn	2, 0x028c
    19ce:	0000                	.insn	2, 0x0000
    19d0:	0002                	.insn	2, 0x0002
    19d2:	0c72                	.insn	2, 0x0c72
    19d4:	028c                	.insn	2, 0x028c
    19d6:	0000                	.insn	2, 0x0000
    19d8:	0294                	.insn	2, 0x0294
    19da:	0000                	.insn	2, 0x0000
    19dc:	0001                	.insn	2, 0x0001
    19de:	005a                	.insn	2, 0x005a
    19e0:	0000                	.insn	2, 0x0000
    19e2:	0000                	.insn	2, 0x0000
    19e4:	0000                	.insn	2, 0x0000
    19e6:	1000                	.insn	2, 0x1000
    19e8:	0001                	.insn	2, 0x0001
    19ea:	2400                	.insn	2, 0x2400
    19ec:	0001                	.insn	2, 0x0001
    19ee:	0100                	.insn	2, 0x0100
    19f0:	5e00                	.insn	2, 0x5e00
    19f2:	0124                	.insn	2, 0x0124
    19f4:	0000                	.insn	2, 0x0000
    19f6:	0278                	.insn	2, 0x0278
    19f8:	0000                	.insn	2, 0x0000
    19fa:	0002                	.insn	2, 0x0002
    19fc:	2072                	.insn	2, 0x2072
    19fe:	0278                	.insn	2, 0x0278
    1a00:	0000                	.insn	2, 0x0000
    1a02:	0284                	.insn	2, 0x0284
    1a04:	0000                	.insn	2, 0x0000
    1a06:	0001                	.insn	2, 0x0001
    1a08:	005e                	.insn	2, 0x005e
    1a0a:	0000                	.insn	2, 0x0000
    1a0c:	0000                	.insn	2, 0x0000
    1a0e:	0000                	.insn	2, 0x0000
    1a10:	3000                	.insn	2, 0x3000
    1a12:	0001                	.insn	2, 0x0001
    1a14:	3800                	.insn	2, 0x3800
    1a16:	0001                	.insn	2, 0x0001
    1a18:	0300                	.insn	2, 0x0300
    1a1a:	1100                	.insn	2, 0x1100
    1a1c:	9f00                	.insn	2, 0x9f00
    1a1e:	0138                	.insn	2, 0x0138
    1a20:	0000                	.insn	2, 0x0000
    1a22:	0144                	.insn	2, 0x0144
    1a24:	0000                	.insn	2, 0x0000
    1a26:	01110003          	lb	zero,17(sp)
    1a2a:	449f 0001 5000      	.insn	6, 0x50000001449f
    1a30:	0001                	.insn	2, 0x0001
    1a32:	0300                	.insn	2, 0x0300
    1a34:	1100                	.insn	2, 0x1100
    1a36:	9f00                	.insn	2, 0x9f00
    1a38:	0150                	.insn	2, 0x0150
    1a3a:	0000                	.insn	2, 0x0000
    1a3c:	015c                	.insn	2, 0x015c
    1a3e:	0000                	.insn	2, 0x0000
    1a40:	01110003          	lb	zero,17(sp)
    1a44:	5c9f 0001 e400      	.insn	6, 0xe40000015c9f
    1a4a:	0001                	.insn	2, 0x0001
    1a4c:	0300                	.insn	2, 0x0300
    1a4e:	1100                	.insn	2, 0x1100
    1a50:	9f02                	.insn	2, 0x9f02
	...
    1a5a:	0130                	.insn	2, 0x0130
    1a5c:	0000                	.insn	2, 0x0000
    1a5e:	0144                	.insn	2, 0x0144
    1a60:	0000                	.insn	2, 0x0000
    1a62:	00110003          	lb	zero,1(sp)
    1a66:	449f 0001 5c00      	.insn	6, 0x5c000001449f
    1a6c:	0001                	.insn	2, 0x0001
    1a6e:	0300                	.insn	2, 0x0300
    1a70:	1100                	.insn	2, 0x1100
    1a72:	9f01                	.insn	2, 0x9f01
    1a74:	015c                	.insn	2, 0x015c
    1a76:	0000                	.insn	2, 0x0000
    1a78:	01e4                	.insn	2, 0x01e4
    1a7a:	0000                	.insn	2, 0x0000
    1a7c:	02110003          	lb	zero,33(sp)
    1a80:	009f 0000 0000      	.insn	6, 0x009f
    1a86:	0000                	.insn	2, 0x0000
    1a88:	7000                	.insn	2, 0x7000
    1a8a:	0001                	.insn	2, 0x0001
    1a8c:	7800                	.insn	2, 0x7800
    1a8e:	0001                	.insn	2, 0x0001
    1a90:	0300                	.insn	2, 0x0300
    1a92:	1100                	.insn	2, 0x1100
    1a94:	9f00                	.insn	2, 0x9f00
    1a96:	0178                	.insn	2, 0x0178
    1a98:	0000                	.insn	2, 0x0000
    1a9a:	017c                	.insn	2, 0x017c
    1a9c:	0000                	.insn	2, 0x0000
    1a9e:	01110003          	lb	zero,17(sp)
    1aa2:	7c9f 0001 8c00      	.insn	6, 0x8c0000017c9f
    1aa8:	0001                	.insn	2, 0x0001
    1aaa:	0300                	.insn	2, 0x0300
    1aac:	1100                	.insn	2, 0x1100
    1aae:	9f02                	.insn	2, 0x9f02
    1ab0:	018c                	.insn	2, 0x018c
    1ab2:	0000                	.insn	2, 0x0000
    1ab4:	01a8                	.insn	2, 0x01a8
    1ab6:	0000                	.insn	2, 0x0000
    1ab8:	00110003          	lb	zero,1(sp)
    1abc:	a89f 0001 e400      	.insn	6, 0xe4000001a89f
    1ac2:	0001                	.insn	2, 0x0001
    1ac4:	0300                	.insn	2, 0x0300
    1ac6:	1100                	.insn	2, 0x1100
    1ac8:	9f02                	.insn	2, 0x9f02
	...
    1ad2:	0170                	.insn	2, 0x0170
    1ad4:	0000                	.insn	2, 0x0000
    1ad6:	017c                	.insn	2, 0x017c
    1ad8:	0000                	.insn	2, 0x0000
    1ada:	00110003          	lb	zero,1(sp)
    1ade:	7c9f 0001 a800      	.insn	6, 0xa80000017c9f
    1ae4:	0001                	.insn	2, 0x0001
    1ae6:	0300                	.insn	2, 0x0300
    1ae8:	1100                	.insn	2, 0x1100
    1aea:	9f01                	.insn	2, 0x9f01
    1aec:	01a8                	.insn	2, 0x01a8
    1aee:	0000                	.insn	2, 0x0000
    1af0:	01e4                	.insn	2, 0x01e4
    1af2:	0000                	.insn	2, 0x0000
    1af4:	02110003          	lb	zero,33(sp)
    1af8:	009f 0000 0000      	.insn	6, 0x009f
    1afe:	0000                	.insn	2, 0x0000
    1b00:	a000                	.insn	2, 0xa000
    1b02:	0001                	.insn	2, 0x0001
    1b04:	c000                	.insn	2, 0xc000
    1b06:	0001                	.insn	2, 0x0001
    1b08:	0100                	.insn	2, 0x0100
    1b0a:	5c00                	.insn	2, 0x5c00
	...
    1b14:	01ac                	.insn	2, 0x01ac
    1b16:	0000                	.insn	2, 0x0000
    1b18:	01b0                	.insn	2, 0x01b0
    1b1a:	0000                	.insn	2, 0x0000
    1b1c:	0001                	.insn	2, 0x0001
    1b1e:	0065                	.insn	2, 0x0065
    1b20:	0000                	.insn	2, 0x0000
    1b22:	0000                	.insn	2, 0x0000
    1b24:	0000                	.insn	2, 0x0000
    1b26:	a800                	.insn	2, 0xa800
    1b28:	0001                	.insn	2, 0x0001
    1b2a:	ac00                	.insn	2, 0xac00
    1b2c:	0001                	.insn	2, 0x0001
    1b2e:	0300                	.insn	2, 0x0300
    1b30:	1100                	.insn	2, 0x1100
    1b32:	9f00                	.insn	2, 0x9f00
    1b34:	01ac                	.insn	2, 0x01ac
    1b36:	0000                	.insn	2, 0x0000
    1b38:	01b8                	.insn	2, 0x01b8
    1b3a:	0000                	.insn	2, 0x0000
    1b3c:	01110003          	lb	zero,17(sp)
    1b40:	b89f 0001 e400      	.insn	6, 0xe4000001b89f
    1b46:	0001                	.insn	2, 0x0001
    1b48:	0300                	.insn	2, 0x0300
    1b4a:	1100                	.insn	2, 0x1100
    1b4c:	9f02                	.insn	2, 0x9f02
	...
    1b56:	01a8                	.insn	2, 0x01a8
    1b58:	0000                	.insn	2, 0x0000
    1b5a:	01e4                	.insn	2, 0x01e4
    1b5c:	0000                	.insn	2, 0x0000
    1b5e:	000e                	.insn	2, 0x000e
    1b60:	8010                	.insn	2, 0x8010
    1b62:	0880                	.insn	2, 0x0880
    1b64:	939f 1004 8084      	.insn	6, 0x80841004939f
    1b6a:	9f08                	.insn	2, 0x9f08
    1b6c:	00000493          	li	s1,0
    1b70:	0000                	.insn	2, 0x0000
    1b72:	0000                	.insn	2, 0x0000
    1b74:	0000                	.insn	2, 0x0000
    1b76:	01b8                	.insn	2, 0x01b8
    1b78:	0000                	.insn	2, 0x0000
    1b7a:	01bc                	.insn	2, 0x01bc
    1b7c:	0000                	.insn	2, 0x0000
    1b7e:	0001                	.insn	2, 0x0001
    1b80:	0001c463          	bltz	gp,1b88 <$d.12+0x7b>
    1b84:	c800                	.insn	2, 0xc800
    1b86:	0001                	.insn	2, 0x0001
    1b88:	0100                	.insn	2, 0x0100
    1b8a:	5a00                	.insn	2, 0x5a00
	...
    1b94:	01b8                	.insn	2, 0x01b8
    1b96:	0000                	.insn	2, 0x0000
    1b98:	01c4                	.insn	2, 0x01c4
    1b9a:	0000                	.insn	2, 0x0000
    1b9c:	00110003          	lb	zero,1(sp)
    1ba0:	c49f 0001 d000      	.insn	6, 0xd0000001c49f
    1ba6:	0001                	.insn	2, 0x0001
    1ba8:	0300                	.insn	2, 0x0300
    1baa:	1100                	.insn	2, 0x1100
    1bac:	9f01                	.insn	2, 0x9f01
    1bae:	01d0                	.insn	2, 0x01d0
    1bb0:	0000                	.insn	2, 0x0000
    1bb2:	01e4                	.insn	2, 0x01e4
    1bb4:	0000                	.insn	2, 0x0000
    1bb6:	02110003          	lb	zero,33(sp)
    1bba:	009f 0000 0000      	.insn	6, 0x009f
    1bc0:	0000                	.insn	2, 0x0000
    1bc2:	b800                	.insn	2, 0xb800
    1bc4:	0001                	.insn	2, 0x0001
    1bc6:	e400                	.insn	2, 0xe400
    1bc8:	0001                	.insn	2, 0x0001
    1bca:	0e00                	.insn	2, 0x0e00
    1bcc:	1000                	.insn	2, 0x1000
    1bce:	80a0                	.insn	2, 0x80a0
    1bd0:	9f08                	.insn	2, 0x9f08
    1bd2:	a4100493          	li	s1,-1471
    1bd6:	0880                	.insn	2, 0x0880
    1bd8:	939f 0004 0000      	.insn	6, 0x0004939f
    1bde:	0000                	.insn	2, 0x0000
    1be0:	0000                	.insn	2, 0x0000
    1be2:	c000                	.insn	2, 0xc000
    1be4:	0001                	.insn	2, 0x0001
    1be6:	cc00                	.insn	2, 0xcc00
    1be8:	0001                	.insn	2, 0x0001
    1bea:	0100                	.insn	2, 0x0100
    1bec:	5c00                	.insn	2, 0x5c00
    1bee:	01cc                	.insn	2, 0x01cc
    1bf0:	0000                	.insn	2, 0x0000
    1bf2:	01d4                	.insn	2, 0x01d4
    1bf4:	0000                	.insn	2, 0x0000
    1bf6:	0001                	.insn	2, 0x0001
    1bf8:	005a                	.insn	2, 0x005a
    1bfa:	0000                	.insn	2, 0x0000
    1bfc:	0000                	.insn	2, 0x0000
    1bfe:	0000                	.insn	2, 0x0000
    1c00:	f800                	.insn	2, 0xf800
    1c02:	0001                	.insn	2, 0x0001
    1c04:	fc00                	.insn	2, 0xfc00
    1c06:	0001                	.insn	2, 0x0001
    1c08:	0100                	.insn	2, 0x0100
    1c0a:	5a00                	.insn	2, 0x5a00
    1c0c:	0210                	.insn	2, 0x0210
    1c0e:	0000                	.insn	2, 0x0000
    1c10:	0214                	.insn	2, 0x0214
    1c12:	0000                	.insn	2, 0x0000
    1c14:	0001                	.insn	2, 0x0001
    1c16:	005a                	.insn	2, 0x005a
    1c18:	0000                	.insn	2, 0x0000
    1c1a:	0000                	.insn	2, 0x0000
    1c1c:	0000                	.insn	2, 0x0000
    1c1e:	3400                	.insn	2, 0x3400
    1c20:	0002                	.insn	2, 0x0002
    1c22:	5400                	.insn	2, 0x5400
    1c24:	0002                	.insn	2, 0x0002
    1c26:	0100                	.insn	2, 0x0100
    1c28:	5a00                	.insn	2, 0x5a00
	...
    1c32:	0238                	.insn	2, 0x0238
    1c34:	0000                	.insn	2, 0x0000
    1c36:	0284                	.insn	2, 0x0284
    1c38:	0000                	.insn	2, 0x0000
    1c3a:	0001                	.insn	2, 0x0001
    1c3c:	0000005b          	.insn	4, 0x005b
    1c40:	0000                	.insn	2, 0x0000
    1c42:	0000                	.insn	2, 0x0000
    1c44:	3c00                	.insn	2, 0x3c00
    1c46:	0002                	.insn	2, 0x0002
    1c48:	8400                	.insn	2, 0x8400
    1c4a:	0002                	.insn	2, 0x0002
    1c4c:	0100                	.insn	2, 0x0100
    1c4e:	5c00                	.insn	2, 0x5c00
	...
    1c58:	0240                	.insn	2, 0x0240
    1c5a:	0000                	.insn	2, 0x0000
    1c5c:	0250                	.insn	2, 0x0250
    1c5e:	0000                	.insn	2, 0x0000
    1c60:	00110003          	lb	zero,1(sp)
    1c64:	509f 0002 5c00      	.insn	6, 0x5c000002509f
    1c6a:	0002                	.insn	2, 0x0002
    1c6c:	0300                	.insn	2, 0x0300
    1c6e:	1100                	.insn	2, 0x1100
    1c70:	9f01                	.insn	2, 0x9f01
    1c72:	025c                	.insn	2, 0x025c
    1c74:	0000                	.insn	2, 0x0000
    1c76:	0268                	.insn	2, 0x0268
    1c78:	0000                	.insn	2, 0x0000
    1c7a:	00110003          	lb	zero,1(sp)
    1c7e:	689f 0002 7c00      	.insn	6, 0x7c000002689f
    1c84:	0002                	.insn	2, 0x0002
    1c86:	0300                	.insn	2, 0x0300
    1c88:	1100                	.insn	2, 0x1100
    1c8a:	9f01                	.insn	2, 0x9f01
    1c8c:	027c                	.insn	2, 0x027c
    1c8e:	0000                	.insn	2, 0x0000
    1c90:	0284                	.insn	2, 0x0284
    1c92:	0000                	.insn	2, 0x0000
    1c94:	02110003          	lb	zero,33(sp)
    1c98:	009f 0000 0000      	.insn	6, 0x009f
    1c9e:	0000                	.insn	2, 0x0000
    1ca0:	4000                	.insn	2, 0x4000
    1ca2:	0002                	.insn	2, 0x0002
    1ca4:	5c00                	.insn	2, 0x5c00
    1ca6:	0002                	.insn	2, 0x0002
    1ca8:	0300                	.insn	2, 0x0300
    1caa:	1100                	.insn	2, 0x1100
    1cac:	9f00                	.insn	2, 0x9f00
    1cae:	025c                	.insn	2, 0x025c
    1cb0:	0000                	.insn	2, 0x0000
    1cb2:	027c                	.insn	2, 0x027c
    1cb4:	0000                	.insn	2, 0x0000
    1cb6:	01110003          	lb	zero,17(sp)
    1cba:	7c9f 0002 8400      	.insn	6, 0x840000027c9f
    1cc0:	0002                	.insn	2, 0x0002
    1cc2:	0300                	.insn	2, 0x0300
    1cc4:	1100                	.insn	2, 0x1100
    1cc6:	9f02                	.insn	2, 0x9f02
	...
    1cd0:	0240                	.insn	2, 0x0240
    1cd2:	0000                	.insn	2, 0x0000
    1cd4:	0254                	.insn	2, 0x0254
    1cd6:	0000                	.insn	2, 0x0000
    1cd8:	000c                	.insn	2, 0x000c
    1cda:	935a                	.insn	2, 0x935a
    1cdc:	5b04                	.insn	2, 0x5b04
    1cde:	935c0493          	addi	s1,s8,-1739
    1ce2:	5d04                	.insn	2, 0x5d04
    1ce4:	02540493          	addi	s1,s0,37
    1ce8:	0000                	.insn	2, 0x0000
    1cea:	0290                	.insn	2, 0x0290
    1cec:	0000                	.insn	2, 0x0000
    1cee:	0493000b          	.insn	4, 0x0493000b
    1cf2:	5c04935b          	.insn	4, 0x5c04935b
    1cf6:	935d0493          	addi	s1,s10,-1739
    1cfa:	9004                	.insn	2, 0x9004
    1cfc:	0002                	.insn	2, 0x0002
    1cfe:	9400                	.insn	2, 0x9400
    1d00:	0002                	.insn	2, 0x0002
    1d02:	0800                	.insn	2, 0x0800
    1d04:	9300                	.insn	2, 0x9300
    1d06:	5c08                	.insn	2, 0x5c08
    1d08:	935d0493          	addi	s1,s10,-1739
    1d0c:	0004                	.insn	2, 0x0004
    1d0e:	0000                	.insn	2, 0x0000
    1d10:	0000                	.insn	2, 0x0000
    1d12:	0000                	.insn	2, 0x0000
    1d14:	0400                	.insn	2, 0x0400
    1d16:	2c000003          	lb	zero,704(zero) # 2c0 <$d.11+0x2c>
    1d1a:	01000003          	lb	zero,16(zero) # 10 <$d.6+0x10>
    1d1e:	5a00                	.insn	2, 0x5a00
    1d20:	032c                	.insn	2, 0x032c
    1d22:	0000                	.insn	2, 0x0000
    1d24:	0610                	.insn	2, 0x0610
    1d26:	0000                	.insn	2, 0x0000
    1d28:	0001                	.insn	2, 0x0001
    1d2a:	0058                	.insn	2, 0x0058
    1d2c:	0000                	.insn	2, 0x0000
    1d2e:	0000                	.insn	2, 0x0000
    1d30:	0000                	.insn	2, 0x0000
    1d32:	4400                	.insn	2, 0x4400
    1d34:	e8000003          	lb	zero,-384(zero) # fffffe80 <__free_ram_end+0xffca9e80>
    1d38:	06000003          	lb	zero,96(zero) # 60 <$d.6+0x60>
    1d3c:	7a00                	.insn	2, 0x7a00
    1d3e:	1100                	.insn	2, 0x1100
    1d40:	e89f1b03          	lh	s6,-375(t5)
    1d44:	ec000003          	lb	zero,-320(zero) # fffffec0 <__free_ram_end+0xffca9ec0>
    1d48:	09000003          	lb	zero,144(zero) # 90 <$d.6+0x90>
    1d4c:	7a00                	.insn	2, 0x7a00
    1d4e:	1100                	.insn	2, 0x1100
    1d50:	01111b03          	lh	s6,17(sp)
    1d54:	9f22                	.insn	2, 0x9f22
	...
    1d5e:	0344                	.insn	2, 0x0344
    1d60:	0000                	.insn	2, 0x0000
    1d62:	0350                	.insn	2, 0x0350
    1d64:	0000                	.insn	2, 0x0000
    1d66:	00110003          	lb	zero,1(sp)
    1d6a:	509f 0003 6000      	.insn	6, 0x60000003509f
    1d70:	03000003          	lb	zero,48(zero) # 30 <$d.6+0x30>
    1d74:	1100                	.insn	2, 0x1100
    1d76:	9f01                	.insn	2, 0x9f01
    1d78:	0360                	.insn	2, 0x0360
    1d7a:	0000                	.insn	2, 0x0000
    1d7c:	0370                	.insn	2, 0x0370
    1d7e:	0000                	.insn	2, 0x0000
    1d80:	02110003          	lb	zero,33(sp)
    1d84:	709f 0003 7c00      	.insn	6, 0x7c000003709f
    1d8a:	03000003          	lb	zero,48(zero) # 30 <$d.6+0x30>
    1d8e:	1100                	.insn	2, 0x1100
    1d90:	037c9f03          	lh	t5,55(s9)
    1d94:	0000                	.insn	2, 0x0000
    1d96:	0388                	.insn	2, 0x0388
    1d98:	0000                	.insn	2, 0x0000
    1d9a:	04110003          	lb	zero,65(sp)
    1d9e:	889f 0003 9400      	.insn	6, 0x94000003889f
    1da4:	03000003          	lb	zero,48(zero) # 30 <$d.6+0x30>
    1da8:	1100                	.insn	2, 0x1100
    1daa:	9f05                	.insn	2, 0x9f05
    1dac:	0394                	.insn	2, 0x0394
    1dae:	0000                	.insn	2, 0x0000
    1db0:	03a4                	.insn	2, 0x03a4
    1db2:	0000                	.insn	2, 0x0000
    1db4:	06110003          	lb	zero,97(sp)
    1db8:	a49f 0003 b000      	.insn	6, 0xb0000003a49f
    1dbe:	03000003          	lb	zero,48(zero) # 30 <$d.6+0x30>
    1dc2:	1100                	.insn	2, 0x1100
    1dc4:	03b09f07          	.insn	4, 0x03b09f07
    1dc8:	0000                	.insn	2, 0x0000
    1dca:	03c0                	.insn	2, 0x03c0
    1dcc:	0000                	.insn	2, 0x0000
    1dce:	08110003          	lb	zero,129(sp)
    1dd2:	c09f 0003 cc00      	.insn	6, 0xcc000003c09f
    1dd8:	03000003          	lb	zero,48(zero) # 30 <$d.6+0x30>
    1ddc:	1100                	.insn	2, 0x1100
    1dde:	9f09                	.insn	2, 0x9f09
    1de0:	03cc                	.insn	2, 0x03cc
    1de2:	0000                	.insn	2, 0x0000
    1de4:	03dc                	.insn	2, 0x03dc
    1de6:	0000                	.insn	2, 0x0000
    1de8:	0a110003          	lb	zero,161(sp)
    1dec:	dc9f 0003 e800      	.insn	6, 0xe8000003dc9f
    1df2:	03000003          	lb	zero,48(zero) # 30 <$d.6+0x30>
    1df6:	1100                	.insn	2, 0x1100
    1df8:	03e89f0b          	.insn	4, 0x03e89f0b
    1dfc:	0000                	.insn	2, 0x0000
    1dfe:	03f8                	.insn	2, 0x03f8
    1e00:	0000                	.insn	2, 0x0000
    1e02:	0c110003          	lb	zero,193(sp)
    1e06:	009f 0000 0000      	.insn	6, 0x009f
    1e0c:	0000                	.insn	2, 0x0000
    1e0e:	1400                	.insn	2, 0x1400
    1e10:	0004                	.insn	2, 0x0004
    1e12:	2000                	.insn	2, 0x2000
    1e14:	0004                	.insn	2, 0x0004
    1e16:	0300                	.insn	2, 0x0300
    1e18:	1100                	.insn	2, 0x1100
    1e1a:	9f00                	.insn	2, 0x9f00
    1e1c:	0420                	.insn	2, 0x0420
    1e1e:	0000                	.insn	2, 0x0000
    1e20:	0474                	.insn	2, 0x0474
    1e22:	0000                	.insn	2, 0x0000
    1e24:	0001                	.insn	2, 0x0001
    1e26:	0059                	.insn	2, 0x0059
    1e28:	0000                	.insn	2, 0x0000
    1e2a:	0000                	.insn	2, 0x0000
    1e2c:	0000                	.insn	2, 0x0000
    1e2e:	2000                	.insn	2, 0x2000
    1e30:	0004                	.insn	2, 0x0004
    1e32:	3c00                	.insn	2, 0x3c00
    1e34:	0004                	.insn	2, 0x0004
    1e36:	0300                	.insn	2, 0x0300
    1e38:	1100                	.insn	2, 0x1100
    1e3a:	9f00                	.insn	2, 0x9f00
	...
    1e44:	0480                	.insn	2, 0x0480
    1e46:	0000                	.insn	2, 0x0000
    1e48:	0494                	.insn	2, 0x0494
    1e4a:	0000                	.insn	2, 0x0000
    1e4c:	00110003          	lb	zero,1(sp)
    1e50:	949f 0004 ec00      	.insn	6, 0xec000004949f
    1e56:	0004                	.insn	2, 0x0004
    1e58:	0100                	.insn	2, 0x0100
    1e5a:	5900                	.insn	2, 0x5900
	...
    1e64:	0494                	.insn	2, 0x0494
    1e66:	0000                	.insn	2, 0x0000
    1e68:	04b0                	.insn	2, 0x04b0
    1e6a:	0000                	.insn	2, 0x0000
    1e6c:	00110003          	lb	zero,1(sp)
    1e70:	009f 0000 0000      	.insn	6, 0x009f
    1e76:	0000                	.insn	2, 0x0000
    1e78:	4c00                	.insn	2, 0x4c00
    1e7a:	0005                	.insn	2, 0x0005
    1e7c:	5c00                	.insn	2, 0x5c00
    1e7e:	0005                	.insn	2, 0x0005
    1e80:	0300                	.insn	2, 0x0300
    1e82:	1100                	.insn	2, 0x1100
    1e84:	9f00                	.insn	2, 0x9f00
    1e86:	055c                	.insn	2, 0x055c
    1e88:	0000                	.insn	2, 0x0000
    1e8a:	05b4                	.insn	2, 0x05b4
    1e8c:	0000                	.insn	2, 0x0000
    1e8e:	0001                	.insn	2, 0x0001
    1e90:	0062                	.insn	2, 0x0062
    1e92:	0000                	.insn	2, 0x0000
    1e94:	0000                	.insn	2, 0x0000
    1e96:	0000                	.insn	2, 0x0000
    1e98:	5c00                	.insn	2, 0x5c00
    1e9a:	0005                	.insn	2, 0x0005
    1e9c:	7800                	.insn	2, 0x7800
    1e9e:	0005                	.insn	2, 0x0005
    1ea0:	0300                	.insn	2, 0x0300
    1ea2:	1100                	.insn	2, 0x1100
    1ea4:	9f00                	.insn	2, 0x9f00
	...

00001eae <$d.2>:
    1eae:	0000                	.insn	2, 0x0000
    1eb0:	0000                	.insn	2, 0x0000
    1eb2:	003c                	.insn	2, 0x003c
    1eb4:	0000                	.insn	2, 0x0000
    1eb6:	0001                	.insn	2, 0x0001
    1eb8:	3c5a                	.insn	2, 0x3c5a
    1eba:	0000                	.insn	2, 0x0000
    1ebc:	3c00                	.insn	2, 0x3c00
    1ebe:	01000003          	lb	zero,16(zero) # 10 <$d.6+0x10>
    1ec2:	5800                	.insn	2, 0x5800
    1ec4:	03ec                	.insn	2, 0x03ec
    1ec6:	0000                	.insn	2, 0x0000
    1ec8:	0404                	.insn	2, 0x0404
    1eca:	0000                	.insn	2, 0x0000
    1ecc:	0001                	.insn	2, 0x0001
    1ece:	0058                	.insn	2, 0x0058
    1ed0:	0000                	.insn	2, 0x0000
    1ed2:	0000                	.insn	2, 0x0000
    1ed4:	0000                	.insn	2, 0x0000
    1ed6:	3c00                	.insn	2, 0x3c00
    1ed8:	0000                	.insn	2, 0x0000
    1eda:	8000                	.insn	2, 0x8000
    1edc:	0000                	.insn	2, 0x0000
    1ede:	0300                	.insn	2, 0x0300
    1ee0:	1100                	.insn	2, 0x1100
    1ee2:	9f00                	.insn	2, 0x9f00
    1ee4:	0080                	.insn	2, 0x0080
    1ee6:	0000                	.insn	2, 0x0000
    1ee8:	0328                	.insn	2, 0x0328
    1eea:	0000                	.insn	2, 0x0000
    1eec:	0001                	.insn	2, 0x0001
    1eee:	ec59                	.insn	2, 0xec59
    1ef0:	04000003          	lb	zero,64(zero) # 40 <$d.6+0x40>
    1ef4:	0004                	.insn	2, 0x0004
    1ef6:	0100                	.insn	2, 0x0100
    1ef8:	5900                	.insn	2, 0x5900
	...
    1f02:	003c                	.insn	2, 0x003c
    1f04:	0000                	.insn	2, 0x0000
    1f06:	0338                	.insn	2, 0x0338
    1f08:	0000                	.insn	2, 0x0000
    1f0a:	00110003          	lb	zero,1(sp)
    1f0e:	ec9f 0003 0000      	.insn	6, 0x0003ec9f
    1f14:	0004                	.insn	2, 0x0004
    1f16:	0300                	.insn	2, 0x0300
    1f18:	1100                	.insn	2, 0x1100
    1f1a:	9f00                	.insn	2, 0x9f00
    1f1c:	0400                	.insn	2, 0x0400
    1f1e:	0000                	.insn	2, 0x0000
    1f20:	0404                	.insn	2, 0x0404
    1f22:	0000                	.insn	2, 0x0000
    1f24:	01110003          	lb	zero,17(sp)
    1f28:	009f 0000 0000      	.insn	6, 0x009f
    1f2e:	0000                	.insn	2, 0x0000
    1f30:	8000                	.insn	2, 0x8000
    1f32:	0000                	.insn	2, 0x0000
    1f34:	0000                	.insn	2, 0x0000
    1f36:	0001                	.insn	2, 0x0001
    1f38:	0100                	.insn	2, 0x0100
    1f3a:	5800                	.insn	2, 0x5800
    1f3c:	011c                	.insn	2, 0x011c
    1f3e:	0000                	.insn	2, 0x0000
    1f40:	021c                	.insn	2, 0x021c
    1f42:	0000                	.insn	2, 0x0000
    1f44:	0001                	.insn	2, 0x0001
    1f46:	0058                	.insn	2, 0x0058
    1f48:	0000                	.insn	2, 0x0000
    1f4a:	0000                	.insn	2, 0x0000
    1f4c:	0000                	.insn	2, 0x0000
    1f4e:	8000                	.insn	2, 0x8000
    1f50:	0000                	.insn	2, 0x0000
    1f52:	0000                	.insn	2, 0x0000
    1f54:	0001                	.insn	2, 0x0001
    1f56:	0300                	.insn	2, 0x0300
    1f58:	7200                	.insn	2, 0x7200
    1f5a:	9f0c                	.insn	2, 0x9f0c
    1f5c:	011c                	.insn	2, 0x011c
    1f5e:	0000                	.insn	2, 0x0000
    1f60:	021c                	.insn	2, 0x021c
    1f62:	0000                	.insn	2, 0x0000
    1f64:	0c720003          	lb	zero,199(tp) # c7 <$d.6+0xc7>
    1f68:	009f 0000 0000      	.insn	6, 0x009f
    1f6e:	0000                	.insn	2, 0x0000
    1f70:	8800                	.insn	2, 0x8800
    1f72:	0000                	.insn	2, 0x0000
    1f74:	8c00                	.insn	2, 0x8c00
    1f76:	0000                	.insn	2, 0x0000
    1f78:	0e00                	.insn	2, 0x0e00
    1f7a:	7a00                	.insn	2, 0x7a00
    1f7c:	1100                	.insn	2, 0x1100
    1f7e:	7f9c                	.insn	2, 0x7f9c
    1f80:	111c                	.insn	2, 0x111c
    1f82:	e3111e7f 909f2200 	.insn	12, 0x94000000909f2200e3111e7f
    1f8a:	94000000 
    1f8e:	0000                	.insn	2, 0x0000
    1f90:	0300                	.insn	2, 0x0300
    1f92:	7a00                	.insn	2, 0x7a00
    1f94:	00009f7f 00000000 	.insn	12, 0x00a800000000000000009f7f
    1f9c:	00a80000 
    1fa0:	0000                	.insn	2, 0x0000
    1fa2:	00b4                	.insn	2, 0x00b4
    1fa4:	0000                	.insn	2, 0x0000
    1fa6:	0010                	.insn	2, 0x0010
    1fa8:	007a                	.insn	2, 0x007a
    1faa:	b011                	.insn	2, 0xb011
    1fac:	7cf9                	.insn	2, 0x7cf9
    1fae:	111c                	.insn	2, 0x111c
    1fb0:	d0111e7f 9f220386 	.insn	12, 0x00b49f220386d0111e7f
    1fb8:	000000b4 
    1fbc:	00b8                	.insn	2, 0x00b8
    1fbe:	0000                	.insn	2, 0x0000
    1fc0:	0010                	.insn	2, 0x0010
    1fc2:	007a                	.insn	2, 0x007a
    1fc4:	b011                	.insn	2, 0xb011
    1fc6:	7cf9                	.insn	2, 0x7cf9
    1fc8:	111c                	.insn	2, 0x111c
    1fca:	cf111e7f 9f220386 	.insn	12, 0x00c09f220386cf111e7f
    1fd2:	000000c0 
    1fd6:	00c4                	.insn	2, 0x00c4
    1fd8:	0000                	.insn	2, 0x0000
    1fda:	0010                	.insn	2, 0x0010
    1fdc:	007a                	.insn	2, 0x007a
    1fde:	b011                	.insn	2, 0xb011
    1fe0:	7cf9                	.insn	2, 0x7cf9
    1fe2:	111c                	.insn	2, 0x111c
    1fe4:	d0111e7f 9f220386 	.insn	12, 0x00ec9f220386d0111e7f
    1fec:	000000ec 
    1ff0:	00f8                	.insn	2, 0x00f8
    1ff2:	0000                	.insn	2, 0x0000
    1ff4:	0010                	.insn	2, 0x0010
    1ff6:	007a                	.insn	2, 0x007a
    1ff8:	b011                	.insn	2, 0xb011
    1ffa:	7cf9                	.insn	2, 0x7cf9
    1ffc:	111c                	.insn	2, 0x111c
    1ffe:	d0111e7f 9f220386 	.insn	12, 0x00f89f220386d0111e7f
    2006:	000000f8 
    200a:	00fc                	.insn	2, 0x00fc
    200c:	0000                	.insn	2, 0x0000
    200e:	0010                	.insn	2, 0x0010
    2010:	007a                	.insn	2, 0x007a
    2012:	b011                	.insn	2, 0xb011
    2014:	7cf9                	.insn	2, 0x7cf9
    2016:	111c                	.insn	2, 0x111c
    2018:	cf111e7f 9f220386 	.insn	12, 0x01ec9f220386cf111e7f
    2020:	000001ec 
    2024:	01f8                	.insn	2, 0x01f8
    2026:	0000                	.insn	2, 0x0000
    2028:	0010                	.insn	2, 0x0010
    202a:	b011007b          	.insn	4, 0xb011007b
    202e:	7cf9                	.insn	2, 0x7cf9
    2030:	111c                	.insn	2, 0x111c
    2032:	d0111e7f 9f220386 	.insn	12, 0x01f89f220386d0111e7f
    203a:	000001f8 
    203e:	01fc                	.insn	2, 0x01fc
    2040:	0000                	.insn	2, 0x0000
    2042:	0010                	.insn	2, 0x0010
    2044:	b011007b          	.insn	4, 0xb011007b
    2048:	7cf9                	.insn	2, 0x7cf9
    204a:	111c                	.insn	2, 0x111c
    204c:	cf111e7f 9f220386 	.insn	12, 0x02049f220386cf111e7f
    2054:	00000204 
    2058:	0208                	.insn	2, 0x0208
    205a:	0000                	.insn	2, 0x0000
    205c:	0010                	.insn	2, 0x0010
    205e:	b011007b          	.insn	4, 0xb011007b
    2062:	7cf9                	.insn	2, 0x7cf9
    2064:	111c                	.insn	2, 0x111c
    2066:	d0111e7f 9f220386 	.insn	12, 0x9f220386d0111e7f
    206e:	00000000 
    2072:	0000                	.insn	2, 0x0000
    2074:	0000                	.insn	2, 0x0000
    2076:	00c4                	.insn	2, 0x00c4
    2078:	0000                	.insn	2, 0x0000
    207a:	00c8                	.insn	2, 0x00c8
    207c:	0000                	.insn	2, 0x0000
    207e:	000e                	.insn	2, 0x000e
    2080:	007a                	.insn	2, 0x007a
    2082:	9c11                	.insn	2, 0x9c11
    2084:	7f111c7f 00e3111e 	.insn	12, 0x00cc9f2200e3111e7f111c7f
    208c:	00cc9f22 
    2090:	0000                	.insn	2, 0x0000
    2092:	00d0                	.insn	2, 0x00d0
    2094:	0000                	.insn	2, 0x0000
    2096:	7f7a0003          	lb	zero,2039(s4)
    209a:	009f 0000 0000      	.insn	6, 0x009f
    20a0:	0000                	.insn	2, 0x0000
    20a2:	dc00                	.insn	2, 0xdc00
    20a4:	0000                	.insn	2, 0x0000
    20a6:	e000                	.insn	2, 0xe000
    20a8:	0000                	.insn	2, 0x0000
    20aa:	0e00                	.insn	2, 0x0e00
    20ac:	7a00                	.insn	2, 0x7a00
    20ae:	1100                	.insn	2, 0x1100
    20b0:	7f9c                	.insn	2, 0x7f9c
    20b2:	111c                	.insn	2, 0x111c
    20b4:	e3111e7f e49f2200 	.insn	12, 0xe8000000e49f2200e3111e7f
    20bc:	e8000000 
    20c0:	0000                	.insn	2, 0x0000
    20c2:	0300                	.insn	2, 0x0300
    20c4:	7a00                	.insn	2, 0x7a00
    20c6:	00009f7f 00000000 	.insn	12, 0x012000000000000000009f7f
    20ce:	01200000 
    20d2:	0000                	.insn	2, 0x0000
    20d4:	0124                	.insn	2, 0x0124
    20d6:	0000                	.insn	2, 0x0000
    20d8:	31100003          	lb	zero,785(zero) # 311 <$d.9+0x5>
    20dc:	249f 0001 2800      	.insn	6, 0x28000001249f
    20e2:	0001                	.insn	2, 0x0001
    20e4:	0300                	.insn	2, 0x0300
    20e6:	1000                	.insn	2, 0x1000
    20e8:	9f30                	.insn	2, 0x9f30
    20ea:	0128                	.insn	2, 0x0128
    20ec:	0000                	.insn	2, 0x0000
    20ee:	012c                	.insn	2, 0x012c
    20f0:	0000                	.insn	2, 0x0000
    20f2:	2f100003          	lb	zero,753(zero) # 2f1 <$d.7+0x19>
    20f6:	2c9f 0001 3000      	.insn	6, 0x300000012c9f
    20fc:	0001                	.insn	2, 0x0001
    20fe:	0300                	.insn	2, 0x0300
    2100:	1000                	.insn	2, 0x1000
    2102:	9f2e                	.insn	2, 0x9f2e
    2104:	0130                	.insn	2, 0x0130
    2106:	0000                	.insn	2, 0x0000
    2108:	0134                	.insn	2, 0x0134
    210a:	0000                	.insn	2, 0x0000
    210c:	2d100003          	lb	zero,721(zero) # 2d1 <$d.11+0x3d>
    2110:	349f 0001 3800      	.insn	6, 0x38000001349f
    2116:	0001                	.insn	2, 0x0001
    2118:	0300                	.insn	2, 0x0300
    211a:	1000                	.insn	2, 0x1000
    211c:	9f2c                	.insn	2, 0x9f2c
    211e:	0138                	.insn	2, 0x0138
    2120:	0000                	.insn	2, 0x0000
    2122:	013c                	.insn	2, 0x013c
    2124:	0000                	.insn	2, 0x0000
    2126:	2b100003          	lb	zero,689(zero) # 2b1 <$d.11+0x1d>
    212a:	3c9f 0001 4000      	.insn	6, 0x400000013c9f
    2130:	0001                	.insn	2, 0x0001
    2132:	0300                	.insn	2, 0x0300
    2134:	1000                	.insn	2, 0x1000
    2136:	9f2a                	.insn	2, 0x9f2a
    2138:	0140                	.insn	2, 0x0140
    213a:	0000                	.insn	2, 0x0000
    213c:	0144                	.insn	2, 0x0144
    213e:	0000                	.insn	2, 0x0000
    2140:	29100003          	lb	zero,657(zero) # 291 <$d.10+0x13>
    2144:	449f 0001 4800      	.insn	6, 0x48000001449f
    214a:	0001                	.insn	2, 0x0001
    214c:	0300                	.insn	2, 0x0300
    214e:	1000                	.insn	2, 0x1000
    2150:	9f28                	.insn	2, 0x9f28
    2152:	0148                	.insn	2, 0x0148
    2154:	0000                	.insn	2, 0x0000
    2156:	014c                	.insn	2, 0x014c
    2158:	0000                	.insn	2, 0x0000
    215a:	27100003          	lb	zero,625(zero) # 271 <$d.9+0xb5>
    215e:	4c9f 0001 5000      	.insn	6, 0x500000014c9f
    2164:	0001                	.insn	2, 0x0001
    2166:	0300                	.insn	2, 0x0300
    2168:	1000                	.insn	2, 0x1000
    216a:	9f26                	.insn	2, 0x9f26
    216c:	0150                	.insn	2, 0x0150
    216e:	0000                	.insn	2, 0x0000
    2170:	0154                	.insn	2, 0x0154
    2172:	0000                	.insn	2, 0x0000
    2174:	25100003          	lb	zero,593(zero) # 251 <$d.9+0x95>
    2178:	549f 0001 5800      	.insn	6, 0x58000001549f
    217e:	0001                	.insn	2, 0x0001
    2180:	0300                	.insn	2, 0x0300
    2182:	1000                	.insn	2, 0x1000
    2184:	9f24                	.insn	2, 0x9f24
    2186:	0158                	.insn	2, 0x0158
    2188:	0000                	.insn	2, 0x0000
    218a:	015c                	.insn	2, 0x015c
    218c:	0000                	.insn	2, 0x0000
    218e:	23100003          	lb	zero,561(zero) # 231 <$d.9+0x75>
    2192:	5c9f 0001 6000      	.insn	6, 0x600000015c9f
    2198:	0001                	.insn	2, 0x0001
    219a:	0300                	.insn	2, 0x0300
    219c:	1000                	.insn	2, 0x1000
    219e:	9f22                	.insn	2, 0x9f22
    21a0:	0160                	.insn	2, 0x0160
    21a2:	0000                	.insn	2, 0x0000
    21a4:	0164                	.insn	2, 0x0164
    21a6:	0000                	.insn	2, 0x0000
    21a8:	21100003          	lb	zero,529(zero) # 211 <$d.9+0x55>
    21ac:	649f 0001 6800      	.insn	6, 0x68000001649f
    21b2:	0001                	.insn	2, 0x0001
    21b4:	0300                	.insn	2, 0x0300
    21b6:	1000                	.insn	2, 0x1000
    21b8:	9f20                	.insn	2, 0x9f20
    21ba:	0168                	.insn	2, 0x0168
    21bc:	0000                	.insn	2, 0x0000
    21be:	016c                	.insn	2, 0x016c
    21c0:	0000                	.insn	2, 0x0000
    21c2:	0002                	.insn	2, 0x0002
    21c4:	016c9f4f          	.insn	4, 0x016c9f4f
    21c8:	0000                	.insn	2, 0x0000
    21ca:	0170                	.insn	2, 0x0170
    21cc:	0000                	.insn	2, 0x0000
    21ce:	0002                	.insn	2, 0x0002
    21d0:	9f4e                	.insn	2, 0x9f4e
    21d2:	0170                	.insn	2, 0x0170
    21d4:	0000                	.insn	2, 0x0000
    21d6:	0174                	.insn	2, 0x0174
    21d8:	0000                	.insn	2, 0x0000
    21da:	0002                	.insn	2, 0x0002
    21dc:	9f4d                	.insn	2, 0x9f4d
    21de:	0174                	.insn	2, 0x0174
    21e0:	0000                	.insn	2, 0x0000
    21e2:	0178                	.insn	2, 0x0178
    21e4:	0000                	.insn	2, 0x0000
    21e6:	0002                	.insn	2, 0x0002
    21e8:	9f4c                	.insn	2, 0x9f4c
    21ea:	0178                	.insn	2, 0x0178
    21ec:	0000                	.insn	2, 0x0000
    21ee:	017c                	.insn	2, 0x017c
    21f0:	0000                	.insn	2, 0x0000
    21f2:	0002                	.insn	2, 0x0002
    21f4:	017c9f4b          	.insn	4, 0x017c9f4b
    21f8:	0000                	.insn	2, 0x0000
    21fa:	0180                	.insn	2, 0x0180
    21fc:	0000                	.insn	2, 0x0000
    21fe:	0002                	.insn	2, 0x0002
    2200:	9f4a                	.insn	2, 0x9f4a
    2202:	0180                	.insn	2, 0x0180
    2204:	0000                	.insn	2, 0x0000
    2206:	0184                	.insn	2, 0x0184
    2208:	0000                	.insn	2, 0x0000
    220a:	0002                	.insn	2, 0x0002
    220c:	9f49                	.insn	2, 0x9f49
    220e:	0184                	.insn	2, 0x0184
    2210:	0000                	.insn	2, 0x0000
    2212:	0188                	.insn	2, 0x0188
    2214:	0000                	.insn	2, 0x0000
    2216:	0002                	.insn	2, 0x0002
    2218:	9f48                	.insn	2, 0x9f48
    221a:	0188                	.insn	2, 0x0188
    221c:	0000                	.insn	2, 0x0000
    221e:	018c                	.insn	2, 0x018c
    2220:	0000                	.insn	2, 0x0000
    2222:	0002                	.insn	2, 0x0002
    2224:	018c9f47          	.insn	4, 0x018c9f47
    2228:	0000                	.insn	2, 0x0000
    222a:	0190                	.insn	2, 0x0190
    222c:	0000                	.insn	2, 0x0000
    222e:	0002                	.insn	2, 0x0002
    2230:	9f46                	.insn	2, 0x9f46
    2232:	0190                	.insn	2, 0x0190
    2234:	0000                	.insn	2, 0x0000
    2236:	0194                	.insn	2, 0x0194
    2238:	0000                	.insn	2, 0x0000
    223a:	0002                	.insn	2, 0x0002
    223c:	9f45                	.insn	2, 0x9f45
    223e:	0194                	.insn	2, 0x0194
    2240:	0000                	.insn	2, 0x0000
    2242:	0198                	.insn	2, 0x0198
    2244:	0000                	.insn	2, 0x0000
    2246:	0002                	.insn	2, 0x0002
    2248:	9f44                	.insn	2, 0x9f44
    224a:	0198                	.insn	2, 0x0198
    224c:	0000                	.insn	2, 0x0000
    224e:	019c                	.insn	2, 0x019c
    2250:	0000                	.insn	2, 0x0000
    2252:	0002                	.insn	2, 0x0002
    2254:	019c9f43          	.insn	4, 0x019c9f43
    2258:	0000                	.insn	2, 0x0000
    225a:	01a0                	.insn	2, 0x01a0
    225c:	0000                	.insn	2, 0x0000
    225e:	0002                	.insn	2, 0x0002
    2260:	9f42                	.insn	2, 0x9f42
    2262:	01a0                	.insn	2, 0x01a0
    2264:	0000                	.insn	2, 0x0000
    2266:	01a4                	.insn	2, 0x01a4
    2268:	0000                	.insn	2, 0x0000
    226a:	0002                	.insn	2, 0x0002
    226c:	9f41                	.insn	2, 0x9f41
    226e:	01a4                	.insn	2, 0x01a4
    2270:	0000                	.insn	2, 0x0000
    2272:	01a8                	.insn	2, 0x01a8
    2274:	0000                	.insn	2, 0x0000
    2276:	0002                	.insn	2, 0x0002
    2278:	9f40                	.insn	2, 0x9f40
    227a:	01a8                	.insn	2, 0x01a8
    227c:	0000                	.insn	2, 0x0000
    227e:	01ac                	.insn	2, 0x01ac
    2280:	0000                	.insn	2, 0x0000
    2282:	0002                	.insn	2, 0x0002
    2284:	01ac9f3f 01b00000 	.insn	8, 0x01b0000001ac9f3f
    228c:	0000                	.insn	2, 0x0000
    228e:	0002                	.insn	2, 0x0002
    2290:	9f3e                	.insn	2, 0x9f3e
    2292:	01b0                	.insn	2, 0x01b0
    2294:	0000                	.insn	2, 0x0000
    2296:	01b4                	.insn	2, 0x01b4
    2298:	0000                	.insn	2, 0x0000
    229a:	0002                	.insn	2, 0x0002
    229c:	9f3d                	.insn	2, 0x9f3d
    229e:	01b4                	.insn	2, 0x01b4
    22a0:	0000                	.insn	2, 0x0000
    22a2:	01b8                	.insn	2, 0x01b8
    22a4:	0000                	.insn	2, 0x0000
    22a6:	0002                	.insn	2, 0x0002
    22a8:	9f3c                	.insn	2, 0x9f3c
    22aa:	01b8                	.insn	2, 0x01b8
    22ac:	0000                	.insn	2, 0x0000
    22ae:	01bc                	.insn	2, 0x01bc
    22b0:	0000                	.insn	2, 0x0000
    22b2:	0002                	.insn	2, 0x0002
    22b4:	01bc9f3b          	.insn	4, 0x01bc9f3b
    22b8:	0000                	.insn	2, 0x0000
    22ba:	01c0                	.insn	2, 0x01c0
    22bc:	0000                	.insn	2, 0x0000
    22be:	0002                	.insn	2, 0x0002
    22c0:	9f3a                	.insn	2, 0x9f3a
    22c2:	01c0                	.insn	2, 0x01c0
    22c4:	0000                	.insn	2, 0x0000
    22c6:	01c4                	.insn	2, 0x01c4
    22c8:	0000                	.insn	2, 0x0000
    22ca:	0002                	.insn	2, 0x0002
    22cc:	9f39                	.insn	2, 0x9f39
    22ce:	01c4                	.insn	2, 0x01c4
    22d0:	0000                	.insn	2, 0x0000
    22d2:	01c8                	.insn	2, 0x01c8
    22d4:	0000                	.insn	2, 0x0000
    22d6:	0002                	.insn	2, 0x0002
    22d8:	9f38                	.insn	2, 0x9f38
    22da:	01c8                	.insn	2, 0x01c8
    22dc:	0000                	.insn	2, 0x0000
    22de:	01cc                	.insn	2, 0x01cc
    22e0:	0000                	.insn	2, 0x0000
    22e2:	0002                	.insn	2, 0x0002
    22e4:	01cc9f37          	lui	t5,0x1cc9
    22e8:	0000                	.insn	2, 0x0000
    22ea:	01d0                	.insn	2, 0x01d0
    22ec:	0000                	.insn	2, 0x0000
    22ee:	0002                	.insn	2, 0x0002
    22f0:	9f36                	.insn	2, 0x9f36
    22f2:	01d0                	.insn	2, 0x01d0
    22f4:	0000                	.insn	2, 0x0000
    22f6:	01d4                	.insn	2, 0x01d4
    22f8:	0000                	.insn	2, 0x0000
    22fa:	0002                	.insn	2, 0x0002
    22fc:	9f35                	.insn	2, 0x9f35
    22fe:	01d4                	.insn	2, 0x01d4
    2300:	0000                	.insn	2, 0x0000
    2302:	01d8                	.insn	2, 0x01d8
    2304:	0000                	.insn	2, 0x0000
    2306:	0002                	.insn	2, 0x0002
    2308:	9f34                	.insn	2, 0x9f34
    230a:	01d8                	.insn	2, 0x01d8
    230c:	0000                	.insn	2, 0x0000
    230e:	01dc                	.insn	2, 0x01dc
    2310:	0000                	.insn	2, 0x0000
    2312:	0002                	.insn	2, 0x0002
    2314:	01dc9f33          	sll	t5,s9,t4
    2318:	0000                	.insn	2, 0x0000
    231a:	01e0                	.insn	2, 0x01e0
    231c:	0000                	.insn	2, 0x0000
    231e:	0002                	.insn	2, 0x0002
    2320:	9f32                	.insn	2, 0x9f32
    2322:	01e0                	.insn	2, 0x01e0
    2324:	0000                	.insn	2, 0x0000
    2326:	01e4                	.insn	2, 0x01e4
    2328:	0000                	.insn	2, 0x0000
    232a:	0002                	.insn	2, 0x0002
    232c:	9f31                	.insn	2, 0x9f31
    232e:	01e4                	.insn	2, 0x01e4
    2330:	0000                	.insn	2, 0x0000
    2332:	01e8                	.insn	2, 0x01e8
    2334:	0000                	.insn	2, 0x0000
    2336:	0002                	.insn	2, 0x0002
    2338:	9f30                	.insn	2, 0x9f30
	...
    2342:	0220                	.insn	2, 0x0220
    2344:	0000                	.insn	2, 0x0000
    2346:	0304                	.insn	2, 0x0304
    2348:	0000                	.insn	2, 0x0000
    234a:	0001                	.insn	2, 0x0001
    234c:	005d                	.insn	2, 0x005d
    234e:	0000                	.insn	2, 0x0000
    2350:	0000                	.insn	2, 0x0000
    2352:	0000                	.insn	2, 0x0000
    2354:	2c00                	.insn	2, 0x2c00
    2356:	0002                	.insn	2, 0x0002
    2358:	f800                	.insn	2, 0xf800
    235a:	0002                	.insn	2, 0x0002
    235c:	0600                	.insn	2, 0x0600
    235e:	7a00                	.insn	2, 0x7a00
    2360:	7200                	.insn	2, 0x7200
    2362:	1c0c                	.insn	2, 0x1c0c
    2364:	fc9f 0002 0000      	.insn	6, 0x0002fc9f
    236a:	09000003          	lb	zero,144(zero) # 90 <$d.6+0x90>
    236e:	7a00                	.insn	2, 0x7a00
    2370:	7200                	.insn	2, 0x7200
    2372:	1c0c                	.insn	2, 0x1c0c
    2374:	0111                	.insn	2, 0x0111
    2376:	9f22                	.insn	2, 0x9f22
	...
    2380:	022c                	.insn	2, 0x022c
    2382:	0000                	.insn	2, 0x0000
    2384:	0258                	.insn	2, 0x0258
    2386:	0000                	.insn	2, 0x0000
    2388:	0001                	.insn	2, 0x0001
    238a:	0002585b          	.insn	4, 0x0002585b
    238e:	7000                	.insn	2, 0x7000
    2390:	0002                	.insn	2, 0x0002
    2392:	0100                	.insn	2, 0x0100
    2394:	5c00                	.insn	2, 0x5c00
    2396:	0270                	.insn	2, 0x0270
    2398:	0000                	.insn	2, 0x0000
    239a:	0288                	.insn	2, 0x0288
    239c:	0000                	.insn	2, 0x0000
    239e:	0001                	.insn	2, 0x0001
    23a0:	885e                	.insn	2, 0x885e
    23a2:	0002                	.insn	2, 0x0002
    23a4:	a000                	.insn	2, 0xa000
    23a6:	0002                	.insn	2, 0x0002
    23a8:	0100                	.insn	2, 0x0100
    23aa:	5f00                	.insn	2, 0x5f00
    23ac:	02a0                	.insn	2, 0x02a0
    23ae:	0000                	.insn	2, 0x0000
    23b0:	02b0                	.insn	2, 0x02b0
    23b2:	0000                	.insn	2, 0x0000
    23b4:	0001                	.insn	2, 0x0001
    23b6:	0002d05b          	.insn	4, 0x0002d05b
    23ba:	e000                	.insn	2, 0xe000
    23bc:	0002                	.insn	2, 0x0002
    23be:	0100                	.insn	2, 0x0100
    23c0:	5c00                	.insn	2, 0x5c00
    23c2:	02fc                	.insn	2, 0x02fc
    23c4:	0000                	.insn	2, 0x0000
    23c6:	0300                	.insn	2, 0x0300
    23c8:	0000                	.insn	2, 0x0000
    23ca:	0001                	.insn	2, 0x0001
    23cc:	0000005b          	.insn	4, 0x005b
    23d0:	0000                	.insn	2, 0x0000
    23d2:	0000                	.insn	2, 0x0000
    23d4:	4000                	.insn	2, 0x4000
    23d6:	0002                	.insn	2, 0x0002
    23d8:	5800                	.insn	2, 0x5800
    23da:	0002                	.insn	2, 0x0002
    23dc:	0300                	.insn	2, 0x0300
    23de:	1100                	.insn	2, 0x1100
    23e0:	9f00                	.insn	2, 0x9f00
    23e2:	0258                	.insn	2, 0x0258
    23e4:	0000                	.insn	2, 0x0000
    23e6:	0270                	.insn	2, 0x0270
    23e8:	0000                	.insn	2, 0x0000
    23ea:	01110003          	lb	zero,17(sp)
    23ee:	709f 0002 8800      	.insn	6, 0x88000002709f
    23f4:	0002                	.insn	2, 0x0002
    23f6:	0300                	.insn	2, 0x0300
    23f8:	1100                	.insn	2, 0x1100
    23fa:	9f02                	.insn	2, 0x9f02
    23fc:	0288                	.insn	2, 0x0288
    23fe:	0000                	.insn	2, 0x0000
    2400:	02a0                	.insn	2, 0x02a0
    2402:	0000                	.insn	2, 0x0000
    2404:	03110003          	lb	zero,49(sp)
    2408:	a09f 0002 b000      	.insn	6, 0xb0000002a09f
    240e:	0002                	.insn	2, 0x0002
    2410:	0300                	.insn	2, 0x0300
    2412:	1100                	.insn	2, 0x1100
    2414:	9f04                	.insn	2, 0x9f04
    2416:	02b0                	.insn	2, 0x02b0
    2418:	0000                	.insn	2, 0x0000
    241a:	02d0                	.insn	2, 0x02d0
    241c:	0000                	.insn	2, 0x0000
    241e:	05110003          	lb	zero,81(sp)
    2422:	d09f 0002 e000      	.insn	6, 0xe0000002d09f
    2428:	0002                	.insn	2, 0x0002
    242a:	0300                	.insn	2, 0x0300
    242c:	1100                	.insn	2, 0x1100
    242e:	9f06                	.insn	2, 0x9f06
    2430:	02e0                	.insn	2, 0x02e0
    2432:	0000                	.insn	2, 0x0000
    2434:	0300                	.insn	2, 0x0300
    2436:	0000                	.insn	2, 0x0000
    2438:	07110003          	lb	zero,113(sp)
    243c:	009f 0000 0000      	.insn	6, 0x009f
    2442:	0000                	.insn	2, 0x0000
    2444:	0400                	.insn	2, 0x0400
    2446:	08000003          	lb	zero,128(zero) # 80 <$d.6+0x80>
    244a:	01000003          	lb	zero,16(zero) # 10 <$d.6+0x10>
    244e:	5b00                	.insn	2, 0x5b00
	...
    2458:	0304                	.insn	2, 0x0304
    245a:	0000                	.insn	2, 0x0000
    245c:	0320                	.insn	2, 0x0320
    245e:	0000                	.insn	2, 0x0000
    2460:	007d0003          	lb	zero,7(s10)
    2464:	ec9f 0003 0000      	.insn	6, 0x0003ec9f
    246a:	0004                	.insn	2, 0x0004
    246c:	0300                	.insn	2, 0x0300
    246e:	7d00                	.insn	2, 0x7d00
    2470:	9f00                	.insn	2, 0x9f00
	...

セクション .debug_abbrev の逆アセンブル:

00000000 <$d.7>:
   0:	1101                	.insn	2, 0x1101
   2:	2501                	.insn	2, 0x2501
   4:	130e                	.insn	2, 0x130e
   6:	0305                	.insn	2, 0x0305
   8:	100e                	.insn	2, 0x100e
   a:	110e1b17          	auipc	s6,0x110e1
   e:	5501                	.insn	2, 0x5501
  10:	02000017          	auipc	zero,0x2000
  14:	012e                	.insn	2, 0x012e
  16:	0111                	.insn	2, 0x0111
  18:	0612                	.insn	2, 0x0612
  1a:	1840                	.insn	2, 0x1840
  1c:	31194297          	auipc	t0,0x31194
  20:	03000013          	li	zero,48
  24:	0034                	.insn	2, 0x0034
  26:	13490e03          	lb	t3,308(s2)
  2a:	0b3a                	.insn	2, 0x0b3a
  2c:	18020b3b          	.insn	4, 0x18020b3b
  30:	0000                	.insn	2, 0x0000
  32:	0504                	.insn	2, 0x0504
  34:	0200                	.insn	2, 0x0200
  36:	00133117          	auipc	sp,0x133
  3a:	0500                	.insn	2, 0x0500
  3c:	0034                	.insn	2, 0x0034
  3e:	1702                	.insn	2, 0x1702
  40:	1331                	.insn	2, 0x1331
  42:	0000                	.insn	2, 0x0000
  44:	8906                	.insn	2, 0x8906
  46:	0182                	.insn	2, 0x0182
  48:	3100                	.insn	2, 0x3100
  4a:	00011113          	slli	sp,sp,0x0
  4e:	0700                	.insn	2, 0x0700
  50:	0024                	.insn	2, 0x0024
  52:	0b3e0e03          	lb	t3,179(t3)
  56:	00000b0b          	.insn	4, 0x0b0b
  5a:	1608                	.insn	2, 0x1608
  5c:	4900                	.insn	2, 0x4900
  5e:	3a0e0313          	addi	t1,t3,928
  62:	000b3b0b          	.insn	4, 0x000b3b0b
  66:	0900                	.insn	2, 0x0900
  68:	0034                	.insn	2, 0x0034
  6a:	1349                	.insn	2, 0x1349
  6c:	0b3a                	.insn	2, 0x0b3a
  6e:	18020b3b          	.insn	4, 0x18020b3b
  72:	0000                	.insn	2, 0x0000
  74:	010a                	.insn	2, 0x010a
  76:	4901                	.insn	2, 0x4901
  78:	0b000013          	li	zero,176
  7c:	0021                	.insn	2, 0x0021
  7e:	1349                	.insn	2, 0x1349
  80:	00000b37          	lui	s6,0x0
  84:	240c                	.insn	2, 0x240c
  86:	0300                	.insn	2, 0x0300
  88:	0b0e                	.insn	2, 0x0b0e
  8a:	000b3e0b          	.insn	4, 0x000b3e0b
  8e:	0d00                	.insn	2, 0x0d00
  90:	0034                	.insn	2, 0x0034
  92:	1349                	.insn	2, 0x1349
  94:	0b3a                	.insn	2, 0x0b3a
  96:	1802053b          	.insn	4, 0x1802053b
  9a:	0000                	.insn	2, 0x0000
  9c:	210e                	.insn	2, 0x210e
  9e:	4900                	.insn	2, 0x4900
  a0:	00053713          	sltiu	a4,a0,0
  a4:	0f00                	.insn	2, 0x0f00
  a6:	0034                	.insn	2, 0x0034
  a8:	13490e03          	lb	t3,308(s2)
  ac:	0b3a193f 18020b3b 	.insn	8, 0x18020b3b0b3a193f
  b4:	0000                	.insn	2, 0x0000
  b6:	1310                	.insn	2, 0x1310
  b8:	0301                	.insn	2, 0x0301
  ba:	0b0e                	.insn	2, 0x0b0e
  bc:	3a05                	.insn	2, 0x3a05
  be:	000b3b0b          	.insn	4, 0x000b3b0b
  c2:	1100                	.insn	2, 0x1100
  c4:	000d                	.insn	2, 0x000d
  c6:	13490e03          	lb	t3,308(s2)
  ca:	0b3a                	.insn	2, 0x0b3a
  cc:	0b380b3b          	.insn	4, 0x0b380b3b
  d0:	0000                	.insn	2, 0x0000
  d2:	0f12                	.insn	2, 0x0f12
  d4:	4900                	.insn	2, 0x4900
  d6:	13000013          	li	zero,304
  da:	0e030013          	addi	zero,t1,224
  de:	193c                	.insn	2, 0x193c
  e0:	0000                	.insn	2, 0x0000
  e2:	1614                	.insn	2, 0x1614
  e4:	4900                	.insn	2, 0x4900
  e6:	3a0e0313          	addi	t1,t3,928
  ea:	00053b0b          	.insn	4, 0x00053b0b
  ee:	1500                	.insn	2, 0x1500
  f0:	0000000f          	fence	unknown,unknown
  f4:	2616                	.insn	2, 0x2616
  f6:	4900                	.insn	2, 0x4900
  f8:	17000013          	li	zero,368
  fc:	0015                	.insn	2, 0x0015
  fe:	00001927          	.insn	4, 0x1927
 102:	2618                	.insn	2, 0x2618
 104:	0000                	.insn	2, 0x0000
 106:	1900                	.insn	2, 0x1900
 108:	0035                	.insn	2, 0x0035
 10a:	1349                	.insn	2, 0x1349
 10c:	0000                	.insn	2, 0x0000
 10e:	2e1a                	.insn	2, 0x2e1a
 110:	0301                	.insn	2, 0x0301
 112:	3a0e                	.insn	2, 0x3a0e
 114:	270b3b0b          	.insn	4, 0x270b3b0b
 118:	4919                	.insn	2, 0x4919
 11a:	000b2013          	slti	zero,s6,0
 11e:	1b00                	.insn	2, 0x1b00
 120:	0005                	.insn	2, 0x0005
 122:	0b3a0e03          	lb	t3,179(s4)
 126:	13490b3b          	.insn	4, 0x13490b3b
 12a:	0000                	.insn	2, 0x0000
 12c:	2e1c                	.insn	2, 0x2e1c
 12e:	0301                	.insn	2, 0x0301
 130:	3a0e                	.insn	2, 0x3a0e
 132:	270b3b0b          	.insn	4, 0x270b3b0b
 136:	2019                	.insn	2, 0x2019
 138:	1d00000b          	.insn	4, 0x1d00000b
 13c:	012e                	.insn	2, 0x012e
 13e:	0111                	.insn	2, 0x0111
 140:	0612                	.insn	2, 0x0612
 142:	1840                	.insn	2, 0x1840
 144:	03194297          	auipc	t0,0x3194
 148:	3a0e                	.insn	2, 0x3a0e
 14a:	270b3b0b          	.insn	4, 0x270b3b0b
 14e:	3f19                	.insn	2, 0x3f19
 150:	0019                	.insn	2, 0x0019
 152:	1e00                	.insn	2, 0x1e00
 154:	0005                	.insn	2, 0x0005
 156:	1802                	.insn	2, 0x1802
 158:	0b3a0e03          	lb	t3,179(s4)
 15c:	13490b3b          	.insn	4, 0x13490b3b
 160:	0000                	.insn	2, 0x0000
 162:	1d1f 3101 1113      	.insn	6, 0x111331011d1f
 168:	1201                	.insn	2, 0x1201
 16a:	5806                	.insn	2, 0x5806
 16c:	570b590b          	.insn	4, 0x570b590b
 170:	2000000b          	.insn	4, 0x2000000b
 174:	0005                	.insn	2, 0x0005
 176:	0f1c                	.insn	2, 0x0f1c
 178:	1331                	.insn	2, 0x1331
 17a:	0000                	.insn	2, 0x0000
 17c:	0521                	.insn	2, 0x0521
 17e:	0200                	.insn	2, 0x0200
 180:	3118                	.insn	2, 0x3118
 182:	22000013          	li	zero,544
 186:	012e                	.insn	2, 0x012e
 188:	0b3a0e03          	lb	t3,179(s4)
 18c:	19270b3b          	.insn	4, 0x19270b3b
 190:	193c                	.insn	2, 0x193c
 192:	0000193f 49000523 	.insn	8, 0x490005230000193f
 19a:	24000013          	li	zero,576
 19e:	0018                	.insn	2, 0x0018
 1a0:	0000                	.insn	2, 0x0000
 1a2:	2e25                	.insn	2, 0x2e25
 1a4:	0301                	.insn	2, 0x0301
 1a6:	3a0e                	.insn	2, 0x3a0e
 1a8:	270b3b0b          	.insn	4, 0x270b3b0b
 1ac:	4919                	.insn	2, 0x4919
 1ae:	3f193c13          	sltiu	s8,s2,1009
 1b2:	0019                	.insn	2, 0x0019
 1b4:	2600                	.insn	2, 0x2600
 1b6:	002e                	.insn	2, 0x002e
 1b8:	0111                	.insn	2, 0x0111
 1ba:	0612                	.insn	2, 0x0612
 1bc:	1840                	.insn	2, 0x1840
 1be:	03194297          	auipc	t0,0x3194
 1c2:	3a0e                	.insn	2, 0x3a0e
 1c4:	270b3b0b          	.insn	4, 0x270b3b0b
 1c8:	3f19                	.insn	2, 0x3f19
 1ca:	0019                	.insn	2, 0x0019
 1cc:	2700                	.insn	2, 0x2700
 1ce:	002e                	.insn	2, 0x002e
 1d0:	0111                	.insn	2, 0x0111
 1d2:	0612                	.insn	2, 0x0612
 1d4:	1840                	.insn	2, 0x1840
 1d6:	03194297          	auipc	t0,0x3194
 1da:	3a0e                	.insn	2, 0x3a0e
 1dc:	27053b0b          	.insn	4, 0x27053b0b
 1e0:	3f19                	.insn	2, 0x3f19
 1e2:	0019                	.insn	2, 0x0019
 1e4:	2800                	.insn	2, 0x2800
 1e6:	012e                	.insn	2, 0x012e
 1e8:	0b3a0e03          	lb	t3,179(s4)
 1ec:	19270b3b          	.insn	4, 0x19270b3b
 1f0:	1349                	.insn	2, 0x1349
 1f2:	0b20193f 34290000 	.insn	8, 0x342900000b20193f
 1fa:	0300                	.insn	2, 0x0300
 1fc:	3a0e                	.insn	2, 0x3a0e
 1fe:	490b3b0b          	.insn	4, 0x490b3b0b
 202:	2a000013          	li	zero,672
 206:	0034                	.insn	2, 0x0034
 208:	1331                	.insn	2, 0x1331
 20a:	0000                	.insn	2, 0x0000
 20c:	11010b2b          	.insn	4, 0x11010b2b
 210:	1201                	.insn	2, 0x1201
 212:	0006                	.insn	2, 0x0006
 214:	2c00                	.insn	2, 0x2c00
 216:	011d                	.insn	2, 0x011d
 218:	1331                	.insn	2, 0x1331
 21a:	0111                	.insn	2, 0x0111
 21c:	0612                	.insn	2, 0x0612
 21e:	0b58                	.insn	2, 0x0b58
 220:	0559                	.insn	2, 0x0559
 222:	00000b57          	.insn	4, 0x0b57
 226:	2e2d                	.insn	2, 0x2e2d
 228:	0301                	.insn	2, 0x0301
 22a:	3a0e                	.insn	2, 0x3a0e
 22c:	27053b0b          	.insn	4, 0x27053b0b
 230:	3f19                	.insn	2, 0x3f19
 232:	2019                	.insn	2, 0x2019
 234:	2e00000b          	.insn	4, 0x2e00000b
 238:	0005                	.insn	2, 0x0005
 23a:	0b3a0e03          	lb	t3,179(s4)
 23e:	1349053b          	.insn	4, 0x1349053b
 242:	0000                	.insn	2, 0x0000
 244:	0300342f          	.insn	4, 0x0300342f
 248:	3a0e                	.insn	2, 0x3a0e
 24a:	49053b0b          	.insn	4, 0x49053b0b
 24e:	30000013          	li	zero,768
 252:	0000010b          	.insn	4, 0x010b
 256:	2e31                	.insn	2, 0x2e31
 258:	1101                	.insn	2, 0x1101
 25a:	1201                	.insn	2, 0x1201
 25c:	4006                	.insn	2, 0x4006
 25e:	9718                	.insn	2, 0x9718
 260:	1942                	.insn	2, 0x1942
 262:	0b3a0e03          	lb	t3,179(s4)
 266:	1927053b          	.insn	4, 0x1927053b
 26a:	1349                	.insn	2, 0x1349
 26c:	0000193f 02000532 	.insn	8, 0x020005320000193f
 274:	3a0e0317          	auipc	t1,0x3a0e0
 278:	49053b0b          	.insn	4, 0x49053b0b
 27c:	33000013          	li	zero,816
 280:	0034                	.insn	2, 0x0034
 282:	1702                	.insn	2, 0x1702
 284:	0b3a0e03          	lb	t3,179(s4)
 288:	1349053b          	.insn	4, 0x1349053b
 28c:	0000                	.insn	2, 0x0000
 28e:	1d34                	.insn	2, 0x1d34
 290:	3101                	.insn	2, 0x3101
 292:	58175513          	.insn	4, 0x58175513
 296:	5705590b          	.insn	4, 0x5705590b
 29a:	3500000b          	.insn	4, 0x3500000b
 29e:	0034                	.insn	2, 0x0034
 2a0:	0f1c                	.insn	2, 0x0f1c
 2a2:	1331                	.insn	2, 0x1331
 2a4:	0000                	.insn	2, 0x0000
 2a6:	0b36                	.insn	2, 0x0b36
 2a8:	5501                	.insn	2, 0x5501
 2aa:	37000017          	auipc	zero,0x37000
 2ae:	0034                	.insn	2, 0x0034
 2b0:	1802                	.insn	2, 0x1802
 2b2:	0b3a0e03          	lb	t3,179(s4)
 2b6:	1349053b          	.insn	4, 0x1349053b
 2ba:	0000                	.insn	2, 0x0000
 2bc:	2e38                	.insn	2, 0x2e38
 2be:	1101                	.insn	2, 0x1101
 2c0:	1201                	.insn	2, 0x1201
 2c2:	4006                	.insn	2, 0x4006
 2c4:	9718                	.insn	2, 0x9718
 2c6:	1942                	.insn	2, 0x1942
 2c8:	0b3a0e03          	lb	t3,179(s4)
 2cc:	1927053b          	.insn	4, 0x1927053b
 2d0:	0000193f 03012e39 	.insn	8, 0x03012e390000193f
 2d8:	3a0e                	.insn	2, 0x3a0e
 2da:	270b3b0b          	.insn	4, 0x270b3b0b
 2de:	3f19                	.insn	2, 0x3f19
 2e0:	2019                	.insn	2, 0x2019
 2e2:	3a00000b          	.insn	4, 0x3a00000b
 2e6:	002e                	.insn	2, 0x002e
 2e8:	0b3a0e03          	lb	t3,179(s4)
 2ec:	19270b3b          	.insn	4, 0x19270b3b
 2f0:	1349                	.insn	2, 0x1349
 2f2:	0b20193f 2e3b0000 	.insn	8, 0x2e3b00000b20193f
 2fa:	0301                	.insn	2, 0x0301
 2fc:	3a0e                	.insn	2, 0x3a0e
 2fe:	27053b0b          	.insn	4, 0x27053b0b
 302:	3f19                	.insn	2, 0x3f19
 304:	8719                	.insn	2, 0x8719
 306:	1901                	.insn	2, 0x1901
 308:	0b20                	.insn	2, 0x0b20
 30a:	0000                	.insn	2, 0x0000
 30c:	1d3c                	.insn	2, 0x1d3c
 30e:	3100                	.insn	2, 0x3100
 310:	12011113          	.insn	4, 0x12011113
 314:	5806                	.insn	2, 0x5806
 316:	5705590b          	.insn	4, 0x5705590b
 31a:	3d00000b          	.insn	4, 0x3d00000b
 31e:	8289                	.insn	2, 0x8289
 320:	0001                	.insn	2, 0x0001
 322:	1331                	.insn	2, 0x1331
 324:	4295                	.insn	2, 0x4295
 326:	1119                	.insn	2, 0x1119
 328:	0001                	.insn	2, 0x0001
 32a:	3e00                	.insn	2, 0x3e00
 32c:	012e                	.insn	2, 0x012e
 32e:	0b3a0e03          	lb	t3,179(s4)
 332:	1927053b          	.insn	4, 0x1927053b
 336:	1349                	.insn	2, 0x1349
 338:	0b20                	.insn	2, 0x0b20
 33a:	0000                	.insn	2, 0x0000
 33c:	0301133f 3a0b0b0e 	.insn	8, 0x3a0b0b0e0301133f
 344:	000b3b0b          	.insn	4, 0x000b3b0b
	...

0000034a <$d.3>:
 34a:	1101                	.insn	2, 0x1101
 34c:	2501                	.insn	2, 0x2501
 34e:	130e                	.insn	2, 0x130e
 350:	0305                	.insn	2, 0x0305
 352:	100e                	.insn	2, 0x100e
 354:	110e1b17          	auipc	s6,0x110e1
 358:	1201                	.insn	2, 0x1201
 35a:	0006                	.insn	2, 0x0006
 35c:	0200                	.insn	2, 0x0200
 35e:	0034                	.insn	2, 0x0034
 360:	1349                	.insn	2, 0x1349
 362:	0b3a                	.insn	2, 0x0b3a
 364:	18020b3b          	.insn	4, 0x18020b3b
 368:	0000                	.insn	2, 0x0000
 36a:	49010103          	lb	sp,1168(sp) # 1334c6 <_binary_shell_bin_size+0x111136>
 36e:	04000013          	li	zero,64
 372:	0021                	.insn	2, 0x0021
 374:	1349                	.insn	2, 0x1349
 376:	00000b37          	lui	s6,0x0
 37a:	2405                	.insn	2, 0x2405
 37c:	0300                	.insn	2, 0x0300
 37e:	3e0e                	.insn	2, 0x3e0e
 380:	000b0b0b          	.insn	4, 0x000b0b0b
 384:	0600                	.insn	2, 0x0600
 386:	0024                	.insn	2, 0x0024
 388:	0b0b0e03          	lb	t3,176(s6) # b0 <$d.7+0xb0>
 38c:	0b3e                	.insn	2, 0x0b3e
 38e:	0000                	.insn	2, 0x0000
 390:	49003407          	.insn	4, 0x49003407
 394:	3b0b3a13          	sltiu	s4,s6,944
 398:	0205                	.insn	2, 0x0205
 39a:	0018                	.insn	2, 0x0018
 39c:	0800                	.insn	2, 0x0800
 39e:	012e                	.insn	2, 0x012e
 3a0:	0000                	.insn	2, 0x0000
 3a2:	3409                	.insn	2, 0x3409
 3a4:	0300                	.insn	2, 0x0300
 3a6:	490e                	.insn	2, 0x490e
 3a8:	3b0b3a13          	sltiu	s4,s6,944
 3ac:	0018020b          	.insn	4, 0x0018020b
 3b0:	0a00                	.insn	2, 0x0a00
 3b2:	0026                	.insn	2, 0x0026
 3b4:	1349                	.insn	2, 0x1349
 3b6:	0000                	.insn	2, 0x0000
 3b8:	49000f0b          	.insn	4, 0x49000f0b
 3bc:	0c000013          	li	zero,192
 3c0:	0016                	.insn	2, 0x0016
 3c2:	1349                	.insn	2, 0x1349
 3c4:	0b3a0e03          	lb	t3,179(s4)
 3c8:	00000b3b          	.insn	4, 0x0b3b
 3cc:	260d                	.insn	2, 0x260d
 3ce:	0000                	.insn	2, 0x0000
 3d0:	0e00                	.insn	2, 0x0e00
 3d2:	012e                	.insn	2, 0x012e
 3d4:	0111                	.insn	2, 0x0111
 3d6:	0612                	.insn	2, 0x0612
 3d8:	1840                	.insn	2, 0x1840
 3da:	03194297          	auipc	t0,0x3194
 3de:	3a0e                	.insn	2, 0x3a0e
 3e0:	270b3b0b          	.insn	4, 0x270b3b0b
 3e4:	4919                	.insn	2, 0x4919
 3e6:	00193f13          	seqz	t5,s2
 3ea:	0f00                	.insn	2, 0x0f00
 3ec:	0005                	.insn	2, 0x0005
 3ee:	1802                	.insn	2, 0x1802
 3f0:	0b3a0e03          	lb	t3,179(s4)
 3f4:	13490b3b          	.insn	4, 0x13490b3b
 3f8:	0000                	.insn	2, 0x0000
 3fa:	0510                	.insn	2, 0x0510
 3fc:	0200                	.insn	2, 0x0200
 3fe:	3a0e0317          	auipc	t1,0x3a0e0
 402:	490b3b0b          	.insn	4, 0x490b3b0b
 406:	11000013          	li	zero,272
 40a:	0034                	.insn	2, 0x0034
 40c:	1702                	.insn	2, 0x1702
 40e:	0b3a0e03          	lb	t3,179(s4)
 412:	13490b3b          	.insn	4, 0x13490b3b
 416:	0000                	.insn	2, 0x0000
 418:	3412                	.insn	2, 0x3412
 41a:	0200                	.insn	2, 0x0200
 41c:	0318                	.insn	2, 0x0318
 41e:	3a0e                	.insn	2, 0x3a0e
 420:	490b3b0b          	.insn	4, 0x490b3b0b
 424:	13000013          	li	zero,304
 428:	012e                	.insn	2, 0x012e
 42a:	0b3a0e03          	lb	t3,179(s4)
 42e:	19270b3b          	.insn	4, 0x19270b3b
 432:	1349                	.insn	2, 0x1349
 434:	0b20                	.insn	2, 0x0b20
 436:	0000                	.insn	2, 0x0000
 438:	0514                	.insn	2, 0x0514
 43a:	0300                	.insn	2, 0x0300
 43c:	3a0e                	.insn	2, 0x3a0e
 43e:	490b3b0b          	.insn	4, 0x490b3b0b
 442:	15000013          	li	zero,336
 446:	0034                	.insn	2, 0x0034
 448:	0b3a0e03          	lb	t3,179(s4)
 44c:	13490b3b          	.insn	4, 0x13490b3b
 450:	0000                	.insn	2, 0x0000
 452:	0b16                	.insn	2, 0x0b16
 454:	0001                	.insn	2, 0x0001
 456:	1700                	.insn	2, 0x1700
 458:	012e                	.insn	2, 0x012e
 45a:	0111                	.insn	2, 0x0111
 45c:	0612                	.insn	2, 0x0612
 45e:	1840                	.insn	2, 0x1840
 460:	03194297          	auipc	t0,0x3194
 464:	3a0e                	.insn	2, 0x3a0e
 466:	270b3b0b          	.insn	4, 0x270b3b0b
 46a:	3f19                	.insn	2, 0x3f19
 46c:	0019                	.insn	2, 0x0019
 46e:	1800                	.insn	2, 0x1800
 470:	0111010b          	.insn	4, 0x0111010b
 474:	0612                	.insn	2, 0x0612
 476:	0000                	.insn	2, 0x0000
 478:	1d19                	.insn	2, 0x1d19
 47a:	3101                	.insn	2, 0x3101
 47c:	12011113          	.insn	4, 0x12011113
 480:	5806                	.insn	2, 0x5806
 482:	570b590b          	.insn	4, 0x570b590b
 486:	1a00000b          	.insn	4, 0x1a00000b
 48a:	0034                	.insn	2, 0x0034
 48c:	1702                	.insn	2, 0x1702
 48e:	1331                	.insn	2, 0x1331
 490:	0000                	.insn	2, 0x0000
 492:	0200341b          	.insn	4, 0x0200341b
 496:	3118                	.insn	2, 0x3118
 498:	1c000013          	li	zero,448
 49c:	8289                	.insn	2, 0x8289
 49e:	0001                	.insn	2, 0x0001
 4a0:	1331                	.insn	2, 0x1331
 4a2:	4295                	.insn	2, 0x4295
 4a4:	1119                	.insn	2, 0x1119
 4a6:	0001                	.insn	2, 0x0001
 4a8:	1d00                	.insn	2, 0x1d00
 4aa:	8289                	.insn	2, 0x8289
 4ac:	0001                	.insn	2, 0x0001
 4ae:	1331                	.insn	2, 0x1331
 4b0:	0111                	.insn	2, 0x0111
 4b2:	0000                	.insn	2, 0x0000
 4b4:	2e1e                	.insn	2, 0x2e1e
 4b6:	0301                	.insn	2, 0x0301
 4b8:	3a0e                	.insn	2, 0x3a0e
 4ba:	270b3b0b          	.insn	4, 0x270b3b0b
 4be:	3c19                	.insn	2, 0x3c19
 4c0:	3f19                	.insn	2, 0x3f19
 4c2:	0019                	.insn	2, 0x0019
 4c4:	1f00                	.insn	2, 0x1f00
 4c6:	0005                	.insn	2, 0x0005
 4c8:	1349                	.insn	2, 0x1349
 4ca:	0000                	.insn	2, 0x0000
 4cc:	0a20                	.insn	2, 0x0a20
 4ce:	0300                	.insn	2, 0x0300
 4d0:	3a0e                	.insn	2, 0x3a0e
 4d2:	110b3b0b          	.insn	4, 0x110b3b0b
 4d6:	0001                	.insn	2, 0x0001
 4d8:	2100                	.insn	2, 0x2100
 4da:	1755010b          	.insn	4, 0x1755010b
 4de:	0000                	.insn	2, 0x0000
 4e0:	1822                	.insn	2, 0x1822
 4e2:	0000                	.insn	2, 0x0000
 4e4:	2300                	.insn	2, 0x2300
 4e6:	012e                	.insn	2, 0x012e
 4e8:	0111                	.insn	2, 0x0111
 4ea:	0612                	.insn	2, 0x0612
 4ec:	1840                	.insn	2, 0x1840
 4ee:	31194297          	auipc	t0,0x31194
 4f2:	24000013          	li	zero,576
 4f6:	0005                	.insn	2, 0x0005
 4f8:	1702                	.insn	2, 0x1702
 4fa:	1331                	.insn	2, 0x1331
 4fc:	0000                	.insn	2, 0x0000
 4fe:	0525                	.insn	2, 0x0525
 500:	0200                	.insn	2, 0x0200
 502:	3118                	.insn	2, 0x3118
 504:	26000013          	li	zero,608
 508:	012e                	.insn	2, 0x012e
 50a:	0b3a0e03          	lb	t3,179(s4)
 50e:	19270b3b          	.insn	4, 0x19270b3b
 512:	0b20                	.insn	2, 0x0b20
 514:	0000                	.insn	2, 0x0000
 516:	31011d27          	.insn	4, 0x31011d27
 51a:	58175513          	.insn	4, 0x58175513
 51e:	570b590b          	.insn	4, 0x570b590b
 522:	2800000b          	.insn	4, 0x2800000b
 526:	001d                	.insn	2, 0x001d
 528:	1331                	.insn	2, 0x1331
 52a:	0111                	.insn	2, 0x0111
 52c:	0612                	.insn	2, 0x0612
 52e:	0b58                	.insn	2, 0x0b58
 530:	0b59                	.insn	2, 0x0b59
 532:	00000b57          	.insn	4, 0x0b57
 536:	3429                	.insn	2, 0x3429
 538:	0200                	.insn	2, 0x0200
 53a:	3a0e0317          	auipc	t1,0x3a0e0
 53e:	49053b0b          	.insn	4, 0x49053b0b
 542:	2a000013          	li	zero,672
 546:	012e                	.insn	2, 0x012e
 548:	0b3a0e03          	lb	t3,179(s4)
 54c:	19270b3b          	.insn	4, 0x19270b3b
 550:	1349                	.insn	2, 0x1349
 552:	0b20193f 2e2b0000 	.insn	8, 0x2e2b00000b20193f
 55a:	1101                	.insn	2, 0x1101
 55c:	1201                	.insn	2, 0x1201
 55e:	4006                	.insn	2, 0x4006
 560:	9718                	.insn	2, 0x9718
 562:	1942                	.insn	2, 0x1942
 564:	0b3a0e03          	lb	t3,179(s4)
 568:	1927053b          	.insn	4, 0x1927053b
 56c:	0000193f 0200052c 	.insn	8, 0x0200052c0000193f
 574:	3a0e0317          	auipc	t1,0x3a0e0
 578:	49053b0b          	.insn	4, 0x49053b0b
 57c:	2d000013          	li	zero,720
 580:	0034                	.insn	2, 0x0034
 582:	0f1c                	.insn	2, 0x0f1c
 584:	0b3a0e03          	lb	t3,179(s4)
 588:	1349053b          	.insn	4, 0x1349053b
 58c:	0000                	.insn	2, 0x0000
 58e:	1d2e                	.insn	2, 0x1d2e
 590:	3101                	.insn	2, 0x3101
 592:	58175513          	.insn	4, 0x58175513
 596:	5705590b          	.insn	4, 0x5705590b
 59a:	2f00000b          	.insn	4, 0x2f00000b
 59e:	0000000f          	fence	unknown,unknown
 5a2:	1630                	.insn	2, 0x1630
 5a4:	4900                	.insn	2, 0x4900
 5a6:	000e0313          	mv	t1,t3
	...

000005ac <$d.5>:
 5ac:	1101                	.insn	2, 0x1101
 5ae:	2501                	.insn	2, 0x2501
 5b0:	130e                	.insn	2, 0x130e
 5b2:	0305                	.insn	2, 0x0305
 5b4:	100e                	.insn	2, 0x100e
 5b6:	110e1b17          	auipc	s6,0x110e1
 5ba:	1201                	.insn	2, 0x1201
 5bc:	0006                	.insn	2, 0x0006
 5be:	0200                	.insn	2, 0x0200
 5c0:	012e                	.insn	2, 0x012e
 5c2:	0111                	.insn	2, 0x0111
 5c4:	0612                	.insn	2, 0x0612
 5c6:	1840                	.insn	2, 0x1840
 5c8:	03194297          	auipc	t0,0x3194
 5cc:	3a0e                	.insn	2, 0x3a0e
 5ce:	27053b0b          	.insn	4, 0x27053b0b
 5d2:	3f19                	.insn	2, 0x3f19
 5d4:	0019                	.insn	2, 0x0019
 5d6:	0300                	.insn	2, 0x0300
 5d8:	0034                	.insn	2, 0x0034
 5da:	13490e03          	lb	t3,308(s2)
 5de:	0b3a                	.insn	2, 0x0b3a
 5e0:	1802053b          	.insn	4, 0x1802053b
 5e4:	0000                	.insn	2, 0x0000
 5e6:	0504                	.insn	2, 0x0504
 5e8:	0200                	.insn	2, 0x0200
 5ea:	3a0e0317          	auipc	t1,0x3a0e0
 5ee:	49053b0b          	.insn	4, 0x49053b0b
 5f2:	05000013          	li	zero,80
 5f6:	0111010b          	.insn	4, 0x0111010b
 5fa:	0612                	.insn	2, 0x0612
 5fc:	0000                	.insn	2, 0x0000
 5fe:	3406                	.insn	2, 0x3406
 600:	0200                	.insn	2, 0x0200
 602:	3a0e0317          	auipc	t1,0x3a0e0
 606:	49053b0b          	.insn	4, 0x49053b0b
 60a:	07000013          	li	zero,112
 60e:	8289                	.insn	2, 0x8289
 610:	0001                	.insn	2, 0x0001
 612:	1331                	.insn	2, 0x1331
 614:	0111                	.insn	2, 0x0111
 616:	0000                	.insn	2, 0x0000
 618:	8908                	.insn	2, 0x8908
 61a:	0182                	.insn	2, 0x0182
 61c:	3100                	.insn	2, 0x3100
 61e:	19429513          	.insn	4, 0x19429513
 622:	0111                	.insn	2, 0x0111
 624:	0000                	.insn	2, 0x0000
 626:	0109                	.insn	2, 0x0109
 628:	4901                	.insn	2, 0x4901
 62a:	0a000013          	li	zero,160
 62e:	0021                	.insn	2, 0x0021
 630:	1349                	.insn	2, 0x1349
 632:	00000b37          	lui	s6,0x0
 636:	4900160b          	.insn	4, 0x4900160b
 63a:	3a0e0313          	addi	t1,t3,928
 63e:	000b3b0b          	.insn	4, 0x000b3b0b
 642:	0c00                	.insn	2, 0x0c00
 644:	0024                	.insn	2, 0x0024
 646:	0b3e0e03          	lb	t3,179(t3)
 64a:	00000b0b          	.insn	4, 0x0b0b
 64e:	240d                	.insn	2, 0x240d
 650:	0300                	.insn	2, 0x0300
 652:	0b0e                	.insn	2, 0x0b0e
 654:	000b3e0b          	.insn	4, 0x000b3e0b
 658:	0e00                	.insn	2, 0x0e00
 65a:	0034                	.insn	2, 0x0034
 65c:	1349                	.insn	2, 0x1349
 65e:	0b3a                	.insn	2, 0x0b3a
 660:	1802053b          	.insn	4, 0x1802053b
 664:	0000                	.insn	2, 0x0000
 666:	49000f0f          	.insn	4, 0x49000f0f
 66a:	10000013          	li	zero,256
 66e:	0035                	.insn	2, 0x0035
 670:	1349                	.insn	2, 0x1349
 672:	0000                	.insn	2, 0x0000
 674:	2e11                	.insn	2, 0x2e11
 676:	0301                	.insn	2, 0x0301
 678:	3a0e                	.insn	2, 0x3a0e
 67a:	270b3b0b          	.insn	4, 0x270b3b0b
 67e:	2019                	.insn	2, 0x2019
 680:	1200000b          	.insn	4, 0x1200000b
 684:	0005                	.insn	2, 0x0005
 686:	0b3a0e03          	lb	t3,179(s4)
 68a:	13490b3b          	.insn	4, 0x13490b3b
 68e:	0000                	.insn	2, 0x0000
 690:	00010b13          	mv	s6,sp
 694:	1400                	.insn	2, 0x1400
 696:	0034                	.insn	2, 0x0034
 698:	0b3a0e03          	lb	t3,179(s4)
 69c:	13490b3b          	.insn	4, 0x13490b3b
 6a0:	0000                	.insn	2, 0x0000
 6a2:	2615                	.insn	2, 0x2615
 6a4:	4900                	.insn	2, 0x4900
 6a6:	16000013          	li	zero,352
 6aa:	012e                	.insn	2, 0x012e
 6ac:	0111                	.insn	2, 0x0111
 6ae:	0612                	.insn	2, 0x0612
 6b0:	1840                	.insn	2, 0x1840
 6b2:	03194297          	auipc	t0,0x3194
 6b6:	3a0e                	.insn	2, 0x3a0e
 6b8:	270b3b0b          	.insn	4, 0x270b3b0b
 6bc:	3f19                	.insn	2, 0x3f19
 6be:	0019                	.insn	2, 0x0019
 6c0:	1700                	.insn	2, 0x1700
 6c2:	0005                	.insn	2, 0x0005
 6c4:	1702                	.insn	2, 0x1702
 6c6:	0b3a0e03          	lb	t3,179(s4)
 6ca:	13490b3b          	.insn	4, 0x13490b3b
 6ce:	0000                	.insn	2, 0x0000
 6d0:	3418                	.insn	2, 0x3418
 6d2:	0200                	.insn	2, 0x0200
 6d4:	3a0e0317          	auipc	t1,0x3a0e0
 6d8:	490b3b0b          	.insn	4, 0x490b3b0b
 6dc:	19000013          	li	zero,400
 6e0:	0034                	.insn	2, 0x0034
 6e2:	1802                	.insn	2, 0x1802
 6e4:	0b3a0e03          	lb	t3,179(s4)
 6e8:	13490b3b          	.insn	4, 0x13490b3b
 6ec:	0000                	.insn	2, 0x0000
 6ee:	1d1a                	.insn	2, 0x1d1a
 6f0:	3101                	.insn	2, 0x3101
 6f2:	12011113          	.insn	4, 0x12011113
 6f6:	5806                	.insn	2, 0x5806
 6f8:	570b590b          	.insn	4, 0x570b590b
 6fc:	1b00000b          	.insn	4, 0x1b00000b
 700:	0005                	.insn	2, 0x0005
 702:	1802                	.insn	2, 0x1802
 704:	1331                	.insn	2, 0x1331
 706:	0000                	.insn	2, 0x0000
 708:	341c                	.insn	2, 0x341c
 70a:	0200                	.insn	2, 0x0200
 70c:	00133117          	auipc	sp,0x133
 710:	1d00                	.insn	2, 0x1d00
 712:	011d                	.insn	2, 0x011d
 714:	1331                	.insn	2, 0x1331
 716:	1755                	.insn	2, 0x1755
 718:	0b58                	.insn	2, 0x0b58
 71a:	0b59                	.insn	2, 0x0b59
 71c:	00000b57          	.insn	4, 0x0b57
 720:	0b1e                	.insn	2, 0x0b1e
 722:	5501                	.insn	2, 0x5501
 724:	1f000017          	auipc	zero,0x1f000
 728:	011d                	.insn	2, 0x011d
 72a:	1331                	.insn	2, 0x1331
 72c:	1755                	.insn	2, 0x1755
 72e:	0b58                	.insn	2, 0x0b58
 730:	0559                	.insn	2, 0x0559
 732:	00000b57          	.insn	4, 0x0b57
 736:	1d20                	.insn	2, 0x1d20
 738:	3101                	.insn	2, 0x3101
 73a:	12011113          	.insn	4, 0x12011113
 73e:	5806                	.insn	2, 0x5806
 740:	5705590b          	.insn	4, 0x5705590b
 744:	2100000b          	.insn	4, 0x2100000b
 748:	0034                	.insn	2, 0x0034
 74a:	0f1c                	.insn	2, 0x0f1c
 74c:	1331                	.insn	2, 0x1331
 74e:	0000                	.insn	2, 0x0000
 750:	2e22                	.insn	2, 0x2e22
 752:	1100                	.insn	2, 0x1100
 754:	1201                	.insn	2, 0x1201
 756:	4006                	.insn	2, 0x4006
 758:	9718                	.insn	2, 0x9718
 75a:	1942                	.insn	2, 0x1942
 75c:	0b3a0e03          	lb	t3,179(s4)
 760:	1349053b          	.insn	4, 0x1349053b
 764:	0000193f 03012e23 	.insn	8, 0x03012e230000193f
 76c:	3a0e                	.insn	2, 0x3a0e
 76e:	270b3b0b          	.insn	4, 0x270b3b0b
 772:	3c19                	.insn	2, 0x3c19
 774:	3f19                	.insn	2, 0x3f19
 776:	0019                	.insn	2, 0x0019
 778:	2400                	.insn	2, 0x2400
 77a:	0005                	.insn	2, 0x0005
 77c:	1349                	.insn	2, 0x1349
 77e:	0000                	.insn	2, 0x0000
 780:	1825                	.insn	2, 0x1825
 782:	0000                	.insn	2, 0x0000
	...

00000786 <$d.3>:
 786:	1101                	.insn	2, 0x1101
 788:	2501                	.insn	2, 0x2501
 78a:	130e                	.insn	2, 0x130e
 78c:	0305                	.insn	2, 0x0305
 78e:	100e                	.insn	2, 0x100e
 790:	110e1b17          	auipc	s6,0x110e1
 794:	1201                	.insn	2, 0x1201
 796:	0006                	.insn	2, 0x0006
 798:	0200                	.insn	2, 0x0200
 79a:	0034                	.insn	2, 0x0034
 79c:	1349                	.insn	2, 0x1349
 79e:	0b3a                	.insn	2, 0x0b3a
 7a0:	18020b3b          	.insn	4, 0x18020b3b
 7a4:	0000                	.insn	2, 0x0000
 7a6:	49010103          	lb	sp,1168(sp) # 133b9c <_binary_shell_bin_size+0x11180c>
 7aa:	04000013          	li	zero,64
 7ae:	0021                	.insn	2, 0x0021
 7b0:	1349                	.insn	2, 0x1349
 7b2:	00000b37          	lui	s6,0x0
 7b6:	2405                	.insn	2, 0x2405
 7b8:	0300                	.insn	2, 0x0300
 7ba:	3e0e                	.insn	2, 0x3e0e
 7bc:	000b0b0b          	.insn	4, 0x000b0b0b
 7c0:	0600                	.insn	2, 0x0600
 7c2:	0024                	.insn	2, 0x0024
 7c4:	0b0b0e03          	lb	t3,176(s6) # b0 <$d.7+0xb0>
 7c8:	0b3e                	.insn	2, 0x0b3e
 7ca:	0000                	.insn	2, 0x0000
 7cc:	49000f07          	.insn	4, 0x49000f07
 7d0:	08000013          	li	zero,128
 7d4:	0035                	.insn	2, 0x0035
 7d6:	1349                	.insn	2, 0x1349
 7d8:	0000                	.insn	2, 0x0000
 7da:	1609                	.insn	2, 0x1609
 7dc:	4900                	.insn	2, 0x4900
 7de:	3a0e0313          	addi	t1,t3,928
 7e2:	000b3b0b          	.insn	4, 0x000b3b0b
 7e6:	0a00                	.insn	2, 0x0a00
 7e8:	012e                	.insn	2, 0x012e
 7ea:	0b3a0e03          	lb	t3,179(s4)
 7ee:	19270b3b          	.insn	4, 0x19270b3b
 7f2:	1349                	.insn	2, 0x1349
 7f4:	0b20                	.insn	2, 0x0b20
 7f6:	0000                	.insn	2, 0x0000
 7f8:	0300050b          	.insn	4, 0x0300050b
 7fc:	3a0e                	.insn	2, 0x3a0e
 7fe:	490b3b0b          	.insn	4, 0x490b3b0b
 802:	0c000013          	li	zero,192
 806:	0034                	.insn	2, 0x0034
 808:	0b3a0e03          	lb	t3,179(s4)
 80c:	13490b3b          	.insn	4, 0x13490b3b
 810:	0000                	.insn	2, 0x0000
 812:	0b0d                	.insn	2, 0x0b0d
 814:	0001                	.insn	2, 0x0001
 816:	0e00                	.insn	2, 0x0e00
 818:	012e                	.insn	2, 0x012e
 81a:	0b3a0e03          	lb	t3,179(s4)
 81e:	19270b3b          	.insn	4, 0x19270b3b
 822:	0b20                	.insn	2, 0x0b20
 824:	0000                	.insn	2, 0x0000
 826:	4900260f          	.insn	4, 0x4900260f
 82a:	10000013          	li	zero,256
 82e:	012e                	.insn	2, 0x012e
 830:	0111                	.insn	2, 0x0111
 832:	0612                	.insn	2, 0x0612
 834:	1840                	.insn	2, 0x1840
 836:	03194297          	auipc	t0,0x3194
 83a:	3a0e                	.insn	2, 0x3a0e
 83c:	270b3b0b          	.insn	4, 0x270b3b0b
 840:	3f19                	.insn	2, 0x3f19
 842:	0019                	.insn	2, 0x0019
 844:	1100                	.insn	2, 0x1100
 846:	0005                	.insn	2, 0x0005
 848:	1702                	.insn	2, 0x1702
 84a:	0b3a0e03          	lb	t3,179(s4)
 84e:	13490b3b          	.insn	4, 0x13490b3b
 852:	0000                	.insn	2, 0x0000
 854:	3412                	.insn	2, 0x3412
 856:	0200                	.insn	2, 0x0200
 858:	0318                	.insn	2, 0x0318
 85a:	3a0e                	.insn	2, 0x3a0e
 85c:	490b3b0b          	.insn	4, 0x490b3b0b
 860:	13000013          	li	zero,304
 864:	0034                	.insn	2, 0x0034
 866:	1702                	.insn	2, 0x1702
 868:	0b3a0e03          	lb	t3,179(s4)
 86c:	13490b3b          	.insn	4, 0x13490b3b
 870:	0000                	.insn	2, 0x0000
 872:	3414                	.insn	2, 0x3414
 874:	1c00                	.insn	2, 0x1c00
 876:	030d                	.insn	2, 0x030d
 878:	3a0e                	.insn	2, 0x3a0e
 87a:	490b3b0b          	.insn	4, 0x490b3b0b
 87e:	15000013          	li	zero,336
 882:	1755010b          	.insn	4, 0x1755010b
 886:	0000                	.insn	2, 0x0000
 888:	1d16                	.insn	2, 0x1d16
 88a:	3101                	.insn	2, 0x3101
 88c:	58175513          	.insn	4, 0x58175513
 890:	570b590b          	.insn	4, 0x570b590b
 894:	1700000b          	.insn	4, 0x1700000b
 898:	0005                	.insn	2, 0x0005
 89a:	1702                	.insn	2, 0x1702
 89c:	1331                	.insn	2, 0x1331
 89e:	0000                	.insn	2, 0x0000
 8a0:	3418                	.insn	2, 0x3418
 8a2:	0200                	.insn	2, 0x0200
 8a4:	00133117          	auipc	sp,0x133
 8a8:	1900                	.insn	2, 0x1900
 8aa:	011d                	.insn	2, 0x011d
 8ac:	1331                	.insn	2, 0x1331
 8ae:	0111                	.insn	2, 0x0111
 8b0:	0612                	.insn	2, 0x0612
 8b2:	0b58                	.insn	2, 0x0b58
 8b4:	0b59                	.insn	2, 0x0b59
 8b6:	00000b57          	.insn	4, 0x0b57
 8ba:	0b1a                	.insn	2, 0x0b1a
 8bc:	1101                	.insn	2, 0x1101
 8be:	1201                	.insn	2, 0x1201
 8c0:	0006                	.insn	2, 0x0006
 8c2:	1b00                	.insn	2, 0x1b00
 8c4:	0034                	.insn	2, 0x0034
 8c6:	1802                	.insn	2, 0x1802
 8c8:	1331                	.insn	2, 0x1331
 8ca:	0000                	.insn	2, 0x0000
 8cc:	051c                	.insn	2, 0x051c
 8ce:	0200                	.insn	2, 0x0200
 8d0:	3118                	.insn	2, 0x3118
 8d2:	1d000013          	li	zero,464
 8d6:	8289                	.insn	2, 0x8289
 8d8:	0001                	.insn	2, 0x0001
 8da:	1331                	.insn	2, 0x1331
 8dc:	0111                	.insn	2, 0x0111
 8de:	0000                	.insn	2, 0x0000
 8e0:	2e1e                	.insn	2, 0x2e1e
 8e2:	0301                	.insn	2, 0x0301
 8e4:	3a0e                	.insn	2, 0x3a0e
 8e6:	270b3b0b          	.insn	4, 0x270b3b0b
 8ea:	3c19                	.insn	2, 0x3c19
 8ec:	3f19                	.insn	2, 0x3f19
 8ee:	0019                	.insn	2, 0x0019
 8f0:	1f00                	.insn	2, 0x1f00
 8f2:	0005                	.insn	2, 0x0005
 8f4:	1349                	.insn	2, 0x1349
 8f6:	0000                	.insn	2, 0x0000
 8f8:	1820                	.insn	2, 0x1820
 8fa:	0000                	.insn	2, 0x0000
 8fc:	2100                	.insn	2, 0x2100
 8fe:	0021                	.insn	2, 0x0021
 900:	1349                	.insn	2, 0x1349
 902:	00000537          	lui	a0,0x0
	...

セクション .debug_info の逆アセンブル:

00000000 <$d.8>:
       0:	179e                	.insn	2, 0x179e
       2:	0000                	.insn	2, 0x0000
       4:	0004                	.insn	2, 0x0004
       6:	0000                	.insn	2, 0x0000
       8:	0000                	.insn	2, 0x0000
       a:	0104                	.insn	2, 0x0104
       c:	027e                	.insn	2, 0x027e
       e:	0000                	.insn	2, 0x0000
      10:	001d                	.insn	2, 0x001d
      12:	01ff 0000 0000 0000 	.insn	10, 0x03f100000000000001ff
      1a:	03f1 
      1c:	0000                	.insn	2, 0x0000
      1e:	0000                	.insn	2, 0x0000
      20:	0000                	.insn	2, 0x0000
      22:	0160                	.insn	2, 0x0160
      24:	0000                	.insn	2, 0x0000
      26:	7402                	.insn	2, 0x7402
      28:	2000                	.insn	2, 0x2000
      2a:	9400                	.insn	2, 0x9400
      2c:	0000                	.insn	2, 0x0000
      2e:	0100                	.insn	2, 0x0100
      30:	5a52                	.insn	2, 0x5a52
      32:	03000007          	.insn	4, 0x03000007
      36:	0000                	.insn	2, 0x0000
      38:	0000                	.insn	2, 0x0000
      3a:	00000083          	lb	ra,0(zero) # 0 <$d.8>
      3e:	7801                	.insn	2, 0x7801
      40:	030c                	.insn	2, 0x030c
      42:	5708                	.insn	2, 0x5708
      44:	0022                	.insn	2, 0x0022
      46:	0194                	.insn	2, 0x0194
      48:	1e31                	.insn	2, 0x1e31
      4a:	2230                	.insn	2, 0x2230
      4c:	039f 00eb 0000      	.insn	6, 0x00eb039f
      52:	008a                	.insn	2, 0x008a
      54:	0000                	.insn	2, 0x0000
      56:	7901                	.insn	2, 0x7901
      58:	0305                	.insn	2, 0x0305
      5a:	570c                	.insn	2, 0x570c
      5c:	0022                	.insn	2, 0x0022
      5e:	0004                	.insn	2, 0x0004
      60:	0000                	.insn	2, 0x0000
      62:	6600                	.insn	2, 0x6600
      64:	05000007          	.insn	4, 0x05000007
      68:	0000001b          	.insn	4, 0x001b
      6c:	0771                	.insn	2, 0x0771
      6e:	0000                	.insn	2, 0x0000
      70:	e806                	.insn	2, 0xe806
      72:	0006                	.insn	2, 0x0006
      74:	e000                	.insn	2, 0xe000
      76:	2000                	.insn	2, 0x2000
      78:	0600                	.insn	2, 0x0600
      7a:	0700                	.insn	2, 0x0700
      7c:	0000                	.insn	2, 0x0000
      7e:	00f4                	.insn	2, 0x00f4
      80:	0020                	.insn	2, 0x0020
      82:	0700                	.insn	2, 0x0700
      84:	03b5                	.insn	2, 0x03b5
      86:	0000                	.insn	2, 0x0000
      88:	0405                	.insn	2, 0x0405
      8a:	9508                	.insn	2, 0x9508
      8c:	0000                	.insn	2, 0x0000
      8e:	3a00                	.insn	2, 0x3a00
      90:	0001                	.insn	2, 0x0001
      92:	0200                	.insn	2, 0x0200
      94:	0815                	.insn	2, 0x0815
      96:	00a0                	.insn	2, 0x00a0
      98:	0000                	.insn	2, 0x0000
      9a:	02f9                	.insn	2, 0x02f9
      9c:	0000                	.insn	2, 0x0000
      9e:	1102                	.insn	2, 0x1102
      a0:	0004f007          	.insn	4, 0x0004f007
      a4:	0700                	.insn	2, 0x0700
      a6:	0904                	.insn	2, 0x0904
      a8:	00b4                	.insn	2, 0x00b4
      aa:	0000                	.insn	2, 0x0000
      ac:	8901                	.insn	2, 0x8901
      ae:	0305                	.insn	2, 0x0305
      b0:	3115                	.insn	2, 0x3115
      b2:	0020                	.insn	2, 0x0020
      b4:	c00a                	.insn	2, 0xc00a
      b6:	0000                	.insn	2, 0x0000
      b8:	0b00                	.insn	2, 0x0b00
      ba:	000000c7          	.insn	4, 0x00c7
      be:	001d                	.insn	2, 0x001d
      c0:	0003b907          	.insn	4, 0x0003b907
      c4:	0800                	.insn	2, 0x0800
      c6:	0c01                	.insn	2, 0x0c01
      c8:	0572                	.insn	2, 0x0572
      ca:	0000                	.insn	2, 0x0000
      cc:	0708                	.insn	2, 0x0708
      ce:	db09                	.insn	2, 0xdb09
      d0:	0000                	.insn	2, 0x0000
      d2:	0100                	.insn	2, 0x0100
      d4:	0589                	.insn	2, 0x0589
      d6:	202d2603          	lw	a2,514(s10)
      da:	0a00                	.insn	2, 0x0a00
      dc:	00c0                	.insn	2, 0x00c0
      de:	0000                	.insn	2, 0x0000
      e0:	0000c70b          	.insn	4, 0xc70b
      e4:	0f00                	.insn	2, 0x0f00
      e6:	0d00                	.insn	2, 0x0d00
      e8:	00f5                	.insn	2, 0x00f5
      ea:	0000                	.insn	2, 0x0000
      ec:	3e01                	.insn	2, 0x3e01
      ee:	0501                	.insn	2, 0x0501
      f0:	2032e803          	.insn	4, 0x2032e803
      f4:	0a00                	.insn	2, 0x0a00
      f6:	00c0                	.insn	2, 0x00c0
      f8:	0000                	.insn	2, 0x0000
      fa:	0000c70b          	.insn	4, 0xc70b
      fe:	2200                	.insn	2, 0x2200
     100:	0d00                	.insn	2, 0x0d00
     102:	00f5                	.insn	2, 0x00f5
     104:	0000                	.insn	2, 0x0000
     106:	4101                	.insn	2, 0x4101
     108:	0501                	.insn	2, 0x0501
     10a:	20319203          	lh	tp,515(gp)
     10e:	0d00                	.insn	2, 0x0d00
     110:	011d                	.insn	2, 0x011d
     112:	0000                	.insn	2, 0x0000
     114:	6401                	.insn	2, 0x6401
     116:	0501                	.insn	2, 0x0501
     118:	20332e03          	lw	t3,515(t1) # 3a0e08d7 <__free_ram_end+0x39d8a8d7>
     11c:	0a00                	.insn	2, 0x0a00
     11e:	00c0                	.insn	2, 0x00c0
     120:	0000                	.insn	2, 0x0000
     122:	0000c70b          	.insn	4, 0xc70b
     126:	2500                	.insn	2, 0x2500
     128:	0d00                	.insn	2, 0x0d00
     12a:	00b4                	.insn	2, 0x00b4
     12c:	0000                	.insn	2, 0x0000
     12e:	8201                	.insn	2, 0x8201
     130:	0501                	.insn	2, 0x0501
     132:	20335603          	lhu	a2,515(t1)
     136:	0d00                	.insn	2, 0x0d00
     138:	0145                	.insn	2, 0x0145
     13a:	0000                	.insn	2, 0x0000
     13c:	8e01                	.insn	2, 0x8e01
     13e:	0501                	.insn	2, 0x0501
     140:	2030fa03          	.insn	4, 0x2030fa03
     144:	0a00                	.insn	2, 0x0a00
     146:	00c0                	.insn	2, 0x00c0
     148:	0000                	.insn	2, 0x0000
     14a:	0000c70b          	.insn	4, 0xc70b
     14e:	1b00                	.insn	2, 0x1b00
     150:	0d00                	.insn	2, 0x0d00
     152:	015f 0000 a101      	.insn	6, 0xa1010000015f
     158:	0501                	.insn	2, 0x0501
     15a:	202dc403          	lbu	s0,514(s11)
     15e:	0a00                	.insn	2, 0x0a00
     160:	00c0                	.insn	2, 0x00c0
     162:	0000                	.insn	2, 0x0000
     164:	0000c70b          	.insn	4, 0xc70b
     168:	2600                	.insn	2, 0x2600
     16a:	0d00                	.insn	2, 0x0d00
     16c:	0179                	.insn	2, 0x0179
     16e:	0000                	.insn	2, 0x0000
     170:	ab01                	.insn	2, 0xab01
     172:	0501                	.insn	2, 0x0501
     174:	202e5503          	lhu	a0,514(t3)
     178:	0a00                	.insn	2, 0x0a00
     17a:	00c0                	.insn	2, 0x00c0
     17c:	0000                	.insn	2, 0x0000
     17e:	0000c70b          	.insn	4, 0xc70b
     182:	2b00                	.insn	2, 0x2b00
     184:	0d00                	.insn	2, 0x0d00
     186:	00000193          	li	gp,0
     18a:	b501                	.insn	2, 0xb501
     18c:	0501                	.insn	2, 0x0501
     18e:	202e2703          	lw	a4,514(t3)
     192:	0a00                	.insn	2, 0x0a00
     194:	00c0                	.insn	2, 0x00c0
     196:	0000                	.insn	2, 0x0000
     198:	0000c70b          	.insn	4, 0xc70b
     19c:	2e00                	.insn	2, 0x2e00
     19e:	0d00                	.insn	2, 0x0d00
     1a0:	01ad                	.insn	2, 0x01ad
     1a2:	0000                	.insn	2, 0x0000
     1a4:	bf01                	.insn	2, 0xbf01
     1a6:	0501                	.insn	2, 0x0501
     1a8:	202d3503          	.insn	4, 0x202d3503
     1ac:	0a00                	.insn	2, 0x0a00
     1ae:	00c0                	.insn	2, 0x00c0
     1b0:	0000                	.insn	2, 0x0000
     1b2:	0000c70b          	.insn	4, 0xc70b
     1b6:	2900                	.insn	2, 0x2900
     1b8:	0d00                	.insn	2, 0x0d00
     1ba:	000001c7          	.insn	4, 0x01c7
     1be:	cd01                	.insn	2, 0xcd01
     1c0:	0501                	.insn	2, 0x0501
     1c2:	202df303          	.insn	4, 0x202df303
     1c6:	0a00                	.insn	2, 0x0a00
     1c8:	00c0                	.insn	2, 0x00c0
     1ca:	0000                	.insn	2, 0x0000
     1cc:	0000c70b          	.insn	4, 0xc70b
     1d0:	2100                	.insn	2, 0x2100
     1d2:	0d00                	.insn	2, 0x0d00
     1d4:	000001c7          	.insn	4, 0x01c7
     1d8:	e101                	.insn	2, 0xe101
     1da:	0501                	.insn	2, 0x0501
     1dc:	2032ac03          	lw	s8,515(t0) # 3194a39 <__free_ram_end+0x2e3ea39>
     1e0:	0d00                	.insn	2, 0x0d00
     1e2:	000001ef          	jal	gp,1e2 <$d.9+0x26>
     1e6:	fc01                	.insn	2, 0xfc01
     1e8:	0501                	.insn	2, 0x0501
     1ea:	2031b403          	.insn	4, 0x2031b403
     1ee:	0a00                	.insn	2, 0x0a00
     1f0:	00c0                	.insn	2, 0x00c0
     1f2:	0000                	.insn	2, 0x0000
     1f4:	0000c70b          	.insn	4, 0xc70b
     1f8:	1400                	.insn	2, 0x1400
     1fa:	0d00                	.insn	2, 0x0d00
     1fc:	0209                	.insn	2, 0x0209
     1fe:	0000                	.insn	2, 0x0000
     200:	8801                	.insn	2, 0x8801
     202:	0502                	.insn	2, 0x0502
     204:	20326803          	.insn	4, 0x20326803
     208:	0a00                	.insn	2, 0x0a00
     20a:	00c0                	.insn	2, 0x00c0
     20c:	0000                	.insn	2, 0x0000
     20e:	0000c70b          	.insn	4, 0xc70b
     212:	1300                	.insn	2, 0x1300
     214:	0d00                	.insn	2, 0x0d00
     216:	01ad                	.insn	2, 0x01ad
     218:	0000                	.insn	2, 0x0000
     21a:	9101                	.insn	2, 0x9101
     21c:	0502                	.insn	2, 0x0502
     21e:	20309703          	lh	a4,515(ra)
     222:	0d00                	.insn	2, 0x0d00
     224:	0231                	.insn	2, 0x0231
     226:	0000                	.insn	2, 0x0000
     228:	b801                	.insn	2, 0xb801
     22a:	0502                	.insn	2, 0x0502
     22c:	20321403          	lh	s0,515(tp) # 203 <$d.9+0x47>
     230:	0a00                	.insn	2, 0x0a00
     232:	00c0                	.insn	2, 0x00c0
     234:	0000                	.insn	2, 0x0000
     236:	0000c70b          	.insn	4, 0xc70b
     23a:	3a00                	.insn	2, 0x3a00
     23c:	0d00                	.insn	2, 0x0d00
     23e:	0000024b          	.insn	4, 0x024b
     242:	bc01                	.insn	2, 0xbc01
     244:	0502                	.insn	2, 0x0502
     246:	202d5e03          	lhu	t3,514(s10)
     24a:	0a00                	.insn	2, 0x0a00
     24c:	00c0                	.insn	2, 0x00c0
     24e:	0000                	.insn	2, 0x0000
     250:	0000c70b          	.insn	4, 0xc70b
     254:	3b00                	.insn	2, 0x3b00
     256:	0d00                	.insn	2, 0x0d00
     258:	0145                	.insn	2, 0x0145
     25a:	0000                	.insn	2, 0x0000
     25c:	e801                	.insn	2, 0xe801
     25e:	0502                	.insn	2, 0x0502
     260:	2032cd03          	lbu	s10,515(t0)
     264:	0d00                	.insn	2, 0x0d00
     266:	00000273          	.insn	4, 0x0273
     26a:	eb01                	.insn	2, 0xeb01
     26c:	0502                	.insn	2, 0x0502
     26e:	2030d103          	lhu	sp,515(ra)
     272:	0a00                	.insn	2, 0x0a00
     274:	00c0                	.insn	2, 0x00c0
     276:	0000                	.insn	2, 0x0000
     278:	0000c70b          	.insn	4, 0xc70b
     27c:	2000                	.insn	2, 0x2000
     27e:	0d00                	.insn	2, 0x0d00
     280:	028d                	.insn	2, 0x028d
     282:	0000                	.insn	2, 0x0000
     284:	f901                	.insn	2, 0xf901
     286:	0502                	.insn	2, 0x0502
     288:	202cb103          	.insn	4, 0x202cb103
     28c:	0a00                	.insn	2, 0x0a00
     28e:	00c0                	.insn	2, 0x00c0
     290:	0000                	.insn	2, 0x0000
     292:	0000c70b          	.insn	4, 0xc70b
     296:	2800                	.insn	2, 0x2800
     298:	0d00                	.insn	2, 0x0d00
     29a:	00f5                	.insn	2, 0x00f5
     29c:	0000                	.insn	2, 0x0000
     29e:	0801                	.insn	2, 0x0801
     2a0:	c8030503          	lb	a0,-896(t1)
     2a4:	2031                	.insn	2, 0x2031
     2a6:	0d00                	.insn	2, 0x0d00
     2a8:	00b4                	.insn	2, 0x00b4
     2aa:	0000                	.insn	2, 0x0000
     2ac:	1401                	.insn	2, 0x1401
     2ae:	a1030503          	lb	a0,-1520(t1)
     2b2:	202e                	.insn	2, 0x202e
     2b4:	0d00                	.insn	2, 0x0d00
     2b6:	00000273          	.insn	4, 0x0273
     2ba:	1601                	.insn	2, 0x1601
     2bc:	be030503          	lb	a0,-1056(t1)
     2c0:	202e                	.insn	2, 0x202e
     2c2:	0d00                	.insn	2, 0x0d00
     2c4:	02d1                	.insn	2, 0x02d1
     2c6:	0000                	.insn	2, 0x0000
     2c8:	2501                	.insn	2, 0x2501
     2ca:	32030503          	lb	a0,800(t1)
     2ce:	2031                	.insn	2, 0x2031
     2d0:	0a00                	.insn	2, 0x0a00
     2d2:	00c0                	.insn	2, 0x00c0
     2d4:	0000                	.insn	2, 0x0000
     2d6:	0000c70b          	.insn	4, 0xc70b
     2da:	2400                	.insn	2, 0x2400
     2dc:	0d00                	.insn	2, 0x0d00
     2de:	000002eb          	.insn	4, 0x02eb
     2e2:	3201                	.insn	2, 0x3201
     2e4:	52030503          	lb	a0,1312(t1)
     2e8:	202c                	.insn	2, 0x202c
     2ea:	0a00                	.insn	2, 0x0a00
     2ec:	00c0                	.insn	2, 0x00c0
     2ee:	0000                	.insn	2, 0x0000
     2f0:	0000c70b          	.insn	4, 0xc70b
     2f4:	2c00                	.insn	2, 0x2c00
     2f6:	0d00                	.insn	2, 0x0d00
     2f8:	0305                	.insn	2, 0x0305
     2fa:	0000                	.insn	2, 0x0000
     2fc:	5401                	.insn	2, 0x5401
     2fe:	c0030503          	lb	a0,-1024(t1)
     302:	2030                	.insn	2, 0x2030
     304:	0a00                	.insn	2, 0x0a00
     306:	00c0                	.insn	2, 0x00c0
     308:	0000                	.insn	2, 0x0000
     30a:	0000c70b          	.insn	4, 0xc70b
     30e:	1100                	.insn	2, 0x1100
     310:	0d00                	.insn	2, 0x0d00
     312:	031f 0000 5801      	.insn	6, 0x58010000031f
     318:	ea030503          	lb	a0,-352(t1)
     31c:	2031                	.insn	2, 0x2031
     31e:	0a00                	.insn	2, 0x0a00
     320:	00c0                	.insn	2, 0x00c0
     322:	0000                	.insn	2, 0x0000
     324:	0000c70b          	.insn	4, 0xc70b
     328:	0200                	.insn	2, 0x0200
     32a:	0d00                	.insn	2, 0x0d00
     32c:	0339                	.insn	2, 0x0339
     32e:	0000                	.insn	2, 0x0000
     330:	6701                	.insn	2, 0x6701
     332:	f1030503          	lb	a0,-240(t1)
     336:	2030                	.insn	2, 0x2030
     338:	0a00                	.insn	2, 0x0a00
     33a:	00c0                	.insn	2, 0x00c0
     33c:	0000                	.insn	2, 0x0000
     33e:	0000c70b          	.insn	4, 0xc70b
     342:	0900                	.insn	2, 0x0900
     344:	0d00                	.insn	2, 0x0d00
     346:	00000353          	.insn	4, 0x0353
     34a:	6801                	.insn	2, 0x6801
     34c:	d9030503          	lb	a0,-624(t1)
     350:	202c                	.insn	2, 0x202c
     352:	0a00                	.insn	2, 0x0a00
     354:	00c0                	.insn	2, 0x00c0
     356:	0000                	.insn	2, 0x0000
     358:	0000c70b          	.insn	4, 0xc70b
     35c:	0400                	.insn	2, 0x0400
     35e:	0d00                	.insn	2, 0x0d00
     360:	036d                	.insn	2, 0x036d
     362:	0000                	.insn	2, 0x0000
     364:	7301                	.insn	2, 0x7301
     366:	99030503          	lb	a0,-1648(t1)
     36a:	202d                	.insn	2, 0x202d
     36c:	0a00                	.insn	2, 0x0a00
     36e:	00c0                	.insn	2, 0x00c0
     370:	0000                	.insn	2, 0x0000
     372:	0000c70b          	.insn	4, 0xc70b
     376:	1c00                	.insn	2, 0x1c00
     378:	0d00                	.insn	2, 0x0d00
     37a:	00000387          	.insn	4, 0x0387
     37e:	7401                	.insn	2, 0x7401
     380:	7e030503          	lb	a0,2016(t1)
     384:	202c                	.insn	2, 0x202c
     386:	0a00                	.insn	2, 0x0a00
     388:	00c0                	.insn	2, 0x00c0
     38a:	0000                	.insn	2, 0x0000
     38c:	0000c70b          	.insn	4, 0xc70b
     390:	1000                	.insn	2, 0x1000
     392:	0d00                	.insn	2, 0x0d00
     394:	03a1                	.insn	2, 0x03a1
     396:	0000                	.insn	2, 0x0000
     398:	7801                	.insn	2, 0x7801
     39a:	de030503          	lb	a0,-544(t1)
     39e:	202e                	.insn	2, 0x202e
     3a0:	0a00                	.insn	2, 0x0a00
     3a2:	00c0                	.insn	2, 0x00c0
     3a4:	0000                	.insn	2, 0x0000
     3a6:	c70e                	.insn	2, 0xc70e
     3a8:	0000                	.insn	2, 0x0000
     3aa:	b900                	.insn	2, 0xb900
     3ac:	0001                	.insn	2, 0x0001
     3ae:	bc0d                	.insn	2, 0xbc0d
     3b0:	01000003          	lb	zero,16(zero) # 10 <$d.8+0x10>
     3b4:	0385                	.insn	2, 0x0385
     3b6:	0305                	.insn	2, 0x0305
     3b8:	3156                	.insn	2, 0x3156
     3ba:	0020                	.insn	2, 0x0020
     3bc:	c00a                	.insn	2, 0xc00a
     3be:	0000                	.insn	2, 0x0000
     3c0:	0b00                	.insn	2, 0x0b00
     3c2:	000000c7          	.insn	4, 0x00c7
     3c6:	000c                	.insn	2, 0x000c
     3c8:	390d                	.insn	2, 0x390d
     3ca:	01000003          	lb	zero,16(zero) # 10 <$d.8+0x10>
     3ce:	0385                	.insn	2, 0x0385
     3d0:	0305                	.insn	2, 0x0305
     3d2:	2dea                	.insn	2, 0x2dea
     3d4:	0020                	.insn	2, 0x0020
     3d6:	e40d                	.insn	2, 0xe40d
     3d8:	01000003          	lb	zero,16(zero) # 10 <$d.8+0x10>
     3dc:	0392                	.insn	2, 0x0392
     3de:	0305                	.insn	2, 0x0305
     3e0:	2c38                	.insn	2, 0x2c38
     3e2:	0020                	.insn	2, 0x0020
     3e4:	c00a                	.insn	2, 0xc00a
     3e6:	0000                	.insn	2, 0x0000
     3e8:	0b00                	.insn	2, 0x0b00
     3ea:	000000c7          	.insn	4, 0x00c7
     3ee:	001a                	.insn	2, 0x001a
     3f0:	e40d                	.insn	2, 0xe40d
     3f2:	01000003          	lb	zero,16(zero) # 10 <$d.8+0x10>
     3f6:	039d                	.insn	2, 0x039d
     3f8:	0305                	.insn	2, 0x0305
     3fa:	324e                	.insn	2, 0x324e
     3fc:	0020                	.insn	2, 0x0020
     3fe:	db0d                	.insn	2, 0xdb0d
     400:	0000                	.insn	2, 0x0000
     402:	0100                	.insn	2, 0x0100
     404:	03a1                	.insn	2, 0x03a1
     406:	0305                	.insn	2, 0x0305
     408:	2c8e                	.insn	2, 0x2c8e
     40a:	0020                	.insn	2, 0x0020
     40c:	090d                	.insn	2, 0x090d
     40e:	0002                	.insn	2, 0x0002
     410:	0100                	.insn	2, 0x0100
     412:	030503a7          	.insn	4, 0x030503a7
     416:	330a                	.insn	2, 0x330a
     418:	0020                	.insn	2, 0x0020
     41a:	8d0d                	.insn	2, 0x8d0d
     41c:	0002                	.insn	2, 0x0002
     41e:	0100                	.insn	2, 0x0100
     420:	03a8                	.insn	2, 0x03a8
     422:	0305                	.insn	2, 0x0305
     424:	31ec                	.insn	2, 0x31ec
     426:	0020                	.insn	2, 0x0020
     428:	00062c0f          	.insn	4, 0x00062c0f
     42c:	3900                	.insn	2, 0x3900
     42e:	0004                	.insn	2, 0x0004
     430:	0100                	.insn	2, 0x0100
     432:	050c                	.insn	2, 0x050c
     434:	22573003          	.insn	4, 0x22573003
     438:	0a00                	.insn	2, 0x0a00
     43a:	0445                	.insn	2, 0x0445
     43c:	0000                	.insn	2, 0x0000
     43e:	0000c70b          	.insn	4, 0xc70b
     442:	0800                	.insn	2, 0x0800
     444:	1000                	.insn	2, 0x1000
     446:	0142                	.insn	2, 0x0142
     448:	0000                	.insn	2, 0x0000
     44a:	2010                	.insn	2, 0x2010
     44c:	be112b03          	lw	s6,-1055(sp) # 133485 <_binary_shell_bin_size+0x1110f5>
     450:	83000003          	lb	zero,-2000(zero) # fffff830 <__free_ram_end+0xffca9830>
     454:	0000                	.insn	2, 0x0000
     456:	0300                	.insn	2, 0x0300
     458:	002c                	.insn	2, 0x002c
     45a:	e011                	.insn	2, 0xe011
     45c:	0001                	.insn	2, 0x0001
     45e:	8300                	.insn	2, 0x8300
     460:	0000                	.insn	2, 0x0000
     462:	0300                	.insn	2, 0x0300
     464:	042d                	.insn	2, 0x042d
     466:	2611                	.insn	2, 0x2611
     468:	0004                	.insn	2, 0x0004
     46a:	8b00                	.insn	2, 0x8b00
     46c:	0004                	.insn	2, 0x0004
     46e:	0300                	.insn	2, 0x0300
     470:	0830                	.insn	2, 0x0830
     472:	6a11                	.insn	2, 0x6a11
     474:	0004                	.insn	2, 0x0004
     476:	9600                	.insn	2, 0x9600
     478:	0004                	.insn	2, 0x0004
     47a:	0300                	.insn	2, 0x0300
     47c:	75110c33          	.insn	4, 0x75110c33
     480:	0004                	.insn	2, 0x0004
     482:	9b00                	.insn	2, 0x9b00
     484:	0004                	.insn	2, 0x0004
     486:	0300                	.insn	2, 0x0300
     488:	1036                	.insn	2, 0x1036
     48a:	0800                	.insn	2, 0x0800
     48c:	0095                	.insn	2, 0x0095
     48e:	0000                	.insn	2, 0x0000
     490:	0586                	.insn	2, 0x0586
     492:	0000                	.insn	2, 0x0000
     494:	1602                	.insn	2, 0x1602
     496:	9512                	.insn	2, 0x9512
     498:	0000                	.insn	2, 0x0000
     49a:	0a00                	.insn	2, 0x0a00
     49c:	04a8                	.insn	2, 0x04a8
     49e:	0000                	.insn	2, 0x0000
     4a0:	c70e                	.insn	2, 0xc70e
     4a2:	0000                	.insn	2, 0x0000
     4a4:	0000                	.insn	2, 0x0000
     4a6:	0020                	.insn	2, 0x0020
     4a8:	b308                	.insn	2, 0xb308
     4aa:	0004                	.insn	2, 0x0004
     4ac:	b700                	.insn	2, 0xb700
     4ae:	0005                	.insn	2, 0x0005
     4b0:	0200                	.insn	2, 0x0200
     4b2:	0398070f          	.insn	4, 0x0398070f
     4b6:	0000                	.insn	2, 0x0000
     4b8:	0108                	.insn	2, 0x0108
     4ba:	0003020f          	.insn	4, 0x0003020f
     4be:	cb00                	.insn	2, 0xcb00
     4c0:	0004                	.insn	2, 0x0004
     4c2:	0100                	.insn	2, 0x0100
     4c4:	050d                	.insn	2, 0x050d
     4c6:	22571403          	lh	s0,549(a4)
     4ca:	1200                	.insn	2, 0x1200
     4cc:	0445                	.insn	2, 0x0445
     4ce:	0000                	.insn	2, 0x0000
     4d0:	0002a50f          	.insn	4, 0x0002a50f
     4d4:	cb00                	.insn	2, 0xcb00
     4d6:	0004                	.insn	2, 0x0004
     4d8:	0100                	.insn	2, 0x0100
     4da:	050e                	.insn	2, 0x050e
     4dc:	22571003          	lh	zero,549(a4)
     4e0:	0f00                	.insn	2, 0x0f00
     4e2:	0000030f          	.insn	4, 0x030f
     4e6:	04f2                	.insn	2, 0x04f2
     4e8:	0000                	.insn	2, 0x0000
     4ea:	1201                	.insn	2, 0x1201
     4ec:	0305                	.insn	2, 0x0305
     4ee:	5718                	.insn	2, 0x5718
     4f0:	0022                	.insn	2, 0x0022
     4f2:	f712                	.insn	2, 0xf712
     4f4:	0004                	.insn	2, 0x0004
     4f6:	1300                	.insn	2, 0x1300
     4f8:	0248                	.insn	2, 0x0248
     4fa:	0000                	.insn	2, 0x0000
     4fc:	00018a0f          	.insn	4, 0x00018a0f
     500:	0d00                	.insn	2, 0x0d00
     502:	0005                	.insn	2, 0x0005
     504:	0100                	.insn	2, 0x0100
     506:	1c030513          	addi	a0,t1,448
     50a:	12002257          	.insn	4, 0x12002257
     50e:	0512                	.insn	2, 0x0512
     510:	0000                	.insn	2, 0x0000
     512:	00069813          	slli	a6,a3,0x0
     516:	0f00                	.insn	2, 0x0f00
     518:	00000087          	.insn	4, 0x0087
     51c:	008a                	.insn	2, 0x008a
     51e:	0000                	.insn	2, 0x0000
     520:	1401                	.insn	2, 0x1401
     522:	0305                	.insn	2, 0x0305
     524:	5720                	.insn	2, 0x5720
     526:	0022                	.insn	2, 0x0022
     528:	0005bf0f          	.insn	4, 0x0005bf0f
     52c:	3900                	.insn	2, 0x3900
     52e:	0005                	.insn	2, 0x0005
     530:	0100                	.insn	2, 0x0100
     532:	0515                	.insn	2, 0x0515
     534:	22572803          	lw	a6,549(a4)
     538:	0800                	.insn	2, 0x0800
     53a:	0544                	.insn	2, 0x0544
     53c:	0000                	.insn	2, 0x0000
     53e:	04fd                	.insn	2, 0x04fd
     540:	0000                	.insn	2, 0x0000
     542:	6204                	.insn	2, 0x6204
     544:	00000c07          	.insn	4, 0x0c07
     548:	0700                	.insn	2, 0x0700
     54a:	0808                	.insn	2, 0x0808
     54c:	00a0                	.insn	2, 0x00a0
     54e:	0000                	.insn	2, 0x0000
     550:	02f9                	.insn	2, 0x02f9
     552:	0000                	.insn	2, 0x0000
     554:	c604                	.insn	2, 0xc604
     556:	b314                	.insn	2, 0xb314
     558:	0004                	.insn	2, 0x0004
     55a:	b700                	.insn	2, 0xb700
     55c:	0005                	.insn	2, 0x0005
     55e:	0400                	.insn	2, 0x0400
     560:	010a                	.insn	2, 0x010a
     562:	00004b07          	.insn	4, 0x4b07
     566:	0500                	.insn	2, 0x0500
     568:	1504                	.insn	2, 0x1504
     56a:	4b12                	.insn	2, 0x4b12
     56c:	0005                	.insn	2, 0x0005
     56e:	1200                	.insn	2, 0x1200
     570:	0574                	.insn	2, 0x0574
     572:	0000                	.insn	2, 0x0000
     574:	5616                	.insn	2, 0x5616
     576:	0005                	.insn	2, 0x0005
     578:	1200                	.insn	2, 0x1200
     57a:	057e                	.insn	2, 0x057e
     57c:	0000                	.insn	2, 0x0000
     57e:	00a01417          	auipc	s0,0xa01
     582:	0000                	.insn	2, 0x0000
     584:	014a                	.insn	2, 0x014a
     586:	0000                	.insn	2, 0x0000
     588:	2a04                	.insn	2, 0x2a04
     58a:	0801                	.insn	2, 0x0801
     58c:	0095                	.insn	2, 0x0095
     58e:	0000                	.insn	2, 0x0000
     590:	01ba                	.insn	2, 0x01ba
     592:	0000                	.insn	2, 0x0000
     594:	1302                	.insn	2, 0x1302
     596:	9b12                	.insn	2, 0x9b12
     598:	0005                	.insn	2, 0x0005
     59a:	1800                	.insn	2, 0x1800
     59c:	a112                	.insn	2, 0xa112
     59e:	0005                	.insn	2, 0x0005
     5a0:	1900                	.insn	2, 0x1900
     5a2:	0000054b          	.insn	4, 0x054b
     5a6:	ab12                	.insn	2, 0xab12
     5a8:	0005                	.insn	2, 0x0005
     5aa:	1900                	.insn	2, 0x1900
     5ac:	05b0                	.insn	2, 0x05b0
     5ae:	0000                	.insn	2, 0x0000
     5b0:	a008                	.insn	2, 0xa008
     5b2:	0000                	.insn	2, 0x0000
     5b4:	f900                	.insn	2, 0xf900
     5b6:	0002                	.insn	2, 0x0002
     5b8:	0500                	.insn	2, 0x0500
     5ba:	1a09                	.insn	2, 0x1a09
     5bc:	0154                	.insn	2, 0x0154
     5be:	0000                	.insn	2, 0x0000
     5c0:	2005                	.insn	2, 0x2005
     5c2:	05b0                	.insn	2, 0x05b0
     5c4:	0000                	.insn	2, 0x0000
     5c6:	1b01                	.insn	2, 0x1b01
     5c8:	00ca                	.insn	2, 0x00ca
     5ca:	0000                	.insn	2, 0x0000
     5cc:	2005                	.insn	2, 0x2005
     5ce:	05b0                	.insn	2, 0x05b0
     5d0:	0000                	.insn	2, 0x0000
     5d2:	1c00                	.insn	2, 0x1c00
     5d4:	031e                	.insn	2, 0x031e
     5d6:	0000                	.insn	2, 0x0000
     5d8:	1d05                	.insn	2, 0x1d05
     5da:	1b01                	.insn	2, 0x1b01
     5dc:	00ca                	.insn	2, 0x00ca
     5de:	0000                	.insn	2, 0x0000
     5e0:	1d05                	.insn	2, 0x1d05
     5e2:	05b0                	.insn	2, 0x05b0
     5e4:	0000                	.insn	2, 0x0000
     5e6:	0001c11b          	.insn	4, 0x0001c11b
     5ea:	0500                	.insn	2, 0x0500
     5ec:	b01d                	.insn	2, 0xb01d
     5ee:	0005                	.insn	2, 0x0005
     5f0:	0000                	.insn	2, 0x0000
     5f2:	101d                	.insn	2, 0x101d
     5f4:	2000                	.insn	2, 0x2000
     5f6:	2000                	.insn	2, 0x2000
     5f8:	0000                	.insn	2, 0x0000
     5fa:	0100                	.insn	2, 0x0100
     5fc:	f152                	.insn	2, 0xf152
     5fe:	0006                	.insn	2, 0x0006
     600:	0100                	.insn	2, 0x0100
     602:	1e50                	.insn	2, 0x1e50
     604:	5a01                	.insn	2, 0x5a01
     606:	06ee                	.insn	2, 0x06ee
     608:	0000                	.insn	2, 0x0000
     60a:	5001                	.insn	2, 0x5001
     60c:	00c0                	.insn	2, 0x00c0
     60e:	0000                	.insn	2, 0x0000
     610:	bb1f 0005 1400      	.insn	6, 0x14000005bb1f
     616:	2000                	.insn	2, 0x2000
     618:	0400                	.insn	2, 0x0400
     61a:	0000                	.insn	2, 0x0000
     61c:	0100                	.insn	2, 0x0100
     61e:	0c52                	.insn	2, 0x0c52
     620:	8820                	.insn	2, 0x8820
     622:	8080                	.insn	2, 0x8080
     624:	0180                	.insn	2, 0x0180
     626:	000005c7          	.insn	4, 0x05c7
     62a:	1f00                	.insn	2, 0x1f00
     62c:	000005d3          	.insn	4, 0x05d3
     630:	0028                	.insn	2, 0x0028
     632:	0020                	.insn	2, 0x0020
     634:	0004                	.insn	2, 0x0004
     636:	0000                	.insn	2, 0x0000
     638:	5501                	.insn	2, 0x5501
     63a:	2005                	.insn	2, 0x2005
     63c:	8080                	.insn	2, 0x8080
     63e:	8080                	.insn	2, 0x8080
     640:	db01                	.insn	2, 0xdb01
     642:	0005                	.insn	2, 0x0005
     644:	2100                	.insn	2, 0x2100
     646:	5a01                	.insn	2, 0x5a01
     648:	05e6                	.insn	2, 0x05e6
     64a:	0000                	.insn	2, 0x0000
     64c:	0000                	.insn	2, 0x0000
     64e:	3002                	.insn	2, 0x3002
     650:	2000                	.insn	2, 0x2000
     652:	2000                	.insn	2, 0x2000
     654:	0000                	.insn	2, 0x0000
     656:	0100                	.insn	2, 0x0100
     658:	8e52                	.insn	2, 0x8e52
     65a:	000e                	.insn	2, 0x000e
     65c:	2100                	.insn	2, 0x2100
     65e:	5a01                	.insn	2, 0x5a01
     660:	0e96                	.insn	2, 0x0e96
     662:	0000                	.insn	2, 0x0000
     664:	bb1f 0005 3400      	.insn	6, 0x34000005bb1f
     66a:	2000                	.insn	2, 0x2000
     66c:	0400                	.insn	2, 0x0400
     66e:	0000                	.insn	2, 0x0000
     670:	0100                	.insn	2, 0x0100
     672:	88200c5b          	.insn	4, 0x88200c5b
     676:	8080                	.insn	2, 0x8080
     678:	0180                	.insn	2, 0x0180
     67a:	000005c7          	.insn	4, 0x05c7
     67e:	1f00                	.insn	2, 0x1f00
     680:	000005d3          	.insn	4, 0x05d3
     684:	0048                	.insn	2, 0x0048
     686:	0020                	.insn	2, 0x0020
     688:	0004                	.insn	2, 0x0004
     68a:	0000                	.insn	2, 0x0000
     68c:	5e01                	.insn	2, 0x5e01
     68e:	2005                	.insn	2, 0x2005
     690:	8080                	.insn	2, 0x8080
     692:	8080                	.insn	2, 0x8080
     694:	db01                	.insn	2, 0xdb01
     696:	0005                	.insn	2, 0x0005
     698:	2100                	.insn	2, 0x2100
     69a:	5a01                	.insn	2, 0x5a01
     69c:	05e6                	.insn	2, 0x05e6
     69e:	0000                	.insn	2, 0x0000
     6a0:	0000                	.insn	2, 0x0000
     6a2:	5002                	.insn	2, 0x5002
     6a4:	2000                	.insn	2, 0x2000
     6a6:	2400                	.insn	2, 0x2400
     6a8:	0000                	.insn	2, 0x0000
     6aa:	0100                	.insn	2, 0x0100
     6ac:	a252                	.insn	2, 0xa252
     6ae:	000e                	.insn	2, 0x000e
     6b0:	1f00                	.insn	2, 0x1f00
     6b2:	000005bb          	.insn	4, 0x05bb
     6b6:	0054                	.insn	2, 0x0054
     6b8:	0020                	.insn	2, 0x0020
     6ba:	0004                	.insn	2, 0x0004
     6bc:	0000                	.insn	2, 0x0000
     6be:	6401                	.insn	2, 0x6401
     6c0:	200d                	.insn	2, 0x200d
     6c2:	8088                	.insn	2, 0x8088
     6c4:	8080                	.insn	2, 0x8080
     6c6:	c701                	.insn	2, 0xc701
     6c8:	0005                	.insn	2, 0x0005
     6ca:	0000                	.insn	2, 0x0000
     6cc:	bb1f 0005 6800      	.insn	6, 0x68000005bb1f
     6d2:	2000                	.insn	2, 0x2000
     6d4:	0400                	.insn	2, 0x0400
     6d6:	0000                	.insn	2, 0x0000
     6d8:	0100                	.insn	2, 0x0100
     6da:	84201367          	.insn	4, 0x84201367
     6de:	8080                	.insn	2, 0x8080
     6e0:	0180                	.insn	2, 0x0180
     6e2:	000005c7          	.insn	4, 0x05c7
     6e6:	0000                	.insn	2, 0x0000
     6e8:	2922                	.insn	2, 0x2922
     6ea:	0004                	.insn	2, 0x0004
     6ec:	0500                	.insn	2, 0x0500
     6ee:	06f62327          	.insn	4, 0x06f62327
     6f2:	0000                	.insn	2, 0x0000
     6f4:	0024                	.insn	2, 0x0024
     6f6:	fb12                	.insn	2, 0xfb12
     6f8:	0006                	.insn	2, 0x0006
     6fa:	1600                	.insn	2, 0x1600
     6fc:	00c0                	.insn	2, 0x00c0
     6fe:	0000                	.insn	2, 0x0000
     700:	c225                	.insn	2, 0xc225
     702:	05000003          	lb	zero,80(zero) # 50 <$d.8+0x50>
     706:	6924                	.insn	2, 0x6924
     708:	0005                	.insn	2, 0x0005
     70a:	2300                	.insn	2, 0x2300
     70c:	0569                	.insn	2, 0x0569
     70e:	0000                	.insn	2, 0x0000
     710:	0000c023          	.insn	4, 0xc023
     714:	2300                	.insn	2, 0x2300
     716:	0000071b          	.insn	4, 0x071b
     71a:	0800                	.insn	2, 0x0800
     71c:	05b0                	.insn	2, 0x05b0
     71e:	0000                	.insn	2, 0x0000
     720:	01ba                	.insn	2, 0x01ba
     722:	0000                	.insn	2, 0x0000
     724:	0b05                	.insn	2, 0x0b05
     726:	0826                	.insn	2, 0x0826
     728:	2001                	.insn	2, 0x2001
     72a:	1c00                	.insn	2, 0x1c00
     72c:	0000                	.insn	2, 0x0000
     72e:	0100                	.insn	2, 0x0100
     730:	9552                	.insn	2, 0x9552
     732:	0000                	.insn	2, 0x0000
     734:	0100                	.insn	2, 0x0100
     736:	26b2                	.insn	2, 0x26b2
     738:	0124                	.insn	2, 0x0124
     73a:	0020                	.insn	2, 0x0020
     73c:	0118                	.insn	2, 0x0118
     73e:	0000                	.insn	2, 0x0000
     740:	5201                	.insn	2, 0x5201
     742:	000006a7          	.insn	4, 0x06a7
     746:	c301                	.insn	2, 0xc301
     748:	20023c27          	.insn	4, 0x20023c27
     74c:	7c00                	.insn	2, 0x7c00
     74e:	0000                	.insn	2, 0x0000
     750:	0100                	.insn	2, 0x0100
     752:	3052                	.insn	2, 0x3052
     754:	01000003          	lb	zero,16(zero) # 10 <$d.8+0x10>
     758:	0110                	.insn	2, 0x0110
     75a:	c328                	.insn	2, 0xc328
     75c:	0001                	.insn	2, 0x0001
     75e:	0100                	.insn	2, 0x0100
     760:	8a76                	.insn	2, 0x8a76
     762:	0000                	.insn	2, 0x0000
     764:	0100                	.insn	2, 0x0100
     766:	0000f61b          	.insn	4, 0xf61b
     76a:	0100                	.insn	2, 0x0100
     76c:	4b76                	.insn	2, 0x4b76
     76e:	0005                	.insn	2, 0x0005
     770:	2900                	.insn	2, 0x2900
     772:	0506                	.insn	2, 0x0506
     774:	0000                	.insn	2, 0x0000
     776:	8501                	.insn	2, 0x8501
     778:	008a                	.insn	2, 0x008a
     77a:	0000                	.insn	2, 0x0000
     77c:	0200                	.insn	2, 0x0200
     77e:	02b8                	.insn	2, 0x02b8
     780:	0020                	.insn	2, 0x0020
     782:	017c                	.insn	2, 0x017c
     784:	0000                	.insn	2, 0x0000
     786:	5201                	.insn	2, 0x5201
     788:	082e                	.insn	2, 0x082e
     78a:	0000                	.insn	2, 0x0000
     78c:	3604                	.insn	2, 0x3604
     78e:	0000                	.insn	2, 0x0000
     790:	3700                	.insn	2, 0x3700
     792:	0008                	.insn	2, 0x0008
     794:	0400                	.insn	2, 0x0400
     796:	00000067          	jr	zero # 0 <$d.8>
     79a:	00000843          	.insn	4, 0x0843
     79e:	8d04                	.insn	2, 0x8d04
     7a0:	0000                	.insn	2, 0x0000
     7a2:	4f00                	.insn	2, 0x4f00
     7a4:	0008                	.insn	2, 0x0008
     7a6:	0400                	.insn	2, 0x0400
     7a8:	00d4                	.insn	2, 0x00d4
     7aa:	0000                	.insn	2, 0x0000
     7ac:	0000085b          	.insn	4, 0x085b
     7b0:	5105                	.insn	2, 0x5105
     7b2:	0001                	.insn	2, 0x0001
     7b4:	7f00                	.insn	2, 0x7f00
     7b6:	0008                	.insn	2, 0x0008
     7b8:	2a00                	.insn	2, 0x2a00
     7ba:	00000867          	jalr	a6,zero # 0 <$d.8>
     7be:	732a                	.insn	2, 0x732a
     7c0:	0008                	.insn	2, 0x0008
     7c2:	2b00                	.insn	2, 0x2b00
     7c4:	0350                	.insn	2, 0x0350
     7c6:	0020                	.insn	2, 0x0020
     7c8:	0098                	.insn	2, 0x0098
     7ca:	0000                	.insn	2, 0x0000
     7cc:	3605                	.insn	2, 0x3605
     7ce:	0001                	.insn	2, 0x0001
     7d0:	8c00                	.insn	2, 0x8c00
     7d2:	0008                	.insn	2, 0x0008
     7d4:	2c00                	.insn	2, 0x2c00
     7d6:	075a                	.insn	2, 0x075a
     7d8:	0000                	.insn	2, 0x0000
     7da:	0350                	.insn	2, 0x0350
     7dc:	0020                	.insn	2, 0x0020
     7de:	0088                	.insn	2, 0x0088
     7e0:	0000                	.insn	2, 0x0000
     7e2:	4501                	.insn	2, 0x4501
     7e4:	1d01                	.insn	2, 0x1d01
     7e6:	0120                	.insn	2, 0x0120
     7e8:	0766                	.insn	2, 0x0766
     7ea:	0000                	.insn	2, 0x0000
     7ec:	1b05                	.insn	2, 0x1b05
     7ee:	0001                	.insn	2, 0x0001
     7f0:	7100                	.insn	2, 0x7100
     7f2:	00000007          	.insn	4, 0x0007
     7f6:	0600                	.insn	2, 0x0600
     7f8:	06e8                	.insn	2, 0x06e8
     7fa:	0000                	.insn	2, 0x0000
     7fc:	0300                	.insn	2, 0x0300
     7fe:	0020                	.insn	2, 0x0020
     800:	e806                	.insn	2, 0xe806
     802:	0006                	.insn	2, 0x0006
     804:	3400                	.insn	2, 0x3400
     806:	06002003          	lw	zero,96(zero) # 60 <$d.8+0x60>
     80a:	06e8                	.insn	2, 0x06e8
     80c:	0000                	.insn	2, 0x0000
     80e:	03b0                	.insn	2, 0x03b0
     810:	0020                	.insn	2, 0x0020
     812:	0006                	.insn	2, 0x0006
     814:	d0000007          	.insn	4, 0xd0000007
     818:	00002003          	lw	zero,0(zero) # 0 <$d.8>
     81c:	20043427          	.insn	4, 0x20043427
     820:	0800                	.insn	2, 0x0800
     822:	0000                	.insn	2, 0x0000
     824:	0100                	.insn	2, 0x0100
     826:	5352                	.insn	2, 0x5352
     828:	0006                	.insn	2, 0x0006
     82a:	0100                	.insn	2, 0x0100
     82c:	bb2d014f          	.insn	4, 0xbb2d014f
     830:	0004                	.insn	2, 0x0004
     832:	0100                	.insn	2, 0x0100
     834:	013c                	.insn	2, 0x013c
     836:	2e01                	.insn	2, 0x2e01
     838:	03c9                	.insn	2, 0x03c9
     83a:	0000                	.insn	2, 0x0000
     83c:	3c01                	.insn	2, 0x3c01
     83e:	6a01                	.insn	2, 0x6a01
     840:	0005                	.insn	2, 0x0005
     842:	2e00                	.insn	2, 0x2e00
     844:	05cc                	.insn	2, 0x05cc
     846:	0000                	.insn	2, 0x0000
     848:	3c01                	.insn	2, 0x3c01
     84a:	4b01                	.insn	2, 0x4b01
     84c:	0005                	.insn	2, 0x0005
     84e:	2e00                	.insn	2, 0x2e00
     850:	0506                	.insn	2, 0x0506
     852:	0000                	.insn	2, 0x0000
     854:	3c01                	.insn	2, 0x3c01
     856:	8a01                	.insn	2, 0x8a01
     858:	0000                	.insn	2, 0x0000
     85a:	2e00                	.insn	2, 0x2e00
     85c:	05d2                	.insn	2, 0x05d2
     85e:	0000                	.insn	2, 0x0000
     860:	3c01                	.insn	2, 0x3c01
     862:	4b01                	.insn	2, 0x4b01
     864:	0005                	.insn	2, 0x0005
     866:	2f00                	.insn	2, 0x2f00
     868:	015d                	.insn	2, 0x015d
     86a:	0000                	.insn	2, 0x0000
     86c:	4301                	.insn	2, 0x4301
     86e:	4b01                	.insn	2, 0x4b01
     870:	0005                	.insn	2, 0x0005
     872:	2f00                	.insn	2, 0x2f00
     874:	0050                	.insn	2, 0x0050
     876:	0000                	.insn	2, 0x0000
     878:	4901                	.insn	2, 0x4901
     87a:	4b01                	.insn	2, 0x4b01
     87c:	0005                	.insn	2, 0x0005
     87e:	2f00                	.insn	2, 0x2f00
     880:	000006bf 6a014a01 	.insn	8, 0x6a014a01000006bf
     888:	0005                	.insn	2, 0x0005
     88a:	3000                	.insn	2, 0x3000
     88c:	00050c2f          	.insn	4, 0x00050c2f
     890:	0100                	.insn	2, 0x0100
     892:	0145                	.insn	2, 0x0145
     894:	0000054b          	.insn	4, 0x054b
     898:	0000                	.insn	2, 0x0000
     89a:	3c31                	.insn	2, 0x3c31
     89c:	2004                	.insn	2, 0x2004
     89e:	1c00                	.insn	2, 0x1c00
     8a0:	0008                	.insn	2, 0x0008
     8a2:	0100                	.insn	2, 0x0100
     8a4:	4852                	.insn	2, 0x4852
     8a6:	0005                	.insn	2, 0x0005
     8a8:	0100                	.insn	2, 0x0100
     8aa:	04cb0157          	.insn	4, 0x04cb0157
     8ae:	0000                	.insn	2, 0x0000
     8b0:	6c32                	.insn	2, 0x6c32
     8b2:	0001                	.insn	2, 0x0001
     8b4:	c400                	.insn	2, 0xc400
     8b6:	0004                	.insn	2, 0x0004
     8b8:	0100                	.insn	2, 0x0100
     8ba:	05960157          	.insn	4, 0x05960157
     8be:	0000                	.insn	2, 0x0000
     8c0:	9232                	.insn	2, 0x9232
     8c2:	0001                	.insn	2, 0x0001
     8c4:	8e00                	.insn	2, 0x8e00
     8c6:	0005                	.insn	2, 0x0005
     8c8:	0100                	.insn	2, 0x0100
     8ca:	058b0157          	.insn	4, 0x058b0157
     8ce:	0000                	.insn	2, 0x0000
     8d0:	0001c333          	xor	t1,gp,zero
     8d4:	6100                	.insn	2, 0x6100
     8d6:	0000                	.insn	2, 0x0000
     8d8:	0100                	.insn	2, 0x0100
     8da:	015c                	.insn	2, 0x015c
     8dc:	00000083          	lb	ra,0(zero) # 0 <$d.8>
     8e0:	0002b033          	sltu	zero,t0,zero
     8e4:	1500                	.insn	2, 0x1500
     8e6:	0002                	.insn	2, 0x0002
     8e8:	0100                	.insn	2, 0x0100
     8ea:	04cb015b          	.insn	4, 0x04cb015b
     8ee:	0000                	.insn	2, 0x0000
     8f0:	0002d733          	srl	a4,t0,zero
     8f4:	2600                	.insn	2, 0x2600
     8f6:	0004                	.insn	2, 0x0004
     8f8:	0100                	.insn	2, 0x0100
     8fa:	056a0167          	jalr	sp,86(s4)
     8fe:	0000                	.insn	2, 0x0000
     900:	00035f33          	srl	t5,t1,zero
     904:	6a00                	.insn	2, 0x6a00
     906:	0004                	.insn	2, 0x0004
     908:	0100                	.insn	2, 0x0100
     90a:	0179                	.insn	2, 0x0179
     90c:	056a                	.insn	2, 0x056a
     90e:	0000                	.insn	2, 0x0000
     910:	0003a033          	sltz	zero,t2
     914:	e100                	.insn	2, 0xe100
     916:	0002                	.insn	2, 0x0002
     918:	0100                	.insn	2, 0x0100
     91a:	0194                	.insn	2, 0x0194
     91c:	057f 0000 4933 0004 	.insn	10, 0x3f00000449330000057f
     924:	3f00 
     926:	01000003          	lb	zero,16(zero) # 10 <$d.8+0x10>
     92a:	057f01a3          	sb	s7,67(t5) # 1cc9043 <__free_ram_end+0x1973043>
     92e:	0000                	.insn	2, 0x0000
     930:	0004f233          	and	tp,s1,zero
     934:	a000                	.insn	2, 0xa000
     936:	0000                	.insn	2, 0x0000
     938:	0100                	.insn	2, 0x0100
     93a:	01ad                	.insn	2, 0x01ad
     93c:	057f 0000 9a33 0005 	.insn	10, 0x570000059a330000057f
     944:	5700 
     946:	0005                	.insn	2, 0x0005
     948:	0100                	.insn	2, 0x0100
     94a:	057f01b7          	lui	gp,0x57f0
     94e:	0000                	.insn	2, 0x0000
     950:	00064233          	xor	tp,a2,zero
     954:	ca00                	.insn	2, 0xca00
     956:	0004                	.insn	2, 0x0004
     958:	0100                	.insn	2, 0x0100
     95a:	01c1                	.insn	2, 0x01c1
     95c:	057f 0000 5a34 0007 	.insn	10, 0x00075a340000057f
     964:	0000 
     966:	0000                	.insn	2, 0x0000
     968:	0100                	.insn	2, 0x0100
     96a:	0179                	.insn	2, 0x0179
     96c:	0428                	.insn	2, 0x0428
     96e:	0328                	.insn	2, 0x0328
     970:	0000                	.insn	2, 0x0000
     972:	0766                	.insn	2, 0x0766
     974:	0000                	.insn	2, 0x0000
     976:	4405                	.insn	2, 0x4405
     978:	71000003          	lb	zero,1808(zero) # 710 <$d.5+0x164>
     97c:	00000007          	.insn	4, 0x0007
     980:	2006582b          	.insn	4, 0x2006582b
     984:	3400                	.insn	2, 0x3400
     986:	0000                	.insn	2, 0x0000
     988:	3300                	.insn	2, 0x3300
     98a:	0385                	.insn	2, 0x0385
     98c:	0000                	.insn	2, 0x0000
     98e:	0506                	.insn	2, 0x0506
     990:	0000                	.insn	2, 0x0000
     992:	8401                	.insn	2, 0x8401
     994:	8a01                	.insn	2, 0x8a01
     996:	0000                	.insn	2, 0x0000
     998:	0000                	.insn	2, 0x0000
     99a:	2e2c                	.insn	2, 0x2e2c
     99c:	0008                	.insn	2, 0x0008
     99e:	9c00                	.insn	2, 0x9c00
     9a0:	2006                	.insn	2, 0x2006
     9a2:	a800                	.insn	2, 0xa800
     9a4:	0000                	.insn	2, 0x0000
     9a6:	0100                	.insn	2, 0x0100
     9a8:	04050197          	auipc	gp,0x4050
     9ac:	03c1                	.insn	2, 0x03c1
     9ae:	0000                	.insn	2, 0x0000
     9b0:	00000837          	lui	a6,0x0
     9b4:	8020                	.insn	2, 0x8020
     9b6:	8080                	.insn	2, 0x8080
     9b8:	0180                	.insn	2, 0x0180
     9ba:	00000843          	.insn	4, 0x0843
     9be:	8020                	.insn	2, 0x8020
     9c0:	8080                	.insn	2, 0x8080
     9c2:	0180                	.insn	2, 0x0180
     9c4:	0000084f          	.insn	4, 0x084f
     9c8:	0620                	.insn	2, 0x0620
     9ca:	0000085b          	.insn	4, 0x085b
     9ce:	4035                	.insn	2, 0x4035
     9d0:	00000867          	jalr	a6,zero # 0 <$d.8>
     9d4:	1205                	.insn	2, 0x1205
     9d6:	0004                	.insn	2, 0x0004
     9d8:	7300                	.insn	2, 0x7300
     9da:	0008                	.insn	2, 0x0008
     9dc:	0500                	.insn	2, 0x0500
     9de:	042e                	.insn	2, 0x042e
     9e0:	0000                	.insn	2, 0x0000
     9e2:	087f 0000 a82b 2006 	.insn	10, 0x88002006a82b0000087f
     9ea:	8800 
     9ec:	0000                	.insn	2, 0x0000
     9ee:	0500                	.insn	2, 0x0500
     9f0:	000003f7          	.insn	4, 0x03f7
     9f4:	088c                	.insn	2, 0x088c
     9f6:	0000                	.insn	2, 0x0000
     9f8:	5a2c                	.insn	2, 0x5a2c
     9fa:	a8000007          	.insn	4, 0xa8000007
     9fe:	2006                	.insn	2, 0x2006
     a00:	7800                	.insn	2, 0x7800
     a02:	0000                	.insn	2, 0x0000
     a04:	0100                	.insn	2, 0x0100
     a06:	0145                	.insn	2, 0x0145
     a08:	201d                	.insn	2, 0x201d
     a0a:	6601                	.insn	2, 0x6601
     a0c:	05000007          	.insn	4, 0x05000007
     a10:	03dc                	.insn	2, 0x03dc
     a12:	0000                	.insn	2, 0x0000
     a14:	0771                	.insn	2, 0x0771
     a16:	0000                	.insn	2, 0x0000
     a18:	0000                	.insn	2, 0x0000
     a1a:	2c00                	.insn	2, 0x2c00
     a1c:	082e                	.insn	2, 0x082e
     a1e:	0000                	.insn	2, 0x0000
     a20:	0754                	.insn	2, 0x0754
     a22:	0020                	.insn	2, 0x0020
     a24:	00a8                	.insn	2, 0x00a8
     a26:	0000                	.insn	2, 0x0000
     a28:	a501                	.insn	2, 0xa501
     a2a:	0501                	.insn	2, 0x0501
     a2c:	6a04                	.insn	2, 0x6a04
     a2e:	0004                	.insn	2, 0x0004
     a30:	3700                	.insn	2, 0x3700
     a32:	0008                	.insn	2, 0x0008
     a34:	2000                	.insn	2, 0x2000
     a36:	a080                	.insn	2, 0xa080
     a38:	8081                	.insn	2, 0x8081
     a3a:	4301                	.insn	2, 0x4301
     a3c:	0008                	.insn	2, 0x0008
     a3e:	2000                	.insn	2, 0x2000
     a40:	a080                	.insn	2, 0xa080
     a42:	8081                	.insn	2, 0x8081
     a44:	4f01                	.insn	2, 0x4f01
     a46:	0008                	.insn	2, 0x0008
     a48:	2000                	.insn	2, 0x2000
     a4a:	5b06                	.insn	2, 0x5b06
     a4c:	0008                	.insn	2, 0x0008
     a4e:	3500                	.insn	2, 0x3500
     a50:	6740                	.insn	2, 0x6740
     a52:	0008                	.insn	2, 0x0008
     a54:	0500                	.insn	2, 0x0500
     a56:	000004bb          	.insn	4, 0x04bb
     a5a:	00000873          	.insn	4, 0x0873
     a5e:	d705                	.insn	2, 0xd705
     a60:	0004                	.insn	2, 0x0004
     a62:	7f00                	.insn	2, 0x7f00
     a64:	0008                	.insn	2, 0x0008
     a66:	2b00                	.insn	2, 0x2b00
     a68:	0760                	.insn	2, 0x0760
     a6a:	0020                	.insn	2, 0x0020
     a6c:	0088                	.insn	2, 0x0088
     a6e:	0000                	.insn	2, 0x0000
     a70:	a005                	.insn	2, 0xa005
     a72:	0004                	.insn	2, 0x0004
     a74:	8c00                	.insn	2, 0x8c00
     a76:	0008                	.insn	2, 0x0008
     a78:	2c00                	.insn	2, 0x2c00
     a7a:	075a                	.insn	2, 0x075a
     a7c:	0000                	.insn	2, 0x0000
     a7e:	0760                	.insn	2, 0x0760
     a80:	0020                	.insn	2, 0x0020
     a82:	0078                	.insn	2, 0x0078
     a84:	0000                	.insn	2, 0x0000
     a86:	4501                	.insn	2, 0x4501
     a88:	1d01                	.insn	2, 0x1d01
     a8a:	0120                	.insn	2, 0x0120
     a8c:	0766                	.insn	2, 0x0766
     a8e:	0000                	.insn	2, 0x0000
     a90:	8505                	.insn	2, 0x8505
     a92:	0004                	.insn	2, 0x0004
     a94:	7100                	.insn	2, 0x7100
     a96:	00000007          	.insn	4, 0x0007
     a9a:	0000                	.insn	2, 0x0000
     a9c:	2e2c                	.insn	2, 0x2e2c
     a9e:	0008                	.insn	2, 0x0008
     aa0:	0c00                	.insn	2, 0x0c00
     aa2:	2008                	.insn	2, 0x2008
     aa4:	a800                	.insn	2, 0xa800
     aa6:	0000                	.insn	2, 0x0000
     aa8:	0100                	.insn	2, 0x0100
     aaa:	040501af          	.insn	4, 0x040501af
     aae:	0511                	.insn	2, 0x0511
     ab0:	0000                	.insn	2, 0x0000
     ab2:	00000837          	lui	a6,0x0
     ab6:	8020                	.insn	2, 0x8020
     ab8:	0880                	.insn	2, 0x0880
     aba:	00000843          	.insn	4, 0x0843
     abe:	8020                	.insn	2, 0x8020
     ac0:	0880                	.insn	2, 0x0880
     ac2:	0000084f          	.insn	4, 0x084f
     ac6:	0620                	.insn	2, 0x0620
     ac8:	0000085b          	.insn	4, 0x085b
     acc:	0035                	.insn	2, 0x0035
     ace:	00000867          	jalr	a6,zero # 0 <$d.8>
     ad2:	6205                	.insn	2, 0x6205
     ad4:	0005                	.insn	2, 0x0005
     ad6:	7300                	.insn	2, 0x7300
     ad8:	0008                	.insn	2, 0x0008
     ada:	0500                	.insn	2, 0x0500
     adc:	057f 0000 087f 0000 	.insn	10, 0x182b0000087f0000057f
     ae4:	182b 
     ae6:	2008                	.insn	2, 0x2008
     ae8:	8800                	.insn	2, 0x8800
     aea:	0000                	.insn	2, 0x0000
     aec:	0500                	.insn	2, 0x0500
     aee:	00000547          	.insn	4, 0x0547
     af2:	088c                	.insn	2, 0x088c
     af4:	0000                	.insn	2, 0x0000
     af6:	5a2c                	.insn	2, 0x5a2c
     af8:	18000007          	.insn	4, 0x18000007
     afc:	2008                	.insn	2, 0x2008
     afe:	7800                	.insn	2, 0x7800
     b00:	0000                	.insn	2, 0x0000
     b02:	0100                	.insn	2, 0x0100
     b04:	0145                	.insn	2, 0x0145
     b06:	201d                	.insn	2, 0x201d
     b08:	6601                	.insn	2, 0x6601
     b0a:	05000007          	.insn	4, 0x05000007
     b0e:	052c                	.insn	2, 0x052c
     b10:	0000                	.insn	2, 0x0000
     b12:	0771                	.insn	2, 0x0771
     b14:	0000                	.insn	2, 0x0000
     b16:	0000                	.insn	2, 0x0000
     b18:	2c00                	.insn	2, 0x2c00
     b1a:	082e                	.insn	2, 0x082e
     b1c:	0000                	.insn	2, 0x0000
     b1e:	08c4                	.insn	2, 0x08c4
     b20:	0020                	.insn	2, 0x0020
     b22:	00b4                	.insn	2, 0x00b4
     b24:	0000                	.insn	2, 0x0000
     b26:	b901                	.insn	2, 0xb901
     b28:	0501                	.insn	2, 0x0501
     b2a:	b904                	.insn	2, 0xb904
     b2c:	0005                	.insn	2, 0x0005
     b2e:	3700                	.insn	2, 0x3700
     b30:	0008                	.insn	2, 0x0008
     b32:	2000                	.insn	2, 0x2000
     b34:	8080                	.insn	2, 0x8080
     b36:	430c                	.insn	2, 0x430c
     b38:	0008                	.insn	2, 0x0008
     b3a:	2000                	.insn	2, 0x2000
     b3c:	8080                	.insn	2, 0x8080
     b3e:	4f0c                	.insn	2, 0x4f0c
     b40:	0008                	.insn	2, 0x0008
     b42:	2000                	.insn	2, 0x2000
     b44:	5b06                	.insn	2, 0x5b06
     b46:	0008                	.insn	2, 0x0008
     b48:	3500                	.insn	2, 0x3500
     b4a:	6700                	.insn	2, 0x6700
     b4c:	0008                	.insn	2, 0x0008
     b4e:	0500                	.insn	2, 0x0500
     b50:	060a                	.insn	2, 0x060a
     b52:	0000                	.insn	2, 0x0000
     b54:	00000873          	.insn	4, 0x0873
     b58:	2705                	.insn	2, 0x2705
     b5a:	0006                	.insn	2, 0x0006
     b5c:	7f00                	.insn	2, 0x7f00
     b5e:	0008                	.insn	2, 0x0008
     b60:	2b00                	.insn	2, 0x2b00
     b62:	08d0                	.insn	2, 0x08d0
     b64:	0020                	.insn	2, 0x0020
     b66:	0088                	.insn	2, 0x0088
     b68:	0000                	.insn	2, 0x0000
     b6a:	ef05                	.insn	2, 0xef05
     b6c:	0005                	.insn	2, 0x0005
     b6e:	8c00                	.insn	2, 0x8c00
     b70:	0008                	.insn	2, 0x0008
     b72:	2c00                	.insn	2, 0x2c00
     b74:	075a                	.insn	2, 0x075a
     b76:	0000                	.insn	2, 0x0000
     b78:	08d0                	.insn	2, 0x08d0
     b7a:	0020                	.insn	2, 0x0020
     b7c:	0078                	.insn	2, 0x0078
     b7e:	0000                	.insn	2, 0x0000
     b80:	4501                	.insn	2, 0x4501
     b82:	1d01                	.insn	2, 0x1d01
     b84:	0120                	.insn	2, 0x0120
     b86:	0766                	.insn	2, 0x0766
     b88:	0000                	.insn	2, 0x0000
     b8a:	d405                	.insn	2, 0xd405
     b8c:	0005                	.insn	2, 0x0005
     b8e:	7100                	.insn	2, 0x7100
     b90:	00000007          	.insn	4, 0x0007
     b94:	0000                	.insn	2, 0x0000
     b96:	2e2c                	.insn	2, 0x2e2c
     b98:	0008                	.insn	2, 0x0008
     b9a:	8800                	.insn	2, 0x8800
     b9c:	2009                	.insn	2, 0x2009
     b9e:	a800                	.insn	2, 0xa800
     ba0:	0000                	.insn	2, 0x0000
     ba2:	0100                	.insn	2, 0x0100
     ba4:	040501c3          	.insn	4, 0x040501c3
     ba8:	00000663          	beqz	zero,bb4 <$d.3+0x42e>
     bac:	00000837          	lui	a6,0x0
     bb0:	8020                	.insn	2, 0x8020
     bb2:	81c0                	.insn	2, 0x81c0
     bb4:	0180                	.insn	2, 0x0180
     bb6:	00000843          	.insn	4, 0x0843
     bba:	8020                	.insn	2, 0x8020
     bbc:	81c0                	.insn	2, 0x81c0
     bbe:	0180                	.insn	2, 0x0180
     bc0:	0000084f          	.insn	4, 0x084f
     bc4:	0620                	.insn	2, 0x0620
     bc6:	0000085b          	.insn	4, 0x085b
     bca:	4035                	.insn	2, 0x4035
     bcc:	00000867          	jalr	a6,zero # 0 <$d.8>
     bd0:	b405                	.insn	2, 0xb405
     bd2:	0006                	.insn	2, 0x0006
     bd4:	7300                	.insn	2, 0x7300
     bd6:	0008                	.insn	2, 0x0008
     bd8:	0500                	.insn	2, 0x0500
     bda:	06d0                	.insn	2, 0x06d0
     bdc:	0000                	.insn	2, 0x0000
     bde:	087f 0000 942b 2009 	.insn	10, 0x88002009942b0000087f
     be6:	8800 
     be8:	0000                	.insn	2, 0x0000
     bea:	0500                	.insn	2, 0x0500
     bec:	0699                	.insn	2, 0x0699
     bee:	0000                	.insn	2, 0x0000
     bf0:	088c                	.insn	2, 0x088c
     bf2:	0000                	.insn	2, 0x0000
     bf4:	5a2c                	.insn	2, 0x5a2c
     bf6:	94000007          	.insn	4, 0x94000007
     bfa:	2009                	.insn	2, 0x2009
     bfc:	7800                	.insn	2, 0x7800
     bfe:	0000                	.insn	2, 0x0000
     c00:	0100                	.insn	2, 0x0100
     c02:	0145                	.insn	2, 0x0145
     c04:	201d                	.insn	2, 0x201d
     c06:	6601                	.insn	2, 0x6601
     c08:	05000007          	.insn	4, 0x05000007
     c0c:	067e                	.insn	2, 0x067e
     c0e:	0000                	.insn	2, 0x0000
     c10:	0771                	.insn	2, 0x0771
     c12:	0000                	.insn	2, 0x0000
     c14:	0000                	.insn	2, 0x0000
     c16:	3600                	.insn	2, 0x3600
     c18:	0018                	.insn	2, 0x0018
     c1a:	0000                	.insn	2, 0x0000
     c1c:	0007d033          	srl	zero,a5,zero
     c20:	ad00                	.insn	2, 0xad00
     c22:	0000                	.insn	2, 0x0000
     c24:	0100                	.insn	2, 0x0100
     c26:	01e4                	.insn	2, 0x01e4
     c28:	0000054b          	.insn	4, 0x054b
     c2c:	200a742b          	.insn	4, 0x200a742b
     c30:	a800                	.insn	2, 0xa800
     c32:	0000                	.insn	2, 0x0000
     c34:	3700                	.insn	2, 0x3700
     c36:	6701                	.insn	2, 0x6701
     c38:	00000347          	.insn	4, 0x0347
     c3c:	d101                	.insn	2, 0xd101
     c3e:	4b01                	.insn	2, 0x4b01
     c40:	0005                	.insn	2, 0x0005
     c42:	3600                	.insn	2, 0x3600
     c44:	0030                	.insn	2, 0x0030
     c46:	0000                	.insn	2, 0x0000
     c48:	0006eb33          	or	s6,a3,zero
     c4c:	eb00                	.insn	2, 0xeb00
     c4e:	0002                	.insn	2, 0x0002
     c50:	0100                	.insn	2, 0x0100
     c52:	008a01d3          	.insn	4, 0x008a01d3
     c56:	0000                	.insn	2, 0x0000
     c58:	00071133          	sll	sp,a4,zero
     c5c:	8200                	.insn	2, 0x8200
     c5e:	0004                	.insn	2, 0x0004
     c60:	0100                	.insn	2, 0x0100
     c62:	01d5                	.insn	2, 0x01d5
     c64:	0000058b          	.insn	4, 0x058b
     c68:	00074133          	xor	sp,a4,zero
     c6c:	cf00                	.insn	2, 0xcf00
     c6e:	0000                	.insn	2, 0x0000
     c70:	0100                	.insn	2, 0x0100
     c72:	01d6                	.insn	2, 0x01d6
     c74:	0000058b          	.insn	4, 0x058b
     c78:	5a34                	.insn	2, 0x5a34
     c7a:	48000007          	.insn	4, 0x48000007
     c7e:	0000                	.insn	2, 0x0000
     c80:	0100                	.insn	2, 0x0100
     c82:	041c01d3          	.insn	4, 0x041c01d3
     c86:	075c                	.insn	2, 0x075c
     c88:	0000                	.insn	2, 0x0000
     c8a:	0766                	.insn	2, 0x0766
     c8c:	0000                	.insn	2, 0x0000
     c8e:	8405                	.insn	2, 0x8405
     c90:	71000007          	.insn	4, 0x71000007
     c94:	00000007          	.insn	4, 0x0007
     c98:	0000                	.insn	2, 0x0000
     c9a:	6036                	.insn	2, 0x6036
     c9c:	0000                	.insn	2, 0x0000
     c9e:	3300                	.insn	2, 0x3300
     ca0:	07aa                	.insn	2, 0x07aa
     ca2:	0000                	.insn	2, 0x0000
     ca4:	0105                	.insn	2, 0x0105
     ca6:	0000                	.insn	2, 0x0000
     ca8:	e801                	.insn	2, 0xe801
     caa:	4b01                	.insn	2, 0x4b01
     cac:	0005                	.insn	2, 0x0005
     cae:	3600                	.insn	2, 0x3600
     cb0:	0078                	.insn	2, 0x0078
     cb2:	0000                	.insn	2, 0x0000
     cb4:	00084e33          	xor	t3,a6,zero
     cb8:	eb00                	.insn	2, 0xeb00
     cba:	0002                	.insn	2, 0x0002
     cbc:	0100                	.insn	2, 0x0100
     cbe:	01ec                	.insn	2, 0x01ec
     cc0:	008a                	.insn	2, 0x008a
     cc2:	0000                	.insn	2, 0x0000
     cc4:	5a34                	.insn	2, 0x5a34
     cc6:	90000007          	.insn	4, 0x90000007
     cca:	0000                	.insn	2, 0x0000
     ccc:	0100                	.insn	2, 0x0100
     cce:	01ec                	.insn	2, 0x01ec
     cd0:	041c                	.insn	2, 0x041c
     cd2:	0800                	.insn	2, 0x0800
     cd4:	0000                	.insn	2, 0x0000
     cd6:	0766                	.insn	2, 0x0766
     cd8:	0000                	.insn	2, 0x0000
     cda:	2805                	.insn	2, 0x2805
     cdc:	0008                	.insn	2, 0x0008
     cde:	7100                	.insn	2, 0x7100
     ce0:	00000007          	.insn	4, 0x0007
     ce4:	0000                	.insn	2, 0x0000
     ce6:	0600                	.insn	2, 0x0600
     ce8:	06e8                	.insn	2, 0x06e8
     cea:	0000                	.insn	2, 0x0000
     cec:	0530                	.insn	2, 0x0530
     cee:	0020                	.insn	2, 0x0020
     cf0:	e806                	.insn	2, 0xe806
     cf2:	0006                	.insn	2, 0x0006
     cf4:	2c00                	.insn	2, 0x2c00
     cf6:	2006                	.insn	2, 0x2006
     cf8:	0600                	.insn	2, 0x0600
     cfa:	0700                	.insn	2, 0x0700
     cfc:	0000                	.insn	2, 0x0000
     cfe:	0648                	.insn	2, 0x0648
     d00:	0020                	.insn	2, 0x0020
     d02:	e806                	.insn	2, 0xe806
     d04:	0006                	.insn	2, 0x0006
     d06:	5800                	.insn	2, 0x5800
     d08:	2006                	.insn	2, 0x2006
     d0a:	0600                	.insn	2, 0x0600
     d0c:	077d                	.insn	2, 0x077d
     d0e:	0000                	.insn	2, 0x0000
     d10:	0684                	.insn	2, 0x0684
     d12:	0020                	.insn	2, 0x0020
     d14:	e806                	.insn	2, 0xe806
     d16:	0006                	.insn	2, 0x0006
     d18:	9c00                	.insn	2, 0x9c00
     d1a:	2006                	.insn	2, 0x2006
     d1c:	0600                	.insn	2, 0x0600
     d1e:	06e8                	.insn	2, 0x06e8
     d20:	0000                	.insn	2, 0x0000
     d22:	0708                	.insn	2, 0x0708
     d24:	0020                	.insn	2, 0x0020
     d26:	0006                	.insn	2, 0x0006
     d28:	20000007          	.insn	4, 0x20000007
     d2c:	06002007          	.insn	4, 0x06002007
     d30:	06e8                	.insn	2, 0x06e8
     d32:	0000                	.insn	2, 0x0000
     d34:	0754                	.insn	2, 0x0754
     d36:	0020                	.insn	2, 0x0020
     d38:	e806                	.insn	2, 0xe806
     d3a:	0006                	.insn	2, 0x0006
     d3c:	c000                	.insn	2, 0xc000
     d3e:	06002007          	.insn	4, 0x06002007
     d42:	0700                	.insn	2, 0x0700
     d44:	0000                	.insn	2, 0x0000
     d46:	07d8                	.insn	2, 0x07d8
     d48:	0020                	.insn	2, 0x0020
     d4a:	e806                	.insn	2, 0xe806
     d4c:	0006                	.insn	2, 0x0006
     d4e:	0c00                	.insn	2, 0x0c00
     d50:	2008                	.insn	2, 0x2008
     d52:	0600                	.insn	2, 0x0600
     d54:	06e8                	.insn	2, 0x06e8
     d56:	0000                	.insn	2, 0x0000
     d58:	0878                	.insn	2, 0x0878
     d5a:	0020                	.insn	2, 0x0020
     d5c:	0006                	.insn	2, 0x0006
     d5e:	90000007          	.insn	4, 0x90000007
     d62:	2008                	.insn	2, 0x2008
     d64:	0600                	.insn	2, 0x0600
     d66:	06e8                	.insn	2, 0x06e8
     d68:	0000                	.insn	2, 0x0000
     d6a:	08c4                	.insn	2, 0x08c4
     d6c:	0020                	.insn	2, 0x0020
     d6e:	e806                	.insn	2, 0xe806
     d70:	0006                	.insn	2, 0x0006
     d72:	3000                	.insn	2, 0x3000
     d74:	2009                	.insn	2, 0x2009
     d76:	0600                	.insn	2, 0x0600
     d78:	0700                	.insn	2, 0x0700
     d7a:	0000                	.insn	2, 0x0000
     d7c:	0948                	.insn	2, 0x0948
     d7e:	0020                	.insn	2, 0x0020
     d80:	e806                	.insn	2, 0xe806
     d82:	0006                	.insn	2, 0x0006
     d84:	8800                	.insn	2, 0x8800
     d86:	2009                	.insn	2, 0x2009
     d88:	0600                	.insn	2, 0x0600
     d8a:	06e8                	.insn	2, 0x06e8
     d8c:	0000                	.insn	2, 0x0000
     d8e:	09f4                	.insn	2, 0x09f4
     d90:	0020                	.insn	2, 0x0020
     d92:	0006                	.insn	2, 0x0006
     d94:	0c000007          	.insn	4, 0x0c000007
     d98:	200a                	.insn	2, 0x200a
     d9a:	0600                	.insn	2, 0x0600
     d9c:	06e8                	.insn	2, 0x06e8
     d9e:	0000                	.insn	2, 0x0000
     da0:	0a48                	.insn	2, 0x0a48
     da2:	0020                	.insn	2, 0x0020
     da4:	f606                	.insn	2, 0xf606
     da6:	000d                	.insn	2, 0x000d
     da8:	8400                	.insn	2, 0x8400
     daa:	200a                	.insn	2, 0x200a
     dac:	0600                	.insn	2, 0x0600
     dae:	077d                	.insn	2, 0x077d
     db0:	0000                	.insn	2, 0x0000
     db2:	0a9c                	.insn	2, 0x0a9c
     db4:	0020                	.insn	2, 0x0020
     db6:	0006                	.insn	2, 0x0006
     db8:	ec000007          	.insn	4, 0xec000007
     dbc:	200a                	.insn	2, 0x200a
     dbe:	0600                	.insn	2, 0x0600
     dc0:	06e8                	.insn	2, 0x06e8
     dc2:	0000                	.insn	2, 0x0000
     dc4:	0b18                	.insn	2, 0x0b18
     dc6:	0020                	.insn	2, 0x0020
     dc8:	e806                	.insn	2, 0xe806
     dca:	0006                	.insn	2, 0x0006
     dcc:	2c00                	.insn	2, 0x2c00
     dce:	0600200b          	.insn	4, 0x0600200b
     dd2:	0700                	.insn	2, 0x0700
     dd4:	0000                	.insn	2, 0x0000
     dd6:	0b90                	.insn	2, 0x0b90
     dd8:	0020                	.insn	2, 0x0020
     dda:	7d06                	.insn	2, 0x7d06
     ddc:	a8000007          	.insn	4, 0xa8000007
     de0:	0600200b          	.insn	4, 0x0600200b
     de4:	06e8                	.insn	2, 0x06e8
     de6:	0000                	.insn	2, 0x0000
     de8:	0bf8                	.insn	2, 0x0bf8
     dea:	0020                	.insn	2, 0x0020
     dec:	e806                	.insn	2, 0xe806
     dee:	0006                	.insn	2, 0x0006
     df0:	5400                	.insn	2, 0x5400
     df2:	200c                	.insn	2, 0x200c
     df4:	0000                	.insn	2, 0x0000
     df6:	e625                	.insn	2, 0xe625
     df8:	0001                	.insn	2, 0x0001
     dfa:	0500                	.insn	2, 0x0500
     dfc:	6925                	.insn	2, 0x6925
     dfe:	0005                	.insn	2, 0x0005
     e00:	2300                	.insn	2, 0x2300
     e02:	0569                	.insn	2, 0x0569
     e04:	0000                	.insn	2, 0x0000
     e06:	00059623          	sh	zero,12(a1)
     e0a:	2300                	.insn	2, 0x2300
     e0c:	0000071b          	.insn	4, 0x071b
     e10:	3800                	.insn	2, 0x3800
     e12:	0c58                	.insn	2, 0x0c58
     e14:	0020                	.insn	2, 0x0020
     e16:	0288                	.insn	2, 0x0288
     e18:	0000                	.insn	2, 0x0000
     e1a:	5201                	.insn	2, 0x5201
     e1c:	05d8                	.insn	2, 0x05d8
     e1e:	0000                	.insn	2, 0x0000
     e20:	0201                	.insn	2, 0x0201
     e22:	3302                	.insn	2, 0x3302
     e24:	0956                	.insn	2, 0x0956
     e26:	0000                	.insn	2, 0x0000
     e28:	00000567          	jalr	a0,zero # 0 <$d.8>
     e2c:	0501                	.insn	2, 0x0501
     e2e:	cb02                	.insn	2, 0xcb02
     e30:	0004                	.insn	2, 0x0004
     e32:	3300                	.insn	2, 0x3300
     e34:	097c                	.insn	2, 0x097c
     e36:	0000                	.insn	2, 0x0000
     e38:	043e                	.insn	2, 0x043e
     e3a:	0000                	.insn	2, 0x0000
     e3c:	1401                	.insn	2, 0x1401
     e3e:	cb02                	.insn	2, 0xcb02
     e40:	0004                	.insn	2, 0x0004
     e42:	3600                	.insn	2, 0x3600
     e44:	00a8                	.insn	2, 0x00a8
     e46:	0000                	.insn	2, 0x0000
     e48:	0008d133          	srl	sp,a7,zero
     e4c:	6100                	.insn	2, 0x6100
     e4e:	0000                	.insn	2, 0x0000
     e50:	0100                	.insn	2, 0x0100
     e52:	0206                	.insn	2, 0x0206
     e54:	00000083          	lb	ra,0(zero) # 0 <$d.8>
     e58:	c036                	.insn	2, 0xc036
     e5a:	0000                	.insn	2, 0x0000
     e5c:	3300                	.insn	2, 0x3300
     e5e:	0869                	.insn	2, 0x0869
     e60:	0000                	.insn	2, 0x0000
     e62:	0215                	.insn	2, 0x0215
     e64:	0000                	.insn	2, 0x0000
     e66:	0701                	.insn	2, 0x0701
     e68:	cb02                	.insn	2, 0xcb02
     e6a:	0004                	.insn	2, 0x0004
     e6c:	0000                	.insn	2, 0x0000
     e6e:	0600                	.insn	2, 0x0600
     e70:	0748                	.insn	2, 0x0748
     e72:	0000                	.insn	2, 0x0000
     e74:	0ee0                	.insn	2, 0x0ee0
     e76:	0020                	.insn	2, 0x0020
     e78:	0200                	.insn	2, 0x0200
     e7a:	0ee0                	.insn	2, 0x0ee0
     e7c:	0020                	.insn	2, 0x0020
     e7e:	000c                	.insn	2, 0x000c
     e80:	0000                	.insn	2, 0x0000
     e82:	5201                	.insn	2, 0x5201
     e84:	0eae                	.insn	2, 0x0eae
     e86:	0000                	.insn	2, 0x0000
     e88:	b72a                	.insn	2, 0xb72a
     e8a:	000e                	.insn	2, 0x000e
     e8c:	0000                	.insn	2, 0x0000
     e8e:	ed39                	.insn	2, 0xed39
     e90:	0001                	.insn	2, 0x0001
     e92:	0100                	.insn	2, 0x0100
     e94:	0159                	.insn	2, 0x0159
     e96:	0006ee1b          	.insn	4, 0x0006ee1b
     e9a:	0100                	.insn	2, 0x0100
     e9c:	c059                	.insn	2, 0xc059
     e9e:	0000                	.insn	2, 0x0000
     ea0:	0000                	.insn	2, 0x0000
     ea2:	923a                	.insn	2, 0x923a
     ea4:	0001                	.insn	2, 0x0001
     ea6:	0100                	.insn	2, 0x0100
     ea8:	6262                	.insn	2, 0x6262
     eaa:	0005                	.insn	2, 0x0005
     eac:	0100                	.insn	2, 0x0100
     eae:	0003a63b          	.insn	4, 0x0003a63b
     eb2:	0100                	.insn	2, 0x0100
     eb4:	2f01022f          	.insn	4, 0x2f01022f
     eb8:	020c                	.insn	2, 0x020c
     eba:	0000                	.insn	2, 0x0000
     ebc:	3701                	.insn	2, 0x3701
     ebe:	7902                	.insn	2, 0x7902
     ec0:	0005                	.insn	2, 0x0005
     ec2:	0000                	.insn	2, 0x0000
     ec4:	ec38                	.insn	2, 0xec38
     ec6:	200e                	.insn	2, 0x200e
     ec8:	7400                	.insn	2, 0x7400
     eca:	0002                	.insn	2, 0x0002
     ecc:	0100                	.insn	2, 0x0100
     ece:	1552                	.insn	2, 0x1552
     ed0:	0005                	.insn	2, 0x0005
     ed2:	0100                	.insn	2, 0x0100
     ed4:	0241                	.insn	2, 0x0241
     ed6:	9732                	.insn	2, 0x9732
     ed8:	0009                	.insn	2, 0x0009
     eda:	5600                	.insn	2, 0x5600
     edc:	0004                	.insn	2, 0x0004
     ede:	0100                	.insn	2, 0x0100
     ee0:	0241                	.insn	2, 0x0241
     ee2:	1601                	.insn	2, 0x1601
     ee4:	0000                	.insn	2, 0x0000
     ee6:	8e34                	.insn	2, 0x8e34
     ee8:	000e                	.insn	2, 0x000e
     eea:	d800                	.insn	2, 0xd800
     eec:	0000                	.insn	2, 0x0000
     eee:	0100                	.insn	2, 0x0100
     ef0:	0245                	.insn	2, 0x0245
     ef2:	040d                	.insn	2, 0x040d
     ef4:	09ff 0000 0e96 0000 	.insn	10, 0xbb1f00000e96000009ff
     efc:	bb1f 
     efe:	0005                	.insn	2, 0x0005
     f00:	4800                	.insn	2, 0x4800
     f02:	0400200f          	.insn	4, 0x0400200f
     f06:	0000                	.insn	2, 0x0000
     f08:	0100                	.insn	2, 0x0100
     f0a:	88200c5b          	.insn	4, 0x88200c5b
     f0e:	8080                	.insn	2, 0x8080
     f10:	0180                	.insn	2, 0x0180
     f12:	000005c7          	.insn	4, 0x05c7
     f16:	1f00                	.insn	2, 0x1f00
     f18:	000005d3          	.insn	4, 0x05d3
     f1c:	1044                	.insn	2, 0x1044
     f1e:	0020                	.insn	2, 0x0020
     f20:	0008                	.insn	2, 0x0008
     f22:	0000                	.insn	2, 0x0000
     f24:	5e01                	.insn	2, 0x5e01
     f26:	2005                	.insn	2, 0x2005
     f28:	8080                	.insn	2, 0x8080
     f2a:	8080                	.insn	2, 0x8080
     f2c:	db01                	.insn	2, 0xdb01
     f2e:	0005                	.insn	2, 0x0005
     f30:	2100                	.insn	2, 0x2100
     f32:	5a01                	.insn	2, 0x5a01
     f34:	05e6                	.insn	2, 0x05e6
     f36:	0000                	.insn	2, 0x0000
     f38:	0000                	.insn	2, 0x0000
     f3a:	200f942b          	.insn	4, 0x200f942b
     f3e:	9000                	.insn	2, 0x9000
     f40:	0000                	.insn	2, 0x0000
     f42:	3300                	.insn	2, 0x3300
     f44:	0a29                	.insn	2, 0x0a29
     f46:	0000                	.insn	2, 0x0000
     f48:	03b0                	.insn	2, 0x03b0
     f4a:	0000                	.insn	2, 0x0000
     f4c:	5d01                	.insn	2, 0x5d01
     f4e:	6f02                	.insn	2, 0x6f02
     f50:	0005                	.insn	2, 0x0005
     f52:	3300                	.insn	2, 0x3300
     f54:	0a44                	.insn	2, 0x0a44
     f56:	0000                	.insn	2, 0x0000
     f58:	034e                	.insn	2, 0x034e
     f5a:	0000                	.insn	2, 0x0000
     f5c:	5f01                	.insn	2, 0x5f01
     f5e:	6f02                	.insn	2, 0x6f02
     f60:	0005                	.insn	2, 0x0005
     f62:	3300                	.insn	2, 0x3300
     f64:	0a5f 0000 0176      	.insn	6, 0x017600000a5f
     f6a:	0000                	.insn	2, 0x0000
     f6c:	6101                	.insn	2, 0x6101
     f6e:	6a02                	.insn	2, 0x6a02
     f70:	0005                	.insn	2, 0x0005
     f72:	2f00                	.insn	2, 0x2f00
     f74:	010e                	.insn	2, 0x010e
     f76:	0000                	.insn	2, 0x0000
     f78:	6301                	.insn	2, 0x6301
     f7a:	5602                	.insn	2, 0x5602
     f7c:	0005                	.insn	2, 0x0005
     f7e:	0000                	.insn	2, 0x0000
     f80:	2010502b          	.insn	4, 0x2010502b
     f84:	2800                	.insn	2, 0x2800
     f86:	0000                	.insn	2, 0x0000
     f88:	3300                	.insn	2, 0x3300
     f8a:	0a7a                	.insn	2, 0x0a7a
     f8c:	0000                	.insn	2, 0x0000
     f8e:	06ee                	.insn	2, 0x06ee
     f90:	0000                	.insn	2, 0x0000
     f92:	4b01                	.insn	2, 0x4b01
     f94:	6202                	.insn	2, 0x6202
     f96:	0005                	.insn	2, 0x0005
     f98:	2c00                	.insn	2, 0x2c00
     f9a:	0ea2                	.insn	2, 0x0ea2
     f9c:	0000                	.insn	2, 0x0000
     f9e:	1050                	.insn	2, 0x1050
     fa0:	0020                	.insn	2, 0x0020
     fa2:	0018                	.insn	2, 0x0018
     fa4:	0000                	.insn	2, 0x0000
     fa6:	4b01                	.insn	2, 0x4b01
     fa8:	1b02                	.insn	2, 0x1b02
     faa:	bb1f 0005 5000      	.insn	6, 0x50000005bb1f
     fb0:	2010                	.insn	2, 0x2010
     fb2:	0400                	.insn	2, 0x0400
     fb4:	0000                	.insn	2, 0x0000
     fb6:	0100                	.insn	2, 0x0100
     fb8:	0d64                	.insn	2, 0x0d64
     fba:	8820                	.insn	2, 0x8820
     fbc:	8080                	.insn	2, 0x8080
     fbe:	0180                	.insn	2, 0x0180
     fc0:	000005c7          	.insn	4, 0x05c7
     fc4:	1f00                	.insn	2, 0x1f00
     fc6:	000005bb          	.insn	4, 0x05bb
     fca:	1064                	.insn	2, 0x1064
     fcc:	0020                	.insn	2, 0x0020
     fce:	0004                	.insn	2, 0x0004
     fd0:	0000                	.insn	2, 0x0000
     fd2:	6701                	.insn	2, 0x6701
     fd4:	80842013          	slti	zero,s0,-2040
     fd8:	8080                	.insn	2, 0x8080
     fda:	c701                	.insn	2, 0xc701
     fdc:	0005                	.insn	2, 0x0005
     fde:	0000                	.insn	2, 0x0000
     fe0:	0000                	.insn	2, 0x0000
     fe2:	2010bc2b          	.insn	4, 0x2010bc2b
     fe6:	7c00                	.insn	2, 0x7c00
     fe8:	0000                	.insn	2, 0x0000
     fea:	3300                	.insn	2, 0x3300
     fec:	0a95                	.insn	2, 0x0a95
     fee:	0000                	.insn	2, 0x0000
     ff0:	0072                	.insn	2, 0x0072
     ff2:	0000                	.insn	2, 0x0000
     ff4:	7301                	.insn	2, 0x7301
     ff6:	8b02                	.insn	2, 0x8b02
     ff8:	0005                	.insn	2, 0x0005
     ffa:	3300                	.insn	2, 0x3300
     ffc:	00000abb          	.insn	4, 0x0abb
    1000:	00ca                	.insn	2, 0x00ca
    1002:	0000                	.insn	2, 0x0000
    1004:	7201                	.insn	2, 0x7201
    1006:	7f02                	.insn	2, 0x7f02
    1008:	0005                	.insn	2, 0x0005
    100a:	0000                	.insn	2, 0x0000
    100c:	ae3c                	.insn	2, 0xae3c
    100e:	000e                	.insn	2, 0x000e
    1010:	5400                	.insn	2, 0x5400
    1012:	2011                	.insn	2, 0x2011
    1014:	0c00                	.insn	2, 0x0c00
    1016:	0000                	.insn	2, 0x0000
    1018:	0100                	.insn	2, 0x0100
    101a:	0289                	.insn	2, 0x0289
    101c:	3d0d                	.insn	2, 0x3d0d
    101e:	1054                	.insn	2, 0x1054
    1020:	0000                	.insn	2, 0x0000
    1022:	0f94                	.insn	2, 0x0f94
    1024:	0020                	.insn	2, 0x0020
    1026:	613d                	.insn	2, 0x613d
    1028:	0010                	.insn	2, 0x0010
    102a:	2400                	.insn	2, 0x2400
    102c:	2010                	.insn	2, 0x2010
    102e:	0600                	.insn	2, 0x0600
    1030:	06e8                	.insn	2, 0x06e8
    1032:	0000                	.insn	2, 0x0000
    1034:	1040                	.insn	2, 0x1040
    1036:	0020                	.insn	2, 0x0020
    1038:	a23d                	.insn	2, 0xa23d
    103a:	0010                	.insn	2, 0x0010
    103c:	bc00                	.insn	2, 0xbc00
    103e:	2010                	.insn	2, 0x2010
    1040:	3d00                	.insn	2, 0x3d00
    1042:	000010af          	.insn	4, 0x10af
    1046:	1138                	.insn	2, 0x1138
    1048:	0020                	.insn	2, 0x0020
    104a:	e806                	.insn	2, 0xe806
    104c:	0006                	.insn	2, 0x0006
    104e:	5400                	.insn	2, 0x5400
    1050:	2011                	.insn	2, 0x2011
    1052:	0000                	.insn	2, 0x0000
    1054:	c622                	.insn	2, 0xc622
    1056:	0006                	.insn	2, 0x0006
    1058:	0500                	.insn	2, 0x0500
    105a:	2326                	.insn	2, 0x2326
    105c:	00000083          	lb	ra,0(zero) # 0 <$d.8>
    1060:	2200                	.insn	2, 0x2200
    1062:	0000047b          	.insn	4, 0x047b
    1066:	2006                	.insn	2, 0x2006
    1068:	00107d23          	.insn	4, 0x00107d23
    106c:	2300                	.insn	2, 0x2300
    106e:	107d                	.insn	2, 0x107d
    1070:	0000                	.insn	2, 0x0000
    1072:	00108223          	sb	ra,4(ra)
    1076:	2300                	.insn	2, 0x2300
    1078:	1092                	.insn	2, 0x1092
    107a:	0000                	.insn	2, 0x0000
    107c:	1200                	.insn	2, 0x1200
    107e:	1082                	.insn	2, 0x1082
    1080:	0000                	.insn	2, 0x0000
    1082:	8716                	.insn	2, 0x8716
    1084:	0010                	.insn	2, 0x0010
    1086:	0800                	.insn	2, 0x0800
    1088:	000004b3          	add	s1,zero,zero
    108c:	000005b7          	lui	a1,0x0
    1090:	1206                	.insn	2, 0x1206
    1092:	9712                	.insn	2, 0x9712
    1094:	0010                	.insn	2, 0x0010
    1096:	0800                	.insn	2, 0x0800
    1098:	00a0                	.insn	2, 0x00a0
    109a:	0000                	.insn	2, 0x0000
    109c:	02f9                	.insn	2, 0x02f9
    109e:	0000                	.insn	2, 0x0000
    10a0:	1406                	.insn	2, 0x1406
    10a2:	3222                	.insn	2, 0x3222
    10a4:	0006                	.insn	2, 0x0006
    10a6:	0200                	.insn	2, 0x0200
    10a8:	0095231b          	.insn	4, 0x0095231b
    10ac:	0000                	.insn	2, 0x0000
    10ae:	2200                	.insn	2, 0x2200
    10b0:	0615                	.insn	2, 0x0615
    10b2:	0000                	.insn	2, 0x0000
    10b4:	2805                	.insn	2, 0x2805
    10b6:	00059623          	sh	zero,12(a1) # c <$d.8+0xc>
    10ba:	2300                	.insn	2, 0x2300
    10bc:	0000071b          	.insn	4, 0x071b
    10c0:	0010c623          	.insn	4, 0x0010c623
    10c4:	0000                	.insn	2, 0x0000
    10c6:	b008                	.insn	2, 0xb008
    10c8:	0005                	.insn	2, 0x0005
    10ca:	4a00                	.insn	2, 0x4a00
    10cc:	0001                	.insn	2, 0x0001
    10ce:	0500                	.insn	2, 0x0500
    10d0:	380c                	.insn	2, 0x380c
    10d2:	1160                	.insn	2, 0x1160
    10d4:	0020                	.insn	2, 0x0020
    10d6:	0090                	.insn	2, 0x0090
    10d8:	0000                	.insn	2, 0x0000
    10da:	5201                	.insn	2, 0x5201
    10dc:	0432                	.insn	2, 0x0432
    10de:	0000                	.insn	2, 0x0000
    10e0:	a601                	.insn	2, 0xa601
    10e2:	3202                	.insn	2, 0x3202
    10e4:	0ad6                	.insn	2, 0x0ad6
    10e6:	0000                	.insn	2, 0x0000
    10e8:	0456                	.insn	2, 0x0456
    10ea:	0000                	.insn	2, 0x0000
    10ec:	a601                	.insn	2, 0xa601
    10ee:	0102                	.insn	2, 0x0102
    10f0:	0016                	.insn	2, 0x0016
    10f2:	3300                	.insn	2, 0x3300
    10f4:	00000b07          	.insn	4, 0x0b07
    10f8:	05e1                	.insn	2, 0x05e1
    10fa:	0000                	.insn	2, 0x0000
    10fc:	a801                	.insn	2, 0xa801
    10fe:	4b02                	.insn	2, 0x4b02
    1100:	0005                	.insn	2, 0x0005
    1102:	3300                	.insn	2, 0x3300
    1104:	0b38                	.insn	2, 0x0b38
    1106:	0000                	.insn	2, 0x0000
    1108:	03e4                	.insn	2, 0x03e4
    110a:	0000                	.insn	2, 0x0000
    110c:	a901                	.insn	2, 0xa901
    110e:	4b02                	.insn	2, 0x4b02
    1110:	0005                	.insn	2, 0x0005
    1112:	3300                	.insn	2, 0x3300
    1114:	0b69                	.insn	2, 0x0b69
    1116:	0000                	.insn	2, 0x0000
    1118:	06fc                	.insn	2, 0x06fc
    111a:	0000                	.insn	2, 0x0000
    111c:	aa01                	.insn	2, 0xaa01
    111e:	4b02                	.insn	2, 0x4b02
    1120:	0005                	.insn	2, 0x0005
    1122:	3300                	.insn	2, 0x3300
    1124:	00000b8f          	.insn	4, 0x0b8f
    1128:	001f 0000 ab01      	.insn	6, 0xab010000001f
    112e:	4b02                	.insn	2, 0x4b02
    1130:	0005                	.insn	2, 0x0005
    1132:	2b00                	.insn	2, 0x2b00
    1134:	116c                	.insn	2, 0x116c
    1136:	0020                	.insn	2, 0x0020
    1138:	0004                	.insn	2, 0x0004
    113a:	0000                	.insn	2, 0x0000
    113c:	0007012f          	.insn	4, 0x0007012f
    1140:	0100                	.insn	2, 0x0100
    1142:	02a8                	.insn	2, 0x02a8
    1144:	00001783          	lh	a5,0(zero) # 0 <$d.8>
    1148:	2b00                	.insn	2, 0x2b00
    114a:	1170                	.insn	2, 0x1170
    114c:	0020                	.insn	2, 0x0020
    114e:	0004                	.insn	2, 0x0004
    1150:	0000                	.insn	2, 0x0000
    1152:	0007012f          	.insn	4, 0x0007012f
    1156:	0100                	.insn	2, 0x0100
    1158:	02a9                	.insn	2, 0x02a9
    115a:	00001783          	lh	a5,0(zero) # 0 <$d.8>
    115e:	2b00                	.insn	2, 0x2b00
    1160:	1174                	.insn	2, 0x1174
    1162:	0020                	.insn	2, 0x0020
    1164:	0004                	.insn	2, 0x0004
    1166:	0000                	.insn	2, 0x0000
    1168:	0007012f          	.insn	4, 0x0007012f
    116c:	0100                	.insn	2, 0x0100
    116e:	02aa                	.insn	2, 0x02aa
    1170:	00001783          	lh	a5,0(zero) # 0 <$d.8>
    1174:	2b00                	.insn	2, 0x2b00
    1176:	1178                	.insn	2, 0x1178
    1178:	0020                	.insn	2, 0x0020
    117a:	0004                	.insn	2, 0x0004
    117c:	0000                	.insn	2, 0x0000
    117e:	0007012f          	.insn	4, 0x0007012f
    1182:	0100                	.insn	2, 0x0100
    1184:	178302ab          	.insn	4, 0x178302ab
    1188:	0000                	.insn	2, 0x0000
    118a:	2b00                	.insn	2, 0x2b00
    118c:	1194                	.insn	2, 0x1194
    118e:	0020                	.insn	2, 0x0020
    1190:	000c                	.insn	2, 0x000c
    1192:	0000                	.insn	2, 0x0000
    1194:	01580137          	lui	sp,0x1580
    1198:	01000007          	.insn	4, 0x01000007
    119c:	02b0                	.insn	2, 0x02b0
    119e:	0000054b          	.insn	4, 0x054b
    11a2:	0600                	.insn	2, 0x0600
    11a4:	0ec4                	.insn	2, 0x0ec4
    11a6:	0000                	.insn	2, 0x0000
    11a8:	1190                	.insn	2, 0x1190
    11aa:	0020                	.insn	2, 0x0020
    11ac:	e806                	.insn	2, 0xe806
    11ae:	0006                	.insn	2, 0x0006
    11b0:	c800                	.insn	2, 0xc800
    11b2:	2011                	.insn	2, 0x2011
    11b4:	0600                	.insn	2, 0x0600
    11b6:	06e8                	.insn	2, 0x06e8
    11b8:	0000                	.insn	2, 0x0000
    11ba:	11ec                	.insn	2, 0x11ec
    11bc:	0020                	.insn	2, 0x0020
    11be:	2700                	.insn	2, 0x2700
    11c0:	0000                	.insn	2, 0x0000
    11c2:	0020                	.insn	2, 0x0020
    11c4:	0010                	.insn	2, 0x0010
    11c6:	0000                	.insn	2, 0x0000
    11c8:	5201                	.insn	2, 0x5201
    11ca:	020c                	.insn	2, 0x020c
    11cc:	0000                	.insn	2, 0x0000
    11ce:	c301                	.insn	2, 0xc301
    11d0:	3e02                	.insn	2, 0x3e02
    11d2:	00f8                	.insn	2, 0x00f8
    11d4:	0000                	.insn	2, 0x0000
    11d6:	d801                	.insn	2, 0xd801
    11d8:	4b02                	.insn	2, 0x4b02
    11da:	0005                	.insn	2, 0x0005
    11dc:	0100                	.insn	2, 0x0100
    11de:	ca2e                	.insn	2, 0xca2e
    11e0:	0000                	.insn	2, 0x0000
    11e2:	0100                	.insn	2, 0x0100
    11e4:	02d8                	.insn	2, 0x02d8
    11e6:	0000054b          	.insn	4, 0x054b
    11ea:	3e00                	.insn	2, 0x3e00
    11ec:	0649                	.insn	2, 0x0649
    11ee:	0000                	.insn	2, 0x0000
    11f0:	cf01                	.insn	2, 0xcf01
    11f2:	4b02                	.insn	2, 0x4b02
    11f4:	0005                	.insn	2, 0x0005
    11f6:	0100                	.insn	2, 0x0100
    11f8:	d02e                	.insn	2, 0xd02e
    11fa:	01000003          	lb	zero,16(zero) # 10 <$d.8+0x10>
    11fe:	054b02cf          	.insn	4, 0x054b02cf
    1202:	0000                	.insn	2, 0x0000
    1204:	0002112f          	.insn	4, 0x0002112f
    1208:	0100                	.insn	2, 0x0100
    120a:	02d0                	.insn	2, 0x02d0
    120c:	0000054b          	.insn	4, 0x054b
    1210:	3800                	.insn	2, 0x3800
    1212:	11f0                	.insn	2, 0x11f0
    1214:	0020                	.insn	2, 0x0020
    1216:	019c                	.insn	2, 0x019c
    1218:	0000                	.insn	2, 0x0000
    121a:	5201                	.insn	2, 0x5201
    121c:	0162                	.insn	2, 0x0162
    121e:	0000                	.insn	2, 0x0000
    1220:	dc01                	.insn	2, 0xdc01
    1222:	3202                	.insn	2, 0x3202
    1224:	0bc0                	.insn	2, 0x0bc0
    1226:	0000                	.insn	2, 0x0000
    1228:	04d4                	.insn	2, 0x04d4
    122a:	0000                	.insn	2, 0x0000
    122c:	dc01                	.insn	2, 0xdc01
    122e:	4b02                	.insn	2, 0x4b02
    1230:	0005                	.insn	2, 0x0005
    1232:	3200                	.insn	2, 0x3200
    1234:	0bf1                	.insn	2, 0x0bf1
    1236:	0000                	.insn	2, 0x0000
    1238:	000002af          	.insn	4, 0x02af
    123c:	dc01                	.insn	2, 0xdc01
    123e:	4b02                	.insn	2, 0x4b02
    1240:	0005                	.insn	2, 0x0005
    1242:	3300                	.insn	2, 0x3300
    1244:	00000c17          	auipc	s8,0x0
    1248:	0076                	.insn	2, 0x0076
    124a:	0000                	.insn	2, 0x0000
    124c:	de01                	.insn	2, 0xde01
    124e:	8a02                	.insn	2, 0x8a02
    1250:	33000017          	auipc	zero,0x33000
    1254:	0c6c                	.insn	2, 0x0c6c
    1256:	0000                	.insn	2, 0x0000
    1258:	02b8                	.insn	2, 0x02b8
    125a:	0000                	.insn	2, 0x0000
    125c:	e201                	.insn	2, 0xe201
    125e:	4b02                	.insn	2, 0x4b02
    1260:	0005                	.insn	2, 0x0005
    1262:	3300                	.insn	2, 0x3300
    1264:	0c92                	.insn	2, 0x0c92
    1266:	0000                	.insn	2, 0x0000
    1268:	04df 0000 e601      	.insn	6, 0xe601000004df
    126e:	4b02                	.insn	2, 0x4b02
    1270:	0005                	.insn	2, 0x0005
    1272:	3300                	.insn	2, 0x3300
    1274:	00000cc3          	.insn	4, 0x0cc3
    1278:	000001a7          	.insn	4, 0x01a7
    127c:	e301                	.insn	2, 0xe301
    127e:	4b02                	.insn	2, 0x4b02
    1280:	0005                	.insn	2, 0x0005
    1282:	3300                	.insn	2, 0x3300
    1284:	0d05                	.insn	2, 0x0d05
    1286:	0000                	.insn	2, 0x0000
    1288:	0119                	.insn	2, 0x0119
    128a:	0000                	.insn	2, 0x0000
    128c:	df01                	.insn	2, 0xdf01
    128e:	4b02                	.insn	2, 0x4b02
    1290:	0005                	.insn	2, 0x0005
    1292:	3300                	.insn	2, 0x3300
    1294:	0d7f 0000 00ca 0000 	.insn	10, 0xe001000000ca00000d7f
    129c:	e001 
    129e:	4b02                	.insn	2, 0x4b02
    12a0:	0005                	.insn	2, 0x0005
    12a2:	2b00                	.insn	2, 0x2b00
    12a4:	1250                	.insn	2, 0x1250
    12a6:	0020                	.insn	2, 0x0020
    12a8:	0050                	.insn	2, 0x0050
    12aa:	0000                	.insn	2, 0x0000
    12ac:	000ce933          	or	s2,s9,zero
    12b0:	6100                	.insn	2, 0x6100
    12b2:	0000                	.insn	2, 0x0000
    12b4:	0100                	.insn	2, 0x0100
    12b6:	054b02ef          	jal	t0,b130a <_binary_shell_bin_size+0x8ef7a>
    12ba:	0000                	.insn	2, 0x0000
    12bc:	d12c                	.insn	2, 0xd12c
    12be:	0011                	.insn	2, 0x0011
    12c0:	7c00                	.insn	2, 0x7c00
    12c2:	2012                	.insn	2, 0x2012
    12c4:	0400                	.insn	2, 0x0400
    12c6:	0000                	.insn	2, 0x0000
    12c8:	0100                	.insn	2, 0x0100
    12ca:	212602f3          	.insn	4, 0x212602f3
    12ce:	5d01                	.insn	2, 0x5d01
    12d0:	11de                	.insn	2, 0x11de
    12d2:	0000                	.insn	2, 0x0000
    12d4:	3400                	.insn	2, 0x3400
    12d6:	000011eb          	.insn	4, 0x11eb
    12da:	00f0                	.insn	2, 0x00f0
    12dc:	0000                	.insn	2, 0x0000
    12de:	f501                	.insn	2, 0xf501
    12e0:	1002                	.insn	2, 0x1002
    12e2:	0121                	.insn	2, 0x0121
    12e4:	f85c                	.insn	2, 0xf85c
    12e6:	0011                	.insn	2, 0x0011
    12e8:	0000                	.insn	2, 0x0000
    12ea:	2b00                	.insn	2, 0x2b00
    12ec:	12b4                	.insn	2, 0x12b4
    12ee:	0020                	.insn	2, 0x0020
    12f0:	0078                	.insn	2, 0x0078
    12f2:	0000                	.insn	2, 0x0000
    12f4:	000da533          	sltz	a0,s11
    12f8:	6100                	.insn	2, 0x6100
    12fa:	0000                	.insn	2, 0x0000
    12fc:	0100                	.insn	2, 0x0100
    12fe:	02fd                	.insn	2, 0x02fd
    1300:	0000054b          	.insn	4, 0x054b
    1304:	0836                	.insn	2, 0x0836
    1306:	0001                	.insn	2, 0x0001
    1308:	3300                	.insn	2, 0x3300
    130a:	00000de7          	jalr	s11,zero # 0 <$d.8>
    130e:	01c1                	.insn	2, 0x01c1
    1310:	0000                	.insn	2, 0x0000
    1312:	0101                	.insn	2, 0x0101
    1314:	00054b03          	lbu	s6,0(a0) # 0 <$d.8>
    1318:	3300                	.insn	2, 0x3300
    131a:	0e02                	.insn	2, 0x0e02
    131c:	0000                	.insn	2, 0x0000
    131e:	007f 0000 0201 4b03 	.insn	10, 0x00054b0302010000007f
    1326:	0005 
    1328:	3400                	.insn	2, 0x3400
    132a:	000011eb          	.insn	4, 0x11eb
    132e:	0128                	.insn	2, 0x0128
    1330:	0000                	.insn	2, 0x0000
    1332:	0e01                	.insn	2, 0x0e01
    1334:	c1041003          	lh	zero,-1008(s0) # a0118e <__free_ram_end+0x6ab18e>
    1338:	000d                	.insn	2, 0x000d
    133a:	f800                	.insn	2, 0xf800
    133c:	0011                	.insn	2, 0x0011
    133e:	0000                	.insn	2, 0x0000
    1340:	d12c                	.insn	2, 0xd12c
    1342:	0011                	.insn	2, 0x0011
    1344:	0c00                	.insn	2, 0x0c00
    1346:	04002013          	slti	zero,zero,64
    134a:	0000                	.insn	2, 0x0000
    134c:	0100                	.insn	2, 0x0100
    134e:	0302                	.insn	2, 0x0302
    1350:	2118                	.insn	2, 0x2118
    1352:	5b01                	.insn	2, 0x5b01
    1354:	11de                	.insn	2, 0x11de
    1356:	0000                	.insn	2, 0x0000
    1358:	2c00                	.insn	2, 0x2c00
    135a:	000005d3          	.insn	4, 0x05d3
    135e:	1324                	.insn	2, 0x1324
    1360:	0020                	.insn	2, 0x0020
    1362:	0008                	.insn	2, 0x0008
    1364:	0000                	.insn	2, 0x0000
    1366:	0b01                	.insn	2, 0x0b01
    1368:	80200d03          	lb	s10,-2046(zero) # fffff802 <__free_ram_end+0xffca9802>
    136c:	8080                	.insn	2, 0x8080
    136e:	0180                	.insn	2, 0x0180
    1370:	000005db          	.insn	4, 0x05db
    1374:	8120                	.insn	2, 0x8120
    1376:	03dc                	.insn	2, 0x03dc
    1378:	05e6                	.insn	2, 0x05e6
    137a:	0000                	.insn	2, 0x0000
    137c:	0000                	.insn	2, 0x0000
    137e:	0600                	.insn	2, 0x0600
    1380:	06e8                	.insn	2, 0x06e8
    1382:	0000                	.insn	2, 0x0000
    1384:	1240                	.insn	2, 0x1240
    1386:	0020                	.insn	2, 0x0020
    1388:	e806                	.insn	2, 0xe806
    138a:	0006                	.insn	2, 0x0006
    138c:	5000                	.insn	2, 0x5000
    138e:	2012                	.insn	2, 0x2012
    1390:	0600                	.insn	2, 0x0600
    1392:	06e8                	.insn	2, 0x06e8
    1394:	0000                	.insn	2, 0x0000
    1396:	12b0                	.insn	2, 0x12b0
    1398:	0020                	.insn	2, 0x0020
    139a:	e806                	.insn	2, 0xe806
    139c:	0006                	.insn	2, 0x0006
    139e:	2000                	.insn	2, 0x2000
    13a0:	06002013          	slti	zero,zero,96
    13a4:	06e8                	.insn	2, 0x06e8
    13a6:	0000                	.insn	2, 0x0000
    13a8:	133c                	.insn	2, 0x133c
    13aa:	0020                	.insn	2, 0x0020
    13ac:	e83d                	.insn	2, 0xe83d
    13ae:	0006                	.insn	2, 0x0006
    13b0:	8000                	.insn	2, 0x8000
    13b2:	00002013          	slti	zero,zero,0
    13b6:	8c38                	.insn	2, 0x8c38
    13b8:	80002013          	slti	zero,zero,-2048
    13bc:	0001                	.insn	2, 0x0001
    13be:	0100                	.insn	2, 0x0100
    13c0:	5e52                	.insn	2, 0x5e52
    13c2:	0006                	.insn	2, 0x0006
    13c4:	0100                	.insn	2, 0x0100
    13c6:	0319                	.insn	2, 0x0319
    13c8:	1d32                	.insn	2, 0x1d32
    13ca:	000e                	.insn	2, 0x000e
    13cc:	d400                	.insn	2, 0xd400
    13ce:	0004                	.insn	2, 0x0004
    13d0:	0100                	.insn	2, 0x0100
    13d2:	0319                	.insn	2, 0x0319
    13d4:	0000054b          	.insn	4, 0x054b
    13d8:	4e32                	.insn	2, 0x4e32
    13da:	000e                	.insn	2, 0x000e
    13dc:	af00                	.insn	2, 0xaf00
    13de:	0002                	.insn	2, 0x0002
    13e0:	0100                	.insn	2, 0x0100
    13e2:	0319                	.insn	2, 0x0319
    13e4:	0000054b          	.insn	4, 0x054b
    13e8:	000e7433          	and	s0,t3,zero
    13ec:	7600                	.insn	2, 0x7600
    13ee:	0000                	.insn	2, 0x0000
    13f0:	0100                	.insn	2, 0x0100
    13f2:	031a                	.insn	2, 0x031a
    13f4:	178a                	.insn	2, 0x178a
    13f6:	0000                	.insn	2, 0x0000
    13f8:	000ea833          	sltz	a6,t4
    13fc:	b800                	.insn	2, 0xb800
    13fe:	0002                	.insn	2, 0x0002
    1400:	0100                	.insn	2, 0x0100
    1402:	0320                	.insn	2, 0x0320
    1404:	0000054b          	.insn	4, 0x054b
    1408:	000f1333          	sll	t1,t5,zero
    140c:	1900                	.insn	2, 0x1900
    140e:	0001                	.insn	2, 0x0001
    1410:	0100                	.insn	2, 0x0100
    1412:	031c                	.insn	2, 0x031c
    1414:	0000054b          	.insn	4, 0x054b
    1418:	000f5633          	srl	a2,t5,zero
    141c:	ca00                	.insn	2, 0xca00
    141e:	0000                	.insn	2, 0x0000
    1420:	0100                	.insn	2, 0x0100
    1422:	031d                	.insn	2, 0x031d
    1424:	0000054b          	.insn	4, 0x054b
    1428:	000f7133          	and	sp,t5,zero
    142c:	e200                	.insn	2, 0xe200
    142e:	0000                	.insn	2, 0x0000
    1430:	0100                	.insn	2, 0x0100
    1432:	059c031b          	.insn	4, 0x059c031b
    1436:	0000                	.insn	2, 0x0000
    1438:	2013e82b          	.insn	4, 0x2013e82b
    143c:	3000                	.insn	2, 0x3000
    143e:	0000                	.insn	2, 0x0000
    1440:	3300                	.insn	2, 0x3300
    1442:	0ece                	.insn	2, 0x0ece
    1444:	0000                	.insn	2, 0x0000
    1446:	0061                	.insn	2, 0x0061
    1448:	0000                	.insn	2, 0x0000
    144a:	2801                	.insn	2, 0x2801
    144c:	00054b03          	lbu	s6,0(a0)
    1450:	2c00                	.insn	2, 0x2c00
    1452:	11d1                	.insn	2, 0x11d1
    1454:	0000                	.insn	2, 0x0000
    1456:	1408                	.insn	2, 0x1408
    1458:	0020                	.insn	2, 0x0020
    145a:	0004                	.insn	2, 0x0004
    145c:	0000                	.insn	2, 0x0000
    145e:	2c01                	.insn	2, 0x2c01
    1460:	01210e03          	lb	t3,18(sp) # 1580012 <__free_ram_end+0x122a012>
    1464:	0011de5b          	.insn	4, 0x0011de5b
    1468:	0000                	.insn	2, 0x0000
    146a:	2b00                	.insn	2, 0x2b00
    146c:	142c                	.insn	2, 0x142c
    146e:	0020                	.insn	2, 0x0020
    1470:	0080                	.insn	2, 0x0080
    1472:	0000                	.insn	2, 0x0000
    1474:	000fa233          	sltz	tp,t6
    1478:	6100                	.insn	2, 0x6100
    147a:	0000                	.insn	2, 0x0000
    147c:	0100                	.insn	2, 0x0100
    147e:	0335                	.insn	2, 0x0335
    1480:	0000054b          	.insn	4, 0x054b
    1484:	4036                	.insn	2, 0x4036
    1486:	0001                	.insn	2, 0x0001
    1488:	3300                	.insn	2, 0x3300
    148a:	00000fe3          	beqz	zero,1ca8 <$d.12+0x19b>
    148e:	01c1                	.insn	2, 0x01c1
    1490:	0000                	.insn	2, 0x0000
    1492:	3901                	.insn	2, 0x3901
    1494:	00054b03          	lbu	s6,0(a0)
    1498:	3300                	.insn	2, 0x3300
    149a:	1009                	.insn	2, 0x1009
    149c:	0000                	.insn	2, 0x0000
    149e:	007f 0000 3a01 4b03 	.insn	10, 0x00054b033a010000007f
    14a6:	0005 
    14a8:	3c00                	.insn	2, 0x3c00
    14aa:	11d1                	.insn	2, 0x11d1
    14ac:	0000                	.insn	2, 0x0000
    14ae:	1470                	.insn	2, 0x1470
    14b0:	0020                	.insn	2, 0x0020
    14b2:	0008                	.insn	2, 0x0008
    14b4:	0000                	.insn	2, 0x0000
    14b6:	3a01                	.insn	2, 0x3a01
    14b8:	d32c1803          	lh	a6,-718(s8) # f76 <$d.3+0x7f0>
    14bc:	0005                	.insn	2, 0x0005
    14be:	a000                	.insn	2, 0xa000
    14c0:	2014                	.insn	2, 0x2014
    14c2:	0400                	.insn	2, 0x0400
    14c4:	0000                	.insn	2, 0x0000
    14c6:	0100                	.insn	2, 0x0100
    14c8:	0341                	.insn	2, 0x0341
    14ca:	200d                	.insn	2, 0x200d
    14cc:	8080                	.insn	2, 0x8080
    14ce:	8080                	.insn	2, 0x8080
    14d0:	db01                	.insn	2, 0xdb01
    14d2:	0005                	.insn	2, 0x0005
    14d4:	2000                	.insn	2, 0x2000
    14d6:	dc81                	.insn	2, 0xdc81
    14d8:	0005e603          	.insn	4, 0x0005e603
    14dc:	0000                	.insn	2, 0x0000
    14de:	0000                	.insn	2, 0x0000
    14e0:	e806                	.insn	2, 0xe806
    14e2:	0006                	.insn	2, 0x0006
    14e4:	d400                	.insn	2, 0xd400
    14e6:	06002013          	slti	zero,zero,96
    14ea:	06e8                	.insn	2, 0x06e8
    14ec:	0000                	.insn	2, 0x0000
    14ee:	13e4                	.insn	2, 0x13e4
    14f0:	0020                	.insn	2, 0x0020
    14f2:	e806                	.insn	2, 0xe806
    14f4:	0006                	.insn	2, 0x0006
    14f6:	2800                	.insn	2, 0x2800
    14f8:	2014                	.insn	2, 0x2014
    14fa:	0600                	.insn	2, 0x0600
    14fc:	06e8                	.insn	2, 0x06e8
    14fe:	0000                	.insn	2, 0x0000
    1500:	1498                	.insn	2, 0x1498
    1502:	0020                	.insn	2, 0x0020
    1504:	e806                	.insn	2, 0xe806
    1506:	0006                	.insn	2, 0x0006
    1508:	bc00                	.insn	2, 0xbc00
    150a:	2014                	.insn	2, 0x2014
    150c:	3d00                	.insn	2, 0x3d00
    150e:	06e8                	.insn	2, 0x06e8
    1510:	0000                	.insn	2, 0x0000
    1512:	1500                	.insn	2, 0x1500
    1514:	0020                	.insn	2, 0x0020
    1516:	3800                	.insn	2, 0x3800
    1518:	150c                	.insn	2, 0x150c
    151a:	0020                	.insn	2, 0x0020
    151c:	0160                	.insn	2, 0x0160
    151e:	0000                	.insn	2, 0x0000
    1520:	5201                	.insn	2, 0x5201
    1522:	0055                	.insn	2, 0x0055
    1524:	0000                	.insn	2, 0x0000
    1526:	5201                	.insn	2, 0x5201
    1528:	91023703          	.insn	4, 0x91023703
    152c:	d200                	.insn	2, 0xd200
    152e:	01000003          	lb	zero,16(zero) # 10 <$d.8+0x10>
    1532:	0366                	.insn	2, 0x0366
    1534:	1795                	.insn	2, 0x1795
    1536:	0000                	.insn	2, 0x0000
    1538:	00104a33          	xor	s4,zero,ra
    153c:	7a00                	.insn	2, 0x7a00
    153e:	0001                	.insn	2, 0x0001
    1540:	0100                	.insn	2, 0x0100
    1542:	058b039b          	.insn	4, 0x058b039b
    1546:	0000                	.insn	2, 0x0000
    1548:	2015b82b          	.insn	4, 0x2015b82b
    154c:	0c00                	.insn	2, 0x0c00
    154e:	0000                	.insn	2, 0x0000
    1550:	3300                	.insn	2, 0x3300
    1552:	0000102f          	.insn	4, 0x102f
    1556:	0701                	.insn	2, 0x0701
    1558:	0000                	.insn	2, 0x0000
    155a:	8f01                	.insn	2, 0x8f01
    155c:	00054b03          	lbu	s6,0(a0)
    1560:	0000                	.insn	2, 0x0000
    1562:	e806                	.insn	2, 0xe806
    1564:	0006                	.insn	2, 0x0006
    1566:	2400                	.insn	2, 0x2400
    1568:	2015                	.insn	2, 0x2015
    156a:	0600                	.insn	2, 0x0600
    156c:	06e8                	.insn	2, 0x06e8
    156e:	0000                	.insn	2, 0x0000
    1570:	1534                	.insn	2, 0x1534
    1572:	0020                	.insn	2, 0x0020
    1574:	ea06                	.insn	2, 0xea06
    1576:	0015                	.insn	2, 0x0015
    1578:	5800                	.insn	2, 0x5800
    157a:	2015                	.insn	2, 0x2015
    157c:	0600                	.insn	2, 0x0600
    157e:	06e8                	.insn	2, 0x06e8
    1580:	0000                	.insn	2, 0x0000
    1582:	1568                	.insn	2, 0x1568
    1584:	0020                	.insn	2, 0x0020
    1586:	e806                	.insn	2, 0xe806
    1588:	0006                	.insn	2, 0x0006
    158a:	7800                	.insn	2, 0x7800
    158c:	2015                	.insn	2, 0x2015
    158e:	0600                	.insn	2, 0x0600
    1590:	0700                	.insn	2, 0x0700
    1592:	0000                	.insn	2, 0x0000
    1594:	1598                	.insn	2, 0x1598
    1596:	0020                	.insn	2, 0x0020
    1598:	e806                	.insn	2, 0xe806
    159a:	0006                	.insn	2, 0x0006
    159c:	b800                	.insn	2, 0xb800
    159e:	2015                	.insn	2, 0x2015
    15a0:	0600                	.insn	2, 0x0600
    15a2:	06e8                	.insn	2, 0x06e8
    15a4:	0000                	.insn	2, 0x0000
    15a6:	15d4                	.insn	2, 0x15d4
    15a8:	0020                	.insn	2, 0x0020
    15aa:	9a06                	.insn	2, 0x9a06
    15ac:	0008                	.insn	2, 0x0008
    15ae:	e400                	.insn	2, 0xe400
    15b0:	2015                	.insn	2, 0x2015
    15b2:	0600                	.insn	2, 0x0600
    15b4:	06e8                	.insn	2, 0x06e8
    15b6:	0000                	.insn	2, 0x0000
    15b8:	1608                	.insn	2, 0x1608
    15ba:	0020                	.insn	2, 0x0020
    15bc:	9a06                	.insn	2, 0x9a06
    15be:	0008                	.insn	2, 0x0008
    15c0:	2400                	.insn	2, 0x2400
    15c2:	2016                	.insn	2, 0x2016
    15c4:	0600                	.insn	2, 0x0600
    15c6:	06e8                	.insn	2, 0x06e8
    15c8:	0000                	.insn	2, 0x0000
    15ca:	1634                	.insn	2, 0x1634
    15cc:	0020                	.insn	2, 0x0020
    15ce:	1106                	.insn	2, 0x1106
    15d0:	000e                	.insn	2, 0x000e
    15d2:	3c00                	.insn	2, 0x3c00
    15d4:	2016                	.insn	2, 0x2016
    15d6:	0600                	.insn	2, 0x0600
    15d8:	06e8                	.insn	2, 0x06e8
    15da:	0000                	.insn	2, 0x0000
    15dc:	164c                	.insn	2, 0x164c
    15de:	0020                	.insn	2, 0x0020
    15e0:	e806                	.insn	2, 0xe806
    15e2:	0006                	.insn	2, 0x0006
    15e4:	6800                	.insn	2, 0x6800
    15e6:	2016                	.insn	2, 0x2016
    15e8:	0000                	.insn	2, 0x0000
    15ea:	2722                	.insn	2, 0x2722
    15ec:	05000003          	lb	zero,80(zero) # 50 <$d.8+0x50>
    15f0:	2329                	.insn	2, 0x2329
    15f2:	00000083          	lb	ra,0(zero) # 0 <$d.8>
    15f6:	0015fc23          	.insn	4, 0x0015fc23
    15fa:	0000                	.insn	2, 0x0000
    15fc:	f612                	.insn	2, 0xf612
    15fe:	0006                	.insn	2, 0x0006
    1600:	1200                	.insn	2, 0x1200
    1602:	1606                	.insn	2, 0x1606
    1604:	0000                	.insn	2, 0x0000
    1606:	0000673f 39037c00 	.insn	8, 0x39037c000000673f
    160e:	d211                	.insn	2, 0xd211
    1610:	0006                	.insn	2, 0x0006
    1612:	9500                	.insn	2, 0x9500
    1614:	0000                	.insn	2, 0x0000
    1616:	0300                	.insn	2, 0x0300
    1618:	003a                	.insn	2, 0x003a
    161a:	d911                	.insn	2, 0xd911
    161c:	0000                	.insn	2, 0x0000
    161e:	9500                	.insn	2, 0x9500
    1620:	0000                	.insn	2, 0x0000
    1622:	0300                	.insn	2, 0x0300
    1624:	043a                	.insn	2, 0x043a
    1626:	f911                	.insn	2, 0xf911
    1628:	0006                	.insn	2, 0x0006
    162a:	9500                	.insn	2, 0x9500
    162c:	0000                	.insn	2, 0x0000
    162e:	0300                	.insn	2, 0x0300
    1630:	083a                	.insn	2, 0x083a
    1632:	5811                	.insn	2, 0x5811
    1634:	0004                	.insn	2, 0x0004
    1636:	9500                	.insn	2, 0x9500
    1638:	0000                	.insn	2, 0x0000
    163a:	0300                	.insn	2, 0x0300
    163c:	99110c3b          	.insn	4, 0x99110c3b
    1640:	0005                	.insn	2, 0x0005
    1642:	9500                	.insn	2, 0x9500
    1644:	0000                	.insn	2, 0x0000
    1646:	0300                	.insn	2, 0x0300
    1648:	1a11103b          	.insn	4, 0x1a11103b
    164c:	0002                	.insn	2, 0x0002
    164e:	9500                	.insn	2, 0x9500
    1650:	0000                	.insn	2, 0x0000
    1652:	0300                	.insn	2, 0x0300
    1654:	5b11143b          	.insn	4, 0x5b11143b
    1658:	0004                	.insn	2, 0x0004
    165a:	9500                	.insn	2, 0x9500
    165c:	0000                	.insn	2, 0x0000
    165e:	0300                	.insn	2, 0x0300
    1660:	de11183b          	.insn	4, 0xde11183b
    1664:	0005                	.insn	2, 0x0005
    1666:	9500                	.insn	2, 0x9500
    1668:	0000                	.insn	2, 0x0000
    166a:	0300                	.insn	2, 0x0300
    166c:	7e111c3b          	.insn	4, 0x7e111c3b
    1670:	95000003          	lb	zero,-1712(zero) # fffff950 <__free_ram_end+0xffca9950>
    1674:	0000                	.insn	2, 0x0000
    1676:	0300                	.insn	2, 0x0300
    1678:	4311203b          	.insn	4, 0x4311203b
    167c:	0004                	.insn	2, 0x0004
    167e:	9500                	.insn	2, 0x9500
    1680:	0000                	.insn	2, 0x0000
    1682:	0300                	.insn	2, 0x0300
    1684:	8c11243b          	.insn	4, 0x8c11243b
    1688:	0004                	.insn	2, 0x0004
    168a:	9500                	.insn	2, 0x9500
    168c:	0000                	.insn	2, 0x0000
    168e:	0300                	.insn	2, 0x0300
    1690:	283c                	.insn	2, 0x283c
    1692:	9c11                	.insn	2, 0x9c11
    1694:	0005                	.insn	2, 0x0005
    1696:	9500                	.insn	2, 0x9500
    1698:	0000                	.insn	2, 0x0000
    169a:	0300                	.insn	2, 0x0300
    169c:	2c3c                	.insn	2, 0x2c3c
    169e:	9f11                	.insn	2, 0x9f11
    16a0:	0001                	.insn	2, 0x0001
    16a2:	9500                	.insn	2, 0x9500
    16a4:	0000                	.insn	2, 0x0000
    16a6:	0300                	.insn	2, 0x0300
    16a8:	303c                	.insn	2, 0x303c
    16aa:	dc11                	.insn	2, 0xdc11
    16ac:	0000                	.insn	2, 0x0000
    16ae:	9500                	.insn	2, 0x9500
    16b0:	0000                	.insn	2, 0x0000
    16b2:	0300                	.insn	2, 0x0300
    16b4:	343c                	.insn	2, 0x343c
    16b6:	2411                	.insn	2, 0x2411
    16b8:	0005                	.insn	2, 0x0005
    16ba:	9500                	.insn	2, 0x9500
    16bc:	0000                	.insn	2, 0x0000
    16be:	0300                	.insn	2, 0x0300
    16c0:	383c                	.insn	2, 0x383c
    16c2:	ba11                	.insn	2, 0xba11
    16c4:	0000                	.insn	2, 0x0000
    16c6:	9500                	.insn	2, 0x9500
    16c8:	0000                	.insn	2, 0x0000
    16ca:	0300                	.insn	2, 0x0300
    16cc:	3c3c                	.insn	2, 0x3c3c
    16ce:	ad11                	.insn	2, 0xad11
    16d0:	95000003          	lb	zero,-1712(zero) # fffff950 <__free_ram_end+0xffca9950>
    16d4:	0000                	.insn	2, 0x0000
    16d6:	0300                	.insn	2, 0x0300
    16d8:	403c                	.insn	2, 0x403c
    16da:	7311                	.insn	2, 0x7311
    16dc:	0001                	.insn	2, 0x0001
    16de:	9500                	.insn	2, 0x9500
    16e0:	0000                	.insn	2, 0x0000
    16e2:	0300                	.insn	2, 0x0300
    16e4:	443c                	.insn	2, 0x443c
    16e6:	4b11                	.insn	2, 0x4b11
    16e8:	95000003          	lb	zero,-1712(zero) # fffff950 <__free_ram_end+0xffca9950>
    16ec:	0000                	.insn	2, 0x0000
    16ee:	0300                	.insn	2, 0x0300
    16f0:	483d                	.insn	2, 0x483d
    16f2:	fa11                	.insn	2, 0xfa11
    16f4:	0001                	.insn	2, 0x0001
    16f6:	9500                	.insn	2, 0x9500
    16f8:	0000                	.insn	2, 0x0000
    16fa:	0300                	.insn	2, 0x0300
    16fc:	4c3d                	.insn	2, 0x4c3d
    16fe:	2711                	.insn	2, 0x2711
    1700:	0005                	.insn	2, 0x0005
    1702:	9500                	.insn	2, 0x9500
    1704:	0000                	.insn	2, 0x0000
    1706:	0300                	.insn	2, 0x0300
    1708:	503d                	.insn	2, 0x503d
    170a:	df11                	.insn	2, 0xdf11
    170c:	0000                	.insn	2, 0x0000
    170e:	9500                	.insn	2, 0x9500
    1710:	0000                	.insn	2, 0x0000
    1712:	0300                	.insn	2, 0x0300
    1714:	543d                	.insn	2, 0x543d
    1716:	0811                	.insn	2, 0x0811
    1718:	0001                	.insn	2, 0x0001
    171a:	9500                	.insn	2, 0x9500
    171c:	0000                	.insn	2, 0x0000
    171e:	0300                	.insn	2, 0x0300
    1720:	583d                	.insn	2, 0x583d
    1722:	0b11                	.insn	2, 0x0b11
    1724:	0001                	.insn	2, 0x0001
    1726:	9500                	.insn	2, 0x9500
    1728:	0000                	.insn	2, 0x0000
    172a:	0300                	.insn	2, 0x0300
    172c:	5c3d                	.insn	2, 0x5c3d
    172e:	7211                	.insn	2, 0x7211
    1730:	0006                	.insn	2, 0x0006
    1732:	9500                	.insn	2, 0x9500
    1734:	0000                	.insn	2, 0x0000
    1736:	0300                	.insn	2, 0x0300
    1738:	603d                	.insn	2, 0x603d
    173a:	0311                	.insn	2, 0x0311
    173c:	0006                	.insn	2, 0x0006
    173e:	9500                	.insn	2, 0x9500
    1740:	0000                	.insn	2, 0x0000
    1742:	0300                	.insn	2, 0x0300
    1744:	643d                	.insn	2, 0x643d
    1746:	e111                	.insn	2, 0xe111
    1748:	95000003          	lb	zero,-1712(zero) # fffff950 <__free_ram_end+0xffca9950>
    174c:	0000                	.insn	2, 0x0000
    174e:	0300                	.insn	2, 0x0300
    1750:	683d                	.insn	2, 0x683d
    1752:	d511                	.insn	2, 0xd511
    1754:	0006                	.insn	2, 0x0006
    1756:	9500                	.insn	2, 0x9500
    1758:	0000                	.insn	2, 0x0000
    175a:	0300                	.insn	2, 0x0300
    175c:	6c3d                	.insn	2, 0x6c3d
    175e:	1d11                	.insn	2, 0x1d11
    1760:	0002                	.insn	2, 0x0002
    1762:	9500                	.insn	2, 0x9500
    1764:	0000                	.insn	2, 0x0000
    1766:	0300                	.insn	2, 0x0300
    1768:	703d                	.insn	2, 0x703d
    176a:	6311                	.insn	2, 0x6311
    176c:	0000                	.insn	2, 0x0000
    176e:	9500                	.insn	2, 0x9500
    1770:	0000                	.insn	2, 0x0000
    1772:	0300                	.insn	2, 0x0300
    1774:	743d                	.insn	2, 0x743d
    1776:	2611                	.insn	2, 0x2611
    1778:	0004                	.insn	2, 0x0004
    177a:	9500                	.insn	2, 0x9500
    177c:	0000                	.insn	2, 0x0000
    177e:	0300                	.insn	2, 0x0300
    1780:	783e                	.insn	2, 0x783e
    1782:	0700                	.insn	2, 0x0700
    1784:	0675                	.insn	2, 0x0675
    1786:	0000                	.insn	2, 0x0000
    1788:	83080407          	.insn	4, 0x83080407
    178c:	0000                	.insn	2, 0x0000
    178e:	a200                	.insn	2, 0xa200
    1790:	0001                	.insn	2, 0x0001
    1792:	0200                	.insn	2, 0x0200
    1794:	0a0e                	.insn	2, 0x0a0e
    1796:	06f6                	.insn	2, 0x06f6
    1798:	0000                	.insn	2, 0x0000
    179a:	0000c70b          	.insn	4, 0xc70b
    179e:	0200                	.insn	2, 0x0200
	...

000017a2 <$d.4>:
    17a2:	083e                	.insn	2, 0x083e
    17a4:	0000                	.insn	2, 0x0000
    17a6:	0004                	.insn	2, 0x0004
    17a8:	034a                	.insn	2, 0x034a
    17aa:	0000                	.insn	2, 0x0000
    17ac:	0104                	.insn	2, 0x0104
    17ae:	027e                	.insn	2, 0x027e
    17b0:	0000                	.insn	2, 0x0000
    17b2:	001d                	.insn	2, 0x001d
    17b4:	02c4                	.insn	2, 0x02c4
    17b6:	0000                	.insn	2, 0x0000
    17b8:	0000119b          	.insn	4, 0x119b
    17bc:	03f1                	.insn	2, 0x03f1
    17be:	0000                	.insn	2, 0x0000
    17c0:	166c                	.insn	2, 0x166c
    17c2:	0020                	.insn	2, 0x0020
    17c4:	09b8                	.insn	2, 0x09b8
    17c6:	0000                	.insn	2, 0x0000
    17c8:	3302                	.insn	2, 0x3302
    17ca:	0000                	.insn	2, 0x0000
    17cc:	0100                	.insn	2, 0x0100
    17ce:	1d0305a7          	.insn	4, 0x1d0305a7
    17d2:	03002033          	.insn	4, 0x03002033
    17d6:	0000003f 00004604 	.insn	8, 0x46040000003f
    17de:	1100                	.insn	2, 0x1100
    17e0:	0500                	.insn	2, 0x0500
    17e2:	03b9                	.insn	2, 0x03b9
    17e4:	0000                	.insn	2, 0x0000
    17e6:	0108                	.insn	2, 0x0108
    17e8:	7206                	.insn	2, 0x7206
    17ea:	0005                	.insn	2, 0x0005
    17ec:	0800                	.insn	2, 0x0800
    17ee:	005a0207          	.insn	4, 0x005a0207
    17f2:	0000                	.insn	2, 0x0000
    17f4:	f001                	.insn	2, 0xf001
    17f6:	0305                	.insn	2, 0x0305
    17f8:	00203353          	.insn	4, 0x00203353
    17fc:	00003f03          	.insn	4, 0x3f03
    1800:	0400                	.insn	2, 0x0400
    1802:	0046                	.insn	2, 0x0046
    1804:	0000                	.insn	2, 0x0000
    1806:	74070003          	lb	zero,1856(a4)
    180a:	0000                	.insn	2, 0x0000
    180c:	0100                	.insn	2, 0x0100
    180e:	0118                	.insn	2, 0x0118
    1810:	0305                	.insn	2, 0x0305
    1812:	0020327b          	.insn	4, 0x0020327b
    1816:	00003f03          	.insn	4, 0x3f03
    181a:	0400                	.insn	2, 0x0400
    181c:	0046                	.insn	2, 0x0046
    181e:	0000                	.insn	2, 0x0000
    1820:	8e070023          	sb	zero,-1824(a4)
    1824:	0000                	.insn	2, 0x0000
    1826:	0100                	.insn	2, 0x0100
    1828:	0120                	.insn	2, 0x0120
    182a:	0305                	.insn	2, 0x0305
    182c:	2cdd                	.insn	2, 0x2cdd
    182e:	0020                	.insn	2, 0x0020
    1830:	00003f03          	.insn	4, 0x3f03
    1834:	0400                	.insn	2, 0x0400
    1836:	0046                	.insn	2, 0x0046
    1838:	0000                	.insn	2, 0x0000
    183a:	0024                	.insn	2, 0x0024
    183c:	0000a807          	.insn	4, 0xa807
    1840:	0100                	.insn	2, 0x0100
    1842:	0129                	.insn	2, 0x0129
    1844:	0305                	.insn	2, 0x0305
    1846:	3162                	.insn	2, 0x3162
    1848:	0020                	.insn	2, 0x0020
    184a:	00003f03          	.insn	4, 0x3f03
    184e:	0400                	.insn	2, 0x0400
    1850:	0046                	.insn	2, 0x0046
    1852:	0000                	.insn	2, 0x0000
    1854:	0030                	.insn	2, 0x0030
    1856:	0908                	.insn	2, 0x0908
    1858:	03ea                	.insn	2, 0x03ea
    185a:	0000                	.insn	2, 0x0000
    185c:	000000c7          	.insn	4, 0x00c7
    1860:	c501                	.insn	2, 0xc501
    1862:	0305                	.insn	2, 0x0305
    1864:	331d                	.insn	2, 0x331d
    1866:	0020                	.insn	2, 0x0020
    1868:	0300                	.insn	2, 0x0300
    186a:	000000d3          	.insn	4, 0x00d3
    186e:	4604                	.insn	2, 0x4604
    1870:	0000                	.insn	2, 0x0000
    1872:	1100                	.insn	2, 0x1100
    1874:	0a00                	.insn	2, 0x0a00
    1876:	0000003f 03ea0908 	.insn	8, 0x03ea09080000003f
    187e:	0000                	.insn	2, 0x0000
    1880:	000000c7          	.insn	4, 0x00c7
    1884:	bc01                	.insn	2, 0xbc01
    1886:	0305                	.insn	2, 0x0305
    1888:	331d                	.insn	2, 0x331d
    188a:	0020                	.insn	2, 0x0020
    188c:	0b00                	.insn	2, 0x0b00
    188e:	00f0                	.insn	2, 0x00f0
    1890:	0000                	.insn	2, 0x0000
    1892:	fb0c                	.insn	2, 0xfb0c
    1894:	0000                	.insn	2, 0x0000
    1896:	b700                	.insn	2, 0xb700
    1898:	0005                	.insn	2, 0x0005
    189a:	0200                	.insn	2, 0x0200
    189c:	03980507          	.insn	4, 0x03980507
    18a0:	0000                	.insn	2, 0x0000
    18a2:	0108                	.insn	2, 0x0108
    18a4:	0001070b          	.insn	4, 0x0001070b
    18a8:	0a00                	.insn	2, 0x0a00
    18aa:	00f0                	.insn	2, 0x00f0
    18ac:	0000                	.insn	2, 0x0000
    18ae:	170c                	.insn	2, 0x170c
    18b0:	0001                	.insn	2, 0x0001
    18b2:	f900                	.insn	2, 0xf900
    18b4:	0002                	.insn	2, 0x0002
    18b6:	0200                	.insn	2, 0x0200
    18b8:	0509                	.insn	2, 0x0509
    18ba:	04f0                	.insn	2, 0x04f0
    18bc:	0000                	.insn	2, 0x0000
    18be:	0c0c0407          	.insn	4, 0x0c0c0407
    18c2:	0001                	.insn	2, 0x0001
    18c4:	ba00                	.insn	2, 0xba00
    18c6:	0001                	.insn	2, 0x0001
    18c8:	0200                	.insn	2, 0x0200
    18ca:	012e0b0b          	.insn	4, 0x012e0b0b
    18ce:	0000                	.insn	2, 0x0000
    18d0:	0e0d                	.insn	2, 0x0e0d
    18d2:	166c                	.insn	2, 0x166c
    18d4:	0020                	.insn	2, 0x0020
    18d6:	0028                	.insn	2, 0x0028
    18d8:	0000                	.insn	2, 0x0000
    18da:	5201                	.insn	2, 0x5201
    18dc:	01e6                	.insn	2, 0x01e6
    18de:	0000                	.insn	2, 0x0000
    18e0:	0301                	.insn	2, 0x0301
    18e2:	0810                	.insn	2, 0x0810
    18e4:	0000                	.insn	2, 0x0000
    18e6:	835a010f          	.insn	4, 0x835a010f
    18ea:	0000                	.insn	2, 0x0000
    18ec:	0100                	.insn	2, 0x0100
    18ee:	00081003          	lh	zero,0(a6) # 0 <$d.8>
    18f2:	1000                	.insn	2, 0x1000
    18f4:	1065                	.insn	2, 0x1065
    18f6:	0000                	.insn	2, 0x0000
    18f8:	0381                	.insn	2, 0x0381
    18fa:	0000                	.insn	2, 0x0000
    18fc:	0301                	.insn	2, 0x0301
    18fe:	0129                	.insn	2, 0x0129
    1900:	0000                	.insn	2, 0x0000
    1902:	ac10                	.insn	2, 0xac10
    1904:	0010                	.insn	2, 0x0010
    1906:	f600                	.insn	2, 0xf600
    1908:	0000                	.insn	2, 0x0000
    190a:	0100                	.insn	2, 0x0100
    190c:	00011e03          	lh	t3,0(sp)
    1910:	1100                	.insn	2, 0x1100
    1912:	1078                	.insn	2, 0x1078
    1914:	0000                	.insn	2, 0x0000
    1916:	05ea                	.insn	2, 0x05ea
    1918:	0000                	.insn	2, 0x0000
    191a:	0401                	.insn	2, 0x0401
    191c:	000000eb          	.insn	4, 0x00eb
    1920:	0112                	.insn	2, 0x0112
    1922:	00022c5b          	.insn	4, 0x00022c5b
    1926:	0100                	.insn	2, 0x0100
    1928:	0205                	.insn	2, 0x0205
    192a:	0001                	.insn	2, 0x0001
    192c:	0000                	.insn	2, 0x0000
    192e:	940e                	.insn	2, 0x940e
    1930:	2016                	.insn	2, 0x2016
    1932:	2000                	.insn	2, 0x2000
    1934:	0000                	.insn	2, 0x0000
    1936:	0100                	.insn	2, 0x0100
    1938:	c252                	.insn	2, 0xc252
    193a:	01000003          	lb	zero,16(zero) # 10 <$d.8+0x10>
    193e:	101f 0008 0f00      	.insn	6, 0x0f000008101f
    1944:	5a01                	.insn	2, 0x5a01
    1946:	000001b3          	add	gp,zero,zero
    194a:	1f01                	.insn	2, 0x1f01
    194c:	0810                	.insn	2, 0x0810
    194e:	0000                	.insn	2, 0x0000
    1950:	fd5b010f          	.insn	4, 0xfd5b010f
    1954:	0001                	.insn	2, 0x0001
    1956:	0100                	.insn	2, 0x0100
    1958:	3f1f 0000 1000      	.insn	6, 0x100000003f1f
    195e:	10f5                	.insn	2, 0x10f5
    1960:	0000                	.insn	2, 0x0000
    1962:	00f6                	.insn	2, 0x00f6
    1964:	0000                	.insn	2, 0x0000
    1966:	1f01                	.insn	2, 0x1f01
    1968:	011e                	.insn	2, 0x011e
    196a:	0000                	.insn	2, 0x0000
    196c:	c111                	.insn	2, 0xc111
    196e:	0010                	.insn	2, 0x0010
    1970:	e200                	.insn	2, 0xe200
    1972:	0000                	.insn	2, 0x0000
    1974:	0100                	.insn	2, 0x0100
    1976:	eb20                	.insn	2, 0xeb20
    1978:	0000                	.insn	2, 0x0000
    197a:	0000                	.insn	2, 0x0000
    197c:	00059f13          	slli	t5,a1,0x0
    1980:	0100                	.insn	2, 0x0100
    1982:	0c3e                	.insn	2, 0x0c3e
    1984:	0001                	.insn	2, 0x0001
    1986:	0100                	.insn	2, 0x0100
    1988:	d814                	.insn	2, 0xd814
    198a:	0006                	.insn	2, 0x0006
    198c:	0100                	.insn	2, 0x0100
    198e:	0c3e                	.insn	2, 0x0c3e
    1990:	0001                	.insn	2, 0x0001
    1992:	1400                	.insn	2, 0x1400
    1994:	052a                	.insn	2, 0x052a
    1996:	0000                	.insn	2, 0x0000
    1998:	3e01                	.insn	2, 0x3e01
    199a:	0220                	.insn	2, 0x0220
    199c:	0000                	.insn	2, 0x0000
    199e:	2e15                	.insn	2, 0x2e15
    19a0:	0005                	.insn	2, 0x0005
    19a2:	0100                	.insn	2, 0x0100
    19a4:	0c41                	.insn	2, 0x0c41
    19a6:	0001                	.insn	2, 0x0001
    19a8:	1500                	.insn	2, 0x1500
    19aa:	05e8                	.insn	2, 0x05e8
    19ac:	0000                	.insn	2, 0x0000
    19ae:	4001                	.insn	2, 0x4001
    19b0:	010c                	.insn	2, 0x010c
    19b2:	0000                	.insn	2, 0x0000
    19b4:	1516                	.insn	2, 0x1516
    19b6:	0061                	.insn	2, 0x0061
    19b8:	0000                	.insn	2, 0x0000
    19ba:	4301                	.insn	2, 0x4301
    19bc:	0225                	.insn	2, 0x0225
    19be:	0000                	.insn	2, 0x0000
    19c0:	0000                	.insn	2, 0x0000
    19c2:	00010c0b          	.insn	4, 0x00010c0b
    19c6:	0500                	.insn	2, 0x0500
    19c8:	03b5                	.insn	2, 0x03b5
    19ca:	0000                	.insn	2, 0x0000
    19cc:	0405                	.insn	2, 0x0405
    19ce:	2016b417          	auipc	s0,0x2016b
    19d2:	fc00                	.insn	2, 0xfc00
    19d4:	0000                	.insn	2, 0x0000
    19d6:	0100                	.insn	2, 0x0100
    19d8:	c652                	.insn	2, 0xc652
    19da:	0006                	.insn	2, 0x0006
    19dc:	0100                	.insn	2, 0x0100
    19de:	110a104f          	.insn	4, 0x110a104f
    19e2:	0000                	.insn	2, 0x0000
    19e4:	01c1                	.insn	2, 0x01c1
    19e6:	0000                	.insn	2, 0x0000
    19e8:	4f01                	.insn	2, 0x4f01
    19ea:	0225                	.insn	2, 0x0225
    19ec:	0000                	.insn	2, 0x0000
    19ee:	0212                	.insn	2, 0x0212
    19f0:	0691                	.insn	2, 0x0691
    19f2:	000001b3          	add	gp,zero,zero
    19f6:	5201                	.insn	2, 0x5201
    19f8:	0811                	.insn	2, 0x0811
    19fa:	0000                	.insn	2, 0x0000
    19fc:	3311                	.insn	2, 0x3311
    19fe:	0011                	.insn	2, 0x0011
    1a00:	bd00                	.insn	2, 0xbd00
    1a02:	0000                	.insn	2, 0x0000
    1a04:	0100                	.insn	2, 0x0100
    1a06:	00022553          	.insn	4, 0x00022553
    1a0a:	1100                	.insn	2, 0x1100
    1a0c:	115e                	.insn	2, 0x115e
    1a0e:	0000                	.insn	2, 0x0000
    1a10:	06d8                	.insn	2, 0x06d8
    1a12:	0000                	.insn	2, 0x0000
    1a14:	5101                	.insn	2, 0x5101
    1a16:	010c                	.insn	2, 0x010c
    1a18:	0000                	.insn	2, 0x0000
    1a1a:	2818                	.insn	2, 0x2818
    1a1c:	48002017          	auipc	zero,0x48002
    1a20:	0000                	.insn	2, 0x0000
    1a22:	1100                	.insn	2, 0x1100
    1a24:	11ce                	.insn	2, 0x11ce
    1a26:	0000                	.insn	2, 0x0000
    1a28:	052a                	.insn	2, 0x052a
    1a2a:	0000                	.insn	2, 0x0000
    1a2c:	6201                	.insn	2, 0x6201
    1a2e:	010c                	.insn	2, 0x010c
    1a30:	0000                	.insn	2, 0x0000
    1a32:	da19                	.insn	2, 0xda19
    1a34:	0001                	.insn	2, 0x0001
    1a36:	2800                	.insn	2, 0x2800
    1a38:	34002017          	auipc	zero,0x34002
    1a3c:	0000                	.insn	2, 0x0000
    1a3e:	0100                	.insn	2, 0x0100
    1a40:	921a0d63          	beq	s4,ra,b7a <$d.3+0x3f4>
    1a44:	0011                	.insn	2, 0x0011
    1a46:	fc00                	.insn	2, 0xfc00
    1a48:	0001                	.insn	2, 0x0001
    1a4a:	1a00                	.insn	2, 0x1a00
    1a4c:	11b0                	.insn	2, 0x11b0
    1a4e:	0000                	.insn	2, 0x0000
    1a50:	00000207          	.insn	4, 0x0207
    1a54:	2818                	.insn	2, 0x2818
    1a56:	34002017          	auipc	zero,0x34002
    1a5a:	0000                	.insn	2, 0x0000
    1a5c:	1b00                	.insn	2, 0x1b00
    1a5e:	5f01                	.insn	2, 0x5f01
    1a60:	00000213          	li	tp,0
    1a64:	0000                	.insn	2, 0x0000
    1a66:	1c00                	.insn	2, 0x1c00
    1a68:	02e1                	.insn	2, 0x02e1
    1a6a:	0000                	.insn	2, 0x0000
    1a6c:	16f0                	.insn	2, 0x16f0
    1a6e:	0020                	.insn	2, 0x0020
    1a70:	e11d                	.insn	2, 0xe11d
    1a72:	0002                	.insn	2, 0x0002
    1a74:	0000                	.insn	2, 0x0000
    1a76:	1d002017          	auipc	zero,0x1d002
    1a7a:	02e1                	.insn	2, 0x02e1
    1a7c:	0000                	.insn	2, 0x0000
    1a7e:	178c                	.insn	2, 0x178c
    1a80:	0020                	.insn	2, 0x0020
    1a82:	1e00                	.insn	2, 0x1e00
    1a84:	01ed                	.insn	2, 0x01ed
    1a86:	0000                	.insn	2, 0x0000
    1a88:	3b01                	.insn	2, 0x3b01
    1a8a:	3f1f 0000 0000      	.insn	6, 0x3f1f
    1a90:	2017b017          	auipc	zero,0x2017b
    1a94:	d800                	.insn	2, 0xd800
    1a96:	0002                	.insn	2, 0x0002
    1a98:	0100                	.insn	2, 0x0100
    1a9a:	2952                	.insn	2, 0x2952
    1a9c:	0004                	.insn	2, 0x0004
    1a9e:	0100                	.insn	2, 0x0100
    1aa0:	106c                	.insn	2, 0x106c
    1aa2:	11e1                	.insn	2, 0x11e1
    1aa4:	0000                	.insn	2, 0x0000
    1aa6:	00000683          	lb	a3,0(zero) # 0 <$d.8>
    1aaa:	6c01                	.insn	2, 0x6c01
    1aac:	06c8                	.insn	2, 0x06c8
    1aae:	0000                	.insn	2, 0x0000
    1ab0:	0212                	.insn	2, 0x0212
    1ab2:	1891                	.insn	2, 0x1891
    1ab4:	00000707          	.insn	4, 0x0707
    1ab8:	6d01                	.insn	2, 0x6d01
    1aba:	081d                	.insn	2, 0x081d
    1abc:	0000                	.insn	2, 0x0000
    1abe:	0620                	.insn	2, 0x0620
    1ac0:	0006                	.insn	2, 0x0006
    1ac2:	0100                	.insn	2, 0x0100
    1ac4:	4cb2                	.insn	2, 0x4cb2
    1ac6:	201a                	.insn	2, 0x201a
    1ac8:	2100                	.insn	2, 0x2100
    1aca:	0180                	.insn	2, 0x0180
    1acc:	0000                	.insn	2, 0x0000
    1ace:	0212                	.insn	2, 0x0212
    1ad0:	0d91                	.insn	2, 0x0d91
    1ad2:	000001b3          	add	gp,zero,zero
    1ad6:	8f01                	.insn	2, 0x8f01
    1ad8:	0826                	.insn	2, 0x0826
    1ada:	0000                	.insn	2, 0x0000
    1adc:	7811                	.insn	2, 0x7811
    1ade:	0012                	.insn	2, 0x0012
    1ae0:	5e00                	.insn	2, 0x5e00
    1ae2:	0004                	.insn	2, 0x0004
    1ae4:	0100                	.insn	2, 0x0100
    1ae6:	00022583          	lw	a1,0(tp) # 0 <$d.8>
    1aea:	1100                	.insn	2, 0x1100
    1aec:	1296                	.insn	2, 0x1296
    1aee:	0000                	.insn	2, 0x0000
    1af0:	06d8                	.insn	2, 0x06d8
    1af2:	0000                	.insn	2, 0x0000
    1af4:	8501                	.insn	2, 0x8501
    1af6:	00000117          	auipc	sp,0x0
    1afa:	ca11                	.insn	2, 0xca11
    1afc:	0012                	.insn	2, 0x0012
    1afe:	6100                	.insn	2, 0x6100
    1b00:	0000                	.insn	2, 0x0000
    1b02:	0100                	.insn	2, 0x0100
    1b04:	2590                	.insn	2, 0x2590
    1b06:	0002                	.insn	2, 0x0002
    1b08:	0000                	.insn	2, 0x0000
    1b0a:	ac18                	.insn	2, 0xac18
    1b0c:	2018                	.insn	2, 0x2018
    1b0e:	c800                	.insn	2, 0xc800
    1b10:	0000                	.insn	2, 0x0000
    1b12:	1100                	.insn	2, 0x1100
    1b14:	0000137f 0000045e 	.insn	12, 0x0117a4010000045e0000137f
    1b1c:	0117a401 
    1b20:	0000                	.insn	2, 0x0000
    1b22:	bc18                	.insn	2, 0xbc18
    1b24:	2018                	.insn	2, 0x2018
    1b26:	b800                	.insn	2, 0xb800
    1b28:	0000                	.insn	2, 0x0000
    1b2a:	1100                	.insn	2, 0x1100
    1b2c:	1302                	.insn	2, 0x1302
    1b2e:	0000                	.insn	2, 0x0000
    1b30:	0061                	.insn	2, 0x0061
    1b32:	0000                	.insn	2, 0x0000
    1b34:	a501                	.insn	2, 0xa501
    1b36:	0225                	.insn	2, 0x0225
    1b38:	0000                	.insn	2, 0x0000
    1b3a:	bc18                	.insn	2, 0xbc18
    1b3c:	2018                	.insn	2, 0x2018
    1b3e:	b800                	.insn	2, 0xb800
    1b40:	0000                	.insn	2, 0x0000
    1b42:	1100                	.insn	2, 0x1100
    1b44:	1392                	.insn	2, 0x1392
    1b46:	0000                	.insn	2, 0x0000
    1b48:	0255                	.insn	2, 0x0255
    1b4a:	0000                	.insn	2, 0x0000
    1b4c:	a601                	.insn	2, 0xa601
    1b4e:	00000117          	auipc	sp,0x0
    1b52:	0000                	.insn	2, 0x0000
    1b54:	1800                	.insn	2, 0x1800
    1b56:	1990                	.insn	2, 0x1990
    1b58:	0020                	.insn	2, 0x0020
    1b5a:	0038                	.insn	2, 0x0038
    1b5c:	0000                	.insn	2, 0x0000
    1b5e:	f211                	.insn	2, 0xf211
    1b60:	2c000013          	li	zero,704
    1b64:	0002                	.insn	2, 0x0002
    1b66:	0100                	.insn	2, 0x0100
    1b68:	0006c87b          	.insn	4, 0x0006c87b
    1b6c:	0000                	.insn	2, 0x0000
    1b6e:	1d22                	.insn	2, 0x1d22
    1b70:	02e1                	.insn	2, 0x02e1
    1b72:	0000                	.insn	2, 0x0000
    1b74:	1858                	.insn	2, 0x1858
    1b76:	0020                	.insn	2, 0x0020
    1b78:	e11d                	.insn	2, 0xe11d
    1b7a:	0002                	.insn	2, 0x0002
    1b7c:	9c00                	.insn	2, 0x9c00
    1b7e:	2018                	.insn	2, 0x2018
    1b80:	1d00                	.insn	2, 0x1d00
    1b82:	02e1                	.insn	2, 0x02e1
    1b84:	0000                	.insn	2, 0x0000
    1b86:	18d0                	.insn	2, 0x18d0
    1b88:	0020                	.insn	2, 0x0020
    1b8a:	e11d                	.insn	2, 0xe11d
    1b8c:	0002                	.insn	2, 0x0002
    1b8e:	e800                	.insn	2, 0xe800
    1b90:	2018                	.insn	2, 0x2018
    1b92:	1d00                	.insn	2, 0x1d00
    1b94:	02e1                	.insn	2, 0x02e1
    1b96:	0000                	.insn	2, 0x0000
    1b98:	1900                	.insn	2, 0x1900
    1b9a:	0020                	.insn	2, 0x0020
    1b9c:	e11d                	.insn	2, 0xe11d
    1b9e:	0002                	.insn	2, 0x0002
    1ba0:	1800                	.insn	2, 0x1800
    1ba2:	2019                	.insn	2, 0x2019
    1ba4:	1d00                	.insn	2, 0x1d00
    1ba6:	02e1                	.insn	2, 0x02e1
    1ba8:	0000                	.insn	2, 0x0000
    1baa:	1930                	.insn	2, 0x1930
    1bac:	0020                	.insn	2, 0x0020
    1bae:	e11d                	.insn	2, 0xe11d
    1bb0:	0002                	.insn	2, 0x0002
    1bb2:	4800                	.insn	2, 0x4800
    1bb4:	2019                	.insn	2, 0x2019
    1bb6:	1d00                	.insn	2, 0x1d00
    1bb8:	02e1                	.insn	2, 0x02e1
    1bba:	0000                	.insn	2, 0x0000
    1bbc:	1960                	.insn	2, 0x1960
    1bbe:	0020                	.insn	2, 0x0020
    1bc0:	e11d                	.insn	2, 0xe11d
    1bc2:	0002                	.insn	2, 0x0002
    1bc4:	7400                	.insn	2, 0x7400
    1bc6:	2019                	.insn	2, 0x2019
    1bc8:	1d00                	.insn	2, 0x1d00
    1bca:	02e1                	.insn	2, 0x02e1
    1bcc:	0000                	.insn	2, 0x0000
    1bce:	1988                	.insn	2, 0x1988
    1bd0:	0020                	.insn	2, 0x0020
    1bd2:	e11d                	.insn	2, 0xe11d
    1bd4:	0002                	.insn	2, 0x0002
    1bd6:	b800                	.insn	2, 0xb800
    1bd8:	2019                	.insn	2, 0x2019
    1bda:	1d00                	.insn	2, 0x1d00
    1bdc:	02e1                	.insn	2, 0x02e1
    1bde:	0000                	.insn	2, 0x0000
    1be0:	19d4                	.insn	2, 0x19d4
    1be2:	0020                	.insn	2, 0x0020
    1be4:	e11d                	.insn	2, 0xe11d
    1be6:	0002                	.insn	2, 0x0002
    1be8:	3000                	.insn	2, 0x3000
    1bea:	201a                	.insn	2, 0x201a
    1bec:	1d00                	.insn	2, 0x1d00
    1bee:	02e1                	.insn	2, 0x02e1
    1bf0:	0000                	.insn	2, 0x0000
    1bf2:	1a4c                	.insn	2, 0x1a4c
    1bf4:	0020                	.insn	2, 0x0020
    1bf6:	2300                	.insn	2, 0x2300
    1bf8:	1a88                	.insn	2, 0x1a88
    1bfa:	0020                	.insn	2, 0x0020
    1bfc:	00cc                	.insn	2, 0x00cc
    1bfe:	0000                	.insn	2, 0x0000
    1c00:	5201                	.insn	2, 0x5201
    1c02:	0682                	.insn	2, 0x0682
    1c04:	0000                	.insn	2, 0x0000
    1c06:	1d24                	.insn	2, 0x1d24
    1c08:	0014                	.insn	2, 0x0014
    1c0a:	8e00                	.insn	2, 0x8e00
    1c0c:	0006                	.insn	2, 0x0006
    1c0e:	2500                	.insn	2, 0x2500
    1c10:	5b01                	.insn	2, 0x5b01
    1c12:	0699                	.insn	2, 0x0699
    1c14:	0000                	.insn	2, 0x0000
    1c16:	901a                	.insn	2, 0x901a
    1c18:	0014                	.insn	2, 0x0014
    1c1a:	a400                	.insn	2, 0xa400
    1c1c:	0006                	.insn	2, 0x0006
    1c1e:	2100                	.insn	2, 0x2100
    1c20:	0198                	.insn	2, 0x0198
    1c22:	0000                	.insn	2, 0x0000
    1c24:	ba1a                	.insn	2, 0xba1a
    1c26:	0014                	.insn	2, 0x0014
    1c28:	b000                	.insn	2, 0xb000
    1c2a:	0006                	.insn	2, 0x0006
    1c2c:	1a00                	.insn	2, 0x1a00
    1c2e:	14d8                	.insn	2, 0x14d8
    1c30:	0000                	.insn	2, 0x0000
    1c32:	000006bb          	.insn	4, 0x06bb
    1c36:	0000                	.insn	2, 0x0000
    1c38:	8f26                	.insn	2, 0x8f26
    1c3a:	0004                	.insn	2, 0x0004
    1c3c:	0100                	.insn	2, 0x0100
    1c3e:	01c2                	.insn	2, 0x01c2
    1c40:	c114                	.insn	2, 0xc114
    1c42:	0001                	.insn	2, 0x0001
    1c44:	0100                	.insn	2, 0x0100
    1c46:	0cc2                	.insn	2, 0x0cc2
    1c48:	0001                	.insn	2, 0x0001
    1c4a:	1600                	.insn	2, 0x1600
    1c4c:	6115                	.insn	2, 0x6115
    1c4e:	0000                	.insn	2, 0x0000
    1c50:	0100                	.insn	2, 0x0100
    1c52:	000225c3          	.insn	4, 0x000225c3
    1c56:	1600                	.insn	2, 0x1600
    1c58:	da15                	.insn	2, 0xda15
    1c5a:	0006                	.insn	2, 0x0006
    1c5c:	0100                	.insn	2, 0x0100
    1c5e:	f0c4                	.insn	2, 0xf0c4
    1c60:	0000                	.insn	2, 0x0000
    1c62:	0000                	.insn	2, 0x0000
    1c64:	0000                	.insn	2, 0x0000
    1c66:	2126                	.insn	2, 0x2126
    1c68:	0002                	.insn	2, 0x0002
    1c6a:	0100                	.insn	2, 0x0100
    1c6c:	c11401bb          	.insn	4, 0xc11401bb
    1c70:	0001                	.insn	2, 0x0001
    1c72:	0100                	.insn	2, 0x0100
    1c74:	0000f0bb          	.insn	4, 0xf0bb
    1c78:	0000                	.insn	2, 0x0000
    1c7a:	201b5417          	auipc	s0,0x201b5
    1c7e:	8000                	.insn	2, 0x8000
    1c80:	0002                	.insn	2, 0x0002
    1c82:	0100                	.insn	2, 0x0100
    1c84:	1552                	.insn	2, 0x1552
    1c86:	0006                	.insn	2, 0x0006
    1c88:	0100                	.insn	2, 0x0100
    1c8a:	14eb10e7          	.insn	4, 0x14eb10e7
    1c8e:	0000                	.insn	2, 0x0000
    1c90:	00ca                	.insn	2, 0x00ca
    1c92:	0000                	.insn	2, 0x0000
    1c94:	e701                	.insn	2, 0xe701
    1c96:	0129                	.insn	2, 0x0129
    1c98:	0000                	.insn	2, 0x0000
    1c9a:	0910                	.insn	2, 0x0910
    1c9c:	0015                	.insn	2, 0x0015
    1c9e:	7200                	.insn	2, 0x7200
    1ca0:	0000                	.insn	2, 0x0000
    1ca2:	0100                	.insn	2, 0x0100
    1ca4:	00011ee7          	.insn	4, 0x00011ee7
    1ca8:	1000                	.insn	2, 0x1000
    1caa:	00001527          	.insn	4, 0x1527
    1cae:	00000353          	.insn	4, 0x0353
    1cb2:	e701                	.insn	2, 0xe701
    1cb4:	06d2                	.insn	2, 0x06d2
    1cb6:	0000                	.insn	2, 0x0000
    1cb8:	4611                	.insn	2, 0x4611
    1cba:	0015                	.insn	2, 0x0015
    1cbc:	e200                	.insn	2, 0xe200
    1cbe:	0000                	.insn	2, 0x0000
    1cc0:	0100                	.insn	2, 0x0100
    1cc2:	02e8                	.insn	2, 0x02e8
    1cc4:	0001                	.insn	2, 0x0001
    1cc6:	1100                	.insn	2, 0x1100
    1cc8:	1564                	.insn	2, 0x1564
    1cca:	0000                	.insn	2, 0x0000
    1ccc:	00000347          	.insn	4, 0x0347
    1cd0:	e901                	.insn	2, 0xe901
    1cd2:	011e                	.insn	2, 0x011e
    1cd4:	0000                	.insn	2, 0x0000
    1cd6:	c018                	.insn	2, 0xc018
    1cd8:	d000201b          	.insn	4, 0xd000201b
    1cdc:	0001                	.insn	2, 0x0001
    1cde:	1100                	.insn	2, 0x1100
    1ce0:	00001583          	lh	a1,0(zero) # 0 <$d.8>
    1ce4:	0530                	.insn	2, 0x0530
    1ce6:	0000                	.insn	2, 0x0000
    1ce8:	ec01                	.insn	2, 0xec01
    1cea:	011e                	.insn	2, 0x011e
    1cec:	0000                	.insn	2, 0x0000
    1cee:	00049627          	.insn	4, 0x00049627
    1cf2:	b800                	.insn	2, 0xb800
    1cf4:	0001                	.insn	2, 0x0001
    1cf6:	0100                	.insn	2, 0x0100
    1cf8:	012509ef          	jal	s3,51d0a <_binary_shell_bin_size+0x2f97a>
    1cfc:	9e64                	.insn	2, 0x9e64
    1cfe:	0004                	.insn	2, 0x0004
    1d00:	2100                	.insn	2, 0x2100
    1d02:	01d0                	.insn	2, 0x01d0
    1d04:	0000                	.insn	2, 0x0000
    1d06:	a11a                	.insn	2, 0xa11a
    1d08:	0015                	.insn	2, 0x0015
    1d0a:	aa00                	.insn	2, 0xaa00
    1d0c:	0004                	.insn	2, 0x0004
    1d0e:	2100                	.insn	2, 0x2100
    1d10:	01e8                	.insn	2, 0x01e8
    1d12:	0000                	.insn	2, 0x0000
    1d14:	1e1a                	.insn	2, 0x1e1a
    1d16:	0016                	.insn	2, 0x0016
    1d18:	b600                	.insn	2, 0xb600
    1d1a:	0004                	.insn	2, 0x0004
    1d1c:	0000                	.insn	2, 0x0000
    1d1e:	0000                	.insn	2, 0x0000
    1d20:	bc18                	.insn	2, 0xbc18
    1d22:	201c                	.insn	2, 0x201c
    1d24:	7400                	.insn	2, 0x7400
    1d26:	0000                	.insn	2, 0x0000
    1d28:	1200                	.insn	2, 0x1200
    1d2a:	5801                	.insn	2, 0x5801
    1d2c:	0061                	.insn	2, 0x0061
    1d2e:	0000                	.insn	2, 0x0000
    1d30:	f301                	.insn	2, 0xf301
    1d32:	011e                	.insn	2, 0x011e
    1d34:	0000                	.insn	2, 0x0000
    1d36:	c428                	.insn	2, 0xc428
    1d38:	0004                	.insn	2, 0x0004
    1d3a:	d400                	.insn	2, 0xd400
    1d3c:	201c                	.insn	2, 0x201c
    1d3e:	2000                	.insn	2, 0x2000
    1d40:	0000                	.insn	2, 0x0000
    1d42:	0100                	.insn	2, 0x0100
    1d44:	11f5                	.insn	2, 0x11f5
    1d46:	1800                	.insn	2, 0x1800
    1d48:	1d54                	.insn	2, 0x1d54
    1d4a:	0020                	.insn	2, 0x0020
    1d4c:	003c                	.insn	2, 0x003c
    1d4e:	0000                	.insn	2, 0x0000
    1d50:	7e29                	.insn	2, 0x7e29
    1d52:	0016                	.insn	2, 0x0016
    1d54:	6100                	.insn	2, 0x6100
    1d56:	0000                	.insn	2, 0x0000
    1d58:	0100                	.insn	2, 0x0100
    1d5a:	0102                	.insn	2, 0x0102
    1d5c:	011e                	.insn	2, 0x011e
    1d5e:	0000                	.insn	2, 0x0000
    1d60:	0021                	.insn	2, 0x0021
    1d62:	0002                	.insn	2, 0x0002
    1d64:	2900                	.insn	2, 0x2900
    1d66:	16ce                	.insn	2, 0x16ce
    1d68:	0000                	.insn	2, 0x0000
    1d6a:	01fd                	.insn	2, 0x01fd
    1d6c:	0000                	.insn	2, 0x0000
    1d6e:	0301                	.insn	2, 0x0301
    1d70:	f001                	.insn	2, 0xf001
    1d72:	0000                	.insn	2, 0x0000
    1d74:	0000                	.insn	2, 0x0000
    1d76:	0000                	.insn	2, 0x0000
    1d78:	e11d                	.insn	2, 0xe11d
    1d7a:	0002                	.insn	2, 0x0002
    1d7c:	cc00                	.insn	2, 0xcc00
    1d7e:	1d00201b          	.insn	4, 0x1d00201b
    1d82:	02e1                	.insn	2, 0x02e1
    1d84:	0000                	.insn	2, 0x0000
    1d86:	1bd8                	.insn	2, 0x1bd8
    1d88:	0020                	.insn	2, 0x0020
    1d8a:	e11d                	.insn	2, 0xe11d
    1d8c:	0002                	.insn	2, 0x0002
    1d8e:	0000                	.insn	2, 0x0000
    1d90:	201c                	.insn	2, 0x201c
    1d92:	1d00                	.insn	2, 0x1d00
    1d94:	02e1                	.insn	2, 0x02e1
    1d96:	0000                	.insn	2, 0x0000
    1d98:	1c18                	.insn	2, 0x1c18
    1d9a:	0020                	.insn	2, 0x0020
    1d9c:	e11d                	.insn	2, 0xe11d
    1d9e:	0002                	.insn	2, 0x0002
    1da0:	3000                	.insn	2, 0x3000
    1da2:	201c                	.insn	2, 0x201c
    1da4:	1d00                	.insn	2, 0x1d00
    1da6:	02e1                	.insn	2, 0x02e1
    1da8:	0000                	.insn	2, 0x0000
    1daa:	1c48                	.insn	2, 0x1c48
    1dac:	0020                	.insn	2, 0x0020
    1dae:	e11d                	.insn	2, 0xe11d
    1db0:	0002                	.insn	2, 0x0002
    1db2:	6000                	.insn	2, 0x6000
    1db4:	201c                	.insn	2, 0x201c
    1db6:	1d00                	.insn	2, 0x1d00
    1db8:	02e1                	.insn	2, 0x02e1
    1dba:	0000                	.insn	2, 0x0000
    1dbc:	1c78                	.insn	2, 0x1c78
    1dbe:	0020                	.insn	2, 0x0020
    1dc0:	e11d                	.insn	2, 0xe11d
    1dc2:	0002                	.insn	2, 0x0002
    1dc4:	9000                	.insn	2, 0x9000
    1dc6:	201c                	.insn	2, 0x201c
    1dc8:	1d00                	.insn	2, 0x1d00
    1dca:	02e1                	.insn	2, 0x02e1
    1dcc:	0000                	.insn	2, 0x0000
    1dce:	1ca4                	.insn	2, 0x1ca4
    1dd0:	0020                	.insn	2, 0x0020
    1dd2:	ee1d                	.insn	2, 0xee1d
    1dd4:	0002                	.insn	2, 0x0002
    1dd6:	b000                	.insn	2, 0xb000
    1dd8:	201c                	.insn	2, 0x201c
    1dda:	1d00                	.insn	2, 0x1d00
    1ddc:	02e1                	.insn	2, 0x02e1
    1dde:	0000                	.insn	2, 0x0000
    1de0:	1ce4                	.insn	2, 0x1ce4
    1de2:	0020                	.insn	2, 0x0020
    1de4:	e11d                	.insn	2, 0xe11d
    1de6:	0002                	.insn	2, 0x0002
    1de8:	0400                	.insn	2, 0x0400
    1dea:	201d                	.insn	2, 0x201d
    1dec:	1d00                	.insn	2, 0x1d00
    1dee:	02e1                	.insn	2, 0x02e1
    1df0:	0000                	.insn	2, 0x0000
    1df2:	1d10                	.insn	2, 0x1d10
    1df4:	0020                	.insn	2, 0x0020
    1df6:	e11d                	.insn	2, 0xe11d
    1df8:	0002                	.insn	2, 0x0002
    1dfa:	1c00                	.insn	2, 0x1c00
    1dfc:	201d                	.insn	2, 0x201d
    1dfe:	1d00                	.insn	2, 0x1d00
    1e00:	02e1                	.insn	2, 0x02e1
    1e02:	0000                	.insn	2, 0x0000
    1e04:	1d2c                	.insn	2, 0x1d2c
    1e06:	0020                	.insn	2, 0x0020
    1e08:	e11d                	.insn	2, 0xe11d
    1e0a:	0002                	.insn	2, 0x0002
    1e0c:	4800                	.insn	2, 0x4800
    1e0e:	201d                	.insn	2, 0x201d
    1e10:	1d00                	.insn	2, 0x1d00
    1e12:	02e1                	.insn	2, 0x02e1
    1e14:	0000                	.insn	2, 0x0000
    1e16:	1d54                	.insn	2, 0x1d54
    1e18:	0020                	.insn	2, 0x0020
    1e1a:	e11d                	.insn	2, 0xe11d
    1e1c:	0002                	.insn	2, 0x0002
    1e1e:	7800                	.insn	2, 0x7800
    1e20:	201d                	.insn	2, 0x201d
    1e22:	0000                	.insn	2, 0x0000
    1e24:	a82a                	.insn	2, 0xa82a
    1e26:	0005                	.insn	2, 0x0005
    1e28:	0100                	.insn	2, 0x0100
    1e2a:	000225cb          	.insn	4, 0x000225cb
    1e2e:	0100                	.insn	2, 0x0100
    1e30:	2c14                	.insn	2, 0x2c14
    1e32:	0002                	.insn	2, 0x0002
    1e34:	0100                	.insn	2, 0x0100
    1e36:	0006c8cb          	.insn	4, 0x0006c8cb
    1e3a:	1400                	.insn	2, 0x1400
    1e3c:	0176                	.insn	2, 0x0176
    1e3e:	0000                	.insn	2, 0x0000
    1e40:	cb01                	.insn	2, 0xcb01
    1e42:	06cd                	.insn	2, 0x06cd
    1e44:	0000                	.insn	2, 0x0000
    1e46:	c115                	.insn	2, 0xc115
    1e48:	0001                	.insn	2, 0x0001
    1e4a:	0100                	.insn	2, 0x0100
    1e4c:	d2cc                	.insn	2, 0xd2cc
    1e4e:	0006                	.insn	2, 0x0006
    1e50:	1600                	.insn	2, 0x1600
    1e52:	fd15                	.insn	2, 0xfd15
    1e54:	0001                	.insn	2, 0x0001
    1e56:	0100                	.insn	2, 0x0100
    1e58:	3fd6                	.insn	2, 0x3fd6
    1e5a:	0000                	.insn	2, 0x0000
    1e5c:	1500                	.insn	2, 0x1500
    1e5e:	05ea                	.insn	2, 0x05ea
    1e60:	0000                	.insn	2, 0x0000
    1e62:	d701                	.insn	2, 0xd701
    1e64:	010c                	.insn	2, 0x010c
    1e66:	0000                	.insn	2, 0x0000
    1e68:	0000                	.insn	2, 0x0000
    1e6a:	0000d30b          	.insn	4, 0xd30b
    1e6e:	0b00                	.insn	2, 0x0b00
    1e70:	06d2                	.insn	2, 0x06d2
    1e72:	0000                	.insn	2, 0x0000
    1e74:	0c0c                	.insn	2, 0x0c0c
    1e76:	0001                	.insn	2, 0x0001
    1e78:	4a00                	.insn	2, 0x4a00
    1e7a:	0001                	.insn	2, 0x0001
    1e7c:	0200                	.insn	2, 0x0200
    1e7e:	2b0c                	.insn	2, 0x2b0c
    1e80:	1dd4                	.insn	2, 0x1dd4
    1e82:	0020                	.insn	2, 0x0020
    1e84:	0250                	.insn	2, 0x0250
    1e86:	0000                	.insn	2, 0x0000
    1e88:	5201                	.insn	2, 0x5201
    1e8a:	00000327          	.insn	4, 0x0327
    1e8e:	0d01                	.insn	2, 0x0d01
    1e90:	2c01                	.insn	2, 0x2c01
    1e92:	16e1                	.insn	2, 0x16e1
    1e94:	0000                	.insn	2, 0x0000
    1e96:	0535                	.insn	2, 0x0535
    1e98:	0000                	.insn	2, 0x0000
    1e9a:	0d01                	.insn	2, 0x0d01
    1e9c:	2501                	.insn	2, 0x2501
    1e9e:	0002                	.insn	2, 0x0002
    1ea0:	2c00                	.insn	2, 0x2c00
    1ea2:	170a                	.insn	2, 0x170a
    1ea4:	0000                	.insn	2, 0x0000
    1ea6:	03d2                	.insn	2, 0x03d2
    1ea8:	0000                	.insn	2, 0x0000
    1eaa:	0d01                	.insn	2, 0x0d01
    1eac:	3201                	.insn	2, 0x3201
    1eae:	0008                	.insn	2, 0x0008
    1eb0:	2d00                	.insn	2, 0x2d00
    1eb2:	6300                	.insn	2, 0x6300
    1eb4:	01000003          	lb	zero,16(zero) # 10 <$d.8+0x10>
    1eb8:	010e                	.insn	2, 0x010e
    1eba:	00000837          	lui	a6,0x0
    1ebe:	802d                	.insn	2, 0x802d
    1ec0:	e402                	.insn	2, 0xe402
    1ec2:	0004                	.insn	2, 0x0004
    1ec4:	0100                	.insn	2, 0x0100
    1ec6:	083c010f          	.insn	4, 0x083c010f
    1eca:	0000                	.insn	2, 0x0000
    1ecc:	802d                	.insn	2, 0x802d
    1ece:	5c20                	.insn	2, 0x5c20
    1ed0:	0002                	.insn	2, 0x0002
    1ed2:	0100                	.insn	2, 0x0100
    1ed4:	0110                	.insn	2, 0x0110
    1ed6:	083c                	.insn	2, 0x083c
    1ed8:	0000                	.insn	2, 0x0000
    1eda:	3329                	.insn	2, 0x3329
    1edc:	ca000017          	auipc	zero,0xca000
    1ee0:	0000                	.insn	2, 0x0000
    1ee2:	0100                	.insn	2, 0x0100
    1ee4:	0112                	.insn	2, 0x0112
    1ee6:	06d2                	.insn	2, 0x06d2
    1ee8:	0000                	.insn	2, 0x0000
    1eea:	8029                	.insn	2, 0x8029
    1eec:	72000017          	auipc	zero,0x72000
    1ef0:	0000                	.insn	2, 0x0000
    1ef2:	0100                	.insn	2, 0x0100
    1ef4:	011e0113          	addi	sp,t3,17
    1ef8:	0000                	.insn	2, 0x0000
    1efa:	1821                	.insn	2, 0x1821
    1efc:	0002                	.insn	2, 0x0002
    1efe:	2900                	.insn	2, 0x2900
    1f00:	1870                	.insn	2, 0x1870
    1f02:	0000                	.insn	2, 0x0000
    1f04:	061d                	.insn	2, 0x061d
    1f06:	0000                	.insn	2, 0x0000
    1f08:	1601                	.insn	2, 0x1601
    1f0a:	d201                	.insn	2, 0xd201
    1f0c:	0006                	.insn	2, 0x0006
    1f0e:	2e00                	.insn	2, 0x2e00
    1f10:	0682                	.insn	2, 0x0682
    1f12:	0000                	.insn	2, 0x0000
    1f14:	0238                	.insn	2, 0x0238
    1f16:	0000                	.insn	2, 0x0000
    1f18:	1701                	.insn	2, 0x1701
    1f1a:	0d01                	.insn	2, 0x0d01
    1f1c:	ba24                	.insn	2, 0xba24
    1f1e:	8e000017          	auipc	zero,0x8e000
    1f22:	0006                	.insn	2, 0x0006
    1f24:	1a00                	.insn	2, 0x1a00
    1f26:	18b6                	.insn	2, 0x18b6
    1f28:	0000                	.insn	2, 0x0000
    1f2a:	06a4                	.insn	2, 0x06a4
    1f2c:	0000                	.insn	2, 0x0000
    1f2e:	5821                	.insn	2, 0x5821
    1f30:	0002                	.insn	2, 0x0002
    1f32:	1a00                	.insn	2, 0x1a00
    1f34:	1898                	.insn	2, 0x1898
    1f36:	0000                	.insn	2, 0x0000
    1f38:	06b0                	.insn	2, 0x06b0
    1f3a:	0000                	.insn	2, 0x0000
    1f3c:	d41a                	.insn	2, 0xd41a
    1f3e:	0018                	.insn	2, 0x0018
    1f40:	bb00                	.insn	2, 0xbb00
    1f42:	0006                	.insn	2, 0x0006
    1f44:	0000                	.insn	2, 0x0000
    1f46:	0000                	.insn	2, 0x0000
    1f48:	7821                	.insn	2, 0x7821
    1f4a:	0002                	.insn	2, 0x0002
    1f4c:	2900                	.insn	2, 0x2900
    1f4e:	1884                	.insn	2, 0x1884
    1f50:	0000                	.insn	2, 0x0000
    1f52:	0185                	.insn	2, 0x0185
    1f54:	0000                	.insn	2, 0x0000
    1f56:	1e01                	.insn	2, 0x1e01
    1f58:	d201                	.insn	2, 0xd201
    1f5a:	0006                	.insn	2, 0x0006
    1f5c:	2e00                	.insn	2, 0x2e00
    1f5e:	0682                	.insn	2, 0x0682
    1f60:	0000                	.insn	2, 0x0000
    1f62:	0298                	.insn	2, 0x0298
    1f64:	0000                	.insn	2, 0x0000
    1f66:	1f01                	.insn	2, 0x1f01
    1f68:	0d01                	.insn	2, 0x0d01
    1f6a:	1524                	.insn	2, 0x1524
    1f6c:	0018                	.insn	2, 0x0018
    1f6e:	8e00                	.insn	2, 0x8e00
    1f70:	0006                	.insn	2, 0x0006
    1f72:	1a00                	.insn	2, 0x1a00
    1f74:	1905                	.insn	2, 0x1905
    1f76:	0000                	.insn	2, 0x0000
    1f78:	06a4                	.insn	2, 0x06a4
    1f7a:	0000                	.insn	2, 0x0000
    1f7c:	b821                	.insn	2, 0xb821
    1f7e:	0002                	.insn	2, 0x0002
    1f80:	1a00                	.insn	2, 0x1a00
    1f82:	000018e7          	.insn	4, 0x18e7
    1f86:	06b0                	.insn	2, 0x06b0
    1f88:	0000                	.insn	2, 0x0000
    1f8a:	231a                	.insn	2, 0x231a
    1f8c:	0019                	.insn	2, 0x0019
    1f8e:	bb00                	.insn	2, 0xbb00
    1f90:	0006                	.insn	2, 0x0006
    1f92:	0000                	.insn	2, 0x0000
    1f94:	0000                	.insn	2, 0x0000
    1f96:	ee1c                	.insn	2, 0xee1c
    1f98:	0002                	.insn	2, 0x0002
    1f9a:	f800                	.insn	2, 0xf800
    1f9c:	201e                	.insn	2, 0x201e
    1f9e:	1d00                	.insn	2, 0x1d00
    1fa0:	02ee                	.insn	2, 0x02ee
    1fa2:	0000                	.insn	2, 0x0000
    1fa4:	2000                	.insn	2, 0x2000
    1fa6:	0020                	.insn	2, 0x0020
    1fa8:	d81c                	.insn	2, 0xd81c
    1faa:	0004                	.insn	2, 0x0004
    1fac:	2400                	.insn	2, 0x2400
    1fae:	2020                	.insn	2, 0x2020
    1fb0:	0000                	.insn	2, 0x0000
    1fb2:	003f032f          	.insn	4, 0x003f032f
    1fb6:	0000                	.insn	2, 0x0000
    1fb8:	4604                	.insn	2, 0x4604
    1fba:	0000                	.insn	2, 0x0000
    1fbc:	0a00                	.insn	2, 0x0a00
    1fbe:	3000                	.insn	2, 0x3000
    1fc0:	0810                	.insn	2, 0x0810
    1fc2:	0000                	.insn	2, 0x0000
    1fc4:	05ec                	.insn	2, 0x05ec
    1fc6:	0000                	.insn	2, 0x0000
    1fc8:	00003f03          	.insn	4, 0x3f03
    1fcc:	0400                	.insn	2, 0x0400
    1fce:	0046                	.insn	2, 0x0046
    1fd0:	0000                	.insn	2, 0x0000
    1fd2:	c80b000b          	.insn	4, 0xc80b000b
    1fd6:	0006                	.insn	2, 0x0006
    1fd8:	0a00                	.insn	2, 0x0a00
    1fda:	06d2                	.insn	2, 0x06d2
    1fdc:	0000                	.insn	2, 0x0000
    1fde:	1e0a                	.insn	2, 0x1e0a
    1fe0:	0001                	.insn	2, 0x0001
	...

00001fe4 <$d.6>:
    1fe4:	0785                	.insn	2, 0x0785
    1fe6:	0000                	.insn	2, 0x0000
    1fe8:	0004                	.insn	2, 0x0004
    1fea:	05ac                	.insn	2, 0x05ac
    1fec:	0000                	.insn	2, 0x0000
    1fee:	0104                	.insn	2, 0x0104
    1ff0:	027e                	.insn	2, 0x027e
    1ff2:	0000                	.insn	2, 0x0000
    1ff4:	001d                	.insn	2, 0x001d
    1ff6:	0264                	.insn	2, 0x0264
    1ff8:	0000                	.insn	2, 0x0000
    1ffa:	1b0d                	.insn	2, 0x1b0d
    1ffc:	0000                	.insn	2, 0x0000
    1ffe:	03f1                	.insn	2, 0x03f1
    2000:	0000                	.insn	2, 0x0000
    2002:	2024                	.insn	2, 0x2024
    2004:	0020                	.insn	2, 0x0020
    2006:	0634                	.insn	2, 0x0634
    2008:	0000                	.insn	2, 0x0000
    200a:	2802                	.insn	2, 0x2802
    200c:	30002023          	sw	zero,768(zero) # 300 <$d.7+0x28>
    2010:	01000003          	lb	zero,16(zero) # 10 <$d.8+0x10>
    2014:	8752                	.insn	2, 0x8752
    2016:	0006                	.insn	2, 0x0006
    2018:	0200                	.insn	2, 0x0200
    201a:	0145                	.insn	2, 0x0145
    201c:	00011e03          	lh	t3,0(sp) # 1b4e <$d.12+0x41>
    2020:	0300                	.insn	2, 0x0300
    2022:	0002                	.insn	2, 0x0002
    2024:	0200                	.insn	2, 0x0200
    2026:	03050147          	.insn	4, 0x03050147
    202a:	57b4                	.insn	2, 0x57b4
    202c:	64030023          	sb	zero,1600(t1)
    2030:	0004                	.insn	2, 0x0004
    2032:	0300                	.insn	2, 0x0300
    2034:	0002                	.insn	2, 0x0002
    2036:	0200                	.insn	2, 0x0200
    2038:	0148                	.insn	2, 0x0148
    203a:	0305                	.insn	2, 0x0305
    203c:	5844                	.insn	2, 0x5844
    203e:	de030023          	sb	zero,-544(t1)
    2042:	0006                	.insn	2, 0x0006
    2044:	2e00                	.insn	2, 0x2e00
    2046:	0002                	.insn	2, 0x0002
    2048:	0200                	.insn	2, 0x0200
    204a:	0149                	.insn	2, 0x0149
    204c:	0305                	.insn	2, 0x0305
    204e:	58d4                	.insn	2, 0x58d4
    2050:	15040023          	sb	a6,320(s0) # 201b6dba <__free_ram_end+0x1fe60dba>
    2054:	001d                	.insn	2, 0x001d
    2056:	b200                	.insn	2, 0xb200
    2058:	0004                	.insn	2, 0x0004
    205a:	0200                	.insn	2, 0x0200
    205c:	0145                	.insn	2, 0x0145
    205e:	00000337          	lui	t1,0x0
    2062:	6805                	.insn	2, 0x6805
    2064:	b4002023          	sw	zero,-1216(zero) # fffffb40 <__free_ram_end+0xffca9b40>
    2068:	0000                	.insn	2, 0x0000
    206a:	0600                	.insn	2, 0x0600
    206c:	00001d33          	sll	s10,zero,zero
    2070:	0061                	.insn	2, 0x0061
    2072:	0000                	.insn	2, 0x0000
    2074:	4b02                	.insn	2, 0x4b02
    2076:	9f01                	.insn	2, 0x9f01
    2078:	0002                	.insn	2, 0x0002
    207a:	0500                	.insn	2, 0x0500
    207c:	2368                	.insn	2, 0x2368
    207e:	0020                	.insn	2, 0x0020
    2080:	00a4                	.insn	2, 0x00a4
    2082:	0000                	.insn	2, 0x0000
    2084:	5e06                	.insn	2, 0x5e06
    2086:	001d                	.insn	2, 0x001d
    2088:	e400                	.insn	2, 0xe400
    208a:	0006                	.insn	2, 0x0006
    208c:	0200                	.insn	2, 0x0200
    208e:	014c                	.insn	2, 0x014c
    2090:	029f 0000 0000      	.insn	6, 0x029f
    2096:	3805                	.insn	2, 0x3805
    2098:	2024                	.insn	2, 0x2024
    209a:	6000                	.insn	2, 0x6000
    209c:	0000                	.insn	2, 0x0000
    209e:	0600                	.insn	2, 0x0600
    20a0:	00001e0f          	.insn	4, 0x1e0f
    20a4:	0061                	.insn	2, 0x0061
    20a6:	0000                	.insn	2, 0x0000
    20a8:	5b02                	.insn	2, 0x5b02
    20aa:	9f01                	.insn	2, 0x9f01
    20ac:	0002                	.insn	2, 0x0002
    20ae:	0500                	.insn	2, 0x0500
    20b0:	2444                	.insn	2, 0x2444
    20b2:	0020                	.insn	2, 0x0020
    20b4:	003c                	.insn	2, 0x003c
    20b6:	0000                	.insn	2, 0x0000
    20b8:	2f06                	.insn	2, 0x2f06
    20ba:	001e                	.insn	2, 0x001e
    20bc:	e400                	.insn	2, 0xe400
    20be:	0006                	.insn	2, 0x0006
    20c0:	0200                	.insn	2, 0x0200
    20c2:	015c                	.insn	2, 0x015c
    20c4:	029f 0000 0000      	.insn	6, 0x029f
    20ca:	a405                	.insn	2, 0xa405
    20cc:	2024                	.insn	2, 0x2024
    20ce:	6c00                	.insn	2, 0x6c00
    20d0:	0000                	.insn	2, 0x0000
    20d2:	0600                	.insn	2, 0x0600
    20d4:	1e44                	.insn	2, 0x1e44
    20d6:	0000                	.insn	2, 0x0000
    20d8:	0061                	.insn	2, 0x0061
    20da:	0000                	.insn	2, 0x0000
    20dc:	6402                	.insn	2, 0x6402
    20de:	9f01                	.insn	2, 0x9f01
    20e0:	0002                	.insn	2, 0x0002
    20e2:	0500                	.insn	2, 0x0500
    20e4:	24b8                	.insn	2, 0x24b8
    20e6:	0020                	.insn	2, 0x0020
    20e8:	003c                	.insn	2, 0x003c
    20ea:	0000                	.insn	2, 0x0000
    20ec:	6406                	.insn	2, 0x6406
    20ee:	001e                	.insn	2, 0x001e
    20f0:	e400                	.insn	2, 0xe400
    20f2:	0006                	.insn	2, 0x0006
    20f4:	0200                	.insn	2, 0x0200
    20f6:	0165                	.insn	2, 0x0165
    20f8:	029f 0000 0000      	.insn	6, 0x029f
    20fe:	7005                	.insn	2, 0x7005
    2100:	2025                	.insn	2, 0x2025
    2102:	6800                	.insn	2, 0x6800
    2104:	0000                	.insn	2, 0x0000
    2106:	0600                	.insn	2, 0x0600
    2108:	1e79                	.insn	2, 0x1e79
    210a:	0000                	.insn	2, 0x0000
    210c:	0061                	.insn	2, 0x0061
    210e:	0000                	.insn	2, 0x0000
    2110:	7c02                	.insn	2, 0x7c02
    2112:	9f01                	.insn	2, 0x9f01
    2114:	0002                	.insn	2, 0x0002
    2116:	0500                	.insn	2, 0x0500
    2118:	2580                	.insn	2, 0x2580
    211a:	0020                	.insn	2, 0x0020
    211c:	003c                	.insn	2, 0x003c
    211e:	0000                	.insn	2, 0x0000
    2120:	9906                	.insn	2, 0x9906
    2122:	001e                	.insn	2, 0x001e
    2124:	e400                	.insn	2, 0xe400
    2126:	0006                	.insn	2, 0x0006
    2128:	0200                	.insn	2, 0x0200
    212a:	017d                	.insn	2, 0x017d
    212c:	029f 0000 0000      	.insn	6, 0x029f
    2132:	00073207          	.insn	4, 0x00073207
    2136:	6c00                	.insn	2, 0x6c00
    2138:	2024                	.insn	2, 0x2024
    213a:	0700                	.insn	2, 0x0700
    213c:	0000073f 00202478 	.insn	8, 0x002024780000073f
    2144:	00073f07          	.insn	4, 0x00073f07
    2148:	8c00                	.insn	2, 0x8c00
    214a:	2024                	.insn	2, 0x2024
    214c:	0700                	.insn	2, 0x0700
    214e:	0000073f 002024a4 	.insn	8, 0x002024a40000073f
    2156:	00073207          	.insn	4, 0x00073207
    215a:	e000                	.insn	2, 0xe000
    215c:	2024                	.insn	2, 0x2024
    215e:	0700                	.insn	2, 0x0700
    2160:	0000073f 002024ec 	.insn	8, 0x002024ec0000073f
    2168:	00073f07          	.insn	4, 0x00073f07
    216c:	0000                	.insn	2, 0x0000
    216e:	2025                	.insn	2, 0x2025
    2170:	0700                	.insn	2, 0x0700
    2172:	0000073f 0020251c 	.insn	8, 0x0020251c0000073f
    217a:	00073f07          	.insn	4, 0x00073f07
    217e:	2800                	.insn	2, 0x2800
    2180:	2025                	.insn	2, 0x2025
    2182:	0700                	.insn	2, 0x0700
    2184:	074c                	.insn	2, 0x074c
    2186:	0000                	.insn	2, 0x0000
    2188:	2538                	.insn	2, 0x2538
    218a:	0020                	.insn	2, 0x0020
    218c:	0004a607          	.insn	4, 0x0004a607
    2190:	6000                	.insn	2, 0x6000
    2192:	2025                	.insn	2, 0x2025
    2194:	0700                	.insn	2, 0x0700
    2196:	074c                	.insn	2, 0x074c
    2198:	0000                	.insn	2, 0x0000
    219a:	2570                	.insn	2, 0x2570
    219c:	0020                	.insn	2, 0x0020
    219e:	00073207          	.insn	4, 0x00073207
    21a2:	a800                	.insn	2, 0xa800
    21a4:	2025                	.insn	2, 0x2025
    21a6:	0700                	.insn	2, 0x0700
    21a8:	0000073f 002025b4 	.insn	8, 0x002025b40000073f
    21b0:	00073f07          	.insn	4, 0x00073f07
    21b4:	c800                	.insn	2, 0xc800
    21b6:	2025                	.insn	2, 0x2025
    21b8:	0700                	.insn	2, 0x0700
    21ba:	0000073f 002025e4 	.insn	8, 0x002025e40000073f
    21c2:	00074c07          	.insn	4, 0x00074c07
    21c6:	f400                	.insn	2, 0xf400
    21c8:	2025                	.insn	2, 0x2025
    21ca:	0700                	.insn	2, 0x0700
    21cc:	04a6                	.insn	2, 0x04a6
    21ce:	0000                	.insn	2, 0x0000
    21d0:	2618                	.insn	2, 0x2618
    21d2:	0020                	.insn	2, 0x0020
    21d4:	00074c07          	.insn	4, 0x00074c07
    21d8:	2800                	.insn	2, 0x2800
    21da:	2026                	.insn	2, 0x2026
    21dc:	0800                	.insn	2, 0x0800
    21de:	0000073f 00202658 	.insn	8, 0x002026580000073f
    21e6:	0900                	.insn	2, 0x0900
    21e8:	0215                	.insn	2, 0x0215
    21ea:	0000                	.insn	2, 0x0000
    21ec:	270a                	.insn	2, 0x270a
    21ee:	0002                	.insn	2, 0x0002
    21f0:	0c00                	.insn	2, 0x0c00
    21f2:	270a                	.insn	2, 0x270a
    21f4:	0002                	.insn	2, 0x0002
    21f6:	0c00                	.insn	2, 0x0c00
    21f8:	0b00                	.insn	2, 0x0b00
    21fa:	0220                	.insn	2, 0x0220
    21fc:	0000                	.insn	2, 0x0000
    21fe:	000005b7          	lui	a1,0x0
    2202:	0701                	.insn	2, 0x0701
    2204:	980c                	.insn	2, 0x980c
    2206:	08000003          	lb	zero,128(zero) # 80 <$d.8+0x80>
    220a:	0d01                	.insn	2, 0x0d01
    220c:	0572                	.insn	2, 0x0572
    220e:	0000                	.insn	2, 0x0000
    2210:	0708                	.insn	2, 0x0708
    2212:	4009                	.insn	2, 0x4009
    2214:	0002                	.insn	2, 0x0002
    2216:	0a00                	.insn	2, 0x0a00
    2218:	00000227          	.insn	4, 0x0227
    221c:	0a0c                	.insn	2, 0x0a0c
    221e:	00000227          	.insn	4, 0x0227
    2222:	000c                	.insn	2, 0x000c
    2224:	00024b0b          	.insn	4, 0x00024b0b
    2228:	f900                	.insn	2, 0xf900
    222a:	0002                	.insn	2, 0x0002
    222c:	0100                	.insn	2, 0x0100
    222e:	0c09                	.insn	2, 0x0c09
    2230:	04f0                	.insn	2, 0x04f0
    2232:	0000                	.insn	2, 0x0000
    2234:	600e0407          	.insn	4, 0x600e0407
    2238:	0002                	.insn	2, 0x0002
    223a:	0200                	.insn	2, 0x0200
    223c:	0171                	.insn	2, 0x0171
    223e:	0305                	.insn	2, 0x0305
    2240:	2db5                	.insn	2, 0x2db5
    2242:	0020                	.insn	2, 0x0020
    2244:	6c09                	.insn	2, 0x6c09
    2246:	0002                	.insn	2, 0x0002
    2248:	0a00                	.insn	2, 0x0a00
    224a:	00000227          	.insn	4, 0x0227
    224e:	b90c000f          	.insn	4, 0xb90c000f
    2252:	08000003          	lb	zero,128(zero) # 80 <$d.8+0x80>
    2256:	0e01                	.insn	2, 0x0e01
    2258:	0281                	.insn	2, 0x0281
    225a:	0000                	.insn	2, 0x0000
    225c:	7802                	.insn	2, 0x7802
    225e:	0501                	.insn	2, 0x0501
    2260:	20329e03          	lh	t3,515(t0)
    2264:	0900                	.insn	2, 0x0900
    2266:	026c                	.insn	2, 0x026c
    2268:	0000                	.insn	2, 0x0000
    226a:	270a                	.insn	2, 0x270a
    226c:	0002                	.insn	2, 0x0002
    226e:	0e00                	.insn	2, 0x0e00
    2270:	0300                	.insn	2, 0x0300
    2272:	0119                	.insn	2, 0x0119
    2274:	0000                	.insn	2, 0x0000
    2276:	0240                	.insn	2, 0x0240
    2278:	0000                	.insn	2, 0x0000
    227a:	3702                	.insn	2, 0x3702
    227c:	0501                	.insn	2, 0x0501
    227e:	2357b003          	.insn	4, 0x2357b003
    2282:	0c00                	.insn	2, 0x0c00
    2284:	03b5                	.insn	2, 0x03b5
    2286:	0000                	.insn	2, 0x0000
    2288:	0405                	.insn	2, 0x0405
    228a:	0002ab0f          	.insn	4, 0x0002ab0f
    228e:	1000                	.insn	2, 0x1000
    2290:	0240                	.insn	2, 0x0240
    2292:	0000                	.insn	2, 0x0000
    2294:	0002bb0b          	.insn	4, 0x0002bb0b
    2298:	c100                	.insn	2, 0xc100
    229a:	0000                	.insn	2, 0x0000
    229c:	0100                	.insn	2, 0x0100
    229e:	0c08                	.insn	2, 0x0c08
    22a0:	00000027          	.insn	4, 0x0027
    22a4:	400f0207          	.insn	4, 0x400f0207
    22a8:	0002                	.insn	2, 0x0002
    22aa:	1100                	.insn	2, 0x1100
    22ac:	0274                	.insn	2, 0x0274
    22ae:	0000                	.insn	2, 0x0000
    22b0:	b902                	.insn	2, 0xb902
    22b2:	1201                	.insn	2, 0x1201
    22b4:	0176                	.insn	2, 0x0176
    22b6:	0000                	.insn	2, 0x0000
    22b8:	b902                	.insn	2, 0xb902
    22ba:	0321                	.insn	2, 0x0321
    22bc:	0000                	.insn	2, 0x0000
    22be:	ee12                	.insn	2, 0xee12
    22c0:	02000003          	lb	zero,32(zero) # 20 <$d.8+0x20>
    22c4:	9fb9                	.insn	2, 0x9fb9
    22c6:	0002                	.insn	2, 0x0002
    22c8:	1200                	.insn	2, 0x1200
    22ca:	053a                	.insn	2, 0x053a
    22cc:	0000                	.insn	2, 0x0000
    22ce:	b902                	.insn	2, 0xb902
    22d0:	029f 0000 b012      	.insn	6, 0xb0120000029f
    22d6:	02000003          	lb	zero,32(zero) # 20 <$d.8+0x20>
    22da:	32b9                	.insn	2, 0x32b9
    22dc:	12000003          	lb	zero,288(zero) # 120 <$d.8+0x120>
    22e0:	0624                	.insn	2, 0x0624
    22e2:	0000                	.insn	2, 0x0000
    22e4:	b902                	.insn	2, 0xb902
    22e6:	029f 0000 1413      	.insn	6, 0x14130000029f
    22ec:	0061                	.insn	2, 0x0061
    22ee:	0000                	.insn	2, 0x0000
    22f0:	bb02                	.insn	2, 0xbb02
    22f2:	029f 0000 1413      	.insn	6, 0x14130000029f
    22f8:	06e4                	.insn	2, 0x06e4
    22fa:	0000                	.insn	2, 0x0000
    22fc:	bc02                	.insn	2, 0xbc02
    22fe:	029f 0000 0000      	.insn	6, 0x029f
    2304:	0f00                	.insn	2, 0x0f00
    2306:	0326                	.insn	2, 0x0326
    2308:	0000                	.insn	2, 0x0000
    230a:	1509                	.insn	2, 0x1509
    230c:	0002                	.insn	2, 0x0002
    230e:	0a00                	.insn	2, 0x0a00
    2310:	00000227          	.insn	4, 0x0227
    2314:	0002                	.insn	2, 0x0002
    2316:	0003370f          	.insn	4, 0x0003370f
    231a:	1500                	.insn	2, 0x1500
    231c:	0215                	.insn	2, 0x0215
    231e:	0000                	.insn	2, 0x0000
    2320:	4611                	.insn	2, 0x4611
    2322:	0004                	.insn	2, 0x0004
    2324:	0200                	.insn	2, 0x0200
    2326:	01c1                	.insn	2, 0x01c1
    2328:	7612                	.insn	2, 0x7612
    232a:	0001                	.insn	2, 0x0001
    232c:	0200                	.insn	2, 0x0200
    232e:	21c1                	.insn	2, 0x21c1
    2330:	12000003          	lb	zero,288(zero) # 120 <$d.8+0x120>
    2334:	053a                	.insn	2, 0x053a
    2336:	0000                	.insn	2, 0x0000
    2338:	c102                	.insn	2, 0xc102
    233a:	029f 0000 e612      	.insn	6, 0xe6120000029f
    2340:	0006                	.insn	2, 0x0006
    2342:	0200                	.insn	2, 0x0200
    2344:	9fc1                	.insn	2, 0x9fc1
    2346:	0002                	.insn	2, 0x0002
    2348:	1200                	.insn	2, 0x1200
    234a:	034e                	.insn	2, 0x034e
    234c:	0000                	.insn	2, 0x0000
    234e:	c102                	.insn	2, 0xc102
    2350:	0332                	.insn	2, 0x0332
    2352:	0000                	.insn	2, 0x0000
    2354:	2412                	.insn	2, 0x2412
    2356:	0006                	.insn	2, 0x0006
    2358:	0200                	.insn	2, 0x0200
    235a:	9fc1                	.insn	2, 0x9fc1
    235c:	0002                	.insn	2, 0x0002
    235e:	1300                	.insn	2, 0x1300
    2360:	6114                	.insn	2, 0x6114
    2362:	0000                	.insn	2, 0x0000
    2364:	0200                	.insn	2, 0x0200
    2366:	00029fc3          	.insn	4, 0x00029fc3
    236a:	1300                	.insn	2, 0x1300
    236c:	e414                	.insn	2, 0xe414
    236e:	0006                	.insn	2, 0x0006
    2370:	0200                	.insn	2, 0x0200
    2372:	9fc4                	.insn	2, 0x9fc4
    2374:	0002                	.insn	2, 0x0002
    2376:	0000                	.insn	2, 0x0000
    2378:	0000                	.insn	2, 0x0000
    237a:	9b11                	.insn	2, 0x9b11
    237c:	0004                	.insn	2, 0x0004
    237e:	0200                	.insn	2, 0x0200
    2380:	0159                	.insn	2, 0x0159
    2382:	0a12                	.insn	2, 0x0a12
    2384:	0006                	.insn	2, 0x0006
    2386:	0200                	.insn	2, 0x0200
    2388:	e55a                	.insn	2, 0xe55a
    238a:	12000003          	lb	zero,288(zero) # 120 <$d.8+0x120>
    238e:	000001cf          	.insn	4, 0x01cf
    2392:	5b02                	.insn	2, 0x5b02
    2394:	03f6                	.insn	2, 0x03f6
    2396:	0000                	.insn	2, 0x0000
    2398:	00611413          	slli	s0,sp,0x6
    239c:	0000                	.insn	2, 0x0000
    239e:	5d02                	.insn	2, 0x5d02
    23a0:	029f 0000 1413      	.insn	6, 0x14130000029f
    23a6:	060e                	.insn	2, 0x060e
    23a8:	0000                	.insn	2, 0x0000
    23aa:	6202                	.insn	2, 0x6202
    23ac:	0240                	.insn	2, 0x0240
    23ae:	0000                	.insn	2, 0x0000
    23b0:	ac14                	.insn	2, 0xac14
    23b2:	0004                	.insn	2, 0x0004
    23b4:	0200                	.insn	2, 0x0200
    23b6:	b060                	.insn	2, 0xb060
    23b8:	0002                	.insn	2, 0x0002
    23ba:	1400                	.insn	2, 0x1400
    23bc:	02d1                	.insn	2, 0x02d1
    23be:	0000                	.insn	2, 0x0000
    23c0:	5f02                	.insn	2, 0x5f02
    23c2:	02b0                	.insn	2, 0x02b0
    23c4:	0000                	.insn	2, 0x0000
    23c6:	0000                	.insn	2, 0x0000
    23c8:	0f00                	.insn	2, 0x0f00
    23ca:	03ea                	.insn	2, 0x03ea
    23cc:	0000                	.insn	2, 0x0000
    23ce:	3709                	.insn	2, 0x3709
    23d0:	0a000003          	lb	zero,160(zero) # a0 <$d.8+0xa0>
    23d4:	00000227          	.insn	4, 0x0227
    23d8:	0002                	.insn	2, 0x0002
    23da:	0003fb0f          	.insn	4, 0x0003fb0f
    23de:	1500                	.insn	2, 0x1500
    23e0:	02a6                	.insn	2, 0x02a6
    23e2:	0000                	.insn	2, 0x0000
    23e4:	b411                	.insn	2, 0xb411
    23e6:	0006                	.insn	2, 0x0006
    23e8:	0200                	.insn	2, 0x0200
    23ea:	0176                	.insn	2, 0x0176
    23ec:	1e12                	.insn	2, 0x1e12
    23ee:	0001                	.insn	2, 0x0001
    23f0:	0200                	.insn	2, 0x0200
    23f2:	e576                	.insn	2, 0xe576
    23f4:	14000003          	lb	zero,320(zero) # 140 <$d.8+0x140>
    23f8:	0626                	.insn	2, 0x0626
    23fa:	0000                	.insn	2, 0x0000
    23fc:	7802                	.insn	2, 0x7802
    23fe:	041f 0000 0900      	.insn	6, 0x09000000041f
    2404:	000003fb          	.insn	4, 0x03fb
    2408:	270a                	.insn	2, 0x270a
    240a:	0002                	.insn	2, 0x0002
    240c:	0200                	.insn	2, 0x0200
    240e:	1100                	.insn	2, 0x1100
    2410:	0385                	.insn	2, 0x0385
    2412:	0000                	.insn	2, 0x0000
    2414:	8b02                	.insn	2, 0x8b02
    2416:	1201                	.insn	2, 0x1201
    2418:	0464                	.insn	2, 0x0464
    241a:	0000                	.insn	2, 0x0000
    241c:	8b02                	.insn	2, 0x8b02
    241e:	03e5                	.insn	2, 0x03e5
    2420:	0000                	.insn	2, 0x0000
    2422:	7014                	.insn	2, 0x7014
    2424:	02000003          	lb	zero,32(zero) # 20 <$d.8+0x20>
    2428:	1f8d                	.insn	2, 0x1f8d
    242a:	0004                	.insn	2, 0x0004
    242c:	0000                	.insn	2, 0x0000
    242e:	9011                	.insn	2, 0x9011
    2430:	02000003          	lb	zero,32(zero) # 20 <$d.8+0x20>
    2434:	0139                	.insn	2, 0x0139
    2436:	7612                	.insn	2, 0x7612
    2438:	0001                	.insn	2, 0x0001
    243a:	0200                	.insn	2, 0x0200
    243c:	9539                	.insn	2, 0x9539
    243e:	0004                	.insn	2, 0x0004
    2440:	1400                	.insn	2, 0x1400
    2442:	000002d3          	.insn	4, 0x02d3
    2446:	3b02                	.insn	2, 0x3b02
    2448:	02a6                	.insn	2, 0x02a6
    244a:	0000                	.insn	2, 0x0000
    244c:	3d14                	.insn	2, 0x3d14
    244e:	0005                	.insn	2, 0x0005
    2450:	0200                	.insn	2, 0x0200
    2452:	403d                	.insn	2, 0x403d
    2454:	0002                	.insn	2, 0x0002
    2456:	1400                	.insn	2, 0x1400
    2458:	02f0                	.insn	2, 0x02f0
    245a:	0000                	.insn	2, 0x0000
    245c:	3e02                	.insn	2, 0x3e02
    245e:	0240                	.insn	2, 0x0240
    2460:	0000                	.insn	2, 0x0000
    2462:	b714                	.insn	2, 0xb714
    2464:	0001                	.insn	2, 0x0001
    2466:	0200                	.insn	2, 0x0200
    2468:	0002403f 027b1400 	.insn	8, 0x027b14000002403f
    2470:	0000                	.insn	2, 0x0000
    2472:	4002                	.insn	2, 0x4002
    2474:	0240                	.insn	2, 0x0240
    2476:	0000                	.insn	2, 0x0000
    2478:	0f00                	.insn	2, 0x0f00
    247a:	049a                	.insn	2, 0x049a
    247c:	0000                	.insn	2, 0x0000
    247e:	4009                	.insn	2, 0x4009
    2480:	0002                	.insn	2, 0x0002
    2482:	0a00                	.insn	2, 0x0a00
    2484:	00000227          	.insn	4, 0x0227
    2488:	0002                	.insn	2, 0x0002
    248a:	2416                	.insn	2, 0x2416
    248c:	2020                	.insn	2, 0x2020
    248e:	d000                	.insn	2, 0xd000
    2490:	0002                	.insn	2, 0x0002
    2492:	0100                	.insn	2, 0x0100
    2494:	7b52                	.insn	2, 0x7b52
    2496:	0004                	.insn	2, 0x0004
    2498:	0200                	.insn	2, 0x0200
    249a:	17ca                	.insn	2, 0x17ca
    249c:	1936                	.insn	2, 0x1936
    249e:	0000                	.insn	2, 0x0000
    24a0:	03b0                	.insn	2, 0x03b0
    24a2:	0000                	.insn	2, 0x0000
    24a4:	ca02                	.insn	2, 0xca02
    24a6:	0332                	.insn	2, 0x0332
    24a8:	0000                	.insn	2, 0x0000
    24aa:	00195517          	auipc	a0,0x195
    24ae:	4e00                	.insn	2, 0x4e00
    24b0:	02000003          	lb	zero,32(zero) # 20 <$d.8+0x20>
    24b4:	32ca                	.insn	2, 0x32ca
    24b6:	17000003          	lb	zero,368(zero) # 170 <$d.8+0x170>
    24ba:	00001973          	csrrw	s2,0x0,zero
    24be:	044d                	.insn	2, 0x044d
    24c0:	0000                	.insn	2, 0x0000
    24c2:	ca02                	.insn	2, 0xca02
    24c4:	00000337          	lui	t1,0x0
    24c8:	00199117          	auipc	sp,0x199
    24cc:	f300                	.insn	2, 0xf300
    24ce:	0002                	.insn	2, 0x0002
    24d0:	0200                	.insn	2, 0x0200
    24d2:	c2ca                	.insn	2, 0xc2ca
    24d4:	0002                	.insn	2, 0x0002
    24d6:	1800                	.insn	2, 0x1800
    24d8:	1cd0                	.insn	2, 0x1cd0
    24da:	0000                	.insn	2, 0x0000
    24dc:	022e                	.insn	2, 0x022e
    24de:	0000                	.insn	2, 0x0000
    24e0:	d802                	.insn	2, 0xd802
    24e2:	0764                	.insn	2, 0x0764
    24e4:	0000                	.insn	2, 0x0000
    24e6:	fe14                	.insn	2, 0xfe14
    24e8:	0005                	.insn	2, 0x0005
    24ea:	0200                	.insn	2, 0x0200
    24ec:	76d6                	.insn	2, 0x76d6
    24ee:	14000007          	.insn	4, 0x14000007
    24f2:	06e9                	.insn	2, 0x06e9
    24f4:	0000                	.insn	2, 0x0000
    24f6:	d702                	.insn	2, 0xd702
    24f8:	0776                	.insn	2, 0x0776
    24fa:	0000                	.insn	2, 0x0000
    24fc:	9805                	.insn	2, 0x9805
    24fe:	2020                	.insn	2, 0x2020
    2500:	2000                	.insn	2, 0x2000
    2502:	0002                	.insn	2, 0x0002
    2504:	1800                	.insn	2, 0x1800
    2506:	19b0                	.insn	2, 0x19b0
    2508:	0000                	.insn	2, 0x0000
    250a:	03ee                	.insn	2, 0x03ee
    250c:	0000                	.insn	2, 0x0000
    250e:	f002                	.insn	2, 0xf002
    2510:	029f 0000 3805      	.insn	6, 0x38050000029f
    2516:	2021                	.insn	2, 0x2021
    2518:	7000                	.insn	2, 0x7000
    251a:	0001                	.insn	2, 0x0001
    251c:	1800                	.insn	2, 0x1800
    251e:	000019e7          	.insn	4, 0x19e7
    2522:	06e6                	.insn	2, 0x06e6
    2524:	0000                	.insn	2, 0x0000
    2526:	f102                	.insn	2, 0xf102
    2528:	029f 0000 5405      	.insn	6, 0x54050000029f
    252e:	2021                	.insn	2, 0x2021
    2530:	0000                	.insn	2, 0x0000
    2532:	0001                	.insn	2, 0x0001
    2534:	1900                	.insn	2, 0x1900
    2536:	6b01                	.insn	2, 0x6b01
    2538:	053a                	.insn	2, 0x053a
    253a:	0000                	.insn	2, 0x0000
    253c:	fa02                	.insn	2, 0xfa02
    253e:	029f 0000 c71a      	.insn	6, 0xc71a0000029f
    2544:	0002                	.insn	2, 0x0002
    2546:	5400                	.insn	2, 0x5400
    2548:	2021                	.insn	2, 0x2021
    254a:	4000                	.insn	2, 0x4000
    254c:	0000                	.insn	2, 0x0000
    254e:	0200                	.insn	2, 0x0200
    2550:	11fd                	.insn	2, 0x11fd
    2552:	0c91021b          	.insn	4, 0x0c91021b
    2556:	02da                	.insn	2, 0x02da
    2558:	0000                	.insn	2, 0x0000
    255a:	e56b011b          	.insn	4, 0xe56b011b
    255e:	0002                	.insn	2, 0x0002
    2560:	1b00                	.insn	2, 0x1b00
    2562:	9102                	.insn	2, 0x9102
    2564:	f004                	.insn	2, 0xf004
    2566:	0002                	.insn	2, 0x0002
    2568:	1b00                	.insn	2, 0x1b00
    256a:	5901                	.insn	2, 0x5901
    256c:	000002fb          	.insn	4, 0x02fb
    2570:	5405                	.insn	2, 0x5405
    2572:	2021                	.insn	2, 0x2021
    2574:	4000                	.insn	2, 0x4000
    2576:	0000                	.insn	2, 0x0000
    2578:	1c00                	.insn	2, 0x1c00
    257a:	1a5a                	.insn	2, 0x1a5a
    257c:	0000                	.insn	2, 0x0000
    257e:	00000307          	.insn	4, 0x0307
    2582:	5405                	.insn	2, 0x5405
    2584:	2021                	.insn	2, 0x2021
    2586:	4000                	.insn	2, 0x4000
    2588:	0000                	.insn	2, 0x0000
    258a:	1c00                	.insn	2, 0x1c00
    258c:	1a11                	.insn	2, 0x1a11
    258e:	0000                	.insn	2, 0x0000
    2590:	00000313          	li	t1,0
    2594:	0000                	.insn	2, 0x0000
    2596:	1d00                	.insn	2, 0x1d00
    2598:	033c                	.insn	2, 0x033c
    259a:	0000                	.insn	2, 0x0000
    259c:	02d8                	.insn	2, 0x02d8
    259e:	0000                	.insn	2, 0x0000
    25a0:	fe02                	.insn	2, 0xfe02
    25a2:	1b11                	.insn	2, 0x1b11
    25a4:	6b01                	.insn	2, 0x6b01
    25a6:	0000034f          	.insn	4, 0x034f
    25aa:	2091021b          	.insn	4, 0x2091021b
    25ae:	035a                	.insn	2, 0x035a
    25b0:	0000                	.insn	2, 0x0000
    25b2:	6562011b          	.insn	4, 0x6562011b
    25b6:	1b000003          	lb	zero,432(zero) # 1b0 <$d.5+0x30>
    25ba:	5901                	.insn	2, 0x5901
    25bc:	0370                	.insn	2, 0x0370
    25be:	0000                	.insn	2, 0x0000
    25c0:	f01e                	.insn	2, 0xf01e
    25c2:	0002                	.insn	2, 0x0002
    25c4:	1c00                	.insn	2, 0x1c00
    25c6:	1ad2                	.insn	2, 0x1ad2
    25c8:	0000                	.insn	2, 0x0000
    25ca:	037c                	.insn	2, 0x037c
    25cc:	0000                	.insn	2, 0x0000
    25ce:	081e                	.insn	2, 0x081e
    25d0:	1c000003          	lb	zero,448(zero) # 1c0 <$d.9+0x4>
    25d4:	1a89                	.insn	2, 0x1a89
    25d6:	0000                	.insn	2, 0x0000
    25d8:	0388                	.insn	2, 0x0388
    25da:	0000                	.insn	2, 0x0000
    25dc:	0000                	.insn	2, 0x0000
    25de:	1f00                	.insn	2, 0x1f00
    25e0:	0400                	.insn	2, 0x0400
    25e2:	0000                	.insn	2, 0x0000
    25e4:	0320                	.insn	2, 0x0320
    25e6:	0000                	.insn	2, 0x0000
    25e8:	0c02                	.insn	2, 0x0c02
    25ea:	1101                	.insn	2, 0x1101
    25ec:	561c                	.insn	2, 0x561c
    25ee:	1300001b          	.insn	4, 0x1300001b
    25f2:	0004                	.insn	2, 0x0004
    25f4:	1d00                	.insn	2, 0x1d00
    25f6:	0396                	.insn	2, 0x0396
    25f8:	0000                	.insn	2, 0x0000
    25fa:	0338                	.insn	2, 0x0338
    25fc:	0000                	.insn	2, 0x0000
    25fe:	7d02                	.insn	2, 0x7d02
    2600:	1e05                	.insn	2, 0x1e05
    2602:	0350                	.insn	2, 0x0350
    2604:	0000                	.insn	2, 0x0000
    2606:	271c                	.insn	2, 0x271c
    2608:	b500001b          	.insn	4, 0xb500001b
    260c:	1e000003          	lb	zero,480(zero) # 1e0 <$d.9+0x24>
    2610:	0368                	.insn	2, 0x0368
    2612:	0000                	.insn	2, 0x0000
    2614:	011c                	.insn	2, 0x011c
    2616:	c100001b          	.insn	4, 0xc100001b
    261a:	1c000003          	lb	zero,448(zero) # 1c0 <$d.9+0x4>
    261e:	1b14                	.insn	2, 0x1b14
    2620:	0000                	.insn	2, 0x0000
    2622:	03cc                	.insn	2, 0x03cc
    2624:	0000                	.insn	2, 0x0000
    2626:	0000                	.insn	2, 0x0000
    2628:	0000                	.insn	2, 0x0000
    262a:	2b20                	.insn	2, 0x2b20
    262c:	0004                	.insn	2, 0x0004
    262e:	dc00                	.insn	2, 0xdc00
    2630:	2021                	.insn	2, 0x2021
    2632:	1800                	.insn	2, 0x1800
    2634:	0000                	.insn	2, 0x0000
    2636:	0200                	.insn	2, 0x0200
    2638:	010d                	.insn	2, 0x010d
    263a:	1c11                	.insn	2, 0x1c11
    263c:	00001bc3          	.insn	4, 0x1bc3
    2640:	043e                	.insn	2, 0x043e
    2642:	0000                	.insn	2, 0x0000
    2644:	961a                	.insn	2, 0x961a
    2646:	dc000003          	lb	zero,-576(zero) # fffffdc0 <__free_ram_end+0xffca9dc0>
    264a:	2021                	.insn	2, 0x2021
    264c:	1800                	.insn	2, 0x1800
    264e:	0000                	.insn	2, 0x0000
    2650:	0200                	.insn	2, 0x0200
    2652:	0592                	.insn	2, 0x0592
    2654:	dc05                	.insn	2, 0xdc05
    2656:	2021                	.insn	2, 0x2021
    2658:	1800                	.insn	2, 0x1800
    265a:	0000                	.insn	2, 0x0000
    265c:	1c00                	.insn	2, 0x1c00
    265e:	1b94                	.insn	2, 0x1b94
    2660:	0000                	.insn	2, 0x0000
    2662:	03b5                	.insn	2, 0x03b5
    2664:	0000                	.insn	2, 0x0000
    2666:	dc05                	.insn	2, 0xdc05
    2668:	2021                	.insn	2, 0x2021
    266a:	1800                	.insn	2, 0x1800
    266c:	0000                	.insn	2, 0x0000
    266e:	1c00                	.insn	2, 0x1c00
    2670:	1b76                	.insn	2, 0x1b76
    2672:	0000                	.insn	2, 0x0000
    2674:	03cc                	.insn	2, 0x03cc
    2676:	0000                	.insn	2, 0x0000
    2678:	e31c                	.insn	2, 0xe31c
    267a:	c100001b          	.insn	4, 0xc100001b
    267e:	00000003          	lb	zero,0(zero) # 0 <$d.8>
    2682:	0000                	.insn	2, 0x0000
    2684:	1e00                	.insn	2, 0x1e00
    2686:	0380                	.insn	2, 0x0380
    2688:	0000                	.insn	2, 0x0000
    268a:	0106                	.insn	2, 0x0106
    268c:	001c                	.insn	2, 0x001c
    268e:	ae00                	.insn	2, 0xae00
    2690:	0004                	.insn	2, 0x0004
    2692:	0200                	.insn	2, 0x0200
    2694:	011f 0240 0000      	.insn	6, 0x0240011f
    269a:	0000                	.insn	2, 0x0000
    269c:	4a20                	.insn	2, 0x4a20
    269e:	0004                	.insn	2, 0x0004
    26a0:	5400                	.insn	2, 0x5400
    26a2:	2022                	.insn	2, 0x2022
    26a4:	1000                	.insn	2, 0x1000
    26a6:	0000                	.insn	2, 0x0000
    26a8:	0200                	.insn	2, 0x0200
    26aa:	210d0127          	.insn	4, 0x210d0127
    26ae:	80c0                	.insn	2, 0x80c0
    26b0:	5d08                	.insn	2, 0x5d08
    26b2:	0004                	.insn	2, 0x0004
    26b4:	1c00                	.insn	2, 0x1c00
    26b6:	1c1f 0000 0468      	.insn	6, 0x046800001c1f
    26bc:	0000                	.insn	2, 0x0000
    26be:	321c                	.insn	2, 0x321c
    26c0:	001c                	.insn	2, 0x001c
    26c2:	7300                	.insn	2, 0x7300
    26c4:	0004                	.insn	2, 0x0004
    26c6:	1c00                	.insn	2, 0x1c00
    26c8:	1c45                	.insn	2, 0x1c45
    26ca:	0000                	.insn	2, 0x0000
    26cc:	047e                	.insn	2, 0x047e
    26ce:	0000                	.insn	2, 0x0000
    26d0:	1e00                	.insn	2, 0x1e00
    26d2:	03a0                	.insn	2, 0x03a0
    26d4:	0000                	.insn	2, 0x0000
    26d6:	a106                	.insn	2, 0xa106
    26d8:	001c                	.insn	2, 0x001c
    26da:	9500                	.insn	2, 0x9500
    26dc:	0006                	.insn	2, 0x0006
    26de:	0200                	.insn	2, 0x0200
    26e0:	012a                	.insn	2, 0x012a
    26e2:	029f 0000 b81e      	.insn	6, 0xb81e0000029f
    26e8:	06000003          	lb	zero,96(zero) # 60 <$d.8+0x60>
    26ec:	1c58                	.insn	2, 0x1c58
    26ee:	0000                	.insn	2, 0x0000
    26f0:	003d                	.insn	2, 0x003d
    26f2:	0000                	.insn	2, 0x0000
    26f4:	2b02                	.insn	2, 0x2b02
    26f6:	9f01                	.insn	2, 0x9f01
    26f8:	0002                	.insn	2, 0x0002
    26fa:	0000                	.insn	2, 0x0000
    26fc:	0000                	.insn	2, 0x0000
    26fe:	0000                	.insn	2, 0x0000
    2700:	f422                	.insn	2, 0xf422
    2702:	2022                	.insn	2, 0x2022
    2704:	3400                	.insn	2, 0x3400
    2706:	0000                	.insn	2, 0x0000
    2708:	0100                	.insn	2, 0x0100
    270a:	3652                	.insn	2, 0x3652
    270c:	0000                	.insn	2, 0x0000
    270e:	0200                	.insn	2, 0x0200
    2710:	0139                	.insn	2, 0x0139
    2712:	0240                	.insn	2, 0x0240
    2714:	0000                	.insn	2, 0x0000
    2716:	0006c623          	.insn	4, 0x0006c623
    271a:	0100                	.insn	2, 0x0100
    271c:	2426                	.insn	2, 0x2426
    271e:	029f 0000 2300      	.insn	6, 0x23000000029f
    2724:	06f1                	.insn	2, 0x06f1
    2726:	0000                	.insn	2, 0x0000
    2728:	6c244c03          	lbu	s8,1730(s0)
    272c:	0002                	.insn	2, 0x0002
    272e:	0000                	.insn	2, 0x0000
    2730:	00042923          	sw	zero,18(s0)
    2734:	0100                	.insn	2, 0x0100
    2736:	075a2427          	.insn	4, 0x075a2427
    273a:	0000                	.insn	2, 0x0000
    273c:	0025                	.insn	2, 0x0025
    273e:	00075f0f          	.insn	4, 0x00075f0f
    2742:	1500                	.insn	2, 0x1500
    2744:	026c                	.insn	2, 0x026c
    2746:	0000                	.insn	2, 0x0000
    2748:	4009                	.insn	2, 0x4009
    274a:	0002                	.insn	2, 0x0002
    274c:	0a00                	.insn	2, 0x0a00
    274e:	00000227          	.insn	4, 0x0227
    2752:	0a02                	.insn	2, 0x0a02
    2754:	00000227          	.insn	4, 0x0227
    2758:	0002                	.insn	2, 0x0002
    275a:	1509                	.insn	2, 0x1509
    275c:	0002                	.insn	2, 0x0002
    275e:	0a00                	.insn	2, 0x0a00
    2760:	00000227          	.insn	4, 0x0227
    2764:	0a02                	.insn	2, 0x0a02
    2766:	00000227          	.insn	4, 0x0227
    276a:	0002                	.insn	2, 0x0002
	...

0000276d <$d.4>:
    276d:	0395                	.insn	2, 0x0395
    276f:	0000                	.insn	2, 0x0000
    2771:	0004                	.insn	2, 0x0004
    2773:	0786                	.insn	2, 0x0786
    2775:	0000                	.insn	2, 0x0000
    2777:	0104                	.insn	2, 0x0104
    2779:	027e                	.insn	2, 0x027e
    277b:	0000                	.insn	2, 0x0000
    277d:	001d                	.insn	2, 0x001d
    277f:	00000233          	add	tp,zero,zero
    2783:	2101                	.insn	2, 0x2101
    2785:	0000                	.insn	2, 0x0000
    2787:	03f1                	.insn	2, 0x03f1
    2789:	0000                	.insn	2, 0x0000
    278b:	2658                	.insn	2, 0x2658
    278d:	0020                	.insn	2, 0x0020
    278f:	0404                	.insn	2, 0x0404
    2791:	0000                	.insn	2, 0x0000
    2793:	3302                	.insn	2, 0x3302
    2795:	0000                	.insn	2, 0x0000
    2797:	0100                	.insn	2, 0x0100
    2799:	055c                	.insn	2, 0x055c
    279b:	202d1203          	lh	tp,514(s10)
    279f:	0300                	.insn	2, 0x0300
    27a1:	0000003f 00004604 	.insn	8, 0x46040000003f
    27a9:	1400                	.insn	2, 0x1400
    27ab:	0500                	.insn	2, 0x0500
    27ad:	03b9                	.insn	2, 0x03b9
    27af:	0000                	.insn	2, 0x0000
    27b1:	0108                	.insn	2, 0x0108
    27b3:	7206                	.insn	2, 0x7206
    27b5:	0005                	.insn	2, 0x0005
    27b7:	0800                	.insn	2, 0x0800
    27b9:	005a0207          	.insn	4, 0x005a0207
    27bd:	0000                	.insn	2, 0x0000
    27bf:	6901                	.insn	2, 0x6901
    27c1:	0305                	.insn	2, 0x0305
    27c3:	2e14                	.insn	2, 0x2e14
    27c5:	0020                	.insn	2, 0x0020
    27c7:	00003f03          	.insn	4, 0x3f03
    27cb:	0400                	.insn	2, 0x0400
    27cd:	0046                	.insn	2, 0x0046
    27cf:	0000                	.insn	2, 0x0000
    27d1:	73020013          	addi	zero,tp,1840 # 730 <$d.5+0x184>
    27d5:	0000                	.insn	2, 0x0000
    27d7:	0100                	.insn	2, 0x0100
    27d9:	056d                	.insn	2, 0x056d
    27db:	202e8003          	lb	zero,514(t4)
    27df:	0300                	.insn	2, 0x0300
    27e1:	0000003f 00004604 	.insn	8, 0x46040000003f
    27e9:	2100                	.insn	2, 0x2100
    27eb:	0200                	.insn	2, 0x0200
    27ed:	00000033          	add	zero,zero,zero
    27f1:	7301                	.insn	2, 0x7301
    27f3:	0305                	.insn	2, 0x0305
    27f5:	2c9d                	.insn	2, 0x2c9d
    27f7:	0020                	.insn	2, 0x0020
    27f9:	00009107          	.insn	4, 0x9107
    27fd:	0800                	.insn	2, 0x0800
    27ff:	0096                	.insn	2, 0x0096
    2801:	0000                	.insn	2, 0x0000
    2803:	a109                	.insn	2, 0xa109
    2805:	0000                	.insn	2, 0x0000
    2807:	f900                	.insn	2, 0xf900
    2809:	0002                	.insn	2, 0x0002
    280b:	0200                	.insn	2, 0x0200
    280d:	0509                	.insn	2, 0x0509
    280f:	04f0                	.insn	2, 0x04f0
    2811:	0000                	.insn	2, 0x0000
    2813:	98050407          	.insn	4, 0x98050407
    2817:	08000003          	lb	zero,128(zero) # 80 <$d.8+0x80>
    281b:	0901                	.insn	2, 0x0901
    281d:	00ba                	.insn	2, 0x00ba
    281f:	0000                	.insn	2, 0x0000
    2821:	00c1                	.insn	2, 0x00c1
    2823:	0000                	.insn	2, 0x0000
    2825:	0802                	.insn	2, 0x0802
    2827:	2705                	.insn	2, 0x2705
    2829:	0000                	.insn	2, 0x0000
    282b:	0700                	.insn	2, 0x0700
    282d:	0a02                	.insn	2, 0x0a02
    282f:	000001d3          	.insn	4, 0x01d3
    2833:	1201                	.insn	2, 0x1201
    2835:	00fc                	.insn	2, 0x00fc
    2837:	0000                	.insn	2, 0x0000
    2839:	0b01                	.insn	2, 0x0b01
    283b:	0124                	.insn	2, 0x0124
    283d:	0000                	.insn	2, 0x0000
    283f:	1201                	.insn	2, 0x1201
    2841:	0096                	.insn	2, 0x0096
    2843:	0000                	.insn	2, 0x0000
    2845:	0001b30b          	.insn	4, 0x0001b30b
    2849:	0100                	.insn	2, 0x0100
    284b:	0312                	.insn	2, 0x0312
    284d:	0001                	.insn	2, 0x0001
    284f:	0c00                	.insn	2, 0x0c00
    2851:	0540                	.insn	2, 0x0540
    2853:	0000                	.insn	2, 0x0000
    2855:	1401                	.insn	2, 0x1401
    2857:	0096                	.insn	2, 0x0096
    2859:	0000                	.insn	2, 0x0000
    285b:	0c0d                	.insn	2, 0x0c0d
    285d:	0061                	.insn	2, 0x0061
    285f:	0000                	.insn	2, 0x0000
    2861:	3801                	.insn	2, 0x3801
    2863:	00fc                	.insn	2, 0x00fc
    2865:	0000                	.insn	2, 0x0000
    2867:	0000                	.insn	2, 0x0000
    2869:	b505                	.insn	2, 0xb505
    286b:	05000003          	lb	zero,80(zero) # 50 <$d.8+0x50>
    286f:	0704                	.insn	2, 0x0704
    2871:	00a8                	.insn	2, 0x00a8
    2873:	0000                	.insn	2, 0x0000
    2875:	400e                	.insn	2, 0x400e
    2877:	0000                	.insn	2, 0x0000
    2879:	0100                	.insn	2, 0x0100
    287b:	010c                	.insn	2, 0x010c
    287d:	0000f60b          	.insn	4, 0xf60b
    2881:	0100                	.insn	2, 0x0100
    2883:	a10c                	.insn	2, 0xa10c
    2885:	0000                	.insn	2, 0x0000
    2887:	0000                	.insn	2, 0x0000
    2889:	d80a                	.insn	2, 0xd80a
    288b:	0002                	.insn	2, 0x0002
    288d:	0100                	.insn	2, 0x0100
    288f:	0000af43          	.insn	4, 0xaf43
    2893:	0100                	.insn	2, 0x0100
    2895:	0001b30b          	.insn	4, 0x0001b30b
    2899:	0100                	.insn	2, 0x0100
    289b:	00015943          	.insn	4, 0x00015943
    289f:	0c00                	.insn	2, 0x0c00
    28a1:	0244                	.insn	2, 0x0244
    28a3:	0000                	.insn	2, 0x0000
    28a5:	4501                	.insn	2, 0x4501
    28a7:	000000af          	.insn	4, 0x00af
    28ab:	0c0d                	.insn	2, 0x0c0d
    28ad:	0061                	.insn	2, 0x0061
    28af:	0000                	.insn	2, 0x0000
    28b1:	4701                	.insn	2, 0x4701
    28b3:	00fc                	.insn	2, 0x00fc
    28b5:	0000                	.insn	2, 0x0000
    28b7:	0c0d                	.insn	2, 0x0c0d
    28b9:	06e4                	.insn	2, 0x06e4
    28bb:	0000                	.insn	2, 0x0000
    28bd:	4901                	.insn	2, 0x4901
    28bf:	00fc                	.insn	2, 0x00fc
    28c1:	0000                	.insn	2, 0x0000
    28c3:	0000                	.insn	2, 0x0000
    28c5:	0700                	.insn	2, 0x0700
    28c7:	015e                	.insn	2, 0x015e
    28c9:	0000                	.insn	2, 0x0000
    28cb:	0000a80f          	.insn	4, 0xa80f
    28cf:	1000                	.insn	2, 0x1000
    28d1:	2658                	.insn	2, 0x2658
    28d3:	0020                	.insn	2, 0x0020
    28d5:	0404                	.insn	2, 0x0404
    28d7:	0000                	.insn	2, 0x0000
    28d9:	5201                	.insn	2, 0x5201
    28db:	0632                	.insn	2, 0x0632
    28dd:	0000                	.insn	2, 0x0000
    28df:	5201                	.insn	2, 0x5201
    28e1:	ae11                	.insn	2, 0xae11
    28e3:	001e                	.insn	2, 0x001e
    28e5:	2400                	.insn	2, 0x2400
    28e7:	0001                	.insn	2, 0x0001
    28e9:	0100                	.insn	2, 0x0100
    28eb:	9652                	.insn	2, 0x9652
    28ed:	0000                	.insn	2, 0x0000
    28ef:	1200                	.insn	2, 0x1200
    28f1:	9102                	.insn	2, 0x9102
    28f3:	b30c                	.insn	2, 0xb30c
    28f5:	0001                	.insn	2, 0x0001
    28f7:	0100                	.insn	2, 0x0100
    28f9:	7f54                	.insn	2, 0x7f54
    28fb:	13000003          	lb	zero,304(zero) # 130 <$d.8+0x130>
    28ff:	1f02                	.insn	2, 0x1f02
    2901:	0000                	.insn	2, 0x0000
    2903:	0376                	.insn	2, 0x0376
    2905:	0000                	.insn	2, 0x0000
    2907:	5701                	.insn	2, 0x5701
    2909:	00fc                	.insn	2, 0x00fc
    290b:	0000                	.insn	2, 0x0000
    290d:	0314                	.insn	2, 0x0314
    290f:	000003d7          	.insn	4, 0x03d7
    2913:	5601                	.insn	2, 0x5601
    2915:	00fc                	.insn	2, 0x00fc
    2917:	0000                	.insn	2, 0x0000
    2919:	360c                	.insn	2, 0x360c
    291b:	0001                	.insn	2, 0x0001
    291d:	0100                	.insn	2, 0x0100
    291f:	00038c77          	.insn	4, 0x00038c77
    2923:	1500                	.insn	2, 0x1500
    2925:	03d0                	.insn	2, 0x03d0
    2927:	0000                	.insn	2, 0x0000
    2929:	001ed713          	srli	a4,t4,0x1
    292d:	6c00                	.insn	2, 0x6c00
    292f:	0005                	.insn	2, 0x0005
    2931:	0100                	.insn	2, 0x0100
    2933:	fc59                	.insn	2, 0xfc59
    2935:	0000                	.insn	2, 0x0000
    2937:	1500                	.insn	2, 0x1500
    2939:	03e8                	.insn	2, 0x03e8
    293b:	0000                	.insn	2, 0x0000
    293d:	00234213          	xori	tp,t1,2
    2941:	b200                	.insn	2, 0xb200
    2943:	0005                	.insn	2, 0x0005
    2945:	0100                	.insn	2, 0x0100
    2947:	9661                	.insn	2, 0x9661
    2949:	0000                	.insn	2, 0x0000
    294b:	1300                	.insn	2, 0x1300
    294d:	2445                	.insn	2, 0x2445
    294f:	0000                	.insn	2, 0x0000
    2951:	0244                	.insn	2, 0x0244
    2953:	0000                	.insn	2, 0x0000
    2955:	6601                	.insn	2, 0x6601
    2957:	000000af          	.insn	4, 0x00af
    295b:	00245813          	srli	a6,s0,0x2
    295f:	e400                	.insn	2, 0xe400
    2961:	0000                	.insn	2, 0x0000
    2963:	0100                	.insn	2, 0x0100
    2965:	af62                	.insn	2, 0xaf62
    2967:	0000                	.insn	2, 0x0000
    2969:	1600                	.insn	2, 0x1600
    296b:	00c1                	.insn	2, 0x00c1
    296d:	0000                	.insn	2, 0x0000
    296f:	0408                	.insn	2, 0x0408
    2971:	0000                	.insn	2, 0x0000
    2973:	5b01                	.insn	2, 0x5b01
    2975:	170d                	.insn	2, 0x170d
    2977:	1f31                	.insn	2, 0x1f31
    2979:	0000                	.insn	2, 0x0000
    297b:	00cd                	.insn	2, 0x00cd
    297d:	0000                	.insn	2, 0x0000
    297f:	001f4f17          	auipc	t5,0x1f4
    2983:	d800                	.insn	2, 0xd800
    2985:	0000                	.insn	2, 0x0000
    2987:	1800                	.insn	2, 0x1800
    2989:	1f9e                	.insn	2, 0x1f9e
    298b:	0000                	.insn	2, 0x0000
    298d:	000000e3          	beqz	zero,318d <$d.4+0xa20>
    2991:	0819                	.insn	2, 0x0819
    2993:	0001                	.insn	2, 0x0001
    2995:	e000                	.insn	2, 0xe000
    2997:	2026                	.insn	2, 0x2026
    2999:	0c00                	.insn	2, 0x0c00
    299b:	0000                	.insn	2, 0x0000
    299d:	0100                	.insn	2, 0x0100
    299f:	0519                	.insn	2, 0x0519
    29a1:	001f7117          	auipc	sp,0x1f7
    29a5:	1000                	.insn	2, 0x1000
    29a7:	0001                	.insn	2, 0x0001
    29a9:	0000                	.insn	2, 0x0000
    29ab:	0819                	.insn	2, 0x0819
    29ad:	0001                	.insn	2, 0x0001
    29af:	1c00                	.insn	2, 0x1c00
    29b1:	0c002027          	.insn	4, 0x0c002027
    29b5:	0000                	.insn	2, 0x0000
    29b7:	0100                	.insn	2, 0x0100
    29b9:	0526                	.insn	2, 0x0526
    29bb:	00207617          	auipc	a2,0x207
    29bf:	1000                	.insn	2, 0x1000
    29c1:	0001                	.insn	2, 0x0001
    29c3:	0000                	.insn	2, 0x0000
    29c5:	0819                	.insn	2, 0x0819
    29c7:	0001                	.insn	2, 0x0001
    29c9:	3400                	.insn	2, 0x3400
    29cb:	0c002027          	.insn	4, 0x0c002027
    29cf:	0000                	.insn	2, 0x0000
    29d1:	0100                	.insn	2, 0x0100
    29d3:	052d                	.insn	2, 0x052d
    29d5:	0020a317          	auipc	t1,0x20a
    29d9:	1000                	.insn	2, 0x1000
    29db:	0001                	.insn	2, 0x0001
    29dd:	0000                	.insn	2, 0x0000
    29df:	0819                	.insn	2, 0x0819
    29e1:	0001                	.insn	2, 0x0001
    29e3:	7800                	.insn	2, 0x7800
    29e5:	c8002027          	.insn	4, 0xc8002027
    29e9:	0000                	.insn	2, 0x0000
    29eb:	0100                	.insn	2, 0x0100
    29ed:	0535                	.insn	2, 0x0535
    29ef:	0020d017          	auipc	zero,0x20d
    29f3:	1000                	.insn	2, 0x1000
    29f5:	0001                	.insn	2, 0x0001
    29f7:	0000                	.insn	2, 0x0000
    29f9:	441a                	.insn	2, 0x441a
    29fb:	2028                	.insn	2, 0x2028
    29fd:	3000                	.insn	2, 0x3000
    29ff:	0000                	.insn	2, 0x0000
    2a01:	1b00                	.insn	2, 0x1b00
    2a03:	5a01                	.insn	2, 0x5a01
    2a05:	000000ef          	jal	2a05 <$d.4+0x298>
    2a09:	0000                	.insn	2, 0x0000
    2a0b:	1c19                	.insn	2, 0x1c19
    2a0d:	0001                	.insn	2, 0x0001
    2a0f:	8400                	.insn	2, 0x8400
    2a11:	2028                	.insn	2, 0x2028
    2a13:	d400                	.insn	2, 0xd400
    2a15:	0000                	.insn	2, 0x0000
    2a17:	0100                	.insn	2, 0x0100
    2a19:	1866                	.insn	2, 0x1866
    2a1b:	031c                	.insn	2, 0x031c
    2a1d:	0c91                	.insn	2, 0x0c91
    2a1f:	289f 0001 1800      	.insn	6, 0x18000001289f
    2a25:	2380                	.insn	2, 0x2380
    2a27:	0000                	.insn	2, 0x0000
    2a29:	00000133          	add	sp,zero,zero
    2a2d:	841a                	.insn	2, 0x841a
    2a2f:	2028                	.insn	2, 0x2028
    2a31:	d400                	.insn	2, 0xd400
    2a33:	0000                	.insn	2, 0x0000
    2a35:	1800                	.insn	2, 0x1800
    2a37:	2355                	.insn	2, 0x2355
    2a39:	0000                	.insn	2, 0x0000
    2a3b:	0000013f 00042015 	.insn	8, 0x000420150000013f
    2a43:	1800                	.insn	2, 0x1800
    2a45:	23d5                	.insn	2, 0x23d5
    2a47:	0000                	.insn	2, 0x0000
    2a49:	0000014b          	.insn	4, 0x014b
    2a4d:	0000                	.insn	2, 0x0000
    2a4f:	0000                	.insn	2, 0x0000
    2a51:	1a00                	.insn	2, 0x1a00
    2a53:	29ac                	.insn	2, 0x29ac
    2a55:	0020                	.insn	2, 0x0020
    2a57:	005c                	.insn	2, 0x005c
    2a59:	0000                	.insn	2, 0x0000
    2a5b:	0112                	.insn	2, 0x0112
    2a5d:	6158                	.insn	2, 0x6158
    2a5f:	0000                	.insn	2, 0x0000
    2a61:	0100                	.insn	2, 0x0100
    2a63:	fc79                	.insn	2, 0xfc79
    2a65:	0000                	.insn	2, 0x0000
    2a67:	1a00                	.insn	2, 0x1a00
    2a69:	29b4                	.insn	2, 0x29b4
    2a6b:	0020                	.insn	2, 0x0020
    2a6d:	0054                	.insn	2, 0x0054
    2a6f:	0000                	.insn	2, 0x0000
    2a71:	ea0c                	.insn	2, 0xea0c
    2a73:	0005                	.insn	2, 0x0005
    2a75:	0100                	.insn	2, 0x0100
    2a77:	a87a                	.insn	2, 0xa87a
    2a79:	0000                	.insn	2, 0x0000
    2a7b:	0000                	.insn	2, 0x0000
    2a7d:	1d00                	.insn	2, 0x1d00
    2a7f:	035a                	.insn	2, 0x035a
    2a81:	0000                	.insn	2, 0x0000
    2a83:	2768                	.insn	2, 0x2768
    2a85:	0020                	.insn	2, 0x0020
    2a87:	5a1d                	.insn	2, 0x5a1d
    2a89:	78000003          	lb	zero,1920(zero) # 780 <$d.5+0x1d4>
    2a8d:	2029                	.insn	2, 0x2029
    2a8f:	1d00                	.insn	2, 0x1d00
    2a91:	035a                	.insn	2, 0x035a
    2a93:	0000                	.insn	2, 0x0000
    2a95:	2990                	.insn	2, 0x2990
    2a97:	0020                	.insn	2, 0x0020
    2a99:	721d                	.insn	2, 0x721d
    2a9b:	d0000003          	lb	zero,-768(zero) # fffffd00 <__free_ram_end+0xffca9d00>
    2a9f:	2029                	.insn	2, 0x2029
    2aa1:	1d00                	.insn	2, 0x1d00
    2aa3:	0372                	.insn	2, 0x0372
    2aa5:	0000                	.insn	2, 0x0000
    2aa7:	29e4                	.insn	2, 0x29e4
    2aa9:	0020                	.insn	2, 0x0020
    2aab:	721d                	.insn	2, 0x721d
    2aad:	f0000003          	lb	zero,-256(zero) # ffffff00 <__free_ram_end+0xffca9f00>
    2ab1:	2029                	.insn	2, 0x2029
    2ab3:	1d00                	.insn	2, 0x1d00
    2ab5:	0372                	.insn	2, 0x0372
    2ab7:	0000                	.insn	2, 0x0000
    2ab9:	2a04                	.insn	2, 0x2a04
    2abb:	0020                	.insn	2, 0x0020
    2abd:	5a1d                	.insn	2, 0x5a1d
    2abf:	58000003          	lb	zero,1408(zero) # 580 <$d.5+0x1b0>
    2ac3:	202a                	.insn	2, 0x202a
    2ac5:	0000                	.insn	2, 0x0000
    2ac7:	291e                	.insn	2, 0x291e
    2ac9:	0004                	.insn	2, 0x0004
    2acb:	0200                	.insn	2, 0x0200
    2acd:	03681f27          	.insn	4, 0x03681f27
    2ad1:	0000                	.insn	2, 0x0000
    2ad3:	0020                	.insn	2, 0x0020
    2ad5:	00036d07          	.insn	4, 0x00036d07
    2ad9:	0f00                	.insn	2, 0x0f00
    2adb:	0000003f 0006f11e 	.insn	8, 0x0006f11e0000003f
    2ae3:	0300                	.insn	2, 0x0300
    2ae5:	1f4c                	.insn	2, 0x1f4c
    2ae7:	0000003f 00a80300 	.insn	8, 0x00a803000000003f
    2aef:	0000                	.insn	2, 0x0000
    2af1:	4621                	.insn	2, 0x4621
    2af3:	0000                	.insn	2, 0x0000
    2af5:	0000                	.insn	2, 0x0000
    2af7:	0002                	.insn	2, 0x0002
    2af9:	00036d03          	.insn	4, 0x00036d03
    2afd:	0400                	.insn	2, 0x0400
    2aff:	0046                	.insn	2, 0x0046
    2b01:	0000                	.insn	2, 0x0000
    2b03:	0011                	.insn	2, 0x0011
	...

セクション .debug_ranges の逆アセンブル:

00000000 <$d.9>:
   0:	05bc                	.insn	2, 0x05bc
   2:	0020                	.insn	2, 0x0020
   4:	05c4                	.insn	2, 0x05c4
   6:	0020                	.insn	2, 0x0020
   8:	05d8                	.insn	2, 0x05d8
   a:	0020                	.insn	2, 0x0020
   c:	0648                	.insn	2, 0x0648
   e:	0020                	.insn	2, 0x0020
	...
  18:	0a38                	.insn	2, 0x0a38
  1a:	0020                	.insn	2, 0x0020
  1c:	0bb8                	.insn	2, 0x0bb8
  1e:	0020                	.insn	2, 0x0020
  20:	0c38                	.insn	2, 0x0c38
  22:	0020                	.insn	2, 0x0020
  24:	0c58                	.insn	2, 0x0c58
  26:	0020                	.insn	2, 0x0020
	...
  30:	0a74                	.insn	2, 0x0a74
  32:	0020                	.insn	2, 0x0020
  34:	0a9c                	.insn	2, 0x0a9c
  36:	0020                	.insn	2, 0x0020
  38:	0aac                	.insn	2, 0x0aac
  3a:	0020                	.insn	2, 0x0020
  3c:	0b1c                	.insn	2, 0x0b1c
  3e:	0020                	.insn	2, 0x0020
	...
  48:	0aac                	.insn	2, 0x0aac
  4a:	0020                	.insn	2, 0x0020
  4c:	0af0                	.insn	2, 0x0af0
  4e:	0020                	.insn	2, 0x0020
  50:	0afc                	.insn	2, 0x0afc
  52:	0020                	.insn	2, 0x0020
  54:	0b1c                	.insn	2, 0x0b1c
  56:	0020                	.insn	2, 0x0020
	...
  60:	0b58                	.insn	2, 0x0b58
  62:	0020                	.insn	2, 0x0020
  64:	0bb8                	.insn	2, 0x0bb8
  66:	0020                	.insn	2, 0x0020
  68:	0c38                	.insn	2, 0x0c38
  6a:	0020                	.insn	2, 0x0020
  6c:	0c58                	.insn	2, 0x0c58
  6e:	0020                	.insn	2, 0x0020
	...
  78:	0b58                	.insn	2, 0x0b58
  7a:	0020                	.insn	2, 0x0020
  7c:	0ba8                	.insn	2, 0x0ba8
  7e:	0020                	.insn	2, 0x0020
  80:	0c38                	.insn	2, 0x0c38
  82:	0020                	.insn	2, 0x0020
  84:	0c58                	.insn	2, 0x0c58
  86:	0020                	.insn	2, 0x0020
	...
  90:	0b58                	.insn	2, 0x0b58
  92:	0020                	.insn	2, 0x0020
  94:	0b90                	.insn	2, 0x0b90
  96:	0020                	.insn	2, 0x0020
  98:	0c38                	.insn	2, 0x0c38
  9a:	0020                	.insn	2, 0x0020
  9c:	0c58                	.insn	2, 0x0c58
  9e:	0020                	.insn	2, 0x0020
	...
  a8:	0c68                	.insn	2, 0x0c68
  aa:	0020                	.insn	2, 0x0020
  ac:	0c98                	.insn	2, 0x0c98
  ae:	0020                	.insn	2, 0x0020
  b0:	0ca0                	.insn	2, 0x0ca0
  b2:	0020                	.insn	2, 0x0020
  b4:	0e88                	.insn	2, 0x0e88
  b6:	0020                	.insn	2, 0x0020
	...
  c0:	0c68                	.insn	2, 0x0c68
  c2:	0020                	.insn	2, 0x0020
  c4:	0c98                	.insn	2, 0x0c98
  c6:	0020                	.insn	2, 0x0020
  c8:	0ca0                	.insn	2, 0x0ca0
  ca:	0020                	.insn	2, 0x0020
  cc:	0e88                	.insn	2, 0x0e88
  ce:	0020                	.insn	2, 0x0020
	...
  d8:	0f48                	.insn	2, 0x0f48
  da:	0020                	.insn	2, 0x0020
  dc:	0f5c                	.insn	2, 0x0f5c
  de:	0020                	.insn	2, 0x0020
  e0:	1044                	.insn	2, 0x1044
  e2:	0020                	.insn	2, 0x0020
  e4:	104c                	.insn	2, 0x104c
  e6:	0020                	.insn	2, 0x0020
	...
  f0:	1284                	.insn	2, 0x1284
  f2:	0020                	.insn	2, 0x0020
  f4:	1294                	.insn	2, 0x1294
  f6:	0020                	.insn	2, 0x0020
  f8:	1298                	.insn	2, 0x1298
  fa:	0020                	.insn	2, 0x0020
  fc:	129c                	.insn	2, 0x129c
  fe:	0020                	.insn	2, 0x0020
	...
 108:	12e4                	.insn	2, 0x12e4
 10a:	0020                	.insn	2, 0x0020
 10c:	12f4                	.insn	2, 0x12f4
 10e:	0020                	.insn	2, 0x0020
 110:	12f8                	.insn	2, 0x12f8
 112:	0020                	.insn	2, 0x0020
 114:	12fc                	.insn	2, 0x12fc
 116:	0020                	.insn	2, 0x0020
 118:	1300                	.insn	2, 0x1300
 11a:	0020                	.insn	2, 0x0020
 11c:	132c                	.insn	2, 0x132c
 11e:	0020                	.insn	2, 0x0020
	...
 128:	12e4                	.insn	2, 0x12e4
 12a:	0020                	.insn	2, 0x0020
 12c:	12f4                	.insn	2, 0x12f4
 12e:	0020                	.insn	2, 0x0020
 130:	12f8                	.insn	2, 0x12f8
 132:	0020                	.insn	2, 0x0020
 134:	12fc                	.insn	2, 0x12fc
 136:	0020                	.insn	2, 0x0020
	...
 140:	146c                	.insn	2, 0x146c
 142:	0020                	.insn	2, 0x0020
 144:	1478                	.insn	2, 0x1478
 146:	0020                	.insn	2, 0x0020
 148:	148c                	.insn	2, 0x148c
 14a:	0020                	.insn	2, 0x0020
 14c:	149c                	.insn	2, 0x149c
 14e:	0020                	.insn	2, 0x0020
 150:	14a0                	.insn	2, 0x14a0
 152:	0020                	.insn	2, 0x0020
 154:	14a4                	.insn	2, 0x14a4
 156:	0020                	.insn	2, 0x0020
	...
 160:	0010                	.insn	2, 0x0010
 162:	0020                	.insn	2, 0x0020
 164:	11f0                	.insn	2, 0x11f0
 166:	0020                	.insn	2, 0x0020
 168:	11f0                	.insn	2, 0x11f0
 16a:	0020                	.insn	2, 0x0020
 16c:	166c                	.insn	2, 0x166c
 16e:	0020                	.insn	2, 0x0020
 170:	0000                	.insn	2, 0x0000
 172:	0020                	.insn	2, 0x0020
 174:	0010                	.insn	2, 0x0010
 176:	0020                	.insn	2, 0x0020
	...

00000180 <$d.5>:
 180:	020c                	.insn	2, 0x020c
 182:	0000                	.insn	2, 0x0000
 184:	0230                	.insn	2, 0x0230
 186:	0000                	.insn	2, 0x0000
 188:	035c                	.insn	2, 0x035c
 18a:	0000                	.insn	2, 0x0000
 18c:	03d4                	.insn	2, 0x03d4
	...
 196:	0000                	.insn	2, 0x0000
 198:	047c                	.insn	2, 0x047c
 19a:	0000                	.insn	2, 0x0000
 19c:	0494                	.insn	2, 0x0494
 19e:	0000                	.insn	2, 0x0000
 1a0:	0498                	.insn	2, 0x0498
 1a2:	0000                	.insn	2, 0x0000
 1a4:	04a4                	.insn	2, 0x04a4
 1a6:	0000                	.insn	2, 0x0000
 1a8:	04ac                	.insn	2, 0x04ac
 1aa:	0000                	.insn	2, 0x0000
 1ac:	04dc                	.insn	2, 0x04dc
	...
 1b6:	0000                	.insn	2, 0x0000
 1b8:	057c                	.insn	2, 0x057c
 1ba:	0000                	.insn	2, 0x0000
 1bc:	0588                	.insn	2, 0x0588
 1be:	0000                	.insn	2, 0x0000
 1c0:	058c                	.insn	2, 0x058c
 1c2:	0000                	.insn	2, 0x0000
 1c4:	0638                	.insn	2, 0x0638
	...
 1ce:	0000                	.insn	2, 0x0000
 1d0:	057c                	.insn	2, 0x057c
 1d2:	0000                	.insn	2, 0x0000
 1d4:	0588                	.insn	2, 0x0588
 1d6:	0000                	.insn	2, 0x0000
 1d8:	058c                	.insn	2, 0x058c
 1da:	0000                	.insn	2, 0x0000
 1dc:	0638                	.insn	2, 0x0638
	...
 1e6:	0000                	.insn	2, 0x0000
 1e8:	057c                	.insn	2, 0x057c
 1ea:	0000                	.insn	2, 0x0000
 1ec:	0588                	.insn	2, 0x0588
 1ee:	0000                	.insn	2, 0x0000
 1f0:	058c                	.insn	2, 0x058c
 1f2:	0000                	.insn	2, 0x0000
 1f4:	0638                	.insn	2, 0x0638
	...
 1fe:	0000                	.insn	2, 0x0000
 200:	0700                	.insn	2, 0x0700
 202:	0000                	.insn	2, 0x0000
 204:	070c                	.insn	2, 0x070c
 206:	0000                	.insn	2, 0x0000
 208:	0714                	.insn	2, 0x0714
 20a:	0000                	.insn	2, 0x0000
 20c:	0724                	.insn	2, 0x0724
	...
 216:	0000                	.insn	2, 0x0000
 218:	0790                	.insn	2, 0x0790
 21a:	0000                	.insn	2, 0x0000
 21c:	07dc                	.insn	2, 0x07dc
 21e:	0000                	.insn	2, 0x0000
 220:	084c                	.insn	2, 0x084c
 222:	0000                	.insn	2, 0x0000
 224:	0864                	.insn	2, 0x0864
 226:	0000                	.insn	2, 0x0000
 228:	0898                	.insn	2, 0x0898
 22a:	0000                	.insn	2, 0x0000
 22c:	08fc                	.insn	2, 0x08fc
	...
 236:	0000                	.insn	2, 0x0000
 238:	0790                	.insn	2, 0x0790
 23a:	0000                	.insn	2, 0x0000
 23c:	07dc                	.insn	2, 0x07dc
 23e:	0000                	.insn	2, 0x0000
 240:	084c                	.insn	2, 0x084c
 242:	0000                	.insn	2, 0x0000
 244:	0858                	.insn	2, 0x0858
 246:	0000                	.insn	2, 0x0000
 248:	0898                	.insn	2, 0x0898
 24a:	0000                	.insn	2, 0x0000
 24c:	08fc                	.insn	2, 0x08fc
	...
 256:	0000                	.insn	2, 0x0000
 258:	0898                	.insn	2, 0x0898
 25a:	0000                	.insn	2, 0x0000
 25c:	08b0                	.insn	2, 0x08b0
 25e:	0000                	.insn	2, 0x0000
 260:	08b4                	.insn	2, 0x08b4
 262:	0000                	.insn	2, 0x0000
 264:	08c0                	.insn	2, 0x08c0
 266:	0000                	.insn	2, 0x0000
 268:	08c8                	.insn	2, 0x08c8
 26a:	0000                	.insn	2, 0x0000
 26c:	08fc                	.insn	2, 0x08fc
	...
 276:	0000                	.insn	2, 0x0000
 278:	0800                	.insn	2, 0x0800
 27a:	0000                	.insn	2, 0x0000
 27c:	084c                	.insn	2, 0x084c
 27e:	0000                	.insn	2, 0x0000
 280:	0864                	.insn	2, 0x0864
 282:	0000                	.insn	2, 0x0000
 284:	0878                	.insn	2, 0x0878
 286:	0000                	.insn	2, 0x0000
 288:	0908                	.insn	2, 0x0908
 28a:	0000                	.insn	2, 0x0000
 28c:	0968                	.insn	2, 0x0968
	...
 296:	0000                	.insn	2, 0x0000
 298:	0800                	.insn	2, 0x0800
 29a:	0000                	.insn	2, 0x0000
 29c:	084c                	.insn	2, 0x084c
 29e:	0000                	.insn	2, 0x0000
 2a0:	0864                	.insn	2, 0x0864
 2a2:	0000                	.insn	2, 0x0000
 2a4:	0870                	.insn	2, 0x0870
 2a6:	0000                	.insn	2, 0x0000
 2a8:	0908                	.insn	2, 0x0908
 2aa:	0000                	.insn	2, 0x0000
 2ac:	0968                	.insn	2, 0x0968
	...
 2b6:	0000                	.insn	2, 0x0000
 2b8:	0908                	.insn	2, 0x0908
 2ba:	0000                	.insn	2, 0x0000
 2bc:	0920                	.insn	2, 0x0920
 2be:	0000                	.insn	2, 0x0000
 2c0:	0924                	.insn	2, 0x0924
 2c2:	0000                	.insn	2, 0x0000
 2c4:	0930                	.insn	2, 0x0930
 2c6:	0000                	.insn	2, 0x0000
 2c8:	0938                	.insn	2, 0x0938
 2ca:	0000                	.insn	2, 0x0000
 2cc:	0968                	.insn	2, 0x0968
	...

000002d8 <$d.7>:
 2d8:	0170                	.insn	2, 0x0170
 2da:	0000                	.insn	2, 0x0000
 2dc:	0198                	.insn	2, 0x0198
 2de:	0000                	.insn	2, 0x0000
 2e0:	01a0                	.insn	2, 0x01a0
 2e2:	0000                	.insn	2, 0x0000
 2e4:	01a8                	.insn	2, 0x01a8
	...
 2ee:	0000                	.insn	2, 0x0000
 2f0:	0170                	.insn	2, 0x0170
 2f2:	0000                	.insn	2, 0x0000
 2f4:	0198                	.insn	2, 0x0198
 2f6:	0000                	.insn	2, 0x0000
 2f8:	01a0                	.insn	2, 0x01a0
 2fa:	0000                	.insn	2, 0x0000
 2fc:	01a8                	.insn	2, 0x01a8
	...
 306:	0000                	.insn	2, 0x0000
 308:	0170                	.insn	2, 0x0170
 30a:	0000                	.insn	2, 0x0000
 30c:	0198                	.insn	2, 0x0198
 30e:	0000                	.insn	2, 0x0000
 310:	01a0                	.insn	2, 0x01a0
 312:	0000                	.insn	2, 0x0000
 314:	01a8                	.insn	2, 0x01a8
	...
 31e:	0000                	.insn	2, 0x0000
 320:	0198                	.insn	2, 0x0198
 322:	0000                	.insn	2, 0x0000
 324:	01a0                	.insn	2, 0x01a0
 326:	0000                	.insn	2, 0x0000
 328:	01a8                	.insn	2, 0x01a8
 32a:	0000                	.insn	2, 0x0000
 32c:	01b8                	.insn	2, 0x01b8
	...
 336:	0000                	.insn	2, 0x0000
 338:	0198                	.insn	2, 0x0198
 33a:	0000                	.insn	2, 0x0000
 33c:	01a0                	.insn	2, 0x01a0
 33e:	0000                	.insn	2, 0x0000
 340:	01a8                	.insn	2, 0x01a8
 342:	0000                	.insn	2, 0x0000
 344:	01b8                	.insn	2, 0x01b8
	...
 34e:	0000                	.insn	2, 0x0000
 350:	0198                	.insn	2, 0x0198
 352:	0000                	.insn	2, 0x0000
 354:	01a0                	.insn	2, 0x01a0
 356:	0000                	.insn	2, 0x0000
 358:	01a8                	.insn	2, 0x01a8
 35a:	0000                	.insn	2, 0x0000
 35c:	01b8                	.insn	2, 0x01b8
	...
 366:	0000                	.insn	2, 0x0000
 368:	0198                	.insn	2, 0x0198
 36a:	0000                	.insn	2, 0x0000
 36c:	01a0                	.insn	2, 0x01a0
 36e:	0000                	.insn	2, 0x0000
 370:	01a8                	.insn	2, 0x01a8
 372:	0000                	.insn	2, 0x0000
 374:	01b8                	.insn	2, 0x01b8
	...
 37e:	0000                	.insn	2, 0x0000
 380:	01f4                	.insn	2, 0x01f4
 382:	0000                	.insn	2, 0x0000
 384:	01fc                	.insn	2, 0x01fc
 386:	0000                	.insn	2, 0x0000
 388:	020c                	.insn	2, 0x020c
 38a:	0000                	.insn	2, 0x0000
 38c:	0214                	.insn	2, 0x0214
 38e:	0000                	.insn	2, 0x0000
 390:	0218                	.insn	2, 0x0218
 392:	0000                	.insn	2, 0x0000
 394:	021c                	.insn	2, 0x021c
	...
 39e:	0000                	.insn	2, 0x0000
 3a0:	0240                	.insn	2, 0x0240
 3a2:	0000                	.insn	2, 0x0000
 3a4:	0274                	.insn	2, 0x0274
 3a6:	0000                	.insn	2, 0x0000
 3a8:	0278                	.insn	2, 0x0278
 3aa:	0000                	.insn	2, 0x0000
 3ac:	0280                	.insn	2, 0x0280
	...
 3b6:	0000                	.insn	2, 0x0000
 3b8:	0240                	.insn	2, 0x0240
 3ba:	0000                	.insn	2, 0x0000
 3bc:	0274                	.insn	2, 0x0274
 3be:	0000                	.insn	2, 0x0000
 3c0:	0278                	.insn	2, 0x0278
 3c2:	0000                	.insn	2, 0x0000
 3c4:	0280                	.insn	2, 0x0280
	...

000003d0 <$d.5>:
 3d0:	0040                	.insn	2, 0x0040
 3d2:	0000                	.insn	2, 0x0000
 3d4:	0328                	.insn	2, 0x0328
 3d6:	0000                	.insn	2, 0x0000
 3d8:	03ec                	.insn	2, 0x03ec
 3da:	0000                	.insn	2, 0x0000
 3dc:	0404                	.insn	2, 0x0404
	...
 3e6:	0000                	.insn	2, 0x0000
 3e8:	0080                	.insn	2, 0x0080
 3ea:	0000                	.insn	2, 0x0000
 3ec:	0110                	.insn	2, 0x0110
 3ee:	0000                	.insn	2, 0x0000
 3f0:	0120                	.insn	2, 0x0120
 3f2:	0000                	.insn	2, 0x0000
 3f4:	0320                	.insn	2, 0x0320
 3f6:	0000                	.insn	2, 0x0000
 3f8:	03ec                	.insn	2, 0x03ec
 3fa:	0000                	.insn	2, 0x0000
 3fc:	0404                	.insn	2, 0x0404
	...
 406:	0000                	.insn	2, 0x0000
 408:	0080                	.insn	2, 0x0080
 40a:	0000                	.insn	2, 0x0000
 40c:	0100                	.insn	2, 0x0100
 40e:	0000                	.insn	2, 0x0000
 410:	0120                	.insn	2, 0x0120
 412:	0000                	.insn	2, 0x0000
 414:	021c                	.insn	2, 0x021c
	...
 41e:	0000                	.insn	2, 0x0000
 420:	0240                	.insn	2, 0x0240
 422:	0000                	.insn	2, 0x0000
 424:	02f4                	.insn	2, 0x02f4
 426:	0000                	.insn	2, 0x0000
 428:	02f8                	.insn	2, 0x02f8
 42a:	0000                	.insn	2, 0x0000
 42c:	02fc                	.insn	2, 0x02fc
	...

セクション .debug_str の逆アセンブル:

00000000 <$d.10-0x27e>:
   0:	6e69                	.insn	2, 0x6e69
   2:	7469                	.insn	2, 0x7469
   4:	6169                	.insn	2, 0x6169
   6:	696c                	.insn	2, 0x696c
   8:	657a                	.insn	2, 0x657a
   a:	0064                	.insn	2, 0x0064
   c:	6e75                	.insn	2, 0x6e75
   e:	6e676973          	csrrsi	s2,0x6e6,14
  12:	6465                	.insn	2, 0x6465
  14:	6c20                	.insn	2, 0x6c20
  16:	20676e6f          	jal	t3,7621c <_binary_shell_bin_size+0x53e8c>
  1a:	6f6c                	.insn	2, 0x6f6c
  1c:	676e                	.insn	2, 0x676e
  1e:	7300                	.insn	2, 0x7300
  20:	74617473          	csrrci	s0,0x746,2
  24:	7375                	.insn	2, 0x7375
  26:	7500                	.insn	2, 0x7500
  28:	736e                	.insn	2, 0x736e
  2a:	6769                	.insn	2, 0x6769
  2c:	656e                	.insn	2, 0x656e
  2e:	2064                	.insn	2, 0x2064
  30:	726f6873          	csrrsi	a6,mhpmevent6h,30
  34:	0074                	.insn	2, 0x0074
  36:	6172                	.insn	2, 0x6172
  38:	646e                	.insn	2, 0x646e
  3a:	6d003233          	.insn	4, 0x6d003233
  3e:	006a                	.insn	2, 0x006a
  40:	6974                	.insn	2, 0x6974
  42:	796e                	.insn	2, 0x796e
  44:	645f 6c65 7961      	.insn	6, 0x79616c65645f
  4a:	6c00                	.insn	2, 0x6c00
  4c:	00676e6f          	jal	t3,76052 <_binary_shell_bin_size+0x53cc2>
  50:	7076                	.insn	2, 0x7076
  52:	306e                	.insn	2, 0x306e
  54:	6b00                	.insn	2, 0x6b00
  56:	7265                	.insn	2, 0x7265
  58:	656e                	.insn	2, 0x656e
  5a:	5f6c                	.insn	2, 0x5f6c
  5c:	616d                	.insn	2, 0x616d
  5e:	6e69                	.insn	2, 0x6e69
  60:	6900                	.insn	2, 0x6900
  62:	7300                	.insn	2, 0x7300
  64:	3131                	.insn	2, 0x3131
  66:	7400                	.insn	2, 0x7400
  68:	6172                	.insn	2, 0x6172
  6a:	5f70                	.insn	2, 0x5f70
  6c:	7266                	.insn	2, 0x7266
  6e:	6d61                	.insn	2, 0x6d61
  70:	0065                	.insn	2, 0x0065
  72:	656c                	.insn	2, 0x656c
  74:	006e                	.insn	2, 0x006e
  76:	6554                	.insn	2, 0x6554
  78:	61507473          	csrrci	s0,htimedeltah,0
  7c:	65007373          	csrrci	t1,0x650,0
  80:	7078                	.insn	2, 0x7078
  82:	6400                	.insn	2, 0x6400
  84:	62007473          	csrrci	s0,0x620,0
  88:	6b6c                	.insn	2, 0x6b6c
  8a:	725f 7165 705f      	.insn	6, 0x705f7165725f
  90:	6461                	.insn	2, 0x6461
  92:	7264                	.insn	2, 0x7264
  94:	7500                	.insn	2, 0x7500
  96:	5f726573          	csrrsi	a0,0x5f7,4
  9a:	6e65                	.insn	2, 0x6e65
  9c:	7274                	.insn	2, 0x7274
  9e:	0079                	.insn	2, 0x0079
  a0:	645f6173          	csrrsi	sp,hvip,30
  a4:	7461                	.insn	2, 0x7461
  a6:	5f61                	.insn	2, 0x5f61
  a8:	6170                	.insn	2, 0x6170
  aa:	73006567          	.insn	4, 0x73006567
  ae:	6174                	.insn	2, 0x6174
  b0:	625f6b63          	bltu	t5,t0,6e6 <$d.5+0x13a>
  b4:	6f74746f          	jal	s0,47faa <_binary_shell_bin_size+0x25c1a>
  b8:	006d                	.insn	2, 0x006d
  ba:	3561                	.insn	2, 0x3561
  bc:	6900                	.insn	2, 0x6900
  be:	7864                	.insn	2, 0x7864
  c0:	7500                	.insn	2, 0x7500
  c2:	6e69                	.insn	2, 0x6e69
  c4:	3174                	.insn	2, 0x3174
  c6:	5f36                	.insn	2, 0x5f36
  c8:	0074                	.insn	2, 0x0074
  ca:	6461                	.insn	2, 0x6461
  cc:	7264                	.insn	2, 0x7264
  ce:	6300                	.insn	2, 0x6300
  d0:	5f79706f          	j	97ec6 <_binary_shell_bin_size+0x75b36>
  d4:	657a6973          	csrrsi	s2,hviprio2h,20
  d8:	6700                	.insn	2, 0x6700
  da:	0070                	.insn	2, 0x0070
  dc:	3361                	.insn	2, 0x3361
  de:	7300                	.insn	2, 0x7300
  e0:	00700033          	add	zero,zero,t2
  e4:	5f637263          	bgeu	t1,s6,6c8 <$d.5+0x11c>
  e8:	7768                	.insn	2, 0x7768
  ea:	6e00                	.insn	2, 0x6e00
  ec:	7865                	.insn	2, 0x7865
  ee:	5f74                	.insn	2, 0x5f74
  f0:	6170                	.insn	2, 0x6170
  f2:	6464                	.insn	2, 0x6464
  f4:	0072                	.insn	2, 0x0072
  f6:	006e                	.insn	2, 0x006e
  f8:	6574                	.insn	2, 0x6574
  fa:	705f7473          	csrrci	s0,0x705,30
  fe:	7461                	.insn	2, 0x7461
 100:	6574                	.insn	2, 0x6574
 102:	6e72                	.insn	2, 0x6e72
 104:	7600                	.insn	2, 0x7600
 106:	0061                	.insn	2, 0x0061
 108:	73003473          	csrrc	s0,mhpmevent16h,zero
 10c:	0035                	.insn	2, 0x0035
 10e:	616d                	.insn	2, 0x616d
 110:	5f78                	.insn	2, 0x5f78
 112:	616d                	.insn	2, 0x616d
 114:	7274                	.insn	2, 0x7274
 116:	7869                	.insn	2, 0x7869
 118:	6c00                	.insn	2, 0x6c00
 11a:	7366                	.insn	2, 0x7366
 11c:	0072                	.insn	2, 0x0072
 11e:	5f41                	.insn	2, 0x5f41
 120:	616d                	.insn	2, 0x616d
 122:	0074                	.insn	2, 0x0074
 124:	735f6473          	csrrsi	s0,mhpmevent21h,30
 128:	6365                	.insn	2, 0x6365
 12a:	6f74                	.insn	2, 0x6f74
 12c:	5f72                	.insn	2, 0x5f72
 12e:	6461                	.insn	2, 0x6461
 130:	7264                	.insn	2, 0x7264
 132:	7365                	.insn	2, 0x7365
 134:	65680073          	.insn	4, 0x65680073
 138:	0078                	.insn	2, 0x0078
 13a:	6170                	.insn	2, 0x6170
 13c:	6464                	.insn	2, 0x6464
 13e:	5f72                	.insn	2, 0x5f72
 140:	0074                	.insn	2, 0x0074
 142:	7270                	.insn	2, 0x7270
 144:	7365636f          	jal	t1,5687a <_binary_shell_bin_size+0x344ea>
 148:	69750073          	.insn	4, 0x69750073
 14c:	746e                	.insn	2, 0x746e
 14e:	7470                	.insn	2, 0x7470
 150:	5f72                	.insn	2, 0x5f72
 152:	0074                	.insn	2, 0x0074
 154:	6d6d                	.insn	2, 0x6d6d
 156:	6f69                	.insn	2, 0x6f69
 158:	725f 3233 7600      	.insn	6, 0x76003233725f
 15e:	6e70                	.insn	2, 0x6e70
 160:	0031                	.insn	2, 0x0031
 162:	6172                	.insn	2, 0x6172
 164:	646e                	.insn	2, 0x646e
 166:	6d5f6d6f          	jal	s10,f703a <_binary_shell_bin_size+0xd4caa>
 16a:	6d65                	.insn	2, 0x6d65
 16c:	635f 6568 6b63      	.insn	6, 0x6b636568635f
 172:	6100                	.insn	2, 0x6100
 174:	756f0037          	lui	zero,0x756f0
 178:	0074                	.insn	2, 0x0074
 17a:	6c656873          	csrrsi	a6,0x6c6,10
 17e:	5f6c                	.insn	2, 0x5f6c
 180:	657a6973          	csrrsi	s2,hviprio2h,20
 184:	6c00                	.insn	2, 0x6c00
 186:	6568                	.insn	2, 0x6568
 188:	0078                	.insn	2, 0x0078
 18a:	6c62                	.insn	2, 0x6c62
 18c:	65725f6b          	.insn	4, 0x65725f6b
 190:	0071                	.insn	2, 0x0071
 192:	6175                	.insn	2, 0x6175
 194:	7472                	.insn	2, 0x7472
 196:	675f 7465 6863      	.insn	6, 0x68637465675f
 19c:	7261                	.insn	2, 0x7261
 19e:	6100                	.insn	2, 0x6100
 1a0:	0032                	.insn	2, 0x0032
 1a2:	6f62                	.insn	2, 0x6f62
 1a4:	72006c6f          	jal	s8,68c4 <$d.4+0x4157>
 1a8:	6e61                	.insn	2, 0x6e61
 1aa:	775f6567          	.insn	4, 0x775f6567
 1ae:	7364726f          	jal	tp,478e4 <_binary_shell_bin_size+0x25554>
 1b2:	6200                	.insn	2, 0x6200
 1b4:	6675                	.insn	2, 0x6675
 1b6:	7600                	.insn	2, 0x7600
 1b8:	0032                	.insn	2, 0x0032
 1ba:	657a6973          	csrrsi	s2,hviprio2h,20
 1be:	745f 7600 6100      	.insn	6, 0x61007600745f
 1c4:	6c6c                	.insn	2, 0x6c6c
 1c6:	705f636f          	jal	t1,f70ca <_binary_shell_bin_size+0xd4d3a>
 1ca:	6761                	.insn	2, 0x6761
 1cc:	7365                	.insn	2, 0x7365
 1ce:	5200                	.insn	2, 0x5200
 1d0:	4745                	.insn	2, 0x4745
 1d2:	7300                	.insn	2, 0x7300
 1d4:	5f64                	.insn	2, 0x5f64
 1d6:	6572                	.insn	2, 0x6572
 1d8:	6461                	.insn	2, 0x6461
 1da:	6f5f 636e 0065      	.insn	6, 0x0065636e6f5f
 1e0:	74617473          	csrrci	s0,0x746,2
 1e4:	0065                	.insn	2, 0x0065
 1e6:	656d                	.insn	2, 0x656d
 1e8:	636d                	.insn	2, 0x636d
 1ea:	7970                	.insn	2, 0x7970
 1ec:	7500                	.insn	2, 0x7500
 1ee:	7261                	.insn	2, 0x7261
 1f0:	5f74                	.insn	2, 0x5f74
 1f2:	7570                	.insn	2, 0x7570
 1f4:	6374                	.insn	2, 0x6374
 1f6:	6168                	.insn	2, 0x6168
 1f8:	0072                	.insn	2, 0x0072
 1fa:	63003173          	csrrc	sp,0x630,zero
 1fe:	7300                	.insn	2, 0x7300
 200:	6372                	.insn	2, 0x6372
 202:	72656b2f          	.insn	4, 0x72656b2f
 206:	656e                	.insn	2, 0x656e
 208:	2e6c                	.insn	2, 0x2e6c
 20a:	6f620063          	beq	tp,s6,8ea <$d.3+0x164>
 20e:	6c00746f          	jal	s0,78ce <$d.4+0x5161>
 212:	70006273          	csrrsi	tp,0x700,0
 216:	6f72                	.insn	2, 0x6f72
 218:	32740063          	beq	s0,t2,538 <$d.5+0x168>
 21c:	7300                	.insn	2, 0x7300
 21e:	3031                	.insn	2, 0x3031
 220:	7000                	.insn	2, 0x7000
 222:	6972                	.insn	2, 0x6972
 224:	746e                	.insn	2, 0x746e
 226:	685f 7865 0038      	.insn	6, 0x00387865685f
 22c:	5f430073          	.insn	4, 0x5f430073
 230:	73006173          	csrrsi	sp,mhpmevent16h,0
 234:	6372                	.insn	2, 0x6372
 236:	6364732f          	.insn	4, 0x6364732f
 23a:	7261                	.insn	2, 0x7261
 23c:	5f64                	.insn	2, 0x5f64
 23e:	7061                	.insn	2, 0x7061
 240:	2e69                	.insn	2, 0x2e69
 242:	72630063          	beq	t1,t1,962 <$d.3+0x1dc>
 246:	69760063          	beq	a2,s7,8c6 <$d.3+0x140>
 24a:	7472                	.insn	2, 0x7472
 24c:	6f69                	.insn	2, 0x6f69
 24e:	765f 7269 7174      	.insn	6, 0x71747269765f
 254:	6e00                	.insn	2, 0x6e00
 256:	6269                	.insn	2, 0x6269
 258:	6c62                	.insn	2, 0x6c62
 25a:	0065                	.insn	2, 0x0065
 25c:	414d                	.insn	2, 0x414d
 25e:	5f58                	.insn	2, 0x5f58
 260:	454c                	.insn	2, 0x454c
 262:	004e                	.insn	2, 0x004e
 264:	2f637273          	csrrci	tp,0x2f6,6
 268:	616e7973          	csrrci	s2,0x616,28
 26c:	5f70                	.insn	2, 0x5f70
 26e:	7061                	.insn	2, 0x7061
 270:	2e69                	.insn	2, 0x2e69
 272:	6f6c0063          	beq	s8,s6,952 <$d.3+0x1cc>
 276:	6461                	.insn	2, 0x6461
 278:	415f 7600 0033      	.insn	6, 0x00337600415f

0000027e <$d.10>:
 27e:	6255                	.insn	2, 0x6255
 280:	6e75                	.insn	2, 0x6e75
 282:	7574                	.insn	2, 0x7574
 284:	6320                	.insn	2, 0x6320
 286:	616c                	.insn	2, 0x616c
 288:	676e                	.insn	2, 0x676e
 28a:	7620                	.insn	2, 0x7620
 28c:	7265                	.insn	2, 0x7265
 28e:	6e6f6973          	csrrsi	s2,0x6e6,30
 292:	3120                	.insn	2, 0x3120
 294:	2e38                	.insn	2, 0x2e38
 296:	2e31                	.insn	2, 0x2e31
 298:	31282033          	.insn	4, 0x31282033
 29c:	6275                	.insn	2, 0x6275
 29e:	6e75                	.insn	2, 0x6e75
 2a0:	7574                	.insn	2, 0x7574
 2a2:	2931                	.insn	2, 0x2931
 2a4:	6900                	.insn	2, 0x6900
 2a6:	6c64                	.insn	2, 0x6c64
 2a8:	5f65                	.insn	2, 0x5f65
 2aa:	7270                	.insn	2, 0x7270
 2ac:	6500636f          	jal	t1,68fc <$d.4+0x418f>
 2b0:	646e                	.insn	2, 0x646e
 2b2:	615f 6464 0072      	.insn	6, 0x00726464615f
 2b8:	6172                	.insn	2, 0x6172
 2ba:	676e                	.insn	2, 0x676e
 2bc:	5f65                	.insn	2, 0x5f65
 2be:	7962                	.insn	2, 0x7962
 2c0:	6574                	.insn	2, 0x6574
 2c2:	72730073          	.insn	4, 0x72730073
 2c6:	6f632f63          	.insn	4, 0x6f632f63
 2ca:	6d6d                	.insn	2, 0x6d6d
 2cc:	632e6e6f          	jal	t3,e68fe <_binary_shell_bin_size+0xc456e>
 2d0:	4100                	.insn	2, 0x4100
 2d2:	6200                	.insn	2, 0x6200
 2d4:	7361                	.insn	2, 0x7361
 2d6:	0065                	.insn	2, 0x0065
 2d8:	635f6473          	csrrsi	s0,0x635,30
 2dc:	6372                	.insn	2, 0x6372
 2de:	3631                	.insn	2, 0x3631
 2e0:	7500                	.insn	2, 0x7500
 2e2:	7261                	.insn	2, 0x7261
 2e4:	5f74                	.insn	2, 0x5f74
 2e6:	6170                	.insn	2, 0x6170
 2e8:	70006567          	.insn	4, 0x70006567
 2ec:	6761                	.insn	2, 0x6761
 2ee:	0065                	.insn	2, 0x0065
 2f0:	3176                	.insn	2, 0x3176
 2f2:	6f00                	.insn	2, 0x6f00
 2f4:	7475                	.insn	2, 0x7475
 2f6:	435f 7500 6e69      	.insn	6, 0x6e697500435f
 2fc:	3374                	.insn	2, 0x3374
 2fe:	5f32                	.insn	2, 0x5f32
 300:	0074                	.insn	2, 0x0074
 302:	72727563          	bgeu	tp,t2,a2c <$d.3+0x2a6>
 306:	6e65                	.insn	2, 0x6e65
 308:	5f74                	.insn	2, 0x5f74
 30a:	7270                	.insn	2, 0x7270
 30c:	6200636f          	jal	t1,692c <$d.4+0x41bf>
 310:	6b6c                	.insn	2, 0x6b6c
 312:	725f 7165 6575      	.insn	6, 0x65757165725f
 318:	765f7473          	csrrci	s0,0x765,30
 31c:	0071                	.insn	2, 0x0071
 31e:	6d6d                	.insn	2, 0x6d6d
 320:	6f69                	.insn	2, 0x6f69
 322:	775f 3233 6300      	.insn	6, 0x63003233775f
 328:	646d                	.insn	2, 0x646d
 32a:	645f 6d75 0070      	.insn	6, 0x00706d75645f
 330:	74697773          	csrrci	a4,0x746,18
 334:	635f6863          	bltu	t5,s5,964 <$d.3+0x1de>
 338:	65746e6f          	jal	t3,4718e <_binary_shell_bin_size+0x24dfe>
 33c:	7478                	.insn	2, 0x7478
 33e:	7300                	.insn	2, 0x7300
 340:	5f61                	.insn	2, 0x5f61
 342:	6170                	.insn	2, 0x6170
 344:	6f006567          	.insn	4, 0x6f006567
 348:	6666                	.insn	2, 0x6666
 34a:	7300                	.insn	2, 0x7300
 34c:	0030                	.insn	2, 0x0030
 34e:	6e69                	.insn	2, 0x6e69
 350:	425f 6200 7361      	.insn	6, 0x73616200425f
 356:	5f65                	.insn	2, 0x5f65
 358:	6461                	.insn	2, 0x6461
 35a:	7264                	.insn	2, 0x7264
 35c:	6c5f 6261 6c65      	.insn	6, 0x6c6562616c5f
 362:	4400                	.insn	2, 0x4400
 364:	4645                	.insn	2, 0x4645
 366:	5541                	.insn	2, 0x5541
 368:	544c                	.insn	2, 0x544c
 36a:	425f 5341 0045      	.insn	6, 0x00455341425f
 370:	4552                	.insn	2, 0x4552
 372:	00425f47          	.insn	4, 0x00425f47
 376:	63637573          	csrrci	a0,0x636,6
 37a:	7365                	.insn	2, 0x7365
 37c:	35740073          	.insn	4, 0x35740073
 380:	7300                	.insn	2, 0x7300
 382:	6372                	.insn	2, 0x6372
 384:	7300                	.insn	2, 0x7300
 386:	5f61                	.insn	2, 0x5f61
 388:	74697277          	.insn	4, 0x74697277
 38c:	5f65                	.insn	2, 0x5f65
 38e:	0042                	.insn	2, 0x0042
 390:	725f6173          	csrrsi	sp,mhpmevent5h,30
 394:	6165                	.insn	2, 0x6165
 396:	0064                	.insn	2, 0x0064
 398:	6e75                	.insn	2, 0x6e75
 39a:	6e676973          	csrrsi	s2,0x6e6,14
 39e:	6465                	.insn	2, 0x6465
 3a0:	6320                	.insn	2, 0x6320
 3a2:	6168                	.insn	2, 0x6168
 3a4:	0072                	.insn	2, 0x0072
 3a6:	6572                	.insn	2, 0x6572
 3a8:	6f62                	.insn	2, 0x6f62
 3aa:	6100746f          	jal	s0,79ba <$d.4+0x524d>
 3ae:	0036                	.insn	2, 0x0036
 3b0:	6e69                	.insn	2, 0x6e69
 3b2:	415f 6900 746e      	.insn	6, 0x746e6900415f
 3b8:	6300                	.insn	2, 0x6300
 3ba:	6168                	.insn	2, 0x6168
 3bc:	0072                	.insn	2, 0x0072
 3be:	6970                	.insn	2, 0x6970
 3c0:	0064                	.insn	2, 0x0064
 3c2:	656d                	.insn	2, 0x656d
 3c4:	736d                	.insn	2, 0x736d
 3c6:	7465                	.insn	2, 0x7465
 3c8:	7400                	.insn	2, 0x7400
 3ca:	6261                	.insn	2, 0x6261
 3cc:	656c                	.insn	2, 0x656c
 3ce:	0031                	.insn	2, 0x0031
 3d0:	0078                	.insn	2, 0x0078
 3d2:	7261                	.insn	2, 0x7261
 3d4:	72007667          	.insn	4, 0x72007667
 3d8:	7465                	.insn	2, 0x7465
 3da:	7972                	.insn	2, 0x7972
 3dc:	6d5f 7861 7300      	.insn	6, 0x730078616d5f
 3e2:	0038                	.insn	2, 0x0038
 3e4:	61767473          	csrrci	s0,0x617,12
 3e8:	006c                	.insn	2, 0x006c
 3ea:	4548                	.insn	2, 0x4548
 3ec:	0058                	.insn	2, 0x0058
 3ee:	6962                	.insn	2, 0x6962
 3f0:	2f00                	.insn	2, 0x2f00
 3f2:	6f68                	.insn	2, 0x6f68
 3f4:	656d                	.insn	2, 0x656d
 3f6:	7261682f          	.insn	4, 0x7261682f
 3fa:	6875                	.insn	2, 0x6875
 3fc:	6b69                	.insn	2, 0x6b69
 3fe:	72502f6f          	jal	t5,3322 <$d.4+0xbb5>
 402:	6172676f          	jal	a4,27218 <_binary_shell_bin_size+0x4e88>
 406:	2f6d                	.insn	2, 0x2f6d
 408:	5350                	.insn	2, 0x5350
 40a:	56525f43          	.insn	4, 0x56525f43
 40e:	2f493233          	.insn	4, 0x2f493233
 412:	5350                	.insn	2, 0x5350
 414:	4e4f2d43          	.insn	4, 0x4e4f2d43
 418:	2f45                	.insn	2, 0x2f45
 41a:	74666f73          	csrrsi	t5,0x746,12
 41e:	65726177          	.insn	4, 0x65726177
 422:	00736f2f          	.insn	4, 0x00736f2f
 426:	73007073          	csrci	mhpmevent16h,0
 42a:	705f 6972 746e      	.insn	6, 0x746e6972705f
 430:	0066                	.insn	2, 0x0066
 432:	6168                	.insn	2, 0x6168
 434:	646e                	.insn	2, 0x646e
 436:	656c                	.insn	2, 0x656c
 438:	745f 6172 0070      	.insn	6, 0x00706172745f
 43e:	7270                	.insn	2, 0x7270
 440:	7665                	.insn	2, 0x7665
 442:	7400                	.insn	2, 0x7400
 444:	0036                	.insn	2, 0x0036
 446:	6f6c                	.insn	2, 0x6f6c
 448:	6461                	.insn	2, 0x6461
 44a:	425f 4d00 7461      	.insn	6, 0x74614d00425f
 450:	6972                	.insn	2, 0x6972
 452:	5f78                	.insn	2, 0x5f78
 454:	004e                	.insn	2, 0x004e
 456:	0066                	.insn	2, 0x0066
 458:	3074                	.insn	2, 0x3074
 45a:	7400                	.insn	2, 0x7400
 45c:	61760033          	.insn	4, 0x61760033
 460:	756c                	.insn	2, 0x756c
 462:	0065                	.insn	2, 0x0065
 464:	5f42                	.insn	2, 0x5f42
 466:	616d                	.insn	2, 0x616d
 468:	0074                	.insn	2, 0x0074
 46a:	6170                	.insn	2, 0x6170
 46c:	745f6567          	.insn	4, 0x745f6567
 470:	6261                	.insn	2, 0x6261
 472:	656c                	.insn	2, 0x656c
 474:	7300                	.insn	2, 0x7300
 476:	6174                	.insn	2, 0x6174
 478:	73006b63          	bltu	zero,a6,bae <$d.3+0x428>
 47c:	5f61                	.insn	2, 0x5f61
 47e:	7572                	.insn	2, 0x7572
 480:	006e                	.insn	2, 0x006e
 482:	6572                	.insn	2, 0x6572
 484:	616d                	.insn	2, 0x616d
 486:	6e69                	.insn	2, 0x6e69
 488:	6e69                	.insn	2, 0x6e69
 48a:	30610067          	jr	774(sp) # 1f9ca7 <_binary_shell_bin_size+0x1d7917>
 48e:	7000                	.insn	2, 0x7000
 490:	6972                	.insn	2, 0x6972
 492:	746e                	.insn	2, 0x746e
 494:	685f 7865 3233      	.insn	6, 0x32337865685f
 49a:	7300                	.insn	2, 0x7300
 49c:	5f61                	.insn	2, 0x5f61
 49e:	74697277          	.insn	4, 0x74697277
 4a2:	5f65                	.insn	2, 0x5f65
 4a4:	616d                	.insn	2, 0x616d
 4a6:	7274                	.insn	2, 0x7274
 4a8:	7869                	.insn	2, 0x7869
 4aa:	0032                	.insn	2, 0x0032
 4ac:	0042                	.insn	2, 0x0042
 4ae:	6176                	.insn	2, 0x6176
 4b0:	006c                	.insn	2, 0x006c
 4b2:	616d                	.insn	2, 0x616d
 4b4:	7274                	.insn	2, 0x7274
 4b6:	7869                	.insn	2, 0x7869
 4b8:	4e5f 6d00 7061      	.insn	6, 0x70616d004e5f
 4be:	705f 6761 0065      	.insn	6, 0x00656761705f
 4c4:	6d69                	.insn	2, 0x6d69
 4c6:	6761                	.insn	2, 0x6761
 4c8:	0065                	.insn	2, 0x0065
 4ca:	46494453          	.insn	4, 0x46494453
 4ce:	705f 6761 0065      	.insn	6, 0x00656761705f
 4d4:	72617473          	csrrci	s0,mhpmevent6h,2
 4d8:	5f74                	.insn	2, 0x5f74
 4da:	6461                	.insn	2, 0x6461
 4dc:	7264                	.insn	2, 0x7264
 4de:	6d00                	.insn	2, 0x6d00
 4e0:	7361                	.insn	2, 0x7361
 4e2:	4544006b          	.insn	4, 0x4544006b
 4e6:	4146                	.insn	2, 0x4146
 4e8:	4c55                	.insn	2, 0x4c55
 4ea:	5f54                	.insn	2, 0x5f54
 4ec:	454c                	.insn	2, 0x454c
 4ee:	004e                	.insn	2, 0x004e
 4f0:	6e75                	.insn	2, 0x6e75
 4f2:	6e676973          	csrrsi	s2,0x6e6,14
 4f6:	6465                	.insn	2, 0x6465
 4f8:	6920                	.insn	2, 0x6920
 4fa:	746e                	.insn	2, 0x746e
 4fc:	7500                	.insn	2, 0x7500
 4fe:	6e69                	.insn	2, 0x6e69
 500:	3674                	.insn	2, 0x3674
 502:	5f34                	.insn	2, 0x5f34
 504:	0074                	.insn	2, 0x0074
 506:	6170                	.insn	2, 0x6170
 508:	6464                	.insn	2, 0x6464
 50a:	0072                	.insn	2, 0x0072
 50c:	7470                	.insn	2, 0x7470
 50e:	705f 6461 7264      	.insn	6, 0x72646461705f
 514:	6800                	.insn	2, 0x6800
 516:	6e61                	.insn	2, 0x6e61
 518:	6c64                	.insn	2, 0x6c64
 51a:	5f65                	.insn	2, 0x5f65
 51c:	63737973          	csrrci	s2,0x637,6
 520:	6c61                	.insn	2, 0x6c61
 522:	006c                	.insn	2, 0x006c
 524:	3461                	.insn	2, 0x3461
 526:	7300                	.insn	2, 0x7300
 528:	0032                	.insn	2, 0x0032
 52a:	6572                	.insn	2, 0x6572
 52c:	006d                	.insn	2, 0x006d
 52e:	0072                	.insn	2, 0x0072
 530:	696c                	.insn	2, 0x696c
 532:	656e                	.insn	2, 0x656e
 534:	6100                	.insn	2, 0x6100
 536:	6772                	.insn	2, 0x6772
 538:	6b620063          	beq	tp,s6,bd8 <$d.3+0x452>
 53c:	7600                	.insn	2, 0x7600
 53e:	0030                	.insn	2, 0x0030
 540:	6974                	.insn	2, 0x6974
 542:	656d                	.insn	2, 0x656d
 544:	0074756f          	jal	a0,47d4a <_binary_shell_bin_size+0x259ba>
 548:	61657263          	bgeu	a0,s6,b4c <$d.3+0x3c6>
 54c:	6574                	.insn	2, 0x6574
 54e:	705f 6f72 6563      	.insn	6, 0x65636f72705f
 554:	73007373          	csrrci	t1,mhpmevent16h,0
 558:	5f61                	.insn	2, 0x5f61
 55a:	6164                	.insn	2, 0x6164
 55c:	6174                	.insn	2, 0x6174
 55e:	775f 5f62 6170      	.insn	6, 0x61705f62775f
 564:	6e006567          	.insn	4, 0x6e006567
 568:	7865                	.insn	2, 0x7865
 56a:	0074                	.insn	2, 0x0074
 56c:	6572                	.insn	2, 0x6572
 56e:	7274                	.insn	2, 0x7274
 570:	0079                	.insn	2, 0x0079
 572:	5f5f 5241 4152      	.insn	6, 0x415252415f5f
 578:	5f59                	.insn	2, 0x5f59
 57a:	455a4953          	.insn	4, 0x455a4953
 57e:	545f 5059 5f45      	.insn	6, 0x5f455059545f
 584:	005f 6176 6464      	.insn	6, 0x64646176005f
 58a:	5f72                	.insn	2, 0x5f72
 58c:	0074                	.insn	2, 0x0074
 58e:	6d69                	.insn	2, 0x6d69
 590:	6761                	.insn	2, 0x6761
 592:	5f65                	.insn	2, 0x5f65
 594:	657a6973          	csrrsi	s2,hviprio2h,20
 598:	7400                	.insn	2, 0x7400
 59a:	0031                	.insn	2, 0x0031
 59c:	3161                	.insn	2, 0x3161
 59e:	6400                	.insn	2, 0x6400
 5a0:	7669                	.insn	2, 0x7669
 5a2:	6f6d                	.insn	2, 0x6f6d
 5a4:	3164                	.insn	2, 0x3164
 5a6:	0030                	.insn	2, 0x0030
 5a8:	6170                	.insn	2, 0x6170
 5aa:	7372                	.insn	2, 0x7372
 5ac:	5f65                	.insn	2, 0x5f65
 5ae:	6568                	.insn	2, 0x6568
 5b0:	0078                	.insn	2, 0x0078
 5b2:	6c727463          	bgeu	tp,t2,c7a <$d.3+0x4f4>
 5b6:	7500                	.insn	2, 0x7500
 5b8:	6e69                	.insn	2, 0x6e69
 5ba:	3874                	.insn	2, 0x3874
 5bc:	745f 6200 6b6c      	.insn	6, 0x6b6c6200745f
 5c2:	635f 7061 6361      	.insn	6, 0x63617061635f
 5c8:	7469                	.insn	2, 0x7469
 5ca:	0079                	.insn	2, 0x0079
 5cc:	6176                	.insn	2, 0x6176
 5ce:	6464                	.insn	2, 0x6464
 5d0:	0072                	.insn	2, 0x0072
 5d2:	6c66                	.insn	2, 0x6c66
 5d4:	6761                	.insn	2, 0x6761
 5d6:	69790073          	.insn	4, 0x69790073
 5da:	6c65                	.insn	2, 0x6c65
 5dc:	0064                	.insn	2, 0x0064
 5de:	3474                	.insn	2, 0x3474
 5e0:	7300                	.insn	2, 0x7300
 5e2:	73756163          	bltu	a0,s7,d04 <$d.3+0x57e>
 5e6:	0065                	.insn	2, 0x0065
 5e8:	0071                	.insn	2, 0x0071
 5ea:	0064                	.insn	2, 0x0064
 5ec:	5f5f 7562 6c69      	.insn	6, 0x6c6975625f5f
 5f2:	6974                	.insn	2, 0x6974
 5f4:	5f6e                	.insn	2, 0x5f6e
 5f6:	6176                	.insn	2, 0x6176
 5f8:	6c5f 7369 0074      	.insn	6, 0x007473696c5f
 5fe:	5f41                	.insn	2, 0x5f41
 600:	73006173          	csrrsi	sp,mhpmevent16h,0
 604:	6e650037          	lui	zero,0x6e650
 608:	0064                	.insn	2, 0x0064
 60a:	616d                	.insn	2, 0x616d
 60c:	0074                	.insn	2, 0x0074
 60e:	6170                	.insn	2, 0x6170
 610:	64656b63          	bltu	a0,t1,c66 <$d.3+0x4e0>
 614:	6800                	.insn	2, 0x6800
 616:	7865                	.insn	2, 0x7865
 618:	7564                	.insn	2, 0x7564
 61a:	706d                	.insn	2, 0x706d
 61c:	6f00                	.insn	2, 0x6f00
 61e:	6666                	.insn	2, 0x6666
 620:	00746573          	csrrsi	a0,0x7,8
 624:	004e                	.insn	2, 0x004e
 626:	4552                	.insn	2, 0x4552
 628:	00415f47          	.insn	4, 0x00415f47
 62c:	7270                	.insn	2, 0x7270
 62e:	0073636f          	jal	t1,36e34 <_binary_shell_bin_size+0x14aa4>
 632:	61635f73          	csrrwi	t5,0x616,6
 636:	6c6c                	.insn	2, 0x6c6c
 638:	735f 6364 7261      	.insn	6, 0x72616364735f
 63e:	5f64                	.insn	2, 0x5f64
 640:	6572                	.insn	2, 0x6572
 642:	6461                	.insn	2, 0x6461
 644:	615f 6970 6c00      	.insn	6, 0x6c006970615f
 64a:	7366                	.insn	2, 0x7366
 64c:	5f72                	.insn	2, 0x5f72
 64e:	656e                	.insn	2, 0x656e
 650:	7478                	.insn	2, 0x7478
 652:	6900                	.insn	2, 0x6900
 654:	6c64                	.insn	2, 0x6c64
 656:	5f65                	.insn	2, 0x5f65
 658:	6e65                	.insn	2, 0x6e65
 65a:	7274                	.insn	2, 0x7274
 65c:	0079                	.insn	2, 0x0079
 65e:	65716573          	csrrsi	a0,hviprio2h,2
 662:	746e                	.insn	2, 0x746e
 664:	6169                	.insn	2, 0x6169
 666:	5f6c                	.insn	2, 0x5f6c
 668:	656d                	.insn	2, 0x656d
 66a:	5f6d                	.insn	2, 0x5f6d
 66c:	63656863          	bltu	a0,s6,c9c <$d.3+0x516>
 670:	3673006b          	.insn	4, 0x3673006b
 674:	7500                	.insn	2, 0x7500
 676:	736e                	.insn	2, 0x736e
 678:	6769                	.insn	2, 0x6769
 67a:	656e                	.insn	2, 0x656e
 67c:	2064                	.insn	2, 0x2064
 67e:	6f6c                	.insn	2, 0x6f6c
 680:	676e                	.insn	2, 0x676e
 682:	6600                	.insn	2, 0x6600
 684:	746d                	.insn	2, 0x746d
 686:	7300                	.insn	2, 0x7300
 688:	635f 6c61 5f6c      	.insn	6, 0x5f6c6c61635f
 68e:	615f6173          	csrrsi	sp,htimedeltah,30
 692:	6970                	.insn	2, 0x6970
 694:	6d00                	.insn	2, 0x6d00
 696:	0069                	.insn	2, 0x0069
 698:	6976                	.insn	2, 0x6976
 69a:	7472                	.insn	2, 0x7472
 69c:	6f69                	.insn	2, 0x6f69
 69e:	625f 6b6c 725f      	.insn	6, 0x725f6b6c625f
 6a4:	7165                	.insn	2, 0x7165
 6a6:	6b00                	.insn	2, 0x6b00
 6a8:	7265                	.insn	2, 0x7265
 6aa:	656e                	.insn	2, 0x656e
 6ac:	5f6c                	.insn	2, 0x5f6c
 6ae:	6e65                	.insn	2, 0x6e65
 6b0:	7274                	.insn	2, 0x7274
 6b2:	0079                	.insn	2, 0x0079
 6b4:	775f6173          	csrrsi	sp,0x775,30
 6b8:	6972                	.insn	2, 0x6972
 6ba:	6574                	.insn	2, 0x6574
 6bc:	415f 7400 6261      	.insn	6, 0x62617400415f
 6c2:	656c                	.insn	2, 0x656c
 6c4:	0030                	.insn	2, 0x0030
 6c6:	72705f73          	csrrwi	t5,mhpmevent7h,0
 6ca:	6e69                	.insn	2, 0x6e69
 6cc:	5f74                	.insn	2, 0x5f74
 6ce:	6e69                	.insn	2, 0x6e69
 6d0:	0074                	.insn	2, 0x0074
 6d2:	6172                	.insn	2, 0x6172
 6d4:	7300                	.insn	2, 0x7300
 6d6:	0039                	.insn	2, 0x0039
 6d8:	0075                	.insn	2, 0x0075
 6da:	696e                	.insn	2, 0x696e
 6dc:	0062                	.insn	2, 0x0062
 6de:	616d5f43          	.insn	4, 0x616d5f43
 6e2:	0074                	.insn	2, 0x0074
 6e4:	006a                	.insn	2, 0x006a
 6e6:	6a62                	.insn	2, 0x6a62
 6e8:	4200                	.insn	2, 0x4200
 6ea:	735f 0061 6863      	.insn	6, 0x68630061735f
 6f0:	7000                	.insn	2, 0x7000
 6f2:	7475                	.insn	2, 0x7475
 6f4:	72616863          	bltu	sp,t1,e24 <$d.3+0x69e>
 6f8:	7400                	.insn	2, 0x7400
 6fa:	0070                	.insn	2, 0x0070
 6fc:	63706573          	csrrsi	a0,0x637,0
 700:	5f00                	.insn	2, 0x5f00
 702:	745f 706d 7600      	.insn	6, 0x7600706d745f
 708:	7261                	.insn	2, 0x7261
 70a:	007367 	.3byte	0x007367

セクション .comment の逆アセンブル:

00000000 <$d.1>:
   0:	5500                	.insn	2, 0x5500
   2:	7562                	.insn	2, 0x7562
   4:	746e                	.insn	2, 0x746e
   6:	2075                	.insn	2, 0x2075
   8:	6e616c63          	bltu	sp,t1,700 <$d.5+0x154>
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
  1e:	32727363          	bgeu	tp,t2,344 <$d.9+0x38>
  22:	3070                	.insn	2, 0x3070
	...

セクション .debug_frame の逆アセンブル:

00000000 <$d.13>:
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
  14:	000c                	.insn	2, 0x000c
  16:	0000                	.insn	2, 0x0000
  18:	0000                	.insn	2, 0x0000
  1a:	0000                	.insn	2, 0x0000
  1c:	0010                	.insn	2, 0x0010
  1e:	0020                	.insn	2, 0x0020
  20:	0020                	.insn	2, 0x0020
  22:	0000                	.insn	2, 0x0000
  24:	000c                	.insn	2, 0x000c
  26:	0000                	.insn	2, 0x0000
  28:	0000                	.insn	2, 0x0000
  2a:	0000                	.insn	2, 0x0000
  2c:	0030                	.insn	2, 0x0030
  2e:	0020                	.insn	2, 0x0020
  30:	0020                	.insn	2, 0x0020
  32:	0000                	.insn	2, 0x0000
  34:	000c                	.insn	2, 0x000c
  36:	0000                	.insn	2, 0x0000
  38:	0000                	.insn	2, 0x0000
  3a:	0000                	.insn	2, 0x0000
  3c:	0050                	.insn	2, 0x0050
  3e:	0020                	.insn	2, 0x0020
  40:	0024                	.insn	2, 0x0024
  42:	0000                	.insn	2, 0x0000
  44:	0014                	.insn	2, 0x0014
  46:	0000                	.insn	2, 0x0000
  48:	0000                	.insn	2, 0x0000
  4a:	0000                	.insn	2, 0x0000
  4c:	0074                	.insn	2, 0x0074
  4e:	0020                	.insn	2, 0x0020
  50:	0094                	.insn	2, 0x0094
  52:	0000                	.insn	2, 0x0000
  54:	0e44                	.insn	2, 0x0e44
  56:	4810                	.insn	2, 0x4810
  58:	0181                	.insn	2, 0x0181
  5a:	0288                	.insn	2, 0x0288
  5c:	000c                	.insn	2, 0x000c
  5e:	0000                	.insn	2, 0x0000
  60:	0000                	.insn	2, 0x0000
  62:	0000                	.insn	2, 0x0000
  64:	0108                	.insn	2, 0x0108
  66:	0020                	.insn	2, 0x0020
  68:	001c                	.insn	2, 0x001c
  6a:	0000                	.insn	2, 0x0000
  6c:	000c                	.insn	2, 0x000c
  6e:	0000                	.insn	2, 0x0000
  70:	0000                	.insn	2, 0x0000
  72:	0000                	.insn	2, 0x0000
  74:	0124                	.insn	2, 0x0124
  76:	0020                	.insn	2, 0x0020
  78:	0118                	.insn	2, 0x0118
  7a:	0000                	.insn	2, 0x0000
  7c:	000c                	.insn	2, 0x000c
  7e:	0000                	.insn	2, 0x0000
  80:	0000                	.insn	2, 0x0000
  82:	0000                	.insn	2, 0x0000
  84:	023c                	.insn	2, 0x023c
  86:	0020                	.insn	2, 0x0020
  88:	007c                	.insn	2, 0x007c
  8a:	0000                	.insn	2, 0x0000
  8c:	001c                	.insn	2, 0x001c
  8e:	0000                	.insn	2, 0x0000
  90:	0000                	.insn	2, 0x0000
  92:	0000                	.insn	2, 0x0000
  94:	02b8                	.insn	2, 0x02b8
  96:	0020                	.insn	2, 0x0020
  98:	017c                	.insn	2, 0x017c
  9a:	0000                	.insn	2, 0x0000
  9c:	0e44                	.insn	2, 0x0e44
  9e:	5820                	.insn	2, 0x5820
  a0:	0181                	.insn	2, 0x0181
  a2:	0288                	.insn	2, 0x0288
  a4:	0389                	.insn	2, 0x0389
  a6:	0492                	.insn	2, 0x0492
  a8:	06940593          	addi	a1,s0,105
  ac:	000c                	.insn	2, 0x000c
  ae:	0000                	.insn	2, 0x0000
  b0:	0000                	.insn	2, 0x0000
  b2:	0000                	.insn	2, 0x0000
  b4:	0434                	.insn	2, 0x0434
  b6:	0020                	.insn	2, 0x0020
  b8:	0008                	.insn	2, 0x0008
  ba:	0000                	.insn	2, 0x0000
  bc:	002c                	.insn	2, 0x002c
  be:	0000                	.insn	2, 0x0000
  c0:	0000                	.insn	2, 0x0000
  c2:	0000                	.insn	2, 0x0000
  c4:	043c                	.insn	2, 0x043c
  c6:	0020                	.insn	2, 0x0020
  c8:	081c                	.insn	2, 0x081c
  ca:	0000                	.insn	2, 0x0000
  cc:	0e44                	.insn	2, 0x0e44
  ce:	7440                	.insn	2, 0x7440
  d0:	0181                	.insn	2, 0x0181
  d2:	0288                	.insn	2, 0x0288
  d4:	0389                	.insn	2, 0x0389
  d6:	0492                	.insn	2, 0x0492
  d8:	06940593          	addi	a1,s0,105
  dc:	0795                	.insn	2, 0x0795
  de:	0896                	.insn	2, 0x0896
  e0:	0a980997          	auipc	s3,0xa980
  e4:	0b99                	.insn	2, 0x0b99
  e6:	0c9a                	.insn	2, 0x0c9a
  e8:	00000d9b          	.insn	4, 0x0d9b
  ec:	0014                	.insn	2, 0x0014
  ee:	0000                	.insn	2, 0x0000
  f0:	0000                	.insn	2, 0x0000
  f2:	0000                	.insn	2, 0x0000
  f4:	0c58                	.insn	2, 0x0c58
  f6:	0020                	.insn	2, 0x0020
  f8:	0288                	.insn	2, 0x0288
  fa:	0000                	.insn	2, 0x0000
  fc:	0e024003          	lbu	zero,224(tp) # e0 <$d.13+0xe0>
 100:	4410                	.insn	2, 0x4410
 102:	0181                	.insn	2, 0x0181
 104:	000c                	.insn	2, 0x000c
 106:	0000                	.insn	2, 0x0000
 108:	0000                	.insn	2, 0x0000
 10a:	0000                	.insn	2, 0x0000
 10c:	0ee0                	.insn	2, 0x0ee0
 10e:	0020                	.insn	2, 0x0020
 110:	000c                	.insn	2, 0x000c
 112:	0000                	.insn	2, 0x0000
 114:	0014                	.insn	2, 0x0014
 116:	0000                	.insn	2, 0x0000
 118:	0000                	.insn	2, 0x0000
 11a:	0000                	.insn	2, 0x0000
 11c:	0eec                	.insn	2, 0x0eec
 11e:	0020                	.insn	2, 0x0020
 120:	0274                	.insn	2, 0x0274
 122:	0000                	.insn	2, 0x0000
 124:	0e44                	.insn	2, 0x0e44
 126:	4410                	.insn	2, 0x4410
 128:	0181                	.insn	2, 0x0181
 12a:	0000                	.insn	2, 0x0000
 12c:	0014                	.insn	2, 0x0014
 12e:	0000                	.insn	2, 0x0000
 130:	0000                	.insn	2, 0x0000
 132:	0000                	.insn	2, 0x0000
 134:	1160                	.insn	2, 0x1160
 136:	0020                	.insn	2, 0x0020
 138:	0090                	.insn	2, 0x0090
 13a:	0000                	.insn	2, 0x0000
 13c:	0e44                	.insn	2, 0x0e44
 13e:	4810                	.insn	2, 0x4810
 140:	0181                	.insn	2, 0x0181
 142:	0288                	.insn	2, 0x0288
 144:	000c                	.insn	2, 0x000c
	...
 14e:	0020                	.insn	2, 0x0020
 150:	0010                	.insn	2, 0x0010
 152:	0000                	.insn	2, 0x0000
 154:	0024                	.insn	2, 0x0024
 156:	0000                	.insn	2, 0x0000
 158:	0000                	.insn	2, 0x0000
 15a:	0000                	.insn	2, 0x0000
 15c:	11f0                	.insn	2, 0x11f0
 15e:	0020                	.insn	2, 0x0020
 160:	019c                	.insn	2, 0x019c
 162:	0000                	.insn	2, 0x0000
 164:	0e44                	.insn	2, 0x0e44
 166:	6830                	.insn	2, 0x6830
 168:	0181                	.insn	2, 0x0181
 16a:	0288                	.insn	2, 0x0288
 16c:	0389                	.insn	2, 0x0389
 16e:	0492                	.insn	2, 0x0492
 170:	06940593          	addi	a1,s0,105
 174:	0795                	.insn	2, 0x0795
 176:	0896                	.insn	2, 0x0896
 178:	0a980997          	auipc	s3,0xa980
 17c:	0024                	.insn	2, 0x0024
 17e:	0000                	.insn	2, 0x0000
 180:	0000                	.insn	2, 0x0000
 182:	0000                	.insn	2, 0x0000
 184:	138c                	.insn	2, 0x138c
 186:	0020                	.insn	2, 0x0020
 188:	0180                	.insn	2, 0x0180
 18a:	0000                	.insn	2, 0x0000
 18c:	0e44                	.insn	2, 0x0e44
 18e:	6430                	.insn	2, 0x6430
 190:	0181                	.insn	2, 0x0181
 192:	0288                	.insn	2, 0x0288
 194:	0389                	.insn	2, 0x0389
 196:	0492                	.insn	2, 0x0492
 198:	06940593          	addi	a1,s0,105
 19c:	0795                	.insn	2, 0x0795
 19e:	0896                	.insn	2, 0x0896
 1a0:	00000997          	auipc	s3,0x0
 1a4:	0014                	.insn	2, 0x0014
 1a6:	0000                	.insn	2, 0x0000
 1a8:	0000                	.insn	2, 0x0000
 1aa:	0000                	.insn	2, 0x0000
 1ac:	150c                	.insn	2, 0x150c
 1ae:	0020                	.insn	2, 0x0020
 1b0:	0160                	.insn	2, 0x0160
 1b2:	0000                	.insn	2, 0x0000
 1b4:	0e44                	.insn	2, 0x0e44
 1b6:	4410                	.insn	2, 0x4410
 1b8:	0181                	.insn	2, 0x0181
	...

000001bc <$d.9>:
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
 1d0:	000c                	.insn	2, 0x000c
 1d2:	0000                	.insn	2, 0x0000
 1d4:	01bc                	.insn	2, 0x01bc
 1d6:	0000                	.insn	2, 0x0000
 1d8:	166c                	.insn	2, 0x166c
 1da:	0020                	.insn	2, 0x0020
 1dc:	0028                	.insn	2, 0x0028
 1de:	0000                	.insn	2, 0x0000
 1e0:	000c                	.insn	2, 0x000c
 1e2:	0000                	.insn	2, 0x0000
 1e4:	01bc                	.insn	2, 0x01bc
 1e6:	0000                	.insn	2, 0x0000
 1e8:	1694                	.insn	2, 0x1694
 1ea:	0020                	.insn	2, 0x0020
 1ec:	0020                	.insn	2, 0x0020
 1ee:	0000                	.insn	2, 0x0000
 1f0:	0018                	.insn	2, 0x0018
 1f2:	0000                	.insn	2, 0x0000
 1f4:	01bc                	.insn	2, 0x01bc
 1f6:	0000                	.insn	2, 0x0000
 1f8:	16b4                	.insn	2, 0x16b4
 1fa:	0020                	.insn	2, 0x0020
 1fc:	00fc                	.insn	2, 0x00fc
 1fe:	0000                	.insn	2, 0x0000
 200:	0e44                	.insn	2, 0x0e44
 202:	5020                	.insn	2, 0x5020
 204:	0181                	.insn	2, 0x0181
 206:	0288                	.insn	2, 0x0288
 208:	0389                	.insn	2, 0x0389
 20a:	0492                	.insn	2, 0x0492
 20c:	002c                	.insn	2, 0x002c
 20e:	0000                	.insn	2, 0x0000
 210:	01bc                	.insn	2, 0x01bc
 212:	0000                	.insn	2, 0x0000
 214:	17b0                	.insn	2, 0x17b0
 216:	0020                	.insn	2, 0x0020
 218:	02d8                	.insn	2, 0x02d8
 21a:	0000                	.insn	2, 0x0000
 21c:	0e44                	.insn	2, 0x0e44
 21e:	7470                	.insn	2, 0x7470
 220:	0981                	.insn	2, 0x0981
 222:	0a88                	.insn	2, 0x0a88
 224:	0b89                	.insn	2, 0x0b89
 226:	0c92                	.insn	2, 0x0c92
 228:	0e940d93          	addi	s11,s0,233
 22c:	0f95                	.insn	2, 0x0f95
 22e:	1096                	.insn	2, 0x1096
 230:	12981197          	auipc	gp,0x12981
 234:	1399                	.insn	2, 0x1399
 236:	149a                	.insn	2, 0x149a
 238:	0000159b          	.insn	4, 0x159b
 23c:	000c                	.insn	2, 0x000c
 23e:	0000                	.insn	2, 0x0000
 240:	01bc                	.insn	2, 0x01bc
 242:	0000                	.insn	2, 0x0000
 244:	1a88                	.insn	2, 0x1a88
 246:	0020                	.insn	2, 0x0020
 248:	00cc                	.insn	2, 0x00cc
 24a:	0000                	.insn	2, 0x0000
 24c:	002c                	.insn	2, 0x002c
 24e:	0000                	.insn	2, 0x0000
 250:	01bc                	.insn	2, 0x01bc
 252:	0000                	.insn	2, 0x0000
 254:	1b54                	.insn	2, 0x1b54
 256:	0020                	.insn	2, 0x0020
 258:	0280                	.insn	2, 0x0280
 25a:	0000                	.insn	2, 0x0000
 25c:	0e44                	.insn	2, 0x0e44
 25e:	7440                	.insn	2, 0x7440
 260:	0181                	.insn	2, 0x0181
 262:	0288                	.insn	2, 0x0288
 264:	0389                	.insn	2, 0x0389
 266:	0492                	.insn	2, 0x0492
 268:	06940593          	addi	a1,s0,105
 26c:	0795                	.insn	2, 0x0795
 26e:	0896                	.insn	2, 0x0896
 270:	0a980997          	auipc	s3,0xa980
 274:	0b99                	.insn	2, 0x0b99
 276:	0c9a                	.insn	2, 0x0c9a
 278:	00000d9b          	.insn	4, 0x0d9b
 27c:	0014                	.insn	2, 0x0014
 27e:	0000                	.insn	2, 0x0000
 280:	01bc                	.insn	2, 0x01bc
 282:	0000                	.insn	2, 0x0000
 284:	1dd4                	.insn	2, 0x1dd4
 286:	0020                	.insn	2, 0x0020
 288:	0250                	.insn	2, 0x0250
 28a:	0000                	.insn	2, 0x0000
 28c:	0e44                	.insn	2, 0x0e44
 28e:	4810                	.insn	2, 0x4810
 290:	0181                	.insn	2, 0x0181
 292:	0288                	.insn	2, 0x0288

00000294 <$d.11>:
 294:	0010                	.insn	2, 0x0010
 296:	0000                	.insn	2, 0x0000
 298:	ffff                	.insn	2, 0xffff
 29a:	ffff                	.insn	2, 0xffff
 29c:	0004                	.insn	2, 0x0004
 29e:	0004                	.insn	2, 0x0004
 2a0:	7c01                	.insn	2, 0x7c01
 2a2:	0c01                	.insn	2, 0x0c01
 2a4:	0002                	.insn	2, 0x0002
 2a6:	0000                	.insn	2, 0x0000
 2a8:	002c                	.insn	2, 0x002c
 2aa:	0000                	.insn	2, 0x0000
 2ac:	0294                	.insn	2, 0x0294
 2ae:	0000                	.insn	2, 0x0000
 2b0:	2024                	.insn	2, 0x2024
 2b2:	0020                	.insn	2, 0x0020
 2b4:	02d0                	.insn	2, 0x02d0
 2b6:	0000                	.insn	2, 0x0000
 2b8:	0e44                	.insn	2, 0x0e44
 2ba:	7470                	.insn	2, 0x7470
 2bc:	0181                	.insn	2, 0x0181
 2be:	0288                	.insn	2, 0x0288
 2c0:	0389                	.insn	2, 0x0389
 2c2:	0492                	.insn	2, 0x0492
 2c4:	06940593          	addi	a1,s0,105
 2c8:	0795                	.insn	2, 0x0795
 2ca:	0896                	.insn	2, 0x0896
 2cc:	0a980997          	auipc	s3,0xa980
 2d0:	0b99                	.insn	2, 0x0b99
 2d2:	0c9a                	.insn	2, 0x0c9a
 2d4:	00000d9b          	.insn	4, 0x0d9b
 2d8:	000c                	.insn	2, 0x000c
 2da:	0000                	.insn	2, 0x0000
 2dc:	0294                	.insn	2, 0x0294
 2de:	0000                	.insn	2, 0x0000
 2e0:	22f4                	.insn	2, 0x22f4
 2e2:	0020                	.insn	2, 0x0020
 2e4:	0034                	.insn	2, 0x0034
 2e6:	0000                	.insn	2, 0x0000
 2e8:	0020                	.insn	2, 0x0020
 2ea:	0000                	.insn	2, 0x0000
 2ec:	0294                	.insn	2, 0x0294
 2ee:	0000                	.insn	2, 0x0000
 2f0:	2328                	.insn	2, 0x2328
 2f2:	0020                	.insn	2, 0x0020
 2f4:	0330                	.insn	2, 0x0330
 2f6:	0000                	.insn	2, 0x0000
 2f8:	0e44                	.insn	2, 0x0e44
 2fa:	6020                	.insn	2, 0x6020
 2fc:	0181                	.insn	2, 0x0181
 2fe:	0288                	.insn	2, 0x0288
 300:	0389                	.insn	2, 0x0389
 302:	0492                	.insn	2, 0x0492
 304:	06940593          	addi	a1,s0,105
 308:	0795                	.insn	2, 0x0795
 30a:	0896                	.insn	2, 0x0896

0000030c <$d.9>:
 30c:	0010                	.insn	2, 0x0010
 30e:	0000                	.insn	2, 0x0000
 310:	ffff                	.insn	2, 0xffff
 312:	ffff                	.insn	2, 0xffff
 314:	0004                	.insn	2, 0x0004
 316:	0004                	.insn	2, 0x0004
 318:	7c01                	.insn	2, 0x7c01
 31a:	0c01                	.insn	2, 0x0c01
 31c:	0002                	.insn	2, 0x0002
 31e:	0000                	.insn	2, 0x0000
 320:	002c                	.insn	2, 0x002c
 322:	0000                	.insn	2, 0x0000
 324:	030c                	.insn	2, 0x030c
 326:	0000                	.insn	2, 0x0000
 328:	2658                	.insn	2, 0x2658
 32a:	0020                	.insn	2, 0x0020
 32c:	0404                	.insn	2, 0x0404
 32e:	0000                	.insn	2, 0x0000
 330:	0e44                	.insn	2, 0x0e44
 332:	04c0                	.insn	2, 0x04c0
 334:	8174                	.insn	2, 0x8174
 336:	8801                	.insn	2, 0x8801
 338:	8902                	.insn	2, 0x8902
 33a:	93049203          	lh	tp,-1744(s1)
 33e:	9405                	.insn	2, 0x9405
 340:	9506                	.insn	2, 0x9506
 342:	97089607          	.insn	4, 0x97089607
 346:	9809                	.insn	2, 0x9809
 348:	990a                	.insn	2, 0x990a
 34a:	9b0c9a0b          	.insn	4, 0x9b0c9a0b
 34e:	000d                	.insn	2, 0x000d

セクション .debug_line の逆アセンブル:

00000000 <$d.14>:
       0:	00001197          	auipc	gp,0x1
       4:	0004                	.insn	2, 0x0004
       6:	0000008f          	.insn	4, 0x008f
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
      22:	7273752f          	.insn	4, 0x7273752f
      26:	62696c2f          	.insn	4, 0x62696c2f
      2a:	766c6c2f          	.insn	4, 0x766c6c2f
      2e:	2d6d                	.insn	2, 0x2d6d
      30:	3831                	.insn	2, 0x3831
      32:	62696c2f          	.insn	4, 0x62696c2f
      36:	616c632f          	.insn	4, 0x616c632f
      3a:	676e                	.insn	2, 0x676e
      3c:	2f38312f          	.insn	4, 0x2f38312f
      40:	6e69                	.insn	2, 0x6e69
      42:	64756c63          	bltu	a0,t2,69a <$d.5+0xee>
      46:	0065                	.insn	2, 0x0065
      48:	6b00                	.insn	2, 0x6b00
      4a:	7265                	.insn	2, 0x7265
      4c:	656e                	.insn	2, 0x656e
      4e:	2e6c                	.insn	2, 0x2e6c
      50:	00010063          	beqz	sp,50 <$d.14+0x50>
      54:	7300                	.insn	2, 0x7300
      56:	6364                	.insn	2, 0x6364
      58:	7261                	.insn	2, 0x7261
      5a:	5f64                	.insn	2, 0x5f64
      5c:	7061                	.insn	2, 0x7061
      5e:	2e69                	.insn	2, 0x2e69
      60:	0068                	.insn	2, 0x0068
      62:	0001                	.insn	2, 0x0001
      64:	6b00                	.insn	2, 0x6b00
      66:	7265                	.insn	2, 0x7265
      68:	656e                	.insn	2, 0x656e
      6a:	2e6c                	.insn	2, 0x2e6c
      6c:	0068                	.insn	2, 0x0068
      6e:	0001                	.insn	2, 0x0001
      70:	7300                	.insn	2, 0x7300
      72:	6474                	.insn	2, 0x6474
      74:	6e69                	.insn	2, 0x6e69
      76:	2e74                	.insn	2, 0x2e74
      78:	0068                	.insn	2, 0x0068
      7a:	0002                	.insn	2, 0x0002
      7c:	6300                	.insn	2, 0x6300
      7e:	6f6d6d6f          	jal	s10,d6774 <_binary_shell_bin_size+0xb43e4>
      82:	2e6e                	.insn	2, 0x2e6e
      84:	0068                	.insn	2, 0x0068
      86:	0001                	.insn	2, 0x0001
      88:	7300                	.insn	2, 0x7300
      8a:	6e79                	.insn	2, 0x6e79
      8c:	7061                	.insn	2, 0x7061
      8e:	615f 6970 682e      	.insn	6, 0x682e6970615f
      94:	0100                	.insn	2, 0x0100
      96:	0000                	.insn	2, 0x0000
      98:	0000                	.insn	2, 0x0000
      9a:	0205                	.insn	2, 0x0205
      9c:	0010                	.insn	2, 0x0010
      9e:	0020                	.insn	2, 0x0020
      a0:	0100cf03          	lbu	t5,16(ra)
      a4:	0504                	.insn	2, 0x0504
      a6:	0c05                	.insn	2, 0x0c05
      a8:	030a                	.insn	2, 0x030a
      aa:	0951                	.insn	2, 0x0951
      ac:	0004                	.insn	2, 0x0004
      ae:	0401                	.insn	2, 0x0401
      b0:	0501                	.insn	2, 0x0501
      b2:	0300                	.insn	2, 0x0300
      b4:	0931                	.insn	2, 0x0931
      b6:	0004                	.insn	2, 0x0004
      b8:	0501                	.insn	2, 0x0501
      ba:	0605                	.insn	2, 0x0605
      bc:	04090003          	lb	zero,64(s2)
      c0:	0100                	.insn	2, 0x0100
      c2:	0905                	.insn	2, 0x0905
      c4:	0306                	.insn	2, 0x0306
      c6:	0901                	.insn	2, 0x0901
      c8:	0004                	.insn	2, 0x0004
      ca:	0401                	.insn	2, 0x0401
      cc:	0505                	.insn	2, 0x0505
      ce:	031f 094b 0008      	.insn	6, 0x0008094b031f
      d4:	0401                	.insn	2, 0x0401
      d6:	0501                	.insn	2, 0x0501
      d8:	0301                	.insn	2, 0x0301
      da:	0938                	.insn	2, 0x0938
      dc:	0004                	.insn	2, 0x0004
      de:	0501                	.insn	2, 0x0501
      e0:	0300                	.insn	2, 0x0300
      e2:	00040903          	lb	s2,0(s0)
      e6:	0401                	.insn	2, 0x0401
      e8:	0505                	.insn	2, 0x0505
      ea:	0a0c                	.insn	2, 0x0a0c
      ec:	04094803          	lbu	a6,64(s2)
      f0:	0100                	.insn	2, 0x0100
      f2:	0104                	.insn	2, 0x0104
      f4:	0005                	.insn	2, 0x0005
      f6:	04093a03          	.insn	4, 0x04093a03
      fa:	0100                	.insn	2, 0x0100
      fc:	0505                	.insn	2, 0x0505
      fe:	0306                	.insn	2, 0x0306
     100:	0900                	.insn	2, 0x0900
     102:	0004                	.insn	2, 0x0004
     104:	0501                	.insn	2, 0x0501
     106:	0609                	.insn	2, 0x0609
     108:	04090103          	lb	sp,64(s2)
     10c:	0100                	.insn	2, 0x0100
     10e:	0504                	.insn	2, 0x0504
     110:	1f05                	.insn	2, 0x1f05
     112:	08094203          	lbu	tp,128(s2)
     116:	0100                	.insn	2, 0x0100
     118:	0104                	.insn	2, 0x0104
     11a:	0105                	.insn	2, 0x0105
     11c:	0900c103          	lbu	sp,144(ra)
     120:	0004                	.insn	2, 0x0004
     122:	0501                	.insn	2, 0x0501
     124:	0300                	.insn	2, 0x0300
     126:	00040903          	lb	s2,0(s0)
     12a:	0401                	.insn	2, 0x0401
     12c:	0505                	.insn	2, 0x0505
     12e:	0a0c                	.insn	2, 0x0a0c
     130:	097fbf03          	.insn	4, 0x097fbf03
     134:	0004                	.insn	2, 0x0004
     136:	0401                	.insn	2, 0x0401
     138:	0501                	.insn	2, 0x0501
     13a:	0330                	.insn	2, 0x0330
     13c:	040900c3          	.insn	4, 0x040900c3
     140:	0100                	.insn	2, 0x0100
     142:	0505                	.insn	2, 0x0505
     144:	0306                	.insn	2, 0x0306
     146:	0900                	.insn	2, 0x0900
     148:	0004                	.insn	2, 0x0004
     14a:	0501                	.insn	2, 0x0501
     14c:	0609                	.insn	2, 0x0609
     14e:	04090103          	lb	sp,64(s2)
     152:	0100                	.insn	2, 0x0100
     154:	0504                	.insn	2, 0x0504
     156:	0c05                	.insn	2, 0x0c05
     158:	097fbc03          	.insn	4, 0x097fbc03
     15c:	0008                	.insn	2, 0x0008
     15e:	0401                	.insn	2, 0x0401
     160:	0501                	.insn	2, 0x0501
     162:	0336                	.insn	2, 0x0336
     164:	00c6                	.insn	2, 0x00c6
     166:	0409                	.insn	2, 0x0409
     168:	0100                	.insn	2, 0x0100
     16a:	0505                	.insn	2, 0x0505
     16c:	0306                	.insn	2, 0x0306
     16e:	0900                	.insn	2, 0x0900
     170:	0004                	.insn	2, 0x0004
     172:	0501                	.insn	2, 0x0501
     174:	0600                	.insn	2, 0x0600
     176:	04090f03          	lb	t5,64(s2)
     17a:	0100                	.insn	2, 0x0100
     17c:	0a05                	.insn	2, 0x0a05
     17e:	030a                	.insn	2, 0x030a
     180:	090a                	.insn	2, 0x090a
     182:	000c                	.insn	2, 0x000c
     184:	0501                	.insn	2, 0x0501
     186:	0609                	.insn	2, 0x0609
     188:	08090003          	lb	zero,128(s2)
     18c:	0100                	.insn	2, 0x0100
     18e:	1505                	.insn	2, 0x1505
     190:	0306                	.insn	2, 0x0306
     192:	0905                	.insn	2, 0x0905
     194:	0004                	.insn	2, 0x0004
     196:	0601                	.insn	2, 0x0601
     198:	097efb03          	.insn	4, 0x097efb03
     19c:	000c                	.insn	2, 0x000c
     19e:	0601                	.insn	2, 0x0601
     1a0:	09018203          	lb	tp,144(gp) # 1090 <$d.2+0x2b>
     1a4:	0004                	.insn	2, 0x0004
     1a6:	0301                	.insn	2, 0x0301
     1a8:	0904                	.insn	2, 0x0904
     1aa:	000c                	.insn	2, 0x000c
     1ac:	0501                	.insn	2, 0x0501
     1ae:	0610                	.insn	2, 0x0610
     1b0:	04090003          	lb	zero,64(s2)
     1b4:	0100                	.insn	2, 0x0100
     1b6:	1405                	.insn	2, 0x1405
     1b8:	0306                	.insn	2, 0x0306
     1ba:	0902                	.insn	2, 0x0902
     1bc:	0008                	.insn	2, 0x0008
     1be:	0501                	.insn	2, 0x0501
     1c0:	0310                	.insn	2, 0x0310
     1c2:	097e                	.insn	2, 0x097e
     1c4:	0008                	.insn	2, 0x0008
     1c6:	0501                	.insn	2, 0x0501
     1c8:	0309                	.insn	2, 0x0309
     1ca:	0902                	.insn	2, 0x0902
     1cc:	0004                	.insn	2, 0x0004
     1ce:	0301                	.insn	2, 0x0301
     1d0:	0901                	.insn	2, 0x0901
     1d2:	0004                	.insn	2, 0x0004
     1d4:	0501                	.insn	2, 0x0501
     1d6:	0305                	.insn	2, 0x0305
     1d8:	0902                	.insn	2, 0x0902
     1da:	0020                	.insn	2, 0x0020
     1dc:	0301                	.insn	2, 0x0301
     1de:	0901                	.insn	2, 0x0901
     1e0:	0010                	.insn	2, 0x0010
     1e2:	0601                	.insn	2, 0x0601
     1e4:	0900030b          	.insn	4, 0x0900030b
     1e8:	000c                	.insn	2, 0x000c
     1ea:	0501                	.insn	2, 0x0501
     1ec:	0600                	.insn	2, 0x0600
     1ee:	08092603          	lw	a2,128(s2)
     1f2:	0100                	.insn	2, 0x0100
     1f4:	0505                	.insn	2, 0x0505
     1f6:	030a                	.insn	2, 0x030a
     1f8:	0901                	.insn	2, 0x0901
     1fa:	0008                	.insn	2, 0x0008
     1fc:	0a01                	.insn	2, 0x0a01
     1fe:	14091103          	lh	sp,320(s2)
     202:	0100                	.insn	2, 0x0100
     204:	030a                	.insn	2, 0x030a
     206:	00ce                	.insn	2, 0x00ce
     208:	1809                	.insn	2, 0x1809
     20a:	0101                	.insn	2, 0x0101
     20c:	0005                	.insn	2, 0x0005
     20e:	7c092a03          	lw	s4,1984(s2)
     212:	0100                	.insn	2, 0x0100
     214:	0905                	.insn	2, 0x0905
     216:	030a                	.insn	2, 0x030a
     218:	0901                	.insn	2, 0x0901
     21a:	0020                	.insn	2, 0x0020
     21c:	0301                	.insn	2, 0x0301
     21e:	0901                	.insn	2, 0x0901
     220:	0008                	.insn	2, 0x0008
     222:	0601                	.insn	2, 0x0601
     224:	097dc203          	lbu	tp,151(s11)
     228:	0024                	.insn	2, 0x0024
     22a:	0501                	.insn	2, 0x0501
     22c:	060a                	.insn	2, 0x060a
     22e:	0902c003          	lbu	zero,144(t0)
     232:	0008                	.insn	2, 0x0008
     234:	0501                	.insn	2, 0x0501
     236:	0609                	.insn	2, 0x0609
     238:	04090003          	lb	zero,64(s2)
     23c:	0100                	.insn	2, 0x0100
     23e:	0306                	.insn	2, 0x0306
     240:	0901                	.insn	2, 0x0901
     242:	0004                	.insn	2, 0x0004
     244:	0501                	.insn	2, 0x0501
     246:	030a                	.insn	2, 0x030a
     248:	00240903          	lb	s2,2(s0)
     24c:	0501                	.insn	2, 0x0501
     24e:	0621                	.insn	2, 0x0621
     250:	10090003          	lb	zero,256(s2)
     254:	0100                	.insn	2, 0x0100
     256:	0905                	.insn	2, 0x0905
     258:	04090003          	lb	zero,64(s2)
     25c:	0100                	.insn	2, 0x0100
     25e:	0a05                	.insn	2, 0x0a05
     260:	0306                	.insn	2, 0x0306
     262:	7ebc                	.insn	2, 0x7ebc
     264:	0409                	.insn	2, 0x0409
     266:	0100                	.insn	2, 0x0100
     268:	0905                	.insn	2, 0x0905
     26a:	0306                	.insn	2, 0x0306
     26c:	0900                	.insn	2, 0x0900
     26e:	0008                	.insn	2, 0x0008
     270:	0501                	.insn	2, 0x0501
     272:	0615                	.insn	2, 0x0615
     274:	04090503          	lb	a0,64(s2)
     278:	0100                	.insn	2, 0x0100
     27a:	0306                	.insn	2, 0x0306
     27c:	0c097efb          	.insn	4, 0x0c097efb
     280:	0100                	.insn	2, 0x0100
     282:	0306                	.insn	2, 0x0306
     284:	0182                	.insn	2, 0x0182
     286:	0409                	.insn	2, 0x0409
     288:	0100                	.insn	2, 0x0100
     28a:	0306                	.insn	2, 0x0306
     28c:	7efe                	.insn	2, 0x7efe
     28e:	0c09                	.insn	2, 0x0c09
     290:	0100                	.insn	2, 0x0100
     292:	1005                	.insn	2, 0x1005
     294:	0306                	.insn	2, 0x0306
     296:	0186                	.insn	2, 0x0186
     298:	0409                	.insn	2, 0x0409
     29a:	0100                	.insn	2, 0x0100
     29c:	1405                	.insn	2, 0x1405
     29e:	08090203          	lb	tp,128(s2)
     2a2:	0100                	.insn	2, 0x0100
     2a4:	1005                	.insn	2, 0x1005
     2a6:	08097e03          	.insn	4, 0x08097e03
     2aa:	0100                	.insn	2, 0x0100
     2ac:	0905                	.insn	2, 0x0905
     2ae:	04090203          	lb	tp,64(s2)
     2b2:	0100                	.insn	2, 0x0100
     2b4:	04090103          	lb	sp,64(s2)
     2b8:	0100                	.insn	2, 0x0100
     2ba:	0306                	.insn	2, 0x0306
     2bc:	20097ef7          	.insn	4, 0x20097ef7
     2c0:	0100                	.insn	2, 0x0100
     2c2:	0505                	.insn	2, 0x0505
     2c4:	0306                	.insn	2, 0x0306
     2c6:	0409018b          	.insn	4, 0x0409018b
     2ca:	0100                	.insn	2, 0x0100
     2cc:	0306                	.insn	2, 0x0306
     2ce:	7ef5                	.insn	2, 0x7ef5
     2d0:	1809                	.insn	2, 0x1809
     2d2:	0100                	.insn	2, 0x0100
     2d4:	3005                	.insn	2, 0x3005
     2d6:	0306                	.insn	2, 0x0306
     2d8:	02c6                	.insn	2, 0x02c6
     2da:	0809                	.insn	2, 0x0809
     2dc:	0100                	.insn	2, 0x0100
     2de:	3705                	.insn	2, 0x3705
     2e0:	0306                	.insn	2, 0x0306
     2e2:	0900                	.insn	2, 0x0900
     2e4:	0008                	.insn	2, 0x0008
     2e6:	0501                	.insn	2, 0x0501
     2e8:	0316                	.insn	2, 0x0316
     2ea:	0900                	.insn	2, 0x0900
     2ec:	0004                	.insn	2, 0x0004
     2ee:	0501                	.insn	2, 0x0501
     2f0:	0403063b          	.insn	4, 0x0403063b
     2f4:	0409                	.insn	2, 0x0409
     2f6:	0100                	.insn	2, 0x0100
     2f8:	1c05                	.insn	2, 0x1c05
     2fa:	08090103          	lb	sp,128(s2)
     2fe:	0100                	.insn	2, 0x0100
     300:	3805                	.insn	2, 0x3805
     302:	0306                	.insn	2, 0x0306
     304:	0900                	.insn	2, 0x0900
     306:	0004                	.insn	2, 0x0004
     308:	0501                	.insn	2, 0x0501
     30a:	0305                	.insn	2, 0x0305
     30c:	0900                	.insn	2, 0x0900
     30e:	0008                	.insn	2, 0x0008
     310:	0301                	.insn	2, 0x0301
     312:	7db5                	.insn	2, 0x7db5
     314:	0409                	.insn	2, 0x0409
     316:	0100                	.insn	2, 0x0100
     318:	0902cb03          	lbu	s6,144(t0)
     31c:	0008                	.insn	2, 0x0008
     31e:	0501                	.insn	2, 0x0501
     320:	0312                	.insn	2, 0x0312
     322:	0900                	.insn	2, 0x0900
     324:	0008                	.insn	2, 0x0008
     326:	0501                	.insn	2, 0x0501
     328:	0601                	.insn	2, 0x0601
     32a:	0901030b          	.insn	4, 0x0901030b
     32e:	001c                	.insn	2, 0x001c
     330:	0501                	.insn	2, 0x0501
     332:	0a09                	.insn	2, 0x0a09
     334:	08090503          	lb	a0,128(s2)
     338:	0100                	.insn	2, 0x0100
     33a:	0505                	.insn	2, 0x0505
     33c:	04097f03          	.insn	4, 0x04097f03
     340:	0100                	.insn	2, 0x0100
     342:	0005                	.insn	2, 0x0005
     344:	04090703          	lb	a4,64(s2)
     348:	0100                	.insn	2, 0x0100
     34a:	1605                	.insn	2, 0x1605
     34c:	030a                	.insn	2, 0x030a
     34e:	00380907          	.insn	4, 0x00380907
     352:	0601                	.insn	2, 0x0601
     354:	097da203          	lw	tp,151(s11)
     358:	0010                	.insn	2, 0x0010
     35a:	0501                	.insn	2, 0x0501
     35c:	030d                	.insn	2, 0x030d
     35e:	02de                	.insn	2, 0x02de
     360:	0409                	.insn	2, 0x0409
     362:	0100                	.insn	2, 0x0100
     364:	1605                	.insn	2, 0x1605
     366:	04090003          	lb	zero,64(s2)
     36a:	0100                	.insn	2, 0x0100
     36c:	0d05                	.insn	2, 0x0d05
     36e:	0c090003          	lb	zero,192(s2)
     372:	0100                	.insn	2, 0x0100
     374:	1605                	.insn	2, 0x1605
     376:	04090003          	lb	zero,64(s2)
     37a:	0100                	.insn	2, 0x0100
     37c:	0d05                	.insn	2, 0x0d05
     37e:	14090003          	lb	zero,320(s2)
     382:	0100                	.insn	2, 0x0100
     384:	1605                	.insn	2, 0x1605
     386:	04090003          	lb	zero,64(s2)
     38a:	0100                	.insn	2, 0x0100
     38c:	0d05                	.insn	2, 0x0d05
     38e:	0c090003          	lb	zero,192(s2)
     392:	0100                	.insn	2, 0x0100
     394:	1605                	.insn	2, 0x1605
     396:	04090003          	lb	zero,64(s2)
     39a:	0100                	.insn	2, 0x0100
     39c:	0d05                	.insn	2, 0x0d05
     39e:	14090003          	lb	zero,320(s2)
     3a2:	0100                	.insn	2, 0x0100
     3a4:	1605                	.insn	2, 0x1605
     3a6:	04090003          	lb	zero,64(s2)
     3aa:	0100                	.insn	2, 0x0100
     3ac:	0d05                	.insn	2, 0x0d05
     3ae:	0c090003          	lb	zero,192(s2)
     3b2:	0100                	.insn	2, 0x0100
     3b4:	1605                	.insn	2, 0x1605
     3b6:	04090003          	lb	zero,64(s2)
     3ba:	0100                	.insn	2, 0x0100
     3bc:	0d05                	.insn	2, 0x0d05
     3be:	14090003          	lb	zero,320(s2)
     3c2:	0100                	.insn	2, 0x0100
     3c4:	1605                	.insn	2, 0x1605
     3c6:	04090003          	lb	zero,64(s2)
     3ca:	0100                	.insn	2, 0x0100
     3cc:	0d05                	.insn	2, 0x0d05
     3ce:	0c090003          	lb	zero,192(s2)
     3d2:	0100                	.insn	2, 0x0100
     3d4:	1005                	.insn	2, 0x1005
     3d6:	0306                	.insn	2, 0x0306
     3d8:	0906                	.insn	2, 0x0906
     3da:	0004                	.insn	2, 0x0004
     3dc:	0601                	.insn	2, 0x0601
     3de:	097d9c03          	lh	s8,151(s11)
     3e2:	0020                	.insn	2, 0x0020
     3e4:	0501                	.insn	2, 0x0501
     3e6:	0606                	.insn	2, 0x0606
     3e8:	0902e803          	.insn	4, 0x0902e803
     3ec:	003c                	.insn	2, 0x003c
     3ee:	0501                	.insn	2, 0x0501
     3f0:	0003060b          	.insn	4, 0x0003060b
     3f4:	1809                	.insn	2, 0x1809
     3f6:	0100                	.insn	2, 0x0100
     3f8:	0306                	.insn	2, 0x0306
     3fa:	0901                	.insn	2, 0x0901
     3fc:	0004                	.insn	2, 0x0004
     3fe:	0301                	.insn	2, 0x0301
     400:	0901                	.insn	2, 0x0901
     402:	0004                	.insn	2, 0x0004
     404:	0301                	.insn	2, 0x0301
     406:	0901                	.insn	2, 0x0901
     408:	0004                	.insn	2, 0x0004
     40a:	0301                	.insn	2, 0x0301
     40c:	0901                	.insn	2, 0x0901
     40e:	0004                	.insn	2, 0x0004
     410:	0301                	.insn	2, 0x0301
     412:	0901                	.insn	2, 0x0901
     414:	0004                	.insn	2, 0x0004
     416:	0301                	.insn	2, 0x0301
     418:	0901                	.insn	2, 0x0901
     41a:	0004                	.insn	2, 0x0004
     41c:	0301                	.insn	2, 0x0301
     41e:	0901                	.insn	2, 0x0901
     420:	0004                	.insn	2, 0x0004
     422:	0301                	.insn	2, 0x0301
     424:	0901                	.insn	2, 0x0901
     426:	0004                	.insn	2, 0x0004
     428:	0301                	.insn	2, 0x0301
     42a:	0901                	.insn	2, 0x0901
     42c:	0004                	.insn	2, 0x0004
     42e:	0301                	.insn	2, 0x0301
     430:	0901                	.insn	2, 0x0901
     432:	0004                	.insn	2, 0x0004
     434:	0301                	.insn	2, 0x0301
     436:	0901                	.insn	2, 0x0901
     438:	0004                	.insn	2, 0x0004
     43a:	0501                	.insn	2, 0x0501
     43c:	030a                	.insn	2, 0x030a
     43e:	7e8d                	.insn	2, 0x7e8d
     440:	0809                	.insn	2, 0x0809
     442:	0100                	.insn	2, 0x0100
     444:	0605                	.insn	2, 0x0605
     446:	0901f403          	.insn	4, 0x0901f403
     44a:	0008                	.insn	2, 0x0008
     44c:	0501                	.insn	2, 0x0501
     44e:	0003060b          	.insn	4, 0x0003060b
     452:	0409                	.insn	2, 0x0409
     454:	0100                	.insn	2, 0x0100
     456:	1505                	.insn	2, 0x1505
     458:	0306                	.insn	2, 0x0306
     45a:	7e91                	.insn	2, 0x7e91
     45c:	1009                	.insn	2, 0x1009
     45e:	0100                	.insn	2, 0x0100
     460:	0306                	.insn	2, 0x0306
     462:	0c097efb          	.insn	4, 0x0c097efb
     466:	0100                	.insn	2, 0x0100
     468:	0306                	.insn	2, 0x0306
     46a:	0182                	.insn	2, 0x0182
     46c:	0409                	.insn	2, 0x0409
     46e:	0100                	.insn	2, 0x0100
     470:	0306                	.insn	2, 0x0306
     472:	7efe                	.insn	2, 0x7efe
     474:	0c09                	.insn	2, 0x0c09
     476:	0100                	.insn	2, 0x0100
     478:	1005                	.insn	2, 0x1005
     47a:	0306                	.insn	2, 0x0306
     47c:	0186                	.insn	2, 0x0186
     47e:	0409                	.insn	2, 0x0409
     480:	0100                	.insn	2, 0x0100
     482:	1405                	.insn	2, 0x1405
     484:	08090203          	lb	tp,128(s2)
     488:	0100                	.insn	2, 0x0100
     48a:	1005                	.insn	2, 0x1005
     48c:	08097e03          	.insn	4, 0x08097e03
     490:	0100                	.insn	2, 0x0100
     492:	0905                	.insn	2, 0x0905
     494:	04090203          	lb	tp,64(s2)
     498:	0100                	.insn	2, 0x0100
     49a:	04090103          	lb	sp,64(s2)
     49e:	0100                	.insn	2, 0x0100
     4a0:	0505                	.insn	2, 0x0505
     4a2:	20090203          	lb	tp,512(s2)
     4a6:	0100                	.insn	2, 0x0100
     4a8:	0901f703          	.insn	4, 0x0901f703
     4ac:	0018                	.insn	2, 0x0018
     4ae:	0301                	.insn	2, 0x0301
     4b0:	0902                	.insn	2, 0x0902
     4b2:	0010                	.insn	2, 0x0010
     4b4:	0601                	.insn	2, 0x0601
     4b6:	097cfc03          	.insn	4, 0x097cfc03
     4ba:	000c                	.insn	2, 0x000c
     4bc:	0501                	.insn	2, 0x0501
     4be:	0609                	.insn	2, 0x0609
     4c0:	09038603          	lb	a2,144(t2)
     4c4:	0008                	.insn	2, 0x0008
     4c6:	0501                	.insn	2, 0x0501
     4c8:	0332                	.insn	2, 0x0332
     4ca:	097f 0018 0501 0305 	.insn	10, 0x097f030505010018097f
     4d2:	097f 
     4d4:	0004                	.insn	2, 0x0004
     4d6:	0301                	.insn	2, 0x0301
     4d8:	090a                	.insn	2, 0x090a
     4da:	0004                	.insn	2, 0x0004
     4dc:	0501                	.insn	2, 0x0501
     4de:	030a                	.insn	2, 0x030a
     4e0:	7fb6                	.insn	2, 0x7fb6
     4e2:	1009                	.insn	2, 0x1009
     4e4:	0100                	.insn	2, 0x0100
     4e6:	2105                	.insn	2, 0x2105
     4e8:	0306                	.insn	2, 0x0306
     4ea:	0900                	.insn	2, 0x0900
     4ec:	0004                	.insn	2, 0x0004
     4ee:	0501                	.insn	2, 0x0501
     4f0:	0309                	.insn	2, 0x0309
     4f2:	0900                	.insn	2, 0x0900
     4f4:	0004                	.insn	2, 0x0004
     4f6:	0501                	.insn	2, 0x0501
     4f8:	060a                	.insn	2, 0x060a
     4fa:	097ebc03          	.insn	4, 0x097ebc03
     4fe:	0004                	.insn	2, 0x0004
     500:	0501                	.insn	2, 0x0501
     502:	0609                	.insn	2, 0x0609
     504:	08090003          	lb	zero,128(s2)
     508:	0100                	.insn	2, 0x0100
     50a:	1505                	.insn	2, 0x1505
     50c:	0306                	.insn	2, 0x0306
     50e:	0905                	.insn	2, 0x0905
     510:	0004                	.insn	2, 0x0004
     512:	0601                	.insn	2, 0x0601
     514:	097efb03          	.insn	4, 0x097efb03
     518:	000c                	.insn	2, 0x000c
     51a:	0601                	.insn	2, 0x0601
     51c:	09018203          	lb	tp,144(gp)
     520:	0004                	.insn	2, 0x0004
     522:	0601                	.insn	2, 0x0601
     524:	097efe03          	.insn	4, 0x097efe03
     528:	000c                	.insn	2, 0x000c
     52a:	0501                	.insn	2, 0x0501
     52c:	0610                	.insn	2, 0x0610
     52e:	09018603          	lb	a2,144(gp)
     532:	0004                	.insn	2, 0x0004
     534:	0501                	.insn	2, 0x0501
     536:	0314                	.insn	2, 0x0314
     538:	0902                	.insn	2, 0x0902
     53a:	0008                	.insn	2, 0x0008
     53c:	0501                	.insn	2, 0x0501
     53e:	0310                	.insn	2, 0x0310
     540:	097e                	.insn	2, 0x097e
     542:	0008                	.insn	2, 0x0008
     544:	0501                	.insn	2, 0x0501
     546:	0309                	.insn	2, 0x0309
     548:	0902                	.insn	2, 0x0902
     54a:	0004                	.insn	2, 0x0004
     54c:	0301                	.insn	2, 0x0301
     54e:	0901                	.insn	2, 0x0901
     550:	0004                	.insn	2, 0x0004
     552:	0501                	.insn	2, 0x0501
     554:	0305                	.insn	2, 0x0305
     556:	0902                	.insn	2, 0x0902
     558:	0020                	.insn	2, 0x0020
     55a:	0501                	.insn	2, 0x0501
     55c:	0330                	.insn	2, 0x0330
     55e:	140901bb          	.insn	4, 0x140901bb
     562:	0100                	.insn	2, 0x0100
     564:	3705                	.insn	2, 0x3705
     566:	0306                	.insn	2, 0x0306
     568:	0900                	.insn	2, 0x0900
     56a:	0008                	.insn	2, 0x0008
     56c:	0501                	.insn	2, 0x0501
     56e:	0316                	.insn	2, 0x0316
     570:	0900                	.insn	2, 0x0900
     572:	0004                	.insn	2, 0x0004
     574:	0501                	.insn	2, 0x0501
     576:	0403063b          	.insn	4, 0x0403063b
     57a:	0409                	.insn	2, 0x0409
     57c:	0100                	.insn	2, 0x0100
     57e:	0306                	.insn	2, 0x0306
     580:	7db6                	.insn	2, 0x7db6
     582:	0809                	.insn	2, 0x0809
     584:	0100                	.insn	2, 0x0100
     586:	1205                	.insn	2, 0x1205
     588:	0306                	.insn	2, 0x0306
     58a:	080902cb          	.insn	4, 0x080902cb
     58e:	0100                	.insn	2, 0x0100
     590:	0505                	.insn	2, 0x0505
     592:	0900d603          	lhu	a2,144(ra)
     596:	0004                	.insn	2, 0x0004
     598:	0501                	.insn	2, 0x0501
     59a:	030a                	.insn	2, 0x030a
     59c:	10097fa3          	.insn	4, 0x10097fa3
     5a0:	0100                	.insn	2, 0x0100
     5a2:	2105                	.insn	2, 0x2105
     5a4:	0306                	.insn	2, 0x0306
     5a6:	0900                	.insn	2, 0x0900
     5a8:	0004                	.insn	2, 0x0004
     5aa:	0501                	.insn	2, 0x0501
     5ac:	0309                	.insn	2, 0x0309
     5ae:	0900                	.insn	2, 0x0900
     5b0:	0004                	.insn	2, 0x0004
     5b2:	0501                	.insn	2, 0x0501
     5b4:	060a                	.insn	2, 0x060a
     5b6:	097ebc03          	.insn	4, 0x097ebc03
     5ba:	0004                	.insn	2, 0x0004
     5bc:	0501                	.insn	2, 0x0501
     5be:	0609                	.insn	2, 0x0609
     5c0:	08090003          	lb	zero,128(s2)
     5c4:	0100                	.insn	2, 0x0100
     5c6:	1505                	.insn	2, 0x1505
     5c8:	0306                	.insn	2, 0x0306
     5ca:	0905                	.insn	2, 0x0905
     5cc:	0004                	.insn	2, 0x0004
     5ce:	0601                	.insn	2, 0x0601
     5d0:	097efb03          	.insn	4, 0x097efb03
     5d4:	000c                	.insn	2, 0x000c
     5d6:	0601                	.insn	2, 0x0601
     5d8:	09018203          	lb	tp,144(gp)
     5dc:	0004                	.insn	2, 0x0004
     5de:	0601                	.insn	2, 0x0601
     5e0:	097efe03          	.insn	4, 0x097efe03
     5e4:	000c                	.insn	2, 0x000c
     5e6:	0501                	.insn	2, 0x0501
     5e8:	0610                	.insn	2, 0x0610
     5ea:	09018603          	lb	a2,144(gp)
     5ee:	0004                	.insn	2, 0x0004
     5f0:	0501                	.insn	2, 0x0501
     5f2:	0314                	.insn	2, 0x0314
     5f4:	0902                	.insn	2, 0x0902
     5f6:	0008                	.insn	2, 0x0008
     5f8:	0501                	.insn	2, 0x0501
     5fa:	0310                	.insn	2, 0x0310
     5fc:	097e                	.insn	2, 0x097e
     5fe:	0008                	.insn	2, 0x0008
     600:	0501                	.insn	2, 0x0501
     602:	0309                	.insn	2, 0x0309
     604:	0902                	.insn	2, 0x0902
     606:	0004                	.insn	2, 0x0004
     608:	0301                	.insn	2, 0x0301
     60a:	0901                	.insn	2, 0x0901
     60c:	0004                	.insn	2, 0x0004
     60e:	0501                	.insn	2, 0x0501
     610:	0305                	.insn	2, 0x0305
     612:	0902                	.insn	2, 0x0902
     614:	0020                	.insn	2, 0x0020
     616:	0501                	.insn	2, 0x0501
     618:	0330                	.insn	2, 0x0330
     61a:	140901bb          	.insn	4, 0x140901bb
     61e:	0100                	.insn	2, 0x0100
     620:	3705                	.insn	2, 0x3705
     622:	0306                	.insn	2, 0x0306
     624:	0900                	.insn	2, 0x0900
     626:	0008                	.insn	2, 0x0008
     628:	0501                	.insn	2, 0x0501
     62a:	0316                	.insn	2, 0x0316
     62c:	0900                	.insn	2, 0x0900
     62e:	0004                	.insn	2, 0x0004
     630:	0501                	.insn	2, 0x0501
     632:	0403063b          	.insn	4, 0x0403063b
     636:	0409                	.insn	2, 0x0409
     638:	0100                	.insn	2, 0x0100
     63a:	0306                	.insn	2, 0x0306
     63c:	7db6                	.insn	2, 0x7db6
     63e:	0809                	.insn	2, 0x0809
     640:	0100                	.insn	2, 0x0100
     642:	1205                	.insn	2, 0x1205
     644:	0306                	.insn	2, 0x0306
     646:	080902cb          	.insn	4, 0x080902cb
     64a:	0100                	.insn	2, 0x0100
     64c:	0505                	.insn	2, 0x0505
     64e:	0900e003          	.insn	4, 0x0900e003
     652:	0004                	.insn	2, 0x0004
     654:	0501                	.insn	2, 0x0501
     656:	030a                	.insn	2, 0x030a
     658:	7f99                	.insn	2, 0x7f99
     65a:	1009                	.insn	2, 0x1009
     65c:	0100                	.insn	2, 0x0100
     65e:	2105                	.insn	2, 0x2105
     660:	0306                	.insn	2, 0x0306
     662:	0900                	.insn	2, 0x0900
     664:	0004                	.insn	2, 0x0004
     666:	0501                	.insn	2, 0x0501
     668:	0309                	.insn	2, 0x0309
     66a:	0900                	.insn	2, 0x0900
     66c:	0004                	.insn	2, 0x0004
     66e:	0501                	.insn	2, 0x0501
     670:	060a                	.insn	2, 0x060a
     672:	097ebc03          	.insn	4, 0x097ebc03
     676:	0004                	.insn	2, 0x0004
     678:	0501                	.insn	2, 0x0501
     67a:	0609                	.insn	2, 0x0609
     67c:	08090003          	lb	zero,128(s2)
     680:	0100                	.insn	2, 0x0100
     682:	1505                	.insn	2, 0x1505
     684:	0306                	.insn	2, 0x0306
     686:	0905                	.insn	2, 0x0905
     688:	0004                	.insn	2, 0x0004
     68a:	0601                	.insn	2, 0x0601
     68c:	097efb03          	.insn	4, 0x097efb03
     690:	000c                	.insn	2, 0x000c
     692:	0601                	.insn	2, 0x0601
     694:	09018203          	lb	tp,144(gp)
     698:	0004                	.insn	2, 0x0004
     69a:	0601                	.insn	2, 0x0601
     69c:	097efe03          	.insn	4, 0x097efe03
     6a0:	000c                	.insn	2, 0x000c
     6a2:	0501                	.insn	2, 0x0501
     6a4:	0610                	.insn	2, 0x0610
     6a6:	09018603          	lb	a2,144(gp)
     6aa:	0004                	.insn	2, 0x0004
     6ac:	0501                	.insn	2, 0x0501
     6ae:	0314                	.insn	2, 0x0314
     6b0:	0902                	.insn	2, 0x0902
     6b2:	0008                	.insn	2, 0x0008
     6b4:	0501                	.insn	2, 0x0501
     6b6:	0310                	.insn	2, 0x0310
     6b8:	097e                	.insn	2, 0x097e
     6ba:	0008                	.insn	2, 0x0008
     6bc:	0501                	.insn	2, 0x0501
     6be:	0309                	.insn	2, 0x0309
     6c0:	0902                	.insn	2, 0x0902
     6c2:	0004                	.insn	2, 0x0004
     6c4:	0301                	.insn	2, 0x0301
     6c6:	0901                	.insn	2, 0x0901
     6c8:	0004                	.insn	2, 0x0004
     6ca:	0501                	.insn	2, 0x0501
     6cc:	0305                	.insn	2, 0x0305
     6ce:	0902                	.insn	2, 0x0902
     6d0:	0020                	.insn	2, 0x0020
     6d2:	0501                	.insn	2, 0x0501
     6d4:	0330                	.insn	2, 0x0330
     6d6:	140901bb          	.insn	4, 0x140901bb
     6da:	0100                	.insn	2, 0x0100
     6dc:	3705                	.insn	2, 0x3705
     6de:	0306                	.insn	2, 0x0306
     6e0:	0900                	.insn	2, 0x0900
     6e2:	0008                	.insn	2, 0x0008
     6e4:	0501                	.insn	2, 0x0501
     6e6:	0316                	.insn	2, 0x0316
     6e8:	0900                	.insn	2, 0x0900
     6ea:	0004                	.insn	2, 0x0004
     6ec:	0501                	.insn	2, 0x0501
     6ee:	0403063b          	.insn	4, 0x0403063b
     6f2:	0409                	.insn	2, 0x0409
     6f4:	0100                	.insn	2, 0x0100
     6f6:	0306                	.insn	2, 0x0306
     6f8:	7db6                	.insn	2, 0x7db6
     6fa:	0809                	.insn	2, 0x0809
     6fc:	0100                	.insn	2, 0x0100
     6fe:	1205                	.insn	2, 0x1205
     700:	0306                	.insn	2, 0x0306
     702:	080902cb          	.insn	4, 0x080902cb
     706:	0100                	.insn	2, 0x0100
     708:	0505                	.insn	2, 0x0505
     70a:	0900ea03          	.insn	4, 0x0900ea03
     70e:	0004                	.insn	2, 0x0004
     710:	0501                	.insn	2, 0x0501
     712:	030a                	.insn	2, 0x030a
     714:	10097f8f          	.insn	4, 0x10097f8f
     718:	0100                	.insn	2, 0x0100
     71a:	2105                	.insn	2, 0x2105
     71c:	0306                	.insn	2, 0x0306
     71e:	0900                	.insn	2, 0x0900
     720:	0004                	.insn	2, 0x0004
     722:	0501                	.insn	2, 0x0501
     724:	0309                	.insn	2, 0x0309
     726:	0900                	.insn	2, 0x0900
     728:	0004                	.insn	2, 0x0004
     72a:	0501                	.insn	2, 0x0501
     72c:	060a                	.insn	2, 0x060a
     72e:	097ebc03          	.insn	4, 0x097ebc03
     732:	0004                	.insn	2, 0x0004
     734:	0501                	.insn	2, 0x0501
     736:	0609                	.insn	2, 0x0609
     738:	08090003          	lb	zero,128(s2)
     73c:	0100                	.insn	2, 0x0100
     73e:	1505                	.insn	2, 0x1505
     740:	0306                	.insn	2, 0x0306
     742:	0905                	.insn	2, 0x0905
     744:	0004                	.insn	2, 0x0004
     746:	0601                	.insn	2, 0x0601
     748:	097efb03          	.insn	4, 0x097efb03
     74c:	000c                	.insn	2, 0x000c
     74e:	0601                	.insn	2, 0x0601
     750:	09018203          	lb	tp,144(gp)
     754:	0004                	.insn	2, 0x0004
     756:	0601                	.insn	2, 0x0601
     758:	097efe03          	.insn	4, 0x097efe03
     75c:	000c                	.insn	2, 0x000c
     75e:	0501                	.insn	2, 0x0501
     760:	0610                	.insn	2, 0x0610
     762:	09018603          	lb	a2,144(gp)
     766:	0004                	.insn	2, 0x0004
     768:	0501                	.insn	2, 0x0501
     76a:	0314                	.insn	2, 0x0314
     76c:	0902                	.insn	2, 0x0902
     76e:	0008                	.insn	2, 0x0008
     770:	0501                	.insn	2, 0x0501
     772:	0310                	.insn	2, 0x0310
     774:	097e                	.insn	2, 0x097e
     776:	0008                	.insn	2, 0x0008
     778:	0501                	.insn	2, 0x0501
     77a:	0309                	.insn	2, 0x0309
     77c:	0902                	.insn	2, 0x0902
     77e:	0004                	.insn	2, 0x0004
     780:	0301                	.insn	2, 0x0301
     782:	0901                	.insn	2, 0x0901
     784:	0004                	.insn	2, 0x0004
     786:	0501                	.insn	2, 0x0501
     788:	0305                	.insn	2, 0x0305
     78a:	0902                	.insn	2, 0x0902
     78c:	0020                	.insn	2, 0x0020
     78e:	0501                	.insn	2, 0x0501
     790:	0330                	.insn	2, 0x0330
     792:	140901bb          	.insn	4, 0x140901bb
     796:	0100                	.insn	2, 0x0100
     798:	3705                	.insn	2, 0x3705
     79a:	0306                	.insn	2, 0x0306
     79c:	0900                	.insn	2, 0x0900
     79e:	0008                	.insn	2, 0x0008
     7a0:	0501                	.insn	2, 0x0501
     7a2:	0316                	.insn	2, 0x0316
     7a4:	0900                	.insn	2, 0x0900
     7a6:	0004                	.insn	2, 0x0004
     7a8:	0301                	.insn	2, 0x0301
     7aa:	7dba                	.insn	2, 0x7dba
     7ac:	0409                	.insn	2, 0x0409
     7ae:	0100                	.insn	2, 0x0100
     7b0:	3b05                	.insn	2, 0x3b05
     7b2:	0306                	.insn	2, 0x0306
     7b4:	02ca                	.insn	2, 0x02ca
     7b6:	0c09                	.insn	2, 0x0c09
     7b8:	0100                	.insn	2, 0x0100
     7ba:	0306                	.insn	2, 0x0306
     7bc:	7db6                	.insn	2, 0x7db6
     7be:	0809                	.insn	2, 0x0809
     7c0:	0100                	.insn	2, 0x0100
     7c2:	1205                	.insn	2, 0x1205
     7c4:	0306                	.insn	2, 0x0306
     7c6:	080902cb          	.insn	4, 0x080902cb
     7ca:	0100                	.insn	2, 0x0100
     7cc:	0505                	.insn	2, 0x0505
     7ce:	0900f403          	.insn	4, 0x0900f403
     7d2:	0004                	.insn	2, 0x0004
     7d4:	0501                	.insn	2, 0x0501
     7d6:	030a                	.insn	2, 0x030a
     7d8:	7f85                	.insn	2, 0x7f85
     7da:	1009                	.insn	2, 0x1009
     7dc:	0100                	.insn	2, 0x0100
     7de:	2105                	.insn	2, 0x2105
     7e0:	0306                	.insn	2, 0x0306
     7e2:	0900                	.insn	2, 0x0900
     7e4:	0004                	.insn	2, 0x0004
     7e6:	0501                	.insn	2, 0x0501
     7e8:	0309                	.insn	2, 0x0309
     7ea:	0900                	.insn	2, 0x0900
     7ec:	0004                	.insn	2, 0x0004
     7ee:	0501                	.insn	2, 0x0501
     7f0:	060a                	.insn	2, 0x060a
     7f2:	097ebc03          	.insn	4, 0x097ebc03
     7f6:	0004                	.insn	2, 0x0004
     7f8:	0501                	.insn	2, 0x0501
     7fa:	0609                	.insn	2, 0x0609
     7fc:	08090003          	lb	zero,128(s2)
     800:	0100                	.insn	2, 0x0100
     802:	1505                	.insn	2, 0x1505
     804:	0306                	.insn	2, 0x0306
     806:	0905                	.insn	2, 0x0905
     808:	0004                	.insn	2, 0x0004
     80a:	0601                	.insn	2, 0x0601
     80c:	097efb03          	.insn	4, 0x097efb03
     810:	000c                	.insn	2, 0x000c
     812:	0601                	.insn	2, 0x0601
     814:	09018203          	lb	tp,144(gp)
     818:	0004                	.insn	2, 0x0004
     81a:	0601                	.insn	2, 0x0601
     81c:	097efe03          	.insn	4, 0x097efe03
     820:	000c                	.insn	2, 0x000c
     822:	0501                	.insn	2, 0x0501
     824:	0610                	.insn	2, 0x0610
     826:	09018603          	lb	a2,144(gp)
     82a:	0004                	.insn	2, 0x0004
     82c:	0501                	.insn	2, 0x0501
     82e:	0314                	.insn	2, 0x0314
     830:	0902                	.insn	2, 0x0902
     832:	0008                	.insn	2, 0x0008
     834:	0501                	.insn	2, 0x0501
     836:	0310                	.insn	2, 0x0310
     838:	097e                	.insn	2, 0x097e
     83a:	0008                	.insn	2, 0x0008
     83c:	0501                	.insn	2, 0x0501
     83e:	0309                	.insn	2, 0x0309
     840:	0902                	.insn	2, 0x0902
     842:	0004                	.insn	2, 0x0004
     844:	0301                	.insn	2, 0x0301
     846:	0901                	.insn	2, 0x0901
     848:	0004                	.insn	2, 0x0004
     84a:	0501                	.insn	2, 0x0501
     84c:	0305                	.insn	2, 0x0305
     84e:	0902                	.insn	2, 0x0902
     850:	0020                	.insn	2, 0x0020
     852:	0501                	.insn	2, 0x0501
     854:	0330                	.insn	2, 0x0330
     856:	140901bb          	.insn	4, 0x140901bb
     85a:	0100                	.insn	2, 0x0100
     85c:	3705                	.insn	2, 0x3705
     85e:	0306                	.insn	2, 0x0306
     860:	0900                	.insn	2, 0x0900
     862:	0008                	.insn	2, 0x0008
     864:	0501                	.insn	2, 0x0501
     866:	0316                	.insn	2, 0x0316
     868:	0900                	.insn	2, 0x0900
     86a:	0004                	.insn	2, 0x0004
     86c:	0501                	.insn	2, 0x0501
     86e:	0403063b          	.insn	4, 0x0403063b
     872:	0409                	.insn	2, 0x0409
     874:	0100                	.insn	2, 0x0100
     876:	0306                	.insn	2, 0x0306
     878:	7db6                	.insn	2, 0x7db6
     87a:	0809                	.insn	2, 0x0809
     87c:	0100                	.insn	2, 0x0100
     87e:	1205                	.insn	2, 0x1205
     880:	0306                	.insn	2, 0x0306
     882:	080902cb          	.insn	4, 0x080902cb
     886:	0100                	.insn	2, 0x0100
     888:	0f05                	.insn	2, 0x0f05
     88a:	09018103          	lb	sp,144(gp)
     88e:	0004                	.insn	2, 0x0004
     890:	0501                	.insn	2, 0x0501
     892:	0309                	.insn	2, 0x0309
     894:	0901                	.insn	2, 0x0901
     896:	0008                	.insn	2, 0x0008
     898:	0601                	.insn	2, 0x0601
     89a:	097cb303          	.insn	4, 0x097cb303
     89e:	0010                	.insn	2, 0x0010
     8a0:	0501                	.insn	2, 0x0501
     8a2:	0639                	.insn	2, 0x0639
     8a4:	0903d803          	lhu	a6,144(t2)
     8a8:	002c                	.insn	2, 0x002c
     8aa:	0501                	.insn	2, 0x0501
     8ac:	060d                	.insn	2, 0x060d
     8ae:	04090003          	lb	zero,64(s2)
     8b2:	0100                	.insn	2, 0x0100
     8b4:	1f05                	.insn	2, 0x1f05
     8b6:	0306                	.insn	2, 0x0306
     8b8:	0904                	.insn	2, 0x0904
     8ba:	000c                	.insn	2, 0x000c
     8bc:	0501                	.insn	2, 0x0501
     8be:	030d                	.insn	2, 0x030d
     8c0:	097f 0004 0501 0336 	.insn	10, 0x0976033605010004097f
     8c8:	0976 
     8ca:	0014                	.insn	2, 0x0014
     8cc:	0501                	.insn	2, 0x0501
     8ce:	0624                	.insn	2, 0x0624
     8d0:	04090003          	lb	zero,64(s2)
     8d4:	0100                	.insn	2, 0x0100
     8d6:	0905                	.insn	2, 0x0905
     8d8:	08090003          	lb	zero,128(s2)
     8dc:	0100                	.insn	2, 0x0100
     8de:	0a05                	.insn	2, 0x0a05
     8e0:	0306                	.insn	2, 0x0306
     8e2:	04097daf          	.insn	4, 0x04097daf
     8e6:	0100                	.insn	2, 0x0100
     8e8:	0905                	.insn	2, 0x0905
     8ea:	0306                	.insn	2, 0x0306
     8ec:	0900                	.insn	2, 0x0900
     8ee:	0004                	.insn	2, 0x0004
     8f0:	0501                	.insn	2, 0x0501
     8f2:	0615                	.insn	2, 0x0615
     8f4:	04090503          	lb	a0,64(s2)
     8f8:	0100                	.insn	2, 0x0100
     8fa:	08097d03          	.insn	4, 0x08097d03
     8fe:	0100                	.insn	2, 0x0100
     900:	1005                	.insn	2, 0x1005
     902:	0c090403          	lb	s0,192(s2)
     906:	0100                	.insn	2, 0x0100
     908:	0905                	.insn	2, 0x0905
     90a:	0c090203          	lb	tp,192(s2)
     90e:	0100                	.insn	2, 0x0100
     910:	0505                	.insn	2, 0x0505
     912:	04090303          	lb	t1,64(s2)
     916:	0100                	.insn	2, 0x0100
     918:	0306                	.insn	2, 0x0306
     91a:	7ef5                	.insn	2, 0x7ef5
     91c:	1409                	.insn	2, 0x1409
     91e:	0100                	.insn	2, 0x0100
     920:	2005                	.insn	2, 0x2005
     922:	0306                	.insn	2, 0x0306
     924:	03d6                	.insn	2, 0x03d6
     926:	0409                	.insn	2, 0x0409
     928:	0100                	.insn	2, 0x0100
     92a:	0306                	.insn	2, 0x0306
     92c:	7caa                	.insn	2, 0x7caa
     92e:	0409                	.insn	2, 0x0409
     930:	0100                	.insn	2, 0x0100
     932:	0905                	.insn	2, 0x0905
     934:	0306                	.insn	2, 0x0306
     936:	0189                	.insn	2, 0x0189
     938:	0809                	.insn	2, 0x0809
     93a:	0100                	.insn	2, 0x0100
     93c:	0902d803          	lhu	a6,144(t0)
     940:	0020                	.insn	2, 0x0020
     942:	0601                	.insn	2, 0x0601
     944:	097c9f03          	lh	t5,151(s9)
     948:	0010                	.insn	2, 0x0010
     94a:	0501                	.insn	2, 0x0501
     94c:	060a                	.insn	2, 0x060a
     94e:	09018003          	lb	zero,144(gp)
     952:	002c                	.insn	2, 0x002c
     954:	0501                	.insn	2, 0x0501
     956:	0609                	.insn	2, 0x0609
     958:	04090003          	lb	zero,64(s2)
     95c:	0100                	.insn	2, 0x0100
     95e:	1505                	.insn	2, 0x1505
     960:	0306                	.insn	2, 0x0306
     962:	0905                	.insn	2, 0x0905
     964:	0004                	.insn	2, 0x0004
     966:	0301                	.insn	2, 0x0301
     968:	097d                	.insn	2, 0x097d
     96a:	0008                	.insn	2, 0x0008
     96c:	0501                	.insn	2, 0x0501
     96e:	0310                	.insn	2, 0x0310
     970:	0904                	.insn	2, 0x0904
     972:	0008                	.insn	2, 0x0008
     974:	0501                	.insn	2, 0x0501
     976:	0309                	.insn	2, 0x0309
     978:	0902                	.insn	2, 0x0902
     97a:	0008                	.insn	2, 0x0008
     97c:	0501                	.insn	2, 0x0501
     97e:	0305                	.insn	2, 0x0305
     980:	00040903          	lb	s2,0(s0)
     984:	0501                	.insn	2, 0x0501
     986:	030d                	.insn	2, 0x030d
     988:	02e4                	.insn	2, 0x02e4
     98a:	1409                	.insn	2, 0x1409
     98c:	0100                	.insn	2, 0x0100
     98e:	1005                	.insn	2, 0x1005
     990:	18097a03          	.insn	4, 0x18097a03
     994:	0100                	.insn	2, 0x0100
     996:	08090103          	lb	sp,128(s2)
     99a:	0100                	.insn	2, 0x0100
     99c:	0905                	.insn	2, 0x0905
     99e:	04097e03          	.insn	4, 0x04097e03
     9a2:	0100                	.insn	2, 0x0100
     9a4:	0d05                	.insn	2, 0x0d05
     9a6:	097ef603          	.insn	4, 0x097ef603
     9aa:	0004                	.insn	2, 0x0004
     9ac:	0601                	.insn	2, 0x0601
     9ae:	097da203          	lw	tp,151(s11)
     9b2:	0010                	.insn	2, 0x0010
     9b4:	0501                	.insn	2, 0x0501
     9b6:	061a                	.insn	2, 0x061a
     9b8:	0903f803          	.insn	4, 0x0903f803
     9bc:	0004                	.insn	2, 0x0004
     9be:	0501                	.insn	2, 0x0501
     9c0:	0616                	.insn	2, 0x0616
     9c2:	04090003          	lb	zero,64(s2)
     9c6:	0100                	.insn	2, 0x0100
     9c8:	0306                	.insn	2, 0x0306
     9ca:	0901                	.insn	2, 0x0901
     9cc:	0008                	.insn	2, 0x0008
     9ce:	0301                	.insn	2, 0x0301
     9d0:	0901                	.insn	2, 0x0901
     9d2:	0008                	.insn	2, 0x0008
     9d4:	0301                	.insn	2, 0x0301
     9d6:	0901                	.insn	2, 0x0901
     9d8:	0004                	.insn	2, 0x0004
     9da:	0501                	.insn	2, 0x0501
     9dc:	0305                	.insn	2, 0x0305
     9de:	0901                	.insn	2, 0x0901
     9e0:	0004                	.insn	2, 0x0004
     9e2:	0301                	.insn	2, 0x0301
     9e4:	0902                	.insn	2, 0x0902
     9e6:	0010                	.insn	2, 0x0010
     9e8:	0601                	.insn	2, 0x0601
     9ea:	097c8203          	lb	tp,151(s9)
     9ee:	000c                	.insn	2, 0x000c
     9f0:	0b01                	.insn	2, 0x0b01
     9f2:	0903fe03          	.insn	4, 0x0903fe03
     9f6:	002c                	.insn	2, 0x002c
     9f8:	0501                	.insn	2, 0x0501
     9fa:	0609                	.insn	2, 0x0609
     9fc:	097d8b03          	lb	s6,151(s11)
     a00:	0008                	.insn	2, 0x0008
     a02:	0501                	.insn	2, 0x0501
     a04:	0300                	.insn	2, 0x0300
     a06:	02f9                	.insn	2, 0x02f9
     a08:	2009                	.insn	2, 0x2009
     a0a:	0100                	.insn	2, 0x0100
     a0c:	1c05                	.insn	2, 0x1c05
     a0e:	030a                	.insn	2, 0x030a
     a10:	000c0903          	lb	s2,0(s8)
     a14:	0501                	.insn	2, 0x0501
     a16:	0902033f 05010004 	.insn	8, 0x050100040902033f
     a1e:	09010313          	addi	t1,sp,144
     a22:	0014                	.insn	2, 0x0014
     a24:	0501                	.insn	2, 0x0501
     a26:	031c                	.insn	2, 0x031c
     a28:	097d                	.insn	2, 0x097d
     a2a:	001c                	.insn	2, 0x001c
     a2c:	0601                	.insn	2, 0x0601
     a2e:	097bfb03          	.insn	4, 0x097bfb03
     a32:	0004                	.insn	2, 0x0004
     a34:	0501                	.insn	2, 0x0501
     a36:	062a                	.insn	2, 0x062a
     a38:	09048803          	lb	a6,144(s1)
     a3c:	0004                	.insn	2, 0x0004
     a3e:	0501                	.insn	2, 0x0501
     a40:	00030633          	add	a2,t1,zero
     a44:	0409                	.insn	2, 0x0409
     a46:	0100                	.insn	2, 0x0100
     a48:	0d05                	.insn	2, 0x0d05
     a4a:	04090003          	lb	zero,64(s2)
     a4e:	0100                	.insn	2, 0x0100
     a50:	3a05                	.insn	2, 0x3a05
     a52:	0306                	.insn	2, 0x0306
     a54:	097f 0004 0501 063f 	.insn	10, 0x0003063f05010004097f
     a5c:	0003 
     a5e:	0409                	.insn	2, 0x0409
     a60:	0100                	.insn	2, 0x0100
     a62:	1305                	.insn	2, 0x1305
     a64:	0306                	.insn	2, 0x0306
     a66:	0901                	.insn	2, 0x0901
     a68:	0014                	.insn	2, 0x0014
     a6a:	0501                	.insn	2, 0x0501
     a6c:	062a                	.insn	2, 0x062a
     a6e:	14090003          	lb	zero,320(s2)
     a72:	0100                	.insn	2, 0x0100
     a74:	2105                	.insn	2, 0x2105
     a76:	0306                	.insn	2, 0x0306
     a78:	097f 0004 0501 0333 	.insn	10, 0x0901033305010004097f
     a80:	0901 
     a82:	000c                	.insn	2, 0x000c
     a84:	0501                	.insn	2, 0x0501
     a86:	060d                	.insn	2, 0x060d
     a88:	04090003          	lb	zero,64(s2)
     a8c:	0100                	.insn	2, 0x0100
     a8e:	3a05                	.insn	2, 0x3a05
     a90:	0306                	.insn	2, 0x0306
     a92:	097f 0004 0501 063f 	.insn	10, 0x0003063f05010004097f
     a9a:	0003 
     a9c:	0409                	.insn	2, 0x0409
     a9e:	0100                	.insn	2, 0x0100
     aa0:	1305                	.insn	2, 0x1305
     aa2:	0306                	.insn	2, 0x0306
     aa4:	0901                	.insn	2, 0x0901
     aa6:	0014                	.insn	2, 0x0014
     aa8:	0501                	.insn	2, 0x0501
     aaa:	062a                	.insn	2, 0x062a
     aac:	20090003          	lb	zero,512(s2)
     ab0:	0100                	.insn	2, 0x0100
     ab2:	3305                	.insn	2, 0x3305
     ab4:	04090003          	lb	zero,64(s2)
     ab8:	0100                	.insn	2, 0x0100
     aba:	0d05                	.insn	2, 0x0d05
     abc:	04090003          	lb	zero,64(s2)
     ac0:	0100                	.insn	2, 0x0100
     ac2:	3a05                	.insn	2, 0x3a05
     ac4:	0306                	.insn	2, 0x0306
     ac6:	097f 0004 0501 063f 	.insn	10, 0x0003063f05010004097f
     ace:	0003 
     ad0:	0409                	.insn	2, 0x0409
     ad2:	0100                	.insn	2, 0x0100
     ad4:	1305                	.insn	2, 0x1305
     ad6:	0306                	.insn	2, 0x0306
     ad8:	0901                	.insn	2, 0x0901
     ada:	0014                	.insn	2, 0x0014
     adc:	0501                	.insn	2, 0x0501
     ade:	062a                	.insn	2, 0x062a
     ae0:	14090003          	lb	zero,320(s2)
     ae4:	0100                	.insn	2, 0x0100
     ae6:	2105                	.insn	2, 0x2105
     ae8:	0306                	.insn	2, 0x0306
     aea:	097f 0004 0501 0333 	.insn	10, 0x0901033305010004097f
     af2:	0901 
     af4:	000c                	.insn	2, 0x000c
     af6:	0501                	.insn	2, 0x0501
     af8:	060d                	.insn	2, 0x060d
     afa:	04090003          	lb	zero,64(s2)
     afe:	0100                	.insn	2, 0x0100
     b00:	3a05                	.insn	2, 0x3a05
     b02:	0306                	.insn	2, 0x0306
     b04:	097f 0004 0501 063f 	.insn	10, 0x0003063f05010004097f
     b0c:	0003 
     b0e:	0409                	.insn	2, 0x0409
     b10:	0100                	.insn	2, 0x0100
     b12:	1305                	.insn	2, 0x1305
     b14:	0306                	.insn	2, 0x0306
     b16:	0901                	.insn	2, 0x0901
     b18:	0014                	.insn	2, 0x0014
     b1a:	0501                	.insn	2, 0x0501
     b1c:	062a                	.insn	2, 0x062a
     b1e:	20090003          	lb	zero,512(s2)
     b22:	0100                	.insn	2, 0x0100
     b24:	3305                	.insn	2, 0x3305
     b26:	04090003          	lb	zero,64(s2)
     b2a:	0100                	.insn	2, 0x0100
     b2c:	0d05                	.insn	2, 0x0d05
     b2e:	04090003          	lb	zero,64(s2)
     b32:	0100                	.insn	2, 0x0100
     b34:	3a05                	.insn	2, 0x3a05
     b36:	0306                	.insn	2, 0x0306
     b38:	097f 0004 0501 063f 	.insn	10, 0x0003063f05010004097f
     b40:	0003 
     b42:	0409                	.insn	2, 0x0409
     b44:	0100                	.insn	2, 0x0100
     b46:	1305                	.insn	2, 0x1305
     b48:	0306                	.insn	2, 0x0306
     b4a:	0901                	.insn	2, 0x0901
     b4c:	0014                	.insn	2, 0x0014
     b4e:	0501                	.insn	2, 0x0501
     b50:	062a                	.insn	2, 0x062a
     b52:	14090003          	lb	zero,320(s2)
     b56:	0100                	.insn	2, 0x0100
     b58:	2105                	.insn	2, 0x2105
     b5a:	0306                	.insn	2, 0x0306
     b5c:	097f 0004 0501 0333 	.insn	10, 0x0901033305010004097f
     b64:	0901 
     b66:	000c                	.insn	2, 0x000c
     b68:	0501                	.insn	2, 0x0501
     b6a:	060d                	.insn	2, 0x060d
     b6c:	04090003          	lb	zero,64(s2)
     b70:	0100                	.insn	2, 0x0100
     b72:	3a05                	.insn	2, 0x3a05
     b74:	0306                	.insn	2, 0x0306
     b76:	097f 0004 0501 063f 	.insn	10, 0x0003063f05010004097f
     b7e:	0003 
     b80:	0409                	.insn	2, 0x0409
     b82:	0100                	.insn	2, 0x0100
     b84:	1305                	.insn	2, 0x1305
     b86:	0306                	.insn	2, 0x0306
     b88:	0901                	.insn	2, 0x0901
     b8a:	0014                	.insn	2, 0x0014
     b8c:	0501                	.insn	2, 0x0501
     b8e:	062a                	.insn	2, 0x062a
     b90:	20090003          	lb	zero,512(s2)
     b94:	0100                	.insn	2, 0x0100
     b96:	3305                	.insn	2, 0x3305
     b98:	04090003          	lb	zero,64(s2)
     b9c:	0100                	.insn	2, 0x0100
     b9e:	0d05                	.insn	2, 0x0d05
     ba0:	04090003          	lb	zero,64(s2)
     ba4:	0100                	.insn	2, 0x0100
     ba6:	3a05                	.insn	2, 0x3a05
     ba8:	0306                	.insn	2, 0x0306
     baa:	097f 0004 0501 063f 	.insn	10, 0x0003063f05010004097f
     bb2:	0003 
     bb4:	0409                	.insn	2, 0x0409
     bb6:	0100                	.insn	2, 0x0100
     bb8:	1305                	.insn	2, 0x1305
     bba:	0306                	.insn	2, 0x0306
     bbc:	0901                	.insn	2, 0x0901
     bbe:	0014                	.insn	2, 0x0014
     bc0:	0501                	.insn	2, 0x0501
     bc2:	062a                	.insn	2, 0x062a
     bc4:	14090003          	lb	zero,320(s2)
     bc8:	0100                	.insn	2, 0x0100
     bca:	2105                	.insn	2, 0x2105
     bcc:	0306                	.insn	2, 0x0306
     bce:	097f 0004 0501 0333 	.insn	10, 0x0901033305010004097f
     bd6:	0901 
     bd8:	000c                	.insn	2, 0x000c
     bda:	0501                	.insn	2, 0x0501
     bdc:	060d                	.insn	2, 0x060d
     bde:	04090003          	lb	zero,64(s2)
     be2:	0100                	.insn	2, 0x0100
     be4:	097bf803          	.insn	4, 0x097bf803
     be8:	0004                	.insn	2, 0x0004
     bea:	0501                	.insn	2, 0x0501
     bec:	0609                	.insn	2, 0x0609
     bee:	09049003          	lh	zero,144(s1)
     bf2:	0004                	.insn	2, 0x0004
     bf4:	0501                	.insn	2, 0x0501
     bf6:	0301                	.insn	2, 0x0301
     bf8:	091d                	.insn	2, 0x091d
     bfa:	0004                	.insn	2, 0x0004
     bfc:	0501                	.insn	2, 0x0501
     bfe:	0335                	.insn	2, 0x0335
     c00:	000c0973          	.insn	4, 0x000c0973
     c04:	0501                	.insn	2, 0x0501
     c06:	0312                	.insn	2, 0x0312
     c08:	0975                	.insn	2, 0x0975
     c0a:	0004                	.insn	2, 0x0004
     c0c:	0501                	.insn	2, 0x0501
     c0e:	0340                	.insn	2, 0x0340
     c10:	0008090b          	.insn	4, 0x0008090b
     c14:	0501                	.insn	2, 0x0501
     c16:	0621                	.insn	2, 0x0621
     c18:	08090003          	lb	zero,128(s2)
     c1c:	0100                	.insn	2, 0x0100
     c1e:	2705                	.insn	2, 0x2705
     c20:	0306                	.insn	2, 0x0306
     c22:	0901                	.insn	2, 0x0901
     c24:	000c                	.insn	2, 0x000c
     c26:	0501                	.insn	2, 0x0501
     c28:	0305                	.insn	2, 0x0305
     c2a:	0978                	.insn	2, 0x0978
     c2c:	0004                	.insn	2, 0x0004
     c2e:	0501                	.insn	2, 0x0501
     c30:	0910031b          	.insn	4, 0x0910031b
     c34:	0010                	.insn	2, 0x0010
     c36:	0501                	.insn	2, 0x0501
     c38:	0626                	.insn	2, 0x0626
     c3a:	04090003          	lb	zero,64(s2)
     c3e:	0100                	.insn	2, 0x0100
     c40:	0505                	.insn	2, 0x0505
     c42:	04090003          	lb	zero,64(s2)
     c46:	0100                	.insn	2, 0x0100
     c48:	0a06                	.insn	2, 0x0a06
     c4a:	08090803          	lb	a6,128(s2)
     c4e:	0100                	.insn	2, 0x0100
     c50:	0005                	.insn	2, 0x0005
     c52:	0c091003          	lh	zero,192(s2)
     c56:	0100                	.insn	2, 0x0100
     c58:	1005                	.insn	2, 0x1005
     c5a:	030a                	.insn	2, 0x030a
     c5c:	0901                	.insn	2, 0x0901
     c5e:	0008                	.insn	2, 0x0008
     c60:	0501                	.insn	2, 0x0501
     c62:	0605                	.insn	2, 0x0605
     c64:	28090003          	lb	zero,640(s2)
     c68:	0100                	.insn	2, 0x0100
     c6a:	1d05                	.insn	2, 0x1d05
     c6c:	0306                	.insn	2, 0x0306
     c6e:	00240903          	lb	s2,2(s0)
     c72:	0601                	.insn	2, 0x0601
     c74:	097bbb03          	.insn	4, 0x097bbb03
     c78:	0004                	.insn	2, 0x0004
     c7a:	0401                	.insn	2, 0x0401
     c7c:	0505                	.insn	2, 0x0505
     c7e:	060c                	.insn	2, 0x060c
     c80:	04092103          	lw	sp,64(s2)
     c84:	0100                	.insn	2, 0x0100
     c86:	0104                	.insn	2, 0x0104
     c88:	0005                	.insn	2, 0x0005
     c8a:	04093a03          	.insn	4, 0x04093a03
     c8e:	0100                	.insn	2, 0x0100
     c90:	0505                	.insn	2, 0x0505
     c92:	0306                	.insn	2, 0x0306
     c94:	0900                	.insn	2, 0x0900
     c96:	0004                	.insn	2, 0x0004
     c98:	0501                	.insn	2, 0x0501
     c9a:	0609                	.insn	2, 0x0609
     c9c:	04090103          	lb	sp,64(s2)
     ca0:	0100                	.insn	2, 0x0100
     ca2:	1c05                	.insn	2, 0x1c05
     ca4:	0903fb03          	.insn	4, 0x0903fb03
     ca8:	0008                	.insn	2, 0x0008
     caa:	0501                	.insn	2, 0x0501
     cac:	060d                	.insn	2, 0x060d
     cae:	0900030b          	.insn	4, 0x0900030b
     cb2:	002c                	.insn	2, 0x002c
     cb4:	0501                	.insn	2, 0x0501
     cb6:	0703062f          	.insn	4, 0x0703062f
     cba:	0c09                	.insn	2, 0x0c09
     cbc:	0100                	.insn	2, 0x0100
     cbe:	28090203          	lb	tp,640(s2)
     cc2:	0100                	.insn	2, 0x0100
     cc4:	2a05                	.insn	2, 0x2a05
     cc6:	24090203          	lb	tp,576(s2)
     cca:	0100                	.insn	2, 0x0100
     ccc:	2f05                	.insn	2, 0x2f05
     cce:	04097e03          	.insn	4, 0x04097e03
     cd2:	0100                	.insn	2, 0x0100
     cd4:	2a05                	.insn	2, 0x2a05
     cd6:	04090203          	lb	tp,64(s2)
     cda:	0100                	.insn	2, 0x0100
     cdc:	1d05                	.insn	2, 0x1d05
     cde:	18090203          	lb	tp,384(s2)
     ce2:	0100                	.insn	2, 0x0100
     ce4:	2a05                	.insn	2, 0x2a05
     ce6:	04097e03          	.insn	4, 0x04097e03
     cea:	0100                	.insn	2, 0x0100
     cec:	0d05                	.insn	2, 0x0d05
     cee:	0c090403          	lb	s0,192(s2)
     cf2:	0100                	.insn	2, 0x0100
     cf4:	0b06                	.insn	2, 0x0b06
     cf6:	08090003          	lb	zero,128(s2)
     cfa:	0100                	.insn	2, 0x0100
     cfc:	0306                	.insn	2, 0x0306
     cfe:	000c092b          	.insn	4, 0x000c092b
     d02:	0401                	.insn	2, 0x0401
     d04:	0505                	.insn	2, 0x0505
     d06:	031f 7b8d 2009      	.insn	6, 0x20097b8d031f
     d0c:	0100                	.insn	2, 0x0100
     d0e:	0306                	.insn	2, 0x0306
     d10:	0962                	.insn	2, 0x0962
     d12:	0008                	.insn	2, 0x0008
     d14:	0501                	.insn	2, 0x0501
     d16:	060c                	.insn	2, 0x060c
     d18:	04092103          	lw	sp,64(s2)
     d1c:	0100                	.insn	2, 0x0100
     d1e:	0104                	.insn	2, 0x0104
     d20:	3005                	.insn	2, 0x3005
     d22:	0900c303          	lbu	t1,144(ra)
     d26:	0004                	.insn	2, 0x0004
     d28:	0501                	.insn	2, 0x0501
     d2a:	0605                	.insn	2, 0x0605
     d2c:	04090003          	lb	zero,64(s2)
     d30:	0100                	.insn	2, 0x0100
     d32:	0905                	.insn	2, 0x0905
     d34:	0306                	.insn	2, 0x0306
     d36:	0901                	.insn	2, 0x0901
     d38:	0004                	.insn	2, 0x0004
     d3a:	0401                	.insn	2, 0x0401
     d3c:	0505                	.insn	2, 0x0505
     d3e:	030c                	.insn	2, 0x030c
     d40:	7fbc                	.insn	2, 0x7fbc
     d42:	0809                	.insn	2, 0x0809
     d44:	0100                	.insn	2, 0x0100
     d46:	0104                	.insn	2, 0x0104
     d48:	1b05                	.insn	2, 0x1b05
     d4a:	0904ac03          	lw	s8,144(s1)
     d4e:	0004                	.insn	2, 0x0004
     d50:	0601                	.insn	2, 0x0601
     d52:	097bb303          	.insn	4, 0x097bb303
     d56:	0010                	.insn	2, 0x0010
     d58:	0501                	.insn	2, 0x0501
     d5a:	0601                	.insn	2, 0x0601
     d5c:	0594030b          	.insn	4, 0x0594030b
     d60:	0409                	.insn	2, 0x0409
     d62:	0100                	.insn	2, 0x0100
     d64:	2705                	.insn	2, 0x2705
     d66:	08095803          	lhu	a6,128(s2)
     d6a:	0100                	.insn	2, 0x0100
     d6c:	0d05                	.insn	2, 0x0d05
     d6e:	0b06                	.insn	2, 0x0b06
     d70:	2c090003          	lb	zero,704(s2)
     d74:	0100                	.insn	2, 0x0100
     d76:	2c05                	.insn	2, 0x2c05
     d78:	0306                	.insn	2, 0x0306
     d7a:	0906                	.insn	2, 0x0906
     d7c:	000c                	.insn	2, 0x000c
     d7e:	0501                	.insn	2, 0x0501
     d80:	0329                	.insn	2, 0x0329
     d82:	0901                	.insn	2, 0x0901
     d84:	0008                	.insn	2, 0x0008
     d86:	0501                	.insn	2, 0x0501
     d88:	032c                	.insn	2, 0x032c
     d8a:	097f 0008 0501 0329 	.insn	10, 0x0901032905010008097f
     d92:	0901 
     d94:	0008                	.insn	2, 0x0008
     d96:	0501                	.insn	2, 0x0501
     d98:	032c                	.insn	2, 0x032c
     d9a:	097f 0010 0501 0329 	.insn	10, 0x0901032905010010097f
     da2:	0901 
     da4:	0008                	.insn	2, 0x0008
     da6:	0501                	.insn	2, 0x0501
     da8:	032c                	.insn	2, 0x032c
     daa:	097f 000c 0501 0329 	.insn	10, 0x090103290501000c097f
     db2:	0901 
     db4:	0008                	.insn	2, 0x0008
     db6:	0601                	.insn	2, 0x0601
     db8:	097b8d03          	lb	s10,151(s7)
     dbc:	0004                	.insn	2, 0x0004
     dbe:	0501                	.insn	2, 0x0501
     dc0:	062c                	.insn	2, 0x062c
     dc2:	0904f203          	.insn	4, 0x0904f203
     dc6:	0004                	.insn	2, 0x0004
     dc8:	0601                	.insn	2, 0x0601
     dca:	097b8e03          	lb	t3,151(s7)
     dce:	0004                	.insn	2, 0x0004
     dd0:	0501                	.insn	2, 0x0501
     dd2:	0611                	.insn	2, 0x0611
     dd4:	0904f503          	.insn	4, 0x0904f503
     dd8:	0004                	.insn	2, 0x0004
     dda:	0601                	.insn	2, 0x0601
     ddc:	097b8b03          	lb	s6,151(s7)
     de0:	0004                	.insn	2, 0x0004
     de2:	0301                	.insn	2, 0x0301
     de4:	04f5                	.insn	2, 0x04f5
     de6:	0809                	.insn	2, 0x0809
     de8:	0100                	.insn	2, 0x0100
     dea:	097b8b03          	lb	s6,151(s7)
     dee:	0004                	.insn	2, 0x0004
     df0:	0501                	.insn	2, 0x0501
     df2:	060d                	.insn	2, 0x060d
     df4:	0904fb03          	.insn	4, 0x0904fb03
     df8:	0004                	.insn	2, 0x0004
     dfa:	0601                	.insn	2, 0x0601
     dfc:	0900030b          	.insn	4, 0x0900030b
     e00:	0008                	.insn	2, 0x0008
     e02:	0501                	.insn	2, 0x0501
     e04:	062d                	.insn	2, 0x062d
     e06:	0c090d03          	lb	s10,192(s2)
     e0a:	0100                	.insn	2, 0x0100
     e0c:	3b05                	.insn	2, 0x3b05
     e0e:	0306                	.insn	2, 0x0306
     e10:	0900                	.insn	2, 0x0900
     e12:	0008                	.insn	2, 0x0008
     e14:	0501                	.insn	2, 0x0501
     e16:	030d                	.insn	2, 0x030d
     e18:	0900                	.insn	2, 0x0900
     e1a:	0004                	.insn	2, 0x0004
     e1c:	0501                	.insn	2, 0x0501
     e1e:	0605                	.insn	2, 0x0605
     e20:	097fa903          	lw	s2,151(t6)
     e24:	0010                	.insn	2, 0x0010
     e26:	0501                	.insn	2, 0x0501
     e28:	0300                	.insn	2, 0x0300
     e2a:	00f6                	.insn	2, 0x00f6
     e2c:	0c09                	.insn	2, 0x0c09
     e2e:	0100                	.insn	2, 0x0100
     e30:	1705                	.insn	2, 0x1705
     e32:	030a                	.insn	2, 0x030a
     e34:	0901                	.insn	2, 0x0901
     e36:	000c                	.insn	2, 0x000c
     e38:	0301                	.insn	2, 0x0301
     e3a:	0901                	.insn	2, 0x0901
     e3c:	0004                	.insn	2, 0x0004
     e3e:	0301                	.insn	2, 0x0301
     e40:	0901                	.insn	2, 0x0901
     e42:	0004                	.insn	2, 0x0004
     e44:	0501                	.insn	2, 0x0501
     e46:	0318                	.insn	2, 0x0318
     e48:	0901                	.insn	2, 0x0901
     e4a:	0004                	.insn	2, 0x0004
     e4c:	0501                	.insn	2, 0x0501
     e4e:	0309                	.insn	2, 0x0309
     e50:	0902                	.insn	2, 0x0902
     e52:	0004                	.insn	2, 0x0004
     e54:	0601                	.insn	2, 0x0601
     e56:	097ad303          	lhu	t1,151(s5)
     e5a:	0004                	.insn	2, 0x0004
     e5c:	0301                	.insn	2, 0x0301
     e5e:	05ad                	.insn	2, 0x05ad
     e60:	0409                	.insn	2, 0x0409
     e62:	0100                	.insn	2, 0x0100
     e64:	0306                	.insn	2, 0x0306
     e66:	0901                	.insn	2, 0x0901
     e68:	0004                	.insn	2, 0x0004
     e6a:	0501                	.insn	2, 0x0501
     e6c:	030e                	.insn	2, 0x030e
     e6e:	0901                	.insn	2, 0x0901
     e70:	0008                	.insn	2, 0x0008
     e72:	0501                	.insn	2, 0x0501
     e74:	0309                	.insn	2, 0x0309
     e76:	0901                	.insn	2, 0x0901
     e78:	0004                	.insn	2, 0x0004
     e7a:	0501                	.insn	2, 0x0501
     e7c:	0b01                	.insn	2, 0x0b01
     e7e:	0c090e03          	lb	t3,192(s2)
     e82:	0100                	.insn	2, 0x0100
     e84:	0905                	.insn	2, 0x0905
     e86:	08097a03          	.insn	4, 0x08097a03
     e8a:	0100                	.insn	2, 0x0100
     e8c:	0505                	.insn	2, 0x0505
     e8e:	24090403          	lb	s0,576(s2)
     e92:	0100                	.insn	2, 0x0100
     e94:	2409                	.insn	2, 0x2409
     e96:	0000                	.insn	2, 0x0000
     e98:	0101                	.insn	2, 0x0101
     e9a:	0500                	.insn	2, 0x0500
     e9c:	f002                	.insn	2, 0xf002
     e9e:	2011                	.insn	2, 0x2011
     ea0:	0300                	.insn	2, 0x0300
     ea2:	05dc                	.insn	2, 0x05dc
     ea4:	0501                	.insn	2, 0x0501
     ea6:	0a25                	.insn	2, 0x0a25
     ea8:	34090503          	lb	a0,832(s2)
     eac:	0100                	.insn	2, 0x0100
     eae:	2805                	.insn	2, 0x2805
     eb0:	04090103          	lb	sp,64(s2)
     eb4:	0100                	.insn	2, 0x0100
     eb6:	0505                	.insn	2, 0x0505
     eb8:	04090503          	lb	a0,64(s2)
     ebc:	0100                	.insn	2, 0x0100
     ebe:	14090303          	lb	t1,320(s2)
     ec2:	0100                	.insn	2, 0x0100
     ec4:	10090403          	lb	s0,256(s2)
     ec8:	0100                	.insn	2, 0x0100
     eca:	0306                	.insn	2, 0x0306
     ecc:	7a91                	.insn	2, 0x7a91
     ece:	0409                	.insn	2, 0x0409
     ed0:	0100                	.insn	2, 0x0100
     ed2:	0905ef03          	.insn	4, 0x0905ef03
     ed6:	000c                	.insn	2, 0x000c
     ed8:	0501                	.insn	2, 0x0501
     eda:	02030623          	sb	zero,44(t1) # 20ca01 <_binary_shell_bin_start+0x968e>
     ede:	1409                	.insn	2, 0x1409
     ee0:	0100                	.insn	2, 0x0100
     ee2:	1b05                	.insn	2, 0x1b05
     ee4:	0306                	.insn	2, 0x0306
     ee6:	0900                	.insn	2, 0x0900
     ee8:	0004                	.insn	2, 0x0004
     eea:	0501                	.insn	2, 0x0501
     eec:	0611                	.insn	2, 0x0611
     eee:	04096803          	.insn	4, 0x04096803
     ef2:	0100                	.insn	2, 0x0100
     ef4:	2405                	.insn	2, 0x2405
     ef6:	04091a03          	lh	s4,64(s2)
     efa:	0100                	.insn	2, 0x0100
     efc:	1605                	.insn	2, 0x1605
     efe:	04095d03          	lhu	s10,64(s2)
     f02:	0100                	.insn	2, 0x0100
     f04:	0705                	.insn	2, 0x0705
     f06:	08090103          	lb	sp,128(s2)
     f0a:	0100                	.insn	2, 0x0100
     f0c:	0905                	.insn	2, 0x0905
     f0e:	04090103          	lb	sp,64(s2)
     f12:	0100                	.insn	2, 0x0100
     f14:	1c05                	.insn	2, 0x1c05
     f16:	04091d03          	lh	s10,64(s2)
     f1a:	0100                	.insn	2, 0x0100
     f1c:	0905                	.insn	2, 0x0905
     f1e:	04096303          	.insn	4, 0x04096303
     f22:	0100                	.insn	2, 0x0100
     f24:	0505                	.insn	2, 0x0505
     f26:	04091d03          	lh	s10,64(s2)
     f2a:	0100                	.insn	2, 0x0100
     f2c:	04090a03          	lb	s4,64(s2)
     f30:	0100                	.insn	2, 0x0100
     f32:	0306                	.insn	2, 0x0306
     f34:	10097a87          	.insn	4, 0x10097a87
     f38:	0100                	.insn	2, 0x0100
     f3a:	0306                	.insn	2, 0x0306
     f3c:	05fd                	.insn	2, 0x05fd
     f3e:	0409                	.insn	2, 0x0409
     f40:	0100                	.insn	2, 0x0100
     f42:	0306                	.insn	2, 0x0306
     f44:	08097a83          	.insn	4, 0x08097a83
     f48:	0100                	.insn	2, 0x0100
     f4a:	1605                	.insn	2, 0x1605
     f4c:	0306                	.insn	2, 0x0306
     f4e:	05d0                	.insn	2, 0x05d0
     f50:	2809                	.insn	2, 0x2809
     f52:	0100                	.insn	2, 0x0100
     f54:	0705                	.insn	2, 0x0705
     f56:	08090103          	lb	sp,128(s2)
     f5a:	0100                	.insn	2, 0x0100
     f5c:	0905                	.insn	2, 0x0905
     f5e:	04090103          	lb	sp,64(s2)
     f62:	0100                	.insn	2, 0x0100
     f64:	1c05                	.insn	2, 0x1c05
     f66:	04092b03          	lw	s6,64(s2)
     f6a:	0100                	.insn	2, 0x0100
     f6c:	0905                	.insn	2, 0x0905
     f6e:	04095503          	lhu	a0,64(s2)
     f72:	0100                	.insn	2, 0x0100
     f74:	0505                	.insn	2, 0x0505
     f76:	04092b03          	lw	s6,64(s2)
     f7a:	0100                	.insn	2, 0x0100
     f7c:	2305                	.insn	2, 0x2305
     f7e:	04090203          	lb	tp,64(s2)
     f82:	0100                	.insn	2, 0x0100
     f84:	1b05                	.insn	2, 0x1b05
     f86:	0306                	.insn	2, 0x0306
     f88:	0900                	.insn	2, 0x0900
     f8a:	0004                	.insn	2, 0x0004
     f8c:	0501                	.insn	2, 0x0501
     f8e:	0618                	.insn	2, 0x0618
     f90:	04090203          	lb	tp,64(s2)
     f94:	0100                	.insn	2, 0x0100
     f96:	1105                	.insn	2, 0x1105
     f98:	04095803          	lhu	a6,64(s2)
     f9c:	0100                	.insn	2, 0x0100
     f9e:	0d05                	.insn	2, 0x0d05
     fa0:	04092b03          	lw	s6,64(s2)
     fa4:	0100                	.insn	2, 0x0100
     fa6:	04090403          	lb	s0,64(s2)
     faa:	0100                	.insn	2, 0x0100
     fac:	0306                	.insn	2, 0x0306
     fae:	79f8                	.insn	2, 0x79f8
     fb0:	0c09                	.insn	2, 0x0c09
     fb2:	0100                	.insn	2, 0x0100
     fb4:	0504                	.insn	2, 0x0504
     fb6:	1f05                	.insn	2, 0x1f05
     fb8:	0306                	.insn	2, 0x0306
     fba:	091e                	.insn	2, 0x091e
     fbc:	0004                	.insn	2, 0x0004
     fbe:	0401                	.insn	2, 0x0401
     fc0:	0501                	.insn	2, 0x0501
     fc2:	0305                	.insn	2, 0x0305
     fc4:	080905db          	.insn	4, 0x080905db
     fc8:	0100                	.insn	2, 0x0100
     fca:	0306                	.insn	2, 0x0306
     fcc:	10097a87          	.insn	4, 0x10097a87
     fd0:	0100                	.insn	2, 0x0100
     fd2:	0905                	.insn	2, 0x0905
     fd4:	0306                	.insn	2, 0x0306
     fd6:	04090693          	addi	a3,s2,64
     fda:	0100                	.insn	2, 0x0100
     fdc:	0306                	.insn	2, 0x0306
     fde:	79ed                	.insn	2, 0x79ed
     fe0:	0409                	.insn	2, 0x0409
     fe2:	0100                	.insn	2, 0x0100
     fe4:	0005                	.insn	2, 0x0005
     fe6:	0306                	.insn	2, 0x0306
     fe8:	0699                	.insn	2, 0x0699
     fea:	4809                	.insn	2, 0x4809
     fec:	0100                	.insn	2, 0x0100
     fee:	2505                	.insn	2, 0x2505
     ff0:	030a                	.insn	2, 0x030a
     ff2:	00300907          	.insn	4, 0x00300907
     ff6:	0501                	.insn	2, 0x0501
     ff8:	0305                	.insn	2, 0x0305
     ffa:	0902                	.insn	2, 0x0902
     ffc:	0004                	.insn	2, 0x0004
     ffe:	0301                	.insn	2, 0x0301
    1000:	00140903          	lb	s2,1(s0)
    1004:	0601                	.insn	2, 0x0601
    1006:	0979db03          	lhu	s6,151(s3) # a980363 <__free_ram_end+0xa62a363>
    100a:	0010                	.insn	2, 0x0010
    100c:	0601                	.insn	2, 0x0601
    100e:	0906a803          	lw	a6,144(a3)
    1012:	0004                	.insn	2, 0x0004
    1014:	0601                	.insn	2, 0x0601
    1016:	0979d803          	lhu	a6,151(s3)
    101a:	0004                	.insn	2, 0x0004
    101c:	0301                	.insn	2, 0x0301
    101e:	06a8                	.insn	2, 0x06a8
    1020:	0809                	.insn	2, 0x0809
    1022:	0100                	.insn	2, 0x0100
    1024:	1105                	.insn	2, 0x1105
    1026:	0306                	.insn	2, 0x0306
    1028:	7fb1                	.insn	2, 0x7fb1
    102a:	1409                	.insn	2, 0x1409
    102c:	0100                	.insn	2, 0x0100
    102e:	0c05                	.insn	2, 0x0c05
    1030:	0900d303          	lhu	t1,144(ra)
    1034:	0004                	.insn	2, 0x0004
    1036:	0501                	.insn	2, 0x0501
    1038:	031c                	.insn	2, 0x031c
    103a:	097c                	.insn	2, 0x097c
    103c:	0004                	.insn	2, 0x0004
    103e:	0501                	.insn	2, 0x0501
    1040:	0605                	.insn	2, 0x0605
    1042:	04090003          	lb	zero,64(s2)
    1046:	0100                	.insn	2, 0x0100
    1048:	0306                	.insn	2, 0x0306
    104a:	090a                	.insn	2, 0x090a
    104c:	0004                	.insn	2, 0x0004
    104e:	0601                	.insn	2, 0x0601
    1050:	0979ce03          	lbu	t3,151(s3)
    1054:	0010                	.insn	2, 0x0010
    1056:	0601                	.insn	2, 0x0601
    1058:	0906b503          	.insn	4, 0x0906b503
    105c:	0004                	.insn	2, 0x0004
    105e:	0601                	.insn	2, 0x0601
    1060:	0979cb03          	lbu	s6,151(s3)
    1064:	0004                	.insn	2, 0x0004
    1066:	0301                	.insn	2, 0x0301
    1068:	06b5                	.insn	2, 0x06b5
    106a:	0409                	.insn	2, 0x0409
    106c:	0100                	.insn	2, 0x0100
    106e:	1805                	.insn	2, 0x1805
    1070:	0306                	.insn	2, 0x0306
    1072:	0904                	.insn	2, 0x0904
    1074:	0038                	.insn	2, 0x0038
    1076:	0501                	.insn	2, 0x0501
    1078:	0311                	.insn	2, 0x0311
    107a:	7fa0                	.insn	2, 0x7fa0
    107c:	0409                	.insn	2, 0x0409
    107e:	0100                	.insn	2, 0x0100
    1080:	0306                	.insn	2, 0x0306
    1082:	04097aa7          	.insn	4, 0x04097aa7
    1086:	0100                	.insn	2, 0x0100
    1088:	1c05                	.insn	2, 0x1c05
    108a:	0306                	.insn	2, 0x0306
    108c:	06b5                	.insn	2, 0x06b5
    108e:	0409                	.insn	2, 0x0409
    1090:	0100                	.insn	2, 0x0100
    1092:	0306                	.insn	2, 0x0306
    1094:	0c0979cb          	.insn	4, 0x0c0979cb
    1098:	0100                	.insn	2, 0x0100
    109a:	0d05                	.insn	2, 0x0d05
    109c:	0306                	.insn	2, 0x0306
    109e:	06be                	.insn	2, 0x06be
    10a0:	0809                	.insn	2, 0x0809
    10a2:	0100                	.insn	2, 0x0100
    10a4:	0306                	.insn	2, 0x0306
    10a6:	79c2                	.insn	2, 0x79c2
    10a8:	0c09                	.insn	2, 0x0c09
    10aa:	0100                	.insn	2, 0x0100
    10ac:	1c05                	.insn	2, 0x1c05
    10ae:	0306                	.insn	2, 0x0306
    10b0:	06b5                	.insn	2, 0x06b5
    10b2:	0409                	.insn	2, 0x0409
    10b4:	0100                	.insn	2, 0x0100
    10b6:	0504                	.insn	2, 0x0504
    10b8:	1f05                	.insn	2, 0x1f05
    10ba:	0979e903          	.insn	4, 0x0979e903
    10be:	0004                	.insn	2, 0x0004
    10c0:	0401                	.insn	2, 0x0401
    10c2:	0501                	.insn	2, 0x0501
    10c4:	0305                	.insn	2, 0x0305
    10c6:	04090697          	auipc	a3,0x4090
    10ca:	0100                	.insn	2, 0x0100
    10cc:	08097d03          	.insn	4, 0x08097d03
    10d0:	0100                	.insn	2, 0x0100
    10d2:	0306                	.insn	2, 0x0306
    10d4:	79ce                	.insn	2, 0x79ce
    10d6:	1009                	.insn	2, 0x1009
    10d8:	0100                	.insn	2, 0x0100
    10da:	0805                	.insn	2, 0x0805
    10dc:	0306                	.insn	2, 0x0306
    10de:	040906c7          	.insn	4, 0x040906c7
    10e2:	0100                	.insn	2, 0x0100
    10e4:	0306                	.insn	2, 0x0306
    10e6:	79b9                	.insn	2, 0x79b9
    10e8:	0809                	.insn	2, 0x0809
    10ea:	0100                	.insn	2, 0x0100
    10ec:	0005                	.insn	2, 0x0005
    10ee:	0306                	.insn	2, 0x0306
    10f0:	06d2                	.insn	2, 0x06d2
    10f2:	4409                	.insn	2, 0x4409
    10f4:	0100                	.insn	2, 0x0100
    10f6:	0505                	.insn	2, 0x0505
    10f8:	030a                	.insn	2, 0x030a
    10fa:	0902                	.insn	2, 0x0902
    10fc:	0008                	.insn	2, 0x0008
    10fe:	0301                	.insn	2, 0x0301
    1100:	0904                	.insn	2, 0x0904
    1102:	0010                	.insn	2, 0x0010
    1104:	0501                	.insn	2, 0x0501
    1106:	0311                	.insn	2, 0x0311
    1108:	090e                	.insn	2, 0x090e
    110a:	0010                	.insn	2, 0x0010
    110c:	0501                	.insn	2, 0x0501
    110e:	0305                	.insn	2, 0x0305
    1110:	0905                	.insn	2, 0x0905
    1112:	0014                	.insn	2, 0x0014
    1114:	0301                	.insn	2, 0x0301
    1116:	0908                	.insn	2, 0x0908
    1118:	0010                	.insn	2, 0x0010
    111a:	0301                	.insn	2, 0x0301
    111c:	0901                	.insn	2, 0x0901
    111e:	0010                	.insn	2, 0x0010
    1120:	0301                	.insn	2, 0x0301
    1122:	0901                	.insn	2, 0x0901
    1124:	0010                	.insn	2, 0x0010
    1126:	0301                	.insn	2, 0x0301
    1128:	0902                	.insn	2, 0x0902
    112a:	0020                	.insn	2, 0x0020
    112c:	0301                	.insn	2, 0x0301
    112e:	0918                	.insn	2, 0x0918
    1130:	0020                	.insn	2, 0x0020
    1132:	0301                	.insn	2, 0x0301
    1134:	000c0903          	lb	s2,0(s8)
    1138:	0501                	.insn	2, 0x0501
    113a:	0311                	.insn	2, 0x0311
    113c:	0901                	.insn	2, 0x0901
    113e:	0010                	.insn	2, 0x0010
    1140:	0501                	.insn	2, 0x0501
    1142:	0003060f          	.insn	4, 0x0003060f
    1146:	1009                	.insn	2, 0x1009
    1148:	0100                	.insn	2, 0x0100
    114a:	1405                	.insn	2, 0x1405
    114c:	0306                	.insn	2, 0x0306
    114e:	0901                	.insn	2, 0x0901
    1150:	0008                	.insn	2, 0x0008
    1152:	0501                	.insn	2, 0x0501
    1154:	0312                	.insn	2, 0x0312
    1156:	0901                	.insn	2, 0x0901
    1158:	0004                	.insn	2, 0x0004
    115a:	0501                	.insn	2, 0x0501
    115c:	0305                	.insn	2, 0x0305
    115e:	0908                	.insn	2, 0x0908
    1160:	0008                	.insn	2, 0x0008
    1162:	0301                	.insn	2, 0x0301
    1164:	0901                	.insn	2, 0x0901
    1166:	0010                	.insn	2, 0x0010
    1168:	0301                	.insn	2, 0x0301
    116a:	001c0903          	lb	s2,1(s8)
    116e:	0301                	.insn	2, 0x0301
    1170:	0901                	.insn	2, 0x0901
    1172:	0010                	.insn	2, 0x0010
    1174:	0301                	.insn	2, 0x0301
    1176:	0905                	.insn	2, 0x0905
    1178:	0008                	.insn	2, 0x0008
    117a:	0301                	.insn	2, 0x0301
    117c:	0901                	.insn	2, 0x0901
    117e:	0010                	.insn	2, 0x0010
    1180:	0901                	.insn	2, 0x0901
    1182:	0020                	.insn	2, 0x0020
    1184:	0100                	.insn	2, 0x0100
    1186:	0501                	.insn	2, 0x0501
    1188:	0a05                	.insn	2, 0x0a05
    118a:	0500                	.insn	2, 0x0500
    118c:	0002                	.insn	2, 0x0002
    118e:	2000                	.insn	2, 0x2000
    1190:	0300                	.insn	2, 0x0300
    1192:	090105c3          	.insn	4, 0x090105c3
    1196:	0010                	.insn	2, 0x0010
    1198:	0100                	.insn	2, 0x0100
    119a:	                	.insn	2, 0x6e01

0000119b <$d.10>:
    119b:	096e                	.insn	2, 0x096e
    119d:	0000                	.insn	2, 0x0000
    119f:	0004                	.insn	2, 0x0004
    11a1:	0032                	.insn	2, 0x0032
    11a3:	0000                	.insn	2, 0x0000
    11a5:	0101                	.insn	2, 0x0101
    11a7:	fb01                	.insn	2, 0xfb01
    11a9:	0d0e                	.insn	2, 0x0d0e
    11ab:	0100                	.insn	2, 0x0100
    11ad:	0101                	.insn	2, 0x0101
    11af:	0001                	.insn	2, 0x0001
    11b1:	0000                	.insn	2, 0x0000
    11b3:	0001                	.insn	2, 0x0001
    11b5:	0100                	.insn	2, 0x0100
    11b7:	2f2e                	.insn	2, 0x2f2e
    11b9:	00637273          	csrrci	tp,0x6,6
    11bd:	6300                	.insn	2, 0x6300
    11bf:	6f6d6d6f          	jal	s10,d78b5 <_binary_shell_bin_size+0xb5525>
    11c3:	2e6e                	.insn	2, 0x2e6e
    11c5:	00010063          	beqz	sp,11c5 <$d.10+0x2a>
    11c9:	6300                	.insn	2, 0x6300
    11cb:	6f6d6d6f          	jal	s10,d78c1 <_binary_shell_bin_size+0xb5531>
    11cf:	2e6e                	.insn	2, 0x2e6e
    11d1:	0068                	.insn	2, 0x0068
    11d3:	0001                	.insn	2, 0x0001
    11d5:	0000                	.insn	2, 0x0000
    11d7:	0505                	.insn	2, 0x0505
    11d9:	000a                	.insn	2, 0x000a
    11db:	0205                	.insn	2, 0x0205
    11dd:	166c                	.insn	2, 0x166c
    11df:	0020                	.insn	2, 0x0020
    11e1:	7a030617          	auipc	a2,0x7a030
    11e5:	0809                	.insn	2, 0x0809
    11e7:	0100                	.insn	2, 0x0100
    11e9:	1005                	.insn	2, 0x1005
    11eb:	0306                	.insn	2, 0x0306
    11ed:	00040907          	.insn	4, 0x00040907
    11f1:	0501                	.insn	2, 0x0501
    11f3:	0612                	.insn	2, 0x0612
    11f5:	04090003          	lb	zero,64(s2)
    11f9:	0100                	.insn	2, 0x0100
    11fb:	0b05                	.insn	2, 0x0b05
    11fd:	04090003          	lb	zero,64(s2)
    1201:	0100                	.insn	2, 0x0100
    1203:	0e05                	.insn	2, 0x0e05
    1205:	04090003          	lb	zero,64(s2)
    1209:	0100                	.insn	2, 0x0100
    120b:	04097903          	.insn	4, 0x04097903
    120f:	0100                	.insn	2, 0x0100
    1211:	0505                	.insn	2, 0x0505
    1213:	0306                	.insn	2, 0x0306
    1215:	0906                	.insn	2, 0x0906
    1217:	0004                	.insn	2, 0x0004
    1219:	0301                	.insn	2, 0x0301
    121b:	0902                	.insn	2, 0x0902
    121d:	0004                	.insn	2, 0x0004
    121f:	0a01                	.insn	2, 0x0a01
    1221:	04091903          	lh	s2,64(s2)
    1225:	0100                	.insn	2, 0x0100
    1227:	0306                	.insn	2, 0x0306
    1229:	095f 0008 0501      	.insn	6, 0x05010008095f
    122f:	2203060b          	.insn	4, 0x2203060b
    1233:	0409                	.insn	2, 0x0409
    1235:	0100                	.insn	2, 0x0100
    1237:	0e05                	.insn	2, 0x0e05
    1239:	0306                	.insn	2, 0x0306
    123b:	0900                	.insn	2, 0x0900
    123d:	0004                	.insn	2, 0x0004
    123f:	0301                	.insn	2, 0x0301
    1241:	095e                	.insn	2, 0x095e
    1243:	0004                	.insn	2, 0x0004
    1245:	0501                	.insn	2, 0x0501
    1247:	0605                	.insn	2, 0x0605
    1249:	04092103          	lw	sp,64(s2)
    124d:	0100                	.insn	2, 0x0100
    124f:	04090203          	lb	tp,64(s2)
    1253:	0100                	.insn	2, 0x0100
    1255:	0005                	.insn	2, 0x0005
    1257:	04092d03          	lw	s10,64(s2)
    125b:	0100                	.insn	2, 0x0100
    125d:	0905                	.insn	2, 0x0905
    125f:	030a                	.insn	2, 0x030a
    1261:	0905                	.insn	2, 0x0905
    1263:	0014                	.insn	2, 0x0014
    1265:	0301                	.insn	2, 0x0301
    1267:	00040907          	.insn	4, 0x00040907
    126b:	0301                	.insn	2, 0x0301
    126d:	0901                	.insn	2, 0x0901
    126f:	0004                	.insn	2, 0x0004
    1271:	0601                	.insn	2, 0x0601
    1273:	097fa303          	lw	t1,151(t6)
    1277:	0004                	.insn	2, 0x0004
    1279:	0b01                	.insn	2, 0x0b01
    127b:	0900dd03          	lhu	s10,144(ra)
    127f:	0010                	.insn	2, 0x0010
    1281:	0301                	.insn	2, 0x0301
    1283:	0c097fa3          	.insn	4, 0x0c097fa3
    1287:	0100                	.insn	2, 0x0100
    1289:	0306                	.insn	2, 0x0306
    128b:	00d6                	.insn	2, 0x00d6
    128d:	0409                	.insn	2, 0x0409
    128f:	0100                	.insn	2, 0x0100
    1291:	0306                	.insn	2, 0x0306
    1293:	7faa                	.insn	2, 0x7faa
    1295:	0c09                	.insn	2, 0x0c09
    1297:	0100                	.insn	2, 0x0100
    1299:	2205                	.insn	2, 0x2205
    129b:	0306                	.insn	2, 0x0306
    129d:	040900d7          	.insn	4, 0x040900d7
    12a1:	0100                	.insn	2, 0x0100
    12a3:	0306                	.insn	2, 0x0306
    12a5:	7fa9                	.insn	2, 0x7fa9
    12a7:	0409                	.insn	2, 0x0409
    12a9:	0100                	.insn	2, 0x0100
    12ab:	1005                	.insn	2, 0x1005
    12ad:	0306                	.insn	2, 0x0306
    12af:	00c4                	.insn	2, 0x00c4
    12b1:	2009                	.insn	2, 0x2009
    12b3:	0100                	.insn	2, 0x0100
    12b5:	1c05                	.insn	2, 0x1c05
    12b7:	0306                	.insn	2, 0x0306
    12b9:	0900                	.insn	2, 0x0900
    12bb:	0004                	.insn	2, 0x0004
    12bd:	0501                	.insn	2, 0x0501
    12bf:	0322                	.insn	2, 0x0322
    12c1:	0900                	.insn	2, 0x0900
    12c3:	0004                	.insn	2, 0x0004
    12c5:	0501                	.insn	2, 0x0501
    12c7:	0316                	.insn	2, 0x0316
    12c9:	0900                	.insn	2, 0x0900
    12cb:	0004                	.insn	2, 0x0004
    12cd:	0501                	.insn	2, 0x0501
    12cf:	0103060f          	.insn	4, 0x0103060f
    12d3:	0409                	.insn	2, 0x0409
    12d5:	0100                	.insn	2, 0x0100
    12d7:	0d05                	.insn	2, 0x0d05
    12d9:	0306                	.insn	2, 0x0306
    12db:	0900                	.insn	2, 0x0900
    12dd:	0004                	.insn	2, 0x0004
    12df:	0501                	.insn	2, 0x0501
    12e1:	061e                	.insn	2, 0x061e
    12e3:	14097e03          	.insn	4, 0x14097e03
    12e7:	0100                	.insn	2, 0x0100
    12e9:	0d05                	.insn	2, 0x0d05
    12eb:	04090203          	lb	tp,64(s2)
    12ef:	0100                	.insn	2, 0x0100
    12f1:	0505                	.insn	2, 0x0505
    12f3:	04097e03          	.insn	4, 0x04097e03
    12f7:	0100                	.insn	2, 0x0100
    12f9:	1605                	.insn	2, 0x1605
    12fb:	04092103          	lw	sp,64(s2)
    12ff:	0100                	.insn	2, 0x0100
    1301:	1005                	.insn	2, 0x1005
    1303:	0306                	.insn	2, 0x0306
    1305:	0900                	.insn	2, 0x0900
    1307:	0004                	.insn	2, 0x0004
    1309:	0501                	.insn	2, 0x0501
    130b:	0309                	.insn	2, 0x0309
    130d:	0900                	.insn	2, 0x0900
    130f:	0004                	.insn	2, 0x0004
    1311:	0501                	.insn	2, 0x0501
    1313:	0314                	.insn	2, 0x0314
    1315:	0900                	.insn	2, 0x0900
    1317:	0004                	.insn	2, 0x0004
    1319:	0501                	.insn	2, 0x0501
    131b:	0605                	.insn	2, 0x0605
    131d:	08097d03          	.insn	4, 0x08097d03
    1321:	0100                	.insn	2, 0x0100
    1323:	0306                	.insn	2, 0x0306
    1325:	7f9f 0409 0100      	.insn	6, 0x010004097f9f
    132b:	1605                	.insn	2, 0x1605
    132d:	0306                	.insn	2, 0x0306
    132f:	00e8                	.insn	2, 0x00e8
    1331:	0809                	.insn	2, 0x0809
    1333:	0100                	.insn	2, 0x0100
    1335:	0905                	.insn	2, 0x0905
    1337:	0306                	.insn	2, 0x0306
    1339:	0900                	.insn	2, 0x0900
    133b:	0008                	.insn	2, 0x0008
    133d:	0501                	.insn	2, 0x0501
    133f:	0610                	.insn	2, 0x0610
    1341:	08097f03          	.insn	4, 0x08097f03
    1345:	0100                	.insn	2, 0x0100
    1347:	0505                	.insn	2, 0x0505
    1349:	0306                	.insn	2, 0x0306
    134b:	0900                	.insn	2, 0x0900
    134d:	0008                	.insn	2, 0x0008
    134f:	0301                	.insn	2, 0x0301
    1351:	7f99                	.insn	2, 0x7f99
    1353:	0409                	.insn	2, 0x0409
    1355:	0100                	.insn	2, 0x0100
    1357:	0105                	.insn	2, 0x0105
    1359:	0b06                	.insn	2, 0x0b06
    135b:	0900ea03          	.insn	4, 0x0900ea03
    135f:	0010                	.insn	2, 0x0010
    1361:	0501                	.insn	2, 0x0501
    1363:	0300                	.insn	2, 0x0300
    1365:	0902                	.insn	2, 0x0902
    1367:	0008                	.insn	2, 0x0008
    1369:	0501                	.insn	2, 0x0501
    136b:	0a05                	.insn	2, 0x0a05
    136d:	5c090203          	lb	tp,1472(s2)
    1371:	0100                	.insn	2, 0x0100
    1373:	0d05                	.insn	2, 0x0d05
    1375:	30090503          	lb	a0,768(s2)
    1379:	0100                	.insn	2, 0x0100
    137b:	0c05                	.insn	2, 0x0c05
    137d:	04093c03          	.insn	4, 0x04093c03
    1381:	0100                	.insn	2, 0x0100
    1383:	04094103          	lbu	sp,64(s2)
    1387:	0100                	.insn	2, 0x0100
    1389:	0505                	.insn	2, 0x0505
    138b:	0306                	.insn	2, 0x0306
    138d:	0900                	.insn	2, 0x0900
    138f:	0004                	.insn	2, 0x0004
    1391:	0501                	.insn	2, 0x0501
    1393:	060d                	.insn	2, 0x060d
    1395:	08093c03          	.insn	4, 0x08093c03
    1399:	0100                	.insn	2, 0x0100
    139b:	0306                	.insn	2, 0x0306
    139d:	7ed4                	.insn	2, 0x7ed4
    139f:	0809                	.insn	2, 0x0809
    13a1:	0100                	.insn	2, 0x0100
    13a3:	0c05                	.insn	2, 0x0c05
    13a5:	0306                	.insn	2, 0x0306
    13a7:	040901af          	.insn	4, 0x040901af
    13ab:	0100                	.insn	2, 0x0100
    13ad:	0306                	.insn	2, 0x0306
    13af:	7ed1                	.insn	2, 0x7ed1
    13b1:	0409                	.insn	2, 0x0409
    13b3:	0100                	.insn	2, 0x0100
    13b5:	1505                	.insn	2, 0x1505
    13b7:	0306                	.insn	2, 0x0306
    13b9:	040900f3          	.insn	4, 0x040900f3
    13bd:	0100                	.insn	2, 0x0100
    13bf:	1005                	.insn	2, 0x1005
    13c1:	04097f03          	.insn	4, 0x04097f03
    13c5:	0100                	.insn	2, 0x0100
    13c7:	0d05                	.insn	2, 0x0d05
    13c9:	04090103          	lb	sp,64(s2)
    13cd:	0100                	.insn	2, 0x0100
    13cf:	2105                	.insn	2, 0x2105
    13d1:	0c091003          	lh	zero,192(s2)
    13d5:	0100                	.insn	2, 0x0100
    13d7:	1905                	.insn	2, 0x1905
    13d9:	10090303          	lb	t1,256(s2)
    13dd:	0100                	.insn	2, 0x0100
    13df:	04090d03          	lb	s10,64(s2)
    13e3:	0100                	.insn	2, 0x0100
    13e5:	04090103          	lb	sp,64(s2)
    13e9:	0100                	.insn	2, 0x0100
    13eb:	0c05                	.insn	2, 0x0c05
    13ed:	0c091b03          	lh	s6,192(s2)
    13f1:	0100                	.insn	2, 0x0100
    13f3:	0306                	.insn	2, 0x0306
    13f5:	7ed1                	.insn	2, 0x7ed1
    13f7:	0409                	.insn	2, 0x0409
    13f9:	0100                	.insn	2, 0x0100
    13fb:	0d05                	.insn	2, 0x0d05
    13fd:	0306                	.insn	2, 0x0306
    13ff:	040900f3          	.insn	4, 0x040900f3
    1403:	0100                	.insn	2, 0x0100
    1405:	2605                	.insn	2, 0x2605
    1407:	08093103          	.insn	4, 0x08093103
    140b:	0100                	.insn	2, 0x0100
    140d:	3205                	.insn	2, 0x3205
    140f:	10090203          	lb	tp,256(s2)
    1413:	0100                	.insn	2, 0x0100
    1415:	2605                	.insn	2, 0x2605
    1417:	04090103          	lb	sp,64(s2)
    141b:	0100                	.insn	2, 0x0100
    141d:	1905                	.insn	2, 0x1905
    141f:	0306                	.insn	2, 0x0306
    1421:	0900                	.insn	2, 0x0900
    1423:	0008                	.insn	2, 0x0008
    1425:	0501                	.insn	2, 0x0501
    1427:	063e                	.insn	2, 0x063e
    1429:	08097f03          	.insn	4, 0x08097f03
    142d:	0100                	.insn	2, 0x0100
    142f:	2605                	.insn	2, 0x2605
    1431:	08090103          	lb	sp,128(s2)
    1435:	0100                	.insn	2, 0x0100
    1437:	1905                	.insn	2, 0x1905
    1439:	0306                	.insn	2, 0x0306
    143b:	0900                	.insn	2, 0x0900
    143d:	0008                	.insn	2, 0x0008
    143f:	0501                	.insn	2, 0x0501
    1441:	063e                	.insn	2, 0x063e
    1443:	08097f03          	.insn	4, 0x08097f03
    1447:	0100                	.insn	2, 0x0100
    1449:	2605                	.insn	2, 0x2605
    144b:	08090103          	lb	sp,128(s2)
    144f:	0100                	.insn	2, 0x0100
    1451:	1905                	.insn	2, 0x1905
    1453:	0306                	.insn	2, 0x0306
    1455:	0900                	.insn	2, 0x0900
    1457:	0008                	.insn	2, 0x0008
    1459:	0501                	.insn	2, 0x0501
    145b:	063e                	.insn	2, 0x063e
    145d:	08097f03          	.insn	4, 0x08097f03
    1461:	0100                	.insn	2, 0x0100
    1463:	2605                	.insn	2, 0x2605
    1465:	08090103          	lb	sp,128(s2)
    1469:	0100                	.insn	2, 0x0100
    146b:	1905                	.insn	2, 0x1905
    146d:	0306                	.insn	2, 0x0306
    146f:	0900                	.insn	2, 0x0900
    1471:	0008                	.insn	2, 0x0008
    1473:	0501                	.insn	2, 0x0501
    1475:	063e                	.insn	2, 0x063e
    1477:	08097f03          	.insn	4, 0x08097f03
    147b:	0100                	.insn	2, 0x0100
    147d:	2605                	.insn	2, 0x2605
    147f:	08090103          	lb	sp,128(s2)
    1483:	0100                	.insn	2, 0x0100
    1485:	1905                	.insn	2, 0x1905
    1487:	0306                	.insn	2, 0x0306
    1489:	0900                	.insn	2, 0x0900
    148b:	0008                	.insn	2, 0x0008
    148d:	0501                	.insn	2, 0x0501
    148f:	063e                	.insn	2, 0x063e
    1491:	08097f03          	.insn	4, 0x08097f03
    1495:	0100                	.insn	2, 0x0100
    1497:	2605                	.insn	2, 0x2605
    1499:	08090103          	lb	sp,128(s2)
    149d:	0100                	.insn	2, 0x0100
    149f:	1905                	.insn	2, 0x1905
    14a1:	0306                	.insn	2, 0x0306
    14a3:	0900                	.insn	2, 0x0900
    14a5:	0008                	.insn	2, 0x0008
    14a7:	0501                	.insn	2, 0x0501
    14a9:	063e                	.insn	2, 0x063e
    14ab:	08097f03          	.insn	4, 0x08097f03
    14af:	0100                	.insn	2, 0x0100
    14b1:	2605                	.insn	2, 0x2605
    14b3:	08090103          	lb	sp,128(s2)
    14b7:	0100                	.insn	2, 0x0100
    14b9:	1905                	.insn	2, 0x1905
    14bb:	0306                	.insn	2, 0x0306
    14bd:	0900                	.insn	2, 0x0900
    14bf:	0008                	.insn	2, 0x0008
    14c1:	0501                	.insn	2, 0x0501
    14c3:	063e                	.insn	2, 0x063e
    14c5:	08097f03          	.insn	4, 0x08097f03
    14c9:	0100                	.insn	2, 0x0100
    14cb:	2605                	.insn	2, 0x2605
    14cd:	04090103          	lb	sp,64(s2)
    14d1:	0100                	.insn	2, 0x0100
    14d3:	1905                	.insn	2, 0x1905
    14d5:	0306                	.insn	2, 0x0306
    14d7:	0900                	.insn	2, 0x0900
    14d9:	0008                	.insn	2, 0x0008
    14db:	0501                	.insn	2, 0x0501
    14dd:	060c                	.insn	2, 0x060c
    14df:	08090803          	lb	a6,128(s2)
    14e3:	0100                	.insn	2, 0x0100
    14e5:	0306                	.insn	2, 0x0306
    14e7:	7ed1                	.insn	2, 0x7ed1
    14e9:	0409                	.insn	2, 0x0409
    14eb:	0100                	.insn	2, 0x0100
    14ed:	1505                	.insn	2, 0x1505
    14ef:	0306                	.insn	2, 0x0306
    14f1:	00f8                	.insn	2, 0x00f8
    14f3:	0409                	.insn	2, 0x0409
    14f5:	0100                	.insn	2, 0x0100
    14f7:	0c05                	.insn	2, 0x0c05
    14f9:	0c093703          	.insn	4, 0x0c093703
    14fd:	0100                	.insn	2, 0x0100
    14ff:	0306                	.insn	2, 0x0306
    1501:	7ed1                	.insn	2, 0x7ed1
    1503:	0409                	.insn	2, 0x0409
    1505:	0100                	.insn	2, 0x0100
    1507:	2505                	.insn	2, 0x2505
    1509:	0306                	.insn	2, 0x0306
    150b:	040900fb          	.insn	4, 0x040900fb
    150f:	0100                	.insn	2, 0x0100
    1511:	1c05                	.insn	2, 0x1c05
    1513:	10090103          	lb	sp,256(s2)
    1517:	0100                	.insn	2, 0x0100
    1519:	1505                	.insn	2, 0x1505
    151b:	0306                	.insn	2, 0x0306
    151d:	0900                	.insn	2, 0x0900
    151f:	0004                	.insn	2, 0x0004
    1521:	0501                	.insn	2, 0x0501
    1523:	0619                	.insn	2, 0x0619
    1525:	08090103          	lb	sp,128(s2)
    1529:	0100                	.insn	2, 0x0100
    152b:	1c05                	.insn	2, 0x1c05
    152d:	0c097f03          	.insn	4, 0x0c097f03
    1531:	0100                	.insn	2, 0x0100
    1533:	1505                	.insn	2, 0x1505
    1535:	0306                	.insn	2, 0x0306
    1537:	0900                	.insn	2, 0x0900
    1539:	0004                	.insn	2, 0x0004
    153b:	0501                	.insn	2, 0x0501
    153d:	0619                	.insn	2, 0x0619
    153f:	0c090b03          	lb	s6,192(s2)
    1543:	0100                	.insn	2, 0x0100
    1545:	3a05                	.insn	2, 0x3a05
    1547:	0c090203          	lb	tp,192(s2)
    154b:	0100                	.insn	2, 0x0100
    154d:	0306                	.insn	2, 0x0306
    154f:	04097ef7          	.insn	4, 0x04097ef7
    1553:	0100                	.insn	2, 0x0100
    1555:	1b05                	.insn	2, 0x1b05
    1557:	0306                	.insn	2, 0x0306
    1559:	019a                	.insn	2, 0x019a
    155b:	0c09                	.insn	2, 0x0c09
    155d:	0100                	.insn	2, 0x0100
    155f:	0306                	.insn	2, 0x0306
    1561:	7ee6                	.insn	2, 0x7ee6
    1563:	1409                	.insn	2, 0x1409
    1565:	0100                	.insn	2, 0x0100
    1567:	2405                	.insn	2, 0x2405
    1569:	0306                	.insn	2, 0x0306
    156b:	0199                	.insn	2, 0x0199
    156d:	1009                	.insn	2, 0x1009
    156f:	0100                	.insn	2, 0x0100
    1571:	1e05                	.insn	2, 0x1e05
    1573:	0306                	.insn	2, 0x0306
    1575:	0900                	.insn	2, 0x0900
    1577:	0004                	.insn	2, 0x0004
    1579:	0501                	.insn	2, 0x0501
    157b:	0322                	.insn	2, 0x0322
    157d:	0900                	.insn	2, 0x0900
    157f:	0004                	.insn	2, 0x0004
    1581:	0501                	.insn	2, 0x0501
    1583:	0615                	.insn	2, 0x0615
    1585:	08097f03          	.insn	4, 0x08097f03
    1589:	0100                	.insn	2, 0x0100
    158b:	0306                	.insn	2, 0x0306
    158d:	7ee8                	.insn	2, 0x7ee8
    158f:	0409                	.insn	2, 0x0409
    1591:	0100                	.insn	2, 0x0100
    1593:	2605                	.insn	2, 0x2605
    1595:	0306                	.insn	2, 0x0306
    1597:	019f 0409 0100      	.insn	6, 0x01000409019f
    159d:	1905                	.insn	2, 0x1905
    159f:	0306                	.insn	2, 0x0306
    15a1:	0900                	.insn	2, 0x0900
    15a3:	0008                	.insn	2, 0x0008
    15a5:	0501                	.insn	2, 0x0501
    15a7:	061e                	.insn	2, 0x061e
    15a9:	08097f03          	.insn	4, 0x08097f03
    15ad:	0100                	.insn	2, 0x0100
    15af:	1505                	.insn	2, 0x1505
    15b1:	0306                	.insn	2, 0x0306
    15b3:	0900                	.insn	2, 0x0900
    15b5:	0008                	.insn	2, 0x0008
    15b7:	0601                	.insn	2, 0x0601
    15b9:	08095703          	lhu	a4,128(s2)
    15bd:	0100                	.insn	2, 0x0100
    15bf:	0306                	.insn	2, 0x0306
    15c1:	0c097f8b          	.insn	4, 0x0c097f8b
    15c5:	0100                	.insn	2, 0x0100
    15c7:	0105                	.insn	2, 0x0105
    15c9:	0b06                	.insn	2, 0x0b06
    15cb:	0901b403          	.insn	4, 0x0901b403
    15cf:	0034                	.insn	2, 0x0034
    15d1:	0501                	.insn	2, 0x0501
    15d3:	0a05                	.insn	2, 0x0a05
    15d5:	08091b03          	lh	s6,128(s2)
    15d9:	0100                	.insn	2, 0x0100
    15db:	0c05                	.insn	2, 0x0c05
    15dd:	0306                	.insn	2, 0x0306
    15df:	0900                	.insn	2, 0x0900
    15e1:	0014                	.insn	2, 0x0014
    15e3:	0501                	.insn	2, 0x0501
    15e5:	0316                	.insn	2, 0x0316
    15e7:	0900                	.insn	2, 0x0900
    15e9:	0004                	.insn	2, 0x0004
    15eb:	0301                	.insn	2, 0x0301
    15ed:	7eb1                	.insn	2, 0x7eb1
    15ef:	0809                	.insn	2, 0x0809
    15f1:	0100                	.insn	2, 0x0100
    15f3:	0901cf03          	lbu	t5,144(gp)
    15f7:	0004                	.insn	2, 0x0004
    15f9:	0501                	.insn	2, 0x0501
    15fb:	0619                	.insn	2, 0x0619
    15fd:	04090303          	lb	t1,64(s2)
    1601:	0100                	.insn	2, 0x0100
    1603:	2505                	.insn	2, 0x2505
    1605:	0306                	.insn	2, 0x0306
    1607:	0900                	.insn	2, 0x0900
    1609:	0004                	.insn	2, 0x0004
    160b:	0501                	.insn	2, 0x0501
    160d:	060a                	.insn	2, 0x060a
    160f:	0c090103          	lb	sp,192(s2)
    1613:	0100                	.insn	2, 0x0100
    1615:	0306                	.insn	2, 0x0306
    1617:	7ead                	.insn	2, 0x7ead
    1619:	0409                	.insn	2, 0x0409
    161b:	0100                	.insn	2, 0x0100
    161d:	0901d303          	lhu	t1,144(gp)
    1621:	0008                	.insn	2, 0x0008
    1623:	0501                	.insn	2, 0x0501
    1625:	0309                	.insn	2, 0x0309
    1627:	0900                	.insn	2, 0x0900
    1629:	0004                	.insn	2, 0x0004
    162b:	0301                	.insn	2, 0x0301
    162d:	7ead                	.insn	2, 0x7ead
    162f:	0409                	.insn	2, 0x0409
    1631:	0100                	.insn	2, 0x0100
    1633:	0105                	.insn	2, 0x0105
    1635:	0306                	.insn	2, 0x0306
    1637:	01e0                	.insn	2, 0x01e0
    1639:	0409                	.insn	2, 0x0409
    163b:	0100                	.insn	2, 0x0100
    163d:	0306                	.insn	2, 0x0306
    163f:	7ea0                	.insn	2, 0x7ea0
    1641:	0409                	.insn	2, 0x0409
    1643:	0100                	.insn	2, 0x0100
    1645:	1605                	.insn	2, 0x1605
    1647:	0306                	.insn	2, 0x0306
    1649:	01d8                	.insn	2, 0x01d8
    164b:	0c09                	.insn	2, 0x0c09
    164d:	0100                	.insn	2, 0x0100
    164f:	0005                	.insn	2, 0x0005
    1651:	0306                	.insn	2, 0x0306
    1653:	7ea8                	.insn	2, 0x7ea8
    1655:	1409                	.insn	2, 0x1409
    1657:	0100                	.insn	2, 0x0100
    1659:	0c05                	.insn	2, 0x0c05
    165b:	0306                	.insn	2, 0x0306
    165d:	01d5                	.insn	2, 0x01d5
    165f:	0409                	.insn	2, 0x0409
    1661:	0100                	.insn	2, 0x0100
    1663:	0005                	.insn	2, 0x0005
    1665:	0306                	.insn	2, 0x0306
    1667:	04097eab          	.insn	4, 0x04097eab
    166b:	0100                	.insn	2, 0x0100
    166d:	1005                	.insn	2, 0x1005
    166f:	0306                	.insn	2, 0x0306
    1671:	01dc                	.insn	2, 0x01dc
    1673:	0409                	.insn	2, 0x0409
    1675:	0100                	.insn	2, 0x0100
    1677:	1605                	.insn	2, 0x1605
    1679:	0306                	.insn	2, 0x0306
    167b:	0900                	.insn	2, 0x0900
    167d:	0004                	.insn	2, 0x0004
    167f:	0501                	.insn	2, 0x0501
    1681:	0605                	.insn	2, 0x0605
    1683:	04097903          	.insn	4, 0x04097903
    1687:	0100                	.insn	2, 0x0100
    1689:	0306                	.insn	2, 0x0306
    168b:	04097eab          	.insn	4, 0x04097eab
    168f:	0100                	.insn	2, 0x0100
    1691:	1605                	.insn	2, 0x1605
    1693:	0306                	.insn	2, 0x0306
    1695:	01d8                	.insn	2, 0x01d8
    1697:	0409                	.insn	2, 0x0409
    1699:	0100                	.insn	2, 0x0100
    169b:	1b05                	.insn	2, 0x1b05
    169d:	10090103          	lb	sp,256(s2)
    16a1:	0100                	.insn	2, 0x0100
    16a3:	10090103          	lb	sp,256(s2)
    16a7:	0100                	.insn	2, 0x0100
    16a9:	0306                	.insn	2, 0x0306
    16ab:	7ea6                	.insn	2, 0x7ea6
    16ad:	1009                	.insn	2, 0x1009
    16af:	0100                	.insn	2, 0x0100
    16b1:	0a05                	.insn	2, 0x0a05
    16b3:	0306                	.insn	2, 0x0306
    16b5:	01de                	.insn	2, 0x01de
    16b7:	0409                	.insn	2, 0x0409
    16b9:	0100                	.insn	2, 0x0100
    16bb:	0105                	.insn	2, 0x0105
    16bd:	04090203          	lb	tp,64(s2)
    16c1:	0100                	.insn	2, 0x0100
    16c3:	0005                	.insn	2, 0x0005
    16c5:	04090703          	lb	a4,64(s2)
    16c9:	0100                	.insn	2, 0x0100
    16cb:	0505                	.insn	2, 0x0505
    16cd:	030a                	.insn	2, 0x030a
    16cf:	0904                	.insn	2, 0x0904
    16d1:	003c                	.insn	2, 0x003c
    16d3:	0601                	.insn	2, 0x0601
    16d5:	097e9503          	lh	a0,151(t4)
    16d9:	0004                	.insn	2, 0x0004
    16db:	0501                	.insn	2, 0x0501
    16dd:	0609                	.insn	2, 0x0609
    16df:	09028603          	lb	a2,144(t0)
    16e3:	002c                	.insn	2, 0x002c
    16e5:	0301                	.insn	2, 0x0301
    16e7:	0901                	.insn	2, 0x0901
    16e9:	000c                	.insn	2, 0x000c
    16eb:	0501                	.insn	2, 0x0501
    16ed:	030d                	.insn	2, 0x030d
    16ef:	0902                	.insn	2, 0x0902
    16f1:	000c                	.insn	2, 0x000c
    16f3:	0601                	.insn	2, 0x0601
    16f5:	097df703          	.insn	4, 0x097df703
    16f9:	0004                	.insn	2, 0x0004
    16fb:	0501                	.insn	2, 0x0501
    16fd:	0630                	.insn	2, 0x0630
    16ff:	0901ef03          	.insn	4, 0x0901ef03
    1703:	0008                	.insn	2, 0x0008
    1705:	0501                	.insn	2, 0x0501
    1707:	031a                	.insn	2, 0x031a
    1709:	0955                	.insn	2, 0x0955
    170b:	0004                	.insn	2, 0x0004
    170d:	0501                	.insn	2, 0x0501
    170f:	0316                	.insn	2, 0x0316
    1711:	0902                	.insn	2, 0x0902
    1713:	0004                	.insn	2, 0x0004
    1715:	0501                	.insn	2, 0x0501
    1717:	031c                	.insn	2, 0x031c
    1719:	0926                	.insn	2, 0x0926
    171b:	0008                	.insn	2, 0x0008
    171d:	0501                	.insn	2, 0x0501
    171f:	0309                	.insn	2, 0x0309
    1721:	095a                	.insn	2, 0x095a
    1723:	0004                	.insn	2, 0x0004
    1725:	0501                	.insn	2, 0x0501
    1727:	097e0317          	auipc	t1,0x97e0
    172b:	0008                	.insn	2, 0x0008
    172d:	0501                	.insn	2, 0x0501
    172f:	0316                	.insn	2, 0x0316
    1731:	0902                	.insn	2, 0x0902
    1733:	0008                	.insn	2, 0x0008
    1735:	0501                	.insn	2, 0x0501
    1737:	0609                	.insn	2, 0x0609
    1739:	08090003          	lb	zero,128(s2)
    173d:	0100                	.insn	2, 0x0100
    173f:	1705                	.insn	2, 0x1705
    1741:	0306                	.insn	2, 0x0306
    1743:	097e                	.insn	2, 0x097e
    1745:	0008                	.insn	2, 0x0008
    1747:	0501                	.insn	2, 0x0501
    1749:	0316                	.insn	2, 0x0316
    174b:	0902                	.insn	2, 0x0902
    174d:	0008                	.insn	2, 0x0008
    174f:	0501                	.insn	2, 0x0501
    1751:	0609                	.insn	2, 0x0609
    1753:	08090003          	lb	zero,128(s2)
    1757:	0100                	.insn	2, 0x0100
    1759:	1705                	.insn	2, 0x1705
    175b:	0306                	.insn	2, 0x0306
    175d:	097e                	.insn	2, 0x097e
    175f:	0008                	.insn	2, 0x0008
    1761:	0501                	.insn	2, 0x0501
    1763:	0316                	.insn	2, 0x0316
    1765:	0902                	.insn	2, 0x0902
    1767:	0008                	.insn	2, 0x0008
    1769:	0501                	.insn	2, 0x0501
    176b:	0609                	.insn	2, 0x0609
    176d:	08090003          	lb	zero,128(s2)
    1771:	0100                	.insn	2, 0x0100
    1773:	1705                	.insn	2, 0x1705
    1775:	0306                	.insn	2, 0x0306
    1777:	097e                	.insn	2, 0x097e
    1779:	0008                	.insn	2, 0x0008
    177b:	0501                	.insn	2, 0x0501
    177d:	0316                	.insn	2, 0x0316
    177f:	0902                	.insn	2, 0x0902
    1781:	0008                	.insn	2, 0x0008
    1783:	0501                	.insn	2, 0x0501
    1785:	0609                	.insn	2, 0x0609
    1787:	08090003          	lb	zero,128(s2)
    178b:	0100                	.insn	2, 0x0100
    178d:	1705                	.insn	2, 0x1705
    178f:	0306                	.insn	2, 0x0306
    1791:	097e                	.insn	2, 0x097e
    1793:	0008                	.insn	2, 0x0008
    1795:	0501                	.insn	2, 0x0501
    1797:	0316                	.insn	2, 0x0316
    1799:	0902                	.insn	2, 0x0902
    179b:	0008                	.insn	2, 0x0008
    179d:	0501                	.insn	2, 0x0501
    179f:	0609                	.insn	2, 0x0609
    17a1:	08090003          	lb	zero,128(s2)
    17a5:	0100                	.insn	2, 0x0100
    17a7:	1705                	.insn	2, 0x1705
    17a9:	0306                	.insn	2, 0x0306
    17ab:	097e                	.insn	2, 0x097e
    17ad:	0008                	.insn	2, 0x0008
    17af:	0501                	.insn	2, 0x0501
    17b1:	0316                	.insn	2, 0x0316
    17b3:	0902                	.insn	2, 0x0902
    17b5:	0008                	.insn	2, 0x0008
    17b7:	0501                	.insn	2, 0x0501
    17b9:	0609                	.insn	2, 0x0609
    17bb:	08090003          	lb	zero,128(s2)
    17bf:	0100                	.insn	2, 0x0100
    17c1:	1705                	.insn	2, 0x1705
    17c3:	0306                	.insn	2, 0x0306
    17c5:	097e                	.insn	2, 0x097e
    17c7:	0008                	.insn	2, 0x0008
    17c9:	0501                	.insn	2, 0x0501
    17cb:	0316                	.insn	2, 0x0316
    17cd:	0902                	.insn	2, 0x0902
    17cf:	0004                	.insn	2, 0x0004
    17d1:	0501                	.insn	2, 0x0501
    17d3:	0609                	.insn	2, 0x0609
    17d5:	08090003          	lb	zero,128(s2)
    17d9:	0100                	.insn	2, 0x0100
    17db:	0306                	.insn	2, 0x0306
    17dd:	092a                	.insn	2, 0x092a
    17df:	0008                	.insn	2, 0x0008
    17e1:	0601                	.insn	2, 0x0601
    17e3:	097e9003          	lh	zero,151(t4)
    17e7:	000c                	.insn	2, 0x000c
    17e9:	0501                	.insn	2, 0x0501
    17eb:	0625                	.insn	2, 0x0625
    17ed:	0901f303          	.insn	4, 0x0901f303
    17f1:	000c                	.insn	2, 0x000c
    17f3:	0501                	.insn	2, 0x0501
    17f5:	0609                	.insn	2, 0x0609
    17f7:	04090003          	lb	zero,64(s2)
    17fb:	0100                	.insn	2, 0x0100
    17fd:	097e8d03          	lb	s10,151(t4)
    1801:	0004                	.insn	2, 0x0004
    1803:	0501                	.insn	2, 0x0501
    1805:	061c                	.insn	2, 0x061c
    1807:	0901f503          	.insn	4, 0x0901f503
    180b:	0004                	.insn	2, 0x0004
    180d:	0601                	.insn	2, 0x0601
    180f:	097e8b03          	lb	s6,151(t4)
    1813:	0008                	.insn	2, 0x0008
    1815:	0501                	.insn	2, 0x0501
    1817:	0612                	.insn	2, 0x0612
    1819:	0901bd03          	.insn	4, 0x0901bd03
    181d:	0004                	.insn	2, 0x0004
    181f:	0501                	.insn	2, 0x0501
    1821:	0605                	.insn	2, 0x0605
    1823:	08090003          	lb	zero,128(s2)
    1827:	0100                	.insn	2, 0x0100
    1829:	1805                	.insn	2, 0x1805
    182b:	0306                	.insn	2, 0x0306
    182d:	0901                	.insn	2, 0x0901
    182f:	0008                	.insn	2, 0x0008
    1831:	0501                	.insn	2, 0x0501
    1833:	0612                	.insn	2, 0x0612
    1835:	04090003          	lb	zero,64(s2)
    1839:	0100                	.insn	2, 0x0100
    183b:	1105                	.insn	2, 0x1105
    183d:	0306                	.insn	2, 0x0306
    183f:	093a                	.insn	2, 0x093a
    1841:	000c                	.insn	2, 0x000c
    1843:	0501                	.insn	2, 0x0501
    1845:	0600                	.insn	2, 0x0600
    1847:	097e8803          	lb	a6,151(t4)
    184b:	0010                	.insn	2, 0x0010
    184d:	0501                	.insn	2, 0x0501
    184f:	060d                	.insn	2, 0x060d
    1851:	0901fb03          	.insn	4, 0x0901fb03
    1855:	000c                	.insn	2, 0x000c
    1857:	0501                	.insn	2, 0x0501
    1859:	0311                	.insn	2, 0x0311
    185b:	0901                	.insn	2, 0x0901
    185d:	000c                	.insn	2, 0x000c
    185f:	0501                	.insn	2, 0x0501
    1861:	0619                	.insn	2, 0x0619
    1863:	04090003          	lb	zero,64(s2)
    1867:	0100                	.insn	2, 0x0100
    1869:	097e8403          	lb	s0,151(t4)
    186d:	000c                	.insn	2, 0x000c
    186f:	0501                	.insn	2, 0x0501
    1871:	ec030617          	auipc	a2,0xec030
    1875:	0901                	.insn	2, 0x0901
    1877:	0008                	.insn	2, 0x0008
    1879:	0601                	.insn	2, 0x0601
    187b:	097e9403          	lh	s0,151(t4)
    187f:	0004                	.insn	2, 0x0004
    1881:	0501                	.insn	2, 0x0501
    1883:	0609                	.insn	2, 0x0609
    1885:	09028003          	lb	zero,144(t0)
    1889:	0004                	.insn	2, 0x0004
    188b:	0301                	.insn	2, 0x0301
    188d:	0901                	.insn	2, 0x0901
    188f:	000c                	.insn	2, 0x000c
    1891:	0301                	.insn	2, 0x0301
    1893:	0901                	.insn	2, 0x0901
    1895:	000c                	.insn	2, 0x000c
    1897:	0501                	.insn	2, 0x0501
    1899:	030d                	.insn	2, 0x030d
    189b:	0902                	.insn	2, 0x0902
    189d:	0018                	.insn	2, 0x0018
    189f:	0501                	.insn	2, 0x0501
    18a1:	031e                	.insn	2, 0x031e
    18a3:	097e                	.insn	2, 0x097e
    18a5:	000c                	.insn	2, 0x000c
    18a7:	0601                	.insn	2, 0x0601
    18a9:	097dfe03          	.insn	4, 0x097dfe03
    18ad:	0004                	.insn	2, 0x0004
    18af:	0501                	.insn	2, 0x0501
    18b1:	0619                	.insn	2, 0x0619
    18b3:	09028303          	lb	t1,144(t0)
    18b7:	0004                	.insn	2, 0x0004
    18b9:	0501                	.insn	2, 0x0501
    18bb:	0325                	.insn	2, 0x0325
    18bd:	0901                	.insn	2, 0x0901
    18bf:	0004                	.insn	2, 0x0004
    18c1:	0601                	.insn	2, 0x0601
    18c3:	097dfc03          	.insn	4, 0x097dfc03
    18c7:	000c                	.insn	2, 0x000c
    18c9:	0501                	.insn	2, 0x0501
    18cb:	0601                	.insn	2, 0x0601
    18cd:	028b030b          	.insn	4, 0x028b030b
    18d1:	3c09                	.insn	2, 0x3c09
    18d3:	0100                	.insn	2, 0x0100
    18d5:	0005                	.insn	2, 0x0005
    18d7:	08090203          	lb	tp,128(s2)
    18db:	0100                	.insn	2, 0x0100
    18dd:	1305                	.insn	2, 0x1305
    18df:	030a                	.insn	2, 0x030a
    18e1:	0908                	.insn	2, 0x0908
    18e3:	0010                	.insn	2, 0x0010
    18e5:	0501                	.insn	2, 0x0501
    18e7:	061e                	.insn	2, 0x061e
    18e9:	08090003          	lb	zero,128(s2)
    18ed:	0100                	.insn	2, 0x0100
    18ef:	2605                	.insn	2, 0x2605
    18f1:	04090003          	lb	zero,64(s2)
    18f5:	0100                	.insn	2, 0x0100
    18f7:	2905                	.insn	2, 0x2905
    18f9:	04090003          	lb	zero,64(s2)
    18fd:	0100                	.insn	2, 0x0100
    18ff:	0905                	.insn	2, 0x0905
    1901:	04090003          	lb	zero,64(s2)
    1905:	0100                	.insn	2, 0x0100
    1907:	0505                	.insn	2, 0x0505
    1909:	0306                	.insn	2, 0x0306
    190b:	7fba                	.insn	2, 0x7fba
    190d:	0409                	.insn	2, 0x0409
    190f:	0100                	.insn	2, 0x0100
    1911:	0c05                	.insn	2, 0x0c05
    1913:	0306                	.insn	2, 0x0306
    1915:	0900                	.insn	2, 0x0900
    1917:	0010                	.insn	2, 0x0010
    1919:	0501                	.insn	2, 0x0501
    191b:	0305                	.insn	2, 0x0305
    191d:	0900                	.insn	2, 0x0900
    191f:	0004                	.insn	2, 0x0004
    1921:	0501                	.insn	2, 0x0501
    1923:	0316                	.insn	2, 0x0316
    1925:	0900                	.insn	2, 0x0900
    1927:	0004                	.insn	2, 0x0004
    1929:	0301                	.insn	2, 0x0301
    192b:	7eb1                	.insn	2, 0x7eb1
    192d:	0c09                	.insn	2, 0x0c09
    192f:	0100                	.insn	2, 0x0100
    1931:	0901cf03          	lbu	t5,144(gp)
    1935:	0004                	.insn	2, 0x0004
    1937:	0501                	.insn	2, 0x0501
    1939:	0619                	.insn	2, 0x0619
    193b:	04090303          	lb	t1,64(s2)
    193f:	0100                	.insn	2, 0x0100
    1941:	2505                	.insn	2, 0x2505
    1943:	0306                	.insn	2, 0x0306
    1945:	0900                	.insn	2, 0x0900
    1947:	0004                	.insn	2, 0x0004
    1949:	0501                	.insn	2, 0x0501
    194b:	060a                	.insn	2, 0x060a
    194d:	0c090103          	lb	sp,192(s2)
    1951:	0100                	.insn	2, 0x0100
    1953:	0306                	.insn	2, 0x0306
    1955:	7ead                	.insn	2, 0x7ead
    1957:	1009                	.insn	2, 0x1009
    1959:	0100                	.insn	2, 0x0100
    195b:	1e05                	.insn	2, 0x1e05
    195d:	0306                	.insn	2, 0x0306
    195f:	029d                	.insn	2, 0x029d
    1961:	1409                	.insn	2, 0x1409
    1963:	0100                	.insn	2, 0x0100
    1965:	0306                	.insn	2, 0x0306
    1967:	04097de3          	bgeu	s2,zero,21c1 <$d.10+0xc0>
    196b:	0100                	.insn	2, 0x0100
    196d:	2905                	.insn	2, 0x2905
    196f:	09029d03          	lh	s10,144(t0)
    1973:	0004                	.insn	2, 0x0004
    1975:	0301                	.insn	2, 0x0301
    1977:	04097de3          	bgeu	s2,zero,21d1 <$d.10+0xd0>
    197b:	0100                	.insn	2, 0x0100
    197d:	0505                	.insn	2, 0x0505
    197f:	0306                	.insn	2, 0x0306
    1981:	040901cf          	.insn	4, 0x040901cf
    1985:	0100                	.insn	2, 0x0100
    1987:	0c05                	.insn	2, 0x0c05
    1989:	0306                	.insn	2, 0x0306
    198b:	0900                	.insn	2, 0x0900
    198d:	0010                	.insn	2, 0x0010
    198f:	0501                	.insn	2, 0x0501
    1991:	0305                	.insn	2, 0x0305
    1993:	0900                	.insn	2, 0x0900
    1995:	0004                	.insn	2, 0x0004
    1997:	0501                	.insn	2, 0x0501
    1999:	0316                	.insn	2, 0x0316
    199b:	0900                	.insn	2, 0x0900
    199d:	0004                	.insn	2, 0x0004
    199f:	0301                	.insn	2, 0x0301
    19a1:	7eb1                	.insn	2, 0x7eb1
    19a3:	0809                	.insn	2, 0x0809
    19a5:	0100                	.insn	2, 0x0100
    19a7:	0901cf03          	lbu	t5,144(gp)
    19ab:	0008                	.insn	2, 0x0008
    19ad:	0501                	.insn	2, 0x0501
    19af:	0619                	.insn	2, 0x0619
    19b1:	04090303          	lb	t1,64(s2)
    19b5:	0100                	.insn	2, 0x0100
    19b7:	2505                	.insn	2, 0x2505
    19b9:	0306                	.insn	2, 0x0306
    19bb:	0900                	.insn	2, 0x0900
    19bd:	0004                	.insn	2, 0x0004
    19bf:	0501                	.insn	2, 0x0501
    19c1:	060a                	.insn	2, 0x060a
    19c3:	0c090103          	lb	sp,192(s2)
    19c7:	0100                	.insn	2, 0x0100
    19c9:	0306                	.insn	2, 0x0306
    19cb:	0900                	.insn	2, 0x0900
    19cd:	0010                	.insn	2, 0x0010
    19cf:	0501                	.insn	2, 0x0501
    19d1:	0309                	.insn	2, 0x0309
    19d3:	0900                	.insn	2, 0x0900
    19d5:	0008                	.insn	2, 0x0008
    19d7:	0501                	.insn	2, 0x0501
    19d9:	060d                	.insn	2, 0x060d
    19db:	0900c503          	lbu	a0,144(ra)
    19df:	0004                	.insn	2, 0x0004
    19e1:	0501                	.insn	2, 0x0501
    19e3:	030a                	.insn	2, 0x030a
    19e5:	0c097fbb          	.insn	4, 0x0c097fbb
    19e9:	0100                	.insn	2, 0x0100
    19eb:	0905                	.insn	2, 0x0905
    19ed:	0306                	.insn	2, 0x0306
    19ef:	0900                	.insn	2, 0x0900
    19f1:	0008                	.insn	2, 0x0008
    19f3:	0501                	.insn	2, 0x0501
    19f5:	060d                	.insn	2, 0x060d
    19f7:	0900cd03          	lbu	s10,144(ra)
    19fb:	0004                	.insn	2, 0x0004
    19fd:	0601                	.insn	2, 0x0601
    19ff:	097de003          	.insn	4, 0x097de003
    1a03:	0008                	.insn	2, 0x0008
    1a05:	0501                	.insn	2, 0x0501
    1a07:	0616                	.insn	2, 0x0616
    1a09:	0901d803          	lhu	a6,144(gp)
    1a0d:	0020                	.insn	2, 0x0020
    1a0f:	0501                	.insn	2, 0x0501
    1a11:	0600                	.insn	2, 0x0600
    1a13:	097ea803          	lw	a6,151(t4)
    1a17:	0014                	.insn	2, 0x0014
    1a19:	0501                	.insn	2, 0x0501
    1a1b:	060c                	.insn	2, 0x060c
    1a1d:	0901d503          	lhu	a0,144(gp)
    1a21:	0004                	.insn	2, 0x0004
    1a23:	0501                	.insn	2, 0x0501
    1a25:	0600                	.insn	2, 0x0600
    1a27:	097eab03          	lw	s6,151(t4)
    1a2b:	0004                	.insn	2, 0x0004
    1a2d:	0501                	.insn	2, 0x0501
    1a2f:	0610                	.insn	2, 0x0610
    1a31:	0901dc03          	lhu	s8,144(gp)
    1a35:	0004                	.insn	2, 0x0004
    1a37:	0501                	.insn	2, 0x0501
    1a39:	0616                	.insn	2, 0x0616
    1a3b:	04090003          	lb	zero,64(s2)
    1a3f:	0100                	.insn	2, 0x0100
    1a41:	0505                	.insn	2, 0x0505
    1a43:	0306                	.insn	2, 0x0306
    1a45:	0979                	.insn	2, 0x0979
    1a47:	0004                	.insn	2, 0x0004
    1a49:	0501                	.insn	2, 0x0501
    1a4b:	0316                	.insn	2, 0x0316
    1a4d:	00080903          	lb	s2,0(a6) # 0 <$d.14>
    1a51:	0501                	.insn	2, 0x0501
    1a53:	0901031b          	.insn	4, 0x0901031b
    1a57:	0010                	.insn	2, 0x0010
    1a59:	0301                	.insn	2, 0x0301
    1a5b:	0901                	.insn	2, 0x0901
    1a5d:	0010                	.insn	2, 0x0010
    1a5f:	0601                	.insn	2, 0x0601
    1a61:	097ea603          	lw	a2,151(t4)
    1a65:	0014                	.insn	2, 0x0014
    1a67:	0501                	.insn	2, 0x0501
    1a69:	0616                	.insn	2, 0x0616
    1a6b:	0901d803          	lhu	a6,144(gp)
    1a6f:	000c                	.insn	2, 0x000c
    1a71:	0501                	.insn	2, 0x0501
    1a73:	0600                	.insn	2, 0x0600
    1a75:	097ea803          	lw	a6,151(t4)
    1a79:	0014                	.insn	2, 0x0014
    1a7b:	0501                	.insn	2, 0x0501
    1a7d:	060c                	.insn	2, 0x060c
    1a7f:	0901d503          	lhu	a0,144(gp)
    1a83:	0004                	.insn	2, 0x0004
    1a85:	0501                	.insn	2, 0x0501
    1a87:	0600                	.insn	2, 0x0600
    1a89:	097eab03          	lw	s6,151(t4)
    1a8d:	0004                	.insn	2, 0x0004
    1a8f:	0501                	.insn	2, 0x0501
    1a91:	0610                	.insn	2, 0x0610
    1a93:	0901dc03          	lhu	s8,144(gp)
    1a97:	0004                	.insn	2, 0x0004
    1a99:	0501                	.insn	2, 0x0501
    1a9b:	0616                	.insn	2, 0x0616
    1a9d:	04090003          	lb	zero,64(s2)
    1aa1:	0100                	.insn	2, 0x0100
    1aa3:	0505                	.insn	2, 0x0505
    1aa5:	0306                	.insn	2, 0x0306
    1aa7:	0979                	.insn	2, 0x0979
    1aa9:	0004                	.insn	2, 0x0004
    1aab:	0501                	.insn	2, 0x0501
    1aad:	0316                	.insn	2, 0x0316
    1aaf:	00080903          	lb	s2,0(a6)
    1ab3:	0501                	.insn	2, 0x0501
    1ab5:	0901031b          	.insn	4, 0x0901031b
    1ab9:	0010                	.insn	2, 0x0010
    1abb:	0301                	.insn	2, 0x0301
    1abd:	0901                	.insn	2, 0x0901
    1abf:	0010                	.insn	2, 0x0010
    1ac1:	0501                	.insn	2, 0x0501
    1ac3:	0309                	.insn	2, 0x0309
    1ac5:	00cc                	.insn	2, 0x00cc
    1ac7:	1009                	.insn	2, 0x1009
    1ac9:	0100                	.insn	2, 0x0100
    1acb:	0306                	.insn	2, 0x0306
    1acd:	7dda                	.insn	2, 0x7dda
    1acf:	0409                	.insn	2, 0x0409
    1ad1:	0100                	.insn	2, 0x0100
    1ad3:	1005                	.insn	2, 0x1005
    1ad5:	0306                	.insn	2, 0x0306
    1ad7:	02a8                	.insn	2, 0x02a8
    1ad9:	0c09                	.insn	2, 0x0c09
    1adb:	0100                	.insn	2, 0x0100
    1add:	0905                	.insn	2, 0x0905
    1adf:	04090103          	lb	sp,64(s2)
    1ae3:	0100                	.insn	2, 0x0100
    1ae5:	0306                	.insn	2, 0x0306
    1ae7:	18097dd7          	.insn	4, 0x18097dd7
    1aeb:	0100                	.insn	2, 0x0100
    1aed:	0505                	.insn	2, 0x0505
    1aef:	0306                	.insn	2, 0x0306
    1af1:	02ae                	.insn	2, 0x02ae
    1af3:	0409                	.insn	2, 0x0409
    1af5:	0100                	.insn	2, 0x0100
    1af7:	0306                	.insn	2, 0x0306
    1af9:	7dd2                	.insn	2, 0x7dd2
    1afb:	0c09                	.insn	2, 0x0c09
    1afd:	0100                	.insn	2, 0x0100
    1aff:	02ae030b          	.insn	4, 0x02ae030b
    1b03:	0809                	.insn	2, 0x0809
    1b05:	0100                	.insn	2, 0x0100
    1b07:	0c09                	.insn	2, 0x0c09
    1b09:	0000                	.insn	2, 0x0000
    1b0b:	0101                	.insn	2, 0x0101

00001b0d <$d.12>:
    1b0d:	05f0                	.insn	2, 0x05f0
    1b0f:	0000                	.insn	2, 0x0000
    1b11:	0004                	.insn	2, 0x0004
    1b13:	0041                	.insn	2, 0x0041
    1b15:	0000                	.insn	2, 0x0000
    1b17:	0101                	.insn	2, 0x0101
    1b19:	fb01                	.insn	2, 0xfb01
    1b1b:	0d0e                	.insn	2, 0x0d0e
    1b1d:	0100                	.insn	2, 0x0100
    1b1f:	0101                	.insn	2, 0x0101
    1b21:	0001                	.insn	2, 0x0001
    1b23:	0000                	.insn	2, 0x0000
    1b25:	0001                	.insn	2, 0x0001
    1b27:	0100                	.insn	2, 0x0100
    1b29:	2f2e                	.insn	2, 0x2f2e
    1b2b:	00637273          	csrrci	tp,0x6,6
    1b2f:	6300                	.insn	2, 0x6300
    1b31:	6f6d6d6f          	jal	s10,d8227 <_binary_shell_bin_size+0xb5e97>
    1b35:	2e6e                	.insn	2, 0x2e6e
    1b37:	0068                	.insn	2, 0x0068
    1b39:	0001                	.insn	2, 0x0001
    1b3b:	7300                	.insn	2, 0x7300
    1b3d:	6e79                	.insn	2, 0x6e79
    1b3f:	7061                	.insn	2, 0x7061
    1b41:	615f 6970 632e      	.insn	6, 0x632e6970615f
    1b47:	0100                	.insn	2, 0x0100
    1b49:	0000                	.insn	2, 0x0000
    1b4b:	6e72656b          	.insn	4, 0x6e72656b
    1b4f:	6c65                	.insn	2, 0x6c65
    1b51:	682e                	.insn	2, 0x682e
    1b53:	0100                	.insn	2, 0x0100
    1b55:	0000                	.insn	2, 0x0000
    1b57:	0400                	.insn	2, 0x0400
    1b59:	0002                	.insn	2, 0x0002
    1b5b:	0205                	.insn	2, 0x0205
    1b5d:	2024                	.insn	2, 0x2024
    1b5f:	0020                	.insn	2, 0x0020
    1b61:	0101ca03          	lbu	s4,16(gp)
    1b65:	0505                	.insn	2, 0x0505
    1b67:	030a                	.insn	2, 0x030a
    1b69:	0905                	.insn	2, 0x0905
    1b6b:	004c                	.insn	2, 0x004c
    1b6d:	0301                	.insn	2, 0x0301
    1b6f:	0901                	.insn	2, 0x0901
    1b71:	0008                	.insn	2, 0x0008
    1b73:	0301                	.insn	2, 0x0301
    1b75:	0902                	.insn	2, 0x0902
    1b77:	0008                	.insn	2, 0x0008
    1b79:	0301                	.insn	2, 0x0301
    1b7b:	0916                	.insn	2, 0x0916
    1b7d:	0008                	.insn	2, 0x0008
    1b7f:	0301                	.insn	2, 0x0301
    1b81:	0901                	.insn	2, 0x0901
    1b83:	0004                	.insn	2, 0x0004
    1b85:	0301                	.insn	2, 0x0301
    1b87:	0902                	.insn	2, 0x0902
    1b89:	0008                	.insn	2, 0x0008
    1b8b:	0301                	.insn	2, 0x0301
    1b8d:	0904                	.insn	2, 0x0904
    1b8f:	0004                	.insn	2, 0x0004
    1b91:	0601                	.insn	2, 0x0601
    1b93:	097e9003          	lh	zero,151(t4)
    1b97:	0004                	.insn	2, 0x0004
    1b99:	0501                	.insn	2, 0x0501
    1b9b:	060d                	.insn	2, 0x060d
    1b9d:	0901f403          	.insn	4, 0x0901f403
    1ba1:	009c                	.insn	2, 0x009c
    1ba3:	0301                	.insn	2, 0x0301
    1ba5:	0901                	.insn	2, 0x0901
    1ba7:	0008                	.insn	2, 0x0008
    1ba9:	0601                	.insn	2, 0x0601
    1bab:	097e8b03          	lb	s6,151(t4)
    1baf:	0008                	.insn	2, 0x0008
    1bb1:	0501                	.insn	2, 0x0501
    1bb3:	0619                	.insn	2, 0x0619
    1bb5:	0901be03          	.insn	4, 0x0901be03
    1bb9:	000c                	.insn	2, 0x000c
    1bbb:	0601                	.insn	2, 0x0601
    1bbd:	097ec203          	lbu	tp,151(t4)
    1bc1:	0008                	.insn	2, 0x0008
    1bc3:	0301                	.insn	2, 0x0301
    1bc5:	01be                	.insn	2, 0x01be
    1bc7:	0409                	.insn	2, 0x0409
    1bc9:	0100                	.insn	2, 0x0100
    1bcb:	097ec203          	lbu	tp,151(t4)
    1bcf:	0008                	.insn	2, 0x0008
    1bd1:	0301                	.insn	2, 0x0301
    1bd3:	01be                	.insn	2, 0x01be
    1bd5:	0409                	.insn	2, 0x0409
    1bd7:	0100                	.insn	2, 0x0100
    1bd9:	097ec203          	lbu	tp,151(t4)
    1bdd:	0008                	.insn	2, 0x0008
    1bdf:	0301                	.insn	2, 0x0301
    1be1:	01be                	.insn	2, 0x01be
    1be3:	0409                	.insn	2, 0x0409
    1be5:	0100                	.insn	2, 0x0100
    1be7:	097ec203          	lbu	tp,151(t4)
    1beb:	0008                	.insn	2, 0x0008
    1bed:	0601                	.insn	2, 0x0601
    1bef:	0901c603          	lbu	a2,144(gp)
    1bf3:	0014                	.insn	2, 0x0014
    1bf5:	0601                	.insn	2, 0x0601
    1bf7:	097eba03          	.insn	4, 0x097eba03
    1bfb:	000c                	.insn	2, 0x000c
    1bfd:	0301                	.insn	2, 0x0301
    1bff:	01c6                	.insn	2, 0x01c6
    1c01:	1809                	.insn	2, 0x1809
    1c03:	0100                	.insn	2, 0x0100
    1c05:	1a05                	.insn	2, 0x1a05
    1c07:	0306                	.insn	2, 0x0306
    1c09:	7f9d                	.insn	2, 0x7f9d
    1c0b:	0409                	.insn	2, 0x0409
    1c0d:	0100                	.insn	2, 0x0100
    1c0f:	2005                	.insn	2, 0x2005
    1c11:	0306                	.insn	2, 0x0306
    1c13:	0900                	.insn	2, 0x0900
    1c15:	0004                	.insn	2, 0x0004
    1c17:	0501                	.insn	2, 0x0501
    1c19:	0619                	.insn	2, 0x0619
    1c1b:	0900e303          	.insn	4, 0x0900e303
    1c1f:	0004                	.insn	2, 0x0004
    1c21:	0501                	.insn	2, 0x0501
    1c23:	0311                	.insn	2, 0x0311
    1c25:	7fa0                	.insn	2, 0x7fa0
    1c27:	0809                	.insn	2, 0x0809
    1c29:	0100                	.insn	2, 0x0100
    1c2b:	1a05                	.insn	2, 0x1a05
    1c2d:	04097d03          	.insn	4, 0x04097d03
    1c31:	0100                	.insn	2, 0x0100
    1c33:	2005                	.insn	2, 0x2005
    1c35:	0306                	.insn	2, 0x0306
    1c37:	0900                	.insn	2, 0x0900
    1c39:	0004                	.insn	2, 0x0004
    1c3b:	0501                	.insn	2, 0x0501
    1c3d:	0611                	.insn	2, 0x0611
    1c3f:	04090303          	lb	t1,64(s2)
    1c43:	0100                	.insn	2, 0x0100
    1c45:	1a05                	.insn	2, 0x1a05
    1c47:	04097d03          	.insn	4, 0x04097d03
    1c4b:	0100                	.insn	2, 0x0100
    1c4d:	2005                	.insn	2, 0x2005
    1c4f:	0306                	.insn	2, 0x0306
    1c51:	0900                	.insn	2, 0x0900
    1c53:	0004                	.insn	2, 0x0004
    1c55:	0501                	.insn	2, 0x0501
    1c57:	0611                	.insn	2, 0x0611
    1c59:	04090303          	lb	t1,64(s2)
    1c5d:	0100                	.insn	2, 0x0100
    1c5f:	1a05                	.insn	2, 0x1a05
    1c61:	04097d03          	.insn	4, 0x04097d03
    1c65:	0100                	.insn	2, 0x0100
    1c67:	2005                	.insn	2, 0x2005
    1c69:	0306                	.insn	2, 0x0306
    1c6b:	0900                	.insn	2, 0x0900
    1c6d:	0004                	.insn	2, 0x0004
    1c6f:	0501                	.insn	2, 0x0501
    1c71:	0611                	.insn	2, 0x0611
    1c73:	04090303          	lb	t1,64(s2)
    1c77:	0100                	.insn	2, 0x0100
    1c79:	0901aa03          	lw	s4,144(gp)
    1c7d:	0004                	.insn	2, 0x0004
    1c7f:	0301                	.insn	2, 0x0301
    1c81:	0901                	.insn	2, 0x0901
    1c83:	0008                	.insn	2, 0x0008
    1c85:	0501                	.insn	2, 0x0501
    1c87:	0315                	.insn	2, 0x0315
    1c89:	000c0903          	lb	s2,0(s8)
    1c8d:	0301                	.insn	2, 0x0301
    1c8f:	0901                	.insn	2, 0x0901
    1c91:	0008                	.insn	2, 0x0008
    1c93:	0501                	.insn	2, 0x0501
    1c95:	0319                	.insn	2, 0x0319
    1c97:	090a                	.insn	2, 0x090a
    1c99:	0008                	.insn	2, 0x0008
    1c9b:	0601                	.insn	2, 0x0601
    1c9d:	097de103          	.insn	4, 0x097de103
    1ca1:	0004                	.insn	2, 0x0004
    1ca3:	0501                	.insn	2, 0x0501
    1ca5:	0615                	.insn	2, 0x0615
    1ca7:	09029703          	lh	a4,144(t0)
    1cab:	0008                	.insn	2, 0x0008
    1cad:	0301                	.insn	2, 0x0301
    1caf:	0901                	.insn	2, 0x0901
    1cb1:	0008                	.insn	2, 0x0008
    1cb3:	0501                	.insn	2, 0x0501
    1cb5:	0319                	.insn	2, 0x0319
    1cb7:	00040907          	.insn	4, 0x00040907
    1cbb:	0601                	.insn	2, 0x0601
    1cbd:	097de103          	.insn	4, 0x097de103
    1cc1:	0004                	.insn	2, 0x0004
    1cc3:	0501                	.insn	2, 0x0501
    1cc5:	0615                	.insn	2, 0x0615
    1cc7:	0902a003          	lw	zero,144(t0)
    1ccb:	0004                	.insn	2, 0x0004
    1ccd:	0501                	.insn	2, 0x0501
    1ccf:	0319                	.insn	2, 0x0319
    1cd1:	097f 0004 0501 0600 	.insn	10, 0x0003060005010004097f
    1cd9:	0003 
    1cdb:	0409                	.insn	2, 0x0409
    1cdd:	0100                	.insn	2, 0x0100
    1cdf:	1105                	.insn	2, 0x1105
    1ce1:	04090003          	lb	zero,64(s2)
    1ce5:	0100                	.insn	2, 0x0100
    1ce7:	3105                	.insn	2, 0x3105
    1ce9:	0306                	.insn	2, 0x0306
    1ceb:	0004095b          	.insn	4, 0x0004095b
    1cef:	0601                	.insn	2, 0x0601
    1cf1:	097e8603          	lb	a2,151(t4)
    1cf5:	0004                	.insn	2, 0x0004
    1cf7:	0501                	.insn	2, 0x0501
    1cf9:	030d                	.insn	2, 0x030d
    1cfb:	01fa                	.insn	2, 0x01fa
    1cfd:	0409                	.insn	2, 0x0409
    1cff:	0100                	.insn	2, 0x0100
    1d01:	1305                	.insn	2, 0x1305
    1d03:	0306                	.insn	2, 0x0306
    1d05:	04097ec3          	.insn	4, 0x04097ec3
    1d09:	0100                	.insn	2, 0x0100
    1d0b:	04090103          	lb	sp,64(s2)
    1d0f:	0100                	.insn	2, 0x0100
    1d11:	04090103          	lb	sp,64(s2)
    1d15:	0100                	.insn	2, 0x0100
    1d17:	04090103          	lb	sp,64(s2)
    1d1b:	0100                	.insn	2, 0x0100
    1d1d:	1505                	.insn	2, 0x1505
    1d1f:	0901ed03          	.insn	4, 0x0901ed03
    1d23:	0004                	.insn	2, 0x0004
    1d25:	0501                	.insn	2, 0x0501
    1d27:	0003063b          	.insn	4, 0x0003063b
    1d2b:	0c09                	.insn	2, 0x0c09
    1d2d:	0100                	.insn	2, 0x0100
    1d2f:	097dd303          	lhu	t1,151(s11)
    1d33:	0004                	.insn	2, 0x0004
    1d35:	0501                	.insn	2, 0x0501
    1d37:	0315                	.insn	2, 0x0315
    1d39:	02ad                	.insn	2, 0x02ad
    1d3b:	0409                	.insn	2, 0x0409
    1d3d:	0100                	.insn	2, 0x0100
    1d3f:	3b05                	.insn	2, 0x3b05
    1d41:	04090003          	lb	zero,64(s2)
    1d45:	0100                	.insn	2, 0x0100
    1d47:	097dd303          	lhu	t1,151(s11)
    1d4b:	0004                	.insn	2, 0x0004
    1d4d:	0501                	.insn	2, 0x0501
    1d4f:	0315                	.insn	2, 0x0315
    1d51:	02ad                	.insn	2, 0x02ad
    1d53:	0409                	.insn	2, 0x0409
    1d55:	0100                	.insn	2, 0x0100
    1d57:	3b05                	.insn	2, 0x3b05
    1d59:	04090003          	lb	zero,64(s2)
    1d5d:	0100                	.insn	2, 0x0100
    1d5f:	097dd303          	lhu	t1,151(s11)
    1d63:	0004                	.insn	2, 0x0004
    1d65:	0501                	.insn	2, 0x0501
    1d67:	0315                	.insn	2, 0x0315
    1d69:	02ad                	.insn	2, 0x02ad
    1d6b:	0409                	.insn	2, 0x0409
    1d6d:	0100                	.insn	2, 0x0100
    1d6f:	2d05                	.insn	2, 0x2d05
    1d71:	0306                	.insn	2, 0x0306
    1d73:	0944                	.insn	2, 0x0944
    1d75:	0008                	.insn	2, 0x0008
    1d77:	0501                	.insn	2, 0x0501
    1d79:	093c033b          	.insn	4, 0x093c033b
    1d7d:	0004                	.insn	2, 0x0004
    1d7f:	0601                	.insn	2, 0x0601
    1d81:	097dd303          	lhu	t1,151(s11)
    1d85:	0004                	.insn	2, 0x0004
    1d87:	0501                	.insn	2, 0x0501
    1d89:	0609                	.insn	2, 0x0609
    1d8b:	0901f103          	.insn	4, 0x0901f103
    1d8f:	0004                	.insn	2, 0x0004
    1d91:	0601                	.insn	2, 0x0601
    1d93:	097e8f03          	lb	t5,151(t4)
    1d97:	0004                	.insn	2, 0x0004
    1d99:	0501                	.insn	2, 0x0501
    1d9b:	0629                	.insn	2, 0x0629
    1d9d:	0901f003          	.insn	4, 0x0901f003
    1da1:	0004                	.insn	2, 0x0004
    1da3:	0601                	.insn	2, 0x0601
    1da5:	097e9003          	lh	zero,151(t4)
    1da9:	0004                	.insn	2, 0x0004
    1dab:	0501                	.insn	2, 0x0501
    1dad:	0305                	.insn	2, 0x0305
    1daf:	01f0                	.insn	2, 0x01f0
    1db1:	0409                	.insn	2, 0x0409
    1db3:	0100                	.insn	2, 0x0100
    1db5:	097e9003          	lh	zero,151(t4)
    1db9:	0004                	.insn	2, 0x0004
    1dbb:	0501                	.insn	2, 0x0501
    1dbd:	0601                	.insn	2, 0x0601
    1dbf:	02b4030b          	.insn	4, 0x02b4030b
    1dc3:	3409                	.insn	2, 0x3409
    1dc5:	0100                	.insn	2, 0x0100
    1dc7:	0905                	.insn	2, 0x0905
    1dc9:	030a                	.insn	2, 0x030a
    1dcb:	00080907          	.insn	4, 0x00080907
    1dcf:	0601                	.insn	2, 0x0601
    1dd1:	08090003          	lb	zero,128(s2)
    1dd5:	0100                	.insn	2, 0x0100
    1dd7:	097dc503          	lbu	a0,151(s11)
    1ddb:	0004                	.insn	2, 0x0004
    1ddd:	0501                	.insn	2, 0x0501
    1ddf:	0612                	.insn	2, 0x0612
    1de1:	0902bd03          	.insn	4, 0x0902bd03
    1de5:	0008                	.insn	2, 0x0008
    1de7:	0501                	.insn	2, 0x0501
    1de9:	060a                	.insn	2, 0x060a
    1deb:	04090003          	lb	zero,64(s2)
    1def:	0100                	.insn	2, 0x0100
    1df1:	1205                	.insn	2, 0x1205
    1df3:	0306                	.insn	2, 0x0306
    1df5:	0901                	.insn	2, 0x0901
    1df7:	0004                	.insn	2, 0x0004
    1df9:	0501                	.insn	2, 0x0501
    1dfb:	060a                	.insn	2, 0x060a
    1dfd:	04090003          	lb	zero,64(s2)
    1e01:	0100                	.insn	2, 0x0100
    1e03:	1205                	.insn	2, 0x1205
    1e05:	0306                	.insn	2, 0x0306
    1e07:	0901                	.insn	2, 0x0901
    1e09:	0004                	.insn	2, 0x0004
    1e0b:	0501                	.insn	2, 0x0501
    1e0d:	060a                	.insn	2, 0x060a
    1e0f:	04090003          	lb	zero,64(s2)
    1e13:	0100                	.insn	2, 0x0100
    1e15:	0505                	.insn	2, 0x0505
    1e17:	0306                	.insn	2, 0x0306
    1e19:	0901                	.insn	2, 0x0901
    1e1b:	0008                	.insn	2, 0x0008
    1e1d:	0501                	.insn	2, 0x0501
    1e1f:	0300                	.insn	2, 0x0300
    1e21:	0906                	.insn	2, 0x0906
    1e23:	0004                	.insn	2, 0x0004
    1e25:	0501                	.insn	2, 0x0501
    1e27:	0a19                	.insn	2, 0x0a19
    1e29:	40090903          	lb	s2,1024(s2)
    1e2d:	0100                	.insn	2, 0x0100
    1e2f:	1b05                	.insn	2, 0x1b05
    1e31:	04090103          	lb	sp,64(s2)
    1e35:	0100                	.insn	2, 0x0100
    1e37:	1905                	.insn	2, 0x1905
    1e39:	0306                	.insn	2, 0x0306
    1e3b:	0900                	.insn	2, 0x0900
    1e3d:	0004                	.insn	2, 0x0004
    1e3f:	0501                	.insn	2, 0x0501
    1e41:	7f03061b          	.insn	4, 0x7f03061b
    1e45:	0409                	.insn	2, 0x0409
    1e47:	0100                	.insn	2, 0x0100
    1e49:	1905                	.insn	2, 0x1905
    1e4b:	0306                	.insn	2, 0x0306
    1e4d:	0900                	.insn	2, 0x0900
    1e4f:	0004                	.insn	2, 0x0004
    1e51:	0501                	.insn	2, 0x0501
    1e53:	0103061b          	.insn	4, 0x0103061b
    1e57:	0409                	.insn	2, 0x0409
    1e59:	0100                	.insn	2, 0x0100
    1e5b:	1905                	.insn	2, 0x1905
    1e5d:	0306                	.insn	2, 0x0306
    1e5f:	0900                	.insn	2, 0x0900
    1e61:	0004                	.insn	2, 0x0004
    1e63:	0501                	.insn	2, 0x0501
    1e65:	7f03061b          	.insn	4, 0x7f03061b
    1e69:	0409                	.insn	2, 0x0409
    1e6b:	0100                	.insn	2, 0x0100
    1e6d:	1905                	.insn	2, 0x1905
    1e6f:	0306                	.insn	2, 0x0306
    1e71:	0900                	.insn	2, 0x0900
    1e73:	0004                	.insn	2, 0x0004
    1e75:	0501                	.insn	2, 0x0501
    1e77:	0103061b          	.insn	4, 0x0103061b
    1e7b:	0409                	.insn	2, 0x0409
    1e7d:	0100                	.insn	2, 0x0100
    1e7f:	1905                	.insn	2, 0x1905
    1e81:	0306                	.insn	2, 0x0306
    1e83:	0900                	.insn	2, 0x0900
    1e85:	0004                	.insn	2, 0x0004
    1e87:	0601                	.insn	2, 0x0601
    1e89:	04097f03          	.insn	4, 0x04097f03
    1e8d:	0100                	.insn	2, 0x0100
    1e8f:	1b05                	.insn	2, 0x1b05
    1e91:	04090103          	lb	sp,64(s2)
    1e95:	0100                	.insn	2, 0x0100
    1e97:	1905                	.insn	2, 0x1905
    1e99:	0306                	.insn	2, 0x0306
    1e9b:	0900                	.insn	2, 0x0900
    1e9d:	0004                	.insn	2, 0x0004
    1e9f:	0601                	.insn	2, 0x0601
    1ea1:	04097f03          	.insn	4, 0x04097f03
    1ea5:	0100                	.insn	2, 0x0100
    1ea7:	1b05                	.insn	2, 0x1b05
    1ea9:	04090103          	lb	sp,64(s2)
    1ead:	0100                	.insn	2, 0x0100
    1eaf:	1905                	.insn	2, 0x1905
    1eb1:	0306                	.insn	2, 0x0306
    1eb3:	0900                	.insn	2, 0x0900
    1eb5:	0004                	.insn	2, 0x0004
    1eb7:	0501                	.insn	2, 0x0501
    1eb9:	7f03061b          	.insn	4, 0x7f03061b
    1ebd:	0409                	.insn	2, 0x0409
    1ebf:	0100                	.insn	2, 0x0100
    1ec1:	1905                	.insn	2, 0x1905
    1ec3:	0306                	.insn	2, 0x0306
    1ec5:	0900                	.insn	2, 0x0900
    1ec7:	0004                	.insn	2, 0x0004
    1ec9:	0601                	.insn	2, 0x0601
    1ecb:	04090103          	lb	sp,64(s2)
    1ecf:	0100                	.insn	2, 0x0100
    1ed1:	1b05                	.insn	2, 0x1b05
    1ed3:	04097f03          	.insn	4, 0x04097f03
    1ed7:	0100                	.insn	2, 0x0100
    1ed9:	1905                	.insn	2, 0x1905
    1edb:	0306                	.insn	2, 0x0306
    1edd:	0900                	.insn	2, 0x0900
    1edf:	0004                	.insn	2, 0x0004
    1ee1:	0501                	.insn	2, 0x0501
    1ee3:	0103061b          	.insn	4, 0x0103061b
    1ee7:	0409                	.insn	2, 0x0409
    1ee9:	0100                	.insn	2, 0x0100
    1eeb:	1905                	.insn	2, 0x1905
    1eed:	0306                	.insn	2, 0x0306
    1eef:	0900                	.insn	2, 0x0900
    1ef1:	0004                	.insn	2, 0x0004
    1ef3:	0501                	.insn	2, 0x0501
    1ef5:	7f03061b          	.insn	4, 0x7f03061b
    1ef9:	0409                	.insn	2, 0x0409
    1efb:	0100                	.insn	2, 0x0100
    1efd:	1905                	.insn	2, 0x1905
    1eff:	0306                	.insn	2, 0x0306
    1f01:	0900                	.insn	2, 0x0900
    1f03:	0004                	.insn	2, 0x0004
    1f05:	0601                	.insn	2, 0x0601
    1f07:	04090103          	lb	sp,64(s2)
    1f0b:	0100                	.insn	2, 0x0100
    1f0d:	1b05                	.insn	2, 0x1b05
    1f0f:	04097f03          	.insn	4, 0x04097f03
    1f13:	0100                	.insn	2, 0x0100
    1f15:	1905                	.insn	2, 0x1905
    1f17:	0306                	.insn	2, 0x0306
    1f19:	0900                	.insn	2, 0x0900
    1f1b:	0004                	.insn	2, 0x0004
    1f1d:	0501                	.insn	2, 0x0501
    1f1f:	0103061b          	.insn	4, 0x0103061b
    1f23:	0409                	.insn	2, 0x0409
    1f25:	0100                	.insn	2, 0x0100
    1f27:	1905                	.insn	2, 0x1905
    1f29:	0306                	.insn	2, 0x0306
    1f2b:	0900                	.insn	2, 0x0900
    1f2d:	0004                	.insn	2, 0x0004
    1f2f:	0501                	.insn	2, 0x0501
    1f31:	7f03061b          	.insn	4, 0x7f03061b
    1f35:	0409                	.insn	2, 0x0409
    1f37:	0100                	.insn	2, 0x0100
    1f39:	1905                	.insn	2, 0x1905
    1f3b:	0306                	.insn	2, 0x0306
    1f3d:	0900                	.insn	2, 0x0900
    1f3f:	0004                	.insn	2, 0x0004
    1f41:	0601                	.insn	2, 0x0601
    1f43:	04090103          	lb	sp,64(s2)
    1f47:	0100                	.insn	2, 0x0100
    1f49:	1b05                	.insn	2, 0x1b05
    1f4b:	04097f03          	.insn	4, 0x04097f03
    1f4f:	0100                	.insn	2, 0x0100
    1f51:	1905                	.insn	2, 0x1905
    1f53:	0306                	.insn	2, 0x0306
    1f55:	0900                	.insn	2, 0x0900
    1f57:	0004                	.insn	2, 0x0004
    1f59:	0501                	.insn	2, 0x0501
    1f5b:	0103061b          	.insn	4, 0x0103061b
    1f5f:	0409                	.insn	2, 0x0409
    1f61:	0100                	.insn	2, 0x0100
    1f63:	1905                	.insn	2, 0x1905
    1f65:	0306                	.insn	2, 0x0306
    1f67:	0900                	.insn	2, 0x0900
    1f69:	0004                	.insn	2, 0x0004
    1f6b:	0501                	.insn	2, 0x0501
    1f6d:	7f03061b          	.insn	4, 0x7f03061b
    1f71:	0409                	.insn	2, 0x0409
    1f73:	0100                	.insn	2, 0x0100
    1f75:	1905                	.insn	2, 0x1905
    1f77:	0306                	.insn	2, 0x0306
    1f79:	0900                	.insn	2, 0x0900
    1f7b:	0004                	.insn	2, 0x0004
    1f7d:	0601                	.insn	2, 0x0601
    1f7f:	04090103          	lb	sp,64(s2)
    1f83:	0100                	.insn	2, 0x0100
    1f85:	1705                	.insn	2, 0x1705
    1f87:	04097b03          	.insn	4, 0x04097b03
    1f8b:	0100                	.insn	2, 0x0100
    1f8d:	0505                	.insn	2, 0x0505
    1f8f:	0306                	.insn	2, 0x0306
    1f91:	0900                	.insn	2, 0x0900
    1f93:	000c                	.insn	2, 0x000c
    1f95:	0501                	.insn	2, 0x0501
    1f97:	0611                	.insn	2, 0x0611
    1f99:	04090a03          	lb	s4,64(s2)
    1f9d:	0100                	.insn	2, 0x0100
    1f9f:	10090103          	lb	sp,256(s2)
    1fa3:	0100                	.insn	2, 0x0100
    1fa5:	08090103          	lb	sp,128(s2)
    1fa9:	0100                	.insn	2, 0x0100
    1fab:	0505                	.insn	2, 0x0505
    1fad:	04090403          	lb	s0,64(s2)
    1fb1:	0100                	.insn	2, 0x0100
    1fb3:	0306                	.insn	2, 0x0306
    1fb5:	7da5                	.insn	2, 0x7da5
    1fb7:	0409                	.insn	2, 0x0409
    1fb9:	0100                	.insn	2, 0x0100
    1fbb:	0905                	.insn	2, 0x0905
    1fbd:	0306                	.insn	2, 0x0306
    1fbf:	02dc                	.insn	2, 0x02dc
    1fc1:	0809                	.insn	2, 0x0809
    1fc3:	0100                	.insn	2, 0x0100
    1fc5:	1e05                	.insn	2, 0x1e05
    1fc7:	1c090103          	lb	sp,448(s2)
    1fcb:	0100                	.insn	2, 0x0100
    1fcd:	0d05                	.insn	2, 0x0d05
    1fcf:	0306                	.insn	2, 0x0306
    1fd1:	0900                	.insn	2, 0x0900
    1fd3:	0004                	.insn	2, 0x0004
    1fd5:	0601                	.insn	2, 0x0601
    1fd7:	08090103          	lb	sp,128(s2)
    1fdb:	0100                	.insn	2, 0x0100
    1fdd:	1b05                	.insn	2, 0x1b05
    1fdf:	0c097e03          	.insn	4, 0x0c097e03
    1fe3:	0100                	.insn	2, 0x0100
    1fe5:	0905                	.insn	2, 0x0905
    1fe7:	08090403          	lb	s0,128(s2)
    1feb:	0100                	.insn	2, 0x0100
    1fed:	2405                	.insn	2, 0x2405
    1fef:	0c097b03          	.insn	4, 0x0c097b03
    1ff3:	0100                	.insn	2, 0x0100
    1ff5:	0505                	.insn	2, 0x0505
    1ff7:	0306                	.insn	2, 0x0306
    1ff9:	0900                	.insn	2, 0x0900
    1ffb:	0004                	.insn	2, 0x0004
    1ffd:	0601                	.insn	2, 0x0601
    1fff:	08090703          	lb	a4,128(s2)
    2003:	0100                	.insn	2, 0x0100
    2005:	0c090203          	lb	tp,192(s2)
    2009:	0100                	.insn	2, 0x0100
    200b:	0306                	.insn	2, 0x0306
    200d:	7d9c                	.insn	2, 0x7d9c
    200f:	0409                	.insn	2, 0x0409
    2011:	0100                	.insn	2, 0x0100
    2013:	0905                	.insn	2, 0x0905
    2015:	0306                	.insn	2, 0x0306
    2017:	02e5                	.insn	2, 0x02e5
    2019:	1009                	.insn	2, 0x1009
    201b:	0100                	.insn	2, 0x0100
    201d:	1e05                	.insn	2, 0x1e05
    201f:	1c090103          	lb	sp,448(s2)
    2023:	0100                	.insn	2, 0x0100
    2025:	0d05                	.insn	2, 0x0d05
    2027:	0306                	.insn	2, 0x0306
    2029:	0900                	.insn	2, 0x0900
    202b:	0004                	.insn	2, 0x0004
    202d:	0601                	.insn	2, 0x0601
    202f:	08090103          	lb	sp,128(s2)
    2033:	0100                	.insn	2, 0x0100
    2035:	1b05                	.insn	2, 0x1b05
    2037:	0c097e03          	.insn	4, 0x0c097e03
    203b:	0100                	.insn	2, 0x0100
    203d:	0905                	.insn	2, 0x0905
    203f:	08090403          	lb	s0,128(s2)
    2043:	0100                	.insn	2, 0x0100
    2045:	2405                	.insn	2, 0x2405
    2047:	0c097b03          	.insn	4, 0x0c097b03
    204b:	0100                	.insn	2, 0x0100
    204d:	0505                	.insn	2, 0x0505
    204f:	0306                	.insn	2, 0x0306
    2051:	0900                	.insn	2, 0x0900
    2053:	0004                	.insn	2, 0x0004
    2055:	0601                	.insn	2, 0x0601
    2057:	0c097e03          	.insn	4, 0x0c097e03
    205b:	0100                	.insn	2, 0x0100
    205d:	0c090903          	lb	s2,192(s2)
    2061:	0100                	.insn	2, 0x0100
    2063:	0c090603          	lb	a2,192(s2)
    2067:	0100                	.insn	2, 0x0100
    2069:	10090103          	lb	sp,256(s2)
    206d:	0100                	.insn	2, 0x0100
    206f:	28090603          	lb	a2,640(s2)
    2073:	0100                	.insn	2, 0x0100
    2075:	10090403          	lb	s0,256(s2)
    2079:	0100                	.insn	2, 0x0100
    207b:	0306                	.insn	2, 0x0306
    207d:	7d84                	.insn	2, 0x7d84
    207f:	0409                	.insn	2, 0x0409
    2081:	0100                	.insn	2, 0x0100
    2083:	0902fc03          	.insn	4, 0x0902fc03
    2087:	0004                	.insn	2, 0x0004
    2089:	0501                	.insn	2, 0x0501
    208b:	0609                	.insn	2, 0x0609
    208d:	08090103          	lb	sp,128(s2)
    2091:	0100                	.insn	2, 0x0100
    2093:	1e05                	.insn	2, 0x1e05
    2095:	1c090103          	lb	sp,448(s2)
    2099:	0100                	.insn	2, 0x0100
    209b:	0d05                	.insn	2, 0x0d05
    209d:	0306                	.insn	2, 0x0306
    209f:	0900                	.insn	2, 0x0900
    20a1:	0004                	.insn	2, 0x0004
    20a3:	0601                	.insn	2, 0x0601
    20a5:	08090103          	lb	sp,128(s2)
    20a9:	0100                	.insn	2, 0x0100
    20ab:	1b05                	.insn	2, 0x1b05
    20ad:	0c097e03          	.insn	4, 0x0c097e03
    20b1:	0100                	.insn	2, 0x0100
    20b3:	0905                	.insn	2, 0x0905
    20b5:	08090403          	lb	s0,128(s2)
    20b9:	0100                	.insn	2, 0x0100
    20bb:	2405                	.insn	2, 0x2405
    20bd:	0c097b03          	.insn	4, 0x0c097b03
    20c1:	0100                	.insn	2, 0x0100
    20c3:	0505                	.insn	2, 0x0505
    20c5:	0306                	.insn	2, 0x0306
    20c7:	0900                	.insn	2, 0x0900
    20c9:	0004                	.insn	2, 0x0004
    20cb:	0601                	.insn	2, 0x0601
    20cd:	0c096f03          	.insn	4, 0x0c096f03
    20d1:	0100                	.insn	2, 0x0100
    20d3:	0c090603          	lb	a2,192(s2)
    20d7:	0100                	.insn	2, 0x0100
    20d9:	10090103          	lb	sp,256(s2)
    20dd:	0100                	.insn	2, 0x0100
    20df:	24090603          	lb	a2,576(s2)
    20e3:	0100                	.insn	2, 0x0100
    20e5:	10090b03          	lb	s6,256(s2)
    20e9:	0100                	.insn	2, 0x0100
    20eb:	0306                	.insn	2, 0x0306
    20ed:	7cfd                	.insn	2, 0x7cfd
    20ef:	0c09                	.insn	2, 0x0c09
    20f1:	0100                	.insn	2, 0x0100
    20f3:	0383030b          	.insn	4, 0x0383030b
    20f7:	1809                	.insn	2, 0x1809
    20f9:	0100                	.insn	2, 0x0100
    20fb:	0c09                	.insn	2, 0x0c09
    20fd:	0000                	.insn	2, 0x0000
    20ff:	0101                	.insn	2, 0x0101

00002101 <$d.10>:
    2101:	02ff 0000 0004 0042 	.insn	10, 0x00420004000002ff
    2109:	0000 
    210b:	0101                	.insn	2, 0x0101
    210d:	fb01                	.insn	2, 0xfb01
    210f:	0d0e                	.insn	2, 0x0d0e
    2111:	0100                	.insn	2, 0x0100
    2113:	0101                	.insn	2, 0x0101
    2115:	0001                	.insn	2, 0x0001
    2117:	0000                	.insn	2, 0x0000
    2119:	0001                	.insn	2, 0x0001
    211b:	0100                	.insn	2, 0x0100
    211d:	2f2e                	.insn	2, 0x2f2e
    211f:	00637273          	csrrci	tp,0x6,6
    2123:	7300                	.insn	2, 0x7300
    2125:	6364                	.insn	2, 0x6364
    2127:	7261                	.insn	2, 0x7261
    2129:	5f64                	.insn	2, 0x5f64
    212b:	7061                	.insn	2, 0x7061
    212d:	2e69                	.insn	2, 0x2e69
    212f:	00010063          	beqz	sp,212f <$d.10+0x2e>
    2133:	6300                	.insn	2, 0x6300
    2135:	6f6d6d6f          	jal	s10,d882b <_binary_shell_bin_size+0xb649b>
    2139:	2e6e                	.insn	2, 0x2e6e
    213b:	0068                	.insn	2, 0x0068
    213d:	0001                	.insn	2, 0x0001
    213f:	6b00                	.insn	2, 0x6b00
    2141:	7265                	.insn	2, 0x7265
    2143:	656e                	.insn	2, 0x656e
    2145:	2e6c                	.insn	2, 0x2e6c
    2147:	0068                	.insn	2, 0x0068
    2149:	0001                	.insn	2, 0x0001
    214b:	0000                	.insn	2, 0x0000
    214d:	0500                	.insn	2, 0x0500
    214f:	5802                	.insn	2, 0x5802
    2151:	2026                	.insn	2, 0x2026
    2153:	0300                	.insn	2, 0x0300
    2155:	00d2                	.insn	2, 0x00d2
    2157:	0501                	.insn	2, 0x0501
    2159:	0a05                	.insn	2, 0x0a05
    215b:	40090603          	lb	a2,1024(s2)
    215f:	0100                	.insn	2, 0x0100
    2161:	1405                	.insn	2, 0x1405
    2163:	097fbf03          	.insn	4, 0x097fbf03
    2167:	0040                	.insn	2, 0x0040
    2169:	0501                	.insn	2, 0x0501
    216b:	0305                	.insn	2, 0x0305
    216d:	0975                	.insn	2, 0x0975
    216f:	0008                	.insn	2, 0x0008
    2171:	0501                	.insn	2, 0x0501
    2173:	0309                	.insn	2, 0x0309
    2175:	0901                	.insn	2, 0x0901
    2177:	0004                	.insn	2, 0x0004
    2179:	0501                	.insn	2, 0x0501
    217b:	0305                	.insn	2, 0x0305
    217d:	097f 0004 0501 030a 	.insn	10, 0x090f030a05010004097f
    2185:	090f 
    2187:	0004                	.insn	2, 0x0004
    2189:	0501                	.insn	2, 0x0501
    218b:	0619                	.insn	2, 0x0619
    218d:	04090003          	lb	zero,64(s2)
    2191:	0100                	.insn	2, 0x0100
    2193:	0905                	.insn	2, 0x0905
    2195:	04090003          	lb	zero,64(s2)
    2199:	0100                	.insn	2, 0x0100
    219b:	1805                	.insn	2, 0x1805
    219d:	0306                	.insn	2, 0x0306
    219f:	0901                	.insn	2, 0x0901
    21a1:	0004                	.insn	2, 0x0004
    21a3:	0601                	.insn	2, 0x0601
    21a5:	04096303          	.insn	4, 0x04096303
    21a9:	0100                	.insn	2, 0x0100
    21ab:	0c05                	.insn	2, 0x0c05
    21ad:	0306                	.insn	2, 0x0306
    21af:	0921                	.insn	2, 0x0921
    21b1:	0004                	.insn	2, 0x0004
    21b3:	0501                	.insn	2, 0x0501
    21b5:	0003061b          	.insn	4, 0x0003061b
    21b9:	0409                	.insn	2, 0x0409
    21bb:	0100                	.insn	2, 0x0100
    21bd:	0505                	.insn	2, 0x0505
    21bf:	04090003          	lb	zero,64(s2)
    21c3:	0100                	.insn	2, 0x0100
    21c5:	1705                	.insn	2, 0x1705
    21c7:	0306                	.insn	2, 0x0306
    21c9:	0901                	.insn	2, 0x0901
    21cb:	0004                	.insn	2, 0x0004
    21cd:	0501                	.insn	2, 0x0501
    21cf:	060d                	.insn	2, 0x060d
    21d1:	04090003          	lb	zero,64(s2)
    21d5:	0100                	.insn	2, 0x0100
    21d7:	08095e03          	lhu	t3,128(s2)
    21db:	0100                	.insn	2, 0x0100
    21dd:	0505                	.insn	2, 0x0505
    21df:	0306                	.insn	2, 0x0306
    21e1:	090d                	.insn	2, 0x090d
    21e3:	0004                	.insn	2, 0x0004
    21e5:	0501                	.insn	2, 0x0501
    21e7:	0309                	.insn	2, 0x0309
    21e9:	0901                	.insn	2, 0x0901
    21eb:	0004                	.insn	2, 0x0004
    21ed:	0501                	.insn	2, 0x0501
    21ef:	0305                	.insn	2, 0x0305
    21f1:	097f 0004 0501 0313 	.insn	10, 0x091c031305010004097f
    21f9:	091c 
    21fb:	0004                	.insn	2, 0x0004
    21fd:	0501                	.insn	2, 0x0501
    21ff:	0314                	.insn	2, 0x0314
    2201:	0901                	.insn	2, 0x0901
    2203:	0004                	.insn	2, 0x0004
    2205:	0501                	.insn	2, 0x0501
    2207:	0305                	.insn	2, 0x0305
    2209:	00080963          	beqz	a6,221b <$d.10+0x11a>
    220d:	0501                	.insn	2, 0x0501
    220f:	0309                	.insn	2, 0x0309
    2211:	0901                	.insn	2, 0x0901
    2213:	0004                	.insn	2, 0x0004
    2215:	0501                	.insn	2, 0x0501
    2217:	0305                	.insn	2, 0x0305
    2219:	097f 0004 0601 7303 	.insn	10, 0x0409730306010004097f
    2221:	0409 
    2223:	0100                	.insn	2, 0x0100
    2225:	0d05                	.insn	2, 0x0d05
    2227:	0306                	.insn	2, 0x0306
    2229:	0930                	.insn	2, 0x0930
    222b:	0004                	.insn	2, 0x0004
    222d:	0501                	.insn	2, 0x0501
    222f:	061c                	.insn	2, 0x061c
    2231:	04090003          	lb	zero,64(s2)
    2235:	0100                	.insn	2, 0x0100
    2237:	0505                	.insn	2, 0x0505
    2239:	04090003          	lb	zero,64(s2)
    223d:	0100                	.insn	2, 0x0100
    223f:	1705                	.insn	2, 0x1705
    2241:	0306                	.insn	2, 0x0306
    2243:	0901                	.insn	2, 0x0901
    2245:	0004                	.insn	2, 0x0004
    2247:	0501                	.insn	2, 0x0501
    2249:	060d                	.insn	2, 0x060d
    224b:	04090003          	lb	zero,64(s2)
    224f:	0100                	.insn	2, 0x0100
    2251:	0306                	.insn	2, 0x0306
    2253:	0004092b          	.insn	4, 0x0004092b
    2257:	0501                	.insn	2, 0x0501
    2259:	0331                	.insn	2, 0x0331
    225b:	097d                	.insn	2, 0x097d
    225d:	0010                	.insn	2, 0x0010
    225f:	0501                	.insn	2, 0x0501
    2261:	0605                	.insn	2, 0x0605
    2263:	04090003          	lb	zero,64(s2)
    2267:	0100                	.insn	2, 0x0100
    2269:	097fa703          	lw	a4,151(t6)
    226d:	0008                	.insn	2, 0x0008
    226f:	0501                	.insn	2, 0x0501
    2271:	0609                	.insn	2, 0x0609
    2273:	04090e03          	lb	t3,64(s2)
    2277:	0100                	.insn	2, 0x0100
    2279:	0306                	.insn	2, 0x0306
    227b:	0972                	.insn	2, 0x0972
    227d:	00c8                	.insn	2, 0x00c8
    227f:	0501                	.insn	2, 0x0501
    2281:	0610                	.insn	2, 0x0610
    2283:	04093a03          	.insn	4, 0x04093a03
    2287:	0100                	.insn	2, 0x0100
    2289:	1f05                	.insn	2, 0x1f05
    228b:	0306                	.insn	2, 0x0306
    228d:	0900                	.insn	2, 0x0900
    228f:	0004                	.insn	2, 0x0004
    2291:	0501                	.insn	2, 0x0501
    2293:	0309                	.insn	2, 0x0309
    2295:	0900                	.insn	2, 0x0900
    2297:	0004                	.insn	2, 0x0004
    2299:	0501                	.insn	2, 0x0501
    229b:	0103061b          	.insn	4, 0x0103061b
    229f:	0409                	.insn	2, 0x0409
    22a1:	0100                	.insn	2, 0x0100
    22a3:	1105                	.insn	2, 0x1105
    22a5:	0306                	.insn	2, 0x0306
    22a7:	0900                	.insn	2, 0x0900
    22a9:	0004                	.insn	2, 0x0004
    22ab:	0501                	.insn	2, 0x0501
    22ad:	0622                	.insn	2, 0x0622
    22af:	08090203          	lb	tp,128(s2)
    22b3:	0100                	.insn	2, 0x0100
    22b5:	0905                	.insn	2, 0x0905
    22b7:	0306                	.insn	2, 0x0306
    22b9:	0900                	.insn	2, 0x0900
    22bb:	0004                	.insn	2, 0x0004
    22bd:	0501                	.insn	2, 0x0501
    22bf:	061f 7b03 0809      	.insn	6, 0x08097b03061f
    22c5:	0100                	.insn	2, 0x0100
    22c7:	1005                	.insn	2, 0x1005
    22c9:	04090503          	lb	a0,64(s2)
    22cd:	0100                	.insn	2, 0x0100
    22cf:	0505                	.insn	2, 0x0505
    22d1:	04097b03          	.insn	4, 0x04097b03
    22d5:	0100                	.insn	2, 0x0100
    22d7:	1905                	.insn	2, 0x1905
    22d9:	04092903          	lw	s2,64(s2)
    22dd:	0100                	.insn	2, 0x0100
    22df:	0306                	.insn	2, 0x0306
    22e1:	7f9f 0409 0100      	.insn	6, 0x010004097f9f
    22e7:	1005                	.insn	2, 0x1005
    22e9:	0306                	.insn	2, 0x0306
    22eb:	00c8                	.insn	2, 0x00c8
    22ed:	0c09                	.insn	2, 0x0c09
    22ef:	0100                	.insn	2, 0x0100
    22f1:	2105                	.insn	2, 0x2105
    22f3:	0306                	.insn	2, 0x0306
    22f5:	0900                	.insn	2, 0x0900
    22f7:	0004                	.insn	2, 0x0004
    22f9:	0501                	.insn	2, 0x0501
    22fb:	030d                	.insn	2, 0x030d
    22fd:	0900                	.insn	2, 0x0900
    22ff:	0004                	.insn	2, 0x0004
    2301:	0501                	.insn	2, 0x0501
    2303:	02030613          	addi	a2,t1,32 # 97e1747 <__free_ram_end+0x948b747>
    2307:	0c09                	.insn	2, 0x0c09
    2309:	0100                	.insn	2, 0x0100
    230b:	1705                	.insn	2, 0x1705
    230d:	b4097d03          	.insn	4, 0xb4097d03
    2311:	0100                	.insn	2, 0x0100
    2313:	1305                	.insn	2, 0x1305
    2315:	04090303          	lb	t1,64(s2)
    2319:	0100                	.insn	2, 0x0100
    231b:	0505                	.insn	2, 0x0505
    231d:	04097d03          	.insn	4, 0x04097d03
    2321:	0100                	.insn	2, 0x0100
    2323:	3105                	.insn	2, 0x3105
    2325:	04091b03          	lh	s6,64(s2)
    2329:	0100                	.insn	2, 0x0100
    232b:	0d05                	.insn	2, 0x0d05
    232d:	04090603          	lb	a2,64(s2)
    2331:	0100                	.insn	2, 0x0100
    2333:	0306                	.insn	2, 0x0306
    2335:	0900                	.insn	2, 0x0900
    2337:	0008                	.insn	2, 0x0008
    2339:	0301                	.insn	2, 0x0301
    233b:	7f98                	.insn	2, 0x7f98
    233d:	0409                	.insn	2, 0x0409
    233f:	0100                	.insn	2, 0x0100
    2341:	0306                	.insn	2, 0x0306
    2343:	00ed                	.insn	2, 0x00ed
    2345:	0409                	.insn	2, 0x0409
    2347:	0100                	.insn	2, 0x0100
    2349:	3105                	.insn	2, 0x3105
    234b:	0c096c03          	.insn	4, 0x0c096c03
    234f:	0100                	.insn	2, 0x0100
    2351:	0505                	.insn	2, 0x0505
    2353:	0306                	.insn	2, 0x0306
    2355:	0900                	.insn	2, 0x0900
    2357:	0004                	.insn	2, 0x0004
    2359:	0501                	.insn	2, 0x0501
    235b:	0609                	.insn	2, 0x0609
    235d:	04091a03          	lh	s4,64(s2)
    2361:	0100                	.insn	2, 0x0100
    2363:	0306                	.insn	2, 0x0306
    2365:	7f8d                	.insn	2, 0x7f8d
    2367:	1009                	.insn	2, 0x1009
    2369:	0100                	.insn	2, 0x0100
    236b:	1f05                	.insn	2, 0x1f05
    236d:	0306                	.insn	2, 0x0306
    236f:	00f9                	.insn	2, 0x00f9
    2371:	1c09                	.insn	2, 0x1c09
    2373:	0100                	.insn	2, 0x0100
    2375:	0505                	.insn	2, 0x0505
    2377:	0306                	.insn	2, 0x0306
    2379:	0900                	.insn	2, 0x0900
    237b:	0004                	.insn	2, 0x0004
    237d:	0501                	.insn	2, 0x0501
    237f:	0103061b          	.insn	4, 0x0103061b
    2383:	0409                	.insn	2, 0x0409
    2385:	0100                	.insn	2, 0x0100
    2387:	0306                	.insn	2, 0x0306
    2389:	7f86                	.insn	2, 0x7f86
    238b:	0809                	.insn	2, 0x0809
    238d:	0100                	.insn	2, 0x0100
    238f:	1105                	.insn	2, 0x1105
    2391:	0306                	.insn	2, 0x0306
    2393:	040900fb          	.insn	4, 0x040900fb
    2397:	0100                	.insn	2, 0x0100
    2399:	0905                	.insn	2, 0x0905
    239b:	0306                	.insn	2, 0x0306
    239d:	0900                	.insn	2, 0x0900
    239f:	0008                	.insn	2, 0x0008
    23a1:	0501                	.insn	2, 0x0501
    23a3:	01030617          	auipc	a2,0x1030
    23a7:	0809                	.insn	2, 0x0809
    23a9:	0100                	.insn	2, 0x0100
    23ab:	1105                	.insn	2, 0x1105
    23ad:	0306                	.insn	2, 0x0306
    23af:	0900                	.insn	2, 0x0900
    23b1:	0004                	.insn	2, 0x0004
    23b3:	0501                	.insn	2, 0x0501
    23b5:	0309                	.insn	2, 0x0309
    23b7:	0900                	.insn	2, 0x0900
    23b9:	0008                	.insn	2, 0x0008
    23bb:	0601                	.insn	2, 0x0601
    23bd:	08090103          	lb	sp,128(s2)
    23c1:	0100                	.insn	2, 0x0100
    23c3:	1005                	.insn	2, 0x1005
    23c5:	0c090103          	lb	sp,192(s2)
    23c9:	0100                	.insn	2, 0x0100
    23cb:	0d05                	.insn	2, 0x0d05
    23cd:	0306                	.insn	2, 0x0306
    23cf:	0900                	.insn	2, 0x0900
    23d1:	0004                	.insn	2, 0x0004
    23d3:	0501                	.insn	2, 0x0501
    23d5:	031d                	.insn	2, 0x031d
    23d7:	0900                	.insn	2, 0x0900
    23d9:	0004                	.insn	2, 0x0004
    23db:	0301                	.insn	2, 0x0301
    23dd:	7f82                	.insn	2, 0x7f82
    23df:	0c09                	.insn	2, 0x0c09
    23e1:	0100                	.insn	2, 0x0100
    23e3:	0105                	.insn	2, 0x0105
    23e5:	0b06                	.insn	2, 0x0b06
    23e7:	09018003          	lb	zero,144(gp)
    23eb:	0038                	.insn	2, 0x0038
    23ed:	0501                	.insn	2, 0x0501
    23ef:	030d                	.insn	2, 0x030d
    23f1:	0969                	.insn	2, 0x0969
    23f3:	0008                	.insn	2, 0x0008
    23f5:	0601                	.insn	2, 0x0601
    23f7:	097f9703          	lh	a4,151(t6)
    23fb:	0014                	.insn	2, 0x0014
    23fd:	0901                	.insn	2, 0x0901
    23ff:	0004                	.insn	2, 0x0004
    2401:	0100                	.insn	2, 0x0100
    2403:	01                	.byte	0x01
