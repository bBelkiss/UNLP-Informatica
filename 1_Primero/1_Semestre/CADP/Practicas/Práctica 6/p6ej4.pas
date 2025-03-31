{4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la
lista que son múltiplos de A.}

function maximo(L: lista): integer;  // inciso a
var
    max: integer;
begin
    if L = nil then
    begin
        writeln('La lista está vacía');
        max := 0;
    end
    else
    begin
        max := L^.num;
        while L <> nil do
        begin
            if L^.num > max then
                max := L^.num;
            L := L^.sig;
        end;
    end;
    maximo := max;
end;
function minimo(L: lista): integer;  // inciso b
var
    min: integer;
begin
    if L = nil then
    begin
        writeln('La lista está vacía');
        min := 0;
    end
    else
    begin
        min := L^.num;
        while L <> nil do
        begin
            if L^.num < min then
                min := L^.num;
            L := L^.sig;
        end;
    end;
    minimo := min;
end;
function multiplos(L: lista; A: integer): integer;  // inciso c
var
    count: integer;
begin
    count := 0;
    while L <> nil do
    begin
        if (L^.num mod A) = 0 then
            count := count + 1;
        L := L^.sig;
    end;
    multiplos := count;
end;
