	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global palindrome
	.type palindrome , %function
palindrome:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #28
.L12:
	str r0, [fp, #-28]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L18
.L18:
	ldr r4, [fp, #-8]
	cmp r4, #4
	movlt r4, #1
	movge r4, #0
	blt .L19
	b .L23
.L19:
	ldr r4, [fp, #-28]
	ldr r5, =10
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	ldr r4, [fp, #-8]
	mov r5, #4
	mul r7, r4, r5
	mov r4, #-24
	add r5, fp, r4
	add r4, r5, r7
	str r6, [r4]
	ldr r4, [fp, #-28]
	ldr r5, =10
	sdiv r6, r4, r5
	str r6, [fp, #-28]
	ldr r5, [fp, #-8]
	add r4, r5, #1
	str r4, [fp, #-8]
	b .L18
.L20:
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-24
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [r4]
	mov r5, #3
	mov r4, #4
	mul r7, r5, r4
	mov r5, #-24
	add r5, fp, r5
	add r4, r5, r7
	ldr r7, [r4]
	cmp r6, r7
	moveq r5, #1
	movne r5, #0
	beq .L34
	b .L42
.L22:
.L23:
	b .L20
.L24:
.L31:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L33
.L32:
	ldr r5, =0
	str r5, [fp, #-4]
	b .L33
.L33:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #28
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L34:
	mov r5, #1
	mov r4, #4
	mov r5, r4, LSL#0
	mov r4, #-24
	add r6, fp, r4
	add r4, r6, r5
	ldr r5, [r4]
	mov r6, #2
	mov r6, #4
	mov r4, r6, LSL#1
	mov r6, #-24
	add r7, fp, r6
	add r6, r7, r4
	ldr r4, [r6]
	cmp r5, r4
	moveq r5, #1
	movne r5, #0
	beq .L31
	b .L51
.L41:
.L42:
	b .L32
.L43:
.L50:
.L51:
	b .L32
.L52:
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L54:
	ldr r4, =1221
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl palindrome
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #1
	moveq r4, #1
	movne r4, #0
	beq .L58
	b .L63
.L58:
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	b .L60
.L59:
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L60
.L60:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	mov r0, #0
	add sp, sp, #8
	pop {r4, fp, lr}
	bx lr

.L62:
.L63:
	b .L59
.L64:
