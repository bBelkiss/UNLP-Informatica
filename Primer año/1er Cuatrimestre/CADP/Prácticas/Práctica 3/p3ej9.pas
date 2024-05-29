{9. Realizar un programa que lea información de los candidatos ganadores de las últimas elecciones a intendente de
la provincia de Buenos Aires. Para cada candidato se lee: localidad, apellido del candidato, cantidad de votos
obtenidos y cantidad de votantes de la localidad. La lectura finaliza al leer la localidad ‘Zárate’, que debe procesarse.
Informar:
● El intendente que obtuvo la mayor cantidad de votos en la elección.
● El intendente que obtuvo el mayor porcentaje de votos de la elección.}

program Ej9;
type
    cadena10 = string[10];
    candidato = record
        localidad:cadena10;
        apellido:cadena10;
        cantVotos:integer;
        votantesxloc:integer;
    end;
procedure mayorPorcentaje (porcActual:real; var mayorPorcentaje:real; apellido:cadena10; var nomporcentaje:cadena10);
begin
    if (porcActual > mayorPorcentaje) then begin
        mayorPorcentaje:=porcActual;
        nomporcentaje:=apellido;
    end;
end;
function calcularporcentaje(cantVotosAct, totalVotos:integer):real;
begin
    calcularporcentaje:=(cantVotosAct/TotalVotos)*100;
end;
procedure masVotado(votosActual:integer; candidatoActual:cadena10; var maxVotos:integer; var  intendentemayor:cadena10);
begin
    if (votosActual > maxVotos) then begin
        maxVotos:=votosActual;
        intendentemayor:= candidatoActual;
    end;
end;
procedure leerCandidato (var c:candidato);
begin
    with c do begin
        writeln('Localidad:');
        readln(localidad);
        writeln('Apellido:');
        readln(apellido);
        writeln('Cantidad de votos:');
        readln(cantVotos);
        writeln('Votantes de ',localidad);
        readln(votantesxloc);
    end;
end;
var
    cand:candidato;
    intendentemayor, nomporcentaje:cadena10;
    maxVotos,cantTotalVotos:integer;
    porcentaje, maxPorcentaje:real;
begin
    maxVotos:=-1;
    cantTotalVotos:=0;
    maxPorcentaje:=-1;
    repeat
        leerCandidato(cand);
        cantTotalVotos:=cantTotalVotos+cand.cantVotos;
        masVotado(cand.cantVotos, cand.apellido, maxVotos, intendentemayor);
        porcentaje:= calcularporcentaje(cand.cantVotos,cantTotalVotos);
        mayorPorcentaje (porcentaje,maxPorcentaje,cand.apellido, nomporcentaje);
    until (cand.localidad = 'Zarate');
    writeln('El intendente' , intendentemayor,' obtuvo la mayor cantidad de votos en la elección.');
    writeln('El intendente', nomporcentaje,' obtuvo el mayor porcentaje de votos de la elección,');
end.