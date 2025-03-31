{ 6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales
lanzadas al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la
misión (cantidad de meses que permanecerá activa), el costo de construcción, el costo de
mantenimiento mensual y rango del espectro electromagnético sobre el que realizará estudios. Dicho
rango se divide en 7 categorías: 1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta;
6. rayos X; 7. rayos gamma.
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura
finaliza al ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las
sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible }

program Ej6;
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
    lista_nombre=^nodo1;
    nodo1=record
        nombre:cadena15;
        sig:lista;
    end;
function VerificoSiesMayor (duracEstimada, duracProm:real):integer;
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
procedure agregarAdelanteNombre(var pri:lista_nombre; nom:cadena15);
var
    nue:lista_nombre;
begin
    new(nue);
    nue^.nombre:=nom;
    nue^.sig:=pri;
    pri:=nue;
end;
procedure recorrerLista (pri:lista;var vc:vec_espectro; duracProm,costoPromedio:real);
var
    max:real; nombreCostosa:cadena15;
    ln:lista_nombre;
begin
    ln:=nil;
    max:=-1;
    while (pri <> nil) do begin
        masCostosa(pri^.dato.nombre,pri^.dato.costoConstruc,pri^.dato.costoMantenMens,max, nombreCostosa);
        vc[l^.dato.rango]:=vc[l^.dato.rango]+1;
        cantSondasMayDurac:=cantSondasMayDurac+(VerificoSiesMayor (l^.dato.duracEstimada, duracProm));
        if (l^.dato.costoConstruc > costoPromedio) then
            agregarAdelanteNombre(ln,l^.dato.nombre);
        pri:=pri^.sig;
    end;
    writeln(nombreCostosa,' es la sonda más costosa (considerando su costo de construcción y de mantenimiento)');
    recorrerVecContador(vc);
    writeln(cantSondasMayDurac,' es la cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.');
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
    l:lista;
    v:vec_espectro;
    prom,costoPromedio:real;
begin
    l:=nil;
    listaCumple:=nil;
    listaNoCumple:=nil;
    inicializarVector(v);
    generarLista(l,prom,costoPromedio);
    recorrerLista(l,costoPromedio);
end.
