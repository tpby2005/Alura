#include "../lib/include/stdio.h"
#include "tty.h"

void kernel_main(void) {
	terminal_initialize();

	printf("Alura Kernel\n\n\n");
	printf("Written with help from: https://wiki.osdev.org");
}