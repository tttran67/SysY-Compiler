#include <iostream>
#include <string.h>
#include <unistd.h>
#include "Ast.h"
#include "Unit.h"//lab6
#include "MachineCode.h"
#include "LinearScan.h"
#include "DeadVariableElimination.h"
#include "Mul2LSL.h"
bool passinfo = 0;
using namespace std;

Ast ast;
Unit unit;//lab6
MachineUnit mUnit;//lab7
extern FILE *yyin;
extern FILE *yyout;
bool pass = 1;
int yyparse();

char outfile[256] = "a.out";
bool dump_tokens;
bool dump_ast;
bool dump_ir;//lab6
bool dump_asm;//lab7
extern std::stack<WhileStmt*> stack4iteration;//循环迭代专用栈


int main(int argc, char *argv[])
{
    int opt;
    while ((opt = getopt(argc, argv, "Siato:")) != -1)
    {
        switch (opt)
        {
        case 'o':
            strcpy(outfile, optarg);
            break;
        case 'a':
            dump_ast = true;
            break;
        case 't':
            dump_tokens = true;
            break;
        case 'i':
            dump_ir = true;
            break;
        case 'S':
            dump_asm = true;
            break;
        default:
            fprintf(stderr, "Usage: %s [-o outfile] infile\n", argv[0]);
            exit(EXIT_FAILURE);
            break;
        }
    }
    if (optind >= argc)
    {
        fprintf(stderr, "no input file\n");
        exit(EXIT_FAILURE);
    }
    if (!(yyin = fopen(argv[optind], "r")))
    {
        fprintf(stderr, "%s: No such file or directory\nno input file\n", argv[optind]);
        exit(EXIT_FAILURE);
    }
    if (!(yyout = fopen(outfile, "w")))
    {
        fprintf(stderr, "%s: fail to open output file\n", outfile);
        exit(EXIT_FAILURE);
    }

    yyparse();

    if(dump_ast)
        ast.output();

    ast.typeCheck(nullptr);

    while ( !stack4iteration.empty () ) 
        stack4iteration.pop ();

    ast.genCode(&unit);

    if(pass){
        DeadVariableElimination dve(&unit);
        dve.pass();
    }

    if(dump_ir)
        unit.output();
    //lab7
    unit.genMachineCode(&mUnit);
    if(pass){
        Mul2LSL m2l(&mUnit);
        m2l.pass();
    }
    
    LinearScan linearScan(&mUnit);
    LinearScan_F linearScan_f(&mUnit);
    
    linearScan.allocateRegisters();
    linearScan_f.allocateRegisters();
    
    if(dump_asm)
        mUnit.output();

    return 0;
}
