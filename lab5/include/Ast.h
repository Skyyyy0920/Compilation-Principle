#ifndef __AST_H__
#define __AST_H__

#include <fstream>

class SymbolEntry;

class Node
{
private:
    static int counter;
    int seq;
    Node* next;
public:
    Node();
    int getSeq() const {return seq;};
    virtual void output(int level) = 0;
    void setNext(Node* node);
    void setAdjNext(Node* node) { next = node; }
    Node* getNext() { return next; }
    void cleanNext() { next = nullptr; }
};

class ExprNode : public Node
{
protected:
    SymbolEntry *symbolEntry;
public:
    ExprNode(SymbolEntry *symbolEntry) : symbolEntry(symbolEntry){};
    SymbolEntry* getSymbolEntry(){ return symbolEntry; };
    // virtual float getValue() { return -1; };
};

class UnaryExpr : public ExprNode
{
private:
    int op;
    ExprNode *expr;
public:
    enum {ADD, SUB, NON};
    UnaryExpr(SymbolEntry *se, int op, ExprNode*expr) : ExprNode(se), op(op), expr(expr){};
    // float getValue();    
    void output(int level);
};

class BinaryExpr : public ExprNode
{
private:
    int op;
    ExprNode *expr1, *expr2;
public:
    enum {ADD, SUB, MUL, DIV, MOD, AND, OR, LESS, GREATER, GORE, LORE, EQUAL, NOTEQUAL};
    BinaryExpr(SymbolEntry *se, int op, ExprNode*expr1, ExprNode*expr2) : ExprNode(se), op(op), expr1(expr1), expr2(expr2){};
    // float getValue();
    void output(int level);
};

class Constant : public ExprNode
{
public:
    Constant(SymbolEntry *se) : ExprNode(se){};
    // float getValue();
    void output(int level);
};

class Id : public ExprNode
{
public:
    Id(SymbolEntry *se) : ExprNode(se){};
    // float getValue();
    void output(int level);
};

class StmtNode : public Node
{};

class CompoundStmt : public StmtNode
{
private:
    StmtNode *stmt;
public:
    CompoundStmt(StmtNode* stmt = nullptr){this->stmt = stmt;};
    void output(int level);
};

class SeqNode : public StmtNode
{
private:
    StmtNode *stmt1, *stmt2;
public:
    SeqNode(StmtNode *stmt1, StmtNode *stmt2) : stmt1(stmt1), stmt2(stmt2){};
    void output(int level);
};

class ExprStmt : public StmtNode {
private:
    ExprNode *expr;
public:
    ExprStmt(ExprNode* expr) : expr(expr){};
    void output(int level);
};

class BlankStmt : public StmtNode {
public:
    BlankStmt(){};
    void output(int level);
};

class DeclStmt : public StmtNode
{
private:
    Id *id;
    ExprNode* expr;
public:
    DeclStmt(Id *id, ExprNode* expr = nullptr);
    void output(int level);
    Id* getId(){ return id; }
};

class IfStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *thenStmt;
public:
    IfStmt(ExprNode *cond, StmtNode *thenStmt) : cond(cond), thenStmt(thenStmt){};
    void output(int level);
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
};

class WhileStmt : public StmtNode {
private:
    ExprNode* cond;
    StmtNode* stmt;
//     BasicBlock* cond_bb;
//     BasicBlock* end_bb;
public:
   //cond如果是i32 要转换为i1的bool类型
    WhileStmt(ExprNode* cond, StmtNode* stmt=nullptr) : cond(cond), stmt(stmt) {
        // if (cond->getType()->isInt() && cond->getType()->getSize() == 32) {
        //     ImplictCastExpr* temp = new ImplictCastExpr(cond);
        //     this->cond = temp;
        // }
    };
    void setStmt(StmtNode* stmt){this->stmt = stmt;};
    void output(int level);
    // bool typeCheck(Type* retType = nullptr);
    // void genCode();
    // BasicBlock* get_cond_bb(){return this->cond_bb;};
    // BasicBlock* get_end_bb(){return this->end_bb;};
};

class BreakStmt : public StmtNode
{
private:
    // StmtNode *breakStmt;
public:
    BreakStmt(){};
    // BreakStmt(StmtNode* BreakStmt) : breakStmt(breakStmt){};
    void output(int level);
    // bool typeCheck(Type* retType = nullptr);
    // void genCode();
};

class ContinueStmt : public StmtNode
{
private:
    // StmtNode *whileStmt;
public:
    ContinueStmt(){};
    // ContinueStmt(StmtNode* whileStmt) : whileStmt(whileStmt){};
    void output(int level);
    // bool typeCheck(Type* retType = nullptr);
    // void genCode();
};

class ReturnStmt : public StmtNode
{
private:
    ExprNode *returnValue;
public:
    ReturnStmt(ExprNode* returnValue = nullptr) : returnValue(returnValue){};
    void output(int level);
    // bool typeCheck(Type* retType = nullptr);
    // void genCode();
};

class AssignStmt : public StmtNode
{
private:
    ExprNode *lval;
    ExprNode *expr;
public:
    AssignStmt(ExprNode *lval, ExprNode *expr) : lval(lval), expr(expr) {};
    void output(int level);
};

class FunctionDef : public StmtNode
{
private:
    SymbolEntry *se;
    DeclStmt *decl;
    StmtNode *stmt;
public:
    FunctionDef(SymbolEntry *se, DeclStmt *decl, StmtNode *stmt) : se(se), decl(decl), stmt(stmt){};
    void output(int level);
};

class CallExpr : public ExprNode {
private:
    ExprNode *param; // 目前还没设计好相关的形参表等内容
public:
    CallExpr(SymbolEntry* se, ExprNode* param = nullptr) : ExprNode(se){this->param = param;};
    void output(int level);
};

class Ast
{
private:
    Node* root;
public:
    Ast() {root = nullptr;}
    void setRoot(Node*n) {root = n;}
    void output();
};

#endif
