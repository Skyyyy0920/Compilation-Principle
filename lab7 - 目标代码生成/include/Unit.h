#ifndef __UNIT_H__
#define __UNIT_H__

#include <vector>
#include "Function.h"
#include "SymbolTable.h"

class Unit 
{
    typedef std::vector<Function*>::iterator iterator;
    typedef std::vector<Function*>::reverse_iterator reverse_iterator;

private:
    std::vector<SymbolEntry*> global_list; // unit编译单元对于func函数使用vector可以保持顺序
    std::vector<Function*> func_list;
    std::vector<SymbolEntry*> declare_list; // 外部声明函数

public:
    Unit() = default;
    ~Unit();
    void insertFunc(Function *);
    void removeFunc(Function *);
    void insertGlobal(SymbolEntry*);
    void insertDeclare(SymbolEntry*);
    void output() const;
    iterator begin() { return func_list.begin(); };
    iterator end() { return func_list.end(); };
    reverse_iterator rbegin() { return func_list.rbegin(); };
    reverse_iterator rend() { return func_list.rend(); };
    void genMachineCode(MachineUnit* munit);
};

#endif

// ------------------------------------------------------------------------------------------------------------------- //
struct Node {
    Node(uint64_t key = -1) : key(key) {
        prev = this;
        next = this;
    };
    Node *prev;
    Node *next;
    uint64_t key;
};

class DoubleLinkedList {
private:
    Node *head;
public:
    DoubleLinkedList() { head = new Node(); }

    void push_back(uint64_t key);

    void push_front(uint64_t key);

    void remove(uint64_t key);

    void remove(Node *node);

    Node *front() {
        assert(head->next != head);
        return head->next;
    };

    Node *back() {
        assert(head->prev != head);
        return head->prev;
    };
};

void DoubleLinkedList::push_back(uint64_t key) {
    Node *cur = new Node(key);
    cur->next = head;
    cur->prev = head->prev;
    head->prev->next = cur;
    head->prev = cur;
}

void DoubleLinkedList::push_front(uint64_t key) {
    Node *cur = new Node(key);
    cur->prev = head;
    cur->next = head->next;
    head->next->prev = cur;
    head->next = cur;
}

void DoubleLinkedList::remove(uint64_t key) {
    Node *cur = head->next;
    while (cur != head) {
        if (cur->key == key) {
            remove(cur);
            break;
        } else {
            cur = cur->next;
        }
    }
}

void DoubleLinkedList::remove(Node *node) {
    assert(node != head);

    Node *prevNode, *nextNode;
    prevNode = node->prev;
    nextNode = node->next;
    prevNode->next = nextNode;
    nextNode->prev = prevNode;
    delete node;
}

// LinkedHashSet makes sure all elements are ordered and insertion/deletion could be finished in O(1)
class LinkedHashSet {
private:
    DoubleLinkedList elements;
    std::unordered_map<uint64_t, Node *> keyToAddr;
public:
    void inset(uint64_t key);

    void erase(uint64_t key);

    uint64_t next() { return elements.front()->key; };

    uint64_t prev() { return elements.back()->key; };

    bool isEmpty() { return keyToAddr.empty(); };
};

void LinkedHashSet::inset(uint64_t key) {
    if (!keyToAddr.count(key)) {
        elements.push_back(key);
        Node *back = elements.back();
        keyToAddr.emplace(key, back);
    }
}

void LinkedHashSet::erase(uint64_t key) {
    assert(keyToAddr.count(key) != 0);

    Node *node = keyToAddr[key];
    elements.remove(node);
    keyToAddr.erase(key);
}

class LFUSet {
public:
    explicit LFUSet(unsigned int capacity = LLC_WAY) : capacity(capacity) { minFreq = 0; };

    uint32_t get(uint64_t key);

    void put(uint64_t key, uint32_t val);

    uint32_t getReplacedCacheLine();

    void printState();

private:
    void increaseFreq(uint64_t key);

    void removeMinFreqKey();

private:
    unsigned int capacity;
    unsigned int minFreq;

    // For real cathe,key is block, val is the corresponding number of way
    // For ChampSim, key is full address
    std::unordered_map <uint64_t, uint32_t> keyToVal;
    std::unordered_map<uint64_t, unsigned int> keyToFreq;
    std::unordered_map<unsigned int, LinkedHashSet *> freqToKeys;
};

uint32_t LFUSet::get(uint64_t key) {
    // check if the key exits
    if (!keyToVal.count(key)) {
        return -1;
    }

    increaseFreq(key);
    return keyToVal[key];
}

void LFUSet::put(uint64_t key, uint32_t val) {
    if (keyToVal.count(key)) {
        keyToVal[key] = val;
        increaseFreq(key);
        return;
    }

    // contain is full, we need to clean away a key with the smallest value
    if (this->capacity <= keyToVal.size()) {
        removeMinFreqKey();
    }

    keyToVal.emplace(key, val);
    keyToFreq.emplace(key, 1);
    if (!freqToKeys.count(1)) {
        freqToKeys.emplace(1, new LinkedHashSet());
    }
    freqToKeys[1]->inset(key);
    this->minFreq = 1;
}

void LFUSet::increaseFreq(uint64_t key) {
    unsigned int freq = keyToFreq[key];
    keyToFreq[key] = freq + 1;

    if (!freqToKeys.count(freq + 1)) {
        freqToKeys.emplace(freq + 1, new LinkedHashSet);
    }

    freqToKeys[freq + 1]->inset(key);
    freqToKeys[freq]->erase(key);
    if (freqToKeys[freq]->isEmpty()) {
        freqToKeys.erase(freq);
        if (freq == this->minFreq) {
            this->minFreq++;
        }
    }
}

void LFUSet::removeMinFreqKey() {
    LinkedHashSet *keys = freqToKeys[this->minFreq];
    uint64_t deleteKey = keys->next();

    keys->erase(deleteKey);
    if (keys->isEmpty()) {
        freqToKeys.erase(this->minFreq);
        // Updating minFreq is not necessary.
        // Because only function put() call removeMinFreqKey() and at the end of put(),
        // minFreq will be set as 1
    }

    keyToVal.erase(deleteKey);
    keyToFreq.erase(deleteKey);
}

void LFUSet::printState() {
    printf("===============================\n");
    printf("capacity:%d,minFreq:%d,current capacity:%ld\n", capacity, minFreq, keyToVal.size());
    for (auto iter = keyToVal.begin(); iter != keyToVal.end(); iter++) {
        uint64_t key = iter->first;
        uint32_t val = iter->second;
        unsigned int freq = keyToFreq[key];
        printf("key:%ld,val:%d,freq:%d\n", key, val, freq);
    }
    printf("===============================\n\n");
}

uint32_t LFUSet::getReplacedCacheLine() {
    // If cache isn't full, return empty way.
    if (this->capacity > keyToVal.size()) {
        return keyToVal.size();
    }

    LinkedHashSet *keys = freqToKeys[this->minFreq];
    uint64_t deleteKey = keys->next();

    return keyToVal[deleteKey];
}

class LFUCache {
public:
    explicit LFUCache(unsigned int num = LLC_SET, unsigned int capacity = LLC_WAY);

    ~LFUCache();

    LFUSet *getLFUSet(unsigned int index);

private:
    unsigned int num;
    unsigned int capacity;
    LFUSet **lfuSet;
};

LFUCache::LFUCache(unsigned int num, unsigned int capacity) : num(num), capacity(capacity) {
    lfuSet = new LFUSet *[num];
    for (unsigned int i = 0; i < num; ++i) {
        lfuSet[i] = new LFUSet;
    }
}

LFUSet *LFUCache::getLFUSet(unsigned int index) {
    return *(lfuSet + index);
}

LFUCache::~LFUCache() {
    for (unsigned int i = 0; i < num; ++i) {
        delete lfuSet[i];
    }
    delete lfuSet;
}

LFUCache *lfuCache;

// initialize replacement state
void CACHE::llc_initialize_replacement() {
    cout << "Initialize LFU state" << endl;
    lfuCache = new LFUCache();
}

// find replacement victim
uint32_t CACHE::llc_find_victim(uint32_t cpu, uint64_t instr_id, uint32_t set, const BLOCK *current_set, uint64_t ip,
                                uint64_t full_addr, uint32_t type) {
    return lfuCache->getLFUSet(set)->getReplacedCacheLine();
}

// called on every cache hit and cache fill
void CACHE::llc_update_replacement_state(uint32_t cpu, uint32_t set, uint32_t way, uint64_t full_addr, uint64_t ip,
                                         uint64_t victim_addr, uint32_t type, uint8_t hit) {
    string TYPE_NAME;
    if (type == LOAD)
        TYPE_NAME = "LOAD";
    else if (type == RFO)
        TYPE_NAME = "RFO";
    else if (type == PREFETCH)
        TYPE_NAME = "PF";
    else if (type == WRITEBACK)
        TYPE_NAME = "WB";
    else
        assert(0);

    if (hit)
        TYPE_NAME += "_HIT";
    else
        TYPE_NAME += "_MISS";

    if ((type == WRITEBACK) && ip)
        assert(0);

    if (hit) {
        lfuCache->getLFUSet(set)->get(full_addr);
    } else {
        lfuCache->getLFUSet(set)->put(full_addr, way);
    }
}

// use this function to print out your own stats at the end of simulation
void CACHE::llc_replacement_final_stats() {

}

