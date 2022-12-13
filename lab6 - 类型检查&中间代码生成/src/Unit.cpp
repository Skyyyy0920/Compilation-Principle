#include "Unit.h"
#include <string>
#include "Ast.h"
#include "SymbolTable.h"
#include "Type.h"
extern FILE* yyout;

void Unit::insertFunc(Function *f)
{
    func_list.push_back(f);
}

void Unit::removeFunc(Function *func)
{
    func_list.erase(std::find(func_list.begin(), func_list.end(), func));
}

void Unit::insertGlobal(SymbolEntry* se) {
    global_list.push_back(se);
}

void Unit::output() const
{
    for (auto se : global_list) {
        if(se->getType()->isInt()){
            fprintf(yyout, "%s = global %s %d, align 4\n", se->toStr().c_str(), se->getType()->toStr().c_str(), ((IdentifierSymbolEntry*)se)->getiValue());
        }
        if(se->getType()->isFloat()){
            fprintf(yyout, "%s = global %s %f, align 4\n", se->toStr().c_str(), se->getType()->toStr().c_str(), ((IdentifierSymbolEntry*)se)->getfValue());
        }
    }
    for (auto &func : func_list)
        func->output();
}

Unit::~Unit()
{
    for(auto &func:func_list)
        delete func;
}
