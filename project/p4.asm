.data
	array: .space 400
	right: .word 0
	
	newLine: .asciiz "\n"
	space: .asciiz " "
	input_prompt: .asciiz "Input integer : "
	output_prompt: .asciiz "Array : "
	
.text
	main:
		#loop a main
		jal loop
		
	loop:
		#Read a user input
		addi $sp, $sp, -64  
		sw $t0, 0($sp)
		sw $t1, 4($sp)
		sw $t2, 8($sp)
		sw $t3, 12($sp)
		sw $t4, 16($sp)
		sw $t5, 20($sp)
		sw $t6, 24($sp)
		sw $t7, 28($sp)
		sw $t8, 32($sp)
		sw $t9, 36($sp)
		sw $a0, 40($sp)
		sw $a1, 44($sp)
		sw $a2, 48($sp)
		sw $a3, 52($sp)
		sw $v0, 56($sp)
		sw $v1, 60($sp)
		
		jal input
		
		lw $t0, 0($sp)
		lw $t1, 4($sp)
		lw $t2, 8($sp)
		lw $t3, 12($sp)
		lw $t4, 16($sp)
		lw $t5, 20($sp)
		lw $t6, 24($sp)
		lw $t7, 28($sp)
		lw $t8, 32($sp)
		lw $t9, 36($sp)
		lw $a0, 40($sp)
		lw $a1, 44($sp)
		lw $a2, 48($sp)
		lw $a3, 52($sp)
		lw $v0, 56($sp)
		lw $v1, 60($sp)
		addi $sp, $sp, 64
		
		#Doing a quick sort
		addi $sp, $sp, -64  
		sw $t0, 0($sp)
		sw $t1, 4($sp)
		sw $t2, 8($sp)
		sw $t3, 12($sp)
		sw $t4, 16($sp)
		sw $t5, 20($sp)
		sw $t6, 24($sp)
		sw $t7, 28($sp)
		sw $t8, 32($sp)
		sw $t9, 36($sp)
		sw $a0, 40($sp)
		sw $a1, 44($sp)
		sw $a2, 48($sp)
		sw $a3, 52($sp)
		sw $v0, 56($sp)
		sw $v1, 60($sp)
		
		addi $a0, $zero, 0
		lw $a1, right
		addi $a1, $a1, -4
		jal quickSort
		
		lw $t0, 0($sp)
		lw $t1, 4($sp)
		lw $t2, 8($sp)
		lw $t3, 12($sp)
		lw $t4, 16($sp)
		lw $t5, 20($sp)
		lw $t6, 24($sp)
		lw $t7, 28($sp)
		lw $t8, 32($sp)
		lw $t9, 36($sp)
		lw $a0, 40($sp)
		lw $a1, 44($sp)
		lw $a2, 48($sp)
		lw $a3, 52($sp)
		lw $v0, 56($sp)
		lw $v1, 60($sp)
		addi $sp, $sp, 64
		
		#Print output
		addi $sp, $sp, -64  
		sw $t0, 0($sp)
		sw $t1, 4($sp)
		sw $t2, 8($sp)
		sw $t3, 12($sp)
		sw $t4, 16($sp)
		sw $t5, 20($sp)
		sw $t6, 24($sp)
		sw $t7, 28($sp)
		sw $t8, 32($sp)
		sw $t9, 36($sp)
		sw $a0, 40($sp)
		sw $a1, 44($sp)
		sw $a2, 48($sp)
		sw $a3, 52($sp)
		sw $v0, 56($sp)
		sw $v1, 60($sp)
		
		jal output
		
		lw $t0, 0($sp)
		lw $t1, 4($sp)
		lw $t2, 8($sp)
		lw $t3, 12($sp)
		lw $t4, 16($sp)
		lw $t5, 20($sp)
		lw $t6, 24($sp)
		lw $t7, 28($sp)
		lw $t8, 32($sp)
		lw $t9, 36($sp)
		lw $a0, 40($sp)
		lw $a1, 44($sp)
		lw $a2, 48($sp)
		lw $a3, 52($sp)
		lw $v0, 56($sp)
		lw $v1, 60($sp)
		addi $sp, $sp, 64
		
		j loop
		
	#Read a int from user
	input:
		addi $sp, $sp, -40
		sw $s0, 0($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		sw $s3, 12($sp)
		sw $s4, 16($sp)
		sw $s5, 20($sp)
		sw $s6, 24($sp)
		sw $s7, 28($sp)
		sw $ra, 32($sp)
		sw $fp, 36($sp)
		
		li $v0, 4
		la $a0, input_prompt
		syscall
		
		li $v0, 5
		syscall
		
		lw $s0, right
		sw $v0, array($s0)
		addi $s0, $s0, 4
		sw $s0, right
		
		lw $s0, 0($sp)
		lw $s1, 4($sp)
		lw $s2, 8($sp)
		lw $s3, 12($sp)
		lw $s4, 16($sp)
		lw $s5, 20($sp)
		lw $s6, 24($sp)
		lw $s7, 28($sp)
		lw $ra, 32($sp)
		lw $fp, 36($sp)
		addi $sp, $sp, 40
		
		jr $ra
		
	#Print in prompt
	output:
		addi $sp, $sp, -40
		sw $s0, 0($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		sw $s3, 12($sp)
		sw $s4, 16($sp)
		sw $s5, 20($sp)
		sw $s6, 24($sp)
		sw $s7, 28($sp)
		sw $ra, 32($sp)
		sw $fp, 36($sp)
		
		li $v0, 4
		la $a0, output_prompt
		syscall
		
		addi $t0, $zero, 0
		
		#Print array	
		printArray:
			lw $s0, right
			bge $t0, $s0, continueOutput
			
			li $v0, 1
			lw $a0, array($t0)
			syscall
			
			li $v0, 4
			la $a0, space
			syscall
			
			addi $t0, $t0, 4
			
			j printArray
		
		#Exit printArray and continue output
		continueOutput:
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		lw $s0, 0($sp)
		lw $s1, 4($sp)
		lw $s2, 8($sp)
		lw $s3, 12($sp)
		lw $s4, 16($sp)
		lw $s5, 20($sp)
		lw $s6, 24($sp)
		lw $s7, 28($sp)
		lw $ra, 32($sp)
		lw $fp, 36($sp)
		addi $sp, $sp, 40
		
		jr $ra
	
	#Quick Sort funtion
	#a0 : left, a1 : right, a2 : pivot
	quickSort:
		addi $sp, $sp, -40
		sw $s0, 0($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		sw $s3, 12($sp)
		sw $s4, 16($sp)
		sw $s5, 20($sp)
		sw $s6, 24($sp)
		sw $s7, 28($sp)
		sw $ra, 32($sp)
		sw $fp, 36($sp)
		
		addi $sp, $sp, -64  
		sw $t0, 0($sp)
		sw $t1, 4($sp)
		sw $t2, 8($sp)
		sw $t3, 12($sp)
		sw $t4, 16($sp)
		sw $t5, 20($sp)
		sw $t6, 24($sp)
		sw $t7, 28($sp)
		sw $t8, 32($sp)
		sw $t9, 36($sp)
		sw $a0, 40($sp)
		sw $a1, 44($sp)
		sw $a2, 48($sp)
		sw $a3, 52($sp)
		sw $v0, 56($sp)
		sw $v1, 60($sp)
		
		addi $s0, $a0, 0
		addi $s1, $a1, 0
		
		bgt $a0, $a1, exitQuickSort
		jal partition
		
		#Left subroutine
		addi $sp, $sp, -64  
		sw $t0, 0($sp)
		sw $t1, 4($sp)
		sw $t2, 8($sp)
		sw $t3, 12($sp)
		sw $t4, 16($sp)
		sw $t5, 20($sp)
		sw $t6, 24($sp)
		sw $t7, 28($sp)
		sw $t8, 32($sp)
		sw $t9, 36($sp)
		sw $a0, 40($sp)
		sw $a1, 44($sp)
		sw $a2, 48($sp)
		sw $a3, 52($sp)
		sw $v0, 56($sp)
		sw $v1, 60($sp)
		
		addi $a0, $s0, 0
		addi $a1, $a0, -4 
		jal quickSort
		
		lw $t0, 0($sp)
		lw $t1, 4($sp)
		lw $t2, 8($sp)
		lw $t3, 12($sp)
		lw $t4, 16($sp)
		lw $t5, 20($sp)
		lw $t6, 24($sp)
		lw $t7, 28($sp)
		lw $t8, 32($sp)
		lw $t9, 36($sp)
		lw $a0, 40($sp)
		lw $a1, 44($sp)
		lw $a2, 48($sp)
		lw $a3, 52($sp)
		lw $v0, 56($sp)
		lw $v1, 60($sp)
		addi $sp, $sp, 64
		
		#Right subroutine
		addi $sp, $sp, -64  
		sw $t0, 0($sp)
		sw $t1, 4($sp)
		sw $t2, 8($sp)
		sw $t3, 12($sp)
		sw $t4, 16($sp)
		sw $t5, 20($sp)
		sw $t6, 24($sp)
		sw $t7, 28($sp)
		sw $t8, 32($sp)
		sw $t9, 36($sp)
		sw $a0, 40($sp)
		sw $a1, 44($sp)
		sw $a2, 48($sp)
		sw $a3, 52($sp)
		sw $v0, 56($sp)
		sw $v1, 60($sp)
		
		addi $a0, $a0, 4
		addi $a1, $s1, 0
		jal quickSort
		
		lw $t0, 0($sp)
		lw $t1, 4($sp)
		lw $t2, 8($sp)
		lw $t3, 12($sp)
		lw $t4, 16($sp)
		lw $t5, 20($sp)
		lw $t6, 24($sp)
		lw $t7, 28($sp)
		lw $t8, 32($sp)
		lw $t9, 36($sp)
		lw $a0, 40($sp)
		lw $a1, 44($sp)
		lw $a2, 48($sp)
		lw $a3, 52($sp)
		lw $v0, 56($sp)
		lw $v1, 60($sp)
		addi $sp, $sp, 64
		
	#Exit quick sort
	exitQuickSort:
		lw $t0, 0($sp)
		lw $t1, 4($sp)
		lw $t2, 8($sp)
		lw $t3, 12($sp)
		lw $t4, 16($sp)
		lw $t5, 20($sp)
		lw $t6, 24($sp)
		lw $t7, 28($sp)
		lw $t8, 32($sp)
		lw $t9, 36($sp)
		lw $a0, 40($sp)
		lw $a1, 44($sp)
		lw $a2, 48($sp)
		lw $a3, 52($sp)
		lw $v0, 56($sp)
		lw $v1, 60($sp)
		addi $sp, $sp, 64
		
		lw $s0, 0($sp)
		lw $s1, 4($sp)
		lw $s2, 8($sp)
		lw $s3, 12($sp)
		lw $s4, 16($sp)
		lw $s5, 20($sp)
		lw $s6, 24($sp)
		lw $s7, 28($sp)
		lw $ra, 32($sp)
		lw $fp, 36($sp)
		addi $sp, $sp, 40
		
		jr $ra
	
	#Partition a array
	#t0 : left vlaue, t1 : right value, t2 : pivot value
	partition:
		addi $sp, $sp, -40
		sw $s0, 0($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		sw $s3, 12($sp)
		sw $s4, 16($sp)
		sw $s5, 20($sp)
		sw $s6, 24($sp)
		sw $s7, 28($sp)
		sw $ra, 32($sp)
		sw $fp, 36($sp)
		
		lw $t2, array($a1)
		addi $a2, $a1, 0
		addi $a0, $a0, 0
		addi $a1, $a1, -4
		
		#Check a left index value
		partitionLeftLoop:
			bge $a0, $a1, exitPartition
			
			lw $t0, array($a0)
			bgt $t2, $t0, partitionRightLoop
			
			addi $a0, $a0, 4
			
			j partitionLeftLoop
		
		#Check a right index value
		partitionRightLoop:
			bge $a0, $a1, exitPartition
			
			lw $t1, array($a1)
			bge $t2, $t1, continueLoop
			
			#Swap laft value and right value
			addi $sp, $sp, -64  
			sw $t0, 0($sp)
			sw $t1, 4($sp)
			sw $t2, 8($sp)
			sw $t3, 12($sp)
			sw $t4, 16($sp)
			sw $t5, 20($sp)
			sw $t6, 24($sp)
			sw $t7, 28($sp)
			sw $t8, 32($sp)
			sw $t9, 36($sp)
			sw $a0, 40($sp)
			sw $a1, 44($sp)
			sw $a2, 48($sp)
			sw $a3, 52($sp)
			sw $v0, 56($sp)
			sw $v1, 60($sp)
				
			jal swap
			
			lw $t0, 0($sp)
			lw $t1, 4($sp)
			lw $t2, 8($sp)
			lw $t3, 12($sp)
			lw $t4, 16($sp)
			lw $t5, 20($sp)
			lw $t6, 24($sp)
			lw $t7, 28($sp)
			lw $t8, 32($sp)
			lw $t9, 36($sp)
			lw $a0, 40($sp)
			lw $a1, 44($sp)
			lw $a2, 48($sp)
			lw $a3, 52($sp)
			lw $v0, 56($sp)
			lw $v1, 60($sp)
			addi $sp, $sp, 64
			
			j partitionLeftLoop
			
			#Continue this loop
			continueLoop:
		
			addi $a1, $a1, -4
			
			j partitionRightLoop
	
	#Exit Partition
	exitPartition:
		#Swap left value and pivot
		addi $sp, $sp, -64  
		sw $t0, 0($sp)
		sw $t1, 4($sp)
		sw $t2, 8($sp)
		sw $t3, 12($sp)
		sw $t4, 16($sp)
		sw $t5, 20($sp)
		sw $t6, 24($sp)
		sw $t7, 28($sp)
		sw $t8, 32($sp)
		sw $t9, 36($sp)
		sw $a0, 40($sp)
		sw $a1, 44($sp)
		sw $a2, 48($sp)
		sw $a3, 52($sp)
		sw $v0, 56($sp)
		sw $v1, 60($sp)
		
		addi $a1, $a2, 0
		jal swap
		
		lw $t0, 0($sp)
		lw $t1, 4($sp)
		lw $t2, 8($sp)
		lw $t3, 12($sp)
		lw $t4, 16($sp)
		lw $t5, 20($sp)
		lw $t6, 24($sp)
		lw $t7, 28($sp)
		lw $t8, 32($sp)
		lw $t9, 36($sp)
		lw $a0, 40($sp)
		lw $a1, 44($sp)
		lw $a2, 48($sp)
		lw $a3, 52($sp)
		lw $v0, 56($sp)
		lw $v1, 60($sp)
		addi $sp, $sp, 64
			
		lw $s0, 0($sp)
		lw $s1, 4($sp)
		lw $s2, 8($sp)
		lw $s3, 12($sp)
		lw $s4, 16($sp)
		lw $s5, 20($sp)
		lw $s6, 24($sp)
		lw $s7, 28($sp)
		lw $ra, 32($sp)
		lw $fp, 36($sp)
		addi $sp, $sp, 40
		
		jr $ra
		
	#swap array($a0), array($a1)
	swap:
		addi $sp, $sp, -40
		sw $s0, 0($sp)
		sw $s1, 4($sp)
		sw $s2, 8($sp)
		sw $s3, 12($sp)
		sw $s4, 16($sp)
		sw $s5, 20($sp)
		sw $s6, 24($sp)
		sw $s7, 28($sp)
		sw $ra, 32($sp)
		sw $fp, 36($sp)
		
		lw $t0, array($a0)
		lw $t1, array($a1)
		sw $t1, array($a0)
		sw $t0, array($a1)
		
		lw $s0, 0($sp)
		lw $s1, 4($sp)
		lw $s2, 8($sp)
		lw $s3, 12($sp)
		lw $s4, 16($sp)
		lw $s5, 20($sp)
		lw $s6, 24($sp)
		lw $s7, 28($sp)
		lw $ra, 32($sp)
		lw $fp, 36($sp)
		addi $sp, $sp, 40
		
		jr $ra

