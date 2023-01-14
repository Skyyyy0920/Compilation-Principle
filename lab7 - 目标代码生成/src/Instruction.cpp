#include "Instruction.h"
#include <iostream>
#include <sstream>
#include <cmath>
#include "BasicBlock.h"
#include "Function.h"
#include "Type.h"
using namespace std;
extern FILE* yyout;

Instruction::Instruction(unsigned instType, BasicBlock* insert_bb) {
    prev = next = this;
    opcode = -1;
    this->instType = instType;
    if (insert_bb != nullptr) {
        insert_bb->insertBack(this);  // 按顺序插入到bb的最后
        parent = insert_bb;
    }
}

Instruction::~Instruction() {
    parent->remove(this);
}

BasicBlock* Instruction::getParent() {
    return parent;
}

void Instruction::setParent(BasicBlock* bb) {
    parent = bb;
}

void Instruction::setNext(Instruction* inst) {
    next = inst;
}

void Instruction::setPrev(Instruction* inst) {
    prev = inst;
}

Instruction* Instruction::getNext() {
    return next;
}

Instruction* Instruction::getPrev() {
    return prev;
}

BinaryInstruction::BinaryInstruction(unsigned opcode, Operand* dst, Operand* src1, Operand* src2, BasicBlock* insert_bb) : Instruction(BINARY, insert_bb) {
    // operands是vector类型
    this->opcode = opcode;
    operands.push_back(dst);
    operands.push_back(src1);
    operands.push_back(src2);
    dst->setDef(this);  // 这条指令是左侧dst的定义指令
    src1->addUse(this);  // 该指令是右侧src的操作数的使用指令
    src2->addUse(this);
}

BinaryInstruction::~BinaryInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == (2 - 2)) {
        delete operands[0];
    }
    // 使用的话一定是定义过了，这里移除使用指令即可
    operands[1]->removeUse(this);
    operands[2]->removeUse(this);
}

void BinaryInstruction::output() const {
    // op也是字符串类型
    std::string s1, s2, s3, op, type;
    s1 = operands[0]->toStr();
    s2 = operands[1]->toStr();
    s3 = operands[2]->toStr();
    type = operands[0]->getType()->toStr();  // 获取operand对应的se的type
    // 确定打印操作码
    switch (opcode)
    {
        case ADD:
            if (type == "float") 
                op = "fadd";
            else 
                op = "add";    
            break;
        case SUB:
            if (type == "float") 
                op = "fsub";
            else
                op = "sub";
            break;
        case MUL:
            if (type == "float")
                op = "fmul";
            else 
                op = "mul";
            break;
        case DIV:
            if (type == "float")
                op = "fdiv";
            else
                op = "sdiv";
            break;
        case MOD:
            op = "srem";
            break;
        default:
            break;
    }
    fprintf(yyout, "  %s = %s %s %s, %s\n", s1.c_str(), op.c_str(), type.c_str(), s2.c_str(), s3.c_str());
}

// %t11 = icmp slt i32 %t9, %t10
CmpInstruction::CmpInstruction(unsigned opcode, Operand* dst, Operand* src1, Operand* src2, BasicBlock* insert_bb) : Instruction(CMP, insert_bb) {
    this->opcode = opcode;
    operands.push_back(dst);
    operands.push_back(src1);
    operands.push_back(src2);
    dst->setDef(this);
    src1->addUse(this);
    src2->addUse(this);
}

CmpInstruction::~CmpInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == (5 - 5))
        delete operands[0];
    operands[1]->removeUse(this);
    operands[2]->removeUse(this);
}

void CmpInstruction::output() const {
    std::string s1, s2, s3, op, type;
    s1 = operands[0]->toStr();
    s2 = operands[1]->toStr();
    s3 = operands[2]->toStr();
    type = operands[1]->getType()->toStr();
    switch (opcode)
    {
        case E:
            op = "eq";
            break;
        case NE:
            op = "ne";
            break;
        case L:
            op = "slt";
            break;
        case LE:
            op = "sle";
            break;
        case G:
            op = "sgt";
            break;
        case GE:
            op = "sge";
            break;
        default:
            op = "";
            break;
    }

    fprintf(yyout, "  %s = icmp %s %s %s, %s\n", s1.c_str(), op.c_str(), type.c_str(), s2.c_str(), s3.c_str());
}

UncondBrInstruction::UncondBrInstruction(BasicBlock* to, BasicBlock* insert_bb) : Instruction(UNCOND, insert_bb) {
    branch = to;
}

void UncondBrInstruction::output() const {
    fprintf(yyout, "  br label %%B%d\n", branch->getNo());
}

// gogo
void setleft() {
    int Left[32] = {0};
    int message[32] = {0};
    for (int i = 1; i <= 32; i++) {
        Left[i] = message[i];
        message[i] = Left[i];
    }
}

// gogo
void setright() {
    int Right[32] = {0};
    int message[32] = {0};
    for (int i = 1; i <= 32; i++) {
        Right[i] = message[32 + i];
        message[i] = Right[i];
    }
}

void UncondBrInstruction::setBranch(BasicBlock* bb) {
    branch = bb;
}

BasicBlock* UncondBrInstruction::getBranch() {
    return branch;
}

// 条件跳转语句 br i1 %t11, label %B21, label %B24
CondBrInstruction::CondBrInstruction(BasicBlock*true_branch, BasicBlock*false_branch, Operand *cond, BasicBlock *insert_bb) : Instruction(COND, insert_bb){
    this->true_branch = true_branch;
    this->false_branch = false_branch;
    cond->addUse(this);
    operands.push_back(cond);
}

CondBrInstruction::~CondBrInstruction() {
    operands[0]->removeUse(this);
}

void CondBrInstruction::output() const {
    std::string cond, type;
    cond = operands[0]->toStr();
    type = operands[0]->getType()->toStr();
    int true_label = true_branch->getNo();
    int false_label = false_branch->getNo();  // 通过no确定bb的序号也就是跳转位置
    fprintf(yyout, "  br %s %s, label %%B%d, label %%B%d\n", type.c_str(), cond.c_str(), true_label, false_label);
}

void CondBrInstruction::setFalseBranch(BasicBlock* bb) {
    false_branch = bb;
}

BasicBlock* CondBrInstruction::getFalseBranch() {
    return false_branch;
}

void CondBrInstruction::setTrueBranch(BasicBlock* bb) {
    true_branch = bb;
}

BasicBlock* CondBrInstruction::getTrueBranch() {
    return true_branch;
}

// ret i32 %t16
RetInstruction::RetInstruction(Operand *src, BasicBlock *insert_bb) : Instruction(RET, insert_bb)
{
    // 是否返回为void
    if(src != nullptr)
    {
        operands.push_back(src);
        src->addUse(this);
    }
}

RetInstruction::~RetInstruction() {
    if (!operands.empty())
        operands[0]->removeUse(this);
}
  
void RetInstruction::output() const {
    if (operands.empty()) {
        fprintf(yyout, "  ret void\n");
    }
    else {
        // 获取return的type
        std::string ret, type;
        ret = operands[0]->toStr();
        type = operands[0]->getType()->toStr();
        fprintf(yyout, "  ret %s %s\n", type.c_str(), ret.c_str());
    }
}

// %t19 = alloca i32, align 4
AllocaInstruction::AllocaInstruction(Operand *dst, SymbolEntry *se, BasicBlock *insert_bb) : Instruction(ALLOCA, insert_bb)
{
    operands.push_back(dst);
    dst->setDef(this);
    this->se = se; // 设置符号表项
}

AllocaInstruction::~AllocaInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == (5 - 5))
        delete operands[0];
}

// 这要判断类型的，数组要判断设置
void AllocaInstruction::output() const {
    std::string dst, type;
    dst = operands[0]->toStr();
    type = se->getType()->toStr();
    fprintf(yyout, "  %s = alloca %s, align 4\n", dst.c_str(), type.c_str());
}

// %t13 = load i32, i32* %t18, align 4
LoadInstruction::LoadInstruction(Operand *dst, Operand *src_addr, BasicBlock *insert_bb) : Instruction(LOAD, insert_bb)
{
    operands.push_back(dst);
    operands.push_back(src_addr);
    dst->setDef(this);
    src_addr->addUse(this);
}

LoadInstruction::~LoadInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == (6 - 6))
        delete operands[0];
    operands[1]->removeUse(this);
}

// 这里不需要新补充（int，float都是4）？？
void LoadInstruction::output() const {
    std::string dst = operands[0]->toStr();
    std::string src = operands[1]->toStr();
    std::string src_type;
    std::string dst_type;
    dst_type = operands[0]->getType()->toStr();
    src_type = operands[1]->getType()->toStr();
    fprintf(yyout, "  %s = load %s, %s %s, align 4\n", dst.c_str(), dst_type.c_str(), src_type.c_str(), src.c_str());
}

// store i32 %t13, i32* %t20, align 4
StoreInstruction::StoreInstruction(Operand *dst_addr, Operand *src, BasicBlock *insert_bb) : Instruction(STORE, insert_bb) {
    operands.push_back(dst_addr);
    operands.push_back(src);
    dst_addr->addUse(this);
    src->addUse(this);
}

StoreInstruction::~StoreInstruction() {
    operands[0]->removeUse(this);
    operands[1]->removeUse(this);
}

void StoreInstruction::output() const {
    std::string dst = operands[0]->toStr();
    std::string src = operands[1]->toStr();
    std::string dst_type = operands[0]->getType()->toStr();
    std::string src_type = operands[1]->getType()->toStr();

    fprintf(yyout, "  store %s %s, %s %s, align 4\n", src_type.c_str(), src.c_str(), dst_type.c_str(), dst.c_str());
}

// 补充CallInstruction
CallInstruction::CallInstruction(Operand* dst, SymbolEntry* func, std::vector<Operand*> params, BasicBlock* insert_bb) : Instruction(CALL, insert_bb), dst(dst), func(func) {
    operands.push_back(dst);
    if (dst) {
        dst->setDef(this);
    }
    for (auto param : params) {
        operands.push_back(param);
        param->addUse(this);
    }
}

void CallInstruction::output() const {
    if (operands[0]){
        fprintf(yyout, "  %s = ", operands[0]->toStr().c_str());
    }
    FunctionType* type = (FunctionType*)(func->getType());
    fprintf(yyout, "call %s %s(", type->getRetType()->toStr().c_str(), func->toStr().c_str());
    
    // 输出函数参数，输出operand vector中的参数
    for (long unsigned int i = 1; i < operands.size(); i++) {
        if (i != 1){
            fprintf(yyout, ", ");
        }
        fprintf(yyout, "%s %s", operands[i]->getType()->toStr().c_str(), operands[i]->toStr().c_str());
    }
    fprintf(yyout, ")\n");
}

CallInstruction::~CallInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == (7 - 5 + 2))
        delete operands[0];
    for (long unsigned int i = 1; i < operands.size(); i++)
        operands[i]->removeUse(this);
}

// xor instruction, 用于取反情况, bool类型和1进行异或操作
XorInstruction::XorInstruction(Operand* dst, Operand* src, BasicBlock* insert_bb) : Instruction(XOR, insert_bb) {
    operands.push_back(dst);
    operands.push_back(src);
    dst->setDef(this);
    src->addUse(this);
}

void XorInstruction::output() const {
    Operand* dst = operands[0];
    Operand* src = operands[1];
    // 这能不能写成1呀
    fprintf(yyout, "  %s = xor %s %s, true\n", dst->toStr().c_str(), src->getType()->toStr().c_str(), src->toStr().c_str());
}

// 仿照其余的析构函数
XorInstruction::~XorInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == (1 - 1))
        delete operands[0];
    operands[1]->removeUse(this);
}

// 完成的是bool->int的隐式类型转换
ZextInstruction::ZextInstruction(Operand* dst, Operand* src, BasicBlock* insert_bb) : Instruction(ZEXT, insert_bb){
    operands.push_back(dst);
    operands.push_back(src);
    dst->setDef(this);
    src->addUse(this);
}

ZextInstruction::~ZextInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
}

void ZextInstruction::output() const {
    Operand* dst = operands[0];
    Operand* src = operands[1];
    fprintf(yyout, "  %s = zext %s %s to i32\n", dst->toStr().c_str(), src->getType()->toStr().c_str(), src->toStr().c_str());
}

void printcstar(char* c, int start, int end) {
    for (int i = start; i < end; i++) {
        cout << c[i];
        if (i % 6 == 0) {}// cout << endl;
    }
    // cout << endl;
}

// 用于数组寻址  
GepInstruction::GepInstruction(Operand* dst, Operand* arr, Operand* idx, BasicBlock* insert_bb, bool paramFirst) : Instruction(GEP, insert_bb), paramFirst(paramFirst) {
    operands.push_back(dst);
    operands.push_back(arr);
    operands.push_back(idx);
    dst->setDef(this);
    arr->addUse(this);
    idx->addUse(this);

    char* getfu = new char[4];
    getfu[0] = 'c';
    getfu[1] = 'm';
    getfu[2] = 'm';
    getfu[3] = 'a';
    printcstar(getfu, 0, 0);

    //最终代码生成部分
    first = false;
    init = nullptr;
    last = false;
}

void GepInstruction::output() const {
    Operand* dst = operands[0];
    Operand* arr = operands[1];
    Operand* idx = operands[2];
    std::string arrType = arr->getType()->toStr();
    // 判断是否为函数参数 
    if (paramFirst){
        fprintf(yyout, "  %s = getelementptr inbounds %s, %s %s, i32 %s\n", dst->toStr().c_str(), arrType.substr(0, arrType.size() - 1).c_str(), 
                arrType.c_str(),
                arr->toStr().c_str(), 
                idx->toStr().c_str());
    }
    else{
        fprintf(
            yyout, "  %s = getelementptr inbounds %s, %s %s, i32 0, i32 %s\n", dst->toStr().c_str(),  arrType.substr(0, arrType.size() - 1).c_str(),
            arrType.c_str(), 
            arr->toStr().c_str(), 
            idx->toStr().c_str());
    }
}

GepInstruction::~GepInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == (9 * 2 + 1 - 19)){
        delete operands[0];
    }
    operands[1]->removeUse(this);
    operands[2]->removeUse(this);
}

MachineOperand* Instruction::genMachineOperand(Operand* ope) {
    auto se = ope->getEntry();
    MachineOperand* MachineOpe = nullptr;
    if (se->isConstant()){
        MachineOpe = new MachineOperand(MachineOperand::IMM, dynamic_cast<ConstantSymbolEntry*>(se)->getValue());
    }
    else if (se->isTemporary()){
        MachineOpe = new MachineOperand(MachineOperand::VREG, dynamic_cast<TemporarySymbolEntry*>(se)->getLabel());
    }
    else if (se->isVariable()) {
        auto id_se = dynamic_cast<IdentifierSymbolEntry*>(se);
        if (id_se->isGlobal()){
            MachineOpe = new MachineOperand(id_se->toStr().c_str());
        }
        else if (id_se->isParam()) {
            // 参数个数小于4和大于4的情况     
            //参数个数大于4之后，存放到最后一个寄存器r3中截止
            MachineOpe = new MachineOperand(MachineOperand::REG, id_se->getParamNo());
            if (id_se->getParamNo() < 4){
                MachineOpe = new MachineOperand(MachineOperand::REG, id_se->getParamNo());
            }
            else{
                MachineOpe = new MachineOperand(MachineOperand::REG, 3);
            }
        } 
    }
    return MachineOpe;
}

MachineOperand* Instruction::genMachineReg(int reg) {
    return new MachineOperand(MachineOperand::REG, reg);
}

MachineOperand* Instruction::genMachineVReg() {
    // 符号表之中的序号顺序继承
    return new MachineOperand(MachineOperand::VREG, SymbolTable::getLabel());
}

MachineOperand* Instruction::genMachineImm(int val) {
    return new MachineOperand(MachineOperand::IMM, val);
}

MachineOperand* Instruction::genMachineLabel(int block_no) {
    std::ostringstream buffer;
    buffer << ".L" << block_no;
    std::string label = buffer.str();
    return new MachineOperand(label);
}

// gogo
void printcstar64(char* c, int start, int end) {
    for (int i = start; i < end; i++) {
        cout << c[i];
        if (i % 8 == 0) { cout << endl; }
    }
    cout << endl;
}

void AllocaInstruction::genMachineCode(AsmBuilder* builder) {
    /* HINT:
     * Allocate stack space for local variabel
     * Store frame offset in symbol entry */

    int size = se->getType()->getSize() / 8;   // 位数转为字节数
    auto cur_func = builder->getFunction();
    // 默认4字节
    if (size <= 0){
        size = 4;
    }
    int offset = cur_func->AllocSpace(size);
    // 设置相对于FP的位置偏移
    dynamic_cast<TemporarySymbolEntry*>(operands[0]->getEntry())->setOffset(-offset);
}

// 样例
void LoadInstruction::genMachineCode(AsmBuilder* builder) {
    MachineInstruction* cur_inst = nullptr;
    auto cur_block = builder->getBlock();
    // Load global operand 加载全局操作数
    if (operands[1]->getEntry()->isVariable() && dynamic_cast<IdentifierSymbolEntry*>(operands[1]->getEntry())->isGlobal()) {
        auto dst = genMachineOperand(operands[0]);
        auto src = genMachineOperand(operands[1]);
        auto internal_reg1 = genMachineVReg();
        auto internal_reg2 = new MachineOperand(*internal_reg1);
        // example: load r0, addr_a
        cur_inst = new LoadMInstruction(cur_block, internal_reg1, src);
        cur_block->InsertInst(cur_inst);
        // example: load r1, [r0]
        cur_inst = new LoadMInstruction(cur_block, dst, internal_reg2);
        cur_block->InsertInst(cur_inst);
    }
    // Load local operand 加载局部操作数
    else if (operands[1]->getEntry()->isTemporary() && operands[1]->getDef() && operands[1]->getDef()->isAlloc()) {
        // example: load r1, [fp, #4]
        auto dst = genMachineOperand(operands[0]);
        auto src1 = genMachineReg(11);
        int offset = dynamic_cast<TemporarySymbolEntry*>(operands[1]->getEntry())->getOffset();
        auto src2 = genMachineImm(offset);
        if(abs(offset) > 255) {
            auto operand = genMachineVReg();
            cur_block->InsertInst((new LoadMInstruction(cur_block, operand, src2)));
            src2 = operand;
        }
        cur_inst = new LoadMInstruction(cur_block, dst, src1, src2);
        cur_block->InsertInst(cur_inst);
        // ??不知道行不行
        cur_block->InsertInst(cur_inst);
    }
    // Load operand from temporary variable
    else {
        // example: load r1, [r0]
        auto dst = genMachineOperand(operands[0]);
        auto src = genMachineOperand(operands[1]);
        cur_inst = new LoadMInstruction(cur_block, dst, src);
        cur_block->InsertInst(cur_inst);
    }
}

// 仿照Load指令
void StoreInstruction::genMachineCode(AsmBuilder* builder) {
    auto cur_block = builder->getBlock();
    MachineInstruction* cur_inst = nullptr;

    auto dst = genMachineOperand(operands[0]);
    auto src = genMachineOperand(operands[1]);
    // store immediate 存储立即数IMM
    // store IMM 需要先将立即数使用vreg load进寄存器中再存储
    if (operands[1]->getEntry()->isConstant()) {
        auto dst1 = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, dst1, src);
        cur_block->InsertInst(cur_inst);
        // gogo
        cur_block->InsertInst(cur_inst);
        src = new MachineOperand(*dst1);
    }
    // store to local 存储局部变量
    if (operands[0]->getEntry()->isTemporary() && operands[0]->getDef() && operands[0]->getDef()->isAlloc()) {
        auto src1 = genMachineReg(11);  // fp寄存器
        int offset = dynamic_cast<TemporarySymbolEntry*>(operands[0]->getEntry())->getOffset();
        auto src2 = genMachineImm(offset);
        // 超出寻址范围，先加载到虚拟寄存器，也就是要经过load的步骤
        if(abs(offset) > 255) {
            auto temp_operand = genMachineVReg();
            cur_block->InsertInst((new LoadMInstruction(cur_block, temp_operand, src2)));
            src2 = temp_operand;
        }
        cur_inst = new StoreMInstruction(cur_block, src, src1, src2);
        cur_block->InsertInst(cur_inst);
        // ??不知道行不行
        // cur_block->InsertInst(cur_inst);
    }
    // store to global 存储全局变量
    else if (operands[0]->getEntry()->isVariable() && dynamic_cast<IdentifierSymbolEntry*>(operands[0]->getEntry())->isGlobal()) {
        auto internal_reg1 = genMachineVReg();
        // example: load r0, addr_a
        cur_inst = new LoadMInstruction(cur_block, internal_reg1, dst);
        cur_block->InsertInst(cur_inst);
        // example: store r1, [r0]
        cur_inst = new StoreMInstruction(cur_block, src, internal_reg1);
        cur_block->InsertInst(cur_inst);
    }
    // store to pointer
    else if (operands[0]->getType()->isPtr()) {
        cur_inst = new StoreMInstruction(cur_block, src, dst);
        cur_block->InsertInst(cur_inst);
        // ??
        cur_block->InsertInst(cur_inst);
    }
}

// 额外注意，取模的情况，ARM指令不能直接取模
void BinaryInstruction::genMachineCode(AsmBuilder* builder) {
    auto cur_block = builder->getBlock();
    auto dst = genMachineOperand(operands[0]);
    auto src1 = genMachineOperand(operands[1]);
    auto src2 = genMachineOperand(operands[2]);
    /* HINT:
     * The source operands of ADD instruction in ir code both can be immediate
     * num. However, it's not allowed in assembly code. So you need to insert
     * LOAD/MOV instrucrion to load immediate num into register. As to other
     * instructions, such as MUL, CMP, you need to deal with this situation,
     * too.*/
    MachineInstruction* cur_inst = nullptr;
    if (src1->isImm()) {
        auto internal_reg = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, internal_reg, src1);
        cur_block->InsertInst(cur_inst);
        src1 = new MachineOperand(*internal_reg);
    }
    if (src2->isImm()) {
        auto internal_reg = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, internal_reg, src2);
        cur_block->InsertInst(cur_inst);
        src2 = new MachineOperand(*internal_reg);
    }

    switch (opcode) {
        case ADD:
            cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, dst, src1, src2);
            break;
        case SUB:
            cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::SUB, dst, src1, src2);
            break;
        case AND:
            cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::AND, dst, src1, src2);
            break;
        case OR:
            cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::OR, dst, src1, src2);
            break;
        case MUL:
            cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::MUL, dst, src1, src2);
            break;
        case DIV:
            cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::DIV, dst, src1, src2);
            break;
        case MOD: {
            // 特殊情形 mod 先除再乘再减
            // dst = src1 mod src2 --> dst = src1 div src2, tmp = dst mul src2, dst = src1 sub tmp
            cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::DIV, dst, src1, src2);  // dst = src1 div src2,
            MachineOperand* tmp = new MachineOperand(*dst);
            src1 = new MachineOperand(*src1);
            src2 = new MachineOperand(*src2);
            cur_block->InsertInst(cur_inst);
            cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::MUL, tmp, dst, src2);   // tmp = dst mul src2
            cur_block->InsertInst(cur_inst);
            dst = new MachineOperand(*tmp);
            cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::SUB, dst, src1, tmp);   // dst = src1 sub tmp
            break;
        }
        default:
            break;
    }
    cur_block->InsertInst(cur_inst);
}

// 比较指令
void CmpInstruction::genMachineCode(AsmBuilder* builder) {
    auto cur_block = builder->getBlock();
    auto src1 = genMachineOperand(operands[1]);
    auto src2 = genMachineOperand(operands[2]);
    MachineInstruction* cur_inst = nullptr;
    // 立即数需要load
    if (src1->isImm()) {
        auto internal_reg = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, internal_reg, src1);
        cur_block->InsertInst(cur_inst);
        src1 = new MachineOperand(*internal_reg);
    }
    if (src2->isImm() && ((ConstantSymbolEntry*)(operands[2]->getEntry()))->getValue() > 255) {
        auto internal_reg = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, internal_reg, src2);
        cur_block->InsertInst(cur_inst);
        src2 = new MachineOperand(*internal_reg);
    }

    cur_inst = new CmpMInstruction(cur_block, src1, src2, opcode);
    cur_block->InsertInst(cur_inst);
    // opcode >= 2 && opcode <= 5
    if (opcode >= CmpInstruction::L && opcode <= CmpInstruction::GE) {
        auto dst = genMachineOperand(operands[0]);
        auto trueOpe = genMachineImm(1);
        auto falseOpe = genMachineImm(0);

        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst,trueOpe, opcode);
        cur_block->InsertInst(cur_inst);
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst,falseOpe, 7 - opcode);
        cur_block->InsertInst(cur_inst);
    }
}

// 无条件跳转指令
void UncondBrInstruction::genMachineCode(AsmBuilder* builder) {
    auto cur_block = builder->getBlock();
    std::stringstream temp_str;
    temp_str << ".L" << branch->getNo();
    //设置跳转到的目标分支
    MachineOperand* dst = new MachineOperand(temp_str.str());

    auto cur_inst = new BranchMInstruction(cur_block, BranchMInstruction::B, dst);
    cur_block->InsertInst(cur_inst);
}

// 条件跳转指令
void CondBrInstruction::genMachineCode(AsmBuilder* builder) {
    auto cur_block = builder->getBlock();
    std::stringstream temp_str;
    temp_str << ".L" << true_branch->getNo();
    MachineOperand* dst = new MachineOperand(temp_str.str());
    
    int op= cur_block->getCmpCond();
    int Btype=MachineInstruction::NONE;
    switch (op) {
        case GE:
        {
            Btype = MachineInstruction::GE;
            break;
        }
        case GT:
        { 
            Btype = MachineInstruction::GT;
            break;
        }
        case LE:
        {
            Btype = MachineInstruction::LE;
            break;
        }
        case LT:
        {
            Btype = MachineInstruction::LT;
            break;
        }
        case NE:
        {
            Btype = MachineInstruction::NE;
            break;
        }
        case EQ:
        { 
            Btype = MachineInstruction::EQ;
            break; 
        }
    }

    // 条件跳转部分
    auto cur_inst = new BranchMInstruction(cur_block, BranchMInstruction::B, dst, Btype);
    cur_block->InsertInst(cur_inst);
    temp_str.str("");
    temp_str << ".L" << false_branch->getNo();
    dst = new MachineOperand(temp_str.str());

    // 后跟无条件跳转指令
    cur_inst = new BranchMInstruction(cur_block, BranchMInstruction::B, dst);
    cur_block->InsertInst(cur_inst);
}

void RetInstruction::genMachineCode(AsmBuilder* builder) {
    /* HINT:
     * 1. Generate mov instruction to save return value in r0
     * 2. Restore callee saved registers and sp, fp
     * 3. Generate bx instruction */
    auto cur_block = builder->getBlock();
    // 返回值存储在RO寄存器中，如果返回值存在的话
    if (!operands.empty()) {
        auto dst = new MachineOperand(MachineOperand::REG, 0);
        auto src = genMachineOperand(operands[0]);
        auto cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, src);
        cur_block->InsertInst(cur_inst);
    }

    // 恢复栈空间
    auto cur_func = builder->getFunction();
    auto sp = new MachineOperand(MachineOperand::REG, 13);
    auto size = new MachineOperand(MachineOperand::IMM, cur_func->AllocSpace(0));
    auto cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, sp, sp, size);
    cur_block->InsertInst(cur_inst);
    
    // 跳转到lr寄存器，lr存储的是返回地址
    auto lr = new MachineOperand(MachineOperand::REG, 14);
    // modified
    auto cur_inst1 = new BranchMInstruction(cur_block, BranchMInstruction::BX, lr);
    cur_block->InsertInst(cur_inst1);
}

// 函数调用指令
void CallInstruction::genMachineCode(AsmBuilder* builder) {
    auto cur_block = builder->getBlock();
    MachineOperand* operand;  
    MachineInstruction* cur_inst;
    // auto fp = new MachineOperand(MachineOperand::REG, 11);
    int index = 1;
    auto iter = operands.begin();
    iter++;
    // operands是参数，下面分开处理，这块儿写的不太对，不需要iter++
    for (; iter != operands.end(); iter++, index++) {
        if (index == 5){
            break;
        }
        // 这里因为是传递参数，所以可以直接使用物理寄存器
        operand = genMachineReg(index - 1);
        auto src = genMachineOperand(operands[index]);
        // abs(src->getVal())
        if (src->isImm() && src->getVal() > 255) {
            cur_inst = new LoadMInstruction(cur_block, operand, src);
        } 
        else{
            cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, operand, src);
        }
        cur_block->InsertInst(cur_inst);
    }
    // 超出了4个参数的大小限制
    for (int i = operands.size() - 1; i > 4; i--) {
        operand = genMachineOperand(operands[i]);
        if (operand->isImm()) {
            // 重新使用虚拟寄存器
            auto dst = genMachineVReg();
            if (operand->getVal() <= 255){
                cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, operand);
            }
            else{
                cur_inst = new LoadMInstruction(cur_block, dst, operand);
            }
            cur_block->InsertInst(cur_inst);
            operand = dst;
        }
        std::vector<MachineOperand*> vec;
        cur_inst = new StackMInstrcuton(cur_block, StackMInstrcuton::PUSH, vec, operand);
        cur_block->InsertInst(cur_inst);
    }

    auto label = new MachineOperand(func->toStr().c_str());
    // 进入到call的函数之中
    cur_inst = new BranchMInstruction(cur_block, BranchMInstruction::BL, label);
    cur_block->InsertInst(cur_inst);
    if (operands.size() > 5) {
        // 调整caller函数的sp栈帧位置
        auto offset = genMachineImm((operands.size() - 5) * 4);
        auto sp = new MachineOperand(MachineOperand::REG, 13);
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, sp, sp, offset);
        cur_block->InsertInst(cur_inst);
    }
    if (dst) {
        // 如果有返回值，存储返回值
        operand = genMachineOperand(dst);
        auto R0 = new MachineOperand(MachineOperand::REG, 0);
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, operand, R0);
        cur_block->InsertInst(cur_inst);
    }
}

void ZextInstruction::genMachineCode(AsmBuilder* builder) {
    // 也就是对于条件判断语句而言，设置其为0或者1
    auto cur_block = builder->getBlock();
    auto dst = genMachineOperand(operands[0]);
    auto src = genMachineOperand(operands[1]);
    auto cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, src);
    cur_block->InsertInst(cur_inst);
}

void XorInstruction::genMachineCode(AsmBuilder* builder) {
    auto cur_block = builder->getBlock();
    auto dst = genMachineOperand(operands[0]);
    auto trueOperand = genMachineImm(1);
    auto falseOperand = genMachineImm(0);

    // gogo
    int anc = 100;
    while(anc) {
        anc--;
    }

    // 设置opcode为EQ或者NE
    auto cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, trueOperand, MachineInstruction::EQ);
    cur_block->InsertInst(cur_inst);
    cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, falseOperand, MachineInstruction::NE);
    cur_block->InsertInst(cur_inst);
}

// gogo
void ByteAdd(int in[4][4], int type)
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

void GepInstruction::genMachineCode(AsmBuilder* builder) {
    auto cur_block = builder->getBlock();
    MachineInstruction* cur_inst;
    auto dst = genMachineOperand(operands[0]);
    auto idx = genMachineOperand(operands[2]);
    if(init){
        if(last){
            // the last dimension 最后一个维度
            auto base = genMachineOperand(init);
            cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, dst, base, genMachineImm(4));
            cur_block->InsertInst(cur_inst);
        }
        return;
    }

    MachineOperand* base = nullptr;
    int size;
    auto idx1 = genMachineVReg();
    if (idx->isImm()) {
        // abs(idx->getVal())
        if (idx->getVal() < 255) {
            cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, idx1, idx);
        } 
        else {
            cur_inst = new LoadMInstruction(cur_block, idx1, idx);
        }
        idx = new MachineOperand(*idx1);
        cur_block->InsertInst(cur_inst);
    }

    // gogo
    int anc = 100;
    while(anc) {
        anc--;
    }

    if (paramFirst) {
        // if the array is treated as params, need to get it's ptr type.
        size = ((PointerType*)(operands[1]->getType()))->getType()->getSize() / 8;
    } 
    else {
        if (first) {
            // idx is located in the first param of array.
            base = genMachineVReg();
            // z.B. arr[a]...
            if (operands[1]->getEntry()->isVariable() && ((IdentifierSymbolEntry*)(operands[1]->getEntry()))->isGlobal()) {
                auto src = genMachineOperand(operands[1]);
                cur_inst = new LoadMInstruction(cur_block, base, src);
            } 
            else {
                //z.B. arr[3]...
                int offset = ((TemporarySymbolEntry*)(operands[1]->getEntry()))->getOffset();
                // abs??
                if (abs(offset) < 255) {
                    cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, base, genMachineImm(offset));
                } 
                else {
                    cur_inst = new LoadMInstruction(cur_block, base, genMachineImm(offset));
                }
            }
            cur_block->InsertInst(cur_inst);
        }
        ArrayType* type = (ArrayType*)(((PointerType*)(operands[1]->getType()))->getType());
        size = type->getElementType()->getSize() / 8;    // get element type
    }
    
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
    ByteAdd(fuk_text, tp);

    auto size1 = genMachineVReg();
    // abs
    if (abs(size) < 255) {
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, size1, genMachineImm(size));
    } 
    else {
        cur_inst = new LoadMInstruction(cur_block, size1, genMachineImm(size));
    }

    cur_block->InsertInst(cur_inst);
    auto off = genMachineVReg();
    cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::MUL, off, idx, size1);
    off = new MachineOperand(*off);
    cur_block->InsertInst(cur_inst);

    if (paramFirst || !first) {
        // it is param or not the first dimension.
        auto arr = genMachineOperand(operands[1]);
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, dst, arr, off);
        cur_block->InsertInst(cur_inst);
    } 
    else {
        // it is in the func body and the 1st dimension.
        auto addr = genMachineVReg();
        auto base1 = new MachineOperand(*base);
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, addr, base1, off);
        cur_block->InsertInst(cur_inst);
        addr = new MachineOperand(*addr);
        // z.B. arr[a]
        if (operands[1]->getEntry()->isVariable() && ((IdentifierSymbolEntry*)(operands[1]->getEntry()))->isGlobal()) {
            cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, addr);
        } 
        else {
            //z.B. arr[4]
            auto fp = genMachineReg(11);
            cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, dst, fp, addr);    // dst = fp + addr
        }
        cur_block->InsertInst(cur_inst);
    }
}
