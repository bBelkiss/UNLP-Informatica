{
    11. Realizar un programa para una empresa productora que necesita organizar 100 eventos culturales.
    De cada evento se dispone la siguiente información: nombre del evento, tipo de evento (1: música, 2: cine, 3: obra de teatro, 4: unipersonal y 5: monólogo),
    lugar del evento, cantidad máxima de personas permitidas para el evento y costo de la entrada. Se pide:
1. Generar una estructura con las ventas de entradas para tales eventos culturales. De cada venta se debe guardar: código de venta, número de evento (1..100),
   DNI del comprador y cantidad de entradas adquiridas. La lectura de las ventas finaliza con código de venta -1.
2. Una vez leída y almacenada la información de las ventas, calcular e informar:
    a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
    b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que impares y que sean para el evento de tipo "obra de teatro".
    C. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de personas permitidas.
}

program p7ej11;
const
  totalEventos = 100;
  cantidadTipos = 5;
  cadena = string[30];
type
  rangoTipos = 1..cantidadTipos;
  rangoEventos = 1..totalEventos;
  registroEvento = record
    denominacion: cadena;
    categoria: rangoTipos;
    ubicacion: cadena;
    capacidadMaxima: integer;
    precioEntrada: real;
  end;
  datosVenta = record
    codigoTransaccion: integer;
    numeroEvento: rangoEventos;
    identificacionComprador: longint;
    entradasVendidas: integer;
  end;
  listaVentas = ^nodoVenta;
  nodoVenta = record
    informacion: datosVenta;
    siguiente: listaVentas;
  end;
  arregloEventos = array[rangoEventos] of registroEvento;
procedure ingresarTexto(mensaje: string; var texto: cadena);
begin
  write(mensaje);
  readln(texto);
end;
procedure cargarEventos(var eventos: arregloEventos);
var
  i: integer;
begin
  for i := 1 to totalEventos do
  begin
    writeln('Ingrese datos para el evento ', i);
    ingresarTexto('Nombre del evento: ', eventos[i].denominacion);
    write('Tipo de evento (1-música, 2-cine, 3-obra de teatro, 4-unipersonal, 5-monólogo): ');
    readln(eventos[i].categoria);
    ingresarTexto('Lugar del evento: ', eventos[i].ubicacion);
    write('Capacidad máxima: ');
    readln(eventos[i].capacidadMaxima);
    write('Precio por entrada: ');
    readln(eventos[i].precioEntrada);
  end;
end;
procedure leerVenta(var venta: datosVenta);
begin
  write('Código de venta (-1 para finalizar): ');
  readln(venta.codigoTransaccion);
  if (venta.codigoTransaccion <> -1) then
  begin
    write('Número de evento (1-100): ');
    readln(venta.numeroEvento);
    write('DNI del comprador: ');
    readln(venta.identificacionComprador);
    write('Cantidad de entradas: ');
    readln(venta.entradasVendidas);
  end;
end;
procedure agregarVenta(var lista: listaVentas; venta: datosVenta);
var
  nuevo: listaVentas;
begin
  new(nuevo);
  nuevo^.informacion := venta;
  nuevo^.siguiente := lista;
  lista := nuevo;
end;
procedure generarListaVentas(var lista: listaVentas);
var
  ventaActual: datosVenta;
begin
  lista := nil;
  leerVenta(ventaActual);
  while (ventaActual.codigoTransaccion <> -1) do
  begin
    agregarVenta(lista, ventaActual);
    leerVenta(ventaActual);
  end;
end;
function calcularDigitosPares(numero: longint): integer;
var
  digito, contador: integer;
begin
  contador := 0;
  while (numero <> 0) do
  begin
    digito := numero mod 10;
    if (digito mod 2 = 0) then
      contador := contador + 1;
    numero := numero div 10;
  end;
  calcularDigitosPares := contador;
end;
procedure encontrarMinimos(eventos: arregloEventos; ventas: listaVentas; var min1, min2: integer);
var
  i: integer;
  recaudacion: array[rangoEventos] of real;
begin
  for i := 1 to totalEventos do
    recaudacion[i] := 0;
  while (ventas <> nil) do
  begin
    recaudacion[ventas^.informacion.numeroEvento] := 
      recaudacion[ventas^.informacion.numeroEvento] + 
      (ventas^.informacion.entradasVendidas * eventos[ventas^.informacion.numeroEvento].precioEntrada);
    ventas := ventas^.siguiente;
  end;
  min1 := 1;
  min2 := 2;
  if recaudacion[2] < recaudacion[1] then
  begin
    min1 := 2;
    min2 := 1;
  end;
  for i := 3 to totalEventos do
  begin
    if recaudacion[i] < recaudacion[min1] then
    begin
      min2 := min1;
      min1 := i;
    end
    else if recaudacion[i] < recaudacion[min2] then
    begin
      min2 := i;
    end;
  end;
end;
procedure procesarVentas(eventos: arregloEventos; ventas: listaVentas);
var
  eventoMin1, eventoMin2: integer;
  contadorEntradas: integer;
  entradasEvento50: integer;
  dniPares, dniImpares: integer;
begin
  encontrarMinimos(eventos, ventas, eventoMin1, eventoMin2);
  writeln('Los dos eventos con menor recaudación son:');
  writeln('1. ', eventos[eventoMin1].denominacion, ' en ', eventos[eventoMin1].ubicacion);
  writeln('2. ', eventos[eventoMin2].denominacion, ' en ', eventos[eventoMin2].ubicacion);
  contadorEntradas := 0;
  while (ventas <> nil) do
  begin
    if (eventos[ventas^.informacion.numeroEvento].categoria = 3) then
    begin
      dniPares := calcularDigitosPares(ventas^.informacion.identificacionComprador);
      dniImpares := 8 - dniPares;
      if (dniPares > dniImpares) then
        contadorEntradas := contadorEntradas + ventas^.informacion.entradasVendidas;
    end;
    ventas := ventas^.siguiente;
  end;
  writeln('Entradas vendidas para obras de teatro con DNI de más pares que impares: ', contadorEntradas);
  entradasEvento50 := 0;
  ventas := listaVentas;
  while (ventas <> nil) do
  begin
    if (ventas^.informacion.numeroEvento = 50) then
      entradasEvento50 := entradasEvento50 + ventas^.informacion.entradasVendidas;
    ventas := ventas^.siguiente;
  end;
  if (entradasEvento50 >= eventos[50].capacidadMaxima) then
    writeln('El evento 50 alcanzó su capacidad máxima de ', eventos[50].capacidadMaxima, ' personas.')
  else
    writeln('El evento 50 no alcanzó su capacidad máxima. Vendió ', entradasEvento50, ' de ', eventos[50].capacidadMaxima, ' entradas.');
end;
var
  eventosCulturales: arregloEventos;
  ventasEntradas: listaVentas;
begin
  cargarEventos(eventosCulturales);
  generarListaVentas(ventasEntradas);
  procesarVentas(eventosCulturales, ventasEntradas);
end.