.globl _main

_func:
    call _func
_func_end:
    ret

_main:
    call _func
    ret
    