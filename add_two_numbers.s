# https://leetcode.com/problems/add-two-numbers/description/

.globl _main
_main:
    lea num1_ones(%rip), %rax
    call _print_num
    mov $43, %cl
    call _putchar
    lea num2_ones(%rip), %rax
    call _print_num
    mov $61, %cl
    call _putchar
    lea num1_ones(%rip), %rax
    lea num2_ones(%rip), %rbx
    mov $0, %dl
    call _add_two_numbers
    mov %rcx, %rax
    call _print_num
    lea output(%rip), %rbx
_done:
    ret

# %rax is the start of the linked list
_print_num:
    cmpq $0, %rax
    je __print_num_end
    
    push %rax
    movq 1(%rax), %rax
    call _print_num
    
    pop %rax
    movb (%rax), %cl
    add $48, %cl
    call _putchar
    
__print_num_end:
    ret

# prints char in %cl
_putchar:
    mov output_cursor(%rip), %rbx
    movb %cl, (%rbx)
    add $1, %rbx
    movb $0, (%rbx)
    mov %rbx, output_cursor(%rip)
    ret

# add two numbers represented as linked lists
# list 1 - %rax
# list 2 - %rbx
# carry - %dl, 1 or 0
# return value in %rcx

_add_two_numbers:
    cmp $0, %rax
    je __add_two_numbers_return_second
    cmp $0, %rbx
    je __add_two_numbers_return_first
    movb (%rax), %r8b
    movb (%rbx), %r9b
    add %r8b, %r9b
    add %dl, %r9b
    cmpb $10, %r9b
    jge __add_two_numbers_handle_carry
    mov $0, %dl

__add_two_numbers_continue:
    # allocate new node
    # advance both lists
    # recursive call
    mov memory_cursor(%rip), %r11
    # size of an ll node is 9 bytes
    addq $9, memory_cursor(%rip)
    movb %r9b, (%r11)
    push %r11
    mov 1(%rax), %rax
    mov 1(%rbx), %rbx
    call _add_two_numbers
    pop %r11
    mov %rcx, 1(%r11)
    mov %r11, %rcx
    ret
    
__add_two_numbers_handle_carry:
    sub $10, %r9b
    mov $1, %dl
    jmp __add_two_numbers_continue

__add_two_numbers_return_second:
    mov %rbx, %rax
    call _carry_plus_number
    ret

__add_two_numbers_return_first:
    call _carry_plus_number
    ret

# number - %rax
# carry - %dl
# return value in %rcx
_carry_plus_number:
    cmp $0, %rax
    je __carry_plus_number_no_node

    movb (%rax), %bl
    add %dl, %bl
    cmpb $10, %bl
    jge __carry_plus_number_handle_carry

__carry_plus_number_continue:
    mov memory_cursor(%rip), %rdi
    addq $9, memory_cursor(%rip)
    movb %bl, (%rdi)
    push %rdi
    mov 1(%rax), %rax
    call _carry_plus_number
    pop %rdi
    mov %rcx, 1(%rdi)
    mov %rdi, %rcx
    ret

__carry_plus_number_handle_carry:
    sub $10, %bl
    mov $1, %dl
    jmp __carry_plus_number_continue

__carry_plus_number_no_node:
    cmpb $0, %dl
    je __carry_plus_number_return_null
    mov memory_cursor(%rip), %rcx
    addq $9, memory_cursor(%rip)
    movb %dl, (%rcx)
    movq $0, 1(%rcx)
    ret

__carry_plus_number_return_null:
    movq $0, %rcx
    ret

/*
num1_ones:
    .byte 2
    .quad num1_tens
    
num1_tens:
    .byte 4
    .quad num1_hundreds

num1_hundreds:
    .byte 3
    .quad 0

num2_ones:
    .byte 5
    .quad num2_tens

num2_tens:
    .byte 6
    .quad num2_hundreds

num2_hundreds:
    .byte 4
    .quad 0
*/

/*
num1_ones:
    .byte 0
    .quad 0

num2_ones:
    .byte 0
    .quad 0
*/


num1_ones:
    .byte 9
    .quad num1_tens
num1_tens:
    .byte 9
    .quad num1_hundreds
num1_hundreds:
    .byte 9
    .quad num1_thousands
num1_thousands:
    .byte 9
    .quad num1_tenthous
num1_tenthous:
    .byte 9
    .quad num1_hunthous
num1_hunthous:
    .byte 9
    .quad num1_mils
num1_mils:
    .byte 9
    .quad 0

num2_ones:
    .byte 9
    .quad num2_tens
num2_tens:
    .byte 9
    .quad num2_hundreds
num2_hundreds:
    .byte 9
    .quad num2_thousands
num2_thousands:
    .byte 9
    .quad 0


.section __DATA,__data
.comm output, 10000, 4
output_cursor:
    .quad output

.comm memory, 10000, 4
memory_cursor:
    .quad memory
