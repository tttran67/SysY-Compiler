	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global fun
	.type fun , %function
fun:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L6:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	b .L12
.L12:
	ldr r4, [fp, #-8]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L13
	b .L17
.L13:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	str r4, [fp, #-12]
	ldr r5, [fp, #-4]
	str r5, [fp, #-8]
	b .L12
.L14:
	ldr r4, [fp, #-12]
	mov r0, r4
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr

.L16:
.L17:
	b .L14
.L18:
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L24:
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-12]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	mov r0, r4
	mov r1, r5
	bl fun
	mov r4, r0
	str r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putint
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, fp, lr}
	bx lr

