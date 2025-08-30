; b)  ¿Qué deberías modificar en a) para mostrar solamente los dígitos (“0” al “9”)?

ORG 1000H 
NUM DB 48
IMPRIMIR DB 10

ORG 2000H 
LECTURA:  MOV BX, OFFSET NUM
          MOV AL, 1
          INT 7
          MOV BX, OFFSET IMPRIMIR
          MOV AL, 2
          INT 7
VOLVER: INC NUM
        CMP NUM, 58
        JZ FIN
        JNZ LECTURA
FIN: INT 0

end