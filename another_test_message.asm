section .data
    msg db "Another test message", 0x0a
    msg_len equ $ - msg

section .text
    global _start

; Linux syscall numbers (passed in rax to invoke a kernel service)
SYS_WRITE equ 1   ; write bytes to a file descriptor
SYS_EXIT  equ 60  ; terminate the process

; Standard file descriptors
STDOUT    equ 1   ; fd 1 = standard output (the terminal)

_start:
    ; --- print the message ---
    mov rax, SYS_WRITE  ; syscall: write
    mov rdi, STDOUT     ; file descriptor: stdout
    mov rsi, msg        ; pointer to the string to print
    mov rdx, msg_len    ; number of bytes to write
    syscall             ; invoke the kernel

    ; --- exit cleanly ---
    mov rax, SYS_EXIT   ; syscall: exit
    xor rdi, rdi        ; exit code 0 (success); xor is a common idiom for zeroing a register
    syscall             ; invoke the kernel
