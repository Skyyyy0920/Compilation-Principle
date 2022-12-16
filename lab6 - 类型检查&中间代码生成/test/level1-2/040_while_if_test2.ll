declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @ifWhile() {
B24:
  %t26 = alloca i32, align 4
  %t25 = alloca i32, align 4
  store i32 0, i32* %t25, align 4
  store i32 3, i32* %t26, align 4
  %t4 = load i32, i32* %t25, align 4
  %t5 = icmp eq i32 %t4, 5
  br i1 %t5, label %B27, label %B32
B27:                               	; preds = %B24
  br label %B33
B32:                               	; preds = %B24
  br label %B28
B33:                               	; preds = %B27, %B34
  %t6 = load i32, i32* %t26, align 4
  %t7 = icmp eq i32 %t6, 2
  br i1 %t7, label %B34, label %B38
B28:                               	; preds = %B32
  br label %B39
B34:                               	; preds = %B33
  %t9 = load i32, i32* %t26, align 4
  %t10 = add i32 %t9, 2
  store i32 %t10, i32* %t26, align 4
  br label %B33
B38:                               	; preds = %B33
  br label %B35
B39:                               	; preds = %B28, %B40
  %t14 = load i32, i32* %t25, align 4
  %t15 = icmp slt i32 %t14, 5
  br i1 %t15, label %B40, label %B44
B35:                               	; preds = %B38
  %t12 = load i32, i32* %t26, align 4
  %t13 = add i32 %t12, 25
  store i32 %t13, i32* %t26, align 4
  br label %B29
B40:                               	; preds = %B39
  %t17 = load i32, i32* %t26, align 4
  %t18 = mul i32 %t17, 2
  store i32 %t18, i32* %t26, align 4
  %t20 = load i32, i32* %t25, align 4
  %t21 = add i32 %t20, 1
  store i32 %t21, i32* %t25, align 4
  br label %B39
B44:                               	; preds = %B39
  br label %B41
B29:                               	; preds = %B35, %B41
  %t22 = load i32, i32* %t26, align 4
  ret i32 %t22
B41:                               	; preds = %B44
  br label %B29
}
define i32 @main() {
B46:
  %t23 = call i32 @ifWhile()
  ret i32 %t23
}
