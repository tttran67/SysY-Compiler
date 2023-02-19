	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #164
.L4:
	mov r4, #0
	mov r5, #8
	mul r6, r4, r5
	mov r4, #-164
	add r4, fp, r4
	add r5, r4, r6
	mov r6, #0
	mov r4, #4
	mul r7, r6, r4
	add r6, r5, r7
	ldr r4, =1
	str r4, [r6]
	mov r5, #0
	mov r4, #8
	mul r7, r5, r4
	mov r5, #-164
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =2
	str r4, [r5]
	mov r6, #1
	mov r4, #8
	mov r6, r4, LSL#0
	mov r4, #-164
	add r4, fp, r4
	add r4, r4, r6
	add r6, r5, #4
	ldr r5, =3
	str r5, [r6]
	mov r4, #1
	mov r4, #8
	mov r5, r4, LSL#0
	mov r4, #-164
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =4
	str r6, [r5]
	mov r4, #2
	mov r4, #8
	mov r6, r4, LSL#1
	mov r4, #-164
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #2
	mov r4, #8
	mov r5, r4, LSL#1
	mov r4, #-164
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #3
	mov r6, #8
	mul r7, r4, r6
	mov r4, #-164
	add r4, fp, r4
	add r6, r4, r7
	add r6, r5, #4
	ldr r4, =7
	str r4, [r6]
	mov r5, #3
	mov r7, #8
	mul r4, r5, r7
	mov r5, #-164
	add r5, fp, r5
	add r7, r5, r4
	add r4, r6, #4
	ldr r5, =0
	str r5, [r4]
	ldr r4, =3
	str r4, [fp, #-132]
	mov r5, #0
	mov r4, #8
	mul r6, r5, r4
	mov r5, #-128
	add r5, fp, r5
	add r4, r5, r6
	mov r6, #0
	mov r7, #4
	mul r5, r6, r7
	add r6, r4, r5
	ldr r4, =0
	str r4, [r6]
	mov r5, #0
	mov r4, #8
	mul r7, r5, r4
	mov r5, #-128
	add r4, fp, r5
	add r4, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #1
	mov r6, #8
	mov r4, r6, LSL#0
	mov r6, #-128
	add r6, fp, r6
	add r7, r6, r4
	add r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	mov r6, #1
	mov r5, #8
	mov r6, r5, LSL#0
	mov r5, #-128
	add r5, fp, r5
	add r7, r5, r6
	add r6, r4, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #2
	mov r4, #8
	mov r5, r4, LSL#1
	mov r4, #-128
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #2
	mov r4, #8
	mov r6, r4, LSL#1
	mov r4, #-128
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =0
	str r5, [r6]
	mov r4, #3
	mov r5, #8
	mul r7, r4, r5
	mov r4, #-128
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =0
	str r4, [r5]
	mov r6, #3
	mov r7, #8
	mul r4, r6, r7
	mov r6, #-128
	add r7, fp, r6
	add r6, r7, r4
	add r6, r5, #4
	ldr r4, =0
	str r4, [r6]
	mov r5, #0
	mov r4, #8
	mul r6, r5, r4
	mov r5, #-96
	add r4, fp, r5
	add r5, r4, r6
	mov r4, #0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, =1
	str r5, [r4]
	mov r6, #0
	mov r5, #8
	mul r7, r6, r5
	mov r6, #-96
	add r5, fp, r6
	add r5, r5, r7
	add r6, r4, #4
	ldr r5, =2
	str r5, [r6]
	mov r4, #1
	mov r4, #8
	mov r5, r4, LSL#0
	mov r4, #-96
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r6, =3
	str r6, [r5]
	mov r4, #1
	mov r4, #8
	mov r6, r4, LSL#0
	mov r4, #-96
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =4
	str r5, [r6]
	mov r4, #2
	mov r4, #8
	mov r5, r4, LSL#1
	mov r4, #-96
	add r4, fp, r4
	add r7, r4, r5
	add r5, r6, #4
	ldr r6, =5
	str r6, [r5]
	mov r4, #2
	mov r4, #8
	mov r6, r4, LSL#1
	mov r4, #-96
	add r4, fp, r4
	add r7, r4, r6
	add r6, r5, #4
	ldr r5, =6
	str r5, [r6]
	mov r4, #3
	mov r5, #8
	mul r7, r4, r5
	mov r4, #-96
	add r4, fp, r4
	add r5, r4, r7
	add r5, r6, #4
	ldr r4, =7
	str r4, [r5]
	mov r6, #3
	mov r4, #8
	mul r7, r6, r4
	mov r6, #-96
	add r4, fp, r6
	add r6, r4, r7
	add r4, r5, #4
	ldr r6, =8
	str r6, [r4]
	mov r4, #0
	mov r5, #8
	mul r6, r4, r5
	mov r4, #-64
	add r4, fp, r4
	add r5, r4, r6
	mov r6, #0
	mov r4, #4
	mul r7, r6, r4
	add r6, r5, r7
	ldr r4, =1
	str r4, [r6]
	mov r5, #0
	mov r4, #8
	mul r7, r5, r4
	mov r5, #-64
	add r4, fp, r5
	add r5, r4, r7
	add r4, r6, #4
	ldr r5, =2
	str r5, [r4]
	mov r6, #1
	mov r5, #8
	mov r6, r5, LSL#0
	mov r5, #-64
	add r5, fp, r5
	add r5, r5, r6
	add r6, r4, #4
	ldr r4, =3
	str r4, [r6]
	mov r5, #1
	mov r5, #8
	mov r4, r5, LSL#0
	mov r5, #-64
	add r5, fp, r5
	add r7, r5, r4
	add r4, r6, #4
	ldr r6, =0
	str r6, [r4]
	mov r5, #2
	mov r5, #8
	mov r6, r5, LSL#1
	mov r5, #-64
	add r5, fp, r5
	add r5, r5, r6
	add r6, r4, #4
	ldr r4, =5
	str r4, [r6]
	mov r5, #2
	mov r4, #8
	mov r5, r4, LSL#1
	mov r4, #-64
	add r4, fp, r4
	add r4, r4, r5
	add r5, r6, #4
	ldr r6, =0
	str r6, [r5]
	mov r4, #3
	mov r6, #8
	mul r7, r4, r6
	mov r4, #-164
	add r4, fp, r4
	add r6, r4, r7
	mov r7, #0
	mov r8, #4
	mul r4, r7, r8
	add r7, r6, r4
	ldr r6, [r7]
	mov r4, #3
	mov r7, #8
	mul r8, r4, r7
	mov r4, #-64
	add r4, fp, r4
	add r7, r4, r8
	add r7, r5, #4
	str r6, [r7]
	mov r4, #3
	mov r6, #8
	mul r5, r4, r6
	mov r4, #-64
	add r4, fp, r4
	add r6, r4, r5
	add r5, r7, #4
	ldr r4, =8
	str r4, [r5]
	mov r5, #2
	mov r4, #8
	mov r5, r4, LSL#1
	mov r4, #-64
	add r6, fp, r4
	add r4, r6, r5
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	ldr r4, [r5]
	mov r6, #0
	mov r5, #8
	mul r7, r6, r5
	mov r6, #-32
	add r6, fp, r6
	add r5, r6, r7
	mov r7, #0
	mov r6, #4
	mul r8, r7, r6
	add r7, r5, r8
	mov r5, #0
	mov r6, #4
	mul r8, r5, r6
	add r5, r7, r8
	str r4, [r5]
	mov r6, #2
	mov r6, #8
	mov r4, r6, LSL#1
	mov r6, #-96
	add r7, fp, r6
	add r6, r7, r4
	mov r4, #1
	mov r7, #4
	mov r4, r7, LSL#0
	add r7, r6, r4
	ldr r6, [r7]
	mov r4, #0
	mov r7, #8
	mul r8, r4, r7
	mov r4, #-32
	add r4, fp, r4
	add r7, r4, r8
	mov r8, #1
	mov r4, #4
	mov r8, r4, LSL#0
	add r4, r7, r8
	add r4, r5, #4
	str r6, [r4]
	mov r6, #1
	mov r5, #8
	mov r6, r5, LSL#0
	mov r5, #-32
	add r7, fp, r5
	add r5, r7, r6
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	add r5, r4, #4
	ldr r4, =3
	str r4, [r5]
	mov r6, #1
	mov r4, #8
	mov r6, r4, LSL#0
	mov r4, #-32
	add r4, fp, r4
	add r7, r4, r6
	mov r6, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r7, r6
	add r4, r5, #4
	ldr r5, =4
	str r5, [r4]
	mov r6, #2
	mov r5, #8
	mov r6, r5, LSL#1
	mov r5, #-32
	add r5, fp, r5
	add r7, r5, r6
	mov r6, #0
	mov r5, #4
	mul r8, r6, r5
	add r6, r7, r8
	add r5, r4, #4
	ldr r4, =5
	str r4, [r5]
	mov r6, #2
	mov r4, #8
	mov r6, r4, LSL#1
	mov r4, #-32
	add r7, fp, r4
	add r4, r7, r6
	mov r6, #1
	mov r7, #4
	mov r6, r7, LSL#0
	add r7, r4, r6
	add r4, r5, #4
	ldr r5, =6
	str r5, [r4]
	mov r6, #3
	mov r5, #8
	mul r7, r6, r5
	mov r6, #-32
	add r6, fp, r6
	add r5, r6, r7
	mov r7, #0
	mov r6, #4
	mul r8, r7, r6
	add r7, r5, r8
	add r5, r4, #4
	ldr r6, =7
	str r6, [r5]
	mov r4, #3
	mov r6, #8
	mul r7, r4, r6
	mov r4, #-32
	add r4, fp, r4
	add r6, r4, r7
	mov r7, #1
	mov r4, #4
	mov r7, r4, LSL#0
	add r4, r6, r7
	add r4, r5, #4
	ldr r6, =8
	str r6, [r4]
	mov r4, #3
	mov r5, #8
	mul r6, r4, r5
	mov r4, #-32
	add r4, fp, r4
	add r5, r4, r6
	mov r6, #1
	mov r4, #4
	mov r6, r4, LSL#0
	add r4, r5, r6
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	mov r6, #0
	mov r5, #8
	mul r7, r6, r5
	mov r6, #-32
	add r6, fp, r6
	add r5, r6, r7
	mov r7, #0
	mov r6, #4
	mul r8, r7, r6
	add r7, r5, r8
	mov r5, #0
	mov r6, #4
	mul r8, r5, r6
	add r5, r7, r8
	ldr r6, [r5]
	add r7, r4, r6
	mov r4, #0
	mov r5, #8
	mul r6, r4, r5
	mov r4, #-32
	add r5, fp, r4
	add r4, r5, r6
	mov r5, #1
	mov r5, #4
	mov r6, r5, LSL#0
	add r5, r4, r6
	mov r4, #0
	mov r6, #4
	mul r8, r4, r6
	add r4, r5, r8
	ldr r5, [r4]
	add r6, r7, r5
	mov r4, #3
	mov r5, #8
	mul r7, r4, r5
	mov r4, #-64
	add r4, fp, r4
	add r5, r4, r7
	mov r7, #0
	mov r4, #4
	mul r8, r7, r4
	add r7, r5, r8
	ldr r4, [r7]
	add r5, r6, r4
	mov r0, r5
	add sp, sp, #164
	b .B0
.LTORG
.B0:
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	b .F1
.LTORG
.F1:
