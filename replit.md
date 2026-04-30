# x86-64 Assembly Learning Project

## Overview
A personal scratchpad for learning x86-64 assembly programming, originally targeting macOS. Contains implementations of algorithms, data structures, and low-level programming exercises.

## Tech Stack
- **Language:** x86-64 Assembly (AT&T syntax)
- **Original Target OS:** macOS (uses Mach-O syscalls like `0x2000004` for `write`)
- **Build Tools:** Custom shell scripts in `bin/`
- **No package manager, no web frontend, no backend server**

## Project Layout
- `*.s` — Assembly source files (exercises and implementations)
- `bin/` — Build scripts (`build`, `build-std`, `build-hex`, `disassemble`, `clean`)
- `lib/` — Reusable assembly routines (I/O, string manipulation, system exits)
- `computer_enhance/` — Exercises from the "Computer Enhance" course
- `CHEATSHEET.md` — Quick reference for LLDB, registers, and calling conventions
- `README.md` — Topic overview and learning goals
- `NOTES`, `notes.md` — Development notes

## Key Files
- `hello.s` — Hello World using macOS syscalls
- `bst.s`, `bst2.s`, `bst3.s` — Binary Search Tree implementations
- `calc.s`, `parse_expr.s` — Calculator and expression parser
- `trie.s` — Trie data structure
- `fib.s`, `gcd.s` — Fibonacci and GCD algorithms

## Notes
- Code uses macOS-specific syscall numbers and will not run directly on Linux without modification.
- No workflow configured — this is a code study project, not a runnable web application.
