	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #92
.L9:
	ldr r4, =2
	str r4, [fp, #-92]
	ldr r4, =20
	str r4, [fp, #-88]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-84
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =1
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =2
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L34
.L34:
	ldr r5, [fp, #-92]
	ldr r4, [fp, #-88]
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L35
	b .L40
.L35:
	ldr r4, [fp, #-92]
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-84
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [r5]
	ldr r4, [fp, #-92]
	sub r5, r4, #1
	mov r4, #4
	mul r7, r5, r4
	mov r5, #-84
	add r5, fp, r5
	add r4, r5, r7
	ldr r7, [r4]
	add r5, r6, r7
	ldr r4, [fp, #-92]
	sub r6, r4, #2
	mov r4, #4
	mul r7, r6, r4
	mov r6, #-84
	add r6, fp, r6
	add r4, r6, r7
	ldr r7, [r4]
	add r6, r5, r7
	ldr r4, [fp, #-92]
	mov r5, #4
	mul r7, r4, r5
	mov r4, #-84
	add r5, fp, r4
	add r4, r5, r7
	str r6, [r4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-92]
	mov r6, #4
	mul r7, r5, r6
	mov r5, #-84
	add r5, fp, r5
	add r6, r5, r7
	ldr r7, [r6]
	add r5, r4, r7
	str r5, [fp, #-4]
	ldr r4, [fp, #-92]
	mov r6, #4
	mul r5, r4, r6
	mov r6, #-84
	add r6, fp, r6
	add r4, r6, r5
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	ldr r5, [fp, #-92]
	add r4, r5, #1
	str r4, [fp, #-92]
	b .L34
.L36:
	ldr r5, [fp, #-4]
	mov r0, r5
	add sp, sp, #92
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L39:
.L40:
	b .L36
.L41:
