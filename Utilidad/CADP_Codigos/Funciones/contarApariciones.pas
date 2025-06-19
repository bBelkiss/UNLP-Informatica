function contarApariciones(num, buscado: integer): integer;
var
  digito: integer;   // Almacena cada dígito extraído
  contador: integer; // Cuenta cuántas veces aparece el dígito buscado
begin
  contador := 0; // Inicializa contador
  while (num <> 0) do // Mientras queden dígitos por analizar
  begin
    digito := num MOD 10; // Extrae el último dígito
    if (digito = buscado) then // Compara con el dígito buscado
      contador := contador + 1; // Incrementa contador si coincide
    num := num DIV 10; // Elimina el último dígito
  end;
  contarApariciones := contador; // Devuelve la cantidad encontrada
end;

{
  Parámetros:
    num: integer - Número a analizar
    buscado: integer - Dígito que se desea contar

  Para qué sirve:
    Recorre todos los dígitos del número y cuenta cuántas veces aparece
    el dígito indicado como "buscado".
}
