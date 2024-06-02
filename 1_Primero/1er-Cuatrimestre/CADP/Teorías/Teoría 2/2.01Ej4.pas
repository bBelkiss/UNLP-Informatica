Program iteracion;
var
    prod, resto: integer;
    total: integer;
begin
  total := 0
  read(prod);
  while (prod <> 30) do
    begin
      resto := prod MOD 2;
      if (resto = 0) then
        total := total + 1;
      read(prod);
    end;
  write(total);
end.