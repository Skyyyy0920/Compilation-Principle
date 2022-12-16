declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @main() {
B25:
  %t34 = alloca i32, align 4
  %t27 = alloca i32, align 4
  %t26 = alloca i32, align 4
  store i32 0, i32* %t26, align 4
  store i32 0, i32* %t27, align 4
  br label %B28
B28:                               	; preds = %B25, %B37
  %t2 = load i32, i32* %t27, align 4
  %t3 = icmp slt i32 %t2, 10
  br i1 %t3, label %B29, label %B33
B29:                               	; preds = %B28
  store i32 10, i32* %t34, align 4
  br label %B35
B33:                               	; preds = %B28
  br label %B30
B35:                               	; preds = %B29, %B42
  %t5 = load i32, i32* %t34, align 4
  %t6 = icmp ne i32 %t5, 0
  br i1 %t6, label %B36, label %B39
B30:                               	; preds = %B33
  ret i32 0
B36:                               	; preds = %B35
  %t7 = load i32, i32* %t27, align 4
  %t10 = icmp ne i32 %t7, 0
  br i1 %t10, label %B43, label %B45
B39:                               	; preds = %B35
  br label %B37
B43:                               	; preds = %B36
  %t8 = load i32, i32* %t34, align 4
  %t11 = icmp ne i32 %t8, 0
  br i1 %t11, label %B41, label %B48
B45:                               	; preds = %B36
  br label %B42
B37:                               	; preds = %B39
  %t22 = load i32, i32* %t27, align 4
  %t23 = load i32, i32* %t27, align 4
  %t24 = add i32 %t22, %t23
  store i32 %t24, i32* %t27, align 4
  br label %B28
B41:                               	; preds = %B43
  %t13 = load i32, i32* %t26, align 4
  %t14 = load i32, i32* %t27, align 4
  %t15 = add i32 %t13, %t14
  %t16 = load i32, i32* %t34, align 4
  %t17 = add i32 %t15, %t16
  store i32 %t17, i32* %t26, align 4
  br label %B42
B48:                               	; preds = %B43
  br label %B42
B42:                               	; preds = %B41, %B45, %B48
  %t19 = load i32, i32* %t34, align 4
  %t20 = sub i32 %t19, 1
  store i32 %t20, i32* %t34, align 4
  br label %B35
}
