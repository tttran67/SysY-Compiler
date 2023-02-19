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
	.global counting_sort
	.type counting_sort , %function
counting_sort:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #64
.L21:
	str r0, [fp, #-64]
	str r1, [fp, #-60]
	str r2, [fp, #-56]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L34
.L34:
	ldr r4, [fp, #-4]
	cmp r4, #10
	movlt r4, #1
	movge r4, #0
	blt .L35
	b .L39
.L35:
	ldr r4, [fp, #-4]
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-52
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =0
	str r6, [r5]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L34
.L36:
	b .L45
.L38:
.L39:
	b .L36
.L40:
.L45:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-56]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L46
	b .L51
.L46:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-64]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	mov r6, #4
	mul r5, r4, r6
	mov r6, #-52
	add r4, fp, r6
	add r6, r4, r5
	ldr r4, [r6]
	add r5, r4, #1
	ldr r6, [fp, #-12]
	ldr r4, [fp, #-64]
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	mov r7, #4
	mul r6, r4, r7
	mov r7, #-52
	add r7, fp, r7
	add r4, r7, r6
	str r5, [r4]
	ldr r4, [fp, #-12]
	add r6, r4, #1
	str r6, [fp, #-12]
	b .L45
.L47:
	ldr r5, =1
	str r5, [fp, #-4]
	b .L69
.L50:
.L51:
	b .L47
.L52:
.L69:
	ldr r4, [fp, #-4]
	cmp r4, #10
	movlt r5, #1
	movge r5, #0
	blt .L70
	b .L74
.L70:
	ldr r4, [fp, #-4]
	mov r6, #4
	mul r5, r4, r6
	mov r4, #-52
	add r4, fp, r4
	add r6, r4, r5
	ldr r5, [r6]
	ldr r4, [fp, #-4]
	sub r6, r4, #1
	mov r4, #4
	mul r7, r6, r4
	mov r6, #-52
	add r6, fp, r6
	add r4, r6, r7
	ldr r7, [r4]
	add r6, r5, r7
	ldr r4, [fp, #-4]
	mov r5, #4
	mul r7, r4, r5
	mov r4, #-52
	add r4, fp, r4
	add r5, r4, r7
	str r6, [r5]
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L69
.L71:
	ldr r4, [fp, #-56]
	str r4, [fp, #-8]
	b .L89
.L73:
.L74:
	b .L71
.L75:
.L89:
	ldr r5, [fp, #-8]
	cmp r5, #0
	movgt r4, #1
	movle r4, #0
	bgt .L90
	b .L94
.L90:
	ldr r5, [fp, #-8]
	sub r4, r5, #1
	ldr r5, [fp, #-64]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	mov r6, #4
	mul r4, r5, r6
	mov r6, #-52
	add r6, fp, r6
	add r5, r6, r4
	ldr r4, [r5]
	sub r6, r4, #1
	ldr r5, [fp, #-8]
	sub r4, r5, #1
	ldr r5, [fp, #-64]
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	mov r7, #4
	mul r4, r5, r7
	mov r7, #-52
	add r7, fp, r7
	add r5, r7, r4
	str r6, [r5]
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	ldr r6, [fp, #-64]
	mov r4, #4
	mul r7, r5, r4
	add r5, r6, r7
	ldr r4, [r5]
	ldr r6, [fp, #-8]
	sub r5, r6, #1
	ldr r6, [fp, #-64]
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	ldr r6, [r5]
	mov r7, #4
	mul r5, r6, r7
	mov r7, #-52
	add r7, fp, r7
	add r6, r7, r5
	ldr r5, [r6]
	ldr r7, [fp, #-60]
	mov r6, #4
	mul r8, r5, r6
	add r5, r7, r8
	str r4, [r5]
	ldr r4, [fp, #-8]
	sub r6, r4, #1
	str r6, [fp, #-8]
	b .L89
	b .F0
.LTORG
addr_n_0:
	.word n
.F0:
.L91:
	mov r0, #0
	add sp, sp, #64
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L93:
.L94:
	b .L91
.L95:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #88
.L128:
	ldr r4, =10
	ldr r5, addr_n_1
	str r4, [r5]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-88
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =4
	str r5, [r4]
	mov r4, #1
	mov r5, #4
	mov r4, r5, LSL#0
	mov r5, #-88
	add r5, fp, r5
	add r6, r5, r4
	ldr r4, =3
	str r4, [r6]
	mov r5, #2
	mov r4, #4
	mov r5, r4, LSL#1
	mov r4, #-88
	add r6, fp, r4
	add r4, r6, r5
	ldr r5, =9
	str r5, [r4]
	mov r4, #3
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-88
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =2
	str r5, [r4]
	mov r4, #4
	mov r5, #4
	mov r4, r5, LSL#2
	mov r5, #-88
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =0
	str r4, [r5]
	mov r5, #5
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-88
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =1
	str r6, [r4]
	mov r4, #6
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-88
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =6
	str r6, [r5]
	mov r4, #7
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-88
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =5
	str r5, [r4]
	mov r4, #8
	mov r4, #4
	mov r5, r4, LSL#3
	mov r4, #-88
	add r4, fp, r4
	add r6, r4, r5
	ldr r5, =7
	str r5, [r6]
	mov r4, #9
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-88
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =8
	str r6, [r5]
	ldr r4, =0
	str r4, [fp, #-48]
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-88
	add r4, fp, r5
	add r5, r4, r6
	mov r4, #0
	mov r6, #4
	mul r7, r4, r6
	mov r4, #-44
	add r4, fp, r4
	add r6, r4, r7
	ldr r7, addr_n_1
	ldr r4, [r7]
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl counting_sort
	mov r6, r0
	str r6, [fp, #-48]
	b .L157
.L157:
	ldr r5, [fp, #-48]
	ldr r4, addr_n_1
	ldr r6, [r4]
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L158
	b .L163
.L158:
	ldr r4, [fp, #-48]
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-44
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
	ldr r5, [fp, #-48]
	add r4, r5, #1
	str r4, [fp, #-48]
	b .L157
.L159:
	mov r0, #0
	add sp, sp, #88
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L162:
.L163:
	b .L159
.L164:
addr_n_1:
	.word n
