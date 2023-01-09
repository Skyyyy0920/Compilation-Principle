#include <string.h>
#include <unistd.h>
#include <iostream>
#include "Ast.h"
#include "LinearScan.h"
#include "MachineCode.h"
#include "Unit.h"
using namespace std;

Ast ast;
Unit unit;
MachineUnit mUnit;
extern FILE* yyin;
extern FILE* yyout;

int yyparse();

char outfile[256] = "a.out";
bool dump_tokens;
bool dump_ast;
bool dump_ir;
bool dump_asm;

int main(int argc, char* argv[]) {
    int opt;
    while ((opt = getopt(argc, argv, "Siato:O::")) != -1) {
        switch (opt) {
            case 'o':
                strcpy(outfile, optarg);
                break;
            case 'a':
                dump_ast = true;
                break;
            case 't':
                dump_tokens = true;
                break;
            case 'i':
                dump_ir = true;
                break;
            case 'O':
            case 'S':
                dump_asm = true;
                break;
            default:
                // fprintf(stderr, "Usage: %s [-o outfile] infile\n", argv[0]);
                // exit(EXIT_FAILURE);
                dump_asm = true;

                break;
        }
    }
    if (optind >= argc) {
        fprintf(stderr, "no input file\n");
        exit(EXIT_FAILURE);
    }
    if (!(yyin = fopen(argv[optind], "r"))) {
        fprintf(stderr, "%s: No such file or directory\nno input file\n",
                argv[optind]);
        exit(EXIT_FAILURE);
    }
    if (!(yyout = fopen(outfile, "w"))) {
        fprintf(stderr, "%s: fail to open output file\n", outfile);
        exit(EXIT_FAILURE);
    }
    yyparse();  // 构建语法树
    fprintf(stderr, "\n语法树构建完成\n");
    fprintf(stderr, "==========================================================\n\n");

    if(dump_ast) {
        ast.output();  // 打印语法树
        fprintf(stderr, "\n语法树打印完成\n");
        fprintf(stderr, "==========================================================\n\n");
    }

    ast.typeCheck();  // 类型检查
    fprintf(stderr, "\n类型检查完成\n");
    fprintf(stderr, "==========================================================\n\n");

    ast.genCode(&unit);  // 中间代码生成
    fprintf(stderr, "\n中间代码生成完成\n");
    fprintf(stderr, "==========================================================\n\n");

    if(dump_ir){
        unit.output();  // 打印中间代码
        fprintf(stderr, "\n中间代码输出完成\n");
        fprintf(stderr, "==========================================================\n\n");
    }
    
    unit.genMachineCode(&mUnit);
    LinearScan linearScan(&mUnit);
    linearScan.allocateRegisters();
    if (dump_asm)
        mUnit.output();
    return 0;
}
