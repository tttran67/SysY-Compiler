	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 0
	.global b
	.align 4
	.size b, 4
b:
	.word 0
	.global c
	.align 4
	.size c, 4
c:
	.word 0
	.global d
	.align 4
	.size d, 4
d:
	.word 0
	.global e
	.align 4
	.size e, 4
e:
	.word 0
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L20:
	bl getint
	mov r4, r0
	ldr r5, addr_a_0
	str r4, [r5]
	bl getint
	mov r4, r0
	ldr r5, addr_b_0
	str r4, [r5]
	bl getint
	mov r4, r0
	ldr r5, addr_c_0
	str r4, [r5]
	bl getint
	mov r4, r0
	ldr r5, addr_d_0
	str r4, [r5]
	bl getint
	mov r4, r0
	ldr r5, addr_e_0
	str r4, [r5]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r5, addr_a_0
	ldr r4, [r5]
	ldr r5, addr_b_0
	ldr r6, [r5]
	ldr r5, addr_c_0
	ldr r7, [r5]
	mul r5, r6, r7
	sub r6, r4, r5
	ldr r4, addr_d_0
	ldr r5, [r4]
	ldr r4, addr_a_0
	ldr r7, [r4]
	ldr r4, addr_c_0
	ldr r8, [r4]
	sdiv r4, r7, r8
	sub r7, r5, r4
	cmp r6, r7
	movne r5, #1
	moveq r5, #0
	bne .L22
	b .L33
.L22:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L23
.L23:
	ldr r5, [fp, #-4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L24:
	ldr r4, addr_a_0
	ldr r5, [r4]
	ldr r4, addr_b_0
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_c_0
	ldr r6, [r5]
	add r5, r4, r6
	ldr r6, addr_d_0
	ldr r4, [r6]
	ldr r6, addr_e_0
	ldr r7, [r6]
	add r6, r4, r7
	cmp r5, r6
	moveq r4, #1
	movne r4, #0
	beq .L22
	b .L49
.L25:
	ldr r4, addr_a_0
	ldr r5, [r4]
	ldr r4, addr_b_0
	ldr r6, [r4]
	mul r4, r5, r6
	ldr r5, addr_c_0
	ldr r6, [r5]
	sdiv r5, r4, r6
	ldr r6, addr_e_0
	ldr r4, [r6]
	ldr r6, addr_d_0
	ldr r7, [r6]
	add r6, r4, r7
	cmp r5, r6
	moveq r4, #1
	movne r4, #0
	beq .L22
	b .L41
.L32:
.L33:
	b .L25
.L34:
.L40:
.L41:
	b .L24
.L42:
.L48:
.L49:
	b .L23
.L50:
addr_a_0:
	.word a
addr_b_0:
	.word b
addr_c_0:
	.word c
addr_d_0:
	.word d
addr_e_0:
	.word e
