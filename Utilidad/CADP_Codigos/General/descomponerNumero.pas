function descomponerNumero(num: integer): integer;
var
    digito: integer; // Almacena cada dígito extraído
    cant5: integer; // Contador de dígitos '5'
begin
  cant5 := 0; // Inicializa contador
  while (num <> 0) do // Procesa cada dígito mientras el número no sea cero
  begin
    digito := num MOD 10;  // Extrae el último dígito
    if (digito = 5) then // Verifica si el dígito es 5
      cant5 := cant5 + 1; // Incrementa contador
    num := num DIV 10; // Elimina el último dígito procesado
  end;
  descomponerNumero := cant5; // Retorna la cantidad de 5's encontrados
end;

{
  Parámetros:
    num: integer - Número a analizar (en este caso el DNI)

  Para que sirve:
    Descompone un número dígito por dígito y cuenta cuántas veces
    aparece el dígito 5 en él.
}