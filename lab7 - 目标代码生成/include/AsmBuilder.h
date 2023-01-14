#ifndef __ASMBUILDER_H__
#define __ASMBUILDER_H__

#include "MachineCode.h"


class AsmBuilder {
public:
    MachineUnit* mUnit;    // 机器代码生成单元，类似于中间代码Unit
    MachineFunction* mFunction;   // 目前正在生成机器代码的func
    MachineBlock* mBlock;   // 目前机器代码基本块
    int cmpOpcode;   // CmpInstruction的操作码，判断是blt等指令类型

    
    int branchOpcode;     // gogo
    float floatOpcode;         // gogo
    void setbranchOpcode(int opcode){ this->branchOpcode = opcode; }     // gogo
    int getbranchOpcode() { return this->branchOpcode; };     // gogo
    MachineFunction* FuckFunction() { return this->mFunction; };     // gogo
    void setfloatOpcode(float opcode){ this->floatOpcode = opcode; }     // gogo
    int getfloatOpcode() { return this->floatOpcode; };     // gogo


    void setUnit(MachineUnit* unit) { this->mUnit = unit; };
    void setFunction(MachineFunction* func) { this->mFunction = func; };
    void setBlock(MachineBlock* block) { this->mBlock = block; };
    void setCmpOpcode(int opcode) { this->cmpOpcode = opcode; };
    int getCmpOpcode() { return this->cmpOpcode; };
    MachineUnit* getUnit() { return this->mUnit; };
    MachineFunction* getFunction() { return this->mFunction; };
    MachineBlock* getBlock() { return this->mBlock; };
};


#endif