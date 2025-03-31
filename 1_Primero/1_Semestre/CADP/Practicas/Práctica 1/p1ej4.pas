{ Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído) }

program p1ej4;
var
	numX, numAux: real;
Begin
	write('Ingresar un numero real: ');
	readln(numX);
	numAux:= numX * 2;
	while (numX <> numAux) do begin
		write('Ingresar numero: ');
		readln(numX);
	end
end.