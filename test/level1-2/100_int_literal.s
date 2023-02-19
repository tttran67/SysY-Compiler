	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global s
	.align 4
	.size s, 4
s:
	.word 0
	.text
	.global get_ans_se
	.type get_ans_se , %function
get_ans_se:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L57:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	cmp r4, r5
	moveq r4, #1
	movne r4, #0
	beq .L65
	b .L70
.L65:
	ldr r5, =1
	str r5, [fp, #-4]
	b .L66
.L66:
	ldr r4, [fp, #-16]
	ldr r5, =2
	mov r5, r4, LSL#1
	str r5, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	str r6, [fp, #-16]
	ldr r4, addr_s_0
	ldr r5, [r4]
	ldr r4, [fp, #-16]
	add r6, r5, r4
	ldr r5, addr_s_0
	str r6, [r5]
	ldr r4, [fp, #-16]
	mov r0, r4
	add sp, sp, #16
	pop {r4, r5, r6, fp, lr}
	bx lr

.L69:
.L70:
	b .L66
.L71:
	.global get_ans
	.type get_ans , %function
get_ans:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L78:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	cmp r4, r5
	moveq r4, #1
	movne r4, #0
	beq .L86
	b .L91
.L86:
	ldr r5, =1
	str r5, [fp, #-4]
	b .L87
.L87:
	ldr r4, [fp, #-16]
	ldr r5, =2
	mov r5, r4, LSL#1
	str r5, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	str r6, [fp, #-16]
	ldr r4, [fp, #-16]
	mov r0, r4
	add sp, sp, #16
	pop {r4, r5, r6, fp, lr}
	bx lr

.L90:
.L91:
	b .L87
.L92:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #36
.L97:
	ldr r4, =0
	ldr r5, =-2147483648
	sub r6, r4, r5
	str r6, [fp, #-36]
	ldr r4, =-2147483648
	str r4, [fp, #-32]
	ldr r5, =-2147483647
	str r5, [fp, #-28]
	ldr r4, =2147483647
	str r4, [fp, #-24]
	ldr r5, =2147483646
	str r5, [fp, #-20]
	ldr r4, [fp, #-36]
	ldr r5, [fp, #-32]
	mov r0, #0
	mov r1, r4
	mov r2, r5
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r5, [fp, #-16]
	ldr r4, [fp, #-36]
	add r6, r4, #1
	ldr r4, [fp, #-28]
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r5, [fp, #-16]
	ldr r4, [fp, #-36]
	ldr r6, [fp, #-24]
	ldr r7, =0
	sub r8, r7, r6
	sub r6, r8, #1
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl get_ans
	mov r5, r0
	str r5, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-36]
	ldr r6, [fp, #-20]
	add r7, r6, #1
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-32]
	ldr r6, =2
	sdiv r7, r5, r6
	ldr r5, [fp, #-28]
	ldr r6, =2
	sdiv r8, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, r8
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-32]
	ldr r6, [fp, #-24]
	ldr r7, =0
	sub r8, r7, r6
	sub r6, r8, #1
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-32]
	ldr r6, [fp, #-20]
	add r7, r6, #1
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	mov r0, #0
	mov r1, r4
	mov r2, r5
	bl get_ans
	mov r4, r0
	str r4, [fp, #-12]
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-28]
	ldr r6, [fp, #-20]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl get_ans
	mov r5, r0
	str r5, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans
	mov r4, r0
	str r4, [fp, #-12]
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-36]
	ldr r6, =2
	sdiv r7, r4, r6
	ldr r4, [fp, #-32]
	ldr r6, =2
	sdiv r8, r4, r6
	mov r0, r5
	mov r1, r7
	mov r2, r8
	bl get_ans
	mov r5, r0
	str r5, [fp, #-12]
	ldr r4, [fp, #-36]
	ldr r5, [fp, #-32]
	mov r0, #0
	mov r1, r4
	mov r2, r5
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-36]
	add r6, r4, #1
	ldr r4, [fp, #-28]
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-36]
	ldr r6, [fp, #-24]
	ldr r7, =0
	sub r8, r7, r6
	sub r6, r8, #1
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl get_ans_se
	mov r5, r0
	str r5, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-36]
	ldr r6, [fp, #-20]
	add r7, r6, #1
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-32]
	ldr r6, =2
	sdiv r7, r5, r6
	ldr r5, [fp, #-28]
	ldr r6, =2
	sdiv r8, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, r8
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-32]
	ldr r6, [fp, #-24]
	ldr r7, =0
	sub r8, r7, r6
	sub r6, r8, #1
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-32]
	ldr r6, [fp, #-20]
	add r7, r6, #1
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	mov r0, #0
	mov r1, r4
	mov r2, r5
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-28]
	ldr r6, [fp, #-20]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl get_ans_se
	mov r5, r0
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-36]
	ldr r6, =2
	sdiv r7, r4, r6
	ldr r4, [fp, #-32]
	ldr r6, =2
	sdiv r8, r4, r6
	mov r0, r5
	mov r1, r7
	mov r2, r8
	bl get_ans_se
	mov r5, r0
	str r5, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	add r6, r4, r5
	ldr r4, [fp, #-8]
	add r5, r6, r4
	ldr r4, [fp, #-4]
	add r6, r5, r4
	mov r0, r6
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	b .F0
.LTORG
addr_s_0:
	.word s
.F0:
addr_s_1:
	.word s
