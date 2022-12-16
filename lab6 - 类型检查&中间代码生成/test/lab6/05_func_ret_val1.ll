declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define void @func(i32 %t0) {
B6:
  %t7 = alloca i32, align 4
  store i32 %t0, i32* %t7, align 4
  %t3 = load i32, i32* %t7, align 4
  %t4 = add i32 %t3, 1
  store i32 %t4, i32* %t7, align 4
  %t5 = load i32, i32* %t7, align 4
  ret i32 %t5
}
define i32 @main() {
B9:
call void @func(i32 1)
  ret i32 0
}
