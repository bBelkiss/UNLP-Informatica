; Escribir un programa que declare un string llamado MENSAJE, almacenado en la memoria de datos, cuente la cantidad 
; de veces que la letra ‘a’ (minúscula) aparece en MENSAJE y lo almacene en la variable CANT. Por ejemplo, si 
; MENSAJE contiene “Hola, Buenas Tardes”, entonces CANT debe valer 3.

ORG 1000H
MSG DB "hola buenas"
LETRA DB 'a'
CANT DB ?

ORG 2000H
MOV BX, OFFSET MSG
MOV AL, OFFSET LETRA - OFFSET MSG
MOV DL, LETRA
MOV DH, 0
SEGUIR: MOV AH, [BX]
        CMP AH, DL
        JNZ SALTO
        INC DH
SALTO: INC BX
       DEC AL
       JNZ SEGUIR
MOV CANT, DH
HLT
END
