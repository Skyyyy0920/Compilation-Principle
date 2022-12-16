declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @if_if_Else() {
B14:
  %t16 = alloca i32, align 4
  %t15 = alloca i32, align 4
  store i32 5, i32* %t15, align 4
  store i32 10, i32* %t16, align 4
  %t4 = load i32, i32* %t15, align 4
  %t5 = icmp eq i32 %t4, 5
  br i1 %t5, label %B17, label %B22
B17:                               	; preds = %B14
  %t6 = load i32, i32* %t16, align 4
  %t7 = icmp eq i32 %t6, 10
  br i1 %t7, label %B23, label %B27
B22:                               	; preds = %B14
  br label %B18
B23:                               	; preds = %B17
  store i32 25, i32* %t15, align 4
  br label %B24
B27:                               	; preds = %B17
  br label %B24
B18:                               	; preds = %B22
  %t10 = load i32, i32* %t15, align 4
  %t11 = add i32 %t10, 15
  store i32 %t11, i32* %t15, align 4
  br label %B19
B24:                               	; preds = %B23, %B27
  br label %B19
B19:                               	; preds = %B18, %B24
  %t12 = load i32, i32* %t15, align 4
  ret i32 %t12
}
define i32 @main() {
B29:
  %t13 = call i32 @if_if_Else()
  ret i32 %t13
}
