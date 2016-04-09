%{
	#include <math.h>
	#include <stdio.h>
%}
%union{
	double dval;
	}
%token <dval> NUMBER
%token PLUS MINUS TIMES DIVIDE POWER
%token LEFT_PARENTHESIS RIGHT_PARENTHESIS
%token NUMENT NUMFLO
%token END
%left PLUS MINUS
%left TIMES DIVIDE
%left NEG
%right POWER
%type <dval> Expression
%type <dval> Nument
%type <dval> Numflo
%start Input
%%

Input:	Line
		| Input Line
		| Nument
		| Numflo
		;

Nument:	NUMENT END {printf("Entero\n\n"); }
	;

Numflo: NUMFLO END {printf("Flotante\n\n"); }
	;

Line: 	END
		| Expression END { printf("Result: %f\n",$1); }
		;

Expression: NUMBER { $$=$1;}
	| Expression PLUS Expression {$$=$1+$3; } 
	| Expression MINUS Expression { $$=$1-$3; }
	| Expression TIMES Expression { $$=$1*$3; }
	| Expression DIVIDE Expression { $$=$1/$3; }
	| MINUS Expression %prec NEG { $$=-$2; }
	| Expression POWER Expression { $$=pow($1,$3); }
	| LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=$2;}
	;

%%

int yyerror(char *s) {
	printf("%s\n",s);
	}
	
int main(void) { 
	yyparse();
	}