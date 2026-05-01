ARGS ?= 12 99

all: add

add: add.asm
	nasm -f elf64 -o add.o add.asm
	ld -o add add.o

run: add
	./add $(ARGS)

yes: yes.s
	as -o yes.o yes.s
	ld -o yes yes.o

clean:
	rm -f add.o add yes.o yes
