declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @main() {
B6:
  %t9 = alloca i32, align 4
  %t8 = alloca i32, align 4
  %t7 = alloca i32, align 4
  store i32 1, i32* %t7, align 4
  store i32 0, i32* %t8, align 4
  store i32 1, i32* %t9, align 4
  %t3 = load i32, i32* %t7, align 4
  %t4 = load i32, i32* %t8, align 4
  %t5 = add i32 %t3, %t4
  ret i32 %t5
}
