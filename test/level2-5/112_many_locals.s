	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global foo
	.type foo , %function
foo:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #136
.L45:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-136
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =1
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =2
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =3
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =1
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =2
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =3
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =1
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =2
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =3
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =1
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =2
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =3
	str r6, [r4]
	ldr r4, =3
	str r4, [fp, #-72]
	ldr r5, =7
	str r5, [fp, #-68]
	ldr r4, =5
	str r4, [fp, #-64]
	ldr r5, =6
	str r5, [fp, #-60]
	ldr r4, =1
	str r4, [fp, #-56]
	ldr r5, =0
	str r5, [fp, #-52]
	ldr r4, =3
	str r4, [fp, #-48]
	ldr r5, =5
	str r5, [fp, #-44]
	ldr r4, =4
	str r4, [fp, #-40]
	ldr r5, =2
	str r5, [fp, #-36]
	ldr r4, =7
	str r4, [fp, #-32]
	ldr r5, =9
	str r5, [fp, #-28]
	ldr r4, =8
	str r4, [fp, #-24]
	ldr r5, =1
	str r5, [fp, #-20]
	ldr r4, =4
	str r4, [fp, #-16]
	ldr r5, =6
	str r5, [fp, #-12]
	ldr r4, [fp, #-72]
	ldr r5, [fp, #-68]
	add r6, r4, r5
	ldr r4, [fp, #-64]
	add r5, r6, r4
	ldr r4, [fp, #-60]
	add r6, r5, r4
	ldr r4, [fp, #-56]
	add r5, r6, r4
	ldr r4, [fp, #-52]
	add r6, r5, r4
	ldr r4, [fp, #-48]
	add r5, r6, r4
	ldr r4, [fp, #-44]
	add r6, r5, r4
	str r6, [fp, #-8]
	ldr r4, [fp, #-40]
	ldr r5, [fp, #-36]
	add r6, r4, r5
	ldr r4, [fp, #-32]
	add r5, r6, r4
	ldr r4, [fp, #-28]
	add r6, r5, r4
	ldr r4, [fp, #-24]
	add r5, r6, r4
	ldr r4, [fp, #-20]
	add r6, r5, r4
	ldr r4, [fp, #-16]
	add r5, r6, r4
	ldr r4, [fp, #-12]
	add r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	ldr r4, [fp, #-72]
	mov r5, #4
	mul r7, r4, r5
	mov r4, #-136
	add r4, fp, r4
	add r5, r4, r7
	ldr r7, [r5]
	add r4, r6, r7
	mov r0, r4
	add sp, sp, #136
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #112
.L103:
	ldr r4, =3
	str r4, [fp, #-112]
	ldr r4, =7
	str r4, [fp, #-108]
	ldr r4, =5
	str r4, [fp, #-104]
	ldr r4, =6
	str r4, [fp, #-100]
	ldr r4, =1
	str r4, [fp, #-96]
	ldr r4, =0
	str r4, [fp, #-92]
	ldr r4, =3
	str r4, [fp, #-88]
	ldr r4, =5
	str r4, [fp, #-84]
	ldr r4, =4
	str r4, [fp, #-80]
	ldr r4, =2
	str r4, [fp, #-76]
	ldr r4, =7
	str r4, [fp, #-72]
	ldr r4, =9
	str r4, [fp, #-68]
	ldr r4, =8
	str r4, [fp, #-64]
	ldr r4, =1
	str r4, [fp, #-60]
	ldr r4, =4
	str r4, [fp, #-56]
	ldr r4, =6
	str r4, [fp, #-52]
	ldr r4, [fp, #-112]
	ldr r5, [fp, #-108]
	add r6, r4, r5
	ldr r4, [fp, #-104]
	add r5, r6, r4
	ldr r4, [fp, #-100]
	add r6, r5, r4
	ldr r4, [fp, #-96]
	add r5, r6, r4
	ldr r4, [fp, #-92]
	add r6, r5, r4
	ldr r4, [fp, #-88]
	add r5, r6, r4
	ldr r4, [fp, #-84]
	add r6, r5, r4
	str r6, [fp, #-48]
	ldr r4, [fp, #-80]
	ldr r5, [fp, #-76]
	add r6, r4, r5
	ldr r4, [fp, #-72]
	add r5, r6, r4
	ldr r4, [fp, #-68]
	add r6, r5, r4
	ldr r4, [fp, #-64]
	add r5, r6, r4
	ldr r4, [fp, #-60]
	add r6, r5, r4
	ldr r4, [fp, #-56]
	add r5, r6, r4
	ldr r4, [fp, #-52]
	add r6, r5, r4
	str r6, [fp, #-44]
	ldr r4, [fp, #-48]
	bl foo
	mov r5, r0
	add r6, r4, r5
	str r6, [fp, #-48]
	ldr r4, =4
	str r4, [fp, #-40]
	ldr r5, =7
	str r5, [fp, #-36]
	ldr r4, =2
	str r4, [fp, #-32]
	ldr r5, =5
	str r5, [fp, #-28]
	ldr r4, =8
	str r4, [fp, #-24]
	ldr r5, =0
	str r5, [fp, #-20]
	ldr r4, =6
	str r4, [fp, #-16]
	ldr r5, =3
	str r5, [fp, #-12]
	ldr r4, [fp, #-44]
	bl foo
	mov r5, r0
	add r6, r4, r5
	str r6, [fp, #-44]
	ldr r4, [fp, #-80]
	str r4, [fp, #-112]
	ldr r5, [fp, #-76]
	str r5, [fp, #-108]
	ldr r4, [fp, #-72]
	str r4, [fp, #-104]
	ldr r5, [fp, #-68]
	str r5, [fp, #-100]
	ldr r4, [fp, #-64]
	str r4, [fp, #-96]
	ldr r5, [fp, #-60]
	str r5, [fp, #-92]
	ldr r4, [fp, #-56]
	str r4, [fp, #-88]
	ldr r5, [fp, #-52]
	str r5, [fp, #-84]
	ldr r4, [fp, #-40]
	ldr r5, [fp, #-36]
	add r6, r4, r5
	ldr r4, [fp, #-32]
	add r5, r6, r4
	ldr r4, [fp, #-28]
	add r6, r5, r4
	ldr r4, [fp, #-24]
	add r5, r6, r4
	ldr r4, [fp, #-20]
	add r6, r5, r4
	ldr r4, [fp, #-16]
	add r5, r6, r4
	ldr r4, [fp, #-12]
	add r6, r5, r4
	str r6, [fp, #-8]
	ldr r4, [fp, #-48]
	ldr r5, [fp, #-44]
	add r6, r4, r5
	ldr r4, [fp, #-8]
	add r5, r6, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r0, #0
	add sp, sp, #112
	pop {r4, r5, r6, fp, lr}
	bx lr

