{ 1. Dado el siguiente programa:
a. Indicar qué hace el programa.
b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la
lista. }

program JugamosConListas;
type  // a) Declaración de tipos
    lista = ^nodo;  // a) Genera un puntero al nodo
    nodo = record  // a) Genera el registro del nodo
        num : integer;
        sig : lista;
end;
procedure armarNodo(var L: lista; v: integer);  // a) Procedimiento 1
var
    aux : lista;
begin
    new(aux);  // a) Crea un nodo
    aux^.num := v; // a) Carga el dato
    aux^.sig := L; // a) El siguiente apunta al primero
    L := aux; // a) El primero ahora es el nuevo
end;
var // a) Declaración de variables
    pri : lista;
    valor : integer;
begin
    pri := nil;  // a) Se inicializa una lista vacía
    writeln(‘Ingrese un numero’);
    read(valor);
    while (valor <> 0) then begin
        armarNodo(pri, valor);
        writeln(‘Ingrese un numero’);
        read(valor);
    end;
    { imprimir lista }
end.

{ a) Crea una lista que toma numeros enteros hasta que se lea 0, que no se procesa.
  b) Queda 48, 13, 21, 10. El 0 no se procesa. 
  c) incisoC }

procedure incisoC(l:lista);
begin
  while (l <> nil) do begin
    writeln(l^.num);
    l:=l^.sig;
  end;
end;