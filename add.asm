section .bss
    buf resb 32         ; output buffer (up to 20 digits + newline)

section .text
    global _start

_start:
    ; argv[1] is at [rsp+16], argv[2] is at [rsp+24]
    mov rdi, [rsp + 16]
    call atoi
    mov r12, rax            ; save first integer

    mov rdi, [rsp + 24]
    call atoi
    add r12, rax            ; r12 = sum

    mov rax, r12
    lea rdi, [buf]
    call itoa               ; rax = bytes to write

    mov rdx, rax            ; length
    mov rax, 1              ; sys_write
    mov rdi, 1              ; stdout
    lea rsi, [buf]
    syscall

    mov rax, 60             ; sys_exit
    xor rdi, rdi
    syscall

; atoi: convert null-terminated decimal string at rdi to integer in rax
atoi:
    xor rax, rax
.loop:
    movzx rcx, byte [rdi]
    test rcx, rcx
    jz .done
    sub rcx, '0'
    imul rax, rax, 10
    add rax, rcx
    inc rdi
    jmp .loop
.done:
    ret

; itoa: convert non-negative integer in rax to decimal string at rdi
;       appends a newline; returns byte count in rax
itoa:
    push rbx

    test rax, rax
    jnz .nonzero

    mov byte [rdi], '0'
    mov byte [rdi + 1], 0x0a
    pop rbx
    mov rax, 2
    ret

.nonzero:
    ; build digits in reverse at the end of the buffer
    lea rbx, [rdi + 31]
    mov byte [rbx], 0x0a    ; newline occupies last slot
    dec rbx
    xor rcx, rcx            ; digit count

.digit_loop:
    xor rdx, rdx
    mov r8, 10
    div r8                  ; rax = quotient, rdx = remainder
    add dl, '0'
    mov [rbx], dl
    dec rbx
    inc rcx
    test rax, rax
    jnz .digit_loop

    inc rbx                 ; rbx now points to the first digit
    inc rcx                 ; include the newline in the count

    ; copy digits (+ newline) from rbx to rdi
    mov rax, rcx            ; return value = byte count
    push rax

.copy_loop:
    mov dl, [rbx]
    mov [rdi], dl
    inc rbx
    inc rdi
    dec rcx
    jnz .copy_loop

    pop rax
    pop rbx
    ret
