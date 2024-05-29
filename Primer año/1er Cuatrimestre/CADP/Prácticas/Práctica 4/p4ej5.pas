{5-Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”}

program Ej5;
const
    dimF = 100;
    dimF = 5;
type
    rangoDimL=0..dimF;
    rangoVec = 1..dimF;
    vectorNumeros = array [rangoVec] of integer;
function elementoMaximo (v:vectorNumeros; dimL:rangoDimL): rangoVec;
var
    indicemax:rangoVec;
    i, max:integer;
begin
    max:=-1;
    for i:=1 to dimL do begin
        If(v[i] > max) then begin 
            max:= v[i]; 
            indicemax:= i; 
        end;
    end;
    elementoMaximo:= indicemax;
end;

function elementoMinimo (v:vectorNumeros; dimL:rangoVec): rangoVec;
var
    i,min:integer;
    indicemin:rangoVec;
begin
    min:=999;
    for i:=1 to dimL do begin 
        If(v[i] < min) then begin
            min:= v[i]; 
            indicemin:= i;
        end;
    end;
    elementoMinimo:=indicemin;
end;
procedure intercambiar (var v: vectorNumeros; elemMax, elemMin:rangoDimL); 
var
    aux:integer;
begin
    aux:= v[elemMax];
    v[elemMax] := v[elemMin];
    v[elemMin] := aux;
    writeln('El elemento máximo ', v[elemMin],' que se encontraba en la posición ', elemMin, 'fue intercambiado con el elemento mínimo ',v[elemMax],' que se encontraba en la posición ' ,elemMax);
end;
procedure cargarVec (var v:vectorNumeros; var dimL:rangoDimL);
var
    num:integer;
begin   
    dimL:=0;
    writeln('Ingrese un numero entero:');
    readln(num);
    while (num <> 0) and (dimL < dimF) do begin
        dimL:=dimL+1;
        v[dimL]:= num;
        writeln('Ingrese un numero entero:');
        readln(num);
    end;
end;
var
    v:vectorNumeros;
    dimL,posMayor,posMenor: rangoDimL;
begin
  cargarVec(v,dimL);
  posMayor:= elementoMaximo(v,dimL);
  posMenor:= elementoMinimo(v,dimL);
  intercambiar (v,posMayor,posMenor);
end.