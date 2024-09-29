# prints char in %cl
# used: %rbx
# depends: output.s
_putchar:
    mov output_cursor(%rip), %rbx
    movb %cl, (%rbx)
    add $1, %rbx
    movb $0, (%rbx)
    mov %rbx, output_cursor(%rip)
    ret