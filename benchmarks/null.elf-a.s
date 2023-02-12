	.file	"a.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	li	a5,12288
	ld	a4,.LANCHOR0
	addi	a5,a5,57
	sw	a5,0(a4)
	li	a0,0
	ret
	.size	main, .-main
	.globl	x
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	x, @object
	.size	x, 8
x:
	.zero	8
	.ident	"GCC: (Ubuntu 12.1.0-2ubuntu1~22.04) 12.1.0"
	.section	.note.GNU-stack,"",@progbits
