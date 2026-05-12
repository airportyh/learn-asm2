ARGS ?= 12 99

all: add dinghy

add: add.asm
	nasm -f elf64 -o add.o add.asm
	ld -o add add.o

run: add
	./add $(ARGS)

dinghy: dinghy.asm
	nasm -f elf64 -o dinghy.o dinghy.asm
	ld -o dinghy dinghy.o

run-dinghy: dinghy
	./dinghy

clean:
	rm -f add.o add dinghy.o dinghy
