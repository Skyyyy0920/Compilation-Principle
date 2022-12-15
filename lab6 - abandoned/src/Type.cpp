#include "Type.h"
#include <sstream>

IntType TypeSystem::commonInt = IntType(32);
IntType TypeSystem::commonBool = IntType(1);
VoidType TypeSystem::commonVoid = VoidType();
FloatType TypeSystem::commonFloat = FloatType(32);
IntType TypeSystem::commonConstInt = IntType(32, true);
FloatType TypeSystem::commonConstFloat = FloatType(32, true);
BoolType TypeSystem::commonConstBool = BoolType(1, true);

Type* TypeSystem::intType = &commonInt;
Type* TypeSystem::floatType = &commonFloat;
Type* TypeSystem::boolType = &commonBool;
Type* TypeSystem::voidType = &commonVoid;
Type* TypeSystem::constIntType = &commonConstInt;
Type* TypeSystem::constFloatType = &commonConstFloat;
Type* TypeSystem::constBoolType = &commonConstBool;

// 这要改一下改成输出的是i32，tostr函数打印中间代码要为i32
std::string IntType::toStr()
{
    std::ostringstream buffer;
    if (type_constant)
        buffer << "i";
    else
        buffer << "i";
    buffer << this->getSize();
    return buffer.str();
}

std::string FloatType::toStr()
{
    return "float";
}

std::string VoidType::toStr()
{
    return "void";
}

std::string BoolType::toStr()
{
    if (type_constant) {
        return "const bool";
    }
    else {
        return "bool";
    }
}

std::string FunctionType::toStr()
{
    std::ostringstream buffer;
    buffer << returnType->toStr(); // << "()";
    return buffer.str();
}

std::string PointerType::toStr()
{
    std::ostringstream buffer;
    buffer << valueType->toStr() << "*";
    return buffer.str();
}
