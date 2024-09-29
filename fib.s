.include "lib/putchar.s"
.include "lib/print_num.s"

.global _main
_main:
    # counter
    mov $0, %rdi
    # fib
    mov $0, %r8
    # fib + 1
    mov $1, %r9

__loop_start:
    add %r8, %r9
    mov %r9, %rax
    call _print_num
    xchg %r8, %r9
    mov $32, %cl
    call _putchar
    add $1, %rdi
    cmp $10, %rdi
    jle __loop_start

    lea output(%rip), %rbx
_done:
    ret

.data
.include "lib/output.s"
