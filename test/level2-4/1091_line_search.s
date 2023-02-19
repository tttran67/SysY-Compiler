	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #76
.L16:
	ldr r4, =0
	str r4, [fp, #-72]
	ldr r4, =0
	str r4, [fp, #-76]
	b .L20
.L20:
	ldr r4, [fp, #-76]
	cmp r4, #10
	movlt r4, #1
	movge r4, #0
	blt .L21
	b .L25
.L21:
	ldr r4, [fp, #-76]
	add r5, r4, #1
	ldr r4, [fp, #-76]
	mov r6, #4
	mul r7, r4, r6
	mov r4, #-68
	add r4, fp, r4
	add r6, r4, r7
	str r5, [r6]
	ldr r4, [fp, #-76]
	add r5, r4, #1
	str r5, [fp, #-76]
	b .L20
.L22:
	ldr r5, =10
	str r5, [fp, #-12]
	bl getint
	mov r4, r0
	str r4, [fp, #-28]
	ldr r5, [fp, #-12]
	sub r4, r5, #1
	str r4, [fp, #-24]
	ldr r5, =0
	str r5, [fp, #-20]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	add r6, r4, r5
	ldr r4, =2
	sdiv r5, r6, r4
	str r5, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r5, =0
	str r5, [fp, #-76]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L42
.L24:
.L25:
	b .L22
.L26:
.L42:
	ldr r5, [fp, #-76]
	cmp r5, #10
	movlt r4, #1
	movge r4, #0
	blt .L45
	b .L48
.L43:
	ldr r5, [fp, #-76]
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-68
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [r4]
	ldr r5, [fp, #-28]
	cmp r6, r5
	moveq r4, #1
	movne r4, #0
	beq .L54
	b .L62
.L44:
	ldr r5, [fp, #-8]
	cmp r5, #1
	moveq r4, #1
	movne r4, #0
	beq .L66
	b .L71
.L45:
	ldr r5, [fp, #-8]
	cmp r5, #0
	moveq r4, #1
	movne r4, #0
	beq .L43
	b .L52
.L47:
.L48:
	b .L44
.L49:
.L51:
.L52:
	b .L44
.L53:
.L54:
	ldr r5, =1
	str r5, [fp, #-8]
	ldr r4, [fp, #-76]
	str r4, [fp, #-4]
	b .L55
.L55:
	ldr r5, [fp, #-76]
	add r4, r5, #1
	str r4, [fp, #-76]
	b .L42
.L61:
.L62:
	b .L55
.L63:
.L66:
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putint
	b .L68
.L67:
	ldr r4, =0
	str r4, [fp, #-28]
	ldr r5, [fp, #-28]
	mov r0, r5
	bl putint
	b .L68
.L68:
	ldr r4, =10
	str r4, [fp, #-28]
	ldr r5, [fp, #-28]
	mov r0, r5
	bl putch
	mov r0, #0
	add sp, sp, #76
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L70:
.L71:
	b .L67
.L72:
