# Principles-of-Compiler-Design
Course assignment of Compilation Principle (NKU, Autumn 2022)   
Lectured by [Gang Wang](https://cc.nankai.edu.cn/2021/0323/c13619a490377/page.htm).      
Code frame from [2022NKUCS-Compilers-Lab](https://github.com/shm0214/2022NKUCS-Compilers-Lab/tree/lab7).

## Some Useful Link
- YACC: [YACC User guide](https://blog.csdn.net/zzhongcy/article/details/93753017?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522166990278116800215090649%2522%252C%2522scm%2522%253A%252220140713.130102334..%2522%257D&request_id=166990278116800215090649&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~sobaiduend~default-1-93753017-null-null.142^v67^control,201^v3^control,213^v2^t3_esquery_v3&utm_term=YACC%EF%BC%88BISON%EF%BC%89%E4%BD%BF%E7%94%A8%E6%8C%87%E5%8D%97&spm=1018.2226.3001.4187)
- Reference Answers to Textbook: [Compilers Principles, Techniques, & Tools (purple dragon book) second edition exercise answers](https://gitcode.net/mirrors/fool2fish/dragon-book-exercise-answers?utm_source=csdn_github_accelerator&from_codechina=yes)

## 编译器命令
```
Usage：build/compiler [options] infile
Options:
    -o <file>   Place the output into <file>.
    -t          Print tokens.
    -a          Print abstract syntax tree.
    -i          Print intermediate code
    -S          Print assembly code
```

## Makefile使用

* 修改测试路径：

默认测试路径为test，你可以修改为任意要测试的路径。我们已将最终所有测试样例分级上传。

如：要测试level1-1下所有sy文件，可以将makefile中的

```
TEST_PATH ?= test
```

修改为

```
TEST_PATH ?= test/level1-1
```

* 编译：

```
make
```
编译出我们的编译器。

* 运行：
```
make run
```
以example.sy文件为输入，输出相应的汇编代码到example.s文件中。

* 测试：
```
make testlab7
```
该命令会搜索TEST_PATH目录下所有的.sy文件，逐个输入到编译器中，生成相应的汇编代码.s文件。你还可以指定测试目录：
```
make testlab7 TEST_PATH=dirpath
```
* 批量测试：
```
make test
```
对TEST_PATH目录下的每个.sy文件，编译器将其编译成汇编代码.s文件， 再使用gcc将.s文件汇编成二进制文件后执行， 将得到的输出与标准输出对比， 验证编译器实现的正确性。错误信息描述如下：
|  错误信息   | 描述  |
|  ----  | ----  |
| Compile Timeout  | 编译超时， 可能是编译器实现错误导致， 也可能是源程序过于庞大导致(可调整超时时间) |
| Compile Error  | 编译错误， 源程序有错误或编译器实现错误 |
|Assemble Error| 汇编错误， 编译器生成的目标代码不能由gcc正确汇编|
| Execute Timeout  |执行超时， 可能是编译器生成了错误的目标代码|
|Execute Error|程序运行时崩溃， 可能原因同Execute Timeout|
|Wrong Answer|答案错误， 执行程序得到的输出与标准输出不同|

具体的错误信息可在对应的.log文件中查看。

* GCC Assembly Code
```
make gccasm
```
使用gcc编译器生成汇编代码。

* 清理:
```
make clean
```
清除所有可执行文件和测试输出。
```
make clean-test
```
清除所有测试输出。
```
make clean-app
```
清除编译器可执行文件。
