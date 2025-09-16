## CleanBotVM

# Linguagem estruturada (EBNF) 

```bash

programa        = { comando } ;

comando         = mover_cmd
                | virar_cmd
                | limpar_cmd
                | print_cmd
                | atribuicao
                | condicional
                | loop ;

mover_cmd       = "mover" "(" ")" ";" ;
virar_cmd       = "virar_direita" "(" ")" ";" ;
limpar_cmd      = "limpar" "(" ")" ";" ;
print_cmd       = "print" "(" expressao ")" ";" ;
atribuicao      = identificador "=" expressao ";" ;

condicional     = "se" expressao "entao" { comando } [ "senao" { comando } ] "fim" ;

loop            = "enquanto" expressao { comando } "fim" ;

expressao       = termo { operador_logico termo } ;
termo           = fator { operador_aritmetico fator } ;
fator           = numero
                | booleano
                | identificador
                | funcao_embutida
                | "not" fator
                | "(" expressao ")" ;

funcao_embutida = "sujeira_aqui" "(" ")"
                | "frente_bloqueada" "(" ")"
                | "existe_sujeira" "(" ")"
                | "bateria" ;

operador_logico     = "and" | "or" | "==" | "!=" | ">=" | "<=" | ">" | "<" ;
operador_aritmetico = "+" | "-" | "*" | "/" ;

booleano        = "true" | "false" ;
identificador   = letra { letra | digito | "_" } ;
numero          = digito { digito } ;
string          = '"' { caractere } '"' ;

letra           = "a" | ... | "z" | "A" | ... | "Z" ;
digito          = "0" | ... | "9" ;
caractere       = qualquer caractere visível exceto aspas duplas ; 

```

# Exemplo de uso:

```bash
enquanto existe_sujeira() and bateria > 0
    se not frente_bloqueada()
        mover();
    senao
        virar_direita();
    fim

    se sujeira_aqui()
        limpar();
    fim
fim

print("Tarefa concluída");
```
