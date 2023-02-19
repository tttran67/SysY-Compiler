	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global k
	.align 4
	.size k, 4
k:
	.word 0
	.global n
	.align 4
	.size n, 4
n:
	.word 10
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L6:
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, =1
	ldr r5, addr_k_0
	str r4, [r5]
	b .L8
.L8:
	ldr r4, [fp, #-4]
	ldr r5, addr_n_0
	ldr r6, [r5]
	sub r5, r6, #1
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L9
	b .L14
.L9:
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	ldr r5, addr_k_0
	ldr r4, [r5]
	ldr r5, addr_k_0
	ldr r4, [r5]
	ldr r5, addr_k_0
	ldr r6, [r5]
	add r5, r4, r6
	ldr r4, addr_k_0
	str r5, [r4]
	b .L8
.L10:
	ldr r5, addr_k_0
	ldr r4, [r5]
	mov r0, r4
	bl putint
	ldr r5, addr_k_0
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr

.L13:
.L14:
	b .L10
.L15:
addr_k_0:
	.word k
addr_n_0:
	.word n
