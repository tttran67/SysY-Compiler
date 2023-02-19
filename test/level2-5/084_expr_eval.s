	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global TOKEN_NUM
	.align 4
	.size TOKEN_NUM, 4
TOKEN_NUM:
	.word 0
	.global TOKEN_OTHER
	.align 4
	.size TOKEN_OTHER, 4
TOKEN_OTHER:
	.word 1
	.global cur_token
	.align 4
	.size cur_token, 4
cur_token:
	.word 0
	.global last_char
	.align 4
	.size last_char, 4
last_char:
	.word 32
	.global num
	.align 4
	.size num, 4
num:
	.word 0
	.global other
	.align 4
	.size other, 4
other:
	.word 0
	.text
	.global next_char
	.type next_char , %function
next_char:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L84:
	bl getch
	mov r4, r0
	ldr r5, addr_last_char_0
	str r4, [r5]
	ldr r4, addr_last_char_0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #0
	pop {r4, r5, fp, lr}
	bx lr

	.global is_space
	.type is_space , %function
is_space:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L86:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #32
	moveq r4, #1
	movne r4, #0
	beq .L89
	b .L95
.L89:
	mov r0, #1
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L90:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L91:
.L92:
	ldr r4, [fp, #-4]
	cmp r4, #10
	moveq r4, #1
	movne r4, #0
	beq .L89
	b .L99
.L94:
.L95:
	b .L92
.L96:
.L98:
.L99:
	b .L90
.L100:
	.global is_num
	.type is_num , %function
is_num:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L101:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #48
	movge r4, #1
	movlt r4, #0
	bge .L107
	b .L110
.L104:
	mov r0, #1
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L105:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L106:
.L107:
	ldr r4, [fp, #-4]
	cmp r4, #57
	movle r4, #1
	movgt r4, #0
	ble .L104
	b .L114
.L109:
.L110:
	b .L105
.L111:
.L113:
.L114:
	b .L105
.L115:
	.global next_token
	.type next_token , %function
next_token:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L116:
	b .L117
.L117:
	ldr r4, addr_last_char_0
	ldr r5, [r4]
	mov r0, r5
	bl is_space
	mov r4, r0
	cmp r4, #0
	movne r5, #1
	moveq r5, #0
	bne .L118
	b .L123
.L118:
	bl next_char
	mov r4, r0
	b .L117
.L119:
	ldr r5, addr_last_char_0
	ldr r4, [r5]
	mov r0, r4
	bl is_num
	mov r5, r0
	cmp r5, #0
	movne r4, #1
	moveq r4, #0
	bne .L125
	b .L131
.L122:
.L123:
	b .L119
.L124:
.L125:
	ldr r5, addr_last_char_0
	ldr r4, [r5]
	sub r5, r4, #48
	ldr r4, addr_num_0
	str r5, [r4]
	b .L134
.L126:
	ldr r5, addr_last_char_0
	ldr r4, [r5]
	ldr r5, addr_other_0
	str r4, [r5]
	bl next_char
	mov r4, r0
	ldr r5, addr_TOKEN_OTHER_0
	ldr r4, [r5]
	ldr r5, addr_cur_token_0
	str r4, [r5]
	b .L127
.L127:
	ldr r4, addr_cur_token_0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

.L130:
.L131:
	b .L126
.L132:
.L134:
	bl next_char
	mov r4, r0
	mov r0, r4
	bl is_num
	mov r5, r0
	cmp r5, #0
	movne r4, #1
	moveq r4, #0
	bne .L135
	b .L139
.L135:
	ldr r5, addr_num_0
	ldr r4, [r5]
	ldr r5, =10
	mul r6, r4, r5
	ldr r4, addr_last_char_0
	ldr r5, [r4]
	add r4, r6, r5
	sub r5, r4, #48
	ldr r6, addr_num_0
	str r5, [r6]
	b .L134
.L136:
	ldr r4, addr_TOKEN_NUM_0
	ldr r5, [r4]
	ldr r4, addr_cur_token_0
	str r5, [r4]
	b .L127
.L138:
.L139:
	b .L136
.L140:
	.global panic
	.type panic , %function
panic:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #0
.L147:
	mov r0, #112
	bl putch
	mov r0, #97
	bl putch
	mov r0, #110
	bl putch
	mov r0, #105
	bl putch
	mov r0, #99
	bl putch
	mov r0, #33
	bl putch
	mov r0, #10
	bl putch
	ldr r4, =0
	sub r5, r4, #1
	mov r0, r5
	add sp, sp, #0
	pop {r4, r5, fp, lr}
	bx lr

	.global get_op_prec
	.type get_op_prec , %function
get_op_prec:
	push {r4, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L148:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	cmp r4, #43
	moveq r4, #1
	movne r4, #0
	beq .L151
	b .L156
.L151:
	mov r0, #10
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L152:
	ldr r4, [fp, #-4]
	cmp r4, #42
	moveq r4, #1
	movne r4, #0
	beq .L162
	b .L168
.L153:
	ldr r4, [fp, #-4]
	cmp r4, #45
	moveq r4, #1
	movne r4, #0
	beq .L151
	b .L160
.L155:
.L156:
	b .L153
.L157:
.L159:
.L160:
	b .L152
.L161:
.L162:
	mov r0, #20
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L163:
	mov r0, #0
	add sp, sp, #4
	pop {r4, fp, lr}
	bx lr

.L164:
	ldr r4, [fp, #-4]
	cmp r4, #37
	moveq r4, #1
	movne r4, #0
	beq .L162
	b .L176
.L165:
	ldr r4, [fp, #-4]
	cmp r4, #47
	moveq r4, #1
	movne r4, #0
	beq .L162
	b .L172
.L167:
.L168:
	b .L165
.L169:
.L171:
.L172:
	b .L164
.L173:
.L175:
.L176:
	b .L163
.L177:
	.global stack_push
	.type stack_push , %function
stack_push:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L178:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-8]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	add r6, r4, #1
	ldr r5, [fp, #-8]
	mov r4, #0
	mov r8, #4
	mul r7, r4, r8
	add r4, r5, r7
	str r6, [r4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	mov r6, #0
	mov r7, #4
	mul r8, r6, r7
	add r6, r5, r8
	ldr r5, [r6]
	ldr r7, [fp, #-8]
	mov r6, #4
	mul r8, r5, r6
	add r5, r7, r8
	str r4, [r5]
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global stack_pop
	.type stack_pop , %function
stack_pop:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L199:
	str r0, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul r5, r4, r7
	add r4, r6, r5
	ldr r6, [r4]
	str r6, [fp, #-4]
	ldr r5, [fp, #-8]
	mov r4, #0
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	sub r6, r5, #1
	ldr r4, [fp, #-8]
	mov r5, #0
	mov r7, #4
	mul r8, r5, r7
	add r5, r4, r8
	str r6, [r5]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global stack_peek
	.type stack_peek , %function
stack_peek:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L220:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul r5, r4, r7
	add r4, r6, r5
	ldr r6, [r4]
	mov r0, r6
	add sp, sp, #4
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global stack_size
	.type stack_size , %function
stack_size:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L232:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global eval_op
	.type eval_op , %function
eval_op:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub sp, sp, #12
.L240:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	str r2, [fp, #-4]
	ldr r4, [fp, #-12]
	cmp r4, #43
	moveq r4, #1
	movne r4, #0
	beq .L247
	b .L251
.L247:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	mov r0, r6
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr

.L248:
	ldr r4, [fp, #-12]
	cmp r4, #45
	moveq r5, #1
	movne r5, #0
	beq .L255
	b .L259
.L250:
.L251:
	b .L248
.L252:
.L255:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sub r6, r4, r5
	mov r0, r6
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr

.L256:
	ldr r4, [fp, #-12]
	cmp r4, #42
	moveq r5, #1
	movne r5, #0
	beq .L263
	b .L267
.L258:
.L259:
	b .L256
.L260:
.L263:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mul r6, r4, r5
	mov r0, r6
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr

.L264:
	ldr r4, [fp, #-12]
	cmp r4, #47
	moveq r5, #1
	movne r5, #0
	beq .L271
	b .L275
.L266:
.L267:
	b .L264
.L268:
.L271:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sdiv r6, r4, r5
	mov r0, r6
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr

.L272:
	ldr r4, [fp, #-12]
	cmp r4, #37
	moveq r5, #1
	movne r5, #0
	beq .L279
	b .L283
.L274:
.L275:
	b .L272
.L276:
.L279:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sdiv r6, r4, r5
	mul r5, r6, r5
	sub r6, r4, r5
	mov r0, r6
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr

.L280:
	mov r0, #0
	add sp, sp, #12
	pop {r4, r5, r6, fp, lr}
	bx lr

.L282:
.L283:
	b .L280
.L284:
	.global eval
	.type eval , %function
eval:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	ldr r4, =2076
	sub sp, sp, r4
.L287:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-2076
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	b .B0
.LTORG
addr_TOKEN_NUM_0:
	.word TOKEN_NUM
addr_TOKEN_OTHER_0:
	.word TOKEN_OTHER
addr_cur_token_0:
	.word cur_token
addr_last_char_0:
	.word last_char
addr_num_0:
	.word num
addr_other_0:
	.word other
.B0:
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-1052
	add r4, fp, r4
	add r5, r4, r6
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	b .B1
.LTORG
addr_TOKEN_NUM_1:
	.word TOKEN_NUM
addr_TOKEN_OTHER_1:
	.word TOKEN_OTHER
addr_cur_token_1:
	.word cur_token
addr_last_char_1:
	.word last_char
addr_num_1:
	.word num
addr_other_1:
	.word other
.B1:
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	b .B2
.LTORG
addr_TOKEN_NUM_2:
	.word TOKEN_NUM
addr_TOKEN_OTHER_2:
	.word TOKEN_OTHER
addr_cur_token_2:
	.word cur_token
addr_last_char_2:
	.word last_char
addr_num_2:
	.word num
addr_other_2:
	.word other
.B2:
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	add r5, r4, #4
	ldr r6, =0
	str r6, [r5]
	add r4, r5, #4
	ldr r6, =0
	str r6, [r4]
	ldr r4, addr_cur_token_3
	ldr r5, [r4]
	ldr r4, addr_TOKEN_NUM_3
	ldr r6, [r4]
	cmp r5, r6
	movne r5, #1
	moveq r5, #0
	bne .L802
	b .L807
	b .F3
.LTORG
addr_TOKEN_NUM_3:
	.word TOKEN_NUM
addr_TOKEN_OTHER_3:
	.word TOKEN_OTHER
addr_cur_token_3:
	.word cur_token
addr_last_char_3:
	.word last_char
addr_num_3:
	.word num
addr_other_3:
	.word other
.F3:
.L802:
	bl panic
	mov r4, r0
	mov r0, r4
	ldr r2, =2076
	add sp, sp, r2
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L803:
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-2076
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, addr_num_4
	ldr r5, [r6]
	mov r0, r4
	mov r1, r5
	bl stack_push
	bl next_token
	mov r5, r0
	b .L812
.L806:
.L807:
	b .L803
.L808:
.L812:
	ldr r4, addr_cur_token_4
	ldr r5, [r4]
	ldr r4, addr_TOKEN_OTHER_4
	ldr r6, [r4]
	cmp r5, r6
	moveq r5, #1
	movne r5, #0
	beq .L813
	b .L818
.L813:
	ldr r4, addr_other_4
	ldr r5, [r4]
	str r5, [fp, #-28]
	ldr r4, [fp, #-28]
	mov r0, r4
	bl get_op_prec
	mov r5, r0
	cmp r5, #0
	moveq r4, #1
	movne r4, #0
	beq .L822
	b .L826
.L814:
	bl next_token
	mov r5, r0
	b .L871
.L817:
.L818:
	b .L814
.L819:
.L822:
	b .L814
.L823:
	bl next_token
	mov r4, r0
	b .L828
.L825:
.L826:
	b .L823
.L827:
.L828:
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-1052
	add r4, fp, r5
	add r5, r4, r6
	mov r0, r5
	bl stack_size
	mov r4, r0
	cmp r4, #0
	movne r5, #1
	moveq r5, #0
	bne .L831
	b .L836
.L829:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-1052
	add r4, fp, r4
	add r5, r4, r6
	mov r0, r5
	bl stack_pop
	mov r5, r0
	str r5, [fp, #-24]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-2076
	add r4, fp, r4
	add r5, r4, r6
	mov r0, r5
	bl stack_pop
	mov r5, r0
	str r5, [fp, #-20]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-2076
	add r5, fp, r4
	add r4, r5, r6
	mov r0, r4
	bl stack_pop
	mov r4, r0
	str r4, [fp, #-16]
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-2076
	add r4, fp, r5
	add r5, r4, r6
	ldr r4, [fp, #-24]
	ldr r6, [fp, #-16]
	ldr r7, [fp, #-20]
	mov r0, r4
	mov r1, r6
	mov r2, r7
	bl eval_op
	mov r4, r0
	mov r0, r5
	mov r1, r4
	bl stack_push
	b .L828
.L830:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-1052
	add r5, fp, r4
	add r4, r5, r6
	ldr r5, [fp, #-28]
	mov r0, r4
	mov r1, r5
	bl stack_push
	ldr r5, addr_cur_token_4
	ldr r4, [r5]
	ldr r5, addr_TOKEN_NUM_4
	ldr r6, [r5]
	cmp r4, r6
	movne r4, #1
	moveq r4, #0
	bne .L861
	b .L866
.L831:
	mov r5, #0
	mov r6, #4
	mul r4, r5, r6
	ldr r5, =-1052
	add r5, fp, r5
	add r6, r5, r4
	mov r0, r6
	bl stack_peek
	mov r4, r0
	mov r0, r4
	bl get_op_prec
	mov r5, r0
	ldr r4, [fp, #-28]
	mov r0, r4
	bl get_op_prec
	mov r4, r0
	cmp r5, r4
	movge r5, #1
	movlt r5, #0
	bge .L829
	b .L842
	b .F4
.LTORG
addr_TOKEN_NUM_4:
	.word TOKEN_NUM
addr_TOKEN_OTHER_4:
	.word TOKEN_OTHER
addr_cur_token_4:
	.word cur_token
addr_last_char_4:
	.word last_char
addr_num_4:
	.word num
addr_other_4:
	.word other
.F4:
.L835:
.L836:
	b .L830
.L837:
.L841:
.L842:
	b .L830
.L843:
.L861:
	bl panic
	mov r4, r0
	mov r0, r4
	ldr r2, =2076
	add sp, sp, r2
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L862:
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-2076
	add r4, fp, r5
	add r5, r4, r6
	ldr r4, addr_num_5
	ldr r6, [r4]
	mov r0, r5
	mov r1, r6
	bl stack_push
	bl next_token
	mov r4, r0
	b .L812
.L865:
.L866:
	b .L862
.L867:
.L871:
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-1052
	add r4, fp, r5
	add r5, r4, r6
	mov r0, r5
	bl stack_size
	mov r4, r0
	cmp r4, #0
	movne r5, #1
	moveq r5, #0
	bne .L872
	b .L878
.L872:
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-1052
	add r4, fp, r4
	add r5, r4, r6
	mov r0, r5
	bl stack_pop
	mov r5, r0
	str r5, [fp, #-12]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-2076
	add r4, fp, r4
	add r5, r4, r6
	mov r0, r5
	bl stack_pop
	mov r5, r0
	str r5, [fp, #-8]
	mov r4, #0
	mov r5, #4
	mul r6, r4, r5
	ldr r4, =-2076
	add r5, fp, r4
	add r4, r5, r6
	mov r0, r4
	bl stack_pop
	mov r4, r0
	str r4, [fp, #-4]
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-2076
	add r5, fp, r5
	add r4, r5, r6
	ldr r6, [fp, #-12]
	ldr r5, [fp, #-4]
	ldr r7, [fp, #-8]
	mov r0, r6
	mov r1, r5
	mov r2, r7
	bl eval_op
	mov r6, r0
	mov r0, r4
	mov r1, r6
	bl stack_push
	b .L871
.L873:
	mov r5, #0
	mov r4, #4
	mul r6, r5, r4
	ldr r5, =-2076
	add r5, fp, r5
	add r4, r5, r6
	mov r0, r4
	bl stack_peek
	mov r4, r0
	mov r0, r4
	ldr r2, =2076
	add sp, sp, r2
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

.L877:
.L878:
	b .L873
.L879:
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #4
.L896:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	bl getch
	mov r4, r0
	bl next_token
	mov r4, r0
	b .L898
.L898:
	ldr r4, [fp, #-4]
	cmp r4, #0
	movne r4, #1
	moveq r4, #0
	bne .L899
	b .L904
.L899:
	bl eval
	mov r4, r0
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L898
.L900:
	mov r0, #0
	add sp, sp, #4
	pop {r4, r5, fp, lr}
	bx lr

.L903:
.L904:
	b .L900
.L905:
addr_TOKEN_NUM_5:
	.word TOKEN_NUM
addr_TOKEN_OTHER_5:
	.word TOKEN_OTHER
addr_cur_token_5:
	.word cur_token
addr_last_char_5:
	.word last_char
addr_num_5:
	.word num
addr_other_5:
	.word other
