#include <stdio.h>

// CORRESPONDING ASSEMBLY CODE:
//# long func(long x, int n)
//# x in %rdi, n in %esi, result in %rax
//func:
//	movl	%esi, %ecx
//	movl	$1, %edx
//	movl	$0, %eax
//	jmp		cond
//loop:
//	movq	%rdi, %r8
//	andq	%rdx, %r8
//	orq		%r8, %rax
//	salq	%cl, %rdx	# shift left the value stored in %rdx by
//						# an amount related to the value in %cl*
//cond:
//	testq	%rdx, %rdx	# Value in %rdx is > 0, < 0, = 0 ?
//	jne		loop		# jump if %rdx != 0
//						# fall thru to ret if %rdx = 0
//	ret

/*
* n is copied to %ecx, which means %cl = 8 LSBs of n
* %edx (part of mask) is set to 1, meaning the LSB will be 1, rest are 0s, this dictates the value of %rdx as well
* ^this is setting up initialization in the for loop
* %eax is set to all 0s, meaning %rax (result) is also 0 in the beginning
* 
* condition: if %rdx (mask) != 0, do things
* else: return %rax (result), which is 0 if loop never happens
* what is in %rdx??? i bet mask is in %rdx that's why it's not initialized, although half of it is 1s
* things: 
*	copy x into %r8
*	and %rdx (mask) with %r8 (x), store result in %r8
*	what does %r8 become?
*	or %r8 with the %rax (result), store result in %rax (new result)
*	what does %rax become?
*	fill %rdx with the number of 0s equal to %cl's 6 LSBs
*	^final iterative statment, happens every loop
*	where does %cl come from? ANSWER: 8 LSBs of n
*	back to condition^
*/

long func(long x, int n) {
	int nCpy = n;
	char cl = (char) nCpy;
	long result = 0;
	long mask;

	for (mask = 1; mask != 0; mask = mask << cl) {
		long xCpy = x;
		xCpy &= mask;
		result |= xCpy;
	}
	return result;
}
