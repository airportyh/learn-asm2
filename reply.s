.globl _start

_start:
  pushq %rbp
  movq %rsp, %rbp

  # make space on stack for input buffer
  subq $64, %rsp
  
  # print prompt
  mov $1, %rax
  mov $1, %rdi
  lea prompt_msg(%rip), %rsi
  mov $19, %rdx
  syscall

  # read input
  movq $0, %rax
  movq $2, %rdi
  movq $64, %rdx
  leaq -64(%rbp), %rsi
  syscall

  # store number of chars read into r8
  movq %rax, %r8
  subq $1, %r8

  # print hello
  mov $1, %rax
  mov $1, %rdi
  lea hello(%rip), %rsi
  mov $7, %rdx
  syscall

  # print user name
  mov $1, %rax
  mov $1, %rdi
  leaq -64(%rbp), %rsi
  mov %r8, %rdx
  syscall

  # print !
  mov $1, %rax
  mov $1, %rdi
  lea exclaim(%rip), %rsi
  mov $2, %rdx
  syscall

  # exit(0)
  movq $60, %rax
  movq $0, %rdi
  syscall

prompt_msg:
  .asciz "What is your name? "

hello:
  .asciz "Hello, "

exclaim:
  .asciz "!\n"
