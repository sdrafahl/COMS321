#Lab 2: Finding the minimum of a set of elements

#Assembler Directives
.data
.word 7
.word 3
.word 17
.word 12
.word 30
.word 2
.word 5
.word 1
.word 16
.word 11
.text
.globl main

#$s0 contains the address of the first
#of the data
main:
lui $s0, 0x1001
ori $s0,$s0,0
add $t1,$zero,$zero #accesses memmory  
addi $t2,$zero,40 #sentinal controler
lw $t0,0($s0) #holds min
add $t5,$zero,$zero
Loop:
beq $t5,10,Return #change to 1
add $s0,$s0,$t1
lw $t3,0($s0)  #gets temp value
addi $t5,$t5,1
addi $t1,$zero,4
slt $t4,$t3,$t0 
beq $t4,$zero,Skip
#code only enters below if condition is met
add $t0,$zero,$zero #change to 0
add $t0,$t3,$zero 
Skip:
j Loop
Return:
add $t0,$t0,$zero