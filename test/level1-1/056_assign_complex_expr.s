	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L21:
	ldr r4, =5
	str r4, [fp, #-20]
	ldr r4, =5
	str r4, [fp, #-16]
	ldr r4, =1
	str r4, [fp, #-12]
	ldr r4, =0
	sub r5, r4, #2
	str r5, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, =2
	sdiv r6, r4, r5
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	sub r7, r4, r5
	add r4, r6, r7
	ldr r5, [fp, #-12]
	add r6, r5, #3
	ldr r5, =0
	sub r7, r5, r6
	ldr r6, =2
	sdiv r5, r7, r6
	mov r6, r5, LSL#1
	sub r5, r7, r6
	sub r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-8]
	ldr r5, =2
	sdiv r5, r4, r5
	mov r6, r5, LSL#1
	sub r5, r4, r6
	add r4, r5, #67
	ldr r6, [fp, #-20]
	ldr r5, [fp, #-16]
	sub r7, r6, r5
	ldr r6, =0
	sub r5, r6, r7
	add r6, r4, r5
	ldr r4, [fp, #-12]
	add r5, r4, #2
	ldr r4, =2
	sdiv r4, r5, r4
	mov r7, r4, LSL#1
	sub r4, r5, r7
	ldr r5, =0
	sub r7, r5, r4
	sub r4, r6, r7
	str r4, [fp, #-4]
	ldr r5, [fp, #-4]
	add r6, r5, #3
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

