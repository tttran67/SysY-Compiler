	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global ifElseIf
	.type ifElseIf , %function
ifElseIf:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L14:
	ldr r4, =5
	str r4, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	cmp r4, #6
	moveq r4, #1
	movne r4, #0
	beq .L17
	b .L23
.L17:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr

.L18:
	ldr r4, [fp, #-4]
	cmp r4, #10
	moveq r4, #1
	movne r4, #0
	beq .L33
	b .L36
.L19:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr

.L20:
	ldr r4, [fp, #-4]
	cmp r4, #11
	moveq r4, #1
	movne r4, #0
	beq .L17
	b .L27
.L22:
.L23:
	b .L20
.L24:
.L26:
.L27:
	b .L18
.L28:
.L30:
	ldr r4, =25
	str r4, [fp, #-8]
	b .L32
.L31:
	ldr r4, [fp, #-4]
	cmp r4, #10
	moveq r4, #1
	movne r4, #0
	beq .L45
	b .L48
.L32:
	b .L19
.L33:
	ldr r4, [fp, #-8]
	cmp r4, #1
	moveq r4, #1
	movne r4, #0
	beq .L30
	b .L40
.L35:
.L36:
	b .L31
.L37:
.L39:
.L40:
	b .L31
.L41:
.L42:
	ldr r4, [fp, #-8]
	add r5, r4, #15
	str r5, [fp, #-8]
	b .L44
.L43:
	ldr r4, [fp, #-8]
	ldr r5, =0
	sub r6, r5, r4
	str r6, [fp, #-8]
	b .L44
.L44:
	b .L32
.L45:
	ldr r4, [fp, #-8]
	ldr r5, =0
	sub r6, r5, #5
	cmp r4, r6
	moveq r4, #1
	movne r4, #0
	beq .L42
	b .L52
.L47:
.L48:
	b .L43
.L49:
.L51:
.L52:
	b .L43
.L53:
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L57:
	bl ifElseIf
	mov r4, r0
	mov r0, r4
	bl putint
	mov r0, #0
	add sp, sp, #0
	pop {r4, fp, lr}
	bx lr

