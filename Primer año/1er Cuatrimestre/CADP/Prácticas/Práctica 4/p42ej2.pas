{ 2. Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias. }

program Ej2;
const
  MAX_ALUMNOS = 500;
type
  cadena30 = string[30];
  vectorNombres = array[1..MAX_ALUMNOS] of cadena30;
var
  nombres: vectorNombres;
  dimL: integer;
procedure leerNombres(var v: vectorNombres; var dimL: integer);
var
  nombre: cadena30;
begin
  dimL := 0;
  writeln('Ingrese nombres de alumnos (finalice con ''ZZZ''):');
  readln(nombre);
  while (nombre <> 'ZZZ') and (dimL < MAX_ALUMNOS) do
  begin
    dimL := dimL + 1;
    v[dimL] := nombre;
    readln(nombre);
  end;
end;
procedure eliminarNombre(var v: vectorNombres; var dimL: integer; nombre: cadena30);
var
  i, j: integer;
  encontrado: boolean;
begin
  encontrado := false;
  i := 1;
  while (i <= dimL) and (encontrado = false) do
  begin
    if v[i] = nombre then
    begin
      encontrado := true;
      for j := i to dimL - 1 do
        v[j] := v[j + 1];
      dimL := dimL - 1;
    end;
    i := i + 1;
  end;
  if (encontrado = false) then
    writeln('El nombre ', nombre, ' no se encontró en el vector.');
end;
procedure insertarNombre(var v: vectorNombres; var dimL: integer; nombre: cadena30; posicion: integer);
var
  i: integer;
begin
  if (dimL < MAX_ALUMNOS) and (posicion <= dimL + 1) and (posicion >= 1) then
  begin
    for i := dimL downto posicion do
      v[i + 1] := v[i];
    v[posicion] := nombre;
    dimL := dimL + 1;
  end
  else
    writeln('No se puede insertar el nombre en la posición ', posicion, '.');
end;
procedure agregarNombre(var v: vectorNombres; var dimL: integer; nombre: cadena30);
begin
  if dimL < MAX_ALUMNOS then
  begin
    dimL := dimL + 1;
    v[dimL] := nombre;
  end
  else
    writeln('No se puede agregar el nombre, el vector está lleno.');
end;
procedure imprimirVector(v: vectorNombres; dimL: integer);
var
  i: integer;
begin
  writeln('Nombres en el vector:');
  for i := 1 to dimL do
    writeln(v[i]);
end;
var
  nombre: cadena30;
  opcion: integer;
begin
  leerNombres(nombres, dimL);
  opcion := 0;
  while opcion <> 5 do
  begin
    writeln('Seleccione una opción:');
    writeln('1. Eliminar un nombre');
    writeln('2. Insertar un nombre en la posición 4');
    writeln('3. Agregar un nombre al final');
    writeln('4. Imprimir vector de nombres');
    writeln('5. Salir');
    readln(opcion);
    if opcion = 1 then
    begin
      writeln('Ingrese el nombre a eliminar:');
      readln(nombre);
      eliminarNombre(nombres, dimL, nombre);
    end
    else if opcion = 2 then
    begin
      writeln('Ingrese el nombre a insertar en la posición 4:');
      readln(nombre);
      insertarNombre(nombres, dimL, nombre, 4);
    end
    else if opcion = 3 then
    begin
      writeln('Ingrese el nombre a agregar al final:');
      readln(nombre);
      agregarNombre(nombres, dimL, nombre);
    end
    else if opcion = 4 then
      imprimirVector(nombres, dimL);
  end;
end.
