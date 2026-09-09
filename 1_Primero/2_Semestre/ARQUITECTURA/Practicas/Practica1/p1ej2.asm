; El siguiente programa del lenguaje assembler del simulador VonSim muestra en la pantalla de comandos un mensaje 
; previamente almacenado en memoria de datos, aplicando la interrupción por software INT 7. Probar en el simulador. 

ORG 1000H 
    MSJ DB "ARQUITECTURA DE COMPUTADORAS-" 
        DB  "FACULTAD DE INFORMATICA-" 
        DB  55H 
        DB  4EH 
        DB  4CH 
        DB  50H 
    FIN DB  ? 
ORG 2000H 
    MOV BX, OFFSET MSJ 
    MOV AL, OFFSET FIN - OFFSET MSJ 
    INT 7 
    INT 0 
END

; a)  Ejecutar en el simulador ¿qué imprime? 
; b)  ¿Por qué imprime “UNLP” al final? 
; c)  Con referencia a la interrupción INT 7, ¿qué se almacena en los registros BX y AL?
; d)  Modifique el programa para que solo imprima la primera parte del mensaje: “ARQUITECTURA DE COMPUTADORAS-” 
; e)  Modifique el programa para que solo imprima la primera letra, es decir, la “A”

; a - Imprime ARQUITECTURA DE COMPUTADORAS-FACULTAD DE INFORMATICA-UNLP
; b - Porque se encuentra el valor 55H, 4EH, 4CH y 50H que corresponden a los caracteres UNLP en la tabla ASCII.
; c - En el registro BX se almacena la dirección de memoria donde comienza el mensaje, y en AL se almacena la cantidad de bytes que se van a imprimir.
; d - Para imprimir solo la primera parte del mensaje, se debe cambiar la instrucción MOV AL, OFFSET FIN - OFFSET MSJ por MOV AL, 16H, ya que tiene 22 caracteres (16H es 22 en hexadecimal).
; e - Para imprimir solo la primera letra, se debe cambiar la instrucción MOV AL, OFFSET FIN - OFFSET MSJ por MOV AL, 1, ya que solo se quiere imprimir un byte.