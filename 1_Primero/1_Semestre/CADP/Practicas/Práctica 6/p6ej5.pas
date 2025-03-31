{ 5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se
ingresa el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular
e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos. }

program Ej5;
type
    cadena50=string[50];
    producto = record
        cod:integer;
        descrip:cadena50;
        stockAct:integer;
        stockMin:integer;
        precio:real;
    end;
    lista = ^nodo;
    nodo = record
        dato:producto;
        sig: lista;
    end;
procedure informar(pri:lista; porcentaje:real; cod1,cod2:integer);
begin
    writeln('Porcentaje de productos con stock actual por debajo de su stock mínimo: ',porcentaje:2:2,' %');
    writeln(cod1,' y ',cod2, 'son los codigos de los dos productos más económicos.');
end;
procedure dosMasEconomicos (precioActual:real;codActual:integer; var min1,min2:real; var cod1,cod2:integer);
begin
    if(precioActual < min1)then begin
        min2:=min1;
        cod2:=cod1;
        min1:=precioActual;
        cod1:=codActual;
    end
    else
    if (precioActual < min2) then begin
        min2:=precioActual;
        cod2:=codActual;
    end;
end;
function calcularPorcentaje(cantidad, total:integer):real;
begin
    calcularPorcentaje:= (cantidad/total)*100;
end;
procedure digitosPares (num:integer;descrip:cadena50);
var
    dig,cantPares:integer;
begin
    cantPares:= 0;
    while (num <> 0) and (cantPares < 3) do begin
        dig:= num mod 10;
        if (dig mod 2 = 0) then
            cantPares:=cantPares+1;
        num:=num div 10;
    end;
    if (cantPares >= 3) then
        writeln(descrip);
end;
function cantStockActMenor(actual,minimo:integer):integer;
begin
    if (actual<minimo) then
        cantStockActMenor:=1
    else
        cantStockActMenor:=0;
end;
procedure recorrerLista(pri:lista; var porcentaje:real;cod1,cod2:integer);
var
    min1,min2:real;
    cantStock,totalProductos:integer;
begin
    min1:=9999;
    min2:=9999;
    cantStock:=0;
    totalProductos:=0;
    while (pri<>nil) do begin
        totalProductos:=totalProductos+1;
        cantStock:=cantStock + cantStockActMenor(pri^.dato.stockAct, pri^.dato.stockMin);
        digitosPares(pri^.dato.cod, pri^.dato.descrip);
        dosMasEconomicos(pri^.dato.precio,pri^.dato.cod,min1,min2,cod1,cod2);
        pri:=pri^.sig;
    end;
    porcentaje:=calcularPorcentaje(cantStock,totalProductos);
end;
procedure agregarAdelante (var l:lista; prod:producto);
var
    aux:lista;
begin
    new(aux);
    aux^.dato:=prod;
    aux^.sig:=l;
    l:=aux;
end;
procedure leerProductos(var prod:producto);
begin
    with prod do begin
        writeln('CODIGO:');
        readln(cod);
        if ( cod <> -1 ) then begin
            writeln('Descripción:');
            readln(descrip);
            writeln('STOCK actual:');
            readln(stockAct);
            writeln('STOCK mínimo:');
            readln(stockMin);
        end;
    end;
end;
procedure generarLista(var pri:lista);
var
    prod:producto;
begin
    leerProductos(prod);
    while (prod.cod <> -1) do begin
        agregarAdelante(pri,prod);
        leerProductos(prod);
    end;
end;
var
    l:lista;
    porcentaje:real;
    cod1,cod2:integer;
begin
    l:=nil;
    generarLista(l);
    recorrerLista(l,porcentaje,cod1,cod2);
    informar(l,porcentaje,cod1,cod2);
end.