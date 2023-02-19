	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global maxArea
	.type maxArea , %function
maxArea:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #24
.L13:
	str r0, [fp, #-24]
	str r1, [fp, #-20]
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r4, [fp, #-20]
	sub r5, r4, #1
	str r5, [fp, #-12]
	ldr r4, =0
	sub r5, r4, #1
	str r5, [fp, #-8]
	b .L23
.L23:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L24
	b .L29
.L24:
	ldr r5, [fp, #-16]
	ldr r4, [fp, #-24]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-12]
	ldr r5, [fp, #-24]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	cmp r4, r5
	movlt r5, #1
	movge r5, #0
	blt .L32
	b .L46
.L25:
	ldr r5, [fp, #-8]
	mov r0, r5
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L28:
.L29:
	b .L25
.L30:
.L32:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	sub r6, r4, r5
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-24]
	mov r8, #4
	mul r7, r4, r8
	add r4, r5, r7
	ldr r5, [r4]
	mul r7, r6, r5
	str r7, [fp, #-4]
	b .L34
.L33:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	sub r6, r4, r5
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-24]
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [r5]
	mul r7, r6, r4
	str r7, [fp, #-4]
	b .L34
.L34:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-8]
	cmp r5, r4
	movgt r5, #1
	movle r5, #0
	bgt .L62
	b .L67
.L45:
.L46:
	b .L33
.L47:
.L62:
	ldr r4, [fp, #-4]
	str r4, [fp, #-8]
	b .L63
.L63:
	ldr r5, [fp, #-16]
	ldr r4, [fp, #-24]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-12]
	ldr r5, [fp, #-24]
	mov r8, #4
	mul r7, r6, r8
	add r6, r5, r7
	ldr r5, [r6]
	cmp r4, r5
	movgt r5, #1
	movle r5, #0
	bgt .L70
	b .L84
.L66:
.L67:
	b .L63
.L68:
.L70:
	ldr r5, [fp, #-12]
	sub r4, r5, #1
	str r4, [fp, #-12]
	b .L72
.L71:
	ldr r5, [fp, #-16]
	add r4, r5, #1
	str r4, [fp, #-16]
	b .L72
.L72:
	b .L23
.L83:
.L84:
	b .L71
.L85:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #44
.L89:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-40
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =3
	str r6, [r5]
	mov r4, #1
	mov r5, #4
	mov r4, r5, LSL#0
	mov r5, #-40
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =3
	str r4, [r5]
	mov r5, #2
	mov r4, #4
	mov r5, r4, LSL#1
	mov r4, #-40
	add r6, fp, r4
	add r4, r6, r5
	ldr r5, =9
	str r5, [r4]
	mov r4, #3
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-40
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =0
	str r5, [r4]
	mov r4, #4
	mov r5, #4
	mov r4, r5, LSL#2
	mov r5, #-40
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =0
	str r4, [r5]
	mov r5, #5
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-40
	add r4, fp, r5
	add r5, r4, r6
	ldr r4, =1
	str r4, [r5]
	mov r5, #6
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-40
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =1
	str r6, [r4]
	mov r4, #7
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-40
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =5
	str r5, [r4]
	mov r4, #8
	mov r5, #4
	mov r4, r5, LSL#3
	mov r5, #-40
	add r5, fp, r5
	add r6, r5, r4
	ldr r4, =7
	str r4, [r6]
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
	bl maxArea
	mov r5, r0
	str r5, [fp, #-44]
	ldr r4, [fp, #-44]
	mov r0, r4
	add sp, sp, #44
	pop {r4, r5, r6, fp, lr}
	bx lr

