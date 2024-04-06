# %rbx - string location
# used: %rcx
# return:
#    %rax - result
#    %rbx - string leftoff position
_parse_num:
    mov $0, %rax
    
    movb (%rbx), %cl
    cmp $45, %cl
    je __parse_num_negative

__parse_num_loop:
    movb (%rbx), %cl
    cmp $48, %cl
    jl __parse_num_done
    cmp $57, %cl
    jg __parse_num_done
    imul $10, %rax
    sub $48, %cl
    movzb %cl, %rcx
    addq %rcx, %rax
    add $1, %rbx
    jmp __parse_num_loop

__parse_num_negative:
    add $1, %rbx
__parse_num_loop_negative:
    movb (%rbx), %cl
    cmp $48, %cl
    jl __parse_num_done
    cmp $57, %cl
    jg __parse_num_done
    imul $10, %rax
    sub $48, %cl
    movzb %cl, %rcx
    sub %rcx, %rax
    add $1, %rbx
    jmp __parse_num_loop_negative    

__parse_num_done:
    ret
    