	.file	"lsearch_2.c"
	.text
	.p2align 4
	.globl	lsearch_2
	.type	lsearch_2, @function
# lsearch_2(int *A, int n, int target)
# A -> %rdi, n -> %esi, target -> %edx
lsearch_2:
	.cfi_startproc
	endbr64
	testl	%esi, %esi			# if n <= 0
	jle	notFound			# invalid param, return -1
	movslq	%esi, %rax
	leaq	-4(%rdi,%rax,4), %rax		
	movl	(%rax), %r9d			# temp = A[n-1]
	movl	%edx, (%rax)			# A[n-1] = target
	cmpl	(%rdi), %edx			# if A[0] == target
	je	zeroIndex			# then return i = 0
	movl	$1, %ecx			# increment i
loop:
	movl	%ecx, %r8d			# save i in temp register
	addq	$1, %rcx			# i++
	cmpl	%edx, -4(%rdi,%rcx,4)		# if A[i-1] != target
	jne	loop				# continue while loop
finish:
	movl	%r9d, (%rax)			# A[n-1] = temp
	leal	-1(%rsi), %eax			# ret <- n-1
	cmpl	%r8d, %eax			# if (saved) i < n-1
	jg	found				# then return (saved) i
	cmpl	%edx, %r9d			# else if A[n-1] != target
	jne	notFound			# then return -1
	ret					# else return n-1
found:
	movl	%r8d, %eax			# ret <- (saved) i
	ret
zeroIndex:
	xorl	%r8d, %r8d			# i = 0
	jmp	finish
notFound:
	movl	$-1, %eax			# return -1
	ret
	.cfi_endproc
.LFE0:
	.size	lsearch_2, .-lsearch_2
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
