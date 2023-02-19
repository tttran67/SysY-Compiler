	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global get_one
	.type get_one , %function
get_one:
	push {fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L11:
	str r0, [fp, #-4]
	mov r0, #1
	add sp, sp, #4
	pop {fp, lr}
	bx lr

	.global deepWhileBr
	.type deepWhileBr , %function
deepWhileBr:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L14:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	add r6, r4, r5
	str r6, [fp, #-12]
	b .L22
.L22:
	ldr r4, [fp, #-12]
	cmp r4, #75
	movlt r5, #1
	movge r5, #0
	blt .L23
	b .L27
.L23:
	ldr r4, =42
	str r4, [fp, #-8]
	ldr r5, [fp, #-12]
	cmp r5, #100
	movlt r4, #1
	movge r4, #0
	blt .L30
	b .L34
.L24:
	ldr r5, [fp, #-12]
	mov r0, r5
	add sp, sp, #20
	pop {r4, r5, r6, fp, lr}
	bx lr

.L26:
.L27:
	b .L24
.L28:
.L30:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	str r6, [fp, #-12]
	ldr r4, [fp, #-12]
	cmp r4, #99
	movgt r5, #1
	movle r5, #0
	bgt .L38
	b .L42
.L31:
	b .L22
.L33:
.L34:
	b .L31
.L35:
.L38:
	ldr r4, [fp, #-8]
	ldr r5, =2
	mov r5, r4, LSL#1
	str r5, [fp, #-4]
	mov r0, #0
	bl get_one
	mov r4, r0
	cmp r4, #1
	moveq r5, #1
	movne r5, #0
	beq .L46
	b .L49
.L39:
	b .L31
.L41:
.L42:
	b .L39
.L43:
.L46:
	ldr r4, [fp, #-4]
	ldr r5, =2
	mov r5, r4, LSL#1
	str r5, [fp, #-12]
	b .L47
.L47:
	b .L39
.L48:
.L49:
	b .L47
.L50:
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L53:
	ldr r4, =2
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl deepWhileBr
	mov r4, r0
	str r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putint
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

