{
    
    10. Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que les
    provee sus productos. De cada empresa se conoce su código, nombre, si es estatal o privada, nombre de la ciudad donde está radicada y los cultivos que realiza (a lo sumo 20).
    Para cada cultivo de la empresa se registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas dedicadas y la cantidad de meses que lleva el ciclo de cultivo.
    a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información se ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse).
       Para cada empresa se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no debe procesarse).
    Una vez leída y almacenada la información, calcular e informar:
    b. Nombres de las empresas radicadas en "San Miguel del Monte" que cultivan trigo y cuyo código de empresa posee al menos dos ceros.
    C. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto al total de hectáreas.
    d. La empresa que dedica más tiempo al cultivo de maíz
    e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5 hectáreas de todas las empresas que no son estatales.
}

program p7ej10;
const
  maxCultivos = 20;
  cantidadTipos = 4;
  cadena = string[30];
type
  rangoMeses = 1..12;
  indiceTipos = 1..cantidadTipos;
  rangoCultivos = 1..maxCultivos;
  punteroEmpresas = ^registroEmpresa;
  datosCultivo = record
    variedad: cadena;
    extension: real;
    duracion: integer;
  end;
  arregloCultivos = array[rangoCultivos] of datosCultivo;
  infoCultivos = record
    plantaciones: arregloCultivos;
    total: integer;
  end;
  datosEmpresa = record
    identificador: integer;
    razonSocial: cadena;
    esPublica: boolean;
    localidad: cadena;
    produccion: infoCultivos;
  end;
  registroEmpresa = record
    contenido: datosEmpresa;
    siguiente: punteroEmpresas;
  end;
  catalogoVariedades = array[indiceTipos] of cadena;
procedure inicializarCatalogo(var lista: catalogoVariedades);
begin
  lista[1] := 'trigo';
  lista[2] := 'maiz';
  lista[3] := 'soja';
  lista[4] := 'girasol';
end;
procedure ingresarTexto(leyenda: string; var texto: cadena);
begin
  write(leyenda);
  readln(texto);
end;
procedure leerCultivos(var cultivo: datosCultivo; lista: catalogoVariedades);
begin
  with cultivo do begin
    write('Superficie cultivada (0 para finalizar): ');
    readln(extension);
    if(extension <> 0) then begin
      writeln('Opciones disponibles:');
      writeln('1. trigo');
      writeln('2. maiz');
      writeln('3. soja');
      writeln('4. girasol');
      write('Elija tipo de cultivo (1-4): ');
      readln(variedad);
      write('Periodo de crecimiento en meses (1-12): ');
      readln(duracion);
    end;
  end;
end;
procedure registrarCultivos(var cultivos: infoCultivos; lista: catalogoVariedades);
var
  cultivoActual: datosCultivo;
begin
  cultivos.total := 0;
  leerCultivos(cultivoActual, lista);
  while (cultivos.total < maxCultivos) and (cultivoActual.extension <> 0) do begin
    cultivos.total := cultivos.total + 1;
    cultivos.plantaciones[cultivos.total] := cultivoActual;
    leerCultivos(cultivoActual, lista);
  end;
end;
procedure leerDatosEmpresa(var empresa: datosEmpresa; lista: catalogoVariedades);
var
  opcion: integer;
begin
  with empresa do begin
    write('Codigo de identificacion (-1 para salir): ');
    readln(identificador);
    if (identificador <> -1) then begin
      ingresarTexto('Denominacion comercial: ', razonSocial);
      write('Empresa publica? (1-Si, 0-No): ');
      readln(opcion);
      esPublica := (opcion = 1);
      ingresarTexto('Municipio de ubicacion: ', localidad);
      registrarCultivos(produccion, lista);
    end;
  end;
end;
procedure agregarEmpresa(var lista: punteroEmpresas; empresa: datosEmpresa);
var
  nuevoNodo: punteroEmpresas;
begin
  new(nuevoNodo);
  nuevoNodo^.contenido := empresa;
  nuevoNodo^.siguiente := lista;
  lista := nuevoNodo;
end;
procedure crearListaEmpresas(var lista: punteroEmpresas; catalogo: catalogoVariedades);
var
  empresaActual: datosEmpresa;
begin
  leerDatosEmpresa(empresaActual, catalogo);
  while (empresaActual.identificador <> -1) do begin
    agregarEmpresa(lista, empresaActual);
    leerDatosEmpresa(empresaActual, catalogo);
  end;
end;
procedure ajustarCiclo(var plantacion: datosCultivo; esPublica: boolean);
begin
  if (plantacion.variedad = 'girasol') and not(esPublica) and (plantacion.extension < 5) then
    plantacion.duracion := plantacion.duracion + 1;
end;
procedure analizarProduccion(var cultivos: infoCultivos; tipoEmpresa: boolean; var hectareasSoja, superficieTotal: real; var tiempoMaiz: integer; var tieneTrigo: boolean);
var
  i: rangoCultivos;
begin
  for i := 1 to cultivos.total do begin
    if (cultivos.plantaciones[i].variedad = 'trigo') then
      tieneTrigo := true
    else if (cultivos.plantaciones[i].variedad = 'soja') then
      hectareasSoja := hectareasSoja + cultivos.plantaciones[i].extension
    else if (cultivos.plantaciones[i].variedad = 'maiz') then
      tiempoMaiz := tiempoMaiz + cultivos.plantaciones[i].duracion;
      
    superficieTotal := superficieTotal + cultivos.plantaciones[i].extension;
    ajustarCiclo(cultivos.plantaciones[i], tipoEmpresa);
  end;
end;
procedure determinarMaximo(nombreEmpresa: cadena; tiempo: integer; var maximo: integer; var empresaDestacada: cadena);
begin
  if (tiempo > maximo) then begin
    maximo := tiempo;
    empresaDestacada := nombreEmpresa;
  end;
end;
function verificarCodigo(codigo: integer): boolean;
var
  digito, contadorCeros: integer;
begin
  contadorCeros := 0;
  while (codigo <> 0) and (contadorCeros < 2) do begin
    digito := codigo mod 10;
    if (digito = 0) then
      contadorCeros := contadorCeros + 1;
    codigo := codigo div 10;
  end;
  verificarCodigo := (contadorCeros = 2);
end;
function cumpleCriterios(ciudad: cadena; cultivaTrigo: boolean; codigo: integer): boolean;
begin
  cumpleCriterios := ((ciudad = 'san miguel del monte') and (cultivaTrigo) and (verificarCodigo(codigo)));
end;
procedure procesarInformacion(lista: punteroEmpresas);
var
  diasMaiz, recordMaiz: integer;
  areaSoja, areaGeneral, porcentaj: real;
  hayTrigo: boolean;
  liderMaiz: cadena;
begin
  areaSoja := 0;
  areaGeneral := 0;
  porcentaj := 0;
  recordMaiz := -1;
  liderMaiz := '';
  while (lista <> nil) do begin
    diasMaiz := 0;
    hayTrigo := false;
    analizarProduccion(lista^.contenido.produccion, lista^.contenido.esPublica, areaSoja, areaGeneral, diasMaiz, hayTrigo);
    if (cumpleCriterios(lista^.contenido.localidad, hayTrigo, lista^.contenido.identificador)) then
      writeln('La empresa ', lista^.contenido.razonSocial, ' ubicada en San Miguel del Monte, produce trigo y su codigo contiene al menos dos ceros.');
    determinarMaximo(lista^.contenido.razonSocial, diasMaiz, recordMaiz, liderMaiz);
    lista := lista^.siguiente;
  end;
  if (areaGeneral > 0) then
    porcentaj := (areaSoja * 100) / areaGeneral;
  writeln(areaSoja:0:0, ' hectareas dedicadas a soja. Representan el ', porcentaj:0:2, '% de la superficie total cultivada.');
  if (recordMaiz <> -1) then
    writeln('La empresa ', liderMaiz, ' destina mas tiempo al cultivo de maiz.')
  else
    writeln('Ninguna empresa reporto cultivos de maiz.');
end;
var
  inicioLista: punteroEmpresas;
  variedades: catalogoVariedades;
begin
  inicioLista := nil;
  inicializarCatalogo(variedades);
  crearListaEmpresas(inicioLista, variedades);
  procesarInformacion(inicioLista);
end.