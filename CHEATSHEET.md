## LLDB

* `register read <?reg name>`
* `process launch --stop-at-entry`
* `b main`
* `x/<n>i $pc`
* `x/<n>g <addr>`
* help format

## Registers

From the art of 64-bit assembly:

|64 bits|32 bits|bits 0-15|bits 8-15|bits 0-7|
|-------|-------|---------|---------|--------|
|rax    |eax    |ax       |ah       |al      |
|rbx    |ebx    |bx       |bh       |bl      |
|rcx    |ecx    |cx       |ch       |cl      |
|rdx    |edx    |dx       |dh       |dl      |
|rdi    |edi    |di       |         |dil     |
|rsi    |esi    |si       |         |sil     |
|rbp    |ebp    |bp       |         |bpl     |
|rsp    |esp    |sp       |         |spl     |
|r8     |r8d    |r8w      |         |r8b     |
|r9     |r9d    |r9w      |         |r9b     |
|.                                           |
|.                                           |
|.                                           |
|r15    |r15d   |r15w     |         |r15b    |
|rip    |                                    |
|rflags |                                    |

## Syscalls

/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/syscall.h

## Call convention

https://syscalls64.paolostivanin.com/

Syscall number: rax
Args order: rdi, rsi, rdx, r10, r8, r9

Return value: rax