.data
    message: .asciiz "Count of even numbers is: "
    array:  .word 10, 31, 5, 7, 11, 3, 8, 40, 12, 4

.text
    main:
        la   $t0, array           # array
        li   $t1, 10              # array size
        li   $t2, 0               # even count
        li   $t3, 0               # index

    loop:
        bge  $t3, $t1, endLoop    # if index >= array size

        lw   $t4, 0($t0)          # load the element into $t4
        andi $t5, $t4, 1          # check if even (AND with 1)

        beq  $t5, $zero, incrementCounter    # if is even

    nextElement:
        addi $t3, $t3, 1          # increment index
        addi $t0, $t0, 4          # move to next element
        j loop                    # return to the loop

    incrementCounter:
        addi $t2, $t2, 1          # increment counter
        j nextElement             # return to the loop

    endLoop:
        li $v0, 4
        la $a0, message           # print message
        syscall
        
        li $v0, 1
        move $a0, $t2             # print count
        syscall

        li   $v0, 10              # exit program
        syscall
