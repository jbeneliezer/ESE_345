#set up registers for mapping to arrays
# A at 0x1001_0000 ($s0)
lui $s0, 0x1001
ori $s0, $s0, 0x0000
# B at 0x1001_0040 ($s1)
lui $s1, 0x1001
ori $s1, $s1, 0x0040
# C at 0x1001_0080 ($s2)
lui $s2, 0x1001
ori $s2, $s2, 0x0080

addi $t0, $zero, 3
addi $t1, $zero, 7
addi $t2, $zero, 10
addi $t3, $zero, 15

# A = [3, 7, 10, 15]
sw $t0, 0($s0)
sw $t1, 4($s0)
sw $t2, 8($s0)
sw $t3, 12($s0)

# B = [7, 3, 15, 10]
sw $t1, 0($s1)
sw $t0, 4($s1)
sw $t3, 8($s1)
sw $t2, 12($s1)

# setup for problem 1
# addi $a0, $s0, 0
# addi $a1, $s1, 0

# problem2
problem2:
lw $t0, 0($s0)
lw $t1, 0($s1)
and $t2, $t0, $t1
beq $t2, $zero, finish	# finish if A[i] and B[i] equal zero
addi $a0, $t0, 0
addi $a1, $t1, 0
jal lcm_func
sw $v0, 0($s2)
addi $s0, $s0, 4
addi $s1, $s1, 4
addi $s2, $s2, 4
j problem2

lcm_func:

addi $sp, $sp, -8
sw $s0, 4($sp)
sw $s1, 0($sp)


add $s0, $a0, $zero	# Load arguments into local variables a = $s0 and b = $s1
add $s1, $a1, $zero

slt $t0, $a0, $a1
beq $t0, $zero, gcd	# make sure a > b, if not, swap

addi $t1, $s0, 0	
addi $s0, $s1, 0
addi $s1, $t1, 0

# GCD
gcd:
beq $s0, $zero, lcm	# if (a == 0)
divu $s0, $s1
addi $s1, $s0, 0	# b = a
mfhi $s0		# a = a % b
j gcd

# LCM
lcm:
divu $a0, $s1
mflo $s0
multu $s0, $a1
mflo $v0

lw $s1, 0($sp)
lw $s0, 4($sp)
addiu $sp, $sp, 8

jr $ra

finish:

