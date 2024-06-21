; Escribir un programa que, dado un número X, genere un arreglo con todos los resultados que se obtienen hasta llegar
;a 0, aplicando la siguiente fórmula: 

; si X es par, se le resta 7; 
; si es impar, se le suma 5, 
; y al resultado se le aplica nuevamente la misma fórmula. 

; Ej: si X = 3 entonces el arreglo tendrá: 8, 1, 6, -1, 4, -3, 2, -5, 0.

ORG 1000H
X DW 3 
tabla DW 1002H

ORG 3000H

ORG 2000H
MOV CX, 0001H 
MOV AX, X
MOV BX, tabla

INICIO: AND CX, AX 
CMP AX, 0 
JZ FIN
CMP CX, 0001H
JZ IMPAR
SUB AX, 7
JMP AGREGAR_A_TABLA
IMPAR: ADD AX, 5
AGREGAR_A_TABLA: MOV [BX], AX
ADD BX, 2
MOV CX, 0001H
JMP INICIO

FIN: hlt
end