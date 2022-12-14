#ifndef __IRBUILDER_H__
#define __IRBUILDER_H__

class Unit;
class Function;
class BasicBlock;

class IRBuilder 
{
private:
    Unit *unit;  // 编译单元，包含多个函数
    BasicBlock *insertBB;  // current基本块，用于插入指令

public:
    IRBuilder(Unit*unit) : unit(unit) {};
    void setInsertBB(BasicBlock*bb) { insertBB = bb; };  // 这个就是用于控制流来切换基本块的
    Unit* getUnit() {return unit;};
    BasicBlock* getInsertBB() { return insertBB; };  // 获取当前基本块（因为是private不能直接访问）
};

#endif