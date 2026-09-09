; a)  Escribir un programa que lea carácteres hasta que se ingrese el carácter “.” (punto). Contar la cantidad de 
; carácteres ingresados y guardarla en la variable CANT. 

ORG 1000H
    CANT DB 0
    PUNTO DB 46 ; Punto en valor ASCII
    MSG DB "INGRESE"
    SALTO DB 10 ; Para que quede mas lindo

ORG 1500H
    CARACTER DB ?

ORG 2000H
LECTURA:    MOV DL, PUNTO
    MOV BX, OFFSET MSG
    MOV AL, 7
    INT 7
    MOV BX, OFFSET CARACTER
    MOV AL, 1
    INT 6
    CMP CARACTER, DL ; Compara si es el punto
    JZ FIN
    MOV BX, OFFSET SALTO
    INT 7
    JNZ LECTURA
FIN: INT 0
END
