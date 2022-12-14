a = global i32 0, align 4
define i32 main() {
B11:
  t13 = alloca i32, align 4
  t12 = alloca i32, align 4
  store i32 0, i32 t12, align 4
  store i32 0, i32 t13, align 4
  br label %B14
B14:                               	; preds = %B11, %B20, %B22
  t4 = load i32, i32 t13, align 4
  t5 = icmp  i32 t4, 100
  br i1 t5, label %B18, label %B17
B18:                               	; preds = %B14
  t7 = load i32, i32 t13, align 4
  t8 = add i32 t7, 1
  store i32 t8, i32 t13, align 4
  t9 = load i32, i32 t13, align 4
  t10 = icmp  i32 t9, 50
  br i1 t10, label %B20, label %B25
B17:                               	; preds = %B14
  br label %B19
B20:                               	; preds = %B18
  br label %B14
B25:                               	; preds = %B18
  br label %B21
B19:                               	; preds = %B17, %B21, %B22
  ret i32 1
B21:                               	; preds = %B25
  br label %B19
}
