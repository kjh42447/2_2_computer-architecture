.data
	message: .asciiz "The numbers are equal."
	message2: .asciiz "The numbers are different."
.text
	main:
		addi $t0, $zero, 5
		addi $t1, $zero, 20
		
		beq $t0, $t1, numbersEqual
		bne $t0, $t1, numberDifferent
		
		#Syscall to end program
		li $v0, 10
		syscall
		
	numbersEqual: 
		li $v0, 4
		la $a0, message
		syscall
		
	numberDifferent:
		li $v0, 4
		la $a0, message2
		syscall