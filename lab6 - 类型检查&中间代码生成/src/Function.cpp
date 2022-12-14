#include "Function.h"
#include "Unit.h"
#include "Type.h"
#include <list>

extern FILE* yyout;

Function::Function(Unit *u, SymbolEntry *s)
{
    u->insertFunc(this);
    entry = new BasicBlock(this); // 新创建开始的基本块
    sym_ptr = s;
    parent = u;
}

Function::~Function()
{
    auto delete_list = block_list;
    for (auto &i : delete_list)
        delete i;
    parent->removeFunc(this);
}

// remove the basicblock bb from its block_list.
void Function::remove(BasicBlock *bb)
{
    block_list.erase(std::find(block_list.begin(), block_list.end(), bb));
}

void Function::output() const
{
    FunctionType* funcType = dynamic_cast<FunctionType*>(sym_ptr->getType()); // 父类转换成子类，这块儿一定是函数的ID
    Type *retType = funcType->getReturnType();
    // 这里要输出形参
    std::vector<SymbolEntry*> params = funcType->getParams();
    // 如果为空
    if (!params.size()){
        fprintf(yyout, "define %s %s() {\n", retType->toStr().c_str(), sym_ptr->toStr().c_str());
    }
    else {
        fprintf(yyout, "define %s %s(", retType->toStr().c_str(), sym_ptr->toStr().c_str());
        for (long unsigned int i = 0; i < params.size(); i++) {
            if (i > 0){
                fprintf(yyout, ", ");
            }
            fprintf(yyout, "%s %s", params[i]->getType()->toStr().c_str(), params[i]->toStr().c_str());
        }
        fprintf(yyout, ") {\n");
    }
    // fprintf(yyout, "define %s %s() {\n", retType->toStr().c_str(), sym_ptr->toStr().c_str());
    std::set<BasicBlock *> v;
    std::list<BasicBlock *> q;
    q.push_back(entry);
    v.insert(entry);
    while (!q.empty())
    {
        auto bb = q.front();
        q.pop_front();
        bb->output();
        for (auto succ = bb->succ_begin(); succ != bb->succ_end(); succ++)
        {
            // set数据结构iter查找，如果没有查找到就返回end
            if (v.find(*succ) == v.end())
            {
                v.insert(*succ);
                q.push_back(*succ);
            }
        }
    }
    // 函数打印完成
    fprintf(yyout, "}\n");
}
