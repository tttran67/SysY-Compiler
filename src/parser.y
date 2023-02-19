%code top{
    #include <iostream>
    #include <assert.h>
    #include "parser.h"
    extern Ast ast;
    int yylex();
    int yyerror( char const * );

    Type* IdType; // 定义的类型
    ArrayType* arrayType; // 数组类型
    int* arrayValue; // int型数组
    float* arrayfloatValue; // float型数组
    int ptr = 0;
    bool handlingInt = 1;// 为1表示处理int中,为0表示处理flt中
    int totalsize = 0;
    int stride = 0;
    int leftCnt = 0;
    std::stack<InitListExpr*> stk4array;
    int finalptr = 0;
    std::vector<ExprNode*> arrayExprvec;
    std::stack<int> stk4finalptr;
    bool debug = 0;
}

%code requires {
    #include "Ast.h"
    #include "SymbolTable.h"
    #include "Type.h"
}

%union {
    int itype;
/*
    新加float类型
*/
    float ftype;
    char* strtype;
    StmtNode* stmttype;
    ExprNode* exprtype;
    Type* type;
    SymbolEntry* se;
}

%start Program
/*
新加WHILE LBRACKET RBRACKET COMMA CONST RETURN CONTINUE BREAK MUL DIV MOD LESSEQUAL GREATER GREATEREQUAL等
*/
%token <strtype> ID 
%token <itype> INTEGER 
%token <ftype> FLOATING
%token IF ELSE WHILE 
%token INT VOID FLOAT
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON LBRACKET RBRACKET COMMA
%token ADD SUB MUL DIV MOD OR AND LESS LESSEQUAL GREATER GREATEREQUAL ASSIGN EQUAL NOTEQUAL NOT
%token CONST
%token RETURN CONTINUE BREAK

/*
非终结符
*/
%nterm <stmttype> Stmts Stmt AssignStmt ExprStmt BlockStmt IfStmt WhileStmt BreakStmt ContinueStmt ReturnStmt DeclStmt FuncDef ConstDeclStmt VarDeclStmt ConstDefList VarDef ConstDef VarDefList FuncFParam FuncFParams BlankStmt FuncFParamsOrEmpty
%nterm <exprtype> Exp AddExp Cond LOrExp PrimaryExp LVal RelExp LAndExp MulExp ConstExp EqExp UnaryExp InitVal ConstInitVal InitValList ConstInitValList FuncArrayIndices FuncRParams ArrayExpList
%nterm <type> Type

/*
终结符 else 的优先级高于 then。
*/
%precedence THEN
%precedence ELSE
%%
Program
    : Stmts {
        ast.setRoot($1);
    }
    ;
Stmts
    : Stmt {$$=$1;}
    | Stmts Stmt{
        $$ = new SeqNode($1, $2);
    }
    ;
Stmt
    : AssignStmt {$$=$1;}
    | ExprStmt {$$=$1;}
    | BlockStmt {$$=$1;}
    | BlankStmt {$$=$1;}
    | IfStmt {$$=$1;}
    | WhileStmt {$$=$1;}
    | BreakStmt {$$=$1;}
    | ContinueStmt {$$=$1;}
    | ReturnStmt {$$=$1;}
    | DeclStmt {$$=$1;}
    | FuncDef {$$=$1;}
    ;
LVal
    : ID {
        SymbolEntry *se;
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            fprintf(stderr, "【typecheck】identifier \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            assert(se != nullptr);
        }
        $$ = new Id(se);
        delete []$1;
    }
/*
    左值可能是数组类型，例如arr[x][y]，其中ArrayExpList表示[x][y]
    并且当Id是左值且为数组类型时，它的属性ExprNode* arrIndex（数组下标列表）要赋值，即 new Id(se, $2);
*/
    | ID ArrayExpList{
        if(debug) printf("Lval:ID ArrayExpList.\n");
        SymbolEntry* se;
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            fprintf(stderr, "【typecheck】identifier \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            assert(se != nullptr);
        }
        if(debug) printf("%s   \n",se->getType()->toStr().c_str());
        $$ = new Id(se, $2);
        delete []$1;
    }
    ;
AssignStmt
    :
    LVal ASSIGN Exp SEMICOLON {
        $$ = new AssignStmt($1, $3);
    }
    ;
ExprStmt
    : Exp SEMICOLON {
        $$ = new ExprStmt($1);
    }
    ;
BlankStmt
    : SEMICOLON {
        $$ = new BlankStmt();
    }
    ;
BlockStmt
    :   LBRACE 
        {identifiers = new SymbolTable(identifiers);} 
        Stmts RBRACE {
            $$ = new CompoundStmt($3);
            SymbolTable *top = identifiers;
            identifiers = identifiers->getPrev();
            delete top;
        }
        | LBRACE RBRACE {
        $$ = new CompoundStmt();
    }
    ;
/*
SysY 语言中的 if 语句并没有终结符 then，在 yacc 中我们可以使用%prec 关键字，将终结符
then 的优先级赋给产生式。
*/
IfStmt
    : IF LPAREN Cond RPAREN Stmt %prec THEN {
        $$ = new IfStmt($3, $5);
    }
    | IF LPAREN Cond RPAREN Stmt ELSE Stmt {
        $$ = new IfElseStmt($3, $5, $7);
    }
    ;
WhileStmt
    : WHILE LPAREN Cond RPAREN Stmt {
        $$ = new WhileStmt($3, $5);
    }
    ;
BreakStmt
    : BREAK SEMICOLON {
        $$ = new BreakStmt();
    }
    ;
ContinueStmt
    : CONTINUE SEMICOLON {
        $$ = new ContinueStmt();
    }
    ;
/*
补充返回值为空的情况
*/
ReturnStmt
    :
    RETURN SEMICOLON{
        if(debug) printf("ReturnStmt:RETURN SEMICOLON.\n");
        $$ = new ReturnStmt();
    }
    | RETURN Exp SEMICOLON{
        if(debug) printf("ReturnStmt:RETURN Exp SEMICOLON.\n");
        $$ = new ReturnStmt($2);
    }
    ;
Exp
    :
    AddExp {$$ = $1;}
    ;
Cond
    :
    LOrExp {$$ = $1;}
    ;
/*
新加 '(' exp ')' 的情况
*/
PrimaryExp
    :
    LPAREN Exp RPAREN {
        $$ = $2;
    }
    | LVal {
        $$ = $1;
    }
    | INTEGER {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::intType, $1);
        $$ = new Constant(se);
    }
    | FLOATING {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::floatType, $1);
        $$ = new Constant(se);
    }
    ;
UnaryExp 
    : 
    PrimaryExp {$$ = $1;}
/*
函数表达式，可作为一元运算表达式，调用class CallExpr
*/
    | ID LPAREN FuncRParams RPAREN {
        SymbolEntry* se;
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            fprintf(stderr, "【typecheck】function \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            assert(se != nullptr);
        }
        $$ = new CallExpr(se, $3);
    }
    | ID LPAREN RPAREN {
        SymbolEntry* se;
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            fprintf(stderr, "【typecheck】function \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            assert(se != nullptr);
        }
        $$ = new CallExpr(se);
    }
    | ADD UnaryExp {$$ = $2;}
    | SUB UnaryExp {
        Type* exprType = $2->getType();
        SymbolEntry* se;
        if(exprType->getSize()!=1)
            se = new TemporarySymbolEntry(exprType, SymbolTable::getLabel());
/* 
 - expr（expr为bool类型），需要进行类型转换为int，类型转换将在ast.cpp进行
*/
        else
            se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        ExprNode* tmpExpr = new UnaryExpr(se, UnaryExpr::SUB, $2);
        $$ = tmpExpr;
    }
    | NOT UnaryExp {
/*
        Type* exprType = $2->getType();
        SymbolEntry* se = new TemporarySymbolEntry(exprType, SymbolTable::getLabel());
*/
/*
    lab6
*/
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new UnaryExpr(se, UnaryExpr::NOT, $2);
    }
    ;
MulExp
    : UnaryExp {$$ = $1;}
    | MulExp MUL UnaryExp {
         SymbolEntry* se;

        Type* type1 = $1->getType();
        Type* type2 = $3->getType();


        if($1->getType()->isPointer())
        {
            PointerType* t_type = dynamic_cast<PointerType*>($1->getType());
            type1=t_type->getBasicEleType();

        }
        else if($1->getType()->isArray())
        {
            ArrayType* t_type = dynamic_cast<ArrayType*>($1->getType());
            type1=t_type->getBasicEleType();
        }


        if($3->getType()->isPointer())
        {
            PointerType* t_type = dynamic_cast<PointerType*>($3->getType());
            type2=t_type->getBasicEleType();

        }
        else if($3->getType()->isArray())
        {
            ArrayType* t_type = dynamic_cast<ArrayType*>($3->getType());
            type2=t_type->getBasicEleType();
        }


        if (type1->isFloat() || type2->isFloat()) 
        {
            se = new TemporarySymbolEntry(TypeSystem::floatType, SymbolTable::getLabel());
            $$ = new BinaryExpr(se, BinaryExpr::MUL, $1, $3);
        } 
        else 
        {
            se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
            $$ = new BinaryExpr(se, BinaryExpr::MUL, $1, $3);
        }
    }
    | MulExp DIV UnaryExp {
          SymbolEntry* se;

        Type* type1 = $1->getType();
        Type* type2 = $3->getType();

        
        if($1->getType()->isPointer())
        {
            PointerType* t_type = dynamic_cast<PointerType*>($1->getType());
            type1=t_type->getBasicEleType();

        }
        else if($1->getType()->isArray())
        {
            ArrayType* t_type = dynamic_cast<ArrayType*>($1->getType());
            type1=t_type->getBasicEleType();
        }


        if($3->getType()->isPointer())
        {
            PointerType* t_type = dynamic_cast<PointerType*>($3->getType());
            type2=t_type->getBasicEleType();

        }
        else if($3->getType()->isArray())
        {
            ArrayType* t_type = dynamic_cast<ArrayType*>($3->getType());
            type2=t_type->getBasicEleType();
        }


        if (type1->isFloat() || type2->isFloat()) 
        {
            se = new TemporarySymbolEntry(TypeSystem::floatType, SymbolTable::getLabel());
            $$ = new BinaryExpr(se, BinaryExpr::DIV, $1, $3);
        } 
        else 
        {
            se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
            $$ = new BinaryExpr(se, BinaryExpr::DIV, $1, $3);
        }
    }
    | MulExp MOD UnaryExp {
        SymbolEntry* se;
        if ($1->getType()->isFloat() || $3->getType()->isFloat()) 
        {
            
            se = new TemporarySymbolEntry(TypeSystem::floatType, SymbolTable::getLabel());
            $$ = new BinaryExpr(se, BinaryExpr::MOD, $1, $3);
        }
        else
        {
            se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
            $$ = new BinaryExpr(se, BinaryExpr::MOD, $1, $3);
        }
    }
    ;
AddExp
    : MulExp {$$ = $1;}
    | AddExp ADD MulExp {
        SymbolEntry* se;

        Type* type1 = $1->getType();
        Type* type2 = $3->getType();

        
        if($1->getType()->isPointer())
        {
            PointerType* t_type = dynamic_cast<PointerType*>($1->getType());
            type1=t_type->getBasicEleType();

        }
        else if($1->getType()->isArray())
        {
            ArrayType* t_type = dynamic_cast<ArrayType*>($1->getType());
            type1=t_type->getBasicEleType();
        }


        if($3->getType()->isPointer())
        {
            PointerType* t_type = dynamic_cast<PointerType*>($3->getType());
            type2=t_type->getBasicEleType();

        }
        else if($3->getType()->isArray())
        {
            ArrayType* t_type = dynamic_cast<ArrayType*>($3->getType());
            type2=t_type->getBasicEleType();
        }


        if (type1->isFloat() || type2->isFloat()) 
        {
            se = new TemporarySymbolEntry(TypeSystem::floatType, SymbolTable::getLabel());
            $$ = new BinaryExpr(se, BinaryExpr::ADD, $1, $3);
        } 
        else 
        {
            se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
            $$ = new BinaryExpr(se, BinaryExpr::ADD, $1, $3);
        }
    }
    | AddExp SUB MulExp {
        SymbolEntry* se;

        Type* type1 = $1->getType();
        Type* type2 = $3->getType();

        
        if($1->getType()->isPointer())
        {
            PointerType* t_type = dynamic_cast<PointerType*>($1->getType());
            type1=t_type->getBasicEleType();

        }
        else if($1->getType()->isArray())
        {
            ArrayType* t_type = dynamic_cast<ArrayType*>($1->getType());
            type1=t_type->getBasicEleType();
        }


        if($3->getType()->isPointer())
        {
            PointerType* t_type = dynamic_cast<PointerType*>($3->getType());
            type2=t_type->getBasicEleType();

        }
        else if($3->getType()->isArray())
        {
            ArrayType* t_type = dynamic_cast<ArrayType*>($3->getType());
            type2=t_type->getBasicEleType();
        }


        if (type1->isFloat() || type2->isFloat()) 
        {
            se = new TemporarySymbolEntry(TypeSystem::floatType, SymbolTable::getLabel());
            $$ = new BinaryExpr(se, BinaryExpr::SUB, $1, $3);
        } 
        else 
        {
            se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
            $$ = new BinaryExpr(se, BinaryExpr::SUB, $1, $3);
        }
    }
    ;
RelExp
    :
    AddExp {$$ = $1;}
    | RelExp LESS AddExp{
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::LESS, $1, $3);
    }
    | RelExp LESSEQUAL AddExp{
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::LESSEQUAL, $1, $3);
    }
    | RelExp GREATER AddExp{
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::GREATER, $1, $3);
    }
    | RelExp GREATEREQUAL AddExp{
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::GREATEREQUAL, $1, $3);
    }
EqExp
    : RelExp { $$ = $1; }
    | EqExp EQUAL RelExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::EQUAL, $1, $3);
    }
    | EqExp NOTEQUAL RelExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::NOTEQUAL, $1, $3);
    }
    ;
LAndExp
    :
    EqExp {$$ = $1;}
    |
    LAndExp AND EqExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::AND, $1, $3);
    }
    ;
LOrExp
    :
    LAndExp {$$ = $1;}
    |
    LOrExp OR LAndExp
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::OR, $1, $3);
    }
    ;
ConstExp
    : AddExp { $$ = $1; }
    ;
Type
    : INT {
        $$ = TypeSystem::intType;
        IdType = TypeSystem::intType;
    }
    | VOID {
        $$ = TypeSystem::voidType;
        IdType = TypeSystem::voidType;

    }
    | FLOAT {
        $$ = TypeSystem::floatType;
        IdType = TypeSystem::floatType;
    }
    ;
DeclStmt
    : VarDeclStmt { $$ = $1; if(debug) printf("DeclStmt--VarDeclStmt\n");}
    | ConstDeclStmt { $$ = $1; }
    ;
VarDeclStmt
    : Type VarDefList SEMICOLON { $$ = $2; }
    ;
ConstDeclStmt
    : CONST Type ConstDefList SEMICOLON {$$ = $3;}
    ;
VarDefList
    : VarDefList COMMA VarDef {
        $$ = $1;
        $1->setNext($3);
    } 
    | VarDef { $$ = $1; if(debug) printf("VarDefList-VarDef\n"); }
    ;
ConstDefList
    : ConstDefList COMMA ConstDef {
        $$ = $1;
        $1->setNext($3);
    }
    | ConstDef { $$ = $1; }
    ;
VarDef
    : ID {
        if(debug) printf("VarDef:ID.\n");
        SymbolEntry* se;
        //这里IdType是Int或float
        se = new IdentifierSymbolEntry(IdType, $1, identifiers->getLevel());
        if(identifiers->lookup_thistable($1) != nullptr){
            fprintf(stderr, "【vardef】the var has been defined twice.\n");
            assert(0);
        }
        identifiers->install($1, se);
        $$ = new DeclStmt(new Id(se));
        delete []$1;
    }
    | ID ArrayExpList {
        if(debug) printf("VarDef:ID ArrayExpList.\n");
        SymbolEntry* se;
        // 这里要递归定义
        ExprNode* Index = $2;
        std::stack<int> stk4Index;
        while(Index){
            stk4Index.push(Index->getValue());
            Index = (ExprNode*)(Index->getNext());
        }
        Type *eletype = TypeSystem::intType;        
        if(IdType->isInt()){
            // do nothing
        }
        else if(IdType->isFloat()){
            eletype = TypeSystem::floatType;
        }
        else{
            fprintf(stderr, "【vardef】array type not allowed.\n");
            assert(0);
        }
        // arr[2][3][4]
        Type* type = new ArrayType(eletype,eletype,stk4Index.top());//拿到4
        stk4Index.pop();
        while(!stk4Index.empty()){// 例如arry[1][2]
            type = new ArrayType(type,eletype,stk4Index.top());
            stk4Index.pop();
        }
        arrayType = (ArrayType*)type;
        se = new IdentifierSymbolEntry(type, $1, identifiers->getLevel());//基本类型仍然是int/float
        if(identifiers->lookup_thistable($1) != nullptr){// int a = 1;int a[10];不允许
            fprintf(stderr, "【vardef】the var has been defined twice.\n");
            assert(0);
        }
        identifiers->install($1, se);
        Id* id = new Id(se);
        id->addIndex((ExprNode*)$2);
        $$ = new DeclStmt(id);
        delete []$1;
    }
    | ID ASSIGN InitVal {
        if(debug) printf("VarDef:ID ASSIGN InitVal.\n");
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(IdType, $1, identifiers->getLevel());
        if(identifiers->lookup_thistable($1) != nullptr){
            fprintf(stderr, "【vardef】the var has been defined twice.\n");
            assert(0);
        }
        identifiers->install($1, se);


        if (IdType->isInt() && $3->getType()->isFloat()) {

            if(debug) printf("IdType->isInt() && $3->getType()->isFloat()\n");

            float val = $3->getfloatValue();
            
            if(debug) printf("IdType->isInt() && $3->getType()->isFloat()___________end\n");

            int finalval = (int)val;
            ((IdentifierSymbolEntry*)se)->setValue(finalval);


        }
        else if (IdType->isFloat() && $3->getType()->isInt()) {
            int val = $3->getValue();
            float finalval = (float)val;
            ((IdentifierSymbolEntry*)se)->setfloatValue(finalval);        
        }
        else
        {
            if(IdType->isInt()){
                int finalval = $3->getValue();
                ((IdentifierSymbolEntry*)se)->setValue(finalval);
            }
            else if(IdType->isFloat()){

                if(debug) printf("IdType->isFloat()\n");

                float finalval = $3->getfloatValue();

                if(debug) printf("IdType->isFloat()_____end\n");

                ((IdentifierSymbolEntry*)se)->setfloatValue(finalval);   
            }
        }
        $$ = new DeclStmt(new Id(se), $3);
        delete []$1;
    }

    | ID ArrayExpList ASSIGN {
        if(debug) printf("ID ArrayExpList ASSIGN InitVal.\n");
        ptr = 0;
        SymbolEntry* se;
        // 这里要递归定义
        ExprNode* Index = $2;
        std::stack<int> stk4Index;
        while(Index){
            stk4Index.push(Index->getValue());
            Index = (ExprNode*)(Index->getNext());
        }
        Type *eletype = TypeSystem::intType;        
        if(IdType->isInt()){
            // do nothing
            handlingInt = 1;
        }
        else if(IdType->isFloat()){
            handlingInt = 0;
            eletype = TypeSystem::floatType;
        }
        else{
            fprintf(stderr, "【vardef】array type not allowed.\n");
            assert(0);
        }
        Type* type = new ArrayType(eletype,eletype,stk4Index.top());
        stride = stk4Index.top();
        totalsize = stk4Index.top();
        stk4Index.pop();
        while(!stk4Index.empty()){// 例如arry[1][2]
            type = new ArrayType(type,eletype,stk4Index.top());
            totalsize *= stk4Index.top();         
            stk4Index.pop();
        }
       arrayType = (ArrayType*)type;
        if(handlingInt){
            arrayValue = new int [totalsize];
        }
        else{
            arrayfloatValue = new float [totalsize];
        }
        se = new IdentifierSymbolEntry(type, $1, identifiers->getLevel());//基本类型仍然是int/float
        if(identifiers->lookup_thistable($1) != nullptr){// int a = 1;int a[10];不允许
            fprintf(stderr, "【vardef】the var has been defined twice.\n");
            assert(0);
        }
        while(!stk4array.empty()){
            stk4array.pop();
        }
        $<se>$ = se;//把se赋给$$
        arrayExprvec.clear();
        while(!stk4finalptr.empty())
            stk4finalptr.pop();
    }
    InitVal {
        SymbolEntry* se = $<se>4;
        if(handlingInt) {
            ((IdentifierSymbolEntry*)se)->setArrayValue(arrayValue);
        }
        else {
            ((IdentifierSymbolEntry*)se)->setfloatArrayValue(arrayfloatValue);
        }
        ((IdentifierSymbolEntry*)se)->setarrayExprvec(arrayExprvec);
        if(debug)
            for(int i = 0;i < 8; i++)
                printf("%d\n",arrayValue[i]);
        identifiers->install($1, se);
        Id* id = new Id(se);
        id->addIndex((ExprNode*)$2);
        $$ = new DeclStmt(id,$5);
        delete []$1;
    }
    ;
ConstDef
    : ID ASSIGN ConstInitVal {
        if(debug) printf("ConstDef:ID ASSIGN ConstInitVal.\n");
        SymbolEntry* se;
        if (IdType->isInt() && $3->getType()->isFloat()) {
            se = new IdentifierSymbolEntry(TypeSystem::constIntType, $1, identifiers->getLevel());
            if(identifiers->lookup_thistable($1) != nullptr){
                fprintf(stderr, "【constdef】the const has been defined twice.\n");
                assert(0);
            }
            identifiers->install($1, se);
            float val = $3->getfloatValue();
            int finalval = (int)val;
            ((IdentifierSymbolEntry*)se)->setValue(finalval);
        }
        else if (IdType->isFloat() && $3->getType()->isInt()) {
            se = new IdentifierSymbolEntry(TypeSystem::constFloatType, $1, identifiers->getLevel());
            if(identifiers->lookup_thistable($1) != nullptr){
                fprintf(stderr, "【constdef】the const has been defined twice.\n");
                assert(0);
            }
            identifiers->install($1, se);
            int val = $3->getValue();
            float finalval = (float)val;
            ((IdentifierSymbolEntry*)se)->setfloatValue(finalval);        
        }
        else
        {
            if(IdType->isInt()){
                se = new IdentifierSymbolEntry(TypeSystem::constIntType, $1, identifiers->getLevel());
                if(identifiers->lookup_thistable($1) != nullptr){
                    fprintf(stderr, "【constdef】the const has been defined twice.\n");
                    assert(0);
                }
                identifiers->install($1, se);
                int finalval = $3->getValue();
                ((IdentifierSymbolEntry*)se)->setValue(finalval);
            }
            else if(IdType->isFloat()){
                se = new IdentifierSymbolEntry(TypeSystem::constFloatType, $1, identifiers->getLevel());
                if(identifiers->lookup_thistable($1) != nullptr){
                    fprintf(stderr, "【constdef】the const has been defined twice.\n");
                    assert(0);
                }
                identifiers->install($1, se);
                float finalval = $3->getfloatValue();
                ((IdentifierSymbolEntry*)se)->setfloatValue(finalval);   
            }
        }
        $$ = new DeclStmt(new Id(se), $3);
        delete []$1;
    }
    | ID ArrayExpList ASSIGN {
        if(debug) printf("ConstDef:ID ArrayExpList ASSIGN ConstInitVal.\n");
        ptr = 0;
        SymbolEntry* se;
        // 这里要递归定义
        ExprNode* Index = $2;
        std::stack<int> stk4Index;
        while(Index){
            stk4Index.push(Index->getValue());
            Index = (ExprNode*)(Index->getNext());
        }
        Type *eletype = TypeSystem::constIntType;        
        if(IdType->isInt()){
            // do nothing
            handlingInt = 1;
        }
        else if(IdType->isFloat()){
            handlingInt = 0;
            eletype = TypeSystem::constFloatType;
        }
        else{
            fprintf(stderr, "【vardef】array type not allowed.\n");
            assert(0);
        }
        Type* type = new ArrayType(eletype,eletype,stk4Index.top());
        stride = stk4Index.top();
        totalsize = stk4Index.top();
        stk4Index.pop();
        while(!stk4Index.empty()){// 例如arry[1][2]
            type = new ArrayType(type,eletype,stk4Index.top());
            totalsize *= stk4Index.top();         
            stk4Index.pop();
        }
       arrayType = (ArrayType*)type;
        if(handlingInt){
            arrayValue = new int [totalsize];
        }
        else{
            arrayfloatValue = new float [totalsize];
        }
        se = new IdentifierSymbolEntry(type, $1, identifiers->getLevel());//基本类型仍然是int/float
        if(identifiers->lookup_thistable($1) != nullptr){// int a = 1;int a[10];不允许
            fprintf(stderr, "【vardef】the var has been defined twice.\n");
            assert(0);
        }
        while(!stk4array.empty()){
            stk4array.pop();
        }
        $<se>$ = se;//把se赋给$$
        arrayExprvec.clear();
        while(!stk4finalptr.empty())
            stk4finalptr.pop();
    }
    ConstInitVal {
        SymbolEntry* se = $<se>4;
        if(handlingInt) {
            ((IdentifierSymbolEntry*)se)->setArrayValue(arrayValue);
        }
        else{
            ((IdentifierSymbolEntry*)se)->setfloatArrayValue(arrayfloatValue);
        }
        ((IdentifierSymbolEntry*)se)->setarrayExprvec(arrayExprvec);
        if(debug)
            for(int i = 0;i < 8; i++)
                printf("%d\n",arrayValue[i]);
        identifiers->install($1, se);
        Id* id = new Id(se);
        id->addIndex((ExprNode*)$2);
        $$ = new DeclStmt(id,$5);
        delete []$1;
    }
    ;
ArrayExpList
    : LBRACKET ConstExp RBRACKET {
        if(debug) printf("ArrayExpList: LBRACKET ConstExp RBRACKET.\n");
        $$ = $2;
    }
    | ArrayExpList LBRACKET ConstExp RBRACKET {
        if(debug) printf("ArrayExpList: ArrayExpList LBRACKET ConstExp RBRACKET.\n");
        $$ = $1;
        $1->setNext($3);
    }
    ;
InitVal //arr[2][3][4]={1,2,3,4,{},5,6};
    : Exp {
        if(debug) printf("InitVal:Exp.\n");
        $$ = $1;
        if(!stk4array.empty()) {
            if(handlingInt)
                arrayValue[ptr]=$1->getValue();
            else
                arrayfloatValue[ptr]=$1->getValue();
            ptr++;
            Type* arrTy = stk4array.top()->getSymbolEntry()->getType();
            if(arrTy == arrayType->getBasicEleType()){
                stk4array.top()->addChild();
                arrayExprvec.push_back($1);
            }
            else{
                while(arrTy){
                    if(debug) printf("InitVal:Exp:22222\n");
                    if(((ArrayType*)arrTy)->getElementType() != arrayType->getBasicEleType()){
                        if(debug) printf("InitVal:Exp:33333\n");
                        arrTy = ((ArrayType*)arrTy)->getElementType();
                        SymbolEntry* se = new ConstantSymbolEntry(arrTy);
                        InitListExpr* list = new InitListExpr(se);
                        stk4array.top()->addChild();
                        stk4array.push(list);
                    }else{
                        if(debug) printf("InitVal:Exp:44444\n");
                        stk4array.top()->addChild();
                        arrayExprvec.push_back($1);
                        while(stk4array.top()->enoughChild() && stk4array.size() != (long unsigned int)leftCnt){
                            if(debug) printf("InitVal:Exp:55555\n");
                            arrTy = ((ArrayType*)arrTy)->getElementType();
                            stk4array.pop();
                        }
                        break;
                    }
                }
            }
        }
    }
    | LBRACE RBRACE {
        if(debug) printf("InitVal:LBRACE RBRACE.\n");
        SymbolEntry* se;
        ExprNode* list;
        int tmpstride = totalsize;
        if(handlingInt){
            if(!stk4array.empty()){//【如果int和float的size相同则可以合并】
                tmpstride = ((ArrayType*)(stk4array.top()->getSymbolEntry()->getType()))->getElementType()->getSize() / TypeSystem::intType->getSize();
            }
            for(int i = ptr;i < ptr+tmpstride; i++){
                arrayValue[i]=0;
                SymbolEntry* se;
                se = new ConstantSymbolEntry(TypeSystem::intType, 0);
                Constant* cst = new Constant(se);
                arrayExprvec.push_back(cst);
            }
        }
        else{
            if(!stk4array.empty()){//【如果int和float的size相同则可以合并】
                tmpstride = ((ArrayType*)(stk4array.top()->getSymbolEntry()->getType()))->getElementType()->getSize() / TypeSystem::floatType->getSize();
            }
            for(int i = ptr;i < ptr+tmpstride; i++){
                arrayfloatValue[i]=0;
                SymbolEntry* se;
                se = new ConstantSymbolEntry(TypeSystem::floatType, 0);
                Constant* cst = new Constant(se);
                arrayExprvec.push_back(cst);
            }
        }
         
        ptr+=tmpstride;       
        if(!stk4array.empty()){
            se = new ConstantSymbolEntry(((ArrayType*)(stk4array.top()->getSymbolEntry()->getType()))->getElementType());
        }
        else{
            se = new ConstantSymbolEntry(arrayType);
        }
        list = new InitListExpr(se);
        if(!stk4array.empty()) {
            stk4array.top()->addChild();
        }
        $$ = list;
        //【先不Pop了】
    }
    | LBRACE {
        if(debug) printf("InitVal:LBRACE InitValList RBRACE.\n");
        SymbolEntry* se;
        if(!stk4array.empty())
            arrayType = (ArrayType*)(((ArrayType*)(stk4array.top()->getSymbolEntry()->getType()))->getElementType());
        se = new ConstantSymbolEntry(arrayType);
        if(arrayType->getElementType() != arrayType->getBasicEleType()){
            if(debug) printf("InitVal:LBRACE InitValList RBRACE:111111\n");
            arrayType = (ArrayType*)(arrayType->getElementType());
        }
        InitListExpr* expr = new InitListExpr(se);
        if(!stk4array.empty()){//例如int**已经多了一个int*了
            if(debug) printf("InitVal:LBRACE InitValList RBRACE:222222\n");
            stk4array.top()->addChild();
        }
        stk4array.push(expr);
        $<exprtype>$ = expr;
        leftCnt++;
        int tmpstride = ((ArrayType*)(stk4array.top()->getSymbolEntry()->getType()))->getSize() / TypeSystem::intType->getSize();
        finalptr = ptr + tmpstride;
        stk4finalptr.push(finalptr);
    } 
      InitValList RBRACE {
        // printf("%d----------\n",stk4finalptr.top());
        int tempfinalptr = stk4finalptr.top();//不用判断是否为空了,上面压栈了肯定不为空
        stk4finalptr.pop();
        for(;ptr < tempfinalptr; ptr++){
            if(handlingInt) {
                arrayValue[ptr]=0;
                SymbolEntry* se;
                se = new ConstantSymbolEntry(TypeSystem::intType, 0);
                Constant* cst = new Constant(se);
                arrayExprvec.push_back(cst);
            }
            else{
                arrayfloatValue[ptr]=0;
                SymbolEntry* se;
                se = new ConstantSymbolEntry(TypeSystem::floatType, 0);
                Constant* cst = new Constant(se);
                arrayExprvec.push_back(cst);
            }
        }
        leftCnt--;
        while(stk4array.top() != $<exprtype>2 && stk4array.size() > (long unsigned int)(leftCnt + 1))
            stk4array.pop();
        if(stk4array.top() == $<exprtype>2)
            stk4array.pop();
        $$ = $<exprtype>2;
        if(!stk4array.empty())
            while(stk4array.top()->enoughChild() && stk4array.size() != (long unsigned int)leftCnt){
                stk4array.pop();
            }
        int size = ((ArrayType*)($$->getSymbolEntry()->getType()))->getSize()/ TypeSystem::intType->getSize();
            
        if(!stk4array.empty())
            arrayType = (ArrayType*)(((ArrayType*)(stk4array.top()->getSymbolEntry()->getType()))->getElementType());
    }
    ;

ConstInitVal
    : ConstExp {
        if(debug) printf("ConstInitVal:ConstExp.\n");
        $$ = $1;
        if(!stk4array.empty()) {
            if(handlingInt)
                arrayValue[ptr]=$1->getValue();
            else
                arrayfloatValue[ptr]=$1->getValue();
            ptr++;
            Type* arrTy = stk4array.top()->getSymbolEntry()->getType();
            if(arrTy == arrayType->getBasicEleType()){
                stk4array.top()->addChild();
                arrayExprvec.push_back($1);
                
            }
                
            else{
                while(arrTy){
                    if(debug) printf("ConstInitVal:ConstExp:22222\n");
                    if(((ArrayType*)arrTy)->getElementType() != arrayType->getBasicEleType()){
                        if(debug) printf("ConstInitVal:ConstExp:33333\n");
                        arrTy = ((ArrayType*)arrTy)->getElementType();
                        SymbolEntry* se = new ConstantSymbolEntry(arrTy);
                        InitListExpr* list = new InitListExpr(se);
                        stk4array.top()->addChild();
                        stk4array.push(list);
                    }else{
                        if(debug) printf("ConstInitVal:ConstExp:44444\n");
                        stk4array.top()->addChild();
                        arrayExprvec.push_back($1);
                        while(stk4array.top()->enoughChild() && stk4array.size() != (long unsigned int)leftCnt){
                            if(debug) printf("ConstInitVal:ConstExp:55555\n");
                            arrTy = ((ArrayType*)arrTy)->getElementType();
                            stk4array.pop();
                        }
                        break;
                    }
                }
            }   
        }
    }
    | LBRACE RBRACE {
        if(debug) printf("ConstInitVal:LBRACE RBRACE.\n");
        SymbolEntry* se;
        ExprNode* list;
        int tmpstride = totalsize;
        if(handlingInt){
            if(!stk4array.empty()){//【如果int和float的size相同则可以合并】
                tmpstride = ((ArrayType*)(stk4array.top()->getSymbolEntry()->getType()))->getElementType()->getSize() / TypeSystem::intType->getSize();
            }
            for(int i = ptr;i < ptr+tmpstride; i++){
                arrayValue[i]=0;
                SymbolEntry* se;
                se = new ConstantSymbolEntry(TypeSystem::intType, 0);
                Constant* cst = new Constant(se);
                arrayExprvec.push_back(cst);
            }
        }
        else{
            if(!stk4array.empty()){//【如果int和float的size相同则可以合并】
                tmpstride = ((ArrayType*)(stk4array.top()->getSymbolEntry()->getType()))->getElementType()->getSize() / TypeSystem::floatType->getSize();
            }
            for(int i = ptr;i < ptr+tmpstride; i++){
                arrayfloatValue[i]=0;
                SymbolEntry* se;
                se = new ConstantSymbolEntry(TypeSystem::floatType, 0);
                Constant* cst = new Constant(se);
                arrayExprvec.push_back(cst);
            }
        }
         
        ptr+=tmpstride;       
        if(!stk4array.empty()){
            se = new ConstantSymbolEntry(((ArrayType*)(stk4array.top()->getSymbolEntry()->getType()))->getElementType());
        }
        else{
            se = new ConstantSymbolEntry(arrayType);
        }
        list = new InitListExpr(se);
        stk4array.top()->addChild();
        $$ = list;
        //【先不Pop了】
    }
    | LBRACE {
        if(debug) printf("ConstInitVal:LBRACE ConstInitValList RBRACE.\n");
        SymbolEntry* se;
        if(!stk4array.empty())
            arrayType = (ArrayType*)(((ArrayType*)(stk4array.top()->getSymbolEntry()->getType()))->getElementType());
        se = new ConstantSymbolEntry(arrayType);
        if(arrayType->getElementType() != arrayType->getBasicEleType()){
            if(debug) printf("ConstInitVal:LBRACE ConstInitValList RBRACE:111111\n");
            arrayType = (ArrayType*)(arrayType->getElementType());
        }
        InitListExpr* expr = new InitListExpr(se);
        if(!stk4array.empty()){
            if(debug) printf("ConstInitVal:LBRACE ConstInitValList RBRACE:222222\n");
            stk4array.top()->addChild();
        }            
        stk4array.push(expr);
        $<exprtype>$ = expr;
        leftCnt++;
        if(!stk4array.empty()){
            int tmpstride = ((ArrayType*)(stk4array.top()->getSymbolEntry()->getType()))->getSize() / TypeSystem::intType->getSize();
            finalptr = ptr + tmpstride;
        }
        stk4finalptr.push(finalptr);
    } 
      ConstInitValList RBRACE {
        leftCnt--;
        // printf("top:%d-------\n",stk4finalptr.top());
        int tempfinalptr = stk4finalptr.top();//不用判断是否为空了,上面压栈了肯定不为空
        stk4finalptr.pop();
        for(;ptr < tempfinalptr; ptr++){
            if(handlingInt) {
                arrayValue[ptr]=0;
                SymbolEntry* se;
                se = new ConstantSymbolEntry(TypeSystem::intType, 0);
                Constant* cst = new Constant(se);
                arrayExprvec.push_back(cst);
            }
            else{
                arrayfloatValue[ptr]=0;
                SymbolEntry* se;
                se = new ConstantSymbolEntry(TypeSystem::floatType, 0);
                Constant* cst = new Constant(se);
                arrayExprvec.push_back(cst);
            }
        }
        while(stk4array.top() != $<exprtype>2 && stk4array.size() > (long unsigned int)(leftCnt + 1))
            stk4array.pop();
        if(stk4array.top() == $<exprtype>2)
            stk4array.pop();
        $$ = $<exprtype>2;
        if(!stk4array.empty())
            while(stk4array.top()->enoughChild() && stk4array.size() != (long unsigned int)leftCnt){
                stk4array.pop();
            }
        int size = ((ArrayType*)($$->getSymbolEntry()->getType()))->getSize()/ TypeSystem::intType->getSize();
            
        if(!stk4array.empty())
            arrayType = (ArrayType*)(((ArrayType*)(stk4array.top()->getSymbolEntry()->getType()))->getElementType());
    }
    ;
InitValList
    : InitVal {
        if(debug) printf("InitValList:InitVal.\n");
        $$ = $1;
    }
    | InitValList COMMA InitVal {
        if(debug) printf("InitValList:InitValList COMMA InitVal.\n");
        $$ = $1;
    }
    ;
ConstInitValList
    : ConstInitVal {
        $$ = $1;
    }
    | ConstInitValList COMMA ConstInitVal {
        $$ = $1;
    }
    ;
FuncDef
    :
    Type ID {
        if(debug) printf("FuncDef:Type ID LPAREN FuncFParamsOrEmpty RPAREN.\n");
        identifiers = new SymbolTable(identifiers);
    }
    LPAREN FuncFParamsOrEmpty RPAREN {
/*
确定函数类型
*/
        Type* funcType;
        std::vector<Type*> vec;
        DeclStmt* temp = (DeclStmt*)$5;
        while(temp){
            Type* type = temp->getId()->getSymbolEntry()->getType();
            if(type->isArray()){
                type = new PointerType(((ArrayType*)type)->getElementType());
                temp->getId()->getSymbolEntry()->setType(type);
            }
            vec.push_back(temp->getId()->getSymbolEntry()->getType());
            temp = (DeclStmt*)(temp->getNext());
        }
        funcType = new FunctionType($1, vec);
/*
根据函数类型和函数名，将其存到符号表里（函数外的那个符号表，因此是getPrev）
*/
        SymbolEntry* se = new IdentifierSymbolEntry(funcType, $2, identifiers->getPrev()->getLevel());
        identifiers->getPrev()->install($2, se);
    } 
    BlockStmt 
    {
        SymbolEntry *se;
        se = identifiers->lookup($2);
        assert(se != nullptr);
        $$ = new FunctionDef(se, (DeclStmt*)$5, $8);
        SymbolTable *top = identifiers;
        identifiers = identifiers->getPrev();
        delete top;
        delete []$2;
    }
    ;
FuncFParamsOrEmpty
    : FuncFParams {$$ = $1;}
    | %empty {$$ = nullptr;}
    ;

FuncRParams 
    : Exp { $$ = $1; }
    | FuncRParams COMMA Exp {
        $$ = $1;
        $$->setNext($3);
    }
    ;
FuncFParams
    : FuncFParams COMMA FuncFParam {
        $$ = $1;
        $$->setNext($3);
    }
    | FuncFParam {$$ = $1;}
    ;
FuncFParam
    : Type ID {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry($1, $2, identifiers->getLevel());
        identifiers->install($2, se);
        $$ = new DeclStmt(new Id(se));
        delete []$2;
    }
    | Type ID FuncArrayIndices {
        if(debug) printf("FuncFParam:Type ID FuncArrayIndices\n");
        SymbolEntry* se;
        ExprNode* temp = $3;
        Type* arr = $1;
        Type* basicEleType = $1;
        std::stack<ExprNode*> stk_t;
        while(temp){
            stk_t.push(temp);
            temp = (ExprNode*)(temp->getNext());
        }
        while(!stk_t.empty()){
            arr = new ArrayType(arr, basicEleType,stk_t.top()->getValue());
            stk_t.pop();
        }
        se = new IdentifierSymbolEntry(arr, $2, identifiers->getLevel());
        identifiers->install($2, se);
        $$ = new DeclStmt(new Id(se));
        delete []$2;
    }
    ;
FuncArrayIndices 
    : LBRACKET RBRACKET {
        $$ = new ExprNode(nullptr);
    }
    | FuncArrayIndices LBRACKET Exp RBRACKET {
        $$ = $1;
        $$->setNext($3);
    }
    ;
%%

int yyerror(char const* message)
{
    std::cerr<<message<<std::endl;
    return -1;
}
