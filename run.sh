#!/bin/sh
if [ -e $1.elf ]
then
    d=$(date +"%FT%T")
    log_file="./logs/$1_$d.log"
    timeout 2 ~/Code/sail_riscv/sail-riscv/c_emulator/riscv_sim_RV64 "./$1.elf" > $log_file
    echo "Execution info logged to $log_file"
else
    echo "ELF file not found ($1.elf)"
fi


