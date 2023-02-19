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
	.global sub
	.type sub , %function
sub:
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
	cmp r4, #3
	movlt r4, #1
	movge r4, #0
	blt .L50
	b .L54
.L50:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-40]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r6, [fp, #-4]
	ldr r4, [fp, #-28]
	mov r8, #4
	mul r7, r6, r8
	add r6, r4, r7
	ldr r4, [r6]
	sub r7, r5, r4
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-16]
	mov r6, #4
	mul r8, r5, r6
	add r5, r4, r8
	str r7, [r5]
	ldr r4, [fp, #-4]
	ldr r6, [fp, #-36]
	mov r5, #4
	mul r7, r4, r5
	add r4, r6, r7
	ldr r5, [r4]
	ldr r6, [fp, #-4]
	ldr r4, [fp, #-24]
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	sub r7, r5, r4
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-12]
	mov r6, #4
	mul r8, r5, r6
	add r5, r4, r8
	str r7, [r5]
	ldr r4, [fp, #-4]
	ldr r6, [fp, #-32]
	mov r5, #4
	mul r7, r4, r5
	add r4, r6, r7
	ldr r5, [r4]
	ldr r6, [fp, #-4]
	ldr r4, [fp, #-20]
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	sub r7, r5, r4
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-8]
	mov r6, #4
	mul r8, r5, r6
	add r5, r4, r8
	str r7, [r5]
	ldr r4, [fp, #-4]
	add r6, r4, #1
	str r6, [fp, #-4]
	b .L49
.L51:
	mov r0, #0
	add sp, sp, #40
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L53:
.L54:
	b .L51
.L55:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #144
.L99:
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
	b .L110
.L110:
	ldr r5, [fp, #-8]
	cmp r5, #3
	movlt r4, #1
	movge r4, #0
	blt .L111
	b .L115
.L111:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r7, #4
	mul r6, r4, r7
	mov r4, #-128
	add r7, fp, r4
	add r4, r7, r6
	str r5, [r4]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-8]
	mov r4, #4
	mul r7, r6, r4
	mov r6, #-116
	add r4, fp, r6
	add r6, r4, r7
	str r5, [r6]
	ldr r4, [fp, #-8]
	ldr r6, [fp, #-8]
	mov r5, #4
	mul r7, r6, r5
	mov r6, #-104
	add r6, fp, r6
	add r5, r6, r7
	str r4, [r5]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-8]
	mov r4, #4
	mul r7, r6, r4
	mov r6, #-92
	add r6, fp, r6
	add r4, r6, r7
	str r5, [r4]
	ldr r4, [fp, #-8]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r5, r6, r7
	mov r6, #-80
	add r7, fp, r6
	add r6, r7, r5
	str r4, [r6]
	ldr r6, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r4, #4
	mul r7, r5, r4
	mov r5, #-68
	add r5, fp, r5
	add r4, r5, r7
	str r6, [r4]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L110
.L112:
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-128
	add r5, fp, r5
	add r4, r5, r6
	mov r6, #0
	mov r7, #4
	mul r5, r6, r7
	mov r6, #-116
	add r6, fp, r6
	add r7, r6, r5
	mov r5, #0
	mov r6, #4
	mul r8, r5, r6
	mov r5, #-104
	add r5, fp, r5
	add r6, r5, r8
	mov r8, #0
	mov r5, #4
	mul r9, r8, r5
	mov r8, #-92
	add r8, fp, r8
	add r5, r8, r9
	mov r9, #0
	mov r8, #4
	mul r10, r9, r8
	mov r9, #-80
	add r8, fp, r9
	add r9, r8, r10
	str r9, [fp, #-132]
	mov r8, #0
	mov r9, #4
	mul r10, r8, r9
	mov r8, #-68
	add r9, fp, r8
	add r8, r9, r10
	str r8, [fp, #-136]
	mov r9, #0
	mov r8, #4
	mul r10, r9, r8
	mov r9, #-56
	add r8, fp, r9
	add r9, r8, r10
	str r9, [fp, #-140]
	mov r8, #0
	mov r9, #4
	mul r10, r8, r9
	mov r8, #-32
	add r9, fp, r8
	add r8, r9, r10
	str r8, [fp, #-144]
	mov r9, #0
	mov r8, #4
	mul r10, r9, r8
	mov r9, #-20
	add r9, fp, r9
	add r8, r9, r10
	mov r0, r4
	mov r1, r7
	mov r2, r6
	mov r3, r5
	push {r8}
	ldr r4, [fp, #-144]
	push {r4}
	ldr r5, [fp, #-140]
	push {r5}
	ldr r5, [fp, #-136]
	push {r5}
	ldr r4, [fp, #-132]
	push {r4}
	bl sub
	add sp, sp, #20
	mov r5, r0
	str r5, [fp, #-8]
	b .L161
.L114:
.L115:
	b .L112
.L116:
.L161:
	ldr r4, [fp, #-8]
	cmp r4, #3
	movlt r5, #1
	movge r5, #0
	blt .L162
	b .L166
	b .F0
.LTORG
addr_L_0:
	.word L
addr_M_0:
	.word M
addr_N_0:
	.word N
.F0:
.L162:
	ldr r4, [fp, #-8]
	mov r6, #4
	mul r5, r4, r6
	mov r4, #-56
	add r4, fp, r4
	add r6, r4, r5
	ldr r5, [r6]
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r5, [fp, #-8]
	add r4, r5, #1
	str r4, [fp, #-8]
	b .L161
.L163:
	ldr r5, =10
	str r5, [fp, #-4]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putch
	b .L175
.L165:
.L166:
	b .L163
.L167:
.L175:
	ldr r4, [fp, #-8]
	cmp r4, #3
	movlt r5, #1
	movge r5, #0
	blt .L176
	b .L180
.L176:
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
	b .L175
.L177:
	ldr r5, =10
	str r5, [fp, #-4]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putch
	b .L189
.L179:
.L180:
	b .L177
.L181:
.L189:
	ldr r4, [fp, #-8]
	cmp r4, #3
	movlt r5, #1
	movge r5, #0
	blt .L190
	b .L194
.L190:
	ldr r4, [fp, #-8]
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-20
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
	b .L189
.L191:
	ldr r5, =10
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	mov r0, #0
	add sp, sp, #144
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

.L193:
.L194:
	b .L191
.L195:
addr_L_1:
	.word L
addr_M_1:
	.word M
addr_N_1:
	.word N
