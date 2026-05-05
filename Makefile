ARGS ?= 12 99

all: add

add: add.asm
	nasm -f elf64 -o add.o add.asm
	ld -o add add.o

run: add
	./add $(ARGS)

hola: hola.s
	mkdir -p bin
	as -o hola.o hola.s
	ld -o bin/hola hola.o
	rm -f hola.o

clean:
	rm -f add.o add hola.o
	rm -rf bin
