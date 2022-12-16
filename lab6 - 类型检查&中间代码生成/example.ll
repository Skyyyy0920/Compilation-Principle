declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @f() {
B8:
  ret i32 1
}
define i32 @f(i32 %t0) {
B10:
  %t11 = alloca i32, align 4
  store i32 %t0, i32* %t11, align 4
  ret i32 1
}
define i32 @f(i32 %t2) {
B13:
  %t14 = alloca i32, align 4
  store i32 %t2, i32* %t14, align 4
  ret i32 1
}
define i32 @f(i32 %t4, i32 %t6) {
B16:
  %t18 = alloca i32, align 4
  %t17 = alloca i32, align 4
  store i32 %t4, i32* %t17, align 4
  store i32 %t6, i32* %t18, align 4
  ret i32 1
}
define i32 @main() {
B20:
  ret i32 0
}
