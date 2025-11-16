/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     NUMBER = 258,
     ID = 259,
     STRING = 260,
     DEF = 261,
     COMO = 262,
     ENQUANTO = 263,
     HOUVER = 264,
     SUJEIRA = 265,
     BATERIA = 266,
     SE = 267,
     SENAO = 268,
     VIRAR = 269,
     ANDAR = 270,
     LIMPAR = 271,
     EXIBIR = 272,
     FIM = 273,
     BLOQUEADO = 274,
     SUJO = 275,
     BAIXA = 276,
     EQ = 277,
     NEQ = 278,
     GT = 279,
     LT = 280,
     GE = 281,
     LE = 282,
     PLUS = 283,
     ASSIGN = 284,
     DOT = 285,
     COMMA = 286,
     COLON = 287
   };
#endif
/* Tokens.  */
#define NUMBER 258
#define ID 259
#define STRING 260
#define DEF 261
#define COMO 262
#define ENQUANTO 263
#define HOUVER 264
#define SUJEIRA 265
#define BATERIA 266
#define SE 267
#define SENAO 268
#define VIRAR 269
#define ANDAR 270
#define LIMPAR 271
#define EXIBIR 272
#define FIM 273
#define BLOQUEADO 274
#define SUJO 275
#define BAIXA 276
#define EQ 277
#define NEQ 278
#define GT 279
#define LT 280
#define GE 281
#define LE 282
#define PLUS 283
#define ASSIGN 284
#define DOT 285
#define COMMA 286
#define COLON 287




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 55 "parser.y"
{
    int num;
    char *str;
}
/* Line 1529 of yacc.c.  */
#line 118 "parser.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

