// Resolución de Franja Morada

program parcialT2;
const
	dimF= 130;
Type
repuesto= record
	cod: integer;
	precio: real;
	codMarca: 1..dimF;
	paisProv: string;
end;
lista= ^nodo;
nodo= record
	dato: repuesto;
	sig: lista;
end;
marcas= record
	cod: integer;
	nombre: string;
end;
marcasTrabaja= Array[1..dimF]of marcas;
productos= record
	nombre: string;
	precio: real;
end;
marcasMinimas= Array[1..dimF]of productos;
procedure cargarListaRepuestos(var L: lista);
// se dispone
procedure leerMarca(var m: marcas);
begin
	write('Codigo: ');
	readln(m.cod);
	write('Nombre: ');
	readln(m.nombre);
end;
procedure cargarMarcas(var ve: marcasTrabaja);
var
	i: integer;
	m: marcas;
begin
	for i:= 1 to dimF do begin
		leerMarca(m);
		v[i]:= m;
	end;
end;
procedure inicializar(vec: marcasTrabaja;var ve:marcasMinimas);
var
	i: integer;
begin
	for i:= 1 to dimF
		ve[i].nombre:= vec[i].nombre;
		ve[i].precio:= 9999;
end;
procedure imprimir(ve: marcasMinimas);
var
	i:integer;
begin
	for i:= 1 to dimF do begin
		writeln('Marca: ',ve[i].nombre,' producto mas barato: ',ve[i].precio);
	end;
end;
procedure verificarMinimo(unPrecio: real; var min: real);
begin
	if(unPrecio < min)then
		min:= unPrecio;
end;
function descomponer(unNum: integer): boolean;
var
	dig, cont0: integer;
begin
	cont0:= 0;
	while(unNum <> 0)AND(cont0= 0)do begin
		dig:= unNum MOD 10;
		if(dig = 0)then
			cont0:= cont0 +1;
		unNum:= unNum DIV 10;
	end;
	descomponer:= cont0 = 0;
end;
procedure recorrerRepuestos(L: lista; maT: marcasTrabaja; var veMin: marcasMinimas);
var
	cont100r, contAux, contSinCeros: integer;
	paisAux: string;
	cumple:= boolean;
begin
	inicializar(maT, veMin);
	cont100r:= 0;
	contSinCeros:= 0;
	while(L <> nil)do begin
		paisAux:= L^.dato.paisProv;
		contAux:= 0;
		while(L <> nil)AND(L^.dato.paisProv = paisAux)do begin
			contAux:= contAux +1;
			verificarMinimo(L^.dato.precio,veMin[L^.dato.codMarca].precio);
			if(descomponer(L^.dato.cod))then
				contSinCeros:= contSinCeros +1;
			L:= L^.sig;
		end;
		if(contAux > 100)then	// si compro mas de 100, sumo
			cont100r:= cont100r +1;
	end;
	imprimir(veMin);	// imprimi todas las maracas y sus minimos
	writeln('Cantidad de paises que compraron mas de 100 repuestos: ',cont100r);
	writeln('Cantidad de repuestos que no poseen 0 en sus codigos: ',contSinCeros);
end;
var
	listaRepuestos: lista;
	vec: marcasTrabaja;
Begin
	listaRepuestos:= nil;
	cargarListaRepuestos(listaRepuestos);	// se dispone
	cargarMarcas(vec);
	recorrerRepuestos(listaRepuestos, vec);
end.