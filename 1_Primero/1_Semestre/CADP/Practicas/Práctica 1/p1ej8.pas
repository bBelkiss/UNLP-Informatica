{ Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
uno de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal” }

program p1ej8;
var
	i, son3: integer;
	letra1: char;
Begin
	son3:= 0;
	i:= 0;
	write('Ingresar una letra: ');
	readln(letra1);
	i:= i + 1;
	if (letra1 = 'a') OR (letra1 = 'e') OR (letra1 = 'i') OR (letra1 = 'o') OR (letra1 = 'u') then 
		son3:= son3 + 1;
	while (i < 3) do 
    begin
		write('Ingresar otra letra: ');
		readln(letra1);
		i:= i+1;
		if (letra1 = 'a') OR (letra1 = 'e') OR (letra1 = 'i') OR (letra1 = 'o') OR (letra1 = 'u') then
			son3:= son3 + 1;
	end;
	if (son3 = 3) then
		writeln('Las tres letras son vocales.')
	else
		writeln('Las tres letras no son vocales.');
end.