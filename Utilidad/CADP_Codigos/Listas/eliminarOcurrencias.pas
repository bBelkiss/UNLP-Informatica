procedure eliminarOcurrencias(var l: lista; e: elemento);
var
    ant, act: lista;  // Punteros auxiliares para recorrer la lista
begin
  ant := nil;        // Inicializa puntero anterior
  act := l;          // Comienza desde el primer nodo
  while (act <> nil) do // Recorre toda la lista
  begin
    if (e <> act^.dato) then 
    begin
      // Avanza al siguiente nodo si no es el valor buscado
      ant := act;
      act := act^.sig;
    end
    else 
    begin
      // Elimina el nodo actual cuando encuentra coincidencia
      if (act = l) then   // Caso 1: Eliminar primer nodo
        l := l^.sig
      else
        ant^.sig := act^.sig; // Caso 2: Eliminar nodo intermedio o final
      dispose(act); // Libera memoria y reajusta punteros
      act := ant;  // Importante: vuelve al nodo anterior para continuar el recorrido
    end;
  end;
end;


{
  Parámetros:
    var l: lista - Puntero al inicio de la lista por referencia
                  • Se modifica si se elimina el primer nodo
    e: elemento - Valor a buscar y eliminar en la lista por valor

  Pa q sirve:
    Elimina TODAS las ocurrencias del valor 'e' en la lista enlazada 'l',
    actualizando los punteros correspondientes y liberando la memoria.
}