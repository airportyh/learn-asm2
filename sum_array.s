.globl _main

_main:
    # r8 - array
    leaq    _numbers(%rip), %r8
    # r9 - counter
    movq    $0, %r9
    # r10 - sum
    movq    $0, %r10
loop_start:
    # while r9 < 5
    cmp $5, %r9
    jge loop_end
    movq (%r8, %r9, 8), %r11
    add %r11, %r10
    add $1, %r9
    jmp loop_start

loop_end:
    ret

_numbers:
    .quad 1
    .quad 3
    .quad 5
    .quad 7
    .quad 9