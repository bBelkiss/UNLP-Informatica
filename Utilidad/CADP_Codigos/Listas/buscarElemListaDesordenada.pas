function buscarElementoEnListaDesordenada(l: lista; valor: integer):boolean;
var
    aux: lista;          // Puntero auxiliar para recorrer la lista
    existe: boolean;     // Flag para indicar si se encontró el valor
begin
  existe := false;       // Inicializa la bandera como falsa
  aux := l;              // Apunta aux al inicio de la lista
  while ((aux <> nil) and (existe = false)) do // Recorre la lista mientras no llegue al final y no haya encontrado el valor
  begin
    if (aux^.dato = valor) then  // Compara el dato del nodo actual con el valor buscado
      existe := true;            // Si coincide, marca como encontrado
    else
      aux := aux^.sig;           // Si no, avanza al siguiente nodo
  end;
  buscarElementoEnListaDesordenada := existe;  // Retorna el resultado de la búsqueda
end;

{
  Parámetros:
    l: lista - Puntero al inicio de la lista (no se modifica)
    valor: integer - Valor a buscar en los nodos
  
  Retorno:
    boolean - True si encontró el valor, False si no
}