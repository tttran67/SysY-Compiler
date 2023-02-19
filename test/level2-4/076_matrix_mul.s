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
	.global mul
	.type mul , %function
mul:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub sp, sp, #40
.L60:
	str r0, [fp, #-40]
	str r1, [fp, #-36]
	str r2, [fp, #-32]
	str r3, [fp, #-28]
	ldr r0, [fp, #32]
	str r0, [fp, #-24]
	ldr r0, [fp, #36]
	str r0, [fp, #-20]
	ldr r0, [fp, #40]
	str r0, [fp, #-16]
	ldr r0, [fp, #44]
	str r0, [fp, #-12]
	ldr r0, [fp, #48]
	str r0, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, [fp, #-40]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-28]
	mov r5, #0
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	mul r7, r4, r6
	ldr r4, [fp, #-40]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, [fp, #-24]
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	mul r8, r4, r6
	add r4, r7, r8
	ldr r5, [fp, #-40]
	mov r6, #2
	mov r6, #4
	mov r7, r6, LSL#1
	add r6, r5, r7
	ldr r5, [r6]
	ldr r7, [fp, #-20]
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-16]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-40]
	mov r6, #0
	mov r5, #4
	mul r7, r6, r5
	add r6, r4, r7
	ldr r4, [r6]
	ldr r5, [fp, #-28]
	mov r6, #1
	mov r6, #4
	mov r7, r6, LSL#0
	add r6, r5, r7
	ldr r5, [r6]
	mul r7, r4, r5
	ldr r4, [fp, #-40]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, [fp, #-24]
	mov r5, #1
	mov r5, #4
	mov r8, r5, LSL#0
	add r5, r6, r8
	ldr r6, [r5]
	mul r8, r4, r6
	add r4, r7, r8
	ldr r5, [fp, #-40]
	mov r6, #2
	mov r7, #4
	mov r6, r7, LSL#1
	add r7, r5, r6
	ldr r5, [r7]
	ldr r6, [fp, #-20]
	mov r7, #1
	mov r7, #4
	mov r8, r7, LSL#0
	add r7, r6, r8
	ldr r6, [r7]
	mul r8, r5, r6
	add r5, r4, r8
	ldr r4, [fp, #-16]
	mov r6, #1
	mov r6, #4
	mov r7, r6, LSL#0
	add r6, r4, r7
	str r5, [r6]
	ldr r4, [fp, #-40]
	mov r6, #0
	mov r5, #4
	mul r7, r6, r5
	add r6, r4, r7
	ldr r4, [r6]
	ldr r5, [fp, #-28]
	mov r6, #2
	mov r6, #4
	mov r7, r6, LSL#1
	add r6, r5, r7
	ldr r5, [r6]
	mul r7, r4, r5
	ldr r4, [fp, #-40]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, [fp, #-24]
	mov r5, #2
	mov r5, #4
	mov r8, r5, LSL#1
	add r5, r6, r8
	ldr r6, [r5]
	mul r8, r4, r6
	add r4, r7, r8
	ldr r5, [fp, #-40]
	mov r6, #2
	mov r7, #4
	mov r6, r7, LSL#1
	add r7, r5, r6
	ldr r5, [r7]
	ldr r6, [fp, #-20]
	mov r7, #2
	mov r8, #4
	mov r7, r8, LSL#1
	add r8, r6, r7
	ldr r6, [r8]
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [fp, #-16]
	mov r6, #2
	mov r6, #4
	mov r7, r6, LSL#1
	add r6, r4, r7
	str r5, [r6]
	ldr r4, [fp, #-36]
	mov r6, #0
	mov r5, #4
	mul r7, r6, r5
	add r6, r4, r7
	ldr r4, [r6]
	ldr r5, [fp, #-28]
	mov r6, #0
	mov r8, #4
	mul r7, r6, r8
	add r6, r5, r7
	ldr r5, [r6]
	mul r7, r4, r5
	ldr r4, [fp, #-36]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, [fp, #-24]
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	mul r8, r4, r6
	add r4, r7, r8
	ldr r5, [fp, #-36]
	mov r6, #2
	mov r6, #4
	mov r7, r6, LSL#1
	add r6, r5, r7
	ldr r5, [r6]
	ldr r7, [fp, #-20]
	mov r6, #0
	mov r8, #4
	mul r9, r6, r8
	add r6, r7, r9
	ldr r7, [r6]
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-12]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-36]
	mov r6, #0
	mov r5, #4
	mul r7, r6, r5
	add r6, r4, r7
	ldr r4, [r6]
	ldr r5, [fp, #-28]
	mov r6, #1
	mov r6, #4
	mov r7, r6, LSL#0
	add r6, r5, r7
	ldr r5, [r6]
	mul r7, r4, r5
	ldr r4, [fp, #-36]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, [fp, #-24]
	mov r5, #1
	mov r8, #4
	mov r5, r8, LSL#0
	add r8, r6, r5
	ldr r6, [r8]
	mul r5, r4, r6
	add r4, r7, r5
	ldr r6, [fp, #-36]
	mov r5, #2
	mov r5, #4
	mov r7, r5, LSL#1
	add r5, r6, r7
	ldr r6, [r5]
	ldr r7, [fp, #-20]
	mov r5, #1
	mov r5, #4
	mov r8, r5, LSL#0
	add r5, r7, r8
	ldr r7, [r5]
	mul r8, r6, r7
	add r5, r4, r8
	ldr r4, [fp, #-12]
	mov r6, #1
	mov r6, #4
	mov r7, r6, LSL#0
	add r6, r4, r7
	str r5, [r6]
	ldr r4, [fp, #-36]
	mov r6, #0
	mov r5, #4
	mul r7, r6, r5
	add r6, r4, r7
	ldr r4, [r6]
	ldr r5, [fp, #-28]
	mov r6, #2
	mov r6, #4
	mov r7, r6, LSL#1
	add r6, r5, r7
	ldr r5, [r6]
	mul r7, r4, r5
	ldr r4, [fp, #-36]
	mov r5, #1
	mov r6, #4
	mov r5, r6, LSL#0
	add r6, r4, r5
	ldr r4, [r6]
	ldr r5, [fp, #-24]
	mov r6, #2
	mov r6, #4
	mov r8, r6, LSL#1
	add r6, r5, r8
	ldr r5, [r6]
	mul r8, r4, r5
	add r4, r7, r8
	ldr r5, [fp, #-36]
	mov r6, #2
	mov r6, #4
	mov r7, r6, LSL#1
	add r6, r5, r7
	ldr r5, [r6]
	ldr r7, [fp, #-20]
	mov r6, #2
	mov r6, #4
	mov r8, r6, LSL#1
	add r6, r7, r8
	ldr r7, [r6]
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-12]
	mov r6, #2
	mov r6, #4
	mov r7, r6, LSL#1
	add r6, r4, r7
	str r5, [r6]
	ldr r4, [fp, #-32]
	mov r6, #0
	mov r5, #4
	mul r7, r6, r5
	add r6, r4, r7
	ldr r4, [r6]
	ldr r5, [fp, #-28]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	mul r7, r4, r5
	ldr r4, [fp, #-32]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, [fp, #-24]
	mov r5, #0
	mov r8, #4
	mul r9, r5, r8
	add r5, r6, r9
	ldr r6, [r5]
	mul r8, r4, r6
	add r4, r7, r8
	ldr r5, [fp, #-32]
	mov r6, #2
	mov r7, #4
	mov r6, r7, LSL#1
	add r7, r5, r6
	ldr r5, [r7]
	ldr r6, [fp, #-20]
	mov r7, #0
	mov r8, #4
	mul r9, r7, r8
	add r7, r6, r9
	ldr r6, [r7]
	mul r8, r5, r6
	add r5, r4, r8
	ldr r4, [fp, #-8]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-32]
	mov r6, #0
	mov r5, #4
	mul r7, r6, r5
	add r6, r4, r7
	ldr r4, [r6]
	ldr r5, [fp, #-28]
	mov r6, #1
	mov r6, #4
	mov r7, r6, LSL#0
	add r6, r5, r7
	ldr r5, [r6]
	mul r7, r4, r5
	ldr r4, [fp, #-32]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, [fp, #-24]
	mov r5, #1
	mov r5, #4
	mov r8, r5, LSL#0
	add r5, r6, r8
	ldr r6, [r5]
	mul r8, r4, r6
	add r4, r7, r8
	ldr r5, [fp, #-32]
	mov r6, #2
	mov r6, #4
	mov r7, r6, LSL#1
	add r6, r5, r7
	ldr r5, [r6]
	ldr r7, [fp, #-20]
	mov r6, #1
	mov r6, #4
	mov r8, r6, LSL#0
	add r6, r7, r8
	ldr r7, [r6]
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-8]
	mov r6, #1
	mov r6, #4
	mov r7, r6, LSL#0
	add r6, r4, r7
	str r5, [r6]
	ldr r4, [fp, #-32]
	mov r6, #0
	mov r5, #4
	mul r7, r6, r5
	add r6, r4, r7
	ldr r4, [r6]
	ldr r5, [fp, #-28]
	mov r6, #2
	mov r6, #4
	mov r7, r6, LSL#1
	add r6, r5, r7
	ldr r5, [r6]
	mul r7, r4, r5
	ldr r4, [fp, #-32]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, [fp, #-24]
	mov r5, #2
	mov r5, #4
	mov r8, r5, LSL#1
	add r5, r6, r8
	ldr r6, [r5]
	mul r8, r4, r6
	add r4, r7, r8
	ldr r5, [fp, #-32]
	mov r6, #2
	mov r6, #4
	mov r7, r6, LSL#1
	add r6, r5, r7
	ldr r5, [r6]
	ldr r7, [fp, #-20]
	mov r6, #2
	mov r6, #4
	mov r8, r6, LSL#1
	add r6, r7, r8
	ldr r7, [r6]
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [fp, #-8]
	mov r6, #2
	mov r6, #4
	mov r7, r6, LSL#1
	add r6, r4, r7
	str r5, [r6]
	mov r0, #0
	add sp, sp, #40
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

	b .F0
.LTORG
addr_L_0:
	.word L
addr_M_0:
	.word M
addr_N_0:
	.word N
.F0:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #144
.L332:
	ldr r4, =3
	ldr r5, addr_N_1
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_M_1
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_L_1
	str r4, [r5]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L343
.L343:
	ldr r5, [fp, #-8]
	ldr r4, addr_M_1
	ldr r6, [r4]
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L344
	b .L349
.L344:
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
	b .L343
.L345:
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
	bl mul
	add sp, sp, #20
	mov r4, r0
	str r4, [fp, #-8]
	b .L395
.L348:
.L349:
	b .L345
.L350:
.L395:
	ldr r5, [fp, #-8]
	ldr r4, addr_N_1
	ldr r6, [r4]
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L396
	b .L401
	b .F1
.LTORG
addr_L_1:
	.word L
addr_M_1:
	.word M
addr_N_1:
	.word N
.F1:
.L396:
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
	b .L395
.L397:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r5, =0
	str r5, [fp, #-8]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	b .L410
.L400:
.L401:
	b .L397
.L402:
.L410:
	ldr r5, [fp, #-8]
	ldr r4, addr_N_2
	ldr r6, [r4]
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L411
	b .L416
.L411:
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
	b .L410
.L412:
	ldr r5, =10
	str r5, [fp, #-4]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putch
	b .L425
.L415:
.L416:
	b .L412
.L417:
.L425:
	ldr r4, [fp, #-8]
	ldr r5, addr_N_2
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L426
	b .L431
.L426:
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
	b .L425
.L427:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putch
	mov r0, #0
	add sp, sp, #144
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

.L430:
.L431:
	b .L427
.L432:
addr_L_2:
	.word L
addr_M_2:
	.word M
addr_N_2:
	.word N
