define i32 @main() {
B4:
  %t5 = alloca i32, align 4
  store i32 10, i32* %t5, align 4
  %t2 = load i32, i32* %t5, align 4
  %t3 = sub i32 %t2, 2
  ret i32 %t3
}
