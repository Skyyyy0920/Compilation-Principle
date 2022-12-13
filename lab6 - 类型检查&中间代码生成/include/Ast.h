#ifndef __AST_H__
#define __AST_H__

#include <fstream>
#include "Operand.h"

class SymbolEntry;
class Unit;
class Function;
class BasicBlock;
class Instruction;
class IRBuilder;

class Node
{
private:
    static int counter;
    int seq;
    Node* next;
protected:
    std::vector<Instruction*> true_list;
    std::vector<Instruction*> false_list;
    static IRBuilder *builder;
    void backPatch(std::vector<Instruction*> &list, BasicBlock*bb);
    std::vector<Instruction*> merge(std::vector<Instruction*> &list1, std::vector<Instruction*> &list2);

public:
    Node();
    int getSeq() const {return seq;};
    static void setIRBuilder(IRBuilder*ib) {builder = ib;};
    virtual void output(int level) = 0;
    virtual void typeCheck() = 0;
    virtual void genCode() = 0;
    void setNext(Node* node);
    void setAdjNext(Node* node) { next = node; }
    Node* getNext() { return next; }
    void cleanNext() { next = nullptr; }
    std::vector<Instruction*>& trueList() {return true_list;}
    std::vector<Instruction*>& falseList() {return false_list;}
};

class ExprNode : public Node
{
protected:
    SymbolEntry *symbolEntry;
    Operand *dst;   // The result of the subtree is stored into dst.子树的结果存储在dst之中
    Type* type;
public:
    ExprNode(SymbolEntry *symbolEntry) : symbolEntry(symbolEntry){ dst = nullptr; type = nullptr; };
    Operand* getOperand() {return dst;};
    SymbolEntry* getSymPtr() {return symbolEntry;};
};

class UnaryExpr : public ExprNode  // 单目运算符
{
private:
    int op;
    ExprNode *expr;
public:
    enum {ADD, SUB, NON};  // + - !
    UnaryExpr(SymbolEntry *se, int op, ExprNode*expr) : ExprNode(se), op(op), expr(expr){};
    // float getValue();    
    void output(int level);
    void typeCheck();
    void genCode();
};

class BinaryExpr : public ExprNode  // 双目运算符
{
private:
    int op;
    ExprNode *expr1, *expr2;
public:
    enum {ADD, SUB, MUL, DIV, MOD, AND, OR, LESS, GREATER, GORE, LORE, EQUAL, NOTEQUAL};
    BinaryExpr(SymbolEntry *se, int op, ExprNode*expr1, ExprNode*expr2) : ExprNode(se), op(op), expr1(expr1), expr2(expr2){dst = new Operand(se);};
    void output(int level);
    void typeCheck();
    void genCode();
};

class Constant : public ExprNode
{
public:
    Constant(SymbolEntry *se) : ExprNode(se){dst = new Operand(se);};
    void output(int level);
    void typeCheck();
    void genCode();
};

class Id : public ExprNode  // identifier
{
public:
    Id(SymbolEntry *se) : ExprNode(se){SymbolEntry *temp = new TemporarySymbolEntry(se->getType(), SymbolTable::getLabel()); dst = new Operand(temp);};
    void output(int level);
    void typeCheck();
    void genCode();
};

class StmtNode : public Node {
private:
    int kind;
    bool haveRetStmt;
protected:
    enum { IF, IFELSE, WHILE, COMPOUND, RETURN };

public:
    StmtNode(int kind = -1) : kind(kind){ this->haveRetStmt = false; };
    // StmtNode(int kind, bool haveReturn) : kind(kind), haveReturn(haveReturn) {};
    bool isIf() const { return kind == IF; };
    void setHaveRetStmt(bool haveReturn) { this->haveRetStmt = haveReturn; };
    bool getHaveRetStmt() { return this->haveRetStmt; };
    // virtual bool typeCheck(Type* retType = nullptr) = 0;
};

class CompoundStmt : public StmtNode
{
private:
    StmtNode *stmt;
public:
    CompoundStmt() { stmt = nullptr; };
    CompoundStmt(StmtNode *stmt) : stmt(stmt) { if(stmt->getHaveRetStmt())this->setHaveRetStmt(true); };
    void output(int level);
    void typeCheck();
    void genCode();
};

class SeqNode : public StmtNode  // 多个stmt用来分叉
{
private:
    StmtNode *stmt1, *stmt2;
public:
    SeqNode(StmtNode *stmt1, StmtNode *stmt2) : stmt1(stmt1), stmt2(stmt2){ if(stmt1->getHaveRetStmt() || stmt2->getHaveRetStmt()) this->setHaveRetStmt(true); /*这句很重要, 看着语法分析器生成树一步一步查出来的bug!!!*/ };
    void output(int level);
    void typeCheck();  // 检验左右子树即可，但是这个函数很重要
    void genCode();
};

class ExprStmt : public StmtNode {
private:
    ExprNode *expr;
public:
    ExprStmt(ExprNode* expr) : expr(expr){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class BlankStmt : public StmtNode {
public:
    BlankStmt(){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class DeclStmt : public StmtNode  // 变量、常量声明
{
private:
    Id *id;
    ExprNode* expr; // 右侧的表达式
public:
    DeclStmt(Id *id, ExprNode* expr = nullptr);
    void output(int level);
    void typeCheck();
    void genCode();
    Id* getId(){ return id; }
    ExprNode* getExprNode(){ return expr; }
};

class IfStmt : public StmtNode
{
private:
    ExprNode *cond;  // 条件判断表达式
    StmtNode *thenStmt;  // if执行代码块
public:
    IfStmt(ExprNode *cond, StmtNode *thenStmt) : cond(cond), thenStmt(thenStmt){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class IfElseStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *thenStmt;
    StmtNode *elseStmt;
public:
    IfElseStmt(ExprNode *cond, StmtNode *thenStmt, StmtNode *elseStmt) : cond(cond), thenStmt(thenStmt), elseStmt(elseStmt) {};
    void output(int level);
    void typeCheck();
    void genCode();
};

class WhileStmt : public StmtNode {
private:
    ExprNode* cond;
    StmtNode* stmt;
    BasicBlock *cond_bb;
    BasicBlock *loop_bb;
    BasicBlock *end_bb;
public:
    // cond如果是i32要转换为i1的bool类型
    WhileStmt(ExprNode* cond, StmtNode* stmt=nullptr) : cond(cond), stmt(stmt) {
        // if (cond->getType()->isInt() && cond->getType()->getSize() == 32) {
        //     ImplictCastExpr* temp = new ImplictCastExpr(cond);
        //     this->cond = temp;
        // }
    };
    void setStmt(StmtNode* stmt){this->stmt = stmt;};
    ExprNode* getCond(){return cond;};
    void output(int level);
    void typeCheck();
    void genCode();
};

class BreakStmt : public StmtNode
{
private:
    // StmtNode *breakStmt;
public:
    BreakStmt(){};
    // BreakStmt(StmtNode* BreakStmt) : breakStmt(breakStmt){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class ContinueStmt : public StmtNode
{
private:
    // StmtNode *whileStmt;
public:
    ContinueStmt(){};
    // ContinueStmt(StmtNode* whileStmt) : whileStmt(whileStmt){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class ReturnStmt : public StmtNode
{
private:
    ExprNode *retValue;
public:
    ReturnStmt() { retValue = nullptr; }
    ReturnStmt(ExprNode *retValue) : retValue(retValue) {};
    void output(int level);
    void typeCheck();
    void typeCheck(SymbolEntry* curFunc);
    void genCode();
    ExprNode* getRetValue() { return retValue; }
};

class AssignStmt : public StmtNode  // = 赋值类
{
private:
    ExprNode *lval;
    ExprNode *expr;
public:
    AssignStmt(ExprNode *lval, ExprNode *expr) : lval(lval), expr(expr) {};
    void output(int level);
    void typeCheck();
    void genCode();
};

class FunctionDef : public StmtNode
{
private:
    SymbolEntry *se;  // 函数名
    DeclStmt *decl;  // 函数实参
    StmtNode *stmt;  // 函数内容
public:
    FunctionDef(SymbolEntry *se, DeclStmt *decl, StmtNode *stmt) : se(se), decl(decl), stmt(stmt){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class CallExpr : public ExprNode {  // 函数调用
private:
    // 继承父类的symbolEntry, 记录的是对应的声明函数的ID, 但不一定就是这次函数调用对应的函数, 因为存在函数重载问题, 真正指向对应的函数还需要在typecheck中调整指针的指向
    ExprNode *param; // 目前还没设计好相关的形参表等内容
public:
    CallExpr(SymbolEntry* se, ExprNode* param = nullptr) : ExprNode(se) { this->param = param; /*typeCheck();*/ };
    void output(int level);
    void typeCheck();
    void genCode();
};

class Ast
{
private:
    Node* root;
public:
    Ast() {root = nullptr;}
    void setRoot(Node*n) {root = n;}
    void output();
    void typeCheck();
    void genCode(Unit *unit);
};

#endif
