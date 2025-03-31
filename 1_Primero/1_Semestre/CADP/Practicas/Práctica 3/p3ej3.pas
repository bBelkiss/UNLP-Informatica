{ El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes) }

program Ej3;
Type
	escuelas= record
		CUE: integer;
		establecimiento: String;
		cantDocentes: integer;
		cantAlumnos: integer;
		localidad: String;
	end;
procedure leerEscuelas (var esc: escuelas);
begin
	write('Ingresar codigo unico de establecimiento: ');
	readln(esc.CUE);
	write('Ingresar nombre del establecimiento: ');
	readln(esc.establecimiento);
	write('Ingresar cantidad de docentes: ');
	readln(esc.cantDocentes);
	write('Ingresar cantidad de alumnos: ');
	readln(esc.cantAlumnos);
	write('Ingresar localidad de establecimiento: ');
	readln(esc.localidad);
end;
function calcularProporcion (docentes, alumnos:integer):real;
begin
	calcularProporcion := alumnos DIV docentes;
end;
var
	esc: escuelas;
	supUNESCO, CUEmax1, CUEmax2, i: integer;
	docentesAlumnos, max1, max2: real;
	estMax1, estMax2: String;
Begin
	supUNESCO := 0;
	max1 := -1;
	max2 := -1;
	for i:= 1 to 2400 do begin
		leerEscuelas(esc);
		docentesAlumnos:=calcularProporcion(esc.cantDocentes, esc.cantAlumnos);
		if (esc.localidad = 'La Plata') AND (docentesAlumnos > 23.435) then
			supUNESCO:= supUNESCO+1;
		if (docentesAlumnos > max1) then begin
			max2:= max1;
			CUEmax2:= CUEmax1;
			estMax2:= estMax1;
			max1:= docentesAlumnos;
			CUEmax1:= esc.CUE;
			estMax1:= esc.establecimiento;
		end
		else if (docentesAlumnos > max2) then begin
			max2:= docentesAlumnos;
			CUEmax2:= esc.CUE;
			estMax2:= esc.establecimiento;
		end;
	end;
	writeln('La cantidad de escuelas de La Plata que superan a UNESCO son: ',supUNESCO);
	writeln('El mejor promedio es ',estMax1,' CUE: ',CUEmax1,' seguido de ',estMax2,' CUE: ',CUEmax2);
end.