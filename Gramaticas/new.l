%option noyywrap
%{
# include <string.h>
int caracteres_contar = 0;
int palabras_contar = 0;
int líneas_contar = 0;
int vocales_contar =0;
%}

%%
[aeiouAEIOU] { vocales_contar++; caracteres_contar++; }       // Contar vocales y caracteres
[a-zA-Z]+  { palabra_contar++; caracteres_contar += yyleng; }  // Contar palabras y caracteres
\n         { lineas_contar++; caracteres_contar++; }          // Contar líneas y el carácter de nueva línea
.          { caracteres_contar++; }                        // Contar cualquier otro carácter
%%
main(int argc, char **argv)
{
  if(argc > 1) {
    if(!(yyin = fopen(argv[1], "r"))) {
      perror(argv[1]);
      return (1);
    }
    yylex();
    printf("Lineas: %8d  Palabras: %8d  Caracteres: %8d vocales: %8d \n", líneas_contar, palabras_contar, caracteres_contar,vocales_contar);
  }
}