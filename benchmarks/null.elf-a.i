# 0 "/tmp/a.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 0 "<command-line>" 2
# 1 "/tmp/a.c"
 volatile int *x = 0;

int main() {
 *(int*)x = 12345;
 return 0;
}
