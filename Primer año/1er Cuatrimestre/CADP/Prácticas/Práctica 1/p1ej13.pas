{ Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
los dos números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual no debe procesarse. }

program p1ej13;
var
	i, min1, min2, num: integer;
Begin
	min1:= 9999;
	min2:= 9999;
	for i:= 1 to 1000 do 
    begin
		write('Ingresar un numero: ');
		readln(num);
		if num < min1 then 
        begin
			min2:= min1;
			min1:= num;
		end
		else if num < min2 then 
        begin
			min2:= num;
		end;
	end;
	writeln('El primer mínimo es: ', min1);
	writeln('El segundo mínimo es: ', min2);
end.
	min1:= 9999;
 	min2:= 9999;
 	repeat
		write('Ingresar un numero: ');
		readln(num);
		if num < min1 then 
        begin
			min2:= min1;
			min1:= num;
		end
		else if num < min2 then 
        begin
			min2:= num;
		end;
	end;
	until (num= 0);
	writeln('El primer mínimo es: ', min1);
	writeln('El segundo mínimo es: ', min2);
	min1:= 9999;
 	min2:= 9999;
 	write('Ingresar un numero: ');
 	readln(num);
 	if num < min1 then 
    begin
		min2:= min1;
		min1:= num;
			end
		else if (num < min2) then 
        begin
			min2:= num;
		end;
	while (num <> 0) do 
    begin
	 	write('Ingresar un numero: ');
 	readln(num);
 	if num < min1 then 
    begin
		min2:= min1;
		min1:= num;
			end
		else if (num < min2) then 
        begin
			min2:= num;
		end;
	end;