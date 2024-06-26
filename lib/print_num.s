# %rax - number to print
# used: %rbx, %rdx, %cl
# only positive numbers for now
# depends: putchar.s
_print_num:
    mov $0, %rdx
    mov $10, %rbx
    idiv %rbx
    cmp $0, %rax
    je __print_num_print_digit
    push %rdx
    call _print_num
    pop %rdx

__print_num_print_digit:
    mov %dl, %cl
    add $48, %cl
    call _putchar
    ret