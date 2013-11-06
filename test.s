

.global _start

.text

_start:

	mov	$0x20, %eax
	
	mov	$1, %eax
	int	$0x80

.end
