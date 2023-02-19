#ifndef __TYPE_H__
#define __TYPE_H__
#include <vector>
#include <string>
#include <iostream>
#include <cassert>
class Type
{
private:
    int kind;
protected:
//Lab6
    enum {INT, FLOAT, VOID, FUNC, ARRAY, PTR}; //类型（新加float、array）
    int size; //存放类型所占的size大小（从原来的IntType挪上来）
public:
    Type(int kind, int size = 0) : kind(kind), size(size){};
    virtual ~Type() {};
    virtual std::string toStr() = 0;
    bool isInt() const {return (kind == INT)&&(size==32);};//由于后面实现的bool类型也是在int的基础上更改size大小实现，所以这里还要多判断是否为32位
    bool isBool() const {return size == 1;};
    bool isVoid() const {return kind == VOID;};
    bool isFunc() const {return kind == FUNC;};
    bool isArray() const { return kind == ARRAY || kind == PTR; };
    bool isPointer() const { return kind == PTR; }; 
    bool isFloat() const { return kind == FLOAT; };
    int getSize() const { return size; };
    int getTypeKind() const { return kind; };
};

class IntType : public Type
{
private:
    //int size;
    bool isconst; //标识常量

public:
    IntType(int size, bool isconst = false)
        : Type(Type::INT, size), isconst(isconst){};
    std::string toStr();
    bool isConst() { return isconst; }; 
};

class FloatType : public Type 
{
private:
    bool isconst;
public:
    FloatType(int size, bool isconst = false)
        : Type(Type::FLOAT, size), isconst(isconst){};

    std::string toStr();
    bool isConst() const { return isconst; };
};

class VoidType : public Type
{
public:
    VoidType() : Type(Type::VOID){};
    std::string toStr();
};

class FunctionType : public Type
{
private:
    Type *returnType;
    std::vector<Type*> paramsType;
public:
    FunctionType(Type* returnType, std::vector<Type*> paramsType) : 
    Type(Type::FUNC), returnType(returnType), paramsType(paramsType){};

    Type* getRetType() {return returnType;};//Lab6

    std::string toStr();
    void setParamsType(std::vector<Type*> paramsType) {
        this->paramsType = paramsType;
    };
    std::vector<Type*> getParamsType() { return paramsType; };
};


class ArrayType : public Type {
   private:
    Type* elementType; //数组元素类型(INT FLOAT ARRAY)
    Type* BasicEleType=nullptr;// 数组类型(INT FLOAT)
    int length;//长度，单位是当前的element

   public:
    ArrayType(Type* elementType,Type* BasicEleType, int length)
        : Type(Type::ARRAY),
          elementType(elementType),
          BasicEleType(BasicEleType),
          length(length) {
        size = elementType->getSize() * length; //当前数组的大小，单位是字节
    };
    std::string toStr();
    int getLength() const { return length; };
    Type* getElementType() const { return elementType; };//【删】
    Type* getBasicEleType() const { return BasicEleType; };
};

class PointerType : public Type//Lab6
{
private:
    Type *valueType;
    Type* BasicEleType=nullptr;
public:
    PointerType(Type* valueType) : Type(Type::PTR) {this->valueType = valueType; size=32;};
    std::string toStr();
    Type* getValueType() const {return valueType;};
    Type* getElementType() const {return valueType;};
    Type* getBasicEleType()
    {
        if(BasicEleType!=nullptr)
            return BasicEleType;
        else 
        {
            Type* tempType = valueType;
            while(true)
            {
                if(tempType->isFloat()||tempType->isInt())
                {
                    BasicEleType=tempType;
                    break;
                }

                if(tempType->isPointer())
                {
                    BasicEleType=((PointerType*)(tempType))->getElementType();
                    tempType=BasicEleType;

                }
                else if(tempType->isArray())
                {
                    BasicEleType=((ArrayType*)(tempType))->getElementType();
                    tempType=BasicEleType;
                }
                else{
                    assert(0);
                }   
            }

            
            return BasicEleType;
        }
    }
};




class TypeSystem
{
private:
    static IntType commonInt;

    static IntType commonBool;//lab6

    static FloatType commonFloat;
    static VoidType commonVoid;
    static IntType commonConstInt;
    static FloatType commonConstFloat;

public://public的接口，是Type*类型，供类外调用
    static Type *intType;
    static Type *floatType;
    static Type *voidType;
    static Type *constIntType;
    static Type *constFloatType;
    static Type *boolType;//lab6
};

#endif
