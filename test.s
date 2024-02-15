	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
## %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	xorl	%eax, %eax
	movl	$2, %ecx
	movl	%ecx, %edx
	movl	$0, -4(%rbp)
	movq	$5, -16(%rbp)
	movq	-16(%rbp), %rsi
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	movq	%rsi, %rax
	movq	%rdx, -40(%rbp)         ## 8-byte Spill
	cqto
	movq	-40(%rbp), %rsi         ## 8-byte Reload
	idivq	%rsi
	movq	%rax, -24(%rbp)
	movl	-28(%rbp), %eax         ## 4-byte Reload
	popq	%rbp
	retq
                                        ## -- End function

.subsections_via_symbols
