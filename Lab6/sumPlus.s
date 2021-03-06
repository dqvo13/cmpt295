	.globl sumPlus
# int sumPlus(int *A, int N);
# A in rdi, N in esi
sumPlus:
	xorl	%eax, %eax
	testl	%esi, %esi
	jle		done
	xorl	%edx, %edx
	shl     $2, %rsi
	xorl	%r8d, %r8d
loop:
	movl	(%rdi,%rdx), %ecx
	testl	%ecx, %ecx
	#jle	endif
	cmovl	%r8d, %ecx
	addl	%ecx, %eax
endif:
	addq	$4, %rdx
	cmpq	%rsi, %rdx
	jne		loop
done:
	ret
