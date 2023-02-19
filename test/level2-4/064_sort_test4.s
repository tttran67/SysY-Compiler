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
	.global select_sort
	.type select_sort , %function
select_sort:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #24
.L13:
	str r0, [fp, #-24]
	str r1, [fp, #-20]
	ldr r4, =0
	str r4, [fp, #-16]
	b .L22
.L22:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-20]
	sub r6, r5, #1
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L23
	b .L28
.L23:
	ldr r5, [fp, #-16]
	str r5, [fp, #-8]
	ldr r4, [fp, #-16]
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L32
.L24:
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L27:
.L28:
	b .L24
.L29:
.L32:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L33
	b .L38
.L33:
	ldr r5, [fp, #-8]
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
	bgt .L40
	b .L53
.L34:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-16]
	cmp r5, r4
	movne r5, #1
	moveq r5, #0
	bne .L57
	b .L62
.L37:
.L38:
	b .L34
.L39:
.L40:
	ldr r4, [fp, #-12]
	str r4, [fp, #-8]
	b .L41
.L41:
	ldr r5, [fp, #-12]
	add r4, r5, #1
	str r4, [fp, #-12]
	b .L32
.L52:
.L53:
	b .L41
.L54:
.L57:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-24]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-24]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r6, [fp, #-8]
	ldr r4, [fp, #-24]
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-24]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	str r4, [r5]
	b .L58
.L58:
	ldr r4, [fp, #-16]
	add r6, r4, #1
	str r6, [fp, #-16]
	b .L22
.L61:
.L62:
	b .L58
.L63:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #48
.L85:
	ldr r4, =10
	ldr r5, addr_n_0
	str r4, [r5]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-48
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =4
	str r5, [r4]
	mov r4, #1
	mov r5, #4
	mov r4, r5, LSL#0
	mov r5, #-48
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =3
	str r4, [r5]
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
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =2
	str r5, [r4]
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
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-48
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =6
	str r5, [r4]
	mov r4, #7
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-48
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =5
	str r6, [r5]
	mov r4, #8
	mov r5, #4
	mov r4, r5, LSL#3
	mov r5, #-48
	add r5, fp, r5
	add r6, r5, r4
	ldr r4, =7
	str r4, [r6]
	mov r5, #9
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-48
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =8
	str r6, [r4]
	ldr r4, =0
	str r4, [fp, #-8]
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-48
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, addr_n_0
	ldr r5, [r6]
	mov r0, r4
	mov r1, r5
	bl select_sort
	mov r5, r0
	str r5, [fp, #-8]
	b .L111
.L111:
	ldr r4, [fp, #-8]
	ldr r5, addr_n_0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L112
	b .L117
.L112:
	ldr r5, [fp, #-8]
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-48
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [r4]
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putint
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putch
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L111
.L113:
	mov r0, #0
	add sp, sp, #48
	pop {r4, r5, r6, fp, lr}
	bx lr

.L116:
.L117:
	b .L113
.L118:
addr_n_0:
	.word n
