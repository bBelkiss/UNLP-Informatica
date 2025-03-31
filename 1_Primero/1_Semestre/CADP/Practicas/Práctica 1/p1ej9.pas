{ Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro
carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse
una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída
con la secuencia de números, e imprimir el resultado final. }

program p1ej9;
var
	op: String;
	num, result: integer;
Begin
	write('Ingresar un caracter: ');
	readln(op);
	result:= 0;
	if (op = '+') OR (op = '-')then begin
		if (op = '+')then begin
			write('Ingresar un numero: ');
			readln(num);
			while (num <> 0) do 
            begin
				result:= result + num;
				write('Ingresar un numero: ');
				readln(num);
			end;
			end
		else begin
			write('Ingresar un numero: ');
			readln(num);
			while (num <> 0) do begin
				result:= result - num;
				write('Ingresar un numero: ');
				readln(num);
			end;
		end;
	writeln('El resultado de la opracion es: ',result);
	end
	else
		writeln('opracion no valida.');
end.
