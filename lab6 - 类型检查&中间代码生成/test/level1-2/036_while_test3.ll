declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@g = global i32 0, align 4
@h = global i32 0, align 4
@f = global i32 0, align 4
@e = global i32 0, align 4
define i32 @EightWhile() {
B93:
  %t97 = alloca i32, align 4
  %t96 = alloca i32, align 4
  %t95 = alloca i32, align 4
  %t94 = alloca i32, align 4
  store i32 5, i32* %t94, align 4
  store i32 6, i32* %t95, align 4
  store i32 7, i32* %t96, align 4
  store i32 10, i32* %t97, align 4
  br label %B98
B98:                               	; preds = %B93, %B106
  %t12 = load i32, i32* %t94, align 4
  %t13 = icmp slt i32 %t12, 20
  br i1 %t13, label %B99, label %B103
B99:                               	; preds = %B98
  %t15 = load i32, i32* %t94, align 4
  %t16 = add i32 %t15, 3
  store i32 %t16, i32* %t94, align 4
  br label %B104
B103:                               	; preds = %B98
  br label %B100
B104:                               	; preds = %B99, %B112
  %t17 = load i32, i32* %t95, align 4
  %t18 = icmp slt i32 %t17, 10
  br i1 %t18, label %B105, label %B109
B100:                               	; preds = %B103
  %t73 = load i32, i32* %t94, align 4
  %t74 = load i32, i32* %t95, align 4
  %t75 = load i32, i32* %t97, align 4
  %t76 = add i32 %t74, %t75
  %t77 = add i32 %t73, %t76
  %t78 = load i32, i32* %t96, align 4
  %t79 = add i32 %t77, %t78
  %t80 = load i32, i32* @e, align 4
  %t81 = load i32, i32* %t97, align 4
  %t82 = add i32 %t80, %t81
  %t83 = load i32, i32* @g, align 4
  %t84 = sub i32 %t82, %t83
  %t85 = load i32, i32* @h, align 4
  %t86 = add i32 %t84, %t85
  %t87 = sub i32 %t79, %t86
  ret i32 %t87
B105:                               	; preds = %B104
  %t20 = load i32, i32* %t95, align 4
  %t21 = add i32 %t20, 1
  store i32 %t21, i32* %t95, align 4
  br label %B110
B109:                               	; preds = %B104
  br label %B106
B110:                               	; preds = %B105, %B118
  %t22 = load i32, i32* %t96, align 4
  %t23 = icmp eq i32 %t22, 7
  br i1 %t23, label %B111, label %B115
B106:                               	; preds = %B109
  %t71 = load i32, i32* %t95, align 4
  %t72 = sub i32 %t71, 2
  store i32 %t72, i32* %t95, align 4
  br label %B98
B111:                               	; preds = %B110
  %t25 = load i32, i32* %t96, align 4
  %t26 = sub i32 %t25, 1
  store i32 %t26, i32* %t96, align 4
  br label %B116
B115:                               	; preds = %B110
  br label %B112
B116:                               	; preds = %B111, %B124
  %t27 = load i32, i32* %t97, align 4
  %t28 = icmp slt i32 %t27, 20
  br i1 %t28, label %B117, label %B121
B112:                               	; preds = %B115
  %t68 = load i32, i32* %t96, align 4
  %t69 = add i32 %t68, 1
  store i32 %t69, i32* %t96, align 4
  br label %B104
B117:                               	; preds = %B116
  %t30 = load i32, i32* %t97, align 4
  %t31 = add i32 %t30, 3
  store i32 %t31, i32* %t97, align 4
  br label %B122
B121:                               	; preds = %B116
  br label %B118
B122:                               	; preds = %B117, %B130
  %t32 = load i32, i32* @e, align 4
  %t33 = icmp sgt i32 %t32, 1
  br i1 %t33, label %B123, label %B127
B118:                               	; preds = %B121
  %t65 = load i32, i32* %t97, align 4
  %t66 = sub i32 %t65, 1
  store i32 %t66, i32* %t97, align 4
  br label %B110
B123:                               	; preds = %B122
  %t35 = load i32, i32* @e, align 4
  %t36 = sub i32 %t35, 1
  store i32 %t36, i32* @e, align 4
  br label %B128
B127:                               	; preds = %B122
  br label %B124
B128:                               	; preds = %B123, %B136
  %t37 = load i32, i32* @f, align 4
  %t38 = icmp sgt i32 %t37, 2
  br i1 %t38, label %B129, label %B133
B124:                               	; preds = %B127
  %t62 = load i32, i32* @e, align 4
  %t63 = add i32 %t62, 1
  store i32 %t63, i32* @e, align 4
  br label %B116
B129:                               	; preds = %B128
  %t40 = load i32, i32* @f, align 4
  %t41 = sub i32 %t40, 2
  store i32 %t41, i32* @f, align 4
  br label %B134
B133:                               	; preds = %B128
  br label %B130
B134:                               	; preds = %B129, %B142
  %t42 = load i32, i32* @g, align 4
  %t43 = icmp slt i32 %t42, 3
  br i1 %t43, label %B135, label %B139
B130:                               	; preds = %B133
  %t59 = load i32, i32* @f, align 4
  %t60 = add i32 %t59, 1
  store i32 %t60, i32* @f, align 4
  br label %B122
B135:                               	; preds = %B134
  %t45 = load i32, i32* @g, align 4
  %t46 = add i32 %t45, 10
  store i32 %t46, i32* @g, align 4
  br label %B140
B139:                               	; preds = %B134
  br label %B136
B140:                               	; preds = %B135, %B141
  %t47 = load i32, i32* @h, align 4
  %t48 = icmp slt i32 %t47, 10
  br i1 %t48, label %B141, label %B145
B136:                               	; preds = %B139
  %t56 = load i32, i32* @g, align 4
  %t57 = sub i32 %t56, 8
  store i32 %t57, i32* @g, align 4
  br label %B128
B141:                               	; preds = %B140
  %t50 = load i32, i32* @h, align 4
  %t51 = add i32 %t50, 8
  store i32 %t51, i32* @h, align 4
  br label %B140
B145:                               	; preds = %B140
  br label %B142
B142:                               	; preds = %B145
  %t53 = load i32, i32* @h, align 4
  %t54 = sub i32 %t53, 1
  store i32 %t54, i32* @h, align 4
  br label %B134
}
define i32 @main() {
B147:
  store i32 1, i32* @g, align 4
  store i32 2, i32* @h, align 4
  store i32 4, i32* @e, align 4
  store i32 6, i32* @f, align 4
  %t92 = call i32 @EightWhile()
  ret i32 %t92
}
