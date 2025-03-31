{ Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se
lee: marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro. }

program Ej5;
Type
	autos=record
		marca: String;
		modelo: String;
		precio: real;
	end;
procedure leerAutos (var a: autos);
begin
	write('Ingrese marca: ');
	readln(a.marca);
	write('Ingrese modelo: ');
	readln(a.modelo);
	write('Ingrese precio: ');
	readln(a.precio);
end;
function calcPromedio (precioTotal: real; cantAutos:integer):real;
begin
	calcPromedio:= precioTotal / cantAutos;
end;
var
	Auto: autos;
	auxMarca, marcaMax, modeloMax: String;
	cantMarca: integer;
	promedio, pTotal, max: real;
Begin
	max:= -1;
	pTotal:= 0;
	cantMarca:= 0;
	leerAutos(Auto);
	auxMarca:= Auto.marca;
	while (Auto.marca <> 'ZZZ') do begin
		if (Auto.marca = auxMarca) then begin
			cantMarca:= cantMarca + 1;
			pTotal := pTotal + Auto.precio;
			end
			else begin 
                promedio:= calcPromedio(pTotal, cantMarca);
                writeln('El precio promedio de la marca ', auxMarca,' es: $', promedio:0:2);
                auxMarca:= Auto.marca;
                pTotal:= Auto.precio;
                cantMarca:= 1;
			end;
		if (Auto.precio > max) then begin
			max := Auto.precio;
			marcaMax := Auto.marca;
			modeloMax := Auto.modelo;
		end;
		leerAutos(Auto);
	end;
	writeln('El auto mas caro es: ',marcaMax,' ',modeloMax);
end.