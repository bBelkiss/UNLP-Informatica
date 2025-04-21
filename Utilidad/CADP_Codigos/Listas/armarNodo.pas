procedure armarNodo(var l: lista; e: elemento);
var
  nue: lista; // Puntero temporal para el nuevo nodo
begin
  new(nue); // Crea un nuevo nodo en memoria
  nue^.dato := e; // Asigna el valor 'e' al campo 'dato' del nuevo nodo
  nue^.sig := l; // El nuevo nodo apunta a la lista actual (se inserta al frente)
  l := nue; // Actualiza el puntero de la lista para que apunte al nuevo nodo
end;

{
  Parámetros:
    var l: lista - Puntero al inicio de la lista (se modifica)
    e: elemento - Dato a almacenar en el nuevo nodo
}
