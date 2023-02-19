	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 0
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L1:
	ldr r4, =10
	ldr r5, addr_a_0
	str r4, [r5]
	ldr r4, addr_a_0
	ldr r5, [r4]
	cmp r5, #0
	movgt r4, #1
	movle r4, #0
	bgt .L2
	b .L6
.L2:
	mov r0, #1
	add sp, sp, #0
	pop {r4, r5, fp, lr}
	bx lr

.L3:
	mov r0, #0
	add sp, sp, #0
	pop {r4, r5, fp, lr}
	bx lr

.L5:
.L6:
	b .L3
.L7:
addr_a_0:
	.word a
