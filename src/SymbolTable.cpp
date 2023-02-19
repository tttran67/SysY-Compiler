#include "SymbolTable.h"
#include "Type.h"
#include <iostream>
#include <string>
#include <sstream>

SymbolEntry::SymbolEntry(Type *type, int kind) 
{
    this->type = type;
    this->kind = kind;
}

ConstantSymbolEntry::ConstantSymbolEntry(Type* type) : SymbolEntry(type, SymbolEntry::CONSTANT) {}

ConstantSymbolEntry::ConstantSymbolEntry(Type *type, int value) : SymbolEntry(type, SymbolEntry::CONSTANT)
{
    this->value = value;
}
ConstantSymbolEntry::ConstantSymbolEntry(Type *type, float floatValue) : SymbolEntry(type, SymbolEntry::CONSTANT)
{
    this->floatValue = floatValue;
}//新加：float类型

std::string ConstantSymbolEntry::toStr()
{
    std::string str;
    if (type->isInt())
        str = std::to_string(value);
    else if (type->isFloat())
        str = std::to_string(floatValue);
    return str;
}

IdentifierSymbolEntry::IdentifierSymbolEntry(Type *type, std::string name, int scope) : SymbolEntry(type, SymbolEntry::VARIABLE), name(name)
{
    this->scope = scope;
    this->initial = false;

    //lab6
    addr = nullptr;
}

void IdentifierSymbolEntry::setValue(int value) {
    if (((IntType*)(this->getType()))->isConst()) {
        if (initial) {
            //错误
        } else {
            //如果是常量，且没有初始化，则正常赋值
            this->value = value;
            initial = true;//初始化置1
        }
    } else {
        //如果不是常量，就直接赋值
        this->value = value;
    }
}

void IdentifierSymbolEntry::setfloatValue(float floatValue){ //新加：float类型
    if (((FloatType*)(this->getType()))->isConst()) {
        if (initial) {
            //错误
        } else {
            //如果是常量，且没有初始化，则正常赋值
            this->floatValue = floatValue;
            initial = true;//初始化置1
        }
    } else {
        //如果不是常量，就直接赋值
        this->floatValue = floatValue;
    }
}

void IdentifierSymbolEntry::setArrayValue(int* arrayValue) {
    if (((IntType*)(this->getType()))->isConst()) {
        if (initial) {
            //错误
        } else {
            //如果是常量，且没有初始化，则正常赋值
            this->arrayValue = arrayValue;
            initial = true;//初始化置1
        }
    } else {
        //如果不是常量，就直接赋值
        this->arrayValue = arrayValue;
    }
}

void IdentifierSymbolEntry::setfloatArrayValue(float* arrayfloatValue){//新加：float类型
    if (((FloatType*)(this->getType()))->isConst()) {
        if (initial) {
            //错误
        } else {
            //如果是常量，且没有初始化，则正常赋值
            this->arrayfloatValue = arrayfloatValue;
            initial = true;//初始化置1
        }
    } else {
        //如果不是常量，就直接赋值
        this->arrayfloatValue = arrayfloatValue;
    }
}


std::string IdentifierSymbolEntry::toStr()
{
    //lab6
    return "@"+name;
}

TemporarySymbolEntry::TemporarySymbolEntry(Type *type, int label) : SymbolEntry(type, SymbolEntry::TEMPORARY)
{
    is_param=is_r_param=is_s_param=0;
    this->label = label;
}

std::string TemporarySymbolEntry::toStr()
{
    std::ostringstream buffer;
    buffer << "%t" << label;//lab6
    return buffer.str();
}

SymbolTable::SymbolTable()
{
    prev = nullptr;
    level = 0;
}

SymbolTable::SymbolTable(SymbolTable *prev)
{
    this->prev = prev;
    this->level = prev->level + 1;
}

/*
    Description: lookup the symbol entry of an identifier in the symbol table
    Parameters: 
        name: identifier name
    Return: pointer to the symbol entry of the identifier

    hint:
    1. The symbol table is a stack. The top of the stack contains symbol entries in the current scope.
    2. Search the entry in the current symbol table at first.
    3. If it's not in the current table, search it in previous ones(along the 'prev' link).
    4. If you find the entry, return it.
    5. If you can't find it in all symbol tables, return nullptr.
*/
SymbolEntry* SymbolTable::lookup(std::string name)
{
    // Todo
    SymbolTable* table = this;
    while (table != nullptr)
    {
        if (table->symbolTable.find(name) != table->symbolTable.end()) {
            //在当前符号表（哈希）找到了name对应的表项SymbolEntry类型，则返回
            return table->symbolTable[name];
        } else {
            //当前符号表没找到，找上一个符号表
            table = table->prev;
        }
    }
    return nullptr;
}

SymbolEntry* SymbolTable::lookup_thistable(std::string name)
{
    // Todo
    SymbolTable* table = this;
    if (table != nullptr)
    {
        if (table->symbolTable.find(name) != table->symbolTable.end()) {
            //在当前符号表（哈希）找到了name对应的表项SymbolEntry类型，则返回
            return table->symbolTable[name];
        }
    }
    return nullptr;
}

// install the entry into current symbol table.
void SymbolTable::install(std::string name, SymbolEntry* entry)
{
    symbolTable[name] = entry;
}

int SymbolTable::counter = 0;
static SymbolTable t;
SymbolTable *identifiers = &t;
SymbolTable *globals = &t;
