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
addi $a0, $s0, 0
addi $a1, $s1, 0

# Problem 1
jal problem1
j finish

problem1:
addi $sp, $sp, -8
sw $ra, 0($sp)
jal gcd


# GCD
gcd:
addi $sp, $sp, -8
sw $s0, 4($sp)
sw $s1, 0($sp)

add $s0, $a0, $zero
add $s1, $a1, $zero

beq $s1, $zero, lcd
add $t0, $s1, $zero
divu $s0, $s1
mfhi $s1
add $s0, $t0, $zero

add $a0, $s0, $zero
add $a1, $s1, $zero

lw $s1, 0($sp)
lw $s0, 4($sp)
addiu $sp, $sp, 8

j gcd

# LCD
lcd:
multu $a0, $s0
mflo $s1
divu $s0, $s1
mflo $v0

lw $s1, 0($sp)
lw $s0, 4($sp)
addiu $sp, $sp, 8

jr $ra

finish:

