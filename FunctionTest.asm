.data
	message : .asciiz "Hi, everybody.\nMy Name is JiHwan\n"
.text
	main:
		jal displayMessage
		
		addi $s0, $zero, 5
		
		#print 5 on screen
		li $v0, 1
		add $a0, $zero, $s0
		syscall
		
		#Tell the system that the program is done.
		li $v0, 10
		syscall
		
	#function
	displayMessage:
		li $v0, 4
		la $a0, message
		syscall
		
		jr $ra