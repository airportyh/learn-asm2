.include "lib/lowercase_char.s"

.global _main
_main:
    mov $66, %cl
    call _lowercase_char
_done:
    ret
    