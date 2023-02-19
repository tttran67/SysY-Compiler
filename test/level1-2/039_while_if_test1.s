	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global whileIf
	.type whileIf , %function
whileIf:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L6:
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
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
	cmp r4, #5
	moveq r4, #1
	movne r4, #0
	beq .L16
	b .L21
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
.L16:
	ldr r4, =25
	str r4, [fp, #-4]
	b .L18
.L17:
	ldr r4, [fp, #-8]
	cmp r4, #10
	moveq r4, #1
	movne r4, #0
	beq .L23
	b .L28
.L18:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L9
.L20:
.L21:
	b .L17
.L22:
.L23:
	ldr r4, =42
	str r4, [fp, #-4]
	b .L25
.L24:
	ldr r5, [fp, #-8]
	ldr r4, =2
	mov r4, r5, LSL#1
	str r4, [fp, #-4]
	b .L25
.L25:
	b .L18
.L27:
.L28:
	b .L24
.L29:
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L33:
	bl whileIf
	mov r4, r0
	mov r0, r4
	add sp, sp, #0
	pop {r4, fp, lr}
	bx lr

