.global _main

# put start of string in rsi
# output in rax
_strlen:
    mov $0, %rax

_loop_start:
    movb (%rsi,%rax), %bh
    cmpb $0, %bh
    je   _end_strlen
    add $1, %rax
    jmp _loop_start

_end_strlen:
    ret    

_main:
    lea message(%rip), %rsi
    call _strlen
    
    # r8 has string length
    mov %rax, %r8
    mov $0, %rdx
    mov $2, %rbx
    idivq %rbx
    
    # r9 has string length / 2
    mov %rax, %r9
    mov $0, %rax
    
_loop_2_start:
    # char swap
    movb (%rsi, %rax), %bl
    # r10 - index at other side
    movq %r8, %r10
    sub $1, %r10
    sub %rax, %r10
    movb (%rsi, %r10), %cl
    movb %bl, (%rsi, %r10)
    movb %cl, (%rsi, %rax)
    
    add $1, %rax
    cmp %r9, %rax
    je _loop_2_end
    jmp _loop_2_start
    
_loop_2_end:
    ret

.section	__DATA,__data
    .globl	message
message:
    .asciz "beautiful\0"