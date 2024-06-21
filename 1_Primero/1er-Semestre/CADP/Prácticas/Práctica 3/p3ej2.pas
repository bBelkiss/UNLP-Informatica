{ El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los
meses de verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha. }

program Ej2;
type
	rangoDias = 1..31;
	rangoMes = 1..12;
	casamientos = record
		dia: rangoDias;
		mes: rangoMes;
		ano: integer;
		end;
procedure cargarFecha (var fechas: casamientos);
begin
	write('Ingresar dia: ');
	readln(fechas.dia);
	write('Ingresar mes: ');
	readln(fechas.mes);
	write('Ingresar año: ');
	readln(fechas.ano);
end;
var
	c: casamientos;
	r2019, rVerano, r10Dias: integer;
Begin
	r2019:= 0;
	rVerano:= 0;
	r10Dias:= 0;
	cargarFecha(c);
	while (c.ano <> 2020) do begin
		if (c.ano = 2019) then
			r2019:= r2019 + 1;
		case c.mes of
			1..3: rVerano := rVerano+1;
		else
		end;
		if (c.dia < 11) then
			r10Dias := r10Dias + 1;
		cargarFecha(c);
	end;
	writeln('La cantidad de casamientos en 2019 es: ',r2019);
	writeln('La cantidad de casamientos en verano es: ',rVerano);
	writeln('La cantidad de casamientos hecha en los primeros 10 dias de cada mes es: ',r10Dias);
end.