declare void @putint(i32)
define i32 @main() {
B42:
  %t47 = alloca i32, align 4
  %t46 = alloca i32, align 4
  %t45 = alloca i32, align 4
  %t44 = alloca i32, align 4
  %t43 = alloca i32, align 4
  store i32 5, i32* %t43, align 4
  store i32 5, i32* %t44, align 4
  store i32 1, i32* %t45, align 4
  %t9 = sub i32 0, 2
  store i32 %t9, i32* %t46, align 4
  %t11 = load i32, i32* %t46, align 4
  %t12 = mul i32 %t11, 1
  %t13 = sdiv i32 %t12, 2
  %t14 = load i32, i32* %t43, align 4
  %t15 = load i32, i32* %t44, align 4
  %t16 = sub i32 %t14, %t15
  %t17 = add i32 %t13, %t16
  %t18 = load i32, i32* %t45, align 4
  %t19 = add i32 %t18, 3
  %t20 = sub i32 0, %t19
  %t21 = srem i32 %t20, 2
  %t22 = sub i32 %t17, %t21
  store i32 %t22, i32* %t47, align 4
  %t23 = load i32, i32* %t47, align 4
  call void @putint(i32 %t23)
  %t25 = load i32, i32* %t46, align 4
  %t26 = srem i32 %t25, 2
  %t27 = add i32 %t26, 67
  %t28 = load i32, i32* %t43, align 4
  %t29 = load i32, i32* %t44, align 4
  %t30 = sub i32 %t28, %t29
  %t31 = sub i32 0, %t30
  %t32 = add i32 %t27, %t31
  %t33 = load i32, i32* %t45, align 4
  %t34 = add i32 %t33, 2
  %t35 = srem i32 %t34, 2
  %t36 = sub i32 0, %t35
  %t37 = sub i32 %t32, %t36
  store i32 %t37, i32* %t47, align 4
  %t39 = load i32, i32* %t47, align 4
  %t40 = add i32 %t39, 3
  store i32 %t40, i32* %t47, align 4
  %t41 = load i32, i32* %t47, align 4
  call void @putint(i32 %t41)
  ret i32 0
}
