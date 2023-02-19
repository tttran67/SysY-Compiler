	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.comm ans, 200, 4
	.comm line1, 200, 4
	.comm line2, 400, 4
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.comm row, 200, 4
	.global sum
	.align 4
	.size sum, 4
sum:
	.word 0
	.text
	.global printans
	.type printans , %function
printans:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L32:
	ldr r4, addr_sum_0
	ldr r5, [r4]
	add r4, r5, #1
	ldr r5, addr_sum_0
	str r4, [r5]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L35
.L35:
	ldr r5, [fp, #-4]
	ldr r4, addr_n_0
	ldr r6, [r4]
	cmp r5, r6
	movle r5, #1
	movgt r5, #0
	ble .L36
	b .L41
.L36:
	ldr r4, [fp, #-4]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_ans_0
	add r4, r5, r6
	ldr r6, [r4]
	mov r0, r6
	bl putint
	ldr r5, [fp, #-4]
	ldr r4, addr_n_0
	ldr r6, [r4]
	cmp r5, r6
	moveq r5, #1
	movne r5, #0
	beq .L47
	b .L53
.L37:
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr

.L40:
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr

.L41:
	b .L37
.L42:
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr

.L47:
	mov r0, #10
	bl putch
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr

.L48:
	mov r0, #32
	bl putch
	b .L49
.L49:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L35
.L52:
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr

.L53:
	b .L48
.L54:
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global f
	.type f , %function
f:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L56:
	str r0, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L60
.L60:
	ldr r4, [fp, #-4]
	ldr r5, addr_n_0
	ldr r6, [r5]
	cmp r4, r6
	movle r4, #1
	movgt r4, #0
	ble .L61
	b .L66
.L61:
	ldr r5, [fp, #-4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_row_0
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #1
	movne r4, #1
	moveq r4, #0
	bne .L71
	b .L77
.L62:
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L65:
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L66:
	b .L62
.L67:
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L68:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-8]
	mov r6, #4
	mul r7, r4, r6
	ldr r6, addr_ans_0
	add r4, r6, r7
	str r5, [r4]
	ldr r5, [fp, #-8]
	ldr r6, addr_n_0
	ldr r4, [r6]
	cmp r5, r4
	moveq r5, #1
	movne r5, #0
	beq .L100
	b .L105
.L69:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L60
.L70:
	ldr r4, addr_n_0
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	add r6, r5, r4
	ldr r5, [fp, #-4]
	sub r4, r6, r5
	mov r5, #4
	mul r6, r4, r5
	ldr r4, addr_line2_0
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #0
	moveq r4, #1
	movne r4, #0
	beq .L68
	b .L94
.L71:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-4]
	add r6, r5, r4
	mov r5, #4
	mul r4, r6, r5
	ldr r6, addr_line1_0
	add r5, r6, r4
	ldr r4, [r5]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	beq .L70
	b .L85
.L76:
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L77:
	b .L69
.L78:
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L84:
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L85:
	b .L69
.L86:
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L93:
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L94:
	b .L69
.L95:
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L100:
	bl printans
	b .L101
.L101:
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r4, r5, r6
	ldr r6, addr_row_0
	add r5, r6, r4
	ldr r4, =1
	str r4, [r5]
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-4]
	add r6, r5, r4
	mov r5, #4
	mul r4, r6, r5
	ldr r6, addr_line1_0
	add r5, r6, r4
	ldr r4, =1
	str r4, [r5]
	ldr r5, addr_n_0
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	ldr r4, [fp, #-4]
	sub r5, r6, r4
	mov r4, #4
	mul r6, r5, r4
	ldr r5, addr_line2_0
	add r4, r5, r6
	ldr r6, =1
	str r6, [r4]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	mov r0, r5
	bl f
	ldr r4, [fp, #-4]
	mov r5, #4
	mul r6, r4, r5
	ldr r4, addr_row_0
	add r5, r4, r6
	ldr r4, =0
	str r4, [r5]
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-4]
	add r6, r5, r4
	mov r5, #4
	mul r4, r6, r5
	ldr r6, addr_line1_0
	add r5, r6, r4
	ldr r4, =0
	str r4, [r5]
	ldr r5, addr_n_0
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	ldr r4, [fp, #-4]
	sub r5, r6, r4
	mov r4, #4
	mul r6, r5, r4
	ldr r5, addr_line2_0
	add r4, r5, r6
	ldr r6, =0
	str r6, [r4]
	b .L69
	b .F0
.LTORG
addr_ans_0:
	.word ans
addr_line1_0:
	.word line1
addr_line2_0:
	.word line2
addr_n_0:
	.word n
addr_row_0:
	.word row
addr_sum_0:
	.word sum
.F0:
.L104:
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L105:
	b .L101
.L106:
	add sp, sp, #8
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L133:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	b .L135
.L135:
	ldr r4, [fp, #-4]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L136
	b .L140
.L136:
	bl getint
	mov r4, r0
	ldr r5, addr_n_1
	str r4, [r5]
	mov r0, #1
	bl f
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L135
.L137:
	ldr r4, addr_sum_1
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

.L139:
.L140:
	b .L137
.L141:
addr_ans_1:
	.word ans
addr_line1_1:
	.word line1
addr_line2_1:
	.word line2
addr_n_1:
	.word n
addr_row_1:
	.word row
addr_sum_1:
	.word sum
