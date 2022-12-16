declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@a = global i32 0, align 4
@b = global i32 0, align 4
@d = global i32 0, align 4
define i32 @set_a(i32 %t3) {
B121:
  %t122 = alloca i32, align 4
  store i32 %t3, i32* %t122, align 4
  %t6 = load i32, i32* %t122, align 4
  store i32 %t6, i32* @a, align 4
  %t7 = load i32, i32* @a, align 4
  ret i32 %t7
}
define i32 @set_b(i32 %t8) {
B124:
  %t125 = alloca i32, align 4
  store i32 %t8, i32* %t125, align 4
  %t11 = load i32, i32* %t125, align 4
  store i32 %t11, i32* @b, align 4
  %t12 = load i32, i32* @b, align 4
  ret i32 %t12
}
define i32 @set_d(i32 %t13) {
B127:
  %t128 = alloca i32, align 4
  store i32 %t13, i32* %t128, align 4
  %t16 = load i32, i32* %t128, align 4
  store i32 %t16, i32* @d, align 4
  %t17 = load i32, i32* @d, align 4
  ret i32 %t17
}
define i32 @main() {
B130:
  %t216 = alloca i32, align 4
  %t215 = alloca i32, align 4
  %t214 = alloca i32, align 4
  %t213 = alloca i32, align 4
  %t212 = alloca i32, align 4
  %t149 = alloca i32, align 4
  store i32 2, i32* @a, align 4
  store i32 3, i32* @b, align 4
  %t20 = call i32 @set_a(i32 0)
  %t23 = icmp ne i32 %t20, 0
  br i1 %t23, label %B133, label %B135
B133:                               	; preds = %B130
  %t21 = call i32 @set_b(i32 1)
  %t24 = icmp ne i32 %t21, 0
  br i1 %t24, label %B131, label %B138
B135:                               	; preds = %B130
  br label %B132
B131:                               	; preds = %B133
  br label %B132
B138:                               	; preds = %B133
  br label %B132
B132:                               	; preds = %B131, %B135, %B138
  %t25 = load i32, i32* @a, align 4
call void @putint(i32 %t25)
call void @putch(i32 32)
  %t26 = load i32, i32* @b, align 4
call void @putint(i32 %t26)
call void @putch(i32 32)
  store i32 2, i32* @a, align 4
  store i32 3, i32* @b, align 4
  %t29 = call i32 @set_a(i32 0)
  %t32 = icmp ne i32 %t29, 0
  br i1 %t32, label %B142, label %B144
B142:                               	; preds = %B132
  %t30 = call i32 @set_b(i32 1)
  %t33 = icmp ne i32 %t30, 0
  br i1 %t33, label %B140, label %B147
B144:                               	; preds = %B132
  br label %B141
B140:                               	; preds = %B142
  br label %B141
B147:                               	; preds = %B142
  br label %B141
B141:                               	; preds = %B140, %B144, %B147
  %t34 = load i32, i32* @a, align 4
call void @putint(i32 %t34)
call void @putch(i32 32)
  %t35 = load i32, i32* @b, align 4
call void @putint(i32 %t35)
call void @putch(i32 10)
  store i32 1, i32* %t149, align 4
  store i32 2, i32* @d, align 4
  %t38 = load i32, i32* %t149, align 4
  %t39 = icmp sge i32 %t38, 1
  br i1 %t39, label %B152, label %B155
B152:                               	; preds = %B141
  %t40 = call i32 @set_d(i32 3)
  %t42 = icmp ne i32 %t40, 0
  br i1 %t42, label %B150, label %B157
B155:                               	; preds = %B141
  br label %B151
B150:                               	; preds = %B152
  br label %B151
B157:                               	; preds = %B152
  br label %B151
B151:                               	; preds = %B150, %B155, %B157
  %t43 = load i32, i32* @d, align 4
call void @putint(i32 %t43)
call void @putch(i32 32)
  %t44 = load i32, i32* %t149, align 4
  %t45 = icmp sle i32 %t44, 1
  br i1 %t45, label %B159, label %B164
B159:                               	; preds = %B151, %B161
  br label %B160
B164:                               	; preds = %B151
  br label %B161
B160:                               	; preds = %B159, %B166
  %t49 = load i32, i32* @d, align 4
call void @putint(i32 %t49)
call void @putch(i32 10)
  %t50 = add i32 2, 1
  %t51 = sub i32 3, %t50
  %t52 = icmp sge i32 16, %t51
  br i1 %t52, label %B168, label %B172
B161:                               	; preds = %B164
  %t46 = call i32 @set_d(i32 4)
  %t48 = icmp ne i32 %t46, 0
  br i1 %t48, label %B159, label %B166
B168:                               	; preds = %B160
call void @putch(i32 65)
  br label %B169
B172:                               	; preds = %B160
  br label %B169
B166:                               	; preds = %B161
  br label %B160
B169:                               	; preds = %B168, %B172
  %t53 = sub i32 25, 7
  %t54 = mul i32 6, 3
  %t55 = sub i32 36, %t54
  %t56 = icmp ne i32 %t53, %t55
  br i1 %t56, label %B173, label %B177
B173:                               	; preds = %B169
call void @putch(i32 66)
  br label %B174
B177:                               	; preds = %B169
  br label %B174
B174:                               	; preds = %B173, %B177
  %t57 = icmp slt i32 1, 8
  %t58 = srem i32 7, 2
  %t183 = zext i1 %t57 to i32
  %t59 = icmp ne i32 %t183, %t58
  br i1 %t59, label %B178, label %B186
B178:                               	; preds = %B174
call void @putch(i32 67)
  br label %B179
B186:                               	; preds = %B174
  br label %B179
B179:                               	; preds = %B178, %B186
  %t60 = icmp sgt i32 3, 4
  %t192 = zext i1 %t60 to i32
  %t61 = icmp eq i32 %t192, 0
  br i1 %t61, label %B187, label %B195
B187:                               	; preds = %B179
call void @putch(i32 68)
  br label %B188
B195:                               	; preds = %B179
  br label %B188
B188:                               	; preds = %B187, %B195
  %t62 = icmp sle i32 102, 63
  %t201 = zext i1 %t62 to i32
  %t63 = icmp eq i32 1, %t201
  br i1 %t63, label %B196, label %B204
B196:                               	; preds = %B188
call void @putch(i32 69)
  br label %B197
B204:                               	; preds = %B188
  br label %B197
B197:                               	; preds = %B196, %B204
  %t64 = sub i32 5, 6
  %t207 = icmp ne i32 0, 0
  %t65 = xor i1 %t207, true
  %t208 = zext i1 %t65 to i32
  %t66 = sub i32 0, %t208
  %t67 = icmp eq i32 %t64, %t66
  br i1 %t67, label %B205, label %B211
B205:                               	; preds = %B197
call void @putch(i32 70)
  br label %B206
B211:                               	; preds = %B197
  br label %B206
B206:                               	; preds = %B205, %B211
call void @putch(i32 10)
  store i32 0, i32* %t212, align 4
  store i32 1, i32* %t213, align 4
  store i32 2, i32* %t214, align 4
  store i32 3, i32* %t215, align 4
  store i32 4, i32* %t216, align 4
  br label %B217
B217:                               	; preds = %B206, %B218
  %t73 = load i32, i32* %t212, align 4
  %t76 = icmp ne i32 %t73, 0
  br i1 %t76, label %B220, label %B222
B220:                               	; preds = %B217
  %t74 = load i32, i32* %t213, align 4
  %t77 = icmp ne i32 %t74, 0
  br i1 %t77, label %B218, label %B225
B222:                               	; preds = %B217
  br label %B219
B218:                               	; preds = %B220
call void @putch(i32 32)
  br label %B217
B225:                               	; preds = %B220
  br label %B219
B219:                               	; preds = %B222, %B225
  %t78 = load i32, i32* %t212, align 4
  %t81 = icmp ne i32 %t78, 0
  br i1 %t81, label %B227, label %B231
B227:                               	; preds = %B219, %B229
call void @putch(i32 67)
  br label %B228
B231:                               	; preds = %B219
  br label %B229
B228:                               	; preds = %B227, %B234
  %t83 = load i32, i32* %t212, align 4
  %t84 = load i32, i32* %t213, align 4
  %t85 = icmp sge i32 %t83, %t84
  br i1 %t85, label %B236, label %B241
B229:                               	; preds = %B231
  %t79 = load i32, i32* %t213, align 4
  %t82 = icmp ne i32 %t79, 0
  br i1 %t82, label %B227, label %B234
B236:                               	; preds = %B228, %B238
call void @putch(i32 72)
  br label %B237
B241:                               	; preds = %B228
  br label %B238
B234:                               	; preds = %B229
  br label %B228
B237:                               	; preds = %B236, %B244
  %t90 = load i32, i32* %t214, align 4
  %t91 = load i32, i32* %t213, align 4
  %t92 = icmp sge i32 %t90, %t91
  br i1 %t92, label %B247, label %B250
B238:                               	; preds = %B241
  %t86 = load i32, i32* %t213, align 4
  %t87 = load i32, i32* %t212, align 4
  %t88 = icmp sle i32 %t86, %t87
  br i1 %t88, label %B236, label %B244
B247:                               	; preds = %B237
  %t93 = load i32, i32* %t216, align 4
  %t94 = load i32, i32* %t215, align 4
  %t95 = icmp ne i32 %t93, %t94
  br i1 %t95, label %B245, label %B253
B250:                               	; preds = %B237
  br label %B246
B244:                               	; preds = %B238
  br label %B237
B245:                               	; preds = %B247
call void @putch(i32 73)
  br label %B246
B253:                               	; preds = %B247
  br label %B246
B246:                               	; preds = %B245, %B250, %B253
  %t97 = load i32, i32* %t212, align 4
  %t98 = load i32, i32* %t213, align 4
  %t258 = icmp ne i32 %t98, 0
  %t99 = xor i1 %t258, true
  %t259 = zext i1 %t99 to i32
  %t100 = icmp eq i32 %t97, %t259
  br i1 %t100, label %B257, label %B262
B257:                               	; preds = %B246
  %t101 = load i32, i32* %t215, align 4
  %t102 = load i32, i32* %t215, align 4
  %t103 = icmp slt i32 %t101, %t102
  br i1 %t103, label %B254, label %B265
B262:                               	; preds = %B246
  br label %B256
B254:                               	; preds = %B256, %B257
call void @putch(i32 74)
  br label %B255
B265:                               	; preds = %B257
  br label %B256
B256:                               	; preds = %B262, %B265
  %t105 = load i32, i32* %t216, align 4
  %t106 = load i32, i32* %t216, align 4
  %t107 = icmp sge i32 %t105, %t106
  br i1 %t107, label %B254, label %B268
B255:                               	; preds = %B254, %B268
  %t109 = load i32, i32* %t212, align 4
  %t110 = load i32, i32* %t213, align 4
  %t272 = icmp ne i32 %t110, 0
  %t111 = xor i1 %t272, true
  %t273 = zext i1 %t111 to i32
  %t112 = icmp eq i32 %t109, %t273
  br i1 %t112, label %B269, label %B276
B268:                               	; preds = %B256
  br label %B255
B269:                               	; preds = %B255, %B277
call void @putch(i32 75)
  br label %B270
B276:                               	; preds = %B255
  br label %B271
B270:                               	; preds = %B269, %B280, %B283
call void @putch(i32 10)
  ret i32 0
B271:                               	; preds = %B276
  %t113 = load i32, i32* %t215, align 4
  %t114 = load i32, i32* %t215, align 4
  %t115 = icmp slt i32 %t113, %t114
  br i1 %t115, label %B277, label %B280
B277:                               	; preds = %B271
  %t116 = load i32, i32* %t216, align 4
  %t117 = load i32, i32* %t216, align 4
  %t118 = icmp sge i32 %t116, %t117
  br i1 %t118, label %B269, label %B283
B280:                               	; preds = %B271
  br label %B270
B283:                               	; preds = %B277
  br label %B270
}
