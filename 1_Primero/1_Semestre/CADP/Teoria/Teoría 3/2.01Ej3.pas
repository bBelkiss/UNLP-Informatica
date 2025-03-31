Program seleccion;
var
    car: char;
begin
  read(car);
  case (car) of
    'a'..'z' :
      write("Minúscula");
    'A'..'Z' :
      write("Mayúscula");
    '0'..'9' :
      write("Numero");
      else
        write("Especial");
end;