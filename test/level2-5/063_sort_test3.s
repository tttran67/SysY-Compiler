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
	.global QuickSort
	.type QuickSort , %function
QuickSort:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #28
.L24:
	str r0, [fp, #-28]
	str r1, [fp, #-24]
	str r2, [fp, #-20]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L32
	b .L37
.L32:
	ldr r5, [fp, #-24]
	str r5, [fp, #-16]
	ldr r4, [fp, #-20]
	str r4, [fp, #-12]
	ldr r5, [fp, #-24]
	ldr r4, [fp, #-28]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-8]
	b .L49
.L33:
	mov r0, #0
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L36:
.L37:
	b .L33
.L38:
.L49:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L50
	b .L55
.L50:
	b .L57
.L51:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-16]
	ldr r6, [fp, #-28]
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	str r5, [r4]
	ldr r4, [fp, #-16]
	sub r5, r4, #1
	str r5, [fp, #-4]
	ldr r5, [fp, #-28]
	ldr r4, [fp, #-24]
	ldr r6, [fp, #-4]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl QuickSort
	mov r5, r0
	str r5, [fp, #-4]
	ldr r4, [fp, #-16]
	add r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl QuickSort
	mov r4, r0
	str r4, [fp, #-4]
	b .L33
.L54:
.L55:
	b .L51
.L56:
.L57:
	ldr r5, [fp, #-16]
	ldr r4, [fp, #-12]
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L60
	b .L64
.L58:
	ldr r4, [fp, #-12]
	sub r5, r4, #1
	str r5, [fp, #-12]
	b .L57
.L59:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L76
	b .L81
.L60:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-28]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-8]
	sub r5, r6, #1
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L58
	b .L73
.L63:
.L64:
	b .L59
.L65:
.L72:
.L73:
	b .L59
.L74:
.L76:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-28]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-16]
	ldr r5, [fp, #-28]
	mov r8, #4
	mul r7, r6, r8
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-16]
	add r5, r4, #1
	str r5, [fp, #-16]
	b .L77
.L77:
	b .L93
.L80:
.L81:
	b .L77
.L82:
.L93:
	ldr r5, [fp, #-16]
	ldr r4, [fp, #-12]
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L96
	b .L100
.L94:
	ldr r4, [fp, #-16]
	add r5, r4, #1
	str r5, [fp, #-16]
	b .L93
.L95:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L112
	b .L117
.L96:
	ldr r5, [fp, #-16]
	ldr r4, [fp, #-28]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-8]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L94
	b .L109
.L99:
.L100:
	b .L95
.L101:
.L108:
.L109:
	b .L95
.L110:
.L112:
	ldr r5, [fp, #-16]
	ldr r4, [fp, #-28]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-12]
	ldr r5, [fp, #-28]
	mov r8, #4
	mul r7, r6, r8
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-12]
	sub r5, r4, #1
	str r5, [fp, #-12]
	b .L113
	b .F0
.LTORG
addr_n_0:
	.word n
.F0:
.L113:
	b .L49
.L116:
.L117:
	b .L113
.L118:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #52
.L145:
	ldr r4, =10
	ldr r5, addr_n_1
	str r4, [r5]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-52
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =4
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
	ldr r5, =9
	str r5, [r4]
	mov r4, #3
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-52
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =2
	str r5, [r4]
	mov r4, #4
	mov r5, #4
	mov r4, r5, LSL#2
	mov r5, #-52
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =0
	str r4, [r5]
	mov r5, #5
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-52
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =1
	str r6, [r4]
	mov r4, #6
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-52
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =6
	str r5, [r4]
	mov r4, #7
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-52
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =5
	str r6, [r5]
	mov r4, #8
	mov r5, #4
	mov r4, r5, LSL#3
	mov r5, #-52
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =7
	str r4, [r5]
	mov r5, #9
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-52
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =8
	str r6, [r4]
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r5, =9
	str r5, [fp, #-8]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-52
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [fp, #-12]
	ldr r4, [fp, #-8]
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl QuickSort
	mov r4, r0
	str r4, [fp, #-12]
	b .L173
.L173:
	ldr r5, [fp, #-12]
	ldr r4, addr_n_1
	ldr r6, [r4]
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L174
	b .L179
.L174:
	ldr r4, [fp, #-12]
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-52
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
	ldr r5, [fp, #-12]
	add r4, r5, #1
	str r4, [fp, #-12]
	b .L173
.L175:
	mov r0, #0
	add sp, sp, #52
	pop {r4, r5, r6, fp, lr}
	bx lr

.L178:
.L179:
	b .L175
.L180:
addr_n_1:
	.word n
