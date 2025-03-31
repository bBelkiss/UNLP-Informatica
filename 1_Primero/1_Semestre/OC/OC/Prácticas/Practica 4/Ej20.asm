; Escriba una subrutina que reciba como parámetro un número en el formato IEEE 754 de simple precisión y
; analice/verifique las características del mismo devolviendo en el registro CL un valor igual a 0 si el número está
; sin normalizar, 1 en caso de ser +/- infinito, 2 si es un NAN, 3 si es un +/- cero y 4 si es un número normalizado.
; La subrutina recibe en AX la parte alta del número y en BX la parte baja.

ORG 1000h
UNOR DW 0 ; El numero 1.0
SN11 DW 03F8h ; 0 01111111 00000000000000000000000
SN11 DW 0FFEh ; El mas grande sin normalizar
SN11a DW 7F8h ; 0, 00000000 11111111111111111111111
SN21 DW 1 ; El mas chico sin normalizar
SN21a DW 1 ; El mas chico sin normalizar
NAN1h DW 7F8h ; 0 11111111 00000000000000000000000
NAN1l DW 0 ; NaN1
NAN11 DW 7F8h ; 0 11111111 10000000000000000000000
NAN21 DW 7F8h ; 0 11111111 01000000000000000000000
ZERO1 DW 0 ; +0
INF1 DW 7F80h ; + infinito
INFB DW 7F80h ; 0 11111111 00000000000000000000000
DATOS DB ? ; empieza a partir de la dirección de memoria 10C1h
RESuno DB ? ; finaliza en 4
RESdos DB ? ; finaliza en 3
RESuno1 DB ? ; finaliza en 2
RESuno2 DB ? ; finaliza en 2
RESzero DB ? ; finaliza en 3
RESzero1 DB ? ; finaliza en 2
RESinf DB ? ; finaliza en 1

ORG 3000h
TIPO-IEEE: MOV DX, AX
AND AX, 7F80h ; 01111111 10000000
JZ E-CERO ; si Z = 1, el exponente es cero
XOR DX, 7F80h
JNZ E-UNOS ; si Z = 1, el exponente es todos unos
MOV CL, 4 ; si el exponente no es ni 0 y 255 es un numero normalizado
RET
E-CERO: MOV DX, AX
AND AX, 7Fh ; 00000000 01111111
JNZ SIN-NOR ; si la mantisa no es cero, es un numero denormalizado
JMP ZERO ; si la mantisa es cero, el exponente tambien es +/- 0
SIN-NOR: MOV CL, 3 ; la mantisa no es cero, es un numero denormalizado
RET
ZERO: MOV CL, 4 ; la mantisa es cero, y el exponente también, es +/- 0
RET
E-UNOS: MOV DX, AX
AND AX, 7Fh
JNZ NAN ; si la mantisa no es cero, es un NaN
MOV CL, 1 ; si la mantisa es cero, es +/- Inf
RET
NAN: MOV CL, 2 ; si el exponente es 255 y la mantisa es cero, es +/- Inf
RET
SIN-NOR: MOV CL, 0
RET

ORG 2000h
MOV BX, UNOR
MOV AX, UNOR
CALL TIPO-IEEE
MOV RESuno, CL
MOV BX, SN11
MOV AX, SN11a
CALL TIPO-IEEE
MOV RESsn1, CL
MOV BX, SN21
MOV AX, SN21
CALL TIPO-IEEE
MOV RESsn2, CL
MOV BX, NAN1
MOV AX, NAN1h
CALL TIPO-IEEE
MOV RESnan1, CL
MOV BX, NAN21
MOV AX, NAN21
CALL TIPO-IEEE
MOV RESnan2, CL
MOV BX, ZERO1
MOV AX, ZERO1
CALL TIPO-IEEE
MOV RESzero, CL
MOV BX, INF1
MOV AX, INF1
CALL TIPO-IEEE
MOV RESinf, CL

hlt
end