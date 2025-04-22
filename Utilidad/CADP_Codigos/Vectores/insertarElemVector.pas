procedure insertarElementoVector(var a: numeros; var dL: integer; var pude: boolean; num: integer; pos: integer);
var
    i: integer; // Variable para recorrer el vector
begin
  pude := false; // Por defecto, asumimos que no se pudo insertar
  // Verificamos condiciones para insertar:
  // 1. Que haya espacio (dL+1 no supere dimF)
  // 2. Que la posición sea válida (entre 1 y dL+1)
  if ((dL + 1) <= dimF) and (pos >= 1) and (pos <= dL + 1) then
  begin
    // Desplazamos elementos desde el final hasta 'pos' hacia adelante
    for i := dL downto pos do
      a[i + 1] := a[i]; // Cada elemento se mueve una posición adelante
    a[pos] := num; // Insertamos el nuevo elemento
    // Actualizamos estado
    dL := dL + 1; // Aumentamos la cantidad de elementos
    pude := true;  // Marcamos operación como exitosa
  end;
end;

{
  Parámetros:
    var a: numeros - Vector donde se insertará (modificado por referencia)
    var dL: integer - Cantidad actual de elementos (modificado por referencia)
    var pude: boolean - Indica si se pudo insertar (modificado por referencia)
    num: integer - Valor a insertar (pasado por valor)
    pos: integer - Posición de inserción (pasado por valor)

  Para que sirve:
    Inserta un elemento en una posición específica del vector, desplazando los elementos
    necesarios y actualizando la dimensión lógica

  Precondiciones:
    - dimF debe estar definida como constante anteriormente (capacidad máxima del vector)
    - Vector debe estar inicializado
    - dL debe reflejar correctamente la cantidad actual de elementos

  Postcondiciones:
    - Si hay espacio y posición válida:
      * El elemento se inserta en 'pos'
      * Elementos desde 'pos' se desplazan una posición
      * dL aumenta en 1
      * pude = true
    - Si no se cumple:
      * Vector no se modifica
      * pude = false
}