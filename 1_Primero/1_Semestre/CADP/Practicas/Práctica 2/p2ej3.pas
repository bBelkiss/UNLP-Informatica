{ Dado el siguiente programa, indicar cuál es el error y su causa. }

program p2ej3;
var 
    a: integer;
procedure uno;
    var 
        b: integer;
begin
    b:= 2;
    writeln(b);
end;
begin
    a:= 1;
    uno;
    writeln(a, b);
end.

{ El error se produce cuando se quiere imprimir las variables a y b. 
Se causa debido que solo se declara una variable local del programa (a). 
La variable (b) se encuentra declarada unicamente dentro del proceso uno, 
por eso se imprime dentro del proceso, pero al querer hacerlo afuera 
no se encuentra la direccion de memoria. }
