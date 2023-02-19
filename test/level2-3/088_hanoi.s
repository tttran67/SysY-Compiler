	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global move
	.type move , %function
move:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L18:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	mov r0, #32
	bl putch
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #44
	bl putch
	mov r0, #32
	bl putch
	add sp, sp, #8
	pop {r4, fp, lr}
	bx lr

	.global hanoi
	.type hanoi , %function
hanoi:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L25:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	str r3, [fp, #-4]
	ldr r4, [fp, #-16]
	cmp r4, #1
	moveq r4, #1
	movne r4, #0
	beq .L34
	b .L39
.L34:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl move
	b .L36
.L35:
	ldr r4, [fp, #-16]
	sub r5, r4, #1
	ldr r4, [fp, #-12]
	ldr r6, [fp, #-4]
	ldr r7, [fp, #-8]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	mov r3, r7
	bl hanoi
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-4]
	mov r0, r5
	mov r1, r4
	bl move
	ldr r4, [fp, #-16]
	sub r5, r4, #1
	ldr r4, [fp, #-8]
	ldr r6, [fp, #-12]
	ldr r7, [fp, #-4]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	mov r3, r7
	bl hanoi
	b .L36
.L36:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L38:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L39:
	b .L35
.L40:
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L53:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	b .L55
.L55:
	ldr r4, [fp, #-4]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L56
	b .L60
.L56:
	bl getint
	mov r4, r0
	mov r0, r4
	mov r1, #1
	mov r2, #2
	mov r3, #3
	bl hanoi
	mov r0, #10
	bl putch
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L55
.L57:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

.L59:
.L60:
	b .L57
.L61:
