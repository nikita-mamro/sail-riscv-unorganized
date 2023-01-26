	.file	"dummy.c"
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
	li gp, 1;
	li a7, 93;
	li a0, 0;
	ecall
	unimp
	.size	main, .-main
	.ident	"GCC: (Ubuntu 12.1.0-2ubuntu1~22.04) 12.1.0"
	.section	.note.GNU-stack,"",@progbits
	.pushsection .tohost,"aw",@progbits;
	.align 6;
	.global tohost;
	tohost:
	        .dword 0;
	.align 6;
	.global fromhost;
	fromhost:
	        .dword 0;

