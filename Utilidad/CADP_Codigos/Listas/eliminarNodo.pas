procedure eliminarNodo(var l: lista; v: integer; var eliminado: boolean);
var
    ant, act: lista;  // Punteros auxiliares: anterior y actual
begin
  eliminado := false; // Inicializa flag de eliminación a falso
  act := l;           // Comienza desde el primer nodo de la lista
  while (act <> nil) and (act^.dato <> v) do // Búsqueda del nodo a eliminar
  begin
    ant := act;       // Guarda referencia al nodo anterior
    act := act^.sig;  // Avanza al siguiente nodo
  end;
  if (act <> nil) then // Si se encontró el nodo a eliminar
  begin
    eliminado := true; // Marca operación como exitosa
    // Reorganización de punteros
    if (act = l) then   // Caso especial: eliminar primer nodo
      l := act^.sig
    else                // Caso normal: eliminar nodo intermedio o final
      ant^.sig := act^.sig;
    dispose(act);      // Libera la memoria del nodo eliminado
  end;
end;

{
  Parámetros:
    var l: lista - Puntero al inicio de la lista por referencia
                  • Se modifica si se elimina el primer nodo
    v: integer - Valor a buscar y eliminar en la lista por valor
    var eliminado: boolean - Flag que indica si se realizó la eliminación por referencia

  Pa que sirve:
    Elimina la primera ocurrencia del valor 'v' en la lista enlazada 'l',
    actualizando los punteros correspondientes y liberando la memoria.
}