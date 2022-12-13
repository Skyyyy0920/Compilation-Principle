#ifndef __FUNCTION_H__
#define __FUNCTION_H__

#include <vector>
#include <map>
#include <set>
#include <algorithm>
#include <iostream>
#include "BasicBlock.h"
#include "SymbolTable.h"

class Unit;

class Function
{
    typedef std::vector<BasicBlock *>::iterator iterator; // bb的迭代器
    typedef std::vector<BasicBlock *>::reverse_iterator reverse_iterator;

private:
    std::vector<BasicBlock *> block_list; // 每个函数对应vector容器内的基本块
    SymbolEntry *sym_ptr; // 函数自身的符号表项
    BasicBlock *entry;
    Unit *parent;
    BasicBlock *exitbb; // 结束节点，在完成函数最后一个bb之后添加？？
public:
    Function(Unit *, SymbolEntry *); // 初始化还带着符号表项
    ~Function();
    void insertBlock(BasicBlock *bb) { block_list.push_back(bb); };
    BasicBlock *getEntry() { return entry; }; //返回入口基本块
    BasicBlock *getExit() { return exitbb; }; //返回结束ret基本块
    void setExit(BasicBlock *bb) { exitbb = bb; }; //返回结束ret基本块
    void remove(BasicBlock *bb);
    void output() const;
    std::vector<BasicBlock *> &getBlockList(){return block_list;};
    iterator begin() { return block_list.begin(); };
    iterator end() { return block_list.end(); };
    reverse_iterator rbegin() { return block_list.rbegin(); };
    reverse_iterator rend() { return block_list.rend(); };
    SymbolEntry *getSymPtr() { return sym_ptr; };
};

#endif
