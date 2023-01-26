#  P mode only!
# optional
.macro init;
.endm
.section .text.init;
.globl _start;
 _start: j reset_vector;

.align 2;

trap_vector:
    # machine trap cause
    # read CSR mcause into t5
    csrr t5, mcause;
    j write_tohost;
write_tohost:
    # store word
    # example: sw rs, N(r1) === store 4 bytes at address r1+N
    # why 3 args here???
    sw gp, tohost, t5;
reset_vector:
    # Why set gp to 0?
    #li gp, 0;
    la t0, trap_vector;
    # The mtvec register is an XLEN-bit read/write register that holds the
    # base address of the M-mode trap vector
    csrw mtvec, t0;
    # Why not optional?
    li gp, 1;
    # _NR_sys_exit
    li a7, 93;
    # syscall
    ecall;

# optional fsr
# https://github.com/riscv-software-src/riscv-isa-sim/issues/364
.data
.pushsection .tohost,"aw",@progbits;

.align 6;
.global tohost;
    tohost: .dword 0;
# optional fsr (3 lines)
.align 6;
.global fromhost;
    fromhost: .dword 0;
# optional fsr
.popsection;
# optional
.align 4;
.global begin_signature;
         begin_signature:
.align 4;
.global end_signature;
         end_signature: