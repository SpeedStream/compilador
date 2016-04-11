%{
	#include <stdlib.h>
	#include <string.h>
	#include "symbols.h"
	int errores = 0;

	addSymbol(char *symbolName){
		symTable *s;
		s = getSymbol(symbolName);
		if (s == 0){		//El símbolo no existe.
			printf("El simbolo %s no existe\n", symbolName);
			s = putSymbol(symbolName);
		} else{		//El símbolo existe
			errores++;
			printf("El simbolo %s ya existe\n", symbolName);
		}
		printf("Errores: %i\n", errores);
	}
%}
 
/*TIPOS*/
%union{
	int 	intval;
	float 	fval;
	char	*name;
};
/*TIPOS*/
/*TOKENS*/
	%token <name>	ID
	%token <intval>	ENTERO
	%token <fval>	FLOTANTE
	%token PR_BEGIN
	%token PR_END
	%token PR_INT
	%token PR_FLOAT
	%token IF
	%token THEN
	%token WHILE
	%token DO
	%token REPEAT
	%token UNTIL
	%token PRINT
	%token READ
	%token OPEN_BRACKET
	%token CLOSE_BRACKET
	%token ADD
	%token SUB
	%token MULT
	%token DIV
	%token MENQ
	%token MAYQ
	%token IGUAL
	%token ASSIGN
	%token PCOM
/*TOKENS*/

/*ORDEN DE OPERADORES*/
	%left ADD SUB
	%left MULT DIV
/*ORDEN DE OPERADORES*/
%start prg
 
%%
prg		:	opt_decls PR_BEGIN opt_stmts PR_END
		;

opt_decls	:	decls
			|
			;

decls 	:	decls PCOM dec
		|	dec
		;

dec 	: tipo ID 	{printf("Simbolo: %s\n", $2); addSymbol( $2 ); }
		;

tipo	:	PR_INT
		|	PR_FLOAT
		;

stmt 	:	ID ASSIGN expr
		|	IF expresion THEN stmt
		|	WHILE expresion DO stmt
		|	REPEAT stmt UNTIL expresion
		|	PR_BEGIN opt_stmts PR_END
		|	PRINT expr
		|	READ ID
		;

opt_stmts 	:	stmt_lst
			;

stmt_lst 	:	stmt_lst PCOM stmt
			|	stmt
			;

expresion 	:	expr MENQ expr
			|	expr MAYQ expr
			|	expr IGUAL expr
			;

expr 	:	expr ADD term
		|	expr SUB term
		|	term
		;

term 	:	term MULT factor
		|	term DIV factor
		|	factor
		;

factor	:	OPEN_BRACKET expr CLOSE_BRACKET
		|	ID
		|	ENTERO
		|	FLOTANTE
		;
