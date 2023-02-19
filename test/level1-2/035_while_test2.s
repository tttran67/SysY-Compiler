	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global FourWhile
	.type FourWhile , %function
FourWhile:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L15:
	ldr r4, =5
	str r4, [fp, #-16]
	ldr r4, =6
	str r4, [fp, #-12]
	ldr r4, =7
	str r4, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-4]
	b .L20
.L20:
	ldr r4, [fp, #-16]
	cmp r4, #20
	movlt r4, #1
	movge r4, #0
	blt .L21
	b .L25
.L21:
	ldr r4, [fp, #-16]
	add r5, r4, #3
	str r5, [fp, #-16]
	b .L28
.L22:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-4]
	add r7, r5, r6
	add r5, r4, r7
	ldr r4, [fp, #-8]
	add r6, r5, r4
	mov r0, r6
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L24:
.L25:
	b .L22
.L26:
.L28:
	ldr r4, [fp, #-12]
	cmp r4, #10
	movlt r5, #1
	movge r5, #0
	blt .L29
	b .L33
.L29:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L36
.L30:
	ldr r4, [fp, #-12]
	sub r5, r4, #2
	str r5, [fp, #-12]
	b .L20
.L32:
.L33:
	b .L30
.L34:
.L36:
	ldr r4, [fp, #-8]
	cmp r4, #7
	moveq r5, #1
	movne r5, #0
	beq .L37
	b .L41
.L37:
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	str r5, [fp, #-8]
	b .L44
.L38:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L28
.L40:
.L41:
	b .L38
.L42:
.L44:
	ldr r4, [fp, #-4]
	cmp r4, #20
	movlt r5, #1
	movge r5, #0
	blt .L45
	b .L49
.L45:
	ldr r4, [fp, #-4]
	add r5, r4, #3
	str r5, [fp, #-4]
	b .L44
.L46:
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L36
.L48:
.L49:
	b .L46
.L50:
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L59:
	bl FourWhile
	mov r4, r0
	mov r0, r4
	add sp, sp, #0
	pop {r4, fp, lr}
	bx lr

