
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

_main:
    # rbx - number array
    lea numbers(%rip), %rbx
    # rcx - number array length
    mov $10, %rcx
    # r8 - dynamic_data next available
    lea dynamic_data(%rip), %r8
    # r9 - dynamic_data beginning
    mov %r8, %r9
    # rax - loop counter
    mov $0, %rax

__loop_start:
    # rdx - current number
    mov (%rbx, %rax, 8), %rdx
    lea bst_root(%rip), %rdi
    call _bst_insert
    cmp %rcx, %rax
    jge __loop_end
    add $1, %rax
    jmp __loop_start

__loop_end:
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
    