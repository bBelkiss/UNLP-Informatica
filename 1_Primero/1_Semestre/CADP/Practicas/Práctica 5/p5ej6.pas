{ 6. Realizar un programa que ocupe 50 KB de memoria en total. Para ello:
a. El programa debe utilizar sólo memoria estática.
b. El programa debe utilizar el 50% de memoria estática y el 50% de memoria dinámica.
c. El programa debe minimizar tanto como sea posible el uso de la memoria estática (a lo sumo, 4
bytes). }

// inciso a
program Ej6;
const
  TAMANIO_ARREGLO = 12800; // 50 KB en bytes
  TAMANIO_ENTERO = 2;
var
  arreglo: array[1..TAMANIO_ARREGLO div TAMANIO_ENTERO] of integer; // Utilizando enteros para ocupar el espacio
begin
  // No es necesario realizar ninguna operación, simplemente se reserva la memoria estática
end.

// inciso b
program Ej6;
const
  TAMANIO_ARREGLO = 6400; // 25 KB en bytes
  TAMANIO_ENTERO = 2;
var
  arreglo: array[1..TAMANIO_ARREGLO div TAMANIO_ENTERO] of integer; // Memoria estática
  arregloDinamico: ^array of integer; // Memoria dinámica
  i: integer;
begin
  // Memoria estática
  for i := 1 to TAMANIO_ARREGLO div TAMANIO_ENTERO do
    arreglo[i] := i;
  // Memoria dinámica
  New(arregloDinamico);
  SetLength(arregloDinamico^, TAMANIO_ARREGLO div TAMANIO_ENTERO);
  // Liberar memoria dinámica
  Dispose(arregloDinamico);
end.

//inciso c
program Ej6;
const
  TAMANIO_DATOS = 12800; // 50 KB en bytes
  TAMANIO_ENTERO = 2;
type
  MemoriaDinamica = record
    puntero: ^array[1..(TAMANIO_DATOS div TAMANIO_ENTERO) - 2] of integer; // Utilizando enteros para ocupar el espacio
    otrosDatos: array[1..2] of integer; // Otros datos que no superan los 4 bytes
  end;
var
  datos: MemoriaDinamica;
  i: integer;
begin
  // Memoria dinámica
  new(datos.puntero);
  SetLength(datos.puntero^, (TAMANIO_DATOS div TAMANIO_ENTERO) - 2);
  // Inicializar datos dinámicos
  for i := 1 to High(datos.puntero^) do
    datos.puntero^[i] := i;
  // Liberar memoria dinámica
  dispose(datos.puntero);
end.