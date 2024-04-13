.include "../lib/fs.s"
.include "../lib/strlen.s"
.include "../lib/exit.s"
.include "../lib/putchar.s"
.include "../lib/print_str.s"
.global _main

_main:
    push %rbx
    lea header(%rip), %rdx
    call _print_str
    call _read_file
    sub $8, %rsp
_loop_start:
    mov %rsi, (%rsp)
    movw (%rsi), %bx
    cmp $0, %bx
    je _finish
    call decode_instruction
    mov $10, %cl
    call _putchar
    mov (%rsp), %rsi
    add $2, %rsi
    jmp _loop_start
_finish:
    lea output(%rip), %rbx
    call print_string
    lea output(%rip), %rbx
_done:
    add $8, %rsp
    pop %rbx
    ret

# bx - contains 2-byte instruction to decode
# uses a lot of registers
# writes output to 'output'
decode_instruction:
    sub $2, %rsp
    movw %bx, (%rsp)

    # check opcode
    shrb $2, %bl
    cmpb $0b100010, %bl
    jne unknown_opcode

    # check mode
    andb $0b11000000, %bh
    cmpb $0b11000000, %bh
    jne unknown_mode

    lea mov_msg(%rip), %rdx
    call _print_str

    movw (%rsp), %bx
    # direction bit
    andb $0b00000010, %bl
    cmpb $0, %bl
    je _left_to_right
    jmp _right_to_left

_left_to_right:
    movw (%rsp), %bx
    # width bit
    andb $0b00000001, %bl
    cmpb $0, %bl
    je _byte_left_to_right
    jmp _word_left_to_right

_right_to_left:
    movw (%rsp), %bx
    # width bit
    andb $0b00000001, %bl
    cmpb $0, %bl
    je _byte_right_to_left
    jmp _word_right_to_left

_byte_left_to_right:
    movb 1(%rsp), %bl
    call get_reg_mem_field
    call byte_reg_lookup
    call print_reg

    call print_separator

    movb 1(%rsp), %bl
    call get_reg_field
    call byte_reg_lookup
    call print_reg

    jmp _decode_instruction_finish

_byte_right_to_left:
    movb 1(%rsp), %bl
    call get_reg_field
    call byte_reg_lookup
    call print_reg

    call print_separator

    movb 1(%rsp), %bl
    call get_reg_mem_field
    call byte_reg_lookup
    call print_reg
    jmp _decode_instruction_finish

_word_left_to_right:
    movb 1(%rsp), %bl
    call get_reg_mem_field
    call word_reg_lookup
    call print_reg

    call print_separator

    movb 1(%rsp), %bl
    call get_reg_field
    call word_reg_lookup
    call print_reg

    jmp _decode_instruction_finish

_word_right_to_left:
    movb 1(%rsp), %bl
    call get_reg_field
    call word_reg_lookup
    call print_reg

    call print_separator

    movb 1(%rsp), %bl
    call get_reg_mem_field
    call word_reg_lookup
    call print_reg

_decode_instruction_finish:
    add $2, %rsp
    ret

unknown_opcode:
    lea unknown_opcode_error(%rip), %rbx
    call print_string
    jmp _abort

unknown_mode:
    lea unknown_mode_error(%rip), %rbx
    call print_string
    jmp abort

get_reg_field:
    andb $0b00111000, %bl
    shrb $3, %bl
    ret

get_reg_mem_field:
    andb $0b00000111, %bl
    ret

print_separator:
    mov $44, %cl
    call _putchar
    mov $32, %cl
    call _putchar
    ret

# rbx - location of null-terminated string
print_string:
    call _strlen
    mov %rcx, %rdx
    mov %rbx, %rsi
    mov $1, %rdi
    call sys_write
    ret

abort:
    mov $1, %rdx
    call sys_exit

# subroutine - reads file
# returns: 2-byte contents in bx
_read_file:
    lea filename(%rip), %rdi
    mov $0, %rsi
    call sys_open
    # save fd
    push %rax
    mov %rax, %rdi
    lea buffer(%rip), %rsi
    mov $10000, %rdx
    call sys_read
    pop %rdi
    call sys_close
    ret 

# bx - name of register
print_reg:
    push %rbx
    mov %bl, %cl
    call _putchar
    pop %rbx
    mov %bh, %cl
    call _putchar
    ret

# bl - register field value
# uses: rcx
# returns: bx - containing register name
byte_reg_lookup:
    movzb %bl, %rbx
    lea byte_reg_table(%rip), %rcx
    movw (%rcx,%rbx,2), %bx
    ret

# bl - register field value
# uses: rcx
# returns: bx - containing register name
word_reg_lookup:
    movzb %bl, %rbx
    lea word_reg_table(%rip), %rcx
    movw (%rcx,%rbx,2), %bx
    ret

byte_reg_table:
    .ascii "alcldlblahchdhbh"

word_reg_table:
    .asciz "axcxdxbxspbpsidi"

filename:
    .asciz "hw1"

unknown_opcode_error:
    .asciz "Unknown opcode!\n"

unknown_mode_error:
    .asciz "Unknown mov mode!\n"

success_msg:
    .asciz "Success!\n"
    
mov_msg:
    .asciz "mov "

header:
    .asciz "bits 16\n\n"

.data
.comm buffer, 10000
.include "../lib/output.s"