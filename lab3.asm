#Lab 3: Copy the elements of an array into another.

#Assembler Directives
.data
.word 7
.word 3
.word 1
.word 12
.word 10
.word 2
.word 5
.word 9
.word 16
.word 11
.text
.globl main
#setup
main:
add $s0, $zero, $zero
add $t0, $zero, $zero
#$s0 contains the address of the first element of the first array
lui $s0, 0x1001
ori $s0,$s0,0
#$t0 contains the address of the first element of the second array
lui $t0, 0x1001
ori $t0, $t0, 0x0040
#Iteration
addi $t1,$zero,0 #incrementor
addi $t5,$zero,10 #goal 
#############
Loop:
lw $t2, 0($s0)
sw $t2, 0($t0)
addi $t1,$t1,1
beq $t1,$t5,End 
addi $s0,$s0,4
addi $t0,$t0,4
j Loop
End:
add $t3,$zero,$zero