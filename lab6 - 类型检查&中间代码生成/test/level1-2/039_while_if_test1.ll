declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @whileIf() {
B20:
  %t22 = alloca i32, align 4
  %t21 = alloca i32, align 4
  store i32 0, i32* %t21, align 4
  store i32 0, i32* %t22, align 4
  br label %B23
B23:                               	; preds = %B20, %B31
  %t4 = load i32, i32* %t21, align 4
  %t5 = icmp slt i32 %t4, 100
  br i1 %t5, label %B24, label %B28
B24:                               	; preds = %B23
  %t6 = load i32, i32* %t21, align 4
  %t7 = icmp eq i32 %t6, 5
  br i1 %t7, label %B29, label %B34
B28:                               	; preds = %B23
  br label %B25
B29:                               	; preds = %B24
  store i32 25, i32* %t22, align 4
  br label %B31
B34:                               	; preds = %B24
  br label %B30
B25:                               	; preds = %B28
  %t18 = load i32, i32* %t22, align 4
  ret i32 %t18
B31:                               	; preds = %B29, %B37
  %t16 = load i32, i32* %t21, align 4
  %t17 = add i32 %t16, 1
  store i32 %t17, i32* %t21, align 4
  br label %B23
B30:                               	; preds = %B34
  %t9 = load i32, i32* %t21, align 4
  %t10 = icmp eq i32 %t9, 10
  br i1 %t10, label %B35, label %B40
B35:                               	; preds = %B30
  store i32 42, i32* %t22, align 4
  br label %B37
B40:                               	; preds = %B30
  br label %B36
B37:                               	; preds = %B35, %B36
  br label %B31
B36:                               	; preds = %B40
  %t13 = load i32, i32* %t21, align 4
  %t14 = mul i32 %t13, 2
  store i32 %t14, i32* %t22, align 4
  br label %B37
}
define i32 @main() {
B42:
  %t19 = call i32 @whileIf()
  ret i32 %t19
}
