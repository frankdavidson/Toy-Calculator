li $t0, 43			#load ASCII value of + sign
beq $t0, $a2, add		#branch to add function
nop

li $t0, 45			#load ASCII value of - sign
beq $t0, $a2, subtract	#branch to subtraction function
nop

li $t0, 42			#load ASCII value of * sign
beq $t0, $a2, multiply	#branch to multiplication function
nop

li $t0, 47			#load ASCII value of / sign
beq $t0, $a2, divide		#branch to division function
nop

#Math Operations

add:
	addu $v0, $a0, $a1	#$a0 + $a1, store result in $v0
	j err_overflow	#overflow
	nop

subtract:
	subu $v0, $a0, $a1	#$a0 - $a1, store result in $v0
	j eerr_underflow #underflow
	nop

multiply:
	mullo $v0, $a0, $a1	#$a0 * $a1, store result in $v0
	j err_overflow #overflow
	nop

divide:
	call div		#$a0 / $a1, store result in $v0
	nop
	j err_division_by_zero #divide by zero error
	nop
 	j err_overflow #overflow
	nop
	j err_underflow #underflow
	nop