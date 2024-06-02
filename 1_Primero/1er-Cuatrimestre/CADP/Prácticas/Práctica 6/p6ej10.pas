{ 10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un
número (que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado
por su número, en cuyo caso sale de la lista de espera. Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de
clientes en espera, asigna un número al cliente y retorna la lista de espera actualizada.
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera,
y retorna el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe
eliminarse de la lista de espera.
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero
llegarán todos los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se
los atenderá de a uno por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no
debe procesarse. }

program Ej10;
type
    cliente=record
        dni:integer;
        numero:integer;
    end;
    listaEspera = ^nodo;
    nodo = record
        datos : cliente;
        sig : listaEspera;
    end;
procedure agregarAtras (CF: cliente;var LF, ult: listaEspera ); 
var 
    nue : listaEspera;
begin 
    new (nue);
    nue^.datos:= CF;
    nue^.sig := nil;
    if LF <> nil then 
        begin
            ult^.sig := nue;  
        end
    else
        begin
            LF := nue;  
        end; 
    ult := nue;
end;
procedure RecibirCliente (dni:integer; var L,ult:listaEspera);
var
    c:cliente;
begin
    c.dni:=dni;
    if (L=nil) then
    begin
        c.numero:=1;
    end
    else
        begin
            c.numero:=ult^.datos.numero+1;  
        end;
    agregarAtras(c,L,ult);
end;
procedure CargarLista(var L,ult:listaEspera);
var 
    dni:integer;
begin
    read(dni);
    while (dni <> 0) do 
        begin
            RecibirCliente(dni,L,ult);
            read(dni);
        end;
end;
procedure armarNodo(var L: listaEspera; v: cliente);
var
    aux : listaEspera;
begin
    new(aux);
    aux^.datos := v;
    aux^.sig := L;
    L := aux;
end;
procedure imprimirL(ListaF:listaEspera);
begin
  while (ListaF <> nil) do begin
        writeln ('El dni: ',ListaF^.datos.dni) ;
        writeln ('El numero es : ',ListaF^.datos.numero) ;
        ListaF:= ListaF^.sig;
    end;
end;
procedure AtenderCliente(var L:listaEspera;var C:cliente);
begin
    C.dni:=L^.datos.dni;
    c.numero:=L^.datos.numero;
    BorrarElemento(L);
end;
var
    L : listaEspera;
    ult:listaEspera;
    C:cliente;
begin
    L:=nil;
    ult:=nil;
    CargarLista(L,ult);
    writeln('Imprimir Lista');
    imprimirL(L);
    while (L <> nil) do
    begin
        AtenderCliente(L,C);  
        imprimirL(L);
        L:=L^.sig;
    end;
end.
