%option noyywrap
%{
    #define YY_NO_UNPUT
    #define YY_NO_INPUT

    #include "parser.h"
    #include <ostream>
    #include <fstream>
    #include <iostream>
    #include <list>
    using namespace std;

    extern FILE *yyin; 
    extern FILE *yyout;
    extern bool dump_tokens;
    extern std::list<SymbolEntry*> LibraryFuncVec;
    int offset = 0;
    void DEBUG_FOR_LAB4(std::string s){
        std::string DEBUG_INFO = "[DEBUG LAB4]: \t" + s + "\n";
        fputs(DEBUG_INFO.c_str(), yyout);
    }
%}

DECIMAL_FLOATING ((([0-9]*\.[0-9]*([eE][+-]?[0-9]+)?)|([0-9]+[eE][+-]?[0-9]+))[FfLl]?)
HEXADECIMAL_FLOATING (0[xX](([0-9A-Fa-f]*\.[0-9A-Fa-f]*)|([0-9A-Fa-f]+))[pP][+-]?[0-9]+[FfLl]?)
DECIMIAL ([1-9][0-9]*|0)
OCTAL (0[0-7]+)
HEXADECIMAL (0[xX][0-9A-Fa-f]+)
ID [[:alpha:]_][[:alpha:][:digit:]_]*
EOL (\r\n|\n|\r)
WHITE [\t ]
BLOCKCOMMENTBEGIN \/\*
BLOCKCOMMENTELEMENT .
BLOCKCOMMENTEND \*\/
%x BLOCKCOMMENT
LINECOMMENT \/\/[^\n]*
%%

"int" {
    /*
    * Questions: 
    *   Q1: Why we need to return INT in further labs?
    *   Q2: What is "INT" actually?
    */
    if(dump_tokens)
        DEBUG_FOR_LAB4("INT\tint");
    offset += strlen(yytext);
    return INT;
}
"float" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("FLOAT\tfloat");
    offset += strlen(yytext);
    return FLOAT;
}
"void" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("VOID\tvoid");
    offset += strlen(yytext);
    return VOID;
}
"const" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("CONST\tconst");
    offset += strlen(yytext);
    return CONST;
}
"if" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("IF\tif");
    offset += strlen(yytext);
    return IF;
};
"else" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("ELSE\telse");
    offset += strlen(yytext);
    return ELSE;
};
"return" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("RETURN\treturn");
    offset += strlen(yytext);
    return RETURN;
}
"while" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("WHILE\twhile");
    offset += strlen(yytext);
    return WHILE;
}
"break" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("BREAK\tbreak");
    offset += strlen(yytext);
    return BREAK;
}
"continue" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("CONTINUE\tcontinue");
    offset += strlen(yytext);
    return CONTINUE;
}
"==" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("EQUAL\t==");
    offset += strlen(yytext);
    return EQUAL;
}
"!=" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("NOTEQUAL\t!=");
    offset += strlen(yytext);
    return NOTEQUAL;
}
"=" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("ASSIGN\t=");
    offset += strlen(yytext);
    return ASSIGN;
}
"<" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LESS\t<");
    offset += strlen(yytext);
    return LESS;
}
"<=" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LESSEQUAL\t<");
    offset += strlen(yytext);
    return LESSEQUAL;
}
">" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("GREATER\t<");
    offset += strlen(yytext);
    return GREATER;
}
">=" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("GREATEREQUAL\t<");
    offset += strlen(yytext);
    return GREATEREQUAL;
}
"+" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("ADD\t+");
    offset += strlen(yytext);
    return ADD;
}
"-" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("SUB\t-");
    offset += strlen(yytext);
    return SUB;
}
"*" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("MUL\t*");
    offset += strlen(yytext);
    return MUL;
}
"/" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("DIV\t/");
    offset += strlen(yytext);
    return DIV;
}
"%" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("MOD\t%");
    offset += strlen(yytext);
    return MOD;
}
"&&" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("AND\t&&");
    offset += strlen(yytext);
    return AND;
}
"||" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("OR\t||");
    offset += strlen(yytext);
    return OR;
}
"!" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("NOT\t!");
    offset += strlen(yytext);
    return NOT;
}
";" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("SEMICOLON\t;");
    offset += strlen(yytext);
    return SEMICOLON;
}
"(" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LPAREN\t(");
    offset += strlen(yytext);
    return LPAREN;
}
")" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("RPAREN\t)");
    offset += strlen(yytext);
    return RPAREN;
}
"{" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LBRACE\t{");
    offset += strlen(yytext);
    return LBRACE;
}
"}" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("RBRACE\t}");
    offset += strlen(yytext);
    return RBRACE;
}
"[" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LBRACKET\t[");
    offset += strlen(yytext);
    return LBRACKET;
}
"]" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("RBRACKET\t}");
    offset += strlen(yytext);
    return RBRACKET;
}
"," {
    if(dump_tokens)
        DEBUG_FOR_LAB4("COMMA\t,");
    offset += strlen(yytext);
    return COMMA;
}
{DECIMAL_FLOATING} {
    float temp;
    sscanf(yytext, "%f", &temp);
    if (dump_tokens)
        DEBUG_FOR_LAB4(string("NUMBER\t") + to_string(temp));
    offset += strlen(yytext);
    yylval.ftype = temp;
    return FLOATING;
}
{HEXADECIMAL_FLOATING} {
    float temp;
    sscanf(yytext, "%f", &temp);
    if (dump_tokens)
        DEBUG_FOR_LAB4(string("NUMBER\t") + to_string(temp));
    offset += strlen(yytext);
    yylval.ftype = temp;
    return FLOATING;
}
{DECIMIAL} {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    offset += strlen(yytext);
    yylval.itype = atoi(yytext);
    return INTEGER;
}
{OCTAL} {
    int temp;
    sscanf(yytext, "%o", &temp);
    if(dump_tokens)
        DEBUG_FOR_LAB4(string("NUMBER\t") + to_string(temp));
    offset += strlen(yytext);
    yylval.itype = temp;
    return INTEGER;
}
{HEXADECIMAL} {
    int temp;
    sscanf(yytext, "%x", &temp);
    if(dump_tokens)
        DEBUG_FOR_LAB4(string("NUMBER\t") + to_string(temp));
    offset += strlen(yytext);
    yylval.itype = temp;
    return INTEGER;
}

"putint" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *funcname = new char[strlen(yytext) + 1];
    strcpy(funcname, yytext);
    yylval.strtype = funcname;
    std::vector<Type*> vec={TypeSystem::intType};
    Type* funcType = new FunctionType(TypeSystem::voidType, vec);
    SymbolTable* cur = identifiers;
    while(1)
    {
        if(cur->getPrev()==nullptr)
        {
            break;
        }
        cur = cur->getPrev();       
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, cur->getLevel());
    cur->install(yytext, se);
    LibraryFuncVec.push_back(se);
    return ID;
}

"getint" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *funcname = new char[strlen(yytext) + 1];
    strcpy(funcname, yytext);
    yylval.strtype = funcname;
    std::vector<Type*> vec;
    Type* funcType = new FunctionType(TypeSystem::intType, vec);
    SymbolTable* cur = identifiers;
    while(1)
    {
        if(cur->getPrev()==nullptr)
        {
            break;
        }
        cur = cur->getPrev();       
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, cur->getLevel());
    cur->install(yytext, se);
    LibraryFuncVec.push_back(se);
    return ID;
}
"putch" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *funcname = new char[strlen(yytext) + 1];
    strcpy(funcname, yytext);
    yylval.strtype = funcname;
    std::vector<Type*> vec={TypeSystem::intType};
    Type* funcType = new FunctionType(TypeSystem::voidType, vec);
    SymbolTable* cur = identifiers;
    while(1)
    {
        if(cur->getPrev()==nullptr)
        {
            break;
        }
        cur = cur->getPrev();       
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, cur->getLevel());
    cur->install(yytext, se);
    LibraryFuncVec.push_back(se);
    return ID;
}
"getch" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *funcname = new char[strlen(yytext) + 1];
    strcpy(funcname, yytext);
    yylval.strtype = funcname;
    std::vector<Type*> vec;
    Type* funcType = new FunctionType(TypeSystem::intType, vec);
    SymbolTable* cur = identifiers;
    while(1)
    {
        if(cur->getPrev()==nullptr)
        {
            break;
        }
        cur = cur->getPrev();       
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, cur->getLevel());
    cur->install(yytext, se);
    LibraryFuncVec.push_back(se);
    return ID;
}

"putarray" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *funcname = new char[strlen(yytext) + 1];
    strcpy(funcname, yytext);
    yylval.strtype = funcname;
    std::vector<Type*> vec;
    vec.push_back(TypeSystem::intType);
    ArrayType* arr = new ArrayType(TypeSystem::intType, TypeSystem::intType,0);//【可能有float，再说】
    vec.push_back(arr);
    Type* funcType = new FunctionType(TypeSystem::intType, vec);
    SymbolTable* cur = identifiers;
    while(1)
    {
        if(cur->getPrev()==nullptr)
        {
            break;
        }
        cur = cur->getPrev();       
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, cur->getLevel());
    cur->install(yytext, se);
    LibraryFuncVec.push_back(se);
    return ID;
}


"putfarray" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *funcname = new char[strlen(yytext) + 1];
    strcpy(funcname, yytext);
    yylval.strtype = funcname;
    std::vector<Type*> vec;
    vec.push_back(TypeSystem::intType);
    ArrayType* arr = new ArrayType(TypeSystem::floatType, TypeSystem::intType,0);//【可能有float，再说】
    vec.push_back(arr);
    Type* funcType = new FunctionType(TypeSystem::intType, vec);
    SymbolTable* cur = identifiers;
    while(1)
    {
        if(cur->getPrev()==nullptr)
        {
            break;
        }
        cur = cur->getPrev();       
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, cur->getLevel());
    cur->install(yytext, se);
    LibraryFuncVec.push_back(se);
    return ID;
}


"getarray" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *funcname = new char[strlen(yytext) + 1];
    strcpy(funcname, yytext);
    yylval.strtype = funcname;
    std::vector<Type*> vec;
    ArrayType* arr = new ArrayType(TypeSystem::intType,TypeSystem::intType,0);//【可能有float，再说】
    vec.push_back(arr);
    Type* funcType = new FunctionType(TypeSystem::intType, vec);
    SymbolTable* cur = identifiers;
    while(1)
    {
        if(cur->getPrev()==nullptr)
        {
            break;
        }
        cur = cur->getPrev();       
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, cur->getLevel());
    cur->install(yytext, se);
    LibraryFuncVec.push_back(se);
    return ID;
}



"getfarray" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *funcname = new char[strlen(yytext) + 1];
    strcpy(funcname, yytext);
    yylval.strtype = funcname;
    std::vector<Type*> vec;
    ArrayType* arr = new ArrayType(TypeSystem::floatType,TypeSystem::intType,0);//【可能有float，再说】
    vec.push_back(arr);
    Type* funcType = new FunctionType(TypeSystem::intType, vec);
    SymbolTable* cur = identifiers;
    while(1)
    {
        if(cur->getPrev()==nullptr)
        {
            break;
        }
        cur = cur->getPrev();       
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, cur->getLevel());
    cur->install(yytext, se);
    LibraryFuncVec.push_back(se);
    return ID;
}




"starttime" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *funcname = new char[strlen(yytext) + 1];
    strcpy(funcname, yytext);
    yylval.strtype = funcname;
    std::vector<Type*> vec={};
    Type* funcType = new FunctionType(TypeSystem::voidType, vec);
    SymbolTable* cur = identifiers;
    while(1)
    {
        if(cur->getPrev()==nullptr)
        {
            break;
        }
        cur = cur->getPrev();       
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, cur->getLevel());
    cur->install(yytext, se);
    LibraryFuncVec.push_back(se);
    return ID;
}
"stoptime" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *funcname = new char[strlen(yytext) + 1];
    strcpy(funcname, yytext);
    yylval.strtype = funcname;
    std::vector<Type*> vec={};
    Type* funcType = new FunctionType(TypeSystem::voidType, vec);
    SymbolTable* cur = identifiers;
    while(1)
    {
        if(cur->getPrev()==nullptr)
        {
            break;
        }
        cur = cur->getPrev();       
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, cur->getLevel());
    cur->install(yytext, se);
    LibraryFuncVec.push_back(se);
    return ID;
}

"getfloat" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *funcname = new char[strlen(yytext) + 1];
    strcpy(funcname, yytext);
    yylval.strtype = funcname;
    std::vector<Type*> vec={};
    Type* funcType = new FunctionType(TypeSystem::floatType, vec);
    SymbolTable* cur = identifiers;
    while(1)
    {
        if(cur->getPrev()==nullptr)
        {
            break;
        }
        cur = cur->getPrev();       
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, cur->getLevel());
    cur->install(yytext, se);
    LibraryFuncVec.push_back(se);
    return ID;
}

"putfloat" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    vec.push_back(TypeSystem::floatType);
    Type* funcType = new FunctionType(TypeSystem::voidType, vec);
    SymbolTable* st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel());
    st->install(yytext, se);
    LibraryFuncVec.push_back(se);
    return ID;
}

{ID} {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    offset += strlen(yytext);
    yylval.strtype = lexeme;
    return ID;
}
<*>{EOL} {
    offset += strlen(yytext);
    yylineno++;
    offset = 0;
}
{WHITE}
{LINECOMMENT} {}
{BLOCKCOMMENTBEGIN} {BEGIN BLOCKCOMMENT;}
<BLOCKCOMMENT>{BLOCKCOMMENTELEMENT} {}
<BLOCKCOMMENT>{BLOCKCOMMENTEND} {BEGIN INITIAL;}
%%
