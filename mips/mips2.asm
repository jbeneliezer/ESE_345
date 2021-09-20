ori $t4, 0x55

lui $t0, 0x10
ori $t0, 0x18

lw $t1, 20($t0)
add $t1, $t1, $t4
sw $t1, 28($t0)