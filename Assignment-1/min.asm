.data
    message: .asciiz "The minimum element in the array is: "
    array:   .word 10, 31, 5, 7, 11, 3, 8, 40, 12, 4
    size:    .word 10  # Number of elements in the array

.text
    main:
        la   $t0, array           # Load base address of the array into $t0
        lw   $t1, size            # Load array size into $t1
        lw   $t2, 0($t0)          # Initialize minimum value ($t2) with the first element
        li   $t3, 1               # Start index from the second element

    loop:
        bge  $t3, $t1, endLoop    # If index >= size, exit loop

        sll  $t4, $t3, 2          # Calculate offset: index * 4 (4 bytes per word)
        add  $t5, $t0, $t4        # Address of array[$t3]
        lw   $t6, 0($t5)          # Load array[$t3] into $t6

        blt  $t6, $t2, updateMin  # If array[$t3] < current min, update min

    nextElement:
        addi $t3, $t3, 1          # Increment index
        j    loop                 # Repeat loop

    updateMin:
        move $t2, $t6             # Update min with array[$t3]
        j    nextElement          # Continue to the next element

    endLoop:
        # Print message
        li   $v0, 4               # Syscall to print string
        la   $a0, message         # Address of the message string
        syscall

        # Print minimum value
        li   $v0, 1               # Syscall to print integer
        move $a0, $t2             # Load minimum value into $a0
        syscall

        # Exit program
        li   $v0, 10              # Syscall to exit
        syscall
