	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global exgcd
	.type exgcd , %function
exgcd:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub sp, sp, #24
.L11:
	str r0, [fp, #-24]
	str r1, [fp, #-20]
	str r2, [fp, #-16]
	str r3, [fp, #-12]
	ldr r4, [fp, #-20]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	beq .L22
	b .L27
.L22:
	ldr r4, [fp, #-16]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, =1
	str r4, [r5]
	ldr r5, [fp, #-12]
	mov r4, #0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, =0
	str r5, [r4]
	ldr r4, [fp, #-24]
	mov r0, r4
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L23:
	ldr r5, [fp, #-20]
	ldr r4, [fp, #-24]
	ldr r6, [fp, #-20]
	sdiv r7, r4, r6
	mul r6, r7, r6
	sub r7, r4, r6
	ldr r4, [fp, #-16]
	ldr r6, [fp, #-12]
	mov r0, r5
	mov r1, r7
	mov r2, r4
	mov r3, r6
	bl exgcd
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-16]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-12]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-16]
	mov r5, #0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	str r4, [r5]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-24]
	ldr r4, [fp, #-20]
	sdiv r7, r6, r4
	ldr r6, [fp, #-12]
	mov r4, #0
	mov r8, #4
	mul r9, r4, r8
	add r4, r6, r9
	ldr r6, [r4]
	mul r8, r7, r6
	sub r4, r5, r8
	ldr r5, [fp, #-12]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r5, [fp, #-8]
	mov r0, r5
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L24:
.L26:
.L27:
	b .L23
.L28:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L67:
	ldr r4, =7
	str r4, [fp, #-16]
	ldr r4, =15
	str r4, [fp, #-12]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-8
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =1
	str r5, [r4]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-4
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =1
	str r6, [r5]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	mov r6, #-8
	add r6, fp, r6
	add r7, r6, r8
	mov r8, #0
	mov r6, #4
	mul r9, r8, r6
	mov r8, #-4
	add r8, fp, r8
	add r6, r8, r9
	mov r0, r4
	mov r1, r5
	mov r2, r7
	mov r3, r6
	bl exgcd
	mov r4, r0
	mov r5, #0
	mov r6, #4
	mul r4, r5, r6
	mov r6, #-8
	add r5, fp, r6
	add r6, r5, r4
	ldr r5, [r6]
	ldr r4, [fp, #-12]
	sdiv r6, r5, r4
	mul r4, r6, r4
	sub r6, r5, r4
	ldr r4, [fp, #-12]
	add r5, r6, r4
	ldr r4, [fp, #-12]
	sdiv r6, r5, r4
	mul r4, r6, r4
	sub r6, r5, r4
	mov r4, #0
	mov r5, #4
	mul r7, r4, r5
	mov r4, #-8
	add r4, fp, r4
	add r5, r4, r7
	str r6, [r5]
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	mov r4, #-8
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [r5]
	mov r0, r6
	bl putint
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

