	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global doubleWhile
	.type doubleWhile , %function
doubleWhile:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L6:
	ldr r4, =5
	str r4, [fp, #-8]
	ldr r4, =7
	str r4, [fp, #-4]
	b .L9
.L9:
	ldr r4, [fp, #-8]
	cmp r4, #100
	movlt r4, #1
	movge r4, #0
	blt .L10
	b .L14
.L10:
	ldr r4, [fp, #-8]
	add r5, r4, #30
	str r5, [fp, #-8]
	b .L17
.L11:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

.L13:
.L14:
	b .L11
.L15:
.L17:
	ldr r5, [fp, #-4]
	cmp r5, #100
	movlt r4, #1
	movge r4, #0
	blt .L18
	b .L22
.L18:
	ldr r5, [fp, #-4]
	add r4, r5, #6
	str r4, [fp, #-4]
	b .L17
.L19:
	ldr r5, [fp, #-4]
	sub r4, r5, #100
	str r4, [fp, #-4]
	b .L9
.L21:
.L22:
	b .L19
.L23:
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L27:
	bl doubleWhile
	mov r4, r0
	mov r0, r4
	add sp, sp, #0
	pop {r4, fp, lr}
	bx lr

