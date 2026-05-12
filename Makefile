ARGS ?= 12 99

all: add

add: add.asm
	nasm -f elf64 -o add.o add.asm
	ld -o add add.o

run: add
	./add $(ARGS)

sailing: sailing.asm
	nasm -f elf64 -o sailing.o sailing.asm
	ld -o sailing sailing.o

run-sailing: sailing
	./sailing

clean:
	rm -f add.o add sailing.o sailing
