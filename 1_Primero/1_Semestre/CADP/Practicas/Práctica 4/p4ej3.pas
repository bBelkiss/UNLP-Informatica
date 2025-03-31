{ 3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a. Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b. Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c. Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
d. Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde
la posición X hasta la Y. Asuma que tanto X como Y son menores o iguales a la dimensión lógica. Y
considere que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o
hacia atrás.
e. Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c. }

procedure parteA(vec: vector; dimL: integer);
var
    i: integer;
begin
  for i:= 1 to dimL do
    writeln('Posición ', i, ' =', v(i));
end;

procedure parteB(vec: vector; dimL: integer);
var
    i: integer;
begin
  for i:= 1 downto dimL do
    writeln('Posición ', i, ' =', v(i));
end;

procedure parteC(v:vector_numeros; dimL:integer);
var
    i: integer;
begin
    for i:= (dimL div 2) downto 1 do
        writeln('Desde la mitad hacia la primer posición',i,  'contiene:', v[i]);

    for i:= ((dimL div 2)+1) to dimL do
        writeln('desde la mitad más uno hacia la última posición contiene:', v[i]);
end;

procedure parteD (v: vector_numeros; x,y:integer);
var
    i:=integer;
begin
    If (x > y) then begin
        for i:= x to y do
        writeln('El contenido es', v[i]);
    end
    else (y > x) then begin
            for x downto i:= y do
            writeln('El contenido en', v[i]);
    end;
end;    
var
    v:vector_numeros;
    dimL,x,y:integer;
begin
    dimL:=0;
    cargarVector(v, dimL);
    imprimirVec(v,dimL);
    imprimirVecAlreves(v,dimL);
    imprimirMitadVec(v,dimL);
    imprimirXY(v,x,y);
end.