#include "Type.h"
#include <sstream>

IntType TypeSystem::commonInt = IntType(4);  // 这里传入的是byte为单位，区别于框架代码中的bit
FloatType TypeSystem::commonFloat = FloatType(4);
BoolType TypeSystem::commonBool = BoolType(1);
VoidType TypeSystem::commonVoid = VoidType();
IntType TypeSystem::commonConstInt = IntType(4, true);
FloatType TypeSystem::commonConstFloat = FloatType(4, true);
BoolType TypeSystem::commonConstBool = BoolType(1, true);

Type* TypeSystem::intType = &commonInt;
Type* TypeSystem::floatType = &commonFloat;
Type* TypeSystem::boolType = &commonBool;
Type* TypeSystem::voidType = &commonVoid;
Type* TypeSystem::constIntType = &commonConstInt;
Type* TypeSystem::constFloatType = &commonConstFloat;
Type* TypeSystem::constBoolType = &commonConstBool;

std::string IntType::toStr()
{
    if (type_constant) {
        return "const int";
    }
    else {
        return "int";
    }
}

std::string FloatType::toStr()
{
    if (type_constant) {
        return "const float";
    }
    else {
        return "float";
    }
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

std::string VoidType::toStr()
{
    return "void";
}

std::string FunctionType::toStr()
{
    std::ostringstream buffer;
    buffer << returnType->toStr();  // << "()";
    return buffer.str();
}

std::string PointerType::toStr()
{
    std::ostringstream buffer;
    buffer << valueType->toStr();  // << "*";
    return buffer.str();
}
