.data
    message: .asciiz "Average is: "
    array:   .word 7, 2, 5, 11, 4, 6, 1, 1, 8, 3

.text
    main:
        la   $t0, array           # array
        li   $t1, 10              # array size
        li   $t2, 0               # sum
        li   $t3, 0               # index

    sumLoop:
        bge  $t3, $t1, endLoop    # if index >= array size

        lw   $t4, 0($t0)          # load the element into $t4
        add  $t2, $t2, $t4        # sum += current element

        addi $t3, $t3, 1          # increment index
        addi $t0, $t0, 4          # move to next element
        j sumLoop

    endLoop:
        mtc1 $t1, $f0             # move size to $f0
        mtc1 $t2, $f1             # move sum to $f1
        cvt.s.w $f0, $f0          # convert size to float
        cvt.s.w $f1, $f1          # convert sum to float
        div.s $f2, $f1, $f0       # $f2 = sum / size

        li $v0, 4
        la $a0, message           # print message
        syscall

        li    $v0, 2
        mov.s $f12, $f2           # print average
        syscall                   

        li    $v0, 10             # exit program
        syscall