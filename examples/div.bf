,>,>++++++[-<--------<-------->>] # Store 2 numbers from keyboard in (0) and (1) and subtract 48 from each
<<[                               # This is the main loop which continues until the dividend in (0) is zero
>[->+>+<<]                        # Destructively copy the divisor from (1) to (2) and (3); setting (1) to zero
>[-<<-                            # Subtract the divisor in (2) from the dividend in (0); the difference is stored in (0) and (2) is cleared
[>]>>>[<[>>>-<<<[-]]>>]<<]        # If the dividend in (0) is zero; exit the loop
>>>+                              # Add one to the quotient in (5)
<<[-<<+>>]                        # Destructively copy the divisor in (3) to (1)
<<<]                              # Move the stack pointer to (0) and go back to the start of the main loop
>[-]>>>>[-<<<<<+>>>>>]            # Destructively copy the quotient in (5) to (0) (not necessary; but cleaner)
<<<<++++++[-<++++++++>]<.         # Add 48 and print result
