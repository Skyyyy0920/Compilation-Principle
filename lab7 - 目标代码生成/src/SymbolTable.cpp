#include "SymbolTable.h"
#include <iostream>
#include <sstream>
#include "Type.h"

bool SymbolEntry::setNext(SymbolEntry* se) {
    SymbolEntry* s = this;
    SymbolEntry* sss = nullptr;
    int newCount = ((FunctionType*)(se->getType()))->getParamsSe().size();  // 新声明的函数形参个数

    while (s) {
        if (newCount == int(((FunctionType*)(s->getType()))->getParamsSe().size())) {  // 如果当前这个已声明的函数形参个数与新声明的相等
            bool flag = 0;
            for (int i = 0; i < newCount; i++) {  // 遍历每个形参，只要有某个位置两个形参类型不同即可算作函数重载
                if (((FunctionType*)(s->getType()))->getParamsSe()[i]->getType()->toStr() != ((FunctionType*)(se->getType()))->getParamsSe()[i]->getType()->toStr()) {
                    flag = 1;
                }
            }
            if (!flag) {  // flag=0, 表示有已声明的函数形参表与新声明的一模一样, 那么算作函数重定义
                fprintf(stderr, "函数 %s 重定义!\n", se->toStr().c_str());
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

    /*
    SymbolEntry* s = this;
    long unsigned int cnt =
        ((FunctionType*)(se->getType()))->getParamsType().size();
    if (cnt == ((FunctionType*)(s->getType()))->getParamsType().size())
        return false;
    while (s->getNext()) {
        if (cnt == ((FunctionType*)(s->getType()))->getParamsType().size())
            return false;
        s = s->getNext();
    }
    if (s == this) {
        this->next = se;
    } else {
        s->setNext(se);
    }
    return true;
    */
}

SymbolEntry::SymbolEntry(Type* type, int kind) {
    this->type = type;
    this->kind = kind;
}

ConstantSymbolEntry::ConstantSymbolEntry(Type* type, int value) : SymbolEntry(type, SymbolEntry::CONSTANT) {
    assert(type->isInt());
    this->value = value;
}

ConstantSymbolEntry::ConstantSymbolEntry(Type* type, std::string value) : SymbolEntry(type, SymbolEntry::CONSTANT) {
    assert(type->isString());
    this->strValue = value;
}

ConstantSymbolEntry::ConstantSymbolEntry(Type* type) : SymbolEntry(type, SymbolEntry::CONSTANT) {
    // assert(type->isArray());
}

int ConstantSymbolEntry::getValue() const {
    assert(type->isInt());
    return value;
}

std::string ConstantSymbolEntry::getStrValue() const {
    assert(type->isString());
    return strValue;
}

std::string ConstantSymbolEntry::toStr() {
    // TODO
    std::ostringstream buffer;
    if (type->isInt())
        buffer << value;
    else if (type->isString())
        buffer << strValue;
    return buffer.str();
}

// gogo
int for_decline(int a, int b) {
	int third = b & 0x8;
	int second = b & 0x4;
	int first = b & 0x2;
	int firstMod = b % 2;
	int res = 0;

	if (third) {
		int temp = a;
		for (int i = 1; i <= 3; ++i) {
			temp = temp << 1;
			if (temp >= 256) {
				temp = temp ^ 0x11b;
			}
		}
		temp = temp % 256;
		res = res ^ temp;
	}
	if (second) {
		int temp = a;
		for (int i = 1; i <= 2; ++i) {
			temp = temp << 1;
			if (temp >= 256) {
				temp = temp ^ 0x11b;
			}
		}
		temp = temp % 256;
		res = res ^ temp;
	}
	if (first) {
		int temp = a;
		temp = temp << 1;
		if (temp >= 256) {
			temp = temp ^ 0x11b;
		}
		temp = temp % 256;
		res = res ^ temp;
	}
	if (firstMod) {
		res = res ^ a;
	}
	return res;
}

IdentifierSymbolEntry::IdentifierSymbolEntry(Type* type, std::string name, int scope, int paramNo, bool sysy)
: SymbolEntry(type, SymbolEntry::VARIABLE), name(name), sysy(sysy), paramNo(paramNo) {
    this->scope = scope;
    this->initial = false;
    this->label = -1;
    this->allZero = false;
    this->constant = false;
}

void IdentifierSymbolEntry::setValue(int value) {
    if (((IntType*)(this->getType()))->isConst()) {
        if (!initial) {
            this->value = value;
            initial = true;
        } else {
            // 需要报错
        }
    } else {
        this->value = value;
    }
}

void IdentifierSymbolEntry::setArrayValue(int* arrayValue) {
    if (((IntType*)(this->getType()))->isConst()) {
        if (!initial) {
            this->arrayValue = arrayValue;
            initial = true;
        } else {
            // 需要报错
        }
    } else {
        this->arrayValue = arrayValue;
    }
}

std::string IdentifierSymbolEntry::toStr() {
    std::ostringstream buffer;
    if (label < 0) {  // label < 0, 要么是全局变量要么是函数定义，为了适应机器代码需要将其设置回来
        // modified 这里中间代码和机器代码不一样
        // buffer << '@';
        // buffer << name;
        if (type->isFunc()){
            buffer << '@';
        }
        buffer << name;
    }
    else {
        buffer << "%t" << label;
    }
    return buffer.str();
}

TemporarySymbolEntry::TemporarySymbolEntry(Type* type, int label) : SymbolEntry(type, SymbolEntry::TEMPORARY) {
    this->label = label;
}

std::string TemporarySymbolEntry::toStr() {
    std::ostringstream buffer;
    buffer << "%t" << label;
    return buffer.str();
}

SymbolTable::SymbolTable() {
    prev = nullptr;
    level = 0;
}

SymbolTable::SymbolTable(SymbolTable* prev) {
    this->prev = prev;
    this->level = prev->level + 1;
}

/*
    Description: lookup the symbol entry of an identifier in the symbol table
    Parameters:
        name: identifier name
    Return: pointer to the symbol entry of the identifier

    hint:
    1. The symbol table is a stack. The top of the stack contains symbol entries
   in the current scope.
    2. Search the entry in the current symbol table at first.
    3. If it's not in the current table, search it in previous ones(along the
   'prev' link).
    4. If you find the entry, return it.
    5. If you can't find it in all symbol tables, return nullptr.
*/
SymbolEntry* SymbolTable::lookup(std::string name) {
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
    /*
    SymbolTable* table = this;
    while (table != nullptr)
        if (table->symbolTable.find(name) != table->symbolTable.end()) {
            return table->symbolTable[name];
        } else {
            table = table->prev;
        }
    return nullptr;
    */
}

SymbolEntry* SymbolTable::searchFunc()  // 寻找距离最近的函数，用于return的类型检查(已废弃不用)
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
bool SymbolTable::install(std::string name, SymbolEntry* entry) {
    // fprintf(stderr, "install %s\n", name.c_str());
    SymbolEntry* se = nullptr;
    if (entry->getType()->isFunc()) {  // 如果是函数, 需要到上一级符号表去找
        se = identifiers->getPrev()->checkRepeat(name);
    }
    else {
        se = identifiers->checkRepeat(name);
    }

    if (se) {  // 判断是否在同一作用域下重复定义
        if (se->getType()->isFunc()) {
            return se->setNext(entry);
        }
        else {
            fprintf(stderr,"Id %s 重定义!\n", name.c_str());
            return false;
        }
    }

    symbolTable[name] = entry;
    return true;
    
    /*
    // 同时检查是否重定义
    if (this->symbolTable.find(name) != this->symbolTable.end()) {
        SymbolEntry* se = this->symbolTable[name];
        if (se->getType()->isFunc())
            return se->setNext(entry);
        return false;
    } else {
        symbolTable[name] = entry;
        return true;
    }
    */
}

int SymbolTable::counter = 0;
static SymbolTable t;
SymbolTable* identifiers = &t;
SymbolTable* globals = &t;
