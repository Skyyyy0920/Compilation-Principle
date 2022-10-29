; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%f\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @add(float noundef %0, float noundef %1) #0 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  store float %0, float* %3, align 4
  store float %1, float* %4, align 4
  %5 = load float, float* %3, align 4
  %6 = load float, float* %4, align 4
  %7 = fadd float %5, %6
  ret float %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x [5 x float]], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %3, align 4
  br label %6

6:                                                ; preds = %32, %0
  %7 = load i32, i32* %3, align 4
  %8 = icmp slt i32 %7, 5
  br i1 %8, label %9, label %35

9:                                                ; preds = %6
  store i32 0, i32* %4, align 4
  br label %10

10:                                               ; preds = %28, %9
  %11 = load i32, i32* %4, align 4
  %12 = icmp slt i32 %11, 5
  br i1 %12, label %13, label %31

13:                                               ; preds = %10
  %14 = load i32, i32* %3, align 4
  %15 = load i32, i32* %4, align 4
  %16 = add nsw i32 %14, %15
  %17 = load i32, i32* %3, align 4
  %18 = load i32, i32* %4, align 4
  %19 = mul nsw i32 %17, %18
  %20 = add nsw i32 %16, %19
  %21 = sitofp i32 %20 to float
  %22 = load i32, i32* %3, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [5 x [5 x float]], [5 x [5 x float]]* %2, i64 0, i64 %23
  %25 = load i32, i32* %4, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [5 x float], [5 x float]* %24, i64 0, i64 %26
  store float %21, float* %27, align 4
  br label %28

28:                                               ; preds = %13
  %29 = load i32, i32* %4, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %4, align 4
  br label %10, !llvm.loop !6

31:                                               ; preds = %10
  br label %32

32:                                               ; preds = %31
  %33 = load i32, i32* %3, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %3, align 4
  br label %6, !llvm.loop !8

35:                                               ; preds = %6
  %36 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %5)
  %37 = getelementptr inbounds [5 x [5 x float]], [5 x [5 x float]]* %2, i64 0, i64 3
  %38 = getelementptr inbounds [5 x float], [5 x float]* %37, i64 0, i64 3
  %39 = load float, float* %38, align 4
  %40 = load i32, i32* %5, align 4
  %41 = sitofp i32 %40 to float
  %42 = call float @add(float noundef %39, float noundef %41)
  %43 = getelementptr inbounds [5 x [5 x float]], [5 x [5 x float]]* %2, i64 0, i64 3
  %44 = getelementptr inbounds [5 x float], [5 x float]* %43, i64 0, i64 3
  store float %42, float* %44, align 4
  %45 = getelementptr inbounds [5 x [5 x float]], [5 x [5 x float]]* %2, i64 0, i64 3
  %46 = getelementptr inbounds [5 x float], [5 x float]* %45, i64 0, i64 3
  %47 = load float, float* %46, align 4
  %48 = fpext float %47 to double
  %49 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), double noundef %48)
  ret i32 0
}

declare i32 @__isoc99_scanf(i8* noundef, ...) #1

declare i32 @printf(i8* noundef, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
