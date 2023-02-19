	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global lengthOfLastWord
	.type lengthOfLastWord , %function
lengthOfLastWord:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L23:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r4, [fp, #-12]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	beq .L29
	b .L33
.L29:
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L30:
	ldr r4, [fp, #-12]
	sub r5, r4, #1
	str r5, [fp, #-8]
	b .L37
.L32:
.L33:
	b .L30
.L34:
.L37:
	ldr r4, [fp, #-8]
	ldr r5, =0
	sub r6, r5, #1
	cmp r4, r6
	movgt r4, #1
	movle r4, #0
	bgt .L40
	b .L43
.L38:
	ldr r5, [fp, #-8]
	sub r4, r5, #1
	str r4, [fp, #-8]
	b .L37
.L39:
	ldr r5, [fp, #-8]
	ldr r4, =0
	sub r6, r4, #1
	cmp r5, r6
	moveq r5, #1
	movne r5, #0
	beq .L54
	b .L58
.L40:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	cmp r5, #0
	moveq r5, #1
	movne r5, #0
	beq .L38
	b .L51
.L42:
.L43:
	b .L39
.L44:
.L50:
.L51:
	b .L39
.L52:
.L54:
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L55:
	ldr r4, [fp, #-8]
	str r4, [fp, #-4]
	b .L62
.L57:
.L58:
	b .L55
.L59:
.L62:
	ldr r5, [fp, #-4]
	ldr r4, =0
	sub r6, r4, #1
	cmp r5, r6
	movgt r5, #1
	movle r5, #0
	bgt .L63
	b .L67
.L63:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	cmp r5, #0
	moveq r5, #1
	movne r5, #0
	beq .L69
	b .L77
.L64:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sub r6, r4, r5
	mov r0, r6
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L66:
.L67:
	b .L64
.L68:
.L69:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-4]
	sub r6, r4, r5
	sub r4, r6, #1
	ldr r5, [fp, #-12]
	sub r6, r5, #1
	ldr r5, [fp, #-8]
	sub r7, r6, r5
	sub r6, r4, r7
	mov r0, r6
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L70:
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L62
.L76:
.L77:
	b .L70
.L78:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #44
.L86:
	ldr r4, =0
	sub r5, r4, #4
	mov r4, #0
	mov r6, #4
	mul r7, r4, r6
	mov r4, #-40
	add r4, fp, r4
	add r6, r4, r7
	str r5, [r6]
	mov r4, #1
	mov r4, #4
	mov r5, r4, LSL#0
	mov r4, #-40
	add r4, fp, r4
	add r6, r4, r5
	ldr r5, =3
	str r5, [r6]
	mov r4, #2
	mov r5, #4
	mov r4, r5, LSL#1
	mov r5, #-40
	add r5, fp, r5
	add r6, r5, r4
	ldr r4, =9
	str r4, [r6]
	ldr r5, =0
	sub r4, r5, #2
	mov r5, #3
	mov r6, #4
	mul r7, r5, r6
	mov r5, #-40
	add r5, fp, r5
	add r6, r5, r7
	str r4, [r6]
	mov r4, #4
	mov r4, #4
	mov r5, r4, LSL#2
	mov r4, #-40
	add r6, fp, r4
	add r4, r6, r5
	ldr r5, =0
	str r5, [r4]
	mov r4, #5
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-40
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =1
	str r5, [r4]
	ldr r4, =0
	sub r5, r4, #6
	mov r4, #6
	mov r6, #4
	mul r7, r4, r6
	mov r4, #-40
	add r6, fp, r4
	add r4, r6, r7
	str r5, [r4]
	mov r5, #7
	mov r6, #4
	mul r4, r5, r6
	mov r6, #-40
	add r6, fp, r6
	add r5, r6, r4
	ldr r4, =5
	str r4, [r5]
	mov r5, #8
	mov r5, #4
	mov r4, r5, LSL#3
	mov r5, #-40
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =7
	str r4, [r5]
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
	bl lengthOfLastWord
	mov r5, r0
	str r5, [fp, #-44]
	ldr r4, [fp, #-44]
	mov r0, r4
	add sp, sp, #44
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

