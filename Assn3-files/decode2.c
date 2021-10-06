#include <stdio.h>

long decode2(long x, long y, long z) {
	// x -> %rdi, y -> %rsi, z -> %rdx
	long result = 0;		    // result -> %rax
	y -= z;					        // subq %rdx, %rsi
	x *= y;					        // imulq %rsi, %rdi
	result = y;				      // movq %rsi, %rax
	result = result << 63;	// salq $63, %rax
	result = result >> 63;	// sarq $63, %rax
	result ^= x;			      // xorq %rdi, %rax
	
	return result;			    // ret
}
