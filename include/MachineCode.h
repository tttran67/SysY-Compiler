#ifndef __MACHINECODE_H__
#define __MACHINECODE_H__
#include <vector>
#include <set>
#include <string>
#include <algorithm>
#include <fstream>
#include "SymbolTable.h"


/* Hint:
* MachineUnit: Compiler unit
* MachineFunction: Function in assembly code 
* MachineInstruction: Single assembly instruction  
* MachineOperand: Operand in assembly instruction, such as immediate number, register, address label */

/* Todo:
* We only give the example code of "class BinaryMInstruction" and "class AccessMInstruction" (because we believe in you !!!),
* You need to complete other the member function, especially "output()" ,
* After that, you can use "output()" to print assembly code . */

class MachineUnit;
class MachineFunction;
class MachineBlock;
class MachineInstruction;

class MachineOperand
{
private:
    MachineInstruction* parent;
    int type;
    int val;  // value of immediate number
    float floatval; //float新加
    bool isfloat;
    int reg_no; // register no
    std::string label; // address label
    
public:
    enum { IMM, VREG, REG, LABEL };
    MachineOperand(int tp, int val);
    MachineOperand(int tp, float );
    MachineOperand(std::string label);
    bool operator == (const MachineOperand&) const;
    bool operator < (const MachineOperand&) const;
    bool isImm() { return this->type == IMM; }; 
    bool isReg() { return this->type == REG; };
    bool isVReg() { return this->type == VREG; };
    bool isLabel() { return this->type == LABEL; };
    int getVal() {return this->val; };
    float getfloatVal() {return this->floatval;};
    int getReg() {return this->reg_no; };
    void setReg(int regno) {this->type = REG; this->reg_no = regno;};
    std::string getLabel() {return this->label; };
    void setParent(MachineInstruction* p) { this->parent = p; };
    MachineInstruction* getParent() { return this->parent;};
    void PrintReg();
    void output();
    bool get_isfloat() {return isfloat;};
    void set_isfloat() { isfloat = 1; };
};

class MachineInstruction
{
protected:
    MachineBlock* parent;
    int no;
    int type;  // Instruction type
    int cond = MachineInstruction::NONE;  // Instruction execution condition, optional !!
    int op;  // Instruction opcode
    // Instruction operand list, sorted by appearance order in assembly instruction
    std::vector<MachineOperand*> def_list;
    std::vector<MachineOperand*> use_list;
    void addDef(MachineOperand* ope) { def_list.push_back(ope); };
    void addUse(MachineOperand* ope) { use_list.push_back(ope); };
    // Print execution code after printing opcode
    void PrintCond();
    enum instType { BINARY, LOAD, STORE, MOV, BRANCH, CMP, STACK, VCVTF2I, VCVTI2F };
    bool is_V;
public:
    MachineOperand* def_m_dst=nullptr;
    enum condType { EQ, NE, LT, LE , GT, GE, NONE };
    virtual void output() = 0;
    void setNo(int no) {this->no = no;};
    int getNo() {return no;};
    std::vector<MachineOperand*>& getDef() {return def_list;};
    std::vector<MachineOperand*>& getUse() {return use_list;};
    MachineBlock* getParent() {return parent;}
    bool isbx() {
        return type == BRANCH && op == 2; 
    }
    bool isbl() { 
        return type == BRANCH && op == 1; 
    }
    void set_V() {is_V = 1;};
    // 用于MUL2LSL
    bool isMul() const { return type == BINARY && op == 2; };
    bool isLoad() const { return type == LOAD; };
    bool isMov() const { return type == MOV && op == 0; };

};

class BinaryMInstruction : public MachineInstruction
{
public:
    bool addsp;
    enum opType { ADD, SUB, MUL, DIV, MOD, AND, OR };
    BinaryMInstruction(MachineBlock* p, int op, 
                    MachineOperand* dst, MachineOperand* src1, MachineOperand* src2, 
                    int cond = MachineInstruction::NONE);
    void output();
};


class LoadMInstruction : public MachineInstruction
{
public:
    LoadMInstruction(MachineBlock* p,
                    MachineOperand* dst, MachineOperand* src1, MachineOperand* src2 = nullptr, 
                    int cond = MachineInstruction::NONE);
    void output();
    bool is_1_src(){return use_list.size()==1;};
};

class StoreMInstruction : public MachineInstruction
{
public:
    bool has_ldr;
    int off;
    StoreMInstruction(MachineBlock* p,
                    MachineOperand* src1, MachineOperand* src2, MachineOperand* src3 = nullptr, 
                    int cond = MachineInstruction::NONE);
    void output();
};

class MovMInstruction : public MachineInstruction
{
    bool is_LSL = 0;
    int LSL_num;
public:
    enum opType { MOV, MVN };
    MovMInstruction(MachineBlock* p, int op, 
                MachineOperand* dst, MachineOperand* src,
                int cond = MachineInstruction::NONE);
    void output();
    void set_LSL(int x){is_LSL=1; LSL_num=x;};
};

class BranchMInstruction : public MachineInstruction
{
public:
    enum opType { B, BL, BX };
    BranchMInstruction(MachineBlock* p, int op, 
                MachineOperand* dst, 
                int cond = MachineInstruction::NONE);
    void output();
};

class CmpMInstruction : public MachineInstruction
{
public:
    enum opType { CMP };
    CmpMInstruction(MachineBlock* p, 
                MachineOperand* src1, MachineOperand* src2, 
                int cond = MachineInstruction::NONE);
    void output();
};

class StackMInstrcuton : public MachineInstruction
{
public:
    enum opType { PUSH, POP };
    StackMInstrcuton(MachineBlock* p, int op, 
                std::vector<MachineOperand*> src_vec,
                int cond = MachineInstruction::NONE);
    void output();
};


class Vcvti2fMInstruction : public MachineInstruction 
{
public:
    Vcvti2fMInstruction(MachineBlock* p,
                     MachineOperand* dst, MachineOperand* src,
                     int cond = MachineInstruction::NONE);
    void output();
};

class Vcvtf2iMInstruction : public MachineInstruction 
{
public:
    Vcvtf2iMInstruction(MachineBlock* p,
                     MachineOperand* dst, MachineOperand* src,
                     int cond = MachineInstruction::NONE);
    void output();
};


class MachineBlock
{
private:
    MachineFunction* parent;
    int no;  
    std::vector<MachineBlock *> pred, succ;
    std::vector<MachineInstruction*> inst_list;
    std::set<MachineOperand*> live_in;
    std::set<MachineOperand*> live_out;
    bool hasRet; //是否有 ret 指令
    static int label;
public:
    std::vector<MachineInstruction*>& getInsts() {return inst_list;};
    std::vector<MachineInstruction*>::iterator begin() { return inst_list.begin(); };
    std::vector<MachineInstruction*>::iterator end() { return inst_list.end(); };
    std::vector<MachineInstruction*>::reverse_iterator rbegin() { return inst_list.rbegin(); };
    MachineBlock(MachineFunction* p, int no) { this->parent = p; this->no = no; this->hasRet=0; };
    void addPred(MachineBlock* p) { this->pred.push_back(p); };
    void addSucc(MachineBlock* s) { this->succ.push_back(s); };
    std::set<MachineOperand*>& getLiveIn() {return live_in;};
    std::set<MachineOperand*>& getLiveOut() {return live_out;};
    std::vector<MachineBlock*>& getPreds() {return pred;};
    std::vector<MachineBlock*>& getSuccs() {return succ;};
    void output();
    void set_hasRet() {hasRet = 1;};
    bool get_hasRet() {return hasRet;};
    MachineFunction* getparent() {return parent;};
    void InsertInst(MachineInstruction* inst) { this->inst_list.push_back(inst); };
    void InsertInst_at_i(int i, MachineInstruction* inst) { this->inst_list.insert(inst_list.begin() + i, inst); };
    void remove(MachineInstruction* ins){
        auto it = find(inst_list.begin(), inst_list.end(), ins);
        if (it != inst_list.end())
            inst_list.erase(it);
    }
};

class MachineFunction
{
private:
    MachineUnit* parent;
    std::vector<MachineBlock*> block_list;
    int stack_size;
    std::set<int> saved_regs;
    std::set<int> saved_s_regs;
    SymbolEntry* sym_ptr;
public:
    std::vector<MachineBlock*>& getBlocks() {return block_list;};
    std::vector<MachineBlock*>::iterator begin() { return block_list.begin(); };
    std::vector<MachineBlock*>::iterator end() { return block_list.end(); };
    MachineFunction(MachineUnit* p, SymbolEntry* sym_ptr);
    /* HINT:
    * Alloc stack space for local variable;
    * return current frame offset ;
    * we store offset in symbol entry of this variable in function AllocInstruction::genMachineCode()
    * you can use this function in LinearScan::genSpillCode() */
    int AllocSpace(int size) { this->stack_size += size; return this->stack_size; };
    void InsertBlock(MachineBlock* block) { this->block_list.push_back(block); };
    void addSavedRegs(int regno) {saved_regs.insert(regno);};
    void addSaved_S_Regs(int regno) {saved_s_regs.insert(regno);};
    void output();
    // std::set<int> get_saved_regs() {return saved_regs;};
    // std::set<int> get_saved_s_regs() {return saved_s_regs;};

    std::set<int> get_saved_regs();
    std::set<int> get_saved_s_regs();

    MachineUnit* getparent() {return parent;};

};

class MachineUnit
{
private:
    std::vector<MachineFunction*> func_list;
    void PrintGlobalDecl();
public:
    int counter;
    std::vector<MachineFunction*>& getFuncs() {return func_list;};
    std::vector<MachineFunction*>::iterator begin() { return func_list.begin(); };
    std::vector<MachineFunction*>::iterator end() { return func_list.end(); };
    void InsertFunc(MachineFunction* func) { func_list.push_back(func);};
    void output();
};

#endif