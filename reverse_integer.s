# https://leetcode.com/problems/reverse-integer/
.globl _main
_main:
    # the integer
    mov $-123, %rax
    
    # convert it to a string
    lea buffer(%rip), %rbx
    # loop counter
    mov $0, %rcx
__loop_start:
    mov $0, %rdx
    mov $10, %rsi
    idiv %rsi
    add $48, %rdx
    movb %dl, (%rbx,%rcx)
    add $1, %rcx
    cmp $0, %rax
    je __loop_end
    jmp __loop_start

__loop_end:
    movb $0, (%rbx,%rcx)
    
    # the result
    mov $0, %rax
    lea buffer(%rip), %rbx
    # loop counter again
    mov $0, %rcx
__loop2_start:
    mov $0, %rdx
    movb (%rbx,%rcx), %dl
    cmpb $0, %dl
    je _done
    imul $10, %rax
    sub $48, %rdx
    add %rdx, %rax
    add $1, %rcx
    jmp __loop2_start

_done:
    ret
    
.comm buffer,100,4