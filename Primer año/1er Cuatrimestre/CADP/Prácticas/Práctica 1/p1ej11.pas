{ Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si
se lee la secuencia:
a* . Modifique el programa anterior para que, además de informar el mayor número leído, se
informe el número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se lee la
misma secuencia. }

program p1ej11;
var
	i, num, max, posMax: integer;
Begin
	max:= -1;
	for i:= 1 to 10 do 
    begin
		write('Ingresar un numero: ');
		readln(num);
		if (num > max) then begin
			max:= num;
			posMax:= i;
			end;
	end;
	writeln('El numero mayor leido es: ', max);
	writeln('La posicion del numero maximo es: ', posMax);
end. 