	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global removeElement
	.type removeElement , %function
removeElement:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L6:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L15
.L15:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L16
	b .L21
.L16:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-8]
	cmp r4, r6
	moveq r4, #1
	movne r4, #0
	beq .L23
	b .L33
.L17:
	ldr r5, [fp, #-12]
	mov r0, r5
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L20:
.L21:
	b .L17
.L22:
.L23:
	ldr r4, [fp, #-12]
	sub r5, r4, #1
	ldr r4, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-4]
	ldr r5, [fp, #-16]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-12]
	sub r5, r4, #1
	str r5, [fp, #-12]
	b .L25
.L24:
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L25
.L25:
	b .L15
.L32:
.L33:
	b .L24
.L34:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #48
.L47:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-44
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =3
	str r6, [r5]
	mov r4, #1
	mov r5, #4
	mov r4, r5, LSL#0
	mov r5, #-44
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =3
	str r4, [r5]
	mov r5, #2
	mov r4, #4
	mov r5, r4, LSL#1
	mov r4, #-44
	add r6, fp, r4
	add r4, r6, r5
	ldr r5, =9
	str r5, [r4]
	mov r4, #3
	mov r6, #4
	mul r5, r4, r6
	mov r4, #-44
	add r6, fp, r4
	add r4, r6, r5
	ldr r6, =0
	str r6, [r4]
	mov r4, #4
	mov r5, #4
	mov r4, r5, LSL#2
	mov r5, #-44
	add r5, fp, r5
	add r6, r5, r4
	ldr r4, =0
	str r4, [r6]
	mov r5, #5
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-44
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =1
	str r6, [r4]
	mov r4, #6
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-44
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =1
	str r6, [r5]
	mov r4, #7
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-44
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =5
	str r6, [r5]
	mov r4, #8
	mov r5, #4
	mov r4, r5, LSL#3
	mov r5, #-44
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =7
	str r4, [r5]
	mov r5, #9
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-44
	add r4, fp, r5
	add r5, r4, r6
	ldr r4, =8
	str r4, [r5]
	ldr r5, =10
	str r5, [fp, #-48]
	ldr r4, =3
	str r4, [fp, #-4]
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-44
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [fp, #-48]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl removeElement
	mov r4, r0
	str r4, [fp, #-48]
	ldr r5, [fp, #-48]
	mov r0, r5
	add sp, sp, #48
	pop {r4, r5, r6, fp, lr}
	bx lr

