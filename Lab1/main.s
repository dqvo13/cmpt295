	.file	"main.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"times(%d, %d) produces %d as a result.\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Must supply 2 integers."
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	cmpl	$3, %edi
	jne	.L2
	movq	%rsi, %rbx
	movq	8(%rsi), %rdi
	call	atoi@PLT
	movl	%eax, %ebp
	movq	16(%rbx), %rdi
	call	atoi@PLT
	movl	%eax, %ebx
	movl	%eax, %esi
	movl	%ebp, %edi
	call	times@PLT
	movl	%eax, %ecx
	movl	%ebx, %edx
	movl	%ebp, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
.L1:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L2:
	.cfi_restore_state
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L1
	.cfi_endproc
.LFE6:
	.size	main, .-main
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
