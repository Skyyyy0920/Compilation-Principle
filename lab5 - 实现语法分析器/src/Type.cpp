#include "Type.h"
#include <sstream>

IntType TypeSystem::commonInt = IntType(4);
FloatType TypeSystem::commonFloat = FloatType(4);  // 应该是字节大小吧
VoidType TypeSystem::commonVoid = VoidType();
IntType TypeSystem::commonConstInt = IntType(4, true);
FloatType TypeSystem::commonConstFloat = FloatType(4, true);

Type* TypeSystem::intType = &commonInt;
Type* TypeSystem::floatType = &commonFloat;
Type* TypeSystem::voidType = &commonVoid;
Type* TypeSystem::constIntType = &commonConstInt;
Type* TypeSystem::constFloatType = &commonConstFloat;

std::string IntType::toStr()
{
    if(type_constant){
        return "const int";
    }
    else{
        return "int";
    }
}

std::string FloatType::toStr()
{
    if(type_constant){
        return "const float";
    }
    else{
        return "float";
    }
}

std::string VoidType::toStr()
{
    return "void";
}

std::string FunctionType::toStr()
{
    std::ostringstream buffer;
    buffer << returnType->toStr() << "()";
    return buffer.str();
}
