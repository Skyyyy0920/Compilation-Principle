#ifndef __AST_H__
#define __AST_H__

#include <fstream>
#include <iostream>
#include <stack>
#include <string>
#include "Operand.h"
#include "Type.h"

class SymbolEntry;
class Unit;
class Function;
class BasicBlock;
class Instruction;
class IRBuilder;


class Node {
private:
    static int counter;
    int seq;
    Node* next;

    // gogo
    Node* prev;
    static float float_counter;

protected:
    std::vector<Instruction*> true_list;
    std::vector<Instruction*> false_list;
    static IRBuilder* builder;
    void backPatch(std::vector<Instruction*>& list, BasicBlock* bb);
    std::vector<Instruction*> merge(std::vector<Instruction*>& list1, std::vector<Instruction*>& list2);
public:
    Node();
    virtual bool typeCheck(Type* retType = nullptr) = 0;
    virtual void genCode() = 0;
    virtual void output(int level) = 0;
    static void setIRBuilder(IRBuilder* ib) { builder = ib; };


    // gogo
    void setSeq(int seq) { this->seq = seq; };
    Node* getPrev() const { return prev; }
    void cleanPrev() { prev = nullptr; }


    int getSeq() const { return seq; };
    void setAdjNext(Node* node) { next = node; }
    void setNext(Node* node);
    Node* getNext() { return next; }
    void cleanNext() { next = nullptr; }
    std::vector<Instruction*>& trueList() { return true_list; }
    std::vector<Instruction*>& falseList() { return false_list; }
};

class ExprNode : public Node {
private:
    int kind;
protected:
    enum { EXPR, INITVALUELISTEXPR, IMPLICTCASTEXPR, UNARYEXPR };
    Type* type;
    SymbolEntry* symbolEntry;
    Operand* dst;  // The result of the subtree is stored into dst.
public:
    ExprNode(SymbolEntry* symbolEntry, int kind = EXPR) : kind(kind), symbolEntry(symbolEntry) {};
    virtual bool typeCheck(Type* retType = nullptr) { return false; };
    void genCode();
    void output(int level);
    virtual int getValue() { return -1; };
    virtual Type* getType() { return type; };
    Operand* getOperand() { return dst; };
    bool isExpr() const { return kind == EXPR; };
    bool isInitValueListExpr() const { return kind == INITVALUELISTEXPR; };
    bool isImplictCastExpr() const { return kind == IMPLICTCASTEXPR; };
    bool isUnaryExpr() const { return kind == UNARYEXPR; };
    SymbolEntry* getSymbolEntry() { return symbolEntry; };
    Type* getOriginType() { return type; };
    ExprNode* copy();
};

class UnaryExpr : public ExprNode  // 单目运算符
{
private:
    int op;
    ExprNode* expr;
public:
    enum { NOT, SUB, ADD }; 
    UnaryExpr(SymbolEntry* se, int op, ExprNode* expr);
    bool typeCheck(Type* retType = nullptr);
    void genCode();
    void output(int level);
    int getValue();
    int getOp() const { return op; };
    void setType(Type* type) { this->type = type; }
};

class BinaryExpr : public ExprNode  // 双目运算符
{
private:
    int op;
    ExprNode *expr1, *expr2;
public:
    enum { ADD, SUB, MUL, DIV, MOD, AND, OR, LESS, LESSEQUAL, GREATER, GREATEREQUAL, EQUAL, NOTEQUAL };
    BinaryExpr(SymbolEntry* se, int op, ExprNode* expr1, ExprNode* expr2);
    bool typeCheck(Type* retType = nullptr);
    void genCode();
    void output(int level);
    int getValue();
};

class Constant : public ExprNode {
public:
    Constant(SymbolEntry* se) : ExprNode(se) { dst = new Operand(se); type = TypeSystem::intType; };
    bool typeCheck(Type* retType = nullptr);
    void genCode();
    void output(int level);
    int getValue();
};

class Id : public ExprNode
{
private:
    ExprNode* arrIdx;
    bool left = false;
public:
    Id(SymbolEntry* se, ExprNode* arrIdx = nullptr);
    bool typeCheck(Type* retType = nullptr);
    void genCode();
    void output(int level);
    int getValue();
    ExprNode* getArrIdx() { return arrIdx; };
    Type* getType();
    bool isLeft() const { return left; };
    void setLeft() { left = true; }
};

class InitValueListExpr : public ExprNode {
private:
    ExprNode* expr;
    int childCnt;
public:
    InitValueListExpr(SymbolEntry* se, ExprNode* expr = nullptr) : ExprNode(se, INITVALUELISTEXPR), expr(expr) { type = se->getType(); childCnt = 0; };
    bool typeCheck(Type* retType = nullptr);
    void genCode();
    void output(int level);

    // gogo
    char* shift_enc(std::string plain, int key);

    ExprNode* getExpr() const { return expr; };
    void addExpr(ExprNode* expr);
    bool isEmpty() { return childCnt == 0; };
    bool isFull();
    void fill();
};

// int2bool, int2float, float2int
class ImplictCastExpr : public ExprNode
{
private:
    ExprNode* expr;
public:
    ImplictCastExpr(ExprNode* expr);
    bool typeCheck(Type* retType = nullptr) { return false; };
    void genCode();
    void output(int level);
    ExprNode* getExpr() const { return expr; };
};

class StmtNode : public Node
{
private:
    int kind;
    bool haveRetStmt;
protected:
    enum { IF, IFELSE, WHILE, COMPOUND, RETURN };
public:
    virtual bool typeCheck(Type* retType = nullptr) = 0;
    StmtNode(int kind = -1) : kind(kind) {};
    // StmtNode(int kind, bool haveReturn) : kind(kind), haveReturn(haveReturn) {};
    bool isIf() const { return kind == IF; };
    void setHaveRetStmt(bool haveReturn) { this->haveRetStmt = haveReturn; };
    bool getHaveRetStmt() { return this->haveRetStmt; };
};

class CompoundStmt : public StmtNode
{
private:
    StmtNode* stmt;
public:
    CompoundStmt(StmtNode* stmt = nullptr) : stmt(stmt) {};
    bool typeCheck(Type* retType = nullptr);
    void genCode();
    void output(int level);
};

class SeqNode : public StmtNode  // 多个stmt用来分叉
{
private:
    StmtNode *stmt1, *stmt2;
public:
    SeqNode(StmtNode* stmt1, StmtNode* stmt2) : stmt1(stmt1), stmt2(stmt2){};
    bool typeCheck(Type* retType = nullptr);
    void genCode();
    void output(int level);
};

class ExprStmt : public StmtNode
{
private:
    ExprNode* expr;
public:
    ExprStmt(ExprNode* expr) : expr(expr){};
    void output(int level);
    bool typeCheck(Type* retType = nullptr);
    void genCode();
};

class BlankStmt : public StmtNode
{
public:
    BlankStmt() {};
    void output(int level);
    bool typeCheck(Type* retType = nullptr);
    void genCode();
};

class DeclStmt : public StmtNode  // 变量、常量声明
{
private:
    Id* id;
    ExprNode* expr;  // 右侧的表达式
public:
    DeclStmt(Id* id, ExprNode* expr = nullptr);
    bool typeCheck(Type* retType = nullptr);
    void genCode();
    void output(int level);
    Id* getId() { return id; };
    ExprNode* getExprNode(){ return expr; }
};

class IfStmt : public StmtNode
{
private:
    ExprNode *cond;  // 条件判断表达式
    StmtNode *thenStmt;  // if执行代码块
public:
    IfStmt(ExprNode* cond, StmtNode* thenStmt);
    bool typeCheck(Type* retType = nullptr);
    void genCode();
    void output(int level);
};

class IfElseStmt : public StmtNode
{
private:
    ExprNode* cond;
    StmtNode* thenStmt;
    StmtNode* elseStmt;
public:
    IfElseStmt(ExprNode* cond, StmtNode* thenStmt, StmtNode* elseStmt);
    bool typeCheck(Type* retType = nullptr);
    void genCode();
    void output(int level);
};

class WhileStmt : public StmtNode
{
public:
    ExprNode* cond;
    StmtNode* stmt;
    BasicBlock *cond_bb;
    BasicBlock *loop_bb;
    BasicBlock *end_bb;
public:
    WhileStmt(ExprNode* cond, StmtNode* stmt=nullptr);
    bool typeCheck(Type* retType = nullptr);
    void genCode();
    void output(int level);
    void setStmt(StmtNode* stmt) { this->stmt = stmt; };
    BasicBlock* get_cond_bb() { return this->cond_bb; };
    BasicBlock* get_loop_bb() { return this->loop_bb; };
    BasicBlock* get_end_bb() { return this->end_bb; };
};

class BreakStmt : public StmtNode
{
private:
    StmtNode* whileStmt;  // 存储父节点，用于获取跳转的基本块
    BasicBlock *next_bb;
public:
    BreakStmt(StmtNode* whileStmt) { this->whileStmt = whileStmt; };
    bool typeCheck(Type* retType = nullptr);
    void genCode();
    void output(int level);
    void setStmt(StmtNode* whileStmt) { this->whileStmt = whileStmt; };
};

class ContinueStmt : public StmtNode
{
private:
    StmtNode *whileStmt;
    BasicBlock *next_bb;
public:
    ContinueStmt(StmtNode* whileStmt) { this->whileStmt = whileStmt; };
    bool typeCheck(Type* retType = nullptr);
    void genCode();
    void output(int level);
    void setStmt(StmtNode* whileStmt) { this->whileStmt = whileStmt; };
};

class ReturnStmt : public StmtNode
{
private:
    ExprNode* retValue;
public:
    ReturnStmt() { retValue = nullptr; }
    ReturnStmt(ExprNode* retValue) : retValue(retValue) {};
    bool typeCheck(Type* retType = nullptr);
    void typeCheck(SymbolEntry* curFunc);
    void genCode();
    void output(int level);
    ExprNode* getRetValue() { return retValue; }
};

class AssignStmt : public StmtNode  // = 赋值类
{
private:
    ExprNode* lval;  // 等式左侧, ID或ID[]
    ExprNode* expr;  // 等式右侧, 表达式
public:
    AssignStmt(ExprNode* lval, ExprNode* expr);
    bool typeCheck(Type* retType = nullptr);
    void genCode();
    void output(int level);
};

class FunctionDef : public StmtNode
{
private:
    SymbolEntry *se;  // 函数名
    DeclStmt *decl;  // 函数实参
    StmtNode *stmt;  // 函数内容
public:
    FunctionDef(SymbolEntry* se, DeclStmt* decl, StmtNode* stmt) : se(se), decl(decl), stmt(stmt) {};
    bool typeCheck(Type* retType = nullptr);
    void genCode();
    void output(int level);
    SymbolEntry* getSymbolEntry() { return se; };
};

class CallExpr : public ExprNode  // 函数调用
{
private:
    // 这里有一个继承父类的symbolEntry, 记录的是对应的声明函数的ID, 但不一定就是这次函数调用对应的函数, 因为存在函数重载问题, 真正指向对应的函数还需要在typecheck中调整指针的指向
    ExprNode* param;
public:
    CallExpr(SymbolEntry* se, ExprNode* param = nullptr);
    bool typeCheck(Type* retType = nullptr);
    void genCode();
    void output(int level);
};

class Ast {
private:
    Node* root;
public:
    Ast() { root = nullptr; }
    bool typeCheck(Type* retType = nullptr);
    void genCode(Unit* unit);
    void output();
    void setRoot(Node* n) { root = n; }
};

#endif
