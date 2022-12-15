define i32 @main() {
B8:
  %t10 = alloca i32, align 4
  %t9 = alloca i32, align 4
  store i32 15, i32* %t9, align 4
  store i32 12, i32* %t10, align 4
  %t4 = load i32, i32* %t9, align 4
  %t5 = load i32, i32* %t10, align 4
  %t6 = add i32 %t4, %t5
  %t7 = add i32 %t6, 61
  ret i32 %t7
}
