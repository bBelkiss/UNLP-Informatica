// Ejercicio 1

program final1;
type
    str30 = string[30];
    fecha = record
        dia: 1..31;
        mes: 1..12;
        anio: integer;
    end;
    empleado = record
        DNI: integer;
        apellido: str30;
        nombre: str30;
        codDepto: 1..100;
        fechaAsistencia: fecha;
        presente: boolean;
    end;
    lista = ^nodo;
    nodo = record
        dato: empleado;
        sig: lista;
    end;
    vectorContador = array[1..100] of integer;
procedure inicializarVector(var v: vectorContador);
var i: integer;
begin
    for i := 1 to 100 do
        v[i] := 0;
end;
procedure procesarLista(l: lista; var v: vectorContador);
begin
    while l <> nil do begin
        if l^.dato.presente then
            v[l^.dato.codDepto] := v[l^.dato.codDepto] + 1;
        l := l^.sig;
    end;
end;
function departamentoConMasPresentes(v: vectorContador): integer;
var i, max, deptoMax: integer;
begin
    max := -1;
    deptoMax := 0;
    for i := 1 to 100 do begin
        if v[i] > max then begin
            max := v[i];
            deptoMax := i;
        end;
    end;
    departamentoConMasPresentes := deptoMax;
end;
var
    l: lista;
    v: vectorContador;
    deptoMax: integer;
begin
    // Asumo q la lista l ya está cargada y ordenada por código
    inicializarVector(v);
    procesarLista(l, v);
    deptoMax := departamentoConMasPresentes(v);
    writeln('El departamento con más empleados presentes es el: ', deptoMax);
end.

// Ejercicio 2

{
    El procedimiento correcto es el B

    - Inicializa ok como falso y solo lo cambia si encuentra el valor
    - Termina la búsqueda tan pronto como encuentra el elemento (not ok deja de ser verdadero)
    - Es eficiente ya que en el mejor caso (elemento al principio) hace solo una comparación,
    y en el peor caso (elemento no presente o al final) recorre todo el vector
}

// Ejercicio 3

{
    Imprime: Valor a: 6; Valor b: 15; Valor c: 28
}

// Ejercicio 4

{
    A: Falso
        En Pascal, la estructura case suele ser más eficiente que múltiples if porque el compilador
        puede optimizarla como una tabla de saltos.
        Además, el código A realiza dos comparaciones para cada condición, mientras que el case es más directo
    
    B: Verdadero
        Un arreglo ocupa espacio solo para los datos (250 * 2 bytes = 500 bytes para enteros)
        Una lista necesita espacio adicional para los punteros (250 * (2 + 4) = 1500 bytes, 
        asumiendo 2 bytes para el entero y 4 bytes para el puntero)

    C: Falso
        En Pascal, tanto los procedimientos como las funciones pueden declarar tipos de datos locales dentro de su bloque de declaraciones
    
    D: Verdadero
        En Pascal, una función puede retornar cualquier tipo de dato simple (integer, boolean, char, real), punteros, strings (aunque estos suelen manejarse mejor como parámetros var), 
        y otros tipos estructurados dependiendo de la implementación

    E: Falso
         No podemos determinar el tiempo exacto de ejecución sin conocer los datos de entrada. 
         El bucle while podría ejecutarse hasta 11 veces (de 5 a 15), pero el tiempo exacto depende de múltiples factores

    F: Falso
        vector: array de 11 posiciones (5..15) de punteros => 11 * 4 = 44 bytes
        e: record con string[15] (16 bytes), 2 integers (4 bytes) => 20 bytes
        i: integer => 2 bytes
        Total: 44 + 20 + 2 = 66 bytes solo para variables, sin contar el espacio para el código y otros overheads 
        Ya supera los 85 bytes si consideramos todo
}