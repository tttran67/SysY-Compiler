#include "Type.h"
# include<string>
# include<string.h>
#include <iostream>
#include <sstream>

//初始化（实例化一个类型 类），传参为size和isconst的标识
IntType TypeSystem::commonInt = IntType(32);
IntType TypeSystem::commonConstInt = IntType(32, true);
VoidType TypeSystem::commonVoid = VoidType();
FloatType TypeSystem::commonFloat = FloatType(32);
FloatType TypeSystem::commonConstFloat = FloatType(32, true);
IntType TypeSystem::commonBool = IntType(1);//lab6

Type* TypeSystem::intType = &commonInt;
Type* TypeSystem::constIntType = &commonConstInt;
Type* TypeSystem::floatType = &commonFloat;
Type* TypeSystem::constFloatType = &commonConstFloat;
Type* TypeSystem::voidType = &commonVoid;
Type* TypeSystem::boolType = &commonBool;//lab6


std::string IntType::toStr()
{
    // if (isconst)
    //     return "const int";
    // else
    //     return "int";

    //lab6
    std::ostringstream buffer;
    buffer << "i" << size;
    return buffer.str();
}

std::string VoidType::toStr()
{
    return "void";
}

std::string FloatType::toStr()
{
    if (isconst)
        return "const float";
    else
        return "float";
}

std::string FunctionType::toStr() {
    std::string str="";
    str+=returnType->toStr();
    str+="(";
    for (auto it = paramsType.begin(); it != paramsType.end(); it++) {
        str += (*it)->toStr();
        if (it + 1 != paramsType.end())
            str +=  ", ";
    }
    str+= ')';
    return str;
}

std::string ArrayType::toStr() {
    std::vector<std::string> vec;
    int LBRACKET_count = 0;
    Type* cur = this;
    bool flag_ptr = 0;
    while(cur && cur->isArray())
    {
        if(((ArrayType*)cur)->getLength() < 0 ) 
        {
            flag_ptr = true;
            cur = ((ArrayType*)cur)->getElementType();
            continue;
        }
        std::string str = "";
        str += "["; 
        str += std::to_string( ((ArrayType*)cur)->getLength() ); 
        str += " x "; 
        LBRACKET_count ++;
        vec.push_back(str);
        cur = ((ArrayType*)cur)->getElementType();
    }

    std::string str="";
    for (auto x:vec)
        str+=x;

    if (cur->isInt()) 
        str+="i32";
    else if(cur->isFloat())
        str+="float";
    for(int i=0;i<LBRACKET_count;i++)
    {
        str+="]";
    }
    if (flag_ptr)
        str+='*'; //如果是指针，则标记*
    return str;
}

//lab6
std::string PointerType::toStr()
{
    std::ostringstream buffer;
    buffer << valueType->toStr() << "*";
    return buffer.str();
}