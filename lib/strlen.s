# rbx - string pointer
# returns:
# rcx - string length
# uses %dl
_strlen:
    mov $0, %rcx
__strlen_loop_start:
    mov (%rbx, %rcx), %dl
    cmp $0, %dl
    jne __strlen_loop_continue
    ret
__strlen_loop_continue:
    add $1, %rcx
    jmp __strlen_loop_start