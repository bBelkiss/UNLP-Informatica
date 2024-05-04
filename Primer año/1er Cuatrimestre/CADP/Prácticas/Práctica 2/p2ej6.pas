{ A - Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
B - Implemente un programa que invoque al módulo del inciso a. }

// A - 
program p2e4;
function Max: integer;				
var
	num: integer;
begin
	Max:= -1;
	write('Ingresar un valor: ');
	readln(num);
	if num MOD 2 = 0 > Max then
		if num > Max then
			Max:= num;
	while (num > 0)do begin
		write('Ingresar un valor: ');
		readln(num);
		if num MOD 2 = 0 > Max then
			if num > Max then
				Max:= num;
	end;
end;
var
	maxx: integer;
// B -
Begin
	maxx:= Max;
	writeln('El numero maximo es ',maxx);
end.