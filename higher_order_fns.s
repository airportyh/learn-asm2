.include "lib/putchar.s"
.include "lib/print_num.s"

# %rdx - function to call
#   it receives %rax as arg 1
_for_each_string:
    mov $0, %rbx
    lea strings(%rip), %rcx
__for_each_string_loop_start:
    mov (%rcx, %rbx, 8), %rax
    push %rbx
    push %rcx
    push %rdx
    call *%rdx
    pop %rdx
    pop %rcx
    pop %rbx
    add $1, %rbx
    cmp $4, %rbx
    jl __for_each_string_loop_start
    ret

_do_with_string:
    call _print_num
    mov $32, %cl
    call _putchar
    ret
    
_do_with_string_2:
    imulq $2, %rax
    call _print_num
    mov $45, %cl
    call _putchar
    ret

.global _main
_main:
    lea _do_with_string_2(%rip), %rdx
    call _for_each_string
    lea output(%rip), %rbx
_done:
    ret

strings:
    .quad 3
    .quad 5
    .quad 7
    .quad 9
    
.data
.include "lib/output.s"
