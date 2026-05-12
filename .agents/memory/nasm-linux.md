# NASM Linux x86-64 Programs

## Build toolchain
- Assembler: `nasm -f elf64`
- Linker: `ld` (plain, no extra flags needed)
- Entry point: `_start` (global)

## Syscall conventions
- sys_write: rax=1, rdi=fd, rsi=buf, rdx=len
- sys_exit:  rax=60, rdi=exit_code
- stdout fd: 1

## Makefile pattern
```makefile
target: target.asm
	nasm -f elf64 -o target.o target.asm
	ld -o target target.o

run-target: target
	./target
```

## Workflow pattern
- outputType: "console" (no port needed for CLI programs)
- command: `make run-target`

## Existing programs
- add.asm — adds two integers passed as argv[1] argv[2], prints result
- dinghy.asm — prints "I love building dinghies\n" to stdout
