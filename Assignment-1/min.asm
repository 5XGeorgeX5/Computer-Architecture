.data
    message: .asciiz "The minimum element in the array is: "
    array:   .word 10, 31, 5, 7, 11, 3, 8, 40, 12, 4

.text
    main:
        la   $t0, array           # array
        li   $t1, 10              # array size
        lw   $t2, 0($t0)          # initialize minimum value $t2 with the first element
        li   $t3, 1               # current index
        addi $t0, $t0, 4          # move to next element

    loop:
        bge  $t3, $t1, endLoop    # if index >= array size, exit loop

        lw   $t4, 0($t0)          # load the element into $t4

        blt  $t4, $t2, updateMin  # if $t4 < current min, update min

    nextElement:
        addi $t3, $t3, 1          # increment index
        addi $t0, $t0, 4          # move to next element
        j loop                    # return to the loop

    updateMin:
        move $t2, $t4             # update min with $t4
        j    nextElement          # return to the loop

    endLoop:
        li $v0, 4
        la $a0, message           # print message
        syscall

        li $v0, 1
        move $a0, $t2             # print min value
        syscall

        li   $v0, 10              # exit program
        syscall