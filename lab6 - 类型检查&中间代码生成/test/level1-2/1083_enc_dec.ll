declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @enc(i32 %t0) {
B34:
  %t35 = alloca i32, align 4
  store i32 %t0, i32* %t35, align 4
  %t2 = load i32, i32* %t35, align 4
  %t3 = icmp sgt i32 %t2, 25
  br i1 %t3, label %B36, label %B41
B36:                               	; preds = %B34
  %t5 = load i32, i32* %t35, align 4
  %t6 = add i32 %t5, 60
  store i32 %t6, i32* %t35, align 4
  br label %B38
B41:                               	; preds = %B34
  br label %B37
B38:                               	; preds = %B36, %B37
  %t10 = load i32, i32* %t35, align 4
  ret i32 %t10
B37:                               	; preds = %B41
  %t8 = load i32, i32* %t35, align 4
  %t9 = sub i32 %t8, 15
  store i32 %t9, i32* %t35, align 4
  br label %B38
}
define i32 @dec(i32 %t11) {
B43:
  %t44 = alloca i32, align 4
  store i32 %t11, i32* %t44, align 4
  %t13 = load i32, i32* %t44, align 4
  %t14 = icmp sgt i32 %t13, 85
  br i1 %t14, label %B45, label %B50
B45:                               	; preds = %B43
  %t16 = load i32, i32* %t44, align 4
  %t17 = sub i32 %t16, 59
  store i32 %t17, i32* %t44, align 4
  br label %B47
B50:                               	; preds = %B43
  br label %B46
B47:                               	; preds = %B45, %B46
  %t21 = load i32, i32* %t44, align 4
  ret i32 %t21
B46:                               	; preds = %B50
  %t19 = load i32, i32* %t44, align 4
  %t20 = add i32 %t19, 14
  store i32 %t20, i32* %t44, align 4
  br label %B47
}
define i32 @main() {
B52:
  %t54 = alloca i32, align 4
  %t53 = alloca i32, align 4
  store i32 400, i32* %t53, align 4
  %t26 = load i32, i32* %t53, align 4
  %t27 = call i32 @enc(i32 %t26)
  store i32 %t27, i32* %t54, align 4
  %t29 = load i32, i32* %t54, align 4
  %t30 = call i32 @dec(i32 %t29)
  store i32 %t30, i32* %t54, align 4
  %t31 = load i32, i32* %t54, align 4
call void @putint(i32 %t31)
  store i32 10, i32* %t54, align 4
  %t33 = load i32, i32* %t54, align 4
call void @putch(i32 %t33)
  ret i32 0
}
