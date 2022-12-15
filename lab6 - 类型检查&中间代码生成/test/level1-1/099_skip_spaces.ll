declare i32 @getint()
define i32 @main() {
B23:
  %t26 = alloca i32, align 4
  %t25 = alloca i32, align 4
  %t24 = alloca [100 x i32], align 4
  store i32 0, i32* %t25, align 4
  store i32 0, i32* %t26, align 4
  br label %B27
B27:                               	; preds = %B23, %B28
%t3 =   call i32 @getint()
  %t4 = icmp ne i32 %t3, 0
  br i1 %t4, label %B28, label %B31
B28:                               	; preds = %B27
%t7 =   call i32 @getint()
  %t5 = load i32, i32* %t25, align 4
  %t6 = getelementptr inbounds [100 x i32], [100 x i32]* %t24, i32 0, i32 %t5
  store i32 %t7, i32* %t6, align 4
  %t9 = load i32, i32* %t25, align 4
  %t10 = add i32 %t9, 1
  store i32 %t10, i32* %t25, align 4
  br label %B27
B31:                               	; preds = %B27
  br label %B29
B29:                               	; preds = %B31
  br label %B33
B33:                               	; preds = %B29, %B34
  %t11 = load i32, i32* %t25, align 4
  %t12 = icmp ne i32 %t11, 0
  br i1 %t12, label %B34, label %B37
B34:                               	; preds = %B33
  %t14 = load i32, i32* %t25, align 4
  %t15 = sub i32 %t14, 1
  store i32 %t15, i32* %t25, align 4
  %t17 = load i32, i32* %t26, align 4
  %t18 = load i32, i32* %t25, align 4
  %t19 = getelementptr inbounds [100 x i32], [100 x i32]* %t24, i32 0, i32 %t18
  %t39 = load i32, i32* %t19, align 4
  %t20 = add i32 %t17, %t39
  store i32 %t20, i32* %t26, align 4
  br label %B33
B37:                               	; preds = %B33
  br label %B35
B35:                               	; preds = %B37
  %t21 = load i32, i32* %t26, align 4
  %t22 = srem i32 %t21, 79
  ret i32 %t22
}
