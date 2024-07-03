{ Un supermercado está procesando las compras que realizaron sus clientes. Para ello,
disppone de una estructura de datos con todas las compras, sin ningun orden en particular.
De cada compra se conoce codigo, mes, año (entre 2014 y 2024), monto y el DNI del cliente.
Un cliente puede haber realizado mas de una compra.
Realizar un programa que lea de teclado un año y luego:
a) Almacene en otra estructura de datos las compras realizadas en el año leido. Esta estructura
debe quedar ordenada por el DNI del cliente.
b) Una vez almacenada la información, procese los datos del inciso a e informe:
    1- Para cada cliente, el monto total facturado entre todas sus compras.
    2- Los dos meses con menor facturación.
    3- COMPLETO: La cantidad de compras con código multiplo de 10. }

program Parcial1;
type
    rango_meses = 1..12;
    rango_años = 2014..2024;
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
    vector = array[rango_meses] of real;
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
procedure comprasDelAño(l: lista; var l2: lista; año: rango_años);
begin
    while (l <> nil) do begin
        if l^.dato.año = año then
        insertarOrdenado(l2, l^.dato.año)
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
procedure procesarCompras(l: lista);
var
    dniActual, cantCompras: integer;
    montoTotal: real;
    v: vector;
begin
    inicializarVector(v);
    cantCompras := 0;
    while (l <> nil) do begin
        dniActual := l^.dato.DNI;
        montoTotal := 0;
        while (l <> nil) and (l^.dato.DNI = dniActual) do begin
            montoTotal := montoTotal + l^.dato.monto;
            v[l^.dato.mes] := v[l^.dato.mes] + l^.dato.monto;
            if ((l^.dato.codigo MOD 10) = 0) then
                cantCompras := cantCompras + 1;
            l := l^.sig;
        end;
        writeln('Para el cliente', dniActual, ' el monto total fue: ', montoTotal);
    end;
    writeln('La cantidad de compras con codigo multiplo de 10 fue: ', cantCompras);
    dosPeoresMeses(v);
end;
var
    l, l2: lista;
    año: rango_años;
begin
    cargarLista(l); // se dispone
    readln(año); // inciso a
    l2 := nil; // inciso a
    comprasDelAño(l, l2, año); // inciso a
    procesarCompras(l2); // inciso b
end;