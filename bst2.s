
.globl _main

# rdx - number to insert
# rdi - node address
_bst_insert:

__bst_insert_loop_start:
    cmpq $0, (%rdi)
    je __bst_insert_at_leaf
    mov (%rdi), %rdi
    cmp (%rdi), %rdx
    jge __bst_insert_right
    # fall-through to __bst_insert_left

__bst_insert_left:
    lea 8(%rdi), %rdi
    jmp __bst_insert_loop_start
    
__bst_insert_right:
    lea 16(%rdi), %rdi
    jmp __bst_insert_loop_start

__bst_insert_at_leaf:
    # allocate new node from dynamic_data
    mov %r8, (%rdi)
    # advance allocation pointer
    # a node is 24 bytes:
    #  8 - number
    #  8 - left pointer
    #  8 - right pointer
    add $24, %r8
    # copy number
    mov (%rdi), %rdi
    mov %rdx, (%rdi)
    # zero out left and right pointers
    movq $0, 8(%rdi)
    movq $0, 16(%rdi)
    ret

# Display numbers in order in output buffer
# rdi - bst root
# rbx - output cursor
_bst_display:
    mov (%rdi), %rdi
    cmp $0, %rdi
    je __bst_display_done
    sub $8, %rsp
    mov %rdi, (%rsp)
    # go left
    lea 8(%rdi), %rdi
    call _bst_display
    
    # print number
    mov (%rsp), %rdi
    # for now, only do 1 digit
    # rbx/bl - char for this number/digit
    mov (%rdi), %rcx
    add $48, %rcx
    movb %cl, (%rbx)
    add $1, %rbx
    # comma
    movb $44, (%rbx)
    add $1, %rbx
    # proactive null terminator
    movb $0, (%rbx)
    
    # go right
    mov (%rsp), %rdi
    lea 16(%rdi), %rdi
    call _bst_display
    add $8, %rsp

__bst_display_done:
    ret

_main:
    # rbx - number array
    lea numbers(%rip), %rbx
    # rcx - number array length
    mov $10, %rcx
    # r8 - dynamic_data next available
    lea dynamic_data(%rip), %r8
    # r9 - bst root
    lea bst_root(%rip), %r9
    # rax - loop counter
    mov $0, %rax

__loop_start:
    # rdx - current number
    mov (%rbx, %rax, 8), %rdx
    lea bst_root(%rip), %rdi
    call _bst_insert
    add $1, %rax
    cmp %rcx, %rax
    jge __loop_end
    jmp __loop_start

__loop_end:
    lea bst_root(%rip), %rdi
    lea output(%rip), %rbx
    call _bst_display
    lea output(%rip), %rbx
_done:
    ret

.section __DATA,__data
    .globl numbers
    .globl dynamic_data
    .globl output

numbers:
    .quad 6
    .quad 3
    .quad 1
    .quad 9
    .quad 4
    .quad 5
    .quad 8
    .quad 2
    .quad 0
    .quad 7

bst_root:
    .quad 0

.comm dynamic_data,100000,4
.comm output,100000,4
    