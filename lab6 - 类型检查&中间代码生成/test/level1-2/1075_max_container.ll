declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @maxArea(i32* %t0, i32 %t2) {
B71:
  %t83 = alloca i32, align 4
  %t76 = alloca i32, align 4
  %t75 = alloca i32, align 4
  %t74 = alloca i32, align 4
  %t73 = alloca i32, align 4
  %t72 = alloca i32*, align 4
  store i32* %t0, i32** %t72, align 4
  store i32 %t2, i32* %t73, align 4
  store i32 0, i32* %t74, align 4
  %t8 = load i32, i32* %t73, align 4
  %t9 = sub i32 %t8, 1
  store i32 %t9, i32* %t75, align 4
  %t12 = sub i32 0, 1
  store i32 %t12, i32* %t76, align 4
  br label %B77
B77:                               	; preds = %B71, %B105
  %t13 = load i32, i32* %t74, align 4
  %t14 = load i32, i32* %t75, align 4
  %t15 = icmp slt i32 %t13, %t14
  br i1 %t15, label %B78, label %B82
B78:                               	; preds = %B77
  %t87 = load i32*, i32** %t72, align 4
  %t17 = load i32, i32* %t74, align 4
  %t18 = getelementptr inbounds i32, i32* %t87, i32 %t17
  %t88 = load i32, i32* %t18, align 4
  %t89 = load i32*, i32** %t72, align 4
  %t19 = load i32, i32* %t75, align 4
  %t20 = getelementptr inbounds i32, i32* %t89, i32 %t19
  %t90 = load i32, i32* %t20, align 4
  %t21 = icmp slt i32 %t88, %t90
  br i1 %t21, label %B84, label %B93
B82:                               	; preds = %B77
  br label %B79
B84:                               	; preds = %B78
  %t23 = load i32, i32* %t75, align 4
  %t24 = load i32, i32* %t74, align 4
  %t25 = sub i32 %t23, %t24
  %t94 = load i32*, i32** %t72, align 4
  %t26 = load i32, i32* %t74, align 4
  %t27 = getelementptr inbounds i32, i32* %t94, i32 %t26
  %t95 = load i32, i32* %t27, align 4
  %t28 = mul i32 %t25, %t95
  store i32 %t28, i32* %t83, align 4
  br label %B86
B93:                               	; preds = %B78
  br label %B85
B79:                               	; preds = %B82
  %t52 = load i32, i32* %t76, align 4
  ret i32 %t52
B86:                               	; preds = %B84, %B85
  %t36 = load i32, i32* %t83, align 4
  %t37 = load i32, i32* %t76, align 4
  %t38 = icmp sgt i32 %t36, %t37
  br i1 %t38, label %B98, label %B102
B85:                               	; preds = %B93
  %t30 = load i32, i32* %t75, align 4
  %t31 = load i32, i32* %t74, align 4
  %t32 = sub i32 %t30, %t31
  %t96 = load i32*, i32** %t72, align 4
  %t33 = load i32, i32* %t75, align 4
  %t34 = getelementptr inbounds i32, i32* %t96, i32 %t33
  %t97 = load i32, i32* %t34, align 4
  %t35 = mul i32 %t32, %t97
  store i32 %t35, i32* %t83, align 4
  br label %B86
B98:                               	; preds = %B86
  %t40 = load i32, i32* %t83, align 4
  store i32 %t40, i32* %t76, align 4
  br label %B99
B102:                               	; preds = %B86
  br label %B99
B99:                               	; preds = %B98, %B102
  %t106 = load i32*, i32** %t72, align 4
  %t41 = load i32, i32* %t74, align 4
  %t42 = getelementptr inbounds i32, i32* %t106, i32 %t41
  %t107 = load i32, i32* %t42, align 4
  %t108 = load i32*, i32** %t72, align 4
  %t43 = load i32, i32* %t75, align 4
  %t44 = getelementptr inbounds i32, i32* %t108, i32 %t43
  %t109 = load i32, i32* %t44, align 4
  %t45 = icmp sgt i32 %t107, %t109
  br i1 %t45, label %B103, label %B112
B103:                               	; preds = %B99
  %t47 = load i32, i32* %t75, align 4
  %t48 = sub i32 %t47, 1
  store i32 %t48, i32* %t75, align 4
  br label %B105
B112:                               	; preds = %B99
  br label %B104
B105:                               	; preds = %B103, %B104
  br label %B77
B104:                               	; preds = %B112
  %t50 = load i32, i32* %t74, align 4
  %t51 = add i32 %t50, 1
  store i32 %t51, i32* %t74, align 4
  br label %B105
}
define i32 @main() {
B114:
  %t116 = alloca [10 x i32], align 4
  %t115 = alloca i32, align 4
  %t55 = getelementptr inbounds [10 x i32], [10 x i32]* %t116, i32 0, i32 0
  store i32 3, i32* %t55, align 4
  %t56 = getelementptr inbounds [10 x i32], [10 x i32]* %t116, i32 0, i32 1
  store i32 3, i32* %t56, align 4
  %t57 = getelementptr inbounds [10 x i32], [10 x i32]* %t116, i32 0, i32 2
  store i32 9, i32* %t57, align 4
  %t58 = getelementptr inbounds [10 x i32], [10 x i32]* %t116, i32 0, i32 3
  store i32 0, i32* %t58, align 4
  %t59 = getelementptr inbounds [10 x i32], [10 x i32]* %t116, i32 0, i32 4
  store i32 0, i32* %t59, align 4
  %t60 = getelementptr inbounds [10 x i32], [10 x i32]* %t116, i32 0, i32 5
  store i32 1, i32* %t60, align 4
  %t61 = getelementptr inbounds [10 x i32], [10 x i32]* %t116, i32 0, i32 6
  store i32 1, i32* %t61, align 4
  %t62 = getelementptr inbounds [10 x i32], [10 x i32]* %t116, i32 0, i32 7
  store i32 5, i32* %t62, align 4
  %t63 = getelementptr inbounds [10 x i32], [10 x i32]* %t116, i32 0, i32 8
  store i32 7, i32* %t63, align 4
  %t64 = getelementptr inbounds [10 x i32], [10 x i32]* %t116, i32 0, i32 9
  store i32 8, i32* %t64, align 4
  store i32 10, i32* %t115, align 4
  %t67 = getelementptr inbounds [10 x i32], [10 x i32]* %t116, i32 0, i32 0
  %t68 = load i32, i32* %t115, align 4
  %t69 = call i32 @maxArea(i32* %t67, i32 %t68)
  store i32 %t69, i32* %t115, align 4
  %t70 = load i32, i32* %t115, align 4
  ret i32 %t70
}
