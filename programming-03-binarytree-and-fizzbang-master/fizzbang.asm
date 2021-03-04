global _start

section .text        ; read only section, its the body of the code.
_start:        ; start section.

  mov r15, 0        ; register 15 make sure the bang counter is set to 0.
  mov r14, 0        ; register 14 make sure the fizz counter is set to 0.
  xor r9,r9        ; this is simply setting the register 9 to its self making it 0. 
  mov r13, 15        ; register 13 holds the information in r15 to check to see if the number is in 15.
  mov r12, 5        ; register 12 holds the variable 5 to check to see if the number is divisable to it.
  mov r11, 3        ; register 11 holds the variable 3 to check to see if the number is divisable to it.
  mov r10, 20        ; register 10 holds the value of 20 becasue this is the loop limit we want.
  mov rdi, 1        ; register destination index (destination for data copies). Basically creates print.
  mov rdx, 13        ; how many characters are used to display the title message 'fizzbang demo'.
  mov rax, 1        ; making the value of rax to 1 to allow output.
  mov rsi, titleMsg        ; pulls the fizzbuzz Demo message into rsi.
  syscall        ; this is needed to see the demo title as it calls the system to print.
  mov rsi, sepline        ; after the code above we need a new seperated line.
  mov rdi, 1        ; makes the seperate line visable.
  mov rax, 1        ; making the value of rax to 1 to allow output.
  mov rdx, 1        ; only need 1 character as its a new seperate line.
  syscall        ; this is needed to see the new sepeate line under the demo title as it calls the system to print.

; Title 'FizzBang Demo' has been created with a new sperate line under it. Now it is the comparison process.

loop:        ; label for the loop
	
  cmp r9, r10        ; r10 is equal to 20 so compares it to r9 which was made to 0 by the XOR.
  je loopcounter        ; when the jump equals to 20 it will stop the loop. A counter basically.
  inc r9         ; this increment command adds 1 everytime.

fifteen:        ; this section is used to see if the value is divisable by 15.                  

  mov rax, r9        ; setting rax to the same as r9.
  xor rdx, rdx         ; using the xor again this sets the value of rdx to 0.
  div r13        ; testing to see if the value above is divisable by 15.
  cmp rdx, 0        ; comparing if the remaining number is 0.
  jne five        ; when the check is done and it isnt diviable by 15 then it jumps to the section called five to test the number there.
  inc r15        ; this increment command adds 1 onto the bang loop.
  inc r14        ; this increment command adds 1 onto the fizz loop.
  mov rsi, fizzbangMsg        ; if it is diviable this will push the message to the system.
  mov rdx, 9        ; as the fizzbang message is 8 letter, give it 9 characters to work with.
  mov rdi, 1        ; allows the system to print the message.
  mov rax, 1        ; puts 1 into the rax register to alllow output.
  syscall        ; this is needed to allow the value that is diviable by 15 to be printed out in the system.
  jmp loop        ; once this has been checked and the valu eis diviable by 15 then jump back to the loop to test the next value.

three:        ; this section is used to see if the value is divisable by 3.          
	
  xor rdx, rdx        ; using the xor again this sets the value of rdx to 0.
  mov rax, r9        ; setting rax to the same as r9.
  mov r11, 3        ; setiing r11 to 3.
  div r11        ; testing to see if the value above is divisable by 3.
  cmp rdx,0        ; comparing if the remaining number is 0.
  jne numberdisplay        ; if it is not diviable by any of the numbers then just display the number.
  inc r14        ; this increment command adds 1 onto the fizz loop.
  mov rsi, fizzMsg        ; if it is diviable this will push the message to the system.
  mov rdx, 5        ; as the fizz message is 4 letter, give it 5 characters to work with.
  mov rax, 1        ; puts 1 into the rax register to alllow output.
  mov rdi, 1        ; allows the system to print the message.
  syscall        ; this is needed to allow the value that is diviable by 3 to be printed out in the system.
  jmp loop        ; once this has been checked and the value is diviable by 15 then jump back to the loop to test the next value.

five:        ; this section is used to see if the value is divisable by 5                
	
  xor rdx, rdx        ; using the xor again this sets the value of rdx to 0.
  mov rax, r9        ; setting rax to the same as r9.
  div r12        ; testing to see if the value above is divisable by 5.
  cmp rdx,0        ; comparing if the remaining number is 0.
  jne three        ; check to see if it is divisable by 5, if it isn't jump to section named three.
  inc r15        ; this increment command adds 1 onto the bang loop.
  mov rsi, bangMsg        ; if it is diviable this will push the message to the system.
  mov rdx, 5        ; as the bang message is 4 letter, give it 5 characters to work with.
  mov rax, 1        ; puts 1 into the rax register to alllow output.
  mov rdi, 1        ; allows the system to print the message.
  syscall        ; this is needed to allow the value that is diviable by 5 to be printed out in the system.
  jmp loop        ; once this has been checked and the value is diviable by 15 then jump back to the loop to test the next value.

numberdisplay:        ; this section is used for showing the numbers that arent divisable by 3,5 or 15.

  mov rax, r9        ; makes rax value of r9. 
  mov rcx, 64        ; uses the numbers given '0123456789ABCDEF'.
  mov rdi, 1        ; allows the system to print the message
  mov rdx, 1        ; 1 character will be used so one is given to rdx.

.loop:
  push rax        ; pushes rax.
  sub rcx, 4        ; takes 4 from the register rcx.
  sar rax, cl        ; moves value of rax to the pointer of cl.
  and rax, 0xf        ; puts the number and value of rax into the loop.
  lea rsi, [hexnumbers + rax]      
  mov rax, 1        ; has the value of rax then + 1.
  push rcx        ; pushes rcx.
  syscall        ; allows the code to run in the system.   
  pop rcx        ; takes the value of rcx away from the stack.
  pop rax        ; takes the value of rax away from the stack.
  test rcx, rcx        ; sets value of rcx to 0.
  jnz .loop        ; it will check if the pop has worked, if not it will go through the loop again.   
  mov rax, 1        ; puts 1 into the rax register to alllow output.
  mov rdi, 1        ; allows the system to print the message.
  mov rsi, sepline        ; after the code above we need a new seperated line.
  mov rdx, 1        ; 1 character will be used so one is given to rdx.
  syscall        ; allows the code to run in the system.
  jmp loop        ; jump to the start of the section.
        

loopcounter:        ; this section is used for a counter system.

  mov rax, r14        ; makes rax value of r14 (fizz). 
  mov rdi, 1        ; allows the system to print the message.
  mov rdx, 1        ; 1 character will be used so one is given to rdx.
  mov rcx, 64        ; uses the numbers given '0123456789ABCDEF'.
	
.loopn:
  sub rcx, 4        ; takes 4 from the register rcx.
  push rax        ; pushes rax.
  sar rax, cl        ; moves value of rax to the pointer of cl.
  and rax, 0xf        ; puts the number and value of rax into the loop.  
  lea rsi, [hexnumbers + rax]              
  mov rax, 1        ; has the value of rax then + 1.
  push rcx        ; pushes rax.
  syscall        ; allows the code to run in the system.
  pop rcx        ; takes the value of rcx away from the stack.
  pop rax        ; takes the value of rax away from the stack.
  test rcx, rcx        ; sets value of rcx to 0.
  jnz .loopn        ; it will check if the pop has worked, if not it will go through the loop again.
  mov rax, 1        ; puts 1 into the rax register to alllow output.
  mov rdi, 1        ; allows the system to print the message
  mov rsi, sepline        ; after the code above we need a new seperated line.
  mov rdx, 1        ; 1 character will be used so one is given to rdx.
  syscall        ; allows the code to run in the system.
  mov rax, r15        ; makes rax value of r14 (bang). 
  mov rdi, 1        ; allows the system to print the message.
  mov rdx, 1        ; 1 character will be used so one is given to rdx.
  mov rcx, 64        ; uses the numbers given '0123456789ABCDEF'.
	
.loopi:
  sub rcx, 4        ; takes 4 from the register rcx.
  push rax        ; pushes rax.                          
  sar rax, cl        ; moves value of rax to the pointer of cl.
  and rax, 0xf        ; puts the number and value of rax into the loop.  
  lea rsi, [hexnumbers + rax]
  mov rax, 1        ; has the value of rax then + 1.
  push rcx        ; moves rcx to the top of the stack.
  syscall        ; allows the code to run in the system.
  pop rcx        ; takes the value of rcx away from the stack.
  pop rax        ; takes the value of rax away from the stack.
  test rcx, rcx        ; sets value of rcx to 0.
  jnz .loopi        ; it will check if the pop has worked, if not it will go through the loop again.
  mov rdi, 1        ; allows the system to print the message
  mov rax, 1        ; puts 1 into the rax register to alllow output.
  mov rdx, 1        ; 1 character will be used so one is given to rdx.
  mov rsi, sepline        ; after the code above we need a new seperated line.
  syscall        ; allows the code to run in the system.
  jmp end        ; once loop is done, end.

section .data        ; section.data defines the memory and the items stored in it.

  hexnumbers: db '0123456789ABCDEF'        ; ueses hexadeciaml values.
  titleMsg: db 'FizzBang Demo', 10        ; definies a message with the string 'fizzbang demo'.
  fizzMsg: db 'Fizz', 10        ; definies a message with the string 'fizz'.
  bangMsg: db 'Bang', 10        ; definies a message with the string 'bang'.
  fizzbangMsg: db 'FizzBang', 10        ;   definies a message with the string 'fizzbang'.
  sepline: db 10        ; allows a seperate line.


end:        ; end code.

  mov rax,60        ; this code removes the segment failure.
  xor rdi,rdi
  syscall
