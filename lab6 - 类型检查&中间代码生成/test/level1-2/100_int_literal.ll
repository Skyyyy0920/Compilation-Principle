declare i32 @getint()
declare i32 @getch()
declare void @putint(i32)
declare void @putch(i32)
@s = global i32 0, align 4
define i32 @get_ans_se(i32 %t1, i32 %t3, i32 %t5) {
B190:
  %t194 = alloca i32, align 4
  %t193 = alloca i32, align 4
  %t192 = alloca i32, align 4
  %t191 = alloca i32, align 4
  store i32 %t1, i32* %t191, align 4
  store i32 %t3, i32* %t192, align 4
  store i32 %t5, i32* %t193, align 4
  store i32 0, i32* %t194, align 4
  %t8 = load i32, i32* %t192, align 4
  %t9 = load i32, i32* %t193, align 4
  %t10 = icmp eq i32 %t8, %t9
  br i1 %t10, label %B195, label %B199
B195:                               	; preds = %B190
  store i32 1, i32* %t194, align 4
  br label %B196
B199:                               	; preds = %B190
  br label %B196
B196:                               	; preds = %B195, %B199
  %t13 = load i32, i32* %t191, align 4
  %t14 = mul i32 %t13, 2
  store i32 %t14, i32* %t191, align 4
  %t16 = load i32, i32* %t191, align 4
  %t17 = load i32, i32* %t194, align 4
  %t18 = add i32 %t16, %t17
  store i32 %t18, i32* %t191, align 4
  %t20 = load i32, i32* @s, align 4
  %t21 = load i32, i32* %t191, align 4
  %t22 = add i32 %t20, %t21
  store i32 %t22, i32* @s, align 4
  %t23 = load i32, i32* %t191, align 4
  ret i32 %t23
}
define i32 @get_ans(i32 %t24, i32 %t26, i32 %t28) {
B201:
  %t205 = alloca i32, align 4
  %t204 = alloca i32, align 4
  %t203 = alloca i32, align 4
  %t202 = alloca i32, align 4
  store i32 %t24, i32* %t202, align 4
  store i32 %t26, i32* %t203, align 4
  store i32 %t28, i32* %t204, align 4
  store i32 0, i32* %t205, align 4
  %t31 = load i32, i32* %t203, align 4
  %t32 = load i32, i32* %t204, align 4
  %t33 = icmp eq i32 %t31, %t32
  br i1 %t33, label %B206, label %B210
B206:                               	; preds = %B201
  store i32 1, i32* %t205, align 4
  br label %B207
B210:                               	; preds = %B201
  br label %B207
B207:                               	; preds = %B206, %B210
  %t36 = load i32, i32* %t202, align 4
  %t37 = mul i32 %t36, 2
  store i32 %t37, i32* %t202, align 4
  %t39 = load i32, i32* %t202, align 4
  %t40 = load i32, i32* %t205, align 4
  %t41 = add i32 %t39, %t40
  store i32 %t41, i32* %t202, align 4
  %t42 = load i32, i32* %t202, align 4
  ret i32 %t42
}
define i32 @main() {
B212:
  %t221 = alloca i32, align 4
  %t220 = alloca i32, align 4
  %t219 = alloca i32, align 4
  %t218 = alloca i32, align 4
  %t217 = alloca i32, align 4
  %t216 = alloca i32, align 4
  %t215 = alloca i32, align 4
  %t214 = alloca i32, align 4
  %t213 = alloca i32, align 4
  %t43 = sub i32 0, -2147483648
  store i32 %t43, i32* %t213, align 4
  store i32 -2147483648, i32* %t214, align 4
  %t46 = add i32 -2147483648, 1
  store i32 %t46, i32* %t215, align 4
  store i32 2147483647, i32* %t216, align 4
  %t49 = sub i32 2147483647, 1
  store i32 %t49, i32* %t217, align 4
  %t56 = load i32, i32* %t213, align 4
  %t57 = load i32, i32* %t214, align 4
  %t58 = call i32 @get_ans(i32 0, i32 %t56, i32 %t57)
  store i32 %t58, i32* %t218, align 4
  %t60 = load i32, i32* %t218, align 4
  %t61 = load i32, i32* %t213, align 4
  %t62 = add i32 %t61, 1
  %t63 = load i32, i32* %t215, align 4
  %t64 = call i32 @get_ans(i32 %t60, i32 %t62, i32 %t63)
  store i32 %t64, i32* %t218, align 4
  %t66 = load i32, i32* %t218, align 4
  %t67 = load i32, i32* %t213, align 4
  %t68 = load i32, i32* %t216, align 4
  %t69 = sub i32 0, %t68
  %t70 = sub i32 %t69, 1
  %t71 = call i32 @get_ans(i32 %t66, i32 %t67, i32 %t70)
  store i32 %t71, i32* %t218, align 4
  %t73 = load i32, i32* %t218, align 4
  %t74 = load i32, i32* %t213, align 4
  %t75 = load i32, i32* %t217, align 4
  %t76 = add i32 %t75, 1
  %t77 = call i32 @get_ans(i32 %t73, i32 %t74, i32 %t76)
  store i32 %t77, i32* %t218, align 4
  %t79 = load i32, i32* %t218, align 4
  %t80 = load i32, i32* %t214, align 4
  %t81 = sdiv i32 %t80, 2
  %t82 = load i32, i32* %t215, align 4
  %t83 = sdiv i32 %t82, 2
  %t84 = call i32 @get_ans(i32 %t79, i32 %t81, i32 %t83)
  store i32 %t84, i32* %t218, align 4
  %t86 = load i32, i32* %t218, align 4
  %t87 = load i32, i32* %t214, align 4
  %t88 = load i32, i32* %t216, align 4
  %t89 = sub i32 0, %t88
  %t90 = sub i32 %t89, 1
  %t91 = call i32 @get_ans(i32 %t86, i32 %t87, i32 %t90)
  store i32 %t91, i32* %t218, align 4
  %t93 = load i32, i32* %t218, align 4
  %t94 = load i32, i32* %t214, align 4
  %t95 = load i32, i32* %t217, align 4
  %t96 = add i32 %t95, 1
  %t97 = call i32 @get_ans(i32 %t93, i32 %t94, i32 %t96)
  store i32 %t97, i32* %t218, align 4
  %t99 = load i32, i32* %t215, align 4
  %t100 = load i32, i32* %t216, align 4
  %t101 = call i32 @get_ans(i32 0, i32 %t99, i32 %t100)
  store i32 %t101, i32* %t219, align 4
  %t103 = load i32, i32* %t219, align 4
  %t104 = load i32, i32* %t215, align 4
  %t105 = load i32, i32* %t217, align 4
  %t106 = call i32 @get_ans(i32 %t103, i32 %t104, i32 %t105)
  store i32 %t106, i32* %t219, align 4
  %t108 = load i32, i32* %t219, align 4
  %t109 = load i32, i32* %t216, align 4
  %t110 = load i32, i32* %t217, align 4
  %t111 = call i32 @get_ans(i32 %t108, i32 %t109, i32 %t110)
  store i32 %t111, i32* %t219, align 4
  %t113 = load i32, i32* %t219, align 4
  %t114 = load i32, i32* %t213, align 4
  %t115 = sdiv i32 %t114, 2
  %t116 = load i32, i32* %t214, align 4
  %t117 = sdiv i32 %t116, 2
  %t118 = call i32 @get_ans(i32 %t113, i32 %t115, i32 %t117)
  store i32 %t118, i32* %t219, align 4
  %t120 = load i32, i32* %t213, align 4
  %t121 = load i32, i32* %t214, align 4
  %t122 = call i32 @get_ans_se(i32 0, i32 %t120, i32 %t121)
  store i32 %t122, i32* %t220, align 4
  %t124 = load i32, i32* %t220, align 4
  %t125 = load i32, i32* %t213, align 4
  %t126 = add i32 %t125, 1
  %t127 = load i32, i32* %t215, align 4
  %t128 = call i32 @get_ans_se(i32 %t124, i32 %t126, i32 %t127)
  store i32 %t128, i32* %t220, align 4
  %t130 = load i32, i32* %t220, align 4
  %t131 = load i32, i32* %t213, align 4
  %t132 = load i32, i32* %t216, align 4
  %t133 = sub i32 0, %t132
  %t134 = sub i32 %t133, 1
  %t135 = call i32 @get_ans_se(i32 %t130, i32 %t131, i32 %t134)
  store i32 %t135, i32* %t220, align 4
  %t137 = load i32, i32* %t220, align 4
  %t138 = load i32, i32* %t213, align 4
  %t139 = load i32, i32* %t217, align 4
  %t140 = add i32 %t139, 1
  %t141 = call i32 @get_ans_se(i32 %t137, i32 %t138, i32 %t140)
  store i32 %t141, i32* %t220, align 4
  %t143 = load i32, i32* %t220, align 4
  %t144 = load i32, i32* %t214, align 4
  %t145 = sdiv i32 %t144, 2
  %t146 = load i32, i32* %t215, align 4
  %t147 = sdiv i32 %t146, 2
  %t148 = call i32 @get_ans_se(i32 %t143, i32 %t145, i32 %t147)
  store i32 %t148, i32* %t220, align 4
  %t150 = load i32, i32* %t220, align 4
  %t151 = load i32, i32* %t214, align 4
  %t152 = load i32, i32* %t216, align 4
  %t153 = sub i32 0, %t152
  %t154 = sub i32 %t153, 1
  %t155 = call i32 @get_ans_se(i32 %t150, i32 %t151, i32 %t154)
  store i32 %t155, i32* %t220, align 4
  %t157 = load i32, i32* %t220, align 4
  %t158 = load i32, i32* %t214, align 4
  %t159 = load i32, i32* %t217, align 4
  %t160 = add i32 %t159, 1
  %t161 = call i32 @get_ans_se(i32 %t157, i32 %t158, i32 %t160)
  store i32 %t161, i32* %t220, align 4
  %t163 = load i32, i32* %t215, align 4
  %t164 = load i32, i32* %t216, align 4
  %t165 = call i32 @get_ans_se(i32 0, i32 %t163, i32 %t164)
  store i32 %t165, i32* %t221, align 4
  %t167 = load i32, i32* %t221, align 4
  %t168 = load i32, i32* %t215, align 4
  %t169 = load i32, i32* %t217, align 4
  %t170 = call i32 @get_ans_se(i32 %t167, i32 %t168, i32 %t169)
  store i32 %t170, i32* %t221, align 4
  %t172 = load i32, i32* %t221, align 4
  %t173 = load i32, i32* %t216, align 4
  %t174 = load i32, i32* %t217, align 4
  %t175 = call i32 @get_ans_se(i32 %t172, i32 %t173, i32 %t174)
  store i32 %t175, i32* %t221, align 4
  %t177 = load i32, i32* %t221, align 4
  %t178 = load i32, i32* %t213, align 4
  %t179 = sdiv i32 %t178, 2
  %t180 = load i32, i32* %t214, align 4
  %t181 = sdiv i32 %t180, 2
  %t182 = call i32 @get_ans_se(i32 %t177, i32 %t179, i32 %t181)
  store i32 %t182, i32* %t221, align 4
  %t183 = load i32, i32* %t218, align 4
  %t184 = load i32, i32* %t219, align 4
  %t185 = add i32 %t183, %t184
  %t186 = load i32, i32* %t220, align 4
  %t187 = add i32 %t185, %t186
  %t188 = load i32, i32* %t221, align 4
  %t189 = add i32 %t187, %t188
  ret i32 %t189
}
