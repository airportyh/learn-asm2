; syscall numbers
SYS_WRITE equ 1
SYS_EXIT  equ 60

; file descriptors
STDOUT    equ 1

; exit status
EXIT_SUCCESS equ 0

section .data
    msg db "Torrey Pines", 0x0a
    msg_len equ $ - msg

section .text
    global _start

_start:
    mov rax, SYS_WRITE  ; sys_write
    mov rdi, STDOUT     ; stdout
    mov rsi, msg
    mov rdx, msg_len
    syscall

    mov rax, SYS_EXIT   ; sys_exit
    mov rdi, EXIT_SUCCESS
    syscall
