function sumaDigitos(num: integer): integer;
var
  digito: integer; // Almacena cada dígito extraído
  suma: integer;   // Acumulador de la suma de dígitos
begin
  suma := 0; // Inicializa la suma
  while (num <> 0) do // Mientras haya dígitos por procesar
  begin
    digito := num MOD 10; // Extrae el último dígito
    suma := suma + digito; // Lo suma al acumulador
    num := num DIV 10; // Elimina el último dígito
  end;
  sumaDigitos := suma; // Devuelve la suma total
end;

{
  Parámetros:
    num: integer - Número a analizar

  Para qué sirve:
    Suma todos los dígitos del número uno por uno utilizando
    operaciones matemáticas (sin convertir a string).
}
