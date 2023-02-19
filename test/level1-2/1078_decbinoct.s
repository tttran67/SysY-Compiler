	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global dec2bin
	.type dec2bin , %function
dec2bin:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L9:
	str r0, [fp, #-20]
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r4, =1
	str r4, [fp, #-12]
	ldr r4, [fp, #-20]
	str r4, [fp, #-4]
	b .L17
.L17:
	ldr r4, [fp, #-4]
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L18
	b .L22
.L18:
	ldr r4, [fp, #-4]
	ldr r5, =2
	sdiv r5, r4, r5
	mov r6, r5, LSL#1
	sub r5, r4, r6
	str r5, [fp, #-8]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	mul r6, r4, r5
	ldr r4, [fp, #-16]
	add r5, r6, r4
	str r5, [fp, #-16]
	ldr r4, [fp, #-12]
	ldr r5, =10
	mul r6, r4, r5
	str r6, [fp, #-12]
	ldr r4, [fp, #-4]
	ldr r5, =2
	sdiv r6, r4, r5
	str r6, [fp, #-4]
	b .L17
.L19:
	ldr r4, [fp, #-16]
	mov r0, r4
	add sp, sp, #20
	pop {r4, r5, r6, fp, lr}
	bx lr

.L21:
.L22:
	b .L19
.L23:
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L31:
	ldr r4, =400
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl dec2bin
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

