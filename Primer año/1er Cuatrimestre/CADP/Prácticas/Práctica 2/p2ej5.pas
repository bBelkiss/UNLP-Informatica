{ Dado el siguiente programa, indicar cuál es el error. }

program alcance4;
function cuatro: integer;
begin
    cuatro:= 4;
end;
var 
    a: integer;
begin
    cuatro;
    writeln(a);
end.

{ El error es que no se le asigna la variable a la que la funcion tiene que convertir en 4
Se corrige con una linea "a:= cuatro;" } 