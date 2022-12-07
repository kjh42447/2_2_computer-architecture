.data
	matrixA: .space 100
	matrixx: .space 20
	matrixb: .space 20
	
	messageA: .asciiz "A(5x5) : "
	messagex: .asciiz "x(5x1) : "
	messageb: .asciiz "b(5x1) : "
	newLine: .asciiz "\n"
	space: .asciiz " "
.text
	main:
		#t0 : main index, t1 : mul indexA, t2 : mul indexx
		#s0 : b value, s1 : A value, s2 : x value, s3 : temp
		addi $t0, $zero, 0
		
		jal inputA
		jal inputx
		
		li $v0, 4
		la $a0, messageA
		syscall
		jal printA
		
		li $v0, 4
		la $a0, messagex
		syscall
		jal printx
		
		addi $t1, $zero, 0
		addi $t2, $zero, 0
		
		jal mulMatrix
		
		li $v0, 4
		la $a0, messageb
		syscall
		jal printb
		
		li $v0, 10
		syscall
	
	#Input value in matrixA
	inputA:
		bge $t0, 100, return
		
		sw $t0, matrixA($t0)
		addi $t0, $t0, 4
		
		j inputA
		
	#Input value in matrixx
	inputx:
		bge $t0, 20, return
		
		sw $t0, matrixx($t0)
		addi $t0, $t0, 4
		
		j inputx
	
	#Print matrixA
	printA:
		bge $t0, 100, return
		
		li $v0, 1
		lw $a0, matrixA($t0)
		syscall
		
		li $v0, 4
		la $a0, space
		syscall
		
		addi $t0, $t0, 4
		
		j printA
	
	#Print matrixx
	printx:
		bge $t0, 20, return
		
		li $v0, 1
		lw $a0, matrixx($t0)
		syscall
		
		li $v0, 4
		la $a0, space
		syscall
		
		addi $t0, $t0, 4
		
		j printx
	#Print mattrixb
	printb:
		bge $t0, 20, return
		
		li $v0, 1
		lw $a0, matrixb($t0)
		syscall
		
		li $v0, 4
		la $a0, space
		syscall
		
		addi $t0, $t0, 4
		
		j printb
			
	#Multiple matrixA, matrixx
	#Result save in matrixb
	mulMatrix:
		bge $t0, 20, return
		
		addi $s0, $zero, 0
		
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		
		jal subMulMatrix
		
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		addi $t0, $t0, 4
		
		j mulMatrix
	
	#Calculate bi += Aji * xi
	subMulMatrix:
		bge $t2, 20, returnMul
		
		lw $s1, matrixA($t1)
		lw $s2, matrixx($t2)
		
		mul $s3, $s1, $s2
		add $s0, $s0, $s3
		
		addi $t1, $t1, 4
		addi $t2, $t2, 4
		
		j subMulMatrix
	
	#Exit subMulMatrix
	returnMul:
		addi $t2, $zero, 0
		sw $s0, matrixb($t0)
		
		jr $ra
	
	#Exit submodule						
	return:
		addi $t0, $zero, 0
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		jr $ra