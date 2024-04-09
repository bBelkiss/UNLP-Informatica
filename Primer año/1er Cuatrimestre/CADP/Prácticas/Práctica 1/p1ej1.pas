{ Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos
son iguales” }

program p1ej1;
var
	num1, num2: integer;
Begin
	write('Ingresar un valor de numero: ');
	readln(num1);
	write('Ingresar otro valor: ');
	readln(num2);
	if (num1 < num2)then
		writeln('El numero mayor es ', num2)
		else
		if (num1 = num2)then
			writeln('Los numeros leidos son iguales')
			else
				writeln('El numero mayor es ', num1);
end.