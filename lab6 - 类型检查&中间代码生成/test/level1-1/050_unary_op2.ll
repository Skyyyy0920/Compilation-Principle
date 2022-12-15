declare void @putint(i32)
define i32 @main() {
B24:
  %t26 = alloca i32, align 4
  %t25 = alloca i32, align 4
  store i32 56, i32* %t25, align 4
  store i32 4, i32* %t26, align 4
  %t5 = load i32, i32* %t25, align 4
  %t6 = sub i32 0, 4
  %t7 = sub i32 %t5, %t6
  %t8 = load i32, i32* %t26, align 4
  %t9 = add i32 %t7, %t8
  store i32 %t9, i32* %t25, align 4
  %t10 = load i32, i32* %t25, align 4
  %t30 = icmp ne i32 %t10, 0
  %t11 = xor i1 %t30, true
  %t12 = xor i1 %t11, true
  %t13 = xor i1 %t12, true
  %t31 = zext i1 %t13 to i32
  %t14 = sub i32 0, %t31
  %t22 = icmp ne i32 %t14, 0
  br i1 %t22, label %B27, label %B33
B27:                               	; preds = %B24
  %t16 = sub i32 0, 1
  %t17 = sub i32 0, %t16
  %t18 = sub i32 0, %t17
  store i32 %t18, i32* %t25, align 4
  br label %B29
B33:                               	; preds = %B24
  br label %B28
B29:                               	; preds = %B27, %B28
  %t23 = load i32, i32* %t25, align 4
  call void @putint(i32 %t23)
  ret i32 0
B28:                               	; preds = %B33
  %t20 = load i32, i32* %t26, align 4
  %t21 = add i32 0, %t20
  store i32 %t21, i32* %t25, align 4
  br label %B29
}
