declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @dec2bin(i32 %t0) {
B37:
  %t42 = alloca i32, align 4
  %t41 = alloca i32, align 4
  %t40 = alloca i32, align 4
  %t39 = alloca i32, align 4
  %t38 = alloca i32, align 4
  store i32 %t0, i32* %t38, align 4
  store i32 0, i32* %t39, align 4
  store i32 1, i32* %t40, align 4
  %t9 = load i32, i32* %t38, align 4
  store i32 %t9, i32* %t42, align 4
  br label %B43
B43:                               	; preds = %B37, %B44
  %t10 = load i32, i32* %t42, align 4
  %t11 = icmp ne i32 %t10, 0
  br i1 %t11, label %B44, label %B48
B44:                               	; preds = %B43
  %t13 = load i32, i32* %t42, align 4
  %t14 = srem i32 %t13, 2
  store i32 %t14, i32* %t41, align 4
  %t16 = load i32, i32* %t40, align 4
  %t17 = load i32, i32* %t41, align 4
  %t18 = mul i32 %t16, %t17
  %t19 = load i32, i32* %t39, align 4
  %t20 = add i32 %t18, %t19
  store i32 %t20, i32* %t39, align 4
  %t22 = load i32, i32* %t40, align 4
  %t23 = mul i32 %t22, 10
  store i32 %t23, i32* %t40, align 4
  %t25 = load i32, i32* %t42, align 4
  %t26 = sdiv i32 %t25, 2
  store i32 %t26, i32* %t42, align 4
  br label %B43
B48:                               	; preds = %B43
  br label %B45
B45:                               	; preds = %B48
  %t27 = load i32, i32* %t39, align 4
  ret i32 %t27
}
define i32 @main() {
B50:
  %t52 = alloca i32, align 4
  %t51 = alloca i32, align 4
  store i32 400, i32* %t51, align 4
  %t32 = load i32, i32* %t51, align 4
  %t33 = call i32 @dec2bin(i32 %t32)
  store i32 %t33, i32* %t52, align 4
  %t34 = load i32, i32* %t52, align 4
call void @putint(i32 %t34)
  store i32 10, i32* %t52, align 4
  %t36 = load i32, i32* %t52, align 4
call void @putch(i32 %t36)
  ret i32 0
}
