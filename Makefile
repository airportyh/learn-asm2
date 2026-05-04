ARGS ?= 12 99

all: add

add: add.asm
	nasm -f elf64 -o add.o add.asm
	ld -o add add.o

run: add
	./add $(ARGS)

whatsup: whatsup.asm
	nasm -f elf64 -o whatsup.o whatsup.asm
	ld -o whatsup whatsup.o

clean:
	rm -f add.o add whatsup.o whatsup
