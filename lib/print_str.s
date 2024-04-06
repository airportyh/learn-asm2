# rdx - string location
# used: cl
_print_str:
    movb (%rdx), %cl
    cmp $0, %cl
    jne __print_str_print_char
    ret

__print_str_print_char:
    call _putchar
    add $1, %rdx
    jmp _print_str