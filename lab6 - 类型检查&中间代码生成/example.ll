@a = global i32 0, align 4
@z = global i32 1, align 4
@ss = global i32 6, align 4
define i32 @main() {
B6:
  store i32 0, i32* @a, align 4
  ret i32 1
}
