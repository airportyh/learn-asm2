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
    je __read_loop_end
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

.global _main
_main:
    call generate_trie
    mov trie_root(%rip), %rbx

_done:
    ret

passage:
     .asciz "to be or not to be, that is the question."
#    .asciz "ab aa ac"
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