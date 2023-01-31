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
	.eabi_attribute	21, 1
	.eabi_attribute	23, 3
	.eabi_attribute	24, 1
	.eabi_attribute	25, 1
	.eabi_attribute	38, 1
	.eabi_attribute	18, 4
	.eabi_attribute	26, 2
	.eabi_attribute	14, 0
	.file	"PARM.c"
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
	b	.LBB0_1
.LBB0_1:
	b	.LBB0_2
.LBB0_2:
	b	.LBB0_3
.LBB0_3:
	b	.LBB0_4
.LBB0_4:
	b	.LBB0_5
.LBB0_5:
	b	.LBB0_6
.LBB0_6:
	b	.LBB0_7
.LBB0_7:
	b	.LBB0_8
.LBB0_8:
	movs	r0, #80
	str	r0, [sp, #36]
	b	.LBB0_9
.LBB0_9:
	b	.LBB0_10
.LBB0_10:
	movs	r0, #65
	str	r0, [sp, #36]
	b	.LBB0_11
.LBB0_11:
	b	.LBB0_12
.LBB0_12:
	b	.LBB0_13
.LBB0_13:
	movs	r0, #82
	str	r0, [sp, #36]
	b	.LBB0_14
.LBB0_14:
	b	.LBB0_15
.LBB0_15:
	b	.LBB0_16
.LBB0_16:
	movs	r0, #77
	str	r0, [sp, #36]
	b	.LBB0_17
.LBB0_17:
	b	.LBB0_18
.LBB0_18:
	b	.LBB0_19
.LBB0_19:
	movs	r0, #32
	str	r0, [sp, #36]
	b	.LBB0_20
.LBB0_20:
	b	.LBB0_21
.LBB0_21:
	b	.LBB0_22
.LBB0_22:
	movs	r0, #45
	str	r0, [sp, #36]
	b	.LBB0_23
.LBB0_23:
	b	.LBB0_24
.LBB0_24:
	b	.LBB0_25
.LBB0_25:
	movs	r0, #62
	str	r0, [sp, #36]
	b	.LBB0_26
.LBB0_26:
	b	.LBB0_27
.LBB0_27:
	b	.LBB0_28
.LBB0_28:
	movs	r0, #32
	str	r0, [sp, #36]
	b	.LBB0_29
.LBB0_29:
	b	.LBB0_30
.LBB0_30:
	b	.LBB0_31
.LBB0_31:
	ldr	r0, [sp, #44]
	movs	r1, #16
	orrs	r0, r1
	str	r0, [sp, #44]
	b	.LBB0_32
.LBB0_32:
	b	.LBB0_33
.LBB0_33:
	ldr	r0, [sp, #44]
	movs	r1, #4
	orrs	r0, r1
	str	r0, [sp, #44]
	b	.LBB0_34
.LBB0_34:
	b	.LBB0_35
.LBB0_35:
	movs	r0, #1
	str	r0, [sp, #48]
	b	.LBB0_36
.LBB0_36:
	b	.LBB0_37
.LBB0_37:
	ldr	r0, [sp, #44]
	movs	r1, #1
	lsls	r1, r1, #21
	orrs	r0, r1
	str	r0, [sp, #44]
	b	.LBB0_38
.LBB0_38:
	b	.LBB0_39
.LBB0_39:
	ldr	r0, [sp, #44]
	movs	r1, #1
	lsls	r1, r1, #17
	orrs	r0, r1
	str	r0, [sp, #44]
	b	.LBB0_40
.LBB0_40:
	b	.LBB0_41
.LBB0_41:
	movs	r0, #1
	str	r0, [sp, #48]
	b	.LBB0_42
.LBB0_42:
	b	.LBB0_43
.LBB0_43:
	ldr	r0, [sp, #44]
	movs	r1, #1
	lsls	r1, r1, #28
	orrs	r0, r1
	str	r0, [sp, #44]
	b	.LBB0_44
.LBB0_44:
	b	.LBB0_45
.LBB0_45:
	ldr	r0, [sp, #44]
	movs	r1, #1
	lsls	r1, r1, #27
	orrs	r0, r1
	str	r0, [sp, #44]
	b	.LBB0_46
.LBB0_46:
	b	.LBB0_47
.LBB0_47:
	ldr	r0, [sp, #44]
	movs	r1, #1
	lsls	r1, r1, #26
	orrs	r0, r1
	str	r0, [sp, #44]
	b	.LBB0_48
.LBB0_48:
	b	.LBB0_49
.LBB0_49:
	movs	r0, #1
	str	r0, [sp, #48]
	b	.LBB0_50
.LBB0_50:
	movs	r0, #1
	str	r0, [sp, #12]
	movs	r0, #2
	str	r0, [sp, #8]
	ldr	r0, [sp, #12]
	ldr	r1, [sp, #8]
	adds	r0, r0, r1
	str	r0, [sp, #4]
	ldr	r0, [sp, #8]
	ldr	r1, [sp, #12]
	subs	r0, r0, r1
	str	r0, [sp]
	ldr	r0, [sp]
	ldr	r1, [sp, #4]
	adds	r0, r0, r1
	str	r0, [sp]
	ldr	r0, [sp]
	str	r0, [sp, #40]
	b	.LBB0_51
.LBB0_51:
	ldr	r0, [sp]
	adds	r0, #48
	str	r0, [sp, #36]
	b	.LBB0_52
.LBB0_52:
	b	.LBB0_53
.LBB0_53:
	b	.LBB0_54
.LBB0_54:
	b	.LBB0_54
.Lfunc_end0:
	.size	run, .Lfunc_end0-run
	.cantunwind
	.fnend


	.ident	"clang version 8.0.1-9 (tags/RELEASE_801/final)"
	.section	".note.GNU-stack","",%progbits
	.addrsig
	.eabi_attribute	30, 6