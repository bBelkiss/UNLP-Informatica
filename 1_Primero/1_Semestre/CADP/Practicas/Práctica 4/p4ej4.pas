{ 4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a. posicion: dado un número X y el vector de números, retorna la posición del número X en dicho
vector, o el valor -1 en caso de no encontrarse.
b. intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo
vector donde se intercambiaron los valores de las posiciones x e y.
c. sumaVector: retorna la suma de todos los elementos del vector.
d. promedio: devuelve el valor promedio de los elementos del vector.
e. elementoMaximo: retorna la posición del mayor elemento del vector
f. elementoMinimo: retorna la posicion del menor elemento del vector }

// inciso a
const
  dimF = 100;
type
    vector = array[1..dimF] of integer;
function posicion(vec:vector; dimLog, x: integer):integer;
var
  i: integer;
begin
  i := 1;
  while (i <= dimLog) and (v[i] <> x) do
    i:=i+1;
    if (i <= dimLog) then
      posicion:=i;
      else 
      posicion:= -1;
    end;

// inciso b
procedure intercambio(var v:vector; x,y:integer);
var
    aux: integer;
begin
    aux:= v[x];
    v[x]:=v[y];
    v[y]:=aux;
end;

// inciso c
function sumaVector(v:vector; dimLog:integer):integer;
var
  i: integer;
  suma: integer;
begin
  suma:=0;
  for i:= 1 to dimLog do
    suma:=suma+v[i];
begin
  sumaVector:=suma;
end;

// inciso d
function promedio(dimLog:integer; v:vector):real;
begin
  promedio:=sumaVector(v, dimLog/dimLog);
end;

// inciso e
function elementoMax(v:vector; dimLog:integer):integer;
  var
    i: integer;
    max: integer;
    pos: integer;
begin
    max:=-999;
    for i:= 1 to dimLog do begin
      if (v[i] > max) then
      begin
        max:=v[i];
        pos:=i;
      end;
    elementoMax:=pos
end;

// inciso f
function elementoMin(v:vector; dimLog:integer):integer;
var
    i, min, pos: integer;
begin
  min:=999;
  for i:= 1 to dimLog do begin
    if (v[i] < min) then
    begin
      min:=v[i];
      pos:=i;
    end;
    elementoMin:=pos;
end;