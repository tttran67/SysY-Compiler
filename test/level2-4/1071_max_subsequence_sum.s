	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global maxSubArray
	.type maxSubArray , %function
maxSubArray:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L11:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r4, [fp, #-16]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	beq .L17
	b .L21
.L17:
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L18:
	ldr r4, [fp, #-16]
	cmp r4, #1
	moveq r4, #1
	movne r4, #0
	beq .L23
	b .L27
.L20:
.L21:
	b .L18
.L22:
.L23:
	ldr r4, [fp, #-20]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L24:
	ldr r4, [fp, #-20]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	str r4, [fp, #-8]
	ldr r5, =1
	str r5, [fp, #-4]
	b .L41
.L26:
.L27:
	b .L24
.L28:
.L41:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L42
	b .L47
.L42:
	ldr r5, [fp, #-12]
	cmp r5, #0
	movlt r4, #1
	movge r4, #0
	blt .L49
	b .L53
.L43:
	ldr r5, [fp, #-8]
	mov r0, r5
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L46:
.L47:
	b .L43
.L48:
.L49:
	ldr r4, =0
	str r4, [fp, #-12]
	b .L50
.L50:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-4]
	ldr r6, [fp, #-20]
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	add r7, r5, r6
	str r7, [fp, #-12]
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-12]
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L61
	b .L66
.L52:
.L53:
	b .L50
.L54:
.L61:
	ldr r4, [fp, #-12]
	str r4, [fp, #-8]
	b .L62
.L62:
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L41
.L65:
.L66:
	b .L62
.L67:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #44
.L71:
	ldr r4, =0
	sub r5, r4, #4
	mov r4, #0
	mov r6, #4
	mul r7, r4, r6
	mov r4, #-40
	add r4, fp, r4
	add r6, r4, r7
	str r5, [r6]
	mov r4, #1
	mov r4, #4
	mov r5, r4, LSL#0
	mov r4, #-40
	add r4, fp, r4
	add r6, r4, r5
	ldr r5, =3
	str r5, [r6]
	mov r4, #2
	mov r5, #4
	mov r4, r5, LSL#1
	mov r5, #-40
	add r5, fp, r5
	add r6, r5, r4
	ldr r4, =9
	str r4, [r6]
	ldr r5, =0
	sub r4, r5, #2
	mov r5, #3
	mov r6, #4
	mul r7, r5, r6
	mov r5, #-40
	add r5, fp, r5
	add r6, r5, r7
	str r4, [r6]
	mov r4, #4
	mov r4, #4
	mov r5, r4, LSL#2
	mov r4, #-40
	add r6, fp, r4
	add r4, r6, r5
	ldr r5, =0
	str r5, [r4]
	mov r4, #5
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-40
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =1
	str r5, [r4]
	ldr r4, =0
	sub r5, r4, #6
	mov r4, #6
	mov r6, #4
	mul r7, r4, r6
	mov r4, #-40
	add r6, fp, r4
	add r4, r6, r7
	str r5, [r4]
	mov r5, #7
	mov r6, #4
	mul r4, r5, r6
	mov r6, #-40
	add r6, fp, r6
	add r5, r6, r4
	ldr r4, =5
	str r4, [r5]
	mov r5, #8
	mov r5, #4
	mov r4, r5, LSL#3
	mov r5, #-40
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =7
	str r4, [r5]
	mov r5, #9
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-40
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =8
	str r6, [r4]
	ldr r4, =10
	str r4, [fp, #-44]
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-40
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [fp, #-44]
	mov r0, r4
	mov r1, r6
	bl maxSubArray
	mov r5, r0
	str r5, [fp, #-44]
	ldr r4, [fp, #-44]
	mov r0, r4
	add sp, sp, #44
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

