; )  Modificar el ejercicio b) que muestra los dígitos, para que cada dígito se muestre en una línea separada.  
; Pista: El código ASCII del carácter de nueva línea es el 10, comúnmente llamado “\n” o LF (“line feed” por 
; sus siglas en inglés y porque se usaba en impresoras donde había que “alimentar” una nueva línea).


ORG 1000H 
NUM DB 48 ; Modificar valores ASCII para que sean del 0 al 9 
IMPRIMIR DB 10 ; Salto de linea en ASCII

ORG 2000H 
LECTURA:  MOV BX, OFFSET NUM
          MOV AL, 1
          INT 7
          MOV BX, OFFSET IMPRIMIR
          INT 7
VOLVER: INC NUM
        CMP NUM, 58 
        JZ FIN
        JNZ LECTURA
FIN: INT 0

end