#ifndef __INSTRUCTION_H__
#define __INSTRUCTION_H__

#include "Operand.h"
#include "AsmBuilder.h"
#include <vector>
#include <map>
#include <sstream>

class BasicBlock;

class Instruction
{
public:
    Operand* def_dst=nullptr;//用于死代码删除
    Instruction(unsigned instType, BasicBlock *insert_bb = nullptr);
    virtual ~Instruction();
    BasicBlock *getParent();
    bool isUncond() const {return instType == UNCOND;};
    bool isCond() const {return instType == COND;};
    bool isAlloc() const {return instType == ALLOCA;};//lab7
    bool isRet() const {return instType == RET;};
    bool isBinary() const {return instType == BINARY;};
    void setParent(BasicBlock *);
    void setNext(Instruction *);
    void setPrev(Instruction *);
    Instruction *getNext();
    Instruction *getPrev();
    virtual void output() const = 0;
    //lab7
    MachineOperand* genMachineOperand(Operand*);
    MachineOperand* genMachineReg(int reg);
    MachineOperand* genMachineVReg();
    MachineOperand* genMachineImm(int val);
    MachineOperand* genMachineLabel(int block_no);
    virtual void genMachineCode(AsmBuilder*) = 0;
    std::vector<Operand*> getOperands(){return operands;}//用于代数化简
    unsigned getOpcode(){return opcode;}//用于代数化简
protected:
    unsigned instType;
    unsigned opcode;
    Instruction *prev;
    Instruction *next;
    BasicBlock *parent;
    std::vector<Operand*> operands;
    enum {BINARY, COND, UNCOND, RET, LOAD, STORE, CMP, ALLOCA, 
          CALL, ZEXT, GEP, GEP_init, GEP_p_f, GEP_f, int2float , float2int};//新加
};

// meaningless instruction, used as the head node of the instruction list.
class DummyInstruction : public Instruction
{
public:
    DummyInstruction() : Instruction(-1, nullptr) {};
    void output() const {};
    void genMachineCode(AsmBuilder*) {};
};

class AllocaInstruction : public Instruction
{
public:
    AllocaInstruction(Operand *dst, SymbolEntry *se, BasicBlock *insert_bb = nullptr);
    ~AllocaInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
private:
    SymbolEntry *se;
};

class LoadInstruction : public Instruction
{
public:
    LoadInstruction(Operand *dst, Operand *src_addr, BasicBlock *insert_bb = nullptr);
    ~LoadInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};

class StoreInstruction : public Instruction
{
public:
    StoreInstruction(Operand *dst_addr, Operand *src, BasicBlock *insert_bb = nullptr);
    ~StoreInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};

class BinaryInstruction : public Instruction
{
public:
    bool constfolding = 0;
    int constval = 0;
    BinaryInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb = nullptr);
    ~BinaryInstruction();
    void output() const;
    enum {ADD, SUB, MUL, DIV, MOD,
          AND, OR};
    void genMachineCode(AsmBuilder*);
};

class CmpInstruction : public Instruction
{
    bool hasMov;
public:
    CmpInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb = nullptr);
    ~CmpInstruction();
    void output() const;
    enum {E, NE, L, LE, G, GE};
    void genMachineCode(AsmBuilder*);
    bool get_hasMov() {return hasMov;};
    void set_hasMov() {hasMov = 1;};
};

// unconditional branch
class UncondBrInstruction : public Instruction
{
public:
    UncondBrInstruction(BasicBlock*, BasicBlock *insert_bb = nullptr);
    void output() const;
    void setBranch(BasicBlock *);
    BasicBlock *getBranch();
    void genMachineCode(AsmBuilder*);
protected:
    BasicBlock *branch;
};

// conditional branch
class CondBrInstruction : public Instruction
{
public:
    CondBrInstruction(BasicBlock*, BasicBlock*, Operand *, BasicBlock *insert_bb = nullptr);
    ~CondBrInstruction();
    void output() const;
    void setTrueBranch(BasicBlock*);
    BasicBlock* getTrueBranch();
    void setFalseBranch(BasicBlock*);
    BasicBlock* getFalseBranch();
    void genMachineCode(AsmBuilder*);
protected:
    BasicBlock* true_branch;
    BasicBlock* false_branch;
};

class RetInstruction : public Instruction
{
public:
    RetInstruction(Operand *src, BasicBlock *insert_bb = nullptr);
    ~RetInstruction();
    void genMachineCode(AsmBuilder*);
    void output() const;
};

class CallInstruction : public Instruction {
   private:
    SymbolEntry* func;

   public:
    CallInstruction(Operand* dst, SymbolEntry* func, std::vector<Operand*> params, BasicBlock* insert_bb = nullptr);
    ~CallInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};

//此处特指，将 i1 扩展为 i32
class ZextInstruction : public Instruction {
   public:
    ZextInstruction(Operand* dst, Operand* src, BasicBlock* insert_bb = nullptr);
    ~ZextInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};

class float2intInstruction : public Instruction {
   public:
    float2intInstruction(Operand* dst, Operand* src, BasicBlock* insert_bb = nullptr);
    ~float2intInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};



class int2floatInstruction : public Instruction {
   public:
    int2floatInstruction(Operand* dst, Operand* src, BasicBlock* insert_bb = nullptr);
    ~int2floatInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};



class float2boolInstruction : public Instruction {
   public:
    float2boolInstruction(Operand* dst, Operand* src, BasicBlock* insert_bb = nullptr);
    ~float2boolInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};

// 4array
class GetEleAddrInstruction : public Instruction {

int size;
   public:
    GetEleAddrInstruction(Operand* dst,
                   Operand* arr,
                   Operand* idx,
                   BasicBlock* insert_bb,
                   int size);
    ~GetEleAddrInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);

};


class AddrIncrease4Instruction : public Instruction {
   private:
    Operand* init;

   public:
    AddrIncrease4Instruction(Operand* dst,
                   Operand* arr,
                   Operand* idx,
                   BasicBlock* insert_bb,
                   Operand* init);
    ~AddrIncrease4Instruction();
    void output() const;
    void genMachineCode(AsmBuilder*);

};


class Get1stEleAddrInstruction : public Instruction {


   public:
    Get1stEleAddrInstruction(Operand* dst,
                   Operand* arr,
                   Operand* idx,
                   BasicBlock* insert_bb = nullptr,
                   bool param_first = false);
    ~Get1stEleAddrInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);

};





#endif