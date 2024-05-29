{ 2) Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio. } 

program punteros;
type
    cadena = string[9];
    producto = record // 16 bytes
        codigo: integer; // 2 bytes
        descripcion: cadena; // 10 bytes
        precio: real; // 4 bytes
    end;
    puntero_producto = ^producto;
var
    p: puntero_producto;
    prod: producto;
begin
    writeln(sizeof(p), ' bytes'); // 4 bytes en stack
    writeln(sizeof(prod), ' bytes'); // 16 bytes en stack
    new(p);
    writeln(sizeof(p), ' bytes'); // 4 bytes en stack y 16 en heap, total 20 bytes
    p^.codigo := 1;
    p^.descripcion := 'nuevo producto';
    writeln(sizeof(p^), ' bytes'); // 16 bytes en heap
    p^.precio := 200;
    writeln(sizeof(p^), ' bytes'); // 16 bytes en heap
    prod.codigo := 2;
    prod.descripcion := 'otro nuevo producto';
    writeln(sizeof(prod), ' bytes'); // 16 bytes en stack
end.
