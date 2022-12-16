declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@a = global i32 10, align 4
define i32 @main() {
B2:
  %t1 = load i32, i32* @a, align 4
  ret i32 %t1
}
