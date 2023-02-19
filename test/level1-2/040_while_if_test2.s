	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global ifWhile
	.type ifWhile , %function
ifWhile:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L8:
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =3
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	cmp r4, #5
	moveq r4, #1
	movne r4, #0
	beq .L11
	b .L16
.L11:
	b .L18
.L12:
	b .L27
.L13:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

.L15:
.L16:
	b .L12
.L17:
.L18:
	ldr r4, [fp, #-4]
	cmp r4, #2
	moveq r4, #1
	movne r4, #0
	beq .L19
	b .L23
.L19:
	ldr r4, [fp, #-4]
	add r5, r4, #2
	str r5, [fp, #-4]
	b .L18
.L20:
	ldr r4, [fp, #-4]
	add r5, r4, #25
	str r5, [fp, #-4]
	b .L13
.L22:
.L23:
	b .L20
.L24:
.L27:
	ldr r4, [fp, #-8]
	cmp r4, #5
	movlt r5, #1
	movge r5, #0
	blt .L28
	b .L32
.L28:
	ldr r4, [fp, #-4]
	ldr r5, =2
	mov r5, r4, LSL#1
	str r5, [fp, #-4]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L27
.L29:
	b .L13
.L31:
.L32:
	b .L29
.L33:
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L37:
	bl ifWhile
	mov r4, r0
	mov r0, r4
	add sp, sp, #0
	pop {r4, fp, lr}
	bx lr

