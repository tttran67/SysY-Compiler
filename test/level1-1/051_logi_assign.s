	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 0
	.global b
	.align 4
	.size b, 4
b:
	.word 0
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L5:
	bl getint
	mov r4, r0
	ldr r5, addr_a_0
	str r4, [r5]
	bl getint
	mov r4, r0
	ldr r5, addr_b_0
	str r4, [r5]
	ldr r4, addr_a_0
	ldr r5, [r4]
	ldr r4, addr_b_0
	ldr r6, [r4]
	cmp r5, r6
	moveq r5, #1
	movne r5, #0
	beq .L10
	b .L14
.L7:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L9
.L8:
	ldr r5, =0
	str r5, [fp, #-4]
	b .L9
.L9:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr

.L10:
	ldr r5, addr_a_0
	ldr r4, [r5]
	cmp r4, #3
	movne r5, #1
	moveq r5, #0
	bne .L7
	b .L18
.L13:
.L14:
	b .L8
.L15:
.L17:
.L18:
	b .L8
.L19:
addr_a_0:
	.word a
addr_b_0:
	.word b
