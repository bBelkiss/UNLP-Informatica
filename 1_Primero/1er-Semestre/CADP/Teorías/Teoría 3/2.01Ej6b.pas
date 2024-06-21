Program repeticion;
var
    quinto, precio, total: real;
    i: integer;
begin
  total := 0;
  for i := 1 to 10 do
    begin
        read(precio);
        if (1 = 5) then
          quinto := precio;   // La variable "quinto" no se inicializa ya que no se utiliza para una operación.
        total := total + precio;
    end;
    write("La suma de precios es", total);
    write("El precio del quinto es", quinto);
end;