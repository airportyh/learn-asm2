section .data
    msg db "Another test message", 0x0a
    msg_len equ $ - msg

section .text
    global _start

SYS_WRITE equ 1
SYS_EXIT  equ 60
STDOUT    equ 1

_start:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, msg
    mov rdx, msg_len
    syscall

    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall
