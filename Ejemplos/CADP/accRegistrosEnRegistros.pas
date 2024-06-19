program accesoRegistrosEnRegistros;
type
    perros = record
        nombre: string;
        raza = record;
            golden: integer;
            cachorro: integer;
            policia: integer;
        edad: integer;
    end;
procedure leerInfo(var p: perros);
    begin
        read(p.nombre);
        read(p.raza.golden);
        read(p.raza.cachorro);
        read(p.raza.policia);
        read(p.edad);
    end;