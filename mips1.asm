.data

A: .word 1, 2, 3, 4, 5, 6, 7, 8, 9 		
g: .word 5 
i: .word 2

.text
#A[i + g] = g + A[i] - A[0]

lw $s0, i
lw $s1, g
la $s2, A

sll $t1, $s0, 2
add $t1, $t1, $s2
lw $t0, ($t1)		#A[i]
lw $t2, 0($s2)		#A[0]
add $t0, $s1, $t0	#g + A[i]
sub $t0, $t0, $t2	#g + A[i] - A[0]
sll $t2, $s1, 2
add $t2, $t1, $t2
sw $t0, ($t2)


 