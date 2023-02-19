	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global func
	.type func , %function
func:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L19:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #50
	movle r4, #1
	movgt r4, #0
	ble .L22
	b .L27
.L22:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #1
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L23:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L24:
.L26:
.L27:
	b .L23
.L28:
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L31:
	mov r0, #0
	bl func
	mov r4, r0
	cmp r4, #1
	moveq r4, #1
	movne r4, #0
	beq .L33
	b .L38
.L33:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L35
.L34:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L35
.L35:
	mov r0, #50
	bl func
	mov r4, r0
	cmp r4, #1
	moveq r4, #1
	movne r4, #0
	beq .L51
	b .L53
.L36:
	mov r0, #50
	bl func
	mov r4, r0
	cmp r4, #1
	moveq r4, #1
	movne r4, #0
	beq .L40
	b .L42
.L37:
.L38:
	b .L36
.L39:
.L40:
	mov r0, #100
	bl func
	mov r4, r0
	cmp r4, #0
	moveq r4, #1
	movne r4, #0
	beq .L33
	b .L45
.L41:
.L42:
	b .L34
.L43:
.L44:
.L45:
	b .L34
.L46:
.L47:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L49
.L48:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L49
.L49:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L50:
	mov r0, #1
	bl func
	mov r4, r0
	cmp r4, #1
	moveq r4, #1
	movne r4, #0
	beq .L47
	b .L59
.L51:
	mov r0, #40
	bl func
	mov r4, r0
	cmp r4, #1
	moveq r4, #1
	movne r4, #0
	beq .L47
	b .L56
.L52:
.L53:
	b .L50
.L54:
.L55:
.L56:
	b .L50
.L57:
.L58:
.L59:
	b .L48
.L60:
