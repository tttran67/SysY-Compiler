	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L23:
	ldr r4, =5
	str r4, [fp, #-20]
	ldr r4, =5
	str r4, [fp, #-16]
	ldr r4, =1
	str r4, [fp, #-12]
	ldr r4, =0
	sub r5, r4, #2
	str r5, [fp, #-8]
	ldr r4, =2
	str r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r4, =2
	sdiv r6, r5, r4
	cmp r6, #0
	movlt r5, #1
	movge r5, #0
	blt .L29
	b .L34
.L29:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L30
.L30:
	ldr r5, [fp, #-8]
	ldr r4, =2
	sdiv r4, r5, r4
	mov r6, r4, LSL#1
	sub r4, r5, r6
	add r5, r4, #67
	cmp r5, #0
	movlt r5, #1
	movge r5, #0
	blt .L47
	b .L52
.L31:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	sub r6, r4, r5
	cmp r6, #0
	movne r4, #1
	moveq r4, #0
	bne .L36
	b .L40
.L33:
.L34:
	b .L31
.L35:
.L36:
	ldr r5, [fp, #-12]
	add r4, r5, #3
	ldr r5, =2
	sdiv r5, r4, r5
	mov r6, r5, LSL#1
	sub r5, r4, r6
	cmp r5, #0
	movne r4, #1
	moveq r4, #0
	bne .L29
	b .L44
.L39:
.L40:
	b .L30
.L41:
.L43:
.L44:
	b .L30
.L45:
.L47:
	ldr r5, =4
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L48
.L48:
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, fp, lr}
	bx lr

.L49:
	ldr r5, [fp, #-20]
	ldr r4, [fp, #-16]
	sub r6, r5, r4
	cmp r6, #0
	movne r5, #1
	moveq r5, #0
	bne .L54
	b .L58
.L51:
.L52:
	b .L49
.L53:
.L54:
	ldr r4, [fp, #-12]
	add r5, r4, #2
	ldr r4, =2
	sdiv r4, r5, r4
	mov r6, r4, LSL#1
	sub r4, r5, r6
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L47
	b .L62
.L57:
.L58:
	b .L48
.L59:
.L61:
.L62:
	b .L48
.L63:
