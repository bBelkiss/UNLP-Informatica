{ 2. Dado el siguiente código que lee información de personas hasta que se ingresa la persona con dni 0 y
luego imprime dicha información en el orden inverso al que fue leída, identificar los 9 errores }

program ejercicio2;
type
    lista = ^nodo;
    persona = record
        dni: integer;
        nombre: string;
        apellido: string;
end;
    nodo = record
        dato: persona;
        sig: lista;
end;
procedure leerPersona(p: persona); // 1 error: El parámetro no está por referencia, por ende no devolvería nada. var p: persona
    begin
    read(p.dni);
    if (p.dni <> 0)then begin
        read(p.nombre);
        read(p.apellido);
    end;
end;
{Agrega un nodo a la lista}
procedure agregarAdelante(l:lista;p:persona); // 2 error: El parámetro l:lista debería ser por ref ya que se cambia. var l:lista
var
    aux: lista;
begin
    aux^.dato:= p; // 3 error: Falta inicializar la lista. new(l)
    aux^.sig:= l;
    l:= aux;
end;
{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
var
    p:nodo; // 4 error: No hay var de nodo, p: persona
begin
    leerPersona(p);
    while (p.dni <> 0) do // 5 error: Falta volver a leerPersona ya que sino sería un bucle infinito.
        agregarAdelante(l,p);
end;
procedure imprimirInformacion(var l:lista);
begin
    while (l <> nil) do begin
        writeln('DNI: ', l^.dato.dni, 'Nombre:', l^.nombre, 'Apellido:', l^.apellido); // 6 error: Falta agregar l^.dato en nombre y apellido. l^.dato.nombre, l^.dato.apellido
        l:= l^.sig; // 7 error: Elimina la lista
    end;
end;
{Programa principal}
var
    l:lista;
begin
    generarLista(l); // 8 error: Falta inicializar la lista. new(l)
    imprimirInformacion(l); // 9 error: Falta darle valor nil a la lista. l:=nil
end.
