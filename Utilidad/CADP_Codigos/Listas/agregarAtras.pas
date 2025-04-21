procedure agregarAtras(var pri,ult: lista; e: elemento);
var
  nue: lista; // nue: Puntero auxiliar que se usará para crear el nuevo nodo.
begin
  new(nue); // Reserva memoria dinámica para un nuevo nodo y asigna su dirección al puntero nue
  nue^.dato := e; // Almacena el elemento e en el campo dato del nuevo nodo
  nue^.sig := nil; // Establece que el nuevo nodo será el último (su puntero sig apunta a nil)
  if (pri = nil) then // Comprueba si la lista está vacía
    pri := nue // Si la lista está vacía, el nuevo nodo se convierte en el primero (pri apunta a nue)
  else
    ult^.sig := nue; // Si la lista no está vacía, el último nodo actual (ult) apunta al nuevo nodo
  ult := nue; // En cualquier caso, el nuevo nodo se convierte en el último de la lista (ult apunta a nue)
end;

{
  Parámetros:
    var pri,ult: lista: - Parámetros por referencia que representan el puntero al primer y último nodo de la lista.
    e: elemento: - Parámetro por valor que representa el dato a agregar.
}