@a = global i32 0, align 4
@b = global i32 0, align 4
define i32 @main() {
B18:
  %t19 = alloca i32, align 4
  %t16 = call i32 @getint()
  store i32 %t16, i32* @a, align 4
  %t17 = call i32 @getint()
  store i32 %t17, i32* @b, align 4
}
