@a = global i32 0, align 4
@b = global i32 0, align 4
@c = global i32 0, align 4
@d = global i32 0, align 4
@e = global i32 0, align 4
define i32 @main() {
B53:
  %t54 = alloca i32, align 4
  %t48 = call i32 @getint()
  store i32 %t48, i32* @a, align 4
  %t49 = call i32 @getint()
  store i32 %t49, i32* @b, align 4
  %t50 = call i32 @getint()
  store i32 %t50, i32* @c, align 4
  %t51 = call i32 @getint()
  store i32 %t51, i32* @d, align 4
  %t52 = call i32 @getint()
  store i32 %t52, i32* @e, align 4
  store i32 0, i32* %t54, align 4
}
