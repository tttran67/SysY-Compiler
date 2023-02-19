	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L12:
	ldr r4, =56
	str r4, [fp, #-8]
	ldr r4, =4
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =0
	sub r6, r5, #4
	sub r5, r4, r6
	ldr r4, [fp, #-4]
	add r6, r5, r4
	str r6, [fp, #-8]
	ldr r4, [fp, #-8]
	cmp r4, #0
	moveq r5, #1
	movne r5, #0
	mov r4, r5
	cmp r4, #0
	moveq r5, #1
	movne r5, #0
	mov r4, r5
	cmp r4, #0
	moveq r5, #1
	movne r5, #0
	mov r4, r5
	ldr r5, =0
	sub r6, r5, r4
	cmp r6, #0
	movne r4, #1
	moveq r4, #0
	bne .L17
	b .L35
.L17:
	ldr r5, =0
	sub r4, r5, #1
	ldr r5, =0
	sub r6, r5, r4
	ldr r4, =0
	sub r5, r4, r6
	str r5, [fp, #-8]
	b .L19
.L18:
	ldr r4, [fp, #-4]
	str r4, [fp, #-8]
	b .L19
.L19:
	ldr r5, [fp, #-8]
	mov r0, r5
	bl putint
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr

.L21:
.L22:
	b .L23
.L23:
.L25:
.L26:
	b .L27
.L27:
.L29:
.L30:
	b .L31
.L31:
.L34:
.L35:
	b .L18
.L36:
