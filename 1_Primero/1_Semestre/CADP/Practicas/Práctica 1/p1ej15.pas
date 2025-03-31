{ Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par. }

program p1ej15;
var
	min1, min2, cod, i, mas16: integer;
	precio: real;
Begin
	mas16:= 0;
	min1:= 9999;
	min2:= 9999;
	for i:= 1 to 200 do 
    begin
		write('Ingresar codigo del producto: ');
		readln(cod);
		write('Ingresar precio: ');
		readln(precio);
		if (precio > 16) and (cod MOD 2 = 0) then
			mas16:= mas16+1;
		if precio < min1 then 
        begin
			min2:= min1;
			min1:= cod;
		end
		else if precio < min2 then 
        begin
			min2:= cod;
		end;
	end;
	writeln('El codigo del producto mas barato es: ', min1);
	writeln('El codigo del segundo producto mas barato es: ', min2);
	writeln('La cantidad de productos de mas de 16 pesos y codigo par son: ', mas16);
end.