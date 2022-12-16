declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @deepWhileBr(i32 %t0, i32 %t2) {
B35:
  %t56 = alloca i32, align 4
  %t45 = alloca i32, align 4
  %t38 = alloca i32, align 4
  %t37 = alloca i32, align 4
  %t36 = alloca i32, align 4
  store i32 %t0, i32* %t36, align 4
  store i32 %t2, i32* %t37, align 4
  %t6 = load i32, i32* %t36, align 4
  %t7 = load i32, i32* %t37, align 4
  %t8 = add i32 %t6, %t7
  store i32 %t8, i32* %t38, align 4
  br label %B39
B39:                               	; preds = %B35, %B47
  %t9 = load i32, i32* %t38, align 4
  %t10 = icmp slt i32 %t9, 75
  br i1 %t10, label %B40, label %B44
B40:                               	; preds = %B39
  store i32 42, i32* %t45, align 4
  %t13 = load i32, i32* %t38, align 4
  %t14 = icmp slt i32 %t13, 100
  br i1 %t14, label %B46, label %B50
B44:                               	; preds = %B39
  br label %B41
B46:                               	; preds = %B40
  %t16 = load i32, i32* %t38, align 4
  %t17 = load i32, i32* %t45, align 4
  %t18 = add i32 %t16, %t17
  store i32 %t18, i32* %t38, align 4
  %t19 = load i32, i32* %t38, align 4
  %t20 = icmp sgt i32 %t19, 99
  br i1 %t20, label %B51, label %B55
B50:                               	; preds = %B40
  br label %B47
B41:                               	; preds = %B44
  %t29 = load i32, i32* %t38, align 4
  ret i32 %t29
B51:                               	; preds = %B46
  %t23 = load i32, i32* %t45, align 4
  %t24 = mul i32 %t23, 2
  store i32 %t24, i32* %t56, align 4
  %t25 = icmp eq i32 1, 1
  br i1 %t25, label %B57, label %B61
B55:                               	; preds = %B46
  br label %B52
B47:                               	; preds = %B50, %B52
  br label %B39
B57:                               	; preds = %B51
  %t27 = load i32, i32* %t56, align 4
  %t28 = mul i32 %t27, 2
  store i32 %t28, i32* %t38, align 4
  br label %B58
B61:                               	; preds = %B51
  br label %B58
B52:                               	; preds = %B55, %B58
  br label %B47
B58:                               	; preds = %B57, %B61
  br label %B52
}
define i32 @main() {
B63:
  %t64 = alloca i32, align 4
  store i32 2, i32* %t64, align 4
  %t32 = load i32, i32* %t64, align 4
  %t33 = load i32, i32* %t64, align 4
  %t34 = call i32 @deepWhileBr(i32 %t32, i32 %t33)
  ret i32 %t34
}
