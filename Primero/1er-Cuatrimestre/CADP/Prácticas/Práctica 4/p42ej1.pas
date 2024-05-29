{ 1. a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
n y retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente }

program Ej1;
const
  MAX_VALORES = 500;
type
  vectorEnteros = array[1..MAX_VALORES] of integer;
function estaEnVectorOrdenado(v: vectorEnteros; dimL: integer; n: integer): boolean;
var
  inicio, fin, medio: integer;
begin
  inicio := 1;
  fin := dimL;
  estaEnVectorOrdenado := false;
  while (inicio <= fin) do
  begin
    medio := (inicio + fin) div 2;
    if v[medio] = n then
    begin
      estaEnVectorOrdenado := true;
      exit;
    end
    else if v[medio] < n then
      inicio := medio + 1
    else
      fin := medio - 1;
  end;
end;
var
  vec: vectorEnteros;
  dimL, n, i: integer;
  encontrado: boolean;
begin
  writeln('Ingrese la cantidad de elementos del vector (máximo ', MAX_VALORES, '):');
  readln(dimL);
  writeln('Ingrese los elementos del vector ordenados de manera ascendente:');
  for i := 1 to dimL do
    readln(vec[i]);
  writeln('Ingrese el valor a buscar:');
  readln(n);
  encontrado := estaEnVectorOrdenado(vec, dimL, n);
  if encontrado then
    writeln('El valor ', n, ' se encuentra en el vector.')
  else
    writeln('El valor ', n, ' no se encuentra en el vector.');
end.
