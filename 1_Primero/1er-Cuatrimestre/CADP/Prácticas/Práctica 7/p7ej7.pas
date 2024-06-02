{7. La Facultad de Informática desea procesar la información de los alumnos que finalizaron la carrera de Analista Programador Universitario. Para ello se deberá leer la información de cada alumno, a saber: número de alumno, apellido, nombres, dirección de correo electrónico, año de ingreso, año de egreso y las notas obtenidas en cada una de las 24 materias que aprobó (los aplazos no se registran).
1. Realizar un módulo que lea y almacene la información de los alumnos hasta que se ingrese el alumno con número de alumno -1, el cual no debe procesarse. Las 24 notas correspondientes a cada alumno deben quedar ordenadas de forma descendente.
2. Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:
a. El promedio de notas obtenido por cada alumno.
b. La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto únicamente por dígitos impares.
c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido se recibieron (o sea, que tardaron menos años)
3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de la estructura generada en el inciso 1. El alumno puede no existir.
}

// incompleto
program Ej7;
type
    cadena15=string[15];
    cadena40=string[40];
    rangoAnio=1900..2021;
    rangoNotas=1..24;
    Notas=array [rangoNotas] of integer;
    alumno=record   
        NroAlu:integer;
        Ape:cadena15;
        Nom:cadena15;
        Mail:cadena40;
        Al:rangoAnio;
        AE:rangoAnio;
        DetNotas:Notas;
    end;
    Lista=^nodo;
    Nodo= record
        Datos:alumno;
        sig:Lista;
    end; 
    Rmin=record
        Ape:cadena15;
        Nom:cadena15;
        Mail:cadena40;
    end;
procedure InsertarOrdenado (var N:Notas;valor:integer);
var
    dimF:integer;
begin
    // incompleto
end;
procedure LeerNotas(V:Notas);
var
    i:integer;
    valor:integer;
begin
    for i:=1 to 24 do
    begin
        readln(valor);
        InsertarOrdenado(V,valor);
    end;
end;
procedure LeerAlumno(Alum:alumno);
begin
    readln(Alum.NroAlu);
    readln(Alum.Ape);
    readln(Alum.Nom);
    readln(Alum.Mail);
    readln(Alum.Al);
    readln(Alum.AE);
    LeerNotas(Alum.DetNotas);
end;
procedure AgregarAdelante(var L:lista;Alu:alumno);
var
    nue:Lista;
begin
    new(nue);
    nue^.Datos:=Alu;
    nue^.sig:=L;
end;
procedure CargarLista(var L:Lista);
var
    Alum:alumno;
begin
    LeerAlumno(Alum);
    while L^.Datos.NroAlu <> -1 do
    begin
        AgregarAdelante(L,Alum);
        LeerAlumno(Alum);
    end;
end;
function CalcularPromedio (V:Notas):real;
var
    suma:real;
    i:integer;
begin
    for i:=1 to 24 do
    begin
        suma:=suma+V[i];
    end;
    CalcularPromedio:=suma/24;
end;
function contarimpar (numero:integer): Boolean;
var 
    cumple:Boolean;
    dig:integer;
begin
    cumple:=True;
    while (numero <> 0) and (cumple=true) do
    begin
        dig:=numero mod 10;
        if ((dig mod 2) = 0)then
        begin
            cumple:=false;
        end;
    end;
    contarimpar:=cumple;
end;
procedure CalcularDosMinimos(var min1,min2:integer;Al:rangoAnio;AE:rangoAnio;var Rmin1,Rmin2:Rmin);
begin
  // incompleto
end;
procedure mostrarMinimos(R1,R2:Rmin);
begin
  // incompleto
end;
procedure RecorrerLista(L:Lista);
var
    prom:real;
    OK:Boolean;
    CI2012:integer;
    min1:integer;
    min2:integer;
    Rmin1,Rmin2:Rmin;
begin
    CI2012:=0;
    min1:=20;
    min2:=20;
    while L<>Nil do
    begin
        prom:=CalcularPromedio(L^.Datos.DetNotas);
        writeln(L^.Datos.NroAlu,prom);
        if (L^.Datos.AE = 2012) then
        begin
            OK:=contarimpar(L^.Datos.NroAlu);
            if (OK) then
            begin
                CI2012:=CI2012+1;  
            end;
        end;
        CalcularDosMinimos(min1,min2,L^.Datos.Al,L^.Datos.AE,Rmin1,Rmin2);
        L:=L^.sig;  
    end;
    writeln('La cantidad de alumnos de 2012 con Nro alumno con digitos impares es: ', CI2012);
    mostrarMinimos();
end;
procedure EliminarElemento(var L:Lista;E:integer;var ok:Boolean);
var 
    ant,act:Lista;
begin
    ok:=false;
    act:=L;
    while (act <> nil) and (act^.Datos.NroAlu <> E) do
    begin
        ant:=act;
        act:=act^.sig;  
    end;
    if (act <> nil) then
    begin
        ok:=true;
        if(act=L)then L:=L^.sig;
        else
            ant^.sig:=act^.sig;
        dispose(act);
    end;
end;
var
    L:lista;
    elemento:integer;
    ok:boolean;
begin
    L := nil;
    CargarLista(L);
    RecorrerLista(L);
    readln(elemento);
    EliminarElemento(L,elemento,ok);
    if (ok) then 
        writeln('Se pudo eliminar');
end.