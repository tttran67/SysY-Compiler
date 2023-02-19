	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #68
.L19:
	ldr r4, =0
	str r4, [fp, #-64]
	ldr r4, =0
	str r4, [fp, #-68]
	b .L23
.L23:
	ldr r4, [fp, #-68]
	cmp r4, #10
	movlt r4, #1
	movge r4, #0
	blt .L24
	b .L28
.L24:
	ldr r4, [fp, #-68]
	add r5, r4, #1
	ldr r4, [fp, #-68]
	mov r6, #4
	mul r7, r4, r6
	mov r4, #-60
	add r4, fp, r4
	add r6, r4, r7
	str r5, [r6]
	ldr r4, [fp, #-68]
	add r5, r4, #1
	str r5, [fp, #-68]
	b .L23
.L25:
	ldr r5, =10
	str r5, [fp, #-4]
	bl getint
	mov r4, r0
	str r4, [fp, #-20]
	ldr r5, [fp, #-4]
	sub r4, r5, #1
	str r4, [fp, #-16]
	ldr r5, =0
	str r5, [fp, #-12]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	add r6, r4, r5
	ldr r4, =2
	sdiv r5, r6, r4
	str r5, [fp, #-8]
	b .L43
.L27:
.L28:
	b .L25
.L29:
.L43:
	ldr r4, [fp, #-8]
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-60
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [r5]
	ldr r4, [fp, #-20]
	cmp r6, r4
	movne r5, #1
	moveq r5, #0
	bne .L46
	b .L53
.L44:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	add r6, r4, r5
	ldr r4, =2
	sdiv r5, r6, r4
	str r5, [fp, #-8]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	mov r7, #4
	mul r6, r5, r7
	mov r5, #-60
	add r5, fp, r5
	add r7, r5, r6
	ldr r6, [r7]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L62
	b .L71
.L45:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	mov r7, #4
	mul r6, r5, r7
	mov r5, #-60
	add r5, fp, r5
	add r7, r5, r6
	ldr r6, [r7]
	cmp r4, r6
	moveq r4, #1
	movne r4, #0
	beq .L75
	b .L84
.L46:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L44
	b .L58
.L52:
.L53:
	b .L45
.L54:
.L57:
.L58:
	b .L45
.L59:
.L62:
	ldr r5, [fp, #-8]
	sub r4, r5, #1
	str r4, [fp, #-16]
	b .L64
.L63:
	ldr r5, [fp, #-8]
	add r4, r5, #1
	str r4, [fp, #-12]
	b .L64
.L64:
	b .L43
.L70:
.L71:
	b .L63
.L72:
.L75:
	ldr r5, [fp, #-20]
	mov r0, r5
	bl putint
	b .L77
.L76:
	ldr r4, =0
	str r4, [fp, #-20]
	ldr r5, [fp, #-20]
	mov r0, r5
	bl putint
	b .L77
.L77:
	ldr r4, =10
	str r4, [fp, #-20]
	ldr r5, [fp, #-20]
	mov r0, r5
	bl putch
	mov r0, #0
	add sp, sp, #68
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L83:
.L84:
	b .L76
.L85:
