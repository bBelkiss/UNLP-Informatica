{12-En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) la cantidad de galaxias de cada tipo.
b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}

program Ej12;
const
    fin = 53;
type
    rangoGalaxia=1..fin;
    rangoTipo = 1..4;
    cadena10 = string[10];
    galaxia = record
        nombre: cadena10;
        tipo:rangoTipo;
        masa:real;
        distancia:integer;
    end;
vec_galaxias = array [rangoGalaxia] of galaxia; 
vec_Tipo = array [rangoTipo] of integer;
procedure imprimir (vt:vec_Tipo);
var
    i:rangoTipo;
begin
    for i:=1 to 4 do
        writeln ('Para la galaxia del tipo', i,' hay: ',vt[i],' galaxias');
end;
procedure mayorMasa(masaAct:real; nomActual:cadena10; var maxMasa1,maxMasa2:real; var nomMax1,nomMax2:cadena10);
begin
    if (masaAct>maxMasa1) then begin
        maxMasa2:=maxMasa1;
        nomMax2:=nomMax1;
        maxMasa1:=masaAct;
        nomMax1:=nomActual;
    end
    else
        if(masaAct>maxMasa2) then begin
            maxMasa2:=masaAct;
            nomMax2:=nomActual;
        end;
end;
procedure menorMasa(masaAct:real; nomActual:cadena10; var minMasa1,minMasa2:real; var nomMin1,nomMin2:cadena10);
begin
    if (masaAct < minMasa1) then begin
        minMasa2:= minMasa1;
        nomMin2:= nomMin1;
        minMasa1:= masaAct;
        nomMin1:= nomActual;
    end
    else
        if(masaAct < minMasa2) then begin
            minMasa2:=masaAct;
            nomMin2:=nomActual;
        end;
end;
function noIrregulares (tipoGal:rangoTipo; distActual: integer):integer;
begin
    if (tipoGal <> 4) and (distActual < 1000) then
        noIrregulares:=1
    else
        noIrregulares:=0;
end;
function porcenMasas (totalMasas, masa3gal:real):real;
begin
    porcenMasas:= (masa3gal/totalMasas)*100;
end;
function sumaMasas3Gal (nomActual:cadena10; masaActual:real): real;
begin
    if (nomActual= 'VIA LACTEA') or (nomActual= 'ANDROMEDA') or (nomActual= 'TRIANGULO') then
        sumaMasas3Gal:=masaActual;
    else
        sumaMasas3Gal:=0;
end;
procedure cantGalaxiaXTipo (tipoActual:rangoTipo; var vt:vec_Tipo);
begin
    vt[tipoActual]:=vt[tipoActual]+1;   
end;
procedure cargarVectorTipo (var vt:vec_Tipo);
var
    i:rangoTipo;
begin
    for i:=1 to 4 do
        vt[i]:=0;
end;
procedure leerGalaxia (var gal:galaxia);
begin
    with gal do begin
        writeln('Nombre:');
        readln(nombre);
        writeln('Tipo');
        readln(tipo);
        writeln('Masa en kg:');
        readln(masa);
        writeln('Distancia en pc:');
        readln(distancia);
    end;
end;
procedure cargarVector (var v:vec_galaxias);
var
    i:integer;
    g:galaxia;
begin
    for i:=1 to fin do begin
        leerGalaxia(g);
        v[i]:=g;
    end;
end;
var
    vg:vec_galaxias;
    vt:vec_Tipo;
    i:rangoGalaxia;
    masaTotal,masa3Galaxias,porcentaje,maxMasa1,maxMasa2,minMasa1, minMasa2:real;
    cantNoIrreg:integer;
    nomMax1,nomMax2,nomMin1,nomMin2:cadena10;
begin
    maxMasa1:=-1;
    maxMasa2:=-1;
    minMasa1:=9999;
    minMasa2:=9999;
    masaTotal:=0;
    masa3Galaxias:=0;
    cantNoIrreg:=0;
    cargarVector(vg);
    cargarVectorTipo(vt);
    for i:=1 to fin do begin
        cantGalaxiaXTipo(vg[i].tipo,vt);
        masa3Galaxias:= masa3Galaxias + sumaMasas3Gal(vg[i].nombre, vg[i].masa);
        masaTotal:= masaTotal + vg[i].masa;
        cantNoIrreg:= cantNoIrreg + noIrregulares(vg[i].tipo, vg[i].distancia);
        mayorMasa(vg[i].masa,vg[i].nombre,maxMasa1,maxMasa2,nomMax1,nomMax2);
        menorMasa(vg[i].masa,vg[i].nombre,minMasa1,minMasa2,nomMin1,nomMin2);
    end;
    porcentaje:=porcenMasas(masaTotal,masa3Galaxias);
    imprimir(vt);
    writeln('Porcentaje de la masa total acumulada de las 3 galaxias principales respecto a la masa de todas las galaxias: ',porcentaje:6:2,' $');
    writeln('Nombre de las dos galaxias con mayor masa: ',nomMax1,' y ',nomMax2,' y el de las dos galaxias con menor masa es ', nomMin1, ' y ',nomMin2);
end.