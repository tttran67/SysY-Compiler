	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.text
	.global gcd
	.type gcd , %function
gcd:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #24
.L9:
	str r0, [fp, #-24]
	str r1, [fp, #-20]
	ldr r4, [fp, #-24]
	str r4, [fp, #-16]
	ldr r4, [fp, #-20]
	str r4, [fp, #-12]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L20
	b .L25
.L20:
	ldr r5, [fp, #-24]
	str r5, [fp, #-8]
	ldr r4, [fp, #-20]
	str r4, [fp, #-24]
	ldr r5, [fp, #-8]
	str r5, [fp, #-20]
	b .L21
.L21:
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L32
.L24:
.L25:
	b .L21
.L26:
.L32:
	ldr r4, [fp, #-4]
	cmp r4, #0
	movne r5, #1
	moveq r5, #0
	bne .L33
	b .L37
.L33:
	ldr r4, [fp, #-20]
	str r4, [fp, #-24]
	ldr r5, [fp, #-4]
	str r5, [fp, #-20]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	str r6, [fp, #-4]
	b .L32
.L34:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	mul r6, r4, r5
	ldr r4, [fp, #-20]
	sdiv r5, r6, r4
	mov r0, r5
	add sp, sp, #24
	pop {r4, r5, r6, fp, lr}
	bx lr

.L36:
.L37:
	b .L34
.L38:
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L46:
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl gcd
	mov r4, r0
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

addr_n_0:
	.word n
