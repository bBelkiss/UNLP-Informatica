; El siguiente programa solicita el ingreso de un número (de un dígito) por teclado, lo almacena en la variable NUM e 
; inmediatamente lo muestra en la pantalla de comandos, haciendo uso de las interrupciones por software INT 6 e INT 7. 
; Probar en el simulador.

ORG 1000H 
    MSJ DB "INGRESE UN NUMERO:" 
    FIN DB ? 
 
ORG 1500H 
    NUM DB ?
ORG 2000H 
    MOV BX, OFFSET MSJ 
    MOV AL, OFFSET FIN-OFFSET MSJ 
    INT 7 
    MOV BX, OFFSET NUM 
    INT 6 
    MOV AL, 1 
    INT 7 
    MOV CL, NUM 
    INT 0 
END 

; a)  Con referencia a la interrupción INT 6, ¿qué se almacena en BX? 
; b)  En el programa anterior, ¿qué hace la segunda interrupción INT 7?  
; c)  ¿Qué valor queda almacenado en el registro CL? ¿Es el mismo que el valor numérico ingresado? 
; d)  Modificar el programa anterior para que lea dos dígitos en lugar de uno, con dos variables: NUM1 y NUM2.


; a - En la interrupción INT 6, se almacena en el registro BX la dirección de memoria donde se encuentra el mensaje "INGRESE UN NUMERO:". Esto permite que la interrupción pueda acceder a ese mensaje y mostrarlo en la pantalla.
; b - La segunda interrupción INT 7 se utiliza para leer un carácter desde el teclado y almacenarlo en la variable NUM. Esta interrupción espera a que el usuario ingrese un dígito y lo guarda en la dirección de memoria especificada por BX.
; c - El valor almacenado en el registro CL es el valor del dígito ingresado por el usuario, que se encuentra en la variable NUM. Sin embargo, este valor no es el mismo que el valor numérico ingresado, ya que CL almacena el código ASCII del dígito ingresado. Para obtener el valor numérico, se debe restar 30H (48 en decimal) al valor almacenado en CL.
; d - 

ORG 1000H 
    MSJ DB "INGRESE UN NUMERO:" 
    FIN DB ? 
 
ORG 1500H 
    NUM1 DB ?
    NUM2 DB ?
ORG 2000H 
    MOV BX, OFFSET MSJ 
    MOV AL, OFFSET FIN-OFFSET MSJ 
    INT 7 
    MOV BX, OFFSET NUM1
    INT 6 
    MOV AL, 1
    INT 7
    MOV BX, OFFSET NUM2
    INT 6 
    INT 7
    INT 0 
END 