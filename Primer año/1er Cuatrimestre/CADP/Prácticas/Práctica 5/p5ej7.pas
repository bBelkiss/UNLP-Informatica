{7. Se desea almacenar en memoria una secuencia de 2500 nombres de ciudades, cada nombre podrá
tener una longitud máxima de 50 caracteres.
a. Definir una estructura de datos estática que permita guardar la información leída. Calcular el
tamaño de memoria que requiere la estructura.
b. Dado que un compilador de Pascal típico no permite manejar estructuras de datos estáticas que
superen los 64 Kb, pensar en utilizar un vector de punteros a palabras, como se indica en la
siguiente estructura:
Type
    Nombre = String[50];
    Puntero = ^Nombre;
    ArrPunteros = array[1..2500] of Puntero;
Var
    Punteros: ArrPunteros;
i) Indicar cuál es el tamaño de la variable Punteros al comenzar el programa.
ii) Escribir un módulo que permita reservar memoria para los 2500 nombres. ¿Cuál es la
cantidad de memoria reservada después de ejecutar el módulo? ¿La misma corresponde a
memoria estática o dinámica?
iii) Escribir un módulo para leer los nombres y almacenarlos en la estructura de la variable
Punteros. }

// inciso a
program Ej7;
const
  MAX_CIUDADES = 2500;
  LONGITUD_MAXIMA = 50;
  TAMANIO_CHAR = 1; // Tamaño en bytes de un Char en Pascal (depende del compilador)
type
  ciudad = array[1..MAX_CIUDADES, 1..LONGITUD_MAXIMA] of char;
var
  ciudades: ciudad;
begin
  // Tamaño de memoria requerido para la estructura
  writeln('Tamaño de memoria requerido para la estructura (en bytes): ', MAX_CIUDADES * LONGITUD_MAXIMA * TAMANIO_CHAR);
end.

// inciso b
program Ej7;
type
  Nombre = String[50];
  Puntero = ^Nombre;
  ArrPunteros = array[1..2500] of Puntero;
var
  Punteros: ArrPunteros;
begin
  // i) Tamaño de la variable Punteros
  writeln('Tamaño de la variable Punteros (en bytes): ', SizeOf(Punteros));
  // ii) Módulo para reservar memoria
  for i := 1 to 2500 do
    New(Punteros[i]);
  // Tamaño de memoria reservada después de ejecutar el módulo
  writeln('Tamaño de memoria reservada (después de ejecutar el módulo) (en bytes): ', SizeOf(Nombre) * 2500);
  // iii) Módulo para leer nombres y almacenarlos
  for i := 1 to 2500 do
  begin
    writeln('Ingrese el nombre de la ciudad ', i, ':');
    readln(Punteros[i]^);
  end;
end.
