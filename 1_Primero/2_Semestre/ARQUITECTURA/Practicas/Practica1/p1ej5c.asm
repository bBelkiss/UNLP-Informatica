; c)  ¿Y para mostrar todos los carácteres disponibles en el código ASCII? Probar en el simulador

ORG 1000H 
NUM DW 32 
IMPRIMIR DB 10

ORG 2000H 
LECTURA:  MOV BX, OFFSET NUM
          MOV AL, 1
          INT 7
          MOV BX, OFFSET IMPRIMIR
          INT 7
VOLVER: INC NUM
        CMP NUM, 256 ; 256 es el valor máximo para un byte sin signo
        JZ FIN
        JNZ LECTURA
FIN: INT 0

end