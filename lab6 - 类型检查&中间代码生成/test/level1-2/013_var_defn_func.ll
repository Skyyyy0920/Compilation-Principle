declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
define i32 @defn() {
B3:
  ret i32 4
}
define i32 @main() {
B5:
  %t6 = alloca i32, align 4
  %t0 = call i32 @defn()
  store i32 %t0, i32* %t6, align 4
  %t2 = load i32, i32* %t6, align 4
  ret i32 %t2
}
