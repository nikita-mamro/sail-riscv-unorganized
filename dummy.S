	.file	"dummy.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	#sd	s0,8(sp)
	addi	s0,sp,16
#APP
# 6 "./dummy.c" 1
	j test;
# 0 "" 2
#NO_APP
	nop
	ld	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.align	2
	.globl	trap_vector
	.type	trap_vector, @function
trap_vector:
	addi	sp,sp,-16
	# BREAKS
	sd	s0,8(sp)
	addi	s0,sp,16
#APP
# 14 "./dummy.c" 1
	csrr t5, mcause;         j write_tohost;
# 0 "" 2
#NO_APP
	nop
	ld	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	trap_vector, .-trap_vector
	.align	1
	.globl	write_tohost
	.type	write_tohost, @function
write_tohost:
	addi	sp,sp,-16
	#sd	s0,8(sp)
	addi	s0,sp,16
#APP
# 22 "./dummy.c" 1
	sw gp, tohost, t5;
# 0 "" 2
#NO_APP
	nop
	ld	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	write_tohost, .-write_tohost
	.align	1
	.globl	test
	.type	test, @function
test:
	addi	sp,sp,-32
	# BREAKS
	#sd	s0,24(sp)
	addi	s0,sp,32
#APP
# 29 "./dummy.c" 1
	la t0, trap_vector;         csrw mtvec, t0;
# 0 "" 2
#NO_APP
	li	a5,2
	# BREAKS
	#sw	a5,-20(s0)
#APP
# 68 "./dummy.c" 1
	li gp, 1;         ecall;
# 0 "" 2
#NO_APP
	nop
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	test, .-test
	.globl	tohost
	.bss
	.align	3
	.type	tohost, @object
	.size	tohost, 8
tohost:
	.zero	8
	.ident	"GCC: (Ubuntu 12.1.0-2ubuntu1~22.04) 12.1.0"
	.section	.note.GNU-stack,"",@progbits
