Program corteControl;
Type
    perro = record
    raza: string;
    nombre: string;   
    edad: integer;
    end;
// Suponiendo que se dispone del procedimiento de lectura de información "leer"
var
   ani: perro;
   cant: integer;
   actual:string;
begin
    leer(ani); // Leer una vez
    while (ani.raza <> ´XXX´) do
    begin
        while ((ani.raza <> ´XXX´)and(ani.raza = actual)) do
            begin
                cant:= cant + 1;
                leer(ani); // Volver a leer
            end;
        if (cant >= max) then 
        begin
            max:= cant;
            razaMax:= actual;
        end;   
    end;
end.