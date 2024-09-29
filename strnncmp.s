.globl _main

# str1: rbx
# str1 length: rcx
# str2: rdx
# str2 length: rdi
# output: al
#    0 if equal
#    1 if str1 > str2,
#    -1 otherwise
_strnncmp:
    # rsi: loop counter
    mov $0, %rsi
    
__read_loop_start:
    # check bounds
    cmp %rcx, %rsi
    jge __str1_end
    cmp %rdi, %rsi
    jge __str2_end
    # r8b: left char
    mov (%rbx, %rsi), %r8b
    # r9b: right char
    mov (%rdx, %rsi), %r9b
    sub %r8b, %r9b
    jz __read_loop_next
    mov %r9b, %al
    jmp __return
    
__read_loop_next:
    add $1, %rsi
    jmp __read_loop_start

__str1_end:
    cmp %rdi, %rsi
    jge __return_equal
    mov $-1, %al
    jmp __return

__str2_end:
    mov $1, %al
    jmp __return

__return_equal:
    mov $0, %al
    jmp __return

__return:
    ret

_main:
    lea str1(%rip), %rbx
    mov $5, %rcx
    lea str2(%rip), %rdx
    mov $5, %rdi
    call _strnncmp
_end:
    ret

.globl str1
.globl str2
str1:
    .asciz "jenny"
str2:
    .asciz "bobby"