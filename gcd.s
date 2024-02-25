.globl _main

# rbx: first number
# rcx: second number
_gcd:
    mov $0, %rdx
    mov %rbx, %rax
    idiv %rcx
    cmp $0, %rdx
    je __gcd_done
    mov %rcx, %rbx
    mov %rdx, %rcx
    jmp _gcd

__gcd_done:
    ret

_main:
    mov $12, %rbx
    mov $8, %rcx
    call _gcd
_done:
    ret