	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global if_if_Else
	.type if_if_Else , %function
if_if_Else:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L4:
	ldr r4, =5
	str r4, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	cmp r4, #5
	moveq r4, #1
	movne r4, #0
	beq .L7
	b .L12
.L7:
	ldr r4, [fp, #-4]
	cmp r4, #10
	moveq r4, #1
	movne r4, #0
	beq .L14
	b .L18
.L8:
	ldr r4, [fp, #-8]
	add r5, r4, #15
	str r5, [fp, #-8]
	b .L9
.L9:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

.L11:
.L12:
	b .L8
.L13:
.L14:
	ldr r5, =25
	str r5, [fp, #-8]
	b .L15
.L15:
	b .L9
.L17:
.L18:
	b .L15
.L19:
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L22:
	bl if_if_Else
	mov r4, r0
	mov r0, r4
	add sp, sp, #0
	pop {r4, fp, lr}
	bx lr

