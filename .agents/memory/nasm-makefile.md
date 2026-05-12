# NASM / Makefile Notes

## Environment
- Linux x86-64 container; `nasm` and `ld` are available
- Build command: `nasm -f elf64 -o <name>.o <name>.asm && ld -o <name> <name>.o`

## Makefile gotcha
- The `write` tool emits spaces instead of tabs for indentation
- Makefiles require hard tabs — always rewrite with literal tab characters or use `edit` carefully
- Symptom: `*** missing separator (did you mean TAB instead of 8 spaces?)`

## Linux syscall convention (x86-64)
- sys_write: rax=1, rdi=fd(1=stdout), rsi=buf ptr, rdx=len
- sys_exit:  rax=60, rdi=exit code

## Project patterns
- Each program gets its own `.asm` file, a `<name>` Makefile target, and a `run-<name>` target
- `clean` target should list all `.o` files and binaries
- String length computed with `equ $ - label` in .data section
