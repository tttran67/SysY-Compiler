	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 7
	.text
	.global func
	.type func , %function
func:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L10:
	ldr r4, addr_a_0
	ldr r5, [r4]
	str r5, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-8]
	cmp r5, r4
	moveq r5, #1
	movne r5, #0
	beq .L14
	b .L20
.L14:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	mov r0, #1
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

.L15:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

.L16:
.L19:
.L20:
	b .L15
.L21:
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L23:
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L26
.L26:
	ldr r4, [fp, #-4]
	cmp r4, #100
	movlt r4, #1
	movge r4, #0
	blt .L27
	b .L31
.L27:
	bl func
	mov r4, r0
	cmp r4, #1
	moveq r4, #1
	movne r4, #0
	beq .L33
	b .L36
.L28:
	ldr r4, [fp, #-8]
	cmp r4, #100
	movlt r4, #1
	movge r4, #0
	blt .L40
	b .L45
.L30:
.L31:
	b .L28
.L32:
.L33:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L34
.L34:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L26
.L35:
.L36:
	b .L34
.L37:
.L40:
	mov r0, #1
	bl putint
	b .L42
.L41:
	mov r0, #0
	bl putint
	b .L42
.L42:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

.L44:
.L45:
	b .L41
.L46:
addr_a_0:
	.word a
