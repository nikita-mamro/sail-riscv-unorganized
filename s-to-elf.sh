if [ -z "$1" ] || [ -z "$2" ]
  then
    echo "Specify name of program (without extension) as first argument and entrypoint as second"
  else
    riscv64-linux-gnu-gcc-12 -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -T link.ld --entry $2 $1.S -o $1.elf
fi
