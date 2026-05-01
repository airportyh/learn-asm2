# Learn ASM 2

## Overview
A personal learning workspace for x86-64 assembly language programming. Originally written for macOS (Darwin), this project contains assembly implementations of common algorithms and data structures.

## Project Structure
- **Root directory**: Assembly source files (`.s`) implementing various algorithms
- **`lib/`**: Reusable assembly routines (I/O, string utilities, filesystem)
- **`bin/`**: Build scripts (designed for macOS `as`/`ld` toolchain)
- **`computer_enhance/`**: Exercises from the Performance-Aware Programming course

## Key Files
- `hello.s` - Hello World using system calls
- `calc.s` / `parse_expr.s` - Recursive descent expression parser
- `bst.s`, `bst2.s`, `bst3.s` - Binary search tree implementations
- `fib.s` - Fibonacci sequence
- `gcd.s` - Greatest common divisor
- `trie.s` - Trie data structure
- `letter_histogram.s` - Letter frequency histogram

## Notes
- Assembly is written in AT&T syntax for macOS Darwin (x86-64)
- Uses macOS system call convention with `0x2000000` offset
- Build scripts in `bin/` use `as` (assembler) and `ld` (linker) targeting macOS SDK
- **Note**: These files are macOS-specific and require Darwin toolchain to assemble and run

## NASM Linux Program

A self-contained x86-64 NASM program was added alongside the existing macOS AT&T-syntax files:
- `add.asm` - Adds 2 + 2 using registers, converts result to ASCII, and prints `4` via Linux syscall
- `Makefile` - Builds `add.asm` using `nasm -f elf64` and `ld`; run with `make run`
- Workflow **"Run add 2+2"** builds and runs the program; output appears in the console pane

## Resources
- CHEATSHEET.md - Quick reference for x86-64 instructions
- NOTES - Algorithm design notes
- PROJECT_IDEAS.md - Future project ideas
