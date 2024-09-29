.globl _main
_main:
    # rbx: message
    lea message(%rip), %rbx
    # rdi: output pointer
    lea output(%rip), %rdi
    # permanent pointer to output
    lea output(%rip), %r15
    # char counter
    mov $0, %rax
    # r9: start of word
    # r11: word length
    
_read_loop_open_start:
    # r10b: current char
    mov (%rbx, %rax), %r10b
    cmpb $0, %r10b
    je _read_loop_end
    cmpb $0x61, %r10b
    jl _read_loop_open_next
    cmpb $0x7a, %r10b
    jg _read_loop_open_next
    # this is an alphabet letter
    # set r9: start of word
    lea (%rbx, %rax), %r9
    # initialize r11: word length to 1
    mov $1, %r11
    jmp _read_loop_word_next

_read_loop_open_next:
    add $1, %rax
    jmp _read_loop_open_start

_read_loop_word_start:
    # r10b: current char
    mov (%rbx, %rax), %r10b
    cmpb $0, %r10b
    je _read_loop_end
    cmpb $0x61, %r10b
    jl _read_loop_stop_word
    cmpb $0x7a, %r10b
    jg _read_loop_stop_word
    # this is an alphabet letter, extend the word
    add $1, %r11
    
_read_loop_word_next:
    add $1, %rax
    jmp _read_loop_word_start

_read_loop_stop_word:
    # output the word with a comma at the end
    # r12: load word loop counter
    # r13b: current char
    mov $0, %r12

_output_word_loop_start:
    cmp %r11, %r12
    jge _output_word_loop_end
    mov (%r9, %r12), %r13b
    mov %r13b, (%rdi)
    add $1, %r12
    add $1, %rdi
    jmp _output_word_loop_start

_output_word_loop_end:
    movb $0x2c, (%rdi)
    add $1, %rdi
    movb $0, (%rdi)
    jmp _read_loop_open_next
    
_read_loop_end:
    ret

.section __DATA,__data
.globl message
message:
    .asciz "to be or not to be? that is the question."

.comm output,100000,4
