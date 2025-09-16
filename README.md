# CleanBotVM

## CleanLang++ - Linguagem estruturada (EBNF) 

```bash

programa            = { instrucao } ;

instrucao           = loop
                    | condicional
                    | comando_simples
                    | exibir ;

loop                = "Enquanto houver sujeira:" { instrucao } "Fim" 
                    | "Enquanto houver bateria:" { instrucao } "Fim";

condicional         = "Se" condicao "," comando_simples
                    | "Senão," comando_simples ; 

comando_simples     = "virar" "."
                    | "andar" "."
                    | "limpar" "." ;

exibir              = "Exibir" string "." ; 

condicao            = "bloqueado"
                    | "sujo"
                    | "bateria baixa"
                    | "bateria" operador numero ;

operador            = ">" | "<" | ">=" | "<=" | "==" | "!=" ;

string              = '"' { caractere } '"' ;
numero              = digito { digito } ;

caractere           = qualquer caractere visível exceto aspas duplas ;
digito              = "0" |...| "9" ;


```

## Exemplo de uso:

```bash
Enquanto houver bateria:
    Enquanto houver sujeira:
        Se bloqueado, virar.
        Senão, andar.
        Se sujo, limpar.
    Fim

    Exibir "Limpeza concluída".
Fim

Exibir "Bateria fraca". 
```
