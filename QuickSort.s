main:
	addi $v0, $zero, 5
	syscall
	add $s0, $zero, $v0
	
	la $t0, count
	sw $s0, 0($t0)
	
	la $t0, array
	li $t1, 0

L1:	
	beq $t1, $s0, Else	# ī��Ʈ���� t1�� 0�� ���Ѵ�.
	li $v0, 5
	syscall
	sw $v0, 0($t0)
	addi $t0, $t0, 4	# �迭�� ũ�� ��ŭ ���Ѵ�.
	addi $t1, $t1, 1	# �ݺ��� Ƚ��
	j L1

Else:
	addi $s0, $s0, -1  		# last�ε����� ���� ī��Ʈ���� 1�� ���ش�.

	li $a0, 0			# left
	add $a1, $zero, $s0 		# right
	
	addi $sp, $sp, -4
	sw $ra, 0($sp) 
	jal QuickSort 	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	


	la $t1, count
	lw $t1, 0($t1)
	li $t0, 0
	la $t2, array
	
L2:
	beq $t1, $t0, ProgramExit	# ī��Ʈ���� t1�� 0�� ���Ѵ�.
	li $v0, 1
	
	lw $t3, 0($t2)
	add $a0, $zero, $t3
	syscall

	li $v0, 4
	la $t4, str
	add $a0, $zero, $t4
	syscall
	
	addi $t2, $t2, 4	# �迭�� ũ�� ��ŭ ���Ѵ�.
	addi $t0, $t0, 1	# �ݺ��� Ƚ��
	j L2
	
ProgramExit:
	jr $31


QuickSort:
	
	addi $sp, $sp, -16
	sw $ra, 12($sp)
	sw $a2, 8($sp)
	sw $a1, 4($sp)
	sw $a0, 0($sp)

	slt $t5, $a0, $a1	#if(left<right)
	beq $t5, $zero, QuickSortElse1 


	jal Partition		

	add $a2, $v0, $zero
	addi $sp, $sp, -16
	sw $ra, 12($sp)
	sw $a2, 8($sp)
	sw $a1, 4($sp)
	sw $a0, 0($sp)
	addi $a1, $a2, -1
	jal QuickSort			
	lw $a0, 0($sp)
	lw $a1, 4($sp)
	lw $a2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	
	addi $sp, $sp, -16
	sw $ra, 12($sp)
	sw $a2, 8($sp)
	sw $a1, 4($sp)
	sw $a0, 0($sp)
	addi $a0, $a2, 1
	jal QuickSort	
	lw $a0, 0($sp)
	lw $a1, 4($sp)
	lw $a2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16	
	
	
QuickSortElse1:			#left>=right�� �Ǹ�
	
	lw $a0, 0($sp)
	lw $a1, 4($sp)
	lw $a2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16


	jr $ra
	



Partition:

	la $s0, array	# array ����

	sll $t5, $a0, 2  	# int pivot = arr[left]; $t5�� �ε����� ���ϱ��
	add $t6, $t5, $s0	# �迭�� left��ŭ ����  $t6�� �迭 ����
	lw $t0, 0($t6)		# $t0�� �ǹ�
	
	addi $t1, $a0, 1	# $t1�� int low = left+1;  $t1�� low
	addi $t2, $a1, 0	# $t2�� int high = right;  $t2�� high
	
	
PartitionLoop:
	
	addi $t3, $t2, 1	# $t3�� high+1 ǥ��
	slt $t4, $t1, $t3	# low < high+1 // $t4�� slt�Ǵ� ������ ����Ѵ�.
	beq $t4, $zero, PartitionExit	# while(low <= high)    // �������� ���� ������ �ݺ�

PartitionLoop1:

	la $s0, array
	sll $t5, $t1, 2		# arr[low]
	add $t6, $t5, $s0
	lw $t7, 0($t6)		# $t7�� �ε����� �̿��� �迭 �ϳ��� ��
	
	addi $t8, $t0, 1	# pivot >= arr[low] $t8�� �ӽ� �ǹ�
	slt $t4, $t7, $t8	# // while(pivot >= arr[low] && low <= right)  pivot >= arr[low]
	beq $t4, $zero, PartitionElse1

	addi $t8, $a1, 1 	# // while(pivot >= arr[low] && low <= right)  low <= right
	slt $t4, $t1, $t8	# $t8�� '<=' ó�������� ��� 
	beq $t4, $zero, PartitionElse1 
	addi $t1, $t1, 1		# low++;
	j PartitionLoop1

PartitionElse1:

PartitionLoop2:
	la $s0, array
	sll $t5, $t2, 2		# arr[high]
	add $t6, $t5, $s0
	lw $t7, 0($t6)
				# while(pivot <= arr[high] && high >= (left+1))
	addi $t8, $t7, 1	# pivot <= arr[high] 
	slt $t4, $t0, $t8
	beq $t4, $zero, PartitionElse2
				#   high >= (left+1))
	addi $t8, $t2, 1	# high >=
	addi $t9, $a0, 1	# (left+1) Ư���� ���, ���� �Ͱ� �����ϱ� ����..
	slt $t4, $t9, $t8 
	beq $t4, $zero, PartitionElse2 
	addi $t2, $t2, -1	
	j PartitionLoop2

PartitionElse2:
		

	addi $t8, $t2, 1	# if(low <= high)    // �������� ���� ���¶�� Swap ����
	slt $t4, $t1, $t8
	beq $t4, $zero, PartitionElse3

	
	add $s5, $t1, $zero
	add $s6, $t2, $zero

	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal Swap	
	lw $ra, 0($sp)
	addi $sp, $sp, 4

PartitionElse3:
	j PartitionLoop

PartitionExit:
	
	
	add $s5, $a0, $zero
	add $s6, $t2, $zero

	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal Swap	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	add $v0, $zero, $t2
	
	jr $ra

	
	
Swap:

	
	sll $t5, $s5, 2
	sll $t6, $s6, 2

	la $s0, array

	add $t5, $t5, $s0
	add $t6, $t6, $s0

	lw $s2, 0($t5)
	lw $s3, 0($t6)

	sw $s3, 0($t5)
	sw $s2, 0($t6)


	jr $ra		



.data
count: .word 1
array: .space 100
str:  .asciiz "  "
