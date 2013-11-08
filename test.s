
#
# test.s prints a message to console using system calls
#
#  to compile: 
#        as test.s -o test
#	 ld test -o runtest
#

.global _start



.text

.equ WRITESTRING, 4


#.include "testinclude.s"

_start:


	movl	$WRITESTRING, %eax		# 4 is system call for print

	movl	$1, %ebx		# 1 = standard output
	movl	$message, %ecx		# address of message
	movl	$10, %edx		# length
	#int	$0x80			# interrupt
	call	INTERRUPT
	movl	$1, %eax		# 1 is system call for exit
	xor	%ebx, %ebx		
	int	$0x80

INTERRUPT:

	int	$0x80
	ret
message:
	.ascii "Test call\n"


.end
