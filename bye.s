.globl _main

_main:
    # sys_write
    mov $0x2000004, %rax
    mov $1, %rdi
    lea msg(%rip), %rsi
    # length of string
    mov $4, %rdx
    syscall
    
    ret
    
.section __cstring,cstring_literals
msg:
    .asciz "bye\n"
