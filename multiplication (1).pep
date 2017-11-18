                 STRO req1, d         ; reqesting first number
                 DECI num1, d         ; read and store first number
                 STRO req2, d         ; reqesting second number
                 DECI num2, d         ; read and store second number
                 LDA num2, d          ; loading the second number to the acc
                 
loop:            BREQ done            ; repeat till it zero
                 LDA res, d           ; loading the res (result) to the acc (which is zero at the start)
                 ADDA num1, d         ; adding first number to the acc
                 STA res, d           ; storing the acc to the res (new result)
                 LDA num2, d          ; loading second number to the acc
                 SUBA 0x0001, i       ; subtracting 1 from the acc (second number)
                 STA num2, d          ; storing the acc to the num2 (new second number)
                 BR loop              ; repeat the loop
                 
done:            STRO out, d          ; output of the result message
                 DECO res, d          ; output of the result
                 STOP

num1:            .BLOCK 2             ; reservation for the first number  
num2:            .BLOCK 2             ; reservation for the second number
req1:            .ASCII "Enter first decimal number: \x00"        ; first number message
req2:            .ASCII "Enter second decimal number: \x00"       ; second number message
res:             .WORD 0x0000                                     ; starting value of the result (zero)
out:             .ASCII "Result: \x00"                            ; result message
                 .END