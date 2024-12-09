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
    bge  $t3, $t1, endLoop    # If loop index >= array size, exit loop

    lw   $t4, 0($t0)          # Load array element into $t4
    andi $t5, $t4, 1          # Check if the number is even (AND with 1)

    beq  $t5, $zero, even     # If $t5 == 0 (even number), jump to even label

nextElement:
    addi $t3, $t3, 1          # Increment loop index
    addi $t0, $t0, 4          # Move to the next element in the array
    j loop                    # Jump back to the loop

even:
    addi $t2, $t2, 1          # Increment the even number counter
    j nextElement             # Continue to the next array element

endLoop:
    li $v0, 4
    la $a0, message
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall

    # Exit the program
    li   $v0, 10              # Load the system call code for exit
    syscall
