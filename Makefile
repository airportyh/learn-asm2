ARGS ?= 12 99

all: add hey_brother dinghy dilbert denmark poland yonkers jam jacky

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

hey_brother: hey_brother.asm
	nasm -f elf64 -o hey_brother.o hey_brother.asm
	ld -o hey_brother hey_brother.o

run_hey_brother: hey_brother
	./hey_brother

dilbert: dilbert.asm
	nasm -f elf64 -o dilbert.o dilbert.asm
	ld -o dilbert dilbert.o

run-dilbert: dilbert
	./dilbert

denmark: denmark.asm
	nasm -f elf64 -o denmark.o denmark.asm
	ld -o denmark denmark.o

run-denmark: denmark
	./denmark

poland: poland.asm
	nasm -f elf64 -o poland.o poland.asm
	ld -o poland poland.o

run-poland: poland
	./poland

yonkers: yonkers.asm
	nasm -f elf64 -o yonkers.o yonkers.asm
	ld -o yonkers yonkers.o

run-yonkers: yonkers
	./yonkers

jam: jam.asm
	nasm -f elf64 -o jam.o jam.asm
	ld -o jam jam.o

run-jam: jam
	./jam

jacky: jacky.asm
	nasm -f elf64 -o jacky.o jacky.asm
	ld -o jacky jacky.o

run-jacky: jacky
	./jacky

clean:
	rm -f add.o add hey_brother.o hey_brother dinghy.o dinghy dilbert.o dilbert denmark.o denmark poland.o poland yonkers.o yonkers jam.o jam jacky.o jacky
