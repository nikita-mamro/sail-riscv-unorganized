#  P mode only!
.macro init;
.endm
.section .text.init;

.align 6;

.weak stvec_handler;

.weak mtvec_handler;

.globl _start;

         _start: j reset_vector;

.align 2;

         trap_vector: csrr t5, mcause;
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
         handle_exception: other_exception: 1: ori gp, gp, 1337;
         write_tohost: 
                sw gp, tohost, t5;
                j write_tohost;
         reset_vector: li x1, 0;
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
        ;
         csrr a0, mhartid;
         1: bnez a0, 1b;
         la t0, 1f;
         csrw mtvec, t0;
         csrwi satp, 0;
.align 2;
         1:;
         la t0, 1f;
         csrw mtvec, t0;
         li t0, (1 << (31 + (__riscv_xlen / 64) * (53 - 31))) - 1;
         csrw pmpaddr0, t0;
         li t0, 0x18 | 0x01 | 0x02 | 0x04;
         csrw pmpcfg0, t0;
.align 2;
         1:;
         csrwi mie, 0;
         la t0, 1f;
         csrw mtvec, t0;
         csrwi medeleg, 0;
         csrwi mideleg, 0;
.align 2;
         1:;
         li gp, 0;
         la t0, trap_vector;
         csrw mtvec, t0;
         li a0, 1;
         slli a0, a0, 31;
         bltz a0, 1f;
         fence;
         li gp, 1;
         li a7, 93;
         li a0, 0;
         ecall;
         1:;
         la t0, stvec_handler;
         beqz t0, 1f;
         csrw stvec, t0;
         li t0, (1 << 0xd) | (1 << 0xf) | (1 << 0xc) | (1 << 0x0) | (1 << 0x8) | (1 << 0x3);
         csrw medeleg, t0;
         1: csrwi mstatus, 0;
         init;

         la t0, 1f;
         csrw mepc, t0;
         csrr a0, mhartid;
         mret;
         1:

                  test_2: li gp, 2;
         li x1, ((0xff00ff00) & ((1 << (__riscv_xlen - 1) << 1) - 1));
         li x2, ((0x0f0f0f0f) & ((1 << (__riscv_xlen - 1) << 1) - 1));
         xor x14, x1, x2;

         li x7, ((0xf00ff00f) & ((1 << (__riscv_xlen - 1) << 1) - 1));
         bne x14, x7, fail;


         bne x0, gp, pass;
         fail: fence;
         1: beqz gp, 1b;
         sll gp, gp, 1;
         or gp, gp, 1;
         li a7, 93;
         addi a0, gp, 0;
         ecall;
         pass: fence;
         li gp, 1;
         li a7, 93;
         li a0, 0;
         ecall

        unimp

.data
.pushsection .tohost,"aw",@progbits;

.align 6;
.global tohost;
         tohost: .dword 0;

.align 6;
.global fromhost;
         fromhost: .dword 0;

.popsection;

.align 4;
.global begin_signature;
         begin_signature:
.align 4;
.global end_signature;
         end_signature:
