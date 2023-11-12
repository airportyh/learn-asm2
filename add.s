## 3 + 4

.globl _start

_start:
  mov $3, %rax
  add $4, %rax

  # exit(0)
  mov $60, %rax
  mov $0, %rdi
  syscall
