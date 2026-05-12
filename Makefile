ARGS ?= 12 99

all: add hey_sister

add: add.asm
	nasm -f elf64 -o add.o add.asm
	ld -o add add.o

run: add
	./add $(ARGS)

hey_sister: hey_sister.asm
	nasm -f elf64 -o hey_sister.o hey_sister.asm
	ld -o hey_sister hey_sister.o

run_hey_sister: hey_sister
	./hey_sister

clean:
	rm -f add.o add hey_sister.o hey_sister
