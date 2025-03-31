{ Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}

program p1ej16;
var
	nombre, primerPiloto, segundoPiloto, ultimoPiloto, penultimoPiloto: string;
	primerTiempo, segundoTiempo, ultimoTiempo, penultimoTiempo, tiempo: real;
	i: integer;
begin
	primerPiloto := '';
	segundoPiloto := '';
	ultimoPiloto := '';
	penultimoPiloto := '';
	primerTiempo := 9999;
	segundoTiempo := 9999;
	ultimoTiempo := -1;
	penultimoTiempo := -1;
	for i := 1 to 100 do begin
    write('Ingrese el nombre del piloto del auto ', i, ': ');
    readln(nombre);
    write('Ingrese el tiempo total de la carrera del auto ', i, ': ');
    readln(tiempo);
    if tiempo < primerTiempo then 
    begin
		segundoTiempo := primerTiempo;
		segundoPiloto := primerPiloto;
		primerTiempo := tiempo;
		primerPiloto := nombre;
    end
		else if tiempo < segundoTiempo then 
        begin
			segundoTiempo := tiempo;
			segundoPiloto := nombre;
		end;
		if tiempo > ultimoTiempo then 
        begin
			penultimoTiempo := ultimoTiempo;
			penultimoPiloto := ultimoPiloto;
			ultimoTiempo := tiempo;
			ultimoPiloto := nombre;
		end
		else if tiempo > penultimoTiempo then 
        begin
			penultimoTiempo := tiempo;
			penultimoPiloto := nombre;
		end;
	end;
	writeln('Los dos pilotos que finalizaron en los dos primeros puestos son: ');
	writeln('1. ', primerPiloto);
	writeln('2. ', segundoPiloto);
	writeln('Los dos pilotos que finalizaron en los dos últimos puestos son: ');
	writeln('99. ', penultimoPiloto);
	writeln('100. ', ultimoPiloto);
end.
