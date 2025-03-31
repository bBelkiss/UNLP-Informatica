{8-Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}

program Ej8;
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
    end;
    else
        if( anioAnalizado < anio2) then begin
            apeViejo2:= apeAct;
            nomViejo2:= nomAct;
            anio2:= anioAnalizado;
        end;
end;
function calcularPorcentaje (cantPares:integer):real;
begin
    calcularPorcentaje:= (cantPares/dimF) *100;
end;
function soloDigPares (num:integer): integer;
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
    if (esPar) then 
        soloDigPares:= 1
    else soloDigPares:= 0;
end;
procedure leerAlumno (var a:alumno);
begin
    with a do begin
        writeln('Nro. inscripción:');
        readln(nroInsc);
        writeln('DNI:');
        readln(dni);
        writeln('Apellido:');
        readln(ape);
        writeln('Nombre:');
        readln(nom);
        writeln('Año de nacimiento:');
        readln(anionac);
    end;
end;
procedure cargarAlumnos(var v:vec_alumnos);
var
    i:integer;
    alu:alumno;
begin
    for i:=1 to dimF do begin 
        leerAlumno(alu);
        v[i]:=alu;
    end;
end;
var
    v:vec_alumnos;
    i,cantPares, anio1,anio2:integer;
    porcentaje:real;
    apeViejo1,apeViejo2,nomViejo1,nomViejo2:cadena15;
begin
    anio1:=9999;
    anio2:=999;
    cantPares:=0;
    cargarAlumnos(v);
    for i:=1 to dimF do begin    
        cantPares:= cantPares +soloDigPares(v[i].dni);
        masViejos(v[i].anionac,v[i].ape,v[i].nom,anio1,anio2,apeViejo1,nomViejo1,apeViejo2,nomViejo2);
    end;
    porcentaje:= calcularPorcentaje(cantPares); 
    writeln('Porcentaje de alumnos con DNI compuesto sólo por dígitos pares: ', porcentaje:2:2, '%');
    writeln('Apellido y nombre de los dos alumnos de mayor edad edad son:', apeViejo1 , nomViejo1,' y ', apeViejo2 , nomViejo2);
end.
