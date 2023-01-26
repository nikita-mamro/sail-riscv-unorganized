#!/bin/sh
if [ -e $1.c ]
then
    riscv64-linux-gnu-gcc-12 -S -Ofast dummy.c -o dummy.s
    echo ".pushsection .tohost,\"aw\",@progbits;
.align 6;
.global tohost;
tohost:
        .dword 0;
.align 6;
.global fromhost;
fromhost:
        .dword 0;
" >> dummy.s
    riscv64-linux-gnu-gcc-12 -c dummy.s -o dummy.o
    riscv64-linux-gnu-gcc-12 -static -mcmodel=medany -nostdlib -nostartfiles -lm -lgcc -T test.ld dummy.o -o dummy.elf
    rm dummy.o
    echo "Generated ELF"
else
    echo "ELF file not found ($1.c)"
fi


