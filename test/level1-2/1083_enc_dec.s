	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global enc
	.type enc , %function
enc:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L10:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #25
	movgt r4, #1
	movle r4, #0
	bgt .L13
	b .L18
.L13:
	ldr r4, [fp, #-4]
	add r5, r4, #60
	str r5, [fp, #-4]
	b .L15
.L14:
	ldr r4, [fp, #-4]
	sub r5, r4, #15
	str r5, [fp, #-4]
	b .L15
.L15:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

.L17:
.L18:
	b .L14
.L19:
	.global dec
	.type dec , %function
dec:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L23:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #85
	movgt r4, #1
	movle r4, #0
	bgt .L26
	b .L31
.L26:
	ldr r4, [fp, #-4]
	sub r5, r4, #59
	str r5, [fp, #-4]
	b .L28
.L27:
	ldr r4, [fp, #-4]
	add r5, r4, #14
	str r5, [fp, #-4]
	b .L28
.L28:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

.L30:
.L31:
	b .L27
.L32:
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L36:
	ldr r4, =400
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl enc
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl dec
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	mov r0, #0
	add sp, sp, #8
	pop {r4, fp, lr}
	bx lr

