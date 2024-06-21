{ Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos. }

program p1ej14;
var
	max, min, suma, num: integer;
Begin
	max:= -1;
	min:= 9999;
	suma:= 0;
	repeat
		write('Ingresar un numero: ');
		readln(num);
		suma:= suma + num;
		if num < min then
			min:= num
			else if num > max then
				max := num
	until (num = 100);
	writeln('El numero maximo es: ', max, ' y el minimo es: ', min);
end.
