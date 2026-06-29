section .data
    msg db "Atlanta Hartsfield Airport", 0x0a
    msg_len equ $ - msg

section .text
    global _start

_start:
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, msg
    mov rdx, msg_len
    syscall

    mov rax, 60         ; sys_exit
    xor rdi, rdi
    syscall
