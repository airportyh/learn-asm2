.globl _main

exit:
    mov $0x2000001, %rax
    mov $0, %rdi
    syscall

_main:
    leaq    _numbers(%rip), %rdx
    
    movq	(%rdx,), %rbx
    
    movq    $6, %rax
    movq    (%rdx,%rax,8), %rcx
    movq    %rbx, (%rdx,%rax,8)
    movq    %rcx, (%rdx,)

    call    exit

.section	__DATA,__data
    .globl	_numbers
_numbers:
	.quad	1
	.quad	2
	.quad	3
	.quad	4
	.quad	5
	.quad	6
	.quad	7