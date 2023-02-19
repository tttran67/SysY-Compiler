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
	.global factor
	.type factor , %function
factor:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L7:
	str r0, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, =1
	str r4, [fp, #-8]
	b .L12
.L12:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	add r6, r5, #1
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L13
	b .L18
.L13:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-8]
	sdiv r6, r5, r4
	mul r4, r6, r4
	sub r6, r5, r4
	cmp r6, #0
	moveq r5, #1
	movne r5, #0
	beq .L20
	b .L25
.L14:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr

.L17:
.L18:
	b .L14
.L19:
.L20:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-8]
	add r6, r5, r4
	str r6, [fp, #-4]
	b .L21
.L21:
	ldr r5, [fp, #-8]
	add r4, r5, #1
	str r4, [fp, #-8]
	b .L12
.L24:
.L25:
	b .L21
.L26:
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L31:
	ldr r4, =4
	ldr r5, addr_N_0
	str r4, [r5]
	ldr r4, =10
	ldr r5, addr_newline_0
	str r4, [r5]
	ldr r4, =1478
	str r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl factor
	mov r4, r0
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

addr_N_0:
	.word N
addr_newline_0:
	.word newline
