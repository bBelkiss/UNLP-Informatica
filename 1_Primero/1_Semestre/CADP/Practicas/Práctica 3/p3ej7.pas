{7-Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios.}

program Ej7;
type
    cadena10 = string[10];
    cadena30 = string[30];
    centro = record
        nombre:cadena10;
        univeper:cadena30;
        cantInv:integer;
        cantBec:integer;
    end;
procedure menorCantBec(centroActual:cadena10; cantBecAct:integer; var menorBec1,menorBec2:integer; var centro1,centro2:cadena10);
begin
    if (cantBecAct < menorBec1) then begin
        menorBec2:=menorBec1;
        centro2:=centro1;
        menorBec1:=cantBecAct;
        centro1:=centroActual;
    end
    else if (cantBecAct < menorBec2) then begin
            menorBec2:=cantBecAct;
            centro2:=centroActual;
            
        end;
end;
procedure mayorInvestigadores(cantInv:integer; uniactual:cadena30; var maycantinv:integer; var univMayor:cadena30);
begin
    if (cantInv > maycantinv) then begin
        maycantinv:=cantInv;
        univMayor:=uniactual;
    end;
end;
procedure leerCentro (var c:centro);
begin
    with c do begin
        writeln('Cantidad de investigadores:');
        readln(cantInv);
        if (cantInv <> 0) then begin
        writeln('Nombre de centro:');
        readln(nombre);
        writeln('Universidad a la que pertenece:'); 
        readln(univeper);
        writeln('Cantidad de becarios:');
        readln(cantBec);
        end;
    end;
end;
var
    cen: centro;
    totalCentros,totalInvest,maycantinv,menorBec1,menorBec2: integer;
    centro1,centro2: cadena10;
    univActual,univMayor: cadena30;
begin
    maycantinv:=-1;
    menorBec1:=999;
    menorBec2:=999;
    leerCentro(cen);
    while(cen.cantInv <> 0) do begin
        univActual:= cen.univeper;
        totalCentros:=0;
        totalInvest:=0;
        while (cen.cantInv <> 0) and (univActual= cen.univeper) do begin
            totalCentros:=totalCentros+1;
            totalInvest:=totalInvest+cen.cantInv;
            menorCantBec(cen.nombre,cen.cantBec, menorBec1,menorBec2,centro1,centro2);
            leerCentro(cen);
        end;
        writeln('Cantidad total de centros para cada universidad: ', totalCentros); 
        mayorInvestigadores(totalInvest,univActual,maycantinv,univMayor);
    end;
    writeln('Universidad con mayor cantidad de investigadores en sus centros: ', univMayor);
    writeln('Los dos centros con menor cantidad de becarios: ', centro1 ,' y ', centro2);
end.
