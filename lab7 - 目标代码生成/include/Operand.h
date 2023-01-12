#ifndef __OPERAND_H__
#define __OPERAND_H__

#include "SymbolTable.h"
#include <vector>

class Instruction;
class Function;


// class Operand - The operand of an instruction.
// 指令操作数
class Operand
{
typedef std::vector<Instruction *>::iterator use_iterator;

private:
    Instruction *def;                // The instruction where this operand is defined. 定义操作数
    std::vector<Instruction *> uses; // Intructions that use this operand.
    SymbolEntry *se;                 // The symbol entry of this operand. 操作数的符号表项
public:
    Operand(SymbolEntry*se) :se(se){def = nullptr;};
    void setDef(Instruction *inst) {def = inst;};
    void addUse(Instruction *inst) { uses.push_back(inst); };
    void removeUse(Instruction *inst);
    int usersNum() const {return uses.size();}; // 使用该操作数的指令个数

    use_iterator use_begin() {return uses.begin();};
    use_iterator use_end() {return uses.end();};
    Type* getType() {return se->getType();};
    std::string toStr() const;
    SymbolEntry * getEntry() { return se; };
    Instruction* getDef() { return def; };
};

#endif

// ------------------------------------------------------------------------------------------------------------------- //
#define MAX_GHB_COUNT 256
#define PREFETCH_DEGREE 3

class Node {
public:
    Node() {
        prev = this;
        next = this;
    };

    Node *getPrev() const {
        return prev;
    }

    void setPrev(Node *prev) {
        Node::prev = prev;
    }

    Node *getNext() const {
        return next;
    }

    void setNext(Node *next) {
        Node::next = next;
    }

protected:
    Node *prev;
    Node *next;
};

class DoubleLinkedChain {
public:
    DoubleLinkedChain() { head = new Node(); };

    void push_back(Node *node) {
        node->setNext(head);
        node->setPrev(head->getPrev());
        head->getPrev()->setNext(node);
        head->setPrev(node);
    };

    void push_front(Node *node) {
        node->setPrev(head);
        node->setNext(head->getNext());
        head->getNext()->setPrev(node);
        head->setNext(node);
    };

    void remove(Node *node) {
        assert(node != head);

        Node *prevNode, *nextNode;
        prevNode = node->getPrev();
        nextNode = node->getNext();
        prevNode->setNext(nextNode);
        nextNode->setPrev(prevNode);
        delete node;
        node = nullptr;
    };

    void remove_back() { remove(head->getPrev()); };

    void remove_front() { remove(head->getNext()); };

    Node *front() {
        assert(head->getNext() != head);
        return head->getNext();
    };

    Node *back() {
        assert(head->getPrev() != head);
        return head->getPrev();
    };
protected:
    Node *head;
};

class GHB : public DoubleLinkedChain {
public:
    GHB() { entryNum = 0; };

    virtual void push(uint64_t ip, uint64_t addr) = 0;

    virtual void print() = 0;

protected:
    unsigned int entryNum;
    std::unordered_map<uint64_t, Node *> indexTable;
};

class StrideNode : public Node {
public:
    StrideNode(uint64_t val, uint64_t ip) : ip(ip), val(val) {
        Node();
        prevStrikeNode = this;
        nextStrikeNode = this;
    };

    uint64_t getVal() const {
        return val;
    }

    void setVal(uint64_t val) {
        StrideNode::val = val;
    }

    uint64_t getIp() const {
        return ip;
    }

    void setIp(uint64_t ip) {
        StrideNode::ip = ip;
    }

    StrideNode *getPrevStrikeNode() const {
        return prevStrikeNode;
    }

    void setPrevStrikeNode(StrideNode *prevStrikeNode) {
        StrideNode::prevStrikeNode = prevStrikeNode == nullptr ? this : prevStrikeNode;
    }

    StrideNode *getNextStrikeNode() const {
        return nextStrikeNode;
    }

    void setNextStrikeNode(StrideNode *nextStrikeNode) {
        StrideNode::nextStrikeNode = nextStrikeNode == nullptr ? this : nextStrikeNode;
    }

private:
    StrideNode *prevStrikeNode;
    StrideNode *nextStrikeNode;
    uint64_t ip;
    uint64_t val;
};

class GHBStride : public GHB {
public:
    GHBStride() : GHB() {};

    virtual void push(uint64_t ip, uint64_t addr) override;

    virtual void print() override;

    int64_t getStride(uint64_t ip);
};

void GHBStride::push(uint64_t ip, uint64_t addr) {
    if (entryNum == MAX_GHB_COUNT) {
        StrideNode *strideNode = (StrideNode *) this->front();
        uint64_t preIp = strideNode->getIp();
        strideNode->getNextStrikeNode()->setPrevStrikeNode(nullptr);
        if (indexTable[preIp] == strideNode)
            indexTable.erase(preIp);
        this->remove_front();
    } else {
        entryNum++;
    }
    StrideNode *strikeNode = new StrideNode(addr, ip);
    if (!indexTable.count(ip)) {
        indexTable.emplace(ip, strikeNode);
    } else {
        StrideNode *prev = (StrideNode *) indexTable[ip];
        if (prev != nullptr) {

            strikeNode->setPrevStrikeNode(prev);
            prev->setNextStrikeNode(strikeNode);
        }
        indexTable[ip] = strikeNode;
    }
    this->push_back(strikeNode);
}

int64_t GHBStride::getStride(uint64_t ip) {
    StrideNode *strikeNode[3];
    int64_t stride[2];

    strikeNode[0] = (StrideNode *) indexTable[ip];
    strikeNode[1] = strikeNode[0]->getPrevStrikeNode();
    strikeNode[2] = strikeNode[1]->getPrevStrikeNode();
    stride[0] = strikeNode[0]->getVal() - strikeNode[1]->getVal();
    stride[1] = strikeNode[1]->getVal() - strikeNode[2]->getVal();
    if (stride[0] == 0 || stride[1] == 0) {
        return 0;
    } else {
        return stride[0] == stride[1] ? stride[0] : 0;
    }
}

void GHBStride::print() {
    printf("Index table:\n");
    for (auto iter = indexTable.begin(); iter != indexTable.end(); iter++) {
        uint64_t key = iter->first;
        void *val = iter->second;
        printf("key:%d addr:%x\n", key, val);
    }
    printf("\nGHB:\n");
    printf("entry number:%d\n", this->entryNum);
    Node *cur = head->getNext();
    while (cur != head) {
        StrideNode *strikeNode = (StrideNode *) cur;
        printf("addr:%x val:%d ", strikeNode, strikeNode->getVal());
        if (strikeNode->getPrevStrikeNode() != strikeNode) {
            printf(",last val:%d", strikeNode->getPrevStrikeNode()->getVal());
        }
        printf("\n");
        cur = cur->getNext();
    }
}

GHB *ghb;

void CACHE::l2c_prefetcher_initialize() {
    cout << "CPU " << cpu << " L2C GHB stride prefetcher" << endl;
    ghb = new GHBStride();
}

uint32_t
CACHE::l2c_prefetcher_operate(uint64_t addr, uint64_t ip, uint8_t cache_hit, uint8_t type, uint32_t metadata_in) {
    uint64_t cl_addr = addr >> LOG2_BLOCK_SIZE;
    ghb->push(ip, cl_addr);
    int64_t stride = dynamic_cast<GHBStride *>(ghb)->getStride(ip);
    if (stride != 0) {
        for (int i = 0; i < PREFETCH_DEGREE; i++) {
            uint64_t pf_address = (cl_addr + (stride * (i + 1))) << LOG2_BLOCK_SIZE;

            if ((pf_address >> LOG2_PAGE_SIZE) != (addr >> LOG2_PAGE_SIZE))
                break;

            // check the MSHR occupancy to decide if we're going to prefetch to the L2 or LLC
            if (MSHR.occupancy < (MSHR.SIZE >> 1))
                prefetch_line(ip, addr, pf_address, FILL_L2, 0);
            else
                prefetch_line(ip, addr, pf_address, FILL_LLC, 0);
        }
    }
    return metadata_in;
}

uint32_t
CACHE::l2c_prefetcher_cache_fill(uint64_t addr, uint32_t set, uint32_t way, uint8_t prefetch, uint64_t evicted_addr,
                                 uint32_t metadata_in) {
    return metadata_in;
}

void CACHE::l2c_prefetcher_final_stats() {
    cout << "CPU " << cpu << " L2C GHB Stride prefetcher final stats" << endl;
}