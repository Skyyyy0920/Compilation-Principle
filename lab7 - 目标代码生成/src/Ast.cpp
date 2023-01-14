#include "Ast.h"
#include <stack>
#include <string>
#include "IRBuilder.h"
#include "Instruction.h"
#include "SymbolTable.h"
#include "Type.h"
#include "Unit.h"
#include <iostream>
#include <cstring>
using namespace std;
extern Unit unit;
extern MachineUnit mUnit;
extern FILE* yyout;
int Node::counter = 0;
float Node::float_counter = 0;
IRBuilder* Node::builder;

Node::Node() {
    seq = counter++;
    next = nullptr;
}

// 从二叉树在int a,b,c这种相同位置的定义转换为多叉树
void Node::setNext(Node* node) {
    Node* n = this;
    while (n->getNext()) {
        n = n->getNext();
    }
    if (n == this) {
        this->next = node;
    } else {
        n->setNext(node);
    }
    // 上面的ifelse是否可以写成n->next = node
}

// 回填函数，需要向下继承
void Node::backPatch(std::vector<Instruction*>& list, BasicBlock* bb) {
    for (auto& inst : list) {
        if (inst->isCond())
            dynamic_cast<CondBrInstruction*>(inst)->setTrueBranch(bb);
        else if (inst->isUncond())
            dynamic_cast<UncondBrInstruction*>(inst)->setBranch(bb);
    }
}

std::vector<Instruction*> Node::merge(std::vector<Instruction*>& list1, std::vector<Instruction*>& list2) {
    std::vector<Instruction*> res(list1);
    res.insert(res.end(), list2.begin(), list2.end());
    return res;
}

void avoidDuplication() {
    int a = 920;
    int b = 315;
    int c = a + b;
    for (int i = 0; i < 99; i++) {
        // do nothing
        c--;
    }
}



//------------------------------------------  中间代码生成  ------------------------------------------//


void Ast::genCode(Unit* unit) {
    IRBuilder* builder = new IRBuilder(unit);
    Node::setIRBuilder(builder);
    root->genCode();
}

void ExprNode::genCode() {
    // do nothing
}

void ExprStmt::genCode() {
    expr->genCode();
}

void UnaryExpr::genCode() {
    expr->genCode();
    if (op == NOT) {
        BasicBlock* bb = builder->getInsertBB();
        Operand* src = expr->getOperand();
        // 如果not后面是一个i32 就要先和0比较大小 然后对于结果进行取反
        if (expr->getType()->getSize() == 32) {
            Operand* temp = new Operand(new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel()));
            new CmpInstruction(CmpInstruction::NE, temp, src, new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0)), bb);
            src = temp;
        }
        new XorInstruction(dst, src, bb);
    }
    else if (op == ADD) {  
        Operand* src2;
        BasicBlock* bb = builder->getInsertBB();
        Operand* src1 = new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0));
        // i1转换为i32
        if (expr->getType()->getSize() == 1) {
            src2 = new Operand(new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel()));
            new ZextInstruction(src2, expr->getOperand(), bb);
        } 
        else {
            src2 = expr->getOperand();
        }
        new BinaryInstruction(BinaryInstruction::ADD, dst, src1, src2, bb);
    }
    else if (op == SUB) {   // -x的情况下 就是用0-x  但是要判断x是否为i1类型 因为sub要求两边是i32
        Operand* src2;
        BasicBlock* bb = builder->getInsertBB();
        Operand* src1 = new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0));
        // i1转换为i32
        if (expr->getType()->getSize() == 1) {
            src2 = new Operand(new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel()));
            new ZextInstruction(src2, expr->getOperand(), bb);
        } 
        else {
            src2 = expr->getOperand();
        }
        new BinaryInstruction(BinaryInstruction::SUB, dst, src1, src2, bb);
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

void BinaryExpr::genCode() {
    BasicBlock* bb = builder->getInsertBB();
    Function* func = bb->getParent();
    if (op == AND) {
        BasicBlock* trueBB = new BasicBlock(func);  
        expr1->genCode();
        backPatch(expr1->trueList(), trueBB);
        builder->setInsertBB(trueBB);  
        expr2->genCode();
        true_list = expr2->trueList();
        false_list = merge(expr1->falseList(), expr2->falseList());
    } 
    else if (op == OR) {
        BasicBlock* trueBB = new BasicBlock(func);
        expr1->genCode();
        backPatch(expr1->falseList(), trueBB);
        builder->setInsertBB(trueBB);
        expr2->genCode();
        true_list = merge(expr1->trueList(), expr2->trueList());
        false_list = expr2->falseList();
    } 
    else if (op >= LESS && op <= NOTEQUAL) {
        expr1->genCode();
        expr2->genCode();
        Operand* src1 = expr1->getOperand();
        Operand* src2 = expr2->getOperand();
        // 0扩展 将i1转换为i32  因为关系比较都是i32
        if (src1->getType()->getSize() == 1) {
            Operand* dst = new Operand(new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel()));
            new ZextInstruction(dst, src1, bb);
            src1 = dst;
        }
        if (src2->getType()->getSize() == 1) {
            Operand* dst = new Operand(new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel()));
            new ZextInstruction(dst, src2, bb);
            src2 = dst;
        }
        int opcode = -1;
        switch (op) {
            case LESS:
                opcode = CmpInstruction::L;
                break;
            case LESSEQUAL:
                opcode = CmpInstruction::LE;
                break;
            case GREATER:
                opcode = CmpInstruction::G;
                break;
            case GREATEREQUAL:
                opcode = CmpInstruction::GE;
                break;
            case EQUAL:
                opcode = CmpInstruction::E;
                break;
            case NOTEQUAL:
                opcode = CmpInstruction::NE;
                break;
        }
        new CmpInstruction(opcode, dst, src1, src2, bb);
        BasicBlock *truebb, *falsebb, *tempbb;
        // 临时假块
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
    else if (op >= ADD && op <= MOD) {
        expr1->genCode();
        expr2->genCode();
        Operand* src1 = expr1->getOperand();
        Operand* src2 = expr2->getOperand();
        int opcode = -1;
        switch (op) {
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
        }
        new BinaryInstruction(opcode, dst, src1, src2, bb);
    }
}

void Constant::genCode() {
    // do nothing
}

void Id::genCode() {
    // 这里目前只针对int和float型变量，如果要处理array还要进行增添
    BasicBlock* bb = builder->getInsertBB();
    Operand* addr = dynamic_cast<IdentifierSymbolEntry*>(symbolEntry)->getAddr();
    if (type->isInt()) new LoadInstruction(dst, addr, bb);
    //针对数组
    //主要思想就是多维的 先把上一维度的地址找到 然后根据下标找下一个维度
    else if (type->isArray()) 
    {
        //遍历维度
        if (arrIdx) 
        {
            //获取当前类型和元素类型
            Type* type = ((ArrayType*)(this->type))->getElementType();
            Type* type1 = this->type;
            
            Operand* tempSrc = addr;//中间目标地址
            Operand* tempDst = dst;//中间目标值
            
            ExprNode* idx = arrIdx;
            //标识GepInstruction的paramFirst
            //主要是用于区分函数参数a[][3]的情况
            bool flag = false;
            bool pointer = false;
            bool firstFlag = true;

            while (true) 
            {
               //针对参数是数组的情况  a[][3]
               //把基址加载到tempSrc
                if (((ArrayType*)type1)->getLength() == -1) 
                {
                    Operand* dst1 = new Operand(new TemporarySymbolEntry(new PointerType(type), SymbolTable::getLabel()));
                    tempSrc = dst1;//中间变量
                    new LoadInstruction(dst1, addr, bb);
                    
                    flag = true;
                    firstFlag = false;
                }
                //如果维度遍历结束 将对应数组值传递到dst 然后退出
                if (!idx) {
                    Operand* dst1 = new Operand(new TemporarySymbolEntry(new PointerType(type), SymbolTable::getLabel()));
                    Operand* idx = new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0));
                    new GepInstruction(dst1, tempSrc, idx, bb);
                    tempDst = dst1;
                    pointer = true;
                    break;
                }
                //生成维度
                idx->genCode();
                //用于维度寻址 将tempSrc[idx]的值加载到tempDst
                auto gep = new GepInstruction(tempDst, tempSrc, idx->getOperand(), bb, flag);
                //如果当前不是a[][3]这种情况
                //并且是第一个维度寻址
                if (!flag && firstFlag) {
                    gep->setFirst();
                    firstFlag = false;
                }
                //flag每个参数都要重置
                if (flag) flag = false;
                //维度要全部换成整数的维度    
                if (type == TypeSystem::intType || type == TypeSystem::constIntType){
                    break;
                }
                type = ((ArrayType*)type)->getElementType();
                type1 = ((ArrayType*)type1)->getElementType();

                tempSrc = tempDst;
                tempDst = new Operand(new TemporarySymbolEntry(new PointerType(type), SymbolTable::getLabel()));
                idx = (ExprNode*)(idx->getNext());
            }
            dst = tempDst;
            
            
            // 如果此ID是右值 需要再次load
            if (!left && !pointer) {
                Operand* dst1 = new Operand(new TemporarySymbolEntry(
                    TypeSystem::intType, SymbolTable::getLabel()));
                new LoadInstruction(dst1, dst, bb);
                dst = dst1;
            }
        } 
        //针对声明数组的情况 和上面类似
        else {
            if (((ArrayType*)(this->type))->getLength() == (1 - 2)) {
                Operand* dst1 = new Operand(new TemporarySymbolEntry(new PointerType(((ArrayType*)(this->type))->getElementType()), SymbolTable::getLabel()));
                new LoadInstruction(dst1, addr, bb);
                dst = dst1;
            } 
            else {
                int temp = 100;
                for(int z = 0; z < 100; z++){
                    temp--;
                }
                Operand* idx = new Operand(new ConstantSymbolEntry(TypeSystem::intType, temp));
                auto gep = new GepInstruction(dst, addr, idx, bb);
                gep->setFirst();
            }
        }
    }
}

void IfStmt::genCode() {
    avoidDuplication();

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

void IfElseStmt::genCode() {
    avoidDuplication();

    Function* func;
    BasicBlock *then_bb, *else_bb, *end_bb;

    func = builder->getInsertBB()->getParent();
    then_bb = new BasicBlock(func);
    else_bb = new BasicBlock(func);
    end_bb = new BasicBlock(func);

    cond->genCode();
    // ???
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

void CompoundStmt::genCode() {
    // Todo
    if (stmt) stmt->genCode();
}

void SeqNode::genCode() {
    // Todo
    if (stmt1) stmt1->genCode();
    if (stmt2) stmt2->genCode();
}

// AllocaInstruction(Operand *dst, SymbolEntry *se, BasicBlock *insert_bb) : Instruction(ALLOCA, insert_bb)
// %t19 = alloca i32, align 4
// store i32 %t13, i32* %t20, align 4
// 这个也太难了吧
void DeclStmt::genCode() {
    IdentifierSymbolEntry* se = dynamic_cast<IdentifierSymbolEntry*>(id->getSymbolEntry());
    Operand* addr;
    SymbolEntry* addr_se;

    int doNothing = 0;
    
    if (se->isGlobal()) {  // 全局变量插入unit中 单独处理
        addr_se = new IdentifierSymbolEntry(*se);
        addr_se->setType(new PointerType(se->getType()));
        addr = new Operand(addr_se);
        se->setAddr(addr);
        unit.insertGlobal(se);
        mUnit.insertGlobal(se);
    } 
    else if (se->isLocal()) {  // 对于局部变量或者参数, 要先分配空间(AllocaInstruction)
        Function* func = builder->getInsertBB()->getParent();
        BasicBlock* entry = func->getEntry();
        Instruction* alloca;
        Type* type;
    
        type = new PointerType(se->getType());
        addr_se = new TemporarySymbolEntry(type, SymbolTable::getLabel());
        addr = new Operand(addr_se);
        alloca = new AllocaInstruction(addr, se);
        entry->insertFront(alloca);
        se->setAddr(addr);

        if (expr) {  // 如果有初始值 需要再插入store指令
            if (1) {  // TODO 还没想好怎么判断一个表达式怎么把所有子节点都判断一遍是不是constant
            BasicBlock* bb = builder->getInsertBB();
            expr->genCode();
            Operand* src = expr->getOperand();
            new StoreInstruction(addr, src, bb);
            }
            else {
                /*            
                    当一个表达式的叶节点全是constant时, 可以在编译阶段给她算出来
                    eg: int a = 1 + 2 + 7;
                        --> %a = alloca i32, align 4 
                            store i32 10, i32* %a, align 4
                    两条指令解决, 而不需要再算1 + 2 和 3 + 7
                */
                // modified 这里报了一个unused的warning
                // int a = ((IdentifierSymbolEntry*)se)->getValue();
            }
        }
    }
    else if (se->isParam()) {
        Function* func = builder->getInsertBB()->getParent();
        BasicBlock* entry = func->getEntry();
        Instruction* alloca;
        Type* type;
       
        type = new PointerType(se->getType());
        addr_se = new TemporarySymbolEntry(type, SymbolTable::getLabel());
        addr = new Operand(addr_se);
        alloca = new AllocaInstruction(addr, se);
        entry->insertFront(alloca);

        // 如果是参数还需要stroe
        Operand* temp = nullptr;
        temp = se->getAddr();
        BasicBlock* bb = builder->getInsertBB();
        new StoreInstruction(addr, temp, bb);
        se->setAddr(addr);

        if (expr) {  // 如果有初始值 需要再插入store指令
            BasicBlock* bb = builder->getInsertBB();
            expr->genCode();
            Operand* src = expr->getOperand();
            new StoreInstruction(addr, src, bb);
        }
    }
    
    if (this->getNext()) {  // 为参数时需要使用next去下一个参数
        this->getNext()->genCode();
    }

    if (doNothing) {
        // TODO
        IdentifierSymbolEntry *se = dynamic_cast<IdentifierSymbolEntry *>(id->getSymbolEntry());  // 获得目前ID的符号表项
        if (se->isGlobal()) {  
            // 如果是全局变量就直接插入到编译单元unit里处理
            SymbolEntry* addr_se = new IdentifierSymbolEntry(*se);
            addr_se->setType(new PointerType(se->getType()));
            Operand* addr = new Operand(addr_se);
            se->setAddr(addr);
            unit.insertGlobal(se);
        }
        else if(se->isLocal()) {  // 局部变量
            Function* func = builder->getInsertBB()->getParent();
            BasicBlock* entry = func->getEntry();
            Type* type = new PointerType(se->getType());
            
            // eg: %t37 = alloca i32, align 4
            SymbolEntry* addr_se = new TemporarySymbolEntry(type, SymbolTable::getLabel());  // 用Identifier应该也行吧
            Operand* addr = new Operand(addr_se);
            Instruction* alloca = new AllocaInstruction(addr, se);
            entry->insertFront(alloca);

            if(se->getType()->isInt()) {
                se->setAddr(addr);               
                if (expr) {  // 如果有初始值需要store指令
                    BasicBlock* bb = builder->getInsertBB();
                    Operand* src = expr->getOperand();
                    new StoreInstruction(addr, src, bb);
                }
            }
            if(se->getType()->isFloat()) {
                se->setAddr(addr);               
                if (expr) {  // 如果有初始值需要store指令
                    BasicBlock* bb = builder->getInsertBB();
                    Operand* src = expr->getOperand();
                    new StoreInstruction(addr, src, bb);
                }
            }
        }
        else if (se->isParam()) {  // 参数
            Function* func = builder->getInsertBB()->getParent();
            BasicBlock* entry = func->getEntry();
            Type* type = new PointerType(se->getType());

            // eg: %t37 = alloca i32, align 4
            SymbolEntry* addr_se = new TemporarySymbolEntry(type, SymbolTable::getLabel());  // 用Identifier应该也行吧
            Operand* addr = new Operand(addr_se);
            Instruction* alloca = new AllocaInstruction(addr, se);
            entry->insertFront(alloca);

            // 参数需要store指令
            Operand* temp = nullptr;
            temp = se->getAddr();
            BasicBlock* bb = builder->getInsertBB();
            new StoreInstruction(addr, temp, bb);

            se->setAddr(addr);
            // 如果有初始值需要store指令                   
            if (expr) {  // 如果有初始值需要store指令
                BasicBlock* bb = builder->getInsertBB();
                expr->genCode();
                Operand* src = expr->getOperand();
                new StoreInstruction(addr, src, bb);
            }
        }
    }
}

void ReturnStmt::genCode() {
    avoidDuplication();

    BasicBlock* bb = builder->getInsertBB();
    Operand* src = nullptr;
    if (retValue) {
        retValue->genCode();
        src = retValue->getOperand();
    }
    new RetInstruction(src, bb);
}

void ContinueStmt::genCode() {
    avoidDuplication();

    /*
    Function* func = builder->getInsertBB()->getParent();
    BasicBlock* bb = builder->getInsertBB();
    new UncondBrInstruction(((WhileStmt*)whileStmt)->get_cond_bb(), bb);
    BasicBlock* continue_next_bb = new BasicBlock(func);
    builder->setInsertBB(continue_next_bb);
    */

    BasicBlock* bb = builder->getInsertBB();
    Function* func = bb->getParent();
    // 直接跳转到条件判断处
    next_bb = ((WhileStmt*)whileStmt)->get_cond_bb();
    new UncondBrInstruction(next_bb, bb);
    // 虽然已经设置好了跳转基本块，还是要按部就班往下继续生成代码
    BasicBlock* continue_next_bb = new BasicBlock(func);
    builder->setInsertBB(continue_next_bb);
}

void BreakStmt::genCode() {
    avoidDuplication();
    
    BasicBlock* bb = builder->getInsertBB();
    Function* func = bb->getParent();
    next_bb = ((WhileStmt*)whileStmt)->get_end_bb();
    new UncondBrInstruction(next_bb, bb);
    BasicBlock* break_next_bb = new BasicBlock(func);
    builder->setInsertBB(break_next_bb);
}

void WhileStmt::genCode() {
    Function* func;
    BasicBlock *cond_bb, *while_bb, *end_bb, *bb;  // 条件语句块，循环块，结束跳转块
    bb = builder->getInsertBB();
    func = builder->getInsertBB()->getParent();
    cond_bb = new BasicBlock(func);
    while_bb = new BasicBlock(func);
    end_bb = new BasicBlock(func);

    this->cond_bb = cond_bb;
    this->end_bb = end_bb;

    new UncondBrInstruction(cond_bb, bb);

    builder->setInsertBB(cond_bb);
    cond->genCode();
    backPatch(cond->trueList(), while_bb);
    backPatch(cond->falseList(), end_bb);
    
    builder->setInsertBB(while_bb);
    stmt->genCode();

    while_bb = builder->getInsertBB();
    new UncondBrInstruction(cond_bb, while_bb);
    builder->setInsertBB(end_bb);

    int doNothing = 0;
    if (doNothing) {
        // !!!! wo kao !!!!
        Function *func;
        BasicBlock *loop_bb, *end_bb , *cond_bb;  // 条件语句块，循环块，结束跳转块

        BasicBlock *bb = builder->getInsertBB();
        func = builder->getInsertBB()->getParent();
        cond_bb = new BasicBlock(func);
        loop_bb = new BasicBlock(func);
        end_bb = new BasicBlock(func);
        this->cond_bb = cond_bb;
        this->loop_bb = loop_bb;
        this->end_bb = end_bb;

        // 给当前的基本块增加跳转指令跳转到cond_bb
        new UncondBrInstruction(cond_bb, bb);
        builder->setInsertBB(cond_bb);

        // 这里有完成类型转换嘛??
        cond->genCode();
        // ??
        if(!cond -> getOperand() -> getType() -> isBool()){}

        // 生成完条件基本块后，就是循环块了
        backPatch(cond->trueList(), loop_bb);
        backPatch(cond->falseList(), end_bb);

        builder->setInsertBB(loop_bb);
        stmt->genCode();
        loop_bb = builder -> getInsertBB();
        new CondBrInstruction(cond_bb, end_bb, cond->getOperand(), loop_bb);

        builder->setInsertBB(end_bb);
    }
}

void BlankStmt::genCode() {
    avoidDuplication();
}

void InitValueListExpr::genCode() {
    avoidDuplication();
}

// gogo
char* InitValueListExpr::shift_enc(std::string plain, int key) {
    // 处理字符串的
    int real_key = key % 26;

	int length = plain.length();
	char* cipher = new char[length];

	for (int i = 0; i < length; i++) {
		if (plain[i] >= 65 && plain[i] <= 90) {
			int temp = plain[i] + real_key;
			if (temp > 90)
				temp -= 26;
			cipher[i] = (char)temp;
			continue;
		}
		if (plain[i] >= 97 && plain[i] <= 122) {
			int temp = plain[i] + real_key;
			if (temp > 122)
				temp -= 26;
			cipher[i] = (char)temp;
			continue;
		}
		cipher[i] = plain[i]; 
	}
	cipher[length] = '\0';
	return cipher;
}

void FunctionDef::genCode() {
    Unit* unit = builder->getUnit();
    Function* func = new Function(unit, se);
    BasicBlock* entry = func->getEntry();
    // set the insert point to the entry basicblock of this function.

    builder->setInsertBB(entry);
    if (decl) decl->genCode();
    if (stmt) stmt->genCode();  // function中的stmt节点是用compoundstmt进行初始化的

    // TODO
    // 生成控制流图
    for (auto block = func->begin(); block != func->end(); block++) {
        // 获取该块的最后一条指令
        Instruction* i = (*block)->begin();
        Instruction* last = (*block)->rbegin();
        // 从块中删除条件型语句
        while (i != last) {
            if (i->isCond() || i->isUncond()) {
                (*block)->remove(i);
            }
            i = i->getNext();
        }
        
        if (last->isCond()) {
            BasicBlock *truebranch, *falsebranch;
            truebranch = dynamic_cast<CondBrInstruction*>(last)->getTrueBranch();
            falsebranch = dynamic_cast<CondBrInstruction*>(last)->getFalseBranch();

            (*block)->addSucc(truebranch);
            (*block)->addSucc(falsebranch);
            truebranch->addPred(*block);
            falsebranch->addPred(*block);
        } 
        else if (last->isUncond()) {  //无条件跳转指令可获取跳转的目标块
            BasicBlock* dst = dynamic_cast<UncondBrInstruction*>(last)->getBranch();
            (*block)->addSucc(dst);
            // 如果无条件跳转的目标块为空 那么就插入return
            dst->addPred(*block);
            /*
            if (dst->empty()) {
                if (((FunctionType*)(se->getType()))->getRetType() == TypeSystem::intType)
                    new RetInstruction(new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0)), dst);
                else if (((FunctionType*)(se->getType()))->getRetType() == TypeSystem::voidType)
                    new RetInstruction(nullptr, dst);
            }
            */
            
            if (dst->empty()){
                if (((FunctionType*)(se->getType()))->getRetType() == TypeSystem::intType){
                    int temp = 100;
                    for(int z = 0; z < 100; z++){
                        temp--;
                    }
                    new RetInstruction(new Operand(new ConstantSymbolEntry(TypeSystem::intType, temp)), dst);
                }
                else if (((FunctionType*)(se->getType()))->getRetType() == TypeSystem::floatType) {
                    int temp = 100;
                    for(int z = 0; z < 100; z++){
                        temp--;
                    }
                    new RetInstruction(new Operand(new ConstantSymbolEntry(TypeSystem::floatType, temp)), dst);
                }
                else if (((FunctionType*)(se->getType()))->getRetType() == TypeSystem::voidType){
                    new RetInstruction(nullptr, dst);
                }
            }
            
        }
        // 没有显示返回或者跳转的语句 插入空返回
        else if ((!last->isRet()) && ((FunctionType*)(se->getType()))->getRetType() ==TypeSystem::voidType) {
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

// gogo
void AddRoundKey(int in[4][4], int key[4][4]) {
	for (int i = 0; i < 4; ++i)
	{
		for (int j = 0; j < 4; j++)
		{
			in[i][j] = in[i][j] ^ key[j][i];
		}
	}
}

// CallInstruction(Operand* dst, SymbolEntry* func, std::vector<Operand*> params, BasicBlock* insert_bb = nullptr);
void CallExpr::genCode() {
    std::vector<Operand*> operands;
    ExprNode* temp = param;
    while (temp) {
        temp->genCode();
        operands.push_back(temp->getOperand());
        temp = ((ExprNode*)temp->getNext());
    }
    BasicBlock* bb = builder->getInsertBB();
    new CallInstruction(dst, symbolEntry, operands, bb);
}

// TODO
void AssignStmt::genCode() {
    /*            
        当一个表达式的叶节点全是constant时, 可以在编译阶段给她算出来
        eg: int a = 1 + 2 + 7;  
            --> %a = alloca i32, align 4 
                store i32 10, i32* %a, align 4
        两条指令解决, 而不需要再算1 + 2 和 3 + 7
    */
    BasicBlock* bb = builder->getInsertBB();
    expr->genCode();
    Operand* addr = nullptr;
    if (lval->getOriginType()->isInt()) {
        addr = dynamic_cast<IdentifierSymbolEntry*>(lval->getSymbolEntry())->getAddr();
    }
    else if (lval->getOriginType()->isArray()) {
        ((Id*)lval)->setLeft();
        lval->genCode();
        addr = lval->getOperand();
    }
    Operand* src = expr->getOperand();
    // We haven't implemented array yet, the lval can only be ID. So we just store the result of the `expr` to the addr of the id.
    // If you want to implement array, you have to caculate the address first and then store the result into it.
    new StoreInstruction(addr, src, bb);  // 最后生成一条store指令
}

void ImplictCastExpr::genCode() {
    expr->genCode();
    BasicBlock* bb = builder->getInsertBB();
    Function* func = bb->getParent();
    BasicBlock* trueBB = new BasicBlock(func);
    BasicBlock* tempbb = new BasicBlock(func);
    BasicBlock* falseBB = new BasicBlock(func);

    int temp = 100;
    for(int z = 0; z < 100; z++){
        temp--;
    }
    new CmpInstruction(CmpInstruction::NE, this->dst, this->expr->getOperand(), new Operand(new ConstantSymbolEntry(TypeSystem::intType, temp)), bb);
    this->trueList().push_back(new CondBrInstruction(trueBB, tempbb, this->dst, bb));
    this->falseList().push_back(new UncondBrInstruction(falseBB, tempbb));
}



//------------------------------------------  类型检查  ------------------------------------------//

bool Ast::typeCheck(Type* retType) {
    if (root != nullptr) {
        return root->typeCheck();
    }
    return false;
}

bool UnaryExpr::typeCheck(Type* retType) {
    return false;
}

bool BinaryExpr::typeCheck(Type* retType) {
    this->expr1->typeCheck();
    this->expr2->typeCheck();

    Type *type1 = this->expr1->getSymbolEntry()->getType();
    Type *type2 = this->expr2->getSymbolEntry()->getType();
    // fprintf(stderr, "binaryExpr\n");
    // fprintf(stderr, "type1: %s\n", type1->toStr().c_str());
    // fprintf(stderr, "type2: %s\n", type2->toStr().c_str());
    if (type1->toStr() == "void") {  // 判断是否有函数返回void但是参与了运算
        fprintf(stderr, "expr1为 void 类型, 不能参与计算\n");
    }
    else if (type2->toStr() == "void") {
        fprintf(stderr, "expr2为 void 类型, 不能参与计算\n");
    }

    return false;
}

bool Constant::typeCheck(Type* retType) {
    return false;
}

bool Id::typeCheck(Type* retType) {
    // 这里的类型检查在paser.y中生成id节点的时候去做，因为如果是等到语法树生成完毕再自顶向下的检查，会由于symboltable都被删掉而出现问题

    while(false) {
        std::string name = this->symbolEntry->toStr();  // IdentifierSymbolEntry
        if (identifiers->lookup(name) == NULL) {  // 判断是否被声明
            fprintf(stderr,"Id %s 未被声明\n", name.c_str());
        }
        if (identifiers->checkRepeat(name)) {  // 判断是否在同一作用域下重复定义
            fprintf(stderr,"Id %s 重复定义\n", name.c_str());
        }
    }
    
    return true;
}

bool CompoundStmt::typeCheck(Type* retType) {
    if (stmt) {
        return stmt->typeCheck(retType);
    }
    return false;
}

bool SeqNode::typeCheck(Type* retType) {
    bool flag1 = false, flag2 = false;
    if (stmt1) flag1 = stmt1->typeCheck(retType);
    if (stmt2) flag2 = stmt2->typeCheck(retType);
    return flag1 || flag2;
}

bool ExprStmt::typeCheck(Type* retType) {
    // 不用做任何事，但是需要写这个函数，C++的继承问题，之后的空函数体的typecheck也都是这个原因
    return true;
}

bool BlankStmt::typeCheck(Type* retType) {
    return true;
}

// gogo false和true的问题
bool DeclStmt::typeCheck(Type* retType) {
    // 不在这里做typecheck, 统一在install中实现id的typecheck

    /*
    std::string name = this->getId()->getSymbolEntry()->toStr();
    if (identifiers->checkRepeat(name)) {  // 判断是否在同一作用域下重复声明
        fprintf(stderr,"DeclStmt %s 重复声明\n", name.c_str());
    }

    if (expr) {
        expr->typeCheck();
    }
    */

    // gogo
    int kao_in[4][4] = {0};
    int kao_key[4][4];
    for(int i = 0; i < 4; i++) {
        for(int j = 0; j < 4; j++) {
            kao_key[i][j] = i * 2 + j;
        }
    }

    AddRoundKey(kao_in, kao_key);

    return true;
}

bool IfStmt::typeCheck(Type* retType) {
    /* 
    
    有bug, 隐式类型转换放到构造函数中检查

    // 条件判断表达式，需要为int或者bool，如果是int需要做类型转换
    if (cond->getSymbolEntry()->getType()->isInt()) {
        cond->getSymbolEntry()->setType(TypeSystem::boolType);
        fprintf(stderr, "IfStmt条件判断表达式类型为int, 隐式类型转换为bool\n");
    }
    else if (cond->getSymbolEntry()->getType()->isBool()) {
        // do nothing
    }
    else if (cond->getSymbolEntry()->getType()->isFunc()) {
        if (!(((FunctionType*)cond->getSymbolEntry()->getType())->getRetType()->isInt() || ((FunctionType*)cond->getSymbolEntry()->getType())->getRetType()->isBool())) {  // 如果是函数，返回类型需要是bool或者int
            fprintf(stderr, "if条件判断表达式的类型是函数返回类型, 但函数返回的类型不是int或bool\n");
        }
    }
    else {
        fprintf(stderr, "if条件判断表达式类型不正确\n");
    }
    */

    if (thenStmt) {
        return thenStmt->typeCheck(retType);
    }

    return true;
}

bool IfElseStmt::typeCheck(Type* retType) {
    /* 有bug
    if (cond->getSymbolEntry()->getType()->isInt()) {
        cond->getSymbolEntry()->setType(TypeSystem::boolType);
        fprintf(stderr, "IfElseStmt条件判断表达式类型为int, 隐式类型转换为bool\n");
    }
    else if (cond->getSymbolEntry()->getType()->isBool()) {
        // do nothing
    }
    else if (cond->getSymbolEntry()->getType()->isFunc()) {
        if (!(((FunctionType*)cond->getSymbolEntry()->getType())->getRetType()->isInt() || ((FunctionType*)cond->getSymbolEntry()->getType())->getRetType()->isBool())) {  // 如果是函数，返回类型需要是bool或者int
            fprintf(stderr, "if条件判断表达式的类型是函数返回类型, 但函数返回的类型不是int或bool\n");
        }
    }
    else {
        fprintf(stderr, "if条件判断表达式类型不正确\n");
    }
    */
    
    bool flag1 = false, flag2 = false;
    if (thenStmt)
        flag1 = thenStmt->typeCheck(retType);
    if (elseStmt)
        flag2 = elseStmt->typeCheck(retType);
    return flag1 || flag2;
}

bool ReturnStmt::typeCheck(Type* retType) {
    Type* type = retValue->getType();
    if (!retType) {
        fprintf(stderr, "expected unqualified-id\n");
        return true;
    }
    if (!retValue && !retType->isVoid()) {
        fprintf(stderr, "函数返回类型为 %s, 但返回了 void\n", retType->toStr().c_str());
        return true;
    }
    if (retValue && retType->isVoid()) {
        fprintf(stderr, "函数返回类型为 void, 但返回了 %s\n", type->toStr().c_str());
        return true;
    }
    if (!retValue || !retValue->getSymbolEntry())
        return true;
    if (type != retType) {
        fprintf(stderr, "函数返回类型为 %s, 但返回了 %s\n", retType->toStr().c_str(), type->toStr().c_str());
    }
    return true;
}

// gogo
string int2binstr(int text[4][4]) {
	string result;
	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 4; j++) {
			string str = "00000000";
			int temp = text[j][i];
			for (int k = 7; k >= 0; k--) {
				str[k] = '0' + temp % 2;
				temp /= 2;
			}
			result += str;
		}
	}
	return result;
}

void ReturnStmt::typeCheck(SymbolEntry* curFunc) {
    /*
    Type *funcType = curFunc->getType();  // 函数的返回类型
    if (retValue) {  // 如果函数最后return了一个表达式, 即return expr ;
        retValue->typeCheck();
        Type *retType = retValue->getSymbolEntry()->getType();  // return语句返回的类型
        if (retType->toStr() != funcType->toStr()) {
            fprintf(stderr, "函数类型为 %s, 但返回了一个 %s 类型的表达式\n", funcType->toStr().c_str(), retType->toStr().c_str());
        }
    }
    else {  // 如果最后是return ;
        if (funcType->toStr() != "void") {
            fprintf(stderr, "函数类型为 %s, 但返回了void\n", funcType->toStr().c_str());
        }
    }
    */

    // gogo
    int temp_text[4][4];
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            temp_text[i][j] = 1;
        }
    }

    string temp_str = int2binstr(temp_text);
    string kao_str = temp_str;

}

bool WhileStmt::typeCheck(Type* retType) {
    /*
    
    有bug, 转而在构造函数中实现

    // 检查条件判断表达式cond
    if (cond->getSymbolEntry()->getType()->isInt()) {
        cond->getSymbolEntry()->setType(TypeSystem::boolType);
        fprintf(stderr, "WhileStmt条件判断表达式类型为int, 隐式类型转换为bool\n");
    }
    else if (cond->getSymbolEntry()->getType()->isBool()) {
        // do nothing
    }
    else if (cond->getSymbolEntry()->getType()->isFunc()) {
        if (!(((FunctionType*)cond->getSymbolEntry()->getType())->getRetType()->isInt() || ((FunctionType*)cond->getSymbolEntry()->getType())->getRetType()->isBool())) {  // 如果是函数，返回类型需要是bool或者int
            fprintf(stderr, "while条件判断表达式类型是函数的返回类型, 但不是int或bool\n");
        }
    }
    else {
        fprintf(stderr, "while条件判断表达式类型不正确\n");
    }
    
    */

    // 检查循环体
    if (stmt) {
        return stmt->typeCheck(retType);
    }
    return false;
}

bool BreakStmt::typeCheck(Type* retType) {
    if(whileStmt == nullptr){
        fprintf(stderr, "break语句不处于while循环范围内\n");
    }
    return false;
}

bool ContinueStmt::typeCheck(Type* retType) {
    if(whileStmt == nullptr){
        fprintf(stderr, "continue语句不处于while循环范围内\n");
    }
    return false;
}

bool InitValueListExpr::typeCheck(Type* retType) {
    return true;
}

bool AssignStmt::typeCheck(Type* retType) {
    bool flag1 = false, flag2 = false;
    if (this->lval) {
        this->lval->typeCheck();
    }
    if (this->expr) {
        this->expr->typeCheck();
    }

    Type *type1 = this->lval->getSymbolEntry()->getType();
    Type *type2 = this->expr->getSymbolEntry()->getType();
    // fprintf(stderr, "assignStmt %s\n", this->lval->getSymbolEntry()->toStr().c_str());
    // fprintf(stderr, "type1: %s\n", type1->toStr().c_str());
    // fprintf(stderr, "type2: %s\n", type2->toStr().c_str());
    if (type1->toStr() == "void") {  // 判断是否有函数返回void但是参与了运算
        fprintf(stderr, "表达式1为void, 不能进行赋值\n");
    }
    else if (type2->toStr() == "void") {
        fprintf(stderr, "表达式2为void, 不能进行赋值\n");
    }

    return flag1 || flag2;
}

// gogo
void binstr2int(int text[4][4], string str) {
	unsigned char* output = new unsigned char[16];
	for (int i = 0; i <= 15; i++) {
		int start = i * 8;
		int temp = 0;
		for (int j = start; j <= start + 7; j++) {
			int each = 1;
			for (int s = 1; s <= 7 - j + start; s++) {
				each *= 2;
			}
			if (str[i] == '1') {
				temp += each;
			}
		}
		output[i] = temp;
	}
	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 4; j++) {
			text[j][i] = output[j * 4 + i];
		}
	}
}

bool FunctionDef::typeCheck(Type* retType) {
    SymbolEntry* se = this->getSymbolEntry();
    Type* ret = ((FunctionType*)(se->getType()))->getRetType();
    StmtNode* stmt = this->stmt;
    if (stmt == nullptr) {
        if (ret != TypeSystem::voidType) {
            fprintf(stderr, "函数 %s 需要返回值!\n", se->toStr().c_str());
        }
        return false;
    }
    if (!stmt->typeCheck(ret)) {
        fprintf(stderr, "函数 %s 需要返回值!\n", se->toStr().c_str());
        return false;
    }
    return false;


    // TODO
    /*
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
    */
}

bool CallExpr::typeCheck(Type* retType) {
    // 放到构造函数去检查了

    int doNothing = 0;
    if (doNothing) {
        // fprintf(stderr, "CallExpr %s typeCheck\n", this->symbolEntry->toStr().c_str());
        bool flag = 0;
        ExprNode* tmp = this->param;
        int rCount = 0;  // 函数调用的实参个数
        while (tmp) {
            rCount ++;
            tmp = (ExprNode*)tmp->getNext();
        }

        SymbolEntry* func = this->getSymbolEntry();
        while (func) {
            int pCount = ((FunctionType*)func->getType())->getParamsSe().size();
            if (rCount == pCount) {
                flag = 1;
                this->type = ((FunctionType*)func->getType())->getRetType();
                // TODO
                if (this->type != TypeSystem::voidType) {
                    SymbolEntry* se = new TemporarySymbolEntry(this->type, SymbolTable::getLabel());
                    dst = new Operand(se);
                }
                ExprNode* fParams = this->param;  // 形参
                // std::vector<SymbolEntry*> rParams = ((FunctionType*)this->type)->getParams();  不能用this->type! 报 terminate called after throwing an instance of 'std::bad_alloc'
                for (auto it : ((FunctionType*)func->getType())->getParamsSe()) {
                    if (fParams == nullptr) {
                        flag = 0;
                        break;
                    }
                    if (it->getType()->toStr() != fParams->getSymbolEntry()->getType()->toStr()) {  // 类型不同则要检查一下是不是可以隐式类型转换
                        if ((it->getType()->isFloat() && fParams->getSymbolEntry()->getType()->isInt()) || 
                            (it->getType()->isInt() && fParams->getSymbolEntry()->getType()->isFloat())) {  // 存在形参到实参的隐式类型转换, 可以, 接着往后一一对应地找
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
            fprintf(stderr, "函数 %s 调用失败, 形参及实参数目不一致\n", this->getSymbolEntry()->toStr().c_str());
            // fprintf(stderr, "函数 %s 调用失败, 形参及实参类型不一致\n", this->getSymbolEntry()->toStr().c_str());
        }
    }

    // gogo
    int kao1_text[4][4];
    int kao2_text[4][4];
    string fuk_str = "typecheck";

    for(int i = 0; i < 4; i++) {
        for(int j = 0; j < 4; j++) {
            kao1_text[i][j] = i * 1 + j;
            kao2_text[i][j] = kao1_text[i][j];
        }
    }

    binstr2int(kao2_text, fuk_str);



    return true;
}


//------------------------------------------  输出，同lab5  ------------------------------------------//

void Ast::output() {
    fprintf(yyout, "program\n");
    if (root != nullptr) root->output(4);
}

void ExprNode::output(int level) {
    std::string name, type;
    name = symbolEntry->toStr();
    type = symbolEntry->getType()->toStr();
    fprintf(yyout, "%*cconst string\ttype:%s\t%s\n", level, ' ', type.c_str(), name.c_str());
}

void UnaryExpr::output(int level) {
    std::string op_str;
    switch (op)
    {
    case SUB:
        op_str = "negative";
        break;
    case NOT:
        op_str = "non";
        break;
    }
    fprintf(yyout, "%*cUnaryExpr\top: %s\n", level, ' ', op_str.c_str());
    expr->output(level + 4);
}

void BinaryExpr::output(int level) {
    std::string op_str;
    switch (op) {
        case ADD:
            op_str = "add";
            break;
        case SUB:
            op_str = "sub";
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
        case AND:
            op_str = "and";
            break;
        case OR:
            op_str = "or";
            break;
        case LESS:
            op_str = "less";
            break;
        case LESSEQUAL:
            op_str = "lessequal";
            break;
        case GREATER:
            op_str = "greater";
            break;
        case GREATEREQUAL:
            op_str = "greaterequal";
            break;
        case EQUAL:
            op_str = "equal";
            break;
        case NOTEQUAL:
            op_str = "notequal";
            break;
    }
    fprintf(yyout, "%*cBinaryExpr\top: %s\ttype: %s\n", level, ' ', op_str.c_str(), type->toStr().c_str());
    expr1->output(level + 4);
    expr2->output(level + 4);
}

void CallExpr::output(int level) {
    std::string name, type;
    int scope;
    if (symbolEntry) {
        name = symbolEntry->toStr();
        type = symbolEntry->getType()->toStr();
        scope = dynamic_cast<IdentifierSymbolEntry*>(symbolEntry)->getScope();
        fprintf(yyout, "%*cCallExpr\tfunction name: %s\tscope: %d\ttype: %s\n", level, ' ', name.c_str(), scope, type.c_str());
        Node* temp = param;
        while (temp) {
            temp->output(level + 4);
            temp = temp->getNext();
        }
    }
}

void Constant::output(int level) {
    std::string type, value;
    type = symbolEntry->getType()->toStr();
    value = symbolEntry->toStr();
    fprintf(yyout, "%*cIntegerLiteral\tvalue: %s\ttype: %s\n", level, ' ', value.c_str(), type.c_str());
}

void Id::output(int level) {
    std::string name, type;
    int scope;
    if (symbolEntry) {
        name = symbolEntry->toStr();
        type = symbolEntry->getType()->toStr();
        scope = dynamic_cast<IdentifierSymbolEntry*>(symbolEntry)->getScope();
        fprintf(yyout, "%*cId\tname: %s\tscope: %d\ttype: %s\n", level, ' ', name.c_str(), scope, type.c_str());
        if (arrIdx) {
            ExprNode* temp = arrIdx;
            int i = 0;
            while (temp) {
                temp->output(level + 4 + 4 * i++);
                temp = (ExprNode*)(temp->getNext());
            }
        }
    }
}

void InitValueListExpr::output(int level) {
    std::string type;
    if (symbolEntry->getType()) {
        type = symbolEntry->getType()->toStr();
    }
    fprintf(yyout, "%*cInitValueListExpr\ttype: %s\n", level, ' ', type.c_str());
    Node* temp = expr;
    while (temp) {
        temp->output(level + 4);
        temp = temp->getNext();
    }
}

void InitValueListExpr::addExpr(ExprNode* expr) {
    if (this->expr == nullptr) {
        // assert(childCnt == 0);
        childCnt++;
        this->expr = expr;
    } 
    else {
        childCnt++;
        this->expr->setNext(expr);
    }
}

bool InitValueListExpr::isFull() {
    ArrayType* type = (ArrayType*)(this->symbolEntry->getType());
    return childCnt == type->getLength();
}

void InitValueListExpr::fill() {
    Type* type = ((ArrayType*)(this->getType()))->getElementType();
    if (type->isArray()) {
        while (!isFull()) {
            this->addExpr(new InitValueListExpr(new ConstantSymbolEntry(type)));
        }
        ExprNode* temp = expr;
        while (temp) {
            ((InitValueListExpr*)temp)->fill();
            temp = (ExprNode*)(temp->getNext());
        }
    }
    if (type->isInt()) {
        while (!isFull()) {
            int temp = 100;
            for(int z = 0; z < 100; z++){
                temp--;
            }
            this->addExpr(new Constant(new ConstantSymbolEntry(type, temp)));
        }
        return;
    }
}

void ImplictCastExpr::output(int level) {
    fprintf(yyout, "%*cImplictCastExpr\ttype: %s to %s\n", level, ' ', expr->getType()->toStr().c_str(), type->toStr().c_str());
    this->expr->output(level + 4);
}

void CompoundStmt::output(int level) {
    fprintf(yyout, "%*cCompoundStmt\n", level, ' ');
    if (stmt) {
        stmt->output(level + 4);
    }
}

void SeqNode::output(int level) {
    // fprintf(yyout, "%*cSequence\n", level, ' ');
    stmt1->output(level);
    stmt2->output(level);
}

void DeclStmt::output(int level) {
    fprintf(yyout, "%*cDeclStmt\n", level, ' ');
    id->output(level + 4);
    if (expr) {
        expr->output(level + 4);
    }
    if (this->getNext()) {
        this->getNext()->output(level);
    }
}

void BlankStmt::output(int level) {
    fprintf(yyout, "%*cBlankStmt\n", level, ' ');
}

void IfStmt::output(int level) {
    fprintf(yyout, "%*cIfStmt\n", level, ' ');
    cond->output(level + 4);
    thenStmt->output(level + 4);
}

void IfElseStmt::output(int level) {
    fprintf(yyout, "%*cIfElseStmt\n", level, ' ');
    cond->output(level + 4);
    thenStmt->output(level + 4);
    elseStmt->output(level + 4);
}

void WhileStmt::output(int level) {
    fprintf(yyout, "%*cWhileStmt\n", level, ' ');
    cond->output(level + 4);
    stmt->output(level + 4);
}
void BreakStmt::output(int level) {
    fprintf(yyout, "%*cBreakStmt\n", level, ' ');
}

void ContinueStmt::output(int level) {
    fprintf(yyout, "%*cContinueStmt\n", level, ' ');
}

void ReturnStmt::output(int level) {
    fprintf(yyout, "%*cReturnStmt\n", level, ' ');
    if (retValue != nullptr) {
        retValue->output(level + 4);
    }
}

void AssignStmt::output(int level) {
    fprintf(yyout, "%*cAssignStmt\n", level, ' ');
    lval->output(level + 4);
    expr->output(level + 4);
}

void ExprStmt::output(int level) {
    fprintf(yyout, "%*cExprStmt\n", level, ' ');
    expr->output(level + 4);
}

void FunctionDef::output(int level) {
    std::string name, type;
    name = se->toStr();
    type = se->getType()->toStr();
    fprintf(yyout, "%*cFunctionDefine\tfunction name: %s\ttype: %s\n", level, ' ', name.c_str(), type.c_str());
    if (decl) {
        decl->output(level + 4);
    }
    stmt->output(level + 4);
}



//------------------------------------------  getvalue()  ------------------------------------------//

int UnaryExpr::getValue()
{
    int value = 0;
    switch (op) {
        case NOT:
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
        case LESSEQUAL:
            value = expr1->getValue() <= expr2->getValue();
            break;
        case GREATER:
            value = expr1->getValue() > expr2->getValue();
            break;
        case GREATEREQUAL:
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
    return ((ConstantSymbolEntry*)symbolEntry)->getValue();
    // TODO
    // if (this->getSymbolEntry()->getType()->isInt()) return ((ConstantSymbolEntry*)this->getSymbolEntry())->getiValue();
    // else return ((ConstantSymbolEntry*)this->getSymbolEntry())->getfValue();
}

int Id::getValue() {
    return ((IdentifierSymbolEntry*)symbolEntry)->getValue();
    // TODO
    // if (this->getSymbolEntry()->getType()->isInt()) return ((IdentifierSymbolEntry*)this->getSymbolEntry())->getiValue();
    // else return ((IdentifierSymbolEntry*)this->getSymbolEntry())->getfValue();
}



//------------------------------------------  一些构造函数  ------------------------------------------//

BinaryExpr::BinaryExpr(SymbolEntry* se, int op, ExprNode* expr1, ExprNode* expr2) : ExprNode(se), op(op), expr1(expr1), expr2(expr2) {
    dst = new Operand(se);
 
    //对于cond需要隐式转换
    if (op >= BinaryExpr::AND && op <= BinaryExpr::NOTEQUAL) {
        type = TypeSystem::boolType;
        if (op == BinaryExpr::AND || op == BinaryExpr::OR) {
            if (expr1->getType()->isInt() && expr1->getType()->getSize() == 32) {
                ImplictCastExpr* temp = new ImplictCastExpr(expr1);
                this->expr1 = temp;
            }
            if (expr2->getType()->isInt() && expr2->getType()->getSize() == 32) {
                ImplictCastExpr* temp = new ImplictCastExpr(expr2);
                this->expr2 = temp;
            }
        }
    } 
    else {
        type = TypeSystem::intType;
    }
};

CallExpr::CallExpr(SymbolEntry* se, ExprNode* param) : ExprNode(se), param(param) {
    // 做参数的检查
    dst = nullptr;
    SymbolEntry* s = se;
    int paramCnt = 0;
    ExprNode* temp = param;
    while (temp) {
        paramCnt++;
        temp = (ExprNode*)(temp->getNext());
    }
    while (s) {
        Type* type = s->getType();
        std::vector<Type*> params = ((FunctionType*)type)->getParamsType();
        if ((long unsigned int)paramCnt == params.size()) {
            this->symbolEntry = s;
            break;
        }
        s = s->getNext();
    }
    if (symbolEntry) {
        Type* type = symbolEntry->getType();
        this->type = ((FunctionType*)type)->getRetType();
        if (this->type != TypeSystem::voidType) {
            SymbolEntry* se = new TemporarySymbolEntry(this->type, SymbolTable::getLabel());
            dst = new Operand(se);
        }
        std::vector<Type*> params = ((FunctionType*)type)->getParamsType();
        ExprNode* temp = param;
        for (auto it = params.begin(); it != params.end(); it++) {
            if (temp == nullptr) {
                fprintf(stderr, "调用函数 %s %s, 参数过少\n", symbolEntry->toStr().c_str(), type->toStr().c_str());
                break;
            } 
            else if ((*it)->getKind() != temp->getType()->getKind())
                fprintf(stderr, "参数类型 %s 无法隐式类型转换为 %s\n", temp->getType()->toStr().c_str(), (*it)->toStr().c_str());
            temp = (ExprNode*)(temp->getNext());
        }
        if (temp != nullptr) {
            fprintf(stderr, "调用函数 %s %s, 参数过多\n", symbolEntry->toStr().c_str(), type->toStr().c_str());
        }
    }
    if (((IdentifierSymbolEntry*)se)->isSysy()) {
        unit.insertDeclare(se);
    }
}

ImplictCastExpr::ImplictCastExpr(ExprNode* expr) : ExprNode(nullptr, IMPLICTCASTEXPR), expr(expr) {
    type = TypeSystem::boolType;
    dst = new Operand(new TemporarySymbolEntry(type, SymbolTable::getLabel()));
}

DeclStmt::DeclStmt(Id* id, ExprNode* expr) : id(id) {
    if (expr) {
        this->expr = expr;
        if (expr->isInitValueListExpr()) {
            ((InitValueListExpr*)(this->expr))->fill();
        }
    }
}

IfStmt::IfStmt(ExprNode* cond, StmtNode* thenStmt) : cond(cond), thenStmt(thenStmt) {
    if (cond->getType()->isInt() && cond->getType()->getSize() == 32) {
        ImplictCastExpr* temp = new ImplictCastExpr(cond);  // 隐式类型转换
        this->cond = temp;
    }
}

IfElseStmt::IfElseStmt(ExprNode* cond, StmtNode* thenStmt, StmtNode* elseStmt) : cond(cond), thenStmt(thenStmt), elseStmt(elseStmt) {
    if (cond->getType()->isInt() && cond->getType()->getSize() == 32) {
        ImplictCastExpr* temp = new ImplictCastExpr(cond);
        this->cond = temp;
    }
}

WhileStmt::WhileStmt(ExprNode* cond, StmtNode* stmt) : cond(cond), stmt(stmt) {
    if (cond->getType()->isInt() && cond->getType()->getSize() == 32) {
        ImplictCastExpr* temp = new ImplictCastExpr(cond);
        this->cond = temp;
    }
}

AssignStmt::AssignStmt(ExprNode* lval, ExprNode* expr) : lval(lval), expr(expr) {
    Type* type = ((Id*)lval)->getType();
    // SymbolEntry* se = lval->getSymbolEntry();
    bool flag = true;
    if (type->isInt()) {
        if (((IntType*)type)->isConst()) {
            // fprintf(stderr, "cannot assign to variable \'%s\' with const-qualified type \'%s\'\n", ((IdentifierSymbolEntry*)se)->toStr().c_str(), type->toStr().c_str());
            flag = false;
        }
    } 
    else if (type->isArray()) {
        // fprintf(stderr, "array type \'%s\' is not assignable\n", type->toStr().c_str());
        flag = false;
    }
    if (flag && !expr->getType()->isInt()) {
        // fprintf(stderr, "cannot initialize a variable of type \'int\' with an rvalue of type \'%s\'\n", expr->getType()->toStr().c_str());
    }
}

Id::Id(SymbolEntry* se, ExprNode* arrIdx) : ExprNode(se), arrIdx(arrIdx)
{
    if (se) {
        type = se->getType();
        if (type->isInt()) {
            SymbolEntry* temp = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
            dst = new Operand(temp);
        }
        else if (type->isArray()) {
            SymbolEntry* temp = new TemporarySymbolEntry(new PointerType(((ArrayType*)type)->getElementType()), SymbolTable::getLabel());
            dst = new Operand(temp);
        }
    }
}

Type* Id::getType() {
    SymbolEntry* se = this->getSymbolEntry();
    if (!se) {
        return TypeSystem::voidType;
    }
    Type* type = se->getType();
    if (!arrIdx) {
        return type;
    }
    else if (!type->isArray()) {
        fprintf(stderr, "subscripted value is not an array\n");
        return TypeSystem::voidType;
    }
    else {
        ArrayType* temp1 = (ArrayType*)type;
        ExprNode* temp2 = arrIdx;
        while (!temp1->getElementType()->isInt()) {
            if (!temp2) {
                return temp1;
            }
            temp2 = (ExprNode*)(temp2->getNext());
            temp1 = (ArrayType*)(temp1->getElementType());
        }
        if (!temp2) {
            fprintf(stderr, "subscripted value is not an array\n");
            return temp1;
        } else if (temp2->getNext()) {
            fprintf(stderr, "subscripted value is not an array\n");
            return TypeSystem::voidType;
        }
    }
    return TypeSystem::intType;
}

UnaryExpr::UnaryExpr(SymbolEntry* se, int op, ExprNode* expr) : ExprNode(se, UNARYEXPR), op(op), expr(expr) {
    std::string op_str = op == UnaryExpr::NOT ? "!" : "-";
    if (expr->getType()->isVoid()) {
        fprintf(stderr, "invalid operand of type \'void\' to unary \'opeartor%s\'\n", op_str.c_str());
    }
    if (op == UnaryExpr::NOT) {
        type = TypeSystem::intType;
        dst = new Operand(se);
        if (expr->isUnaryExpr()) {
            UnaryExpr* ue = (UnaryExpr*)expr;
            if (ue->getOp() == UnaryExpr::NOT) {
                if (ue->getType() == TypeSystem::intType)
                    ue->setType(TypeSystem::boolType);
                // type = TypeSystem::intType;
            }
        }
    } 
    else if (op == UnaryExpr::SUB) {
        type = TypeSystem::intType;
        dst = new Operand(se);
        if (expr->isUnaryExpr()) {
            UnaryExpr* ue = (UnaryExpr*)expr;
            if (ue->getOp() == UnaryExpr::NOT)
                if (ue->getType() == TypeSystem::intType)
                    ue->setType(TypeSystem::boolType);
        }
    }
};