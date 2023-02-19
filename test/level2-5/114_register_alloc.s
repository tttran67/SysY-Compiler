	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a1
	.align 4
	.size a1, 4
a1:
	.word 1
	.global a10
	.align 4
	.size a10, 4
a10:
	.word 10
	.global a11
	.align 4
	.size a11, 4
a11:
	.word 11
	.global a12
	.align 4
	.size a12, 4
a12:
	.word 12
	.global a13
	.align 4
	.size a13, 4
a13:
	.word 13
	.global a14
	.align 4
	.size a14, 4
a14:
	.word 14
	.global a15
	.align 4
	.size a15, 4
a15:
	.word 15
	.global a16
	.align 4
	.size a16, 4
a16:
	.word 16
	.global a17
	.align 4
	.size a17, 4
a17:
	.word 1
	.global a18
	.align 4
	.size a18, 4
a18:
	.word 2
	.global a19
	.align 4
	.size a19, 4
a19:
	.word 3
	.global a2
	.align 4
	.size a2, 4
a2:
	.word 2
	.global a20
	.align 4
	.size a20, 4
a20:
	.word 4
	.global a21
	.align 4
	.size a21, 4
a21:
	.word 5
	.global a22
	.align 4
	.size a22, 4
a22:
	.word 6
	.global a23
	.align 4
	.size a23, 4
a23:
	.word 7
	.global a24
	.align 4
	.size a24, 4
a24:
	.word 8
	.global a25
	.align 4
	.size a25, 4
a25:
	.word 9
	.global a26
	.align 4
	.size a26, 4
a26:
	.word 10
	.global a27
	.align 4
	.size a27, 4
a27:
	.word 11
	.global a28
	.align 4
	.size a28, 4
a28:
	.word 12
	.global a29
	.align 4
	.size a29, 4
a29:
	.word 13
	.global a3
	.align 4
	.size a3, 4
a3:
	.word 3
	.global a30
	.align 4
	.size a30, 4
a30:
	.word 14
	.global a31
	.align 4
	.size a31, 4
a31:
	.word 15
	.global a32
	.align 4
	.size a32, 4
a32:
	.word 16
	.global a4
	.align 4
	.size a4, 4
a4:
	.word 4
	.global a5
	.align 4
	.size a5, 4
a5:
	.word 5
	.global a6
	.align 4
	.size a6, 4
a6:
	.word 6
	.global a7
	.align 4
	.size a7, 4
a7:
	.word 7
	.global a8
	.align 4
	.size a8, 4
a8:
	.word 8
	.global a9
	.align 4
	.size a9, 4
a9:
	.word 9
	.text
	.global func
	.type func , %function
func:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #156
.L216:
	str r0, [fp, #-156]
	str r1, [fp, #-152]
	ldr r4, [fp, #-156]
	ldr r5, [fp, #-152]
	add r6, r4, r5
	str r6, [fp, #-148]
	bl getint
	mov r4, r0
	str r4, [fp, #-144]
	bl getint
	mov r5, r0
	str r5, [fp, #-140]
	bl getint
	mov r4, r0
	str r4, [fp, #-136]
	bl getint
	mov r5, r0
	str r5, [fp, #-132]
	ldr r4, [fp, #-144]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a1_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-128]
	ldr r4, [fp, #-140]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a2_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-124]
	ldr r4, [fp, #-136]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a3_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-120]
	ldr r4, [fp, #-132]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a4_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-116]
	ldr r4, [fp, #-128]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a5_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-112]
	ldr r4, [fp, #-124]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a6_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-108]
	ldr r4, [fp, #-120]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a7_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-104]
	ldr r4, [fp, #-116]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a8_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-100]
	ldr r4, [fp, #-112]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a9_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-96]
	ldr r4, [fp, #-108]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a10_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-92]
	ldr r4, [fp, #-104]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a11_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-88]
	ldr r4, [fp, #-100]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a12_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-84]
	ldr r4, [fp, #-96]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a13_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-80]
	ldr r4, [fp, #-92]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a14_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-76]
	ldr r4, [fp, #-88]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a15_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-72]
	ldr r4, [fp, #-84]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a16_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-68]
	ldr r4, [fp, #-80]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a17_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-64]
	ldr r4, [fp, #-76]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a18_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-60]
	ldr r4, [fp, #-72]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a19_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-56]
	ldr r4, [fp, #-68]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a20_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-52]
	ldr r4, [fp, #-64]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a21_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-48]
	ldr r4, [fp, #-60]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a22_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-44]
	ldr r4, [fp, #-56]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a23_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-40]
	ldr r4, [fp, #-52]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a24_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-36]
	ldr r4, [fp, #-48]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a25_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-32]
	ldr r4, [fp, #-44]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a26_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-28]
	ldr r4, [fp, #-40]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a27_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-24]
	ldr r4, [fp, #-36]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a28_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-20]
	ldr r4, [fp, #-32]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a29_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-16]
	ldr r4, [fp, #-28]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a30_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-12]
	ldr r4, [fp, #-24]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a31_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-8]
	ldr r4, [fp, #-20]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a32_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-4]
	ldr r4, [fp, #-156]
	ldr r5, [fp, #-152]
	sub r6, r4, r5
	add r4, r6, #10
	str r4, [fp, #-148]
	ldr r4, [fp, #-32]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a29_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-16]
	ldr r4, [fp, #-28]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a30_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-12]
	ldr r4, [fp, #-24]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a31_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-8]
	ldr r4, [fp, #-20]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a32_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-4]
	ldr r4, [fp, #-48]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a25_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-32]
	ldr r4, [fp, #-44]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a26_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-28]
	ldr r4, [fp, #-40]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a27_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-24]
	ldr r4, [fp, #-36]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a28_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-20]
	ldr r4, [fp, #-64]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a21_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-48]
	ldr r4, [fp, #-60]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a22_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-44]
	ldr r4, [fp, #-56]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a23_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-40]
	ldr r4, [fp, #-52]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a24_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-36]
	ldr r4, [fp, #-80]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a17_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-64]
	ldr r4, [fp, #-76]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a18_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-60]
	ldr r4, [fp, #-72]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a19_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-56]
	ldr r4, [fp, #-68]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a20_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-52]
	ldr r4, [fp, #-96]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a13_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-80]
	ldr r4, [fp, #-92]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a14_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-76]
	ldr r4, [fp, #-88]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a15_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-72]
	ldr r4, [fp, #-84]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a16_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-68]
	ldr r4, [fp, #-112]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a9_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-96]
	ldr r4, [fp, #-108]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a10_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-92]
	ldr r4, [fp, #-104]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a11_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-88]
	ldr r4, [fp, #-100]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a12_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-84]
	ldr r4, [fp, #-128]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a5_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-112]
	ldr r4, [fp, #-124]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a6_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-108]
	ldr r4, [fp, #-120]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a7_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-104]
	ldr r4, [fp, #-116]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a8_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-100]
	ldr r4, [fp, #-144]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a1_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-128]
	ldr r4, [fp, #-140]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a2_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-124]
	ldr r4, [fp, #-136]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a3_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-120]
	ldr r4, [fp, #-132]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a4_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-116]
	ldr r4, [fp, #-144]
	ldr r5, =1
	add r6, r5, r4
	ldr r4, addr_a1_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-128]
	ldr r4, [fp, #-140]
	ldr r5, =2
	add r6, r5, r4
	ldr r4, addr_a2_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-124]
	ldr r4, [fp, #-136]
	ldr r5, =3
	add r6, r5, r4
	ldr r4, addr_a3_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-120]
	ldr r4, [fp, #-132]
	ldr r5, =4
	add r6, r5, r4
	ldr r4, addr_a4_0
	ldr r5, [r4]
	add r4, r6, r5
	str r4, [fp, #-116]
	ldr r4, [fp, #-148]
	b .B0
.LTORG
addr_a1_0:
	.word a1
addr_a10_0:
	.word a10
addr_a11_0:
	.word a11
addr_a12_0:
	.word a12
addr_a13_0:
	.word a13
addr_a14_0:
	.word a14
addr_a15_0:
	.word a15
addr_a16_0:
	.word a16
addr_a17_0:
	.word a17
addr_a18_0:
	.word a18
addr_a19_0:
	.word a19
addr_a2_0:
	.word a2
addr_a20_0:
	.word a20
addr_a21_0:
	.word a21
addr_a22_0:
	.word a22
addr_a23_0:
	.word a23
addr_a24_0:
	.word a24
addr_a25_0:
	.word a25
addr_a26_0:
	.word a26
addr_a27_0:
	.word a27
addr_a28_0:
	.word a28
addr_a29_0:
	.word a29
addr_a3_0:
	.word a3
addr_a30_0:
	.word a30
addr_a31_0:
	.word a31
addr_a32_0:
	.word a32
addr_a4_0:
	.word a4
addr_a5_0:
	.word a5
addr_a6_0:
	.word a6
addr_a7_0:
	.word a7
addr_a8_0:
	.word a8
addr_a9_0:
	.word a9
.B0:
	ldr r5, [fp, #-144]
	add r6, r4, r5
	ldr r4, [fp, #-140]
	add r5, r6, r4
	ldr r4, [fp, #-136]
	add r6, r5, r4
	ldr r4, [fp, #-132]
	add r5, r6, r4
	ldr r4, [fp, #-128]
	sub r6, r5, r4
	ldr r4, [fp, #-124]
	sub r5, r6, r4
	ldr r4, [fp, #-120]
	sub r6, r5, r4
	ldr r4, [fp, #-116]
	sub r5, r6, r4
	ldr r4, [fp, #-112]
	add r6, r5, r4
	ldr r4, [fp, #-108]
	add r5, r6, r4
	ldr r4, [fp, #-104]
	add r6, r5, r4
	ldr r4, [fp, #-100]
	add r5, r6, r4
	ldr r4, [fp, #-96]
	sub r6, r5, r4
	ldr r4, [fp, #-92]
	sub r5, r6, r4
	ldr r4, [fp, #-88]
	sub r6, r5, r4
	ldr r4, [fp, #-84]
	sub r5, r6, r4
	ldr r4, [fp, #-80]
	add r6, r5, r4
	ldr r4, [fp, #-76]
	add r5, r6, r4
	ldr r4, [fp, #-72]
	add r6, r5, r4
	ldr r4, [fp, #-68]
	add r5, r6, r4
	ldr r4, [fp, #-64]
	sub r6, r5, r4
	ldr r4, [fp, #-60]
	sub r5, r6, r4
	ldr r4, [fp, #-56]
	sub r6, r5, r4
	ldr r4, [fp, #-52]
	sub r5, r6, r4
	ldr r4, [fp, #-48]
	add r6, r5, r4
	ldr r4, [fp, #-44]
	add r5, r6, r4
	ldr r4, [fp, #-40]
	add r6, r5, r4
	ldr r4, [fp, #-36]
	add r5, r6, r4
	ldr r4, [fp, #-32]
	sub r6, r5, r4
	ldr r4, [fp, #-28]
	sub r5, r6, r4
	ldr r4, [fp, #-24]
	sub r6, r5, r4
	ldr r4, [fp, #-20]
	sub r5, r6, r4
	ldr r4, [fp, #-16]
	add r6, r5, r4
	ldr r4, [fp, #-12]
	add r5, r6, r4
	ldr r4, [fp, #-8]
	add r6, r5, r4
	ldr r4, [fp, #-4]
	add r5, r6, r4
	ldr r4, addr_a1_1
	ldr r6, [r4]
	add r4, r5, r6
	ldr r6, addr_a2_1
	ldr r5, [r6]
	sub r6, r4, r5
	ldr r5, addr_a3_1
	ldr r4, [r5]
	add r5, r6, r4
	ldr r4, addr_a4_1
	ldr r6, [r4]
	sub r4, r5, r6
	ldr r6, addr_a5_1
	ldr r5, [r6]
	add r6, r4, r5
	ldr r5, addr_a6_1
	ldr r4, [r5]
	sub r5, r6, r4
	ldr r4, addr_a7_1
	ldr r6, [r4]
	add r4, r5, r6
	ldr r6, addr_a8_1
	ldr r5, [r6]
	sub r6, r4, r5
	ldr r5, addr_a9_1
	ldr r4, [r5]
	add r5, r6, r4
	ldr r4, addr_a10_1
	ldr r6, [r4]
	sub r4, r5, r6
	ldr r6, addr_a11_1
	ldr r5, [r6]
	add r6, r4, r5
	ldr r5, addr_a12_1
	ldr r4, [r5]
	sub r5, r6, r4
	ldr r4, addr_a13_1
	ldr r6, [r4]
	add r4, r5, r6
	ldr r6, addr_a14_1
	ldr r5, [r6]
	sub r6, r4, r5
	ldr r5, addr_a15_1
	ldr r4, [r5]
	add r5, r6, r4
	ldr r4, addr_a16_1
	ldr r6, [r4]
	sub r4, r5, r6
	ldr r6, addr_a17_1
	ldr r5, [r6]
	add r6, r4, r5
	ldr r5, addr_a18_1
	ldr r4, [r5]
	sub r5, r6, r4
	ldr r4, addr_a19_1
	ldr r6, [r4]
	add r4, r5, r6
	ldr r6, addr_a20_1
	ldr r5, [r6]
	sub r6, r4, r5
	ldr r5, addr_a21_1
	ldr r4, [r5]
	add r5, r6, r4
	ldr r4, addr_a22_1
	ldr r6, [r4]
	sub r4, r5, r6
	ldr r6, addr_a23_1
	ldr r5, [r6]
	add r6, r4, r5
	ldr r5, addr_a24_1
	ldr r4, [r5]
	sub r5, r6, r4
	ldr r4, addr_a25_1
	ldr r6, [r4]
	add r4, r5, r6
	ldr r6, addr_a26_1
	ldr r5, [r6]
	sub r6, r4, r5
	ldr r5, addr_a27_1
	ldr r4, [r5]
	add r5, r6, r4
	ldr r4, addr_a28_1
	ldr r6, [r4]
	sub r4, r5, r6
	ldr r6, addr_a29_1
	ldr r5, [r6]
	add r6, r4, r5
	ldr r5, addr_a30_1
	ldr r4, [r5]
	sub r5, r6, r4
	ldr r4, addr_a31_1
	ldr r6, [r4]
	add r4, r5, r6
	ldr r6, addr_a32_1
	ldr r5, [r6]
	sub r6, r4, r5
	mov r0, r6
	add sp, sp, #156
	pop {r4, r5, r6, fp, lr}
	bx lr

	b .F1
.LTORG
addr_a1_1:
	.word a1
addr_a10_1:
	.word a10
addr_a11_1:
	.word a11
addr_a12_1:
	.word a12
addr_a13_1:
	.word a13
addr_a14_1:
	.word a14
addr_a15_1:
	.word a15
addr_a16_1:
	.word a16
addr_a17_1:
	.word a17
addr_a18_1:
	.word a18
addr_a19_1:
	.word a19
addr_a2_1:
	.word a2
addr_a20_1:
	.word a20
addr_a21_1:
	.word a21
addr_a22_1:
	.word a22
addr_a23_1:
	.word a23
addr_a24_1:
	.word a24
addr_a25_1:
	.word a25
addr_a26_1:
	.word a26
addr_a27_1:
	.word a27
addr_a28_1:
	.word a28
addr_a29_1:
	.word a29
addr_a3_1:
	.word a3
addr_a30_1:
	.word a30
addr_a31_1:
	.word a31
addr_a32_1:
	.word a32
addr_a4_1:
	.word a4
addr_a5_1:
	.word a5
addr_a6_1:
	.word a6
addr_a7_1:
	.word a7
addr_a8_1:
	.word a8
addr_a9_1:
	.word a9
.F1:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L467:
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r5, #18
	add r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl func
	mov r4, r0
	str r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r0, r5
	bl putint
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr

addr_a1_2:
	.word a1
addr_a10_2:
	.word a10
addr_a11_2:
	.word a11
addr_a12_2:
	.word a12
addr_a13_2:
	.word a13
addr_a14_2:
	.word a14
addr_a15_2:
	.word a15
addr_a16_2:
	.word a16
addr_a17_2:
	.word a17
addr_a18_2:
	.word a18
addr_a19_2:
	.word a19
addr_a2_2:
	.word a2
addr_a20_2:
	.word a20
addr_a21_2:
	.word a21
addr_a22_2:
	.word a22
addr_a23_2:
	.word a23
addr_a24_2:
	.word a24
addr_a25_2:
	.word a25
addr_a26_2:
	.word a26
addr_a27_2:
	.word a27
addr_a28_2:
	.word a28
addr_a29_2:
	.word a29
addr_a3_2:
	.word a3
addr_a30_2:
	.word a30
addr_a31_2:
	.word a31
addr_a32_2:
	.word a32
addr_a4_2:
	.word a4
addr_a5_2:
	.word a5
addr_a6_2:
	.word a6
addr_a7_2:
	.word a7
addr_a8_2:
	.word a8
addr_a9_2:
	.word a9
