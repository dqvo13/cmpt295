#include <stdio.h>

long decode2(long x, long y, long z);

int main() {
	long x = 1;
	long y = 3;
	long z = 4;

	printf("decode2 returns: %li\n", decode2(x, y, z));

	return 0;
}
