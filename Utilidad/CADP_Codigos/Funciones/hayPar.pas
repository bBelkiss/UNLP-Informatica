function tienePar(num: integer): boolean;
var
  digito: integer; // Almacena cada dígito extraído
begin
  tienePar := false; // Inicializa en falso
  while (num <> 0) and (not tienePar) do // Mientras haya dígitos y no se haya encontrado un par
  begin
    digito := num MOD 10; // Extrae el último dígito
    if (digito MOD 2 = 0) then // Verifica si el dígito es par
      tienePar := true; // Si es par, cambia a verdadero
    num := num DIV 10; // Elimina el último dígito
  end;
end;

{
  Parámetros:
    num: integer - Número a analizar

  Para qué sirve:
    Recorre todos los dígitos del número y determina si hay al menos un
    dígito par (divisible por 2).
}
