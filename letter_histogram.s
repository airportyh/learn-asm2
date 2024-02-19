.globl _main
_main:
    lea message(%rip), %rbx
    lea histogram(%rip), %rcx
    mov $0, %rax
    
_loop_start:
    mov (%rbx,%rax), %r8b
    cmpb $0, %r8b
    je _loop_done
    cmpb $0x61, %r8b
    jl _next
    cmpb $0x7a, %r8b
    jg _next
    
    sub $0x61, %r8b
    mov 1(%rcx,%r8b,2), %r9b
    add $1, %r9b
    mov %r9b, 1(%rcx,%r8b,2)
    
_next:
    add $1, %rax
    jmp _loop_start

_loop_done:
    ret
    
.section	__DATA,__data
.globl histogram
.globl message
message:
    .asciz "to be or not to be? that is the question."
histogram:
    .byte 0x61
	.byte  0
    .byte 0x62
	.byte  0
    .byte 0x63
    .byte  0
    .byte 0x64
    .byte  0
    .byte 0x65
    .byte  0
    .byte 0x66
    .byte  0
    .byte 0x67
    .byte  0
    .byte 0x68
    .byte  0
    .byte 0x69
    .byte  0
    .byte 0x6a
    .byte  0
    .byte 0x6b
    .byte  0
    .byte 0x6c
    .byte  0
    .byte 0x6d
    .byte  0
    .byte 0x6e
    .byte  0
    .byte 0x6f
    .byte  0
    .byte 0x70
    .byte  0
    .byte 0x71
    .byte  0
    .byte 0x72
    .byte  0
    .byte 0x73
    .byte  0
    .byte 0x74
    .byte  0
    .byte 0x75
    .byte  0
    .byte 0x76
    .byte  0
    .byte 0x77
    .byte  0
    .byte 0x78
    .byte  0
    .byte 0x79
    .byte  0
    .byte 0x7a
    .byte  0
    