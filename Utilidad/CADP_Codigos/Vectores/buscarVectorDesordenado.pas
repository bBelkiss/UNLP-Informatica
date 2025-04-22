function buscarVectorDesordenado(a: numeros; dL: integer; valor: integer): boolean;
var 
    pos: integer; // Contador de posición actual en el vector
    existe: boolean; // Flag que indica si se encontró el valor
begin
  existe := false; // Inicializa como no encontrado
  pos := 1; // Comienza desde la primera posición del vector
  while ((pos <= dL) and (not existe)) do // Mientras no haya llegado al final Y no haya encontrado el valor
  begin
    if (a[pos] = valor) then // Compara el elemento actual con el valor buscado
      existe := true // Si coincide, marca como encontrado
    else
      pos := pos + 1; // Si no coincide, avanza a la siguiente posición
  end;
  buscarVectorDesordenado := existe; // Retorna el resultado de la búsqueda
end;

{
  Parámetros:
    a: numeros - Vector/array donde se buscará el valor
    dL: integer - Dimensión lógica actual del vector (cantidad de elementos)
    valor: integer - Valor a buscar en el vector

  Para qué sirve:
    Busca un valor específico en un vector no ordenado, recorriéndolo
    secuencialmente hasta encontrarlo o llegar al final
}