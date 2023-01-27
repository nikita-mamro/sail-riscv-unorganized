	.file	"dummy.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.startup,"ax",@progbits
	.align	1
	.align	2
	.globl	main
	.type	main, @function
main:
#APP
# 5 "./dummy.c" 1
	j reset_vector;
# 0 "" 2
#NO_APP
	ret
	.size	main, .-main
	.text
	.align	1
	.align	2
	.globl	trap_vector
	.type	trap_vector, @function
trap_vector:
#APP
# 13 "./dummy.c" 1
	csrr t5, mcause;
         li t6, 0x8;
         beq t5, t6, write_tohost;
         li t6, 0x9;
         beq t5, t6, write_tohost;
         li t6, 0xb;
         beq t5, t6, write_tohost;
         la t5, mtvec_handler;
         beqz t5, 1f;
         jr t5;
         1: csrr t5, mcause;
         bgez t5, handle_exception;
         j other_exception;
         handle_exception:
         other_exception:
         1: ori gp, gp, 1337;
# 0 "" 2
#NO_APP
	ret
	.size	trap_vector, .-trap_vector
	.align	1
	.align	2
	.globl	write_tohost
	.type	write_tohost, @function
write_tohost:
#APP
# 35 "./dummy.c" 1
	sw gp, tohost, t5;
	j write_tohost
# 0 "" 2
#NO_APP
	ret
	.size	write_tohost, .-write_tohost
	.align	1
	.align	2
	.globl	reset_vector
	.type	reset_vector, @function
reset_vector:
#APP
# 42 "./dummy.c" 1
	li x1, 0;
	li x2, 0;
	li x3, 0;
	li x4, 0;
	li x5, 0;
	li x6, 0;
	li x7, 0;
	li x8, 0;
	li x9, 0;
	li x10, 0;
	li x11, 0;
	li x12, 0;
	li x13, 0;
	li x14, 0;
	li x15, 0;
	li x16, 0;
	li x17, 0;
	li x18, 0;
	li x19, 0;
	li x20, 0;
	li x21, 0;
	li x22, 0;
	li x23, 0;
	li x24, 0;
	li x25, 0;
	li x26, 0;
	li x27, 0;
	li x28, 0;
	li x29, 0;
	li x30, 0;
	li x31, 0;
# 0 "" 2
# 46 "./dummy.c" 1
	csrr a0, mhartid;
        1: bnez a0, 1b;
         la t0, 1f;
         csrw mtvec, t0;
         csrwi satp, 0;
         .align 2
         1:;
         	la t0, 1f;
         	csrw mtvec, t0;
         	li t0, (1 << (31 + (__riscv_xlen / 64) * (53 - 31))) - 1
         	csrw pmpaddr0, t0
         	li t0, 0x18 | 0x01 | 0x02 | 0x04
         	csrw pmpcfg0, t0
         .align 2
         1:;
         	csrwi mie, 0
         	la t0, 1f
         	csrw mtvec, t0
         	csrwi medeleg, 0
         	csrwi mideleg, 0
         .align 2
         1:;
         	li gp, 0
         	la t0, trap_vector
         	csrw mtvec, t0
         	li a0, 1
         	slli a0, a0, 31
         	bgez a0, 1f
         	fence
         	li gp, 1
         	li a7, 93
         	li a0, 0
         	ecall
         1:;
         	la t0, stvec_handler
         	beqz t0, 1f
         	csrw stvec, t0
         	li t0, (1 << 0xd) | (1 << 0xf) | (1 << 0xc) | (1 << 0x0) | (1 << 0x8) | (1 << 0x3)
         	csrw medeleg, t0
         1: csrwi mstatus, 0
         	la t0, 1f
         	csrw mepc, t0
         	csrr a0, mhartid
         	mret
# 0 "" 2
#NO_APP
	ret
	.size	reset_vector, .-reset_vector
	.align	1
	.align	2
	.globl	test_prelude
	.type	test_prelude, @function
test_prelude:
#APP
# 98 "./dummy.c" 1
	j test
# 0 "" 2
#NO_APP
	ret
	.size	test_prelude, .-test_prelude
	.align	1
	.align	2
	.globl	test
	.type	test, @function
test:
#APP
# 106 "./dummy.c" 1
	li gp, 2;
# 0 "" 2
# 122 "./dummy.c" 1
	fence;
1: beqz gp, test_prelude;
	sll gp, gp, 1;
	or gp, gp, 1;
	li a7, 93;
	addi a0, gp, 0;
	ecall;
# 0 "" 2
#NO_APP
	ret
	.size	test, .-test
	.align	1
	.align	2
	.globl	fail
	.type	fail, @function
fail:
#APP
# 122 "./dummy.c" 1
	fence;
1: beqz gp, test_prelude;
	sll gp, gp, 1;
	or gp, gp, 1;
	li a7, 93;
	addi a0, gp, 0;
	ecall;
# 0 "" 2
#NO_APP
	ret
	.size	fail, .-fail
	.align	1
	.align	2
	.globl	pass
	.type	pass, @function
pass:
#APP
# 129 "./dummy.c" 1
	fence;
	li gp, 1;
	li a7, 93;
	li a0, 0;
	ecall
# 0 "" 2
#NO_APP
	ret
	.size	pass, .-pass
	.align	1
	.align	2
	.globl	handlers
	.type	handlers, @function
handlers:
#APP
# 137 "./dummy.c" 1
	.weak stvec_handler;	    .weak mtvec_handler;
# 0 "" 2
#NO_APP
	ret
	.size	handlers, .-handlers
	.align	1
	.align	2
	.globl	begin_signature
	.type	begin_signature, @function
begin_signature:
	ret
	.size	begin_signature, .-begin_signature
	.align	1
	.align	2
	.globl	end_signature
	.type	end_signature, @function
end_signature:
	ret
	.size	end_signature, .-end_signature
	.globl	fromhost
	.globl	tohost
	.bss
	.align	3
	.type	fromhost, @object
	.size	fromhost, 8
fromhost:
	.zero	8
	.type	tohost, @object
	.size	tohost, 8
tohost:
	.zero	8
	.ident	"GCC: (Ubuntu 12.1.0-2ubuntu1~22.04) 12.1.0"
	.section	.note.GNU-stack,"",@progbits
