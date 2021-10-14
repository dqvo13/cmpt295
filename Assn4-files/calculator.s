# add a header comment block
# filename: calculator.s 
# purpose: Assignment 4 Question 3
# Danh Vo
# 301425444
# Oct. 13 2021

	.globl	lessThan
	.globl	plus
	.globl	minus
	.globl	mul

# x in %edi, y in %esi

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
# You can assume that both operands are non-negative.
# Requirements:
# - you cannot use imul* instruction 
#   (or any kind of instruction that multiplies such as mul)
# - you must use a loop
	# x -> %edi, y -> %esi, return %eax
	xorl	%eax, %eax		# zeroes register %eax (result)
	xorl	%ecx, %ecx		# zeroes register %ecx (counter)
	cmpl	%esi, %ecx		# compares counter - y, we loop if < 0
	jge		endloop			# if counter >= y, we are done adding
loop:	# loops while counter < y
	addl	%edi, %eax		# adding x to result
	incl	%ecx			# increment counter by 1
	cmpl	%esi, %ecx		# compares counter - y
	jl		loop			# we loop if < 0, otherwise fall thru
endloop:
	ret


# algorithm:
# implement a for-loop:
# make new counter variable = 0, e.g. %ecx
#	add x to result as long as the counter is less than y
#	increment counter
#	if the counter is still less than y, return to loop
# result is we added x to itself y amount of times
# return x
