%option noyywrap
%{
    #define ONLY_FOR_LEX
    
    #ifdef ONLY_FOR_LEX
    #include <ostream>
    #include <fstream>
    #include <iostream>
    #include <sstream>
    #include <stack>
    #include <map>
    using namespace std;
    extern FILE *yyin; 
    extern FILE *yyout;

    int columnno = 0;
    string tab = "\t";
    map<string, float> float_table;
    map<string, int> int_table;

    void DEBUG_FOR_LAB4(string s){
        string DEBUG_INFO = "\t" + s + "\t" + to_string(yylineno) + "\t" + to_string(columnno) + "\n";
        fputs(DEBUG_INFO.c_str(), yyout);
    }

    void DEBUG_FOR_INT_LAB4(string s, int num){
        string DEBUG_INFO = "\t" + s + "\t" + to_string(yylineno) + "\t" + to_string(columnno) + "\t" + to_string(num) + "\n";
        fputs(DEBUG_INFO.c_str(), yyout);
    }

    void DEBUG_FOR_FLOAT_LAB4(string s, float num){
        string DEBUG_INFO = "\t" + s + "\t" + to_string(yylineno) + "\t" + to_string(columnno) + "\t" + to_string(num) + "\n";
        fputs(DEBUG_INFO.c_str(), yyout);
    }

    void DEBUG_FOR_ID_LAB4(string s, string ID_scope){
        string DEBUG_INFO = "\t" + s + "\t" + to_string(yylineno) + "\t" + to_string(columnno) + "\t" + ID_scope + "\n";
        fputs(DEBUG_INFO.c_str(), yyout);
    }

    // 符号表就先在lex中定义，以后在.h头文件中定义
    class SymbolTable{
    public:
        string symbol_name;
        string type;
        string* scope;
        int reserved;
    public:
        SymbolTable();
        SymbolTable(string n, string t, string* s, int default_reserved = 0);
        void lookup();
        void insert();
    }test_symbol[100];

    SymbolTable::SymbolTable(){
        symbol_name = "";
        type = "";
        scope = nullptr;
        reserved = 0;
    }

    SymbolTable::SymbolTable(string n, string t, string* s, int cur_reserved){
        symbol_name = n;
        type = t;
        scope = s;
        reserved = cur_reserved;
    }

    // 使用stack来追踪作用域，用栈top元素的地址来标识
    stack<string*> scope_stack;
    // string latest_token = "";
    int symbol_num = 0;
    
    #else
    #define YYSTYPE void *
    #include "parser.h"
    
    #endif

    #define YY_NO_UNPUT
    #define YY_NO_INPUT
    #include <string>
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
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("CONST\tconst");
        columnno += 5;
    #else
        return CONST;
    #endif
}
"int" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("INT\tint");
        columnno += 3;
    #else
        return INT;
    #endif
}
"float" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("FLOAT\tfloat");
        columnno += 5;
    #else
        return FLOAT;
    #endif
}
"void" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("VOID\tvoid");
        columnno += 4;
    #else
        return VOID;
    #endif 
}
"if" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("IF\tif");
        columnno += 2;
    #else
        return IF;
    #endif
};
"else" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ELSE\telse");
        columnno += 4;
    #else
        return ELSE;
    #endif
};
"return" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RETURN\treturn");
        columnno += 6;
    #else
        return RETURN;
    #endif
}
"while" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("WHILE\twhile");
        columnno += 5;
    #else
        return WHILE;
    #endif
}
"for" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("FOR\tfor");
        columnno += 3;
    #else
        return FOR;
    #endif
}
"break" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("BREAK\tbreak");
        columnno += 5;
    #else
        return BREAK;
    #endif
}
"continue" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("CONTINUE\tcontinue");
        columnno += 8;
    #else
        return CONTINUE;
    #endif
}
"=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ASSIGN\t=");
        columnno += 1;
    #else
        return ASSIGN;
    #endif
}
"&&" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("AND\t&&");
        columnno += 2;
    #else
        return AND;
    #endif
}
"||" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("OR\t||");
        columnno += 2;
    #else
        return OR;
    #endif    
}
"!=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("NOTEQUAL\t!=");
        columnno += 2;
    #else
        return NOTEQUAL;
    #endif
}
"!" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("NON\t!");
        columnno += 1;
    #else
        return NON;
    #endif
}
"==" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("EQUAL\t==");
        columnno += 2;
    #else
        return EQUAL;
    #endif
}
">" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("GREATER\t>");
        columnno += 1;
    #else
        return GREATER;
    #endif
}
"<" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LESS\t<");
        columnno += 1;
    #else
        return LESS;
    #endif
}
">=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("GORE\t>=");
        columnno += 2;
    #else
        return GORE;
    #endif
}
"<=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LORE\t<=");
        columnno += 2;
    #else
        return LORE;
    #endif
}
"+" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ADD\t+");
        columnno += 1;
    #else
        return ADD;
    #endif
}
"-" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("SUB\t-");
        columnno += 1;
    #else
        return SUB;
    #endif
}
"*" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("MUL\t*");
        columnno += 1;
    #else
        return MUL;
    #endif
}
"/" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("DIV\t/");
        columnno += 1;
    #else
        return DIV;
    #endif
}
"%" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("MOD\t%");
        columnno += 1;
    #else
        return MOD;
    #endif
}
";" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("SEMICOLON\t;");
        columnno += 1;
    #else
        return SEMICOLON;
    #endif
}
"(" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LPAREN\t(");
        columnno += 1;
    #else
        return LPAREN;
    #endif
}
")" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RPAREN\t)");
        columnno += 1;
    #else
    return RPAREN;
    #endif
}
"[" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LBRACK\t[");
        columnno += 1;
    #else
        return LBRACK;
    #endif
}
"]" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RBRACK\t]");
        columnno += 1;
    #else
        return RBRACK;
    #endif
}
"{" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LBRACE\t{");
        columnno += 1;
        string* sign = new string;
        *sign = "local";
        scope_stack.push(sign);
    #else
        return LBRACE;
    #endif
}
"}" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RBRACE\t}");
        columnno += 1;
        scope_stack.pop();
    #else
        return RBRACE;
    #endif
}
"," {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("COMMA\t,");
        columnno += 1;
    #else
        return COMMA;
    #endif    
}
"&" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("BITAND\t,");
        columnno += 1;
    #else
        return BITAND;
    #endif
}
"|" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("BITOR\t,");
        columnno += 1;
    #else
        return BITOR;
    #endif
}

{LINECOMMENT} {;}
{BLOCKCOMMENT_BEGIN} {BEGIN BLOCKCOMMENT;}
<BLOCKCOMMENT>{BLOCKCOMMENT_ELEMENT} {}
<BLOCKCOMMENT>{EOL} {yylineno++;}
<BLOCKCOMMENT>{BLOCKCOMMENT_END} {BEGIN INITIAL;}

{DECIMIAL} {
            #ifdef ONLY_FOR_LEX
                string temp = yytext;
                int_table[temp] = stoi(temp);
                DEBUG_FOR_INT_LAB4("DECIMIAL\t" + temp, int_table[temp]);
                // cout << int_table[temp] << " " << typeid(int_table[temp]).name() << endl; // 确定输出为int类型
                columnno += strlen(yytext);
            #else
                return INTEGER;
            #endif
            }
{FLOATDECIMAL} {
            #ifdef ONLY_FOR_LEX
                string temp = yytext;
                float_table[temp] = stof(temp);
                DEBUG_FOR_FLOAT_LAB4("FLOATDECIMAL\t" + temp, float_table[temp]);
                columnno += strlen(yytext);
            #else
                return FLOATNUM;
            #endif
            }
{OCTAL} {
            #ifdef ONLY_FOR_LEX
                string temp = yytext;
                int_table[temp] = stoi(temp, 0, 8);
                DEBUG_FOR_INT_LAB4("OCTAL\t" + temp, int_table[temp]);
                columnno += strlen(yytext);
            #else
                return INTEGER;
            #endif
    }
{HEXDECIMIAL} {
            #ifdef ONLY_FOR_LEX
                string temp = yytext;
                int_table[temp] = stoi(temp, 0, 16);
                DEBUG_FOR_INT_LAB4("HEXDECIMIAL\t" + temp, int_table[temp]);
                columnno += strlen(yytext);
            #else
                return INTEGER;
            #endif
    }
{ID} {
    #ifdef ONLY_FOR_LEX
        string name = yytext;
        string ID_type; // 词法分析不处理这个
        for(int i = 0; i < 2; i++){
            if(test_symbol[i].symbol_name == yytext){
                ID_type = test_symbol[i].type;
            }
            else{
                ID_type = "";
            }
        }
        test_symbol[symbol_num] = SymbolTable(name, ID_type, scope_stack.top());
        string* back = scope_stack.top();
        char temp[100];
        sprintf(temp, "%#lx", long(back));
        string hex_scope = temp;
        DEBUG_FOR_ID_LAB4("ID\t" + test_symbol[symbol_num].symbol_name, hex_scope);
        symbol_num++;
        columnno += strlen(yytext);
    #else
        return ID;
    #endif
    }
{EOL} { 
      columnno += strlen(yytext);
      yylineno++; 
      columnno = 0; 
    }
{WHITE} {columnno++;}



%%

#ifdef ONLY_FOR_LEX
int main(int argc, char **argv){
    if(argc != 5){
        fprintf(stderr, "Argument Not Enough");
        exit(EXIT_FAILURE);
    }

    if(!(yyin = fopen(argv[1], "r"))){
        fprintf(stderr, "No such file or directory: %s", argv[1]);
        exit(EXIT_FAILURE);
    }

    if(!(yyout = fopen(argv[3], "w"))){
        fprintf(stderr, "No such file or directory: %s", argv[3]);
        exit(EXIT_FAILURE);
    }
    string Frame_Info = tab + "1:token" + " " + "2:lexme" + " " + "3:lineno" + " " + "4:columnno" + " " + "5:attribute" + "\n" + "\n" + "\n";
    fputs(Frame_Info.c_str(), yyout);

    // yylex分析之前先初始化一下保留字，作用域初始化为global
    test_symbol[0] = SymbolTable("getint", "PLT", nullptr, 1);
    test_symbol[1] = SymbolTable("putint", "PLT", nullptr, 1);
    symbol_num += 2;
    string start = "global";
    scope_stack.push(&start);

    yylex();
    
    for(auto it : int_table){
	    cout << it.first <<" "<< it.second <<endl;
    }

    for(auto it : float_table){
	    cout << it.first <<" "<< it.second <<endl;
    }
    for(int i = 0; i < symbol_num; i++){
        cout << test_symbol[i].symbol_name << " " << test_symbol[i].reserved << endl;
    }

    return 0;
}
#endif