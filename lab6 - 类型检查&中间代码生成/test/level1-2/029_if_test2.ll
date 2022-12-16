declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @ifElseIf() {
B30:
  %t32 = alloca i32, align 4
  %t31 = alloca i32, align 4
  store i32 5, i32* %t31, align 4
  store i32 10, i32* %t32, align 4
  %t4 = load i32, i32* %t31, align 4
  %t5 = icmp eq i32 %t4, 6
  br i1 %t5, label %B33, label %B39
B33:                               	; preds = %B30, %B36
  %t9 = load i32, i32* %t31, align 4
  ret i32 %t9
  br label %B35
B39:                               	; preds = %B30
  br label %B36
B35:                               	; preds = %B33, %B45
  %t28 = load i32, i32* %t31, align 4
  ret i32 %t28
B36:                               	; preds = %B39
  %t6 = load i32, i32* %t32, align 4
  %t7 = icmp eq i32 %t6, 11
  br i1 %t7, label %B33, label %B42
B42:                               	; preds = %B36
  br label %B34
B34:                               	; preds = %B42
  %t10 = load i32, i32* %t32, align 4
  %t11 = icmp eq i32 %t10, 10
  br i1 %t11, label %B46, label %B49
B46:                               	; preds = %B34
  %t12 = load i32, i32* %t31, align 4
  %t13 = icmp eq i32 %t12, 1
  br i1 %t13, label %B43, label %B52
B49:                               	; preds = %B34
  br label %B44
B43:                               	; preds = %B46
  store i32 25, i32* %t31, align 4
  br label %B45
B52:                               	; preds = %B46
  br label %B44
B44:                               	; preds = %B49, %B52
  %t16 = load i32, i32* %t32, align 4
  %t17 = icmp eq i32 %t16, 10
  br i1 %t17, label %B56, label %B59
B45:                               	; preds = %B43, %B55
  br label %B35
B56:                               	; preds = %B44
  %t18 = load i32, i32* %t31, align 4
  %t19 = sub i32 0, 5
  %t20 = icmp eq i32 %t18, %t19
  br i1 %t20, label %B53, label %B62
B59:                               	; preds = %B44
  br label %B54
B53:                               	; preds = %B56
  %t23 = load i32, i32* %t31, align 4
  %t24 = add i32 %t23, 15
  store i32 %t24, i32* %t31, align 4
  br label %B55
B62:                               	; preds = %B56
  br label %B54
B54:                               	; preds = %B59, %B62
  %t26 = load i32, i32* %t31, align 4
  %t27 = sub i32 0, %t26
  store i32 %t27, i32* %t31, align 4
  br label %B55
B55:                               	; preds = %B53, %B54
  br label %B45
}
define i32 @main() {
B64:
  %t29 = call i32 @ifElseIf()
call void @putint(i32 %t29)
  ret i32 0
}
