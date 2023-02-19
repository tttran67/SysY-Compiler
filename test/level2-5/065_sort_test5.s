	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.text
	.global swap
	.type swap , %function
swap:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L31:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	str r5, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-12]
	ldr r5, [fp, #-16]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-16]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	str r4, [r5]
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global heap_ajust
	.type heap_ajust , %function
heap_ajust:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L59:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	str r2, [fp, #-12]
	ldr r4, [fp, #-16]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, =2
	mov r5, r4, LSL#1
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L71
.L71:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-12]
	add r6, r4, #1
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L72
	b .L77
.L72:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	blt .L81
	b .L85
.L73:
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L76:
.L77:
	b .L73
.L78:
.L79:
	ldr r5, [fp, #-4]
	add r4, r5, #1
	str r4, [fp, #-4]
	b .L80
.L80:
	ldr r5, [fp, #-8]
	ldr r4, [fp, #-20]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-4]
	ldr r5, [fp, #-20]
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	cmp r4, r5
	movgt r5, #1
	movle r5, #0
	bgt .L101
	b .L115
.L81:
	ldr r5, [fp, #-4]
	ldr r4, [fp, #-20]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-4]
	add r5, r6, #1
	ldr r6, [fp, #-20]
	mov r7, #4
	mul r8, r5, r7
	add r5, r6, r8
	ldr r6, [r5]
	cmp r4, r6
	movlt r6, #1
	movge r6, #0
	blt .L79
	b .L98
.L84:
.L85:
	b .L80
.L86:
.L97:
.L98:
	b .L80
.L99:
.L101:
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L102:
	ldr r5, [fp, #-20]
	ldr r4, [fp, #-8]
	ldr r6, [fp, #-4]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl swap
	mov r5, r0
	str r5, [fp, #-8]
	ldr r4, [fp, #-4]
	str r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r4, =2
	mov r4, r5, LSL#1
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L103
.L103:
	b .L71
.L114:
.L115:
	b .L102
.L116:
	.global heap_sort
	.type heap_sort , %function
heap_sort:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L123:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, =2
	sdiv r6, r4, r5
	sub r4, r6, #1
	str r4, [fp, #-12]
	b .L132
.L132:
	ldr r4, [fp, #-12]
	ldr r5, =0
	sub r6, r5, #1
	cmp r4, r6
	movgt r4, #1
	movle r4, #0
	bgt .L133
	b .L137
.L133:
	ldr r5, [fp, #-16]
	sub r4, r5, #1
	str r4, [fp, #-8]
	ldr r5, [fp, #-20]
	ldr r4, [fp, #-12]
	ldr r6, [fp, #-8]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl heap_ajust
	mov r5, r0
	str r5, [fp, #-8]
	ldr r4, [fp, #-12]
	sub r5, r4, #1
	str r5, [fp, #-12]
	b .L132
.L134:
	ldr r4, [fp, #-16]
	sub r5, r4, #1
	str r5, [fp, #-12]
	b .L146
.L136:
.L137:
	b .L134
.L138:
.L146:
	ldr r4, [fp, #-12]
	cmp r4, #0
	movgt r5, #1
	movle r5, #0
	bgt .L147
	b .L151
.L147:
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r5, [fp, #-20]
	ldr r4, [fp, #-4]
	ldr r6, [fp, #-12]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl swap
	mov r5, r0
	str r5, [fp, #-8]
	ldr r4, [fp, #-12]
	sub r5, r4, #1
	str r5, [fp, #-8]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-8]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl heap_ajust
	mov r4, r0
	str r4, [fp, #-8]
	ldr r5, [fp, #-12]
	sub r4, r5, #1
	str r4, [fp, #-12]
	b .L146
.L148:
	mov r0, #0
	add sp, sp, #20
	pop {r4, r5, r6, fp, lr}
	bx lr

.L150:
.L151:
	b .L148
.L152:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #48
.L164:
	ldr r4, =10
	ldr r5, addr_n_0
	str r4, [r5]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-48
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =4
	str r5, [r4]
	mov r4, #1
	mov r5, #4
	mov r4, r5, LSL#0
	mov r5, #-48
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =3
	str r4, [r5]
	mov r5, #2
	mov r4, #4
	mov r5, r4, LSL#1
	mov r4, #-48
	add r6, fp, r4
	add r4, r6, r5
	ldr r5, =9
	str r5, [r4]
	mov r4, #3
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-48
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =2
	str r5, [r4]
	mov r4, #4
	mov r5, #4
	mov r4, r5, LSL#2
	mov r5, #-48
	add r6, fp, r5
	add r5, r6, r4
	ldr r4, =0
	str r4, [r5]
	mov r5, #5
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-48
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =1
	str r6, [r4]
	mov r4, #6
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-48
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, =6
	str r5, [r4]
	mov r4, #7
	mov r5, #4
	mul r6, r4, r5
	mov r4, #-48
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =5
	str r6, [r5]
	mov r4, #8
	mov r5, #4
	mov r4, r5, LSL#3
	mov r5, #-48
	add r5, fp, r5
	add r6, r5, r4
	ldr r4, =7
	str r4, [r6]
	mov r5, #9
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-48
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, =8
	str r6, [r4]
	ldr r4, =0
	str r4, [fp, #-8]
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-48
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, addr_n_0
	ldr r5, [r6]
	mov r0, r4
	mov r1, r5
	bl heap_sort
	mov r5, r0
	str r5, [fp, #-8]
	b .L190
.L190:
	ldr r4, [fp, #-8]
	ldr r5, addr_n_0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L191
	b .L196
.L191:
	ldr r5, [fp, #-8]
	mov r4, #4
	mul r6, r5, r4
	mov r5, #-48
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [r4]
	str r6, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putint
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r5
	bl putch
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L190
.L192:
	mov r0, #0
	add sp, sp, #48
	pop {r4, r5, r6, fp, lr}
	bx lr

.L195:
.L196:
	b .L192
.L197:
addr_n_0:
	.word n
