#!/bin/sh
set -e

rm -rf iso/boot/alura.bin
rm -rf kernel/kernel.o
rm -rf kernel/tty.o
rm -rf lib/string/strlen.o
rm -rf lib/stdio/printf.o
rm -rf lib/stdio/putchar.o
rm -rf alura.bin
rm -rf alura.iso
rm -rf boot.o