{ Dado el siguiente programa: }

program p2ej8;
procedure leer;
var
    letra : char;
function analizarLetra : boolean
begin
if (letra >= ‘a’) and (letra <= ‘z’) then
    analizarLetra := true;
else
if (letra >= ‘A’) and (letra <= ‘Z’) then
    analizarletra := false;
end;
begin
    readln(letra);
    if (analizarLetra) then
        writeln(‘Se trata de una minúscula’)
    else
        writeln(‘Se trata de una mayúscula’);
end;
var
    ok : boolean;
begin 
    leer;
    ok := analizarLetra;
    if ok then
        writeln(‘Gracias, vuelva pronto’);
end

{ a) La función analizarLetra fue declarada como un submódulo dentro del procedimiento leer. Pero esto
puede traer problemas en el código del programa principal.
    i) ¿qué clase de problema encuentra?
    ii) ¿cómo se puede resolver el problema para que el programa compile y funcione correctamente?
b) La función analizarLetra parece incompleta, ya que no cubre algunos valores posibles de la variable letra.
    i) ¿De qué valores se trata?
    ii) ¿Qué sucede en nuestro programa si se ingresa uno de estos valores?
    iii) ¿Cómo se puede resolver este problema?

a) El principal problema es de sintaxis. Se debe declarar primero la funcion que quiere usarse dentro del proceso. Al momento de querer utilizar variables no se encuentran declaradas ni leidas, se causa un error mucho antes de poder ejecutar.
ii) Debe ordenarse la declaracion. Primero declarar la funcion, junto con todas las funciones y lectura de valores que analizara, luego declarar el proceso en el que se declara un boolean que guardara el valor de la funcion segun la letra que lea.

b)
i) Se trata de los caracteres que no se encuentran entre la a y la z ni en la A y la Z, tales como "·!$%&/-#@ etc.
ii) Por el else el valor de la boolean queda en falso suponiendo que todo el codigo llega a la linea final, no imprimiria nada ya que el if no compara ninguna condicion.
iii) Arreglando las comparativas de las condiciones de forma que tenga coherencia y ademas, agregar a la funcion las condiciones logicas para evaluar todas las letras faltantes. }