section .bss
    buf resb 2

section .text
    global _start

_start:
    mov rax, 2
    mov rbx, 2
    add rax, rbx

    add rax, '0'
    mov byte [buf], al
    mov byte [buf + 1], 0x0a

    mov rax, 1
    mov rdi, 1
    mov rsi, buf
    mov rdx, 2
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
