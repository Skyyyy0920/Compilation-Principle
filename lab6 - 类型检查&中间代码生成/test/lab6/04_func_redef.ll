declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @func(i32 %t0) {
B31:
  %t32 = alloca i32, align 4
  store i32 %t0, i32* %t32, align 4
  %t2 = load i32, i32* %t32, align 4
  ret i32 %t2
}
define i32 @func(i32 %t3, i32 %t5, i32 %t7) {
B34:
  %t37 = alloca i32, align 4
  %t36 = alloca i32, align 4
  %t35 = alloca i32, align 4
  store i32 %t3, i32* %t35, align 4
  store i32 %t5, i32* %t36, align 4
  store i32 %t7, i32* %t37, align 4
  %t9 = load i32, i32* %t35, align 4
  %t10 = load i32, i32* %t36, align 4
  %t11 = add i32 %t9, %t10
  %t12 = load i32, i32* %t37, align 4
  %t13 = add i32 %t11, %t12
  ret i32 %t13
}
define i32 @error_func(i32 %t14) {
B39:
  %t40 = alloca i32, align 4
  store i32 %t14, i32* %t40, align 4
  %t16 = load i32, i32* %t40, align 4
  %t17 = add i32 %t16, 1
  ret i32 %t17
}
define i32 @error_func(i32 %t18) {
B42:
  %t43 = alloca i32, align 4
  store i32 %t18, i32* %t43, align 4
  %t20 = load i32, i32* %t43, align 4
  ret i32 %t20
}
define i32 @main() {
B45:
  %t46 = alloca i32, align 4
  store i32 0, i32* %t46, align 4
  %t23 = call i32 @func(i32 1)
  %t24 = call i32 @func(i32 1, i32 2, i32 3)
  %t25 = add i32 %t23, %t24
  store i32 %t25, i32* %t46, align 4
  %t27 = call i32 @error_func(i32 1)
  %t28 = call i32 @error_func(i32 1)
  %t29 = add i32 %t27, %t28
  store i32 %t29, i32* %t46, align 4
  %t30 = load i32, i32* %t46, align 4
  ret i32 %t30
}
