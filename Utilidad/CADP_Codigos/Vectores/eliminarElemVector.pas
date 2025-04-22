procedure eliminarElementoVector(var a: numeros; var dL: integer; var pude: boolean; pos: integer);
var
    i: integer; // Variable contador para el for (deberias saberlo)
begin
  pude := false; // Inicializa el flag de éxito como falso
  if ((pos >= 1) and (pos <= dL)) then // Verifica que la posición esté dentro del rango válido
  begin
    // Desplaza todos los elementos después de 'pos' una posición hacia atrás
    for i := pos to (dL - 1) do
      a[i] := a[i + 1];
    pude := true; // Marca la operación como exitosa
    dL := dL - 1; // Reduce la dimensión lógica del vector
  end;
end;

{
  Parámetros:
    var a: numeros - Vector/array donde se eliminará el elemento (pasado por referencia)
    var dL: integer - Dimensión lógica actual del vector (pasada por referencia)
    var pude: boolean - Indica si se pudo eliminar el elemento (pasado por referencia)
    pos: integer - Posición del elemento a eliminar (pasado por valor)

  Para qué sirve:
    Elimina un elemento en una posición específica del vector, desplazando
    todos los elementos siguientes una posición hacia atrás
    Actualiza el flag "pude" para decir si la operación fue exitosa
}