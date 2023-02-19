	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global gcd
	.type gcd , %function
gcd:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L11:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	beq .L16
	b .L20
.L16:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L17:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	sdiv r7, r5, r6
	mul r6, r7, r6
	sub r7, r5, r6
	mov r0, r4
	mov r1, r7
	bl gcd
	mov r4, r0
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L19:
.L20:
	b .L17
.L21:
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L26:
	bl getint
	mov r4, r0
	str r4, [fp, #-12]
	b .L28
.L28:
	ldr r4, [fp, #-12]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L29
	b .L33
.L29:
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
	bl putint
	mov r0, #10
	bl putch
	ldr r5, [fp, #-12]
	sub r4, r5, #1
	str r4, [fp, #-12]
	b .L28
.L30:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, fp, lr}
	bx lr

.L32:
.L33:
	b .L30
.L34:
