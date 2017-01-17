
.text
.globl main

fibo:
    li   $a0, 9     # Nth number in sequence argument
    sub  $sp, 4       # create the stack frame
    sw   $ra,0($sp)   # save the return address
    addi $t0,$zero,0  # counter
    addi $t1,$zero,1  # a
    addi $t2,$zero,1  # b
    addi $t3,$zero,2  # c
    recurs:
        bne $t0,$a0,fiboProcess
        jr $ra
    fiboProcess:
        sub  $sp,8
        sw   $s0,0($sp)      # will use for argument n
        sw   $ra,4($sp)      # return address
        add $v0,$zero,$t1   # get answer
        add $t4,$zero,$t3   # d = c
        add $t3,$t4,$t2     # c = d + b
        add $t1,$zero,$t2   # a = b
        add $t2,$zero,$t4   # b = d
        add $t0,$t0,1       # counter++
        jal recurs

        lw   $s0,($sp)       # restore registers from stack
        lw   $ra,4($sp) 
        add  $sp,8
        jr   $ra
    



main:
    jal fibo
    add $t6,$zero,$v0 # finnal answer