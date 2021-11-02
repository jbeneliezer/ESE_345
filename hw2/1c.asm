ori $t2, 0x5555
ori $t4, 0xAAAA

slt $s0, $t2, $t4

bne $s0, $zero, L
beq $t2, $t4, L

ori $s1, 100
L: