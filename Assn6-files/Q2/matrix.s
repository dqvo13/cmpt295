# filename: matrix.s
# description: 
# assembly code for Assignment 6 Q2, to rotate matrix 90 deg clockwise
#		transpose: flip matrix entries about main diagonal
#		reverseColumns: reverses order of columns in matrix
# date: Nov. 4 2021
# name: Danh Vo
# 301425444
	.globl	copy
copy:
# A in rdi, C in rsi, N in edx
	xorl	%eax, %eax			# set eax to 0
# since this function is a leaf function, no need to save caller-saved registers rcx and r8
	xorl	%ecx, %ecx			# row number i is in ecx -> i = 0

# For each row
rowLoop:
	movl	$0, %r8d			# column number j in r8d -> j = 0
	cmpl	%edx, %ecx			# loop as long as i - N < 0
	jge doneWithRows

# For each cell of this row
colLoop:
	cmpl	%edx, %r8d			# loop as long as j - N < 0
	jge doneWithCells

# Compute the address of current cell that is copied from A to C
# since this function is a leaf function, no need to save caller-saved registers r10 and r11
	movl	%edx, %r10d     # r10d = N 
    imull	%ecx, %r10d		# r10d = i*N
	addl	%r8d, %r10d     # j + i*N
	imull	$1, %r10d       # r10 = L * (j + i*N) -> L is char (1Byte)
	movq	%r10, %r11		# r11 = L * (j + i*N) 
	addq	%rdi, %r10		# r10 = A + L * (j + i*N)
	addq	%rsi, %r11		# r11 = C + L * (j + i*N)

# Copy A[L * (j + i*N)] to C[L * (j + i*N)]
	movb	(%r10), %r9b       # temp = A[L * (j + i*N)]
	movb	%r9b, (%r11)       # C[L * (j + i*N)] = temp

	incl	%r8d			# column number j++ (in r8d)
	jmp colLoop				# go to next cell

# Go to next row
doneWithCells:
	incl	%ecx			# row number i++ (in ecx)
	jmp rowLoop				# Play it again, Sam!

doneWithRows:				# bye! bye!
	ret

#########################################################################################
	.globl	transpose
transpose:		
# transposes NxN matrix C -> %rsi, N -> %edx
# will use caller-saved registers rcx and r8 for i and j respectively
	xorl	%ecx, %ecx		# starts with i = 0
	xorl	%r8d, %r8d		# starts with j = 0
	pushq	%r12			# want to use callee-saved r12 for temp entry
	pushq	%r13			# want to use callee-saved r13 for temp entry

nextCol:
	incl	%r8d			# j++
	cmpl	%edx, %r8d		# loop while j - N < 0
	jge		nextRow
	jmp		switchEntries	# switch entries while i and j are within bounds

nextRow:
	incl	%ecx			# i++
	cmpl	%edx, %ecx		# loop while i - N < 0
	jge		done
	movl	%ecx, %r8d		# j = i, so we are on main diagonal, C[i][i]
	jmp		nextCol			# next col, move off main diagonal, i != j

switchEntries:
	# compute address of C[i][j] and C[j][i] where i != j
	# r10 and r11 are caller saved, up for free use
	movl	%edx, %r10d			# r10d = N 
	movl	%edx, %r11d			# r11d = N 
    imull	%ecx, %r10d			# r10d = i*N
    imull	%r8d, %r11d			# r11d = j*N
	addl	%r8d, %r10d			# r10d = j + i*N
	addl	%ecx, %r11d			# r11d = i + j*N
	imull	$1, %r10d			# r10 = L * (j + i*N) -> L is char (1 Byte)
	imull	$1, %r11d			# r11 = L * (i + j*N) -> L is char (1 Byte)
	addq	%rsi, %r10			# r10 = C + L * (j + i*N) = &(C[i][j])
	addq	%rsi, %r11			# r11 = C + L * (i + j*N) = &(C[j][i])
	movl	(%r10d), %r12d		# temp = C[i][j]
	# C[i][j] = C[j][i]
	movl	(%r11d), %r13d
	movl	%r13d, (%r10d)
	movl	%r12d, (%r11d)		# C[j][i] = temp
	jmp		nextCol

done:
	popq	%r13
	popq	%r12			# restore r12
	ret


#########################################################################################
	.globl	reverseColumns
reverseColumns:		# reverses order of columns in NxN matrix C -> %rsi, N -> %edx
	# will use caller-saved registers rcx and r8 for i and j respectively
	xorl	%ecx, %ecx		# starts with i = 0
	xorl	%r8d, %r8d		# starts with j = 0
	pushq	%r12			# want to use callee-saved r12 for temp entry
	pushq	%r13			# want to use callee-saved r13 for temp arithmetic
	pushq	%r14			# want to use callee-saved r14 for temp entry
	# computing N / 2	
	movw	%dx, %ax			# ax = dividend = N
	movb	$2, %r13b			# r13b = divisor = 2
	idiv	%r13b				# integer division, al = N / 2, ah = N % 2

# For each row
revRowLoop:
	movl	$0, %r8d			# column number j in r8d -> j = 0
	cmpl	%edx, %ecx			# loop as long as i - N < 0
	jge 	rowDone

# For each cell of this row
revColLoop:		# only want to loop thru half the columns as to not overlap
	cmpb	%al, %r8b			# loop as long as j - N/2 < 0
	# note: if N is odd, al stores the index before the middle col,
	# which is fine since the middle col does not require reversing
	jge 	colDone

revSwitchEntries:
	# compute address of C[i][j] and C[i][N-j-1]
	# r10 and r11 are caller saved, up for free use
	movl	%edx, %r10d			# r10d = N 
	movl	%edx, %r11d			# r11d = N 
    imull	%ecx, %r10d			# r10d = i*N
    imull	%ecx, %r11d			# r11d = i*N
	addl	%r8d, %r10d			# r10d = j + i*N
	addl	%edx, %r11d			# r11d = N + i*N
	subl	%r8d, %r11d			# r11d = N-j + i*N
	subl	$1, %r11d			# r11d = N-j-1 + i*N
	imull	$1, %r10d			# r10 = L * (j + i*N) -> L is char (1 Byte)
	imull	$1, %r11d			# r11 = L * (N-j-1 + i*N) -> L is char (1 Byte)
	addq	%rsi, %r10			# r10 = C + L * (j + i*N) = &(C[i][j])
	addq	%rsi, %r11			# r11 = C + L * (N-j-1 + i*N) = &(C[i][N-j-1])
	movl	(%r10d), %r12d		# temp = C[i][j]
	# C[i][j] = C[i][N-j-1]
	movl	(%r11d), %r14d
	movl	%r14d, (%r10d)
	movl	%r12d, (%r11d)		# C[i][N-j-1] = temp
	jmp	revColLoop

colDone:		# go to next row
	incl	%ecx			# row number i++ (in ecx)
	jmp 	revRowLoop				

rowDone:
	popq	%r14
	popq	%r13
	popq	%r12
	ret
