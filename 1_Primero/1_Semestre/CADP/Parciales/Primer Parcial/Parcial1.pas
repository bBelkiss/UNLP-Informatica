// Resolución de Franja Morada 

program parcialT1;
const
	dimP= 200;
Type
prov= Array[1..dimP] of string;
repuesto= record
	cod: integer;
	precio: real;
	codPais: integer;
end;
lista= ^nodo;
nodo= record
	dato: repuesto;
	sig: lista;
end;
repAux= record
	cantTotal: integer;
	nombrePais: string;
	max: real;
end;
infoPais= Array[1..dimP]of repAux;
procedure cargarVec(var ve: prov);
// se dispone
procedure leerRep(var r: repuesto);
begin
	write('Codigo: ');
	readln(r.cod);
	if(r.cod <> -1)then begin
		write('Precio: ');
		readln(r.precio);
		write('Codigo del pais prov: ');
		readln(r.codPais);
	end;
end;
procedure agregarAdelante(var L: lista; r: repuesto);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= r;
	nue^.sig:= L;
	L:= nue;
end;
procedure armarLista(var L: lista);
var
	r: repuesto;
begin
	leerRep(r);
	while(r.cod <> -1)do begin
		agregarAdelante(L, r);
		leerRep(r);
	end;
end;
procedure inicializar(ve: prov; var vect: infoPais);
var
	i: integer;
begin
	for i:= 1 to dimP do begin
		vect[i].cantTotal:= 0;
		vect[i].nombrePais:= ve[i];
		vect[i].max:= -1;
	end;
end;
procedure verificarMaximo(unValor: real; var max: real);
begin
	if(unValor > max)then
		max:= unValor;
end;
function descomponer(unCod: integer):boolean;
var
	cont, dig: integer;
begin
	cont:= 0;
	while(unCod <> 0)AND(cont < 3)do begin
		dig:= unCod MOD 10;
		if(dig = 0)then
			cont:= cont +1;
		unCod:= unCod DIV 10;
	end;
	descomponer:= cont >= 3;
end;
procedure informar(ve: infoPais; unProm: real);
var
	i, cantMenor: integer;
begin
	cantMenor:= 0;
	for i:= 1 to dimP do begin
		if(ve[i].cantTotal < unProm)then
			cantMenor:= cantMenor +1;
		writeln('Pais: ',ve[i].nombrePais,' precio mas caro: ',ve[i].max);	// inciso 2
	end;
	writeln('Cantidad de paises que sus compras son menor al promedio: ',cantMenor);	// inciso 1
end;
procedure recorrer(L: lista; ve: prov);
var
	maxPais: infoPais;
	comprasTotal, alMenos3: integer;
	prom: real;
begin
	inicializar(maxPais);
	comprasTotal:= 0;
	alMenos3:= 0;
	while(L <> nil)do begin
		comprasTotal:= +1;
		maxPais[L^.dato.codPais].cantTotal:= maxPais[L^.dato.codPais].cantTotal +1;
		verificarMaximo(L^.dato.precio, maxPais[L^.dato.codPais].max);
		if(descomponer(L^.dato.cod))then
			alMenos3:= alMenos3 +1;
		L:= L^.sig;
	end;
	prom:= comprasTotal / dimP;	// calcula promedio comprados por todos los paises
	informar(maxPais, prom);	// informa 1 y 2
	writeln('Cantidad de repuestos con al menos 3 cero en sus codigos: ',alMenos3);	// inciso 3
end;
var
	info: prov;
	rep: lista;
Begin
	rep:= nil;
	cargarVec(info);	// se dispone
	armarLista(rep);	// carga hasta ingresar cod -1
	recorrer(rep, info);	// calcula todo
end.