program accesoRegistros;
type
    perros = record
        nombre: string;
        raza: string;
        edad: integer;
    end;
procedure leerInfo(var p: perros);
    begin
        read(p.nombre);
        read(p.raza);
        read(p.edad);
    end;