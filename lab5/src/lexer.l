%option noyywrap
%{
    #define YY_NO_UNPUT
    #define YY_NO_INPUT

    #include "parser.h"
    #include <ostream>
    #include <fstream>
    #include <iostream>
    #include <sstream>
    #include <stack>
    #include <map>
    #include <string>
    using namespace std;

    extern FILE *yyin; 
    extern FILE *yyout;
    extern bool dump_tokens;

    void DEBUG_FOR_LAB4(std::string s){
        std::string DEBUG_INFO = "[DEBUG LAB4]: \t" + s + "\n";
        fputs(DEBUG_INFO.c_str(), yyout);
    }
%}

DECIMIAL ([1-9][0-9]*|0)
FLOATDECIMAL ([1-9][0-9]*|0)("."[0-9]*)?(("E"|"e")("+"|"-")?[0-9]+)?
OCTAL ([0])([0-7]+)
HEXDECIMIAL ("0x"|"0X")([0-9]|[a-f]|[A-F])+
ID [[:alpha:]_][[:alpha:][:digit:]_]*
EOL (\r\n|\n|\r) 
WHITE [\t|" "]

LINECOMMENT \/\/[^\n]*
BLOCKCOMMENT_BEGIN "/*"
BLOCKCOMMENT_ELEMENT .|EOL
BLOCKCOMMENT_END "*/"
%x BLOCKCOMMENT

%%

"const" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("CONST\t const");
    return CONST;
}
"int" {
    /*
    * Questions: 
    *   Q1: Why we need to return INT in further labs?
    *   Q2: What is "INT" actually?
    */
    if(dump_tokens)
        DEBUG_FOR_LAB4("INT\tint");
    return INT;
}
"float" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("FLOAT\tfloat");
    return FLOAT;
}
"void" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("VOID\tvoid");
    return VOID;
}
"if" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("IF\tif");
    return IF;
};
"else" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("ELSE\telse");
    return ELSE;
};
"return" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("RETURN\treturn");
    return RETURN;
}
"while" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("WHILE\t while");
    return WHILE;
}
"break" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("BREAK\tbreak");
    return BREAK;
}
"continue" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("CONTINUE\tcontinue");
    return CONTINUE;
}
"=" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("ASSIGN\t=");
    return ASSIGN;
}
"&&" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("AND\t&&");
    return AND;
}
"||" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("OR\t||");
    return OR;
}
"!=" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("NOTEQUAL\t!=");
    return NOTEQUAL;
}
"==" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("EQUAL\t==");
    return EQUAL;
}
"!" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("NON\t!");
    return NON;
}
">" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("GREATER\t>");
    return GREATER;
}
"<" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LESS\t<");
    return LESS;
}
">=" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("GORE\t>=");
    return GORE;
}
"<=" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LORE\t<=");
    return LORE;
}
"+" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("ADD\t+");
    return ADD;
}
"-" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("SUB\t-");
    return SUB;
}
"*" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("MUL\t*");
    return MUL;
}
"/" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("DIV\t/");
    return DIV;
}
"%" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("MOD\t%");
    return MOD;
}
";" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("SEMICOLON\t;");
    return SEMICOLON;
}
"(" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LPAREN\t(");
    return LPAREN;
}
")" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("RPAREN\t)");
    return RPAREN;
}
"[" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LBRACK\t[");
    return LBRACK;
}
"]" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("RBRACK\t]");
    return RBRACK;
}
"{" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LBRACE\t{");
    return LBRACE;
}
"}" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("RBRACE\t}");
    return RBRACE;
}
"," {
    if(dump_tokens)
        DEBUG_FOR_LAB4("COMMA\t,");
    return COMMA;
}
"putint" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<SymbolEntry*> vec;
    // std::vector<SymbolEntry*> vec1;
    // vec.push_back(TypeSystem::intType);
    Type *funcType;
    funcType = new FunctionType(TypeSystem::voidType, vec);
    SymbolTable* st = identifiers;
    // 调整到global的作用域范围
    while(st->getPrev())
        st = st->getPrev();
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel());
    st->install(yytext, se);
    return ID;
}
"getint" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<SymbolEntry*> vec;
    Type* funcType = new FunctionType(TypeSystem::intType, vec);
    SymbolTable* st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel());
    st->install(yytext, se);
    return ID;
}
"putch" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    // std::vector<Type*> vec;
    std::vector<SymbolEntry*> vec;
    // vec.push_back(TypeSystem::intType);
    Type* funcType = new FunctionType(TypeSystem::voidType, vec);
    SymbolTable* st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel());
    st->install(yytext, se);
    return ID;
}

{LINECOMMENT} {;}
{BLOCKCOMMENT_BEGIN} {BEGIN BLOCKCOMMENT;}
<BLOCKCOMMENT>{BLOCKCOMMENT_ELEMENT} {}
<BLOCKCOMMENT>{EOL} {yylineno++;}
<BLOCKCOMMENT>{BLOCKCOMMENT_END} {BEGIN INITIAL;}

{DECIMIAL} {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    yylval.itype = atoi(yytext);
    // string result = yytext;
    // yylval.itype = stoi(result);
    return INTEGER;
}
{FLOATDECIMAL} {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    string result = yytext;
    yylval.ftype = stof(result);
    return FLOATNUM;
}
{OCTAL} {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    int temp;
    sscanf(yytext, "%o", &temp);
    yylval.itype = temp;
    // string result = yytext;
    // yylval.itype = stoi(result, 0, 8);
    return INTEGER;
}
{HEXDECIMIAL} {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    int temp;
    sscanf(yytext, "%x", &temp);
    yylval.itype = temp;
    // string result = yytext;
    // yylval.itype = stoi(result, 0, 16);
    return INTEGER;
}
{ID} {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    return ID;
}
{EOL} {yylineno++;}
{WHITE} {}


%%