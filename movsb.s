.global _main
_main:
    lea message(%rip), %esi
    lea output(%rip), %edi
    cld
    mov $27, %ecx
    rep movsb
    ret

.data
message:
    .ascii "Hello from Atlanta, Georgia!"

.include "lib/output.s"