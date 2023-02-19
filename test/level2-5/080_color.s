	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.comm cns, 80, 4
	.comm dp, 52907904, 4
	.comm list, 800, 4
	.global maxn
	.align 4
	.size maxn, 4
maxn:
	.word 18
	.global mod
	.align 4
	.size mod, 4
mod:
	.word 1000000007
	.text
	.global equal
	.type equal , %function
equal:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub sp, sp, #8
.L66:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	moveq r4, #1
	movne r4, #0
	beq .L71
	b .L76
.L71:
	mov r0, #1
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

.L72:
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, fp, lr}
	bx lr

.L75:
.L76:
	b .L72
.L77:
	.global dfs
	.type dfs , %function
dfs:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #32
.L78:
	str r0, [fp, #-28]
	str r1, [fp, #-24]
	str r2, [fp, #-20]
	str r3, [fp, #-16]
	ldr r0, [fp, #36]
	str r0, [fp, #-12]
	ldr r0, [fp, #40]
	str r0, [fp, #-8]
	ldr r4, [fp, #-28]
	ldr r6, =2939328
	mul r5, r4, r6
	ldr r4, addr_dp_0
	add r6, r4, r5
	ldr r4, [fp, #-24]
	ldr r5, =163296
	mul r7, r4, r5
	add r4, r6, r7
	ldr r5, [fp, #-20]
	ldr r6, =9072
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [fp, #-16]
	ldr r6, =504
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [fp, #-12]
	mov r6, #28
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [fp, #-8]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	ldr r6, =0
	sub r4, r6, #1
	cmp r5, r4
	movne r5, #1
	moveq r5, #0
	bne .L91
	b .L108
.L91:
	ldr r4, [fp, #-28]
	ldr r5, =2939328
	mul r6, r4, r5
	ldr r5, addr_dp_0
	add r4, r5, r6
	ldr r6, [fp, #-24]
	ldr r5, =163296
	mul r7, r6, r5
	add r6, r4, r7
	ldr r4, [fp, #-20]
	ldr r5, =9072
	mul r7, r4, r5
	add r4, r6, r7
	ldr r5, [fp, #-16]
	ldr r6, =504
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [fp, #-12]
	mov r6, #28
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [fp, #-8]
	mov r6, #4
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	add sp, sp, #32
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

.L92:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	add r6, r4, r5
	ldr r4, [fp, #-20]
	add r5, r6, r4
	ldr r4, [fp, #-16]
	add r6, r5, r4
	ldr r4, [fp, #-12]
	add r5, r6, r4
	cmp r5, #0
	moveq r4, #1
	movne r4, #0
	beq .L124
	b .L132
.L107:
.L108:
	b .L92
.L109:
.L124:
	mov r0, #1
	add sp, sp, #32
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

.L125:
	ldr r5, =0
	str r5, [fp, #-4]
	ldr r4, [fp, #-28]
	cmp r4, #0
	movne r5, #1
	moveq r5, #0
	bne .L135
	b .L140
.L131:
.L132:
	b .L125
.L133:
.L135:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-8]
	mov r0, r6
	mov r1, #2
	bl equal
	mov r6, r0
	sub r7, r5, r6
	ldr r5, [fp, #-28]
	sub r6, r5, #1
	ldr r5, [fp, #-24]
	ldr r8, [fp, #-20]
	ldr r9, [fp, #-16]
	ldr r10, [fp, #-12]
	mov r0, r6
	mov r1, r5
	mov r2, r8
	mov r3, r9
	mov r6, #1
	push {r6}
	push {r10}
	bl dfs
	add sp, sp, #8
	mov r5, r0
	mul r6, r7, r5
	add r7, r4, r6
	ldr r4, addr_mod_0
	ldr r5, [r4]
	sdiv r4, r7, r5
	mul r5, r4, r5
	sub r4, r7, r5
	str r4, [fp, #-4]
	b .L136
.L136:
	ldr r4, [fp, #-24]
	cmp r4, #0
	movne r5, #1
	moveq r5, #0
	bne .L151
	b .L156
.L139:
.L140:
	b .L136
.L141:
.L151:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-8]
	mov r0, r6
	mov r1, #3
	bl equal
	mov r6, r0
	sub r7, r5, r6
	ldr r5, [fp, #-28]
	add r6, r5, #1
	ldr r5, [fp, #-24]
	sub r8, r5, #1
	ldr r5, [fp, #-20]
	ldr r9, [fp, #-16]
	ldr r10, [fp, #-12]
	mov r0, r6
	mov r1, r8
	mov r2, r5
	mov r3, r9
	mov r5, #2
	push {r5}
	push {r10}
	bl dfs
	add sp, sp, #8
	mov r5, r0
	mul r6, r7, r5
	add r7, r4, r6
	ldr r4, addr_mod_0
	ldr r5, [r4]
	sdiv r4, r7, r5
	mul r5, r4, r5
	sub r4, r7, r5
	str r4, [fp, #-4]
	b .L152
	b .F0
.LTORG
addr_cns_0:
	.word cns
addr_dp_0:
	.word dp
addr_list_0:
	.word list
addr_maxn_0:
	.word maxn
addr_mod_0:
	.word mod
.F0:
.L152:
	ldr r4, [fp, #-20]
	cmp r4, #0
	movne r5, #1
	moveq r5, #0
	bne .L167
	b .L172
.L155:
.L156:
	b .L152
.L157:
.L167:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-20]
	ldr r6, [fp, #-8]
	mov r0, r6
	mov r1, #4
	bl equal
	mov r6, r0
	sub r7, r5, r6
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-24]
	add r8, r6, #1
	ldr r6, [fp, #-20]
	sub r9, r6, #1
	ldr r6, [fp, #-16]
	ldr r10, [fp, #-12]
	mov r0, r5
	mov r1, r8
	mov r2, r9
	mov r3, r6
	mov r5, #3
	push {r5}
	push {r10}
	bl dfs
	add sp, sp, #8
	mov r5, r0
	mul r6, r7, r5
	add r7, r4, r6
	ldr r4, addr_mod_1
	ldr r5, [r4]
	sdiv r4, r7, r5
	mul r5, r4, r5
	sub r4, r7, r5
	str r4, [fp, #-4]
	b .L168
.L168:
	ldr r4, [fp, #-16]
	cmp r4, #0
	movne r5, #1
	moveq r5, #0
	bne .L183
	b .L188
.L171:
.L172:
	b .L168
.L173:
.L183:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-8]
	mov r0, r6
	mov r1, #5
	bl equal
	mov r6, r0
	sub r7, r5, r6
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-24]
	ldr r8, [fp, #-20]
	add r9, r8, #1
	ldr r8, [fp, #-16]
	sub r10, r8, #1
	ldr r8, [fp, #-12]
	mov r0, r5
	mov r1, r6
	mov r2, r9
	mov r3, r10
	mov r5, #4
	push {r5}
	push {r8}
	bl dfs
	add sp, sp, #8
	mov r5, r0
	mul r6, r7, r5
	add r7, r4, r6
	ldr r4, addr_mod_1
	ldr r5, [r4]
	sdiv r4, r7, r5
	mul r5, r4, r5
	sub r4, r7, r5
	str r4, [fp, #-4]
	b .L184
.L184:
	ldr r4, [fp, #-12]
	cmp r4, #0
	movne r5, #1
	moveq r5, #0
	bne .L199
	b .L204
.L187:
.L188:
	b .L184
.L189:
.L199:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-28]
	ldr r7, [fp, #-24]
	ldr r8, [fp, #-20]
	ldr r9, [fp, #-16]
	add r10, r9, #1
	ldr r9, [fp, #-12]
	sub r9, r9, #1
	str r9, [fp, #-32]
	mov r0, r6
	mov r1, r7
	mov r2, r8
	mov r3, r10
	mov r6, #5
	push {r6}
	ldr r6, [fp, #-32]
	push {r6}
	bl dfs
	add sp, sp, #8
	mov r7, r0
	mul r6, r5, r7
	add r5, r4, r6
	ldr r4, addr_mod_1
	ldr r6, [r4]
	sdiv r4, r5, r6
	mul r6, r4, r6
	sub r4, r5, r6
	str r4, [fp, #-4]
	b .L200
.L200:
	ldr r4, [fp, #-4]
	ldr r5, addr_mod_1
	ldr r6, [r5]
	sdiv r5, r4, r6
	mul r6, r5, r6
	sub r5, r4, r6
	ldr r4, [fp, #-28]
	ldr r6, =2939328
	mul r7, r4, r6
	ldr r4, addr_dp_1
	add r6, r4, r7
	ldr r4, [fp, #-24]
	ldr r7, =163296
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [fp, #-20]
	ldr r7, =9072
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [fp, #-16]
	ldr r7, =504
	mul r8, r4, r7
	add r4, r6, r8
	ldr r6, [fp, #-12]
	mov r7, #28
	mul r8, r6, r7
	add r6, r4, r8
	ldr r4, [fp, #-8]
	mov r7, #4
	mul r8, r4, r7
	add r4, r6, r8
	str r5, [r4]
	ldr r5, [fp, #-28]
	ldr r6, =2939328
	mul r4, r5, r6
	ldr r5, addr_dp_1
	add r6, r5, r4
	ldr r4, [fp, #-24]
	ldr r5, =163296
	mul r7, r4, r5
	add r4, r6, r7
	ldr r5, [fp, #-20]
	ldr r6, =9072
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [fp, #-16]
	ldr r6, =504
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [fp, #-12]
	mov r6, #28
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [fp, #-8]
	mov r6, #4
	mul r7, r4, r6
	add r4, r5, r7
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #32
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	b .F1
.LTORG
addr_cns_1:
	.word cns
addr_dp_1:
	.word dp
addr_list_1:
	.word list
addr_maxn_1:
	.word maxn
addr_mod_1:
	.word mod
.F1:
.L203:
.L204:
	b .L200
.L205:
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub sp, sp, #32
.L243:
	bl getint
	mov r4, r0
	str r4, [fp, #-32]
	ldr r4, =0
	str r4, [fp, #-28]
	b .L246
.L246:
	ldr r4, [fp, #-28]
	ldr r5, addr_maxn_2
	ldr r6, [r5]
	cmp r4, r6
	movlt r4, #1
	movge r4, #0
	blt .L247
	b .L252
.L247:
	ldr r5, =0
	str r5, [fp, #-24]
	b .L255
.L248:
	ldr r4, =0
	str r4, [fp, #-28]
	b .L317
.L251:
.L252:
	b .L248
.L253:
.L255:
	ldr r5, [fp, #-24]
	ldr r4, addr_maxn_2
	ldr r6, [r4]
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L256
	b .L261
.L256:
	ldr r4, =0
	str r4, [fp, #-20]
	b .L264
.L257:
	ldr r5, [fp, #-28]
	add r4, r5, #1
	str r4, [fp, #-28]
	b .L246
.L260:
.L261:
	b .L257
.L262:
.L264:
	ldr r5, [fp, #-20]
	ldr r4, addr_maxn_2
	ldr r6, [r4]
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L265
	b .L270
.L265:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L273
.L266:
	ldr r5, [fp, #-24]
	add r4, r5, #1
	str r4, [fp, #-24]
	b .L255
.L269:
.L270:
	b .L266
.L271:
.L273:
	ldr r5, [fp, #-16]
	ldr r4, addr_maxn_2
	ldr r6, [r4]
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L274
	b .L279
.L274:
	ldr r4, =0
	str r4, [fp, #-12]
	b .L282
.L275:
	ldr r5, [fp, #-20]
	add r4, r5, #1
	str r4, [fp, #-20]
	b .L264
.L278:
.L279:
	b .L275
.L280:
.L282:
	ldr r5, [fp, #-12]
	ldr r4, addr_maxn_2
	ldr r6, [r4]
	cmp r5, r6
	movlt r5, #1
	movge r5, #0
	blt .L283
	b .L288
.L283:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L291
.L284:
	ldr r5, [fp, #-16]
	add r4, r5, #1
	str r4, [fp, #-16]
	b .L273
.L287:
.L288:
	b .L284
.L289:
.L291:
	ldr r5, [fp, #-8]
	cmp r5, #7
	movlt r4, #1
	movge r4, #0
	blt .L292
	b .L296
.L292:
	ldr r5, =0
	sub r4, r5, #1
	ldr r5, [fp, #-28]
	ldr r6, =2939328
	mul r7, r5, r6
	ldr r6, addr_dp_2
	add r5, r6, r7
	ldr r7, [fp, #-24]
	ldr r8, =163296
	mul r6, r7, r8
	add r7, r5, r6
	ldr r5, [fp, #-20]
	ldr r8, =9072
	mul r6, r5, r8
	add r5, r7, r6
	ldr r7, [fp, #-16]
	ldr r6, =504
	mul r8, r7, r6
	add r7, r5, r8
	ldr r5, [fp, #-12]
	mov r8, #28
	mul r6, r5, r8
	add r5, r7, r6
	ldr r7, [fp, #-8]
	mov r6, #4
	mul r8, r7, r6
	add r7, r5, r8
	str r4, [r7]
	ldr r4, [fp, #-8]
	add r6, r4, #1
	str r6, [fp, #-8]
	b .L291
.L293:
	ldr r5, [fp, #-12]
	add r4, r5, #1
	str r4, [fp, #-12]
	b .L282
.L295:
.L296:
	b .L293
.L297:
.L317:
	ldr r5, [fp, #-28]
	ldr r4, [fp, #-32]
	cmp r5, r4
	movlt r5, #1
	movge r5, #0
	blt .L318
	b .L323
.L318:
	bl getint
	mov r4, r0
	ldr r5, [fp, #-28]
	mov r6, #4
	mul r7, r5, r6
	ldr r5, addr_list_2
	add r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-28]
	mov r5, #4
	mul r6, r4, r5
	ldr r4, addr_list_2
	add r5, r4, r6
	ldr r6, [r5]
	mov r4, #4
	mul r5, r6, r4
	ldr r4, addr_cns_2
	add r6, r4, r5
	ldr r4, [r6]
	add r5, r4, #1
	ldr r6, [fp, #-28]
	mov r4, #4
	mul r7, r6, r4
	ldr r4, addr_list_2
	add r6, r4, r7
	ldr r7, [r6]
	mov r4, #4
	mul r6, r7, r4
	ldr r7, addr_cns_2
	add r4, r7, r6
	str r5, [r4]
	ldr r4, [fp, #-28]
	add r6, r4, #1
	str r6, [fp, #-28]
	b .L317
	b .F2
.LTORG
addr_cns_2:
	.word cns
addr_dp_2:
	.word dp
addr_list_2:
	.word list
addr_maxn_2:
	.word maxn
addr_mod_2:
	.word mod
.F2:
.L319:
	mov r5, #1
	mov r4, #4
	mov r5, r4, LSL#0
	ldr r6, addr_cns_3
	add r4, r6, r5
	ldr r5, [r4]
	mov r6, #2
	mov r4, #4
	mov r6, r4, LSL#1
	ldr r4, addr_cns_3
	add r7, r4, r6
	ldr r6, [r7]
	mov r4, #3
	mov r7, #4
	mul r8, r4, r7
	ldr r7, addr_cns_3
	add r4, r7, r8
	ldr r8, [r4]
	mov r7, #4
	mov r4, #4
	mov r7, r4, LSL#2
	ldr r9, addr_cns_3
	add r4, r9, r7
	ldr r7, [r4]
	mov r9, #5
	mov r4, #4
	mul r10, r9, r4
	ldr r4, addr_cns_3
	add r9, r4, r10
	ldr r10, [r9]
	mov r0, r5
	mov r1, r6
	mov r2, r8
	mov r3, r7
	mov r5, #0
	push {r5}
	push {r10}
	bl dfs
	add sp, sp, #8
	mov r6, r0
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r5, [fp, #-4]
	mov r0, r5
	add sp, sp, #32
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

.L322:
.L323:
	b .L319
.L324:
addr_cns_3:
	.word cns
addr_dp_3:
	.word dp
addr_list_3:
	.word list
addr_maxn_3:
	.word maxn
addr_mod_3:
	.word mod
