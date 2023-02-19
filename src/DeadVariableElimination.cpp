#include "DeadVariableElimination.h"
class Unit;
#include<list>
#include<vector>
extern bool passinfo;
void DeadVariableElimination::pass(){
    std::vector<BasicBlock *>::iterator bb;
    Instruction* inst;
    
    std::vector<Function *> func_list = unit->getfunclist();
    for (auto &func : func_list){
        for(bb = func->begin();bb != func->end();bb++){
            for(inst = (*bb)->begin(); inst != (*bb)->end(); inst = inst->getNext()){
                // 拿到指令了
                // 1.通过指令找到它定义的operand
                Operand* op = inst->def_dst;
                // 2.看这个operand有没有被使用
                if(op){
                    if(op->usersNum() == 0){//没有被使用
                        (*bb)->remove(inst);
                        if(passinfo) printf("DeadVariable Elimination Succeed!\n");
                    }
                }
            }
        }
        

    }

}