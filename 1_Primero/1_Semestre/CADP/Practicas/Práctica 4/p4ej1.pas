{ 
a) ¿Qué valores toma la variable numeros al finalizar el primer bloque for?
b) Al terminar el programa, ¿con qué valores finaliza la variable números?
c) Si se desea cambiar la línea 11 por la sentencia: for i:=1 to 9 do ¿Cómo debe modificarse el
código para que la variable números contenga los mismos valores que en 1.b)?
d) ¿Qué valores están contenidos en la variable numeros si la líneas 11 y 12 se reemplazan por:
for i:=1 to 9 do
numeros[i+1] := numeros[i]; 
}

program sumador;
type
 vnums = array [1..10] of integer;
var
 numeros : vnums;
 i : integer;
begin
 for i:=1 to 10 do {primer bloque for}
  numeros[i] := i;
for i := 2 to 10 do {segundo bloque for}
 numeros[i] := numeros[i] + numeros [i-1]
end.
  

{ a) El primer for le da valor al num. Luego, el segundo bucle a partir del 2, le suma el número anterior.
  b) 55
  c) numeros[i+1] := numeros[i+1] + numeros[i]
  d) Se queda estancado en 1.
}