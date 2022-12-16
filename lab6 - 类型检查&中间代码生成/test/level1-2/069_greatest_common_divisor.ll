declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @fun(i32 %t0, i32 %t2) {
B28:
  %t31 = alloca i32, align 4
  %t30 = alloca i32, align 4
  %t29 = alloca i32, align 4
  store i32 %t0, i32* %t29, align 4
  store i32 %t2, i32* %t30, align 4
  br label %B32
B32:                               	; preds = %B28, %B33
  %t5 = load i32, i32* %t30, align 4
  %t6 = icmp sgt i32 %t5, 0
  br i1 %t6, label %B33, label %B37
B33:                               	; preds = %B32
  %t8 = load i32, i32* %t29, align 4
  %t9 = load i32, i32* %t30, align 4
  %t10 = srem i32 %t8, %t9
  store i32 %t10, i32* %t31, align 4
  %t12 = load i32, i32* %t30, align 4
  store i32 %t12, i32* %t29, align 4
  %t14 = load i32, i32* %t31, align 4
  store i32 %t14, i32* %t30, align 4
  br label %B32
B37:                               	; preds = %B32
  br label %B34
B34:                               	; preds = %B37
  %t15 = load i32, i32* %t29, align 4
  ret i32 %t15
}
define i32 @main() {
B39:
  %t42 = alloca i32, align 4
  %t41 = alloca i32, align 4
  %t40 = alloca i32, align 4
  %t20 = call i32 @getint()
  store i32 %t20, i32* %t41, align 4
  %t22 = call i32 @getint()
  store i32 %t22, i32* %t40, align 4
  %t24 = load i32, i32* %t41, align 4
  %t25 = load i32, i32* %t40, align 4
  %t26 = call i32 @fun(i32 %t24, i32 %t25)
  store i32 %t26, i32* %t42, align 4
  %t27 = load i32, i32* %t42, align 4
call void @putint(i32 %t27)
  ret i32 0
}
