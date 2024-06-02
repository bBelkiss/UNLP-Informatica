{ Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
* Al finalizar la lectura, informar:
a. La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2).
b. La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar
1).
c. El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
menor al valor 2500 (en el ejemplo anterior se debería informar 0%) }

program p1ej6;
var
	legajo, cantLeida, cantSup65, cantSup85: integer;
	promedio: real;
Begin
	cantSup65:= 0;
	cantSup85:= 0;
	cantLeida:= 0;
	write('Ingresar un numero de legajo: ');
	readln(legajo);
	while (legajo <> -1) do begin
		write('Ingresar un promedio: ');
		readln(promedio);
		cantLeida:= cantLeida+1;
		if (promedio > 6.5) then
			cantSup65:= cantSup65 +1;
		if (legajo < 2500) then begin
			if (promedio > 8.5)then
				cantSup85:= cantSup85 +1;
		end;
		write('Ingresar legajo: ');
		readln(legajo);
	end;
	writeln('Cantidad de alumnos leidos: ',cantLeida);	//Inciso a
	writeln('Cantidad de alumnos con promedio mayor a 6.5: ',cantSup65);	//Inciso b
	writeln('Porcentaje de alumnos destacados %',cantSup85*100/cantLeida:0:0);	//Inciso c
end.