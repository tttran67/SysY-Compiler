#include <algorithm>
#include "LinearScan.h"
#include "MachineCode.h"
#include "LiveVariableAnalysis.h"
bool debug6 = 0;
LinearScan::LinearScan(MachineUnit *unit)
{
    if(debug6) printf("LinearScan::LinearScan.\n");
    this->unit = unit;
    for (int i = 4; i < 11; i++)
        regs.push_back(i);
}

void LinearScan::allocateRegisters()
{
    if(debug6) printf("LinearScan::allocateRegisters.\n");
    for (auto &f : unit->getFuncs())
    {
        func = f;
        bool success;
        success = false;
        while (!success)        // repeat until all vregs can be mapped
        {
            computeLiveIntervals();
            success = linearScanRegisterAllocation();
            if (success)        // all vregs can be mapped to real regs
                modifyCode();
            else                // spill vregs that can't be mapped to real regs
                genSpillCode();
        }
    }
}

void LinearScan::makeDuChains()
{
    if(debug6) printf("LinearScan::makeDuChains.\n");
    LiveVariableAnalysis lva;
    lva.pass(func);
    du_chains.clear();
    int i = 0;
    std::map<MachineOperand, std::set<MachineOperand *>> liveVar;
    for (auto &bb : func->getBlocks())
    {
        liveVar.clear();
        for (auto &t : bb->getLiveOut())
        {
            if(!t->get_isfloat())
                liveVar[*t].insert(t);
        }
            
        int no;
        no = i = bb->getInsts().size() + i;
        for (auto inst = bb->getInsts().rbegin(); inst != bb->getInsts().rend(); inst++)
        {
            (*inst)->setNo(no--);
            for (auto &def : (*inst)->getDef())
            {
                if (def->isVReg() && !def->get_isfloat())
                {
                    auto &uses = liveVar[*def];
                    du_chains[def].insert(uses.begin(), uses.end());
                    auto &kill = lva.getAllUses()[*def];
                    std::set<MachineOperand *> res;
                    set_difference(uses.begin(), uses.end(), kill.begin(), kill.end(), inserter(res, res.end()));
                    liveVar[*def] = res;
                }
            }
            for (auto &use : (*inst)->getUse())
            {
                if (use->isVReg() && !use->get_isfloat())
                    liveVar[*use].insert(use);
            }
        }
    }
}

void LinearScan::computeLiveIntervals()
{
    if(debug6) printf("LinearScan::computeLiveIntervals.\n");
    makeDuChains();
    intervals.clear();
    for (auto &du_chain : du_chains)
    {
        int t = -1;
        for (auto &use : du_chain.second)
            t = std::max(t, use->getParent()->getNo());
        Interval *interval = new Interval({du_chain.first->getParent()->getNo(), t, false, 0, 0, {du_chain.first}, du_chain.second});
        intervals.push_back(interval);
    }
    for (auto& interval : intervals) {
        auto uses = interval->uses;
        auto begin = interval->start;
        auto end = interval->end;
        for (auto block : func->getBlocks()) {
            auto liveIn = block->getLiveIn();
            auto liveOut = block->getLiveOut();
            bool in = false;
            bool out = false;
            for (auto use : uses)
                if (liveIn.count(use)) {
                    in = true;
                    break;
                }
            for (auto use : uses)
                if (liveOut.count(use)) {
                    out = true;
                    break;
                }
            if (in && out) {
                begin = std::min(begin, (*(block->begin()))->getNo());
                end = std::max(end, (*(block->rbegin()))->getNo());
            } else if (!in && out) {
                for (auto i : block->getInsts())
                    if (i->getDef().size() > 0 &&
                        i->getDef()[0] == *(uses.begin())) {
                        begin = std::min(begin, i->getNo());
                        break;
                    }
                end = std::max(end, (*(block->rbegin()))->getNo());
            } else if (in && !out) {
                begin = std::min(begin, (*(block->begin()))->getNo());
                int temp = 0;
                for (auto use : uses)
                    if (use->getParent()->getParent() == block)
                        temp = std::max(temp, use->getParent()->getNo());
                end = std::max(temp, end);
            }
        }
        interval->start = begin;
        interval->end = end;
    }
    bool change;
    change = true;
    while (change)// while(??????IN??????????????????)
    {
        change = false;
        std::vector<Interval *> t(intervals.begin(), intervals.end());
        for (size_t i = 0; i < t.size(); i++)// for(???EXIT????????????????????????B)
            for (size_t j = i + 1; j < t.size(); j++)// for s ??? B ?????????
            {
                Interval *w1 = t[i];
                Interval *w2 = t[j];
                if (**w1->defs.begin() == **w2->defs.begin())
                {
                    std::set<MachineOperand *> temp;
                    set_intersection(w1->uses.begin(), w1->uses.end(), w2->uses.begin(), w2->uses.end(), inserter(temp, temp.end()));
                    if (!temp.empty())
                    {
                        change = true;
                        w1->defs.insert(w2->defs.begin(), w2->defs.end());
                        w1->uses.insert(w2->uses.begin(), w2->uses.end());
                        auto w1Min = std::min(w1->start, w1->end);
                        auto w1Max = std::max(w1->start, w1->end);
                        auto w2Min = std::min(w2->start, w2->end);
                        auto w2Max = std::max(w2->start, w2->end);
                        w1->start = std::min(w1Min, w2Min);
                        w1->end = std::max(w1Max, w2Max);
                        auto it = std::find(intervals.begin(), intervals.end(), w2);
                        if (it != intervals.end())
                            intervals.erase(it);
                    }
                }
            }
    }
    sort(intervals.begin(), intervals.end(), compareStart);
}


bool LinearScan::linearScanRegisterAllocation()
{
    if(debug6) printf("LinearScan::linearScanRegisterAllocation.\n");
    // Todo
    bool overflow = 0;
    // ??????
    for (std::vector<Interval*>::iterator activeitem = active.begin(); activeitem != active.end(); ){
        activeitem = active.erase(activeitem);
    }
    for (std::vector<int>::iterator regitem = regs.begin(); regitem != regs.end(); ){
        regitem = regs.erase(regitem);
    }

    for (int i = 4; i < 11; i++)
        regs.push_back(i);
    // ??????????????????intervals???????????????????????????
    for (auto &interval : intervals)
    {
        // 1.??????active??????,????????????????????????????????????????????? unhandled interval ??? interval
        expireOldIntervals(interval);
        // 2.??????????????????????????????->?????????????????????
        if(regs.empty()){
            if(debug6) printf("overflow in LinearScan::linearScanRegisterAllocation.\n");
            overflow = 1;
            spillAtInterval(interval);
         }else{
            // ??????????????????????????????->
            interval->rreg = regs[0];//??? unhandled interval ?????????????????????
            regs.erase(regs.begin());
            // ?????????????????????????????????active??????     
            int act_size = active.size();
            if(active.empty()){
                active.push_back(interval);
            }
            else{
                for(long unsigned int i = 0; i < act_size; i++){
                    if(i == act_size - 1){
                        active.push_back(interval);
                        break;
                    }
                    else{
                        if(active[i]->end <= interval->end && active[i+1]->end >= interval->end){
                            active.insert(active.begin() + i+1, interval);
                            break;
                        }
                    }
                }
            }
        }
    }
    if(overflow)//?????????????????????
        return 0;
    return 1;
}

void LinearScan::modifyCode()
{
    if(debug6) printf("LinearScan::modifyCode.\n");
    for (auto &interval : intervals)
    {
        func->addSavedRegs(interval->rreg);
        for (auto def : interval->defs)
            def->setReg(interval->rreg);
        for (auto use : interval->uses)
            use->setReg(interval->rreg);
    }
}

void LinearScan::genSpillCode()
{
    if(debug6) printf("LinearScan::genSpillCode.\n");

    for(auto &interval:intervals)
    {
        if(!interval->spill)
            continue;
        // TODO
        /* HINT:
         * The vreg should be spilled to memory.
         * 1. insert ldr inst before the use of vreg
         * 2. insert str inst after the def of vreg
         */ 
        interval->disp = func->AllocSpace(4);//??????????????????????????????FP?????????
        // 1. insert ldr inst before the use of vreg
        for (auto use : interval->uses){
            // ???use?????????ld??????,???????????????????????????????????????????????????
            MachineBlock* insertbb = use->getParent()->getParent();
            std::vector<MachineInstruction*> inst_list = insertbb->getInsts();
            for(int i = 0;i < inst_list.size(); i++){
                if(inst_list[i] == use->getParent()){
                    MachineInstruction* ld = new LoadMInstruction(insertbb, use, new MachineOperand(MachineOperand::REG, 11), new MachineOperand(MachineOperand::IMM, -interval->disp));
                    insertbb->InsertInst_at_i(i,ld);
                    break;
                }
            }
        }
        // 2. insert str inst after the def of vreg
        for (auto def : interval->defs){
            // ???use?????????ld??????,??? DEF ??????????????? StoreMInstruction???????????????????????????????????????????????????
            MachineBlock* insertbb = def->getParent()->getParent();
            std::vector<MachineInstruction*> inst_list = insertbb->getInsts();
            for(int i = 0;i < inst_list.size(); i++){
                if(inst_list[i] == def->getParent()){
                    MachineInstruction* str = new StoreMInstruction(insertbb, def, new MachineOperand(MachineOperand::REG, 11), new MachineOperand(MachineOperand::IMM, -interval->disp));
                    if(i != inst_list.size()-1)
                        insertbb->InsertInst_at_i(i+1,str);
                    else
                        insertbb->InsertInst(str);
                    break;
                }
            }
        }
    }
}

void LinearScan::expireOldIntervals(Interval *interval)//??????active???????????????????????????????????????????????????unhandled intervel???interval
{
    if(debug6) printf("LinearScan::expireOldIntervals.\n");
    // Todo
    for(int i = 0; i < active.size(); i++){
        if(active[i]->end < interval->start){// ?????????activeitem???????????????reg????????????   
            regs.push_back(active[i]->rreg);//???????????????
            active.erase(find(active.begin(), active.end(), active[i]));// ???activeitem???active?????????
            sort(regs.begin(), regs.end());
        }
    }
}

void LinearScan::spillAtInterval(Interval *interval) 
{
    if(debug6) printf("LinearScan::spillAtInterval.\n");
    // Todo
    // ???active???????????????interval?????????interval???????????????
    if(active.back()->end <= interval->end){
        // ??????unhandled interval??????????????????????????????spill???????????????
        interval->spill = 1;
    }
    else{// ??????active????????????interval??????????????????
        // ?????????spill?????????
        active.back()->spill = 1;
        // ??????????????????????????????interval
        interval->rreg = active.back()->rreg;
        // ?????????????????????active
        if(active.empty()){
                active.push_back(interval);
            }
        else{
            for(long unsigned int i = 0; i < active.size(); i++){
                if(i == active.size() - 1){
                    active.insert(active.end(), interval);
                    break;
                }
                else{
                    if(active[i]->end <= interval->end && active[i+1]->end >= interval->end){
                        active.insert(active.begin() + i+1, interval);
                        break;
                    }
                }                    
            }
        }
    }
}


bool LinearScan::compareStart(Interval *a, Interval *b)
{
    if(debug6) printf("LinearScan::compareStart.\n");
    return a->start < b->start;
}





/////////////////////////////////////////////////////////////

bool debug7 = 0;


bool ls_f = 1;
bool ls_first = 1;


LinearScan_F::LinearScan_F(MachineUnit *unit)
{
    if(debug7) printf("LinearScan_F::LinearScan_F.\n");
    this->unit = unit;
    for (int i = 5; i < 32; i++)
        regs.push_back(i);
}

void LinearScan_F::allocateRegisters()
{
    if(debug7) printf("LinearScan_F::allocateRegisters.\n");
    for (auto &f : unit->getFuncs())
    {
        func = f;
        bool success;
        success = false;
        while (!success)        // repeat until all vregs can be mapped
        {
            computeLiveIntervals();
            success = linearScanRegisterAllocation();
            if (success)        // all vregs can be mapped to real regs
                modifyCode();
            else                // spill vregs that can't be mapped to real regs
                genSpillCode();
        }
    }
}

void LinearScan_F::makeDuChains()
{
    if(debug7) printf("LinearScan_F::makeDuChains.\n");
    LiveVariableAnalysis lva;
    lva.pass(func);
    du_chains.clear();
    int i = 0;
    std::map<MachineOperand, std::set<MachineOperand *>> liveVar;
    for (auto &bb : func->getBlocks())
    {
        liveVar.clear();
        for (auto &t : bb->getLiveOut())/////////////
        {
            if(t->get_isfloat())
                liveVar[*t].insert(t);
        }
            
        int no;
        no = i = bb->getInsts().size() + i;
        for (auto inst = bb->getInsts().rbegin(); inst != bb->getInsts().rend(); inst++)
        {
            (*inst)->setNo(no--);
            for (auto &def : (*inst)->getDef())
            {
                if (def->isVReg() && def->get_isfloat())///////////
                {
                    auto &uses = liveVar[*def];
                    du_chains[def].insert(uses.begin(), uses.end());
                    auto &kill = lva.getAllUses()[*def];
                    std::set<MachineOperand *> res;
                    set_difference(uses.begin(), uses.end(), kill.begin(), kill.end(), inserter(res, res.end()));
                    liveVar[*def] = res;
                }
            }
            for (auto &use : (*inst)->getUse())
            {
                if (use->isVReg() && use->get_isfloat())///////////////
                    liveVar[*use].insert(use);
            }
        }
    }
}

void LinearScan_F::computeLiveIntervals()
{
    if(debug7) printf("LinearScan_F::computeLiveIntervals.\n");
    makeDuChains();
    intervals.clear();

    for (auto &du_chain : du_chains)
    {
        int t = -1;
        for (auto &use : du_chain.second)
            t = std::max(t, use->getParent()->getNo());
        Interval *interval = new Interval({du_chain.first->getParent()->getNo(), t, false, 0, 0, {du_chain.first}, du_chain.second});
        intervals.push_back(interval);
    }
    for (auto& interval : intervals) {
        auto uses = interval->uses;
        auto begin = interval->start;
        auto end = interval->end;
        for (auto block : func->getBlocks()) {
            auto liveIn = block->getLiveIn();
            auto liveOut = block->getLiveOut();
            bool in = false;
            bool out = false;
            for (auto use : uses)
                if (liveIn.count(use)) {
                    in = true;
                    break;
                }
            for (auto use : uses)
                if (liveOut.count(use)) {
                    out = true;
                    break;
                }
            if (in && out) {
                begin = std::min(begin, (*(block->begin()))->getNo());
                end = std::max(end, (*(block->rbegin()))->getNo());
            } else if (!in && out) {
                for (auto i : block->getInsts())
                    if (i->getDef().size() > 0 &&
                        i->getDef()[0] == *(uses.begin())) {
                        begin = std::min(begin, i->getNo());
                        break;
                    }
                end = std::max(end, (*(block->rbegin()))->getNo());
            } else if (in && !out) {
                begin = std::min(begin, (*(block->begin()))->getNo());
                int temp = 0;
                for (auto use : uses)
                    if (use->getParent()->getParent() == block)
                        temp = std::max(temp, use->getParent()->getNo());
                end = std::max(temp, end);
            }
        }
        interval->start = begin;
        interval->end = end;
    }
    bool change;
    change = true;
    while (change)// while(??????IN??????????????????)
    {
        change = false;
        std::vector<Interval *> t(intervals.begin(), intervals.end());
        for (size_t i = 0; i < t.size(); i++)// for(???EXIT????????????????????????B)
            for (size_t j = i + 1; j < t.size(); j++)// for s ??? B ?????????
            {
                Interval *w1 = t[i];
                Interval *w2 = t[j];
                if (**w1->defs.begin() == **w2->defs.begin())
                {
                    std::set<MachineOperand *> temp;
                    set_intersection(w1->uses.begin(), w1->uses.end(), w2->uses.begin(), w2->uses.end(), inserter(temp, temp.end()));
                    if (!temp.empty())
                    {
                        change = true;
                        w1->defs.insert(w2->defs.begin(), w2->defs.end());
                        w1->uses.insert(w2->uses.begin(), w2->uses.end());
                        auto w1Min = std::min(w1->start, w1->end);
                        auto w1Max = std::max(w1->start, w1->end);
                        auto w2Min = std::min(w2->start, w2->end);
                        auto w2Max = std::max(w2->start, w2->end);
                        w1->start = std::min(w1Min, w2Min);
                        w1->end = std::max(w1Max, w2Max);
                        auto it = std::find(intervals.begin(), intervals.end(), w2);
                        if (it != intervals.end())
                            intervals.erase(it);
                    }
                }
            }
    }
    sort(intervals.begin(), intervals.end(), compareStart);
}

bool LinearScan_F::linearScanRegisterAllocation()
{
    if(debug7) printf("LinearScan_F::linearScanRegisterAllocation.\n");
    // Todo
    bool overflow = 0;

    for (std::vector<Interval*>::iterator activeitem = active.begin(); activeitem != active.end(); ){
        activeitem = active.erase(activeitem);
    }
    for (std::vector<int>::iterator regitem = regs.begin(); regitem != regs.end(); ){
        regitem = regs.erase(regitem);
    }

    for (int i = 5; i < 32; i++)
        regs.push_back(i);
    // ??????????????????intervals???????????????????????????
    for (auto &interval : intervals)
    {
        // 1.??????active??????,????????????????????????????????????????????? unhandled interval ??? interval
        expireOldIntervals(interval);
        // 2.??????active?????????interval???????????????????????????reg??????????????????
        if(regs.empty()){
            // ?????????????????????
            if(debug7) printf("overflow in LinearScan_F::linearScanRegisterAllocation.\n");
            overflow = 1;
            spillAtInterval(interval);
         }else{
            // ??? unhandled interval ?????????????????????



            // interval->rreg = regs[regs.size()-1];
            // regs.pop_back();


            interval->rreg = regs[0];
            regs.erase(regs.begin());


            // ?????????????????????????????????active??????     

            int act_size = active.size();
            if(active.empty()){
                active.push_back(interval);
            }
            else{
                for(long unsigned int i = 0; i < act_size; i++){
                    if(i == act_size - 1){
                        active.push_back(interval);
                        break;
                    }
                    else{
                        if(active[i]->end <= interval->end && active[i+1]->end >= interval->end){
                            active.insert(active.begin() + i+1, interval);
                            break;
                        }
                    }
                }
            }
        }
    }
    if(overflow)
        return 0;
    return 1;
}

void LinearScan_F::modifyCode()
{
    if(debug7) printf("LinearScan_F::modifyCode.\n");
    for (auto &interval : intervals)
    {
        func->addSaved_S_Regs(interval->rreg);
        for (auto def : interval->defs)
        {
            def->setReg(interval->rreg);
        }
        for (auto use : interval->uses)
        {
            use->setReg(interval->rreg);
        }
    }
}

void LinearScan_F::genSpillCode()
{
    if(debug7) printf("LinearScan_F::genSpillCode.\n");

    for(auto &interval:intervals)
    {
        if(!interval->spill)
            continue;
        // TODO
        /* HINT:
         * The vreg should be spilled to memory.
         * 1. insert ldr inst before the use of vreg
         * 2. insert str inst after the def of vreg
         */ 
        interval->disp = func->AllocSpace(4);
        // 1. insert ldr inst before the use of vreg
        for (auto use : interval->uses){
            // ???use?????????ld??????,???????????????????????????????????????????????????
            MachineBlock* insertbb = use->getParent()->getParent();
            std::vector<MachineInstruction*> inst_list = insertbb->getInsts();
            for(int i = 0;i < inst_list.size(); i++){
                if(inst_list[i] == use->getParent()){
                    MachineInstruction* ld = new LoadMInstruction(insertbb, use, new MachineOperand(MachineOperand::REG, 11), new MachineOperand(MachineOperand::IMM, -interval->disp));
                    ld->set_V();
                    insertbb->InsertInst_at_i(i,ld);
                    break;
                }
            }
        }
        // 2. insert str inst after the def of vreg
        for (auto def : interval->defs){
            // ???use?????????ld??????,??? DEF ??????????????? StoreMInstruction???????????????????????????????????????????????????
            MachineBlock* insertbb = def->getParent()->getParent();
            std::vector<MachineInstruction*> inst_list = insertbb->getInsts();
            for(int i = 0;i < inst_list.size(); i++){
                if(inst_list[i] == def->getParent()){
                    MachineInstruction* str = new StoreMInstruction(insertbb, def, new MachineOperand(MachineOperand::REG, 11), new MachineOperand(MachineOperand::IMM, -interval->disp));
                    str->set_V();
                    if(i != inst_list.size()-1)
                        insertbb->InsertInst_at_i(i+1,str);
                    else
                        insertbb->InsertInst(str);
                    break;
                }
            }
        }
    }
}




void LinearScan_F::expireOldIntervals(Interval *interval)//++++++++++
{
    if(debug7) printf("LinearScan_F::expireOldIntervals.\n");
    // Todo
    for(int i = 0; i < active.size(); i++){
        if(active[i]->end < interval->start){// ?????????activeitem???????????????reg????????????   
            regs.push_back(active[i]->rreg);//???????????????
            //active.erase(active.begin() + i);// ???activeitem???active?????????
            active.erase(find(active.begin(), active.end(), active[i]));
            sort(regs.begin(), regs.end());
        }
    }
}


void LinearScan_F::spillAtInterval(Interval *interval) //+++++++++++
{
    if(debug7) printf("LinearScan_F::spillAtInterval.\n");
    // Todo
    // ???active???????????????interval?????????interval???????????????
    if(active.back()->end <= interval->end){
        // ??????spill???????????????
        interval->spill = 1;
    }
    else{
        // ?????????spill?????????
        active.back()->spill = 1;
        // ??????????????????????????????interval
        interval->rreg = active.back()->rreg;
        // ?????????????????????active
        if(active.empty()){
                active.push_back(interval);
            }
        else{
            for(long unsigned int i = 0; i < active.size(); i++){
                if(i == active.size() - 1){
                    active.insert(active.end(), interval);
                    break;
                }
                else{
                    if(active[i]->end <= interval->end && active[i+1]->end >= interval->end){
                        active.insert(active.begin() + i+1, interval);
                        break;
                    }
                }                    
            }
        }
    }
}


bool LinearScan_F::compareStart(Interval *a, Interval *b)
{
    if(debug7) printf("LinearScan_F::compareStart.\n");
    return a->start < b->start;
}

