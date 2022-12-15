define i32 @main() {
B15:
  %t19 = alloca i32, align 4
  %t18 = alloca i32, align 4
  %t17 = alloca i32, align 4
  %t16 = alloca i32, align 4
  store i32 10, i32* %t16, align 4
  store i32 4, i32* %t17, align 4
  store i32 2, i32* %t18, align 4
  store i32 2, i32* %t19, align 4
  %t8 = load i32, i32* %t18, align 4
  %t9 = load i32, i32* %t16, align 4
  %t10 = load i32, i32* %t17, align 4
  %t11 = mul i32 %t9, %t10
  %t12 = add i32 %t8, %t11
  %t13 = load i32, i32* %t19, align 4
  %t14 = sub i32 %t12, %t13
  ret i32 %t14
}
