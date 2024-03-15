
.global _main
_main:
    mov message(%rip), %rsi
    
.section __DATA,__data
.globl message
message:
    .asciz "Hello world!"