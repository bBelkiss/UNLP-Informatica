{. Dado el siguiente programa, resolver. }

program p2ej7;
var
    suma, cant : integer;
function calcularPromedio : real
var
    prom : real;
begin
if (cant = 0) then
    prom := -1
else
    prom := suma / cant;
end;
begin programa principal 
    readln(suma);
    readln(cant);
if (calcularPromedio <> -1) then begin
    cant := 0;
    writeln(‘El promedio es: ’ , calcularPromedio)
end;
else
    writeln(‘Dividir por cero no parece ser una buena idea’);
end.

{ a) La función calcularPromedio calcula y retorna el promedio entre las variables globales suma y cant, pero
parece incompleta. ¿qué debería agregarle para que funcione correctamente?
b) En el programa principal, la función calcularPromedio es invocada dos veces, pero esto podría mejorarse.
¿cómo debería modificarse el programa principal para invocar a dicha función una única vez?
c) Si se leen por teclado los valores 48 (variable suma) y 6 (variable cant), ¿qué resultado imprime el
programa? Considere las tres posibilidades:
    i) El programa original
    ii) El programa luego de realizar la modificación del inciso a)
    iii) El programa luego de realizar las modificaciones de los incisos a) y b) 

a) Para que funcione correctamente hay que pasarle valores o asignarle a las variables de suma y cant para que pueda hacer la operacion internamente. Hay que asignar a "calcularPromedio" el valor final del promedio al finalizar la funcion, hasta ahora el promedio se calcula dentro de una variable local de la funcion.

b) Asignando el valor de la funcion a una variable del programa principal y usando tal para comparar e imprimir valores.

c) El resultado del promedio sera 48/6= 8 y es el numero que sale al implementar los cambios a la funcion y probarla. }

program p2ej7;
var
    suma, cant: integer;
    promedio: real;
function calcularPromedio: real;
begin
    readln(suma);
    readln(cant);
    if (cant = 0) then
        calcularPromedio:= -1
else
    calcularPromedio:= suma / cant;
end;
begin
    promedio:= calcularPromedio;
    if (promedio <> -1) then begin
        cant := 0;
        writeln('El promedio es: ' , promedio)
    end
else
	writeln('Dividir por cero no parece ser una buena idea');
end.