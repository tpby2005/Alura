#include "../lib/include/stdio.h"
#include "tty.h"

void kernel_main(void) {
	terminal_initialize();

	terminal_writestring("Alura Kernel\n\n\n");
	terminal_writestring("Written with help from: https://wiki.osdev.org");
}