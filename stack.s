func:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movq	$3, -8(%rbp)
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	popq	%rbp
	ret
 
.globl	_start
_start:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	$1, -8(%rbp)
	movq	$2, -16(%rbp)
	movq	-8(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	func
	movq	%rax, -24(%rbp)
	movl	$0, %eax

  mov $60, %rax
  mov $0, %rdi
  syscall
