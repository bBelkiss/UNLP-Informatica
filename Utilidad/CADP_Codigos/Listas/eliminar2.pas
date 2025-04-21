procedure eliminar2(var l: lista; v: integer; var eliminado: boolean);
var
    ant, act: lista;  // Punteros auxiliares: anterior y actual
begin
  eliminado := false; // Inicializa flag de eliminación
  act := l;           // Comienza desde el primer nodo
  while (act <> nil) and (act^.datos.nom <> v) do // Busca el nodo con el valor a eliminar
  begin
    ant := act;       // Guarda referencia al nodo anterior
    act := act^.sig;  // Avanza al siguiente nodo
  end;
  if (act <> nil) then // Si encontró el nodo a eliminar
  begin
    eliminado := true; // Marca como eliminado
    // Reorganiza los punteros
    if (act = l) then   // Caso especial: eliminar primer nodo
      l := act^.sig
    else                // Caso normal: eliminar nodo intermedio o final
      ant^.sig := act^.sig;
    dispose(act);      // Libera la memoria del nodo eliminado
  end;
end;

{
  Parámetros:
    var l: lista - Puntero al inicio de la lista (se modifica si se elimina el primer nodo)
    v: integer - Valor a buscar y eliminar
    var eliminado: boolean - Flag que indica si se realizó la eliminación
  
  Recordar:
    - La lista debe tener al menos un nodo (no maneja lista vacía)
    - Se asume que el campo a comparar es 'datos.nom' obviamente depende la consigna :v
    - Versión mejorada con protección para nodo no encontrado
}