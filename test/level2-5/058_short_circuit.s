	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global g
	.align 4
	.size g, 4
g:
	.word 0
	.text
	.global func
	.type func , %function
func:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L22:
	str r0, [fp, #-4]
	ldr r4, addr_g_0
	ldr r5, [r4]
	ldr r4, [fp, #-4]
	add r6, r5, r4
	ldr r5, addr_g_0
	str r6, [r5]
	ldr r4, addr_g_0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r4, addr_g_0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L29:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #10
	movgt r4, #1
	movle r4, #0
	bgt .L34
	b .L37
.L31:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L33
.L32:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L33
.L33:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #11
	movgt r4, #1
	movle r4, #0
	bgt .L47
	b .L50
.L34:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L31
	b .L42
.L36:
.L37:
	b .L32
.L38:
.L41:
.L42:
	b .L32
.L43:
.L44:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L46
.L45:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L46
.L46:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #99
	movle r4, #1
	movgt r4, #0
	ble .L57
	b .L63
.L47:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L44
	b .L55
.L49:
.L50:
	b .L45
.L51:
.L54:
.L55:
	b .L45
.L56:
.L57:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L59
.L58:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L59
.L59:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #100
	movle r4, #1
	movgt r4, #0
	ble .L70
	b .L76
.L60:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L57
	b .L68
.L62:
.L63:
	b .L60
.L64:
.L67:
.L68:
	b .L58
.L69:
.L70:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L72
.L71:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L72
.L72:
	mov r0, #99
	bl func
	mov r4, r0
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	beq .L86
	b .L88
.L73:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L70
	b .L81
.L75:
.L76:
	b .L73
.L77:
.L80:
.L81:
	b .L71
.L82:
.L83:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L85
.L84:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L85
.L85:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L86:
	mov r0, #100
	bl func
	mov r4, r0
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L83
	b .L92
.L87:
.L88:
	b .L84
.L89:
.L91:
.L92:
	b .L84
.L93:
addr_g_0:
	.word g
