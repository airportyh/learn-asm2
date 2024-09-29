.include "lib/parse_num.s"

# rdx - string pointer
# uses: cl
_skip_spaces:
    mov (%rdx), %cl
    cmp $32, %cl
    jne __skip_spaces_done
    add $1, %rdx
    jmp _skip_spaces
__skip_spaces_done:
    ret

# rdx - string pointer
# output:
# rdi - expression node
# node layout:
# 1 byte - node type
#  0: integer literal
#     8 byte integer
#  1: add op
#  2: minus op
#  3: times op
#  4: divide op
#     8 byte address for left operand node
#     8 byte address for right operand node

_parse_expr:
    sub $16, %rsp
    # (%rsp) - string pointer
    mov %rdx, (%rsp)
    mov %rdx, %rcx
    call _parse_num
    cmp %rdx, %rcx
    je __parse_expr_fail
    
    # create integer node here?

    call _skip_spaces
    movb (%rdx), %cl
    cmp $0, %cl
    je __parse_expr_return_integer_literal
    # 8(%rsp) - left operand
    mov %rax, 8(%rsp)
    cmp $43, %cl
    je __parse_expr_add_op
    cmp $45, %cl
    je __parse_expr_minus_op
    cmp $42, %cl
    je __parse_expr_times_op
    cmp $47, %cl
    je __parse_expr_divide_op
    jmp __parse_expr_fail

__parse_expr_add_op:
__parse_expr_minus_op:
__parse_expr_times_op:
__parse_expr_divide_op:

__parse_expr_return_integer_literal:
    mov memory_ptr(%rip), %rdi
    add $9, memory_ptr(%rip)
    movb $0, (%rdi)
    movq %rax, 1(%rdi)
    ret
    
__parse_expr_fail:
    ret

.global _main
_main:
    lea input(%rip), %rdx
    call _parse_expr
    
input:
    asciz "1 + 2 * 3"

.comm memory, 100000
memory_ptr:
    .quad memory