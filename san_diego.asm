SYS_WRITE   equ 1
SYS_EXIT    equ 60
STDOUT      equ 1
EXIT_OK     equ 0

section .data
    msg db "San Diego", 0x0a
    msg_len equ $ - msg

section .text
    global _start

_start:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, msg
    mov rdx, msg_len
    syscall

    mov rax, SYS_EXIT
    mov rdi, EXIT_OK
    syscall
