@a = global i32 3, align 4
@b = global i32 5, align 4
define i32 @main() {
B5:
  %t2 = load i32, i32* @a, align 4
  %t3 = load i32, i32* @b, align 4
  %t4 = add i32 %t2, %t3
  ret i32 %t4
}
