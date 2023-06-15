#!/bin/sh
set -e

$HOME/opt/cross/bin/i686-elf-as boot.s -o boot.o
$HOME/opt/cross/bin/i686-elf-gcc -c kernel/kernel.c -o kernel/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
$HOME/opt/cross/bin/i686-elf-gcc -T linker.ld -o alura.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc

mkdir -p iso/boot/grub

cp alura.bin iso/boot/alura.bin
cp grub.cfg iso/boot/grub/grub.cfg
grub-mkrescue -o alura.iso iso
qemu-system-i386 -cdrom alura.iso