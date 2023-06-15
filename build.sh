#!/bin/sh
set -e

./clean.sh

$HOME/opt/cross/bin/i686-elf-as boot.s -o boot.o
$HOME/opt/cross/bin/i686-elf-gcc -c lib/string/strlen.c -o lib/string/strlen.o -std=gnu99 -ffreestanding -O2
$HOME/opt/cross/bin/i686-elf-gcc -c kernel/tty.c -o kernel/tty.o -std=gnu99 -ffreestanding -O2
$HOME/opt/cross/bin/i686-elf-gcc -c kernel/kernel.c -o kernel/kernel.o -std=gnu99 -ffreestanding -O2
$HOME/opt/cross/bin/i686-elf-gcc -T linker.ld -o alura.bin -ffreestanding -O2 -nostdlib boot.o kernel/kernel.o kernel/tty.o lib/string/strlen.o -lgcc

mkdir -p iso/boot/grub

cp alura.bin iso/boot/alura.bin
cp grub.cfg iso/boot/grub/grub.cfg
grub-mkrescue -o alura.iso iso
qemu-system-i386 -cdrom alura.iso