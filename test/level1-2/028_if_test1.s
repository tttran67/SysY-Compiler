	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global ifElse
	.type ifElse , %function
ifElse:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L3:
	ldr r4, =5
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #5
	moveq r4, #1
	movne r4, #0
	beq .L5
	b .L10
.L5:
	ldr r4, =25
	str r4, [fp, #-4]
	b .L7
.L6:
	ldr r4, [fp, #-4]
	ldr r5, =2
	mov r5, r4, LSL#1
	str r5, [fp, #-4]
	b .L7
.L7:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

.L9:
.L10:
	b .L6
.L11:
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L14:
	bl ifElse
	mov r4, r0
	mov r0, r4
	add sp, sp, #0
	pop {r4, fp, lr}
	bx lr

