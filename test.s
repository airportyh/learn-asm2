	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
## %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	xorl	%edi, %edi
	callq	_sbrk
	xorl	%edi, %edi
	movq	%rax, -8(%rbp)
	movl	%edi, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
                                        ## -- End function

.subsections_via_symbols
