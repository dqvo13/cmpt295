	.file	"main.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"It took %ld microseconds to initialize the array.\n"
	.align 8
.LC1:
	.string	"It took %ld microseconds for qSort2.\n"
	.align 8
.LC2:
	.string	"It took %ld + %ld = %ld microseconds for qSort2.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	xorl	%edi, %edi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	leaq	4+A(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	-4(%r12), %r13
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	$1, %ebx
	subq	$304, %rsp
	.cfi_def_cfa_offset 352
	movq	%fs:40, %rax
	movq	%rax, 296(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rbp
	call	time@PLT
	movq	%rax, %rdi
	call	srand@PLT
	movq	%rbp, %rsi
	xorl	%edi, %edi
	call	getrusage@PLT
	movl	$0, A(%rip)
	.p2align 4,,10
	.p2align 3
.L2:
	movl	%ebx, %eax
	addl	$1, %ebx
	addq	$4, %r12
	imulq	$1374389535, %rax, %rax
	shrq	$37, %rax
	movl	%eax, -4(%r12)
	call	rand@PLT
	movl	%eax, %r14d
	call	rand@PLT
	movslq	%r14d, %rcx
	imulq	$-2147418109, %rcx, %rcx
	movl	%eax, %esi
	movl	%r14d, %eax
	sarl	$31, %eax
	shrq	$32, %rcx
	addl	%r14d, %ecx
	sarl	$14, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	sall	$15, %eax
	subl	%ecx, %eax
	movslq	%esi, %rcx
	imulq	$-2147450879, %rcx, %rcx
	subl	%eax, %r14d
	movl	%esi, %eax
	sarl	$31, %eax
	sall	$16, %r14d
	shrq	$32, %rcx
	addl	%esi, %ecx
	sarl	$15, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	sall	$16, %eax
	subl	%ecx, %eax
	subl	%eax, %esi
	orl	%r14d, %esi
	movl	%esi, %eax
	cltd
	idivl	%ebx
	movl	-4(%r12), %eax
	movslq	%edx, %rdx
	movl	0(%r13,%rdx,4), %ecx
	movl	%ecx, -4(%r12)
	movl	%eax, 0(%r13,%rdx,4)
	cmpl	$32000000, %ebx
	jne	.L2
	leaq	144(%rsp), %r12
	xorl	%edi, %edi
	movq	%r12, %rsi
	call	getrusage@PLT
	movq	144(%rsp), %rdx
	subq	(%rsp), %rdx
	movl	$1, %edi
	imulq	$1000000, %rdx, %rdx
	leaq	.LC0(%rip), %rsi
	addq	152(%rsp), %rdx
	xorl	%eax, %eax
	subq	8(%rsp), %rdx
	call	__printf_chk@PLT
	xorl	%edi, %edi
	movq	%rbp, %rsi
	call	getrusage@PLT
	movl	$32000000, %esi
	leaq	A(%rip), %rdi
	call	qSort2@PLT
	xorl	%edi, %edi
	movq	%r12, %rsi
	call	getrusage@PLT
	movq	144(%rsp), %rdx
	subq	(%rsp), %rdx
	movl	$1, %edi
	imulq	$1000000, %rdx, %rdx
	leaq	.LC1(%rip), %rsi
	addq	152(%rsp), %rdx
	xorl	%eax, %eax
	subq	8(%rsp), %rdx
	call	__printf_chk@PLT
	movq	144(%rsp), %rdx
	subq	(%rsp), %rdx
	xorl	%eax, %eax
	imulq	$1000000, %rdx, %rdx
	movq	152(%rsp), %rcx
	subq	8(%rsp), %rcx
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	leaq	(%rdx,%rcx), %r8
	call	__printf_chk@PLT
	movq	296(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L7
	addq	$304, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.comm	A,128000000,32
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
