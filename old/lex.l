%{
   #include <stdio.h>
   #include "y.tab.h"
%}
%option noyywrap
%option yylineno
id 			[a-zA-Z]([0-9][a-zA-Z])*
nument		[0-9][0-9]*
numf		{nument}.{nument}
ignora 		" "|\t|\n
operadores	*|+|-|/

%%
{ignora}+	{;}
{id}		{printf("PR id\n");		return ID;}
{nument}	{printf("nument\n");	return ENTERO;}
{numf}		{printf("numf\n");		return FLOTANTE;}
"end"		{printf("PR end\n");	return PR_END;}
"begin"		{printf("PR begin\n");	return PR_BEGIN;}
"int"		{printf("PR int\n");	return PR_INT;}
"float"		{printf("PR float\n");	return PR_FLOAT;}
"if"        {printf("PR if\n");		return IF;}
"then"		{printf("PR then\n");	return THEN;}
"while"		{printf("PR while\n");	return WHILE;}
"do"		{printf("PR do\n");		return DO;}
"repeat"	{printf("PR repeat\n");	return REPEAT;}
"until"		{printf("PR until\n");	return UNTIL;}
"print"		{printf("PR print\n");	return PRINT;}
"read"		{printf("PR read\n");	return READ;}
"("			{printf("SIM (\n");		return OPEN_BRACKET;}
")"			{printf("SIM )\n");		return CLOSE_BRACKET;}
"+"			{printf("SIM +\n");		return ADD;}
"-"			{printf("SIM -\n");		return SUB;}
"*"			{printf("SIM *\n");		return MULT;}
"/"			{printf("SIM /\n");		return DIV;}
"<"			{printf("SIM <\n");		return MENQ;}
">"			{printf("SIM >\n");		return MAYQ;}
"="			{printf("SIM =\n");		return IGUAL;}
":="		{printf("SIM := \n");	return ASSIGN;}
";"			{printf("SIM ;\n");		return PCOM;}
%%

int main(int argc,char *argv[]) {
	if ((yyin = fopen(argv[1], "rt")) == NULL) {
		printf("\nNo se puede abrir el archivo: %s\n", argv[1]);
	}
	else {
		//yylex();
		//printf("Archivo abierto\n");
		yyparse();
	}
	fclose(yyin);
	return 0;
}