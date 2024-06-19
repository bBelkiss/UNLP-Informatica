; Escriba una subrutina que reciba la mantisa entera en BSS y el exponente en BSS de un número en los registros
; AH y AL respectivamente y devuelva, en ellos, una representación equivalente del mismo pero con el exponente
; disminuido en 1 y la mantisa ajustada. De no ser posible el ajuste, BL debe contener 0FFH en vez de 00H en el
; retorno. 

ORG 1000H
MANTISA DB 11000010B
EXPONENTE DB 3

ORG 3000H
AJUSTAR: DEC AL
         ADD AH, AH
         JC NO-AJUSTA
         MOV BL, 00H
         JPM FIN
NO AJUSTA: MOV BL, 0FFHH
FIN: RET 

ORG 2000H
MOV AH, MANTISA
MOV AL, EXPONENTE
CALL AJUSTAR

hlt
end