	.file	"main.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Sample %d completed in %d clock cycles \342\200\223 DISCARDED.\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Error:  sum mismatch"
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"Sample %d completed in %d clock cycles.\n"
	.section	.rodata.str1.1
.LC3:
	.string	"Average of %ld clock cycles.\n"
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
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	leaq	A(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	800(%rbp), %rbx
	call	time@PLT
	movq	%rax, %rdi
	call	srand@PLT
	movl	$0, Q(%rip)
	.p2align 4,,10
	.p2align 3
.L3:
	call	rand@PLT
	cltd
	shrl	$22, %edx
	addl	%edx, %eax
	andl	$1023, %eax
	subl	%edx, %eax
	subl	$512, %eax
	movl	%eax, 0(%rbp)
	testl	%eax, %eax
	jle	.L2
	addl	%eax, Q(%rip)
.L2:
	addq	$4, %rbp
	cmpq	%rbx, %rbp
	jne	.L3
	xorl	%r14d, %r14d
	leaq	cycles(%rip), %r13
	xorl	%ebp, %ebp
	leaq	A(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L8:
#APP
# 43 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movq	%r12, %rdi
	movl	%esi, start_time(%rip)
	movl	$200, %esi
	call	sumPlus@PLT
	movl	%eax, P(%rip)
	movl	%eax, %edi
#APP
# 55 "main.c" 1
	cpuid
	rdtscp
	movl %eax, %esi
	
# 0 "" 2
#NO_APP
	movl	%esi, end_time(%rip)
	subl	start_time(%rip), %esi
	movl	%esi, 0(%r13,%rbp,4)
	cmpl	$6999, %esi
	jg	.L14
	cmpl	Q(%rip), %edi
	jne	.L15
	addl	$1, %r14d
	cmpl	$20, %r14d
	je	.L7
	movslq	%r14d, %rbp
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L14:
	movl	%esi, %ecx
	leal	1(%r14), %edx
	leaq	.LC0(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	jmp	.L8
.L7:
	movq	$0, total(%rip)
	movl	$1, %ebx
	leaq	-4+cycles(%rip), %rbp
	leaq	.LC2(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L9:
	movl	0(%rbp,%rbx,4), %ecx
	movl	%ebx, %edx
	movq	%r12, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movslq	0(%rbp,%rbx,4), %rax
	addq	$1, %rbx
	addq	total(%rip), %rax
	movq	%rax, total(%rip)
	cmpq	$21, %rbx
	jne	.L9
	movl	$20, %ecx
	cqto
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	$1, %edi
	idivq	%rcx
	popq	%rbp
	.cfi_def_cfa_offset 32
	leaq	.LC3(%rip), %rsi
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	movq	%rax, %rdx
	xorl	%eax, %eax
	jmp	__printf_chk@PLT
.L15:
	.cfi_restore_state
	popq	%rbx
	.cfi_def_cfa_offset 40
	leaq	.LC1(%rip), %rdi
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	perror@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.globl	end_time
	.data
	.align 4
	.type	end_time, @object
	.size	end_time, 4
end_time:
	.long	125
	.globl	start_time
	.align 4
	.type	start_time, @object
	.size	start_time, 4
start_time:
	.long	150
	.comm	total,8,8
	.comm	cycles,80,32
	.comm	Q,4,4
	.comm	P,4,4
	.comm	A,800,32
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
