declare i32 @getint()
@a = global i32 0, align 4
@b = global i32 0, align 4
@c = global i32 0, align 4
@d = global i32 0, align 4
@e = global i32 0, align 4
define i32 @main() {
B49:
  %t50 = alloca i32, align 4
%t6 =   call i32 @getint()
  store i32 %t6, i32* @a, align 4
%t8 =   call i32 @getint()
  store i32 %t8, i32* @b, align 4
%t10 =   call i32 @getint()
  store i32 %t10, i32* @c, align 4
%t12 =   call i32 @getint()
  store i32 %t12, i32* @d, align 4
%t14 =   call i32 @getint()
  store i32 %t14, i32* @e, align 4
  store i32 0, i32* %t50, align 4
  %t16 = load i32, i32* @a, align 4
  %t17 = load i32, i32* @b, align 4
  %t18 = load i32, i32* @c, align 4
  %t19 = mul i32 %t17, %t18
  %t20 = sub i32 %t16, %t19
  %t21 = load i32, i32* @d, align 4
  %t22 = load i32, i32* @a, align 4
  %t23 = load i32, i32* @c, align 4
  %t24 = sdiv i32 %t22, %t23
  %t25 = sub i32 %t21, %t24
  %t26 = icmp ne i32 %t20, %t25
  br i1 %t26, label %B51, label %B57
B51:                               	; preds = %B49, %B53, %B54
  store i32 1, i32* %t50, align 4
  br label %B52
B57:                               	; preds = %B49
  br label %B54
B52:                               	; preds = %B51, %B63
  %t48 = load i32, i32* %t50, align 4
  ret i32 %t48
B54:                               	; preds = %B57
  %t27 = load i32, i32* @a, align 4
  %t28 = load i32, i32* @b, align 4
  %t29 = mul i32 %t27, %t28
  %t30 = load i32, i32* @c, align 4
  %t31 = sdiv i32 %t29, %t30
  %t32 = load i32, i32* @e, align 4
  %t33 = load i32, i32* @d, align 4
  %t34 = add i32 %t32, %t33
  %t35 = icmp eq i32 %t31, %t34
  br i1 %t35, label %B51, label %B60
B60:                               	; preds = %B54
  br label %B53
B53:                               	; preds = %B60
  %t37 = load i32, i32* @a, align 4
  %t38 = load i32, i32* @b, align 4
  %t39 = add i32 %t37, %t38
  %t40 = load i32, i32* @c, align 4
  %t41 = add i32 %t39, %t40
  %t42 = load i32, i32* @d, align 4
  %t43 = load i32, i32* @e, align 4
  %t44 = add i32 %t42, %t43
  %t45 = icmp eq i32 %t41, %t44
  br i1 %t45, label %B51, label %B63
B63:                               	; preds = %B53
  br label %B52
}
