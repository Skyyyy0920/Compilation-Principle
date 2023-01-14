%code top{
    #include <iostream>
    #include <assert.h>
    #include <string>
    #include <cstring>
    #include <stack>
    #include "parser.h"
    extern Ast ast;
    
    Type* declType;
    ArrayType* arrayType;   // 数组的类型
    InitValueListExpr* top;
    SymbolEntry* curFunc;
    int* arrayValue;     // int类型数组值存储

    // 数组初值以及参数数目
    int leftCount = 0;
    int paramNum = 0;
    int ArrayIndex;      // modified
    int notZeroNum = 0;

    std::stack<InitValueListExpr*> ArrayStk;  // 数组初始化栈
    std::stack<StmtNode*> whileStk;
    
    int yylex();
    int yyerror(char const*);
}

%code requires {
    #include "Ast.h"
    #include "SymbolTable.h"
    #include "Type.h"
}

%union {
    int itype;
    // modified
    float ftype; 
    char* strtype;
    StmtNode* stmttype;
    ExprNode* exprtype;
    Type* type;
    SymbolEntry* se;
}

%start Program
%token <strtype> ID STRING
%token <itype> INTEGER
%token <ftype> FLOATNUM
%token CONST
%token INT VOID FLOAT
%token IF ELSE WHILE
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON LBRACKET RBRACKET COMMA  
%token ADD SUB MUL DIV MOD OR AND LESS LESSEQUAL GREATER GREATEREQUAL ASSIGN EQUAL NOTEQUAL NOT
%token RETURN CONTINUE BREAK

// modified
%type<stmttype> Stmts Stmt AssignStmt ExprStmt BlockStmt IfStmt WhileStmt BreakStmt ContinueStmt ReturnStmt DeclStmt FuncDef ConstDeclStmt VarDeclStmt ConstDefList VarDef ConstDef VarDefList FuncFParam FuncFParams OptFuncFParams BlankStmt
%type<exprtype> Exp AddExp Cond LOrExp PrimaryExp LVal RelExp LAndExp MulExp ConstExp EqExp UnaryExp InitVal ConstInitVal FuncArrayIndices FuncRParams ArrayIndices
%type<type> Type

%precedence THEN
%precedence ELSE
%%

Program
    : Stmts {
        ast.setRoot($1);
    }
    ;
Stmts
    : Stmt { $$ = $1; }
    | Stmts Stmt {
        $$ = new SeqNode($1, $2);
    }
    ;
Stmt
    : AssignStmt { $$ = $1; }
    | ExprStmt { $$ = $1; }
    | BlockStmt { $$ = $1; }
    | IfStmt { $$ = $1; }
    | BreakStmt { $$ = $1; }
    | ContinueStmt { $$ = $1; }
    | WhileStmt { $$ = $1; }
    | ReturnStmt { $$ = $1; }
    | DeclStmt { $$ = $1; }
    | FuncDef { $$ = $1; }
    | BlankStmt { $$ = $1; }
    ;
LVal
    : ID {
        SymbolEntry* se;
        se = identifiers->lookup($1);
        if (se == nullptr)
            fprintf(stderr, "ID %s 未定义!\n", (char*)$1);
        $$ = new Id(se);
        delete []$1;
    }
    | ID ArrayIndices 
    {
        // modified恢复数组的定义
        SymbolEntry* se;
        // 保存数组名
        se = identifiers->lookup($1);
        // 这里是用array来初始化一个ID
        $$ = new Id(se, $2);
        delete []$1;
    }
    ;
ExprStmt
    : Exp SEMICOLON {
        $$ = new ExprStmt($1);
    }
    ;
AssignStmt  // eg: a = 1 + 1; 赋值语句
    : LVal ASSIGN Exp SEMICOLON {
        $$ = new AssignStmt($1, $3);
    }
    ;
BlankStmt  // 针对;号这种空语句
    : SEMICOLON {
        $$ = new BlankStmt();
    }
    ;
BlockStmt
    : LBRACE {
        identifiers = new SymbolTable(identifiers);  // 新作用域
    } 
    Stmts RBRACE {
        $$ = new CompoundStmt($3);
        SymbolTable* top = identifiers;
        identifiers = identifiers->getPrev();  // 块结束之后调整回上一级作用域
        delete top;
    }
    | LBRACE RBRACE {
        // TODO
        //$$->setHaveRetStmt(false);
        $$ = new BlankStmt();
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
    : WHILE LPAREN Cond RPAREN {
        StmtNode *whileNode = new WhileStmt($3);    
        whileStk.push(whileNode);
    }
    Stmt {  
        StmtNode *whileNode = whileStk.top();
        ((WhileStmt*)whileNode)->setStmt($6);  // 设置内部stmt语句
        $$ = whileNode;
        whileStk.pop();
    }
    ;
BreakStmt  // break和continue要匹配while
    : BREAK SEMICOLON {
        $$ = new BreakStmt(whileStk.top());
    }
    ;
ContinueStmt
    : CONTINUE SEMICOLON {
        $$ = new ContinueStmt(whileStk.top());
    }
    ;
ReturnStmt
    // TODO
    : RETURN SEMICOLON 
    {
        ReturnStmt* ret = new ReturnStmt();
        // ret->typeCheck(curFunc);
        // ret->setHaveRetStmt(true);
        $$ = ret;
    }
    | RETURN Exp SEMICOLON 
    {
        ReturnStmt* ret = new ReturnStmt($2);
        // ret->typeCheck(curFunc);
        // ret->setHaveRetStmt(true);
        $$ = ret;
    }
    ;
Exp
    :
    AddExp { $$ = $1; }
    ;
Cond
    :
    LOrExp { $$ = $1; }
    ;
PrimaryExp  // 表达式最初的右值, 一般为数字0-9, 或者id
    : LPAREN Exp RPAREN {
        $$ = $2;
    }
    | LVal {
        $$ = $1;
    }
    | INTEGER {
        SymbolEntry* se = new ConstantSymbolEntry(TypeSystem::intType, $1);
        $$ = new Constant(se);
    }
    | FLOATNUM {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::floatType, $1);
        $$ = new Constant(se);
    }
    | ID LPAREN RPAREN {
        SymbolEntry* se;
        se = identifiers->lookup($1);
        $$ = new CallExpr(se);
    }
    | ID LPAREN FuncRParams RPAREN {
        SymbolEntry* se;
        se = identifiers->lookup($1);
        // TODO
        if (se == nullptr) {
            fprintf(stderr, "函数 %s 未定义\n", (char*)$1);
        }
        else {
            $$ = new CallExpr(se, $3);
        }
    }
    ;
UnaryExp 
    : PrimaryExp { $$ = $1; }
    | ADD UnaryExp { $$ = $2; }
    | SUB UnaryExp 
    {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new UnaryExpr(se, UnaryExpr::SUB, $2);
    }
    | NOT UnaryExp 
    {   
        // 注意NOT是Bool类型
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new UnaryExpr(se, UnaryExpr::NOT, $2);
    }
    ;
MulExp
    : UnaryExp {$$ = $1;}
    | MulExp MUL UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MUL, $1, $3);
    }
    | MulExp DIV UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::DIV, $1, $3);
    }
    | MulExp MOD UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MOD, $1, $3);
    }
    ;
AddExp
    : MulExp { $$ = $1; }
    | AddExp ADD MulExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::ADD, $1, $3);
    }
    | AddExp SUB MulExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::SUB, $1, $3);
    }
    ;
RelExp
    : AddExp { $$ = $1; }
    | RelExp LESS AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::LESS, $1, $3);
    }
    | RelExp LESSEQUAL AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::LESSEQUAL, $1, $3);
    }
    | RelExp GREATER AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::GREATER, $1, $3);
    }
    | RelExp GREATEREQUAL AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::GREATEREQUAL, $1, $3);
    }
    ;
EqExp
    : RelExp { $$ = $1; }
    | EqExp EQUAL RelExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::EQUAL, $1, $3);
    }
    | EqExp NOTEQUAL RelExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::NOTEQUAL, $1, $3);
    }
    ;
LAndExp
    : EqExp {$$ = $1;}
    | LAndExp AND EqExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::AND, $1, $3);
    }
    ;
LOrExp
    : LAndExp {$$ = $1;}
    | LOrExp OR LAndExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::OR, $1, $3);
    }
    ;
ConstExp
    : AddExp {$$ = $1;}
    ; 
FuncRParams 
    : Exp { $$ = $1; }
    | FuncRParams COMMA Exp {
        $$ = $1;
        $$->setNext($3);  // 参数从左到右建立 next
    }
    ;
Type
    : INT {
        $$ = TypeSystem::intType;
        declType = TypeSystem::intType;
    }
    | FLOAT {
        $$ = TypeSystem::floatType;
        declType = TypeSystem::floatType;
    }
    | VOID {
        $$ = TypeSystem::voidType;
    }
    ;
DeclStmt
    : VarDeclStmt { $$ = $1; }
    | ConstDeclStmt { $$ = $1; }
    ;
VarDeclStmt
    : Type VarDefList SEMICOLON { $$ = $2; }
    ;
ConstDeclStmt
    : CONST Type ConstDefList SEMICOLON { $$ = $3; }
    ;
VarDefList
    : VarDefList COMMA VarDef {
        $$ = $1;
        $1->setNext($3);
    } 
    | VarDef { $$ = $1; }
    ;
ConstDefList
    : ConstDefList COMMA ConstDef {
        $$ = $1;
        $1->setNext($3);
    }
    | ConstDef {$$ = $1;}
    ;
VarDef  // 定义语句
    : ID {   
        // eg: int a;
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::intType, $1, identifiers->getLevel());
        identifiers->install($1, se);
        $$ = new DeclStmt(new Id(se));
        delete []$1;
    }
    | ID ASSIGN InitVal {   
        if(declType->isFloat()) {
            declType = TypeSystem::constFloatType;
        }
        if(declType->isInt()) {
            declType = TypeSystem::constIntType;
        }

        // 可以简写
        SymbolEntry* se = new IdentifierSymbolEntry(TypeSystem::intType, $1, identifiers->getLevel());
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

        ((IdentifierSymbolEntry*)se)->setValue($3->getValue());
        $$ = new DeclStmt(new Id(se), $3);
        delete []$1;
    }
    | ID ArrayIndices {   
        // eg: int a[10];
        std::vector<int> vec;  // 分别存放维度值，可能是很多维
        SymbolEntry* se;
        ExprNode* temp = $2;   // array
        // 编译每个维度数组，从高维到低维，这里用next全部遍历
        while(temp) {
            vec.push_back(temp->getValue());
            temp = (ExprNode*)(temp->getNext());
        }

        // TODO
        Type* type = TypeSystem::intType;   // 目前仅有int类型
        Type* temp1;

        // 注意这里是倒序遍历，即从右向左，a[2][3]：2个数组指针 每行3个整型元素
        while(!vec.empty()) {
            // 数组一层一层的类型存储
            temp1 = new ArrayType(type, vec.back());
            // 考虑多维数组，每个元素是数组指针
            // 如果元素是数组，type设置为数组维度
            if(type->isArray()) {
                ((ArrayType*)type)->setArrayType(temp1);
            }

            type = temp1;
            vec.pop_back();
        }

        // type保存最低维，即a[2][4]即保存2对应类型
        arrayType = (ArrayType*)type;
        se = new IdentifierSymbolEntry(type, $1, identifiers->getLevel());
        
        // 初始化为0
        ((IdentifierSymbolEntry*)se)->setAllZero(); 

        // 设置整型空间，即长度*大小
        int *p = new int[type->getSize()];    
        ((IdentifierSymbolEntry*)se)->setArrayValue(p);
        identifiers->install($1, se);
        $$ = new DeclStmt(new Id(se));
        delete []$1;
    }
    | ID ArrayIndices ASSIGN InitVal
    {
        SymbolEntry* se = nullptr;
        std::vector<int> vec;
        ExprNode* temp = $2;

        while (temp) {
            vec.push_back(temp->getValue());
            temp = (ExprNode*)(temp->getNext());
        }

        // 获取数组的各个维度??
        Type* type = TypeSystem::intType;
        Type* temp1 = new ArrayType(type, vec.back());

        $<se>$ = se;

        ((ArrayType*)type)->setArrayType(temp1);
        // modified
        se = new IdentifierSymbolEntry(type, $1, identifiers->getLevel());
        arrayValue = new int[arrayType->getSize()];
        notZeroNum = 0;
    } 
    ;
ConstDef
    : ID ASSIGN ConstInitVal {
        if(declType->isFloat()) {
            declType = TypeSystem::constFloatType;
        }
        if(declType->isInt()) {
            declType = TypeSystem::constIntType;
        }

        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::constIntType, $1, identifiers->getLevel());
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

        ((IdentifierSymbolEntry*)se)->setValue($3->getValue());
        $$ = new DeclStmt(new Id(se), $3);
        delete []$1;
    }
    ;
ArrayIndices  
    // 考虑数组一维和多维的情况，用Expr类型的Node next连接
    : LBRACKET ConstExp RBRACKET {
        $$ = $2;
    }
    | ArrayIndices LBRACKET ConstExp RBRACKET {
        $$ = $1;
        $1->setNext($3); 
    }
    ;
InitVal 
    : Exp 
    { 
        $$ = $1; 
        // 检验数组是否有各维的初始值
        if(!ArrayStk.empty()) {
            Type* arrayTp = ArrayStk.top()->getSymbolEntry()->getType();     // 获取每一维的Type
            arrayValue[ArrayIndex++] = $1->getValue();   // 获取每一维的初始值

            // 判断是不是最低一维的类型，高维的类型都是数组类型的了
            if(arrayTp == TypeSystem::intType) {
                ArrayStk.top()->addExpr($1);
            }
            else {
                while(arrayTp) {
                    if(((ArrayType*)arrayTp)->getElementType() != TypeSystem::intType) {
                        // 获取类型
                        arrayTp = ((ArrayType*)arrayTp)->getElementType();
                        SymbolEntry* se = new ConstantSymbolEntry(arrayTp);
                        // 新的ast类型
                        InitValueListExpr* list = new InitValueListExpr(se);
                        ArrayStk.top()->addExpr(list);
                        ArrayStk.push(list);
                    }
                    else {
                        ArrayStk.top()->addExpr($1);
                        // ???
                        while(ArrayStk.top()->isFull() && ArrayStk.size() != (long unsigned int)leftCount) {
                            arrayTp = ((ArrayType*)arrayTp)->getArrayType();
                            ArrayStk.pop();
                        }
                        break;
                    }
                }
            }
        }    
    }
    ;
ConstInitVal
    : ConstExp { $$ = $1; }
    ;
FuncDef
    :
    Type ID {
        identifiers = new SymbolTable(identifiers);  // 申请新的符号表，此时为该函数的符号表
        paramNum = 1 + 1 - 2;  // 标记参数的id
    }
    LPAREN OptFuncFParams RPAREN {
        Type* funcType;
        std::vector<Type*> vec;
        std::vector<SymbolEntry*> vec1;

        // 将所有形参全部装入params
        DeclStmt* temp = (DeclStmt*)$5;
        while(temp) {
            vec.push_back(temp->getId()->getSymbolEntry()->getType());
            vec1.push_back(temp->getId()->getSymbolEntry());
            temp = (DeclStmt*)(temp->getNext());
        }

        // 输入参数类型和符号表项
        funcType = new FunctionType($1, vec, vec1);
        SymbolEntry* se = new IdentifierSymbolEntry(funcType, $2, identifiers->getPrev()->getLevel());
        identifiers->getPrev()->install($2, se);    // 将函数ID和函数类型装入符号表，这个是该函数上一级的符号表
            
        $<se>$ = se;  // 下面使用
    } 
    BlockStmt {
        $$ = new FunctionDef($<se>7, (DeclStmt*)$5, $8);
        SymbolTable* top = identifiers;
        identifiers = identifiers->getPrev();  // 回到上一级符号表
        delete top;
        delete []$2;
    }
    ;
OptFuncFParams
    : FuncFParams { $$ = $1; }
    | %empty { $$ = nullptr; }  // 函数无参数的情况
    ;
FuncFParams  // 函数形参表
    : FuncFParams COMMA FuncFParam {
        $$ = $1;
        $$->setNext($3);  // 使用setnext将所有参数连起来, 以便之后使用
    }
    | FuncFParam {
        $$ = $1;
    }
    ;
FuncFParam  // 函数形参
    : Type ID 
    {
        SymbolEntry* se = new IdentifierSymbolEntry($1, $2, identifiers->getLevel(), paramNum++);
        identifiers->install($2, se);  // 形参存入当前函数的符号表

        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        
        $$ = new DeclStmt(new Id(se));
    }
    | Type ID FuncArrayIndices 
    {
        // 函数的参数之中为数组，很麻烦
        // TODO
        // 一维数组直接用int
        Type* array = TypeSystem::intType;
        Type* array1;
        std::stack<ExprNode*> temp_stack;

        SymbolEntry* se;
        ExprNode* temp = $3;

        // 对数组维度进行遍历，放入栈中
        while(temp){
            temp_stack.push(temp);
            temp = (ExprNode*)(temp->getNext());
        }

        // 获得最低维度
        while(!temp_stack.empty()) {
            array1 = new ArrayType(array, temp_stack.top()->getValue());
            if(array->isArray()) {
                ((ArrayType*)array)->setArrayType(array1);
            }
            array = array1;
            temp_stack.pop();
        }

        // 函数形参之中的符号表项
        se = new IdentifierSymbolEntry(array, $2, identifiers->getLevel(), paramNum++);
        identifiers->install($2, se);
        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        $$ = new DeclStmt(new Id(se));
        delete []$2;
    }
    ;
FuncArrayIndices  // 输入参数可能是数组a[][3]
    : LBRACKET RBRACKET 
    {
        $$ = new ExprNode(nullptr);
    }
    // 数组就还是用next存Exp类型
    | FuncArrayIndices LBRACKET Exp RBRACKET 
    {
        $$ = $1;
        $$->setNext($3);
    }
    ;

%%

int yyerror(char const* message)
{
    std::cerr<<message<<std::endl;
    return -1;
}
