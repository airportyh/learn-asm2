ARGS ?= 12 99

all: add hey_brother

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
	rm -f add.o add hey_brother.o hey_brother sailing.o sailing
hey_brother: hey_brother.asm
	nasm -f elf64 -o hey_brother.o hey_brother.asm
	ld -o hey_brother hey_brother.o

run_hey_brother: hey_brother
	./hey_brother
