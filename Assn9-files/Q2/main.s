	.file	"main.c"
	.text
	.p2align 4
	.globl	lsearch_1
	.type	lsearch_1, @function
lsearch_1:
.LFB40:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L4
	subl	$1, %esi
	xorl	%eax, %eax
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L7:
	leaq	1(%rax), %rcx
	cmpq	%rsi, %rax
	je	.L4
	movq	%rcx, %rax
.L3:
	movl	%eax, %r8d
	cmpl	%edx, (%rdi,%rax,4)
	jne	.L7
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	movl	$-1, %r8d
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE40:
	.size	lsearch_1, .-lsearch_1
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Initializing array . . ."
.LC1:
	.string	"Array initialized. . ."
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Starting test of function %d . . .\n"
	.section	.rodata.str1.1
.LC3:
	.string	"Error: A[N] not consistent.\n"
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Error: A[N-1] not consistent.\n"
	.align 8
.LC5:
	.string	"It took %ld microseconds to run function %d.\n"
	.section	.rodata.str1.1
.LC6:
	.string	"Totalling work %d . . .\n"
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Error: Results of searches disagree.\n"
	.section	.rodata.str1.1
.LC8:
	.string	"Total misses = %ld, %ld\n"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Total of positions searched = %ld, %ld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC0(%rip), %rdi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	A(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	4(%r14), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	$1, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$3560, %rsp
	.cfi_def_cfa_offset 3616
	movq	%fs:40, %rax
	movq	%rax, 3544(%rsp)
	xorl	%eax, %eax
	movq	lsearch_2@GOTPCREL(%rip), %rax
	movq	%rax, 328(%rsp)
	call	puts@PLT
	xorl	%edi, %edi
	movl	$0, (%r14)
	call	time@PLT
	movq	%rax, %rdi
	call	srand@PLT
	.p2align 4,,10
	.p2align 3
.L9:
	imull	$-1431655765, %ebp, %eax
	leal	0(%rbp,%rbp,2), %edx
	cmpl	$1431655765, %eax
	setbe	%al
	addl	$1, %ebp
	addq	$4, %r12
	movzbl	%al, %eax
	addl	%edx, %eax
	movl	%eax, -4(%r12)
	call	rand@PLT
	movl	%eax, %ebx
	call	rand@PLT
	movslq	%ebx, %rcx
	imulq	$-2147418109, %rcx, %rcx
	movl	%eax, %edx
	movl	%ebx, %eax
	sarl	$31, %eax
	movl	%edx, %esi
	sarl	$31, %esi
	shrq	$32, %rcx
	addl	%ebx, %ecx
	sarl	$14, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	sall	$15, %eax
	subl	%ecx, %eax
	movslq	%edx, %rcx
	imulq	$-2147450879, %rcx, %rcx
	subl	%eax, %ebx
	movl	%ebx, %eax
	sall	$16, %eax
	shrq	$32, %rcx
	addl	%edx, %ecx
	sarl	$15, %ecx
	subl	%esi, %ecx
	movl	%ecx, %esi
	sall	$16, %esi
	subl	%ecx, %esi
	subl	%esi, %edx
	orl	%edx, %eax
	cltd
	idivl	%ebp
	movl	-4(%r12), %eax
	movslq	%edx, %rdx
	movl	(%r14,%rdx,4), %ecx
	movl	%ecx, -4(%r12)
	movl	%eax, (%r14,%rdx,4)
	cmpl	$20000000, %ebp
	jne	.L9
	movl	80000000(%r14), %eax
	leaq	.LC1(%rip), %rdi
	leaq	336(%rsp), %r15
	movq	%r15, %rbx
	leaq	lsearch_1(%rip), %rbp
	leaq	A(%rip), %r12
	movl	%eax, 4(%rsp)
	movl	79999996(%r14), %eax
	movl	%eax, 24(%rsp)
	call	puts@PLT
	leaq	32(%rsp), %rax
	movq	$1, 8(%rsp)
	movq	%rax, 16(%rsp)
.L15:
	movq	8(%rsp), %rax
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%r13d, %r13d
	movl	%eax, %edx
	movl	%eax, 28(%rsp)
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	getrusage@PLT
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L10:
	movl	24(%rsp), %eax
	cmpl	%eax, 79999996(%r14)
	jne	.L35
	addq	$1, %r13
	cmpq	$400, %r13
	je	.L36
.L13:
	movl	%r13d, %edx
	movl	$20000000, %esi
	movq	%r12, %rdi
	call	*%rbp
	movl	%eax, (%rbx,%r13,4)
	movl	4(%rsp), %eax
	cmpl	%eax, 80000000(%r14)
	je	.L10
	leaq	.LC3(%rip), %rdi
	call	perror@PLT
.L11:
	movq	3544(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L37
	addq	$3560, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L36:
	.cfi_restore_state
	xorl	%edi, %edi
	leaq	176(%rsp), %rsi
	addq	$1600, %rbx
	call	getrusage@PLT
	movl	28(%rsp), %ecx
	xorl	%eax, %eax
	movl	$1, %edi
	movq	176(%rsp), %rdx
	subq	32(%rsp), %rdx
	leaq	.LC5(%rip), %rsi
	imulq	$1000000, %rdx, %rdx
	addq	184(%rsp), %rdx
	subq	40(%rsp), %rdx
	call	__printf_chk@PLT
	cmpq	$2, 8(%rsp)
	jne	.L38
	leaq	.LC6(%rip), %rsi
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	xorl	%r12d, %r12d
	movl	$1, %edi
	movl	$3, %edx
	xorl	%r13d, %r13d
	call	__printf_chk@PLT
	xorl	%r9d, %r9d
	xorl	%r10d, %r10d
	xorl	%edi, %edi
	leaq	1600(%r15), %rsi
	xorl	%r11d, %r11d
	xorl	%r8d, %r8d
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L41:
	movslq	%eax, %rdx
	addq	%rdx, %r12
	movl	1600(%r15), %edx
	cmpl	$-1, %edx
	je	.L39
.L33:
	movslq	%edx, %rcx
	addq	%rcx, %r13
	cmpl	%edx, %eax
	jne	.L40
.L18:
	addq	$4, %r15
	cmpq	%rsi, %r15
	je	.L19
.L16:
	movl	(%r15), %eax
	cmpl	$-1, %eax
	jne	.L41
	movl	1600(%r15), %edx
	addq	$1, %rdi
	addq	$20000000, %r12
	movl	$1, %r10d
	cmpl	$-1, %edx
	jne	.L33
.L39:
	addq	$1, %r8
	addq	$20000000, %r13
	movl	$1, %r11d
	cmpl	%edx, %eax
	je	.L18
.L40:
	leaq	.LC7(%rip), %rdi
	call	perror@PLT
	jmp	.L11
.L35:
	leaq	.LC4(%rip), %rdi
	call	perror@PLT
	jmp	.L11
.L19:
	testb	%r11b, %r11b
	leaq	.LC8(%rip), %rsi
	cmovne	%r8, %r9
	testb	%r10b, %r10b
	cmovne	%rdi, %r14
	movl	$1, %edi
	xorl	%eax, %eax
	movq	%r9, %rcx
	movq	%r14, %rdx
	call	__printf_chk@PLT
	movq	%r13, %rcx
	movq	%r12, %rdx
	movl	$1, %edi
	leaq	.LC9(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L11
.L38:
	movq	$2, 8(%rsp)
	movq	328(%rsp), %rbp
	jmp	.L15
.L37:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.comm	A,80000000,32
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
