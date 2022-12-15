#ifndef __INSTRUCTION_H__
#define __INSTRUCTION_H__

#include "Operand.h"
#include <vector>
#include <map>

class BasicBlock;

class Instruction
{
protected:
    unsigned instType; // 指令类型
    unsigned opcode; // 操作码
    Instruction *prev;
    Instruction *next;
    BasicBlock *parent;  // 所在的基本块
    std::vector<Operand*> operands;  // 该条指令的操作数
    enum {BINARY, COND, UNCOND, RET, LOAD, STORE, CMP, ALLOCA, CALL, XOR, ZEXT}; // 函数调用添加，可能还要添加类型转换
public:
    Instruction(unsigned instType, BasicBlock *insert_bb = nullptr);
    virtual ~Instruction();
    BasicBlock *getParent();
    bool isUncond() const {return instType == UNCOND;};
    bool isCond() const {return instType == COND;};
    bool isRet() const {return instType == RET;};
    void setParent(BasicBlock *);
    void setNext(Instruction *);
    void setPrev(Instruction *);
    Instruction *getNext();
    Instruction *getPrev();
    virtual void output() const = 0;  // 虚基类
};

// meaningless instruction, used as the head node of the instruction list.
// 双向链表的空链表头
class DummyInstruction : public Instruction
{
public:
    DummyInstruction() : Instruction(-1, nullptr) {};
    void output() const {};
};

// 补充的xor指令用于异或操作
class XorInstruction : public Instruction {
public:
    XorInstruction(Operand* dst, Operand* src, BasicBlock* insert_bb = nullptr);
    ~XorInstruction();
    void output() const;
};

// 用于bool类型到int类型的隐式转换
class ZextInstruction : public Instruction {
public:
    ZextInstruction(Operand* dst, Operand* src, BasicBlock* insert_bb = nullptr);
    ~ZextInstruction();
    void output() const;
};

// 内存分配指令，dst就是=号左侧
class AllocaInstruction : public Instruction
{
public:
    AllocaInstruction(Operand *dst, SymbolEntry *se, BasicBlock *insert_bb = nullptr);
    ~AllocaInstruction();
    void output() const;
private:
    SymbolEntry *se; // ？？
};

// 内存中加载
class LoadInstruction : public Instruction
{
public:
    LoadInstruction(Operand *dst, Operand *src_addr, BasicBlock *insert_bb = nullptr);
    ~LoadInstruction();
    void output() const;
};

class StoreInstruction : public Instruction
{
public:
    StoreInstruction(Operand *dst_addr, Operand *src, BasicBlock *insert_bb = nullptr);
    ~StoreInstruction();
    void output() const;
};

class BinaryInstruction : public Instruction
{
public:
    BinaryInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb = nullptr);
    ~BinaryInstruction();
    void output() const;
    enum {SUB, ADD, AND, OR, MUL, DIV, MOD}; // 补充了其余的二元运算符，也就是opcode
};

class CmpInstruction : public Instruction
{
public:
    CmpInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb = nullptr);
    ~CmpInstruction();
    void output() const;
    enum {E, NE, L, GE, G, LE};
};

// unconditional branch 无条件跳转指令
class UncondBrInstruction : public Instruction
{
public:
    UncondBrInstruction(BasicBlock*, BasicBlock *insert_bb = nullptr);
    void output() const;
    void setBranch(BasicBlock *);
    BasicBlock *getBranch(); // 返回bb的指针？？
protected:
    BasicBlock *branch; // 构造的时候可以直接设置好
};

// conditional branch
class CondBrInstruction : public Instruction
{
public:
    CondBrInstruction(BasicBlock*, BasicBlock*, Operand *, BasicBlock *insert_bb = nullptr);
    ~CondBrInstruction();
    void output() const;
    void setTrueBranch(BasicBlock*);
    BasicBlock* getTrueBranch();
    void setFalseBranch(BasicBlock*);
    BasicBlock* getFalseBranch();
protected:
    BasicBlock* true_branch;
    BasicBlock* false_branch;
};

// 补充call指令
class CallInstruction : public Instruction 
{
protected:
    Operand* dst; // call指令操作码
    SymbolEntry* func; // 函数名符号表项，可添加
public:
    CallInstruction(Operand* dst, SymbolEntry* func, std::vector<Operand*> params, BasicBlock* insert_bb = nullptr);
    ~CallInstruction();
    void output() const;
};

// return指令
class RetInstruction : public Instruction
{
public:
    RetInstruction(Operand *src, BasicBlock *insert_bb = nullptr);
    ~RetInstruction();
    void output() const;
};

#endif