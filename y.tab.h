/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ID = 258,
    ENTERO = 259,
    FLOTANTE = 260,
    PR_BEGIN = 261,
    PR_END = 262,
    PR_INT = 263,
    PR_FLOAT = 264,
    IF = 265,
    THEN = 266,
    WHILE = 267,
    DO = 268,
    REPEAT = 269,
    UNTIL = 270,
    PRINT = 271,
    READ = 272,
    OPEN_BRACKET = 273,
    CLOSE_BRACKET = 274,
    ADD = 275,
    SUB = 276,
    MULT = 277,
    DIV = 278,
    MENQ = 279,
    MAYQ = 280,
    IGUAL = 281,
    ASSIGN = 282,
    PCOM = 283
  };
#endif
/* Tokens.  */
#define ID 258
#define ENTERO 259
#define FLOTANTE 260
#define PR_BEGIN 261
#define PR_END 262
#define PR_INT 263
#define PR_FLOAT 264
#define IF 265
#define THEN 266
#define WHILE 267
#define DO 268
#define REPEAT 269
#define UNTIL 270
#define PRINT 271
#define READ 272
#define OPEN_BRACKET 273
#define CLOSE_BRACKET 274
#define ADD 275
#define SUB 276
#define MULT 277
#define DIV 278
#define MENQ 279
#define MAYQ 280
#define IGUAL 281
#define ASSIGN 282
#define PCOM 283

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 22 "gramatica.y" /* yacc.c:1909  */

	int 	intval;
	float 	fval;
	char	*name;

#line 116 "y.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
