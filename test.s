

.global _start

.text

_start:

	mov	$0x4, %eax
	mov	$1, %ebx
	mov	$message, %ecx
	mov	$10, %edx
	int	$0x80

	mov	$1, %eax
	int	$0x80

message:
	.ascii "Test call\n"
.end
