	.file	"func.c"
	.text
	.globl	func
	.type	func, @function
func:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	movb	%al, -29(%rbp)
	movq	$0, -24(%rbp)
	movq	$1, -16(%rbp)
	jmp	.L2
.L3:
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	andq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	orq	%rax, -24(%rbp)
	movsbl	-29(%rbp), %eax
	movl	%eax, %ecx
	salq	%cl, -16(%rbp)
.L2:
	cmpq	$0, -16(%rbp)
	jne	.L3
	movq	-24(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	func, .-func
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
