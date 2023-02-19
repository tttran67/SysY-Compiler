	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 24
a:
	.word 10
	.word 1
	.word 50
	.word 50
	.word 20
	.word 5
	.comm dp, 400, 4
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #24
.L20:
	ldr r4, =6
	str r4, [fp, #-24]
	ldr r4, =3
	str r4, [fp, #-20]
	b .L27
.L27:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-24]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L28
	b .L33
.L28:
	ldr r5, =0
	str r5, [fp, #-16]
	b .L35
.L29:
	mov r4, #0
	mov r5, #40
	mul r6, r4, r5
	ldr r5, addr_dp_0
	add r4, r5, r6
	ldr r6, [fp, #-24]
	sub r5, r6, #1
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #0
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L32:
.L33:
	b .L29
.L34:
.L35:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-20]
	sub r7, r5, r6
	add r5, r7, #1
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L36
	b .L42
.L36:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-20]
	add r6, r4, r5
	sub r4, r6, #1
	str r4, [fp, #-8]
	ldr r4, [fp, #-16]
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L47
.L37:
	ldr r4, [fp, #-20]
	add r5, r4, #1
	str r5, [fp, #-20]
	b .L27
.L41:
.L42:
	b .L37
.L43:
.L47:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L48
	b .L53
.L48:
	ldr r5, [fp, #-16]
	mov r4, #40
	mul r6, r5, r4
	ldr r4, addr_dp_0
	add r5, r4, r6
	ldr r6, [fp, #-12]
	mov r4, #4
	mul r7, r6, r4
	add r6, r5, r7
	ldr r4, [r6]
	ldr r5, [fp, #-12]
	mov r6, #40
	mul r7, r5, r6
	ldr r6, addr_dp_0
	add r5, r6, r7
	ldr r7, [fp, #-8]
	mov r6, #4
	mul r8, r7, r6
	add r7, r5, r8
	ldr r5, [r7]
	add r6, r4, r5
	ldr r4, [fp, #-16]
	mov r5, #4
	mul r7, r4, r5
	ldr r5, addr_a_0
	add r4, r5, r7
	ldr r7, [r4]
	ldr r5, [fp, #-12]
	mov r4, #4
	mul r8, r5, r4
	ldr r4, addr_a_0
	add r5, r4, r8
	ldr r8, [r5]
	mul r4, r7, r8
	ldr r5, [fp, #-8]
	mov r7, #4
	mul r8, r5, r7
	ldr r7, addr_a_0
	add r5, r7, r8
	ldr r8, [r5]
	mul r7, r4, r8
	add r4, r6, r7
	str r4, [fp, #-4]
	ldr r5, [fp, #-16]
	mov r6, #40
	mul r4, r5, r6
	ldr r5, addr_dp_0
	add r6, r5, r4
	ldr r4, [fp, #-8]
	mov r5, #4
	mul r7, r4, r5
	add r4, r6, r7
	ldr r5, [r4]
	cmp r5, #0
	moveq r5, #1
	movne r5, #0
	beq .L79
	b .L89
.L49:
	ldr r4, [fp, #-16]
	add r5, r4, #1
	str r5, [fp, #-16]
	b .L35
.L52:
.L53:
	b .L49
.L54:
.L79:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	mov r6, #40
	mul r7, r5, r6
	ldr r6, addr_dp_0
	add r5, r6, r7
	ldr r7, [fp, #-8]
	mov r6, #4
	mul r8, r7, r6
	add r7, r5, r8
	str r4, [r7]
	b .L80
.L80:
	ldr r4, [fp, #-12]
	add r6, r4, #1
	str r6, [fp, #-12]
	b .L47
.L81:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-16]
	mov r6, #40
	mul r7, r4, r6
	ldr r6, addr_dp_0
	add r4, r6, r7
	ldr r7, [fp, #-8]
	mov r6, #4
	mul r8, r7, r6
	add r7, r4, r8
	ldr r4, [r7]
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L79
	b .L99
	b .F0
.LTORG
addr_a_0:
	.word a
addr_dp_0:
	.word dp
.F0:
.L88:
.L89:
	b .L81
.L90:
.L98:
.L99:
	b .L80
.L100:
addr_a_1:
	.word a
addr_dp_1:
	.word dp
