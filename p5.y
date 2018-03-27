 %{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
%}
%token RENAME attribute AS relation WHERE binaryOperation compare val
%%
start			:expression
			{printf("\nACCEPT\n");};
expression		:oneRelationExpression
			| twoRelationExpression;
oneRelationExpression	:renaming
			| restriction
			| projection ;
renaming		:term RENAME attribute AS attribute;
term			:relation
			| '(' expression ')';
restriction		:term WHERE comparison;
projection		:term
			| term '[' attributeCommalist ']';
attributeCommalist	:attribute
			| attribute ',' attributeCommalist;
twoRelationExpression	:projection binaryOperation expression;
comparison		:attribute compare number;
number			:val
			|number val;
%%
yyerror()
{
printf("\nREJECT\n");
exit(0);
}
main(int argc, char * argv[]) {
yyin = fopen(argv[1],"r");
yyparse();
}
yywrap()
{
fclose(yyin);
}
