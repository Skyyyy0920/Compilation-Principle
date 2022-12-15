define i32 @main() {
B4:
  %t5 = alloca i32, align 4
  store i32 10, i32* %t5, align 4
  %t1 = load i32, i32* %t5, align 4
  %t2 = mul i32 %t1, 2
  %t3 = add i32 %t2, 1
  ret i32 %t3
}
