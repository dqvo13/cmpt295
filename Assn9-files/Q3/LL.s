	.file	"LL.c"
	.text
	.p2align 4
	.globl	newLL
	.type	newLL, @function
newLL:
.LFB39:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$24, %edi
	call	malloc@PLT
	testq	%rax, %rax
	je	.L1
	movl	$0, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
.L1:
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	newLL, .-newLL
	.p2align 4
	.globl	freeLL
	.type	freeLL, @function
freeLL:
.LFB40:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L8
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	8(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L10
	.p2align 4,,10
	.p2align 3
.L11:
	movq	%rbx, %rdi
	movq	8(%rbx), %rbx
	call	free@PLT
	testq	%rbx, %rbx
	jne	.L11
.L10:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdi
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L8:
	ret
	.cfi_endproc
.LFE40:
	.size	freeLL, .-freeLL
	.p2align 4
	.globl	appendLL
	.type	appendLL, @function
appendLL:
.LFB41:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L29
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movl	$16, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	malloc@PLT
	testq	%rax, %rax
	je	.L19
	addl	$1, (%rbx)
	cmpq	$0, 8(%rbx)
	movl	%ebp, (%rax)
	movq	16(%rbx), %rdx
	movq	$0, 8(%rax)
	je	.L32
.L23:
	movq	%rax, 8(%rdx)
.L24:
	movq	%rax, 16(%rbx)
.L19:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L32:
	.cfi_restore_state
	testq	%rdx, %rdx
	jne	.L23
	movq	%rax, 8(%rbx)
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L29:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE41:
	.size	appendLL, .-appendLL
	.p2align 4
	.globl	LLsearch
	.type	LLsearch, @function
LLsearch:
.LFB42:
	.cfi_startproc
	endbr64
	movq	8(%rdi), %rax
	xorl	%r8d, %r8d
	testq	%rax, %rax
	jne	.L34
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L36:
	movq	8(%rax), %rax
	addl	$1, %r8d
	testq	%rax, %rax
	je	.L38
.L34:
	cmpl	%esi, (%rax)
	jne	.L36
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L38:
	movl	$-1, %r8d
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE42:
	.size	LLsearch, .-LLsearch
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	" %d"
	.text
	.p2align 4
	.globl	LLdump
	.type	LLdump, @function
LLdump:
.LFB43:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L50
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	8(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L42
	leaq	.LC0(%rip), %rbp
	.p2align 4,,10
	.p2align 3
.L43:
	movl	(%rbx), %edx
	movq	%rbp, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.L43
.L42:
	movq	stdout(%rip), %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movl	$10, %edi
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	jmp	putc@PLT
	.p2align 4,,10
	.p2align 3
.L50:
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	jmp	putc@PLT
	.cfi_endproc
.LFE43:
	.size	LLdump, .-LLdump
	.p2align 4
	.globl	lsearch
	.type	lsearch, @function
lsearch:
.LFB44:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L54
	subl	$1, %esi
	xorl	%eax, %eax
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L56:
	leaq	1(%rax), %rcx
	movl 	-8(%rdi), %r9d
	cmpq	%rsi, %rax
	je	.L54
	movq	%rcx, %rax
.L53:
	movl	%eax, %r8d
	cmpl	%edx, (%rdi,%rax,4)
	jne	.L56
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L54:
	movl	$-1, %r8d
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE44:
	.size	lsearch, .-lsearch
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
