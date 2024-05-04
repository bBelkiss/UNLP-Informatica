{  Dado los siguientes programas, explicar la diferencia. }

program alcance4a;
var a,b: integer;
procedure uno;
begin
    a := 1;
    writeln(a);
end;
begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a);
end.

// Segundo codigo
program alcance4b;
procedure uno;
begin
    a := 1;
    writeln(a);
end;
var a,b: integer;
begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a);
end.

{ En el alcance A las variables estan declaradas como globales, se ejecutan bien. 
En el alcance B no se declara ninguna global, sino que ahora las declara como locales al programa, 
ni siquiera interna al proceso por lo que hay error interno del proceso. }