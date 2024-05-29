{ 8. Analice el siguiente programa:
Responda: ¿cuánta memoria en total ocupa el programa al ejecutarse? Considere tanto variables estáticas
como dinámicas, parámetros y variables locales de los módulos.
a. Hasta la sentencia de la línea 18.
b. Hasta la sentencia de la línea 20.
c. Hasta la sentencia de la línea 23.
d. Hasta la sentencia de la línea 11.
e. Hasta la sentencia de la línea 25 }

program memoria;
type
    datos = array [1..20] of integer;
    punt = ^datos;
procedure procesarDatos(v : datos; var v2 : datos);
var
    i, j : integer;
begin
    for i := 1 to 20 do
    v2[21 - i] := v[i];
end;
var
    vect : datos;
    pvect : punt;
    i : integer;
begin
    for i:= 1 to 20 do
        vect[i] := i;
        new(pvect);
    for i:= 20 downto 1 do
        pvect^[i] := 0;
        procesarDatos(pvect^, vect);
        writeln(‘fin’);
end.

{ a. 44 bytes
b. 40 bytes
c. 40 bytes
d. 44 bytes
e. Depende del sistema y la implementación de writeln. Habitualmente, el tamaño de esta salida es despreciable comparado con el resto del programa, ya que es solo un mensaje de texto. }