{8 - La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente
coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la
escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se
ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que
lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e
informe:
● Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.}

program Ej8;
const
    fin = -1;
type
    cadena30 = string[30];
    docente =record
        dni:integer;
        nomyape:cadena30;
        email:cadena30;
    end;
    proyecto = record
        codigo:integer;
        titulo:cadena30;
        coordinador: docente;
        cantAlu:integer;
        nomEscu:cadena30;
        localidad:cadena30;
    end;
procedure LeerDocente(var d:docente);
begin
    with d do begin
        writeln('DNI del docente:');
        readln(dni);
        writeln('Nombre y apellido del docente:');
        Readln(nomyape);
        writeln('Email del docente:');
        readln(email);
    end;
end;
procedure Leer(var p:proyecto);
var
d:docente;
begin
    with p do begin
        writeln('Codigo del proyecto:');
        readln(codigo);
        If(codigo <> fin) then begin
             writeln('Titulo de proyecto:');
             readln(titulo);
             writeln('Datos del coordinador:');
             LeerDocente(d);
             writeln('Cantidad de alumnos:');
             readln(cantAlu);
             writeln('Nombre del colegio:');
             readln(nomEscu);
             writeln('Localidad:');
             readln(localidad);
         end;
    end;
end;
function Iguales(codigo:integer):boolean;
var
    dig, par, impar: integer;
begin
    par:=0;
    impar:=0;
    while (codigo <> 0) do begin
     dig:=codigo mod 10;
     if((dig mod 2) = 0) then
       par:= par + 1
     else
       impar:= impar + 1;
     codigo:=codigo div 10;
    end;
    Iguales:=(par=impar);
end;
procedure maxAlumnos(var max1,max2:integer; var esc1,esc2:cadena30 ;alumnos:integer; escuela:cadena30);
begin
    if (alumnos > max1) then begin
      max2:=max1;
      max1:=alumnos;
      esc2:=esc1;
      esc1:=escuela;
     end
    else
     if (alumnos > max2) then begin
        max2:=alumnos;
        esc2:=escuela;
     end;
end;
var
    proy:proyecto;
    locActu,escAct,esc1,esc2:cadena30;
    contEsc,cantEscLoc, max1,max2,cant: integer;
begin
    contEsc:=0;
    max1:=-1;
    max2:=-1;
    Leer(proy);
    while(proy.codigo <> fin) do begin
     locActu:=proy.localidad;
     contEsc:=contEsc+1;
     cantEscLoc:=0;
     while(proy.codigo <> fin) and (locActu = proy.localidad) do begin
           escAct:=proy.nomEscu;
           cantEscLoc:=cantEscLoc+1;
           cant:=0;
           if(proy.localidad='Daireaux') then begin
             if(Iguales(proy.codigo)) then 
                writeln('el titulo de este proyecto es', proy.titulo);
             while(proy.codigo<> fin) and (locActu=proy.localidad) and (escAct=proy.nomEscu) do begin
                cant:= cant + proy.cantAlu;
                Leer(proy);
             end;
             maxAlumnos(max1,max2,esc1,esc2,cant,proy.nomEscu);
            end;
     end;
           writeln('Para la localidad ',locActu, 'la cantidad de escuelas es de', cantEscLoc);
    end;
    writeln('Las dos escuelas con mas cantidad de alumnos son ',  esc1 ,' con',  max1, 'alumnos, y',  esc2 ,'con',  max2, 'alumnos');
    writeln('La cantidad de escuelas totales que participaron es de ', contEsc);
end.
