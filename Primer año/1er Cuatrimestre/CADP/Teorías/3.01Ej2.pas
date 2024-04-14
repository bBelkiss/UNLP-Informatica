Program decision;
var
    num1, resultado: integer;
begin
  read(num1);
  if (num1 <= 10) then
    resultado := 10;
  else
    if (num1 > 10) and (num1 <= 50) then
        resultado := 50;
    else
        resultado := 100;
    write(resultado);
end.