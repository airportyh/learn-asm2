.globl _main
_main:
    mov $1, %rax
    mov $0, %rbx
    cmp %rax, %rbx
    cmp %rbx, %rax
    cmp %rax, %rax
    or 0x80, %rflags
    ret