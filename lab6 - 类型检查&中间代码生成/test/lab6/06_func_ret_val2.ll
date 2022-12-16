declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @func(i32 %t0, i32 %t2) {
B9:
  %t12 = alloca i32, align 4
  %t11 = alloca i32, align 4
  %t10 = alloca i32, align 4
  store i32 %t0, i32* %t10, align 4
  store i32 %t2, i32* %t11, align 4
  %t4 = load i32, i32* %t10, align 4
  %t5 = load i32, i32* %t11, align 4
  %t6 = add i32 %t4, %t5
  store i32 %t6, i32* %t12, align 4
}
define i32 @main() {
B14:
  %t8 = call i32 @func(i32 1, i32 2)
  ret i32 0
}
