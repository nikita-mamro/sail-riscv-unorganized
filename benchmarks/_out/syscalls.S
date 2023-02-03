	.file	"syscalls.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_f2p2_d2p2_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"(null)"
	.text
	.align	2
	.type	vprintfmt, @function
vprintfmt:
	addi	sp,sp,-368
	sd	s0,352(sp)
	sd	s1,344(sp)
	sd	s2,336(sp)
	sd	s4,320(sp)
	sd	s5,312(sp)
	sd	s6,304(sp)
	sd	s7,296(sp)
	sd	ra,360(sp)
	sd	s3,328(sp)
	sd	s8,288(sp)
	sd	s9,280(sp)
	sd	s10,272(sp)
	sd	s11,264(sp)
	mv	s2,a0
	mv	s1,a1
	mv	s0,a2
	mv	s5,a3
	li	s4,37
	li	s7,85
	lla	s6,.L9
	j	.L83
.L5:
	beq	a0,zero,.L78
	mv	a1,s1
	addi	s0,s0,1
	jalr	s2
.L83:
	lbu	a0,0(s0)
	bne	a0,s4,.L5
	lbu	a3,1(s0)
	addi	s3,s0,1
	mv	a4,s3
	li	s9,32
	li	s8,-1
	li	s11,-1
	li	a2,0
.L6:
	addiw	a5,a3,-35
	andi	a5,a5,0xff
	addi	s0,a4,1
	bgtu	a5,s7,.L7
.L89:
	slli	a5,a5,2
	add	a5,a5,s6
	lw	a5,0(a5)
	add	a5,a5,s6
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L9:
	.word	.L23-.L9
	.word	.L7-.L9
	.word	.L22-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L21-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L18-.L9
	.word	.L19-.L9
	.word	.L7-.L9
	.word	.L18-.L9
	.word	.L17-.L9
	.word	.L17-.L9
	.word	.L17-.L9
	.word	.L17-.L9
	.word	.L17-.L9
	.word	.L17-.L9
	.word	.L17-.L9
	.word	.L17-.L9
	.word	.L17-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L16-.L9
	.word	.L15-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L14-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L13-.L9
	.word	.L12-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L11-.L9
	.word	.L7-.L9
	.word	.L64-.L9
	.word	.L7-.L9
	.word	.L7-.L9
	.word	.L8-.L9
	.text
.L78:
	ld	ra,360(sp)
	ld	s0,352(sp)
	ld	s1,344(sp)
	ld	s2,336(sp)
	ld	s3,328(sp)
	ld	s4,320(sp)
	ld	s5,312(sp)
	ld	s6,304(sp)
	ld	s7,296(sp)
	ld	s8,288(sp)
	ld	s9,280(sp)
	ld	s10,272(sp)
	ld	s11,264(sp)
	addi	sp,sp,368
	jr	ra
.L18:
	mv	s9,a3
	lbu	a3,1(a4)
	mv	a4,s0
	addi	s0,a4,1
	addiw	a5,a3,-35
	andi	a5,a5,0xff
	bleu	a5,s7,.L89
.L7:
	mv	a1,s1
	li	a0,37
	jalr	s2
	mv	s0,s3
	j	.L83
.L17:
	addiw	s8,a3,-48
	lbu	a3,1(a4)
	li	a5,9
	addiw	a4,a3,-48
	sext.w	a1,a3
	bgtu	a4,a5,.L65
	mv	a4,s0
	li	a6,9
.L26:
	lbu	a3,1(a4)
	slliw	a5,s8,2
	addw	a5,a5,s8
	slliw	a5,a5,1
	addw	a5,a5,a1
	addiw	a0,a3,-48
	addi	a4,a4,1
	addiw	s8,a5,-48
	sext.w	a1,a3
	bleu	a0,a6,.L26
.L25:
	bge	s11,zero,.L6
	mv	s11,s8
	li	s8,-1
	j	.L6
.L23:
	lbu	a3,1(a4)
	mv	a4,s0
	j	.L6
.L22:
	mv	a1,s1
	li	a0,37
	jalr	s2
	j	.L83
.L21:
	lw	s8,0(s5)
	lbu	a3,1(a4)
	addi	s5,s5,8
	mv	a4,s0
	j	.L25
.L12:
	li	a0,48
	mv	a1,s1
	jalr	s2
	mv	a1,s1
	li	a0,120
	jalr	s2
	li	a3,16
	addi	a4,s5,8
.L52:
	ld	a5,0(s5)
	mv	s5,a4
.L51:
	remu	a1,a5,a3
	sext.w	s3,s9
	addi	a2,sp,4
	li	a4,1
	sw	a1,0(sp)
	bltu	a5,a3,.L90
.L59:
	divu	a5,a5,a3
	addi	a2,a2,4
	mv	s8,a4
	addiw	a4,a4,1
	remu	a1,a5,a3
	sw	a1,-4(a2)
	bgeu	a5,a3,.L59
.L58:
	addiw	s9,s11,-1
	addiw	s10,a4,-1
	ble	s11,a4,.L61
.L60:
	addiw	s9,s9,-1
	mv	a1,s1
	mv	a0,s3
	jalr	s2
	bne	s9,s10,.L60
.L61:
	slli	s8,s8,2
	mv	s3,sp
	add	s3,s3,s8
	addi	s9,sp,-4
	li	s8,9
.L57:
	lw	a5,0(s3)
	li	a0,87
	bgtu	a5,s8,.L62
	li	a0,48
.L62:
	addi	s3,s3,-4
	mv	a1,s1
	addw	a0,a5,a0
	jalr	s2
	bne	s9,s3,.L57
	j	.L83
.L15:
	li	a5,1
	addi	s8,s5,8
	bgt	a2,a5,.L86
	beq	a2,zero,.L49
.L86:
	ld	s3,0(s5)
.L48:
	blt	s3,zero,.L50
	mv	a5,s3
	mv	s5,s8
	li	a3,10
	j	.L51
.L14:
	lbu	a3,1(a4)
	addiw	a2,a2,1
	mv	a4,s0
	j	.L6
.L8:
	li	a3,16
.L10:
	li	a5,1
	addi	a4,s5,8
	bgt	a2,a5,.L52
	bne	a2,zero,.L52
	lwu	a5,0(s5)
	mv	s5,a4
	j	.L51
.L11:
	ld	s10,0(s5)
	addi	s5,s5,8
	beq	s10,zero,.L29
	ble	s11,zero,.L79
	li	a5,45
	bne	s9,a5,.L84
	lbu	a0,0(s10)
	beq	a0,zero,.L46
.L31:
	li	s3,-1
.L43:
	blt	s8,zero,.L44
	addiw	s8,s8,-1
	beq	s8,s3,.L45
.L44:
	mv	a1,s1
	addi	s10,s10,1
	jalr	s2
	lbu	a0,0(s10)
	addiw	s11,s11,-1
	bne	a0,zero,.L43
.L45:
	ble	s11,zero,.L83
.L46:
	addiw	s11,s11,-1
	mv	a1,s1
	li	a0,32
	jalr	s2
	bne	s11,zero,.L46
	j	.L83
.L29:
	lla	s10,.LC0
	li	a0,40
	ble	s11,zero,.L31
	li	a5,45
	lla	s10,.LC0
	li	a0,40
	beq	s9,a5,.L31
.L84:
	sext.w	a2,s11
	mv	a5,s10
	add	a3,s10,s8
	bne	s8,zero,.L37
	j	.L35
.L39:
	addi	a5,a5,1
	beq	a5,a3,.L85
.L37:
	lbu	a4,0(a5)
	bne	a4,zero,.L39
.L85:
	sub	a5,a5,s10
	subw	s11,a2,a5
	ble	s11,zero,.L79
.L35:
	sext.w	s9,s9
.L41:
	addiw	s11,s11,-1
	mv	a1,s1
	mv	a0,s9
	jalr	s2
	bne	s11,zero,.L41
.L79:
	lbu	a0,0(s10)
	beq	a0,zero,.L83
	li	s3,-1
	j	.L43
.L19:
	not	a5,s11
	srai	a5,a5,63
	and	a5,s11,a5
	lbu	a3,1(a4)
	sext.w	s11,a5
	mv	a4,s0
	j	.L6
.L16:
	lw	a0,0(s5)
	mv	a1,s1
	addi	s5,s5,8
	jalr	s2
	j	.L83
.L90:
	li	s8,0
	j	.L58
.L49:
	lw	s3,0(s5)
	j	.L48
.L64:
	li	a3,10
	j	.L10
.L13:
	li	a3,8
	j	.L10
.L50:
	mv	a1,s1
	li	a0,45
	jalr	s2
	mv	s5,s8
	neg	a5,s3
	li	a3,10
	j	.L51
.L65:
	mv	a4,s0
	j	.L25
	.size	vprintfmt, .-vprintfmt
	.align	2
	.type	sprintf_putch.0, @function
sprintf_putch.0:
	ld	a5,0(a1)
	sb	a0,0(a5)
	ld	a5,0(a1)
	addi	a5,a5,1
	sd	a5,0(a1)
	ret
	.size	sprintf_putch.0, .-sprintf_putch.0
	.align	2
	.globl	putchar
	.type	putchar, @function
putchar:
	lui	a2,%tprel_hi(.LANCHOR0)
	add	a5,a2,tp,%tprel_add(.LANCHOR0)
	addi	a5,a5,%tprel_lo(.LANCHOR0)
	lw	a4,0(a5)
	addi	sp,sp,-112
	addiw	a3,a4,1
	add	a4,a5,a4
	sw	a3,0(a5)
	sb	a0,64(a4)
	li	a5,10
	addi	a4,sp,63
	andi	a4,a4,-64
	beq	a0,a5,.L93
	li	a5,64
	beq	a3,a5,.L93
	li	a0,0
	addi	sp,sp,112
	jr	ra
.L93:
	add	a5,a2,tp,%tprel_add(.LANCHOR0)
	li	a1,64
	sd	a1,0(a4)
	addi	a5,a5,%tprel_lo(.LANCHOR0)
	li	a1,1
	sd	a1,8(a4)
	addi	a5,a5,64
	sd	a5,16(a4)
	sd	a3,24(a4)
	fence	iorw,iorw
	la	a5,tohost
	sd	a4,0(a5)
	la	a3,fromhost
.L95:
	ld	a5,0(a3)
	beq	a5,zero,.L95
	sd	zero,0(a3)
	fence	iorw,iorw
	add	a2,a2,tp,%tprel_add(.LANCHOR0)
	sw	zero,%tprel_lo(.LANCHOR0)(a2)
	ld	a5,0(a4)
	li	a0,0
	addi	sp,sp,112
	jr	ra
	.size	putchar, .-putchar
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	or	a5,a0,a1
	or	a5,a5,a2
	andi	a5,a5,7
	add	a3,a0,a2
	beq	a5,zero,.L100
	add	a2,a1,a2
	mv	a5,a0
	bleu	a3,a0,.L109
.L104:
	lbu	a4,0(a1)
	addi	a1,a1,1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a1,a2,.L104
.L105:
	ret
.L100:
	bleu	a3,a0,.L105
	mv	a5,a0
.L103:
	ld	a4,0(a1)
	addi	a5,a5,8
	addi	a1,a1,8
	sd	a4,-8(a5)
	bgtu	a3,a5,.L103
	ret
.L109:
	ret
	.size	memcpy, .-memcpy
	.align	2
	.globl	memset
	.type	memset, @function
memset:
	or	a5,a0,a2
	andi	a5,a5,7
	add	a2,a0,a2
	andi	a4,a1,0xff
	beq	a5,zero,.L111
	mv	a5,a0
	bleu	a2,a0,.L120
.L115:
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	a2,a5,.L115
.L116:
	ret
.L111:
	ld	a5,.LC1
	mul	a4,a4,a5
	bleu	a2,a0,.L116
	mv	a5,a0
.L114:
	addi	a5,a5,8
	sd	a4,-8(a5)
	bgtu	a2,a5,.L114
	ret
.L120:
	ret
	.size	memset, .-memset
	.align	2
	.globl	strcpy
	.type	strcpy, @function
strcpy:
	mv	a5,a0
.L122:
	lbu	a4,0(a1)
	addi	a5,a5,1
	addi	a1,a1,1
	sb	a4,-1(a5)
	bne	a4,zero,.L122
	ret
	.size	strcpy, .-strcpy
	.align	2
	.globl	sprintf
	.type	sprintf, @function
sprintf:
	addi	sp,sp,-96
	addi	t1,sp,48
	sd	s0,32(sp)
	sd	a0,8(sp)
	sd	a2,48(sp)
	sd	a3,56(sp)
	mv	s0,a0
	mv	a2,a1
	lla	a0,sprintf_putch.0
	addi	a1,sp,8
	mv	a3,t1
	sd	ra,40(sp)
	sd	a5,72(sp)
	sd	a4,64(sp)
	sd	a6,80(sp)
	sd	a7,88(sp)
	sd	t1,24(sp)
	call	vprintfmt
	ld	a5,8(sp)
	sb	zero,0(a5)
	ld	a0,8(sp)
	ld	ra,40(sp)
	subw	a0,a0,s0
	ld	s0,32(sp)
	addi	sp,sp,96
	jr	ra
	.size	sprintf, .-sprintf
	.align	2
	.globl	printf
	.type	printf, @function
printf:
	addi	sp,sp,-96
	addi	t1,sp,40
	mv	t3,a0
	sd	a1,40(sp)
	sd	a2,48(sp)
	sd	a3,56(sp)
	lla	a0,putchar
	mv	a3,t1
	mv	a2,t3
	li	a1,0
	sd	ra,24(sp)
	sd	a4,64(sp)
	sd	a5,72(sp)
	sd	a6,80(sp)
	sd	a7,88(sp)
	sd	t1,8(sp)
	call	vprintfmt
	ld	ra,24(sp)
	li	a0,0
	addi	sp,sp,96
	jr	ra
	.size	printf, .-printf
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"mcycle"
	.align	3
.LC3:
	.string	"minstret"
	.text
	.align	2
	.globl	setStats
	.type	setStats, @function
setStats:
#APP
# 50 "./common/syscalls.c" 1
	csrr a4, mcycle
# 0 "" 2
#NO_APP
	lla	a5,.LANCHOR1
	beq	a0,zero,.L129
	sd	a4,0(a5)
#APP
# 51 "./common/syscalls.c" 1
	csrr a4, minstret
# 0 "" 2
#NO_APP
	sd	a4,8(a5)
	ret
.L129:
	ld	a3,0(a5)
	lla	a2,.LC2
	sd	a2,16(a5)
	sub	a4,a4,a3
	sd	a4,0(a5)
#APP
# 51 "./common/syscalls.c" 1
	csrr a4, minstret
# 0 "" 2
#NO_APP
	ld	a3,8(a5)
	lla	a2,.LC3
	sd	a2,24(a5)
	sub	a4,a4,a3
	sd	a4,8(a5)
	ret
	.size	setStats, .-setStats
	.align	2
	.globl	tohost_exit
	.type	tohost_exit, @function
tohost_exit:
	slli	a5,a0,1
	ori	a5,a5,1
	la	a4,tohost
	sd	a5,0(a4)
.L132:
	j	.L132
	.size	tohost_exit, .-tohost_exit
	.align	2
	.weak	handle_trap
	.type	handle_trap, @function
handle_trap:
	li	a5,4096
	la	a4,tohost
	addi	a5,a5,-1421
	sd	a5,0(a4)
.L134:
	j	.L134
	.size	handle_trap, .-handle_trap
	.align	2
	.globl	exit
	.type	exit, @function
exit:
	addi	sp,sp,-16
	sd	ra,8(sp)
	call	tohost_exit
	.size	exit, .-exit
	.align	2
	.globl	abort
	.type	abort, @function
abort:
	la	a5,tohost
	li	a4,269
	sd	a4,0(a5)
.L138:
	j	.L138
	.size	abort, .-abort
	.align	2
	.globl	printstr
	.type	printstr, @function
printstr:
	lbu	a5,0(a0)
	addi	sp,sp,-112
	addi	a3,sp,63
	andi	a3,a3,-64
	beq	a5,zero,.L143
	mv	a5,a0
.L141:
	lbu	a4,1(a5)
	addi	a5,a5,1
	bne	a4,zero,.L141
	sub	a5,a5,a0
.L140:
	li	a4,64
	sd	a4,0(a3)
	li	a4,1
	sd	a4,8(a3)
	sd	a0,16(a3)
	sd	a5,24(a3)
	fence	iorw,iorw
	la	a5,tohost
	sd	a3,0(a5)
	la	a4,fromhost
.L142:
	ld	a5,0(a4)
	beq	a5,zero,.L142
	sd	zero,0(a4)
	fence	iorw,iorw
	ld	a5,0(a3)
	addi	sp,sp,112
	jr	ra
.L143:
	li	a5,0
	j	.L140
	.size	printstr, .-printstr
	.align	2
	.weak	thread_entry
	.type	thread_entry, @function
thread_entry:
.L149:
	bne	a0,zero,.L149
	ret
	.size	thread_entry, .-thread_entry
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Implement main(), foo!\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.weak	main
	.type	main, @function
main:
	addi	sp,sp,-16
	lla	a0,.LC4
	sd	ra,8(sp)
	call	printstr
	ld	ra,8(sp)
	li	a0,-1
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	"%s = %lu\n"
	.text
	.align	2
	.globl	_init
	.type	_init, @function
_init:
	addi	sp,sp,-176
	la	a5,_tdata_begin
	sd	s4,128(sp)
	la	s4,_tdata_end
	sd	s3,136(sp)
	sub	s3,s4,a5
	sd	s1,152(sp)
	sd	s2,144(sp)
	mv	s1,a0
	mv	s2,a1
	mv	a0,tp
	mv	a1,a5
	mv	a2,s3
	sd	ra,168(sp)
	sd	s0,160(sp)
	sd	s5,120(sp)
	mv	s5,tp
	call	memcpy@plt
	la	a2,_tbss_end
	sub	a2,a2,s4
	li	a1,0
	add	a0,s5,s3
	call	memset@plt
	mv	a1,s2
	mv	a0,s1
	call	thread_entry
	li	a1,0
	li	a0,0
	call	main
	lla	s2,.LANCHOR1
	ld	a3,0(s2)
	addi	s0,sp,63
	andi	s0,s0,-64
	mv	s1,a0
	bne	a3,zero,.L165
	ld	a3,8(s2)
	bne	a3,zero,.L166
.L157:
	mv	a0,s1
	call	tohost_exit
.L166:
	mv	s3,s0
.L158:
	ld	a2,24(s2)
	mv	a0,s3
	lla	a1,.LC5
	call	sprintf
	add	s3,s3,a0
.L155:
	beq	s0,s3,.L157
	mv	a0,s0
	call	printstr
	j	.L157
.L165:
	ld	a2,16(s2)
	lla	a1,.LC5
	mv	a0,s0
	call	sprintf
	ld	a3,8(s2)
	add	s3,s0,a0
	beq	a3,zero,.L155
	j	.L158
	.size	_init, .-_init
	.align	2
	.globl	printhex
	.type	printhex, @function
printhex:
	addi	sp,sp,-48
	mv	a5,a0
	sd	ra,40(sp)
	addi	a0,sp,8
	addi	a4,sp,23
	li	a6,9
	j	.L169
.L171:
	mv	a4,a3
.L169:
	andi	a2,a5,15
	mv	a3,a2
	li	a1,87
	bgtu	a2,a6,.L168
	li	a1,48
.L168:
	addw	a3,a3,a1
	sb	a3,0(a4)
	srli	a5,a5,4
	addi	a3,a4,-1
	bne	a0,a4,.L171
	sb	zero,24(sp)
	call	printstr
	ld	ra,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	printhex, .-printhex
	.align	2
	.globl	strlen
	.type	strlen, @function
strlen:
	lbu	a5,0(a0)
	beq	a5,zero,.L176
	mv	a5,a0
.L175:
	lbu	a4,1(a5)
	addi	a5,a5,1
	bne	a4,zero,.L175
	sub	a0,a5,a0
	ret
.L176:
	li	a0,0
	ret
	.size	strlen, .-strlen
	.align	2
	.globl	strnlen
	.type	strnlen, @function
strnlen:
	add	a3,a0,a1
	mv	a5,a0
	bne	a1,zero,.L181
	j	.L185
.L182:
	addi	a5,a5,1
	beq	a3,a5,.L186
.L181:
	lbu	a4,0(a5)
	bne	a4,zero,.L182
	sub	a0,a5,a0
	ret
.L186:
	sub	a0,a3,a0
	ret
.L185:
	li	a0,0
	ret
	.size	strnlen, .-strnlen
	.align	2
	.globl	strcmp
	.type	strcmp, @function
strcmp:
.L189:
	lbu	a5,0(a0)
	addi	a1,a1,1
	addi	a0,a0,1
	lbu	a4,-1(a1)
	beq	a5,zero,.L190
	beq	a5,a4,.L189
	sext.w	a0,a5
.L188:
	subw	a0,a0,a4
	ret
.L190:
	li	a0,0
	j	.L188
	.size	strcmp, .-strcmp
	.align	2
	.globl	atol
	.type	atol, @function
atol:
	lbu	a4,0(a0)
	li	a3,32
	mv	a5,a0
	bne	a4,a3,.L193
.L194:
	lbu	a4,1(a5)
	addi	a5,a5,1
	beq	a4,a3,.L194
.L193:
	li	a3,45
	beq	a4,a3,.L195
	li	a3,43
	beq	a4,a3,.L214
	lbu	a3,0(a5)
	li	a1,0
	beq	a3,zero,.L213
.L200:
	li	a0,0
.L198:
	addi	a5,a5,1
	slli	a4,a0,2
	addiw	a2,a3,-48
	lbu	a3,0(a5)
	add	a4,a4,a0
	slli	a4,a4,1
	add	a0,a2,a4
	bne	a3,zero,.L198
	beq	a1,zero,.L192
	neg	a0,a0
	ret
.L214:
	lbu	a3,1(a5)
	li	a1,0
	addi	a5,a5,1
	bne	a3,zero,.L200
.L213:
	li	a0,0
.L192:
	ret
.L195:
	lbu	a3,1(a5)
	li	a1,1
	addi	a5,a5,1
	bne	a3,zero,.L200
	li	a0,0
	j	.L192
	.size	atol, .-atol
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	72340172838076673
	.bss
	.align	3
	.set	.LANCHOR1,. + 0
	.type	counters, @object
	.size	counters, 16
counters:
	.zero	16
	.type	counter_names, @object
	.size	counter_names, 16
counter_names:
	.zero	16
	.section	.tbss,"awT",@nobits
	.align	6
	.set	.LANCHOR0,. + 0
	.type	buflen.1, @object
	.size	buflen.1, 4
buflen.1:
	.zero	4
	.zero	60
	.type	buf.2, @object
	.size	buf.2, 64
buf.2:
	.zero	64
	.ident	"GCC: (Ubuntu 12.1.0-2ubuntu1~22.04) 12.1.0"
	.section	.note.GNU-stack,"",@progbits
