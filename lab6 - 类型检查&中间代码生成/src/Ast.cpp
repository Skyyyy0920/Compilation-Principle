#include "Ast.h"
#include "SymbolTable.h"
#include "Unit.h"
#include "Instruction.h"
#include "IRBuilder.h"
#include <string>
#include "Type.h"

extern FILE *yyout;
int Node::counter = 0;
IRBuilder *Node::builder = nullptr;

Node::Node()
{
    seq = counter++;
    next = nullptr;
}

// 从二叉树在int a,b,c这种相同位置的定义转换为多叉树
void Node::setNext(Node *node)
{
    Node *n = this;
    while (n->getNext())
    {
        n = n->getNext();
    }
    if (n == this)
    {
        this->next = node;
    }
    else
    {
        n->setNext(node);
    }
    // 上面的ifelse是否可以写成n->next = node
}

void Node::backPatch(std::vector<Instruction *> &list, BasicBlock *bb)
{
    for (auto &inst : list)
    {
        if (inst->isCond())
            dynamic_cast<CondBrInstruction *>(inst)->setTrueBranch(bb);
        else if (inst->isUncond())
            dynamic_cast<UncondBrInstruction *>(inst)->setBranch(bb);
    }
}

std::vector<Instruction *> Node::merge(std::vector<Instruction *> &list1, std::vector<Instruction *> &list2)
{
    std::vector<Instruction *> res(list1);
    res.insert(res.end(), list2.begin(), list2.end());
    return res;
}


//------------------------------------------  中间代码生成  ------------------------------------------//

void Constant::genCode()
{

}

void Constant::typeCheck()
{

}

void Constant::output(int level)
{

}

void Ast::genCode(Unit *unit)
{
    IRBuilder *builder = new IRBuilder(unit);
    Node::setIRBuilder(builder);
    root->genCode();
}

void FunctionDef::genCode()
{
    Unit *unit = builder->getUnit();
    Function *func = new Function(unit, se);
    BasicBlock *entry = func->getEntry();
    // set the insert point to the entry basicblock of this function.
    builder->setInsertBB(entry);

    stmt->genCode();

    /**
     * Construct control flow graph. You need do set successors and predecessors for each basic block.
     * Todo
    */
   
}

void UnaryExpr::genCode()
{

}

void BinaryExpr::genCode()
{
    BasicBlock *bb = builder->getInsertBB();
    Function *func = bb->getParent();
    if (op == AND)
    {
        BasicBlock *trueBB = new BasicBlock(func);  // if the result of lhs is true, jump to the trueBB.
        expr1->genCode();
        backPatch(expr1->trueList(), trueBB);
        builder->setInsertBB(trueBB);               // set the insert point to the trueBB so that intructions generated by expr2 will be inserted into it.
        expr2->genCode();
        true_list = expr2->trueList();
        false_list = merge(expr1->falseList(), expr2->falseList());
    }
    else if(op == OR)
    {
        // Todo
    }
    else if(op >= LESS && op <= GREATER)
    {
        // Todo
    }
    else if(op >= ADD && op <= SUB)
    {
        expr1->genCode();
        expr2->genCode();
        Operand *src1 = expr1->getOperand();
        Operand *src2 = expr2->getOperand();
        int opcode;
        switch (op)
        {
        case ADD:
            opcode = BinaryInstruction::ADD;
            break;
        case SUB:
            opcode = BinaryInstruction::SUB;
            break;
        }
        new BinaryInstruction(opcode, dst, src1, src2, bb);
    }
}

void Id::genCode()
{
    /*
    BasicBlock *bb = builder->getInsertBB();
    Operand *addr = dynamic_cast<IdentifierSymbolEntry*>(symbolEntry)->getAddr();
    new LoadInstruction(dst, addr, bb);
    */
}

void IfStmt::genCode()
{
    Function *func;
    BasicBlock *then_bb, *end_bb;

    func = builder->getInsertBB()->getParent();
    then_bb = new BasicBlock(func);
    end_bb = new BasicBlock(func);

    cond->genCode();
    backPatch(cond->trueList(), then_bb);
    backPatch(cond->falseList(), end_bb);

    builder->setInsertBB(then_bb);
    thenStmt->genCode();
    then_bb = builder->getInsertBB();
    new UncondBrInstruction(end_bb, then_bb);

    builder->setInsertBB(end_bb);
}

void IfElseStmt::genCode()
{
    // Todo
}

void CompoundStmt::genCode()
{
    // Todo
}

void SeqNode::genCode()
{
    // Todo
}

void ExprStmt::genCode()
{

}

void BlankStmt::genCode()
{

}

void BreakStmt::genCode()
{

}

void WhileStmt::genCode()
{

}

void ContinueStmt::genCode()
{

}

void DeclStmt::genCode()
{
    /*
    IdentifierSymbolEntry *se = dynamic_cast<IdentifierSymbolEntry *>(id->getSymPtr());
    if(se->isGlobal())
    {
        Operand *addr;
        SymbolEntry *addr_se;
        addr_se = new IdentifierSymbolEntry(*se);
        addr_se->setType(new PointerType(se->getType()));
        addr = new Operand(addr_se);
        se->setAddr(addr);
    }
    else if(se->isLocal())
    {
        Function *func = builder->getInsertBB()->getParent();
        BasicBlock *entry = func->getEntry();
        Instruction *alloca;
        Operand *addr;
        SymbolEntry *addr_se;
        Type *type;
        type = new PointerType(se->getType());
        addr_se = new TemporarySymbolEntry(type, SymbolTable::getLabel());
        addr = new Operand(addr_se);
        alloca = new AllocaInstruction(addr, se);                   // allocate space for local id in function stack.
        entry->insertFront(alloca);                                 // allocate instructions should be inserted into the begin of the entry block.
        se->setAddr(addr);                                          // set the addr operand in symbol entry so that we can use it in subsequent code generation.
    }
    */
}

void ReturnStmt::genCode()
{
    // Todo
}

void AssignStmt::genCode()
{
    /*
    BasicBlock *bb = builder->getInsertBB();
    expr->genCode();
    Operand *addr = dynamic_cast<IdentifierSymbolEntry*>(lval->getSymPtr())->getAddr();
    Operand *src = expr->getOperand();
    // We haven't implemented array yet, the lval can only be ID. So we just store the result of the `expr` to the addr of the id.
    // If you want to implement array, you have to caculate the address first and then store the result into it.
    new StoreInstruction(addr, src, bb);
    */
}

void CallExpr::genCode()
{

}


//------------------------------------------  类型检查  ------------------------------------------//

void Ast::typeCheck()
{
    if(root != nullptr)
        root->typeCheck();
}

void UnaryExpr::typeCheck()
{

}

void BinaryExpr::typeCheck()
{
    this->expr1->typeCheck();
    this->expr2->typeCheck();

    Type *type1 = this->expr1->getSymPtr()->getType();
    Type *type2 = this->expr2->getSymPtr()->getType();
    // fprintf(stderr, "binaryExpr\n");
    // fprintf(stderr, "type1: %s\n", type1->toStr().c_str());
    // fprintf(stderr, "type2: %s\n", type2->toStr().c_str());
    if (type1->toStr() == "void") {  // 判断是否有函数返回void但是参与了运算
        fprintf(stderr, "expr1为 void 类型, 不能参与计算\n");
    }
    else if (type2->toStr() == "void") {
        fprintf(stderr, "expr2为 void 类型, 不能参与计算\n");
    }
}

void Id::typeCheck()
{
    // 这里的类型检查在paser.y中生成id节点的时候去做，因为如果是等到语法树生成完毕再自顶向下的检查，会由于symboltable都被删掉而出现问题

    /*
    std::string name = this->symbolEntry->toStr();  // IdentifierSymbolEntry
    if (identifiers->lookup(name) == NULL) {  // 判断是否被声明
        fprintf(stderr,"Id %s 未被声明\n", name.c_str());
    }
    if (identifiers->checkRepeat(name)) {  // 判断是否在同一作用域下重复定义
        fprintf(stderr,"Id %s 重复定义\n", name.c_str());
    }
    */
}

void CompoundStmt::typeCheck()
{
    if (stmt != NULL) {
        stmt->typeCheck();
    }
}

void SeqNode::typeCheck()
{
    stmt1->typeCheck();
    stmt2->typeCheck();
}

void ExprStmt::typeCheck()
{
    // 不用做任何事，但是需要写这个函数，C++的继承问题，之后的空函数体的typecheck也都是这个原因
}

void BlankStmt::typeCheck()
{

}

void DeclStmt::typeCheck()
{
    std::string name = this->getId()->getSymPtr()->toStr();
    if (identifiers->checkRepeat(name)) {  // 判断是否在同一作用域下重复声明
        fprintf(stderr,"DeclStmt %s 重复声明\n", name.c_str());
    }

    if (expr) {
        expr->typeCheck();
    }
}

void IfStmt::typeCheck()
{
    // 条件判断表达式，需要为int或者bool，如果是int需要做类型转换
    if (cond->getSymPtr()->getType()->isInt()) {
        cond->getSymPtr()->setType(TypeSystem::boolType);
        fprintf(stderr, "IfStmt条件判断表达式类型为int, 隐式类型转换为bool\n");
    }
    else if (cond->getSymPtr()->getType()->isBool()) {
        // do nothing
    }
    else if (cond->getSymPtr()->getType()->isFunc()) {
        if (!(cond->getSymPtr()->getType()->getReturnType()->isInt() || cond->getSymPtr()->getType()->getReturnType()->isBool())) {  // 如果是函数，返回类型需要是bool或者int
            fprintf(stderr, "if条件判断表达式的类型是函数返回类型, 但函数返回的类型不是int或bool\n");
        }
    }
    else {
        fprintf(stderr, "if条件判断表达式类型不正确\n");
    }

    thenStmt->typeCheck();
}

void IfElseStmt::typeCheck()
{
    if (cond->getSymPtr()->getType()->isInt()) {
        cond->getSymPtr()->setType(TypeSystem::boolType);
        fprintf(stderr, "IfElseStmt条件判断表达式类型为int, 隐式类型转换为bool\n");
    }
    else if (cond->getSymPtr()->getType()->isBool()) {
        // do nothing
    }
    else if (cond->getSymPtr()->getType()->isFunc()) {
        if (!(cond->getSymPtr()->getType()->getReturnType()->isInt() || cond->getSymPtr()->getType()->getReturnType()->isBool())) {  // 如果是函数，返回类型需要是bool或者int
            fprintf(stderr, "if条件判断表达式类型是函数的返回类型, 但不是int或bool\n");
        }
    }
    else {
        fprintf(stderr, "if条件判断表达式类型不正确\n");
    }

    thenStmt->typeCheck();
    elseStmt->typeCheck();
}

void ReturnStmt::typeCheck()
{
    // 与id的检查类似，也放到生成节点的时候去检查吧，在这里检查也有一些不太好解决的问题

    /*
    // return 语句需要检查操作数和函数声明的返回值类型是否匹配
    Type *retType = retValue->getSymPtr()->getType();  // return语句返回的类型
    Type *funcType = identifiers->searchFunc()->getType();  // 函数的返回类型
    if (retValue) {  // 如果函数最后return了一个表达式, 即return expr ;
        if (retType != funcType) {
            fprintf(stderr, "函数类型为 %s, 但返回了一个 %s 类型的表达式\n", funcType->toStr().c_str(), retType->toStr().c_str());
        }
    }
    else {  // 如果最后是return ;
        if (!funcType->isVoid()) {
            fprintf(stderr, "函数类型为 %s, 但返回了void\n", retType->toStr().c_str());
        }
    }
    */
}

void ReturnStmt::typeCheck(SymbolEntry* curFunc)
{
    Type *funcType = curFunc->getType();  // 函数的返回类型
    if (retValue) {  // 如果函数最后return了一个表达式, 即return expr ;
        Type *retType = retValue->getSymPtr()->getType();  // return语句返回的类型
        if (retType->toStr() != funcType->toStr()) {
            fprintf(stderr, "函数类型为 %s, 但返回了一个 %s 类型的表达式\n", funcType->toStr().c_str(), retType->toStr().c_str());
        }
    }
    else {  // 如果最后是return ;
        if (funcType->toStr() != "void") {
            fprintf(stderr, "函数类型为 %s, 但返回了void\n", funcType->toStr().c_str());
        }
    }
}

void WhileStmt::typeCheck()
{
    // 检查条件判断表达式cond
    if (cond->getSymPtr()->getType()->isInt()) {
        cond->getSymPtr()->setType(TypeSystem::boolType);
        fprintf(stderr, "WhileStmt条件判断表达式类型为int, 隐式类型转换为bool\n");
    }
    else if (cond->getSymPtr()->getType()->isBool()) {
        // do nothing
    }
    else if (cond->getSymPtr()->getType()->isFunc()) {
        if (!(cond->getSymPtr()->getType()->getReturnType()->isInt() || cond->getSymPtr()->getType()->getReturnType()->isBool())) {  // 如果是函数，返回类型需要是bool或者int
            fprintf(stderr, "while条件判断表达式类型是函数的返回类型, 但不是int或bool\n");
        }
    }
    else {
        fprintf(stderr, "while条件判断表达式类型不正确\n");
    }

    // 检查循环体
    stmt->typeCheck();
}

void BreakStmt::typeCheck()
{

}

void ContinueStmt::typeCheck()
{
    
}

void AssignStmt::typeCheck()
{

    this->lval->typeCheck();
    this->expr->typeCheck();

    Type *type1 = this->lval->getSymPtr()->getType();
    Type *type2 = this->expr->getSymPtr()->getType();
    // fprintf(stderr, "assignStmt %s\n", this->lval->getSymPtr()->toStr().c_str());
    // fprintf(stderr, "type1: %s\n", type1->toStr().c_str());
    // fprintf(stderr, "type2: %s\n", type2->toStr().c_str());
    if (type1->toStr() == "void") {  // 判断是否有函数返回void但是参与了运算
        fprintf(stderr, "表达式1为void, 不能进行赋值\n");
    }
    else if (type2->toStr() == "void") {
        fprintf(stderr, "表达式2为void, 不能进行赋值\n");
    }
}

void FunctionDef::typeCheck()
{
    std::string name = this->se->toStr();
    if (se->getType()->isFunc() != 1) {  // 检查函数返回类型
        fprintf(stderr, "函数 %s 返回类型不支持\n", name.c_str());
        // exit(EXIT_FAILURE);
    }

    if (this->decl != NULL) this->decl->typeCheck();  // 检查函数实参
    
    this->stmt->typeCheck();  // 检查函数体

    if (identifiers->lookup(name) == nullptr) {  // 检查未定义问题
        fprintf(stderr,"函数 %s 未被定义\n", name.c_str());
        // exit(EXIT_FAILURE);
    }
}

void CallExpr::typeCheck()  // 会在CallExpr构造函数中被调用
{
    fprintf(stderr, "CallExpr %s typeCheck\n", this->symbolEntry->toStr().c_str());
    bool flag = 0;
    ExprNode* tmp = this->param;
    int rCount = 0;  // 函数调用的实参个数
    while (tmp) {
        rCount ++;
        tmp = (ExprNode*)tmp->getNext();
    }

    SymbolEntry* func = this->getSymPtr();
    while (func) {
        int pCount = ((FunctionType*)func->getType())->getParams().size();
        if (rCount == pCount) {
            flag = 1;
            this->type = ((FunctionType*)func->getType())->getReturnType();
            // ------------------------------- 暂时不知道啥用 -----------------------------
            /*if (this->type != TypeSystem::voidType) {
                SymbolEntry* se = new TemporarySymbolEntry(this->type, SymbolTable::getLabel());
                dst = new Operand(se);
            }*/
            // ---------------------------------------------------------------------------
            ExprNode* fParams = this->param;  // 形参
            std::vector<SymbolEntry*> rParams = ((FunctionType*)this->type)->getParams();
            for (auto it : rParams) {
                if (fParams == nullptr) {
                    flag = 0;
                    break;
                }
                if (it->getType()->toStr() != fParams->getSymPtr()->getType()->toStr()) {  // 类型不同则要检查一下是不是可以隐式类型转换
                    if ((it->getType()->isFloat() && fParams->getSymPtr()->getType()->isInt()) || 
                        (it->getType()->isInt() && fParams->getSymPtr()->getType()->isFloat())) {  // 存在形参到实参的隐式类型转换, 可以, 接着往后一一对应地找
                            fParams = (ExprNode*)fParams->getNext();
                        }
                    else {
                        flag = 0;
                        break;
                    }
                }
            }

            if (flag) {
                this->symbolEntry = func;
                break;
            }
        }
        func = func->getNext();
    }
    
    if (!flag) {
        fprintf(stderr, "函数 %s 调用失败, 形参及实参数目不一致\n", this->getSymPtr()->toStr().c_str());
        fprintf(stderr, "函数 %s 调用失败, 形参及实参类型不一致\n", this->getSymPtr()->toStr().c_str());
    }    
}



//------------------------------------------  输出，同lab5  ------------------------------------------//

void Ast::output()
{
    fprintf(yyout, "program\n");
    if (root != nullptr)
        root->output(4);
}

void UnaryExpr ::output(int level)
{
    std::string op_str;
    switch (op)
    {
    // 正数
    case ADD:
        op_str = "positive";
        break;
    case SUB:
        op_str = "negative";
        break;
    case NON:
        op_str = "non";
        break;
    }
    fprintf(yyout, "%*cUnaryExpr\top: %s\n", level, ' ', op_str.c_str());
    expr->output(level + 4);
}

void CallExpr::output(int level)
{
    std::string name, type;
    int scope;
    name = symbolEntry->toStr();
    type = symbolEntry->getType()->toStr();
    scope = dynamic_cast<IdentifierSymbolEntry *>(symbolEntry)->getScope();
    fprintf(yyout, "%*cCallExprFunc name: %s, type: %s, scope: %d\n", level, ' ',
            name.c_str(), type.c_str(), scope);
    ExprNode *temp = param;
    while (temp != nullptr)
    {
        temp->output(level + 4);
        temp = dynamic_cast<ExprNode *>(temp->getNext());
    }
    /*
    if(param != nullptr){
        param->output(level + 4);
        while(param->getNext()){
            param->getNext()->output(level + 4);
        }
    }
    */
}

void BinaryExpr::output(int level)
{
    std::string op_str;
    switch (op)
    {
    case ADD:
        op_str = "add";
        break;
    case SUB:
        op_str = "sub";
        break;
    case AND:
        op_str = "and";
        break;
    case OR:
        op_str = "or";
        break;
    case LESS:
        op_str = "less";
        break;
    case GREATER:
        op_str = "greater";
        break;
    case GORE:
        op_str = "gore";
        break;
    case LORE:
        op_str = "lore";
        break;
    case EQUAL:
        op_str = "Equal";
        break;
    case NOTEQUAL:
        op_str = "NotEqual";
        break;
    case MUL:
        op_str = "mul";
        break;
    case DIV:
        op_str = "div";
        break;
    case MOD:
        op_str = "mod";
        break;
    }
    fprintf(yyout, "%*cBinaryExpr\top: %s\n", level, ' ', op_str.c_str());
    expr1->output(level + 4);
    expr2->output(level + 4);
}

/*
void Constant::output(int level)
{
    std::string type, value;
    type = SymbolEntry->getType()->toStr();
    value = SymbolEntry->toStr();
    if (type == "int")
        fprintf(yyout, "%*cIntegerLiteral\tvalue: %s\ttype: %s\n", level, ' ',
                value.c_str(), type.c_str());
    if (type == "float")
        fprintf(yyout, "%*cFloatLiteral\tvalue: %s\ttype: %s\n", level, ' ',
                value.c_str(), type.c_str());
}
*/

void Id::output(int level)
{
    std::string name, type;
    int scope;
    name = symbolEntry->toStr();
    type = symbolEntry->getType()->toStr();
    scope = dynamic_cast<IdentifierSymbolEntry *>(symbolEntry)->getScope();
    fprintf(yyout, "%*cId\tname: %s\tscope: %d\ttype: %s\n", level, ' ',
            name.c_str(), scope, type.c_str());
}

void CompoundStmt::output(int level)
{
    fprintf(yyout, "%*cCompoundStmt\n", level, ' ');
    if (stmt != nullptr)
    {
        stmt->output(level + 4);
    }
}

void SeqNode::output(int level)
{
    fprintf(yyout, "%*cSequence\n", level, ' ');
    stmt1->output(level + 4);
    stmt2->output(level + 4);
}

void ExprStmt::output(int level)
{
    fprintf(yyout, "%*cExprStmt\n", level, ' ');
    expr->output(level + 4);
}
void BlankStmt::output(int level)
{
    fprintf(yyout, "%*cBlankStmt\n", level, ' ');
}

DeclStmt::DeclStmt(Id *id, ExprNode *expr) : id(id) { this->expr = expr; };

void DeclStmt::output(int level)
{
    fprintf(yyout, "%*cDeclStmt\n", level, ' ');
    id->output(level + 4);
    if (expr != nullptr)
    {
        expr->output(level + 4);
    }
    if (this->getNext())
    {
        this->getNext()->output(level);
    }
}

void IfStmt::output(int level)
{
    fprintf(yyout, "%*cIfStmt\n", level, ' ');
    cond->output(level + 4);
    thenStmt->output(level + 4);
}

void IfElseStmt::output(int level)
{
    fprintf(yyout, "%*cIfElseStmt\n", level, ' ');
    cond->output(level + 4);
    thenStmt->output(level + 4);
    elseStmt->output(level + 4);
}

void WhileStmt::output(int level)
{
    fprintf(yyout, "%*cWhileStmt\n", level, ' ');
    cond->output(level + 4);
    stmt->output(level + 4);
}
void BreakStmt::output(int level)
{
    fprintf(yyout, "%*cBreakStmt\n", level, ' ');
}

void ContinueStmt::output(int level)
{
    fprintf(yyout, "%*cContinueStmt\n", level, ' ');
}

void ReturnStmt::output(int level)
{
    fprintf(yyout, "%*cReturnStmt\n", level, ' ');
    if (retValue != nullptr)
        retValue->output(level + 4);
}

void AssignStmt::output(int level)
{
    fprintf(yyout, "%*cAssignStmt\n", level, ' ');
    lval->output(level + 4);
    expr->output(level + 4);
}

void FunctionDef::output(int level)
{
    std::string name, type;
    name = se->toStr();
    type = se->getType()->toStr();
    fprintf(yyout, "%*cFunctionDefine function name: %s, type: %s\n", level, ' ',
            name.c_str(), type.c_str());
    if (decl)
    {
        decl->output(level + 4);
    }
    stmt->output(level + 4);
}