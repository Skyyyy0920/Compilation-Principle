@a = global i32 10, align 4
define i32 @main() {
B3:
  %t1 = load i32, i32* @a, align 4
  %t2 = sdiv i32 %t1, 5
  ret i32 %t2
}
