ARGS ?= 12 99

all: add ranger_joe

add: add.asm
	nasm -f elf64 -o add.o add.asm
	ld -o add add.o

run: add
	./add $(ARGS)

ranger_joe: ranger_joe.asm
	nasm -f elf64 -o ranger_joe.o ranger_joe.asm
	ld -o ranger_joe ranger_joe.o

run-ranger-joe: ranger_joe
	./ranger_joe

clean:
	rm -f add.o add ranger_joe.o ranger_joe
