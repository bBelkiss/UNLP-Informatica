; Escribir un programa que genere una tabla a partir de la dirección de memoria almacenada en la celda DIR con los
; múltiplos de 5 desde cero hasta MAX.

ORG 1000H
MAX DB 25
DIR DW 1001H 

ORG 2000H
MOV BX, DIR
MOV AL, 0 
AGREGAR: MOV [BX], AL
ADD AL, 5
INC BX
CMP MAX, AL
JNS AGREGAR

hlt
end