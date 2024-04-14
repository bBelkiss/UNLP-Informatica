Program decision;
var
    num1, num2, suma: integer;
begin
  read(num1);
  read(num2);
  suma := num1 + num2;
  if (suma > 20) then
    write("La suma supera 20")
  else
    write("La suma es menor o igual a 20");
end.