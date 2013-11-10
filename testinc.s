
# 
# testinc.s accepts the starting address of a string in %ecx, 
# checks length, sets appropriate registers for the write
# syscall
#
# TODO: Currently broken. Does not correctly recognize
# null character in string. 
# 
# Clean and package. 
#

.text
.set EXITP, 1

.type print_string, @function
	print_string:
	#	jmp skip	##### DEBUGGING JMP
		xor %edx, %edx
		movl %ecx, %ebx
		xor %esi, %esi
	begin_loop:
		inc %ecx
		inc %edx
		cmpl (%ecx), %esi
		jnz begin_loop


#	skip:
#		movl $10, %edx


		movl %ebx, %ecx			
		movl $4, %eax
		movl $1, %ebx
		int $0x80
		ret
