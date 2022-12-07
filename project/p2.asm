.data
	space: .asciiz " "
	newLine : .asciiz "\n"

.text
	main:
		addi $t0, $zero, 2
		addi $t1, $zero, 1
		
		jal while1
		
		li $v0, 10
		syscall
		
	while1:
		bgt $t0, 9, return
		
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		
		jal while2
		
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		addi $t0, $t0, 1
		addi $t1, $zero, 1
			
		li $v0, 4
		la $a0, newLine
		syscall
			
		j while1
	
	while2:
		bgt $t1, 9, return
		mul $t2, $t0, $t1
		addi $t1, $t1, 1
	
		li $v0, 1
		add $a0, $zero, $t2
		syscall
		
		li $v0, 4
		la $a0, space
		syscall
			
		j while2
	
	return:
		jr $ra

