; Modificar a) para contar solamente la cantidad de letras “a” que se leen

ORG 1000H
    CANT DB 0
    LETRA DB 97
    PUNTO DB 46
    MSG DB "INGRESE"
    SALTO DB 10

ORG 1500H
    CARACTER DB ?

ORG 2000H
LECTURA: MOV BX, OFFSET MSG
         MOV AL, 7
         INT 7
         MOV BX, OFFSET CARACTER
         MOV AL, 1
         INT 6
         MOV DL, PUNTO
         CMP CARACTER, DL
         JZ FIN
         MOV DL, LETRA
         CMP CARACTER, DL
         JZ INCREMENTAR
         MOV BX, OFFSET SALTO
         MOV AL, 1
         INT 7
         JMP LECTURA

INCREMENTAR: INC CANT
             MOV BX, OFFSET SALTO
             MOV AL, 1
             INT 7
             JMP LECTURA

FIN: INT 0
END