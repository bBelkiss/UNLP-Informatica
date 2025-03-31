{ Para algunos ejercicios de la parte práctica, se utilizará la función de Pascal “sizeof”, que recibe como
parámetro una variable de cualquier tipo y retorna la cantidad de bytes que dicha variable ocupa en la
memoria principal. Para realizar estos ejercicios, considerar la siguiente tabla, que indica la cantidad de bytes
que ocupa la representación interna de distintos tipos de datos en un compilador de Pascal típico. Se
recomienda graficar cada una de las situaciones planteadas a partir de una prueba de escritorio.

TIPO CANTIDAD DE BYTES
Entero | 2 bytes
Real | 4 bytes
Char | 1 byte
String | Tantos bytes como indique la longitud del String + 1
Record | La suma de las longitudes de los campos del registro
Puntero | 4 bytes
Boolean | 1 byte

1) Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio. }

program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    writeln(sizeof(pc), ' bytes'); // 4 bytes en stack
    new(pc);
    writeln(sizeof(pc), ' bytes');  // 4 bytes en stack y 51 en heap, total 55
    pc^:= 'un nuevo nombre';
    writeln(sizeof(pc), ' bytes');  // 4 bytes en stack y 51 en heap, total 55
    writeln(sizeof(pc^), ' bytes');  // 2 bytes
    pc^:= 'otro nuevo nombre distinto al anterior';
    writeln(sizeof(pc^), ' bytes');
end.