	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #116
.L6:
	mov r4, #0
	mov r5, #20
	mul r6, r4, r5
	mov r4, #-116
	add r4, fp, r4
	add r5, r4, r6
	mov r6, #0
	mov r4, #4
	mul r7, r6, r4
	add r6, r5, r7
	ldr r4, =1
	str r4, [r6]
	mov r5, #0
	mov r4, #20
	mul r7, r5, r4
	mov r5, #-116
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =1
	str r4, [r5]
	mov r6, #0
	mov r4, #20
	mul r7, r6, r4
	mov r6, #-116
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =1
	str r4, [r6]
	mov r5, #0
	mov r4, #20
	mul r7, r5, r4
	mov r5, #-116
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =1
	str r4, [r5]
	mov r6, #0
	mov r4, #20
	mul r7, r6, r4
	mov r6, #-116
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =1
	str r6, [r4]
	mov r5, #1
	mov r6, #20
	mov r5, r6, LSL#0
	mov r6, #-116
	add r6, fp, r6
	add r7, r6, r5
	add r5, r4, #4
	ldr r4, =2
	str r4, [r5]
	mov r6, #1
	mov r4, #20
	mov r6, r4, LSL#0
	mov r4, #-116
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =2
	str r5, [r6]
	mov r4, #1
	mov r4, #20
	mov r5, r4, LSL#0
	mov r4, #-116
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =2
	str r6, [r5]
	mov r4, #1
	mov r4, #20
	mov r6, r4, LSL#0
	mov r4, #-116
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =2
	str r5, [r6]
	mov r4, #1
	mov r4, #20
	mov r5, r4, LSL#0
	mov r4, #-116
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =2
	str r6, [r5]
	mov r4, #2
	mov r6, #20
	mov r4, r6, LSL#1
	mov r6, #-116
	add r6, fp, r6
	add r6, r6, r4
	add r4, r5, #4
	ldr r5, =3
	str r5, [r4]
	mov r6, #2
	mov r5, #20
	mov r6, r5, LSL#1
	mov r5, #-116
	add r5, fp, r5
	add r5, r5, r6
	add r6, r4, #4
	ldr r4, =3
	str r4, [r6]
	mov r5, #2
	mov r4, #20
	mov r5, r4, LSL#1
	mov r4, #-116
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r6, =3
	str r6, [r5]
	mov r4, #2
	mov r4, #20
	mov r6, r4, LSL#1
	mov r4, #-116
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =3
	str r5, [r6]
	mov r4, #2
	mov r4, #20
	mov r5, r4, LSL#1
	mov r4, #-116
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r6, =3
	str r6, [r5]
	mov r4, #3
	mov r6, #20
	mul r7, r4, r6
	mov r4, #-116
	add r4, fp, r4
	add r6, r4, r7
	add r6, r5, #4
	ldr r4, =4
	str r4, [r6]
	mov r5, #3
	mov r7, #20
	mul r4, r5, r7
	mov r5, #-116
	add r5, fp, r5
	add r7, r5, r4
	add r4, r6, #4
	ldr r5, =4
	str r5, [r4]
	mov r6, #3
	mov r5, #20
	mul r7, r6, r5
	mov r6, #-116
	add r5, fp, r6
	add r6, r5, r7
	add r5, r4, #4
	ldr r6, =4
	str r6, [r5]
	mov r4, #3
	mov r6, #20
	mul r7, r4, r6
	mov r4, #-116
	add r6, fp, r4
	add r4, r6, r7
	add r4, r5, #4
	ldr r6, =4
	str r6, [r4]
	mov r5, #3
	mov r6, #20
	mul r7, r5, r6
	mov r5, #-116
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =4
	str r5, [r6]
	mov r4, #4
	mov r5, #20
	mov r4, r5, LSL#2
	mov r5, #-116
	add r5, fp, r5
	add r7, r5, r4
	add r4, r6, #4
	ldr r6, =5
	str r6, [r4]
	mov r5, #4
	mov r5, #20
	mov r6, r5, LSL#2
	mov r5, #-116
	add r5, fp, r5
	add r5, r5, r6
	add r6, r4, #4
	ldr r4, =5
	str r4, [r6]
	mov r5, #4
	mov r5, #20
	mov r4, r5, LSL#2
	mov r5, #-116
	add r5, fp, r5
	add r7, r5, r4
	add r4, r6, #4
	ldr r6, =5
	str r6, [r4]
	mov r5, #4
	mov r5, #20
	mov r6, r5, LSL#2
	mov r5, #-116
	add r5, fp, r5
	add r5, r5, r6
	add r6, r4, #4
	ldr r4, =5
	str r4, [r6]
	mov r5, #4
	mov r5, #20
	mov r4, r5, LSL#2
	mov r5, #-116
	add r5, fp, r5
	add r7, r5, r4
	add r4, r6, #4
	ldr r6, =5
	str r6, [r4]
	ldr r4, =2
	str r4, [fp, #-16]
	ldr r5, =3
	str r5, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L62
	b .F0
.LTORG
.F0:
.L62:
	ldr r5, [fp, #-4]
	cmp r5, #5
	movlt r4, #1
	movge r4, #0
	blt .L63
	b .L67
.L63:
	ldr r5, [fp, #-16]
	sub r4, r5, #1
	mov r5, #20
	mul r6, r4, r5
	mov r4, #-116
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r4, r6, r7
	add r6, r5, r4
	ldr r5, [r6]
	str r5, [fp, #-8]
	ldr r4, [fp, #-12]
	sub r5, r4, #1
	mov r4, #20
	mul r6, r5, r4
	mov r5, #-116
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [fp, #-4]
	mov r5, #4
	mul r7, r6, r5
	add r6, r4, r7
	ldr r4, [r6]
	ldr r5, [fp, #-16]
	sub r6, r5, #1
	mov r5, #20
	mul r7, r6, r5
	mov r6, #-116
	add r6, fp, r6
	add r5, r6, r7
	ldr r7, [fp, #-4]
	mov r6, #4
	mul r8, r7, r6
	add r7, r5, r8
	str r4, [r7]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	sub r6, r5, #1
	mov r5, #20
	mul r7, r6, r5
	mov r6, #-116
	add r6, fp, r6
	add r5, r6, r7
	ldr r7, [fp, #-4]
	mov r6, #4
	mul r8, r7, r6
	add r7, r5, r8
	str r4, [r7]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L62
.L64:
	mov r5, #2
	mov r4, #20
	mov r5, r4, LSL#1
	mov r4, #-116
	add r6, fp, r4
	add r4, r6, r5
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #116
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L66:
.L67:
	b .L64
.L68:
