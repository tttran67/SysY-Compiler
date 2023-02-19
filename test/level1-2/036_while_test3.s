	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global e
	.align 4
	.size e, 4
e:
	.word 0
	.global f
	.align 4
	.size f, 4
f:
	.word 0
	.global g
	.align 4
	.size g, 4
g:
	.word 0
	.global h
	.align 4
	.size h, 4
h:
	.word 0
	.text
	.global EightWhile
	.type EightWhile , %function
EightWhile:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L31:
	ldr r4, =5
	str r4, [fp, #-16]
	ldr r4, =6
	str r4, [fp, #-12]
	ldr r4, =7
	str r4, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-4]
	b .L36
.L36:
	ldr r4, [fp, #-16]
	cmp r4, #20
	movlt r4, #1
	movge r4, #0
	blt .L37
	b .L41
.L37:
	ldr r4, [fp, #-16]
	add r5, r4, #3
	str r5, [fp, #-16]
	b .L44
.L38:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-4]
	add r7, r5, r6
	add r5, r4, r7
	ldr r4, [fp, #-8]
	add r6, r5, r4
	ldr r4, addr_e_0
	ldr r5, [r4]
	ldr r4, [fp, #-4]
	add r7, r5, r4
	ldr r5, addr_g_0
	ldr r4, [r5]
	sub r5, r7, r4
	ldr r4, addr_h_0
	ldr r7, [r4]
	add r4, r5, r7
	sub r7, r6, r4
	mov r0, r7
	add sp, sp, #16
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L40:
.L41:
	b .L38
.L42:
.L44:
	ldr r5, [fp, #-12]
	cmp r5, #10
	movlt r4, #1
	movge r4, #0
	blt .L45
	b .L49
.L45:
	ldr r5, [fp, #-12]
	add r4, r5, #1
	str r4, [fp, #-12]
	b .L52
.L46:
	ldr r5, [fp, #-12]
	sub r4, r5, #2
	str r4, [fp, #-12]
	b .L36
.L48:
.L49:
	b .L46
.L50:
.L52:
	ldr r5, [fp, #-8]
	cmp r5, #7
	moveq r4, #1
	movne r4, #0
	beq .L53
	b .L57
.L53:
	ldr r5, [fp, #-8]
	sub r4, r5, #1
	str r4, [fp, #-8]
	b .L60
.L54:
	ldr r5, [fp, #-8]
	add r4, r5, #1
	str r4, [fp, #-8]
	b .L44
.L56:
.L57:
	b .L54
.L58:
.L60:
	ldr r5, [fp, #-4]
	cmp r5, #20
	movlt r4, #1
	movge r4, #0
	blt .L61
	b .L65
.L61:
	ldr r5, [fp, #-4]
	add r4, r5, #3
	str r4, [fp, #-4]
	b .L68
.L62:
	ldr r5, [fp, #-4]
	sub r4, r5, #1
	str r4, [fp, #-4]
	b .L52
.L64:
.L65:
	b .L62
.L66:
.L68:
	ldr r5, addr_e_0
	ldr r4, [r5]
	cmp r4, #1
	movgt r5, #1
	movle r5, #0
	bgt .L69
	b .L73
.L69:
	ldr r4, addr_e_0
	ldr r5, [r4]
	sub r4, r5, #1
	ldr r5, addr_e_0
	str r4, [r5]
	b .L76
.L70:
	ldr r4, addr_e_0
	ldr r5, [r4]
	add r4, r5, #1
	ldr r5, addr_e_0
	str r4, [r5]
	b .L60
.L72:
.L73:
	b .L70
.L74:
.L76:
	ldr r4, addr_f_0
	ldr r5, [r4]
	cmp r5, #2
	movgt r4, #1
	movle r4, #0
	bgt .L77
	b .L81
.L77:
	ldr r5, addr_f_0
	ldr r4, [r5]
	sub r5, r4, #2
	ldr r4, addr_f_0
	str r5, [r4]
	b .L84
.L78:
	ldr r5, addr_f_0
	ldr r4, [r5]
	add r5, r4, #1
	ldr r4, addr_f_0
	str r5, [r4]
	b .L68
.L80:
.L81:
	b .L78
.L82:
.L84:
	ldr r5, addr_g_0
	ldr r4, [r5]
	cmp r4, #3
	movlt r5, #1
	movge r5, #0
	blt .L85
	b .L89
.L85:
	ldr r4, addr_g_0
	ldr r5, [r4]
	add r4, r5, #10
	ldr r5, addr_g_0
	str r4, [r5]
	b .L92
.L86:
	ldr r4, addr_g_0
	ldr r5, [r4]
	sub r4, r5, #8
	ldr r5, addr_g_0
	str r4, [r5]
	b .L76
.L88:
.L89:
	b .L86
.L90:
.L92:
	ldr r4, addr_h_0
	ldr r5, [r4]
	cmp r5, #10
	movlt r4, #1
	movge r4, #0
	blt .L93
	b .L97
	b .F0
.LTORG
addr_e_0:
	.word e
addr_f_0:
	.word f
addr_g_0:
	.word g
addr_h_0:
	.word h
.F0:
.L93:
	ldr r5, addr_h_1
	ldr r4, [r5]
	add r5, r4, #8
	ldr r4, addr_h_1
	str r5, [r4]
	b .L92
.L94:
	ldr r5, addr_h_1
	ldr r4, [r5]
	sub r5, r4, #1
	ldr r4, addr_h_1
	str r5, [r4]
	b .L84
.L96:
.L97:
	b .L94
.L98:
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L115:
	ldr r4, =1
	ldr r5, addr_g_1
	str r4, [r5]
	ldr r4, =2
	ldr r5, addr_h_1
	str r4, [r5]
	ldr r4, =4
	ldr r5, addr_e_1
	str r4, [r5]
	ldr r4, =6
	ldr r5, addr_f_1
	str r4, [r5]
	bl EightWhile
	mov r4, r0
	mov r0, r4
	add sp, sp, #0
	pop {r4, r5, fp, lr}
	bx lr

addr_e_1:
	.word e
addr_f_1:
	.word f
addr_g_1:
	.word g
addr_h_1:
	.word h
