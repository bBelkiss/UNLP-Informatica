function verificarListaOrdenada(l: lista): boolean;
var
    ordenada: boolean;  // Flag que indica el estado de orden
    act, ant: integer;  // Valores actual y anterior en el recorrido
begin
  ordenada := true;    // Suponemos inicialmente que está ordenada
  ant := -MAXINT;      // Valor mínimo posible como inicialización
  
  // Recorre la lista mientras no termine y siga ordenada
  while (l <> nil) and (ordenada) do
  begin
    act := l^.num;     // Obtiene el valor del nodo actual
    
    // Compara con el valor anterior
    if (ant > act) then
      ordenada := false;  // Rompe el orden ascendente
    
    ant := act;        // Guarda el valor actual para la próxima iteración
    l := l^.sig;       // Avanza al siguiente nodo
  end;
  verificarListaOrdenada := ordenada;  // Devuelve el resultado
end;

{
  Parámetros:
    l: lista - Puntero al inicio de la lista [por valor]
               • No se modifica la lista original

  Pa q sirve:
    Verifica si los elementos de la lista están ordenados
    en forma ascendente (cada elemento <= siguiente)
}