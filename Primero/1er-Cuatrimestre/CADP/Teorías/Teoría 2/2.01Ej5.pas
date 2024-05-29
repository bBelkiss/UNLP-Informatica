Program iteracion;
var
    prod, total: integer;
begin
  total := 0;
  repeat
    read(prod);
    if (prod MOD 2 = 0) then
      total := total + 1;
  until (prod = 30)
  write(total);
end;