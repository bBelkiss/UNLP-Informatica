{2- Dado el siguiente programa, complete las líneas indicadas, considerando que:
a) El módulo cargarVector debe leer números reales y almacenarlos en el vector que se pasa como
parámetro. Al finalizar, debe retornar el vector y su dimensión lógica. La lectura finaliza cuando se ingresa
el valor 0 (que no debe procesarse) o cuando el vector está completo.
b) El módulo modificarVectorySumar debe devolver el vector con todos sus elementos incrementados con
el valor n y también debe devolver la suma de todos los elementos del vector. }

program Ej2;
const
    cant_datos = 150;
type
    vdatos = array[1..cant_datos] of real;
procedure cargarVector(var v:vdatos; var dimL : integer);
var
    nreal:real;
begin
    writeln('Ingrese un numero real:');
    readln(nreal);
    while (nreal <> 0) and (dimL < cant_datos) do begin
        dimL:= dimL+1;
        v[dimL]:=nreal;
        writeln('Ingrese un numero real:');
        readln(nreal);
        
    end;
end;
procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
var
    i:integer;
begin
    for i:= 1 to dimL do begin
        v[i]:= v[i] + n;
        suma:= suma+ v[i];
    end;
end;
var
    datos : vdatos;
    i, dim : integer;
    num, sumaTotal : real;
begin
    dim := 0;
    sumaTotal := 0;
    cargarVector(datos, dim);
    writeln('Ingrese un valor a sumar');
    readln(num);
    modificarVectorySumar(datos, dim, num, sumaTotal);
    writeln('La suma de los valores es: ', sumaTotal);
    writeln('Se procesaron: ',dim, ' números');
end.