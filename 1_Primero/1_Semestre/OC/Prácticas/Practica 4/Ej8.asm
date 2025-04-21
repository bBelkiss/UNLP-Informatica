;El siguiente programa suma todos los elementos de una tabla almacenada a partir de la dirección 1000H de la memoria
; del simulador. Analice el funcionamiento y determine el resultado de la suma. Comprobar resultado en el MSX88

ORG 1000H
TABLA DB 2,4,6,8,10,12,14,16,18,20
FIN DB ?
TOTAL DB ?
MAX DB 13

ORG 2000H
MOV AL, 0
MOV CL, OFFSET FIN - OFFSET TABLA
MOV BX, OFFSET TABLA
SUMA: ADD AL, [BX]
INC BX; incrementar índice de la tabla (para leer)
DEC CL; decrementar tamaño de la lista
JNZ SUMA; suma los elementos de la lista en AL hasta que CL sea 0 (osea, la lista se haya leido por completa)
MOV TOTAL, AL; mover resultado de la suma a la dirección con la etiqueta TOTAL (100Bh)
HLT
END