#include "Ast.h"
#include "SymbolTable.h"
#include <string>
#include <iostream>
#include "Type.h"
#include <cassert>

//lab6
#include "Unit.h"
#include "Instruction.h"
#include "IRBuilder.h"
#include <stack>


extern FILE *yyout;
int Node::counter = 0; //node的静态变量
bool debug1 = 0;//用于typeCheck
bool debug2 = 0;//用于genCode
//lab6
IRBuilder* Node::builder = nullptr;
std::stack<WhileStmt*> stack4iteration;//循环迭代专用栈
bool hasretinst = 0;
bool handlingRightVal = 0;//表示当前正在处理右值
extern bool passinfo;

bool increase_and_check(int* arry, int length, int* ckarry){
    arry[length-1]++;
    for(int i = length-1;i > 0; i--){
        if(arry[i] >= ckarry[i]){
            arry[i]=0;
            arry[i-1]++;
        }
    }
    if(arry[0]>=ckarry[0]) return 1;//可以break了
    return 0;//还不能break
}

Node::Node()
{
    seq = counter++; //node的seq（好像没用到）
    next = nullptr;
}



//lab6---------begin------------
void Node::backPatch(std::vector<Instruction*> &list, BasicBlock*bb)
{
    for(auto &inst:list)
    {
        if(inst->isCond())
            dynamic_cast<CondBrInstruction*>(inst)->setTrueBranch(bb);
        else if(inst->isUncond())
            dynamic_cast<UncondBrInstruction*>(inst)->setBranch(bb);
    }
}

std::vector<Instruction*> Node::merge(std::vector<Instruction*> &list1, std::vector<Instruction*> &list2)
{
    std::vector<Instruction*> res(list1);
    res.insert(res.end(), list2.begin(), list2.end());
    return res;
}

void Ast::genCode(Unit *unit)
{
    IRBuilder *builder = new IRBuilder(unit);
    Node::setIRBuilder(builder);
    root->genCode();
}

void FunctionDef::genCode()// 需要特别小心，除了加entry和exit以外，如果控制流图出错是打印不出来func的
{
    if(debug2) printf("FunctionDef::genCode.\n");
    Unit *unit = builder->getUnit();
    Function *func = new Function(unit, se);
    BasicBlock *entry = func->getEntry();
    // set the insert point to the entry basicblock of this function.
    builder->setInsertBB(entry);
    //给函数参数列表赋值
    DeclStmt* params_head=params;
    int t_num=0;
    int t_snum=0;
    int t_rnum=0;
    while (params_head) //给每个参数新建一个TemporarySymbolEntry,并绑定它的Operand(由@x到%t)
    {
        IdentifierSymbolEntry *se = dynamic_cast<IdentifierSymbolEntry *>(params_head->getId()->getSymPtr());//se: id对应的se指针
        TemporarySymbolEntry *temp_se = new TemporarySymbolEntry(se->getType(), SymbolTable::getLabel());

        if(se->getType()->isArray()){
            //printf("%s-----\n",(new PointerType(((ArrayType*)(se->getType()))->getElementType()))->toStr().c_str());
            temp_se = new TemporarySymbolEntry(new PointerType(((ArrayType*)(se->getType()))->getElementType()),SymbolTable::getLabel());
        }


        temp_se->set_param_num(t_num++);
        if(temp_se->getType()->isFloat())
            temp_se->set_s_param_num(t_snum++);
        else
            temp_se->set_r_param_num(t_rnum++);

        Operand *temp_addr = new Operand(temp_se);//绑定Operand
        //define i32 @main(i32 %t1, i32 %t2),把t1和t2绑定到se，在孩子结点DeclStmt::genCode()里，
        //如果是参数就alloca且store
        se->setAddr(temp_addr);                                          // set the addr operand in symbol entry so that we can use it in subsequent code generation.
        func->insert_func_params(temp_addr);
        params_head = dynamic_cast<DeclStmt *>(params_head->getNext());
    }
    if(params) params->genCode();
    if(stmt) stmt->genCode();

    /**
     * Construct control flow graph. You need do set successors and predecessors for each basic block.
     * Todo
    */
    Instruction* inst;
    std::vector<BasicBlock *>::iterator bb;
    for(bb = func->begin();bb != func->end();bb++){//注意不能是end，详见Function.h
        for(inst = (*bb)->begin(); inst != (*bb)->rbegin(); inst = inst->getNext()){//注意不能是end，详见BasicBlock.h
            if(inst->isCond() || inst->isUncond()){
                //这是必要的，见level1-2的102.sy。
                //当比较运算的结果被用作运算数而不是控制语句流向时，这个比较运算的truebranch和falsebranch需要被剪掉
                (*bb)->remove(inst);
            }
            if(inst->isRet()){
                for(Instruction* laterinst = inst->getNext(); laterinst != (*bb)->end(); laterinst = laterinst->getNext()){
                    (*bb)->remove(laterinst);
                }
                break;
            }
        }
        //这里inst是*bb的最后一条指令
        if(inst->isCond()){
            BasicBlock* true_bb = ((CondBrInstruction*)inst)->getTrueBranch();
            BasicBlock* false_bb = ((CondBrInstruction*)inst)->getFalseBranch();
            (*bb)->addSucc(true_bb);
            (*bb)->addSucc(false_bb);
            true_bb->addPred(*bb);
            false_bb->addPred(*bb);
        }
        else if(inst->isUncond()){
            BasicBlock* branch_bb = ((UncondBrInstruction*)inst)->getBranch();          
            (*bb)->addSucc(branch_bb);
            branch_bb->addPred(*bb);
        }
        else if(!inst->isRet()){
            //为什么检查是否为void？--见样例027_if2
            //(不一定是最后一个bb)这条inst是一个bb的结尾，但它不是br也不是ret，说明这个块是函数的最后一个块(理论上，生成的不一定)，需要帮忙生成ret
            if(((FunctionType*)(this->se->getType()))->getRetType()->isVoid())
                new RetInstruction(nullptr, *bb);
        }
    }
}

void ExprNode::genCode() {
    // Todo
}

void BinaryExpr::genCode()
{
    if(debug2) printf("BinaryExpr::genCode.\n");
    BasicBlock *bb = builder->getInsertBB();
    Function *func = bb->getParent();
    if (op == AND)
    {
        BasicBlock *trueBB = new BasicBlock(func);  // if the result of lhs is true, jump to the trueBB.
        handlingRightVal = 1;
        expr1->genCode();
        handlingRightVal = 0;
        if(expr1->getType()->getSize()!=1)
        {
            //类型转换为bool
            TypeConversion* tc = new TypeConversion(expr1->getType(), TypeSystem::boolType, expr1->getOperand(), builder->getInsertBB());
            BasicBlock* true_bb=new BasicBlock(func);
            BasicBlock* false_bb=new BasicBlock(func);
            BasicBlock* next_bb=new BasicBlock(func);
            expr1->trueList().push_back( new CondBrInstruction(true_bb, false_bb, tc->get_newOp(), builder->getInsertBB()));
            expr1->falseList().push_back(new UncondBrInstruction(next_bb, false_bb));
        }
        backPatch(expr1->trueList(), trueBB);//把expr1的为true时会执行的指令填入trueBB
        builder->setInsertBB(trueBB);               // set the insert point to the trueBB so that intructions generated by expr2 will be inserted into it.
        handlingRightVal = 1;
        expr2->genCode();
        handlingRightVal = 0;
        if(expr2->getType()->getSize()!=1)
        {
            //类型转换为bool
            TypeConversion* tc = new TypeConversion(expr2->getType(), TypeSystem::boolType, expr2->getOperand(), builder->getInsertBB());
            BasicBlock* true_bb=new BasicBlock(func);
            BasicBlock* false_bb=new BasicBlock(func);
            BasicBlock* next_bb=new BasicBlock(func);
            expr2->trueList().push_back( new CondBrInstruction(true_bb, false_bb, tc->get_newOp(), builder->getInsertBB()));
            expr2->falseList().push_back(new UncondBrInstruction(next_bb, false_bb));
        }
        true_list = expr2->trueList();
        false_list = merge(expr1->falseList(), expr2->falseList());
    }
    else if(op == OR)
    {
        // Todo
        BasicBlock *falseBB = new BasicBlock(func);  // if the result of lhs is true, jump to the trueBB.
        handlingRightVal = 1;
        expr1->genCode();
        handlingRightVal = 0;
        if(expr1->getType()->getSize()!=1)
        {
            //类型转换为bool
            TypeConversion* tc = new TypeConversion(expr1->getType(), TypeSystem::boolType, expr1->getOperand(), builder->getInsertBB());
            BasicBlock* true_bb=new BasicBlock(func);
            BasicBlock* false_bb=new BasicBlock(func);
            BasicBlock* next_bb=new BasicBlock(func);
            expr1->trueList().push_back( new CondBrInstruction(true_bb, false_bb, tc->get_newOp(), builder->getInsertBB()));
            expr1->falseList().push_back(new UncondBrInstruction(next_bb, false_bb));
        }
        backPatch(expr1->falseList(), falseBB);
        builder->setInsertBB(falseBB);               // set the insert point to the trueBB so that intructions generated by expr2 will be inserted into it.
        handlingRightVal = 1;
        expr2->genCode();
        handlingRightVal = 0;
        if(expr2->getType()->getSize()!=1)
        {
            //类型转换为bool
            TypeConversion* tc = new TypeConversion(expr2->getType(), TypeSystem::boolType, expr2->getOperand(), builder->getInsertBB());
            BasicBlock* true_bb=new BasicBlock(func);
            BasicBlock* false_bb=new BasicBlock(func);
            BasicBlock* next_bb=new BasicBlock(func);
            expr2->trueList().push_back( new CondBrInstruction(true_bb, false_bb, tc->get_newOp(), builder->getInsertBB()));
            expr2->falseList().push_back(new UncondBrInstruction(next_bb, false_bb));
        }
        false_list = expr2->falseList();
        true_list = merge(expr1->trueList(), expr2->trueList());
    }
    else if(op >= LESS && op <= NOTEQUAL)
    {
        // Todo
        handlingRightVal = 1;
        expr1->genCode();
        expr2->genCode();
        handlingRightVal = 0;
        Operand *src1;
        Operand *src2;
        //要区分int、float、bool
        if(expr1->getType()->isArray() || expr2->getType()->isArray() || expr1->getType()->isPointer() || expr2->getType()->isPointer() ){//【待定】
            if(debug2) printf("op >= LESS && op <= NOTEQUAL::meet Array.\n");
            src1 = expr1->getOperand();
            src2 = expr2->getOperand();
        }
        else if(expr1->getType()->getSize()==32 && expr2->getType()->getSize()==32)
        {
            // expr1是int，expr2是int
            if(expr1->getType()->isInt() && expr2->getType()->isInt())
            {
                src1 = expr1->getOperand();
                src2 = expr2->getOperand();
            }
            else
            {
                //至少存在一个float，则全转为float（float转为float会返回原op，不会new新的）
                TypeConversion* tc1 = new TypeConversion(expr1->getType(), TypeSystem::floatType, expr1->getOperand(), bb);
                TypeConversion* tc2 = new TypeConversion(expr2->getType(), TypeSystem::floatType, expr2->getOperand(), bb);
                src1 = tc1->get_newOp();
                src2 = tc2->get_newOp();
            }
        }
        else// 至少有一个bool类型
        {
            if(expr1->getType()->isBool())
            {
                // expr1是bool，expr2是int
                if(expr2->getType()->isInt())
                {
                    //expr1转为int
                    TypeConversion* tc = new TypeConversion(expr1->getType(), TypeSystem::intType, expr1->getOperand(), bb);
                    src1 = tc->get_newOp();
                    src2 = expr2->getOperand();
                }
                // expr1是bool，expr2是float
                else if(expr2->getType()->isFloat())
                {
                    //expr1转为float
                    TypeConversion* tc = new TypeConversion(expr1->getType(), TypeSystem::floatType, expr1->getOperand(), bb);
                    src1 = tc->get_newOp();
                    src2 = expr2->getOperand();
                }
                // expr1是bool，expr2是bool
                else if(expr2->getType()->isBool())
                {
                    //expr1转为int，expr2转为int
                    TypeConversion* tc1 = new TypeConversion(expr1->getType(), TypeSystem::intType, expr1->getOperand(), bb);
                    TypeConversion* tc2 = new TypeConversion(expr2->getType(), TypeSystem::intType, expr2->getOperand(), bb);
                    src1 = tc1->get_newOp();
                    src2 = tc2->get_newOp();
                }
            }
            else //expr1不是bool，则expr2是bool
            {
                // expr1是int，expr2是bool
                if(expr1->getType()->isInt())
                {
                    //expr2转为int
                    TypeConversion* tc = new TypeConversion(expr2->getType(), TypeSystem::intType, expr2->getOperand(), bb);
                    src1 = expr1->getOperand();
                    src2 = tc->get_newOp();
                }
                // expr1是float，expr2是bool
                else if(expr1->getType()->isFloat())
                {
                    //expr2转为float
                    TypeConversion* tc = new TypeConversion(expr2->getType(), TypeSystem::floatType, expr2->getOperand(), bb);
                    src1 = expr1->getOperand();
                    src2 = tc->get_newOp();
                }
            }
        }

        int opcode;
        switch (op)
        {
        case EQUAL:
            opcode = CmpInstruction::E;
            break;
        case NOTEQUAL:
            opcode = CmpInstruction::NE;
            break;
        case LESS:
            opcode = CmpInstruction::L;
            break;
        case GREATEREQUAL:
            opcode = CmpInstruction::GE;
            break;
        case GREATER:
            opcode = CmpInstruction::G;
            break;
        case LESSEQUAL:
            opcode = CmpInstruction::LE;
            break;
        }
        new CmpInstruction(opcode, dst, src1, src2, bb);//在这里面区分fcmp和icmp
        BasicBlock *true_bb = new BasicBlock(func);
        BasicBlock *false_bb = new BasicBlock(func);
        BasicBlock *next_bb = new BasicBlock(func);
        true_list.push_back(new CondBrInstruction(true_bb, false_bb, dst, bb));
        false_list.push_back(new UncondBrInstruction(next_bb, false_bb));
    }
    else if(op >= ADD && op <= MOD)
    {
        handlingRightVal=1;
        expr1->genCode();
        handlingRightVal=1;
        expr2->genCode();
        handlingRightVal=0;
        Operand *src1;
        Operand *src2;
        //要区分int、float、bool
        if(expr1->getType()->isArray() || expr2->getType()->isArray()){//【待定】
            src1 = expr1->getOperand();
            src2 = expr2->getOperand();
        }
        else if(expr1->getType()->getSize()==32 && expr2->getType()->getSize()==32)
        {
            // expr1是int，expr2是int
            if(expr1->getType()->isInt() && expr2->getType()->isInt())
            {
                src1 = expr1->getOperand();
                src2 = expr2->getOperand();
            }
            else
            {
                //至少存在一个float，则全转为float（float转为float会返回原op，不会new新的）
                TypeConversion* tc1 = new TypeConversion(expr1->getType(), TypeSystem::floatType, expr1->getOperand(), bb);
                TypeConversion* tc2 = new TypeConversion(expr2->getType(), TypeSystem::floatType, expr2->getOperand(), bb);
                src1 = tc1->get_newOp();
                src2 = tc2->get_newOp();
            }
        }
        else// 至少有一个bool类型
        {
            if(expr1->getType()->isBool())
            {
                // expr1是bool，expr2是int
                if(expr2->getType()->isInt())
                {
                    //expr1转为int
                    TypeConversion* tc = new TypeConversion(expr1->getType(), TypeSystem::intType, expr1->getOperand(), bb);
                    src1 = tc->get_newOp();
                    src2 = expr2->getOperand();
                }
                // expr1是bool，expr2是float
                else if(expr2->getType()->isFloat())
                {
                    //expr1转为float
                    TypeConversion* tc = new TypeConversion(expr1->getType(), TypeSystem::floatType, expr1->getOperand(), bb);
                    src1 = tc->get_newOp();
                    src2 = expr2->getOperand();
                }
                // expr1是bool，expr2是bool
                else if(expr2->getType()->isBool())
                {
                    //expr1转为int，expr2转为int
                    TypeConversion* tc1 = new TypeConversion(expr1->getType(), TypeSystem::intType, expr1->getOperand(), bb);
                    TypeConversion* tc2 = new TypeConversion(expr2->getType(), TypeSystem::intType, expr2->getOperand(), bb);
                    src1 = tc1->get_newOp();
                    src2 = tc2->get_newOp();
                }
            }
            else //expr1不是bool，则expr2是bool
            {
                // expr1是int，expr2是bool
                if(expr1->getType()->isInt())
                {
                    //expr2转为int
                    TypeConversion* tc = new TypeConversion(expr2->getType(), TypeSystem::intType, expr2->getOperand(), bb);
                    src1 = expr1->getOperand();
                    src2 = tc->get_newOp();
                }
                // expr1是float，expr2是bool
                else if(expr1->getType()->isFloat())
                {
                    //expr2转为float
                    TypeConversion* tc = new TypeConversion(expr2->getType(), TypeSystem::floatType, expr2->getOperand(), bb);
                    src1 = expr1->getOperand();
                    src2 = tc->get_newOp();
                }
            }
        }
        int opcode;
        bool alg_simplify = 0;
        bool has_bi = 1;
        SymbolEntry* se1=src1->getEntry();
        SymbolEntry* se2=src2->getEntry();
        bool const1 = (se1->isConstant()) ? 1 : 0;
        bool const2 = (se2->isConstant()) ? 1 : 0;
        if(se1->getType()->isInt() && se2->getType()->isInt() && (const1 || const2)){
            alg_simplify = 1;
        }
        //alg_simplify
        if(alg_simplify){
            switch (op)
            {
                //先代数化简
                case ADD:
                    opcode = BinaryInstruction::ADD;
                    if(const1 && (((ConstantSymbolEntry*)se1)->getValue()==0)){//+0
                        dst = src2;
                        has_bi = 0;
                        if(passinfo) printf("Alg Simplify Succeed!\n");
                    }
                    else if(const2 && (((ConstantSymbolEntry*)se2)->getValue()==0)){//+0
                        dst = src1;
                        has_bi = 0;
                        if(passinfo) printf("Alg Simplify Succeed!\n");
                    }
                    break;
                case SUB:
                    opcode = BinaryInstruction::SUB;
                    if(const2 && (((ConstantSymbolEntry*)se2)->getValue()==0)){//-0
                        dst = src1;
                        has_bi = 0;
                        if(passinfo) printf("Alg Simplify Succeed!\n");
                    }
                    break;
                case MUL:
                    opcode = BinaryInstruction::MUL;
                    if(const1 && (((ConstantSymbolEntry*)se1)->getValue()==1)){//*0
                        dst = src2;
                        has_bi = 0;
                        if(passinfo) printf("Alg Simplify Succeed!\n");
                    }
                    else if(const2 && (((ConstantSymbolEntry*)se2)->getValue()==1)){//*0
                        dst = src1;
                        has_bi = 0;
                        if(passinfo) printf("Alg Simplify Succeed!\n");
                    }
                    break;
                case DIV:
                    opcode = BinaryInstruction::DIV;
                    if(const2 && (((ConstantSymbolEntry*)se2)->getValue()==1)){//÷1
                        dst = src1;
                        has_bi = 0;
                        if(passinfo) printf("Alg Simplify Succeed!\n");
                    }
                    break;
                case MOD:
                    opcode = BinaryInstruction::MOD;
                    break;
            }
            if(has_bi)
            //再常量折叠
            if(const1 && const2){
                has_bi = 0;
                int val1 = ((ConstantSymbolEntry*)se1)->getValue();
                int val2 = ((ConstantSymbolEntry*)se2)->getValue();
                int val;
                switch (op)
                {
                    case ADD:
                        val = val1 + val2;
                        break;
                    case SUB:
                        val = val1 - val2;
                        break;
                    case MUL:
                        val = val1 * val2;
                        break;
                    case DIV:
                        val = val1 / val2;
                        break;
                    case MOD:
                        val = val1 % val2;
                        break;
                }
                BinaryInstruction* inst = new BinaryInstruction(opcode, dst, src1, src2, bb);
                inst->constfolding = 1;
                inst->constval = val;
                if(passinfo) printf("Constant Folding Succeed!\n");
            }
        }
        else{
            switch (op)
            {
                case ADD:
                    opcode = BinaryInstruction::ADD;
                    break;
                case SUB:
                    opcode = BinaryInstruction::SUB;
                    break;
                case MUL:
                    opcode = BinaryInstruction::MUL;
                    break;
                case DIV:
                    opcode = BinaryInstruction::DIV;
                    break;
                case MOD:
                    opcode = BinaryInstruction::MOD;
                    break;
            }
            
        }
        if(has_bi)
            new BinaryInstruction(opcode, dst, src1, src2, bb);
        
    }
}
void Constant::genCode()
{
    if(debug2) printf("Constant::genCode.\n");
    // we don't need to generate code.
}

bool debug4id =0;

void Id::genCode()
{
    if(debug2) printf("Id::genCode.\n");
    BasicBlock *bb = builder->getInsertBB();
    Operand *addr = dynamic_cast<IdentifierSymbolEntry*>(symbolEntry)->getAddr();
    SymbolEntry* temp = new TemporarySymbolEntry(getSymPtr()->getType(),SymbolTable::getLabel());
    dst = new Operand(temp);
    // 获得数组的type
    //Type* basicEleType = ((ArrayType*)(this->getType()))->getBasicEleType();    
    if(type->isArray())
    {// 是数组
        if(debug4id) printf("Id::genCode::is array.\n");

        // 1. arr[]、arr[i]，有方括号
        if(this->arrIndex)
        {
            if(debug4id) printf("debug1\n"); 
            temp = new TemporarySymbolEntry(new PointerType(((ArrayType*)type)->getElementType()),SymbolTable::getLabel());
            dst = new Operand(temp);
            Type* tmpType = type;
            bool orighandlingRightVal = handlingRightVal;
            bool flag = 0;
            bool firstin=1;
            bool usedasptr = 0;
            // 1.1 作为函数参数
            if((ArrayType*)tmpType->isPointer())// 使用于1075.sy,函数传参来的指针,需要降维
            {
                if(debug4id) printf("debug2\n");
                //一直get element，直到拿到最基础的element
                while(!((ArrayType*)tmpType->isInt() || (ArrayType*)tmpType->isFloat()))
                {
                    if(arrIndex){ //int a[2][2]; func(a[1]);
                        handlingRightVal=1;
                        arrIndex->genCode();//适用于arr[i]
                        handlingRightVal=0;
                        if(firstin==1)
                        {//如果第一次拿数组元素则要先Load
                            Operand* dst1 = new Operand(new TemporarySymbolEntry(new PointerType(((ArrayType*)tmpType)->getElementType()), SymbolTable::getLabel()));
                            new LoadInstruction(dst1, addr, bb);
                            addr = dst1;
                            flag = 1;
                            firstin=0;
                        } 
                        if(flag)//第一次拿数组元素和后续拿size不同，不用取element(e.g. 三维数组，第一次int***，第二次int***，第三次int**)
                        {
                            int size = ((PointerType*)(addr->getType()))->getValueType()->getSize() / 8;
                            new GetEleAddrInstruction(dst, addr, arrIndex->getOperand(), bb, size); //降维，size是当前维度下的所有element的大小
                        }
                        else
                        {
                            int size = ((ArrayType*)(((PointerType*)(addr->getType()))->getValueType()))->getElementType()->getSize() / 8;
                            new GetEleAddrInstruction(dst, addr, arrIndex->getOperand(), bb, size);//降维，size是当前维度下的所有element的大小
                        }

                    }
                    else{ // arr，只需要拿到它的element的ptr即可
                        Operand* dst1 = new Operand(new TemporarySymbolEntry(
                            new PointerType(type), SymbolTable::getLabel()));
                        Operand* idx = new Operand(
                            new ConstantSymbolEntry(TypeSystem::intType, 0));
                        new GetEleAddrInstruction(dst1, addr, idx, bb, ((ArrayType*)(((PointerType*)(addr->getType()))->getValueType()))->getElementType()->getSize() / 8);
                        dst = dst1;
                        usedasptr = true;
                        break;
                    }
                    
                    
                    flag = 0; 
                    tmpType = ((ArrayType*)tmpType)->getElementType();
                    if((ArrayType*)tmpType->isInt() || (ArrayType*)tmpType->isFloat()) {
                        break;
                    }
                    // example:三维数组需要降维3次，每次的dst都是下一次的src(addr)
                    addr = dst;//[]*
                    dst = new Operand(new TemporarySymbolEntry(new PointerType(((ArrayType*)(tmpType))->getElementType()), SymbolTable::getLabel()));
                    //*
                    arrIndex = (ExprNode*)(arrIndex->getNext());
                }
            }
            
            // 1.2 非函数参数
            else 
            {
                firstin=1;
                if(debug4id) printf("debug3\n");
                //一直get element，直到拿到最基础的element
                while(!((ArrayType*)tmpType->isInt() || (ArrayType*)tmpType->isFloat()))
                {
                    if(arrIndex) 
                    {
                        handlingRightVal=1;
                        arrIndex->genCode();//适用于arr[i]
                        handlingRightVal=0;

                        if(firstin)// 区别在于是否是第一次拿数组元素，if是找数组首地址(arr[2][3][4]，找最高维的地址)
                        {
                            //降维，size是当前维度下的所有element的大小
                            new Get1stEleAddrInstruction(dst, addr, arrIndex->getOperand(), bb, ((ArrayType*)(((PointerType*)(addr->getType()))->getValueType()))->getElementType()->getSize() / 8);
                            firstin=false;
                        }
                        else//else是根据上一维的首地址找本维度的地址
                        {
                            //降维，size是当前维度下的所有element的大小
                            new GetEleAddrInstruction(dst, addr, arrIndex->getOperand(), bb, ((ArrayType*)(((PointerType*)(addr->getType()))->getValueType()))->getElementType()->getSize() / 8);
                        }
                    }
                    else
                    {//int a[2][2]; func(a[1]);
                        Operand* dst1 = new Operand(new TemporarySymbolEntry(
                            new PointerType(type), SymbolTable::getLabel()));
                        Operand* idx = new Operand(
                            new ConstantSymbolEntry(TypeSystem::intType, 0));
                        new GetEleAddrInstruction(dst1, addr, idx, bb,((ArrayType*)(((PointerType*)(addr->getType()))->getValueType()))->getElementType()->getSize() / 8);
                        dst = dst1;
                        usedasptr = true;
                        break;
                    }
                    

                    tmpType = ((ArrayType*)tmpType)->getElementType();
                    if((ArrayType*)tmpType->isInt() || (ArrayType*)tmpType->isFloat()) {
                        break;
                    }
                    addr = dst;
                    dst = new Operand(new TemporarySymbolEntry(new PointerType(((ArrayType*)(tmpType))->getElementType()), SymbolTable::getLabel()));
                    arrIndex = (ExprNode*)(arrIndex->getNext());
                }
            }
            handlingRightVal = orighandlingRightVal;

            // 1.3 作为右值，需要load出来
            if (handlingRightVal && !usedasptr) 
            {// sum=arr[i]作为右值时也需要load
                if(debug4id) printf("load_val\n");
                SymbolEntry *temp1 = new TemporarySymbolEntry(tmpType, SymbolTable::getLabel());
                Operand* dst1 = new Operand(temp1);
                // SymbolEntry *temp2 = new TemporarySymbolEntry(new PointerType(((ArrayType*)(this->getType()))->getBasicEleType()), SymbolTable::getLabel());
                // Operand* src = new Operand(temp2);
                // printf("load1\n");
                new LoadInstruction(dst1, dst, bb);
                dst = dst1;
            }
        }

        // 2. arr 没有方括号
        else
        {
            if(debug4id) printf("debug4\n");
            // 2.1 来自函数参数，相当于从指针load
            if (((ArrayType*)(this->type))->isPointer()) 
            {
                if(debug4id) printf("debug5\n");
                Operand* dst1 = new Operand(new TemporarySymbolEntry(
                    new PointerType(((ArrayType*)(this->type))->getElementType()),
                    SymbolTable::getLabel()));
                new LoadInstruction(dst1, addr, bb);
                dst = dst1;
            }
            // 2.2 不来自函数参数，需要得到其地址
            else
            {
                if(debug4id) printf("debug6\n");
                temp = new TemporarySymbolEntry(new PointerType(((ArrayType*)type)->getElementType()),SymbolTable::getLabel());
                dst = new Operand(temp);
                Operand* idx = new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0));
                new Get1stEleAddrInstruction(dst, addr, idx, bb,((ArrayType*)(((PointerType*)(addr->getType()))->getValueType()))->getElementType()->getSize() / 8);
                
            }
        }
    }
    else if(type->isPointer()){
        if(debug4id) printf("is pointer\n");
    }
    
    else{
        //给id新new一个dst（operand）【随用随new】
        //dst是int类型，addr是int*类型；dst在这里给出，addr在DeclStmt::genCode给出
        //if(debug4id) printf("load_id\n");
        new LoadInstruction(dst, addr, bb);
    }
}




void IfStmt::genCode()
{
    if(debug2) printf("IfStmt::genCode.\n");
    Function *func;
    BasicBlock *then_bb, *end_bb;

    func = builder->getInsertBB()->getParent();
    then_bb = new BasicBlock(func);
    end_bb = new BasicBlock(func);
    handlingRightVal=1;
    cond->genCode();
    handlingRightVal=0;
    if(cond->getType()->isArray())
    {
        //类型转换为bool
        if(((ArrayType*)(cond->getType()))->getElementType()->isArray()){
            // printf("这里要改为basiceletype！！！\n");
        }
        TypeConversion* tc = new TypeConversion(((ArrayType*)(cond->getType()))->getElementType(), TypeSystem::boolType, cond->getOperand(), builder->getInsertBB());
        BasicBlock* true_bb=new BasicBlock(func);
        BasicBlock* false_bb=new BasicBlock(func);
        BasicBlock* next_bb=new BasicBlock(func);
        cond->trueList().push_back( new CondBrInstruction(true_bb, false_bb, tc->get_newOp(), builder->getInsertBB()));
        cond->falseList().push_back(new UncondBrInstruction(next_bb, false_bb));
    }
    else if(cond->getType()->getSize()!=1)
    {
        //类型转换为bool
        TypeConversion* tc = new TypeConversion(cond->getType(), TypeSystem::boolType, cond->getOperand(), builder->getInsertBB());
        //针对if(5)这种不会进入BinaryExpr的情况生成barnch
        BasicBlock* true_bb=new BasicBlock(func);
        BasicBlock* false_bb=new BasicBlock(func);
        BasicBlock* next_bb=new BasicBlock(func);
        cond->trueList().push_back( new CondBrInstruction(true_bb, false_bb, tc->get_newOp(), builder->getInsertBB()));
        cond->falseList().push_back(new UncondBrInstruction(next_bb, false_bb));
    }

    backPatch(cond->trueList(), then_bb);//cond为真时，trueList中所有指令走then_bb
    backPatch(cond->falseList(), end_bb);//cond为假时，falseList中所有指令走end_bb

    //开始填充then_bb内的指令
    builder->setInsertBB(then_bb);
    thenStmt->genCode();//把then该执行的代码写入then_bb
    then_bb = builder->getInsertBB();
    new UncondBrInstruction(end_bb, then_bb);//then_bb最后一条放跳到end_bb的指令

    builder->setInsertBB(end_bb);
}

void IfElseStmt::genCode()
{
    if(debug2) printf("IfElseStmt::genCode.\n");
    // Todo
    // 仿照ifthen即可写出
    Function *func;
    BasicBlock *then_bb,*else_bb, *end_bb;

    func = builder->getInsertBB()->getParent();
    then_bb = new BasicBlock(func);
    else_bb = new BasicBlock(func);
    end_bb = new BasicBlock(func);

    cond->genCode();
    if(cond->getType()->isArray())
    {
        //类型转换为bool
        if(((ArrayType*)(cond->getType()))->getElementType()->isArray()){
            // printf("这里要改为basiceletype！！！\n");
        }
        TypeConversion* tc = new TypeConversion(((ArrayType*)(cond->getType()))->getElementType(), TypeSystem::boolType, cond->getOperand(), builder->getInsertBB());
        BasicBlock* true_bb=new BasicBlock(func);
        BasicBlock* false_bb=new BasicBlock(func);
        BasicBlock* next_bb=new BasicBlock(func);
        cond->trueList().push_back( new CondBrInstruction(true_bb, false_bb, tc->get_newOp(), builder->getInsertBB()));
        cond->falseList().push_back(new UncondBrInstruction(next_bb, false_bb));
    }

    else if(cond->getType()->getSize()!=1)
    {
        //类型转换为bool
        TypeConversion* tc = new TypeConversion(cond->getType(), TypeSystem::boolType, cond->getOperand(), builder->getInsertBB());
        //针对if(5)这种不会进入BinaryExpr的情况生成barnch
        BasicBlock* true_bb=new BasicBlock(func);
        BasicBlock* false_bb=new BasicBlock(func);
        BasicBlock* next_bb=new BasicBlock(func);
        cond->trueList().push_back( new CondBrInstruction(true_bb, false_bb, tc->get_newOp(), builder->getInsertBB()));
        cond->falseList().push_back(new UncondBrInstruction(next_bb, false_bb));
    }
    backPatch(cond->trueList(), then_bb);//cond为真时，trueList中所有指令走if_bb
    backPatch(cond->falseList(), else_bb);//cond为假时，falseList中所有指令走else_bb

    //开始填充then_bb内的指令
    builder->setInsertBB(then_bb);
    thenStmt->genCode();
    then_bb = builder->getInsertBB();
    new UncondBrInstruction(end_bb, then_bb);

    builder->setInsertBB(else_bb);
    elseStmt->genCode();
    else_bb = builder->getInsertBB();
    new UncondBrInstruction(end_bb, else_bb);

    builder->setInsertBB(end_bb);
}

void CompoundStmt::genCode()
{
    if(debug2) printf("CompoundStmt::genCode.\n");
    // Todo
    if (stmt != nullptr)//因为可能是一个没有语句的语句块，即空指针
        stmt->genCode();
}

void SeqNode::genCode()
{
    if(debug2) printf("SeqNode::genCode.\n");
    // Todo
    if (stmt1 != nullptr) stmt1->genCode();
    if (stmt2 != nullptr) stmt2->genCode();
}
bool debug4Decl = 0;

void DeclStmt::genCode()//template code，可参考
{
    if(debug2) printf("DeclStmt::genCode.\n");
    IdentifierSymbolEntry *se = dynamic_cast<IdentifierSymbolEntry *>(id->getSymPtr());//se: id对应的se指针

    if(se->isGlobal())//如果这个id是全局的
    {
        Operand *addr;
        SymbolEntry *addr_se;
        addr_se = new IdentifierSymbolEntry(*se);//addr_se: id对应的se
        addr_se->setType(new PointerType(se->getType()));
        addr = new Operand(addr_se);
        //se和寄存器%t绑定
        se->setAddr(addr);
    }
    else if(se->isLocal())//如果这个id是局部的
    {
        std::vector<ExprNode*> arrayExprvec = ((IdentifierSymbolEntry*)se)->getarrayExprvec();
        int vecptr = 0;
        Function *func = builder->getInsertBB()->getParent();
        BasicBlock *entry = func->getEntry();
        Instruction *alloca;
        Operand *addr;
        SymbolEntry *addr_se;
        Type *type;
        type = new PointerType(se->getType());
        addr_se = new TemporarySymbolEntry(type, SymbolTable::getLabel());//区别于global
        addr = new Operand(addr_se);
        //分配se大小的空间给指针addr
        alloca = new AllocaInstruction(addr, se); //区别于global     // allocate space for local id in function stack.
        //在函数最开始打印所有Declstmt的alloca指令
        entry->insertFront(alloca);                                 // allocate instructions should be inserted into the begin of the entry block.
        //se和寄存器%t绑定(注意这里的addr是int*，对应store；id::gencode里的dst是int，对应load)
        se->setAddr(addr);                                          // set the addr operand in symbol entry so that we can use it in subsequent code generation.
        this->getId()->setOperand(addr);
        handlingRightVal = 1;
        if (expr) 
        {//如果给声明的变量赋了值
            if (se->getType()->isArray()) 
            {
                Operand* init = nullptr;
                BasicBlock* bb = builder->getInsertBB();
                std::vector<ExprNode*> initvec = se->getarrayExprvec();
                int ptr4initvec = 0;
                ArrayType* type = (ArrayType*)(se->getType());
                Operand* tempDst;
                Operand* tempSrc = addr;
                Operand* index;
                int tempoffset = 0;
                Type* tmpType = type;
                std::stack<int> stk4index;
                int totallen=1;
                if(debug4Decl) printf("Decl-11111111111\n");
                while(tmpType!=type->getBasicEleType()){
                    stk4index.push(((ArrayType*)tmpType)->getLength());
                    totallen *= ((ArrayType*)tmpType)->getLength();
                    tmpType=((ArrayType*)tmpType)->getElementType();
                }
                if(debug4Decl) printf("Decl-222222222222\n");
                int* arry4index = new int [stk4index.size()];
                int* ckarry4index = new int [stk4index.size()];
                for(int i = 0;i < stk4index.size(); i++){
                    arry4index[i]=0;               
                }
                if(debug4Decl) printf("Decl-3333333333\n");
                int i = 0;
                tmpType = type;
                while(tmpType!=type->getBasicEleType()){
                    ckarry4index[i++]=((ArrayType*)tmpType)->getLength();
                    tmpType=((ArrayType*)tmpType)->getElementType();
                }
                if(debug4Decl) printf("Decl-44444444444\n");
                tmpType=type;
                GetEleAddrInstruction* myinst = nullptr;
                AddrIncrease4Instruction* myinst_init = nullptr;
                for(int i = 0;i < totallen; i++)
                {//一共出现的store数
                    tempSrc = addr;
                    tmpType = type;
                    bool flag = true;
                    initvec[ptr4initvec++]->genCode();
                    if(debug4Decl) printf("Decl-Loop-5555555555\n");
                    for(int j = 0;j < stk4index.size();j++)
                    {//一共出现的gep数
                        int indexval = arry4index[j];
                        index = (new Constant(new ConstantSymbolEntry(
                                         TypeSystem::intType, indexval)))
                                        ->getOperand();
                        tmpType = ((ArrayType*)tmpType)->getElementType();
                        tempDst = new Operand(new TemporarySymbolEntry(
                                new PointerType(tmpType),
                                SymbolTable::getLabel()));
                        if(debug4Decl) printf("Decl-Innerloop-66666666\n");

                        if(init && j==stk4index.size()-1) //非数组首元素，且是元素的最后一条gep指令
                        {
                            myinst_init = new AddrIncrease4Instruction(tempDst, tempSrc, index, bb , init);
                        }

                        else 
                        {
                            if(flag)
                            {
                                new Get1stEleAddrInstruction(tempDst, tempSrc, index, bb);
                                flag=0;

                            }
                                
                            else
                                new GetEleAddrInstruction(tempDst, tempSrc, index, bb,((ArrayType*)(((PointerType*)(tempSrc->getType()))->getValueType()))->getElementType()->getSize() / 8);
                                
                        }
                            
                        tempSrc = tempDst;                
                    }
                    increase_and_check(arry4index,stk4index.size(),ckarry4index);
                    if(debug4Decl) printf("Decl-Loop-77777777\n");
                    
                
                    init = tempDst;
                    //生成store
                    new StoreInstruction(tempDst, (arrayExprvec[vecptr++])->getOperand(), bb);
                }
            }
            else
            {
                BasicBlock* bb = builder->getInsertBB();

                expr->genCode();

                Operand* src = expr->getOperand();
                if(se->getType()->isFloat() && expr->getType()->isInt())
                {
                    // expr从int转float
                    TypeConversion* tc = new TypeConversion(TypeSystem::intType, TypeSystem::floatType, expr->getOperand(), bb);
                    src=tc->get_newOp();
                }
                if(se->getType()->isInt() && expr->getType()->isFloat())
                {
                    //expr从float转int
                    TypeConversion* tc = new TypeConversion(TypeSystem::floatType, TypeSystem::intType, expr->getOperand(), bb);
                    src=tc->get_newOp();
                }            
                //把这个值存入addr
                new StoreInstruction(addr, src, bb);
            }
        }
        handlingRightVal = 0;
    }

    else if (se->isParam()) {
        //父节点FunctionDef,define i32 @main(i32 %t1, i32 %t2),把t1和t2绑定到se，在DeclStmt::genCode()里，
        //如果是参数就alloca且store
        Function *func = builder->getInsertBB()->getParent();
        BasicBlock *entry = func->getEntry();
        Instruction *alloca;
        Operand *addr;
        SymbolEntry *addr_se;
        Type *type;

        if(se->getType()->isArray())
        {
            //printf("%s-----\n",(new PointerType(((ArrayType*)(se->getType()))->getElementType()))->toStr().c_str());
            type = new PointerType(new PointerType(((ArrayType*)(se->getType()))->getElementType()));
            se->setType(new PointerType(((ArrayType*)(se->getType()))->getElementType()));
        }
        else 
            type = new PointerType(se->getType());

        addr_se = new TemporarySymbolEntry(type, SymbolTable::getLabel());
        addr = new Operand(addr_se);
        alloca = new AllocaInstruction(addr, se);
        // allocate space for local id in function stack.
        entry->insertFront(alloca);  // allocate instructions should be inserted
                                     // into the begin of the entry block.
        Operand* temp_se = se->getAddr();//相比loacal多的
        se->setAddr(addr);  // set the addr operand in symbol entry so that
                            // we can use it in subsequent code generation.
                            // can use it in subsequent code generation.
        if (expr) {
            BasicBlock* bb = builder->getInsertBB();
            expr->genCode();
            Operand* src = expr->getOperand();
            new StoreInstruction(addr, src, bb);
        }
        BasicBlock* bb = builder->getInsertBB();
        new StoreInstruction(addr, temp_se, bb);
    }
    //下一句DeclStmt
    if (this->getNext()) {
        this->getNext()->genCode();
    }
}

void ReturnStmt::genCode()//【凡是涉及ExprNode*的都通过getOperand()获取操作数】
{
    if(debug2) printf("ReturnStmt::genCode.\n");
    // Todo
    BasicBlock *bb = builder->getInsertBB();
    if(retValue == nullptr) new RetInstruction(nullptr, bb);
    else
    {
        handlingRightVal=1;
        retValue->genCode();   
        handlingRightVal=0;  

        Operand* retop = retValue->getOperand();
        if(i2f)//需要把retValue从int转为float
        {
            TypeConversion* tc = new TypeConversion(TypeSystem::intType, TypeSystem::floatType, retValue->getOperand(), bb);
            retop=tc->get_newOp();
        }
        if(f2i)
        {
            TypeConversion* tc = new TypeConversion(TypeSystem::floatType, TypeSystem::intType, retValue->getOperand(), bb);
            retop=tc->get_newOp();
        }
        new RetInstruction(retop, bb);
    }
}

void AssignStmt::genCode()
{
    if(debug2) printf("AssignStmt::genCode.\n");
    BasicBlock *bb = builder->getInsertBB();
    //处理右值
    handlingRightVal = 1;
    expr->genCode();
    handlingRightVal = 0;
    Operand* addr;
    Operand *src;
    if(!lval->getType()->isArray()){
        addr = dynamic_cast<IdentifierSymbolEntry*>(lval->getSymPtr())->getAddr();
    }
    else{// 左值是array
        lval->genCode();
        addr = lval->getOperand();
        // SymbolEntry* temp = new TemporarySymbolEntry(new PointerType(((ArrayType*)(lval->getType()))->getElementType()),SymbolTable::getLabel());
        // addr = new Operand(temp);
        // lval->setOperand(addr);
    }
    src = expr->getOperand();


    if(addr->getType()->isFloat() && expr->getType()->isInt())
    {
        // expr从int转float
        TypeConversion* tc = new TypeConversion(TypeSystem::intType, TypeSystem::floatType, expr->getOperand(), bb);
        src=tc->get_newOp();
    }

    if(addr->getType()->isInt() && expr->getType()->isFloat())
    {
        //expr从float转int
        TypeConversion* tc = new TypeConversion(TypeSystem::floatType, TypeSystem::intType, expr->getOperand(), bb);
        src=tc->get_newOp();
    }

    /***
     * We haven't implemented array yet, the lval can only be ID. So we just store the result of the `expr` to the addr of the id.
     * If you want to implement array, you have to caculate the address first and then store the result into it.
     */
    new StoreInstruction(addr, src, bb);
}

void ExprStmt::genCode()
{
    if(debug2) printf("ExprStmt::genCode.\n");
    // Todo
    if(expr != nullptr)
        expr->genCode();
}

void ContinueStmt::genCode()
{
    if(debug2) printf("ContinueStmt::genCode.\n");
    // Todo
    BasicBlock* bb = builder->getInsertBB();
    BasicBlock * while_continue_bb = stack4iteration.top()->get_while_continue_bb();

    new UncondBrInstruction(while_continue_bb, bb);
    //builder->setInsertBB(while_continue_bb);
    builder->setInsertBB(new BasicBlock(builder->getInsertBB()->getParent()));
}

void BreakStmt::genCode()
{
    if(debug2) printf("BreakStmt::genCode.\n");
    // Todo
    // 简单版的IfStmt
    BasicBlock* bb = builder->getInsertBB();
    BasicBlock * while_end_bb = stack4iteration.top()->get_while_end_bb();
    new UncondBrInstruction(while_end_bb, bb);
    builder->setInsertBB(while_end_bb);
}

void BlankStmt::genCode()
{
    if(debug2) printf("BlankStmt::genCode.\n");
    // Todo
}

void CallExpr::genCode()
{
    if(debug2) printf("CallExpr::genCode.\n");
    // Todo

    std::vector<Operand*> operands;
    //实参列表
    std::vector<ExprNode*>FuncRParams;
    ExprNode* cur=param;
    while(cur)
    {
        FuncRParams.push_back(cur);
        cur=(ExprNode*)(cur->getNext());
    }

    //形参列表
    std::vector<Type*> FuncFParams = ((FunctionType*)(this->symbolEntry->getType()))->getParamsType();

    handlingRightVal=1;
    for(long unsigned int i=0;i<FuncFParams.size();i++)
    {
        handlingRightVal=1;
        FuncRParams[i]->genCode();
        Operand* op = FuncRParams[i]->getOperand();

        //类型转换 -----------------------------------
        Type* rtype = FuncRParams[i]->getType(); //传参的类型
        Type* ftype = FuncFParams[i]; //定义的类型       
        if(ftype->isFloat() && !rtype->isFloat())
        {
            //rtype转为float
            TypeConversion* tc = new TypeConversion(TypeSystem::intType, TypeSystem::floatType, op, builder->getInsertBB());
            op = tc->get_newOp();
        }
        else if(!ftype->isFloat() && rtype->isFloat())
        {
            //rtype转为int
            TypeConversion* tc = new TypeConversion(TypeSystem::floatType, TypeSystem::intType, op, builder->getInsertBB());
            op = tc->get_newOp();
        }
        //类型转换 -----------------------------------

        operands.push_back(op);
    }
    handlingRightVal=0;



    new CallInstruction(dst, symbolEntry, operands, builder->getInsertBB());

}

void UnaryExpr::genCode()
{
    if(debug2) printf("UnaryExpr::genCode.\n");
    // Todothen_bb
    expr->genCode();
    if (op == NOT) {
        BasicBlock* bb = builder->getInsertBB();
        Function *func = bb->getParent();

        if(expr->getType()->isBool())
        {
            //bool类型转换为int，并进行 cmp xxx(i32类型), 0 的指令
            TypeConversion* tc = new TypeConversion(expr->getType(), TypeSystem::intType, expr->getOperand(), builder->getInsertBB());
            Operand* temp_op = tc->get_newOp();
            Operand *src1 = new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0));
            CmpInstruction* t =new CmpInstruction(CmpInstruction::E, dst, temp_op, src1, bb);
            t->set_hasMov();
        }

        if(expr->getType()->isFloat())
        {
            //TODO:实现fcmp指令
        }

        if(expr->getType()->isInt())
        {        
            Operand *src1 = new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0));
            CmpInstruction* t = new CmpInstruction(CmpInstruction::E, dst, expr->getOperand(), src1, bb);
            t->set_hasMov();
        }        
        if(expr->getType()->isArray())
        {
            Operand *src1 = new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0));
            CmpInstruction* t = new CmpInstruction(CmpInstruction::E, dst, expr->getOperand(),src1, bb);
            t->set_hasMov();
        }  

        // 类似BinaryExpr，跳转目标block
        BasicBlock* true_bb, *false_bb, *next_bb;
        true_bb = new BasicBlock(func);
        false_bb = new BasicBlock(func);
        next_bb = new BasicBlock(func);

        true_list.push_back(new CondBrInstruction(true_bb, false_bb, dst, bb));
        false_list.push_back(new UncondBrInstruction(next_bb, false_bb));
    } 
    else if (op == SUB) 
    {
        BasicBlock* bb = builder->getInsertBB();

        if(expr->getType()->isBool())
        {
            //bool类型转换为int，并进行 sub 指令
            TypeConversion* tc = new TypeConversion(expr->getType(), TypeSystem::intType, expr->getOperand(), builder->getInsertBB());
            Operand* temp_op = tc->get_newOp();
            Operand* src1 = new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0));
            //printf("%s-----\n",dst->getType()->toStr().c_str());
            new BinaryInstruction(BinaryInstruction::SUB, dst, src1, temp_op, bb);
        }

        if(expr->getType()->isFloat())
        {
            //TODO:实现fsub指令
            Operand* src1 = new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0));
            new BinaryInstruction(BinaryInstruction::SUB, dst, src1, expr->getOperand(), bb);
        }

        if(expr->getType()->isInt())
        {        
            Operand* src1 = new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0));
            new BinaryInstruction(BinaryInstruction::SUB, dst, src1, expr->getOperand(), bb);
        }
    }
}

void WhileStmt::genCode()
{
    if(debug2) printf("WhileStmt::genCode.\n");
    stack4iteration.push(this);//给当前whilestmt压栈
    // Todo
    //同样仿照IfStmt
    //但WhileStmt和IfStmt的区别在于，每次跳转都会判断一次条件，所以cond应该作为一个单独的bb
    Function *func;
    BasicBlock *orig_bb,*cond_bb,*then_bb, *end_bb;
    orig_bb = builder->getInsertBB();
    func = builder->getInsertBB()->getParent();
    cond_bb = new BasicBlock(func);
    then_bb = new BasicBlock(func);
    end_bb = new BasicBlock(func);
    new UncondBrInstruction(cond_bb, orig_bb);
    //开始填充cond_bb内的指令
    builder->setInsertBB(cond_bb);
    handlingRightVal=1;
    cond->genCode();
    handlingRightVal=0;

    if(cond->getType()->isArray()){
        //类型转换为bool
        if(((ArrayType*)(cond->getType()))->getElementType()->isArray()){
            // printf("这里要改为basiceletype！！！\n");
        }
        TypeConversion* tc = new TypeConversion(((ArrayType*)(cond->getType()))->getElementType(), TypeSystem::boolType, cond->getOperand(), builder->getInsertBB());
        BasicBlock* true_bb=new BasicBlock(func);
        BasicBlock* false_bb=new BasicBlock(func);
        BasicBlock* next_bb=new BasicBlock(func);
        cond->trueList().push_back( new CondBrInstruction(true_bb, false_bb, tc->get_newOp(), builder->getInsertBB()));
        cond->falseList().push_back(new UncondBrInstruction(next_bb, false_bb));
    }
    else if(cond->getType()->getSize()!=1)
    {
        //类型转换为bool
        TypeConversion* tc = new TypeConversion(cond->getType(), TypeSystem::boolType, cond->getOperand(), builder->getInsertBB());
        BasicBlock* true_bb=new BasicBlock(func);
        BasicBlock* false_bb=new BasicBlock(func);
        BasicBlock* next_bb=new BasicBlock(func);
        cond->trueList().push_back( new CondBrInstruction(true_bb, false_bb, tc->get_newOp(), builder->getInsertBB()));
        cond->falseList().push_back(new UncondBrInstruction(next_bb, false_bb));
    }

    backPatch(cond->trueList(), then_bb);//cond为真时，trueList中所有指令走then_bb
    backPatch(cond->falseList(), end_bb);//cond为假时，falseList中所有指令走end_bb

    while_end_bb=end_bb;
    while_continue_bb = cond_bb;
    //开始填充then_bb内的指令
    builder->setInsertBB(then_bb);
    stmt->genCode();
    then_bb = builder->getInsertBB();
    new UncondBrInstruction(cond_bb, then_bb);//从then_bb跳到cond_bb，这条填充在 then_bb 里

    builder->setInsertBB(end_bb);//改成跳转后的基本块
    stack4iteration.pop();
}

void InitListExpr::typeCheck(Type* retType){
    if(debug1) printf("InitListExpr::typeCheck.\n");
}

void InitListExpr::genCode(){
    if(debug2) printf("InitListExpr::genCode.\n");
}


void Ast::typeCheck(Type* retType)
{
    if(root != nullptr)
        root->typeCheck(nullptr);
}

void ExprNode::typeCheck(Type* retType)
{
    if(debug1) printf("ExprNode::typeCheck\n");
}
void FunctionDef::typeCheck(Type* retType)
{
    // Todo
    // 思路：将是否一致的检查交给孩子结点，即可能含有ret的孩子节点
    // return;或return Exp;是一个stmt
    if(debug1) printf("FunctionDef::typeCheck.\n");
    hasretinst = 0;
    if(((FunctionType*)(this->se->getType()))->getRetType()->isVoid()){
        if(debug1) printf("this is a void type func.\n");
        this->stmt->typeCheck(((FunctionType*)(this->se->getType()))->getRetType());
    }
    else if(((FunctionType*)(this->se->getType()))->getRetType()->isInt()){
        if(debug1) printf("this is an int type func.\n");
        this->stmt->typeCheck(((FunctionType*)(this->se->getType()))->getRetType());
        if(hasretinst == 0){
            fprintf(stderr, "【typecheck】the func doesnt ret as required.(1)\n");
            assert(0);
        }
    }
    else if(((FunctionType*)(this->se->getType()))->getRetType()->isFloat()){
        if(debug1) printf("this is a float type func.\n");
        this->stmt->typeCheck(((FunctionType*)(this->se->getType()))->getRetType());
        if(hasretinst == 0){
            fprintf(stderr, "【typecheck】the func doesnt ret as required.(2)\n");
            assert(0);
        }
    }
    else{
        fprintf(stderr,"【typecheck】this func type is not allowed.\n");
    }
}
void BlankStmt::typeCheck(Type* retType) {
    if(debug1) printf("BlankStmt::typeCheck\n");
}
void CallExpr::typeCheck(Type* retType) {
    if(debug1) printf("CallExpr::typeCheck\n");
    if(!symbolEntry)
    {
        fprintf(stderr,"【typecheck】The function doesn't exist!\n");
    }
    //形参列表
    std::vector<ExprNode*>FuncFParams;
    ExprNode* cur=param;
    while(cur)
    {
        FuncFParams.push_back(cur);
        cur=(ExprNode*)(cur->getNext());
    }
    //实参列表
    std::vector<Type*> FuncRParams = ((FunctionType*)(this->symbolEntry->getType()))->getParamsType();

    //要将形参列表和实参列表进行类型检查
    if(FuncFParams.size()!=FuncRParams.size())//检查实参和形参的大小
    {
        fprintf(stderr,"【typecheck】The number of formal parameters and real parameters do not match!\n");
        assert(0);
    }
    for(long unsigned int i=0;i<FuncFParams.size();i++)//检查实参和形参类型是否一致
    {
        Type* ftype = FuncFParams[i]->getType();
        Type* rtype = FuncRParams[i];
        if(ftype->isArray() || ftype->isPointer() || rtype->isArray() || rtype->isPointer()){
            //【有时间再说】
        }
        else if(ftype->getTypeKind()!=rtype->getTypeKind())
        {
            fprintf(stderr,"【typecheck】The formal parameter and actual parameter types do not match!\n");
            //assert(0);
        }
    }
}
void UnaryExpr::typeCheck(Type* retType) {
    if(debug1) printf("UnaryExpr::typeCheck\n");
    if(expr->getType()->isVoid())
    {
        fprintf(stderr,"【typecheck】\'void\' type cannot be used to unary operation\n");
        assert(0);
    }
    if(expr != nullptr) expr->typeCheck(retType);
}
void BinaryExpr::typeCheck(Type* retType)
{
    // Todo
    if(debug1) printf("BinaryExpr::typeCheck\n");
    if(expr1->getType()->isVoid() || expr2->getType()->isVoid())
    {
        fprintf(stderr,"【typecheck】\'void\' type cannot be used to binary operation\n");
        assert(0);
    }
    if(expr1 != nullptr) expr1->typeCheck(retType);
    if(expr2 != nullptr) expr2->typeCheck(retType);
}

void Constant::typeCheck(Type* retType)
{
    // Todo
    if(debug1) printf("Constant::typeCheck\n");
}

void Id::typeCheck(Type* retType)
{
    // Todo
    if(debug1) printf("Id::typeCheck\n");
}

void IfStmt::typeCheck(Type* retType)
{
    // Todo
    if(debug1) printf("IfStmt::typeCheck\n");
    if(cond->getType()->isVoid())
    {
        fprintf(stderr, "【typecheck】IfStmt has a error type (\'void\') cond.\n");
        assert(0);
    }
    cond->typeCheck(retType);
    if(thenStmt!=nullptr) thenStmt->typeCheck(retType);
}

void IfElseStmt::typeCheck(Type* retType)
{
    // Todo
    if(debug1) printf("IfElseStmt::typeCheck\n");
    if(cond->getType()->isVoid())
    {
        fprintf(stderr, "【typecheck】IfElseStmt has a error type (\'void\') cond.\n");
        assert(0);
    }
    cond->typeCheck(retType);
    if(thenStmt!=nullptr) thenStmt->typeCheck(retType);
    if(elseStmt!=nullptr) elseStmt->typeCheck(retType);
}

void CompoundStmt::typeCheck(Type* retType)
{
    // Todo
    if(debug1) printf("CompoundStmt::typeCheck\n");
    if (stmt != nullptr)
        stmt->typeCheck(retType);
}

void SeqNode::typeCheck(Type* retType)
{
    if(debug1) printf("SeqNode::typeCheck\n");
    // Todo
    if(stmt1 != nullptr) stmt1->typeCheck(retType);
    if(stmt2 != nullptr) stmt2->typeCheck(retType);
}

void DeclStmt::typeCheck(Type* retType)
{
    if(debug1) printf("DeclStmt::typeCheck\n");
    // Todo
    //int a(id)=1(expr);这是一条DeclStmt
    if(expr != nullptr) expr->typeCheck(retType);

}

void ReturnStmt::typeCheck(Type* retType)
{
    // Todo
    if(debug1) printf("ReturnStmt::typeCheck\n");
    if(retValue != nullptr) retValue->typeCheck(retType);
    hasretinst = 1;
    if(retValue==nullptr && !retType->isVoid()){
        fprintf(stderr,"【typecheck】the func doesnt ret as required.(3)\n");
        assert(0);
    }
    if(retType->isVoid() && (retValue==nullptr || retValue->getType()->isVoid())){
        if(retValue==nullptr) 
        {
            if(debug1) printf("the def and real ret value are both VOID.\n");
        }
    }
    else if(retType->isInt() && retValue->getType()->isInt()){
        if(debug1) printf("the def and real ret value are both INT.\n");
    }
    else if(retType->isFloat() && retValue->getType()->isFloat()){
        if(debug1) printf("the def and real ret value are both FLOAT.\n");
    }
    else if(retType->isInt() && retValue->getType()->isFloat()){
        f2i=1;//做标记，表示返回值需要从float转为int
        if(debug1) printf("the def is INT, and real ret value is FLOAT.\n");
    }
    else if(retType->isFloat() && retValue->getType()->isInt()){
        i2f=1;//做标记，表示返回值需要从int转为float
        if(debug1) printf("the def is FLOAT, and real ret value is INT.\n");
    }
    else if(retValue->getType()->isArray())
    {
        //merge凳子

    }
    else{
        fprintf(stderr, "【typecheck】the func doesnt ret as required.(4)\n");
        assert(0);
    }
}

void AssignStmt::typeCheck(Type* retType)
{
    // Todo
    if(debug1) printf("AssignStmt::typeCheck\n");

    if(lval->getType()->isVoid() && expr->getType()->isVoid()){
        if(debug1) printf("the lval and expr types are both Void.\n");
    }
    else if(lval->getType()->isInt() && expr->getType()->isInt()){
        if(debug1) printf("the lval and expr types are both Int.\n");
        //检查：常量不可赋值
        IntType* it= dynamic_cast<IntType*> (lval->getType());
        if(it->isConst())
        {
            fprintf(stderr,"【typecheck】const lval is not assignable.\n");
            assert(0);
        }
    }
    else if(lval->getType()->isFloat() && expr->getType()->isFloat()){
        FloatType* ft= dynamic_cast<FloatType*> (lval->getType());
        if(ft->isConst())
        {
            fprintf(stderr,"【typecheck】const lval is not assignable.\n");
            assert(0);
        }
        if(debug1) printf("the lval and expr types are both Float.\n");
    }
    else if(lval->getType()->isArray())
    {
        //放个merge凳子
        Type* type = lval->getType();
    }
    else{
        // printf("%s   %s \n",lval->getType()->toStr().c_str(),expr->getType()->toStr().c_str());
        fprintf(stderr, "【typecheck】the lval type doesn't cohere expr type.\n");
        //assert(0);
    }
}

void ExprStmt::typeCheck(Type* retType)
{
    // Todo
    if(debug1) printf("ExprStmt::typeCheck\n");
    if(expr != nullptr) expr->typeCheck(retType);
}

void ContinueStmt::typeCheck(Type* retType)
{
    // Todo
    if(debug1) printf("ContinueStmt::typeCheck\n");
    //判断是否在while里
    if(stack4iteration.empty()){
        fprintf(stderr, "【typecheck】ContinueStmt outside whilestmt\n");
        assert(0);
    }
}

void BreakStmt::typeCheck(Type* retType)
{
    // Todo
    if(debug1) printf("BreakStmt::typeCheck\n");
    //判断是否在while里
    if(stack4iteration.empty()){
        fprintf(stderr, "【typecheck】BreakStmt outside whilestmt\n");
        assert(0);
    }
}

void WhileStmt::typeCheck(Type* retType)
{
    // Todo
    if(debug1) printf("WhileStmt::typeCheck\n");
    if(cond->getType()->isVoid())
    {
        fprintf(stderr, "【typecheck】IfElseStmt has a error type (\'void\') cond.\n");
        assert(0);
    }
    cond->typeCheck(retType);
    stack4iteration.push(this);
    if (stmt!=nullptr)
        stmt->typeCheck(retType);//while里可能包含函数，检查ret
    stack4iteration.pop();
}
//lab6-----------------end------------------



void Node::setNext(Node* node) 
{
    //找到链表的最后一个节点，并设置它的next为参数node
    Node* cur = this;
    while (cur->getNext()) {
        cur = cur->getNext();
    }
    if (cur == this) {
        this->next = node;
    } else {
        cur->setNext(node);
    }
}

void Ast::output()
{
    fprintf(yyout, "program\n");
    if(root != nullptr)
        //在下一行空四个格打印root的output（树状打印）
        root->output(4); 
}

void ExprNode::output(int level) 
{
    //level表示从左开始的空格数，便于打印输出语法树
    std::string name, type;
    name = symbolEntry->toStr();
    type = symbolEntry->getType()->toStr();
    fprintf(yyout, "%*cconst string\ttype:%s\t%s\n", level, ' ', type.c_str(), name.c_str());
    //%*c：宽度在 format 字符串中未指定，但是会作为附加整数值参数放置于要被格式化的参数之前。 
    //这里表示level作为宽度传入格式化字符串
}

void BinaryExpr::output(int level)
{
    std::string op_str;
    switch(op)
    {
        case ADD:
            op_str = "add";
            break;
        case SUB:
            op_str = "sub";
            break;
        case MUL:
            op_str = "mul";
            break;
        case DIV:
            op_str = "div";
            break;
        case MOD:
            op_str = "mod";
            break;
        case AND:
            op_str = "and";
            break;
        case OR:
            op_str = "or";
            break;
        case LESS:
            op_str = "less";
            break;
        case LESSEQUAL:
            op_str = "lessequal";
            break;
        case GREATER:
            op_str = "greater";
            break;
        case GREATEREQUAL:
            op_str = "greaterequal";
            break;
        case EQUAL:
            op_str = "equal";
            break;
        case NOTEQUAL:
            op_str = "notequal";
            break;
    }
    fprintf(yyout, "%*cBinaryExpr\top: %s\n", level, ' ', op_str.c_str());
    //在下两行分别再空4个格打印 expr1 和 expr1
    expr1->output(level + 4);
    
    expr2->output(level + 4);
}

int BinaryExpr::getValue() 
{
    int value;
    switch (op) {
        case ADD:
            value = expr1->getValue() + expr2->getValue();
            break;
        case SUB:
            value = expr1->getValue() - expr2->getValue();
            break;
        case MUL:
            value = expr1->getValue() * expr2->getValue();
            break;
        case DIV:
            value = expr1->getValue() / expr2->getValue();
            break;
        case MOD:
            value = expr1->getValue() % expr2->getValue();
            break;
        case AND:
            value = expr1->getValue() && expr2->getValue();
            break;
        case OR:
            value = expr1->getValue() || expr2->getValue();
            break;
        case LESS:
            value = expr1->getValue() < expr2->getValue();
            break;
        case LESSEQUAL:
            value = expr1->getValue() <= expr2->getValue();
            break;
        case GREATER:
            value = expr1->getValue() > expr2->getValue();
            break;
        case GREATEREQUAL:
            value = expr1->getValue() >= expr2->getValue();
            break;
        case EQUAL:
            value = expr1->getValue() == expr2->getValue();
            break;
        case NOTEQUAL:
            value = expr1->getValue() != expr2->getValue();
            break;
    }
    return value;
}

float BinaryExpr::getfloatValue() 
{
    float value;

    float value1;
    float value2;

    if(expr1->getfloatValue()==0)
    {
        value1= expr1->getValue();
    }
    else
    {
        value1 = expr1->getfloatValue();
    }

    if(expr2->getfloatValue()==0)
    {
        value2= expr2->getValue();
    }
    else
    {
        value2 = expr2->getfloatValue();
    }

    switch (op) {
        case ADD:
            value = value1 + value2;
            break;
        case SUB:
            value = value1 - value2;
            break;
        case MUL:
            value = value1 * value2;
            break;
        case DIV:
            value = value1 / value2;
            break;
        case MOD:
            value = (int)value1 % (int)value2;
            break;
        case AND:
            value = value1 && value2;
            break;
        case OR:
            value = value1 || value2;
            break;
        case LESS:
            value = value1 < value2;
            break;
        case LESSEQUAL:
            value = value1 <= value2;
            break;
        case GREATER:
            value = value1 > value2;
            break;
        case GREATEREQUAL:
            value = value1 >= value2;
            break;
        case EQUAL:
            value = value1 == value2;
            break;
        case NOTEQUAL:
            value = value1 != value2;
            break;
    }
    return value;
}

void UnaryExpr::output(int level) 
{
    std::string op_str;
    if(op == NOT)
        op_str = "not";
    else if(op == SUB)
        op_str = "sub";
    fprintf(yyout, "%*cUnaryExpr\top: %s\n", level, ' ', op_str.c_str());
    //在下一行再空4个格打印expr
    expr->output(level + 4);
}

int UnaryExpr::getValue() 
{
    int value;
    if(op == NOT)
        value = !(expr->getValue());
    else if(op == SUB)
        value = -(expr->getValue());
    return value;
}

float UnaryExpr::getfloatValue() 
{
    float value;
    if(op == NOT)
        value = !(expr->getValue());
    else if(op == SUB)
        value = -(expr->getValue());
    return value;
}

void CallExpr::output(int level)
{
    std::string name, type;
    int scope;
    //symbolEntry里面存的是函数名和类型、scope
    name = symbolEntry->toStr();
    type = symbolEntry->getType()->toStr();
    //把SymbolEntry类型向下转为他的子类IdentifierSymbolEntry，调用这个的getScope获取作用范围
    scope = dynamic_cast<IdentifierSymbolEntry*>(symbolEntry)->getScope();
    fprintf(yyout, "%*cCallExpr\tfunction name: %s\tscope: %d\ttype: %s\n",
            level, ' ', name.c_str(), scope, type.c_str());
    //下面再依次打印参数（ExprNode* param）
    Node* cur = param;
    while (cur) {
        cur->output(level + 4);
        cur = cur->getNext();
    }
}

void Constant::output(int level)
{
    std::string type, value;
    type = symbolEntry->getType()->toStr();
    value = symbolEntry->toStr();
    if (symbolEntry->getType()->isInt()) 
    {
        fprintf(yyout, "%*cIntegerLiteral\tvalue: %s\ttype: %s\n", level, ' ',
            value.c_str(), type.c_str());
    }
    else if(symbolEntry->getType()->isFloat()) 
    {
        fprintf(yyout, "%*cFloatLiteral\tvalue: %s\ttype: %s\n", level, ' ',
            value.c_str(), type.c_str());
    }
}

int Constant::getValue() 
{
    return ((ConstantSymbolEntry*)symbolEntry)->getValue();
}

float Constant::getfloatValue() 
{
    return ((ConstantSymbolEntry*)symbolEntry)->getfloatValue();
}

void Id::output(int level)
{
    std::string name, type;
    int scope;
    name = symbolEntry->toStr();
    type = symbolEntry->getType()->toStr();
    scope = dynamic_cast<IdentifierSymbolEntry*>(symbolEntry)->getScope();
    fprintf(yyout, "%*cId\tname: %s\tscope: %d\ttype: %s\n", level, ' ',
            name.c_str(), scope, type.c_str());
    //打印Id后面的数组列表，例如 arr[xx][xx] 的 [xx][xx]（这也是个表达式）
    //只有作为左值的时候，arrIndex才不为空，会打印下面的内容
    if(arrIndex!=nullptr)
    {
        ExprNode* cur = arrIndex;
        int i=1;
        while(cur!=nullptr)
        {
            cur->output(level+4*i);
            i++;
            cur=(ExprNode*)(cur->getNext());
        }
    }
}

int Id::getValue() 
{
    return ((IdentifierSymbolEntry*)symbolEntry)->getValue();
}



float Id::getfloatValue() 
{
    return ((IdentifierSymbolEntry*)symbolEntry)->getfloatValue();
}

//数组的初始化列表，还未实现完---------
//----------
void InitListExpr::output(int level) 
{
    std::string type;
    if (symbolEntry->getType())
        type = symbolEntry->getType()->toStr();
    fprintf(yyout, "%*cInitListExpr\ttype: %s\n", level, ' ', type.c_str());
    Node* cur = expr;  //初始化表达式列表的头节点
    //遍历列表头节点的兄弟节点
    while (cur) 
    {
        cur->output(level + 4);
        cur = cur->getNext();
    }
}

//---------
//数组的初始化列表，还未实现完---------

void CompoundStmt::output(int level)
{
    fprintf(yyout, "%*cCompoundStmt\n", level, ' ');
    if (stmt!=nullptr)
        stmt->output(level + 4);
}

void SeqNode::output(int level)
{
    //fprintf(yyout, "%*cSequence\n", level, ' ');
    stmt1->output(level);
    stmt2->output(level);
}

void DeclStmt::output(int level)
{
    fprintf(yyout, "%*cDeclStmt\n", level, ' ');
    //下一级打印id
    id->output(level + 4);
    //打印跟id同级的expr（expr可能为空）
    if (expr!=nullptr)
        expr->output(level + 4);
    //调用跟这个declstmt同级的定义语句
    if (this->getNext()) {
        this->getNext()->output(level);
    }
}

void BlankStmt::output(int level) 
{
    fprintf(yyout, "%*cBlankStmt\n", level, ' ');
}

void IfStmt::output(int level)
{
    fprintf(yyout, "%*cIfStmt\n", level, ' ');
    cond->output(level + 4);
    thenStmt->output(level + 4);
}

void IfElseStmt::output(int level)
{
    fprintf(yyout, "%*cIfElseStmt\n", level, ' ');
    cond->output(level + 4);
    thenStmt->output(level + 4);
    elseStmt->output(level + 4);
}

void WhileStmt::output(int level) 
{
    fprintf(yyout, "%*cWhileStmt\n", level, ' ');
    cond->output(level + 4);
    stmt->output(level + 4);
}
void BreakStmt::output(int level) {
    fprintf(yyout, "%*cBreakStmt\n", level, ' ');
}

void ContinueStmt::output(int level) {
    fprintf(yyout, "%*cContinueStmt\n", level, ' ');
}

void ReturnStmt::output(int level)
{
    fprintf(yyout, "%*cReturnStmt\n", level, ' ');
    if (retValue != nullptr) // 返回值可能为空
        retValue->output(level + 4);
}

void AssignStmt::output(int level)
{
    fprintf(yyout, "%*cAssignStmt\n", level, ' ');
    lval->output(level + 4);
    expr->output(level + 4);
}

void ExprStmt::output(int level) 
{
    fprintf(yyout, "%*cExprStmt\n", level, ' ');
    expr->output(level + 4);
}

void FunctionDef::output(int level)
{
    std::string name, type;
    name = se->toStr();
    type = se->getType()->toStr();
    fprintf(yyout, "%*cFunctionDefine function name: %s, type: %s\n", level, ' ', 
            name.c_str(), type.c_str());
    //打印参数
    if (params) 
        params->output(level + 4);
    //打印函数体
    stmt->output(level + 4);
}



TypeConversion::TypeConversion(Type* oldType, Type* newType, Operand* oldOp, BasicBlock* bb)
{
    this->oldOp=oldOp;
    this->bb=bb;
    //构造函数里面分流：判断执行从哪到哪的类型转换
    if(oldType->isInt())
    {
        if(newType->isBool())
        {
            this->newOp = new Operand(new TemporarySymbolEntry(newType, SymbolTable::getLabel()));
            int2boolConversion();
        }
        else if(newType->isFloat())
        {
            this->newOp = new Operand(new TemporarySymbolEntry(newType, SymbolTable::getLabel()));
            int2floatConversion();
        }
        else if(newType->isInt())
        {
            //不用转换
            this->newOp=oldOp;
        }
    }

    if(oldType->isFloat())
    {
        if(newType->isBool())
        {
            this->newOp = new Operand(new TemporarySymbolEntry(newType, SymbolTable::getLabel()));
            float2boolConversion();
        }
        else if(newType->isInt())
        {
            this->newOp = new Operand(new TemporarySymbolEntry(newType, SymbolTable::getLabel()));
            float2intConversion();
        }
        else if(newType->isFloat())
        {
            //不用转换
            this->newOp=oldOp;
        }
    }

    if(oldType->isBool())
    {
        if(newType->isInt())
        {
            this->newOp = new Operand(new TemporarySymbolEntry(newType, SymbolTable::getLabel()));
            bool2intConversion();
        }
        else if(newType->isFloat())
        {
            this->newOp = new Operand(new TemporarySymbolEntry(newType, SymbolTable::getLabel()));
            bool2floatConversion();
        }
        else if(newType->isBool())
        {
            //不用转换
            this->newOp=oldOp;
        }
    }



    if(oldType->isArray())
    {
        if(newType->isInt())
        {
            // 【有需要再做】
            // this->newOp = new Operand(new TemporarySymbolEntry(newType, SymbolTable::getLabel()));
            // arry2intConversion();
        }
        else if(newType->isFloat())
        {
            // 【有需要再做】
            // this->newOp = new Operand(new TemporarySymbolEntry(newType, SymbolTable::getLabel()));
            // arry2floatConversion();
        }
        else if(newType->isBool())
        {
            this->newOp = new Operand(new TemporarySymbolEntry(newType, SymbolTable::getLabel()));
            int2boolConversion();
        }
    }
}

void TypeConversion::int2floatConversion()
{
    new int2floatInstruction(newOp, oldOp, bb);
}

void TypeConversion::int2boolConversion()
{
    CmpInstruction* t=new CmpInstruction( CmpInstruction::NE, newOp, oldOp, new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0)), bb);
    t->set_hasMov();
}

void TypeConversion::float2intConversion()
{
    new float2intInstruction(newOp, oldOp, bb);
}

void TypeConversion::float2boolConversion()
{

}

void TypeConversion::bool2intConversion()
{
    new ZextInstruction( newOp,oldOp, bb);
}

void TypeConversion::bool2floatConversion()
{
    Operand* tempOp = new Operand(new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel()));
    new ZextInstruction( tempOp,oldOp, bb);
    new int2floatInstruction(newOp, tempOp, bb);
}



void TypeConversion::arry2boolConversion()
{
    // if (arr[1])，识别到了arr类型，实际是int到bool
    CmpInstruction* t=new CmpInstruction( CmpInstruction::NE, newOp, oldOp, new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0)), bb);
    t->set_hasMov();
}