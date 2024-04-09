{ Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota. }

program p1ej12;
var 
	nombre: String;
	nota, may8, siete: integer;
Begin
	may8:= 0;
	siete:= 0;
	repeat
		write('Ingresar apellido y nombre: ');
		readln(nombre);
		write('Ingresar nota: ');
		readln(nota);
		if (nota > 8) then
			may8:= may8 + 1;
		if (nota = 7) then
			siete:= siete + 1;
	until (nombre = 'Zidane Zinedine');
	writeln('Cantidad de alumnos aprobados mayor a 8: ', may8);
	writeln('Cantidad de alumnos con 7: ', siete);
end.