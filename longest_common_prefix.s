# https://leetcode.com/problems/longest-common-prefix/

.globl _main
_main:
    # output pointer
    lea output(%rip), %r8
    
    # base strings array pointer
    lea strings(%rip), %rcx
    # strings array length
    mov strings_length(%rip), %r9
    
    # char counter
    mov $0, %rbx
__loop_start:
    # first string
    movq (%rcx), %rdx
    # current char
    movb (%rdx,%rbx), %dil
    
    # strings array counter: now start at 1
    mov $1, %rax
    
__inner_loop_start:
    cmp %rax, %r9
    je __advance_char
    # current string
    movq (%rcx,%rax,8), %rdx
    # current active char
    movb (%rdx,%rbx), %sil
    cmpb $0, %sil
    je _end
    cmpb %sil, %dil
    movb $0, (%r8)
    jne _end
    add $1, %rax
    jmp __inner_loop_start
    
__advance_char:
    movb %dil, (%r8)
    add $1, %r8
    add $1, %rbx
    jmp __loop_start

_end:
    lea output(%rip), %r10
    ret

.globl array

str1:
    .asciz "dog"
str2:
    .asciz "racecar"
str3:
    .asciz "car"
strings:
    .quad str1
    .quad str2
    .quad str3
strings_length:
    .quad 0x3

.comm output, 10000, 4