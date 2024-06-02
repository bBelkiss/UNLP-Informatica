{8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista queden
ordenados de manera ascendente (insertar ordenado).
}

program Ej8;
type
    lista = ^nodo;
    nodo = record
    num : integer;
    sig : lista;
end;
var
    pri : lista;
    valor : integer;
procedure armarNodo(var L: lista; v: integer);
var ant, nue, act: lista;
begin
  new (nue);
  nue^.num := v;
  act := pri;
  ant := pri;
  while (act<>NIL) and (act^.num < v) do begin
      ant := act;
      act := act^.sig ;
  end;
  if (ant = act)  then pri := nue;
    else  ant^.sig  := nue;
  nue^.sig := act ;
end;
procedure imprimirNodo(ListaF:lista);
begin
  while (ListaF <> NIL) do begin
        writeln (ListaF^.num) ;
        ListaF:= ListaF^.sig
    end;
end;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do 
    begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    imprimirNodo(pri);
end.