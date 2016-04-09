%{
int yystopparser=0;
%}
 
/*TOKENS*/
	%token ID
	%token ENTERO
	%token FLOTANTE
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

dec 	:	tipo ID
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