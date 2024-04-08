.include "lib/strlen.s"

.global _main
_main:
    lea passage(%rip), %rbx
    call _strlen
_done:
    ret

passage:
    .asciz "Hello, world!"