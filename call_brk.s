.globl _start

_start:
  # call brk(0), syscall #12
  mov $12, %rax
  mov $0, %rdi
  syscall # result is in rax

  mov $60, %rax
  mov $0, %rdi
  syscall
