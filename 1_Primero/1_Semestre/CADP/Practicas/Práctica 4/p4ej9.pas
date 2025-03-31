{9-Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).}

program Ej9;
const
    dimF = 400;
type
    rango = 1..dimF;
    cadena15 = string[15];
    alumno = record
        nroInsc:integer;
        dni:integer;
        ape:cadena15;
        nom:cadena15;
        anionac:integer;
    end;
    vec_alumnos= array [rango] of alumno;
procedure masViejos(anioAnalizado:integer; apeAct, nomAct:cadena15; var anio1,anio2: integer; var apeViejo1,nomViejo1,apeViejo2,nomViejo2:cadena15);
begin
    if(anioAnalizado < anio1) then begin
        anio2:= anio1;
        apeViejo2:= apeViejo1;
        nomViejo2:= nomViejo1;
        anio1:= anioAnalizado;
        apeViejo1:= apeAct;
        nomViejo1:= nomAct;
    end
    else
        if( anioAnalizado < anio2) then begin
            apeViejo2:= apeAct;
            nomViejo2:= nomAct;
            anio2:= anioAnalizado;
        
        end;
end;
function calcularPorcentaje (cantPares:integer; dimL:rango):real;
begin
    calcularPorcentaje:= (cantPares/dimL) *100;
end;
function soloDigPares (num:integer): boolean;
var 
    dig:integer;
    esPar:boolean;
begin
    esPar:=true;
    while (num <> 0) and (esPar) do begin
        dig := num mod 10;
        if ((dig mod 2) = 0) then
            num:= num div 10
        else
            esPar:=false;
        end;
    soloDigPares:=esPar;
end;
procedure leerAlumno (var a:alumno);
begin
    with a do begin
        writeln('DNI:');
        readln(dni);
        if (dni <> -1) then begin
            writeln('Nro. incripción:');
            readln(nroInsc);
            writeln('Apellido:');
            readln(ape);
            writeln('Nombre:');
            readln(nom);
            writeln('Año de nacimiento:');
            readln(anionac);
        end;
    end;
end;
procedure cargarAlumnos(var v:vec_alumnos; var dimL:integer);
var
    alu:alumno;
begin
    leerAlumno(alu);
    while (alu.dni <> - 1)and (dimL< dimF) do begin
        dimL:=dimL+1;
        v[dimL]:=alu;
        leerAlumno(alu);
    end;
end;
var
    v:vec_alumnos;
    i,dimL,cantPares, anio1,anio2:integer;
    porcentaje:real;
    apeViejo1,apeViejo2,nomViejo1,nomViejo2:cadena15;
begin
    cantPares:=0;
    anio1:=9999;
    anio2:=999;
    dimL:=0;
    cargarAlumnos(v,dimL);
    for i:=1 to dimL do begin 
        if ( soloDigPares(v[dimL].dni)) then
            cantPares:= cantPares +1;
        masViejos(v[dimL].anionac,v[dimL].ape,v[dimL].nom,anio1,anio2,apeViejo1,nomViejo1,apeViejo2,nomViejo2);
    end;
    porcentaje:= calcularPorcentaje(cantPares, dimL); 
    writeln('Porcentaje de alumnos con DNI compuesto sólo por dígitos pares: ', porcentaje:2:2, '%');
    writeln('Apellido y nombre de los dos alumnos de mayor edad edad son:', apeViejo1 , nomViejo1,' y ', apeViejo2 , nomViejo2);
end.
