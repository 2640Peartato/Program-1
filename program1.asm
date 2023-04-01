#Names: Catalina Davis, Kenneth Hung, Ayanna Sanges-Chu
#Date: 3/26/23
#Objectives:
#-getting the user input and printing them back to the user
#-complete arithmetic operations on the user input
#-compare the two input if they are the same or different

.data
getUserNum1: .asciiz "\nPlease enter an integer: "
getUserNum2: .asciiz "\nPlease enter another integer: "
showUserNum1: .asciiz "\nHere is your first input: "
showUserNum2: .asciiz "\nHere is your second input: "
showSum: .asciiz "\nThe sum is: "
difference: .asciiz "\nThe difference is: "
showMult: .asciiz "\nThe product is: "
showDiv: .asciiz "\nThe quotient is: "
inputEqual: .asciiz "\nUser inputs are the same."
inputDif: .asciiz "\nUser inputs are different."
quotient: .float 0.0	#result of division

.text
main:

#Task 1: User Input and Output
	#print out getNum1
	li $v0, 4
	la $a0, getUserNum1
	syscall
	
	#get the user input
	li $v0, 5
	syscall
	move $s0, $v0  #user val 1
	
	#print our getNum2
	li $v0, 4
	la $a0, getUserNum2
	syscall
	
	#get the user input
	li $v0, 5
	syscall
	move $s1, $v0   #user cal 2
	
	#print out the first user input
	li $v0, 4
	la $a0, showUserNum1
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	
	#print out the second user input
	li $v0, 4
	la $a0, showUserNum2
	syscall
	li $v0, 1
	move $a0, $s1
	syscall
	
# Task 2: Arithmetic Operations:
	
	#instruction to add the two inputs
	add $s2, $s0, $s1
	
	#display message to show sum
	li $v0, 4
	la $a0, showSum
	syscall
	
	#display the sum to user
	li $v0, 1
	move $a0, $s2
	syscall
	
	
	#instruction to sub the two inputs
	sub $s3, $s0, $s1
	
	#display message to show difference
	li $v0, 4
	la $a0, difference
	syscall
	
	#display the difference to user
	li $v0, 1
	move $a0, $s3
	syscall
	
	
	#instruction to multiply the two inputs
	mul $s4, $s0, $s1
	
	#display message to show product
	li $v0, 4
	la $a0, showMult
	syscall
	
	#display the product to user
	li $v0, 1
	move $a0, $s4
	syscall
	
	#instruction to divide the two inputs
	mtc1 $s0, $f0
	mtc1 $s1, $f1
	div.s $f2, $f0, $f1
	
	#display message to show quotient
	li $v0, 4
	la $a0, showDiv
	syscall
		
	#display the quotient to user
	lw $t2, quotient
	mov.s $f12, $f2
	li $v0, 2
	syscall
	
# Task 3: Conditions
	
	#compare if two inputs are equal
	beq $s0, $s1, showEqual
	
	# !($s0=$s1)
	li $v0, 4
	la $a0, inputDif
	syscall
	
	j exit
	
showEqual: #$s0=$s1
	li $v0, 4
	la $a0, inputEqual
	syscall
	
exit:
	li $v0, 10
	syscall
