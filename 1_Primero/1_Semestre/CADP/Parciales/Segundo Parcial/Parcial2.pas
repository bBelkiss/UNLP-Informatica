{ Un supermercado esta procesando las compras que realizaron sus clientes. Para ello,
dispone de una estructura de datos con todas las compras realizadas, sin ningún orden en particular.
De cada compra se conoce: código, año (entre 1980 y 2024), monto y DNI. Un cliente puede haber
realizado mas de una compra.
Realiza un programa que procese la información de las compras y:
a) Almacene en otra estructura de datos las compras realizadas entre los años 2010 y 2020. Esta estructura
debe quedar ordenada por el DNI del cliente.
b) Una vez almacenada la estructura del inciso a, procesar estos datos e informar:
    1- El año con menor facturación.
    2- Los dos DNI de los clientes que realizaron la mayor cantidad de compras.
    3- COMPLETO: El monto total facturado de compras con código múltiplo de 10.}

program Parcial2;
type
    rango_años = 1980..2024;
    compra = record 
        codigo: integer;
        mes: rango_meses;
        año: rango_años;
        monto: real;
        DNI: integer;
    end;
    lista = ^nodo;
    nodo = record
        dato: compra;
        sig: lista;
    end;
    vector = array[2010..2020] of real;
procedure cargarLista(var l: lista);
// se dispone
procedure insertarOrdenado(var l: lista; c: compra);
var
    ant, act, aux: lista;
begin
    new(aux);
    aux^.dato := c;
    act := l;
    while (act <> nil) and (l^.dato.DNi <> c.dni) do
    begin
        ant := act;
        act := act^.sig;
    end;
    // si quede al inicio
    // si no quede al inicio
end;
procedure comprasDelAño(l: lista; var l2: lista; año1, año2: rango_años);
begin
    while (l <> nil) do begin
        if l^.dato.año >= año 1 and l^.dato.año <= año2 then
        insertarOrdenado(l2, l^.dato.año);
    l := l^.sig;
    end;
end;
procedure inicializarVector(var v: vector);
var 
    i: rango_meses;
begin
    for i: 1 to 12 do
    v[i] := 0
end;
procedure dosPeoresMeses(v: vector);
var
    i, mes_min1, mes_min2: rango_meses;
    min1, min2: real;
begin
    min1 := 9999;
    min2 := 9999;
    for i := 1 to 12 do
        if (v[i] < min1) then begin
            min2 := min1:
            mes_min2 := mes_min1;
            min1 := v[i];
            mes_min1 := i;
        end;
        else if v[i] < min2 then begin
            min2 := v[i];
            mes_min2 := i;
        end;
    writeln('Los dos meses con menor facturación fueron', mes_min1, mes_min2);
end;
procedure actualizarMaximos(dniActual, cantComprasActual: integer; var dni1, dni2, cantCompras1, cantCompras2: integer);
begin
    if (cantComprasActual > cantCompras1) then
    begin
        cantCompras2 := cantCompras1;
        dni2 := dni1;
        cantCompras1 := cantComprasActual;
        dni1 := dniActual;
    end;
    else if (cantComprasActual > cantCompras2) then
    begin
        cantCompras2 := cantComprasActual;
        dni2 := dniActual;
    end;
end;
procedure procesarCompras(l: lista);
var
    dniActual, cantComprasActual, cantCompras: integer;
    dni1, dni2 cantCompras1, cantCompras2: integer;
    montoTotal: real;
    v: vector;
begin
    inicializarVector(v);
    cantCompras := 0;
    cantCompras1 := -1;
    cantCompras2 := -1;
    while (l <> nil) do begin
        dniActual := l^.dato.DNI;
        cantComprasActual := 0;
        while (l <> nil) and (l^.dato.dni = dniActual) do begin
            cantComprasActual := cantComprasActual + 1;
            v[l^.dato.año] := v[l^.dato.año] + l^.dato.monto;
            if ((l^.dato.codigo MOD 10) = 0) then
                cantCompras1 := cantCompras1 + 1;
            l := l^.sig;
        end;
        actualizarMaximos(dniActual, cantComprasActual, dni1, dni2, cantCompras1, cantCompras2);
    end;
    writeln(cantCompras);
    peorAño(v);
    writeln(dni1, dni2);
end;
var
    l, l2: lista;
    año: rango_años;
begin
    cargarLista(l); // se dispone
    l2 := nil; // inciso a
    comprasDelAño(l, l2, 2010, 2020); // inciso a
    procesarCompras(l2); // inciso b
end;