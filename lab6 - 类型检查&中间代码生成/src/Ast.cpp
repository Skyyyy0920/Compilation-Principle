#include "Ast.h"
#include "SymbolTable.h"
#include "Unit.h"
#include "Instruction.h"
#include "IRBuilder.h"
#include <string>
#include "Type.h"
extern Unit unit;

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

// 回填函数，需要向下继承
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

void Ast::genCode(Unit *unit)
{
    IRBuilder *builder = new IRBuilder(unit);
    Node::setIRBuilder(builder);
    root->genCode();
}

void FunctionDef::genCode() {
    Unit* unit = builder->getUnit();
    Function* func = new Function(unit, se);
    BasicBlock* entry = func->getEntry();
    // set the insert point to the entry basicblock of this function.

    builder->setInsertBB(entry);
    if (decl)
        decl->genCode();
    if (stmt)
        stmt->genCode();

    // 生成控制流图
    for(auto block = func->begin(); block != func->end(); block++){
        // 获取该块的最后一条指令
        Instruction* i = (*block)->begin();
        Instruction* last = (*block)->rbegin();
        // 从块中删除条件型语句
        while (i != last){
            if (i->isCond() || i->isUncond()){
                (*block)->remove(i);
            }
            i = i->getNext();
        }
        
        if (last->isCond()){
            BasicBlock *truebranch, *falsebranch;
            truebranch = dynamic_cast<CondBrInstruction*>(last)->getTrueBranch();
            falsebranch = dynamic_cast<CondBrInstruction*>(last)->getFalseBranch();
            
            (*block)->addSucc(truebranch);
            (*block)->addSucc(falsebranch);
            truebranch->addPred(*block);
            falsebranch->addPred(*block);
        } 
        else if (last->isUncond()){
            BasicBlock* dst = dynamic_cast<UncondBrInstruction*>(last)->getBranch();
            (*block)->addSucc(dst);
            // 插入return
            dst->addPred(*block);
            // 无条件跳转的空块
            if (dst->empty()){
                if (((FunctionType*)(se->getType()))->getReturnType() == TypeSystem::intType){
                    new RetInstruction(new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0)), dst);
                }
                else if (((FunctionType*)(se->getType()))->getReturnType() == TypeSystem::floatType) {
                    new RetInstruction(new Operand(new ConstantSymbolEntry(TypeSystem::floatType, 0)), dst);
                }
                else if (((FunctionType*)(se->getType()))->getReturnType() == TypeSystem::voidType){
                    new RetInstruction(nullptr, dst);
                }
            }
        }
        //没有显示返回或者跳转的语句 插入空返回
        else if ((!last->isRet()) && ((FunctionType*)(se->getType()))->getReturnType() == TypeSystem::voidType) {
                new RetInstruction(nullptr, *block);
        } 
    }
    // 目前还没用
    BasicBlock *exitBB = new BasicBlock(func);
    func->setExit(exitBB);
}

/*
void FunctionDef::genCode()
{
    Unit *unit = builder->getUnit();
    Function *func = new Function(unit, se); // se函数名符号表项
    BasicBlock *entry = func->getEntry(); //返回入口基本块
    // set the insert point to the entry basicblock of this function.
    builder->setInsertBB(entry);

    // ??不知道能不能过呀
    decl->genCode();
    stmt->genCode();

    // 这里属于是构造控制流图，不知道注释掉能不能过
    for (auto block = func->begin(); block != func->end(); block++){
        // 获取第一条指令和最后一条指令
        Instruction* first_inst = (*block)->begin();
        Instruction* last_inst = (*block)->rbegin();
        // 删除基本块中的条件跳转指令，应该就是基本块的最后一条指令，但是感觉可以不删??
        while (first_inst != last_inst) {
            if (first_inst->isCond() || first_inst->isUncond()) {
                (*block)->remove(first_inst);
            }
            first_inst = first_inst->getNext();
        }

        // 插入true branch和false branch
        if (last_inst->isCond()) {
            BasicBlock *truebranch, *falsebranch;
            truebranch = dynamic_cast<CondBrInstruction*>(last_inst)->getTrueBranch();
            falsebranch = dynamic_cast<CondBrInstruction*>(last_inst)->getFalseBranch();
            // 给当前block基本块设置后继block
            (*block)->addSucc(truebranch);
            (*block)->addSucc(falsebranch);
            // 给true和false基本块设置前继block
            truebranch->addPred(*block);
            falsebranch->addPred(*block);
        }
        // 无条件跳转指令，基本块中无条件跳转指令为空就提示函数要ret返回了
        else if (last_inst->isUncond()){
            BasicBlock* to = dynamic_cast<UncondBrInstruction*>(last_inst)->getBranch();
            (*block)->addSucc(to);
            to->addPred(*block);
            if(to->empty()){
                // 获取函数的返回值类型构建最后一个exit基本块
                if (dynamic_cast<FunctionType*>(se->getType())->getReturnType() == TypeSystem::intType){
                    Function *cur_func = (*block)->getParent();
                    BasicBlock *temp_block = new BasicBlock(cur_func);
                    new RetInstruction(new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0)), temp_block);
                    cur_func->insertBlock(temp_block);
                    cur_func->setExit(temp_block); // 设置基本块??
                    new RetInstruction(new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0)), to);
                }
                else if(dynamic_cast<FunctionType*>(se->getType())->getReturnType() == TypeSystem::floatType){
                    Function *cur_func = (*block)->getParent();
                    BasicBlock *temp_block = new BasicBlock(cur_func);
                    new RetInstruction(new Operand(new ConstantSymbolEntry(TypeSystem::floatType, 0)), temp_block);
                    cur_func->insertBlock(temp_block);
                    cur_func->setExit(temp_block); // 设置基本块??
                    new RetInstruction(new Operand(new ConstantSymbolEntry(TypeSystem::floatType, 0)), to);
                }
                // void类型
                else{
                    Function *cur_func = (*block)->getParent();
                    BasicBlock *temp_block = new BasicBlock(cur_func);
                    new RetInstruction(nullptr, temp_block);
                    cur_func->insertBlock(temp_block);
                    cur_func->setExit(temp_block); 
                    new RetInstruction(nullptr, to);
                }
            }
        }
        // 如果既不是跳转指令也不是返回指令就补充返回指令，同void类型
        else if (!last_inst->isRet()) {
            if ((dynamic_cast<FunctionType*>(se->getType())->getReturnType()) == TypeSystem::voidType){
                Function *cur_func = (*block)->getParent();
                BasicBlock *temp_block = new BasicBlock(cur_func);
                new RetInstruction(nullptr, temp_block);
                cur_func->insertBlock(temp_block);
                cur_func->setExit(temp_block);
                new RetInstruction(nullptr, *block);
            }
        }
    }
}
*/

// 待测试
void UnaryExpr::genCode()
{
    // 获取当前的基本块
    BasicBlock *bb = builder->getInsertBB();
    expr->genCode();
    Operand* src = expr->getOperand();

    if(op == NON){
        if(!src->getType()->isBool()){
            Operand* temp = new Operand(new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel()));
            new CmpInstruction(CmpInstruction::NE, temp, src, new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0)), bb);
            // 为了xor指令的实现，将src指令切换为bool类型
            src = temp;
        }
        new XorInstruction(dst, src, bb);
    }
    else if(op == ADD){
        Operand* src1 = new Operand(new ConstantSymbolEntry(dst->getType(), 0));
        Operand* src2 = expr->getOperand();
        if(src->getType()->isBool()){
            Operand* temp = new Operand(new TemporarySymbolEntry(TypeSystem::intType,SymbolTable::getLabel()));
            new ZextInstruction(temp, src2, bb);
            src2 = temp;
        }
        new BinaryInstruction(BinaryInstruction::ADD, dst, src1, src2, bb);
    }
    else if(op == SUB){
        Operand* src1 = new Operand(new ConstantSymbolEntry(dst->getType(), 0));
        Operand* src2 = expr->getOperand();
        if(src->getType()->isBool()){
            Operand* temp = new Operand(new TemporarySymbolEntry(TypeSystem::intType,SymbolTable::getLabel()));
            new ZextInstruction(temp, src2, bb);
            src2 = temp;
        }
        new BinaryInstruction(BinaryInstruction::ADD, dst, src1, src2, bb);
    }

    // 最好还是别用switch，有变量定义就用不了switch
    /*
    Operand* src = expr->getOperand(); // 获取expr的操作数
    // 用0构建二元表达式加，只不过如果是bool类型的一元表达式需要类型转换
    Operand* src1 = new Operand(new ConstantSymbolEntry(dst->getType(), 0));
    Operand* src2 = expr->getOperand();
    switch(op)
    {
        case NON:
            if(!src->getType()->isBool()){
                Operand* temp = new Operand(new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel()));
                new CmpInstruction(CmpInstruction::NE, temp, src, new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0)), bb);
                // 为了xor指令的实现，将src指令切换为bool类型
                src = temp;
            }
            new XorInstruction(dst, src, bb);
            break;
        case ADD:
            if(src->getType()->isBool()){
                Operand* temp = new Operand(new TemporarySymbolEntry(TypeSystem::intType,SymbolTable::getLabel()));
                new ZextInstruction(temp, src2, bb);
                src2 = temp;
            }
            new BinaryInstruction(BinaryInstruction::ADD, dst, src1, src2, bb);
            break;
        case SUB:
            // Operand* src1 = new Operand(new ConstantSymbolEntry(dst->getType(), 0));
            // Operand* src2 = expr->getOperand();
            if(src->getType()->isBool()){
                Operand* temp = new Operand(new TemporarySymbolEntry(TypeSystem::intType,SymbolTable::getLabel()));
                new ZextInstruction(temp, src2, bb);
                src2 = temp;
            }
            new BinaryInstruction(BinaryInstruction::ADD, dst, src1, src2, bb);
            break;
        default:
            break;
    }
    */
}

// 这里没有ExprNode的虚函数gencode，不知道能不能过存疑

void checkbool(Operand* tocheck, BasicBlock* bb){
    if (tocheck->getType()->isBool()) {
            Operand* temp = new Operand(new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel()));
            new ZextInstruction(temp, tocheck, bb);
            tocheck = temp;
    }
}

// 二元运算表达式
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
        true_list = expr2->trueList(); // Node节点给出的true list和false list
        false_list = merge(expr1->falseList(), expr2->falseList());
    }
    else if(op == OR)
    {
        // Todo
        // 对于OR的逻辑预算而言，同为false才能跳转到false branch上
        BasicBlock* falseBB = new BasicBlock(func);
        expr1->genCode();
        backPatch(expr1->falseList(), falseBB);
        builder->setInsertBB(falseBB);
        expr2->genCode();
        true_list = merge(expr1->trueList(), expr2->trueList());
        false_list = expr2->falseList();
    }
    // 包含所有关系运算的二元表达式
    else if(op >= LESS && op <= NOTEQUAL)
    {
        // Todo
        expr1->genCode();
        expr2->genCode();
        Operand *src1 = expr1->getOperand();
        Operand *src2 = expr2->getOperand();
        checkbool(src1, bb);
        checkbool(src2, bb);
        int opcode = -1;
        // 确定操作码
        switch(op)
        {
            case LESS:
                opcode = CmpInstruction::L;
                break;
            case GREATER:
                opcode = CmpInstruction::G;
                break;
            case LORE:
                opcode = CmpInstruction::LE;
                break;
            case GORE:
                opcode = CmpInstruction::GE;
                break;
            case EQUAL:
                opcode = CmpInstruction::E;
                break;
            case NOTEQUAL:
                opcode = CmpInstruction::NE;
                break;
            default:
                break;
        }
        new CmpInstruction(opcode, dst, src1, src2, bb);
        // 这块儿的逻辑怪怪的
        BasicBlock *truebb, *falsebb, *tempbb;
        //临时假块
        truebb = new BasicBlock(func);
        falsebb = new BasicBlock(func);
        tempbb = new BasicBlock(func);

        true_list.push_back(new CondBrInstruction(truebb, tempbb, dst, bb));
        false_list.push_back(new UncondBrInstruction(falsebb, tempbb));
        
        // 正确错误列表合并？？问问
        /*
        true_list = merge(expr1->trueList(), expr2->trueList());
        false_list = merge(expr1->falseList(), expr2->falseList());
        Instruction* temp = new CondBrInstruction(nullptr,nullptr,dst,bb);
        this->trueList().push_back(temp);
        this->falseList().push_back(temp);
        */
        
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
            case MUL:
                opcode = BinaryInstruction::MUL;
                break;
            case DIV:
                opcode = BinaryInstruction::DIV;
                break;
            case MOD:
                opcode = BinaryInstruction::MOD;
                break;
            default:
                break;
        }
        new BinaryInstruction(opcode, dst, src1, src2, bb);
    }
}

void Constant::genCode()
{
    // do nothing
}

void Id::genCode()
{
    // 这里目前只针对int和float型变量，如果要处理array还要进行增添
    BasicBlock *bb = builder->getInsertBB();
    Operand *addr = dynamic_cast<IdentifierSymbolEntry*>(symbolEntry)->getAddr();
    new LoadInstruction(dst, addr, bb);
}

void IfStmt::genCode()
{
    Function* func;
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
    Function *func;
    BasicBlock *then_bb, *else_bb, *end_bb;

    func = builder->getInsertBB()->getParent();
    then_bb = new BasicBlock(func);
    else_bb = new BasicBlock(func); 
    end_bb = new BasicBlock(func);

    cond->genCode();
    // ??
    if(!cond -> getOperand() -> getType() -> isBool()){}
    backPatch(cond->trueList(), then_bb);
    backPatch(cond->falseList(), else_bb);

    // 就是将所有的then bb和else bb都最后指向end bb的位置
    builder->setInsertBB(then_bb);
    thenStmt->genCode();
    then_bb = builder->getInsertBB();
    new UncondBrInstruction(end_bb, then_bb);

    builder->setInsertBB(else_bb);
    elseStmt->genCode();
    else_bb = builder->getInsertBB();
    new UncondBrInstruction(end_bb, else_bb);

    builder->setInsertBB(end_bb);
}

void CompoundStmt::genCode()
{
    // Todo
    if(stmt != nullptr)
        stmt->genCode();
    else;
}

void SeqNode::genCode()
{
    // Todo
    if(stmt1 != nullptr)
        stmt1->genCode();
    else;
    if(stmt2 != nullptr)
        stmt2->genCode();
    else;
}

void ExprStmt::genCode()
{
    expr->genCode();
}

void BlankStmt::genCode()
{
    // do nothing
}

void BreakStmt::genCode()
{
    // ??
    BasicBlock* bb = builder->getInsertBB();
    Function* func = bb->getParent();
    next_bb = ((WhileStmt*)whileStmt)->get_end_bb();
    new UncondBrInstruction(next_bb, bb);
    BasicBlock* break_next_bb = new BasicBlock(func);
    builder->setInsertBB(break_next_bb);
}

void WhileStmt::genCode()
{
    Function *func;
    BasicBlock *loop_bb, *end_bb , *cond_bb;  // 条件语句块，循环块，结束跳转块

    BasicBlock *bb = builder->getInsertBB();
    func = builder->getInsertBB()->getParent();
    cond_bb = new BasicBlock(func);
    this->cond_bb = cond_bb;

    // 给当前的基本块增加跳转指令跳转到cond_bb
    new UncondBrInstruction(cond_bb, bb);

    builder->setInsertBB(cond_bb);
    // 这里有完成类型转换嘛??
    cond->genCode();
    // ??
    if(!cond -> getOperand() -> getType() -> isBool()){}

    loop_bb = new BasicBlock(func);
    end_bb = new BasicBlock(func);
    this->loop_bb = loop_bb;
    this->end_bb = end_bb;

    // 生成完条件基本块后，就是循环块了
    backPatch(cond->trueList(), loop_bb);
    backPatch(cond->falseList(), end_bb);

    builder->setInsertBB(loop_bb);
    stmt->genCode();
    loop_bb = builder -> getInsertBB();
    new CondBrInstruction(cond_bb, end_bb, cond->getOperand(), loop_bb);

    builder->setInsertBB(end_bb);
}

void ContinueStmt::genCode()
{
    BasicBlock* bb = builder->getInsertBB();
    Function* func = bb->getParent();
    // 直接跳转到条件判断处
    next_bb = ((WhileStmt*)whileStmt)->get_cond_bb();
    new UncondBrInstruction(next_bb, bb);
    // 虽然已经设置好了跳转基本块，还是要按部就班往下继续生成代码
    BasicBlock* continue_next_bb = new BasicBlock(func);
    builder->setInsertBB(continue_next_bb);
}

// AllocaInstruction(Operand *dst, SymbolEntry *se, BasicBlock *insert_bb) : Instruction(ALLOCA, insert_bb)
// %t19 = alloca i32, align 4
// store i32 %t13, i32* %t20, align 4
// 这个也太难了吧
void DeclStmt::genCode()
{
    // 获得目前ID的符号表项
    IdentifierSymbolEntry *se = dynamic_cast<IdentifierSymbolEntry *>(id->getSymPtr());
    // 如果这个是全局变量就直接插入到编译单元unit里处理
    if(se->isGlobal()){
        Operand* addr;
        SymbolEntry* addr_se;
        addr_se = new IdentifierSymbolEntry(*se);
        addr_se->setType(new PointerType(se->getType()));
        addr = new Operand(addr_se);
        se->setAddr(addr);
        unit.insertGlobal(se);
    }
    else if(se->isLocal() || se->isParam()){
        Function* func = builder->getInsertBB()->getParent();
        BasicBlock* entry = func->getEntry();
        Instruction* alloca;
        Operand* addr;
        SymbolEntry* addr_se;
        Type* type;

        type = new PointerType(se->getType());
        // 用Identifier应该也行吧
        addr_se = new TemporarySymbolEntry(type, SymbolTable::getLabel());
        addr = new Operand(addr_se);
        alloca = new AllocaInstruction(addr, se);                   
        entry->insertFront(alloca); 
        // 如果是参数需要store指令
        Operand* temp = nullptr;
        if (se->isParam()){
            temp = se->getAddr();
            BasicBlock* bb = builder->getInsertBB();
            new StoreInstruction(addr, temp, bb);
        }
        se->setAddr(addr);
        // 如果有初始值需要store指令                   
        if (expr){
            BasicBlock* bb = builder->getInsertBB();
            expr->genCode();
            Operand* src = expr->getOperand();
            new StoreInstruction(addr, src, bb);
        }
    }
    // 如果使用了逗号隔开
    if (this->getNext() != nullptr){
        this->getNext()->genCode();
    }
}

// RetInstruction(Operand *src, BasicBlock *insert_bb) : Instruction(RET, insert_bb)
void ReturnStmt::genCode()
{
    // Todo
    BasicBlock* bb = builder->getInsertBB();
    Operand* src = nullptr;
    retValue->genCode();
    src = retValue->getOperand();
    new RetInstruction(src, bb);
}

// StoreInstruction(Operand *dst_addr, Operand *src, BasicBlock *insert_bb) : Instruction(STORE, insert_bb)
// store i32 %t13, i32* %t20, align 4
void AssignStmt::genCode()
{
    BasicBlock *bb = builder->getInsertBB();
    expr->genCode();
    Operand *addr = dynamic_cast<IdentifierSymbolEntry*>(lval->getSymPtr())->getAddr();
    Operand *src = expr->getOperand();
    // We haven't implemented array yet, the lval can only be ID. So we just store the result of the `expr` to the addr of the id.
    // If you want to implement array, you have to caculate the address first and then store the result into it.
    new StoreInstruction(addr, src, bb);
    // 看起来需要补充数组
}

// CallInstruction(Operand* dst, SymbolEntry* func, std::vector<Operand*> params, BasicBlock* insert_bb = nullptr);
void CallExpr::genCode()
{
    std::vector<Operand*> params;
    ExprNode* temp = param;
    while (temp != nullptr) {
        temp->genCode();
        params.push_back(temp->getOperand());
        temp = ((ExprNode*)temp->getNext());
    }
    BasicBlock* bb = builder->getInsertBB();
    new CallInstruction(dst, symbolEntry, params, bb);
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

void Constant::typeCheck()
{

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
    // 不在这里做typecheck, 统一在install中实现id的typecheck

    /*
    std::string name = this->getId()->getSymPtr()->toStr();
    if (identifiers->checkRepeat(name)) {  // 判断是否在同一作用域下重复声明
        fprintf(stderr,"DeclStmt %s 重复声明\n", name.c_str());
    }

    if (expr) {
        expr->typeCheck();
    }
    */
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
        retValue->typeCheck();
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
    if(whileStmt == nullptr){
        fprintf(stderr, "break语句不处于while循环范围内\n");
    }
}

void ContinueStmt::typeCheck()
{
    if(whileStmt == nullptr){
        fprintf(stderr, "continue语句不处于while循环范围内\n");
    }
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
        fprintf(stderr, "函数 %s 返回类型错误\n", name.c_str());
        // exit(EXIT_FAILURE);
    }

    if (this->decl != NULL) this->decl->typeCheck();  // 检查函数形参
    
    this->stmt->typeCheck();  // 检查函数体
    if (!this->stmt->getHaveRetStmt() && se->getType()->toStr() != "void") {
        fprintf(stderr, "函数 %s 缺少 return 语句\n", name.c_str());
    } 

    if (identifiers->lookup(name) == nullptr) {  // 检查未定义问题
        fprintf(stderr,"函数 %s 未被定义\n", name.c_str());
    }
}

void CallExpr::typeCheck()  // 会在CallExpr构造函数中被调用
{
    // fprintf(stderr, "CallExpr %s typeCheck\n", this->symbolEntry->toStr().c_str());
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
            // std::vector<SymbolEntry*> rParams = ((FunctionType*)this->type)->getParams();  不能用this->type! 报 terminate called after throwing an instance of 'std::bad_alloc'
            for (auto it : ((FunctionType*)func->getType())->getParams()) {
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
        // fprintf(stderr, "函数 %s 调用失败, 形参及实参类型不一致\n", this->getSymPtr()->toStr().c_str());
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

void Constant::output(int level)
{

}

void Id::output(int level)
{
    std::string name, type;
    int scope;
    name = symbolEntry->toStr();
    type = symbolEntry->getType()->toStr();
    scope = dynamic_cast<IdentifierSymbolEntry *>(symbolEntry)->getScope();
    fprintf(yyout, "%*cId\tname: %s\tscope: %d\ttype: %s\n", level, ' ', name.c_str(), scope, type.c_str());
}

void ImplicitCastExpr::output(int level)
{
    fprintf(yyout, "%*cImplictCastExpr\ttype: %s to %s\n", level, ' ', expr->getType()->toStr().c_str(), type->toStr().c_str());
    this->expr->output(level + 4);
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

DeclStmt::DeclStmt(Id *id, ExprNode *expr) : id(id) { this->expr = expr; }; // 这里可能要改??

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
    fprintf(yyout, "%*cFunctionDefine function name: %s, type: %s\n", level, ' ', name.c_str(), type.c_str());
    if (decl)
    {
        decl->output(level + 4);
    }
    stmt->output(level + 4);
}



//------------------------------------------  一些额外的函数  ------------------------------------------//

BinaryExpr::BinaryExpr(SymbolEntry* se, int op, ExprNode* expr1, ExprNode* expr2) : ExprNode(se), op(op), expr1(expr1), expr2(expr2)
{
    dst = new Operand(se);
    std::string op_str;
 
    // 对于cond需要隐式转换
    if (op >= BinaryExpr::AND && op <= BinaryExpr::NOTEQUAL) {
        type = TypeSystem::boolType;
        if (op == BinaryExpr::AND || op == BinaryExpr::OR) {
            if (expr1->getType()->isInt()) {
                ImplicitCastExpr* temp = new ImplicitCastExpr(expr1);
                this->expr1 = temp;
            }
            if (expr2->getType()->isInt()) {
                ImplicitCastExpr* temp = new ImplicitCastExpr(expr2);
                this->expr2 = temp;
            }
        }
    }
    else {
        type = TypeSystem::intType;
    }
};

ImplicitCastExpr::ImplicitCastExpr(ExprNode* expr) : ExprNode(nullptr), expr(expr)
{
    type = TypeSystem::boolType;
    symbolEntry = new TemporarySymbolEntry(type, SymbolTable::getLabel());
    dst = new Operand(symbolEntry);
}

ExprNode* ExprNode::copy() {
    ExprNode* ret = nullptr;
    ExprNode* temp = this;
    if (temp->getNext()) {
        ret->cleanNext();
        temp = (ExprNode*)(temp->getNext());
        ret->setNext(temp->copy());
    }
    return ret;
}

int UnaryExpr::getValue()
{
    int value = 0;
    switch (op) {
        case NON:
            value = !(expr->getValue());
            break;
        case SUB:
            value = -(expr->getValue());
            break;
    }
    return value;
}

int BinaryExpr::getValue()
{
    int value = 0;
    switch (op) {
        case ADD:
            value = expr1->getValue() + expr2->getValue();
            break;
        case SUB:
            value = expr1->getValue() - expr2->getValue();
            break;
        case MUL:
            value = expr1->getValue() * expr2->getValue();
            break;
        case DIV:
            if(expr2->getValue())
                value = expr1->getValue() / expr2->getValue();
            else fprintf(stderr, "被除数为0, 错误");
            break;
        case MOD:
            value = expr1->getValue() % expr2->getValue();
            break;
        case AND:
            value = expr1->getValue() && expr2->getValue();
            break;
        case OR:
            value = expr1->getValue() || expr2->getValue();
            break;
        case LESS:
            value = expr1->getValue() < expr2->getValue();
            break;
        case LORE:
            value = expr1->getValue() <= expr2->getValue();
            break;
        case GREATER:
            value = expr1->getValue() > expr2->getValue();
            break;
        case GORE:
            value = expr1->getValue() >= expr2->getValue();
            break;
        case EQUAL:
            value = expr1->getValue() == expr2->getValue();
            break;
        case NOTEQUAL:
            value = expr1->getValue() != expr2->getValue();
            break;
    }
    return value;
}

int Constant::getValue() {
    if (this->getSymPtr()->getType()->isInt()) return ((ConstantSymbolEntry*)this->getSymPtr())->getiValue();
    else return ((ConstantSymbolEntry*)this->getSymPtr())->getfValue();
}

int Id::getValue() {
    if (this->getSymPtr()->getType()->isInt()) return ((IdentifierSymbolEntry*)this->getSymPtr())->getiValue();
    else return ((IdentifierSymbolEntry*)this->getSymPtr())->getfValue();
}