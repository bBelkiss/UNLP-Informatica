{ 5. a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de
numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad
de pares en las que numB es el doble de numA.
Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los
valores 4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA)}

program verificadorPares;
{ 
  a. Módulo que verifica si numB es el doble de numA
  Retorna verdadero si numB es exactamente el doble de numA
}
function esDoble(numA, numB: integer): boolean;
begin
  esDoble := (numB = 2 * numA);
end;
{
  b. Programa principal que lee secuencias de pares hasta (0,0)
  Cuenta el total de pares y cuántos cumplen la condición de ser doble
}
var
  numA, numB: integer;
  totalPares, paresDoble: integer;
begin
  totalPares := 0;
  paresDoble := 0;
  writeln('Ingrese pares de números (0,0 para terminar):');
  repeat
    write('Ingrese numA: ');
    readln(numA);
    write('Ingrese numB: ');
    readln(numB);
    { Solo contamos si no es el par de terminación (0,0) }
    if (numA <> 0) or (numB <> 0) then
    begin
      totalPares := totalPares + 1;
      if esDoble(numA, numB) then
        paresDoble := paresDoble + 1;
    end;
  until (numA = 0) and (numB = 0);
  writeln('Total de pares leídos: ', totalPares);
  writeln('Pares donde numB es doble de numA: ', paresDoble);
end.