declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @main() {
B3:
  %t4 = alloca i32, align 4
  store i32 15, i32* %t4, align 4
  %t2 = load i32, i32* %t4, align 4
  ret i32 %t2
}
