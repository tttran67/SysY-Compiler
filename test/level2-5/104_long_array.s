	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global N
	.align 4
	.size N, 4
N:
	.word 10000
	.text
	.global long_array
	.type long_array , %function
long_array:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	ldr r4, =120020
	sub sp, sp, r4
.L42:
	ldr r4, =-120020
	str r0, [fp, r4]
	ldr r4, =0
	str r4, [fp, #-16]
	b .L49
.L49:
	ldr r4, [fp, #-16]
	ldr r5, addr_N_0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L50
	b .L55
.L50:
	ldr r5, [fp, #-16]
	ldr r4, [fp, #-16]
	mul r6, r5, r4
	ldr r5, =10
	sdiv r4, r6, r5
	mul r5, r4, r5
	sub r4, r6, r5
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	ldr r5, =-120016
	add r5, fp, r5
	add r6, r5, r7
	str r4, [r6]
	ldr r6, [fp, #-16]
	add r5, r6, #1
	str r5, [fp, #-16]
	b .L49
.L51:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L63
.L54:
.L55:
	b .L51
.L56:
.L63:
	ldr r5, [fp, #-16]
	ldr r4, addr_N_0
	ldr r6, [r4]
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L64
	b .L69
.L64:
	ldr r4, [fp, #-16]
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-120016
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, [fp, #-16]
	mov r7, #4
	mul r4, r6, r7
	ldr r6, =-120016
	add r6, fp, r6
	add r7, r6, r4
	ldr r4, [r7]
	mul r6, r5, r4
	ldr r5, =10
	sdiv r4, r6, r5
	mul r5, r4, r5
	sub r4, r6, r5
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	ldr r5, =-80016
	add r5, fp, r5
	add r6, r5, r7
	str r4, [r6]
	ldr r6, [fp, #-16]
	add r5, r6, #1
	str r5, [fp, #-16]
	b .L63
.L65:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L83
.L68:
.L69:
	b .L65
.L70:
.L83:
	ldr r5, [fp, #-16]
	ldr r4, addr_N_0
	ldr r6, [r4]
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L84
	b .L89
.L84:
	ldr r4, [fp, #-16]
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-80016
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, [r4]
	ldr r6, [fp, #-16]
	mov r7, #4
	mul r4, r6, r7
	ldr r6, =-80016
	add r6, fp, r6
	add r7, r6, r4
	ldr r4, [r7]
	mul r6, r5, r4
	ldr r5, =100
	sdiv r4, r6, r5
	mul r5, r4, r5
	sub r4, r6, r5
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	ldr r5, =-120016
	add r5, fp, r5
	add r6, r5, r7
	ldr r7, [r6]
	add r5, r4, r7
	ldr r4, [fp, #-16]
	mov r6, #4
	mul r7, r4, r6
	ldr r4, =-40016
	add r4, fp, r4
	add r6, r4, r7
	str r5, [r6]
	ldr r6, [fp, #-16]
	add r4, r6, #1
	str r4, [fp, #-16]
	b .L83
.L85:
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r5, =0
	str r5, [fp, #-16]
	b .L108
.L88:
.L89:
	b .L85
.L90:
.L108:
	ldr r4, [fp, #-16]
	ldr r5, addr_N_0
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L109
	b .L114
.L109:
	ldr r5, [fp, #-16]
	cmp r5, #10
	movlt r4, #1
	movge r4, #0
	blt .L116
	b .L121
.L110:
	ldr r5, [fp, #-12]
	mov r0, r5
	ldr r2, =120020
	add sp, sp, r2
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L113:
.L114:
	b .L110
.L115:
.L116:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul r7, r5, r6
	ldr r5, =-40016
	add r5, fp, r5
	add r6, r5, r7
	ldr r7, [r6]
	add r5, r4, r7
	ldr r4, =1333
	sdiv r6, r5, r4
	mul r6, r6, r4
	sub r4, r5, r6
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	mov r0, r4
	bl putint
	b .L118
	b .F0
.LTORG
addr_N_0:
	.word N
.F0:
.L117:
	ldr r5, [fp, #-16]
	cmp r5, #20
	movlt r4, #1
	movge r4, #0
	blt .L129
	b .L134
.L118:
	ldr r5, [fp, #-16]
	add r4, r5, #1
	str r4, [fp, #-16]
	b .L108
.L120:
.L121:
	b .L117
.L122:
.L129:
	ldr r5, addr_N_1
	ldr r4, [r5]
	ldr r5, =2
	sdiv r6, r4, r5
	str r6, [fp, #-8]
	b .L138
.L130:
	ldr r4, [fp, #-16]
	cmp r4, #30
	movlt r5, #1
	movge r5, #0
	blt .L157
	b .L162
.L131:
	b .L118
.L133:
.L134:
	b .L130
.L135:
.L138:
	ldr r4, [fp, #-8]
	ldr r5, addr_N_1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L139
	b .L144
.L139:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-16]
	mov r6, #4
	mul r7, r4, r6
	ldr r4, =-40016
	add r4, fp, r4
	add r6, r4, r7
	ldr r7, [r6]
	add r4, r5, r7
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	ldr r5, =-120016
	add r5, fp, r5
	add r6, r5, r7
	ldr r7, [r6]
	sub r5, r4, r7
	str r5, [fp, #-12]
	ldr r4, [fp, #-8]
	add r6, r4, #1
	str r6, [fp, #-8]
	b .L138
.L140:
	ldr r5, [fp, #-12]
	mov r0, r5
	bl putint
	b .L131
.L143:
.L144:
	b .L140
.L145:
.L157:
	ldr r4, addr_N_1
	ldr r5, [r4]
	ldr r4, =2
	sdiv r6, r5, r4
	str r6, [fp, #-4]
	b .L166
.L158:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-16]
	mov r6, #4
	mul r7, r4, r6
	ldr r4, =-40016
	add r4, fp, r4
	add r6, r4, r7
	ldr r7, [r6]
	ldr r6, =-120020
	ldr r4, [fp, r6]
	mul r6, r7, r4
	add r4, r5, r6
	ldr r5, =99988
	sdiv r6, r4, r5
	mul r6, r6, r5
	sub r5, r4, r6
	str r5, [fp, #-12]
	b .L159
.L159:
	b .L131
.L161:
.L162:
	b .L158
.L163:
.L166:
	ldr r4, [fp, #-4]
	ldr r5, addr_N_1
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L167
	b .L172
.L167:
	ldr r5, [fp, #-4]
	ldr r4, =2233
	cmp r5, r4
	movgt r5, #1
	movle r5, #0
	bgt .L174
	b .L179
.L168:
	ldr r4, [fp, #-12]
	mov r0, r4
	bl putint
	b .L159
.L171:
.L172:
	b .L168
.L173:
.L174:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-16]
	mov r6, #4
	mul r7, r4, r6
	ldr r4, =-80016
	add r4, fp, r4
	add r6, r4, r7
	ldr r7, [r6]
	add r4, r5, r7
	ldr r5, [fp, #-4]
	mov r6, #4
	mul r7, r5, r6
	ldr r5, =-120016
	add r5, fp, r5
	add r6, r5, r7
	ldr r7, [r6]
	sub r5, r4, r7
	str r5, [fp, #-12]
	ldr r4, [fp, #-4]
	add r6, r4, #1
	str r6, [fp, #-4]
	b .L176
.L175:
	ldr r5, [fp, #-12]
	ldr r4, [fp, #-16]
	mov r6, #4
	mul r7, r4, r6
	ldr r4, =-120016
	add r6, fp, r4
	add r4, r6, r7
	ldr r6, [r4]
	add r7, r5, r6
	ldr r5, [fp, #-4]
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-40016
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [r4]
	add r5, r7, r6
	ldr r4, =13333
	sdiv r6, r5, r4
	mul r4, r6, r4
	sub r6, r5, r4
	str r6, [fp, #-12]
	ldr r4, [fp, #-4]
	add r5, r4, #2
	str r5, [fp, #-4]
	b .L176
	b .F1
.LTORG
addr_N_1:
	.word N
.F1:
.L176:
	b .L166
.L178:
.L179:
	b .L175
.L180:
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L210:
	mov r0, #9
	bl long_array
	mov r4, r0
	mov r0, r4
	add sp, sp, #0
	pop {r4, fp, lr}
	bx lr

addr_N_2:
	.word N
