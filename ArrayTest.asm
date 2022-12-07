.data
	myArray: .space 12
.text
	addi $s0, $zero, 4
	addi $s1, $zero, 10
	addi $a2, $zero, 12
	
	#Index = $t0
	addi $t0, $zero, 0
	
	sw $s0, myArray($t0)
	addi $t0, $t0, 4
	
	sw $s1, myArray($t0)
	addi $t0, $t0, 4
	
	sw $s2, myArray($t0)
	addi $t0, $t0, 4
	
	lw $t6, myArray($zero)
	
	li $v0, 1
	addi $a0, $t6, 0
	syscall