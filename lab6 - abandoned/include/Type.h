#ifndef __TYPE_H__
#define __TYPE_H__
#include <vector>
#include <string>
#include "SymbolTable.h"

// 虚基类
class Type
{
private:
    int kind;
    int size;   
protected:
    enum {INT, VOID, FUNC, FLOAT, PTR, BOOL};
public:
    Type(int kind, long long size = 0) : kind(kind), size(size) {};
    virtual ~Type() {};
    virtual std::string toStr() = 0;
    bool isInt() const {return kind == INT;};
    bool isVoid() const {return kind == VOID;};
    bool isFunc() const {return kind == FUNC;};
    bool isFloat() const {return kind == FLOAT;};
    bool isBool() const {return kind == BOOL;};
    int getSize() const { return size; };

    virtual Type* getReturnType() = 0;  // 其实这个函数只在funcType中使用，但是由于C++的继承问题，不设置成虚基类没法用
    // 后续: 太菜了，不需要再写什么虚函数，强制类型转换就行了！！！不过这里先不改了，做个警示
};

class IntType : public Type
{
private:
    // int size;
    bool type_constant;
public:
    IntType(int size, bool type_constant = false) : Type(Type::INT, size), type_constant(type_constant){};
    bool is_type_Const() const { return type_constant; };
    std::string toStr();
    Type* getReturnType() { return nullptr; };
};

// 浮点数符号系统
class FloatType : public Type
{
private:
    // int size;
    bool type_constant;
public:
    FloatType(int size, bool type_constant = false) : Type(Type::FLOAT, size), type_constant(type_constant){};
    bool is_type_Const() const { return type_constant; };
    std::string toStr();
    Type* getReturnType() { return nullptr; };
};

class VoidType : public Type
{
public:
    VoidType() : Type(Type::VOID){};
    std::string toStr();
    Type* getReturnType() { return nullptr; };
};

class BoolType : public Type
{
private:
    // int size;
    bool type_constant;
public:
    BoolType(int size, bool type_constant = false) : Type(Type::BOOL, size), type_constant(type_constant){};
    bool is_type_Const() const { return type_constant; };
    std::string toStr();
    Type* getReturnType() { return nullptr; };
};

class FunctionType : public Type
{
private:
    Type *returnType;
    std::vector<SymbolEntry*> params;  // 存储parameters的type和id
public:
    FunctionType(Type* returnType, std::vector<SymbolEntry*> params) : Type(Type::FUNC), returnType(returnType), params(params){}
    std::string toStr();
    Type* getReturnType() { return returnType; };
    std::vector<SymbolEntry*> getParams() { return params; }
};

class PointerType : public Type
{
private:
    Type *valueType;
public:
    PointerType(Type* valueType) : Type(Type::PTR) { this->valueType = valueType; };
    std::string toStr();
    Type* getReturnType() { return nullptr; };
};


class TypeSystem
{
private:
    static IntType commonInt;
    static FloatType commonFloat;
    // static BoolType commonBool;
    static IntType commonBool;
    static VoidType commonVoid;
    static IntType commonConstInt;
    static FloatType commonConstFloat;
    static BoolType commonConstBool;
public:
    static Type *intType;
    static Type *floatType;
    static Type *boolType;
    static Type *voidType;
    static Type *constIntType;
    static Type *constFloatType;
    static Type *constBoolType;
};

#endif