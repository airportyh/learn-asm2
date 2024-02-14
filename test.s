	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
## %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	xorl	%eax, %eax
	leaq	_numbers(%rip), %rcx
	movl	$0, -4(%rbp)
	movl	$3, -8(%rbp)
	movslq	-8(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rdx
	movq	%rdx, -16(%rbp)
	movslq	-8(%rbp), %rdx
	movq	$5, (%rcx,%rdx,8)
	popq	%rbp
	retq
                                        ## -- End function
	.section	__DATA,__data
	.globl	_numbers                ## @numbers
	.p2align	4
_numbers:
	.quad	1                       ## 0x1
	.quad	2                       ## 0x2
	.quad	3                       ## 0x3
	.quad	4                       ## 0x4
	.quad	5                       ## 0x5
	.quad	6                       ## 0x6
	.quad	7                       ## 0x7

	.globl	_msg                    ## @msg
_msg:
	.asciz	"Hello"

	.comm	_buf,10,0               ## @buf

.subsections_via_symbols
