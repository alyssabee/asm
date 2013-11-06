
/*
* test.s prints a message to console using system calls
*/


.global _start

.text

_start:

	movl	$0x4, %eax		# 4 is system call for print
	movl	$1, %ebx		# 1 = standard output
	movl	$message, %ecx		# address of message
	movl	$10, %edx		# length
	int	$0x80			# interrupt

	movl	$1, %eax		# 1 is system call for exit
	int	$0x80

message:
	.ascii "Test call\n"
.end
