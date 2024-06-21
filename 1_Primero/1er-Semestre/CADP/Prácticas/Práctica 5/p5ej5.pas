{5) De acuerdo a los valores de la tabla que indica la cantidad de bytes que ocupa la representación
interna de cada tipo de dato en Pascal, calcular el tamaño de memoria en los puntos señalados a partir
de(I), suponiendo que las variables del programa ya están declaradas y se cuenta con 400.000 bytes
libres. Justificar mediante prueba de escritorio.}

program Alojacion_Dinamica;
type
    TEmpleado = record // 72 BYTES
        sucursal: char; //1 byte
        apellido: string[25]; //26 byteS
        correoElectronico: string[40]; //41 byteS
        sueldo: real; //4 byteS
    end;
    Str50 = string[50]; //51 bytes
var
    alguien: TEmpleado; //72 bytes en stack
    PtrEmpleado: ^TEmpleado; // 4 bytes en stack
begin
    {Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible (I) 400.000-4-72= 399924}
    readln( alguien.apellido );
    {Pensar si la lectura anterior ha hecho variar la cantidad de memoria (II)}
    New( PtrEmpleado ); //la estructura anterior no me hace varias la cantidad de memoria
    {¿Cuánta memoria disponible hay ahora? (III) 399924-72 = 399852 de lo que reservo}
    readln( PtrEmpleado^.Sucursal, PtrEmpleado^.apellido );
    readln( PtrEmpleado^.correoElectronico, PtrEmpleado^.sueldo );
    {¿Cuánta memoria disponible hay ahora? (IV) 399852}
    dispose( PtrEmpleado );
    {¿Cuánta memoria disponible hay ahora? (V) me libero el espacio en memoria, por lo tanto tengo nuevamente los 399924}
end.