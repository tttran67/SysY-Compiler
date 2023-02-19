#include "Instruction.h"
#include "BasicBlock.h"
#include <iostream>
#include "Function.h"
#include "Type.h"
extern FILE* yyout;
bool debug5 = 0;
int cmpcond;//为了暂存cmp指令的cond类型
bool flag_param=0;//暂存是否有多余(>4)的参数，便于在store的时候load

Instruction::Instruction(unsigned instType, BasicBlock *insert_bb)
{
    prev = next = this;
    opcode = -1;
    this->instType = instType;
    if (insert_bb != nullptr)
    {
        insert_bb->insertBack(this);
        parent = insert_bb;
    }
}

Instruction::~Instruction()
{
    parent->remove(this);
}

BasicBlock *Instruction::getParent()
{
    return parent;
}

void Instruction::setParent(BasicBlock *bb)
{
    parent = bb;
}

void Instruction::setNext(Instruction *inst)
{
    next = inst;
}

void Instruction::setPrev(Instruction *inst)
{
    prev = inst;
}

Instruction *Instruction::getNext()
{
    return next;
}

Instruction *Instruction::getPrev()
{
    return prev;
}

BinaryInstruction::BinaryInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb) : Instruction(BINARY, insert_bb)
{
    this->opcode = opcode;
    operands.push_back(dst);
    operands.push_back(src1);
    operands.push_back(src2);
    dst->setDef(this);
    def_dst = dst;
    src1->addUse(this);
    src2->addUse(this);
}

BinaryInstruction::~BinaryInstruction()
{
    operands[0]->setDef(nullptr);
    if(operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
    operands[2]->removeUse(this);
}

void BinaryInstruction::output() const
{
    std::string s1, s2, s3, op, type;
    s1 = operands[0]->toStr();
    s2 = operands[1]->toStr();
    s3 = operands[2]->toStr();
    type = operands[0]->getType()->toStr();
    switch (opcode)
    {
    case ADD:
        op = "add";
        break;
    case SUB:
        op = "sub";
        break;
    case MUL:
        op = "mul";
        break;
    case DIV:
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

CmpInstruction::CmpInstruction(unsigned opcode, Operand *dst, Operand *src1, Operand *src2, BasicBlock *insert_bb): Instruction(CMP, insert_bb){
    this->opcode = opcode;
    operands.push_back(dst);
    operands.push_back(src1);
    operands.push_back(src2);
    dst->setDef(this);
    def_dst = dst;
    src1->addUse(this);
    src2->addUse(this);    
}

CmpInstruction::~CmpInstruction()
{
    operands[0]->setDef(nullptr);
    if(operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
    operands[2]->removeUse(this);
}

void CmpInstruction::output() const
{
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

UncondBrInstruction::UncondBrInstruction(BasicBlock *to, BasicBlock *insert_bb) : Instruction(UNCOND, insert_bb)
{
    branch = to;
}

void UncondBrInstruction::output() const
{
    fprintf(yyout, "  br label %%B%d\n", branch->getNo());
}

void UncondBrInstruction::setBranch(BasicBlock *bb)
{
    branch = bb;
}

BasicBlock *UncondBrInstruction::getBranch()
{
    return branch;
}

CondBrInstruction::CondBrInstruction(BasicBlock*true_branch, BasicBlock*false_branch, Operand *cond, BasicBlock *insert_bb) : Instruction(COND, insert_bb){
    this->true_branch = true_branch;
    this->false_branch = false_branch;
    cond->addUse(this);
    operands.push_back(cond);
}

CondBrInstruction::~CondBrInstruction()
{
    operands[0]->removeUse(this);
}

void CondBrInstruction::output() const
{
    std::string cond, type;
    cond = operands[0]->toStr();
    type = operands[0]->getType()->toStr();
    int true_label = true_branch->getNo();
    int false_label = false_branch->getNo();
    fprintf(yyout, "  br %s %s, label %%B%d, label %%B%d\n", type.c_str(), cond.c_str(), true_label, false_label);
}

void CondBrInstruction::setFalseBranch(BasicBlock *bb)
{
    false_branch = bb;
}

BasicBlock *CondBrInstruction::getFalseBranch()
{
    return false_branch;
}

void CondBrInstruction::setTrueBranch(BasicBlock *bb)
{
    true_branch = bb;
}

BasicBlock *CondBrInstruction::getTrueBranch()
{
    return true_branch;
}

RetInstruction::RetInstruction(Operand *src, BasicBlock *insert_bb) : Instruction(RET, insert_bb)
{
    if(src != nullptr)
    {
        operands.push_back(src);
        src->addUse(this);
    }
}

RetInstruction::~RetInstruction()
{
    if(!operands.empty())
        operands[0]->removeUse(this);
}

void RetInstruction::output() const
{
    if(operands.empty())
    {
        fprintf(yyout, "  ret void\n");
    }
    else
    {
        std::string ret, type;
        ret = operands[0]->toStr();
        type = operands[0]->getType()->toStr();
        fprintf(yyout, "  ret %s %s\n", type.c_str(), ret.c_str());
    }
}

AllocaInstruction::AllocaInstruction(Operand *dst, SymbolEntry *se, BasicBlock *insert_bb) : Instruction(ALLOCA, insert_bb)
{
    operands.push_back(dst);
    dst->setDef(this);
    def_dst = dst;
    this->se = se;
}

AllocaInstruction::~AllocaInstruction()
{
    operands[0]->setDef(nullptr);
    if(operands[0]->usersNum() == 0)
        delete operands[0];
}

void AllocaInstruction::output() const
{
    std::string dst, type;
    dst = operands[0]->toStr();
    type = se->getType()->toStr();
    fprintf(yyout, "  %s = alloca %s, align 4\n", dst.c_str(), type.c_str());
}

LoadInstruction::LoadInstruction(Operand *dst, Operand *src_addr, BasicBlock *insert_bb) : Instruction(LOAD, insert_bb)
{
    operands.push_back(dst);
    operands.push_back(src_addr);
    dst->setDef(this);
    def_dst = dst;
    src_addr->addUse(this);
}

LoadInstruction::~LoadInstruction()
{
    operands[0]->setDef(nullptr);
    if(operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
}

void LoadInstruction::output() const
{
    std::string dst = operands[0]->toStr();
    std::string src = operands[1]->toStr();
    std::string src_type;
    std::string dst_type;
    dst_type = operands[0]->getType()->toStr();
    src_type = operands[1]->getType()->toStr();
    fprintf(yyout, "  %s = load %s, %s %s, align 4\n", dst.c_str(), dst_type.c_str(), src_type.c_str(), src.c_str());
}

StoreInstruction::StoreInstruction(Operand *dst_addr, Operand *src, BasicBlock *insert_bb) : Instruction(STORE, insert_bb)
{
    operands.push_back(dst_addr);
    operands.push_back(src);
    dst_addr->addUse(this);
    src->addUse(this);
}

StoreInstruction::~StoreInstruction()
{
    operands[0]->removeUse(this);
    operands[1]->removeUse(this);
}

void StoreInstruction::output() const
{
    std::string dst = operands[0]->toStr();
    std::string src = operands[1]->toStr();
    std::string dst_type = operands[0]->getType()->toStr();
    std::string src_type = operands[1]->getType()->toStr();

    fprintf(yyout, "  store %s %s, %s %s, align 4\n", src_type.c_str(), src.c_str(), dst_type.c_str(), dst.c_str());
}
CallInstruction::CallInstruction(Operand* dst, SymbolEntry* func, std::vector<Operand*> srcVec, BasicBlock* insert_bb): Instruction(CALL, insert_bb)
{
    this->func=func;
    operands.push_back(dst);
    dst->setDef(this);
   // def_dst = dst;//这里不能加，比如putint()就没有使用dst，但它必须有
    for (auto src : srcVec) {
        operands.push_back(src);
        src->addUse(this);
    }
}
CallInstruction::~CallInstruction()
{
    operands[0]->setDef(nullptr);
    if(operands[0]->usersNum() == 0)
        delete operands[0];
    for(long unsigned int i=1;i<operands.size();i++)
    {
        operands[i]->removeUse(this);
    }
}
void CallInstruction::output() const{
    FunctionType* type = (FunctionType*) (func -> getType());
    if(type->getRetType()->isVoid())
    {
        for(long unsigned int i = 0; i < operands.size(); i++)
        {
            if(i==0)
                fprintf(yyout, " call %s %s(", type -> getRetType() -> toStr().c_str(), func -> toStr().c_str());
            else
            {
                if(i > 1)
                    fprintf(yyout, ", ");
                fprintf(yyout, "%s %s", operands[i] -> getType() -> toStr().c_str(), operands[i] -> toStr().c_str());
            }
        }
        fprintf(yyout, ")\n");
    }
    else
    {
        for(long unsigned int i = 0; i < operands.size(); i++)
        {
            if(i==0)
                fprintf(yyout, " %s = call %s %s(", operands[0] -> toStr().c_str(), type -> getRetType() -> toStr().c_str(), func -> toStr().c_str());
            else
            {
                if(i > 1)
                    fprintf(yyout, ", ");
                fprintf(yyout, "%s %s", operands[i] -> getType() -> toStr().c_str(), operands[i] -> toStr().c_str());
            }
        }
    fprintf(yyout, ")\n");
    }
    
}


ZextInstruction::ZextInstruction(Operand* dst, Operand* src, BasicBlock* insert_bb) : Instruction(ZEXT, insert_bb)
{
    operands.push_back(dst);
    operands.push_back(src);
    dst->setDef(this);
    def_dst = dst;
    src->addUse(this);
}
ZextInstruction::~ZextInstruction()
{
    operands[0]->setDef(nullptr);
    if(operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
}

void ZextInstruction::output() const
{
    fprintf(yyout, "  %s = zext i1 %s to i32\n", operands[0]->toStr().c_str(), operands[1]->toStr().c_str());
}

//lab7
MachineOperand* Instruction::genMachineOperand(Operand* ope)
{
    auto se = ope->getEntry();
    MachineOperand* mope = nullptr;

    if(se->getType()->isFloat())
    {
        if(se->isConstant())
            mope = new MachineOperand(MachineOperand::IMM, dynamic_cast<ConstantSymbolEntry*>(se)->getfloatValue());
        else if(se->isTemporary())
        {
            
            auto tem_se = dynamic_cast<TemporarySymbolEntry*>(se);
            if(tem_se->get_is_param())
            {
                if (tem_se->get_s_param_num() < 4)
                {
                    mope = new MachineOperand(MachineOperand::REG, tem_se->get_s_param_num());
                    mope->set_isfloat();
                }
                else
                {
                    flag_param=1;
                    mope = new MachineOperand(MachineOperand::REG, 0);
                }
            }
            else
            {
                mope = new MachineOperand(MachineOperand::VREG, dynamic_cast<TemporarySymbolEntry*>(se)->getLabel());
                mope->set_isfloat();
            } 

        }
        else if(se->isVariable())
        {
            auto id_se = dynamic_cast<IdentifierSymbolEntry*>(se);
            if(id_se->isGlobal())
            {
                mope = new MachineOperand(id_se->toStr().c_str());
                mope->set_isfloat();
            }
                
            else
                exit(0);
        }
    }
    else
    {
        if(se->isConstant())
            mope = new MachineOperand(MachineOperand::IMM, dynamic_cast<ConstantSymbolEntry*>(se)->getValue());
        else if(se->isTemporary())
        {
            auto tem_se = dynamic_cast<TemporarySymbolEntry*>(se);
            if(tem_se->get_is_param())
            {
                if (tem_se->get_r_param_num() < 4)
                    mope = new MachineOperand(MachineOperand::REG, tem_se->get_r_param_num());
                else
                {
                    flag_param=1;
                    mope = new MachineOperand(MachineOperand::REG, 0);
                }
            }
            else
                mope = new MachineOperand(MachineOperand::VREG, dynamic_cast<TemporarySymbolEntry*>(se)->getLabel());
        }
        else if(se->isVariable())
        {
            auto id_se = dynamic_cast<IdentifierSymbolEntry*>(se);
            if(id_se->isGlobal())
                mope = new MachineOperand(id_se->toStr().c_str());
            else
                exit(0);
        }
    }


    return mope;
}

MachineOperand* Instruction::genMachineReg(int reg) 
{
    return new MachineOperand(MachineOperand::REG, reg);
}

MachineOperand* Instruction::genMachineVReg() 
{
    return new MachineOperand(MachineOperand::VREG, SymbolTable::getLabel());
}

MachineOperand* Instruction::genMachineImm(int val) 
{
    return new MachineOperand(MachineOperand::IMM, val);
}

MachineOperand* Instruction::genMachineLabel(int block_no)
{
    std::ostringstream buf;
    buf << ".L" << block_no;
    std::string label = buf.str();
    return new MachineOperand(label);
}

void AllocaInstruction::genMachineCode(AsmBuilder* builder)
{
    if(debug5) printf("AllocaInstruction::genMachineCode\n");
    /* HINT:
    * Allocate stack space for local variabel
    * Store frame offset in symbol entry */
    auto cur_func = builder->getFunction();
    int size = se->getType()->getSize() / 8;
    int offset = cur_func->AllocSpace(size);
    dynamic_cast<TemporarySymbolEntry*>(operands[0]->getEntry())->setOffset(-offset);
}

void LoadInstruction::genMachineCode(AsmBuilder* builder)
{
    if(debug5) printf("LoadInstruction::genMachineCode\n");
    auto cur_block = builder->getBlock();
    MachineInstruction* cur_inst = nullptr;
    // 1. Load global operand 加载一个全局变量或者常量
    if(operands[1]->getEntry()->isVariable()
    && dynamic_cast<IdentifierSymbolEntry*>(operands[1]->getEntry())->isGlobal())
    {
        auto dst = genMachineOperand(operands[0]);
        auto internal_reg1 = genMachineVReg();
        auto internal_reg2 = new MachineOperand(*internal_reg1);
        auto src = genMachineOperand(operands[1]);
        // example: load r0, addr_a 在全局的地址标签中将其地址加载到寄存器中
        cur_inst = new LoadMInstruction(cur_block, internal_reg1, src);
        cur_block->InsertInst(cur_inst);
        // example: load r1, [r0] 从该地址中加载出其实际的值
        cur_inst = new LoadMInstruction(cur_block, dst, internal_reg2);
        if(operands[0]->getType()->isFloat())
            cur_inst->set_V();
        cur_block->InsertInst(cur_inst);
    }
    // 2. Load local operand 加载一个栈中的临时变量
    else if(operands[1]->getEntry()->isTemporary()
    && operands[1]->getDef()
    && operands[1]->getDef()->isAlloc())
    {
        // example: load r1, [r0, #4]
        auto dst = genMachineOperand(operands[0]);
        auto src1 = genMachineReg(11); // fp
        auto src2 = genMachineImm(dynamic_cast<TemporarySymbolEntry*>(operands[1]->getEntry())->getOffset());
        

// 255：https://blog.csdn.net/xys616/article/details/88374154

        if(dynamic_cast<TemporarySymbolEntry*>(operands[1]->getEntry())->getOffset() > 255
        || dynamic_cast<TemporarySymbolEntry*>(operands[1]->getEntry())->getOffset() < -255)
        {
            auto operand = genMachineVReg();
            cur_block->InsertInst((new LoadMInstruction(cur_block, operand, src2)));
            src2 = operand;
        }
        cur_inst = new LoadMInstruction(cur_block, dst, src1, src2);
        if(operands[0]->getType()->isFloat())
            cur_inst->set_V();
        cur_block->InsertInst(cur_inst);
    }
    // 3. Load operand from temporary variable 从临时变量中加载
    else
    {
        // example: load r1, [r0]
        auto dst = genMachineOperand(operands[0]);
        auto src = genMachineOperand(operands[1]);
        cur_inst = new LoadMInstruction(cur_block, dst, src);
        if (operands[0]->getType()->isFloat() || operands[1]->getType()->isFloat()) 
            cur_inst->set_V();
        cur_block->InsertInst(cur_inst);
    }
}

void StoreInstruction::genMachineCode(AsmBuilder* builder)
{
    // TODO
    if(debug5) printf("StoreInstruction::genMachineCode\n");
    auto cur_block = builder->getBlock();
    MachineInstruction* cur_inst = nullptr;
    // Store global operand
    if(operands[0]->getEntry()->isVariable()
    && dynamic_cast<IdentifierSymbolEntry*>(operands[0]->getEntry())->isGlobal())
    {
        //此时 addr_a 是 operands[0]，即dst；r1 是 operands[1]，即src
        auto dst = genMachineOperand(operands[0]);
        auto internal_reg1 = genMachineVReg();
        auto src = genMachineOperand(operands[1]);

        //处理imm，当src是imm时，先加一条load
        if (operands[1]->getEntry()->isConstant()) 
        {
            //浮点数放到 s() 寄存器
            if(operands[1]->getType()->isFloat())
            {
                // load: 	mov	r4, #0  ;   movt r4, 16416
                // mov:     vmov s5, r4
                auto temp_dst = genMachineVReg();
                temp_dst->set_isfloat();
                auto internal_reg = genMachineVReg();
                cur_inst = new LoadMInstruction(cur_block, internal_reg, src);
                cur_block->InsertInst(cur_inst);
                internal_reg = new MachineOperand(*internal_reg);
                cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, temp_dst, internal_reg);
                cur_inst->set_V();
                cur_block->InsertInst(cur_inst);
                src = new MachineOperand(*temp_dst);
            }
            else
            {
                // example: load r1, 6
                auto temp_dst = genMachineVReg();
                cur_inst = new LoadMInstruction(cur_block, temp_dst, src);
                cur_block->InsertInst(cur_inst);
                src = new MachineOperand(*temp_dst);
            }
        }

        // example: load r0, addr_a
        cur_inst = new LoadMInstruction(cur_block, internal_reg1, dst);
        cur_block->InsertInst(cur_inst);
        // example: store r1, [r0]
        cur_inst = new StoreMInstruction(cur_block, src, internal_reg1);
        if(operands[1]->getType()->isFloat())
            cur_inst->set_V();
        cur_block->InsertInst(cur_inst);
    }
    // Store local operand
    else if(operands[0]->getEntry()->isTemporary()
    && operands[0]->getDef()
    && operands[0]->getDef()->isAlloc())
    {
        // example：store r1, [fp, #4]
        // 与load相反，r1 是 operands[1]，即src
        auto src = genMachineOperand(operands[1]);
        //处理imm，当src是imm时，先加一条load
        if (operands[1]->getEntry()->isConstant()) 
        {
            //浮点数放到 s() 寄存器
            if(operands[1]->getType()->isFloat())
            {
                // load: 	mov	r4, #0  ;   movt r4, 16416
                // mov:     vmov s5, r4
                auto temp_dst = genMachineVReg();
                temp_dst->set_isfloat();
                auto internal_reg = genMachineVReg();
                cur_inst = new LoadMInstruction(cur_block, internal_reg, src);
                cur_block->InsertInst(cur_inst);
                internal_reg = new MachineOperand(*internal_reg);
                cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, temp_dst, internal_reg);
                cur_inst->set_V();
                cur_block->InsertInst(cur_inst);
                src = new MachineOperand(*temp_dst);
            }
            else
            {
                // example: load r1, 6
                auto temp_dst = genMachineVReg();
                cur_inst = new LoadMInstruction(cur_block, temp_dst, src);
                cur_block->InsertInst(cur_inst);
                src = new MachineOperand(*temp_dst);
            }
        }
        auto src1 = genMachineReg(11);
        auto src2 = genMachineImm(dynamic_cast<TemporarySymbolEntry*>(operands[0]->getEntry())->getOffset());
        

        if (dynamic_cast<TemporarySymbolEntry*>(operands[0]->getEntry())->getOffset() > 255 
        ||  dynamic_cast<TemporarySymbolEntry*>(operands[0]->getEntry())->getOffset() < -255) 
        {
            auto operand = genMachineVReg();
            cur_block->InsertInst((new LoadMInstruction(cur_block, operand, src2)));
            src2 = operand;
        }

        cur_inst = new StoreMInstruction(cur_block, src, src1, src2);
        if(operands[1]->getType()->isFloat())
            cur_inst->set_V();

        if(flag_param)
        {
            //有>4参数，load出来，此处的工作放到 StoreMInstruction 的output 中（因为此处还不知道栈里面的情况，不可确定offset）
            StoreMInstruction* t_inst = (StoreMInstruction*)cur_inst;
            t_inst->has_ldr=1;//给 store 做个标记

            auto t_se = operands[1]->getEntry();
            TemporarySymbolEntry* tem_se = dynamic_cast<TemporarySymbolEntry*>(t_se);
            t_inst->off = tem_se->get_param_num() - 4;

            flag_param=0;
        }


        cur_block->InsertInst(cur_inst);
    }

    else
    {
        // example: store r1, [r0]
        auto dst = genMachineOperand(operands[0]);
        auto src = genMachineOperand(operands[1]);
        //处理imm，当src是imm时，先加一条load
        if (operands[1]->getEntry()->isConstant()) 
        {
            //浮点数放到 s() 寄存器
            if(operands[1]->getType()->isFloat())
            {
                // load: 	mov	r4, #0  ;   movt r4, 16416
                // mov:     vmov s5, r4
                auto temp_dst = genMachineVReg();
                temp_dst->set_isfloat();
                auto internal_reg = genMachineVReg();
                cur_inst = new LoadMInstruction(cur_block, internal_reg, src);
                cur_block->InsertInst(cur_inst);
                internal_reg = new MachineOperand(*internal_reg);
                cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, temp_dst, internal_reg);
                cur_inst->set_V();
                cur_block->InsertInst(cur_inst);
                src = new MachineOperand(*temp_dst);
            }
            else
            {
                // example: load r1, 6
                auto temp_dst = genMachineVReg();
                cur_inst = new LoadMInstruction(cur_block, temp_dst, src);
                cur_block->InsertInst(cur_inst);
                src = new MachineOperand(*temp_dst);
            }
        }
        cur_inst = new StoreMInstruction(cur_block, src, dst);
        if(operands[1]->getType()->isFloat())
            cur_inst->set_V();
        cur_block->InsertInst(cur_inst);
    }

}

void BinaryInstruction::genMachineCode(AsmBuilder* builder)
{
    if(debug5) printf("BinaryInstruction::genMachineCode\n");


    // TODO:
    // complete other instructions
    auto dst = genMachineOperand(operands[0]);
    auto src1 = genMachineOperand(operands[1]);
    auto src2 = genMachineOperand(operands[2]);


    auto cur_block = builder->getBlock();
    MachineInstruction* cur_inst = nullptr;

    if(constfolding){
        auto internal_reg = genMachineImm(constval);
        if(constval<255 && constval>-255)
        {
            cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, internal_reg);
            cur_block->InsertInst(cur_inst);
        }
        else
        {
            cur_inst = new LoadMInstruction(cur_block, dst, internal_reg);
            cur_block->InsertInst(cur_inst);
        }
        return;
    }
    /* HINT:
    * The source operands of ADD instruction in ir code both can be immediate num.
    * However, it's not allowed in assembly code.
    * So you need to insert LOAD/MOV instrucrion to load immediate num into register.
    * As to other instructions, such as MUL, CMP, you need to deal with this situation, too.*/
    /* ir代码中ADD指令的源操作数都可以是立即数。
    *  但是，在程序集代码中不允许这样做。
    *  所以您需要插入 LOAD/MOV 指令来将立即数加载到寄存器中。
    *  至于其他指令，如 MUL、CMP，您也需要处理这种情况*/
   
    if(src1->isImm())
    {
        auto internal_reg = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, internal_reg, src1);
        cur_block->InsertInst(cur_inst);
        if(operands[0]->getType()->isFloat())
        {
            //浮点数 vmov 到 s()
            internal_reg = new MachineOperand(*internal_reg);
            auto temp_src1 = genMachineVReg();
            temp_src1->set_isfloat();
            cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, temp_src1, internal_reg);
            cur_inst->set_V();
            cur_block->InsertInst(cur_inst);
            src1 = new MachineOperand(*temp_src1);
        }
        else
            src1 = new MachineOperand(*internal_reg);
    }
    //判断src2为立即数的情况
    if (src2->isImm() && !(operands[0]->getType()->isFloat())
        && (opcode==MUL || opcode == DIV|| opcode== MOD)) 
    {
        auto internal_reg = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, internal_reg, src2);
        cur_block->InsertInst(cur_inst);
        src2 = new MachineOperand(*internal_reg);
    }
    else if(src2->isImm() && !(operands[0]->getType()->isFloat())
            && (
            (((ConstantSymbolEntry*)(operands[2]->getEntry()))->getValue() > 255)
            || (((ConstantSymbolEntry*)(operands[2]->getEntry()))->getValue() < -255)
            ))
    {
        auto internal_reg = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, internal_reg, src2);
        cur_block->InsertInst(cur_inst);
        src2 = new MachineOperand(*internal_reg);
    }

    else if(src2->isImm() && operands[0]->getType()->isFloat())
    {
        // load -> r()
        // vmov -> s()
        auto internal_reg = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, internal_reg, src2);
        cur_block->InsertInst(cur_inst);
        //浮点数 vmov 到 s()
        internal_reg = new MachineOperand(*internal_reg);
        auto temp_src2 = genMachineVReg();
        temp_src2->set_isfloat();
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, temp_src2, internal_reg);
        cur_inst->set_V();
        cur_block->InsertInst(cur_inst);
        src2 = new MachineOperand(*temp_src2);
    }


    switch (opcode)
    {
    case ADD:
        {cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, dst, src1, src2);

        if(operands[0]->getType()->isFloat())
            cur_inst->set_V();}
        break;
    case SUB:
        {cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::SUB, dst, src1, src2);
        if(operands[0]->getType()->isFloat())
            cur_inst->set_V();}
        break;
    case MUL:
        {cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::MUL, dst, src1, src2);
        if(operands[0]->getType()->isFloat())
            cur_inst->set_V();}
        break;
    case DIV:
        {cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::DIV, dst, src1, src2);
        if(operands[0]->getType()->isFloat())
            cur_inst->set_V();}
        break;
    case MOD: // r2 = r0 % r1
        {
        // r2 = r0 / r1
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::DIV, dst, src1, src2);
        cur_block->InsertInst(cur_inst);

        // r2 = r2 * r1
        MachineOperand* dst1 = new MachineOperand(*dst); //r2
        src2 = new MachineOperand(*src2);//r1
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::MUL, dst1, dst, src2);
        cur_block->InsertInst(cur_inst);

        // r2 = r0 - r2
        src1 = new MachineOperand(*src1);//r0
        dst = new MachineOperand(*dst1);//r2
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::SUB, dst, src1, dst1);
        }
        break;
    case AND:
        {cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::AND, dst, src1, src2);}
        break;
    case OR:
        {cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::OR, dst, src1, src2);}
        break;
    default:
        break;
    }
    cur_block->InsertInst(cur_inst);
}

void CmpInstruction::genMachineCode(AsmBuilder* builder)
{
    if(debug5) printf("CmpInstruction::genMachineCode\n");
    // TODO
    auto cur_block = builder->getBlock();
    auto dst = genMachineOperand(operands[0]);
    auto src1 = genMachineOperand(operands[1]);
    auto src2 = genMachineOperand(operands[2]);
    MachineInstruction* cur_inst = nullptr;
    //类似于binary指令，处理cmp的src为立即数的情况
    if(src1->isImm())
    {
        auto internal_reg = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, internal_reg, src1);
        cur_block->InsertInst(cur_inst);
        if(operands[1]->getType()->isFloat())
        {
            //浮点数 vmov 到 s()
            internal_reg = new MachineOperand(*internal_reg);
            auto temp_src1 = genMachineVReg();
            temp_src1->set_isfloat();
            cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, temp_src1, internal_reg);
            cur_inst->set_V();
            cur_block->InsertInst(cur_inst);
            src1 = new MachineOperand(*temp_src1);
        }
        else
            src1 = new MachineOperand(*internal_reg);

    }
    if (src2->isImm() && operands[1]->getType()->isFloat()) 
    {
        auto internal_reg = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, internal_reg, src2);
        cur_block->InsertInst(cur_inst);
        //浮点数 vmov 到 s()
        internal_reg = new MachineOperand(*internal_reg);
        auto temp_src2 = genMachineVReg();
        temp_src2->set_isfloat();
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, temp_src2, internal_reg);
        cur_inst->set_V();
        cur_block->InsertInst(cur_inst);
        src2 = new MachineOperand(*temp_src2);
    }

    else if(src2->isImm() && !operands[1]->getType()->isFloat() &&
    ((ConstantSymbolEntry*)(operands[2]->getEntry()))->getValue() > 255)
    {
        auto ld_dst = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, ld_dst, src2);
        cur_block->InsertInst(cur_inst);
        src2 = new MachineOperand(*ld_dst);
    }


    cmpcond=opcode;//暂存cond，为了后面的跳转指令使用
    cur_inst = new CmpMInstruction(cur_block, src1, src2, opcode);
    if(operands[1]->getType()->isFloat())
        cur_inst->set_V();
    cur_block->InsertInst(cur_inst);


    switch(opcode)
    {
    case NE:
        // movne r4, #1  ； moveq r4, #0
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, genMachineImm(1), NE);
        cur_block->InsertInst(cur_inst);
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, genMachineImm(0), E);
        cur_block->InsertInst(cur_inst);
        break;
    case E:
        // moveq r4, #1  ； movne r4, #0
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, genMachineImm(1), E);
        cur_block->InsertInst(cur_inst);
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, genMachineImm(0), NE);
        cur_block->InsertInst(cur_inst);
        break;
    case L:
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, genMachineImm(1), L);
        cur_block->InsertInst(cur_inst);
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, genMachineImm(0), GE);
        cur_block->InsertInst(cur_inst);
        break;
    case LE:
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, genMachineImm(1), LE);
        cur_block->InsertInst(cur_inst);
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, genMachineImm(0), G);
        cur_block->InsertInst(cur_inst);
        break;
    case G:
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, genMachineImm(1), G);
        cur_block->InsertInst(cur_inst);
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, genMachineImm(0), LE);
        cur_block->InsertInst(cur_inst);
        break;
    case GE:
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, genMachineImm(1), GE);
        cur_block->InsertInst(cur_inst);
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, genMachineImm(0), L);
        cur_block->InsertInst(cur_inst);
        break;


    }



}

void UncondBrInstruction::genMachineCode(AsmBuilder* builder)
{
    if(debug5) printf("UncondBrInstruction::genMachineCode\n");
    // TODO
    auto cur_block = builder->getBlock();
    MachineOperand* dst = genMachineLabel(branch->getNo());
    auto cur_inst = new BranchMInstruction(cur_block, BranchMInstruction::B, dst);
    cur_block->InsertInst(cur_inst);
}

void CondBrInstruction::genMachineCode(AsmBuilder* builder)
{
    if(debug5) printf("CondBrInstruction::genMachineCode\n");
    // TODO
    auto cur_block = builder->getBlock();
    MachineInstruction* cur_inst = nullptr;
    // example:  从llvm的br条件跳转，转为两条汇编指令
    // br %1 , %2
    // -> 
    // bgt %1
    // b %2
    MachineOperand* true_dst = genMachineLabel(true_branch->getNo());
    cur_inst = new BranchMInstruction(cur_block, BranchMInstruction::B, true_dst, cmpcond);//这里使用从cmp那里暂存的op
    cur_block->InsertInst(cur_inst);

    MachineOperand* false_dst = genMachineLabel(false_branch->getNo());
    cur_inst = new BranchMInstruction(cur_block, BranchMInstruction::B, false_dst);
    cur_block->InsertInst(cur_inst);

}

void RetInstruction::genMachineCode(AsmBuilder* builder)
{
    // example:
	// mov r0, #0
	// add sp, sp, #148
	// vpop {s31}
	// pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	// bx lr

    if(debug5) printf("RetInstruction::genMachineCode\n");
    // TODO
    /* HINT:
    * 1. Generate mov instruction to save return value in r0
    * 2. Restore callee saved registers and sp, fp
    * 3. Generate bx instruction */
    auto cur_block = builder->getBlock();
    MachineInstruction* cur_inst = nullptr;
    // 1. 返回值：Generate mov instruction to save return value in r0
    if (!operands.empty()) 
    {
        if(operands[0]->getType()->isFloat())
        {
            auto dst = new MachineOperand(MachineOperand::REG, 0);//【s0】
            dst->set_isfloat();
            auto src = genMachineOperand(operands[0]);
            if (src->isImm())
            {
                //把浮点立即数先load出来
                auto temp_src = genMachineVReg();
                cur_inst = new LoadMInstruction( cur_block, temp_src, src);
                cur_block->InsertInst(cur_inst);
                src = temp_src;
            }
            //再 vmov 到浮点数寄存器
            cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV,dst, src); 
            cur_inst->set_V();
            cur_block->InsertInst(cur_inst);
        }
        else
        {
            
            auto dst = new MachineOperand(MachineOperand::REG, 0);
            auto src = genMachineOperand(operands[0]);
            cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, src);
            cur_block->InsertInst(cur_inst);
        }
    }

    // 2. Restore callee saved registers and sp, fp
    // example: add sp, sp, #4
    auto cur_func = builder->getFunction();
    auto dst_sp = new MachineOperand(MachineOperand::REG, 13);
    auto size = new MachineOperand(MachineOperand::IMM, cur_func->AllocSpace(0));

   //auto size = new MachineOperand(MachineOperand::IMM, 8);//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

    //注：这里的size大小不对，没有算linearscan的alloc，因此需要在output的时候改size值
    cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, dst_sp, dst_sp, size);
    BinaryMInstruction* t_add = (BinaryMInstruction*)cur_inst;
    t_add->addsp=1;//做标记，在output的地方改size
    cur_block->InsertInst(cur_inst);

    // 函数有 Callee saved 寄存器，我们还需要生成 POP 指令恢复这些寄存器
    //由于此时不知道要 pop 的寄存器，pop 放到 MachineBlock::output

    // 4. bx  生成跳转指令来返回到 Caller
    cur_block->set_hasRet();
    auto lr = new MachineOperand(MachineOperand::REG, 14);
    cur_inst = new BranchMInstruction(cur_block, BranchMInstruction::BX, lr);
    cur_block->InsertInst(cur_inst);

}


void CallInstruction::genMachineCode(AsmBuilder* builder)
{
    if(debug5) printf("CallInstruction::genMachineCode\n");
    auto cur_block = builder->getBlock();
    MachineInstruction* cur_inst = nullptr;
    // 1. 参数传递
    // （ 分别判断 r() 和 s() ）
    std::vector<Operand*> r_operands;
    std::vector<Operand*> s_operands;
    for(int i=1; i<operands.size() ; i++)
    {
        if(operands[i]->getEntry()->getType()->isFloat())
            s_operands.push_back(operands[i]);
        else
            r_operands.push_back(operands[i]);
    }

    // 1.1.1 r()参数在4个以内
    for(int i=0; i<r_operands.size() && i<4; i++)
    {
        // 从左到右，依次为 r0、r1、r2、r3
        auto dst = new MachineOperand(MachineOperand::REG, i);//r0-r3
        auto src = genMachineOperand(r_operands[i]);
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, src);
        cur_block->InsertInst(cur_inst);
    }

    // 1.1.2 r()参数在4个以外
    std::vector<MachineOperand*> op_r_vec;

    if(r_operands.size()>4)
    { 
        for(int j = r_operands.size()-1; j>=4; j--)
        {
            // 从右往左，压栈
            auto src = genMachineOperand(r_operands[j]);
            if(src->isImm())
            {
                auto dst = genMachineVReg();
                cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, src);
                cur_block->InsertInst(cur_inst);
                src=new MachineOperand(*dst);
            }
            op_r_vec.push_back(src);
        }
        std::vector<MachineOperand*> t_vec;
        for(int i=0;i<op_r_vec.size();i++)
        {
            t_vec.push_back(op_r_vec[i]);

            if(t_vec.size()==1) //push里面最多1个
            {
                cur_inst = new StackMInstrcuton(cur_block, StackMInstrcuton::PUSH, t_vec); 
                cur_block->InsertInst(cur_inst);
                t_vec.clear();
            }
        }
        if(!t_vec.empty())
        {
            cur_inst = new StackMInstrcuton(cur_block, StackMInstrcuton::PUSH, t_vec); 
            cur_block->InsertInst(cur_inst);
        }
    }



    // 1.2.1 s()参数在4个以内
    for(int i=0; i<s_operands.size() && i<4; i++)
    {
        // 从左到右，依次为 s0、s1、s2、s3
        auto dst = new MachineOperand(MachineOperand::REG, i);//s0-s3
        dst->set_isfloat();
        auto src = genMachineOperand(s_operands[i]);

        if(src->isImm())
        {
            auto t_dst = genMachineVReg();
            cur_inst = new LoadMInstruction( cur_block, t_dst, src);
            cur_block->InsertInst(cur_inst);
            t_dst = new MachineOperand(*t_dst);
            cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, t_dst);
            cur_inst->set_V();
            cur_block->InsertInst(cur_inst);
        }
        else
        {
            cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, src);
            cur_inst->set_V();
            cur_block->InsertInst(cur_inst);
        }

    }

    // 1.s.2 s()参数在4个以外
    std::vector<MachineOperand*> op_s_vec;


    if(s_operands.size()>4)
    { 
        for(int j = s_operands.size()-1; j>=4; j--)
        {
            // 从右往左，压栈
            auto src = genMachineOperand(s_operands[j]);
            if(src->isImm())
            {
                auto dst = genMachineVReg();
                cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, src);
                cur_inst->set_V();
                cur_block->InsertInst(cur_inst);
                src=new MachineOperand(*dst);
            }
            op_s_vec.push_back(src);
        }
        std::vector<MachineOperand*> t_vec;
        for(int i=0;i<op_s_vec.size();i++)
        {
            t_vec.push_back(op_s_vec[i]);

            if(t_vec.size()==1) //push里面最多1个
            {
                cur_inst = new StackMInstrcuton(cur_block, StackMInstrcuton::PUSH, t_vec); 
                cur_inst->set_V();
                cur_block->InsertInst(cur_inst);
                t_vec.clear();
            }
        }
        if(!t_vec.empty())
        {
            cur_inst = new StackMInstrcuton(cur_block, StackMInstrcuton::PUSH, t_vec); 
            cur_inst->set_V();
            cur_block->InsertInst(cur_inst);
        }
    }


    // 2. bl func
    std::string func_name="";
    if(func->getType()->isFunc())
    {
        func_name = func->toStr().c_str();
        if(func_name.substr(0, 1) == "@")
            func_name = "$f"+func_name;//做个标记，便于在 MachineOperand 中辨认
    }
    auto func_op = new MachineOperand(func_name);
    cur_inst = new BranchMInstruction(cur_block, BranchMInstruction::BL, func_op);
    cur_block->InsertInst(cur_inst);

    // 3. 参数大于4：恢复栈帧，add sp
    if(!op_r_vec.empty() || !op_s_vec.empty())
    {
        auto sp = genMachineReg(13);
        auto size = genMachineImm(op_r_vec.size()*4 + op_s_vec.size()*4);
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, sp, sp, size);
        cur_block->InsertInst(cur_inst);
    }

    // 4. call之后的函数如果有返回值，将该函数的返回值（现在存在r0）mov 到 dst，便于后面的使用

    FunctionType* type = (FunctionType*) (func -> getType());
    if(! (type->getRetType()->isVoid()) )
    {
        auto dst = genMachineOperand(operands[0]);
        auto reg0 = new MachineOperand(MachineOperand::REG, 0);
        if((type->getRetType()->isFloat()) )
            reg0->set_isfloat();
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, reg0);
        if((type->getRetType()->isFloat()) )
            cur_inst->set_V();
        cur_block->InsertInst(cur_inst);
    }

}



void ZextInstruction::genMachineCode(AsmBuilder* builder)
{
    if(debug5) printf("ZextInstruction::genMachineCode\n");
    //已经没用了
    MachineInstruction* cur_inst = nullptr;
    auto cur_block = builder->getBlock();
    auto dst = genMachineOperand(operands[0]);
    auto src = genMachineOperand(operands[1]);
    cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, src);
    cur_block->InsertInst(cur_inst);

}





float2intInstruction::float2intInstruction(Operand* dst, Operand* src, BasicBlock* insert_bb) : Instruction(float2int, insert_bb)
{
    operands.push_back(dst);
    operands.push_back(src);
    dst->setDef(this);
    def_dst = dst;
    src->addUse(this);
}

void float2intInstruction::output() const 
{
    Operand* dst = operands[0];
    Operand* src = operands[1];
    std::string dst_str = dst->toStr();
    std::string src_type_str = src->getType()->toStr();
    std::string src_str = src->toStr();
    std::string dst_type_str = dst->getType()->toStr();
    fprintf(yyout, "  %s = fptosi %s %s to %s\n", dst_str.c_str(), src_type_str.c_str(), src_str.c_str(), dst_type_str.c_str());
}

float2intInstruction::~float2intInstruction() 
{
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
}

void float2intInstruction::genMachineCode(AsmBuilder* builder) 
{
    if(debug5) printf("float2intInstruction::genMachineCode\n");
    MachineInstruction* cur_inst = nullptr;
    auto cur_block = builder->getBlock();

    auto src = genMachineOperand(operands[1]);//src: s()
    src->set_isfloat();
    auto dst = genMachineOperand(operands[0]);//dst: r()

    if (src->isImm()) //浮点数是imm，先拿出来
    {
        // load
        // vmov
        auto m_dst = genMachineVReg();
        m_dst->set_isfloat();

        auto l_dst = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, l_dst, src); // 把浮点数load到 r() 寄存器
        cur_block->InsertInst(cur_inst);

        l_dst = new MachineOperand(*l_dst);
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, m_dst, l_dst); // vmov到 s() 寄存器
        cur_inst->set_V();
        cur_block->InsertInst(cur_inst);
        src = m_dst;
    }
    auto v_dst = genMachineVReg();
    v_dst->set_isfloat();
    cur_inst = new Vcvtf2iMInstruction(cur_block, v_dst, src);//浮点数转为定点数
    cur_block->InsertInst(cur_inst);

    cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, v_dst);
    cur_inst->set_V();
    cur_block->InsertInst(cur_inst);
}





int2floatInstruction::int2floatInstruction(Operand* dst, Operand* src, BasicBlock* insert_bb): Instruction(int2float, insert_bb) 
{
    operands.push_back(dst);
    operands.push_back(src);
    dst->setDef(this);
    def_dst = dst;
    src->addUse(this);
}

void int2floatInstruction::output() const 
{
    Operand* dst = operands[0];
    Operand* src = operands[1];
    std::string dst_str = dst->toStr();
    std::string src_type_str = src->getType()->toStr();
    std::string src_str = src->toStr();
    std::string dst_type_str = dst->getType()->toStr();
    fprintf(yyout, "  %s = sitofp %s %s to %s\n", dst_str.c_str(), src_type_str.c_str(), src_str.c_str(), dst_type_str.c_str());
}


int2floatInstruction::~int2floatInstruction() 
{
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
}


void int2floatInstruction::genMachineCode(AsmBuilder* builder) 
{
    if(debug5) printf("int2floatInstruction::genMachineCode\n");
    MachineInstruction* cur_inst = nullptr;
    auto cur_block = builder->getBlock();
    auto src = genMachineOperand(operands[1]);

    if (src->isImm()) 
    {
        auto l_dst = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, l_dst, src);
        cur_block->InsertInst(cur_inst);
        src =l_dst;
    }

    auto m_dst = genMachineVReg();
    m_dst->set_isfloat();
    cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, m_dst, src); // vmov 到一个 s() 寄存器
    cur_inst->set_V();
    cur_block->InsertInst(cur_inst);
    auto v_src = new MachineOperand(*m_dst);
    auto dst = genMachineOperand(operands[0]);
    dst->set_isfloat();
    cur_inst = new Vcvti2fMInstruction(cur_block,dst, v_src);//定点转浮点
    cur_block->InsertInst(cur_inst);

}


bool debug9 = 0;

// 已经拿到地址，包括第一次使用函数参数声明的数组，或之前拿过地址
GetEleAddrInstruction::GetEleAddrInstruction(Operand* dst,
                               Operand* arr,
                               Operand* idx,
                               BasicBlock* insert_bb,
                               int size)
    : Instruction(GEP, insert_bb) {
    
    this->size = size;
    operands.push_back(dst);
    operands.push_back(arr);
    operands.push_back(idx);
    dst->setDef(this);
    def_dst = dst;
    arr->addUse(this);
    idx->addUse(this);

}
void GetEleAddrInstruction::output() const {

}


//和1st的区别在于不需要拿首地址
void GetEleAddrInstruction::genMachineCode(AsmBuilder* builder)
{
    if(debug9) printf("\n-----------------------\n");

    auto cur_block = builder->getBlock();
    MachineInstruction* cur_inst;
    auto dst = genMachineOperand(operands[0]);
    auto idx = genMachineOperand(operands[2]); //偏移量（相对于数组该维度的首地址）


    // 1. 将偏移量拿到寄存器 r()
    MachineOperand* base = nullptr;
    auto idx1 = genMachineVReg();
    if (idx->isImm()) 
    {
        if (idx->getVal() < 255) 
        {
            if(debug9) printf("【1】mov1\n");
            cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, idx1, idx);
        }
        else
        {
            if(debug9) printf("【1】load1\n");
            cur_inst = new LoadMInstruction(cur_block, idx1, idx);
        }
        idx = new MachineOperand(*idx1);
        cur_block->InsertInst(cur_inst);
    }

    // 2. 将element大小拿到寄存器 r()
    auto size_dst = genMachineVReg();
    if (size > -255 && size < 255) 
    {
        if(debug9) printf("【3】mov3\n");
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, size_dst, genMachineImm(size));
    }
    else
    {
        if(debug9) printf("【3】load4\n");
        cur_inst = new LoadMInstruction(cur_block, size_dst, genMachineImm(size));
    }
    cur_block->InsertInst(cur_inst);



    // 3. 相乘：element的size  *  偏移量（相对于数组该维度的首地址），得到该元素的 offset（字节）
    auto off = genMachineVReg();
    if(debug9) printf("mul1\n");
    cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::MUL, off, idx, size_dst); 
    off = new MachineOperand(*off);
    cur_block->InsertInst(cur_inst);


    // 4. dst = 当前维度的地址（arr[5][4]） = 数组中该维度的首地址(operands[1])(arr[5]的首地址) + 上面乘完了的offset
    auto arr = genMachineOperand(operands[1]);
    if(debug9) printf("【4】add2\n");
    cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, dst, arr, off); 
    cur_block->InsertInst(cur_inst);

}


GetEleAddrInstruction::~GetEleAddrInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
    operands[2]->removeUse(this);
}







// 若此时非数组首元素且已拿到最低维，则不再需要反复拿指针，通过上次的指针+4即可
// e.g. arr[2][3][4]={}，一共需要处理2*3*4个元素，每次处理降维3(维度数)次，每次的第三次降维后需要store，此时不再拿指针，上次指针偏移即可
AddrIncrease4Instruction::AddrIncrease4Instruction(Operand* dst,
                               Operand* arr,
                               Operand* idx,
                               BasicBlock* insert_bb,
                               Operand* init)
    : Instruction(GEP_init, insert_bb) {
    operands.push_back(dst);
    operands.push_back(arr);
    operands.push_back(idx);
    dst->setDef(this);
    def_dst = dst;
    arr->addUse(this);
    idx->addUse(this);
    this->init = init;
}


void AddrIncrease4Instruction::output() const {




}



void AddrIncrease4Instruction::genMachineCode(AsmBuilder* builder) //只在decl里用到,int arr[2][3][4]={}
{
    if(debug9) printf("\n-----------------------\n");

    auto cur_block = builder->getBlock();
    MachineInstruction* cur_inst;
    auto dst = genMachineOperand(operands[0]);

    auto base = genMachineOperand(init);
    if(debug9) printf("【0】add1\n");
    cur_inst = new BinaryMInstruction( cur_block, BinaryMInstruction::ADD, dst, base, genMachineImm(4));
    cur_block->InsertInst(cur_inst);

}


AddrIncrease4Instruction::~AddrIncrease4Instruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
    operands[2]->removeUse(this);
}

// 第一次拿数组且该数组是普通声明的，就要从全局变量/栈里找首地址。如果是函数参数声明的，已经有地址了，不需要再拿了
Get1stEleAddrInstruction::Get1stEleAddrInstruction(Operand* dst,
                               Operand* arr,
                               Operand* idx,
                               BasicBlock* insert_bb,
                               bool param_first)
    : Instruction(GEP_f, insert_bb) {
    operands.push_back(dst);
    operands.push_back(arr);
    operands.push_back(idx);
    dst->setDef(this);
    def_dst = dst;
    arr->addUse(this);
    idx->addUse(this);

}
void Get1stEleAddrInstruction::output() const {}

void Get1stEleAddrInstruction::genMachineCode(AsmBuilder* builder)
{
    if(debug9) printf("\n-----------------------\n");

    //第一维需要找到在栈里的位置，并且将位置给dst，方便后面的元素


    // example:
    // int arr[7][3][4];	
	// arr[5][2][3]=9;

	// mov r4, #5
	// mov r6, #48
	// mul r7, r4, r6
	// ldr r5, =-336
	// add r4, r5, r7
	// add r5, fp, r4


    auto cur_block = builder->getBlock();
    MachineInstruction* cur_inst;
    auto dst = genMachineOperand(operands[0]);
    auto idx = genMachineOperand(operands[2]);

    MachineOperand* base = nullptr;
    int size;



    // 1. 将偏移量拿到寄存器 r()
    auto idx1 = genMachineVReg();
    if (idx->isImm()) 
    {
        if (idx->getVal() < 255) 
        {
            if(debug9) printf("【1】mov1\n");
            cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, idx1, idx);
        }
        else
        {
            if(debug9) printf("【1】load1\n");
            cur_inst = new LoadMInstruction(cur_block, idx1, idx);
        }
        idx = new MachineOperand(*idx1);
        cur_block->InsertInst(cur_inst);
    }



    // 2. 将element大小拿到寄存器 r()    2*3=6
    ArrayType* type = (ArrayType*)(((PointerType*)(operands[1]->getType()))->getValueType());
    size = type->getElementType()->getSize() / 8;
    auto size1 = genMachineVReg();
    if (size > -255 && size < 255) 
    {
        if(debug9) printf("【3】mov3\n");
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, size1, genMachineImm(size));
    }
    else
    {
        if(debug9) printf("【3】load4\n");
        cur_inst = new LoadMInstruction(cur_block, size1, genMachineImm(size));
    }
    cur_block->InsertInst(cur_inst);



    // 3. 相乘：element的size  *  偏移量（相对于数组首地址），得到该维度的 offset（字节）
    auto off = genMachineVReg();
    if(debug9) printf("mul1\n");
    cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::MUL, off, idx, size1);
    off = new MachineOperand(*off);
    cur_block->InsertInst(cur_inst);



    if (operands[1]->getEntry()->isVariable() && ((IdentifierSymbolEntry*)(operands[1]->getEntry()))->isGlobal()) 
    {
        // (global) 4. 得到 base = 全局变量的地址
        // load r5, addr_a
        base = genMachineVReg();
        if(debug9) printf("【2】load2\n");
        auto src = genMachineOperand(operands[1]);
        cur_inst = new LoadMInstruction(cur_block, base, src);
        cur_block->InsertInst(cur_inst);


        // (global) 5. dst = 当前维度的地址 = 数组首地址(全局变量的地址) + 上面乘完了的offset
        if(debug9) printf("【4】add3\n");
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, dst, base, off);
        cur_block->InsertInst(cur_inst);


    } 
    else 
    {
        // (local) 4.1 得到 局部变量 在栈里面的offset
        base = genMachineVReg();
        int offset = ((TemporarySymbolEntry*)(operands[1]->getEntry())) ->getOffset();
        if (offset > -255 && offset < 255) 
        {
            if(debug9) printf("【2】mov2\n");
            cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, base, genMachineImm(offset));
        } else 
        {
            if(debug9) printf("【2】load3\n");
            cur_inst = new LoadMInstruction(cur_block, base, genMachineImm(offset));
        }
        cur_block->InsertInst(cur_inst);



        // (local) 4.2 局部变量首地址 = fp + 栈里面的offset
        auto addr = genMachineVReg();
        auto fp = genMachineReg(11);
        if(debug9) printf("【4】add3\n");
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, addr, fp, base);
        cur_block->InsertInst(cur_inst);


        // (local) 5. dst = 当前维度的地址 = 数组首地址(局部变量的地址) + 上面乘完了的offset
        if(debug9) printf("【5】add4\n");
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD, dst, addr, off);
        cur_block->InsertInst(cur_inst);

    }
    



}


Get1stEleAddrInstruction::~Get1stEleAddrInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
    operands[2]->removeUse(this);
}



float2boolInstruction::float2boolInstruction(Operand* dst, Operand* src, BasicBlock* insert_bb) : Instruction(float2int, insert_bb)
{
    operands.push_back(dst);
    operands.push_back(src);
    dst->setDef(this);
    def_dst = dst;
    src->addUse(this);
}

void float2boolInstruction::output() const 
{
    //
}

float2boolInstruction::~float2boolInstruction() 
{
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
}

void float2boolInstruction::genMachineCode(AsmBuilder* builder) 
{
    if(debug5) printf("float2boolInstruction::genMachineCode\n");
    MachineInstruction* cur_inst = nullptr;
    auto cur_block = builder->getBlock();

    auto src = genMachineOperand(operands[1]);
    src->set_isfloat();
    auto dst = genMachineOperand(operands[0]);

    if (src->isImm()) 
    {
        auto m_dst = genMachineVReg();
        m_dst->set_isfloat();

        auto l_dst = genMachineVReg();
        cur_inst = new LoadMInstruction(cur_block, l_dst, src); // 把浮点数load到 r() 寄存器
        cur_block->InsertInst(cur_inst);

        l_dst = new MachineOperand(*l_dst);
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, m_dst, l_dst); // vmov到 s() 寄存器
        cur_inst->set_V();
        cur_block->InsertInst(cur_inst);
        src = m_dst;
    }


    auto tmp1 = genMachineVReg();
    cur_inst = new LoadMInstruction(cur_block,tmp1,genMachineImm(0));
    cur_block->InsertInst(cur_inst);


    auto tmp2 = genMachineVReg();
    tmp2->set_isfloat();

    cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, tmp2, tmp1);
    cur_inst->set_V();
    cur_block->InsertInst(cur_inst);


///////////////////////////


    auto v_dst = genMachineVReg();
    v_dst->set_isfloat();
    cur_inst = new Vcvtf2iMInstruction(cur_block, v_dst, src);
    cur_block->InsertInst(cur_inst);

    cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, dst, v_dst);
    cur_inst->set_V();
    cur_block->InsertInst(cur_inst);

}