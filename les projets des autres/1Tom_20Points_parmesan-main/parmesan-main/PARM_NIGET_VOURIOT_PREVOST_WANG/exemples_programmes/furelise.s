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
	.file	"furelise.c"
	.globl	run
	.p2align	1
	.type	run,%function
	.code	16
	.thumb_func
run:
	.fnstart
	.pad	#64
	sub	sp, #64
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
	movs	r0, #204
	str	r0, [sp, #24]
	b	.LBB0_3
.LBB0_3:
	b	.LBB0_4
.LBB0_4:
	movs	r0, #203
	str	r0, [sp, #24]
	b	.LBB0_5
.LBB0_5:
	b	.LBB0_6
.LBB0_6:
	movs	r0, #204
	str	r0, [sp, #24]
	b	.LBB0_7
.LBB0_7:
	b	.LBB0_8
.LBB0_8:
	movs	r0, #203
	str	r0, [sp, #24]
	b	.LBB0_9
.LBB0_9:
	b	.LBB0_10
.LBB0_10:
	movs	r0, #204
	str	r0, [sp, #24]
	b	.LBB0_11
.LBB0_11:
	b	.LBB0_12
.LBB0_12:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_13
.LBB0_13:
	b	.LBB0_14
.LBB0_14:
	movs	r0, #202
	str	r0, [sp, #24]
	b	.LBB0_15
.LBB0_15:
	b	.LBB0_16
.LBB0_16:
	movs	r0, #200
	str	r0, [sp, #24]
	b	.LBB0_17
.LBB0_17:
	b	.LBB0_18
.LBB0_18:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_19
.LBB0_19:
	b	.LBB0_20
.LBB0_20:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_21
.LBB0_21:
	b	.LBB0_22
.LBB0_22:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_23
.LBB0_23:
	b	.LBB0_24
.LBB0_24:
	movs	r0, #188
	str	r0, [sp, #24]
	b	.LBB0_25
.LBB0_25:
	b	.LBB0_26
.LBB0_26:
	movs	r0, #192
	str	r0, [sp, #24]
	b	.LBB0_27
.LBB0_27:
	b	.LBB0_28
.LBB0_28:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_29
.LBB0_29:
	b	.LBB0_30
.LBB0_30:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_31
.LBB0_31:
	b	.LBB0_32
.LBB0_32:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_33
.LBB0_33:
	b	.LBB0_34
.LBB0_34:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_35
.LBB0_35:
	b	.LBB0_36
.LBB0_36:
	movs	r0, #192
	str	r0, [sp, #24]
	b	.LBB0_37
.LBB0_37:
	b	.LBB0_38
.LBB0_38:
	movs	r0, #196
	str	r0, [sp, #24]
	b	.LBB0_39
.LBB0_39:
	b	.LBB0_40
.LBB0_40:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_41
.LBB0_41:
	b	.LBB0_42
.LBB0_42:
	movs	r0, #200
	str	r0, [sp, #24]
	b	.LBB0_43
.LBB0_43:
	b	.LBB0_44
.LBB0_44:
	movs	r0, #200
	str	r0, [sp, #24]
	b	.LBB0_45
.LBB0_45:
	b	.LBB0_46
.LBB0_46:
	movs	r0, #200
	str	r0, [sp, #24]
	b	.LBB0_47
.LBB0_47:
	b	.LBB0_48
.LBB0_48:
	movs	r0, #192
	str	r0, [sp, #24]
	b	.LBB0_49
.LBB0_49:
	b	.LBB0_50
.LBB0_50:
	movs	r0, #204
	str	r0, [sp, #24]
	b	.LBB0_51
.LBB0_51:
	b	.LBB0_52
.LBB0_52:
	movs	r0, #203
	str	r0, [sp, #24]
	b	.LBB0_53
.LBB0_53:
	b	.LBB0_54
.LBB0_54:
	movs	r0, #204
	str	r0, [sp, #24]
	b	.LBB0_55
.LBB0_55:
	b	.LBB0_56
.LBB0_56:
	movs	r0, #203
	str	r0, [sp, #24]
	b	.LBB0_57
.LBB0_57:
	b	.LBB0_58
.LBB0_58:
	movs	r0, #204
	str	r0, [sp, #24]
	b	.LBB0_59
.LBB0_59:
	b	.LBB0_60
.LBB0_60:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_61
.LBB0_61:
	b	.LBB0_62
.LBB0_62:
	movs	r0, #202
	str	r0, [sp, #24]
	b	.LBB0_63
.LBB0_63:
	b	.LBB0_64
.LBB0_64:
	movs	r0, #200
	str	r0, [sp, #24]
	b	.LBB0_65
.LBB0_65:
	b	.LBB0_66
.LBB0_66:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_67
.LBB0_67:
	b	.LBB0_68
.LBB0_68:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_69
.LBB0_69:
	b	.LBB0_70
.LBB0_70:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_71
.LBB0_71:
	b	.LBB0_72
.LBB0_72:
	movs	r0, #188
	str	r0, [sp, #24]
	b	.LBB0_73
.LBB0_73:
	b	.LBB0_74
.LBB0_74:
	movs	r0, #192
	str	r0, [sp, #24]
	b	.LBB0_75
.LBB0_75:
	b	.LBB0_76
.LBB0_76:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_77
.LBB0_77:
	b	.LBB0_78
.LBB0_78:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_79
.LBB0_79:
	b	.LBB0_80
.LBB0_80:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_81
.LBB0_81:
	b	.LBB0_82
.LBB0_82:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_83
.LBB0_83:
	b	.LBB0_84
.LBB0_84:
	movs	r0, #192
	str	r0, [sp, #24]
	b	.LBB0_85
.LBB0_85:
	b	.LBB0_86
.LBB0_86:
	movs	r0, #200
	str	r0, [sp, #24]
	b	.LBB0_87
.LBB0_87:
	b	.LBB0_88
.LBB0_88:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_89
.LBB0_89:
	b	.LBB0_90
.LBB0_90:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_91
.LBB0_91:
	b	.LBB0_92
.LBB0_92:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_93
.LBB0_93:
	b	.LBB0_94
.LBB0_94:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_95
.LBB0_95:
	b	.LBB0_96
.LBB0_96:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_97
.LBB0_97:
	b	.LBB0_98
.LBB0_98:
	movs	r0, #200
	str	r0, [sp, #24]
	b	.LBB0_99
.LBB0_99:
	b	.LBB0_100
.LBB0_100:
	movs	r0, #202
	str	r0, [sp, #24]
	b	.LBB0_101
.LBB0_101:
	b	.LBB0_102
.LBB0_102:
	movs	r0, #204
	str	r0, [sp, #24]
	b	.LBB0_103
.LBB0_103:
	b	.LBB0_104
.LBB0_104:
	movs	r0, #204
	str	r0, [sp, #24]
	b	.LBB0_105
.LBB0_105:
	b	.LBB0_106
.LBB0_106:
	movs	r0, #204
	str	r0, [sp, #24]
	b	.LBB0_107
.LBB0_107:
	b	.LBB0_108
.LBB0_108:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_109
.LBB0_109:
	b	.LBB0_110
.LBB0_110:
	movs	r0, #205
	str	r0, [sp, #24]
	b	.LBB0_111
.LBB0_111:
	b	.LBB0_112
.LBB0_112:
	movs	r0, #204
	str	r0, [sp, #24]
	b	.LBB0_113
.LBB0_113:
	b	.LBB0_114
.LBB0_114:
	movs	r0, #202
	str	r0, [sp, #24]
	b	.LBB0_115
.LBB0_115:
	b	.LBB0_116
.LBB0_116:
	movs	r0, #202
	str	r0, [sp, #24]
	b	.LBB0_117
.LBB0_117:
	b	.LBB0_118
.LBB0_118:
	movs	r0, #202
	str	r0, [sp, #24]
	b	.LBB0_119
.LBB0_119:
	b	.LBB0_120
.LBB0_120:
	movs	r0, #195
	str	r0, [sp, #24]
	b	.LBB0_121
.LBB0_121:
	b	.LBB0_122
.LBB0_122:
	movs	r0, #204
	str	r0, [sp, #24]
	b	.LBB0_123
.LBB0_123:
	b	.LBB0_124
.LBB0_124:
	movs	r0, #202
	str	r0, [sp, #24]
	b	.LBB0_125
.LBB0_125:
	b	.LBB0_126
.LBB0_126:
	movs	r0, #200
	str	r0, [sp, #24]
	b	.LBB0_127
.LBB0_127:
	b	.LBB0_128
.LBB0_128:
	movs	r0, #200
	str	r0, [sp, #24]
	b	.LBB0_129
.LBB0_129:
	b	.LBB0_130
.LBB0_130:
	movs	r0, #200
	str	r0, [sp, #24]
	b	.LBB0_131
.LBB0_131:
	b	.LBB0_132
.LBB0_132:
	movs	r0, #193
	str	r0, [sp, #24]
	b	.LBB0_133
.LBB0_133:
	b	.LBB0_134
.LBB0_134:
	movs	r0, #202
	str	r0, [sp, #24]
	b	.LBB0_135
.LBB0_135:
	b	.LBB0_136
.LBB0_136:
	movs	r0, #200
	str	r0, [sp, #24]
	b	.LBB0_137
.LBB0_137:
	b	.LBB0_138
.LBB0_138:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_139
.LBB0_139:
	b	.LBB0_140
.LBB0_140:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_141
.LBB0_141:
	b	.LBB0_142
.LBB0_142:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_143
.LBB0_143:
	b	.LBB0_144
.LBB0_144:
	movs	r0, #192
	str	r0, [sp, #24]
	b	.LBB0_145
.LBB0_145:
	b	.LBB0_146
.LBB0_146:
	movs	r0, #192
	str	r0, [sp, #24]
	b	.LBB0_147
.LBB0_147:
	b	.LBB0_148
.LBB0_148:
	movs	r0, #192
	str	r0, [sp, #24]
	b	.LBB0_149
.LBB0_149:
	b	.LBB0_150
.LBB0_150:
	movs	r0, #204
	str	r0, [sp, #24]
	b	.LBB0_151
.LBB0_151:
	b	.LBB0_152
.LBB0_152:
	movs	r0, #203
	str	r0, [sp, #24]
	b	.LBB0_153
.LBB0_153:
	b	.LBB0_154
.LBB0_154:
	movs	r0, #204
	str	r0, [sp, #24]
	b	.LBB0_155
.LBB0_155:
	b	.LBB0_156
.LBB0_156:
	movs	r0, #203
	str	r0, [sp, #24]
	b	.LBB0_157
.LBB0_157:
	b	.LBB0_158
.LBB0_158:
	movs	r0, #204
	str	r0, [sp, #24]
	b	.LBB0_159
.LBB0_159:
	b	.LBB0_160
.LBB0_160:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_161
.LBB0_161:
	b	.LBB0_162
.LBB0_162:
	movs	r0, #202
	str	r0, [sp, #24]
	b	.LBB0_163
.LBB0_163:
	b	.LBB0_164
.LBB0_164:
	movs	r0, #200
	str	r0, [sp, #24]
	b	.LBB0_165
.LBB0_165:
	b	.LBB0_166
.LBB0_166:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_167
.LBB0_167:
	b	.LBB0_168
.LBB0_168:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_169
.LBB0_169:
	b	.LBB0_170
.LBB0_170:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_171
.LBB0_171:
	b	.LBB0_172
.LBB0_172:
	movs	r0, #188
	str	r0, [sp, #24]
	b	.LBB0_173
.LBB0_173:
	b	.LBB0_174
.LBB0_174:
	movs	r0, #192
	str	r0, [sp, #24]
	b	.LBB0_175
.LBB0_175:
	b	.LBB0_176
.LBB0_176:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_177
.LBB0_177:
	b	.LBB0_178
.LBB0_178:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_179
.LBB0_179:
	b	.LBB0_180
.LBB0_180:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_181
.LBB0_181:
	b	.LBB0_182
.LBB0_182:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_183
.LBB0_183:
	b	.LBB0_184
.LBB0_184:
	movs	r0, #192
	str	r0, [sp, #24]
	b	.LBB0_185
.LBB0_185:
	b	.LBB0_186
.LBB0_186:
	movs	r0, #196
	str	r0, [sp, #24]
	b	.LBB0_187
.LBB0_187:
	b	.LBB0_188
.LBB0_188:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_189
.LBB0_189:
	b	.LBB0_190
.LBB0_190:
	movs	r0, #200
	str	r0, [sp, #24]
	b	.LBB0_191
.LBB0_191:
	b	.LBB0_192
.LBB0_192:
	movs	r0, #200
	str	r0, [sp, #24]
	b	.LBB0_193
.LBB0_193:
	b	.LBB0_194
.LBB0_194:
	movs	r0, #200
	str	r0, [sp, #24]
	b	.LBB0_195
.LBB0_195:
	b	.LBB0_196
.LBB0_196:
	movs	r0, #192
	str	r0, [sp, #24]
	b	.LBB0_197
.LBB0_197:
	b	.LBB0_198
.LBB0_198:
	movs	r0, #204
	str	r0, [sp, #24]
	b	.LBB0_199
.LBB0_199:
	b	.LBB0_200
.LBB0_200:
	movs	r0, #203
	str	r0, [sp, #24]
	b	.LBB0_201
.LBB0_201:
	b	.LBB0_202
.LBB0_202:
	movs	r0, #204
	str	r0, [sp, #24]
	b	.LBB0_203
.LBB0_203:
	b	.LBB0_204
.LBB0_204:
	movs	r0, #203
	str	r0, [sp, #24]
	b	.LBB0_205
.LBB0_205:
	b	.LBB0_206
.LBB0_206:
	movs	r0, #204
	str	r0, [sp, #24]
	b	.LBB0_207
.LBB0_207:
	b	.LBB0_208
.LBB0_208:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_209
.LBB0_209:
	b	.LBB0_210
.LBB0_210:
	movs	r0, #202
	str	r0, [sp, #24]
	b	.LBB0_211
.LBB0_211:
	b	.LBB0_212
.LBB0_212:
	movs	r0, #200
	str	r0, [sp, #24]
	b	.LBB0_213
.LBB0_213:
	b	.LBB0_214
.LBB0_214:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_215
.LBB0_215:
	b	.LBB0_216
.LBB0_216:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_217
.LBB0_217:
	b	.LBB0_218
.LBB0_218:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_219
.LBB0_219:
	b	.LBB0_220
.LBB0_220:
	movs	r0, #188
	str	r0, [sp, #24]
	b	.LBB0_221
.LBB0_221:
	b	.LBB0_222
.LBB0_222:
	movs	r0, #192
	str	r0, [sp, #24]
	b	.LBB0_223
.LBB0_223:
	b	.LBB0_224
.LBB0_224:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_225
.LBB0_225:
	b	.LBB0_226
.LBB0_226:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_227
.LBB0_227:
	b	.LBB0_228
.LBB0_228:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_229
.LBB0_229:
	b	.LBB0_230
.LBB0_230:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_231
.LBB0_231:
	b	.LBB0_232
.LBB0_232:
	movs	r0, #192
	str	r0, [sp, #24]
	b	.LBB0_233
.LBB0_233:
	b	.LBB0_234
.LBB0_234:
	movs	r0, #200
	str	r0, [sp, #24]
	b	.LBB0_235
.LBB0_235:
	b	.LBB0_236
.LBB0_236:
	movs	r0, #199
	str	r0, [sp, #24]
	b	.LBB0_237
.LBB0_237:
	b	.LBB0_238
.LBB0_238:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_239
.LBB0_239:
	b	.LBB0_240
.LBB0_240:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_241
.LBB0_241:
	b	.LBB0_242
.LBB0_242:
	movs	r0, #197
	str	r0, [sp, #24]
	b	.LBB0_243
.LBB0_243:
	b	.LBB0_244
.LBB0_244:
	movs	r0, #0
	str	r0, [sp, #24]
	b	.LBB0_245
.LBB0_245:
	b	.LBB0_246
.LBB0_246:
	movs	r0, #1
	str	r0, [sp, #20]
	b	.LBB0_247
.LBB0_247:
	b	.LBB0_1
.Lfunc_end0:
	.size	run, .Lfunc_end0-run
	.cantunwind
	.fnend


	.ident	"clang version 8.0.1-9 (tags/RELEASE_801/final)"
	.section	".note.GNU-stack","",%progbits
	.addrsig
	.eabi_attribute	30, 6
