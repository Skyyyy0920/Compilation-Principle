declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @main() {
B7:
  %t9 = alloca i32, align 4
  %t8 = alloca i32, align 4
  store i32 10, i32* %t8, align 4
  store i32 2, i32* %t9, align 4
  %t4 = load i32, i32* %t8, align 4
  %t5 = load i32, i32* %t9, align 4
  %t6 = sub i32 %t4, %t5
  ret i32 %t6
}
