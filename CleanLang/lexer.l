%option noyywrap
%option yylineno

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h"
%}

/* -------- REGRAS -------- */
%%
[ \t\r\n]+                      { /* ignora espaços e quebras */ }

"def"|"Def"|"Definir"|"definir"     { return DEF; }
"como"|"Como"                       { return COMO; }

"enquanto"|"Enquanto"               { return ENQUANTO; }
"houver"|"Houver"                   { return HOUVER; }
"sujeira"|"Sujeira"                 { return SUJEIRA; }
"bateria"|"Bateria"                 { return BATERIA; }

"se"|"Se"                           { return SE; }
"senao"|"Senao"|"senão"|"Senão"     { return SENAO; }

"virar"|"Virar"                     { return VIRAR; }
"andar"|"Andar"                     { return ANDAR; }
"limpar"|"Limpar"                   { return LIMPAR; }

"exibir"|"Exibir"                   { return EXIBIR; }
"fim"|"Fim"                         { return FIM; }

"bloqueado"|"Bloqueado"             { return BLOQUEADO; }
"sujo"|"Sujo"                       { return SUJO; }
"baixa"|"Baixa"                     { return BAIXA; }

"=="                                { return EQ; }
"!="                                { return NEQ; }
">="                                { return GE; }
"<="                                { return LE; }
">"                                 { return GT; }
"<"                                 { return LT; }
"+"                                 { return PLUS; }

[0-9]+                              { yylval.num = atoi(yytext); return NUMBER; }

\"([^\"\\]|\\.)*\"                  {
                                        int L = yyleng;
                                        char *s = (char*)malloc(L - 1);
                                        strncpy(s, yytext + 1, L - 2);
                                        s[L - 2] = '\0';
                                        yylval.str = s;
                                        return STRING;
                                    }

[a-zA-Z_][a-zA-Z0-9_]*              { yylval.str = strdup(yytext); return ID; }

":"                                 { return COLON; }
"."                                 { return DOT; }
","                                 { return COMMA; }
"="                                 { return ASSIGN; }
";"                                 { return DOT; }  /* <-- permite usar ponto e vírgula */
.                                   { fprintf(stderr, "Linha %d: caractere desconhecido: '%s'\n", yylineno, yytext); }
%%
