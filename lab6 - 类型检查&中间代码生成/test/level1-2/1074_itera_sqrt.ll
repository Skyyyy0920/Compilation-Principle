declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @fsqrt(i32 %t0) {
B32:
  %t35 = alloca i32, align 4
  %t34 = alloca i32, align 4
  %t33 = alloca i32, align 4
  store i32 %t0, i32* %t33, align 4
  store i32 0, i32* %t34, align 4
  %t5 = load i32, i32* %t33, align 4
  %t6 = sdiv i32 %t5, 2
  store i32 %t6, i32* %t35, align 4
  br label %B36
B36:                               	; preds = %B32, %B37
  %t7 = load i32, i32* %t34, align 4
  %t8 = load i32, i32* %t35, align 4
  %t9 = sub i32 %t7, %t8
  %t10 = icmp ne i32 %t9, 0
  br i1 %t10, label %B37, label %B41
B37:                               	; preds = %B36
  %t12 = load i32, i32* %t35, align 4
  store i32 %t12, i32* %t34, align 4
  %t14 = load i32, i32* %t34, align 4
  %t15 = load i32, i32* %t33, align 4
  %t16 = load i32, i32* %t34, align 4
  %t17 = sdiv i32 %t15, %t16
  %t18 = add i32 %t14, %t17
  store i32 %t18, i32* %t35, align 4
  %t20 = load i32, i32* %t35, align 4
  %t21 = sdiv i32 %t20, 2
  store i32 %t21, i32* %t35, align 4
  br label %B36
B41:                               	; preds = %B36
  br label %B38
B38:                               	; preds = %B41
  %t22 = load i32, i32* %t35, align 4
  ret i32 %t22
}
define i32 @main() {
B43:
  %t45 = alloca i32, align 4
  %t44 = alloca i32, align 4
  store i32 400, i32* %t44, align 4
  %t27 = load i32, i32* %t44, align 4
  %t28 = call i32 @fsqrt(i32 %t27)
  store i32 %t28, i32* %t45, align 4
  %t29 = load i32, i32* %t45, align 4
call void @putint(i32 %t29)
  store i32 10, i32* %t45, align 4
  %t31 = load i32, i32* %t45, align 4
call void @putch(i32 %t31)
  ret i32 0
}
