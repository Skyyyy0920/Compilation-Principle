/*
 * 线性扫描寄存器分配
 */

#ifndef _LINEARSCAN_H__
#define _LINEARSCAN_H__

#include <list>
#include <map>
#include <set>
#include <vector>

class MachineUnit;
class MachineOperand;
class MachineFunction;

// 目前还未分配寄存器的活跃区间，其实这里的理解就是对于虚拟寄存器或者中间变量而言
// 虚拟寄存器有所在的活跃的基本块
// modified 结构体外提
struct Interval {
    int start;   // 开始位置
    int end;   // 结束位置
    bool spill;   // 是否需要溢出
    int disp;  //栈偏移
    int rreg;   // 物理寄存器号（如果虚拟寄存器没有溢出）
    std::set<MachineOperand*> defs;
    std::set<MachineOperand*> uses;
};

// 线性扫描寄存器
class LinearScan {
private:
    MachineUnit* unit;    // 从unit自顶向下扫描
    MachineFunction* func;    // 遍历函数
    std::vector<int> regs;    // 保存寄存器号
    std::map<MachineOperand*, std::set<MachineOperand*>> du_chains;  // def use引用链??
    std::vector<Interval*> intervals;   
    std::vector<Interval*> active;
    void expireOldIntervals(Interval* interval);  // 用于检验不活跃的区间??
    void spillAtInterval(Interval* interval);  // 重点用于处理虚拟寄存器溢出的情形
    void makeDuChains();
    void computeLiveIntervals();   // 计算活跃区间
    bool linearScanRegisterAllocation();  // 线性扫描分配物理寄存器是否全部映射成功
    void modifyCode();
    void genSpillCode();
    static bool compareStart(Interval* a, Interval* b);
public:
    LinearScan(MachineUnit* unit);
    void allocateRegisters();
};

#endif