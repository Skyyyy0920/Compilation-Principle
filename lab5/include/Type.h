#ifndef __TYPE_H__
#define __TYPE_H__
#include <vector>
#include <string>
#include "SymbolTable.h"

// 虚基类
class Type
{
private:                 //private
    int kind;   
protected:              //protected
    enum {INT, VOID, FUNC, FLOAT};
public:
    Type(int kind) : kind(kind) {};
    virtual ~Type() {};
    virtual std::string toStr() = 0;
    bool isInt() const {return kind == INT;};
    bool isVoid() const {return kind == VOID;};
    bool isFunc() const {return kind == FUNC;};
    bool isFloat() const {return kind == FLOAT;};
};

class IntType : public Type
{
private:
    int size;
    bool type_constant;
public:
    IntType(int size, bool type_constant = false) : Type(Type::INT), size(size), type_constant(type_constant){};
    bool is_type_Const() const { return type_constant; };
    std::string toStr();
};

// 浮点数符号系统
class FloatType : public Type
{
private:
    int size;
    bool type_constant;
public:
    FloatType(int size, bool type_constant = false) : Type(Type::FLOAT), size(size), type_constant(type_constant){};
    bool is_type_Const() const { return type_constant; };
    std::string toStr();
};

class VoidType : public Type
{
public:
    VoidType() : Type(Type::VOID){};
    std::string toStr();
};

class FunctionType : public Type
{
private:
    Type *returnType;
    std::vector<SymbolEntry*> params;  // 存储parameters的type和id
public:
    FunctionType(Type* returnType, std::vector<SymbolEntry*> params) : Type(Type::FUNC), returnType(returnType), params(params){}
    std::string toStr();
};

class TypeSystem
{
private:
    static IntType commonInt;
    static FloatType commonFloat;
    static VoidType commonVoid;
    static IntType commonConstInt;
    static FloatType commonConstFloat;
public:
    static Type *intType;
    static Type *floatType;
    static Type *voidType;
    static Type *constIntType;
    static Type *constFloatType;
};

#endif
