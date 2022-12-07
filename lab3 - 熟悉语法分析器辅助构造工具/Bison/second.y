%{
/**********************************************************************
expr1.y
YACC file
Date: 2022/10/13
黄天昊 <2011763@mail.nankai.edu.cn>
**********************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#ifndef YYSTYPE
#define YYSTYPE double
#endif
int yylex();
extern int yyparse();
FILE* yyin;
void yyerror(const char* s);
%}

%token NUMBER
%token ADD
%token SUB
%token MUL
%token DIV
%token LEFT_BRA
%token RIGHT_BRA
%left ADD SUB
%left MUL DIV
%right UMINUS

%%

lines : lines expr ';' { printf("%f\n", $2); }
	| lines ';'
	|
	;

expr : expr ADD expr { $$ = $1 + $3; }
	| expr SUB expr { $$ = $1 - $3; }
	| expr MUL expr { $$ = $1 * $3; }
	| expr DIV expr { $$ = $1 / $3; }
	| LEFT_BRA expr RIGHT_BRA { $$ = $2; }
	| SUB expr %prec UMINUS { $$ = -$2; }
	| NUMBER { $$ = $1; }
	;

%%

// programs section

int yylex()
{
    // place your token retrieving code here
    int t;
    while(1)
    {
        t = getchar();
        if(t == ' ' || t == '\t' || t == '\n'){

        }
        else if(isdigit(t)){
            yylval = 0;
            while(isdigit(t)){
                yylval = yylval * 10 + t -'0';
                t = getchar();
            }
            ungetc(t, stdin);
            return NUMBER;
        }
        else{
            switch (t)
            {
            case '+':
                return ADD;
                break;
            case '-':
                return SUB;
                break;
            case '*':
                return MUL;
                break;
            case '/':
                return DIV;
                break;
            case '(':
                return LEFT_BRA;
                break;
            case ')':
                return RIGHT_BRA;
                break;
            default:
                return t;
            }
        }
    }
}

int main(void)
{
    yyin = stdin ;
    do {
        yyparse();
        } 
    while (! feof (yyin));
    return 0;
}
void yyerror(const char* s) {
    fprintf (stderr , "Parse error : %s\n", s );
    exit (1);
}
