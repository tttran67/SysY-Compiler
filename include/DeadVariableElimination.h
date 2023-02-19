#ifndef __DEADVARIABLEELIMINATION_H__
#define __DEADVARIABLEELIMINATION_H__
#include"Unit.h"
class DeadVariableElimination{
    Unit* unit;
public:
    DeadVariableElimination(Unit* paramUnit){unit = paramUnit;};
    void pass();

};
#endif