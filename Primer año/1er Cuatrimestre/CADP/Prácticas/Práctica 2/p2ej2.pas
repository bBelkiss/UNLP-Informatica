{ Dado el siguiente programa, indicar qué imprime. }

program p2ej2;
var 
    a,b: integer;
procedure uno;
begin
    b := 3;
    writeln(b);
end;
begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a);
end.

{ El programa imprime una vez el valor de b (dentro del proceso b tomara valor 3) 
y luego fuera del proceso es imprime el valor de b(2) pegado al de a (1) }