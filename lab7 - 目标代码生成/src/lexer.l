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
    // 补充float

    extern FILE *yyin; 
    extern FILE *yyout;
    extern bool dump_tokens;
    int charlen = 0;
    void DEBUG_FOR_LAB4(std::string s){
        std::string DEBUG_INFO = "[DEBUG LAB4]: \t" + s + "\n";
        fputs(DEBUG_INFO.c_str(), yyout);
    }
%}

DECIMIAL ([1-9][0-9]*|0)
FLOATDECIMAL ([1-9][0-9]*|0)("."[0-9]*)?(("E"|"e")("+"|"-")?[0-9]+)?
OCTAL (0[0-7]+)
HEXADECIMAL (0[xX][0-9A-Fa-f]+)
ID [[:alpha:]_][[:alpha:][:digit:]_]*
EOL (\r\n|\n|\r)
WHITE [\t ]
STRING \".*\"

BLOCKCOMMENTBEGIN \/\*
BLOCKCOMMENTELEMENT .
BLOCKCOMMENTEND \*\/
%x BLOCKCOMMENT
LINECOMMENT \/\/[^\n]*

%%

"const" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("CONST\tconst");
    charlen += strlen("const");
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
    charlen += strlen("int");
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
    charlen += strlen("void");
    return VOID;
}
"if" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("IF\tif");
    charlen += strlen("if");
    return IF;
};
"else" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("ELSE\telse");
    charlen += strlen("else");
    return ELSE;
};
"return" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("RETURN\treturn");
    charlen += strlen("return");
    return RETURN;
}
"while" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("WHILE\twhile");
    charlen += strlen("while");
    return WHILE;
}
"break" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("BREAK\tbreak");
    charlen += strlen("break");
    return BREAK;
}
"continue" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("CONTINUE\tcontinue");
    charlen += strlen("continue");
    return CONTINUE;
}
"&&" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("AND\t&&");
    charlen += strlen("&&");
    return AND;
}
"||" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("OR\t||");
    charlen += strlen("||");
    return OR;
}
"!" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("NOT\t!");
    charlen += strlen("!");
    return NOT;
}
"==" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("EQUAL\t==");
    charlen += strlen("==");
    return EQUAL;
}
"!=" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("NOTEQUAL\t!=");
    charlen += strlen("!=");
    return NOTEQUAL;
}
"=" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("ASSIGN\t=");
    charlen += strlen("=");
    return ASSIGN;
}
"<" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LESS\t<");
    charlen += strlen("<");
    return LESS;
}
"<=" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LESSEQUAL\t<");
    charlen += strlen("<=");
    return LESSEQUAL;
}
">" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("GREATER\t<");
    charlen += strlen(">");
    return GREATER;
}
">=" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("GREATEREQUAL\t<");
    charlen += strlen(">=");
    return GREATEREQUAL;
}
"+" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("ADD\t+");
    charlen += strlen("+");
    return ADD;
}
"-" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("SUB\t-");
    charlen += strlen("-");
    return SUB;
}
"*" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("MUL\t*");
    charlen += strlen("*");
    return MUL;
}
"/" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("DIV\t/");
    charlen += strlen("/");
    return DIV;
}
"%" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("MOD\t%");
    charlen += strlen("%");
    return MOD;
}
";" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("SEMICOLON\t;");
    charlen += strlen(";");
    return SEMICOLON;
}
"(" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LPAREN\t(");
    charlen += strlen("(");
    return LPAREN;
}
")" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("RPAREN\t)");
    charlen += strlen(")");
    return RPAREN;
}
"{" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LBRACE\t{");
    charlen += strlen("{");
    return LBRACE;
}
"}" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("RBRACE\t}");
    charlen += strlen("}");
    return RBRACE;
}
"[" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LBRACKET\t[");
    charlen += strlen("[");
    return LBRACKET;
}
"]" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("RBRACKET\t}");
    charlen += strlen("]");
    return RBRACKET;
}
"," {
    if(dump_tokens)
        DEBUG_FOR_LAB4("COMMA\t,");
    charlen += strlen(",");
    return COMMA;
}
"putint" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> vec1;
    vec.push_back(TypeSystem::intType);
    Type* funcType = new FunctionType(TypeSystem::voidType, vec,vec1);
    SymbolTable* st = identifiers;
    while(st->getPrev()) {
        st = st->getPrev();
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel(), -1, true);
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
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> vec1;
    Type* funcType = new FunctionType(TypeSystem::intType, vec,vec1);
    SymbolTable* st = identifiers;
    while(st->getPrev()) {
        st = st->getPrev();
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel(), -1, true);
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
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> vec1;
    vec.push_back(TypeSystem::intType);
    Type* funcType = new FunctionType(TypeSystem::voidType, vec,vec1);
    SymbolTable* st = identifiers;
    while(st->getPrev()) {
        st = st->getPrev();
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel(), -1, true);
    st->install(yytext, se);
    return ID;
}
"getch" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> vec1;
    Type* funcType = new FunctionType(TypeSystem::intType, vec,vec1);
    SymbolTable* st = identifiers;
    while(st->getPrev()) {
        st = st->getPrev();
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel(), -1, true);
    st->install(yytext, se);
    return ID;
}
"putarray" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> vec1;
    vec.push_back(TypeSystem::intType);
    ArrayType* arr = new ArrayType(TypeSystem::intType, -1);
    vec.push_back(arr);
    Type* funcType = new FunctionType(TypeSystem::voidType, vec,vec1);
    SymbolTable* st = identifiers;
    while(st->getPrev()) {
        st = st->getPrev();
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel(), -1, true);
    st->install(yytext, se);
    return ID;
}
"getarray" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> vec1;
    ArrayType* arr = new ArrayType(TypeSystem::intType, -1);
    vec.push_back(arr);
    Type* funcType = new FunctionType(TypeSystem::intType, vec,vec1);
    SymbolTable* st = identifiers;
    while(st->getPrev()) {
        st = st->getPrev();
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel(), -1, true);
    st->install(yytext, se);
    return ID;
}
"putf" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> vec1;
    StringType* str = new StringType(0);
    vec.push_back(str);
    Type* funcType = new FunctionType(TypeSystem::voidType, vec,vec1);
    SymbolTable* st = identifiers;
    while(st->getPrev()) {
        st = st->getPrev();
    }
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel(), -1, true);
    st->install(yytext, se);
    return ID;
}
"starttime" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[6 + strlen(yytext) + 1];
    char* sysy = (char *)"_sysy_";
    strcpy(lexeme, sysy);
    strcpy(lexeme + 6, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> vec1;
    Type* funcType = new FunctionType(TypeSystem::voidType, vec,vec1);
    SymbolTable* st = identifiers;
    while(st->getPrev()) {
        st = st->getPrev();
    }
    char *temp = new char[6+strlen(yytext)];
    memcpy(temp, lexeme, 6+strlen(yytext));
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, temp, st->getLevel(), -1, true);
    st->install(temp, se);
    return ID;
}
"stoptime" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[6 + strlen(yytext) + 1];
    char* sysy = (char*)"_sysy_";
    strcpy(lexeme, sysy);
    strcpy(lexeme + 6, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> vec1;
    Type* funcType = new FunctionType(TypeSystem::voidType, vec,vec1);
    SymbolTable* st = identifiers;
    while(st->getPrev()){
        st = st->getPrev();
    }
    char *temp = new char[6+strlen(yytext)];
    memcpy(temp, lexeme, 14);
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, temp, st->getLevel(), -1, true);
    st->install(temp, se);
    return ID;
}

{DECIMIAL} {
    if(dump_tokens)
        DEBUG_FOR_LAB4(string("NUMBER\t") + string(yytext));
    charlen += strlen(yytext);
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
    int temp;
    sscanf(yytext, "%o", &temp);
    if(dump_tokens)
        DEBUG_FOR_LAB4(string("NUMBER\t") + to_string(temp));
    yylval.itype = temp;
    // string result = yytext;
    // yylval.itype = stoi(result, 0, 8);
    return INTEGER;
}
{HEXADECIMAL} {
    int temp;
    sscanf(yytext, "%x", &temp);
    if(dump_tokens)
        DEBUG_FOR_LAB4(string("NUMBER\t") + to_string(temp));
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
{STRING} {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char* lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    return STRING;
}
{EOL} {
    // modified <*>
    charlen += strlen(yytext);
    yylineno++;
    charlen = 0;
}

{WHITE} {}
{LINECOMMENT} {}
{BLOCKCOMMENTBEGIN} {BEGIN BLOCKCOMMENT;}
<BLOCKCOMMENT>{BLOCKCOMMENTELEMENT} {}
<BLOCKCOMMENT>{BLOCKCOMMENTEND} {BEGIN INITIAL;}

%%
