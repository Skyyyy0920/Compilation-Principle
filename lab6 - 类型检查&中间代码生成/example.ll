a = global i32 0, align 4
z = global i32 1, align 4
ss = global i32 6, align 4
define i32 main() {
B18:
  %t21 = alloca i32, align 4
  %t20 = alloca i32, align 4
  %t19 = alloca i32, align 4
  store i32 0, i32 %t19, align 4
  store i32 0, i32 %t20, align 4
  %t8 = add i32 1, 2
  %t9 = add i32 %t8, 3
  store i32 %t9, i32 %t21, align 4
  br label %B22
B22:                               	; preds = %B18, %B28, %B30
  %t11 = load i32, i32 %t20, align 4
  %t12 = icmp slt i32 %t11, 100
  br i1 %t12, label %B26, label %B25
B26:                               	; preds = %B22
  %t14 = load i32, i32 %t20, align 4
  %t15 = add i32 %t14, 1
  store i32 %t15, i32 %t20, align 4
  %t16 = load i32, i32 %t20, align 4
  %t17 = icmp slt i32 %t16, 50
  br i1 %t17, label %B28, label %B33
B25:                               	; preds = %B22
  br label %B27
B28:                               	; preds = %B26
  br label %B22
B33:                               	; preds = %B26
  br label %B29
B27:                               	; preds = %B25, %B29, %B30
  ret i32 1
B29:                               	; preds = %B33
  br label %B27
}
