.global _main
_main:
    lea message(%rip), %rsi
    mov $0, %rax

loop_start:
    movb (%rsi,%rax), %bh
    cmpb $0, %bh
    je   loop_end
    add $1, %rax
    jmp loop_start

loop_end:
    ret

message:
    .asciz "Hello, world!\0"