	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	ldr r4, =408
	sub sp, sp, r4
.L6:
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L10
.L10:
	bl getint
	mov r4, r0
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L11
	b .L15
.L11:
	bl getint
	mov r4, r0
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	ldr r5, =-408
	add r5, fp, r5
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L10
.L12:
	b .L21
.L14:
.L15:
	b .L12
.L16:
.L21:
	ldr r5, [fp, #-8]
	cmp r5, #0
	movne r4, #1
	moveq r4, #0
	bne .L22
	b .L27
.L22:
	ldr r5, [fp, #-8]
	sub r4, r5, #1
	str r4, [fp, #-8]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-8]
	mov r6, #4
	mul r7, r4, r6
	ldr r4, =-408
	add r4, fp, r4
	add r6, r4, r7
	ldr r7, [r6]
	add r4, r5, r7
	str r4, [fp, #-4]
	b .L21
.L23:
	ldr r5, [fp, #-4]
	ldr r6, =79
	sdiv r4, r5, r6
	mul r6, r4, r6
	sub r4, r5, r6
	mov r0, r4
	ldr r2, =408
	add sp, sp, r2
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L26:
.L27:
	b .L23
.L28:
