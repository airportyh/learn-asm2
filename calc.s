.globl _start

_start:
  push %rbp
  mov %rsp, %rbp

  # char buf[64]
  sub $64, %rsp

  # print prompt
  mov $1, %rax
  mov $1, %rdi
  lea prompt(%rip), %rsi
  mov $20, %rdx
  syscall

  # read input
  mov $0, %rax
  mov $2, %rdi
  mov $64, %rdx
  lea -64(%rbp), %rsi
  syscall

got_input:
  mov $0, %rax
  mov $0, %rbx
  mov $0, %rcx
  call parse_and_eval_expr

exit:
  # exit
  mov $60, %rax
  mov $0, %rdi
  syscall

# function parse_and_eval_expr
# Inputs
# rsi - string buffer
# rax - pending operand
# rbx - pending operator - 0 means none
# rcx - pending operator precedence
# Outputs:
# rax - result
# rdx - error if 1, success if 0
# Locals:
# -8 - pending operand
# -16 - pending operator
# -24 - pending operator precedence
# -32 - current operator precedence
# r9 - operator precedence
# r11 - current operator
# r8 - string buffer cursor
# rax - current operand
parse_and_eval_expr:
  push %rbp
  mov %rsp, %rbp
  sub $32, %rsp
  mov %rax, -8(%rbp)
  mov %rbx, -16(%rbp)
  mov %rcx, -24(%rbp)

  call parse_num
  call skip_whitespace  
  # move current char into bl
  # r8 is the char cursor
  # rsi is the string buffer
  mov (%r8,%rsi), %bl

  # is it '\n'? if so return
  cmp $10, %bl
  je do_op_and_return
  jmp parse_operator

do_op_and_return:
  mov -8(%rbp), %r10
  mov -16(%rbp), %rbx
  call do_op
  leave
  ret

parse_operator:
  # +
  cmp $43, %bl
  je got_p1_operator
  # -
  cmp $45, %bl
  je got_p1_operator
  cmp $42, %bl
  # *
  je got_p2_operator
  cmp $47, %bl
  # /
  je got_p2_operator
  
  jmp parse_error

got_p1_operator:
  mov $1, %r9
  jmp got_operator

got_p2_operator:
  mov $2, %r9
  jmp got_operator

got_operator:
  mov %rbx, %r11
  mov -16(%rbp), %r10
  cmp $0, %r10
  jne check_precedence
  jmp do_pending_operation_2nd

check_precedence:
  mov -24(%rbp), %rcx
  cmp %r9, %rcx
  jge do_pending_operation_1st
  jmp do_pending_operation_2nd
  
do_pending_operation_1st:
  mov -16(%rbp), %rbx
  mov -8(%rbp), %r10
  call do_op
  
  add $1, %r8
  call skip_whitespace

  add %r8, %rsi
  mov %r9, %rcx
  mov %r11, %rbx
  call parse_and_eval_expr
  leave
  ret

do_pending_operation_2nd:
  add $1, %r8
  call skip_whitespace

  add %r8, %rsi
  mov %r9, %rcx
  mov %r11, %rbx
  call parse_and_eval_expr

  mov -8(%rbp), %r10
  mov -16(%rbp), %rbx
  call do_op
  leave
  ret

# function do_op
# Inputs:
# bl - operator
# r10 - lhs
# rax - rhs
# Outputs:
# rax - result
do_op:
  # '+'
  cmp $43, %bl
  je do_add

  # '-'
  cmp $45, %bl
  je do_subtract

  # '*'
  cmp $42, %bl
  je do_multiply

  # '/'
  cmp $47, %bl
  je do_divide

  # shouldn't reach here
do_op_done:
  ret

do_add:
  add %r10, %rax
  jmp do_op_done

do_subtract:
  sub %r10, %rax
  jmp do_op_done

do_multiply:
  imul %r10, %rax
  jmp do_op_done

do_divide:
  mov %rax, %r11
  mov %r10, %rax
  cqto
  idiv %r11
  jmp do_op_done

# function skip_whitespace
# Inputs:
# r8 - cursor
# rsi - string buffer
# Locals:
# bl - current char
skip_whitespace:
  mov (%r8,%rsi), %bl
  # is it a space?
  cmp $32, %bl
  je skip_char
  ret

skip_char:
  add $1, %r8
  jmp skip_whitespace

parse_error:
  mov $1, %rdx
  ret

# function parse_num
#   parses the numeric string pointed to by rsi
# Input:
#   rsi - string buffer
# Outputs:
#   rax - result
#   r8 - number of chars parsed
# Locals:
#   r8 - loop counter / cursor
#   bl - current char
#   r9 - digit value
# todo:
#   passing length of buffer and avoid reading beyond it
#   signed numbers
parse_num:
  # r8 is loop counter
  mov $0, %r8
  # rax is result
  mov $0, %rax

atoi_loop:
  # copy current char into bl
  mov (%r8,%rsi), %bl

  # is it less than '0'?
  cmp $48, %bl
  jl parse_done

  # is it greater than '9'?
  cmp $57, %bl
  jg parse_done

  mov $0, %r9
  mov %bl, %r9b
  sub $48, %r9
  imul $10, %rax
  add %r9, %rax
  add $1, %r8
  jmp atoi_loop

parse_done:
  ret

prompt:
  .asciz "Type an expression: "
