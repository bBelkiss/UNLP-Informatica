{ 13. El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos
lugares, obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con
todos los datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos.
Realizar un programa que lea y almacene los datos correspondientes a las mediciones de los últimos
50 años (la información se ingresa ordenada por año). Una vez finalizada la carga de la información,
obtener:
a. El año con mayor temperatura promedio a nivel mundial.
b. El año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años. }

program Ej13;
const
  numAños = 50;
  numPuntos = 100;
type
  matrizTemperaturas = array[1..numAños, 1..numPuntos] of real;
  vectorPromedios = array[1..numAños] of real;
procedure cargarDatos(var temperaturas: matrizTemperaturas);
var
  i, j: integer;
begin
  for i := 1 to numAños do
  begin
    writeln('Ingrese las temperaturas promedio para el año ', i, ':');
    for j := 1 to numPuntos do
    begin
      write('Punto ', j, ': ');
      readln(temperaturas[i, j]);
    end;
  end;
end;
procedure calcularPromedios(temperaturas: matrizTemperaturas; var promedios: vectorPromedios);
var
  i, j: integer;
  suma: real;
begin
  for i := 1 to numAños do
  begin
    suma := 0;
    for j := 1 to numPuntos do
    begin
      suma := suma + temperaturas[i, j];
    end;
    promedios[i] := suma / numPuntos;
  end;
end;
function añoMayorPromedio(promedios: vectorPromedios): integer;
var
  i, añoMax: integer;
  maxProm: real;
begin
  maxProm := -9999;
  añoMax := 1;
  for i := 1 to numAños do
  begin
    if promedios[i] > maxProm then
    begin
      maxProm := promedios[i];
      añoMax := i;
    end;
  end;
  añoMayorPromedio := añoMax;
end;
function añoMayorTemperatura(temperaturas: matrizTemperaturas): integer;
var
  i, j, añoMax: integer;
  maxTemp: real;
begin
  maxTemp := -9999;
  añoMax := 1;
  for i := 1 to numAños do
  begin
    for j := 1 to numPuntos do
    begin
      if temperaturas[i, j] > maxTemp then
      begin
        maxTemp := temperaturas[i, j];
        añoMax := i;
      end;
    end;
  end;
  añoMayorTemperatura := añoMax;
end;
var
  temperaturas: matrizTemperaturas;
  promedios: vectorPromedios;
  añoMaxPromedio, añoMaxTemp: integer;
begin
  cargarDatos(temperaturas);
  calcularPromedios(temperaturas, promedios);
  añoMaxPromedio := añoMayorPromedio(promedios);
  añoMaxTemp := añoMayorTemperatura(temperaturas);
  writeln('El año con mayor temperatura promedio a nivel mundial fue el año ', añoMaxPromedio, '.');
  writeln('El año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años fue el año ', añoMaxTemp, '.');
end.
