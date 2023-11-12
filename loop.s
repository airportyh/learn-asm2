.globl _start

_start:
  mov $0, %rax # sum
  mov $0, %rbx # loop counter

LOOP:
  add %rbx, %rax
  add $1, %rbx
  cmp $10, %rbx
  jge LOOP_END
  jmp LOOP

LOOP_END:
  mov $60, %rax
  mov $0, %rdi
  syscall
