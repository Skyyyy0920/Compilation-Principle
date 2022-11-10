%code top{
    #include <iostream>
    #include <assert.h>
    #include <string>
    #include <cstring>
    #include <stack>
    #include "parser.h"
    using namespace std;
    extern Ast ast;

    Type* declType;
    stack<string> varlist;

    int yylex();
    int yyerror( char const * );
}

%code requires {
    #include "Ast.h"
    #include "SymbolTable.h"
    #include "Type.h"
}

%union {
    int itype;
    float ftype;
    char* strtype;
    StmtNode* stmttype;
    ExprNode* exprtype;
    Type* type;
}

%start Program
%token <strtype> ID 
%token <itype> INTEGER
%token <ftype> FLOATNUM
%token IF ELSE
%token EQUAL NOTEQUAL
%token CONST
%token INT VOID FLOAT
%token LPAREN RPAREN LBRACK RBRACK LBRACE RBRACE SEMICOLON COMMA // 函数参数vector
%token MOD MUL DIV ADD SUB OR AND NON GREATER LESS GORE LORE ASSIGN
%token WHILE RETURN BREAK CONTINUE

%nterm <stmttype> ExprStmt BlankStmt ConstDef ConstDefList ConstDeclStmt Stmts Stmt AssignStmt BlockStmt IfStmt WhileStmt BreakStmt ContinueStmt ReturnStmt DeclStmt FuncDef VarDefList VarDef VarDeclStmt FuncFParams FuncFParam
%nterm <exprtype> FuncRParam FuncRParams ConstInitVal ConstExp Exp AddExp Cond LOrExp PrimaryExp LVal RelExp EqExp UnaryExp LAndExp MulExp InitVal//各种形参域，数组
%nterm <type> Type

%precedence THEN
%precedence ELSE
%%
Program
    : Stmts {
        ast.setRoot($1);
    }
    ;
Stmts
    : Stmt {$$=$1;}
    | Stmts Stmt{
        $$ = new SeqNode($1, $2);
    }
    ;
Stmt
    : AssignStmt {$$=$1;}
    | ExprStmt {$$ = $1;}
    | BlockStmt {$$=$1;}
    | IfStmt {$$=$1;}
    | BreakStmt {$$=$1;}
    | ContinueStmt {$$=$1;}
    | WhileStmt {$$=$1;}
    | ReturnStmt {$$=$1;}
    | DeclStmt {$$ = $1;}
    | FuncDef {$$=$1;}
    | BlankStmt {$$=$1;}
    ;
LVal
    : ID {
        SymbolEntry *se;
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            assert(se != nullptr);
        }
        $$ = new Id(se);
        delete []$1;
    }
    ;
// 针对函数调用的使用, 补上一个Expr Node即可
ExprStmt
    :
    Exp SEMICOLON{
        $$ = new ExprStmt($1);
    }
AssignStmt
    :
    LVal ASSIGN Exp SEMICOLON {
        $$ = new AssignStmt($1, $3);
    }
    ;
// 针对于;号这种空语句
BlankStmt
    : 
    SEMICOLON {
        $$ = new BlankStmt();
    }
    ;
BlockStmt
    :   LBRACE 
        {identifiers = new SymbolTable(identifiers);} 
        Stmts RBRACE 
        {
            $$ = new CompoundStmt($3);
            SymbolTable *top = identifiers;
            identifiers = identifiers->getPrev();
            delete top;
        }
    |   LBRACE RBRACE {
            $$ = new CompoundStmt();
        }
    ;
IfStmt
    : IF LPAREN Cond RPAREN Stmt %prec THEN {
        $$ = new IfStmt($3, $5);
    }
    | IF LPAREN Cond RPAREN Stmt ELSE Stmt {
        $$ = new IfElseStmt($3, $5, $7);
    }
    ;
WhileStmt
    : WHILE LPAREN Cond RPAREN Stmt {
        $$ = new WhileStmt($3, $5);
    }
    ;
BreakStmt
    : BREAK SEMICOLON {
        $$ = new BreakStmt();
    }
    ;
ContinueStmt
    : CONTINUE SEMICOLON {
        $$ = new ContinueStmt();
    }
    ;
ReturnStmt
    : RETURN SEMICOLON {
        $$ = new ReturnStmt();
    }
    | RETURN Exp SEMICOLON{
        $$ = new ReturnStmt($2);
    }
    ;
Exp
    :
    AddExp {$$ = $1;}
    ;
Cond
    :
    LOrExp {$$ = $1;}
    ;
PrimaryExp
    :
    LVal {$$ = $1;}
    | INTEGER {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::intType, $1);
        $$ = new Constant(se);
    }
    | FLOATNUM{
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::floatType, $1);
        $$ = new Constant(se);
    }
    | LPAREN Exp RPAREN{$$ = $2;}
    ;
UnaryExp
    :
    PrimaryExp {$$ = $1;}
    |
    ADD UnaryExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new UnaryExpr(se, UnaryExpr::ADD, $2);
    }
    |
    SUB UnaryExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new UnaryExpr(se, UnaryExpr::SUB, $2);
    }
    |
    NON UnaryExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new UnaryExpr(se, UnaryExpr::NON, $2);
    }
    | ID LPAREN FuncRParams RPAREN {
        SymbolEntry *se;
        se = identifiers->lookup($1);
        if (se == nullptr)
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)$1);
        else{
            $$ = new CallExpr(se, $3);
        }
    } 
    ;
MulExp
    :
    UnaryExp {$$=$1;}
    |
    MulExp MUL UnaryExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MUL, $1, $3);
    }
    |
    MulExp DIV UnaryExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::DIV, $1, $3);
    }
    |
    MulExp MOD UnaryExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MOD, $1, $3);
    }
    ;
AddExp
    :
    MulExp {$$ = $1;}
    |
    AddExp ADD MulExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::ADD, $1, $3);
    }
    |
    AddExp SUB MulExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::SUB, $1, $3);
    }
    ;
RelExp
    :
    AddExp {$$ = $1;}
    |
    RelExp LORE AddExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::LORE, $1, $3);
    }
    |
    RelExp GORE AddExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::GORE, $1, $3);
    }
    |
    RelExp GREATER AddExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::GREATER, $1, $3);
    }
    |
    RelExp LESS AddExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::LESS, $1, $3);
    }
    ;
EqExp
    :
    RelExp {$$ = $1;}
    |
    EqExp EQUAL RelExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::EQUAL, $1, $3);
    }
    |
    EqExp NOTEQUAL RelExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::NOTEQUAL, $1, $3);
    }
    ;
LAndExp
    :
    EqExp {$$ = $1;}
    |
    LAndExp AND EqExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::AND, $1, $3);
    }
    ;
LOrExp
    :
    LAndExp {$$ = $1;}
    |
    LOrExp OR LAndExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::OR, $1, $3);
    }
    ;
Type
    : 
    INT {
        $$ = TypeSystem::intType;
        declType = TypeSystem::intType;
    }
    | 
    VOID {
        $$ = TypeSystem::voidType;
    }
    |
    FLOAT{
        $$ = TypeSystem::floatType;
        declType = TypeSystem::floatType;
    }
    ;
DeclStmt
    : 
    VarDeclStmt {$$ = $1;}
    |
    ConstDeclStmt {$$ = $1;}
    ;
VarDeclStmt
    : 
    Type VarDefList SEMICOLON {$$ = $2;}
    ;
VarDefList
    : VarDefList COMMA VarDef {
        $$ = $1;
        $1->setNext($3);
    } 
    | VarDef {$$ = $1;}
    ;
VarDef
    : ID {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(declType, $1, identifiers->getLevel());
        identifiers->install($1, se);
        $$ = new DeclStmt(new Id(se));
        delete []$1;
    }
    | ID ASSIGN InitVal {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(declType, $1, identifiers->getLevel());
        identifiers->install($1, se);
        
        /* 这里展示的也是对expr node的属性的计算，这些node的值可以是float类型的，因为最后会进行int和float的判断
        if(declType->isFloat()){
            ((IdentifierSymbolEntry*)se)->setfValue($3->getvalue()); 
        }
        if(declType->isInt()){
            ((IdentifierSymbolEntry*)se)->setiValue($3->getvalue()); 
        }
        */

        $$ = new DeclStmt(new Id(se), $3);
        delete []$1;
    }
    ;
InitVal
    :
    Exp {$$ = $1;}
    ;
// 新添加的常量定义
// initvalue部分需要补充正常的表达式和数组初值
ConstDeclStmt
    :
    CONST Type ConstDefList SEMICOLON {$$ = $3;}
    ;
ConstDefList
    :
    ConstDefList COMMA ConstDef {
        $$ = $1;
        $1->setNext($3);
    }
    |
    ConstDef {$$ = $1;}
    ;
ConstDef
    :
    ID ASSIGN ConstInitVal{
        if(declType->isFloat()){
            declType = TypeSystem::constFloatType;
        }
        if(declType->isInt()){
            declType = TypeSystem::constIntType;
        }
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(declType, $1, identifiers->getLevel());
        ((IdentifierSymbolEntry*)se)->setConst();
        identifiers->install($1, se);
        
        // 进行类型的判断选择赋值，符号表之中并没有存储任何的数值，包括const和var都得补充
        /* 这里需要注意的是需要补充对expr node的属性的值的计算
        if(declType->isFloat()){
            ((IdentifierSymbolEntry*)se)->setfValue($3->getvalue()); 
        }
        if(declType->isInt()){
            ((IdentifierSymbolEntry*)se)->setiValue($3->getvalue()); 
        }
        */
        
        $$ = new DeclStmt(new Id(se), $3);
        delete []$1;
    }
    ;
ConstInitVal 
    :
    ConstExp {$$ = $1;}
    ;
ConstExp
    :
    AddExp {$$ = $1;}
    ;
FuncDef  // 函数定义
    :
    Type ID {
        identifiers = new SymbolTable(identifiers);  // 申请新的符号表，此时为该函数的符号表
    }
    LPAREN FuncFParams RPAREN {
        Type* funcType;
        std::vector<SymbolEntry*> params;
        DeclStmt* temp = (DeclStmt*)$5;  // 将所有形参全部装入params
        while(temp){
            params.push_back(temp->getId()->getSymbolEntry());
            temp = (DeclStmt*)(temp->getNext());
        }
        funcType = new FunctionType($1, params);
        SymbolEntry* se = new IdentifierSymbolEntry(funcType, $2, identifiers->getPrev()->getLevel());
        identifiers->getPrev()->install($2, se);  // 将函数ID和函数类型装入符号表，这个是该函数上一级的符号表
    }
    BlockStmt {
        SymbolEntry* se;
        se = identifiers->lookup($2);
        assert(se != nullptr);
        $$ = new FunctionDef(se, (DeclStmt*)$5, $8);
        SymbolTable* top = identifiers;
        identifiers = identifiers->getPrev();
        delete top;
        delete []$2;
    }
    ;
FuncFParams  // 函数形参表
    : 
    FuncFParams COMMA FuncFParam {
        $$ = $1;
        $$->setNext($3);
    }
    | FuncFParam {
        $$ = $1;
    }
    | %empty{  // 无参数的情况
        $$ = nullptr;
    }
    ;
FuncFParam  // 函数形参
    : 
    Type ID {
        SymbolEntry* se;
        // se = new IdentifierSymbolEntry($1, $2, identifiers->getLevel(), paramNo++);
        se = new IdentifierSymbolEntry($1, $2, identifiers->getLevel());
        identifiers->install($2, se);
        // ((IdentifierSymbolEntry*)se)->setLabel();
        // ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        $$ = new DeclStmt(new Id(se));
        delete []$2;
    }
    ;
FuncRParams  // 函数实参表
    :
    FuncRParam {$$ = $1;}
    | FuncRParams COMMA FuncRParam {
        $$ = $1;
        $$->setNext($3);
    }
    | %empty{
        $$ = nullptr;
    }
    ;
FuncRParam  // 函数实参
    :
    Exp {$$ = $1;}
    ;
%%

int yyerror(char const* message)
{
    std::cerr<<message<<std::endl;
    return -1;
}
