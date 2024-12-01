%{
#include "parser.tab.h"
void yyerror(const char *s);
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; } // ������� �����
[ \t]       { /* �������� ������ � ��������� */ }
\n          { return '\n'; }  // ��������� ����� ����� �� ����� ��� ���������� ������
"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }
"("         { return '('; }
")"         { return ')'; }

. {
    yyerror("Error: Invalid character");
    while (yylex() != '\n'); // ���������� �� ���� �����
    return -1;
}


%%

int yywrap() {
    return 1;
}
