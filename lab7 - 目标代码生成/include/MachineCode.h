#ifndef __MACHINECODE_H__
#define __MACHINECODE_H__
#include <set>
#include <string>
#include <vector>
#include <fstream>
#include <algorithm>
#include "SymbolTable.h"

/* Hint:
 * MachineUnit: Compiler unit
 * MachineFunction: Function in assembly code
 * MachineInstruction: Single assembly instruction
 * MachineOperand: Operand in assembly instruction, such as immediate number(IMM),
 * register, address label 
 */

/* Todo:
 * We only give the example code of "class BinaryMInstruction" and "class
 * AccessMInstruction" (because we believe in you !!!)(?????), You need to complete
 * other the member function, especially "output()" , After that, you can use
 * "output()" to print assembly code . 
 */


class MachineUnit;
class MachineFunction;
class MachineBlock;
class MachineInstruction;
class MachineOperand;


// 机器代码编译单元
class MachineUnit {  
private:
    int n;
    std::vector<SymbolEntry*> global_list;
    std::vector<MachineFunction*> func_list;
public:
    std::vector<MachineFunction*>& getFuncs() { return func_list; };
    std::vector<MachineFunction*>::iterator begin() { return func_list.begin(); };
    std::vector<MachineFunction*>::iterator end() { return func_list.end(); };
    void InsertFunc(MachineFunction* func) { func_list.push_back(func); };
    void insertGlobal(SymbolEntry*);
    void printGlobal();
    void PrintGlobalDecl();
    void setN(int num){ this->n = num;}
    int getN() const { return n; };
    void output();
};

class MachineFunction {
private:
    MachineUnit* parent;
    SymbolEntry* sym_ptr;  // 函数的符号表
    std::vector<MachineBlock*> block_list;
    std::set<int> saved_regs;
    int stack_size;   // 栈大小
    int paramsNum;
public:
    MachineFunction(MachineUnit* p, SymbolEntry* sym_ptr);
    std::vector<MachineBlock*>& getBlocks() { return block_list; };
    std::vector<MachineBlock*>::iterator begin() { return block_list.begin(); };
    std::vector<MachineBlock*>::iterator end() { return block_list.end(); };
    /* HINT:
     * Alloc stack space for local variable;
     * return current frame offset ;
     * we store offset in symbol entry of this variable in function
     * AllocInstruction::genMachineCode() you can use this function in
     * LinearScan::genSpillCode() 
     */
    int AllocSpace(int size) { 
        this->stack_size += size;
        return this->stack_size;
    };
    void InsertBlock(MachineBlock* block) { this->block_list.push_back(block); };
    void addSavedRegs(int regno) { saved_regs.insert(regno); };
    std::vector<MachineOperand*> getSavedRegs();
    int getParamsNum() const { return paramsNum; };
    MachineUnit* getParent() const { return parent; };
    void output();
};

class MachineBlock {
private:
    MachineFunction* parent;
    int no;
    std::vector<MachineBlock*> pred, succ;   // 前驱和后继，控制流图
    std::vector<MachineInstruction*> inst_list;
    std::set<MachineOperand*> live_in;
    std::set<MachineOperand*> live_out;
    int cmpCond;
    static int label;
public:
    MachineBlock(MachineFunction* p, int no) {
        this->parent = p;
        this->no = no;
    };
    MachineFunction* getParent() const { return parent; };
    std::vector<MachineInstruction*>& getInsts() { return inst_list; };
    std::vector<MachineInstruction*>::iterator begin() { return inst_list.begin(); };
    std::vector<MachineInstruction*>::iterator end() { return inst_list.end(); };
    void InsertInst(MachineInstruction* inst) { this->inst_list.push_back(inst); };
    void addPred(MachineBlock* p) { this->pred.push_back(p); };
    void addSucc(MachineBlock* s) { this->succ.push_back(s); };
    std::vector<MachineBlock*>& getPreds() { return pred; };
    std::vector<MachineBlock*>& getSuccs() { return succ; };
    std::set<MachineOperand*>& getLiveIn() { return live_in; };
    std::set<MachineOperand*>& getLiveOut() { return live_out; };
    void setCmpCond(int cond) { cmpCond = cond; };
    int getCmpCond() const { return cmpCond; };
    int getSize() const { return inst_list.size(); };
    void output();
};

class MachineInstruction {
protected:
    int no;
    int type;                             // Instruction type
    int cond = MachineInstruction::NONE;  // Instruction execution condition 指令执行条件??是那个立即数不能超过255??
    int op;                               // Instruction opcode 机器指令操作码
    MachineBlock* parent;
    enum instType { BINARY, LOAD, STORE, MOV, BRANCH, CMP, STACK };
    // Instruction operand list, sorted by appearance order in assembly 指令操作数列表
    // instruction
    // 机器代码操作数
    std::vector<MachineOperand*> def_list;
    std::vector<MachineOperand*> use_list;
    void addDef(MachineOperand* ope) { def_list.push_back(ope); };
    void addUse(MachineOperand* ope) { use_list.push_back(ope); };
    // Print execution code after printing opcode 打印操作码后打印执行代码
    void PrintCond();
public:
    enum condType { EQ, NE, LT, LE, GT, GE, NONE };
    void setNo(int no) { this->no = no; };
    int getNo() { return no; };
    std::vector<MachineOperand*>& getDef() { return def_list; };
    std::vector<MachineOperand*>& getUse() { return use_list; };
    void insertBefore(MachineInstruction*);   // 插入机器代码指令
    void insertAfter(MachineInstruction*);
    MachineBlock* getParent() const { return parent; };
    // BX是表示分支指令
    bool isBX() const { return type == BRANCH && op == 2; };
    bool isLoad() const { return type == LOAD; };
    bool isStore() const { return type == STORE; };
    bool isAdd() const { return type == BINARY && op == 0; };
    virtual void output() = 0;
};

class MachineOperand {
private:
    int type;            // 机器指令的类型
    int val;             // 立即数的值
    int reg_no;          // 寄存器号
    std::string label;   // 地址label
    MachineInstruction* parent;       // 指令的父节点
public:
    enum { IMM, VREG, REG, LABEL };   // 操作数类型
public:
    MachineOperand(int tp, int val);
    MachineOperand(std::string label);
    bool operator==(const MachineOperand&) const;
    bool operator<(const MachineOperand&) const;  // ???重构了比较运算符??比较reg_no??
    bool isImm() { return this->type == IMM; };
    bool isReg() { return this->type == REG; };
    bool isVReg() { return this->type == VREG; };
    bool isLabel() { return this->type == LABEL; };
    void setVal(int val) { this->val = val; };
    int getVal() { return this->val; };
    void setReg(int regno) { this->type = REG; this->reg_no = regno; };
    int getReg() { return this->reg_no; };
    void setLabel(std::string label) { this->label = label; };
    std::string getLabel() { return this->label; };
    void setParent(MachineInstruction* p) { this->parent = p; };
    MachineInstruction* getParent() { return this->parent; };
    void PrintReg();
    void output();
};


class BinaryMInstruction : public MachineInstruction {
public:
    enum opType { ADD, SUB, MUL, DIV, AND, OR };   // 二元运算包含的运算类型
    BinaryMInstruction(MachineBlock* p,
                       int op,
                       MachineOperand* dst,
                       MachineOperand* src1,
                       MachineOperand* src2,
                       int cond = MachineInstruction::NONE);
    void output();
};

// ldr r4, [fp, #-12]
class LoadMInstruction : public MachineInstruction {
   public:
    LoadMInstruction(MachineBlock* p,
                     MachineOperand* dst,
                     MachineOperand* src1,
                     MachineOperand* src2 = nullptr,
                     int cond = MachineInstruction::NONE);
    void output();
};

// str r4, [fp, #-12]
class StoreMInstruction : public MachineInstruction {
public:
    StoreMInstruction(MachineBlock* p,
                      MachineOperand* src1,
                      MachineOperand* src2,
                      MachineOperand* src3 = nullptr,
                      int cond = MachineInstruction::NONE);
    void output();
};

// mov r0, r5
class MovMInstruction : public MachineInstruction {
public:
    enum opType { MOV, MVN };    // MVN是反向传送（Move Negative）指令
    MovMInstruction(MachineBlock* p,
                    int op,
                    MachineOperand* dst,
                    MachineOperand* src,
                    int cond = MachineInstruction::NONE);
    void output();
};

// bx lr lr:指返回地址处
class BranchMInstruction : public MachineInstruction {
public:
    enum opType { B, BL, BX };   // BL 带返回的跳转指令 BX 带状态的跳转指令
    BranchMInstruction(MachineBlock* p,
                       int op,
                       MachineOperand* dst,
                       int cond = MachineInstruction::NONE);
    void output();
};

// cmp r4, r5
class CmpMInstruction : public MachineInstruction {
public:
    enum opType { CMP };
    CmpMInstruction(MachineBlock* p,
                    MachineOperand* src1,
                    MachineOperand* src2,
                    int cond = MachineInstruction::NONE);
    void output();
};

// 栈操作指令
class StackMInstrcuton : public MachineInstruction {
public:
    enum opType { PUSH, POP };
    StackMInstrcuton(MachineBlock* p,
                     int op,
                     std::vector<MachineOperand*> srcs,    // 这里设置了两种形式??
                     MachineOperand* src,
                     MachineOperand* src1 = nullptr,
                     int cond = MachineInstruction::NONE);
    void output();
};

#endif