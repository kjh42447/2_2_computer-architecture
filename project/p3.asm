.data
	Stack: .space 40
	space: .asciiz " "
	newLine: .asciiz "\n"
	fullMessage: .asciiz "Stack is full"
	emptyMessage: .asciiz "Stack is empty"
.text
	main:
		#s0 : Use in push, pop, s1 : stack top, s2 : Use in print_Stack
		addi $s1, $zero, 0
		addi $s2, $zero, 0
		
		#t0~t4 : Random stack value
		addi $t0, $zero, 1
		addi $t1, $zero, 2
		addi $t2, $zero, 3
		addi $t3, $zero, 4
		addi $t4, $zero, 5
		
		add $s0, $zero, $t0				
		jal push
		
		add $s0, $zero, $t1				
		jal push
		
		add $s0, $zero, $t2				
		jal push
		
		jal pop
		
		add $s0, $zero, $t3				
		jal push
		
		add $s0, $zero, $t4				
		jal push
		
		
		li $v0, 10
		syscall
	
	#Stack push
	push:
		beq $s1, 40, is_full
		
		sw $s0, Stack($s1)
		addi $s1, $s1, 4
		
		j print_Stack
	
	#Stack pop	
	pop:
		beq $s1, 0, is_empty
		
		lw $s0, Stack($s1)
		addi $s1, $s1, -4
		
		j print_Stack
	
	#Print stack
	print_Stack:
		bge $s2, $s1, return
		
		li $v0, 1
		lw $a0, Stack($s2)
		syscall
		
		li $v0, 4
		la $a0, space
		syscall
		
		addi $s2, $s2, 4
		
		j print_Stack
	
	#Check stack is full
	is_full:
		li $v0, 4
		la $a0, fullMessage
		syscall
		
		j return
	
	#Check stack is empty
	is_empty:
		li $v0, 4
		la $a0, emptyMessage
		syscall
		
		j return
	
	#Exit function
	return:
		addi $s2, $zero, 0
	
		li $v0, 4
		la $a0, newLine
		syscall
		
		jr $ra
