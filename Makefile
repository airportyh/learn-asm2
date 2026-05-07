ARGS ?= 12 99

all: add

add: add.asm
	nasm -f elf64 -o add.o add.asm
	ld -o add add.o

run: add
	./add $(ARGS)

holy_shit: holy_shit.s
	as -o holy_shit.o holy_shit.s
	ld -o holy_shit holy_shit.o

run_holy_shit: holy_shit
	./holy_shit

clean:
	rm -f add.o add holy_shit.o holy_shit
