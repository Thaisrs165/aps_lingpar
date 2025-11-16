# CleanBotVM

**CleanLang** é uma linguagem de programação simples criada para controlar um robô de limpeza (CleanBot).

O projeto foi desenvolvido com **Flex** e **Bison**, e cobre todas as etapas de um compilador:
análise léxica, sintática, semântica e execução em uma **Máquina Virtual** (VM) própria.

## Estrutura do Projeto

| Arquivo | Função |
|----------|--------|
| `lexer.l` | Analisador léxico (Flex) — identifica palavras e símbolos. |
| `parser.y` | Analisador sintático e semântico (Bison) — valida a estrutura do código. |
| `cleanbot_vm.c` | Máquina virtual — executa o código gerado pela linguagem. |
| `teste.clean` | Programa exemplo em CleanLang. |
| `Makefile` | Automação da compilação. |


## Como Compilar e Executar

```bash
# 1. Gerar o analisador léxico e sintático
flex lexer.l
bison -d parser.y

# 2. Compilar o compilador
gcc lex.yy.c parser.tab.c -o cleanlang

# 3. Compilar a Máquina Virtual
gcc cleanbot_vm.c -o cleanbot_vm

# 4. Rodar um programa CleanLang
./cleanlang teste.clean
```

## Slides apresentação

https://docs.google.com/presentation/d/1hdZkYi8bdCgLE1zMz3A2QgFyvosn0RGXR8eT4_9U_9Q/edit?usp=sharing

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
