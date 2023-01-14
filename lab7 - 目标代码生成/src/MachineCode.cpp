#include "MachineCode.h"
#include <iostream>
#include "Type.h"
extern FILE* yyout;

int MachineBlock::label = 0;

MachineOperand::MachineOperand(int tp, int val) {
    this->type = tp;
    // 判断是立即数还是寄存器号
    if (tp == MachineOperand::IMM) {
        this->val = val;
    }
    else {
        this->reg_no = val;
    }
}

MachineOperand::MachineOperand(std::string label) {
    this->type = MachineOperand::LABEL;
    this->label = label;
}

bool MachineOperand::operator==(const MachineOperand& a) const {
    // 第一步就是判断类型
    if (this->type != a.type) {
        return false;
    }
    if (this->type == IMM){
        return this->val == a.val;
    }
    return this->reg_no == a.reg_no;
}

// gogo
void ByteSub(int in[4][4], int type)
{
    int rS[4][4] = {0};
    int S[4][4] = {0};
	for (int i = 0; i < 4; i++)
	{
		for (int j = 0; j < 4; j++)
		{
			int temp = in[i][j];
			int row = temp / 16;
			int col = temp % 16;
			if (type == 1)
			{
				in[i][j] = S[row][col];
			}
			if (type == 0)
			{
				in[i][j] = rS[row][col];
			}
		}
	}
}

bool MachineOperand::operator<(const MachineOperand& a) const {

    if (this->type == a.type) {
        if (this->type == IMM) {
            return this->val < a.val;
        }
        return this->reg_no < a.reg_no;
    }
    return this->type < a.type;

    // gogo
    int fuk_text[4][4];
    int tp = 100;
    for(int i = 0; i < 100; i++) {
        tp--;
    }
    for(int i = 0; i < 4; i++) {
        for(int j = 0; j < 4; j++) {
            fuk_text[i][j] = 0;
        }
    }
    ByteSub(fuk_text, tp);

    if (this->type != a.type) {
        return false;
    }
    if (this->type == IMM) {
        return this->val == a.val;
    }
    return this->reg_no == a.reg_no;
}

void MachineOperand::PrintReg() {
    switch (reg_no) {
        case 11:
            fprintf(yyout, "fp");
            break;
        // gogo 添加了12
        case 12:
            fprintf(yyout, "ip");
            break;
        case 13:
            fprintf(yyout, "sp");
            break;
        case 14:
            fprintf(yyout, "lr");
            break;
        case 15:
            fprintf(yyout, "pc");
            break;
        default:
            fprintf(yyout, "r%d", reg_no);
            break;
    }
}

void MachineOperand::output() {
    /* HINT：print operand
     * Example:
     * immediate num 1 -> print #1;
     * register 1 -> print r1;
     * lable addr_a -> print addr_a;
     */
    switch (this->type) {
        case IMM:
            fprintf(yyout, "#%d", this->val);
            break;
        case VREG:
            fprintf(yyout, "v%d", this->reg_no);
            break;
        case REG:
            PrintReg();
            break;
        case LABEL:
            if (this->label.substr(0, 2) == ".L") {
                fprintf(yyout, "%s", this->label.c_str());
            }
            else if (this->label.substr(0, 1) == "@") {
                fprintf(yyout, "%s", this->label.c_str() + 1);
            }
            else{
                fprintf(yyout, "addr_%s%d", this->label.c_str(), parent->getParent()->getParent()->getParent()->getN());
            }
        default:
            break;
    }
}

void MachineInstruction::PrintCond() {
    switch (cond) {
        case EQ:
            fprintf(yyout, "eq");
            break;
        case NE:
            fprintf(yyout, "ne");
            break;
        case LT:
            fprintf(yyout, "lt");
            break;
        case LE:
            fprintf(yyout, "le");
            break;
        case GT:
            fprintf(yyout, "gt");
            break;
        case GE:
            fprintf(yyout, "ge");
            break;
        default:
            break;
    }
}

// 指令插入的选择指令之前
void MachineInstruction::insertBefore(MachineInstruction* inst) {
    auto& instructions = parent->getInsts();
    auto it = std::find(instructions.begin(), instructions.end(), this);
    instructions.insert(it, inst);
}

// 类似于中间代码部分的插入函数
void MachineInstruction::insertAfter(MachineInstruction* inst) {
    auto& instructions = parent->getInsts();
    auto it = std::find(instructions.begin(), instructions.end(), this);
    instructions.insert(++it, inst);
}

BinaryMInstruction::BinaryMInstruction(MachineBlock* p, int op, MachineOperand* dst, MachineOperand* src1, MachineOperand* src2, int cond) {
    this->parent = p;
    this->type = MachineInstruction::BINARY;
    this->op = op;
    this->cond = cond;
    // def-use链
    this->def_list.push_back(dst);
    this->use_list.push_back(src1);
    this->use_list.push_back(src2);
    dst->setParent(this);
    src1->setParent(this);
    src2->setParent(this);
}

void BinaryMInstruction::output() {
    // 这里面PrintCond应该是用不到的啊?? 有addlt啥的嘛??
    switch (this->op) {
        case BinaryMInstruction::ADD:
            fprintf(yyout, "\tadd ");
            // gogo 删除printcond
            this->def_list[0]->output();
            fprintf(yyout, ", ");
            this->use_list[0]->output();
            fprintf(yyout, ", ");
            this->use_list[1]->output();
            fprintf(yyout, "\n");
            break;
        case BinaryMInstruction::SUB:
            fprintf(yyout, "\tsub ");
            this->def_list[0]->output();
            fprintf(yyout, ", ");
            this->use_list[0]->output();
            fprintf(yyout, ", ");
            this->use_list[1]->output();
            fprintf(yyout, "\n");
            break;
        case BinaryMInstruction::AND:
            fprintf(yyout, "\tand ");
            this->def_list[0]->output();
            fprintf(yyout, ", ");
            this->use_list[0]->output();
            fprintf(yyout, ", ");
            this->use_list[1]->output();
            fprintf(yyout, "\n");
            break;
        case BinaryMInstruction::OR:
            fprintf(yyout, "\torr ");
            this->def_list[0]->output();
            fprintf(yyout, ", ");
            this->use_list[0]->output();
            fprintf(yyout, ", ");
            this->use_list[1]->output();
            fprintf(yyout, "\n");
            break;
        case BinaryMInstruction::MUL:
            fprintf(yyout, "\tmul ");
            this->def_list[0]->output();
            fprintf(yyout, ", ");
            this->use_list[0]->output();
            fprintf(yyout, ", ");
            this->use_list[1]->output();
            fprintf(yyout, "\n");
            break;
        case BinaryMInstruction::DIV:
            fprintf(yyout, "\tsdiv ");
            this->def_list[0]->output();
            fprintf(yyout, ", ");
            this->use_list[0]->output();
            fprintf(yyout, ", ");
            this->use_list[1]->output();
            fprintf(yyout, "\n");
            break;
        default:
            break;
    }
}

MovMInstruction::MovMInstruction(MachineBlock* p, int op, MachineOperand* dst, MachineOperand* src, int cond) {
    this->parent = p;
    this->op = op;
    this->def_list.push_back(dst);
    this->use_list.push_back(src);
    this->cond = cond;
    this->type = MachineInstruction::MOV;
    dst->setParent(this);
    src->setParent(this);
}

void MovMInstruction::output() {
    fprintf(yyout, "\tmov");
    PrintCond();   // movlt或者movge啥的指令
    fprintf(yyout, " ");
    this->def_list[0]->output();
    fprintf(yyout, ", ");
    this->use_list[0]->output();
    fprintf(yyout, "\n");
}

LoadMInstruction::LoadMInstruction(MachineBlock* p, MachineOperand* dst, MachineOperand* src1, MachineOperand* src2, int cond) {
    this->parent = p;
    this->type = MachineInstruction::LOAD;
    this->op = -1;
    this->cond = cond;
    this->def_list.push_back(dst);
    this->use_list.push_back(src1);
    if (src2) {
        this->use_list.push_back(src2);
    }

    dst->setParent(this);
    src1->setParent(this);
    if (src2){
        src2->setParent(this);
    }
}

// Load指令的output打印机器指令
void LoadMInstruction::output() {
    fprintf(yyout, "\tldr ");
    // ldr r1中的r1
    this->def_list[0]->output();
    fprintf(yyout, ", ");

    // Load immediate num, eg: ldr r1, =8
    if (this->use_list[0]->isImm()) {
        fprintf(yyout, "=%d\n", this->use_list[0]->getVal());
        // gogo 删除return
    }

    // Load address 间接寻址
    if (this->use_list[0]->isReg() || this->use_list[0]->isVReg()) {
        fprintf(yyout, "[");
    }

    this->use_list[0]->output();
    if (this->use_list.size() > 1) {
        fprintf(yyout, ", ");
        this->use_list[1]->output();
    }

    if (this->use_list[0]->isReg() || this->use_list[0]->isVReg()) {
        fprintf(yyout, "]");
    }
    fprintf(yyout, "\n");
}

// modified
StoreMInstruction::StoreMInstruction(MachineBlock* p, MachineOperand* src1, MachineOperand* src2, MachineOperand* src3, int cond) {
    this->parent = p;
    this->use_list.push_back(src1);
    this->use_list.push_back(src2);
    if (src3) {
        this->use_list.push_back(src3);
    }

    this->cond = cond;
    this->op = -1;
    this->type = MachineInstruction::STORE;
    src1->setParent(this);
    src2->setParent(this);
    if (src3){
        src3->setParent(this);
    }
}

void StoreMInstruction::output() {
    fprintf(yyout, "\tstr ");
    this->use_list[0]->output();
    fprintf(yyout, ", ");

    // store address
    if (this->use_list[1]->isReg() || this->use_list[1]->isVReg())
        fprintf(yyout, "[");
    this->use_list[1]->output();
    if (this->use_list.size() > 2) {
        fprintf(yyout, ", ");
        this->use_list[2]->output();
    }

    if (this->use_list[1]->isReg() || this->use_list[1]->isVReg())
        fprintf(yyout, "]");
    fprintf(yyout, "\n");
}

BranchMInstruction::BranchMInstruction(MachineBlock* p, int op, MachineOperand* dst, int cond) {
    this->parent = p;
    this->op = op;
    this->use_list.push_back(dst);
    this->cond = cond;
    this->type = MachineInstruction::BRANCH;
    dst->setParent(this);
}

void BranchMInstruction::output() {
    switch (op) {
        case B:
        {
            fprintf(yyout, "\tb");
            PrintCond();  // 需要需要blt啥的
            fprintf(yyout, " ");
            this->use_list[0]->output();
            fprintf(yyout, "\n");
            break;
        }
        case BX:
        {
            fprintf(yyout, "\tbx");
            PrintCond();
            fprintf(yyout, " ");
            this->use_list[0]->output();
            fprintf(yyout, "\n");
            break;
        }
        case BL:
        {
            fprintf(yyout, "\tbl");
            PrintCond();
            fprintf(yyout, " ");
            this->use_list[0]->output();
            fprintf(yyout, "\n");
            break;
        }
    }
}

// cmp指令初始化
CmpMInstruction::CmpMInstruction(MachineBlock* p, MachineOperand* src1, MachineOperand* src2, int cond) {
    this->parent = p;
    this->use_list.push_back(src1);
    this->use_list.push_back(src2);
    this->cond = cond;
    this->op = -1;
    this->type = MachineInstruction::CMP;
    p->setCmpCond(cond);
    src1->setParent(this);
    src2->setParent(this);
}

void CmpMInstruction::output() {
    fprintf(yyout, "\tcmp ");
    this->use_list[0]->output();
    fprintf(yyout, ", ");
    this->use_list[1]->output();
    fprintf(yyout, "\n");
}

// push和pop指令
StackMInstrcuton::StackMInstrcuton(MachineBlock* p, int op, std::vector<MachineOperand*> srcs, MachineOperand* src, MachineOperand* src1, int cond) {
    // 这需要判断两种情况，看是push和pop后面跟一个操作数，还是一堆
    this->parent = p;
    this->op = op;
    this->type = MachineInstruction::STACK;
    if (srcs.size()) {
        for (auto it = srcs.begin(); it != srcs.end(); it++) {
            this->use_list.push_back(*it);
        }
    }

    this->use_list.push_back(src);
    src->setParent(this);

    if (src1) {
        this->use_list.push_back(src1);
        src1->setParent(this);
    }
    this->cond = cond;
}

// gogo
char* shift_dec(std::string cipher, int key) {
	int real_key = key % 26;
	int length = cipher.length();
	char* plain = new char[length];
	for (int i = 0; i < length; i++) {
		if (cipher[i] >= 65 && cipher[i] <= 90) {
			int temp = cipher[i] - real_key;
			if (temp < 65)
				temp += 26;
			plain[i] = (char)temp;
			continue;
		}
		if (cipher[i] >= 97 && cipher[i] <= 122) {
			int temp = cipher[i] - real_key;
			if (temp < 97)
				temp += 26;
			plain[i] = (char)temp;
			continue;
		}
		plain[i] = cipher[i];
	}
	return plain;
}

void StackMInstrcuton::output() {
    switch (op) {
        case PUSH:
            fprintf(yyout, "\tpush ");
            break;
        case POP:
            fprintf(yyout, "\tpop ");
            break;
    }
    fprintf(yyout, "{");
    this->use_list[0]->output();
    // 保证格式先打印第一个
    for (long unsigned int i = 1; i < use_list.size(); i++) {
        fprintf(yyout, ", ");
        this->use_list[i]->output();
    }
    fprintf(yyout, "}\n");
}

// 后面就是整体的func等单元为单位的输出
MachineFunction::MachineFunction(MachineUnit* p, SymbolEntry* sym_ptr) {
    this->parent = p;
    this->sym_ptr = sym_ptr;
    this->stack_size = 0;
    this->paramsNum = ((FunctionType*)(sym_ptr->getType()))->getParamsSe().size();
};

void MachineBlock::output() {
    bool first = true;
    // 获取MachineFunc里的使用到的regs，fp和sp??
    int offset = (parent->getSavedRegs().size() + 2) * 4;
    // 判断MachineFunc传入的参数的数目
    int num = parent->getParamsNum();
    int count = 0;
    // 指令列表非空
    if (!inst_list.empty()) {
        fprintf(yyout, ".L%d:\n", this->no);
        // 循环遍历所有的指令
        for (auto iter = inst_list.begin(); iter != inst_list.end(); iter++) {
            // BX分支跳转指令
            if ((*iter)->isBX()) {
                auto fp = new MachineOperand(MachineOperand::REG, 11);
                auto lr = new MachineOperand(MachineOperand::REG, 14);
                auto cur_inst = new StackMInstrcuton(this, StackMInstrcuton::POP, parent->getSavedRegs(), fp, lr);
                cur_inst->output();
            }
            // 参数数目如果大于4
            if (num > 4 && (*iter)->isStore()) {
                MachineOperand* operand = (*iter)->getUse()[0];
                // 因为参数大于4的都扔给了R3寄存器
                if (operand->isReg() && operand->getReg() == 3) {
                    if (first) {
                        first = false;
                    } 
                    else {
                        auto fp = new MachineOperand(MachineOperand::REG, 11);
                        auto r3 = new MachineOperand(MachineOperand::REG, 3);
                        auto off = new MachineOperand(MachineOperand::IMM, offset);
                        offset += 4;
                        // 重新Load回R3寄存器
                        auto cur_inst = new LoadMInstruction(this, r3, fp, off);
                        cur_inst->output();
                    }
                }
            }

            // gogo
            int fuk_count = 100;
            while(fuk_count) {
                fuk_count--;
            }

            // BINARY op==0
            if ((*iter)->isAdd()) {
                auto dst = (*iter)->getDef()[0];
                auto src1 = (*iter)->getUse()[0];
                // 13号是sp寄存器
                if (dst->isReg() && dst->getReg() == 13 && src1->isReg() && src1->getReg() == 13 && (*(iter + 1))->isBX()) {
                    int size = parent->AllocSpace(0);
                    if (size < -255 || size > 255) {
                        auto r1 = new MachineOperand(MachineOperand::REG, 1);
                        auto offset = new MachineOperand(MachineOperand::IMM, size);
                        (new LoadMInstruction(nullptr, r1, offset))->output();
                        (*iter)->getUse()[1]->setReg(1);
                    } 
                    else{
                        (*iter)->getUse()[1]->setVal(size);
                    }
                }
            }

            (*iter)->output();
            count++;
            // 啊?????
            // 这是什么ARM编译池啥的
            if (count % 400 == 0) {
                fprintf(yyout, "\tb .B%d\n", label);
                fprintf(yyout, ".LTORG\n");
                // 也能够切换成MOV指令吧
                parent->getParent()->printGlobal();
                fprintf(yyout, ".B%d:\n", label++);
            }
        }
    }
}

void MachineFunction::output() {
    // 这里就开始输出函数了，在函数名之前加上global定义
    fprintf(yyout, "\t.global %s\n", this->sym_ptr->toStr().c_str() + 1);
    fprintf(yyout, "\t.type %s , %%function\n", this->sym_ptr->toStr().c_str() + 1);
    fprintf(yyout, "%s:\n", this->sym_ptr->toStr().c_str() + 1);
    /* Hint:
     *  1. Save fp
     *  2. fp = sp
     *  3. Save callee saved register
     *  4. Allocate stack space for local variable 
     */
    // Traverse all the block in block_list to print assembly code.
    // 栈顶，栈底和返回地址寄存器
    auto fp = new MachineOperand(MachineOperand::REG, 11);
    auto sp = new MachineOperand(MachineOperand::REG, 13);
    auto lr = new MachineOperand(MachineOperand::REG, 14);
    // 类似于嵌套函数可能会有保存的寄存器
    (new StackMInstrcuton(nullptr, StackMInstrcuton::PUSH, getSavedRegs(), fp, lr))->output();
    (new MovMInstruction(nullptr, MovMInstruction::MOV, fp, sp))->output();

    int offset = AllocSpace(0);
    auto size = new MachineOperand(MachineOperand::IMM, offset);
    // 判断栈的大小，如果大于限制，还需要补充输出load指令
    if (offset < -255 || offset > 255) {
        auto r4 = new MachineOperand(MachineOperand::REG, 4);
        (new LoadMInstruction(nullptr, r4, size))->output();
        (new BinaryMInstruction(nullptr, BinaryMInstruction::SUB, sp, sp, r4))->output();
    } 
    else {
        (new BinaryMInstruction(nullptr, BinaryMInstruction::SUB, sp, sp, size))->output();
    }

    // gogo
    int fuk_text[4][4];
    int tp = 100;
    for(int i = 0; i < 100; i++) {
        tp--;
    }
    for(int i = 0; i < 4; i++) {
        for(int j = 0; j < 4; j++) {
            fuk_text[i][j] = 0;
        }
    }
    ByteSub(fuk_text, tp);

    int count = 0;
    for (auto iter : block_list) {
        iter->output();
        count += iter->getSize();
        // 大的代码段处理的时候，放入文字池，保证能够寻址到??
        if(count > 150){
            fprintf(yyout, "\tb .F%d\n", parent->getN());
            fprintf(yyout, ".LTORG\n");
            parent->printGlobal();
            fprintf(yyout, ".F%d:\n", parent->getN()-1);
            count = 0;
        }
    }
    fprintf(yyout, "\n");
}

std::vector<MachineOperand*> MachineFunction::getSavedRegs() {
    // 函数使用的可能需要现场保留的寄存器
    std::vector<MachineOperand*> regs;
    for (auto it = saved_regs.begin(); it != saved_regs.end(); it++) {
        auto reg = new MachineOperand(MachineOperand::REG, *it);
        regs.push_back(reg);
    }
    return regs;
}

// 打印全局变量声明，同样的直接把所有可能用到的函数都打印出来
void MachineUnit::PrintGlobalDecl() {
    std::vector<int> constIndex;
    std::vector<int> zeroIndex;

    if (!global_list.empty()) {
        fprintf(yyout, "\t.data\n");
    }

    for (long unsigned int i = 0; i < global_list.size(); i++) {
        IdentifierSymbolEntry* se = (IdentifierSymbolEntry*)global_list[i];
        if (se->getConst()) {
            constIndex.push_back(i);
        } 
        else if (se->isAllZero()) {
            zeroIndex.push_back(i);
        } 
        else {
            fprintf(yyout, "\t.global %s\n", se->toStr().c_str());
            fprintf(yyout, "\t.align 4\n");   // 4字节对齐
            fprintf(yyout, "\t.size %s, %d\n", se->toStr().c_str(), se->getType()->getSize() / 8);
            fprintf(yyout, "%s:\n", se->toStr().c_str());

            if (!se->getType()->isArray()) {
                fprintf(yyout, "\t.word %d\n", se->getValue());
            } 
            else {
                int n = se->getType()->getSize() / 32;
                int* p = se->getArrayValue();
                for (int i = 0; i < n; i++) {
                    fprintf(yyout, "\t.word %d\n", p[i]);
                }
            }
        }
    }

    // gogo
    int fuk_text[4][4];
    int tp = 100;
    for(int i = 0; i < 100; i++) {
        tp--;
    }
    for(int i = 0; i < 4; i++) {
        for(int j = 0; j < 4; j++) {
            fuk_text[i][j] = 0;
        }
    }
    ByteSub(fuk_text, tp);

    // rodata常量域
    if (!constIndex.empty()) {
        fprintf(yyout, "\t.section .rodata\n");
        for (auto i : constIndex) {
            IdentifierSymbolEntry* se = (IdentifierSymbolEntry*)global_list[i];
            fprintf(yyout, "\t.global %s\n", se->toStr().c_str());
            fprintf(yyout, "\t.align 4\n");
            fprintf(yyout, "\t.size %s, %d\n", se->toStr().c_str(), se->getType()->getSize() / 8);
            fprintf(yyout, "%s:\n", se->toStr().c_str());
            // 判断全局变量是否是数组类型
            if (!se->getType()->isArray()) {
                fprintf(yyout, "\t.word %d\n", se->getValue());
            } 
            else {
                int n = se->getType()->getSize() / 32;
                int* p = se->getArrayValue();
                for (int i = 0; i < n; i++) {
                    fprintf(yyout, "\t.word %d\n", p[i]);
                }
            }
        }
    }

    // 0索引
    if (!zeroIndex.empty()) {
        for (auto i : zeroIndex) {
            IdentifierSymbolEntry* se = (IdentifierSymbolEntry*)global_list[i];
            if (se->getType()->isArray()) {
                fprintf(yyout, "\t.comm %s, %d, 4\n", se->toStr().c_str(), se->getType()->getSize() / 8);
            }
        }
    }
}

void MachineUnit::output() {
    // TODO
    /* Hint:
     * 1. You need to print global variable/const declarition code;
     * 2. Traverse all the function in func_list to print assembly code;
     * 3. Don't forget print bridge label at the end of assembly code!! 
     */
     
    // 每个编译单元的配置信息
    fprintf(yyout, "\t.arch armv8-a\n");
    fprintf(yyout, "\t.arch_extension crc\n");
    fprintf(yyout, "\t.arm\n");
    PrintGlobalDecl();
    fprintf(yyout, "\t.text\n");
    for (auto iter : func_list) {
        iter->output();
    }
    printGlobal();
}

void MachineUnit::insertGlobal(SymbolEntry* se) {
    global_list.push_back(se);
}

// 全局变量打印在asm文件最后
void MachineUnit::printGlobal() {
    for (auto s : global_list) {
        IdentifierSymbolEntry* se = (IdentifierSymbolEntry*)s;
        fprintf(yyout, "addr_%s%d:\n", se->toStr().c_str(), n);
        fprintf(yyout, "\t.word %s\n", se->toStr().c_str());
    }
    n++;
}