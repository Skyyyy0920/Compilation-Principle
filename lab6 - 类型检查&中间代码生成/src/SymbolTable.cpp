#include "SymbolTable.h"
#include "Type.h"
#include <iostream>
#include <sstream>

ConstantSymbolEntry::ConstantSymbolEntry(Type *type, int ivalue) : SymbolEntry(type, SymbolEntry::CONSTANT) {
    this->ivalue = ivalue;
}

ConstantSymbolEntry::ConstantSymbolEntry(Type *type, float fvalue) : SymbolEntry(type, SymbolEntry::CONSTANT) {
    this->fvalue = fvalue;
}

// 这里需要判断一下再输出
std::string ConstantSymbolEntry::toStr(){
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
SymbolEntry* SymbolTable::lookup(std::string name)
{
    // 很常用，从当前的代码块对应的符号表开始查起，一直查到main函数的符号表
    SymbolTable *temp = identifiers;
    SymbolEntry *result = nullptr;  // 最后的搜索结果
    while (temp != nullptr && result == nullptr) {
        for (auto it : temp->symbolTable) {
            // fprintf(stderr, "lookup %s\n", it.first.c_str());
            if (it.first == name) {
                result = it.second;
                break;
            }
        }
        temp = temp->getPrev();
    }
    return result;
}

SymbolEntry* SymbolTable::searchFunc()
{
    // 寻找距离最近的函数，用于return的类型检查（仿照lookup来写的）
    SymbolTable *temp = identifiers;
    SymbolEntry *func = nullptr;  // 最后的搜索结果
    while (temp != nullptr && func == nullptr) {
        for (auto it : temp->symbolTable) {
            fprintf(stderr, "searchFunc %s\n", it.first.c_str());
            /*func = it.second;
            if (func->getType()->isFunc()) {
                return func;
            }*/
        }
        temp = temp->getPrev();
    }
    return func;
}

bool SymbolTable::checkRepeat(std::string name)
{
    // 在当前的符号表中查找是否有重定义的问题
    SymbolTable *curTable = identifiers;
    for (auto it : curTable->symbolTable) {
        // fprintf(stderr, "checkRepeat %s\n", it.first.c_str());
        if (it.first == name) {
            return true;
        }
    }
    return false;
}

// install the entry into current symbol table.
void SymbolTable::install(std::string name, SymbolEntry* entry)
{
    symbolTable[name] = entry;
}

int SymbolTable::counter = 0;
static SymbolTable t;
SymbolTable *identifiers = &t;
SymbolTable *globals = &t;
