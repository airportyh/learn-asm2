	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_func2                  ## -- Begin function func2
	.p2align	4, 0x90
_func2:                                 ## @func2
## %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdx
	addq	-16(%rbp), %rdx
	addq	-24(%rbp), %rdx
	movq	%rdx, %rax
	popq	%rbp
	retq
                                        ## -- End function
	.globl	_func                   ## -- Begin function func
	.p2align	4, 0x90
_func:                                  ## @func
## %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movl	$2, %eax
	movl	%eax, %ecx
	movl	$3, %eax
	movl	%eax, %r8d
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rdx
	movq	%rcx, %rdi
	movq	%r8, %rsi
	callq	_func2
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	addq	-16(%rbp), %rax
	addq	-24(%rbp), %rax
	addq	-32(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
## %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	$3, %eax
	movl	%eax, %edi
	movl	$4, %eax
	movl	%eax, %esi
	movl	$5, %eax
	movl	%eax, %edx
	callq	_func
	leaq	L_.str(%rip), %rdi
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rsi
	movb	$0, %al
	callq	_printf
	xorl	%ecx, %ecx
	movl	%eax, -12(%rbp)         ## 4-byte Spill
	movl	%ecx, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%lu"


.subsections_via_symbols
