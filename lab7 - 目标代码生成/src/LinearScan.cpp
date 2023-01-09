#include "LinearScan.h"
#include <algorithm>
#include <iostream>
#include "LiveVariableAnalysis.h"
#include "MachineCode.h"

LinearScan::LinearScan(MachineUnit* unit) {
    this->unit = unit;
    // 可分配寄存器为4-10，其中0-3用于参数传递
    for (int i = 4; i < 11; i++)
        regs.push_back(i);
}

// 遍历每个函数，获得虚拟寄存器对应的物理寄存器
void LinearScan::allocateRegisters() {
    for (auto& iter_func : unit->getFuncs()) {
        func = iter_func;
        // 用is_success判断完成分配
        // modified
        bool is_success = false;
        // 循环直到所有虚拟寄存器分配完成
        while (!is_success) {
            // 重新计算活跃区间
            computeLiveIntervals();
            is_success = linearScanRegisterAllocation();
            // 有溢出情况，生成溢出代码
            if (is_success) {
                //没有溢出，直接修改寄存器映射
                modifyCode();
            }
            else {
                // 溢出生成溢出代码，循环重新计算
                genSpillCode();
            }
        }
    }
}

// def-use链??
void LinearScan::makeDuChains() {
    // modified 
    int i = 0;
    LiveVariableAnalysis live_Var_Analysis;
    live_Var_Analysis.pass(func);   // 遍历函数，计算变量的def和use，存到live_Var_Analysis的变量里面
    du_chains.clear();
    std::map<MachineOperand, std::set<MachineOperand*>> liveVar;
    // 遍历函数中的每个基本块block
    for (auto& bb : func->getBlocks()) {
        liveVar.clear();
        // 放入活跃的变量
        for (auto& t : bb->getLiveOut()) {
            liveVar[*t].insert(t);
        }
        // modified no = i
        int no;  // 遍历用的标号
        i = bb->getInsts().size() + i;
        no = i;
        // no--，逆序遍历
        for (auto inst = bb->getInsts().rbegin(); inst != bb->getInsts().rend(); inst++) {
            // 遍历指令定义的操作数
            // getDef: return deflist(MachineOperand)
            (*inst)->setNo(no--);
            for (auto& def : (*inst)->getDef()) {
                if (def->isVReg()) {
                    // 获取定义变量的活跃虚拟寄存器
                    auto& uses = liveVar[*def];
                    // 集合插入du_chains
                    du_chains[def].insert(uses.begin(), uses.end());
                    // modified
                    auto& alluse = live_Var_Analysis.getAllUses()[*def];
                    std::set<MachineOperand*> rest;
                    // 求取两个集合的差集
                    set_difference(uses.begin(), uses.end(), alluse.begin(), alluse.end(), inserter(rest, rest.end()));
                    liveVar[*def] = rest;
                }
            }
            for (auto& use : (*inst)->getUse()) {
                if (use->isVReg()){
                    liveVar[*use].insert(use);
                }
            }
        }
    }
}

// 计算活跃区间
void LinearScan::computeLiveIntervals() {
    // 先预备搞定def use链
    makeDuChains();
    intervals.clear();

    for (auto& du_chain : du_chains) {
        int t = -1;
        // def->use链条，def的位置作为起始，use的最大序号作为结束
        for (auto& iter : du_chain.second){
            t = std::max(t, iter->getParent()->getNo());
        }
        // 活跃区间了?? defs uses
        Interval* interval = new Interval({du_chain.first->getParent()->getNo(), t, false, 0, 0, {du_chain.first}, du_chain.second});
        intervals.push_back(interval);
    }
    // modified
    bool is_change = true;
    while (is_change) {
        is_change = false;
        // ??
        std::vector<Interval*> t(intervals.begin(), intervals.end());
        for (size_t i = 0; i < t.size(); i++) {
            // 在i+1 -> size的范围内进行比较
            for (size_t j = i + 1; j < t.size(); j++) {
                Interval* w1 = t[i];
                Interval* w2 = t[j];
                if (**w1->defs.begin() == **w2->defs.begin()) {
                    std::set<MachineOperand*> temp;
                    // 集合运算取交集，看是否有重合的区间
                    set_intersection(w1->uses.begin(), w1->uses.end(), w2->uses.begin(), w2->uses.end(), inserter(temp, temp.end()));
                    if (!temp.empty()) {
                        is_change = true;
                        w1->defs.insert(w2->defs.begin(), w2->defs.end());
                        w1->uses.insert(w2->uses.begin(), w2->uses.end());
                        w1->start = std::min(w1->start, w2->start);
                        w1->end = std::max(w1->end, w2->end);
                        auto it = std::find(intervals.begin(), intervals.end(), w2);
                        // 重复的变量合并活跃区间
                        if (it != intervals.end()){
                            intervals.erase(it);
                        }
                    }
                }
            }
        }
    }

    sort(intervals.begin(), intervals.end(), compareStart);
}

bool LinearScan::linearScanRegisterAllocation() {
    // 用于判断能否分配成功
    bool is_success = true;
    // 初始化
    active.clear();
    regs.clear();

    // 初始在LinearScan之中放入能够分配的寄存器
    for (int i = 10; i >=4; i--){
        regs.push_back(i);
    }
    // 遍历每个unhandled interval没有分配寄存器的活跃区间（也就有点儿像遍历每个没分配的虚拟寄存器）
    for (auto& i : intervals) {
        // 遍历active列表，看该列表中是否存在早于结束时间
        // unhandled interval的interval
        // 主要用于回收可用物理寄存器
        expireOldIntervals(i);
        
        //没有可分配的寄存器，溢出进入栈中
        if (regs.empty()) {
            spillAtInterval(i);
            is_success = false;
        } 
        else {
            // 分配寄存器 同时删去已经分配的
            i->rreg = regs.front();
            regs.erase(regs.begin());

            // 放入已经分配的向量中
            active.push_back(std::move(i));   // 通过std::move，可以避免不必要的拷贝操作，亏贼

            // 对活跃区间按照结束时间升序排序，快速排序sort
            // 亏贼还能这么写呢
            sort(active.begin(), active.end(), [](Interval* a, Interval* b) {return a->end < b->end;});
        }
    }
    return is_success;
}

// 没有溢出情况 
void LinearScan::modifyCode() {
    // 遍历每个区间
    for (auto& interval : intervals) {
        // 添加此函数使用的寄存器
        func->addSavedRegs(interval->rreg);
        // 将使用的寄存器放入区间的use和def中
        for (auto def: interval->defs){
            def->setReg(interval->rreg);
        }
        for (auto use: interval->uses){
            use->setReg(interval->rreg);
        }
    }
}

// 生成溢出代码也就是会补充store和load命令
void LinearScan::genSpillCode() {
    for (auto& interval : intervals) {
        if (!interval->spill){
            continue;
        }
        /* HINT:
         * The vreg should be spilled to memory.
         * 1. insert ldr inst before the use of vreg
         * 2. insert str inst after the def of vreg
         */
        // 获取栈内相对偏移
        // 注意要是负的，以FP寄存器为基准
        interval->disp = -func->AllocSpace(4);

        // 获取偏移和FP寄存器的值
        auto offset = new MachineOperand(MachineOperand::IMM, interval->disp);
        auto fp = new MachineOperand(MachineOperand::REG, 11); // reg no是11
        for (auto use : interval->uses) {
            // 在use之前插入load指令 将其从栈内加载到目的虚拟寄存器中
            auto temp = new MachineOperand(*use);
            MachineOperand* operand = nullptr;

            // 直接使用IMM有大小的限制-255到255
            // 需要先加载到虚拟寄存器 ldr v1, offset
            if (interval->disp > 255 || interval->disp < -255) {
                operand = new MachineOperand(MachineOperand::VREG, SymbolTable::getLabel()); auto inst1 = new LoadMInstruction(use->getParent()->getParent(), operand, offset);
                // USE指令前插入Load指令
                use->getParent()->insertBefore(inst1);
            }

            // 超出寻址空间的话，就ldr r0,[fp,v1]
            if (operand) {
                // modified
                auto instruntion = new LoadMInstruction(use->getParent()->getParent(), temp, fp, new MachineOperand(*operand));
                use->getParent()->insertBefore(instruntion);
            } 
            else {
                // 正常情况，直接从fp-offset的地方加载
                auto instruntion = new LoadMInstruction(use->getParent()->getParent(), temp, fp, offset);
                use->getParent()->insertBefore(instruntion);
            }
        }

        // 遍历其DEF指令的列表
        // 在DEF指令后插入StoreMInstruction，将其从目前的虚拟寄存器中存到栈内
        for (auto def : interval->defs) {
            // 在def之后插入store指令
            auto temp = new MachineOperand(*def);
            MachineOperand* operand = nullptr;

            MachineInstruction *instruction1 = nullptr, *instruction = nullptr;
            // 同样要考虑数值的大小问题
            // abs(offset) > 255
            if (interval->disp > 255 || interval->disp < -255) {
                operand = new MachineOperand(MachineOperand::VREG, SymbolTable::getLabel());
                instruction1 = new LoadMInstruction(def->getParent()->getParent(), operand, offset);
                def->getParent()->insertAfter(instruction1);
            }

            // StoreMInstruction要插入到DEF指令之后
            if (operand){
                instruction = new StoreMInstruction(def->getParent()->getParent(), temp, fp, new MachineOperand(*operand));
            }
            else{
                instruction = new StoreMInstruction(def->getParent()->getParent(), temp, fp, offset);
            }
            if (instruction1){
                instruction1->insertAfter(instruction);
            }
            else{
                def->getParent()->insertAfter(instruction);
            }
        }
    }
}

// 如果有比interval时间早的就回收
void LinearScan::expireOldIntervals(Interval* interval) {
    auto iter = active.begin();
    // active按照end时间升序排列，所以只用看头部
    // 头部如果大于，那么直接返回，回收不了
    // 头部如果小于，那么active的寄存器可以回收
    while (iter != active.end()) {
        if ((*iter)->end >= interval->start){
            return;
        }
        regs.push_back((*iter)->rreg);
        iter = active.erase(find(active.begin(), active.end(), *iter));
        sort(regs.begin(), regs.end());
    }
}

// 寄存器溢出操作
void LinearScan::spillAtInterval(Interval* interval) {
    // 选择active列表末尾也就是end最大的与当前unhandled的一个溢出到栈中
    auto spill = active.back();
    // 将结束时间更晚的溢出
    if (spill->end > interval->end) {
        spill->spill = true;
        interval->rreg = spill->rreg;
        // 额外添加 处理寄存器
        func->addSavedRegs(interval->rreg);
        // 插入回active列表之中的原位置
        active.push_back(std::move(interval));
        // 插入后再次按照结束时间对活跃区间进行排序
        sort(active.begin(), active.end(), [](Interval* a, Interval* b) {return a->end < b->end;});
    } 
    else {
        // unhandle溢出更晚只需置位spill标志位，不用处理active列表
        interval->spill = true;
    }
}

// 这里被用在了makeDuchain里面
bool LinearScan::compareStart(Interval* a, Interval* b) {
    return a->start < b->start;
}

