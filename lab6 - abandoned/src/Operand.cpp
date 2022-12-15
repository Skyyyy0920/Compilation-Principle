#include "Operand.h"
#include <sstream>
#include <algorithm>
#include <string.h>

std::string Operand::toStr() const
{
    return se->toStr();
}

void Operand::removeUse(Instruction *inst)
{
    auto i = std::find(uses.begin(), uses.end(), inst);
    // 找到了就从指令序列之中删除掉这条指令
    if(i != uses.end())
        uses.erase(i);
}

