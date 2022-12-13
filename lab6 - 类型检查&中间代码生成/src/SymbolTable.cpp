#include "SymbolTable.h"
#include "Type.h"
#include <iostream>
#include <sstream>


bool SymbolEntry::setNext(SymbolEntry* se)  // 判断新声明的函数是否可以作为函数重载
{
    SymbolEntry* s = this;
    SymbolEntry* sss = nullptr;
    int newCount = ((FunctionType*)(se->getType()))->getParams().size();  // 新声明的函数形参个数

    while (s) {
        if (newCount == int(((FunctionType*)(s->getType()))->getParams().size())) {  // 如果当前这个已声明的函数形参个数与新声明的相等
            bool flag = 0;
            for (int i = 0; i < newCount; i++) {  // 遍历每个形参，只要有某个位置两个形参类型不同即可算作函数重载
                if (((FunctionType*)(s->getType()))->getParams()[i]->getType()->toStr() != ((FunctionType*)(se->getType()))->getParams()[i]->getType()->toStr()) {
                    flag = 1;
                }
            }
            if (!flag) {  // flag=0, 表示有已声明的函数形参表与新声明的一模一样, 那么算作函数重定义
                fprintf(stderr, "函数 %s 重定义\n", se->toStr().c_str());
                return false;
            }
        }
        sss = s;
        s = s->getNext();
    }

    fprintf(stderr, "函数 %s 重载\n", se->toStr().c_str());
    if (sss == this) {  // 这里为什么非要多此一举用ifelse? 直接sss->setNext(se)不行吗? 不行! 会出现递归调用
        this->next = se;
    } else {
        sss->setNext(se);
    }
    return true;
}

ConstantSymbolEntry::ConstantSymbolEntry(Type *type, int ivalue) : SymbolEntry(type, SymbolEntry::CONSTANT) {
    this->ivalue = ivalue;
}

ConstantSymbolEntry::ConstantSymbolEntry(Type *type, float fvalue) : SymbolEntry(type, SymbolEntry::CONSTANT) {
    this->fvalue = fvalue;
}

// 这里需要判断一下再输出
std::string ConstantSymbolEntry::toStr()
{
    if(type->isInt())
    {
        std::ostringstream buffer;
        buffer << ivalue;
        return buffer.str();
    }
    else
    {
        std::ostringstream buffer;
        buffer << fvalue;
        return buffer.str();
    }
}

IdentifierSymbolEntry::IdentifierSymbolEntry(Type *type, std::string name, int scope) : SymbolEntry(type, SymbolEntry::VARIABLE), name(name)
{
    this->scope = scope;
}

// 这里主要实现对于符号表中的数值对应关系
void IdentifierSymbolEntry::setiValue(int ivalue){
    this->ivalue = ivalue;
}

void IdentifierSymbolEntry::setfValue(float fvalue){
    this->fvalue = fvalue;
}

std::string IdentifierSymbolEntry::toStr()
{
    return name;
}

TemporarySymbolEntry::TemporarySymbolEntry(Type *type, int label) : SymbolEntry(type, SymbolEntry::TEMPORARY)
{
    this->label = label;
}

std::string TemporarySymbolEntry::toStr()
{
    std::ostringstream buffer;
    buffer << "t" << label;
    return buffer.str();
}

SymbolTable::SymbolTable()
{
    prev = nullptr; // 初始化设置为nullptr
    level = 0;
}

SymbolTable::SymbolTable(SymbolTable *prev)
{
    this->prev = prev;
    this->level = prev->level + 1;
}

/*
    Description: lookup the symbol entry of an identifier in the symbol table
    Parameters: 
        name: identifier name
    Return: pointer to the symbol entry of the identifier

    hint:
    1. The symbol table is a stack. The top of the stack contains symbol entries in the current scope.
    2. Search the entry in the current symbol table at first.
    3. If it's not in the current table, search it in previous ones(along the 'prev' link).
    4. If you find the entry, return it.
    5. If you can't find it in all symbol tables, return nullptr.
*/
SymbolEntry* SymbolTable::lookup(std::string name)  // 很常用，从当前的代码块对应的符号表开始查起，一直查到main函数的符号表
{
    // 很常用，从当前的代码块对应的符号表开始查起，一直查到global的符号表
    SymbolTable *temp = identifiers;
    SymbolEntry *result = nullptr;  // 最后的搜索结果
    while (temp != nullptr && result == nullptr) {
        for (auto it : temp->symbolTable) {
            if (it.first == name) {
                // fprintf(stderr, "lookup %s\n", name.c_str());
                result = it.second;
                break;
            }
        }
        temp = temp->getPrev();
    }
    return result;
}

SymbolEntry* SymbolTable::searchFunc()  // 寻找距离最近的函数，用于return的类型检查（仿照lookup来写的）
{
    SymbolTable *temp = identifiers;
    SymbolEntry *func = nullptr;  // 最后的搜索结果
    while (temp != nullptr && func == nullptr) {
        for (auto it : temp->symbolTable) {
            // fprintf(stderr, "searchFunc %s\n", it.first.c_str());
            func = it.second;
            if (func->getType()->isFunc()) {
                return func;
            }
        }
        temp = temp->getPrev();
    }
    return func;
}

SymbolEntry* SymbolTable::checkRepeat(std::string name)  // 在当前的符号表中查找是否有重定义的问题
{
    SymbolTable *curTable = this;
    // fprintf(stderr, "%s\n", name.c_str());
    for (auto it : curTable->symbolTable) {
        // fprintf(stderr, "checkRepeat %s\n", it.first.c_str());
        if (it.first == name) {
            return it.second;
        }
    }
    return nullptr;
}

// install the entry into current symbol table.
bool SymbolTable::install(std::string name, SymbolEntry* entry)  // 将SymbolEntry存入符号表，同时检查重定义的问题
{
    // fprintf(stderr, "install %s\n", name.c_str());
    SymbolEntry* se = nullptr;
    if (entry->getType()->isFunc()) se = identifiers->getPrev()->checkRepeat(name);  // 如果是函数, 需要到上一级符号表去找
    else se = identifiers->checkRepeat(name);

    /*
    fprintf(stderr, "checkRepeat ");
    if (entry->getType()->isFunc()) {
        for (auto it : identifiers->getPrev()->symbolTable) {
            fprintf(stderr, "%s ", it.first.c_str());
        }
    }
    else {
        for (auto it : identifiers->symbolTable) {
            fprintf(stderr, "%s ", it.first.c_str());
        }
    }
    fprintf(stderr, "\n");
    */

    if (se) {  // 判断是否在同一作用域下重复定义
        if (se->getType()->isFunc()) {
            // fprintf(stderr, "函数 %s 重定义???\n", se->toStr().c_str());
            return se->setNext(entry);
        }
        else {
            fprintf(stderr,"Id %s 重定义\n", name.c_str());
            return false;
        }
    }

    symbolTable[name] = entry;
    return true;
}

int SymbolTable::counter = 0;
static SymbolTable t;
SymbolTable *identifiers = &t;
SymbolTable *globals = &t;
