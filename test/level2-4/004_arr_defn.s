	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.comm a, 40, 4
	.text
	.global main
	.type main , %function
main:
	push {fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L0:
	mov r0, #0
	add sp, sp, #0
	pop {fp, lr}
	bx lr

addr_a_0:
	.word a
