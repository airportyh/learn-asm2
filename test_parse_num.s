.include "lib/parse_num.s"

.global _main
_main:
    lea num(%rip), %rbx
    call _parse_num
_done:
    ret

num:
    .asciz "-2345"