@a = global i32 0, align 4
@z = global i32 1, align 4
@ss = global i32 6, align 4
define i32 @f(i32 %t5, i32 %t7) {
B28:
  %t30 = alloca i32, align 4
  %t29 = alloca i32, align 4
  store i32 %t5, i32* %t29, align 4
  store i32 %t7, i32* %t30, align 4
  ret i32 0
}
define i32 @main() {
B32:
  %t36 = alloca i32, align 4
  %t35 = alloca i32, align 4
  %t34 = alloca i32, align 4
  %t33 = alloca i32, align 4
  store i32 0, i32* %t33, align 4
  store i32 0, i32* @a, align 4
  store i32 0, i32* %t34, align 4
  %t15 = load i32, i32* %t33, align 4
  %t16 = load i32, i32* %t34, align 4
  %t27 = call i32 @f(i32 %t15, i32 %t16)
  store i32 %t27, i32* %t35, align 4
  %t17 = add i32 1, 2
  %t18 = add i32 %t17, 3
  store i32 %t18, i32* %t36, align 4
  br label %B37
B37:                               	; preds = %B32, %B43, %B45
  %t20 = load i32, i32* %t34, align 4
  %t21 = icmp slt i32 %t20, 100
  br i1 %t21, label %B41, label %B40
B41:                               	; preds = %B37
  %t23 = load i32, i32* %t34, align 4
  %t24 = add i32 %t23, 1
  store i32 %t24, i32* %t34, align 4
  %t25 = load i32, i32* %t34, align 4
  %t26 = icmp slt i32 %t25, 50
  br i1 %t26, label %B43, label %B48
B40:                               	; preds = %B37
  br label %B42
B43:                               	; preds = %B41
  br label %B37
B48:                               	; preds = %B41
  br label %B44
B42:                               	; preds = %B40, %B44, %B45
  ret i32 1
B44:                               	; preds = %B48
  br label %B42
}
