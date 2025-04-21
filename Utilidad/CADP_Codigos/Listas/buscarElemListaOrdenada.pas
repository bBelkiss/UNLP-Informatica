function buscarElementoEnListaOrdenada(l: lista; valor: integer): boolean;
var
    aux: lista;          // Puntero auxiliar para recorrer la lista
    existe: boolean;     // Flag para indicar si se encontró el valor
begin
  existe := false;       // Inicializa la flag como falsa
  aux := l;              // Apunta aux al inicio de la lista
  while ((aux <> nil) and (aux^.dato < valor)) do // Avanza mientras no llegue al final y el dato actual sea menor al valor buscado
  begin
    aux := aux^.sig; // Avanza al siguiente nodo
  end;
  if (aux <> nil) and (aux^.dato = valor) then // Verifica si encontró un nodo con el valor exacto
    existe := true;      // Marca como encontrado si coincide
  buscarElementoEnListaOrdenada := existe;  // Retorna el resultado de la búsqueda
end;

{
  Parámetros:
    l: lista - Puntero al inicio de la lista (no se modifica)
    valor: integer - Valor a buscar en los nodos
  
  Retorno:
    boolean - True si encontró el valor, False si no
  
  Requisito:
    La lista debe estar ordenada ascendentemente
}