# CleanBotVM

## CleanLang++ - Linguagem estruturada (EBNF) 

```bash

programa            = { instrucao } ;

instrucao           = loop
                    | condicional
                    | comando_simples
                    | declaracao_var
                    | atribuicao
                    | exibir ;

loop                = "Enquanto houver sujeira:" { instrucao } "Fim"
                    | "Enquanto houver bateria:" { instrucao } "Fim" ;

condicional         = "Se" condicao "," { instrucao }
                    [ "Senão," { instrucao } ] ;

comando_simples     = "virar" "."
                    | "andar" "."
                    | "limpar" "." ;

exibir              = "Exibir" string "." ;

declaracao_var      = "Definir" identificador "como" numero "." ;

atribuicao          = identificador "=" expressao "." ;

condicao            = "bloqueado"
                    | "sujo"
                    | "bateria baixa"
                    | "bateria" operador numero
                    | identificador operador numero ;

operador            = ">" | "<" | ">=" | "<=" | "==" | "!=" ;

expressao           = numero 
                    | identificador 
                    | identificador operador numero ;

identificador       = letra { letra | digito } ;
numero              = digito { digito } ;
string              = '"' { caractere } '"' ;
caractere           = ? qualquer caractere visível exceto aspas duplas ? ;
letra               = "a" | ... | "z" | "A" | ... | "Z" ;
digito              = "0" | ... | "9" ;

```

## Exemplo de uso:

```bash

Definir contador como 0.

Enquanto houver bateria:
    Enquanto houver sujeira:
        Se bloqueado,
            virar.
        Senão,
            andar.
        Se sujo,
            limpar.
        contador = contador + 1.
    Fim

    Exibir "Limpeza concluída".
Fim

Se contador > 10,
    Exibir "Área muito suja.".
Senão,
    Exibir "Área limpa normalmente.".

Exibir "Bateria fraca".

```
