{7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.}

program Ej7;
const
    dimF = 9;
type
    rangovec = 0..dimF;
    vec_enteros = array [rangovec] of integer;
procedure inicializarContador (var v:vec_enteros);
var 
    i:rangovec;
begin
    for i:=0 to dimF do
        v[i]:=0;
end;
procedure descomponer (var v:vec_enteros; num:integer);
var 
    resto:rangovec;
begin
    while (num <> 0) do begin
        resto:= num MOD 10;
        v[resto]:= v[resto] + 1;
        num:= num div 10;
    end;
end;
procedure actualizarMaximo (num:integer; var max,pos:integer; i:integer);
begin
    if (num>max) then begin
         max := num;
         pos := i;
    end;
end;  
procedure imprimir (v:vec_enteros);
var
    i,max, pos:integer;
begin
    max:=-1;
    pos:=-1;
    for i:=0 to 9 do begin
        actualizarMaximo(v[i],max,pos,i);
        if (v[i] = 0) then
            writeln('El digito ', i, ' no tuvo ocurrencias')
        else
           writeln ('el ', i,' ocurrió ',v[i],' veces.');
    end;
    writeln ('El dígito más leído fue: ', pos);
end; 
var
    v:vec_enteros;
    num:integer;
begin
    inicializarContador(v);
    writeln ('Ingrese un numero:');
    readln(num);
    while (num <> -1) do begin
        descomponer(v,num);
        writeln ('Ingrese un numero:');
        readln(num);
    end;
    imprimir(v);
end.
