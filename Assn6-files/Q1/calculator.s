# filename: calculator.s 
# purpose: Assignment 6 Question 1
# Danh Vo
# 301425444
# Nov. 4 2021

	.globl	lessThan
	.globl	plus
	.globl	minus
	.globl	mul

lessThan: # checks whether x is less than y, returns 1 if true, 0 otherwise
	# x -> %edi, y -> %esi, return %eax
	xorl	%eax, %eax		# zeroes %eax
	cmpl	%esi, %edi		# compares x - y
	# See Section 3.6.2 of our textbook for a description of the set* instructions
	setl	%al				# executes if x - y < 0, x < y, sets %al to 1
							# will return true/false (0/1) for x < y, since %al is part of %eax
	ret

plus:  # performs integer addition
# Requirement:
# - you cannot use add* instruction
	# x -> %edi, y -> %esi, return %eax
	xorl	%eax, %eax		# zeroes register %eax
	movl	%esi, %ecx		# saves original y for later use
	negl	%esi			# negates bits of %esi, 2s complement, %esi now holds -y
	subl	%esi, %edi		# x - (-y) = x + y, difference stored in %edi
	movl	%edi, %eax		# moves difference to result register
	ret



minus: # performs integer subtraction
# Requirement:
# - you cannot use sub* instruction
	# x -> %edi, y -> %esi, return %eax
	xorl	%eax, %eax		# zeroes register %eax
	movl	%esi, %ecx		# saves original y for later use
	negl	%esi			# negates bits of %esi, 2s complement, %esi now holds -y
	addl	%esi, %edi		# x + (-y) = x - y, sum stored in %edi
	movl	%edi, %eax		# moves sum to result register
	ret

mul: # performs integer multiplication - when both operands are non-negative!
# x in edi, y in esi
# You can assume that both parameters are non-negative.
# Requirements:
# - cannot use imul* instruction
# (or any kind of instruction that multiplies such as mul)
# - you must use recursion (no loop) and the stack

	xorl	%eax, %eax		# zeroes register %eax
	testl	%esi, %esi		# false condition, if y (as counter) == 0
	je		done
	pushq	%r10			# going to use for multiples of x, caller saved
	movq	%rdi, %r10		# %r10 == x
	decl	%esi			# y is used as counter, y--
	call	mul				# recursive call with y (=counter) - 1
	addl	%r10d, %eax		# result += x
	popq	%r10

done:
	ret