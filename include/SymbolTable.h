#ifndef __SYMBOLTABLE_H__
#define __SYMBOLTABLE_H__

#include <string>
#include <map>
#include<vector>

class ExprNode;

class Type;
class Operand;//lab6

class SymbolEntry
{
private:
    int kind;
protected:
    enum {CONSTANT, VARIABLE, TEMPORARY};
    Type *type;

public:
    SymbolEntry(Type *type, int kind);
    virtual ~SymbolEntry() {};
    bool isConstant() const {return kind == CONSTANT;};
    bool isTemporary() const {return kind == TEMPORARY;};
    bool isVariable() const {return kind == VARIABLE;};
    Type* getType() {return type;};
    virtual std::string toStr() = 0;
    // You can add any function you need here.

    //lab6
    void setType(Type *type) {this->type = type;};
};


/*  
    Symbol entry for literal constant. Example:

    int a = 1;

    Compiler should create constant symbol entry for literal constant '1'.
*/
class ConstantSymbolEntry : public SymbolEntry //保存 整数和浮点数类型的字面值常量 属性值的符号表项
{
private:
    int value;
    float floatValue; //浮点数类型的字面值常量

public:
    ConstantSymbolEntry(Type* type);
    ConstantSymbolEntry(Type *type, int value);
    ConstantSymbolEntry(Type *type, float floatValue);//新加：float类型
    virtual ~ConstantSymbolEntry() {};
    int getValue() const {return value;};
    float getfloatValue() const {return floatValue;};//新加：float类型
    std::string toStr();
    // You can add any function you need here.
};


/* 
    Symbol entry for identifier. Example:

    int a;
    int b;
    void f(int c)
    {
        int d;
        {
            int e;
        }
    }

    Compiler should create identifier symbol entries for variables a, b, c, d and e:

    | variable | scope    |
    | a        | GLOBAL   |
    | b        | GLOBAL   |
    | c        | PARAM    |
    | d        | LOCAL    |
    | e        | LOCAL +1 |
*/
class IdentifierSymbolEntry : public SymbolEntry
{
private:
    enum {GLOBAL, PARAM, LOCAL};
    std::string name;
    int scope;
    int value;
    float floatValue;//新加：float类型
    bool initial;
    int* arrayValue;
    float* arrayfloatValue;//新加：float类型
    std::vector<ExprNode*> arrayExprvec;
    // You can add any field you need here.

    //lab6
    Operand *addr; // The address of the identifier.

public:
    IdentifierSymbolEntry(Type *type, std::string name, int scope);
    virtual ~IdentifierSymbolEntry() {};
    std::string toStr();
    int getScope() const {return scope;};
    void setValue(int value);
    int getValue() const { return value; };
    void setfloatValue(float floatValue); //新加：float类型
    float getfloatValue() const { return floatValue; }; //新加：float类型


    void setArrayValue(int* arrayValue);
    void setarrayExprvec(std::vector<ExprNode*> paramarrayExprvec){
        arrayExprvec = paramarrayExprvec;
        // printf("arrayExprvec.size:%d------------\n",arrayExprvec.size());
        }
    std::vector<ExprNode*> getarrayExprvec(){return arrayExprvec;}
    int* getArrayValue() const { return arrayValue; };
    void setfloatArrayValue(float* arrayfloatValue);//新加：float类型
    float* getfloatArrayValue() const { return arrayfloatValue; };//新加：float类型
    // You can add any function you need here.

    //lab6
    bool isGlobal() const {return scope == GLOBAL;};
    bool isParam() const {return scope == PARAM;};
    bool isLocal() const {return scope >= LOCAL;};
    void setAddr(Operand *addr) {this->addr = addr;};
    Operand* getAddr() {return addr;};

};






/* 
    Symbol entry for temporary variable created by compiler. Example:

    int a;
    a = 1 + 2 + 3;

    The compiler would generate intermediate code like:

    t1 = 1 + 2
    t2 = t1 + 3
    a = t2

    So compiler should create temporary symbol entries for t1 and t2:

    | temporary variable | label |
    | t1                 | 1     |
    | t2                 | 2     |
*/
class TemporarySymbolEntry : public SymbolEntry
{
private:
    int stack_offset;//lab7
    int label;
    bool is_param;
    int param_num;
    bool is_r_param;
    int r_param_num;
    bool is_s_param;
    int s_param_num;
public:
    TemporarySymbolEntry(Type *type, int );
    virtual ~TemporarySymbolEntry() {};
    std::string toStr();
    // You can add any function you need here.

    //lab6
    int getLabel() const {return label;};
    //lab7
    void setOffset(int offset) { this->stack_offset = offset; };
    int getOffset() { return this->stack_offset; };

    void set_param_num(int x) { is_param = 1; param_num=x;};
    int get_param_num() {return param_num;};
    bool get_is_param() {return is_param;};

    void set_r_param_num(int x) { is_r_param = 1; r_param_num=x;};
    int get_r_param_num() {return r_param_num;};
    bool get_is_r_param() {return is_r_param;};

    void set_s_param_num(int x) { is_s_param = 1; s_param_num=x;};
    int get_s_param_num() {return s_param_num;};
    bool get_is_s_param() {return is_s_param;};
};

// symbol table managing identifier symbol entries
class SymbolTable
{
private:
    std::map<std::string, SymbolEntry*> symbolTable;
    SymbolTable *prev;
    int level;
    static int counter;
public:
    SymbolTable();
    SymbolTable(SymbolTable *prev);
    void install(std::string name, SymbolEntry* entry);
    SymbolEntry* lookup(std::string name);
    SymbolEntry* lookup_thistable(std::string name);
    SymbolTable* getPrev() {return prev;};
    int getLevel() {return level;};
    static int getLabel() {return counter++;};
    std::map<std::string, SymbolEntry*> getmap(){return symbolTable;};
};

extern SymbolTable *identifiers;
extern SymbolTable *globals;

#endif
