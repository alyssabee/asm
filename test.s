#
# testing.s serves as a "main" to test library functions
#
.globl _start
.text
.include "testinc.s"
_start:

	
	
	mov $message, %ecx
	

	#call print_string
	
	call clear_screen
	movl $EXITP, %eax
	xor %ebx,%ebx
	int $SYSCALL

message:
	.asciz "\n\n\n\n\n\n\n"


