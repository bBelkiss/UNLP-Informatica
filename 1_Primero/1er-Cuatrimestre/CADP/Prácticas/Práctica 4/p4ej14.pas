{ 14. El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido
en los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo:

CÓDIGO | ROL DEL DESARROLLADOR | VALOR/HORA (USD)
1           Analista Funcional      35,20
2           Programador             27,45
3       Administrador de bases de datos 31,03
4       Arquitecto de software      44,28
5       Administrador de redes y seguridad 39,87
Nota: los valores/hora se incluyen a modo de ejemplo

Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió
en dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de
proyecto -1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:
a. El monto total invertido en desarrolladores con residencia en Argentina.
b. La cantidad total de horas trabajadas por Administradores de bases de datos.
c. El código del proyecto con menor monto invertido.
d. La cantidad de Arquitectos de software de cada proyecto }

program Ej14;
const
  numProyectos = 1000;
  numRoles = 5;
type
  string30 = string[30];
  rangoProyecto = 1..numProyectos;
  rangoRol = 1..numRoles;
  desarrollador = record
    pais: string30;
    codigoProyecto: integer;
    nombreProyecto: string30;
    rol: rangoRol;
    horasTrabajadas: real;
  end;
  infoProyecto = record
    montoInvertido: real;
    cantArquitectos: integer;
  end;
  tablaRoles = array[rangoRol] of real;
  tablaProyectos = array[rangoProyecto] of infoProyecto;
var
  roles: tablaRoles;
  proyectos: tablaProyectos;
  totalArgentina: real;
  totalHorasDBA: real;
  codigoProyectoMenorMonto: integer;
  menorMonto: real;
procedure inicializarTablas;
var
  i: rangoProyecto;
begin
  roles[1] := 35.20;  // Analista Funcional
  roles[2] := 27.45;  // Programador
  roles[3] := 31.03;  // Administrador de bases de datos
  roles[4] := 44.28;  // Arquitecto de software
  roles[5] := 39.87;  // Administrador de redes y seguridad
  for i := 1 to numProyectos do
  begin
    proyectos[i].montoInvertido := 0;
    proyectos[i].cantArquitectos := 0;
  end;
  totalArgentina := 0;
  totalHorasDBA := 0;
  menorMonto := MaxInt;
  codigoProyectoMenorMonto := -1;
end;
procedure procesarDesarrollador(d: desarrollador);
var
  monto: real;
begin
  monto := d.horasTrabajadas * roles[d.rol];
  if d.pais = 'Argentina' then
    totalArgentina := totalArgentina + monto;
  if d.rol = 3 then
    totalHorasDBA := totalHorasDBA + d.horasTrabajadas;
  if (d.codigoProyecto >= 1) and (d.codigoProyecto <= numProyectos) then
  begin
    proyectos[d.codigoProyecto].montoInvertido := proyectos[d.codigoProyecto].montoInvertido + monto;
    if d.rol = 4 then
      proyectos[d.codigoProyecto].cantArquitectos := proyectos[d.codigoProyecto].cantArquitectos + 1;
  end;
end;
procedure leerDesarrolladores;
var
  d: desarrollador;
begin
  writeln('Ingrese el código del proyecto (-1 para finalizar):');
  readln(d.codigoProyecto);
  while d.codigoProyecto <> -1 do
  begin
    writeln('Ingrese el país de residencia:');
    readln(d.pais);
    writeln('Ingrese el nombre del proyecto:');
    readln(d.nombreProyecto);
    writeln('Ingrese el rol del desarrollador (1 a 5):');
    readln(d.rol);
    writeln('Ingrese la cantidad de horas trabajadas:');
    readln(d.horasTrabajadas);
    procesarDesarrollador(d);
    writeln('Ingrese el código del proyecto (-1 para finalizar):');
    readln(d.codigoProyecto);
  end;
end;
procedure calcularProyectoMenorMonto;
var
  i: rangoProyecto;
begin
  for i := 1 to numProyectos do
  begin
    if proyectos[i].montoInvertido < menorMonto then
    begin
      menorMonto := proyectos[i].montoInvertido;
      codigoProyectoMenorMonto := i;
    end;
  end;
end;
procedure informarResultados;
var
  i: rangoProyecto;
begin
  writeln('Monto total invertido en desarrolladores con residencia en Argentina: $', totalArgentina:0:2);
  writeln('Cantidad total de horas trabajadas por Administradores de bases de datos: ', totalHorasDBA:0:2);
  calcularProyectoMenorMonto;
  writeln('El código del proyecto con menor monto invertido es: ', codigoProyectoMenorMonto);
  writeln('Cantidad de Arquitectos de software por proyecto:');
  for i := 1 to numProyectos do
  begin
    if proyectos[i].cantArquitectos > 0 then
      writeln('Proyecto ', i, ': ', proyectos[i].cantArquitectos, ' arquitectos');
  end;
end;
begin
  inicializarTablas;
  leerDesarrolladores;
  informarResultados;
end.
