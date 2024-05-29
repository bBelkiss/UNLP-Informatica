Program repeticion;
var
    precio, toal: real;
    i: integer;
begin
  total := 0
  for i := 1 to 10 do
    begin
        read(precio);
        total := total + precio;
    end;
    write("La suma de los precios es:", total);
end.
