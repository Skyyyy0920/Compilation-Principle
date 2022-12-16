declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@a = global i32 10, align 4
@b = global i32 5, align 4
define i32 @main() {
B3:
  %t2 = load i32, i32* @b, align 4
  ret i32 %t2
}
