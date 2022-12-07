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
#include <string.h>
#ifndef YYSTYPE
#define YYSTYPE char*
#endif
char idStr[50];
char numStr[50];
int yylex();
extern int yyparse();
FILE* yyin;
void yyerror(const char* s);
%}

%token NUMBER
%token ID
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

lines : lines expr ';' { printf("%s\n", $2); }
	| lines ';'
	|
	;

expr : expr ADD expr { $$ = (char *)malloc(50*sizeof (char)); 
                       strcpy($$,$1);
                       strcat($$,$3); 
                       strcat($$,"+ "); }
	| expr SUB expr { $$ = (char *)malloc(50*sizeof (char)); 
                      strcpy($$,$1);
                      strcat($$,$3); 
                      strcat($$,"- "); }
	| expr MUL expr { $$ = (char *)malloc(50*sizeof (char)); 
                      strcpy($$,$1);
                      strcat($$,$3);
                      strcat($$,"* "); }
	| expr DIV expr { $$ = (char *)malloc(50*sizeof (char)); 
                      strcpy($$,$1);
                      strcat($$,$3);
                      strcat($$,"/ "); }
	| LEFT_BRA expr RIGHT_BRA { $$ = (char *)malloc(50*sizeof (char)); 
                                strcpy($$,$2); }
	| SUB expr %prec UMINUS { $$ = (char *)malloc(50*sizeof (char));
                              strcpy($$,"-");
                              strcat($$,$2); }
	| NUMBER { $$ = (char *)malloc(50*sizeof (char));
               strcpy($$, $1); 
               strcat($$," "); }
    | ID { $$ = (char *)malloc(50*sizeof (char));
           strcpy($$, $1); 
           strcat($$," "); }
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
        // 忽略空格、换行符、制表符
        if(t == ' ' || t == '\t' || t == '\n'){

        }
        // 如果识别到字符1-9，说明是数字，返回数字串
        else if(( t >= '0' && t <= '9' )){
            int i = 0;
            while(( t >= '0' && t <= '9' )){
                numStr[i] = t;
                t = getchar();
                i++;
            }
            numStr[i] = '\0';
            yylval = numStr;
            ungetc(t, stdin);
            return NUMBER;
        }
        // 如果开头是字母或下划线，则是identifier
        else if(( t >= 'a' && t <= 'z' ) || ( t >= 'A' && t<= 'Z' ) || ( t == '_' )){
            int i = 0;
            while(( t >= 'a' && t <= 'z' ) || ( t >= 'A' && t<= 'Z' ) || ( t == '_' ) || ( t >= '0' && t <= '9' )){
                idStr[i] = t;
                t = getchar();
                i++;
            }
            idStr[i] = '\0';
            yylval = idStr;
            ungetc(t, stdin);
            return ID;
        }
        // 遇到终结符
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