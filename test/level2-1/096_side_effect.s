	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word -1
	.global b
	.align 4
	.size b, 4
b:
	.word 1
	.text
	.global inc_a
	.type inc_a , %function
inc_a:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L30:
	ldr r4, addr_a_0
	ldr r5, [r4]
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_a_0
	str r4, [r5]
	ldr r4, addr_a_0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L36:
	ldr r4, =5
	str r4, [fp, #-4]
	b .L38
.L38:
	ldr r4, [fp, #-4]
	cmp r4, #0
	movge r4, #1
	movlt r4, #0
	bge .L39
	b .L43
.L39:
	bl inc_a
	mov r4, r0
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L48
	b .L51
.L40:
	ldr r4, addr_a_0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, addr_b_0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	ldr r4, addr_a_0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr

.L42:
.L43:
	b .L40
.L44:
.L45:
	ldr r4, addr_a_0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, addr_b_0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	b .L46
.L46:
	bl inc_a
	mov r4, r0
	cmp r4, #14
	movlt r5, #1
	movge r5, #0
	blt .L63
	b .L68
.L47:
	bl inc_a
	mov r4, r0
	cmp r4, #0
	movne r5, #1
	moveq r5, #0
	bne .L45
	b .L59
.L48:
	bl inc_a
	mov r4, r0
	cmp r4, #0
	movne r5, #1
	moveq r5, #0
	bne .L47
	b .L55
.L50:
.L51:
	b .L46
.L52:
.L54:
.L55:
	b .L46
.L56:
.L58:
.L59:
	b .L46
.L60:
.L63:
	ldr r4, addr_a_0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	ldr r4, addr_b_0
	ldr r5, [r4]
	ldr r4, =2
	mov r4, r5, LSL#1
	ldr r5, addr_b_0
	str r4, [r5]
	b .L65
.L64:
	bl inc_a
	mov r4, r0
	b .L65
.L65:
	ldr r5, [fp, #-4]
	sub r4, r5, #1
	str r4, [fp, #-4]
	b .L38
.L66:
	bl inc_a
	mov r5, r0
	cmp r5, #0
	movne r4, #1
	moveq r4, #0
	bne .L70
	b .L73
.L67:
.L68:
	b .L66
.L69:
.L70:
	bl inc_a
	mov r5, r0
	bl inc_a
	mov r4, r0
	sub r6, r5, r4
	add r5, r6, #1
	cmp r5, #0
	movne r4, #1
	moveq r4, #0
	bne .L63
	b .L77
.L72:
.L73:
	b .L64
.L74:
.L76:
.L77:
	b .L64
.L78:
addr_a_0:
	.word a
addr_b_0:
	.word b
