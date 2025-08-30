; a)  Escribir un programa que muestre en pantalla las letras mayúsculas (“A” a la “Z”).  
; Pista:  Podés buscar los códigos de la “A” y la “Z” en una tabla de códigos ascii. No utilizar un vector. Usar 
; una sola variable de tipo db, e incrementar el valor de esa variable antes de mostrar en pantalla. 

ORG 1000H 
NUM DB 65
IMPRIMIR DB 10

ORG 2000H 
LECTURA:  MOV BX, OFFSET NUM
          MOV AL, 1
          INT 7
          MOV BX, OFFSET IMPRIMIR
          MOV AL, 2
          INT 7
VOLVER: INC NUM
        CMP NUM, 91
        JZ FIN
        JNZ LECTURA
FIN: INT 0

end