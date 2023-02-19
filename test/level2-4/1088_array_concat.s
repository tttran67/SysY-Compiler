	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global concat
	.type concat , %function
concat:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L12:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	str r2, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L23
.L23:
	ldr r4, [fp, #-8]
	cmp r4, #3
	movlt r4, #1
	movge r4, #0
	blt .L24
	b .L28
.L24:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-20]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r6, [fp, #-8]
	ldr r4, [fp, #-12]
	mov r8, #4
	mul r7, r6, r8
	add r6, r4, r7
	str r5, [r6]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L23
.L25:
	ldr r5, =0
	str r5, [fp, #-4]
	b .L41
.L27:
.L28:
	b .L25
.L29:
.L41:
	ldr r4, [fp, #-4]
	cmp r4, #3
	movlt r5, #1
	movge r5, #0
	blt .L42
	b .L46
.L42:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r6, [fp, #-8]
	ldr r4, [fp, #-12]
	mov r8, #4
	mul r7, r6, r8
	add r6, r4, r7
	str r5, [r6]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L41
.L43:
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L45:
.L46:
	b .L43
.L47:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #104
.L59:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L70
.L70:
	ldr r4, [fp, #-8]
	cmp r4, #3
	movlt r4, #1
	movge r4, #0
	blt .L71
	b .L75
.L71:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	mov r5, #-104
	add r5, fp, r5
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	mov r5, #-92
	add r5, fp, r5
	add r6, r5, r7
	str r4, [r6]
	ldr r6, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r4, #4
	mul r7, r5, r4
	mov r5, #-80
	add r4, fp, r5
	add r5, r4, r7
	str r6, [r5]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	mov r5, #-68
	add r5, fp, r5
	add r6, r5, r7
	str r4, [r6]
	ldr r6, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r4, #4
	mul r7, r5, r4
	mov r5, #-56
	add r5, fp, r5
	add r4, r5, r7
	str r6, [r4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	mov r5, #-44
	add r5, fp, r5
	add r6, r5, r7
	str r4, [r6]
	ldr r6, [fp, #-8]
	add r5, r6, #1
	str r5, [fp, #-8]
	b .L70
.L72:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-104
	add r5, fp, r4
	add r4, r5, r6
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	mov r5, #-68
	add r5, fp, r5
	add r6, r5, r7
	mov r7, #0
	mov r8, #4
	mul r5, r7, r8
	mov r7, #-32
	add r7, fp, r7
	add r8, r7, r5
	mov r0, r4
	mov r1, r6
	mov r2, r8
	bl concat
	mov r4, r0
	str r4, [fp, #-8]
	b .L109
.L74:
.L75:
	b .L72
.L76:
.L109:
	ldr r4, [fp, #-8]
	cmp r4, #6
	movlt r5, #1
	movge r5, #0
	blt .L110
	b .L114
.L110:
	ldr r4, [fp, #-8]
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-32
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [r5]
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r5, [fp, #-8]
	add r4, r5, #1
	str r4, [fp, #-8]
	b .L109
.L111:
	ldr r5, =10
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	mov r0, #0
	add sp, sp, #104
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L113:
.L114:
	b .L111
.L115:
