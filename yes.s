.globl _start

_start:
    # sys_write: syscall number 1
    mov $1, %rax
    mov $1, %rdi
    lea msg(%rip), %rsi
    mov $4, %rdx
    syscall

    # sys_exit: syscall number 60
    mov $60, %rax
    mov $0, %rdi
    syscall

.section .rodata
msg:
    .asciz "yes\n"
