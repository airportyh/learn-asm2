ARGS ?= 12 99

all: add hey_brother dinghy dilbert denmark poland yonkers jam jack_in_the_box jank what_the_heck tommy_lee_jones brad_mehldau hello_replit atlanta torrey_pines san_diego

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

jack_in_the_box: jack_in_the_box.asm
	nasm -f elf64 -o jack_in_the_box.o jack_in_the_box.asm
	ld -o jack_in_the_box jack_in_the_box.o

run-jack_in_the_box: jack_in_the_box
	./jack_in_the_box

jank: jank.asm
	nasm -f elf64 -o jank.o jank.asm
	ld -o jank jank.o

run-jank: jank
	./jank

what_the_heck: what_the_heck.asm
	nasm -f elf64 -o what_the_heck.o what_the_heck.asm
	ld -o what_the_heck what_the_heck.o

run-what_the_heck: what_the_heck
	./what_the_heck

tommy_lee_jones: tommy_lee_jones.asm
	nasm -f elf64 -o tommy_lee_jones.o tommy_lee_jones.asm
	ld -o tommy_lee_jones tommy_lee_jones.o

run-tommy_lee_jones: tommy_lee_jones
	./tommy_lee_jones

brad_mehldau: brad_mehldau.asm
	nasm -f elf64 -o brad_mehldau.o brad_mehldau.asm
	ld -o brad_mehldau brad_mehldau.o

run-brad_mehldau: brad_mehldau
	./brad_mehldau

hello_replit: hello_replit.asm
	nasm -f elf64 -o hello_replit.o hello_replit.asm
	ld -o hello_replit hello_replit.o

run-hello_replit: hello_replit
	./hello_replit

atlanta: atlanta.asm
	nasm -f elf64 -o atlanta.o atlanta.asm
	ld -o atlanta atlanta.o

run-atlanta: atlanta
	./atlanta

torrey_pines: torrey_pines.asm
	nasm -f elf64 -o torrey_pines.o torrey_pines.asm
	ld -o torrey_pines torrey_pines.o

run-torrey_pines: torrey_pines
	./torrey_pines

san_diego: san_diego.asm
	nasm -f elf64 -o san_diego.o san_diego.asm
	ld -o san_diego san_diego.o

run-san_diego: san_diego
	./san_diego

clean:
	rm -f add.o add hey_brother.o hey_brother dinghy.o dinghy dilbert.o dilbert denmark.o denmark poland.o poland yonkers.o yonkers jam.o jam jack_in_the_box.o jack_in_the_box jank.o jank what_the_heck.o what_the_heck tommy_lee_jones.o tommy_lee_jones brad_mehldau.o brad_mehldau hello_replit.o hello_replit atlanta.o atlanta torrey_pines.o torrey_pines
