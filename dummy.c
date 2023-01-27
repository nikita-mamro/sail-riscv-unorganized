#include <stdint.h>

#define MCAUSE      0x342
#define MSTATUS     0x300
#define IMM         1337

extern volatile uint64_t mcause __attribute__((csr(MCAUSE)));
extern volatile uint64_t mstatus __attribute__((csr(MSTATUS)));

void *stvec_handler () __attribute__ ((weak));
void *mtvec_handler () __attribute__ ((weak));

//uint64_t imm_I(uint32_t inst) {
//    // imm[11:0] = inst[31:20]
//    return ((int64_t)(int32_t) (inst & 0xfff00000)) >> 20; // right shift as signed?
//}

void main()
{
    //reset_vector();
}


void write_tohost(uint64_t cause)
{
    /*
    uint64_t imm = imm_S(inst);
    uint64_t addr = cpu->regs[rs1(inst)] + (int64_t) imm;
    cpu_store(cpu, addr, 32, cpu->regs[rs2(inst)]);
    */
    uint64_t imm = IMM;
    
    register int *gp asm ("gp");

    write_tohost(cause);


    //__asm__ volatile (
    //    "sw gp, tohost, t5;\n\tj write_tohost"
    //);
}

// TODO: separate exception handling
void trap_vector()
{
    switch (mcause)
    {
        case 0x8:
        case 0x9:
        case 0xb:
            write_tohost(mcause);
            break;
        default:
            // ???
            if (*(int *)mtvec_handler != 0) {
                return;
            }

            // In base implementation there's no handle exc implementation anyway
            //if (*(int *)mcause > 0) {
            //}
            // 1: ori gp, gp, 1337;
            // ori rd, rs1, imm
            // ORI: self.regs[rd] = self.regs[rs1] | imm*/

            //uint64_t imm = imm_I(1337); ?
            uint64_t imm = IMM;
            register int *gp asm ("gp");
            *gp |= imm;

            break;
    }
}

void reset_vector()
{
    uint64_t i;
    for (i = 0; i < 32; i++) {
        __asm__ volatile ("li x1, 0;");
    }
    //int i;
    //char buf[3];
    //for (i = 0; i < 32; i++) {
	//    snprintf(buf, 12, "x%d", i);
    //    //register int *x asm (buf);
    //    __asm__ volatile (
    //        "li" [buf]", 0"
    //    );
    //}

    //__asm__ volatile (
    //    "li x1, 0;\n\tli x2, 0;\n\tli x3, 0;\n\tli x4, 0;\n\tli x5, 0;\n\tli x6, 0;\n\tli x7, 0;\n\tli x8, 0;\n\tli x9, 0;\n\tli x10, 0;\n\tli x11, 0;\n\tli x12, 0;\n\tli x13, 0;\n\tli x14, 0;\n\tli x15, 0;\n\tli x16, 0;\n\tli x17, 0;\n\tli x18, 0;\n\tli x19, 0;\n\tli x20, 0;\n\tli x21, 0;\n\tli x22, 0;\n\tli x23, 0;\n\tli x24, 0;\n\tli x25, 0;\n\tli x26, 0;\n\tli x27, 0;\n\tli x28, 0;\n\tli x29, 0;\n\tli x30, 0;\n\tli x31, 0;"
    //);
    /*
    // XXX: definitely some useless code here
    __asm__ volatile (
        "csrr a0, mhartid;\n\
        1: bnez a0, 1b;\n\
         la t0, 1f;\n\
         csrw mtvec, t0;\n\
         csrwi satp, 0;\n\
         .align 2\n\
         1:;\n\
         \tla t0, 1f;\n\
         \tcsrw mtvec, t0;\n\
         \tli t0, (1 << (31 + (__riscv_xlen / 64) * (53 - 31))) - 1\n\
         \tcsrw pmpaddr0, t0\n\
         \tli t0, 0x18 | 0x01 | 0x02 | 0x04\n\
         \tcsrw pmpcfg0, t0\n\
         .align 2\n\
         1:;\n\
         \tcsrwi mie, 0\n\
         \tla t0, 1f\n\
         \tcsrw mtvec, t0\n\
         \tcsrwi medeleg, 0\n\
         \tcsrwi mideleg, 0\n\
         .align 2\n\
         1:;\n\
         \tli gp, 0\n\
         \tla t0, trap_vector\n\
         \tcsrw mtvec, t0\n\
         \tli a0, 1\n\
         \tslli a0, a0, 31\n\
         \tbgez a0, 1f\n\
         \tfence\n\
         \tli gp, 1\n\
         \tli a7, 93\n\
         \tli a0, 0\n\
         \tecall\n\
         1:;\n\
         \tla t0, stvec_handler\n\
         \tbeqz t0, 1f\n\
         \tcsrw stvec, t0\n\
         \tli t0, (1 << 0xd) | (1 << 0xf) | (1 << 0xc) | (1 << 0x0) | (1 << 0x8) | (1 << 0x3)\n\
         \tcsrw medeleg, t0\n\
         1: csrwi mstatus, 0\n\
         \tla t0, 1f\n\
         \tcsrw mepc, t0\n\
         \tcsrr a0, mhartid\n\
         \tmret"
    );
    */
}


/*
void fail();
void pass();

void test_prelude() {
    __asm__ volatile("j test");
}

// TODO: add "1:" label before test
void test()
{
    // Important!
    // XXX: test method shouldn't contain inline asm
    __asm__ volatile ("li gp, 2;");
    //volatile int a = 1;
    //volatile int b = 1;

    //while (1) {}
    int a = 0;
    int b = 1;
    if (a == b) {
        pass();
    } else {
        fail();
    }
}
*/

/*
void fail()
{
    __asm__ volatile (
        "fence;\n1: beqz gp, test_prelude;\n\tsll gp, gp, 1;\n\tor gp, gp, 1;\n\tli a7, 93;\n\taddi a0, gp, 0;\n\tecall;"
    );
}

void pass()
{
    __asm__ volatile (
        "fence;\n\tli gp, 1;\n\tli a7, 93;\n\tli a0, 0;\n\tecall"
    );
}
*/

__attribute__((optimize("align-functions=4")))
void begin_signature() {}

__attribute__((optimize("align-functions=4")))
void end_signature() {}

uint64_t tohost = UINT64_C(0x0);
uint64_t fromhost = UINT64_C(0x0);