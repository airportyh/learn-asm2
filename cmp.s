.globl _main
_main:
    mov $1, %al
    cmpb $0, %al
    jg _greater
    jmp _lesser
    
_greater:
    ret

_lesser:
    ret