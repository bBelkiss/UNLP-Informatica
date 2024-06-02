; Escribir un programa que sume dos números representados en Ca2 de 32 bits almacenados en memoria de datos y
; etiquetados NUM1 y NUM2 y guarde el resultado en RESUL (en este caso cada dato y el resultado ocuparán 4 celdas
; consecutivas de memoria). Verifique el resultado final y almacene 0FFH en la celda BIEN en caso de ser correcto o
; en otra MAL en caso de no serlo. Recordar que el MSX88 trabaja con números en Ca2 pero tener en cuenta que las
; operaciones con los 16 bits menos significativos de cada número deben realizarse en BSS.

ORG 1000H
NUM1 DW 0FFFFH, 01FF1H 
NUM2 DW 01001H, 05678H

BIEN DB ?
MAL DB 11H
RESUL DW 0000H, 0000H

ORG 2000H

MOV BX, OFFSET NUM1 + 2
MOV AX, [BX] 
MOV BX, OFFSET NUM2 + 2
ADD AX, [BX]

MOV BX, OFFSET RESUL + 2
MOV [BX], AX

MOV CX, NUM1
ADC CX, NUM2

MOV BX, OFFSET RESUL
MOV [BX], CX

JO M
JC M
MOV BIEN, 0FFH
JMP FIN
M: MOV MAL, 0FFH

FIN: hlt
     end