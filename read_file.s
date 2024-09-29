.include "lib/fs.s"

.global _main

_main:
    lea filename(%rip), %rdi
    mov $0, %rsi
    call _sys_open
    push %rax
    mov %rax, %rdi
    lea buffer(%rip), %rsi
    mov $100000, %rdx
    call _sys_read
    pop %rdi
    call _sys_close
_done:
    ret

filename:
    .asciz "test.c"
    
.data
.comm buffer, 100000