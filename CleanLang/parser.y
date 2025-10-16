%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yylineno;
extern FILE *yyin;
void yyerror(const char *s);

int parse_errors = 0;
%}

%union {
    int num;
    char *str;
}

%token <num> NUMBER
%token <str> ID STRING

%token DEF COMO
%token ENQUANTO HOUVER SUJEIRA BATERIA
%token SE SENAO
%token VIRAR ANDAR LIMPAR
%token EXIBIR
%token FIM

%token BLOQUEADO SUJO BAIXA

%token EQ NEQ GT LT GE LE PLUS

%token ASSIGN DOT COMMA COLON

%left PLUS


%%

programa:
      | programa instrucao
    ;

instrucao:
      loop
    | condicional
    | comando_simples DOT
    | declaracao_var DOT
    | atribuicao DOT
    | exibir DOT
    ;

loop:
      ENQUANTO HOUVER SUJEIRA COLON instr_block FIM
    | ENQUANTO HOUVER BATERIA COLON instr_block FIM
    ;

instr_block:
      instrucao
    | instr_block instrucao
    ;

condicional:
      SE condicao COMMA instr_block opt_senao
    ;

opt_senao:
      | SENAO COMMA instr_block
    ;

comando_simples:
      VIRAR
    | ANDAR
    | LIMPAR
    ;

exibir:
      EXIBIR STRING
    ;

declaracao_var:
      DEF ID COMO NUMBER
    ;

atribuicao:
      ID ASSIGN expressao
    ;

condicao:
      BLOQUEADO
    | SUJO
    | BATERIA BAIXA
    | BATERIA operador NUMBER
    | ID operador NUMBER
    ;

expressao:
      NUMBER
    | ID
    | ID PLUS NUMBER
    ;

operador:
      GT
    | LT
    | GE
    | LE
    | EQ
    | NEQ
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Erro sintático na linha %d: %s\n", yylineno, s);
    parse_errors = 1;
}

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *f = fopen(argv[1], "r");
        if (!f) { perror("fopen"); return 1; }
        yyin = f;
    }
    parse_errors = 0;
    yyparse();
    if (parse_errors == 0) {
        printf("Programa valido (analise lexica + sintatica OK).\n");
        return 0;
    } else {
        printf("Programa invalido (erros sintaticos encontrados).\n");
        return 2;
    }
}



