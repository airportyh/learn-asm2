## LLDB

* `register read <?reg name>`
* `process launch --step-on-entry`
* `b main`
* `x/<n>i $pc`
* `x/<n>g <addr>`

## Registers

From the art of 64-bit assembly:

|64 bits|32 bits|bits 0-15|bits 8-15|bits 0-7|
|-------|-------|---------|---------|--------|
|rax    |eax    |ax       |ah       |al      |
|rbx    |ebx    |bx       |bh       |bl      |
|rcx    |ecx    |cx       |ch       |cl      |
|rdx    |edx    |dx       |dh       |dl      |
|rsi    |esi    |si       |         |sil     |
|rdi    |edi    |di       |         |dil     |
|rbp    |ebp    |bp       |         |bpl     |
|rsp    |esp    |sp       |         |spl     |
|r8     |r8d    |r8w      |         |r8b     |
|r9     |r9d    |r9w      |         |r9b     |
|.                                           |
|.                                           |
|.                                           |
|r15    |r15d   |r15w     |         |r15b    |