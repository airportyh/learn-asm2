.global _main
_main:
    # call sys_brk
    mov $0x2000045, %rax
    mov $0, %rdi
    syscall
    ret