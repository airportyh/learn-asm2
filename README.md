# Learn ASM 2

2. How to snapshot entire process memory?
3. How to restore ...?


4. recursive functions
5. structures
6. arrays
7. linked lists
8. strings
9. parsing
10. try leetcode challenges
11. web server
12. merge sort
13. hash table
14. BSTs
15. how to integrate source debugging with gdb
16. Can we give imul 2 args?
17. bootstrap an assembler (write an assembler in itself)
## Problems

0. simple sums (x)
1. reverse a string (x)
2. arthmetic calculator, with + - * / and parans (x)
1. histogram of letters (x)
5. binary search trees (x)
5. binary search
6. try growing stack upwards in statically allocated memory
4. malloc
2. linked lists
3. hash table
2. write wc
4. quicksort

## Topics

1. arithmetics (add, subtract)
2. arithmetics 2 (multiply, divide)
3. addressing memory
4. labels and branching
5. calls
6. stack
7. stack pointer
8. program counter
9. system calls
10. library calls
10. xmm_ instructions
11. DIY malloc
12. time-travel debugging
13. Recursion

## Books / Resources

* https://flint.cs.yale.edu/cs422/reference/index.html
* https://flint.cs.yale.edu/cs422/doc/art-of-asm/pdf/
* https://flint.cs.yale.edu/cs422/readings/pcasm-book.pdf
* https://www.logix.cz/michal/doc/i386/
* https://www.amazon.com/Art-Assembly-Language-2nd/dp/1593272073
* http://ref.x86asm.net/
* https://en.wikipedia.org/wiki/X86_instruction_listings
* https://visualgdb.com/gdbreference/commands/x
* https://opensource.apple.com/source/lldb/lldb-159/www/lldb-gdb.html
* https://en.wikibooks.org/wiki/X86_Assembly
* https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_toc.html
* https://stackoverflow.com/questions/12122446/how-does-c-linking-work-in-practice/30507725#30507725
* https://syscalls64.paolostivanin.com/

## Classic Recursion Problems

2. Eucid's GCD algorithm
3. Simple recursive descent parser

## Questions

1. How to snapshot/restore entire process memory?
2. How to read from rflags/eflags? 
3. How to manage registers? What strategy to use when choosing between stack memory vs registers?

## Reading List

* https://stackoverflow.com/questions/35834937/error-in-backend-32-bit-absolute-addressing-is-not-supported-in-64-bit-mode
* https://stackoverflow.com/questions/25799551/why-does-this-movq-instruction-work-on-linux-and-not-osx/25804623#25804623
* https://github.com/aidansteele/osx-abi-macho-file-format-reference
* otool --help
* https://en.wikipedia.org/wiki/Mach-O
* https://cirosantilli.com/elf-hello-world
* man ld
* man as
* https://en.wikibooks.org/wiki/X86_Assembly/Data_Transfer

## Debuggers to try

* https://cutter.re/
* https://github.com/radareorg/radare2
* https://binary.ninja/
* IDA
* https://cutter.re/
* https://rizin.re/organization/

## Try using gdb again?

* https://sourceware.org/gdb/wiki/BuildingOnDarwin
* https://stackoverflow.com/questions/18423124/please-check-gdb-is-codesigned-see-taskgated8-how-to-get-gdb-installed-w
