declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @func(i32 %t0, i32 %t2, i32 %t4) {
B12:
  %t15 = alloca i32, align 4
  %t14 = alloca i32, align 4
  %t13 = alloca i32, align 4
  store i32 %t0, i32* %t13, align 4
  store i32 %t2, i32* %t14, align 4
  store i32 %t4, i32* %t15, align 4
  %t6 = load i32, i32* %t13, align 4
  %t7 = load i32, i32* %t14, align 4
  %t8 = add i32 %t6, %t7
  %t9 = load i32, i32* %t15, align 4
  %t10 = add i32 %t8, %t9
  ret i32 %t10
}
define i32 @main() {
B17:
  %t11 = call i32 @func(i32 1)
  ret i32 %t11
}
