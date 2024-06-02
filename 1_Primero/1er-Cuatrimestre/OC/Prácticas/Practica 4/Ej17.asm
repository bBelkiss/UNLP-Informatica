; 17- El siguiente programa es otra forma de implementación de la tarea del punto anterior (ejercicio 16). Analizar y
; establecer las diferencias con las anteriores, en particular las relacionadas a la forma de ‘proveer’ los operandos a las
; subrutinas.

ORG 1000H

NUM1 DW 5H
NUM2 DW 3H

ORG 3000H
SUB2: MOV DX, 0
LAZO: MOV BX, AX
      ADD DX, [BX]
      PUSH DX
      MOV BX, CX
      MOV DX, [BX]
      DEC DX
      MOV [BX], DX
      POP DX
      JNZ LAZO
      RET

ORG 2000H
MOV AX, OFFSET NUM1
MOV CX, OFFSET NUM2
CALL SUB2
hlt
end


; Explicar detalladamente:
; a- Todas las acciones que tienen lugar al ejecutarse las instrucciones PUSH DX y POP DX.
; b- Cuáles son los dos usos que tiene el registro DX en la subrutina SUB2.

; a. Al ejecutar PUSH DX, el valor actual de DX se guarda en la pila. Luego, al ejecutar POP DX, se recupera el valor almacenado en la pila y se carga de nuevo en el registro DX.
; b. En la subrutina SUB2, el registro DX se emplea de dos maneras:
; - Primero, se utiliza para almacenar temporalmente el resultado de la suma actual. Después de la instrucción ADD, el valor de la suma se guarda en DX, y luego se hace PUSH DX para almacenarlo en la pila temporalmente.
; - Segundo, DX se utiliza para manipular el valor de NUM2. Después del PUSH DX, el valor de NUM2 se copia en DX, se decrementa y se usa para actualizar NUM2. Finalmente, POP DX restaura en DX el valor de la suma que se guardó en la pila.