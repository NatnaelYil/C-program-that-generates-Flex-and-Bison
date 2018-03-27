%{
#include <stdio.h>
#include "p5.tab.h"
%}
binaryOperation	UINION|INTERSECT|MINUS|TIMES|JOIN|DIVIDEBY
compare		<|>|<=|>=|=|<>
attribute	CNO|CITY|CNAME|SNO|PNO|TQTY|SNAME|QUOTA|PNAME|COST|AVQTY|S#|STATUS|P#|COLOR|WEIGHT|QTY
relation	S|P|SP|PRDCT|CUST|ORDERS
%%
[ \t]+			;
\n			return 0;
{binaryOperation}	return binaryOperation;
{compare}		return compare;
[0-9]+			return val;
{attribute}		return attribute;
{relation}		return relation;
"RENAME"		return RENAME;
"AS"			return AS;
"WHERE"			return WHERE;
"("			return '(';
")"			return ')';
"["			return '[';
"]"			return ']';
","			return ',';
%%
