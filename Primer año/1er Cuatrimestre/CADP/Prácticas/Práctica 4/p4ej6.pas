{ 6. Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo
y otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva
ambas posiciones }

program Ej6;
const
  dimF = 100;
type
  rangoDimL = 0..dimF;
  rangoVec = 1..dimF;
  vectorNumeros = array [rangoVec] of integer;

procedure cargarVec(var v: vectorNumeros; var dimL: rangoDimL);
var
  num: integer;
begin
  dimL := 0;
  writeln('Ingrese un numero entero:');
  readln(num);
  while (num <> 0) and (dimL < dimF) do
  begin
    dimL := dimL + 1;
    v[dimL] := num;
    writeln('Ingrese un numero entero:');
    readln(num);
  end;
end;
procedure encontrarMaximoYMinimo(v: vectorNumeros; dimL: rangoDimL; var posMax, posMin: rangoDimL);
var
  i: rangoDimL;
  max, min: integer;
begin
  if dimL = 0 then
    exit;
  max := v[1];
  min := v[1];
  posMax := 1;
  posMin := 1;
  for i := 2 to dimL do
  begin
    if v[i] > max then
    begin
      max := v[i];
      posMax := i;
    end;
    if v[i] < min then
    begin
      min := v[i];
      posMin := i;
    end;
  end;
end;
procedure intercambiar(var v: vectorNumeros; posMax, posMin: rangoDimL);
var
  aux: integer;
begin
  aux := v[posMax];
  v[posMax] := v[posMin];
  v[posMin] := aux;
  writeln('El elemento máximo ', v[posMin], ' que se encontraba en la posición ', posMax,
    ' fue intercambiado con el elemento mínimo ', v[posMax], ' que se encontraba en la posición ', posMin);
end;
var
  v: vectorNumeros;
  dimL: rangoDimL;
  posMayor, posMenor: rangoDimL;
begin
  cargarVec(v, dimL);
  if dimL = 0 then
  begin
    writeln('El vector está vacío.');
    exit;
  end;
  encontrarMaximoYMinimo(v, dimL, posMayor, posMenor);
  intercambiar(v, posMayor, posMenor);
end.
