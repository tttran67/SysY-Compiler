	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global k
	.align 4
	.size k, 4
k:
	.word 0
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L9:
	ldr r4, =3389
	ldr r5, addr_k_0
	str r4, [r5]
	ldr r4, addr_k_0
	ldr r5, [r4]
	ldr r4, =10000
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L10
	b .L14
.L10:
	ldr r4, addr_k_0
	ldr r5, [r4]
	add r4, r5, #1
	ldr r5, addr_k_0
	str r4, [r5]
	ldr r4, =112
	str r4, [fp, #-16]
	b .L18
.L11:
	ldr r5, addr_k_0
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #16
	pop {r4, r5, r6, fp, lr}
	bx lr

.L13:
.L14:
	b .L11
.L15:
.L18:
	ldr r5, [fp, #-16]
	cmp r5, #10
	movgt r4, #1
	movle r4, #0
	bgt .L19
	b .L23
.L19:
	ldr r5, [fp, #-16]
	sub r4, r5, #88
	str r4, [fp, #-16]
	ldr r5, [fp, #-16]
	ldr r4, =1000
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L26
	b .L30
.L20:
	ldr r4, [fp, #-16]
	mov r0, r4
	bl putint
	b .L11
.L22:
.L23:
	b .L20
.L24:
.L26:
	ldr r5, =9
	str r5, [fp, #-12]
	ldr r4, =11
	str r4, [fp, #-8]
	ldr r5, =10
	str r5, [fp, #-12]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	sub r6, r4, r5
	str r6, [fp, #-16]
	ldr r4, =11
	str r4, [fp, #-4]
	ldr r5, [fp, #-16]
	ldr r4, [fp, #-4]
	add r6, r5, r4
	ldr r5, [fp, #-8]
	add r4, r6, r5
	str r4, [fp, #-16]
	b .L27
.L27:
	b .L18
.L29:
.L30:
	b .L27
.L31:
addr_k_0:
	.word k
