	.file	"test.c"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	leaq	-64(%rbp), %rax
	movl	$64, %edx
	movq	%rax, %rsi
	movl	$2, %edi
	call	read@PLT
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
