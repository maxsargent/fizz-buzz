# fizz-buzz.s this is a fizz-buzz written in the MIPS assembly language

.data
fizz_string: .asciiz "Fizz!\n"
buzz_string: .asciiz "Buzz!\n"
fizzbuzz_string: .asciiz "FizzBuzz!\n"
newline_string: .asciiz "\n"

.text
.globl main
main:
   li $t0, 100         # Upper bound of our iteration
   li $t1, 1           # Lower bound of our iteration
   li $t3, 3           # We use the value 3 reguarly so load it
   li $t5, 5           # We use the value 5 reguarly so load it
loop:
   beq $t1, $t0, end   # Signal the end of our loop and branch
   div $t1 , $t3       # Divide our counter by 3
   mfhi $t6            # Get the remainder
   beq $t6, $zero, fizz  # Branch to our fizz output if its remainder is 0
   div $t1, $t5        # Divide our counter by 5
   mfhi $t7            # Get the remainder
   beq $t7, $zero, buzz  # Branch to our buzz output if its remainder is 0
   move $a0, $t1       # Load our counter ready for output
   li $v0, 1           # Set service to print integer
   syscall             # Request kernel service
   j newline           # Jump to newline subroutine to print newline & increment
end:
   li $v0, 10          # Set service to terminate execution
   syscall             # Request kernel service
fizz:                  # Fizz subroutine checks if its also a buzz then jumps to fizzbuzz 
   div $t1, $t5        # Or just prints fizz, then increments the counter & loops
   mfhi $t7
   beq $t7, $zero, fizzbuzz
   la $a0, fizz_string
   li $v0, 4
   addi $t1, $t1, 1
   syscall
   j loop
buzz:                  # Buzz subroutine checks if its also a fizz then jumps to fizzbuzz
   div $t1 , $t3       # Or just prints buzz, then increments the counter & loops
   mfhi $t6
   beq $t6, $zero, fizzbuzz
   la $a0, buzz_string
   li $v0, 4
   addi $t1, $t1, 1
   syscall
   j loop
fizzbuzz:              # Fizzbuzz subroutine prints fizzbuzz & increments the counter
   la $a0, fizzbuzz_string
   li $v0, 4
   addi $t1, $t1, 1
   syscall
   j loop
newline:               # Newline subroutine prints \n & increments the counter
   la $a0, newline_string
   li $v0, 4
   addi $t1, $t1, 1
   syscall
   j loop
