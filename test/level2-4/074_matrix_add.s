	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global L
	.align 4
	.size L, 4
L:
	.word 0
	.global M
	.align 4
	.size M, 4
M:
	.word 0
	.global N
	.align 4
	.size N, 4
N:
	.word 0
	.text
	.global add
	.type add , %function
add:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #40
.L20:
	str r0, [fp, #-40]
	str r1, [fp, #-36]
	str r2, [fp, #-32]
	str r3, [fp, #-28]
	ldr r0, [fp, #28]
	str r0, [fp, #-24]
	ldr r0, [fp, #32]
	str r0, [fp, #-20]
	ldr r0, [fp, #36]
	str r0, [fp, #-16]
	ldr r0, [fp, #40]
	str r0, [fp, #-12]
	ldr r0, [fp, #44]
	str r0, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L49
.L49:
	ldr r4, [fp, #-4]
	ldr r5, addr_M_0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L50
	b .L55
.L50:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-40]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-4]
	ldr r5, [fp, #-28]
	mov r8, #4
	mul r7, r6, r8
	add r6, r5, r7
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r8, r4, r6
	add r4, r5, r8
	str r7, [r4]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-36]
	mov r4, #4
	mul r7, r5, r4
	add r5, r6, r7
	ldr r4, [r5]
	ldr r6, [fp, #-4]
	ldr r5, [fp, #-24]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	mov r6, #4
	mul r8, r4, r6
	add r4, r5, r8
	str r7, [r4]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-32]
	mov r4, #4
	mul r7, r5, r4
	add r5, r6, r7
	ldr r4, [r5]
	ldr r6, [fp, #-4]
	ldr r5, [fp, #-20]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r8, r4, r6
	add r4, r5, r8
	str r7, [r4]
	ldr r5, [fp, #-4]
	add r6, r5, #1
	str r6, [fp, #-4]
	b .L49
.L51:
	mov r0, #0
	add sp, sp, #40
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L54:
.L55:
	b .L51
.L56:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #144
.L100:
	ldr r4, =3
	ldr r5, addr_N_0
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_M_0
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_L_0
	str r4, [r5]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L111
.L111:
	ldr r5, [fp, #-8]
	ldr r4, addr_M_0
	ldr r6, [r4]
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L112
	b .L117
.L112:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	mov r5, #-128
	add r5, fp, r5
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r7, #4
	mul r6, r5, r7
	mov r5, #-116
	add r7, fp, r5
	add r5, r7, r6
	str r4, [r5]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-8]
	mov r4, #4
	mul r7, r6, r4
	mov r6, #-104
	add r4, fp, r6
	add r6, r4, r7
	str r5, [r6]
	ldr r4, [fp, #-8]
	ldr r6, [fp, #-8]
	mov r5, #4
	mul r7, r6, r5
	mov r6, #-92
	add r6, fp, r6
	add r5, r6, r7
	str r4, [r5]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-8]
	mov r4, #4
	mul r7, r6, r4
	mov r6, #-80
	add r4, fp, r6
	add r6, r4, r7
	str r5, [r6]
	ldr r4, [fp, #-8]
	ldr r6, [fp, #-8]
	mov r5, #4
	mul r7, r6, r5
	mov r6, #-68
	add r6, fp, r6
	add r5, r6, r7
	str r4, [r5]
	ldr r5, [fp, #-8]
	add r6, r5, #1
	str r6, [fp, #-8]
	b .L111
.L113:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-128
	add r4, fp, r4
	add r5, r4, r6
	mov r6, #0
	mov r7, #4
	mul r4, r6, r7
	mov r6, #-116
	add r6, fp, r6
	add r7, r6, r4
	mov r4, #0
	mov r6, #4
	mul r8, r4, r6
	mov r4, #-104
	add r4, fp, r4
	add r6, r4, r8
	mov r8, #0
	mov r4, #4
	mul r9, r8, r4
	mov r8, #-92
	add r8, fp, r8
	add r4, r8, r9
	mov r9, #0
	mov r10, #4
	mul r8, r9, r10
	mov r9, #-80
	add r10, fp, r9
	add r8, r10, r8
	str r8, [fp, #-132]
	mov r9, #0
	mov r8, #4
	mul r10, r9, r8
	mov r9, #-68
	add r8, fp, r9
	add r9, r8, r10
	str r9, [fp, #-136]
	mov r8, #0
	mov r9, #4
	mul r10, r8, r9
	mov r8, #-56
	add r9, fp, r8
	add r8, r9, r10
	str r8, [fp, #-140]
	mov r9, #0
	mov r8, #4
	mul r10, r9, r8
	mov r9, #-32
	add r8, fp, r9
	add r9, r8, r10
	str r9, [fp, #-144]
	mov r8, #0
	mov r9, #4
	mul r10, r8, r9
	mov r8, #-20
	add r8, fp, r8
	add r9, r8, r10
	mov r0, r5
	mov r1, r7
	mov r2, r6
	mov r3, r4
	push {r9}
	ldr r5, [fp, #-144]
	push {r5}
	ldr r4, [fp, #-140]
	push {r4}
	ldr r4, [fp, #-136]
	push {r4}
	ldr r5, [fp, #-132]
	push {r5}
	bl add
	add sp, sp, #20
	mov r4, r0
	str r4, [fp, #-8]
	b .L163
.L116:
.L117:
	b .L113
.L118:
.L163:
	ldr r5, [fp, #-8]
	ldr r4, addr_N_0
	ldr r6, [r4]
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L164
	b .L169
	b .F0
.LTORG
addr_L_0:
	.word L
addr_M_0:
	.word M
addr_N_0:
	.word N
.F0:
.L164:
	ldr r4, [fp, #-8]
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-56
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, [r4]
	str r5, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putint
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L163
.L165:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putch
	ldr r4, =0
	str r4, [fp, #-8]
	b .L178
.L168:
.L169:
	b .L165
.L170:
.L178:
	ldr r5, [fp, #-8]
	ldr r4, addr_N_1
	ldr r6, [r4]
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L179
	b .L184
.L179:
	ldr r4, [fp, #-8]
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-32
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [r5]
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r5, [fp, #-8]
	add r4, r5, #1
	str r4, [fp, #-8]
	b .L178
.L180:
	ldr r5, =10
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	ldr r5, =0
	str r5, [fp, #-8]
	b .L193
.L183:
.L184:
	b .L180
.L185:
.L193:
	ldr r4, [fp, #-8]
	ldr r5, addr_N_1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L194
	b .L199
.L194:
	ldr r5, [fp, #-8]
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-20
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [r4]
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putint
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L193
.L195:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putch
	mov r0, #0
	add sp, sp, #144
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

.L198:
.L199:
	b .L195
.L200:
addr_L_1:
	.word L
addr_M_1:
	.word M
addr_N_1:
	.word N
