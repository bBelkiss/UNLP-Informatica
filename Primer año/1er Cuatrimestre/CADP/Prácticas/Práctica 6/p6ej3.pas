{ 3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que
fueron ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que
fueron ingresados, manteniendo un puntero al último ingresado.

procedure armarNodo(var l:lista; v:integer)
var
 aux: lista;
begin
  new(aux);
  aux^.dato:=v;
  aux^.sig:=l;
  l:=aux;
end; }

// inciso a
procedure agregarAtras(var l:lista; n:integer);
var
    aux, act: lista
begin
  new(aux);
  aux^.dato:=n;
  aux^.sig:=nil;
  if (l = nil) then begin
    l:=aux;
    else begin
      act:=l;
      while(act^.sig <> nil) do
        act:=act^.sig;
      act^.sig:=aux;
    end;
  end;
end.

// inciso b

procedure agregarAtras(var l, ult:lista; n:integer);
var
    aux: lista
begin
  new(aux);
  aux^.dato:=n;
  aux^.sig:=nil;
  if (l = nil) then
    l:=aux;
    else begin
      ult^.sig:=aux;
      ult:=aux;
    end;
end.
