{ Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.}

program Ej4;
Type
	clientes= record
		codCliente: integer;
		cantLineas: integer;
		numTelefono: integer;
		minConsumidos: real;
		MBConsumidos: real;
	end;
function facturar (minutos, mbs: real): real;
begin
	facturar := (minutos*3.4) + (mbs*1.35);
end;
procedure leerLinea (var cli: clientes);
begin
	write('Ingresar numero de telefono: ');
	readln(cli.numTelefono);
	write('Ingresar minutos consumidos de la linea: ');
	readln(cli.minConsumidos);
	write('Ingresar MB consumidos de la linea: ');
	readln(cli.MBConsumidos);
end;
procedure leerClientes (var cli: clientes);
var
	minTotal, mbTotal: real;
	i: integer;
begin
	minTotal:= 0;
	mbTotal:= 0;
	write('Ingresar codigo de cliente: ');
	readln(cli.codCliente);
	write('Ingresar cantidad de lineas: ');
	readln(cli.cantLineas);
	for i:= 1 to cli.cantLineas do begin
		leerLinea(cli);
		minTotal:= minTotal +  cli.minConsumidos;
		mbTotal:= mbTotal + cli.MBConsumidos;
	end;
	cli.minConsumidos:= minTotal;
	cli.MBConsumidos:= mbTotal;
end;
var
	montoAPagar: real;
	registro: clientes;
	i: integer;
Begin
	for i := 1 to 3 do begin
		leerClientes(registro);
		montoAPagar:= facturar(registro.minConsumidos, registro.MBConsumidos);
		writeln('La cantidad de minutos totales es ',registro.minConsumidos:0:0,' junto con ',registro.MBConsumidos:0:2,' mbs consumidos. El total a pagar es: $',montoAPagar:0:2);
	end;
end.
