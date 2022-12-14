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
  ret i32 %t14
}
