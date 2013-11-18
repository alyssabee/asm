
# 
# testinc.s accepts the starting address of a string in %ecx, 
# checks length, sets appropriate registers for the write
# syscall
#
# TODO: Clean up code. Fix issue with null comparison starting at
#	index 1 of string. Starting with index 0 would keep
#	empty strings from causing issues. 
#  	
.code32		  	
.text
.set EXITP, 1
.set SYSCALL, 0x80
.set WRITE, 4
.set STD_OUT, 1
#
# print_string: Prints string to screen with write system call. 
# 
#	precondition: Receives address of string in ECX.
#
#	processing: Iterates through string keeping count
#		    until null is reached. Passes to 
#		    system call through EDX
#
#	postcondition: Write system call to standard output
#		       is invoked. 			
#
.type print_string, @function
	print_string:
		xorb %al, %al
		xorl %edx, %edx
		movl %ecx, %ebx
	
	begin_loop1:
		inc %ecx
		inc %edx
		cmpb (%ecx), %al
		jnz begin_loop1
		
		movl %ebx, %ecx			
		movl $WRITE, %eax
		movl $STD_OUT, %ebx
		int $SYSCALL
		ret
#
# clear_screen: 
#	Clears console (60 lines)
#
#
.type clear_screen, @function
	clear_screen:
		movl $60, %ecx
	begin_loop2:
       	        pushl %ecx

        	movl $WRITE, %eax
        	movl $STD_OUT, %ebx
        	movl $nl, %ecx
        	movl $1, %edx
        	int $SYSCALL
       	        popl %ecx
	        loop begin_loop2
		ret





# new line character
nl: 
	.byte 0xA

test1:
	.byte 0x0
