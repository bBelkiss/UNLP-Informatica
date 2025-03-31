{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar proyectos
de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se han
determinado los siguientes criterios:
-sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la
superficie terrestre con grandes antenas.
A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar
un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los nuevos
criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no
los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el costo
total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello, utilice
el módulo realizado en b.
}

program Ej7;
const
    dimF = 7;
type
    rangoEspectro = 1..dimF;
    cadena15 = string[15];
    sonda = record
        nombre:cadena15;
        duracEstimada:integer;
        costoConstruc:real;
        costoMantenMens:real;
        rango:rangoEspectro;
    end;
    vec_espectro = array [rangoEspectro] of integer;
    
    lista=^nodo;
    nodo=record
        dato:sonda;
        sig:lista;
    end;
procedure imprimirLista(l:lista);
var 
    cantTotalProy:integer;
    costoTotal:real;
begin
    cantTotalProy:=0;
    costoTotal:=0;
    while (l<> nil) do begin
        cantTotalProy:=cantTotalProy+1;
        costoTotal:=costoTotal+(l^.dato.costoConstruc  + l^.dato.costoMantenMens * l^.dato.duracEstimada);
        l:=l^.sig;
    end;
    writeln('el costo total:',costoTotal);
    writeln('la cant total de sondas es:',cantTotalProy);
end;
procedure agregarAdelante2(var pri:lista; s:sonda);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=s;
    nue^.sig:=pri;
    pri:=nue;
end;
function cumple(MantenMens:real;duracEstimada:integer;costoConstruc:real;rangoActual:rangoEspectro):boolean;
begin
    cumple:= ((MantenMens * duracEstimada)< costoConstruc) and (rangoActual <> 1)
end;
function VerificoSiesMayor (duracEstimada:integer; duracProm:real):integer;
begin
    if (duracEstimada > duracProm) then
        VerificoSiesMayor:=1
    else
        VerificoSiesMayor:=0;
end;
procedure recorrerVecContador(vc:vec_espectro);
var 
    i:integer;
begin
    for i:= 1 to dimF do
    writeln('cantidad de sondas para el espectro ',i ,' es ', vc[i]);
end;
procedure masCostosa(nombreActual:cadena15;costoConstruc,costoMantenMens:real;var max:real;var nombre:cadena15);
var
    total:real;
begin
    total:= costoMantenMens+costoConstruc;
    if (total > max) then begin
        max:=total;
        nombre:=nombreActual;
    end;
        
end;
procedure agregarAdelanteNombre(var pri:lista; nom:cadena15);
var
    nue:lista;
begin
    new(nue);
    nue^.dato.nombre:=nom;
    nue^.sig:=pri;
    pri:=nue;
end;
procedure recorrerLista (pri:lista;var vc:vec_espectro; duracProm,costoPromedio:real;var listaCumple,listaNoCumple:lista);
var
    max:real; 
    nombreCostosa:cadena15;
    ln:lista;
    cantSondasMayDurac:integer;
begin
    ln:=nil;
    max:=-1;
    cantSondasMayDurac:=0;
    while (pri <> nil) do begin
        masCostosa(pri^.dato.nombre,pri^.dato.costoConstruc,pri^.dato.costoMantenMens,max, nombreCostosa);
        vc[pri^.dato.rango]:=vc[pri^.dato.rango]+1;
        cantSondasMayDurac:=cantSondasMayDurac+(VerificoSiesMayor(pri^.dato.duracEstimada, duracProm));
        if (pri^.dato.costoConstruc > costoPromedio) then
            agregarAdelanteNombre(ln,pri^.dato.nombre);
        if (cumple(pri^.dato.costoMantenMens,pri^.dato.duracEstimada,pri^.dato.costoConstruc,pri^.dato.rango)) then 
            agregarAdelante2(listaCumple,pri^.dato)
        else
            agregarAdelante2(listaNoCumple,pri^.dato);
        
        pri:=pri^.sig;
    end;
    writeln(nombreCostosa,'es la sonda más costosa (considerando su costo de construcción y de mantenimiento)');
    recorrerVecContador(vc);
    writeln(cantSondasMayDurac,'es la cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.');
end;
procedure agregarAdelante(var pri:lista;s:sonda);
var
    aux:lista;
begin
    new(aux);
    aux^.dato:=s;
    aux^.sig:=pri;
    pri:=aux;
end;
procedure leerSonda(var s:sonda);
begin
        writeln('Nombre:');
        readln(s.nombre);
        writeln('Duración estimada de la misión:');
        readln(s.duracEstimada);
        writeln('Costo de construcción:');
        readln(s.costoConstruc);
        writeln('Costo de mantenimiento mensual:');
        readln(s.costoMantenMens);
        writeln('Rango del espectro electromagnetico:');
        readln(s.rango);
end;
procedure generarLista(var pri:lista;var promedio:real; costoPromedio:real);
var
    s:sonda;
    totalDuracion,cantSondas:integer;
    totalCosto:real;
begin
    cantSondas:=0;
    totalDuracion:=0;
    totalCosto:=0;
    repeat
        leerSonda(s);
        agregarAdelante(pri,s);
        cantSondas:= cantSondas + 1;
        totalDuracion:= totalDuracion + s.duracEstimada;
        totalCosto:=totalCosto+s.costoConstruc;
   until (s.nombre = 'GAIA');
   promedio:=(totalDuracion/cantSondas);
   costoPromedio:=(totalCosto/cantSondas);
end; 
procedure inicializarVector(var v:vec_espectro);
var
    i:integer;
begin
    for i:=1 to dimF do
        v[i]:=0;
end;
var
    l,listaCumple, listaNoCumple:lista;
    v:vec_espectro;
    prom,costoPromedio:real;
begin
    l:=nil;
    listaCumple:=nil;
    listaNoCumple:=nil;
    inicializarVector(v);
    generarLista(l,prom,costoPromedio);
    recorrerLista(l,v,prom,costoPromedio, listaCumple, listaNoCumple);
    imprimirLista(listaNoCumple);
end.
