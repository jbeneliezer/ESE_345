Loop:
add $t1, $s3, $s3 			# Temporary register $t1 = i*2
add $t1, $t1, $t1 			# Temporary register $t1 = i*4
add $t1, $t1, $s6 			# Temporary register $t1 = address of A[i]
lw $t0, 0($t1) 				# Temporary register $t0 = A[i]
add $s3, $s3, $s4 			# i = i + j
bne $t0, $s5, Loop 			# goto Loop if A[i] != k

Exit:
sub $s3, $s3, $s4