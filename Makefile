ARGS ?= 12 99

all: add hey_brother

add: add.asm
	nasm -f elf64 -o add.o add.asm
	ld -o add add.o

run: add
	./add $(ARGS)

hey_brother: hey_brother.asm
	nasm -f elf64 -o hey_brother.o hey_brother.asm
	ld -o hey_brother hey_brother.o

run_hey_brother: hey_brother
	./hey_brother

clean:
	rm -f add.o add hey_brother.o hey_brother
