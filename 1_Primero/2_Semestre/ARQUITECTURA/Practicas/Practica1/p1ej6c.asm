; Modificar a) para almacenar los carácteres leídos en memoria como un string (sin incluir el “.”)

ORG 1000H
    CANT DB 0
    PUNTO DB 46
ORG 1500H
    CARACTER DB ?
    STRING DB " "
ORG 2000H
    MOV BX, OFFSET STRING ; Guarda la dirección de inicio de STRING en BX
LECTURA:
    PUSH BX ; Guarda la dirección de STRING en la pila
    MOV BX, OFFSET CARACTER ; Dirección de caracter para INT 6
    MOV AL, 1 ; Longitud para INT 6
    INT 6
    POP BX ; Devuelve la dirección de BX (previo al PUSH, entonces la dirección de STRING) entonces BX apunta a STRING
    MOV DL, PUNTO
    CMP CARACTER, DL ; Compara el caracter leído con el punto
    JZ FIN
    MOV AL, CARACTER ; Guarda lo que hay en caracter en AL
    MOV [BX], AL ; Guarda el caracter leído en la dirección apuntada por BX (STRING)
    INC BX ; Incrementa la dirección de STRING para el siguiente caracter
    JMP LECTURA
FIN: INT 0
END
