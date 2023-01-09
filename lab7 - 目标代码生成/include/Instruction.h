#ifndef __INSTRUCTION_H__
#define __INSTRUCTION_H__

#include <map>
#include <sstream>
#include <vector>
#include "AsmBuilder.h"
#include "Operand.h"

class BasicBlock;

class Instruction {
protected:
    unsigned instType;  // 指令类型
    unsigned opcode;  // 操作码
    Instruction* prev;
    Instruction* next;
    BasicBlock* parent;  // 所在的基本块
    std::vector<Operand*> operands;  // 该条指令的操作数
    enum { BINARY, COND, UNCOND, RET, LOAD, STORE, CMP, ALLOCA, CALL, ZEXT, XOR, GEP };
public:
    Instruction(unsigned instType, BasicBlock* insert_bb = nullptr);
    virtual ~Instruction();
    virtual void output() const = 0;  // 虚基类
    BasicBlock* getParent();
    bool isUncond() const { return instType == UNCOND; };
    bool isCond() const { return instType == COND; };
    bool isAlloc() const { return instType == ALLOCA; };
    bool isRet() const { return instType == RET; };
    void setParent(BasicBlock*);
    void setNext(Instruction*);
    void setPrev(Instruction*);
    Instruction* getNext();
    Instruction* getPrev();
    MachineOperand* genMachineOperand(Operand*);
    MachineOperand* genMachineReg(int reg);
    MachineOperand* genMachineVReg();
    MachineOperand* genMachineImm(int val);
    MachineOperand* genMachineLabel(int block_no);
    virtual void genMachineCode(AsmBuilder*) = 0;
};

// meaningless instruction, used as the head node of the instruction list.
class DummyInstruction : public Instruction { // 双向链表的空链表头 
public:
    DummyInstruction() : Instruction(-1, nullptr){};
    void output() const {};
    void genMachineCode(AsmBuilder*){};
};

class AllocaInstruction : public Instruction {
private:
    SymbolEntry* se;  // ???
public:
    AllocaInstruction(Operand *dst, SymbolEntry *se, BasicBlock *insert_bb = nullptr);
    ~AllocaInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};

class LoadInstruction : public Instruction { // 内存中加载
public:
    LoadInstruction(Operand *dst, Operand *src_addr, BasicBlock *insert_bb = nullptr);
    ~LoadInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};

class StoreInstruction : public Instruction {
public:
    StoreInstruction(Operand *dst_addr, Operand *src, BasicBlock *insert_bb = nullptr);
    ~StoreInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};

class BinaryInstruction : public Instruction {
public:
    enum { SUB, ADD, AND, OR, MUL, DIV, MOD };
public:
    BinaryInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb = nullptr);
    ~BinaryInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};

class CmpInstruction : public Instruction {
public:
    enum { E, NE, L, LE, G, GE };
public:
    CmpInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb = nullptr);
    ~CmpInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};

// unconditional branch 无条件跳转指令
class UncondBrInstruction : public Instruction {
protected:
    BasicBlock* branch;  // 构造的时候可以直接设置好
public:
    UncondBrInstruction(BasicBlock*, BasicBlock* insert_bb = nullptr);
    void output() const;
    void setBranch(BasicBlock*);
    BasicBlock* getBranch();  // 返回bb的指针？？
    void genMachineCode(AsmBuilder*);
};

// conditional branch
class CondBrInstruction : public Instruction {
protected:
    BasicBlock* true_branch;
    BasicBlock* false_branch;
    enum  { EQ, NE, LT, LE, GT, GE, NONE };
public:
    CondBrInstruction(BasicBlock*, BasicBlock*, Operand *, BasicBlock *insert_bb = nullptr);
    ~CondBrInstruction();
    void output() const;
    void setTrueBranch(BasicBlock*);
    BasicBlock* getTrueBranch();
    void setFalseBranch(BasicBlock*);
    BasicBlock* getFalseBranch();
    void genMachineCode(AsmBuilder*);
};

class RetInstruction : public Instruction { // return指令
public:
    RetInstruction(Operand* src, BasicBlock* insert_bb = nullptr);
    ~RetInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};

class CallInstruction : public Instruction {
private:
    Operand* dst;
    SymbolEntry* func;
public:
    CallInstruction(Operand* dst, SymbolEntry* func, std::vector<Operand*> params, BasicBlock* insert_bb = nullptr);
    ~CallInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};

class ZextInstruction : public Instruction { // 用于bool类型到int类型的隐式转换
public:
    ZextInstruction(Operand* dst, Operand* src, BasicBlock* insert_bb = nullptr);
    ~ZextInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};

class XorInstruction : public Instruction { // 补充的xor指令用于异或操作
public:
    XorInstruction(Operand* dst, Operand* src, BasicBlock* insert_bb = nullptr);
    ~XorInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};

class GepInstruction : public Instruction {
private:
    bool paramFirst;
    bool first;
    bool last;
    Operand* init;
public:
    GepInstruction(Operand* dst, Operand* arr, Operand* idx, BasicBlock* insert_bb = nullptr, bool paramFirst = false);
    ~GepInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
    void setFirst() { first = true; };
    void setLast() { last = true; };
    Operand* getInit() const { return init; };
    void setInit(Operand* init) { this->init = init; };
};

#endif