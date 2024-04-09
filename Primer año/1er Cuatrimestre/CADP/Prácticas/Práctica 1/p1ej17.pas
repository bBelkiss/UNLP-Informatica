{ Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor
cantidad de ventas. }

program p1ej17;
var
	i, ventas, maxVentas: integer;
	monto, mTotal: real;
Begin
	maxVentas:= -1;
	mTotal:= 0;
	for i:= 1 to 31 do 
    begin
		ventas:= 0;
		write('Ingresar monto: ');
		readln(monto);
		while (monto <> 0) do 
        begin
			mTotal:= mTotal + monto;
			ventas:= ventas +1;
			write('Ingresar otro monto: ');
			readln(monto);
		end;
		if (ventas > maxVentas) then
			maxVentas:= i;
		writeln('La cantidad de ventas en el dia fue: ', ventas);
	end;
	writeln('El monto total de ventas es: ', mTotal);
	writeln('El dia con mas ventas fue el dia: ', maxVentas);
end.