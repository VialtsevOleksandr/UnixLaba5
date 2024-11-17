%{
#include "parser.tab.h"
void yyerror(const char *s);
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; } // Розпізнає числа
[ \t]       { /* ігноруємо пробіли і табуляції */ }
\n          { return '\n'; }  // Повертаємо новий рядок як токен для завершення виразу
"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }
"("         { return '('; }
")"         { return ')'; }

. {
    yyerror("Error: Invalid character");
    while (yylex() != '\n'); // Пропускаємо до кінця рядка
    return -1;
}


%%

int yywrap() {
    return 1;
}
