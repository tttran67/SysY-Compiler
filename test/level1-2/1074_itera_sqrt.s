	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global fsqrt
	.type fsqrt , %function
fsqrt:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L9:
	str r0, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	ldr r5, =2
	sdiv r6, r4, r5
	str r6, [fp, #-4]
	b .L15
.L15:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sub r6, r4, r5
	cmp r6, #0
	movne r4, #1
	moveq r4, #0
	bne .L16
	b .L21
.L16:
	ldr r5, [fp, #-4]
	str r5, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-8]
	sdiv r7, r5, r6
	add r5, r4, r7
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r6, =2
	sdiv r5, r4, r6
	str r5, [fp, #-4]
	b .L15
.L17:
	ldr r5, [fp, #-4]
	mov r0, r5
	add sp, sp, #12
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L20:
.L21:
	b .L17
.L22:
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L29:
	ldr r4, =400
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl fsqrt
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	mov r0, #0
	add sp, sp, #8
	pop {r4, fp, lr}
	bx lr

