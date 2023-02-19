	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L7:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	cmp r5, #0
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	cmp r5, #0
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	sub r6, r4, r5
	cmp r6, #0
	movne r5, #1
	moveq r5, #0
	bne .L9
	b .L27
.L9:
	ldr r4, =0
	sub r5, r4, #1
	ldr r4, =0
	sub r6, r4, r5
	ldr r5, =0
	sub r4, r5, r6
	str r4, [fp, #-4]
	b .L11
.L10:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L11
.L11:
	ldr r5, [fp, #-4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr

.L13:
.L14:
	b .L15
.L15:
.L17:
.L18:
	b .L19
.L19:
.L21:
.L22:
	b .L23
.L23:
.L26:
.L27:
	b .L10
.L28:
