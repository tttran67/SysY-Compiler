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
	.global bubblesort
	.type bubblesort , %function
bubblesort:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L16:
	str r0, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	b .L22
.L22:
	ldr r4, [fp, #-12]
	ldr r5, addr_n_0
	ldr r6, [r5]
	sub r5, r6, #1
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L23
	b .L28
.L23:
	ldr r5, =0
	str r5, [fp, #-8]
	b .L30
.L24:
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L27:
.L28:
	b .L24
.L29:
.L30:
	ldr r4, [fp, #-8]
	ldr r5, addr_n_0
	ldr r6, [r5]
	ldr r5, [fp, #-12]
	sub r7, r6, r5
	sub r6, r7, #1
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L31
	b .L37
.L31:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r6, [fp, #-8]
	add r4, r6, #1
	ldr r6, [fp, #-16]
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [r4]
	cmp r5, r6
	movgt r6, #1
	movle r6, #0
	bgt .L39
	b .L52
.L32:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L22
.L36:
.L37:
	b .L32
.L38:
.L39:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	ldr r4, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r6, [fp, #-8]
	add r4, r6, #1
	ldr r6, [fp, #-16]
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	str r5, [r4]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-8]
	ldr r4, [fp, #-16]
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	str r5, [r6]
	b .L40
.L40:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L30
.L51:
.L52:
	b .L40
.L53:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #48
.L76:
	ldr r4, =10
	ldr r5, addr_n_0
	str r4, [r5]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-48
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =4
	str r6, [r5]
	mov r4, #1
	mov r5, #4
	mov r4, r5, LSL#0
	mov r5, #-48
	add r5, fp, r5
	add r6, r5, r4
	ldr r4, =3
	str r4, [r6]
	mov r5, #2
	mov r4, #4
	mov r5, r4, LSL#1
	mov r4, #-48
	add r6, fp, r4
	add r4, r6, r5
	ldr r5, =9
	str r5, [r4]
	mov r4, #3
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-48
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =2
	str r6, [r5]
	mov r4, #4
	mov r5, #4
	mov r4, r5, LSL#2
	mov r5, #-48
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =0
	str r4, [r5]
	mov r5, #5
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-48
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =1
	str r6, [r4]
	mov r4, #6
	mov r6, #4
	mul r5, r4, r6
	mov r4, #-48
	add r4, fp, r4
	add r6, r4, r5
	ldr r5, =6
	str r5, [r6]
	mov r4, #7
	mov r6, #4
	mul r5, r4, r6
	mov r4, #-48
	add r6, fp, r4
	add r4, r6, r5
	ldr r6, =5
	str r6, [r4]
	mov r4, #8
	mov r5, #4
	mov r4, r5, LSL#3
	mov r5, #-48
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =7
	str r4, [r5]
	mov r5, #9
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-48
	add r4, fp, r5
	add r5, r4, r6
	ldr r4, =8
	str r4, [r5]
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-48
	add r5, fp, r5
	add r4, r5, r6
	mov r0, r4
	bl bubblesort
	mov r4, r0
	str r4, [fp, #-8]
	b .L101
.L101:
	ldr r5, [fp, #-8]
	ldr r4, addr_n_0
	ldr r6, [r4]
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L102
	b .L107
.L102:
	ldr r4, [fp, #-8]
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-48
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [r5]
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r5, =10
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	ldr r5, [fp, #-8]
	add r4, r5, #1
	str r4, [fp, #-8]
	b .L101
.L103:
	mov r0, #0
	add sp, sp, #48
	pop {r4, r5, r6, fp, lr}
	bx lr

.L106:
.L107:
	b .L103
.L108:
addr_n_0:
	.word n
