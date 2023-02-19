#ifndef __AST_H__
#define __AST_H__

#include <fstream>
#include <iostream>
#include <stack>
#include "Type.h"
#include "SymbolTable.h"
#include"Operand.h"

class SymbolEntry;


class Unit;
class Function;
class BasicBlock;
class Instruction;
class IRBuilder;



class Node
{
private:
    static int counter;
    int seq;
    Node* next;//连接下一个节点

protected://lab6
    std::vector<Instruction*> true_list;
    std::vector<Instruction*> false_list;
    static IRBuilder *builder;
    void backPatch(std::vector<Instruction*> &list, BasicBlock*bb);
    std::vector<Instruction*> merge(std::vector<Instruction*> &list1, std::vector<Instruction*> &list2);


public:
    Node();
    int getSeq() const {return seq;};
    virtual void output(int level) = 0;
    void setNext(Node* node);
    Node* getNext() { return next; }

    //lab6
    static void setIRBuilder(IRBuilder*ib) {builder = ib;};
    virtual void typeCheck(Type* retType) = 0;
    virtual void genCode() = 0;
    std::vector<Instruction*>& trueList() {return true_list;}
    std::vector<Instruction*>& falseList() {return false_list;}
    //lab6



};

class ExprNode : public Node
{
private:
    int kind;  //标识expr类型
protected:
    SymbolEntry *symbolEntry;
    Type* type;
    enum {
        EXPR,
        INITLISTEXPR, //初始化表达式列表：给数组初始化的值
        UNARYEXPR, //一元运算表达式
        BINARYEXPR, //二元运算表达式
        CALLEXPR, //函数表达式
        CONSTANT, //常量表达式
        ID, // id
    };


    //lab6
    Operand *dst;// The result of the subtree is stored into dst.


public:
    //默认类型是Expr
    ExprNode(SymbolEntry* symbolEntry, int kind = EXPR) : kind(kind), symbolEntry(symbolEntry){};
    SymbolEntry* getSymbolEntry() { return symbolEntry; };

    void output(int level);
    virtual int getValue() { return 0; };
    virtual float getfloatValue() { return 0; }; //新加：float类型
    bool isExpr() const { return kind == EXPR; };
    bool isInitListExpr() const { return kind == INITLISTEXPR; };
    bool isUnaryExpr() const { return kind == UNARYEXPR; };
    bool isBinaryExpr() const { return kind == BINARYEXPR; };
    bool isCallExpr() const { return kind == CALLEXPR; };
    bool isConstant() const { return kind == CONSTANT; };
    bool isid() const { return kind == ID; };

    virtual Type* getType() { return type; };


    //lab6
    Operand* getOperand() {return dst;};
    void setOperand(Operand *op){dst=op;};
    SymbolEntry* getSymPtr() {return symbolEntry;};
    virtual void typeCheck(Type* retType);
    void genCode();
};

class BinaryExpr : public ExprNode //二元运算
{
private:
    int op;
    ExprNode *expr1, *expr2;
public:
    enum {ADD, SUB, MUL, DIV, MOD,
          AND, OR, 
          LESS, LESSEQUAL, GREATER, GREATEREQUAL, EQUAL, NOTEQUAL};
    BinaryExpr(SymbolEntry *se, int op, ExprNode*expr1, ExprNode*expr2) : ExprNode(se), op(op), expr1(expr1), expr2(expr2)
    {
        //lab6
        //printf("BinaryExpr::BinaryExpr\n");
        dst = new Operand(se);
        type = se->getType();
    };
    void output(int level);
    int getValue();
    float getfloatValue();

    //lab6
    void typeCheck(Type* retType);
    void genCode();
};

class UnaryExpr : public ExprNode //一元运算
{
private:
    int op;
    ExprNode* expr;
    

public:
    enum { NOT, SUB };
    UnaryExpr(SymbolEntry* se, int op, ExprNode* expr)
    : ExprNode(se), op(op), expr(expr)
    {
        //lab6
        dst = new Operand(se);
        type = se->getType();

    }
    void output(int level);
    int getValue();
    float getfloatValue();
    void typeCheck(Type* retType);
    void genCode();
};

//函数表达式，继承于表达式类型，表示某个函数作为表达式可以返回值
class CallExpr : public ExprNode 
{
private:
    ExprNode* param;

public:
    CallExpr(SymbolEntry* se, ExprNode* param = nullptr)
        : ExprNode(se), param(param)
    {
        //lab6
        this->type = ((FunctionType*) (symbolEntry->getType()))->getRetType();
        dst = new Operand(new TemporarySymbolEntry(this->type, SymbolTable::getLabel()));
    };
    void output(int level);
    void typeCheck(Type* retType);
    void genCode();
};

class Constant : public ExprNode 
{
   public:
    Constant(SymbolEntry* se) : ExprNode(se)
    {
        //lab6
        dst = new Operand(se);
        type = se->getType();
    };
    void output(int level);
    int getValue();
    float getfloatValue();

    //lab6
    void typeCheck(Type* retType);
    void genCode();
};

class Id : public ExprNode 
{
   private:
    ExprNode* arrIndex;//用于连接数组Id后面的[xxx]

   public:
    Id(SymbolEntry* se, ExprNode* arrIndex = nullptr)
        : ExprNode(se), arrIndex(arrIndex)
        {
            arrIndex = nullptr;
            type = se->getType();
            // //lab6
            // SymbolEntry *temp = new TemporarySymbolEntry(se->getType(), SymbolTable::getLabel()); 
            // dst = new Operand(temp);
            
            };
    void output(int level);
    int getValue();
    float getfloatValue();
    Type* getType(){return type;};

    //lab6
    void typeCheck(Type* retType);
    void genCode();
    void addIndex(ExprNode* declIndex){arrIndex = declIndex; }

};


//初始化表达式列表：给数组初始化的值
class InitListExpr : public ExprNode  //给数组初始化的值，如 {{1,2,3},{4,5,6}} or {1,2,3} or {{},{1,2,3}} ...
{
   private:
    ExprNode* expr;//初始化表达式列表的头节点
    int childCnt; //初始化表达式列表的节点个数
   public:
    InitListExpr(SymbolEntry* se, ExprNode* expr = nullptr): ExprNode(se, INITLISTEXPR), expr(expr) 
    {
        type = se->getType();//不是Nullptr
        childCnt = 0;
    };
    void output(int level);
    ExprNode* getExpr() { return expr; };
    void addChild(){childCnt++;};
    bool enoughChild(){
        ArrayType* type = (ArrayType*)(this->symbolEntry->getType());
        return childCnt == type->getLength();
    }
    bool isEmpty() { return childCnt == 0; };
    //lab6
    void typeCheck(Type* retType);
    void genCode();
};

class StmtNode : public Node
{
public:
    virtual void typeCheck(Type* retType = nullptr) = 0;
};

// 在BlockStmt的文法里用到：
//文法：(LBRACE Stmts RBRACE | LBRACE RBRACE )
class CompoundStmt : public StmtNode
{
private:
    StmtNode *stmt;
public:
    //默认是空指针——因为语句块可能没有语句（空语句块）
    CompoundStmt(StmtNode *stmt = nullptr) : stmt(stmt) {};
    void output(int level);

    //lab6
    void typeCheck(Type* retType);
    void genCode();

};

// 在Stmts的文法里用到：
//文法：Stmt | Stmts Stmt
class SeqNode : public StmtNode
{
private:
    //连接两个stmt
    StmtNode *stmt1, *stmt2;
public:
    SeqNode(StmtNode *stmt1, StmtNode *stmt2) : stmt1(stmt1), stmt2(stmt2){};
    void output(int level);


    //lab6
    void typeCheck(Type* retType);
    void genCode();
};

//文法：(Type VarDefList SEMICOLON) | (CONST Type ConstDefList SEMICOLON)
// 递归的文法，具体实现见yacc
class DeclStmt : public StmtNode
{
private:
    Id *id;
    ExprNode* expr; //见上下文无关文法
public:
    DeclStmt(Id *id, ExprNode *expr = nullptr) : id(id), expr(expr){ };
    void output(int level);
    Id* getId() { return id; };
    ExprNode* getexpr() { return expr; };

    //lab6
    void typeCheck(Type* retType);
    void genCode();
};

//新加：实现空语句（文法：SEMICOLON）
class BlankStmt : public StmtNode 
{ 
   public:
    BlankStmt(){};
    void output(int level);
    void typeCheck(Type* retType);
    void genCode();
    
};

//文法：(IF LPAREN Cond RPAREN Stmt %prec THEN)|(IF LPAREN Cond RPAREN Stmt ELSE Stmt)
class IfStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *thenStmt;
public:
    IfStmt(ExprNode *cond, StmtNode *thenStmt) : cond(cond), thenStmt(thenStmt){};
    void output(int level);

    //lab6
    void typeCheck(Type* retType);
    void genCode();
};

//文法：(IF LPAREN Cond RPAREN Stmt %prec THEN) | (IF LPAREN Cond RPAREN Stmt ELSE Stmt)
class IfElseStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *thenStmt;
    StmtNode *elseStmt;
public:
    IfElseStmt(ExprNode *cond, StmtNode *thenStmt, StmtNode *elseStmt) : cond(cond), thenStmt(thenStmt), elseStmt(elseStmt) {};
    void output(int level);

    //lab6
    void typeCheck(Type* retType);
    void genCode();
};

//新加：while语句（文法：WHILE LPAREN Cond RPAREN Stmt）
class WhileStmt : public StmtNode 
{
private:
    ExprNode* cond;
    StmtNode* stmt;
    BasicBlock* while_end_bb;
    BasicBlock* while_continue_bb;
public:
    WhileStmt(ExprNode* cond, StmtNode* stmt) : cond(cond), stmt(stmt){};
    void output(int level);

    //lab6
    void typeCheck(Type* retType);
    void genCode();
    BasicBlock* get_while_end_bb(){return while_end_bb;};
    BasicBlock* get_while_continue_bb(){return while_continue_bb;};

};

//新加：break语句（文法：BREAK SEMICOLON）
class BreakStmt : public StmtNode 
{
public:
    BreakStmt(){};
    void output(int level);

    //lab6
    void typeCheck(Type* retType);
    void genCode();

};

//新加：continue语句（文法：CONTINUE SEMICOLON）
class ContinueStmt : public StmtNode 
{
public:
    ContinueStmt(){};
    void output(int level);

    //lab6
    void typeCheck(Type* retType);
    void genCode();

};

//(文法：RETURN SEMICOLON | RETURN Exp SEMICOLON)
class ReturnStmt : public StmtNode
{
private:
    ExprNode *retValue;
    bool i2f;
    bool f2i;
public:
    //retValue默认为空，表示没有返回值
    ReturnStmt(ExprNode*retValue=nullptr) : retValue(retValue) {i2f=f2i=0;};
    void output(int level);

    //lab6
    void typeCheck(Type* retType);
    void genCode();
};

//（文法：LVal ASSIGN Exp SEMICOLON）
class AssignStmt : public StmtNode
{
private:
    ExprNode *lval;
    ExprNode *expr;
public:
    AssignStmt(ExprNode *lval, ExprNode *expr) : lval(lval), expr(expr) {};
    void output(int level);

    //lab6
    void typeCheck(Type* retType);
    void genCode();

};

//新加：表达式语句（文法：Exp SEMICOLON）
class ExprStmt : public StmtNode 
{
private:
    ExprNode *expr;
public:
    ExprStmt(ExprNode* expr) : expr(expr){};
    void output(int level);

    //lab6
    void typeCheck(Type* retType);
    void genCode();
};

//文法：Type ID LPAREN MaybeFuncFParams RPAREN BlockStmt 
//下面的SymbolEntry是给ID用的，params是给MaybeFuncFParams参数列表，stmt是给BlockStmt
class FunctionDef : public StmtNode
{
private:
    SymbolEntry *se;
    DeclStmt* params;//参数列表
    StmtNode* stmt;
public:
    FunctionDef(SymbolEntry *se, DeclStmt *params, StmtNode *stmt): se(se), params(params), stmt(stmt){};    
    void output(int level);

    //lab6
    void typeCheck(Type* retType);
    void genCode();
};

class Ast
{
private:
    Node* root;
public:
    Ast() {root = nullptr;}
    void setRoot(Node*n) {root = n;}
    void output();

    //lab6
    void typeCheck(Type* retType);
    void genCode(Unit* unit);

};

#endif

class TypeConversion
{
    BasicBlock* bb;
    Operand* oldOp;
    Operand* newOp;
public:
    TypeConversion(Type* oldType, Type* newType, Operand* oldOp, BasicBlock* bb);
    void int2floatConversion();
    void int2boolConversion();
    void float2intConversion();
    void float2boolConversion();
    void bool2intConversion();
    void bool2floatConversion();
    void arry2boolConversion();
    Operand* get_newOp(){return newOp;};
};