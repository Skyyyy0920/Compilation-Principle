declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@n = global i32 0, align 4
define i32 @gcd(i32 %t1, i32 %t3) {
B50:
  %t56 = alloca i32, align 4
  %t55 = alloca i32, align 4
  %t54 = alloca i32, align 4
  %t53 = alloca i32, align 4
  %t52 = alloca i32, align 4
  %t51 = alloca i32, align 4
  store i32 %t1, i32* %t51, align 4
  store i32 %t3, i32* %t52, align 4
  %t8 = load i32, i32* %t51, align 4
  store i32 %t8, i32* %t53, align 4
  %t10 = load i32, i32* %t52, align 4
  store i32 %t10, i32* %t54, align 4
  %t13 = load i32, i32* %t51, align 4
  %t14 = load i32, i32* %t52, align 4
  %t15 = icmp slt i32 %t13, %t14
  br i1 %t15, label %B57, label %B61
B57:                               	; preds = %B50
  %t17 = load i32, i32* %t51, align 4
  store i32 %t17, i32* %t55, align 4
  %t19 = load i32, i32* %t52, align 4
  store i32 %t19, i32* %t51, align 4
  %t21 = load i32, i32* %t55, align 4
  store i32 %t21, i32* %t52, align 4
  br label %B58
B61:                               	; preds = %B50
  br label %B58
B58:                               	; preds = %B57, %B61
  %t23 = load i32, i32* %t51, align 4
  %t24 = load i32, i32* %t52, align 4
  %t25 = srem i32 %t23, %t24
  store i32 %t25, i32* %t56, align 4
  br label %B62
B62:                               	; preds = %B58, %B63
  %t26 = load i32, i32* %t56, align 4
  %t27 = icmp ne i32 %t26, 0
  br i1 %t27, label %B63, label %B67
B63:                               	; preds = %B62
  %t29 = load i32, i32* %t52, align 4
  store i32 %t29, i32* %t51, align 4
  %t31 = load i32, i32* %t56, align 4
  store i32 %t31, i32* %t52, align 4
  %t33 = load i32, i32* %t51, align 4
  %t34 = load i32, i32* %t52, align 4
  %t35 = srem i32 %t33, %t34
  store i32 %t35, i32* %t56, align 4
  br label %B62
B67:                               	; preds = %B62
  br label %B64
B64:                               	; preds = %B67
  %t36 = load i32, i32* %t53, align 4
  %t37 = load i32, i32* %t54, align 4
  %t38 = mul i32 %t36, %t37
  %t39 = load i32, i32* %t52, align 4
  %t40 = sdiv i32 %t38, %t39
  ret i32 %t40
}
define i32 @main() {
B69:
  %t71 = alloca i32, align 4
  %t70 = alloca i32, align 4
  %t44 = call i32 @getint()
  store i32 %t44, i32* %t70, align 4
  %t46 = call i32 @getint()
  store i32 %t46, i32* %t71, align 4
  %t47 = load i32, i32* %t70, align 4
  %t48 = load i32, i32* %t71, align 4
  %t49 = call i32 @gcd(i32 %t47, i32 %t48)
  ret i32 %t49
}
