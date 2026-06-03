; hello_tom.asm
; Prints "Hello Tom!" to stdout

section .data
    msg db "Hello Tom!", 10        ; message with newline
    msg_len equ $ - msg

section .text
    global _start

_start:
    ; sys_write(1, msg, msg_len)
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; fd: stdout
    mov rsi, msg        ; buffer
    mov rdx, msg_len    ; length
    syscall

    ; sys_exit(0)
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; exit code 0
    syscall
