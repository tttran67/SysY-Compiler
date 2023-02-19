#include "MachineCode.h"
#include "Type.h"
extern FILE* yyout;

extern SymbolTable *globals;

int MachineBlock::label = 0;

MachineOperand::MachineOperand(int tp, int val)
{
    this->type = tp;
    this->isfloat=0;
    this->floatval = 0;
    if(tp == MachineOperand::IMM)
        this->val = val;
    else 
        this->reg_no = val;
}

MachineOperand::MachineOperand(int tp, float floatval)
{
    this->type = tp;
    this->isfloat=1;
    if(tp == MachineOperand::IMM)
        this->floatval = floatval;
    else 
    {
        //this->reg_no = val;
    }
        
}

MachineOperand::MachineOperand(std::string label)
{
    this->type = MachineOperand::LABEL;
    this->floatval = 0;
    this->isfloat=0;
    this->label = label;
}

bool MachineOperand::operator==(const MachineOperand&a) const
{
    if (this->type != a.type || this->isfloat != a.isfloat)
        return false;
    if (this->type == IMM && !this->isfloat)
        return this->val == a.val;
    if (this->type == IMM && this->isfloat)
        return this->floatval == a.floatval;
    if(this->type == LABEL)
        return this->label == a.label;
    return this->reg_no == a.reg_no;
}

bool MachineOperand::operator<(const MachineOperand&a) const
{
    if(this->type == a.type)
    {
        if(this->type == IMM)
        {
            float val1 = this->isfloat ? this->floatval : this->val;
            float val2 = a.isfloat ? a.floatval : a.val;
            return val1 < val2;
        }
        return this->reg_no < a.reg_no;
    }
    return this->type < a.type;

    if (this->type != a.type)
        return false;
    if (this->type == IMM)
        return this->val == a.val;
    return this->reg_no == a.reg_no;
}

void MachineOperand::PrintReg()
{
    if(isfloat)
    {
        fprintf(yyout, "s%d", reg_no);
        return;
    }
    
    switch (reg_no)
    {
    case 11:
        fprintf(yyout, "fp");
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

void MachineOperand::output() 
{
    /* HINT：print operand
    * Example:
    * immediate num 1 -> print #1;
    * register 1 -> print r1;
    * lable addr_a -> print addr_a; */

    if(this->isfloat && this->type==IMM)
    {
        uint32_t f_temp = reinterpret_cast<uint32_t&>(this->floatval);
        fprintf(yyout, "#%u", f_temp);
        return;
    }

    switch (this->type)
    {
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
        if (this->label.substr(0, 2) == ".L")
            fprintf(yyout, "%s", this->label.c_str());
        else if(label.substr(0, 3) == "$f@")
            fprintf(yyout, "%s", this->label.c_str() + 3);//函数
        else if(label.substr(0, 1) == "@")
            fprintf(yyout, "addr_%s_%d", this->label.c_str() + 1 ,parent->getParent()->getparent()->getparent()->counter);//全局变量
    default:
        break;
    }
}

void MachineInstruction::PrintCond()
{
    // TODO
    switch (cond) {
    case LT:
        fprintf(yyout, "lt");// <
        break;
    case LE:
        fprintf(yyout, "le");// <=
        break;
    case GT:
        fprintf(yyout, "gt");// >
        break;
    case GE:
        fprintf(yyout, "ge");// >=
        break;
    case EQ:
        fprintf(yyout, "eq");// =
        break;
    case NE:
        fprintf(yyout, "ne");// !=
        break;
    default:
        break;
    }
}

BinaryMInstruction::BinaryMInstruction(
    MachineBlock* p, int op, 
    MachineOperand* dst, MachineOperand* src1, MachineOperand* src2, 
    int cond)
{
    addsp=0;
    is_V=0;
    this->parent = p;
    this->type = MachineInstruction::BINARY;
    this->op = op;
    this->cond = cond;
    this->def_list.push_back(dst);
    def_m_dst = dst;
    this->use_list.push_back(src1);
    this->use_list.push_back(src2);
    dst->setParent(this);
    src1->setParent(this);
    src2->setParent(this);
}

void BinaryMInstruction::output() 
{
    // TODO: 
    // Complete other instructions

    if(addsp)
    {
        int size = parent->getparent()->AllocSpace(0);

        if(size>400 || size<-400)
        {
            //需要加一条load
            fprintf(yyout, "\tldr r2, =%d\n",size);
            fprintf(yyout, "\tadd sp, sp, r2\n");
        }
        else
        {
            fprintf(yyout, "\tadd ");
            this->PrintCond();
            this->def_list[0]->output();
            fprintf(yyout, ", ");
            this->use_list[0]->output();
            fprintf(yyout, ", #%d",size);
            fprintf(yyout, "\n");
        }
        return;
    }

    switch (this->op)
    {
    case BinaryMInstruction::ADD:
        if(this->is_V)
            fprintf(yyout, "\tvadd.f32 ");
        else
            fprintf(yyout, "\tadd ");
        this->PrintCond();
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[1]->output();
        fprintf(yyout, "\n");
        break;
    case BinaryMInstruction::SUB:
        if(this->is_V)
            fprintf(yyout, "\tvsub.f32 ");
        else
            fprintf(yyout, "\tsub ");
        this->PrintCond();
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[1]->output();
        fprintf(yyout, "\n");
        break;
    case BinaryMInstruction::MUL:
        if(this->is_V)
            fprintf(yyout, "\tvmul.f32 ");
        else
            fprintf(yyout, "\tmul ");
        this->PrintCond();
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[1]->output();
        fprintf(yyout, "\n");
        break;
    case BinaryMInstruction::DIV:
        if(this->is_V)
            fprintf(yyout, "\tvdiv.f32 ");
        else
            fprintf(yyout, "\tsdiv ");
        this->PrintCond();
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[1]->output();
        fprintf(yyout, "\n");
        break;

    //and和or都不会用到，因为在binaryexpr处就被处理了
    case BinaryMInstruction::AND:
        fprintf(yyout, "\tand ");
        this->PrintCond();
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[1]->output();
        fprintf(yyout, "\n");
        break;
    case BinaryMInstruction::OR:
        fprintf(yyout, "\torr ");
        this->PrintCond();
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

LoadMInstruction::LoadMInstruction(MachineBlock* p,
    MachineOperand* dst, MachineOperand* src1, MachineOperand* src2,
    int cond)
{
    is_V=0;
    this->parent = p;
    this->type = MachineInstruction::LOAD;
    this->op = -1;
    this->cond = cond;
    this->def_list.push_back(dst);
    def_m_dst = dst;
    this->use_list.push_back(src1);
    if (src2)
        this->use_list.push_back(src2);
    dst->setParent(this);
    src1->setParent(this);
    if (src2)
        src2->setParent(this);
}

void LoadMInstruction::output()
{

    if(this->use_list[0]->isImm() && this->use_list[0]->get_isfloat())
    {
        // Load immediate num
        float f_tem = use_list[0]->getfloatVal();
        uint32_t floatval = reinterpret_cast<uint32_t&>(f_tem);
        //拆成两部分
        uint32_t floatval_up = floatval>>16;
        uint32_t floatval_down = (floatval<<16)>>16;

        fprintf(yyout, "\tmov ");
        this->def_list[0]->output();
        fprintf(yyout, ", #%d\n", floatval_down);

        fprintf(yyout, "\tmovt ");
        this->def_list[0]->output();
        fprintf(yyout, ", #%d\n", floatval_up); 
        return;
    }

    if(this->is_V)
        fprintf(yyout, "\tvldr.32 ");
    else
        fprintf(yyout, "\tldr ");
    this->def_list[0]->output();
    fprintf(yyout, ", ");

    // Load immediate num, eg: ldr r1, =8
    if(this->use_list[0]->isImm())
    {
        fprintf(yyout, "=%d\n", this->use_list[0]->getVal());
        return;
    }

    // Load address
    if(this->use_list[0]->isReg()||this->use_list[0]->isVReg())
        fprintf(yyout, "[");

    this->use_list[0]->output();
    if( this->use_list.size() > 1 )
    {
        fprintf(yyout, ", ");
        this->use_list[1]->output();
    }

    if(this->use_list[0]->isReg()||this->use_list[0]->isVReg())
        fprintf(yyout, "]");
    fprintf(yyout, "\n");
}

StoreMInstruction::StoreMInstruction(MachineBlock* p,
    MachineOperand* src1, MachineOperand* src2, MachineOperand* src3, 
    int cond)
{
    // TODO
    //仿照load完成
    off=0;
    has_ldr=0;
    is_V=0;
    this->parent = p;
    this->type = MachineInstruction::STORE;
    this->op = -1;
    this->cond = cond;
    
    //与load不同，store没有dst，都是use
    this->use_list.push_back(src1);
    this->use_list.push_back(src2);
    if (src3)
        this->use_list.push_back(src3);
    src1->setParent(this);
    
    src2->setParent(this);
    
    if (src3)
        src3->setParent(this);

    
}

void StoreMInstruction::output()
{
    // TODO
    //仿照load完成
    if(this->has_ldr)
    {
        if(this->is_V)
            fprintf(yyout, "\tvldr.32 ");
        else
            fprintf(yyout, "\tldr ");
        
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        int off_t = 4 * (this->getParent()->getparent()->get_saved_regs().size() + this->getParent()->getparent()->get_saved_s_regs().size())+ 8;
        fprintf(yyout, "[fp, #%d]\n", this->off*4 + off_t);
    }


    if(this->is_V)
        fprintf(yyout, "\tvstr.32 ");
    else
        fprintf(yyout, "\tstr ");
    this->use_list[0]->output();
    fprintf(yyout, ", ");

    // Store immediate num
    //在StoreInstruction::genMachineCode处理，此处不用打印

    // Store address
    if(this->use_list[1]->isReg()||this->use_list[1]->isVReg())
        fprintf(yyout, "[");

    this->use_list[1]->output();
    if( this->use_list.size() > 2 )
    {
        fprintf(yyout, ", ");
        this->use_list[2]->output();
    }

    if(this->use_list[1]->isReg()||this->use_list[1]->isVReg())
        fprintf(yyout, "]");
    fprintf(yyout, "\n");
}

MovMInstruction::MovMInstruction(MachineBlock* p, int op, 
    MachineOperand* dst, MachineOperand* src,
    int cond)
{
    // TODO
    is_V=0;
    this->parent = p;
    this->type = MachineInstruction::MOV;
    this->op = op;
    this->cond = cond;
    this->def_list.push_back(dst);
    def_m_dst = dst;
    this->use_list.push_back(src);
    dst->setParent(this);
    src->setParent(this);
}

void MovMInstruction::output() 
{
    // TODO
    if(is_LSL)
    {
        fprintf(yyout, "\tmov");
        PrintCond();
        fprintf(yyout, " ");
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", LSL#%d\n", LSL_num);
        return ;
    }
    if(this->is_V && this->use_list[0]->isImm())
    {
        //float
        float f_tem = use_list[0]->getfloatVal();
        uint32_t floatval = reinterpret_cast<uint32_t&>(f_tem);
        uint32_t floatval_up = floatval>>16;
        uint32_t floatval_down = (floatval<<16)>>16;

        fprintf(yyout, "\tmov ");
        this->def_list[0]->output();
        fprintf(yyout, ", #%d\n", floatval_down);

        fprintf(yyout, "\tmovt ");
        this->def_list[0]->output();
        fprintf(yyout, ", #%d\n", floatval_up);   
        return;
    }

    if(this->is_V)
        fprintf(yyout, "\tvmov");
    else
        fprintf(yyout, "\tmov");
    PrintCond();
    fprintf(yyout, " ");
    this->def_list[0]->output();
    fprintf(yyout, ", ");
    this->use_list[0]->output();
    fprintf(yyout, "\n");
}

BranchMInstruction::BranchMInstruction(MachineBlock* p, int op, 
    MachineOperand* dst, 
    int cond)
{
    // TODO
    is_V=0;
    this->parent = p;
    this->type = MachineInstruction::BRANCH;
    this->op = op;
    this->cond = cond;
    this->use_list.push_back(dst);
    dst->setParent(this);
}

void BranchMInstruction::output()
{
    // TODO
    switch (op) 
    {
    case B:
        fprintf(yyout, "\tb");
        break;
    case BX:
        fprintf(yyout, "\tbx");
        break;
    case BL:
        fprintf(yyout, "\tbl");
        break;
    }
    PrintCond();
    fprintf(yyout, " ");
    this->use_list[0]->output();
    fprintf(yyout, "\n");
}

CmpMInstruction::CmpMInstruction(MachineBlock* p, 
    MachineOperand* src1, MachineOperand* src2, 
    int cond)
{
    // TODO
    is_V=0;
    this->parent = p;
    this->type = MachineInstruction::CMP;
    this->op = -1;
    this->cond = cond;
    this->use_list.push_back(src1);
    this->use_list.push_back(src2);
    src1->setParent(this);
    src2->setParent(this);
}

void CmpMInstruction::output()
{
    // TODO
    // Jsut for reg alloca test
    // delete it after test
    if(this->is_V)
        fprintf(yyout, "\tvcmp.f32 ");
    else
        fprintf(yyout, "\tcmp ");
    this->use_list[0]->output();
    fprintf(yyout, ", ");
    this->use_list[1]->output();
    fprintf(yyout, "\n");

    if(this->is_V)
        fprintf(yyout, "\tvmrs APSR_nzcv, FPSCR\n");
}

StackMInstrcuton::StackMInstrcuton(MachineBlock* p, int op, 
    std::vector<MachineOperand*> src_vec,
    int cond)
{
    // TODO
    this->parent = p;
    this->type = MachineInstruction::STACK;
    this->op = op;
    this->cond = cond;

    for(int i=0;i<src_vec.size();i++)
    {
        this->use_list.push_back(src_vec[i]);
        src_vec[i]->setParent(this);
    }
}

void StackMInstrcuton::output()
{
    // TODO
    fprintf(yyout, "\t");
    switch(op)
    {
    case PUSH:
        if(this->is_V)
            fprintf(yyout, "vpush");
        else
            fprintf(yyout, "push");
        break;
    case POP:
        if(this->is_V)
            fprintf(yyout, "vpop");
        else
            fprintf(yyout, "pop");
        break;
    }
    fprintf(yyout, " {");

    for(unsigned int i=0;i<use_list.size();i++)
    {
        if(i>0)
            fprintf(yyout, ", ");
        use_list[i]->output();
    }
    fprintf(yyout, "}\n");
}



Vcvti2fMInstruction::Vcvti2fMInstruction(MachineBlock* p,
    MachineOperand* dst, MachineOperand* src,
    int cond)
{
    this->parent = p;
    this->type = MachineInstruction::VCVTI2F;
    this->op = -1;
    this->cond = cond;
    this->def_list.push_back(dst);
    def_m_dst = dst;
    this->use_list.push_back(src);
    dst->setParent(this);
    src->setParent(this);
}


void Vcvti2fMInstruction::output()
{
    fprintf(yyout, "\tvcvt.f32.s32 ");
    PrintCond();
    fprintf(yyout, " ");
    this->def_list[0]->output();
    fprintf(yyout, ", ");
    this->use_list[0]->output();
    fprintf(yyout, "\n");

}

Vcvtf2iMInstruction::Vcvtf2iMInstruction(MachineBlock* p, 
    MachineOperand* dst, MachineOperand* src,
    int cond)
{
    this->parent = p;
    this->type = MachineInstruction::VCVTF2I;
    this->op = -1;
    this->cond = cond;
    this->def_list.push_back(dst);
    this->use_list.push_back(src);
    dst->setParent(this);
    src->setParent(this);
}


void Vcvtf2iMInstruction::output()
{
    fprintf(yyout, "\tvcvt.s32.f32 ");
    PrintCond();
    fprintf(yyout, " ");
    this->def_list[0]->output();
    fprintf(yyout, ", ");
    this->use_list[0]->output();
    fprintf(yyout, "\n");

}




MachineFunction::MachineFunction(MachineUnit* p, SymbolEntry* sym_ptr) 
{ 
    this->parent = p; 
    this->sym_ptr = sym_ptr; 
    this->stack_size = 0;
};

void MachineBlock::output()
{
    bool t_flag=0;
    int t_count=0;
    fprintf(yyout, ".L%d:\n", this->no);
    for(auto iter : inst_list)
    {
        if(! (iter->isbx()&&iter->getParent()->get_hasRet()))
        {
            iter->output();


            t_count++;
            if (t_count % 500 == 0) {
                fprintf(yyout, "\tb .B%d\n", label);
                fprintf(yyout, ".LTORG\n");

                //print bridge label
                std::map<std::string, SymbolEntry*> global_table = globals->getmap();
                for (auto iter = global_table.begin(); iter != global_table.end(); ++iter) 
                {
                    SymbolEntry* se_t = iter->second;
                    if(se_t->getType()->isFunc())
                        continue;
                    IdentifierSymbolEntry* se = (IdentifierSymbolEntry*)se_t;
                    fprintf(yyout, "addr_%s_%d:\n", se->toStr().c_str()+1,parent->getparent()->counter);
                    fprintf(yyout, "\t.word %s\n", se->toStr().c_str()+1);
                }
                parent->getparent()->counter++;

                fprintf(yyout, ".B%d:\n", label++);
            }



            continue;
        }
         
        std::set<int> saved_s_regs = parent->get_saved_s_regs();
        if(!saved_s_regs.empty())
        {
            fprintf(yyout, "\tvpop {");
            
            std::vector<MachineOperand*> t_regs;

            for (auto it = saved_s_regs.begin(); it != saved_s_regs.end(); it++) 
            {
                auto t_reg = new MachineOperand(MachineOperand::REG, *it);
                t_reg->set_isfloat();
                t_regs.push_back(t_reg);
            }

            for(int i=0;i<t_regs.size();i++)
            {
                if(i!=0)
                    fprintf(yyout, ", ");
                t_regs[i]->output();
            }
            fprintf(yyout, "}\n");
        }

        // example:	pop {r4, fp, lr}
        fprintf(yyout, "\tpop {");
        std::set<int> saved_regs = parent->get_saved_regs();
        for (auto it = saved_regs.begin(); it != saved_regs.end(); it++) 
        {
            auto reg = new MachineOperand(MachineOperand::REG, *it);
            reg->output();
            fprintf(yyout, ", ");
        }
        fprintf(yyout, "fp, lr}\n");
        // example: bx lr
        fprintf(yyout, "\tbx lr\n\n");
    }
}








std::set<int> MachineFunction::get_saved_regs() 
{
    return saved_regs;

};





std::set<int> MachineFunction::get_saved_s_regs() 
{

    return saved_s_regs;

}


void MachineFunction::output()
{

    const char *func_name = this->sym_ptr->toStr().c_str() + 1;

    fprintf(yyout, "\t.global %s\n", this->sym_ptr->toStr().c_str() + 1);
    fprintf(yyout, "\t.type %s , %%function\n", this->sym_ptr->toStr().c_str() + 1);
    fprintf(yyout, "%s:\n", this->sym_ptr->toStr().c_str() + 1);

    // TODO
    /* Hint:
    *  1. Save fp
    *  2. fp = sp
    *  3. Save callee saved register
    *  4. Allocate stack space for local variable */
    
    // Traverse all the block in block_list to print assembly code.
 
    // 1. Save callee saved register
    // example: push { r4, r5, 
    fprintf(yyout, "\tpush {");

    std::set<int> t_saved_regs = get_saved_regs();

    for (auto it = t_saved_regs.begin(); it != t_saved_regs.end(); it++) 
    {
        auto reg = new MachineOperand(MachineOperand::REG, *it);
        reg->output();
        fprintf(yyout, ", ");
    }

    // 2. Save fp
    // example: push { r4, r5, fp, lr}
    fprintf(yyout, "fp, lr}\n");


    std::set<int> saved_s_regs = get_saved_s_regs();
    if(!saved_s_regs.empty())
    {
        fprintf(yyout, "\tvpush {");
        std::set<int> saved_s_regs = get_saved_s_regs();
        std::vector<MachineOperand*> t_regs;

        for (auto it = saved_s_regs.begin(); it != saved_s_regs.end(); it++) 
        {
            auto t_reg = new MachineOperand(MachineOperand::REG, *it);
            t_reg->set_isfloat();
            t_regs.push_back(t_reg);
        }

        for(int i=0;i<t_regs.size();i++)
        {
            if(i!=0)
                fprintf(yyout, ", ");
            t_regs[i]->output();
        }
        fprintf(yyout, "}\n");
    }


    // 3. fp = sp
    fprintf(yyout, "\tmov fp, sp\n");

    // 4. Allocate stack space for local variable 
    if(stack_size<-400 || stack_size > 400)
    {
        //需要先load（此时拿一个r4）
        fprintf(yyout, "\tldr r4, =%d\n", stack_size);
        fprintf(yyout, "\tsub sp, sp, r4\n");
    }
    else
        fprintf(yyout, "\tsub sp, sp, #%d\n", stack_size);


    int t_counter=0;
    for(auto iter : block_list)
    {
        iter->output();
        t_counter += (iter->getInsts()).size();
        if(t_counter > 150){
            fprintf(yyout, "\tb .F%d\n", parent->counter);
            fprintf(yyout, ".LTORG\n");


            //print bridge label
            std::map<std::string, SymbolEntry*> global_table = globals->getmap();
            for (auto iter = global_table.begin(); iter != global_table.end(); ++iter) 
            {
                SymbolEntry* se_t = iter->second;
                if(se_t->getType()->isFunc())
                    continue;
                IdentifierSymbolEntry* se = (IdentifierSymbolEntry*)se_t;
                fprintf(yyout, "addr_%s_%d:\n", se->toStr().c_str()+1,parent->counter);
                fprintf(yyout, "\t.word %s\n", se->toStr().c_str()+1);
            }
            parent->counter++;

            fprintf(yyout, ".F%d:\n", parent->counter-1);
            t_counter = 0;
        }

    }


}

void MachineUnit::PrintGlobalDecl()
{
    // TODO:
    // You need to print global variable/const declarition code;

    std::map<std::string, SymbolEntry*> global_table = globals->getmap();

    bool data_output=1;

    for (auto iter = global_table.begin(); iter != global_table.end(); ++iter) 
    {
        SymbolEntry* se = iter->second;
        if(se->getType()->isFunc())
            continue;

        if(data_output)
        {
            fprintf(yyout, "\t.data\n");
            data_output=0;
        }


        if(se->getType()->isArray())
        {
            IdentifierSymbolEntry* se_t = (IdentifierSymbolEntry*)se;

            if(se_t->getArrayValue() || se_t->getfloatArrayValue())
            {}//后面处理
            else
            {
                fprintf(yyout, "\t.comm %s, %d, 4\n", se->toStr().c_str()+1, se->getType()->getSize() / 8);
                continue;
            }
        }

        fprintf(yyout, "\t.global %s\n", se->toStr().c_str() + 1);
        fprintf(yyout, "\t.align 4\n");
        fprintf(yyout,"\t.size %s, %d\n", se->toStr().c_str() + 1, se->getType()->getSize()/8);
        fprintf(yyout,"%s:\n", se->toStr().c_str() + 1);
        if(se->getType()->isInt()) 
        {
            IdentifierSymbolEntry* se_t = (IdentifierSymbolEntry*)se;
            fprintf(yyout, "\t.word %d\n", int(se_t->getValue()));
        } 
        if(se->getType()->isFloat())
        {
            IdentifierSymbolEntry* se_t = (IdentifierSymbolEntry*)se;

            float floatvalue = (float)(se_t->getfloatValue());
            uint32_t f_tmp = reinterpret_cast<uint32_t&>(floatvalue);
            fprintf(yyout, "\t.word %u\n", f_tmp);
        }
        if(se->getType()->isArray())
        {
            int n = se->getType()->getSize() / 32;
            IdentifierSymbolEntry* se_t = (IdentifierSymbolEntry*)se;

            if(se_t->getArrayValue() || se_t->getfloatArrayValue())
            {
                int* intarr = se_t->getArrayValue();
                for (int i = 0; i < n; i++) 
                {
                    fprintf(yyout, "\t.word %d\n", intarr[i]); //浮点数组问题【】
                }
            }

        }

    }

}

void MachineUnit::output()
{
    // TODO
    /* Hint:
    * 1. You need to print global variable/const declarition code;
    * 2. Traverse all the function in func_list to print assembly code;
    * 3. Don't forget print bridge label at the end of assembly code!! */
    fprintf(yyout, "\t.arch armv8-a\n");
    fprintf(yyout, "\t.arch_extension crc\n");
    //fprintf(yyout, "\t.fpu vfpv3-d16\n");
    fprintf(yyout, "\t.arm\n");
    PrintGlobalDecl();
    fprintf(yyout, "\t.text\n");
    counter=0;

    for(auto iter : func_list)
    {
        iter->output();
    }

    //print bridge label
    std::map<std::string, SymbolEntry*> global_table = globals->getmap();
    for (auto iter = global_table.begin(); iter != global_table.end(); ++iter) 
    {
        SymbolEntry* se_t = iter->second;
        if(se_t->getType()->isFunc())
            continue;
        IdentifierSymbolEntry* se = (IdentifierSymbolEntry*)se_t;
        fprintf(yyout, "addr_%s_%d:\n", se->toStr().c_str()+1,counter);
        fprintf(yyout, "\t.word %s\n", se->toStr().c_str()+1);
    }

}


