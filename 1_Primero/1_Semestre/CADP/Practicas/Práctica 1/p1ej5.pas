{ Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X” }

program p1ej5;
var
	numX, numAux: real;
	intentos: integer;
Begin
	write('Ingresar un numero real: ');
	readln(numX);
	numAux:= numX *2;
	intentos:= 0;
	while (numX <> numAux)AND (intentos < 10) do begin
		intentos:= intentos+1;
		write('Ingresar numero: ');
		readln(numX);
	end;
	if (intentos = 10)AND (numX <> numAux) then
		writeln('No se ha ingresado el doble de X')
end.