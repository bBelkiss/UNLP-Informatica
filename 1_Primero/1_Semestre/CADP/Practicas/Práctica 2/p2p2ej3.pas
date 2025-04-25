program ejercicio5;
{ suma los números entre a y b, y retorna el resultado en c }
// Error 1 corregido: Se agregó punto y coma al final de la declaración
// Error 3 corregido: Se agregó 'var' antes de c para pasarlo por referencia
procedure sumar(a, b : integer; var c : integer);
var
  suma : integer;
  i : integer; // Error 2 corregido: Se declaró la variable i del bucle
begin
  for i := a to b do
    suma := suma + i;
  c := c + suma;
end;
var
  result : integer;
  a, b : integer; // Error 4 corregido: Se declararon a y b
  ok : boolean;   // Error 6 corregido: Se declaró la variable ok
begin
  result := 0;
  readln(a); readln(b);
  // Error 5 corregido: Se pasa result para almacenar el resultado
  sumar(a, b, result);
  write('La suma total es ', result);
  // Error 6 corregido: Se cambió OR por AND para la condición de rango
  ok := (result >= 10) and (result <= 30);
  if (not ok) then
    write('La suma no quedó entre 10 y 30');
end.