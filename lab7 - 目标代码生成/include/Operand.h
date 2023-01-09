#ifndef __OPERAND_H__
#define __OPERAND_H__

#include "SymbolTable.h"
#include <vector>

class Instruction;
class Function;


// class Operand - The operand of an instruction.
// 指令操作数
class Operand
{
typedef std::vector<Instruction *>::iterator use_iterator;

private:
    Instruction *def;                // The instruction where this operand is defined. 定义操作数
    std::vector<Instruction *> uses; // Intructions that use this operand.
    SymbolEntry *se;                 // The symbol entry of this operand. 操作数的符号表项
public:
    Operand(SymbolEntry*se) :se(se){def = nullptr;};
    void setDef(Instruction *inst) {def = inst;};
    void addUse(Instruction *inst) { uses.push_back(inst); };
    void removeUse(Instruction *inst);
    int usersNum() const {return uses.size();}; // 使用该操作数的指令个数

    use_iterator use_begin() {return uses.begin();};
    use_iterator use_end() {return uses.end();};
    Type* getType() {return se->getType();};
    std::string toStr() const;
    SymbolEntry * getEntry() { return se; };
    Instruction* getDef() { return def; };
};

#endif