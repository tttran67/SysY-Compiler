	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global uniquePaths
	.type uniquePaths , %function
uniquePaths:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #52
.L31:
	str r0, [fp, #-52]
	str r1, [fp, #-48]
	ldr r4, [fp, #-52]
	cmp r4, #1
	moveq r4, #1
	movne r4, #0
	beq .L36
	b .L41
.L36:
	mov r0, #1
	add sp, sp, #52
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L37:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L50
.L38:
	ldr r4, [fp, #-48]
	cmp r4, #1
	moveq r4, #1
	movne r4, #0
	beq .L36
	b .L45
.L40:
.L41:
	b .L38
.L42:
.L44:
.L45:
	b .L37
.L46:
.L50:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-52]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L51
	b .L56
.L51:
	ldr r5, [fp, #-8]
	ldr r4, =3
	mul r6, r5, r4
	ldr r5, [fp, #-48]
	add r4, r6, r5
	sub r5, r4, #1
	mov r6, #4
	mul r4, r5, r6
	mov r6, #-44
	add r6, fp, r6
	add r5, r6, r4
	ldr r4, =1
	str r4, [r5]
	ldr r5, [fp, #-8]
	add r4, r5, #1
	str r4, [fp, #-8]
	b .L50
.L52:
	ldr r5, =0
	str r5, [fp, #-8]
	b .L63
.L55:
.L56:
	b .L52
.L57:
.L63:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-48]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L64
	b .L69
.L64:
	ldr r5, [fp, #-52]
	sub r4, r5, #1
	ldr r5, =3
	mul r6, r4, r5
	ldr r4, [fp, #-8]
	add r5, r6, r4
	mov r4, #4
	mul r6, r5, r4
	mov r4, #-44
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =1
	str r5, [r4]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L63
.L65:
	ldr r4, [fp, #-52]
	sub r5, r4, #2
	str r5, [fp, #-8]
	b .L77
.L68:
.L69:
	b .L65
.L70:
.L77:
	ldr r4, [fp, #-8]
	ldr r5, =0
	sub r6, r5, #1
	cmp r4, r6
	movgt r4, #1
	movle r4, #0
	bgt .L78
	b .L82
.L78:
	ldr r5, [fp, #-48]
	sub r4, r5, #2
	str r4, [fp, #-4]
	b .L85
.L79:
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-44
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [r4]
	mov r0, r6
	add sp, sp, #52
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L81:
.L82:
	b .L79
.L83:
.L85:
	ldr r5, [fp, #-4]
	ldr r4, =0
	sub r6, r4, #1
	cmp r5, r6
	movgt r5, #1
	movle r5, #0
	bgt .L86
	b .L90
.L86:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	ldr r4, =3
	mul r6, r5, r4
	ldr r5, [fp, #-4]
	add r4, r6, r5
	mov r5, #4
	mul r6, r4, r5
	mov r5, #-44
	add r4, fp, r5
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, [fp, #-8]
	ldr r5, =3
	mul r7, r6, r5
	ldr r6, [fp, #-4]
	add r5, r7, r6
	add r6, r5, #1
	mov r7, #4
	mul r5, r6, r7
	mov r7, #-44
	add r7, fp, r7
	add r6, r7, r5
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-8]
	ldr r5, =3
	mul r6, r4, r5
	ldr r4, [fp, #-4]
	add r5, r6, r4
	mov r4, #4
	mul r6, r5, r4
	mov r4, #-44
	add r4, fp, r4
	add r5, r4, r6
	str r7, [r5]
	ldr r5, [fp, #-4]
	sub r4, r5, #1
	str r4, [fp, #-4]
	b .L85
.L87:
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	str r5, [fp, #-8]
	b .L77
	b .F0
.LTORG
.F0:
.L89:
.L90:
	b .L87
.L91:
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L111:
	ldr r4, =3
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl uniquePaths
	mov r4, r0
	str r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r0, r5
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

