define i32 @main() {
B9:
  %t12 = alloca i32, align 4
  %t11 = alloca i32, align 4
  %t10 = alloca i32, align 4
  store i32 1, i32* %t10, align 4
  store i32 2, i32* %t11, align 4
  store i32 3, i32* %t12, align 4
  %t6 = load i32, i32* %t11, align 4
  %t7 = load i32, i32* %t12, align 4
  %t8 = add i32 %t6, %t7
  ret i32 %t8
}
