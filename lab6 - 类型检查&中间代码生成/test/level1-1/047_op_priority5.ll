declare void @putint(i32)
@a = global i32 1, align 4
@b = global i32 0, align 4
@c = global i32 1, align 4
@d = global i32 2, align 4
@e = global i32 4, align 4
define i32 @main() {
B42:
  %t43 = alloca i32, align 4
  store i32 0, i32* %t43, align 4
  %t6 = load i32, i32* @a, align 4
  %t7 = load i32, i32* @b, align 4
  %t8 = mul i32 %t6, %t7
  %t9 = load i32, i32* @c, align 4
  %t10 = sdiv i32 %t8, %t9
  %t11 = load i32, i32* @e, align 4
  %t12 = load i32, i32* @d, align 4
  %t13 = add i32 %t11, %t12
  %t14 = icmp eq i32 %t10, %t13
  br i1 %t14, label %B47, label %B50
B47:                               	; preds = %B42
  %t15 = load i32, i32* @a, align 4
  %t16 = load i32, i32* @a, align 4
  %t17 = load i32, i32* @b, align 4
  %t18 = add i32 %t16, %t17
  %t19 = mul i32 %t15, %t18
  %t20 = load i32, i32* @c, align 4
  %t21 = add i32 %t19, %t20
  %t22 = load i32, i32* @d, align 4
  %t23 = load i32, i32* @e, align 4
  %t24 = add i32 %t22, %t23
  %t25 = icmp sle i32 %t21, %t24
  br i1 %t25, label %B44, label %B53
B50:                               	; preds = %B42
  br label %B46
B44:                               	; preds = %B46, %B47
  store i32 1, i32* %t43, align 4
  br label %B45
B53:                               	; preds = %B47
  br label %B46
B46:                               	; preds = %B50, %B53
  %t27 = load i32, i32* @a, align 4
  %t28 = load i32, i32* @b, align 4
  %t29 = load i32, i32* @c, align 4
  %t30 = mul i32 %t28, %t29
  %t31 = sub i32 %t27, %t30
  %t32 = load i32, i32* @d, align 4
  %t33 = load i32, i32* @a, align 4
  %t34 = load i32, i32* @c, align 4
  %t35 = sdiv i32 %t33, %t34
  %t36 = sub i32 %t32, %t35
  %t37 = icmp eq i32 %t31, %t36
  br i1 %t37, label %B44, label %B56
B45:                               	; preds = %B44, %B56
  %t40 = load i32, i32* %t43, align 4
  call void @putint(i32 %t40)
  %t41 = load i32, i32* %t43, align 4
  ret i32 %t41
B56:                               	; preds = %B46
  br label %B45
}
