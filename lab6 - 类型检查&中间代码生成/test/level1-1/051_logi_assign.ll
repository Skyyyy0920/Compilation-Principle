declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@a = global i32 0, align 4
@b = global i32 0, align 4
define i32 @main() {
B16:
  %t17 = alloca i32, align 4
  %t3 = call i32 @getint()
  store i32 %t3, i32* @a, align 4
  %t5 = call i32 @getint()
  store i32 %t5, i32* @b, align 4
  %t7 = load i32, i32* @a, align 4
  %t8 = load i32, i32* @b, align 4
  %t9 = icmp eq i32 %t7, %t8
  br i1 %t9, label %B21, label %B24
B21:                               	; preds = %B16
  %t10 = load i32, i32* @a, align 4
  %t11 = icmp ne i32 %t10, 3
  br i1 %t11, label %B18, label %B27
B24:                               	; preds = %B16
  br label %B19
B18:                               	; preds = %B21
  store i32 1, i32* %t17, align 4
  br label %B20
B27:                               	; preds = %B21
  br label %B19
B19:                               	; preds = %B24, %B27
  store i32 0, i32* %t17, align 4
  br label %B20
B20:                               	; preds = %B18, %B19
  %t15 = load i32, i32* %t17, align 4
  ret i32 %t15
}
