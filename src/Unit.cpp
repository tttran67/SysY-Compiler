#include "Unit.h"
#include "Type.h"
#include <list>
#include <stack>
extern SymbolTable *globals;
extern FILE* yyout;
std::list<SymbolEntry *> LibraryFuncVec;
void Unit::insertFunc(Function *f)
{
    func_list.push_back(f);
}

void Unit::removeFunc(Function *func)
{
    func_list.erase(std::find(func_list.begin(), func_list.end(), func));
}

void Unit::output() const
{
    //打印全局变量
    std::map<std::string, SymbolEntry*> global_table = globals->getmap();
    for (auto iter = global_table.begin(); iter != global_table.end(); ++iter) {
        SymbolEntry* se = iter->second;
        if (se->getType()->isInt())
        {
            fprintf(yyout, "%s = global %s %d, align 4\n", se->toStr().c_str(),se->getType()->toStr().c_str(),((IdentifierSymbolEntry*)se)->getValue());
        }
        else if (se->getType()->isArray()) {
            // llvm不需要
        }
    }
    for (auto &func : func_list)
        func->output();


    std::set<std::string> _Duplicate;
    std::string tempfunc = "";
    for(auto &se:LibraryFuncVec)
    {        
        FunctionType* type = (FunctionType*)(se->getType());
        std::string ret = type->getRetType()->toStr();
        std::string str = type->toStr();
        // printf("%s\n", str.c_str());
        std::string param = str.substr(str.find('('));
        // tempfunc = ret + param;
        tempfunc = se->toStr();//库函数去重以函数名为准，因为putint和putch有同样的返回类型和参数类型、个数
        if (_Duplicate.find(tempfunc) == _Duplicate.end()){
            fprintf(yyout, "declare %s %s%s\n", ret.c_str(), se->toStr().c_str(), param.c_str());
            _Duplicate.insert(tempfunc);
        }
    }
}


void Unit::genMachineCode(MachineUnit* munit) //lab7
{
    AsmBuilder* builder = new AsmBuilder();
    builder->setUnit(munit);
    for (auto &func : func_list)
        func->genMachineCode(builder);
}

Unit::~Unit()
{
    // for(auto &func:func_list)
    //     delete func;
}
