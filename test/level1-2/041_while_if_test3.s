	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global deepWhileBr
	.type deepWhileBr , %function
deepWhileBr:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L9:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	add r6, r4, r5
	str r6, [fp, #-12]
	b .L17
.L17:
	ldr r4, [fp, #-12]
	cmp r4, #75
	movlt r5, #1
	movge r5, #0
	blt .L18
	b .L22
.L18:
	ldr r4, =42
	str r4, [fp, #-8]
	ldr r5, [fp, #-12]
	cmp r5, #100
	movlt r4, #1
	movge r4, #0
	blt .L25
	b .L29
.L19:
	ldr r5, [fp, #-12]
	mov r0, r5
	add sp, sp, #20
	pop {r4, r5, r6, fp, lr}
	bx lr

.L21:
.L22:
	b .L19
.L23:
.L25:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	str r6, [fp, #-12]
	ldr r4, [fp, #-12]
	cmp r4, #99
	movgt r5, #1
	movle r5, #0
	bgt .L33
	b .L37
.L26:
	b .L17
.L28:
.L29:
	b .L26
.L30:
.L33:
	ldr r4, [fp, #-8]
	ldr r5, =2
	mov r5, r4, LSL#1
	str r5, [fp, #-4]
	ldr r4, =1
	cmp r4, #1
	moveq r5, #1
	movne r5, #0
	beq .L41
	b .L44
.L34:
	b .L26
.L36:
.L37:
	b .L34
.L38:
.L41:
	ldr r4, [fp, #-4]
	ldr r5, =2
	mov r5, r4, LSL#1
	str r5, [fp, #-12]
	b .L42
.L42:
	b .L34
.L43:
.L44:
	b .L42
.L45:
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L48:
	ldr r4, =2
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl deepWhileBr
	mov r4, r0
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

