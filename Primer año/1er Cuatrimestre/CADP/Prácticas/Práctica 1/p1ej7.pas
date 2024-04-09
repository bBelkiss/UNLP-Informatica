{ Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un
almacén. La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse.
Para cada producto leído, el programa deberá indicar si el nuevo precio del producto supera en un
10% al precio anterior
 Por ejemplo:
○ Si se ingresa el código 10382, con precio actual 40, y nuevo precio 44, deberá imprimir: “el
aumento de precio del producto 10382 no supera el 10%”
○ Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir: “el
aumento de precio del producto 32767 es superior al 10%” }

program p1ej7;
var
	pActual, pNuevo: real;
	cod: integer;
Begin
	write('Ingresar codigo: ');
	readln(cod);
	write('Ingresar precio actual: $');
	readln(pActual);
	write('Ingresar precio nuevo: $');
	readln(pNuevo);
	if (pNuevo >= pActual*0.1 + pActual)then
		writeln('El precio del producto ',cod,' supera el 10%')
		else
			writeln('El precio del producto ',cod,' no supera el 10%');
	while (cod <> 32767)do begin
			write('Ingresar codigo: ');
		readln(cod);
		write('Ingresar precio actual: $');
		readln(pActual);
		write('Ingresar precio nuevo: $');
		readln(pNuevo);
		if (pNuevo >= pActual*0.1 + pActual)then
			writeln('El precio del producto ',cod,' supera el 10%')
		else
			writeln('El precio del producto ',cod,' no supera el 10%');
	end;
end.