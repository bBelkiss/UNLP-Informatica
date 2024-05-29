{10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}

program Ej10;
const
    dimF = 300;
type
    rango= 1..dimF;
    vec_Empleados = array [rango] of real;
function promedio (sueldoTotal:real; dimL:rango):real;
begin   
    promedio:=sueldoTotal/dimL;
end;
Procedure incrementarsueldo (x: real; var v: vec_Empleados; dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimL do
     v[i]:= v[i] + (v[i]*x);
end;
procedure imprimir (v: vec_Empleados;dimL:integer);
var
     i: integer;
     total_sueldo:real;
Begin
    total_sueldo:=0;
    for i:=1 to dimL do
	    total_sueldo:= total_sueldo + v[i];
    writeln('El sueldo promedio de los empleados de la empresa es: $ ',(total_sueldo/dimL):2:2);
end;
procedure cargarsueldos (var v:vec_Empleados; var dimL:integer);
var
    sueldo:real;
begin
    writeln('Sueldo:');
    readln(sueldo);
    while (sueldo <> 0 ) and (dimL<dimF) do begin
        dimL:=dimL+1;
        v[dimL]:=sueldo;
        writeln('Sueldo:');
        readln(sueldo);
    end;
end;
var
    vec:vec_Empleados;
    i,dimL:integer;
    numX:real;
begin
    dimL:=0;
    numX:=1.15;
    cargarsueldos(vec,dimL);
    incrementarsueldo(numX,vec,dimL);
    imprimir(vec,dimL);
end.