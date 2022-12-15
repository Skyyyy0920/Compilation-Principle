declare void @putint(i32)
define i32 @main() {
B14:
  %t16 = alloca i32, align 4
  %t15 = alloca i32, align 4
  store i32 0, i32* %t16, align 4
  store i32 0, i32* %t15, align 4
  br label %B17
B17:                               	; preds = %B14, %B18
  %t4 = load i32, i32* %t15, align 4
  %t5 = icmp slt i32 %t4, 21
  br i1 %t5, label %B18, label %B22
B18:                               	; preds = %B17
  %t7 = load i32, i32* %t16, align 4
  %t8 = load i32, i32* %t15, align 4
  %t9 = add i32 %t7, %t8
  store i32 %t9, i32* %t16, align 4
  %t11 = load i32, i32* %t15, align 4
  %t12 = add i32 %t11, 1
  store i32 %t12, i32* %t15, align 4
  br label %B17
B22:                               	; preds = %B17
  br label %B19
B19:                               	; preds = %B22
  %t13 = load i32, i32* %t16, align 4
  call void @putint(i32 %t13)
  ret i32 0
}
