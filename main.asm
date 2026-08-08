section .data
    msg db "Jack O Lantern", 10   ; 10 = newline
    len equ $ - msg

section .text
    global _start

_start:
    ; sys_write(1, msg, len)
    mov rax, 1          ; syscall number: write
    mov rdi, 1          ; fd: stdout
    mov rsi, msg        ; buffer pointer
    mov rdx, len        ; length
    syscall

    ; sys_exit(0)
    mov rax, 60         ; syscall number: exit
    xor rdi, rdi        ; exit code: 0
    syscall
