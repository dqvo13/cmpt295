#include <stdio.h>

typedef unsigned short bit16;

void mystery(bit16, char*);

void main() {
    bit16 x = 0x1234;
    char msg[16] = "The result is:";
    char someStr[16];

    puts(msg);
    mystery(x, someStr);
    puts(someStr);
    
    puts(msg);
    mystery(x, someStr);
    puts(someStr);
	return;
}
