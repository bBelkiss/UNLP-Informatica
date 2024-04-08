// Ejercicio ejemplo 2 mínimos

Program dosmin;
var
    prom:real; alu:integer; min:real;
begin
  read(prom);
  read(alu);
  min := 11;
  while (prom <> 0) do
    begin
      if (prom <= min) then
      begin
        min := prom;
      read(prom);
      read(alu);
    end;
  write("Promedio mínimo:", min);
end;