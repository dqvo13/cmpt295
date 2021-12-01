	.file	"main.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Sample %d completed in %d clock cycles - DISCARDED.\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Average of %ld clock cycles.\n"
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"Must enter either 0 for linked list or 1 for array."
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx
	xorl	%edi, %edi
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	time@PLT
	movq	%rax, %rdi
	call	srand@PLT
	call	newLL@PLT
	cmpl	$2, %ebx
	je	.L17
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	leaq	.LC2(%rip), %rdi
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
	jmp	puts@PLT
.L17:
	.cfi_restore_state
	movq	8(%r12), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, %rbp
	leaq	A(%rip), %r12
	xorl	%r14d, %r14d
	call	strtol@PLT
	movq	%r12, %rbx
	movq	%r12, %r15
	movl	%eax, 12(%rsp)
	.p2align 4,,10
	.p2align 3
.L3:
	leal	(%r14,%r14), %eax
	addl	$1, %r14d
	addq	$4, %r15
	movl	%eax, -4(%r15)
	call	rand@PLT
	movl	%eax, %r13d
	call	rand@PLT
	movslq	%r13d, %rcx
	movl	%r13d, %edi
	imulq	$-2147418109, %rcx, %rcx
	movl	%eax, %esi
	movl	%r13d, %eax
	sarl	$31, %eax
	shrq	$32, %rcx
	addl	%r13d, %ecx
	sarl	$14, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	sall	$15, %eax
	subl	%ecx, %eax
	movslq	%esi, %rcx
	imulq	$-2147450879, %rcx, %rcx
	subl	%eax, %edi
	movl	%esi, %eax
	sarl	$31, %eax
	sall	$16, %edi
	shrq	$32, %rcx
	addl	%esi, %ecx
	sarl	$15, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	sall	$16, %eax
	subl	%ecx, %eax
	subl	%eax, %esi
	orl	%edi, %esi
	movl	%esi, %eax
	cltd
	idivl	%r14d
	movl	-4(%r15), %eax
	movslq	%edx, %rdx
	movl	(%rbx,%rdx,4), %ecx
	movl	%ecx, -4(%r15)
	movl	%eax, (%rbx,%rdx,4)
	cmpl	$150, %r14d
	jne	.L3
	leaq	600+A(%rip), %rbx
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%r12), %esi
	movq	%rbp, %rdi
	addq	$4, %r12
	call	appendLL@PLT
	cmpq	%rbx, %r12
	jne	.L4
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	leaq	cycles(%rip), %r14
	movl	$1, %r15d
	.p2align 4,,10
	.p2align 3
.L10:
#APP
# 43 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movl	12(%rsp), %eax
	movl	%esi, start_time(%rip)
	testl	%eax, %eax
	je	.L5
	movl	%r12d, %edx
	movl	$150, %esi
	leaq	A(%rip), %rdi
	call	lsearch@PLT
	leaq	P(%rip), %rbx
	movl	%eax, (%rbx,%r13,4)
.L6:
#APP
# 55 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movl	%esi, end_time(%rip)
	subl	start_time(%rip), %esi
	movl	%esi, (%r14,%r13,4)
	cmpl	$3999, %esi
	jg	.L18
	cmpl	$299, %r15d
	jg	.L9
	movl	%r15d, %r12d
	movslq	%r15d, %r13
	addl	$1, %r15d
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L5:
	movl	%r12d, %esi
	movq	%rbp, %rdi
	leaq	Q(%rip), %rbx
	call	LLsearch@PLT
	movl	%eax, (%rbx,%r13,4)
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L18:
	movl	%esi, %ecx
	movl	%r15d, %edx
	leaq	.LC0(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	jmp	.L10
.L9:
	leaq	cycles(%rip), %rcx
	xorl	%eax, %eax
	leaq	1200(%rcx), %rsi
	.p2align 4,,10
	.p2align 3
.L11:
	movslq	(%rcx), %rdx
	addq	$4, %rcx
	addq	%rdx, %rax
	cmpq	%rcx, %rsi
	jne	.L11
	movl	$300, %ecx
	cqto
	movq	%rax, total(%rip)
	movl	$1, %edi
	idivq	%rcx
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movq	%rbp, %rdi
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
	jmp	freeLL@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.globl	end_time
	.bss
	.align 4
	.type	end_time, @object
	.size	end_time, 4
end_time:
	.zero	4
	.globl	start_time
	.align 4
	.type	start_time, @object
	.size	start_time, 4
start_time:
	.zero	4
	.comm	total,8,8
	.comm	cycles,1200,32
	.comm	Q,1200,32
	.comm	P,1200,32
	.comm	A,600,32
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
