{ 1. Una productora nacional realiza un casting de personas para la selección de actores extras de una nueva
película, para ello se debe leer y almacenar la información de las personas que desean participar de dicho
casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de género de actuación que
prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura finaliza cuando llega una
persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no existir.
Invocar dicho módulo en el programa principal. }

program Ej1;
type
    rangoGenero=1..5;
    cadena=string[50];
    persona=record
        DNI:integer;
        edad:integer;
        ApyNom:integer;
        codGen:rangoGenero;
    end;
    listaP=^nodoP
    nodoP=record
        dato:persona;
        sig:listaP;
    end;
    vec_contador=array[rangoGenero] of integer;
procedure LeerPersona(var p:persona);
begin
  writeln('Escribe el DNI de la persona')
  readln(p.DNI);
  writeln('Escribe el nombre y apellido de la persona')
  readln(p.ApyNom);
  writeln('Escribe la edad de la persona')
  readln(p.edad);
  writeln('Escribe el código de género de actuación que prefiere')
  readln(p.codGen);
end;
procedure agregarAdelante(var l:listaP;p:persona);
var
    aux:listaP
begin
  new(aux);
  aux^.dato:=p;
  aux^.sig:=l;
  l:=aux;
end;
procedure Cargar(var l:listaP);
var
    p:persona;
begin
  repeat
    LeerPersona(p);
    agregarAdelante(l, p);
  until (p.DNI=33444555);
end;
procedure Inicializar(var v:vec_contador);
var
    i:integer;
begin
  for i:=1 to 5 do
    v[i]:=0;
end;
function Cumple(N:integer):boolean
var
    cantPares, cantImpares, dig:integer;
begin
  cantPares, cantImpares:0;
  while (N<>0) do
  begin
    dig:=N MOD 10;
    if (dig MOD 2 = 0) then
        cantPares:=cantPares+1;
        else
            cantImpares:=cantImpares+1;
  end;
end;
procedure Calcular(var v:vec_contador;var cantP:integer;l:listaP)
begin
  while (l<>nil) do
    begin
      if (Cumple(l^.dato.DNI) then cantP:=cantP+1);
      v[l^.dato.codGen]:=v[l^.dato.codGen]+1;
      l:=l^.sig;
    end;
end;
procedure DosMaximos(v:vec_contador; var genMax1, genMax2:rangoGenero);
var
    max1, max2, i:integer;
begin
  max1:=-1;
  for i:=1 to 5 do
   if (v[i] > max1) then
   begin
     max2:=max1;
     genMax2:=genMax1;
     max1:=v[i];
     genMax1:=i;
   end;
   else if (v[i] > max2) then
   begin
     max2:=v[i];
     genMax2:=i;
   end;
end;
procedure Eliminar(var l:listaP; unDNI:integer; var ok:boolean);
var
    act, ant:listaP
begin
  act:=l
  while (act <> nil) and (act^.dato.DNI <> unDNI) do
  begin
    ant:=act;
    act:=act^.sig;
  end;
  if (act <> nil) then
  begin
    ok:=true;
    if (act = l) then
        l:=act^.sig;
        else
            ant^.sig:=act^.sig;
            dispose(act);
        else
            ok:=false;
  end;
end;
var
    l:listaP;
    v:vec_contador;
    genMax1, genMax2:rangoGenero;
    cantP, unDNI:integer;
    ok:boolean;
begin
  l:=nil;
  Cargar(l);
  cantP:=0;
  Inicializar(l);
  Calcular(l, v, cantP);
  writeln('La cantidad de personas cuyo DNI...', cantP);
  DosMaximos(v, genMax1, genMax2);
  writeln('Los códigos de género más elegidos son: ', genMax1, 'y', genMax2);
  writeln('Ingrese un DNI a borrar');
  readln(unDNI);
  Eliminar(l, unDNI, ok)
  if (ok) then
    writeln('Persona borrada');
    else
    writeln('Persona no encontrada');
end;
