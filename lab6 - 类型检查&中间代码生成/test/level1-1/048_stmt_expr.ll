declare void @putint(i32)
@k = global i32 0, align 4
@n = global i32 10, align 4
define i32 @main() {
B19:
  %t20 = alloca i32, align 4
  store i32 0, i32* %t20, align 4
  store i32 1, i32* @k, align 4
  br label %B21
B21:                               	; preds = %B19, %B22
  %t4 = load i32, i32* %t20, align 4
  %t5 = load i32, i32* @n, align 4
  %t6 = sub i32 %t5, 1
  %t7 = icmp sle i32 %t4, %t6
  br i1 %t7, label %B22, label %B26
B22:                               	; preds = %B21
  %t9 = load i32, i32* %t20, align 4
  %t10 = add i32 %t9, 1
  store i32 %t10, i32* %t20, align 4
  %t11 = load i32, i32* @k, align 4
  %t12 = add i32 %t11, 1
  %t14 = load i32, i32* @k, align 4
  %t15 = load i32, i32* @k, align 4
  %t16 = add i32 %t14, %t15
  store i32 %t16, i32* @k, align 4
  br label %B21
B26:                               	; preds = %B21
  br label %B23
B23:                               	; preds = %B26
  %t17 = load i32, i32* @k, align 4
  call void @putint(i32 %t17)
  %t18 = load i32, i32* @k, align 4
  ret i32 %t18
}
