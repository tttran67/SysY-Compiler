#ifndef __MUL2LSL_H__
#define __MUL2LSL_H__

#include "MachineCode.h"

class Mul2LSL {
    MachineUnit* unit;

   public:
    Mul2LSL(MachineUnit* unit) : unit(unit){};
    void pass();

};

#endif