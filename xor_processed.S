#  P mode only!
.macro init;
.endm
        .section .text.init;
# .weak: use another definition if found
# these are used later somehow
        .weak stvec_handler;
        .weak mtvec_handler;
        .globl _start;
 _start: j reset_vector;
# infinite loop without this, but not memory error
# why align 2?
.align 2;

trap_vector:
        # COMMENT: test whether the test came from pass/fail
        # machine trap cause
        # read CSR mcause into t5
        csrr t5, mcause;
        # The Interrupt bit is set if the trap was caused by an interrupt
        # i==1 -> User external interrupt
        # i==0 -> Environment call from U-mode
        # ok when removed (so not user interrupt?)
        li t6, 0x8;
        beq t5, t6, write_tohost;
        # i==1 -> Supervisor external interrupt
        # i==0 -> Environment call from S-mode
        # ok when removed (so not ext interrupt)
        li t6, 0x9;
        beq t5, t6, write_tohost;
        # i==1 -> Machine external interrupt
        # i==0 -> Environment call from M-mode
        # Hits write_tohost here
        li t6, 0xb;
        beq t5, t6, write_tohost;
        # COMMENT: If an mtvec_handler is defined, jump to it
        #la t5, mtvec_handler;
        #beqz t5, 1f;
        #jr t5;
# Some error handling
#"1:" is a local label. It allows the assembly writer to use unique labels for branch targets.
# COMMENT: was it an interrupt or an exception?
#1:      csrr t5, mcause;
#        bgez t5, handle_exception;
         # Interrupt handler
#        j other_exception;
#handle_exception:
        # COMMENT we don't know how to handle whatever the exception was
#       other_exception:
        # COMMENT: some unhandlable exception occurred
        # ori rd, r1, N === rd = r1 | N
#       1: ori gp, gp, 1337;
write_tohost:
        # store word
        # example: sw rs, N(r1) === store 4 bytes at address r1+N
        # why 3 args here???
        sw gp, tohost, t5;
        # Can be removed (?)
        #j write_tohost;
reset_vector:
        # INIT_XREG
        # Didn't break anything
        #li x1, 0;
        #li x2, 0;
        #li x3, 0;
        #li x4, 0;
        #li x5, 0;
        #li x6, 0;
        #li x7, 0;
        #li x8, 0;
        #li x9, 0;
        #li x10, 0;
        #li x11, 0;
        #li x12, 0;
        #li x13, 0;
        #li x14, 0;
        #li x15, 0;
        #li x16, 0;
        #li x17, 0;
        #li x18, 0;
        #li x19, 0;
        #li x20, 0;
        #li x21, 0;
        #li x22, 0;
        #li x23, 0;
        #li x24, 0;
        #li x25, 0;
        #li x26, 0;
        #li x27, 0;
        #li x28, 0;
        #li x29, 0;
        #li x30, 0;
        #li x31, 0;
        # RISCV_MULTICORE_DISABLE
        #  The mhartid register is an XLEN-bit read-only register
        # containing the integer ID of the hardware thread running the code.
        # (optional)
        csrr a0, mhartid;
        # 1b -> 1 referenced backwards
        1: bnez a0, 1b;
        # INIT_SATP
        la t0, 1f;
        # The mtvec register is an XLEN-bit read/write register that holds the
        # base address of the M-mode trap vector
        csrw mtvec, t0;
        # https://five-embeddev.com/riscv-isa-manual/latest/supervisor.html
        csrwi satp, 0;
# Not critical for executing
#.align 2;
         #1:;
         # INIT_PMP
         # Physical memory protection
         # TODO: WTF, works without it for some reason
         # la t0, 1f;
         # csrw mtvec, t0;
         #COMMENT: Set up a PMP to permit all accesses
         # TODO: WTF, works without it for some reason
         #li t0, (1 << (31 + (__riscv_xlen / 64) * (53 - 31))) - 1;
         #csrw pmpaddr0, t0;
         #li t0, 0x18 | 0x01 | 0x02 | 0x04;
         #csrw pmpcfg0, t0;
# Not critical for executing
#.align 2;
#         1:;
          # mie: XLEN-bit read/write register containing interrupt enable bits
#         csrwi mie, 0;
#         la t0, 1f;
          # mtvec: XLEN-bit read/write register that holds trap vector configuration, con-
          # sisting of a vector base address (BASE) and a vector mode (MODE)
#         csrw mtvec, t0;
          # In systems with all three privilege modes (M/S/U), setting a 
          # bit in medeleg or mideleg will delegate the corresponding trap 
          # in S-mode or U-mode to the S-mode trap handler.
#         csrwi medeleg, 0;
#         csrwi mideleg, 0;
# Not critical for executing on SAIL sim
.align 2;
         1:;
         li gp, 0;
         la t0, trap_vector;
         csrw mtvec, t0;
         li a0, 1;
         slli a0, a0, 31;
         # branch if < 0
         bltz a0, 1f;
         fence;
         # Can't remove (TODO: check output)
         li gp, 1;
         # _NR_sys_exit
         li a7, 93;
         li a0, 0;
         # system call
         ecall;
# gets referenced from above
#1:
        #li gp, 2;
# TEST_RR_OP( 2, xor, 0xf00ff00f, 0xff00ff00, 0x0f0f0f0f );
# (testnum, inst, result, val1, val2)
#test_2:
        # MASK_XLEN
        #li x1, ((0xff00ff00) & ((1 << (__riscv_xlen - 1) << 1) - 1));
        #li x2, ((0x0f0f0f0f) & ((1 << (__riscv_xlen - 1) << 1) - 1));
        #xor x14, x1, x2;

        # deleted some code from TEST_PASSFAIL
        # fence;
        # li gp, 1;
        # _NR_sys_exit
        #li a7, 93;
        #li a0, 0;
        # system call
        #ecall

.data
# aw: section is allocatable and writable
# @progbits: "section contains data"
.pushsection .tohost,"aw",@progbits;

.align 6;
.global tohost;
         tohost: .dword 0;

.align 6;
.global fromhost;
         fromhost: .dword 0;

.popsection;
