function todosIguales(num: integer): boolean;
var
  digito, ultimo: integer; // Se comparan todos contra el último dígito
begin
  ultimo := num MOD 10; // Toma el último dígito como referencia
  num := num DIV 10; // Elimina el último dígito
  todosIguales := true; // Se asume verdadero al inicio
  while (num <> 0) and (todosIguales) do // Mientras haya dígitos y no se rompa la condición
  begin
    digito := num MOD 10; // Extrae el nuevo último dígito
    if (digito <> ultimo) then // Compara con el primero
      todosIguales := false; // Si difiere, cambia a falso
    num := num DIV 10; // Elimina el dígito ya comparado
  end;
end;

{
  Parámetros:
    num: integer - Número a analizar

  Para qué sirve:
    Verifica si todos los dígitos del número son iguales. Si encuentra
    alguno distinto, devuelve falso.
}
