.globl _start

func:
  push %rbp
  mov %rsp, %rbp
  sub $20, %rsp

  leave
  ret

_start:
  call func

  mov $60, %rax
  mov $0, %rdi
  syscall
