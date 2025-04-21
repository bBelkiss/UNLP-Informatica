procedure insertarOrdenado(var l: lista; e: elemento);
var
    nue: lista;       // Nuevo nodo a insertar
    act, ant: lista;  // Punteros auxiliares para recorrido
begin
  new(nue); // Creación del nuevo nodo
  nue^.dato := e; // Asigna el dato al nuevo nodo
  // Inicialización de punteros de recorrido
  act := l; // Puntero al nodo actual
  ant := l; // Puntero al nodo anterior
  while (act <> nil) and (e.condicionDeCorte > act^.dato.x) do // Busca la posición de inserción adecuada
  begin
    ant := act;
    act := act^.sig;
  end;
  // Inserta el nuevo nodo en la posición encontrada
  if (act = ant) then 
    l := nue // Caso 1: Insertar al principio
  else // Caso 2: Insertar en medio o al final
    ant^.sig := nue;
  nue^.sig := act; // Completa el enlace del nuevo nodo
end;

{ 
  Parámetros:
      var l: lista - Puntero al inicio de la lista por referencia
                    • Se modifica si se inserta al principio
      e: elemento - Dato a insertar por valor

  Para que sirve:
    Inserta un elemento en una lista manteniendo el orden especificado
    por el campo de comparación (condicionDeCorte vs x)

  Recordar:
  1. 'condicionDeCorte' es un campo del elemento a insertar
  2. 'x' es un campo comparable en los datos de la lista
  3. El operador '>' es de ejemplo - puede ser cualquier operador de comparación
  4. La lista debe estar previamente ordenada con el mismo criterio
  5. Maneja correctamente inserciones:
     - En lista vacía
     - Al principio
     - En medio
     - Al final
}