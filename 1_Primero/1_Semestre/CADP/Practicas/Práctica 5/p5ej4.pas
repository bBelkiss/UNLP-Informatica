{4) Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
escritorio. }

{a)} program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    pc^:= 'un nuevo texto';
    new(pc);
    writeln(pc^);// NO IMPRIME NADA porque el NEW ESTÁ DESPUÉS de la asignacion del pc^, por lo tanto no se le reservó espacio en memoria heap
end.

{b)} program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'un nuevo nombre';
    writeln(sizeof(pc^), ' bytes'); //51 bytes -en heap-
    writeln(pc^); // imprime "un nuevo nombre"
    dispose(pc); //libero espacio en la heap
    pc^:= 'otro nuevo nombre'; //no se imprime nada ya que el espacio se libero
end.

{c)} program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
    pun^:= 'Otro texto';
end;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'Un texto';
    writeln(pc^); //imprime "un texto"
    cambiarTexto(pc);
    writeln(pc^); //imprime "Otro texto", porque aunque fue un parametro por valor se comparte la direccion de memoria
end.

{d)} program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
    new(pun);
    pun^:= 'Otro texto';
end;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'Un texto';
    writeln(pc^); //imprime "Un texto"
    cambiarTexto(pc);
    writeln(pc^); //imprime "Otro texto" porque el otro modulo cuando termino perdi el acceso a donde estaba Un texto
end.