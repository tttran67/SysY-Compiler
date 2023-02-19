	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global canJump
	.type canJump , %function
canJump:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #56
.L22:
	str r0, [fp, #-56]
	str r1, [fp, #-52]
	ldr r4, [fp, #-52]
	cmp r4, #1
	moveq r4, #1
	movne r4, #0
	beq .L28
	b .L32
.L28:
	mov r0, #1
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L29:
	ldr r4, [fp, #-56]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-52]
	sub r5, r6, #2
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	bgt .L34
	b .L42
.L31:
.L32:
	b .L29
.L33:
.L34:
	mov r0, #1
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L35:
	ldr r5, =0
	str r5, [fp, #-8]
	b .L46
.L41:
.L42:
	b .L35
.L43:
.L46:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-52]
	sub r6, r5, #1
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L47
	b .L52
.L47:
	ldr r5, [fp, #-8]
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-48
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =0
	str r6, [r4]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L46
.L48:
	ldr r4, [fp, #-52]
	sub r5, r4, #1
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-48
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =1
	str r6, [r4]
	ldr r4, [fp, #-52]
	sub r5, r4, #2
	str r5, [fp, #-8]
	b .L62
.L51:
.L52:
	b .L48
.L53:
.L62:
	ldr r4, [fp, #-8]
	ldr r5, =0
	sub r6, r5, #1
	cmp r4, r6
	movgt r4, #1
	movle r4, #0
	bgt .L63
	b .L67
.L63:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-56]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-52]
	sub r5, r6, #1
	ldr r6, [fp, #-8]
	sub r7, r5, r6
	cmp r4, r7
	movlt r5, #1
	movge r5, #0
	blt .L70
	b .L81
.L64:
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-48
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [r4]
	mov r0, r6
	add sp, sp, #56
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L66:
.L67:
	b .L64
.L68:
.L70:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-56]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	b .L72
.L71:
	ldr r4, [fp, #-52]
	sub r5, r4, #1
	ldr r4, [fp, #-8]
	sub r6, r5, r4
	str r6, [fp, #-4]
	b .L72
.L72:
	b .L90
.L80:
.L81:
	b .L71
.L82:
.L90:
	ldr r5, [fp, #-4]
	ldr r4, =0
	sub r6, r4, #1
	cmp r5, r6
	movgt r5, #1
	movle r5, #0
	bgt .L91
	b .L95
.L91:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	mov r4, #4
	mul r5, r6, r4
	mov r4, #-48
	add r4, fp, r4
	add r6, r4, r5
	ldr r5, [r6]
	cmp r5, #0
	movne r4, #1
	moveq r4, #0
	bne .L97
	b .L105
.L92:
	ldr r5, [fp, #-8]
	sub r4, r5, #1
	str r4, [fp, #-8]
	b .L62
.L94:
.L95:
	b .L92
.L96:
.L97:
	ldr r5, [fp, #-8]
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-48
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =1
	str r6, [r4]
	b .L98
	b .F0
.LTORG
.F0:
.L98:
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L90
.L104:
.L105:
	b .L98
.L106:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #44
.L115:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-40
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =3
	str r6, [r5]
	mov r4, #1
	mov r5, #4
	mov r4, r5, LSL#0
	mov r5, #-40
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =3
	str r4, [r5]
	mov r5, #2
	mov r4, #4
	mov r5, r4, LSL#1
	mov r4, #-40
	add r6, fp, r4
	add r4, r6, r5
	ldr r5, =9
	str r5, [r4]
	mov r4, #3
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-40
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =0
	str r5, [r4]
	mov r4, #4
	mov r5, #4
	mov r4, r5, LSL#2
	mov r5, #-40
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =0
	str r4, [r5]
	mov r5, #5
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-40
	add r4, fp, r5
	add r5, r4, r6
	ldr r4, =1
	str r4, [r5]
	mov r5, #6
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-40
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =1
	str r6, [r4]
	mov r4, #7
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-40
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =5
	str r5, [r4]
	mov r4, #8
	mov r5, #4
	mov r4, r5, LSL#3
	mov r5, #-40
	add r5, fp, r5
	add r6, r5, r4
	ldr r4, =7
	str r4, [r6]
	mov r5, #9
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-40
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =8
	str r6, [r4]
	ldr r4, =10
	str r4, [fp, #-44]
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-40
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [fp, #-44]
	mov r0, r4
	mov r1, r6
	bl canJump
	mov r5, r0
	str r5, [fp, #-44]
	ldr r4, [fp, #-44]
	mov r0, r4
	add sp, sp, #44
	pop {r4, r5, r6, fp, lr}
	bx lr

