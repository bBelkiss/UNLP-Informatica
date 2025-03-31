// Ejercicio de ejemplo para subrangos

Program sub;
type
    letras = 'a'..'z';
var
    primer,segundo,tercer:integer;
    letra:letras;
begin
  primer := 0; segundo := 0, tercer := 0;
  read(letra);
  while (letra <> 'z') do
    begin
      case letra of
      'a'..'h': primer := primer + 1:
      'i'..'n': segundo := segundo + 1;
      'ñ'..'y': tercer := tercer + 1;
      end;
    read(letra);
    end;
  write(primer, segundo, tercer); 
end;