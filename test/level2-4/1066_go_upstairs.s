	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global climbStairs
	.type climbStairs , %function
climbStairs:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #48
.L8:
	str r0, [fp, #-48]
	ldr r4, [fp, #-48]
	cmp r4, #4
	movlt r4, #1
	movge r4, #0
	blt .L11
	b .L15
.L11:
	ldr r4, [fp, #-48]
	mov r0, r4
	add sp, sp, #48
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L12:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-44
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =0
	str r6, [r5]
	mov r4, #1
	mov r5, #4
	mov r4, r5, LSL#0
	mov r5, #-44
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =1
	str r4, [r5]
	mov r5, #2
	mov r4, #4
	mov r5, r4, LSL#1
	mov r4, #-44
	add r6, fp, r4
	add r4, r6, r5
	ldr r5, =2
	str r5, [r4]
	ldr r4, =3
	str r4, [fp, #-4]
	b .L26
.L14:
.L15:
	b .L12
.L16:
.L26:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-48]
	add r6, r4, #1
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L27
	b .L32
.L27:
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-44
	add r4, fp, r5
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, [fp, #-4]
	sub r5, r6, #2
	mov r6, #4
	mul r7, r5, r6
	mov r5, #-44
	add r5, fp, r5
	add r6, r5, r7
	ldr r7, [r6]
	add r5, r4, r7
	ldr r4, [fp, #-4]
	mov r6, #4
	mul r7, r4, r6
	mov r4, #-44
	add r4, fp, r4
	add r6, r4, r7
	str r5, [r6]
	ldr r6, [fp, #-4]
	add r4, r6, #1
	str r4, [fp, #-4]
	b .L26
.L28:
	ldr r4, [fp, #-48]
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-44
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [r5]
	mov r0, r6
	add sp, sp, #48
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L31:
.L32:
	b .L28
.L33:
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L50:
	ldr r4, =5
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl climbStairs
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r4, fp, lr}
	bx lr

