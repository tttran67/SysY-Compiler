	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global reverse
	.type reverse , %function
reverse:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L8:
	str r0, [fp, #-8]
	ldr r4, [fp, #-8]
	cmp r4, #1
	movle r4, #1
	movgt r4, #0
	ble .L12
	b .L17
.L12:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L14
.L13:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	mov r0, r5
	bl reverse
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L14
.L14:
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

.L16:
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

.L17:
	b .L13
.L18:
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L22:
	ldr r4, =200
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl reverse
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

