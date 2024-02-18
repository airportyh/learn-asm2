.globl _main



_main:
    add $1, %al
    add $1, %bl
    add $1, %cl
    add $1, %dl
    add $1, %sil
    add $1, %dil
    add $1, %bpl
    
    
    
    
    ret

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