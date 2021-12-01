	.file	"qsorts.c"
	.text
	.p2align 4
	.globl	qSort1
	.type	qSort1, @function
qSort1:
.LFB0:
	.cfi_startproc
	endbr64
	cmpl	$1, %esi
	jle	.L11
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	%esi, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
.L2:
	movl	(%rbx), %esi
	leal	-1(%r13), %ebp
	movl	$-1, %ecx
	movslq	%ebp, %rbp
	movl	%esi, %edx
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rbx,%rbp,4), %edi
	leal	1(%rbp), %r8d
	movl	%ebp, %r12d
	cmpl	%edi, %esi
	jl	.L4
	leal	1(%rcx), %eax
	cltq
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L15:
	movl	(%rbx,%rax,4), %edx
.L6:
	movl	%eax, %ecx
	addq	$1, %rax
	cmpl	%edx, %esi
	jg	.L15
	cmpl	%ebp, %ecx
	jge	.L7
	movslq	%ecx, %rax
	movl	%edi, (%rbx,%rax,4)
	movl	%edx, (%rbx,%rbp,4)
	movl	4(%rbx,%rax,4), %edx
.L4:
	subq	$1, %rbp
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L7:
	subl	%r12d, %r13d
	movq	%rbx, %rdi
	leaq	4(%rbx,%rbp,4), %rbx
	movl	%r8d, %esi
	call	qSort1
	subl	$1, %r13d
	cmpl	$1, %r13d
	jg	.L2
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L11:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.cfi_endproc
.LFE0:
	.size	qSort1, .-qSort1
	.p2align 4
	.globl	swap
	.type	swap, @function
swap:
.LFB2:
	.cfi_startproc
	endbr64
	movl	(%rdi), %eax
	movl	(%rsi), %edx
	movl	%edx, (%rdi)
	movl	%eax, (%rsi)
	ret
	.cfi_endproc
.LFE2:
	.size	swap, .-swap
	.p2align 4
	.globl	partitionH
	.type	partitionH, @function
partitionH:
.LFB3:
	.cfi_startproc
	endbr64
	movl	%esi, %r8d
	movl	(%rdi), %esi
	movl	$-1, %ecx
	subl	$1, %r8d
	movslq	%r8d, %r8
	movl	%esi, %edx
	.p2align 4,,10
	.p2align 3
.L18:
	movl	(%rdi,%r8,4), %r9d
	movl	%r8d, %r10d
	cmpl	%esi, %r9d
	jg	.L19
	leal	1(%rcx), %eax
	cltq
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L23:
	movl	(%rdi,%rax,4), %edx
.L21:
	movl	%eax, %ecx
	addq	$1, %rax
	cmpl	%edx, %esi
	jg	.L23
	cmpl	%r8d, %ecx
	jge	.L17
	movslq	%ecx, %rax
	movl	%r9d, (%rdi,%rax,4)
	movl	%edx, (%rdi,%r8,4)
	movl	4(%rdi,%rax,4), %edx
.L19:
	subq	$1, %r8
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L17:
	movl	%r10d, %eax
	ret
	.cfi_endproc
.LFE3:
	.size	partitionH, .-partitionH
	.p2align 4
	.globl	partitionL
	.type	partitionL, @function
partitionL:
.LFB4:
	.cfi_startproc
	endbr64
	leal	-1(%rsi), %eax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	(%rdi), %r8d
	movslq	%eax, %rdx
	leaq	(%rdi,%rdx,4), %rbx
	movl	(%rbx), %r10d
	testl	%eax, %eax
	jle	.L29
	leal	-2(%rsi), %eax
	movq	%rdi, %rdx
	movl	%r8d, %esi
	xorl	%r9d, %r9d
	leaq	4(%rdi,%rax,4), %r11
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L27:
	movl	(%rdx), %r8d
.L28:
	movslq	%r9d, %rax
	salq	$2, %rax
	leaq	(%rdi,%rax), %rcx
	cmpl	%r8d, %r10d
	jl	.L26
	movl	%r8d, (%rcx)
	leaq	4(%rdi,%rax), %rcx
	addl	$1, %r9d
	movl	%esi, (%rdx)
	movl	(%rcx), %esi
.L26:
	addq	$4, %rdx
	cmpq	%r11, %rdx
	jne	.L27
	movl	(%rbx), %r10d
	movl	%r9d, %eax
	movl	%r10d, (%rcx)
	movl	%esi, (%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L29:
	.cfi_restore_state
	movl	%r8d, %esi
	movq	%rdi, %rcx
	xorl	%r9d, %r9d
	movl	%r10d, (%rcx)
	movl	%r9d, %eax
	movl	%esi, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4:
	.size	partitionL, .-partitionL
	.p2align 4
	.globl	qSort2
	.type	qSort2, @function
qSort2:
.LFB1:
	.cfi_startproc
	endbr64
	cmpl	$1, %esi
	jle	.L36
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
.L32:
	movl	%ebp, %esi
	movq	%r12, %rdi
	call	partitionL
	movslq	%eax, %rbx
	subl	%ebx, %ebp
	movl	%ebx, %esi
	leaq	4(%r12,%rbx,4), %r12
	call	qSort2
	subl	$1, %ebp
	cmpl	$1, %ebp
	jg	.L32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L36:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.cfi_endproc
.LFE1:
	.size	qSort2, .-qSort2
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
