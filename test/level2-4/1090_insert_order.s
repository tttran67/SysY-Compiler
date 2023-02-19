	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global N
	.align 4
	.size N, 4
N:
	.word 0
	.text
	.global insert
	.type insert , %function
insert:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L13:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L21
.L21:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-16]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	cmp r4, r6
	movgt r4, #1
	movle r4, #0
	bgt .L24
	b .L32
.L22:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L21
.L23:
	ldr r4, addr_N_0
	ldr r5, [r4]
	str r5, [fp, #-4]
	b .L41
.L24:
	ldr r4, [fp, #-8]
	ldr r5, addr_N_0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L22
	b .L37
.L31:
.L32:
	b .L23
.L33:
.L36:
.L37:
	b .L23
.L38:
.L41:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-8]
	cmp r5, r4
	movgt r5, #1
	movle r5, #0
	bgt .L42
	b .L47
.L42:
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	ldr r4, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-4]
	ldr r5, [fp, #-16]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-16]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	str r4, [r5]
	ldr r4, [fp, #-4]
	sub r6, r4, #1
	str r6, [fp, #-4]
	b .L41
.L43:
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L46:
.L47:
	b .L43
.L48:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #52
.L64:
	ldr r4, =10
	ldr r5, addr_N_0
	str r4, [r5]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-52
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =1
	str r5, [r4]
	mov r4, #1
	mov r5, #4
	mov r4, r5, LSL#0
	mov r5, #-52
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =3
	str r4, [r5]
	mov r5, #2
	mov r4, #4
	mov r5, r4, LSL#1
	mov r4, #-52
	add r6, fp, r4
	add r4, r6, r5
	ldr r5, =4
	str r5, [r4]
	mov r4, #3
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-52
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =7
	str r5, [r4]
	mov r4, #4
	mov r5, #4
	mov r4, r5, LSL#2
	mov r5, #-52
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =8
	str r4, [r5]
	mov r5, #5
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-52
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =11
	str r6, [r4]
	mov r4, #6
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-52
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =13
	str r5, [r4]
	mov r4, #7
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-52
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =18
	str r5, [r4]
	mov r4, #8
	mov r5, #4
	mov r4, r5, LSL#3
	mov r5, #-52
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =56
	str r4, [r5]
	mov r5, #9
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-52
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =78
	str r6, [r4]
	ldr r4, =0
	str r4, [fp, #-4]
	bl getint
	mov r5, r0
	str r5, [fp, #-8]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-52
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, [fp, #-8]
	mov r0, r4
	mov r1, r5
	bl insert
	mov r5, r0
	str r5, [fp, #-8]
	b .L91
.L91:
	ldr r4, [fp, #-4]
	ldr r5, addr_N_0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L92
	b .L97
.L92:
	ldr r5, [fp, #-4]
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-52
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [r4]
	str r6, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r0, r5
	bl putint
	ldr r4, =10
	str r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r0, r5
	bl putch
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L91
.L93:
	mov r0, #0
	add sp, sp, #52
	pop {r4, r5, r6, fp, lr}
	bx lr

.L96:
.L97:
	b .L93
.L98:
addr_N_0:
	.word N
