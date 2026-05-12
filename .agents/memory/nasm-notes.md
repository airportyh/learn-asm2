# NASM Linux Program Notes

## Format
- All NASM programs use `nasm -f elf64` + `ld` (no libc)
- Entry point: `global _start` / `_start:`
- Linux syscalls: `syscall` instruction, numbers in `rax`
  - sys_write: rax=1, rdi=fd, rsi=buf, rdx=len
  - sys_exit:  rax=60, rdi=exit_code

## String data pattern
```asm
section .data
    msg db "Hello!", 0x0a
    msg_len equ $ - msg
```

## Makefile pattern
Each program gets a build target and a run target:
```makefile
hey_sister: hey_sister.asm
    nasm -f elf64 -o hey_sister.o hey_sister.asm
    ld -o hey_sister hey_sister.o

run_hey_sister: hey_sister
    ./hey_sister
```
Add object file and binary to `clean`. Add binary to `all`.

## Files
- `add.asm` — adds two CLI args, prints result (complex: atoi/itoa helpers)
- `hey_sister.asm` — prints "Hey, sister!\n" to stdout (simple string write)
- `Makefile` — unified build for all NASM programs
