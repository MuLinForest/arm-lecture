	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}

	@ R4 = R0 - 0 (update flags)
	subs R4, R0, #0

	@ if(R0 <= 0) goto .L3 (which returns 0)
	cmp R4, #1
	blt .L3

	@ Compare R4 wtih 1
	@ If R4 == 1 goto .L4 (which returns 1)
	beq .L4


	mov R3, #0
	mov R0, #1
	sub R4, #1
for: 
	subs R4, #1
	itttt ge
	movge R5, R0
	addge R0, R3, R0
	movge R3, R5
	bge for

	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
