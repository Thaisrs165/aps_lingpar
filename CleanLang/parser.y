%{

#define YYDEBUG 1
int yydebug = 1;

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yylineno;
extern FILE *yyin;
void yyerror(const char *s);


/* ---------------- ANALISE SEMANTICA ---------------- */
#define MAX_SYMBOLS 256

typedef struct {
    char name[64];
    int initialized;
} Symbol;

Symbol symbols[MAX_SYMBOLS];
int symbol_count = 0;


int lookup_symbol(const char *name) {
    for (int i = 0; i < symbol_count; i++) {
        if (strcmp(symbols[i].name, name) == 0)
            return i;
    }
    return -1;
}


int add_symbol(const char *name) {
    if (lookup_symbol(name) != -1) {
        fprintf(stderr, "Erro semântico: variável '%s' já declarada.\n", name);
        return -1;
    }
    if (symbol_count >= MAX_SYMBOLS) {
        fprintf(stderr, "Erro: limite de símbolos atingido.\n");
        return -1;
    }
    strcpy(symbols[symbol_count].name, name);
    symbols[symbol_count].initialized = 0;
    return symbol_count++;
}


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
    | comando_simples
    | declaracao_var
    | atribuicao
    | exibir
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
        {
            add_symbol($2);
        }
;

atribuicao:
      ID ASSIGN expressao
        {
            int idx = lookup_symbol($1);
            if (idx == -1) {
                fprintf(stderr, "Erro semântico: variável '%s' não declarada.\n", $1);
            } else {
                symbols[idx].initialized = 1;
            }
        }
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
        {
            int idx = lookup_symbol($1);
            if (idx == -1) {
                fprintf(stderr, "Erro semântico: variável '%s' não declarada.\n", $1);
            } else if (!symbols[idx].initialized) {
                fprintf(stderr, "Aviso: variável '%s' usada antes de ser inicializada.\n", $1);
            }
        }
    | ID PLUS NUMBER
        {
            int idx = lookup_symbol($1);
            if (idx == -1) {
                fprintf(stderr, "Erro semântico: variável '%s' não declarada.\n", $1);
            } else if (!symbols[idx].initialized) {
                fprintf(stderr, "Aviso: variável '%s' usada antes de ser inicializada.\n", $1);
            }
        }
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



