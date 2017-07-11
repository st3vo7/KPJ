%option noyywrap
%option nounput
%{
#include <iostream>
#include <cstdlib>
#include <string>
//#include "haskell.hpp"

using namespace std;

#include "parser.tab.hpp"
%}

%%
"print"[ ]["].+["]              {yylval.s = new string(yytext); return Stampa;}
[0-9]+([.][0-9]+)?              {yylval.num = atof(yytext);return num_token;}
"div"                           {return div_token;}
"mod"                           {return mod_token;}
"sqrt"                          {return sqrt_token;}
"it"                            {return it_token;}
"abs"                           {return abs_token;}
"let"                           {return let_token;}
[a-zA-Z_][a-zA-Z0-9_]*          {yylval.s = new string(yytext); return id_token;}
[-+":()*\n/=]                    {return *yytext;}
[ \t]                           {  }
.                   {cerr<<"Leksicka greska! Neprepoznat karakter: "<<*yytext<<endl;
                     exit(EXIT_FAILURE);
                    }



%%