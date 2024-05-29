{ 4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
leídos de teclado. }

program Ej4;
const
  MAX_ALUMNOS = 1000;
type
  cadena30 = string[30];
  alumno = record
    nro: integer;
    apellido: cadena30;
    nombre: cadena30;
    asistencias: integer;
  end;
  vectorAlumnos = array[1..MAX_ALUMNOS] of alumno;
var
  alumnos: vectorAlumnos;
  dimL: integer;
procedure leerAlumnos(var v: vectorAlumnos; var dimL: integer);
var
  a: alumno;
begin
  dimL := 0;
  writeln('Ingrese el nro de alumno, apellido, nombre y cantidad de asistencias (0 para finalizar):');
  readln(a.nro, a.apellido, a.nombre, a.asistencias);
  while (a.nro <> 0) and (dimL < MAX_ALUMNOS) do
  begin
    dimL := dimL + 1;
    v[dimL] := a;
    readln(a.nro, a.apellido, a.nombre, a.asistencias);
  end;
end;
function buscarPosicionAlumno(v: vectorAlumnos; dimL, nroAlumno: integer): integer;
var
  i: integer;
begin
  i := 1;
  while (i <= dimL) and (v[i].nro <> nroAlumno) do
    i := i + 1;
  buscarPosicionAlumno := i;
end;
procedure insertarAlumno(var v: vectorAlumnos; var dimL: integer; a: alumno);
var
  i, j: integer;
begin
  if dimL < MAX_ALUMNOS then
  begin
    i := 1;
    while (i <= dimL) and (v[i].nro < a.nro) do
      i := i + 1;
    for j := dimL downto i do
      v[j + 1] := v[j];
    v[i] := a;
    dimL := dimL + 1;
  end
  else
    writeln('No se puede insertar el alumno, el vector está lleno.');
end;
procedure eliminarAlumnoPorPosicion(var v: vectorAlumnos; var dimL: integer; pos: integer);
var
  i: integer;
begin
  if (pos >= 1) and (pos <= dimL) then
  begin
    for i := pos to dimL - 1 do
      v[i] := v[i + 1];
    dimL := dimL - 1;
  end
  else
    writeln('Posición inválida.');
end;
procedure eliminarAlumnoPorNumero(var v: vectorAlumnos; var dimL: integer; nroAlumno: integer);
var
  pos: integer;
begin
  pos := buscarPosicionAlumno(v, dimL, nroAlumno);
  if pos <= dimL then
    eliminarAlumnoPorPosicion(v, dimL, pos)
  else
    writeln('Número de alumno no encontrado.');
end;
procedure eliminarAlumnosSinAsistencias(var v: vectorAlumnos; var dimL: integer);
var
  i: integer;
begin
  i := 1;
  while i <= dimL do
  begin
    if v[i].asistencias = 0 then
      eliminarAlumnoPorPosicion(v, dimL, i)
    else
      i := i + 1;
  end;
end;
procedure imprimirAlumnos(v: vectorAlumnos; dimL: integer);
var
  i: integer;
begin
  writeln('Alumnos registrados:');
  for i := 1 to dimL do
    writeln('Nro: ', v[i].nro, ', Apellido: ', v[i].apellido, ', Nombre: ', v[i].nombre, ', Asistencias: ', v[i].asistencias);
end;
var
  opcion: integer;
  a: alumno;
  nro: integer;
begin
  leerAlumnos(alumnos, dimL);
  opcion := 0;
  while opcion <> 6 do
  begin
    writeln('Seleccione una opción:');
    writeln('1. Buscar alumno por número');
    writeln('2. Insertar un nuevo alumno');
    writeln('3. Eliminar alumno por posición');
    writeln('4. Eliminar alumno por número');
    writeln('5. Eliminar alumnos sin asistencias');
    writeln('6. Salir');
    readln(opcion);
    if (opcion = 1) then
    begin
      writeln('Ingrese el número de alumno a buscar:');
      readln(nro);
      writeln('Posición del alumno: ', buscarPosicionAlumno(alumnos, dimL, nro));
    end
    else if (opcion = 2) then
    begin
      writeln('Ingrese el nro de alumno, apellido, nombre y cantidad de asistencias:');
      readln(a.nro, a.apellido, a.nombre, a.asistencias);
      insertarAlumno(alumnos, dimL, a);
    end
    else if (opcion = 3) then
    begin
      writeln('Ingrese la posición del alumno a eliminar:');
      readln(nro);
      eliminarAlumnoPorPosicion(alumnos, dimL, nro);
    end
    else if (opcion = 4) then
    begin
      writeln('Ingrese el número de alumno a eliminar:');
      readln(nro);
      eliminarAlumnoPorNumero(alumnos, dimL, nro);
    end
    else if opcion = 5 then
      eliminarAlumnosSinAsistencias(alumnos, dimL);
    imprimirAlumnos(alumnos, dimL);
  end;
end.
