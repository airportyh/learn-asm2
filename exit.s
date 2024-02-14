.globl _main

_main:
    # exit(0)
    mov $0x2000001, %rax
    mov $0, %rdi
    syscall