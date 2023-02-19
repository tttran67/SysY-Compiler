	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L17:
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L22
.L22:
	ldr r4, [fp, #-16]
	cmp r4, #21
	movlt r4, #1
	movge r4, #0
	blt .L23
	b .L27
.L23:
	b .L29
.L24:
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L26:
.L27:
	b .L24
.L28:
.L29:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	ldr r6, =101
	sub r7, r6, r5
	cmp r4, r7
	movlt r4, #1
	movge r4, #0
	blt .L30
	b .L35
.L30:
	ldr r4, [fp, #-16]
	ldr r5, =100
	sub r6, r5, r4
	ldr r4, [fp, #-12]
	sub r5, r6, r4
	str r5, [fp, #-8]
	ldr r4, [fp, #-16]
	ldr r5, =5
	mul r6, r5, r4
	ldr r4, [fp, #-12]
	add r5, r6, r4
	ldr r4, [fp, #-8]
	ldr r6, =2
	sdiv r7, r4, r6
	add r4, r5, r7
	cmp r4, #100
	moveq r5, #1
	movne r5, #0
	beq .L39
	b .L45
.L31:
	ldr r5, [fp, #-16]
	add r4, r5, #1
	str r4, [fp, #-16]
	b .L22
.L34:
.L35:
	b .L31
.L36:
.L39:
	ldr r5, [fp, #-16]
	mov r0, r5
	bl putint
	ldr r4, [fp, #-12]
	mov r0, r4
	bl putint
	ldr r5, [fp, #-8]
	mov r0, r5
	bl putint
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putch
	b .L40
.L40:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L29
.L44:
.L45:
	b .L40
.L46:
