lui $s4, 0x1000
lui $s5, 0x1001

ori $t0, 0x5555
sw $t0, 0($s4)

Loop:
lw $t3, 0($s4) 			# Read next word from source
addi $s2, $s2, 1		# Increment count of words copied
sw $t3, 0($s5) 			# Write to destination
addi $s4, $s4, 4 		# Advance pointer to next source
addi $s5, $s5, 4 		# Advance pointer to next destination
bne $t3, $zero, Loop 		# goto Loop if word copied != zero