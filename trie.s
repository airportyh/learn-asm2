.include "lib/putchar.s"
.include "lib/print_num.s"

# dl - character
# returns r15 - address of node
alloc_trie_node:
    mov memory_ptr(%rip), %r15
    addq $225, memory_ptr(%rip)
    movb %dl, (%r15)
    ret

# generates tries stored at trie_root
generate_trie:
    mov $0, %rax
    lea passage(%rip), %rbx
    
    # create root node
    mov $0, %dl
    call alloc_trie_node
    mov %r15, trie_root(%rip)
    # %r8 - current node
    mov %r15, %r8

__read_loop_start:
    movb (%rbx, %rax), %cl
    cmpb $0, %cl
    jne __check_if_alphabet
__read_loop_end:
    ret

__check_if_alphabet:
    # check if it's an alphabet
    cmpb $97, %cl
    jl __skip_char
    cmpb $122, %cl
    jg __skip_char
    jmp __read_word_loop_start

__skip_char:
    add $1, %rax
    jmp __read_loop_start

__read_word_loop_start:
    # use the existing child node if it exists
    # save the char into dl for later if needed to alloc new node
    mov %cl, %dl
    # offset from ascii of 'a'
    subb $97, %cl
    movzx %cl, %rcx
    mov 17(%r8, %rcx, 8), %r14
    cmp $0, %r14
    je __create_new_node
    mov %r14, %r8
    jmp __read_next_char

__create_new_node:
    # create new trie node (goes in r15)
    call alloc_trie_node
    mov %r15, 17(%r8, %rcx, 8)
    # set new node as current node
    mov %r15, %r8

__read_next_char:
    add $1, %rax
    movb (%rbx, %rax), %cl
    cmpb $0, %cl
    je __read_word_end_then_loop_end
    # check if it's an alphabet
    cmpb $97, %cl
    jl __read_word_end
    cmpb $122, %cl
    jg __read_word_end
    jmp __read_word_loop_start
    
__read_word_end:
    addq $1, 1(%r8)
    mov trie_root(%rip), %r8
    add $1, %rax
    jmp __read_loop_start

__read_word_end_then_loop_end:
    addq $1, 1(%r8)
    mov trie_root(%rip), %r8
    add $1, %rax
    jmp __read_loop_end

# rdx - string location
# used: rax, rbx, cl
_print_str:
    mov $0, %rax
__print_loop:
    movb (%rdx, %rax), %cl
    cmp $0, %cl
    jne __print_char
    ret
__print_char:
    call _putchar
    add $1, %rax
    jmp __print_loop

# rbx - trie node
# rcx - string prefix
# rdx - string prefix end marker pointer
# I guess I can allocate stack space in the current function
# uses rax
_print_word_summary:
    cmp $0, %rbx
    jne __push_frame
    ret

__push_frame:
    # store locals to stack
    sub $24, %rsp
    mov %rbx, (%rsp)
    mov %rcx, 8(%rsp)
    mov %rdx, 16(%rsp)

    # append char
    movb (%rbx), %r8b
    cmpb $0, %r8b
    je __check_count
    movb %r8b, (%rdx)
    add $1, %rdx
    movb $0, (%rdx)
    mov %rdx, 16(%rsp)

__check_count:
    # if count is 0, skip print word
    cmpq $0, 1(%rbx)
    je __traverse_children

    # print word
    mov %rcx, %rdx
    call _print_str
    mov $58, %cl
    call _putchar
    mov $32, %cl
    call _putchar
    mov (%rsp), %rbx
    mov 1(%rbx), %rax
    call _print_num
    mov $59, %cl
    call _putchar
    mov $32, %cl
    call _putchar

__traverse_children:
    mov $0, %rax

__children_loop:
    # restore vars from stack
    mov (%rsp), %rbx
    mov 8(%rsp), %rcx
    mov 16(%rsp), %rdx
    mov 17(%rbx, %rax, 8), %rbx
    push %rax
    call _print_word_summary
    pop %rax
    add $1, %rax
    cmp $26, %rax
    jne __children_loop
    add $24, %rsp
    ret

.global _main
_main:
    call generate_trie
    mov trie_root(%rip), %rbx
    mov memory_ptr(%rip), %rcx
    # assume max of 100-length word
    addq $100, memory_ptr(%rip)
    mov %rcx, %rdx
    call _print_word_summary

    lea output(%rip), %rbx
_done:
    ret

passage:
     #.asciz "to be or not to be, that is the question."
     .asciz "and gibraltar as a girl where I was a flower of the mountain yes when i put the rose in my hair like the andalusian girls used or shall i wear a red yes and how he kissed me under the moorish wall and i thought well as well him as another and then i asked him with my eyes to ask again yes and then he asked me would i yes to say yes my mountain flower and first i put my arms around him yes and drew him down to me so he could feel my breasts all perfume yes and his heart was going like mad and yes i said yes i will Yes."
     # .asciz "a a a a"
.data
.comm memory, 100000
memory_ptr:
    .quad memory
.include "lib/output.s"
# a trie node is
#  1 byte for the character
#  8 bytes for the count of occurrances of the word
#  8 bytes for the linked list for line numbers the word appeared in
#  26 * 8 = 208 bytes for the table to child nodes (0 => 'a', 1 => 'b', ...)
# total bytes: 225
trie_root:
    .quad 0