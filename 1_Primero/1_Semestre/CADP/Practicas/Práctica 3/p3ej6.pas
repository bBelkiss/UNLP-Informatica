{ Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente
información de los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom,
Centrino, etc.), cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y
tamaño en nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores
se lee de forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores
(que no debe procesarse). Se pide implementar un programa que lea información de los microprocesadores
de la empresa importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen
velocidades de al menos 2 Ghz. }

program Ej6;
type
	microproc = record
		marca : string;
		linea : string;
		nucleo : integer;
		vel_reloj : integer;
		tam_trans : integer;
	end;
	procedure leermicros(var mic: microproc);
	begin
		write('Ingrese marca: ');
		readln(mic.marca);
		write('Ingrese linea: ');
		readln(mic.linea);
		write('Ingrese cantidad de nucleos: ');
		readln(mic.nucleo);
		write('Ingrese velocidad del reloj: ');
		readln(mic.vel_reloj);
		write('Ingrese tamaño de los transistores: ');
		readln(mic.tam_trans);
		end;
	var 
		micros: microproc;
		cantMicroMax1, cantMicroMax2, cantMicros, cantMulticoreIAMD: integer;
		marcaMax1, marcaMax2: string;
	begin
		cantMulticoreIAMD:= 0;
		cantMicroMax1:= -1;
		cantMicroMax2:= -1;
		leermicros(micros);
	while(micros.nucleo <> 0) do begin
		if ((micros.marca = 'Intel') OR (micros.marca = 'AMD')) AND (micros.nucleo > 1) AND (micros.vel_reloj >= 2) then
			cantMulticoreIAMD:= cantMulticoreIAMD + 1;
		cantMicros:= 0;
		if (micros.nucleo > 2) AND (micros.tam_trans > 22) then
			writeln('Marca: ',micros.marca,' Linea: ',micros.linea,' tiene mas de 2 cores con transitores mayor a 22nm');
		if (micros.tam_trans = 14) then
			cantMicros:= micros.nucleo;
		if (cantMicros > cantMicroMax1) then begin
			cantMicroMax2:= cantMicroMax1;
			marcaMax2:= marcaMax1;
			cantMicroMax1:= cantMicros;
			marcaMax1:= micros.marca;
		end
		else if (cantMicros > cantMicroMax2) then begin
			cantMicroMax2 := cantMicros;
			marcaMax2 := micros.marca;
		end;
		leermicros(micros);
		end;
	writeln('La marca con mayor cantidad de procesadores de 14nm es ',marcaMax1,' seguida por ',marcaMax2);
	writeln('La cantidad de procesadores multicore de intel amd es: ',cantMulticoreIAMD);
	end.