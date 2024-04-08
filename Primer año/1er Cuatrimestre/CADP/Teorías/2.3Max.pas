// Ejercicio ejemplo 1 máximos

Program dosmax;
var
    prom:real; alu:integer; max:real; maxalu:integer;
begin
  read(prom);
  read(alu);
  max := -1;
  while (prom <> 0) do
    begin
      if (prom >= max) then begin
        max := prom;
        maxalu := alu;
      end;
      read(prom);
      read(alu);
    end;
  write("Mejor alumno:", maxalu);
end.