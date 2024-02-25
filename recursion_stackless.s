.globl _main

# recursion like this is no different from loops

_count_to_10:
    mov %rax, %rcx
    movb %cl, (%rbx)
    add $1, %rbx
    movb $0, (%rbx)
    cmp $90, %rax
    je _end
    add $1, %rax
    jmp _count_to_10

_main:
    lea output(%rip), %rdx
    lea output(%rip), %rbx
    mov $65, %rax
    jmp _count_to_10

_end:
    ret
    
.section __DATA,__data
    .globl output
.comm output,100000,4