{ El siguiente programa intenta resolver un enunciado. Sin embargo, el código posee 5 errores. Indicar en
qué línea se encuentra cada error y en qué consiste el error.
Enunciado: Realice un programa que lea datos de 130 programadores Java de una empresa. De cada
programador se lee el número de legajo y el salario actual. El programa debe imprimir el total del dinero
destinado por mes al pago de salarios, y el salario del empleado mayor legajo. }

program programadores;
// Error 1 corregido: Se agregó 'var' a salario para que los cambios persistan
procedure leerDatos(var legajo: integer; var salario: real);
begin
  // Error 2 corregido: Comillas consistentes en el string
  writeln('Ingrese el nro de legajo y el salario');
  read(legajo);
  read(salario);
end;
// Error 5 corregido: Se agregó maxSalario como parámetro por referencia
procedure actualizarMaximo(nuevoLegajo: integer; nuevoSalario: real; var maxLegajo: integer; var maxSalario: real);
begin
  if (nuevoLegajo > maxLegajo) then begin
    maxLegajo := nuevoLegajo;
    maxSalario := nuevoSalario;
  end;
end;
var
  legajo, maxLegajo, i: integer;
  salario, maxSalario, sumaSalarios: real; // Error 3 corregido: Se declaró sumaSalarios
begin
  sumaSalarios := 0;
  maxLegajo := -1; // Inicialización para comparación
  for i := 1 to 130 do begin
    // Error 4 corregido: Parámetros en orden correcto (legajo, salario)
    leerDatos(legajo, salario);
    actualizarMaximo(legajo, salario, maxLegajo, maxSalario);
    sumaSalarios := sumaSalarios + salario;
  end;
  // Formateo de salida con 2 decimales para valores monetarios
  writeln('En todo el mes se gastan ', sumaSalarios:0:2, ' pesos');
  writeln('El salario del empleado mas nuevo es ', maxSalario:0:2);
end.