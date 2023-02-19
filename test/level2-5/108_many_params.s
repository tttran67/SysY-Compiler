	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global sort
	.type sort , %function
sort:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L103:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	b .L110
.L110:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	sub r6, r5, #1
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L111
	b .L116
.L111:
	ldr r5, [fp, #-12]
	add r4, r5, #1
	str r4, [fp, #-8]
	b .L120
.L112:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L115:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L116:
	b .L112
.L117:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L120:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-16]
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L121
	b .L126
.L121:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-20]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r6, [fp, #-8]
	ldr r4, [fp, #-20]
	mov r8, #4
	mul r7, r6, r8
	add r6, r4, r7
	ldr r4, [r6]
	cmp r5, r4
	movlt r4, #1
	movge r4, #0
	blt .L128
	b .L141
.L122:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L110
.L125:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L126:
	b .L122
.L127:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L128:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-20]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	str r5, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-20]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-12]
	ldr r5, [fp, #-20]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-20]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	str r4, [r5]
	b .L129
.L129:
	ldr r4, [fp, #-8]
	add r6, r4, #1
	str r6, [fp, #-8]
	b .L120
.L140:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L141:
	b .L129
.L142:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global param32_rec
	.type param32_rec , %function
param32_rec:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #224
.L165:
	str r0, [fp, #-128]
	str r1, [fp, #-124]
	str r2, [fp, #-120]
	str r3, [fp, #-116]
	ldr r0, [fp, #36]
	str r0, [fp, #-112]
	ldr r0, [fp, #40]
	str r0, [fp, #-108]
	ldr r0, [fp, #44]
	str r0, [fp, #-104]
	ldr r0, [fp, #48]
	str r0, [fp, #-100]
	ldr r0, [fp, #52]
	str r0, [fp, #-96]
	ldr r0, [fp, #56]
	str r0, [fp, #-92]
	ldr r0, [fp, #60]
	str r0, [fp, #-88]
	ldr r0, [fp, #64]
	str r0, [fp, #-84]
	ldr r0, [fp, #68]
	str r0, [fp, #-80]
	ldr r0, [fp, #72]
	str r0, [fp, #-76]
	ldr r0, [fp, #76]
	str r0, [fp, #-72]
	ldr r0, [fp, #80]
	str r0, [fp, #-68]
	ldr r0, [fp, #84]
	str r0, [fp, #-64]
	ldr r0, [fp, #88]
	str r0, [fp, #-60]
	ldr r0, [fp, #92]
	str r0, [fp, #-56]
	ldr r0, [fp, #96]
	str r0, [fp, #-52]
	ldr r0, [fp, #100]
	str r0, [fp, #-48]
	ldr r0, [fp, #104]
	str r0, [fp, #-44]
	ldr r0, [fp, #108]
	str r0, [fp, #-40]
	ldr r0, [fp, #112]
	str r0, [fp, #-36]
	ldr r0, [fp, #116]
	str r0, [fp, #-32]
	ldr r0, [fp, #120]
	str r0, [fp, #-28]
	ldr r0, [fp, #124]
	str r0, [fp, #-24]
	ldr r0, [fp, #128]
	str r0, [fp, #-20]
	ldr r0, [fp, #132]
	str r0, [fp, #-16]
	ldr r0, [fp, #136]
	str r0, [fp, #-12]
	ldr r0, [fp, #140]
	str r0, [fp, #-8]
	ldr r0, [fp, #144]
	str r0, [fp, #-4]
	ldr r4, [fp, #-128]
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	beq .L230
	b .L235
.L230:
	ldr r4, [fp, #-124]
	mov r0, r4
	add sp, sp, #224
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

.L231:
	ldr r4, [fp, #-128]
	sub r5, r4, #1
	ldr r4, [fp, #-124]
	ldr r6, [fp, #-120]
	add r7, r4, r6
	ldr r4, =998244353
	sdiv r6, r7, r4
	mul r4, r6, r4
	sub r6, r7, r4
	ldr r4, [fp, #-116]
	ldr r7, [fp, #-112]
	ldr r8, [fp, #-108]
	str r8, [fp, #-132]
	ldr r8, [fp, #-104]
	str r8, [fp, #-136]
	ldr r8, [fp, #-100]
	str r8, [fp, #-140]
	ldr r8, [fp, #-96]
	str r8, [fp, #-144]
	ldr r8, [fp, #-92]
	str r8, [fp, #-148]
	ldr r8, [fp, #-88]
	str r8, [fp, #-152]
	ldr r8, [fp, #-84]
	str r8, [fp, #-156]
	ldr r8, [fp, #-80]
	str r8, [fp, #-160]
	ldr r8, [fp, #-76]
	str r8, [fp, #-164]
	ldr r8, [fp, #-72]
	str r8, [fp, #-168]
	ldr r8, [fp, #-68]
	str r8, [fp, #-172]
	ldr r8, [fp, #-64]
	str r8, [fp, #-176]
	ldr r8, [fp, #-60]
	str r8, [fp, #-180]
	ldr r8, [fp, #-56]
	str r8, [fp, #-184]
	ldr r8, [fp, #-52]
	str r8, [fp, #-188]
	ldr r8, [fp, #-48]
	str r8, [fp, #-192]
	ldr r8, [fp, #-44]
	str r8, [fp, #-196]
	ldr r8, [fp, #-40]
	str r8, [fp, #-200]
	ldr r8, [fp, #-36]
	str r8, [fp, #-204]
	ldr r8, [fp, #-32]
	str r8, [fp, #-208]
	ldr r8, [fp, #-28]
	str r8, [fp, #-212]
	ldr r8, [fp, #-24]
	str r8, [fp, #-216]
	ldr r8, [fp, #-20]
	str r8, [fp, #-220]
	ldr r8, [fp, #-16]
	str r8, [fp, #-224]
	ldr r8, [fp, #-12]
	ldr r9, [fp, #-8]
	ldr r10, [fp, #-4]
	mov r0, r5
	mov r1, r6
	mov r2, r4
	mov r3, r7
	mov r4, #0
	push {r4}
	push {r10}
	push {r9}
	push {r8}
	ldr r4, [fp, #-224]
	push {r4}
	ldr r5, [fp, #-220]
	push {r5}
	ldr r5, [fp, #-216]
	push {r5}
	ldr r4, [fp, #-212]
	push {r4}
	ldr r5, [fp, #-208]
	push {r5}
	ldr r4, [fp, #-204]
	push {r4}
	ldr r5, [fp, #-200]
	push {r5}
	ldr r4, [fp, #-196]
	push {r4}
	ldr r5, [fp, #-192]
	push {r5}
	ldr r4, [fp, #-188]
	push {r4}
	ldr r5, [fp, #-184]
	push {r5}
	ldr r4, [fp, #-180]
	push {r4}
	ldr r5, [fp, #-176]
	push {r5}
	ldr r4, [fp, #-172]
	push {r4}
	ldr r5, [fp, #-168]
	push {r5}
	ldr r4, [fp, #-164]
	push {r4}
	ldr r5, [fp, #-160]
	push {r5}
	ldr r4, [fp, #-156]
	push {r4}
	ldr r5, [fp, #-152]
	push {r5}
	ldr r4, [fp, #-148]
	push {r4}
	ldr r5, [fp, #-144]
	push {r5}
	ldr r4, [fp, #-140]
	push {r4}
	ldr r5, [fp, #-136]
	push {r5}
	ldr r4, [fp, #-132]
	push {r4}
	bl param32_rec
	add sp, sp, #112
	mov r5, r0
	mov r0, r5
	add sp, sp, #224
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	b .F0
.LTORG
.F0:
.L232:
.L234:
.L235:
	b .L231
.L236:
	.global param32_arr
	.type param32_arr , %function
param32_arr:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #132
.L270:
	str r0, [fp, #-132]
	str r1, [fp, #-128]
	str r2, [fp, #-124]
	str r3, [fp, #-120]
	ldr r0, [fp, #28]
	str r0, [fp, #-116]
	ldr r0, [fp, #32]
	str r0, [fp, #-112]
	ldr r0, [fp, #36]
	str r0, [fp, #-108]
	ldr r0, [fp, #40]
	str r0, [fp, #-104]
	ldr r0, [fp, #44]
	str r0, [fp, #-100]
	ldr r0, [fp, #48]
	str r0, [fp, #-96]
	ldr r0, [fp, #52]
	str r0, [fp, #-92]
	ldr r0, [fp, #56]
	str r0, [fp, #-88]
	ldr r0, [fp, #60]
	str r0, [fp, #-84]
	ldr r0, [fp, #64]
	str r0, [fp, #-80]
	ldr r0, [fp, #68]
	str r0, [fp, #-76]
	ldr r0, [fp, #72]
	str r0, [fp, #-72]
	ldr r0, [fp, #76]
	str r0, [fp, #-68]
	ldr r0, [fp, #80]
	str r0, [fp, #-64]
	ldr r0, [fp, #84]
	str r0, [fp, #-60]
	ldr r0, [fp, #88]
	str r0, [fp, #-56]
	ldr r0, [fp, #92]
	str r0, [fp, #-52]
	ldr r0, [fp, #96]
	str r0, [fp, #-48]
	ldr r0, [fp, #100]
	str r0, [fp, #-44]
	ldr r0, [fp, #104]
	str r0, [fp, #-40]
	ldr r0, [fp, #108]
	str r0, [fp, #-36]
	ldr r0, [fp, #112]
	str r0, [fp, #-32]
	ldr r0, [fp, #116]
	str r0, [fp, #-28]
	ldr r0, [fp, #120]
	str r0, [fp, #-24]
	ldr r0, [fp, #124]
	str r0, [fp, #-20]
	ldr r0, [fp, #128]
	str r0, [fp, #-16]
	ldr r0, [fp, #132]
	str r0, [fp, #-12]
	ldr r0, [fp, #136]
	str r0, [fp, #-8]
	ldr r4, [fp, #-132]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-132]
	mov r5, #1
	mov r5, #4
	mov r7, r5, LSL#0
	add r5, r6, r7
	ldr r6, [r5]
	add r7, r4, r6
	str r7, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-128]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-128]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	add r6, r7, r4
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-124]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	add r7, r5, r4
	ldr r5, [fp, #-124]
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	add r6, r7, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-120]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-120]
	mov r5, #1
	mov r6, #4
	mov r5, r6, LSL#0
	add r6, r4, r5
	ldr r4, [r6]
	add r5, r7, r4
	str r5, [fp, #-4]
	ldr r6, [fp, #-4]
	ldr r4, [fp, #-116]
	mov r5, #0
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [r5]
	add r7, r6, r4
	ldr r5, [fp, #-116]
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	add r6, r7, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-112]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-112]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	add r6, r7, r4
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-108]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	add r7, r5, r4
	ldr r5, [fp, #-108]
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	add r6, r7, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-104]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-104]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	add r6, r7, r4
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-100]
	mov r6, #0
	mov r8, #4
	mul r7, r6, r8
	add r6, r4, r7
	ldr r4, [r6]
	add r7, r5, r4
	ldr r5, [fp, #-100]
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	add r6, r7, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-96]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-96]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	add r6, r7, r4
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-92]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	add r7, r5, r4
	ldr r5, [fp, #-92]
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	add r6, r7, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-88]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-88]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	add r6, r7, r4
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-84]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	add r7, r5, r4
	ldr r5, [fp, #-84]
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	add r6, r7, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-80]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-80]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	add r6, r7, r4
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-76]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	add r7, r5, r4
	ldr r5, [fp, #-76]
	mov r4, #1
	mov r6, #4
	mov r4, r6, LSL#0
	add r6, r5, r4
	ldr r5, [r6]
	add r4, r7, r5
	str r4, [fp, #-4]
	ldr r6, [fp, #-4]
	ldr r5, [fp, #-72]
	mov r4, #0
	mov r8, #4
	mul r7, r4, r8
	add r4, r5, r7
	ldr r5, [r4]
	add r7, r6, r5
	ldr r4, [fp, #-72]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	add r6, r7, r4
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-68]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	add r7, r5, r4
	ldr r5, [fp, #-68]
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	add r6, r7, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-64]
	mov r6, #0
	mov r8, #4
	mul r7, r6, r8
	add r6, r5, r7
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-64]
	mov r5, #1
	mov r6, #4
	mov r5, r6, LSL#0
	add r6, r4, r5
	ldr r4, [r6]
	add r5, r7, r4
	str r5, [fp, #-4]
	ldr r6, [fp, #-4]
	ldr r4, [fp, #-60]
	mov r5, #0
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [r5]
	add r7, r6, r4
	ldr r5, [fp, #-60]
	mov r4, #1
	mov r6, #4
	mov r4, r6, LSL#0
	add r6, r5, r4
	ldr r5, [r6]
	add r4, r7, r5
	str r4, [fp, #-4]
	ldr r6, [fp, #-4]
	ldr r5, [fp, #-56]
	mov r4, #0
	mov r7, #4
	mul r8, r4, r7
	add r4, r5, r8
	ldr r5, [r4]
	add r7, r6, r5
	ldr r4, [fp, #-56]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	add r6, r7, r4
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-52]
	mov r6, #0
	mov r8, #4
	mul r7, r6, r8
	add r6, r4, r7
	ldr r4, [r6]
	add r7, r5, r4
	ldr r5, [fp, #-52]
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	add r6, r7, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-48]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-48]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	add r6, r7, r4
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-44]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	add r7, r5, r4
	ldr r5, [fp, #-44]
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	add r6, r7, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-40]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-40]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	add r6, r7, r4
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-36]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	add r7, r5, r4
	ldr r5, [fp, #-36]
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	add r6, r7, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-32]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-32]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	add r6, r7, r4
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-28]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	add r7, r5, r4
	ldr r5, [fp, #-28]
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	add r6, r7, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-24]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-24]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	add r6, r7, r4
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-20]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	add r7, r5, r4
	ldr r5, [fp, #-20]
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	add r6, r7, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	b .B0
.LTORG
.B0:
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-16]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	add r6, r7, r4
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-12]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [r6]
	add r7, r5, r4
	ldr r5, [fp, #-12]
	mov r4, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	ldr r5, [r4]
	add r6, r7, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	add r7, r4, r5
	ldr r4, [fp, #-8]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	add r6, r7, r4
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r5
	add sp, sp, #132
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	b .F2
.LTORG
.F2:
	.global param16
	.type param16 , %function
param16:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #344
.L656:
	str r0, [fp, #-128]
	str r1, [fp, #-124]
	str r2, [fp, #-120]
	str r3, [fp, #-116]
	ldr r0, [fp, #36]
	str r0, [fp, #-112]
	ldr r0, [fp, #40]
	str r0, [fp, #-108]
	ldr r0, [fp, #44]
	str r0, [fp, #-104]
	ldr r0, [fp, #48]
	str r0, [fp, #-100]
	ldr r0, [fp, #52]
	str r0, [fp, #-96]
	ldr r0, [fp, #56]
	str r0, [fp, #-92]
	ldr r0, [fp, #60]
	str r0, [fp, #-88]
	ldr r0, [fp, #64]
	str r0, [fp, #-84]
	ldr r0, [fp, #68]
	str r0, [fp, #-80]
	ldr r0, [fp, #72]
	str r0, [fp, #-76]
	ldr r0, [fp, #76]
	str r0, [fp, #-72]
	ldr r0, [fp, #80]
	str r0, [fp, #-68]
	ldr r4, [fp, #-128]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	mov r5, #-64
	add r5, fp, r5
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-124]
	add r5, r6, #4
	str r4, [r5]
	ldr r6, [fp, #-120]
	add r4, r5, #4
	str r6, [r4]
	ldr r5, [fp, #-116]
	add r6, r4, #4
	str r5, [r6]
	ldr r4, [fp, #-112]
	add r5, r6, #4
	str r4, [r5]
	ldr r6, [fp, #-108]
	add r4, r5, #4
	str r6, [r4]
	ldr r5, [fp, #-104]
	add r6, r4, #4
	str r5, [r6]
	ldr r4, [fp, #-100]
	add r5, r6, #4
	str r4, [r5]
	ldr r6, [fp, #-96]
	add r4, r5, #4
	str r6, [r4]
	ldr r5, [fp, #-92]
	add r6, r4, #4
	str r5, [r6]
	ldr r4, [fp, #-88]
	add r5, r6, #4
	str r4, [r5]
	ldr r6, [fp, #-84]
	add r4, r5, #4
	str r6, [r4]
	ldr r5, [fp, #-80]
	add r6, r4, #4
	str r5, [r6]
	ldr r4, [fp, #-76]
	add r5, r6, #4
	str r4, [r5]
	ldr r6, [fp, #-72]
	add r4, r5, #4
	str r6, [r4]
	ldr r5, [fp, #-68]
	add r6, r4, #4
	str r5, [r6]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-64
	add r4, fp, r4
	add r5, r4, r6
	mov r0, r5
	mov r1, #16
	bl sort
	mov r5, #0
	mov r6, #4
	mul r4, r5, r6
	mov r5, #-64
	add r5, fp, r5
	add r6, r5, r4
	ldr r4, [r6]
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	mov r5, #-64
	add r7, fp, r5
	add r5, r7, r6
	ldr r6, [r5]
	mov r7, #2
	mov r5, #4
	mov r7, r5, LSL#1
	mov r5, #-64
	add r8, fp, r5
	add r5, r8, r7
	ldr r7, [r5]
	mov r8, #3
	mov r5, #4
	mul r9, r8, r5
	mov r8, #-64
	add r8, fp, r8
	add r5, r8, r9
	ldr r9, [r5]
	mov r8, #4
	mov r5, #4
	mov r8, r5, LSL#2
	mov r5, #-64
	add r10, fp, r5
	add r5, r10, r8
	ldr r5, [r5]
	str r5, [fp, #-132]
	mov r8, #5
	mov r5, #4
	mul r10, r8, r5
	mov r8, #-64
	add r8, fp, r8
	add r5, r8, r10
	ldr r5, [r5]
	str r5, [fp, #-224]
	mov r8, #6
	mov r5, #4
	mul r10, r8, r5
	mov r8, #-64
	add r5, fp, r8
	add r8, r5, r10
	ldr r5, [r8]
	str r5, [fp, #-256]
	mov r8, #7
	mov r5, #4
	mul r10, r8, r5
	mov r8, #-64
	add r5, fp, r8
	add r8, r5, r10
	ldr r5, [r8]
	str r5, [fp, #-260]
	mov r8, #8
	mov r5, #4
	mov r8, r5, LSL#3
	mov r5, #-64
	add r5, fp, r5
	add r8, r5, r8
	str r8, [fp, #-136]
	ldr r5, [fp, #-136]
	ldr r8, [r5]
	str r8, [fp, #-264]
	mov r5, #9
	str r5, [fp, #-228]
	mov r8, #4
	ldr r8, [fp, #-140]
	str r8, [fp, #-140]
	ldr r5, [fp, #-228]
	mul r8, r5, r8
	str r8, [fp, #-144]
	mov r5, #-64
	add r5, fp, r5
	ldr r8, [fp, #-144]
	add r8, r5, r8
	str r8, [fp, #-148]
	ldr r5, [fp, #-148]
	ldr r8, [r5]
	str r8, [fp, #-268]
	mov r5, #10
	str r5, [fp, #-232]
	mov r8, #4
	ldr r8, [fp, #-152]
	str r8, [fp, #-152]
	ldr r5, [fp, #-232]
	mul r8, r5, r8
	str r8, [fp, #-156]
	mov r5, #-64
	add r5, fp, r5
	ldr r8, [fp, #-156]
	add r8, r5, r8
	str r8, [fp, #-160]
	ldr r5, [fp, #-160]
	ldr r8, [r5]
	str r8, [fp, #-272]
	mov r5, #11
	str r5, [fp, #-236]
	mov r8, #4
	ldr r8, [fp, #-164]
	str r8, [fp, #-164]
	ldr r5, [fp, #-236]
	mul r8, r5, r8
	str r8, [fp, #-168]
	mov r5, #-64
	add r5, fp, r5
	ldr r8, [fp, #-168]
	add r8, r5, r8
	str r8, [fp, #-172]
	ldr r5, [fp, #-172]
	ldr r8, [r5]
	str r8, [fp, #-276]
	mov r5, #12
	str r5, [fp, #-240]
	mov r8, #4
	ldr r8, [fp, #-180]
	str r8, [fp, #-180]
	ldr r5, [fp, #-240]
	mul r8, r5, r8
	str r8, [fp, #-176]
	mov r5, #-64
	add r5, fp, r5
	ldr r8, [fp, #-176]
	add r8, r5, r8
	str r8, [fp, #-184]
	ldr r5, [fp, #-184]
	ldr r8, [r5]
	str r8, [fp, #-280]
	mov r5, #13
	str r5, [fp, #-244]
	mov r8, #4
	ldr r8, [fp, #-188]
	str r8, [fp, #-188]
	ldr r5, [fp, #-244]
	mul r8, r5, r8
	str r8, [fp, #-192]
	mov r5, #-64
	add r5, fp, r5
	ldr r8, [fp, #-192]
	add r8, r5, r8
	str r8, [fp, #-196]
	ldr r5, [fp, #-196]
	ldr r8, [r5]
	str r8, [fp, #-284]
	mov r5, #14
	str r5, [fp, #-248]
	mov r8, #4
	ldr r8, [fp, #-200]
	str r8, [fp, #-200]
	ldr r5, [fp, #-248]
	mul r8, r5, r8
	str r8, [fp, #-204]
	mov r5, #-64
	add r5, fp, r5
	ldr r8, [fp, #-204]
	add r8, r5, r8
	str r8, [fp, #-208]
	ldr r5, [fp, #-208]
	ldr r8, [r5]
	str r8, [fp, #-288]
	mov r5, #15
	str r5, [fp, #-252]
	mov r8, #4
	ldr r8, [fp, #-216]
	str r8, [fp, #-216]
	ldr r5, [fp, #-252]
	mul r8, r5, r8
	str r8, [fp, #-212]
	mov r5, #-64
	add r5, fp, r5
	ldr r8, [fp, #-212]
	add r8, r5, r8
	str r8, [fp, #-220]
	ldr r5, [fp, #-220]
	ldr r8, [r5]
	str r8, [fp, #-292]
	ldr r5, [fp, #-128]
	str r5, [fp, #-296]
	ldr r8, [fp, #-124]
	str r8, [fp, #-300]
	ldr r5, [fp, #-120]
	str r5, [fp, #-304]
	ldr r8, [fp, #-116]
	str r8, [fp, #-308]
	ldr r5, [fp, #-112]
	str r5, [fp, #-312]
	ldr r8, [fp, #-108]
	str r8, [fp, #-316]
	ldr r5, [fp, #-104]
	str r5, [fp, #-320]
	ldr r8, [fp, #-100]
	str r8, [fp, #-324]
	ldr r5, [fp, #-96]
	str r5, [fp, #-328]
	ldr r8, [fp, #-92]
	str r8, [fp, #-332]
	ldr r5, [fp, #-88]
	str r5, [fp, #-336]
	ldr r8, [fp, #-84]
	str r8, [fp, #-340]
	ldr r5, [fp, #-80]
	str r5, [fp, #-344]
	ldr r8, [fp, #-76]
	ldr r5, [fp, #-72]
	ldr r10, [fp, #-68]
	mov r0, r4
	mov r1, r6
	mov r2, r7
	mov r3, r9
	push {r10}
	push {r5}
	push {r8}
	ldr r4, [fp, #-344]
	push {r4}
	ldr r5, [fp, #-340]
	push {r5}
	ldr r5, [fp, #-336]
	push {r5}
	ldr r4, [fp, #-332]
	push {r4}
	ldr r5, [fp, #-328]
	push {r5}
	ldr r4, [fp, #-324]
	push {r4}
	ldr r5, [fp, #-320]
	push {r5}
	ldr r4, [fp, #-316]
	push {r4}
	ldr r5, [fp, #-312]
	push {r5}
	ldr r4, [fp, #-308]
	push {r4}
	ldr r5, [fp, #-304]
	push {r5}
	ldr r4, [fp, #-300]
	push {r4}
	ldr r5, [fp, #-296]
	push {r5}
	ldr r4, [fp, #-292]
	push {r4}
	ldr r5, [fp, #-288]
	push {r5}
	ldr r4, [fp, #-284]
	push {r4}
	ldr r5, [fp, #-280]
	push {r5}
	ldr r4, [fp, #-276]
	push {r4}
	ldr r5, [fp, #-272]
	push {r5}
	ldr r4, [fp, #-268]
	push {r4}
	ldr r5, [fp, #-264]
	push {r5}
	ldr r4, [fp, #-260]
	push {r4}
	ldr r5, [fp, #-256]
	push {r5}
	ldr r4, [fp, #-224]
	push {r4}
	ldr r5, [fp, #-132]
	push {r5}
	bl param32_rec
	add sp, sp, #112
	mov r4, r0
	mov r0, r4
	add sp, sp, #344
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	b .F3
.LTORG
.F3:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	ldr r4, =944
	sub sp, sp, r4
.L788:
	bl getint
	mov r4, r0
	bl getint
	mov r5, r0
	bl getint
	mov r6, r0
	bl getint
	mov r7, r0
	bl getint
	mov r8, r0
	str r8, [fp, #-264]
	bl getint
	mov r8, r0
	str r8, [fp, #-624]
	bl getint
	mov r8, r0
	str r8, [fp, #-696]
	bl getint
	mov r8, r0
	str r8, [fp, #-776]
	bl getint
	mov r8, r0
	str r8, [fp, #-800]
	bl getint
	mov r8, r0
	str r8, [fp, #-812]
	bl getint
	mov r8, r0
	str r8, [fp, #-824]
	bl getint
	mov r8, r0
	str r8, [fp, #-832]
	bl getint
	mov r8, r0
	str r8, [fp, #-840]
	bl getint
	mov r8, r0
	bl getint
	mov r9, r0
	bl getint
	mov r10, r0
	mov r0, r4
	mov r1, r5
	mov r2, r6
	mov r3, r7
	push {r10}
	push {r9}
	push {r8}
	ldr r4, [fp, #-840]
	push {r4}
	ldr r5, [fp, #-832]
	push {r5}
	ldr r5, [fp, #-824]
	push {r5}
	ldr r4, [fp, #-812]
	push {r4}
	ldr r5, [fp, #-800]
	push {r5}
	ldr r4, [fp, #-776]
	push {r4}
	ldr r5, [fp, #-696]
	push {r5}
	ldr r4, [fp, #-624]
	push {r4}
	ldr r5, [fp, #-264]
	push {r5}
	bl param16
	add sp, sp, #48
	mov r4, r0
	mov r5, #0
	mov r6, #8
	mul r7, r5, r6
	ldr r5, =-260
	add r6, fp, r5
	add r5, r6, r7
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	mov r4, #0
	mov r7, #8
	mul r5, r4, r7
	ldr r7, =-260
	add r4, fp, r7
	add r4, r4, r5
	add r5, r6, #4
	ldr r4, =8848
	str r4, [r5]
	mov r6, #1
	mov r4, #8
	mov r6, r4, LSL#0
	ldr r4, =-260
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #1
	mov r4, #8
	mov r5, r4, LSL#0
	ldr r4, =-260
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #2
	mov r4, #8
	mov r6, r4, LSL#1
	ldr r4, =-260
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #2
	mov r4, #8
	mov r5, r4, LSL#1
	ldr r4, =-260
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #3
	mov r6, #8
	mul r7, r4, r6
	ldr r4, =-260
	add r4, fp, r4
	add r6, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #3
	mov r4, #8
	mul r7, r5, r4
	ldr r5, =-260
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #4
	mov r5, #8
	mov r6, r5, LSL#2
	ldr r5, =-260
	add r5, fp, r5
	add r5, r5, r6
	add r6, r4, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #4
	mov r4, #8
	mov r5, r4, LSL#2
	ldr r4, =-260
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #5
	mov r7, #8
	mul r6, r4, r7
	ldr r4, =-260
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #5
	mov r4, #8
	mul r7, r5, r4
	ldr r5, =-260
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #6
	mov r4, #8
	mul r7, r6, r4
	ldr r6, =-260
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #6
	mov r6, #8
	mul r7, r5, r6
	ldr r5, =-260
	add r6, fp, r5
	add r5, r6, r7
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #7
	mov r6, #8
	mul r7, r4, r6
	ldr r4, =-260
	add r6, fp, r4
	add r4, r6, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #7
	mov r6, #8
	mul r7, r5, r6
	ldr r5, =-260
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #8
	mov r4, #8
	mov r5, r4, LSL#3
	ldr r4, =-260
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #8
	mov r4, #8
	mov r6, r4, LSL#3
	ldr r4, =-260
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #9
	mov r5, #8
	mul r7, r4, r5
	ldr r4, =-260
	add r5, fp, r4
	add r4, r5, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #9
	mov r5, #8
	mul r7, r6, r5
	ldr r6, =-260
	add r5, fp, r6
	add r6, r5, r7
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #10
	mov r6, #8
	mul r7, r4, r6
	ldr r4, =-260
	add r4, fp, r4
	add r6, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #10
	mov r4, #8
	mul r7, r5, r4
	ldr r5, =-260
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #11
	mov r5, #8
	mul r7, r6, r5
	ldr r6, =-260
	add r5, fp, r6
	add r6, r5, r7
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #11
	mov r6, #8
	mul r7, r4, r6
	ldr r4, =-260
	add r4, fp, r4
	add r6, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #12
	mov r7, #8
	mul r4, r5, r7
	ldr r5, =-260
	add r5, fp, r5
	add r7, r5, r4
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #12
	mov r7, #8
	mul r5, r6, r7
	ldr r6, =-260
	add r7, fp, r6
	add r6, r7, r5
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #13
	mov r5, #8
	mul r7, r4, r5
	ldr r4, =-260
	add r5, fp, r4
	add r4, r5, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #13
	mov r7, #8
	mul r5, r6, r7
	ldr r6, =-260
	add r6, fp, r6
	add r7, r6, r5
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #14
	mov r7, #8
	mul r6, r4, r7
	ldr r4, =-260
	add r7, fp, r4
	add r4, r7, r6
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #14
	mov r6, #8
	mul r7, r5, r6
	ldr r5, =-260
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #15
	mov r5, #8
	mul r7, r4, r5
	ldr r4, =-260
	add r5, fp, r4
	add r4, r5, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #15
	mov r5, #8
	mul r7, r6, r5
	ldr r6, =-260
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #16
	mov r4, #8
	mov r5, r4, LSL#4
	ldr r4, =-260
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #16
	mov r4, #8
	mov r6, r4, LSL#4
	ldr r4, =-260
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #17
	mov r5, #8
	mul r7, r4, r5
	ldr r4, =-260
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #17
	mov r4, #8
	mul r7, r6, r4
	ldr r6, =-260
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #18
	mov r6, #8
	mul r7, r5, r6
	ldr r5, =-260
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #18
	mov r5, #8
	mul r7, r4, r5
	ldr r4, =-260
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #19
	mov r4, #8
	mul r7, r6, r4
	ldr r6, =-260
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #19
	mov r6, #8
	mul r7, r5, r6
	ldr r5, =-260
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #20
	mov r5, #8
	mul r7, r4, r5
	ldr r4, =-260
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #20
	mov r4, #8
	mul r7, r6, r4
	ldr r6, =-260
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #21
	mov r6, #8
	mul r7, r5, r6
	ldr r5, =-260
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #21
	mov r5, #8
	mul r7, r4, r5
	ldr r4, =-260
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #22
	mov r4, #8
	mul r7, r6, r4
	ldr r6, =-260
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #22
	mov r6, #8
	mul r7, r5, r6
	ldr r5, =-260
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #23
	mov r5, #8
	mul r7, r4, r5
	ldr r4, =-260
	add r5, fp, r4
	add r4, r5, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #23
	mov r5, #8
	mul r7, r6, r5
	ldr r6, =-260
	add r5, fp, r6
	add r5, r5, r7
	b .B1
.LTORG
.B1:
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #24
	mov r5, #8
	mul r7, r4, r5
	ldr r4, =-260
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #24
	mov r4, #8
	mul r7, r6, r4
	ldr r6, =-260
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #25
	mov r6, #8
	mul r7, r5, r6
	ldr r5, =-260
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #25
	mov r7, #8
	mul r5, r4, r7
	ldr r4, =-260
	add r7, fp, r4
	add r4, r7, r5
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #26
	mov r7, #8
	mul r5, r6, r7
	ldr r6, =-260
	add r6, fp, r6
	add r7, r6, r5
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #26
	mov r6, #8
	mul r7, r4, r6
	ldr r4, =-260
	add r4, fp, r4
	add r6, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #27
	mov r4, #8
	mul r7, r5, r4
	ldr r5, =-260
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #27
	mov r4, #8
	mul r7, r6, r4
	ldr r6, =-260
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #28
	mov r4, #8
	mul r7, r5, r4
	ldr r5, =-260
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #28
	mov r4, #8
	mul r7, r6, r4
	ldr r6, =-260
	add r4, fp, r6
	add r4, r4, r7
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #29
	mov r4, #8
	mul r7, r5, r4
	ldr r5, =-260
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #29
	mov r5, #8
	mul r7, r6, r5
	ldr r6, =-260
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #30
	mov r5, #8
	mul r7, r4, r5
	ldr r4, =-260
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #30
	mov r7, #8
	mul r4, r6, r7
	ldr r6, =-260
	add r6, fp, r6
	add r7, r6, r4
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #31
	mov r6, #8
	mul r7, r5, r6
	ldr r5, =-260
	add r5, fp, r5
	add r6, r5, r7
	add r6, r4, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #31
	mov r5, #8
	mul r7, r4, r5
	ldr r4, =-260
	add r5, fp, r4
	add r4, r5, r7
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L919
	b .F5
.LTORG
.F5:
.L919:
	ldr r5, [fp, #-4]
	cmp r5, #32
	movlt r4, #1
	movge r4, #0
	blt .L920
	b .L924
.L920:
	ldr r5, [fp, #-4]
	sub r4, r5, #1
	mov r5, #8
	mul r6, r4, r5
	ldr r4, =-260
	add r4, fp, r4
	add r5, r4, r6
	mov r6, #1
	mov r6, #4
	mov r4, r6, LSL#0
	add r6, r5, r4
	ldr r5, [r6]
	sub r4, r5, #1
	ldr r6, [fp, #-4]
	mov r5, #8
	mul r7, r6, r5
	ldr r6, =-260
	add r6, fp, r6
	add r5, r6, r7
	mov r7, #0
	mov r6, #4
	mul r8, r7, r6
	add r7, r5, r8
	str r4, [r7]
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	mov r6, #8
	mul r4, r5, r6
	ldr r6, =-260
	add r6, fp, r6
	add r5, r6, r4
	mov r4, #0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	sub r6, r5, #2
	ldr r4, [fp, #-4]
	mov r7, #8
	mul r5, r4, r7
	ldr r4, =-260
	add r4, fp, r4
	add r7, r4, r5
	mov r5, #1
	mov r4, #4
	mov r5, r4, LSL#0
	add r4, r7, r5
	str r6, [r4]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L919
.L921:
	mov r5, #0
	mov r4, #8
	mul r6, r5, r4
	ldr r5, =-260
	add r5, fp, r5
	add r4, r5, r6
	mov r6, #0
	mov r5, #4
	mul r7, r6, r5
	add r6, r4, r7
	mov r4, #1
	mov r4, #8
	mov r5, r4, LSL#0
	ldr r4, =-260
	add r7, fp, r4
	add r4, r7, r5
	mov r5, #0
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	mov r4, #2
	mov r4, #8
	mov r7, r4, LSL#1
	ldr r4, =-260
	add r4, fp, r4
	add r8, r4, r7
	mov r7, #0
	mov r4, #4
	mul r9, r7, r4
	add r7, r8, r9
	mov r4, #3
	mov r8, #8
	mul r9, r4, r8
	ldr r4, =-260
	add r4, fp, r4
	add r8, r4, r9
	mov r9, #0
	mov r4, #4
	mul r10, r9, r4
	add r9, r8, r10
	mov r4, #4
	mov r4, #8
	mov r8, r4, LSL#2
	ldr r4, =-260
	add r10, fp, r4
	add r4, r10, r8
	mov r8, #0
	mov r10, #4
	mul r8, r8, r10
	str r8, [fp, #-848]
	ldr r10, [fp, #-848]
	add r4, r4, r10
	str r4, [fp, #-268]
	mov r8, #5
	mov r4, #8
	mul r10, r8, r4
	ldr r8, =-260
	add r4, fp, r8
	add r8, r4, r10
	mov r4, #0
	mov r10, #4
	mul r4, r4, r10
	str r4, [fp, #-852]
	ldr r10, [fp, #-852]
	add r4, r8, r10
	str r4, [fp, #-700]
	mov r8, #6
	mov r4, #8
	mul r10, r8, r4
	ldr r8, =-260
	add r4, fp, r8
	add r8, r4, r10
	mov r4, #0
	mov r10, #4
	mul r4, r4, r10
	str r4, [fp, #-856]
	ldr r10, [fp, #-856]
	add r4, r8, r10
	str r4, [fp, #-780]
	mov r8, #7
	mov r4, #8
	mul r10, r8, r4
	ldr r8, =-260
	add r8, fp, r8
	add r4, r8, r10
	mov r10, #0
	mov r8, #4
	mul r10, r10, r8
	str r10, [fp, #-860]
	ldr r8, [fp, #-860]
	add r4, r4, r8
	str r4, [fp, #-804]
	mov r8, #8
	mov r4, #8
	mov r8, r4, LSL#3
	ldr r4, =-260
	add r10, fp, r4
	add r4, r10, r8
	mov r8, #0
	mov r10, #4
	mul r8, r8, r10
	str r8, [fp, #-864]
	ldr r10, [fp, #-864]
	add r4, r4, r10
	str r4, [fp, #-816]
	mov r8, #9
	mov r10, #8
	mul r4, r8, r10
	ldr r8, =-260
	add r10, fp, r8
	add r4, r10, r4
	str r4, [fp, #-868]
	mov r8, #0
	mov r4, #4
	mul r10, r8, r4
	ldr r8, [fp, #-868]
	add r4, r8, r10
	str r4, [fp, #-828]
	mov r8, #10
	mov r4, #8
	mul r10, r8, r4
	ldr r8, =-260
	add r8, fp, r8
	add r4, r8, r10
	mov r10, #0
	mov r8, #4
	mul r10, r10, r8
	str r10, [fp, #-876]
	ldr r8, [fp, #-876]
	add r4, r4, r8
	str r4, [fp, #-836]
	mov r8, #11
	mov r4, #8
	mul r10, r8, r4
	ldr r8, =-260
	add r4, fp, r8
	add r8, r4, r10
	str r8, [fp, #-880]
	mov r4, #0
	mov r8, #4
	mul r10, r4, r8
	ldr r4, [fp, #-880]
	add r8, r4, r10
	str r8, [fp, #-844]
	mov r4, #12
	mov r8, #8
	mul r10, r4, r8
	ldr r4, =-260
	add r4, fp, r4
	add r8, r4, r10
	mov r10, #0
	mov r4, #4
	mul r10, r10, r4
	str r10, [fp, #-704]
	ldr r4, [fp, #-704]
	add r8, r8, r4
	str r8, [fp, #-872]
	mov r4, #13
	mov r8, #8
	mul r4, r4, r8
	str r4, [fp, #-708]
	ldr r8, =-260
	add r8, fp, r8
	ldr r4, [fp, #-708]
	add r4, r8, r4
	mov r8, #0
	str r8, [fp, #-808]
	mov r8, #4
	ldr r8, [fp, #-784]
	str r8, [fp, #-784]
	ldr r8, [fp, #-808]
	mul r8, r8, r8
	str r8, [fp, #-272]
	ldr r8, [fp, #-272]
	add r4, r4, r8
	str r4, [fp, #-884]
	mov r8, #14
	str r8, [fp, #-820]
	mov r4, #8
	ldr r4, [fp, #-788]
	str r4, [fp, #-788]
	ldr r8, [fp, #-820]
	mul r4, r8, r4
	str r4, [fp, #-276]
	ldr r8, =-260
	add r8, fp, r8
	ldr r4, [fp, #-276]
	add r4, r8, r4
	str r4, [fp, #-792]
	mov r8, #0
	str r8, [fp, #-628]
	mov r4, #4
	ldr r4, [fp, #-284]
	str r4, [fp, #-284]
	ldr r8, [fp, #-628]
	mul r4, r8, r4
	str r4, [fp, #-280]
	ldr r8, [fp, #-280]
	ldr r4, [fp, #-792]
	add r8, r4, r8
	str r8, [fp, #-888]
	mov r4, #15
	str r4, [fp, #-712]
	mov r8, #8
	ldr r8, [fp, #-292]
	str r8, [fp, #-292]
	ldr r4, [fp, #-712]
	mul r8, r4, r8
	str r8, [fp, #-288]
	ldr r4, =-260
	add r4, fp, r4
	ldr r8, [fp, #-288]
	add r8, r4, r8
	str r8, [fp, #-296]
	mov r4, #0
	str r4, [fp, #-796]
	mov r8, #4
	ldr r8, [fp, #-300]
	str r8, [fp, #-300]
	ldr r4, [fp, #-796]
	mul r8, r4, r8
	str r8, [fp, #-304]
	ldr r4, [fp, #-296]
	ldr r8, [fp, #-304]
	add r4, r4, r8
	str r4, [fp, #-892]
	mov r8, #16
	mov r4, #8
	mov r8, r4, LSL#4
	str r8, [fp, #-308]
	ldr r4, =-260
	add r4, fp, r4
	ldr r8, [fp, #-308]
	add r8, r4, r8
	str r8, [fp, #-312]
	mov r4, #0
	str r4, [fp, #-632]
	mov r8, #4
	ldr r8, [fp, #-316]
	str r8, [fp, #-316]
	ldr r4, [fp, #-632]
	mul r8, r4, r8
	str r8, [fp, #-320]
	ldr r4, [fp, #-312]
	ldr r8, [fp, #-320]
	add r4, r4, r8
	str r4, [fp, #-896]
	mov r8, #17
	str r8, [fp, #-636]
	mov r4, #8
	ldr r4, [fp, #-324]
	str r4, [fp, #-324]
	ldr r8, [fp, #-636]
	mul r4, r8, r4
	str r4, [fp, #-328]
	ldr r8, =-260
	add r8, fp, r8
	ldr r4, [fp, #-328]
	add r4, r8, r4
	str r4, [fp, #-332]
	mov r8, #0
	str r8, [fp, #-716]
	mov r4, #4
	ldr r4, [fp, #-336]
	str r4, [fp, #-336]
	ldr r8, [fp, #-716]
	mul r4, r8, r4
	str r4, [fp, #-340]
	ldr r8, [fp, #-332]
	ldr r4, [fp, #-340]
	add r8, r8, r4
	str r8, [fp, #-900]
	mov r4, #18
	str r4, [fp, #-640]
	mov r8, #8
	ldr r8, [fp, #-344]
	str r8, [fp, #-344]
	ldr r4, [fp, #-640]
	mul r8, r4, r8
	str r8, [fp, #-348]
	ldr r4, =-260
	add r4, fp, r4
	ldr r8, [fp, #-348]
	add r8, r4, r8
	str r8, [fp, #-352]
	mov r4, #0
	str r4, [fp, #-720]
	mov r8, #4
	ldr r8, [fp, #-356]
	str r8, [fp, #-356]
	ldr r4, [fp, #-720]
	mul r8, r4, r8
	str r8, [fp, #-360]
	ldr r4, [fp, #-352]
	ldr r8, [fp, #-360]
	add r4, r4, r8
	str r4, [fp, #-904]
	mov r8, #19
	str r8, [fp, #-644]
	mov r4, #8
	ldr r4, [fp, #-364]
	str r4, [fp, #-364]
	ldr r8, [fp, #-644]
	mul r4, r8, r4
	str r4, [fp, #-368]
	ldr r8, =-260
	add r8, fp, r8
	ldr r4, [fp, #-368]
	add r4, r8, r4
	str r4, [fp, #-372]
	mov r8, #0
	str r8, [fp, #-724]
	mov r4, #4
	ldr r4, [fp, #-376]
	str r4, [fp, #-376]
	ldr r8, [fp, #-724]
	mul r4, r8, r4
	str r4, [fp, #-380]
	ldr r8, [fp, #-372]
	ldr r4, [fp, #-380]
	add r8, r8, r4
	str r8, [fp, #-908]
	mov r4, #20
	str r4, [fp, #-648]
	mov r8, #8
	ldr r8, [fp, #-388]
	str r8, [fp, #-388]
	ldr r4, [fp, #-648]
	mul r8, r4, r8
	str r8, [fp, #-384]
	ldr r4, =-260
	add r4, fp, r4
	ldr r8, [fp, #-384]
	add r8, r4, r8
	str r8, [fp, #-392]
	mov r4, #0
	str r4, [fp, #-728]
	mov r8, #4
	ldr r8, [fp, #-396]
	str r8, [fp, #-396]
	ldr r4, [fp, #-728]
	mul r8, r4, r8
	str r8, [fp, #-400]
	ldr r4, [fp, #-392]
	ldr r8, [fp, #-400]
	add r4, r4, r8
	str r4, [fp, #-912]
	mov r8, #21
	str r8, [fp, #-652]
	mov r4, #8
	ldr r4, [fp, #-408]
	str r4, [fp, #-408]
	ldr r8, [fp, #-652]
	mul r4, r8, r4
	str r4, [fp, #-404]
	ldr r8, =-260
	add r8, fp, r8
	ldr r4, [fp, #-404]
	add r4, r8, r4
	str r4, [fp, #-412]
	mov r8, #0
	str r8, [fp, #-732]
	mov r4, #4
	ldr r4, [fp, #-416]
	str r4, [fp, #-416]
	ldr r8, [fp, #-732]
	mul r4, r8, r4
	str r4, [fp, #-420]
	ldr r8, [fp, #-412]
	ldr r4, [fp, #-420]
	add r8, r8, r4
	str r8, [fp, #-916]
	mov r4, #22
	str r4, [fp, #-656]
	mov r8, #8
	ldr r8, [fp, #-424]
	str r8, [fp, #-424]
	ldr r4, [fp, #-656]
	mul r8, r4, r8
	str r8, [fp, #-428]
	ldr r4, =-260
	add r4, fp, r4
	ldr r8, [fp, #-428]
	add r8, r4, r8
	str r8, [fp, #-432]
	mov r4, #0
	str r4, [fp, #-736]
	mov r8, #4
	ldr r8, [fp, #-436]
	str r8, [fp, #-436]
	ldr r4, [fp, #-736]
	mul r8, r4, r8
	str r8, [fp, #-440]
	ldr r4, [fp, #-432]
	ldr r8, [fp, #-440]
	add r4, r4, r8
	str r4, [fp, #-920]
	mov r8, #23
	str r8, [fp, #-660]
	mov r4, #8
	ldr r4, [fp, #-444]
	str r4, [fp, #-444]
	ldr r8, [fp, #-660]
	mul r4, r8, r4
	str r4, [fp, #-448]
	ldr r8, =-260
	add r8, fp, r8
	ldr r4, [fp, #-448]
	add r4, r8, r4
	str r4, [fp, #-452]
	mov r8, #0
	str r8, [fp, #-740]
	mov r4, #4
	ldr r4, [fp, #-456]
	str r4, [fp, #-456]
	ldr r8, [fp, #-740]
	mul r4, r8, r4
	str r4, [fp, #-460]
	ldr r8, [fp, #-452]
	ldr r4, [fp, #-460]
	add r8, r8, r4
	str r8, [fp, #-924]
	mov r4, #24
	str r4, [fp, #-664]
	mov r8, #8
	ldr r8, [fp, #-464]
	str r8, [fp, #-464]
	ldr r4, [fp, #-664]
	mul r8, r4, r8
	str r8, [fp, #-468]
	ldr r4, =-260
	add r4, fp, r4
	ldr r8, [fp, #-468]
	add r8, r4, r8
	str r8, [fp, #-472]
	mov r4, #0
	str r4, [fp, #-744]
	mov r8, #4
	ldr r8, [fp, #-476]
	str r8, [fp, #-476]
	ldr r4, [fp, #-744]
	mul r8, r4, r8
	str r8, [fp, #-480]
	ldr r4, [fp, #-472]
	ldr r8, [fp, #-480]
	add r4, r4, r8
	str r4, [fp, #-928]
	mov r8, #25
	str r8, [fp, #-668]
	mov r4, #8
	ldr r4, [fp, #-484]
	str r4, [fp, #-484]
	ldr r8, [fp, #-668]
	mul r4, r8, r4
	str r4, [fp, #-488]
	ldr r8, =-260
	add r8, fp, r8
	ldr r4, [fp, #-488]
	add r4, r8, r4
	str r4, [fp, #-492]
	mov r8, #0
	str r8, [fp, #-748]
	mov r4, #4
	ldr r4, [fp, #-496]
	str r4, [fp, #-496]
	ldr r8, [fp, #-748]
	mul r4, r8, r4
	str r4, [fp, #-500]
	ldr r8, [fp, #-492]
	ldr r4, [fp, #-500]
	add r8, r8, r4
	str r8, [fp, #-932]
	mov r4, #26
	str r4, [fp, #-672]
	mov r8, #8
	ldr r8, [fp, #-504]
	str r8, [fp, #-504]
	ldr r4, [fp, #-672]
	mul r8, r4, r8
	str r8, [fp, #-508]
	ldr r4, =-260
	add r4, fp, r4
	ldr r8, [fp, #-508]
	add r8, r4, r8
	str r8, [fp, #-512]
	mov r4, #0
	str r4, [fp, #-752]
	mov r8, #4
	ldr r8, [fp, #-516]
	str r8, [fp, #-516]
	ldr r4, [fp, #-752]
	mul r8, r4, r8
	str r8, [fp, #-520]
	ldr r4, [fp, #-512]
	ldr r8, [fp, #-520]
	add r4, r4, r8
	str r4, [fp, #-936]
	mov r8, #27
	str r8, [fp, #-676]
	mov r4, #8
	b .B2
.LTORG
.B2:
	ldr r4, [fp, #-524]
	str r4, [fp, #-524]
	ldr r8, [fp, #-676]
	mul r4, r8, r4
	str r4, [fp, #-528]
	ldr r8, =-260
	add r8, fp, r8
	ldr r4, [fp, #-528]
	add r4, r8, r4
	str r4, [fp, #-532]
	mov r8, #0
	str r8, [fp, #-756]
	mov r4, #4
	ldr r4, [fp, #-536]
	str r4, [fp, #-536]
	ldr r8, [fp, #-756]
	mul r4, r8, r4
	str r4, [fp, #-540]
	ldr r8, [fp, #-532]
	ldr r4, [fp, #-540]
	add r8, r8, r4
	str r8, [fp, #-940]
	mov r4, #28
	str r4, [fp, #-680]
	mov r8, #8
	ldr r8, [fp, #-544]
	str r8, [fp, #-544]
	ldr r4, [fp, #-680]
	mul r8, r4, r8
	str r8, [fp, #-548]
	ldr r4, =-260
	add r4, fp, r4
	ldr r8, [fp, #-548]
	add r8, r4, r8
	str r8, [fp, #-552]
	mov r4, #0
	str r4, [fp, #-760]
	mov r8, #4
	ldr r8, [fp, #-556]
	str r8, [fp, #-556]
	ldr r4, [fp, #-760]
	mul r8, r4, r8
	str r8, [fp, #-560]
	ldr r4, [fp, #-552]
	ldr r8, [fp, #-560]
	add r4, r4, r8
	str r4, [fp, #-944]
	mov r8, #29
	str r8, [fp, #-684]
	mov r4, #8
	ldr r4, [fp, #-564]
	str r4, [fp, #-564]
	ldr r8, [fp, #-684]
	mul r4, r8, r4
	str r4, [fp, #-568]
	ldr r8, =-260
	add r8, fp, r8
	ldr r4, [fp, #-568]
	add r4, r8, r4
	str r4, [fp, #-572]
	mov r8, #0
	str r8, [fp, #-764]
	mov r4, #4
	ldr r4, [fp, #-576]
	str r4, [fp, #-576]
	ldr r8, [fp, #-764]
	mul r4, r8, r4
	str r4, [fp, #-580]
	ldr r8, [fp, #-572]
	ldr r4, [fp, #-580]
	add r8, r8, r4
	mov r4, #30
	str r4, [fp, #-688]
	mov r4, #8
	ldr r4, [fp, #-584]
	str r4, [fp, #-584]
	ldr r4, [fp, #-688]
	mul r4, r4, r4
	str r4, [fp, #-588]
	ldr r4, =-260
	add r4, fp, r4
	ldr r4, [fp, #-588]
	add r4, r4, r4
	str r4, [fp, #-592]
	mov r4, #0
	str r4, [fp, #-768]
	mov r4, #4
	ldr r4, [fp, #-596]
	str r4, [fp, #-596]
	ldr r4, [fp, #-768]
	mul r4, r4, r4
	str r4, [fp, #-600]
	ldr r4, [fp, #-592]
	ldr r4, [fp, #-600]
	add r4, r4, r4
	mov r10, #31
	str r10, [fp, #-692]
	mov r10, #8
	ldr r10, [fp, #-604]
	str r10, [fp, #-604]
	ldr r10, [fp, #-692]
	mul r10, r10, r10
	str r10, [fp, #-608]
	ldr r10, =-260
	add r10, fp, r10
	ldr r10, [fp, #-608]
	add r10, r10, r10
	str r10, [fp, #-612]
	mov r10, #0
	str r10, [fp, #-772]
	mov r10, #4
	ldr r10, [fp, #-616]
	str r10, [fp, #-616]
	ldr r10, [fp, #-772]
	mul r10, r10, r10
	str r10, [fp, #-620]
	ldr r10, [fp, #-612]
	ldr r10, [fp, #-620]
	add r10, r10, r10
	mov r0, r6
	mov r1, r5
	mov r2, r7
	mov r3, r9
	push {r10}
	push {r4}
	push {r8}
	ldr r6, [fp, #-944]
	push {r6}
	ldr r4, [fp, #-940]
	push {r4}
	ldr r4, [fp, #-936]
	push {r4}
	ldr r5, [fp, #-932]
	push {r5}
	ldr r4, [fp, #-928]
	push {r4}
	ldr r5, [fp, #-924]
	push {r5}
	ldr r4, [fp, #-920]
	push {r4}
	ldr r5, [fp, #-916]
	push {r5}
	ldr r4, [fp, #-912]
	push {r4}
	ldr r5, [fp, #-908]
	push {r5}
	ldr r4, [fp, #-904]
	push {r4}
	ldr r5, [fp, #-900]
	push {r5}
	ldr r4, [fp, #-896]
	push {r4}
	ldr r5, [fp, #-892]
	push {r5}
	ldr r4, [fp, #-888]
	push {r4}
	ldr r5, [fp, #-884]
	push {r5}
	ldr r4, [fp, #-872]
	push {r4}
	ldr r5, [fp, #-844]
	push {r5}
	ldr r4, [fp, #-836]
	push {r4}
	ldr r5, [fp, #-828]
	push {r5}
	ldr r4, [fp, #-816]
	push {r4}
	ldr r5, [fp, #-804]
	push {r5}
	ldr r4, [fp, #-780]
	push {r4}
	ldr r5, [fp, #-700]
	push {r5}
	ldr r4, [fp, #-268]
	push {r4}
	bl param32_arr
	add sp, sp, #112
	mov r5, r0
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	mov r0, #0
	ldr r2, =944
	add sp, sp, r2
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	b .F7
.LTORG
.F7:
.L923:
.L924:
	b .L921
.L925:
