# note: this code will not run in mars simulator, as the memory address 1048600 is reserved for the .text section.
#	to run in mars either add 0x10000000 to the address to put the integer array in the .data section or edit the memory configuration.

lui $t4, 0x555
ori $t4, 0x5555

lui $s0, 0x10		# address of x
ori $s0, $s0, 0x18

lui $t0, 0xAAA
ori $t0, 0xAAAA
sw $t0, 20($s0)

lw $s1, 20($s0)
add $s1, $s1, $t4
sw $s1, 28($s0)