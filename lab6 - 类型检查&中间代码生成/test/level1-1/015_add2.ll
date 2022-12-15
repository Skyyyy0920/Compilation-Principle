define i32 @main() {
B8:
  %t10 = alloca i32, align 4
  %t9 = alloca i32, align 4
  store i32 10, i32* %t9, align 4
  %t4 = sub i32 0, 1
  store i32 %t4, i32* %t10, align 4
  %t5 = load i32, i32* %t9, align 4
  %t6 = load i32, i32* %t10, align 4
  %t7 = add i32 %t5, %t6
  ret i32 %t7
}
