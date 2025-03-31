{ 3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida por
el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez }

program Ej3;
const
  MAX_VIAJES = 200;
type
  rangoDia = 1..31;
  viaje = record
    dia: rangoDia;
    monto: real;
    distancia: real;
  end;
  vectorViajes = array[1..MAX_VIAJES] of viaje;
var
  viajes: vectorViajes;
  dimL: integer;
procedure leerViajes(var v: vectorViajes; var dimL: integer);
var
  d: rangoDia;
  m, dist: real;
begin
  dimL := 0;
  writeln('Ingrese el día, monto transportado y distancia recorrida (0 km para finalizar):');
  readln(d, m, dist);
  while (dist <> 0) and (dimL < MAX_VIAJES) do
  begin
    dimL := dimL + 1;
    v[dimL].dia := d;
    v[dimL].monto := m;
    v[dimL].distancia := dist;
    readln(d, m, dist);
  end;
end;
procedure informarViajes(v: vectorViajes; dimL: integer);
var
  i: integer;
  sumaMontos: real;
  montoMin: real;
  diaMin: rangoDia;
  distMin: real;
  viajesPorDia: array[1..31] of integer;
begin
  sumaMontos := 0;
  montoMin := MaxInt;
  for i := 1 to 31 do
    viajesPorDia[i] := 0;
  for i := 1 to dimL do
  begin
    sumaMontos := sumaMontos + v[i].monto;
    viajesPorDia[v[i].dia] := viajesPorDia[v[i].dia] + 1;
    if v[i].monto < montoMin then
    begin
      montoMin := v[i].monto;
      diaMin := v[i].dia;
      distMin := v[i].distancia;
    end;
  end;
  writeln('Monto promedio transportado: ', sumaMontos / dimL:0:2);
  writeln('Viaje con menos dinero transportado: Día ', diaMin, ', Distancia ', distMin:0:2, ' km, Monto ', montoMin:0:2);
  writeln('Cantidad de viajes realizados cada día del mes:');
  for i := 1 to 31 do
    if viajesPorDia[i] > 0 then
      writeln('Día ', i, ': ', viajesPorDia[i], ' viajes');
end;
procedure eliminarViajes100km(var v: vectorViajes; var dimL: integer);
var
  i, j: integer;
begin
  i := 1;
  while i <= dimL do
  begin
    if v[i].distancia = 100 then
    begin
      for j := i to dimL - 1 do
        v[j] := v[j + 1];
      dimL := dimL - 1;
    end
    else
      i := i + 1;
  end;
end;
procedure imprimirViajes(v: vectorViajes; dimL: integer);
var
  i: integer;
begin
  writeln('Viajes registrados:');
  for i := 1 to dimL do
    writeln('Día: ', v[i].dia, ', Monto: ', v[i].monto:0:2, ', Distancia: ', v[i].distancia:0:2, ' km');
end;
var
  opcion: integer;
begin
  leerViajes(viajes, dimL);
  opcion := 0;
  while opcion <> 5 do
  begin
    writeln('Seleccione una opción:');
    writeln('1. Informar sobre los viajes');
    writeln('2. Eliminar viajes de 100 km');
    writeln('3. Imprimir todos los viajes');
    writeln('4. Salir');
    readln(opcion);
    if opcion = 1 then
      informarViajes(viajes, dimL)
    else if opcion = 2 then
      eliminarViajes100km(viajes, dimL)
    else if opcion = 3 then
      imprimirViajes(viajes, dimL);
  end;
end.
