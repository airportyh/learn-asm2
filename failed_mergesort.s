.globl _main

# merge 2 sorted arrays of longs (32-bit signed ints)
# array 1: rbx
# array 1 length: rcx
# array 2 length: rdi
# assume array 1 is immediately followed by array 2
# local vars:
#  * r8 - left pointer
#  * r9 - right pointer
#  * r10d - left current number
#  * r11d - right current number
#  * rdx - array 2
#  * rsi - end of both arrays
# output: the 2 arrays are merged in-place into one
_merge:
    # store location of array 2 (end of array 1) in rdx
    lea (%rbx,%rcx,4), %rdx
    mov %rbx, %r8
    mov %rdx, %r9
    # store end of array 2 in rsi for use in bounds check
    lea (%rdx,%rdi,4), %rsi

_merge_loop_start:
    cmp %r9, %r8
    jge _advance_right
    mov (%r8), %r10d
    mov (%r9), %r11d
    cmp %r11d, %r10d
    jg _swap

_advance_left:
    add $4, %r8
    jmp _merge_loop_start

_swap:
    mov %r11d, (%r8)
    mov %r10d, (%r9)
    jmp _advance_left

_advance_right:
    add $4, %r9
    cmp %rsi, %r9
    jge _merge_done
    jmp _merge_loop_start

_merge_done:
    ret

_main:
    lea _array1(%rip), %rbx
    mov $4, %rcx
    mov $3, %rdi
    call _merge
    ret

.section	__DATA,__data
    .globl	_array1
    .globl  _array2

_array1:
	.long	1
	.long	3
	.long	5
	.long	6

_array2:
	.long	2
	.long	3
	.long	4