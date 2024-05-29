{ Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5. }

program p1ej10;
var
	i, num, suma, may5: integer;
Begin
	suma:= 0;
	may5:= 0;
	for i:= 1 to 10 do 
    begin
		write('Ingresar un valor: ');
		readln(num);
		if (num > 5) then
			may5:= may5 + 1;
		suma:= suma + num;
	end;
	writeln('La suma total de numeros leidos es: ', suma);
	writeln('La cantidad de mayores a 5 es: ', may5);
end.