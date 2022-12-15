@a = global i32 10, align 4
define i32 @main() {
B6:
  %t7 = alloca i32, align 4
  store i32 2, i32* %t7, align 4
  %t3 = load i32, i32* %t7, align 4
  %t4 = load i32, i32* @a, align 4
  %t5 = sub i32 %t3, %t4
  ret i32 %t5
}
