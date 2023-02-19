	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global INF
	.align 4
	.size INF, 4
INF:
	.word 65535
	.comm book, 64, 4
	.comm dis, 64, 4
	.comm e, 1024, 4
	.global m
	.align 4
	.size m, 4
m:
	.word 0
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.global v1
	.align 4
	.size v1, 4
v1:
	.word 0
	.global v2
	.align 4
	.size v2, 4
v2:
	.word 0
	.global w
	.align 4
	.size w, 4
w:
	.word 0
	.text
	.global Dijkstra
	.type Dijkstra , %function
Dijkstra:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub sp, sp, #20
.L34:
	ldr r4, =1
	str r4, [fp, #-20]
	b .L37
.L37:
	ldr r4, [fp, #-20]
	ldr r5, addr_n_0
	ldr r6, [r5]
	cmp r4, r6
	movle r4, #1
	movgt r4, #0
	ble .L38
	b .L43
.L38:
	mov r5, #1
	mov r4, #64
	mov r5, r4, LSL#0
	ldr r6, addr_e_0
	add r4, r6, r5
	ldr r5, [fp, #-20]
	mov r7, #4
	mul r6, r5, r7
	add r5, r4, r6
	ldr r4, [r5]
	ldr r6, [fp, #-20]
	mov r5, #4
	mul r7, r6, r5
	ldr r5, addr_dis_0
	add r6, r5, r7
	str r4, [r6]
	ldr r6, [fp, #-20]
	mov r5, #4
	mul r4, r6, r5
	ldr r5, addr_book_0
	add r6, r5, r4
	ldr r5, =0
	str r5, [r6]
	ldr r4, [fp, #-20]
	add r5, r4, #1
	str r5, [fp, #-20]
	b .L37
.L39:
	mov r4, #1
	mov r5, #4
	mov r4, r5, LSL#0
	ldr r6, addr_book_0
	add r5, r6, r4
	ldr r4, =1
	str r4, [r5]
	ldr r5, =1
	str r5, [fp, #-20]
	b .L59
.L42:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L43:
	b .L39
.L44:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L59:
	ldr r4, [fp, #-20]
	ldr r5, addr_n_0
	ldr r6, [r5]
	sub r5, r6, #1
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	ble .L60
	b .L65
.L60:
	ldr r5, addr_INF_0
	ldr r4, [r5]
	str r4, [fp, #-16]
	ldr r5, =0
	str r5, [fp, #-12]
	ldr r4, =1
	str r4, [fp, #-8]
	b .L71
.L61:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L64:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L65:
	b .L61
.L66:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L71:
	ldr r5, [fp, #-8]
	ldr r4, addr_n_0
	ldr r6, [r4]
	cmp r5, r6
	movle r5, #1
	movgt r5, #0
	ble .L72
	b .L77
.L72:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	ldr r6, addr_dis_0
	add r5, r6, r7
	ldr r7, [r5]
	cmp r4, r7
	movgt r4, #1
	movle r4, #0
	bgt .L81
	b .L88
.L73:
	ldr r4, [fp, #-12]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_book_0
	add r4, r5, r6
	ldr r6, =1
	str r6, [r4]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L107
.L76:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L77:
	b .L73
.L78:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L79:
	ldr r5, [fp, #-8]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_dis_0
	add r5, r4, r6
	ldr r6, [r5]
	str r6, [fp, #-16]
	ldr r4, [fp, #-8]
	str r4, [fp, #-12]
	b .L80
.L80:
	ldr r5, [fp, #-8]
	add r4, r5, #1
	str r4, [fp, #-8]
	b .L71
.L81:
	ldr r5, [fp, #-8]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_book_0
	add r5, r4, r6
	ldr r6, [r5]
	cmp r6, #0
	moveq r4, #1
	movne r4, #0
	beq .L79
	b .L95
.L87:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L88:
	b .L80
.L89:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L94:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L95:
	b .L80
.L96:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L107:
	ldr r5, [fp, #-4]
	ldr r4, addr_n_0
	ldr r6, [r4]
	cmp r5, r6
	movle r5, #1
	movgt r5, #0
	ble .L108
	b .L113
	b .F0
.LTORG
addr_INF_0:
	.word INF
addr_book_0:
	.word book
addr_dis_0:
	.word dis
addr_e_0:
	.word e
addr_m_0:
	.word m
addr_n_0:
	.word n
addr_v1_0:
	.word v1
addr_v2_0:
	.word v2
addr_w_0:
	.word w
.F0:
.L108:
	ldr r4, [fp, #-12]
	mov r5, #64
	mul r6, r4, r5
	ldr r4, addr_e_1
	add r5, r4, r6
	ldr r4, [fp, #-4]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r6, addr_INF_1
	ldr r4, [r6]
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L115
	b .L125
.L109:
	ldr r4, [fp, #-20]
	add r5, r4, #1
	str r5, [fp, #-20]
	b .L59
.L112:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L113:
	b .L109
.L114:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L115:
	ldr r4, [fp, #-4]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_dis_1
	add r4, r5, r6
	ldr r6, [r4]
	ldr r5, [fp, #-12]
	mov r4, #4
	mul r7, r5, r4
	ldr r5, addr_dis_1
	add r4, r5, r7
	ldr r5, [r4]
	ldr r7, [fp, #-12]
	mov r4, #64
	mul r8, r7, r4
	ldr r4, addr_e_1
	add r7, r4, r8
	ldr r8, [fp, #-4]
	mov r4, #4
	mul r9, r8, r4
	add r8, r7, r9
	ldr r4, [r8]
	add r7, r5, r4
	cmp r6, r7
	movgt r5, #1
	movle r5, #0
	bgt .L127
	b .L144
.L116:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L107
.L124:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L125:
	b .L116
.L126:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L127:
	ldr r4, [fp, #-12]
	mov r5, #4
	mul r6, r4, r5
	ldr r5, addr_dis_1
	add r4, r5, r6
	ldr r6, [r4]
	ldr r5, [fp, #-12]
	mov r4, #64
	mul r7, r5, r4
	ldr r5, addr_e_1
	add r4, r5, r7
	ldr r5, [fp, #-4]
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	ldr r4, [r5]
	add r7, r6, r4
	ldr r5, [fp, #-4]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_dis_1
	add r5, r4, r6
	str r7, [r5]
	b .L128
.L128:
	b .L116
.L143:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

.L144:
	b .L128
.L145:
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #16
.L161:
	bl getint
	mov r4, r0
	ldr r5, addr_n_1
	str r4, [r5]
	bl getint
	mov r4, r0
	ldr r5, addr_m_1
	str r4, [r5]
	ldr r4, =1
	str r4, [fp, #-16]
	b .L163
.L163:
	ldr r5, [fp, #-16]
	ldr r4, addr_n_1
	ldr r6, [r4]
	cmp r5, r6
	movle r5, #1
	movgt r5, #0
	ble .L164
	b .L169
.L164:
	ldr r4, =1
	str r4, [fp, #-12]
	b .L172
.L165:
	ldr r5, =1
	str r5, [fp, #-16]
	b .L201
.L168:
.L169:
	b .L165
.L170:
.L172:
	ldr r4, [fp, #-12]
	ldr r5, addr_n_1
	ldr r6, [r5]
	cmp r4, r6
	movle r4, #1
	movgt r4, #0
	ble .L173
	b .L178
.L173:
	ldr r5, [fp, #-16]
	ldr r4, [fp, #-12]
	cmp r5, r4
	moveq r5, #1
	movne r5, #0
	beq .L180
	b .L186
.L174:
	ldr r4, [fp, #-16]
	add r5, r4, #1
	str r5, [fp, #-16]
	b .L163
.L177:
.L178:
	b .L174
.L179:
.L180:
	ldr r4, [fp, #-16]
	mov r5, #64
	mul r6, r4, r5
	ldr r5, addr_e_1
	add r4, r5, r6
	ldr r6, [fp, #-12]
	mov r5, #4
	mul r7, r6, r5
	add r6, r4, r7
	ldr r4, =0
	str r4, [r6]
	b .L182
.L181:
	ldr r5, addr_INF_1
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	mov r6, #64
	mul r7, r5, r6
	ldr r5, addr_e_1
	add r6, r5, r7
	ldr r5, [fp, #-12]
	mov r8, #4
	mul r7, r5, r8
	add r5, r6, r7
	str r4, [r5]
	b .L182
.L182:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L172
.L185:
.L186:
	b .L181
.L187:
.L201:
	ldr r5, [fp, #-16]
	ldr r4, addr_m_1
	ldr r6, [r4]
	cmp r5, r6
	movle r5, #1
	movgt r5, #0
	ble .L202
	b .L207
.L202:
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	bl getint
	mov r5, r0
	str r5, [fp, #-4]
	bl getint
	mov r4, r0
	ldr r5, [fp, #-8]
	mov r6, #64
	mul r7, r5, r6
	ldr r6, addr_e_1
	add r5, r6, r7
	ldr r7, [fp, #-4]
	mov r6, #4
	mul r8, r7, r6
	add r7, r5, r8
	str r4, [r7]
	ldr r4, [fp, #-16]
	add r6, r4, #1
	str r6, [fp, #-16]
	b .L201
.L203:
	bl Dijkstra
	ldr r5, =1
	str r5, [fp, #-16]
	b .L217
.L206:
.L207:
	b .L203
.L208:
.L217:
	ldr r4, [fp, #-16]
	ldr r5, addr_n_1
	ldr r6, [r5]
	cmp r4, r6
	movle r4, #1
	movgt r4, #0
	ble .L218
	b .L223
.L218:
	ldr r5, [fp, #-16]
	mov r4, #4
	mul r6, r5, r4
	ldr r4, addr_dis_1
	add r5, r4, r6
	ldr r6, [r5]
	mov r0, r6
	bl putint
	mov r0, #32
	bl putch
	ldr r4, [fp, #-16]
	add r5, r4, #1
	str r5, [fp, #-16]
	b .L217
.L219:
	mov r0, #10
	bl putch
	mov r0, #0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

.L222:
.L223:
	b .L219
.L224:
addr_INF_1:
	.word INF
addr_book_1:
	.word book
addr_dis_1:
	.word dis
addr_e_1:
	.word e
addr_m_1:
	.word m
addr_n_1:
	.word n
addr_v1_1:
	.word v1
addr_v2_1:
	.word v2
addr_w_1:
	.word w
