; Modificar c) para mostrar en pantalla el string leído luego de leerlo. 

ORG 1000H
    CANT DB 0
    PUNTO DB 46
ORG 1500H
    CARACTER DB ?
    STRING DB " "
ORG 2000H
    MOV BX, OFFSET STRING
LECTURA:
    PUSH BX
    MOV BX, OFFSET CARACTER
    MOV AL, 1
    INT 6
    POP BX
    MOV DL, PUNTO
    CMP CARACTER, DL
    JZ FIN
    MOV AL, CARACTER
    MOV [BX], AL
    INC BX
    INC CANT ; Contador para saber hasta donde imprimir en el INT 7
    JMP LECTURA
FIN:
    MOV BX, OFFSET STRING
    MOV AL, CANT ; Aca
    INT 7
    INT 0
END