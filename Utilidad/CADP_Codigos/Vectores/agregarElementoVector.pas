procedure agregarElementoVector(var a: numeros; var dimL: integer; var pude: boolean; num: integer);
begin
  pude := false; // Inicializa el flag de pude como falso
  if ((dimL + 1) <= dimF) then // Verifica si hay espacio en el vector
  begin
    pude := true; // Marca la operación como exitosa
    dimL := dimL + 1; // Incrementa la dimensión lógica
    a[dimL] := num; // Agrega el número en la última posición
  end;
end;

{
  Parámetros:
    var a: numeros - Vector donde se agregará el elemento
    var dimL: integer - Dimensión lógica actual del vector
    var pude: boolean - Indica si se pudo agregar el elemento
    num: integer - Número a agregar al vector

  Precondición:
    Se asume que existe una constante dimF que define la dimensión física del vector

  Postcondición:
    - Si había espacio, el elemento se agrega al final y pude = true
    - Si no había espacio, el vector no se modifica y pude = false
}