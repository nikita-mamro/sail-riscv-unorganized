#include <stdint.h>

void main()
{
    __asm__ volatile (
        "j reset_vector;"
    );
}

//__attribute__((optimize("align-functions=2")))
void trap_vector()
{
    __asm__ volatile (
        "csrr t5, mcause;\n\tj write_tohost;"
    );
}

void reset_vector()
{
    __asm__ volatile (
        "li x1, 0;\n\tli x2, 0;\n\tli x3, 0;\n\tli x4, 0;\n\tli x5, 0;\n\tli x6, 0;\n\tli x7, 0;\n\tli x8, 0;\n\tli x9, 0;\n\tli x10, 0;\n\tli x11, 0;\n\tli x12, 0;\n\tli x13, 0;\n\tli x14, 0;\n\tli x15, 0;\n\tli x16, 0;\n\tli x17, 0;\n\tli x18, 0;\n\tli x19, 0;\n\tli x20, 0;\n\tli x21, 0;\n\tli x22, 0;\n\tli x23, 0;\n\tli x24, 0;\n\tli x25, 0;\n\tli x26, 0;\n\tli x27, 0;\n\tli x28, 0;\n\tli x29, 0;\n\tli x30, 0;\n\tli x31, 0;"
    );

    __asm__ volatile (
        "csrr a0, mhartid;\
         la t0, 1f;\
         csrw mtvec, t0;\
         csrwi satp, 0;\
         .align 2\
         1:\
         la t0, 1f\
         csrw mtvec, t0\
         li t0, (1 << (31 + (__riscv_xlen / 64) * (53 - 31))) - 1\
         csrw pmpaddr0, t0\
         li t0, 0x18 | 0x01 | 0x02 | 0x04\
         csrw pmpcfg0, t0\
         .align 2\
         1:\
         csrwi mie, 0\
         la t0, 1f\
         csrw mtvec, t0\
         csrwi medeleg, 0\
         csrwi mideleg, 0\
         .align 2\
         1:\
         li gp, 0\
         la t0, trap_vector\
         csrw mtvec, t0\
         li a0, 1\
         slli a0, a0, 31\
         bltz a0, 1f\
         fence\
         li gp, 1\
         li a7, 93\
         li a0, 0\
         ecall\
         1:\
         la t0, stvec_handler\
         beqz t0, 1f\
         csrw stvec, t0\
         li t0, (1 << 0xd) | (1 << 0xf) | (1 << 0xc) | (1 << 0x0) | (1 << 0x8) | (1 << 0x3)\
         csrw medeleg, t0\
         1: csrwi mstatus, 0\
         init\
         la t0, test\
         csrw mepc, t0\
         csrr a0, mhartid\
         mret"
    );
}

void write_tohost()
{
    __asm__ volatile (
        "sw gp, tohost, t5;"
    );
}

void test()
{
    volatile int a = 1;
    volatile int b = 1;

    //while (1) {}

    if (a == b) {
        pass();
    } else {
        fail();
    }
}

void fail()
{
    __asm__ volatile (
        "fence;\n1: beqz gp, 1b;\n\tsll gp, gp, 1;\n\tor gp, gp, 1;\n\tli a7, 93;\n\taddi a0, gp, 0;\n\tecall;"
    );
}

void pass()
{
    __asm__ volatile (
        "fence;\n\tli gp, 1;\n\tli a7, 93;\n\tli a0, 0;\n\tecall"
    );
}

__attribute__((optimize("align-functions=4")))
void begin_signature() {}

__attribute__((optimize("align-functions=4")))
void end_signature() {}

uint64_t tohost = UINT64_C(0x0);
uint64_t fromhost = UINT64_C(0x0);