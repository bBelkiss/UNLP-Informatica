; Los siguientes programas realizan la misma tarea, en uno de ellos se utiliza una instrucción de transferencia de
; control con retorno. Analícelos y compruebe la equivalencia funcional.

; Primer programa

ORG 1000H

NUM1 DB 5H
NUM2 DB 3H 

ORG 2000H
MOV AL, NUM1
CMP AL, 0
JZ FIN 
MOV AH, 0
MOV DX, 0
MOV CL, NUM2
LOOP: CMP CL, 0
    JZ FIN
    ADD DX, AX
    DEC CL
    JMP LOOP
FIN:  hlt
      end


; Segundo programa 

ORG 1000H

NUM1 DB 5H
NUM2 DB 3H

ORG 3000H
SUB1: CMP AL, 0  ; Subrutina SUB1
      JZ FIN
      CMP CL, 0
      JZ FIN
      MOV AH, 0
      MOV DX, 0
LAZO: ADD DX, AX
      DEC CX
      JNZ LAZO
FIN:  RET

ORG 2000H
MOV AL, NUM1
MOV CL, NUM2
CALL SUB1
hlt
end

; 1- ¿Cual es la tarea realizada por ambos programas?
; 2- ¿Dónde queda almacenado el resultado?
; 3- ¿Cual programa realiza la tarea más rápido? ¿El tiempo de ejecución de la tarea depende de los valores
; almacenados en NUM1, en NUM2, en ambos lugares o en ninguno?

; 1. Ambos programas realizan la suma de los números del 0 al 15 en hexadecimal, 
; con incrementos de 5h. Es decir, suman 0 + 5h + 5h + 5h = Fh.
; 2. El resultado de la suma queda almacenado en el registro DX.
; 3. Ambos programas realizan la tarea en un bucle similar, con una cantidad de instrucciones cercana. 
; El tiempo de ejecución de la tarea depende principalmente del valor almacenado en NUM2, ya que este define 
; la cantidad de iteraciones del bucle de suma. No obstante, ambos programas deberían ejecutarse en tiempos 
; comparables, ya que realizan la misma cantidad de operaciones y acceden a la misma cantidad de memoria.

; Explicar detalladamente:
; a- Todas las acciones que tienen lugar al ejecutarse la instrucción CALL SUB1.
; b- ¿Qué operación se realiza con la instrucción RET?, ¿cómo sabe la CPU a qué dirección de memoria debe retornar
desde la subrutina al programa principal?

; a. Al ejecutarse CALL SUB1, la dirección de la siguiente instrucción del programa principal, 
; que se encuentra almacenada en el IP (Instruction Pointer), se guarda en la pila mediante un PUSH automáticamente. 
; Luego, la dirección de la subrutina SUB1 se carga en el IP, lo que permite ejecutar la subrutina.
; Después de la ejecución de la subrutina, la instrucción RET desapila la dirección guardada en la pila mediante 
; un POP en el IP. Esto permite que la ejecución del programa principal continúe desde la siguiente instrucción 
; después del CALL, manteniendo la coherencia del flujo de ejecución del programa.

; b. La instrucción RET lleva a cabo la operación de retorno, que implica desapilar la dirección de retorno del 
; programa principal de la pila y cargarla en el IP. La CPU sabe a qué dirección de memoria debe retornar desde la 
; subrutina al programa principal porque la dirección de retorno se encuentra en la cima de la pila, lista para ser 
; desapilada y cargada en el IP cuando se ejecuta RET.


