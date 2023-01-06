	.text
	.syntax unified
	.eabi_attribute	67, "2.09"
	.cpu	cortex-m0
	.eabi_attribute	6, 12
	.eabi_attribute	7, 77
	.eabi_attribute	8, 0
	.eabi_attribute	9, 1
	.eabi_attribute	34, 0
	.eabi_attribute	17, 1
	.eabi_attribute	20, 1
	.eabi_attribute	21, 0
	.eabi_attribute	23, 3
	.eabi_attribute	24, 1
	.eabi_attribute	25, 1
	.eabi_attribute	38, 1
	.eabi_attribute	18, 4
	.eabi_attribute	26, 2
	.eabi_attribute	14, 0
	.file	"main.c"
	.globl	run
	.p2align	1
	.type	run,%function
	.code	16
	.thumb_func
run:
	.fnstart
	.pad	#100
	sub	sp, #100
	@APP
	sub	sp, #508
	@NO_APP
	@APP
	sub	sp, #452
	@NO_APP
	movs	r0, #0
	str	r0, [sp, #12]
	b	.LBB0_1
.LBB0_1:
	ldr	r0, [sp, #12]
	cmp	r0, #9
	bgt	.LBB0_3
	b	.LBB0_2
.LBB0_2:
	ldr	r0, [sp, #12]
	adds	r0, r0, #1
	str	r0, [sp, #12]
	b	.LBB0_1
.LBB0_3:
	ldr	r0, [sp, #12]
	cmp	r0, #9
	bgt	.LBB0_5
	b	.LBB0_4
.LBB0_4:
	movs	r0, #5
	str	r0, [sp, #12]
	b	.LBB0_6
.LBB0_5:
	movs	r0, #6
	str	r0, [sp, #12]
	b	.LBB0_6
.LBB0_6:
	movs	r0, #100
	str	r0, [sp, #8]
	movs	r0, #0
	str	r0, [sp, #4]
	ldr	r0, [sp, #8]
	subs	r0, #50
	cmp	r0, #50
	blt	.LBB0_8
	b	.LBB0_7
.LBB0_7:
	movs	r0, #40
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	movs	r1, #80
	muls	r1, r0, r1
	str	r1, [sp, #4]
	movs	r0, #175
	lsls	r0, r0, #1
	str	r0, [sp, #4]
	b	.LBB0_8
.LBB0_8:
	movs	r0, #50
	str	r0, [sp]
	movs	r0, #0
	mvns	r0, r0
	str	r0, [sp]
	b	.LBB0_9
.LBB0_9:
	b	.LBB0_10
.LBB0_10:
	b	.LBB0_10
.Lfunc_end0:
	.size	run, .Lfunc_end0-run
	.cantunwind
	.fnend

	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",%progbits
	.addrsig
	.eabi_attribute	30, 6