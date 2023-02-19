	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global ascii_0
	.align 4
	.size ascii_0, 4
ascii_0:
	.word 48
	.text
	.global my_getint
	.type my_getint , %function
my_getint:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L26:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L29
.L29:
	ldr r4, =1
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L30
	b .L34
.L30:
	bl getch
	mov r4, r0
	ldr r5, addr_ascii_0_0
	ldr r6, [r5]
	sub r5, r4, r6
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	movlt r5, #1
	movge r5, #0
	blt .L37
	b .L43
.L31:
	ldr r4, [fp, #-4]
	str r4, [fp, #-8]
	b .L51
.L33:
.L34:
	b .L31
.L35:
.L37:
	b .L29
.L38:
	b .L31
.L39:
	b .L29
.L40:
	ldr r5, [fp, #-4]
	cmp r5, #9
	movgt r4, #1
	movle r4, #0
	bgt .L37
	b .L47
.L42:
.L43:
	b .L40
.L44:
.L46:
.L47:
	b .L38
.L48:
.L49:
	b .L39
.L51:
	ldr r5, =1
	cmp r5, #0
	movne r4, #1
	moveq r4, #0
	bne .L52
	b .L56
.L52:
	bl getch
	mov r5, r0
	ldr r4, addr_ascii_0_0
	ldr r6, [r4]
	sub r4, r5, r6
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #0
	movge r5, #1
	movlt r5, #0
	bge .L62
	b .L65
.L53:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, fp, lr}
	bx lr

.L55:
.L56:
	b .L53
.L57:
.L59:
	ldr r5, [fp, #-8]
	ldr r4, =10
	mul r6, r5, r4
	ldr r5, [fp, #-4]
	add r4, r6, r5
	str r4, [fp, #-8]
	b .L61
.L60:
	b .L53
.L61:
	b .L51
.L62:
	ldr r4, [fp, #-4]
	cmp r4, #9
	movle r5, #1
	movgt r5, #0
	ble .L59
	b .L69
.L64:
.L65:
	b .L60
.L66:
.L68:
.L69:
	b .L60
.L70:
	.global my_putint
	.type my_putint , %function
my_putint:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #72
.L74:
	str r0, [fp, #-72]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L79
.L79:
	ldr r4, [fp, #-72]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L80
	b .L84
.L80:
	ldr r4, [fp, #-72]
	ldr r5, =10
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	ldr r4, addr_ascii_0_0
	ldr r5, [r4]
	add r4, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	mov r5, #-68
	add r6, fp, r5
	add r5, r6, r7
	str r4, [r5]
	ldr r5, [fp, #-72]
	ldr r6, =10
	sdiv r4, r5, r6
	str r4, [fp, #-72]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L79
.L81:
	b .L93
.L83:
	add sp, sp, #72
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L84:
	b .L81
.L85:
	add sp, sp, #72
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L93:
	ldr r4, [fp, #-4]
	cmp r4, #0
	movgt r5, #1
	movle r5, #0
	bgt .L94
	b .L98
.L94:
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-68
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, [r5]
	mov r0, r6
	bl putch
	b .L93
.L95:
	add sp, sp, #72
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L97:
	add sp, sp, #72
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L98:
	b .L95
.L99:
	add sp, sp, #72
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L105:
	bl my_getint
	mov r4, r0
	str r4, [fp, #-8]
	b .L107
.L107:
	ldr r4, [fp, #-8]
	cmp r4, #0
	movgt r4, #1
	movle r4, #0
	bgt .L108
	b .L112
.L108:
	bl my_getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl my_putint
	mov r0, #10
	bl putch
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	str r5, [fp, #-8]
	b .L107
.L109:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

.L111:
.L112:
	b .L109
.L113:
addr_ascii_0_0:
	.word ascii_0
