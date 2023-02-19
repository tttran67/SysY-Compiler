	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global N
	.align 4
	.size N, 4
N:
	.word 0
	.global newline
	.align 4
	.size newline, 4
newline:
	.word 0
	.text
	.global split
	.type split , %function
split:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L11:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	ldr r4, addr_N_0
	ldr r5, [r4]
	sub r4, r5, #1
	str r4, [fp, #-4]
	b .L19
.L19:
	ldr r5, [fp, #-4]
	ldr r4, =0
	sub r6, r4, #1
	cmp r5, r6
	movne r5, #1
	moveq r5, #0
	bne .L20
	b .L24
.L20:
	ldr r4, [fp, #-12]
	ldr r5, =10
	sdiv r6, r4, r5
	mul r6, r6, r5
	sub r5, r4, r6
	ldr r4, [fp, #-4]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	str r5, [r4]
	ldr r5, [fp, #-12]
	ldr r6, =10
	sdiv r4, r5, r6
	str r4, [fp, #-12]
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L19
.L21:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L23:
.L24:
	b .L21
.L25:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #28
.L33:
	ldr r4, =4
	ldr r5, addr_N_0
	str r4, [r5]
	ldr r4, =10
	ldr r5, addr_newline_0
	str r4, [r5]
	ldr r4, =1478
	str r4, [fp, #-24]
	ldr r5, [fp, #-24]
	mov r4, #0
	mov r6, #4
	mul r7, r4, r6
	mov r4, #-20
	add r4, fp, r4
	add r6, r4, r7
	mov r0, r5
	mov r1, r6
	bl split
	mov r4, r0
	str r4, [fp, #-24]
	ldr r4, =0
	str r4, [fp, #-28]
	b .L41
.L41:
	ldr r5, [fp, #-28]
	cmp r5, #4
	movlt r4, #1
	movge r4, #0
	blt .L42
	b .L46
.L42:
	ldr r5, [fp, #-28]
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-20
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [r4]
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putint
	ldr r4, addr_newline_0
	ldr r5, [r4]
	mov r0, r5
	bl putch
	ldr r4, [fp, #-28]
	add r5, r4, #1
	str r5, [fp, #-28]
	b .L41
.L43:
	mov r0, #0
	add sp, sp, #28
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L45:
.L46:
	b .L43
.L47:
addr_N_0:
	.word N
addr_newline_0:
	.word newline
